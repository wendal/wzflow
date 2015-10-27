package com.auto.modules.wf;

import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 15-4-2.
 */
@IocBean
@At("/private/wf/flow")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class FlowAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected RuntimeService runtimeService;
    @Inject
    protected ProcessEngine processEngine;

    @At("")
    @Ok("vm:template.private.wf.flow")
    public void index() {

    }

    @At("/list")
    @Ok("json")
    public Map<String, Object> list(@Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {

        ProcessInstanceQuery processInstanceQuery = runtimeService.createProcessInstanceQuery().orderByProcessInstanceId().desc();
        long total = processInstanceQuery.count();
        List<ProcessInstance> list = processInstanceQuery.listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At("/end/?")
    @Ok("json")
    public Map<String, Object> end(String processInstanceId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            processEngine.getRuntimeService().deleteProcessInstance(
                    processInstanceId, "end");
            map.put("errcode", 0);
            map.put("errmsg", "");
            return map;
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
            return map;
        }
    }

    @At("/suspend/?")
    @Ok("json")
    public Map<String, Object> suspend(String processInstanceId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            runtimeService.suspendProcessInstanceById(processInstanceId);
            map.put("errcode", 0);
            map.put("errmsg", "");
            return map;
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
            return map;
        }
    }

    @At("/active/?")
    @Ok("json")
    public Map<String, Object> active(String processInstanceId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            runtimeService.activateProcessInstanceById(processInstanceId);
            map.put("errcode", 0);
            map.put("errmsg", "");
            return map;
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
            return map;
        }
    }


}
