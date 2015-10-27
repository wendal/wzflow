package com.auto.webservice.server;

import com.auto.activiti.cmd.*;
import com.auto.common.action.BaseAction;
import com.auto.common.util.StringUtil;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Event;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Files;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 15-4-13.
 */
@IocBean(name = "tasksService")
@WebService
public class TasksServiceImpl extends BaseAction implements TasksService {
    private final Log log = Logs.get();
    Dao dao=Mvcs.ctx().getDefaultIoc().get(Dao.class);
    FormService formService=Mvcs.ctx().getDefaultIoc().get(FormService.class);
    IdentityService identityService=Mvcs.ctx().getDefaultIoc().get(IdentityService.class);
    HistoryService historyService=Mvcs.ctx().getDefaultIoc().get(HistoryService.class);
    TaskService taskService=Mvcs.ctx().getDefaultIoc().get(TaskService.class);
    ManagementService managementService=Mvcs.ctx().getDefaultIoc().get(ManagementService.class);
    /**
     * 获取待办和待签收的任务
     *
     * @param userId   用户ID
     * @param pageNum  页
     * @param pageSize 页大小
     * @return json
     */
    public String listWaiting(String category, String userId, int pageNum, int pageSize) {
        NutMap re = new NutMap();
        try {
//            long total;
//            TaskQuery query1 = taskService.createTaskQuery().taskCategory(category).taskAssignee(userId).orderByTaskCreateTime().desc();
//            TaskQuery query2 = taskService.createTaskQuery().taskCategory(category).taskCandidateUser(userId).orderByTaskCreateTime().desc();
//
//            long count1 = query1.count();
//            long count2 = query2.count();
//            List<Task> list1 = query1.listPage((pageNum - 1) * pageSize, pageSize);
//            List<Task> list2 = null;
//            if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 0 && count1 < pageNum * pageSize) {
//                list2 = query2.listPage(0, (int) (pageNum * pageSize - count1));
//            } else if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 1) {
//                list2 = query2.listPage((int) ((pageNum - 1) * pageSize % count1), pageSize);
//            } else if (count1 == 0) {
//                list2 = query2.listPage((pageNum - 1) * pageSize, pageSize);
//            }
//            total = count1 + count2;
//            List<Task> list = new ArrayList<>();
//            list.addAll(list1);
//            if (list2 != null) {
//                list.addAll(list2);
//            }
//            TaskQuery query1 = taskService.createTaskQuery().taskCategory(category).taskAssignee(userId).orderByTaskCreateTime().desc();
//
//            long count1 = query1.count();
//            long count2;
//            List<Task> list1 = null;
//            //查询分组
//            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
//            group_sql.params().set("userid", userId);
//            List<String> groupIds=daoCtl.getStrRowValues(dao, group_sql);
//            //查询待签
//            Sql task_sql=Sqls.create("SELECT  aaa.*  FROM ACT_RU_TASK   aaa " +
//                    "INNER JOIN ( " +
//                    "SELECT  RES.ID_ " +
//                    "FROM ACT_RU_TASK RES " +
//                    "INNER JOIN " +
//                    "(SELECT DISTINCT TASK_ID_ FROM ACT_RU_IDENTITYLINK " +
//                    "WHERE " +
//                    "TYPE_ = 'candidate' AND ( USER_ID_ = @userid OR GROUP_ID_ IN $groupid) " +
//                    ") XXX ON RES.ID_ =  XXX.TASK_ID_  " +
//                    "WHERE  RES.ASSIGNEE_ IS NULL AND RES.CATEGORY_=@category " +
//                    "ORDER BY  RES.CREATE_TIME_ DESC LIMIT @a,@b " +
//                    ") yyy ON aaa.ID_=yyy.ID_ ");
//            task_sql.params().set("userid",userId);
//            task_sql.vars().set("groupid", StringUtil.getStrsplit(groupIds));
//            task_sql.params().set("category", category);
//            //统计待签
//            Sql count_sql=Sqls.create("SELECT  COUNT(1) " +
//                    "FROM ACT_RU_TASK RES " +
//                    "INNER JOIN " +
//                    "(SELECT DISTINCT TASK_ID_ FROM ACT_RU_IDENTITYLINK " +
//                    "WHERE " +
//                    "TYPE_ = 'candidate' AND ( USER_ID_ = @userid OR GROUP_ID_ IN $groupid) " +
//                    ") XXX ON RES.ID_ =  XXX.TASK_ID_  " +
//                    "WHERE  RES.ASSIGNEE_ IS NULL AND RES.CATEGORY_=@category ");
//            count_sql.params().set("userid",userId);
//            count_sql.vars().set("groupid", StringUtil.getStrsplit(groupIds));
//            count_sql.params().set("category",category);
//            count2=daoCtl.getIntRowValue(dao,count_sql);
//            List<Task> list2 = null;
//            if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 0 && count1 < pageNum * pageSize) {
//                task_sql.params().set("a",0);
//                task_sql.params().set("b", (int) (pageNum * pageSize - count1));
//                list1=query1.listPage((pageNum - 1) * pageSize, pageSize);
//                list2=taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
//            } else if (count1 > 0 && (pageNum - 1) * pageSize / count1 >0) {
//                task_sql.params().set("a",(int) ((pageNum - 1) * pageSize % count1));
//                task_sql.params().set("b",pageSize);
//                list2=taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
//            } else if (count1 == 0) {
//                task_sql.params().set("a",(pageNum - 1) * pageSize);
//                task_sql.params().set("b",pageSize);
//                list2=taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
//            }else {
//                list1=query1.listPage((pageNum - 1) * pageSize, pageSize);
//            }
//            total = count1 + count2;
//            List<Task> list = new ArrayList<>();
//            if (list1 != null) {
//                list.addAll(list1);
//            }
//            if (list2 != null) {
//                list.addAll(list2);
//            }
            //查询分组
            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
            group_sql.params().set("userid", userId);
            List<String> groupIds = daoCtl.getStrRowValues(dao, group_sql);
            String gStr="";
            for(String gid:groupIds){
                gStr+=" OR ASSIGNEE_='ROLE("+gid+")'";
            }
            Sql count_sql=Sqls.create("SELECT COUNT(1) FROM act_ru_task WHERE CATEGORY_=@c AND ( ASSIGNEE_=@d  $s )");
            count_sql.params().set("c",category);
            count_sql.params().set("d", userId);
            count_sql.vars().set("s", gStr);
            int total = daoCtl.getIntRowValue(dao, count_sql);
            Sql task_sql=Sqls.create("SELECT * FROM act_ru_task WHERE CATEGORY_=@c AND ( ASSIGNEE_=@d  $s ) ORDER BY create_time_ desc");
            task_sql.params().set("c",category);
            task_sql.params().set("d", userId);
            task_sql.vars().set("s", gStr);
            List<Task> list=taskService.createNativeTaskQuery().sql(task_sql.toString()).listPage((pageNum - 1) * pageSize, pageSize);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("total", total);
            re.setv("list", list);
        } catch (Exception e) {
            log.error("listWaiting", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取待办的任务
     *
     * @param userId   用户ID
     * @param pageNum  页
     * @param pageSize 页大小
     * @return json
     */
    public String listDoing(String category, String userId, int pageNum, int pageSize) {
        NutMap re = new NutMap();
        try {
            TaskQuery query = taskService.createTaskQuery().taskCategory(category).taskAssignee(userId).orderByTaskCreateTime().desc();
            List<Task> doingTasks = query.listPage((pageNum - 1) * pageSize, pageSize);
            long total = query.count();
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("total", total);
            re.setv("list", doingTasks);
        } catch (Exception e) {
            log.error("listDoing", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }


    /**
     * 获取审核意见列表
     *
     * @param processInstanceId 流程实例ID
     * @param taskId            任务ID
     * @return json
     */
    public String listComment(String processInstanceId, String taskId) {
        NutMap re = new NutMap();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            Map<String, Object> commentAndEventsMap = new HashMap<String, Object>();
            /*
             * 根据不同情况使用不同方式查询
             */
            if (StringUtils.isNotBlank(processInstanceId)) {
                List<Comment> processInstanceComments = taskService.getProcessInstanceComments(processInstanceId);
                for (Comment comment : processInstanceComments) {
                    String commentId = (String) PropertyUtils.getProperty(comment, "id");
                    commentAndEventsMap.put(commentId, comment);
                }
                // 提取任务任务名称
                List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId).orderByTaskCreateTime().asc().list();
                Map<String, String> taskNames = new HashMap<String, String>();
                for (HistoricTaskInstance historicTaskInstance : list) {
                    taskNames.put(historicTaskInstance.getId(), historicTaskInstance.getName());
                }
                result.put("taskNames", taskNames);

            }
            /*
             * 查询所有类型的事件
             */
            if (StringUtils.isNotBlank(taskId)) { // 根据任务ID查询
                List<Event> taskEvents = taskService.getTaskEvents(taskId);
                for (Event event : taskEvents) {
                    String eventId = (String) PropertyUtils.getProperty(event, "id");
                    commentAndEventsMap.put(eventId, event);
                }
            }
            result.put("events", commentAndEventsMap.values());
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("result", result);
        } catch (Exception e) {
            log.error("listDoing", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取用户任务表单
     *
     * @param taskId 任务ID
     * @return json
     */
    public String getFormData(String taskId) {
        NutMap re = new NutMap();
        try {
            TaskFormData taskFormData = formService.getTaskFormData(taskId);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("data", taskFormData);
        } catch (Exception e) {
            log.error("getFormData", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取外置表单
     *
     * @param taskId 任务ID
     * @return json
     */
    public String getFormKey(String taskId) {
        NutMap re = new NutMap();
        try {
            Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
            String formData = Files.read(Mvcs.getNutConfig().getAppRoot() + "/WEB-INF/classes/" + task.getFormKey());
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("data", formData);
        } catch (Exception e) {
            log.error("getFormKey", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 签收
     *
     * @param taskId 任务ID
     * @param userId 用户ID
     * @return json
     */
    public String claim(String taskId, String userId) {
        NutMap re = new NutMap();
        try {
            taskService.claim(taskId, userId);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
        } catch (Exception e) {
            log.error("claim", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 退签
     *
     * @param taskId 任务ID
     * @return json
     */
    public String unclaim(String taskId) {
        NutMap re = new NutMap();
        try {
            taskService.unclaim(taskId);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
        } catch (Exception e) {
            log.error("claim", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 委派任务
     *
     * @param taskId 任务ID
     * @param userId 用户ID
     * @return json
     */
    public String delegate(String taskId, String userId) {
        NutMap re = new NutMap();
        try {
            taskService.delegateTask(taskId, userId);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
        } catch (Exception e) {
            log.error("delegate", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 完成任务
     *
     * @param processInstanceId 流程实例ID
     * @param taskId            任务ID
     * @param userId            用户ID
     * @param jsonParam         参数
     * @param comment           审核意见
     * @return json
     */
    public String complete(String processInstanceId, String taskId, String userId, String jsonParam, String comment) {
        NutMap re = new NutMap();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            taskService.setAssignee(taskId,userId);
            if (!Strings.isEmpty(comment)) {
                taskService.addComment(taskId, processInstanceId, comment);
            }
            if (!Strings.isEmpty(jsonParam)) {
                NutMap map1 = Json.fromJson(NutMap.class, jsonParam);
                taskService.complete(taskId, map1, false);
            } else {
                taskService.complete(taskId);
            }
            re.setv("errcode", 0);
            re.setv("errmsg", "");
        } catch (Exception e) {
            log.error("complete", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 委派人完成任务
     *
     * @param taskId 任务ID
     * @return json
     */
    public String resolve(String taskId) {
        NutMap re = new NutMap();
        try {
            taskService.resolveTask(taskId);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
        } catch (Exception e) {
            log.error("resolve", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }


    /**
     * 后加签 After
     *
     * @param taskId 任务ID
     * @param users  用户数组
     * @return json
     */
    public String joinAfter(String taskId, String[] users) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new JoinTaskCmd(true,taskId,users);
            re=managementService.executeCommand(cmd);
        } catch (Exception e) {
            log.error("joinAfter", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 前加签 Before
     * @return json
     * @param taskId 任务ID
     * @param users  用户数组
     */
    public String joinBefore(String taskId, String[] users) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new JoinTaskCmd(false,taskId,users);
            re=managementService.executeCommand(cmd);
        } catch (Exception e) {
            log.error("joinBefore", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取历史任务
     *
     * @param taskId 当前任务ID
     * @return json
     */
    public String historyTasks(String taskId) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new HistoryTaskCmd(taskId);
            NutMap map = managementService.executeCommand(cmd);
            return Json.toJson(map, JsonFormat.compact());
        } catch (Exception e) {
            log.error("historyTasks", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());

        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取下个任务集合
     *
     * @param taskId 任务ID
     * @return json
     */
    public String nextTasks(String taskId) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new NextTaskCmd(taskId);
            NutMap map = managementService.executeCommand(cmd);
            return Json.toJson(map, JsonFormat.compact());
        } catch (Exception e) {
            log.error("nextTasks", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 获取历史任务
     *
     * @param taskId  当前任务ID
     * @param taskKey 目标任务KEY
     * @param users   会签用户数组,null
     * @return json
     */
    public String rollback(String taskId, String taskKey, String[] users) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new RollbackTaskCmd(taskId, taskKey, users);
            NutMap nutMap = managementService.executeCommand(cmd);
            int errcode = nutMap.getInt("errcode");
            boolean isParallel = nutMap.getBoolean("isParallel");
            if (errcode == 0 && isParallel) {
                Sql sql = nutMap.getAs("sql", Sql.class);
                Mvcs.ctx().getDefaultIoc().get(Dao.class).execute(sql);
            }
            if (errcode == 0) {
                re.setv("errcode", 0);
                re.setv("errmsg", "");
            } else if (errcode == 2) {
                re.setv("errcode", 1);
                re.setv("errmsg", nutMap.getString("errmsg"));
            }
        } catch (Exception e) {
            log.error("rollback", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());

        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 自由跳转（主节点）
     *
     * @param taskId  当前任务ID
     * @param taskKey 目标任务KEY
     * @param isAutoComplete   目标任务自动完成
     * @return json
     */
    public String jump(String taskId, String taskKey, boolean isAutoComplete) {
        NutMap re = new NutMap();
        try {
            Command<NutMap> cmd = new JumpCmd(taskId, taskKey);
            NutMap nutMap= managementService.executeCommand(cmd);
            int errcode = nutMap.getInt("errcode");
            if(errcode==0&&isAutoComplete){
                List<Task> list= taskService.createTaskQuery().executionId(nutMap.getString("executionId")).list();
                for(Task task:list){
                    taskService.complete(task.getId());
                }
            }
            if (errcode == 0) {
                re.setv("errcode", 0);
                re.setv("errmsg", "");
            } else if (errcode == 2) {
                re.setv("errcode", 1);
                re.setv("errmsg", nutMap.getString("errmsg"));
            }
        } catch (Exception e) {
            log.error("rollback", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());

        }
        return Json.toJson(re, JsonFormat.compact());
    }
}
