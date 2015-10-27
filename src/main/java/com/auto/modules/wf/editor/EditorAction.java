package com.auto.modules.wf.editor;

import com.auto.common.action.BaseAction;
import com.auto.common.filter.GlobalsFilter;
import com.auto.common.filter.UserLoginFilter;
import com.auto.common.util.UrlUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wizzer on 15-4-8.
 */
@IocBean
@At("/private/wf/model")
@Filters({@By(type = GlobalsFilter.class), @By(type = UserLoginFilter.class)})
public class EditorAction extends BaseAction {
    private final Log log = Logs.get();
    @Inject
    protected RepositoryService repositoryService;
    @Inject
    protected UrlUtil urlUtil;

    @At("/modeler")
    @Ok("vm:template.private.wf.modeler")
    public void modeler(@Param("modelId") String modelId, HttpServletRequest req) {
        req.setAttribute("modelId", modelId);
    }

    @At("/?/json")
    @Ok("raw")
    public ObjectNode getEditorJson(String modelId) {
        ObjectNode modelNode = null;

        Model model = repositoryService.getModel(modelId);

        if (model != null) {
            try {
                ObjectMapper objectMapper = new ObjectMapper();
                if (StringUtils.isNotEmpty(model.getMetaInfo())) {
                    modelNode = (ObjectNode) objectMapper.readTree(model.getMetaInfo());
                } else {
                    modelNode = objectMapper.createObjectNode();
                    modelNode.put(ModelDataJsonConstants.MODEL_NAME, model.getName());
                }
                modelNode.put(ModelDataJsonConstants.MODEL_ID, model.getId());
                ObjectNode editorJsonNode = (ObjectNode) objectMapper.readTree(
                        new String(repositoryService.getModelEditorSource(model.getId()), "utf-8"));
                modelNode.put("model", editorJsonNode);

            } catch (Exception e) {
                log.error("Error creating model JSON", e);
                throw new ActivitiException("Error creating model JSON", e);
            }
        }
        return modelNode;
    }

    @At("/?/save")
    @PUT
    @Ok("http:200")
    public void saveModel(String modelId, HttpServletRequest req) {
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            String body = urlUtil.readStreamParameter(req.getInputStream());
            String[] str = StringUtils.split(body, "&");
            for (int i = 0; i < str.length; i++) {
                String[] temp = StringUtils.split(str[i], "=");
                if (temp.length > 1) {
                    map.put(temp[0], URLDecoder.decode(temp[1], "utf-8"));
                } else {
                    map.put(temp[0], "");
                }
            }
            Model model = repositoryService.getModel(modelId);
            ObjectMapper objectMapper = new ObjectMapper();

            ObjectNode modelJson = (ObjectNode) objectMapper.readTree(model.getMetaInfo());

            modelJson.put(ModelDataJsonConstants.MODEL_NAME, Strings.sNull(map.get("name")));
            modelJson.put(ModelDataJsonConstants.MODEL_DESCRIPTION, Strings.sNull(map.get("description")));
            model.setMetaInfo(modelJson.toString());
            model.setName(Strings.sNull(map.get("name")));

            repositoryService.saveModel(model);

            repositoryService.addModelEditorSource(model.getId(), Strings.sNull(map.get("json_xml")).getBytes("utf-8"));

            InputStream svgStream = new ByteArrayInputStream(Strings.sNull(map.get("svg_xml")).getBytes("utf-8"));
            TranscoderInput input = new TranscoderInput(svgStream);

            PNGTranscoder transcoder = new PNGTranscoder();
            // Setup output
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            TranscoderOutput output = new TranscoderOutput(outStream);

            // Do the transformation
            transcoder.transcode(input, output);
            final byte[] result = outStream.toByteArray();
            repositoryService.addModelEditorSourceExtra(model.getId(), result);
            outStream.close();

        } catch (Exception e) {
            log.error("Error saving model", e);
            throw new ActivitiException("Error saving model", e);
        }
    }

    @At("/editor/stencilset")
     @Ok("json")
     public String getStencilset() {
        InputStream stencilsetStream = this.getClass().getClassLoader().getResourceAsStream("stencilset.json.bak");
        try {
            return IOUtils.toString(stencilsetStream);
        } catch (Exception e) {
            throw new ActivitiException("Error while loading stencil set", e);
        }
    }
}
