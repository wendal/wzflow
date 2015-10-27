package com.auto.modules.wf.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

/**
 * Created by wizzer on 15-4-29.
 */
@Table("wf_form_dbconfig")
public class Wf_form_dbconfig {
    @Name
    @Column
    private String sys_name;
    @Column
    private String sys_desc;
    @Column
    private String db_json;

    public String getSys_name() {
        return sys_name;
    }

    public void setSys_name(String sys_name) {
        this.sys_name = sys_name;
    }

    public String getSys_desc() {
        return sys_desc;
    }

    public void setSys_desc(String sys_desc) {
        this.sys_desc = sys_desc;
    }

    public String getDb_json() {
        return db_json;
    }

    public void setDb_json(String db_json) {
        this.db_json = db_json;
    }
}
