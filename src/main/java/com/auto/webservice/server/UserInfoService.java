package com.auto.webservice.server;

import com.auto.webservice.entity.GroupInfo;
import com.auto.webservice.entity.ListInfo;
import com.auto.webservice.entity.UserInfo;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import java.util.List;

/**
 * Created by lei.c on 15-5-4.
 */

@WebService
public interface UserInfoService {
    /**
     * 根据用户ID获取用户信息
     *
     * @param userid
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:findUserById", output = "urn:findUserByIdResponse")
    @RequestWrapper(localName = "findUserById")
    @WebMethod(action = "urn:findUserById")
    @ResponseWrapper(localName = "findUserByIdResponse")
    public UserInfo findUserById(@WebParam(name="userid")String userid);

    /**
     * 根据用户标示获取角色相关信息
     *
     * @param userid
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:findGroupsByUser", output = "urn:findGroupsByUserResponse")
    @RequestWrapper(localName = "findGroupsByUser")
    @WebMethod(action = "urn:findGroupsByUser")
    @ResponseWrapper(localName = "findGroupsByUserResponse")
    public List<GroupInfo> findGroupsByUser(@WebParam(name="userid")String userid);

    /**
     * 根据角色ID获取对应的用户组
     *
     * @param groupsid
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:findUserByGroups", output = "urn:findUserByGroupsResponse")
    @RequestWrapper(localName = "findUserByGroups")
    @WebMethod(action = "urn:findUserByGroups")
    @ResponseWrapper(localName = "findUserByGroupsResponse")
    public List<UserInfo> findUserByGroups(@WebParam(name="groupsid")String groupsid);

    /**
     * 根据类型查询所有的限制主机信息
     *
     * @return
     */
    @WebResult(name = "return")
    @Action(input = "urn:queryHostListByType", output = "urn:queryHostListByTypeResponse")
    @RequestWrapper(localName = "queryHostListByType")
    @WebMethod(action = "urn:queryHostListByType")
    @ResponseWrapper(localName = "queryHostListByTypeResponse")
    public List<ListInfo> queryHostListByType(@WebParam(name="type")String type);
}
