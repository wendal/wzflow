package com.auto.modules.wf;

import com.auto.activiti.cmd.*;
import com.auto.common.action.BaseAction;
import com.auto.common.util.DateUtil;
import com.auto.common.util.StringUtil;
import com.auto.modules.wf.bean.Wf_test;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmActivity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.pvm.process.ProcessDefinitionImpl;
import org.activiti.engine.impl.pvm.process.TransitionImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.context.Context;
import org.apache.velocity.runtime.RuntimeServices;
import org.apache.velocity.runtime.RuntimeSingleton;
import org.apache.velocity.runtime.parser.node.SimpleNode;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.sql.Sql;
import org.nutz.http.Http;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Files;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.*;
import java.util.concurrent.*;

/**
 * Created by wizzer on 15-4-16.
 */
@IocBean
@At("/test")
public class TestAction extends BaseAction {
    private final Log log = Logs.get();
    @Inject
    Dao dao;
    @Inject
    FormService formService;
    @Inject
    IdentityService identityService;
    @Inject
    RepositoryService repositoryService;
    @Inject
    RuntimeService runtimeService;
    @Inject
    TaskService taskService;
    @Inject
    HistoryService historyService;
    @Inject
    ManagementService managementService;
    @Inject
    ProcessEngine processEngine;

    @At
    @Ok("raw")
    public Object ooo(){
        taskService.createTaskQuery().taskCandidateUser("1").list();
        return taskService.createTaskQuery().taskCandidateOrAssigned("1").list();
    }
    class MyThread1 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread1(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread1:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            if (isComplete) {
                Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task.getId(), uid);
            }
        }
    }

    class MyThread2 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread2(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread2:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)

            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task2.getId());
            if (isComplete) {
                Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task3.getId(), uid);
            }
            //车辆评估
        }
    }


    class MyThread3 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread3(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread3:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.complete(task3.getId(), map1, false);
            //终审审批
            if (isComplete) {
                Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task4.getId(), uid);
            }

        }
    }

    class MyThread4 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread4(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread4:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.addComment(task3.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task3.getId(), map1, false);
            //终审审批
            Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task4.getId(), uid);
            taskService.addComment(task4.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task4.getId());
            //前提条件落实
            if (isComplete) {
                Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task5.getId(), uid);
            }

        }
    }

    class MyThread5 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread5(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {

            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread5:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.complete(task3.getId(), map1, false);
            //终审审批
            Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task4.getId(), uid);
            taskService.addComment(task4.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task4.getId());
            //前提条件落实
            Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task5.getId(), uid);
            taskService.addComment(task5.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task5.getId());
            //落实复核
            if (isComplete) {
                Task task6 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task6.getId(), uid);
            }
        }
    }

    class MyThread6 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread6(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread6:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");

            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.addComment(task3.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task3.getId(), map1, false);
            //终审审批
            Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task4.getId(), uid);
            taskService.addComment(task4.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task4.getId());
            //前提条件落实
            Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task5.getId(), uid);
            taskService.addComment(task5.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task5.getId());
            //落实复核
            Task task6 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task6.getId(), uid);
            taskService.addComment(task6.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task6.getId());
            //合同管理
            if (isComplete) {
                Task task7 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task7.getId(), uid);
            }

        }
    }

    class MyThread7 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread7(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {

            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread7:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.addComment(task.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.addComment(task3.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task3.getId(), map1, false);
            //终审审批
            Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task4.getId(), uid);
            taskService.addComment(task4.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task4.getId());
            //前提条件落实
            Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task5.getId(), uid);
            taskService.addComment(task5.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task5.getId());
            //落实复核
            Task task6 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task6.getId(), uid);
            taskService.addComment(task6.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task6.getId());
            //合同管理
            Task task7 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task7.getId(), uid);
            taskService.addComment(task7.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task7.getId());
            //并行网关
            if (isComplete) {
                List<Task> list = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).list();
                for (Task t : list) {
                    taskService.claim(t.getId(), uid);
                }
            }


        }
    }

    class MyThread8 implements Runnable {
        String uid;
        boolean isComplete = false;

        public MyThread8(String uid, boolean isComplete) {
            this.uid = uid;
            this.isComplete = isComplete;
        }

        public void run() {

            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
            log.info("MyThread8:::[" + uid + "]:::" + processInstance.getId());
            //业务申请
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task.getId(), uid);
            NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
            taskService.complete(task.getId(), map1, false);
            //业务初审(会签)
            Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
            taskService.addComment(task2.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task2.getId());
            //车辆评估
            Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task3.getId(), uid);
            map1.setv("_flow_type", "zhongshenshenpi");
            taskService.complete(task3.getId(), map1, false);
            //终审审批
            Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task4.getId(), uid);
            taskService.addComment(task4.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task4.getId());
            //前提条件落实
            Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task5.getId(), uid);
            taskService.addComment(task5.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task5.getId());
            //落实复核
            Task task6 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task6.getId(), uid);
            taskService.addComment(task6.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task6.getId());
            //合同管理
            Task task7 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
            taskService.claim(task7.getId(), uid);
            taskService.addComment(task7.getId(), processInstance.getId(), "请尽快完成");
            taskService.complete(task7.getId());
            //并行网关
            List<Task> list = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).list();
            for (Task t : list) {
                taskService.claim(t.getId(), uid);
                taskService.addComment(t.getId(), processInstance.getId(), "请尽快完成");

                taskService.complete(t.getId());
            }
            //放款审查
            if (isComplete) {
                Task task8 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task8.getId(), uid);
            }


        }
    }

    class MyThread11 extends Thread {
        String uid;

        public MyThread11(String uid) {
            this.uid = uid;
        }

        public void run() {
            for (int i = 20010; i < 30010; i++) {
                uid = String.valueOf(i);
                ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("chedaitest");
                log.info("MyThread3:::[" + i + "]:::" + processInstance.getId());

                //业务申请
                Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task.getId(), uid);
                NutMap map1 = Json.fromJson(NutMap.class, "{users:[\"" + uid + "\"]}");
                taskService.complete(task.getId(), map1, false);
                //业务初审(会签)
                Task task2 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskAssignee(uid).singleResult();
                taskService.complete(task2.getId());
                //车辆评估
                Task task3 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task3.getId(), uid);
                map1.setv("_flow_type", "zhongshenshenpi");
                taskService.complete(task3.getId(), map1, false);
                //终审审批
                Task task4 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task4.getId(), uid);
                taskService.complete(task4.getId());
                //前提条件落实
                Task task5 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task5.getId(), uid);
                taskService.complete(task5.getId());
                //落实复核
                Task task6 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(uid).singleResult();
                taskService.claim(task6.getId(), uid);
                taskService.complete(task6.getId());
                //合同管理
                Task task7 = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser("1").singleResult();
                taskService.claim(task7.getId(), uid);
