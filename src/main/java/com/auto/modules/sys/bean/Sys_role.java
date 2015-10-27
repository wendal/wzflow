package com.auto.modules.sys.bean;

import org.nutz.dao.DB;
import org.nutz.dao.entity.annotation.*;

/**
 * @author Wizzer.cn
 * @time   2012-9-20 下午1:33:32
 *
 */
@Table("sys_role")
public class Sys_role {
	@Column 
	@Id
	private int id;
	@Column
	@ColDefine(type = ColType.VARCHAR, width = 50)
	private String name;
	@Column
	@ColDefine(type = ColType.VARCHAR, width = 100)
	private String unitid;
	@Column
	@ColDefine(type = ColType.VARCHAR, width = 255)
	private String descript;
    @Column
    private int pid;
	@Column
	private int location;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnitid() {
		return unitid;
	}
	public void setUnitid(String unitid) {
		this.unitid = unitid;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	

}


