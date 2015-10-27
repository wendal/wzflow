package com.auto.modules;

import com.auto.common.view.VelocityViewMaker;
import com.auto.core.UrlMappingSet;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

import com.auto.core.StartSetup;

/** 
 * 类描述： 
 * 创建人：Wizzer 
 * 联系方式：www.auto.com
 * 创建时间：2013-11-26 下午2:08:37 
 * @version 
 */

@Modules(scanPackage=true)
@Ok("raw")
@Fail("http:500")
@IocBy(type=ComboIocProvider.class,args={
	"*json","thisconfig",
	"*anno","com.auto"})
@SetupBy(value=StartSetup.class)
@UrlMappingBy(value=UrlMappingSet.class)
@Views({ VelocityViewMaker.class})
public class MainModule {
}
