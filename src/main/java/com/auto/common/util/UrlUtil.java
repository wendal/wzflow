package com.auto.common.util;

import org.nutz.http.Request;
import org.nutz.http.Response;
import org.nutz.http.Sender;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.lang.Encoding;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.repo.Base64;

import javax.servlet.ServletInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Wizzer on 14-3-8.
 */
@IocBean
public class UrlUtil {
    private final static Log log = Logs.get();
    public static void main(String[] args) {
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("url", "http://mp.weixin.qq.com/s?__biz=MzA5MjEzOTM2NQ==&mid=204382550&idx=1&sn=ddee3dbb0c3306cbe2ebc4acd743bf27&3rd=MzA3MDU4NTYzMw==&scene=6#rd");
            map.put("code", "057e2c");
            String url = "http://wirank.com/public/api/wxnum";
            Request reqq = Request.create(url, Request.METHOD.POST);
            reqq.setData(Json.toJson(map));
            reqq.getHeader().set("Content-Type", "application/octet-stream");
            Response resp = Sender.create(reqq).send();
            if (resp.isOK()) {
                System.out.println(resp.getContent());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取一个网页全部内容
     */
    public String getOneHtml(final String htmlurl, String encoding) throws IOException {
        URL url;
        String temp;
        final StringBuffer sb = new StringBuffer();
        try {
            url = new URL(htmlurl);
            final BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), encoding));// 读取网页全部内容
            while ((temp = in.readLine()) != null) {
                sb.append(temp);
            }
            in.close();
        } catch (final MalformedURLException me) {
            log.error(me);
            throw me;
        } catch (final IOException e) {
            e.printStackTrace();
            throw e;
        }
        return sb.toString();
    }

    /**
     * 获取post参数值
     *
     * @param in
     * @return
     */
    public String readStreamParameter(ServletInputStream in) {
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(in));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(new String(Strings.sNull(line).getBytes(), Encoding.UTF8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer.toString();
    }

    /**
     * 获取post参数值
     *
     * @param in
     * @return
     */
    public String readStreamParameterBase64(ServletInputStream in) {
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(in));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(new String(Strings.sNull(line).getBytes(), Encoding.UTF8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return new String(Base64.decode(buffer.toString().getBytes()));
    }


    public String getStr(String res, String s, String e) {
        if (!Strings.isBlank(res)) {
            String sb = res.substring(res.indexOf(s) + s.length());
            int start = res.indexOf(s);
            int end = sb.indexOf(e);
            return res.substring(start + s.length(), start + s.length() + end);
        }
        return "";
    }
    /**
     * 解析出url参数中的键值对
     * 如 "index.jsp?Action=del&id=123"，解析出Action:del,id:123存入map中
     *
     * @param URL url地址
     * @return url请求参数部分
     */
    public Map<String, String> URLRequest(String URL) {
        Map<String, String> mapRequest = new HashMap<String, String>();
        String[] arrSplit = null;
        String strUrlParam = TruncateUrlPage(URL.replace("==", "%3D%3D"));
        if (strUrlParam == null) {
            return mapRequest;
        }
        //每个键值为一组
        arrSplit = strUrlParam.split("[&]");
        for (String strSplit : arrSplit) {
            String[] arrSplitEqual = null;
            arrSplitEqual = strSplit.split("[=]");

            //解析出键值
            if (arrSplitEqual.length > 1) {
                //正确解析
                mapRequest.put(arrSplitEqual[0], arrSplitEqual[1]);
            } else {
                if (arrSplitEqual[0] != "") {
                    //只有参数没有值，不加入
                    mapRequest.put(arrSplitEqual[0], "");
                }
            }
        }
        return mapRequest;
    }

    /**
     * 去掉url中的路径，留下请求参数部分
     *
     * @param strURL url地址
     * @return url请求参数部分
     */
    private String TruncateUrlPage(String strURL) {
        String strAllParam = null;
        String[] arrSplit = null;

        strURL = strURL.trim();

        arrSplit = strURL.split("[?]");
        if (strURL.length() > 1) {
            if (arrSplit.length > 1) {
                if (arrSplit[1] != null) {
                    strAllParam = arrSplit[1];
                }
            }
        }

        return strAllParam;
    }

}
