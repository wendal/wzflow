/*
SQLyog Ultimate v8.32 
MySQL - 5.6.0-m4 : Database - wzflow
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('747502',2,'source',NULL,'{\"resourceId\":\"747501\",\"properties\":{\"process_id\":\"chedaitest\",\"name\":\"è½¦è´·æµ‹è¯•\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"0001\",\"executionlisteners\":\"\",\"eventlisteners\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-3B55C72B-7DCE-49E8-980F-F0315066E270\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-920904BC-7535-4B20-9652-2E38B9574645\"}],\"bounds\":{\"lowerRight\":{\"x\":86.5,\"y\":169},\"upperLeft\":{\"x\":56.5,\"y\":139}},\"dockers\":[]},{\"resourceId\":\"sid-D0FD7DD0-D543-4D7E-BBE1-5E0748115DA6\",\"properties\":{\"overrideid\":\"yewushenqing\",\"name\":\"ä¸šåŠ¡ç”³è¯·\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"18U\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D03548BD-9389-45C6-99C0-2C7852C28AED\"}],\"bounds\":{\"lowerRight\":{\"x\":231.5,\"y\":194},\"upperLeft\":{\"x\":131.5,\"y\":114}},\"dockers\":[]},{\"resourceId\":\"sid-920904BC-7535-4B20-9652-2E38B9574645\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D0FD7DD0-D543-4D7E-BBE1-5E0748115DA6\"}],\"bounds\":{\"lowerRight\":{\"x\":130.65625,\"y\":154},\"upperLeft\":{\"x\":87.109375,\"y\":154}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-D0FD7DD0-D543-4D7E-BBE1-5E0748115DA6\"}},{\"resourceId\":\"sid-7603586C-FD6A-4901-9C23-61AD1917940F\",\"properties\":{\"overrideid\":\"yewuchushen\",\"name\":\"ä¸šåŠ¡åˆå®¡\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"Parallel\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"users\",\"multiinstance_variable\":\"user\",\"multiinstance_condition\":\"${nrOfCompletedInstances/nrOfInstances >= 0.5}\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${user}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-27BAA4F7-A339-4FAE-8DB1-D5DCAFF7F00E\"}],\"bounds\":{\"lowerRight\":{\"x\":376.5,\"y\":194},\"upperLeft\":{\"x\":276.5,\"y\":114}},\"dockers\":[]},{\"resourceId\":\"sid-ABF58986-43CC-4927-B6EC-09BE71AA40FC\",\"properties\":{\"overrideid\":\"cheliangpinggu\",\"name\":\"è½¦è¾†è¯„ä¼°\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"\",\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"109\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-08F81C26-E80B-4C89-A3AB-B8DEDBB1E922\"}],\"bounds\":{\"lowerRight\":{\"x\":521.5,\"y\":194},\"upperLeft\":{\"x\":421.5,\"y\":114}},\"dockers\":[]},{\"resourceId\":\"sid-B613868D-4080-4EA3-803F-B40E9818300C\",\"properties\":{\"overrideid\":\"pinggufuhe\",\"name\":\"è¯„ä¼°å¤æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"1ZJ\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F18F5A2B-CE33-4531-A425-ABF18973A2A2\"}],\"bounds\":{\"lowerRight\":{\"x\":751.5,\"y\":80},\"upperLeft\":{\"x\":651.5,\"y\":0}},\"dockers\":[]},{\"resourceId\":\"sid-F62971A6-5038-4A0B-B611-EB671614871D\",\"properties\":{\"overrideid\":\"zhongshenshenpi\",\"name\":\"ç»ˆå®¡å®¡æ‰¹\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"23C\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C334CB61-24F6-4865-B13D-AEBFFD87A2A3\"}],\"bounds\":{\"lowerRight\":{\"x\":751.5,\"y\":195},\"upperLeft\":{\"x\":651.5,\"y\":115}},\"dockers\":[]},{\"resourceId\":\"sid-F18F5A2B-CE33-4531-A425-ABF18973A2A2\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F62971A6-5038-4A0B-B611-EB671614871D\"}],\"bounds\":{\"lowerRight\":{\"x\":701.5,\"y\":114.46875},\"upperLeft\":{\"x\":701.5,\"y\":80.53125}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-F62971A6-5038-4A0B-B611-EB671614871D\"}},{\"resourceId\":\"sid-92C0D39E-557D-448A-B77F-8D2F2B87D2F2\",\"properties\":{\"overrideid\":\"qiantitiaojiaoluoshi\",\"name\":\"å‰ææ¡ä»¶è½å®\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"275\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DF1005DF-E7F6-42BF-A560-C269524CE2BE\"}],\"bounds\":{\"lowerRight\":{\"x\":895,\"y\":195},\"upperLeft\":{\"x\":795,\"y\":115}},\"dockers\":[]},{\"resourceId\":\"sid-C334CB61-24F6-4865-B13D-AEBFFD87A2A3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-92C0D39E-557D-448A-B77F-8D2F2B87D2F2\"}],\"bounds\":{\"lowerRight\":{\"x\":794.671875,\"y\":155},\"upperLeft\":{\"x\":751.828125,\"y\":155}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-92C0D39E-557D-448A-B77F-8D2F2B87D2F2\"}},{\"resourceId\":\"sid-69756A84-5474-4863-A5D8-556F6D5B7E1C\",\"properties\":{\"overrideid\":\"luoshifuhe\",\"name\":\"è½å®å¤æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"2LC\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3B89ED2A-5C5F-4C19-89C5-4C1D26B39E5B\"}],\"bounds\":{\"lowerRight\":{\"x\":1040,\"y\":195},\"upperLeft\":{\"x\":940,\"y\":115}},\"dockers\":[]},{\"resourceId\":\"sid-DF1005DF-E7F6-42BF-A560-C269524CE2BE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-69756A84-5474-4863-A5D8-556F6D5B7E1C\"}],\"bounds\":{\"lowerRight\":{\"x\":939.15625,\"y\":155},\"upperLeft\":{\"x\":895.84375,\"y\":155}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-69756A84-5474-4863-A5D8-556F6D5B7E1C\"}},{\"resourceId\":\"sid-13DEDC4B-A34A-4E55-BCAE-F6689D6C4015\",\"properties\":{\"overrideid\":\"hetongguanli\",\"name\":\"åˆåŒç®¡ç†\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"2P5\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F52BFC10-7737-4945-A2A6-D2961FCE89F0\"}],\"bounds\":{\"lowerRight\":{\"x\":1185,\"y\":195},\"upperLeft\":{\"x\":1085,\"y\":115}},\"dockers\":[]},{\"resourceId\":\"sid-3B89ED2A-5C5F-4C19-89C5-4C1D26B39E5B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-13DEDC4B-A34A-4E55-BCAE-F6689D6C4015\"}],\"bounds\":{\"lowerRight\":{\"x\":1084.15625,\"y\":155},\"upperLeft\":{\"x\":1040.84375,\"y\":155}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-13DEDC4B-A34A-4E55-BCAE-F6689D6C4015\"}},{\"resourceId\":\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ParallelGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9F686C53-6F4B-46B5-867F-1BFC45678FDA\"},{\"resourceId\":\"sid-22ED8CCC-2445-4AE5-954C-56733CAB1F55\"}],\"bounds\":{\"lowerRight\":{\"x\":1155,\"y\":285},\"upperLeft\":{\"x\":1115,\"y\":245}},\"dockers\":[]},{\"resourceId\":\"sid-1DE6AD7F-1827-40E6-B85B-5B039C9FC22C\",\"properties\":{\"overrideid\":\"diyadengji\",\"name\":\"æŠµæŠ¼ç™»è®°\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"2WU\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AEE1B50C-E85D-4776-8D83-C9DC49988DE4\"}],\"bounds\":{\"lowerRight\":{\"x\":1185,\"y\":415},\"upperLeft\":{\"x\":1085,\"y\":335}},\"dockers\":[]},{\"resourceId\":\"sid-8192DB2E-5C92-4F6E-8A4C-65157A3C0A02\",\"properties\":{\"overrideid\":\"hetonggongzheng\",\"name\":\"åˆåŒå…¬è¯\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"2SY\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A978BA75-86B0-458E-9B21-7FD7E404962A\"}],\"bounds\":{\"lowerRight\":{\"x\":1040,\"y\":305},\"upperLeft\":{\"x\":940,\"y\":225}},\"dockers\":[]},{\"resourceId\":\"sid-A7F90AA1-06D2-400E-8DC8-9EA5333483B5\",\"properties\":{\"overrideid\":\"fangkuanshencha\",\"name\":\"æ”¾æ¬¾å®¡æŸ¥\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":true,\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"37A\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3BC6F06A-D481-47FE-AEB1-DF5627713B9F\"}],\"bounds\":{\"lowerRight\":{\"x\":920,\"y\":415},\"upperLeft\":{\"x\":820,\"y\":335}},\"dockers\":[]},{\"resourceId\":\"sid-C8DC3ED5-7197-4FDF-9B62-BC6E73CD16C2\",\"properties\":{\"overrideid\":\"caiwufangkuan\",\"name\":\"è´¢åŠ¡æ”¾æ¬¾\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"candidateGroups\":[{\"value\":\"2\",\"$$hashKey\":\"3B3\"}]}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4297773B-04B0-43D4-B40E-23BB78FAE6AB\"}],\"bounds\":{\"lowerRight\":{\"x\":779.5,\"y\":415},\"upperLeft\":{\"x\":679.5,\"y\":335}},\"dockers\":[]},{\"resourceId\":\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":628,\"y\":389},\"upperLeft\":{\"x\":600,\"y\":361}},\"dockers\":[]},{\"resourceId\":\"sid-3BC6F06A-D481-47FE-AEB1-DF5627713B9F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C8DC3ED5-7197-4FDF-9B62-BC6E73CD16C2\"}],\"bounds\":{\"lowerRight\":{\"x\":819.60546875,\"y\":375},\"upperLeft\":{\"x\":779.89453125,\"y\":375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C8DC3ED5-7197-4FDF-9B62-BC6E73CD16C2\"}},{\"resourceId\":\"sid-4297773B-04B0-43D4-B40E-23BB78FAE6AB\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\"}],\"bounds\":{\"lowerRight\":{\"x\":678.87109375,\"y\":375},\"upperLeft\":{\"x\":628.53515625,\"y\":375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\"}},{\"resourceId\":\"sid-66666A28-D500-4B06-916D-F44F23F4C520\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-965CD382-3B99-4246-8DD9-F3050A6E4CF2\"},{\"resourceId\":\"sid-9A44B04A-DC1B-44DC-814B-A05AED8CB220\"}],\"bounds\":{\"lowerRight\":{\"x\":606.5,\"y\":174},\"upperLeft\":{\"x\":566.5,\"y\":134}},\"dockers\":[]},{\"resourceId\":\"sid-22ED8CCC-2445-4AE5-954C-56733CAB1F55\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1DE6AD7F-1827-40E6-B85B-5B039C9FC22C\"}],\"bounds\":{\"lowerRight\":{\"x\":1135.409496337557,\"y\":334.64844792497405},\"upperLeft\":{\"x\":1135.184253662443,\"y\":285.32030207502595}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-1DE6AD7F-1827-40E6-B85B-5B039C9FC22C\"}},{\"resourceId\":\"sid-9F686C53-6F4B-46B5-867F-1BFC45678FDA\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8192DB2E-5C92-4F6E-8A4C-65157A3C0A02\"}],\"bounds\":{\"lowerRight\":{\"x\":1114.6074277794598,\"y\":265.4282042191734},\"upperLeft\":{\"x\":1040.4472597205402,\"y\":265.1733582808266}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-8192DB2E-5C92-4F6E-8A4C-65157A3C0A02\"}},{\"resourceId\":\"sid-F52BFC10-7737-4945-A2A6-D2961FCE89F0\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\"}],\"bounds\":{\"lowerRight\":{\"x\":1135,\"y\":245.09375},\"upperLeft\":{\"x\":1135,\"y\":195.53125}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\"}},{\"resourceId\":\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ParallelGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-958B15D3-AD10-4211-AE06-17931D52994B\"}],\"bounds\":{\"lowerRight\":{\"x\":1010,\"y\":395},\"upperLeft\":{\"x\":970,\"y\":355}},\"dockers\":[]},{\"resourceId\":\"sid-A978BA75-86B0-458E-9B21-7FD7E404962A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"}],\"bounds\":{\"lowerRight\":{\"x\":990,\"y\":355.09375},\"upperLeft\":{\"x\":990,\"y\":305.53125}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"}},{\"resourceId\":\"sid-AEE1B50C-E85D-4776-8D83-C9DC49988DE4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"}],\"bounds\":{\"lowerRight\":{\"x\":1084.15625,\"y\":375},\"upperLeft\":{\"x\":1010.2578125,\"y\":375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"}},{\"resourceId\":\"sid-958B15D3-AD10-4211-AE06-17931D52994B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A7F90AA1-06D2-400E-8DC8-9EA5333483B5\"}],\"bounds\":{\"lowerRight\":{\"x\":969.7304773585561,\"y\":375.4138194081268},\"upperLeft\":{\"x\":920.8945226414439,\"y\":375.2111805918732}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-A7F90AA1-06D2-400E-8DC8-9EA5333483B5\"}},{\"resourceId\":\"sid-27BAA4F7-A339-4FAE-8DB1-D5DCAFF7F00E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":{\"executionListeners\":[{\"event\":\"end\",\"implementation\":\"${execution.setVariable(\'okNum\',0)}\",\"className\":\"\",\"expression\":\"${execution.setVariable(\'okNum\',0)}\",\"delegateExpression\":\"\"}]},\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ABF58986-43CC-4927-B6EC-09BE71AA40FC\"}],\"bounds\":{\"lowerRight\":{\"x\":420.65625,\"y\":154},\"upperLeft\":{\"x\":377.34375,\"y\":154}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-ABF58986-43CC-4927-B6EC-09BE71AA40FC\"}},{\"resourceId\":\"sid-08F81C26-E80B-4C89-A3AB-B8DEDBB1E922\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-66666A28-D500-4B06-916D-F44F23F4C520\"}],\"bounds\":{\"lowerRight\":{\"x\":566.1484468700075,\"y\":154.4097335362338},\"upperLeft\":{\"x\":522.1288968799925,\"y\":154.2191727137662}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-66666A28-D500-4B06-916D-F44F23F4C520\"}},{\"resourceId\":\"sid-D03548BD-9389-45C6-99C0-2C7852C28AED\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7603586C-FD6A-4901-9C23-61AD1917940F\"}],\"bounds\":{\"lowerRight\":{\"x\":275.65625,\"y\":154},\"upperLeft\":{\"x\":232.34375,\"y\":154}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-7603586C-FD6A-4901-9C23-61AD1917940F\"}},{\"resourceId\":\"sid-965CD382-3B99-4246-8DD9-F3050A6E4CF2\",\"properties\":{\"overrideid\":\"\",\"name\":\"${_flow_type==\'pinggufuhe\'}\",\"documentation\":\"\",\"conditionsequenceflow\":\"${_flow_type==\'pinggufuhe\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B613868D-4080-4EA3-803F-B40E9818300C\"}],\"bounds\":{\"lowerRight\":{\"x\":651.30078125,\"y\":133.8203125},\"upperLeft\":{\"x\":587,\"y\":40}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":587,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-B613868D-4080-4EA3-803F-B40E9818300C\"}},{\"resourceId\":\"sid-9A44B04A-DC1B-44DC-814B-A05AED8CB220\",\"properties\":{\"overrideid\":\"\",\"name\":\"${_flow_type==\'zhongshenshenpi\'}\",\"documentation\":\"\",\"conditionsequenceflow\":\"${_flow_type==\'zhongshenshenpi\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F62971A6-5038-4A0B-B611-EB671614871D\"}],\"bounds\":{\"lowerRight\":{\"x\":651.3007907843881,\"y\":154.78078947940782},\"upperLeft\":{\"x\":606.7851467156119,\"y\":154.58639802059218}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-F62971A6-5038-4A0B-B611-EB671614871D\"}}],\"bounds\":{\"lowerRight\":{\"x\":1285,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"/stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('750001',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ó\0\0Ñ\0\0\0@aÿä\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0 \0IDATxÚìİ	|TÕÙÇñ3YÈÂ¾\n*à.î¼*Ö]Ü÷­–­m­KÅ—*¨u¯µÚª­Ö€ APQQAP©¢UT\r\nj!aO @ÂÌ{ş7sã0Ì$²Ìöû~>‡	³erî3wyîsÎõ\0\0€äğ‰mGÙ¶Ò¶lÛ:Úv´mómû¯m¿¶m9İ™üüü_mÛ¶í[·n=jóæÍm½^/Ò@Çdeem²í›ôôôg;ì°—è\0\0bp›M\0\0€$ÒÍT\'Ñ6Û¶„î¨¿¹sçWQQ‘·}ûöî]»võ´mÛÖ´nİÚ¤¤¤Ğ9\r¤„dYY™Ù¸q£Yµj•î*JOOÜ§OŸYô\0\0±ƒd\Z\0\0\0\"2oŞ¼kJKKŸëÑ£GÊî»ïîTR¡é¬X±ÂzÛµkw[ïŞ½Ÿ G\0\0ˆ\rì\0€dq¨mÏÙXB¥±‰\'Ğ5uS\"­¬¬ìÙ^½z¥¶iÓ†i&åååfáÂ…Şììì?uÔQ§G\0\0ˆ¾Tº\0\0\0$»m›lÛO¶U™ê$šÚvÛréÚMŸ>½WUUÕÔƒ>8-T\"Íçóšõ…›•_5«¿Û”üô¥ñy+MVÛ=ÇÃğÏ†hÑ¢…i×®gùòåg^qÅo3f½\0@t¥Ñ\0\0 	\\iÛ±¶}NWÔ_vvö¤=öØ#=\\EÚªEo:	4WÕÖfÍÿfšm›×šn‡üŠl –-[š={¦M´ÿíE\0\0]œ*\0\0Éà+ÛzĞ\rõ÷Ş{ïõöù|h´P*·¬7¥+æ†|¬tå|S±i%ØÔÿ))){Ï˜1ãXz\0€è\"™\0\0’Ám¶½hª¯æÜP‹ŒŒŒßtëÖ­E¸‹\rl)-r†y†³µŒQ‰¥k×®-ìò¸š\0\0 ºæ	\0\0’ÁşÛ‚îWˆÙôkáñxÎnÛ¶mØÇ}ŞªÚß –DêGÃl‹ŠŠÎ¤\'\0\0ˆ.’i\0\0 œCìšmÛ¶íİºuk:\"´jÕJËƒáÊ\0\0DÉ4\0\0ÈzÚVhjÎÉ¤^µğù|i))ÌüË…\0@”‘L\0\0‰ìÛ.¶í!ÛNñ¸Æ v ›v]zVûÚw63¨j\0\0‰…d\Z\0\0Hdûúo/ +šFV»¦U§MÙÚÅ;=–İa_çq\0\0€DB™8\0\0\0v™Ç“bvëuaÈÇº|©IImA\'\0€„Be\Z\0\0HıMõpÏlÛ6Ûö°mÏÒ-\r·}[yÈû«¶n2é™íè \0\0PH¦\0€d0Ô¶\'ldÛç¶u´m²m\'Ø6˜îÙuëg›uÿ	ùØò¹/š{÷5÷:™\0\0	ƒa\0\0 \\g[_ÛÆÛö£©N¨u·m€áäâ.©¬(1Eó_2«˜f¶Wn	ùïömfÍï™e_½`¶•¯¡Ó\0\0@B`ç\0\0$ƒ¯mËqÿFÿşP]¹\rEsÌÚÿÍ›D¶yÃRS0çÓiŸÓLûÇ;ó¬\0\0Ä+öd\0\0@2¸ÕTW¥uhûÙ¦lP{ÿÿ\rë\\µèÍˆi.U©©ŠM¯\0\0ˆgT¦\0€dğœmY¶ıâ1÷¾Smû‚®ª’b\ráóR\0\0âÉ4\0\0Î¡\Z‡†jª\0\0$+†y\0€D¦á›\ZÆÙ‚®\0\0\0@c 2\r\0\0$*%Ñ\nm«°­Ü¶cıÿ\0\0\0vÉ4\0\0¨6*Ò\0\0\0ĞÈæ	\0\0\0\0\0\0Dˆd\Z\0\0H½Ãü\0\0\0DŒd\Z\0\0HOØÖÇ¶LÛfĞ\0\0\0Ø$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0ÉbvÀÏŸĞ\0\0\0Øit\0\0HÃ~¾„î\0\0\0À® ™\0\0àrrrîñx<ù+W®œ:kÖ¬*z\0\0`×1Ì\0\0$‹Şa~N÷ù|¾×»víZÒ¿ÿq8§_¿~­bñƒ®Y³¦ÎçlØ°a§û>úè#SQQQóÿ‘#GÖúzş;ï¼Ñg\Z3fŒ™;wnÍÿ«ªªÌ³Ï>Ë7\n\0€$E2\r\0\0$‹\'lëc[¦m3’´Zz<Ë}>ß»©©©E999c•X2dHf¬|À²²2óÄO8?/]ºÔ¼ùæ›fÚ´iæ;îpnÇozê©^§äYIIIÍÿ¿ÿşû°¿Ãëõš|ĞtíÚÕ,[¶l‡öüóÏ›I“&íôüÍ›7×ü?--Í¬_¿¾&y§Ï	\0\0’Ã<\0\0’S[Ûû|¾Á[rrr&z<7¢=tï½÷6‹-r~ÎÈÈ0ÇwœéÜ¹³“D;çœsLQQ‘“Ü\n4{ölsÙe—9É1WjjjÍÏ,0GqDÍÿŸ|òIsñÅ;	2%Ğ\\………æÔSO5ûî»oÈÏ6gÎ“••e²³³MË–-ÍêÕ«Mee¥SåÖ½{w\'É\0\0[|\0\0\0dÙ6Äçó\réÚµkiNNÎ4Ç“›‘‘1+\Zæ¹çsnwß}w§\"íÎ;ï¬ylÜ¸qNâ,Ğ?şñ\'AöÏşÓôèÑÃ¹oåÊ•N%›¬[·Î¹¿}ûöNÕÙE]d†n\r\Z´Ãû|óÍ7fáÂ…5É4UÉÍš5Ë¼úê«¦oß¾æğÃ7ÇsŒyæ™gœ¤_§NÌüùóÍUW]E\0DH¦\0\0„‘““³—½’d¶*Öúû|¾ş\ZÆøÊ+¯˜=öØ#lµVcR•˜’Sï¿ÿ¾¹õÖ[Ø…^è$ĞD•`ûï¿¿Ó\\ª:SLb¿ûİïjîw+ÙmÛ¶ÍIÄ¥¤¤8•kªhôã?š<°æÿ­Zµ2\\pyè¡‡œj¸3Î8Ã¬X±Â¤§§;	¹?ÿùÏ¦K—.æøãçË\0@!™\0\0ŞÛîMæØ´i““P»ë®»šüw)y¦öÆo8·ªëİ»·Ùm·İÌ\'Ÿ|bÊËËÍÙgŸmFŒanºé&g¨e~~¾S5Ö¦MçâmÛ¶5-Z´¨yO%à”üRUZàıÛ·oùtq@ÅÅÅÎ{tèĞÁÜ|óÍÆçó™£:Ê™ËMB¸âŠ+ÌÆß\0\0’É4\0\0€ÈŒŠãÏIB°Ò›x§’DÁÃ*›‹ªÔ:è \'‘¥Ê0}–­[·:‰´Ö­[;¸üòË¹ÌDUj3fÌpæ=ëß¿¿3ÌSUnGy¤0`Àï=tèP§â,77×©TU®|òÉ;<oÊ”)NÅ[¯^½Ìyçç=UÒî±Ç3>ú¨S¡¦÷:í´Óø†\0\0$H¦\0€d8¦ï“z¾vT^^ŞÈxıÃsrrÂ%Ó*}>Ÿ×ãñdÍş¿Äş¦mã322¦õë×oË•Ï­9Ê”¸ÒS]Œ cÇ;<xÁQRL¯	Ş©ùÒTÙlæÌ™æ”SNq.B áœªpÓ•<U	çÎ»¦’gzÑÏªR›8q¢yøá‡dÜàÁƒI¤\0dH¦\0€d1<àçK’¸¶Ø¦Ëa¶´-İãñè¾2Û4[ÿÄ¬¬¬™¹¹¹%î“Uù\rJ¢iâÿk¯½¶Ñß{êÔ©æüóÏw®ğ©yÏzöìi>øà“——ç\\©ÓµvíZ§òìÅ_tş¿xñb³jÕ*sã7š¿ÿıïÎE†Â7\0€$C2\r\0\0$•\')3ó¦:™Öİ¶=mûo’õC–ÿV	´É¶½™™9577·\"V> æ-S’ë‰\'¨¹/ÜgÁ¾şúë*ØôÿnİºÕü_ó›pÂ	ÎjEEEÎ¼gªJëÓ§3\'[`2M\r-Õï×Å	”x{ä‘GÌ‰\'h®¿şzçj£ªpÓP\0\0H¦\0€dp°mmûÌ¶½ü÷m°í;ÛZ%K\'h§½™•’’2&##cV`Z,9é¤“vš§MC.k³téR\'	wÌ1Çì0ÌSó uîÜ¹æÿª,ÓkJœé<ğ€saU)÷ÕW_™C9ÄùY	7÷½5üSCC•|ÓiîÅ|ğA\'¡F2\r\0€äA2\r\0\0$ƒWl;Ö¶Ïm[é¿O•Y\ZòØÊÿs\"îñx\n233\'ÇRZ8×\\sÍN÷½üòËaŸ¯+jş´Ã;l§Ç4L3*Ëößÿ§ª³ÀJ¸@÷İwßW\r¤yÚt!\0\0<H¦\0€dÙçYâşTÛªıÏËË»?Şÿ÷Š›¡_ˆ 6á’bı\Z\0\0¸Rè\0\0&ØvGĞ}*YÒD\\t\0\0\0\"E2\r\0\0$ƒQ¶bÛ\ZÛTÆô“m¯Ùv\n]\0\0€ú`˜\'\0\0Hgšê+zêR\ZÚù=]\0\0€ú\"™\0\0’EÛ²-Û¶Í¶=lÛ³t\0\0\0êƒd\Z\0\0HCmÓ¥\Z™ê+zª:m²m\'Ø6˜î\0\0@¤˜3\r\0\0$ƒëlëkÛxÛ~4Õ	µî¶\r0œ\\\0\0@=L\0\0ÉàkÛ2BÜ¿ÑL\0\0@=L\0\0ÉàVS]•Ö- ígÛÛÚûÿ\0\0\0Ô‰3±\0\0 <g[–m?„xÌ½ïTÛ¾ «\0\0\0P’i\0\0 œC\0\0\0 10Ì\0\0$ƒ1¶N7\0\0\0 ¡¨L\0\0ÉàÛfØ–nÛÛşa›—n\0\0@}‘L\0\0É`¢¿õ´íeÛ²m’m×Û¶†î\0\0@¤H¦\0€dRhÛ	¶õ²íSÛVÛ¶Ä¶‹mË§{\0\0\0P’i\0\0 ™\\bÛßmkoÛ£¶=lÛY¦zèE†«y\0\0 $Ó\0\0@2xÄ¶[lûÉ¶¶ı\'à±)ş\0\0\0Ô‰d\Z\0\0HlënÛJº\0\0\0\r‘B\0\0€$0Û„N¤D×\0\0\0 >H¦\0€dğgÛ\rqÿk¶eÓ=\0\0\0ˆÃ<\0@¢ëæ¿İİ¶u÷ïg[\'Û*è\"\0\0\0DŠd\Z\0\0Hd}Lõ•:ÛÚöJĞc[mû½m^º	\0\0\0‘\"™\0\0Ù¶µ³íiÛµ-Ÿ.\0\0@C0g\Z\0\0H7˜ÚiSè\"\0\0\0D‚d\Z\0\0€1Ó¡y<J¯—‘°±À¿X\0\0DÉ4\0\0\0„ßYLIY°iÓ&:\"”••iy,¤\'\0\0ˆòş]\0\0\0€p¶oß>mİºu«è‰èÛ°aÃZ¯×;\0\0 ºH¦\0\0 ,ŸÏ÷jqqqš½¥3¢lÅŠ•öæUz\0€è\"™\0\0€°Î:ë¬ùUUU_,[¶l9½=¶ÿ—UVV~{æ™g~Fo\0\0]$Ó\0\0\0P+¯×{ó²eË²JKKKèæWVV¶¹°°0Û.‡¡ô\0\0ÑG2\r\0\0$ƒlK£vÍÙgŸ½ÈŞÈÏÏßTZZºi>eee,X°Şşx•]ùô\0\0Ñ—J\0\0€$ğŒmy¶]mÛ¶-¶­4àñ§B½èĞCíkoÔş“ŸŸ?+™;pìØ±KüMqqq¿ÊÊÊ/Û·oßÓãñYMhÉ’%Ÿ.^¼¸ıñwgœqÆTz\0€Ø@2\r\0\0$ƒI¶İgÛk¶ífª“g±m°	“H’i;RBmĞ Ao–••VTT”]^^şYJJÊ¦ÌÌÌv\'f+ÿÖ®]k¦OŸn:wîl²³³c¶½^oEiié×………ù‹/öÙŸ×ØûuÖY³ù\n\0;î\0\0\0’…×¶•¶-³-İ¶Í¶ı‡n©ÿÏsß{ï½ŞkÖ¬¹Ì¶¾±ş™çÎkæÍ›g\nÍ‘GëûæŠÓ¶àb\0\0Äî\0\0 Ñ]dÛ¶u6ÕUj}mãê”\r «|Ú›ùñğYsrrFÚ›{çÍ›7ê;îÉÒ\0\0\rÁ\0\0@2ø…mml[cÛë¶­¢K\0\0\0°+¨L\0\0ÉànÓ|i×Øö/Û6Ù6Ô¶wè\0\0\0DŠÊ4\0\0L¶Ùö–m?Ù¶—m/Ó%\0\0\0¨*Ó\0\0@2xÎ¶¶µ°m‰mwÚö‰mëè\Z\0\0\0ÔÉ4\0\0ÆÙ6ÚTW¤\0\0\0»Œd\Z\0\0HÓ\0\0\0h$Ó\0\0@²ĞÏ»l»ÔT_|à*Û~¤[\0\0\0P\\€\0\0\0$ƒ¶mµíbÛn´íÛæÚöº\0\0\0õAe\Z\0\0H“mË±m¢ÿÿ\Zöy‹m¶İn[]\0\0€HP™\0\0’Á¶Íqÿ*ÛÚÒ=\0\0\0ˆÉ4\0\0¦Ù6\"è¾Ş¦:É¶î\0\0@¤æ	\0\0’ÁMõie¶­±-Ó¶®¶F×\0\0\0 >H¦\0€dq¤mİMõ°NÍ‘ö½m^º\0\0\0õA2\r\0\0$²nAÿWÍÖ¹›ÿv%İ\0\0€H‘L\0\0‰ª½mßÕñU¦u «\0\0\0)’i\0\0 Qm±m¡m\'˜ê\n5*Ğ\0\0\0Ğ`\\Í\0\0$ª–¶íéÿùÛ¥K\0\0\0ĞPT¦\0€D¥¹ÑzØÖÇÿÿ½lÛây…tUâèß¿ÿçÁ0ß›““soĞ}£òòòFÒs\0\0 R$Ó\0\0@\";Í¶×Lu…Z¯kÎ´İè¦Ä‘’’2ßçóEü|Çó#½\0\0êƒd\Z\0\0HdÚÖİ¶ÇlËµ-Ÿ.Il&L˜–““³ÖşØ©®çú|¾’ÌÌÌÉô\Z\0\0¨æL\0\0Éà6S{\"m\n]”8|>_¤ËsVnnn=\0\0êƒd\Z\0\0€1Ó‰ÃçóMŒğ©/Ğ[\0\0 ¾H¦\0\0 ¡dggÏ¶7Åu<­,++k6½\0\0ê‹d\Z\0\0\0Šèæ´:6Ù>¯„Ş\0\0õE2\r\0\0\0‰hL¿M\0€]A2\r\0\0\0	§¸¸x¶®Öæá²ÌÌÌ©ô\0\0Ø$Ó\0\0\0pfÍšUåñxÆ…yx\ZWñ\0\0»Šd\Z\0\0\0’Ïç›æ¡‰ô\0\0ØU$Ó\0\0@¢joÛÓ>w¼mûÑe‰eÕªUºAQà}\Zú™™™9“Ş\0\0»Šd\Z\0\0HTÛm;7Âçc[%]–X4ÔÓŞì8óx<3¹Š\'\0\0h’i\0\0 Qm´­³mCm;Ô¶‚ßÇ?Ûµí\'º,!ípUOÇ3.\0\0\r‘F\0\0€ÖÕ6Í›u­m¶u³-Ó¶omkiÛÛ¼¶ík[İ•x233?«¨øùZÓè\0\0Ğ$Ó€$—ŸŸÿ«mÛ¶ıaëÖ­GmŞ¼¹­×ë¥S\ZÈãñ˜¬¬¬M¶}“şìa‡ö1b(j6ÛvRÀÿ¶íkÛşdÛº\'ñéª999‹ì½l+à*\0\0 ÁûëtœæÎ{\\EEEŞöíÛ»wíÚÕÓ¶m[Óºuk“’Âèï†R2©¬¬ÌlÜ¸Q“_ë®¢ôôôÁ}úô™EŠ	ëMuÅÚ¶º˜““3ÒŞÜkÛ¨¼¼¼‘tİÏâ)‘¾víZ3gÎsÔQG™İvÛ-vwÌ“$‘îóù2—.]zƒ]Ï\r²±s`yyy&\'b\Z%~|ëZ´h1§²²ò±O<ñÃDı[‰!bˆ\"†¢ş·²¸ä3oŞ¼kJKKŸëÑ£GÊî»ïîì¼£é¬X±ÂzÛµkw[ïŞ½Ÿ †@Å’i;#‘Şt’!‘n^¯]»víã6†²müâ§iâ§¸¸x›ı~·eË–AgŸ}v~\"ıÄ1DC± •Å\r$%Aì\nîÙƒ>8µsçÎ$Aš6Î:tğyÃ\r7¬ûç?ÿù1„d¡xrè¡‡öµ7jÿÉÏÏŸ•ìı¡ï¿İA~}=öh×«W/O»ví4\'ëF¢~ÌÈÈ0mÚ´1:QaµY³fÍC‡İôì³Ï~ïß²eË¦ÜÚ­[·t?†øiÒøIMIIéºiÓ¦«®¼òÊü1cÆ,N„¿‘\"†ˆ!b(VL’ÈôéÓ{UUUM=øàƒÓ´‚æóyÍúÂÍÊ…¯šÕß¿mJ~úÒø¼•&«ívÅÈ™š†hÑ¢…6ÖåË—ŸyÅW¼i7&«ˆ!$cE‘æM[æÿùTÛ4ìàt¥Ç`$Ó~F\"½ù%R\"]°¶]|ĞAâ§Yã\'}õêÕç\Z4è›±cÇ~ïIbˆ\"†ˆ¡XA2\rH\"¿ÿıï?ìŞ½{7m<BYµè\r\'â­Úâüß»}«Ù¼a‰©ª(1­»L6B2$Õ*//?õÅ_|šB2ÆP”h˜¦²¿süÿ×Ül+¶íÛòÂ½dZ5éÑıŞÇ{\"]CªT	¢ØPñ³µl•)şöuSüİfíÒívc©ÉhÙÅ¤e´!\0\Z!~ìlFqqñy—_~ùÛãÆ[1DCÄP¬aïHï½÷^oŸÏw€ØÈN*·¬7¥+æ†|¬tå|S±i%ØÔÿ))){Ï˜1ãXbÉCQÒİ¶Km›çÿù8ÛŒ\Z27É¶ü÷w§«ÂËÎÎÔ£GôP ²jÑ›fÍï9ë©ÚºÑ¬ùßL{PÂSCË–-MÏ=Ó­‰ñöÙ5É·æ&²ñö\0vùÜ›²µ‹wû6ãóV™Íëÿg–}õ‚©Øø¿‘âg¯½öò¦¦¦ş-??1DCÄP,\"™$‰ŒŒŒßtëÖ­E¸ræ-¥ENeA8ÚÈ qtíÚµ…]WCH¶Š’=mS`îîÿùdÛŠü?ïğœ=éªĞH¤Ç†xM¤ëjyšä;\\ü¨¢±j[ùN÷ë€víÒY,øÆZî¹g‡´´´ıãñD1DCÄP,\"™$	Çs¶®TÎÀÔÊÇ¥¢‹ÎˆÙÓ3‰!$[EÉm{Ø¶_Ø¶À¶kmû½ÿ~µ–?#é±#éeeeƒtµ¼°ñSKÕ±Ó¸ºté¢¡í—ÅÛç&†ˆ!bˆŠE$Ó€$±mÛ¶½5$¢¯U«VZ=ˆ!$[E‘†Æõ±M§U•æ^ı—şÿ£$ÒcG<&Ò7oŞ|`­ñ³½’Øi&:uÚÃTÏiˆ!CÄ1Ô0i,N 9Øï´”òç±À¿Rˆ!$[EÙ)şıÀÌÏ;¶½I×ÔDzìˆÇDzyyy&ñìrèfo:ÇÛç&†ˆ!bˆŠE$Ó\08Ò³Ú×¾²È`bq/¸„ª‚.©‰ôØ‰t¯×kˆŸ˜ŠŸ¸;ş#†ˆ!bˆŠÉ¿…Å	@²Úõ4­:ò±ìû:Ä€`$ÒÑTñCì€1„XE2\r€ÃãI1»õº0äcİ¾Ô¤¤¶ “@Ø	‰t4D‡Ç›´-wº?5=Ëtèy\"bÄbÉ4\05¶‡¸$´TmİDç€‰t4D«Î™–!’±º¿u—Cè C †“H¦p¬/œm–ÏË\rùØò¹/šuÑI †\0„D\"\rŠŸÊ-Äˆ!Cˆ+$Ó€$WYQbŠæ¿dVÿ0-äFD¼Û·™5?¾g–}õ‚ÙV¾†N1 ‰tì*m´]([óİN•¯ûÁ,ûò_l3@BLâj@ÛP4Ç¬ıßŒ°	`›7,5s1ö9Í´ïq¼3´Ä1$\'%ÒW-zË”­]ö9n\"]$]{]dZ´ìLÇÁQºb®é¦*LU£³Í()t¶÷=Ã´ë~,ÛC †3H¦IJ•ª$ª/éu>Ÿ×tÜëd:’\"†€$D\"»J«¾ÇI°FºÍĞó7­ùÎt9à<“ÙºHC †uìÉ\0IJ…†ğy«èDbˆ’é«½q\"-p¡Dº^ä¥¤j¤°”-üâ9:Äˆ!Ä*Ó€$¥ê\05€Â»à‚›:uªñx<Kéj$Ò­ø!v@B¬ ™\0\0Âë¯¿>ş­·Şúå¹çkfÎœùtNNNa^^Ş¬dïéhˆ^gÜO\'€1„¸Ç0O\0\0€ ÿú×¿Æ¼óÎ;ÿøÇ?š+®¸ÂØÛViiiïäääİŒ£•m™,\r\0\0€ØB2\r\0\0 À¸qã&Î™3çŠ;ï¼ÓqÄÎ}G}´¹æšk²ÒÓÓ?ì×¯ß~ÍôQ~eÛ±µ<~‰m_Øö¡m½#|ÏmûÎ¶å¶İãíæêÛU«V™²²²¸‹‰‘#GšO>ù¤Öç,^¼Ø(fbH«æ\\¶~{ù[Ô”””˜µk×:?WTT˜ÂÂÂ¸Œ9\0@l#™\0\0à÷ôÓOÏœ={ö¯•ÙgŸ}vxì”SN1¿ıío³²³³?ÉÉÉiê„eım»Ã¶ûl•À{Æ¶¶jÛüß÷%Û†ÙÖİ¶‡š»\r\Zd^{íµ¸‹%Ò~úé§ZŸ£DaŒıml{±™çÓü	<sÚi§Õôıc=fîºë.çg%Òî¿ÿ~sÖYg™7ß|“\0 Ñ0g\Z’Â{ï½wú’%KnX³fÍ±«W¯î¸qãÆ´­[·zÒÓÓM›6mªvÛm·\r:tøâàƒş›İ!›N@òyòÉ\'g~ûí·§ß{ï½¦k×®!ŸsÒI\'¥VVVv\Z3fÌsrrËËË+h‚2Á¶\nS [eª+Œ.°í¯AÏÓ‡ü±ï{©®\Zêeª-“C<G«\"NÃKóÜ÷çwÌ¾ûîk<ğ@çI¯¼òŠ“ÀèÔ©“Sı3gÎsòÉ\'×úË•Ø(--5ßÿ½ùè£Œİö:Cêë=öØ£æyªğJKKs~ŸwÌ1Ç˜O?ıÔ™ÓO?}‡çVUU™¯¾úÊüïÿs’5¦víÚ9k¤,Xà¼¦gÏ;=¦¤›èïEI»ŒŒŒ¿OmÙ²…/k|Ğìµ×^ÎÏ-[¶¬é[Åë¿şõ/gy(^×­[Gg\0\ZÉ4$´Çü¶’’’»íA@»ƒ:Èœyæ™¦{÷î¦C‡&33Ó9\0Ø´iSÚòåË;çççŸ÷æ›ow÷İwojÓ¦Í_ï¸ãô \0$‡¿üå/üøã§j8_çÎk}®=(OY¶lYÇY³f}6`À€C\'L˜°¶‘?Nm{ÛÖ×¶Ûf5Ò>œ›!TÆ©Uˆ÷ĞƒÆ~\0\0 \0IDATÒI¶²M—+ÓPU±™·ŞzËIğüõ¯u’]ƒ6=ô¹ùæ›D—*ù”P«\ZÅÅÅÎ­JÇwœ±ıh.\\h&Mšä<GÉ1m«Ÿşy\'™¦Ÿ9äçgm·Uq¤›ş¯÷¸ôÒK$(úÏ>û¬9ï¼óœ÷Rò.äÎoZZMÒMûnrË¥÷\nNd)¡ç&Æ8à€šûİ×/Y²¤æÿJÚ8‰›«®ºÊé3Q¿ıá0©©©fëÖ­Îgxê©§œß5vìXç³·mÛÖyŞSUê_Q©Ï•|ô\'„æÙ6ÆT\'Xµí_şå«eªè©_cOoµ­mÏÚvc@©êQUJ.²íş˜Sâõ2ò?ÿ·¦:ÁêÆ¨ŞS¥øÒ¶qşÇ”ÉzÊÿÅê7Ñª¤§¾cŸş¹“D½öÚkÍÀ«?¤]~Gy¤.üá$Hñ‹_8ı£¤¤úäÅ_t’d|ğ·İv›óQL(vô¸ú5¸ŠPïÁPO\0@c\"™†„ôè£¾~ıúwW®\\ÙÍèx4çv^ƒigLMNÚÓ$Óv\'¿õ+¯¼2Üî¤ıÁîègo¿ G qİ}÷İŸØíÅñÃ‡¯3‘æ\Z2dHzEEE‡Ï>ûì“~ıú5iÒ¤Æ<RÿÌŸŒ(±í?şÿW=ç\ZÛ¦Öó}sMõ°¿\'ı	w_°Êÿ³+ÃıÏ3şß©ûœ¤–›R•šVºU²GÉ17©Q›‹.ºÈI6¬&¹¢$ÑO<á$?”QR¤U«VNBÊ¥×œpÂ	ÎÏJ(=óÌ3ÎP¾{î¹ÇIÆhÛ-ªLS¢ÆM¦é3‡²ç{:	Ñg×{†¢¿é¥—^r~Ögv©²Îuá…:óêé³+QT^^®}sÔQG9“†\nÿö·¿u‚J¤éùn‚ÌîŸÅœşÑ\\_ú[õZ}>=î>WŸQëï~÷;]YÖœşùZ~í–ÛÛ¶İï_¿\núS´|÷ö?ÿÛ^5Õ	Ú{Muî0ÿs4‡Şƒ¦zèpWÿû(¹ö¸©NŒéƒN1ÕÕ‹ŠÏ“Lu®¯Ùq4=w”ÿuw?ıôÓ\'j)™uê©§:ICõ«’\'t’“¤ÔòÕ0M-%É”„TrM}£ª’‹Š-õÉ?şè,ço¿ıÖI ½÷Ş{Î­Şçì³Ïvk¡è~%S\0h(¶&H8v\'ö^»“5â‚.H9÷ÜsC&Ñj£bµéÓ§wzıõ×?³;ìÙ»»éY\0H<#FŒ˜SQQq´’\Z­[·®×k¯½öÚtŸÏ×ãóÏ?ÿxÈ!§æææ–4ÒÇ:×TW©2Hs¦=¡|Š?‘q?	RdÛUğ»”4)öÿÜ×T\'O\\JâíçnUM¤‰İ•èQÕ”’îÿ•(ÚJ2é}4O‰0%L”|\nLx(ùåRòÅ­bÓPS%h>şøcçÿúYCA]I¯p”0‹äy¡:Ô©DÓçvuìØÑI†‰ljª$S?©ÿçTS‚L‰#—Aîk•lTrM”ğSbîê«¯vşß¢EİÆš2GÊ6êâ\Z\ZœôQóß–ùßËÿ%doö¿NTÑö›€×¾W®©N )^””Ëô¿^3+à5-MuÅ\\®ÿÿã‹‹‹õ{œ9Ë4ìRËÜ­\ZÔß¬š›,Uµ£›hUÅ£[ñ\'Jº)îDÉÖ¼¼<\'n¼ñÆşØPÃgµ4ošâlWc\0€@$ÓP}öÙ{òóóï½õÖ[=ûï¿ƒŞKg6{õê•òØcİõøã·¶ïùGz\0Ã!C2»té2·ªªê U8Õ7‘æ²æ™[¶lÙÿ›o¾™jßóŒÜÜÜŠFøxJ”<mª“ş†jJ¦Í6ÕI4%ÔrüÏkè¾ [ÆS´o˜éş a•J‚¨H‰%×úõëçT§ix§›àÚªBRS%ÖÜ¹skªÁB~Ø€$›ªŒTé˜lÓPT÷±pI%¼”´\rT•[(\ZÎX‘H‰!ıí3fÌ¨µÒÉ}LkúLªºség·‚JI¹p§æ™ÓĞÓZ~>ä£¦ºr¬—?NDĞõŠ«_øãÌ\":9Ìs+/•d}ØÿûÔù_šê¡£ºÕ°ÏòPo Ê=Åbú»İÄg¸yîê:ª˜tu¹í;Å¨bVó«éçHª)\0¨m\nHÃ‡¿%??Ôˆ#<‘Ó©‹Î‚êıF}ıÈ‘#WØö=\r\0ñM‰4»˜ß¶mÛo¹åg¸CÜxã-{ì±£~øá‡÷í{ŸŞ	µ!æçù§Üı5÷=•ÔĞĞ:%/Ö˜†\'Ó)	£İHÿÿ5—–ª“zë?ª SâIó”‰*}T•¥j£HûPIÀê1÷}”,R¥–šæ·\nGUhnå’’!ªF¼ğA`R*ÜğM7á&ú]ªv%ÜE(T)vÃ\r78s{_` ÔEô·)a¤ÇôZ·úlÑ¢E5t¨mb|ı\rsT5W¨\Z˜ê„k?÷c›ê¡œ\'šŸ‡ò†£ŠÄ7Lè9ùÜXæ&^ï÷7-,UO*zPm¿L¿úTÕa»\"0i*J¤iŠQÿ„[^ßS\'	¬DZC¿ó\0\0LCBøİï~·oqqñCÃ†\rKi¬DšKïwÛm·¥<ğÀ£íA×»ùË_Ğã\0Ÿúõë×ªcÇó:tè°ß­·ŞjtUç†Ò{ØíDæ#<rø?üğJß¾}9kÖ¬ª¼¥†wŞçÿYÙ¡ós²Äµ¶	ºGCş4Oè¾¦:i¢!¥ªpÒ…œIø5˜&‚\rµœ×+z*“T¥¤J·_şò—ÎıªLSbnÂ„	;½F‰+% ôšO>ù¤f¨Ÿ*Œôúo¾ùÆôéÓÇ©jSÂII.%íêºº¨hH ;çZ$”¼S5œyšïMMÜ¿C‰³`J\"éóè9ê+}~%ıt›››ë<\'x¯À	ô•@Ók¯¹æ\ZçoR˜êùÌ÷?åuÛÆ›êÊ°½üË.’9ü4wªË”˜ÕpM\réÕÅşZKŒ)w´©NÖó?§4’¾Óß e¬yáÜ¡¼ªtT…^$ËJÉ3\r—Ujh±†ÍºóÍ©?kK©?UM¨[æL\04¶&HÙÙÙï~úéé\rÚvd/»ì²ô·ß~û\r³ã$»\0€81dÈvö€{]§÷ĞÁ¼’`ººd¨dæP;øàƒw¸Oó7İ}÷ÎSh>òÈ#Î•¢o½õÖV£G>Íãñ¼Ô·oßÁ\rH¨]hª¯¶y­©NÌ\nó¼\n³ã0ÍHh\"úÀÒ0•e¹I%JT]tÿ}‡<æT)‰¡êQòBó]…¦Š†M*1¦ê4·*KT!¦D›†îS¢M‰´ã?¾æê¢„–*½Ti¤$šŞ¯©çÃRÒK±#WÕıÚW®†S5”®Ğ)šîßÿş·“Tßi\"~÷BîE\\ªLò)©ùÁÔºĞÂ‡~8%à×èâ×û÷O´l›Ÿ‡\\æı	óÍÏsä=ä_¾šŸ¯Ê9> ½v–?ÖôØ)ş×eúïw“½‹Şß‰Q÷$§—Jh)¡¦‹¨Ï´ÌÜ„˜*Ï‚«5<Ö¥ê3Å€»¬U%éVŸ\r·Ü´H¤\0\Z[Ä=»£zyjjê>šã¬)éıßÿı=íïûƒİ™†€ø¡DZvvö7‡zèîº\"¢;“††©BMQ+V¬¨y¾®\\ùÏşs‡÷p¯fé:è ƒœ!‚J¤‰$£Fj9|øğ·oßÛ·oß!\rH¨•™º«Ï5ÕÃë¦›ê¹®TÍÖÛÍø“\Zîï×{)9VôE!~o^¨_¦¿Ï(Şå&ÖDUkª4r)9˜¼PIÉÀ+uº”h\nî_—~§[ùLï×œÊ+Á£Dk¸Ç‚«Ü\'ÇW_(öÔ‚éJ§ÁWàpH%~ıë_;ïñÖ[oé®¾¦úªœò¼¿Ó2¾HEpæ8Ük§ù[ SbæÒ0]<ÆgZ¶.%@ß}÷İ/t¯°\ZªïDÉmÍQŠªkSWå\Z\0\0õE2\rq/==}ÔÀSc¨N]œúÂ/Üeª‡E4«œœœ{<OşÊ•+§6pø’1„dUû~{ÙmÄœ#8¢óo~ó›&6?úè£ÍìÙ³DÅ²eËœû6mÚä$ÓÜÄ‡*ƒ4ÄÌµß~û™¬¬¬†§i[4bÄˆ–wÜqÇ%>Ÿïoö®ë\ZğÑ• «íïWb¤¯ù¹búæ:úô’¦üş«ê,Ü„ıµQu™’rª|¦şÕ’/¿ü²Ó«W¯Ö]JxNemQwl©\ZN	<\r\0 ±LC\\»üòË÷Ü²eK÷À3ãMé°Ã3^¯·«Ìòòò\nšùÏ½Ï˜i˜Äfûû§Úƒ¢«ªªfOš4©,Ö—“Ru°š’’â\\õíÄOû\\Û¿æúë¯¯ö©Ï>ûÌ®uÉ%—„|\\iHğP{Àk~øádùÊCAt5¾.]º8ï]_Ï?ÿ¼S…Ò¢EVÆM«[ú÷ïÿ]îÏîj¬j}İºuë¯N;í´º’_¸+^{íµæöÛowjîüUšìşœsÎq’fï¿ÿ¾ÑgıÃ†\rÎóC½_vv¶“P³mÈÀ½üòËÛÅ~ˆäïUÏ>-ñÿÇÇÊ÷ß>”p•HÉFÃ[UÙ§h¶K/½tXsıîX8£a»’¨Uå©†Åj]æâ\rH’14¶º\0ñ¬]»vWyä‘iu]>½1ıâ¿Hoß¾ıUÑú›í†$ÛŞüÚ½kÿî•˜`Û9º:]¬.\'\rUqç=yúéÚ/<7qâDÓ¡C3mÚ4§)aáÎOSML\\YYöq\r™±âšÄŒûş_}õ•s;uêTs×]w%Å÷†ú™%š¿G”@Ù¶mÛMóA¹‰•à+j¢ñ/¿ür‡û‚ŸƒÇj–mûcµØ~‡\'Õ\'Vís{)‘vÖYguĞ÷¿¶m…†€Ù÷­™ßÊ‰?ÿùÏæŞ{ï5Û·o¯¹¿M›6ÎÜXö½Ã¾Ÿæ‰zà²ìsï·ï{cõ©&äïÓ¥¶_^ŒÅï¿&úf«Ä·ªŒ\"¡ï¼¾¿‘ŠäùzÎwß}çüø9ÜJÆæ “AJÕ5?XP\"öõİvÛ­ÔÆËDÅ‹.äÑœ@Ã\\ç0ÔºWg¡¨ŠÔ²í^íÕM¤…ªïú•W^¹Ã}µÅÄ“O>¹Ã²W¬j>»p4Ì4ğâ\ZîE4êòÒK/ÕÄ]œschƒ¡—¢CõÕÔËLûZ¯EbÌ˜1;Ä®âUs.&™¸‹!—ÖUÿùÏÂ>®õUà•¨C	Şşé=C4«N(ïŠúl3ñ3*Óßœ–váa‡Ö¬IaÍ‘óùçŸŸo¼7º •İ°(C”cWÂ[íÆåU{ 4)ÖÎÚ¨ÒCCS´¢nß¾}­;.óçÏ7‡~¸“ä%A4Qq(ÚñÕ•äÜë-[¶ÔÜjíĞ¨êÈınÕšªÜ¹SÆïü.%Øî»ï¾dü\Z%e­Y³Æ™ÛIï©+äièß¨Q£Ì¢E‹œyŸT±(ªÑ¤ßúyyyÎÁœªãDC­”xQÂN´£¤÷»í¶ÛX97\r]&ñW6^e—ó6«oªº*\\¬8°·›Ù]tQË.¸ ¢_pä‘G:W†Ôú@á²qãÆšŠ4Q’LC<5÷S]”Ô=ztë»îºë‘Áƒoµë¤ÆP*;¨ÙÛ‡Ø¿oˆíÓ2Û§“mŸ¾ßÿ^xÁ¹Ú§KIò¿ÿıïÎÏ:PÕ¶Ø¥$¶æg«	¢[“Õ‡zN}Ÿ/Š÷„Œ.X¡ï½ªRUñ¤¹¾ÜõB\"8óëÔÔÔ2»ıÕ0Ó1³rss+šòwk»­¤˜¾›òê«¯š›nº©æ 0°BXÕËºh…|øá‡Î²s·ù:£“gÁ[ës¼ÑÅFT\Z|•x%2Üß¯ıŒóÎ;ÏÌ›7Oëœ¶3ºâ¨¶_Ú6)†İí—ŞW¿K®:Y¤í‹»¿²yóf§ºU´ÓÜqzÜ¥ƒåx7CJ~(™?Èş\r%6†”Ğ1‰æZfú¿ö/xàòÚ7Q,ª’:ğùúûDë×¯¯™péÒ¥fï½÷NŠX¡`Z_h˜~m…_ıµ_šƒ5Ü¾­Ö9Zß¸T­¬QŠIm¿4M‚â@	ZÅ‡ŞOñ¥jf7§Òÿ•˜=÷ÜsÍ?üàœhĞ´Ë—/{¼’iHPöË¿Os—ík¢i{pµOv‡.5Ğn\\î¶Ûn›ìÆå}ûÿç¢µqÑÊ\\;˜áhçá–[n1“\'OŞáàI+ríÄj#!^xaÈ«»¹;nÂÄ5ÿW’ÌİÉq¹Bî¸ ìAcÍÎ³æCÒ$–41¤ƒ£Ë/¿ÜùY•GšÀ\\Îj:íN®\n‡Àä]àçÑÁ¶Ö\Zş-\Z†”,;³1 …›X³ßÙr«:åû”«n\"íÊ+¯Ì\n5Ù}mú÷ïïT¬j§Së˜ÀDš†t_pKmkÃ‡Ï1bÄßì:h½=Àš#}X¦§SÙ­ÜÄšíÓµ¶Ogº‰’æş`:X•3Î8ÃY—k˜(‘¢}WË½¸A}İõy¾~Ÿdt«Ê#ˆèª›nòFë€dH¤…Ğä\'bÔ×\Zş»×^{9ÿ×	1-#-­ÓuâD‰4]A\'ĞtBM‰³Ÿ~úÉ©ÚPµzp5j¨“1Z—+æ´®p÷!4¤TÕêÁ‰4ÑYİ“oš‹MUªóöº‰½V	zíWè>U×é€W¹Ú–¸¿Ë=)(:è>}ºsBÈuñÅ×Ä¦Ö?:Ù£øõÙâ,)ÒÎÆ®Øq…]¦[Tõíd~s-3U6ê9úÉ4ı¾SO=5ì~¯Åšf@ñ¥}X­»çªPÒº(Ù®V‹1L¬ÑmS´=s÷=ƒõîİ{‡c\ZÑI=wjpi½¨jEM?¡“NÚ&•––:Ó›Œ=ÚI²¹ï¥ßÛ«W/ç$Âe—]æhj=®u¬{Q!7^A2\rIÄîDµÓÕ³š“VBvÃÕÆ®°GÆğÆ¥µİ¸¨ëítÚÏºDgÛšu/»U+ç€Ä=\n¦‰”UäÒÙÕÕ®j~üñG\'Ñ|¦7v\"Ü•pešæHsé\0hñâÅÎP-ítkw‡&p¾=ÍvÏ=÷4Ëd×Ú@CÑ!U¸èÀKÏ×º&¨Öj(:°VâM;Úîk5|X¯/((p*˜4‡VsPâWgc9†šQK«ÊrçÕUö€¢­=ÀÍ¬o\"Mt–èĞ¡Î­SvøE66~ÿûß×:¼3ôùÓŸş”ñĞCµaº0Á1Ö‡5Ù ûÙ|öûß) Qâì¸kg=Ü^cÒ§”WbD	%²t\0¢Ê1U„(Q|ĞXßDw¤Ï×ß¿jÕ*çsiİ¢û•dWò%0¢«*™_[ålk’1Úë \Z¥}ûöu¶åÛm­“•˜PrAÛÅˆª‰O¬))ë\r›OÛbíGè`W?ë{¯õº’¥á’æÏ=÷œ;v¬³¢u^¯„ÈÌ™3“zZo¸.ÑpÅÆ”)SÌ AƒœZ\0+‘¢Ï¦íI`•¥*Itğ­}ıª~Ó¶iÿı÷wªóôz½W¼\'ÒBÈ2?\'ó5œxš]åFãd^S/3Å ®Ş«×èıi§9İu­brÖ¬YÎ	`Å¿vÇsŒ³ÔºH±ªu¤[‰™äb&†\\ZNŠ÷BEªş\Z1b„öB^]XIQ-óºNĞØõ¬Ù}÷İÍé§Ÿîlµ?ê¾FÉ}û7;qçVåë¹Ú^é~­ÛtBë-UÄ1ï/É4$1»ƒİ¢¹/u®ßgwªuªóŞ8êª}tfCg$š‹6ÚY8î¸ãB-7§´8°œØ=pQåÎ˜häì³Ï®yÎê9:sãD©ò¬¶Ê4—vJÔTq¤³ÚĞh®	í>óÌ3çhƒ¢\r\\s}ÿı÷†Šné`XÚ©Ğ?%Ëô7öéÓ\'ìgRbV;A¢D{¦ß©3ÊÍEgÉ5¬(Îb¨¹ì¦õ´–Í.û>û8òJ”V¦é ËM¸Ô—4={öÌZ¼xñå±ÜyöàÃ|ŸÅ\ZîÜóJê{©D±Öáo¿ı¶ùÛßşæ|ßµîVu‡’Áªo¢»>Ïw/\\£\rÛÕsôõt+ãõ^Z/4Çö#Öé}\"Fˆ×]w“àV¢A´üıë_;1©Çİáuî>šîÓ:^\'XTµ£$—»¯œ„U¢Ô=)£ƒX½æ7Ş¨©l¦Dˆö=´ìurNÓh½ \nµÀ¤è¤ûøã;\'üoZvJÊ(Ñ¯a_î>ˆKÃÁtà+ª\ZÑ¶Eñén{#²¯ñã§‰+ûÛ8ê¯êß¿ÿÿšëd^S/3íoè~Å¨ª&İaË.Ô¶Â¥xÒëzè!\'¡¯SrY‰íiİ£Ï8D=Ù×AÑ!ÑïT\"MûÚ—uç#SE´¶ZÚ×Ô”=zôØa¿Wû¯JÄŠöóçŠt©*MÛEwø°»ŞQõ£;Xó8jÿYÛ%=WëBí·j§í™[™æt¤2d\Z’1€ÓÒ¶ÚVFs&Ô´‚´;‹Uvı@3ÿ¹‘4{íçòÚÏ—´s»äè£nö¡©:{¦*‚`J`¨,pçBgc´P¹²t4–_I/½^ÃıtæMgëËèBsb\\}õÕ5ÿœ£9pÀÚH\"†¢C:XÖY;QÖ¤óŠít(!XÁ|vP;$îG~~¾3Zÿèçnİº5[¿h^\r}Ö(ÄP,Åª¯&èbJ6VWÚ8èh—i‹Hæ5eÉ’%Î|4‰4÷`ûÛo¿\r¹s[UÔØe¶Å~¾×¢T™¶Ë‰W%\Zz)%15t[\'<”Hs‡ëë»«ï¹’Y:à\r’_ßDw}¯\n$=_Õ°ª$Ñ÷^²îkU©˜ĞiJq˜HoÔ1JzŠ[\ZœÓ>šª?tòLÕzâ×¥y¨”ÖªÒú^É6%Q·nİêÌ§>Ö¼U:ĞUÒLU‹ª6Reª*;´ı½6ğ½·GnòUÓKhX±Úî(1¨˜Q%‘æÕ\nBIUdëºŠIÍóÖXSÄã‰»ÎÜ·¹Næ5õ2¬\n¼¨Mğ~Fp‚Oë }6Å¤¶KGu”3”Y‰}Å¬>g¨XdÔü1¤•ö)+Jn\'LUM¦‘2Úg\rL¤¹”„sçÕvïĞCİéıU©­$˜bRóıºT«ÿÿå/Ùa›­õ™¶aªğÕˆ.*ÓH¦ôôô\r%%%]›s+U?Ùß[:vìØ‘Íù·Ú{Ø–İ°Vù“)ö6Åş¿ÄŞÎÔäÜvÇošÊ›¯¾új_s/Ÿc=¶æL²Kg†´#œ°ĞŒÎtélŞ§Ÿ~ê¬¸ImÆ·ÓÁSà|gÁÃ<µãòÈÛëu>“–£6¬.wæ¢-»³FE)†4·„mÚ¡Ğ•†ø¨ÒM¯×œYîAYp¢^nnõcà¸ZsV¦é€RgÌï¸ã‘&Õ«Ûm\\º!…ŒUÍ™fwF?.//Ï¶;œõšĞJË]IœPWÖÒzC;ºª¨ÏPOÅÆ<Pa?ëoíAşøXëÓ}\\jûs†Û§ıúõÛ²«y»B‰%6”\0×¤*1” ÑwSUƒ\Z­¡Ù:hp/PßDw¤Ï×’ez\\CÆƒ“fzns%Ò$J‰ô¨ˆQkÎ UòÔvÅdx*&tp¨ƒMíhß@¯Õ­[m¦ê­ËuPª×høœ›”Ó®¶1\Z:ªŠ5ˆÑVŠ3\råTUCşÜ$‡Cªöp+à”TQòMIm{t«øQ^ÉâüãÎLTå¦uyğµ¦6Ğ°@÷ª|Ú?	<±£9º‚«3c<~\"!÷r‚-\Z;†\"¥Øi®e¦jKUœÙmVÍsµOâ	té}5lXó^ixºâJ1úØc9•‘ŠI½×®Lk@5>Å‹;€úC‚E	6ÅY¸êy­‹ÜJ3%ïƒ¯Ş¬÷w—µÖasî)A«}Úàã%%Ö3Š-½Ÿ=vŞ¡2Mû3á›@2\r	Ìn´¾,((8×®4R›ëwj‡Ş®”çFûO·;­•ösdø7ú.ëÒsÚ«›˜••5ÓnœK¢½|´¡PÓ•¹WÕÜpˆ’jÚ¹ĞY·Ô]s“„J˜ê~·´Ş=Ğu\ZÒL“Òë XÃşt å^­Ï=°J¶¯O2ÇPğ|3ÚiV,Æ“v¦ƒçˆÒNQ¨pHÍ@£ÛæîûiµÆêË/¿<¿ÿşÇÙå®SÂ­ë“PS•ªiîA‘F=ºjºO±¦xÒ¿‘ĞìèÑ£7ÛuÌMÑJ¤E¨Ü¶wCõi¸	“›Š’hšYß}%¹u«„•–æ+Såšvü+Dê›èôùJÄ¨¹W¬m97Ç<VÑH¤GûDŒªu\0ZW°ª’UQä~7•ˆÕwU¶JVè=´Ÿ ajºèŒJup©“/Ú·sdúY‰1½FÃ­Üí@p%p;¤¡¡nN?¡$œª‰t\rßREµª—T¢jUmÛTñ¦!YZ¶¯¿şºó\r%ÔçRrEÈîvG\'‚t¿®4\Z\\!«ñSGm±1“âßiá©¨Ìk®e¦SNõŠÅ÷óÏ?ïLEáÆš¶9Ú/QÒCô³Ö}Zj_íëèÄ`s%Òˆ¡úÑñ†–{ Å•øáFUéä‘;:9\\WâN#8eÂU<ºñ¤ZW)NİáŸZç)Æ¯`\r’iHö€gúW_}uü±ÇÛ¡¹~ç‚J¶nİú^”ÿtw£¡J]îm»R\Z‹—„x°¡‰~5/pƒ¢Rdí°¸‰	­èƒ¯Æå\nL|ìÔA!&ïÔNv¹\0\0 \0IDATæ¶ĞA”6@;¼Á“\'bÈüœDÕ†*×´ã£\rTåbp2Í½\Z`ğ8š\\‹úÆª=ØÈ·;ß½Çÿyyyy§/¼°Î„š*u%Oü¸”0U2Í­^ÕÁ¶ş¯RÍËW¸Ûéõvgõ®	&<£	´I±öı×A¢»ÎÖ²Pª*†4DÏ=QœH¨o¢»¡‰qĞjh ë‹/¾¨õêÃ	¤ÙOÄh˜¥¶×‰Îp\'À·ıª*Se‘[e\Z|¥<—æ›Òp)=®ás\Zæ­ŠMü<A|}h¡‹R¨\nD\'g”$Q,ë½E÷«ÚQ:p?wğ04Md¯íŒŞKW¦V¸ÕÓqLñ¢¹uµŸ,ÿ41q2¯¹–™¦™8ÿüój5äÕpb%{•¬tUâW•g:‰à®5ÏŸ*-5Pû!šª\"	ÅlRâQ\'ciÛUÛôDJäºÛ9m‹Ü„¢ıÅM U:ª’ÜİWv‡tªÊZ1«+ÑjÿEI\\Íß¬mŸb´¹/èG2\rˆ…\0NK›2oŞ¼û”…w°ÜØşûßÿzıtQ¡³-öf–]!ñ_¡¦$Ö–‹v@t6Å­Ò{Ğx¹pˆê€DgàT¦¬ƒ‘ıöÛ¯f#¢%¿|ğÁº÷î½ŞšJ’pôşÁÃqôû5œ£¹¯TMÄĞq£½Ÿ†Iˆ*Ø4”Og~µÃÎæ©b‚Š´ØU{`R““ó‹W_}õ³òòòööç°“ƒè€[U,C¾µ]Ñ¤÷vÇÜÙÁuÏøj~\ZM\0¬en¸§Ö)Ã‡_oŸû¨¥ÆPŸ*Søa¬~ÿµt&_•:HuÏº+ù¥áØ‹-ÚaÂoW}İ‘>_ñ ªf7!£u†*çtu=U7)a*\Z~¨d¬{Qƒµ1ÛxÍw§ƒÄà)\ZÜI¹EËIÒI%ÈÜÉºƒéq%ÓtĞëÎo¤ƒQÅƒ*~T	¹+W²ÕAª&JĞº¯Â¥jıîÊ}Úé1UE¹W«Öûh{ÖÜßjd­\"1u2¯9–™¶ª¼ÕïÒzC1¬„¾&¤×º&p?Õ=i aïÚşø/dã$ì¯ªÂÔ6JnI’Ìù\n¤dhğœi\'ëB	Y£ÿzw;LÛÁà“*<é¬×*i¦ùƒİ¸u/X¡Ä¬bQ¿\'xJLC?~|Ñ AƒæÛØ#íF¨ÉgŞ\\°`AÙ–-[~ĞZşÜáv¶Àn,&Çzõ{õÌúĞpŒà³{Ú¹\r<ûWÕ5‰fàŠæÀqwT4	}’ †‚÷ÆìNqğò×sµƒZ×0>\rfâÖØUBíØwß}÷#{ğİéòË/Ï\nuòEŞ+iXñ¢¹aÜá6:¨Ö°U¥i~F\r‡Ğk†\r¶Ó{éŒïğáÃ×ÙØ·íÎêc|ÿ#§N}·‚çhÓÁÁèÑ£„•®xW[er}İµ=_¼šp[ÃMİjUÎ¹®×^{­“´W5«*¨Y4NÄèû¨‰ÕuÒDß7÷¤‡’Øšx=øjÏ:¢áJºUõh˜ŞK/½äl´œµ¬T}¤í¿ª×Ü!ŸîI•ûî»Ïy*’”¸U²5p{¤m„*ä4¬´.zn`,+ÉîR²/øb&šÃM\'“T!­u“ú,šp^ÉAU¢Äkâ$Næ5õ2SC•ïJœé¤öA´/¡ª3U©©:Z±¥Ÿİc)1§*9mƒ”|SœºûJÔ)¡–,É´xˆ!—.8S‚+ÕD\'kÁ´îS\"Lë(%jƒ)|NÅU ­ÛÜ“GZ7jç&Û´ÕIh7É§¹HC]áyèÄ»\\bW6ÏüıïïÚÔÕiöàú\'»»sÂ„	ãâ­ŸfÌ˜áÔÑ£!Kgy¦‡B2ÅP4åääìe>>êÓ§O\'»cºCBMC4¼FC&Üê3%Ntğø<%Xu•O—šT 	Ê3Ã†\r[i˜Ş·ïwÕ¬Y³â~BÆxûî»WSlªç\'Ûwß~wîQ\"Ö¸îR\"6\Zñ£$\\ğ•>#¡Dx]”uqšH^W×çR*‘³+Ÿ;Ö·ñCMµÌve}kë(b(64çU\\Ù‡\rÊ4Ä½	&L0`ÀĞÉ“\'oíß¿Ï¦ú=S¦L)Ú°aÃ²•+WæÑë\0_T¡Ö¯_¿c>ÿüó÷}>_ë®»®•eJ =şøã;=_‰³à4ªP•K•jJª©RJÙwŞygÑš5k>°ïû›DH¤Å£útRaZçwçş¸;ÀÙÅ„T$	±PC,#½¢kmŸ+‘ã0c¨©–Ys½†J|ñšHK$$ÓìÑ·Şzë‹Ş½{—ÙƒšFŸ\r¼  `óäÉ“µ÷ÄÁ\0Ä©I“&2ä„/¾øâıG}ôÀaÃ†µÔy&Lˆèõº²_¸çª¢íŞ{ïı¾¸¸øÛU«V±­\0\0\0H`)t*ªªªn|ğÁËW¯^½µ1ß[ï7räÈ2¯×{³=ˆZDo@üÒü*©©©\',^¼øËÇ|“†e6†ûî»oşòåË—eee\r ‘\0\0ØH¦!aLœ81oëÖ­w6lÃ¢E‹Ö5Æ{.]ºtŞ¯¢¢â‰xœ\'\r\0°3ÿ|+çäççzÿı÷ot¯Ô¸«üñÙßÿıÚŒŒŒcıâ\0\0\0h8’iH(yyy¹[·n½YWü\Z;vì|w\"é]1qâÄ¯ï¹çíÛ¶m»Ëşü½\0‰CI¯ÔÔÔK\n\n\nf9²|Wj<òÈ§_~ùeZFFF?i\0\0\0Éd\Z*Ô|>ßÑÓ¦M[û›ßüæÿıïÖçõ_|ñÅ÷×\\sÍÂ)S¦l´ïsŠtô*\0$%¿Æ{ÙO?ı4ù®»îÚdÕëõO=õÔ‡sçÎÍŞ¾}û™\Z>J\0\0$.@€„¤9ÔìÍ™999¿²;¿ÿÇ?şÑ~¿ıö+<å”S2÷ßÿ.;vl—™™Ù²¢¢¢¼¤¤dÃÒ¥K×ôÑG¿ıöÛÛ¶m[m_ûBqqñ8æ½€Ä7nÜ¸!ôŞ~ûí9£GÎêÜ¹s¯Q\"íÓO?İ;%%¥ÏÄ‰ËèE\0\0€äA2\r	-//o²½™|ùå—ï¹xñâ_-Z´èûÿö¶¥úŸâŞ.³í?z®?\0H\"/¿üòÕƒ\rª>|ø•#GÌÖU>ÃÉÍÍ}ûÓO?=ÊşxÜ„	ÖÒ{\0\0\0É…d\Z’Âøñã‹ìÍ_ı\r\0€Œ7îºœœœ¯GŒñÈèÑ£[‡J¨ÙíÉÓ§O?\"%%åÜ—_~¹€^\0\0H>Ì™\0\0à———÷lYYÙuwİuWÅ’%Kvxì7Ş˜8uêÔ4GÚË/¿<ŸŞ\0\0HN$Ó\0\0\0L˜0a\\EEÅF\ZµõÛo¿uî{íµ×&åååb<wÒ¤I?ÒK\0\0\0É‹a\0\0\0At%ç”<òÈ#ã÷Ûo¿o.\\xª½»Ÿ½ÿKz\0\0 ¹Q™\0\0Â„	¦lÛ¶í²…íñxçååÍ¢W\0\0\0@2\r\0\0 Œ	&LËÌÌl¯[z\0\0\0B2\r\0\0 ¹¹¹%ô\0\0\0\\$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó€$áñx*½^/üËÁK!Ùb\0\0\0H$Ó€dù²§¤,Ø´iÊÊÊ´<CH¶B|\"‘;â1‘n×U>â\'fâ§ĞŞTÅáş1DCÄPìÅ‹HÛ·oŸ¶nİºUôDômØ°a­İL\'†l1„8İY$‘3â1‘™™¹šø‰™mG¾½™oŸ›\"†ˆ!b(&÷Xœ@rğù|¯§Ù[:#ÊV¬XQio^%†l1„øD\"=¦Bâ.‘>»´´”…ì6|£½™oŸ›\"†ˆ!b(‘L’ÄYg5¿ªªê‹eË–-§7¢Çöÿ²ÊÊÊoÏ<óÌÏˆ!$[!>‘Hñ˜H¯¨¨xdåÊ••ÄOÔ¬_¿ş‡\'bˆ!bˆ\"†bÉ4 ‰x½Ş›íqxViii	½ÑüÊÊÊ6fÛå0”B²Æâ‰ôØ¯‰ô“O>y=€ızÅŠ,Ä(ÊÏÏŸa—ÃŠx<CCÄ1‹H¦Iäì³Ï^doØÙ¦ÒÒÒuôHó)++Û°`Á‚õöÇ«ìrÈ\'†¬1„øD\"=êßÿ¸N¤WTT*((Ø¼qãFf”””¼±~ıúõ=×¿\"†ˆ!b(Ö¤²Xä2vìØ%ƒş¦¸¸¸_eeå—íÛ·ïéñxè˜&´dÉ’O/^ÜÎşø»3Î8c*1„d!ÄŸqãÆ­½âŠ+æ­Y³æÜ¶mÛVefffÓ+ÍÃŸHßèóù~{ÖYgÍ×ø±Û9ëÖ­»ØÆOfFF¶`¿ùæ›Ãìvúºxbˆ\"†ˆ¡XD2\rHBJ†\Z4èM»ƒ~ZQQQvyyùg)))›ìÁQ;»’K£‡\ZÆëõV”––~]XX˜¿xñbŸıy½o`\"m<ˆ!bÉ¹í ‘Ş¼)‘îßn|¹jÕªKlÜ”·iÓ&‹øiRùùù“\n\n\nNÓl¢œÌ#†ˆ!bˆŠDäŞ{ï½Şvåv™ı±¯mGÛ–I¯4X•©¾äó,Û^Mô‰â‰!bÉeúôé½RRR°íğ;.ìÒ¥KçöíÛë>¾û\r¤DúÆ¿µzëÖ®]»÷öíÛ4$&‘†vûãçÉ´´´ÿëÜ¹sQ§NºµmÛ¶«½\0hxünØ°!_WËÓ$ßš›(Ñâ‡\"†’5†ì6Á|üñÇæ¤“N2öóC1€d\Z\0\0\0êDz“HšD:ñCüCÄ1¹¹sçšyóæ™ÿû¿ÿ3Gy$1H¦\0\0\0\0\0Ä¨œœœ‘öæ^ÛFååå¤G¢ZX\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆÉ4\0\0\0\0\0\0 B$Ó\0\0\0\0\0\0€‘L\0\0\0\0\0\0\"D2\r\0\0\0\0\0\0ˆP\Z]\0\0\0\0\0ˆ>Ÿ/séÒ¥7”••\rÚ¼yóååå™^¯—i ÇãËÈÈX×¢E‹9•••xâ‰Ò+@h$Ó\0\0\0\0\0qaéÒ¥×~ùå—WTTdwíÚÕ¨µnİÚ¤¤0èª¡¼^¯§¬¬¬ÓÆÏ+..>ã£>únË–-ƒÎ>ûì|zØk\0\0\0\0@Ì[¶lÙ”ÂÂÂg:vì˜İ§OÓ£GÓ¶m[i•°ıØ¦M³ç{š£>ºE÷îİP•Ú|p1½}_è\0\0\0\0@,S\"Í¶‹9ä³Ç{hH\"ÒÄvß}wsÄGd¥¤¤¼4sæÌèàg$Ó\0\0\0\0\01KC;—,YrñèTNÛZ¶ÊÍÉ|ÿáh³øƒ‘fÙÜMÅÆŸè¸FĞ²eKsøá‡·öx</MŸ>ıPz¨F:\0\0\0\0“t±/¿ür†vª\"-˜iËçşÛTm+ßáş”Ô¦ÇQ¿1™mö AQQÑú¥K—.8ãŒ3N£7šVÿşıïôx<Fúü¼¼<ò:Q@e\Z\0\0\0\0 &éªºØ€††²¾ğãiâİ¾Í¬]:‹l${î¹g‡´´´ıgÌ˜q,½Ñ´RRRæÓq°œè\0\0\0\0@,*++¤+v†›#mK-Ã9Uµ†ÆÓ¥K—b{s=Ñ´&L˜0Íçó•Døô\"z,:H¦\0\0\0\0bÒæÍ›Ô;Ãñm¯ÿbŸ—lD:uÒ˜Ù¾ôD³˜\\ÇãeNˆû|Óèªè ™\0\0\0\0ˆIååå™­[·¦#b€]İìMoz¢éù|¾‰u<Å)Õôx<ãé­è ™\0\0\0\0ˆI^¯WsHÑ1À¿Òè‰¦—=ÛŞ¬­å)-õxqqñlz+Jßº\0\0\0\0\0Ò³Ú‡},-ƒŠ6Ä§ÜÜÜ\n{35ÌÃ[ôÏç›2kÖ¬*z+:H¦\0\0\0\0âR‡Ç›´-wº?5=Ëtèy\"„x6&Ô>ŸÏÉã¤¤¤¼JEÉ4\0\0\0\0@\\jÕù Ó²Ó!ïoİå:qKC8}>ß¦àû=O†½)Z¹råLz)zH¦\0\0\0\0âÖöÊ-;İWµuƒ¸¦!œ\'¸:m›şÑU<â]$Ó\0\0\0\0\0qg[ù\Z³ì«LÙšïvz¬|İfÙ—ÿrÄ+ŸÏ7=ÌCïÓ;ÑE2\r\0\0\0\0WJWÌ5Ë¾zŞlŞ°4ìs6—š‚9Ï˜\rË>5>Ÿ—NCÜYµjÕ4{³:à®¶­õz½Séè\"™\0\0\0\0ˆª4[>oŒYùík¦j[yÏ÷nßfV}ÿY>÷ES±i%ˆ¸âÊùNĞİÓ&MšTFïDÉ4\0\0\0\0@\\P¥™†pÖ—*Ø\n¿xD<ÚaŞ4ÇÃU<c\0É4\0\0\0\0@\\P¥Ù®òy™¯ñ\'33ó³ÀÿgddÌ¢W¢/.\0\0\0\0\0Äƒ^gÜO\' ©äææV8p¥×ëí–’’²Æş¿„^‰>*Ó\0\0\0\0\0\0bĞˆ#¤§§ïÖ±cGco;şéO\ZB¯DÉ4\0\0\0\0\0€3lØ°Ë–-[öÒÿøÇ”§Ÿ~ÚÜ|óÍ)«V­zŞŞ¤w¢‹d\Z\0\0\0\0\0@QEÚÚµk_¹ñÆS<òHç¾#8ÂÜtÓM©6lKB-ºH¦\0\0\0\0\0ÄˆQ£F]¹|ùòq7ÜpCŠ›HsvØafèĞ¡NBíúë¯¿”ŞŠ’i\0\0\0\0\0\01@‰´‚‚‚ßtÓM;%Ò\\ªP»å–[RËÊÊ&^qÅÓkÍd\Z\0\0\0\0\0@”\Z5êr7‘¦„YmT¡vë­·¦Û_¹òÊ+Ï§÷šÉ4\0\0\0\0\0€(\Z:tè%K—.£¡u%Ò\\J¨İvÛm-¼^ïë8‡^l>$Ó\0\0\0\0\0\0¢Di%%%“/6)%Ô†\r–––özÿşı/ 7›É4\0\0\0\0\0€(>|ø ‚‚‚±»’Hsù‡|f¶hÑb	µæA2\r\0\0\0\0\0 ™)‘VTT4¦¶‹\rDJCC‡\rFB­™L\0\0\0\0\0hF\ZÚé&Òêš#mòäÉ5­6ş!Ÿ™ééé¯0‡ZÓ\"™\0\0\0\0\0ĞLê{±W_}µ¦ÕE	µÛo¿=+55õUjM‡d\Z\0\0\0\0\0@3hÈÅ\"å¿ÊgvJJÊd†|6\r’i\0\0\0\0\0 ÉôïßÿXzÁI¤]ÙĞ‹\rDJo·ß~»®ò™GB­ñ‘L\0\0\0\0àÿÛ»x«Êzoàk¦ƒˆ¢8„šæ@İ²Ş.)yÒ›i9\0aeƒ•uº]»æ}oêí½YŠ‚Yi¥E*ıh%`…I^CLÑ”Qeæ\0Î9{¿ë¿bŸ{€spgØG¾ßÏgµö°öÀ³şnz~<Ï³¶qÿı÷\'>úh³Ï/^¼8©©©Ùá{<óÌ3M>¾`Á‚lÿÜsÏeÛ®Ú¼ysÙ¶ßĞ¡CM·QéöR.—ûŸ=½¶i¿h‰‹\r”êøãïZÔLùlY5\0\0\0ü¯ºººdôèÑÉ\\Ğì1Ï>ûlòØc%ùÈGš|>‚¶Xãê;îØî¹¯|å+É~ô£äˆ#Hî½÷Şä=ïyÏvÇ¼üòËÉƒ>˜\\rÉ%É}÷İ—tíÚ5©¨¨È>÷øãOÖ¯_Ÿ<òÈ#Éüãìñr0lØ°…BáŒ¸™Ëåú¨¤¿ûÎw¾3¼¤•²FZKŠ@í²Ë.«¿îºëª†ú™ñãÇ?èŒì>a\Z\0\0\04òŸÿùŸÉUW]•pÀÉØ±c“#F4y\\¿~ı’}lë?ÕÕÕÉ´iÓ’şıû\'üã·{Í¬Y³’™ôw¼#»?{öì&ß;_´hQ’Ïç“3Ï<³áñ	&Äô½ìöYgÕîm5|øğş…Bahzó´t{{.—S@\\vÙeg-X°à‹.º¨Íƒ´¢ôs»ó›ßÌ9ò×C‡ı´@m÷	Ó\0\0\0`‹›o¾9»N:é¤ìşÂ…cdQrÅW$•••Ûÿ§?ı)ĞJö“Ÿü$¹îºë\ZîúÓŸNFÆowlãã\"T+‡hçŸ~eMMM¬ö¹tûx¡P8PÕ4-F¤m	Ò:µÕÔÎæ¼÷½ïİû[ßúVõµ×^+PkÂ4\0\0\0öx1-3‚´¸biÅõÈ9æ˜l:çÀ“|àÉ7¾ñ¤oß¾\r¯‹cŸxâ‰ä]ïzWvÆŒÙkšS>?ÿùÏ\'ûì³O2gÎœ¤W¯^ÙBñãÆKÆëŒeÇ=ÿüóÙóñøwŞ™tîÜ99÷Üs“»îºk«÷kË€íÅ_Ì¦­¦í´qW^?lØ°«ö¤z:ôĞCW/\\¸ğú‘öFAÚİwßµm)†¾Ãçc´âÙgŸİäsi­ísÙe—­¼öÚkÇ¦ï3´ªªêaÿåï\Za\Z\0\0\0{´+V$ùË_’‹.º(ùÃşL:u«çÿéŸş)¹òÊ+³Qhƒ´¢ábí²8öØc·;&^{È!‡$\'xbvÿûßÿ~òÉO~2ùÄ\'>‘\\sÍ5YXöğÃgïuôÑGgÛ<i¡G\rÁY7wîÜ¤K—.É—¾ô¥6i£XÛmõêÕ»óWîI5¨8õÔS“ö‘¶­~ıúõêß¿ÿ¢Ç{ìwçŸşşcÆŒYí`ç	Ó\0\0\0Ø£ÅÚh§vZvûàƒÎ‚¬Æ\"`‹\0Äè´&;Ö;g£ÍB·nİ\Zn7vØa‡5¬“Wù<è ƒ² ­(F½öÚkMN%İÖ¶ë´µ…ş^}õÕdÍš5[=^HåJ[(íê=©¦úöí»nÊ”)×pÂ	í¶VZSfÌ˜±lêÔ©û¥§ìTAÚ®¦\0\0À—_~yòÿñ[=6jÔ¨dÀ€Í]1\n)F‹…˜¢Ù”bS3cİ´âH¶G}49ùä“³Û°5%FÎµ·#<2›>8vìØî7n˜Ëå†¤Ÿ™îotX>İšœw:nÜ¸«ö´ZºâŠ+¦µSuñÅïpªg´ksS3Cã©UUU»ü}\"H»îºëº§58büøñ¦xîa\Z\0\0\0lqàfWâl,B®‹uÔœİ>ê¨£²QlÅ5×¶uÃ\r7$ßıîw¦oöìÙ3ùŞ÷¾—]à )·ÜrK,ú_6í3fÌ˜št‹×?8`À€oôéÓçÌB¡0$—ËÅp¹ÆÁZ}ºuÚ“k)=¯w]zé¥›oºé¦»Ó}§ö¡öÔSO-Kk¯¤¹øÀn¦\0\0ÀË—/ßnÍ´m§6n«¤…˜2\Zï±nİºí‹«‚F(÷øã\'µµµÙ\Zhİ»wÏF³M˜0!9çœs¶:>.l#åšòbúé)§œÒnm5eÊ”ºtw÷–-.20 İ•n¬½S5%ÉèÑ£ï»ôÒKÏN÷w·×U=_|ñÅ%£Fª¤µa\Z\0\0\0l(^$ hÛ‘j!®ş¹÷Ş{o÷ø~ûí—]ùòÂ/Ì.&ĞXŒLŠ×ôë×/íV¼ @Œf»õÖ[·Ó~ÿûßgS<ûÛß&§Ÿ~z6•´¸ØÅÓC=´,ÚnÜ¸qSÒ]lqeÒ¥»/61bmÚ×¿şõs~øÃ¿øâ‹»´e S;GÙ£P(ÒZPN\0\0\0P&O\\8é¤“4D™ˆ+’\Z4H°‹Î=÷Ü•••]rÉ%]w&PÛÕ5ÓŠk¤¥7?—¾î>g åTh\0\0\0€Öu×]w=R[[{ÆM7İT3}úôVı¬X#­x±AZË¦\0\0\0´ªªª‡7mÚôÉÑ£G×<óÌ3­ò1\"-.6Şjjgë¦\0\0\0´‘-Úé×_}‹P+HKoÏÑÚ­C˜\0\0\0Ğ†bÊgj1Bíé§Ÿ®ßÑ±guVÃ¶#¤\Z5ªë–©‚´V$L\0\0\0hcµM;\nÔÎ>ûì†­9Å©õõõŸ5µ³õ	Ó\0\0\0\0ÚAjõõõgE 6sæÌú]yÆS;imC˜\0\0\0ĞNbJfj#GŒ)Ÿ›wæµ/6`jgÛ¦\0\0\0´£ÂjkkÏ5jTm©Zi1\"Í\ZimO˜\0\0\0ĞÎbÊgj7ÜpÃæ§zjı}ñÅ—Œ9rßôæçLíl{Â4\0\0\0€2Z¡P8gÔ¨Q¹éÓ§¯mê˜X#íê«¯®L‹i÷iµ¶\'L\0\0\0(1e³®®îŒë¯¿>÷ä“On¨5¾j§ ­ıÓ\0\0\0\0ÊHŒP«««ûÔèÑ£sÓ¦M[5^#ÍÔÎöÕY\0\0\0\0”—ÔÎ=÷ÜÔî=ì°ÃÖ¾úê«{çóùá‚´ögd\Z\0\0\0@Š@-İıfÑ¢EûÅ^V„i\0\0\0\0eªP(ü­ñö\'L\0\0\0€	Ó\0\0\0\0 DÂ4\0\0\0\0(‘0\r\0\0\0\0J$L\0\0\0€	Ó\0\0\0\0 DÂ4\0\0\0\0(‘0\r\0\0\0\0J$L\0\0\0€	Ó\0\0\0(ÏkEE!ŸÏkˆ2‡ùé®NK€0\r\0\0€2UYYùÚºuë4DXµjÕìt7SK€0\r\0\0€2Õ¥K—©kÖ¬Ñe`éÒ¥kÓİçµÑ\0\0ĞIDAT-Â4\0\0\0ÊTMMÍµK–,©-\n\Z£}Í[¹rå	éşMÂ4\0\0\0ÊÔI\'4­P(<»xñbÑfÏ=9=‹\r\Zô„Ö\0a\Z\0\0\0e¬¦¦æ¼yóæmX»v­Æh«W¯şÍÊ•+OÏçóßĞ\ZğwÂ4\0\0\0ÊÖ!C^Èçóg<÷Üskjm+‚´Y³f—Ëå.HÏÃl-\'L\0\0 ¬\r8ğ‘ººº³Ÿyæ™µ,Xi\rµV7oöìÙ?öÙg?˜Ş¾$mÿ5	ü¯Nš\0\0\0€rwûí·¿2bÄˆûÖ¬YsÂâÅ‹÷«©©y±¢¢\"×­[·}r¹\\Ù~ïåË—\'\'NLz÷îìµ×^eû=óùüü•+WşyîÜ¹OÏ™3ç€7vN1xğà©ª¯}{ì±Ò]lÎ={Ši5\0\0\0ALùŒİ¤I“ú-Y²ä¬tŞï™n•åú§OŸÌ˜1#™?~ò¾÷½¯œ›÷°t{=İO·ºØ\04O˜\0\0@‡2xğà™énfGø®Ã†\r»*İ]9cÆŒ«ÿıßÿı*g:>k¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%Êi\0\0\0Ø}C‡½<—Ë]SêñãÆÓ\'G\ru@F¦\0\0@Kt°+*fjÔĞp4\0\0\0ì¾ªªª‡…Âº_¤Åhª†Òİ*5TŞ„i\0\0\0Ğrî~ƒçëã\n…ÂÃšŠ¦¤µqO‰Ç©¡v\"L\0\0€R(~ı‡ÔÆÿär¹±Z‹fjhüR¯†Ú—0\r\0\0\0ZÈ^{í55Ùñ4½Êt[¾téÒ©Z‹æj(—Ë­ØÁ!ÔPû¦\0\0@3fLM.—ûm3Oçã\n…Â}S¦L©ÓZ4WCi<°£cÔPû¦\0\0@*\n·6óT6=¯¢¢â­ÄøU3µUPCíO˜\0\0\0-(¦ß\n…\rM<Õ%İ-Y²ä­ÄÕPº[»íã¹”\ZjÂ4\0\0\0hA1ı®¢¢bÌ6§x>lz¥ÔPº»½©çÔPû¦\0\0@Ëçó¿k|¿P(ä·Üü½Ö¡iÍLÜ¶¬ÔPy¦\0\0@[¶lÙÃényñ~.—ë÷óùüƒZ‡¨¡×\Z=T¡†Êƒ0\r\0\0\0ZXLÃËårÛ,zxÂ„	ÕZ‡¨¡‡ÕPù¦\0\0@+Øöª¹\\ÎÙÙ\Zú¥\Z*?Â4\0\0\0h•••O4¾ß­[·)Z5Ôñ	Ó\0\0\0 Œ3¦¦P(Ì‰Û¹\\î•ôşj­ÂÎÖPº{A\r•—œ&\0\0\0ÚÓìÙ³ÏŞ¼yó…›6mú‡\r6ôÈçó\Zew;z¹\\Ò½{÷ué6«K—.·wÜqw¼Yşl…B¡rîÜ¹ÿR]]}^Z/G­_¿¾²œkfùòåÉ´iÓ’ø‡H>øàr®™B·nİVtíÚuZmmíÈşıûÿñÍúß‡\ZRC»ıgõ×\0\0Ğ¦OŸşjjjÆÕ××¿¥OŸ>¹=z$ûî»oRQaÍîŠ` ºº:Y»vm\\0ZÔ¥K—Ï|à˜Ò‘ÿ\\sçÎıêòåË¯Oëf¯´f5Ó:5³téÒÍé—ÏoÜ¸ñ¼!C†Ì~3ı9Õ\Zj	Â4\0\0 ÍÍ˜1ãKkÖ¬ùiß¾}+=ôĞl$­gñâÅÉüùóó={öü·~ıúêˆ†Ü÷Ê+¯œ‘ÖL¢fÚ¦fæÍ›·±P(?å”S~ófø3©!5ÔR:9½\0\0@[Š ­ººú–c9¦SïŞ½uhÛ@Œ¼éÕ«WnÑ¢Eƒşå_şeÅÏ~ö³\';Ò÷$İÎ8úè£5Ó¦5Óåµ×^ûçóÎ;oÖí·ßşbGşó¨!5Ô’„i\0\0@›™8qâ»ëêê<æ˜c:ï·ß~Û=_(ä“•óK–<wOòÚ‹%«_}*)äk“î=O;¿¦aí®]»&={öÌ-\\¸pĞg?ûÙûõ«_-ëß;¦åÍ›7ï›‚4U3›ª—%Kÿzo²ôùß$Ëçş1Ù°jnÒmïƒ’ÎİösÒ[ fzõêÕméÒ¥§1â¡;ï¼óµøçPCj¨¥ùÛ\0\0h3{íµ×„¾}ûviªC–½pòúß&%µWf÷ë6­M^ù‘´“{ŸÆk{ï½wrÄGtIïß7Šõ­bZ^s!ÈÂé¿Hª—ÏIòõ›“B¾.Ù°òådÁÓ·%5k_uÂ[¨fŞúÖ·æ;uêôÃøıÕ\Zj\rÂ4\0\0 MLš4©_Ú±=2Ö*jJhkOoò¹5Kf&5ë–hÄí_QQñ¶É“\'¨Ü¿k\\q1Šo®fbcİæõÛ=¡Èò¹Sœìrøá‡÷êÜ¹ó»:BÍ¨!5Ô„i\0\0@›èÖ­Û9ä®Í­U´qÍ¢lšgsb	-£OŸ>]Óóñ…rÿÕÕÕçÅ›­™ŒR/-ë ƒZšîÎêhß[\r©¡Ö L\0\0ÚDÚ™Ò£GfŸéU;´ƒ Óİ\n…Â rÿ6l8j‡5S_«^ÚÈxXºĞÑ¾·\ZRC­¡³Ó	\0\0´…Í›7¿-®îFûÛgŸ}â|ô-÷ï¹~ıúJ5SÒópHºëİÑ¾·\ZRC­ÁÈ4\0\0 M\n…Îº eÑüûy(û“‘Ïç5SV5Óáä¨!5Ô*§\0\0(]ºï¿Ãç;w3º„ÒkF½ †h-Â4\0\0 ,tïyD²ÏG5ùÜ^½Ş‘=õêûá¤s×½·{¼S—îI¯#úk Ô­B˜\0\0”…\\®\"9øİ§7ùÜ!Ç|2©èÔU#±•}zìİD\0ï{Ğ{4jˆV!L\0\0ÊFıæõM>^·iÆ¡éš©İ¨^PC´)a\Z\0\0PVÎŸš,œ1¦ÉçNÿe²bŞŸ4\r6¯=YğômIõëÏo÷Üú/%úyv¨!ZZgM\0\0\0´§ÚšÕÉ²Hª—Ïiö˜|ıæäõ¿MÊ:¸}Şı‰¤ëŞ½5ÜlÍâéi=LLêšÉ6¬ŸÌ›vsÒû“oùP6Ô-A˜\0\0´›U‹¦%Ë_Üä4«&;·«æfÛß~J²ßëÜîab”Ğ²›…ª¥ˆ6_÷úóÉAG–Tî{ˆFTCjˆİæo\0\0 ]Ä´Îe/Ü_rÖ¸sûÚKg¯gÏAj©!HcÂÎò§\Z5D‹¦\0\0í\"B±İQÈ×iD5£^PC´9Ó<\0€vS5cƒR½{àÿÓ¨!Ú‘i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰\\€\0\0\0ZØˆ#¯««;3—ËœŞí—n}ÒmŸt«I·¥…BafúÜŸ;uê4nìØ±‹´\0tÂ4\0\0h!Ã‡?3İ}=ŸÏŸ”Ëåº6qHeº½5}î­éşÌúúúë†\r6%½[UUÕZ\0ÊŸ0\r\0\0vÓ°aÃ\" »¥P(Ù…—H_7 }¯Ô××~Â„	Ó¢\0P¾„i\0\0°†:¬¢¢â\'ù|~ÿâc:uJ=öØäƒü`òÎw¾3éÙ³g²ï¾û&6lHV¯^Ì›7/™6mZ2}úô¤¶¶¶ø²şéëf>üB£Ô\0 |	Ó\0\0`\r:ôãwæóùNq?B´SO=5<xpÒ»wïíßk¯½²íĞCM>üágÁÚC=”üîw¿Kêëëã}\n…ÂÃ‡¯¬ªªºU@ùq5O\0\0Ø[F¤İW(² -²k®¹&.>ĞdÖ”±ÇÇëŞò–·4<¾çÏ‡~V€ò#L\0€k¤uêÔé\'Å í¨£J®ºêª­±¯‹×wÜq\r¥ï}óğáÃß­µ ¼Ó\0\0`gÿOtEÅ­Å5ÒbDÚ7¿ùÍlM´İÓ?/½ôÒÆ\\Lùü¹Ö€2ûÿš\0\0\0J7|øğ3óùü?ÅíX#-°İ\rÒŠ\"P»è¢‹²÷İ¢¿é\0P^„i\0\0°s¾^¼ØÕ©Í‰÷ûøÇ?Şp¿P(|eWŞçÜsÏ8lØ°ÿëtÑÒÔj†=0\r\0\0J4bÄˆÃÓİGãvñÊ­ácûXÒ¥K—âİş±FÛ½fÀ€£Ã:|øğ:tmEEÅäôáïîÉçkíÚµ\r·—.]šÔÕÕ5Ü¯©©In¾ùæ&_—Ïç“/¼°¤Ïxşùç³÷nì¦›nJ-ZÔìkF\ZµÕw9rdòúë¯—m;k+­Ã›ÒÚZõf®­¶<Ÿ·Şzk²yóæ’¿Û´iÓ’ûï¿¿C´ãT3Ûzâ‰\'²sÕ”Ç<©®®Şê±I“&%/½ôÒv¿YE‹/nö³æÎ›<÷Üs\r·W¬X±İ1Ï<óŒ¿¼[AgM\0\0\0¥©««;3—Ëes0O8á„¤W¯^­ò9q•Ï÷½ï}É_şò—âCgG½©ë!‡ò¡ôæWóùüàô»õ.\nIºw²R_ÿú×³«¥†[n¹%ùÁ~],bË¹L}öÙ&_7~üøìÜ>üğÃÙıRâ\\üüçÛ/awôÑG\'gyfr×]w%]»vÍûío›M×m,ºb˜Ÿ[YY™TUUÅ´á, ù·û·²C¢¶Òzúbz7Rãƒãñ7{mµæùŒ::üğÃîï½÷ŞÉSO=•|øÃnò˜G}4Ù¸qcÃsqlÜ/~¯5kÖ$şóŸ“şğ‡j¦ŒÌŸ??éÑ£GvûÁL:wîœ…´óæÍKößÿl‹:+zõÕW³)şïz×»’óÏ??=ztòØceW…~Ç;Ş‘|ík_K&Nœ˜ÿğ›ßü&{ÿx¿â¾üå/gÇşìg?K¾ğ…/$pÀVßgúôéÉäÉ“³š;vìVÏß{ï½ÉÅ_œ¼ç=ïñÆN¦\0@‰ÒNáÉÅÛ\'xb«~V¼£0->·!LK;ìK;¬ÑYıbºß{Oì°–jğàÁÙH‘#8\"yÛÛŞÖğx1ˆ!Ñ‰-ŠÎêÌ™3“ã?>!.¸à‚äòË/ßê}_{íµ¬“\Z\r\Z”üáÈF£Dx×½{÷ì~˜2eJrÅWdaKt|£Ó#Ÿ¦Nš|ğÁÉŸşô§äŸøDÃ¥ÿùŸÿIN>ùävk¯¨­|>?dKmí»§ÔI[œÏqãÆ%ÇsL\\À¤á3#)†¶EĞQâ>øÁfu\ZÇÏš5+ùö·¿…-ûì³OÒ¿ÿì˜¡C‡¶{Ûí©5Óœ8_«V­Ê´;ï¼3ùõ¯¬_¿>ûı‰ ¶(ÂØø½‰-¸¨™Xûöí›İ.Â´ÆlÔC¼ohòşèG?ÊêóöÛoO®¹æš¬F¢n\ZÎç>÷¹ìØPüÇ…¢æ\ZÿşQ:a\Z\0\0”®_ñÆÛßşöVı ·¾õ­ï¾wØ°aÒıÒíÔ´Ãz SQšè°şò—¿ÌB—_~9Ï¢Cú»ßı.Y¸pa6E*:°qUÖpÛm·eÁYt~cz_8ıôÓ³NmctPÔEGõ;îÈ‹ğ-F~Ä¸ï\"„ûñÜÜE§5¦bÅ¨¦è,§vE\';Â˜˜şõ‹_ü\"yï{ß›ì·ß~mÒ>çŸ~eÚ™ÑŸK·ÓÒÚ:hOfÛê|vÚi\rŸ£ĞbÄã;.»£&¾Ø…xßŸüä\'Éw¿ûİldÚêÕ«“	&$çœsN»´•šiZÔB]ÆGÀ¿1]?ÂµØoÚ´i»ß¦˜ûQßÿş÷g£Ò\"¸}á…šœ²ïçıúë¯Ïê³ø»¿W7Şxc¶Gß6~Mãu8iÂ4\0\0(]Ÿâ˜ŠÙš¶yÿÃÒí»ò>Ã†\r»ª\\\ZoÛµ‚ÚJtlCtn‹Ó«bJTGpDgøÓŸşt6\r+FıíoK–,Y’=Ö”â£èôFÀûuëÖe#M\"p‰Û1Š¨(>?˜èÇh¦faM¬¿¡^Ü¿ï¾ûÚ¤M^yå•ä{î‰ïºqWß£-j«-k¦µÏgŒ8ûŞ÷¾—Má¼xàÙ4¿˜²ëe}ë[ßÚê;Åˆ¢¨ËXßï‘GÉ~bTZ|Î§>õ©,œ‹‘pª™ö­¡Bc‹`+®ğ£‹c„Z„cıë_³ú‰ß–½ø_ÿõ_YX\ZÇGMÅß3~wN9å”l¤Z¸q;Îucñ›Á[„¸QÆEMÄÜ˜ò£ã~üãAÔXŒpš;ë¬³’9sæl¶±k„i\0\0Pº†tt–ZSŒ¤j!W–Kã½øâ‹[ÌiÑáŒÀ¢ñ(Õk[§î5î‡UÓè°2¤aŠgŒ\\Šcúõë—MÁ*êÖ­[6\Z%:Ã1$¦íEhW\\7©(:²ÑIĞ&šø^Ÿüä\'“x û×QjmÑ•{mµGÍ´æùŒ€#¦‰C‘Ü\"H‰š‹÷*Šz…ãcºq¿1:òÈ#Ì[°`A¬ıë¿şkR__ß&AZGª™ö¬¡¶¢v6lØ×‘ÁV¬i£aO:é¤l‹ú(†·ñı¢âwåÄy÷ŠmÅß zãó¢^¿úÕ¯fõ¿]ôÆµSCŒpüèG?Ú0ê1¾Glì<a\Z\0\0”.†8dZŒ2hÍ@-:G;P¿eß©„·ºº\\\ZïÈ#lótjDXİ5kc]}õÕ[…i1M/FŒD»ÇbÜ1Š(®Öú™Ï|&»ğ@Œ\0‰NrŒ8Š€£(.TæÖXß(F)ÅZDgœqÆVìR¢Ã£Tb¤Htz£cï[JGº%ÅT±˜R‹Øo£6İ\nÑG/‡Újëšiíó¯+®‘6{öìl¤RqûCi8.¦ıÅ¨¤¿3±VcñšùTœrªfÚ¿†b½yV„ğ¢ıô§?ÍÎQü¦ÄU^Ÿ¯ì¯¼òÊl¤Ø?ÿó?gu·|ùò¬>¢–-[–ı.5»\"|\rqAøÆâÂ)1e¸8m¸9Å\07×…dç	Ó\0\0 tKÓíq#Fh´f˜¶ÍW…ÂWs¹\\,òóoÜ?O·X°¨É`mÜ¸qW•Kã}ñ‹_lÓ`$®’øøãg£4Btd£sØmÅ(‘èdFĞS£âutƒn¸![L¼OŸ†™¾Y\'7F$…X©ØAÏi\\ÃºEòÿøÙ{ÇŸíW\ràE8²íÕ[S¬ùwöÙgÇ²î7nØLmmŞ²íÓ^µÕ–5Óç3^W0\ZL‹­ñÈ´ÆâBÅ:,ŠõşÚZG©™öª¡7cZoÔCS¿/Å)ÃÅQaúĞ‡²‹R4\nëâÅïUÔFqšç€¶{¿m¶mM¯.ÛœÍÖ”ÑÖxú2¥©Ğ\0\0P²™Å±~PkŠ5”\Z™1~üøÓ×EK—.¹ˆç\n…[Óı¢äïÿ@iéc›¶tdI]xá…É³Ï>›#Ç{l†DàQìÌnr„aSûb«İ\"øˆ-¦Ò5ÒBo1õ3Äè¥èü†½ÓÅ‹ou|\\q¯8â0¦~şóŸÏ¦\nÆô½˜Æ‹Š·µ1cÆÔì ¶º6\nE6ær¹µoæzi‹ó£$#)>Ši{q;®ÖÙxdZc±x}1p+nQ¯Å+†ª™ò£b#œÿÒ—¾”|ÿûßÏB¯¸rkˆÀ¾±bğßXS¿Wq\\üVŸŠ&hNüÅÈÛ¦l;İÒÓ\0\0 Di‡ñÑâí˜ÒÓš¶yÿ†Ï2eJ]Ú‰½;íÌ^îß’>ôÑtûQºı-í¸vKJ›jµGˆ©™_ûÚ×²g,àaE„1ª#¦{6gÒ¤IÙBïÅ…º£óÓş¶•‹ä#ùH¶¦U|V,Hë­·&\'œpBvÑW\",	±y\\!F\"ÅûE8aß˜1c’K.¹$5SûªªªÚ­½vT[éÖ=­ÿıŞÌõÒç3¦xãõq;^[œÖ¹­¨Ã˜6Úx‹ÅäCs£ÔLû)NËŒıc=–MÀ*ÎoLİ6lX¶Ö]ˆ@tWÖ¡‹óW-~V¬ÇV¬ŸmG¨ÅˆÇ¸pD¼&¦!Ç\ZmÅs1ú‘cš\'\0\0”ú;w¾/íŠ›±8øÊ•+³5–ZZt®~úéXƒ(·å¡»›;6íÀN‰>mÜ:tè‡Òİs¹\\Ì#;|O>W1Šè°ÃËÖ/\n±è{,Ü#8âª‰ç{n¶nZcñü“O>™¼óïl¡!J¬uÍ5×luìK/½”uN#D‰é~‡zhÂÅô¢l97Éµ×^›}Xœ>&¾C|¿Xs«ñ”Óøçw^6â¤®¸·\'ÕV{œÏÚÚÚlÄPsçº¸†ß Aƒ²ÑME(rÛm·%7nl¸@F9Ø“\"Øºã;’ÿşïÿÎÂ­¨‹‡z([/-¦~ÆÈÇõctZ1‹\0÷Ş{ïM.ºè¢¦ş¾Ùê~LÇŒ0·8Ríä“OÎj4şa şÁ X#\'NL~ğƒ4¬Ïk«E½†/ùËÉ7Ş˜üêW¿jxß™#Áï$-\0\0;!í˜L.\nÙ*Ğ1pÄˆ­Ñ!Í<ßbjzÿ#o†¶›<yr!®dW®š[;¨ñ•÷vÔ‘~£c\Z‹Ñ#Ûv–ÛZ„5ƒ\rÊ©™ö9Ÿ1*©-/ °§ÔL{×ĞÎÖÎ¦#ÖPSœa\0\0Ø9?.ŞˆÑ-½x¼ß<P(ŞÏår?Õäm£¹E¸Kéïlç¹½ƒ4Úÿ|v´ Ö©:èyÖ\0\0Pºªªª¸ôÚ”¸ëŞÄÀ¸J[Kˆ)]7Şxc}>Ÿ/ş«ıÔ%K–ŒÓê\0P>„i\0\0°ó>ŸnËãF¬•WíÛİ@-‚´Ñ£G^}õÕâJ÷Õ¹\\î‚Xà[s@ù¦\0ÀN\Z7nÜ¼B¡+FgA×œ9s’«®ºj—§|Æë¾óïÔÏš5«a™\\.waUUÕZ\0Ê‹0\r\0\0vÁøñãcúåÉ–@-F¨}ûÛßNÆ›]³q\\\\làòË/o<\"-)\nß®ªªºS+@ù±ê%\0\0ì¢qãÆ:thMzóæ\\.×3ÖP{ğÁ³œpÂ	É‰\'˜¼ıíoOzöì™ì»ï¾ÙTÎĞæÍ›—<ıôÓ±å7mÚÿÀ]‘Vn?~ŒÖ€ò$L\0€İ#Ô†\röD.—ûy¡PE¨6}úôl{gŠL5ÒLí€ò&L\0€İk¨¥»AÃ†\r;;—Ë}¥P(Ø‰ÿ¯=5İn[ºté.6\0\0åO˜\0\0-dÜ¸qw§»»GŒqx>Ÿ?»P(üczÿıéÖ\'İ*Ó-¦„ÆU@g¦Û£qì– \0è „i\0\0ĞÂÆ»(İŞ²\0o\"®æ	\0\0\0\0%¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰„i\0\0\0\0P\"a\Z\0\0\0\0”H˜\0\0\0\0%¦\0\0\0@‰„i\0\0@›Èårµù|^C”-ç¡ìOFEEEAÍ”MÍÌOwuí{«!5Ô*uåt\0\0mÔ©}fİºu\Z¢TWWÇùx®Ü¿geeåkj¦<¬Zµjvº›ÙÑ¾·\ZRC­ò÷™Ó	\0\0´…úúú‡W¬X±LK”E§vy>ŸŸXîß³K—.S×¬Yã„•¥K—®MwS:Ú÷VCj¨5Ó\0\0€6Q(îI;SÓ½Æhg‹/®Mw÷”û÷¬©©¹vÉ’%µj¦İÍ[¹rå	¡fÔ\ZjÂ4\0\0 M<xf]]İ“,X¨5ÚOÚşjkkÿ:hĞ \'Êı»tÒIÓ\n…Â³‹/vâÚÑìÙ³\'§çaqG¨5¤†Ú‚0\r\0\0h3ù|ş,è¾fÍšÕZ£íUWWo˜?ş^éy¸´£|çšššóæÍ›·aíÚµN`;X½zõoV®\\yzü·ÛQÿjH\rµ´NN+\0\0ĞVî¼óÎåŸıìgg¼şúë§öèÑ£®²²r/­Ò6ª««W=óÌ3k…ÂƒÚ‘jæ3ŸùÌ´+Vœ‘ÖLe·nİœÌ6!È¬Y³Ëår_ëH5£†ÔPk¦\0\0mêöÛo%íØÎZºté9µµµOí¿ÿşG¤-\rÓŠ^yå•ÇçÌ™Ó3½ùå>Økæ¼óÎ{jÙ²eg¦µ²~¿ıöë®fZÕ¼Ù³gO˜7oŞ)‚tÄšQCj¨5©\0\0 ]Lœ8ñİ£Òíø8à¹ƒ:¨÷şûïUjİ“ÏçkÖ®]û×eË–­X¾|ùÛêëëçÅ«!C†Ì~ÔÌ;w~oïŞ½xà‡ôèÑ£Oú˜“¾û53ÕªU³ãŠ‹±P|¬oõf¨5¤†Zƒ0\r\0\0hW“&Mê—ËåÎJoH·÷§›0m÷Õ¥ÛÌt›’n÷¼YıV3jF\r©!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ø£ü I€şëós¿\0\0\0\0IEND®B`‚',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('750007',1,'è½¦è´·æµ‹è¯•.bpmn20.xml','750006','<?xml version=\'1.0\' encoding=\'utf-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"0001\">\n  <process id=\"chedaitest\" name=\"è½¦è´·æµ‹è¯•\" isExecutable=\"true\">\n    <startEvent id=\"sid-3B55C72B-7DCE-49E8-980F-F0315066E270\"/>\n    <userTask id=\"yewushenqing\" name=\"ä¸šåŠ¡ç”³è¯·\" activiti:candidateGroups=\"2\"/>\n    <sequenceFlow id=\"sid-920904BC-7535-4B20-9652-2E38B9574645\" sourceRef=\"sid-3B55C72B-7DCE-49E8-980F-F0315066E270\" targetRef=\"yewushenqing\"/>\n    <userTask id=\"yewuchushen\" name=\"ä¸šåŠ¡åˆå®¡\" activiti:assignee=\"${user}\">\n      <multiInstanceLoopCharacteristics isSequential=\"false\" activiti:collection=\"users\" activiti:elementVariable=\"user\">\n        <completionCondition>${nrOfCompletedInstances/nrOfInstances >= 0.5}</completionCondition>\n      </multiInstanceLoopCharacteristics>\n    </userTask>\n    <userTask id=\"cheliangpinggu\" name=\"è½¦è¾†è¯„ä¼°\" activiti:candidateGroups=\"2\"/>\n    <userTask id=\"pinggufuhe\" name=\"è¯„ä¼°å¤æ ¸\" activiti:candidateGroups=\"2\"/>\n    <userTask id=\"zhongshenshenpi\" name=\"ç»ˆå®¡å®¡æ‰¹\" activiti:candidateGroups=\"2\"/>\n    <sequenceFlow id=\"sid-F18F5A2B-CE33-4531-A425-ABF18973A2A2\" sourceRef=\"pinggufuhe\" targetRef=\"zhongshenshenpi\"/>\n    <userTask id=\"qiantitiaojiaoluoshi\" name=\"å‰ææ¡ä»¶è½å®\" activiti:candidateGroups=\"2\"/>\n    <sequenceFlow id=\"sid-C334CB61-24F6-4865-B13D-AEBFFD87A2A3\" sourceRef=\"zhongshenshenpi\" targetRef=\"qiantitiaojiaoluoshi\"/>\n    <userTask id=\"luoshifuhe\" name=\"è½å®å¤æ ¸\" activiti:candidateGroups=\"2\"/>\n    <sequenceFlow id=\"sid-DF1005DF-E7F6-42BF-A560-C269524CE2BE\" sourceRef=\"qiantitiaojiaoluoshi\" targetRef=\"luoshifuhe\"/>\n    <userTask id=\"hetongguanli\" name=\"åˆåŒç®¡ç†\" activiti:candidateGroups=\"2\"/>\n    <sequenceFlow id=\"sid-3B89ED2A-5C5F-4C19-89C5-4C1D26B39E5B\" sourceRef=\"luoshifuhe\" targetRef=\"hetongguanli\"/>\n    <parallelGateway id=\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\"/>\n    <userTask id=\"diyadengji\" name=\"æŠµæŠ¼ç™»è®°\" activiti:candidateGroups=\"2\"/>\n    <userTask id=\"hetonggongzheng\" name=\"åˆåŒå…¬è¯\" activiti:candidateGroups=\"2\"/>\n    <userTask id=\"fangkuanshencha\" name=\"æ”¾æ¬¾å®¡æŸ¥\" activiti:candidateGroups=\"2\"/>\n    <userTask id=\"caiwufangkuan\" name=\"è´¢åŠ¡æ”¾æ¬¾\" activiti:candidateGroups=\"2\"/>\n    <endEvent id=\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\"/>\n    <sequenceFlow id=\"sid-3BC6F06A-D481-47FE-AEB1-DF5627713B9F\" sourceRef=\"fangkuanshencha\" targetRef=\"caiwufangkuan\"/>\n    <sequenceFlow id=\"sid-4297773B-04B0-43D4-B40E-23BB78FAE6AB\" sourceRef=\"caiwufangkuan\" targetRef=\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\"/>\n    <exclusiveGateway id=\"sid-66666A28-D500-4B06-916D-F44F23F4C520\"/>\n    <sequenceFlow id=\"sid-22ED8CCC-2445-4AE5-954C-56733CAB1F55\" sourceRef=\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\" targetRef=\"diyadengji\"/>\n    <sequenceFlow id=\"sid-9F686C53-6F4B-46B5-867F-1BFC45678FDA\" sourceRef=\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\" targetRef=\"hetonggongzheng\"/>\n    <sequenceFlow id=\"sid-F52BFC10-7737-4945-A2A6-D2961FCE89F0\" sourceRef=\"hetongguanli\" targetRef=\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\"/>\n    <parallelGateway id=\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"/>\n    <sequenceFlow id=\"sid-A978BA75-86B0-458E-9B21-7FD7E404962A\" sourceRef=\"hetonggongzheng\" targetRef=\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"/>\n    <sequenceFlow id=\"sid-AEE1B50C-E85D-4776-8D83-C9DC49988DE4\" sourceRef=\"diyadengji\" targetRef=\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\"/>\n    <sequenceFlow id=\"sid-958B15D3-AD10-4211-AE06-17931D52994B\" sourceRef=\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\" targetRef=\"fangkuanshencha\"/>\n    <sequenceFlow id=\"sid-27BAA4F7-A339-4FAE-8DB1-D5DCAFF7F00E\" sourceRef=\"yewuchushen\" targetRef=\"cheliangpinggu\">\n      <extensionElements>\n        <activiti:executionListener event=\"end\" expression=\"${execution.setVariable(\'okNum\',0)}\"/>\n      </extensionElements>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-08F81C26-E80B-4C89-A3AB-B8DEDBB1E922\" sourceRef=\"cheliangpinggu\" targetRef=\"sid-66666A28-D500-4B06-916D-F44F23F4C520\"/>\n    <sequenceFlow id=\"sid-D03548BD-9389-45C6-99C0-2C7852C28AED\" sourceRef=\"yewushenqing\" targetRef=\"yewuchushen\"/>\n    <sequenceFlow id=\"sid-965CD382-3B99-4246-8DD9-F3050A6E4CF2\" name=\"${_flow_type==\'pinggufuhe\'}\" sourceRef=\"sid-66666A28-D500-4B06-916D-F44F23F4C520\" targetRef=\"pinggufuhe\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${_flow_type==\'pinggufuhe\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-9A44B04A-DC1B-44DC-814B-A05AED8CB220\" name=\"${_flow_type==\'zhongshenshenpi\'}\" sourceRef=\"sid-66666A28-D500-4B06-916D-F44F23F4C520\" targetRef=\"zhongshenshenpi\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${_flow_type==\'zhongshenshenpi\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_chedaitest\">\n    <bpmndi:BPMNPlane bpmnElement=\"chedaitest\" id=\"BPMNPlane_chedaitest\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-3B55C72B-7DCE-49E8-980F-F0315066E270\" id=\"BPMNShape_sid-3B55C72B-7DCE-49E8-980F-F0315066E270\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"56.5\" y=\"139.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"yewushenqing\" id=\"BPMNShape_yewushenqing\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"131.5\" y=\"114.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"yewuchushen\" id=\"BPMNShape_yewuchushen\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"276.5\" y=\"114.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cheliangpinggu\" id=\"BPMNShape_cheliangpinggu\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"421.5\" y=\"114.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"pinggufuhe\" id=\"BPMNShape_pinggufuhe\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"651.5\" y=\"0.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"zhongshenshenpi\" id=\"BPMNShape_zhongshenshenpi\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"651.5\" y=\"115.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qiantitiaojiaoluoshi\" id=\"BPMNShape_qiantitiaojiaoluoshi\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"795.0\" y=\"115.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"luoshifuhe\" id=\"BPMNShape_luoshifuhe\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"940.0\" y=\"115.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hetongguanli\" id=\"BPMNShape_hetongguanli\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"1085.0\" y=\"115.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2C35DF22-C30A-41F5-9AF1-D57929911073\" id=\"BPMNShape_sid-2C35DF22-C30A-41F5-9AF1-D57929911073\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1115.0\" y=\"245.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"diyadengji\" id=\"BPMNShape_diyadengji\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"1085.0\" y=\"335.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hetonggongzheng\" id=\"BPMNShape_hetonggongzheng\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"940.0\" y=\"225.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"fangkuanshencha\" id=\"BPMNShape_fangkuanshencha\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"820.0\" y=\"335.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"caiwufangkuan\" id=\"BPMNShape_caiwufangkuan\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"679.5\" y=\"335.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\" id=\"BPMNShape_sid-1A2B2547-B73B-418F-A8DF-4DCCB525BA2C\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"600.0\" y=\"361.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-66666A28-D500-4B06-916D-F44F23F4C520\" id=\"BPMNShape_sid-66666A28-D500-4B06-916D-F44F23F4C520\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"566.5\" y=\"134.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C6947558-4B64-4B3C-A630-417A72BA92EE\" id=\"BPMNShape_sid-C6947558-4B64-4B3C-A630-417A72BA92EE\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"970.0\" y=\"355.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9A44B04A-DC1B-44DC-814B-A05AED8CB220\" id=\"BPMNEdge_sid-9A44B04A-DC1B-44DC-814B-A05AED8CB220\">\n        <omgdi:waypoint x=\"605.9173913043478\" y=\"154.58260869565217\"/>\n        <omgdi:waypoint x=\"651.5\" y=\"154.7816593886463\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DF1005DF-E7F6-42BF-A560-C269524CE2BE\" id=\"BPMNEdge_sid-DF1005DF-E7F6-42BF-A560-C269524CE2BE\">\n        <omgdi:waypoint x=\"895.0\" y=\"155.0\"/>\n        <omgdi:waypoint x=\"940.0\" y=\"155.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-958B15D3-AD10-4211-AE06-17931D52994B\" id=\"BPMNEdge_sid-958B15D3-AD10-4211-AE06-17931D52994B\">\n        <omgdi:waypoint x=\"970.4166666666666\" y=\"375.4166666666667\"/>\n        <omgdi:waypoint x=\"920.0\" y=\"375.20746887966806\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-27BAA4F7-A339-4FAE-8DB1-D5DCAFF7F00E\" id=\"BPMNEdge_sid-27BAA4F7-A339-4FAE-8DB1-D5DCAFF7F00E\">\n        <omgdi:waypoint x=\"376.5\" y=\"154.0\"/>\n        <omgdi:waypoint x=\"421.5\" y=\"154.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3BC6F06A-D481-47FE-AEB1-DF5627713B9F\" id=\"BPMNEdge_sid-3BC6F06A-D481-47FE-AEB1-DF5627713B9F\">\n        <omgdi:waypoint x=\"820.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"779.5\" y=\"375.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D03548BD-9389-45C6-99C0-2C7852C28AED\" id=\"BPMNEdge_sid-D03548BD-9389-45C6-99C0-2C7852C28AED\">\n        <omgdi:waypoint x=\"231.5\" y=\"154.0\"/>\n        <omgdi:waypoint x=\"276.5\" y=\"154.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4297773B-04B0-43D4-B40E-23BB78FAE6AB\" id=\"BPMNEdge_sid-4297773B-04B0-43D4-B40E-23BB78FAE6AB\">\n        <omgdi:waypoint x=\"679.5\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"628.0\" y=\"375.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C334CB61-24F6-4865-B13D-AEBFFD87A2A3\" id=\"BPMNEdge_sid-C334CB61-24F6-4865-B13D-AEBFFD87A2A3\">\n        <omgdi:waypoint x=\"751.5\" y=\"155.0\"/>\n        <omgdi:waypoint x=\"795.0\" y=\"155.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A978BA75-86B0-458E-9B21-7FD7E404962A\" id=\"BPMNEdge_sid-A978BA75-86B0-458E-9B21-7FD7E404962A\">\n        <omgdi:waypoint x=\"990.0\" y=\"305.0\"/>\n        <omgdi:waypoint x=\"990.0\" y=\"355.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-965CD382-3B99-4246-8DD9-F3050A6E4CF2\" id=\"BPMNEdge_sid-965CD382-3B99-4246-8DD9-F3050A6E4CF2\">\n        <omgdi:waypoint x=\"587.0\" y=\"134.5\"/>\n        <omgdi:waypoint x=\"587.0\" y=\"40.0\"/>\n        <omgdi:waypoint x=\"651.5\" y=\"40.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-AEE1B50C-E85D-4776-8D83-C9DC49988DE4\" id=\"BPMNEdge_sid-AEE1B50C-E85D-4776-8D83-C9DC49988DE4\">\n        <omgdi:waypoint x=\"1085.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"1010.0\" y=\"375.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F18F5A2B-CE33-4531-A425-ABF18973A2A2\" id=\"BPMNEdge_sid-F18F5A2B-CE33-4531-A425-ABF18973A2A2\">\n        <omgdi:waypoint x=\"701.5\" y=\"80.0\"/>\n        <omgdi:waypoint x=\"701.5\" y=\"115.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F52BFC10-7737-4945-A2A6-D2961FCE89F0\" id=\"BPMNEdge_sid-F52BFC10-7737-4945-A2A6-D2961FCE89F0\">\n        <omgdi:waypoint x=\"1135.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"1135.0\" y=\"245.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-920904BC-7535-4B20-9652-2E38B9574645\" id=\"BPMNEdge_sid-920904BC-7535-4B20-9652-2E38B9574645\">\n        <omgdi:waypoint x=\"86.5\" y=\"154.0\"/>\n        <omgdi:waypoint x=\"131.5\" y=\"154.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-22ED8CCC-2445-4AE5-954C-56733CAB1F55\" id=\"BPMNEdge_sid-22ED8CCC-2445-4AE5-954C-56733CAB1F55\">\n        <omgdi:waypoint x=\"1135.4128440366972\" y=\"284.58715596330273\"/>\n        <omgdi:waypoint x=\"1135.1826484018266\" y=\"335.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9F686C53-6F4B-46B5-867F-1BFC45678FDA\" id=\"BPMNEdge_sid-9F686C53-6F4B-46B5-867F-1BFC45678FDA\">\n        <omgdi:waypoint x=\"1115.4310344827586\" y=\"265.4310344827586\"/>\n        <omgdi:waypoint x=\"1040.0\" y=\"265.17182130584195\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-08F81C26-E80B-4C89-A3AB-B8DEDBB1E922\" id=\"BPMNEdge_sid-08F81C26-E80B-4C89-A3AB-B8DEDBB1E922\">\n        <omgdi:waypoint x=\"521.5\" y=\"154.2164502164502\"/>\n        <omgdi:waypoint x=\"566.9130434782609\" y=\"154.41304347826087\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3B89ED2A-5C5F-4C19-89C5-4C1D26B39E5B\" id=\"BPMNEdge_sid-3B89ED2A-5C5F-4C19-89C5-4C1D26B39E5B\">\n        <omgdi:waypoint x=\"1040.0\" y=\"155.0\"/>\n        <omgdi:waypoint x=\"1085.0\" y=\"155.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('750008',1,'è½¦è´·æµ‹è¯•.chedaitest.png','750006','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0x\0\0©\0\0\0ö¨n\0\0F°IDATxÚíİŒ]e?ş»_1ÆÃšhQÍ¸Æ~„`Ôø…4ü$Ô\0åÎ´•²¨‹\"(©%»È¯5Í\"¢è‚Y–åË\"AÒÂ6—™şOi,?ìÊÚ/­XÆBG¾•-l©àßı\\æ™œ¹sïÌ½óçŞsæ¾^É“™Ş3û9Ï}Îû<ç9•\n\0\0s*Ë²£öìÙ³fûöí\\·n]644¤u¹\rg›7oş]­-S‘\0\0\0@Ç\"ÜÙ²eKvàÀìÈ‘#ZÚèèh¶iÓ¦W‡‡‡/T•\0\0\0@Gbæp§0!Ï‘¡¡¡]ª\0\0\0èHœ–%\\)N\Z\ZzSU\0\0\0‰5`+…\nx2U	\0\0\0t¤İ€çµßïÏö<ñOÙ3Ãß­·ø>nÊx\0\0\0€k\'à9tp$Ûù¯«²_>|õ„·Å}‚\0\0\0ĞCí<ûù—IáNj/>³V0#à\0\0\0z©€g×†ï·xâ>ÁŒ€\0\0\0è¡vC×·xâ>ÁŒ€\0\0\0è!€\0\0\0(¹v¸jV«€\'îÌx\0\0\0€j\'àÙ½õÖ–OÜ\'˜ğ\0\0\0\0=ÔNÀóÊÈlç£×M>=«v[Ü\'˜ğ\0\0\0\0=ÔNÀmï“wO\nxâ6¡Œ€\0\0\0è±¶7ŞÈv?ö÷“OÏªİ÷	f<\0\0\0@Mğ:8’ıjë--×à‰ûâ1Â\0\0\0Ğ#-7ŞÈöï^Ÿıû/¾İ2ÜI-5›GÀ\0\0\0ô@³€gºY;fóx\0\0\0€iğ´3kgªÙ<‚\Z\0\0\0ĞEÍ™†;©	j<\0\0\0@µ{™tMÀ\0\0\0”€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0”œ€GÀ\0\0\0ØàààP­ıÏ©#àğ\0\0\0\0600E‹ §Z­~ºÙc<\0\0\0 ÀRÀ“k4Îèğx\0\0\0€kğŒÏèIA€GÀ\0\0\0X«€\'?£çç?ÿ¹`EÀ\0\0\0>é‹&\\ğ\0\0\0@©…ükÑ¨V«g/Z´è¨nŸ¢µeË–,ıÌİ»wgguV½=ôĞCõv×]wÅû‘=ÿüó·İtÓMş}÷İw·ü9qÿ1ÇSÍ‹/¾¸Şâûã?>»à‚&=öÒK/ÿ÷«¯¾Z¿­§¯	x\0\0\0`†!ÈBş¿µ\nvÒczbÔ~löÔSOeûöíË><~Û;²C‡M\nw^yå•úıkÖ¬™ğ\Z÷ßÓ×ÿÄ\'>‘zê©ı>—\\rI=Ø‰çE·}õ«_ÿş¹çğ\0\0\0@‘C…ükÛÏË;I/×_}ükíWÈöîİ;ğÄ×3Î8cR\0³uëÖñÙ8)t‰™8éû˜=á„²\'Ÿ|2[»ví¤Ù;ùÈG²o¼qüuGGGë·¿ãïÈN<ñÄì†n¨N>UÆB(3x\0\0\0 $!Èş¿Mš±Ó¨›Oœ’Ê»ßıîñ@æ‘GÉn¿ıöz òì³ÏÖ¿ÆŒôœ—^z©~Ûå—_>µšÁ³ÒcâşÏ|æ3¸måÊ•NÜ~î¹çNxí§Ÿ~:{øá‡ëßÇL#\0\0\0;éëên<¾¤@%fë|êSŸª/wÜqGı¶E‹1÷Ş{oı9?ùÉOÆß8«§Õ)Zù€§qÖÏUW]Õ4à‰³~âë±Ç[ÿù•ÜÌ \0\0\0˜€§7kğD`3İŒœ˜ñ“<ÇÇ)SgyæxXsçwf\'tRıÔªÆŸqíµ×ÏüÉ<;wîœğ¸ø™q{Ì$Š˜cæN:u,ªkñx\0\0\0 À<½xâÔ§´ reŠ9•±°%B˜¸2Vş¾w¾ó“®Š•n~úÓŸÖÿ4Ç¿ã´«üãb¶ÎqÇ—­[·n|]ÊØU¼}ôÑ¦¡€\0\0\0\nFÀÓ›€\'ÂšøÚÎ)W•M›6Õtõ­h+V¬˜ôº±¸sÌÖ‰E–ã2é:Å,¸/®Õí…–<\0\0\00Ş<•\\¸“n»ç{¦\rxâû+®¸¢åÂÉêDpßÇ,œÕ«W×œ÷½ï}õ9é²ì¯¿dÉ’	—d¿æškÆï;ë¬³<\0\0\0Pdî<&§ %fÍLuJ×¶mÛ²\r6L¸ïè£Ÿ³qN;í´zHrúé§O~ât°¸Dz\\-+^/ÂüëÇsbæO,ÌÜìçwk±e\0\0\0Ì€€§û&à\0\0€9%àğx\0\0\0 ä<\0\0\0”œ€GÀ#à\0\0€’ğx<\0\0\0Pr€\0\0\0JNÀ#àğ\0\0\0@É	x<\0\0\0(9€GÀ\0\0\0%\'àğx\0\0\0 ä<\0\0\0”œ€GÀ#à\0\0€’ğx<\0\0\0Pr€\0\0\0JNÀ#àğ\0\0\0@É	x<\0\0\0(9€GÀ\0\0\0%\'àğx\0\0\0 ä<\0\0\0”œ€GÀ#à\0\0€’ğx<\0\0\0Pr€\0\0\0JNÀ#àğ\0\0\0@É	x<\0\0\0(9€GÀ\0\0\0%\'àğx\0\0\0 äú=àY·n`¥8íğĞĞĞ›¶J\0\0\0èP¿<›7oŞàÀáJÚÈÈÈ}CCC»l•\0\0\0Ğ¡~xÖ¯_îÆÿòË/ÿ—¥w3w\"Ü~¡Ö.´U\0\0@‡ú=à	ÃÃÃg\r\r=§Å\Z0emñ^–ôw¿û.á\0\0\0Ì€Ç{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œPÀ{	\0\0\0”œP ´ïÛÚxï¦iOøK\0\0@r¾o§ÔÚ›S<Õjõl)\0\0\0è @ÀSŞ÷î‘)m‹-:Ê_	\0\0\0ú#$ğ”÷½;¥UÀ388x¿\0\0\0ô	Oéß¿fkñ<aö\0\0\0ôOéß¿IkñX{\0\0\0úŒ€§üªÕêƒfï\0\0\0@ğ”_µZıtníÅş\"\0\0\0Ğg<æ}¬¯Åcö\0°àeYvÔ={Ölß¾ıëÖ­Ë†††´.·ááálóæÍ¿«µejHSCjH\r	x˜Ó÷ñï%\0Ğb§jË–-Ù²#Gh=j£££Ù¦M›^­íd]¨†45¤©!àU+sğª~Ô\ZRCjHs\0±¢àíTfçêHmCØ¥†45¤©!àU+sğª~Ô\ZRCjHs\0±\"ÍTxÅiµ«7Õ¦†45$à¼je^ÕúQCjH\ri ö@LRt…Ú±ÊÔ¦†45$à¼je^ÕúQCjH\ri xÇêµßïÏö<ñOÙ3Ãß­·ø>nS¬v¬Ô\ZRCjHÀã\0f»T?êG\r©!5¤_– ğÉvşëªì—_=¡ÅmqŸ‚Õyª!5¤†Ô€Ç Á«íRı¨5¤†Ôf|YğÂß÷Ì¿LÚ©JíÅgÖ*X§\ZRCjH\r	x\0¼Ú.ÕúQCjH\riÆ—E/ü]¾ßrÇ*îS°:O5¤†Ô\Zğ8\0$xµ]ªõ£†Ô\ZÒŒ/^ø;‡®oYøqŸ‚Õyª!5¤†Ô€Ç Á«íRı¨5¤†Ôf|iÇJ³s®©!5¤†<¶K­õ£~Ô\ZRCjˆ~,6Õªğã>«óTCjH\r©!€ÇÀØv©~Ô\ZRCjH3¾,xáïŞzkËÂû¬ÎS\r©!5¤†<\0	^m—êGı¨!5¤†4ãË‚ş+#;²^79Õ¬İ÷)X§\ZRCjH\r	x\0¼Ú.ÕúQCjH\riÆ—/üh{Ÿ¼{RÑÇmŠUá«!5¤†Ô€Ç Á«íRı¨5¤†Ôf|Y†«7ŞÈv?ö÷“SÍÚmqŸ‚Õyª!5¤†Ô€Ç Á«íRı¨5¤†Ôf|YàÂ?tp$ûÕÖ[ZN]‹ûâ1ŠVç©†Ô\ZRC€¯¶Kõ£~Ô\ZRCšñeÑ\n¿VĞûw¯Ïşıßn¹S•Z<&k#Ğyª!5¤†Ô€Ç Á«íRı¨5¤†Ôf|YÂŸ®Øm\n_\r©!5¤†<\0	^m—êGı¨!5¤†4ãË‚~;Å>ÕF €ujH\r©!5Tr*à¼Ú.ÕúQCš\ZRCÆ—¥/ü™îT¥¦€ujH\r©!5Tb‹k-ğ^m—êGı¨!M\r©!ãË…1uMSøjH\r©!5Ô>Wkkíæ±¯g^m—êGı¨!5¤†Ôñ¥+ÍÎ¹¦†Ô\Z*_¸svn&Ïh¿†<¶KÛ¥úQ?jHSCšñ¥Â×tš\ZRCj¨ìáÎt·h¶Kõ£~Ô\ZRCšñ¥Â×tš\ZRCj¨@Oâ¤ûh¶Kõ£~Ô\ZRCZAkèÑGın»í¶¿÷½ïí¿òÊ+ÿ°|ùòÿE¿øÅ/f_ÿú×ßüîw¿{àÖ[o}xıúõg\ZÀi:O5¤†Ô\ZZ°áÎtáMßÍä±]Ú.ÕúQCš\ZÒJQC?üáW®ZµêàUW]•ıÃ?üC¶}ûöldd$;|øpâë²û·Ë~ö³Ÿeñ¸k¯½ö?¿ÿıï×\0NÓyª!5¤†ÔĞ‚ğ¹gætúxãMÀ£©5¤†Ô6_5ôƒüàÄk®¹fdåÊ•ÿáÍ[o½•µëé§ŸÎ¾ıíogµçŞtÓMŸ4€ÓtjH\r©!5Túpçì<ïP?„<¶KÛ¥úQ?jHSCZakè?øÁu—]vÙ×®]ÛQ°Óè¿øE¯sÓM7­6€ÓtjH\r©!5Ô7áÎ\\=ßv©	x4õ£†Ô\ZRC3uÛm·ı¿W\\qÅÿêW¿ÊæÂ¯ıë,^ï‡?üáßÀi:O5¤†Ô\Z*éTîöëØ.5¦~Ô\ZRCj¨]«V­ZqÅWü1ÖÔ™Kñzñº×_ıßÀi:Oï\ZRCj¨4áÎ\\^µ gòØ.m—êGı¨!M\ri…ª¡¿ú«¿ú¿¾ò•¯üa®fî4›É¯¿bÅŠÿÛ\0NÓyjjH\r©¡Âj\\ ùOjmùØ×N4>oÁ.¼l»´]ªõ£†45¤ª†®ºêª_Åš;ó)Öä¹òÊ+m\0§é<55¤†ÔP¡Ã³s!Íÿªµlìk»!O«ç-ÈÇvi»T?êG\rijH+L\r]yå•K¿õ­o½õ‡?ü!›oW_}õ[µŸ÷58Mç©©!5¤†\nîTÆfàd¹ÖNÈ“wR»8wÿ‚[“Çvi»T?êG\rijH+L\r­X±âÇ¥Ğ»aÇÙ7¿ùÍßÀi:OM\r©!5T­B—faÍT!O³ÇßÑäñjMÛ¥íRı¨5¤©!­5´téÒ}ík_;2›Ë¡wêÊ+¯üÃÀÀÀ‡‹TÔƒƒƒCµö?¾ÎS\r©!5¤-ä\Zš\"ÜYÜAhÓ,äi7Üiy\n}º–íÒviÇJı¨!M\ri¥©¡¯ıëßşÇüÇ?f]tÏ=÷d_ûÚ×¾S¤¢È¢Å@®Z­~Záë<Õ\ZRCÚB¬¡†,Ó…<†;ùŸ?Zä™<¶KÛå|®êGı¨!5¤†´9«¡o~ó›Û¶oßŞÍ|\'‹ÓÁ®¼òÊ\'‹8€ËµG\Z7…¯óTCjH\rie¯¡&áN»áJ«çÌ0ÜiœATÈÇvi»œïÀUı¨5¤†Ô6g5té¥—¾¼ÿş®<È–/_ş\n>€ßÒ@Náë<Õ\ZRCZÙkh†áÎT!ÏÌ\"Ü™íïc»Ô\nğL¸ªõ£†Ô\ZÒæ¬†–-[väğáÃ]\rxâç-Y²äÍ2àòƒÂ×yª!5¤†´²×Ğ‡?üá«f¦4yfî4†<‹Ëö7ıùÏn{°]Î8pÕ¯«5¤†Ô6g5op/´1`*\\SøÅ+|5¤©!M\rµßÎ?ÿüzóçşç³|ş&3wşcìöÙ¸¹ŒãƒÔlv®:\rã”	ıºúQCjH\ris9ƒçÍàùCIĞ=Q+ú³-ZtT¯\n?Î7ÜpCvğàÁú÷>úhËÇîŞ½»ş˜3Î8#{è¡‡âïœ}ùË_ög<øàƒÙqÇ×òşgŸ}6{î¹çšşnwİu—#ç¯¡ù¬£¨ûï¿Æ¿ÓM7İä¸$5ïu¼g¯¾úê´ïëã?^ï7Î9çœz‹:J-_[¶l­¢îÎ:ë¬zKş%ÿüóÏOY;ñï»ï¾[\rµQC•é¯š5›<ÿ«fğb»ÔÊ¼ªŸb5¡55¤•:àùË¿üËı½Xƒçâ‹/ş]ÁpùÁpO§®Å yÇÙ¡C‡êß¯]»vÊÇÆÎTşß±³Ôì±G}tvæ™gÖw¢V­Z•½÷½ïÍ®½öÚñ°mÛ¶5İi[·n]}‡?=îÎ;ïÌxàú÷/¾ø¢«ÖĞ|ÔÑoûÛìôÓO¯ƒ“N:)Û¹sç„ùhïz×»²\'Ÿ|²şœM›6Õo«mÿõ¯Ç{lvê©§?6êè#ùˆ\Z*P\r¥&½Ï\'xâ„÷0nûÑ~TìŞ½{Çoûüç?Ÿİ{ï½õÛ?şñß¯×¬Şzê©lß¾}õ\0õÚî¼òÊ+õû×¬Y3á5f\Z4ö[\råÂ”Có´ÏLB2­ÁSˆ¾=ºÄßûé§ŸßÚ9 3“p½ÇÇcV®\\Yÿ>¶Åü¶WO5ƒ§u\rÍUıD-Äß{ttt|œ÷ÙÏ~¶åûõï|§ş}\Z×åÇv¯¿şú¤çÄç~ÜwÚi§MøˆÏş©~F¾bœÙê÷é¥—&¼^c?ßªÅ8#>súlöÅ¼ÔP§m¾ß³x½c9f|Ü‘êîøãÏ.¸à‚I½ôÒKÇÿ£â¶^ümÔPçû(ùıfÏ8è|É%—Œ×A¾¥¾(ÿœ;î¸#{øá‡\'ıœ8X¹àåË—¯­íÈ¿Õí«hÕ~î£Àm<¯É`¸«…;6­vÌc)>¼ó»ô¸¸oëÖ­õÎ5Z«éôø´–:Ë©v–âuãküìÚßgBÀ_c€`Çª85Ô:J·ÅÌ‰Ûn»mÂ .}Àçk©±®âßßûŞ÷ÆÿıÎw¾3»æškÔPj(½Ç1Ó&Ş¯ë>ùÉO6}l¼ÿÒ¥ğ0;vüàë!rÚÑ‹`/_ségÄ×xLE©^ÓL²Æ¾+ê³1hŠÁ^ú>~_5Ô¼†f1c¦Õ¥Ğ›]E«“§,WÑ*Ìv™¶ƒŸüä\'şA{ÚÒNşLÂõ™„ññ3c@İ8£®ák¦ëlê\'v°ã`Kş€KüíÓgwz¿\Zwtó;:q€ï3ŸùÌ„Y–ù>:ÿœüNuôçq[³ŞÌ§Ù—é³£Ù¬ïöÓÁÆ¨“xÌUW]5aŒ™nä‘GÆÿÏQ“ç{î„ç]tÑE>¦›mZÒó9¯¡N[·Ş³O|âõ~§“>1€xÔ_Åm_ıêWÇ¿oV«}ğô¼†š5Ÿ_­¶ÙÆıÔÆ–ü5ÖÃG?úÑúsc\Z“\ZÇŠ1îL}hÜ}Zô…ñwÊFŸúîw¿»<Ÿcµ7øŠ[o½õ•n<µ\rÿ`í·²`¸VG9{Rø¼¤#İÍvÌo¹å–úrşƒ4:ÜôïË.»lüuªğä“On9ƒgÃ†\rãGğÓmñ3âûüÆ‘ÿ>=§Ow¬\nUCİª£˜µ•f`¤ŠüÀ1ô6~vùAdm‰ï¿ğ…/Ô;Ò>	WC)¸Iïq¼WïyÏ{¦ìW¢îÒg|Ëxßãût´/v8âC=^/>4S ƒÁÛo¿}¼Fãk|p7-¼üòË\'„fğ´_C3œ9Ó*Üù“)îo\'ä9¥ÖF‹\Zîu»Œí%¶•´m¦m&?³§1àï$\\ïäñù™{1³#Âù©|X›¤ú,à™2pmıÄgëT÷ÇÌ›ü÷éıúéOZ¿âıxóïwã,Œ4K;Æ	ñœ¨¿©Âô¸ïÆo¯ÑøY©V#\0ˆıôØ^x¡şÚi\'-N%O;cùß=ÿÚñwß%Ûx”Íf¢—|ç|^k¨Ó6ßïÙ	\'œP{Æ£ÆÙ;.Gm¥çÆ¸3nÇ;ŞQŸeËDİ¥qi|5ƒ§x5”ÓEŸ’f\\EÑ,à‰ÉÑß¤ÿO\ndòcËôøx½˜U}MŒ5cÿ4°¹ñ”ş4^M3~ò¢îâçLµ”IájhéÒ¥úÒ—¾tğ­·º7‰ç+_ùÊ+µ7æÃ•’éfá§Ä4İ¶qÇ¼ÕÈX×âÇ?şñøQğØ	Jéu|çwŞó¸©fğ¤¨ô{Ä¿#	Më³¤´ük÷ãUÑj¨uµğo|£¾ÃS+ãÃ>%ñé´šf;\nùÙ=Q?iÇ>¦áª¡bÕPzŸÒ{apLûïÓ‡_\ZÌÅ -ÉKï{|##1h‹ïS}DEı¤\ZÚüÔ§>Uİ˜·åg\n¦Ù†±ƒØ¸ó*à™µéfĞLîTfò¤ÓÄÎ+û°›ÛeÚÎbÖd:B;A±3ƒØf;¶†ë3	ãgğ|à¨oçñ}ìÅ\\Îài+pmıD_\Z3câıÉ¯©X;u&ÕKãØ }ş6›Á“ß)ÎŸZŸóq*W\np¦:}0úíø}Rİjç- ÅÎzúìˆ±BÌâˆƒQÍ›ÿTr§çÌv¹€‚íœw¥†f:6˜÷,úŸü¾GÔfã©8étĞÆšBùŸãßØiO©û4à)d\r¥¾)H\nc¿\":Çû¡_ÔF„ÃiÙûŞ÷¾úç_ã8ˆ÷ÇL®«Æ‰÷¿ÿıõÛ>ö±ˆÌ×]¾OÌ÷ñØtzj©jhÙ²eüñW»îÔ6´CµŸ·İ\0®½3ídGç™vÌ£Àóç;Ç`/uù‚ÇÅ ,7ÑÙÆ:éšNV;æ±3–ïl»uJ„óbÔQJ»Óôë´ó;óñü©Çš\0;\riê®\Z*^\råúñ^Å‡äTS·c‡3MÔ±#áP\nâhKãéƒÓÍÈ‰úJGxâññ{åk5>ÄcŠo½SCk5“§İp§Ó\'ı¼óÂ¯ÛÛeì°¤Ág~†eü»Õ4òNÃõ™<>fğ¤SqRÈß7îìÙ.ç¾~Ò,™ø¬NkYägO5Î°Nïi¬­3V¬X1ğüõ_ÿõ„Ó´âs>v¢â¨wïÜÅÏ‰õuÒv;Üi‡,Şï´ó”ß‰jğ¤>=)Ò‘ø_¦öf…H§G€”¶…ø06˜ÿÖÍ÷,<§dÇX¢YÀS[c2¾Æ8$íÈÛG)N\rÅ¾HìCÆçXã::TGß’N+Mg\0ä÷S?›b¿$ğä×…JÁwãúMé w\ZW¦ºŠƒ©ÿJ§¹–rOˆéZ—]vÙşnÌâ¹üòË_¬ı¼epÓ·èS‘åwÌ[švÒlüj³#Û•6OÑjÜ	KëcäÆUÚ\\TMçÙıóùª£4C\'½^æÓÑã4(LşiÇ@ÀS®\ZJçÙGKŒiOôùÁV~ûOŠé4[±fNLßû›7]*~^«™_Íen¶£§4.¼¨†:šÉÓxºÔòÂ©B‹;˜1d|ĞÆ\09D<}.Ç6—föDßš?¢Ó¾·İÇÇ¶;÷ù÷J‹uØl—óğÄM\rO!_³€\'vh\"O;OiÇ8¡n\\€4Ö°ˆÏùx~Z„9;±ó;è±`nZ;#~^>ˆ\ZÊÏÆÌ/ÚŸvºã³!Æñ³âó&¾qDêÏó\'ÿÏéÔÁÊ.æml0}ëÖ{cÊØiÙS-ì_ó\'vàãwIcĞtªVÌB×õ¾†òµ‘.øÓ8C«q^cÀ“_\"B™Æ<©?ŠÛbİÈôÚ)8j¼xGÚ—IÁd¾OŒ~.î¾³tŸcƒƒƒï»ï¾_Ïg¸S{3öÕ~ÎÖÖèûófk§L·úw¥ÉÂ‹éô†ÆÇ¥iq3xÒ4ëf+Ù§d4>°Íà)G\rÍg¥×‹)Ù©6ÒÎ{š¦ÿ Nî5Ç6»Â’\Zêm\r5Ò¦šÁŒq$8fz¥A[>èIS[ë/\rÊòÎ†<ù…—óaM;áNešçòRèeœá›úäØ&#@í«2v:T³éäóğD¿Ÿfræ§·ç2tëJ›fğ´Áµ‘vx£>bí”|?G¼£ïÍ¯Ï—>ëc§9­ÿT™ât«üWãÌñ©NÑJcÏxı4;3…I14j-¿€n|Ş\\qÅ“Â£´—oÌO?4ßïY\nn¢¶ó\Z¯ıRÌ°Hû5)¾)*Úêjoú ŞÖP³3F\Z÷7\ZtJª…f‹,7›€ıQ„“­~—ô5“^?Æ³)„*İ>J¬‰³téÒÑÚNÖ¡ùwöîİûz¼şàààÇà¦_M<.I­Ù¥Èó—±L^¾8cEúH­cšt:ª7İ®¦[<¿@Zú>~3xŠÛyv«Òà0­­AMt´é\nJSiœİcı”b‡„Ñ\"˜™ê­4Ğ‹uºÒ‘átU­¨£´O~†`ÚYm¬Vµ“xâû,Nun¾\ZêXãéZ26§ÓKŸ7>oñBwz±]¦SaÒ6–?å±Uxßi¸Şéã+\rkğD°N×Šß7Æ­êxº7ƒ§ññiît€¦Ù©5ùµ1¢Rß›ÖƒJcÃVõ0UÀcˆ4ë,úõtÅÆTãé\n6S-*¿OÌT«\0ÑØ`êÖ­÷,Îˆ~#Õ^´8•°YcÎ\"ˆšOû4ét­n/´¬†fğ4ŞÖğ¤³HRİMğ¤<iœ›]%0Bí8³%^;?¨ÙÁíRÕPµZX¾|ùK/¿üòsîÄëÕ^÷å²šÕ‹©k‚âè]¤×ùt:\r¬šu†-\nzºKæ/¹švä£cNWÌÈ0u½ï<»UG©SM—¦L§f¥u¦\np<åxb†ÎT‰¾$aO³»òk„¤Óøò§h5.˜œj#C­f£¥Óó÷Åtßvú<OÇ!Ï\\Ì*ôÕ²Ê²]Ægm„Ÿ1ëèçc‡+¶Í˜Ñáüt}§}ïTí<mëéØig,P×]w]ıkşJ]¶Ëù	xâµ¢L§ÑägI6Î¼MáO ‰ãJ‹«f¦Ù±“RZ×$ê.Ò¬¡NôÿÙ•±Åù£æ¢Îã€ÔTŸI±Ğj:°³Fâ\0C~M7cƒ¹oóıE]¥À(fá¬^½ºàÄó\"„lÖÇ¥ƒ—ù±iêsâû8àilP¼€\'öAOÑj<+¤ÕD„xŸã31­éÔNÀ·ÅşN~É‰ÊØ%Õc†cÔqªåÊØ\Z<éûüä†RÕPm°pIí?²×®]¿›‹pgÏ=¿‹×«V«c\0§é<Õ\ZRCj¨ïB¹‹ú~»¬4¬ƒ—o±§Vu+àI‹§V\ZVé%ª<3»ŠV%wÅÌX¯$Íl¨Œ]T¡ÉßgÒ™8µæ²Ë._ 6¿_šµ•NŒÇåwöƒ¡|à7İ©·éô°ØYk¬ŸX`7v¶ò;t±£;hQçÍfÇó—-[fl0m>ß³¨ÅX°=şOñ:ùY¹QqÑ†8M´qÆYü;}cüÍ~F·–“PCí¶4–WirÆ@ôa!rjiY³ÙÛÍ6<3Ìº5Ó´ë53y÷³Ÿıìÿ›ÍÂË÷İwß/—,Yòr„FpšÎS\r©!5¤†Jg¶§U-ØÓ²l—¶Kõ£~Ô¦†´ÒÔP¬É3888´|ùòÿıØcíì$ØyüñÇÿãK_úÒÎÚkl)óš;\n_ç©†Ô\ZÒú<àÉ‡4ÎÀY*Û.m—êGı¨!M\ri¥­¡#èY¶lÙÈõ×_ÿØ†\rz±æğáÃ¯E˜_÷ïß¿ï±Çûå\r7Ü°åâ‹/şM;1k§¬WËRø\n_\r©!5¤	xš†5gÏÓã4¦~Ô\ZRCZ·jhéÒ¥\Z¼j```M­í­µÃ±¸ßØ×}µ¶¶ÖVÆÌ8Mç©†Ô\ZRC}òœRk‡jí¼~ùÃØ.m—êGı¨!M\riÆ—\n_ÓyjjH\r©¡2Y<Ş,âşÑ~\nwl—¶Kõ£~Ô¦†4ãK8Mç©©!5¤†ÒL¾:-Ëvi»T?êG\rijHSCpšÎSSCjH\r-´§oÃÛ¥íRı¨5¤©!ÍøÒ\0NÓyjjH\r©¡…òÜÜÏáíÒv©~Ô\ZÒÔf|i\0§é<55¤†ÔPÙÅš;Y¥.…n»´]ªõ£†45¤©!8Má«!5¤†ÔĞBö§Æ¶KÛ¥úQ?jHSCšñ¥Â×tš\ZRCjãMÀ£©5¤†Ôf|©ğ¾\ZÒÔ¦†°]jÍØ@SCjH\r¡ğ¾\ZšÔ^{íµlçÎõ¯³¹]\ré‡ôCh¶Kõ£~Ô\ZRCšñ¥Â×t=jÖÔ~åú×ÙÜ®†ôCú!Œ4Û¥úQ?jH\r©!ÍøRák:O\ZÒ©!l—š€GS?jH\r©!5„ÂWøjHÀ£†45„íÒv©~4cM\r©!5„ÂWø\ZÒ|\0c»´]ªõ£†45¤©!8MáxÔ~H?„ñf»T?êG\r©!5¤_*|Mç)àQCú!5„íRğhêG\r©!5¤†Pø\n_\r	xÔæÛ¥íRıhÆš\ZRCjÈ\0NÁ)|€G\ri>€±]Ú.ÕúQCš\ZÒÔœ¦óğ¨!ı~ãÍv©~Ô\ZRCjH3¾TøšÎSÀ£†45„íRğhúu5¤†Ô\ZBá+|5$àQCš`l—¶Kõ£hjH\r©!8Máx<jH?äÛ¥íRı¨5¤©!Íø²|Ö­[§àŠÓ×\nÿM5$àQCš\ZÂÀXğhvÎ½wjH\r©!:²yóæıPth###÷Õ\n—\Zš¿öÚk¯ÕÃšø:›ÛÕ~H?„@šàUı¨5¤†Ôæ\0b¡¬_¿şÜ7şşå—_ş/…×»‚ªááájíB5¤©!M\r!xÕÊ¼ªõ£†Ô\ZÒ@ì‘Ú`şìÚü‰HÕbê”Öõ÷]eŞ©RCjH\r©!\0Ò¯êGı¨!5¤†4\0¯Ú\n^ÕúQCjH\rÍ¾\r¨!\0\0\0€2‹€Ç_\0\0\0 Ä<\0\0\0\0%\'à\0\0\0(9\0\0\0@É	x\0\0\0\0JNÀ\0\0\0Pr\0\0\0€’ğ\0\0\0\0”œ€\0\0\0 ä<\0\0\0\0%\'à\0\0\0(9\0\0\0@É	x\0\0\0\0JNÀ\0\0\0Pr\0\0\0€’ğ\0\0\0\0”œ€\0\0\0 ä<\0\0\0\0%\'à\0\0\0(9\0\0\0@É	x\0\0\0\0JNÀ\0\0\0Pr\0\0\0€’ğ\0\0\0\0”œ€\0\0\0 ä<\0\0\0\0%\'à\0\0\0(9\0\0\0@É	x\0\0\0(­,ËÚ³gÏšíÛ·ÿqİºuÙĞĞÖå6<<œmŞ¼ùwµ¶LEö€\0\0€ÒŠpgË–-Ù²#Gh=j£££Ù¦M›^¾PUö†€\0\0€ÒŠ™;ÂÂ„<G†††v©ÊŞğ\0\0\0PZqZ–p¥8mhhèMUÙ\0\0\0J+Ö€¬*à2ôˆ€\0\0€Òj7àyí÷û³=OüSöÌğwë-¾Û„2…BÀ\0\0@iµğ:8’íü×UÙ/¾zB‹Ûâ>ÁŒ€g!ğ\0\0\0PZí<ûù—IáNj/>³V0#àY<\0\0\0”V;Ï®\rßoğÄ}‚ÏB à\0\0 ´Ú	xv]ß2à‰û3…@À\0\0@i	x<ıh```m:Ó´\'ü¥\0\0\0(…v¸jV«€\'îÌxÊf``à”Z{sª€§Z­í/\0\0@)´ğìŞzkË€\'îÌxÊh``à‘)m‹-:Ê_	\0\0€Rh\'àyedG¶óÑë&ŸU»-îÌxÊhlOÓ€gppğ<!\0\0\0J£€\'ÚŞ\'ïğÄmBO™µX‹ç	³w\0\0\0(•¶7ŞÈv?ö÷“OÏªİ÷	f<eÕl-kï\0\0\0P:Ó<‡d¿ÚzKË5xâ¾xŒpFÀSVÕjõA³w\0\0\0(µ–Ïodûw¯Ïşıßnî¤‰ÇšÍ#à)£jµúéÜÚ;‹ıE\0\0\0(fÏt³vÌæğ,4i-³w\0\0\0(¥fO;³v¦šÍ#¨ğ”M¬ÅsşùçûÛ\0\0PNÍ™†;©	j<%§fec_\0\0 \\Ú½Lº&àYÀ>Wkkíæ±¯®¢\0\0@¹x<}.…;)Ô‰<£!\0\0\0e\"àğô±ÆpgºÛ\0\0 ˜<>3u¦\nqÒıÖä\0\0 ø<>Ônxc&\0\0\0å àğô™Ú,§Ç\0\0@÷	x<}d¦3rây‡*B\0\0\0ŠJÀ#àé³=İÊéZ\0\0\0—€GÀÓ¦[P9d¹6›×\0\0€îğx¸vTn\'à	fò\0\0\0P<ÏÖÉÉí<¾.\0\0\0Ì?€gêt¦M\'Oşõ…<\0\0\0ô€GÀ³\0Íä4ªN`M\0\0\0ŠAÀ#àY`f\ZºÌ$à	Öä\0\0 ÷<å\nxN©V«ªÜ¦Ú]P¹™™<ÁéZ\0\0\0ô–€§O;µ¶¶ÖŞ¬5³|æ>d™MÀ“~şhÅL\0\0\0zAÀSì€§1ØIMåN\nWf{šÔl`M\0\0\0zCÀSÌ€§Z­~:NÅjv<“ÌÕ\Z8sğÌåï\0\0\0íğ/ài6cGÀÓT;3f²ylÓ…<Öä\0\0@ÀÓÇÖf«•ğÍÓ”x/ÊØïùS½\0\0\0:à‰àsÎ9gÊ°ãŒ3ÎÈ.¹ä’ìâ‹/Ôzè¡úk4{îİwßíÛ·/Û²eKö©O}ªt§h]tÑEŸØfÏ”Ú¹j–<\0\0\0xæ«íŞ½»¾“|ÒI\'e¯¾újÓÇD€süñÇ·|W^y¥iÀóúë¯×o¿í¶ÛÆƒ¤M›6MzÜèèhı¾ßşö·õûSx?7Z„Dqÿã?Ş³E–×~§-)Ã”Ckğ\0\0\0ĞÏzğ¼ôÒKõéP\"Ü‰ïo¿ıö¦Ï¢E‹ê³pòáË=÷ÜSNzf3ƒâ±ù¯Zµªéïòä“OÖ¿:thÂã×¬YS¨Ë¤ÍèÙ\"à™2T™ÍŒWÑ\0\0 ¼ºğìÜ¹³¾½nİºI3qŞó÷d{÷îğœpÂ	õğåØcÍÎ<óÌúmï{ßû²µk×6Á“fíØ±cü¶Ã‡×o[½zõømñsÒ)^¥`\'ı~Ex’±=ÛTî$³93Û€ç”Z­w\0\0\0è…n<q:T¬…óğÃOZGç®»îªŸŠõÀÔw°c†Nã)Z•\\èßÿèG?šğ¤=iVN|ÿÙÏ~¶ş}¬Çÿp(f\rEè“‚Ÿ|püñÅ×;ï¼³~úXz~Q¦4›4³	xÒibçy\0\0\0è‰n<¦¤ï>úèúlœÆÅ’_|ñÅ–kğT\Z‚˜;î¸cRÀS›“{ò3qÒZ;§s5xŠ:ƒ‡¶Â–™„<3\rxÒÏî\0\0\0Ğ;½Xƒ\'v¢ï¿ÿşI·İ{ï½S<1(…A1¨Õ\"Ëéñ7İtSıûç{nÊß%B4Ã\'â%à)µ˜ÉÓééR3	x¬¹\0\0@1)ài¼­1àI³oâûXC§UÀ·}ãßÿw¬×Óå3ŠÌàYpÚ¹„z^§K¡\0\0P½\nxN>ùäI§hÅÕ²Ú¹Lz;q\nVZ9ß7ŞX_gçšk®©??]y+wÁ4ı]\"ÌI‰µwâëE]4~[DRêät­NNÃ#\0\0\0˜_½\nxyä‘I·å¯¬-® uÎ9ç4}ƒâ9+W®œpûqÇ—zê©õ™8ùKŸ?ûì³ÖèÉ·×_½\'³u<]ÑnÈÓnÀ3“Ó¿\0\0\0`~õ\"àÑ<]ÖNÈÓNÀ3ÛK±\0\0ÀüğxúÄlO«rZ\0\0\0Å%àğô‘™^õÊ‚Ê\0\0\0›€GÀÓg:=ÍÊiY\0\0\0Ÿ€GÀÓ‡Ú\rmN©µCµv?\0\0\0…&àğô©8İêP¥õiWéjYÂ\0\0\0ŠOÀ#àéc­fò8-\0\0€rğxú\\c˜#Ü\0\0 |<ÆC›+Â\0\0\0ÊHÀ#à¡nñÀÀ@üí]\n\0\0€òğxxÛXÀ\0\0\0å#àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥%àğğ6\0\0\0¥µnİ:ÁJqÚá¡¡¡7Ueox\0\0\0(­Í›7ï?pà€p¥\0mddä¾¡¡¡]ª²7<\0\0\0”ÖúõëÏİ¸qãï_~ùåÿ²ônæN„;ÃÃÃ/ÔÚ…ª²7<\0\0\0”ÚğğğÙCCCOÄéA±L[ìœ—õwû»ïîô–€\0\0\0ìœ£†\0\0\0\0;ç¨!\0\0\0°sj\0\0\0ìœ£†\0\0\0\0;ç¨!\0\0\0ÀÎ9j\0\0\0ìœƒ\Z\0\0\0;ç¨!\0\0\0ÀÎ9j\0\0\0°s\Z\0\0\0;ç †\0\0\0ÀÎ9j\0\0\0°s\Z\0\0\0ìœ£†\0\0\0ÀÎ9¨!\0\0\0°s\Z\0\0\0ìœ£†\0\0\0\0;ç¨!\0\0\0°sj\0\0\0ìœSòzY53M{Â_\n\0\0\0º»Ã.à¡“z9¥ÖŞœ*à©V«gûK\0\0@wwØ<tZ3Lğl[´hÑQşJ\0\0\0ĞİuÖÌ)­ÁÁÁóü…\0\0\0 û;ëfR7ÍÖâyÂì\0\0\0èÍº€‡™ÔÍ¤µx¬½\0\0\0½ÛQğ0#ÕjõA³w\0\0\0 \0<ÌTµZıtníÅş\"\0\0\0Ğ#fY?õµxÌŞ\0\0€Şî x˜Mıœ¢†\0\0(•,ËÚ³gÏšíÛ·ÿqİºuÙĞĞÖå6<<œmŞ¼ùwµ¶LÍh±f<>W4}\0\0ó,á[¶lÉ89rDëQÍ6mÚôjmP~¡šÑZÍx|®hú\0\0æYa5/Ì`üÈĞĞĞ.5£-´šğø\\Ñô\0\0Ì³˜>o\\œVˆ¿©f´…V3Ÿ+š>\0€yçê\0j ©m¡ÕŒ€ÇçŠ¦\0\0  ñ×~¿?ÛóÄ?eÏ·Şâû¸ÍàYÀ£fÔŒ€}„>\0€ÄÉvşëªì—_=¡ÅmqŸ´€GÍ¨ú}\0\0ˆï{æ_&\rÂS{ñ™µĞ5£f<è#ô\0\0} ¾kÃ÷[Äã>hšQ3ôú\0\0\n>ß9t}ËxÜg\0-àQ3jFÀƒ>B\0€¸&àÑì¼Í&ÌYÎ4í	=¾>B\0@_Äãê&­âqŸ´€GÍ¨™<§ÔÚ›S<Õjõl=¾>B\0@_Äwo½µå@<î3€ğ¨5S€ç‘)m‹-:Ê_I¡\0\0 ¯â¯ŒìÈv>zİäiôµÛâ>hšQ3xNiğç/¤ĞG\0\0Ğ÷ñh{Ÿ¼{Ò@<n3xğ¨5S §ÙZ<O˜½£ĞG\0\0` í7²İııäiôµÛâ>hšQ3	x&­Åcí}„>B\0` ^k‡d¿ÚzKËµâ¾xŒA´€GÍ¨™\"¨V«š½£Ğô\0\0â¹£«ûw¯Ïşıßn9O-uÔµÏ5£fŠğ|:·öÎb}„>B\0Ğ·ñé®:ê*àQ3j¦ÈÒZ<fïè#4}\0@_ÄÛ9º:ÕQWêşxÔŒš)XÀsÊùçŸïï¢Ğô\0\0ı=Ÿé <5êşxÔŒš)˜85+ûŠ>B\0@Ä5q5£fJìsµv°Önûê*Zú}\0\0âš¸šQ3%wR¨3xF…<ú}\0\0âš¸šQ3åw¦»}„>\0\0qMÀ£©™Y<Mˆ“î·&>B\0PvK—.ıPµZ½b```M­í®µCqİZ;\\k{k÷=Xûº2g ®ˆ«5SºpgºğÆL}„>\0 ÌÏ«µ¡Z;2è´Ó6Ô¿Ì@\\3W3j¦Ğ>WélfN§G¡\0\0èµş¢ƒP§YÛòñ\'ˆkâjFÍ6Ü9{Ï;$äÑGè#\0\0J Z­,Y²äÿäÃš¥K—fû·›­_¿>ûÍo~“ıçşg^ıõldd$ÛºukvóÍ7g_üâCCy6¸¸šQ3}îÌÕóÑGè#\0\0ºîœ=88øV>Ø¹ç{²dí8xğ`ıññ¼|ĞS{Í/ˆkâjFÍôÜt*‡,×fó:è#ô\0\0=\nwòáÎŠ+ê³uf\"wõÕW7†<n&¸¸šQ3%w¦;½ª€\'˜É£ĞG\0\0M¬¹“?-ëºë®?\rk¦âô­Õ«W7®õ1qMÀã½R3]×ÉÉí<¾.ú}\0À|[²dÉp~æÎlÃ|ÈÓ0“g‹¸&àñ^©™„;íÎ´é$àòè#ô\0\0E—BÏ¯¹3ÓÓ²¦:]+¿&ÏB:UË@Ü@\\Í¨™îÌ$à©T¬É£ĞG\0\0\"àJáK,<şùŸÿyAÎâ17W3j¦Àf\ZºÌ$à™i˜„>B\00–.]ú¡´°rÌ²yå•Wæ%à‰«k5\\BıÃ­~§Ú}§T«Õ\rÄµùˆ÷º¾ÔL¹j¦LıQ‹pg&§MÍ4àÉ‡<ıÜÿõ>W\0\0Š¡6 ¾\"….7Şxc6Ÿn¾ùæ|À³²Ù\0¿ÖÖÖÚ›ñqm.âE©/5Sš)c4ÛeôóG+mÌä)ùßY!à\0(Ú€zM\n]6nÜ8¯ÏÖ­[óÏÚVüÔÄµ¹ˆ­¾ÔL±k¦ÌıQC¸3›Ó¤fğT*Óœ¶\0şÎú\0@áİi`=×‹+7\ZÉ<ûªÕê§cJ~ã\0_À£ÍÅ@¼¨õ¥fŠY3¡?ªÌİ\Z8sğ4ı}ÈßY!à\0(dÀs(\r¬çêÒèS]2=7ÿc«¾€G›Í@¼ÕÌ\0Ö¬-\0¿vôGí,¨œÍc›2äù³?û³+ÈßY!à\0(lÀ3>°î†©öenÁ…\nxÔ‹Öv[HıP­K¿yš.¿Oeì÷ÊÎ?ÿüû ğ\0\0!àéÕÃ]tÑçj_·™ÁÓ^{øá‡³‡z¨Ş=öØlÍš5ã÷ÅÕÏbjË–-“·{÷îú}gœqFı¹K–,É¾üå/7ı›6mÊvîÜ9á¶xî÷¾÷½–¿WÜÿÓŸştÂ¿ò“Ÿô| ^ÔúêöÑùn¾§ñ¸›nº©íß-êñıï!vŞ@ÔÎU³z6ƒ\'ı^¡ß_h}Ä	\'œ}ö³ŸpÛáÃ‡³\r6ÔßÛï|ç;“¶ó«®ºªşı»Şõ®ìóŸÿ|vñÅ×[lÓqzì«¯¾šzê©õ÷}ä#n<îßøFÓ~äÚk¯ÿÜË¿ö1Ç“uûï#à\0Êğôl\rô;.®ı{‹€gúçûï¿üûx`ü¾¸}Üöè£6}Ş9çœ3áßguÖ”?ç;îhùïü =\ræï¼óÎú×^x¡ş5>õz ^´úêÅéóõFxO;_<¦×ˆ5\Z;téñQŸË–-«·¸ÕªUÙ{ßûŞúÎ\\üû{î©ÿ¬_|±g5Sæşh,L9T)ğ\Z<äï¼ úˆYO?ıôñ¾aÇÙİwß½ç=ï©˜iÖŸ\\rÉ%ßx[şñ?şxık|~|òÉõ~#~Ş~ô£ìÉ\'Ÿ¬·üãcû×Ø·o_=hjüÙ·Ür‹€\0 EÀÓó«h%cGv·xZï¤?õÔSÙ\r7ÜPÿş¹ç«9M;Òq[ìL?ÿüóóì³ÏÖÿö±ƒ-nk´Ç@:í”ğƒ¬ïGy¤şø˜õ“vüãwˆç:thüg¤ÿ˜A”úéñÍvz1/J}u«fºñæCÇf3ƒŞùÎwf×\\sÍø¿ÓëçŞ«úïÖË5GZÕLû£†Peñ,^cŞ¯¢µ\0şÎ¥ï#bvglÓ+W®¬ÏŒ¹ıöÛëïùK/½Tß®?úÑ6íSbÖNl·¥ÇOğÄ¿ïºë®ñĞ&İAOúÚÉç`Á\0€&ªÕêi`}ã7ÎkÀsóÍ7ç•­~§±#»ÛÄ›<_ıêWëßÿö·¿?º™vÆò \'\r¦£]vÙeõÇ4-m5K(ı;ê\"}ï½÷ßGmó³=â¨jìÄß$B„ â¾§Ÿ~ºPñ^×W·ÃŒù|O#°Y·nİx÷]zé¥õï¿ğ…/Ôgö4ûÖ®]›}àŸµ¯ÏÍ‡“E©™2õGMB™Îä™mÀsJ­vòóKúw.u‘>??şøì´ÓN›pzfÌª‹ĞçÁŸÉ×jÏm·İ–½ãïÈN<ñÄI§håOqôG«W¯p*V>pŠ×ùñ,à\0èÔÒ¥K?”®jRû¾¾–Ë|ˆSˆ–-[öß¹€çÃâ3xbı‚ü€;\rÕùÓbb°÷ïİ»7»üòËëßGP;íù(n£¸\\pA}xn:ºÚ¤0 ÚqÇWÿİbg êÆšë¾ˆ÷.à™Ï÷´’›íßÇsãû¨­ØAÌ?vtt´¾3‹×Y\0qÊF<gÅŠõÛ>úèz¡ff­­4óğ¤ÓÄÎó	[>\"“üãÙ¶mÛÆgÙÄ¶Şì¤Ûp<>=&>W*-fğDò™Ï|&[´hÑxÀ“NéŒ×ˆ°9…Æ130B§˜ù—š°\'Ÿ_ßÇ\Z<\0\0SJÁKôæÃØ¥ˆSÛb >³õØ1Ok£ÄÎxº=Ö8ˆ¯±(fÜƒòø>ÖD9óÌ3ÇÆ1«\"¾#¶ŸøÄ\'êk ä×8H¯;ßqº-fVÄ×´ƒA`ºc…üìØAx÷»ß]_‡ÅÕNŠğÌç{\Z‰ZgğDí{î¹ã‹giöXc°”_[#\Z—š™µ™Îä™iÀ“~p§}DlûifgZ§-õñ¹Ğ¸F@³{âö´PelÆO³<ñ\Zi=­¸-LnÜæó3[ÍÊ¯³ÿ\Z×åÑG\0\0LxÎKáKÌâ™ëÅ–ãõ–,Y2>{§öó–ˆÏlG=vÀãgÆ`:Å­ŒMâø>fMäŸ“ÖJ‰££•ÜâµÍv°óƒûXË\'¸¦…1ãöXÇ\'ÿØXw!Á\"ù×ˆÙ±3 à)NÀ3_ïi»Oãs>ùÉONºòN/Öâéƒ·˜ÉÓÑéR3xf3cˆôñ¹Ÿ	Ì4<iVNº*^ô\r\nGÀÒÓãgğä/\0ßæ#$nÜæ›Â;UÀãÀ\0@6¤\0&N•˜«K¦GÀğ­o}ë­üìÚNæQâ3ßY#®1\"†¦Ó«Z<­.s]irä4cÛãô˜˜\"ŸØ1¸nöÚ2¥E6c\Z~el¶G|M§¥Å{\rÄ{S3İxOó¯QÉ¢ëõÄÏoUWåªô`m>Úykçê³	xæbagzô¹Ò¸Oelf_Úæã³&…Æ|\03Õm§\n7^µ/poÕ?Äº\\)ˆNWáJmªuäô\0\0o<®µÑÄ\\wİu³y\"ÜY½zu~İCƒƒƒ3ŸY‹éØÙNàâÒ@9N¯©´˜·_tÑEõ÷#Æéhk §åâÆ,Œ˜‘Nç‰Ùét›ÊØBÏig -”¯ŸŸqd Ş»šéö{šx¦û½šÍàiç¹vŞf¬“Óµ:	x:\r(P§;E¨›¶½xÏÓ•óâ”àÔÄÓã+¹S´Ú\rxÒçNš±ßÇzpÍ§Wr—_oœ”~G}\0ÀªÕê@Zp9Íä™ééZñ¼†™;êÔ¬nÄcp|ÒI\'ÿ;ÖØI§×¤Y\Zi\0ZÜ;óù…q#àÉ‡Cù«—Äãbğ»E˜cg?¿†JelÊ~º=ÖùIa@el¦Hã@<Ùlñî^¹Ûïét!MºâVeì2íù€\'WN®\nxzò´ğÌäô/\nğ¤«dÅúWùÛ#@I3eâ BZl94Trë½å·ı¸Üzş¶8ğ3ƒ¢å¯Î³GÓçPº=ÿ9ÿ^¶lÙøš;©ßÿş÷_E²ñ÷ÕG\0\04100pI>ä‰5yâ´‰ØÉk÷jY± r~ÍhÕjõoÄ5ñş®™n/jçmÆ!O;Ïl/ÅNôİ^4]\0Ğ fòÔÚÁ|@AO]ß¸qc}vN:}+Nû©Ïù»¿û»lùòåÌ?/NËŠĞÈ@\\3W3j¦0f{Z•Ó²ôú\0€²ˆ5yò—OŸaÛ²ĞÖÜ17W3jf…<ÎÀ± ²>B\0PÒ çÂ± çÍN‚˜µ³®–e n ®fÔÌÔéiVNËÒGè#\0\0ÊnéÒ¥\Z¼j```M­í­µÃcaN|İWkkkmeÌü1×ÄÕŒšYp!Ï)µv¨ÖÎó‰¨ĞG\0\0` ®	xÔŒš)ÅcáÍâ)îîè#ô\0\0ˆkâjFÍ[«™<NËÒGè#\0\00×ÄÕŒš)qÈ#ÜÑGè#ô\0\0âš¸šQ3%ynîè#4}\0€¸f ®fÔLyÅš;YÅ¥Ğõš>\0À@\\3W3j¦ÔşÔŸ@¡é#\0\0Ä5q5£f@¡\0\0À@\\ğhjŸ+š>\0\0qq5£ÙyÃçŠ¦\0\0À@Ü@\\Í¨ĞGè#\0\00×ÄÕŒš}„>\0\0qMÀ£ÙyÃçŠ¦\0\0À@Ü@\\ÍhvŞğ¹¢é#\0\007W3jôú\0\0Ä5q5£f@¡\0\0À@\\ğhvŞğ¹¢é#\0\007W3š7ôš>\0\0qq5£f@¡\0\0À@\\ğhjôú\0\0Ä5fç\rŸ+š>\0\0qq5£ÙyC¡é#\0\0¨TÖ­[g\0\\œv¸6SÍh­fğ¹¢é#\0\0˜g›7oŞàÀƒà´‘‘‘ûjñ]jF[h5ƒÏM\0À<[¿~ı¹7nüıË/¿ü_Ã½;Â\ZƒğááájíB5£-´šÁçŠ¦\0\0 jƒ¿³‡††ˆiÜq®¾Öõ÷]e\Z„«5ú}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ğ#ÿ?Qù´(õM¬Ï\0\0\0\0IEND®B`‚',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','752501',302);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(5.17.0.2)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','5.18.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('660036','è½¦è´·1','0001','','2015-05-22 13:08:40');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('662506','è½¦è´·1','0001','','2015-05-22 13:17:03');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('665001','w','0001','','2015-05-22 13:43:20');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('667501','f','0001','','2015-05-22 14:08:15');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('737518','w','0001','','2015-05-27 15:11:48');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('747503','è½¦è´·æµ‹è¯•','0001','','2015-05-30 14:40:01');
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('750006','è½¦è´·æµ‹è¯•','0001','','2015-06-08 16:27:06');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('747501',8,'è½¦è´·æµ‹è¯•','chedaitest','0001','2015-05-30 14:39:50','2015-06-08 16:27:07',1,'{\"category\":\"0001\",\"key\":\"chedaitest\",\"name\":\"è½¦è´·æµ‹è¯•\",\"revision\":1,\"description\":\"\"}','750006','747502','750001','');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('chedaitest:1:750009',1,'0001','è½¦è´·æµ‹è¯•','chedaitest',1,'750006','è½¦è´·æµ‹è¯•.bpmn20.xml','è½¦è´·æµ‹è¯•.chedaitest.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  `cvalue` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`cname`,`cvalue`,`note`,`location`) values (1,'app_name','ç®¡ç†åå°','é¡¹ç›®åç§°ï¼Œç”¨äºç®¡ç†åå°æ˜¾ç¤º',0);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `dkey` varchar(100) DEFAULT NULL,
  `dval` varchar(100) DEFAULT NULL,
  `txt` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001','01','è¡Œæ”¿åŒºåˆ’','',0,0);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010001','110000','åŒ—äº¬','åŒ—äº¬',0,0);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100010001','110100','åŒ—äº¬å¸‚','',0,2);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010001','110101','ä¸œåŸåŒº','',0,3);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010002','110102','è¥¿åŸåŒº','',0,4);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010003','110103','å´‡æ–‡åŒº','',0,5);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010004','110104','å®£æ­¦åŒº','',0,6);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010005','110105','æœé˜³åŒº','',0,7);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010006','110106','ä¸°å°åŒº','',0,8);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010007','110107','çŸ³æ™¯å±±åŒº','',0,9);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010008','110108','æµ·æ·€åŒº','',0,10);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010009','110109','é—¨å¤´æ²ŸåŒº','',0,11);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010010','110111','æˆ¿å±±åŒº','',0,12);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010011','110112','é€šå·åŒº','',0,13);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010012','110113','é¡ºä¹‰åŒº','',0,14);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010013','110114','æ˜Œå¹³åŒº','',0,15);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010014','110115','å¤§å…´åŒº','',0,16);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010015','110116','æ€€æŸ”åŒº','',0,17);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010016','110117','å¹³è°·åŒº','',0,18);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010017','110228','å¯†äº‘å¿','',0,19);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000100010018','110229','å»¶åº†å¿','',0,20);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010002','120000','å¤©æ´¥','',0,21);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100020001','120100','å¤©æ´¥å¸‚','',0,22);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010001','120101','å’Œå¹³åŒº','',0,23);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010002','120102','æ²³ä¸œåŒº','',0,24);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010003','120103','æ²³è¥¿åŒº','',0,25);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010004','120104','å—å¼€åŒº','',0,26);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010005','120105','æ²³åŒ—åŒº','',0,27);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010006','120106','çº¢æ¡¥åŒº','',0,28);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010007','120107','å¡˜æ²½åŒº','',0,29);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010008','120108','æ±‰æ²½åŒº','',0,30);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010009','120109','å¤§æ¸¯åŒº','',0,31);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010010','120110','ä¸œä¸½åŒº','',0,32);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010011','120111','è¥¿é’åŒº','',0,33);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010012','120112','æ´¥å—åŒº','',0,34);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010013','120113','åŒ—è¾°åŒº','',0,35);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010014','120114','æ­¦æ¸…åŒº','',0,36);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010015','120115','å®å»åŒº','',0,37);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010016','120116','æ»¨æµ·æ–°åŒº','',0,38);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010017','120221','å®æ²³å¿','',0,39);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010018','120223','é™æµ·å¿','',0,40);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000200010019','120225','è“Ÿå¿','',0,41);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010003','130000','æ²³åŒ—çœ','',0,42);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030001','130100','çŸ³å®¶åº„å¸‚','',0,43);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010001','130102','é•¿å®‰åŒº','',0,44);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010002','130103','æ¡¥ä¸œåŒº','',0,45);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010003','130104','æ¡¥è¥¿åŒº','',0,46);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010004','130105','æ–°ååŒº','',0,47);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010005','130107','äº•é™‰çŸ¿åŒº','',0,48);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010006','130108','è£•ååŒº','',0,49);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010007','130121','äº•é™‰å¿','',0,50);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010008','130123','æ­£å®šå¿','',0,51);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010009','130124','æ ¾åŸå¿','',0,52);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010010','130125','è¡Œå”å¿','',0,53);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010011','130126','çµå¯¿å¿','',0,54);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010012','130127','é«˜é‚‘å¿','',0,55);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010013','130128','æ·±æ³½å¿','',0,56);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010014','130129','èµçš‡å¿','',0,57);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010015','130130','æ— æå¿','',0,58);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010016','130131','å¹³å±±å¿','',0,59);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010017','130132','å…ƒæ°å¿','',0,60);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010018','130133','èµµå¿','',0,61);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010019','130181','è¾›é›†å¸‚','',0,62);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010020','130182','è—åŸå¸‚','',0,63);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010021','130183','æ™‹å·å¸‚','',0,64);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010022','130184','æ–°ä¹å¸‚','',0,65);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300010023','130185','é¹¿æ³‰å¸‚','',0,66);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030002','130200','å”å±±å¸‚','',0,67);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020001','130202','è·¯å—åŒº','',0,68);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020002','130203','è·¯åŒ—åŒº','',0,69);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020003','130204','å¤å†¶åŒº','',0,70);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020004','130205','å¼€å¹³åŒº','',0,71);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020005','130207','ä¸°å—åŒº','',0,72);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020006','130208','ä¸°æ¶¦åŒº','',0,73);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020007','130223','æ»¦å¿','',0,74);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020008','130224','æ»¦å—å¿','',0,75);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020009','130225','ä¹äº­å¿','',0,76);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020010','130227','è¿è¥¿å¿','',0,77);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020011','130229','ç‰ç”°å¿','',0,78);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020012','130230','å”æµ·å¿','',0,79);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020013','130281','éµåŒ–å¸‚','',0,80);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300020014','130283','è¿å®‰å¸‚','',0,81);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030003','130300','ç§¦çš‡å²›å¸‚','',0,82);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030001','130302','æµ·æ¸¯åŒº','',0,83);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030002','130303','å±±æµ·å…³åŒº','',0,84);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030003','130304','åŒ—æˆ´æ²³åŒº','',0,85);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030004','130321','é’é¾™æ»¡æ—è‡ªæ²»å¿','',0,86);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030005','130322','æ˜Œé»å¿','',0,87);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030006','130323','æŠšå®å¿','',0,88);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030007','130324','å¢é¾™å¿','',0,89);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300030008','130399','ç»æµæŠ€æœ¯å¼€å‘åŒº','',0,90);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030004','130400','é‚¯éƒ¸å¸‚','',0,91);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040001','130402','é‚¯å±±åŒº','',0,92);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040002','130403','ä¸›å°åŒº','',0,93);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040003','130404','å¤å…´åŒº','',0,94);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040004','130406','å³°å³°çŸ¿åŒº','',0,95);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040005','130421','é‚¯éƒ¸å¿','',0,96);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040006','130423','ä¸´æ¼³å¿','',0,97);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040007','130424','æˆå®‰å¿','',0,98);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040008','130425','å¤§åå¿','',0,99);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040009','130426','æ¶‰å¿','',0,100);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040010','130427','ç£å¿','',0,101);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040011','130428','è‚¥ä¹¡å¿','',0,102);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040012','130429','æ°¸å¹´å¿','',0,103);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040013','130430','é‚±å¿','',0,104);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040014','130431','é¸¡æ³½å¿','',0,105);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040015','130432','å¹¿å¹³å¿','',0,106);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040016','130433','é¦†é™¶å¿','',0,107);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040017','130434','é­å¿','',0,108);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040018','130435','æ›²å‘¨å¿','',0,109);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300040019','130481','æ­¦å®‰å¸‚','',0,110);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030005','130500','é‚¢å°å¸‚','',0,111);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050001','130502','æ¡¥ä¸œåŒº','',0,112);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050002','130503','æ¡¥è¥¿åŒº','',0,113);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050003','130521','é‚¢å°å¿','',0,114);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050004','130522','ä¸´åŸå¿','',0,115);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050005','130523','å†…ä¸˜å¿','',0,116);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050006','130524','æŸä¹¡å¿','',0,117);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050007','130525','éš†å°§å¿','',0,118);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050008','130526','ä»»å¿','',0,119);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050009','130527','å—å’Œå¿','',0,120);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050010','130528','å®æ™‹å¿','',0,121);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050011','130529','å·¨é¹¿å¿','',0,122);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050012','130530','æ–°æ²³å¿','',0,123);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050013','130531','å¹¿å®—å¿','',0,124);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050014','130532','å¹³ä¹¡å¿','',0,125);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050015','130533','å¨å¿','',0,126);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050016','130534','æ¸…æ²³å¿','',0,127);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050017','130535','ä¸´è¥¿å¿','',0,128);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050018','130581','å—å®«å¸‚','',0,129);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300050019','130582','æ²™æ²³å¸‚','',0,130);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030006','130600','ä¿å®šå¸‚','',0,131);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060001','130602','æ–°å¸‚åŒº','',0,132);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060002','130603','åŒ—å¸‚åŒº','',0,133);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060003','130604','å—å¸‚åŒº','',0,134);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060004','130621','æ»¡åŸå¿','',0,135);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060005','130622','æ¸…è‹‘å¿','',0,136);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060006','130623','æ¶æ°´å¿','',0,137);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060007','130624','é˜œå¹³å¿','',0,138);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060008','130625','å¾æ°´å¿','',0,139);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060009','130626','å®šå…´å¿','',0,140);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060010','130627','å”å¿','',0,141);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060011','130628','é«˜é˜³å¿','',0,142);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060012','130629','å®¹åŸå¿','',0,143);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060013','130630','æ¶æºå¿','',0,144);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060014','130631','æœ›éƒ½å¿','',0,145);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060015','130632','å®‰æ–°å¿','',0,146);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060016','130633','æ˜“å¿','',0,147);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060017','130634','æ›²é˜³å¿','',0,148);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060018','130635','è ¡å¿','',0,149);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060019','130636','é¡ºå¹³å¿','',0,150);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060020','130637','åšé‡å¿','',0,151);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060021','130638','é›„å¿','',0,152);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060022','130681','æ¶¿å·å¸‚','',0,153);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060023','130682','å®šå·å¸‚','',0,154);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060024','130683','å®‰å›½å¸‚','',0,155);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060025','130684','é«˜ç¢‘åº—å¸‚','',0,156);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300060026','130698','é«˜å¼€åŒº','',0,157);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030007','130700','å¼ å®¶å£å¸‚','',0,158);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070001','130702','æ¡¥ä¸œåŒº','',0,159);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070002','130703','æ¡¥è¥¿åŒº','',0,160);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070003','130705','å®£åŒ–åŒº','',0,161);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070004','130706','ä¸‹èŠ±å›­åŒº','',0,162);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070005','130721','å®£åŒ–å¿','',0,163);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070006','130722','å¼ åŒ—å¿','',0,164);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070007','130723','åº·ä¿å¿','',0,165);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070008','130724','æ²½æºå¿','',0,166);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070009','130725','å°šä¹‰å¿','',0,167);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070010','130726','è”šå¿','',0,168);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070011','130727','é˜³åŸå¿','',0,169);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070012','130728','æ€€å®‰å¿','',0,170);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070013','130729','ä¸‡å…¨å¿','',0,171);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070014','130730','æ€€æ¥å¿','',0,172);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070015','130731','æ¶¿é¹¿å¿','',0,173);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070016','130732','èµ¤åŸå¿','',0,174);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300070017','130733','å´‡ç¤¼å¿','',0,175);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030008','130800','æ‰¿å¾·å¸‚','',0,176);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080001','130802','åŒæ¡¥åŒº','',0,177);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080002','130803','åŒæ»¦åŒº','',0,178);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080003','130804','é¹°æ‰‹è¥å­çŸ¿åŒº','',0,179);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080004','130821','æ‰¿å¾·å¿','',0,180);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080005','130822','å…´éš†å¿','',0,181);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080006','130823','å¹³æ³‰å¿','',0,182);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080007','130824','æ»¦å¹³å¿','',0,183);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080008','130825','éš†åŒ–å¿','',0,184);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080009','130826','ä¸°å®æ»¡æ—è‡ªæ²»å¿','',0,185);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080010','130827','å®½åŸæ»¡æ—è‡ªæ²»å¿','',0,186);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300080011','130828','å›´åœºæ»¡æ—è’™å¤æ—è‡ªæ²»å¿','',0,187);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030009','130900','æ²§å·å¸‚','',0,188);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090001','130902','æ–°ååŒº','',0,189);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090002','130903','è¿æ²³åŒº','',0,190);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090003','130921','æ²§å¿','',0,191);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090004','130922','é’å¿','',0,192);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090005','130923','ä¸œå…‰å¿','',0,193);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090006','130924','æµ·å…´å¿','',0,194);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090007','130925','ç›å±±å¿','',0,195);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090008','130926','è‚ƒå®å¿','',0,196);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090009','130927','å—çš®å¿','',0,197);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090010','130928','å´æ¡¥å¿','',0,198);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090011','130929','çŒ®å¿','',0,199);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090012','130930','å­Ÿæ‘å›æ—è‡ªæ²»å¿','',0,200);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090013','130981','æ³Šå¤´å¸‚','',0,201);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090014','130982','ä»»ä¸˜å¸‚','',0,202);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090015','130983','é»„éª…å¸‚','',0,203);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300090016','130984','æ²³é—´å¸‚','',0,204);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030010','131000','å»ŠåŠå¸‚','',0,205);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100001','131002','å®‰æ¬¡åŒº','',0,206);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100002','131003','å¹¿é˜³åŒº','',0,207);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100003','131022','å›ºå®‰å¿','',0,208);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100004','131023','æ°¸æ¸…å¿','',0,209);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100005','131024','é¦™æ²³å¿','',0,210);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100006','131025','å¤§åŸå¿','',0,211);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100007','131026','æ–‡å®‰å¿','',0,212);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100008','131028','å¤§å‚å›æ—è‡ªæ²»å¿','',0,213);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100009','131051','å¼€å‘åŒº','',0,214);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100010','131052','ç‡•éƒŠç»æµæŠ€æœ¯å¼€å‘åŒº','',0,215);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100011','131081','éœ¸å·å¸‚','',0,216);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300100012','131082','ä¸‰æ²³å¸‚','',0,217);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100030011','131100','è¡¡æ°´å¸‚','',0,218);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110001','131102','æ¡ƒåŸåŒº','',0,219);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110002','131121','æ£å¼ºå¿','',0,220);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110003','131122','æ­¦é‚‘å¿','',0,221);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110004','131123','æ­¦å¼ºå¿','',0,222);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110005','131124','é¥¶é˜³å¿','',0,223);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110006','131125','å®‰å¹³å¿','',0,224);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110007','131126','æ•…åŸå¿','',0,225);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110008','131127','æ™¯å¿','',0,226);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110009','131128','é˜œåŸå¿','',0,227);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110010','131181','å†€å·å¸‚','',0,228);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000300110011','131182','æ·±å·å¸‚','',0,229);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010004','140000','å±±è¥¿çœ','',0,230);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040001','140100','å¤ªåŸå¸‚','',0,231);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010001','140105','å°åº—åŒº','',0,232);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010002','140106','è¿æ³½åŒº','',0,233);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010003','140107','æèŠ±å²­åŒº','',0,234);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010004','140108','å°–è‰åªåŒº','',0,235);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010005','140109','ä¸‡æŸæ—åŒº','',0,236);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010006','140110','æ™‹æºåŒº','',0,237);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010007','140121','æ¸…å¾å¿','',0,238);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010008','140122','é˜³æ›²å¿','',0,239);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010009','140123','å¨„çƒ¦å¿','',0,240);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400010010','140181','å¤äº¤å¸‚','',0,241);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040002','140200','å¤§åŒå¸‚','',0,242);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020001','140202','åŸåŒº','',0,243);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020002','140203','çŸ¿åŒº','',0,244);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020003','140211','å—éƒŠåŒº','',0,245);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020004','140212','æ–°è£åŒº','',0,246);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020005','140221','é˜³é«˜å¿','',0,247);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020006','140222','å¤©é•‡å¿','',0,248);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020007','140223','å¹¿çµå¿','',0,249);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020008','140224','çµä¸˜å¿','',0,250);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020009','140225','æµ‘æºå¿','',0,251);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020010','140226','å·¦äº‘å¿','',0,252);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400020011','140227','å¤§åŒå¿','',0,253);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040003','140300','é˜³æ³‰å¸‚','',0,254);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400030001','140302','åŸåŒº','',0,255);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400030002','140303','çŸ¿åŒº','',0,256);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400030003','140311','éƒŠåŒº','',0,257);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400030004','140321','å¹³å®šå¿','',0,258);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400030005','140322','ç›‚å¿','',0,259);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040004','140400','é•¿æ²»å¸‚','',0,260);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040001','140421','é•¿æ²»å¿','',0,261);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040002','140423','è¥„å£å¿','',0,262);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040003','140424','å±¯ç•™å¿','',0,263);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040004','140425','å¹³é¡ºå¿','',0,264);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040005','140426','é»åŸå¿','',0,265);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040006','140427','å£¶å…³å¿','',0,266);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040007','140428','é•¿å­å¿','',0,267);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040008','140429','æ­¦ä¹¡å¿','',0,268);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040009','140430','æ²å¿','',0,269);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040010','140431','æ²æºå¿','',0,270);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040011','140481','æ½åŸå¸‚','',0,271);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040012','140482','åŸåŒº','',0,272);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040013','140483','éƒŠåŒº','',0,273);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400040014','140484','é«˜æ–°åŒº','',0,274);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040005','140500','æ™‹åŸå¸‚','',0,275);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050001','140502','åŸåŒº','',0,276);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050002','140521','æ²æ°´å¿','',0,277);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050003','140522','é˜³åŸå¿','',0,278);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050004','140524','é™µå·å¿','',0,279);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050005','140525','æ³½å·å¿','',0,280);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400050006','140581','é«˜å¹³å¸‚','',0,281);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040006','140600','æœ”å·å¸‚','',0,282);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060001','140602','æœ”åŸåŒº','',0,283);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060002','140603','å¹³é²åŒº','',0,284);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060003','140621','å±±é˜´å¿','',0,285);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060004','140622','åº”å¿','',0,286);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060005','140623','å³ç‰å¿','',0,287);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400060006','140624','æ€€ä»å¿','',0,288);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040007','140700','æ™‹ä¸­å¸‚','',0,289);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070001','140702','æ¦†æ¬¡åŒº','',0,290);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070002','140721','æ¦†ç¤¾å¿','',0,291);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070003','140722','å·¦æƒå¿','',0,292);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070004','140723','å’Œé¡ºå¿','',0,293);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070005','140724','æ˜”é˜³å¿','',0,294);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070006','140725','å¯¿é˜³å¿','',0,295);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070007','140726','å¤ªè°·å¿','',0,296);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070008','140727','ç¥å¿','',0,297);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070009','140728','å¹³é¥å¿','',0,298);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070010','140729','çµçŸ³å¿','',0,299);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400070011','140781','ä»‹ä¼‘å¸‚','',0,300);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040008','140800','è¿åŸå¸‚','',0,301);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080001','140802','ç›æ¹–åŒº','',0,302);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080002','140821','ä¸´çŒ—å¿','',0,303);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080003','140822','ä¸‡è£å¿','',0,304);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080004','140823','é—»å–œå¿','',0,305);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080005','140824','ç¨·å±±å¿','',0,306);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080006','140825','æ–°ç»›å¿','',0,307);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080007','140826','ç»›å¿','',0,308);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080008','140827','å£æ›²å¿','',0,309);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080009','140828','å¤å¿','',0,310);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080010','140829','å¹³é™†å¿','',0,311);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080011','140830','èŠ®åŸå¿','',0,312);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080012','140881','æ°¸æµå¸‚','',0,313);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400080013','140882','æ²³æ´¥å¸‚','',0,314);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040009','140900','å¿»å·å¸‚','',0,315);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090001','140902','å¿»åºœåŒº','',0,316);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090002','140921','å®šè¥„å¿','',0,317);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090003','140922','äº”å°å¿','',0,318);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090004','140923','ä»£å¿','',0,319);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090005','140924','ç¹å³™å¿','',0,320);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090006','140925','å®æ­¦å¿','',0,321);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090007','140926','é™ä¹å¿','',0,322);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090008','140927','ç¥æ± å¿','',0,323);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090009','140928','äº”å¯¨å¿','',0,324);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090010','140929','å²¢å²šå¿','',0,325);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090011','140930','æ²³æ›²å¿','',0,326);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090012','140931','ä¿å¾·å¿','',0,327);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090013','140932','åå…³å¿','',0,328);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400090014','140981','åŸå¹³å¸‚','',0,329);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040010','141000','ä¸´æ±¾å¸‚','',0,330);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100001','141002','å°§éƒ½åŒº','',0,331);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100002','141021','æ›²æ²ƒå¿','',0,332);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100003','141022','ç¿¼åŸå¿','',0,333);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100004','141023','è¥„æ±¾å¿','',0,334);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100005','141024','æ´ªæ´å¿','',0,335);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100006','141025','å¤å¿','',0,336);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100007','141026','å®‰æ³½å¿','',0,337);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100008','141027','æµ®å±±å¿','',0,338);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100009','141028','å‰å¿','',0,339);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100010','141029','ä¹¡å®å¿','',0,340);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100011','141030','å¤§å®å¿','',0,341);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100012','141031','éš°å¿','',0,342);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100013','141032','æ°¸å’Œå¿','',0,343);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100014','141033','è’²å¿','',0,344);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100015','141034','æ±¾è¥¿å¿','',0,345);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100016','141081','ä¾¯é©¬å¸‚','',0,346);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400100017','141082','éœå·å¸‚','',0,347);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100040011','141100','å•æ¢å¸‚','',0,348);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110001','141102','ç¦»çŸ³åŒº','',0,349);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110002','141121','æ–‡æ°´å¿','',0,350);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110003','141122','äº¤åŸå¿','',0,351);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110004','141123','å…´å¿','',0,352);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110005','141124','ä¸´å¿','',0,353);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110006','141125','æŸ³æ—å¿','',0,354);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110007','141126','çŸ³æ¥¼å¿','',0,355);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110008','141127','å²šå¿','',0,356);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110009','141128','æ–¹å±±å¿','',0,357);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110010','141129','ä¸­é˜³å¿','',0,358);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110011','141130','äº¤å£å¿','',0,359);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110012','141181','å­ä¹‰å¸‚','',0,360);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000400110013','141182','æ±¾é˜³å¸‚','',0,361);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010005','150000','å†…è’™å¤è‡ªæ²»åŒº','',0,362);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050001','150100','å‘¼å’Œæµ©ç‰¹å¸‚','',0,363);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010001','150102','æ–°åŸåŒº','',0,364);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010002','150103','å›æ°‘åŒº','',0,365);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010003','150104','ç‰æ³‰åŒº','',0,366);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010004','150105','èµ›ç½•åŒº','',0,367);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010005','150121','åœŸé»˜ç‰¹å·¦æ——','',0,368);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010006','150122','æ‰˜å…‹æ‰˜å¿','',0,369);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010007','150123','å’Œæ—æ ¼å°”å¿','',0,370);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010008','150124','æ¸…æ°´æ²³å¿','',0,371);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500010009','150125','æ­¦å·å¿','',0,372);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050002','150200','åŒ…å¤´å¸‚','',0,373);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020001','150202','ä¸œæ²³åŒº','',0,374);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020002','150203','æ˜†éƒ½ä»‘åŒº','',0,375);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020003','150204','é’å±±åŒº','',0,376);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020004','150205','çŸ³æ‹åŒº','',0,377);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020005','150206','ç™½äº‘çŸ¿åŒº','',0,378);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020006','150207','ä¹åŸåŒº','',0,379);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020007','150221','åœŸé»˜ç‰¹å³æ——','',0,380);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020008','150222','å›ºé˜³å¿','',0,381);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500020009','150223','è¾¾å°”ç½•èŒ‚æ˜å®‰è”åˆæ——','',0,382);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050003','150300','ä¹Œæµ·å¸‚','',0,383);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500030001','150302','æµ·å‹ƒæ¹¾åŒº','',0,384);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500030002','150303','æµ·å—åŒº','',0,385);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500030003','150304','ä¹Œè¾¾åŒº','',0,386);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050004','150400','èµ¤å³°å¸‚','',0,387);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040001','150402','çº¢å±±åŒº','',0,388);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040002','150403','å…ƒå®å±±åŒº','',0,389);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040003','150404','æ¾å±±åŒº','',0,390);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040004','150421','é˜¿é²ç§‘å°”æ²æ——','',0,391);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040005','150422','å·´æ—å·¦æ——','',0,392);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040006','150423','å·´æ—å³æ——','',0,393);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040007','150424','æ—è¥¿å¿','',0,394);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040008','150425','å…‹ä»€å…‹è…¾æ——','',0,395);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040009','150426','ç¿ç‰›ç‰¹æ——','',0,396);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040010','150428','å–€å–‡æ²æ——','',0,397);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040011','150429','å®åŸå¿','',0,398);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500040012','150430','æ•–æ±‰æ——','',0,399);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050005','150500','é€šè¾½å¸‚','',0,400);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050001','150502','ç§‘å°”æ²åŒº','',0,401);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050002','150521','ç§‘å°”æ²å·¦ç¿¼ä¸­æ——','',0,402);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050003','150522','ç§‘å°”æ²å·¦ç¿¼åæ——','',0,403);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050004','150523','å¼€é²å¿','',0,404);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050005','150524','åº“ä¼¦æ——','',0,405);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050006','150525','å¥ˆæ›¼æ——','',0,406);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050007','150526','æ‰é²ç‰¹æ——','',0,407);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500050008','150581','éœæ—éƒ­å‹’å¸‚','',0,408);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050006','150600','é„‚å°”å¤šæ–¯å¸‚','',0,409);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060001','150602','ä¸œèƒœåŒº','',0,410);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060002','150621','è¾¾æ‹‰ç‰¹æ——','',0,411);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060003','150622','å‡†æ ¼å°”æ——','',0,412);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060004','150623','é„‚æ‰˜å…‹å‰æ——','',0,413);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060005','150624','é„‚æ‰˜å…‹æ——','',0,414);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060006','150625','æ­é”¦æ——','',0,415);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060007','150626','ä¹Œå®¡æ——','',0,416);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500060008','150627','ä¼Šé‡‘éœæ´›æ——','',0,417);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050007','150700','å‘¼ä¼¦è´å°”å¸‚','',0,418);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070001','150702','æµ·æ‹‰å°”åŒº','',0,419);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070002','150721','é˜¿è£æ——','',0,420);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070003','150722','è«åŠ›è¾¾ç“¦è¾¾æ–¡å°”æ—è‡ªæ²»æ——','',0,421);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070004','150723','é„‚ä¼¦æ˜¥è‡ªæ²»æ——','',0,422);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070005','150724','é„‚æ¸©å…‹æ—è‡ªæ²»æ——','',0,423);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070006','150725','é™ˆå·´å°”è™æ——','',0,424);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070007','150726','æ–°å·´å°”è™å·¦æ——','',0,425);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070008','150727','æ–°å·´å°”è™å³æ——','',0,426);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070009','150781','æ»¡æ´²é‡Œå¸‚','',0,427);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070010','150782','ç‰™å…‹çŸ³å¸‚','',0,428);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070011','150783','æ‰å…°å±¯å¸‚','',0,429);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070012','150784','é¢å°”å¤çº³å¸‚','',0,430);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500070013','150785','æ ¹æ²³å¸‚','',0,431);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050008','150800','å·´å½¦æ·–å°”å¸‚','',0,432);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080001','150802','ä¸´æ²³åŒº','',0,433);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080002','150821','äº”åŸå¿','',0,434);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080003','150822','ç£´å£å¿','',0,435);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080004','150823','ä¹Œæ‹‰ç‰¹å‰æ——','',0,436);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080005','150824','ä¹Œæ‹‰ç‰¹ä¸­æ——','',0,437);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080006','150825','ä¹Œæ‹‰ç‰¹åæ——','',0,438);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500080007','150826','æ­é”¦åæ——','',0,439);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050009','150900','ä¹Œå…°å¯Ÿå¸ƒå¸‚','',0,440);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090001','150902','é›†å®åŒº','',0,441);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090002','150921','å“èµ„å¿','',0,442);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090003','150922','åŒ–å¾·å¿','',0,443);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090004','150923','å•†éƒ½å¿','',0,444);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090005','150924','å…´å’Œå¿','',0,445);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090006','150925','å‡‰åŸå¿','',0,446);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090007','150926','å¯Ÿå“ˆå°”å³ç¿¼å‰æ——','',0,447);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090008','150927','å¯Ÿå“ˆå°”å³ç¿¼ä¸­æ——','',0,448);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090009','150928','å¯Ÿå“ˆå°”å³ç¿¼åæ——','',0,449);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090010','150929','å››å­ç‹æ——','',0,450);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500090011','150981','ä¸°é•‡å¸‚','',0,451);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050010','152200','å…´å®‰ç›Ÿ','',0,452);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100001','152201','ä¹Œå…°æµ©ç‰¹å¸‚','',0,453);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100002','152202','é˜¿å°”å±±å¸‚','',0,454);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100003','152221','ç§‘å°”æ²å³ç¿¼å‰æ——','',0,455);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100004','152222','ç§‘å°”æ²å³ç¿¼ä¸­æ——','',0,456);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100005','152223','æ‰èµ‰ç‰¹æ——','',0,457);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500100006','152224','çªæ³‰å¿','',0,458);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050011','152500','é”¡æ—éƒ­å‹’ç›Ÿ','',0,459);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110001','152501','äºŒè¿æµ©ç‰¹å¸‚','',0,460);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110002','152502','é”¡æ—æµ©ç‰¹å¸‚','',0,461);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110003','152522','é˜¿å·´å˜æ——','',0,462);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110004','152523','è‹å°¼ç‰¹å·¦æ——','',0,463);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110005','152524','è‹å°¼ç‰¹å³æ——','',0,464);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110006','152525','ä¸œä¹Œç ç©†æ²æ——','',0,465);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110007','152526','è¥¿ä¹Œç ç©†æ²æ——','',0,466);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110008','152527','å¤ªä»†å¯ºæ——','',0,467);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110009','152528','é•¶é»„æ——','',0,468);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110010','152529','æ­£é•¶ç™½æ——','',0,469);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110011','152530','æ­£è“æ——','',0,470);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500110012','152531','å¤šä¼¦å¿','',0,471);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100050012','152900','é˜¿æ‹‰å–„ç›Ÿ','',0,472);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500120001','152921','é˜¿æ‹‰å–„å·¦æ——','',0,473);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500120002','152922','é˜¿æ‹‰å–„å³æ——','',0,474);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000500120003','152923','é¢æµçº³æ——','',0,475);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010006','210000','è¾½å®çœ','',0,476);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060001','210100','æ²ˆé˜³å¸‚','',0,477);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010001','210102','å’Œå¹³åŒº','',0,478);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010002','210103','æ²ˆæ²³åŒº','',0,479);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010003','210104','å¤§ä¸œåŒº','',0,480);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010004','210105','çš‡å§‘åŒº','',0,481);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010005','210106','é“è¥¿åŒº','',0,482);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010006','210111','è‹å®¶å±¯åŒº','',0,483);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010007','210112','ä¸œé™µåŒº','',0,484);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010008','210113','æ–°åŸå­åŒº','',0,485);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010009','210114','äºæ´ªåŒº','',0,486);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010010','210122','è¾½ä¸­å¿','',0,487);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010011','210123','åº·å¹³å¿','',0,488);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010012','210124','æ³•åº“å¿','',0,489);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010013','210181','æ–°æ°‘å¸‚','',0,490);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010014','210182','æµ‘å—æ–°åŒº','',0,491);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010015','210183','å¼ å£«å¼€å‘åŒº','',0,492);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600010016','210184','æ²ˆåŒ—æ–°åŒº','',0,493);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060002','210200','å¤§è¿å¸‚','',0,494);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020001','210202','ä¸­å±±åŒº','',0,495);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020002','210203','è¥¿å²—åŒº','',0,496);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020003','210204','æ²™æ²³å£åŒº','',0,497);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020004','210211','ç”˜äº•å­åŒº','',0,498);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020005','210212','æ—…é¡ºå£åŒº','',0,499);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020006','210213','é‡‘å·åŒº','',0,500);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020007','210224','é•¿æµ·å¿','',0,501);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020008','210251','å¼€å‘åŒº','',0,502);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020009','210281','ç“¦æˆ¿åº—å¸‚','',0,503);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020010','210282','æ™®å…°åº—å¸‚','',0,504);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020011','210283','åº„æ²³å¸‚','',0,505);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600020012','210297','å²­å‰åŒº','',0,506);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060003','210300','éå±±å¸‚','',0,507);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030001','210302','é“ä¸œåŒº','',0,508);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030002','210303','é“è¥¿åŒº','',0,509);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030003','210304','ç«‹å±±åŒº','',0,510);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030004','210311','åƒå±±åŒº','',0,511);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030005','210321','å°å®‰å¿','',0,512);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030006','210323','å²«å²©æ»¡æ—è‡ªæ²»å¿','',0,513);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030007','210351','é«˜æ–°åŒº','',0,514);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600030008','210381','æµ·åŸå¸‚','',0,515);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060004','210400','æŠšé¡ºå¸‚','',0,516);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040001','210402','æ–°æŠšåŒº','',0,517);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040002','210403','ä¸œæ´²åŒº','',0,518);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040003','210404','æœ›èŠ±åŒº','',0,519);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040004','210411','é¡ºåŸåŒº','',0,520);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040005','210421','æŠšé¡ºå¿','',0,521);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040006','210422','æ–°å®¾æ»¡æ—è‡ªæ²»å¿','',0,522);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600040007','210423','æ¸…åŸæ»¡æ—è‡ªæ²»å¿','',0,523);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060005','210500','æœ¬æºªå¸‚','',0,524);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050001','210502','å¹³å±±åŒº','',0,525);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050002','210503','æºªæ¹–åŒº','',0,526);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050003','210504','æ˜å±±åŒº','',0,527);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050004','210505','å—èŠ¬åŒº','',0,528);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050005','210521','æœ¬æºªæ»¡æ—è‡ªæ²»å¿','',0,529);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600050006','210522','æ¡“ä»æ»¡æ—è‡ªæ²»å¿','',0,530);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060006','210600','ä¸¹ä¸œå¸‚','',0,531);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060001','210602','å…ƒå®åŒº','',0,532);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060002','210603','æŒ¯å…´åŒº','',0,533);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060003','210604','æŒ¯å®‰åŒº','',0,534);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060004','210624','å®½ç”¸æ»¡æ—è‡ªæ²»å¿','',0,535);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060005','210681','ä¸œæ¸¯å¸‚','',0,536);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600060006','210682','å‡¤åŸå¸‚','',0,537);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060007','210700','é”¦å·å¸‚','',0,538);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070001','210702','å¤å¡”åŒº','',0,539);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070002','210703','å‡Œæ²³åŒº','',0,540);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070003','210711','å¤ªå’ŒåŒº','',0,541);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070004','210726','é»‘å±±å¿','',0,542);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070005','210727','ä¹‰å¿','',0,543);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070006','210781','å‡Œæµ·å¸‚','',0,544);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600070007','210782','åŒ—é•‡å¸‚','',0,545);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060008','210800','è¥å£å¸‚','',0,546);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080001','210802','ç«™å‰åŒº','',0,547);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080002','210803','è¥¿å¸‚åŒº','',0,548);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080003','210804','é²…é±¼åœˆåŒº','',0,549);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080004','210811','è€è¾¹åŒº','',0,550);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080005','210881','ç›–å·å¸‚','',0,551);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600080006','210882','å¤§çŸ³æ¡¥å¸‚','',0,552);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060009','210900','é˜œæ–°å¸‚','',0,553);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090001','210902','æµ·å·åŒº','',0,554);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090002','210903','æ–°é‚±åŒº','',0,555);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090003','210904','å¤ªå¹³åŒº','',0,556);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090004','210905','æ¸…æ²³é—¨åŒº','',0,557);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090005','210911','ç»†æ²³åŒº','',0,558);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090006','210921','é˜œæ–°è’™å¤æ—è‡ªæ²»å¿','',0,559);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600090007','210922','å½°æ­¦å¿','',0,560);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060010','211000','è¾½é˜³å¸‚','',0,561);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100001','211002','ç™½å¡”åŒº','',0,562);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100002','211003','æ–‡åœ£åŒº','',0,563);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100003','211004','å®ä¼ŸåŒº','',0,564);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100004','211005','å¼“é•¿å²­åŒº','',0,565);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100005','211011','å¤ªå­æ²³åŒº','',0,566);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100006','211021','è¾½é˜³å¿','',0,567);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600100007','211081','ç¯å¡”å¸‚','',0,568);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060011','211100','ç›˜é”¦å¸‚','',0,569);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600110001','211102','åŒå°å­åŒº','',0,570);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600110002','211103','å…´éš†å°åŒº','',0,571);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600110003','211121','å¤§æ´¼å¿','',0,572);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600110004','211122','ç›˜å±±å¿','',0,573);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060012','211200','é“å²­å¸‚','',0,574);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120001','211202','é“¶å·åŒº','',0,575);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120002','211204','æ¸…æ²³åŒº','',0,576);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120003','211221','é“å²­å¿','',0,577);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120004','211223','è¥¿ä¸°å¿','',0,578);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120005','211224','æ˜Œå›¾å¿','',0,579);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120006','211281','è°ƒå…µå±±å¸‚','',0,580);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600120007','211282','å¼€åŸå¸‚','',0,581);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060013','211300','æœé˜³å¸‚','',0,582);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130001','211302','åŒå¡”åŒº','',0,583);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130002','211303','é¾™åŸåŒº','',0,584);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130003','211321','æœé˜³å¿','',0,585);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130004','211322','å»ºå¹³å¿','',0,586);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130005','211324','å–€å–‡æ²å·¦ç¿¼è’™å¤æ—è‡ªæ²»å¿','',0,587);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130006','211381','åŒ—ç¥¨å¸‚','',0,588);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600130007','211382','å‡Œæºå¸‚','',0,589);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100060014','211400','è‘«èŠ¦å²›å¸‚','',0,590);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140001','211402','è¿å±±åŒº','',0,591);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140002','211403','é¾™æ¸¯åŒº','',0,592);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140003','211404','å—ç¥¨åŒº','',0,593);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140004','211421','ç»¥ä¸­å¿','',0,594);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140005','211422','å»ºæ˜Œå¿','',0,595);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000600140006','211481','å…´åŸå¸‚','',0,596);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010007','220000','å‰æ—çœ','',0,597);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070001','220100','é•¿æ˜¥å¸‚','',0,598);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010001','220102','å—å…³åŒº','',0,599);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010002','220103','å®½åŸåŒº','',0,600);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010003','220104','æœé˜³åŒº','',0,601);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010004','220105','äºŒé“åŒº','',0,602);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010005','220106','ç»¿å›­åŒº','',0,603);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010006','220112','åŒé˜³åŒº','',0,604);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010007','220122','å†œå®‰å¿','',0,605);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010008','220181','ä¹å°å¸‚','',0,606);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010009','220182','æ¦†æ ‘å¸‚','',0,607);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010010','220183','å¾·æƒ å¸‚','',0,608);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010011','220184','é«˜æ–°æŠ€æœ¯äº§ä¸šå¼€å‘åŒº','',0,609);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010012','220185','æ±½è½¦äº§ä¸šå¼€å‘åŒº','',0,610);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010013','220186','ç»æµæŠ€æœ¯å¼€å‘åŒº','',0,611);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700010014','220187','å‡€æœˆæ—…æ¸¸å¼€å‘åŒº','',0,612);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070002','220200','å‰æ—å¸‚','',0,613);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020001','220202','æ˜Œé‚‘åŒº','',0,614);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020002','220203','é¾™æ½­åŒº','',0,615);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020003','220204','èˆ¹è¥åŒº','',0,616);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020004','220211','ä¸°æ»¡åŒº','',0,617);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020005','220221','æ°¸å‰å¿','',0,618);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020006','220281','è›Ÿæ²³å¸‚','',0,619);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020007','220282','æ¡¦ç”¸å¸‚','',0,620);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020008','220283','èˆ’å…°å¸‚','',0,621);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700020009','220284','ç£çŸ³å¸‚','',0,622);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070003','220300','å››å¹³å¸‚','',0,623);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030001','220302','é“è¥¿åŒº','',0,624);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030002','220303','é“ä¸œåŒº','',0,625);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030003','220322','æ¢¨æ ‘å¿','',0,626);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030004','220323','ä¼Šé€šæ»¡æ—è‡ªæ²»å¿','',0,627);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030005','220381','å…¬ä¸»å²­å¸‚','',0,628);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700030006','220382','åŒè¾½å¸‚','',0,629);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070004','220400','è¾½æºå¸‚','',0,630);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700040001','220402','é¾™å±±åŒº','',0,631);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700040002','220403','è¥¿å®‰åŒº','',0,632);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700040003','220421','ä¸œä¸°å¿','',0,633);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700040004','220422','ä¸œè¾½å¿','',0,634);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070005','220500','é€šåŒ–å¸‚','',0,635);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050001','220502','ä¸œæ˜ŒåŒº','',0,636);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050002','220503','äºŒé“æ±ŸåŒº','',0,637);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050003','220521','é€šåŒ–å¿','',0,638);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050004','220523','è¾‰å—å¿','',0,639);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050005','220524','æŸ³æ²³å¿','',0,640);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050006','220581','æ¢…æ²³å£å¸‚','',0,641);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700050007','220582','é›†å®‰å¸‚','',0,642);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070006','220600','ç™½å±±å¸‚','',0,643);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060001','220602','å…«é“æ±ŸåŒº','',0,644);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060002','220621','æŠšæ¾å¿','',0,645);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060003','220622','é–å®‡å¿','',0,646);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060004','220623','é•¿ç™½æœé²œæ—è‡ªæ²»å¿','',0,647);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060005','220625','æ±Ÿæºå¸‚','',0,648);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700060006','220681','ä¸´æ±Ÿå¸‚','',0,649);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070007','220700','æ¾åŸå¸‚','',0,650);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700070001','220702','å®æ±ŸåŒº','',0,651);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700070002','220721','å‰éƒ­å°”ç½—æ–¯è’™å¤æ—è‡ªæ²»å¿','',0,652);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700070003','220722','é•¿å²­å¿','',0,653);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700070004','220723','ä¹¾å®‰å¿','',0,654);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700070005','220724','æ‰¶ä½™å¿','',0,655);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070008','220800','ç™½åŸå¸‚','',0,656);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700080001','220802','æ´®åŒ—åŒº','',0,657);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700080002','220821','é•‡èµ‰å¿','',0,658);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700080003','220822','é€šæ¦†å¿','',0,659);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700080004','220881','æ´®å—å¸‚','',0,660);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700080005','220882','å¤§å®‰å¸‚','',0,661);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100070009','222400','å»¶è¾¹æœé²œæ—è‡ªæ²»å·','',0,662);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090001','222401','å»¶å‰å¸‚','',0,663);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090002','222402','å›¾ä»¬å¸‚','',0,664);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090003','222403','æ•¦åŒ–å¸‚','',0,665);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090004','222404','ç²æ˜¥å¸‚','',0,666);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090005','222405','é¾™äº•å¸‚','',0,667);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090006','222406','å’Œé¾™å¸‚','',0,668);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090007','222424','æ±ªæ¸…å¿','',0,669);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000700090008','222426','å®‰å›¾å¿','',0,670);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010008','230000','é»‘é¾™æ±Ÿçœ','',0,671);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080001','230100','å“ˆå°”æ»¨å¸‚','',0,672);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010001','230102','é“é‡ŒåŒº','',0,673);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010002','230103','å—å²—åŒº','',0,674);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010003','230104','é“å¤–åŒº','',0,675);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010004','230106','é¦™åŠåŒº','',0,676);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010005','230107','åŠ¨åŠ›åŒº','',0,677);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010006','230108','å¹³æˆ¿åŒº','',0,678);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010007','230109','æ¾åŒ—åŒº','',0,679);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010008','230111','å‘¼å…°åŒº','',0,680);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010009','230123','ä¾å…°å¿','',0,681);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010010','230124','æ–¹æ­£å¿','',0,682);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010011','230125','å®¾å¿','',0,683);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010012','230126','å·´å½¦å¿','',0,684);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010013','230127','æœ¨å…°å¿','',0,685);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010014','230128','é€šæ²³å¿','',0,686);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010015','230129','å»¶å¯¿å¿','',0,687);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010016','230181','é˜¿åŸå¸‚','',0,688);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010017','230182','åŒåŸå¸‚','',0,689);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010018','230183','å°šå¿—å¸‚','',0,690);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010019','230184','äº”å¸¸å¸‚','',0,691);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800010020','230185','é˜¿åŸå¸‚','',0,692);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080002','230200','é½é½å“ˆå°”å¸‚','',0,693);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020001','230202','é¾™æ²™åŒº','',0,694);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020002','230203','å»ºååŒº','',0,695);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020003','230204','é“é”‹åŒº','',0,696);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020004','230205','æ˜‚æ˜‚æºªåŒº','',0,697);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020005','230206','å¯Œæ‹‰å°”åŸºåŒº','',0,698);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020006','230207','ç¢¾å­å±±åŒº','',0,699);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020007','230208','æ¢…é‡Œæ–¯è¾¾æ–¡å°”æ—åŒº','',0,700);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020008','230221','é¾™æ±Ÿå¿','',0,701);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020009','230223','ä¾å®‰å¿','',0,702);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020010','230224','æ³°æ¥å¿','',0,703);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020011','230225','ç”˜å—å¿','',0,704);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020012','230227','å¯Œè£•å¿','',0,705);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020013','230229','å…‹å±±å¿','',0,706);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020014','230230','å…‹ä¸œå¿','',0,707);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020015','230231','æ‹œæ³‰å¿','',0,708);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800020016','230281','è®·æ²³å¸‚','',0,709);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080003','230300','é¸¡è¥¿å¸‚','',0,710);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030001','230302','é¸¡å† åŒº','',0,711);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030002','230303','æ’å±±åŒº','',0,712);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030003','230304','æ»´é“åŒº','',0,713);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030004','230305','æ¢¨æ ‘åŒº','',0,714);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030005','230306','åŸå­æ²³åŒº','',0,715);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030006','230307','éº»å±±åŒº','',0,716);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030007','230321','é¸¡ä¸œå¿','',0,717);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030008','230381','è™æ—å¸‚','',0,718);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800030009','230382','å¯†å±±å¸‚','',0,719);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080004','230400','é¹¤å²—å¸‚','',0,720);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040001','230402','å‘é˜³åŒº','',0,721);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040002','230403','å·¥å†œåŒº','',0,722);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040003','230404','å—å±±åŒº','',0,723);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040004','230405','å…´å®‰åŒº','',0,724);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040005','230406','ä¸œå±±åŒº','',0,725);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040006','230407','å…´å±±åŒº','',0,726);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040007','230421','èåŒ—å¿','',0,727);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800040008','230422','ç»¥æ»¨å¿','',0,728);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080005','230500','åŒé¸­å±±å¸‚','',0,729);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050001','230502','å°–å±±åŒº','',0,730);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050002','230503','å²­ä¸œåŒº','',0,731);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050003','230505','å››æ–¹å°åŒº','',0,732);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050004','230506','å®å±±åŒº','',0,733);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050005','230521','é›†è´¤å¿','',0,734);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050006','230522','å‹è°Šå¿','',0,735);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050007','230523','å®æ¸…å¿','',0,736);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800050008','230524','é¥¶æ²³å¿','',0,737);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080006','230600','å¤§åº†å¸‚','',0,738);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060001','230602','è¨å°”å›¾åŒº','',0,739);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060002','230603','é¾™å‡¤åŒº','',0,740);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060003','230604','è®©èƒ¡è·¯åŒº','',0,741);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060004','230605','çº¢å²—åŒº','',0,742);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060005','230606','å¤§åŒåŒº','',0,743);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060006','230621','è‚‡å·å¿','',0,744);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060007','230622','è‚‡æºå¿','',0,745);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060008','230623','æ—ç”¸å¿','',0,746);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800060009','230624','æœå°”ä¼¯ç‰¹è’™å¤æ—è‡ªæ²»å¿','',0,747);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080007','230700','ä¼Šæ˜¥å¸‚','',0,748);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070001','230702','ä¼Šæ˜¥åŒº','',0,749);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070002','230703','å—å²”åŒº','',0,750);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070003','230704','å‹å¥½åŒº','',0,751);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070004','230705','è¥¿æ—åŒº','',0,752);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070005','230706','ç¿ å³¦åŒº','',0,753);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070006','230707','æ–°é’åŒº','',0,754);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070007','230708','ç¾æºªåŒº','',0,755);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070008','230709','é‡‘å±±å±¯åŒº','',0,756);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070009','230710','äº”è¥åŒº','',0,757);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070010','230711','ä¹Œé©¬æ²³åŒº','',0,758);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070011','230712','æ±¤æ—ºæ²³åŒº','',0,759);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070012','230713','å¸¦å²­åŒº','',0,760);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070013','230714','ä¹Œä¼Šå²­åŒº','',0,761);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070014','230715','çº¢æ˜ŸåŒº','',0,762);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070015','230716','ä¸Šç”˜å²­åŒº','',0,763);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070016','230722','å˜‰è«å¿','',0,764);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800070017','230781','é“åŠ›å¸‚','',0,765);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080008','230800','ä½³æœ¨æ–¯å¸‚','',0,766);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080001','230802','æ°¸çº¢åŒº','',0,767);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080002','230803','å‘é˜³åŒº','',0,768);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080003','230804','å‰è¿›åŒº','',0,769);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080004','230805','ä¸œé£åŒº','',0,770);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080005','230811','éƒŠåŒº','',0,771);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080006','230822','æ¡¦å—å¿','',0,772);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080007','230826','æ¡¦å·å¿','',0,773);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080008','230828','æ±¤åŸå¿','',0,774);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080009','230833','æŠšè¿œå¿','',0,775);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080010','230881','åŒæ±Ÿå¸‚','',0,776);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800080011','230882','å¯Œé”¦å¸‚','',0,777);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080009','230900','ä¸ƒå°æ²³å¸‚','',0,778);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800090001','230902','æ–°å…´åŒº','',0,779);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800090002','230903','æ¡ƒå±±åŒº','',0,780);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800090003','230904','èŒ„å­æ²³åŒº','',0,781);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800090004','230921','å‹ƒåˆ©å¿','',0,782);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080010','231000','ç‰¡ä¸¹æ±Ÿå¸‚','',0,783);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100001','231002','ä¸œå®‰åŒº','',0,784);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100002','231003','é˜³æ˜åŒº','',0,785);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100003','231004','çˆ±æ°‘åŒº','',0,786);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100004','231005','è¥¿å®‰åŒº','',0,787);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100005','231024','ä¸œå®å¿','',0,788);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100006','231025','æ—å£å¿','',0,789);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100007','231081','ç»¥èŠ¬æ²³å¸‚','',0,790);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100008','231083','æµ·æ—å¸‚','',0,791);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100009','231084','å®å®‰å¸‚','',0,792);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800100010','231085','ç©†æ£±å¸‚','',0,793);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080011','231100','é»‘æ²³å¸‚','',0,794);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110001','231102','çˆ±è¾‰åŒº','',0,795);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110002','231121','å«©æ±Ÿå¿','',0,796);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110003','231123','é€Šå…‹å¿','',0,797);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110004','231124','å­™å´å¿','',0,798);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110005','231181','åŒ—å®‰å¸‚','',0,799);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800110006','231182','äº”å¤§è¿æ± å¸‚','',0,800);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080012','231200','ç»¥åŒ–å¸‚','',0,801);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120001','231202','åŒ—æ—åŒº','',0,802);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120002','231221','æœ›å¥å¿','',0,803);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120003','231222','å…°è¥¿å¿','',0,804);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120004','231223','é’å†ˆå¿','',0,805);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120005','231224','åº†å®‰å¿','',0,806);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120006','231225','æ˜æ°´å¿','',0,807);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120007','231226','ç»¥æ£±å¿','',0,808);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120008','231281','å®‰è¾¾å¸‚','',0,809);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120009','231282','è‚‡ä¸œå¸‚','',0,810);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800120010','231283','æµ·ä¼¦å¸‚','',0,811);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100080013','232700','å¤§å…´å®‰å²­åœ°åŒº','',0,812);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800130001','232721','å‘¼ç›å¿','',0,813);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800130002','232722','å¡”æ²³å¿','',0,814);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800130003','232723','æ¼ æ²³å¿','',0,815);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000800130004','232724','åŠ æ ¼è¾¾å¥‡åŒº','',0,816);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010009','310000','ä¸Šæµ·','',0,817);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100090001','310100','ä¸Šæµ·å¸‚','',0,818);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010001','310101','é»„æµ¦åŒº','',0,819);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010002','310103','å¢æ¹¾åŒº','',0,820);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010003','310104','å¾æ±‡åŒº','',0,821);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010004','310105','é•¿å®åŒº','',0,822);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010005','310106','é™å®‰åŒº','',0,823);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010006','310107','æ™®é™€åŒº','',0,824);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010007','310108','é—¸åŒ—åŒº','',0,825);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010008','310109','è™¹å£åŒº','',0,826);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010009','310110','æ¨æµ¦åŒº','',0,827);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010010','310112','é—µè¡ŒåŒº','',0,828);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010011','310113','å®å±±åŒº','',0,829);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010012','310114','å˜‰å®šåŒº','',0,830);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010013','310115','æµ¦ä¸œæ–°åŒº','',0,831);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010014','310116','é‡‘å±±åŒº','',0,832);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010015','310117','æ¾æ±ŸåŒº','',0,833);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010016','310118','é’æµ¦åŒº','',0,834);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010017','310119','å—æ±‡åŒº','',0,835);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010018','310120','å¥‰è´¤åŒº','',0,836);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010019','310152','å·æ²™åŒº','',0,837);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001000900010020','310230','å´‡æ˜å¿','',0,838);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010010','320000','æ±Ÿè‹çœ','',0,839);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100001','320100','å—äº¬å¸‚','',0,840);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010001','320102','ç„æ­¦åŒº','',0,841);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010002','320103','ç™½ä¸‹åŒº','',0,842);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010003','320104','ç§¦æ·®åŒº','',0,843);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010004','320105','å»ºé‚ºåŒº','',0,844);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010005','320106','é¼“æ¥¼åŒº','',0,845);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010006','320107','ä¸‹å…³åŒº','',0,846);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010007','320111','æµ¦å£åŒº','',0,847);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010008','320113','æ –éœåŒº','',0,848);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010009','320114','é›¨èŠ±å°åŒº','',0,849);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010010','320115','æ±Ÿå®åŒº','',0,850);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010011','320116','å…­åˆåŒº','',0,851);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010012','320124','æº§æ°´å¿','',0,852);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000010013','320125','é«˜æ·³å¿','',0,853);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100002','320200','æ— é”¡å¸‚','',0,854);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020001','320202','å´‡å®‰åŒº','',0,855);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020002','320203','å—é•¿åŒº','',0,856);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020003','320204','åŒ—å¡˜åŒº','',0,857);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020004','320205','é”¡å±±åŒº','',0,858);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020005','320206','æƒ å±±åŒº','',0,859);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020006','320211','æ»¨æ¹–åŒº','',0,860);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020007','320281','æ±Ÿé˜´å¸‚','',0,861);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020008','320282','å®œå…´å¸‚','',0,862);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000020009','320296','æ–°åŒº','',0,863);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100003','320300','å¾å·å¸‚','',0,864);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030001','320302','é¼“æ¥¼åŒº','',0,865);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030002','320303','äº‘é¾™åŒº','',0,866);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030003','320304','ä¹é‡ŒåŒº','',0,867);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030004','320305','è´¾æ±ªåŒº','',0,868);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030005','320311','æ³‰å±±åŒº','',0,869);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030006','320321','ä¸°å¿','',0,870);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030007','320322','æ²›å¿','',0,871);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030008','320323','é“œå±±å¿','',0,872);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030009','320324','ç¢å®å¿','',0,873);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030010','320381','æ–°æ²‚å¸‚','',0,874);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000030011','320382','é‚³å·å¸‚','',0,875);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100004','320400','å¸¸å·å¸‚','',0,876);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040001','320402','å¤©å®åŒº','',0,877);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040002','320404','é’Ÿæ¥¼åŒº','',0,878);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040003','320405','æˆšå¢…å °åŒº','',0,879);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040004','320411','æ–°åŒ—åŒº','',0,880);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040005','320412','æ­¦è¿›åŒº','',0,881);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040006','320481','æº§é˜³å¸‚','',0,882);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000040007','320482','é‡‘å›å¸‚','',0,883);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100005','320500','è‹å·å¸‚','',0,884);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050001','320502','æ²§æµªåŒº','',0,885);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050002','320503','å¹³æ±ŸåŒº','',0,886);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050003','320504','é‡‘é˜ŠåŒº','',0,887);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050004','320505','è™ä¸˜åŒº','',0,888);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050005','320506','å´ä¸­åŒº','',0,889);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050006','320507','ç›¸åŸåŒº','',0,890);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050007','320581','å¸¸ç†Ÿå¸‚','',0,891);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050008','320582','å¼ å®¶æ¸¯å¸‚','',0,892);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050009','320583','æ˜†å±±å¸‚','',0,893);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050010','320584','å´æ±Ÿå¸‚','',0,894);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050011','320585','å¤ªä»“å¸‚','',0,895);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050012','320594','æ–°åŒº','',0,896);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000050013','320595','å›­åŒº','',0,897);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100006','320600','å—é€šå¸‚','',0,898);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060001','320602','å´‡å·åŒº','',0,899);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060002','320611','æ¸¯é—¸åŒº','',0,900);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060003','320612','é€šå·åŒº','',0,901);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060004','320621','æµ·å®‰å¿','',0,902);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060005','320623','å¦‚ä¸œå¿','',0,903);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060006','320681','å¯ä¸œå¸‚','',0,904);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060007','320682','å¦‚çš‹å¸‚','',0,905);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060008','320683','é€šå·å¸‚','',0,906);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060009','320684','æµ·é—¨å¸‚','',0,907);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000060010','320693','å¼€å‘åŒº','',0,908);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100007','320700','è¿äº‘æ¸¯å¸‚','',0,909);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070001','320703','è¿äº‘åŒº','',0,910);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070002','320705','æ–°æµ¦åŒº','',0,911);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070003','320706','æµ·å·åŒº','',0,912);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070004','320721','èµ£æ¦†å¿','',0,913);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070005','320722','ä¸œæµ·å¿','',0,914);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070006','320723','çŒäº‘å¿','',0,915);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000070007','320724','çŒå—å¿','',0,916);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100008','320800','æ·®å®‰å¸‚','',0,917);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080001','320802','æ¸…æ²³åŒº','',0,918);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080002','320803','æ¥šå·åŒº','',0,919);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080003','320804','æ·®é˜´åŒº','',0,920);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080004','320811','æ¸…æµ¦åŒº','',0,921);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080005','320826','æ¶Ÿæ°´å¿','',0,922);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080006','320829','æ´ªæ³½å¿','',0,923);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080007','320830','ç›±çœ™å¿','',0,924);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000080008','320831','é‡‘æ¹–å¿','',0,925);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100009','320900','ç›åŸå¸‚','',0,926);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090001','320902','äº­æ¹–åŒº','',0,927);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090002','320903','ç›éƒ½åŒº','',0,928);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090003','320921','å“æ°´å¿','',0,929);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090004','320922','æ»¨æµ·å¿','',0,930);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090005','320923','é˜œå®å¿','',0,931);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090006','320924','å°„é˜³å¿','',0,932);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090007','320925','å»ºæ¹–å¿','',0,933);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090008','320981','ä¸œå°å¸‚','',0,934);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000090009','320982','å¤§ä¸°å¸‚','',0,935);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100010','321000','æ‰¬å·å¸‚','',0,936);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100001','321002','å¹¿é™µåŒº','',0,937);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100002','321003','é‚—æ±ŸåŒº','',0,938);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100003','321011','ç»´æ‰¬åŒº','',0,939);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100004','321023','å®åº”å¿','',0,940);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100005','321081','ä»ªå¾å¸‚','',0,941);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100006','321084','é«˜é‚®å¸‚','',0,942);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100007','321088','æ±Ÿéƒ½å¸‚','',0,943);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000100008','321092','ç»æµå¼€å‘åŒº','',0,944);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100011','321100','é•‡æ±Ÿå¸‚','',0,945);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110001','321102','äº¬å£åŒº','',0,946);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110002','321111','æ¶¦å·åŒº','',0,947);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110003','321112','ä¸¹å¾’åŒº','',0,948);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110004','321181','ä¸¹é˜³å¸‚','',0,949);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110005','321182','æ‰¬ä¸­å¸‚','',0,950);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000110006','321183','å¥å®¹å¸‚','',0,951);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100012','321200','æ³°å·å¸‚','',0,952);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120001','321202','æµ·é™µåŒº','',0,953);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120002','321203','é«˜æ¸¯åŒº','',0,954);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120003','321281','å…´åŒ–å¸‚','',0,955);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120004','321282','é–æ±Ÿå¸‚','',0,956);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120005','321283','æ³°å…´å¸‚','',0,957);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000120006','321284','å§œå °å¸‚','',0,958);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100100013','321300','å®¿è¿å¸‚','',0,959);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000130001','321302','å®¿åŸåŒº','',0,960);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000130002','321311','å®¿è±«åŒº','',0,961);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000130003','321322','æ²­é˜³å¿','',0,962);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000130004','321323','æ³—é˜³å¿','',0,963);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001000130005','321324','æ³—æ´ªå¿','',0,964);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010011','330000','æµ™æ±Ÿçœ','',0,965);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110001','330100','æ­å·å¸‚','',0,966);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010001','330102','ä¸ŠåŸåŒº','',0,967);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010002','330103','ä¸‹åŸåŒº','',0,968);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010003','330104','æ±Ÿå¹²åŒº','',0,969);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010004','330105','æ‹±å¢…åŒº','',0,970);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010005','330106','è¥¿æ¹–åŒº','',0,971);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010006','330108','æ»¨æ±ŸåŒº','',0,972);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010007','330109','è§å±±åŒº','',0,973);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010008','330110','ä½™æ­åŒº','',0,974);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010009','330122','æ¡åºå¿','',0,975);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010010','330127','æ·³å®‰å¿','',0,976);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010011','330182','å»ºå¾·å¸‚','',0,977);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010012','330183','å¯Œé˜³å¸‚','',0,978);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100010013','330185','ä¸´å®‰å¸‚','',0,979);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110002','330200','å®æ³¢å¸‚','',0,980);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020001','330203','æµ·æ›™åŒº','',0,981);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020002','330204','æ±Ÿä¸œåŒº','',0,982);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020003','330205','æ±ŸåŒ—åŒº','',0,983);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020004','330206','åŒ—ä»‘åŒº','',0,984);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020005','330211','é•‡æµ·åŒº','',0,985);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020006','330212','é„å·åŒº','',0,986);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020007','330225','è±¡å±±å¿','',0,987);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020008','330226','å®æµ·å¿','',0,988);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020009','330281','ä½™å§šå¸‚','',0,989);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020010','330282','æ…ˆæºªå¸‚','',0,990);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100020011','330283','å¥‰åŒ–å¸‚','',0,991);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110003','330300','æ¸©å·å¸‚','',0,992);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030001','330302','é¹¿åŸåŒº','',0,993);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030002','330303','é¾™æ¹¾åŒº','',0,994);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030003','330304','ç“¯æµ·åŒº','',0,995);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030004','330322','æ´å¤´å¿','',0,996);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030005','330324','æ°¸å˜‰å¿','',0,997);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030006','330326','å¹³é˜³å¿','',0,998);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030007','330327','è‹å—å¿','',0,999);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030008','330328','æ–‡æˆå¿','',0,1000);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030009','330329','æ³°é¡ºå¿','',0,1001);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030010','330381','ç‘å®‰å¸‚','',0,1002);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100030011','330382','ä¹æ¸…å¸‚','',0,1003);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110004','330400','å˜‰å…´å¸‚','',0,1004);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040001','330402','å—æ¹–åŒº','',0,1005);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040002','330411','ç§€æ´²åŒº','',0,1006);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040003','330421','å˜‰å–„å¿','',0,1007);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040004','330424','æµ·ç›å¿','',0,1008);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040005','330481','æµ·å®å¸‚','',0,1009);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040006','330482','å¹³æ¹–å¸‚','',0,1010);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100040007','330483','æ¡ä¹¡å¸‚','',0,1011);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110005','330500','æ¹–å·å¸‚','',0,1012);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100050001','330502','å´å…´åŒº','',0,1013);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100050002','330503','å—æµ”åŒº','',0,1014);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100050003','330521','å¾·æ¸…å¿','',0,1015);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100050004','330522','é•¿å…´å¿','',0,1016);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100050005','330523','å®‰å‰å¿','',0,1017);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110006','330600','ç»å…´å¸‚','',0,1018);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060001','330602','è¶ŠåŸåŒº','',0,1019);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060002','330621','ç»å…´å¿','',0,1020);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060003','330624','æ–°æ˜Œå¿','',0,1021);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060004','330681','è¯¸æš¨å¸‚','',0,1022);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060005','330682','ä¸Šè™å¸‚','',0,1023);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100060006','330683','åµŠå·å¸‚','',0,1024);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110007','330700','é‡‘åå¸‚','',0,1025);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070001','330702','å©ºåŸåŒº','',0,1026);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070002','330703','é‡‘ä¸œåŒº','',0,1027);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070003','330723','æ­¦ä¹‰å¿','',0,1028);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070004','330726','æµ¦æ±Ÿå¿','',0,1029);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070005','330727','ç£å®‰å¿','',0,1030);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070006','330781','å…°æºªå¸‚','',0,1031);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070007','330782','ä¹‰ä¹Œå¸‚','',0,1032);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070008','330783','ä¸œé˜³å¸‚','',0,1033);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100070009','330784','æ°¸åº·å¸‚','',0,1034);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110008','330800','è¡¢å·å¸‚','',0,1035);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080001','330802','æŸ¯åŸåŒº','',0,1036);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080002','330803','è¡¢æ±ŸåŒº','',0,1037);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080003','330822','å¸¸å±±å¿','',0,1038);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080004','330824','å¼€åŒ–å¿','',0,1039);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080005','330825','é¾™æ¸¸å¿','',0,1040);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100080006','330881','æ±Ÿå±±å¸‚','',0,1041);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110009','330900','èˆŸå±±å¸‚','',0,1042);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100090001','330902','å®šæµ·åŒº','',0,1043);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100090002','330903','æ™®é™€åŒº','',0,1044);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100090003','330921','å²±å±±å¿','',0,1045);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100090004','330922','åµŠæ³—å¿','',0,1046);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110010','331000','å°å·å¸‚','',0,1047);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100001','331002','æ¤’æ±ŸåŒº','',0,1048);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100002','331003','é»„å²©åŒº','',0,1049);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100003','331004','è·¯æ¡¥åŒº','',0,1050);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100004','331021','ç‰ç¯å¿','',0,1051);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100005','331022','ä¸‰é—¨å¿','',0,1052);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100006','331023','å¤©å°å¿','',0,1053);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100007','331024','ä»™å±…å¿','',0,1054);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100008','331081','æ¸©å²­å¸‚','',0,1055);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100100009','331082','ä¸´æµ·å¸‚','',0,1056);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100110011','331100','ä¸½æ°´å¸‚','',0,1057);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110001','331102','è²éƒ½åŒº','',0,1058);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110002','331121','é’ç”°å¿','',0,1059);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110003','331122','ç¼™äº‘å¿','',0,1060);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110004','331123','é‚æ˜Œå¿','',0,1061);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110005','331124','æ¾é˜³å¿','',0,1062);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110006','331125','äº‘å’Œå¿','',0,1063);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110007','331126','åº†å…ƒå¿','',0,1064);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110008','331127','æ™¯å®ç•²æ—è‡ªæ²»å¿','',0,1065);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001100110009','331181','é¾™æ³‰å¸‚','',0,1066);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010012','340000','å®‰å¾½çœ','',0,1067);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120001','340100','åˆè‚¥å¸‚','',0,1068);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010001','340102','ç‘¶æµ·åŒº','',0,1069);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010002','340103','åºé˜³åŒº','',0,1070);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010003','340104','èœ€å±±åŒº','',0,1071);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010004','340111','åŒ…æ²³åŒº','',0,1072);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010005','340121','é•¿ä¸°å¿','',0,1073);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010006','340122','è‚¥ä¸œå¿','',0,1074);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010007','340123','è‚¥è¥¿å¿','',0,1075);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010008','340151','é«˜æ–°åŒº','',0,1076);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010009','340191','ä¸­åŒº','',0,1077);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010010','341400','å·¢æ¹–å¸‚','',0,1078);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010011','341402','å±…å·¢åŒº','',0,1079);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200010012','341421','åºæ±Ÿå¿','',0,1080);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120002','340200','èŠœæ¹–å¸‚','',0,1081);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020001','340202','é•œæ¹–åŒº','',0,1082);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020002','340203','å¼‹æ±ŸåŒº','',0,1083);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020003','340207','é¸ æ±ŸåŒº','',0,1084);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020004','340208','ä¸‰å±±åŒº','',0,1085);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020005','340221','èŠœæ¹–å¿','',0,1086);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020006','340222','ç¹æ˜Œå¿','',0,1087);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020007','340223','å—é™µå¿','',0,1088);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200020008','341422','æ— ä¸ºå¿','',0,1089);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120003','340300','èšŒåŸ å¸‚','',0,1090);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030001','340302','é¾™å­æ¹–åŒº','',0,1091);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030002','340303','èšŒå±±åŒº','',0,1092);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030003','340304','ç¦¹ä¼šåŒº','',0,1093);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030004','340311','æ·®ä¸ŠåŒº','',0,1094);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030005','340321','æ€€è¿œå¿','',0,1095);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030006','340322','äº”æ²³å¿','',0,1096);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200030007','340323','å›ºé•‡å¿','',0,1097);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120004','340400','æ·®å—å¸‚','',0,1098);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040001','340402','å¤§é€šåŒº','',0,1099);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040002','340403','ç”°å®¶åºµåŒº','',0,1100);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040003','340404','è°¢å®¶é›†åŒº','',0,1101);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040004','340405','å…«å…¬å±±åŒº','',0,1102);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040005','340406','æ½˜é›†åŒº','',0,1103);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200040006','340421','å‡¤å°å¿','',0,1104);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120005','340500','é©¬éå±±å¸‚','',0,1105);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050001','340502','é‡‘å®¶åº„åŒº','',0,1106);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050002','340503','èŠ±å±±åŒº','',0,1107);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050003','340504','é›¨å±±åŒº','',0,1108);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050004','340521','å½“æ¶‚å¿','',0,1109);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050005','341423','å«å±±å¿','',0,1110);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200050006','341424','å’Œå¿','',0,1111);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120006','340600','æ·®åŒ—å¸‚','',0,1112);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200060001','340602','æœé›†åŒº','',0,1113);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200060002','340603','ç›¸å±±åŒº','',0,1114);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200060003','340604','çƒˆå±±åŒº','',0,1115);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200060004','340621','æ¿‰æºªå¿','',0,1116);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120007','340700','é“œé™µå¸‚','',0,1117);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200070001','340702','é“œå®˜å±±åŒº','',0,1118);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200070002','340703','ç‹®å­å±±åŒº','',0,1119);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200070003','340711','éƒŠåŒº','',0,1120);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200070004','340721','é“œé™µå¿','',0,1121);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120008','340800','å®‰åº†å¸‚','',0,1122);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080001','340802','è¿æ±ŸåŒº','',0,1123);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080002','340803','å¤§è§‚åŒº','',0,1124);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080003','340811','å®œç§€åŒº','',0,1125);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080004','340822','æ€€å®å¿','',0,1126);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080005','340823','æé˜³å¿','',0,1127);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080006','340824','æ½œå±±å¿','',0,1128);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080007','340825','å¤ªæ¹–å¿','',0,1129);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080008','340826','å®¿æ¾å¿','',0,1130);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080009','340827','æœ›æ±Ÿå¿','',0,1131);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080010','340828','å²³è¥¿å¿','',0,1132);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200080011','340881','æ¡åŸå¸‚','',0,1133);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120009','341000','é»„å±±å¸‚','',0,1134);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090001','341002','å±¯æºªåŒº','',0,1135);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090002','341003','é»„å±±åŒº','',0,1136);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090003','341004','å¾½å·åŒº','',0,1137);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090004','341021','æ­™å¿','',0,1138);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090005','341022','ä¼‘å®å¿','',0,1139);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090006','341023','é»Ÿå¿','',0,1140);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200090007','341024','ç¥é—¨å¿','',0,1141);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120010','341100','æ»å·å¸‚','',0,1142);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100001','341102','ç…çŠåŒº','',0,1143);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100002','341103','å—è°¯åŒº','',0,1144);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100003','341122','æ¥å®‰å¿','',0,1145);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100004','341124','å…¨æ¤’å¿','',0,1146);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100005','341125','å®šè¿œå¿','',0,1147);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100006','341126','å‡¤é˜³å¿','',0,1148);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100007','341181','å¤©é•¿å¸‚','',0,1149);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200100008','341182','æ˜å…‰å¸‚','',0,1150);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120011','341200','é˜œé˜³å¸‚','',0,1151);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110001','341202','é¢å·åŒº','',0,1152);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110002','341203','é¢ä¸œåŒº','',0,1153);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110003','341204','é¢æ³‰åŒº','',0,1154);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110004','341221','ä¸´æ³‰å¿','',0,1155);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110005','341222','å¤ªå’Œå¿','',0,1156);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110006','341225','é˜œå—å¿','',0,1157);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110007','341226','é¢ä¸Šå¿','',0,1158);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200110008','341282','ç•Œé¦–å¸‚','',0,1159);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120012','341300','å®¿å·å¸‚','',0,1160);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200120001','341302','åŸ‡æ¡¥åŒº','',0,1161);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200120002','341321','ç €å±±å¿','',0,1162);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200120003','341322','è§å¿','',0,1163);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200120004','341323','çµç’§å¿','',0,1164);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200120005','341324','æ³—å¿','',0,1165);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120013','341500','å…­å®‰å¸‚','',0,1166);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130001','341502','é‡‘å®‰åŒº','',0,1167);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130002','341503','è£•å®‰åŒº','',0,1168);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130003','341521','å¯¿å¿','',0,1169);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130004','341522','éœé‚±å¿','',0,1170);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130005','341523','èˆ’åŸå¿','',0,1171);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130006','341524','é‡‘å¯¨å¿','',0,1172);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200130007','341525','éœå±±å¿','',0,1173);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120014','341600','äº³å·å¸‚','',0,1174);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200140001','341602','è°¯åŸåŒº','',0,1175);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200140002','341621','æ¶¡é˜³å¿','',0,1176);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200140003','341622','è’™åŸå¿','',0,1177);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200140004','341623','åˆ©è¾›å¿','',0,1178);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120015','341700','æ± å·å¸‚','',0,1179);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200150001','341702','è´µæ± åŒº','',0,1180);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200150002','341721','ä¸œè‡³å¿','',0,1181);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200150003','341722','çŸ³å°å¿','',0,1182);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200150004','341723','é’é˜³å¿','',0,1183);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100120016','341800','å®£åŸå¸‚','',0,1184);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160001','341802','å®£å·åŒº','',0,1185);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160002','341821','éƒæºªå¿','',0,1186);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160003','341822','å¹¿å¾·å¿','',0,1187);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160004','341823','æ³¾å¿','',0,1188);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160005','341824','ç»©æºªå¿','',0,1189);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160006','341825','æ—Œå¾·å¿','',0,1190);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001200160007','341881','å®å›½å¸‚','',0,1191);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010013','350000','ç¦å»ºçœ','',0,1192);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130001','350100','ç¦å·å¸‚','',0,1193);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010001','350102','é¼“æ¥¼åŒº','',0,1194);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010002','350103','å°æ±ŸåŒº','',0,1195);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010003','350104','ä»“å±±åŒº','',0,1196);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010004','350105','é©¬å°¾åŒº','',0,1197);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010005','350111','æ™‹å®‰åŒº','',0,1198);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010006','350121','é—½ä¾¯å¿','',0,1199);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010007','350122','è¿æ±Ÿå¿','',0,1200);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010008','350123','ç½—æºå¿','',0,1201);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010009','350124','é—½æ¸…å¿','',0,1202);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010010','350125','æ°¸æ³°å¿','',0,1203);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010011','350128','å¹³æ½­å¿','',0,1204);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010012','350181','ç¦æ¸…å¸‚','',0,1205);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300010013','350182','é•¿ä¹å¸‚','',0,1206);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130002','350200','å¦é—¨å¸‚','',0,1207);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020001','350203','æ€æ˜åŒº','',0,1208);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020002','350205','æµ·æ²§åŒº','',0,1209);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020003','350206','æ¹–é‡ŒåŒº','',0,1210);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020004','350211','é›†ç¾åŒº','',0,1211);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020005','350212','åŒå®‰åŒº','',0,1212);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300020006','350213','ç¿”å®‰åŒº','',0,1213);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130003','350300','è†ç”°å¸‚','',0,1214);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300030001','350302','åŸå¢åŒº','',0,1215);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300030002','350303','æ¶µæ±ŸåŒº','',0,1216);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300030003','350304','è”åŸåŒº','',0,1217);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300030004','350305','ç§€å±¿åŒº','',0,1218);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300030005','350322','ä»™æ¸¸å¿','',0,1219);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130004','350400','ä¸‰æ˜å¸‚','',0,1220);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040001','350402','æ¢…åˆ—åŒº','',0,1221);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040002','350403','ä¸‰å…ƒåŒº','',0,1222);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040003','350421','æ˜æºªå¿','',0,1223);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040004','350423','æ¸…æµå¿','',0,1224);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040005','350424','å®åŒ–å¿','',0,1225);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040006','350425','å¤§ç”°å¿','',0,1226);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040007','350426','å°¤æºªå¿','',0,1227);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040008','350427','æ²™å¿','',0,1228);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040009','350428','å°†ä¹å¿','',0,1229);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040010','350429','æ³°å®å¿','',0,1230);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040011','350430','å»ºå®å¿','',0,1231);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300040012','350481','æ°¸å®‰å¸‚','',0,1232);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130005','350500','æ³‰å·å¸‚','',0,1233);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050001','350502','é²¤åŸåŒº','',0,1234);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050002','350503','ä¸°æ³½åŒº','',0,1235);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050003','350504','æ´›æ±ŸåŒº','',0,1236);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050004','350505','æ³‰æ¸¯åŒº','',0,1237);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050005','350521','æƒ å®‰å¿','',0,1238);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050006','350524','å®‰æºªå¿','',0,1239);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050007','350525','æ°¸æ˜¥å¿','',0,1240);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050008','350526','å¾·åŒ–å¿','',0,1241);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050009','350527','é‡‘é—¨å¿','',0,1242);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050010','350581','çŸ³ç‹®å¸‚','',0,1243);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050011','350582','æ™‹æ±Ÿå¸‚','',0,1244);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300050012','350583','å—å®‰å¸‚','',0,1245);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130006','350600','æ¼³å·å¸‚','',0,1246);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060001','350602','èŠ—åŸåŒº','',0,1247);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060002','350603','é¾™æ–‡åŒº','',0,1248);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060003','350622','äº‘éœ„å¿','',0,1249);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060004','350623','æ¼³æµ¦å¿','',0,1250);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060005','350624','è¯å®‰å¿','',0,1251);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060006','350625','é•¿æ³°å¿','',0,1252);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060007','350626','ä¸œå±±å¿','',0,1253);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060008','350627','å—é–å¿','',0,1254);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060009','350628','å¹³å’Œå¿','',0,1255);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060010','350629','åå®‰å¿','',0,1256);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300060011','350681','é¾™æµ·å¸‚','',0,1257);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130007','350700','å—å¹³å¸‚','',0,1258);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070001','350702','å»¶å¹³åŒº','',0,1259);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070002','350721','é¡ºæ˜Œå¿','',0,1260);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070003','350722','æµ¦åŸå¿','',0,1261);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070004','350723','å…‰æ³½å¿','',0,1262);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070005','350724','æ¾æºªå¿','',0,1263);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070006','350725','æ”¿å’Œå¿','',0,1264);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070007','350781','é‚µæ­¦å¸‚','',0,1265);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070008','350782','æ­¦å¤·å±±å¸‚','',0,1266);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070009','350783','å»ºç“¯å¸‚','',0,1267);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300070010','350784','å»ºé˜³å¸‚','',0,1268);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130008','350800','é¾™å²©å¸‚','',0,1269);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080001','350802','æ–°ç½—åŒº','',0,1270);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080002','350821','é•¿æ±€å¿','',0,1271);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080003','350822','æ°¸å®šå¿','',0,1272);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080004','350823','ä¸Šæ­å¿','',0,1273);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080005','350824','æ­¦å¹³å¿','',0,1274);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080006','350825','è¿åŸå¿','',0,1275);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300080007','350881','æ¼³å¹³å¸‚','',0,1276);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100130009','350900','å®å¾·å¸‚','',0,1277);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090001','350902','è•‰åŸåŒº','',0,1278);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090002','350921','éœæµ¦å¿','',0,1279);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090003','350922','å¤ç”°å¿','',0,1280);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090004','350923','å±å—å¿','',0,1281);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090005','350924','å¯¿å®å¿','',0,1282);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090006','350925','å‘¨å®å¿','',0,1283);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090007','350926','æŸ˜è£å¿','',0,1284);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090008','350981','ç¦å®‰å¸‚','',0,1285);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001300090009','350982','ç¦é¼å¸‚','',0,1286);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010014','360000','æ±Ÿè¥¿çœ','',0,1287);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140001','360100','å—æ˜Œå¸‚','',0,1288);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010001','360102','ä¸œæ¹–åŒº','',0,1289);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010002','360103','è¥¿æ¹–åŒº','',0,1290);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010003','360104','é’äº‘è°±åŒº','',0,1291);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010004','360105','æ¹¾é‡ŒåŒº','',0,1292);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010005','360111','é’å±±æ¹–åŒº','',0,1293);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010006','360121','å—æ˜Œå¿','',0,1294);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010007','360122','æ–°å»ºå¿','',0,1295);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010008','360123','å®‰ä¹‰å¿','',0,1296);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010009','360124','è¿›è´¤å¿','',0,1297);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010010','360125','çº¢è°·æ»©æ–°åŒº','',0,1298);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010011','360126','ç»æµæŠ€æœ¯å¼€å‘åŒº','',0,1299);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400010012','360127','æ˜ŒåŒ—åŒº','',0,1300);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140002','360200','æ™¯å¾·é•‡å¸‚','',0,1301);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400020001','360202','æ˜Œæ±ŸåŒº','',0,1302);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400020002','360203','ç å±±åŒº','',0,1303);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400020003','360222','æµ®æ¢å¿','',0,1304);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400020004','360281','ä¹å¹³å¸‚','',0,1305);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140003','360300','èä¹¡å¸‚','',0,1306);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400030001','360302','å®‰æºåŒº','',0,1307);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400030002','360313','æ¹˜ä¸œåŒº','',0,1308);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400030003','360321','è²èŠ±å¿','',0,1309);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400030004','360322','ä¸Šæ —å¿','',0,1310);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400030005','360323','èŠ¦æºªå¿','',0,1311);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140004','360400','ä¹æ±Ÿå¸‚','',0,1312);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040001','360402','åºå±±åŒº','',0,1313);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040002','360403','æµ”é˜³åŒº','',0,1314);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040003','360421','ä¹æ±Ÿå¿','',0,1315);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040004','360423','æ­¦å®å¿','',0,1316);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040005','360424','ä¿®æ°´å¿','',0,1317);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040006','360425','æ°¸ä¿®å¿','',0,1318);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040007','360426','å¾·å®‰å¿','',0,1319);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040008','360427','æ˜Ÿå­å¿','',0,1320);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040009','360428','éƒ½æ˜Œå¿','',0,1321);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040010','360429','æ¹–å£å¿','',0,1322);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040011','360430','å½­æ³½å¿','',0,1323);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400040012','360481','ç‘æ˜Œå¸‚','',0,1324);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140005','360500','æ–°ä½™å¸‚','',0,1325);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400050001','360502','æ¸æ°´åŒº','',0,1326);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400050002','360521','åˆ†å®œå¿','',0,1327);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140006','360600','é¹°æ½­å¸‚','',0,1328);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400060001','360602','æœˆæ¹–åŒº','',0,1329);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400060002','360622','ä½™æ±Ÿå¿','',0,1330);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400060003','360681','è´µæºªå¸‚','',0,1331);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140007','360700','èµ£å·å¸‚','',0,1332);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070001','360702','ç« è´¡åŒº','',0,1333);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070002','360721','èµ£å¿','',0,1334);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070003','360722','ä¿¡ä¸°å¿','',0,1335);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070004','360723','å¤§ä½™å¿','',0,1336);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070005','360724','ä¸ŠçŠ¹å¿','',0,1337);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070006','360725','å´‡ä¹‰å¿','',0,1338);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070007','360726','å®‰è¿œå¿','',0,1339);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070008','360727','é¾™å—å¿','',0,1340);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070009','360728','å®šå—å¿','',0,1341);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070010','360729','å…¨å—å¿','',0,1342);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070011','360730','å®éƒ½å¿','',0,1343);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070012','360731','äºéƒ½å¿','',0,1344);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070013','360732','å…´å›½å¿','',0,1345);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070014','360733','ä¼šæ˜Œå¿','',0,1346);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070015','360734','å¯»ä¹Œå¿','',0,1347);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070016','360735','çŸ³åŸå¿','',0,1348);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070017','360751','é»„é‡‘åŒº','',0,1349);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070018','360781','ç‘é‡‘å¸‚','',0,1350);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400070019','360782','å—åº·å¸‚','',0,1351);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140008','360800','å‰å®‰å¸‚','',0,1352);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080001','360802','å‰å·åŒº','',0,1353);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080002','360803','é’åŸåŒº','',0,1354);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080003','360821','å‰å®‰å¿','',0,1355);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080004','360822','å‰æ°´å¿','',0,1356);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080005','360823','å³¡æ±Ÿå¿','',0,1357);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080006','360824','æ–°å¹²å¿','',0,1358);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080007','360825','æ°¸ä¸°å¿','',0,1359);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080008','360826','æ³°å’Œå¿','',0,1360);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080009','360827','é‚å·å¿','',0,1361);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080010','360828','ä¸‡å®‰å¿','',0,1362);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080011','360829','å®‰ç¦å¿','',0,1363);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080012','360830','æ°¸æ–°å¿','',0,1364);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400080013','360881','äº•å†ˆå±±å¸‚','',0,1365);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140009','360900','å®œæ˜¥å¸‚','',0,1366);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090001','360902','è¢å·åŒº','',0,1367);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090002','360921','å¥‰æ–°å¿','',0,1368);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090003','360922','ä¸‡è½½å¿','',0,1369);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090004','360923','ä¸Šé«˜å¿','',0,1370);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090005','360924','å®œä¸°å¿','',0,1371);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090006','360925','é–å®‰å¿','',0,1372);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090007','360926','é“œé¼“å¿','',0,1373);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090008','360981','ä¸°åŸå¸‚','',0,1374);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090009','360982','æ¨Ÿæ ‘å¸‚','',0,1375);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400090010','360983','é«˜å®‰å¸‚','',0,1376);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140010','361000','æŠšå·å¸‚','',0,1377);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100001','361002','ä¸´å·åŒº','',0,1378);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100002','361021','å—åŸå¿','',0,1379);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100003','361022','é»å·å¿','',0,1380);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100004','361023','å—ä¸°å¿','',0,1381);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100005','361024','å´‡ä»å¿','',0,1382);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100006','361025','ä¹å®‰å¿','',0,1383);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100007','361026','å®œé»„å¿','',0,1384);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100008','361027','é‡‘æºªå¿','',0,1385);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100009','361028','èµ„æºªå¿','',0,1386);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100010','361029','ä¸œä¹¡å¿','',0,1387);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400100011','361030','å¹¿æ˜Œå¿','',0,1388);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100140011','361100','ä¸Šé¥¶å¸‚','',0,1389);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110001','361102','ä¿¡å·åŒº','',0,1390);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110002','361121','ä¸Šé¥¶å¿','',0,1391);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110003','361122','å¹¿ä¸°å¿','',0,1392);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110004','361123','ç‰å±±å¿','',0,1393);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110005','361124','é“…å±±å¿','',0,1394);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110006','361125','æ¨ªå³°å¿','',0,1395);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110007','361126','å¼‹é˜³å¿','',0,1396);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110008','361127','ä½™å¹²å¿','',0,1397);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110009','361128','é„±é˜³å¿','',0,1398);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110010','361129','ä¸‡å¹´å¿','',0,1399);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110011','361130','å©ºæºå¿','',0,1400);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001400110012','361181','å¾·å…´å¸‚','',0,1401);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010015','370000','å±±ä¸œçœ','',0,1402);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150001','370100','æµå—å¸‚','',0,1403);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010001','370102','å†ä¸‹åŒº','',0,1404);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010002','370103','å¸‚ä¸­åŒº','',0,1405);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010003','370104','æ§è«åŒº','',0,1406);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010004','370105','å¤©æ¡¥åŒº','',0,1407);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010005','370112','å†åŸåŒº','',0,1408);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010006','370113','é•¿æ¸…åŒº','',0,1409);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010007','370124','å¹³é˜´å¿','',0,1410);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010008','370125','æµé˜³å¿','',0,1411);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010009','370126','å•†æ²³å¿','',0,1412);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500010010','370181','ç« ä¸˜å¸‚','',0,1413);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150002','370200','é’å²›å¸‚','',0,1414);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020001','370202','å¸‚å—åŒº','',0,1415);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020002','370203','å¸‚åŒ—åŒº','',0,1416);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020003','370205','å››æ–¹åŒº','',0,1417);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020004','370211','é»„å²›åŒº','',0,1418);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020005','370212','å´‚å±±åŒº','',0,1419);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020006','370213','ææ²§åŒº','',0,1420);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020007','370214','åŸé˜³åŒº','',0,1421);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020008','370251','å¼€å‘åŒº','',0,1422);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020009','370281','èƒ¶å·å¸‚','',0,1423);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020010','370282','å³å¢¨å¸‚','',0,1424);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020011','370283','å¹³åº¦å¸‚','',0,1425);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020012','370284','èƒ¶å—å¸‚','',0,1426);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500020013','370285','è±è¥¿å¸‚','',0,1427);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150003','370300','æ·„åšå¸‚','',0,1428);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030001','370302','æ·„å·åŒº','',0,1429);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030002','370303','å¼ åº—åŒº','',0,1430);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030003','370304','åšå±±åŒº','',0,1431);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030004','370305','ä¸´æ·„åŒº','',0,1432);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030005','370306','å‘¨æ‘åŒº','',0,1433);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030006','370321','æ¡“å°å¿','',0,1434);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030007','370322','é«˜é’å¿','',0,1435);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500030008','370323','æ²‚æºå¿','',0,1436);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150004','370400','æ£åº„å¸‚','',0,1437);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040001','370402','å¸‚ä¸­åŒº','',0,1438);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040002','370403','è–›åŸåŒº','',0,1439);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040003','370404','å³„åŸåŒº','',0,1440);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040004','370405','å°å„¿åº„åŒº','',0,1441);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040005','370406','å±±äº­åŒº','',0,1442);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500040006','370481','æ»•å·å¸‚','',0,1443);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150005','370500','ä¸œè¥å¸‚','',0,1444);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050001','370502','ä¸œè¥åŒº','',0,1445);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050002','370503','æ²³å£åŒº','',0,1446);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050003','370521','å¦åˆ©å¿','',0,1447);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050004','370522','åˆ©æ´¥å¿','',0,1448);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050005','370523','å¹¿é¥¶å¿','',0,1449);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050006','370589','è¥¿åŸåŒº','',0,1450);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500050007','370590','ä¸œåŸåŒº','',0,1451);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150006','370600','çƒŸå°å¸‚','',0,1452);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060001','370602','èŠç½˜åŒº','',0,1453);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060002','370611','ç¦å±±åŒº','',0,1454);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060003','370612','ç‰Ÿå¹³åŒº','',0,1455);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060004','370613','è±å±±åŒº','',0,1456);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060005','370634','é•¿å²›å¿','',0,1457);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060006','370681','é¾™å£å¸‚','',0,1458);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060007','370682','è±é˜³å¸‚','',0,1459);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060008','370683','è±å·å¸‚','',0,1460);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060009','370684','è“¬è±å¸‚','',0,1461);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060010','370685','æ‹›è¿œå¸‚','',0,1462);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060011','370686','æ –éœå¸‚','',0,1463);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500060012','370687','æµ·é˜³å¸‚','',0,1464);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150007','370700','æ½åŠå¸‚','',0,1465);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070001','370702','æ½åŸåŒº','',0,1466);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070002','370703','å¯’äº­åŒº','',0,1467);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070003','370704','åŠå­åŒº','',0,1468);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070004','370705','å¥æ–‡åŒº','',0,1469);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070005','370724','ä¸´æœå¿','',0,1470);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070006','370725','æ˜Œä¹å¿','',0,1471);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070007','370751','å¼€å‘åŒº','',0,1472);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070008','370781','é’å·å¸‚','',0,1473);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070009','370782','è¯¸åŸå¸‚','',0,1474);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070010','370783','å¯¿å…‰å¸‚','',0,1475);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070011','370784','å®‰ä¸˜å¸‚','',0,1476);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070012','370785','é«˜å¯†å¸‚','',0,1477);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500070013','370786','æ˜Œé‚‘å¸‚','',0,1478);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150008','370800','æµå®å¸‚','',0,1479);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080001','370802','å¸‚ä¸­åŒº','',0,1480);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080002','370811','ä»»åŸåŒº','',0,1481);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080003','370826','å¾®å±±å¿','',0,1482);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080004','370827','é±¼å°å¿','',0,1483);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080005','370828','é‡‘ä¹¡å¿','',0,1484);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080006','370829','å˜‰ç¥¥å¿','',0,1485);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080007','370830','æ±¶ä¸Šå¿','',0,1486);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080008','370831','æ³—æ°´å¿','',0,1487);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080009','370832','æ¢å±±å¿','',0,1488);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080010','370881','æ›²é˜œå¸‚','',0,1489);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080011','370882','å…–å·å¸‚','',0,1490);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500080012','370883','é‚¹åŸå¸‚','',0,1491);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150009','370900','æ³°å®‰å¸‚','',0,1492);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090001','370902','æ³°å±±åŒº','',0,1493);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090002','370903','å²±å²³åŒº','',0,1494);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090003','370921','å®é˜³å¿','',0,1495);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090004','370923','ä¸œå¹³å¿','',0,1496);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090005','370982','æ–°æ³°å¸‚','',0,1497);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500090006','370983','è‚¥åŸå¸‚','',0,1498);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150010','371000','å¨æµ·å¸‚','',0,1499);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500100001','371002','ç¯ç¿ åŒº','',0,1500);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500100002','371081','æ–‡ç™»å¸‚','',0,1501);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500100003','371082','è£æˆå¸‚','',0,1502);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500100004','371083','ä¹³å±±å¸‚','',0,1503);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150011','371100','æ—¥ç…§å¸‚','',0,1504);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500110001','371102','ä¸œæ¸¯åŒº','',0,1505);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500110002','371103','å²šå±±åŒº','',0,1506);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500110003','371121','äº”è²å¿','',0,1507);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500110004','371122','è’å¿','',0,1508);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150012','371200','è±èŠœå¸‚','',0,1509);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500120001','371202','è±åŸåŒº','',0,1510);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500120002','371203','é’¢åŸåŒº','',0,1511);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150013','371300','ä¸´æ²‚å¸‚','',0,1512);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130001','371302','å…°å±±åŒº','',0,1513);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130002','371311','ç½—åº„åŒº','',0,1514);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130003','371312','æ²³ä¸œåŒº','',0,1515);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130004','371321','æ²‚å—å¿','',0,1516);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130005','371322','éƒ¯åŸå¿','',0,1517);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130006','371323','æ²‚æ°´å¿','',0,1518);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130007','371324','è‹å±±å¿','',0,1519);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130008','371325','è´¹å¿','',0,1520);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130009','371326','å¹³é‚‘å¿','',0,1521);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130010','371327','è’å—å¿','',0,1522);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130011','371328','è’™é˜´å¿','',0,1523);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500130012','371329','ä¸´æ²­å¿','',0,1524);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150014','371400','å¾·å·å¸‚','',0,1525);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140001','371402','å¾·åŸåŒº','',0,1526);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140002','371421','é™µå¿','',0,1527);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140003','371422','å®æ´¥å¿','',0,1528);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140004','371423','åº†äº‘å¿','',0,1529);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140005','371424','ä¸´é‚‘å¿','',0,1530);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140006','371425','é½æ²³å¿','',0,1531);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140007','371426','å¹³åŸå¿','',0,1532);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140008','371427','å¤æ´¥å¿','',0,1533);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140009','371428','æ­¦åŸå¿','',0,1534);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140010','371451','å¼€å‘åŒº','',0,1535);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140011','371481','ä¹é™µå¸‚','',0,1536);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500140012','371482','ç¦¹åŸå¸‚','',0,1537);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150015','371500','èŠåŸå¸‚','',0,1538);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150001','371502','ä¸œæ˜ŒåºœåŒº','',0,1539);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150002','371521','é˜³è°·å¿','',0,1540);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150003','371522','è˜å¿','',0,1541);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150004','371523','èŒŒå¹³å¿','',0,1542);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150005','371524','ä¸œé˜¿å¿','',0,1543);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150006','371525','å† å¿','',0,1544);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150007','371526','é«˜å”å¿','',0,1545);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500150008','371581','ä¸´æ¸…å¸‚','',0,1546);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150016','371600','æ»¨å·å¸‚','',0,1547);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160001','371602','æ»¨åŸåŒº','',0,1548);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160002','371621','æƒ æ°‘å¿','',0,1549);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160003','371622','é˜³ä¿¡å¿','',0,1550);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160004','371623','æ— æ££å¿','',0,1551);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160005','371624','æ²¾åŒ–å¿','',0,1552);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160006','371625','åšå…´å¿','',0,1553);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500160007','371626','é‚¹å¹³å¿','',0,1554);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100150017','371700','èæ³½å¸‚','',0,1555);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170001','371702','ç‰¡ä¸¹åŒº','',0,1556);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170002','371721','æ›¹å¿','',0,1557);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170003','371722','å•å¿','',0,1558);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170004','371723','æˆæ­¦å¿','',0,1559);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170005','371724','å·¨é‡å¿','',0,1560);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170006','371725','éƒ“åŸå¿','',0,1561);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170007','371726','é„„åŸå¿','',0,1562);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170008','371727','å®šé™¶å¿','',0,1563);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001500170009','371728','ä¸œæ˜å¿','',0,1564);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010016','410000','æ²³å—çœ','',0,1565);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160001','410100','éƒ‘å·å¸‚','',0,1566);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010001','410102','ä¸­åŸåŒº','',0,1567);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010002','410103','äºŒä¸ƒåŒº','',0,1568);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010003','410104','ç®¡åŸå›æ—åŒº','',0,1569);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010004','410105','é‡‘æ°´åŒº','',0,1570);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010005','410106','ä¸Šè¡—åŒº','',0,1571);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010006','410108','æƒ æµåŒº','',0,1572);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010007','410122','ä¸­ç‰Ÿå¿','',0,1573);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010008','410181','å·©ä¹‰å¸‚','',0,1574);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010009','410182','è¥é˜³å¸‚','',0,1575);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010010','410183','æ–°å¯†å¸‚','',0,1576);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010011','410184','æ–°éƒ‘å¸‚','',0,1577);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010012','410185','ç™»å°å¸‚','',0,1578);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010013','410186','éƒ‘ä¸œæ–°åŒº','',0,1579);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600010014','410187','é«˜æ–°åŒº','',0,1580);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160002','410200','å¼€å°å¸‚','',0,1581);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020001','410202','é¾™äº­åŒº','',0,1582);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020002','410203','é¡ºæ²³å›æ—åŒº','',0,1583);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020003','410204','é¼“æ¥¼åŒº','',0,1584);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020004','410205','ç¦¹ç‹å°åŒº','',0,1585);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020005','410211','é‡‘æ˜åŒº','',0,1586);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020006','410221','æå¿','',0,1587);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020007','410222','é€šè®¸å¿','',0,1588);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020008','410223','å°‰æ°å¿','',0,1589);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020009','410224','å¼€å°å¿','',0,1590);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600020010','410225','å…°è€ƒå¿','',0,1591);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160003','410300','æ´›é˜³å¸‚','',0,1592);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030001','410302','è€åŸåŒº','',0,1593);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030002','410303','è¥¿å·¥åŒº','',0,1594);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030003','410304','å»›æ²³å›æ—åŒº','',0,1595);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030004','410305','æ¶§è¥¿åŒº','',0,1596);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030005','410306','å‰åˆ©åŒº','',0,1597);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030006','410307','æ´›é¾™åŒº','',0,1598);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030007','410322','å­Ÿæ´¥å¿','',0,1599);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030008','410323','æ–°å®‰å¿','',0,1600);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030009','410324','æ ¾å·å¿','',0,1601);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030010','410325','åµ©å¿','',0,1602);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030011','410326','æ±é˜³å¿','',0,1603);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030012','410327','å®œé˜³å¿','',0,1604);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030013','410328','æ´›å®å¿','',0,1605);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030014','410329','ä¼Šå·å¿','',0,1606);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030015','410381','åƒå¸ˆå¸‚','',0,1607);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600030016','471004','é«˜æ–°åŒº','',0,1608);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160004','410400','å¹³é¡¶å±±å¸‚','',0,1609);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040001','410402','æ–°ååŒº','',0,1610);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040002','410403','å«ä¸œåŒº','',0,1611);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040003','410404','çŸ³é¾™åŒº','',0,1612);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040004','410411','æ¹›æ²³åŒº','',0,1613);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040005','410421','å®ä¸°å¿','',0,1614);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040006','410422','å¶å¿','',0,1615);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040007','410423','é²å±±å¿','',0,1616);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040008','410425','éƒå¿','',0,1617);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040009','410481','èˆé’¢å¸‚','',0,1618);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600040010','410482','æ±å·å¸‚','',0,1619);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160005','410500','å®‰é˜³å¸‚','',0,1620);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050001','410502','æ–‡å³°åŒº','',0,1621);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050002','410503','åŒ—å…³åŒº','',0,1622);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050003','410505','æ®·éƒ½åŒº','',0,1623);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050004','410506','é¾™å®‰åŒº','',0,1624);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050005','410522','å®‰é˜³å¿','',0,1625);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050006','410523','æ±¤é˜´å¿','',0,1626);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050007','410526','æ»‘å¿','',0,1627);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050008','410527','å†…é»„å¿','',0,1628);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600050009','410581','æ—å·å¸‚','',0,1629);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160006','410600','é¹¤å£å¸‚','',0,1630);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600060001','410602','é¹¤å±±åŒº','',0,1631);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600060002','410603','å±±åŸåŒº','',0,1632);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600060003','410611','æ·‡æ»¨åŒº','',0,1633);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600060004','410621','æµšå¿','',0,1634);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600060005','410622','æ·‡å¿','',0,1635);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160007','410700','æ–°ä¹¡å¸‚','',0,1636);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070001','410702','çº¢æ——åŒº','',0,1637);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070002','410703','å«æ»¨åŒº','',0,1638);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070003','410704','å‡¤æ³‰åŒº','',0,1639);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070004','410711','ç‰§é‡åŒº','',0,1640);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070005','410721','æ–°ä¹¡å¿','',0,1641);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070006','410724','è·å˜‰å¿','',0,1642);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070007','410725','åŸé˜³å¿','',0,1643);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070008','410726','å»¶æ´¥å¿','',0,1644);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070009','410727','å°ä¸˜å¿','',0,1645);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070010','410728','é•¿å£å¿','',0,1646);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070011','410781','å«è¾‰å¸‚','',0,1647);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600070012','410782','è¾‰å¿å¸‚','',0,1648);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160008','410800','ç„¦ä½œå¸‚','',0,1649);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080001','410802','è§£æ”¾åŒº','',0,1650);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080002','410803','ä¸­ç«™åŒº','',0,1651);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080003','410804','é©¬æ‘åŒº','',0,1652);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080004','410811','å±±é˜³åŒº','',0,1653);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080005','410821','ä¿®æ­¦å¿','',0,1654);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080006','410822','åšçˆ±å¿','',0,1655);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080007','410823','æ­¦é™Ÿå¿','',0,1656);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080008','410825','æ¸©å¿','',0,1657);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080009','410882','æ²é˜³å¸‚','',0,1658);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600080010','410883','å­Ÿå·å¸‚','',0,1659);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160009','410881','æµæºå¸‚','',0,1660);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160010','410900','æ¿®é˜³å¸‚','',0,1661);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100001','410902','åé¾™åŒº','',0,1662);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100002','410922','æ¸…ä¸°å¿','',0,1663);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100003','410923','å—ä¹å¿','',0,1664);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100004','410926','èŒƒå¿','',0,1665);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100005','410927','å°å‰å¿','',0,1666);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600100006','410928','æ¿®é˜³å¿','',0,1667);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160011','411000','è®¸æ˜Œå¸‚','',0,1668);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110001','411002','é­éƒ½åŒº','',0,1669);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110002','411023','è®¸æ˜Œå¿','',0,1670);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110003','411024','é„¢é™µå¿','',0,1671);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110004','411025','è¥„åŸå¿','',0,1672);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110005','411081','ç¦¹å·å¸‚','',0,1673);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600110006','411082','é•¿è‘›å¸‚','',0,1674);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160012','411100','æ¼¯æ²³å¸‚','',0,1675);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600120001','411102','æºæ±‡åŒº','',0,1676);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600120002','411103','éƒ¾åŸåŒº','',0,1677);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600120003','411104','å¬é™µåŒº','',0,1678);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600120004','411121','èˆé˜³å¿','',0,1679);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600120005','411122','ä¸´é¢å¿','',0,1680);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160013','411200','ä¸‰é—¨å³¡å¸‚','',0,1681);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130001','411202','æ¹–æ»¨åŒº','',0,1682);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130002','411221','æ¸‘æ± å¿','',0,1683);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130003','411222','é™•å¿','',0,1684);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130004','411224','å¢æ°å¿','',0,1685);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130005','411281','ä¹‰é©¬å¸‚','',0,1686);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600130006','411282','çµå®å¸‚','',0,1687);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160014','411300','å—é˜³å¸‚','',0,1688);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140001','411302','å®›åŸåŒº','',0,1689);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140002','411303','å§é¾™åŒº','',0,1690);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140003','411321','å—å¬å¿','',0,1691);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140004','411322','æ–¹åŸå¿','',0,1692);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140005','411323','è¥¿å³¡å¿','',0,1693);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140006','411324','é•‡å¹³å¿','',0,1694);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140007','411325','å†…ä¹¡å¿','',0,1695);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140008','411326','æ·…å·å¿','',0,1696);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140009','411327','ç¤¾æ——å¿','',0,1697);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140010','411328','å”æ²³å¿','',0,1698);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140011','411329','æ–°é‡å¿','',0,1699);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140012','411330','æ¡æŸå¿','',0,1700);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600140013','411381','é‚“å·å¸‚','',0,1701);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160015','411400','å•†ä¸˜å¸‚','',0,1702);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150001','411402','æ¢å›­åŒº','',0,1703);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150002','411403','ç¢é˜³åŒº','',0,1704);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150003','411421','æ°‘æƒå¿','',0,1705);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150004','411422','ç¢å¿','',0,1706);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150005','411423','å®é™µå¿','',0,1707);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150006','411424','æŸ˜åŸå¿','',0,1708);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150007','411425','è™åŸå¿','',0,1709);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150008','411426','å¤é‚‘å¿','',0,1710);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600150009','411481','æ°¸åŸå¸‚','',0,1711);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160016','411500','ä¿¡é˜³å¸‚','',0,1712);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160001','411502','æµ‰æ²³åŒº','',0,1713);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160002','411503','å¹³æ¡¥åŒº','',0,1714);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160003','411521','ç½—å±±å¿','',0,1715);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160004','411522','å…‰å±±å¿','',0,1716);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160005','411523','æ–°å¿','',0,1717);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160006','411524','å•†åŸå¿','',0,1718);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160007','411525','å›ºå§‹å¿','',0,1719);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160008','411526','æ½¢å·å¿','',0,1720);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160009','411527','æ·®æ»¨å¿','',0,1721);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600160010','411528','æ¯å¿','',0,1722);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160017','411600','å‘¨å£å¸‚','',0,1723);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170001','411602','å·æ±‡åŒº','',0,1724);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170002','411621','æ‰¶æ²Ÿå¿','',0,1725);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170003','411622','è¥¿åå¿','',0,1726);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170004','411623','å•†æ°´å¿','',0,1727);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170005','411624','æ²ˆä¸˜å¿','',0,1728);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170006','411625','éƒ¸åŸå¿','',0,1729);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170007','411626','æ·®é˜³å¿','',0,1730);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170008','411627','å¤ªåº·å¿','',0,1731);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170009','411628','é¹¿é‚‘å¿','',0,1732);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600170010','411681','é¡¹åŸå¸‚','',0,1733);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100160018','411700','é©»é©¬åº—å¸‚','',0,1734);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180001','411702','é©¿åŸåŒº','',0,1735);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180002','411721','è¥¿å¹³å¿','',0,1736);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180003','411722','ä¸Šè”¡å¿','',0,1737);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180004','411723','å¹³èˆ†å¿','',0,1738);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180005','411724','æ­£é˜³å¿','',0,1739);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180006','411725','ç¡®å±±å¿','',0,1740);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180007','411726','æ³Œé˜³å¿','',0,1741);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180008','411727','æ±å—å¿','',0,1742);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180009','411728','é‚å¹³å¿','',0,1743);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001600180010','411729','æ–°è”¡å¿','',0,1744);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010017','420000','æ¹–åŒ—çœ','',0,1745);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170001','420100','æ­¦æ±‰å¸‚','',0,1746);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010001','420102','æ±Ÿå²¸åŒº','',0,1747);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010002','420103','æ±Ÿæ±‰åŒº','',0,1748);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010003','420104','ç¡šå£åŒº','',0,1749);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010004','420105','æ±‰é˜³åŒº','',0,1750);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010005','420106','æ­¦æ˜ŒåŒº','',0,1751);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010006','420107','é’å±±åŒº','',0,1752);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010007','420111','æ´ªå±±åŒº','',0,1753);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010008','420112','ä¸œè¥¿æ¹–åŒº','',0,1754);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010009','420113','æ±‰å—åŒº','',0,1755);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010010','420114','è”¡ç”¸åŒº','',0,1756);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010011','420115','æ±Ÿå¤åŒº','',0,1757);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010012','420116','é»„é™‚åŒº','',0,1758);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700010013','420117','æ–°æ´²åŒº','',0,1759);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170002','420200','é»„çŸ³å¸‚','',0,1760);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020001','420202','é»„çŸ³æ¸¯åŒº','',0,1761);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020002','420203','è¥¿å¡å±±åŒº','',0,1762);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020003','420204','ä¸‹é™†åŒº','',0,1763);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020004','420205','é“å±±åŒº','',0,1764);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020005','420222','é˜³æ–°å¿','',0,1765);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700020006','420281','å¤§å†¶å¸‚','',0,1766);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170003','420300','åå °å¸‚','',0,1767);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030001','420302','èŒ…ç®­åŒº','',0,1768);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030002','420303','å¼ æ¹¾åŒº','',0,1769);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030003','420321','éƒ§å¿','',0,1770);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030004','420322','éƒ§è¥¿å¿','',0,1771);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030005','420323','ç«¹å±±å¿','',0,1772);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030006','420324','ç«¹æºªå¿','',0,1773);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030007','420325','æˆ¿å¿','',0,1774);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030008','420381','ä¸¹æ±Ÿå£å¸‚','',0,1775);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700030009','420382','åŸåŒº','',0,1776);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170004','420500','å®œæ˜Œå¸‚','',0,1777);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040001','420502','è¥¿é™µåŒº','',0,1778);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040002','420503','ä¼å®¶å²—åŒº','',0,1779);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040003','420504','ç‚¹å†›åŒº','',0,1780);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040004','420505','çŒ‡äº­åŒº','',0,1781);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040005','420506','å¤·é™µåŒº','',0,1782);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040006','420525','è¿œå®‰å¿','',0,1783);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040007','420526','å…´å±±å¿','',0,1784);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040008','420527','ç§­å½’å¿','',0,1785);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040009','420528','é•¿é˜³åœŸå®¶æ—è‡ªæ²»å¿','',0,1786);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040010','420529','äº”å³°åœŸå®¶æ—è‡ªæ²»å¿','',0,1787);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040011','420551','è‘›æ´²ååŒº','',0,1788);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040012','420552','å¼€å‘åŒº','',0,1789);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040013','420581','å®œéƒ½å¸‚','',0,1790);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040014','420582','å½“é˜³å¸‚','',0,1791);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700040015','420583','ææ±Ÿå¸‚','',0,1792);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170005','420600','è¥„é˜³å¸‚','',0,1793);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050001','420602','è¥„åŸåŒº','',0,1794);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050002','420606','æ¨ŠåŸåŒº','',0,1795);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050003','420607','è¥„å·åŒº','',0,1796);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050004','420624','å—æ¼³å¿','',0,1797);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050005','420625','è°·åŸå¿','',0,1798);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050006','420626','ä¿åº·å¿','',0,1799);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050007','420682','è€æ²³å£å¸‚','',0,1800);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050008','420683','æ£é˜³å¸‚','',0,1801);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700050009','420684','å®œåŸå¸‚','',0,1802);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170006','420700','é„‚å·å¸‚','',0,1803);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700060001','420702','æ¢å­æ¹–åŒº','',0,1804);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700060002','420703','åå®¹åŒº','',0,1805);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700060003','420704','é„‚åŸåŒº','',0,1806);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170007','420800','è†é—¨å¸‚','',0,1807);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700070001','420802','ä¸œå®åŒº','',0,1808);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700070002','420804','æ‡åˆ€åŒº','',0,1809);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700070003','420821','äº¬å±±å¿','',0,1810);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700070004','420822','æ²™æ´‹å¿','',0,1811);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700070005','420881','é’Ÿç¥¥å¸‚','',0,1812);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170008','420900','å­æ„Ÿå¸‚','',0,1813);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080001','420902','å­å—åŒº','',0,1814);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080002','420921','å­æ˜Œå¿','',0,1815);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080003','420922','å¤§æ‚Ÿå¿','',0,1816);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080004','420923','äº‘æ¢¦å¿','',0,1817);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080005','420981','åº”åŸå¸‚','',0,1818);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080006','420982','å®‰é™†å¸‚','',0,1819);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700080007','420984','æ±‰å·å¸‚','',0,1820);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170009','421000','è†å·å¸‚','',0,1821);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090001','421002','æ²™å¸‚åŒº','',0,1822);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090002','421003','è†å·åŒº','',0,1823);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090003','421022','å…¬å®‰å¿','',0,1824);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090004','421023','ç›‘åˆ©å¿','',0,1825);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090005','421024','æ±Ÿé™µå¿','',0,1826);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090006','421081','çŸ³é¦–å¸‚','',0,1827);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090007','421083','æ´ªæ¹–å¸‚','',0,1828);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700090008','421087','æ¾æ»‹å¸‚','',0,1829);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170010','421100','é»„å†ˆå¸‚','',0,1830);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100001','421102','é»„å·åŒº','',0,1831);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100002','421121','å›¢é£å¿','',0,1832);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100003','421122','çº¢å®‰å¿','',0,1833);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100004','421123','ç½—ç”°å¿','',0,1834);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100005','421124','è‹±å±±å¿','',0,1835);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100006','421125','æµ æ°´å¿','',0,1836);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100007','421126','è•²æ˜¥å¿','',0,1837);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100008','421127','é»„æ¢…å¿','',0,1838);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100009','421181','éº»åŸå¸‚','',0,1839);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700100010','421182','æ­¦ç©´å¸‚','',0,1840);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170011','421200','å’¸å®å¸‚','',0,1841);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110001','421202','å’¸å®‰åŒº','',0,1842);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110002','421221','å˜‰é±¼å¿','',0,1843);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110003','421222','é€šåŸå¿','',0,1844);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110004','421223','å´‡é˜³å¿','',0,1845);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110005','421224','é€šå±±å¿','',0,1846);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110006','421281','èµ¤å£å¸‚','',0,1847);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700110007','421282','æ¸©æ³‰åŸåŒº','',0,1848);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170012','421300','éšå·å¸‚','',0,1849);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700120001','421302','æ›¾éƒ½åŒº','',0,1850);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700120002','421321','éšå¿','',0,1851);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700120003','421381','å¹¿æ°´å¸‚','',0,1852);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170013','422800','æ©æ–½åœŸå®¶æ—è‹—æ—è‡ªæ²»å·','',0,1853);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130001','422801','æ©æ–½å¸‚','',0,1854);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130002','422802','åˆ©å·å¸‚','',0,1855);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130003','422822','å»ºå§‹å¿','',0,1856);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130004','422823','å·´ä¸œå¿','',0,1857);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130005','422825','å®£æ©å¿','',0,1858);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130006','422826','å’¸ä¸°å¿','',0,1859);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130007','422827','æ¥å‡¤å¿','',0,1860);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001700130008','422828','é¹¤å³°å¿','',0,1861);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170014','429004','ä»™æ¡ƒå¸‚','',0,1862);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170015','429005','æ½œæ±Ÿå¸‚','',0,1863);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170016','429006','å¤©é—¨å¸‚','',0,1864);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100170017','429021','ç¥å†œæ¶æ—åŒº','',0,1865);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010018','430000','æ¹–å—çœ','',0,1866);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180001','430100','é•¿æ²™å¸‚','',0,1867);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010001','430102','èŠ™è“‰åŒº','',0,1868);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010002','430103','å¤©å¿ƒåŒº','',0,1869);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010003','430104','å²³éº“åŒº','',0,1870);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010004','430105','å¼€ç¦åŒº','',0,1871);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010005','430111','é›¨èŠ±åŒº','',0,1872);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010006','430121','é•¿æ²™å¿','',0,1873);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010007','430122','æœ›åŸå¿','',0,1874);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010008','430124','å®ä¹¡å¿','',0,1875);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800010009','430181','æµé˜³å¸‚','',0,1876);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180002','430200','æ ªæ´²å¸‚','',0,1877);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020001','430202','è·å¡˜åŒº','',0,1878);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020002','430203','èŠ¦æ·åŒº','',0,1879);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020003','430204','çŸ³å³°åŒº','',0,1880);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020004','430211','å¤©å…ƒåŒº','',0,1881);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020005','430221','æ ªæ´²å¿','',0,1882);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020006','430223','æ”¸å¿','',0,1883);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020007','430224','èŒ¶é™µå¿','',0,1884);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020008','430225','ç‚é™µå¿','',0,1885);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800020009','430281','é†´é™µå¸‚','',0,1886);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180003','430300','æ¹˜æ½­å¸‚','',0,1887);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800030001','430302','é›¨æ¹–åŒº','',0,1888);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800030002','430304','å²³å¡˜åŒº','',0,1889);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800030003','430321','æ¹˜æ½­å¿','',0,1890);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800030004','430381','æ¹˜ä¹¡å¸‚','',0,1891);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800030005','430382','éŸ¶å±±å¸‚','',0,1892);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180004','430400','è¡¡é˜³å¸‚','',0,1893);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040001','430405','ç æ™–åŒº','',0,1894);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040002','430406','é›å³°åŒº','',0,1895);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040003','430407','çŸ³é¼“åŒº','',0,1896);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040004','430408','è’¸æ¹˜åŒº','',0,1897);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040005','430412','å—å²³åŒº','',0,1898);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040006','430421','è¡¡é˜³å¿','',0,1899);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040007','430422','è¡¡å—å¿','',0,1900);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040008','430423','è¡¡å±±å¿','',0,1901);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040009','430424','è¡¡ä¸œå¿','',0,1902);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040010','430426','ç¥ä¸œå¿','',0,1903);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040011','430481','è€’é˜³å¸‚','',0,1904);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800040012','430482','å¸¸å®å¸‚','',0,1905);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180005','430500','é‚µé˜³å¸‚','',0,1906);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050001','430502','åŒæ¸…åŒº','',0,1907);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050002','430503','å¤§ç¥¥åŒº','',0,1908);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050003','430511','åŒ—å¡”åŒº','',0,1909);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050004','430521','é‚µä¸œå¿','',0,1910);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050005','430522','æ–°é‚µå¿','',0,1911);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050006','430523','é‚µé˜³å¿','',0,1912);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050007','430524','éš†å›å¿','',0,1913);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050008','430525','æ´å£å¿','',0,1914);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050009','430527','ç»¥å®å¿','',0,1915);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050010','430528','æ–°å®å¿','',0,1916);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050011','430529','åŸæ­¥è‹—æ—è‡ªæ²»å¿','',0,1917);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800050012','430581','æ­¦å†ˆå¸‚','',0,1918);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180006','430600','å²³é˜³å¸‚','',0,1919);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060001','430602','å²³é˜³æ¥¼åŒº','',0,1920);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060002','430603','äº‘æºªåŒº','',0,1921);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060003','430611','å›å±±åŒº','',0,1922);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060004','430621','å²³é˜³å¿','',0,1923);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060005','430623','åå®¹å¿','',0,1924);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060006','430624','æ¹˜é˜´å¿','',0,1925);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060007','430626','å¹³æ±Ÿå¿','',0,1926);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060008','430681','æ±¨ç½—å¸‚','',0,1927);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800060009','430682','ä¸´æ¹˜å¸‚','',0,1928);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180007','430700','å¸¸å¾·å¸‚','',0,1929);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070001','430702','æ­¦é™µåŒº','',0,1930);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070002','430703','é¼åŸåŒº','',0,1931);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070003','430721','å®‰ä¹¡å¿','',0,1932);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070004','430722','æ±‰å¯¿å¿','',0,1933);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070005','430723','æ¾§å¿','',0,1934);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070006','430724','ä¸´æ¾§å¿','',0,1935);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070007','430725','æ¡ƒæºå¿','',0,1936);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070008','430726','çŸ³é—¨å¿','',0,1937);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800070009','430781','æ´¥å¸‚å¸‚','',0,1938);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180008','430800','å¼ å®¶ç•Œå¸‚','',0,1939);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800080001','430802','æ°¸å®šåŒº','',0,1940);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800080002','430811','æ­¦é™µæºåŒº','',0,1941);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800080003','430821','æ…ˆåˆ©å¿','',0,1942);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800080004','430822','æ¡‘æ¤å¿','',0,1943);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180009','430900','ç›Šé˜³å¸‚','',0,1944);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090001','430902','èµ„é˜³åŒº','',0,1945);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090002','430903','èµ«å±±åŒº','',0,1946);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090003','430921','å—å¿','',0,1947);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090004','430922','æ¡ƒæ±Ÿå¿','',0,1948);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090005','430923','å®‰åŒ–å¿','',0,1949);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800090006','430981','æ²…æ±Ÿå¸‚','',0,1950);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180010','431000','éƒ´å·å¸‚','',0,1951);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100001','431002','åŒ—æ¹–åŒº','',0,1952);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100002','431003','è‹ä»™åŒº','',0,1953);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100003','431021','æ¡‚é˜³å¿','',0,1954);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100004','431022','å®œç« å¿','',0,1955);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100005','431023','æ°¸å…´å¿','',0,1956);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100006','431024','å˜‰ç¦¾å¿','',0,1957);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100007','431025','ä¸´æ­¦å¿','',0,1958);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100008','431026','æ±åŸå¿','',0,1959);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100009','431027','æ¡‚ä¸œå¿','',0,1960);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100010','431028','å®‰ä»å¿','',0,1961);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800100011','431081','èµ„å…´å¸‚','',0,1962);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180011','431100','æ°¸å·å¸‚','',0,1963);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110001','431102','é›¶é™µåŒº','',0,1964);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110002','431103','å†·æ°´æ»©åŒº','',0,1965);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110003','431121','ç¥é˜³å¿','',0,1966);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110004','431122','ä¸œå®‰å¿','',0,1967);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110005','431123','åŒç‰Œå¿','',0,1968);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110006','431124','é“å¿','',0,1969);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110007','431125','æ±Ÿæ°¸å¿','',0,1970);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110008','431126','å®è¿œå¿','',0,1971);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110009','431127','è“å±±å¿','',0,1972);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110010','431128','æ–°ç”°å¿','',0,1973);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800110011','431129','æ±Ÿåç‘¶æ—è‡ªæ²»å¿','',0,1974);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180012','431200','æ€€åŒ–å¸‚','',0,1975);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120001','431202','é¹¤åŸåŒº','',0,1976);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120002','431221','ä¸­æ–¹å¿','',0,1977);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120003','431222','æ²…é™µå¿','',0,1978);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120004','431223','è¾°æºªå¿','',0,1979);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120005','431224','æº†æµ¦å¿','',0,1980);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120006','431225','ä¼šåŒå¿','',0,1981);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120007','431226','éº»é˜³è‹—æ—è‡ªæ²»å¿','',0,1982);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120008','431227','æ–°æ™ƒä¾—æ—è‡ªæ²»å¿','',0,1983);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120009','431228','èŠ·æ±Ÿä¾—æ—è‡ªæ²»å¿','',0,1984);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120010','431229','é–å·è‹—æ—ä¾—æ—è‡ªæ²»å¿','',0,1985);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120011','431230','é€šé“ä¾—æ—è‡ªæ²»å¿','',0,1986);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800120012','431281','æ´ªæ±Ÿå¸‚','',0,1987);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180013','431300','å¨„åº•å¸‚','',0,1988);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800130001','431302','å¨„æ˜ŸåŒº','',0,1989);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800130002','431321','åŒå³°å¿','',0,1990);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800130003','431322','æ–°åŒ–å¿','',0,1991);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800130004','431381','å†·æ°´æ±Ÿå¸‚','',0,1992);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800130005','431382','æ¶Ÿæºå¸‚','',0,1993);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100180014','433100','æ¹˜è¥¿åœŸå®¶æ—è‹—æ—è‡ªæ²»å·','',0,1994);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140001','433101','å‰é¦–å¸‚','',0,1995);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140002','433122','æ³¸æºªå¿','',0,1996);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140003','433123','å‡¤å‡°å¿','',0,1997);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140004','433124','èŠ±å£å¿','',0,1998);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140005','433125','ä¿é–å¿','',0,1999);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140006','433126','å¤ä¸ˆå¿','',0,2000);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140007','433127','æ°¸é¡ºå¿','',0,2001);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001800140008','433130','é¾™å±±å¿','',0,2002);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010019','440000','å¹¿ä¸œçœ','',0,2003);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190001','440100','å¹¿å·å¸‚','',0,2004);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010001','440103','è”æ¹¾åŒº','',0,2005);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010002','440104','è¶Šç§€åŒº','',0,2006);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010003','440105','æµ·ç åŒº','',0,2007);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010004','440106','å¤©æ²³åŒº','',0,2008);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010005','440111','ç™½äº‘åŒº','',0,2009);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010006','440112','é»„åŸ”åŒº','',0,2010);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010007','440113','ç•ªç¦ºåŒº','',0,2011);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010008','440114','èŠ±éƒ½åŒº','',0,2012);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010009','440115','å—æ²™åŒº','',0,2013);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010010','440116','èå²—åŒº','',0,2014);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010011','440183','å¢åŸå¸‚','',0,2015);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010012','440184','ä»åŒ–å¸‚','',0,2016);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900010013','440188','ä¸œå±±åŒº','',0,2017);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190002','440200','éŸ¶å…³å¸‚','',0,2018);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020001','440203','æ­¦æ±ŸåŒº','',0,2019);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020002','440204','æµˆæ±ŸåŒº','',0,2020);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020003','440205','æ›²æ±ŸåŒº','',0,2021);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020004','440222','å§‹å…´å¿','',0,2022);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020005','440224','ä»åŒ–å¿','',0,2023);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020006','440229','ç¿æºå¿','',0,2024);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020007','440232','ä¹³æºç‘¶æ—è‡ªæ²»å¿','',0,2025);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020008','440233','æ–°ä¸°å¿','',0,2026);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020009','440281','ä¹æ˜Œå¸‚','',0,2027);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900020010','440282','å—é›„å¸‚','',0,2028);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190003','440300','æ·±åœ³å¸‚','',0,2029);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030001','440303','ç½—æ¹–åŒº','',0,2030);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030002','440304','ç¦ç”°åŒº','',0,2031);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030003','440305','å—å±±åŒº','',0,2032);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030004','440306','å®å®‰åŒº','',0,2033);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030005','440307','é¾™å²—åŒº','',0,2034);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030006','440308','ç›ç”°åŒº','',0,2035);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030007','440320','å…‰æ˜æ–°åŒº','',0,2036);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030008','440321','åªå±±æ–°åŒº','',0,2037);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030009','440322','å¤§é¹æ–°åŒº','',0,2038);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900030010','440323','é¾™åæ–°åŒº','',0,2039);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190004','440400','ç æµ·å¸‚','',0,2040);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900040001','440402','é¦™æ´²åŒº','',0,2041);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900040002','440403','æ–—é—¨åŒº','',0,2042);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900040003','440404','é‡‘æ¹¾åŒº','',0,2043);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900040004','440486','é‡‘å”åŒº','',0,2044);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900040005','440487','å—æ¹¾åŒº','',0,2045);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190005','440500','æ±•å¤´å¸‚','',0,2046);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050001','440507','é¾™æ¹–åŒº','',0,2047);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050002','440511','é‡‘å¹³åŒº','',0,2048);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050003','440512','æ¿ æ±ŸåŒº','',0,2049);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050004','440513','æ½®é˜³åŒº','',0,2050);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050005','440514','æ½®å—åŒº','',0,2051);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050006','440515','æ¾„æµ·åŒº','',0,2052);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900050007','440523','å—æ¾³å¿','',0,2053);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190006','440600','ä½›å±±å¸‚','',0,2054);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900060001','440604','ç¦…åŸåŒº','',0,2055);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900060002','440605','å—æµ·åŒº','',0,2056);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900060003','440606','é¡ºå¾·åŒº','',0,2057);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900060004','440607','ä¸‰æ°´åŒº','',0,2058);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900060005','440608','é«˜æ˜åŒº','',0,2059);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190007','440700','æ±Ÿé—¨å¸‚','',0,2060);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070001','440703','è“¬æ±ŸåŒº','',0,2061);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070002','440704','æ±Ÿæµ·åŒº','',0,2062);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070003','440705','æ–°ä¼šåŒº','',0,2063);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070004','440781','å°å±±å¸‚','',0,2064);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070005','440783','å¼€å¹³å¸‚','',0,2065);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070006','440784','é¹¤å±±å¸‚','',0,2066);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900070007','440785','æ©å¹³å¸‚','',0,2067);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190008','440800','æ¹›æ±Ÿå¸‚','',0,2068);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080001','440802','èµ¤ååŒº','',0,2069);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080002','440803','éœå±±åŒº','',0,2070);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080003','440804','å¡å¤´åŒº','',0,2071);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080004','440811','éº»ç« åŒº','',0,2072);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080005','440823','é‚æºªå¿','',0,2073);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080006','440825','å¾é—»å¿','',0,2074);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080007','440881','å»‰æ±Ÿå¸‚','',0,2075);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080008','440882','é›·å·å¸‚','',0,2076);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900080009','440883','å´å·å¸‚','',0,2077);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190009','440900','èŒ‚åå¸‚','',0,2078);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090001','440902','èŒ‚å—åŒº','',0,2079);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090002','440903','èŒ‚æ¸¯åŒº','',0,2080);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090003','440923','ç”µç™½å¿','',0,2081);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090004','440981','é«˜å·å¸‚','',0,2082);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090005','440982','åŒ–å·å¸‚','',0,2083);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900090006','440983','ä¿¡å®œå¸‚','',0,2084);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190010','441200','è‚‡åº†å¸‚','',0,2085);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100001','441202','ç«¯å·åŒº','',0,2086);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100002','441203','é¼æ¹–åŒº','',0,2087);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100003','441223','å¹¿å®å¿','',0,2088);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100004','441224','æ€€é›†å¿','',0,2089);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100005','441225','å°å¼€å¿','',0,2090);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100006','441226','å¾·åº†å¿','',0,2091);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100007','441283','é«˜è¦å¸‚','',0,2092);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900100008','441284','å››ä¼šå¸‚','',0,2093);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190011','441300','æƒ å·å¸‚','',0,2094);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900110001','441302','æƒ åŸåŒº','',0,2095);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900110002','441303','æƒ é˜³åŒº','',0,2096);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900110003','441322','åšç½—å¿','',0,2097);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900110004','441323','æƒ ä¸œå¿','',0,2098);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900110005','441324','é¾™é—¨å¿','',0,2099);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190012','441400','æ¢…å·å¸‚','',0,2100);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120001','441402','æ¢…æ±ŸåŒº','',0,2101);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120002','441421','æ¢…å¿','',0,2102);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120003','441422','å¤§åŸ”å¿','',0,2103);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120004','441423','ä¸°é¡ºå¿','',0,2104);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120005','441424','äº”åå¿','',0,2105);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120006','441426','å¹³è¿œå¿','',0,2106);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120007','441427','è•‰å²­å¿','',0,2107);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900120008','441481','å…´å®å¸‚','',0,2108);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190013','441500','æ±•å°¾å¸‚','',0,2109);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900130001','441502','åŸåŒº','',0,2110);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900130002','441521','æµ·ä¸°å¿','',0,2111);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900130003','441523','é™†æ²³å¿','',0,2112);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900130004','441581','é™†ä¸°å¸‚','',0,2113);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190014','441600','æ²³æºå¸‚','',0,2114);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140001','441602','æºåŸåŒº','',0,2115);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140002','441621','ç´«é‡‘å¿','',0,2116);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140003','441622','é¾™å·å¿','',0,2117);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140004','441623','è¿å¹³å¿','',0,2118);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140005','441624','å’Œå¹³å¿','',0,2119);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900140006','441625','ä¸œæºå¿','',0,2120);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190015','441700','é˜³æ±Ÿå¸‚','',0,2121);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900150001','441702','æ±ŸåŸåŒº','',0,2122);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900150002','441721','é˜³è¥¿å¿','',0,2123);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900150003','441723','é˜³ä¸œå¿','',0,2124);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900150004','441781','é˜³æ˜¥å¸‚','',0,2125);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190016','441800','æ¸…è¿œå¸‚','',0,2126);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160001','441802','æ¸…åŸåŒº','',0,2127);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160002','441821','ä½›å†ˆå¿','',0,2128);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160003','441823','é˜³å±±å¿','',0,2129);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160004','441825','è¿å±±å£®æ—ç‘¶æ—è‡ªæ²»å¿','',0,2130);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160005','441826','è¿å—ç‘¶æ—è‡ªæ²»å¿','',0,2131);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160006','441827','æ¸…æ–°å¿','',0,2132);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160007','441881','è‹±å¾·å¸‚','',0,2133);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900160008','441882','è¿å·å¸‚','',0,2134);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190017','441900','ä¸œèå¸‚','',0,2135);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190018','442000','ä¸­å±±å¸‚','',0,2136);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190019','445100','æ½®å·å¸‚','',0,2137);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900190001','445102','æ¹˜æ¡¥åŒº','',0,2138);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900190002','445121','æ½®å®‰å¿','',0,2139);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900190003','445122','é¥¶å¹³å¿','',0,2140);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900190004','445185','æ«æºªåŒº','',0,2141);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190020','445200','æ­é˜³å¸‚','',0,2142);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200001','445202','æ¦•åŸåŒº','',0,2143);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200002','445221','æ­ä¸œå¿','',0,2144);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200003','445222','æ­è¥¿å¿','',0,2145);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200004','445224','æƒ æ¥å¿','',0,2146);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200005','445281','æ™®å®å¸‚','',0,2147);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900200006','445284','ä¸œå±±åŒº','',0,2148);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100190021','445300','äº‘æµ®å¸‚','',0,2149);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900210001','445302','äº‘åŸåŒº','',0,2150);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900210002','445321','æ–°å…´å¿','',0,2151);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900210003','445322','éƒå—å¿','',0,2152);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900210004','445323','äº‘å®‰å¿','',0,2153);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001001900210005','445381','ç½—å®šå¸‚','',0,2154);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010020','450000','å¹¿è¥¿å£®æ—è‡ªæ²»åŒº','',0,2155);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200001','450100','å—å®å¸‚','',0,2156);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010001','450102','å…´å®åŒº','',0,2157);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010002','450103','é’ç§€åŒº','',0,2158);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010003','450105','æ±Ÿå—åŒº','',0,2159);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010004','450107','è¥¿ä¹¡å¡˜åŒº','',0,2160);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010005','450108','è‰¯åº†åŒº','',0,2161);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010006','450109','é‚•å®åŒº','',0,2162);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010007','450122','æ­¦é¸£å¿','',0,2163);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010008','450123','éš†å®‰å¿','',0,2164);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010009','450124','é©¬å±±å¿','',0,2165);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010010','450125','ä¸Šæ—å¿','',0,2166);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010011','450126','å®¾é˜³å¿','',0,2167);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000010012','450127','æ¨ªå¿','',0,2168);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200002','450200','æŸ³å·å¸‚','',0,2169);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020001','450202','åŸä¸­åŒº','',0,2170);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020002','450203','é±¼å³°åŒº','',0,2171);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020003','450204','æŸ³å—åŒº','',0,2172);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020004','450205','æŸ³åŒ—åŒº','',0,2173);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020005','450221','æŸ³æ±Ÿå¿','',0,2174);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020006','450222','æŸ³åŸå¿','',0,2175);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020007','450223','é¹¿å¯¨å¿','',0,2176);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020008','450224','èå®‰å¿','',0,2177);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020009','450225','èæ°´è‹—æ—è‡ªæ²»å¿','',0,2178);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000020010','450226','ä¸‰æ±Ÿä¾—æ—è‡ªæ²»å¿','',0,2179);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200003','450300','æ¡‚æ—å¸‚','',0,2180);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030001','450302','ç§€å³°åŒº','',0,2181);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030002','450303','å å½©åŒº','',0,2182);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030003','450304','è±¡å±±åŒº','',0,2183);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030004','450305','ä¸ƒæ˜ŸåŒº','',0,2184);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030005','450311','é›å±±åŒº','',0,2185);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030006','450321','é˜³æœ”å¿','',0,2186);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030007','450322','ä¸´æ¡‚å¿','',0,2187);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030008','450323','çµå·å¿','',0,2188);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030009','450324','å…¨å·å¿','',0,2189);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030010','450325','å…´å®‰å¿','',0,2190);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030011','450326','æ°¸ç¦å¿','',0,2191);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030012','450327','çŒé˜³å¿','',0,2192);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030013','450328','é¾™èƒœå„æ—è‡ªæ²»å¿','',0,2193);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030014','450329','èµ„æºå¿','',0,2194);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030015','450330','å¹³ä¹å¿','',0,2195);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030016','450331','è”æµ¦å¿','',0,2196);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000030017','450332','æ­åŸç‘¶æ—è‡ªæ²»å¿','',0,2197);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200004','450400','æ¢§å·å¸‚','',0,2198);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040001','450403','ä¸‡ç§€åŒº','',0,2199);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040002','450404','è¶å±±åŒº','',0,2200);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040003','450405','é•¿æ´²åŒº','',0,2201);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040004','450421','è‹æ¢§å¿','',0,2202);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040005','450422','è—¤å¿','',0,2203);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040006','450423','è’™å±±å¿','',0,2204);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000040007','450481','å²‘æºªå¸‚','',0,2205);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200005','450500','åŒ—æµ·å¸‚','',0,2206);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000050001','450502','æµ·åŸåŒº','',0,2207);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000050002','450503','é“¶æµ·åŒº','',0,2208);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000050003','450512','é“å±±æ¸¯åŒº','',0,2209);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000050004','450521','åˆæµ¦å¿','',0,2210);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200006','450600','é˜²åŸæ¸¯å¸‚','',0,2211);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000060001','450602','æ¸¯å£åŒº','',0,2212);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000060002','450603','é˜²åŸåŒº','',0,2213);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000060003','450621','ä¸Šæ€å¿','',0,2214);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000060004','450681','ä¸œå…´å¸‚','',0,2215);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200007','450700','é’¦å·å¸‚','',0,2216);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000070001','450702','é’¦å—åŒº','',0,2217);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000070002','450703','é’¦åŒ—åŒº','',0,2218);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000070003','450721','çµå±±å¿','',0,2219);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000070004','450722','æµ¦åŒ—å¿','',0,2220);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200008','450800','è´µæ¸¯å¸‚','',0,2221);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000080001','450802','æ¸¯åŒ—åŒº','',0,2222);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000080002','450803','æ¸¯å—åŒº','',0,2223);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000080003','450804','è¦ƒå¡˜åŒº','',0,2224);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000080004','450821','å¹³å—å¿','',0,2225);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000080005','450881','æ¡‚å¹³å¸‚','',0,2226);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200009','450900','ç‰æ—å¸‚','',0,2227);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090001','450902','ç‰å·åŒº','',0,2228);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090002','450921','å®¹å¿','',0,2229);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090003','450922','é™†å·å¿','',0,2230);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090004','450923','åšç™½å¿','',0,2231);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090005','450924','å…´ä¸šå¿','',0,2232);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000090006','450981','åŒ—æµå¸‚','',0,2233);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200010','451000','ç™¾è‰²å¸‚','',0,2234);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100001','451002','å³æ±ŸåŒº','',0,2235);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100002','451021','ç”°é˜³å¿','',0,2236);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100003','451022','ç”°ä¸œå¿','',0,2237);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100004','451023','å¹³æœå¿','',0,2238);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100005','451024','å¾·ä¿å¿','',0,2239);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100006','451025','é–è¥¿å¿','',0,2240);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100007','451026','é‚£å¡å¿','',0,2241);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100008','451027','å‡Œäº‘å¿','',0,2242);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100009','451028','ä¹ä¸šå¿','',0,2243);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100010','451029','ç”°æ—å¿','',0,2244);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100011','451030','è¥¿æ—å¿','',0,2245);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000100012','451031','éš†æ—å„æ—è‡ªæ²»å¿','',0,2246);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200011','451100','è´ºå·å¸‚','',0,2247);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000110001','451102','å…«æ­¥åŒº','',0,2248);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000110002','451121','æ˜­å¹³å¿','',0,2249);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000110003','451122','é’Ÿå±±å¿','',0,2250);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000110004','451123','å¯Œå·ç‘¶æ—è‡ªæ²»å¿','',0,2251);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200012','451200','æ²³æ± å¸‚','',0,2252);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120001','451202','é‡‘åŸæ±ŸåŒº','',0,2253);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120002','451221','å—ä¸¹å¿','',0,2254);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120003','451222','å¤©å³¨å¿','',0,2255);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120004','451223','å‡¤å±±å¿','',0,2256);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120005','451224','ä¸œå…°å¿','',0,2257);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120006','451225','ç½—åŸä»«ä½¬æ—è‡ªæ²»å¿','',0,2258);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120007','451226','ç¯æ±Ÿæ¯›å—æ—è‡ªæ²»å¿','',0,2259);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120008','451227','å·´é©¬ç‘¶æ—è‡ªæ²»å¿','',0,2260);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120009','451228','éƒ½å®‰ç‘¶æ—è‡ªæ²»å¿','',0,2261);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120010','451229','å¤§åŒ–ç‘¶æ—è‡ªæ²»å¿','',0,2262);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000120011','451281','å®œå·å¸‚','',0,2263);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200013','451300','æ¥å®¾å¸‚','',0,2264);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130001','451302','å…´å®¾åŒº','',0,2265);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130002','451321','å¿»åŸå¿','',0,2266);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130003','451322','è±¡å·å¿','',0,2267);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130004','451323','æ­¦å®£å¿','',0,2268);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130005','451324','é‡‘ç§€ç‘¶æ—è‡ªæ²»å¿','',0,2269);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000130006','451381','åˆå±±å¸‚','',0,2270);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100200014','451400','å´‡å·¦å¸‚','',0,2271);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140001','451402','æ±Ÿæ´²åŒº','',0,2272);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140002','451421','æ‰¶ç»¥å¿','',0,2273);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140003','451422','å®æ˜å¿','',0,2274);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140004','451423','é¾™å·å¿','',0,2275);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140005','451424','å¤§æ–°å¿','',0,2276);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140006','451425','å¤©ç­‰å¿','',0,2277);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002000140007','451481','å‡­ç¥¥å¸‚','',0,2278);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010021','460000','æµ·å—çœ','',0,2279);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210001','460100','æµ·å£å¸‚','',0,2280);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002100010001','460105','ç§€è‹±åŒº','',0,2281);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002100010002','460106','é¾™ååŒº','',0,2282);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002100010003','460107','ç¼å±±åŒº','',0,2283);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002100010004','460108','ç¾å…°åŒº','',0,2284);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210002','460200','ä¸‰äºšå¸‚','',0,2285);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210003','469001','äº”æŒ‡å±±å¸‚','',0,2286);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210004','469002','ç¼æµ·å¸‚','',0,2287);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210005','469003','å„‹å·å¸‚','',0,2288);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210006','469005','æ–‡æ˜Œå¸‚','',0,2289);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210007','469006','ä¸‡å®å¸‚','',0,2290);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210008','469007','ä¸œæ–¹å¸‚','',0,2291);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210009','469025','å®šå®‰å¿','',0,2292);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210010','469026','å±¯æ˜Œå¿','',0,2293);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210011','469027','æ¾„è¿ˆå¿','',0,2294);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210012','469028','ä¸´é«˜å¿','',0,2295);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210013','469030','ç™½æ²™é»æ—è‡ªæ²»å¿','',0,2296);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210014','469031','æ˜Œæ±Ÿé»æ—è‡ªæ²»å¿','',0,2297);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210015','469033','ä¹ä¸œé»æ—è‡ªæ²»å¿','',0,2298);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210016','469034','é™µæ°´é»æ—è‡ªæ²»å¿','',0,2299);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210017','469035','ä¿äº­é»æ—è‹—æ—è‡ªæ²»å¿','',0,2300);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210018','469036','ç¼ä¸­é»æ—è‹—æ—è‡ªæ²»å¿','',0,2301);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210019','469037','è¥¿æ²™ç¾¤å²›','',0,2302);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210020','469038','å—æ²™ç¾¤å²›','',0,2303);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100210021','469039','ä¸­æ²™ç¾¤å²›çš„å²›ç¤åŠå…¶æµ·åŸŸ','',0,2304);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010022','500000','é‡åº†','',0,2305);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100220001','500100','é‡åº†å¸‚','',0,2306);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010001','500101','ä¸‡å·åŒº','',0,2307);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010002','500102','æ¶ªé™µåŒº','',0,2308);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010003','500103','æ¸ä¸­åŒº','',0,2309);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010004','500104','å¤§æ¸¡å£åŒº','',0,2310);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010005','500105','æ±ŸåŒ—åŒº','',0,2311);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010006','500106','æ²™åªååŒº','',0,2312);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010007','500107','ä¹é¾™å¡åŒº','',0,2313);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010008','500108','å—å²¸åŒº','',0,2314);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010009','500109','åŒ—ç¢šåŒº','',0,2315);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010010','500110','ä¸‡ç››åŒº','',0,2316);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010011','500111','åŒæ¡¥åŒº','',0,2317);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010012','500112','æ¸åŒ—åŒº','',0,2318);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010013','500113','å·´å—åŒº','',0,2319);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010014','500114','é»”æ±ŸåŒº','',0,2320);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010015','500115','é•¿å¯¿åŒº','',0,2321);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010016','500222','ç¶¦æ±Ÿå¿','',0,2322);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010017','500223','æ½¼å—å¿','',0,2323);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010018','500224','é“œæ¢å¿','',0,2324);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010019','500225','å¤§è¶³å¿','',0,2325);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010020','500226','è£æ˜Œå¿','',0,2326);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010021','500227','ç’§å±±å¿','',0,2327);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010022','500228','æ¢å¹³å¿','',0,2328);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010023','500229','åŸå£å¿','',0,2329);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010024','500230','ä¸°éƒ½å¿','',0,2330);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010025','500231','å«æ±Ÿå¿','',0,2331);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010026','500232','æ­¦éš†å¿','',0,2332);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010027','500233','å¿ å¿','',0,2333);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010028','500234','å¼€å¿','',0,2334);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010029','500235','äº‘é˜³å¿','',0,2335);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010030','500236','å¥‰èŠ‚å¿','',0,2336);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010031','500237','å·«å±±å¿','',0,2337);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010032','500238','å·«æºªå¿','',0,2338);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010033','500240','çŸ³æŸ±åœŸå®¶æ—è‡ªæ²»å¿','',0,2339);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010034','500241','ç§€å±±åœŸå®¶æ—è‹—æ—è‡ªæ²»å¿','',0,2340);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010035','500242','é…‰é˜³åœŸå®¶æ—è‹—æ—è‡ªæ²»å¿','',0,2341);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010036','500243','å½­æ°´è‹—æ—åœŸå®¶æ—è‡ªæ²»å¿','',0,2342);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010037','500381','æ±Ÿæ´¥åŒº','',0,2343);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010038','500382','åˆå·åŒº','',0,2344);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010039','500383','æ°¸å·åŒº','',0,2345);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002200010040','500384','å—å·åŒº','',0,2346);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010023','510000','å››å·çœ','',0,2347);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230001','510100','æˆéƒ½å¸‚','',0,2348);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010001','510104','é”¦æ±ŸåŒº','',0,2349);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010002','510105','é’ç¾ŠåŒº','',0,2350);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010003','510106','é‡‘ç‰›åŒº','',0,2351);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010004','510107','æ­¦ä¾¯åŒº','',0,2352);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010005','510108','æˆååŒº','',0,2353);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010006','510112','é¾™æ³‰é©¿åŒº','',0,2354);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010007','510113','é’ç™½æ±ŸåŒº','',0,2355);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010008','510114','æ–°éƒ½åŒº','',0,2356);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010009','510115','æ¸©æ±ŸåŒº','',0,2357);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010010','510121','é‡‘å ‚å¿','',0,2358);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010011','510122','åŒæµå¿','',0,2359);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010012','510124','éƒ«å¿','',0,2360);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010013','510129','å¤§é‚‘å¿','',0,2361);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010014','510131','è’²æ±Ÿå¿','',0,2362);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010015','510132','æ–°æ´¥å¿','',0,2363);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010016','510181','éƒ½æ±Ÿå °å¸‚','',0,2364);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010017','510182','å½­å·å¸‚','',0,2365);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010018','510183','é‚›å´ƒå¸‚','',0,2366);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300010019','510184','å´‡å·å¸‚','',0,2367);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230002','510300','è‡ªè´¡å¸‚','',0,2368);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020001','510302','è‡ªæµäº•åŒº','',0,2369);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020002','510303','è´¡äº•åŒº','',0,2370);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020003','510304','å¤§å®‰åŒº','',0,2371);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020004','510311','æ²¿æ»©åŒº','',0,2372);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020005','510321','è£å¿','',0,2373);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300020006','510322','å¯Œé¡ºå¿','',0,2374);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230003','510400','æ”€æèŠ±å¸‚','',0,2375);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300030001','510402','ä¸œåŒº','',0,2376);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300030002','510403','è¥¿åŒº','',0,2377);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300030003','510411','ä»å’ŒåŒº','',0,2378);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300030004','510421','ç±³æ˜“å¿','',0,2379);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300030005','510422','ç›è¾¹å¿','',0,2380);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230004','510500','æ³¸å·å¸‚','',0,2381);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040001','510502','æ±Ÿé˜³åŒº','',0,2382);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040002','510503','çº³æºªåŒº','',0,2383);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040003','510504','é¾™é©¬æ½­åŒº','',0,2384);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040004','510521','æ³¸å¿','',0,2385);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040005','510522','åˆæ±Ÿå¿','',0,2386);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040006','510524','å™æ°¸å¿','',0,2387);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300040007','510525','å¤è”ºå¿','',0,2388);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230005','510600','å¾·é˜³å¸‚','',0,2389);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050001','510603','æ—Œé˜³åŒº','',0,2390);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050002','510623','ä¸­æ±Ÿå¿','',0,2391);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050003','510626','ç½—æ±Ÿå¿','',0,2392);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050004','510681','å¹¿æ±‰å¸‚','',0,2393);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050005','510682','ä»€é‚¡å¸‚','',0,2394);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300050006','510683','ç»µç«¹å¸‚','',0,2395);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230006','510700','ç»µé˜³å¸‚','',0,2396);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060001','510703','æ¶ªåŸåŒº','',0,2397);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060002','510704','æ¸¸ä»™åŒº','',0,2398);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060003','510722','ä¸‰å°å¿','',0,2399);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060004','510723','ç›äº­å¿','',0,2400);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060005','510724','å®‰å¿','',0,2401);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060006','510725','æ¢“æ½¼å¿','',0,2402);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060007','510726','åŒ—å·ç¾Œæ—è‡ªæ²»å¿','',0,2403);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060008','510727','å¹³æ­¦å¿','',0,2404);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060009','510751','é«˜æ–°åŒº','',0,2405);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300060010','510781','æ±Ÿæ²¹å¸‚','',0,2406);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230007','510800','å¹¿å…ƒå¸‚','',0,2407);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070001','510802','åˆ©å·åŒº','',0,2408);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070002','510811','å…ƒååŒº','',0,2409);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070003','510812','æœå¤©åŒº','',0,2410);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070004','510821','æ—ºè‹å¿','',0,2411);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070005','510822','é’å·å¿','',0,2412);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070006','510823','å‰‘é˜å¿','',0,2413);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300070007','510824','è‹æºªå¿','',0,2414);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230008','510900','é‚å®å¸‚','',0,2415);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300080001','510903','èˆ¹å±±åŒº','',0,2416);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300080002','510904','å®‰å±…åŒº','',0,2417);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300080003','510921','è“¬æºªå¿','',0,2418);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300080004','510922','å°„æ´ªå¿','',0,2419);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300080005','510923','å¤§è‹±å¿','',0,2420);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230009','511000','å†…æ±Ÿå¸‚','',0,2421);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300090001','511002','å¸‚ä¸­åŒº','',0,2422);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300090002','511011','ä¸œå…´åŒº','',0,2423);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300090003','511024','å¨è¿œå¿','',0,2424);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300090004','511025','èµ„ä¸­å¿','',0,2425);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300090005','511028','éš†æ˜Œå¿','',0,2426);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230010','511100','ä¹å±±å¸‚','',0,2427);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100001','511102','å¸‚ä¸­åŒº','',0,2428);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100002','511111','æ²™æ¹¾åŒº','',0,2429);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100003','511112','äº”é€šæ¡¥åŒº','',0,2430);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100004','511113','é‡‘å£æ²³åŒº','',0,2431);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100005','511123','çŠä¸ºå¿','',0,2432);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100006','511124','äº•ç ”å¿','',0,2433);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100007','511126','å¤¹æ±Ÿå¿','',0,2434);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100008','511129','æ²å·å¿','',0,2435);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100009','511132','å³¨è¾¹å½æ—è‡ªæ²»å¿','',0,2436);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100010','511133','é©¬è¾¹å½æ—è‡ªæ²»å¿','',0,2437);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300100011','511181','å³¨çœ‰å±±å¸‚','',0,2438);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230011','511300','å—å……å¸‚','',0,2439);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110001','511302','é¡ºåº†åŒº','',0,2440);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110002','511303','é«˜åªåŒº','',0,2441);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110003','511304','å˜‰é™µåŒº','',0,2442);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110004','511321','å—éƒ¨å¿','',0,2443);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110005','511322','è¥å±±å¿','',0,2444);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110006','511323','è“¬å®‰å¿','',0,2445);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110007','511324','ä»ªé™‡å¿','',0,2446);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110008','511325','è¥¿å……å¿','',0,2447);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300110009','511381','é˜†ä¸­å¸‚','',0,2448);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230012','511400','çœ‰å±±å¸‚','',0,2449);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120001','511402','ä¸œå¡åŒº','',0,2450);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120002','511421','ä»å¯¿å¿','',0,2451);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120003','511422','å½­å±±å¿','',0,2452);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120004','511423','æ´ªé›…å¿','',0,2453);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120005','511424','ä¸¹æ£±å¿','',0,2454);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300120006','511425','é’ç¥å¿','',0,2455);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230013','511500','å®œå®¾å¸‚','',0,2456);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130001','511502','ç¿ å±åŒº','',0,2457);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130002','511521','å®œå®¾å¿','',0,2458);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130003','511522','å—æºªå¿','',0,2459);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130004','511523','æ±Ÿå®‰å¿','',0,2460);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130005','511524','é•¿å®å¿','',0,2461);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130006','511525','é«˜å¿','',0,2462);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130007','511526','ç™å¿','',0,2463);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130008','511527','ç­ è¿å¿','',0,2464);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130009','511528','å…´æ–‡å¿','',0,2465);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300130010','511529','å±å±±å¿','',0,2466);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230014','511600','å¹¿å®‰å¸‚','',0,2467);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140001','511602','å¹¿å®‰åŒº','',0,2468);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140002','511621','å²³æ± å¿','',0,2469);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140003','511622','æ­¦èƒœå¿','',0,2470);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140004','511623','é‚»æ°´å¿','',0,2471);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140005','511681','åè“¥å¸‚','',0,2472);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300140006','511682','å¸‚è¾–åŒº','',0,2473);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230015','511700','è¾¾å·å¸‚','',0,2474);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150001','511702','é€šå·åŒº','',0,2475);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150002','511721','è¾¾å¿','',0,2476);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150003','511722','å®£æ±‰å¿','',0,2477);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150004','511723','å¼€æ±Ÿå¿','',0,2478);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150005','511724','å¤§ç«¹å¿','',0,2479);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150006','511725','æ¸ å¿','',0,2480);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300150007','511781','ä¸‡æºå¸‚','',0,2481);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230016','511800','é›…å®‰å¸‚','',0,2482);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160001','511802','é›¨åŸåŒº','',0,2483);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160002','511821','åå±±å¿','',0,2484);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160003','511822','è¥ç»å¿','',0,2485);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160004','511823','æ±‰æºå¿','',0,2486);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160005','511824','çŸ³æ£‰å¿','',0,2487);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160006','511825','å¤©å…¨å¿','',0,2488);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160007','511826','èŠ¦å±±å¿','',0,2489);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300160008','511827','å®å…´å¿','',0,2490);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230017','511900','å·´ä¸­å¸‚','',0,2491);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300170001','511902','å·´å·åŒº','',0,2492);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300170002','511921','é€šæ±Ÿå¿','',0,2493);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300170003','511922','å—æ±Ÿå¿','',0,2494);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300170004','511923','å¹³æ˜Œå¿','',0,2495);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230018','512000','èµ„é˜³å¸‚','',0,2496);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300180001','512002','é›æ±ŸåŒº','',0,2497);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300180002','512021','å®‰å²³å¿','',0,2498);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300180003','512022','ä¹è‡³å¿','',0,2499);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300180004','512081','ç®€é˜³å¸‚','',0,2500);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230019','513200','é˜¿åè—æ—ç¾Œæ—è‡ªæ²»å·','',0,2501);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190001','513221','æ±¶å·å¿','',0,2502);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190002','513222','ç†å¿','',0,2503);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190003','513223','èŒ‚å¿','',0,2504);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190004','513224','æ¾æ½˜å¿','',0,2505);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190005','513225','ä¹å¯¨æ²Ÿå¿','',0,2506);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190006','513226','é‡‘å·å¿','',0,2507);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190007','513227','å°é‡‘å¿','',0,2508);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190008','513228','é»‘æ°´å¿','',0,2509);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190009','513229','é©¬å°”åº·å¿','',0,2510);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190010','513230','å£¤å¡˜å¿','',0,2511);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190011','513231','é˜¿åå¿','',0,2512);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190012','513232','è‹¥å°”ç›–å¿','',0,2513);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300190013','513233','çº¢åŸå¿','',0,2514);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230020','513300','ç”˜å­œè—æ—è‡ªæ²»å·','',0,2515);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200001','513321','åº·å®šå¿','',0,2516);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200002','513322','æ³¸å®šå¿','',0,2517);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200003','513323','ä¸¹å·´å¿','',0,2518);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200004','513324','ä¹é¾™å¿','',0,2519);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200005','513325','é›…æ±Ÿå¿','',0,2520);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200006','513326','é“å­šå¿','',0,2521);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200007','513327','ç‚‰éœå¿','',0,2522);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200008','513328','ç”˜å­œå¿','',0,2523);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200009','513329','æ–°é¾™å¿','',0,2524);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200010','513330','å¾·æ ¼å¿','',0,2525);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200011','513331','ç™½ç‰å¿','',0,2526);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200012','513332','çŸ³æ¸ å¿','',0,2527);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200013','513333','è‰²è¾¾å¿','',0,2528);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200014','513334','ç†å¡˜å¿','',0,2529);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200015','513335','å·´å¡˜å¿','',0,2530);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200016','513336','ä¹¡åŸå¿','',0,2531);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200017','513337','ç¨»åŸå¿','',0,2532);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300200018','513338','å¾—è£å¿','',0,2533);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100230021','513400','å‡‰å±±å½æ—è‡ªæ²»å·','',0,2534);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210001','513401','è¥¿æ˜Œå¸‚','',0,2535);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210002','513422','æœ¨é‡Œè—æ—è‡ªæ²»å¿','',0,2536);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210003','513423','ç›æºå¿','',0,2537);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210004','513424','å¾·æ˜Œå¿','',0,2538);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210005','513425','ä¼šç†å¿','',0,2539);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210006','513426','ä¼šä¸œå¿','',0,2540);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210007','513427','å®å—å¿','',0,2541);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210008','513428','æ™®æ ¼å¿','',0,2542);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210009','513429','å¸ƒæ‹–å¿','',0,2543);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210010','513430','é‡‘é˜³å¿','',0,2544);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210011','513431','æ˜­è§‰å¿','',0,2545);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210012','513432','å–œå¾·å¿','',0,2546);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210013','513433','å†•å®å¿','',0,2547);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210014','513434','è¶Šè¥¿å¿','',0,2548);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210015','513435','ç”˜æ´›å¿','',0,2549);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210016','513436','ç¾å§‘å¿','',0,2550);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002300210017','513437','é›·æ³¢å¿','',0,2551);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010024','520000','è´µå·çœ','',0,2552);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240001','520100','è´µé˜³å¸‚','',0,2553);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010001','520102','å—æ˜åŒº','',0,2554);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010002','520103','äº‘å²©åŒº','',0,2555);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010003','520111','èŠ±æºªåŒº','',0,2556);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010004','520112','ä¹Œå½“åŒº','',0,2557);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010005','520113','ç™½äº‘åŒº','',0,2558);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010006','520114','å°æ²³åŒº','',0,2559);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010007','520121','å¼€é˜³å¿','',0,2560);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010008','520122','æ¯çƒ½å¿','',0,2561);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010009','520123','ä¿®æ–‡å¿','',0,2562);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010010','520151','é‡‘é˜³å¼€å‘åŒº','',0,2563);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400010011','520181','æ¸…é•‡å¸‚','',0,2564);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240002','520200','å…­ç›˜æ°´å¸‚','',0,2565);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400020001','520201','é’Ÿå±±åŒº','',0,2566);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400020002','520203','å…­æç‰¹åŒº','',0,2567);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400020003','520221','æ°´åŸå¿','',0,2568);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400020004','520222','ç›˜å¿','',0,2569);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240003','520300','éµä¹‰å¸‚','',0,2570);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030001','520302','çº¢èŠ±å²—åŒº','',0,2571);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030002','520303','æ±‡å·åŒº','',0,2572);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030003','520321','éµä¹‰å¿','',0,2573);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030004','520322','æ¡æ¢“å¿','',0,2574);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030005','520323','ç»¥é˜³å¿','',0,2575);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030006','520324','æ­£å®‰å¿','',0,2576);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030007','520325','é“çœŸä»¡ä½¬æ—è‹—æ—è‡ªæ²»å¿','',0,2577);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030008','520326','åŠ¡å·ä»¡ä½¬æ—è‹—æ—è‡ªæ²»å¿','',0,2578);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030009','520327','å‡¤å†ˆå¿','',0,2579);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030010','520328','æ¹„æ½­å¿','',0,2580);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030011','520329','ä½™åº†å¿','',0,2581);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030012','520330','ä¹ æ°´å¿','',0,2582);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030013','520381','èµ¤æ°´å¸‚','',0,2583);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400030014','520382','ä»æ€€å¸‚','',0,2584);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240004','520400','å®‰é¡ºå¸‚','',0,2585);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040001','520402','è¥¿ç§€åŒº','',0,2586);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040002','520421','å¹³åå¿','',0,2587);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040003','520422','æ™®å®šå¿','',0,2588);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040004','520423','é•‡å®å¸ƒä¾æ—è‹—æ—è‡ªæ²»å¿','',0,2589);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040005','520424','å…³å²­å¸ƒä¾æ—è‹—æ—è‡ªæ²»å¿','',0,2590);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400040006','520425','ç´«äº‘è‹—æ—å¸ƒä¾æ—è‡ªæ²»å¿','',0,2591);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240005','522200','é“œä»åœ°åŒº','',0,2592);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050001','522201','é“œä»å¸‚','',0,2593);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050002','522222','æ±Ÿå£å¿','',0,2594);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050003','522223','ç‰å±ä¾—æ—è‡ªæ²»å¿','',0,2595);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050004','522224','çŸ³é˜¡å¿','',0,2596);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050005','522225','æ€å—å¿','',0,2597);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050006','522226','å°æ±ŸåœŸå®¶æ—è‹—æ—è‡ªæ²»å¿','',0,2598);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050007','522227','å¾·æ±Ÿå¿','',0,2599);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050008','522228','æ²¿æ²³åœŸå®¶æ—è‡ªæ²»å¿','',0,2600);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050009','522229','æ¾æ¡ƒè‹—æ—è‡ªæ²»å¿','',0,2601);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400050010','522230','ä¸‡å±±ç‰¹åŒº','',0,2602);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240006','522300','é»”è¥¿å—å¸ƒä¾æ—è‹—æ—è‡ªæ²»å·','',0,2603);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060001','522301','å…´ä¹‰å¸‚','',0,2604);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060002','522322','å…´ä»å¿','',0,2605);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060003','522323','æ™®å®‰å¿','',0,2606);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060004','522324','æ™´éš†å¿','',0,2607);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060005','522325','è´ä¸°å¿','',0,2608);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060006','522326','æœ›è°Ÿå¿','',0,2609);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060007','522327','å†Œäº¨å¿','',0,2610);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400060008','522328','å®‰é¾™å¿','',0,2611);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240007','522400','æ¯•èŠ‚åœ°åŒº','',0,2612);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070001','522401','æ¯•èŠ‚å¸‚','',0,2613);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070002','522422','å¤§æ–¹å¿','',0,2614);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070003','522423','é»”è¥¿å¿','',0,2615);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070004','522424','é‡‘æ²™å¿','',0,2616);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070005','522425','ç»‡é‡‘å¿','',0,2617);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070006','522426','çº³é›å¿','',0,2618);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070007','522427','å¨å®å½æ—å›æ—è‹—æ—è‡ªæ²»å¿','',0,2619);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400070008','522428','èµ«ç« å¿','',0,2620);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240008','522600','é»”ä¸œå—è‹—æ—ä¾—æ—è‡ªæ²»å·','',0,2621);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080001','522601','å‡¯é‡Œå¸‚','',0,2622);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080002','522622','é»„å¹³å¿','',0,2623);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080003','522623','æ–½ç§‰å¿','',0,2624);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080004','522624','ä¸‰ç©—å¿','',0,2625);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080005','522625','é•‡è¿œå¿','',0,2626);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080006','522626','å²‘å·©å¿','',0,2627);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080007','522627','å¤©æŸ±å¿','',0,2628);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080008','522628','é”¦å±å¿','',0,2629);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080009','522629','å‰‘æ²³å¿','',0,2630);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080010','522630','å°æ±Ÿå¿','',0,2631);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080011','522631','é»å¹³å¿','',0,2632);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080012','522632','æ¦•æ±Ÿå¿','',0,2633);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080013','522633','ä»æ±Ÿå¿','',0,2634);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080014','522634','é›·å±±å¿','',0,2635);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080015','522635','éº»æ±Ÿå¿','',0,2636);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400080016','522636','ä¸¹å¯¨å¿','',0,2637);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100240009','522700','é»”å—å¸ƒä¾æ—è‹—æ—è‡ªæ²»å·','',0,2638);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090001','522701','éƒ½åŒ€å¸‚','',0,2639);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090002','522702','ç¦æ³‰å¸‚','',0,2640);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090003','522722','è”æ³¢å¿','',0,2641);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090004','522723','è´µå®šå¿','',0,2642);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090005','522725','ç“®å®‰å¿','',0,2643);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090006','522726','ç‹¬å±±å¿','',0,2644);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090007','522727','å¹³å¡˜å¿','',0,2645);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090008','522728','ç½—ç”¸å¿','',0,2646);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090009','522729','é•¿é¡ºå¿','',0,2647);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090010','522730','é¾™é‡Œå¿','',0,2648);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090011','522731','æƒ æ°´å¿','',0,2649);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002400090012','522732','ä¸‰éƒ½æ°´æ—è‡ªæ²»å¿','',0,2650);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010025','530000','äº‘å—çœ','',0,2651);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250001','530100','æ˜†æ˜å¸‚','',0,2652);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010001','530102','äº”ååŒº','',0,2653);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010002','530103','ç›˜é¾™åŒº','',0,2654);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010003','530111','å®˜æ¸¡åŒº','',0,2655);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010004','530112','è¥¿å±±åŒº','',0,2656);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010005','530113','ä¸œå·åŒº','',0,2657);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010006','530121','å‘ˆè´¡å¿','',0,2658);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010007','530122','æ™‹å®å¿','',0,2659);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010008','530124','å¯Œæ°‘å¿','',0,2660);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010009','530125','å®œè‰¯å¿','',0,2661);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010010','530126','çŸ³æ—å½æ—è‡ªæ²»å¿','',0,2662);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010011','530127','åµ©æ˜å¿','',0,2663);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010012','530128','ç¦„åŠå½æ—è‹—æ—è‡ªæ²»å¿','',0,2664);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010013','530129','å¯»ç”¸å›æ—å½æ—è‡ªæ²»å¿','',0,2665);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500010014','530181','å®‰å®å¸‚','',0,2666);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250002','530300','æ›²é–å¸‚','',0,2667);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020001','530302','éº’éºŸåŒº','',0,2668);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020002','530321','é©¬é¾™å¿','',0,2669);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020003','530322','é™†è‰¯å¿','',0,2670);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020004','530323','å¸ˆå®—å¿','',0,2671);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020005','530324','ç½—å¹³å¿','',0,2672);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020006','530325','å¯Œæºå¿','',0,2673);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020007','530326','ä¼šæ³½å¿','',0,2674);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020008','530328','æ²¾ç›Šå¿','',0,2675);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500020009','530381','å®£å¨å¸‚','',0,2676);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250003','530400','ç‰æºªå¸‚','',0,2677);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030001','530402','çº¢å¡”åŒº','',0,2678);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030002','530421','æ±Ÿå·å¿','',0,2679);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030003','530422','æ¾„æ±Ÿå¿','',0,2680);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030004','530423','é€šæµ·å¿','',0,2681);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030005','530424','åå®å¿','',0,2682);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030006','530425','æ˜“é—¨å¿','',0,2683);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030007','530426','å³¨å±±å½æ—è‡ªæ²»å¿','',0,2684);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030008','530427','æ–°å¹³å½æ—å‚£æ—è‡ªæ²»å¿','',0,2685);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500030009','530428','å…ƒæ±Ÿå“ˆå°¼æ—å½æ—å‚£æ—è‡ªæ²»å¿','',0,2686);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250004','530500','ä¿å±±å¸‚','',0,2687);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500040001','530502','éš†é˜³åŒº','',0,2688);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500040002','530521','æ–½ç”¸å¿','',0,2689);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500040003','530522','è…¾å†²å¿','',0,2690);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500040004','530523','é¾™é™µå¿','',0,2691);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500040005','530524','æ˜Œå®å¿','',0,2692);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250005','530600','æ˜­é€šå¸‚','',0,2693);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050001','530602','æ˜­é˜³åŒº','',0,2694);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050002','530621','é²ç”¸å¿','',0,2695);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050003','530622','å·§å®¶å¿','',0,2696);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050004','530623','ç›æ´¥å¿','',0,2697);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050005','530624','å¤§å…³å¿','',0,2698);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050006','530625','æ°¸å–„å¿','',0,2699);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050007','530626','ç»¥æ±Ÿå¿','',0,2700);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050008','530627','é•‡é›„å¿','',0,2701);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050009','530628','å½è‰¯å¿','',0,2702);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050010','530629','å¨ä¿¡å¿','',0,2703);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500050011','530630','æ°´å¯Œå¿','',0,2704);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250006','530700','ä¸½æ±Ÿå¸‚','',0,2705);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500060001','530702','å¤åŸåŒº','',0,2706);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500060002','530721','ç‰é¾™çº³è¥¿æ—è‡ªæ²»å¿','',0,2707);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500060003','530722','æ°¸èƒœå¿','',0,2708);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500060004','530723','ååªå¿','',0,2709);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500060005','530724','å®è’—å½æ—è‡ªæ²»å¿','',0,2710);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250007','530800','æ™®æ´±å¸‚','',0,2711);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070001','530802','æ€èŒ…åŒº','',0,2712);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070002','530821','å®æ´±å“ˆå°¼æ—å½æ—è‡ªæ²»å¿','',0,2713);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070003','530822','å¢¨æ±Ÿå“ˆå°¼æ—è‡ªæ²»å¿','',0,2714);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070004','530823','æ™¯ä¸œå½æ—è‡ªæ²»å¿','',0,2715);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070005','530824','æ™¯è°·å‚£æ—å½æ—è‡ªæ²»å¿','',0,2716);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070006','530825','é•‡æ²…å½æ—å“ˆå°¼æ—æ‹‰ç¥œæ—è‡ªæ²»å¿','',0,2717);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070007','530826','æ±ŸåŸå“ˆå°¼æ—å½æ—è‡ªæ²»å¿','',0,2718);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070008','530827','å­Ÿè¿å‚£æ—æ‹‰ç¥œæ—ä½¤æ—è‡ªæ²»å¿','',0,2719);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070009','530828','æ¾œæ²§æ‹‰ç¥œæ—è‡ªæ²»å¿','',0,2720);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500070010','530829','è¥¿ç›Ÿä½¤æ—è‡ªæ²»å¿','',0,2721);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250008','530900','ä¸´æ²§å¸‚','',0,2722);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080001','530902','ä¸´ç¿”åŒº','',0,2723);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080002','530921','å‡¤åº†å¿','',0,2724);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080003','530922','äº‘å¿','',0,2725);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080004','530923','æ°¸å¾·å¿','',0,2726);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080005','530924','é•‡åº·å¿','',0,2727);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080006','530925','åŒæ±Ÿæ‹‰ç¥œæ—ä½¤æ—å¸ƒæœ—æ—å‚£æ—è‡ªæ²»å¿','',0,2728);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080007','530926','è€¿é©¬å‚£æ—ä½¤æ—è‡ªæ²»å¿','',0,2729);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500080008','530927','æ²§æºä½¤æ—è‡ªæ²»å¿','',0,2730);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250009','532300','æ¥šé›„å½æ—è‡ªæ²»å·','',0,2731);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090001','532301','æ¥šé›„å¸‚','',0,2732);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090002','532322','åŒæŸå¿','',0,2733);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090003','532323','ç‰Ÿå®šå¿','',0,2734);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090004','532324','å—åå¿','',0,2735);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090005','532325','å§šå®‰å¿','',0,2736);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090006','532326','å¤§å§šå¿','',0,2737);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090007','532327','æ°¸ä»å¿','',0,2738);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090008','532328','å…ƒè°‹å¿','',0,2739);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090009','532329','æ­¦å®šå¿','',0,2740);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500090010','532331','ç¦„ä¸°å¿','',0,2741);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250010','532500','çº¢æ²³å“ˆå°¼æ—å½æ—è‡ªæ²»å·','',0,2742);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100001','532501','ä¸ªæ—§å¸‚','',0,2743);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100002','532502','å¼€è¿œå¸‚','',0,2744);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100003','532522','è’™è‡ªå¿','',0,2745);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100004','532523','å±è¾¹è‹—æ—è‡ªæ²»å¿','',0,2746);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100005','532524','å»ºæ°´å¿','',0,2747);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100006','532525','çŸ³å±å¿','',0,2748);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100007','532526','å¼¥å‹’å¿','',0,2749);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100008','532527','æ³¸è¥¿å¿','',0,2750);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100009','532528','å…ƒé˜³å¿','',0,2751);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100010','532529','çº¢æ²³å¿','',0,2752);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100011','532530','é‡‘å¹³è‹—æ—ç‘¶æ—å‚£æ—è‡ªæ²»å¿','',0,2753);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100012','532531','ç»¿æ˜¥å¿','',0,2754);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500100013','532532','æ²³å£ç‘¶æ—è‡ªæ²»å¿','',0,2755);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250011','532600','æ–‡å±±å£®æ—è‹—æ—è‡ªæ²»å·','',0,2756);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110001','532621','æ–‡å±±å¿','',0,2757);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110002','532622','ç šå±±å¿','',0,2758);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110003','532623','è¥¿ç•´å¿','',0,2759);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110004','532624','éº»æ —å¡å¿','',0,2760);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110005','532625','é©¬å…³å¿','',0,2761);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110006','532626','ä¸˜åŒ—å¿','',0,2762);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110007','532627','å¹¿å—å¿','',0,2763);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500110008','532628','å¯Œå®å¿','',0,2764);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250012','532800','è¥¿åŒç‰ˆçº³å‚£æ—è‡ªæ²»å·','',0,2765);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500120001','532801','æ™¯æ´ªå¸‚','',0,2766);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500120002','532822','å‹æµ·å¿','',0,2767);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500120003','532823','å‹è…Šå¿','',0,2768);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250013','532900','å¤§ç†ç™½æ—è‡ªæ²»å·','',0,2769);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130001','532901','å¤§ç†å¸‚','',0,2770);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130002','532922','æ¼¾æ¿å½æ—è‡ªæ²»å¿','',0,2771);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130003','532923','ç¥¥äº‘å¿','',0,2772);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130004','532924','å®¾å·å¿','',0,2773);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130005','532925','å¼¥æ¸¡å¿','',0,2774);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130006','532926','å—æ¶§å½æ—è‡ªæ²»å¿','',0,2775);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130007','532927','å·å±±å½æ—å›æ—è‡ªæ²»å¿','',0,2776);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130008','532928','æ°¸å¹³å¿','',0,2777);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130009','532929','äº‘é¾™å¿','',0,2778);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130010','532930','æ´±æºå¿','',0,2779);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130011','532931','å‰‘å·å¿','',0,2780);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500130012','532932','é¹¤åº†å¿','',0,2781);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250014','533100','å¾·å®å‚£æ—æ™¯é¢‡æ—è‡ªæ²»å·','',0,2782);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500140001','533102','ç‘ä¸½å¸‚','',0,2783);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500140002','533103','æ½è¥¿å¸‚','',0,2784);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500140003','533122','æ¢æ²³å¿','',0,2785);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500140004','533123','ç›ˆæ±Ÿå¿','',0,2786);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500140005','533124','é™‡å·å¿','',0,2787);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250015','533300','æ€’æ±Ÿå‚ˆåƒ³æ—è‡ªæ²»å·','',0,2788);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500150001','533321','æ³¸æ°´å¿','',0,2789);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500150002','533323','ç¦è´¡å¿','',0,2790);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500150003','533324','è´¡å±±ç‹¬é¾™æ—æ€’æ—è‡ªæ²»å¿','',0,2791);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500150004','533325','å…°åªç™½æ—æ™®ç±³æ—è‡ªæ²»å¿','',0,2792);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100250016','533400','è¿ªåº†è—æ—è‡ªæ²»å·','',0,2793);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500160001','533421','é¦™æ ¼é‡Œæ‹‰å¿','',0,2794);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500160002','533422','å¾·é’¦å¿','',0,2795);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002500160003','533423','ç»´è¥¿å‚ˆåƒ³æ—è‡ªæ²»å¿','',0,2796);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010026','540000','è¥¿è—è‡ªæ²»åŒº','',0,2797);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260001','540100','æ‹‰è¨å¸‚','',0,2798);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010001','540102','åŸå…³åŒº','',0,2799);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010002','540121','æ—å‘¨å¿','',0,2800);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010003','540122','å½“é›„å¿','',0,2801);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010004','540123','å°¼æœ¨å¿','',0,2802);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010005','540124','æ›²æ°´å¿','',0,2803);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010006','540125','å †é¾™å¾·åº†å¿','',0,2804);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010007','540126','è¾¾å­œå¿','',0,2805);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600010008','540127','å¢¨ç«¹å·¥å¡å¿','',0,2806);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260002','542100','æ˜Œéƒ½åœ°åŒº','',0,2807);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020001','542121','æ˜Œéƒ½å¿','',0,2808);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020002','542122','æ±Ÿè¾¾å¿','',0,2809);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020003','542123','è´¡è§‰å¿','',0,2810);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020004','542124','ç±»ä¹Œé½å¿','',0,2811);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020005','542125','ä¸é’å¿','',0,2812);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020006','542126','å¯Ÿé›…å¿','',0,2813);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020007','542127','å…«å®¿å¿','',0,2814);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020008','542128','å·¦è´¡å¿','',0,2815);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020009','542129','èŠ’åº·å¿','',0,2816);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020010','542132','æ´›éš†å¿','',0,2817);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600020011','542133','è¾¹åå¿','',0,2818);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260003','542200','å±±å—åœ°åŒº','',0,2819);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030001','542221','ä¹ƒä¸œå¿','',0,2820);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030002','542222','æ‰å›Šå¿','',0,2821);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030003','542223','è´¡å˜å¿','',0,2822);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030004','542224','æ¡‘æ—¥å¿','',0,2823);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030005','542225','ç¼ç»“å¿','',0,2824);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030006','542226','æ›²æ¾å¿','',0,2825);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030007','542227','æªç¾å¿','',0,2826);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030008','542228','æ´›æ‰å¿','',0,2827);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030009','542229','åŠ æŸ¥å¿','',0,2828);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030010','542231','éš†å­å¿','',0,2829);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030011','542232','é”™é‚£å¿','',0,2830);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600030012','542233','æµªå¡å­å¿','',0,2831);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260004','542300','æ—¥å–€åˆ™åœ°åŒº','',0,2832);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040001','542301','æ—¥å–€åˆ™å¸‚','',0,2833);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040002','542322','å—æœ¨æ—å¿','',0,2834);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040003','542323','æ±Ÿå­œå¿','',0,2835);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040004','542324','å®šæ—¥å¿','',0,2836);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040005','542325','è¨è¿¦å¿','',0,2837);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040006','542326','æ‹‰å­œå¿','',0,2838);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040007','542327','æ˜‚ä»å¿','',0,2839);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040008','542328','è°¢é€šé—¨å¿','',0,2840);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040009','542329','ç™½æœ—å¿','',0,2841);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040010','542330','ä»å¸ƒå¿','',0,2842);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040011','542331','åº·é©¬å¿','',0,2843);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040012','542332','å®šç»“å¿','',0,2844);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040013','542333','ä»²å·´å¿','',0,2845);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040014','542334','äºšä¸œå¿','',0,2846);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040015','542335','å‰éš†å¿','',0,2847);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040016','542336','è‚æ‹‰æœ¨å¿','',0,2848);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040017','542337','è¨å˜å¿','',0,2849);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600040018','542338','å²—å·´å¿','',0,2850);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260005','542400','é‚£æ›²åœ°åŒº','',0,2851);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050001','542421','é‚£æ›²å¿','',0,2852);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050002','542422','å˜‰é»å¿','',0,2853);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050003','542423','æ¯”å¦‚å¿','',0,2854);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050004','542424','è‚è£å¿','',0,2855);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050005','542425','å®‰å¤šå¿','',0,2856);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050006','542426','ç”³æ‰å¿','',0,2857);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050007','542427','ç´¢å¿','',0,2858);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050008','542428','ç­æˆˆå¿','',0,2859);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050009','542429','å·´é’å¿','',0,2860);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600050010','542430','å°¼ç›å¿','',0,2861);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260006','542500','é˜¿é‡Œåœ°åŒº','',0,2862);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060001','542521','æ™®å…°å¿','',0,2863);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060002','542522','æœ­è¾¾å¿','',0,2864);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060003','542523','å™¶å°”å¿','',0,2865);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060004','542524','æ—¥åœŸå¿','',0,2866);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060005','542525','é©å‰å¿','',0,2867);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060006','542526','æ”¹åˆ™å¿','',0,2868);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600060007','542527','æªå‹¤å¿','',0,2869);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100260007','542600','æ—èŠåœ°åŒº','',0,2870);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070001','542621','æ—èŠå¿','',0,2871);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070002','542622','å·¥å¸ƒæ±Ÿè¾¾å¿','',0,2872);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070003','542623','ç±³æ—å¿','',0,2873);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070004','542624','å¢¨è„±å¿','',0,2874);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070005','542625','æ³¢å¯†å¿','',0,2875);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070006','542626','å¯Ÿéš…å¿','',0,2876);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002600070007','542627','æœ—å¿','',0,2877);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010027','610000','é™•è¥¿çœ','',0,2878);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270001','610100','è¥¿å®‰å¸‚','',0,2879);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010001','610102','æ–°åŸåŒº','',0,2880);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010002','610103','ç¢‘æ—åŒº','',0,2881);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010003','610104','è²æ¹–åŒº','',0,2882);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010004','610111','çæ¡¥åŒº','',0,2883);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010005','610112','æœªå¤®åŒº','',0,2884);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010006','610113','é›å¡”åŒº','',0,2885);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010007','610114','é˜è‰¯åŒº','',0,2886);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010008','610115','ä¸´æ½¼åŒº','',0,2887);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010009','610116','é•¿å®‰åŒº','',0,2888);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010010','610122','è“ç”°å¿','',0,2889);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010011','610124','å‘¨è‡³å¿','',0,2890);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010012','610125','æˆ·å¿','',0,2891);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700010013','610126','é«˜é™µå¿','',0,2892);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270002','610200','é“œå·å¸‚','',0,2893);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700020001','610202','ç‹ç›ŠåŒº','',0,2894);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700020002','610203','å°å°åŒº','',0,2895);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700020003','610204','è€€å·åŒº','',0,2896);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700020004','610222','å®œå›å¿','',0,2897);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270003','610300','å®é¸¡å¸‚','',0,2898);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030001','610302','æ¸­æ»¨åŒº','',0,2899);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030002','610303','é‡‘å°åŒº','',0,2900);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030003','610304','é™ˆä»“åŒº','',0,2901);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030004','610322','å‡¤ç¿”å¿','',0,2902);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030005','610323','å²å±±å¿','',0,2903);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030006','610324','æ‰¶é£å¿','',0,2904);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030007','610326','çœ‰å¿','',0,2905);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030008','610327','é™‡å¿','',0,2906);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030009','610328','åƒé˜³å¿','',0,2907);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030010','610329','éºŸæ¸¸å¿','',0,2908);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030011','610330','å‡¤å¿','',0,2909);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700030012','610331','å¤ªç™½å¿','',0,2910);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270004','610400','å’¸é˜³å¸‚','',0,2911);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040001','610402','ç§¦éƒ½åŒº','',0,2912);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040002','610403','æ¨é™µåŒº','',0,2913);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040003','610404','æ¸­åŸåŒº','',0,2914);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040004','610422','ä¸‰åŸå¿','',0,2915);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040005','610423','æ³¾é˜³å¿','',0,2916);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040006','610424','ä¹¾å¿','',0,2917);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040007','610425','ç¤¼æ³‰å¿','',0,2918);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040008','610426','æ°¸å¯¿å¿','',0,2919);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040009','610427','å½¬å¿','',0,2920);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040010','610428','é•¿æ­¦å¿','',0,2921);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040011','610429','æ—¬é‚‘å¿','',0,2922);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040012','610430','æ·³åŒ–å¿','',0,2923);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040013','610431','æ­¦åŠŸå¿','',0,2924);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700040014','610481','å…´å¹³å¸‚','',0,2925);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270005','610500','æ¸­å—å¸‚','',0,2926);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050001','610502','ä¸´æ¸­åŒº','',0,2927);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050002','610521','åå¿','',0,2928);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050003','610522','æ½¼å…³å¿','',0,2929);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050004','610523','å¤§è”å¿','',0,2930);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050005','610524','åˆé˜³å¿','',0,2931);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050006','610525','æ¾„åŸå¿','',0,2932);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050007','610526','è’²åŸå¿','',0,2933);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050008','610527','ç™½æ°´å¿','',0,2934);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050009','610528','å¯Œå¹³å¿','',0,2935);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050010','610581','éŸ©åŸå¸‚','',0,2936);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700050011','610582','åé˜´å¸‚','',0,2937);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270006','610600','å»¶å®‰å¸‚','',0,2938);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060001','610602','å®å¡”åŒº','',0,2939);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060002','610621','å»¶é•¿å¿','',0,2940);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060003','610622','å»¶å·å¿','',0,2941);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060004','610623','å­é•¿å¿','',0,2942);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060005','610624','å®‰å¡å¿','',0,2943);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060006','610625','å¿—ä¸¹å¿','',0,2944);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060007','610626','å´èµ·å¿','',0,2945);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060008','610627','ç”˜æ³‰å¿','',0,2946);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060009','610628','å¯Œå¿','',0,2947);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060010','610629','æ´›å·å¿','',0,2948);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060011','610630','å®œå·å¿','',0,2949);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060012','610631','é»„é¾™å¿','',0,2950);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700060013','610632','é»„é™µå¿','',0,2951);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270007','610700','æ±‰ä¸­å¸‚','',0,2952);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070001','610702','æ±‰å°åŒº','',0,2953);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070002','610721','å—éƒ‘å¿','',0,2954);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070003','610722','åŸå›ºå¿','',0,2955);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070004','610723','æ´‹å¿','',0,2956);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070005','610724','è¥¿ä¹¡å¿','',0,2957);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070006','610725','å‹‰å¿','',0,2958);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070007','610726','å®å¼ºå¿','',0,2959);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070008','610727','ç•¥é˜³å¿','',0,2960);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070009','610728','é•‡å·´å¿','',0,2961);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070010','610729','ç•™åå¿','',0,2962);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700070011','610730','ä½›åªå¿','',0,2963);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270008','610800','æ¦†æ—å¸‚','',0,2964);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080001','610802','æ¦†é˜³åŒº','',0,2965);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080002','610821','ç¥æœ¨å¿','',0,2966);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080003','610822','åºœè°·å¿','',0,2967);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080004','610823','æ¨ªå±±å¿','',0,2968);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080005','610824','é–è¾¹å¿','',0,2969);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080006','610825','å®šè¾¹å¿','',0,2970);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080007','610826','ç»¥å¾·å¿','',0,2971);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080008','610827','ç±³è„‚å¿','',0,2972);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080009','610828','ä½³å¿','',0,2973);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080010','610829','å´å ¡å¿','',0,2974);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080011','610830','æ¸…æ¶§å¿','',0,2975);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700080012','610831','å­æ´²å¿','',0,2976);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270009','610900','å®‰åº·å¸‚','',0,2977);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090001','610902','æ±‰æ»¨åŒº','',0,2978);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090002','610921','æ±‰é˜´å¿','',0,2979);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090003','610922','çŸ³æ³‰å¿','',0,2980);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090004','610923','å®é™•å¿','',0,2981);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090005','610924','ç´«é˜³å¿','',0,2982);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090006','610925','å²šçš‹å¿','',0,2983);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090007','610926','å¹³åˆ©å¿','',0,2984);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090008','610927','é•‡åªå¿','',0,2985);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090009','610928','æ—¬é˜³å¿','',0,2986);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700090010','610929','ç™½æ²³å¿','',0,2987);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100270010','611000','å•†æ´›å¸‚','',0,2988);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100001','611002','å•†å·åŒº','',0,2989);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100002','611021','æ´›å—å¿','',0,2990);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100003','611022','ä¸¹å‡¤å¿','',0,2991);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100004','611023','å•†å—å¿','',0,2992);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100005','611024','å±±é˜³å¿','',0,2993);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100006','611025','é•‡å®‰å¿','',0,2994);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002700100007','611026','æŸæ°´å¿','',0,2995);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010028','620000','ç”˜è‚ƒçœ','',0,2996);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280001','620100','å…°å·å¸‚','',0,2997);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010001','620102','åŸå…³åŒº','',0,2998);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010002','620103','ä¸ƒé‡Œæ²³åŒº','',0,2999);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010003','620104','è¥¿å›ºåŒº','',0,3000);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010004','620105','å®‰å®åŒº','',0,3001);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010005','620111','çº¢å¤åŒº','',0,3002);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010006','620121','æ°¸ç™»å¿','',0,3003);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010007','620122','çš‹å…°å¿','',0,3004);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800010008','620123','æ¦†ä¸­å¿','',0,3005);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280002','620200','å˜‰å³ªå…³å¸‚','',0,3006);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280003','620300','é‡‘æ˜Œå¸‚','',0,3007);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800030001','620302','é‡‘å·åŒº','',0,3008);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800030002','620321','æ°¸æ˜Œå¿','',0,3009);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280004','620400','ç™½é“¶å¸‚','',0,3010);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800040001','620402','ç™½é“¶åŒº','',0,3011);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800040002','620403','å¹³å·åŒº','',0,3012);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800040003','620421','é–è¿œå¿','',0,3013);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800040004','620422','ä¼šå®å¿','',0,3014);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800040005','620423','æ™¯æ³°å¿','',0,3015);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280005','620500','å¤©æ°´å¸‚','',0,3016);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050001','620502','ç§¦å·åŒº','',0,3017);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050002','620503','éº¦ç§¯åŒº','',0,3018);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050003','620521','æ¸…æ°´å¿','',0,3019);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050004','620522','ç§¦å®‰å¿','',0,3020);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050005','620523','ç”˜è°·å¿','',0,3021);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050006','620524','æ­¦å±±å¿','',0,3022);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800050007','620525','å¼ å®¶å·å›æ—è‡ªæ²»å¿','',0,3023);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280006','620600','æ­¦å¨å¸‚','',0,3024);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800060001','620602','å‡‰å·åŒº','',0,3025);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800060002','620621','æ°‘å‹¤å¿','',0,3026);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800060003','620622','å¤æµªå¿','',0,3027);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800060004','620623','å¤©ç¥è—æ—è‡ªæ²»å¿','',0,3028);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280007','620700','å¼ æ–å¸‚','',0,3029);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070001','620702','ç”˜å·åŒº','',0,3030);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070002','620721','è‚ƒå—è£•å›ºæ—è‡ªæ²»å¿','',0,3031);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070003','620722','æ°‘ä¹å¿','',0,3032);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070004','620723','ä¸´æ³½å¿','',0,3033);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070005','620724','é«˜å°å¿','',0,3034);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800070006','620725','å±±ä¸¹å¿','',0,3035);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280008','620800','å¹³å‡‰å¸‚','',0,3036);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080001','620802','å´†å³’åŒº','',0,3037);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080002','620821','æ³¾å·å¿','',0,3038);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080003','620822','çµå°å¿','',0,3039);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080004','620823','å´‡ä¿¡å¿','',0,3040);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080005','620824','åäº­å¿','',0,3041);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080006','620825','åº„æµªå¿','',0,3042);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800080007','620826','é™å®å¿','',0,3043);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280009','620900','é…’æ³‰å¸‚','',0,3044);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090001','620902','è‚ƒå·åŒº','',0,3045);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090002','620921','é‡‘å¡”å¿','',0,3046);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090003','620922','å®‰è¥¿å¿','',0,3047);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090004','620923','è‚ƒåŒ—è’™å¤æ—è‡ªæ²»å¿','',0,3048);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090005','620924','é˜¿å…‹å¡å“ˆè¨å…‹æ—è‡ªæ²»å¿','',0,3049);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090006','620981','ç‰é—¨å¸‚','',0,3050);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800090007','620982','æ•¦ç…Œå¸‚','',0,3051);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280010','621000','åº†é˜³å¸‚','',0,3052);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100001','621002','è¥¿å³°åŒº','',0,3053);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100002','621021','åº†åŸå¿','',0,3054);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100003','621022','ç¯å¿','',0,3055);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100004','621023','åæ± å¿','',0,3056);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100005','621024','åˆæ°´å¿','',0,3057);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100006','621025','æ­£å®å¿','',0,3058);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100007','621026','å®å¿','',0,3059);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800100008','621027','é•‡åŸå¿','',0,3060);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280011','621100','å®šè¥¿å¸‚','',0,3061);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110001','620100','å…°å·å¸‚','',0,3062);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110002','620200','å˜‰å³ªå…³å¸‚','',0,3063);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110003','620300','é‡‘æ˜Œå¸‚','',0,3064);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110004','620400','ç™½é“¶å¸‚','',0,3065);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110005','620500','å¤©æ°´å¸‚','',0,3066);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110006','620600','æ­¦å¨å¸‚','',0,3067);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110007','620700','å¼ æ–å¸‚','',0,3068);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110008','620800','å¹³å‡‰å¸‚','',0,3069);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110009','620900','é…’æ³‰å¸‚','',0,3070);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110010','621000','åº†é˜³å¸‚','',0,3071);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110011','621100','å®šè¥¿å¸‚','',0,3072);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110012','621200','é™‡å—å¸‚','',0,3073);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110013','622900','ä¸´å¤å›æ—è‡ªæ²»å·','',0,3074);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800110014','623000','ç”˜å—è—æ—è‡ªæ²»å·','',0,3075);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280012','621200','é™‡å—å¸‚','',0,3076);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120001','621202','æ­¦éƒ½åŒº','',0,3077);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120002','621221','æˆå¿','',0,3078);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120003','621222','æ–‡å¿','',0,3079);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120004','621223','å®•æ˜Œå¿','',0,3080);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120005','621224','åº·å¿','',0,3081);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120006','621225','è¥¿å’Œå¿','',0,3082);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120007','621226','ç¤¼å¿','',0,3083);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120008','621227','å¾½å¿','',0,3084);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800120009','621228','ä¸¤å½“å¿','',0,3085);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280013','622900','ä¸´å¤å›æ—è‡ªæ²»å·','',0,3086);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130001','622901','ä¸´å¤å¸‚','',0,3087);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130002','622921','ä¸´å¤å¿','',0,3088);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130003','622922','åº·ä¹å¿','',0,3089);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130004','622923','æ°¸é–å¿','',0,3090);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130005','622924','å¹¿æ²³å¿','',0,3091);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130006','622925','å’Œæ”¿å¿','',0,3092);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130007','622926','ä¸œä¹¡æ—è‡ªæ²»å¿','',0,3093);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800130008','622927','ç§¯çŸ³å±±ä¿å®‰æ—ä¸œä¹¡æ—æ’’æ‹‰æ—è‡ªæ²»å¿','',0,3094);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100280014','623000','ç”˜å—è—æ—è‡ªæ²»å·','',0,3095);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140001','623001','åˆä½œå¸‚','',0,3096);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140002','623021','ä¸´æ½­å¿','',0,3097);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140003','623022','å“å°¼å¿','',0,3098);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140004','623023','èˆŸæ›²å¿','',0,3099);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140005','623024','è¿­éƒ¨å¿','',0,3100);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140006','623025','ç›æ›²å¿','',0,3101);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140007','623026','ç¢Œæ›²å¿','',0,3102);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002800140008','623027','å¤æ²³å¿','',0,3103);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010029','630000','é’æµ·çœ','',0,3104);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290001','630100','è¥¿å®å¸‚','',0,3105);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010001','630102','åŸä¸œåŒº','',0,3106);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010002','630103','åŸä¸­åŒº','',0,3107);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010003','630104','åŸè¥¿åŒº','',0,3108);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010004','630105','åŸåŒ—åŒº','',0,3109);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010005','630121','å¤§é€šå›æ—åœŸæ—è‡ªæ²»å¿','',0,3110);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010006','630122','æ¹Ÿä¸­å¿','',0,3111);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900010007','630123','æ¹Ÿæºå¿','',0,3112);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290002','632100','æµ·ä¸œåœ°åŒº','',0,3113);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020001','632121','å¹³å®‰å¿','',0,3114);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020002','632122','æ°‘å’Œå›æ—åœŸæ—è‡ªæ²»å¿','',0,3115);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020003','632123','ä¹éƒ½å¿','',0,3116);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020004','632126','äº’åŠ©åœŸæ—è‡ªæ²»å¿','',0,3117);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020005','632127','åŒ–éš†å›æ—è‡ªæ²»å¿','',0,3118);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900020006','632128','å¾ªåŒ–æ’’æ‹‰æ—è‡ªæ²»å¿','',0,3119);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290003','632200','æµ·åŒ—è—æ—è‡ªæ²»å·','',0,3120);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900030001','632221','é—¨æºå›æ—è‡ªæ²»å¿','',0,3121);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900030002','632222','ç¥è¿å¿','',0,3122);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900030003','632223','æµ·æ™å¿','',0,3123);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900030004','632224','åˆšå¯Ÿå¿','',0,3124);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290004','632300','é»„å—è—æ—è‡ªæ²»å·','',0,3125);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900040001','632321','åŒä»å¿','',0,3126);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900040002','632322','å°–æ‰å¿','',0,3127);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900040003','632323','æ³½åº“å¿','',0,3128);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900040004','632324','æ²³å—è’™å¤æ—è‡ªæ²»å¿','',0,3129);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290005','632500','æµ·å—è—æ—è‡ªæ²»å·','',0,3130);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900050001','632521','å…±å’Œå¿','',0,3131);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900050002','632522','åŒå¾·å¿','',0,3132);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900050003','632523','è´µå¾·å¿','',0,3133);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900050004','632524','å…´æµ·å¿','',0,3134);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900050005','632525','è´µå—å¿','',0,3135);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290006','632600','æœæ´›è—æ—è‡ªæ²»å·','',0,3136);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060001','632621','ç›æ²å¿','',0,3137);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060002','632622','ç­ç›å¿','',0,3138);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060003','632623','ç”˜å¾·å¿','',0,3139);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060004','632624','è¾¾æ—¥å¿','',0,3140);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060005','632625','ä¹…æ²»å¿','',0,3141);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900060006','632626','ç›å¤šå¿','',0,3142);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290007','632700','ç‰æ ‘è—æ—è‡ªæ²»å·','',0,3143);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070001','632721','ç‰æ ‘å¿','',0,3144);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070002','632722','æ‚å¤šå¿','',0,3145);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070003','632723','ç§°å¤šå¿','',0,3146);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070004','632724','æ²»å¤šå¿','',0,3147);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070005','632725','å›Šè°¦å¿','',0,3148);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900070006','632726','æ›²éº»è±å¿','',0,3149);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100290008','632800','æµ·è¥¿è’™å¤æ—è—æ—è‡ªæ²»å·','',0,3150);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080001','630100','è¥¿å®å¸‚','',0,3151);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080002','632100','æµ·ä¸œåœ°åŒº','',0,3152);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080003','632200','æµ·åŒ—è—æ—è‡ªæ²»å·','',0,3153);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080004','632300','é»„å—è—æ—è‡ªæ²»å·','',0,3154);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080005','632500','æµ·å—è—æ—è‡ªæ²»å·','',0,3155);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080006','632600','æœæ´›è—æ—è‡ªæ²»å·','',0,3156);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080007','632700','ç‰æ ‘è—æ—è‡ªæ²»å·','',0,3157);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001002900080008','632800','æµ·è¥¿è’™å¤æ—è—æ—è‡ªæ²»å·','',0,3158);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010030','640000','å®å¤å›æ—è‡ªæ²»åŒº','',0,3159);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100300001','640100','é“¶å·å¸‚','',0,3160);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010001','640104','å…´åº†åŒº','',0,3161);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010002','640105','è¥¿å¤åŒº','',0,3162);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010003','640106','é‡‘å‡¤åŒº','',0,3163);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010004','640121','æ°¸å®å¿','',0,3164);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010005','640122','è´ºå…°å¿','',0,3165);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000010006','640181','çµæ­¦å¸‚','',0,3166);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100300002','640200','çŸ³å˜´å±±å¸‚','',0,3167);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000020001','640202','å¤§æ­¦å£åŒº','',0,3168);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000020002','640205','æƒ å†œåŒº','',0,3169);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000020003','640221','å¹³ç½—å¿','',0,3170);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100300003','640300','å´å¿ å¸‚','',0,3171);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000030001','640302','åˆ©é€šåŒº','',0,3172);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000030002','640303','çº¢å¯ºå ¡åŒº','',0,3173);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000030003','640323','ç›æ± å¿','',0,3174);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000030004','640324','åŒå¿ƒå¿','',0,3175);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000030005','640381','é’é“œå³¡å¸‚','',0,3176);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100300004','640400','å›ºåŸå¸‚','',0,3177);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000040001','640402','åŸå·åŒº','',0,3178);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000040002','640422','è¥¿å‰å¿','',0,3179);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000040003','640423','éš†å¾·å¿','',0,3180);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000040004','640424','æ³¾æºå¿','',0,3181);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000040005','640425','å½­é˜³å¿','',0,3182);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100300005','640500','ä¸­å«å¸‚','',0,3183);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000050001','640502','æ²™å¡å¤´åŒº','',0,3184);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000050002','640521','ä¸­å®å¿','',0,3185);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003000050003','640522','æµ·åŸå¿','',0,3186);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010031','650000','æ–°ç–†ç»´å¾å°”è‡ªæ²»åŒº','',0,3187);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310001','650100','ä¹Œé²æœ¨é½å¸‚','',0,3188);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010001','650102','å¤©å±±åŒº','',0,3189);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010002','650103','æ²™ä¾å·´å…‹åŒº','',0,3190);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010003','650104','æ–°å¸‚åŒº','',0,3191);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010004','650105','æ°´ç£¨æ²ŸåŒº','',0,3192);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010005','650106','å¤´å±¯æ²³åŒº','',0,3193);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010006','650107','è¾¾å‚åŸåŒº','',0,3194);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010007','650108','ä¸œå±±åŒº','',0,3195);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010008','650109','ç±³ä¸œåŒº','',0,3196);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100010009','650121','ä¹Œé²æœ¨é½å¿','',0,3197);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310002','650200','å…‹æ‹‰ç›ä¾å¸‚','',0,3198);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100020001','650202','ç‹¬å±±å­åŒº','',0,3199);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100020002','650203','å…‹æ‹‰ç›ä¾åŒº','',0,3200);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100020003','650204','ç™½ç¢±æ»©åŒº','',0,3201);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100020004','650205','ä¹Œå°”ç¦¾åŒº','',0,3202);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310003','652100','åé²ç•ªåœ°åŒº','',0,3203);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100030001','652101','åé²ç•ªå¸‚','',0,3204);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100030002','652122','é„¯å–„å¿','',0,3205);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100030003','652123','æ‰˜å…‹é€Šå¿','',0,3206);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310004','652200','å“ˆå¯†åœ°åŒº','',0,3207);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100040001','652201','å“ˆå¯†å¸‚','',0,3208);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100040002','652222','å·´é‡Œå¤å“ˆè¨å…‹è‡ªæ²»å¿','',0,3209);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100040003','652223','ä¼Šå¾å¿','',0,3210);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310005','652300','æ˜Œå‰å›æ—è‡ªæ²»å·','',0,3211);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050001','652301','æ˜Œå‰å¸‚','',0,3212);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050002','652302','é˜œåº·å¸‚','',0,3213);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050003','652303','ç±³æ³‰å¸‚','',0,3214);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050004','652323','å‘¼å›¾å£å¿','',0,3215);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050005','652324','ç›çº³æ–¯å¿','',0,3216);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050006','652325','å¥‡å°å¿','',0,3217);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050007','652327','å‰æœ¨è¨å°”å¿','',0,3218);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100050008','652328','æœ¨å’å“ˆè¨å…‹è‡ªæ²»å¿','',0,3219);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310006','652700','åšå°”å¡”æ‹‰è’™å¤è‡ªæ²»å·','',0,3220);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100060001','652701','åšä¹å¸‚','',0,3221);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100060002','652722','ç²¾æ²³å¿','',0,3222);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100060003','652723','æ¸©æ³‰å¿','',0,3223);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310007','652800','å·´éŸ³éƒ­æ¥è’™å¤è‡ªæ²»å·','',0,3224);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070001','652801','åº“å°”å‹’å¸‚','',0,3225);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070002','652822','è½®å°å¿','',0,3226);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070003','652823','å°‰çŠå¿','',0,3227);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070004','652824','è‹¥ç¾Œå¿','',0,3228);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070005','652825','ä¸”æœ«å¿','',0,3229);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070006','652826','ç„‰è€†å›æ—è‡ªæ²»å¿','',0,3230);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070007','652827','å’Œé™å¿','',0,3231);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070008','652828','å’Œç¡•å¿','',0,3232);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100070009','652829','åšæ¹–å¿','',0,3233);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310008','652900','é˜¿å…‹è‹åœ°åŒº','',0,3234);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080001','652901','é˜¿å…‹è‹å¸‚','',0,3235);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080002','652922','æ¸©å®¿å¿','',0,3236);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080003','652923','åº“è½¦å¿','',0,3237);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080004','652924','æ²™é›…å¿','',0,3238);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080005','652925','æ–°å’Œå¿','',0,3239);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080006','652926','æ‹œåŸå¿','',0,3240);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080007','652927','ä¹Œä»€å¿','',0,3241);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080008','652928','é˜¿ç“¦æå¿','',0,3242);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100080009','652929','æŸ¯åªå¿','',0,3243);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310009','653000','å…‹å­œå‹’è‹æŸ¯å°”å…‹å­œè‡ªæ²»å·','',0,3244);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100090001','653001','é˜¿å›¾ä»€å¸‚','',0,3245);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100090002','653022','é˜¿å…‹é™¶å¿','',0,3246);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100090003','653023','é˜¿åˆå¥‡å¿','',0,3247);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100090004','653024','ä¹Œæ°å¿','',0,3248);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310010','653100','å–€ä»€åœ°åŒº','',0,3249);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100001','653101','å–€ä»€å¸‚','',0,3250);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100002','653121','ç–é™„å¿','',0,3251);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100003','653122','ç–å‹’å¿','',0,3252);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100004','653123','è‹±å‰æ²™å¿','',0,3253);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100005','653124','æ³½æ™®å¿','',0,3254);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100006','653125','èè½¦å¿','',0,3255);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100007','653126','å¶åŸå¿','',0,3256);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100008','653127','éº¦ç›–æå¿','',0,3257);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100009','653128','å²³æ™®æ¹–å¿','',0,3258);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100010','653129','ä¼½å¸ˆå¿','',0,3259);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100011','653130','å·´æ¥šå¿','',0,3260);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100100012','653131','å¡”ä»€åº“å°”å¹²å¡”å‰å…‹è‡ªæ²»å¿','',0,3261);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310011','653200','å’Œç”°åœ°åŒº','',0,3262);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110001','653201','å’Œç”°å¸‚','',0,3263);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110002','653221','å’Œç”°å¿','',0,3264);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110003','653222','å¢¨ç‰å¿','',0,3265);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110004','653223','çš®å±±å¿','',0,3266);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110005','653224','æ´›æµ¦å¿','',0,3267);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110006','653225','ç­–å‹’å¿','',0,3268);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110007','653226','äºç”°å¿','',0,3269);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100110008','653227','æ°‘ä¸°å¿','',0,3270);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310012','654000','ä¼ŠçŠå“ˆè¨å…‹è‡ªæ²»å·','',0,3271);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120001','654002','ä¼Šå®å¸‚','',0,3272);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120002','654003','å¥å±¯å¸‚','',0,3273);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120003','654021','ä¼Šå®å¿','',0,3274);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120004','654022','å¯Ÿå¸ƒæŸ¥å°”é”¡ä¼¯è‡ªæ²»å¿','',0,3275);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120005','654023','éœåŸå¿','',0,3276);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120006','654024','å·©ç•™å¿','',0,3277);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120007','654025','æ–°æºå¿','',0,3278);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120008','654026','æ˜­è‹å¿','',0,3279);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120009','654027','ç‰¹å…‹æ–¯å¿','',0,3280);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100120010','654028','å°¼å‹’å…‹å¿','',0,3281);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310013','654200','å¡”åŸåœ°åŒº','',0,3282);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130001','654201','å¡”åŸå¸‚','',0,3283);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130002','654202','ä¹Œè‹å¸‚','',0,3284);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130003','654221','é¢æ•å¿','',0,3285);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130004','654223','æ²™æ¹¾å¿','',0,3286);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130005','654224','æ‰˜é‡Œå¿','',0,3287);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130006','654225','è£•æ°‘å¿','',0,3288);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100130007','654226','å’Œå¸ƒå…‹èµ›å°”è’™å¤è‡ªæ²»å¿','',0,3289);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310014','654300','é˜¿å‹’æ³°åœ°åŒº','',0,3290);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140001','654301','é˜¿å‹’æ³°å¸‚','',0,3291);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140002','654321','å¸ƒå°”æ´¥å¿','',0,3292);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140003','654322','å¯Œè•´å¿','',0,3293);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140004','654323','ç¦æµ·å¿','',0,3294);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140005','654324','å“ˆå·´æ²³å¿','',0,3295);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140006','654325','é’æ²³å¿','',0,3296);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003100140007','654326','å‰æœ¨ä¹ƒå¿','',0,3297);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310015','659001','çŸ³æ²³å­å¸‚','',0,3298);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310016','659002','é˜¿æ‹‰å°”å¸‚','',0,3299);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310017','659003','å›¾æœ¨èˆ’å…‹å¸‚','',0,3300);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100310018','659004','äº”å®¶æ¸ å¸‚','',0,3301);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010032','710000','å°æ¹¾çœ','',0,3302);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320001','710100','å°åŒ—å¸‚','',0,3303);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010001','710101','ä¸­æ­£åŒº','',0,3304);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010002','710102','å¤§åŒåŒº','',0,3305);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010003','710103','ä¸­å±±åŒº','',0,3306);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010004','710104','æ¾å±±åŒº','',0,3307);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010005','710105','å¤§å®‰åŒº','',0,3308);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010006','710106','ä¸‡ååŒº','',0,3309);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010007','710107','ä¿¡ä¹‰åŒº','',0,3310);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010008','710108','å£«æ—åŒº','',0,3311);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010009','710109','åŒ—æŠ•åŒº','',0,3312);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010010','710110','å†…æ¹–åŒº','',0,3313);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010011','710111','å—æ¸¯åŒº','',0,3314);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200010012','710112','æ–‡å±±åŒº','',0,3315);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320002','710200','é«˜é›„å¸‚','',0,3316);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020001','710201','æ–°å…´åŒº','',0,3317);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020002','710202','å‰é‡‘åŒº','',0,3318);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020003','710203','èŠ©é›…åŒº','',0,3319);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020004','710204','ç›åŸ•åŒº','',0,3320);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020005','710205','é¼“å±±åŒº','',0,3321);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020006','710206','æ——æ´¥åŒº','',0,3322);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020007','710207','å‰é•‡åŒº','',0,3323);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020008','710208','ä¸‰æ°‘åŒº','',0,3324);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020009','710209','å·¦è¥åŒº','',0,3325);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020010','710210','æ¥ æ¢“åŒº','',0,3326);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200020011','710211','å°æ¸¯åŒº','',0,3327);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320003','710300','å°å—å¸‚','',0,3328);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030001','710301','ä¸­è¥¿åŒº','',0,3329);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030002','710302','ä¸œåŒº','',0,3330);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030003','710303','å—åŒº','',0,3331);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030004','710304','åŒ—åŒº','',0,3332);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030005','710305','å®‰å¹³åŒº','',0,3333);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200030006','710306','å®‰å—åŒº','',0,3334);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320004','710400','å°ä¸­å¸‚','',0,3335);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040001','710401','ä¸­åŒº','',0,3336);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040002','710402','ä¸œåŒº','',0,3337);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040003','710403','å—åŒº','',0,3338);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040004','710404','è¥¿åŒº','',0,3339);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040005','710405','åŒ—åŒº','',0,3340);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040006','710406','åŒ—å±¯åŒº','',0,3341);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040007','710407','è¥¿å±¯åŒº','',0,3342);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200040008','710408','å—å±¯åŒº','',0,3343);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320005','710500','é‡‘é—¨å¿','',0,3344);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320006','710600','å—æŠ•å¿','',0,3345);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320007','710700','åŸºéš†å¸‚','',0,3346);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070001','710701','ä»çˆ±åŒº','',0,3347);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070002','710702','ä¿¡ä¹‰åŒº','',0,3348);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070003','710703','ä¸­æ­£åŒº','',0,3349);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070004','710704','ä¸­å±±åŒº','',0,3350);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070005','710705','å®‰ä¹åŒº','',0,3351);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070006','710706','æš–æš–åŒº','',0,3352);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200070007','710707','ä¸ƒå µåŒº','',0,3353);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320008','710800','æ–°ç«¹å¸‚','',0,3354);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200080001','710801','ä¸œåŒº','',0,3355);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200080002','710802','åŒ—åŒº','',0,3356);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200080003','710803','é¦™å±±åŒº','',0,3357);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320009','710900','å˜‰ä¹‰å¸‚','',0,3358);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200090001','710901','ä¸œåŒº','',0,3359);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003200090002','710902','è¥¿åŒº','',0,3360);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320010','711100','æ–°åŒ—å¸‚','',0,3361);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320011','711200','å®œå…°å¿','',0,3362);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320012','711300','æ–°ç«¹å¿','',0,3363);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320013','711400','æ¡ƒå›­å¿','',0,3364);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320014','711500','è‹—æ —å¿','',0,3365);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320015','711700','å½°åŒ–å¿','',0,3366);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320016','711900','å˜‰ä¹‰å¿','',0,3367);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320017','712100','äº‘æ—å¿','',0,3368);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320018','712400','å±ä¸œå¿','',0,3369);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320019','712500','å°ä¸œå¿','',0,3370);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320020','712600','èŠ±è²å¿','',0,3371);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100320021','712700','æ¾æ¹–å¿','',0,3372);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010033','810000','é¦™æ¸¯ç‰¹åˆ«è¡Œæ”¿åŒº','',0,3373);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100330001','810100','é¦™æ¸¯å²›','',0,3374);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300010001','810101','ä¸­è¥¿åŒº','',0,3375);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300010002','810102','æ¹¾ä»”','',0,3376);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300010003','810103','ä¸œåŒº','',0,3377);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300010004','810104','å—åŒº','',0,3378);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100330002','810200','ä¹é¾™','',0,3379);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300020001','810201','ä¹é¾™åŸåŒº','',0,3380);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300020002','810202','æ²¹å°–æ—ºåŒº','',0,3381);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300020003','810203','æ·±æ°´åŸ—åŒº','',0,3382);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300020004','810204','é»„å¤§ä»™åŒº','',0,3383);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300020005','810205','è§‚å¡˜åŒº','',0,3384);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100330003','810300','æ–°ç•Œ','',0,3385);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030001','810301','åŒ—åŒº','',0,3386);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030002','810302','å¤§åŸ”åŒº','',0,3387);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030003','810303','æ²™ç”°åŒº','',0,3388);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030004','810304','è¥¿è´¡åŒº','',0,3389);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030005','810305','å…ƒæœ—åŒº','',0,3390);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030006','810306','å±¯é—¨åŒº','',0,3391);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030007','810307','èƒæ¹¾åŒº','',0,3392);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030008','810308','è‘µé’åŒº','',0,3393);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('0001003300030009','810309','ç¦»å²›åŒº','',0,3394);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010034','820000','æ¾³é—¨ç‰¹åˆ«è¡Œæ”¿åŒº','',0,3395);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100340001','820100','æ¾³é—¨åŠå²›','',0,3396);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100340002','820200','ç¦»å²›','',0,3397);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('00010035','990000','æµ·å¤–','',0,3398);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350001','2','Afghanistan/é˜¿å¯Œæ±—','',0,3399);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350002','3','Aland Islands/å¥¥å…°ç¾¤å²›','',0,3400);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350003','4','Alaska(U.S.A)/é˜¿æ‹‰æ–¯åŠ ','',0,3401);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350004','5','Albania/é˜¿å°”å·´å°¼äºš','',0,3402);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350005','6','Algeria/é˜¿å°”åŠåˆ©äºš','',0,3403);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350006','7','American Samoa/ä¸œè¨æ‘©äºš(ç¾)','',0,3404);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350007','8','Andorra/å®‰é“å°”','',0,3405);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350008','9','Angola/å®‰å“¥æ‹‰','',0,3406);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350009','10','Anguilla/å®‰åœ­æ‹‰å²›(è‹±)','',0,3407);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350010','11','Antarctica/å—æ','',0,3408);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350011','12','Antigua and Barbuda/å®‰æç“œå’Œå·´å¸ƒè¾¾','',0,3409);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350012','13','Argentina/é˜¿æ ¹å»·','',0,3410);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350013','14','Armenia/äºšç¾å°¼äºš','',0,3411);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350014','15','Aruba/é˜¿é²å·´å²›','',0,3412);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350015','16','Australia/æ¾³å¤§åˆ©äºš','',0,3413);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350016','17','Austria/å¥¥åœ°åˆ©','',0,3414);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350017','18','Azerbaijan/é˜¿å¡æ‹œç–†','',0,3415);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350018','19','Bahrain/å·´æ—','',0,3416);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350019','20','Bailiwick of Guernsey/æ ¹è¥¿å²›(è‹±)','',0,3417);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350020','21','Bangladesh/å­ŸåŠ æ‹‰å›½','',0,3418);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350021','22','Barbados/å·´å·´å¤šæ–¯','',0,3419);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350022','23','Belarus/ç™½ä¿„ç½—æ–¯','',0,3420);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350023','24','Belgium/æ¯”åˆ©æ—¶','',0,3421);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350024','25','Belize/ä¼¯åˆ©å…¹','',0,3422);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350025','26','Benin/è´å®','',0,3423);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350026','27','Bermuda/ç™¾æ…•å¤§ç¾¤å²›(è‹±)','',0,3424);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350027','28','Bhutan/ä¸ä¸¹','',0,3425);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350028','29','Bolivia/ç»åˆ©ç»´äºš','',0,3426);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350029','30','Bosnia and Herzegovina/æ³¢æ–¯å°¼äºšå’Œé»‘å¡å“¥ç»´é‚£','',0,3427);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350030','31','Botswana/åšèŒ¨ç“¦çº³','',0,3428);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350031','32','Brazil/å·´è¥¿','',0,3429);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350032','33','Bulgaria/ä¿åŠ åˆ©äºš','',0,3430);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350033','34','Burkinafaso/å¸ƒåŸºçº³æ³•ç´¢','',0,3431);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350034','35','Burundi/å¸ƒéš†è¿ª','',0,3432);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350035','36','Cameroon/å–€éº¦éš†','',0,3433);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350036','37','Canada/åŠ æ‹¿å¤§','',0,3434);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350037','38','Canaries Island/åŠ é‚£åˆ©ç¾¤å²›','',0,3435);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350038','39','Cape Verde/ä½›å¾—è§’','',0,3436);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350039','40','Cayman Islands/å¼€æ›¼ç¾¤å²›(è‹±)','',0,3437);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350040','41','Central African Republic/ä¸­é','',0,3438);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350041','42','Chad/ä¹å¾—','',0,3439);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350042','43','Chile/æ™ºåˆ©','',0,3440);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350043','44','Christmas Island/åœ£è¯å²›','',0,3441);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350044','45','Cocos (Keeling) Islands/ç§‘ç§‘æ–¯å²›','',0,3442);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350045','46','Colombia/å“¥ä¼¦æ¯”äºš','',0,3443);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350046','47','Comoros/ç§‘æ‘©ç½—','',0,3444);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350047','48','Congo/åˆšæœ','',0,3445);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350048','49','Cook Island/ç§‘å…‹ç¾¤å²›(æ–°)','',0,3446);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350049','50','Costa Rica/å“¥æ–¯è¾¾é»åŠ ','',0,3447);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350050','51','Croatia/å…‹ç½—åœ°äºš','',0,3448);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350051','52','Cuba/å¤å·´','',0,3449);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350052','53','Cyprus/å¡æµ¦è·¯æ–¯','',0,3450);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350053','54','Czech/æ·å…‹','',0,3451);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350054','55','Democratic Republic of the Congo/åˆšæœ(é‡‘)','',0,3452);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350055','56','Denmark/ä¸¹éº¦','',0,3453);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350056','57','Diego Garcia/è¿ªæˆˆåŠ è¥¿äºšå²›','',0,3454);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350057','58','Djibouti/å‰å¸ƒæ','',0,3455);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350058','59','Dominica/å¤šç±³å°¼å…‹å›½','',0,3456);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350059','60','Dominican Republic/å¤šç±³å°¼åŠ å…±å’Œå›½','',0,3457);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350060','61','Ecuador/å„ç“œå¤šå°”','',0,3458);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350061','62','Egypt/åŸƒåŠ','',0,3459);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350062','63','El Salvador/è¨å°”ç“¦å¤š','',0,3460);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350063','64','Equatorial Guinea/èµ¤é“å‡ å†…äºš','',0,3461);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350064','65','Eritrea/å„ç«‹ç‰¹é‡Œäºš','',0,3462);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350065','66','Estonia/çˆ±æ²™å°¼äºš','',0,3463);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350066','67','Ethiopia/åŸƒå¡ä¿„æ¯”äºš','',0,3464);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350067','68','Falkland Islands (Malvinas)/ç¦å…‹å…°ç¾¤å²›','',0,3465);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350068','69','Faroe Islands/æ³•ç½—ç¾¤å²›(ä¸¹)','',0,3466);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350069','70','Fiji/æ–æµ','',0,3467);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350070','71','Finland/èŠ¬å…°','',0,3468);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350071','72','France/æ³•å›½','',0,3469);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350072','73','French Polynesia/æ³•å±æ³¢é‡Œå°¼è¥¿äºš','',0,3470);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350073','74','Gabon/åŠ è“¬','',0,3471);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350074','75','Gambia/å†ˆæ¯”äºš','',0,3472);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350075','76','Georgia/æ ¼é²å‰äºš','',0,3473);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350076','77','Germany/å¾·å›½','',0,3474);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350077','78','Ghana/åŠ çº³','',0,3475);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350078','79','Gibraltar/ç›´å¸ƒç½—é™€(è‹±)','',0,3476);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350079','80','Greece/å¸Œè…Š','',0,3477);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350080','81','Greenland/æ ¼é™µå…°å²›','',0,3478);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350081','82','Grenada/æ ¼æ—çº³è¾¾','',0,3479);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350082','83','Guadeloupe/ç“œå¾·ç½—æ™®å²›(æ³•)','',0,3480);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350083','84','Guam/å…³å²›(ç¾)','',0,3481);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350084','85','Guatemala/å±åœ°é©¬æ‹‰','',0,3482);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350085','86','Guinea/å‡ å†…äºš','',0,3483);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350086','87','Guinea-bissau/å‡ å†…äºšæ¯”ç»','',0,3484);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350087','88','Guyana/æ³•å±åœ­äºšé‚£','',0,3485);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350088','89','Guyana/åœ­äºšé‚£','',0,3486);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350089','90','Haiti/æµ·åœ°','',0,3487);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350090','91','Honduras/æ´ªéƒ½æ‹‰æ–¯','',0,3488);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350091','92','HunGary/åŒˆç‰™åˆ©','',0,3489);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350092','93','Iceland/å†°å²›','',0,3490);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350093','94','India/å°åº¦','',0,3491);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350094','95','Indonesia/å°åº¦å°¼è¥¿äºš','',0,3492);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350095','96','Iran/ä¼Šéƒ','',0,3493);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350096','97','Iraq/ä¼Šæ‹‰å…‹','',0,3494);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350097','98','Ireland/çˆ±å°”å…°','',0,3495);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350098','99','Isle of Man/é©¬æ©å²›(è‹±)','',0,3496);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350099','100','Israel/ä»¥è‰²åˆ—','',0,3497);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350100','101','Italy/æ„å¤§åˆ©','',0,3498);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350101','102','Ivory Coast/ç§‘ç‰¹è¿ªç“¦','',0,3499);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350102','103','Jamaica/ç‰™ä¹°åŠ ','',0,3500);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350103','104','Japan/æ—¥æœ¬','',0,3501);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350104','105','Jersey/æ³½è¥¿å²›(è‹±)','',0,3502);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350105','106','Jordan/çº¦æ—¦','',0,3503);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350106','107','Kampuchea/æŸ¬åŸ”å¡','',0,3504);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350107','108','Kazakhstan/å“ˆè¨å…‹æ–¯å¦','',0,3505);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350108','109','Kenya/è‚¯å°¼äºš','',0,3506);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350109','110','Kiribati/åŸºé‡Œå·´æ–¯','',0,3507);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350110','111','Kuwait/ç§‘å¨ç‰¹','',0,3508);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350111','112','Kyrgyzstan/å‰å°”å‰æ–¯æ–¯å¦','',0,3509);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350112','113','Laos/è€æŒ','',0,3510);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350113','114','Latvia/æ‹‰è„±ç»´äºš','',0,3511);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350114','115','Lebanon/é»å·´å«©','',0,3512);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350115','116','Lesotho/è±ç´¢æ‰˜','',0,3513);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350116','117','Liberia/åˆ©æ¯”é‡Œäºš','',0,3514);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350117','118','Libya/åˆ©æ¯”äºš','',0,3515);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350118','119','Liechtenstein/åˆ—æ”¯æ•¦å£«ç™»','',0,3516);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350119','120','Lithuania/ç«‹é™¶å®›','',0,3517);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350120','121','Luxembourg/å¢æ£®å ¡','',0,3518);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350121','122','Macedonia/é©¬å…¶é¡¿','',0,3519);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350122','123','Madagascar/é©¬è¾¾åŠ æ–¯åŠ ','',0,3520);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350123','124','Malawi/é©¬æ‹‰ç»´','',0,3521);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350124','125','Malaysia/é©¬æ¥è¥¿äºš','',0,3522);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350125','126','Maldives/é©¬å°”ä»£å¤«','',0,3523);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350126','127','Mali/é©¬é‡Œ','',0,3524);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350127','128','Malta/é©¬è€³ä»–','',0,3525);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350128','129','Marshall Island/é©¬ç»å°”ç¾¤å²›','',0,3526);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350129','130','Martinique/é©¬æå°¼å…‹(æ³•)','',0,3527);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350130','131','Mauritania/æ¯›é‡Œå¡”å°¼äºš','',0,3528);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350131','132','Mauritius/æ¯›é‡Œæ±‚æ–¯','',0,3529);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350132','133','Mayotte/é©¬çº¦ç‰¹å²›','',0,3530);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350133','134','Mexico/å¢¨è¥¿å“¥','',0,3531);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350134','135','Micronesia/å¯†å…‹ç½—å°¼è¥¿äºš(ç¾)','',0,3532);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350135','136','Midway Island/ä¸­é€”å²›(ç¾)','',0,3533);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350136','137','Monaco/æ‘©çº³å“¥','',0,3534);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350137','138','Mongolia/è’™å¤','',0,3535);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350138','139','Montenegro/é»‘å±±','',0,3536);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350139','140','Montserrat/è’™ç‰¹å¡æ‹‰ç‰¹å²›(è‹±)','',0,3537);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350140','141','Morocco/æ‘©æ´›å“¥','',0,3538);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350141','142','Mozambique/è«æ¡‘æ¯”å…‹','',0,3539);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350142','143','Myanmar/ç¼…ç”¸','',0,3540);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350143','144','Namibia/çº³ç±³æ¯”äºš','',0,3541);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350144','145','Nauru/ç‘™é²','',0,3542);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350145','146','Nepal/å°¼æ³Šå°”','',0,3543);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350146','147','Netherlands/è·å…°','',0,3544);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350147','148','Netherlands Antilles/è·å±å®‰çš„åˆ—æ–¯ç¾¤å²›','',0,3545);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350148','149','New Caledonia/æ–°å–€é‡Œå¤šå°¼äºšç¾¤å²›(æ³•)','',0,3546);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350149','150','New Zealand/æ–°è¥¿å…°','',0,3547);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350150','151','Nicaragua/å°¼åŠ æ‹‰ç“œ','',0,3548);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350151','152','Niger/å°¼æ—¥å°”','',0,3549);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350152','153','Nigeria/å°¼æ—¥åˆ©äºš','',0,3550);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350153','154','Niue/çº½åŸƒå²›(æ–°)','',0,3551);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350154','155','Norfolk Island/è¯ºç¦å…‹å²›(æ¾³)','',0,3552);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350155','156','North Korea/æœé²œ','',0,3553);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350156','157','Northern Mariana Islands/é©¬é‡Œäºšçº³ç¾¤å²›','',0,3554);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350157','158','Norway/æŒªå¨','',0,3555);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350158','159','Oman/é˜¿æ›¼','',0,3556);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350159','160','Pakistan/å·´åŸºæ–¯å¦','',0,3557);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350160','161','Palau/å¸•åŠ³(ç¾)','',0,3558);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350161','162','Panama/å·´æ‹¿é©¬','',0,3559);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350162','163','Papua New Guinea/å·´å¸ƒäºšæ–°å‡ å†…äºš','',0,3560);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350163','164','Paraguay/å·´æ‹‰åœ­','',0,3561);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350164','165','Peru/ç§˜é²','',0,3562);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350165','166','Philippines/è²å¾‹å®¾','',0,3563);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350166','167','Poland/æ³¢å…°','',0,3564);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350167','168','Portugal/è‘¡è„ç‰™','',0,3565);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350168','169','Puerto Rico/æ³¢å¤šé»å„(ç¾)','',0,3566);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350169','170','Qatar/å¡å¡”å°”','',0,3567);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350170','171','Republic of Moldova/æ‘©å°”å¤šç“¦','',0,3568);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350171','172','Reunion/ç•™å°¼æ±ªå²›','',0,3569);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350172','173','Romania/ç½—é©¬å°¼äºš','',0,3570);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350173','174','Russian Federation/ä¿„ç½—æ–¯','',0,3571);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350174','175','Rwanda/å¢æ—ºè¾¾','',0,3572);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350175','176','Saint Helena, Ascension and Tristan da Cunha/é˜¿æ£®æ¾(è‹±)','',0,3573);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350176','177','Saint Helena, Ascension and Tristan da Cunha/åœ£èµ«å‹’æ‹¿','',0,3574);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350177','178','Saint Kitts and Nevis/åœ£å…‹é‡Œæ–¯æ‰˜å¼—å’Œå°¼ç»´æ–¯','',0,3575);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350178','179','Saint Lucia/åœ£å¢è¥¿äºš','',0,3576);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350179','180','Saint Pierre and Miquelon/åœ£çš®åŸƒå°”å²›åŠå¯†å…‹éš†å²›','',0,3577);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350180','181','Saint Vincent and the Grenadines/åœ£æ–‡æ£®ç‰¹å²›(è‹±)','',0,3578);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350181','182','Samoa/è¥¿è¨æ‘©äºš','',0,3579);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350182','183','San Marino/åœ£é©¬åŠ›è¯º','',0,3580);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350183','184','Sao Tome and Principe/åœ£å¤šç¾å’Œæ™®æ—è¥¿æ¯”','',0,3581);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350184','185','Saudi Arabia/æ²™ç‰¹é˜¿æ‹‰ä¼¯','',0,3582);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350185','186','Senegal/å¡å†…åŠ å°”','',0,3583);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350186','187','Serbia/å¡å°”ç»´äºš','',0,3584);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350187','188','Seychelles/å¡èˆŒå°”','',0,3585);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350188','189','Sierra Leone/å¡æ‹‰åˆ©æ˜‚','',0,3586);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350189','190','Singapore/æ–°åŠ å¡','',0,3587);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350190','191','Sint Maarten/åœ£é©¬ä¸(è·)','',0,3588);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350191','192','Slovakia/æ–¯æ´›ä¼å…‹','',0,3589);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350192','193','Slovenia/æ–¯æ´›æ–‡å°¼äºš','',0,3590);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350193','194','Solomon Islands/æ‰€ç½—é—¨ç¾¤å²›','',0,3591);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350194','195','Somalia/ç´¢é©¬é‡Œ','',0,3592);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350195','196','South Africa/å—é','',0,3593);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350196','197','South Georgia and The South Sandwich Islands/å—ä¹”æ²»äºšä¸å—æ¡‘å¨å¥‡ç¾¤å²›','',0,3594);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350197','198','South korea/éŸ©å›½','',0,3595);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350198','199','Spain/è¥¿ç­ç‰™','',0,3596);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350199','200','Sri Lanka/æ–¯é‡Œå…°å¡','',0,3597);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350200','201','Sudan/è‹ä¸¹','',0,3598);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350201','202','Suriname/è‹é‡Œå—','',0,3599);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350202','203','Svalbard and Jan Mayen/æ–¯ç“¦å°”å·´ç¾¤å²›(æŒª)','',0,3600);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350203','204','Swaziland/æ–¯å¨å£«å…°','',0,3601);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350204','205','Sweden/ç‘å…¸','',0,3602);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350205','206','Switzerland/ç‘å£«','',0,3603);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350206','207','Syria/å™åˆ©äºš','',0,3604);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350207','208','Tajikistan/å¡”å‰å…‹æ–¯å¦','',0,3605);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350208','209','Thailand/æ³°å›½','',0,3606);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350209','210','The Commonwealth of The Bahamas/å·´å“ˆé©¬å›½','',0,3607);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350210','211','The Vatican City State/æ¢µè’‚å†ˆ','',0,3608);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350211','212','Timor-leste/ä¸œå¸æ±¶','',0,3609);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350212','213','Togo/å¤šå“¥','',0,3610);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350213','214','Tokelau/æ‰˜å…‹åŠ³ç¾¤å²›(æ–°)','',0,3611);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350214','215','Tonga/æ±¤åŠ ','',0,3612);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350215','216','Trinidad and Tobago/ç‰¹ç«‹å°¼è¾¾å’Œå¤šå·´å“¥','',0,3613);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350216','217','Tunisia/çªå°¼æ–¯','',0,3614);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350217','218','Turkey/åœŸè€³å…¶','',0,3615);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350218','219','Turkmenistan/åœŸåº“æ›¼æ–¯å¦','',0,3616);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350219','220','Turks and Caicos Islands/ç‰¹å…‹æ–¯å’Œå‡¯ç§‘æ–¯ç¾¤å²›(è‹±)','',0,3617);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350220','221','Tuvalu/å›¾ç“¦å¢','',0,3618);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350221','222','Uganda/ä¹Œå¹²è¾¾','',0,3619);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350222','223','Ukraine/ä¹Œå…‹å…°','',0,3620);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350223','224','United Arab Emirates/é˜¿æ‹‰ä¼¯è”åˆé…‹é•¿å›½','',0,3621);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350224','225','United Kingdom/è‹±å›½','',0,3622);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350225','226','United Republic of Tanzania/å¦æ¡‘å°¼äºš','',0,3623);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350226','227','United States Minor Outlying Islands/ç¾å›½æœ¬åœŸå¤–å°å²›å±¿','',0,3624);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350227','228','United States of America/ç¾å›½','',0,3625);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350228','229','Uruguay/ä¹Œæ‹‰åœ­','',0,3626);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350229','230','Uzbekistan/ä¹Œå…¹åˆ«å…‹æ–¯å¦','',0,3627);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350230','231','Vanuatu/ç“¦åŠªé˜¿å›¾','',0,3628);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350231','232','Venezuela/å§”å†…ç‘æ‹‰','',0,3629);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350232','233','Vietnam/è¶Šå—','',0,3630);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350233','234','Virgin Islands, British/ç»´å°”äº¬ç¾¤å²›(è‹±)','',0,3631);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350234','235','Virgin Islands, U.S./ç»´å°”äº¬ç¾¤å²›(ç¾)','',0,3632);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350235','236','Wallis And Futuna/ç“¦é‡Œæ–¯å’Œå¯Œå£«é‚£ç¾¤å²›(æ³•)','',0,3633);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350236','237','Western sahara/è¥¿æ’’å“ˆæ‹‰','',0,3634);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350237','238','Yemen/ä¹Ÿé—¨','',0,3635);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350238','239','Yugoslavia/å—æ–¯æ‹‰å¤«','',0,3636);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350239','240','Zambia/èµæ¯”äºš','',0,3637);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350240','241','Zanzibar/æ¡‘ç»™å·´å°”','',0,3638);
insert  into `sys_dict`(`id`,`dkey`,`dval`,`txt`,`status`,`location`) values ('000100350241','242','Zimbabwe/æ´¥å·´å¸ƒéŸ¦','',0,3639);

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `subtype` int(32) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `button` varchar(1000) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001','ç³»ç»Ÿç®¡ç†','',0,0,0,NULL,NULL,NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('00010001','ç³»ç»Ÿç®¡ç†','',0,0,16,NULL,NULL,NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010001','æœºæ„ç®¡ç†','/private/sys/unit',0,0,17,NULL,'å¢åŠ /BtnAdd;åˆ é™¤/BtnDel;ä¿®æ”¹/BtnUpdate;æ’åº/BtnSort;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010002','ç”¨æˆ·ç®¡ç†','/private/sys/user',0,0,18,NULL,'å¢åŠ /BtnAdd;ä¿®æ”¹/BtnUpdate;åˆ é™¤/BtnDel;ç¦ç”¨/BtnLocked;å¯ç”¨/BtnUnlocked;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010003','è§’è‰²ç®¡ç†','/private/sys/role',0,0,19,NULL,'å¢åŠ /BtnAdd;åˆ é™¤/BtnDel;ä¿®æ”¹/BtnUpdate;æ·»åŠ ç”¨æˆ·åˆ°è§’è‰²/BtnAddRole;ä»è§’è‰²ä¸­åˆ é™¤ç”¨æˆ·/BtnDelRole;åˆ†é…æƒé™/BtnMenu;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010004','èµ„æºç®¡ç†','/private/sys/res',0,0,20,NULL,'å¢åŠ /BtnAdd;åˆ é™¤/BtnDel;ä¿®æ”¹/BtnUpdate;æ’åº/BtnSort;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010005','å‚æ•°é…ç½®','/private/sys/config',0,0,21,NULL,'æ–°å»º/BtnAdd;ç¼–è¾‘/BtnUpdate;åˆ é™¤/BtnDel;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010006','æ•°å­—å­—å…¸','/private/sys/dict',0,0,22,NULL,'å¢åŠ /BtnAdd;ä¿®æ”¹/BtnUpdate;åˆ é™¤/BtnDel;æ’åº/BtnPaixu;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010007','å®šæ—¶ä»»åŠ¡','/private/sys/task',0,0,23,NULL,'æ–°å»º/BtnAdd;ç¼–è¾‘/BtnUpdate;åˆ é™¤/BtnDel;',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010008','è®¿é—®æ§åˆ¶','/private/sys/safe',0,0,24,NULL,'',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100010009','ç™»é™†æ—¥å¿—','/private/sys/user/log',0,0,25,NULL,'',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('00010002','å·¥ä½œæµ','',0,0,1,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100020001','æµç¨‹ç®¡ç†','',0,0,2,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200010001','æµç¨‹å®šä¹‰','/private/wf/model',0,0,3,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200010002','æµç¨‹å®ä¾‹','/private/wf/flow',0,0,5,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200010003','æµç¨‹ä»»åŠ¡','/private/wf/task',0,0,6,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200010004','æµç¨‹éƒ¨ç½²','/private/wf/deploy',0,0,4,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100020003','å†å²','',0,0,7,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200030001','å†å²å®ä¾‹','/private/wf/history/flow',0,0,8,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200030002','å†å²èŠ‚ç‚¹','/private/wf/history/node',0,0,9,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('0001000200030003','å†å²ä»»åŠ¡','/private/wf/history/task',0,0,10,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('00010003','æˆ‘çš„æµç¨‹','',0,0,11,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100030001','æˆ‘çš„ç”³è¯·','',0,0,12,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100030002','å¾…æˆ‘å®¡æ‰¹','',0,0,13,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100030003','ç»æˆ‘å®¡æ‰¹','',0,0,14,' ','',NULL);
insert  into `sys_resource`(`id`,`name`,`url`,`state`,`subtype`,`location`,`descript`,`button`,`style`) values ('000100030004','å¾…æˆ‘é˜…è¯»','',0,0,15,' ','',NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `unitid` varchar(50) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL,
  `pid` int(32) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`unitid`,`descript`,`pid`,`location`) values (1,'å…¬å…±è§’è‰²',NULL,NULL,0,0);
insert  into `sys_role`(`id`,`name`,`unitid`,`descript`,`pid`,`location`) values (2,'ç³»ç»Ÿç®¡ç†',NULL,NULL,0,0);
insert  into `sys_role`(`id`,`name`,`unitid`,`descript`,`pid`,`location`) values (3,'å·¥ä½œæµ','','',0,0);

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `roleid` int(32) DEFAULT NULL,
  `resourceid` varchar(100) DEFAULT NULL,
  `button` varchar(1000) DEFAULT NULL,
  UNIQUE KEY `INDEX_ROLERESOURCE` (`roleid`,`resourceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_resource` */

insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'00010002','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100020001','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200010001','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200010004','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200010002','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200010003','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100020003','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200030001','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200030002','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'0001000200030003','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'00010001','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010001','BtnAdd,BtnDel,BtnUpdate,BtnSort,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010002','BtnAdd,BtnUpdate,BtnDel,BtnLocked,BtnUnlocked,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010003','BtnAdd,BtnDel,BtnUpdate,BtnAddRole,BtnDelRole,BtnMenu,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010004','BtnAdd,BtnDel,BtnUpdate,BtnSort,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010005','BtnAdd,BtnUpdate,BtnDel,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010006','BtnAdd,BtnUpdate,BtnDel,BtnPaixu,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010007','BtnAdd,BtnUpdate,BtnDel,');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010008','');
insert  into `sys_role_resource`(`roleid`,`resourceid`,`button`) values (2,'000100010009','');

/*Table structure for table `sys_safeconfig` */

DROP TABLE IF EXISTS `sys_safeconfig`;

CREATE TABLE `sys_safeconfig` (
  `id` int(32) NOT NULL DEFAULT '0',
  `type` int(32) DEFAULT NULL,
  `state` int(32) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_safeconfig` */

insert  into `sys_safeconfig`(`id`,`type`,`state`,`note`) values (1,1,1,'10.10.10.1');
insert  into `sys_safeconfig`(`id`,`type`,`state`,`note`) values (2,0,0,'10.10.10.2');

/*Table structure for table `sys_task` */

DROP TABLE IF EXISTS `sys_task`;

CREATE TABLE `sys_task` (
  `task_id` int(32) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(100) DEFAULT NULL,
  `task_type` int(32) DEFAULT NULL,
  `task_name` varchar(50) DEFAULT NULL,
  `job_class` varchar(100) DEFAULT NULL,
  `execycle` int(32) DEFAULT NULL,
  `day_of_month` int(32) DEFAULT NULL,
  `day_of_week` int(32) DEFAULT NULL,
  `hour` int(32) DEFAULT NULL,
  `minute` int(32) DEFAULT NULL,
  `interval_hour` int(32) DEFAULT NULL,
  `interval_minute` int(32) DEFAULT NULL,
  `task_interval_unit` int(32) DEFAULT NULL,
  `cron_expression` varchar(20) DEFAULT NULL,
  `is_enable` int(32) DEFAULT NULL,
  `task_remark` varchar(255) DEFAULT NULL,
  `user_id` bigint(64) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `param_value` varchar(100) DEFAULT NULL,
  `task_interval` int(32) DEFAULT NULL,
  `task_threadnum` int(32) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_task` */

/*Table structure for table `sys_unit` */

DROP TABLE IF EXISTS `sys_unit`;

CREATE TABLE `sys_unit` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `unitcode` varchar(20) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id`,`name`,`unitcode`,`descript`,`address`,`telephone`,`email`,`website`,`location`) values ('0001','ç³»ç»Ÿç®¡ç†',NULL,NULL,NULL,NULL,NULL,NULL,0);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(120) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `unitid` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `location` int(32) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `logintype` int(32) DEFAULT NULL,
  `logintime` varchar(20) DEFAULT NULL,
  `loginip` varchar(50) DEFAULT NULL,
  `logincount` int(32) DEFAULT NULL,
  `loginresid` varchar(100) DEFAULT NULL,
  `linkqq` varchar(20) DEFAULT NULL,
  `linkweb` varchar(100) DEFAULT NULL,
  `linkcity` varchar(100) DEFAULT NULL,
  `money` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_LONGINNAME` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`loginname`,`realname`,`unitid`,`password`,`salt`,`state`,`descript`,`position`,`address`,`telephone`,`mobile`,`email`,`location`,`style`,`logintype`,`logintime`,`loginip`,`logincount`,`loginresid`,`linkqq`,`linkweb`,`linkcity`,`money`) values (1,'superadmin','è¶…çº§ç®¡ç†å‘˜','0001','vjKKjPauF/aa7ZrQv8wRUc8uTvXjnLwL7ehQrSCbYjw=','y2PcU2V8negTxhAziZs9+Q==',0,NULL,NULL,NULL,NULL,NULL,'wizzer@qq.com',0,NULL,0,'2015-06-08 16:18:40','127.0.0.1',399,NULL,NULL,NULL,NULL,0);
insert  into `sys_user`(`id`,`loginname`,`realname`,`unitid`,`password`,`salt`,`state`,`descript`,`position`,`address`,`telephone`,`mobile`,`email`,`location`,`style`,`logintype`,`logintime`,`loginip`,`logincount`,`loginresid`,`linkqq`,`linkweb`,`linkcity`,`money`) values (2,'test1','test1','0001','eWLyBHQQCgBdh4YSd6gCt1Ya8kzfflHSYHUFoJBqob0=','iC7DW2izYNazD25cTA+1tQ==',0,'',NULL,'','','','',0,NULL,0,'2015-04-13 09:52:05',NULL,0,NULL,'','',NULL,0);
insert  into `sys_user`(`id`,`loginname`,`realname`,`unitid`,`password`,`salt`,`state`,`descript`,`position`,`address`,`telephone`,`mobile`,`email`,`location`,`style`,`logintype`,`logintime`,`loginip`,`logincount`,`loginresid`,`linkqq`,`linkweb`,`linkcity`,`money`) values (3,'test2','test2','0001','HjLHN67r1UhZId/nHPXrpoIrsC5FVsL8EjnOXWrgveE=','DHG4R450mKDUc0ckfGXeRA==',0,'',NULL,'','','','',0,NULL,0,'2015-04-13 09:52:29',NULL,0,NULL,'','',NULL,0);
insert  into `sys_user`(`id`,`loginname`,`realname`,`unitid`,`password`,`salt`,`state`,`descript`,`position`,`address`,`telephone`,`mobile`,`email`,`location`,`style`,`logintype`,`logintime`,`loginip`,`logincount`,`loginresid`,`linkqq`,`linkweb`,`linkcity`,`money`) values (4,'test3','test3','0001','AyQx6LYSRek/v3rIqaymdvqZZoMp5aS59BShX860Qt8=','VXTgLOUSyeXPvZ1C8nyqOQ==',0,'',NULL,'','','','',0,NULL,0,'2015-04-28 15:14:17',NULL,0,NULL,'','',NULL,0);

/*Table structure for table `sys_user_log` */

DROP TABLE IF EXISTS `sys_user_log`;

CREATE TABLE `sys_user_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `userid` bigint(64) DEFAULT NULL,
  `type` int(32) DEFAULT NULL,
  `loginname` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `logintime` varchar(20) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_log` */

insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (1,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-02 14:06:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (2,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-02 15:49:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (3,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-02 16:42:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (4,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 13:38:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (5,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 13:41:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (6,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 13:48:28','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (7,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 13:57:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (8,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:00:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (9,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:06:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (10,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:08:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (11,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:11:26','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (12,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:14:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (13,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:17:27','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (14,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:20:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (15,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:21:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (16,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 14:22:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (17,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:28:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (18,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:34:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (19,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:39:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (20,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:41:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (21,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:45:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (22,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:53:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (23,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 15:55:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (24,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:00:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (25,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:02:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (26,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:08:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (27,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:22:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (28,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:38:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (29,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:40:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (30,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:46:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (31,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 16:48:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (32,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 17:01:59','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (33,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 17:25:00','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (34,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 17:39:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (35,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-09 17:47:39','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (36,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:10:48','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (37,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:14:59','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (38,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:31:11','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (39,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:46:06','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (40,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:50:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (41,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 09:58:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (42,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 10:06:32','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (43,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 13:24:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (44,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 15:37:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (45,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-10 17:03:50','192.168.60.159');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (46,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-13 09:15:30','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (47,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-13 11:08:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (48,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-13 11:26:30','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (49,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-13 13:14:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (50,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 09:25:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (51,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 10:02:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (52,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 10:07:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (53,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:04:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (54,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:11:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (55,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:14:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (56,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:18:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (57,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:19:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (58,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:35:06','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (59,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 15:41:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (60,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 16:08:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (61,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 16:12:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (62,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 16:37:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (63,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 17:00:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (64,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-15 17:57:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (65,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-16 09:07:32','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (66,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-16 10:41:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (67,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-16 10:49:30','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (68,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-16 14:16:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (69,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-17 09:46:20','192.168.60.159');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (70,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-17 15:16:32','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (71,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-17 16:25:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (72,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-17 17:09:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (73,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-17 17:16:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (74,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 09:19:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (75,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 09:45:37','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (76,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 10:08:37','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (77,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 14:04:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (78,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 14:12:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (79,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 14:52:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (80,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 16:01:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (81,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 16:15:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (82,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 16:19:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (83,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 16:46:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (84,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:06:43','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (85,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:23:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (86,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:31:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (87,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:43:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (88,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:45:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (89,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:55:37','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (90,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 17:58:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (91,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-20 18:00:01','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (92,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 09:14:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (93,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 09:41:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (94,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 09:42:28','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (95,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 10:10:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (96,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 10:14:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (97,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 10:29:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (98,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 11:22:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (99,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 11:23:48','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (100,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 11:29:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (101,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 11:48:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (102,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 11:58:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (103,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 12:00:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (104,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 13:14:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (105,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 13:52:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (106,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:02:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (107,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:08:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (108,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:23:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (109,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:37:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (110,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:58:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (111,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 14:59:19','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (112,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 15:01:28','192.168.60.158');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (113,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 15:28:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (114,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 15:36:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (115,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 15:42:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (116,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 15:47:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (117,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 16:02:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (118,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 16:24:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (119,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 16:27:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (120,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 16:55:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (121,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 16:56:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (122,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 17:02:47','192.168.60.158');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (123,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-21 17:03:36','192.168.60.158');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (124,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 09:15:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (125,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 09:56:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (126,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 10:49:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (127,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 10:53:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (128,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 15:09:28','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (129,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 15:19:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (130,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 15:37:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (131,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 15:53:55','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (132,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 16:06:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (133,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 16:09:26','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (134,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 16:44:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (135,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 16:49:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (136,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 17:17:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (137,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-22 17:22:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (138,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 09:44:37','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (139,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 09:56:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (140,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 10:49:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (141,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 11:39:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (142,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 11:47:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (143,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 12:39:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (144,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 14:46:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (145,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 15:15:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (146,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 16:21:38','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (147,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 16:23:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (148,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 16:26:32','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (149,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 17:05:11','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (150,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 17:34:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (151,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 17:51:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (152,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-23 18:03:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (153,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 09:49:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (154,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 11:40:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (155,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 13:57:10','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (156,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 15:17:10','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (157,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 15:45:38','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (158,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 16:13:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (159,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 17:12:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (160,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 17:32:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (161,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-24 17:41:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (162,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-25 10:19:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (163,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-25 10:35:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (164,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-25 11:02:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (165,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-25 14:00:01','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (166,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 09:26:11','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (167,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 11:06:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (168,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 12:25:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (169,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 12:28:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (170,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 13:07:48','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (171,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 13:34:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (172,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 17:55:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (173,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 17:57:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (174,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-27 17:58:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (175,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 10:21:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (176,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 11:20:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (177,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 12:48:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (178,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 12:58:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (179,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 13:04:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (180,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 13:30:10','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (181,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 14:20:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (182,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 14:57:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (183,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 15:13:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (184,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-28 15:28:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (185,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-29 08:59:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (186,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-29 14:14:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (187,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-29 16:18:27','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (188,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-04-30 11:48:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (189,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 09:20:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (190,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 11:54:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (191,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 12:02:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (192,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:04:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (193,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:11:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (194,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:13:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (195,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:14:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (196,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:19:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (197,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 13:20:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (198,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-04 15:47:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (199,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-05 14:40:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (200,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-05 17:49:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (201,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 10:04:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (202,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 13:19:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (203,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 14:25:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (204,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 15:59:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (205,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 16:01:59','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (206,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 17:41:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (207,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-06 18:19:11','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (208,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 09:50:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (209,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 09:55:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (210,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 10:12:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (211,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 10:27:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (212,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 10:45:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (213,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 11:31:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (214,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 13:04:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (215,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-07 14:00:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (216,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-08 09:08:21','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (217,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-08 09:37:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (218,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 14:00:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (219,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 14:13:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (220,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 14:30:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (221,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 15:42:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (222,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 16:21:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (223,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-11 16:26:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (224,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 09:28:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (225,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 10:22:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (226,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 10:26:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (227,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 10:28:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (228,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 10:50:39','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (229,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 10:50:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (230,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 11:36:00','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (231,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 11:49:26','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (232,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 13:16:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (233,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 13:26:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (234,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 14:49:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (235,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 15:59:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (236,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-12 16:13:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (237,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-13 10:16:11','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (238,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 10:52:14','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (239,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 11:43:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (240,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 13:29:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (241,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 13:58:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (242,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:13:32','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (243,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:21:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (244,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:34:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (245,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:43:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (246,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:53:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (247,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 14:57:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (248,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 15:11:39','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (249,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 15:14:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (250,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 17:00:55','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (251,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-15 17:46:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (252,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 09:31:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (253,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 11:58:05','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (254,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 14:03:55','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (255,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 14:08:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (256,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 14:28:04','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (257,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 14:33:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (258,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 14:52:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (259,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 15:19:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (260,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 15:21:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (261,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-18 17:03:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (262,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 09:25:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (263,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 09:28:02','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (264,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 10:20:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (265,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 10:58:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (266,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 13:12:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (267,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 13:45:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (268,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 13:47:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (269,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 14:01:30','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (270,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 15:15:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (271,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 16:35:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (272,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 16:38:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (273,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 16:48:09','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (274,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 16:58:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (275,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 17:09:00','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (276,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 17:17:19','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (277,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 17:32:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (278,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-19 17:37:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (279,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 09:04:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (280,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 09:07:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (281,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 09:09:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (282,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 09:19:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (283,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:04:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (284,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:12:06','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (285,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:32:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (286,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:36:15','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (287,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:45:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (288,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 10:58:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (289,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 11:10:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (290,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 11:23:55','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (291,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 11:27:43','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (292,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 11:36:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (293,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 11:36:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (294,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 13:12:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (295,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 13:29:31','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (296,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 13:59:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (297,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 14:10:12','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (298,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 14:12:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (299,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 14:31:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (300,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 14:54:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (301,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 14:58:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (302,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 15:10:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (303,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 15:34:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (304,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 15:59:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (305,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 16:05:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (306,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 16:32:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (307,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:07:38','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (308,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:11:06','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (309,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:15:23','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (310,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:38:43','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (311,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:42:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (312,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:46:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (313,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:49:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (314,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-20 17:56:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (315,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 10:05:39','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (316,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 10:12:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (317,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 13:30:15','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (318,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 13:35:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (319,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 13:37:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (320,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 13:43:00','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (321,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:02:15','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (322,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:05:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (323,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:23:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (324,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:36:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (325,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:40:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (326,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:43:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (327,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:56:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (328,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 14:59:55','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (329,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:21:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (330,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:31:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (331,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:35:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (332,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:41:35','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (333,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:45:48','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (334,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:46:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (335,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 15:52:33','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (336,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:01:15','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (337,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:08:59','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (338,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:12:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (339,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:14:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (340,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:17:28','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (341,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:40:18','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (342,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:41:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (343,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:44:10','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (344,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:52:45','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (345,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 16:57:28','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (346,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:04:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (347,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:15:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (348,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:20:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (349,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:23:01','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (350,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:28:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (351,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:31:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (352,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:33:34','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (353,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:37:45','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (354,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:50:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (355,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-21 17:54:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (356,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 09:07:24','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (357,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 09:08:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (358,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 09:57:06','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (359,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 10:04:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (360,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 10:56:54','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (361,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 11:25:13','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (362,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 11:48:53','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (363,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 13:07:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (364,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 13:16:48','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (365,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 13:42:56','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (366,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 13:54:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (367,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 14:22:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (368,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 15:05:10','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (369,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 16:57:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (370,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-22 16:59:38','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (371,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-25 11:23:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (372,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-25 13:57:50','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (373,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-25 15:10:03','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (374,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-25 16:44:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (375,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-25 17:18:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (376,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 14:02:25','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (377,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 14:41:20','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (378,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 14:44:58','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (379,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 14:54:52','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (380,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 15:17:42','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (381,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-26 15:37:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (382,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 11:35:44','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (383,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 11:59:36','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (384,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 13:14:57','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (385,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 13:26:49','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (386,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 13:31:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (387,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 13:35:41','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (388,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 13:44:26','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (389,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:03:07','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (390,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:08:51','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (391,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:17:47','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (392,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:22:40','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (393,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:26:29','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (394,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:27:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (395,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:34:08','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (396,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 14:42:17','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (397,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 15:13:46','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (398,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-27 15:21:16','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (399,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-29 13:48:22','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (400,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-05-30 14:38:43','127.0.0.1');
insert  into `sys_user_log`(`id`,`userid`,`type`,`loginname`,`realname`,`note`,`logintime`,`loginip`) values (401,1,0,'superadmin','è¶…çº§ç®¡ç†å‘˜',NULL,'2015-06-08 16:18:40','127.0.0.1');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `userid` bigint(64) DEFAULT NULL,
  `roleid` int(32) DEFAULT NULL,
  UNIQUE KEY `INDEX_USERROLE` (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`userid`,`roleid`) values (1,2);
insert  into `sys_user_role`(`userid`,`roleid`) values (2,1);
insert  into `sys_user_role`(`userid`,`roleid`) values (2,2);
insert  into `sys_user_role`(`userid`,`roleid`) values (3,1);
insert  into `sys_user_role`(`userid`,`roleid`) values (3,2);
insert  into `sys_user_role`(`userid`,`roleid`) values (4,2);
insert  into `sys_user_role`(`userid`,`roleid`) values (4,3);

/*Table structure for table `wf_config_ip` */

DROP TABLE IF EXISTS `wf_config_ip`;

CREATE TABLE `wf_config_ip` (
  `listip` varchar(20) NOT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `createuserid` varchar(20) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`listip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wf_config_ip` */

/*Table structure for table `wf_form_dbconfig` */

DROP TABLE IF EXISTS `wf_form_dbconfig`;

CREATE TABLE `wf_form_dbconfig` (
  `sys_name` varchar(50) NOT NULL,
  `sys_desc` varchar(100) DEFAULT NULL,
  `db_json` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`sys_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wf_form_dbconfig` */

insert  into `wf_form_dbconfig`(`sys_name`,`sys_desc`,`db_json`) values ('test','æµ‹è¯•ä¸šåŠ¡ç³»ç»Ÿ','{url:\"jdbc:mysql://127.0.0.1:3306/form?useUnicode=true&characterEncoding=utf8\",username:\"root\",password:\"pass\",maxActive:\"2\",testWhileIdle:\"true\",			validationQuery:\"SELECT 1\",removeAbandoned:\"true\",removeAbandonedTimeout:\"1800\"}');

/*Table structure for table `wf_hi_activity` */

DROP TABLE IF EXISTS `wf_hi_activity`;

CREATE TABLE `wf_hi_activity` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `processInstanceId` varchar(64) DEFAULT NULL,
  `processDefinitionId` varchar(64) DEFAULT NULL,
  `executionId` varchar(64) DEFAULT NULL,
  `nowActivityId` varchar(255) DEFAULT NULL,
  `nextActivityId` varchar(255) DEFAULT NULL,
  `jsonInfo` varchar(1000) DEFAULT NULL,
  `isAfter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wf_hi_activity` */

/*Table structure for table `wf_model_category` */

DROP TABLE IF EXISTS `wf_model_category`;

CREATE TABLE `wf_model_category` (
  `id` varchar(300) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `isprivate` double DEFAULT NULL,
  `location` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wf_model_category` */

insert  into `wf_model_category`(`id`,`name`,`isprivate`,`location`) values ('0001','é»˜è®¤åˆ†ç±»',0,0);
insert  into `wf_model_category`(`id`,`name`,`isprivate`,`location`) values ('0002','1212',0,1);

/*Table structure for table `wf_test` */

DROP TABLE IF EXISTS `wf_test`;

CREATE TABLE `wf_test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLOW_ID` varchar(50) DEFAULT NULL,
  `TASK_ID` varchar(50) DEFAULT NULL,
  `DAY` int(11) DEFAULT NULL,
  `REASON` varchar(500) DEFAULT NULL,
  `ADD_UID` bigint(32) DEFAULT NULL,
  `ADD_TIME` varchar(20) DEFAULT NULL,
  `NOTE` varchar(500) DEFAULT NULL,
  `CHECK_UID` bigint(32) DEFAULT NULL,
  `CHECK_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wf_test` */

insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (1,'250001','250005',1,'å›°å•Šå˜¿å˜¿',1,'2015-04-28 14:57:34',NULL,0,NULL);
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (2,'257501','257509',1212,'1',0,'2015-04-28 15:23:45','ä¸åŒæ„',1,'2015-04-28 15:28:20');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (3,'260007','260023',1212,'1121212122--12121',0,'2015-04-28 15:31:25','åŒæ„',1,'2015-04-28 15:31:59');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (4,'260027','260035',121221,'1222',0,'2015-04-28 15:33:34','xxxxx',1,'2015-04-28 15:42:42');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (5,'260046','260059',1,'2',1,'2015-04-29 09:46:32','3',0,'2015-04-28 16:15:46');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (6,'270001','270005',0,NULL,0,'2015-05-04 15:30:09',NULL,0,NULL);
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (7,'270012','270020',3,'3333',0,'2015-05-04 15:31:54','3333333333333',0,'2015-05-04 15:32:33');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (8,'270037','270045',3,'5',0,'2015-05-04 15:46:27','6666666',0,'2015-05-04 15:46:52');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (9,'272510','272523',333,'4444444----',0,'2015-05-05 14:51:35','eeeee',0,'2015-05-05 14:50:28');
insert  into `wf_test`(`ID`,`FLOW_ID`,`TASK_ID`,`DAY`,`REASON`,`ADD_UID`,`ADD_TIME`,`NOTE`,`CHECK_UID`,`CHECK_TIME`) values (10,'285008','285017',1212,'1313131313',0,'2015-05-06 17:55:29','5',0,'2015-05-06 17:55:55');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
