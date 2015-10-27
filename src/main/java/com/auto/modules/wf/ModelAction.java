package com.auto.modules.wf;

import com.auto.common.action.BaseAction;
import com.auto.common.config.Globals;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import com.auto.modules.wf.bean.Wf_model_category;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Criteria;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wizzer on 15-4-7.
 */
@IocBean
@At("/private/wf/model")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class ModelAction extends BaseAction {
    private final Log log = Logs.get();

    @Inject
    protected Dao dao;
    @Inject
    protected RepositoryService repositoryService;

    @At("")
    @Ok("vm:template.private.wf.model")
    public void index() {

    }

    @At("/toaddc")
    @Ok("vm:template.private.wf.modelCategoryAdd")
    public void toaddc(@Param("categoryId") String categoryId, HttpServletRequest req) {
        req.setAttribute("categoryId", categoryId);
        req.setAttribute("list", daoCtl.list(dao, Wf_model_category.class, Cnd.orderBy().asc("location")));

    }

    @At("/addc")
    @Ok("json")
    public Map<String, Object> addc(@Param("p_categoryId") String p_categoryId, @Param("name") String name) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Sql sql = Sqls
                    .create("select max(location)+1 from Wf_model_category where id like  @id");
            sql.params().set("id", p_categoryId + "_%");
            int location = daoCtl.getIntRowValue(dao, sql);
            Wf_model_category category = new Wf_model_category();
            category.setLocation(location);
            category.setName(name);
            category.setId(daoCtl.getSubMenuId(dao, "Wf_model_category", "id", p_categoryId));
            daoCtl.add(dao, category);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return map;
    }

    @At("/toupdatec")
    @Ok("vm:template.private.wf.modelCategoryUpdate")
    public void toupdatec(@Param("categoryId") String categoryId, HttpServletRequest req) {
        req.setAttribute("categoryId", categoryId);
        req.setAttribute("p_categoryId", categoryId.length() > 4 ? categoryId.substring(0, categoryId.length() - 4) : "");
        req.setAttribute("name", daoCtl.detailByName(dao, Wf_model_category.class, categoryId).getName());
        req.setAttribute("list", daoCtl.list(dao, Wf_model_category.class, Cnd.orderBy().asc("location")));

    }

    @At("/updatec")
    @Ok("json")
    public Map<String, Object> updatec(@Param("categoryId") String categoryId, @Param("name") String name) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Wf_model_category category = daoCtl.detailByName(dao, Wf_model_category.class, categoryId);
            category.setName(name);
            daoCtl.update(dao, category);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return map;
    }

    @At("/deletec/?")
    @Ok("json")
    public Map<String, Object> deletec(String categoryId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            daoCtl.delete(dao,Wf_model_category.class,Cnd.where("id","like",categoryId+"%"));
            Sql sql=Sqls.create("update act_re_model set CATEGORY_='' where CATEGORY_=@a");
            sql.params().set("a",categoryId);
            daoCtl.exeUpdateBySql(dao,sql);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg",e.getMessage());
        }
        return map;
    }

    /**
     * 转到排序页面
     */
    @At
    @Ok("vm:template.private.wf.modelCategorySort")
    public void tosort(HttpServletRequest req) throws Exception {
        List<Object> array = new ArrayList<Object>();
        Criteria cri = Cnd.cri();
        cri.getOrderBy().asc("location");
        cri.getOrderBy().asc("id");
        List<Wf_model_category> list = daoCtl.list(dao, Wf_model_category.class, cri);
        Map<String, Object> jsonroot = new HashMap<String, Object>();
        jsonroot.put("id", "");
        jsonroot.put("pId", "0");
        jsonroot.put("name", "流程分类");
        jsonroot.put("open", true);
        jsonroot.put("childOuter", false);
        jsonroot.put("icon", Globals.APP_BASE_NAME
                + "/images/icons/icon042a1.gif");
        array.add(jsonroot);
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> jsonobj = new HashMap<String, Object>();
            Wf_model_category obj = list.get(i);
            jsonobj.put("id", obj.getId());
            String p = obj.getId().substring(0, obj.getId().length() - 4);
            jsonobj.put("pId", "".equals(p) ? "0" : p);
            String name = obj.getName();
            jsonobj.put("name", name);
            jsonobj.put("childOuter", false);
            if (obj.getId().length() < 12) {
                jsonobj.put("open", true);
            } else {
                jsonobj.put("open", false);
            }
            array.add(jsonobj);
        }
        req.setAttribute("str", Json.toJson(array));
    }

    /**
     * 确认排序
     */
    @At
    @Ok("raw")
    public boolean sort(@Param("checkids") String[] checkids) {
        boolean rs = daoCtl.updateSortRow(dao, "Wf_model_category", checkids,
                "location", 0);
        return rs;

    }

    @At("/toadd")
    @Ok("vm:template.private.wf.modelAdd")
    public void toadd(@Param("categoryId") String categoryId, HttpServletRequest req) {
        req.setAttribute("categoryId", categoryId);
        req.setAttribute("list", daoCtl.list(dao, Wf_model_category.class, Cnd.orderBy().asc("location")));

    }

    @At("/add")
    @Ok("json")
    public Map<String, Object> add(@Param("categoryId") String categoryId, @Param("name") String name, @Param("key") String key, @Param("description") String description, HttpServletRequest req) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<String, Object>();
        ObjectMapper objectMapper = new ObjectMapper();

        Model modelData = repositoryService.newModel();

        ObjectNode modelObjectNode = objectMapper.createObjectNode();
        modelObjectNode.put("category", categoryId);
        modelObjectNode.put("key", key);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
        description = StringUtils.defaultString(description);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
        modelData.setMetaInfo(modelObjectNode.toString());
        modelData.setKey(key);
        modelData.setName(name);
        modelData.setCategory(categoryId);
        modelData.setKey(StringUtils.defaultString(key));

        repositoryService.saveModel(modelData);
        ObjectNode editorNode = objectMapper.createObjectNode();
        editorNode.put("resourceId", modelData.getId());
        ObjectNode properties = objectMapper.createObjectNode();
        properties.put("process_id", key);
        properties.put("process_namespace", categoryId);
        properties.put("name", name);
        properties.put("documentation", description);
        editorNode.put("properties", properties);
        ObjectNode stencilSetNode = objectMapper.createObjectNode();
        stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
        editorNode.put("stencilset", stencilSetNode);
        repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));
        map.put("errcode", 0);
        map.put("errmsg", "");
        return map;
    }

    @At("/tocopy")
    @Ok("vm:template.private.wf.modelAdd")
    public void tocopy(@Param("modelId") String modelId, HttpServletRequest req) {
        Model modelData = repositoryService.getModel(modelId);
        req.setAttribute("modelId", modelId);
        req.setAttribute("categoryId", modelData.getCategory());
        req.setAttribute("name", modelData.getName());
        req.setAttribute("key", modelData.getKey());
        NutMap nutMap = Json.fromJson(NutMap.class, Lang.inr(modelData.getMetaInfo()));
        req.setAttribute("description", Strings.sNull(nutMap.getString("description")));
        req.setAttribute("list", daoCtl.list(dao, Wf_model_category.class, Cnd.orderBy().asc("location")));

    }

    @At("/copy")
    @Ok("json")
    public Map<String, Object> copy(@Param("modelId") String modelId, @Param("categoryId") String categoryId, @Param("name") String name, @Param("key") String key, @Param("description") String description, HttpServletRequest req) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<String, Object>();
        Model modelData = repositoryService.getModel(modelId);
        if (modelData.getKey().equals(key)) {
            map.put("errcode", 1);
            map.put("errmsg", "Key已存在!");
            return map;
        }
        ObjectMapper objectMapper = new ObjectMapper();
        Model modelData2 = repositoryService.newModel();
        ObjectNode modelObjectNode = objectMapper.createObjectNode();
        modelObjectNode.put("category", categoryId);
        modelObjectNode.put("key", key);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
        description = StringUtils.defaultString(description);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
        modelData2.setMetaInfo(modelObjectNode.toString());
        modelData2.setKey(key);
        modelData2.setName(name);
        modelData2.setCategory(categoryId);
        modelData2.setKey(StringUtils.defaultString(key));
        repositoryService.saveModel(modelData2);
        NutMap nutMap = Json.fromJson(NutMap.class, Lang.inr(new String(repositoryService.getModelEditorSource(modelId), "utf-8")));
        nutMap.put("resourceId", modelData2.getId());
        NutMap properties = nutMap.getAs("properties", NutMap.class);
        properties.put("process_id", key);
        properties.put("process_namespace", categoryId);
        properties.put("name", name);
        properties.put("documentation", description);
        nutMap.put("properties", properties);
        repositoryService.addModelEditorSource(modelData2.getId(), Json.toJson(nutMap, JsonFormat.compact()).getBytes("utf-8"));
        map.put("errcode", 0);
        map.put("errmsg", "");
        return map;
    }

    @At("/deploy/?")
    @Ok("json")
    public Map<String, Object> deploy(String modelId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Model modelData = repositoryService.getModel(modelId);
            ObjectNode modelNode = (ObjectNode) new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));
            byte[] bpmnBytes = null;

            BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
            bpmnBytes = new BpmnXMLConverter().convertToXML(model, "utf-8");

            String processName = modelData.getName() + ".bpmn20.xml";
            Deployment deployment = repositoryService.createDeployment().name(modelData.getName()).category(modelData.getCategory()).addString(processName, new String(bpmnBytes)).deploy();
            modelData.setDeploymentId(deployment.getId());
            repositoryService.saveModel(modelData);
            map.put("errcode", 0);
            map.put("errmsg", "部署成功，部署ID=" + deployment.getId());

        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", "根据模型部署流程失败：modelId=" + modelId + "\r\n" + e.getMessage());
        }
        return map;
    }

    @At("/export/?")
    public void export(String modelId, HttpServletResponse response) {
        try {
            Model modelData = repositoryService.getModel(modelId);
            BpmnJsonConverter jsonConverter = new BpmnJsonConverter();
            JsonNode editorNode = new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));
            BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);
            BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
            byte[] bpmnBytes = xmlConverter.convertToXML(bpmnModel);

            ByteArrayInputStream in = new ByteArrayInputStream(bpmnBytes);
            IOUtils.copy(in, response.getOutputStream());
            String filename = bpmnModel.getMainProcess().getId() + ".bpmn20.xml";
            response.setHeader("Content-Disposition", "attachment; filename=" + filename);
            response.flushBuffer();
        } catch (Exception e) {
            log.error("导出model的xml文件失败：modelId=" + modelId, e);
        }
    }

    @At("/delete/?")
    @Ok("json")
    public Map<String, Object> delete(String modelId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Model modelData = repositoryService.getModel(modelId);
            if (Strings.isNotBlank(modelData.getDeploymentId())) {
                repositoryService.deleteDeployment(modelData.getDeploymentId(),true);
            }
            repositoryService.deleteModel(modelId);
            map.put("errcode", 0);
            map.put("errmsg", "删除成功，模型ID=" + modelId);
        } catch (Exception e) {
            map.put("errcode", 1);
            map.put("errmsg", "删除模型失败：modelId=" + modelId + "\r\n" + e.getMessage());
        }
        return map;
    }

    @At
    @Ok("json")
    public Map<String, Object> list(@Param("categoryId") String categoryId, @Param("page") int curPage, @Param("rows") int pageSize, @Param("keyword") String keyword) {
        List<Model> list;
        long total;
        ModelQuery modelQuery = repositoryService.createModelQuery();
        ModelQuery modelQuery2;
        if (!Strings.isEmpty(categoryId) && !Strings.isEmpty(keyword)) {
            modelQuery2 = modelQuery.modelCategory(categoryId).modelNameLike(keyword);
        } else if (!Strings.isEmpty(categoryId)) {
            modelQuery2 = modelQuery.modelCategory(categoryId);
        } else if (!Strings.isEmpty(keyword)) {
            modelQuery2 = modelQuery.modelNameLike(keyword);
        } else {
            modelQuery2 = modelQuery;
        }
        total = modelQuery2.count();
        list = modelQuery2.orderByCreateTime().desc().listPage((curPage - 1) * pageSize, pageSize);
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("total", total);
        obj.put("rows", list);
        return obj;
    }

    @At
    @Ok("raw")
    public String category(HttpSession session, @Param("id") String id) {
        Condition cnd;
        List<Object> array = new ArrayList<Object>();
        if (Strings.isBlank(id)) {
            Map<String, String> jsonroot = new HashMap<String, String>();
            jsonroot.put("id", "L1");
            jsonroot.put("pId", "");
            jsonroot.put("name", "流程分类");
            jsonroot.put("url", "javascript:view(\"\")");
            jsonroot.put("target", "_self");
            jsonroot.put("icon", Globals.APP_BASE_NAME
                    + "/images/icons/icon042a1.gif");
            array.add(jsonroot);
            cnd = Cnd.where("length(id)", "=", 4).asc("location").asc("id");

        } else {
            cnd = Cnd.where("id", "like", id + "____").asc("location").asc("id");

        }
        List<Wf_model_category> list = daoCtl.list(dao, Wf_model_category.class, cnd);
        for (int i = 0; i < list.size(); i++) {
            Wf_model_category ch = list.get(i);
            boolean sign = false;
            String pid = ch.getId().substring(0, ch.getId().length() - 4);
            if (i == 0 || "".equals(pid))
                pid = "0";
            int num = daoCtl.getRowCount(dao, Wf_model_category.class, Cnd.where("id", "like", ch.getId() + "____"));
            if (num > 0)
                sign = true;
            Map<String, Object> obj = new HashMap<String, Object>();
            obj.put("id", ch.getId());
            obj.put("pId", pid);
            obj.put("isParent", sign);
            obj.put("name", ch.getName());
            obj.put("url", "javascript:view(\"" + ch.getId() + "\")");
            obj.put("target", "_self");
            array.add(obj);
        }
        return Json.toJson(array);
    }


}
