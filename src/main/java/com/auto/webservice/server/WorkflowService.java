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
@WebService(targetNamespace = "http://server.webservice.auto.com/", name = "workflowServicePortType")
public interface WorkflowService {

    @WebResult(name = "return")
    @Action(input = "urn:start", output = "urn:startResponse")
    @RequestWrapper(localName = "start")
    @WebMethod(action = "urn:start")
    @ResponseWrapper(localName = "startResponse")
    String start(@WebParam(name = "flowKey") String flowKey, @WebParam(name = "userId") String userId);//启动流程


    @WebResult(name = "return")
    @Action(input = "urn:startForm", output = "urn:startFormResponse")
    @RequestWrapper(localName = "startForm")
    @WebMethod(action = "urn:startForm")
    @ResponseWrapper(localName = "startFormResponse")
    String startForm(@WebParam(name = "processKey") String processKey, @WebParam(name = "userId") String userId, @WebParam(name = "param") String param);//启动流程(带动态表单)


    @WebResult(name = "return")
    @Action(input = "urn:startAutoCompleteFirst", output = "urn:startAutoCompleteFirstResponse")
    @RequestWrapper(localName = "startAutoCompleteFirst")
    @WebMethod(action = "urn:startAutoCompleteFirst")
    @ResponseWrapper(localName = "startAutoCompleteFirstResponse")
    String startAutoCompleteFirst(@WebParam(name = "flowKey") String flowKey, @WebParam(name = "userId") String userId, @WebParam(name = "jsonParam") String jsonParam);//启动流程并自动完成第一步


    @WebResult(name = "return")
    @Action(input = "urn:startBusinessKey", output = "urn:startBusinessKeyResponse")
    @RequestWrapper(localName = "startBusinessKey")
    @WebMethod(action = "urn:startBusinessKey")
    @ResponseWrapper(localName = "startBusinessKeyResponse")
    String startBusinessKey(@WebParam(name = "flowKey") String flowKey, @WebParam(name = "businessKey") String businessKey, @WebParam(name = "userId") String userId);//启动流程
}
