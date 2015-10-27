package com.auto.activiti.cmd;

import com.auto.activiti.graph.ActivitiHistoryGraphBuilder;
import com.auto.activiti.graph.Edge;
import com.auto.activiti.graph.Graph;
import com.auto.activiti.graph.Node;
import com.auto.common.action.BaseAction;
import org.activiti.engine.impl.*;
import org.activiti.engine.impl.cmd.GetDeploymentProcessDefinitionCmd;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.*;
import org.activiti.engine.impl.pvm.PvmActivity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.sql.Sql;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import java.util.*;

/**
 * 退回任务
 * Created by wizzer on 2015/5/8.
 */
public class RollbackTaskCmd extends BaseAction implements Command<NutMap> {
    private Dao dao = Mvcs.ctx().getDefaultIoc().get(Dao.class);

    private final Log log = Logs.get();
    private String taskId;
    private String activityId;
    private String[] users;
    private TaskEntity taskEntity;
    private boolean isParallel = false;
    private boolean isParallelNow = false;
    private String historyTaskId;
    private String firstUserTask;
    private String parallelGatewayInId;
    private String parallelGatewayOutId;
    private List<String> parallelGatewayTasks = new ArrayList<>();
    private List<String> parallelGatewayTasksNow = new ArrayList<>();
    private Sql sql = Sqls.create("update act_hi_actinst set END_TIME_=START_TIME_,DURATION_=0 where EXECUTION_ID_=@a and act_id_=@b and END_TIME_ is null");

    /**
     * 这个taskId是运行阶段task的id.
     */
    public RollbackTaskCmd(String taskId) {
        this(taskId, null, null);
    }

    public RollbackTaskCmd(String taskId, String activityId) {
        this(taskId, activityId, null);
    }

    public RollbackTaskCmd(String taskId, String activityId, String[] users) {
        this.taskId = taskId;
        this.activityId = activityId;
        this.users = users;
    }

