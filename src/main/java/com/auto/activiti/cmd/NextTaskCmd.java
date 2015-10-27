package com.auto.activiti.cmd;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmActivity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 获取下个任务集合
 * Created by wizzer on 2015/5/18.
 */
public class NextTaskCmd implements Command<NutMap> {
    private final Log log = Logs.get();
    private RepositoryService repositoryService = Mvcs.ctx().getDefaultIoc().get(RepositoryService.class);
    String taskId;

    public NextTaskCmd(String taskId) {
        this.taskId = taskId;
    }

    public NutMap execute(CommandContext commandContext) {
        NutMap map = new NutMap();
        TaskEntity taskEntity = Context.getCommandContext()
                .getTaskEntityManager().findTaskById(taskId);
        if (taskEntity == null) {
            log.debug("cannot find task : " + taskId);
            map.setv("errcode", 1);
            map.setv("errmsg", "cannot find task : " + taskId);
            return map;
        }
        ProcessDefinitionEntity def = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService).getDeployedProcessDefinition(taskEntity.getProcessDefinitionId());
        List<ActivityImpl> activitiList = def.getActivities();
        int type = 0;
        map.setv("errcode", 0);
        map.setv("errmsg", "");
        getTaskActivitys(taskEntity.getTaskDefinitionKey(), activitiList, type, map);
        return map;
    }

    public static List<PvmActivity> getTaskActivitys(String activityId, List<ActivityImpl> activityList, int type, NutMap map) {
        if(activityId.startsWith("join")){
            //如果是前加签、后加签，替换ActivityId
            Pattern p = Pattern.compile("join:\\d+:([a-zA-Z_]+):\\d+\\-\\d+");
            Matcher m = p.matcher(activityId);
            if (m.find()) {
                activityId=m.group(1);
            }
        }
        List<PvmActivity> activitiyIds = new ArrayList<>();
        for (ActivityImpl activityImpl : activityList) {
            String id = activityImpl.getId();

            if (activityId.equals(id)) {
                List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();//获取某节点所有线路
                List<NutMap> list = new ArrayList<>();
                for (PvmTransition tr : outgoingTransitions) {
                    NutMap map1 = new NutMap();
                    PvmActivity ac = tr.getDestination();//获取线路的终点节点
                    if (ac.getProperty("type").equals("userTask")) {
                        map.setv("type", type++);
                        map1.setv("id", ac.getId());
                        map1.setv("name", ac.getProperty("name"));
                        String conditionText = Strings.sNull(tr.getProperty("conditionText"));
                        if (!Strings.isEmpty(conditionText)) {
                            map1.setv("conditionText", conditionText);
                        }
                        list.add(map1);
                    } else if (ac.getProperty("type").equals("exclusiveGateway")) {
                        getTaskActivitys(ac.getId(), activityList, type, map);
                    } else {
                        map.setv("type", type++);
                        break;
                    }
                }
                if (list.size() > 0)
                    map.addv("list", list);
                break;
            }
        }
        return activitiyIds;
    }
}
