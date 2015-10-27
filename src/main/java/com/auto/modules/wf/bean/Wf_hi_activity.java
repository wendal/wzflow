package com.auto.modules.wf.bean;

import org.nutz.dao.entity.annotation.*;

/**
 * Created by wizzer on 2015/5/25.
 */
@Table("wf_hi_activity")
public class Wf_hi_activity {
    @Id
    @Column
    private int id;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String processInstanceId;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String processDefinitionId;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 64)
    private String executionId;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 255)
    private String nowActivityId;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 255)
    private String nextActivityId;
    @Column
    @ColDefine(type = ColType.VARCHAR, width = 1000)
    private String jsonInfo;
    @Column
    @ColDefine(type = ColType.BOOLEAN)
    private boolean isAfter;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    public String getProcessDefinitionId() {
        return processDefinitionId;
    }

    public void setProcessDefinitionId(String processDefinitionId) {
        this.processDefinitionId = processDefinitionId;
    }

    public String getNowActivityId() {
        return nowActivityId;
    }

    public void setNowActivityId(String nowActivityId) {
        this.nowActivityId = nowActivityId;
    }

    public String getNextActivityId() {
        return nextActivityId;
    }

    public void setNextActivityId(String nextActivityId) {
        this.nextActivityId = nextActivityId;
    }

    public String getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(String jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public boolean isAfter() {
        return isAfter;
    }

    public boolean getIsAfter() {
        return isAfter;
    }

    public void setIsAfter(boolean isAfter) {
        this.isAfter = isAfter;
    }

    public String getExecutionId() {
        return executionId;
    }

    public void setExecutionId(String executionId) {
        this.executionId = executionId;
    }

}
