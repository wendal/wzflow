package com.auto.webservice.server;

import com.auto.common.action.BaseAction;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.StartFormData;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import javax.jws.WebService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * WorkflowServiceImpl
 * Created by wizzer on 15-4-13.
 */
@IocBean(name = "workflowService")
@WebService
public class WorkflowServiceImpl extends BaseAction implements WorkflowService {
    private final Log log = Logs.get();
    FormService formService=Mvcs.ctx().getDefaultIoc().get(FormService.class);
    IdentityService identityService=Mvcs.ctx().getDefaultIoc().get(IdentityService.class);
    RuntimeService runtimeService=Mvcs.ctx().getDefaultIoc().get(RuntimeService.class);
    TaskService taskService=Mvcs.ctx().getDefaultIoc().get(TaskService.class);
    RepositoryService repositoryService=Mvcs.ctx().getDefaultIoc().get(RepositoryService.class);
    Dao dao=Mvcs.ctx().getDefaultIoc().get(Dao.class);
    /**
     * 启动一个流程
     *
     * @param flowKey 流程模型key
     * @param userId  用户ID
     * @return json
     */
    public String start(String flowKey, String userId) {
        NutMap re = new NutMap();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("processInstanceId", processInstance.getId());
        } catch (Exception e) {
            log.error("start", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 启动一个流程
     *
     * @param flowKey     流程模型key
     * @param businessKey businessKey
     * @param userId      用户ID
     * @return json
     */
    public String startBusinessKey(String flowKey, String businessKey, String userId) {
        NutMap re = new NutMap();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey, businessKey);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("processInstanceId", processInstance.getId());
        } catch (Exception e) {
            log.error("startBusinessKey", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 启动一个流程并自动完成第一步
     *
     * @param flowKey 流程模型key
     * @param userId  用户ID
     * @return json
     */
    public String startAutoCompleteFirst(String flowKey, String userId,String jsonParam) {
        NutMap re = new NutMap();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey);
            //查询分组
            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
            group_sql.params().set("userid", userId);
            List<String> groupIds = daoCtl.getStrRowValues(dao, group_sql);
            String gStr="";
            for(String gid:groupIds){
                gStr+=" OR ASSIGNEE_='ROLE("+gid+")'";
            }
            Sql task_sql=Sqls.create("SELECT * FROM act_ru_task WHERE PROC_INST_ID_=@c AND ( ASSIGNEE_=@d  $s ) ORDER BY create_time_ desc");
            task_sql.params().set("c",processInstance.getId());
            task_sql.params().set("d", userId);
            task_sql.vars().set("s", gStr);
            List<Task> list=taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
            Task task=null;
            if(list!=null){
                task=list.get(0);
                taskService.setAssignee(task.getId(),userId);
                if (!Strings.isEmpty(jsonParam)) {
                    NutMap map1 = Json.fromJson(NutMap.class, jsonParam);
                    taskService.complete(task.getId(), map1, false);
                } else {
                    taskService.complete(task.getId());
                }
            }

            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("processInstanceId", processInstance.getId());
        } catch (Exception e) {
            log.error("startAutoCompleteFirst", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    /**
     * 启动一个带表单的流程
     *
     * @param flowKey 流程模型key
     * @param userId  用户ID
     * @param param   表单参数
     * @return json
     */
    public String startForm(String flowKey, String userId, String param) {
        NutMap re = new NutMap();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionKey(flowKey).singleResult();
            String flowId = processDefinition.getId();
            Map<String, String> formValues = new HashMap<>();
            NutMap map1;
            if (!Strings.isEmpty(param)) {
                map1 = Json.fromJson(NutMap.class, param);
                StartFormData formData = formService.getStartFormData(flowId);
                List<FormProperty> formProperties = formData.getFormProperties();
                for (FormProperty formProperty : formProperties) {
                    formValues.put(formProperty.getId(), Strings.sNull(map1.get(formProperty.getId())));
                }
            }

            ProcessInstance processInstance = formService.submitStartFormData(flowId, formValues);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("processInstanceId", processInstance.getId());

        } catch (Exception e) {
            log.error("startForm", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(re, JsonFormat.compact());
    }


}
