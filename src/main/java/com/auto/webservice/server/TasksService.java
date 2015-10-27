package com.auto.webservice.server;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * Created by wizzer on 15-4-13.
 */
@WebService(targetNamespace = "http://server.webservice.auto.com/", name = "taskServicePortType")
public interface TasksService {

    /**
     * 获取待办和待签收任务
     * @param category
     * @param userId
     * @param pageNum
     * @param pageSize
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:listWaiting", output = "urn:listWaitingResponse")
    @RequestWrapper(localName = "listWaiting")
    @WebMethod(action = "urn:listWaiting")
    @ResponseWrapper(localName = "listWaitingResponse")
    String listWaiting(@WebParam(name="category")String category, @WebParam(name="userId")String userId, @WebParam(name="pageNum")int pageNum, @WebParam(name="pageSize")int pageSize);

    /**
     * 获取待办任务
     * @param category
     * @param userId
     * @param pageNum
     * @param pageSize
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:listDoing", output = "urn:listDoingResponse")
    @RequestWrapper(localName = "listDoing")
    @WebMethod(action = "urn:listDoing")
    @ResponseWrapper(localName = "listDoingResponse")
    String listDoing(@WebParam(name="category")String category, @WebParam(name="userId")String userId, @WebParam(name="pageNum")int pageNum, @WebParam(name="pageSize")int pageSize);

    /**
     * 获取审核意见列表
     * @param processInstanceId
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:listComment", output = "urn:listCommentResponse")
    @RequestWrapper(localName = "listComment")
    @WebMethod(action = "urn:listComment")
    @ResponseWrapper(localName = "listCommentResponse")
    String listComment(@WebParam(name="processInstanceId")String processInstanceId, @WebParam(name="taskId")String taskId);

    /**
     * 获取任务外置表单
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:getFormKey", output = "urn:getFormKeyResponse")
    @RequestWrapper(localName = "getFormKey")
    @WebMethod(action = "urn:getFormKey")
    @ResponseWrapper(localName = "getFormKeyResponse")
    String getFormKey(@WebParam(name="taskId")String taskId);

    /**
     * 签收
     * @param taskId
     * @param userId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:claim", output = "urn:claimResponse")
    @RequestWrapper(localName = "claim")
    @WebMethod(action = "urn:claim")
    @ResponseWrapper(localName = "claimResponse")
    String claim(@WebParam(name="taskId")String taskId, @WebParam(name="userId")String userId);

    /**
     * 退签
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:unclaim", output = "urn:unclaimResponse")
    @RequestWrapper(localName = "unclaim")
    @WebMethod(action = "urn:unclaim")
    @ResponseWrapper(localName = "unclaimResponse")
    String unclaim(@WebParam(name="taskId")String taskId);

    /**
     * 完成任务 param为json变量
     * @param processInstanceId
     * @param taskId
     * @param userId
     * @param jsonParam
     * @param comment
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:complete", output = "urn:completeResponse")
    @RequestWrapper(localName = "complete")
    @WebMethod(action = "urn:complete")
    @ResponseWrapper(localName = "completeResponse")
    String complete(@WebParam(name="processInstanceId")String processInstanceId, @WebParam(name="taskId")String taskId, @WebParam(name="userId")String userId, @WebParam(name="jsonParam")String jsonParam, @WebParam(name="comment")String comment);

    /**
     * 委派
     * @param taskId
     * @param userId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:delegate", output = "urn:delegateResponse")
    @RequestWrapper(localName = "delegate")
    @WebMethod(action = "urn:delegate")
    @ResponseWrapper(localName = "delegateResponse")
    String delegate(@WebParam(name="taskId")String taskId, @WebParam(name="userId")String userId);

    /**
     * 被委派人完成任务
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:resolve", output = "urn:resolveResponse")
    @RequestWrapper(localName = "resolve")
    @WebMethod(action = "urn:resolve")
    @ResponseWrapper(localName = "resolveResponse")
    String resolve(@WebParam(name="taskId")String taskId);

    /**
     * 查询历史任务节点集合
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:historyTasks", output = "urn:historyTasksResponse")
    @RequestWrapper(localName = "historyTasks")
    @WebMethod(action = "urn:historyTasks")
    @ResponseWrapper(localName = "historyTasksResponse")
    String historyTasks(@WebParam(name="taskId")String taskId);

    /**
     * 查询下个任务节点集合,type==0 无分支||type==1 有分支
     * @param taskId
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:nextTasks", output = "urn:nextTasksResponse")
    @RequestWrapper(localName = "nextTasks")
    @WebMethod(action = "urn:nextTasks")
    @ResponseWrapper(localName = "nextTasksResponse")
    String nextTasks(@WebParam(name="taskId")String taskId);

    /**
     * 退回到历史任务节点 taskKey=null 退回到上一节点||users!=null 退回到会签节点
     * @param taskId
     * @param taskKey
     * @param users
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:rollback", output = "urn:rollbackResponse")
    @RequestWrapper(localName = "rollback")
    @WebMethod(action = "urn:rollback")
    @ResponseWrapper(localName = "rollbackResponse")
    String rollback(@WebParam(name="taskId")String taskId, @WebParam(name="taskKey")String taskKey, @WebParam(name="users")String[] users);

    /**
     * 自由跳转（主节点）
     * @param taskId
     * @param taskKey
     * @param isAutoComplete
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:jump", output = "urn:jumpResponse")
    @RequestWrapper(localName = "jump")
    @WebMethod(action = "urn:jump")
    @ResponseWrapper(localName = "jumpResponse")
    String jump(@WebParam(name="taskId")String taskId, @WebParam(name="taskKey")String taskKey, @WebParam(name="isAutoComplete")boolean isAutoComplete);

    /**
     * 后加签
     * @param taskId
     * @param users
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:joinAfter", output = "urn:joinAfterResponse")
    @RequestWrapper(localName = "joinAfter")
    @WebMethod(action = "urn:joinAfter")
    @ResponseWrapper(localName = "joinAfterResponse")
    String joinAfter(@WebParam(name="taskId")String taskId, @WebParam(name="users")String[] users);

    /**
     * 前加签
     * @param taskId
     * @param users
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:joinBefore", output = "urn:joinBeforeResponse")
    @RequestWrapper(localName = "joinBefore")
    @WebMethod(action = "urn:joinBefore")
    @ResponseWrapper(localName = "joinBeforeResponse")
    String joinBefore(@WebParam(name="taskId")String taskId, @WebParam(name="users")String[] users);


}
