package com.auto.modules.wf.form;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.auto.common.action.BaseAction;
import com.auto.common.config.Globals;
import com.auto.modules.sys.bean.Sys_user;
import org.nutz.dao.Chain;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.DatabaseMeta;
import org.nutz.dao.entity.Record;
import org.nutz.dao.impl.NutDao;
import org.nutz.dao.impl.SimpleDataSource;
import org.nutz.json.Json;
import org.nutz.lang.Strings;
import org.nutz.lang.random.R;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import javax.activation.DataSource;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by wizzer on 15-4-29.
 */
@At("/private/form")
public class FormAction extends BaseAction {
    private final Log log = Logs.get();

    @At("/test")
    public void test(@Param("sys_name") String sys_name) {
        try {
            NutDao dao = Globals.FORM_DAO.get(sys_name);
            Sys_user user = daoCtl.detailByCnd(dao, Sys_user.class, Cnd.where("uid", "=", 1));
            log.info("user::" + user.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @At("/get")
    @Ok("json")
    public Map<String, Object> get(@Param("sys_name") String sys_name,@Param("table_name")String table_name,@Param("flow_id")String flow_id) {
        Map<String, Object> res = new HashMap<String, Object>();
        try {
            NutDao dao = Globals.FORM_DAO.get(sys_name);
            log.info("dao::"+dao);
            log.info("table_name::"+table_name);
            log.info("flow_id::"+flow_id);
            Record record=dao.fetch(table_name,Cnd.where("flow_id","=",flow_id));
            res.put("errcode", 0);
            res.put("errmsg", "");
            res.put("sys_name", sys_name);
            res.put("table_name", table_name);
            res.put("data", record);
        } catch (Exception e) {
            log.error("form data push ", e);
            res.put("errcode", 1);
            res.put("errmsg", e.getMessage());
        }
        return res;
    }

    @At("/push")
    @Ok("json")
    public Map<String, Object> push(@Param("json") String param) {
        Map<String, Object> res = new HashMap<String, Object>();
        try {
            NutMap map = Json.fromJson(NutMap.class, param);
            String sys_name = map.getString("sys_name");
            String table_name = map.getString("table_name");
            NutDao dao = Globals.FORM_DAO.get(sys_name);
            NutMap objmap = map.getAs("data", NutMap.class);
            String id = objmap.getString("id");
            Chain chain = Chain.from(objmap);
            if (!Strings.isEmpty(id)) {
                dao.update(table_name, chain, Cnd.where("id", "=", id));
            } else {
                id = R.UU64();
                objmap.put("id", id);
                dao.insert(table_name, chain);
            }
            res.put("errcode", 0);
            res.put("errmsg", "");
            res.put("id", id);
        } catch (Exception e) {
            log.error("form data push ", e);
            res.put("errcode", 1);
            res.put("errmsg", e.getMessage());
        }
        return res;
    }

}
