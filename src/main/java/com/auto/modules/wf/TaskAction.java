package com.auto.modules.wf;

import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
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
 * Created by wizzer on 15-4-23.
 */
@IocBean(name="wf_taskAction")
@At("/private/wf/task")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class TaskAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected TaskService taskService;

    @At("")
    @Ok("vm:template.private.wf.task")
    public void index() {

    }

    @At("/list")
    @Ok("json")
    public Map<String, Object> list(@Param("page") int curPage, @Param("rows") int pageSize, HttpServletRequest req) {

        TaskQuery taskQuery = taskService.createTaskQuery().orderByTaskCreateTime().desc();
        long total = taskQuery.count();
        List<Task> list = taskQuery.listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }
}
