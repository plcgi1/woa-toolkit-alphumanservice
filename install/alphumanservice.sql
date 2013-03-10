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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'NEW_PROJECT','ĞĞ¾Ğ²Ñ‹Ğ¹ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚','/part-form/project','[\"GET\"]',1358105448,1358105448,'page',0,NULL,0,1,NULL),(2,'PART_PLACE','ĞšÑƒĞ´Ğ°','/part-form/place','[\"GET\"]',1358105448,1358105448,'page',0,1,0,2,NULL),(3,'PART_PART','Ğ£Ñ‡Ğ°ÑÑ‚Ğ½Ğ¸ĞºĞ¸','/part-form/part','[\"GET\"]',1358105448,1358105448,'page',0,1,0,3,NULL),(4,'PART_GOALS','Ğ¦ĞµĞ»Ğ¸','/part-form/goals','[\"GET\"]',1358105448,1358105448,'page',0,1,0,4,NULL),(5,'PART_PROJECT','ĞŸÑ€Ğ¾ĞµĞºÑ‚','/part-form/project','[\"GET\"]',1359307653,1359307653,'page',0,1,0,1,NULL),(6,'PAGE_PROJECTS','ĞŸÑ€Ğ¾ĞµĞºÑ‚Ñ‹','/projects','[\"GET\"]',1360014305,1360014305,'page',0,NULL,1,1,NULL),(7,'PAGE_PARTICIPANTS','Ğ£Ñ‡Ğ°ÑÑ‚Ğ½Ğ¸ĞºĞ¸','/participants','[\"GET\"]',1360254702,1360254702,'page',0,NULL,1,1,NULL),(8,'REST_LOGIN','Ğ›Ğ¾Ğ³Ğ¸Ğ½','/ahs/auth','[\"POST\",\"DELETE\"]',1360255039,1360255039,'rest',0,NULL,1,1,NULL),(9,'PAGE_ABOUT','Ğ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚Ğµ','/about','[\"GET\"]',1360272368,1360272368,'page',0,NULL,1,1,NULL),(10,'REST_GOALS','Ğ¦ĞµĞ»Ğ¸ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚Ğ°','/ahs/goals','[\"POST\",\"DELETE\"]',1360449184,1360449184,'rest',0,NULL,0,1,NULL),(11,'REST_PROJECT','ĞĞ°Ğ·Ğ²Ğ°Ğ½Ğ¸Ğµ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚Ğ°','/ahs/project','[\"POST\",\"DELETE\"]',1360449662,1360449662,'rest',0,NULL,0,1,NULL),(12,'REST_USERSDATA','Ğ£Ñ‡Ğ°ÑÑ‚Ğ½Ğ¸ĞºĞ¸ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚Ğ°','/ahs/usersdata','[\"POST\",\"DELETE\"]',1360449781,1360449781,'rest',0,NULL,0,1,NULL),(13,'REST_GEODATA','ĞœĞµÑÑ‚Ğ¾ Ğ¿Ñ€Ğ¾ĞµĞºÑ‚Ğ°','/ahs/geodata','[\"POST\",\"DELETE\"]',1360449825,1360449825,'rest',0,NULL,0,1,NULL),(14,'SETTINGS','ĞœĞ¾Ğ¸ Ğ´Ğ°Ğ½Ğ½Ñ‹Ğµ','/settings/contacts','[\"GET\"]',1360511521,1360511521,'page',0,NULL,0,100,'hidden'),(15,'CONTACTS','ĞšĞ¾Ğ½Ñ‚Ğ°ĞºÑ‚Ñ‹','/settings/contacts','[\"GET\"]',1360511627,1360511627,'page',0,14,0,101,'hidden'),(16,'PASSPORT_DATA','ĞŸĞ°ÑĞ¿Ğ¾Ñ€Ñ‚Ğ½Ñ‹Ğµ Ğ´Ğ°Ğ½Ğ½Ñ‹Ğµ','/settings/passport','[\"GET\"]',1360975353,1360975353,'page',0,14,0,102,'hidden'),(17,'REST_CONTACTS','ĞšĞ¾Ğ½Ñ‚Ğ°ĞºÑ‚Ñ‹','/ahs/settings/contacts','[\"DELETE\",\"GET\",\"POST\"]',1360975725,1360975725,'rest',0,14,0,102,'hidden'),(18,'REST_PASSPORT','ĞŸĞ°ÑĞ¿Ğ¾Ñ€Ñ‚Ğ½Ñ‹Ğµ Ğ´Ğ°Ğ½Ğ½Ñ‹Ğµ','/ahs/settings/passport','[\"DELETE\",\"GET\",\"POST\"]',1361113648,1361113648,'rest',0,14,0,103,'hidden'),(19,'REST_PARTICIPANTS','Ğ£Ñ‡Ğ°ÑÑ‚Ğ½Ğ¸ĞºĞ¸','/ahs/participants','[\"GET\"]',1361220725,1361220725,'rest',0,NULL,0,104,'hidden'),(20,'MY_MEDIA','ĞœĞ¾Ğ¸ Ğ¼ĞµĞ´Ğ¸Ğ°','/settings/media','[\"GET\"]',1361461049,1361461049,'page',0,14,0,104,'show'),(21,'REST_MY_MEDIA','ĞœĞ¾Ğ¸ Ğ¼ĞµĞ´Ğ¸Ğ°','/ahs/settings/media','[\"GET\",\"POST\",\"DELETE\"]',1358105448,1358105448,'rest',0,NULL,0,1,NULL);
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
INSERT INTO `goals` VALUES (1,'zzxcxzzczxczx',1359843331,1359843331,2),(2,'serwerwrwrwe',1359843332,1359843357,2),(3,'zzxcxzzczxczx dfdfgdfgdfg',1359843357,1359843357,2),(4,'drt wer ewqwreqerqewr',1359845692,1359845692,2),(41,'Ñ„Ñ‹Ğ²Ñ„Ñ‹Ğ²Ñ„ fffff',1360011643,1360011643,3),(42,'Ñ„Ñ‹Ğ²Ñ„Ñ‹Ğ° Ğ°Ğ²Ğ°Ñ‹Ğ°Ğ²Ñ‹',1360011644,1360011644,3);
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
INSERT INTO `place` VALUES (1,'weasdasda Ñ„Ñ‹Ğ²Ñ„Ñ‹Ğ²Ñ„Ñ‹',1360006441,1360011642,'55.7765730186677','126.5625');
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
INSERT INTO `project` VALUES (1,'sdrrwe ddddd',1359841872,1359842003,1),(2,'sdrrwe ddddd ddss',1359842026,1359845692,1),(3,'Ñ„Ñ‹Ğ²Ñ„Ñ‹Ğ²Ñ„Ñ‹Ğ²Ñ„',1359911304,1360011641,1);
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
-- Table structure for table `user_media`
--

