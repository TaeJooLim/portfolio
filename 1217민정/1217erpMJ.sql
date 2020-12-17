-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_code` varchar(10) NOT NULL,
  `client_use_state` char(1) NOT NULL,
  `client_company` varchar(30) NOT NULL,
  `client_license_num` char(12) NOT NULL,
  `client_ceo_name` varchar(15) NOT NULL,
  `client_business_condition` varchar(30) NOT NULL,
  `client_business_type` varchar(50) NOT NULL,
  `client_regdate` char(10) NOT NULL,
  `client_company_phone` varchar(12) NOT NULL,
  `client_company_fax` varchar(12) DEFAULT NULL,
  `client_company_page` varchar(100) DEFAULT NULL,
  `client_post` char(5) NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_nation` char(1) NOT NULL,
  `client_detail_address` varchar(100) NOT NULL,
  `client_responsibility` varchar(15) NOT NULL,
  `client_res_cp` char(13) NOT NULL,
  `client_res_email` varchar(50) NOT NULL,
  `client_payment_type` varchar(20) NOT NULL,
  `client_handling` varchar(50) NOT NULL,
  `client_note` varchar(100) NOT NULL,
  `client_tax_email` varchar(50) NOT NULL,
  `client_tax_responsibility` varchar(15) NOT NULL,
  `client_tax_company_phone` varchar(12) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (5,'a','Y','o','o','o','o','o','2020-12-31','01031531688','o','o','o','o','0','o','o','o','o','o','o','o','o','o','o'),(6,'20016','Y','k','k','k','k','k','2020-01-31','k','k','k','k','k','0','k','k','k','k','k','k','k','','',''),(7,'19127','Y','u','u','u','u','u','2019-12-31','u','u','u','u','u','0','u','u','u','u','u','u','u','a','a','a');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depart_code` char(3) DEFAULT NULL,
  `depart_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('000','중앙부서'),('100','인사과'),('200','경영과'),('300','기획과'),('400','총무과'),('500','전산과'),('600','지원과'),('700','영업과'),('800','마케팅과'),('900','생산과');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_department` char(3) NOT NULL,
  `emp_position` char(2) NOT NULL,
  `emp_num` varchar(20) NOT NULL,
  `emp_enter` char(10) NOT NULL,
  `emp_name` varchar(30) NOT NULL,
  `emp_birth` char(10) NOT NULL,
  `emp_password` varchar(20) NOT NULL,
  `emp_email` varchar(50) NOT NULL,
  `emp_regdate` date DEFAULT NULL,
  `emp_headcheck` char(1) DEFAULT 'N',
  `emp_step` int DEFAULT NULL,
  `emp_auth` int DEFAULT '1',
  `emp_confirm` char(1) DEFAULT 'N',
  `emp_photo` varchar(255) DEFAULT NULL,
  `emp_off_total` int DEFAULT NULL,
  `emp_off_use` int DEFAULT '0',
  `emp_off_remain` int DEFAULT '0',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'100','10','1','2019-11-30','','2019-11-27','2019-11-27','','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(2,'200','10','2012200','2020-12-29','모모씨','2020-12-17','2020-12-17','al2@als','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(3,'200','10','18092003','2018-09-28','바바','2015-05-22','2015-05-22','미미','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(4,'ad','ad','admin','1111-11-11','admin','1111-11-11','admin','admin','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0),(5,'ad','ad','aadmin','1111-11-11','aadmin','1111-11-11','admin2','admin2','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_code` char(2) DEFAULT NULL,
  `position_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES ('01','사원'),('02','주임'),('03','대리'),('04','과장'),('05','차장'),('06','부장'),('07','이사'),('08','상무'),('09','전무'),('10','부사장'),('11','사장'),('12','회장');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 18:13:57
