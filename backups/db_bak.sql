-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: essentialmode
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `essentialmode`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `essentialmode`;

--
-- Table structure for table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account`
--

LOCK TABLES `addon_account` WRITE;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` VALUES ('caution','caution',0),('society_ambulance','EMS',1),('society_cardealer','Cardealer',1),('society_police','Police',1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account_data`
--

LOCK TABLES `addon_account_data` WRITE;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` VALUES (1,'society_ambulance',0,NULL),(2,'society_cardealer',99997999,NULL),(3,'society_police',0,NULL),(4,'caution',0,'steam:110000100b2f120'),(5,'caution',0,'steam:11000010c999845'),(6,'caution',0,'steam:11000010e629bf9');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory`
--

LOCK TABLES `addon_inventory` WRITE;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` VALUES ('society_ambulance','EMS',1),('society_cardealer','Cardealer',1),('society_police','Police',1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory_items`
--

LOCK TABLES `addon_inventory_items` WRITE;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardealer_vehicles`
--

LOCK TABLES `cardealer_vehicles` WRITE;
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
INSERT INTO `cardealer_vehicles` VALUES (2,'lp700r',1000);
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'steam:110000100b2f120','Mike','Jones','1986-07-29','m','170'),(2,'steam:11000010c999845','Harambe','Lives','1969-4-20','m','140'),(3,'steam:110000100b2f120','Test','Char','1996-9-29','m','150'),(4,'steam:11000010c999845','Test','Test','1999-13-12','m','140'),(5,'steam:11000010e629bf9','Neil','Strong','14/05/2000','m','183');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` VALUES ('society_ambulance','Ambulance',1),('society_police','Police',1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  KEY `index_datastore_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore_data`
--

LOCK TABLES `datastore_data` WRITE;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` VALUES (1,'society_ambulance',NULL,'{}'),(2,'society_police',NULL,'{\"weapons\":[{\"name\":\"WEAPON_PISTOL\",\"count\":0},{\"name\":\"WEAPON_APPISTOL\",\"count\":0}]}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_types`
--

LOCK TABLES `fine_types` WRITE;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` VALUES (1,'Misuse of a horn',30,0),(2,'Illegally Crossing a continuous Line',40,0),(3,'Driving on the wrong side of the road',250,0),(4,'Illegal U-Turn',250,0),(5,'Illegally Driving Off-road',170,0),(6,'Refusing a Lawful Command',30,0),(7,'Illegally Stopping a Vehicle',150,0),(8,'Illegal Parking',70,0),(9,'Failing to Yield to the right',70,0),(10,'Failure to comply with Vehicle Information',90,0),(11,'Failing to stop at a Stop Sign ',105,0),(12,'Failing to stop at a Red Light',130,0),(13,'Illegal Passing',100,0),(14,'Driving an illegal Vehicle',100,0),(15,'Driving without a License',1500,0),(16,'Hit and Run',800,0),(17,'Exceeding Speeds Over < 5 mph',90,0),(18,'Exceeding Speeds Over 5-15 mph',120,0),(19,'Exceeding Speeds Over 15-30 mph',180,0),(20,'Exceeding Speeds Over > 30 mph',300,0),(21,'Impeding traffic flow',110,1),(22,'Public Intoxication',90,1),(23,'Disorderly conduct',90,1),(24,'Obstruction of Justice',130,1),(25,'Insults towards Civilans',75,1),(26,'Disrespecting of an LEO',110,1),(27,'Verbal Threat towards a Civilan',90,1),(28,'Verbal Threat towards an LEO',150,1),(29,'Providing False Information',250,1),(30,'Attempt of Corruption',1500,1),(31,'Brandishing a weapon in city Limits',120,2),(32,'Brandishing a Lethal Weapon in city Limits',300,2),(33,'No Firearms License',600,2),(34,'Possession of an Illegal Weapon',700,2),(35,'Possession of Burglary Tools',300,2),(36,'Grand Theft Auto',1800,2),(37,'Intent to Sell/Distrube of an illegal Substance',1500,2),(38,'Frabrication of an Illegal Substance',1500,2),(39,'Possession of an Illegal Substance ',650,2),(40,'Kidnapping of a Civilan',1500,2),(41,'Kidnapping of an LEO',2000,2),(42,'Robbery',650,2),(43,'Armed Robbery of a Store',650,2),(44,'Armed Robbery of a Bank',1500,2),(45,'Assault on a Civilian',2000,3),(46,'Assault of an LEO',2500,3),(47,'Attempt of Murder of a Civilian',3000,3),(48,'Attempt of Murder of an LEO',5000,3),(49,'Murder of a Civilian',10000,3),(50,'Murder of an LEO',30000,3),(51,'Involuntary manslaughter',1800,3),(52,'Fraud',2000,2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_impounded_vehicles`
--

DROP TABLE IF EXISTS `h_impounded_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_impounded_vehicles` (
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `officer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mechanic` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `releasedate` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `fee` double NOT NULL,
  `reason` text COLLATE utf8mb4_bin NOT NULL,
  `notes` text COLLATE utf8mb4_bin,
  `vehicle` text COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `hold_o` tinyint(1) DEFAULT '0',
  `hold_m` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_impounded_vehicles`
--

LOCK TABLES `h_impounded_vehicles` WRITE;
/*!40000 ALTER TABLE `h_impounded_vehicles` DISABLE KEYS */;
INSERT INTO `h_impounded_vehicles` VALUES ('BIS 222','Mike Jones',NULL,'2019-05-27 08:36:19',50,'dfgjdfgjdghjf',NULL,'{\"modAirFilter\":-1,\"neonColor\":[255,0,255],\"modSideSkirt\":-1,\"modBrakes\":-1,\"oilLevel\":5.0,\"modSuspension\":-1,\"modArmor\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"modXenon\":false,\"modSeats\":-1,\"pearlescentColor\":0,\"tyresburst\":[false,false,false,false,false,false,false],\"modDashboard\":-1,\"modPlateHolder\":-1,\"dirtLevel\":0.0,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":4,\"neonEnabled\":[false,false,false,false],\"extras\":{\"4\":false,\"5\":false,\"11\":false,\"7\":false,\"9\":false,\"6\":false,\"1\":false,\"2\":true,\"3\":false},\"model\":2046537925,\"modAerials\":-1,\"modTank\":-1,\"modGrille\":-1,\"modWindows\":-1,\"wheelColor\":156,\"modDial\":-1,\"engineHealth\":1000.0,\"modFrame\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"color1\":134,\"modVanityPlate\":-1,\"modLivery\":0,\"modHydrolic\":-1,\"wheels\":1,\"modTrunk\":-1,\"modTrimB\":-1,\"modSpeakers\":-1,\"modStruts\":-1,\"modSteeringWheel\":-1,\"modRoof\":-1,\"windows\":[1,1,1,false,false,1,1,1,1,1,1,1,1],\"petrolTankHealth\":1000.0,\"modEngine\":1,\"modSpoilers\":-1,\"fuelLevel\":65.0,\"bodyHealth\":1000.0,\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"windowTint\":-1,\"modHood\":-1,\"color2\":134,\"modRightFender\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modRearBumper\":-1,\"modTrimA\":-1,\"health\":1000,\"modSmokeEnabled\":1,\"modFender\":-1,\"modExhaust\":-1,\"plate\":\"BIS 222\",\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modFrontWheels\":-1}','steam:11000010c999845',0,0),('IQA 691','Mike Jones',NULL,'2019-05-27 09:19:45',50,'FGHJKGHJKGHJKGHJKG',NULL,'{\"modAerials\":-1,\"modSuspension\":-1,\"modGrille\":-1,\"modSpoilers\":-1,\"model\":2046537925,\"modDoorSpeaker\":-1,\"plateIndex\":4,\"oilLevel\":5.0,\"plate\":\"IQA 691\",\"modArchCover\":-1,\"modAPlate\":-1,\"modOrnaments\":-1,\"modDashboard\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modTransmission\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"health\":1000,\"wheelColor\":156,\"modDial\":-1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modRoof\":-1,\"modSpeakers\":-1,\"pearlescentColor\":0,\"modHorns\":-1,\"extras\":{\"11\":false,\"1\":false,\"3\":false,\"2\":false,\"5\":true,\"4\":false,\"7\":false,\"6\":false,\"9\":false},\"modSideSkirt\":-1,\"modTrunk\":-1,\"modFrame\":-1,\"modPlateHolder\":-1,\"modWindows\":-1,\"tyresburst\":[false,false,false,false,false,false,false],\"petrolTankHealth\":1000.0,\"modArmor\":-1,\"fuelLevel\":65.0,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modFrontWheels\":-1,\"engineHealth\":1000.0,\"modBrakes\":-1,\"modBackWheels\":-1,\"modExhaust\":-1,\"modEngine\":1,\"modTurbo\":false,\"modFrontBumper\":-1,\"windowTint\":-1,\"modStruts\":-1,\"windows\":[1,1,1,false,false,1,1,1,1,1,1,1,1],\"dirtLevel\":0.0,\"color2\":134,\"color1\":134,\"modHydrolic\":-1,\"modHood\":-1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modXenon\":false,\"wheels\":1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modTrimA\":-1,\"modLivery\":1,\"modSmokeEnabled\":1,\"modSteeringWheel\":-1}','steam:11000010c999845',0,0),('KOO 353','Mike Jones',NULL,'2019-05-27 08:44:36',50,'dfghjdfghjfghj',NULL,'{\"extras\":{\"9\":false,\"5\":false,\"6\":false,\"7\":false,\"11\":true,\"1\":false,\"2\":false,\"3\":false,\"4\":false},\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modEngine\":1,\"modTurbo\":false,\"modDial\":-1,\"modExhaust\":-1,\"modFrontWheels\":-1,\"dirtLevel\":0.0,\"modAerials\":-1,\"modFrame\":-1,\"modHood\":-1,\"model\":2046537925,\"modSpoilers\":-1,\"modTank\":-1,\"modDoorSpeaker\":-1,\"modStruts\":-1,\"modFender\":-1,\"modTransmission\":-1,\"fuelLevel\":65.0,\"oilLevel\":5.0,\"modWindows\":-1,\"modTrimA\":-1,\"tyresburst\":[false,false,false,false,false,false,false],\"modArchCover\":-1,\"color2\":134,\"modXenon\":false,\"modHorns\":-1,\"plateIndex\":4,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"windows\":[1,1,1,false,false,1,1,1,1,1,1,false,false],\"pearlescentColor\":0,\"modHydrolic\":-1,\"modSpeakers\":-1,\"color1\":134,\"modRearBumper\":-1,\"bodyHealth\":1000.0,\"modSteeringWheel\":-1,\"engineHealth\":1000.0,\"modRoof\":-1,\"wheels\":1,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modDashboard\":-1,\"modRightFender\":-1,\"modTrunk\":-1,\"modBackWheels\":-1,\"modAPlate\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modSmokeEnabled\":1,\"modShifterLeavers\":-1,\"modLivery\":2,\"petrolTankHealth\":1000.0,\"health\":1000,\"modGrille\":-1,\"modArmor\":-1,\"wheelColor\":156,\"windowTint\":-1,\"modBrakes\":-1,\"plate\":\"KOO 353\",\"modPlateHolder\":-1,\"modAirFilter\":-1,\"modEngineBlock\":-1}','steam:11000010c999845',0,0),('NPH 401','Mike Jones','na','2019-06-04 08:35:26',50,'1sdklfjgsdfg',NULL,'{\"modTrimA\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"modXenon\":false,\"modSeats\":-1,\"modRightFender\":-1,\"plateIndex\":4,\"color1\":0,\"modFrontWheels\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"modSpeakers\":-1,\"modStruts\":-1,\"modFender\":-1,\"pearlescentColor\":3,\"modAirFilter\":-1,\"modTransmission\":-1,\"modTurbo\":false,\"modRearBumper\":-1,\"bodyHealth\":931.0,\"oilLevel\":5.0,\"modSuspension\":-1,\"modHood\":-1,\"modTank\":-1,\"tyresburst\":[1,false,false,false,1,false,false],\"modLivery\":-1,\"modArmor\":-1,\"modSteeringWheel\":-1,\"engineHealth\":967.0,\"modBrakes\":-1,\"modAPlate\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"extras\":{\"9\":false,\"5\":false,\"6\":false,\"7\":false,\"1\":false,\"2\":false,\"3\":true,\"4\":false,\"11\":true},\"modOrnaments\":-1,\"health\":932,\"wheelColor\":156,\"modWindows\":-1,\"modDashboard\":-1,\"model\":-1647941228,\"windowTint\":-1,\"windows\":[1,1,1,1,1,1,1,1,1,false,1,false,false],\"modHydrolic\":-1,\"modFrontBumper\":-1,\"petrolTankHealth\":1000.0,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modEngine\":1,\"fuelLevel\":25.427448272705,\"wheels\":3,\"dirtLevel\":0.34462907910347,\"color2\":0,\"modPlateHolder\":-1,\"plate\":\"NPH 401\",\"modArchCover\":-1,\"modDial\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"modTrunk\":-1,\"modSmokeEnabled\":1,\"neonColor\":[255,0,255],\"modHorns\":-1,\"neonEnabled\":[false,false,false,false],\"modVanityPlate\":-1,\"modSpoilers\":-1}','steam:11000010c999845',0,0),('NXT 214','Mike Jones',NULL,'2019-05-27 09:12:21',50,'dfhjfghjfghjfghjf',NULL,'{\"modAerials\":-1,\"modRoof\":-1,\"modDial\":-1,\"modHood\":-1,\"dirtLevel\":0.0,\"modEngineBlock\":-1,\"color2\":0,\"plate\":\"NXT 214\",\"modSideSkirt\":-1,\"wheelColor\":156,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modArmor\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255],\"modHorns\":-1,\"modFrontWheels\":-1,\"modSpeakers\":-1,\"tyresburst\":[1,false,false,1,1,1,1],\"modWindows\":-1,\"modSuspension\":-1,\"modFender\":-1,\"modGrille\":-1,\"modTurbo\":false,\"modSteeringWheel\":-1,\"modEngine\":1,\"neonEnabled\":[false,false,false,false],\"wheels\":1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":1,\"color1\":111,\"model\":456714581,\"modArchCover\":-1,\"modTrimB\":-1,\"health\":595,\"modPlateHolder\":-1,\"bodyHealth\":1000.0,\"modSeats\":-1,\"oilLevel\":5.0,\"windows\":[1,false,false,false,false,1,false,1,1,1,1,1,1],\"modTrunk\":-1,\"petrolTankHealth\":1000.0,\"modDashboard\":-1,\"pearlescentColor\":0,\"modRightFender\":-1,\"fuelLevel\":60.0,\"modOrnaments\":-1,\"modExhaust\":-1,\"modXenon\":false,\"plateIndex\":4,\"modTransmission\":-1,\"modBackWheels\":-1,\"engineHealth\":1000.0,\"modHydrolic\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"modAirFilter\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"modLivery\":-1,\"modShifterLeavers\":-1,\"modAPlate\":-1,\"modTrimA\":-1,\"extras\":[],\"modStruts\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1}','steam:11000010c999845',0,0),('RYY 639','Mike Jones',NULL,'2019-05-27 09:17:42',50,'dfhgdfghdfgh',NULL,'{\"tyreSmokeColor\":[255,255,255],\"modDial\":-1,\"engineHealth\":1000.0,\"modEngineBlock\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"plateIndex\":4,\"modRearBumper\":-1,\"fuelLevel\":65.0,\"modGrille\":-1,\"modBackWheels\":-1,\"modStruts\":-1,\"modPlateHolder\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modTrunk\":-1,\"modSpoilers\":-1,\"windowTint\":-1,\"pearlescentColor\":134,\"modSmokeEnabled\":false,\"modExhaust\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"tyresburst\":[false,false,false,false,false,false,false],\"modFender\":-1,\"modAPlate\":-1,\"oilLevel\":5.0,\"model\":-34623805,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"color1\":111,\"modEngine\":-1,\"dirtLevel\":0.0,\"wheels\":6,\"modArmor\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"modShifterLeavers\":-1,\"windows\":[false,false,false,false,false,1,false,1,1,false,1,1,1],\"color2\":1,\"petrolTankHealth\":1000.0,\"bodyHealth\":1000.0,\"extras\":[],\"modAirFilter\":-1,\"modTurbo\":false,\"modXenon\":false,\"plate\":\"RYY 639\",\"modTransmission\":-1,\"modTank\":-1,\"wheelColor\":156,\"modSuspension\":-1,\"modWindows\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"health\":1000,\"modLivery\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1}','steam:11000010c999845',0,0),('WQQ 658','Mike Jones',NULL,'2019-05-27 08:32:49',50,'DFGHDFGHDFGHDFGHDFGH',NULL,'{\"tyreSmokeColor\":[255,255,255],\"modSpeakers\":-1,\"wheelColor\":156,\"dirtLevel\":0.0,\"modFrame\":-1,\"modArmor\":-1,\"wheels\":1,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modDial\":-1,\"tyresburst\":[false,false,false,false,false,false,false],\"modTransmission\":-1,\"modArchCover\":-1,\"modFender\":-1,\"modGrille\":-1,\"neonColor\":[255,0,255],\"extras\":{\"1\":false,\"2\":true,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"11\":false,\"9\":false},\"modHood\":-1,\"modSeats\":-1,\"health\":1000,\"modFrontWheels\":-1,\"modSpoilers\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modTurbo\":false,\"model\":2046537925,\"modStruts\":-1,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modTrimB\":-1,\"engineHealth\":1000.0,\"color1\":134,\"modSmokeEnabled\":1,\"petrolTankHealth\":1000.0,\"modBackWheels\":-1,\"modBrakes\":-1,\"modAirFilter\":-1,\"modSideSkirt\":-1,\"windowTint\":-1,\"plateIndex\":4,\"windows\":[1,1,1,false,false,1,1,1,1,1,1,1,1],\"oilLevel\":5.0,\"modHorns\":-1,\"fuelLevel\":65.0,\"modAerials\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"modEngine\":1,\"modTrunk\":-1,\"color2\":134,\"modRightFender\":-1,\"pearlescentColor\":0,\"plate\":\"WQQ 658\",\"modWindows\":-1,\"modShifterLeavers\":-1,\"modLivery\":2,\"modXenon\":false,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modTank\":-1,\"modEngineBlock\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modRearBumper\":-1,\"modDoorSpeaker\":-1,\"modRoof\":-1}','steam:11000010c999845',0,0),('XHU 177','Mike Jones',NULL,'2019-05-27 08:57:21',50,'DFGHDFGHDFGHDFG',NULL,'{\"modExhaust\":-1,\"modHorns\":-1,\"modArmor\":-1,\"modSpoilers\":-1,\"modTrunk\":-1,\"windowTint\":-1,\"windows\":[1,1,1,false,false,1,false,1,1,false,1,1,1],\"modStruts\":-1,\"modTurbo\":false,\"tyreSmokeColor\":[255,255,255],\"plate\":\"XHU 177\",\"petrolTankHealth\":1000.0,\"color2\":0,\"modRightFender\":-1,\"modTank\":-1,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"modFender\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"wheels\":0,\"model\":-2007026063,\"health\":782,\"modLivery\":-1,\"modSteeringWheel\":-1,\"pearlescentColor\":0,\"modDial\":-1,\"modSideSkirt\":-1,\"modSeats\":-1,\"modEngineBlock\":-1,\"modEngine\":-1,\"modVanityPlate\":-1,\"modBrakes\":-1,\"modFrontWheels\":-1,\"plateIndex\":4,\"modTrimB\":-1,\"extras\":[],\"modRoof\":-1,\"neonEnabled\":[false,false,false,false],\"modFrame\":-1,\"modTransmission\":-1,\"wheelColor\":156,\"modXenon\":false,\"modBackWheels\":-1,\"tyresburst\":[1,false,false,false,false,1,false],\"oilLevel\":8.0,\"fuelLevel\":120.0,\"modDoorSpeaker\":-1,\"engineHealth\":1000.0,\"modAPlate\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"modSpeakers\":-1,\"dirtLevel\":0.0,\"modWindows\":-1,\"modHydrolic\":-1,\"modSuspension\":-1,\"neonColor\":[255,0,255],\"modHood\":-1,\"modTrimA\":-1,\"modRearBumper\":-1,\"modAerials\":-1,\"color1\":77,\"modPlateHolder\":-1}','steam:11000010c999845',0,0),('YIU 809','Mike Jones',NULL,'2019-05-27 08:48:10',50,'dghjfghjfghjfghj',NULL,'{\"plateIndex\":4,\"neonEnabled\":[false,false,false,false],\"neonColor\":[255,0,255],\"modDashboard\":-1,\"modShifterLeavers\":-1,\"modHood\":-1,\"modTrimB\":-1,\"modXenon\":false,\"modVanityPlate\":-1,\"tyresburst\":[false,false,false,false,false,false,false],\"modRoof\":-1,\"health\":0,\"windows\":[1,1,1,false,false,1,false,1,1,1,1,1,1],\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modExhaust\":-1,\"pearlescentColor\":0,\"engineHealth\":861.0,\"modSmokeEnabled\":1,\"modSeats\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"modArmor\":-1,\"modAPlate\":-1,\"modLivery\":0,\"modTrunk\":-1,\"bodyHealth\":0.0,\"modSideSkirt\":-1,\"modWindows\":-1,\"modAerials\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"wheels\":1,\"modFender\":-1,\"model\":2046537925,\"modSuspension\":-1,\"modArchCover\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modTurbo\":false,\"modBackWheels\":-1,\"color2\":134,\"modDial\":-1,\"modStruts\":-1,\"extras\":{\"1\":false,\"4\":false,\"5\":true,\"2\":false,\"3\":false,\"11\":false,\"9\":false,\"6\":false,\"7\":false},\"modGrille\":-1,\"color1\":134,\"modHydrolic\":-1,\"petrolTankHealth\":1000.0,\"oilLevel\":5.0,\"modRearBumper\":-1,\"modTransmission\":-1,\"modEngine\":1,\"modTank\":-1,\"dirtLevel\":0.0,\"modRightFender\":-1,\"modTrimA\":-1,\"plate\":\"YIU 809\",\"modFrontWheels\":-1,\"modHorns\":-1,\"modFrame\":-1,\"modBrakes\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"wheelColor\":156,\"fuelLevel\":65.0,\"modDoorSpeaker\":-1}','steam:11000010c999845',0,0),('YMN 608','Mike Jones',NULL,'2019-05-27 08:21:39',50,'sl;dkfsdkl;fgjkl;s',NULL,'{\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"tyreSmokeColor\":[255,255,255],\"modFender\":-1,\"modLivery\":1,\"color1\":134,\"modDashboard\":-1,\"modSeats\":-1,\"modDial\":-1,\"neonColor\":[255,0,255],\"modTransmission\":-1,\"modArchCover\":-1,\"windows\":[1,1,1,false,false,1,1,1,1,1,1,1,1],\"extras\":{\"9\":false,\"7\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false,\"2\":false,\"1\":false,\"11\":false},\"modAirFilter\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"modWindows\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"modBrakes\":-1,\"modVanityPlate\":-1,\"plate\":\"YMN 608\",\"model\":2046537925,\"modBackWheels\":-1,\"color2\":134,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":1,\"modAerials\":-1,\"engineHealth\":1000.0,\"dirtLevel\":0.0,\"modHydrolic\":-1,\"modSuspension\":-1,\"modFrame\":-1,\"pearlescentColor\":0,\"modStruts\":-1,\"modRightFender\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"oilLevel\":5.0,\"modGrille\":-1,\"modSideSkirt\":-1,\"modTrunk\":-1,\"modTurbo\":false,\"tyresburst\":[false,false,false,false,false,false,false],\"neonEnabled\":[false,false,false,false],\"modSpeakers\":-1,\"wheelColor\":156,\"wheels\":1,\"modAPlate\":-1,\"bodyHealth\":0.0,\"fuelLevel\":65.0,\"modExhaust\":-1,\"modXenon\":false,\"health\":996,\"modHood\":-1,\"modEngine\":1,\"modEngineBlock\":-1,\"petrolTankHealth\":1000.0,\"modTrimB\":-1,\"modRoof\":-1,\"plateIndex\":4,\"modHorns\":-1,\"modPlateHolder\":-1}','steam:11000010c999845',0,0);
/*!40000 ALTER TABLE `h_impounded_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('alive_chicken','living chicken',20,0,1),('bandage','Bandage',20,0,1),('bread','Pain',10,0,1),('clothe','cloth',40,0,1),('copper','copper',56,0,1),('cutted_wood','cut wood',20,0,1),('diamond','diamond',50,0,1),('essence','gas',24,0,1),('fabric','fabric',80,0,1),('fish','fish',100,0,1),('gold','gold',21,0,1),('iron','iron',42,0,1),('medikit','Medikit',5,0,1),('packaged_chicken','chicken fillet',100,0,1),('packaged_plank','packaged wood',100,0,1),('petrol','oil',24,0,1),('petrol_raffin','processed oil',24,0,1),('slaughtered_chicken','slaughtered chicken',20,0,1),('stone','stone',7,0,1),('washed_stone','washed stone',7,0,1),('water','Eau',5,0,1),('wood','wood',20,0,1),('wool','wool',40,0,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_grades`
--

LOCK TABLES `job_grades` WRITE;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}'),(2,'ambulance',0,'ambulance','Ambulancier',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(3,'ambulance',1,'doctor','Medecin',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(4,'ambulance',2,'chief_doctor','Medecin-chef',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(5,'ambulance',3,'boss','Chirurgien',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(6,'ambulance',0,'ambulance','Jr. EMT',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(7,'ambulance',1,'doctor','EMT',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(8,'ambulance',2,'chief_doctor','Sr. EMT',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(9,'ambulance',3,'boss','EMT Supervisor',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(10,'lumberjack',0,'employee','Employee',0,'{}','{}'),(11,'fisherman',0,'employee','Employee',0,'{}','{}'),(12,'fueler',0,'employee','Employee',0,'{}','{}'),(13,'reporter',0,'employee','Employee',0,'{}','{}'),(14,'tailor',0,'employee','Employee',0,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),(15,'miner',0,'employee','Employee',0,'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}','{}'),(16,'slaughterer',0,'employee','Employee',0,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),(17,'cardealer',0,'recruit','Recruit',10,'{}','{}'),(18,'cardealer',1,'novice','Novice',25,'{}','{}'),(19,'cardealer',2,'experienced','Experienced',40,'{}','{}'),(20,'cardealer',3,'boss','Boss',0,'{}','{}'),(21,'police',0,'recruit','Recruit',20,'{}','{}'),(22,'police',1,'officer','Officer',40,'{}','{}'),(23,'police',2,'sergeant','Sergeant',60,'{}','{}'),(24,'police',3,'lieutenant','Lieutenant',85,'{}','{}'),(25,'police',4,'boss','Chief',100,'{}','{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('ambulance','Ambulance'),('cardealer','Cardealer'),('fisherman','Fisherman'),('fueler','Fueler'),('lumberjack','Lumberjack'),('miner','Miner'),('police','Police'),('reporter','Reporter'),('slaughterer','Butcher'),('tailor','Tailor'),('unemployed','Unemployed');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `fourrieremecano` tinyint(1) NOT NULL DEFAULT '0',
  `vehiclename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'voiture',
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owned_vehicles`
--

LOCK TABLES `owned_vehicles` WRITE;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT INTO `owned_vehicles` VALUES ('steam:110000100b2f120',0,'CEW 869','{\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"modXenon\":false,\"modTank\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"plateIndex\":4,\"health\":1000,\"color2\":134,\"modHood\":-1,\"plate\":\"CEW 869\",\"modLivery\":1,\"modEngine\":-1,\"wheels\":1,\"modOrnaments\":-1,\"modAirFilter\":-1,\"modFender\":-1,\"neonColor\":[255,0,255],\"modFrame\":-1,\"modBackWheels\":-1,\"extras\":{\"1\":false,\"11\":true,\"3\":false,\"2\":false,\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"9\":false},\"modRearBumper\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modRoof\":-1,\"modDashboard\":-1,\"windowTint\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"dirtLevel\":0.0,\"modTrimA\":-1,\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modArmor\":-1,\"modPlateHolder\":-1,\"modHorns\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modBrakes\":-1,\"modArchCover\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"pearlescentColor\":0,\"modTransmission\":-1,\"color1\":134,\"wheelColor\":156,\"modFrontBumper\":-1,\"modTurbo\":false,\"modSpoilers\":-1,\"modWindows\":-1,\"modTrunk\":-1,\"model\":2046537925}','car','police',0,0,'voiture'),('steam:110000100b2f120',0,'DHK 056','{\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"modXenon\":false,\"modTank\":-1,\"modRightFender\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"health\":1000,\"plateIndex\":4,\"modBackWheels\":-1,\"color2\":134,\"modHood\":-1,\"plate\":\"DHK 056\",\"modLivery\":0,\"modEngine\":-1,\"modFender\":-1,\"modOrnaments\":-1,\"modAirFilter\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255],\"model\":2046537925,\"modSpoilers\":-1,\"pearlescentColor\":0,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modSteeringWheel\":-1,\"wheelColor\":156,\"modRoof\":-1,\"modDashboard\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"dirtLevel\":4.0,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modShifterLeavers\":-1,\"modArmor\":-1,\"modTurbo\":false,\"modHorns\":-1,\"modHydrolic\":-1,\"modAerials\":-1,\"modArchCover\":-1,\"modAPlate\":-1,\"modBrakes\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"modSpeakers\":-1,\"modTransmission\":-1,\"color1\":134,\"modPlateHolder\":-1,\"modFrontBumper\":-1,\"wheels\":1,\"modRearBumper\":-1,\"modWindows\":-1,\"modTrunk\":-1,\"extras\":{\"1\":false,\"11\":false,\"3\":false,\"2\":false,\"5\":false,\"4\":true,\"7\":false,\"6\":false,\"9\":false}}','car','police',0,0,'voiture'),('steam:11000010c999845',0,'GCU 472','{\"wheels\":6,\"modRearBumper\":-1,\"color1\":111,\"modSteeringWheel\":-1,\"modDashboard\":-1,\"modSpoilers\":-1,\"modRoof\":-1,\"modSpeakers\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"modDoorSpeaker\":-1,\"modLivery\":-1,\"modHood\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1,\"modOrnaments\":-1,\"modSmokeEnabled\":1,\"modFrontBumper\":-1,\"modHorns\":-1,\"modFender\":-1,\"modHydrolic\":-1,\"modVanityPlate\":-1,\"windowTint\":-1,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngine\":-1,\"modTank\":-1,\"modBrakes\":-1,\"modTurbo\":false,\"modShifterLeavers\":-1,\"modArmor\":-1,\"pearlescentColor\":134,\"plate\":\"GCU 472\",\"modDial\":-1,\"plateIndex\":4,\"modWindows\":-1,\"modTrimB\":-1,\"modPlateHolder\":-1,\"wheelColor\":156,\"health\":725,\"modTrunk\":-1,\"color2\":1,\"modArchCover\":-1,\"modGrille\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"model\":-34623805,\"modXenon\":false,\"modAirFilter\":-1,\"dirtLevel\":0.055430609732866,\"extras\":[],\"modRightFender\":-1,\"modAPlate\":-1,\"modSuspension\":-1}','car','police',0,0,'voiture'),('steam:11000010c999845',0,'TMA 395','{\"modBackWheels\":-1,\"modSideSkirt\":-1,\"modPlateHolder\":-1,\"modLivery\":1,\"wheelColor\":156,\"windowTint\":-1,\"model\":2046537925,\"modXenon\":false,\"modTurbo\":false,\"modVanityPlate\":-1,\"modHorns\":-1,\"modDashboard\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modSeats\":-1,\"color1\":134,\"modTrunk\":-1,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modTransmission\":-1,\"modExhaust\":-1,\"color2\":134,\"modRoof\":-1,\"modSmokeEnabled\":1,\"modSpeakers\":-1,\"modHood\":-1,\"modRearBumper\":-1,\"modTrimB\":-1,\"modSteeringWheel\":-1,\"modTank\":-1,\"health\":915,\"modTrimA\":-1,\"pearlescentColor\":0,\"modDial\":-1,\"modBrakes\":-1,\"wheels\":1,\"modHydrolic\":-1,\"modFender\":-1,\"modFrontWheels\":-1,\"modAerials\":-1,\"modFrame\":-1,\"modArmor\":-1,\"plate\":\"TMA 395\",\"modAPlate\":-1,\"modEngineBlock\":-1,\"modStruts\":-1,\"modOrnaments\":-1,\"modAirFilter\":-1,\"plateIndex\":4,\"modArchCover\":-1,\"extras\":{\"9\":false,\"7\":false,\"5\":false,\"6\":false,\"3\":true,\"4\":false,\"1\":false,\"2\":false,\"11\":false},\"modGrille\":-1,\"dirtLevel\":0.16906856000424,\"modRightFender\":-1,\"modShifterLeavers\":-1,\"modWindows\":-1,\"modSuspension\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false]}','car','police',0,0,'voiture'),('steam:110000100b2f120',1,'UHS 777','{\"modArmor\":-1,\"modAerials\":-1,\"neonColor\":[255,0,255],\"modBrakes\":-1,\"modArchCover\":-1,\"modEngine\":-1,\"modRoof\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"color2\":134,\"modTrunk\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"extras\":{\"1\":false,\"3\":false,\"2\":false,\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"9\":false,\"11\":true},\"modDoorSpeaker\":-1,\"modSmokeEnabled\":1,\"modAPlate\":-1,\"wheels\":1,\"modWindows\":-1,\"modTrimA\":-1,\"modVanityPlate\":-1,\"modHood\":-1,\"modHydrolic\":-1,\"modTurbo\":false,\"modRightFender\":-1,\"pearlescentColor\":0,\"neonEnabled\":[false,false,false,false],\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modTransmission\":-1,\"modStruts\":-1,\"modAirFilter\":-1,\"health\":1000,\"modBackWheels\":-1,\"plate\":\"UHS 777\",\"modGrille\":-1,\"modTrimB\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"dirtLevel\":0.012749901041388,\"plateIndex\":4,\"modFrame\":-1,\"model\":2046537925,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modPlateHolder\":-1,\"modHorns\":-1,\"modDashboard\":-1,\"modLivery\":2,\"color1\":134,\"wheelColor\":156,\"modFrontWheels\":-1,\"modXenon\":false,\"modFender\":-1,\"modSteeringWheel\":-1,\"modTank\":-1,\"modEngineBlock\":-1}','car','police',1,0,''),('steam:110000100b2f120',0,'YTD 233','{\"modArchCover\":-1,\"modEngineBlock\":-1,\"plate\":\"YTD 233\",\"modArmor\":-1,\"modHorns\":-1,\"modFrontWheels\":-1,\"modOrnaments\":-1,\"modAirFilter\":-1,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"color1\":27,\"wheels\":7,\"modLivery\":0,\"modFender\":-1,\"modSuspension\":-1,\"model\":949614817,\"modRoof\":-1,\"modPlateHolder\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTransmission\":-1,\"modSideSkirt\":-1,\"extras\":[],\"dirtLevel\":9.1962757110596,\"modRightFender\":-1,\"modHydrolic\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"pearlescentColor\":31,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modXenon\":false,\"wheelColor\":156,\"modWindows\":-1,\"modFrontBumper\":-1,\"plateIndex\":3,\"modDial\":-1,\"modSpeakers\":-1,\"windowTint\":-1,\"modEngine\":1,\"modHood\":-1,\"neonColor\":[255,0,255],\"modAPlate\":-1,\"modFrame\":-1,\"modBackWheels\":-1,\"modTrunk\":-1,\"modTrimB\":-1,\"modVanityPlate\":-1,\"modSpoilers\":-1,\"modAerials\":-1,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"modRearBumper\":-1,\"color2\":31,\"modShifterLeavers\":-1,\"health\":870,\"modStruts\":-1,\"modTurbo\":false,\"modSmokeEnabled\":1,\"modBrakes\":-1}','car',NULL,0,0,'voiture');
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_app_chat`
--

DROP TABLE IF EXISTS `phone_app_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_app_chat`
--

LOCK TABLES `phone_app_chat` WRITE;
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_calls`
--

DROP TABLE IF EXISTS `phone_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_calls`
--

LOCK TABLES `phone_calls` WRITE;
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_messages`
--

DROP TABLE IF EXISTS `phone_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_messages`
--

LOCK TABLES `phone_messages` WRITE;
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` VALUES (106,'ambulance','576','From #576 : Medical attention required: unconscious citizen!','2019-05-27 00:21:50',1,0),(107,'ambulance','576','GPS: 408.34216308594, -989.01165771484','2019-05-27 00:21:50',1,0),(108,'police','887','From #576 : hello','2019-05-27 00:25:29',1,0),(109,'police','887','GPS: 405.97668457032, -983.45281982422','2019-05-27 00:25:29',1,0),(110,'police','887','From #887 : what you need foo','2019-05-27 00:25:46',1,0),(111,'police','887','what you need foo','2019-05-27 00:25:46',1,1),(112,'ambulance','576','From #576 : Medical attention required: unconscious citizen!','2019-05-27 02:06:34',1,0),(113,'ambulance','576','GPS: 894.01904296875, -1414.9990234375','2019-05-27 02:06:34',1,0);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_users_contacts`
--

DROP TABLE IF EXISTS `phone_users_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_users_contacts`
--

LOCK TABLES `phone_users_contacts` WRITE;
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rented_vehicles`
--

LOCK TABLES `rented_vehicles` WRITE;
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'TwentyFourSeven','bread',7),(2,'TwentyFourSeven','water',5),(3,'RobsLiquor','bread',7),(4,'RobsLiquor','water',5),(5,'LTDgasoline','bread',7),(6,'LTDgasoline','water',5);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_moneywash`
--

LOCK TABLES `society_moneywash` WRITE;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'steam:110000100b2f120','black_money',0),(2,'steam:11000010c999845','black_money',0),(3,'steam:11000010e629bf9','black_money',0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contacts`
--

DROP TABLE IF EXISTS `user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contacts`
--

LOCK TABLES `user_contacts` WRITE;
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inventory`
--

LOCK TABLES `user_inventory` WRITE;
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` VALUES (1,'steam:110000100b2f120','wood',0),(2,'steam:110000100b2f120','diamond',0),(3,'steam:110000100b2f120','water',0),(4,'steam:110000100b2f120','cutted_wood',0),(5,'steam:110000100b2f120','slaughtered_chicken',0),(6,'steam:110000100b2f120','alive_chicken',0),(7,'steam:110000100b2f120','petrol',0),(8,'steam:110000100b2f120','essence',0),(9,'steam:110000100b2f120','fabric',0),(10,'steam:110000100b2f120','washed_stone',0),(11,'steam:110000100b2f120','stone',0),(12,'steam:110000100b2f120','petrol_raffin',0),(13,'steam:110000100b2f120','bread',0),(14,'steam:110000100b2f120','gold',0),(15,'steam:110000100b2f120','copper',0),(16,'steam:110000100b2f120','medikit',0),(17,'steam:110000100b2f120','wool',0),(18,'steam:110000100b2f120','bandage',0),(19,'steam:110000100b2f120','packaged_chicken',0),(20,'steam:110000100b2f120','packaged_plank',0),(21,'steam:110000100b2f120','iron',0),(22,'steam:110000100b2f120','clothe',0),(23,'steam:110000100b2f120','fish',0),(24,'steam:11000010c999845','petrol_raffin',0),(25,'steam:11000010c999845','bandage',0),(26,'steam:11000010c999845','water',5),(27,'steam:11000010c999845','fabric',0),(28,'steam:11000010c999845','gold',0),(29,'steam:11000010c999845','essence',0),(30,'steam:11000010c999845','wool',0),(31,'steam:11000010c999845','bread',7),(32,'steam:11000010c999845','diamond',0),(33,'steam:11000010c999845','packaged_plank',0),(34,'steam:11000010c999845','stone',0),(35,'steam:11000010c999845','clothe',0),(36,'steam:11000010c999845','cutted_wood',0),(37,'steam:11000010c999845','fish',0),(38,'steam:11000010c999845','wood',0),(39,'steam:11000010c999845','iron',0),(40,'steam:11000010c999845','washed_stone',0),(41,'steam:11000010c999845','slaughtered_chicken',0),(42,'steam:11000010c999845','alive_chicken',0),(43,'steam:11000010c999845','petrol',0),(44,'steam:11000010c999845','copper',0),(45,'steam:11000010c999845','packaged_chicken',0),(46,'steam:11000010c999845','medikit',0),(47,'steam:11000010e629bf9','medikit',0),(48,'steam:11000010e629bf9','alive_chicken',0),(49,'steam:11000010e629bf9','packaged_chicken',0),(50,'steam:11000010e629bf9','petrol_raffin',0),(51,'steam:11000010e629bf9','clothe',0),(52,'steam:11000010e629bf9','slaughtered_chicken',0),(53,'steam:11000010e629bf9','petrol',0),(54,'steam:11000010e629bf9','bread',0),(55,'steam:11000010e629bf9','copper',0),(56,'steam:11000010e629bf9','bandage',0),(57,'steam:11000010e629bf9','wool',0),(58,'steam:11000010e629bf9','fish',0),(59,'steam:11000010e629bf9','wood',0),(60,'steam:11000010e629bf9','essence',0),(61,'steam:11000010e629bf9','water',0),(62,'steam:11000010e629bf9','iron',0),(63,'steam:11000010e629bf9','washed_stone',0),(64,'steam:11000010e629bf9','stone',0),(65,'steam:11000010e629bf9','cutted_wood',0),(66,'steam:11000010e629bf9','gold',0),(67,'steam:11000010e629bf9','diamond',0),(68,'steam:11000010e629bf9','packaged_plank',0),(69,'steam:11000010e629bf9','fabric',0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_licenses`
--

LOCK TABLES `user_licenses` WRITE;
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `is_dead` tinyint(1) DEFAULT '0',
  `phone_number` int(11) DEFAULT NULL,
  `lastpos` varchar(255) COLLATE utf8mb4_bin DEFAULT '{706.98700000000, -964.94200000000,  31.39550000000000, 142.503463745117}',
  `status` longtext COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('steam:110000100b2f120','license:044cc57670ae5a3f0fa76b2c0f373a553660ea8e',125920,'ApplezJuice','{\"decals_2\":0,\"shoes_1\":1,\"eyebrows_4\":0,\"hair_color_2\":0,\"sex\":0,\"hair_color_1\":0,\"pants_1\":1,\"skin\":0,\"bproof_1\":0,\"torso_2\":0,\"makeup_4\":0,\"ears_1\":-1,\"beard_4\":0,\"bproof_2\":0,\"lipstick_3\":0,\"glasses_2\":0,\"helmet_2\":0,\"helmet_1\":-1,\"mask_1\":0,\"age_2\":0,\"lipstick_4\":0,\"eyebrows_2\":0,\"glasses_1\":2,\"bags_1\":0,\"face\":4,\"chain_2\":0,\"lipstick_1\":0,\"eyebrows_3\":0,\"makeup_1\":0,\"tshirt_2\":1,\"chain_1\":0,\"torso_1\":10,\"lipstick_2\":0,\"shoes_2\":0,\"beard_2\":10,\"arms\":1,\"decals_1\":0,\"mask_2\":0,\"age_1\":0,\"tshirt_1\":12,\"ears_2\":0,\"beard_1\":10,\"bags_2\":0,\"hair_1\":2,\"makeup_2\":0,\"makeup_3\":0,\"eyebrows_1\":0,\"beard_3\":0,\"pants_2\":0,\"hair_2\":0}','police',4,'[{\"ammo\":0,\"components\":[],\"label\":\"Nightstick\",\"name\":\"WEAPON_NIGHTSTICK\"},{\"ammo\":165,\"components\":[\"clip_default\"],\"label\":\"Pistol\",\"name\":\"WEAPON_PISTOL\"},{\"ammo\":165,\"components\":[\"clip_default\"],\"label\":\"Combat pistol\",\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":165,\"components\":[\"clip_extended\",\"flashlight\",\"suppressor\"],\"label\":\"AP pistol\",\"name\":\"WEAPON_APPISTOL\"},{\"ammo\":98,\"components\":[\"flashlight\",\"suppressor\"],\"label\":\"Pump shotgun\",\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":72,\"components\":[\"clip_extended\",\"flashlight\",\"scope\",\"suppressor\"],\"label\":\"Advanced rifle\",\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"ammo\":100,\"components\":[],\"label\":\"Taser\",\"name\":\"WEAPON_STUNGUN\"},{\"ammo\":0,\"components\":[],\"label\":\"Flashlight\",\"name\":\"WEAPON_FLASHLIGHT\"}]','{\"z\":26.400000000002,\"y\":-1284.4,\"x\"',10100,4,'superadmin','Mike','Jones','1986-07-29','m','170',0,887,'{798.88189697266, -1288.8350830078,  26.502359390258, 143.74291992188}','[{\"val\":489500,\"name\":\"hunger\",\"percent\":48.95},{\"val\":492125,\"name\":\"thirst\",\"percent\":49.2125}]'),('steam:11000010c999845','license:09ddc55ed3ff99e987eaefdc05c50e061e7ad091',9948848,'ELIGHTCAP12','{\"decals_2\":0,\"torso_2\":0,\"glasses_1\":0,\"hair_color_2\":0,\"sex\":0,\"hair_color_1\":0,\"tshirt_2\":0,\"skin\":0,\"bproof_1\":0,\"shoes_2\":0,\"makeup_4\":0,\"ears_1\":-1,\"beard_4\":0,\"bproof_2\":0,\"lipstick_3\":0,\"glasses_2\":0,\"pants_2\":0,\"helmet_2\":0,\"mask_1\":0,\"age_2\":0,\"lipstick_4\":0,\"hair_1\":0,\"pants_1\":0,\"bags_1\":0,\"beard_1\":0,\"chain_2\":0,\"face\":0,\"helmet_1\":-1,\"makeup_1\":0,\"chain_1\":0,\"eyebrows_3\":0,\"torso_1\":3,\"lipstick_2\":0,\"ears_2\":0,\"beard_2\":0,\"arms\":1,\"decals_1\":0,\"mask_2\":0,\"age_1\":0,\"tshirt_1\":0,\"shoes_1\":0,\"eyebrows_4\":0,\"bags_2\":0,\"lipstick_1\":0,\"makeup_2\":0,\"makeup_3\":0,\"eyebrows_1\":0,\"beard_3\":0,\"eyebrows_2\":0,\"hair_2\":0}','police',2,'[{\"label\":\"Pistol\",\"name\":\"WEAPON_PISTOL\",\"ammo\":161,\"components\":[\"clip_default\"]},{\"label\":\"AP pistol\",\"name\":\"WEAPON_APPISTOL\",\"ammo\":161,\"components\":[\"clip_default\"]},{\"label\":\"Pump shotgun\",\"name\":\"WEAPON_PUMPSHOTGUN\",\"ammo\":15,\"components\":[]}]','{\"z\":29.0,\"y\":-1126.0,\"x\":83.2000000',13050,4,'superadmin','Harambe','Lives','1969-4-20','m','140',0,576,'{83.188499450684, -1125.9318847656,  29.090042114258, 86.460456848144}','[{\"val\":399200,\"percent\":39.92,\"name\":\"hunger\"},{\"val\":424400,\"percent\":42.44,\"name\":\"thirst\"}]'),('steam:11000010e629bf9','license:52097e68bc9859e6cea4379bf0a0a47ce7b5267d',1000,'J_Armstrong','{\"helmet_1\":-1,\"bproof_1\":0,\"lipstick_3\":0,\"skin\":0,\"eyebrows_3\":0,\"mask_2\":0,\"face\":4,\"chain_1\":0,\"glasses_2\":0,\"decals_1\":0,\"mask_1\":0,\"age_1\":0,\"tshirt_1\":0,\"hair_2\":0,\"hair_color_2\":0,\"bags_1\":0,\"bproof_2\":0,\"beard_1\":0,\"torso_1\":0,\"beard_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"tshirt_2\":0,\"shoes_1\":0,\"helmet_2\":0,\"ears_2\":0,\"makeup_1\":0,\"makeup_2\":0,\"glasses_1\":0,\"eyebrows_1\":0,\"bags_2\":0,\"pants_2\":0,\"hair_1\":0,\"age_2\":0,\"eyebrows_2\":0,\"beard_4\":0,\"shoes_2\":0,\"hair_color_1\":0,\"chain_2\":0,\"lipstick_2\":0,\"makeup_3\":0,\"torso_2\":0,\"ears_1\":-1,\"arms\":0,\"lipstick_4\":0,\"pants_1\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"sex\":0,\"beard_3\":0}','unemployed',0,'[]','{\"z\":44.199999999998,\"y\":-393.800000',0,0,'user','Neil','Strong','14/05/2000','m','183',0,280,'{314.34295654296, -279.13708496094,  54.170795440674, 156.63053894042}','[{\"val\":786400,\"name\":\"hunger\",\"percent\":78.64},{\"val\":839800,\"name\":\"thirst\",\"percent\":83.98}]');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_categories`
--

LOCK TABLES `vehicle_categories` WRITE;
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` VALUES ('compacts','Compacts'),('coupes','Coupes'),('motorcycles','Motos'),('muscle','Muscle'),('offroad','Off Road'),('sedans','Sedans'),('sports','Sports'),('sportsclassics','Sports Classics'),('super','Super'),('suvs','SUVs'),('vans','Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_sold`
--

DROP TABLE IF EXISTS `vehicle_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_sold`
--

LOCK TABLES `vehicle_sold` WRITE;
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
INSERT INTO `vehicle_sold` VALUES ('ApplezJuice','lp700r','YTD 233','ELIGHTCAP12','2019-05-26 19:22');
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('Akuma','AKUMA',7500,'motorcycles'),('Adder','adder',900000,'super'),('Alpha','alpha',60000,'sports'),('Ardent','ardent',1150000,'sportsclassics'),('Asea','asea',5500,'sedans'),('Autarch','autarch',1955000,'super'),('Avarus','avarus',18000,'motorcycles'),('Bagger','bagger',13500,'motorcycles'),('Baller','baller2',40000,'suvs'),('Baller Sport','baller3',60000,'suvs'),('Banshee','banshee',70000,'sports'),('Banshee 900R','banshee2',255000,'super'),('Bati 801','bati',12000,'motorcycles'),('Bati 801RR','bati2',19000,'motorcycles'),('Bestia GTS','bestiagts',55000,'sports'),('BF400','bf400',6500,'motorcycles'),('Bf Injection','bfinjection',16000,'offroad'),('Bifta','bifta',12000,'offroad'),('Bison','bison',45000,'vans'),('Blade','blade',15000,'muscle'),('Blazer','blazer',6500,'offroad'),('Blazer Sport','blazer4',8500,'offroad'),('blazer5','blazer5',1755600,'offroad'),('Blista','blista',8000,'compacts'),('BMX (velo)','bmx',160,'motorcycles'),('Bobcat XL','bobcatxl',32000,'vans'),('Brawler','brawler',45000,'offroad'),('Brioso R/A','brioso',18000,'compacts'),('Btype','btype',62000,'sportsclassics'),('Btype Hotroad','btype2',155000,'sportsclassics'),('Btype Luxe','btype3',85000,'sportsclassics'),('Buccaneer','buccaneer',18000,'muscle'),('Buccaneer Rider','buccaneer2',24000,'muscle'),('Buffalo','buffalo',12000,'sports'),('Buffalo S','buffalo2',20000,'sports'),('Bullet','bullet',90000,'super'),('Burrito','burrito3',19000,'vans'),('Camper','camper',42000,'vans'),('Carbonizzare','carbonizzare',75000,'sports'),('Carbon RS','carbonrs',18000,'motorcycles'),('Casco','casco',30000,'sportsclassics'),('Cavalcade','cavalcade2',55000,'suvs'),('Cheetah','cheetah',375000,'super'),('Chimera','chimera',38000,'motorcycles'),('Chino','chino',15000,'muscle'),('Chino Luxe','chino2',19000,'muscle'),('Cliffhanger','cliffhanger',9500,'motorcycles'),('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),('Cognoscenti','cognoscenti',55000,'sedans'),('Comet','comet2',65000,'sports'),('Comet 5','comet5',1145000,'sports'),('Contender','contender',70000,'suvs'),('Coquette','coquette',65000,'sports'),('Coquette Classic','coquette2',40000,'sportsclassics'),('Coquette BlackFin','coquette3',55000,'muscle'),('Cruiser (velo)','cruiser',510,'motorcycles'),('Cyclone','cyclone',1890000,'super'),('Daemon','daemon',11500,'motorcycles'),('Daemon High','daemon2',13500,'motorcycles'),('Defiler','defiler',9800,'motorcycles'),('Deluxo','deluxo',4721500,'sportsclassics'),('Dominator','dominator',35000,'muscle'),('Double T','double',28000,'motorcycles'),('Dubsta','dubsta',45000,'suvs'),('Dubsta Luxuary','dubsta2',60000,'suvs'),('Bubsta 6x6','dubsta3',120000,'offroad'),('Dukes','dukes',28000,'muscle'),('Dune Buggy','dune',8000,'offroad'),('Elegy','elegy2',38500,'sports'),('Emperor','emperor',8500,'sedans'),('Enduro','enduro',5500,'motorcycles'),('Entity XF','entityxf',425000,'super'),('Esskey','esskey',4200,'motorcycles'),('Exemplar','exemplar',32000,'coupes'),('F620','f620',40000,'coupes'),('Faction','faction',20000,'muscle'),('Faction Rider','faction2',30000,'muscle'),('Faction XL','faction3',40000,'muscle'),('Faggio','faggio',1900,'motorcycles'),('Vespa','faggio2',2800,'motorcycles'),('Felon','felon',42000,'coupes'),('Felon GT','felon2',55000,'coupes'),('Feltzer','feltzer2',55000,'sports'),('Stirling GT','feltzer3',65000,'sportsclassics'),('Fixter (velo)','fixter',225,'motorcycles'),('FMJ','fmj',185000,'super'),('Fhantom','fq2',17000,'suvs'),('Fugitive','fugitive',12000,'sedans'),('Furore GT','furoregt',45000,'sports'),('Fusilade','fusilade',40000,'sports'),('Gargoyle','gargoyle',16500,'motorcycles'),('Gauntlet','gauntlet',30000,'muscle'),('Gang Burrito','gburrito',45000,'vans'),('Burrito','gburrito2',29000,'vans'),('Glendale','glendale',6500,'sedans'),('Grabger','granger',50000,'suvs'),('Gresley','gresley',47500,'suvs'),('GT 500','gt500',785000,'sportsclassics'),('Guardian','guardian',45000,'offroad'),('Hakuchou','hakuchou',31000,'motorcycles'),('Hakuchou Sport','hakuchou2',55000,'motorcycles'),('Hermes','hermes',535000,'muscle'),('Hexer','hexer',12000,'motorcycles'),('Hotknife','hotknife',125000,'muscle'),('Huntley S','huntley',40000,'suvs'),('Hustler','hustler',625000,'muscle'),('Infernus','infernus',180000,'super'),('Innovation','innovation',23500,'motorcycles'),('Intruder','intruder',7500,'sedans'),('Issi','issi2',10000,'compacts'),('Jackal','jackal',38000,'coupes'),('Jester','jester',65000,'sports'),('Jester(Racecar)','jester2',135000,'sports'),('Journey','journey',6500,'vans'),('Kamacho','kamacho',345000,'offroad'),('Khamelion','khamelion',38000,'sports'),('Kuruma','kuruma',30000,'sports'),('Landstalker','landstalker',35000,'suvs'),('RE-7B','le7b',325000,'super'),('Lambo','lp700r',1000,'super'),('Lynx','lynx',40000,'sports'),('Mamba','mamba',70000,'sports'),('Manana','manana',12800,'sportsclassics'),('Manchez','manchez',5300,'motorcycles'),('Massacro','massacro',65000,'sports'),('Massacro(Racecar)','massacro2',130000,'sports'),('Mesa','mesa',16000,'suvs'),('Mesa Trail','mesa3',40000,'suvs'),('Minivan','minivan',13000,'vans'),('Monroe','monroe',55000,'sportsclassics'),('The Liberator','monster',210000,'offroad'),('Moonbeam','moonbeam',18000,'vans'),('Moonbeam Rider','moonbeam2',35000,'vans'),('Nemesis','nemesis',5800,'motorcycles'),('Neon','neon',1500000,'sports'),('Nightblade','nightblade',35000,'motorcycles'),('Nightshade','nightshade',65000,'muscle'),('9F','ninef',65000,'sports'),('9F Cabrio','ninef2',80000,'sports'),('Omnis','omnis',35000,'sports'),('Oppressor','oppressor',3524500,'super'),('Oracle XS','oracle2',35000,'coupes'),('Osiris','osiris',160000,'super'),('Panto','panto',10000,'compacts'),('Paradise','paradise',19000,'vans'),('Pariah','pariah',1420000,'sports'),('Patriot','patriot',55000,'suvs'),('PCJ-600','pcj',6200,'motorcycles'),('Penumbra','penumbra',28000,'sports'),('Pfister','pfister811',85000,'super'),('Phoenix','phoenix',12500,'muscle'),('Picador','picador',18000,'muscle'),('Pigalle','pigalle',20000,'sportsclassics'),('Prairie','prairie',12000,'compacts'),('Premier','premier',8000,'sedans'),('Primo Custom','primo2',14000,'sedans'),('X80 Proto','prototipo',2500000,'super'),('Radius','radi',29000,'suvs'),('raiden','raiden',1375000,'sports'),('Rapid GT','rapidgt',35000,'sports'),('Rapid GT Convertible','rapidgt2',45000,'sports'),('Rapid GT3','rapidgt3',885000,'sportsclassics'),('Reaper','reaper',150000,'super'),('Rebel','rebel2',35000,'offroad'),('Regina','regina',5000,'sedans'),('Retinue','retinue',615000,'sportsclassics'),('Revolter','revolter',1610000,'sports'),('riata','riata',380000,'offroad'),('Rocoto','rocoto',45000,'suvs'),('Ruffian','ruffian',6800,'motorcycles'),('Ruiner 2','ruiner2',5745600,'muscle'),('Rumpo','rumpo',15000,'vans'),('Rumpo Trail','rumpo3',19500,'vans'),('Sabre Turbo','sabregt',20000,'muscle'),('Sabre GT','sabregt2',25000,'muscle'),('Sanchez','sanchez',5300,'motorcycles'),('Sanchez Sport','sanchez2',5300,'motorcycles'),('Sanctus','sanctus',25000,'motorcycles'),('Sandking','sandking',55000,'offroad'),('Savestra','savestra',990000,'sportsclassics'),('SC 1','sc1',1603000,'super'),('Schafter','schafter2',25000,'sedans'),('Schafter V12','schafter3',50000,'sports'),('Scorcher (velo)','scorcher',280,'motorcycles'),('Seminole','seminole',25000,'suvs'),('Sentinel','sentinel',32000,'coupes'),('Sentinel XS','sentinel2',40000,'coupes'),('Sentinel3','sentinel3',650000,'sports'),('Seven 70','seven70',39500,'sports'),('ETR1','sheava',220000,'super'),('Shotaro Concept','shotaro',320000,'motorcycles'),('Slam Van','slamvan3',11500,'muscle'),('Sovereign','sovereign',22000,'motorcycles'),('Stinger','stinger',80000,'sportsclassics'),('Stinger GT','stingergt',75000,'sportsclassics'),('Streiter','streiter',500000,'sports'),('Stretch','stretch',90000,'sedans'),('Stromberg','stromberg',3185350,'sports'),('Sultan','sultan',15000,'sports'),('Sultan RS','sultanrs',65000,'super'),('Super Diamond','superd',130000,'sedans'),('Surano','surano',50000,'sports'),('Surfer','surfer',12000,'vans'),('T20','t20',300000,'super'),('Tailgater','tailgater',30000,'sedans'),('Tampa','tampa',16000,'muscle'),('Drift Tampa','tampa2',80000,'sports'),('Thrust','thrust',24000,'motorcycles'),('Tri bike (velo)','tribike3',520,'motorcycles'),('Trophy Truck','trophytruck',60000,'offroad'),('Trophy Truck Limited','trophytruck2',80000,'offroad'),('Tropos','tropos',40000,'sports'),('Turismo R','turismor',350000,'super'),('Tyrus','tyrus',600000,'super'),('Vacca','vacca',120000,'super'),('Vader','vader',7200,'motorcycles'),('Verlierer','verlierer2',70000,'sports'),('Vigero','vigero',12500,'muscle'),('Virgo','virgo',14000,'muscle'),('Viseris','viseris',875000,'sportsclassics'),('Visione','visione',2250000,'super'),('Voltic','voltic',90000,'super'),('Voltic 2','voltic2',3830400,'super'),('Voodoo','voodoo',7200,'muscle'),('Vortex','vortex',9800,'motorcycles'),('Warrener','warrener',4000,'sedans'),('Washington','washington',9000,'sedans'),('Windsor','windsor',95000,'coupes'),('Windsor Drop','windsor2',125000,'coupes'),('Woflsbane','wolfsbane',9000,'motorcycles'),('XLS','xls',32000,'suvs'),('Yosemite','yosemite',485000,'muscle'),('Youga','youga',10800,'vans'),('Youga Luxuary','youga2',14500,'vans'),('Z190','z190',900000,'sportsclassics'),('Zentorno','zentorno',1500000,'super'),('Zion','zion',36000,'coupes'),('Zion Cabrio','zion2',45000,'coupes'),('Zombie','zombiea',9500,'motorcycles'),('Zombie Luxuary','zombieb',12000,'motorcycles'),('Z-Type','ztype',220000,'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-27 11:00:08
