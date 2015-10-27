package com.auto.common.filter;

import com.auto.common.action.BaseAction;
import com.auto.common.util.UrlUtil;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Encoding;
import org.nutz.lang.Streams;
import org.nutz.lang.Strings;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.View;
import org.nutz.mvc.view.VoidView;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by auto on 15-2-3.
 */
@IocBean
public class ApiFilter extends BaseAction implements ActionFilter {
    @Inject
    protected UrlUtil urlUtil;

    public View match(ActionContext context) {
        try {
            String data = Strings.sNull(urlUtil.readStreamParameter(context.getRequest().getInputStream()));
            System.out.println(data);
            context.getRequest().setAttribute("data", data);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            context.getResponse().setContentType("text/plain");
            try {
                Map<String,Object> map=new HashMap<String, Object>();
                map.put("ok", -1);
                map.put("msg", "系统异常");
                map.put("data", "");
                byte[] data = String.valueOf(map).getBytes(Encoding.UTF8);
                context.getResponse().setHeader("Content-Length", "" + data.length);
                OutputStream out = context.getResponse().getOutputStream();
                Streams.writeAndClose(out, data);
            } catch (Exception ee) {
            }
            return new VoidView();
        }
    }
}
