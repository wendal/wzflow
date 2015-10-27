package com.auto.modules.wf;

import com.auto.common.action.BaseAction;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.entity.Record;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;

/**
 * Created by wizzer on 15-4-22.
 */
@IocBean(name = "wf_userAction")
@At("/private/wf/user")
public class UserAction extends BaseAction {
    @Inject
    Dao dao;

    @At("/name/?")
    public String getName(String userId) {
        if (userId == null) {
            return "";
        } else {
            try {
                Record record = dao.fetch("act_id_user", Cnd.where("ID_", "=", userId));
                String FIRST_ = record.getString("FIRST_");
                String LAST_ = record.getString("LAST_");
                if (!Strings.isEmpty(FIRST_) && !Strings.isEmpty(LAST_)) {
                    return FIRST_ + " " + LAST_;
                } else if (!Strings.isEmpty(FIRST_)) {
                    return FIRST_;
                } else if (!Strings.isEmpty(LAST_)) {
                    return LAST_;
                } else {
                    return "";
                }
            } catch (Exception ex) {
                System.out.println("cannot find user : " + userId);
                return "";
            }
        }
    }
}
