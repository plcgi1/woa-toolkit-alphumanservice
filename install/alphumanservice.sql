-- MySQL dump 10.13  Distrib 5.5.28, for Linux (x86_64)
--
-- Host: localhost    Database: alphumanservice
-- ------------------------------------------------------
-- Server version	5.5.28-log

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
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(125) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `method_type` varchar(60) DEFAULT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `siteid` bigint(20) NOT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `order_by` int(11) DEFAULT '1',
  `place` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'NEW_PROJECT','Новый проект','/part-form/project','[\"GET\"]',1358105448,1358105448,'page',0,NULL,0,1,NULL),(2,'PART_PLACE','Куда','/part-form/place','[\"GET\"]',1358105448,1358105448,'page',0,1,0,2,NULL),(3,'PART_PART','Участники','/part-form/part','[\"GET\"]',1358105448,1358105448,'page',0,1,0,3,NULL),(4,'PART_GOALS','Цели','/part-form/goals','[\"GET\"]',1358105448,1358105448,'page',0,1,0,4,NULL),(5,'PART_PROJECT','Проект','/part-form/project','[\"GET\"]',1359307653,1359307653,'page',0,1,0,1,NULL),(6,'PAGE_PROJECTS','Проекты','/projects','[\"GET\"]',1360014305,1360014305,'page',0,NULL,1,1,NULL),(7,'PAGE_PARTICIPANTS','Участники','/participants','[\"GET\"]',1360254702,1360254702,'page',0,NULL,1,1,NULL),(8,'REST_LOGIN','Логин','/ahs/auth','[\"POST\",\"DELETE\"]',1360255039,1360255039,'rest',0,NULL,1,1,NULL),(9,'PAGE_ABOUT','О проекте','/about','[\"GET\"]',1360272368,1360272368,'page',0,NULL,1,1,NULL),(10,'REST_GOALS','Цели проекта','/ahs/goals','[\"POST\",\"DELETE\"]',1360449184,1360449184,'rest',0,NULL,0,1,NULL),(11,'REST_PROJECT','Название проекта','/ahs/project','[\"POST\",\"DELETE\"]',1360449662,1360449662,'rest',0,NULL,0,1,NULL),(12,'REST_USERSDATA','Участники проекта','/ahs/usersdata','[\"POST\",\"DELETE\"]',1360449781,1360449781,'rest',0,NULL,0,1,NULL),(13,'REST_GEODATA','Место проекта','/ahs/geodata','[\"POST\",\"DELETE\"]',1360449825,1360449825,'rest',0,NULL,0,1,NULL),(14,'SETTINGS','Мои данные','/settings/contacts','[\"GET\"]',1360511521,1360511521,'page',0,NULL,0,100,'hidden'),(15,'CONTACTS','Контакты','/settings/contacts','[\"GET\"]',1360511627,1360511627,'page',0,14,0,101,'hidden'),(16,'PASSPORT_DATA','Паспортные данные','/settings/passport','[\"GET\"]',1360975353,1360975353,'page',0,14,0,102,'hidden'),(17,'REST_CONTACTS','Контакты','/ahs/settings/contacts','[\"DELETE\",\"GET\",\"POST\"]',1360975725,1360975725,'rest',0,14,0,102,'hidden'),(18,'REST_PASSPORT','Паспортные данные','/ahs/settings/passport','[\"DELETE\",\"GET\",\"POST\"]',1361113648,1361113648,'rest',0,14,0,103,'hidden'),(19,'REST_PARTICIPANTS','Участники','/ahs/participants','[\"GET\"]',1361220725,1361220725,'rest',0,NULL,0,104,'hidden');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensurance_data`
--

DROP TABLE IF EXISTS `ensurance_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensurance_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ensurance_number` varchar(45) NOT NULL,
  `ensurance_date` int(11) NOT NULL,
  `ensurance_name` varchar(45) NOT NULL,
  `ensurance_date_till` int(11) NOT NULL,
  `ensurance_comment` varchar(45) DEFAULT NULL,
  `currency` varchar(4) NOT NULL,
  `summ` float NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensurance_data`
--

