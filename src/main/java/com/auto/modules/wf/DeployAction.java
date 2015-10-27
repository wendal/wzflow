package com.auto.modules.wf;

import com.auto.activiti.cmd.ProcessDefinitionDiagramCmd;
import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.commons.io.IOUtils;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 15-4-21.
 */
@IocBean
@At("/private/wf/deploy")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class DeployAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected RepositoryService repositoryService;
    @Inject
    protected ProcessEngine processEngine;

    @At("")
    @Ok("vm:template.private.wf.deploy")
    public void index() {

    }

    @At("/list")
    @Ok("json")
    public Map<String, Object> list(@Param("categoryId") String categoryId, @Param("keyword") String keyword, @Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        ProcessDefinitionQuery processDefinitionQuery2;
        if (!Strings.isEmpty(categoryId) && !Strings.isEmpty(keyword)) {
            processDefinitionQuery2 = processDefinitionQuery.processDefinitionCategory(categoryId);
        } else if (!Strings.isEmpty(categoryId)) {
            processDefinitionQuery2 = processDefinitionQuery.processDefinitionCategory(categoryId);
        } else if (!Strings.isEmpty(keyword)) {
            processDefinitionQuery2 = processDefinitionQuery.processDefinitionNameLike(keyword);
        } else {
            processDefinitionQuery2 = processDefinitionQuery;
        }
        long total = processDefinitionQuery2.count();
        List<ProcessDefinition> list = processDefinitionQuery2.orderByProcessDefinitionId().desc().listPage((curPage - 1) * pageSize, pageSize);

        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At("/suspend/?")
    @Ok("json")
    public Map<String, Object> suspend(String processDefinitionId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            repositoryService.suspendProcessDefinitionById(processDefinitionId,
                    true, null);
            map.put("errcode", 0);
            map.put("errmsg", "挂起部署成功，processDefinitionId=" + processDefinitionId);

        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", "挂起部署失败：processDefinitionId=" + processDefinitionId + "\r\n" + e.getMessage());
        }
        return map;
    }

    @At("/active/?")
    @Ok("json")
    public Map<String, Object> active(String processDefinitionId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            repositoryService.activateProcessDefinitionById(processDefinitionId,
                    true, null);
            map.put("errcode", 0);
            map.put("errmsg", "激活部署成功，processDefinitionId=" + processDefinitionId);

        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", "激活部署失败：processDefinitionId=" + processDefinitionId + "\r\n" + e.getMessage());
        }
        return map;
    }

    @At("/delete/?")
    @Ok("json")
    public Map<String, Object> delete(String deployId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            repositoryService.deleteDeployment(deployId, true);//是否级联删除实例资源
            map.put("errcode", 0);
            map.put("errmsg", "删除部署成功，deployId=" + deployId);

        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", "根据模型部署流程失败：deployId=" + deployId + "\r\n" + e.getMessage());
        }
        return map;
    }

    @At("/graph/?")
    public void graph(String processDefinitionId,
                      HttpServletResponse response) throws Exception {
        Command<InputStream> cmd = new ProcessDefinitionDiagramCmd(
                processDefinitionId);
        InputStream is = processEngine.getManagementService().executeCommand(
                cmd);
        response.setContentType("image/png");
        IOUtils.copy(is, response.getOutputStream());
    }

    @At("/xml/?")
    public void xml(String processDefinitionId,
                    HttpServletResponse response) throws Exception {
        ProcessDefinition processDefinition = repositoryService
                .createProcessDefinitionQuery()
                .processDefinitionId(processDefinitionId).singleResult();
        String resourceName = processDefinition.getResourceName();
        InputStream resourceAsStream = repositoryService.getResourceAsStream(
                processDefinition.getDeploymentId(), resourceName);
        response.setContentType("text/xml;charset=UTF-8");
        IOUtils.copy(resourceAsStream, response.getOutputStream());
    }
}
