package com.auto.common.config;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.auto.common.action.BaseAction;
import com.auto.modules.wf.bean.Wf_form_dbconfig;
import com.auto.modules.sys.bean.Sys_config;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.impl.NutDao;
import org.nutz.filepool.FilePool;
import org.nutz.json.Json;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Wizzer.cn
 * @time 2012-9-13 上午10:54:04
 */
public class Globals extends BaseAction {
    private final static Log log = Logs.get();
    //虚拟目录路径
    public static String APP_BASE_PATH = "";
    //虚拟目录名称
    public static String APP_BASE_NAME = "";
    //应用中文名
    public static String APP_NAME = "";
    //系统配置
    public static Map<String, String> SYS_CONFIG;
    //数据字典，根据ID分别初始化
    public static Map<String, Object> DATA_DICT;
    //文件池
    public static FilePool FILE_POOL;
    public static Map<String,NutDao> FORM_DAO=new HashMap<String,NutDao>();

    public static void InitNutDaoMap(Dao dao) {
        try {
            if (FORM_DAO == null) {
                FORM_DAO = new HashMap<String, NutDao>();
            }
            List<Wf_form_dbconfig> configList = dao.query(Wf_form_dbconfig.class, Cnd.NEW());
            for (Wf_form_dbconfig dbConfig : configList) {
                NutDao nutDao = new NutDao();
                nutDao.setDataSource(DruidDataSourceFactory.createDataSource(Json.fromJson(Map.class,dbConfig.getDb_json())));
                Globals.FORM_DAO.put(dbConfig.getSys_name(), nutDao);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
    }

    public static void InitSysConfig(Dao dao) {
        try {
            if (SYS_CONFIG == null) {
                SYS_CONFIG = new HashMap<String, String>();
            }
            List<Sys_config> configList = dao.query(Sys_config.class, Cnd.orderBy().asc("ID"));
            for (Sys_config sysConfig : configList) {
                Globals.SYS_CONFIG.put(sysConfig.getCname(), sysConfig.getCvalue());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
    }

    public static void InitDataDict(Dao dao) {
        try {
            if (DATA_DICT == null) {
                DATA_DICT = new HashMap<String, Object>();
            }
            DATA_DICT.put(Dict.APP_TYPE, daoCtl.getHashMap(dao, Sqls.create("SELECT dkey,dval FROM sys_dict WHERE id LIKE '" + Dict.APP_TYPE + "____'")));
            DATA_DICT.put(Dict.DIVSION, daoCtl.getHashMap(dao, Sqls.create("SELECT dkey,dval FROM sys_dict WHERE id LIKE '" + Dict.DIVSION + "_%'")));
            DATA_DICT.put(Dict.FORM_TYPE, daoCtl.getHashMap(dao, Sqls.create("SELECT dkey,dval FROM sys_dict WHERE id LIKE '" + Dict.FORM_TYPE + "_%' order by location asc,id asc")));

        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
    }
}
