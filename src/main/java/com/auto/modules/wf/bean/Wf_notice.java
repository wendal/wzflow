package com.auto.modules.wf.bean;

import org.nutz.dao.entity.annotation.*;

/**
 * Created by wizzer on 15-4-13.
 */
@Table("wf_notice")
public class Wf_notice {
    @Name
    @Prev(els=@EL("uuid()"))
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String id;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String pid;
    @Column
    @ColDefine(type = ColType.INT, width = 1)
    @Default("0")
    @Comment("消息类型 0:系统 1:用户")
    private int type;
    @Column
    @ColDefine(type = ColType.INT, width = 1)
    @Default("0")
    @Comment("发送类型 0:发送 1:接收")
    private int send_type;
    @Column
    @ColDefine(type = ColType.INT, width = 1)
    @Default("0")
    @Comment("发送状态 0:成功 1:失败")
    private int send_status;
    @Column
    @ColDefine(type = ColType.DATETIME)
    @Comment("发送or接收时间")
    private String send_time;
    @Column
    @ColDefine(type = ColType.DATETIME)
    @Comment("查看时间")
    private String read__time;
    @Column
    @ColDefine(type = ColType.INT, width = 1)
    @Default("0")
    @Comment("查看状态 0:未读 1:已读")
    private int  read_status;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 1000)
    @Comment("消息正文")
    private String note;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getSend_type() {
        return send_type;
    }

    public void setSend_type(int send_type) {
        this.send_type = send_type;
    }

    public int getSend_status() {
        return send_status;
    }

    public void setSend_status(int send_status) {
        this.send_status = send_status;
    }

    public String getSend_time() {
        return send_time;
    }

    public void setSend_time(String send_time) {
        this.send_time = send_time;
    }

    public String getRead__time() {
        return read__time;
    }

    public void setRead__time(String read__time) {
        this.read__time = read__time;
    }

    public int getRead_status() {
        return read_status;
    }

    public void setRead_status(int read_status) {
        this.read_status = read_status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
