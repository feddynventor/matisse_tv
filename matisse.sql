-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: matisse
-- ------------------------------------------------------
-- Server version	8.0.22-1

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
-- Table structure for table `acquisti`
--

DROP TABLE IF EXISTS `acquisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(11) DEFAULT NULL,
  `video_id` int DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisti`
--

LOCK TABLES `acquisti` WRITE;
/*!40000 ALTER TABLE `acquisti` DISABLE KEYS */;
INSERT INTO `acquisti` VALUES (161,'hvpSUhwZrB',1785,'2020-10-01 20:20:13'),(162,'C5foT2Npy2',1785,'2020-10-01 20:41:05'),(163,'3qSDS0Phn9',1788,'2020-10-02 11:29:03'),(164,'3qSDS0Phn9',1793,'2020-10-02 18:25:15'),(165,'oLVBzc1ZWOC',1793,'2020-10-02 18:32:12'),(166,'3qSDS0Phn9',1794,'2020-10-02 18:51:02'),(167,'FpF8Cu3BNH',1794,'2020-10-02 18:56:50'),(168,'FpF8Cu3BNH',1823,'2020-10-03 13:05:01'),(169,'oLVBzc1ZWOC',1883,'2020-10-04 10:42:03'),(170,'hvpSUhwZrB',1883,'2020-10-04 10:46:04'),(171,'3qSDS0Phn9',1883,'2020-10-04 10:53:37'),(172,'hvpSUhwZrB',1874,'2020-10-04 12:55:31'),(173,'3qSDS0Phn9',1884,'2020-10-04 13:00:50'),(174,'kwNPJBLSNx',1884,'2020-10-04 13:03:09'),(175,'oLVBzc1ZWOC',1884,'2020-10-04 13:04:35'),(176,'hvpSUhwZrB',1884,'2020-10-04 13:13:56'),(177,'OfcRTMKI55',1884,'2020-10-04 13:21:57'),(178,'hvpSUhwZrB',1875,'2020-10-04 13:34:44'),(179,'3qSDS0Phn9',1875,'2020-10-04 13:36:08'),(180,'FpF8Cu3BNH',1884,'2020-10-04 14:07:48'),(181,'FpF8Cu3BNH',1875,'2020-10-04 14:15:29'),(182,'3qSDS0Phn9',1876,'2020-10-04 15:03:05'),(183,'3qSDS0Phn9',1877,'2020-10-04 15:56:29'),(184,'FpF8Cu3BNH',1877,'2020-10-04 15:57:45'),(185,'E9g3UuwBAF',1879,'2020-10-04 18:33:36'),(186,'E9g3UuwBAF',1878,'2020-10-04 18:38:13'),(187,'OfcRTMKI55',1879,'2020-10-04 18:40:03'),(188,'oLVBzc1ZWOC',1947,'2020-10-09 05:59:23'),(189,'LCxRB14qVU',NULL,'2020-10-09 08:51:06'),(190,'oLVBzc1ZWOC',1962,'2020-10-09 09:21:42'),(191,'LCxRB14qVU',1927,'2020-10-09 09:51:55'),(192,'oLVBzc1ZWOC',1927,'2020-10-09 11:18:31'),(193,'oLVBzc1ZWOC',1946,'2020-10-09 12:44:05'),(194,'oLVBzc1ZWOC',2024,'2020-10-10 09:53:31'),(195,'oLVBzc1ZWOC',1999,'2020-10-10 11:06:22'),(196,'oLVBzc1ZWOC',2001,'2020-10-10 12:46:31'),(197,'oLVBzc1ZWOC',2002,'2020-10-10 13:17:32'),(198,'oLVBzc1ZWOC',2003,'2020-10-10 14:13:41'),(199,'oLVBzc1ZWOC',2046,'2020-10-11 10:43:07'),(200,'oLVBzc1ZWOC',2031,'2020-10-11 10:43:27'),(201,'kwNPJBLSNx',2047,'2020-10-11 11:18:04'),(202,'LCxRB14qVU',2047,'2020-10-11 11:20:58'),(203,'oLVBzc1ZWOC',2047,'2020-10-11 11:23:12'),(204,'kwNPJBLSNx',2048,'2020-10-11 11:50:56'),(205,'kwNPJBLSNx',2032,'2020-10-11 12:07:06'),(206,'oLVBzc1ZWOC',2032,'2020-10-11 13:26:40'),(207,'oLVBzc1ZWOC',2160,'2020-10-17 12:00:14'),(208,'LCxRB14qVU',2160,'2020-10-17 12:15:12'),(209,'oLVBzc1ZWOC',2179,'2020-10-17 12:40:36'),(210,'oLVBzc1ZWOC',2161,'2020-10-17 13:11:39'),(211,'oLVBzc1ZWOC',2181,'2020-10-17 15:08:34'),(212,'3qSDS0Phn9',2181,'2020-10-17 15:42:16'),(213,'3qSDS0Phn9',2182,'2020-10-17 15:55:39'),(214,'E9g3UuwBAF',NULL,'2020-10-17 15:59:51'),(215,'E9g3UuwBAF',2182,'2020-10-17 15:59:58'),(216,'OfcRTMKI55',2182,'2020-10-17 16:00:54'),(217,'oLVBzc1ZWOC',2182,'2020-10-17 16:01:05'),(218,'3qSDS0Phn9',2183,'2020-10-17 18:00:36'),(219,'oLVBzc1ZWOC',2189,'2020-10-17 18:32:35'),(220,'uFQqMUa41R',2189,'2020-10-17 18:32:40'),(221,'OfcRTMKI55',2189,'2020-10-17 18:43:25'),(222,'E9g3UuwBAF',2189,'2020-10-17 19:51:23'),(223,'uFQqMUa41R',NULL,'2020-10-17 19:57:38'),(224,'LCxRB14qVU',2202,'2020-10-18 12:09:39'),(225,'oLVBzc1ZWOC',2202,'2020-10-18 12:56:51'),(226,'3qSDS0Phn9',2278,'2020-10-19 18:40:55'),(227,'nrreHbF966',NULL,'2020-10-20 10:08:48'),(228,'oLVBzc1ZWOC',2308,'2020-10-20 15:51:59'),(229,'OfcRTMKI55',2308,'2020-10-20 16:28:32'),(230,'uFQqMUa41R',2308,'2020-10-20 16:52:28'),(231,'FpF8Cu3BNH',2308,'2020-10-20 17:05:07'),(232,'kwNPJBLSNx',2308,'2020-10-20 17:10:18'),(233,'nrreHbF966',NULL,'2020-10-20 17:45:25'),(234,'nrreHbF966',NULL,'2020-10-20 17:45:34'),(235,'nrreHbF966',NULL,'2020-10-20 17:45:47'),(236,'nrreHbF966',NULL,'2020-10-20 17:45:56'),(237,'nrreHbF966',NULL,'2020-10-20 17:45:58'),(238,'nrreHbF966',NULL,'2020-10-20 17:46:00'),(239,'nrreHbF966',NULL,'2020-10-20 17:46:03'),(240,'nrreHbF966',2308,'2020-10-20 17:46:33'),(241,'nrreHbF966',NULL,'2020-10-20 17:46:42'),(242,'nrreHbF966',NULL,'2020-10-20 17:47:33'),(243,'nrreHbF966',NULL,'2020-10-20 17:47:36'),(244,'nrreHbF966',NULL,'2020-10-20 17:47:38'),(245,'nrreHbF966',NULL,'2020-10-20 17:47:40'),(246,'nrreHbF966',NULL,'2020-10-20 17:47:42'),(247,'nrreHbF966',NULL,'2020-10-20 17:47:44'),(248,'nrreHbF966',NULL,'2020-10-20 17:47:48'),(249,'QFK6OEoeYM',NULL,'2020-10-20 17:51:56'),(250,'3qSDS0Phn9',2308,'2020-10-20 17:54:35'),(251,'oLVBzc1ZWOC',2309,'2020-10-20 19:31:40'),(252,'3qSDS0Phn9',2333,'2020-10-22 18:44:14'),(253,'oLVBzc1ZWOC',2333,'2020-10-22 18:48:20'),(254,'oLVBzc1ZWOC',2367,'2020-10-23 13:45:17'),(255,'oLVBzc1ZWOC',2368,'2020-10-23 14:03:22'),(256,'oLVBzc1ZWOC',2369,'2020-10-23 15:38:08'),(257,'oLVBzc1ZWOC',2453,'2020-10-24 09:32:50'),(258,'LCxRB14qVU',2453,'2020-10-24 09:38:05'),(259,'oLVBzc1ZWOC',2401,'2020-10-24 11:00:27'),(260,'oLVBzc1ZWOC',2414,'2020-10-24 11:59:52'),(261,'oLVBzc1ZWOC',2403,'2020-10-24 12:54:21'),(262,'oLVBzc1ZWOC',2404,'2020-10-24 12:56:58'),(263,'LCxRB14qVU',2404,'2020-10-24 13:04:06'),(264,'oLVBzc1ZWOC',2416,'2020-10-24 13:09:34'),(265,'kwNPJBLSNx',2416,'2020-10-24 13:19:55'),(266,'OfcRTMKI55',2446,'2020-10-24 16:44:23'),(267,'oLVBzc1ZWOC',2406,'2020-10-24 16:44:38'),(268,'oLVBzc1ZWOC',2446,'2020-10-24 16:51:20'),(269,'E9g3UuwBAF',2446,'2020-10-24 17:28:57'),(270,'OfcRTMKI55',2447,'2020-10-24 18:51:33'),(271,'uFQqMUa41R',2450,'2020-10-24 20:08:51'),(272,'oLVBzc1ZWOC',2547,'2020-10-25 11:23:33'),(273,'LCxRB14qVU',2549,'2020-10-25 11:26:07'),(274,'LCxRB14qVU',2547,'2020-10-25 11:26:15'),(275,'oLVBzc1ZWOC',2548,'2020-10-25 11:51:29'),(276,'oLVBzc1ZWOC',2532,'2020-10-25 11:51:35'),(277,'oLVBzc1ZWOC',2549,'2020-10-25 11:55:35'),(278,'CMaE0bUinA',2549,'2020-10-25 12:01:52'),(279,'oLVBzc1ZWOC',2550,'2020-10-25 13:04:58'),(280,'oLVBzc1ZWOC',2589,'2020-10-25 13:05:11'),(281,'oLVBzc1ZWOC',2533,'2020-10-25 13:05:19'),(282,'oLVBzc1ZWOC',2590,'2020-10-25 14:29:32'),(283,'3qSDS0Phn9',2591,'2020-10-25 16:06:11'),(284,'oLVBzc1ZWOC',2591,'2020-10-25 16:37:05'),(285,'oLVBzc1ZWOC',2592,'2020-10-25 17:04:44'),(286,'3qSDS0Phn9',2593,'2020-10-25 18:19:55'),(287,'3qSDS0Phn9',2592,'2020-10-25 18:20:12'),(288,'oLVBzc1ZWOC',2593,'2020-10-25 19:30:12'),(289,'oLVBzc1ZWOC',2594,'2020-10-25 19:40:11'),(290,'OfcRTMKI55',2594,'2020-10-25 19:41:30'),(291,'FpF8Cu3BNH',2594,'2020-10-25 19:49:23'),(292,'E9g3UuwBAF',2594,'2020-10-25 20:35:29'),(293,'uFQqMUa41R',2594,'2020-10-25 21:06:39'),(294,'3qSDS0Phn9',2637,'2020-10-26 18:45:52'),(295,'3qSDS0Phn9',2638,'2020-10-26 19:46:14'),(296,'oLVBzc1ZWOC',2638,'2020-10-26 19:53:58'),(297,'oLVBzc1ZWOC',2653,'2020-10-27 17:53:31'),(298,'OfcRTMKI55',2653,'2020-10-27 17:53:39'),(299,'FpF8Cu3BNH',2653,'2020-10-27 18:30:18'),(300,'3qSDS0Phn9',2654,'2020-10-27 20:10:40'),(301,'oLVBzc1ZWOC',2666,'2020-10-28 19:25:26'),(302,'oLVBzc1ZWOC',2665,'2020-10-28 21:36:54'),(303,'3qSDS0Phn9',2703,'2020-10-29 18:02:26'),(304,'FpF8Cu3BNH',2703,'2020-10-29 18:15:49'),(305,'oLVBzc1ZWOC',2703,'2020-10-29 18:31:23'),(306,'OfcRTMKI55',2703,'2020-10-29 18:48:27'),(307,'oLVBzc1ZWOC',2786,'2020-10-31 08:33:40'),(308,'LCxRB14qVU',2786,'2020-10-31 09:02:44'),(309,'oLVBzc1ZWOC',2787,'2020-10-31 17:00:51'),(310,'FpF8Cu3BNH',2787,'2020-10-31 17:06:02'),(311,'3qSDS0Phn9',2842,'2020-11-01 12:11:05'),(312,'oLVBzc1ZWOC',2844,'2020-11-01 12:20:24'),(313,'oLVBzc1ZWOC',2842,'2020-11-01 12:20:33'),(314,'3qSDS0Phn9',2843,'2020-11-01 12:27:29'),(315,'OfcRTMKI55',2843,'2020-11-01 13:54:51'),(316,'oLVBzc1ZWOC',2843,'2020-11-01 14:17:30'),(317,'FpF8Cu3BNH',2843,'2020-11-01 14:19:38'),(318,'oLVBzc1ZWOC',2965,'2020-11-04 18:07:13'),(319,'OfcRTMKI55',2966,'2020-11-04 19:51:50'),(320,'oLVBzc1ZWOC',2966,'2020-11-04 19:54:19'),(321,'E9g3UuwBAF',2966,'2020-11-04 19:58:40'),(322,'3qSDS0Phn9',2966,'2020-11-04 20:32:40'),(323,'3qSDS0Phn9',2985,'2020-11-05 18:20:45'),(324,'3qSDS0Phn9',2986,'2020-11-05 19:54:39'),(325,'oLVBzc1ZWOC',3563,'2020-11-28 16:09:59'),(326,'OfcRTMKI55',3563,'2020-11-28 16:42:25'),(327,'oLVBzc1ZWOC',3564,'2020-11-28 17:03:34'),(328,'OfcRTMKI55',3564,'2020-11-28 17:06:58'),(329,'oLVBzc1ZWOC',3656,'2020-11-29 12:39:44'),(330,'oLVBzc1ZWOC',3786,'2020-12-01 19:45:31'),(331,'OfcRTMKI55',3786,'2020-12-01 20:01:14'),(332,'oLVBzc1ZWOC',3807,'2020-12-02 19:22:29'),(333,'oLVBzc1ZWOC',3808,'2020-12-02 20:02:38'),(334,'OfcRTMKI55',3808,'2020-12-02 20:04:57'),(335,'E9g3UuwBAF',3808,'2020-12-02 20:11:52'),(336,'oLVBzc1ZWOC',3869,'2020-12-04 14:43:40'),(337,'oLVBzc1ZWOC',3875,'2020-12-04 21:21:16'),(338,'oLVBzc1ZWOC',3933,'2020-12-05 12:09:11'),(339,'LCxRB14qVU',3933,'2020-12-05 12:24:58'),(340,'oLVBzc1ZWOC',3970,'2020-12-05 12:28:35'),(341,'E9g3UuwBAF',3972,'2020-12-05 14:01:51'),(342,'oLVBzc1ZWOC',3935,'2020-12-05 14:10:44'),(343,'oLVBzc1ZWOC',3936,'2020-12-05 15:19:44'),(344,'oLVBzc1ZWOC',3972,'2020-12-05 15:34:39'),(345,'oLVBzc1ZWOC',3973,'2020-12-05 16:41:04'),(346,'oLVBzc1ZWOC',3938,'2020-12-05 16:41:13'),(347,'E9g3UuwBAF',3974,'2020-12-05 16:51:55'),(348,'OfcRTMKI55',3974,'2020-12-05 16:57:24'),(349,'LCxRB14qVU',3939,'2020-12-05 17:01:32'),(350,'oLVBzc1ZWOC',3974,'2020-12-05 17:11:51'),(351,'oLVBzc1ZWOC',3939,'2020-12-05 17:12:05'),(352,'oLVBzc1ZWOC',3940,'2020-12-05 18:14:16'),(353,'OfcRTMKI55',3976,'2020-12-05 20:07:06'),(354,'oLVBzc1ZWOC',3992,'2020-12-06 16:34:05'),(355,'oLVBzc1ZWOC',3993,'2020-12-06 17:05:31'),(356,'OfcRTMKI55',4052,'2020-12-06 21:08:42'),(357,'OfcRTMKI55',4011,'2020-12-06 21:21:31'),(358,'oLVBzc1ZWOC',4128,'2020-12-09 18:01:52'),(359,'CMaE0bUinA',4129,'2020-12-09 19:35:19'),(360,'3qSDS0Phn9',4128,'2020-12-09 19:49:27'),(361,'3qSDS0Phn9',4129,'2020-12-09 19:52:06'),(362,'oLVBzc1ZWOC',4129,'2020-12-09 20:06:50'),(363,'mKpTS9ELL8',4129,'2020-12-09 20:15:25'),(364,'OfcRTMKI55',4129,'2020-12-09 20:15:49'),(365,'FpF8Cu3BNH',4129,'2020-12-09 20:20:21'),(366,'kwNPJBLSNx',4129,'2020-12-09 20:31:46'),(367,'E9g3UuwBAF',4129,'2020-12-09 21:33:44'),(368,'oLVBzc1ZWOC',4296,'2020-12-12 10:02:48'),(369,'oLVBzc1ZWOC',4250,'2020-12-12 11:07:04'),(370,'LCxRB14qVU',4252,'2020-12-12 13:45:19'),(371,'oLVBzc1ZWOC',4253,'2020-12-12 14:11:50'),(372,'oLVBzc1ZWOC',4365,'2020-12-13 11:29:43'),(373,'oLVBzc1ZWOC',4355,'2020-12-13 11:55:08'),(374,'OfcRTMKI55',4359,'2020-12-13 16:34:13'),(375,'E9g3UuwBAF',4359,'2020-12-13 16:51:45'),(376,'oLVBzc1ZWOC',4359,'2020-12-13 17:09:40'),(377,'OfcRTMKI55',4361,'2020-12-13 20:02:05'),(378,'3qSDS0Phn9',4362,'2020-12-13 21:52:10'),(379,'3qSDS0Phn9',4363,'2020-12-13 22:31:22'),(380,'3qSDS0Phn9',4364,'2020-12-13 22:31:27'),(381,'oLVBzc1ZWOC',4464,'2020-12-16 20:08:32'),(382,'E9g3UuwBAF',4538,'2020-12-19 19:43:14'),(383,'oLVBzc1ZWOC',4538,'2020-12-19 19:43:39'),(384,'OfcRTMKI55',4538,'2020-12-19 19:47:43'),(385,'OfcRTMKI55',4582,'2020-12-20 13:57:35'),(386,'oLVBzc1ZWOC',4582,'2020-12-20 14:42:03'),(387,'oLVBzc1ZWOC',4583,'2020-12-20 16:10:01'),(388,'oLVBzc1ZWOC',4630,'2020-12-22 19:48:27'),(389,'E9g3UuwBAF',4630,'2020-12-22 21:01:48');
/*!40000 ALTER TABLE `acquisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int NOT NULL,
  `nome` char(50) DEFAULT NULL,
  `enabled` char(1) DEFAULT '1',
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'Sky Sport F1 HD','0','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Sky_Sport_F1_2018.svg/100px-Sky_Sport_F1_2018.svg.png'),(2,'Sky Sport MotoGP','0','https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Sky_Sport_MotoGP_-_Logo_2018.svg/100px-Sky_Sport_MotoGP_-_Logo_2018.svg.png'),(3,'Sky Sport Serie A','1','https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Sky_Sport_Serie_A_-_Logo_2018.svg/100px-Sky_Sport_Serie_A_-_Logo_2018.svg.png'),(4,'Sky Sport Football HD','0','https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sky_Sport_Football_-_Logo_2018.svg/100px-Sky_Sport_Football_-_Logo_2018.svg.png'),(5,'Sky Sport Arena HD','0','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Sky_Sport_Arena_-_Logo_2018.svg/100px-Sky_Sport_Arena_-_Logo_2018.svg.png'),(6,'DAZN1','0','https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/DAZN_LogoInBox_black.svg/40px-DAZN_LogoInBox_black.svg.png'),(7,'Sky Sport Uno','0','https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Sky_Sport_-_Logo_2020.svg/100px-Sky_Sport_-_Logo_2020.svg.png');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `credit` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('3qSDS0Phn9','www.carmine03@gmail.com','Z3JlZW4=','2020-12-13 21:52:10',967),('C5foT2Npy2','fabioiodice003@gmail.com','Nng1UEZmVVdRTnozQVJl','2020-10-01 20:41:05',98),('CMaE0bUinA','mariodimatteo13@gmail.com','dGZlN0J3djNxOWY2aWJO','2020-10-25 12:01:52',36),('E9g3UuwBAF','nicola.maggiulli@itisandria.it','U2FtYW50aGE=','2020-12-22 21:01:48',75),('FpF8Cu3BNH','ciao.defe1@gmail.com','YmFsb3RlbGxpNDU=','2020-11-01 14:19:38',76),('hvpSUhwZrB','balduccii63@gmail.com','SXZhbjI1MDM=','2020-10-04 13:34:44',95),('I50lyXLHmp','luigitozzo02@gmail.com','Y2xhcmlzc2ExMA==','2020-12-09 20:28:36',0),('kwNPJBLSNx','antonio.diroma@local','VG9uaW83NTUyIQ==','2020-10-24 13:19:55',90),('LCxRB14qVU','supermarcogamer3839@gmail.com','NjRqZHEySGhneENYMlhm','2020-12-12 13:45:19',90),('LsYz4jj9nA','ricci.franci.fr@gmail.com','Y2lhb2ZlZGVsZQ==','2020-09-27 14:06:43',100),('mKpTS9ELL8','gabriele.mazzilli@itisandria.it','Z2FiYm8yMDAy','2020-12-09 20:15:02',0),('nrreHbF966','andreacata02@outlook.it','RmVkZWxlR2F5MTIz','2020-10-20 18:01:31',100),('OfcRTMKI55','michelepio04fe@gmail.com','cm9tcGlwYWxsb25l','2020-12-20 13:57:35',53),('oLVBzc1ZWOC','allerta12@gmail.com','bWFkZ2lyaXJkdTY0','2020-12-22 19:48:27',889),('OxxfkFiV6J','','','2020-12-04 14:00:54',0),('QFK6OEoeYM','fabio.napolitano@itisandria.it','bmV2ZXJsZXR5b3Vkb3du','2020-10-22 19:35:20',100),('uFQqMUa41R','savino.fiore@itisandria.it','SXRpc21lcmRh','2020-10-25 21:06:39',93);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` char(255) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `air` int DEFAULT NULL,
  `inizio` char(6) DEFAULT NULL,
  `fine` char(6) DEFAULT NULL,
  `giorno` char(8) DEFAULT NULL,
  `channel` char(50) DEFAULT NULL,
  `descrizione` text,
  `rec` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4651 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (4633,'NBA: Brooklyn - Golden State',3,0,'010000','040000','20201223','7','Si riparte, con il duello Durant-Curry in copertina. Commento in lingua originale.(n)',0),(4634,'NBA: LA Lakers - LA Clippers',3,0,'040000','070000','20201223','7','Nella notte della consegna degli anelli comincia la stagione per Lakers e Clippers. Commento in lingua originale.(n)',0),(4635,'Sky Sport Uno HD',1,0,'193000','204000','20201223','7','2a parte - Le immagini dai campi di Serie A, le interviste ai protagonisti e gli aggiornamenti su tutto lo sport di Sky. Con Alessandro Bonan, Gianluca Di Marzio, Marco Bucciantini e Giorgia Cenni.(n)',0),(4636,'Napoli - Torino',2,0,'204000','224500','20201223','7','Serie A - 14a g. Napoli reduce da 2 sconfitte e non segna da 202 minuti. Il Toro viene dal pari col Bologna. Finora una sola vittoria. Non vince a Napoli da 11 anni. TC: Trevisani-Marchegiani.(n)',0),(4637,'Sky Sport Uno HD',1,0,'224500','240000','20201223','7','3a parte - Le immagini dai campi di Serie A, le interviste ai protagonisti e gli aggiornamenti su tutto lo sport di Sky. Con Alessandro Bonan, Gianluca Di Marzio, Marco Bucciantini e Giorgia Cenni.(n)',0),(4638,'NBA: Boston - Milwaukee',3,0,'013000','043000','20201224','7','Le migliori partite della stagione 2020-21, una delle piu\' imprevedibili e spettacolari di sempre.(n)',0),(4639,'Hibernian - St. Mirren',2,0,'185500','210000','20201223','4','Scottish Premiership - 19a g. L\'Hibernian, per passare il Natale da terzo in classifica, deve battere il St. Mirren, il club che ha eliminato i Rangers dalla League Cup. TC: Filippo Benincampi.(n)',0),(4640,'#SkyBuffaPresenta',3,0,'210000','233000','20201222','5','The Class of \'92 - David Beckham, Nicky Butt, Ryan Giggs, Paul Scholes, Gary e Phil Neville: la generazione di fenomeni che ha reso un mito il Man. United di Sir Alex Ferguson. Con commento di Federico Buffa.(n)',0),(4641,'#SkyBuffaPresenta',3,0,'111500','133500','20201223','5','The Class of \'92 - David Beckham, Nicky Butt, Ryan Giggs, Paul Scholes, Gary e Phil Neville: la generazione di fenomeni che ha reso un mito il Man. United di Sir Alex Ferguson. Con commento di Federico Buffa.(n)',0),(4642,'#SkyBuffaPresenta',3,0,'164000','190000','20201223','5','The Class of \'92 - David Beckham, Nicky Butt, Ryan Giggs, Paul Scholes, Gary e Phil Neville: la generazione di fenomeni che ha reso un mito il Man. United di Sir Alex Ferguson. Con commento di Federico Buffa.(n)',0),(4643,'Sky Calcio Live',1,0,'200000','204000','20201222','3','Le immagini dei campi di Serie A, le interviste ai protagonisti, commenti e analisi con Marco Cattaneo e i suoi ospiti.(n)',0),(4644,'Juventus - Fiorentina',2,0,'204000','224500','20201222','3','Serie A - 14a g. Juve imbattuta, 7 vittorie e 6 pari. - 4 dal Milan. Viola senza vittorie da 8 turni. Hanno sempre perso nelle ultime 9 sfide a Torino con 19 gol subiti. TC: Caressa-Bergomi.(n)',0),(4645,'Sky Calcio Live',1,0,'224500','233000','20201222','3','1a parte - Le immagini dei campi di Serie A, le interviste ai protagonisti, commenti e analisi con Marco Cattaneo e i suoi ospiti.(n)',0),(4646,'Sky Calcio Live',0,0,'233000','240000','20201222','3','2a parte - Le immagini dei campi di Serie A, le interviste ai protagonisti, commenti e analisi con Marco Cattaneo e i suoi ospiti.(n)',0),(4647,'Sky Calcio Show',1,0,'173000','182000','20201223','3','1a parte - Le immagini dai campi di Serie A, le interviste ai protagonisti e gli aggiornamenti su tutto lo sport di Sky. Con Alessandro Bonan, Gianluca Di Marzio, Marco Bucciantini e Giorgia Cenni.(n)',0),(4648,'Verona - Inter',3,0,'182000','203500','20201223','3','Serie A - 14a g. Veneti reduci dal pari con la Fiorentina. In casa non battono l\'Inter dal 1992, 3 pareggi e 6 ko. Inter con una striscia di 6 vittorie. -1 dal Milan.TC: Compagnoni-Adani.(n)',0),(4649,'Bologna - Atalanta',3,0,'203500','224500','20201223','3','Serie A - 14a g. Rossoblu\' senza vittorie da 4 giornate con 2 sconfitte e 2 pareggi. Atalanta reduce dal 4-1 sulla Roma. Al Dall\'Ara ha vinto 4 delle ultime 6 sfide. TC: Barone-Ambrosini.(n)',0),(4650,'Sky Sport Uno HD',1,0,'224500','240000','20201223','3','3a parte - Le immagini dai campi di Serie A, le interviste ai protagonisti e gli aggiornamenti su tutto lo sport di Sky. Con Alessandro Bonan, Gianluca Di Marzio, Marco Bucciantini e Giorgia Cenni.(n)',0);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-22 20:12:49
