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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'E23928375','X射线深部治疗机','en_name','X射线深部治疗机','X射线深部治疗机','中国',12,'医用X射线设备','美国医疗科技有限公司',100,3,5,4,'入库','正常',1409116161683,0,1437545477288,0,0),(2,'E23928452','及高压发生装置','x ray','及高压发生装置','及高压发生装置','美国',5,'医用X射线设备','美国医疗科技有限公司',100,2,4,3,'出库','正常',430800000000,0,419800000000,0,0),(3,'E24134123','介入治疗X射线机','x ray','X射线手术影像设备','X射线手术影像设备','中国',23,'医用X射线设备','中国医疗设备有限公司',100,3,3,3,'入库','正常',430800000000,0,419800000000,0,0),(4,'E2312','一次性使用无菌注射器及其胶塞','injec','一次性使用无菌注射器及其胶塞','一次性使用无菌注射器及其胶塞','美国',32,'注射穿刺器械','医疗设备有限公司',100,1,2,4,'出库','正常',1420118918234,3,1422797318235,2,0),(5,'E12341','植入式心脏起搏器','embeded','植入式心脏起搏器','植入式心脏起搏器','美国',32,'急救装置','美国医疗设备有限公司',10000001,3,2,5,'入库','正常',1411093011155,2,579838611156,0,0),(6,'E3143451','体外震波碎石机','rock','体外震波碎石机','体外震波碎石机','中国',23,'有创式电生理仪器','美国',12323,1,3,2,'出库','正常',22471414,0,22471415,0,0),(7,'E234128234','剖腹产切口钳','plier','剖腹产切口钳','剖腹产切口钳','中国',69,'妇产科用钳','设备科技有限公司',100,2,3,4,'入库','正常',1146480716483,3,561466316485,16,0),(8,'E1384287','超声三维（立体）诊断仪','3d equipment','超声三维（立体）诊断仪','超声三维（立体）诊断仪','美国',12,'彩色超声成像设备及超声介入/腔内诊断设备','美国科技有限公司',1000000,1,4,3,'入库','正常',27010658,0,27010659,0,0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'export_equ_data'),(2,'export_user_data'),(3,'equ_read'),(4,'equ_modify'),(5,'equ_delete'),(6,'user_read'),(7,'user_modify'),(8,'user_delete'),(9,'system_settings');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrator'),(2,'equ_dep_person'),(3,'president'),(4,'director'),(5,'operator');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_relation`
--

LOCK TABLES `role_permission_relation` WRITE;
/*!40000 ALTER TABLE `role_permission_relation` DISABLE KEYS */;
INSERT INTO `role_permission_relation` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,5),(5,1,6),(6,1,7),(7,1,8),(8,2,1),(9,2,2),(10,2,3),(11,2,4),(12,2,5),(13,2,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','123456','王源','13829397846','管理员'),(2,'a11111','123456','张磊','15929313878','设备科'),(3,'b11111','123456','李全','18638809098','医院'),(4,'c11111','123456','崔毅','18292893223','内科'),(5,'d11111','123456','周国平','13571922366','内科');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_relation`
--

LOCK TABLES `user_role_relation` WRITE;
/*!40000 ALTER TABLE `user_role_relation` DISABLE KEYS */;
INSERT INTO `user_role_relation` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,5),(5,5,4),(6,1,2);
/*!40000 ALTER TABLE `user_role_relation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-30 10:31:43