//                taskService.complete(task7.getId());
//                //并行网关
//                List<Task> list=taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser("1").list();
//                for(Task t:list){
//                    taskService.claim(t.getId(), "1");
//                    taskService.complete(t.getId());
//                }
//                //放款审查
//                Task task8= taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser("1").singleResult();
//                taskService.claim(task8.getId(), "1");
//                taskService.complete(task8.getId());
//                //财务放款
//                Task task9= taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser("1").singleResult();
//                taskService.claim(task9.getId(), "1");
//                taskService.complete(task9.getId());

            }
        }

    }

    class MyThreadDEL implements Runnable {
        int num1;
        int num2;

        public MyThreadDEL(int num1, int num2) {
            this.num1 = num1;
            this.num2 = num2;
        }

        public void run() {
            QueryResult queryResult = daoCtl.listPageSql(dao, Sqls.create("select PROC_INST_ID_ as C FROM ACT_RU_TASK "), num1, num2, 2);
            for (Record m : queryResult.getList(Record.class)) {
                log.info("PROC_INST_ID::" + m.getString("C"));
                runtimeService.deleteProcessInstance(m.getString("C"), "结束");
            }
        }
    }

    @At
    @Ok("raw")
    public void a(@Param("num1") int num1, @Param("num2") int num2) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        for (int i = 0; i < num2; i++) {
            MyThreadDEL d = new MyThreadDEL(num1, 10000);
            executor.execute(d);
        }
        executor.shutdown();
    }

    @At
    @Ok("raw")
    public Object mk(@Param("num1") int num1, @Param("num2") int num2) {
        long a = System.currentTimeMillis();
        try {
//            ThreadPoolExecutor executor = new ThreadPoolExecutor(5, num2, 10, TimeUnit.DAYS,
//                    new SynchronousQueue<Runnable>(true));
            ExecutorService executor = Executors.newSingleThreadExecutor();
            for (int i = num1; i < num2; i++) {
                MyThread1 myTask1 = new MyThread1(String.valueOf(i), false);
                MyThread1 myTask1_ = new MyThread1(String.valueOf(i), true);
                executor.execute(myTask1);
                executor.execute(myTask1_);
                MyThread2 myTask2 = new MyThread2(String.valueOf(i), false);
                MyThread2 myTask2_ = new MyThread2(String.valueOf(i), true);
                executor.execute(myTask2);
                executor.execute(myTask2_);
                MyThread3 myTask3 = new MyThread3(String.valueOf(i), false);
                MyThread3 myTask3_ = new MyThread3(String.valueOf(i), true);
                executor.execute(myTask3);
                executor.execute(myTask3_);
                MyThread4 myTask4 = new MyThread4(String.valueOf(i), false);
                MyThread4 myTask4_ = new MyThread4(String.valueOf(i), true);
                executor.execute(myTask4);
                executor.execute(myTask4_);
                MyThread5 myTask5 = new MyThread5(String.valueOf(i), false);
                MyThread5 myTask5_ = new MyThread5(String.valueOf(i), true);
                executor.execute(myTask5);
                executor.execute(myTask5_);
                MyThread6 myTask6 = new MyThread6(String.valueOf(i), false);
                MyThread6 myTask6_ = new MyThread6(String.valueOf(i), true);
                executor.execute(myTask6);
                executor.execute(myTask6_);

                MyThread7 myTask7 = new MyThread7(String.valueOf(i), false);
                MyThread7 myTask7_ = new MyThread7(String.valueOf(i), true);
                executor.execute(myTask7);
                executor.execute(myTask7_);
                MyThread8 myTask8 = new MyThread8(String.valueOf(i), false);
                MyThread8 myTask8_ = new MyThread8(String.valueOf(i), true);
                executor.execute(myTask8);
                executor.execute(myTask8_);

//                System.out.println("PoolSize::" + executor.getPoolSize() + ",QueueSize::" +
//                        executor.getQueue().size() + ",CompletedTaskCount::" + executor.getCompletedTaskCount());
            }
            executor.shutdown();
        } catch (Exception e) {
            log.info(e.getMessage());
        }
        return "end::" + ((System.currentTimeMillis() - a) / 1000) + "s";
    }


    @At
    @Ok("json")
    public Object t2(@Param("taskId") String taskId) {
        Command<NutMap> cmd = new JoinTaskCmd(false, taskId, new String[]{"1", "2"});
        return managementService.executeCommand(cmd);
    }

    @At
    @Ok("json")
    public Object t3(@Param("taskId") String taskId) {
        Command<NutMap> cmd = new JoinTaskCmd(true, taskId, new String[]{"1", "2"});
        return managementService.executeCommand(cmd);
    }

    //回退上一节点
    @At
    @Ok("json")
    public Object test1(@Param("taskId") String taskId) {
        Command<NutMap> cmd = new RollbackTaskCmd(taskId);
        return managementService.executeCommand(cmd);
    }

    //回退指定节点
    @At
    @Ok("json")
    public Object test3(@Param("taskId") String taskId,@Param("userId") String userId, @Param("activityId") String activityId) {
        taskService.setAssignee(taskId,userId);
        Command<NutMap> cmd = new RollbackTaskCmd(taskId, activityId);
        NutMap nutMap = managementService.executeCommand(cmd);
        int errcode = nutMap.getInt("errcode");
        boolean isParallel = nutMap.getBoolean("isParallel");
        if (errcode == 0 && isParallel) {
            Sql sql = nutMap.getAs("sql", Sql.class);
            daoCtl.exeUpdateBySql(dao, sql);
        }
        return nutMap;
    }

    //回退指定节点
    @At
    @Ok("json")
    public Object test33(@Param("taskId") String taskId, @Param("activityId") String activityId) {
        Command<NutMap> cmd = new RollbackTaskCmd(taskId, activityId, new String[]{"1", "2"});
        return managementService.executeCommand(cmd);
    }

    //自由跳转
    @At
    @Ok("json")
    public Object test2(@Param("taskId") String taskId, @Param("activityId") String activityId) {
        Command<NutMap> cmd = new JumpCmd(taskId, activityId);
        NutMap map = managementService.executeCommand(cmd);
        int errcode = map.getInt("errcode");
//        if (errcode == 0) {
//            List<Task> list = taskService.createTaskQuery().executionId(map.getString("executionId")).list();
//            for (Task task : list) {
//                taskService.complete(task.getId());
//            }
//        }
        return map;
    }

    //获取历史任务节点
    @At
    @Ok("json")
    public Object test4(@Param("taskId") String taskId) {
        Command<NutMap> cmd = new HistoryTaskCmd(taskId);
        return managementService.executeCommand(cmd);
    }

    @At
    public String test5(@Param("taskId") String taskId) {
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null)
            return "null";
        ProcessDefinitionEntity def = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService).getDeployedProcessDefinition(task.getProcessDefinitionId());
        List<ActivityImpl> activitiList = def.getActivities();

        NutMap map = new NutMap();
        map.setv("is", isParallelGatewayTask(task.getTaskDefinitionKey(), activitiList));
        return Json.toJson(map);
    }

    public boolean isParallelGatewayTask(String activityId, List<ActivityImpl> activitiList) {
        for (ActivityImpl activityImpl : activitiList) {
            if ("parallelGateway".equals(activityImpl.getProperty("type"))) {
                List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();
                for (PvmTransition pvmTransition : outgoingTransitions) {
                    PvmActivity ac = pvmTransition.getDestination();
                    if ("userTask".equals(ac.getProperty("type"))) {
                        System.out.println("|||" + ac.getId());
//                        list.add(ac.getId());
                    }
                    if (activityId.equals(ac.getId())) {
                        System.out.println("parallelGateway in::::" + activityImpl.getId());
                        System.out.println("ac id::::" + ac.getId());
                        List<PvmTransition> out = ac.getOutgoingTransitions();
                        for (PvmTransition o : out) {
                            PvmActivity a = o.getDestination();
                            if ("parallelGateway".equals(a.getProperty("type"))) {
                                System.out.println("parallelGateway out::::" + a.getId());
                            }
                        }
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static List<PvmActivity> getTaskActivitys(String activityId, List<ActivityImpl> activityList, int type, NutMap map) {
        List<PvmActivity> activitiyIds = new ArrayList<>();
        for (ActivityImpl activityImpl : activityList) {
            String id = activityImpl.getId();
            System.out.println("id!!!!!::" + id);

            if (activityId.equals(id)) {
                List<PvmTransition> incomingTransitions = activityImpl.getIncomingTransitions();//获取某节点所有线路
                List<NutMap> list = new ArrayList<>();
                for (PvmTransition tr : incomingTransitions) {
                    NutMap map1 = new NutMap();
                    PvmActivity ac = tr.getDestination();//获取线路的终点节点
                    System.out.println("id::" + ac.getId());
                    System.out.println("name::" + ac.getProperty("name"));
                    System.out.println("type::" + ac.getProperty("type"));
                    System.out.println("---------------------------");
                    if (ac.getProperty("type").equals("userTask")) {
                        getTaskActivitys(ac.getId(), activityList, type, map);
//
//                        map.setv("type", type++);
//                        map1.setv("id", ac.getId());
//                        map1.setv("name", ac.getProperty("name"));
//                        String conditionText=Strings.sNull(tr.getProperty("conditionText"));
//                        if(!Strings.isEmpty(conditionText)){
//                            map1.setv("conditionText",conditionText );
//                        }
//                        list.add(map1);
                    } else if (ac.getProperty("type").equals("exclusiveGateway")) {
//                        getTaskActivitys(ac.getId(), activityList, type, map);
                    } else {
                        map.setv("type", type++);
                        break;
                    }
                }
                if (list.size() > 0)
                    map.addv("list", list);
                break;
            }
        }
        return activitiyIds;
    }

    @At("/test6")
    //回退到指定节点
    public String rollBackToAssignWorkFlow(@Param("taskId") String taskId, @Param("destTaskkey") String destTaskkey) {
        this.taskService = processEngine.getTaskService();
        this.historyService = processEngine.getHistoryService();
        this.repositoryService = processEngine.getRepositoryService();
        this.runtimeService = processEngine.getRuntimeService();
        try {
            Map<String, Object> variables;
            // 取得当前任务.当前任务节点
            HistoricTaskInstance currTask = historyService
                    .createHistoricTaskInstanceQuery().taskId(taskId)
                    .singleResult();
            // 取得流程实例，流程实例
            ProcessInstance instance = runtimeService
                    .createProcessInstanceQuery()
                    .processInstanceId(currTask.getProcessInstanceId())
                    .singleResult();
            if (instance == null) {
                log.info("流程结束");
                log.error("出错啦！流程已经结束");
                return "ERROR";
            }
            variables = instance.getProcessVariables();
            // 取得流程定义
            ProcessDefinitionEntity definition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                    .getDeployedProcessDefinition(currTask
                            .getProcessDefinitionId());
            if (definition == null) {
                log.info("流程定义未找到");
                log.error("出错啦！流程定义未找到");
                return "ERROR";
            }
            //取得当前活动节点
            ActivityImpl currActivity = ((ProcessDefinitionImpl) definition)
                    .findActivity(currTask.getTaskDefinitionKey());

            log.info("currActivity" + currActivity);
            // 取得上一步活动
            //也就是节点间的连线
            //获取来源节点的关系
            List<PvmTransition> nextTransitionList = currActivity.getIncomingTransitions();
            // 清除当前活动的出口
            List<PvmTransition> oriPvmTransitionList = new ArrayList<PvmTransition>();
            //新建一个节点连线关系集合
            //获取出口节点的关系
            List<PvmTransition> pvmTransitionList = currActivity
                    .getOutgoingTransitions();
            //
            for (PvmTransition pvmTransition : pvmTransitionList) {
                oriPvmTransitionList.add(pvmTransition);
            }
            pvmTransitionList.clear();

            // 建立新出口
            List<TransitionImpl> newTransitions = new ArrayList<TransitionImpl>();
            for (PvmTransition nextTransition : nextTransitionList) {
                PvmActivity nextActivity = nextTransition.getSource();

                log.info("nextActivity" + nextActivity);

                log.info("nextActivity.getId()" + nextActivity.getId());

                //destTaskkey
                ActivityImpl nextActivityImpl = ((ProcessDefinitionImpl) definition)
                        // .findActivity(nextActivity.getId());
                        .findActivity(destTaskkey);
                TransitionImpl newTransition = currActivity
                        .createOutgoingTransition();
                newTransition.setDestination(nextActivityImpl);
                newTransitions.add(newTransition);
            }
            // 完成任务
            List<Task> tasks = taskService.createTaskQuery()
                    .processInstanceId(instance.getId())
                    .taskDefinitionKey(currTask.getTaskDefinitionKey()).list();
            for (Task task : tasks) {
                taskService.complete(task.getId(), variables);
//                historyService.deleteHistoricTaskInstance(task.getId());
            }
            // 恢复方向
            for (TransitionImpl transitionImpl : newTransitions) {
                currActivity.getOutgoingTransitions().remove(transitionImpl);
            }
            for (PvmTransition pvmTransition : oriPvmTransitionList) {

                pvmTransitionList.add(pvmTransition);
            }
            log.info("OK");
            log.info("流程结束");

            return "SUCCESS";
        } catch (Exception e) {
            log.error("失败");
            log.error(e.getMessage());
            return "ERROR";
        }
    }

    @At
    public String start(@Param("flowKey") String flowKey, @Param("userId") String userId, @Param("param") String json) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            Map<String, Object> p = null;
            if (!Strings.isEmpty(json)) {
                p = Json.fromJson(Map.class, json);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey, p);
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(userId).singleResult();
            taskService.claim(task.getId(), userId);
            map.put("errcode", 0);
            map.put("errmsg", "");
            map.put("processInstanceId", processInstance.getId());
            map.put("taskId", task.getId());
            map.put("formKey", task.getFormKey());
            map.put("taskKey", task.getTaskDefinitionKey());
        } catch (Exception e) {
            log.error("WebServcice启动表单流程出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At
    public String start1(@Param("flowKey") String flowKey, @Param("userId") String userId, @Param("param") String json) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            Map<String, Object> p = null;
            if (!Strings.isEmpty(json)) {
                p = Json.fromJson(Map.class, json);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey, p);
            map.put("errcode", 0);
            map.put("errmsg", "");
            map.put("processInstanceId", processInstance.getId());
        } catch (Exception e) {
            log.error("WebServcice启动表单流程出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At
    @Ok("raw")
    public String listWaiting2(@Param("category") String category, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) {
        NutMap re = new NutMap();
        try {
            long total;
            long a = System.currentTimeMillis();
            TaskQuery query1 = taskService.createTaskQuery().taskCategory(category).taskAssignee(userId).orderByTaskCreateTime().desc();
            log.info("a:::" + (System.currentTimeMillis() - a));
            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
            group_sql.params().set("userid", userId);
//            List<String> groupIds=daoCtl.getStrRowValues(dao, group_sql);
            TaskQuery query2 = taskService.createTaskQuery().taskCategory(category).taskCandidateUser(userId).orderByTaskCreateTime().desc();

            long count1 = query1.count();
            log.info("b:::" + (System.currentTimeMillis() - a));

            long count2 = query2.count();
            log.info("c:::" + (System.currentTimeMillis() - a));

            List<Task> list1 = null;
            log.info("d:::" + (System.currentTimeMillis() - a));

            List<Task> list2 = null;
            if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 0 && count1 < pageNum * pageSize) {
                list1 = query1.listPage((pageNum - 1) * pageSize, pageSize);
                list2 = query2.listPage(0, (int) (pageNum * pageSize - count1));
            } else if (count1 > 0 && (pageNum - 1) * pageSize / count1 > 0) {
                list2 = query2.listPage((int) ((pageNum - 1) * pageSize % count1), pageSize);
            } else if (count1 == 0) {
                list2 = query2.listPage((pageNum - 1) * pageSize, pageSize);
            } else {
                list1 = query1.listPage((pageNum - 1) * pageSize, pageSize);
            }
            log.info("e:::" + (System.currentTimeMillis() - a));
            total = count1 + count2;
            List<Task> list = new ArrayList<>();
            if (list1 != null) {
                list.addAll(list1);
            }
            if (list2 != null) {
                list.addAll(list2);
            }
            log.info("e:::" + (System.currentTimeMillis() - a));

            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("total", total);
            re.setv("list", list);
        } catch (Exception e) {

        }
        return Json.toJson(re, JsonFormat.compact());
    }

    @At
    @Ok("raw")
    public String listWaiting(@Param("category") String category, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) {
        NutMap re = new NutMap();
        try {
            long a = System.currentTimeMillis();
            //查询分组
            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
            group_sql.params().set("userid", userId);
            List<String> groupIds = daoCtl.getStrRowValues(dao, group_sql);
            log.info("a:::" + (System.currentTimeMillis() - a));

            String gStr="";
            for(String gid:groupIds){
                gStr+=" OR ASSIGNEE_='ROLE("+gid+")'";
            }
            Sql count_sql=Sqls.create("SELECT COUNT(1) FROM act_ru_task WHERE CATEGORY_=@c AND ( ASSIGNEE_=@d  $s )");
            count_sql.params().set("c",category);
            count_sql.params().set("d", userId);
            count_sql.vars().set("s", gStr);
            int total = daoCtl.getIntRowValue(dao, count_sql);
            log.info("b:::" + (System.currentTimeMillis() - a));
            Sql task_sql=Sqls.create("SELECT * FROM act_ru_task WHERE CATEGORY_=@c AND ( ASSIGNEE_=@d  $s ) ORDER BY create_time_ desc");
            task_sql.params().set("c",category);
            task_sql.params().set("d", userId);
            task_sql.vars().set("s", gStr);
            List<Task> list=taskService.createNativeTaskQuery().sql(task_sql.toString()).listPage((pageNum - 1) * pageSize, pageSize);
            log.info("c:::" + (System.currentTimeMillis() - a));
            log.info("task_sql:::" + task_sql);
            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("total", total);
            re.setv("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    @At
    @Ok("raw")
    public String listWaiting3(@Param("category") String category, @Param("userId") String userId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) {
        NutMap re = new NutMap();
        try {
            long total;
            long a = System.currentTimeMillis();
            TaskQuery query1 = taskService.createTaskQuery().taskCategory(category).taskAssignee(userId).orderByTaskCreateTime().desc();
            log.info("a:::" + (System.currentTimeMillis() - a));

            long count1 = query1.count();
            long count2 = 0;
            List<Task> list1 = null;
            log.info("c:::" + (System.currentTimeMillis() - a));
            //查询分组
            Sql group_sql = Sqls.create("select distinct roleid from sys_user_role where userid=@userid");
            group_sql.params().set("userid", userId);
            List<String> groupIds = daoCtl.getStrRowValues(dao, group_sql);
            //查询待签
            Sql task_sql = Sqls.create("SELECT  aaa.*  FROM ACT_RU_TASK   aaa " +
                    "INNER JOIN ( " +
                    "SELECT  RES.ID_ " +
                    "FROM ACT_RU_TASK RES " +
                    "INNER JOIN " +
                    "(SELECT DISTINCT TASK_ID_ FROM ACT_RU_IDENTITYLINK " +
                    "WHERE " +
                    "TYPE_ = 'candidate' AND ( USER_ID_ = @userid OR GROUP_ID_ IN $groupid) " +
                    ") XXX ON RES.ID_ =  XXX.TASK_ID_  " +
                    "WHERE  RES.ASSIGNEE_ IS NULL AND RES.CATEGORY_=@category " +
                    "ORDER BY  RES.CREATE_TIME_ DESC LIMIT @a,@b " +
                    ") yyy ON aaa.ID_=yyy.ID_ ");
            task_sql.params().set("userid", userId);
            task_sql.vars().set("groupid", StringUtil.getStrsplit(groupIds));
            task_sql.params().set("category", category);
            //统计待签
            Sql count_sql = Sqls.create("SELECT  COUNT(1) " +
                    "FROM ACT_RU_TASK RES " +
                    "INNER JOIN " +
                    "(SELECT DISTINCT TASK_ID_ FROM ACT_RU_IDENTITYLINK " +
                    "WHERE " +
                    "TYPE_ = 'candidate' AND ( USER_ID_ = @userid OR GROUP_ID_ IN $groupid) " +
                    ") XXX ON RES.ID_ =  XXX.TASK_ID_  " +
                    "WHERE  RES.ASSIGNEE_ IS NULL AND RES.CATEGORY_=@category ");
            count_sql.params().set("userid", userId);
            count_sql.vars().set("groupid", StringUtil.getStrsplit(groupIds));
            count_sql.params().set("category", category);
            count2 = daoCtl.getIntRowValue(dao, count_sql);
            List<Task> list2 = null;
            if (count1 > 0 && (pageNum - 1) * pageSize / count1 == 0 && count1 < pageNum * pageSize) {
                task_sql.params().set("a", 0);
                task_sql.params().set("b", (int) (pageNum * pageSize - count1));
                list1 = query1.listPage((pageNum - 1) * pageSize, pageSize);
                list2 = taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
            } else if (count1 > 0 && (pageNum - 1) * pageSize / count1 > 0) {
                task_sql.params().set("a", (int) ((pageNum - 1) * pageSize % count1));
                task_sql.params().set("b", pageSize);
                list2 = taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
            } else if (count1 == 0) {
                task_sql.params().set("a", (pageNum - 1) * pageSize);
                task_sql.params().set("b", pageSize);
                list2 = taskService.createNativeTaskQuery().sql(task_sql.toString()).list();
            } else {
                list1 = query1.listPage((pageNum - 1) * pageSize, pageSize);
            }
            log.info("count1:::::" + count1);
            log.info("count2:::::" + count2);
            log.info("sql1:::" + task_sql.toString());
            log.info("sql2:::" + count_sql.toString());
            log.info("d:::" + (System.currentTimeMillis() - a));

            total = count1 + count2;
            List<Task> list = new ArrayList<>();
            if (list1 != null) {
                list.addAll(list1);
            }
            if (list2 != null) {
                list.addAll(list2);
            }
            log.info("e:::" + (System.currentTimeMillis() - a));

            re.setv("errcode", 0);
            re.setv("errmsg", "");
            re.setv("total", total);
            re.setv("list", list);
        } catch (Exception e) {
            log.error("获取直接分配或者已经签收的任务出错", e);
            re.setv("errcode", 1);
            re.setv("errmsg", e.getMessage());
        }
        return Json.toJson(re, JsonFormat.compact());
    }

    @At
    @Ok("raw")
    public String getFormKey(@Param("formKey") String formKey) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String formData = Files.read(Mvcs.getNutConfig().getAppRoot() + "/WEB-INF/classes/" + formKey);
            map.put("errcode", 0);
            map.put("errmsg", "");
            map.put("data", formData);
        } catch (Exception e) {
            log.error("获取用户任务表单出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    public String getTemplateStr(Context context, String template, Map<String, String> para) {
        StringWriter writer = new StringWriter();
        try {
            RuntimeServices runtimeServices = RuntimeSingleton.getRuntimeServices();
            StringReader reader = new StringReader(template);
            SimpleNode node = runtimeServices.parse(reader, "Template name");
            Template t = new Template();
            t.setRuntimeServices(runtimeServices);
            t.setData(node);
            t.initDocument();
            if (para != null && para.size() > 0) {
                for (String key : para.keySet()) {
                    context.put(key, para.get(key));
                }
            }
            t.merge(context, writer);
        } catch (Exception e) {
            throw new RuntimeException("Error commiting transaction! cause:" + e.getMessage());
        }
        return writer.toString();
    }

    @At("/formtest/00")
    @Ok("vm:template.private.wf.test")
    public void formtest_00(@Param("userId") String userId, @Param("taskKey") String taskKey, @Param("processInstanceId") String processInstanceId, @Param("taskId") String taskId, @Param("formKey") String formKey, HttpServletRequest req, HttpServletResponse resp) {

        if (!Strings.isEmpty(processInstanceId) && !Strings.isEmpty(taskId) && !Strings.isEmpty(userId)) {
            Wf_test test = daoCtl.detailByCnd(dao, Wf_test.class, Cnd.where("flow_id", "=", processInstanceId));
            Map<String, Object> formParams = new HashMap<String, Object>();
            formParams.put("formKey", formKey);
            int timeout = 60 * 1000;
            String str = Http.post("http://127.0.0.1/test/getFormKey", formParams, timeout);
            NutMap map = Json.fromJson(NutMap.class, str);
            String formData = map.getString("data");
            Context context = new VelocityContext();
            context.put("test", test);
            Map<String, String> params = new HashMap<String, String>();
            params.put("taskId", taskId);
            params.put("taskKey", taskKey);
            params.put("processInstanceId", processInstanceId);
            req.setAttribute("_form_data", getTemplateStr(context, formData, params));
            req.setAttribute("userId", userId);
            req.setAttribute("taskId", taskId);
            req.setAttribute("processInstanceId", processInstanceId);
            req.setAttribute("taskId", taskId);

        } else {
            Map<String, Object> formParams = new HashMap<String, Object>();
            formParams.put("userId", userId);
            formParams.put("flowKey", "qingjia");
            Map<String, Object> param = new HashMap<>();
            param.put("apply", userId);
            formParams.put("param", Json.toJson(param));
            int timeout = 60 * 1000;
            String str = Http.post("http://127.0.0.1/test/start", formParams, timeout);
            log.info("str::::" + str);
            NutMap map = Json.fromJson(NutMap.class, str);
            int error = map.getInt("errcode");
            if (error == 0) {
                Map<String, Object> formParams1 = new HashMap<String, Object>();
                formParams1.put("formKey", map.getString("formKey"));
                String str1 = Http.post("http://127.0.0.1/test/getFormKey", formParams1, timeout);
                NutMap map_form = Json.fromJson(NutMap.class, str1);
                String formData = map_form.getString("data");
                Context context = new VelocityContext();
                Map<String, String> params = new HashMap<String, String>();
                params.put("taskId", map.getString("taskId"));
                params.put("taskKey", map.getString("taskKey"));
                params.put("processInstanceId", map.getString("processInstanceId"));
                req.setAttribute("_form_data", getTemplateStr(context, formData, params));
                req.setAttribute("userId", map.getString("userId"));
                req.setAttribute("taskId", map.getString("taskId"));
                req.setAttribute("processInstanceId", map.getString("processInstanceId"));
                req.setAttribute("formKey", map.getString("formKey"));
            } else {
                req.setAttribute("_form_data", map.getString("errmsg"));
            }
        }

    }

    @At("/formtest/01")
    @Ok("raw")
    public String formtest_01(@Param("::test.") Wf_test test, @Param("_flow_type") int _flow_type, @Param("taskKey") String taskKey, @Param("userId") String userId, @Param("processInstanceId") String processInstanceId, @Param("taskId") String taskId, @Param("formKey") String formKey, HttpServletRequest req, HttpServletResponse resp) {
        if ("user_01".equals(taskKey)) {
            test.setAdd_uid(NumberUtils.toLong(userId));
            test.setAdd_time(DateUtil.getCurDateTime());
        } else if ("user_02".equals(taskKey)) {
            test.setCheck_uid(NumberUtils.toLong(userId));
            test.setCheck_time(DateUtil.getCurDateTime());
        }
        test.setFlow_id(processInstanceId);
        test.setTask_id(taskId);
        if (test.getId() > 0) {
            daoCtl.update(dao, test);
        } else {
            daoCtl.add(dao, test);
        }
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("_flow_type", _flow_type);
        Map<String, Object> formParams = new HashMap<String, Object>();
        formParams.put("taskId", taskId);
        formParams.put("json", Json.toJson(obj));
        int timeout = 60 * 1000;
        String str = Http.post("http://127.0.0.1/test/complete_param", formParams, timeout);
        NutMap map = Json.fromJson(NutMap.class, str);
        int error = map.getInt("errcode");
        if (error == 0) {
            return "任务完成";
        } else {
            return "任务失败:" + map.getString("errmsg");
        }
    }

    @At("/formtest/list")
    @Ok("vm:template.private.wf.list")
    public void formtest_02(@Param("userId") String userId, HttpServletRequest req, HttpServletResponse resp) {
        Map<String, Object> formParams = new HashMap<String, Object>();
        formParams.put("userId", userId);
        formParams.put("start", 0);
        formParams.put("num", 10);
        int timeout = 60 * 1000;
        String str = Http.post("http://127.0.0.1/test/listWaiting", formParams, timeout);
        NutMap map = Json.fromJson(NutMap.class, str);
        int error = map.getInt("errcode");
        if (error == 0) {
            req.setAttribute("list", map.getList("list", Map.class));
            req.setAttribute("total", map.getInt("total"));
        } else {
            req.setAttribute("msg", map.getString("errmsg"));
        }
        req.setAttribute("userId", map.getString("userId"));

    }

    @At("/formtest/03")
    @Ok("vm:template.private.test")
    public void form(HttpServletRequest req, HttpServletResponse resp) {
        Map<String, Object> formParams = new HashMap<String, Object>();
        formParams.put("formKey", "form/waizhibiaodan/01/01.form");
        int timeout = 60 * 1000;
        String str = Http.post("http://127.0.0.1/test/getFormKey", formParams, timeout);
        NutMap map = Json.fromJson(NutMap.class, str);
        String formData = map.getString("data");
        Map<String, String> params = new HashMap<String, String>();
        params.put("startDate", "2015-04-21");
        params.put("endDate", "2015-04-25");
        Context context = new VelocityContext();
        req.setAttribute("formData", getTemplateStr(context, formData, params));
    }

    @At
    @Ok("raw")
    public String startAutoCompleteFirst(@Param("flowKey") String flowKey, @Param("userId") String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(flowKey);
            Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser(userId).singleResult();
            taskService.claim(task.getId(), userId);
            taskService.complete(task.getId());
            map.put("errcode", 0);
            map.put("errmsg", "");
            map.put("processInstanceId", processInstance.getId());
        } catch (Exception e) {
            log.error("WebServcice启动流程出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At
    @Ok("raw")
    public String listDoing(@Param("userId") String userId, @Param("start") int start, @Param("num") int num) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            TaskQuery query = taskService.createTaskQuery().taskAssignee(userId).orderByTaskCreateTime().desc();
            log.info("query::::" + query);
            log.info("total::::" + query.count());
            List<Task> doingTasks = query.listPage(start, num);
            long total = query.count();
            map.put("errcode", 0);
            map.put("errmsg", "");
            map.put("total", total);
            map.put("list", doingTasks);
        } catch (Exception e) {
            log.error("获取直接分配或者已经签收的任务出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At
    @Ok("json")
    public Map<String, Object> listFlow(@Param("start") int start, @Param("num") int num) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery();
            long total = historicProcessInstanceQuery.count();
            List<HistoricProcessInstance> list = historicProcessInstanceQuery.listPage(start, num);
            Map<String, Object> obj = new HashMap<String, Object>();
            obj.put("total", total);
            obj.put("rows", list);
            return obj;
        } catch (Exception e) {
            log.error("获取直接分配或者已经签收的任务出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return null;
    }

    @At("/complete")
    public String complete(@Param("taskId") String taskId, @Param("userId") String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (!Strings.isEmpty(userId)) {
                identityService.setAuthenticatedUserId(userId);
            }
            taskService.setAssignee(taskId,userId);
            taskService.complete(taskId);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            log.error("提交任务表单值并完成任务出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        } finally {

        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At("/claim")
    public String claim(@Param("taskId") String taskId, @Param("userId") String userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            taskService.claim(taskId, userId);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            log.error("签收待办任务出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return Json.toJson(map, JsonFormat.compact());
    }

    @At("/complete_param")
    public String complete_param(@Param("taskId") String taskId, @Param("json") String json) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            log.info("json:::::::" + json);
            NutMap param = Json.fromJson(NutMap.class, json);
            taskService.complete(taskId, param, false);
            map.put("errcode", 0);
            map.put("errmsg", "");
        } catch (Exception e) {
            log.error("提交任务表单值并完成任务出错", e);
            map.put("errcode", 1);
            map.put("errmsg", e.getMessage());
        }
        return Json.toJson(map, JsonFormat.compact());
    }
}
