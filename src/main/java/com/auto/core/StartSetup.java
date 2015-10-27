package com.auto.core;

import com.auto.activiti.cmd.JoinTaskInitCmd;
import com.auto.activiti.ext.CustomGroupEntityManager;
import com.auto.activiti.ext.CustomGroupEntityManagerFactory;
import com.auto.activiti.ext.CustomUserEntityManager;
import com.auto.activiti.ext.CustomUserEntityManagerFactory;
import com.auto.activiti.listener.ProxyTaskListener;
import com.auto.activiti.listener.ProxyUserTaskBpmnParseHandler;
import com.auto.activiti.listener.TaskCategoryTaskListener;
import com.auto.activiti.parser.CustomBpmnParser;
import com.auto.activiti.util.StrongUuidGenerator;
import com.auto.common.config.Globals;
import com.auto.common.util.DateUtil;
import com.auto.modules.sys.bean.*;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.parse.BpmnParseHandler;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.velocity.app.Velocity;
import org.nutz.dao.Dao;
import org.nutz.dao.impl.FileSqlManager;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.util.Daos;
import org.nutz.filepool.NutFilePool;
import org.nutz.ioc.Ioc2;
import org.nutz.ioc.ObjectProxy;
import org.nutz.json.Json;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;
import org.nutz.resource.Scans;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.*;

/**
 * 类描述： 创建人：Wizzer
 * 联系方式：www.wizzer.cn
 * 创建时间：2013-11-26 下午2:11:13
 */

public class StartSetup implements Setup {
    private final Log log = Logs.get();

    public void destroy(NutConfig config) {

    }