DROP TABLE IF EXISTS `user_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` blob,
  `filename` text,
  `content_type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_media`
--

LOCK TABLES `user_media` WRITE;
/*!40000 ALTER TABLE `user_media` DISABLE KEYS */;
INSERT INTO `user_media` VALUES (54,'GIF89ax\0t\0çş\0	\r\r\r		\n\'!%.\Z\r (#\nA#%-\Z6(<\'-*- 1\'-%7*2+\'-/=*L)23L3,=I3%18;E5%K487:?7&4:)+@891P3&C7:I850G\r8JP@?`=0UA/\\?0_?+@H4OD2TB8DFB;L#EI$\\A8FFK\\C-VE,bA8hN7fN=nM6cQ7NW@\\SAI[/TTYTX3eQGcQNVVP_TWQ_ u\\._c[y^Fo_[\\fQbfBu`FobEt_Tw_MachkagWk?Xl7[l0‚_Gƒh6wm[k_‚nRgyDjv\\zothzLh|>sswswPttl†}‚z…htŠL}ƒw…}‡V”}wtŠUyˆ_uŒH‚ŠIC‡Z„Š‰i¢ˆF£…v–X«ˆk–Œ’Œ—c‹“•§Œˆ›d„œVŠ˜n‹—xˆše”’•‹›]“•‰†_”š§a“¥o§o§g“«^£—Ÿ¨k£¤‡¤¡¥¨u¼ª ¦«g¹™Ÿ¥¤—¬€ ©„¬§z˜¯i­o—¯o•¯v›®wœ¸p¤µ|¦µw ·v·|¢·q·ƒ£»l£¸Œ¬¸s°²§³°´º®´­·‚Ì«¤·¶˜¨¾w¯¹”Î¯§¾}¥¾ƒ­½}«½„¦¾Š­¸¸ª¿’­ÄƒªÅ°Ä‘°Æ~¬ÆŠ·ÄµÄ…±Çy³Å‹°Ç™ºÅ²É‡¶Æ›É¾Á½Ç¢İ½ª´Í‘·ÎŒÜ¿·ÂÅÉ»Î†¸Í™»Í’¾ÍÅÇ»»Ï¢¾ÒƒÅÔéÇ§ÃÔšÃÕ”ÑĞ¦ÂÖ¡ÍÑ¶âÎ–êÎ†ìËµÆØ«Ö×ËàÓÖÓ×ÜÖ×ÔïÒÊıØÈüİ»üŞÍİèÈŞåéüáÄãëµîãçâêÙúãÙùãßäéåëçèíèŞùëÄüêÕ÷ò×ÿîéıò÷õõôşôæóøçüøïüüÿışû!şğCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - sp\n\0,\0\0\0\0x\0t\0\0ş\0kñv¬à±fÄp‘êtj˜C‡Ğ\"BkÖÌ`A‰Ğ¬iŒ¬V#1qF	›&-T¡BŒ¡\"FLš¯—Õ¸E+¦*—Í\\½¢íÚ©j“*T@CiRÅSU±hÕŠ!Û¥ê\'ª¦?M5š\Z¨j F ²b5e+*S¦j	äUë—6mÙ„	û5,•ÛTÃdÉ•E¶V©RvOıŠ¨Ñ\Z´k×š	“\nê–0–-‰…\n5ªåËh}+æ«W/œ3‘-mjÓ—É8švEZ©& š4\rº\n\n¬)PX[Û4«-`¶l‰{J”¬cÚš±m›êÑ£SrOu¢Ë«”£OŸËÊhmX°`€µM£8M˜áfÚYşâj	9›ËÉ/-Û,V­šfÍ^m¢šº•Í]Å˜:Í¥JuUPá–ÛmòeÕš€»•ÒÉ\"‚8‚Üp¹5×)§ôË/²`˜\\†şr]0«¬rİ4İ]^pÍ0M6,Bæ\"n½°×^{Ñ¼ÔxÄø’KVO* ¥ÉTĞ•Öm¹É7ÕW®‘b×\'²G\"ŸtÒÉpşâœ#”Â!FÇÔ’œr¥ğr/§&)Ÿà•á_UDÑ1Äd#“y–M–ßd»¼dÓxÒHSc.’í’ÚP¨°†\n#XAçÈT\\Í†Š@#â‰#‰$âˆ•‹|ºW35—•—²ˆ’\n…§Ü%]şe63v$zWJ›ç4ÇDÄ.6I“\r0¹ÅÙŸ¾$$hd’Ñ”Z#@i_.·ÕòZ#‘V:-¾á%”Ü\"f*‹tr+^¼¨EÖ1Ì\Z&¨îÁÆ\\vyĞ‰$æ‹&r¼È5L_ÖüB\'(”B.B¦-“³å\"£{È$µ“&¡lÛg/À\\-P^E[m ”ñ†·¯4Mq©˜&…«(\'\n/Ì˜\'0µ wk#Èk½Ñ™9‰€ACWE¼ü¢‘C¢ÔBŒ-,\"ÊA—i\n±¹H5´ø!£L{ùÕ´¡31õ5X°ÅdSø‘S AI-Ğ´5L‡r](K*VÖLşÒˆÌ/v™e§\\FWË-,ñXv³š,4r§4\"\r0µX)KŠÌsÌ¬ÄxÕH!ÕŞNøÕ¨\'S“©ÒZ¤´½D©¶¦ˆQ†eøqHCÕÅU7œÕ­ª÷™f^#Œ#ô’\"®@Çtèä-xíÍv÷ÊÊKBª„ƒ\n.¼øö01ks\rZÑä\"TŸÍæ‡L~øUéé‡SµÀà–|®wfÓìFh¡Ålt\"7†¾9ÚC†Á¢gf·¸„\'Já¤^i0£Ùƒ®#´_4CPÕP†2ºñn(#\ZYÌ²q;‘†F{B~òóöíáX\nNz1i…‚(7‰Ï´`„¾€ş‚x‹\\Dñ·<Ä-fâ…™´‘ac$Ò ‰†±\n#_I3”˜Á\rvƒıĞ‡8Ş¡õ‘ÆÑ‹Œrt§cÊ¤Šò\n¢l†Pı)ÄUu5ûôbbàa¹0‡\">B\"N*RuÈ‚”\"iÇˆ¢0c\'nd£;\"\n†ñ~–¯i°(İ=Ü1dÌc†x$Æø~¼CƒÈH£4¸ÒÀQGzRÊ×Š•¢l¦)©„Áˆ@Äá˜À‰Y†2lÁ…,(|3@Q$‚\rÈÍ\'Ñ&[C‰¡‹¦¢H¼âœÆ0F5¶Ñm¼£î e2\\1<ãXş(Ç?öùWvC}Ë’Å¦¥BöÔˆ}šaÊ{ú“\Z`©*ËÄ°…B8‚\rØìÍ4§I!¹”Â˜[9—)ì3› ù¢O+\"Æ-H.NpB|Ç;Æ(yƒ”ã Æ)ç1‰VÈCü”Ç3ÊñJ3º(Œ\0)|ÁPUT#\'TÊù²öòEC†_¹	*Á?4¢«¸Äƒ4”œNˆ‚6¹Àò”h©¥‰FBF.<àôà§>öêSÒã¯ô(Ç3È±yüt¯ÏøC&tA\re4Å€JT ÎŠ8È!yX.õ”Ğ—)¾Èêl\ZÑ¥oÒmT[ÌH[’¦\"id/ãşÅk¸?E¯aÄ $A\rqŒCı®<\nÛ¿ŠCÔÈ„û]è¢ä˜Ü°Xq(cšhD(_$5®³m¡ˆ‚±)…kÔ\"(æ@/TuâSæâÅ4®a\r·¼¬]Ò˜oD.¤Db0£ ³”	1gŠPÌ‚óÈ‡;€+\\yôc÷¸‡L©a5\"¬`E2İğàÍ¥Æ,¢R¦‚0CE5Š«‹N×…F4)ì“W`ŠNâÆ¡ºæ¼æàˆƒœBÜ´~AßêÈ¢LÌ˜“\'E3ºlp”şGpÿaX~@8Âô‡%’AjL¸\rnpÃLÀƒév¾ \\ş-‚âhp#h´dEØu›4%b|ëjÈßV‘b…0ƒ Ù\0\n[€\"{ØC2£H!¸àÍ ÀåJ1ŠQàBMÓS†8ô‘ şƒ†-‡<è±,gŠG+ !ÓwPã8àÀLÀè\"„ØA€7WR&‘ÆœY¿^e…èAãezQ®¹JAWXC¼8`…SD›h$F3Sš\"Å+ºÑ~J¹Ãı)=úQLÔT\rjG&ÒÓw@Â\r<¸À¬?ü„\Zh\"!ÄK¯YÄ‚[\ZÌàd4Z¬NÊîÅ&dNíae2…1§\r%ˆ:bP*Å‰ş_“°AÂ‘8ü°	r›[¸Ôu9Z1TWdáähÚÀJH<#à\0.€…?Ha\r¡È­¬e\n1Øn†ŒLza(±PèƒJz13Ä!ÑlàÂÎ ­Oİå.¼`“•>!× b³ÄÈæBˆÃÜú(‡qÅQq”Ò®¸ƒ+òÁS&à`	i`…8|ô@€™€ÄTtÙÂÒµ°)rZÆdP¶©mP\nFE3“¹…\'P\n(Å£,X^%–[Á×\\õEäş@¢a\nxxGPË¡yˆò¯É°„%áŠ>ÔÓó°Dƒ\'´áG:FşğH´¡Â\0°Š Ët´²§P‡ŒÂ!Sg4Î¨\ZOÆ¥Åò	yU¥Ö^ÜtŠz9èÈœ¥‡~02ÃÂ§65ƒ%å@|Ï “`} w`J§Ô\ndÀX`Ù7 ¸}†€R€$‚´T\rˆ±79ÂO…~W#.’\r\'†bƒÚA3br+ÓLÇôu]rPÒ&Ğ18ôÒà	tez-—€ó ş°„º0XÏóä\n–P\nhSŠ€x`t#Ğm »/‡~Â\"3TKGapá`pgñ:²B{ ò^mB\n´?bş÷ş¿\nœâ¡%Iè	‹ÑrüğşP‰6E\r¢ö€å0€E\r¥„˜sn€ËeXÀ€8 ª E‚2h(	A´C:â/ØF0HwØX‡h‡P\ná×IH\n†3?Xú7„æRiŸ8æ‡p\'qr-WnQ(…†¥5¥}õWø€8uJå“ øÆvA—«¨	ØÓ†RŒğ\n£ÆƒÑ0È\rêã¹q‡*ÒøS#jq\nÉ<BX$Ò	© \nE²M‚0lúÓLr 	w÷ú°O¨€ñ4’ñÄW85}Uˆ gpGPa&0ş*°Š›\nY!r 2#ã<ù”`[Ç†Â\"{†\nÃ=ÀFFÀ?R\n¤5ÃÒá­R{Õ¦9 :0R€“è‘{e’8å\næw~O(éz‡\\Ï€&@Š³†*ÀŠ¸P\nA¢	e`µãÍä-…Ày.bpÂRB:365¯[Ğ˜kæ=8eÁ_•ÉÌc\nâámZ@D m@\rû4–\"™\n6’(yJ\nX‰ù@ƒUÇE|gÀG oi D€\n†q¯À³£q L´SÖ&˜ì÷_¤r\rnXpƒ\"˜Íñ(U ñU2™ôdQ@gşb-Ä\0¯0„Ğ«´Oş0š9#išùà¦éixgSêV…ºp&`*p›5@	àæÄ¹LÓ&Le GqPF\rT·kÁ\"âftØF²@!PÂ%Œ\0\n£À<\\’!\"ï7ûE³T\r³Ğ[ainïjO8å˜ÈÅ\nˆ€¬@\rôÀ ö\\‚õ´ù¸ù\np{Pş9/Vq€Lm$½pbÍĞ\"Qôtu`DT‘<v£À@ŸfVb%ÊQf ËáQ³´\rF{E¢¤9âÀ¢OVp-P@\'°pZpkú¢™°XU¸§n 5€¸0\nşŒ	HôÂ%‰ „8mÈxGRIi–q¤Â\rxS‘ô2\n¦ ¨‰&/l0‚p‚P jŸğ\n³Ğ\r’±@ˆğp\0	.ša²šK€À\0ºº\0à\0ğ«À\n¬u\Z\'P60“Oğ¢$¸5Æğ\n”PÓØ&Qr\n!Ò GAÊ\ZÀ@KÀ¦#›\'©Ñ°äúÏØ^	âf v^Ú	° pc‡0k`¬Epøz€\0ºš«`\0\0««ºŠ\0¼\Z¬k¼ú\0k\0p\0p\0ğ-*	³ Û€é$\rSª ÖzEòç9Øâ\Z·#RÇ\r¾ğ\Z €ˆ†şQ‚h°­%Säú¾á	ƒPÅzT\0APP\0°›\0\0° \0@°p*¬°\0P\0TË\0	\0ğ°°µFË\0@k¶k°	Ê€¹@\nrQÂ²,52HÂÔgw¾ˆòÂ^Ï.5ÓO’·Vr‚hğ\ZpW\0@KûÊ\0 \0[›\0(€{\0À\0À´ µRË¸ \0\n0\0\n ŠPD€	°µ[+\0ÿzµ‘Kºc«*%n2Uñ“p‘rø%(ÌÙİ!.B×–·Ó´l¨s‘£°`6pa\0@$€\0şà¸p\0€Yû° \0\0p¹L[\0`\0ë¹#€iP5 c *€ºK°ºJ6@50›`äCm´b\'v»){ƒF²ô3[T@²5Ä³7f%×´¨òÓ3° 2Ğ2ğÁBë¸VK\0%±“Ÿ‹º ë¹@w€O ( Ş·+Ì´Fk´ $Ì¿‰‹l‘añcÒ‚iEÎA„Ğ9Y¶ [ªäê©Â/Æ€6pĞ«\Z  °S[¹pµK‘«- \0\0\0 Èµ.,f`xOğ™âés+Ì\0@µK+\0À\0şÀ\0»–ECÉ\r¹\Záa!qÀ€ãW…\nÄCQ[0YzÃ•³Æ±Ğ8‹€ÅœP_`IpŠ«°C[µÿªm°Û;“ ëÆók½ \0#p@fº`}¬ «>·µ°\0BÛ¸K[¹ºú°:€ù•¤,’\r‘šZœ w15”,Œab{«t7Fô ÂµÀRhPT€¯7`\0KëÊ°mğÛ›#\0\0ú<\0Åü«c¬\0³f°öº`m€O\0L0µ«Ã±0¸u—4_Ó@éÔ_a®R$3\n¹Ğ%»¡2HéÑŸ\"ş\n[\Zr\n@	éü³Wp ´à´ğ\0E`«€Í5©»\0°+ À\0 K€£Ô•	Kà}*ğÇ½*@µ@µï,°-\r¸Ióu(Ciµ©xaIty¡pÅ8![›ª=Y×co ÎPpÕK´TK°\0Æ\'ğ×vº¦KpºP\"@Ô=ĞĞºª(@À\n™`}5\0È_ì\0\" C›«Ñ@”/Úq\r×ñ=íĞá`QÄb!z3•v¥)’|iÁ¹‘¼JÄÉ+ÂàvîÜ´`½ğ«`ÆpKàµ`\0pÙ+°Aş À¯à¾D°¦O ¯\\%à\0¾:´ººÙËü\0ŸİI|øg-(ßD¹ÑtÄ’œNˆÁjÖ*¥àMƒZ&ı2‘€ëœ×KÜ`Ù$P\Z`É\rDÈpØÑ3°¾ÁıÅ$ğÁ=Ğ%€ÙáÌñ¼Ì`İAù•<›#£\nãqRiÛ·Á=?Í\n*Éï –6¨ŒNrvPC\0Æ™;µ{í«,—İĞR.7°ÒNÕ\Z¾áT@@%0ÅmC{¹ãı¯PÜ +h‘âÈÓÍ¥`ávdá*q‚6ÍîB4µPizÎşŒ!f2\r¥L%ÀÊ@\07½\0à=à^ÔTı«—}Q>å3@áD=4@B ˆŞ¾\næ}Ì\0$PdEó<gQ+d±)Ÿ@\nj¡)0\nº±ÑI(®Fºn»‘‹.ÓcAî`^è@\0.%ĞCĞá^á.’.åé™~í›Şîáß\rŞËÏwj`\0 ‡À£İÁ Ì“„·@\"d1¨úÇÀb\"ÚáƒZi’–8*~³¢\rŞa&Üa¥ìBK°Ç^\0C½ìÍîì3\0í/å?øzB@éÙ®íÚÎí–=´{§\'à¼ğşoP\"²°\nå²— Â(Óp&’gr×Q{…Œ‘,º¡\nÙI!ôçÂîûjì7-Ü>\rß4@Ô+Páï°é\Z¿ñ]ĞT\0õ%`$ÀÇXwªSpN¸ÀEl`Ó¸`¹~Â 3x^j‘ÖâŒ`iù˜Ó“j%ğ[¤ĞÎ\Z0´×Ë´îôN¿åD}Ù0˜.30+ŸñBÀñ]C°ì\"à\0{Ì¯F^µ0Ñê—<”‘=yÄÚ#ÄâZÀcŒ¨m·o†N21Û³çÚY·òÒUÜ@\0Åşì\0P> ù[^’NÕĞ_40C-å_¡aTPúßÕ¤ş×{°SP€ÍT9Yh€ƒğ{op;(Í!ÉSŠÄ”ğ\n\0aÌØ«WÆ¸qHLÚBb\n¥	»Å‹W­Ry	“vì®W”¦<`€\0A’4ØğácÈ2n¨³‚š$lŞ¸¤\r(P¨P©2¤D‰#ØpâÄ>òó¦L™7RÑ ™‚FG#lNı’u«âXP5räH ²Y\n4¶PZCc\no‘*%±–©ZéôHAÃ†V@©ÒG	6eÊÔ Á¦M2JôüÔñ‚ÂœşĞPÀ)ÕªoüDEƒD’)HB¼àÒÉ\Z´c¼JuúTÑÔîOŸÖ²¥\\¸[JŒ(	|EÊ“^^á\"ï˜ÚI’ˆû˜ü¸‰È“Iœ¸aŠ +mFØ°À0Òt¼atºªJƒR¯2ÅH“&sN\rû\ZhÀ’E¢Ú$hƒ‹Šª8ä€P8è+—»H©ÅOp‹ \\p	…’7>B ‚4Á†Ä¼³I[ª,F†èŠ!Ê¦ØÀ\0@\rJˆ±-”¨L‹ªµÖöã¢É9ùj\0iæ!(8·^Â2 b\n9$¸QH!å\r=9s”P	eDdşÍ‡:`Ì†Ixq?ÿ\\!†dèA¥}jˆ›2àöxã¸iª<†ã¤$’Cè C1š4c#¶HäYNAU°Déäú†Kp–M!d5Ñ¤Ë2Ğ˜Ê´B9MRIÄP8ô…‘-(±*R²„ÊJ¸sk\'ğ Û	V˜¡o\r\"¨\"T|à€€j”…¦©í–l²iHˆ„	f•U65CŒ-rÈAROé$àVOaU”ÓNÓr ¸¶ak–\\í#\"â1ÖĞB‹8©¨Š(\ZÅ˜pŒyƒ£¦ğÁ†¢J?=ÀÛ‚¸¢§!ÀbÜ\"|€ÔQˆ&Mi²ş9ÆMc²Æ“4o¹ËŞU\"Ù#T#¤ X‹@rC5`TOa£	ã{•‚TF™Y!&B\n)Æ@\"#..Eã‰jáP B,”—’•:Oog˜!¿c |š¹ğ!T	?0”%˜`&&`L	%y5½ä’H\"Y¥^R–NR?#¸¤”c)ÅÔSñÄ8\ná”C6nMnŸ«üàİ-Êˆ#¼T/EÎ\\æ–S?tP*)É¼í¡„^$tp(R\Z×†ì‡@#’«¯.¯±¹d•KÉ|öÎË÷¼£8Ä0cE.™F›Œx9}aÜÅ{/1š[6!œúÈ¡r˜ş1b	cùĞÜŞT‹H0o)¨€dD0”DÆ%èà U„“!®\nv ÀvŠŠäf,¨ºDê;:øÁè+ß-ˆ´ZÈâ\Z×˜Æ»´qŒiLcĞh†D\r¤É‹.1ƒ‚³¹HPâ`oˆCñ‰4¢\rÁ%Ğ¥œ L‹h£”ø E&S‘\rÂ…BUMvÔ¡0j°E,â‡•Œ°¶b9\"yÓÆµQÄÖ/:U€$Y¨ˆ–â.„õ¿Í‘ÂŠ®Cf§OqR¤˜B	–rÆ3æ­E.’A‚P)EE>\0\n¼wŒfTIoCÚ\\Rş×‰G,¢çƒÔ¶6L¨ıCÓ-Š¸HEjã+¥HÄ\'D!‹Ttb¦’d3ôˆ!­sJCç%üxˆBP\"³Æ¤˜ˆhÀŒgÜ\0‹`	­ZÚrF?Á%ÚÖËÓYéñ\\HOuµN\"¿‹ÃY1QO„/\"ÇP<µ‘Ü8‚\rlp1!AˆB@¿àÅ\'Q¬¼CUåæ*†‘\n€y\"a¼~ñaĞ41IŠw\Z#ƒ”¼oJùgš1üI]H3–8 _\0,˜(#r‘_¼!…DvZ›Q\0#‹q0!°>O¥‰ØÃŠõªòÂq«ä)>aşS+zâ=ä©î“3²ˆ1nLÑQó3*(U ¨ªE•(’Kƒ•ĞNe¡±Zğ¹x2±\\L¤mÇF3æ\nP˜Ál+E%·™WÜôFciY+UQPŞê…¸ğƒÑ0+;®1ğ ›Æ|4i¬L~¢ÔW€\"0Å(´ËÚO|OUT2h6¸Q\rò\"ãC¡0d#79–*”@¼\0K*R±Û^Vi\"’”äéš1)‰Ø—ŒHÓ*~aà¡\n{zM¼ÜÈH&FÒ.^qÙÍ‚ˆ¨ğE.Pñ¡Vd›ø«xÇû\n_Hc«ÆğÅĞ¢!hä¢»´mÕ‡e1Óş\05CõµUÔËEÚ÷tÍaDã™mÄ\"³”‘\\´`ÊÈH–@¸B„Z\"Š7\Z‰Fääb úör§øûÙ\\~h„#á†4z‘‹´´í¸)Å\'j±S°˜ª³\Z;†,¬V ÌH¿§“F#LiŒYtÃpb=\Z4ú[))Tõ³0\\!ğ	ë4~¶È!òb¿h.mm46¦âR,FóB®<µZ|¢X½iÛ©Nåˆ=ÌáÕ•ì„ ZU\nG³…°3#²adÌ‚\ZôèG%®\0èõ ÑÏ!³}ĞlÁ]ÁÚÖş\Z6ñŠxNãÁ\0‹ÀJ!ƒHƒ ­î5I¡ÒÜşŒUµA±/®œSxT®¹Q)n÷À3èúTŞìD%]-×´<7\ZD¡»!rÈ£öĞ˜İlg;ºPÓö–àzrí+€á&†•0KÛOxZªC¬s%OU‘•¶÷!¯™‹±9›¢Y(.×¸fój#D6YîˆF$¢X ¨%4±‰XÜƒò˜9ÜÑ},£‚ƒÖ…°u (&ãÖƒÂµÁàq<Ìâ«˜­jªxqÒ_°ª˜à4õBĞ‹1^ ÙÌg†±ÌrÖ³˜%¸uªú˜6\"ç 0…«\rˆBÂv±è?­¬ãäÀ‡=ÒÁ!L<„4Øzç»ñöşdãÖ»¬0†Æv¡©J…”RñÚ?‚¤Æ”sı´¡\rªã]WNóB¡µˆ>x†ÇnZzÓòDÜè…-&‡\nUÈŠ„ F?şñylßäxÆ3è¡yptë‚½è»qÓŸŞ\n`P}¬m?”Våš•¯|i¯oİ·8á¥l`…8‰ˆ„_	ãìJ<å£µÃ3f`à†b¨†n`HÈ„Lè¾˜‡yğ‡ø¾ğ+xHp ó‚ô;?fK4°s?Õ³‚(ˆ‚\'@\nXd †Ôù…)©¤™’’!Ô+Z{5ª[+Í*À…Q0¼B0<Ö…•\"ş:PÈ\"ì\"fèê«†YØÀL˜„1t‡í+‡í#Ağ{†d@Ap\0‡JpÁóû:;k£Á\ZŒ&à€H\0)Ø„¹ë*[ÂÌÚ©*i`Ğ9X3[ˆ³V‘¯€‘ˆ[p“c*4–Åk³È&[@…PX:B€l…dp…1$‡í›4¬¼ğ[CzH‡ä<õœ‰›ÅÓ»¶;¬A&À\0€8\0UÈ…ÊyBª9§ú™lø™Ú¨$Î¢QÚ©‰@šŒ)…E4ÖjÄ38ÉU˜B@DÃVpW ÅI }\0AU\\5œ|è|H«“8¬ó–êYâ8+HÕşK‚€T0\0\0\0èÅ ‚M@U@b‰+ŒÁyãx9Àj›ÎÒ,QXCê¬cĞ¤iKYD[Fp¼M„Pì@1´„st…—,ÅgHÅîAˆ:ğ›„Tì‡~H‡J¸:Á‘‘%~¼Ã€DÊ„0HƒìÅÈ€1˜…\\\0£“+P@…h¨†{‹¨wá%”:Ãó+‰hzb0…âñDPäÀ1´„¸„É¹ÃTLEÀËœ¿Sü‡~€Z\0Yê—À‰¢DÊÃ<L¥d¦dL\0\0€¨AÈí\Z…RÀà{ÎÊÆŠ \'\"‘`xi(ƒ-(ƒB L7…ş\\`Ğ.FI@C0¸ŒK™œËR4yĞvÄËĞrxGr8ÅôKÀ‚ğÀ‰@L¤TNœ€ç„¸\0ÆlL_¤€1¨†º†fx—\"2-\\Ø\rŠˆ9iŠŒAò×)×Ñ¢‰¢B„w˜‡ÙœExIû¬Í˜´„d˜7 İô>ß\\‡àäË¾Üs¨LNœ`Îä„ÎhhNê¤Î^ìÃY0†‹\nÀ_è‹hèS §ù…h±­â—ŠùÆ+-ƒ5ˆOí›‡IÍ;°Ï>èKÀOKh…gèÏV(C4$ÁP¾ìÉ}€xHP+XĞ&Å	…PèŒşÎ8HmJÆPP(Y€ÆOn‡­2@IK_P…AúAš\nôÌ1ˆí#Á•M2¸ƒ;èEÀQEPtôQCPƒõ¾w,Ò¾¤º}À$MĞãtÒhF•RèœÎ*µÒƒT€ \0	ÈBØ#oZ„æË…jØMØ°Îš^Ğ43“ESe2‚)V€Ó4ìƒ;pƒ#È2¸Ó<•Édh78ƒgPT$ÒuœGC=T$Å&}ReT(}Ôè„€V§€j=H\0P\0 €K•\0xƒQ\0ºOh”\\ÙÆÎ:-i0³]„Æ{TÕ9 „7RpU`\\şÅS;ÅOWèU7˜„| ÁĞw|‡Ãx°{€‡}@V]V(P)m\0i\0jµÖ^T€8€n½TF`·R\0Ç+Wàá‹Ò‚›»C†P@…ìj?(Uè†}Rt;%à5è5P2P}Iş<CRw¿]ØW|Åc…LHç¤Xg•Pé4Œ\0Vk½Ò^”ÖÅ€²•\0) M¨Â´0_H–,´…\'¼Æ»S‡˜…½Øe¸‡XõM}p<ıY87 ƒÂ=ÚEÇd0,˜ƒõ>5l…VXØs Üt°$Ås°ÚĞ¬P\neh5È¯€ş°Û§Ä€À\0\nX‚\'¸FÈDÄm´K©­œuè‡aP…WP~R}À|ÀÓ>øY8ƒ30Ü£ı×VèO,HEÜ>ğÓ…1Œx8g\0‡sH‡$u†xˆLØ¥ĞĞè4¦4İj-]÷ÕX>Ä€Pİ\Zhİ4 „êDF`¼müPˆ5üÙePu‡P„8Ø„½EÃyß;ÀÕ;Î,`Ş:­Ó;}IèıQÇ­<]h…?0W€pX†eè^spg(Şx\0„Îeó}ÎĞuJuß\Zß\r¶_&`×dx…P@¼Q°\rX«$ÒU@†jğ…P(ş9ÈYíëÉ……‡x€`à\nÕYåÑ˜CÙl…y`GÌ„?\0aEˆ‡e ZHaZ0‡x bg€­ehİ½Ö\Z¶áNİØa~‚6ĞPÏ,([¨]`Ğ˜5Ó„7q¼Yà)îÉ$5s &°S%h\0&¨àîƒÈ\\€UC¸r˜‡qÁ38‚#À2H5^X¨g¨bx˜dÍµ‚G\r]8ÈiÍc=Şe=€èc(%0f&°‚²«‹cf\0bà†hH¼fn\\ „MŞ¤:z¤\\s`%\0@ˆ‚à,È¢=Ú1œ„ÈK\Zuƒ?ÍwC8‚õ…\02ş\0„J¨=€sä^c=Hè]<n_jåX¥€HÈ\"(‚ˆ.æù“aôC6dê+T°…^’cĞ[m¦:Íëæ<g0˜Ps6Z2Pu†^=¥QCX^ Í‡dX^,àx?0Ğg¨e¤}Ö+HÈXI¥a„Îã±_pĞ¨ş\0øÇùÛUp[v“BUT¨c˜cP‡½-Ô†M‡n6æp%`&8g£Ë–C˜vg2È‚>‡q`‚T>&PkLğisPãJ€e=€?¶>j^–TÅ¾Öøm”¦vúÍa÷(Õû¸öTØª\\ÈÆ	ê‹\'Ìİş}(k³FkpL\0ƒ¶.\\20=µÏ/niÙe282p…(¸\0ĞW8PkÂv}jÃ¶‚ÈØÛ+½cÓuìHİˆì€î@‚Ê~¿/„YP…ârâDTÈ·õÔ[ˆ…Ø†%és0‡´>í9¾Õsvmº¦Ñ<5„¡­dİ†€ˆ8€îş†ƒáVÔÆ´Öi•V [††îÈŞ©‚êddĞ)[p›¦á‚Š<ˆ½ò~Ånèp†…^í;uí>PçÖÆSCpÂ=°ç0&Ğï÷ƒ=¨Lq0€õ¨o p+ußäöZ_ìV‡n¨Öş;ë­bĞ0¾hÂ«BÈÙ}èp§\\ÊMpÖq§Ó\\ÅÑ;…íY…à,`İæéä\0À3°Aßï(h¿\00€€jÅcÅ®aÛ…ÎáXğX*è8²›…j&&§Óùßš•„{Àò,gv8ë-\'jq% S¶SMQ¶S50ç‡ñõ€¸sxáç\\€ \0]¾sİfõàs\"Ïc+ÛnmîB$¨D÷¸/ ìvÈ†XMA½µôK¿ôLO8ˆN_k¡\rõYuŞP>Ú;é3È‚zÆó#lÅuÃ0ŒYo\0€\0Pó<¿õ¤r±şæ#/ô_\raÿEÄ£B9«…QØ†{èph‡ö-OLPw@`‚nu¡Ã;èöoñqÇ‚r\0ÈVv¿uÀİNe¿u=ïåIåó–€¦ß{¨‚}÷¸?\\Ë83<£s„Pøz0øKwÃîMx+àt„x3—x?µÑw6õTç,¨ç=çxxguy¾Nu<gõ=7îÓ-İ^Ny_L\0	Xù¨ÎBî%OtÇz3VY·}Ûçyv@‡¹ÿùŸß^¡‡8ğt¢ıtÖÓ¡U70„Âe Ue§¿\0^ÄV¨owGu«Çs¬¿õ=[=¦÷àÖsA#xş³ö*ø‚s¬R…T…SX©=p„WØ†¸GlÀ7Ä†eˆ}p0¼W‚}EgŠ\'ÚU;õÓÁ¯ä½Æ‚âçvW|7‘çU¾øÈ/y¦ìE\"÷sÅüÈá²ï|èü`Ÿ‚*²£„ZÂªj3ch}¹}ÙÇ†5Vcx\0L€ˆ:ıttnéß—Í£µk§/ş3\0,& ¸\0\0À\0L9Âƒ,MP¤xáâ0€£G=&< Cˆ*]°T©C’*aÂàátë×°œ©\Z\"fl»zèĞaÃ-Z|*UJVQ²¨Qs§ªUE“®º9şã5Ë‘ˆX¼¹0\0\0‡‘ ğpø0âÄ…&0bÔØ‘$Ş¼˜aÄÈ–,S¤xYE&ÍQ¢R¥zô¨‘)Ÿ@…wT)ŸÌË¶€‘%‹›>}°ö1dH\r5gÈ|föL×0à@REš%8L,Aô¥ˆ\r,ÒÍR/ò„	(¼T™Bğ#S¦ ¦ùÊT§Å©J}úôj[=vC^æ¦K=œ™d9sÇĞU5¥M“!³:b&Õ¸Ár¡@ªà’¨‹\'àQ7ßx3„,ÌER\0I$ğ\0\nÍ©ØHL1ŠxÌâË(¥ˆ\"J-Ü;âÕh™Rşè	a˜ÀÀlnTuÇn\\UkpÛ<0ĞÁCøplĞÍ=õ8qB,~óì–ÑEZx†\Zr¨_˜ˆ`#ÂTM› )‰RŸß…‡N7.Ã‡`ô¨«YÅ‘«±–…XK!N8Q‚\'¨`@apòMCˆË^xáD*ÌA™f^HÒ«$€„\0gœrÆ„\"M” âK#$rL-¤PB# ‚3¨VD	LèwUª¥†ÚgŸIô\ZYDà p•8\0¨aH2Ä¹àF BFfÊëGhpÀr(„ÃJ.¤0¢‰tÚAI(š0Y@\0;','harper-125x116.gif','image/gif',12520,1);
/*!40000 ALTER TABLE `user_media` ENABLE KEYS */;
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
INSERT INTO `users` VALUES (1,'harper','202cb962ac59075b964b07152d234b70','asdasd@asd.ass',1358105447,1361117371,'[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]',0,NULL,'ĞĞ»ĞµĞºÑĞ°Ğ½Ğ´Ñ€','ĞĞ¾ÑĞ¾Ğ²','ĞĞ½Ğ°Ñ‚Ğ¾Ğ»ÑŒĞµĞ²Ğ¸Ñ‡');
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

-- Dump completed on 2013-03-10 22:42:37
