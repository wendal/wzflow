package com.auto.modules.wf;

import com.auto.activiti.cmd.HistoryProcessInstanceDiagramCmd;
import com.auto.common.filter.GlobalsFilter;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.impl.interceptor.Command;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;

/**
 * Created by wizzer on 15-4-22.
 */
@IocBean
@At("/private/wf/flow")
@Filters({@By(type = GlobalsFilter.class)})
public class GraphAction {
    @Inject
    protected ProcessEngine processEngine;
    /**
     * 流程跟踪(图片)
     *
     * @throws Exception
     */
    @At("/graph/?")
    public void graphHistory(String processInstanceId,
                             HttpServletResponse response) throws Exception {
        Command<InputStream> cmd = new HistoryProcessInstanceDiagramCmd(
                processInstanceId);

        InputStream is = processEngine.getManagementService().executeCommand(
                cmd);
        response.setContentType("image/png");

        int len = 0;
        byte[] b = new byte[1024];

        while ((len = is.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }
}