    public void init(NutConfig config) {
        try {
            log.info("path::"+ Json.toJson(Scans.me()));

            Dao dao = config.getIoc().get(Dao.class);
            initDB(dao);
            Globals.APP_BASE_PATH = Strings.sNull(config.getAppRoot());//项目路径
            Globals.APP_BASE_NAME = Strings.sNull(config.getServletContext().getContextPath());//部署名
            Globals.InitSysConfig(dao);//初始化系统参数
            Globals.InitDataDict(dao);//初始化数据字典
//            Globals.InitNutDaoMap(dao);//初始外置数据源
            Globals.APP_NAME = Strings.sNull(Globals.SYS_CONFIG.get("app_name"));//项目名称
            Globals.FILE_POOL = new NutFilePool("~/tmp/files", 10000);
            velocityInit(config);
            activitiInit(config);
            //初始化动态activity

        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
    }

    private void activitiInit(NutConfig config) {
        log.info("Activiti Init Start...");
        ProcessEngineConfigurationImpl processEngineConfiguration = (ProcessEngineConfigurationImpl) ProcessEngineConfiguration
                .createStandaloneProcessEngineConfiguration();
        processEngineConfiguration.setDatabaseSchemaUpdate("true");

        List<SessionFactory> list = new ArrayList<>();
        CustomGroupEntityManagerFactory customGroupManagerFactory = new CustomGroupEntityManagerFactory();
        customGroupManagerFactory.setGroupEntityManager(new CustomGroupEntityManager());
        CustomUserEntityManagerFactory customUserEntityManagerFactory = new CustomUserEntityManagerFactory();
        customUserEntityManagerFactory.setUserEntityManager(new CustomUserEntityManager());
        list.add(customGroupManagerFactory);
        list.add(customUserEntityManagerFactory);
        processEngineConfiguration.setCustomSessionFactories(list);
        //添加任务监听

        Map<Object, Object> beans = new HashMap<>();
        ProxyTaskListener proxyTaskListener = new ProxyTaskListener();
        List<TaskListener> taskListeners = new ArrayList<>();
        TaskCategoryTaskListener t1 = new TaskCategoryTaskListener();
        taskListeners.add(t1);
        proxyTaskListener.setTaskListeners(taskListeners);
        beans.put("customTaskListener", proxyTaskListener);
        processEngineConfiguration.setBeans(beans);
        List<BpmnParseHandler> customDefaultBpmnParseHandlers = new ArrayList<>();
        ProxyUserTaskBpmnParseHandler bpmnParseHandler = new ProxyUserTaskBpmnParseHandler();
        bpmnParseHandler.setUseDefaultUserTaskParser(true);
        bpmnParseHandler.setTaskListenerId("customTaskListener");
        customDefaultBpmnParseHandlers.add(bpmnParseHandler);
        processEngineConfiguration.setCustomDefaultBpmnParseHandlers(customDefaultBpmnParseHandlers);
        processEngineConfiguration.setBpmnParser(new CustomBpmnParser());
        //UUID
        processEngineConfiguration.setIdGenerator(new StrongUuidGenerator());
        //设置数据源
        processEngineConfiguration.setDataSource(config.getIoc().get(DataSource.class));
        processEngineConfiguration.setDatabaseSchemaUpdate("false");
        processEngineConfiguration.setJobExecutorActivate(false);
        processEngineConfiguration.setActivityFontName("宋体");
        processEngineConfiguration.setLabelFontName("宋体");
        processEngineConfiguration.setXmlEncoding("utf-8");
        ProcessEngine processEngine = processEngineConfiguration.buildProcessEngine();
        ((Ioc2) config.getIoc()).getIocContext().save("app", "processEngine", new ObjectProxy(processEngine));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "repositoryService", new ObjectProxy(processEngine.getRepositoryService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "runtimeService", new ObjectProxy(processEngine.getRuntimeService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "taskService", new ObjectProxy(processEngine.getTaskService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "formService", new ObjectProxy(processEngine.getFormService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "historyService", new ObjectProxy(processEngine.getHistoryService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "managementService", new ObjectProxy(processEngine.getManagementService()));
        ((Ioc2) config.getIoc()).getIocContext().save("app", "identityService", new ObjectProxy(processEngine.getIdentityService()));
        //恢复前加签、后加签活动
        Command<Void> cmd = new JoinTaskInitCmd();
        processEngine.getManagementService().executeCommand(cmd);
        log.info("Activiti Init End.");

    }

    private void velocityInit(NutConfig config) throws IOException {
        log.info("Veloctiy Init Start...");
        Properties p = new Properties();
        p.setProperty("resource.loader", "file,classloader");
        p.setProperty("file.resource.loader.path", config.getAppRoot());
        p.setProperty("file", "org.apache.velocity.tools.view.WebappResourceLoader");
        p.setProperty("classloader.resource.loader.class", "com.auto.common.view.VelocityResourceLoader");
        p.setProperty("classloader.resource.loader.path", config.getAppRoot());
        p.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
        p.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
        p.setProperty("velocimacro.library.autoreload", "false");
        p.setProperty("classloader.resource.loader.root", config.getAppRoot());
        p.setProperty("velocimarco.library.autoreload", "true");
        p.setProperty("runtime.log.error.stacktrace", "false");
        p.setProperty("runtime.log.warn.stacktrace", "false");
        p.setProperty("runtime.log.info.stacktrace", "false");
        p.setProperty("runtime.log.logsystem.class", "org.apache.velocity.runtime.log.SimpleLog4JLogSystem");
        p.setProperty("runtime.log.logsystem.log4j.category", "velocity_log");
        Velocity.init(p);
        log.info("Veloctiy Init End.");
    }

    public void initDB(Dao dao) {
//        Daos.createTablesInPackage(dao, "com.auto.modules", false);
        if (!dao.exists(Sys_user.class)) {
            log.info("Database Init Start...");
            Daos.createTablesInPackage(dao, "com.auto.modules", true);
            //初始化配置表
            Sys_config config = new Sys_config();
            config.setId(1);
            config.setCname("app_name");
            config.setCvalue("管理后台");
            config.setNote("项目名称，用于管理后台显示");
            dao.insert(config);
            //初始化IP防火墙表
            Sys_safeconfig safeconfig = new Sys_safeconfig();
            safeconfig.setId(1);
            safeconfig.setType(1);
            safeconfig.setState(1);
            safeconfig.setNote("10.10.10.1");
            dao.insert(safeconfig);
            safeconfig.setId(2);
            safeconfig.setType(0);
            safeconfig.setState(0);
            safeconfig.setNote("10.10.10.2");
            dao.insert(safeconfig);
            //初始化单位
            Sys_unit unit = new Sys_unit();
            unit.setId("0001");
            unit.setName("系统管理");
            unit.setLocation(0);
            dao.insert(unit);
            //初始化用户
            Sys_user user = new Sys_user();
            user.setId(1);
            user.setLoginname("superadmin");
            user.setRealname("超级管理员");
            RandomNumberGenerator rng = new SecureRandomNumberGenerator();
            String salt = rng.nextBytes().toBase64();
            String hashedPasswordBase64 = new Sha256Hash("11", salt, 1024).toBase64();
            user.setPassword(hashedPasswordBase64);
            user.setSalt(salt);
            user.setLogintime(DateUtil.getCurDateTime());
            user.setUnitid(unit.getId());
            dao.insert(user);
            //初始化角色表
            Sys_role role = new Sys_role();
            role.setId(1);
            role.setName("公共角色");
            dao.insert(role);
            role.setId(2);
            role.setName("系统管理");
            dao.insert(role);
            //初始化菜单
            Sys_resource resource = new Sys_resource();
            resource.setId("0001");
            resource.setName("系统管理");
            resource.setUrl("");
            resource.setLocation(0);
            dao.insert(resource);
            resource.setId("00010001");
            resource.setName("系统管理");
            resource.setUrl("");
            resource.setLocation(1);
            dao.insert(resource);
            resource.setId("000100010001");
            resource.setName("机构管理");
            resource.setUrl("/private/sys/unit");
            resource.setLocation(2);
            resource.setButton("增加/BtnAdd;删除/BtnDel;修改/BtnUpdate;排序/BtnSort;");
            dao.insert(resource);
            resource.setId("000100010002");
            resource.setName("用户管理");
            resource.setUrl("/private/sys/user");
            resource.setLocation(3);
            resource.setButton("增加/BtnAdd;修改/BtnUpdate;删除/BtnDel;禁用/BtnLocked;启用/BtnUnlocked;");
            dao.insert(resource);
            resource.setId("000100010003");
            resource.setName("角色管理");
            resource.setUrl("/private/sys/role");
            resource.setLocation(4);
            resource.setButton("增加/BtnAdd;删除/BtnDel;修改/BtnUpdate;添加用户到角色/BtnAddRole;从角色中删除用户/BtnDelRole;分配权限/BtnMenu;");
            dao.insert(resource);
            resource.setId("000100010004");
            resource.setName("资源管理");
            resource.setUrl("/private/sys/res");
            resource.setLocation(5);
            resource.setButton("增加/BtnAdd;删除/BtnDel;修改/BtnUpdate;排序/BtnSort;");
            dao.insert(resource);
            resource.setId("000100010005");
            resource.setName("参数配置");
            resource.setUrl("/private/sys/config");
            resource.setLocation(6);
            resource.setButton("新建/BtnAdd;编辑/BtnUpdate;删除/BtnDel;");
            dao.insert(resource);
            resource.setId("000100010006");
            resource.setName("数字字典");
            resource.setUrl("/private/sys/dict");
            resource.setLocation(7);
            resource.setButton("增加/BtnAdd;修改/BtnUpdate;删除/BtnDel;排序/BtnPaixu;");
            dao.insert(resource);
            resource.setId("000100010007");
            resource.setName("定时任务");
            resource.setUrl("/private/sys/task");
            resource.setLocation(8);
            resource.setButton("新建/BtnAdd;编辑/BtnUpdate;删除/BtnDel;");
            dao.insert(resource);
            resource.setId("000100010008");
            resource.setName("访问控制");
            resource.setUrl("/private/sys/safe");
            resource.setLocation(9);
            resource.setButton("");
            dao.insert(resource);
            resource.setId("000100010009");
            resource.setName("登陆日志");
            resource.setUrl("/private/sys/user/log");
            resource.setLocation(9);
            resource.setButton("");
            dao.insert(resource);
            //初始化角色资源
            Sys_role_resource roleResource = new Sys_role_resource();
            roleResource.setRoleid(2);
            roleResource.setResourceid("0001");
            roleResource.setButton("");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("00010001");
            roleResource.setButton("");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010001");
            roleResource.setButton("BtnAdd,BtnDel,BtnUpdate,BtnSort,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010002");
            roleResource.setButton("BtnAdd,BtnUpdate,BtnDel,BtnLocked,BtnUnlocked,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010003");
            roleResource.setButton("BtnAdd,BtnDel,BtnUpdate,BtnAddRole,BtnDelRole,BtnMenu,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010004");
            roleResource.setButton("BtnAdd,BtnDel,BtnUpdate,BtnSort,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010005");
            roleResource.setButton("BtnAdd,BtnUpdate,BtnDel,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010006");
            roleResource.setButton("BtnAdd,BtnUpdate,BtnDel,BtnPaixu,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010007");
            roleResource.setButton("BtnAdd,BtnUpdate,BtnDel,");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010008");
            roleResource.setButton("");
            dao.insert(roleResource);
            roleResource.setRoleid(2);
            roleResource.setResourceid("000100010009");
            roleResource.setButton("");
            dao.insert(roleResource);
            //初始化角色用户
            Sys_user_role userRole = new Sys_user_role();
            userRole.setRoleid(2);
            userRole.setUserid(1);
            dao.insert(userRole);
            FileSqlManager fm = new FileSqlManager("init_sys_dict.sql");
            List<Sql> sqlList = fm.createCombo(fm.keys());
            dao.execute(sqlList.toArray(new Sql[sqlList.size()]));
            log.info("Database Init End.");

        }
    }
}