    /**
     * 退回流程.
     *
     * @return 0-退回成功 1-流程结束 2-下一结点已经通过,不能退回
     */
    public NutMap execute(CommandContext commandContext) {
        NutMap nutMap = new NutMap();
        // 尝试查找最近的上游userTask
        taskEntity = Context.getCommandContext()
                .getTaskEntityManager().findTaskById(taskId);
        ProcessDefinitionEntity def = Context.getCommandContext().getProcessEngineConfiguration()
                .getDeploymentManager()
                .findDeployedProcessDefinitionById(taskEntity.getProcessDefinitionId());
        List<ActivityImpl> activitiList = def.getActivities();
        isParallelNow = isParallelGatewayTaskNow(taskEntity.getTaskDefinitionKey(), activitiList);
        if (activityId != null) {
            isParallel = isParallelGatewayTask(activityId, activitiList);
//            HistoricTaskInstanceQueryImpl historicTaskInstanceQuery=new HistoricTaskInstanceQueryImpl();
//            historicTaskInstanceQuery.taskDefinitionKey(activityId);
//            historicTaskInstanceQuery.processInstanceId(taskEntity.getProcessInstanceId());
//            historicTaskInstanceQuery.orderByHistoricTaskInstanceEndTime().desc();
//            List<HistoricTaskInstance> list=Context.getCommandContext().getHistoricTaskInstanceEntityManager().findHistoricTaskInstancesByQueryCriteria(historicTaskInstanceQuery);
//            if(list.size()>0){
//                historyTaskId=list.get(0).getId();
//            }
            Sql sql2;
            if ("MYSQL".equals(dao.meta().getType().name())) {
                sql2 = Sqls.create("SELECT id_ FROM act_hi_taskinst WHERE TASK_DEF_KEY_=@a AND PROC_INST_ID_=@b AND END_TIME_ IS NOT NULL ORDER BY END_TIME_ DESC LIMIT 0,1");
            } else if("ORACLE".equals(dao.meta().getType().name())) {
                sql2 = Sqls.create("SELECT id_ from(SELECT id_ FROM act_hi_taskinst WHERE TASK_DEF_KEY_=@a AND PROC_INST_ID_=@b AND END_TIME_ IS NOT NULL ORDER BY END_TIME_ DESC)where rownum=1");
            }else {
                sql2 = Sqls.create("SELECT top 1 id_ FROM act_hi_taskinst WHERE TASK_DEF_KEY_=@a AND PROC_INST_ID_=@b AND END_TIME_ IS NOT NULL ORDER BY END_TIME_ DESC ");
            }
            sql2.params().set("a", activityId);
            sql2.params().set("b", taskEntity.getProcessInstanceId());
            historyTaskId = daoCtl.getStrRowValue(dao, sql2);

        } else {
            Map map = this.findNearestUserTask();
            historyTaskId = Strings.sNull(map.get("task_id_"));
            //如果上一节点是并发分支节点，则使用activityId进行回退
            isParallel = isParallelGatewayTask(Strings.sNull(map.get("act_id_")), activitiList);
            if (isParallel) {
                activityId = Strings.sNull(map.get("act_id_"));
            }
        }
        if (Strings.isEmpty(historyTaskId)) {
            log.info("cannot rollback " + taskId);
            nutMap.setv("errcode", 2);
            nutMap.setv("errmsg", "cannot rollback " + taskId);
            return nutMap;
        }

        // 先找到历史任务
        HistoricTaskInstanceEntity historicTaskInstanceEntity = Context
                .getCommandContext().getHistoricTaskInstanceEntityManager()
                .findHistoricTaskInstanceById(historyTaskId);

        // 再反向查找历史任务对应的历史节点
        HistoricActivityInstanceEntity historicActivityInstanceEntity = getHistoricActivityInstanceEntity(historyTaskId);

        log.info("historic activity instance is : " +
                historicActivityInstanceEntity.getId());

        Graph graph = new ActivitiHistoryGraphBuilder(
                historicTaskInstanceEntity.getProcessInstanceId()).build();

        Node node = graph.findById(historicActivityInstanceEntity.getId());

        if (!checkCouldRollback(node)) {
            nutMap.setv("errcode", 2);
            nutMap.setv("errmsg", "cannot rollback " + taskId);
            return nutMap;
        }

        if (this.isSameBranch(historicTaskInstanceEntity)) {
            // 如果退回的目标节点的executionId与当前task的executionId一样，说明是同一个分支
            // 只删除当前分支的task
            this.deleteActiveTask();
        } else {
            // 否则认为是从分支跳回主干
            // 删除所有活动中的task
            this.deleteActiveTasks(historicTaskInstanceEntity
                    .getProcessInstanceId());

            // 获得期望退回的节点后面的所有节点历史
            List<String> historyNodeIds = new ArrayList<String>();
            collectNodes(node, historyNodeIds);
            this.deleteHistoryActivities(historyNodeIds);
            if(isParallelNow){
                Sql sql1 = Sqls.create("delete from act_ru_execution where PROC_INST_ID_=@a and PARENT_ID_=@b and ACT_ID_=@c");
                for(String key:parallelGatewayTasksNow) {
                    //如果当前节点是并发分支则删除execution
                    sql1.params().set("a", historicTaskInstanceEntity.getProcessInstanceId());
                    sql1.params().set("b", historicTaskInstanceEntity.getExecutionId());
                    sql1.params().set("c", key);
                    sql1.addBatch();
                }
                daoCtl.exeUpdateBySql(dao, sql1);
            }
        }

        // 恢复期望退回的任务和历史
        this.processHistoryTask(historicTaskInstanceEntity,
                historicActivityInstanceEntity, activitiList, def);

        log.info("activiti is rollback " +
                historicTaskInstanceEntity.getName());
        if (isParallel) {
            nutMap.setv("sql", sql);
        }
        nutMap.setv("isParallel", isParallel);
        nutMap.setv("errcode", 0);
        nutMap.setv("errmsg", "");
        return nutMap;
    }

