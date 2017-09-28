-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mymall
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `assess`
--

DROP TABLE IF EXISTS `assess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `userpic` varchar(45) DEFAULT NULL,
  `nikename` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assess`
--

LOCK TABLES `assess` WRITE;
/*!40000 ALTER TABLE `assess` DISABLE KEYS */;
INSERT INTO `assess` VALUES (1,1,'/static/u1.png','单色凌','宝贝非常漂亮 客服态度也很好 下次还会继续来买的',5,'2017.09.18',1),(2,2,'/static/u2.png','jay','窗外的麻雀，在电线杆上多嘴，你说这一句很有夏天的感觉',4,'2017.09.20',1),(3,3,'/static/u3.png','林俊杰','因为在 一千年以后世界早已没有我无法深情挽着你的手浅吻着你额头',3,'2017.09.22',1);
/*!40000 ALTER TABLE `assess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srco` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `href` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'static/b3.png','第1张图','https://baidu.com');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(45) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'/static/d1.png',1),(2,'/static/d2.png',1),(3,'/static/d3.png',1),(4,'/static/d4.png',1);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlist`
--

DROP TABLE IF EXISTS `productlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ico` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `originalCost` varchar(45) DEFAULT NULL,
  `details` varchar(45) DEFAULT NULL,
  `salesvolume` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlist`
--

LOCK TABLES `productlist` WRITE;
/*!40000 ALTER TABLE `productlist` DISABLE KEYS */;
INSERT INTO `productlist` VALUES (1,'static/c4.png','时尚风衣','100','145','送腰带~夏新款韩版宽松显瘦纯色','8888','上海');
/*!40000 ALTER TABLE `productlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mymall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-26 15:44:10
