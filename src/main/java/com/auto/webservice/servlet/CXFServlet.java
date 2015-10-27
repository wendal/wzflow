//package com.auto.webservice.servlet;
//
//import org.apache.cxf.Bus;
//import org.apache.cxf.BusFactory;
//import org.apache.cxf.frontend.ServerFactoryBean;
//import org.apache.cxf.transport.servlet.CXFNonSpringServlet;
//import org.nutz.ioc.Ioc;
//import org.nutz.lang.Strings;
//import org.nutz.log.Log;
//import org.nutz.log.Logs;
//import org.nutz.mvc.Mvcs;
//
//import javax.jws.WebService;
//import javax.servlet.ServletConfig;
//import javax.xml.namespace.QName;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * Created by wizzer on 15-4-10.
// */
//@SuppressWarnings("serial")
//public class CXFServlet extends CXFNonSpringServlet {
//    private final Log log = Logs.get();
//
//    @Override
//    protected void loadBus(ServletConfig sc) {
//        super.loadBus(sc);
//
//        //全局配置
//        Bus bus = getBus();
//        //添加白名单过滤器
//        bus.getInInterceptors().add(new IpAddressInInterceptor());
//        //使用全局配置
//        BusFactory.setDefaultBus(bus);
//        Ioc ioc = Mvcs.ctx().getDefaultIoc();
//        for (String name : ioc.getNames()) {
//            try {
//                Object obj = ioc.get(null, name);
//                if (!obj.getClass().getPackage().getName().equals("com.auto.webservice.server")) {
//                    continue;
//                }
//                if (obj.getClass().getAnnotation(WebService.class) == null)
//                    continue;
//                Class face = Class.forName(obj.getClass().getPackage().getName() + "." + Strings.upperFirst(name));
//                ServerFactoryBean serverFactoryBean = new ServerFactoryBean();
//                // 设置服务接口类
//                serverFactoryBean.setServiceClass(face);
//                // 服务请求路径
//                serverFactoryBean.setAddress("/" + name.substring(0, name.indexOf("Service")));
//                // 设置服务实现类
//                serverFactoryBean.setServiceBean(obj);
//                serverFactoryBean.setBindingId("http://schemas.xmlsoap.org/wsdl/soap12/");
//                List<String> schemaLocations=new ArrayList<>();
//                schemaLocations.add("http://www.springframework.org/schema/beans");
//                schemaLocations.add("http://www.springframework.org/schema/beans/spring-beans.xsd");
//                schemaLocations.add("http://cxf.apache.org/bindings/soap");
//                schemaLocations.add("http://cxf.apache.org/schemas/configuration/soap.xsd");
//                schemaLocations.add("http://cxf.apache.org/jaxws");
//                schemaLocations.add("http://cxf.apache.org/schemas/jaxws.xsd");
//
//                serverFactoryBean.setSchemaLocations(schemaLocations);
//
//                serverFactoryBean.create();
//            } catch (Throwable e) {
//            }
//        }
//
//
//    }
//}
