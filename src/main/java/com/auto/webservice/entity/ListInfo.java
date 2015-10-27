package com.auto.webservice.entity;

/**
 * Created by lei.c on 15-5-7.
 */
public class ListInfo {
    private String listip;
    private String hostname;
    private String ipaddress;
    /**
     * w：白名单
     * b：黑名单
     */
    private String type;
    /**
     * 0：启用
     * 1：停用
     */
    private String state;
    private String createuserid;
    private String createtime;
    private String remark;

    public String getListip() {
        return listip;
    }

    public void setListip(String listip) {
        this.listip = listip;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(String createuserid) {
        this.createuserid = createuserid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
