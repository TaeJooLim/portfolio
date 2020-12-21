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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (5,'a','Y','o','o','o','o','o','2020-12-31','01031531688','o','o','o','o','0','o','o','o','o','o','o','o','o','o','o'),(6,'20016','Y','k','k','k','k','k','2020-01-31','k','k','k','k','k','0','k','k','k','k','k','k','k','','',''),(7,'19127','Y','u','u','u','u','u','2019-12-31','u','u','u','u','u','0','u','u','u','u','u','u','u','a','a','a'),(8,'16058','Y','삼성전자','59591010','이부진','어쩌고','저쩌고','2016-05-22','021313541','021313121','sam@am','13524','어디고','0','저기네','김추츄','02441155','alal@djdj','카아드','반도체','오오대겹','alfkg@dfj','전전오','02554433'),(9,'130810','Y','쿠퐁 주식회사','120-88-00767','김범석','통신 판매업','통신 판매업','2013-08-21','1577-7011','0001','http:/www.coupang.com /','0001','서울특별시 송파구 신천동 7번지 30','0','서울특별시 송파구 송파대로 570, 18층 (신천동)','쿠담당','021231234','--','-','종합몰','2017-서울송파-0680','--','--','1577-7011'),(10,'070112','Y','(주)일룸','215-86-93600','강성문','생활용 가구 도매업','생활용 가구 도매업','2007-01-01','02-3400-6330','02-443-3814','www.iloom.com','0002','서울특별시 송파구 오금로 311 3층','0','서울특별시 송파구 오금로 311 3층 (오금동)','-','-','webmast**@iloom.com','-','가구/수납용품/ 상품권','법인번호110111-3598088','webmast**@iloom.com','주일룸','02-340-6330'),(11,'000413','Y','키움증권(주)','107-81-76756','이현','증권 중개업','증권 중개업','2000-04-01','02-3787-5000','02-3787-5136','www.kiwoom.com','0003','서울특별시 영등포구 여의나루로4길 1','0','키움파이낸스스퀘어빌딩','-','-','-','-','증권','법인110111-1867948','-','김키움','-'),(12,'550714','Y','SK증권(주)','116-81-36307','김신','증권 중개업','증권 중개업','1995-07-30','02-3773-8245','02-3773-8107','www.sks.co.kr','0004','서울특별시 영등포구 국제금융로8길 3','0','SK증권빌딩','소권','-','-','-','증권','법인110111-0037112','-','애스캐이','-'),(13,'791015','Y','(주)신세계푸드','215-81-47377','김운아, 성열기','기관 구내식당업','기관 구내식당업','1979-10-11','02-3397-6000','02-3397-6198','www.shinsegaefood.com','0005','서울특별시 성동구 성수일로 56 ','0','성수동BY센터 4-7층(성수동2가, 백영 성수빌딩)','-','-','@shinsegae.com','-','종합몰','법인110111-0305288','@shinsegae.com','신새개','-'),(14,'130916','Y','마산내공장','210-94-4730','김만식','운송업','운송업','2013-09-30','032-011-2435','032-011-4352','-','0006','마산 어디어디','0','어디리 어떤디','박춘식','-','-','-','트럭','테스트','-','김민식','-'),(15,'000917','Y','(주)씨젠','110-81-47859','천종윤','의료용품 및 기타 의약 관련제품 제조업','의료용품 및 기타 의약 관련제품 제조업','2000-09-18','02-2240-4036','02-2240-4040','seegene.co.kr','31226','서울특별시 송파구 오금로 91','0','7층','종윤천','02-4940-3039','-','-','의료용품,기타의약품','110111-2070334','-','장희재','-'),(16,'910218','Y','(주)셀트리온','133-81-23603','기우성','생물학적 제제 제조업','생물학적 제제 제조업','1991-02-27','032-850-5000','032-850-5078','www.celltrion.com','35486','인천광역시 연수구 아카데미로 23','0','-','우기숙','032-124-1110','woo@celtrion','-','생물학적 제제','135011-0034038','-','선기성','-'),(17,'910218','Y','부건에프엔씨(주)','204-86-18595','박준성','여자용 겉옷 제조업','여자용 겉옷 제조업','2010-01-01','02-3290-7605','02-921-1766','www.bugunfnc.com','01234','서울특별시 금천구 디지털로 173','0','(가산동, 엘리시아) 8~9층','-','-','he**@bugunfnc.com','-','의류/패션/잡화/뷰티/ 건강/식품','110111-4251940','-','부기정','02-1224-5533'),(18,'710520','Y','(주)포스코케이칼','506-81-01452','민경준','내화, 비내화 요업제품 제조업','내화, 비내화 요업제품 제조업','1971-05-13','054-290-0114','054-290-0114','www.poscochemical.com/','21357','경상북도 포항시 남구 신항로 110','0','-','경준민','054-221-7777','-','-','의류/패션/잡화/뷰티/ 건강/식품','174611-0001947','-','민경식','054-221-5454');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_car`
--

DROP TABLE IF EXISTS `corp_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_car` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `car_model` varchar(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_num` varchar(20) NOT NULL,
  `car_purchase_date` varchar(10) NOT NULL,
  `car_purchase_price` varchar(20) NOT NULL,
  `car_use_year` int DEFAULT NULL,
  `car_scrap_value` varchar(20) DEFAULT NULL,
  `car_insurance_start` varchar(10) DEFAULT NULL,
  `car_insurance_end` varchar(10) DEFAULT NULL,
  `car_comprehensive` char(1) DEFAULT 'N',
  `car_inspection` varchar(10) DEFAULT NULL,
  `car_total_mileage` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_car`
--

LOCK TABLES `corp_car` WRITE;
/*!40000 ALTER TABLE `corp_car` DISABLE KEYS */;
INSERT INTO `corp_car` VALUES (1,'카니발','카니발 2.2디젤','100가1010','2020.01.02','30,000,000원',1,'20,000,000원','2020.01.03','2030.01.03','Y','2020.08.01','23,000'),(2,'카니발','카니발 3.5가솔린','123다1010','2020.11.22','30,000,000원',1,'20,000,000원','2020.11.23','2030.11.23','Y','2020.09.01','20,000'),(3,'모닝','2019 모닝 1.0가솔린','222라1234','2019.01.10','10,000,000원',2,'8,000,000원','2019.01.10','2029.01.10','Y','2020.08.01','30,000'),(4,'모닝','2019 모닝 1.0가솔린','320마1111','2019.01.10','10,000,000원',2,'8,000,000원','2019.01.10','2029.01.10','Y','2020.08.01','25,000'),(5,'라보','2019 라보','234라1233','2019.01.10','9,000,000원',2,'8,000,000원','2019.01.10','2029.01.10','Y','2020.08.01','37,000'),(6,'라보','2019 라보','784라0805','2019.01.10','9,000,000원',2,'8,000,000원','2019.01.10','2029.01.10','Y','2020.01.10','58,000'),(7,'라보','2019 라보','288라8855','2019.01.10','9,000,000원',2,'8,000,000원','2019.01.10','2029.01.10','Y','2020.11.01','67,000'),(8,'그랜저','2020 그랜저 2.5가솔린','325나2332','2020.07.17','45,000,000원',2,'39,000,000원','2020.07.18','2030.01.18','Y','2020.10.01','10,000'),(9,'그랜저','2020 그랜저 3.1LPi','654나5423','2020.07.17','45,000,000원',2,'39,000,000원','2020.07.18','2030.01.18','Y','2020.10.12','15,000'),(10,'제네시스','2020 제네시스 G80 2.5가솔린','334나4234','2020.07.17','60,000,000원',2,'55,000,000원','2020.07.18','2030.01.18','Y','2020.10.01','10,000');
/*!40000 ALTER TABLE `corp_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_car_log`
--

DROP TABLE IF EXISTS `corp_car_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_car_log` (
  `car_pid` int NOT NULL AUTO_INCREMENT,
  `car_drive_date` varchar(10) NOT NULL,
  `car_destination` varchar(50) NOT NULL,
  `car_purpose` varchar(50) NOT NULL,
  `car_drive_start` varchar(10) NOT NULL,
  `car_drive_end` varchar(10) NOT NULL,
  `car_start_km` varchar(20) NOT NULL,
  `car_end_km` varchar(20) NOT NULL,
  `car_driver` varchar(10) NOT NULL,
  `car_passenger` varchar(10) DEFAULT NULL,
  `car_key` char(1) NOT NULL DEFAULT 'N',
  `car_fuel` varchar(20) DEFAULT NULL,
  `car_fuel_amount` varchar(10) DEFAULT NULL,
  `car_remark` varchar(200) DEFAULT NULL,
  `car_id_fk` int NOT NULL,
  PRIMARY KEY (`car_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_car_log`
--

LOCK TABLES `corp_car_log` WRITE;
/*!40000 ALTER TABLE `corp_car_log` DISABLE KEYS */;
INSERT INTO `corp_car_log` VALUES (1,'2020.12.20','부산','출장','09:00','16:00','12,000','12,400','김철수','이철수','Y','주유','30,000원','-',10),(2,'2020.12.22','서울','외부업체 컨택','09:00','19:00','12,400','14,600','김철수','-','N','주유','80,000원','-',10),(3,'2020.12.09','전주','배달','09:00','13:00','30,000','35,400','김철수','이철수','Y','주유','50,000원','-',9);
/*!40000 ALTER TABLE `corp_car_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'100','10','1','2019-11-30','','2019-11-27','2019-11-27','','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(2,'200','10','2012200','2020-12-29','모모씨','2020-12-17','2020-12-17','al2@als','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(3,'200','10','18092003','2018-09-28','바바','2015-05-22','2015-05-22','미미','2020-12-15','N',NULL,1,'N',NULL,NULL,0,0),(4,'ad','ad','admin','1111-11-11','admin','1111-11-11','admin','admin','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0),(5,'ad','ad','aadmin','1111-11-11','aadmin','1111-11-11','admin2','admin2','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0),(6,'200','10','20122006','2020-12-15','a','2020-12-01','2020-12-01','a','2020-12-18','N',NULL,1,'N',NULL,NULL,0,0);
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

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_type` char(1) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `p_brand` varchar(50) DEFAULT NULL,
  `p_group` char(2) NOT NULL,
  `p_modelnum` varchar(30) DEFAULT NULL,
  `p_unit` varchar(5) NOT NULL,
  `p_size` varchar(20) DEFAULT NULL,
  `p_currency` char(1) NOT NULL,
  `p_buy` int DEFAULT '0',
  `p_sell` int DEFAULT '0',
  `p_tax` int DEFAULT NULL,
  `p_taxuse` char(1) NOT NULL,
  `p_note` varchar(100) DEFAULT NULL,
  `account_id_fk` int NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-21 18:17:24
