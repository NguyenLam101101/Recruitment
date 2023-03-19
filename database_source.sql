CREATE DATABASE  IF NOT EXISTS `recruitment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recruitment`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: recruitment
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'nvl10112001@gmail.com','$2a$10$2UMyc3MMV5gfCnDjLIJcjeBYCluaiPcJTQLgCV.nxlj7.FS8yOx72','ROLE_EMPLOYER'),(2,'nguyenlam10112001@gmail.com','$2a$10$.JnfU2h8xeR.nN3HFA4clOWO.QWA95TQYgy5B9ZVf.DiKn9omwt6e','ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attached_file`
--

DROP TABLE IF EXISTS `attached_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attached_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail_id` bigint NOT NULL,
  `file` text NOT NULL,
  `original_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attached_file`
--

LOCK TABLES `attached_file` WRITE;
/*!40000 ALTER TABLE `attached_file` DISABLE KEYS */;
INSERT INTO `attached_file` VALUES (1,8,'C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/cv/2023-03-12T21.27.16.614682300.pdf','CV ứng tuyển data.pdf'),(2,9,'C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/attached_files/2023-03-14T19.04.33.355533900.png','application_form.png'),(3,9,'C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/cv/2023-03-01T20.35.57.134458300.pdf','CV ứng tuyển ABC.pdf');
/*!40000 ALTER TABLE `attached_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `district_id` int NOT NULL,
  `tax_code` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `website` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'lam','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-24T12.44.02.158185400.png','Công nghệ thông tin',190,'f','< 1000 người','f','nguyenvanlam10112001@gmail.com','f'),(2,'lam','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-24T12.44.41.824790700.png','Công nghệ thông tin',190,'f','< 1000 người','f','nguyenvanlam10112001@gmail.com','f'),(3,'lam','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-24T12.58.12.283636.png','Công nghệ thông tin',158,'fgc','< 1000 người','hhhh','bhh','hhh'),(4,'Công ty cổ phần và đầu tư TechCV','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T18.03.04.049038300.png','Công nghệ thông tin',1,'12345678','< 1000 người','Công ty abc abc','nvl10112001@gmail.com','');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `area_code` varchar(45) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan','+93',NULL),(2,'Albania','+355',NULL),(3,'Algeria','+213',NULL),(4,'American Samoa','+684',NULL),(5,'Andorra','+376',NULL),(6,'Angola','+244',NULL),(7,'Anguilla','+1264',NULL),(8,'Antigua & Barbuda','+1268',NULL),(9,'Argentina','+54',NULL),(10,'Armenia','+374',NULL),(11,'Aruba','+297',NULL),(12,'Australia (Úc)','+61',NULL),(13,'Austria (Áo)','+43',NULL),(14,'Azerbaijan','+994',NULL),(15,'Bahamas','+1242',NULL),(16,'Bahrain','+973',NULL),(17,'Bangladesh','+880',NULL),(18,'Barbados','+1246',NULL),(19,'Belarus','+375',NULL),(20,'Bỉ','+32',NULL),(21,'Belize','+501',NULL),(22,'Benin','+229',NULL),(23,'Bermuda','+1441',NULL),(24,'Bhutan','+975',NULL),(25,'Bolivia','+591',NULL),(26,'Bosnia & Herzegovina','+387',NULL),(27,'Botswana','+267',NULL),(28,'Brazil','+55',NULL),(29,'Brunei Darussalam','+673',NULL),(30,'Bulgaria','+359',NULL),(31,'Burkina Faso','+226',NULL),(32,'Burundi','+257',NULL),(33,'Cambodia (Campuchia)','+855',NULL),(34,'Cameroon','+237',NULL),(35,'Canada','+1',NULL),(36,'Cape Verde','+238',NULL),(37,'Cayman Islands','+1345',NULL),(38,'Central African Republic','+236',NULL),(39,'Chad','+235',NULL),(40,'Chagos Archipelago','+246',NULL),(41,'Chile','+56',NULL),(42,'China (Trung Quốc)','+86',NULL),(43,'Colombia','+57',NULL),(44,'Comoros','+269',NULL),(45,'Congo','+242',NULL),(46,'Congo, Dem. Rep. of','+243',NULL),(47,'Cook Islands','+682',NULL),(48,'Costa Rica','+506',NULL),(49,'Côte d’lvoire','+225',NULL),(50,'Croatia','+385',NULL),(51,'Cuba','+53',NULL),(52,'Czech Republic (Séc)','+420',NULL),(53,'Denmark (Đan Mạch)','+45',NULL),(54,'Djibouti','+253',NULL),(55,'Dominica','+1767',NULL),(56,'Cyprus','+357',NULL),(57,'Ecuador','+593',NULL),(58,'Egypt (DST','+20',NULL),(59,'El Salvador','+503',NULL),(60,'Equatorial Guinea','+240',NULL),(61,'Estonia','+372',NULL),(62,'Ethiopia','+251',NULL),(63,'Faeroe Islands','+298',NULL),(64,'Falkland Islands','+500',NULL),(65,'Fiji','+679',NULL),(66,'Finland (Phần Lan)','+358',NULL),(67,'France (Pháp)','+33',NULL),(68,'French Antilles','+596',NULL),(69,'French Guiana','+594',NULL),(70,'French Polynesia††','+689',NULL),(71,'Gabon','+241',NULL),(72,'Gambia','+220',NULL),(73,'Georgia','+995',NULL),(74,'Germany (Đức)','+49',NULL),(75,'Ghana','+233',NULL),(76,'Gibraltar','+350',NULL),(77,'Greece (Hy Lạp)','+30',NULL),(78,'Greenland','+299',NULL),(79,'Grenada','+1473',NULL),(80,'Guadeloupe','+590',NULL),(81,'Guam','+1671',NULL),(82,'Guatemala','+502',NULL),(83,'Guinea','+224',NULL),(84,'Guinea-Bissau','+245',NULL),(85,'Guyana','+592',NULL),(86,'Haiti','+509',NULL),(87,'Honduras','+504',NULL),(88,'Hong Kong','+852',NULL),(89,'Hungary','+36',NULL),(90,'Iceland','+354',NULL),(91,'India (Ấn Độ)','+91',NULL),(92,'Indonesia','+62',NULL),(93,'Iran','+98',NULL),(94,'Iraq','+964',NULL),(95,'Ireland','+353',NULL),(96,'Israel','+972',NULL),(97,'Italy','+39',NULL),(98,'Ivory Coast','+225',NULL),(99,'Jamaica','+1876',NULL),(100,'Japan (Nhật Bản)','+81',NULL),(101,'Jordan','+962',NULL),(102,'Kazakhstan','+76',NULL),(103,'Kenya','+254',NULL),(104,'Korea, North (Hàn Quốc)','+850',NULL),(105,'Korea, South (Triều Tiên)','+82',NULL),(106,'Kuwait','+965',NULL),(107,'Kyrgyzstan','+996',NULL),(108,'Laos (Lào)','+856',NULL),(109,'Latvia','+371',NULL),(110,'Lebanon','+961',NULL),(111,'Lesotho','+266',NULL),(112,'Liberia','+231',NULL),(113,'Libya','+218',NULL),(114,'Liechtenstein','+423',NULL),(115,'Lithuania','+370',NULL),(116,'Luxembourg','+352',NULL),(117,'Macau','+853',NULL),(118,'Macedonia','+389',NULL),(119,'Madagascar','+261',NULL),(120,'Malawi','+265',NULL),(121,'Malaysia','+60',NULL),(122,'Maldives','+960',NULL),(123,'Mali','+223',NULL),(124,'Malta','+356',NULL),(125,'Marshall Islands','+692',NULL),(126,'Martinique','+596',NULL),(127,'Mauritania','+222',NULL),(128,'Mauritius','+230',NULL),(129,'Mexico','+52',NULL),(130,'Midway Islands','+808',NULL),(131,'Moldova','+373',NULL),(132,'Monaco','+377',NULL),(133,'Mongolia','+976',NULL),(134,'Montenegro & Serbia','+381',NULL),(135,'Montserrat','+1664',NULL),(136,'Morocco','+212',NULL),(137,'Mozambique','+258',NULL),(138,'Myanmar (Burma)','+95',NULL),(139,'Namibia','+264',NULL),(140,'Nepal','+977',NULL),(141,'Netherlands','+31',NULL),(142,'Netherlands Antilles','+599',NULL),(143,'New Caledonia','+687',NULL),(144,'New Zealand','+64',NULL),(145,'Nicaragua','+505',NULL),(146,'Niger Republic','+227',NULL),(147,'Nigeria','+234',NULL),(148,'Northern Mariana Isl.','+1670',NULL),(149,'Norway','+47',NULL),(150,'Oman','+968',NULL),(151,'Pakistan','+92',NULL),(152,'Palau','+680',NULL),(153,'Panama','+507',NULL),(154,'Papua New Guinea','+675',NULL),(155,'Paraguay','+595',NULL),(156,'Peru','+51',NULL),(157,'Philippines','+63',NULL),(158,'Poland (Ba Lan)','+48',NULL),(159,'Portugal (Bồ Đào Nha)','+351',NULL),(160,'Puerto Rico','+1787',NULL),(161,'Qatar','+974',NULL),(162,'Reunion Island','+262',NULL),(163,'Romania','+40',NULL),(164,'Russia (Nga)','+7',NULL),(165,'Rwanda','+250',NULL),(166,'San Marino','+378',NULL),(167,'Sใo Tom้ & Principe','+239',NULL),(168,'Saudi Arabia','+966',NULL),(169,'Senegal','+221',NULL),(170,'Seychelles','+248',NULL),(171,'Sierra Leone','+232',NULL),(172,'Singapore','+65',NULL),(173,'Slovak Republic','+421',NULL),(174,'Slovenia','+386',NULL),(175,'Solomon Islands','+677',NULL),(176,'Somalia','+252',NULL),(177,'South Africa (Nam Phi)','+27',NULL),(178,'Spain (Tây Ban Nha)','+34',NULL),(179,'Sri Lanka','+94',NULL),(180,'St. Kitts & Nevis','+1869',NULL),(181,'St. Lucia','+1758',NULL),(182,'St. Vincents & Grenadines','+1784',NULL),(183,'Sudan','+249',NULL),(184,'Suriname','+597',NULL),(185,'Swaziland','+268',NULL),(186,'Sweden (Thụy Điển)','+46',NULL),(187,'Switzerland (Thụy Sĩ)','+41',NULL),(188,'Syria','+963',NULL),(189,'Taiwan (Đài Loan)','+886',NULL),(190,'Tajikistan','+992',NULL),(191,'Tanzania','+255',NULL),(192,'Thái Lan','+66',NULL),(193,'Togo','+228',NULL),(194,'Tonga','+676',NULL),(195,'Trinidad & Tobago','+1868',NULL),(196,'Tunisia','+216',NULL),(197,'Turkey (Thổ Nhĩ Kì)','+90',NULL),(198,'Turkmenistan','+993',NULL),(199,'Turks & Caicos Islands','+1649',NULL),(200,'Tuvalu','+688',NULL),(201,'Uganda','+256',NULL),(202,'Ukraine','+380',NULL),(203,'United Arab Emirates (Ả Rập)','+971',NULL),(204,'United Kingdom (Vương Quốc Anh)','+44',NULL),(205,'United States (Mỹ)','+1',NULL),(206,'Uruguay','+598',NULL),(207,'Uzbekistan','+998',NULL),(208,'Vanuatu','+678',NULL),(209,'Venezuela','+58',NULL),(210,'Vietnam','+84',NULL),(211,'Virgin Islands, British','+1284',NULL),(212,'Virgin Islands, U.S.','+1340',NULL),(213,'Western Samoa','+685',NULL),(214,'Yemen','+967',NULL),(215,'Yugoslavia','+381',NULL),(216,'Zaire','+243',NULL),(217,'Zambia','+260',NULL),(218,'Zimbabwe','+263',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `name` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `html_file` varchar(1000) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `privacy` varchar(45) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (1,1,'CV ứng tuyển ABC','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/cv/2023-03-01T20.35.57.134458300.pdf',NULL,1,'public','2023-03-01 13:35:57'),(2,1,'CV ứng tuyển data','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/cv/2023-03-12T21.27.16.614682300.pdf',NULL,0,'public','2023-03-12 14:27:17');
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_district`
--

DROP TABLE IF EXISTS `cv_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_district` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cv_id` bigint NOT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_district`
--

LOCK TABLES `cv_district` WRITE;
/*!40000 ALTER TABLE `cv_district` DISABLE KEYS */;
INSERT INTO `cv_district` VALUES (1,1,1),(2,2,1),(3,2,4);
/*!40000 ALTER TABLE `cv_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_domain`
--

DROP TABLE IF EXISTS `cv_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_domain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cv_id` bigint NOT NULL,
  `domain_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_domain`
--

LOCK TABLES `cv_domain` WRITE;
/*!40000 ALTER TABLE `cv_domain` DISABLE KEYS */;
INSERT INTO `cv_domain` VALUES (1,1,1),(2,1,2),(3,2,8),(4,2,11);
/*!40000 ALTER TABLE `cv_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_skill`
--

DROP TABLE IF EXISTS `cv_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cv_id` bigint NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_skill`
--

LOCK TABLES `cv_skill` WRITE;
/*!40000 ALTER TABLE `cv_skill` DISABLE KEYS */;
INSERT INTO `cv_skill` VALUES (1,1,1),(2,1,3),(3,2,1),(4,2,3),(5,2,4);
/*!40000 ALTER TABLE `cv_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_template`
--

DROP TABLE IF EXISTS `cv_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_template`
--

LOCK TABLES `cv_template` WRITE;
/*!40000 ALTER TABLE `cv_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Quận Ba Đình',1),(2,'Quận Hoàn Kiếm',1),(3,'Quận Tây Hồ',1),(4,'Quận Long Biên',1),(5,'Quận Cầu Giấy',1),(6,'Quận Đống Đa',1),(7,'Quận Hai Bà Trưng',1),(8,'Quận Hoàng Mai',1),(9,'Quận Thanh Xuân',1),(10,'Huyện Sóc Sơn',1),(11,'Huyện Đông Anh',1),(12,'Huyện Gia Lâm',1),(13,'Quận Nam Từ Liêm',1),(14,'Huyện Thanh Trì',1),(15,'Quận Bắc Từ Liêm',1),(16,'Huyện Mê Linh',1),(17,'Quận Hà Đông',1),(18,'Thị xã Sơn Tây',1),(19,'Huyện Ba Vì',1),(20,'Huyện Phúc Thọ',1),(21,'Huyện Đan Phượng',1),(22,'Huyện Hoài Đức',1),(23,'Huyện Quốc Oai',1),(24,'Huyện Thạch Thất',1),(25,'Huyện Chương Mỹ',1),(26,'Huyện Thanh Oai',1),(27,'Huyện Thường Tín',1),(28,'Huyện Phú Xuyên',1),(29,'Huyện Ứng Hòa',1),(30,'Huyện Mỹ Đức',1),(31,'Thành phố Hà Giang',2),(32,'Huyện Đồng Văn',2),(33,'Huyện Mèo Vạc',2),(34,'Huyện Yên Minh',2),(35,'Huyện Quản Bạ',2),(36,'Huyện Vị Xuyên',2),(37,'Huyện Bắc Mê',2),(38,'Huyện Hoàng Su Phì',2),(39,'Huyện Xín Mần',2),(40,'Huyện Bắc Quang',2),(41,'Huyện Quang Bình',2),(42,'Thành phố Cao Bằng',3),(43,'Huyện Bảo Lâm',3),(44,'Huyện Bảo Lạc',3),(45,'Huyện Hà Quảng',3),(46,'Huyện Trùng Khánh',3),(47,'Huyện Hạ Lang',3),(48,'Huyện Quảng Hòa',3),(49,'Huyện Hoà An',3),(50,'Huyện Nguyên Bình',3),(51,'Huyện Thạch An',3),(52,'Thành Phố Bắc Kạn',4),(53,'Huyện Pác Nặm',4),(54,'Huyện Ba Bể',4),(55,'Huyện Ngân Sơn',4),(56,'Huyện Bạch Thông',4),(57,'Huyện Chợ Đồn',4),(58,'Huyện Chợ Mới',4),(59,'Huyện Na Rì',4),(60,'Thành phố Tuyên Quang',5),(61,'Huyện Lâm Bình',5),(62,'Huyện Na Hang',5),(63,'Huyện Chiêm Hóa',5),(64,'Huyện Hàm Yên',5),(65,'Huyện Yên Sơn',5),(66,'Huyện Sơn Dương',5),(67,'Thành phố Lào Cai',6),(68,'Huyện Bát Xát',6),(69,'Huyện Mường Khương',6),(70,'Huyện Si Ma Cai',6),(71,'Huyện Bắc Hà',6),(72,'Huyện Bảo Thắng',6),(73,'Huyện Bảo Yên',6),(74,'Thị xã Sa Pa',6),(75,'Huyện Văn Bàn',6),(76,'Thành phố Điện Biên Phủ',7),(77,'Thị Xã Mường Lay',7),(78,'Huyện Mường Nhé',7),(79,'Huyện Mường Chà',7),(80,'Huyện Tủa Chùa',7),(81,'Huyện Tuần Giáo',7),(82,'Huyện Điện Biên',7),(83,'Huyện Điện Biên Đông',7),(84,'Huyện Mường Ảng',7),(85,'Huyện Nậm Pồ',7),(86,'Thành phố Lai Châu',8),(87,'Huyện Tam Đường',8),(88,'Huyện Mường Tè',8),(89,'Huyện Sìn Hồ',8),(90,'Huyện Phong Thổ',8),(91,'Huyện Than Uyên',8),(92,'Huyện Tân Uyên',8),(93,'Huyện Nậm Nhùn',8),(94,'Thành phố Sơn La',9),(95,'Huyện Quỳnh Nhai',9),(96,'Huyện Thuận Châu',9),(97,'Huyện Mường La',9),(98,'Huyện Bắc Yên',9),(99,'Huyện Phù Yên',9),(100,'Huyện Mộc Châu',9),(101,'Huyện Yên Châu',9),(102,'Huyện Mai Sơn',9),(103,'Huyện Sông Mã',9),(104,'Huyện Sốp Cộp',9),(105,'Huyện Vân Hồ',9),(106,'Thành phố Yên Bái',10),(107,'Thị xã Nghĩa Lộ',10),(108,'Huyện Lục Yên',10),(109,'Huyện Văn Yên',10),(110,'Huyện Mù Căng Chải',10),(111,'Huyện Trấn Yên',10),(112,'Huyện Trạm Tấu',10),(113,'Huyện Văn Chấn',10),(114,'Huyện Yên Bình',10),(115,'Thành phố Hòa Bình',11),(116,'Huyện Đà Bắc',11),(117,'Huyện Lương Sơn',11),(118,'Huyện Kim Bôi',11),(119,'Huyện Cao Phong',11),(120,'Huyện Tân Lạc',11),(121,'Huyện Mai Châu',11),(122,'Huyện Lạc Sơn',11),(123,'Huyện Yên Thủy',11),(124,'Huyện Lạc Thủy',11),(125,'Thành phố Thái Nguyên',12),(126,'Thành phố Sông Công',12),(127,'Huyện Định Hóa',12),(128,'Huyện Phú Lương',12),(129,'Huyện Đồng Hỷ',12),(130,'Huyện Võ Nhai',12),(131,'Huyện Đại Từ',12),(132,'Thị xã Phổ Yên',12),(133,'Huyện Phú Bình',12),(134,'Thành phố Lạng Sơn',13),(135,'Huyện Tràng Định',13),(136,'Huyện Bình Gia',13),(137,'Huyện Văn Lãng',13),(138,'Huyện Cao Lộc',13),(139,'Huyện Văn Quan',13),(140,'Huyện Bắc Sơn',13),(141,'Huyện Hữu Lũng',13),(142,'Huyện Chi Lăng',13),(143,'Huyện Lộc Bình',13),(144,'Huyện Đình Lập',13),(145,'Thành phố Hạ Long',14),(146,'Thành phố Móng Cái',14),(147,'Thành phố Cẩm Phả',14),(148,'Thành phố Uông Bí',14),(149,'Huyện Bình Liêu',14),(150,'Huyện Tiên Yên',14),(151,'Huyện Đầm Hà',14),(152,'Huyện Hải Hà',14),(153,'Huyện Ba Chẽ',14),(154,'Huyện Vân Đồn',14),(155,'Thị xã Đông Triều',14),(156,'Thị xã Quảng Yên',14),(157,'Huyện Cô Tô',14),(158,'Thành phố Bắc Giang',15),(159,'Huyện Yên Thế',15),(160,'Huyện Tân Yên',15),(161,'Huyện Lạng Giang',15),(162,'Huyện Lục Nam',15),(163,'Huyện Lục Ngạn',15),(164,'Huyện Sơn Động',15),(165,'Huyện Yên Dũng',15),(166,'Huyện Việt Yên',15),(167,'Huyện Hiệp Hòa',15),(168,'Thành phố Việt Trì',16),(169,'Thị xã Phú Thọ',16),(170,'Huyện Đoan Hùng',16),(171,'Huyện Hạ Hoà',16),(172,'Huyện Thanh Ba',16),(173,'Huyện Phù Ninh',16),(174,'Huyện Yên Lập',16),(175,'Huyện Cẩm Khê',16),(176,'Huyện Tam Nông',16),(177,'Huyện Lâm Thao',16),(178,'Huyện Thanh Sơn',16),(179,'Huyện Thanh Thuỷ',16),(180,'Huyện Tân Sơn',16),(181,'Thành phố Vĩnh Yên',17),(182,'Thành phố Phúc Yên',17),(183,'Huyện Lập Thạch',17),(184,'Huyện Tam Dương',17),(185,'Huyện Tam Đảo',17),(186,'Huyện Bình Xuyên',17),(187,'Huyện Yên Lạc',17),(188,'Huyện Vĩnh Tường',17),(189,'Huyện Sông Lô',17),(190,'Thành phố Bắc Ninh',18),(191,'Huyện Yên Phong',18),(192,'Huyện Quế Võ',18),(193,'Huyện Tiên Du',18),(194,'Thị xã Từ Sơn',18),(195,'Huyện Thuận Thành',18),(196,'Huyện Gia Bình',18),(197,'Huyện Lương Tài',18),(198,'Thành phố Hải Dương',19),(199,'Thành phố Chí Linh',19),(200,'Huyện Nam Sách',19),(201,'Thị xã Kinh Môn',19),(202,'Huyện Kim Thành',19),(203,'Huyện Thanh Hà',19),(204,'Huyện Cẩm Giàng',19),(205,'Huyện Bình Giang',19),(206,'Huyện Gia Lộc',19),(207,'Huyện Tứ Kỳ',19),(208,'Huyện Ninh Giang',19),(209,'Huyện Thanh Miện',19),(210,'Quận Hồng Bàng',20),(211,'Quận Ngô Quyền',20),(212,'Quận Lê Chân',20),(213,'Quận Hải An',20),(214,'Quận Kiến An',20),(215,'Quận Đồ Sơn',20),(216,'Quận Dương Kinh',20),(217,'Huyện Thuỷ Nguyên',20),(218,'Huyện An Dương',20),(219,'Huyện An Lão',20),(220,'Huyện Kiến Thuỵ',20),(221,'Huyện Tiên Lãng',20),(222,'Huyện Vĩnh Bảo',20),(223,'Huyện Cát Hải',20),(224,'Huyện Bạch Long Vĩ',20),(225,'Thành phố Hưng Yên',21),(226,'Huyện Văn Lâm',21),(227,'Huyện Văn Giang',21),(228,'Huyện Yên Mỹ',21),(229,'Thị xã Mỹ Hào',21),(230,'Huyện Ân Thi',21),(231,'Huyện Khoái Châu',21),(232,'Huyện Kim Động',21),(233,'Huyện Tiên Lữ',21),(234,'Huyện Phù Cừ',21),(235,'Thành phố Thái Bình',22),(236,'Huyện Quỳnh Phụ',22),(237,'Huyện Hưng Hà',22),(238,'Huyện Đông Hưng',22),(239,'Huyện Thái Thụy',22),(240,'Huyện Tiền Hải',22),(241,'Huyện Kiến Xương',22),(242,'Huyện Vũ Thư',22),(243,'Thành phố Phủ Lý',23),(244,'Thị xã Duy Tiên',23),(245,'Huyện Kim Bảng',23),(246,'Huyện Thanh Liêm',23),(247,'Huyện Bình Lục',23),(248,'Huyện Lý Nhân',23),(249,'Thành phố Nam Định',24),(250,'Huyện Mỹ Lộc',24),(251,'Huyện Vụ Bản',24),(252,'Huyện Ý Yên',24),(253,'Huyện Nghĩa Hưng',24),(254,'Huyện Nam Trực',24),(255,'Huyện Trực Ninh',24),(256,'Huyện Xuân Trường',24),(257,'Huyện Giao Thủy',24),(258,'Huyện Hải Hậu',24),(259,'Thành phố Ninh Bình',25),(260,'Thành phố Tam Điệp',25),(261,'Huyện Nho Quan',25),(262,'Huyện Gia Viễn',25),(263,'Huyện Hoa Lư',25),(264,'Huyện Yên Khánh',25),(265,'Huyện Kim Sơn',25),(266,'Huyện Yên Mô',25),(267,'Thành phố Thanh Hóa',26),(268,'Thị xã Bỉm Sơn',26),(269,'Thành phố Sầm Sơn',26),(270,'Huyện Mường Lát',26),(271,'Huyện Quan Hóa',26),(272,'Huyện Bá Thước',26),(273,'Huyện Quan Sơn',26),(274,'Huyện Lang Chánh',26),(275,'Huyện Ngọc Lặc',26),(276,'Huyện Cẩm Thủy',26),(277,'Huyện Thạch Thành',26),(278,'Huyện Hà Trung',26),(279,'Huyện Vĩnh Lộc',26),(280,'Huyện Yên Định',26),(281,'Huyện Thọ Xuân',26),(282,'Huyện Thường Xuân',26),(283,'Huyện Triệu Sơn',26),(284,'Huyện Thiệu Hóa',26),(285,'Huyện Hoằng Hóa',26),(286,'Huyện Hậu Lộc',26),(287,'Huyện Nga Sơn',26),(288,'Huyện Như Xuân',26),(289,'Huyện Như Thanh',26),(290,'Huyện Nông Cống',26),(291,'Huyện Đông Sơn',26),(292,'Huyện Quảng Xương',26),(293,'Thị xã Nghi Sơn',26),(294,'Thành phố Vinh',27),(295,'Thị xã Cửa Lò',27),(296,'Thị xã Thái Hoà',27),(297,'Huyện Quế Phong',27),(298,'Huyện Quỳ Châu',27),(299,'Huyện Kỳ Sơn',27),(300,'Huyện Tương Dương',27),(301,'Huyện Nghĩa Đàn',27),(302,'Huyện Quỳ Hợp',27),(303,'Huyện Quỳnh Lưu',27),(304,'Huyện Con Cuông',27),(305,'Huyện Tân Kỳ',27),(306,'Huyện Anh Sơn',27),(307,'Huyện Diễn Châu',27),(308,'Huyện Yên Thành',27),(309,'Huyện Đô Lương',27),(310,'Huyện Thanh Chương',27),(311,'Huyện Nghi Lộc',27),(312,'Huyện Nam Đàn',27),(313,'Huyện Hưng Nguyên',27),(314,'Thị xã Hoàng Mai',27),(315,'Thành phố Hà Tĩnh',28),(316,'Thị xã Hồng Lĩnh',28),(317,'Huyện Hương Sơn',28),(318,'Huyện Đức Thọ',28),(319,'Huyện Vũ Quang',28),(320,'Huyện Nghi Xuân',28),(321,'Huyện Can Lộc',28),(322,'Huyện Hương Khê',28),(323,'Huyện Thạch Hà',28),(324,'Huyện Cẩm Xuyên',28),(325,'Huyện Kỳ Anh',28),(326,'Huyện Lộc Hà',28),(327,'Thị xã Kỳ Anh',28),(328,'Thành Phố Đồng Hới',29),(329,'Huyện Minh Hóa',29),(330,'Huyện Tuyên Hóa',29),(331,'Huyện Quảng Trạch',29),(332,'Huyện Bố Trạch',29),(333,'Huyện Quảng Ninh',29),(334,'Huyện Lệ Thủy',29),(335,'Thị xã Ba Đồn',29),(336,'Thành phố Đông Hà',30),(337,'Thị xã Quảng Trị',30),(338,'Huyện Vĩnh Linh',30),(339,'Huyện Hướng Hóa',30),(340,'Huyện Gio Linh',30),(341,'Huyện Đa Krông',30),(342,'Huyện Cam Lộ',30),(343,'Huyện Triệu Phong',30),(344,'Huyện Hải Lăng',30),(345,'Huyện Cồn Cỏ',30),(346,'Thành phố Huế',31),(347,'Huyện Phong Điền',31),(348,'Huyện Quảng Điền',31),(349,'Huyện Phú Vang',31),(350,'Thị xã Hương Thủy',31),(351,'Thị xã Hương Trà',31),(352,'Huyện A Lưới',31),(353,'Huyện Phú Lộc',31),(354,'Huyện Nam Đông',31),(355,'Quận Liên Chiểu',32),(356,'Quận Thanh Khê',32),(357,'Quận Hải Châu',32),(358,'Quận Sơn Trà',32),(359,'Quận Ngũ Hành Sơn',32),(360,'Quận Cẩm Lệ',32),(361,'Huyện Hòa Vang',32),(362,'Huyện Hoàng Sa',32),(363,'Thành phố Tam Kỳ',33),(364,'Thành phố Hội An',33),(365,'Huyện Tây Giang',33),(366,'Huyện Đông Giang',33),(367,'Huyện Đại Lộc',33),(368,'Thị xã Điện Bàn',33),(369,'Huyện Duy Xuyên',33),(370,'Huyện Quế Sơn',33),(371,'Huyện Nam Giang',33),(372,'Huyện Phước Sơn',33),(373,'Huyện Hiệp Đức',33),(374,'Huyện Thăng Bình',33),(375,'Huyện Tiên Phước',33),(376,'Huyện Bắc Trà My',33),(377,'Huyện Nam Trà My',33),(378,'Huyện Núi Thành',33),(379,'Huyện Phú Ninh',33),(380,'Huyện Nông Sơn',33),(381,'Thành phố Quảng Ngãi',34),(382,'Huyện Bình Sơn',34),(383,'Huyện Trà Bồng',34),(384,'Huyện Sơn Tịnh',34),(385,'Huyện Tư Nghĩa',34),(386,'Huyện Sơn Hà',34),(387,'Huyện Sơn Tây',34),(388,'Huyện Minh Long',34),(389,'Huyện Nghĩa Hành',34),(390,'Huyện Mộ Đức',34),(391,'Thị xã Đức Phổ',34),(392,'Huyện Ba Tơ',34),(393,'Huyện Lý Sơn',34),(394,'Thành phố Quy Nhơn',35),(395,'Huyện An Lão',35),(396,'Thị xã Hoài Nhơn',35),(397,'Huyện Hoài Ân',35),(398,'Huyện Phù Mỹ',35),(399,'Huyện Vĩnh Thạnh',35),(400,'Huyện Tây Sơn',35),(401,'Huyện Phù Cát',35),(402,'Thị xã An Nhơn',35),(403,'Huyện Tuy Phước',35),(404,'Huyện Vân Canh',35),(405,'Thành phố Tuy Hoà',36),(406,'Thị xã Sông Cầu',36),(407,'Huyện Đồng Xuân',36),(408,'Huyện Tuy An',36),(409,'Huyện Sơn Hòa',36),(410,'Huyện Sông Hinh',36),(411,'Huyện Tây Hoà',36),(412,'Huyện Phú Hoà',36),(413,'Thị xã Đông Hòa',36),(414,'Thành phố Nha Trang',37),(415,'Thành phố Cam Ranh',37),(416,'Huyện Cam Lâm',37),(417,'Huyện Vạn Ninh',37),(418,'Thị xã Ninh Hòa',37),(419,'Huyện Khánh Vĩnh',37),(420,'Huyện Diên Khánh',37),(421,'Huyện Khánh Sơn',37),(422,'Huyện Trường Sa',37),(423,'Thành phố Phan Rang-Tháp Chàm',38),(424,'Huyện Bác Ái',38),(425,'Huyện Ninh Sơn',38),(426,'Huyện Ninh Hải',38),(427,'Huyện Ninh Phước',38),(428,'Huyện Thuận Bắc',38),(429,'Huyện Thuận Nam',38),(430,'Thành phố Phan Thiết',39),(431,'Thị xã La Gi',39),(432,'Huyện Tuy Phong',39),(433,'Huyện Bắc Bình',39),(434,'Huyện Hàm Thuận Bắc',39),(435,'Huyện Hàm Thuận Nam',39),(436,'Huyện Tánh Linh',39),(437,'Huyện Đức Linh',39),(438,'Huyện Hàm Tân',39),(439,'Huyện Phú Quí',39),(440,'Thành phố Kon Tum',40),(441,'Huyện Đắk Glei',40),(442,'Huyện Ngọc Hồi',40),(443,'Huyện Đắk Tô',40),(444,'Huyện Kon Plông',40),(445,'Huyện Kon Rẫy',40),(446,'Huyện Đắk Hà',40),(447,'Huyện Sa Thầy',40),(448,'Huyện Tu Mơ Rông',40),(449,'Huyện Ia H\' Drai',40),(450,'Thành phố Pleiku',41),(451,'Thị xã An Khê',41),(452,'Thị xã Ayun Pa',41),(453,'Huyện KBang',41),(454,'Huyện Đăk Đoa',41),(455,'Huyện Chư Păh',41),(456,'Huyện Ia Grai',41),(457,'Huyện Mang Yang',41),(458,'Huyện Kông Chro',41),(459,'Huyện Đức Cơ',41),(460,'Huyện Chư Prông',41),(461,'Huyện Chư Sê',41),(462,'Huyện Đăk Pơ',41),(463,'Huyện Ia Pa',41),(464,'Huyện Krông Pa',41),(465,'Huyện Phú Thiện',41),(466,'Huyện Chư Pưh',41),(467,'Thành phố Buôn Ma Thuột',42),(468,'Thị Xã Buôn Hồ',42),(469,'Huyện Ea H\'leo',42),(470,'Huyện Ea Súp',42),(471,'Huyện Buôn Đôn',42),(472,'Huyện Cư M\'gar',42),(473,'Huyện Krông Búk',42),(474,'Huyện Krông Năng',42),(475,'Huyện Ea Kar',42),(476,'Huyện M\'Đrắk',42),(477,'Huyện Krông Bông',42),(478,'Huyện Krông Pắc',42),(479,'Huyện Krông A Na',42),(480,'Huyện Lắk',42),(481,'Huyện Cư Kuin',42),(482,'Thành phố Gia Nghĩa',43),(483,'Huyện Đăk Glong',43),(484,'Huyện Cư Jút',43),(485,'Huyện Đắk Mil',43),(486,'Huyện Krông Nô',43),(487,'Huyện Đắk Song',43),(488,'Huyện Đắk R\'Lấp',43),(489,'Huyện Tuy Đức',43),(490,'Thành phố Đà Lạt',44),(491,'Thành phố Bảo Lộc',44),(492,'Huyện Đam Rông',44),(493,'Huyện Lạc Dương',44),(494,'Huyện Lâm Hà',44),(495,'Huyện Đơn Dương',44),(496,'Huyện Đức Trọng',44),(497,'Huyện Di Linh',44),(498,'Huyện Bảo Lâm',44),(499,'Huyện Đạ Huoai',44),(500,'Huyện Đạ Tẻh',44),(501,'Huyện Cát Tiên',44),(502,'Thị xã Phước Long',45),(503,'Thành phố Đồng Xoài',45),(504,'Thị xã Bình Long',45),(505,'Huyện Bù Gia Mập',45),(506,'Huyện Lộc Ninh',45),(507,'Huyện Bù Đốp',45),(508,'Huyện Hớn Quản',45),(509,'Huyện Đồng Phú',45),(510,'Huyện Bù Đăng',45),(511,'Huyện Chơn Thành',45),(512,'Huyện Phú Riềng',45),(513,'Thành phố Tây Ninh',46),(514,'Huyện Tân Biên',46),(515,'Huyện Tân Châu',46),(516,'Huyện Dương Minh Châu',46),(517,'Huyện Châu Thành',46),(518,'Thị xã Hòa Thành',46),(519,'Huyện Gò Dầu',46),(520,'Huyện Bến Cầu',46),(521,'Thị xã Trảng Bàng',46),(522,'Thành phố Thủ Dầu Một',47),(523,'Huyện Bàu Bàng',47),(524,'Huyện Dầu Tiếng',47),(525,'Thị xã Bến Cát',47),(526,'Huyện Phú Giáo',47),(527,'Thị xã Tân Uyên',47),(528,'Thành phố Dĩ An',47),(529,'Thành phố Thuận An',47),(530,'Huyện Bắc Tân Uyên',47),(531,'Thành phố Biên Hòa',48),(532,'Thành phố Long Khánh',48),(533,'Huyện Tân Phú',48),(534,'Huyện Vĩnh Cửu',48),(535,'Huyện Định Quán',48),(536,'Huyện Trảng Bom',48),(537,'Huyện Thống Nhất',48),(538,'Huyện Cẩm Mỹ',48),(539,'Huyện Long Thành',48),(540,'Huyện Xuân Lộc',48),(541,'Huyện Nhơn Trạch',48),(542,'Thành phố Vũng Tàu',49),(543,'Thành phố Bà Rịa',49),(544,'Huyện Châu Đức',49),(545,'Huyện Xuyên Mộc',49),(546,'Huyện Long Điền',49),(547,'Huyện Đất Đỏ',49),(548,'Thị xã Phú Mỹ',49),(549,'Huyện Côn Đảo',49),(550,'Quận 1',50),(551,'Quận 12',50),(552,'Quận Thủ Đức',50),(553,'Quận 9',50),(554,'Quận Gò Vấp',50),(555,'Quận Bình Thạnh',50),(556,'Quận Tân Bình',50),(557,'Quận Tân Phú',50),(558,'Quận Phú Nhuận',50),(559,'Quận 2',50),(560,'Quận 3',50),(561,'Quận 10',50),(562,'Quận 11',50),(563,'Quận 4',50),(564,'Quận 5',50),(565,'Quận 6',50),(566,'Quận 8',50),(567,'Quận Bình Tân',50),(568,'Quận 7',50),(569,'Huyện Củ Chi',50),(570,'Huyện Hóc Môn',50),(571,'Huyện Bình Chánh',50),(572,'Huyện Nhà Bè',50),(573,'Huyện Cần Giờ',50),(574,'Thành phố Tân An',51),(575,'Thị xã Kiến Tường',51),(576,'Huyện Tân Hưng',51),(577,'Huyện Vĩnh Hưng',51),(578,'Huyện Mộc Hóa',51),(579,'Huyện Tân Thạnh',51),(580,'Huyện Thạnh Hóa',51),(581,'Huyện Đức Huệ',51),(582,'Huyện Đức Hòa',51),(583,'Huyện Bến Lức',51),(584,'Huyện Thủ Thừa',51),(585,'Huyện Tân Trụ',51),(586,'Huyện Cần Đước',51),(587,'Huyện Cần Giuộc',51),(588,'Huyện Châu Thành',51),(589,'Thành phố Mỹ Tho',52),(590,'Thị xã Gò Công',52),(591,'Thị xã Cai Lậy',52),(592,'Huyện Tân Phước',52),(593,'Huyện Cái Bè',52),(594,'Huyện Cai Lậy',52),(595,'Huyện Châu Thành',52),(596,'Huyện Chợ Gạo',52),(597,'Huyện Gò Công Tây',52),(598,'Huyện Gò Công Đông',52),(599,'Huyện Tân Phú Đông',52),(600,'Thành phố Bến Tre',53),(601,'Huyện Châu Thành',53),(602,'Huyện Chợ Lách',53),(603,'Huyện Mỏ Cày Nam',53),(604,'Huyện Giồng Trôm',53),(605,'Huyện Bình Đại',53),(606,'Huyện Ba Tri',53),(607,'Huyện Thạnh Phú',53),(608,'Huyện Mỏ Cày Bắc',53),(609,'Thành phố Trà Vinh',54),(610,'Huyện Càng Long',54),(611,'Huyện Cầu Kè',54),(612,'Huyện Tiểu Cần',54),(613,'Huyện Châu Thành',54),(614,'Huyện Cầu Ngang',54),(615,'Huyện Trà Cú',54),(616,'Huyện Duyên Hải',54),(617,'Thị xã Duyên Hải',54),(618,'Thành phố Vĩnh Long',55),(619,'Huyện Long Hồ',55),(620,'Huyện Mang Thít',55),(621,'Huyện  Vũng Liêm',55),(622,'Huyện Tam Bình',55),(623,'Thị xã Bình Minh',55),(624,'Huyện Trà Ôn',55),(625,'Huyện Bình Tân',55),(626,'Thành phố Cao Lãnh',56),(627,'Thành phố Sa Đéc',56),(628,'Thành phố Hồng Ngự',56),(629,'Huyện Tân Hồng',56),(630,'Huyện Hồng Ngự',56),(631,'Huyện Tam Nông',56),(632,'Huyện Tháp Mười',56),(633,'Huyện Cao Lãnh',56),(634,'Huyện Thanh Bình',56),(635,'Huyện Lấp Vò',56),(636,'Huyện Lai Vung',56),(637,'Huyện Châu Thành',56),(638,'Thành phố Long Xuyên',57),(639,'Thành phố Châu Đốc',57),(640,'Huyện An Phú',57),(641,'Thị xã Tân Châu',57),(642,'Huyện Phú Tân',57),(643,'Huyện Châu Phú',57),(644,'Huyện Tịnh Biên',57),(645,'Huyện Tri Tôn',57),(646,'Huyện Châu Thành',57),(647,'Huyện Chợ Mới',57),(648,'Huyện Thoại Sơn',57),(649,'Thành phố Rạch Giá',58),(650,'Thành phố Hà Tiên',58),(651,'Huyện Kiên Lương',58),(652,'Huyện Hòn Đất',58),(653,'Huyện Tân Hiệp',58),(654,'Huyện Châu Thành',58),(655,'Huyện Giồng Riềng',58),(656,'Huyện Gò Quao',58),(657,'Huyện An Biên',58),(658,'Huyện An Minh',58),(659,'Huyện Vĩnh Thuận',58),(660,'Thành phố Phú Quốc',58),(661,'Huyện Kiên Hải',58),(662,'Huyện U Minh Thượng',58),(663,'Huyện Giang Thành',58),(664,'Quận Ninh Kiều',59),(665,'Quận Ô Môn',59),(666,'Quận Bình Thuỷ',59),(667,'Quận Cái Răng',59),(668,'Quận Thốt Nốt',59),(669,'Huyện Vĩnh Thạnh',59),(670,'Huyện Cờ Đỏ',59),(671,'Huyện Phong Điền',59),(672,'Huyện Thới Lai',59),(673,'Thành phố Vị Thanh',60),(674,'Thành phố Ngã Bảy',60),(675,'Huyện Châu Thành A',60),(676,'Huyện Châu Thành',60),(677,'Huyện Phụng Hiệp',60),(678,'Huyện Vị Thuỷ',60),(679,'Huyện Long Mỹ',60),(680,'Thị xã Long Mỹ',60),(681,'Thành phố Sóc Trăng',61),(682,'Huyện Châu Thành',61),(683,'Huyện Kế Sách',61),(684,'Huyện Mỹ Tú',61),(685,'Huyện Cù Lao Dung',61),(686,'Huyện Long Phú',61),(687,'Huyện Mỹ Xuyên',61),(688,'Thị xã Ngã Năm',61),(689,'Huyện Thạnh Trị',61),(690,'Thị xã Vĩnh Châu',61),(691,'Huyện Trần Đề',61),(692,'Thành phố Bạc Liêu',62),(693,'Huyện Hồng Dân',62),(694,'Huyện Phước Long',62),(695,'Huyện Vĩnh Lợi',62),(696,'Thị xã Giá Rai',62),(697,'Huyện Đông Hải',62),(698,'Huyện Hoà Bình',62),(699,'Thành phố Cà Mau',63),(700,'Huyện U Minh',63),(701,'Huyện Thới Bình',63),(702,'Huyện Trần Văn Thời',63),(703,'Huyện Cái Nước',63),(704,'Huyện Đầm Dơi',63),(705,'Huyện Năm Căn',63),(706,'Huyện Phú Tân',63),(707,'Huyện Ngọc Hiển',63);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'Front-end'),(2,'Back-end'),(3,'Mobile'),(4,'IOS'),(5,'Android'),(6,'Web'),(7,'Full-stack'),(8,'Data Analyst'),(9,'Business Analyst'),(10,'Data Science'),(11,'Data Engineer');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` tinyint NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,2,'Nguyen','Lam','2023-02-15',1,'+841234567',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,1,'Nguyen','Lam','+841234567',4);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `employer_id` bigint NOT NULL,
  `header` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `body` text NOT NULL,
  `time` timestamp NOT NULL,
  `is_read` tinyint NOT NULL,
  `direction` smallint NOT NULL,
  `recruitment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (8,1,1,'Thư ứng tuyển Tin tuyển dụng 6','Xin chào!\r\nTôi là ABC. Tôi muốn ứng tuyển công việc này.\r\nXin trân trọng cảm ơn','2023-03-14 12:03:31',0,0,5),(9,1,1,'Thư ứng tuyển Tin tuyển dụng 1','Xin chào!\r\nTôi là ABC. Tôi muốn ứng tuyển công việc này.\r\nXin trân trọng cảm ơn','2023-03-14 12:04:33',0,0,1);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `administrator_id` int NOT NULL,
  `header` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `body` text NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Thành phố Hà Nội',210),(2,'Tỉnh Hà Giang',210),(3,'Tỉnh Cao Bằng',210),(4,'Tỉnh Bắc Kạn',210),(5,'Tỉnh Tuyên Quang',210),(6,'Tỉnh Lào Cai',210),(7,'Tỉnh Điện Biên',210),(8,'Tỉnh Lai Châu',210),(9,'Tỉnh Sơn La',210),(10,'Tỉnh Yên Bái',210),(11,'Tỉnh Hoà Bình',210),(12,'Tỉnh Thái Nguyên',210),(13,'Tỉnh Lạng Sơn',210),(14,'Tỉnh Quảng Ninh',210),(15,'Tỉnh Bắc Giang',210),(16,'Tỉnh Phú Thọ',210),(17,'Tỉnh Vĩnh Phúc',210),(18,'Tỉnh Bắc Ninh',210),(19,'Tỉnh Hải Dương',210),(20,'Thành phố Hải Phòng',210),(21,'Tỉnh Hưng Yên',210),(22,'Tỉnh Thái Bình',210),(23,'Tỉnh Hà Nam',210),(24,'Tỉnh Nam Định',210),(25,'Tỉnh Ninh Bình',210),(26,'Tỉnh Thanh Hóa',210),(27,'Tỉnh Nghệ An',210),(28,'Tỉnh Hà Tĩnh',210),(29,'Tỉnh Quảng Bình',210),(30,'Tỉnh Quảng Trị',210),(31,'Tỉnh Thừa Thiên Huế',210),(32,'Thành phố Đà Nẵng',210),(33,'Tỉnh Quảng Nam',210),(34,'Tỉnh Quảng Ngãi',210),(35,'Tỉnh Bình Định',210),(36,'Tỉnh Phú Yên',210),(37,'Tỉnh Khánh Hòa',210),(38,'Tỉnh Ninh Thuận',210),(39,'Tỉnh Bình Thuận',210),(40,'Tỉnh Kon Tum',210),(41,'Tỉnh Gia Lai',210),(42,'Tỉnh Đắk Lắk',210),(43,'Tỉnh Đắk Nông',210),(44,'Tỉnh Lâm Đồng',210),(45,'Tỉnh Bình Phước',210),(46,'Tỉnh Tây Ninh',210),(47,'Tỉnh Bình Dương',210),(48,'Tỉnh Đồng Nai',210),(49,'Tỉnh Bà Rịa - Vũng Tàu',210),(50,'Thành phố Hồ Chí Minh',210),(51,'Tỉnh Long An',210),(52,'Tỉnh Tiền Giang',210),(53,'Tỉnh Bến Tre',210),(54,'Tỉnh Trà Vinh',210),(55,'Tỉnh Vĩnh Long',210),(56,'Tỉnh Đồng Tháp',210),(57,'Tỉnh An Giang',210),(58,'Tỉnh Kiên Giang',210),(59,'Thành phố Cần Thơ',210),(60,'Tỉnh Hậu Giang',210),(61,'Tỉnh Sóc Trăng',210),(62,'Tỉnh Bạc Liêu',210),(63,'Tỉnh Cà Mau',210);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employer_id` bigint NOT NULL,
  `time` timestamp NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `position` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `district_id` int NOT NULL,
  `experience` tinyint NOT NULL,
  `employee_number` int NOT NULL,
  `min_wage` decimal(12,2) DEFAULT NULL,
  `max_wage` decimal(12,2) DEFAULT NULL,
  `currency` char(5) DEFAULT NULL,
  `description` text NOT NULL,
  `requirement` text NOT NULL,
  `interest` text NOT NULL,
  `privacy` varchar(45) NOT NULL,
  `banner` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
INSERT INTO `recruitment` VALUES (1,1,'2023-02-27 11:07:31','Tin tuyển dụng 1','Intern','2023-02-04','2023-04-29','BA',1,0,4,10000000.00,12000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T18.07.31.425114800.png'),(2,1,'2023-02-27 11:18:36','Tin tuyển dụng 2','Full-time','2023-02-24','2023-04-09','Full stack Java',31,1,2,10000000.00,15000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T18.18.36.092657300.png'),(3,1,'2023-02-27 11:53:37','Tin tuyển dụng 3','Intern','2023-02-08','2023-03-24','Front End',210,1,2,10000000.00,15000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T18.53.37.092438200.png'),(4,1,'2023-02-27 11:54:06','Tin tuyển dụng 4','Intern','2023-02-08','2023-03-24','Back End',158,1,2,10000000.00,15000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T18.54.05.616008700.png'),(5,1,'2023-02-27 12:01:34','Tin tuyển dụng 6','Intern','2023-02-11','2023-03-12','BA',211,1,2,10000000.00,12000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T19.01.33.706438.png'),(6,1,'2023-02-27 12:02:12','Tin tuyển dụng 5','Intern','2023-02-11','2023-03-12','BA',61,1,2,10000000.00,12000000.00,NULL,'Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','Sản phẩm thực phẩm nhập khẩu và phân phối độc quyền: dễ bán, dễ lên đơn\r\n- Chăm sóc các khách hàng đã có sẵn tại các hệ thống GT & MT Tỉnh, chào các mã sản phẩm mới vào hệ thống khách hàng kênh GT & MT Tỉnh.\r\n- Phát triển, mở mới hệ thống NPP/Đại lý các tỉnh phía Bắc phù hợp với sản phẩm của công ty.\r\n- Chăm sóc khách hàng, bán hàng của khu vực, phân chia chỉ tiêu cho từng tuyến bán hàng.\r\n- Xử lý các vấn đề phát sinh của kênh bán hàng.\r\n- Làm việc tại văn phòng Xala – Hà Đông – Hà Nội','public','C:/Users/nguye/Documents/Java_project/Recruitment/uploaded_files/image/2023-02-27T19.02.12.403239500.png');
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment_domain`
--

DROP TABLE IF EXISTS `recruitment_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment_domain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recruitment_id` bigint NOT NULL,
  `domain_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment_domain`
--

LOCK TABLES `recruitment_domain` WRITE;
/*!40000 ALTER TABLE `recruitment_domain` DISABLE KEYS */;
INSERT INTO `recruitment_domain` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,4,1),(9,5,9),(10,6,8),(11,6,10);
/*!40000 ALTER TABLE `recruitment_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment_skill`
--

DROP TABLE IF EXISTS `recruitment_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruitment_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recruitment_id` bigint NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment_skill`
--

LOCK TABLES `recruitment_skill` WRITE;
/*!40000 ALTER TABLE `recruitment_skill` DISABLE KEYS */;
INSERT INTO `recruitment_skill` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,3),(6,3,3),(7,3,4),(8,4,3),(9,4,4),(10,5,1),(11,6,1),(12,6,4);
/*!40000 ALTER TABLE `recruitment_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `application_id` bigint NOT NULL,
  `body` text NOT NULL,
  `time` timestamp NOT NULL,
  `direction` tinyint NOT NULL,
  `is_read` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_cv`
--

DROP TABLE IF EXISTS `saved_cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_cv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employer_id` bigint NOT NULL,
  `cv_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_cv`
--

LOCK TABLES `saved_cv` WRITE;
/*!40000 ALTER TABLE `saved_cv` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_recruitment`
--

DROP TABLE IF EXISTS `saved_recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_recruitment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `recruitment_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_recruitment`
--

LOCK TABLES `saved_recruitment` WRITE;
/*!40000 ALTER TABLE `saved_recruitment` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'SQL'),(2,'C++'),(3,'Java'),(4,'Python'),(5,'JavaScript'),(6,'CSS'),(7,'HTML'),(8,'C#'),(9,'R'),(10,'PHP'),(11,'Spring Boot'),(12,'ReactJS'),(13,'NodeJS');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'recruitment'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14 22:00:48
