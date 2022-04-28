
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
-- Table structure for table `admins`
--
DROP DATABASE IF EXISTS `bankingSystemDb`;
CREATE DATABASE `bankingSystemDb`;
USE bankingSystemDb;
DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bankCode` varchar(11) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `bankCode` (`bankCode`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`bankCode`) REFERENCES `banks` (`bankCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Karan Seth','SBIB');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `accNo` int NOT NULL,
  `customer` int NOT NULL,
  `branch` varchar(11) NOT NULL,
  `type` enum('savings','current') NOT NULL,
  `accBalance` int DEFAULT '0',
  PRIMARY KEY (`accNo`),
  KEY `branch` (`branch`),
  KEY `customer` (`customer`),
  CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branches` (`branchCode`),
  CONSTRAINT `bank_accounts_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customers` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES (34001,1,'SBIB0000101','savings',500),(34002,2,'SBIB0000102','savings',500),(34003,3,'SBIB0000103','savings',1000),(34005,3,'SBIB0000101','current',2000);
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bankCode` varchar(11) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `mainOfficeAddress` longtext NOT NULL,
  PRIMARY KEY (`bankCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES ('SBIB','State Bank Of India','Madame Cama Road, Mumbai,Maharashtra,India,400021');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branchCode` varchar(11) NOT NULL,
  `address` longtext NOT NULL,
  `manager` varchar(100) NOT NULL,
  `bankCode` varchar(11) DEFAULT NULL,
  `isHeadOffice` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`branchCode`),
  KEY `bankCode` (`bankCode`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`bankCode`) REFERENCES `banks` (`bankCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('SBIB0000101','Rohini, Delhi, New Delhi, India, 110085','Shivam Khanna','SBIB',0)
,('SBIB0000102','Madame Cama Road, Mumbai,Maharashtra,India,400021','Rohan Bhatnagar','SBIB',1),
('SBIB0000103','Yerwada, Pune, Maharashtra, India, 411006','Sakshi Mangal','SBIB',0);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Sagar Chaurasia','Rohini, Delhi, New Delhi, India, 110085')
,(2,'Roger Lal','Hinjewadi, Pune, Maharashtra, India, 4110010'),
(3,'Aman Sharma','Viman Nagar, Mumbai, Maharashtra, India, 411013');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `empId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `branchCode` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`empId`),
  KEY `branchCode` (`branchCode`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branchCode`) REFERENCES `branches` (`branchCode`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Miheer Mukhija','SBIB0000101'),
(2,'Ritik Bansal','SBIB0000102'),
(3,'Harsh Jain','SBIB0000103');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversal_requests`
--

DROP TABLE IF EXISTS `reversal_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reversal_requests` (
  `reqId` int NOT NULL AUTO_INCREMENT,
  `transactionNo` int NOT NULL,
  `reqDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isApproved` tinyint DEFAULT NULL,
  PRIMARY KEY (`reqId`),
  KEY `transactionNo` (`transactionNo`),
  CONSTRAINT `reversal_requests_ibfk_1` FOREIGN KEY (`transactionNo`) REFERENCES `transactions` (`transactionNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversal_requests`
--

LOCK TABLES `reversal_requests` WRITE;
/*!40000 ALTER TABLE `reversal_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversal_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transactionNo` int NOT NULL AUTO_INCREMENT,
  `accNo` int NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionNo`),
  KEY `accNo` (`accNo`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`accNo`) REFERENCES `bank_accounts` (`accNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;

/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 18:19:43
