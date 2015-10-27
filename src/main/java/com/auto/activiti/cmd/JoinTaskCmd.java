package com.auto.activiti.cmd;

import com.auto.activiti.util.CloneUtils;
import com.auto.common.action.BaseAction;
import com.auto.common.config.Globals;
import com.auto.modules.wf.bean.Wf_hi_activity;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.el.FixedValue;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmActivity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.pvm.runtime.AtomicOperation;
import org.activiti.engine.impl.task.TaskDefinition;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.sql.Sql;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Files;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 2015/5/21.
 */
public class JoinTaskCmd extends BaseAction implements Command<NutMap> {
    private Dao dao = Mvcs.ctx().getDefaultIoc().get(Dao.class);
    private final Log log = Logs.get();
    private String taskId;
    private String nowActivityId;
    private String nextActivityId;
    private String[] users;
    private TaskEntity taskEntity;
    private static int SEQUNCE_NUMBER = 0;
    private boolean isAfter;
    private PvmActivity pvmActivity;

    public JoinTaskCmd(boolean isAfter, String taskId, String[] users) {
        this.isAfter = isAfter;
        this.taskId = taskId;
        this.users = users;
    }

    public NutMap execute(CommandContext commandContext) {
        NutMap nutMap = new NutMap();
        taskEntity = Context.getCommandContext()
                .getTaskEntityManager().findTaskById(taskId);
        nowActivityId = taskEntity.getTaskDefinitionKey();
        nextActivityId = nowActivityId;
        ProcessDefinitionEntity def = Context.getCommandContext().getProcessEngineConfiguration()
                .getDeploymentManager()
                .findDeployedProcessDefinitionById(taskEntity.getProcessDefinitionId());
        if (isAfter) {
            pvmActivity = getNextActivityId(nowActivityId, def.getActivities());
            nextActivityId = pvmActivity.getId();
            if (nextActivityId == null || Strings.sNull(pvmActivity.getProperty("type")).equals("endEvent")
                    || Strings.sNull(pvmActivity.getProperty("type")).endsWith("Gateway")) {
                //返回错误信息
                nutMap.setv("errcode", 1);
                nutMap.setv("errmsg", "下一节点不是用户任务，不允许后插");
                return nutMap;
            }
        }
        //获得当前活动
        ActivityImpl prototypeActivity = getActivityExt(def, nowActivityId);
        //活动下个节点活动
        ActivityImpl nextActivity = getActivityExt(def, nextActivityId);
        List<ActivityImpl> activities = new ArrayList<>();
        List<NutMap> list = new ArrayList<>();
        for (String user : users) {
            NutMap info = new NutMap();
            //生成新活动名
            String activityId = createUniqueActivityId(taskEntity.getProcessInstanceId(), nowActivityId);
            //生成克隆活动
            ActivityImpl clone;
            if (isAfter) {
                clone = createActivity(def, nextActivity,
                        activityId, user);
            } else {
                clone = createActivity(def, prototypeActivity,
                        activityId, user);
            }
            activities.add(clone);
            info.setv("num", SEQUNCE_NUMBER);
            info.setv("activityId", activityId);
            info.setv("user", user);
            info.setv("name",taskEntity.getName());
            list.add(info);
        }
        //创建连接线
        createActivityChain(activities, nextActivity);
        //创建execution并启动
        ExecutionEntity execution = Context.getCommandContext().getExecutionEntityManager().findExecutionById(taskEntity.getExecutionId());
        execution.setActivity(getActivityExt(def, activities.get(0).getId()));

        execution.performOperation(AtomicOperation.ACTIVITY_START);
        this.deleteActiveTask();
        //数据持久化
        JsonFormat format=new JsonFormat();
        format.setCompact(true);
        format.setIgnoreNull(false);
        Wf_hi_activity hiActivity = new Wf_hi_activity();
        hiActivity.setProcessInstanceId(taskEntity.getProcessInstanceId());
        hiActivity.setProcessDefinitionId(taskEntity.getProcessDefinitionId());
        hiActivity.setExecutionId(taskEntity.getExecutionId());
        hiActivity.setNowActivityId(nowActivityId);
        hiActivity.setNextActivityId(nextActivityId);
        hiActivity.setJsonInfo(Json.toJson(new NutMap().addv("list",list),format));
        hiActivity.setIsAfter(isAfter);
        dao.insert(hiActivity);

        return nutMap;
    }

