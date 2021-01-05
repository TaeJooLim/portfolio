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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attend_id` int NOT NULL AUTO_INCREMENT,
  `attend_workdate` char(10) DEFAULT NULL,
  `attend_starttime` datetime DEFAULT NULL,
  `attend_endtime` datetime DEFAULT NULL,
  `attend_defaulttime` int DEFAULT '540',
  `attend_overtime` int DEFAULT NULL,
  `attend_totaltime` int DEFAULT NULL,
  `attend_late` char(1) DEFAULT NULL,
  `attend_workplace` char(1) DEFAULT 'Y',
  `attend_status` int DEFAULT NULL,
  `emp_id_fk` int NOT NULL,
  PRIMARY KEY (`attend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (32,'2021-01-05','2021-01-05 09:00:00','2021-01-05 16:47:15',540,-73,467,'Y','Y',2,16),(33,'2021-01-05','2021-01-05 16:55:43',NULL,540,NULL,NULL,'Y','Y',1,17),(34,'2021-01-05','2021-01-05 16:55:53','2021-01-05 16:55:54',540,-540,0,'Y','Y',2,9),(35,'2021-01-05','2021-01-05 16:56:06','2021-01-05 16:56:07',540,-540,0,'Y','Y',2,12);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `client` VALUES (5,'a','Y','o','o','o','o','o','2020-12-31','01031531688','o','o','o','o','0','o','o','o','o','o','o','o','o','o','o'),(6,'20016','Y','k','k','k','k','k','2020-01-31','k','k','k','k','k','0','k','k','k','k','k','k','k','','',''),(7,'19127','Y','u','u','u','u','u','2019-12-31','u','u','u','u','u','0','u','u','u','u','u','u','u','a','a','a'),(8,'16058','Y','삼성전자','59591010','이부진','어쩌고','저쩌고','2016-05-22','021313541','021313121','sam@am','13524','어디고','0','저기네','김추츄','02441155','alal@djdj','카아드','반도체','오오대겹','alfkg@dfj','전전오','02554433'),(9,'130810','Y','쿠퐁 주식회사','120-88-00767','김범석','통신 판매업','통신 판매업','2013-08-21','1577-7011','0001','http:/www.coupang.com /','0001','서울특별시 송파구 신천동 7번지 30','0','서울특별시 송파구 송파대로 570, 18층 (신천동)','쿠담당','021231234','--','-','종합몰','2017-서울송파-0680','--','--','1577-7011'),(10,'070112','Y','(주)일룸','215-86-93600','강성문','생활용 가구 도매업','생활용 가구 도매업','2007-01-01','02-3400-6330','02-443-3814','www.iloom.com','0002','서울특별시 송파구 오금로 311 3층','0','서울특별시 송파구 오금로 311 3층 (오금동)','-','-','webmast**@iloom.com','-','가구/수납용품/ 상품권','법인번호110111-3598088','webmast**@iloom.com','주일룸','02-340-6330'),(11,'000413','Y','키움증권(주)','107-81-76756','이현','증권 중개업','증권 중개업','2000-04-01','02-3787-5000','02-3787-5136','www.kiwoom.com','0003','서울특별시 영등포구 여의나루로4길 1','0','키움파이낸스스퀘어빌딩','-','-','-','-','증권','법인110111-1867948','-','김키움','-'),(12,'550714','Y','SK증권(주)','116-81-36307','김신','증권 중개업','증권 중개업','1995-07-30','02-3773-8245','02-3773-8107','www.sks.co.kr','0004','서울특별시 영등포구 국제금융로8길 3','0','SK증권빌딩','소권','-','-','-','증권','법인110111-0037112','-','애스캐이','-'),(13,'791015','Y','(주)신세계푸드','215-81-47377','김운아, 성열기','기관 구내식당업','기관 구내식당업','1979-10-11','02-3397-6000','02-3397-6198','www.shinsegaefood.com','0005','서울특별시 성동구 성수일로 56 ','0','성수동BY센터 4-7층(성수동2가, 백영 성수빌딩)','-','-','@shinsegae.com','-','종합몰','법인110111-0305288','@shinsegae.com','신새개','-'),(14,'130916','Y','마산내공장','210-94-4730','김만식','운송업','운송업','2013-09-30','032-011-2435','032-011-4352','-','0006','마산 어디어디','0','어디리 어떤디','박춘식','-','-','-','트럭','테스트','-','김민식','-'),(15,'000917','Y','(주)씨젠','110-81-47859','천종윤','의료용품 및 기타 의약 관련제품 제조업','의료용품 및 기타 의약 관련제품 제조업','2000-09-18','02-2240-4036','02-2240-4040','seegene.co.kr','31226','서울특별시 송파구 오금로 91','0','7층','종윤천','02-4940-3039','-','-','의료용품,기타의약품','110111-2070334','-','장희재','-'),(16,'910218','Y','(주)셀트리온','133-81-23603','기우성','생물학적 제제 제조업','생물학적 제제 제조업','1991-02-27','032-850-5000','032-850-5078','www.celltrion.com','35486','인천광역시 연수구 아카데미로 23','0','-','우기숙','032-124-1110','woo@celtrion','-','생물학적 제제','135011-0034038','-','선기성','-'),(17,'910218','Y','부건에프엔씨(주)','204-86-18595','박준성','여자용 겉옷 제조업','여자용 겉옷 제조업','2010-01-01','02-3290-7605','02-921-1766','www.bugunfnc.com','01234','서울특별시 금천구 디지털로 173','0','(가산동, 엘리시아) 8~9층','-','-','he**@bugunfnc.com','-','의류/패션/잡화/뷰티/ 건강/식품','110111-4251940','-','부기정','02-1224-5533');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'100','10','1','2019-11-30','','2019-11-27','2019-11-27','','2020-12-15','N',NULL,1,'Y',NULL,NULL,0,0),(2,'200','10','2012200','2020-12-29','모모씨','2020-12-17','2020-12-17','al2@als','2020-12-15','N',NULL,1,'Y',NULL,NULL,0,0),(3,'200','10','18092003','2018-09-28','바바','2015-05-22','2015-05-22','미미','2020-12-15','N',NULL,1,'Y',NULL,NULL,0,0),(4,'000','11','admin','1111-11-11','admin','1111-11-11','asd123456','admin','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0),(5,'ad','ad','aadmin','1111-11-11','aadmin','1111-11-11','admin2','admin2','2020-12-16','N',NULL,10,'Y',NULL,NULL,0,0),(6,'200','10','20122006','2020-12-15','a','2020-12-01','2020-12-01','a','2020-12-18','N',NULL,1,'Y',NULL,NULL,0,0),(7,'ad','ad','admin','1111-11-11','admin','1111-11-11','admin','admin','2021-01-05','N',NULL,10,'Y',NULL,NULL,0,0),(8,'200','04','14072002','2014-07-14','박과장','1990-03-14','1234','park@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(9,'100','02','20121003','2020-12-22','전주임','1990-03-14','1234','abc@email.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(10,'300','03','19083004','2019-08-31','김대리','1989-10-04','1234','kim@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(11,'400','07','05094005','2019-09-21','강이사','1977-11-04','1234','kang@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(12,'500','01','20095006','2020-01-10','신사원','1999-11-05','1234','shin@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(13,'600','08','02046007','2002-04-10','정상무','1972-05-05','1234','jeong@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(14,'800','01','20116008','2020-11-10','하사원','2000-10-05','1234','ha@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(15,'900','10','01019009','2001-01-01','부사장','2000-10-05','1234','bu@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(16,'700','06','100770010','2010-07-21','위부장','1975-10-22','1234','wee@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0),(17,'000','05','140200011','2014-02-04','민차장','1981-06-22','1234','min@blue.com','2021-01-05','N',NULL,1,'Y',NULL,NULL,0,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_detail`
--

DROP TABLE IF EXISTS `employee_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_detail` (
  `emp_company` char(2) NOT NULL,
  `emp_team` char(2) NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_CP` char(13) NOT NULL,
  `emp_extension` varchar(4) DEFAULT NULL,
  `emp_leader` varchar(10) DEFAULT '-',
  `emp_driving` char(1) DEFAULT NULL,
  `emp_carlicense` varchar(10) DEFAULT NULL,
  `emp_mycar` char(1) DEFAULT NULL,
  `emp_graduated` char(6) DEFAULT NULL,
  `emp_major` varchar(20) DEFAULT NULL,
  `emp_academy` varchar(20) DEFAULT NULL,
  `emp_reward` char(3) DEFAULT NULL,
  `emp_disability` char(3) DEFAULT NULL,
  `emp_army` char(4) DEFAULT NULL,
  `emp_religion` char(3) DEFAULT NULL,
  `emp_married` char(2) DEFAULT NULL,
  `emp_license1` varchar(20) DEFAULT NULL,
  `emp_license2` varchar(20) DEFAULT NULL,
  `emp_license3` varchar(20) DEFAULT NULL,
  `emp_lang1` varchar(20) DEFAULT NULL,
  `emp_lang2` varchar(20) DEFAULT NULL,
  `emp_nation` char(3) DEFAULT NULL,
  `emp_post` char(5) DEFAULT NULL,
  `emp_address` varchar(100) DEFAULT NULL,
  `emp_bank` varchar(10) DEFAULT NULL,
  `emp_accountnum` varchar(20) NOT NULL,
  `emp_address_detail` varchar(50) DEFAULT NULL,
  `emp_career` text,
  `emp_id_fk` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_detail`
--

LOCK TABLES `employee_detail` WRITE;
/*!40000 ALTER TABLE `employee_detail` DISABLE KEYS */;
INSERT INTO `employee_detail` VALUES ('본사','1팀','남','1234','444','-','-','2종보통','N','대학교중퇴','ㅁㅁ','','대상','대상','군필','천주교','기혼','정보처리','11','','','','','','','전북','','','',4),('본사','1팀','남','010-1111-1111',NULL,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'하나','0101010-10-101',NULL,NULL,2);
/*!40000 ALTER TABLE `employee_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_buy`
--

DROP TABLE IF EXISTS `order_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_buy` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_emp_team` varchar(10) NOT NULL,
  `order_emp_name` varchar(30) NOT NULL,
  `order_date` char(10) NOT NULL,
  `order_p_name` varchar(100) NOT NULL,
  `order_p_amount` int NOT NULL,
  `order_p_unit` varchar(5) NOT NULL,
  `order_p_buy` int NOT NULL,
  `order_total_price` int NOT NULL,
  `order_purpose` varchar(254) DEFAULT NULL,
  `order_doc_num` varchar(30) NOT NULL,
  `order_subject` varchar(20) NOT NULL,
  `order_confirm` char(1) DEFAULT 'N',
  `order_confirm_date` char(10) DEFAULT NULL,
  `order_sender` int NOT NULL,
  `order_receiver` int DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_buy`
--

LOCK TABLES `order_buy` WRITE;
/*!40000 ALTER TABLE `order_buy` DISABLE KEYS */;
INSERT INTO `order_buy` VALUES (1,'200','박과장','2020-12-08','휴대용 충전기',2,'EA',8000,16000,'기기 충전용','200_2020_12_buy','2020-12 경영과 구매요청서','N',NULL,2,5),(2,'800','하사원','2020-12-08','AMD CPU',4,'EA',350000,1400000,'부품 교체','800_2020_12_buy','2020-12 마케팅과 구매요청서','N',NULL,8,5),(3,'200','박과장','2020-12-11','아이리버 전자사전',3,'EA',700000,2100000,'업무용','200_2020_12_buy','2020-12 경영과 구매요청서','N',NULL,2,5),(4,'300','김대리','2020-12-20','탁상용시계',10,'EA',3000,30000,'업무용','300_2020_12_buy','2020-12 기획과 구매요청서','N',NULL,4,5),(5,'800','하사원','2020-12-20','탁상용시계',10,'EA',3000,30000,'업무용','800_2020_12_buy','2020-12 마케팅과 구매요청서','N',NULL,8,5),(6,'200','박과장','2020-12-28','맥북',1,'EA',2000000,2000000,'업무용','200_2020_12_buy','2020-12 경영과 구매요청서','N',NULL,2,5),(7,'200','박과장','2020-12-28','LG GRAM',1,'KG',2200000,2200000,'업무용','200_2020_12_buy','2020-12 경영과 구매요청서','N',NULL,2,5),(8,'200','박과장','2020-12-28','갤럭시S21',1,'EA',1500000,1500000,'업무용','200_2020_12_buy','2020-12 경영과 구매요청서','N',NULL,2,5),(9,'500','신사원','2020-12-28','AMD CPU',1,'EA',350000,350000,'업무용','500_2020_12_buy','2020-12 전산과 구매요청서','N',NULL,6,5),(10,'600','정상무','2020-12-29','하우젠 에어컨',1,'EA',5000000,5000000,'업무용','600_2020_12_buy','2020-12 지원과 구매요청서','N',NULL,7,5);
/*!40000 ALTER TABLE `order_buy` ENABLE KEYS */;
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

--
-- Table structure for table `salary_calculation`
--

DROP TABLE IF EXISTS `salary_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_calculation` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `starting_range` int DEFAULT NULL,
  `end_range` int DEFAULT NULL,
  `net_pay` int DEFAULT NULL,
  `salary_nps` int DEFAULT NULL,
  `salary_h_insurance` int DEFAULT NULL,
  `salary_care` int DEFAULT NULL,
  `salary_e_insurance` int DEFAULT NULL,
  `salary_income` int DEFAULT NULL,
  `salary_l_income` int DEFAULT NULL,
  `salary_totalcost` int DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_calculation`
--

LOCK TABLES `salary_calculation` WRITE;
/*!40000 ALTER TABLE `salary_calculation` DISABLE KEYS */;
INSERT INTO `salary_calculation` VALUES (3,1200000,1300000,1197900,100,200,300,400,500,600,2100),(4,1300000,1400000,1193480,54000,37440,2760,7800,4110,410,106520),(5,1400000,1500000,1282950,58500,40560,2990,8450,5960,590,117050),(6,1500000,1600000,1372040,63000,43680,3220,9100,8150,810,127960),(7,1600000,1700000,1461140,67500,46800,3450,9750,10330,1030,138860),(8,1700000,1800000,1550230,72000,49920,3680,10400,12520,1250,149770),(9,1800000,1900000,1639320,76500,53040,3910,11050,14710,1470,160680),(10,1900000,2000000,1728430,81000,56160,4140,11700,16890,1680,171570),(11,2000000,2100000,1817310,85500,59280,4370,12350,19270,1920,182690),(12,2100000,2200000,1905070,90000,62400,4600,13000,22670,2260,194930),(13,2200000,2300000,1992830,94500,65520,4830,13650,26070,2600,207170),(14,2300000,2400000,2080590,99000,68640,5060,14300,29470,2940,219410),(15,2400000,2500000,2166200,103500,71760,5290,14950,34820,3480,233800),(16,2500000,2600000,2248340,108000,74880,5520,15600,43330,4330,251660),(17,2600000,2700000,2330490,112500,78000,5750,16250,51830,5180,269510),(18,2700000,2800000,2412060,117000,81120,5980,16900,60860,6080,287940),(19,2800000,2900000,2490130,121500,84240,6210,17550,73070,7300,309870),(20,2900000,3000000,2567440,126000,87360,6440,18200,85970,8590,332560),(21,3000000,3100000,2656670,130500,90480,6670,18850,88030,8800,343330),(22,3100000,3200000,2736730,135000,93600,6900,19500,98430,9840,363270),(23,3200000,3300000,2814040,139500,96720,7130,20150,111330,11130,385960),(24,3300000,3400000,2891350,144000,99840,7360,20800,124230,12420,408650),(25,3400000,3500000,2968660,148500,102960,7590,21450,137130,13710,431340),(26,3500000,3600000,3045970,153000,106080,7820,22100,150030,15000,454030),(27,3600000,3700000,3123280,157500,109200,8050,22750,162930,16290,476720),(28,3700000,3800000,3200590,162000,112320,8280,23400,175830,17580,499410),(29,3800000,3900000,3277900,166500,115440,8510,24050,188730,18870,522100),(30,3900000,4000000,3349440,171000,118560,8740,24700,206880,20680,550560),(31,4000000,4100000,3425500,175500,121680,8970,25350,220910,22090,574500),(32,4100000,4200000,3501570,180000,124800,9210,26000,234930,23490,598430),(33,4200000,4300000,3577640,184500,127920,9440,26650,248960,24890,622360),(34,4300000,4400000,3653720,189000,131040,9670,27300,262980,26290,646280),(35,4400000,4500000,3729780,193500,134160,9900,27950,277010,27700,670220),(36,4500000,4600000,3805860,198000,137280,10130,28600,291030,29100,694140),(37,4600000,4700000,3881930,202500,140400,10360,29250,305060,30500,718070),(38,4700000,4800000,3955260,207000,143520,10590,29900,321580,32150,744740),(39,4800000,4900000,4031320,211500,146640,10820,30550,335610,33560,768680),(40,4900000,5000000,4107400,216000,149760,11050,31200,349630,34960,792600),(41,5000000,5100000,4183470,220500,152880,11280,31850,363660,36360,816530),(42,5100000,5200000,4259550,225000,156000,11510,32500,377680,37760,840450),(43,5200000,5300000,4335610,229500,159120,11740,33150,391710,39170,864390),(44,5300000,5400000,4411690,234000,162240,11970,33800,405730,40570,888310),(45,5400000,5500000,4487760,238500,165360,12200,34450,419760,41970,912240),(46,5500000,5600000,4562980,243000,168480,12430,35100,434560,43450,937020),(47,5600000,5700000,4629790,247500,171600,12660,35750,457000,45700,970210),(48,5700000,5800000,4696640,252000,174720,12890,36400,479410,47940,1003360),(49,5800000,5900000,4763510,256500,177840,13120,37050,501800,50180,1036490),(50,5900000,6000000,4830370,261000,180960,13350,37700,524200,52420,1069630),(51,6000000,6100000,4869760,265500,184080,13580,38350,571580,57150,1130240),(52,6100000,6200000,4936360,270000,187200,13810,39000,594210,59420,1163640),(53,6200000,6300000,5002970,274500,190320,14040,39650,616840,61680,1197030),(54,6300000,6400000,5069570,279000,193440,14270,40300,639480,63940,1230430),(55,6400000,6500000,5136170,283500,196560,14500,40950,662110,66210,1263830),(56,6500000,6600000,5202780,288000,199680,14730,41600,684740,68470,1297220),(57,6600000,6700000,5269390,292500,202800,14960,42250,707370,70730,1330610),(58,6700000,6800000,5335990,297000,205920,15190,42900,730000,73000,1364010),(59,6800000,6900000,5402600,301500,209040,15420,43550,752630,75260,1397400),(60,6900000,7000000,5469210,306000,212160,15650,44200,775260,77520,1430790),(61,7000000,7100000,5535820,310500,215280,15880,44850,797890,79780,1464180),(62,7100000,7200000,5602410,315000,218400,16110,45500,820530,82050,1497590),(63,7200000,7300000,5669020,319500,221520,16340,46150,843160,84310,1530980),(64,7300000,7400000,5735630,324000,224640,16570,46800,865790,86570,1564370),(65,7400000,7500000,5802230,328500,227760,16800,47450,888420,88840,1597770),(66,7500000,7600000,5868840,333000,230880,17030,48100,911050,91100,1631160),(67,7600000,7700000,5935450,337500,234000,17260,48750,933680,93360,1664550),(68,7700000,7800000,6002050,342000,237120,17490,49400,956310,95630,1697950),(69,7800000,7900000,6068650,346500,240240,17720,50050,978950,97890,1731350),(70,7900000,8000000,6135260,351000,243360,17950,50700,1001580,100150,1764740),(71,8000000,8100000,6201850,355500,246480,18190,51350,1024210,102420,1798150),(72,8100000,8200000,6268460,360000,249600,18420,52000,1046840,104680,1831540),(73,8200000,8300000,6335070,364500,252720,18650,52650,1069470,106940,1864930),(74,8300000,8400000,6401670,369000,255840,18880,53300,1092100,109210,1898330),(75,8400000,8500000,6468280,373500,258960,19110,53950,1114730,111470,1931720),(76,8500000,8600000,6534350,378000,262080,19340,54600,1137850,113780,1965650),(77,8600000,8700000,6600160,382500,265200,19570,55250,1161200,116120,1999840),(78,8700000,8800000,6665980,387000,268320,19800,55900,1184550,118450,2034020),(79,8800000,8900000,6731790,391500,271440,20030,56550,1207900,120790,2068210),(80,8900000,9000000,6797610,396000,274560,20260,57200,1231250,123120,2102390),(81,9000000,9100000,6863420,400500,277680,20490,57850,1254600,125460,2136580),(82,9100000,9200000,6929240,405000,280800,20720,58500,1277950,127790,2170760),(83,9200000,9300000,6985980,409500,283920,20950,59150,1309550,130950,2214020),(84,9300000,9400000,7040020,414000,287040,21180,59800,1343600,134360,2259980),(85,9400000,9500000,7094070,418500,290160,21410,60450,1377650,137760,2305930),(86,9500000,9600000,7148100,423000,293280,21640,61100,1411710,141170,2351900),(87,9600000,9700000,7202150,427500,296400,21870,61750,1445760,144570,2397850),(88,9700000,9800000,7256180,432000,299520,22100,62400,1479820,147980,2443820),(89,9800000,9900000,7310230,436500,302640,22330,63050,1513870,151380,2489770),(90,9900000,10000000,7364270,441000,305760,22560,63700,1547920,154790,2535730),(91,10000000,10100000,7418310,445500,308880,22790,64350,1581980,158190,2581690),(92,10100000,10200000,7353640,450000,312000,23020,65000,1723950,172390,2746360),(93,10200000,10300000,7407490,454500,315120,23250,65650,1758180,175810,2792510),(94,10300000,10400000,7461330,459000,318240,23480,66300,1792410,179240,2838670),(95,10400000,10500000,7515180,463500,321360,23710,66950,1826640,182660,2884820),(96,10500000,10600000,7569030,468000,324480,23940,67600,1860870,186080,2930970),(97,10600000,1070000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `salary_calculation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 18:11:39
