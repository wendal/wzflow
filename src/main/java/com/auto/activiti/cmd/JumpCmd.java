package com.auto.activiti.cmd;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.pvm.process.ProcessDefinitionImpl;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import java.util.Date;
import java.util.List;

/**
 * Created by wizzer on 2015/5/11.
 */
public class JumpCmd implements Command<NutMap> {
    private String activityId;
    private String taskId;
    private String jumpOrigin;
    private Dao dao = Mvcs.ctx().getDefaultIoc().get(Dao.class);
    private final Log log = Logs.get();

    public JumpCmd(String taskId, String activityId) {
        this(taskId, activityId, "jump");
    }

    public JumpCmd(String taskId, String activityId, String jumpOrigin) {
        this.activityId = activityId;
        this.taskId = taskId;
        this.jumpOrigin = jumpOrigin;
    }

    public NutMap execute(CommandContext commandContext) {
        NutMap nutMap = new NutMap();
        try {
            TaskEntity task = commandContext.getTaskEntityManager()
                    .findTaskById(taskId);

            String executionId = task.getExecutionId();
            for (TaskEntity taskEntity : commandContext.getTaskEntityManager()
                    .findTasksByExecutionId(executionId)) {
                taskEntity.setVariableLocal("跳转原因", jumpOrigin);
                Date now = new Date();
                Sql sql = Sqls.create("update ACT_HI_ACTINST set end_time_=@a,duration_=@b where task_id_=@c");
                long duration = now.getTime() - taskEntity.getCreateTime().getTime();
                sql.params().set("a", now);
                sql.params().set("b", duration);
                sql.params().set("c", taskEntity.getId());
                sql.addBatch();
                dao.execute(sql);
                commandContext.getTaskEntityManager().deleteTask(taskEntity,
                        jumpOrigin, false);

            }
            ExecutionEntity executionEntity = commandContext
                    .getExecutionEntityManager().findExecutionById(executionId);
            ProcessDefinitionImpl processDefinition = executionEntity
                    .getProcessDefinition();
            ActivityImpl activity = processDefinition.findActivity(activityId);
            executionEntity.executeActivity(activity);
            nutMap.setv("executionId", executionId);
        } catch (Exception e) {
            log.error("JumpCmd", e);
            nutMap.setv("errcode", 1);
            nutMap.setv("errmsg", e.getMessage());
            return nutMap;
        }
        nutMap.setv("errcode", 0);
        nutMap.setv("errmsg", "");
        return nutMap;
    }
}
