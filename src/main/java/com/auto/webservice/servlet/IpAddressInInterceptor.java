package com.auto.webservice.servlet;

import com.auto.webservice.entity.ListInfo;
import com.auto.webservice.server.UserInfoServiceImpl;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.AbstractPhaseInterceptor;
import org.apache.cxf.phase.Phase;
import org.apache.cxf.transport.http.AbstractHTTPDestination;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * IP地址拦截器
 *
 * @author Sunshine
 */

public class IpAddressInInterceptor extends AbstractPhaseInterceptor<Message> {
    private final Log log = Logs.get();

    public IpAddressInInterceptor() {
        super(Phase.RECEIVE);
    }

    public void handleMessage(Message message) throws Fault {
        HttpServletRequest request = (HttpServletRequest) message.get(AbstractHTTPDestination.HTTP_REQUEST);
        //获取所有的白名单访问主机
        UserInfoServiceImpl userInfoService = Mvcs.ctx().getDefaultIoc().get(UserInfoServiceImpl.class);
        List<ListInfo> hostList = userInfoService.queryHostListByType("w");
        // 取客户端IP地址
        String ipAddress = request.getRemoteAddr();
        // 如果允许访问的集合非空，继续处理，否则认为全部IP地址均合法
        if (!hostList.isEmpty()) {
            boolean contains = false;
            for (ListInfo hostInfo : hostList) {
                log.debug("hostInfo:" + hostInfo.getIpaddress() + "|ipAddress:" + ipAddress);
                if (hostInfo.getIpaddress().equals(ipAddress)) {
                    contains = true;
                    break;
                }
            }
            if (!contains) {
                throw new Fault(new IllegalAccessException("IP address " + ipAddress + " is not allowed"));
            }
        }
    }

}
