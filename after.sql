-- MySQL dump 10.13  Distrib 5.5.50, for Linux (x86_64)
--
-- Host: localhost    Database: mgaosxu_db
-- ------------------------------------------------------
-- Server version	5.5.50-log

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
-- Table structure for table `blogPost`
--

DROP TABLE IF EXISTS `blogPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogPost` (
  `blogID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `numoflikes` int(11) NOT NULL DEFAULT '0',
  `datePosted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`blogID`),
  KEY `userID` (`userID`),
  CONSTRAINT `blogPost_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`nm`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogPost`
--

LOCK TABLES `blogPost` WRITE;
/*!40000 ALTER TABLE `blogPost` DISABLE KEYS */;
INSERT INTO `blogPost` VALUES (21,1,'Spaghetti Sauce with Ground Beef',7,'2017-04-29 23:50:17',30,30),(22,1,'sushi combo',5,'2017-04-29 23:36:27',30,30),(23,1,'Cheese frittata',1,'2017-04-30 01:10:17',30,30),(24,1,'Grilled Chicken',9,'2017-04-30 04:17:18',30,30),(25,1,'Caramel Popcorn',4,'2017-04-29 23:36:22',30,30),(37,1,'Spring Cupcake',0,'2017-04-30 00:06:01',30,30);
/*!40000 ALTER TABLE `blogPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `blogID` int(11) NOT NULL,
  `userID` integer NOT NULL,
  `commentContent` text,
  `numoflikes` int(11) DEFAULT '0',
  `datePosted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentID`),
  KEY `blogID` (`blogID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `blogPost` (`blogID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`nm`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,21,1,'Great Post!!!',0,'2017-04-30 01:14:12'),(3,21,1,'I love it!!!',0,'2017-04-30 01:14:12');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cookingEvent`
--

DROP TABLE IF EXISTS `cookingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cookingEvent` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `eventDate` date DEFAULT NULL,
  `venue` varchar(20) DEFAULT NULL,
  `eventIntro` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookingEvent`
--

LOCK TABLES `cookingEvent` WRITE;
/*!40000 ALTER TABLE `cookingEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cookingEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventsignup`
--

DROP TABLE IF EXISTS `eventsignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsignup` (
  `eventID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`eventID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `eventsignup_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`nm`),
  CONSTRAINT `eventsignup_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `cookingEvent` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventsignup`
--

LOCK TABLES `eventsignup` WRITE;
/*!40000 ALTER TABLE `eventsignup` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventsignup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `blogID` int(10) NOT NULL,
  `fileNum` int(2) NOT NULL,
  `extension` enum('.jpg','.pdf','.txt','.png','.jpeg') DEFAULT NULL,
  PRIMARY KEY (`blogID`,`fileNum`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `blogPost` (`blogID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (21,1,'.txt'),(22,1,'.jpg'),(23,1,'.jpeg'),(24,1,'.txt'),(25,1,'.txt'),(37,1,'.jpg'),(37,2,'.jpg');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `user` int(11) NOT NULL DEFAULT '0',
  `following` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user`,`following`),
  KEY `following` (`following`),
  CONSTRAINT `following_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`nm`),
  CONSTRAINT `following_ibfk_2` FOREIGN KEY (`following`) REFERENCES `user` (`nm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagContent` varchar(20) NOT NULL,
  `blogID` int(11) NOT NULL,
  PRIMARY KEY (`tagID`),
  KEY `blogID` (`blogID`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `blogPost` (`blogID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `nm` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `shortintro` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nm`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Wendy Wellesley','wwellesley','potato','hello there'),(2,'Janice Tuesday','jtuesday','tomato','hello'),(3,'Tester Admin','tadmin','test','this is a testing account, carry on citizen'),(4,'Michelle Gao','mgao','hello','I am one of the admins'),(5,'Spring Allergies','Spring','Allergies','I\'m your worst nightmare'),(6,'Ruby Tuesday','rtuesday','frenchfries','I\'m Janice\'s sister. ;)'),(8,'Marlene Wednesday','mwednesday','juice','I\'m not related to the Tuesdays. '),(9,'Spring Cold','scold','cough','I heard my friend allergies was here so I came along for the ride. '),(10,'Granny Greenleaf','ggreenleaf','woods','Do not insult my cooking, dears. I have been known to cast a hex or two.'),(13,'Test test','test','test','test'),(14,'Another test','what','nope','hahahaha'),(15,'Michelle','help','me','now'),(16,'shiping','shiping2017','dive4fun','YEAHHHHHH');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-01 14:17:15
