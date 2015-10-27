package com.auto.webservice.server;

import com.auto.webservice.entity.GroupInfo;
import com.auto.webservice.entity.ListInfo;
import com.auto.webservice.entity.UserInfo;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * UserInfoServiceImpl
 * Created by lei.c on 15-5-4.
 */
@IocBean(name = "userInfoService")
@WebService
public class UserInfoServiceImpl implements UserInfoService {
    Dao dao = Mvcs.ctx().getDefaultIoc().get(Dao.class);
    private final Log log = Logs.get();

    @Override
    public UserInfo findUserById(String userid) {
        log.debug("findUserById userid=" + userid);
        Sql sql = Sqls.create("SELECT id,loginname,realname,unitid FROM sys_user WHERE id=@c");
        sql.params().set("c", userid);
        sql.setCallback(Sqls.callback.records());
        dao.execute(sql);
        return (UserInfo) sql.getObject(UserInfo.class);
    }

    @Override
    public List<GroupInfo> findGroupsByUser(String userid) {
        log.debug("findGroupsByUser userid=" + userid);
        Sql sql = Sqls.create("SELECT a.* FROM sys_role a,sys_user_role b WHERE a.id=b.roleid AND b.userid=@c");
        sql.params().set("c", userid);
        sql.setCallback(Sqls.callback.records());
        dao.execute(sql);
        List<Record> list = sql.getList(Record.class);
        List<GroupInfo> groupList = new ArrayList<>();
        for (Record m : list) {
            GroupInfo group = new GroupInfo();
            group.setId(Strings.sNull(m.get("id")));
            group.setName(Strings.sNull(m.get("name")));
            group.setUnitid(Strings.sNull(m.get("unitid")));
            group.setDescript(Strings.sNull(m.get("descript")));
            group.setPid(Strings.sNull(m.get("pid")));
            group.setLocation(Strings.sNull(m.get("location")));
            groupList.add(group);
        }
        return groupList;
    }

    @Override
    public List<UserInfo> findUserByGroups(String groupsid) {
        log.debug("findUserByGroups groupsid=" + groupsid);
        Sql sql = Sqls.create("SELECT id,unitid,realname,loginname FROM sys_user WHERE unitid=@c");
        sql.params().set("c", groupsid);
        sql.setCallback(Sqls.callback.records());
        dao.execute(sql);
        List<Record> list = sql.getList(Record.class);
        List<UserInfo> groupList = new ArrayList<>();
        for (Record m : list) {
            UserInfo userInfo = new UserInfo();
            userInfo.setUid(Strings.sNull(m.get("id")));
            userInfo.setUnitid(Strings.sNull(m.get("unitid")));
            userInfo.setRealname(Strings.sNull(m.get("realname")));
            userInfo.setLoginname(Strings.sNull(m.get("loginname")));
            groupList.add(userInfo);
        }
        return groupList;
    }

    @Override
    public List<ListInfo> queryHostListByType(String type) {

        log.debug("queryAllHostList type=" + type);
        Sql sql = Sqls.create("SELECT listip,hostname,ipaddress,type,state,createuserid,createtime,remark FROM wf_config_ip WHERE type=@c");
        sql.params().set("c", type);
        sql.setCallback(Sqls.callback.records());
        dao.execute(sql);
        List<Record> list = sql.getList(Record.class);
        List<ListInfo> listList = new ArrayList<>();
        for (Map m : list) {
            ListInfo listInfo = new ListInfo();
            listInfo.setListip(Strings.sNull(m.get("listid")));
            listInfo.setHostname(Strings.sNull(m.get("hostname")));
            listInfo.setIpaddress(Strings.sNull(m.get("ipaddress")));
            listInfo.setType(Strings.sNull(m.get("type")));
            listInfo.setState(Strings.sNull(m.get("state")));
            listInfo.setCreateuserid(Strings.sNull(m.get("createuserid")));
            listInfo.setCreatetime(Strings.sNull(m.get("createtime")));
            listInfo.setRemark(Strings.sNull("remark"));
            listList.add(listInfo);
        }
        return listList;
    }
}
