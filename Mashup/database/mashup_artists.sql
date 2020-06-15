CREATE DATABASE  IF NOT EXISTS `mashup` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mashup`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: mashup
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(45) DEFAULT NULL,
  `artists_description` varchar(45) DEFAULT NULL,
  `artists_year_active` varchar(45) DEFAULT NULL,
  `artists_otherinfo` varchar(200) DEFAULT NULL,
  `artists_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`artists_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (6,'ajay-atul',NULL,NULL,NULL,'images/ajay-atul.jpg'),(7,'a.r.rahman',NULL,NULL,NULL,'images/a.r.rahaman.jpg'),(8,'Ranveer Singh',NULL,NULL,NULL,'images/ranveer_Singh.jpg'),(9,'Asees kaur','','','','images/asees_kaur.jpg'),(10,'Arijijt singh','','','','images/arijijt_singh.jpg'),(11,'Amit trivedi','','','','images/Amit-Trivedi.jpg'),(12,'Dev Negi','','','','images/Dev_nagi.jpg'),(13,'Neha kakkar','','','','images/neha-kakkar.jpg'),(14,'Divya kumar','','','','images/divyakumar.jpg'),(16,'Rahat Fateh Ali Khan','','','','images/rahat_fateh_ali_khan.jpg'),(17,'Sachin-Jigar','','','','images/sachin_jigar.jpg'),(18,'Mika Singh','','','','images/mika_singh.jpg'),(19,'Papon','','','','images/papon.jpg'),(20,'Shukhwinder Singh','','','','images/sukhwinder.jpg'),(21,'Ronkini Gupta','','','','images/ronkini_gupta.jpg'),(22,'Mohammad Rafi','','','','images/mohammad rafi.jpg'),(23,'Kunal Ganjawala','','','','images/kunal_Ganjawala.jpg'),(24,'Altamash Faridi','','','','images/altamash_faridi.jpg'),(25,'Romy','','','','images/romy.jpg'),(26,'Raja Kumari','','','','images/raja-kumari.jpg'),(28,'Atif Aslam','','','','images/atif_aslam.jpg');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12 17:18:15