    public boolean isSameBranch(
            HistoricTaskInstanceEntity historicTaskInstanceEntity) {
        return taskEntity.getExecutionId().equals(
                historicTaskInstanceEntity.getExecutionId());
    }

    /**
     * 查找最近历史节点
     *
     * @return
     */
    public Map findNearestUserTask() {
        Graph graph = new ActivitiHistoryGraphBuilder(
                taskEntity.getProcessInstanceId()).build();

        Sql sql1 = Sqls.create("select id_ from ACT_HI_ACTINST where task_id_=@taskId");
        sql1.params().set("taskId", taskId);
        String historicActivityInstanceId = daoCtl.getStrRowValue(dao, sql1);
        Node node = graph.findById(historicActivityInstanceId);

        String previousHistoricActivityInstanceId = this.findIncomingNode(
                graph, node);

        if (previousHistoricActivityInstanceId == null) {
            log.debug(
                    "cannot find previous historic activity instance : " +
                            taskEntity);

            return null;
        }
        Sql s = Sqls.create("select act_id_,task_id_ from ACT_HI_ACTINST where id_=@id");
        s.params().set("id", previousHistoricActivityInstanceId);
        return daoCtl.getHashMap(dao, s);
    }

    public String findIncomingNode(Graph graph, Node node) {
        for (Edge edge : graph.getEdges()) {
            Node src = edge.getSrc();
            Node dest = edge.getDest();
            String srcType = src.getType();

            if (!dest.getId().equals(node.getId())) {
                continue;
            }

            if ("userTask".equals(srcType)) {
                boolean isSkip = isSkipActivity(src.getId());

                if (isSkip) {
                    return this.findIncomingNode(graph, src);
                } else {
                    return src.getId();
                }
            } else if (srcType.endsWith("Gateway")) {
                return this.findIncomingNode(graph, src);
            } else {
                log.info("cannot rollback, previous node is not userTask : "
                        + src.getId() + " " + srcType + "(" + src.getName()
                        + ")");

                return null;
            }
        }

        log.info("cannot rollback, this : " + node.getId() + " "
                + node.getType() + "(" + node.getName() + ")");

        return null;
    }

    public HistoricActivityInstanceEntity getHistoricActivityInstanceEntity(
            String historyTaskId) {
        log.info("historyTaskId : " + historyTaskId);
        Sql sql1 = Sqls.create("select id_ from ACT_HI_ACTINST where task_id_=@historyTaskId");
        sql1.params().set("historyTaskId", historyTaskId);
        String historicActivityInstanceId = daoCtl.getStrRowValue(dao, sql1);
        log.info("historicActivityInstanceId : " +
                historicActivityInstanceId);

        HistoricActivityInstanceQueryImpl historicActivityInstanceQueryImpl = new HistoricActivityInstanceQueryImpl();
        historicActivityInstanceQueryImpl
                .activityInstanceId(historicActivityInstanceId);

        HistoricActivityInstanceEntity historicActivityInstanceEntity = (HistoricActivityInstanceEntity) Context
                .getCommandContext()
                .getHistoricActivityInstanceEntityManager()
                .findHistoricActivityInstancesByQueryCriteria(
                        historicActivityInstanceQueryImpl, new Page(0, 1))
                .get(0);

        return historicActivityInstanceEntity;
    }

    public boolean checkCouldRollback(Node node) {
        // TODO: 如果是catchEvent，也应该可以退回，到时候再说
        for (Edge edge : node.getOutgoingEdges()) {
            Node dest = edge.getDest();
            String type = dest.getType();

            if ("userTask".equals(type)) {
                if (!dest.isActive()) {
                    boolean isSkip = isSkipActivity(dest.getId());

                    if (isSkip) {
                        return checkCouldRollback(dest);
                    } else {
                        // logger.info("cannot rollback, " + type + "("
                        // + dest.getName() + ") is complete.");
                        // return false;
                        return true;
                    }
                }
            } else if (type.endsWith("Gateway")) {
                return checkCouldRollback(dest);
            } else {
                log.info("cannot rollback, " + type + "(" + dest.getName()
                        + ") is complete.");

                return false;
            }
        }

        return true;
    }

