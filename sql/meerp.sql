-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: meerp
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(32) NOT NULL,
  `cn_name` varchar(128) NOT NULL,
  `en_name` varchar(128) DEFAULT NULL,
  `description` varchar(10000) NOT NULL,
  `note` varchar(10000) DEFAULT NULL,
  `made_by` varchar(32) NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `category` varchar(64) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `mng_level` tinyint(4) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `motion_state` varchar(32) NOT NULL,
  `running_state` varchar(32) NOT NULL,
  `repair_time` bigint(20) NOT NULL,
  `repair_frqc` smallint(6) NOT NULL,
  `maintain_time` bigint(20) NOT NULL,
  `maintain_frqc` smallint(6) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'E23928375','X射线深部高性能第三代治疗机能第三代治疗机','en_name','X射线深部治疗机1','X射线深部治疗机asd','中国',12,'医用X射线设备','美国医疗科技有限公司',100,1,7,1,'入库','正常',1399026242523,3,1424613758052,0,0),(2,'E23928452','及高压发生装置','x ray','及高压发生装置','及高压发生装置','美国',5,'医用X射线设备','美国医疗科技有限公司',100,2,4,3,'出库','正常',441383197229,0,418831369415,0,0),(3,'E24134123','介入治疗X射线机','x ray','X射线手术影像设备','X射线手术影像设备','中国',23,'医用X射线设备','中国医疗设备有限公司',100,3,3,3,'入库','损坏',430800000000,0,417176655813,0,0),(4,'E2312','一次性使用无菌注射器及其胶塞','injec','一次性使用无菌注射器及其胶塞','一次性使用无菌注射器及其胶塞','美国',32,'注射穿刺器械','医疗设备有限公司',100,1,2,4,'出库','报废',1425217476013,3,1422797318235,2,0),(6,'E3143451','体外震波碎石机','rock','体外震波碎石机','体外震波碎石机','中国',23,'有创式电生理仪器','美国',12323,1,3,2,'出库','损坏',22471414,0,22471415,0,0),(7,'E234128234','剖腹产切口钳','plier','剖腹产切口钳','剖腹产切口钳','中国',69,'妇产科用钳','设备科技有限公司',100,2,3,4,'入库','正常',1146480716483,3,561466316485,16,0),(8,'E1384287','超声三维（立体）诊断仪','3d equipment','超声三维（立体）诊断仪','超声三维（立体）诊断仪','美国',12,'彩色超声成像设备及超声介入','美国科技有限公司',1000000,1,4,3,'入库','正常',1367337934385,3,27010659,0,0),(9,'E3412412','椎管铲刀','knife','椎管铲刀','椎管铲刀','中国',123,'矫形（骨科）外科用刀、锥','江苏医疗设备有限公司',100,1,2,3,'入库','正常',1146645298973,1,30898974,0,0),(10,'E1234141','眼人工晶体','eye','眼人工晶体','眼人工晶体','美国',2,'植入体内或长期接触体内的眼科光学器具','德国医疗设备有限公司',12,1,2,3,'入库','维修',8571695,0,8571696,0,0),(11,'U2131224','胰腺等电子内窥镜','glass','胰腺等电子内窥镜','胰腺等电子内窥镜','中国',13,'电子内窥镜','中国医疗设备有限公司',134,1,2,9,'出库','正常',8701615,0,8701616,0,0),(12,'O1213431','上消化道电子内窥镜','digesting glass','中国医疗设备有限公司','中国医疗设备有限公司','中国',12,'电子内窥镜','中国医疗设备有限公司',12,1,2,1,'入库','正常',8744455,0,8744456,0,0),(13,'W1231231','支气管电子内窥镜','tube glass','支气管电子内窥镜','支气管电子内窥镜','德国',123,'12','德国医疗设备有限公司',12,1,1,2,'入库','正常',8827288,0,8827288,0,0),(14,'E134879123','结肠电子内窥镜','belly glass','结肠电子内窥镜','结肠电子内窥镜','美国',1,' 电子内窥镜','美国医疗设备有限公司',12,1,2,3,'入库','正常',8878758,0,8878759,0,0),(15,'W2314134131','裂隙灯显微镜','micro','裂隙灯显微镜','无','美国',12,'眼科光学仪器','美国医疗设备有限公司',12,1,1,2,'入库','正常',8935774,0,8935774,0,0),(16,'y123412412','同视机','machine','同视机','同视机','美国',12,'眼科光学仪器','美国医疗设备有限公司',234,1,1,3,'入库','正常',8983804,0,8983805,0,0),(17,'F123412','角膜地形图仪','map','角膜地形图仪','','德国',12,'眼科光学仪器','德国医疗设备有限公司',21,1,3,5,'入库','正常',9058182,0,9058183,0,0),(18,'E141234123','眼底照相机验光镜片组','group','眼底照相机验光镜片组','无','德国',12,'眼科光学仪器','德国医疗设备有限公司',567,3,3,2,'入库','正常',9103293,0,9103293,0,0),(19,'E124124','色盲镜','color','色盲镜','色盲镜','中国',322,'眼科光学仪器','中国医疗设备有限公司',56,2,21,3,'入库','正常',9144476,0,9144477,0,0),(20,'W131212','视网膜镜','net','视网膜镜','眼科光学仪器','美国',23,'眼科光学仪器','美国医疗设备有限公司',131,1,3,2,'转存','报废',9203930,0,9203930,0,0),(21,'E34141231','瞳距测量仪','measure','瞳距测量仪','瞳距测量仪','美国',123,'眼科光学仪器','美国医疗设备有限公司',123,1,2,3,'入库','正常',9284435,0,9284435,0,0),(23,'w1252341','直肠显微镜','micro','直肠显微镜','直肠显微镜','中国',12,'医用手术及诊断用显微设备','中国医疗设备有限公司',1231,1,2,3,'入库','正常',9446794,0,9446794,0,0),(24,'E123124112112','医用放大镜','large','医用放大镜','','德国',12,'医用放大镜','德国医疗设备有限公司',1213,1,3,2,'入库','损坏',1009897992614,1,9511970,0,0),(26,'E12341','植入式心脏起搏器','','植入式心脏起搏器','植入式心脏起搏器','美国',12,'急救装置','美国医疗设备有限公司',1000000,1,3,2,'入库','正常',57419279,0,57419279,0,0);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EQU_UNI_CON` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (3,'equ_add'),(6,'equ_delete'),(5,'equ_modify'),(4,'equ_read'),(12,'equ_search'),(1,'export_equ_data'),(2,'export_user_data'),(11,'system_settings'),(7,'user_add'),(10,'user_delete'),(9,'user_modify'),(8,'user_read'),(13,'user_search');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(35) NOT NULL,
  `cn_role_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EQU_UNI_CON` (`role_name`),
  UNIQUE KEY `cn_role_name` (`cn_role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrator','管理人员'),(2,'equ_dep_person','设备科人员'),(3,'president','院长'),(4,'director','科室主任'),(5,'operator','操作人员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_relation`
--

DROP TABLE IF EXISTS `role_permission_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_relation`
--

LOCK TABLES `role_permission_relation` WRITE;
/*!40000 ALTER TABLE `role_permission_relation` DISABLE KEYS */;
INSERT INTO `role_permission_relation` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,2,1),(15,2,2),(16,2,3),(17,2,4),(18,2,5),(19,2,6),(20,2,12),(21,3,1),(22,3,2),(23,3,4),(24,3,8),(25,1,12),(26,1,13),(27,4,1),(28,4,2),(29,4,4),(30,4,8),(31,4,12),(32,4,13),(33,5,1),(34,5,2),(35,5,4);
/*!40000 ALTER TABLE `role_permission_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_recyclable` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `real_name` varchar(32) NOT NULL,
  `phone_number` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','123456','王全','1382917815','信息管理部'),(2,'a11111','123456','张磊','15929313871','设备科'),(3,'b11111','111111','李全','18638809098','眼科'),(4,'c11111','123456','崔元','1829289321','内科'),(7,'e11111','111111','赵信远','13859234597','设备科'),(11,'g11111','123456','李源','15637294726','外科'),(22,'a123456','123456','庄显','1351892341','外科'),(23,'i131123','aofij','刘璇','1343223424','外科'),(24,'i131124','aofij','刘淼','1343223432','眼科'),(25,'i131165','aofij','刘文昊','1343223432','眼科'),(26,'i131143','adfsd','刘文','1343223423','眼科'),(27,'i1324143','bdfsd','苏文斌','1343223213','眼科'),(28,'i1324233','adfsd','苏一涵','1342323223','眼科'),(30,'i1327853','ad23d','苏恒运','134233223','医院'),(31,'i13279683','ad2asdd','吴昌嵘','13412223','设备科'),(32,'i4527233','23asdd','吴态午','13412223','设备科'),(33,'i98792','kesaf','吴一辰','112332521','内科'),(34,'i923412','fae2341','汪华飞','112332521','内科'),(36,'i923423','rt2341','张建烁','1532123411','设备科'),(37,'g323423','rt2341','张之政','1532123411','设备科'),(38,'u13471289','1412312','董浩城','13224522345','内科'),(39,'e124131','123132','宋江','15234513222','外科'),(48,'adsf','asdf','asdf','adsf','asdf'),(52,'asdfasdf','asf','asdf','123123','adsf'),(54,'asdfgfadg','adsf','asdf','1231','asdfasdg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_relation`
--

DROP TABLE IF EXISTS `user_role_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_relation`
--

LOCK TABLES `user_role_relation` WRITE;
/*!40000 ALTER TABLE `user_role_relation` DISABLE KEYS */;
INSERT INTO `user_role_relation` VALUES (4,4,5),(93,11,4),(94,22,4),(95,22,5),(96,1,1),(117,23,5),(118,24,4),(119,25,4),(120,26,4),(121,27,5),(122,28,5),(123,30,3),(124,31,2),(125,32,4),(126,33,3),(127,34,4),(128,36,2),(129,37,4),(130,38,4),(131,39,5),(141,7,2),(142,7,4),(146,48,2),(147,52,2),(149,54,2),(150,2,2),(151,2,4),(152,2,5),(153,3,4);
/*!40000 ALTER TABLE `user_role_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user`.`id` AS `id` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `u`.`id` AS `id` from `user` `u` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-20  9:57:49
