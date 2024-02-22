CREATE DATABASE  IF NOT EXISTS `qltb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qltb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: qltb
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add device',8,'add_device'),(30,'Can change device',8,'change_device'),(31,'Can delete device',8,'delete_device'),(32,'Can view device',8,'view_device'),(33,'Can add borrow return',9,'add_borrowreturn'),(34,'Can change borrow return',9,'change_borrowreturn'),(35,'Can delete borrow return',9,'delete_borrowreturn'),(36,'Can view borrow return',9,'view_borrowreturn');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'home','borrowreturn'),(8,'home','device'),(7,'home','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-10 17:09:46.452907'),(2,'auth','0001_initial','2023-12-10 17:10:24.435814'),(3,'admin','0001_initial','2023-12-10 17:10:33.132856'),(4,'admin','0002_logentry_remove_auto_add','2023-12-10 17:10:33.245019'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-10 17:10:33.468420'),(6,'contenttypes','0002_remove_content_type_name','2023-12-10 17:10:37.285697'),(7,'auth','0002_alter_permission_name_max_length','2023-12-10 17:10:41.773879'),(8,'auth','0003_alter_user_email_max_length','2023-12-10 17:10:42.204473'),(9,'auth','0004_alter_user_username_opts','2023-12-10 17:10:42.313185'),(10,'auth','0005_alter_user_last_login_null','2023-12-10 17:10:44.729537'),(11,'auth','0006_require_contenttypes_0002','2023-12-10 17:10:44.814311'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-10 17:10:44.918605'),(13,'auth','0008_alter_user_username_max_length','2023-12-10 17:10:46.936691'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-10 17:10:48.578654'),(15,'auth','0010_alter_group_name_max_length','2023-12-10 17:10:48.766209'),(16,'auth','0011_update_proxy_permissions','2023-12-10 17:10:48.882867'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-10 17:10:51.305425'),(18,'home','0001_initial','2023-12-10 17:11:01.786893'),(19,'sessions','0001_initial','2023-12-10 17:11:03.364874'),(20,'home','0002_alter_device_name','2023-12-11 15:06:24.683947');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('53jwggl7dps3eqbn3gb1rjrw05rngqyt','.eJyrVspMUbJSMlbSUSrKz0kFMh1dfD39gNy8xFwQ18MDyC4tTi3yg_ATU3Iz8wyVagHB4RBL:1rCNMS:wS6hdVjhSSRBLUsiopC-GqvZAiJ74A6DWu9oWSaxhA0','2023-12-24 17:13:00.389647'),('h1vd1qqj8r1y5hc20blskmbjxnxsjkl0','.eJyrVspMUbJSMlbSUSrKz0kFMh1dfD39gNy8xFwQ18MDyC4tTi3yg_ATU3Iz8wyVagHB4RBL:1rCNMS:wS6hdVjhSSRBLUsiopC-GqvZAiJ74A6DWu9oWSaxhA0','2023-12-24 17:13:00.388648'),('kham1fnbxuhwz7u5ni2vq00c66a4wsaj','.eJyrVspMUbJSMrNQ0lEqys9JBbJDg12DgLy8xFwQzy-9tDKm1DA12TRPISQjMS8DSJaCBNLMgYpKi1OL_CAK80pKMkorlWoB67QZtg:1rGRMk:ltJ18-CZMeZl1_ziwl9eaiLHXFVmzkPrc3354rpGHR4','2024-01-04 22:18:06.295985'),('ui8pozabbh9arvdum7jzkioqlszz0hd4','.eJyrVspMUbJSMjFV0lEqys9JBbJDg12DgLy8xFwQzymm1MAgzTJTISQjptQwNTkJyEjMy1DwTcwEKiotTi3ygyhMKinJBYrVAgDLbBjb:1rEOg8:F4PX_ouVn52NvvS3H61VrTnagk9uBhmGn32Jw52ewDM','2023-12-30 07:01:40.702048');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_borrowreturn`
--

