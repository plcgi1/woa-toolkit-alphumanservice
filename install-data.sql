-- MySQL dump 10.13  Distrib 5.5.25, for Linux (x86_64)
--
-- Host: localhost    Database: alphumanservice
-- ------------------------------------------------------
-- Server version	5.5.25-log

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
DROP DATABASE IF EXISTS `alphumanservice`;
CREATE DATABASE `alphumanservice`  /*!40100 DEFAULT CHARACTER SET utf8 */;
USE  `alphumanservice`;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
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
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `lattitude` varchar(255) NOT NULL,
  `longtitude` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_routes`
--

DROP TABLE IF EXISTS `place_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_routes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `route_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_routes_idx_place_id` (`place_id`),
  KEY `place_routes_idx_route_id` (`route_id`),
  CONSTRAINT `place_routes_fk_place_id` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `place_routes_fk_route_id` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_routes`
--

LOCK TABLES `place_routes` WRITE;
/*!40000 ALTER TABLE `place_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_routes` ENABLE KEYS */;
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
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `lattitude` varchar(255) NOT NULL,
  `longtitude` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_contacts`
--

DROP TABLE IF EXISTS `user_info_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `phone3` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `icq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_contacts_fk_user_id` (`user_id`),
  CONSTRAINT `user_info_contacts_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_contacts`
--

LOCK TABLES `user_info_contacts` WRITE;
/*!40000 ALTER TABLE `user_info_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_discharge`
--

DROP TABLE IF EXISTS `user_info_discharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_discharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` bigint(20) NOT NULL,
  `date` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_discharge_fk_user_id` (`user_id`),
  CONSTRAINT `user_info_discharge_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_discharge`
--

LOCK TABLES `user_info_discharge` WRITE;
/*!40000 ALTER TABLE `user_info_discharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_discharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_ensurance`
--

DROP TABLE IF EXISTS `user_info_ensurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_ensurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL,
  `summ` bigint(20) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `company` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_ensurance_fk_user_id` (`user_id`),
  CONSTRAINT `user_info_ensurance_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_ensurance`
--

LOCK TABLES `user_info_ensurance` WRITE;
/*!40000 ALTER TABLE `user_info_ensurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_ensurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_passport`
--

DROP TABLE IF EXISTS `user_info_passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_passport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `received` bigint(20) NOT NULL,
  `place` varchar(255) NOT NULL,
  `date_of_birth` bigint(20) NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `updated` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_info_passport_fk_user_id` (`user_id`),
  CONSTRAINT `user_info_passport_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_passport`
--

LOCK TABLES `user_info_passport` WRITE;
/*!40000 ALTER TABLE `user_info_passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_place`
--

DROP TABLE IF EXISTS `user_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_place_fk_place_id` (`place_id`),
  KEY `user_place_idx_user_id` (`user_id`),
  CONSTRAINT `user_place_fk_place_id` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `user_place_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_place`
--

LOCK TABLES `user_place` WRITE;
/*!40000 ALTER TABLE `user_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_site`
--

DROP TABLE IF EXISTS `user_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `site_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_site_idx_siteid` (`site_id`),
  KEY `user_site_idx_user_id` (`user_id`),
  CONSTRAINT `user_site_fk_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`),
  CONSTRAINT `user_site_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_site`
--

LOCK TABLES `user_site` WRITE;
/*!40000 ALTER TABLE `user_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `created` bigint(20) NOT NULL,
  `updated` bigint(20) NOT NULL,
  `actions` text,
  `siteid` bigint(20) NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2012-12-30 19:02:49

insert into users(id,login,password,email,created,updated) values(1,'harper',md5('123'),'plcgi1@gmail.com',unix_timestamp(),unix_timestamp());
insert into site(id,user_id,created,updated,name,token,url) values(1,1,unix_timestamp(),unix_timestamp(),'me','123','http://localhost:3030');

insert into user_site(user_id,site_id) values(1,1);

insert into action(id,name,description,path,method_type,created,updated,type) values(1,'PART_REG','Регистрация участников','/part-form/place','["GET"]',unix_timestamp(),unix_timestamp(),'page');
insert into action(id,name,description,path,method_type,created,updated,type,parentid) values(2,'PART_PLACE','Куда','/part-form/place','["GET"]',unix_timestamp(),unix_timestamp(),'page',1);
insert into action(id,name,description,path,method_type,created,updated,type,parentid) values(3,'PART_PART','Участники','/part-form/part','["GET"]',unix_timestamp(),unix_timestamp(),'page',1);
insert into action(id,name,description,path,method_type,created,updated,type,parentid) values(4,'PART_GOALS','Цели','/part-form/goals','["GET"]',unix_timestamp(),unix_timestamp(),'page',1);

update users set actions='[1,2,3,4]'; 