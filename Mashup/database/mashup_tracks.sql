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
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `track_name` varchar(45) DEFAULT NULL,
  `track_playtime` varchar(45) DEFAULT NULL,
  `track_lyric` varchar(1000) DEFAULT NULL,
  `track_url` varchar(50) DEFAULT NULL,
  `artists_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`track_id`),
  KEY `albumid_idx` (`album_id`),
  KEY `artists_id_idx` (`artists_id`),
  CONSTRAINT `albumid` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `artistsid` FOREIGN KEY (`artists_id`) REFERENCES `artists` (`artists_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,1,'zingaat','3:45',NULL,'music/Zingaat.mp3',6),(2,2,'Ok Jaanu Title Track','3:26',NULL,'music/Ok Jaanu-Title Song.mp3',7),(3,3,'Kashi Mee Jau Mathur','3:05',NULL,'music/Kashi Mee Jau Mathur.mp3',6),(4,2,'Enna Sona','3:33',NULL,'music/Enna Sona.mp3',10),(5,2,'The Humma Song','2:59',NULL,'music/The Humma Song.mp3',10),(6,2,'Jee Lein','4:46',NULL,'music/Jee Lein.mp3',10),(7,2,'Kaara Fankaara','5:47',NULL,'music/Kaara Fankaara.mp3',NULL),(8,2,'Saajan Aayo Re','6:09',NULL,'music/Saajan Aayo Re.mp3',NULL),(9,2,'Maula Wa Sallim','3:12',NULL,'music/Maula Wa Sallim.mp3',NULL),(10,2,'Sunn Bhavara','4:23',NULL,'music/Sunn Bhavara.mp3',NULL),(11,4,'Apna Time Aayega','2:20',NULL,'music/Apna Time Aayega.mp3',NULL),(13,4,'Asli Hip Hop','1:40','','music/Asli Hip Hop.mp3',NULL),(15,4,'Azadi','2:35','','music/Azadi.mp3',NULL),(17,4,'Doori','2:15','','music/Doori.mp3',NULL),(18,4,'India 91','3:14','','music/India 91.mp3',NULL),(19,4,'Mere Gully Mein','3:05','','music/Mere Gully Mein.mp3',NULL),(20,4,'Train Song','3:58','','music/Train Song.mp3',NULL),(21,5,'Jaan Nisaar Female','4:02','','music/Jaan Nisaar Female.mp3',NULL),(22,5,'Jaan Nisaar','3:58','','music/Jaan Nisaar.mp3',NULL),(23,5,'Namo Namo','5:22','','music/Namo Namo.mp3',NULL),(24,5,'Qaafirana','5:42','','music/Qaafirana.mp3',NULL),(25,5,'Sweetheart','5:22','','music/Sweetheart.mp3',NULL),(26,10,'Akh Lad Jave','3:00','','music/Akh Lad Jave.mp3',NULL),(27,10,'Chogada','4:09','','music/Chogada.mp3',NULL),(28,10,'Dholida','3:36','','music/Dholida.mp3',NULL),(29,10,'Loveyatri - Title Song','2:32','','music/Loveyatri - Title Song.mp3',NULL),(30,10,'Rangtaari','3:37','','music/Rangtaari.mp3',NULL),(31,10,'Tera Hua','3:34','','music/Tera Hua.mp3',NULL),(32,8,'Aala Re Aala','3:20','','music/Aala Re Aala.mp3',12),(33,8,'Aankh Marey','3:32','','music/Aankh Marey.mp3',13),(34,8,'Bandeya Rey Bandeya','4:14','','music/Bandeya Rey Bandeya.mp3',10),(35,8,'Mera Wala Dance','3:19','','music/Mera Wala Dance.mp3',13),(36,8,'Tere Bin','3:51','','music/Tere Bin.mp3',16),(37,6,'Aao Kabhi Haveli Pe','2:53','','music/Aao Kabhi Haveli Pe.mp3',17),(38,6,'Kamariya','3:08','','music/Kamariya.mp3',14),(39,6,'Milegi Milegi','2:33','','music/Milegi Milegi.mp3',18),(40,6,'Nazar Na Lag Jaaye','3:26','','music/Nazar Na Lag Jaaye.mp3',17),(46,9,'Affoo Khudaya Hamko Tumpe Pyar Aaya','3:20','','music/Affoo Khudaya Hamko Tumpe Pyar Aaya.mp3',22),(47,9,'Ann Bann','4:35','','music/Ann Bann.mp3',23),(48,9,'Duma Dam Mast Kalandar','2:13','','music/Duma Dam Mast Kalandar.mp3',24),(49,9,'Heer Badnaam','2:20','','music/Heer Badnaam.mp3',25),(50,9,'Husn Parcham','3:06','','music/Husn Parcham.mp3',26),(51,9,'Issaqbaazi','5:20','','music/Issaqbaazi.mp3',20),(52,9,'Tanha Hua','4:02','','music/Tanha Hua.mp3',16),(53,3,'Khel Mandala','4:47','','music/Khel Mandala.mp3',6),(54,3,'Lavani Apsara Aali','3:58','','music/Lavani Apsara Aali.mp3',6),(55,3,'Vajle Ki Bara','6:38','','music/Vajle Ki Bara.mp3',6),(56,3,'Natrang Ubha','4:19','','music/Natrang Ubha.mp3',6),(57,1,'Aatach Baya Ka Baavarla','5:34','','music/Aatach Baya Ka Baavarla.mp3',6),(58,1,'Sairat Zaala Ji','6:09','','music/Sairat Zaala Ji.mp3',6),(59,1,'Yad Lagla Ga','5:14','','music/Yad Lagla Ga.mp3',6),(73,13,'Chaav Laaga','05:48','','music/01 - Chaav Laaga - DownloadMing.SE.mp3',19),(74,13,'Khatar Patar','05:35','','music/02 - Khatar Patar - DownloadMing.SE.mp3',19),(75,13,'Sab Badhiya Hai ','03:56','','music/03 - Sab Badhiya Hai - DownloadMing.SE.mp3',20),(76,13,'Sui Dhaaga','05:25','','music/04 - Sui Dhaaga - DownloadMing.SE.mp3',14),(77,13,'Tu Hi Aham','05:15','','music/05 - Tu Hi Aham - DownloadMing.SE.mp3',21);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
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
