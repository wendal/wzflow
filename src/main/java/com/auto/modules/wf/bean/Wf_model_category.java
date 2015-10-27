package com.auto.modules.wf.bean;

import org.nutz.dao.entity.annotation.*;

/**
 * Created by wizzer on 15-4-8.
 */
@Table("wf_model_category")
public class Wf_model_category {
    @Column
    @Name
    @ColDefine(type = ColType.VARCHAR, width = 100)
    private String id;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 100)
    private String name;
    @Column
    @ColDefine(type = ColType.INT, width = 1)
    private int isprivate;
    @Column
    @ColDefine(type = ColType.INT, width = 11)
    private int location;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIsprivate() {
        return isprivate;
    }

    public void setIsprivate(int isprivate) {
        this.isprivate = isprivate;
    }

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }
}
