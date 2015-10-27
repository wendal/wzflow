package com.auto.modules.wf.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * Created by wizzer on 15-4-28.
 */
@Table("wf_test")
public class Wf_test {
    @Id
    @Column
    private int id;
    @Column
    private String flow_id;
    @Column
    private String task_id;
    @Column
    private int day;
    @Column
    private String reason;
    @Column
    private long add_uid;
    @Column
    private String add_time;
    @Column
    private long check_uid;
    @Column
    private String check_time;
    @Column
    private String note;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlow_id() {
        return flow_id;
    }

    public void setFlow_id(String flow_id) {
        this.flow_id = flow_id;
    }

    public String getTask_id() {
        return task_id;
    }

    public void setTask_id(String task_id) {
        this.task_id = task_id;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public long getAdd_uid() {
        return add_uid;
    }

    public void setAdd_uid(long add_uid) {
        this.add_uid = add_uid;
    }

    public String getAdd_time() {
        return add_time;
    }

    public void setAdd_time(String add_time) {
        this.add_time = add_time;
    }

    public long getCheck_uid() {
        return check_uid;
    }

    public void setCheck_uid(long check_uid) {
        this.check_uid = check_uid;
    }

    public String getCheck_time() {
        return check_time;
    }

    public void setCheck_time(String check_time) {
        this.check_time = check_time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
