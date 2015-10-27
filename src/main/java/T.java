import com.auto.activiti.listener.ProxyTaskListener;
import com.auto.activiti.listener.ProxyUserTaskBpmnParseHandler;
import com.auto.activiti.listener.TaskCategoryTaskListener;
import com.auto.activiti.parser.CustomBpmnParser;
import com.auto.common.util.DateUtil;
import com.auto.modules.sys.bean.Sys_role;
import com.auto.modules.sys.bean.Sys_user;
import com.auto.modules.sys.bean.Sys_user_role;
import com.auto.modules.wf.bean.Wf_hi_activity;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.parse.BpmnParseHandler;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.castor.Castors;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.Ioc;
import org.nutz.ioc.impl.NutIoc;
import org.nutz.ioc.loader.combo.ComboIocLoader;
import org.nutz.json.Json;
import org.nutz.lang.Each;
import org.nutz.lang.Files;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;

import javax.sql.DataSource;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by wizzer on 2015/5/13.
 */
public class T {
    public static void main(String[] args) {
        int count1=18;
        int count2=121212;
        int pageSize=10;
        for(int pageNum=1;pageNum<7;pageNum++){
            System.out.println("page::"+pageNum+"\n\r");

            if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 0 && count1 < pageNum * pageSize) {
                System.out.println("listpage1_1::"+(pageNum-1)*pageSize+","+pageSize+"\n\r");
                System.out.println("listpage2_1::0,"+ (int) (pageNum * pageSize - count1));
            } else if (count1 > 0 && (pageNum - 1) * pageSize / count1 >0) {
                System.out.println("listpage2_2::"+(int) ((pageNum - 1) * pageSize % count1)+","+pageSize);
            }else if (count1 == 0) {
                System.out.println("listpage2_3::"+(int)(pageNum-1)*pageSize+","+pageSize);

            }else {

                System.out.println("listpage1::"+(pageNum-1)*pageSize+","+pageSize+"\n\r");
            }
            System.out.println("------------------------------\n\r");

        }
//        Set<String> result = new HashSet<>();
//        Set<String> set1 = new HashSet<String>(){{
//            add("1");
//            add("2");
//            add("3");
//        }};
//
//        Set<String> set2 = new HashSet<String>(){{
//            add("1");
//            add("2");
//            add("3");
//            add("4");
//            add("4");
//            add("4");
//            add("4");
//        }};
//
//        result.clear();
//        result.addAll(set1);
//        result.retainAll(set2);
//        Iterator<String> iterator=set2.iterator();
//        while(iterator.hasNext()){
//            System.out.println(iterator.next());
//        }
//        System.out.println("交集：" + result);
//
//        result.clear();
//        result.addAll(set1);
//        result.removeAll(set2);
//        System.out.println("差集："+result);
//
//        result.clear();
//        result.addAll(set1);
//        result.addAll(set2);
//        System.out.println("并集："+result);
//        NutMap map1=new NutMap();
//        map1.setv("aa", "aa");
//        map1.setv("b", "b");
//        map1.setv("c", "cc");
//        NutMap map2=new NutMap();
//        map2.setv("c", "cc");
//        map2.setv("b", "b");
//
//        NutMap map=new NutMap();
//        Set<String> key = map2.keySet();
//        for (Iterator it = key.iterator(); it.hasNext();) {
//            String s = (String) it.next();
//            if(map1.get(s)!=null){
//                map.put(s,map2.get(s));
//            }
//        }
//        System.out.println(Json.toJson(map));
//        String s="join:667505:join:667505:e:1432275044537-2:1432275052219-3";
//        Pattern p = Pattern.compile("join:\\d+:([a-zA-Z_]+):\\d+\\-\\d+");
//        Matcher m = p.matcher(s);
//        if(m.find()) {
//            System.out.println(m.group(1));
//        }
//        try {
//            ComboIocLoader loader = new ComboIocLoader(
//                    new String[]{
//                            "*org.nutz.ioc.loader.json.JsonLoader", "config/",
//                            "*org.nutz.ioc.loader.annotation.AnnotationIocLoader", "com.auto"}
//            );
//            Ioc ioc = new NutIoc(loader);
//            Dao dao = ioc.get(Dao.class);



//            Sql sql = Sqls.create("insert into ACT_HI_PROCINST(ID_,PROC_INST_ID_,PROC_DEF_ID_,START_TIME_,END_TIME_,DURATION_,START_ACT_ID_,END_ACT_ID_)" +
//                    "values(@id,@id,'chedaitest:1:27504',systimestamp,systimestamp,0,'sid-D2A365DD-DA0D-480F-A467-9BE0055F9A65','sid-6550D146-593D-4A28-A3F9-497604F14D5C')");
//            Sql sql1 = Sqls.create("insert into ACT_HI_IDENTITYLINK(ID_,TYPE_,USER_ID_,PROC_INST_ID_) values(@a,'participant',@b,@id)");
//            Sql sql2 = Sqls.create("insert into ACT_HI_TASKINST(ID_,PROC_DEF_ID_,TASK_DEF_KEY_,PROC_INST_ID_,EXECUTION_ID_,NAME_,ASSIGNEE_,START_TIME_,CLAIM_TIME_,END_TIME_,DURATION_," +
//                    "DELETE_REASON_,PRIORITY_,CATEGORY_) values(@a,'chedaitest:1:27504',@b,@c,@d,@e,@f,systimestamp,systimestamp,systimestamp,0,@g,50,'0001')");
//            Sql sql3 = Sqls.create("insert into ACT_HI_ACTINST(ID_,PROC_DEF_ID_,PROC_INST_ID_,EXECUTION_ID_,ACT_ID_,TASK_ID_,ACT_NAME_,ACT_TYPE_,ASSIGNEE_," +
//                    "START_TIME_,END_TIME_,DURATION_) values(@a,'chedaitest:1:27504',@b,@c,@d,@e,@f,@g,@h,systimestamp,systimestamp,0)");
//            int k=0;
//            for (int j = 0; j < 10; j++) {
//                for (int i = 0; i < 10000; i++) {
//                    k++;
//                    long id = 100000L + k * 1000;
//                    System.out.println(id + ":" + ((System.currentTimeMillis() - a) / 1000) + "s");
//                    System.out.println("k:"+k);
//
//                    String PROC_INST_ID_ = Long.toString(id);//"999990";
//                    //ACT_HI_PROCINST
//
//                    sql.params().set("id", PROC_INST_ID_);
//                    sql.addBatch();
//                    //ACT_HI_IDENTITYLINK
//                    sql1.params().set("a", Long.toString(id + 17));//1000007
//                    sql1.params().set("b", "1");
//                    sql1.params().set("id", PROC_INST_ID_);
//                    sql1.addBatch();
//                    sql1.params().set("a", Long.toString(id + 99));//1000089
//                    sql1.params().set("b", "2");
//                    sql1.params().set("id", PROC_INST_ID_);
//                    sql1.addBatch();
//                    //ACT_HI_TASKINST
//                    sql2.params().set("a", Long.toString(id + 3));//999993
//                    sql2.params().set("b", "yewushenqing");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "业务申请");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 76));//1000066
//                    sql2.params().set("b", "yewuchushen");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", Long.toString(id + 63));//1000053
//                    sql2.params().set("e", "业务初审");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 97));//1000087
//                    sql2.params().set("b", "yewuchushen");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", Long.toString(id + 63));//1000053  999990
//                    sql2.params().set("e", "业务初审");
//                    sql2.params().set("f", "2");
//                    sql2.params().set("g", "deleted");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 150));//1000140
//                    sql2.params().set("b", "cheliangpinggu");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "车辆评估");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 249));//1000239
//                    sql2.params().set("b", "zhongshenshenpi");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "终审审批");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 348));//1000338
//                    sql2.params().set("b", "qiantitiaojiaoluoshi");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "前提条件落实");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 377));//1000367 999990
//                    sql2.params().set("b", "luoshifuhe");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "落实复核");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 402));//1000392
//                    sql2.params().set("b", "hetongguanli");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "合同管理");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 430));//1000420
//                    sql2.params().set("b", "diyadengji");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", Long.toString(id + 427));//1000417
//                    sql2.params().set("e", "抵押登记");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 436));//1000426 999990
//                    sql2.params().set("b", "hetonggongzheng");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", Long.toString(id + 428));//1000418
//                    sql2.params().set("e", "抵押登记");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 601));//1000591
//                    sql2.params().set("b", "fangkuanshencha");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "放款审查");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    sql2.params().set("a", Long.toString(id + 648));//1000638
//                    sql2.params().set("b", "caiwufangkuan");
//                    sql2.params().set("c", PROC_INST_ID_);
//                    sql2.params().set("d", PROC_INST_ID_);
//                    sql2.params().set("e", "财务放款");
//                    sql2.params().set("f", "1");
//                    sql2.params().set("g", "completed");
//                    sql2.addBatch();
//                    //ACT_HI_ACTINST
//
//                    sql3.params().set("a", Long.toString(id + 1));//999991
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "sid-D2A365DD-DA0D-480F-A467-9BE0055F9A65");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "startEvent");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + 2));//999992
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "yewushenqing");
//                    sql3.params().set("e", Long.toString(id + 3));//999993
//                    sql3.params().set("f", "业务申请");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + 59));//1000049 999990
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + 57));//1000047
//                    sql3.params().set("d", "yewuchushen");
//                    sql3.params().set("e", Long.toString(id + 76));//1000066
//                    sql3.params().set("f", "业务初审");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000086 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + (1000054 - 999990)));
//                    sql3.params().set("d", "yewuchushen");
//                    sql3.params().set("e", Long.toString(id + (1000087 - 999990)));
//                    sql3.params().set("f", "业务初审");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "2");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000139 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "cheliangpinggu");
//                    sql3.params().set("e", Long.toString(id + (1000140 - 999990)));
//                    sql3.params().set("f", "车辆评估");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000237 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "sid-FA82D982-D53D-45E1-B735-90CFCD087038");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "exclusiveGateway");
//                    sql3.params().set("h", "");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000238 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "zhongshenshenpi");
//                    sql3.params().set("e", Long.toString(id + (1000239 - 999990)));
//                    sql3.params().set("f", "终审审批");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000337 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "qiantitiaojiaoluoshi");
//                    sql3.params().set("e", Long.toString(id + (1000338 - 999990)));
//                    sql3.params().set("f", "前提条件落实");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000366 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "luoshifuhe");
//                    sql3.params().set("e", Long.toString(id + (1000367 - 999990)));
//                    sql3.params().set("f", "落实复核");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000391 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "hetongguanli");
//                    sql3.params().set("e", Long.toString(id + (1000392 - 999990)));
//                    sql3.params().set("f", "合同管理");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000416 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "sid-D27A8B64-455B-4595-8B6C-BD5FE4749C08");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "parallelGateway");
//                    sql3.params().set("h", "");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000419 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + (1000417 - 999990)));
//                    sql3.params().set("d", "diyadengji");
//                    sql3.params().set("e", Long.toString(id + (1000420 - 999990)));
//                    sql3.params().set("f", "抵押登记");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000496 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + (1000417 - 999990)));
//                    sql3.params().set("d", "sid-8F9CDED6-D50D-4A80-A652-D9A9CECDD1DE");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "parallelGateway");
//                    sql3.params().set("h", "");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000425 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + (1000418 - 999990)));
//                    sql3.params().set("d", "hetonggongzheng");
//                    sql3.params().set("e", Long.toString(id + (1000426 - 999990)));
//                    sql3.params().set("f", "合同公证");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000584 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", Long.toString(id + (1000418 - 999990)));
//                    sql3.params().set("d", "sid-8F9CDED6-D50D-4A80-A652-D9A9CECDD1DE");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "parallelGateway");
//                    sql3.params().set("h", "");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000590 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "fangkuanshencha");
//                    sql3.params().set("e", "1000591");
//                    sql3.params().set("f", "放款审查");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000637 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "caiwufangkuan");
//                    sql3.params().set("e", Long.toString(id + (1000638 - 999990)));
//                    sql3.params().set("f", "放款审查");
//                    sql3.params().set("g", "userTask");
//                    sql3.params().set("h", "1");
//                    sql3.addBatch();
//                    sql3.params().set("a", Long.toString(id + (1000728 - 999990)));
//                    sql3.params().set("b", PROC_INST_ID_);
//                    sql3.params().set("c", PROC_INST_ID_);
//                    sql3.params().set("d", "sid-6550D146-593D-4A28-A3F9-497604F14D5C");
//                    sql3.params().set("e", "");
//                    sql3.params().set("f", "");
//                    sql3.params().set("g", "endEvent");
//                    sql3.params().set("h", "");
//                    sql3.addBatch();
//
//                }
//                Files.write("D:/1.txt", sql.toString());
//                dao.execute(sql);
//                break;
//                dao.execute(sql1);
//                dao.execute(sql2);
//                dao.execute(sql3);
//                sql.clearBatch();
//                sql1.clearBatch();
//                sql2.clearBatch();
//                sql3.clearBatch();
//            }

//
//            for(int i=16063;i<20006;i++) {
//                Sys_user user = new Sys_user();
//                user.setLoginname("user" + i);
//                user.setRealname("user"+i);
//                RandomNumberGenerator rng = new SecureRandomNumberGenerator();
//                String salt = rng.nextBytes().toBase64();
//                String hashedPasswordBase64 = new Sha256Hash("11", salt, 1024).toBase64();
//                user.setPassword(hashedPasswordBase64);
//                user.setSalt(salt);
//                user.setLogintime(DateUtil.getCurDateTime());
//                user.setUnitid("0001");
//                dao.insert(user);
//                //初始化角色表
//                Sys_user_role role = new Sys_user_role();
//                role.setRoleid(2);
//                role.setUserid(user.getId());
//                dao.insert(role);
//            }
//        } catch (Exception e) {
//
//        }
    }
}