    public void deleteActiveTasks(String processInstanceId) {
        Context.getCommandContext().getTaskEntityManager()
                .deleteTasksByProcessInstanceId(processInstanceId, "退回", false);
        Sql sql1 = Sqls.create("select * from ACT_HI_ACTINST where proc_inst_id_=@processInstanceId and end_time_ is null");
        sql1.params().set("processInstanceId", processInstanceId);
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
        if (list.size() > 0) {
            daoCtl.exeUpdateBySql(dao, sql2);
        }
    }

    public void collectNodes(Node node, List<String> historyNodeIds) {
        log.info("node : " + node.getId() + "," + node.getType() + "," +
                node.getName());

        for (Edge edge : node.getOutgoingEdges()) {
            log.info("edge : " + edge.getName());

            Node dest = edge.getDest();
            historyNodeIds.add(dest.getId());
            collectNodes(dest, historyNodeIds);
        }
    }

    public void deleteHistoryActivities(List<String> historyNodeIds) {
        /*
         * JdbcTemplate jdbcTemplate = ApplicationContextHelper .getBean(JdbcTemplate.class);
         * logger.info("historyNodeIds : {}", historyNodeIds);
         *
         * for (String id : historyNodeIds) { jdbcTemplate.update("delete from ACT_HI_ACTINST where id_=?", id); }
         */
    }

    //判断是否是并行分支节点
    public boolean isParallelGatewayTask(String activityId, List<ActivityImpl> activitiList) {
        boolean res = false;
        for (ActivityImpl activityImpl : activitiList) {
            if ("userTask".equals(activityImpl.getProperty("type")) && firstUserTask == null) {
                firstUserTask = activityImpl.getId();//保存第一个任务节点
            } else if ("parallelGateway".equals(activityImpl.getProperty("type"))) {
                List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();
                for (PvmTransition pvmTransition : outgoingTransitions) {
                    PvmActivity ac = pvmTransition.getDestination();
                    if (outgoingTransitions.size() > 1 && "userTask".equals(ac.getProperty("type"))) {
                        parallelGatewayTasks.add(ac.getId());
                    }
                    if (outgoingTransitions.size() > 1 && activityId.equals(ac.getId())) {
                        parallelGatewayInId = activityImpl.getId();
                        List<PvmTransition> out = ac.getOutgoingTransitions();
                        for (PvmTransition o : out) {
                            PvmActivity a = o.getDestination();
                            if ("parallelGateway".equals(a.getProperty("type"))) {
                                parallelGatewayOutId = a.getId();
                            }
                        }
                        res = true;
                    }
                }
                if (res)
                    break;
            }
        }
        return res;
    }

