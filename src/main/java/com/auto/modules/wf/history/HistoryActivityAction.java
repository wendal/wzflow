package com.auto.modules.wf.history;

import com.auto.activiti.tool.UserTool;
import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricActivityInstanceQuery;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
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
 * Created by wizze on 2015/6/18.
 */
@IocBean
@At("/private/wf/history/node")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class HistoryActivityAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected HistoryService historyService;

    @At("")
    @Ok("vm:template.private.wf.history.activity")
    public void index() {

    }

    @At("/list")
    @Ok("json")
    public Map<String, Object> list(@Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {
        HistoricActivityInstanceQuery historicActivityInstanceQuery = historyService.createHistoricActivityInstanceQuery();
        long total = historicActivityInstanceQuery.count();
        List<HistoricActivityInstance> list = historicActivityInstanceQuery.orderByHistoricActivityInstanceStartTime().desc().listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }
}
