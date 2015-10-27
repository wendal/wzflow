package com.auto.modules.wf.history;

import com.auto.activiti.tool.UserTool;
import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.history.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.apache.velocity.tools.generic.DateTool;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 15-4-21.
 */
@IocBean
@At("/private/wf/history/flow")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class HistoryFlowAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected RuntimeService runtimeService;
    @Inject
    protected ProcessEngine processEngine;
    @Inject
    protected HistoryService historyService;
    @Inject
    protected UserTool userTool;

    @At("")
    @Ok("vm:template.private.wf.history.flow")
    public void index() {

    }

    @At("/list")
    @Ok("json")
    public Map<String, Object> list(@Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {
        HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery().orderByProcessInstanceId().desc();
        long total = historicProcessInstanceQuery.count();
        List<HistoricProcessInstance> list = historicProcessInstanceQuery.orderByProcessInstanceStartTime().desc().listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At("/listtask")
    @Ok("json")
    public Map<String, Object> listtask(@Param("processInstanceId") String processInstanceId, @Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {
        HistoricTaskInstanceQuery historicTaskInstanceQuery = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId);
        long total = historicTaskInstanceQuery.count();
        List<HistoricTaskInstance> list = historicTaskInstanceQuery.orderByTaskCreateTime().desc().listPage((curPage - 1) * pageSize, pageSize);
//        List<Map> maps = new ArrayList<Map>();
//        for (HistoricTaskInstance h : list) {
//            Map<String, Object> map = Lang.obj2map(h);
//            if (!Strings.isEmpty(h.getAssignee())) {
//                map.put("assignee", userTool.getName(h.getAssignee()));
//            }
//            if (!Strings.isEmpty(h.getOwner())) {
//                map.put("owner", userTool.getName(h.getOwner()));
//            }
//            maps.add(map);
//        }
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At("/listvariable")
    @Ok("json")
    public Map<String, Object> listvariable(@Param("processInstanceId") String processInstanceId, @Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {
        HistoricVariableInstanceQuery historicVariableInstanceQuery = historyService.createHistoricVariableInstanceQuery().processInstanceId(processInstanceId);
        long total = historicVariableInstanceQuery.count();
        List<HistoricVariableInstance> list = historicVariableInstanceQuery.listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At("/view/?")
    @Ok("vm:template.private.wf.history.flowView")
    public void view(String processInstanceId, HttpServletRequest req) {
        req.setAttribute("processInstanceId", processInstanceId);
    }
}