LOCK TABLES `ensurance_data` WRITE;
/*!40000 ALTER TABLE `ensurance_data` DISABLE KEYS */;
INSERT INTO `ensurance_data` VALUES (1,'q23123',0,'',0,NULL,'',0,1360008658,1360011647);
/*!40000 ALTER TABLE `ensurance_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensurance_user`
--

DROP TABLE IF EXISTS `ensurance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensurance_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ensurance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ensurance_user_fx_ensurance_id` (`ensurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensurance_user`
--

LOCK TABLES `ensurance_user` WRITE;
/*!40000 ALTER TABLE `ensurance_user` DISABLE KEYS */;
INSERT INTO `ensurance_user` VALUES (5,2,1);
/*!40000 ALTER TABLE `ensurance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_project_id` (`project_id`),
  KEY `fk_goals_project_id` (`project_id`),
  CONSTRAINT `fk_goals_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,'zzxcxzzczxczx',1359843331,1359843331,2),(2,'serwerwrwrwe',1359843332,1359843357,2),(3,'zzxcxzzczxczx dfdfgdfgdfg',1359843357,1359843357,2),(4,'drt wer ewqwreqerqewr',1359845692,1359845692,2),(41,'фывфывф fffff',1360011643,1360011643,3),(42,'фывфыа аваыавы',1360011644,1360011644,3);
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `description` varchar(125) NOT NULL,
  `print_name` varchar(125) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `action_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nav_name_idx` (`name`),
  KEY `navigation_idx_action_id` (`action_id`),
  CONSTRAINT `navigation_fk_action_id` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport_data`
--

DROP TABLE IF EXISTS `passport_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passport_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `received` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `date_of_birth` int(11) NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_passport_fk_user_id` (`user_id`),
  CONSTRAINT `passport_data_idx_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport_data`
--

LOCK TABLES `passport_data` WRITE;
/*!40000 ALTER TABLE `passport_data` DISABLE KEYS */;
INSERT INTO `passport_data` VALUES (1,1,'123','123',1360011600,'value=&quot;werwer&quot;',1361048400,'werwer',1360007617);
/*!40000 ALTER TABLE `passport_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `lattitude` varchar(255) NOT NULL,
  `longtitude` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'weasdasda фывфывфы',1360006441,1360011642,'55.7765730186677','126.5625');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_project`
--

DROP TABLE IF EXISTS `place_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_place_project_project` (`project_id`),
  KEY `place_project_idx_place_id` (`place_id`),
  CONSTRAINT `fk_place_project_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_project_fx_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `place_project_idx_place_id` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `place_project_idx_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_project`
--

LOCK TABLES `place_project` WRITE;
/*!40000 ALTER TABLE `place_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_idx_owner_id` (`owner_id`),
  CONSTRAINT `project_idx_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'sdrrwe ddddd',1359841872,1359842003,1),(2,'sdrrwe ddddd ddss',1359842026,1359845692,1),(3,'фывфывфывф',1359911304,1360011641,1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `actions` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,1358105448,1358105448,'me','123','http://localhost:3030');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` bigint(20) NOT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `phone3` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `icq` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  KEY `user_info_contacts_fk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_project_idx_user_id` (`user_id`),
  KEY `user_project_idx_project_id` (`project_id`),
  CONSTRAINT `user_project_idx_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `user_project_idx_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project`
--

LOCK TABLES `user_project` WRITE;
/*!40000 ALTER TABLE `user_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_site`
--

DROP TABLE IF EXISTS `user_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_site_idx_user_id` (`user_id`),
  KEY `user_site_idx_site_id` (`site_id`),
  CONSTRAINT `user_site_idx_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`),
  CONSTRAINT `user_site_idx_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_site`
--

LOCK TABLES `user_site` WRITE;
/*!40000 ALTER TABLE `user_site` DISABLE KEYS */;
INSERT INTO `user_site` VALUES (2,1,1);
/*!40000 ALTER TABLE `user_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `actions` text,
  `siteid` bigint(20) NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'harper','202cb962ac59075b964b07152d234b70','asdasd@asd.ass',1358105447,1361117371,'[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]',0,NULL,'Александр','Носов','Анатольевич');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-20 23:36:43