    //判断当前是否是并行分支节点
    public boolean isParallelGatewayTaskNow(String activityId, List<ActivityImpl> activitiList) {
        boolean res = false;
        for (ActivityImpl activityImpl : activitiList) {
            if ("userTask".equals(activityImpl.getProperty("type")) && firstUserTask == null) {
                firstUserTask = activityImpl.getId();//保存第一个任务节点
            } else if ("parallelGateway".equals(activityImpl.getProperty("type"))) {
                List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();
                for (PvmTransition pvmTransition : outgoingTransitions) {
                    PvmActivity ac = pvmTransition.getDestination();
                    if (outgoingTransitions.size() > 1 && "userTask".equals(ac.getProperty("type"))) {
                        parallelGatewayTasksNow.add(ac.getId());
                    }
                    if (outgoingTransitions.size() > 1 && activityId.equals(ac.getId())) {
                        res = true;
                    }
                }
                if (res)
                    break;
            }
        }
        return res;
    }
    public void processHistoryTask(
            HistoricTaskInstanceEntity historicTaskInstanceEntity,
            HistoricActivityInstanceEntity historicActivityInstanceEntity, List<ActivityImpl> activitiList, ProcessDefinitionEntity def) {
        ActivityImpl activity = getActivity(historicActivityInstanceEntity);
        boolean async = activity.isAsync();
        if (isParallel) {
            // 把流程指向任务对应的节点
            ExecutionEntity executionEntity = Context.getCommandContext()
                    .getExecutionEntityManager()
                    .findExecutionById(taskEntity.getExecutionId());
            executionEntity.setActivity(getActivityExt(def, parallelGatewayInId));
            executionEntity.setActive(false);
            executionEntity.setConcurrent(false);
            executionEntity.setScope(true);
            Context.getCommandContext().getHistoryManager()
                    .recordActivityStart(executionEntity);
            sql.params().set("a", executionEntity.getId());
            sql.params().set("b", parallelGatewayInId);
            sql.addBatch();
            for (String key : parallelGatewayTasks) {
                if (key.equals(activityId)) {//如果并发节点是要退回的节点
                    ExecutionEntity executionEntity2 = executionEntity.createExecution();
                    executionEntity2.setActivity(activity);
                    executionEntity2.setActive(true);
                    executionEntity2.setConcurrent(true);
                    executionEntity2.setScope(false);
                    Context.getCommandContext().getHistoryManager().recordActivityStart(executionEntity2);
                    // 创建新任务
                    TaskEntity task = TaskEntity.create(new Date());
                    task.setProcessDefinitionId(historicTaskInstanceEntity
                            .getProcessDefinitionId());
                    task.setParentTaskIdWithoutCascade(historicTaskInstanceEntity
                            .getParentTaskId());
                    task.setNameWithoutCascade(historicTaskInstanceEntity.getName());
                    task.setTaskDefinitionKey(historicTaskInstanceEntity
                            .getTaskDefinitionKey());
                    task.setExecutionId(executionEntity2.getId());
                    task.setPriority(historicTaskInstanceEntity.getPriority());
                    task.setProcessInstanceId(historicTaskInstanceEntity
                            .getProcessInstanceId());
                    task.setDescriptionWithoutCascade(historicTaskInstanceEntity
                            .getDescription());
                    task.setCategory(historicTaskInstanceEntity.getCategory());
                    task.setFormKey(historicTaskInstanceEntity.getFormKey());
                    Context.getCommandContext().getTaskEntityManager().insert(task);
                    //还原IdentityLink
                    List<HistoricIdentityLinkEntity> linkEntities=Context
                            .getCommandContext()
                            .getHistoricIdentityLinkEntityManager().findHistoricIdentityLinksByTaskId(historyTaskId);
                    for(HistoricIdentityLinkEntity entity:linkEntities) {
                        IdentityLinkEntity identityLinkEntity = new IdentityLinkEntity();
                        identityLinkEntity.setTask(task);
                        identityLinkEntity.setUserId(entity.getUserId());
                        identityLinkEntity.setGroupId(entity.getGroupId());
                        identityLinkEntity.setType(entity.getType());
                        identityLinkEntity.setProcessDefId(entity.getProcessInstanceId());
                        identityLinkEntity.insert();
                    }

                    // 创建HistoricTaskInstance
                    Context.getCommandContext().getHistoryManager()
                            .recordTaskCreated(task, executionEntity2);
                    Context.getCommandContext().getHistoryManager().recordTaskId(task);
                    // 更新ACT_HI_ACTIVITY里的assignee字段
                    Context.getCommandContext().getHistoryManager()
                            .recordTaskAssignment(task);
                } else {
                    ExecutionEntity executionEntity1 = executionEntity.createExecution();
                    executionEntity1.setActivity(getActivityExt(def, parallelGatewayOutId));
                    executionEntity1.setActive(false);
                    executionEntity1.setConcurrent(true);
                    executionEntity1.setScope(false);
                    Context.getCommandContext().getHistoryManager().recordActivityStart(executionEntity1);
                    sql.params().set("a", executionEntity1.getId());
                    sql.params().set("b", parallelGatewayOutId);
                    sql.addBatch();

                }
            }


        } else {
            if (users == null) {

                // 创建新任务
                TaskEntity task = TaskEntity.create(new Date());
                task.setProcessDefinitionId(historicTaskInstanceEntity
                        .getProcessDefinitionId());
                // task.setId(historicTaskInstanceEntity.getId());
                task.setParentTaskIdWithoutCascade(historicTaskInstanceEntity
                        .getParentTaskId());
                task.setNameWithoutCascade(historicTaskInstanceEntity.getName());
                task.setFormKey(historicTaskInstanceEntity.getFormKey());
                task.setTaskDefinitionKey(historicTaskInstanceEntity
                        .getTaskDefinitionKey());
                task.setExecutionId(historicTaskInstanceEntity.getExecutionId());
                task.setPriority(historicTaskInstanceEntity.getPriority());
                task.setProcessInstanceId(historicTaskInstanceEntity
                        .getProcessInstanceId());
                task.setDescriptionWithoutCascade(historicTaskInstanceEntity
                        .getDescription());
                task.setCategory(historicTaskInstanceEntity.getCategory());
                if (firstUserTask != null && firstUserTask.equals(activityId)) {
                    //如果是第一个用户节点，还原为原办理人(发起人）
                    task.setAssigneeWithoutCascade(historicTaskInstanceEntity.getAssignee());
                }
                Context.getCommandContext().getTaskEntityManager().insert(task);
                //还原IdentityLink
                List<HistoricIdentityLinkEntity> linkEntities=Context
                        .getCommandContext()
                        .getHistoricIdentityLinkEntityManager().findHistoricIdentityLinksByTaskId(historyTaskId);
                for(HistoricIdentityLinkEntity entity:linkEntities) {
                    IdentityLinkEntity identityLinkEntity = new IdentityLinkEntity();
                    identityLinkEntity.setTask(task);
                    identityLinkEntity.setUserId(entity.getUserId());
                    identityLinkEntity.setGroupId(entity.getGroupId());
                    identityLinkEntity.setType(entity.getType());
                    identityLinkEntity.setProcessDefId(entity.getProcessInstanceId());
                    identityLinkEntity.insert();
                }

                // 把流程指向任务对应的节点
                ExecutionEntity executionEntity = Context.getCommandContext()
                        .getExecutionEntityManager()
                        .findExecutionById(historicTaskInstanceEntity.getExecutionId());
                executionEntity
                        .setActivity(activity);

                // 创建HistoricActivityInstance
                Context.getCommandContext().getHistoryManager()
                        .recordActivityStart(executionEntity);

                // 创建HistoricTaskInstance
                Context.getCommandContext().getHistoryManager()
                        .recordTaskCreated(task, executionEntity);
                Context.getCommandContext().getHistoryManager().recordTaskId(task);
                // 更新ACT_HI_ACTIVITY里的assignee字段
                Context.getCommandContext().getHistoryManager()
                        .recordTaskAssignment(task);
            } else {

                // 把流程指向任务对应的节点
                ExecutionEntity executionEntity = Context.getCommandContext()
                        .getExecutionEntityManager()
                        .findExecutionById(taskEntity.getExecutionId());
                executionEntity.setActivity(activity);
                // 创建HistoricActivityInstance
                Context.getCommandContext().getHistoryManager()
                        .recordActivityStart(executionEntity);
                ExecutionEntity executionEntity1 = executionEntity.createExecution();
                executionEntity1.setParentId(executionEntity.getId());
                executionEntity1.setProcessDefinitionId(executionEntity.getProcessDefinitionId());
                executionEntity1.setProcessDefinitionKey(executionEntity.getProcessDefinitionKey());
                executionEntity1.setScope(true);
                executionEntity1.setConcurrent(async);
                Context.getCommandContext().getHistoryManager().recordActivityStart(executionEntity1);
                for (String s : users) {
                    ExecutionEntity executionEntity2 = executionEntity1.createExecution();
                    executionEntity2.setParentId(executionEntity1.getId());
                    executionEntity2.setProcessDefinitionId(executionEntity1.getProcessDefinitionId());
                    executionEntity2.setProcessDefinitionKey(executionEntity1.getProcessDefinitionKey());
                    executionEntity2.setScope(false);
                    executionEntity2.setConcurrent(!async);
                    Context.getCommandContext().getHistoryManager().recordActivityStart(executionEntity2);
                    // 创建新任务
                    TaskEntity task = TaskEntity.create(new Date());
                    task.setProcessDefinitionId(historicTaskInstanceEntity
                            .getProcessDefinitionId());
                    // task.setId(historicTaskInstanceEntity.getId());
                    task.setAssigneeWithoutCascade(s);
                    task.setParentTaskIdWithoutCascade(historicTaskInstanceEntity
                            .getParentTaskId());
                    task.setNameWithoutCascade(historicTaskInstanceEntity.getName());
                    task.setTaskDefinitionKey(historicTaskInstanceEntity
                            .getTaskDefinitionKey());
                    task.setExecutionId(executionEntity2.getId());
                    task.setPriority(historicTaskInstanceEntity.getPriority());
                    task.setProcessInstanceId(historicTaskInstanceEntity
                            .getProcessInstanceId());
                    task.setDescriptionWithoutCascade(historicTaskInstanceEntity
                            .getDescription());
                    task.setCategory(historicTaskInstanceEntity.getCategory());
                    task.setFormKey(historicTaskInstanceEntity.getFormKey());

                    Context.getCommandContext().getTaskEntityManager().insert(task);
                    // 创建HistoricTaskInstance
                    Context.getCommandContext().getHistoryManager()
                            .recordTaskCreated(task, executionEntity2);
                    Context.getCommandContext().getHistoryManager().recordTaskId(task);
                    // 更新ACT_HI_ACTIVITY里的assignee字段
                    Context.getCommandContext().getHistoryManager()
                            .recordTaskAssignment(task);
                }
            }
        }

    }

