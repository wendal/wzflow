package com.auto.modules.wf.editor;

import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import org.activiti.engine.ActivitiException;
import org.apache.commons.io.IOUtils;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

import java.io.InputStream;

/**
 * Created by wizzer on 15-4-9.
 */
@IocBean
@At("/private/wf/editor")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class StencilsetAction extends BaseAction{
    @At("/stencilset")
    @Ok("raw")
    public String getStencilset() {
        InputStream stencilsetStream = this.getClass().getClassLoader().getResourceAsStream("stencilset.json");
        try {
            return IOUtils.toString(stencilsetStream);
        } catch (Exception e) {
            throw new ActivitiException("Error while loading stencil set", e);
        }
    }
}