    public PvmActivity getNextActivityId(String activityId, List<ActivityImpl> activitiList) {
        for (ActivityImpl activityImpl : activitiList) {
            if (activityId.equals(activityImpl.getId())) {
                List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();
                return outgoingTransitions.get(0).getDestination();
            }
        }
        return null;
    }

    /**
     * 删除未完成任务.
     */
    public void deleteActiveTask() {
        Context.getCommandContext().getTaskEntityManager()
                .deleteTask(taskEntity, isAfter ? "后加签" : "前加签", false);
        Sql sql1 = Sqls.create("select * from ACT_HI_ACTINST where task_id_=@taskId and end_time_ is null");
        sql1.params().set("taskId", taskId);
        List<Record> list = daoCtl.list(dao, sql1);
        Date now = new Date();
        Sql sql2 = Sqls.create("update ACT_HI_ACTINST set end_time_=@a,duration_=@b where id_=@c");
        for (Record map : list) {
            Date startTime = (Date) map.get("start_time_");
            long duration = now.getTime() - startTime.getTime();
            sql2.params().set("a", now);
            sql2.params().set("b", duration);
            sql2.params().set("c", map.get("id_"));
            sql2.addBatch();
        }
        if(list.size()>0) {
            daoCtl.exeUpdateBySql(dao, sql2);
        }
    }

    protected ActivityImpl createActivity(ProcessDefinitionEntity processDefinition,
                                          ActivityImpl prototypeActivity, String cloneActivityId, String assignee) {
        ActivityImpl clone = cloneActivity(processDefinition, prototypeActivity, cloneActivityId, "executionListeners",
                "properties");
        //设置assignee
        UserTaskActivityBehavior activityBehavior = (UserTaskActivityBehavior) (prototypeActivity.getActivityBehavior());

        TaskDefinition taskDefinition = cloneTaskDefinition(activityBehavior.getTaskDefinition());
        taskDefinition.setKey(cloneActivityId);

        if (assignee != null) {
            taskDefinition.setAssigneeExpression(new FixedValue(assignee));
        }
        if (isAfter) {
            taskDefinition.setNameExpression(new FixedValue(taskEntity.getName()+ "-后加签"));
        } else {
            taskDefinition.setNameExpression(new FixedValue(taskEntity.getName() + "-前加签"));
        }
        UserTaskActivityBehavior cloneActivityBehavior = Context.getCommandContext().getProcessEngineConfiguration().getActivityBehaviorFactory().createUserTaskActivityBehavior(null,
                taskDefinition);
        clone.setActivityBehavior(cloneActivityBehavior);

        return clone;
    }

    protected TaskDefinition cloneTaskDefinition(TaskDefinition taskDefinition) {
        TaskDefinition newTaskDefinition = new TaskDefinition(taskDefinition.getTaskFormHandler());
        BeanUtils.copyProperties(taskDefinition, newTaskDefinition);
        return newTaskDefinition;
    }

    protected ActivityImpl cloneActivity(ProcessDefinitionEntity processDefinition, ActivityImpl prototypeActivity,
                                         String newActivityId, String... fieldNames) {
        ActivityImpl clone = processDefinition.createActivity(newActivityId);
        CloneUtils.copyFields(prototypeActivity, clone, fieldNames);

        return clone;
    }

    public ActivityImpl getActivityExt(ProcessDefinitionEntity processDefinitionEntity, String id) {
        return processDefinitionEntity
                .findActivity(id);
    }

    protected void createActivityChain(List<ActivityImpl> activities, ActivityImpl nextActivity) {
        for (int i = 0; i < activities.size(); i++) {
            //设置各活动的下线
            activities.get(i).getOutgoingTransitions().clear();
            activities.get(i).createOutgoingTransition("flow" + (i + 1))
                    .setDestination(i == activities.size() - 1 ? nextActivity : activities.get(i + 1));
        }
    }

    protected String createUniqueActivityId(String processInstanceId, String prototypeActivityId) {
        return "join:" + processInstanceId + ":" + prototypeActivityId + ":" + System.currentTimeMillis() + "-"
                + (SEQUNCE_NUMBER++);
    }
}
