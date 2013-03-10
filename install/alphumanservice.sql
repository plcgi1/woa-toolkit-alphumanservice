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
INSERT INTO `action` VALUES (1,'NEW_PROJECT','Новый проект','/part-form/project','[\"GET\"]',1358105448,1358105448,'page',0,NULL,0,1,NULL),(2,'PART_PLACE','Куда','/part-form/place','[\"GET\"]',1358105448,1358105448,'page',0,1,0,2,NULL),(3,'PART_PART','Участники','/part-form/part','[\"GET\"]',1358105448,1358105448,'page',0,1,0,3,NULL),(4,'PART_GOALS','Цели','/part-form/goals','[\"GET\"]',1358105448,1358105448,'page',0,1,0,4,NULL),(5,'PART_PROJECT','Проект','/part-form/project','[\"GET\"]',1359307653,1359307653,'page',0,1,0,1,NULL),(6,'PAGE_PROJECTS','Проекты','/projects','[\"GET\"]',1360014305,1360014305,'page',0,NULL,1,1,NULL),(7,'PAGE_PARTICIPANTS','Участники','/participants','[\"GET\"]',1360254702,1360254702,'page',0,NULL,1,1,NULL),(8,'REST_LOGIN','Логин','/ahs/auth','[\"POST\",\"DELETE\"]',1360255039,1360255039,'rest',0,NULL,1,1,NULL),(9,'PAGE_ABOUT','О проекте','/about','[\"GET\"]',1360272368,1360272368,'page',0,NULL,1,1,NULL),(10,'REST_GOALS','Цели проекта','/ahs/goals','[\"POST\",\"DELETE\"]',1360449184,1360449184,'rest',0,NULL,0,1,NULL),(11,'REST_PROJECT','Название проекта','/ahs/project','[\"POST\",\"DELETE\"]',1360449662,1360449662,'rest',0,NULL,0,1,NULL),(12,'REST_USERSDATA','Участники проекта','/ahs/usersdata','[\"POST\",\"DELETE\"]',1360449781,1360449781,'rest',0,NULL,0,1,NULL),(13,'REST_GEODATA','Место проекта','/ahs/geodata','[\"POST\",\"DELETE\"]',1360449825,1360449825,'rest',0,NULL,0,1,NULL),(14,'SETTINGS','Мои данные','/settings/contacts','[\"GET\"]',1360511521,1360511521,'page',0,NULL,0,100,'hidden'),(15,'CONTACTS','Контакты','/settings/contacts','[\"GET\"]',1360511627,1360511627,'page',0,14,0,101,'hidden'),(16,'PASSPORT_DATA','Паспортные данные','/settings/passport','[\"GET\"]',1360975353,1360975353,'page',0,14,0,102,'hidden'),(17,'REST_CONTACTS','Контакты','/ahs/settings/contacts','[\"DELETE\",\"GET\",\"POST\"]',1360975725,1360975725,'rest',0,14,0,102,'hidden'),(18,'REST_PASSPORT','Паспортные данные','/ahs/settings/passport','[\"DELETE\",\"GET\",\"POST\"]',1361113648,1361113648,'rest',0,14,0,103,'hidden'),(19,'REST_PARTICIPANTS','Участники','/ahs/participants','[\"GET\"]',1361220725,1361220725,'rest',0,NULL,0,104,'hidden'),(20,'MY_MEDIA','Мои медиа','/settings/media','[\"GET\"]',1361461049,1361461049,'page',0,14,0,104,'show'),(21,'REST_MY_MEDIA','Мои медиа','/ahs/settings/media','[\"GET\",\"POST\",\"DELETE\"]',1358105448,1358105448,'rest',0,NULL,0,1,NULL);
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
INSERT INTO `user_media` VALUES (54,'GIF89ax\0t\0��\0	\r\r\r		\n\'!%.\Z\r (#\nA#%-\Z6(<\'-*- 1\'-%7*2+\'-/=*L)23L3,=I3%18;E5%K487:?7&4:)+@891P3&C7:I850G\r8JP@?`=0UA/\\?0_?+@H4OD2TB8DFB;L#EI$\\A8FFK\\C-VE,bA8hN7fN=nM6cQ7NW@\\SAI[/TTYTX3eQGcQNVVP_TWQ_ u\\._c[y^Fo_[\\fQbfBu`FobEt_Tw_MachkagWk?Xl7[l0�_G�h6wm[�k_�nRgyDjv\\zothzLh|>sswswPttl�}�z�ht�L}�w���}�V�}wt�Uy�_u�H��I��C��Z�����i��F��v�X��k�����c��������d��V��n��x��e�����]�����_�����a��o��o��g��^�����k��������u��������g��������������z��i��o��o��v��w��p��|��w��v��|��q�����l�����s������������̫������w���ί���}�����}�������������ă�Ő�đ��~�Ɗ���ą��y�ŋ�Ǚ�Ő�ɇ�ƛɾ��Ǣݽ��͑�Όܿ���ɻΆ�͙�͒�͍�ǻ�Ϣ�҃�ԍ�ǧ�Ԛ�Ք�Ц�֡�Ѷ�Ζ�Ά�˵�ث�������������������ݻ��������������������������������������������������������������������!��Created with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - spam spam \nCreated with GIMP - sp\n\0,\0\0\0\0x\0t\0\0�\0k�v��f�p��tj�C��\"Bk��`A�Ьi��V#1qF	�&-T�B��\"FL���ոE+�*��\\���کj�*T@CiR�SU�hՊ!ۥ�\'��?M5�\Z�j�F��b5e+*S�j	�U�6mل	�5,��T�dɕE�V�RvO����\Z�kך	�\n�0�-��\n5���h�}+�W/�3�-mjӗ�8�vEZ��&��4\r�\n\n�)PX[�4�-`�l�{J��cښ�m��ѣSrOu�˫��O����hmX�`��M�8M��f�Y��j	9���/-�,V��f�^m�����]Ř:ͥJuUP��m�e՚�����\"�8��p�5�)���/�`�\\��r]0��r�4�]^p�0M6,B�\"n���^{Ѽ�x���KVO*���TЕ�m��7�W��b�\'��G\"�t��p��#���!F�Ԓ�r��r/�&)����_UD�1�d#�y�M��d��d�x�HSc.���P���\n#XA��T\\͆��@#���#�$∕�|�W3�5������\n���%�]�e63�v$zWJ��4�D�.6I�\r0��ٟ�$$hd�єZ#@i_.���Z#�V:-��%��\"f*�tr+^��E�1�\Z&����\\vyЉ$�&r��5L_��B\'(��B.B��-���\"�{�$��&�l�g/�\\-P^E[m��񆷯4Mq��&��(\'\n/̘\'�0� wk#��k�љ9��ACWE����C��B�-�,\"�A�i\n��H5��!�L{�մ�31�5X��d�S��S�AI-д5L�r](K*V�L��҈�/v�e�\\FW�-,�Xv��,4r�4\"\r0�X)K��s̬�x�H!��N�ը\'S���Z���D����Q�e�qHC��U7�խ���f^#�#��\"�@�t��-x��v���KB���\n.���01ks\rZ��\"T���L~�U��S����|�wf��Fh��lt\"7��9�C���gf���\'J�^i0�ك�#�_4CP�P�2��n(#\Z�Y̲q;��F{B~�����X\nNz1i��(7���`�����x�\\D��<�-f⅙��ac$� ���\n�#_I3���\rv��Ї8ޡ�������r�t�cʤ��\n�l�P�)�U�u5��bb�a�0�\">B\"N*RuȂ�\"iǈ�0c\'nd�;\"\n��~��i�(�=�1�d�c�x$��~�C��H�4����QGzR�׊��l�)����@�ᘍ��Y�2l��,�(|3@Q$�\r���\'�&[C�����H���0F5�ўm��� e2\\1<�X�(�?��WvC}˒Ŧ�B�Ԉ}�a�{��\Z`�*�İ�B8�\r���4�I!��[9�)�3� ��O+\"�-H.NpB|�;�(�y�����)�1�V�C���3��J3�(�\0�)|�PUT#\'T�����EC�_�	*�?4���ă4��N��6���h�����FBF.<���>��S���(�3ȱy�t���C&tA\re4��JT ��8�!�yX.��З)���l\Zѥo�mT[�H[��\"id/���k�?E�a� $A\rq�C��<\nۏ��C�Ȅ�]��ܰXq(c�h��D(_$5��m����)�k�\"(�@/Tu�S���4�a\r���]ҘoD.�Db0� ��	1g�P̂�ȇ;�+\\y�c���L�a5\"�`E2���ͥ�,�R��0CE5���N׎�F4)�W`�N�ơ�������Bܴ~�A��ȢL̘�\'E3�lp��Gp�aX~@8���%�AjL�\rnp�L���v��\\�-��hp#�h�dE�u�4%b|��j��V�b�0���\0\n[�\"{�C2�H!������J1�Q�BM�S�8������-�<豏,g�G+ !�wP�8��L��\"��A�7WR&��ƜY�^e��A�ezQ��JA��WXC�8`�SD�h$F3S�\"�+��~J���)=�Q�L�T\rjG&��w@�\r<���?��\Zh\"!�K�Yč�[\Z��d4Z��N���&dN�ae2�1�\r%�:b�P*ŉ�_��A��8��	r�[��u9Z1TWd��h��JH<�#�\0.��?Ha\r�ȭ�e\n1�n��Lza(��P�Jz13�!�l��� �O��.�`��>!�נb����B����(�q�Q�q�����+��S&�`	i`�8|�@����T�t��ҵ��)r�Z�dP��m�P\nFE3���\'P\n(���,X^%�[��\\�E��@�a\nxxGPˡy��ɰ�%�>���D��\'��G:F��H���\0�� �t����P���!Sg4Ψ\ZOƥ��	yU��^�t�z9�Ȝ��~02�§65�%�@|Ϡ�`}�w`J��\nd�X`�7 �}��R�$��T\r��79�O�~W#.�\r\'�b��A3br+�L��u]rP�&�18����	tez-��������0Xϐ��\n�P\nhS��x`t#�m ��/��~�\"3TKGap�`pg�:�B{ �^mB\n���?b����\n���%I�	��r���P�6E\r����0�E\r����sn��eX��8 � E�2h(	A�C:�/�F0Hw�X�h�P\n��IH\n�3?X�7��Ri��8��p\'qr-WnQ(���5�}�W��8uJ�����vA���	���R���\n������0�\r���q�*��S#jq\n�<BX$�	� \nE�M�0l��Lr 	w���O���4���W85}U���gpGPa&0�*���\nY!r 2#�<��`[ǆ�\"{�\n�=�F�F�?�R\n��5����R{զ9�:0R���{e�8�\n�w~O(�z�\\π&@���*���P\nA�	e`����-��y.bp�RB:365�[И�k�=8e�_���c\n��mZ@D m@\r�4�\"�\n6�(yJ\nX��@�U�E|g�G�oi�D�\n�q����q L�S�&���_�r\rnXp�\"���(U �U2��dQ@g�b-�\0�0����O�0�9#i�����ixgS�V��p&`*p�5@	��ĹL�&Le�GqPF\rT�k�\"��ft�F�@!P�%�\0\n��<\\�!\"�7�E�T\r��[ain�jO8���\n���@\r�����\\������\n�p{P�9/Vq��Lm$�pb��\"Q�tu`DT�<v��@�f�Vb%�Qf ��Q��\rF{E��9���O�Vp-P@\'�pZpk����XU��n�5��0\n��	H��%� ��8m�xGRIi�q���\rxS��2\n����&/l0�p�P�j��\n��\r��@��p\0	.�a��K��\0��\0�\0��\n�u\Z\'P6�0�O�$�5��\n�P��&Qr\n!���GA�\Z�@K��#�\'�Ѱ����^	�f v^�	�� �pc�0k`�Ep�z�\0���`\0\0����\0�\Z�k��\0k\0p\0p\0�-*	��ۀ�$\rS� �zE��9��\Z�#R�\r��\Z�����Q��h���%S�����	�P�zT\0APP\0��\0\0� \0@�p*��\0P\0T�\0	�\0���F�\0@k�k�	ʀ�@\nrQ²,52H��gw����^ρ.5�O��Vr�h�\ZpW\0@K��\0 \0[�\0(�{\0�\0�� �R˸�\0\n0\0\n��PD�	��[+\0�z��K�c�*%n2U�p�r�%(���!.Bז�Ӵl��s���`6pa\0@$�\0��p\0�Y���\0\0p�L[\0`\0��#�iP5 c *��K��J6@50�`�Cm�b\'v�){�F��3[T@�5ĳ7f%״���3��2�2��B�VK�\0%�������@w�O ( ޷+̴Fk��$̿���l�a�c҂iE�A��9Y� [����/ƀ6pЫ\Z���S[�p�K���-�\0\0\0 ȵ.,f`xO���s+�\0@�K+\0�\0��\0��EC�\r�\Z��a!q���W�\n�CQ[0Yz���Ʊ�8��ŜP_`Ip���C[���m��;�����k��\0#p@f�`}� �>���\0B۸K[����:����,�\r���Z�� w15�,�ab{��t7F�����RhPT��7`\0K���m�ۛ#\0\0�<\0���c�\0�f���`m�O�\0L0�����0�u�4_�@��_a�R$�3\n��%��2H�џ\"�\n[\Zr\n�@	���Wp����\0E`���5��\0�+ �\0�K��ԕ	K�}*�ǽ*@�@��,�-\r�I�u(Ci��xaIty�p�8![��=Y�co��Pp�K�TK�\0�\'��v��Kp�P\"@�=�к�(@��\n�`}5\0�_�\0\" C����@��/�q\r��=���`Q�b!z3�v��)�|i����J��+��v�ܴ`��`�pK�`\0p�+�A� ���D��O��\\%�\0�:������\0��I|��g-(�D��tĐ���N��j�*��M�Z&�2����K�`�$P\Z`�\rD�p��3�����$��=�%������`�A��<�#�\n�qRi۷�=?�\n*�� �6��NrvPC\0ƙ;�{�,���R.7��N�\Z��T@@%0�mC{����P� +h����ͥ`�vd�*q�6��B4�Piz���!f2\r�L%��@\07�\0�=�^�T���}Q>�3@�D=4@B ���\n�}�\0$Pd�E�<gQ+d�)�@\nj�)�0\n���I(�F�n����.�cA�`^�@\0.%�C��^�.�.���~������\rލ��wj`\0������ ̓��@\"d1����b\"���Zi��8*~��\r�a&�a��BK��^\0C�����3\0�/�?�zB@��ٮ����=��{�\'���oP\"��\n�����(�p&���gr�Q{������,���\n�I!�����j�7-�>\r�4@�+P����\Z��]�T\0�%`$��Xw�SpN��El`Ӹ�`�~� 3x^j����`i��ӓj%�[�Ё�\Z0��˴��N��D}�0�.30+���B��]C��\"�\0{̯F^�0��<��=y��#���Z�c��m���o�N21۳��Y���U�@\0���\0P> �[^�N��_40C-�_�aTP�ߍդ��{�SP��T9Yh���{op;(�!�S�Ĕ�\n\0a�ثWƸqHL�Bb\n�	�ŋW�Ry	�v��W��<`�\0A�4���c�2n�����$l޸�\r(P�P�2�D�#�p��>��L�7RѠ��FG#lN��u��XP�5r�H��Y\n4�PZCc\no�*%���Z��HAÆ�V@��G	6e�Ԡ��M2J��������P�)ժo�DE�D�)HB����\Z�c�Ju�T���O�ֲ�\\�[J�(	|Eʓ^^�\"��I�������ȓI��a��+mFذ�0�t�at��J�R��2�H�&sN\r�\Zh��E��$h����8�P�8�+��H��Op�� \\p	��7>B �4���ļ�I[�,F���!����\0@\rJ��-��L�������9�j\0i�!(8�^�2� b\n9�$�QH!�\r=9s�P	e�Dd�͇:`̆Ixq?�\\!�d�A�}j��2����x�i�<��$�C�C1�4c#�H�YNAU�D����Kp�M!d�5Ѥ�2ИʴB9MRI�P8�-(��*R����J�sk\'� �	V��o\r\"�\"T|����j�����l�iH��	f�U65C�-r�ARO�$�VOaU��N�r ��ak�\\�#\"�1��B�8���(\ZŘp�y��������J?=������!�b�\"|�ԏQ�&Mi��9�Mc�Ɠ4o���U\"�#T#��X�@rC5`TOa��	�{��TF�Y!&B\n)�@\"#..E�j�P�B,�����:�Oog�!�c |���!T	?0�%�`&&`L	%y5��H\"Y�^R�NR?#���c�)��S�ď8\nᔎC6n�Mn������-ʈ#�T/E�\\�S?tP*)ɼ�^$tp(R\Z׆�@#���.���d�K�|������8�0c�E.�F��x9}a��{/1�[6!��ȡr���1b	c����T�H0o)��dD0�D�%��U��!�\nv �v���f,��D�;:���+�-���Z��\Zטƻ�q�iLc�h�D\r�ɋ.1����HP�`o�C�4��\r�%�Ё����L�h��� E&S�\rBUMvԡ0j�E,������b9\"y���Q��/:U�$Y����.���͑�Cf�OqR��B	�r�3�E.�A�P)EE>\0\n�w�fTIoC�\\R�׉G,���Զ6L��C�-��HEj�+�H�\'D!�Ttb��d3��!�sJC�%�x�BP\"�Ƥ��h��g�\0�`	�Z�rF?�%����Y��\\HOu�N\"���Y1QO�/\"�P<����8�\rlp1!A�B@���\'Q��CU��*��\n�y\"a��~�a�41I�w\Z#���oJ�g�1�I]H3�8�_\0,��(#r�_�!�DvZ�Q\0#�q0!�>O���������q���)>a�S+z�=���3��1nL�Q�3*(U���E�(�K���Ne��Z��x2��\\L�m�F3�\nP��l+E%��W��FciY+UQP������0+;�1����|4i�L~��W��\"�0�(���O|OUT2h6�Q\r�\"�C�0d#79�*�@�\0K*R��^Vi\"����1)�ؗ�H�*~a�\n{zM���H&Fҝ.^q�͂���E.P�Vd���x��\n_Hc����Т!�h䢻�mՇe1��\05C��U��E��t�aD㙍m�\"���\\�`��H�@�B�Z\"�7\Z�F��b���r����\\~�h�#�4z������)�\'j�S����\Z;�,�V �H���F#Li�Yt�pb=\Z4�[))T��0\\!�	�4~��!�b�h.mm46��R,F�B�<�Z|�X�i۩N�=��Օ� ZU\nG���3#�ad̂\Z��G%�\0�����!�}�l�]����\Z6�xN��\0��J!��H����5I�����U�A�/��SxT��Q)n��3��T��D%]-״<7\ZD��!�rȣ����lg;�P����zr�+��&��0K�OxZ�C�s%OU����!����9��Y(.׸f�j#D6Y�F$�X��%4��X܃�9�я},���օ�u (&�փµ��q<�⫘�j�xq�_����4�BЋ1^���g����rֳ�%�u���6\"�0��\r�B�v��?�������=��!L<�4�z绎���d����0��v��J��R��?��Ɣs���\r��]WN�B���>x��nZz��D��-&�\nUȊ��F?��yl��x�3�ypt���軞qӟ�\n`P}��m?�V嚕�|i�o��8�l`�8����_	��J<壵�3f�`��b��n`HȄL���y�����+xHp����;?fK4�s?ճ�(��\'@\nXd ����)�����!�+Z{5�[+�*����Q0�B0<���\"�:P�\"�\"f�꫆Y��L��1t��+��#A�{�d@Ap\0�Jp���:;k��\Z�&��H\0)؄��*[��ک*i`�9X3[��V�����[p�c*4��k��&[@�PX:B�l�dp�1$��4���[CzH��<�����ӻ�;�A&�\0�8\0�Uȅ�yB�9���l��ڨ$΢Q���@��)�E4�j�38�U�B@D�VpW �I }\0AU\\5�|�|H��8���Y�8+H��K��T0�\0\0\0�� �M@U@b�+��y�x9��j���,QXC�c��iKYD[Fp�M��P�@1��st��,�gH��A�:�T�~H�J�:����%~�ÀDʁ�0H���Ȁ1��\\\0��+P@�h��{���w�%�:��+�hzb0���DP��1����ɹ�TLE�˜�S��~�Z\0Y�����D��<L�d��dL\0\0���A��\Z�R��{��Ɗ \'\"�`xi(�-(�B�L7��\\�`�.FI@C0��K���R4y�v���rxGr8��K�����@L�TN�����\0�lL_��1����fx�\"2-\\�\r��9i��A��)�Ѣ��B��w��ٜExI��͘��d�7 ��>�\\���˾�s�LN�`���hh�N��^��Y0��\n�_�h�S ���h��◊���+-�5�O훇I��;��>�K�OKh�g��V(C4$�P���}�xHP+X�&�	�P���8HmJ�PP(Y��On��2@IK_P�A�A�\n�́1��#��M2��;�E�QEPt�QCP���w,Ҿ��}�$M��t�hF�R��*�҃T��\0	ȁB�#oZ��˅j�MذΚ^�43�ESe2�)�V��4�;p�#�2��<��dh78�gPT$�u�GC=T$�&}ReT(}�脀�V��j=H\0P\0��K�\0x�Q\0�Oh�\\���:-i0�]��{�T�9 �7RpU`\\��S;�OW�U7��| ��w|��x�{��}@V]V(�P)m�\0i\0j��^T�8�n�TF`�R\0�+W��҂��C�P@��j?(U�}Rt;%�5�5P2P}I�<CRw�]�W|�c�LH�Xg�P�4�\0�Vk��^�֐ŀ��\0) M�´0_H�,��\'�ƻS�����e��X�M}p<�Y87 ��=�E�d0,���>5l�VX�s��t�$�s���Ь�P\ne�h5ȯ���ۧĀ�\0\nX�\'�F�D��m�K���u��aP�WP~R}�|��>�Y8�30ܣ��V�O,HE�>�Ӆ1�x8g\0�sH�$u�x�L������4�4�j-]��X>ĀP�\Zh�4 ��DF`�m�P�5��ePu�P�8؄�E�y�;��;��,`�:��;}I��Qǭ<]h�?0W�pX�e�^spg(�x\0��e�}��uJ�u�\Z�ߐ\r��_&`םdx�P@�Q�\rX�$�U@�j��P(�9�Y��Ʌ��x�`��\n��Y�јC�l�y`G̄?\0aE��e�ZHaZ0�x�bg��ehݍ��\Z��N��a~�6�P�,([�]`И5ӄ7q�Y�)��$5s &�S%h\0&���ȍ\\�UC�r��q�38�#�2H5^X�g�bx�d͵�G\r]8�i�c=�e�=��c(%0f&������cf\0b��hH�fn\\��Mޞ�:z�\\s`%\0@����,��=�1��ȍK\Zu�?�wC8���\02�\0�J�=�s��^c=H�]<n_j�X���H��\"(��.���a�C6d�+T��^�c�[m�:���<g0�Ps6Z2Pu�^=�QCX^ ͇dX^,�x?0�g�e�}�+H�XI�a��㱝_p�Ё��\0����Up[�v�BUT��c�cP��-ԆM�n6�p%`&8g��˖C�vg2Ȃ>�q`�T>&PkL�isP�J�e=�?�>j^�Tž��m��v��a�(����Tت\\��	�\'���}(k�FkpL\0��.\\20=��/ni�e282p�(�\0�W8Pk�v}jö����+�c�u�H�����@��~�/��YP��r�DTȷ��[��؆%�s0��>�9��svm���<5���d݆��8�������V���ƴ�i�V [����ީ��dd�)[p����<���~�n�p��^�;u�>P���SCp�=��0&����=�Lq0���o p+u���Z_�V�n����;��b�0�h«B��}�p�\\�Mp�q��\\��;��Y��,`����\0��3�A��(h�\00���j�cŮaۅ��X�X�*�8���j&&���ߚ��{��,gv8�-\'jq%�S�S�MQ�S50������sx��\\� \0]�s�f��s\"�c+�nm�B$�D��/ �vȆXMA���K��LO8�N_k�\r�Yu�P>�;��3Ȃz��#l�u�0�Yo\0�\0P�<���r���#/�_\ra�EģB9��Q؆{�ph��-OLPw@`�nu��;��o�qǂr\0�Vv�u��Ne�u=��I������{���}��?\\�83<�s�P�z0�Kw��Mx+�t�x3�x?��w6�T�,��=�xxguy�Nu<g�=7��-�^Ny_L\0	X���B��%Ot�z3VY�}���yv@������^��8�t��t�ӡU70��e�Ue��\0^�V�owGu��s���=[=����sA#x���*���s�R�T�SX�=p�W؆�Gl�7Će�}p0�W�}Eg�\'�U;�����Ƃ��vW|�7���U���/y��E\"�s������|��`��*���Zªj3ch}�}�ǆ5Vcx\0L��:�ttn�ߗͣ�k�/�3\0,& �\0\0�\0L9,MP�x��0��G�=&< C�*]�T�C�*a���t�װ��\Z�\"fl�z��a�-Z|*UJVQ��Qs��UE���9��5ˑ�X��0\0\0�� �p�0�ą&0b�ؑ$޼�a���,S�xYE&�Q�R�z���)�@�wT)��˞���%��>}��1dH\r5g�|f�Lׁ0�@RE�%8L,A����\r,��R/�	(�T�B�#S� ���T�ũJ}��j[=vC�^��K=��d9s��U5�M�!�:b&ո�r�@�����\'�Q�7�x3�,�ER\0I$�\0\nͩ�HL1�x���(��\"J-܍;��h�R��	a���lnTu�n\\Ukp��<0��C�pl��=�8qB,~���EZx�\Zr�_��`#�TM� �)�R�߅�N�7.Ç�`����Y������XK�!N8Q�\'�`@ap�MC��^x�D*�A�f^Hҫ$���\0g�rƄ\"M���K#�$rL-�PB#���3��VD�	L�wU����g�I�\ZYD� p�8\0�aH2Ĺ�F�BFf��Ghp�r(���J.�0��t�AI(�0Y@\0;','harper-125x116.gif','image/gif',12520,1);
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
INSERT INTO `users` VALUES (1,'harper','202cb962ac59075b964b07152d234b70','asdasd@asd.ass',1358105447,1361117371,'[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]',0,NULL,'Александр','Носов','Анатольевич');
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
