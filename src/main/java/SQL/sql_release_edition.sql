-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: my_forum
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `post_pic`
--

DROP TABLE IF EXISTS `post_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_pic` (
  `post_id` int(11) NOT NULL,
  `pic1` varchar(45) DEFAULT NULL,
  `pic2` varchar(45) DEFAULT NULL,
  `pic3` varchar(45) DEFAULT NULL,
  `pic4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_pic`
--

LOCK TABLES `post_pic` WRITE;
/*!40000 ALTER TABLE `post_pic` DISABLE KEYS */;
INSERT INTO `post_pic` VALUES (1,'localhost:8080/statics/images/mypicture.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `post_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_board`
--

DROP TABLE IF EXISTS `t_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '论坛版块ID',
  `board_name` varchar(150) NOT NULL DEFAULT '' COMMENT '论坛版块名',
  `board_desc` varchar(255) DEFAULT NULL COMMENT '论坛版块描述',
  `topic_num` int(11) NOT NULL DEFAULT '0' COMMENT '帖子数目',
  PRIMARY KEY (`board_id`),
  KEY `AK_Board_NAME` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_board`
--

LOCK TABLES `t_board` WRITE;
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
INSERT INTO `t_board` VALUES (1,'生活','生活享受',32),(2,'情感','情感分享',4),(3,'大学','此是大学的生活的描述',6),(4,'旅游','这是关于旅游的描述',2),(5,'美食','这是关于美食的描述',1),(99,'问答','此板块为问答专区',4);
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_board_manager`
--

DROP TABLE IF EXISTS `t_board_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_board_manager` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`board_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_board_manager`
--

LOCK TABLES `t_board_manager` WRITE;
/*!40000 ALTER TABLE `t_board_manager` DISABLE KEYS */;
INSERT INTO `t_board_manager` VALUES (1,1),(2,2),(3,1),(4,4),(5,3);
/*!40000 ALTER TABLE `t_board_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '',
  `login_datetime` datetime NOT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_log`
--

LOCK TABLES `t_login_log` WRITE;
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
INSERT INTO `t_login_log` VALUES (118,7,'0:0:0:0:0:0:0:1','2018-12-20 00:00:00'),(119,7,'0:0:0:0:0:0:0:1','2018-12-20 00:00:00'),(120,7,'0:0:0:0:0:0:0:1','2018-12-20 00:00:00'),(121,7,'127.0.0.1','2018-12-20 00:00:00'),(122,7,'127.0.0.1','2018-12-20 00:00:00'),(123,7,'127.0.0.1','2018-12-20 00:00:00'),(124,1,'127.0.0.1','2018-12-21 00:00:00'),(125,1,'127.0.0.1','2018-12-21 00:00:00'),(126,7,'127.0.0.1','2018-12-21 00:00:00'),(127,3,'127.0.0.1','2018-12-21 00:00:00'),(128,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(129,3,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(130,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(131,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(132,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(133,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(134,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(135,7,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(136,7,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(137,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(138,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(139,1,'127.0.0.1','2018-12-21 00:00:00'),(140,7,'127.0.0.1','2018-12-21 00:00:00'),(141,1,'127.0.0.1','2018-12-21 00:00:00'),(142,1,'0:0:0:0:0:0:0:1','2018-12-21 00:00:00'),(143,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(144,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(145,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(146,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(147,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(148,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(149,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(150,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(151,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(152,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(153,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(154,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(155,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(156,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(157,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(158,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(159,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(160,1,'192.168.123.210','2018-12-22 00:00:00'),(161,1,'192.168.123.17','2018-12-22 00:00:00'),(162,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(163,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(164,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(165,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(166,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(167,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(168,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(169,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(170,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(171,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(172,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(173,9,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(174,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(175,1,'0:0:0:0:0:0:0:1','2018-12-22 00:00:00'),(176,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(177,7,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(178,7,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(179,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(180,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(181,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(182,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(183,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(184,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(185,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(186,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(187,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(188,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(189,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(190,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(191,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(192,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(193,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(194,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(195,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(196,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(197,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(198,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(199,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(200,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(201,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(202,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(203,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(204,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(205,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(206,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(207,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(208,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(209,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(210,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(211,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(212,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(213,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(214,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(215,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(216,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(217,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(218,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(219,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(220,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(221,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(222,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(223,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(224,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(225,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(226,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(227,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(228,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(229,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(230,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(231,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(232,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(233,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(234,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(235,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(236,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(237,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(238,7,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(239,7,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(240,7,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(241,3,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(242,12,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(243,12,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(244,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(245,11,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(246,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(247,1,'192.168.123.171','2018-12-23 00:00:00'),(248,3,'192.168.123.172','2018-12-23 00:00:00'),(249,1,'0:0:0:0:0:0:0:1','2018-12-23 00:00:00'),(250,1,'192.168.123.172','2018-12-23 00:00:00'),(251,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(252,18,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(253,18,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(254,18,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(255,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(256,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(257,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(258,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(259,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(260,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(261,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(262,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(263,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(264,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(265,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(266,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(267,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(268,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(269,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(270,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(271,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(272,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(273,1,'0:0:0:0:0:0:0:1','2018-12-24 00:00:00'),(274,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(275,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(276,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(277,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(278,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(279,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(280,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(281,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(282,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(283,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(284,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(285,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(286,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(287,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(288,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(289,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(290,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(291,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(292,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(293,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(294,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(295,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(296,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(297,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(298,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(299,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(300,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(301,12,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(302,3,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(303,3,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(304,3,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(305,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(306,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(307,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(308,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(309,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(310,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(311,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(312,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(313,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(314,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(315,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(316,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(317,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(318,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(319,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(320,1,'0:0:0:0:0:0:0:1','2018-12-25 00:00:00'),(321,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(322,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(323,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(324,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(325,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(326,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(327,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(328,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(329,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(330,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(331,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(332,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(333,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(334,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(335,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(336,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(337,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(338,19,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(339,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(340,20,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(341,21,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(342,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(343,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(344,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(345,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(346,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(347,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(348,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(349,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(350,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(351,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(352,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(353,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(354,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(355,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(356,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(357,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(358,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(359,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(360,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(361,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(362,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(363,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(364,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(365,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(366,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(367,24,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(368,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(369,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(370,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(371,24,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(372,24,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(373,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(374,25,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(375,24,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(376,24,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(377,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(378,25,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(379,23,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00'),(380,1,'0:0:0:0:0:0:0:1','2018-12-26 00:00:00');
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_post`
--

DROP TABLE IF EXISTS `t_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL DEFAULT '0' COMMENT '论坛ID',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发表者ID',
  `post_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '帖子类型 1:主帖子 2:回复帖子',
  `post_title` varchar(50) NOT NULL DEFAULT '""' COMMENT '帖子标题',
  `post_text` text NOT NULL COMMENT '帖子内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`post_id`),
  KEY `IDX_POST_TOPIC_ID` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_post`
--

LOCK TABLES `t_post` WRITE;
/*!40000 ALTER TABLE `t_post` DISABLE KEYS */;
INSERT INTO `t_post` VALUES (2,1,2,1,1,'\"\"','123123123123','2018-12-14 00:00:00'),(3,1,1,2,1,'\"\"','<p>balabala<p/>','2018-12-01 00:00:00'),(30,1,1,1,0,'\"\"','<img src=\"http://localhost:8080/statics/images/face/54.gif\" alt=\"[good]\">','2018-12-14 00:00:00'),(34,1,9,1,1,'\"\"','你永远不知道下一颗什么味道<img src=\"http://localhost:8080/statics/images/face/29.gif\" alt=\"[拜拜]\">','2018-12-15 00:00:00'),(35,1,9,1,0,'\"\"','<img src=\"http://localhost:8080/statics/images/face/39.gif\" alt=\"[鼓掌]\">','2018-12-15 00:00:00'),(36,2,10,1,1,'\"\"','<img src=\"http://localhost:8080/statics/images/face/36.gif\" alt=\"[酷]\"><img src=\"http://localhost:8080/statics/images/face/25.gif\" alt=\"[抱抱]\"><b>aqwsdeawse</b><img src=\"http://localhost:8080/statics/images/face/41.gif\" alt=\"[悲伤]\">','2018-12-17 00:00:00'),(37,5,11,1,1,'\"\"','<img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\">','2018-12-17 00:00:00'),(39,1,2,1,0,'\"\"','<p><span>分页测试</span><img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\"></p>','2018-12-18 00:00:00'),(40,1,2,1,0,'\"\"','<p><span>分页测试</span><img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\"></p>','2018-12-18 00:00:00'),(41,1,2,1,0,'\"\"','<p><span>分页测试</span><img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\"></p>','2018-12-18 00:00:00'),(42,1,2,1,0,'\"\"','<p><span>分页测试</span><img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\"></p>','2018-12-26 10:21:40'),(43,1,2,1,0,'\"\"','<p><span>分页测试</span><img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\"></p>','2018-12-26 10:21:45'),(44,1,9,1,0,'\"\"','<img src=\"http://localhost:8080/statics/images/face/48.gif\" alt=\"[伤心]\">','2018-12-26 10:21:47'),(45,1,9,1,0,'\"\"','<img src=\"http://localhost:8080/statics/images/face/36.gif\" alt=\"[酷]\">','2018-12-18 00:00:00'),(46,1,2,1,0,'\"\"','spring<img src=\"http://localhost:8080/statics/images/face/48.gif\" alt=\"[伤心]\">','2018-12-18 00:00:00'),(47,1,2,1,0,'\"\"','水电费水电费<img src=\"http://localhost:8080/statics/images/face/0.gif\" alt=\"[微笑]\">','2018-12-18 00:00:00'),(48,1,12,1,1,'\"\"','<p><span style=\"text-align: left;\">\r\n                    </span><div class=\"action atl-reply\" style=\"text-align: right;\">\r\n                    	\r\n                    	 <span style=\"text-align: right;\"></span></div></p><div class=\"content\" style=\"text-align: justify;\"><b>高学历的人会很有钱，低学历的人也不会下岗</b></div>','2018-12-20 00:00:00'),(49,1,13,1,1,'\"\"','<p><span style=\"text-align: justify;\">“激进左派”，亦称“极左派”，以“反资反美”、激进革命、底层动员、刺激民粹为其核心观点标识，崛起于“民间”，靠激发和集聚底层民众的积怨积愤，裹挟底层民众的“乌合之力”，以期相争相抗于政学两界。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　“激进左派”的极端民族主义言论的肆意泛滥，在网络空间中更是无限放大传播，具有了极其强大的“激进宣示”和“战略宣示”功效。如果任其“无底线”泛滥，极有可能引起国内外各界的“战略误判”和“政策误读”。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　“激进左派”言论，存在严重的学理缺陷和“极化思维”，其理论推演中存在多重“逻辑缺陷”，其随意诋毁学术对手主张为“汉奸言论”，其肆意挤压自由、民主、法治等核心价值观，日渐成为中国学术界的“公害”。而这一切，是值得警惕和防范的“变异”趋向。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　“激进左派”，亦称“极左派”，是当代中国“左翼阵营”的“后起之秀”，以其政治立场的极端坚定、极化观点的暴烈鲜明而卓然于世。他们以某些“左翼网站”和地下边缘刊物为主要发声平台，以“反资反美”、激进革命、底层动员、刺激民粹为其核心观点标识，近年来的崛起大有“盖过”其新、老“左派”前辈的势头。但“激进左派”的话语体系及其政治主张中，存在着自身难以克服的“逻辑陷阱”，其急欲促发的学术舆论或社会运动，更具有难以估量的“公害”甚或社会危害。对此，值得政学两界给予理性关注和剖析警惕。</span><br style=\"text-align: justify;\"></p>','2018-12-20 00:00:00'),(51,3,14,1,1,'\"\"','<p><span style=\"text-align: left;\">\r\n                </span><div class=\"action atl-reply\" style=\"text-align: right;\">\r\n                    <span style=\"text-align: right;\">\r\n                        \r\n                        <a class=\"act-share\"></a></span></div></p><div class=\"text\" style=\"text-align: justify;\"><i>去年元月，川普上台，自从去年年底访华后，对华政策越来越硬，南海不断挑事，东南频打台湾牌，经济上又开打贸易战，老美选出这样一号人物，大家都来谈谈，究竟对我们是福是祸？<img src=\"http://localhost:8080/statics/images/face/28.gif\" alt=\"[馋嘴]\"><img src=\"http://localhost:8080/statics/images/face/25.gif\" alt=\"[抱抱]\">\r\n                </i></div>','2018-12-20 00:00:00'),(52,1,2,1,0,'\"\"','<p><span>图片格式在数据库中就是选IMAGE，存储及读取一般是用流的方式，我给你一段代码，分别是上传附件与下载附件的功能：</span><br><span>\n上传：</span><br><span>\n</span><br><span>\nvar</span><br><span>\nfs:TFileStream;</span><br><span>\nFtpStr:string;</span><br><span>\n</span><br><span>\nbegin</span><br><span>\n</span><br><span>\nFtpStr:=edt3.Text;//这里主要是用DlgOpen控件选择的文件名</span><br><span>\nfs:=Tfilestream.Create(FtpStr,……</span></p>','2018-11-23 00:00:00'),(54,1,2,1,0,'\"\"','<p><br><span>\n　　2.&nbsp;图像数据的读取及显示</span><br><span>\n</span><br><span>\nprocedure&nbsp;Tform1.ADOTable1AfterScroll(DataSet:&nbsp;TDataSet);&nbsp;//ADOTable1的AfterScroll事件方法程序</span><br><span>\n　var</span><br><span>\n　　jpegimage:tjpegimage;</span><br><span>\n　begin</span><br><span>\n　　image1.Picture.Graphic&nbsp;:=nil;&nbsp;</span><br><span>\n　　//下边BMP、JPEG两种图像数据必需分别处理</span><br><span>\n　　if&nbsp;adotable1.fieldbyname(isbmp).Asstring&nbsp;=&nbsp;1&nbsp;then&nbsp;//BMP型图像数据</span><br><span>\n　　　image1.Picture.bitmap.Assign(adotable1.fieldbyname(myimage))</span><br><span>\n　　　//上边语句中的bitmap不能为graphic,否则会出错</span><br><span>\n　　else&nbsp;if&nbsp;adotable1.fieldbyname(isbmp).asstring&nbsp;=&nbsp;0&nbsp;then&nbsp;//JPEG型图像数据</span><br><span>\n　　　begin&nbsp;//begin2</span><br><span>\n　　　　jpegimage&nbsp;:=&nbsp;tjpegimage.Create&nbsp;;&nbsp;//通过jpegimage将图像显示在image1,否则会出错</span><br><span>\n　　　　try</span><br><span>\n　　　　　jpegimage.Assign(adotable1.fieldbyname(myimage));</span><br><span>\n　　　　　image1.Picture.Graphic&nbsp;:=jpegimage;</span><br><span>\n　　　　finally</span><br><span>\n　　　　　jpegimage.Free&nbsp;;</span><br><span>\n　　　　end;&nbsp;//end&nbsp;try</span><br><span>\n　　end;&nbsp;//end&nbsp;begin2</span><br><span>\nend;&nbsp;</span></p>','2018-12-12 00:00:00'),(55,1,2,1,0,'\"\"','<p><br><span>\n　　2.&nbsp;图像数据的读取及显示</span><br><span>\n</span><br><span>\nprocedure&nbsp;Tform1.ADOTable1AfterScroll(DataSet:&nbsp;TDataSet);&nbsp;//ADOTable1的AfterScroll事件方法程序</span><br><span>\n　var</span><br><span>\n　　jpegimage:tjpegimage;</span><br><span>\n　begin</span><br><span>\n　　image1.Picture.Graphic&nbsp;:=nil;&nbsp;</span><br><span>\n　　//下边BMP、JPEG两种图像数据必需分别处理</span><br><span>\n　　if&nbsp;adotable1.fieldbyname(isbmp).Asstring&nbsp;=&nbsp;1&nbsp;then&nbsp;//BMP型图像数据</span><br><span>\n　　　image1.Picture.bitmap.Assign(adotable1.fieldbyname(myimage))</span><br><span>\n　　　//上边语句中的bitmap不能为graphic,否则会出错</span><br><span>\n　　else&nbsp;if&nbsp;adotable1.fieldbyname(isbmp).asstring&nbsp;=&nbsp;0&nbsp;then&nbsp;//JPEG型图像数据</span><br><span>\n　　　begin&nbsp;//begin2</span><br><span>\n　　　　jpegimage&nbsp;:=&nbsp;tjpegimage.Create&nbsp;;&nbsp;//通过jpegimage将图像显示在image1,否则会出错</span><br><span>\n　　　　try</span><br><span>\n　　　　　jpegimage.Assign(adotable1.fieldbyname(myimage));</span><br><span>\n　　　　　image1.Picture.Graphic&nbsp;:=jpegimage;</span><br><span>\n　　　　finally</span><br><span>\n　　　　　jpegimage.Free&nbsp;;</span><br><span>\n　　　　end;&nbsp;//end&nbsp;try</span><br><span>\n　　end;&nbsp;//end&nbsp;begin2</span><br><span>\nend;&nbsp;</span></p>','2018-12-13 00:00:00'),(56,3,14,1,0,'\"\"','不知道','2018-12-29 00:00:00'),(60,1,1,1,0,'\"\"','要得','2018-12-30 00:00:00'),(61,1,1,1,0,'\"\"','asdas','2018-12-30 14:21:40'),(62,4,1235,1,1,'\"\"','<p><span style=\"text-align: justify;\">　我叫龙飞，是个孤儿，从小跟我师父相依为命。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我一出生，身边就伴随诸多不详，自幼体弱多病，所以我几乎打小就是泡着“药罐子”长大的。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　后来我才知道，原来我在娘胎里就遭人暗算，本就不该出生在这世上，是我师父硬从我母亲的棺材里，把我救了出来。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　好不容易熬到了十八岁，我也终于考上了本市的一所重点大学，师父这才松了口气。说我命中的“第一劫”，总算是安然度过了。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　那时的我，尚还有些懵懂，自然不太明白，师父所谓的“第一劫”，到底对我意味着什么。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我只记得，在我生日的那一晚，师父非常的高兴，破例喝了很多的酒，以至最后酩酊大醉。直到我第二天起床，他的房间里，依然时不时传来打鼾的声音。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我并没有吵醒我师父，而是趁机偷了他的猎枪，一个人悄悄上山去了。&nbsp;</span></p>','2018-12-03 14:28:27'),(63,1,1236,1,1,'\"\"','<p><span style=\"text-align: justify;\">都知道现在是暑天正热的时候，今年的夏季与往年不同的是经常下雨，但是同样的也经常停电，每次的理由都是检修电路。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">\r\n　　实际是因为夏季用电量过大，城里不能停电，因为影响太大，而农村就不牵扯，热了可以给山里奔。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">\r\n　　可以在水里光着脚丫。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">\r\n　　夏季七八月停电都成了一种常态。隔一周几乎就会又一次，大家也都习惯了</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">\r\n　　这段时间没有太多的农活，就是日常的拔草，锄地，浇地，所以俺们村老少妇幼的生活也显得逍遥自在，因为八月后的季节就是丰收的季节</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">\r\n　　</span></p>','2018-12-19 14:29:20'),(64,1,1237,1,1,'\"\"','<p><span style=\"text-align: justify;\">　能维持房屋楼价保持平稳状态的等价交换之房屋险水池</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　顾名思义，如果各位有看我本人在这两天的发帖名叫:等价交换的股票险水池。不难发现，本文的等价交换之房屋险水池，也是同一意思。有点智慧的人也会知道是啥意思玩意。如果你们需要我写出本文的内容，那我乐意写，相信有点文化知识的人也知道我写什么。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　当楼价下跌时，根据浮动慰问金，不至于亏本，能保值。同等，在等价交换的原则基础上，当楼价上升时，房屋险水池根据安稳金，买卖时，业主的等价交换，收取一定的楼升费用，能有效抑制楼价飙升至一个不合理的程度。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　例如，当楼价下跌时，100万的房价下跌到80万，保底+浮动慰问金。当楼价上升时，100万的房价上升到120万元时，获利时从利润20万中收取一部分的水池安稳金。&nbsp;</span></p>','2018-12-03 14:29:49'),(65,1,1238,1,1,'\"\"','<p><span style=\"text-align: justify;\">這陣子又消失一段蠻長的時間，因為我收拾了簡單的行囊，跑到了</span><span class=\"highlight\" linkurl=\"http://page.tianya.cn/tyk000005441\" style=\"text-align: justify;\">台北</span><span style=\"text-align: justify;\">市，新的開始有點忙有點特別，然後非常熱~~~~</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我從一個喜歡發表政治評論觀察社會的網路嘴砲者，到真正走入現實面對紛紛擾擾的政治和抗爭，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　雖然我還在很邊緣很邊緣的地方，但已然能感受到這條路有多麼複雜不易。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　前幾天終於二度跟新黨青年軍之一女將蘇恆會面(她的立場是兩次啦，不過我見過她本人三次了XD)</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我們相談甚歡。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　她邀請我進入她的團隊，成為她的助理，這對我目前的狀態是一個大突破，雖然我很開心，但我在以核養綠公投小組還有一些計劃和承諾沒有完成。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　所以我預計會在八月底新黨黨慶之前加入新黨 ，並且加入蘇恆的團隊，成為她的戰力，她的夥伴，她的助選員。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　蘇恆所在的</span><span class=\"highlight\" linkurl=\"http://page.tianya.cn/tyk000183604\" style=\"text-align: justify;\">中山</span><span class=\"highlight\" linkurl=\"http://page.tianya.cn/tyk000005317\" style=\"text-align: justify;\">大同</span><span style=\"text-align: justify;\">區是北市最綠最本土的一塊，年底選戰可能勝算極低而且非常艱辛，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　不過對一個這幾年反對公投門檻調低、覺得民主政治是個屁的人而言，我回到一個我所鄙視的制度去作戰，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我不贊成這個制度，但我仍然要回到這個制度去解決問題。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　這聽起來雖然很矛盾，但如同我前一篇文章所言，在現在的台灣，如果沒有發言權，就沒有人聽見你的理念，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　台灣人永遠只聽見綠色的聲音和立場，卻沒有足夠的對立的音量，去讓島民檢視國民兩黨所灌輸的概念，去用全方位的視野進行思辨。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我想我要做的事情很多，心得也很多，日後一一跟大家分享。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我現在想說的是，在我踏上這段路途，起腳的第一步，我非常堅持要使用南南兒這個名字， </span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　堅持到我在填寫“恆毅力”申請單的時候， 因為沒有填寫本名，應該直接被蘇恆團隊放棄。。。XP</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　不過還好我沒有錯過她，我們最終沒有錯過彼此。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　堅持使用南南兒，是因為我知道我身上背負了很多這四年以來支持我喜歡我的大陸朋友的期待，也明白如果沒有涯友們的支持鼓舞幫助，這條路我一定走不下去。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　不管你相不相信，從以前到日後，每一個對我友善的留言，就算只是一個頂帖，都會成為我前進的動力。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　所以今天我在這裡，在這個南南兒的起點，尋求各位版友的支持，我會代表台版走出去，走入台灣統派的生活裡，正式走在促進兩岸統一的征途上，你們是我的支柱，更是我的戰友，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　這些年以來，好多好多大陸網友告訴我，我不孤單，</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　我無時或忘，銘記在心。</span><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　現在我會帶著這些溫馨的話語，開啟我的戰鬥，就從幫助蘇恆開始。</span><br style=\"text-align: justify;\"><br style=\"text-align: justify;\"><span style=\"text-align: justify;\">　　請關注蘇恆→微博搜尋蘇恆-台灣， 臉書搜尋蘇恆，蘇恆的四色牌。</span><br style=\"text-align: justify;\"></p>','2018-12-03 14:30:08'),(66,1,1,7,0,'\"\"','<b>ni<i>haoi1cfa</i></b>','2018-12-20 06:58:15'),(68,3,1239,7,1,'\"\"','南昌大学的位置是 江西省南昌市','2018-12-20 07:18:54'),(69,3,1239,7,0,'\"\"','lalal','2018-12-20 07:19:16'),(70,1,1239,7,1,'\"\"','测试1下','2018-12-20 11:08:38'),(71,1,1239,7,1,'\"\"','test11111111111111111111<img src=\"http://localhost:8088/statics/images/face/36.gif\" alt=\"[酷]\"><img src=\"http://localhost:8088/statics/images/face/63.gif\" alt=\"[给力]\">','2018-12-20 11:37:14'),(72,1,1240,7,1,'\"\"','test11111111111111111111','2018-12-20 11:37:25'),(73,1,1236,7,0,'\"\"','489','2018-12-20 14:03:19'),(74,1,1241,7,1,'\"\"','测试内容','2018-12-21 07:30:54'),(75,1,1241,1,0,'\"\"','你的帖子很棒','2018-12-22 03:54:43'),(76,1,9,1,0,'\"\"','你好','2018-12-22 03:55:47'),(77,1,2,1,0,'\"\"','二百瓦级的开放柜卡了后i能发出得瑟啥剪短发了吗','2018-12-22 07:43:58'),(78,1,1242,1,1,'\"\"','<p><i>斜体测试斜体测试斜体测试斜体测试斜体测试</i></p>','2018-12-22 08:35:26'),(79,1,1243,1,1,'\"\"','这里有一个表情<img src=\"http://localhost:8089/statics/images/face/0.gif\" alt=\"[微笑]\">','2018-12-22 09:00:28'),(80,1,1244,1,1,'\"\"','123123<img src=\"/userPic/c423e5b630014e279bbe7fd9e585fede.jpg\" alt=\"This is the name\">','2018-12-22 12:21:26'),(81,1,1245,1,1,'\"\"','图片测试2<img src=\"/userPic/683c902a066b4cd08a9bbb20ac75eeab.jpg\" alt=\"This is the name\">','2018-12-22 12:22:24'),(82,1,1246,1,1,'\"\"','图片测试3<img src=\"/userPic/a6c08b2c907e4982ba0ee19df482ab29.jpg\" alt=\"picName\"><img src=\"/userPic/57aff1818f8e4d9f901032ec033d24df.jpg\" alt=\"picName\">','2018-12-22 12:31:41'),(83,1,1247,1,1,'\"\"','图片测试4<img src=\"/userPic/3e18772577284bcc9b641234b7045197.jpg\" alt=\"picName\">','2018-12-22 12:36:37'),(84,1,1248,1,1,'\"\"','<img src=\"/userPic/796214110c4a47bdab16db999b3491ff.jpg\" alt=\"picName\">','2018-12-22 13:15:07'),(85,1,1249,1,1,'\"\"','<p>测试图片六</p><p><img src=\"/userPic/a97df9e9ab6942ccbbba06626b6ca1de.jpg\" alt=\"picName\"><br></p><p><img src=\"http://localhost:8089/statics/images/face/1.gif\" alt=\"[嘻嘻]\"><br></p>','2018-12-22 14:05:45'),(86,1,1249,1,0,'\"\"','lalalala','2018-12-22 15:44:01'),(87,1,1249,1,0,'\"\"','<p>又是一个回复+图片</p><p><img src=\"/userPic/197ac57346aa4e7182c9a477bd766c76.jpg\" alt=\"picName\"><br></p>','2018-12-22 15:50:10'),(88,1,1250,7,1,'\"\"','<p>测试头像的帖子<img src=\"/userPic/8d851088d62e4861b5066478344d6d66.png\" alt=\"picName\"></p>','2018-12-23 03:39:21'),(89,1,1251,3,1,'\"\"','5555645645645634561345614561456135563','2018-12-23 03:40:22'),(94,1,1251,3,0,'\"\"','lalala','2018-12-23 04:39:12'),(98,1,1252,3,0,'\"\"','<pre>        <span>&lt;span </span><span>class=</span><span>\"layui-breadcrumb\" </span><span>lay-separator=</span><span>\"/\"</span><span>&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/\"</span><span>&gt;</span><span>全部</span><span>&lt;/a&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/board/1\"</span><span>&gt;</span><span>生活</span><span>&lt;/a&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/board/2\"</span><span>&gt;</span><span>情感</span><span>&lt;/a&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/board/3\"</span><span>&gt;</span><span>大学</span><span>&lt;/a&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/board/4\"</span><span>&gt;</span><span>旅游</span><span>&lt;/a&gt;<br></span><span>  &lt;a </span><span>href=</span><span>\"/board/5\"</span><span>&gt;</span><span>美食</span><span>&lt;/a&gt;<br></span><span><br></span><span>&lt;/span&gt;</span></pre>','2018-12-23 11:11:29'),(99,1,1253,3,1,'\"\"','地方v那我是v国内外i让旅馆访问率股票破那边覅欧班农岸边po不回家譬如海波i阿尔巴黄牛票jnp\'pfzhbvuiafdgb热火波i和怕打扰45555555555555555555555555555555555555555','2018-12-23 12:24:24'),(100,1,1254,3,1,'\"\"','安抚参加哦阿文吃饭就是','2018-12-23 12:24:53'),(101,1,1254,3,0,'\"\"','听所已经陈工了','2018-12-23 12:25:05'),(102,1,1255,11,1,'\"\"','picture<img src=\"/userPic/48b4f96e732f403caf1f30a44a3c7e9c.jpg\" alt=\"picName\">','2018-12-23 16:37:19'),(103,1,1256,11,1,'\"\"','<img src=\"/userPic/2fb616b15cf54fba815d052ae64cf45a.jpg\" alt=\"picName\">','2018-12-23 16:39:16'),(104,1,1256,1,0,'\"\"','我也发一张图片试试<img src=\"/userPic/6ec133c9e5424049b0ecad837bc472bd.jpg\" alt=\"picName\">','2018-12-23 16:40:00'),(105,3,1257,1,1,'\"\"','根号三','2018-12-23 16:52:29'),(106,1,1258,3,1,'\"\"','我是超级用户<img src=\"/userPic/ee601c6b55614865b59b1d7f2913e8c2.jpg\" alt=\"picName\">','2018-12-23 16:53:16'),(107,1,1260,12,1,'\"\"','iu规划不够吧iu关闭u鬼鬼iu贵贵贵古人谢霆锋热衷我热爱鱼鱼1.哦iuiGIFts了聚魄加缪古巴1u哟普通员工','2018-12-25 05:10:40'),(108,1,1264,12,1,'\"\"','测试运行的步骤','2018-12-25 05:35:59'),(109,99,1267,12,1,'\"\"','这是一个严肃的问答测试码·？？？1234456778890-','2018-12-25 05:51:53'),(110,99,1267,12,0,'\"\"','啦啦啦','2018-12-25 05:53:14'),(111,99,1268,12,1,'\"\"','111111111111111111111111111111111111111111111112222222222222222222222222','2018-12-25 05:54:16'),(112,99,1269,1,1,'\"\"','悬赏测试','2018-12-25 07:06:18'),(113,2,1270,1,1,'\"\"','2222222<img src=\"/userPic/307238ba275a4a3191f79f52f0ba29bd.jpg\" alt=\"picName\">','2018-12-25 08:06:36'),(114,2,1270,1,0,'\"\"','你好<img src=\"http://localhost:8080/statics/images/face/1.gif\" alt=\"[鍢诲樆]\">的乡村风格和健康咯','2018-12-25 08:07:30'),(115,99,1271,1,1,'\"\"','问答222','2018-12-25 08:32:08'),(116,3,1272,23,1,'\"\"','<p><span>本网讯（学生记者温雅雯、陈晓凤）本硕香樟“树”，十年华章书。12月21日至23日，高等研究院举行本硕实验班创办十周年庆典暨本硕实验班毕业生首届香樟论坛。历届毕业生与在校师生齐聚前湖，齐祝十周年华诞。<img src=\"http://localhost:8080/statics/images/face/54.gif\" alt=\"[good]\"></span></p>','2018-12-26 06:06:00'),(117,3,1273,23,1,'\"\"','<p><span>12月21日上午，校党委理论学习中心组在办公楼一楼报告厅召开扩大会议，专题学习新时代民族宗教理论与政策，会议特邀中央社会主义学院马列教研部副主任、民族与宗教教研室主任沈桂萍教授做学习辅导报告，校党委常委、统战部部长滕勇前主持会议。</span></p><p><span><br></span></p><p><span><img src=\"/userPic/1b55f45c667e47949c83d98cf99142c2.jpg\" alt=\"picName\"><br></span></p>','2018-12-26 06:07:17'),(118,3,1274,23,1,'\"\"','<p><span style=\"text-align: justify;\">12月20日上午，南昌大学第二届实验技术与设备管理高峰论坛在音乐厅二楼报告厅举行。校长周创兵、江西发展研究院院长黄细嘉与国内相关领域专家学者出席开幕式。</span></p><p><span style=\"text-align: justify;\"><img src=\"/userPic/457db9aa35674ef081509a9ddb76aa41.jpg\" alt=\"picName\"><br></span></p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">大家快来支持！</p>','2018-12-26 06:09:34'),(119,3,1274,23,0,'\"\"','大家快来参与讨论！<img src=\"http://localhost:8080/statics/images/face/1.gif\" alt=\"[鍢诲樆]\">','2018-12-26 06:10:45'),(120,1,1275,24,1,'\"\"','<p>新华社北京12月25日电(记者史竞男)中国新闻出版研究院25日发布“2017年中国版权产业的经济贡献”调研结果。数据显示，2017年中国版权产业的行业增加值已达60810.92亿元，占全国GDP比重为7.35%；其中，核心版权产业行业增加值为38155.90亿元，占全国GDP比重4.61%，比上年提高0.03个百分点。</p><p>　　国家版权局有关负责人表示，党的十八大以来，党中央、国务院高度重视包括版权在内的知识产权工作，深入实施知识产权战略。全国版权行业通过坚持体制机制创新，不断健全版权监管体系，开展“剑网行动”等专项治理，深入推进版权宣传培训和版权示范创建工作，培育版权交易服务平台，版权保护力度不断加强，版权社会服务水平明显提升，社会公众的版权意识得到显著提高，版权产业健康发展。</p><p><br></p>','2018-12-26 07:25:51'),(121,1,1275,24,0,'\"\"','一楼！<img src=\"http://localhost:8080/statics/images/face/36.gif\" alt=\"[閰穄\">','2018-12-26 07:28:21'),(122,3,1274,24,0,'\"\"','<p>祝贺祝贺！</p><p><br></p>','2018-12-26 07:29:06'),(123,1,1276,1,1,'\"\"','<p>时值隆冬，北方气温低至零下，太原钢铁集团车间里却热火朝天。</p><p>　　被誉为“黑金”的碳纤维，在国内供不应求；“论克卖”的“手撕钢”，海外客户订单不断。“太钢”品牌，正成为“高质量”的代名词。</p><p>　　同“太钢”一样，越来越多中国品牌让世界刮目相看。</p><p>　　不久前，权威机构发布的“全球最具价值品牌”报告显示，2018年，有66家中国企业进入全球品牌500强，其中22家进入100强，中国上榜品牌总价值占比15%，位居第二。</p>','2018-12-26 07:37:10'),(124,2,1277,1,1,'\"\"','对于...,你怎么看？','2018-12-26 07:38:44'),(125,2,1278,25,1,'\"\"','<p>今天天气很好啊！</p><p><img src=\"/userPic/60a86ee189de4919a9dbbdb38338225a.jpg\" alt=\"picName\"><br></p><p><br></p>','2018-12-26 07:42:05'),(126,4,1279,23,1,'\"\"','<p>哈哈！</p><p><img src=\"/userPic/a39c6213c5cf413ea7cb522e60a68f8b.jpg\" alt=\"picName\"><br></p>','2018-12-26 07:44:13');
/*!40000 ALTER TABLE `t_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_top`
--

DROP TABLE IF EXISTS `t_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_top` (
  `topic_id` int(11) NOT NULL COMMENT '置顶帖子的id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_top`
--

LOCK TABLES `t_top` WRITE;
/*!40000 ALTER TABLE `t_top` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_topic`
--

DROP TABLE IF EXISTS `t_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `board_id` int(11) NOT NULL COMMENT '所属论坛',
  `topic_title` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发表用户',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `last_post` datetime NOT NULL DEFAULT '1990-01-01 00:00:00' COMMENT '最后回复时间',
  `topic_views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览数',
  `topic_replies` int(11) NOT NULL DEFAULT '0' COMMENT '回复数',
  `digest` int(11) NOT NULL DEFAULT '0' COMMENT '0:不是精华话题 1:是精华话题',
  `istop` int(11) NOT NULL DEFAULT '0',
  `isneed` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `IDX_TOPIC_USER_ID` (`user_id`),
  KEY `IDX_TOPIC_TITLE` (`topic_title`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8 COMMENT='话题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_topic`
--

LOCK TABLES `t_topic` WRITE;
/*!40000 ALTER TABLE `t_topic` DISABLE KEYS */;
INSERT INTO `t_topic` VALUES (2,1,'加密货币暴跌：华尔街大行悄然搁置比特币淘',1,'2018-12-01 00:00:00','2018-12-22 07:43:58',1001,11,0,1,0,0),(1272,3,'高等研究院举办本硕实验班创办十周年庆典',23,'2018-12-26 06:06:00','2018-12-26 06:06:00',2,1,0,0,0,0),(1273,3,'党委理论学习中心组专题学习新时代民族宗教理论与政策',23,'2018-12-26 06:07:17','2018-12-26 06:07:17',2,1,0,0,0,0),(1274,3,'我校举办“第二届实验技术与设备管理”高峰论坛',23,'2018-12-26 06:09:34','2018-12-26 07:29:06',12,3,0,0,0,0),(1275,1,'中国版权产业增加值突破6万亿元',24,'2018-12-26 07:25:51','2018-12-26 07:28:21',5,2,0,0,0,0),(1276,1,'携手推进品牌强国建设',1,'2018-12-26 07:37:10','2018-12-26 07:37:10',2,1,0,0,0,0),(1277,2,'你怎么看？',1,'2018-12-26 07:38:44','2018-12-26 07:38:44',2,1,0,0,0,0),(1278,2,'发个测试贴',25,'2018-12-26 07:42:05','2018-12-26 07:42:05',3,1,0,0,0,0),(1279,4,'今天天气很好！',23,'2018-12-26 07:44:13','2018-12-26 07:44:13',3,1,1,1,0,0);
/*!40000 ALTER TABLE `t_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:普通用户 2:管理员',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未锁定 1:锁定',
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `last_visit` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '最后登陆IP',
  PRIMARY KEY (`user_id`),
  KEY `AK_AK_USER_USER_NAME` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','admin',2,0,1530,'2018-12-26 07:44:52','0:0:0:0:0:0:0:1'),(23,'tom','tom',1,0,120,'2018-12-26 07:42:22','0:0:0:0:0:0:0:1'),(24,'jerry','jerry',1,0,90,'2018-12-26 07:20:56','0:0:0:0:0:0:0:1'),(25,'john','john',1,0,65,'2018-12-26 07:39:12','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `adddetail` AFTER INSERT ON `t_user` FOR EACH ROW begin
    insert into t_user_detailed(user_id) values (new.user_id);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deletedetail` AFTER DELETE ON `t_user` FOR EACH ROW begin
    delete from  t_user_detailed where user_id= (old.user_id);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `t_user_detailed`
--

DROP TABLE IF EXISTS `t_user_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user_detailed` (
  `user_id` int(11) NOT NULL COMMENT 'id',
  `image_path` varchar(45) DEFAULT NULL,
  `e_mail` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `user_signature` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `sign_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_detailed`
--

LOCK TABLES `t_user_detailed` WRITE;
/*!40000 ALTER TABLE `t_user_detailed` DISABLE KEYS */;
INSERT INTO `t_user_detailed` VALUES (1,'/userPic/e216c98294e5438fa1082ad162af120a.jpg','admin@admin.com','15151515111','今天是星期几','女','2018-12-20 00:00:00'),(23,'/userPic/df96bc04ae9c46dab7b692445f1383bb.jpg','tom@tom.com','12345678911','I am Tom','男',NULL),(24,'/userPic/fed457784ed74846aa6b02ca7613d0cf.jpg','jerry@jerry.com','15182974512','Hi, I\'m jerry !','男',NULL),(25,'/userPic/b9c9515560614a8b8738b36c2fb7e951.jpg','john@john.com','12312312312','I\' m John','男',NULL);
/*!40000 ALTER TABLE `t_user_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'my_forum'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-26 15:47:07