DROP TABLE IF EXISTS `home_borrowreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_borrowreturn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `muon` varchar(255) NOT NULL,
  `tra` varchar(255) NOT NULL,
  `lop` varchar(255) NOT NULL,
  `giaovien` varchar(255) NOT NULL,
  `tiet` varchar(255) NOT NULL,
  `deviceId_id` bigint NOT NULL,
  `userId_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_borrowreturn_deviceId_id_663ca481_fk_home_device_id` (`deviceId_id`),
  KEY `home_borrowreturn_userId_id_27005c5f_fk_home_user_id` (`userId_id`),
  CONSTRAINT `home_borrowreturn_deviceId_id_663ca481_fk_home_device_id` FOREIGN KEY (`deviceId_id`) REFERENCES `home_device` (`id`),
  CONSTRAINT `home_borrowreturn_userId_id_27005c5f_fk_home_user_id` FOREIGN KEY (`userId_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_borrowreturn`
--

LOCK TABLES `home_borrowreturn` WRITE;
/*!40000 ALTER TABLE `home_borrowreturn` DISABLE KEYS */;
INSERT INTO `home_borrowreturn` VALUES (7,'2023-12-16','1','11B2','bttmai-T','09:05:00',16,45),(8,'2023-12-16','1','10A1','bttmai-T','09:05:00',15,45),(9,'2023-12-19','1','12c4','ntthuthuy-T','09:05:00',245,69),(10,'2023-12-19','1','12c2','ntthuthuy-T','10:45:00',245,69),(11,'2023-12-19','1','10','admin1-T','08:00:00',243,3),(12,'2023-12-20','1','12c6','admin1-T','10:45:00',241,3),(15,'2023-12-12','1','10a1','ntphao','08:00:00',74,19),(16,'2023-12-12','1','10a2','ntphao','09:05:00',74,19),(17,'2023-12-13','1','10a3','ntphao-T','08:00:00',74,19),(18,'2023-12-13','1','10a4','ntphao-','09:55:00',74,19),(19,'2023-12-21','1','11B2','admin1-T','09:05:00',243,3),(23,'2023-12-19','1','12C3','ntthuthuy-T','08:00:00',245,69),(24,'2023-12-19','1','12C1','ntthuthuy-TT','10:45:00',245,69),(27,'2023-12-20','1','10a1','ntdhuyen-T','08:00:00',37,79),(28,'2023-12-20','1','12c1','ntdhuyen-T','09:05:00',243,79),(29,'2023-12-01','1','12c4','ntdhuyen-T','10:45:00',243,79),(30,'2023-12-01','1','12c4','ntdhuyen','11:35:00',243,79),(31,'2023-12-23','1','10a1','mthuyen','08:00:00',13,30),(33,'2023-12-23','1','12C3','ttthao','08:00:00',137,20),(34,'2023-12-22','1','12C5','ttthao','08:00:00',139,20),(35,'2023-12-22','1','12C5','ttthao','08:00:00',136,20),(36,'2023-12-22','1','12C5','ttthao','08:00:00',137,20),(37,'2023-12-22','1','12C5','ttthao','08:00:00',243,20),(38,'2023-12-22','1','10A1','htkhoai','08:00:00',83,28),(39,'2023-12-23','1','10A2','htkhoai','09:05:00',84,28),(40,'2023-12-23','1','10A2','htkhoai','09:05:00',244,28),(41,'2023-12-22','1','10A1','htkhoai','08:00:00',244,28),(42,'2023-12-22','1','10A3','ntxthu','08:00:00',48,66),(43,'2023-12-22','1','10A3','ntxthu','09:05:00',49,66),(44,'2023-12-23','1','12C6','tttvan','11:35:00',99,74),(45,'2023-12-22','1','12C7','tttvan','08:00:00',99,74),(46,'2023-12-22','1','12C7','tttvan','08:00:00',246,74),(47,'2023-12-23','1','12C6','tttvan','11:35:00',246,74),(52,'2023-12-22','1','12C3','ntthuthuy','08:00:00',245,69),(53,'2023-12-22','1','12C5','htsen','09:05:00',245,61),(54,'2023-12-22','1','12C1','ntthuthuy','09:55:00',245,69),(55,'2023-12-22','1','12C4','ntthuthuy','10:45:00',245,69),(56,'2023-12-23','1','12C4','ntthuthuy','08:00:00',245,69),(57,'2023-12-23','1','12C3','ntthuthuy','09:55:00',245,69),(58,'2023-12-23','1','12C9','mthuyen','09:05:00',245,30),(59,'2023-12-22','1','10A10','ntthuy','09:05:00',243,68),(60,'2023-12-22','1','10A10','ntthuy','09:05:00',141,68);
/*!40000 ALTER TABLE `home_borrowreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_device`
--

DROP TABLE IF EXISTS `home_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `mon` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `hansudung` varchar(255) NOT NULL,
  `userId_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_device_userId_id_ee903c98_fk_home_user_id` (`userId_id`),
  CONSTRAINT `home_device_userId_id_ee903c98_fk_home_user_id` FOREIGN KEY (`userId_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_device`
--

LOCK TABLES `home_device` WRITE;
/*!40000 ALTER TABLE `home_device` DISABLE KEYS */;
INSERT INTO `home_device` VALUES (13,'VIDEO/CLIP/ PHIM TƯ LIỆU VỀ CA DAO CON NGƯỜI VÀ XÃ HỘI','Ngữ văn','NVH.NV.Vid.2023/02-01/05(nguvan)','Bộ','202500','5','Mới','#','Việt Nam','#',3),(14,'VIDEO/CLIP/ PHIM TƯ LIỆU VỀ THƠ NÔM CỦA HỒ XUÂN HƯƠNG','Ngữ văn','NVH.NV.Vid.2023/03-01/05(nguvan)','Bộ','202,500','5','Mới','#','Việt Nam','#',3),(15,'VIDEO/CLIP/ PHIM TƯ LIỆU VỀ THƠ CỦA NGUYỄN KHUYẾN','Ngữ văn','NVH.NV.Vid.2023/04-01/05(nguvan)','Bộ','202,500','5','Mới','#','Việt Nam','#',3),(16,'SƠ ĐỒ QUY TRÌNH VÀ CẤU TRÚC MỘT BÁO CÁO NGHIÊN CỨU KHOA HỌC','Ngữ văn','NVH.NV.SĐ.2023/05-01/05','Bộ','202,500','5','Mới','2023-02-01','Việt Nam','#',3),(17,'SƠ ĐỒ QUY TRÌNH VÀ CẤU TRÚC MỘT BÁO CÁO NGHIÊN CỨU KHOA HỌC','Ngữ Văn','NVH.NV.SĐ.2023/05-01/05(nguvan)','Bộ','27000','5','Mới','2023-02-03','Việt Nam','#',3),(18,'SƠ ĐỒ QUY TRÌNH TIẾN HÀNH SÂN KHẤU HÓA MỘT TÁC PHẨM VĂN HỌC','Ngữ Văn','NVH.NV.SĐ.2023/06-01/05(nguvan)','Bộ','27000','5','Mới','2023-02-03','Việt Nam','#',3),(19,'GIÁ TREO TRANH','Ngữ văn','NVH.VAN.GIATT.2023/01','Bộ','790000','1','Mới','2023-02-03','Việt Nam','#',3),(20,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán Học','NVH.TH.2023/01-01/04(toanhoc)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(21,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(22,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(23,'GIÁ TREO TRANH','Ngữ Văn','NVH.VAN.GIATT.2023/01','Bộ','790000','1','Mới','2023-02-03','Việt Nam','#',3),(24,'GIÁ TREO TRANH','Ngữ Văn','NVH.VAN.GIATT.2023/01(nguvan)','Bộ','790000','1','Mới','2023-02-03','Việt Nam','#',3),(25,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(26,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán học','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(27,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán học','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(28,'BỘ THIẾT BỊ ĐỂ VẼ TRÊN BẢNG TRONG DẠY HỌC TOÁN','Toán','NVH.TH.2023/01-01/04(toan)','Bộ','117000','4','Mới','2023-02-03','Việt Nam','#',3),(29,'BIẾN ÁP NGUỒN','Vật lí','NVH.VL.BA.2023/01-01/07(vatli)','Cái','1530000','7','Mới','2023-02-03','Việt Nam','#',3),(34,'SGK TOÁN','Toán','toanhoc','quyển','100000','100','Mới','2023-02-03','Việt Nam','#',78),(35,'BỘ THIẾT BỊ DẠY HỌC VỀ CÁC ĐƯỜNG CONIC','Toán Học','NVH.TH.2023/02-01/04(toanhoc)','Bộ','585000','4','Mới','2023-02-03','Việt Nam','#',78),(36,'BỘ THIẾT BỊ DẠY HỌC VỀ THỐNG KÊ VÀ XÁC SUẤT','Toán học','NVH.TH.2023/03-01/08(toanhoc)','Bộ','58500','8','Mới','2023-0203','Việt Nam','#',78),(37,'PHIM TƯ LIỆU: MỘT SỐ HIỆN VẬT TIÊU BIỂU CỦA NỀN VĂN MINH SÔNG HỒNG VÀ VĂN MINH ĐẠI VIỆT','Lịch Sử','NVH.LS.P.2023/01-01/03(lichsu)','Bộ','315000','3','Mới','2023-02-03','Việt Nam','#',78),(38,'PHIM TƯ LIỆU: THÀNH TỰU TIÊU BIỂU CỦA MỘT SỐ NỀN VĂN MINH PHƯƠNG ĐÔNG','Lịch Sử','NVH.LS.P.2023/02-01/03(lichsu)','Bộ','315000','3','Mới','2023-02-03','Việt Nam','#',78),(39,'PHIM TƯ LIỆU: THÀNH TỰU TIÊU BIỂU CỦA MỘT SỐ NỀN VĂN MINH PHƯƠNG TÂY','Lịch Sử','NVH.LS.P.2023/03-01/03(lichsu)','Bộ','343000','3','Mới','2023-02-03','Việt Nam','#',78),(40,'PHIM TƯ LIỆU: THÀNH TỰU CỦA CUỘC CÁCH MẠNG CÔNG NGHIỆP LẦN THỨ NHẤT','Lịch Sử','NVH.LS.P.2023/04-01/03(lichsu)','Bộ','243000','3','Mới','2023-02-03','Việt Nam','#',78),(41,'PHIM TƯ LIỆU: THÀNH TỰU CỦA CUỘC CÁCH MẠNG CÔNG NGHIỆP LẦN THỨ HAI','Lịch Sử','NVH.LS.P.2023/05-01/03(lichsu)','Bộ','243000','3','Mới','2023-02-03','Việt Nam','#',78),(42,'PHIM TƯ LIỆU: THÀNH TỰU CỦA CUỘC CÁCH MẠNG CÔNG NGHIỆP LẦN THỨ BA','Lịch Sử','NVH.LS.P.2023/06-01/03(lichsu)','Bộ','243000','3','Mới','2023-02-03','Việt Nam','#',78),(43,'PHIM TƯ LIỆU: THÀNH TỰU CỦA CUỘC CÁCH MẠNG CÔNG NGHIỆP LẦN THỨ TƯ','Lịch Sử','NVH.LS.P.2023/07-01/03(lichsu)','Bộ','243000','3','Mới','2023-02-03','Việt Nam','#',78),(44,'PHIM TƯ LIỆU: THÀNH TỰU CỦA VĂN MINH ĐÔNG NAM Á','Lịch Sử','NVH.LS.P.2023/08-01/03(lichsu)','Bộ','202500','3','Mới','2023-02-03','Việt Nam','#',78),(45,'PHIM MÔ PHỎNG: THÀNH TỰU CỦA VĂN MINH TRÊN ĐẤT NƯỚC VIỆT NAM (TRƯỚC NĂM 1958)','Lịch Sử','NVH.LS.P.2023/09-01/03(lichsu)','Bộ','360000','3','Mới','2023-02-03','Việt Nam','#',78),(46,'VIDEO/CLIP VỀ TRÁI ĐẤT','Địa Lí','NVH.ĐL10.Vid.2023/01-01/03(diali)','Bộ','202500','3','Mới','2023-02-03','Việt Nam','#',78),(47,'BỘ THIẾT BỊ ĐO KĨ THUẬT SỐ TÍCH HỢP','Vật lí','NVH.VL.TBĐ.2023/02-01/01(vatli)','Bộ','21600000','1','Mới','2023-02-03','Việt Nam','#',78),(48,'BỘ HÓA CHẤT XÁC ĐỊNH THÀNH PHẦN CỦA TẾ BÀO','Sinh Học','NVH.SH.BHC.2023/03-01/01(sinhhoc)','Bộ','349650','1','Mới','2023-02-03','Việt Nam','2023-12-30',78),(49,'BỘ HÓA CHẤT LÀM TIÊU BẢN, QUAN SÁT CẤU TRÚC TẾ BÀO','Sinh Học','NVH.SH.BHC.2023/04-01/01(sinhhoc)','Bộ','871200','1','Mới','2023-02-03','Việt Nam','2025-12-30',78),(50,'BÔT SẮT FE, LOẠI MỊN CÓ MÀU TRẮNG XÁM (FE)','Hoá Học','NVH.HH/2023.04/100(hoahoc)','g','360','100','Hết hạn','2023-02-03','Việt Nam','2023-12-11',78),(51,'BĂNG MAGNESIUM (MG)','Hoá Học','NVH.HH/2023.05/100(hoahoc)','g','1386','100','Mới','2023-02-03','Việt Nam','2023-12-26',78),(52,'CẦU MÔN, LƯỚI BÓNG ĐÁ','Thể Dục','TD10.2023/01-01/01(theduc)','Bộ','13860000','1','Mới','2023-02-03','Việt Nam','#',78),(53,'CỘT LƯỚI, CẦU LÔNG','Thể Dục','TD10.2023/02-01/01(theduc)','Bộ','1710000','1','Mới','2023-02-03','Việt Nam','#',78),(55,'MÔ HÌNH SÚNG CKC CẮT BỔ','Quốc Phòng An Ninh','QPAN.SUNGCKC.2023.05-01/01(quocphonganninh)','Khẩu','4750000','1','Mới','2023-02-03','Việt Nam','#',78),(57,'MÔ HÌNH SÚNG B40 CẮT BỔ','Quốc Phòng An Ninh','QPAN.SUNGB40.2023.06-01/01(quocphonganninh)','Khẩu','3450000','1','Mới','2023-02-03','Việt Nam','#',78),(58,'MÔ HÌNH SÚNG B40 CẮT BỔ','Quốc Phòng An Ninh','QPAN.SUNGB41-47.2023.07-01/01(quocphonganninh)','Khẩu','4150000','1','Mới','2023-02-03','Việt Nam','#',78),(59,'BAO ĐẠN, TÚI ĐỰNG LỰU ĐẠN','Quốc Phòng An Ninh','QPAN.BAOTUIDAN.2023.08-01/20(quocphonganninh)','Chiếc','350000','20','Mới','2023-02-03','Việt Nam','#',78),(60,'BỘ BIA (KHUNG + MẶT BIA SỐ 4)','Quốc Phòng An Ninh','QPAN.BIA.2023.09-01/10(quocphonganninh)','Bộ','580000','10','Mới','2023-02-03','Việt Nam','#',78),(61,'KÍNH KIỂM TRA NGẮM','Quốc Phòng An Ninh','QPAN.KINHNGAM.2023.10-01/04(quocphonganninh)','Chiếc','105000','4','Mới','2023-02-03','Việt Nam','#',78),(62,'ĐỒNG TIỀN DI ĐỘNG','Quốc Phòng An Ninh','QPAN.ĐTDĐ.2023.11-01/02(quocphonganninh)','Chiếc','23000','2','Mới','2023-02-03','Việt Nam','#',78),(63,'DỤNG CỤ BĂNG BÓ CỨU THƯƠNG','Quốc Phòng An Ninh','QPAN.DCCT.2023.12-01/10(quocphonganninh)','Bộ','880000','10','Mới','2023-02-03','Việt Nam','#',78),(64,'TỦ ĐỰNG SÚNG VÀ ĐỰNG THIẾT BỊ','Quốc Phòng An Ninh','QPAN.TUDUNGSUNG.2023.13-01/01(quocphonganninh)','Bộ','8000000','1','Mới','2023-02-03','Việt Nam','#',78),(66,'PHIM TƯ LIỆU: ĐỜI SỐNG VẬT CHẤT VÀ TINH THẦN CỦA CỘNG ĐỒNG CÁC DÂN TỘC VIỆT NAM','Lịch Sử','NVH.LS.P.2023/10-01/03(lichsu)','Bộ','202500','3','Mới','2023-02-03','Việt Nam','#',78),(67,'VIDEO/CLIP: DI SẢN VĂN HÓA Ở VIỆT NAM','Lịch Sử','NVH.LS.Vid.2023/11-01/03(lichsu)','Bộ','360000','3','Mới','2023-02-03','Việt Nam','#',78),(68,'LƯỢC ĐỒ DI SẢN VĂN HÓA Ở VIỆT NAM','Lịch Sử','NVH.LS.LĐ.2023/12-01/03(lichsu)','Bộ','58500','3','Mới','2023-02-03','Việt Nam','#',78),(69,'LƯỢC ĐỒ DI SẢN VĂN HÓA Ở VIỆT NAM','Lịch Sử','NVH.LS.LĐ.2023/12-01/03(lichsu)','Tờ','58500','3','Mới','2023-02-03','Việt Nam','#',78),(71,'VIDEO/CLIP VỀ BIẾN ĐỔI KHIA HẬU TRÊN THẾ GIỚI','Địa Lí','NVH.ĐL10.Vid.2023/02-01/03(diali)','Bộ','202500','3','Mới','2023-02-03','Việt Nam','#',79),(72,'QUẢ ĐỊA CẦU (HÀNH CHÍNH)','Địa Lí','NVH.ĐL10.ĐC.2023/03-01/03(diali)','Bộ','225000','3','Mới','2023-02-03','Việt Nam','#',79),(73,'BẢN ĐỒ NHIỆT ĐỘ KHÔNG KHÍ TRÊN TRÁI ĐẤT','Địa Lí','NVH.ĐL10.BĐ.2023/04-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(74,'BẢN ĐỒ CÁC ĐỚI VÀ KIỂU KHÍ HẬU TRÊN TRÁI ĐẤT','Địa Lí','NVH.ĐL10.BĐ.2023/05-01/03(diali)','Tờ','157500','2','Mới','2023-02-03','Việt Nam','#',79),(75,'BẢN ĐỒ PHÂN BỐ LƯỢNG MƯA TRUNG BÌNH','Địa Lí','NVH.ĐL10.BĐ.2023/06-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(76,'BẢN ĐỒ CÁC DÒNG BIỂN TRONG ĐẠI DƯƠNG TRÊN THẾ GIỚI','Địa Lí','NVH.ĐL10.BĐ.2023/07-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(77,'BẢN ĐỒ PHÂN BỐ CÁC NHÓM ĐẤT VÀ SINH VẬT TRÊN TRÁI ĐẤT','Địa Lí','NVH.ĐL10.BĐ.2023/08-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(78,'BẢN ĐỒ PHÂN BỐ CÂY TRỒNG VÀ VẬT NUÔI TRÊN THẾ GIỚI','Địa Lí','NVH.ĐL10.BĐ.2023/09-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(79,'BẢN ĐỒ PHÂN BỐ MỘT SỐ NGÀNH CÔNG NGHIỆP TRÊN THẾ GIỚI','Địa Lí','NVH.ĐL10.BĐ.2023/10-01/03(diali)','Tờ','157500','3','Mới','2023-02-03','Việt Nam','#',79),(80,'GIÁ TREO TRANH','Địa Lí','NVH.SUDDIA.GIATT.2023/01(diali)','Bộ','790000','1','Mới','2023-02-03','Việt Nam','#',79),(81,'HỘP QUẢ TREO','Vật lí','NVH.VL.QT.2023/03-01/07(vatli)','Hộp','225000','7','Mới','2023-02-03','Việt Nam','#',79),(82,'LÒ XO','Vật lí','NVH.VL.LX.2023/04-01/07(vatli)','Cái','342000','7','Mới','2023-02-03','Việt Nam','#',79),(83,'THIẾT BỊ ĐO VẬN TỐC VÀ GIA TỐC CỦA VẬT RƠI TỰ DO','Vật lí','NVH.VL.QT.2023/05-01/07(vatli)','Bộ','3150000','1','Mới','2023-02-03','Việt Nam','#',79),(84,'THIẾT BỊ TỔNG HỢP HAI LỰC ĐỒNG QUY VÀ SONG SONG','Vật lí','NVH.VL.TBTH.2023/06-01/01(vatli)','Bộ','1719000','1','Mới','2023-02-03','Việt Nam','#',79),(86,'VIDEO BIẾN DẠNG VÀ ĐẶC TÍNH CỦA LÒ XO','Vật lí','NVH.VL.Vid.2023/07-01/01(vatli)','Bộ','202500','1','Mới','2023-02-03','Việt Nam','#',3),(87,'PHẦN MỀM MÔ PHỎNG 3D BẢN ĐỒ SAO','Vật lí','NVH.VL.PM.2023/08-01/01(vatli)','Bộ','990000','1','Mới','2023-02-03','Việt Nam','#',3),(88,'PHẦN MỀM 3D MÔ PHỎNG TRÁI ĐẤT, MẶT TRỜI, MẶT TRĂNG','Vật lí','NVH.VL.PM.2023/09-01/01(vatli)','Bộ','990000','1','Mới','2023-02-03','Việt Nam','#',3),(89,'PHẦN MỀM 3D MÔ PHỎNG NHẬT, NGUYỆT THỰC, THỦY TRIỀU','Vật lí','NVH.VL.PM.2023/10-01/01(vatli)','Bộ','990000','1','Mới','2023-02-03','Việt Nam','#',3),(91,'DÂY NỐI','Vật lí','NVH.VL.DN.2023/10-01/07(vatli)','Bộ','315000','7','Mới','2023-02-03','Việt Nam','#',3),(92,'GIÁ THÍ NGHIỆM','Vật lí','NVH.VL.GI.2023/11-01/07(vatli)','Bộ','315000','7','Mới','2023-02-03','Việt Nam','#',3),(93,'BỘ BÀN GHẾ CỦA GV','Vật lí','VL.BGGV.2023/02(vatli)','Bộ','3,800,000','2','Mới','2023-02-03','Việt Nam','#',3),(94,'BỘ BÀN GHẾ THỰC HÀNH CỦA HỌC SINH','Vật lí','VL.BGHS.2023/14(vatli)','Bộ','5,000,000','14','Mới','2023-02-03','Việt Nam','#',3),(95,'GIÁ THIẾT BỊ','Vật lí','VL.BGHS.2023/14(vatli)','Bộ','4,360,000','6','Mới','2023-02-03','Việt Nam','#',3),(96,'XE ĐẨY VẬN CHUYỂN THIẾT BỊ','Vật lí','VL.XEDAY.2023/06(vatli)','Bộ','1,920,000','6','Mới','2023-02-03','Việt Nam','#',3),(97,'GIÁ TREO TRANH','Vật lí','VL.GIATT.2023/07(vatli)','Bộ','790,000','7','Mới','2023-02-03','Việt Nam','#',3),(98,'BỘ HÓA CHẤT XÁC ĐỊNH ẢNH HƯỞNG CỦA CÁC YẾU TỐ ĐẾN HOẠT TÍNH CỦA ENZYME','Sinh Học','NVH.SH.BHC.2023/05-01/01(sinhhoc)','Bộ','45000','1','Mới','2023-02-03','Việt Nam','30/12/2023',3),(99,'BỘ HÓA CHẤT LÀM TIÊU BẢN NST, QUAN SÁT NGUYÊN NHÂN, GIẢM PHÂN','Sinh Học','NVH.SH.BHC.2023/06-01/01(sinhhoc)','Bộ','930600','1','Mới','2023-02-03','Việt Nam','30/12/2025',3),(100,'BỘ HÓA CHẤT THỰC HÀNH PHƯƠNG PHÁP NGHIÊN CỨU VI SINH VẬT','Sinh Học','NVH.SH.BHC.2023/07-01/01(sinhhoc)','Bộ','188,100','1','Mới','2023-02-03','Việt Nam','30/12/2025',3),(101,'BỘ ĐỒ MỔ','Sinh Học','NVH.SH.BĐM.2023/01-01/07(sinhhoc)','Bộ','378,000','7','Mới','2023-02-03','Việt Nam','#',3),(102,'BỘ THÍ NGHIỆM XÁC ĐỊNH THÀNH PHẦN CỦA TẾ BÀO','Sinh Học','NVH.SH.BTN.2023/02-01/04(sinhhoc)','Bộ','349,650','4','Mới','2023-02-03','Việt Nam','#',3),(103,'ỐNG NGHIỆM','Sinh Học','NVH.SH.ON.2023/08-01/50(sinhhoc)','Bộ','4,500','50','Mới','2023-02-03','Việt Nam','#',3),(104,'GIÁ ĐỂ ỐNG NGHIỆM','Sinh Học','NVH.SH.GI.2023/09-01/10(sinhhoc)','Bộ','43,200','10','Mới','2023-02-03','Việt Nam','#',3),(105,'ĐÈN CỒN','Sinh Học','NVH.SH.ĐC.2023/10-01/07(sinhhoc)','Bộ','45,000','7','Mới','2023-02-03','Việt Nam','#',3),(106,'CỐC THỦY TINH LOẠI 250','Sinh Học','NVH.SH.CTT.2023/11-01/07(sinhhoc)','Bộ','39,600','7','Mới','2023-02-03','Việt Nam','#',3),(107,'CHỔI RỬA ỐNG NGHIỆM','Sinh Học','NVH.SH.CH.2023/12-01/07(sinhhoc)','Bộ','21,600','7','Mới','2023-02-03','Việt Nam','#',3),(108,'KÍNH HIỂN VI','Sinh Học','NVH.SH.KHV.2023/13-01/01(sinhhoc)','Bộ','3,960,000','1','Mới','2023-02-03','Việt Nam','#',3),(109,'DAO CẮT TIÊU BẢN','Sinh Học','NVH.SH.DCTB.2023/14-01/07(sinhhoc)','Bộ','54,000','7','Mới','2023-02-03','Việt Nam','#',3),(110,'LAM KÍNH','Sinh Học','NVH.SH.LK.2023/15-01/07(sinhhoc)','Bộ','36,000','7','Mới','2023-02-03','Việt Nam','#',3),(111,'LAMEN','Sinh Học','NVH.SH.LM.2023/16-01/07(sinhhoc)','Bộ','36000','7','Mới','2023-02-03','Việt Nam','#',3),(112,'KIM MŨI MÁC','Sinh Học','NVH.SH.KMM.2023/17-01/07(sinhhoc)','Cái','27000','7','Mới','2023-02-03','Việt Nam','#',3),(113,'CỐI, CHÀY SỨ','Sinh Học','NVH.SH.COICHAY.2023/18-01/07(sinhhoc)','Cái','54000','7','Mới','2023-02-03','Việt Nam','#',3),(114,'ĐĨA PETRI','Sinh Học','NVH.SH.PETRI.2023/19-01/07(sinhhoc)','Cái','15,120','7','Mới','2023-02-03','Việt Nam','#',3),(115,'PANH KẸP','Sinh Học','NVH.SH.PANH.2023/20-01/07(sinhhoc)','Cái','19,800','7','Mới','2023-02-03','Việt Nam','#',3),(116,'PIPET','Sinh Học','NVH.SH.PIPET.2023/21-01/07(sinhhoc)','Cái','28,350','7','Mới','2023-02-03','Việt Nam','#',3),(117,'ĐŨA THỦY TINH','Sinh Học','NVH.SH.ĐTT.2023/22-01/07(sinhhoc)','Cái','12,600','7','Mới','2023-02-03','Việt Nam','#',3),(118,'GIẤT THẤM','Sinh Học','NVH.SH.GIAYTHAM.2023/23-01/07(sinhhoc)','Cái','81,000','7','Mới','2023-02-03','Việt Nam','#',3),(119,'PIPET NHỰA','Sinh Học','NVH.SH.PIPET.2023/24-01/07(sinhhoc)','Cái','5,670','7','Mới','2023-02-03','Việt Nam','#',3),(120,'ĐĨA ĐỒNG HỒ','Sinh Học','NVH.SH.ĐĐH.2023/25-01/07(sinhhoc)','Cái','18,000','7','Mới','2023-02-03','Việt Nam','#',3),(121,'KẸP ỐNG NGHIỆM','Sinh Học','NVH.SH.KEPON.2023/26-01/07(sinhhoc)','Cái','14,400','7','Mới','2023-02-03','Việt Nam','#',3),(122,'LỌ KÈM ỐNG NHỎ GIỌT','Sinh Học','NVH.SH.LNG.2023/27-01/07(sinhhoc)','Cái','28,800','7','Mới','2023-02-03','Việt Nam','#',3),(123,'LỌ CÓ NÚT NHÁM','Sinh Học','NVH.SH.LNN.2023/28-01/07(sinhhoc)','Cái','27000','7','Mới','2023-02-03','Việt Nam','#',3),(124,'BỘ THU NHẬN SỐ LIỆU','Sinh Học','NVH.SH.BTNSL.2023/29-01/01(sinhhoc)','Bộ','18,000,000','1','Mới','2023-02-03','Việt Nam','#',3),(125,'CẢM BIẾN ĐỘ PH','Sinh Học','NVH.SH.CBPH.2023/30-01/01(sinhhoc)','Chiếc','3,510,000','1','Mới','2023-02-03','Việt Nam','#',3),(126,'BỘ BÀN GHẾ CỦA GIÁO VIÊN','Sinh Học','NVH.SH.BGGV/2023/01/02(sinhhoc)','Bộ','3,800,000','2','Mới','2023-02-03','Việt Nam','#',3),(127,'BỘ BÀN GHẾ THỰC HÀNH CỦA HỌC SINH','Sinh Học','NVH.SH.BGHS/2023/01/14(sinhhoc)','Bộ','5,000,000','14','Mới','2023-02-03','Việt Nam','#',3),(128,'GIÁ ĐỂ THIẾT BỊ','Sinh Học','NVH.SH.GTB/2023/01/08(sinhhoc)','Chiếc','4,360,000','8','Mới','2023-02-03','Việt Nam','#',3),(129,'TỦ ĐỰNG HÓA CHẤT','Sinh Học','NVH.SH.THC/2023/01/04(sinhhoc)','Chiếc','9,500,000','4','Mới','2023-02-03','Việt Nam','#',3),(130,'XE ĐẨY VẬN CHUYỂN THIẾT BỊ','Sinh Học','NVH.SH.XEDAY/2023/01/04(sinhhoc)','Chiếc','1,920,000','4','Mới','2023-02-03','Việt Nam','#',3),(131,'GIÁ TREO TRANH','Sinh Học','NVH.SH.GTT/2023/16(sinhhoc)','Chiếc','790,000','16','Mới','2023-02-03','Việt Nam','#',3),(132,'MÁY CẤT NƯỚC 1 LẦN','Hoá Học','NVH.HH.MCN/2023.01/01(hoahoc)','Cái','#','1','Mới','2023-02-03','Việt Nam','#',3),(133,'TỦ HÚT','Hoá Học','NVH.HH.TUHUT/2023.02/01(hoahoc)','Cái','#','1','Mới','2023-02-03','Việt Nam','#',3),(134,'TỦ ĐỰNG HÓA CHẤT','Hoá Học','NVH.HH.TUHOACHAT/2023.03/01(hoahoc)','Cái','#','1','Mới','2023-02-03','Việt Nam','#',3),(135,'NHÔM LÁ (AL)','Hoá Học','NVH.HH/2023.06/100(hoahoc)','g','810','100','Mới','2023-02-03','Việt Nam','#',3),(136,'NHÔM BỘT,LOẠI MỊN MÀU TRẮNG BẠC(AL)','Hoá Học','NVH.HH/2023.07/100(hoahoc)','g','396','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(137,'ĐỒNG VỤN (CU)','Hoá Học','NVH.HH/2023.08/100(hoahoc)','g','990','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(138,'ĐỒNG LÁ (CU)','Hoá Học','NVH.HH/2023.09/100(hoahoc)','g','990','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(139,'KẼM VIÊN(ZN)','Hoá Học','NVH.HH/2023.10/100(hoahoc)','g','792','100','Mới','2023-02-03','Việt Nam','Tháng 12/2023',3),(140,'SODIUM(NA)','Hoá Học','NVH.HH/2023.11/100(hoahoc)','g','3,960','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(141,'LƯU HUỲNH BỘT (S)','Hoá Học','NVH.HH/2023.12/100(hoahoc)','g','360','100','Mới','2023-02-03','Việt Nam','#',3),(142,'BROMINE LỎNG(BR)','Hoá Học','NVH.HH/2023.13/100(hoahoc)','ml','990','100','Hết hạn','2023-02-03','Việt Nam','2023-12-10',3),(143,'IODINE(I)','Hoá Học','NVH.HH/2023.14/100(hoahoc)','g','4,500','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(144,'SODIUM HYDROXIDE (NAOH)','Hoá Học','NVH.HH/2023.15/100(hoahoc)','g','180','500','Mới','2023-02-03','Việt Nam','26/12/2023',3),(145,'HDROCHOLORIC ACID 37% (HCL)','Hoá Học','NVH.HH/2023.16/100(hoahoc)','ml','180','500','Mới','2023-02-03','Việt Nam','26/12/2023',3),(146,'SULFURIC ACID 98% (H2SO4)','Hoá Học','NVH.HH/2023.17/100(hoahoc)','ml','180','500','Mới','2023-02-03','Việt Nam','26/12/2023',3),(147,'NITRIC ACID 65% (HNO3)','Hoá Học','NVH.HH/2023.18/100(hoahoc)','ml','450','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(148,'POTASSIUM IODIDE (KL)','Hoá Học','NVH.HH/2023.19/100(hoahoc)','g','4,320','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(149,'SODIUM FLORIDE (NAF)','Hoá Học','NVH.HH/2023.20/100(hoahoc)','g','540','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(150,'SODIUM CHLORIDE (NACL)','Hoá Học','NVH.HH/2023.21/100(hoahoc)','g','270','100','Mới','2023-02-03','Việt Nam','#',3),(151,'SODIUM BROMIDE (NABR)','Hoá Học','NVH.HH/2023.22/100','g','693','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(152,'SODIUM BROMIDE (NABR)','Hoá Học','NVH.HH/2023.22/100(hoahoc)','g','693','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(153,'SODIUM IODIDE (NAL)','Hoá Học','NVH.HH/2023.23/100(hoahoc)','g','5,544','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(154,'CALCIUM CHLORIDE(CACL2.6H2O)','Hoá Học','NVH.HH/2023.24/100(hoahoc)','g','297','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(155,'IRON (III) CLORIDE (FECL3)','Hoá Học','NVH.HH/2023.25/100(hoahoc)','g','360','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(156,'IRON SULFATE HEPTAHYDRATE,(FESO4.7H2O)','Hoá Học','NVH.HH/2023.26/100(hoahoc)','g','360','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(157,'POTASSIUM NITRATE (KNO3)','Hoá Học','NVH.HH/2023.27/100(hoahoc)','g','792','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(158,'SILVER NITRATE,(AGNO3)','Hoá Học','NVH.HH/2023.28/100(hoahoc)','g','46.8','30','Mới','2023-02-03','Việt Nam','26/12/2023',3),(159,'COPPER (II) SULFATE, (CUSO4.5H2O)','Hoá Học','NVH.HH/2023.29/100(hoahoc)','g','396','500','Mới','2023-02-03','Việt Nam','26/12/2023',3),(160,'ZINC SULFATE (ZNSO4.7H2O)','Hoá Học','NVH.HH/2023.30/100(hoahoc)','g','360','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(161,'CALCIUM CARBONATE (CACO3)','Hoá Học','NVH.HH/2023.31/100(hoahoc)','g','297','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(162,'SODIUM CARBONATE, (NA2CO3.10H2O)','Hoá Học','NVH.HH/2023.32/100(hoahoc)','g','359','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(163,'SODIUM HYDROGEN CARBONATE (NAHCO3)','Hoá Học','NVH.HH/2023.33/100(hoahoc)','g','395','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(164,'DUNG DỊCH AMMONIA BÃO HÒA (NH3)','Hoá Học','NVH.HH/2023.34/100(hoahoc)','g','297','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(165,'POTASSIUM PERMANGANATE, (KMNO4)','Hoá Học','NVH.HH/2023.35/100(hoahoc)','g','477','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(166,'POTASSIUM CHLORATE (KCLO3)','Hoá Học','NVH.HH/2023.36/100(hoahoc)','g','396','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(167,'SODIUM THIOSULFATE,(NA2S2O3)','Hoá Học','NVH.HH/2023.37/100(hoahoc)','g','297','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(168,'HDROPEOXIDE 30% (H2O2)','Hoá Học','NVH.HH/2023.38/100(hoahoc)','ml','297','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(169,'PHENOLPHTALEIN','Hoá Học','NVH.HH/2023.39/10(hoahoc)','g','9,900','10','Mới','2023-02-03','Việt Nam','8/12/2023',3),(170,'GLUCOSE (C6H12O6)','Hoá Học','NVH.HH/2023.40/500(hoahoc)','g','239','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(171,'ETHANOL 96  (C2H5OH)','Hoá Học','NVH.HH/2023.41/1000(hoahoc)','ml','90','1000','Mới','2023-02-03','Việt Nam','26/12/2023',3),(172,'THAN GỖ','Hoá Học','NVH.HH/2023.42/200(hoahoc)','g','198','200','Mới','2023-02-03','Việt Nam','26/12/2023',3),(173,'CỒN ĐỐT','Hoá Học','NVH.HH/2023.43/2000(hoahoc)','ml','90','2000','Mới','2023-02-03','Việt Nam','26/12/2023',3),(174,'SODIUM ACETARE (CH3COONA)','Hoá Học','NVH.HH/2023.44/100(hoahoc)','g','396','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(175,'AMMONIUM SULFATE ((NH4)2SO4)','Hoá Học','NVH.HH/2023.45/100(hoahoc)','g','270','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(176,'HEXANE (C6H14)','Hoá Học','NVH.HH/2023.46/500(hoahoc)','ml','630','500','Mới','2023-02-03','Việt Nam','26/12/2023',3),(177,'CALCIUM CARBIDE (CAC2)','Hoá Học','NVH.HH/2023.47/300(hoahoc)','g','180','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(178,'BENZENE (C6H6)','Hoá Học','NVH.HH/2023.48/200(hoahoc)','ml','360','200','Mới','2023-02-03','Việt Nam','26/12/2023',3),(179,'TOLUENE (C7H8)','Hoá Học','NVH.HH/2023.49/100(hoahoc)','ml','810','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(180,'GLYCEROL (C3H8O3)','Hoá Học','NVH.HH/2023.50/300(hoahoc)','ml','270','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(181,'PHENOL (C6H5OH)','Hoá Học','NVH.HH/2023.51/100(hoahoc)','g','810','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(182,'ETHANAL (C2H4O)','Hoá Học','NVH.HH/2023.52/300(hoahoc)','ml','2,430','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(183,'ACETIC ACID (CH3COOH)','Hoá Học','NVH.HH/2023.53/300(hoahoc)','ml','180','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(184,'SACCHAROSE (C12H22O11)','Hoá Học','NVH.HH/2023.54/300(hoahoc)','g','90','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(185,'TINH BỘT (STARCH), (C6H10O5)N','Hoá Học','NVH.HH/2023.55/300(hoahoc)','g','900','300','Mới','2023-02-03','Việt Nam','26/12/2023',3),(186,'ETHYLAMINE (C2H5NH2)','Hoá Học','NVH.HH/2023.56/100(hoahoc)','ml','1,188','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(187,'ANILINE(C5H5NH2)','Hoá Học','NVH.HH/2023.57/100(hoahoc)','ml','990','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(188,'BARIUM CHLORID (BACL2)','Hoá Học','NVH.HH/2023.58/100(hoahoc)','g','360','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(189,'ALUMINIUM POTASSIUM SULFATE DODECAHYDRATE (KAL(SO4)2.12H2O)','Hoá Học','NVH.HH/2023.59/100(hoahoc)','g','279','100','Mới','2023-02-03','Việt Nam','26/12/2023',3),(190,'CÂN ĐIỆN TỬ','Hoá Học','NVH.HH.CAN.2023/01-01/02(hoahoc)','Cái','450,000','2','Mới','2023-02-03','Trung Quốc','#',3),(191,'ỐNG ĐONG HÌNH TRỤ 100ML','Hoá Học','NVH.HH.OĐ.2023/02-01/07(hoahoc)','Cái','39600','7','Mới','2023-02-03','Trung Quốc','#',3),(192,'BÌNH TAM GIÁC 100ML','Hoá Học','NVH.HH.BTG.2023/03-01/07(hoahoc)','Cái','32400','7','Mới','2023-02-03','Trung Quốc','#',3),(193,'CỐC THỦY TINH 250ML','Hoá Học','NVH.HH.COC250.2023/04-01/07(hoahoc)','Cái','39600','7','Mới','2023-02-03','Trung Quốc','#',3),(194,'CỐC THỦY TINH 100ML','Hoá Học','NVH.HH.COC100.2023/05-01/07(hoahoc)','Cái','31500','7','Mới','2023-02-03','Trung Quốc','#',3),(195,'CỐC ĐỐT','Hoá Học','NVH.HH.COC500.2023/06-01/07(hoahoc)','Cái','54000','7','Mới','2023-02-03','Trung Quốc','#',3),(196,'ỐNG NGHIỆM','Hoá Học','NVH.HH.ON.2023/07-01/50(hoahoc)','Cái','4500','50','Mới','2023-02-03','Việt Nam','#',3),(197,'ỐNG NGHIỆM CÓ NHÁNH','Hoá Học','NVH.HH.ONCN.2023/08-01/20(hoahoc)','Cái','10,800','20','Mới','2023-02-03','Việt Nam','#',3),(198,'ỐNG HÚT NHỎ GIỌT','Hoá Học','NVH.HH.OHNG.2023/09-01/20(hoahoc)','Cái','9000','20','Mới','2023-02-03','Việt Nam','#',3),(199,'ỐNG DẪN THỦY TINH CÁC LOẠI','Hoá Học','NVH.HH.ODTT.2023/10-01/10(hoahoc)','Bộ','36000','10','Mới','2023-02-03','Việt Nam','#',3),(200,'BÌNH CẦU CÓ NHÁNH','Hoá Học','NVH.HH.BC250CN.2023/11-01/07(hoahoc)','Cái','72000','7','Mới','2023-02-03','Trung Quốc','#',3),(201,'ĐŨA THỦY TINH','Hoá Học','NVH.HH.ĐTT.2023/12-01/07(hoahoc)','Cái','12600','7','Mới','2023-02-03','Việt Nam','#',3),(202,'THÌA XÚC HÓA CHẤT','Hoá Học','NVH.HH.THC.2023/13-01/07(hoahoc)','Cái','14400','7','Mới','2023-02-03','Việt Nam','#',3),(203,'ĐÈN CỒN','Hoá Học','NVH.HH.ĐC.2023/14-01/07(hoahoc)','Cái','45000','7','Mới','2023-02-03','Trung Quốc','#',3),(204,'BỘ DỤNG CỤ THÍ NGHIỆM PHÂN TÍCH THỂ THÍCH','Hoá Học','NVH.HH.HPTTT.2023/15-01/07(hoahoc)','Bộ','1,170,000','7','Mới','2023-02-03','Việt Nam','#',3),(205,'KIỀNG 3 CHÂN','Hoá Học','NVH.HH.KIENG/2023.75/07(hoahoc)','Cái','56700','7','Mới','2023-02-03','Việt Nam','#',3),(206,'LƯỚT TẢN NHIỆT','Hoá Học','NVH.HH.LTN/2023.76/07(hoahoc)','Cái','22500','7','Mới','2023-02-03','Việt Nam','#',3),(207,'NÚT CAO SU KHÔNG CÓ LỖ CÁC LOẠI','Hoá Học','NVH.HH.NUTCS/2023.77/07(hoahoc)','Bộ','55,800','7','Mới','2023-02-03','Việt Nam','#',3),(208,'NÚT CAO SU CÓ LỖ CÁC LOẠI','Hoá Học','NVH.HH.NUTKL/2023.78/07(hoahoc)','Bộ','63000','7','Mới','2023-02-03','Việt Nam','#',3),(209,'ỐNG DẪN','Hoá Học','NVH.HH.OD/2023.79/05(hoahoc)','ml','28350','5','Mới','2023-02-03','Việt Nam','#',3),(210,'MUỖNG ĐỐT HÓA CHẤT','Hoá Học','NVH.HH.MĐ/2023.80/07(hoahoc)','Cái','22680','7','Mới','2023-02-03','Việt Nam','#',3),(211,'KẸP ỐNG NGHIỆM','Hoá Học','NVH.HH.KEPON/2023.81/14(hoahoc)','Cái','14400','14','Mới','2023-02-03','Việt Nam','#',3),(212,'CHỔI RỬA ỐNG NGHIỆM','Hoá Học','NVH.HH.CHOI/2023.82/14(hoahoc)','Cái','216000','14','Mới','2023-02-03','Việt Nam','#',3),(213,'PANH GẮP HÓA CHẤT','Hoá Học','NVH.HH.PANH/2023.83/07(hoahoc)','Cái','19800','7','Mới','2023-02-03','Việt Nam','#',3),(214,'BÌNH XỊT TIA NƯỚC','Hoá Học','NVH.HH.BXTN/2023.84/07(hoahoc)','Cái','32400','7','Mới','2023-02-03','Trung Quốc','#',3),(215,'GIÁ ĐỂ ỐNG NGHIỆM','Hoá Học','NVH.HH.GIAON/2023.85/06(hoahoc)','Cái','43200','6','Mới','2023-02-03','Việt Nam','#',3),(216,'KHAY MANG DỤNG CỤ VÀ HÓA CHẤT','Hoá Học','NVH.HH.KHAYHC.2023/86-01/02(hoahoc)','Cái','234,000','2','Mới','2023-02-03','Việt Nam','#',3),(217,'KHAY ĐỰNG DỤNG CỤ, HÓA CHẤT','Hoá Học','NVH.HH.KHAY.2023/87-01/07(hoahoc)','Cái','14400','7','Mới','2023-02-03','Việt Nam','#',3),(218,'NHIỆT KẾ RƯỢU MÀU','Hoá Học','NVH.HH.NK/2023.88/07(hoahoc)','Cái','27000','7','Mới','2023-02-03','Trung Quốc','#',3),(219,'GIẤY LỌC','Hoá Học','NVH.HH.NK/2023.89/02(hoahoc)','Hộp','81000','2','Mới','2023-02-03','Trung Quốc','#',3),(220,'GIẤY QUỲ TÍM','Hoá Học','NVH.HH.QUYTIM/2023.90/02(hoahoc)','Hộp','45000','2','Mới','2023-02-03','Việt Nam','#',3),(221,'GIẤY PH','Hoá Học','NVH.HH.GIAYPH/2023.91/02(hoahoc)','Tệp','18900','2','Mới','2023-02-03','Việt Nam','#',3),(222,'ÁO KHOÁC PHÒNG THÍ NGHIỆM','Hoá Học','NVH.HH.NK/2023.92/45(hoahoc)','Cái','160,650','45','Mới','2023-02-03','Việt Nam','#',3),(223,'KÍNH BẢO VỆ MẮT KHÔNG MÀU','Hoá Học','NVH.HH.NK/2023.93/10(hoahoc)','Cái','36000','10','Mới','2023-02-03','Việt Nam','#',3),(224,'KHẨU TRANG Y TẾ','Hoá Học','NVH.HH.NK/2023.94/03(hoahoc)','Hộp','63000','3','Mới','2023-02-03','Việt Nam','Aug-24',3),(225,'GĂNG TAY CAO SU','Hoá Học','NVH.HH.NK/2023.95/01(hoahoc)','Hộp','594000','1','Mới','2023-02-03','Việt Nam','Tháng  12/2025',3),(226,'BỘ BÀN GHẾ CỦA GIÁO VIÊN','Hoá Học','NVH.HH.BGGV/2023/01-02(hoahoc)','Bộ','3,800,000','2','Mới','2023-02-03','Việt Nam','sx 2022',3),(227,'BỘ BÀN GHẾ THỰC HÀNH CỦA HỌC SINH','Hoá Học','NVH.HH.BGHS/2023/01-14(hoahoc)','Bộ','5,000,000','14','Mới','2023-02-03','Việt Nam','sx 2024',3),(228,'GIÁ ĐỂ THIẾT BỊ','Hoá Học','NVH.HH.GTB/2023/01-08(hoahoc)','Chiếc','4,360,000','8','Mới','2023-02-03','Việt Nam','#',3),(229,'TỦ ĐỰNG HÓA CHẤT','Hoá Học','NVH.HH.THC/2023/01-04(hoahoc)','Chiếc','9,500,000','4','Mới','2023-02-03','Việt Nam','#',3),(230,'XE ĐẨY VẬN CHUYỂN THIẾT BỊ','Hoá Học','NVH.HH.XEDAY/2023/01-04(hoahoc)','Chiếc','1,920,000','4','Mới','2023-02-03','Việt Nam','#',3),(231,'GIÁ TREO TRANH','Hoá Học','NVH.HH.GTT/2023/01-08(hoahoc)','Chiếc','790000','8','Mới','2023-02-03','Việt Nam','#',3),(232,'THƯỚC DÂY','Thể Dục','TD10.2023/03-01/03(theduc)','Chiếc','90000','3','Mới','2023-02-03','Việt Nam','#',3),(233,'CỜ LỆNH THỂ THAO','Thể Dục','TD10.2023/04-01/12(theduc)','Chiếc','36000','12','Mới','2023-02-03','Việt Nam','#',3),(234,'BIỂN LẬT SỐ','Thể Dục','TD10.2023/05-01/02(theduc)','Chiếc','495,000','2','Mới','2023-02-03','Việt Nam','#',3),(235,'NẤM THỂ THAO','Thể Dục','TD10.2023/06-01/60(theduc)','Chiếc','17,100','60','Mới','2023-02-03','Việt Nam','#',3),(236,'BƠM','Thể Dục','TD10.2023/07-01/01(theduc)','Chiếc','405,000','1','Mới','2023-02-03','Việt Nam','#',3),(237,'QUẢ BÓNG ĐÁ','Thể Dục','TD10.2023/08-01/20(theduc)','Chiếc','207,000','20','Mới','2023-02-03','Việt Nam','#',3),(238,'QUẢ BÓNG CHUYỀN','Thể Dục','TD10.2023/09-01/20(theduc)','Chiếc','117,000','20','Mới','2023-02-03','Việt Nam','#',3),(239,'MÔ HÌNH SÚNG AK-47 CẮT BỔ','Quốc Phòng An Ninh','QPAN.SUNGAK-47.2023.04-01/01(quocphonganninh)','Khẩu','4,750,000','1','Mới','2023-02-03','Việt Nam','#',3),(240,'BỘ TRANH DÙNG CHO LỚP 10 (MỖI BỘ GỒM 10 TỜ): ĐỘI NGŨ TỪNG NGƯỜI KHÔNG CÓ SÚNG, ĐỘI NGŨ TIỂU ĐỘI, MỘT SỐ LOẠI BOM, MÌN, ĐẠN; CẤP CỨU BAN ĐẦU VÀ CHUYỂN THƯƠNG; MẮC TĂNG VÕNG; BẾP HOÀNG CẦM; ĐIỀU LỆNH CÔNG AN NHÂN DÂN.','Quốc Phòng An Ninh','QPAN10.TRANH.2023.01-01/02(quocphonganninh)','Bộ','312000','2','Mới','2023-02-03','Việt Nam','#',3),(241,'BỘ TRANH DÙNG CHO LỚP 11 (MỖI BỘ GỒM 12 TỜ): SÚNG TRƯỜNG CKC; SÚNG TIỂU LIÊN AK; SÚNG TRỐNG TĂNG B40; B41; CẤU TẠO, SỬ DỤNG MỘT SỐ LOẠI LỰU ĐẠN; THUỐC NỔ, ĐỒ DÙNG GÂY NỔ VÀ KỸ THUẬT SỬ DỤNG; BỘ TRANH MÌN BỘ BINH; CÁC TƯ THẾ, ĐỘNG TÁC CƠ BẢN VẬN ĐỘNG TRONG CHIẾN ĐẤU; VẬT CẢN; VŨ KHÍ TỰ TẠO; BẢN ĐỒ BIÊN GIỚI QUỐC GIA; CÁC LOẠI VŨ KHÍ, VẬT LIỆU NỔ VÀ CÔNG CỤ HỖ TRỢ TRANG BỊ TRONG CÔNG AN NHÂN DÂN.','Quốc Phòng An Ninh','QPAN11.TRANH.2023.02-01/02(quocphonganninh)','Bộ','880,000','2','Mới','2023-02-03','Việt Nam','#',3),(242,'BỘ TRANH DÙNG CHO LỚP 12 (MỖI BỘ GỒM 10 TỜ): SƠ ĐỒ TỔ CHỨC QUÂN ĐỘI VÀ CÔNG AN; TỔ CHỨC HỆ THỐNG NHÀ TRƯỜNG QUÂN ĐỘI, CÔNG AN; KỸ THUẬT BẮN SÚNG TIỂU AK; TÌM VÀ GIỮ PHƯƠNG HƯỚNG, ĐỘI HÌNH CHIẾN ĐẤU CƠ BẢN CỦA TỔ BỘ BINH; GIỚI THIỆU QUÂN HIỆU, PHÙ HIỆU CỦA QUÂN ĐỘI VÀ CÔNG AN.','Quốc Phòng An Ninh','QPAN12.TRANH.2023.03-01/02(quocphonganninh)','Bộ','350000','2','Mới','2023-02-03','Việt Nam','#',3),(243,'HÓA HỌC 1','Hóa Học','LABhoahoc1T1','phòng','#','1','#','#','#','#',1),(244,'VẬT LÍ - CN 1','Vật Lí','LABvatli1T2','phòng','#','1','#','#','#','#',1),(245,'TIN HỌC 2','Tin Học','LABtinhoc2T3','phòng','#','1','#','#','#','#',1),(246,'SINH HỌC 1','Sinh Học','LABsinhhoc1T3','phòng','#','1','#','#','#','#',1),(247,'TIN HỌC 1','Tin Học','LABtinhoc1T4','phòng','#','1','#','#','#','#',1),(248,'TIN HỌC 3','Tin Học','LABtinhoc3T4','phòng','#','1','#','#','#','#',1),(249,'VẬT LÍ - CN 2','Vật Lí','LABvatli2T4','phòng','#','1','#','#','#','#',1),(250,'SINH HỌC 2','Sinh Học','LABsinhhoc2T4','phòng','#','1','#','#','#','#',1),(251,'TRỰC TUYẾN','Trực Tuyến','LABtructuyenT4','phòng','#','1','#','#','#','#',1),(252,'HÓA HỌC 2','Hóa Học','LABhoahoc2KT','phòng','#','1','#','#','#','#',1);
/*!40000 ALTER TABLE `home_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_user`
--

DROP TABLE IF EXISTS `home_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_user`
--

LOCK TABLES `home_user` WRITE;
/*!40000 ALTER TABLE `home_user` DISABLE KEYS */;
INSERT INTO `home_user` VALUES (1,'admin','admin','Quan tri','ADMIN'),(2,'nguoidung','nguoidung','anh a','USER'),(3,'admin1','1','HH','ADMIN'),(4,'user1','1','HHH','USER'),(5,'nthuthuy','nvh@123','Nguyễn Thu Thuỷ','USER'),(6,'btbac','nvh@123','Bàn Thị Bắc','USER'),(7,'hhdiu','nvh@123','Hoàng Hương Dịu','USER'),(8,'nadung','nvh@123','Nguyễn Anh Dũng','USER'),(9,'dnquyen','nvh@123','Đặng Ngọc Quyên','USER'),(10,'nthdieu','nvh@123','Nguyễn Thị Huyền Diệu','USER'),(11,'tddoan','nvh@123','Trần Đức Đoàn','USER'),(12,'ptdong','nvh@123','Phạm Thị Đông','USER'),(13,'pttgiang','nvh@123','Phạm Thị Thu Giang','USER'),(14,'dthgiang','nvh@123','Đoàn Thi Hương Giang','USER'),(15,'ptnha','nvh@123','Phạm Thị Ngọc Hà','USER'),(16,'dtha','nvh@123','Đinh Thị Hà','USER'),(17,'tttha','nvh@123','Trần Thị Thanh Hà','USER'),(18,'nhhanh','nvh@123','Nguyễn Hồng Hạnh','USER'),(19,'ntphao','nvh@123','Nguyễn Thị Phương Hảo','USER'),(20,'ttthao','nvh@123','Trần Thị Thanh Hảo','USER'),(21,'ttthang','nvh@123','Trần Thị Thu Hằng','USER'),(22,'nhhau','nvh@123','Nguyễn Thị Hoa Hậu','USER'),(23,'nthien','nvh@123','Nguyễn Thị Hiền','USER'),(24,'ttlen','nvh@123','Trần Thị Len','USER'),(25,'dtkhoa','nvh@123','Đặng Thị Kim Hoa','USER'),(26,'nthoa','nvh@123','Nguyễn Thị Hoà','USER'),(27,'ltxhoa','nvh@123','Lê Thị Xuân Hoà','USER'),(28,'htkhoai','nvh@123','Hứa Thị Kim Hoài','USER'),(29,'nthue','nvh@123','Nguyễn Thị Huệ','USER'),(30,'mthuyen','nvh@123','Ma Thanh Huyền','USER'),(31,'nthung','nvh@123','Nguyễn Thế Hưng','USER'),(32,'ntmhuong','nvh@123','Nguyễn Thị Mai Hương','USER'),(33,'htthuong','nvh@123','Hoàng Thị Thu Hương','USER'),(34,'hthhuong','nvh@123','Hoàng Thị Hoài Hương','USER'),(35,'pthuong','nvh@123','Phạm Thị Hường','USER'),(36,'vthuong','nvh@123','Vũ Thị Hường','USER'),(37,'ndkha','nvh@123','Ngô Duy Kha','USER'),(38,'htmkhanh','nvh@123','Hoàng Thị Mai Khanh','USER'),(39,'ntlan','nvh@123','Nguyễn Thị Lan','USER'),(40,'tthlan','nvh@123','Trịnh Thị Hải Lân','USER'),(41,'lnlinh','nvh@123','Lê Ngọc Linh','USER'),(42,'vtloan','nvh@123','Vũ Thị Loan','USER'),(43,'ntloan','nvh@123','Nguyễn Thị Loan','USER'),(44,'ntqluu','nvh@123','Nguyễn Thị Quỳnh Lưu','USER'),(45,'bttmai','nvh@123','Bùi Thị Thanh Mai','USER'),(46,'vtmanh','nvh@123','Vũ Tiến Mạnh','USER'),(47,'vttminh','nvh@123','Vũ Thị Thanh Minh','USER'),(48,'tttmy','nvh@123','Trần Thị Trà My','USER'),(49,'mtrna','nvh@123','Ma Thị Ri Na','USER'),(50,'pbngoc','nvh@123','Phạm Bích Ngọc','USER'),(51,'dbngoc','nvh@123','Đàm Bích Ngọc','USER'),(52,'ttnhan','nvh@123','Trịnh Thanh Nhàn','USER'),(53,'dtnhiem','nvh@123','Đinh Thị Nhiệm','USER'),(54,'vhnhung','nvh@123','Vũ Hồng Nhung','USER'),(55,'btoanh','nvh@123','Bùi Thị Oanh','USER'),(56,'ntkoanh','nvh@123','Nguyễn Thị Kim Oanh','USER'),(57,'htphuong','nvh@123','Hoàng Thu Phương','USER'),(58,'ttphuong','nvh@123','Trịnh Thị Phương','USER'),(59,'vtmphuong','nvh@123','Vương Thị Mai Phương','USER'),(60,'nvquang','nvh@123','Nguyễn Văn Quang','USER'),(61,'htsen','nvh@123','Hà Thị Sen','USER'),(62,'ntpthao','nvh@123','Nguyễn Thị Phương Thảo','USER'),(63,'tvthin','nvh@123','Trần Văn Thìn','USER'),(64,'ntpthoa','nvh@123','Nguyễn Thị Phương Thoa','USER'),(65,'bththom','nvh@123','Bùi Thị Hương Thơm','USER'),(66,'ntxthu','nvh@123','Nông Thị Xuân Thu','USER'),(67,'bttthuy','nvh@123','Bùi Thị Thu Thuỷ','USER'),(68,'ntthuy','nvh@123','Nguyễn Thanh Thuỷ','USER'),(69,'ntthuthuy','nvh@123','Nguyễn Thu Thuỷ','USER'),(70,'ttbthuy','nvh@123','Trần Thị Bích Thuỷ','USER'),(71,'nttthuy','nvh@123','Nguyễn Thị Thu Thuỷ','USER'),(72,'nttrang','nvh@123','Nguyễn Thu Trang','USER'),(73,'nhtrung','nvh@123','Nguyễn Hà Trung','USER'),(74,'tttvan','nvh@123','Trần Thị Thanh Vân','USER'),(75,'bthvan','nvh@123','Bùi Thị Hồng Vân','USER'),(76,'vtvinh','nvh@123','Vũ Thị Vĩnh','USER'),(77,'dtlyen','nvh@123','Đào Thị Lệ Yên','USER'),(78,'haiadmin','1','HH','ADMIN'),(79,'ntdhuyen','nvh@123','Nguyễn Thị Diệu Huyền','ADMIN'),(80,'haiuser','1','HH','USER');
/*!40000 ALTER TABLE `home_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22 12:33:35