    public ActivityImpl getActivity(
            HistoricActivityInstanceEntity historicActivityInstanceEntity) {
        ProcessDefinitionEntity processDefinitionEntity = new GetDeploymentProcessDefinitionCmd(
                historicActivityInstanceEntity.getProcessDefinitionId())
                .execute(Context.getCommandContext());
        //退回到指定节点
        if (activityId != null) {
            return processDefinitionEntity
                    .findActivity(activityId);
        }
        return processDefinitionEntity
                .findActivity(historicActivityInstanceEntity.getActivityId());
    }

    public ActivityImpl getActivityExt(ProcessDefinitionEntity processDefinitionEntity, String id) {
        return processDefinitionEntity
                .findActivity(id);
    }

    /**
     * 删除未完成任务.
     */
    public void deleteActiveTask() {
        Context.getCommandContext().getTaskEntityManager()
                .deleteTask(taskEntity, "回退", false);
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
        daoCtl.exeUpdateBySql(dao, sql2);
    }

    public boolean isSkipActivity(String historyActivityId) {
        Sql sql2 = Sqls.create("select task_id_ from ACT_HI_ACTINST where id_=@id");
        sql2.params().set("id", historyActivityId);
        String historyTaskId = daoCtl.getStrRowValue(dao, sql2);
        HistoricTaskInstanceEntity historicTaskInstanceEntity = Context
                .getCommandContext().getHistoricTaskInstanceEntityManager()
                .findHistoricTaskInstanceById(historyTaskId);
        String deleteReason = historicTaskInstanceEntity.getDeleteReason();

        return "跳过".equals(deleteReason);
    }
}
