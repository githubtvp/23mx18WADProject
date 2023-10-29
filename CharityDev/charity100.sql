CREATE DATABASE  IF NOT EXISTS `charity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `charity`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: charity
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `booked`
--

DROP TABLE IF EXISTS `booked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked` (
  `BOOKING_ID` int NOT NULL,
  `DATE_BOOKED` datetime NOT NULL,
  `REMARKS` mediumtext,
  `CHARITY_ID` int DEFAULT NULL,
  `ITEM_POSTED_ID` int DEFAULT NULL,
  PRIMARY KEY (`BOOKING_ID`),
  UNIQUE KEY `BOOKING_ID_UNIQUE` (`BOOKING_ID`),
  KEY `FK_BOOKED_CHARITY_ID_idx` (`CHARITY_ID`),
  KEY `FK_ITEMPOSTED_ID_BOOKED_idx` (`ITEM_POSTED_ID`),
  CONSTRAINT `FK_ITEMPOSTED_ID_BOOKED` FOREIGN KEY (`ITEM_POSTED_ID`) REFERENCES `item_posted` (`ITEM_POSTED_ID`),
  CONSTRAINT `FK_USER_ID_BOOKED` FOREIGN KEY (`CHARITY_ID`) REFERENCES `user` (`CHARITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booked`
--

LOCK TABLES `booked` WRITE;
/*!40000 ALTER TABLE `booked` DISABLE KEYS */;
/*!40000 ALTER TABLE `booked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FEEDBACK_ID` int NOT NULL,
  `TYPE_OF_FEEDBACK` varchar(45) NOT NULL,
  `FEEDBACK_TEXT` longtext,
  `SUBMITTED_DATE` datetime DEFAULT NULL,
  `CHARITY_ID` int DEFAULT NULL,
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_USER_ID_FEEDBACK_idx` (`CHARITY_ID`),
  CONSTRAINT `FK_USER_ID_FEEDBACK` FOREIGN KEY (`CHARITY_ID`) REFERENCES `user` (`CHARITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_category` (
  `ITEM_CATEGORY_ID` int NOT NULL,
  `CATEGORY_NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`ITEM_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` VALUES (1,'Furniture'),(2,'Books'),(3,'HouseHold'),(4,'Electronics'),(5,'Auto'),(6,'Computers');
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_need`
--

DROP TABLE IF EXISTS `item_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_need` (
  `ITEM_NEED_ID` int NOT NULL,
  `ITEM_PIC` varchar(200) DEFAULT NULL,
  `REMARKS` mediumtext,
  `ITEM_CATEGORY_ID` int DEFAULT NULL,
  PRIMARY KEY (`ITEM_NEED_ID`),
  KEY `FK_ITEMCATEGORY_ID_ITEMNEED_idx` (`ITEM_CATEGORY_ID`),
  CONSTRAINT `FK_ITEMCATEGORY_ID_ITEMNEED` FOREIGN KEY (`ITEM_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_need`
--

LOCK TABLES `item_need` WRITE;
/*!40000 ALTER TABLE `item_need` DISABLE KEYS */;
INSERT INTO `item_need` VALUES (1,NULL,NULL,3);
/*!40000 ALTER TABLE `item_need` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_posted`
--

DROP TABLE IF EXISTS `item_posted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_posted` (
  `ITEM_POSTED_ID` int NOT NULL,
  `PICTURE` varchar(200) DEFAULT NULL,
  `CONDITION` mediumtext NOT NULL,
  `YEARS_OF_USE` int DEFAULT NULL,
  `DATE_POSTED` datetime DEFAULT NULL,
  `POST_STATUS_ID` int DEFAULT NULL,
  `REMARKS` mediumtext,
  `CHARITY_ID` int DEFAULT NULL,
  `ITEM_CATEGORY_ID` int DEFAULT NULL,
  PRIMARY KEY (`ITEM_POSTED_ID`),
  UNIQUE KEY `ITEM_POSTED_ID_UNIQUE` (`ITEM_POSTED_ID`),
  KEY `FK_POSTSTATUS_ID_ITEMPOSTED_idx` (`POST_STATUS_ID`),
  KEY `FK_USER_ID_ITEMPOSTED_idx` (`CHARITY_ID`),
  KEY `FK_ITEMCATEGORY_ID_ITEMPOSTED_idx` (`ITEM_CATEGORY_ID`),
  CONSTRAINT `FK_ITEMCATEGORY_ID_ITEMPOSTED` FOREIGN KEY (`ITEM_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`),
  CONSTRAINT `FK_POSTSTATUS_ID_ITEMPOSTED` FOREIGN KEY (`POST_STATUS_ID`) REFERENCES `post_status` (`POST_STATUS_ID`),
  CONSTRAINT `FK_USER_ID_ITEMPOSTED` FOREIGN KEY (`CHARITY_ID`) REFERENCES `user` (`CHARITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_posted`
--

LOCK TABLES `item_posted` WRITE;
/*!40000 ALTER TABLE `item_posted` DISABLE KEYS */;
INSERT INTO `item_posted` VALUES (1,NULL,'Good',1,'2023-10-28 00:00:00',1,'Item posted for donation',1,2);
/*!40000 ALTER TABLE `item_posted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `LOGIN_ID` int NOT NULL,
  `USER_ID` varchar(45) NOT NULL,
  `USER_PWD` varchar(45) NOT NULL,
  `STATUS` varchar(8) NOT NULL DEFAULT 'Active',
  `CHARITY_ID` int DEFAULT NULL,
  PRIMARY KEY (`LOGIN_ID`),
  KEY `FK_USER_ID_LOGIN_idx` (`CHARITY_ID`),
  CONSTRAINT `FK_USER_ID_LOGIN` FOREIGN KEY (`CHARITY_ID`) REFERENCES `user` (`CHARITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'tvp','tvp','active',NULL),(2,'aparna','aparna','active',NULL),(3,'nivetha','nivetha','active',NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_status`
--

DROP TABLE IF EXISTS `post_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_status` (
  `POST_STATUS_ID` int NOT NULL,
  `STATUS_TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`POST_STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_status`
--

LOCK TABLES `post_status` WRITE;
/*!40000 ALTER TABLE `post_status` DISABLE KEYS */;
INSERT INTO `post_status` VALUES (1,'Active'),(2,'Booked'),(3,'Removed');
/*!40000 ALTER TABLE `post_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `CHARITY_ID` int NOT NULL,
  `FNAME` varchar(60) NOT NULL,
  `LNAME` varchar(60) NOT NULL,
  `TELENO` varchar(10) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `AGE` int DEFAULT NULL,
  `EMAILID` varchar(60) DEFAULT NULL,
  `CONTACTADD` varchar(200) DEFAULT NULL,
  `DATEJOINED` datetime NOT NULL,
  `DATEREMOVED` datetime DEFAULT NULL,
  `REMARKS` mediumtext,
  `USER_TYPE` int DEFAULT NULL,
  PRIMARY KEY (`CHARITY_ID`),
  UNIQUE KEY `CHARITY_ID_UNIQUE` (`CHARITY_ID`),
  KEY `FK_USERTYPE_USER_idx` (`USER_TYPE`),
  CONSTRAINT `FK_USERTYPE_ID__USER` FOREIGN KEY (`USER_TYPE`) REFERENCES `user_type` (`USER_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'varadharaj','perumal','8888888','m',62,'tvp1640@gmail.com','Contact Add 1','2023-10-28 00:00:00',NULL,'New User created',1),(2,'aparna','ranganathan','7777777','f',22,'aparna@gmail.com','Contact Add 1','2023-10-28 00:00:00',NULL,'New User created',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `USER_TYPE_ID` int NOT NULL,
  `TYPE_OF_USER` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Administrator'),(2,'CharityUser'),(3,'GuestUser');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29  9:56:27
