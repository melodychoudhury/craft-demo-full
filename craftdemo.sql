-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: craftdemo
-- ------------------------------------------------------
-- Server version	9.6.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ivnulexlsgoyflyediggccaqrtkjmfugfkck` (`primaryOwnerId`),
  CONSTRAINT `fk_eebdlcongeqbwglvcqkajvdpngjbscvyqhjg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ivnulexlsgoyflyediggccaqrtkjmfugfkck` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gvkjfyhzlgzyzoditfmnjublmvbgaoayvkqt` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_hmhrjiydxzdelfqwirwrsjbxcncnwyfimvjv` (`dateRead`),
  KEY `fk_kfbspmlioavtzpswzmmcabwetkpvonicmzah` (`pluginId`),
  CONSTRAINT `fk_kfbspmlioavtzpswzmmcabwetkpvonicmzah` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yzrfvjzqcmadjgvrgyakxmzysvzkplhhxoiy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uouqzghfxiehcqotdbjfpapggrolzakwdckv` (`sessionId`,`volumeId`),
  KEY `idx_ewfjhcvyghgzsepntgypyqytpgiqzraytapm` (`volumeId`),
  CONSTRAINT `fk_aljrueyyjtosfqvepclosmjaufnjmoztvgne` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovksdxnxahezlhdznmszcsaxmphfuhtpjgzb` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mkmdidatyznrxbiwasvmniqtzayouncfluwa` (`filename`,`folderId`),
  KEY `idx_mhrvsnuzlfosyhbxktknuiiucafgbwjkrrig` (`folderId`),
  KEY `idx_mctymcowyhyyrsgwvaagotrhugtdzwlqspxm` (`volumeId`),
  KEY `fk_djckvirjxjuephhgybghsejowrwassjpuzhb` (`uploaderId`),
  CONSTRAINT `fk_adfpqmjwghvjephpzuhmdujartdzywnsfuwn` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_djckvirjxjuephhgybghsejowrwassjpuzhb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lfzqssengeiqbeblszxnmevzimrgalpbvmju` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ruaiqdctnwxusdthelhawgubmylgfszwdopu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (19,1,1,1,'Rolec-EV-chargers.jpg','image/jpeg','image',NULL,1200,811,293929,NULL,NULL,NULL,'2026-03-06 11:53:14','2026-03-06 11:53:14','2026-03-06 11:53:14'),(27,1,1,1,'matcha.jpg','image/jpeg','image',NULL,1064,1330,517154,NULL,NULL,NULL,'2026-03-06 12:26:22','2026-03-06 12:26:22','2026-03-06 12:26:22'),(104,1,1,1,'Rolec-EV-chargers_2026-03-09-162452_gcko.jpg','image/jpeg','image',NULL,1200,811,293929,NULL,0,0,'2026-03-09 16:24:52','2026-03-09 16:24:52','2026-03-09 16:24:52'),(105,1,1,1,'sample-pic.jpg','image/jpeg','image',NULL,500,333,68655,NULL,NULL,NULL,'2026-03-09 16:25:01','2026-03-09 16:25:01','2026-03-09 16:25:01'),(127,2,4,1,'sample.pdf','application/pdf','pdf',NULL,NULL,NULL,18810,NULL,NULL,NULL,'2026-03-10 10:39:46','2026-03-10 10:39:46','2026-03-10 10:39:46'),(144,1,1,1,'evo-pic.jpg','image/jpeg','image',NULL,462,334,20915,NULL,NULL,NULL,'2026-03-10 10:54:40','2026-03-10 10:54:40','2026-03-10 10:54:40');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_vyscxanivkryjjftgdoemgxnxojhddzqiygw` (`siteId`),
  CONSTRAINT `fk_hkautqvbuvbhrvdftqutfkzaqmlbsjzstpdg` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vyscxanivkryjjftgdoemgxnxojhddzqiygw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
INSERT INTO `assets_sites` VALUES (19,1,NULL),(27,1,NULL),(104,1,NULL),(105,1,NULL),(127,1,NULL),(144,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ziuwxslzwoncjdwmlpwgszxjohnwqzpkvnsx` (`userId`),
  CONSTRAINT `fk_ziuwxslzwoncjdwmlpwgszxjohnwqzpkvnsx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_drmotmwkesebnwgaxzervahgetdrtbgpclqs` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jwpbsvmxfgjpdxqrppwpsgjvdmriqocstcsf` (`groupId`),
  KEY `fk_jljropugeqmdoythekfpqrtknqmcimoybrlb` (`parentId`),
  CONSTRAINT `fk_jljropugeqmdoythekfpqrtknqmcimoybrlb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wgunefwkqbaapssyndcozuadlopooxfaznyu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyoouuenmhsvxzntcsejkkfeknorzctcumyl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (116,1,NULL,1,'2026-03-10 09:24:36','2026-03-10 09:24:36'),(120,1,NULL,0,'2026-03-10 10:31:02','2026-03-10 10:31:02'),(121,1,NULL,0,'2026-03-10 10:31:16','2026-03-10 10:31:16'),(122,1,NULL,0,'2026-03-10 10:31:33','2026-03-10 10:31:33'),(123,1,NULL,0,'2026-03-10 10:37:14','2026-03-10 10:37:14'),(125,1,NULL,1,'2026-03-10 10:39:09','2026-03-10 10:39:09'),(128,4,NULL,NULL,'2026-03-10 10:44:54','2026-03-10 10:44:54'),(129,4,NULL,NULL,'2026-03-10 10:45:02','2026-03-10 10:45:02'),(132,4,NULL,NULL,'2026-03-10 10:46:23','2026-03-10 10:46:23'),(133,2,NULL,NULL,'2026-03-10 10:46:49','2026-03-10 10:46:49'),(135,3,NULL,NULL,'2026-03-10 10:47:40','2026-03-10 10:47:40');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ngqxwbwzolgcrqephavlbuiunlcuqmcmexgn` (`name`),
  KEY `idx_mgbfcynqzevzdslrssjswrcjivzmkevxpzcd` (`handle`),
  KEY `idx_ctdmrawrqzuoubypkqskyqpkvbzfpljsvtca` (`structureId`),
  KEY `idx_eqgxfbfzdynefzuzeylcmqjbskyjjygewmpg` (`fieldLayoutId`),
  KEY `idx_rkhfefqzlhzewxwapeomsvxftpsmgizwkwnj` (`dateDeleted`),
  CONSTRAINT `fk_qiyhtezfipyknihcdkvnlekkyzdwwofpyjle` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uedrpirpwuvlolgmqeeqzanvgmexdkqrbacw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
INSERT INTO `categorygroups` VALUES (1,1,3,'Category','Category','end','2026-03-05 14:19:57','2026-03-10 10:37:04','2026-03-10 10:44:41','be2669d2-dbf5-4d06-9d52-714ef75884bd'),(2,5,16,'EV Charging','evCharging','end','2026-03-10 10:41:49','2026-03-10 10:41:49',NULL,'3b2da99e-edbd-4422-b2ef-6b687a5e0dbf'),(3,6,17,'Marina Services','marinaServices','end','2026-03-10 10:43:31','2026-03-10 10:43:31',NULL,'fb70777d-d33c-4c53-9467-f431d2bccfe0'),(4,7,18,'Caravan Hook Ups','caravanHookUps','end','2026-03-10 10:43:52','2026-03-10 10:43:52',NULL,'3bf63914-a732-4f5f-914f-526a648953e2');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qmknvfidrnqhamfjpdmyxazikezmpskflepy` (`groupId`,`siteId`),
  KEY `idx_tszwmzqlomvxybvwsnxupwzyucreaomqjswt` (`siteId`),
  CONSTRAINT `fk_ebgeznktzdpzjzroagipdqvaafixgdffdlsp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lryyyzfujpolqpfikcfohpocomsmjeyjfppg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'category/{slug}',NULL,'2026-03-05 14:19:57','2026-03-10 10:37:04','b97f08b6-01cc-460b-9643-88c1fbb8706e'),(2,2,1,1,'ev-charging/{slug}',NULL,'2026-03-10 10:41:49','2026-03-10 10:41:49','03f0208b-0939-43e1-a771-f5caacc2d34a'),(3,3,1,1,'marina-services/{slug}',NULL,'2026-03-10 10:43:31','2026-03-10 10:43:31','fdab2e47-cfeb-4679-bc5e-8eeb2b037b71'),(4,4,1,1,'caravan-hook-ups/{slug}',NULL,'2026-03-10 10:43:52','2026-03-10 10:43:52','b65892fe-0733-4ad7-9f14-b9b762881499');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_vnjvinbneckabnowxwnbosizvxsktiuomxuc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_xyjwaaugqfxgumukxejxaeccuowflolrqmyn` (`siteId`),
  KEY `fk_kvjscgbuzzqpkysjmnabtoqfcnbiuatjvkkk` (`userId`),
  CONSTRAINT `fk_kvjscgbuzzqpkysjmnabtoqfcnbiuatjvkkk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_xyjwaaugqfxgumukxejxaeccuowflolrqmyn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zvptpvklzqlsmogrhhljzifzwvbkdsfckxdq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (2,1,'slug','2026-03-09 14:52:07',0,1),(2,1,'uri','2026-03-09 14:50:52',0,1),(3,1,'expiryDate','2026-03-05 09:46:06',0,1),(3,1,'fieldId','2026-03-05 09:46:06',0,1),(3,1,'id','2026-03-05 09:46:06',0,1),(3,1,'postDate','2026-03-05 09:46:06',0,1),(3,1,'primaryOwnerId','2026-03-05 09:46:06',0,1),(3,1,'sectionId','2026-03-05 09:46:06',0,1),(3,1,'status','2026-03-05 09:46:06',0,1),(3,1,'title','2026-03-05 09:46:06',0,1),(3,1,'typeId','2026-03-05 09:46:06',0,1),(6,1,'postDate','2026-03-05 10:38:57',0,1),(6,1,'slug','2026-03-05 10:38:57',0,1),(6,1,'title','2026-03-05 10:38:57',0,1),(6,1,'uri','2026-03-05 10:38:57',0,1),(8,1,'postDate','2026-03-05 10:39:03',0,1),(8,1,'slug','2026-03-05 10:39:03',0,1),(8,1,'title','2026-03-05 10:39:03',0,1),(8,1,'uri','2026-03-05 10:39:03',0,1),(33,1,'postDate','2026-03-09 09:58:38',0,1),(33,1,'slug','2026-03-09 09:58:27',0,1),(33,1,'title','2026-03-09 09:58:27',0,1),(34,1,'slug','2026-03-09 09:58:44',0,1),(34,1,'title','2026-03-09 09:58:44',0,1),(35,1,'postDate','2026-03-09 10:07:47',0,1),(35,1,'slug','2026-03-09 10:07:42',0,1),(35,1,'title','2026-03-09 10:10:41',0,1),(36,1,'postDate','2026-03-09 10:09:12',0,1),(36,1,'slug','2026-03-09 11:56:42',0,1),(36,1,'title','2026-03-09 11:56:35',0,1),(37,1,'postDate','2026-03-09 10:10:03',0,1),(37,1,'slug','2026-03-09 10:11:37',0,1),(37,1,'title','2026-03-09 10:11:37',0,1),(44,1,'postDate','2026-03-09 12:29:00',0,1),(44,1,'slug','2026-03-09 13:19:35',0,1),(44,1,'title','2026-03-09 12:28:52',0,1),(45,1,'postDate','2026-03-09 12:29:18',0,1),(45,1,'slug','2026-03-09 13:11:03',0,1),(45,1,'title','2026-03-09 12:29:07',0,1),(46,1,'postDate','2026-03-09 12:29:35',0,1),(46,1,'slug','2026-03-09 12:29:28',0,1),(46,1,'title','2026-03-09 12:29:28',0,1),(48,1,'title','2026-03-09 13:11:23',0,1),(49,1,'postDate','2026-03-09 13:11:46',0,1),(49,1,'slug','2026-03-09 13:11:45',0,1),(49,1,'title','2026-03-09 13:11:45',0,1),(51,1,'postDate','2026-03-09 13:15:13',0,1),(51,1,'slug','2026-03-09 13:15:13',0,1),(51,1,'title','2026-03-09 13:15:20',0,1),(54,1,'postDate','2026-03-09 13:20:00',0,1),(54,1,'slug','2026-03-09 13:24:46',0,1),(54,1,'title','2026-03-09 13:19:53',0,1),(55,1,'postDate','2026-03-09 13:20:58',0,1),(55,1,'slug','2026-03-09 13:20:51',0,1),(55,1,'title','2026-03-09 13:20:51',0,1),(56,1,'postDate','2026-03-09 13:21:12',0,1),(56,1,'slug','2026-03-09 13:21:07',0,1),(56,1,'title','2026-03-09 13:21:07',0,1),(59,1,'postDate','2026-03-09 13:32:23',0,1),(59,1,'slug','2026-03-09 13:32:22',0,1),(59,1,'title','2026-03-09 13:32:22',0,1),(60,1,'postDate','2026-03-09 13:38:29',0,1),(60,1,'slug','2026-03-09 13:38:21',0,1),(60,1,'title','2026-03-10 08:54:42',0,1),(62,1,'postDate','2026-03-09 13:38:58',0,1),(62,1,'slug','2026-03-09 13:38:42',0,1),(62,1,'title','2026-03-09 13:38:42',0,1),(65,1,'postDate','2026-03-09 13:54:20',0,1),(65,1,'slug','2026-03-09 13:54:07',0,1),(65,1,'title','2026-03-09 13:54:07',0,1),(65,1,'uri','2026-03-09 13:54:07',0,1),(67,1,'postDate','2026-03-09 14:06:34',0,1),(67,1,'slug','2026-03-09 14:05:40',0,1),(67,1,'title','2026-03-09 14:05:40',0,1),(67,1,'uri','2026-03-09 14:05:40',0,1),(68,1,'postDate','2026-03-09 14:06:33',0,1),(68,1,'slug','2026-03-09 14:06:02',0,1),(68,1,'status','2026-03-09 14:06:33',0,1),(68,1,'title','2026-03-09 14:06:02',0,1),(82,1,'uri','2026-03-09 14:50:52',0,1),(85,1,'slug','2026-03-09 14:52:07',0,1),(91,1,'primaryOwnerId','2026-03-09 15:36:09',0,1),(93,1,'postDate','2026-03-09 15:39:22',0,1),(93,1,'slug','2026-03-09 15:39:12',0,1),(93,1,'title','2026-03-09 15:39:12',0,1),(93,1,'uri','2026-03-09 15:39:12',0,1),(94,1,'postDate','2026-03-09 15:39:20',0,1),(94,1,'slug','2026-03-09 15:39:20',0,1),(94,1,'status','2026-03-09 15:39:20',0,1),(94,1,'title','2026-03-09 15:39:20',0,1),(97,1,'postDate','2026-03-09 16:00:52',0,1),(97,1,'slug','2026-03-09 16:00:42',0,1),(97,1,'title','2026-03-09 16:09:20',0,1),(97,1,'uri','2026-03-09 16:00:42',0,1),(99,1,'title','2026-03-09 16:09:20',0,1),(100,1,'postDate','2026-03-09 16:20:37',0,1),(100,1,'slug','2026-03-09 16:20:28',0,1),(100,1,'title','2026-03-09 16:20:28',0,1),(110,1,'title','2026-03-10 08:54:42',0,1),(111,1,'slug','2026-03-10 08:54:55',0,1),(111,1,'title','2026-03-10 08:54:55',0,1),(113,1,'expiryDate','2026-03-10 09:05:54',0,1),(113,1,'fieldId','2026-03-10 09:05:54',0,1),(113,1,'id','2026-03-10 09:05:54',0,1),(113,1,'postDate','2026-03-10 09:05:54',0,1),(113,1,'primaryOwnerId','2026-03-10 09:05:54',0,1),(113,1,'sectionId','2026-03-10 09:05:54',0,1),(113,1,'status','2026-03-10 09:05:54',0,1),(113,1,'title','2026-03-10 09:05:54',0,1),(113,1,'typeId','2026-03-10 09:05:54',0,1),(118,1,'slug','2026-03-10 10:29:10',0,1),(118,1,'title','2026-03-10 10:29:10',0,1),(119,1,'slug','2026-03-10 10:29:29',0,1),(119,1,'title','2026-03-10 10:29:29',0,1),(120,1,'slug','2026-03-10 10:31:07',0,1),(120,1,'title','2026-03-10 10:31:07',0,1),(120,1,'uri','2026-03-10 10:31:07',0,1),(121,1,'slug','2026-03-10 10:31:22',0,1),(121,1,'title','2026-03-10 10:31:22',0,1),(121,1,'uri','2026-03-10 10:31:22',0,1),(122,1,'slug','2026-03-10 10:31:40',0,1),(122,1,'title','2026-03-10 10:31:51',0,1),(122,1,'uri','2026-03-10 10:31:40',0,1),(123,1,'slug','2026-03-10 10:37:28',0,1),(123,1,'title','2026-03-10 10:37:28',0,1),(123,1,'uri','2026-03-10 10:37:28',0,1),(125,1,'slug','2026-03-10 10:39:19',0,1),(125,1,'title','2026-03-10 10:39:19',0,1),(125,1,'uri','2026-03-10 10:39:19',0,1),(126,1,'postDate','2026-03-10 10:39:50',0,1),(126,1,'slug','2026-03-10 10:39:27',0,1),(126,1,'status','2026-03-10 10:39:50',0,1),(126,1,'title','2026-03-10 10:39:27',0,1),(129,1,'slug','2026-03-10 10:46:09',0,1),(129,1,'title','2026-03-10 10:46:09',0,1),(129,1,'uri','2026-03-10 10:46:09',0,1),(131,1,'postDate','2026-03-10 10:46:15',0,1),(131,1,'slug','2026-03-10 10:46:15',0,1),(131,1,'status','2026-03-10 10:46:15',0,1),(131,1,'title','2026-03-10 10:46:15',0,1),(133,1,'slug','2026-03-10 10:46:58',0,1),(133,1,'title','2026-03-10 10:46:58',0,1),(133,1,'uri','2026-03-10 10:46:58',0,1),(134,1,'postDate','2026-03-10 10:47:18',0,1),(134,1,'slug','2026-03-10 10:47:18',0,1),(134,1,'status','2026-03-10 10:47:18',0,1),(134,1,'title','2026-03-10 10:47:18',0,1),(135,1,'slug','2026-03-10 10:47:47',0,1),(135,1,'title','2026-03-10 10:48:16',0,1),(135,1,'uri','2026-03-10 10:47:47',0,1),(136,1,'postDate','2026-03-10 10:47:57',0,1),(136,1,'primaryOwnerId','2026-03-10 10:48:16',0,1),(136,1,'slug','2026-03-10 10:48:16',0,1),(136,1,'status','2026-03-10 10:47:57',0,1),(136,1,'title','2026-03-10 10:48:16',0,1),(155,1,'postDate','2026-03-10 11:01:46',0,1),(155,1,'slug','2026-03-10 11:01:36',0,1),(155,1,'title','2026-03-10 11:01:36',0,1),(155,1,'uri','2026-03-10 11:01:36',0,1),(157,1,'postDate','2026-03-10 11:02:35',0,1),(157,1,'slug','2026-03-10 11:02:13',0,1),(157,1,'title','2026-03-10 11:02:21',0,1),(157,1,'uri','2026-03-10 11:02:13',0,1),(159,1,'postDate','2026-03-10 11:03:12',0,1),(159,1,'slug','2026-03-10 11:03:05',0,1),(159,1,'title','2026-03-10 11:03:05',0,1),(159,1,'uri','2026-03-10 11:03:05',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_cfrnkzlvncjrbqoirjyvajlmmlksrifkzznj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wjszoiqqssdbqgzuqentikzlankmucjjqbrb` (`siteId`),
  KEY `fk_ojkhcferizbtjhlgdfpltwewxchyujjczytx` (`fieldId`),
  KEY `fk_ilxrzbvygdpwamsaqonfhbmgixsxqhtkzsip` (`userId`),
  CONSTRAINT `fk_ilxrzbvygdpwamsaqonfhbmgixsxqhtkzsip` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ojkhcferizbtjhlgdfpltwewxchyujjczytx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uxhddsymtlgpbttnhmjadfnehapejdzbwlgh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wjszoiqqssdbqgzuqentikzlankmucjjqbrb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'e083da58-5dc8-4d47-8e66-2f48812edeaa','2026-03-09 14:48:33',0,1),(2,1,2,'df5ec4e7-1830-43a3-b83c-6530680e7533','2026-03-11 11:36:47',0,1),(2,1,3,'0d94ecae-3943-4c88-bf1c-ed92c86c0b1e','2026-03-11 11:36:47',0,1),(5,1,1,'e083da58-5dc8-4d47-8e66-2f48812edeaa','2026-03-05 09:46:23',0,1),(8,1,1,'022a3c7e-9a2f-47d6-84f1-18be129c7c7d','2026-03-05 15:06:14',0,1),(11,1,1,'022a3c7e-9a2f-47d6-84f1-18be129c7c7d','2026-03-05 15:06:14',0,1),(22,1,2,'df5ec4e7-1830-43a3-b83c-6530680e7533','2026-03-06 11:53:21',0,1),(29,1,2,'df5ec4e7-1830-43a3-b83c-6530680e7533','2026-03-06 12:26:28',0,1),(32,1,2,'df5ec4e7-1830-43a3-b83c-6530680e7533','2026-03-09 09:15:28',0,1),(33,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 09:58:34',0,1),(35,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 10:10:18',0,1),(36,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 10:09:12',0,1),(37,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 10:09:29',0,1),(44,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 12:28:57',0,1),(45,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 12:29:17',0,1),(46,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 12:29:33',0,1),(49,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 13:11:45',0,1),(51,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 13:15:05',0,1),(54,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:50:00',0,1),(56,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 13:21:11',0,1),(60,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 13:38:28',0,1),(62,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 13:38:57',0,1),(65,1,1,'2b4120c5-dc1f-466e-8dfe-2ef02627253f','2026-03-09 13:54:07',0,1),(65,1,2,'f1f52a75-a76f-4245-b2c5-49ee1f6da42a','2026-03-09 15:35:58',0,1),(67,1,1,'2b4120c5-dc1f-466e-8dfe-2ef02627253f','2026-03-09 14:05:50',0,1),(67,1,2,'f1f52a75-a76f-4245-b2c5-49ee1f6da42a','2026-03-09 14:05:51',0,1),(68,1,1,'6f8601ee-154f-4647-9b5e-62079483b2ef','2026-03-09 14:06:33',0,1),(73,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:37:25',0,1),(75,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:39:21',0,1),(77,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:48:12',0,1),(79,1,1,'e083da58-5dc8-4d47-8e66-2f48812edeaa','2026-03-09 14:48:33',0,1),(81,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:50:00',0,1),(83,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 14:51:15',0,1),(89,1,2,'f1f52a75-a76f-4245-b2c5-49ee1f6da42a','2026-03-09 15:35:58',0,1),(92,1,2,'f1f52a75-a76f-4245-b2c5-49ee1f6da42a','2026-03-09 15:36:08',0,1),(93,1,1,'702a784b-9ebc-437d-aebe-22faa759420b','2026-03-09 15:39:12',0,1),(93,1,2,'3d41eb61-7608-46ac-87df-570e7b2a33de','2026-03-09 16:25:06',0,1),(94,1,1,'6f8601ee-154f-4647-9b5e-62079483b2ef','2026-03-09 15:39:20',0,1),(97,1,1,'702a784b-9ebc-437d-aebe-22faa759420b','2026-03-09 16:09:20',0,1),(99,1,1,'702a784b-9ebc-437d-aebe-22faa759420b','2026-03-09 16:09:20',0,1),(100,1,4,'2909518a-9d7d-44bf-8411-17f80ac3ff5b','2026-03-09 16:20:36',0,1),(107,1,2,'3d41eb61-7608-46ac-87df-570e7b2a33de','2026-03-09 16:25:06',0,1),(112,1,1,'0f804d49-1940-4975-8bfc-a47dbe61e081','2026-03-10 09:19:59',0,1),(112,1,2,'c110c6ae-b411-4593-b0be-eed9b57b8234','2026-03-10 10:54:47',0,1),(115,1,1,'0f804d49-1940-4975-8bfc-a47dbe61e081','2026-03-10 09:19:59',0,1),(118,1,7,'1c203145-7d57-436c-a313-5526c45a3755','2026-03-10 10:29:11',0,1),(119,1,4,'7e1ae41b-93d9-48c5-8ef2-0db2c8a55351','2026-03-10 10:29:29',0,1),(123,1,7,'06a82cf7-d375-4958-a100-33eef4c87092','2026-03-10 10:37:28',0,1),(125,1,7,'06a82cf7-d375-4958-a100-33eef4c87092','2026-03-10 10:39:19',0,1),(126,1,6,'7e05d6e7-a9c1-4e73-8657-22c470611781','2026-03-10 10:39:47',0,1),(129,1,7,'1e89198c-1b32-4462-a800-8c207cd3e074','2026-03-10 10:46:09',0,1),(131,1,6,'7e05d6e7-a9c1-4e73-8657-22c470611781','2026-03-10 10:46:13',0,1),(133,1,7,'69e30f61-e420-43ee-bc5c-4f5a2b66a008','2026-03-10 10:46:58',0,1),(134,1,4,'7e1ae41b-93d9-48c5-8ef2-0db2c8a55351','2026-03-10 10:47:17',0,1),(135,1,7,'be727a10-7aa0-488b-a0b1-8ad339f68a91','2026-03-10 10:48:16',0,1),(136,1,6,'7e05d6e7-a9c1-4e73-8657-22c470611781','2026-03-10 10:47:55',0,1),(150,1,2,'c110c6ae-b411-4593-b0be-eed9b57b8234','2026-03-10 10:54:47',0,1),(155,1,1,'274b85f7-4e98-4e07-a76d-78d53ab581fb','2026-03-10 11:01:45',0,1),(157,1,1,'3ae63c5e-5d35-48e2-b84b-50fe89c6bba1','2026-03-10 11:02:26',0,1),(159,1,1,'3b4781e9-7088-4378-819b-d589093f5a41','2026-03-10 11:03:10',0,1),(164,1,2,'df5ec4e7-1830-43a3-b83c-6530680e7533','2026-03-11 11:36:47',0,1),(164,1,3,'0d94ecae-3943-4c88-bf1c-ed92c86c0b1e','2026-03-11 11:36:47',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lxialakiplzmeclddqmcosbxyztayscblram` (`primaryOwnerId`),
  KEY `idx_ryiyszgnwmxcldrbkiemzaqoibabajvfseuv` (`fieldId`),
  CONSTRAINT `fk_cnojfjxurdsafvqrmhrbxuzobukaxmvkwqyp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ralcorexcsokdjsxsczmzckyqretzvumfhlt` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rcnomokpapxxjaqaqwfngnhfwhndihsscspz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_eocihtqbylsitnwzjwfngnktemuytkjbcsyv` (`userId`),
  CONSTRAINT `fk_eocihtqbylsitnwzjwfngnktemuytkjbcsyv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ituwcuwyvojkobishfargvgcbklorkddrljs` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_omvixdkmzfqrmbbndedmhvqblhxstfglctpc` (`creatorId`,`provisional`),
  KEY `idx_whgzapxinneyfxyoblvhbmklbiljxzqlydyc` (`saved`),
  KEY `fk_eawamxeickmslagaikvyhuyapafayslyaaes` (`canonicalId`),
  CONSTRAINT `fk_eawamxeickmslagaikvyhuyapafayslyaaes` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qauzwwcnitgyegnzowilndiapntudokcbrjf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (14,NULL,1,0,'First draft',NULL,0,NULL,1),(28,45,1,1,'Draft 1',NULL,1,NULL,1),(42,NULL,1,0,'First draft',NULL,0,NULL,0),(51,54,1,1,'Draft 1','',1,NULL,1),(56,67,1,1,'Draft 1','',1,NULL,1),(64,NULL,1,0,'First draft','',0,NULL,1),(66,NULL,1,0,'First draft',NULL,0,NULL,0),(68,NULL,1,0,'First draft',NULL,0,NULL,1),(69,NULL,1,0,'First draft',NULL,0,NULL,1),(73,NULL,1,0,'First draft',NULL,0,NULL,1),(74,NULL,1,0,'First draft',NULL,0,NULL,0),(77,NULL,1,0,'First draft',NULL,0,NULL,0),(81,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_ulbrhpmqxisefzldpyoscwhorooahmbychzu` (`elementId`,`timestamp`,`userId`),
  KEY `fk_fxbnnbrctkiweeabokvgmsjttyavzesnwhqi` (`userId`),
  KEY `fk_dsbaynvibjcrpvbfraenepyjmgwxjohyoflk` (`siteId`),
  KEY `fk_jcqqidftwszsrgxjtfrhxjxzkqhcmaffhnip` (`draftId`),
  CONSTRAINT `fk_dlnlsmjtpnyfqvjnrgbwaikksvbqmvijngwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dsbaynvibjcrpvbfraenepyjmgwxjohyoflk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fxbnnbrctkiweeabokvgmsjttyavzesnwhqi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jcqqidftwszsrgxjtfrhxjxzkqhcmaffhnip` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES (1,1,1,NULL,'view','2026-03-05 10:15:26'),(2,1,1,NULL,'edit','2026-03-11 11:36:43'),(2,1,1,NULL,'save','2026-03-11 11:36:47'),(2,1,1,NULL,'view','2026-03-11 11:36:39'),(6,1,1,NULL,'save','2026-03-05 10:38:57'),(6,1,1,NULL,'view','2026-03-05 10:38:53'),(8,1,1,NULL,'edit','2026-03-05 15:06:13'),(8,1,1,NULL,'save','2026-03-05 15:06:14'),(8,1,1,NULL,'view','2026-03-05 15:06:09'),(19,1,1,NULL,'view','2026-03-06 12:11:14'),(20,1,1,NULL,'view','2026-03-06 12:10:40'),(21,1,1,NULL,'view','2026-03-09 09:15:19'),(33,1,1,NULL,'save','2026-03-09 09:58:38'),(33,1,1,NULL,'view','2026-03-09 09:58:34'),(34,1,1,NULL,'save','2026-03-09 09:58:44'),(34,1,1,NULL,'view','2026-03-09 09:58:56'),(35,1,1,NULL,'edit','2026-03-09 10:10:41'),(35,1,1,NULL,'save','2026-03-09 10:10:41'),(35,1,1,NULL,'view','2026-03-09 12:28:28'),(36,1,1,NULL,'edit','2026-03-09 11:56:42'),(36,1,1,NULL,'save','2026-03-09 11:56:42'),(36,1,1,NULL,'view','2026-03-09 11:56:37'),(37,1,1,NULL,'edit','2026-03-09 10:10:57'),(37,1,1,NULL,'save','2026-03-09 10:11:37'),(37,1,1,NULL,'view','2026-03-09 10:21:02'),(44,1,1,NULL,'edit','2026-03-09 13:19:35'),(44,1,1,NULL,'save','2026-03-09 13:19:35'),(44,1,1,NULL,'view','2026-03-09 13:19:32'),(45,1,1,NULL,'edit','2026-03-09 13:11:23'),(45,1,1,NULL,'save','2026-03-09 13:11:03'),(45,1,1,NULL,'view','2026-03-09 13:14:32'),(46,1,1,NULL,'save','2026-03-09 12:29:35'),(46,1,1,NULL,'view','2026-03-09 13:11:13'),(49,1,1,NULL,'edit','2026-03-09 13:11:52'),(49,1,1,NULL,'save','2026-03-09 13:11:53'),(49,1,1,NULL,'view','2026-03-09 13:14:24'),(51,1,1,NULL,'edit','2026-03-09 13:15:20'),(51,1,1,NULL,'save','2026-03-09 13:15:20'),(51,1,1,NULL,'view','2026-03-09 13:15:16'),(54,1,1,NULL,'edit','2026-03-09 14:51:15'),(54,1,1,NULL,'save','2026-03-09 14:50:00'),(54,1,1,NULL,'view','2026-03-09 14:52:17'),(55,1,1,NULL,'save','2026-03-09 13:20:58'),(55,1,1,NULL,'view','2026-03-09 13:31:56'),(56,1,1,NULL,'edit','2026-03-09 13:21:26'),(56,1,1,NULL,'save','2026-03-09 13:21:28'),(56,1,1,NULL,'view','2026-03-09 13:32:02'),(59,1,1,NULL,'save','2026-03-09 13:32:23'),(59,1,1,NULL,'view','2026-03-09 13:32:18'),(60,1,1,NULL,'edit','2026-03-10 08:54:41'),(60,1,1,NULL,'save','2026-03-10 08:54:42'),(60,1,1,NULL,'view','2026-03-10 08:54:35'),(62,1,1,NULL,'save','2026-03-09 13:38:58'),(62,1,1,NULL,'view','2026-03-09 13:38:51'),(64,1,1,NULL,'view','2026-03-09 13:53:49'),(65,1,1,NULL,'edit','2026-03-09 15:34:55'),(65,1,1,NULL,'save','2026-03-09 15:35:58'),(65,1,1,NULL,'view','2026-03-09 15:35:48'),(67,1,1,NULL,'edit','2026-03-09 15:36:08'),(67,1,1,NULL,'save','2026-03-09 14:06:34'),(67,1,1,NULL,'view','2026-03-09 15:38:59'),(68,1,1,NULL,'edit','2026-03-09 15:36:08'),(68,1,1,NULL,'save','2026-03-09 14:06:33'),(68,1,1,NULL,'view','2026-03-09 15:39:00'),(93,1,1,NULL,'edit','2026-03-09 16:25:05'),(93,1,1,NULL,'save','2026-03-09 16:25:06'),(93,1,1,NULL,'view','2026-03-11 09:11:08'),(94,1,1,NULL,'save','2026-03-09 15:39:20'),(94,1,1,NULL,'view','2026-03-09 15:39:13'),(97,1,1,NULL,'save','2026-03-09 16:09:20'),(97,1,1,NULL,'view','2026-03-09 16:09:10'),(100,1,1,NULL,'save','2026-03-09 16:20:37'),(100,1,1,NULL,'view','2026-03-09 16:23:35'),(111,1,1,NULL,'save','2026-03-10 08:54:55'),(111,1,1,NULL,'view','2026-03-10 08:55:06'),(112,1,1,NULL,'edit','2026-03-10 10:53:18'),(112,1,1,NULL,'save','2026-03-10 10:54:47'),(112,1,1,NULL,'view','2026-03-10 10:57:22'),(116,1,1,NULL,'view','2026-03-10 09:24:36'),(118,1,1,NULL,'save','2026-03-10 10:30:21'),(118,1,1,NULL,'view','2026-03-10 10:30:15'),(119,1,1,NULL,'save','2026-03-10 10:29:29'),(119,1,1,NULL,'view','2026-03-10 10:30:15'),(120,1,1,NULL,'save','2026-03-10 10:31:08'),(120,1,1,NULL,'view','2026-03-10 10:33:43'),(121,1,1,NULL,'save','2026-03-10 10:31:24'),(121,1,1,NULL,'view','2026-03-10 10:31:16'),(122,1,1,NULL,'save','2026-03-10 10:31:51'),(122,1,1,NULL,'view','2026-03-10 10:31:48'),(123,1,1,NULL,'save','2026-03-10 10:37:28'),(123,1,1,NULL,'view','2026-03-10 10:37:29'),(124,1,1,NULL,'view','2026-03-10 10:37:28'),(125,1,1,NULL,'save','2026-03-10 10:40:02'),(125,1,1,NULL,'view','2026-03-10 10:39:55'),(126,1,1,NULL,'save','2026-03-10 10:39:50'),(126,1,1,NULL,'view','2026-03-10 10:39:50'),(128,1,1,NULL,'view','2026-03-10 10:44:54'),(129,1,1,NULL,'save','2026-03-10 10:46:38'),(129,1,1,NULL,'view','2026-03-10 10:46:33'),(131,1,1,NULL,'save','2026-03-10 10:46:15'),(131,1,1,NULL,'view','2026-03-10 10:46:24'),(132,1,1,NULL,'view','2026-03-10 10:46:39'),(133,1,1,NULL,'save','2026-03-10 10:47:34'),(133,1,1,NULL,'view','2026-03-10 10:47:34'),(134,1,1,NULL,'save','2026-03-10 10:47:18'),(134,1,1,NULL,'view','2026-03-10 10:47:28'),(135,1,1,NULL,'edit','2026-03-10 10:48:14'),(135,1,1,NULL,'save','2026-03-10 10:48:16'),(135,1,1,NULL,'view','2026-03-10 10:48:04'),(136,1,1,NULL,'edit','2026-03-10 10:48:14'),(136,1,1,NULL,'save','2026-03-10 10:47:57'),(136,1,1,NULL,'view','2026-03-10 10:48:11'),(155,1,1,NULL,'save','2026-03-10 11:01:46'),(155,1,1,NULL,'view','2026-03-10 11:01:32'),(157,1,1,NULL,'save','2026-03-10 11:02:35'),(157,1,1,NULL,'view','2026-03-10 11:02:28'),(159,1,1,NULL,'save','2026-03-10 11:03:12'),(159,1,1,NULL,'view','2026-03-10 11:03:04');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dabcydwigivppcyolwwozogyqtctgqyqrrqz` (`dateDeleted`),
  KEY `idx_tudoqgsahyktubvbqjwvsfhitehqcotxpgsx` (`fieldLayoutId`),
  KEY `idx_twojyxryxqifxxkbqiwkkgkkyakgmstjkhta` (`type`),
  KEY `idx_sbbrorcijjpfsvkyogngmpfmjcnuoxjvfoqg` (`enabled`),
  KEY `idx_vxmstmiuxozvgqptudouqsbvzndhsebazuoa` (`canonicalId`),
  KEY `idx_obstdlhskxpbhijtvwfhobikaaasuqzkldpp` (`archived`,`dateCreated`),
  KEY `idx_tzrkocoqyrataawsrytealkbwxonxluewseb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_juqrzktukvessmgxroxohzvgqitcqhpjvyhq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_kxuleartlcfwjuzgzyxpxdzncgfrnvtnqjem` (`draftId`),
  KEY `fk_qcuzaxwxqzggkbnppxprraiasczokcxnhjfi` (`revisionId`),
  CONSTRAINT `fk_kxuleartlcfwjuzgzyxpxdzncgfrnvtnqjem` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nenxphazvhavvmskcwbictlcpawchxjccuwe` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qcuzaxwxqzggkbnppxprraiasczokcxnhjfi` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwolmtgvieuowcpbmziialwaxroevvpniarx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-03-05 09:24:30','2026-03-05 09:24:30',NULL,NULL,NULL,'f1e507a2-7f31-4312-8f1d-9b9bdb43a0b4'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2026-03-05 09:46:06','2026-03-11 11:36:47',NULL,NULL,NULL,'d389f7c1-4b14-4450-9e6a-09fa62c66f8b'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2026-03-05 09:46:06','2026-03-05 09:46:06',NULL,NULL,NULL,'3f21208b-6aeb-49eb-8d2a-4a57a184b611'),(5,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2026-03-05 09:46:23','2026-03-05 09:46:23',NULL,NULL,NULL,'c7ef4093-8885-43f6-b350-01925e3fbd36'),(6,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-03-05 10:38:52','2026-03-05 10:38:57',NULL,NULL,NULL,'26eac3b6-6196-48a7-802f-6f0f4f621396'),(7,6,NULL,3,2,'craft\\elements\\Entry',1,0,'2026-03-05 10:38:57','2026-03-05 10:38:57',NULL,NULL,NULL,'10e5cc6b-9bf8-4311-bc59-2f6457f22bba'),(8,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-03-05 10:38:59','2026-03-05 15:06:14',NULL,NULL,NULL,'d34f59f4-677d-4584-b8c0-b90e3f44b2ad'),(9,8,NULL,4,2,'craft\\elements\\Entry',1,0,'2026-03-05 10:39:03','2026-03-05 10:39:03',NULL,NULL,NULL,'8e581452-a061-4a96-b4db-2328768e435f'),(11,8,NULL,5,2,'craft\\elements\\Entry',1,0,'2026-03-05 15:06:14','2026-03-05 15:06:14',NULL,NULL,NULL,'8b5089b3-b03e-47cc-8bb6-9cf9e84ceeb2'),(12,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2026-03-06 11:41:05','2026-03-06 11:41:05',NULL,NULL,NULL,'b5923980-82b6-487d-b567-79969519184d'),(13,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2026-03-06 11:46:21','2026-03-06 11:46:21',NULL,NULL,NULL,'acf3d5f7-db5a-4416-b387-e24ef2f7bcea'),(19,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2026-03-06 11:53:13','2026-03-06 11:53:13',NULL,NULL,NULL,'d3d2f295-74af-408f-8171-c3e75d7b3c0b'),(20,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2026-03-06 11:53:21','2026-03-06 11:53:21',NULL,NULL,NULL,'4380f9e7-2881-45ea-b2ee-325d72291d05'),(21,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2026-03-06 11:53:21','2026-03-09 09:15:28',NULL,'2026-03-09 09:15:28',NULL,'2bfa4d83-b0d4-49f5-909c-cc767d646270'),(22,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2026-03-06 11:53:21','2026-03-06 11:53:21',NULL,NULL,NULL,'79a60f06-6c5d-468f-976d-c817c5ab949a'),(23,20,NULL,9,6,'craft\\elements\\Entry',1,0,'2026-03-06 11:53:21','2026-03-06 11:53:21',NULL,NULL,NULL,'6ed950d9-3598-4cf5-a884-306ff7cbd450'),(24,21,NULL,10,8,'craft\\elements\\Entry',1,0,'2026-03-06 11:53:21','2026-03-09 14:50:52',NULL,NULL,NULL,'ae38824b-3ba9-4c00-9cde-35550ad55631'),(27,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2026-03-06 12:26:22','2026-03-06 12:26:22',NULL,NULL,NULL,'23c5abb9-7cb4-4254-8510-436a06d9a201'),(28,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2026-03-06 12:26:28','2026-03-06 12:26:28',NULL,NULL,NULL,'36726d17-a517-497c-8221-09d1d5ac4aaa'),(29,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2026-03-06 12:26:28','2026-03-06 12:26:28',NULL,NULL,NULL,'52efacf3-76b5-4355-a6be-c218d058cb0e'),(30,28,NULL,12,8,'craft\\elements\\Entry',1,0,'2026-03-06 12:26:28','2026-03-06 12:26:28',NULL,NULL,NULL,'3814f5f5-39d2-4b4a-8274-a4846be6abd6'),(32,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2026-03-09 09:15:28','2026-03-09 09:15:28',NULL,NULL,NULL,'bbd4a738-8798-4664-8d09-d8a5f9221de1'),(33,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 09:58:19','2026-03-09 09:58:38',NULL,'2026-03-09 10:06:33',NULL,'fcda6bc0-7183-4539-ba84-0682b68b8adf'),(34,NULL,14,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 09:58:41','2026-03-09 09:58:44',NULL,'2026-03-09 10:06:33',NULL,'1c276198-ecea-4b6c-868a-8b95febdc158'),(35,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 10:07:36','2026-03-09 12:28:46',NULL,'2026-03-09 12:28:46',NULL,'16fd8579-4d27-4e7b-aef4-01acd2b7d730'),(36,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 10:09:05','2026-03-09 12:28:46',NULL,'2026-03-09 12:28:46',NULL,'5b97b931-5498-45d4-9a12-c81e8fc3eae6'),(37,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 10:09:20','2026-03-09 12:28:46',NULL,'2026-03-09 12:28:46',NULL,'9842abc3-ab4a-4d70-a058-9b9f98ea1c68'),(44,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 12:28:47','2026-03-09 13:19:48',NULL,'2026-03-09 13:19:48',NULL,'abe71528-116c-4497-8416-43a88846b371'),(45,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 12:29:02','2026-03-09 13:20:45',NULL,'2026-03-09 13:20:45',NULL,'02190f33-5e31-4a72-8c19-95c69d99670d'),(46,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 12:29:23','2026-03-09 13:11:27',NULL,'2026-03-09 13:11:27',NULL,'47283b23-5bc4-4502-8ac0-207d60567bfc'),(48,45,28,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:11:23','2026-03-09 13:11:23',NULL,'2026-03-09 13:20:45',NULL,'496c7198-42c5-40f6-bbf7-a50938981528'),(49,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:11:29','2026-03-09 13:14:45',NULL,'2026-03-09 13:14:45',NULL,'b18fab41-a72b-4d9d-bcf5-42c11c177e2f'),(51,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:14:46','2026-03-09 13:20:45',NULL,'2026-03-09 13:20:45',NULL,'af4f1f1a-dcc0-420e-9a28-d75d69ea7b52'),(54,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:19:49','2026-03-09 14:57:09',NULL,'2026-03-09 14:57:09',NULL,'0dcbbad5-2e23-4c49-a3c3-9a56bb862418'),(55,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:20:46','2026-03-09 13:36:18',NULL,'2026-03-09 13:36:18',NULL,'f5e33b45-44d1-4536-b5fd-ca13eb2ebc0c'),(56,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:21:01','2026-03-09 13:36:18',NULL,'2026-03-09 13:36:18',NULL,'e83fe815-e55c-41a2-b382-815fede93315'),(59,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:32:18','2026-03-09 13:36:18',NULL,'2026-03-09 13:36:18',NULL,'dbe84051-9558-4f49-b920-5c66f02178a2'),(60,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:38:09','2026-03-10 08:54:42',NULL,NULL,NULL,'27f38f0d-d737-4913-9ca6-a3cce69cd41c'),(61,60,NULL,14,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:38:29','2026-03-09 13:38:29',NULL,NULL,NULL,'11bada72-aec3-4f62-a67e-dcf78d431277'),(62,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:38:36','2026-03-09 13:38:58',NULL,NULL,NULL,'8e3a4f20-432e-4926-a2b0-4aaf1eb1c2ad'),(63,62,NULL,15,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:38:58','2026-03-09 13:38:58',NULL,NULL,NULL,'be8311af-0009-4476-8643-8424b6239582'),(64,NULL,42,NULL,10,'craft\\elements\\Entry',1,0,'2026-03-09 13:53:49','2026-03-09 13:53:49',NULL,'2026-03-09 15:38:26',NULL,'dad3ad88-0e13-4d74-8f37-cbd8dfe8f5d0'),(65,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2026-03-09 13:53:57','2026-03-09 15:35:58',NULL,'2026-03-09 15:38:26',NULL,'8453ceb4-5cbf-4856-a092-dd13bf7a0cdb'),(66,65,NULL,16,10,'craft\\elements\\Entry',1,0,'2026-03-09 13:54:20','2026-03-09 13:54:20',NULL,NULL,NULL,'425b1c53-2698-49d9-a516-9daaa9a3d25e'),(67,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2026-03-09 14:05:20','2026-03-09 14:06:34',NULL,'2026-03-09 15:38:26',NULL,'104bfd55-4536-4cfc-b754-3614cf396077'),(68,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2026-03-09 14:05:51','2026-03-09 14:06:33',NULL,NULL,NULL,'73d9c63f-4080-4342-a6f6-53e3f5e9bb9c'),(69,67,NULL,17,10,'craft\\elements\\Entry',1,0,'2026-03-09 14:06:34','2026-03-09 14:06:34',NULL,NULL,NULL,'6d211613-d2d2-41ea-ace0-2c4cbcc1c6dd'),(70,68,NULL,18,6,'craft\\elements\\Entry',1,0,'2026-03-09 14:06:33','2026-03-09 14:06:34',NULL,NULL,NULL,'9b9e0f96-e681-4c98-bf24-3c77cd84ab54'),(72,54,NULL,19,9,'craft\\elements\\Entry',1,0,'2026-03-09 13:24:46','2026-03-09 14:37:25',NULL,'2026-03-09 14:57:09',NULL,'e61fd48c-87d7-4f8c-bb66-d3e6fdb4f9f0'),(73,54,NULL,20,9,'craft\\elements\\Entry',1,0,'2026-03-09 14:37:25','2026-03-09 14:37:25',NULL,'2026-03-09 14:57:09',NULL,'89ebaa6d-2354-4b67-b0d1-f6e7ec34b349'),(75,54,NULL,21,9,'craft\\elements\\Entry',1,0,'2026-03-09 14:39:21','2026-03-09 14:39:21',NULL,'2026-03-09 14:57:09',NULL,'c02bca04-0787-4283-81f7-dfa4d6420c01'),(77,54,NULL,22,9,'craft\\elements\\Entry',1,0,'2026-03-09 14:48:12','2026-03-09 14:48:12',NULL,'2026-03-09 14:57:09',NULL,'bb867de9-9f85-469c-af95-fa0ef94f41ec'),(79,2,NULL,23,1,'craft\\elements\\Entry',1,0,'2026-03-09 14:48:33','2026-03-09 14:48:33',NULL,NULL,NULL,'175aa6cc-61c4-43c6-84f5-67ee36b058fc'),(81,54,NULL,24,9,'craft\\elements\\Entry',1,0,'2026-03-09 14:50:00','2026-03-09 14:50:00',NULL,'2026-03-09 14:57:09',NULL,'07efc210-8e61-4307-a959-5c6173119433'),(82,2,NULL,25,1,'craft\\elements\\Entry',1,0,'2026-03-09 14:50:52','2026-03-09 14:50:52',NULL,NULL,NULL,'78c84d44-1162-41e1-9666-2913a377534c'),(83,54,51,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 14:51:15','2026-03-09 14:51:15',NULL,'2026-03-09 14:57:09',NULL,'82b8bf69-f4c7-47d6-af82-c2c2f6f14381'),(85,2,NULL,26,1,'craft\\elements\\Entry',1,0,'2026-03-09 14:52:07','2026-03-09 14:52:07',NULL,NULL,NULL,'2bfc414c-7b6b-47dd-b9fa-a4535d0aa0ec'),(88,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2026-03-09 15:35:58','2026-03-09 15:35:58',NULL,NULL,NULL,'3e59168b-470c-4d37-880b-6c826a107a28'),(89,65,NULL,27,10,'craft\\elements\\Entry',1,0,'2026-03-09 15:35:58','2026-03-09 15:35:58',NULL,NULL,NULL,'3968af42-f366-4a73-8228-5bf1880f8840'),(90,88,NULL,28,6,'craft\\elements\\Entry',1,0,'2026-03-09 15:35:58','2026-03-09 15:35:58',NULL,NULL,NULL,'0e4dd535-84f0-4308-b563-e617b93c3c5d'),(91,68,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2026-03-09 15:36:08','2026-03-09 15:36:09',NULL,NULL,NULL,'4f9ee76b-e18d-455b-adf4-4a27779083fc'),(92,67,56,NULL,10,'craft\\elements\\Entry',1,0,'2026-03-09 15:36:08','2026-03-09 15:36:08',NULL,NULL,NULL,'b7ee4bb3-d9b0-408f-9aba-48fdec139113'),(93,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-03-09 15:39:04','2026-03-09 16:25:06',NULL,NULL,NULL,'e025f22d-40b0-4990-8d36-54209ffe84e6'),(94,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2026-03-09 15:39:13','2026-03-09 15:39:20',NULL,NULL,NULL,'a8d97467-4be2-49cc-9275-52d0ac3e3dac'),(95,93,NULL,29,11,'craft\\elements\\Entry',1,0,'2026-03-09 15:39:22','2026-03-09 15:39:22',NULL,NULL,NULL,'b7b83d42-fa3d-471b-ba7d-3e1c45beeb7b'),(96,94,NULL,30,6,'craft\\elements\\Entry',1,0,'2026-03-09 15:39:20','2026-03-09 15:39:22',NULL,NULL,NULL,'994af945-44f1-4a9a-95fe-a445c2acaf88'),(97,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-03-09 16:00:37','2026-03-09 16:09:20',NULL,NULL,NULL,'e8ee6b46-1ae4-4e6c-89c6-2652e418e37f'),(98,97,NULL,31,11,'craft\\elements\\Entry',1,0,'2026-03-09 16:00:52','2026-03-09 16:00:52',NULL,NULL,NULL,'68509ba8-eb67-41e2-869e-501311f0cada'),(99,97,NULL,32,11,'craft\\elements\\Entry',1,0,'2026-03-09 16:09:20','2026-03-09 16:09:20',NULL,NULL,NULL,'111c39b1-d25f-41f9-b58c-11ed4093e44a'),(100,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-09 16:20:24','2026-03-09 16:20:37',NULL,NULL,NULL,'61441250-46c1-4d2e-acb4-3d6de1f7a4b2'),(101,100,NULL,33,9,'craft\\elements\\Entry',1,0,'2026-03-09 16:20:37','2026-03-09 16:20:37',NULL,NULL,NULL,'86cabd27-93b7-4b44-b3cd-1851df8f6afe'),(104,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2026-03-09 16:24:52','2026-03-09 16:24:55',NULL,'2026-03-09 16:24:55',NULL,'f757e188-0061-45cf-adfd-4dad6a878ed6'),(105,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2026-03-09 16:25:01','2026-03-09 16:25:01',NULL,NULL,NULL,'8b84cc41-2188-4e1d-9f4a-8c4a11311881'),(106,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2026-03-09 16:25:06','2026-03-09 16:25:06',NULL,NULL,NULL,'7c4b0898-39cb-42de-997e-216f88ceaa1d'),(107,93,NULL,34,11,'craft\\elements\\Entry',1,0,'2026-03-09 16:25:06','2026-03-09 16:25:06',NULL,NULL,NULL,'9b4dd25c-6fbc-474e-9449-bacd0c1d5224'),(108,106,NULL,35,8,'craft\\elements\\Entry',1,0,'2026-03-09 16:25:06','2026-03-09 16:25:06',NULL,NULL,NULL,'79c18ce4-71f0-4cd0-928b-a65e40ece47e'),(110,60,NULL,36,9,'craft\\elements\\Entry',1,0,'2026-03-10 08:54:42','2026-03-10 08:54:42',NULL,NULL,NULL,'ee604e62-8e36-4566-8263-0260e3df8e57'),(111,NULL,64,NULL,9,'craft\\elements\\Entry',1,0,'2026-03-10 08:54:51','2026-03-10 08:54:55',NULL,NULL,NULL,'0c11c6da-a881-4666-a90c-17d9e89fca23'),(112,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2026-03-10 09:05:54','2026-03-10 10:54:47',NULL,NULL,NULL,'c38c5974-ba48-4efc-8061-7dae3dab242c'),(113,112,NULL,37,12,'craft\\elements\\Entry',1,0,'2026-03-10 09:05:54','2026-03-10 09:05:54',NULL,NULL,NULL,'1b4145fa-968b-40b6-9bb0-65a9f9e98c7d'),(115,112,NULL,38,12,'craft\\elements\\Entry',1,0,'2026-03-10 09:19:59','2026-03-10 09:19:59',NULL,NULL,NULL,'5614b7cf-b1d6-43bc-b5e0-00524849f50d'),(116,NULL,66,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 09:24:36','2026-03-10 09:24:36',NULL,'2026-03-10 10:44:41',NULL,'03d6b31c-5077-46f2-9969-4e6c7ef80008'),(118,NULL,68,NULL,15,'craft\\elements\\Entry',1,0,'2026-03-10 10:29:03','2026-03-10 10:30:21',NULL,NULL,NULL,'1c56aaec-f1de-4c10-8ea2-2fa2b2dc4e1c'),(119,NULL,69,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:29:11','2026-03-10 10:29:29',NULL,NULL,NULL,'e71d2511-f567-4a60-bb45-020096772878'),(120,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 10:31:02','2026-03-10 10:35:42',NULL,'2026-03-10 10:35:42',NULL,'b294ab92-a168-4c1c-9ac8-f66817dd7566'),(121,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 10:31:16','2026-03-10 10:35:42',NULL,'2026-03-10 10:35:42',NULL,'4e42a2f8-e257-4462-88f2-35f1f75c86a2'),(122,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 10:31:33','2026-03-10 10:35:42',NULL,'2026-03-10 10:35:42',NULL,'7b23d65c-1827-4054-b77e-efd1bee597d7'),(123,NULL,73,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 10:37:14','2026-03-10 10:40:10',NULL,'2026-03-10 10:40:10',NULL,'b6e4eca8-c084-42a6-a238-6b43d0e85a9c'),(124,NULL,74,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:37:28','2026-03-10 10:37:28',NULL,NULL,NULL,'092e6ff0-73a9-49f7-8020-5c50bdec70a5'),(125,NULL,NULL,NULL,3,'craft\\elements\\Category',1,0,'2026-03-10 10:39:09','2026-03-10 10:40:02',NULL,'2026-03-10 10:44:41',NULL,'c20a9a31-6540-4785-adf0-5e692fcdf45a'),(126,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:39:20','2026-03-10 10:39:50',NULL,NULL,NULL,'4fd82e63-9e82-45fa-8fa3-19033481f999'),(127,NULL,NULL,NULL,13,'craft\\elements\\Asset',1,0,'2026-03-10 10:39:46','2026-03-10 10:39:46',NULL,NULL,NULL,'21e17f1b-2f66-4e18-94d2-1f853ac5787a'),(128,NULL,77,NULL,18,'craft\\elements\\Category',1,0,'2026-03-10 10:44:54','2026-03-10 10:44:54',NULL,NULL,NULL,'9755a790-c9e2-4453-be82-501ae7b16f43'),(129,NULL,NULL,NULL,18,'craft\\elements\\Category',1,0,'2026-03-10 10:45:02','2026-03-10 10:46:38',NULL,NULL,NULL,'d7828bc4-1672-45ac-a98b-e078a996a34e'),(131,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:46:09','2026-03-10 10:46:15',NULL,NULL,NULL,'253fbe92-b61c-4567-90c7-71eb9bec8ba6'),(132,NULL,81,NULL,18,'craft\\elements\\Category',1,0,'2026-03-10 10:46:23','2026-03-10 10:46:23',NULL,NULL,NULL,'8b31800b-417c-46a2-8930-6e5f92562cd5'),(133,NULL,NULL,NULL,16,'craft\\elements\\Category',1,0,'2026-03-10 10:46:49','2026-03-10 10:47:34',NULL,NULL,NULL,'1f808bab-27cd-45a1-ae59-44763ad09b21'),(134,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:46:58','2026-03-10 10:47:18',NULL,NULL,NULL,'16b0a96f-46ca-421c-89b4-9df83a07bbf2'),(135,NULL,NULL,NULL,17,'craft\\elements\\Category',1,0,'2026-03-10 10:47:40','2026-03-10 10:48:16',NULL,NULL,NULL,'7d6ab03b-93cc-47d9-bfaa-2beb90e89390'),(136,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:47:48','2026-03-10 10:48:16',NULL,NULL,NULL,'965aaeae-9d0b-4823-823b-f17b98aa90c1'),(144,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2026-03-10 10:54:40','2026-03-10 10:54:40',NULL,NULL,NULL,'fadb274d-44db-444f-8241-85fda7df8e15'),(146,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'a32eb21e-4813-4a47-b78b-dee1ba06643f'),(147,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'d47d69cf-5f94-43d0-97c9-7fc1728d7924'),(148,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'b8e9cae4-9d9f-40ab-911f-48e1a4197418'),(149,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'d3a2beaf-8bcf-4b65-98c2-7f2ce2c11279'),(150,112,NULL,39,12,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'8540d699-f546-4b22-b0b4-b32c2588bd7c'),(151,146,NULL,40,15,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'515cc2ad-ebcb-427f-b5ea-9e5230b28347'),(152,147,NULL,41,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'db9e31fe-39b1-4cd9-84bf-b212d60be5c0'),(153,148,NULL,42,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'7ad029a0-18c3-445f-a9d2-c4d6c02dabf0'),(154,149,NULL,43,14,'craft\\elements\\Entry',1,0,'2026-03-10 10:54:47','2026-03-10 10:54:47',NULL,NULL,NULL,'762663a8-3147-4a9f-bf55-97740de231c5'),(155,NULL,NULL,NULL,19,'craft\\elements\\Entry',1,0,'2026-03-10 11:01:32','2026-03-10 11:01:46',NULL,NULL,NULL,'476e9788-7711-4446-9c6d-e99a654470a6'),(156,155,NULL,44,19,'craft\\elements\\Entry',1,0,'2026-03-10 11:01:46','2026-03-10 11:01:46',NULL,NULL,NULL,'b4457ac4-bf21-4510-b270-abf66dc0f83f'),(157,NULL,NULL,NULL,21,'craft\\elements\\Entry',1,0,'2026-03-10 11:02:12','2026-03-10 11:02:35',NULL,NULL,NULL,'fa26e44d-5556-4d6a-8fef-516da88288c5'),(158,157,NULL,45,21,'craft\\elements\\Entry',1,0,'2026-03-10 11:02:35','2026-03-10 11:02:35',NULL,NULL,NULL,'01ae876e-2f5f-4793-b6ca-00e49bdf6121'),(159,NULL,NULL,NULL,20,'craft\\elements\\Entry',1,0,'2026-03-10 11:03:04','2026-03-10 11:03:12',NULL,NULL,NULL,'7698d90e-1440-47fd-8785-3e9ffcec92e6'),(160,159,NULL,46,20,'craft\\elements\\Entry',1,0,'2026-03-10 11:03:12','2026-03-10 11:03:12',NULL,NULL,NULL,'1e710322-5b1b-4bcc-b0f8-fa0625cd7521'),(161,2,NULL,47,1,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:33','2026-03-11 11:36:33',NULL,NULL,NULL,'7cf8724a-bb24-438e-bc51-de9312336c38'),(162,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:47','2026-03-11 11:36:47',NULL,NULL,NULL,'cda141a5-cdbf-4154-97a7-67a35ad12e46'),(163,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:47','2026-03-11 11:36:47',NULL,NULL,NULL,'1b25995a-d53b-4b5a-ad9c-c24576435725'),(164,2,NULL,48,1,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:47','2026-03-11 11:36:47',NULL,NULL,NULL,'878818d9-e0b2-456b-9862-a04f7fc4c102'),(165,162,NULL,49,15,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:47','2026-03-11 11:36:47',NULL,NULL,NULL,'ba805dda-3a00-4af8-9f28-ad5ba70721df'),(166,163,NULL,50,14,'craft\\elements\\Entry',1,0,'2026-03-11 11:36:47','2026-03-11 11:36:47',NULL,NULL,NULL,'b07adee1-4cd6-432b-975c-27044d285d36');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_hkbhusepdjkoyrsdpzgzbyzycraeygjjigre` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `idx_wmtjrmhqpnegpsjeqqjozajgfhezmgegxajr` (`sortOrder`),
  KEY `fk_skqkjrnskjzyvvfucagolbckiyxdolklbbwo` (`ownerId`),
  CONSTRAINT `fk_fhdqusaptuhbjuqwecaredstwhmcuoyklchw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_skqkjrnskjzyvvfucagolbckiyxdolklbbwo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
INSERT INTO `elements_owners` VALUES (20,2,1),(23,22,1),(23,29,1),(23,32,1),(23,79,1),(23,82,1),(23,85,1),(23,161,1),(23,164,1),(68,67,1),(70,69,1),(88,65,1),(90,89,1),(91,92,1),(94,93,1),(96,95,1),(96,107,1),(119,118,1),(124,123,1),(126,125,1),(131,129,1),(134,133,1),(136,135,1),(146,112,1),(147,146,1),(151,150,1),(152,151,1),(163,162,1),(166,165,1),(21,2,2),(24,22,2),(24,29,2),(28,2,2),(30,164,2),(106,93,2),(108,107,2),(148,146,2),(153,151,2),(30,29,3),(30,32,3),(30,79,3),(30,82,3),(30,85,3),(30,161,3),(149,146,3),(154,151,3),(162,2,3),(165,164,3);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gncrvfpqxmluvejliwvwdibavacuvbltalcc` (`elementId`,`siteId`),
  KEY `idx_lzcymsowlmynfchhnfoqorewduuaznffattc` (`siteId`),
  KEY `idx_lvtcnuyiwqoqefsrcncnltjnulxrmyigieqr` (`title`,`siteId`),
  KEY `idx_gihtegixjijgvylskaxtmtbboqhpbnteavit` (`slug`,`siteId`),
  KEY `idx_ahpcnagiyfxfxmtevcwwtbztkmkkkxpeufkg` (`enabled`),
  KEY `idx_bslgtqqxjlbddoaghqdiwjhjakmqvefjepww` (`uri`,`siteId`),
  CONSTRAINT `fk_ncuelahqdjuhmrpdoczegnuwikqoyuikjjrx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vyyeissljautgxshcakumwigfjydasfjeadr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-03-05 09:24:30','2026-03-05 09:24:30','903557f8-d7df-412e-ba1f-cace51514c2f'),(2,2,1,'Home','home',NULL,'{\"0d94ecae-3943-4c88-bf1c-ed92c86c0b1e\": [105], \"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-05 09:46:06','2026-03-11 11:36:47','a729a54c-58d1-459c-8a97-f866bbb8c0c8'),(3,3,1,'Home','home','home',NULL,1,'2026-03-05 09:46:06','2026-03-05 09:46:06','090bc24b-7c92-4b64-8a26-40fe4e890952'),(5,5,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-05 09:46:23','2026-03-05 09:46:23','625fabd6-6078-4261-b9ea-4c576d89d34f'),(6,6,1,'Blog 01','blog-01','blogs/blog-01',NULL,1,'2026-03-05 10:38:52','2026-03-09 13:39:37','0ddf42aa-5209-4b81-8e45-c614bfa8c921'),(7,7,1,'Blog 01','blog-01','blog/blog-01',NULL,1,'2026-03-05 10:38:57','2026-03-05 10:38:57','0fc2a0f1-0980-4e4e-a471-be1dda1ca30b'),(8,8,1,'Blog two','blog-two','blogs/blog-two','{\"022a3c7e-9a2f-47d6-84f1-18be129c7c7d\": \"eeeee bodyu\"}',1,'2026-03-05 10:38:59','2026-03-09 13:39:37','8bc6c206-182e-44df-89ef-ae79d3684f0f'),(9,9,1,'Blog two','blog-two','blog/blog-two',NULL,1,'2026-03-05 10:39:03','2026-03-05 10:39:03','52fed9cc-1bac-4806-8c9e-ebfaa1c10fa2'),(11,11,1,'Blog two','blog-two','blog/blog-two','{\"022a3c7e-9a2f-47d6-84f1-18be129c7c7d\": \"eeeee bodyu\"}',1,'2026-03-05 15:06:14','2026-03-05 15:06:14','3d6bcfb1-2559-4c7e-b18e-70fd801482e8'),(12,12,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-06 11:41:05','2026-03-06 11:41:05','af386005-ccbb-4a46-9dcb-92ebfdb79d7e'),(13,13,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-06 11:46:21','2026-03-06 11:46:21','b9a80d78-97a4-4c71-adba-72ad06a9efe8'),(19,19,1,'Rolec EV chargers',NULL,NULL,NULL,1,'2026-03-06 11:53:13','2026-03-06 11:53:13','2f42a28e-0d60-471b-8201-29e96484c56a'),(20,20,1,'This is hero block title','this-is-hero-block-title',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"This is hero block image\"}',1,'2026-03-06 11:53:21','2026-03-06 11:53:21','cfe4246f-d963-4fb8-a658-2e519a272381'),(21,21,1,'This is img block caption','this-is-img-block-caption',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [19]}',1,'2026-03-06 11:53:21','2026-03-06 11:53:21','d235b671-8c50-425b-96e5-2633768b3d3e'),(22,22,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-06 11:53:21','2026-03-06 11:53:21','6adc0772-7e78-46dc-ad8c-d571263c70bb'),(23,23,1,'This is hero block title','this-is-hero-block-title',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"This is hero block image\"}',1,'2026-03-06 11:53:21','2026-03-06 11:53:21','a70ae438-cb28-4c11-be9f-76ce5d75d226'),(24,24,1,'This is img block caption','this-is-img-block-caption',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [19]}',1,'2026-03-06 11:53:21','2026-03-06 11:53:21','36743244-0d3c-47e9-8a32-f931e3bd1c40'),(27,27,1,'Matcha',NULL,NULL,NULL,1,'2026-03-06 12:26:22','2026-03-06 12:26:22','c2d263fe-afbb-4ff3-9948-565230ff06ce'),(28,28,1,'hi matcha','hi-matcha',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [27]}',1,'2026-03-06 12:26:28','2026-03-06 12:26:28','263986ec-8305-49f1-8c62-b429152595ad'),(29,29,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-06 12:26:28','2026-03-06 12:26:28','3c799b43-2a12-420e-b203-cfe4c37afa41'),(30,30,1,'hi matcha','hi-matcha',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [27]}',1,'2026-03-06 12:26:28','2026-03-06 12:26:28','4e340acc-d511-4a25-9474-ac05314c106f'),(32,32,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview\"}',1,'2026-03-09 09:15:28','2026-03-09 09:15:28','388e6625-fbdc-4cd9-95e3-c953dc8aea74'),(33,33,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 09:58:19','2026-03-09 09:58:34','04bfbaea-cd80-4f4c-a852-dae2be5aa1dc'),(34,34,1,'Blog','blog',NULL,NULL,1,'2026-03-09 09:58:41','2026-03-09 09:58:44','2cbb1399-b64f-43a5-a89f-716ae4d93e0b'),(35,35,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"Home\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 10:07:36','2026-03-09 10:10:41','df2a502c-8817-427a-a946-1eec8c97078f'),(36,36,1,'Blogs','blogs',NULL,NULL,1,'2026-03-09 10:09:05','2026-03-09 11:56:42','ad4727b7-9e7a-4984-8479-3f726793aa3c'),(37,37,1,'Blog 01','blog-01',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 10:09:20','2026-03-09 11:56:43','f90bbec9-dfb5-4ee6-995e-3650738872ad'),(44,44,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 12:28:47','2026-03-09 12:28:57','83d7f8a6-2038-451a-adfc-241e42d31de0'),(45,45,1,'Blog','blogs',NULL,NULL,1,'2026-03-09 12:29:02','2026-03-09 13:11:03','437fe67f-bcb7-4bd5-933f-e6e687c52aa0'),(46,46,1,'blog 01','blog-01',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 12:29:23','2026-03-09 13:11:04','fe8ab2c5-3b2a-4399-bb85-1ddca166c78b'),(48,48,1,'Blogs','blogs',NULL,NULL,1,'2026-03-09 13:11:23','2026-03-09 13:11:23','c72b99ef-dc9c-4527-bdff-e8d7e1ea6cc8'),(49,49,1,'blog 1','blog-1',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"Blog 1\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 13:11:29','2026-03-09 13:11:54','c499f80f-959c-4dd1-9d23-73604db551c1'),(51,51,1,'Blog 01','blog-0-1',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 13:14:46','2026-03-09 13:15:20','a3e8bcec-78c3-4078-ae64-3fa10f662154'),(54,54,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 13:19:49','2026-03-09 14:50:00','23bf98d3-0829-4556-b5f7-944ee1f8e367'),(55,55,1,'Blogs','blogs',NULL,NULL,1,'2026-03-09 13:20:46','2026-03-09 13:20:51','491bccb1-1576-4f29-a63a-1328722bad26'),(56,56,1,'Blog 01','blog-01',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 13:21:01','2026-03-09 13:32:27','5529b951-cb86-4e62-8747-037d5aaf6108'),(59,59,1,'smith','smith',NULL,NULL,1,'2026-03-09 13:32:18','2026-03-09 13:32:22','6b879981-f367-4735-a3c8-f9574d8a827b'),(60,60,1,'News & Blogs','blogs',NULL,NULL,1,'2026-03-09 13:38:09','2026-03-10 08:54:42','721fa166-1f6c-46e1-b3e3-4b3c1c1ba301'),(61,61,1,'Blogs','blogs',NULL,NULL,1,'2026-03-09 13:38:29','2026-03-09 13:38:29','f78ac388-3cf4-4bd1-8a2b-22d923cef00a'),(62,62,1,'Blog post 1','blog-post-1',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"Blog 01\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 13:38:36','2026-03-10 08:54:43','cbb0f551-9b51-4756-be9b-3000e4d4406a'),(63,63,1,'Blog post 1','blog-post-1',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"Blog 01\", \"value\": \"{entry:6@1:url}\"}}',1,'2026-03-09 13:38:58','2026-03-09 13:38:58','f4064648-b046-4b18-bef1-56b0be1c710d'),(64,64,1,NULL,'__temp_peupatmjzhaztllsliskkxwlsdagnjdvzwgn','__temp_peupatmjzhaztllsliskkxwlsdagnjdvzwgn',NULL,1,'2026-03-09 13:53:49','2026-03-09 13:53:49','543e9956-0f6a-4b78-9d8b-f99d58a819b9'),(65,65,1,'About','about','about','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"About text\"}',1,'2026-03-09 13:53:57','2026-03-09 13:54:07','0a28e4a7-5a10-4dc6-8e1f-6bdd2710f9ac'),(66,66,1,'About','about','about','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"About text\"}',1,'2026-03-09 13:54:20','2026-03-09 13:54:20','6d7d1549-3f13-4344-bbbe-72e01f541b93'),(67,67,1,'EV charging','ev-charging','ev-charging','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"EV Charging text\"}',1,'2026-03-09 14:05:20','2026-03-09 14:05:50','911099a0-5323-4a05-96d1-2c2228ae8cc0'),(68,68,1,'hero title','hero-title',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"hero title ev charging\"}',1,'2026-03-09 14:05:51','2026-03-09 14:06:33','39d035b0-7289-41ae-aea7-d9fe60e491fb'),(69,69,1,'EV charging','ev-charging','ev-charging','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"EV Charging text\"}',1,'2026-03-09 14:06:34','2026-03-09 14:06:34','33069463-3f25-424d-adfd-aff8ec1cefe0'),(70,70,1,'hero title','hero-title',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"hero title ev charging\"}',1,'2026-03-09 14:06:34','2026-03-09 14:06:34','58d70c0b-1396-4e17-bf11-8ad1a6846851'),(72,72,1,'Home','home',NULL,NULL,1,'2026-03-09 14:37:25','2026-03-09 14:37:25','043743f0-1b9d-425e-9313-5465e5bded12'),(73,73,1,'Home','home',NULL,NULL,1,'2026-03-09 14:37:25','2026-03-09 14:37:25','92cb33a1-4596-4cba-82cd-b55cd6f198ad'),(75,75,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 14:39:21','2026-03-09 14:39:21','c7678871-8def-4976-8070-a90d39a9cc0f'),(77,77,1,'Home','home',NULL,NULL,1,'2026-03-09 14:48:12','2026-03-09 14:48:12','5ef9647b-ccce-4605-87a5-4d05e9dd364e'),(79,79,1,'Home','home','home','{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-09 14:48:33','2026-03-09 14:48:33','cb54ec36-87b4-42f6-8548-b2a60083869a'),(81,81,1,'Home','home',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"value\": \"{entry:2@1:url}\"}}',1,'2026-03-09 14:50:00','2026-03-09 14:50:00','64b4165a-6777-49cd-9db6-f652ed916c71'),(82,82,1,'Home','home',NULL,'{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-09 14:50:52','2026-03-09 14:50:52','625b87e0-cd28-47c9-859e-f9252fe88f96'),(83,83,1,'Home','home',NULL,NULL,1,'2026-03-09 14:51:15','2026-03-09 14:51:15','7a943dc1-6b8f-4ef2-8aaa-b554729ec328'),(85,85,1,'Home','home',NULL,'{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-09 14:52:07','2026-03-09 14:52:07','1bbfd6bd-175a-4b63-9e4f-98ab36fdb3ed'),(88,88,1,'about hero','about-hero',NULL,NULL,1,'2026-03-09 15:35:58','2026-03-09 15:35:58','d43a7aae-9826-48c1-9bbe-8af808ae0312'),(89,89,1,'About','about','about','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"About text\"}',1,'2026-03-09 15:35:58','2026-03-09 15:35:58','cf062dfa-8867-4d69-b049-6b217199e3a1'),(90,90,1,'about hero','about-hero',NULL,NULL,1,'2026-03-09 15:35:58','2026-03-09 15:35:58','a5c4beb2-43f1-4a3c-8e52-720e9cbbe4b8'),(91,91,1,'hero title','hero-title',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"hero title ev charging\"}',1,'2026-03-09 15:36:08','2026-03-09 15:36:08','a56323b3-449f-41d5-842c-090e30c91070'),(92,92,1,'EV charging','ev-charging','ev-charging','{\"2b4120c5-dc1f-466e-8dfe-2ef02627253f\": \"EV Charging text\"}',1,'2026-03-09 15:36:08','2026-03-09 15:36:08','9a86005b-3a43-41d3-a8ff-cf00919730ff'),(93,93,1,'About','about','about','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"about body\"}',1,'2026-03-09 15:39:04','2026-03-09 15:39:12','a3423939-71bd-496c-b17f-f5026df5f38f'),(94,94,1,'hero about','hero-about',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"hero about body\"}',1,'2026-03-09 15:39:13','2026-03-09 15:39:20','3962163f-3e2e-49c8-9b3a-8b2189f76bb4'),(95,95,1,'About','about','about','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"about body\"}',1,'2026-03-09 15:39:22','2026-03-09 15:39:22','2b27cc5f-5460-45fe-86f5-74a1b30b7e1b'),(96,96,1,'hero about','hero-about',NULL,'{\"6f8601ee-154f-4647-9b5e-62079483b2ef\": \"hero about body\"}',1,'2026-03-09 15:39:22','2026-03-09 15:39:22','de7061b1-2d84-4679-977d-fc302ddbafb9'),(97,97,1,'TESTTT PAGE','test-page','test-page','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"TESSST PAGE BODSY\"}',1,'2026-03-09 16:00:37','2026-03-09 16:09:20','437c04fe-ff2a-4063-a998-7621e5a49601'),(98,98,1,'test page','test-page','test-page','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"body one\"}',1,'2026-03-09 16:00:52','2026-03-09 16:00:52','7101afdb-8886-4cc9-b63e-e7c67c7165f7'),(99,99,1,'TESTTT PAGE','test-page','test-page','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"TESSST PAGE BODSY\"}',1,'2026-03-09 16:09:20','2026-03-09 16:09:20','a6a88048-5997-488a-98ca-1c7321583f68'),(100,100,1,'About','about',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"About\", \"value\": \"{entry:93@1:url}\"}}',1,'2026-03-09 16:20:24','2026-03-09 16:20:46','5a27fc50-a9cd-4388-b4bf-d7a58ee307b3'),(101,101,1,'About','about',NULL,'{\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\": {\"type\": \"entry\", \"label\": \"About\", \"value\": \"{entry:93@1:url}\"}}',1,'2026-03-09 16:20:37','2026-03-09 16:20:37','d89a88ae-111d-4249-92c3-7766f881e22d'),(104,104,1,'Rolec EV chargers',NULL,NULL,NULL,1,'2026-03-09 16:24:52','2026-03-09 16:24:52','53a27fa3-23e5-42c6-83b5-dde43455edec'),(105,105,1,'Sample pic',NULL,NULL,NULL,1,'2026-03-09 16:25:01','2026-03-09 16:25:01','50d4fd2e-e8ee-450e-a136-d939a1b866b9'),(106,106,1,'ABOUT IMAGE','about-image',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [105]}',1,'2026-03-09 16:25:06','2026-03-09 16:25:06','fd5d1194-bd45-4de8-8976-573a55878337'),(107,107,1,'About','about','about','{\"702a784b-9ebc-437d-aebe-22faa759420b\": \"about body\"}',1,'2026-03-09 16:25:06','2026-03-09 16:25:06','7c2af40b-c9a6-4a45-8d73-bd232cd85194'),(108,108,1,'ABOUT IMAGE','about-image',NULL,'{\"1e46aac1-8055-4a40-956c-08a9501f62af\": [105]}',1,'2026-03-09 16:25:06','2026-03-09 16:25:06','6b9beae4-d338-4349-b68a-d6650face2e8'),(110,110,1,'News & Blogs','blogs',NULL,NULL,1,'2026-03-10 08:54:42','2026-03-10 08:54:42','6f10bc09-d7f9-45c5-8199-e8db7c0e1c4a'),(111,111,1,'Downloads','downloads',NULL,NULL,1,'2026-03-10 08:54:51','2026-03-10 08:54:55','4a288a8b-b8b4-470e-8ec2-c004e6f52d59'),(112,112,1,'Downloads','downloads','downloads','{\"0f804d49-1940-4975-8bfc-a47dbe61e081\": \"this is an introduction to downloads\"}',1,'2026-03-10 09:05:54','2026-03-10 09:19:59','499269fa-62cd-4f42-9ae3-f0bcd33ad267'),(113,113,1,'Downloads','downloads','downloads',NULL,1,'2026-03-10 09:05:54','2026-03-10 09:05:54','86aa8534-39e1-4198-8e94-87c220715f0a'),(115,115,1,'Downloads','downloads','downloads','{\"0f804d49-1940-4975-8bfc-a47dbe61e081\": \"this is an introduction to downloads\"}',1,'2026-03-10 09:19:59','2026-03-10 09:19:59','14583a96-d71d-4f98-9929-99e2d9678f6e'),(116,116,1,NULL,'__temp_qusalcgreatzlbudcbfjifaoktswydpmvwav','test/__temp_qusalcgreatzlbudcbfjifaoktswydpmvwav',NULL,1,'2026-03-10 09:24:36','2026-03-10 09:24:36','c905647a-1f09-4241-a802-59687ac21c76'),(118,118,1,'Download','download',NULL,NULL,1,'2026-03-10 10:29:03','2026-03-10 10:29:10','66787c3e-0393-40c5-b95d-3b576991ea85'),(119,119,1,NULL,'__temp_zzbxitrzvfastfzouwbkdqvlrxaszubnencl',NULL,NULL,1,'2026-03-10 10:29:11','2026-03-10 10:29:29','62567887-7bf9-464b-8cba-6113991886a0'),(120,120,1,'EV Charging','ev-charging','test/ev-charging',NULL,1,'2026-03-10 10:31:02','2026-03-10 10:31:07','2f7fd285-2ddc-4b42-a1bb-070dbdaf92cf'),(121,121,1,'Marina Services','marina-services','test/marina-services',NULL,1,'2026-03-10 10:31:16','2026-03-10 10:31:22','828278bb-41af-4596-b333-42289369e342'),(122,122,1,'Caravan hook-ups','caravan-hook-ups','test/caravan-hook-ups',NULL,1,'2026-03-10 10:31:33','2026-03-10 10:31:51','b114175e-b541-4609-b49d-b6b2b38b2bdd'),(123,123,1,'Ev Charger Doc','ev-charger-doc','category/ev-charger-doc',NULL,1,'2026-03-10 10:37:14','2026-03-10 10:37:28','b8b888d1-1fe8-4289-b507-dd065e6b592e'),(124,124,1,NULL,'__temp_pslovrebxyqikoqgwptmtvwbsfkjbpzrguvt',NULL,NULL,1,'2026-03-10 10:37:28','2026-03-10 10:37:28','d9d616a8-8710-4020-b84c-371c61b67452'),(125,125,1,'EV Charger Doc 01','ev-charger-doc-01','category/ev-charger-doc-01',NULL,1,'2026-03-10 10:39:09','2026-03-10 10:39:19','85b1aeb3-8d65-4523-a1ea-c78da0df8e3a'),(126,126,1,NULL,'ev-charger-doc-1',NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:39:20','2026-03-10 10:45:51','013cd0ed-bff0-429d-bed2-1624abd181c6'),(127,127,1,'Sample',NULL,NULL,NULL,1,'2026-03-10 10:39:46','2026-03-10 10:39:46','9fd95e09-4f97-4579-8822-08de7c6fa587'),(128,128,1,NULL,'__temp_hafelxgrjmgbfwafulmqympdegqcfhqsjvxs','caravan-hook-ups/__temp_hafelxgrjmgbfwafulmqympdegqcfhqsjvxs',NULL,1,'2026-03-10 10:44:54','2026-03-10 10:44:54','a49137bb-eb0d-47b8-a2b1-df8849f1a4ab'),(129,129,1,'Caravan doc 01','caravan-doc-01','caravan-hook-ups/caravan-doc-01',NULL,1,'2026-03-10 10:45:02','2026-03-10 10:46:09','02ea0b13-b46d-412c-b9d2-c68be64844c5'),(131,131,1,NULL,'',NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:46:09','2026-03-10 10:46:15','5713fb07-d968-4f83-8300-8e8e9a1fa84b'),(132,132,1,NULL,'__temp_mqejysganwqkbdlwwpkjjddhpimlrmpbzfma','caravan-hook-ups/__temp_mqejysganwqkbdlwwpkjjddhpimlrmpbzfma',NULL,1,'2026-03-10 10:46:23','2026-03-10 10:46:23','2d9c9ded-ad38-4299-b147-f4f26118281c'),(133,133,1,'EV Charging doc','ev-charging-doc','ev-charging/ev-charging-doc',NULL,1,'2026-03-10 10:46:49','2026-03-10 10:46:58','b554f98f-6e2f-4199-9baa-e09dfdacaf27'),(134,134,1,NULL,'',NULL,NULL,1,'2026-03-10 10:46:58','2026-03-10 10:47:18','7736ed0d-f1f5-4c59-b9ed-ebd5735efc46'),(135,135,1,'Marina Services Document','marina-services','marina-services/marina-services',NULL,1,'2026-03-10 10:47:40','2026-03-10 10:48:16','1a524301-ed5b-48ec-90fe-754cfd1b64b2'),(136,136,1,NULL,NULL,NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:47:48','2026-03-10 10:48:16','5f2e1a34-7ff3-4705-b89b-1e098549761f'),(144,144,1,'Evo pic',NULL,NULL,NULL,1,'2026-03-10 10:54:40','2026-03-10 10:54:40','4ace3998-e720-4495-88f8-0a85a4a413f8'),(146,146,1,'Evo','evo',NULL,'{\"df229eae-e898-46ee-8170-d0a679b640a3\": [144]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','7e9b8c0c-53e5-437f-ad20-8fdac4364aa3'),(147,147,1,NULL,NULL,NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','845a16e0-5d10-4b01-9599-5084a448719b'),(148,148,1,NULL,NULL,NULL,'{\"7e1ae41b-93d9-48c5-8ef2-0db2c8a55351\": {\"type\": \"url\", \"value\": \"https://source.thenbs.com/product/rolec-evo-universal-socket-ev-charging-unit/c7gVHiA5Uj52zqvS8HJQSk/fQwkQZFYNfTc3xYz3BKQ5e\"}}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','34d7421e-af56-4952-b1b5-68faed36df8f'),(149,149,1,NULL,NULL,NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','816b67bd-77b3-4eea-8585-9d6fa5660294'),(150,150,1,'Downloads','downloads','downloads','{\"0f804d49-1940-4975-8bfc-a47dbe61e081\": \"this is an introduction to downloads\"}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','b9d94469-2168-4af9-8a5d-6e802b3f3862'),(151,151,1,'Evo','evo',NULL,'{\"df229eae-e898-46ee-8170-d0a679b640a3\": [144]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','4c56ffc8-6f7a-4beb-a980-7a13dc6b1af4'),(152,152,1,NULL,NULL,NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','3655d9b5-de26-4161-959b-2fd650f5f558'),(153,153,1,NULL,NULL,NULL,'{\"7e1ae41b-93d9-48c5-8ef2-0db2c8a55351\": {\"type\": \"url\", \"value\": \"https://source.thenbs.com/product/rolec-evo-universal-socket-ev-charging-unit/c7gVHiA5Uj52zqvS8HJQSk/fQwkQZFYNfTc3xYz3BKQ5e\"}}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','e1f037e0-2e04-493d-a8eb-4432ca596e50'),(154,154,1,NULL,NULL,NULL,'{\"7e05d6e7-a9c1-4e73-8657-22c470611781\": [127]}',1,'2026-03-10 10:54:47','2026-03-10 10:54:47','0119a85d-df8f-4b5b-9d8c-c340c2421af2'),(155,155,1,'Evo','evo','ev-charging/evo','{\"274b85f7-4e98-4e07-a76d-78d53ab581fb\": \"Evo body\"}',1,'2026-03-10 11:01:32','2026-03-10 11:01:45','93ed6bcb-3cab-4170-b0ec-c9eff625f503'),(156,156,1,'Evo','evo','ev-charging/evo','{\"274b85f7-4e98-4e07-a76d-78d53ab581fb\": \"Evo body\"}',1,'2026-03-10 11:01:46','2026-03-10 11:01:46','55e70783-e7bb-4623-9629-8467319ba8b4'),(157,157,1,'Direct connection units','direct-connection-units','caravan-hook-ups/direct-connection-units','{\"3ae63c5e-5d35-48e2-b84b-50fe89c6bba1\": \"Direct connection units body\"}',1,'2026-03-10 11:02:12','2026-03-10 11:02:26','7a2aaa1c-f947-47f0-8c8b-9d60b9ea1620'),(158,158,1,'Direct connection units','direct-connection-units','caravan-hook-ups/direct-connection-units','{\"3ae63c5e-5d35-48e2-b84b-50fe89c6bba1\": \"Direct connection units body\"}',1,'2026-03-10 11:02:35','2026-03-10 11:02:35','8354e077-6a11-42ec-b388-f577e934f42b'),(159,159,1,'Service Pedestals','service-pedestals','marina-services/service-pedestals','{\"3b4781e9-7088-4378-819b-d589093f5a41\": \"Service Pedestals 01\"}',1,'2026-03-10 11:03:04','2026-03-10 11:03:10','4823026c-d544-48d6-b0df-e21e3828437b'),(160,160,1,'Service Pedestals','service-pedestals','marina-services/service-pedestals','{\"3b4781e9-7088-4378-819b-d589093f5a41\": \"Service Pedestals 01\"}',1,'2026-03-10 11:03:12','2026-03-10 11:03:12','5b9e8b12-40ea-496c-9a16-cdf4b80d1e35'),(161,161,1,'Home','home',NULL,'{\"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-11 11:36:33','2026-03-11 11:36:33','d503a841-0bb4-4392-9bf7-0a50b026c486'),(162,162,1,'Download','download',NULL,NULL,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','21fb0b9e-9747-49ec-9708-6898c5631a47'),(163,163,1,NULL,'__temp_zzbxitrzvfastfzouwbkdqvlrxaszubnencl',NULL,NULL,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','f85680f0-e5c5-4db6-bbfe-6a59ba0de736'),(164,164,1,'Home','home',NULL,'{\"0d94ecae-3943-4c88-bf1c-ed92c86c0b1e\": [105], \"e083da58-5dc8-4d47-8e66-2f48812edeaa\": \"This is a home preview jjjj\"}',1,'2026-03-11 11:36:47','2026-03-11 11:36:47','487686e6-0c4f-4693-8866-b16b8aa93bf3'),(165,165,1,'Download','download',NULL,NULL,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','ee562d5a-81c3-4246-af95-7ce68e02e786'),(166,166,1,NULL,'__temp_zzbxitrzvfastfzouwbkdqvlrxaszubnencl',NULL,NULL,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','05c1cf87-c011-4de2-bc3e-bfc59d30a08e');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zhqzedfjgqgzhereeydmsacsaviqxxwswynx` (`postDate`),
  KEY `idx_nzflwmvimhpmioytozpusroosokvjhqiwwij` (`expiryDate`),
  KEY `idx_wbrmkutgdykkfahvkuxycrwdugtzxpfjrhem` (`status`),
  KEY `idx_vzzkskjfppumdruuwykqzwgdhjaprnubjexw` (`sectionId`),
  KEY `idx_xdwzltebjdekbnhgiqxnjhidcbkklxzjjgmo` (`typeId`),
  KEY `idx_ljmgpxtekbzhrfmcuweujbvdwqqmxomfefmn` (`primaryOwnerId`),
  KEY `idx_azqyhcdlilekgxcazczwvgbrloezjqpiedfp` (`fieldId`),
  KEY `fk_vwdehmhufonqqogejwwiinqtfhnyojsxpnwj` (`parentId`),
  CONSTRAINT `fk_dfyrvbvlvmrfupfoxtlcqbqjwagidialpqkf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_immtpjkekzivllcihbrdncsdmjrskqmopotk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jndmobbxqqjujnvtvcazkuncffoedxtzycts` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qneonjqvndzjcquxkrpndbagasxdhcousven` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwdehmhufonqqogejwwiinqtfhnyojsxpnwj` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xxlxfqdyfirtyfmuqvgleqdqhbxcbcbnsvkr` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-05 09:46:06','2026-03-05 09:46:06'),(3,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-05 09:46:06','2026-03-05 09:46:06'),(5,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-05 09:46:23','2026-03-05 09:46:23'),(6,2,NULL,NULL,NULL,2,'2026-03-05 10:38:00',NULL,'live',NULL,NULL,'2026-03-05 10:38:52','2026-03-05 10:38:57'),(7,2,NULL,NULL,NULL,2,'2026-03-05 10:38:00',NULL,'live',NULL,NULL,'2026-03-05 10:38:57','2026-03-05 10:38:57'),(8,2,NULL,NULL,NULL,2,'2026-03-05 10:39:00',NULL,'live',NULL,NULL,'2026-03-05 10:38:59','2026-03-05 10:39:03'),(9,2,NULL,NULL,NULL,2,'2026-03-05 10:39:00',NULL,'live',NULL,NULL,'2026-03-05 10:39:03','2026-03-05 10:39:03'),(11,2,NULL,NULL,NULL,2,'2026-03-05 10:39:00',NULL,'live',NULL,NULL,'2026-03-05 15:06:14','2026-03-05 15:06:14'),(12,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-06 11:41:05','2026-03-06 11:41:05'),(13,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-06 11:46:21','2026-03-06 11:46:21'),(20,NULL,NULL,2,2,4,'2026-03-06 11:51:00',NULL,'live',NULL,NULL,'2026-03-06 11:53:21','2026-03-06 11:53:21'),(21,NULL,NULL,2,2,6,'2026-03-06 11:53:00',NULL,'live',0,0,'2026-03-06 11:53:21','2026-03-06 11:53:21'),(22,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-06 11:53:21','2026-03-06 11:53:21'),(23,NULL,NULL,22,2,4,'2026-03-06 11:51:00',NULL,'live',NULL,NULL,'2026-03-06 11:53:21','2026-03-06 11:53:21'),(24,NULL,NULL,22,2,6,'2026-03-06 11:53:00',NULL,'live',NULL,NULL,'2026-03-06 11:53:21','2026-03-09 14:50:52'),(28,NULL,NULL,2,2,6,'2026-03-06 12:26:00',NULL,'live',NULL,NULL,'2026-03-06 12:26:28','2026-03-06 12:26:28'),(29,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-06 12:26:28','2026-03-06 12:26:28'),(30,NULL,NULL,29,2,6,'2026-03-06 12:26:00',NULL,'live',NULL,NULL,'2026-03-06 12:26:28','2026-03-06 12:26:28'),(32,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-09 09:15:28','2026-03-09 09:15:28'),(33,3,NULL,NULL,NULL,7,'2026-03-09 09:58:00',NULL,'live',NULL,1,'2026-03-09 09:58:19','2026-03-09 09:58:38'),(34,3,NULL,NULL,NULL,7,'2026-03-09 09:58:41',NULL,'live',NULL,1,'2026-03-09 09:58:41','2026-03-09 09:58:41'),(35,4,NULL,NULL,NULL,7,'2026-03-09 10:07:00',NULL,'live',0,0,'2026-03-09 10:07:36','2026-03-09 10:07:47'),(36,4,NULL,NULL,NULL,7,'2026-03-09 10:09:00',NULL,'live',0,0,'2026-03-09 10:09:05','2026-03-09 10:09:12'),(37,4,36,NULL,NULL,7,'2026-03-09 10:10:00',NULL,'live',0,0,'2026-03-09 10:09:20','2026-03-09 10:10:03'),(44,4,NULL,NULL,NULL,7,'2026-03-09 12:29:00',NULL,'live',0,0,'2026-03-09 12:28:47','2026-03-09 12:29:00'),(45,4,NULL,NULL,NULL,7,'2026-03-09 12:29:00',NULL,'live',0,0,'2026-03-09 12:29:02','2026-03-09 12:29:18'),(46,4,45,NULL,NULL,7,'2026-03-09 12:29:00',NULL,'live',0,0,'2026-03-09 12:29:23','2026-03-09 12:29:35'),(48,4,NULL,NULL,NULL,7,'2026-03-09 12:29:00',NULL,'live',NULL,NULL,'2026-03-09 13:11:23','2026-03-09 13:11:23'),(49,4,45,NULL,NULL,7,'2026-03-09 13:11:00',NULL,'live',0,0,'2026-03-09 13:11:29','2026-03-09 13:11:46'),(51,4,45,NULL,NULL,7,'2026-03-09 13:15:00',NULL,'live',0,0,'2026-03-09 13:14:46','2026-03-09 13:15:13'),(54,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',0,0,'2026-03-09 13:19:49','2026-03-09 13:20:00'),(55,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',0,0,'2026-03-09 13:20:46','2026-03-09 13:20:58'),(56,4,59,NULL,NULL,7,'2026-03-09 13:21:00',NULL,'live',0,0,'2026-03-09 13:21:01','2026-03-09 13:21:12'),(59,4,NULL,NULL,NULL,7,'2026-03-09 13:32:00',NULL,'live',0,0,'2026-03-09 13:32:18','2026-03-09 13:32:23'),(60,4,NULL,NULL,NULL,7,'2026-03-09 13:38:00',NULL,'live',NULL,NULL,'2026-03-09 13:38:09','2026-03-09 13:38:29'),(61,4,NULL,NULL,NULL,7,'2026-03-09 13:38:00',NULL,'live',NULL,NULL,'2026-03-09 13:38:29','2026-03-09 13:38:29'),(62,4,NULL,NULL,NULL,7,'2026-03-09 13:38:00',NULL,'live',NULL,NULL,'2026-03-09 13:38:36','2026-03-09 13:38:58'),(63,4,NULL,NULL,NULL,7,'2026-03-09 13:38:00',NULL,'live',NULL,NULL,'2026-03-09 13:38:58','2026-03-09 13:38:58'),(64,5,NULL,NULL,NULL,8,'2026-03-09 13:53:49',NULL,'live',1,NULL,'2026-03-09 13:53:49','2026-03-09 13:53:49'),(65,5,NULL,NULL,NULL,8,'2026-03-09 13:54:00',NULL,'live',1,NULL,'2026-03-09 13:53:57','2026-03-09 13:54:20'),(66,5,NULL,NULL,NULL,8,'2026-03-09 13:54:00',NULL,'live',NULL,NULL,'2026-03-09 13:54:20','2026-03-09 13:54:20'),(67,5,NULL,NULL,NULL,8,'2026-03-09 14:06:00',NULL,'live',1,NULL,'2026-03-09 14:05:20','2026-03-09 14:06:34'),(68,NULL,NULL,67,2,4,'2026-03-09 14:06:00',NULL,'live',NULL,NULL,'2026-03-09 14:05:51','2026-03-09 14:06:33'),(69,5,NULL,NULL,NULL,8,'2026-03-09 14:06:00',NULL,'live',NULL,NULL,'2026-03-09 14:06:34','2026-03-09 14:06:34'),(70,NULL,NULL,69,2,4,'2026-03-09 14:06:00',NULL,'live',NULL,NULL,'2026-03-09 14:06:34','2026-03-09 14:06:34'),(72,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:37:25','2026-03-09 14:37:25'),(73,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:37:25','2026-03-09 14:37:25'),(75,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:39:21','2026-03-09 14:39:21'),(77,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:48:12','2026-03-09 14:48:12'),(79,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-09 14:48:33','2026-03-09 14:48:33'),(81,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:50:00','2026-03-09 14:50:00'),(82,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-09 14:50:52','2026-03-09 14:50:52'),(83,4,NULL,NULL,NULL,7,'2026-03-09 13:20:00',NULL,'live',NULL,NULL,'2026-03-09 14:51:15','2026-03-09 14:51:15'),(85,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-09 14:52:07','2026-03-09 14:52:07'),(88,NULL,NULL,65,2,4,'2026-03-09 15:34:00',NULL,'live',NULL,NULL,'2026-03-09 15:35:58','2026-03-09 15:35:58'),(89,5,NULL,NULL,NULL,8,'2026-03-09 13:54:00',NULL,'live',NULL,NULL,'2026-03-09 15:35:58','2026-03-09 15:35:58'),(90,NULL,NULL,89,2,4,'2026-03-09 15:34:00',NULL,'live',NULL,NULL,'2026-03-09 15:35:58','2026-03-09 15:35:58'),(91,NULL,NULL,92,2,4,'2026-03-09 14:06:00',NULL,'live',NULL,NULL,'2026-03-09 15:36:08','2026-03-09 15:36:09'),(92,5,NULL,NULL,NULL,8,'2026-03-09 14:06:00',NULL,'live',NULL,NULL,'2026-03-09 15:36:08','2026-03-09 15:36:08'),(93,5,NULL,NULL,NULL,9,'2026-03-09 15:39:00',NULL,'live',NULL,NULL,'2026-03-09 15:39:04','2026-03-09 15:39:22'),(94,NULL,NULL,93,2,4,'2026-03-09 15:39:00',NULL,'live',NULL,NULL,'2026-03-09 15:39:13','2026-03-09 15:39:20'),(95,5,NULL,NULL,NULL,9,'2026-03-09 15:39:00',NULL,'live',NULL,NULL,'2026-03-09 15:39:22','2026-03-09 15:39:22'),(96,NULL,NULL,95,2,4,'2026-03-09 15:39:00',NULL,'live',NULL,NULL,'2026-03-09 15:39:22','2026-03-09 15:39:22'),(97,5,NULL,NULL,NULL,9,'2026-03-09 16:00:00',NULL,'live',NULL,NULL,'2026-03-09 16:00:37','2026-03-09 16:00:52'),(98,5,NULL,NULL,NULL,9,'2026-03-09 16:00:00',NULL,'live',NULL,NULL,'2026-03-09 16:00:52','2026-03-09 16:00:52'),(99,5,NULL,NULL,NULL,9,'2026-03-09 16:00:00',NULL,'live',NULL,NULL,'2026-03-09 16:09:20','2026-03-09 16:09:20'),(100,4,NULL,NULL,NULL,7,'2026-03-09 16:20:00',NULL,'live',NULL,NULL,'2026-03-09 16:20:24','2026-03-09 16:20:37'),(101,4,NULL,NULL,NULL,7,'2026-03-09 16:20:00',NULL,'live',NULL,NULL,'2026-03-09 16:20:37','2026-03-09 16:20:37'),(106,NULL,NULL,93,2,6,'2026-03-09 16:25:00',NULL,'live',NULL,NULL,'2026-03-09 16:25:06','2026-03-09 16:25:06'),(107,5,NULL,NULL,NULL,9,'2026-03-09 15:39:00',NULL,'live',NULL,NULL,'2026-03-09 16:25:06','2026-03-09 16:25:06'),(108,NULL,NULL,107,2,6,'2026-03-09 16:25:00',NULL,'live',NULL,NULL,'2026-03-09 16:25:06','2026-03-09 16:25:06'),(110,4,NULL,NULL,NULL,7,'2026-03-09 13:38:00',NULL,'live',NULL,NULL,'2026-03-10 08:54:42','2026-03-10 08:54:42'),(111,4,NULL,NULL,NULL,7,'2026-03-10 08:54:51',NULL,'live',NULL,NULL,'2026-03-10 08:54:51','2026-03-10 08:54:51'),(112,6,NULL,NULL,NULL,10,'2026-03-10 09:05:00',NULL,'live',NULL,NULL,'2026-03-10 09:05:54','2026-03-10 09:05:54'),(113,6,NULL,NULL,NULL,10,'2026-03-10 09:05:00',NULL,'live',NULL,NULL,'2026-03-10 09:05:54','2026-03-10 09:05:54'),(115,6,NULL,NULL,NULL,10,'2026-03-10 09:05:00',NULL,'live',NULL,NULL,'2026-03-10 09:19:59','2026-03-10 09:19:59'),(119,NULL,NULL,118,7,11,NULL,NULL,'pending',NULL,NULL,'2026-03-10 10:29:11','2026-03-10 10:29:11'),(124,NULL,NULL,123,7,11,NULL,NULL,'pending',NULL,NULL,'2026-03-10 10:37:28','2026-03-10 10:37:28'),(126,NULL,NULL,125,7,11,'2026-03-10 10:39:00',NULL,'live',NULL,NULL,'2026-03-10 10:39:20','2026-03-10 10:39:50'),(131,NULL,NULL,129,7,11,'2026-03-10 10:46:00',NULL,'live',NULL,NULL,'2026-03-10 10:46:09','2026-03-10 10:46:15'),(134,NULL,NULL,133,7,11,'2026-03-10 10:47:00',NULL,'live',NULL,NULL,'2026-03-10 10:46:58','2026-03-10 10:47:18'),(136,NULL,NULL,135,7,11,'2026-03-10 10:47:00',NULL,'live',NULL,NULL,'2026-03-10 10:47:48','2026-03-10 10:47:56'),(146,NULL,NULL,112,2,12,'2026-03-10 10:53:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(147,NULL,NULL,146,7,11,'2026-03-10 10:52:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(148,NULL,NULL,146,7,11,'2026-03-10 10:52:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(149,NULL,NULL,146,7,11,'2026-03-10 10:53:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(150,6,NULL,NULL,NULL,10,'2026-03-10 09:05:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(151,NULL,NULL,150,2,12,'2026-03-10 10:53:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(152,NULL,NULL,151,7,11,'2026-03-10 10:52:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(153,NULL,NULL,151,7,11,'2026-03-10 10:52:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(154,NULL,NULL,151,7,11,'2026-03-10 10:53:00',NULL,'live',NULL,NULL,'2026-03-10 10:54:47','2026-03-10 10:54:47'),(155,7,NULL,NULL,NULL,13,'2026-03-10 11:01:00',NULL,'live',NULL,NULL,'2026-03-10 11:01:32','2026-03-10 11:01:46'),(156,7,NULL,NULL,NULL,13,'2026-03-10 11:01:00',NULL,'live',NULL,NULL,'2026-03-10 11:01:46','2026-03-10 11:01:46'),(157,9,NULL,NULL,NULL,15,'2026-03-10 11:02:00',NULL,'live',NULL,NULL,'2026-03-10 11:02:12','2026-03-10 11:02:35'),(158,9,NULL,NULL,NULL,15,'2026-03-10 11:02:00',NULL,'live',NULL,NULL,'2026-03-10 11:02:35','2026-03-10 11:02:35'),(159,8,NULL,NULL,NULL,14,'2026-03-10 11:03:00',NULL,'live',NULL,NULL,'2026-03-10 11:03:04','2026-03-10 11:03:12'),(160,8,NULL,NULL,NULL,14,'2026-03-10 11:03:00',NULL,'live',NULL,NULL,'2026-03-10 11:03:12','2026-03-10 11:03:12'),(161,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:33','2026-03-11 11:36:33'),(162,NULL,NULL,2,2,12,'2026-03-11 11:36:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:47','2026-03-11 11:36:47'),(163,NULL,NULL,162,7,11,'2026-03-11 11:36:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:47','2026-03-11 11:36:47'),(164,1,NULL,NULL,NULL,1,'2026-03-05 09:46:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:47','2026-03-11 11:36:47'),(165,NULL,NULL,164,2,12,'2026-03-11 11:36:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:47','2026-03-11 11:36:47'),(166,NULL,NULL,165,7,11,'2026-03-11 11:36:00',NULL,'live',NULL,NULL,'2026-03-11 11:36:47','2026-03-11 11:36:47');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_anmpjojbnfxtoiuzmuyhguuflrbveynmjhps` (`authorId`),
  KEY `idx_haaziehxhuwbadulmauecanbtddvqbxnuchm` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_fjawdimqqnokoxvlbjqgiplbcpwweuptobzp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snkvrafcbovcjtbkhphveesbtlmgnocgxbsr` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
INSERT INTO `entries_authors` VALUES (6,1,1),(7,1,1),(8,1,1),(9,1,1),(11,1,1),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,1),(44,1,1),(45,1,1),(46,1,1),(48,1,1),(49,1,1),(51,1,1),(54,1,1),(55,1,1),(56,1,1),(59,1,1),(60,1,1),(61,1,1),(62,1,1),(63,1,1),(64,1,1),(65,1,1),(66,1,1),(67,1,1),(69,1,1),(72,1,1),(73,1,1),(75,1,1),(77,1,1),(81,1,1),(83,1,1),(89,1,1),(92,1,1),(93,1,1),(95,1,1),(97,1,1),(98,1,1),(99,1,1),(100,1,1),(101,1,1),(107,1,1),(110,1,1),(111,1,1),(155,1,1),(156,1,1),(157,1,1),(158,1,1),(159,1,1),(160,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `uiLabelFormat` varchar(255) NOT NULL DEFAULT '{title}',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `allowLineBreaksInTitles` tinyint(1) NOT NULL DEFAULT '0',
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dwkwbaqkahhfikispmlxrkaxwdzuabujtfqa` (`fieldLayoutId`),
  KEY `idx_exgivbgmzmpxcvlcmrgvjvkqablbuilsaelw` (`dateDeleted`),
  CONSTRAINT `fk_lkbqlijvyhuidlecieptmnlvcnptynuzcodb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,'homeEntry','homeentry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-05 09:45:27','2026-03-05 09:45:27',NULL,'add5f8a7-08ca-4430-83ab-e74311413432'),(2,2,'BlogEntry','blogentry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-05 10:38:42','2026-03-05 10:38:42',NULL,'a1207125-0943-4a3b-8f5d-54d8048b6d50'),(3,5,'pageBuilder','pagebuilder',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-06 11:34:34','2026-03-06 11:34:34',NULL,'9d6ecc3e-64e1-467b-aac5-b18914f04c95'),(4,6,'Hero','hero',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-06 11:35:23','2026-03-06 11:35:23',NULL,'b8912d86-aaee-44eb-9902-cb4e687f6f55'),(5,7,'Image Single','imageSingle',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-06 11:48:04','2026-03-06 11:48:04','2026-03-09 16:42:29','d9224a70-adfb-42a0-b7ab-bda791083b21'),(6,8,'ImageBlock','imageblock',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-06 11:50:28','2026-03-06 11:50:28',NULL,'86b1a055-2f4e-4c9b-8a59-98516e336d7a'),(7,9,'LinkItem','linkitem',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-09 09:52:48','2026-03-09 10:10:33',NULL,'de419883-87b5-42f0-8225-85aac6ae5fdd'),(8,10,'Default page','defaultPage',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-09 13:51:42','2026-03-09 13:51:42','2026-03-09 15:38:26','84ff1aff-44b3-4833-b629-b7f7a8afec5e'),(9,11,'pagesEntry','pagesEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-09 15:33:13','2026-03-09 15:33:13',NULL,'cdeed09c-d8b0-4d7a-89a6-afc58a5f3228'),(10,12,'Downloads Entry','downloadsEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 09:05:19','2026-03-10 09:05:19',NULL,'77f5d694-e74c-422a-8041-75d2b67ac9f5'),(11,14,'DownloadPicker','downloadpicker',NULL,NULL,NULL,'{title}',0,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 10:26:03','2026-03-10 10:45:48',NULL,'8df9f100-bb0a-4a3f-ac13-ee453361c437'),(12,15,'DownloadsBlock','downloadsblock',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 10:28:52','2026-03-10 10:28:52',NULL,'2b040aff-c847-4d45-8e0b-f3236ce46d86'),(13,19,'evCharging Entry','evchargingEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 10:58:13','2026-03-10 10:58:13',NULL,'57302291-a92e-4488-9dd7-a4a019ffa78b'),(14,20,'Marina Services Entry','marinaServicesEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 10:59:31','2026-03-10 10:59:31',NULL,'6c0be145-1a14-442b-985a-44b9658af58c'),(15,21,'CaravanEntry','caravanentry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-10 11:00:30','2026-03-10 11:00:30',NULL,'aff402df-4838-4da1-ba16-03efa924d0b9');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mcihamhybhsukexvnjhfcwumjqnaqwswocti` (`dateDeleted`),
  KEY `idx_oqnphyogzdmsqelzagajdrpnnslraomgxilf` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"833d4adb-f3a6-473c-810f-b9e124566f17\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"35c07311-3629-44be-a3a6-efaf2e0fd16e\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-05T09:44:07+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"e083da58-5dc8-4d47-8e66-2f48812edeaa\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-05T09:45:59+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0d94ecae-3943-4c88-bf1c-ed92c86c0b1e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2afaac93-3261-4654-a019-5b86c0839e17\", \"required\": false, \"dateAdded\": \"2026-03-11T11:36:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"6882ac21-272d-41ae-b783-35c7f546621a\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-06T11:46:17+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"df5ec4e7-1830-43a3-b83c-6530680e7533\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-06T11:46:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-05 09:45:27','2026-03-11 11:36:30',NULL,'3b95be7f-6a52-4c75-b669-f645666216cf'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"55460e21-45c2-4701-bc56-9f665eae4519\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2399a378-8036-425b-b276-543199527a2b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-05T10:37:28+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"022a3c7e-9a2f-47d6-84f1-18be129c7c7d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-05T15:06:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-05 10:38:42','2026-03-05 15:06:06',NULL,'e0455d87-7925-486f-8f7e-381bdf2dd7e5'),(3,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"137ddeb1-6879-4ce8-8fe4-5b0509d18f81\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"3d19df30-6f00-4c68-a1f2-4811bf789510\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-05T14:18:41+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"06a82cf7-d375-4958-a100-33eef4c87092\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-10T10:37:04+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-05 14:19:57','2026-03-10 10:37:04','2026-03-10 10:44:41','6bc5f341-0f7b-4b1f-9b29-9b797422fc42'),(4,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"14c06302-6c8d-4828-8c77-b6aa92bc21ac\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d4ac4512-fe65-4b8c-a71a-7c6c18f39f43\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-05T14:19:18+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-05 14:21:00','2026-03-05 14:21:00',NULL,'2093ee67-1965-45cb-a86f-b140f85fc3ea'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a62363eb-8177-4cd9-8512-d34770710832\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"085007df-9b37-49f9-b2e2-0e0bf670e1a6\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-06T11:32:57+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-06 11:34:34','2026-03-06 11:34:34',NULL,'0984bdeb-4979-4cb7-bc88-0c8190ee821c'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"01623365-bdc9-46e9-a6e3-43b7720aa33a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"f5b7527a-eb5b-4c1d-a494-1223c87cb70c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-06T11:34:05+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"6f8601ee-154f-4647-9b5e-62079483b2ef\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-06T11:35:23+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"031597e5-bc27-4137-a23e-554d9ada43bc\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-11T09:11:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-06 11:35:23','2026-03-11 09:11:29',NULL,'7dbbf6e6-689a-4124-bd95-d7cdb2770c76'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"b4dcbdc9-61a5-4ec1-bb36-3437036ec2a4\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"eefd0029-67ce-487a-b483-8e51c3c948f6\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-06T11:46:52+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"48a2b203-d113-4891-8e61-4b838970d19c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2afaac93-3261-4654-a019-5b86c0839e17\", \"required\": false, \"dateAdded\": \"2026-03-06T11:48:04+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-06 11:48:04','2026-03-06 11:48:04','2026-03-09 16:42:29','5ada9ac1-7be5-422b-9f70-69383a7ac607'),(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"99daa043-09cf-40a0-86d0-99ea58377d08\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d510557c-54ba-48c7-a530-cb9fb642cec4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-06T11:49:07+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"1e46aac1-8055-4a40-956c-08a9501f62af\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2afaac93-3261-4654-a019-5b86c0839e17\", \"required\": false, \"dateAdded\": \"2026-03-06T11:50:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-06 11:50:28','2026-03-06 11:50:28',NULL,'533149e1-2294-468a-9fc0-2cd45bfbc1c0'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"c7f95a36-2e68-419b-8048-1332007f06a9\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"5d528f51-9cd5-42e8-82de-fed0f2024573\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-09T10:10:33+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"2909518a-9d7d-44bf-8411-17f80ac3ff5b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"21778133-d80a-4ff2-b54b-51f28c730136\", \"required\": false, \"dateAdded\": \"2026-03-09T09:52:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-09 09:52:48','2026-03-09 10:10:33',NULL,'2cd954fe-0d8b-493e-864b-7abb20c5f4d9'),(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"16a917b5-68c1-4d16-b935-c5dc71e8f061\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"7ef45b06-c0e0-493e-8731-05e0d24e509d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-09T13:50:16+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"2b4120c5-dc1f-466e-8dfe-2ef02627253f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-09T13:51:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"f1f52a75-a76f-4245-b2c5-49ee1f6da42a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-09T13:51:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-09 13:51:42','2026-03-09 13:51:42','2026-03-09 15:38:26','e769202e-044d-467b-b34b-890a2ba6a7e5'),(11,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e53ea7db-c245-4605-b5d9-fc5cd1824ba8\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"f7731108-4463-4cdb-9f18-ab2dd2f05cbd\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-09T15:31:20+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"702a784b-9ebc-437d-aebe-22faa759420b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-09T15:33:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"af9d7047-8d46-44f8-b2c2-c05a1ee7a058\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-09T15:33:13+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3d41eb61-7608-46ac-87df-570e7b2a33de\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-09T15:33:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-09 15:33:13','2026-03-09 15:33:13',NULL,'12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d'),(12,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"844f9f79-02fc-459b-8c6e-018cee651a0f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"49005ac6-5136-4f54-bf08-4ca17af17284\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-10T09:03:55+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"0f804d49-1940-4975-8bfc-a47dbe61e081\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-10T09:05:19+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"a8d7f3ea-e357-41fb-abd6-989d024def89\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-10T09:05:19+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c110c6ae-b411-4593-b0be-eed9b57b8234\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-10T09:05:19+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 09:05:19','2026-03-10 09:05:19',NULL,'112491c3-5ec2-45e6-bfed-4755b851d7b6'),(13,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"73f623ac-a164-4887-bc7d-c539f064985a\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"61812ad5-aafb-4afe-bda0-d4b1f3d5962f\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-10T10:06:49+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"dateUpdated\", \"dateCreated\", \"kind\", \"dateModified\", \"size\", \"filename\", \"id\", \"link\"], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:21:33','2026-03-10 10:21:33',NULL,'17bb55c9-1713-4b80-88bf-3cf65ca5ce5b'),(14,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f9f5a0f4-18fa-4853-a116-22e051519918\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"7e05d6e7-a9c1-4e73-8657-22c470611781\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e16fdeab-a1c9-4eb0-93f4-26f76245de66\", \"required\": false, \"dateAdded\": \"2026-03-10T10:26:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"7e1ae41b-93d9-48c5-8ef2-0db2c8a55351\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"21778133-d80a-4ff2-b54b-51f28c730136\", \"required\": false, \"dateAdded\": \"2026-03-10T10:26:03+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:26:03','2026-03-10 10:45:48',NULL,'0248237a-e1f8-43fb-a878-74b4fd1b8b5d'),(15,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"2857632f-1ad0-4406-9a3d-5ae08f3572e3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2cd14bac-e9d8-413a-a03a-26ff3ac32c38\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-10T10:27:31+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"df229eae-e898-46ee-8170-d0a679b640a3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2afaac93-3261-4654-a019-5b86c0839e17\", \"required\": false, \"dateAdded\": \"2026-03-10T10:53:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"1c203145-7d57-436c-a313-5526c45a3755\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-10T10:28:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:28:52','2026-03-10 10:53:46',NULL,'38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27'),(16,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"83fd3cff-c0b2-4c66-913c-fb3e0ab91782\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"3dcb4f22-9fec-4203-84e0-82dbb2c0253e\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-10T10:40:19+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"69e30f61-e420-43ee-bc5c-4f5a2b66a008\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-10T10:41:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:41:49','2026-03-10 10:41:49',NULL,'60a5ec15-5619-4678-9291-90600bd8ac72'),(17,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"6b3f39d6-2cd4-4e4c-8841-708a7b28fc6c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"dbc5938d-f19b-47de-b579-be13037dac67\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-10T10:40:57+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"be727a10-7aa0-488b-a0b1-8ad339f68a91\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-10T10:43:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:43:31','2026-03-10 10:43:31',NULL,'415d8706-98c4-43fa-9ae4-3caf197bde91'),(18,'craft\\elements\\Category','{\"tabs\": [{\"uid\": \"f2147103-bada-4c4c-9ed9-44dd153b52f0\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a57d4e40-4995-4902-8d30-0aa584aa3f26\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-03-10T10:42:37+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"1e89198c-1b32-4462-a800-8c207cd3e074\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\", \"required\": false, \"dateAdded\": \"2026-03-10T10:43:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:43:52','2026-03-10 10:43:52',NULL,'1e1098ea-1240-445e-a1d4-3d286064b864'),(19,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e69167dd-5355-4be2-be18-72944c169e02\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d46af25b-a77a-42bc-b15c-87a39ad851c0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-10T10:56:18+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"274b85f7-4e98-4e07-a76d-78d53ab581fb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-10T10:58:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"37bcdc67-d781-457a-ab3e-446a883b3c8a\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-10T10:58:13+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"eb98b4a6-92a5-415c-87fe-f07485c11cb5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-10T10:58:13+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:58:13','2026-03-10 10:58:13',NULL,'59155c40-be67-428c-9cf2-1445dc896332'),(20,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e23eb4db-a14d-4477-8de8-90d8969aa4ca\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fd9a4f07-d115-4d06-99a9-55cb5df9d239\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-10T10:58:05+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"3b4781e9-7088-4378-819b-d589093f5a41\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-10T10:59:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"d6152af8-dd0b-430c-aa1f-4db8955dd64e\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-10T10:59:31+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"2dddc4a9-adc1-413f-9b87-f873f713c088\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-10T10:59:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 10:59:31','2026-03-10 10:59:31',NULL,'2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc'),(21,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"5752a524-e1d4-4826-a666-51446a5f200f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"05d3b601-1155-478d-aa32-64ac87749b49\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-10T10:59:07+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"3ae63c5e-5d35-48e2-b84b-50fe89c6bba1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\", \"required\": false, \"dateAdded\": \"2026-03-10T11:00:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"uid\": \"5650e0cf-f325-49ac-bec9-d21bcb162f0c\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2026-03-10T11:00:30+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"067e6350-a887-43a2-8249-c24dc4574ca5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"44cea8a4-9e92-45ca-be17-b7e04443c389\", \"required\": false, \"dateAdded\": \"2026-03-10T11:00:30+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-10 11:00:30','2026-03-10 11:00:30',NULL,'81946139-46e0-4425-b4cb-5d7db1ca1522');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_okaheraajusxhgvnvzmpeqjxuvuoakfkmano` (`handle`,`context`),
  KEY `idx_lnkxbyiicjwcssrkqvlwiyddgubtgbecesaw` (`context`),
  KEY `idx_zwioessgdcafreeiglqumzdoyqywnoeqlhau` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'Body','body','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"enlarged\"}','2026-03-05 09:45:57','2026-03-05 09:45:57',NULL,'9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c'),(2,'Page Builder','pagebuilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"cards\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":50,\"createButtonLabel\":null,\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"2f7b266a-df88-4000-846d-383293e57d56\":[]},\"entryTypes\":[{\"uid\":\"b8912d86-aaee-44eb-9902-cb4e687f6f55\",\"name\":\"HeroBlock\",\"group\":\"General\"},{\"uid\":\"86b1a055-2f4e-4c9b-8a59-98516e336d7a\",\"group\":\"General\"},{\"uid\":\"2b040aff-c847-4d45-8e0b-f3236ce46d86\",\"group\":\"General\"}]}','2026-03-06 11:35:25','2026-03-10 10:53:50',NULL,'44cea8a4-9e92-45ca-be17-b7e04443c389'),(3,'Image','image','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:eb1cb63c-522c-4d85-b36a-032c74affb66\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:eb1cb63c-522c-4d85-b36a-032c74affb66\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-03-06 11:47:40','2026-03-06 11:47:40',NULL,'2afaac93-3261-4654-a019-5b86c0839e17'),(4,'Link','linkHandle','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\",\"allowCustomSchemes\":\"\"}},\"types\":[\"entry\",\"url\"]}','2026-03-09 09:52:34','2026-03-09 09:52:34',NULL,'21778133-d80a-4ff2-b54b-51f28c730136'),(5,'Nav Link','navLink','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"de419883-87b5-42f0-8225-85aac6ae5fdd\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2026-03-09 09:53:00','2026-03-09 09:53:00','2026-03-09 10:16:05','3a7acd3f-870b-4430-a3e1-2c71a418bd09'),(6,'Downloads Assets','downloadsAssets','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"pdf\"],\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:2ade3efe-b97d-4fea-999b-8668f095bc4d\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-03-10 10:24:40','2026-03-10 10:24:40',NULL,'e16fdeab-a1c9-4eb0-93f4-26f76245de66'),(7,'Downloads Picker','downloadsPicker','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"cards\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":50,\"createButtonLabel\":null,\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"2f7b266a-df88-4000-846d-383293e57d56\":[]},\"entryTypes\":[{\"uid\":\"8df9f100-bb0a-4a3f-ac13-ee453361c437\",\"group\":\"General\"}]}','2026-03-10 10:26:57','2026-03-10 10:45:50',NULL,'dc4e6db4-ab95-4c47-8fce-6c7baa2df791');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lfrtdmlcjzgtiiwgbzlpqlwhubykdjwxqhlq` (`name`),
  KEY `idx_ettxluznhqocdmfzwvstrlpxsegosclqffth` (`handle`),
  KEY `idx_fhqjcmbykmtthhtszrombnrzeuzeqkdegzwj` (`fieldLayoutId`),
  KEY `idx_qgrsmedqhtbajtqgoqhstqslidcllobbesbn` (`sortOrder`),
  CONSTRAINT `fk_vyflvrcksjembaoczpgrbmseirfxbprnrtxh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xgwbzmvfldodcfakrnwlzfvyzekqifsxtiiy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.2f7b266a-df88-4000-846d-383293e57d56:read\", \"sections.089f3017-d69d-448a-9974-7dc9b0112620:read\", \"sections.64e10dcc-1c2f-401e-b7af-1b60721efc30:read\", \"sections.1ec0d828-056d-4ff9-8234-2c96071330fe:read\", \"sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36:read\", \"nestedentryfields.44cea8a4-9e92-45ca-be17-b7e04443c389:read\", \"volumes.eb1cb63c-522c-4d85-b36a-032c74affb66:read\", \"categorygroups.be2669d2-dbf5-4d06-9d52-714ef75884bd:read\"]',1,'2026-03-05 09:25:50','2026-03-09 15:55:38','924492c4-c232-422b-be86-fbeddc187cbd'),(2,'Demo','[\"sites.2f7b266a-df88-4000-846d-383293e57d56:read\", \"sections.089f3017-d69d-448a-9974-7dc9b0112620:read\", \"sections.64e10dcc-1c2f-401e-b7af-1b60721efc30:read\", \"sections.1ec0d828-056d-4ff9-8234-2c96071330fe:read\", \"sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36:read\", \"nestedentryfields.44cea8a4-9e92-45ca-be17-b7e04443c389:read\", \"volumes.eb1cb63c-522c-4d85-b36a-032c74affb66:read\", \"categorygroups.be2669d2-dbf5-4d06-9d52-714ef75884bd:read\"]',0,'2026-03-05 14:16:32','2026-03-09 15:08:39','7bea2ea3-e06a-4e0a-96a1-438f13b1da99');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_genuismmtqouwxizdrgqfctmirovubxjkuis` (`accessToken`),
  UNIQUE KEY `idx_upzgvwfuoeirsyfphbhitwvpqimsamfoweky` (`name`),
  KEY `fk_kmdvnwklfrlrhyosiabugkcegoqwklyrhevm` (`schemaId`),
  CONSTRAINT `fk_kmdvnwklfrlrhyosiabugkcegoqwklyrhevm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,'2026-03-09 15:55:42',NULL,'2026-03-05 09:46:43','2026-03-09 15:55:42','80b8af9a-8756-4add-b450-cb0ea537c022'),(2,'token','JppbuSM5YuODPTSPU8BJKdFc7wbBQLAm',1,NULL,'2026-03-11 11:19:40',2,'2026-03-05 10:25:38','2026-03-11 11:19:40','42de9b32-40b0-4b07-b7ea-947e6901e671');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ontjzyqrwyxlvrdpybejdgxthvtnnynilxnr` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES (1,27,'craft\\imagetransforms\\ImageTransformer','matcha.jpg',NULL,'_24x30_crop_center-center_none',1,0,0,'2026-03-09 16:23:56','2026-03-09 16:23:56','2026-03-09 16:23:56','145da552-1f65-4df2-9e1b-ad21c511c87f'),(2,27,'craft\\imagetransforms\\ImageTransformer','matcha.jpg',NULL,'_48x60_crop_center-center_none',1,0,0,'2026-03-09 16:23:56','2026-03-09 16:23:56','2026-03-09 16:23:56','16ecd0ac-0af5-4dda-842f-37a954f7af4b'),(3,19,'craft\\imagetransforms\\ImageTransformer','Rolec-EV-chargers.jpg',NULL,'_30x20_crop_center-center_none',0,0,1,'2026-03-09 16:23:56','2026-03-09 16:23:56','2026-03-11 11:36:48','9f5aa13e-b4fd-458f-a489-d331095ce623'),(4,19,'craft\\imagetransforms\\ImageTransformer','Rolec-EV-chargers.jpg',NULL,'_60x40_crop_center-center_none',0,0,1,'2026-03-09 16:23:56','2026-03-09 16:23:56','2026-03-11 11:36:48','f4894191-2475-499e-bd46-d9bc21983ec5'),(5,104,'craft\\imagetransforms\\ImageTransformer','Rolec-EV-chargers_2026-03-09-162452_gcko.jpg',NULL,'_30x20_crop_center-center_none',0,0,0,'2026-03-09 16:24:55','2026-03-09 16:24:55','2026-03-09 16:24:55','33f417c9-9f4b-4fe4-904b-1604f69fa851'),(6,104,'craft\\imagetransforms\\ImageTransformer','Rolec-EV-chargers_2026-03-09-162452_gcko.jpg',NULL,'_60x40_crop_center-center_none',0,0,0,'2026-03-09 16:24:55','2026-03-09 16:24:55','2026-03-09 16:24:55','8542275d-37f5-49b7-990c-7a4cfc6a64ca'),(7,105,'craft\\imagetransforms\\ImageTransformer','sample-pic.jpg',NULL,'_30x19_crop_center-center_none',1,0,0,'2026-03-09 16:25:01','2026-03-09 16:25:01','2026-03-09 16:25:01','b06c6ac1-2999-4269-936e-408a062e872d'),(8,105,'craft\\imagetransforms\\ImageTransformer','sample-pic.jpg',NULL,'_60x39_crop_center-center_none',1,0,0,'2026-03-09 16:25:01','2026-03-09 16:25:01','2026-03-09 16:25:06','f3cd1c47-29bc-4c4c-aecb-a6919820921a'),(9,144,'craft\\imagetransforms\\ImageTransformer','evo-pic.jpg',NULL,'_30x21_crop_center-center_none',1,0,0,'2026-03-10 10:54:40','2026-03-10 10:54:40','2026-03-10 10:54:40','c7fe7b72-55ce-454e-b255-94a502f78d2b'),(10,144,'craft\\imagetransforms\\ImageTransformer','evo-pic.jpg',NULL,'_60x43_crop_center-center_none',1,0,0,'2026-03-10 10:54:40','2026-03-10 10:54:40','2026-03-10 10:54:40','9e205ba7-de04-4fad-9c10-d897c80bd3c3');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gbfjmmtzhaseavvszgytgrykodauvbhhzeke` (`name`),
  KEY `idx_rdmgccktjuqmxbbubpdwpqmrzoygwvkggkcf` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'5.9.14','5.9.0.8',0,'hbgpaxdmzura','3@dfrsbilunu','2026-03-05 09:24:30','2026-03-11 11:36:30','a0622f7a-8485-4dcb-879c-f5de72173b02');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqbzbmkbwdcnmtfknitqmdtoegebpxtikmfh` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','c169031a-26ce-4fb6-899f-325391c757a2'),(2,'craft','m221101_115859_create_entries_authors_table','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','d49d6a4d-053a-48fc-b26d-ce904a316f36'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','5e47e8ae-5e30-411c-a608-f5500b776fe5'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','3ee91a46-2a7b-49db-9960-e820fe7ac154'),(5,'craft','m230314_110309_add_authenticator_table','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','fcd3cba2-c004-46da-b2f2-bf5d73835e02'),(6,'craft','m230314_111234_add_webauthn_table','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','aa633116-98fe-482a-aff4-d8f7c6fa2365'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','65e8f85a-e124-4c93-a19a-5618360d0a73'),(8,'craft','m230511_000000_field_layout_configs','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','4f526362-4aaa-4acc-aca7-8611c5592fe7'),(9,'craft','m230511_215903_content_refactor','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','431cf9d7-26d7-4d90-b866-a5fe1b7d1e62'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','7e987b5b-b829-4a69-a358-6694ae79f357'),(11,'craft','m230524_000001_entry_type_icons','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','8b13b757-98b4-4359-bfb2-9d696ef01337'),(12,'craft','m230524_000002_entry_type_colors','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','a2c27f5f-4fa3-4094-af4f-36039510d30d'),(13,'craft','m230524_220029_global_entry_types','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','cdb5836c-8d97-4133-843b-b6edd4e4ba52'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','139b136c-a31a-4650-928b-6dc7a59bae85'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','a84ddad3-a2ad-4f29-8ca7-4d606de38d79'),(16,'craft','m230616_173810_kill_field_groups','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','23612707-3645-4b6c-88a1-0f3f51c64305'),(17,'craft','m230616_183820_remove_field_name_limit','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','7f43513d-784a-40bb-b056-33967dd9a8b3'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','55b43ec1-029c-45dd-ad15-28262659def5'),(19,'craft','m230710_162700_element_activity','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','2bf31f6e-00db-406b-bc9f-e52cf194a035'),(20,'craft','m230820_162023_fix_cache_id_type','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','a34e7fc9-0050-4781-9527-a4097c83010e'),(21,'craft','m230826_094050_fix_session_id_type','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','1e6c8ceb-59f2-4935-b6e3-152b424de143'),(22,'craft','m230904_190356_address_fields','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','6f706684-c1ac-473c-967d-cb830a9d0ff4'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','cc9928c9-d5db-4458-bf5e-8e1d4a8fee7d'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','f8b73fb0-02af-4e67-a946-fe8a170a1a6e'),(25,'craft','m231213_030600_element_bulk_ops','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','40740ff9-6e0e-4994-9df2-2cea6213cd94'),(26,'craft','m240129_150719_sites_language_amend_length','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','6b1bc573-8dc7-4215-97d6-95dc212ca151'),(27,'craft','m240206_035135_convert_json_columns','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','69a6ecce-f19a-407b-a0a1-9d9ad439b2e2'),(28,'craft','m240207_182452_address_line_3','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','cf814668-279c-4507-823c-5e6ca806f203'),(29,'craft','m240302_212719_solo_preview_targets','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','067d41de-bb55-47e4-8c3c-5c2139d8c712'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','7e306e0d-09ae-4b29-bf01-c94c82b658a6'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','e70ed91a-5512-440b-bb5a-3717b7d20ef5'),(32,'craft','m240731_053543_soft_delete_fields','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','352f235c-1bd3-4232-9d64-d96414044d8d'),(33,'craft','m240805_154041_sso_identities','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','02ecae83-d648-4f9e-83cb-914fb2ea48d7'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','cb483d92-eb0d-4a2c-b9e8-722e5e6447a6'),(35,'craft','m241120_190905_user_affiliated_sites','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','dc94a7fd-39bc-4e79-9e48-c3d821c91f94'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','3a5ac6f3-65e9-4bf3-8051-061647eaf144'),(37,'craft','m250119_135304_entry_type_overrides','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','bc740813-c536-49a5-8823-d329d3a68da5'),(38,'craft','m250206_135036_search_index_queue','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','e7051713-e719-4af5-ad5c-ef6025d52bc4'),(39,'craft','m250207_172349_bulkop_events','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','0d7849ab-379a-4022-854c-c353634914e4'),(40,'craft','m250315_131608_unlimited_authors','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','54c6a8cd-85fa-4d5d-a657-fa8ea25a3310'),(41,'craft','m250403_171253_static_statuses','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','c986dda8-a0f1-43fd-97ee-2f45436ea695'),(42,'craft','m250512_164202_asset_mime_types','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','ea10d868-c120-422d-a9e2-ab9d25ed962c'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','ffe04de0-8d83-4203-ab92-b4b857d9b88b'),(44,'craft','m250531_183058_content_blocks','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','70349ad2-d4ae-4134-ab0e-7044d1e17d30'),(45,'craft','m250623_105031_entry_type_descriptions','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','2193f453-a69e-49cd-b951-49def5ac9b80'),(46,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','8f0d2ca1-0303-4b91-96c1-f5aa51d311f3'),(47,'craft','m251030_203440_drop_widgets_enabled_column','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','6500fdf2-eac9-488c-8f9e-cb1e3de62ed8'),(48,'craft','m251110_192405_entry_type_ui_label_formats','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','581fbdbe-6281-4f49-8bd2-6c73b52ceccd'),(49,'craft','m251205_190131_drop_searchindexqueue_fk','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','7ba65468-f587-4a03-9a32-0ea29e953758'),(50,'craft','m251230_192239_update_field_layouts','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','49138dfa-c47b-41b0-90fd-43cf5a455051'),(51,'craft','m260106_130629_directive_schema_components','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','558dc7ee-4369-4ddf-91cf-3c0dc2e7ede4'),(52,'craft','m260120_120907_line_breaks_in_titles','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','d243dfd3-c9de-4a96-93cd-801b7dee0515'),(53,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-05 09:24:31','03d3b965-951d-4ea8-a5d6-50d0d40a48c4'),(54,'plugin:ckeditor','m260220_182920_drop_cke_configs','2026-03-06 11:49:06','2026-03-06 11:49:06','2026-03-06 11:49:06','d6512119-a160-4efb-ac17-d72deae8d55e');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lakegtmvnfjppslmpxgkrcogivafmattjwgs` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'ckeditor','5.1.0','5.0.0.1','2026-03-06 11:49:06','2026-03-06 11:49:06','2026-03-06 11:49:06','65700e60-65bb-4fd4-bf5b-c12ffdb4297f');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.defaultPlacement','\"end\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.cardThumbAlignment','\"end\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elementCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.autocomplete','false'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.autocorrect','true'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.class','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.dateAdded','\"2026-03-10T10:40:19+00:00\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.disabled','false'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.elementCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.id','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.inputType','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.instructions','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.label','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.max','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.min','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.name','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.orientation','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.placeholder','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.readonly','false'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.requirable','false'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.size','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.step','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.tip','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.title','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.uid','\"3dcb4f22-9fec-4203-84e0-82dbb2c0253e\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.userCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.warning','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.0.width','100'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.dateAdded','\"2026-03-10T10:41:49+00:00\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.editCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.elementCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.elementEditCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.fieldUid','\"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.handle','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.instructions','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.label','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.required','false'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.tip','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.uid','\"69e30f61-e420-43ee-bc5c-4f5a2b66a008\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.userCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.warning','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.elements.1.width','100'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.name','\"Content\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.uid','\"83fd3cff-c0b2-4c66-913c-fb3e0ab91782\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.tabs.0.userCondition','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.fieldLayouts.60a5ec15-5619-4678-9291-90600bd8ac72.thumbFieldKey','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.handle','\"evCharging\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.name','\"EV Charging\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"ev-charging/{slug}\"'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.structure.maxLevels','null'),('categoryGroups.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf.structure.uid','\"8b47240e-339d-4e1f-b595-deb130b51fc7\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.defaultPlacement','\"end\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.cardThumbAlignment','\"end\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elementCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.autocomplete','false'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.autocorrect','true'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.class','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.dateAdded','\"2026-03-10T10:42:37+00:00\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.disabled','false'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.elementCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.id','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.inputType','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.instructions','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.label','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.max','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.min','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.name','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.orientation','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.placeholder','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.readonly','false'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.requirable','false'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.size','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.step','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.tip','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.title','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.uid','\"a57d4e40-4995-4902-8d30-0aa584aa3f26\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.userCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.warning','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.0.width','100'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.dateAdded','\"2026-03-10T10:43:52+00:00\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.editCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.elementCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.elementEditCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.fieldUid','\"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.handle','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.instructions','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.label','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.required','false'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.tip','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.uid','\"1e89198c-1b32-4462-a800-8c207cd3e074\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.userCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.warning','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.elements.1.width','100'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.name','\"Content\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.uid','\"f2147103-bada-4c4c-9ed9-44dd153b52f0\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.tabs.0.userCondition','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.fieldLayouts.1e1098ea-1240-445e-a1d4-3d286064b864.thumbFieldKey','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.handle','\"caravanHookUps\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.name','\"Caravan Hook Ups\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"caravan-hook-ups/{slug}\"'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.structure.maxLevels','null'),('categoryGroups.3bf63914-a732-4f5f-914f-526a648953e2.structure.uid','\"9b7efcea-bf5f-4756-bafe-bd8edaf57716\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.defaultPlacement','\"end\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.cardThumbAlignment','\"end\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elementCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.autocomplete','false'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.autocorrect','true'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.class','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.dateAdded','\"2026-03-10T10:40:57+00:00\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.disabled','false'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.elementCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.id','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.inputType','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.instructions','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.label','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.max','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.min','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.name','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.orientation','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.placeholder','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.readonly','false'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.requirable','false'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.size','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.step','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.tip','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.title','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.uid','\"dbc5938d-f19b-47de-b579-be13037dac67\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.userCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.warning','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.0.width','100'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.dateAdded','\"2026-03-10T10:43:31+00:00\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.editCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.elementCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.elementEditCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.fieldUid','\"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.handle','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.instructions','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.label','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.required','false'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.tip','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.uid','\"be727a10-7aa0-488b-a0b1-8ad339f68a91\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.userCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.warning','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.elements.1.width','100'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.name','\"Content\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.uid','\"6b3f39d6-2cd4-4e4c-8841-708a7b28fc6c\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.tabs.0.userCondition','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.fieldLayouts.415d8706-98c4-43fa-9ae4-3caf197bde91.thumbFieldKey','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.handle','\"marinaServices\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.name','\"Marina Services\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"marina-services/{slug}\"'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.structure.maxLevels','null'),('categoryGroups.fb70777d-d33c-4c53-9467-f431d2bccfe0.structure.uid','\"e3b04e12-564f-45de-8cbc-9d666672db10\"'),('dateModified','1773228990'),('elementSources.craft\\elements\\Asset.0.defaultSort.0','\"dateCreated\"'),('elementSources.craft\\elements\\Asset.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Asset.0.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Asset.0.disabled','false'),('elementSources.craft\\elements\\Asset.0.key','\"volume:eb1cb63c-522c-4d85-b36a-032c74affb66\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.0.type','\"native\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.0','\"dateCreated\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Asset.1.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Asset.1.disabled','false'),('elementSources.craft\\elements\\Asset.1.key','\"temp\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.1.type','\"native\"'),('elementSources.craft\\elements\\Category.0.defaultSort.0','\"structure\"'),('elementSources.craft\\elements\\Category.0.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Category.0.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Category.0.disabled','false'),('elementSources.craft\\elements\\Category.0.key','\"group:be2669d2-dbf5-4d06-9d52-714ef75884bd\"'),('elementSources.craft\\elements\\Category.0.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Category.0.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Category.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"singles\"'),('elementSources.craft\\elements\\Entry.1.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.10.key','\"section:8af35cd4-be51-45ea-a707-5d64165187e3\"'),('elementSources.craft\\elements\\Entry.10.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.10.type','\"native\"'),('elementSources.craft\\elements\\Entry.11.key','\"section:6f0ea29d-909b-4f4a-8b12-3783e1b01b27\"'),('elementSources.craft\\elements\\Entry.11.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.11.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.heading','\"Channels\"'),('elementSources.craft\\elements\\Entry.2.key','\"heading:32d86bce-a502-485d-a45d-5b91666430d1\"'),('elementSources.craft\\elements\\Entry.2.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.2.type','\"heading\"'),('elementSources.craft\\elements\\Entry.3.key','\"section:64e10dcc-1c2f-401e-b7af-1b60721efc30\"'),('elementSources.craft\\elements\\Entry.3.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('elementSources.craft\\elements\\Entry.4.heading','\"Structures\"'),('elementSources.craft\\elements\\Entry.4.key','\"heading:3aa76ca8-9ab7-4c19-96fc-9e9d0c1985d4\"'),('elementSources.craft\\elements\\Entry.4.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.4.type','\"heading\"'),('elementSources.craft\\elements\\Entry.5.key','\"section:1aeb2341-a2cc-427e-964c-9b459fa9ae36\"'),('elementSources.craft\\elements\\Entry.5.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.5.type','\"native\"'),('elementSources.craft\\elements\\Entry.6.heading','\"Pages\"'),('elementSources.craft\\elements\\Entry.6.key','\"heading:36b39199-410d-4812-864d-6c15af812dfa\"'),('elementSources.craft\\elements\\Entry.6.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.6.type','\"heading\"'),('elementSources.craft\\elements\\Entry.7.defaultSort.0','\"structure\"'),('elementSources.craft\\elements\\Entry.7.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.7.defaultViewMode','\"\"'),('elementSources.craft\\elements\\Entry.7.disabled','false'),('elementSources.craft\\elements\\Entry.7.key','\"section:1ec0d828-056d-4ff9-8234-2c96071330fe\"'),('elementSources.craft\\elements\\Entry.7.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.0','\"status\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.3','\"authors\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Entry.7.type','\"native\"'),('elementSources.craft\\elements\\Entry.8.heading','\"Services\"'),('elementSources.craft\\elements\\Entry.8.key','\"heading:adeb8945-29e3-4555-b212-a74dfe25c949\"'),('elementSources.craft\\elements\\Entry.8.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.8.type','\"heading\"'),('elementSources.craft\\elements\\Entry.9.key','\"section:5a09ccc2-58be-4b23-a044-18e30847f91f\"'),('elementSources.craft\\elements\\Entry.9.page','\"Entries\"'),('elementSources.craft\\elements\\Entry.9.type','\"native\"'),('email.fromEmail','\"mel@mel.com\"'),('email.fromName','\"craftdemo\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.allowLineBreaksInTitles','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.color','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.description','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.cardThumbAlignment','\"end\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elementCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.autocapitalize','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.autocomplete','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.autocorrect','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.class','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.dateAdded','\"2026-03-10T10:27:31+00:00\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.disabled','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.elementCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.id','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.inputType','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.instructions','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.label','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.max','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.min','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.name','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.orientation','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.placeholder','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.readonly','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.required','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.size','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.step','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.tip','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.title','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.uid','\"2cd14bac-e9d8-413a-a03a-26ff3ac32c38\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.userCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.warning','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.0.width','100'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.dateAdded','\"2026-03-10T10:53:46+00:00\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.editCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.elementCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.fieldUid','\"2afaac93-3261-4654-a019-5b86c0839e17\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.handle','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.instructions','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.label','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.required','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.tip','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.uid','\"df229eae-e898-46ee-8170-d0a679b640a3\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.userCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.warning','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.1.width','100'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.dateAdded','\"2026-03-10T10:28:52+00:00\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.editCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.elementCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.fieldUid','\"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.handle','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.instructions','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.label','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.required','false'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.tip','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.uid','\"1c203145-7d57-436c-a313-5526c45a3755\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.userCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.warning','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.elements.2.width','100'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.name','\"Content\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.uid','\"2857632f-1ad0-4406-9a3d-5ae08f3572e3\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.tabs.0.userCondition','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.fieldLayouts.38fc8fa7-cd88-4e5a-bfb9-089dbbf8aa27.thumbFieldKey','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.handle','\"downloadsblock\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.hasTitleField','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.icon','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.name','\"DownloadsBlock\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.showSlugField','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.showStatusField','true'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.slugTranslationKeyFormat','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.slugTranslationMethod','\"site\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.titleFormat','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.titleTranslationKeyFormat','null'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.titleTranslationMethod','\"site\"'),('entryTypes.2b040aff-c847-4d45-8e0b-f3236ce46d86.uiLabelFormat','\"{title}\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.allowLineBreaksInTitles','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.color','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.description','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.cardThumbAlignment','\"end\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elementCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.autocapitalize','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.autocomplete','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.autocorrect','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.class','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.dateAdded','\"2026-03-10T10:56:18+00:00\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.disabled','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.elementCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.id','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.inputType','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.instructions','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.label','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.max','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.min','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.name','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.orientation','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.placeholder','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.readonly','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.required','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.size','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.step','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.tip','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.title','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.uid','\"d46af25b-a77a-42bc-b15c-87a39ad851c0\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.userCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.warning','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.0.width','100'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.dateAdded','\"2026-03-10T10:58:13+00:00\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.editCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.elementCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.handle','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.instructions','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.label','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.required','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.tip','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.uid','\"274b85f7-4e98-4e07-a76d-78d53ab581fb\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.userCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.warning','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.1.width','100'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.2.dateAdded','\"2026-03-10T10:58:13+00:00\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.2.elementCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.2.uid','\"37bcdc67-d781-457a-ab3e-446a883b3c8a\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.2.userCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.dateAdded','\"2026-03-10T10:58:13+00:00\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.editCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.elementCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.handle','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.instructions','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.label','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.required','false'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.tip','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.uid','\"eb98b4a6-92a5-415c-87fe-f07485c11cb5\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.userCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.warning','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.elements.3.width','100'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.name','\"Content\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.uid','\"e69167dd-5355-4be2-be18-72944c169e02\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.tabs.0.userCondition','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.fieldLayouts.59155c40-be67-428c-9cf2-1445dc896332.thumbFieldKey','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.handle','\"evchargingEntry\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.hasTitleField','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.icon','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.name','\"evCharging Entry\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.showSlugField','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.showStatusField','true'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.slugTranslationKeyFormat','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.slugTranslationMethod','\"site\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.titleFormat','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.titleTranslationKeyFormat','null'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.titleTranslationMethod','\"site\"'),('entryTypes.57302291-a92e-4488-9dd7-a4a019ffa78b.uiLabelFormat','\"{title}\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.allowLineBreaksInTitles','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.color','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.description','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.cardThumbAlignment','\"end\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elementCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.autocomplete','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.autocorrect','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.class','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.dateAdded','\"2026-03-10T10:58:05+00:00\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.disabled','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.elementCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.id','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.inputType','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.instructions','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.label','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.max','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.min','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.name','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.orientation','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.placeholder','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.readonly','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.required','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.size','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.step','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.tip','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.title','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.uid','\"fd9a4f07-d115-4d06-99a9-55cb5df9d239\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.userCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.warning','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.0.width','100'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.dateAdded','\"2026-03-10T10:59:31+00:00\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.editCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.elementCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.handle','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.instructions','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.label','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.required','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.tip','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.uid','\"3b4781e9-7088-4378-819b-d589093f5a41\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.userCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.warning','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.1.width','100'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.2.dateAdded','\"2026-03-10T10:59:31+00:00\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.2.elementCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.2.uid','\"d6152af8-dd0b-430c-aa1f-4db8955dd64e\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.2.userCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.dateAdded','\"2026-03-10T10:59:31+00:00\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.editCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.elementCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.handle','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.instructions','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.label','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.required','false'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.tip','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.uid','\"2dddc4a9-adc1-413f-9b87-f873f713c088\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.userCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.warning','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.elements.3.width','100'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.name','\"Content\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.uid','\"e23eb4db-a14d-4477-8de8-90d8969aa4ca\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.tabs.0.userCondition','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.fieldLayouts.2f7f12d8-1cdc-4ecb-992a-7cb9723bd0cc.thumbFieldKey','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.handle','\"marinaServicesEntry\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.hasTitleField','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.icon','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.name','\"Marina Services Entry\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.showSlugField','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.showStatusField','true'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.slugTranslationKeyFormat','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.slugTranslationMethod','\"site\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.titleFormat','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.titleTranslationKeyFormat','null'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.titleTranslationMethod','\"site\"'),('entryTypes.6c0be145-1a14-442b-985a-44b9658af58c.uiLabelFormat','\"{title}\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.allowLineBreaksInTitles','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.color','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.description','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.cardThumbAlignment','\"end\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elementCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.autocapitalize','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.autocomplete','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.autocorrect','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.class','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.dateAdded','\"2026-03-10T09:03:55+00:00\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.disabled','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.elementCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.id','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.inputType','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.instructions','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.label','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.max','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.min','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.name','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.orientation','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.placeholder','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.readonly','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.required','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.size','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.step','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.tip','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.title','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.uid','\"49005ac6-5136-4f54-bf08-4ca17af17284\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.userCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.warning','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.0.width','100'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.dateAdded','\"2026-03-10T09:05:19+00:00\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.editCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.elementCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.handle','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.instructions','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.label','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.required','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.tip','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.uid','\"0f804d49-1940-4975-8bfc-a47dbe61e081\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.userCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.warning','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.1.width','100'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.2.dateAdded','\"2026-03-10T09:05:19+00:00\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.2.elementCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.2.uid','\"a8d7f3ea-e357-41fb-abd6-989d024def89\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.2.userCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.dateAdded','\"2026-03-10T09:05:19+00:00\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.editCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.elementCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.handle','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.instructions','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.label','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.required','false'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.tip','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.uid','\"c110c6ae-b411-4593-b0be-eed9b57b8234\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.userCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.warning','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.elements.3.width','100'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.name','\"Content\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.uid','\"844f9f79-02fc-459b-8c6e-018cee651a0f\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.tabs.0.userCondition','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.fieldLayouts.112491c3-5ec2-45e6-bfed-4755b851d7b6.thumbFieldKey','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.handle','\"downloadsEntry\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.hasTitleField','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.icon','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.name','\"Downloads Entry\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.showSlugField','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.showStatusField','true'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.slugTranslationKeyFormat','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.slugTranslationMethod','\"site\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.titleFormat','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.titleTranslationKeyFormat','null'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.titleTranslationMethod','\"site\"'),('entryTypes.77f5d694-e74c-422a-8041-75d2b67ac9f5.uiLabelFormat','\"{title}\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.allowLineBreaksInTitles','false'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.color','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.description','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.cardThumbAlignment','\"end\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elementCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.autocapitalize','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.autocomplete','false'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.autocorrect','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.class','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.dateAdded','\"2026-03-06T11:49:07+00:00\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.disabled','false'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.elementCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.id','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.inputType','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.instructions','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.label','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.max','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.min','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.name','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.orientation','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.placeholder','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.readonly','false'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.required','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.size','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.step','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.tip','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.title','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.uid','\"d510557c-54ba-48c7-a530-cb9fb642cec4\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.userCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.warning','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.0.width','100'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.dateAdded','\"2026-03-06T11:50:28+00:00\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.editCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.elementCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.fieldUid','\"2afaac93-3261-4654-a019-5b86c0839e17\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.handle','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.instructions','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.label','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.required','false'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.tip','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.uid','\"1e46aac1-8055-4a40-956c-08a9501f62af\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.userCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.warning','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.elements.1.width','100'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.name','\"Content\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.uid','\"99daa043-09cf-40a0-86d0-99ea58377d08\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.tabs.0.userCondition','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.fieldLayouts.533149e1-2294-468a-9fc0-2cd45bfbc1c0.thumbFieldKey','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.handle','\"imageblock\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.hasTitleField','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.icon','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.name','\"ImageBlock\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.showSlugField','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.showStatusField','true'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.slugTranslationKeyFormat','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.slugTranslationMethod','\"site\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.titleFormat','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.titleTranslationKeyFormat','null'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.titleTranslationMethod','\"site\"'),('entryTypes.86b1a055-2f4e-4c9b-8a59-98516e336d7a.uiLabelFormat','\"{title}\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.allowLineBreaksInTitles','false'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.color','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.description','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.cardThumbAlignment','\"end\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elementCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.dateAdded','\"2026-03-10T10:26:03+00:00\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.editCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.elementCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.elementEditCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.fieldUid','\"e16fdeab-a1c9-4eb0-93f4-26f76245de66\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.handle','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.instructions','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.label','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.required','false'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.tip','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.uid','\"7e05d6e7-a9c1-4e73-8657-22c470611781\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.userCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.warning','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.0.width','100'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.dateAdded','\"2026-03-10T10:26:03+00:00\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.editCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.elementCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.fieldUid','\"21778133-d80a-4ff2-b54b-51f28c730136\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.handle','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.instructions','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.label','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.required','false'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.tip','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.uid','\"7e1ae41b-93d9-48c5-8ef2-0db2c8a55351\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.userCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.warning','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.elements.1.width','100'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.name','\"Content\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.uid','\"f9f5a0f4-18fa-4853-a116-22e051519918\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.tabs.0.userCondition','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.fieldLayouts.0248237a-e1f8-43fb-a878-74b4fd1b8b5d.thumbFieldKey','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.handle','\"downloadpicker\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.hasTitleField','false'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.icon','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.name','\"DownloadPicker\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.showSlugField','true'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.showStatusField','true'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.slugTranslationKeyFormat','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.slugTranslationMethod','\"site\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.titleFormat','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.titleTranslationKeyFormat','null'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.titleTranslationMethod','\"site\"'),('entryTypes.8df9f100-bb0a-4a3f-ac13-ee453361c437.uiLabelFormat','\"{title}\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.allowLineBreaksInTitles','false'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.color','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.description','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.cardThumbAlignment','\"end\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elementCondition','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.autocomplete','false'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.autocorrect','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.class','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.dateAdded','\"2026-03-06T11:32:57+00:00\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.disabled','false'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.elementCondition','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.id','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.inputType','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.instructions','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.label','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.max','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.min','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.name','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.orientation','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.placeholder','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.readonly','false'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.required','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.size','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.step','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.tip','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.title','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.uid','\"085007df-9b37-49f9-b2e2-0e0bf670e1a6\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.userCondition','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.warning','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.elements.0.width','100'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.name','\"Content\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.uid','\"a62363eb-8177-4cd9-8512-d34770710832\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.tabs.0.userCondition','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.fieldLayouts.0984bdeb-4979-4cb7-bc88-0c8190ee821c.thumbFieldKey','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.handle','\"pagebuilder\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.hasTitleField','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.icon','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.name','\"pageBuilder\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.showSlugField','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.showStatusField','true'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.slugTranslationKeyFormat','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.slugTranslationMethod','\"site\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.titleFormat','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.titleTranslationKeyFormat','null'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.titleTranslationMethod','\"site\"'),('entryTypes.9d6ecc3e-64e1-467b-aac5-b18914f04c95.uiLabelFormat','\"{title}\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.allowLineBreaksInTitles','false'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.color','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.description','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.cardThumbAlignment','\"end\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elementCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.autocomplete','false'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.autocorrect','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.class','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.dateAdded','\"2026-03-05T10:37:28+00:00\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.disabled','false'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.elementCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.id','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.inputType','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.instructions','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.label','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.max','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.min','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.name','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.orientation','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.placeholder','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.readonly','false'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.required','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.size','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.step','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.tip','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.title','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.uid','\"2399a378-8036-425b-b276-543199527a2b\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.userCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.warning','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.0.width','100'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.dateAdded','\"2026-03-05T15:06:06+00:00\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.editCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.elementCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.handle','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.instructions','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.label','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.required','false'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.tip','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.uid','\"022a3c7e-9a2f-47d6-84f1-18be129c7c7d\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.userCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.warning','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.elements.1.width','100'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.name','\"Content\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.uid','\"55460e21-45c2-4701-bc56-9f665eae4519\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.tabs.0.userCondition','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.fieldLayouts.e0455d87-7925-486f-8f7e-381bdf2dd7e5.thumbFieldKey','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.handle','\"blogentry\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.hasTitleField','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.icon','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.name','\"BlogEntry\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.showSlugField','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.showStatusField','true'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.slugTranslationKeyFormat','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.slugTranslationMethod','\"site\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.titleFormat','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.titleTranslationKeyFormat','null'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.titleTranslationMethod','\"site\"'),('entryTypes.a1207125-0943-4a3b-8f5d-54d8048b6d50.uiLabelFormat','\"{title}\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.allowLineBreaksInTitles','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.color','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.description','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.cardThumbAlignment','\"end\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.autocapitalize','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.autocomplete','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.autocorrect','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.class','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.dateAdded','\"2026-03-05T09:44:07+00:00\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.disabled','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.id','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.inputType','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.instructions','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.label','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.max','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.min','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.name','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.orientation','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.placeholder','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.readonly','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.required','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.size','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.step','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.tip','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.title','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.uid','\"35c07311-3629-44be-a3a6-efaf2e0fd16e\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.warning','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.0.width','100'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.dateAdded','\"2026-03-05T09:45:59+00:00\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.editCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.handle','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.instructions','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.label','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.required','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.tip','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.uid','\"e083da58-5dc8-4d47-8e66-2f48812edeaa\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.warning','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.1.width','100'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.dateAdded','\"2026-03-11T11:36:30+00:00\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.editCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.fieldUid','\"2afaac93-3261-4654-a019-5b86c0839e17\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.handle','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.instructions','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.label','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.required','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.tip','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.uid','\"0d94ecae-3943-4c88-bf1c-ed92c86c0b1e\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.warning','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.2.width','100'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.3.dateAdded','\"2026-03-06T11:46:17+00:00\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.3.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.3.uid','\"6882ac21-272d-41ae-b783-35c7f546621a\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.3.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.dateAdded','\"2026-03-06T11:46:17+00:00\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.editCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.elementCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.elementEditCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.handle','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.instructions','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.label','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.required','false'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.tip','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.uid','\"df5ec4e7-1830-43a3-b83c-6530680e7533\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.warning','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.elements.4.width','100'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.name','\"Content\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.uid','\"833d4adb-f3a6-473c-810f-b9e124566f17\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.tabs.0.userCondition','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.fieldLayouts.3b95be7f-6a52-4c75-b669-f645666216cf.thumbFieldKey','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.handle','\"homeentry\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.hasTitleField','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.icon','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.name','\"homeEntry\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.showSlugField','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.showStatusField','true'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.slugTranslationKeyFormat','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.slugTranslationMethod','\"site\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.titleFormat','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.titleTranslationKeyFormat','null'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.titleTranslationMethod','\"site\"'),('entryTypes.add5f8a7-08ca-4430-83ab-e74311413432.uiLabelFormat','\"{title}\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.allowLineBreaksInTitles','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.color','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.description','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.cardThumbAlignment','\"end\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elementCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.autocapitalize','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.autocomplete','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.autocorrect','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.class','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.dateAdded','\"2026-03-10T10:59:07+00:00\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.disabled','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.elementCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.id','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.inputType','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.instructions','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.label','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.max','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.min','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.name','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.orientation','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.placeholder','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.readonly','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.required','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.size','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.step','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.tip','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.title','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.uid','\"05d3b601-1155-478d-aa32-64ac87749b49\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.userCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.warning','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.0.width','100'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.dateAdded','\"2026-03-10T11:00:30+00:00\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.editCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.elementCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.handle','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.instructions','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.label','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.required','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.tip','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.uid','\"3ae63c5e-5d35-48e2-b84b-50fe89c6bba1\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.userCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.warning','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.1.width','100'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.2.dateAdded','\"2026-03-10T11:00:30+00:00\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.2.elementCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.2.uid','\"5650e0cf-f325-49ac-bec9-d21bcb162f0c\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.2.userCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.dateAdded','\"2026-03-10T11:00:30+00:00\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.editCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.elementCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.handle','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.instructions','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.label','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.required','false'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.tip','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.uid','\"067e6350-a887-43a2-8249-c24dc4574ca5\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.userCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.warning','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.elements.3.width','100'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.name','\"Content\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.uid','\"5752a524-e1d4-4826-a666-51446a5f200f\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.tabs.0.userCondition','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.fieldLayouts.81946139-46e0-4425-b4cb-5d7db1ca1522.thumbFieldKey','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.handle','\"caravanentry\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.hasTitleField','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.icon','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.name','\"CaravanEntry\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.showSlugField','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.showStatusField','true'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.slugTranslationKeyFormat','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.slugTranslationMethod','\"site\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.titleFormat','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.titleTranslationKeyFormat','null'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.titleTranslationMethod','\"site\"'),('entryTypes.aff402df-4838-4da1-ba16-03efa924d0b9.uiLabelFormat','\"{title}\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.allowLineBreaksInTitles','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.color','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.description','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.cardThumbAlignment','\"end\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elementCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.autocomplete','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.autocorrect','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.class','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.dateAdded','\"2026-03-06T11:34:05+00:00\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.disabled','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.elementCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.id','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.inputType','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.instructions','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.label','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.max','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.min','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.name','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.orientation','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.placeholder','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.readonly','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.required','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.size','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.step','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.tip','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.title','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.uid','\"f5b7527a-eb5b-4c1d-a494-1223c87cb70c\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.userCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.warning','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.0.width','100'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.dateAdded','\"2026-03-06T11:35:23+00:00\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.editCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.elementCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.handle','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.instructions','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.label','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.required','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.tip','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.uid','\"6f8601ee-154f-4647-9b5e-62079483b2ef\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.userCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.warning','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.1.width','100'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.dateAdded','\"2026-03-11T09:11:29+00:00\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.editCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.elementCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.fieldUid','\"dc4e6db4-ab95-4c47-8fce-6c7baa2df791\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.handle','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.instructions','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.label','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.required','false'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.tip','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.uid','\"031597e5-bc27-4137-a23e-554d9ada43bc\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.userCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.warning','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.elements.2.width','100'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.name','\"Content\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.uid','\"01623365-bdc9-46e9-a6e3-43b7720aa33a\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.tabs.0.userCondition','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.fieldLayouts.7dbbf6e6-689a-4124-bd95-d7cdb2770c76.thumbFieldKey','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.handle','\"hero\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.hasTitleField','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.icon','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.name','\"Hero\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.showSlugField','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.showStatusField','true'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.slugTranslationKeyFormat','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.slugTranslationMethod','\"site\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.titleFormat','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.titleTranslationKeyFormat','null'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.titleTranslationMethod','\"site\"'),('entryTypes.b8912d86-aaee-44eb-9902-cb4e687f6f55.uiLabelFormat','\"{title}\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.allowLineBreaksInTitles','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.color','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.description','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.cardThumbAlignment','\"end\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elementCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.autocomplete','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.autocorrect','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.class','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.dateAdded','\"2026-03-09T15:31:20+00:00\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.disabled','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.elementCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.id','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.inputType','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.instructions','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.label','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.max','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.min','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.name','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.orientation','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.placeholder','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.readonly','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.required','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.size','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.step','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.tip','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.title','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.uid','\"f7731108-4463-4cdb-9f18-ab2dd2f05cbd\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.userCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.warning','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.0.width','100'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.dateAdded','\"2026-03-09T15:33:13+00:00\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.editCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.elementCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.fieldUid','\"9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.handle','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.instructions','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.label','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.required','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.tip','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.uid','\"702a784b-9ebc-437d-aebe-22faa759420b\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.userCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.warning','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.1.width','100'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.2.dateAdded','\"2026-03-09T15:33:13+00:00\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.2.elementCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.2.uid','\"af9d7047-8d46-44f8-b2c2-c05a1ee7a058\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.2.userCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.dateAdded','\"2026-03-09T15:33:13+00:00\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.editCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.elementCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.fieldUid','\"44cea8a4-9e92-45ca-be17-b7e04443c389\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.handle','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.instructions','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.label','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.required','false'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.tip','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.uid','\"3d41eb61-7608-46ac-87df-570e7b2a33de\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.userCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.warning','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.elements.3.width','100'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.name','\"Content\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.uid','\"e53ea7db-c245-4605-b5d9-fc5cd1824ba8\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.tabs.0.userCondition','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.fieldLayouts.12dc0ee5-b5d6-4c0f-af0b-917bd0a14b4d.thumbFieldKey','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.handle','\"pagesEntry\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.hasTitleField','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.icon','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.name','\"pagesEntry\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.showSlugField','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.showStatusField','true'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.slugTranslationKeyFormat','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.slugTranslationMethod','\"site\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.titleFormat','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.titleTranslationKeyFormat','null'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.titleTranslationMethod','\"site\"'),('entryTypes.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228.uiLabelFormat','\"{title}\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.allowLineBreaksInTitles','false'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.color','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.description','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.cardThumbAlignment','\"end\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elementCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.autocomplete','false'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.autocorrect','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.class','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.dateAdded','\"2026-03-09T10:10:33+00:00\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.disabled','false'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.elementCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.id','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.inputType','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.instructions','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.label','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.max','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.min','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.name','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.orientation','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.placeholder','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.readonly','false'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.required','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.size','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.step','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.tip','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.title','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.uid','\"5d528f51-9cd5-42e8-82de-fed0f2024573\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.userCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.warning','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.0.width','100'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.dateAdded','\"2026-03-09T09:52:48+00:00\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.editCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.elementCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.fieldUid','\"21778133-d80a-4ff2-b54b-51f28c730136\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.handle','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.instructions','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.label','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.required','false'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.tip','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.uid','\"2909518a-9d7d-44bf-8411-17f80ac3ff5b\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.userCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.warning','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.elements.1.width','100'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.name','\"Content\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.uid','\"c7f95a36-2e68-419b-8048-1332007f06a9\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.tabs.0.userCondition','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.fieldLayouts.2cd954fe-0d8b-493e-864b-7abb20c5f4d9.thumbFieldKey','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.handle','\"linkitem\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.hasTitleField','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.icon','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.name','\"LinkItem\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.showSlugField','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.showStatusField','true'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.slugTranslationKeyFormat','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.slugTranslationMethod','\"site\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.titleFormat','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.titleTranslationKeyFormat','null'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.titleTranslationMethod','\"site\"'),('entryTypes.de419883-87b5-42f0-8225-85aac6ae5fdd.uiLabelFormat','\"{title}\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.columnSuffix','null'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.handle','\"linkHandle\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.instructions','null'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.name','\"Link\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.searchable','false'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.fullGraphqlData','true'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.maxLength','255'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.showLabelField','true'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.types.0','\"entry\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.types.1','\"url\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.0','\"entry\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.0','\"url\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"allowAnchors\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.translationKeyFormat','null'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.translationMethod','\"none\"'),('fields.21778133-d80a-4ff2-b54b-51f28c730136.type','\"craft\\\\fields\\\\Link\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.columnSuffix','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.handle','\"image\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.instructions','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.name','\"Image\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.searchable','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.allowedKinds','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.allowSelfRelations','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.allowSubfolders','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.allowUploads','true'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.branchLimit','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.defaultPlacement','\"end\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.defaultUploadLocationSource','\"volume:eb1cb63c-522c-4d85-b36a-032c74affb66\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.defaultUploadLocationSubpath','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.maintainHierarchy','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.maxRelations','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.minRelations','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.previewMode','\"full\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.restrictedDefaultUploadSubpath','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.restrictedLocationSource','\"volume:eb1cb63c-522c-4d85-b36a-032c74affb66\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.restrictedLocationSubpath','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.restrictFiles','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.restrictLocation','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.selectionLabel','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.showSearchInput','true'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.showSiteMenu','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.showUnpermittedFiles','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.showUnpermittedVolumes','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.sources','\"*\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.targetSiteId','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.validateRelatedElements','false'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.settings.viewMode','\"list\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.translationKeyFormat','null'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.translationMethod','\"none\"'),('fields.2afaac93-3261-4654-a019-5b86c0839e17.type','\"craft\\\\fields\\\\Assets\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.columnSuffix','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.handle','\"pagebuilder\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.instructions','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.name','\"Page Builder\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.searchable','false'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.createButtonLabel','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.defaultIndexViewMode','\"cards\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.enableVersioning','false'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.0.1','\"b8912d86-aaee-44eb-9902-cb4e687f6f55\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.1.0','\"name\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.1.1','\"HeroBlock\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.2.0','\"group\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.0.__assoc__.2.1','\"General\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.1.__assoc__.0.1','\"86b1a055-2f4e-4c9b-8a59-98516e336d7a\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.1.__assoc__.1.0','\"group\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.1.__assoc__.1.1','\"General\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.2.__assoc__.0.0','\"uid\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.2.__assoc__.0.1','\"2b040aff-c847-4d45-8e0b-f3236ce46d86\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.2.__assoc__.1.0','\"group\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.entryTypes.2.__assoc__.1.1','\"General\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.includeTableView','false'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.maxEntries','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.minEntries','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.pageSize','50'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.propagationKeyFormat','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.propagationMethod','\"all\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.showCardsInGrid','false'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.settings.viewMode','\"cards\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.translationKeyFormat','null'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.translationMethod','\"site\"'),('fields.44cea8a4-9e92-45ca-be17-b7e04443c389.type','\"craft\\\\fields\\\\Matrix\"'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.columnSuffix','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.handle','\"body\"'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.instructions','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.name','\"Body\"'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.searchable','false'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.byteLimit','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.charLimit','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.code','false'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.initialRows','4'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.multiline','false'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.placeholder','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.settings.uiMode','\"enlarged\"'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.translationKeyFormat','null'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.translationMethod','\"none\"'),('fields.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c.type','\"craft\\\\fields\\\\PlainText\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.columnSuffix','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.handle','\"downloadsPicker\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.instructions','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.name','\"Downloads Picker\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.searchable','false'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.createButtonLabel','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.defaultIndexViewMode','\"cards\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.enableVersioning','false'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.entryTypes.0.__assoc__.0.1','\"8df9f100-bb0a-4a3f-ac13-ee453361c437\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.includeTableView','false'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.maxEntries','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.minEntries','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.pageSize','50'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.propagationKeyFormat','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.propagationMethod','\"all\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.showCardsInGrid','false'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.settings.viewMode','\"cards\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.translationKeyFormat','null'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.translationMethod','\"site\"'),('fields.dc4e6db4-ab95-4c47-8fce-6c7baa2df791.type','\"craft\\\\fields\\\\Matrix\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.columnSuffix','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.handle','\"downloadsAssets\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.instructions','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.name','\"Downloads Assets\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.searchable','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.allowedKinds.0','\"pdf\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.allowSelfRelations','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.allowSubfolders','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.allowUploads','true'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.branchLimit','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.defaultPlacement','\"end\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.defaultUploadLocationSource','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.defaultUploadLocationSubpath','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.maintainHierarchy','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.maxRelations','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.minRelations','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.previewMode','\"full\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.restrictedDefaultUploadSubpath','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.restrictedLocationSource','\"volume:2ade3efe-b97d-4fea-999b-8668f095bc4d\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.restrictedLocationSubpath','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.restrictFiles','true'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.restrictLocation','true'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.selectionLabel','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.showSearchInput','true'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.showSiteMenu','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.showUnpermittedFiles','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.showUnpermittedVolumes','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.sources','\"*\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.targetSiteId','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.validateRelatedElements','false'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.settings.viewMode','\"list\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.translationKeyFormat','null'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.translationMethod','\"none\"'),('fields.e16fdeab-a1c9-4eb0-93f4-26f76245de66.type','\"craft\\\\fields\\\\Assets\"'),('fs.downloads.hasUrls','true'),('fs.downloads.name','\"Downloads\"'),('fs.downloads.settings.path','\"@webroot/uploads/downloads\"'),('fs.downloads.type','\"craft\\\\fs\\\\Local\"'),('fs.downloads.url','\"@web/uploads/downloads\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/uploads/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"@web/uploads/images\"'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.isPublic','false'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.name','\"Demo\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.0','\"sites.2f7b266a-df88-4000-846d-383293e57d56:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.1','\"sections.089f3017-d69d-448a-9974-7dc9b0112620:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.2','\"sections.64e10dcc-1c2f-401e-b7af-1b60721efc30:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.3','\"sections.1ec0d828-056d-4ff9-8234-2c96071330fe:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.4','\"sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.5','\"nestedentryfields.44cea8a4-9e92-45ca-be17-b7e04443c389:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.6','\"volumes.eb1cb63c-522c-4d85-b36a-032c74affb66:read\"'),('graphql.schemas.7bea2ea3-e06a-4e0a-96a1-438f13b1da99.scope.7','\"categorygroups.be2669d2-dbf5-4d06-9d52-714ef75884bd:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.isPublic','true'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.name','\"Public Schema\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.0','\"sites.2f7b266a-df88-4000-846d-383293e57d56:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.1','\"sections.089f3017-d69d-448a-9974-7dc9b0112620:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.2','\"sections.64e10dcc-1c2f-401e-b7af-1b60721efc30:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.3','\"sections.1ec0d828-056d-4ff9-8234-2c96071330fe:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.4','\"sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.5','\"nestedentryfields.44cea8a4-9e92-45ca-be17-b7e04443c389:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.6','\"volumes.eb1cb63c-522c-4d85-b36a-032c74affb66:read\"'),('graphql.schemas.924492c4-c232-422b-be86-fbeddc187cbd.scope.7','\"categorygroups.be2669d2-dbf5-4d06-9d52-714ef75884bd:read\"'),('meta.__names__.089f3017-d69d-448a-9974-7dc9b0112620','\"Home\"'),('meta.__names__.1aeb2341-a2cc-427e-964c-9b459fa9ae36','\"Top Nav\"'),('meta.__names__.1ec0d828-056d-4ff9-8234-2c96071330fe','\"Pages\"'),('meta.__names__.21778133-d80a-4ff2-b54b-51f28c730136','\"Link\"'),('meta.__names__.2ade3efe-b97d-4fea-999b-8668f095bc4d','\"Downloads\"'),('meta.__names__.2afaac93-3261-4654-a019-5b86c0839e17','\"Image\"'),('meta.__names__.2b040aff-c847-4d45-8e0b-f3236ce46d86','\"DownloadsBlock\"'),('meta.__names__.2f7b266a-df88-4000-846d-383293e57d56','\"craftdemo\"'),('meta.__names__.3b2da99e-edbd-4422-b2ef-6b687a5e0dbf','\"EV Charging\"'),('meta.__names__.3bf63914-a732-4f5f-914f-526a648953e2','\"Caravan Hook Ups\"'),('meta.__names__.44cea8a4-9e92-45ca-be17-b7e04443c389','\"Page Builder\"'),('meta.__names__.57302291-a92e-4488-9dd7-a4a019ffa78b','\"evCharging Entry\"'),('meta.__names__.5a09ccc2-58be-4b23-a044-18e30847f91f','\"EV Charging\"'),('meta.__names__.64e10dcc-1c2f-401e-b7af-1b60721efc30','\"Blogs\"'),('meta.__names__.67d00366-083e-466f-be3d-fd6728d4d980','\"Downloads\"'),('meta.__names__.6c0be145-1a14-442b-985a-44b9658af58c','\"Marina Services Entry\"'),('meta.__names__.6f0ea29d-909b-4f4a-8b12-3783e1b01b27','\"Marina Services\"'),('meta.__names__.77f5d694-e74c-422a-8041-75d2b67ac9f5','\"Downloads Entry\"'),('meta.__names__.7bea2ea3-e06a-4e0a-96a1-438f13b1da99','\"Demo\"'),('meta.__names__.86b1a055-2f4e-4c9b-8a59-98516e336d7a','\"ImageBlock\"'),('meta.__names__.8af35cd4-be51-45ea-a707-5d64165187e3','\"Caravan Hook-Ups\"'),('meta.__names__.8df9f100-bb0a-4a3f-ac13-ee453361c437','\"DownloadPicker\"'),('meta.__names__.924492c4-c232-422b-be86-fbeddc187cbd','\"Public Schema\"'),('meta.__names__.9a2c7666-06b1-4bc2-b860-99a02e59175d','\"craftdemo\"'),('meta.__names__.9d3fcbea-8bce-4fa2-8eef-23cb1f274f4c','\"Body\"'),('meta.__names__.9d6ecc3e-64e1-467b-aac5-b18914f04c95','\"pageBuilder\"'),('meta.__names__.a1207125-0943-4a3b-8f5d-54d8048b6d50','\"BlogEntry\"'),('meta.__names__.add5f8a7-08ca-4430-83ab-e74311413432','\"homeEntry\"'),('meta.__names__.aff402df-4838-4da1-ba16-03efa924d0b9','\"CaravanEntry\"'),('meta.__names__.b8912d86-aaee-44eb-9902-cb4e687f6f55','\"Hero\"'),('meta.__names__.cdeed09c-d8b0-4d7a-89a6-afc58a5f3228','\"pagesEntry\"'),('meta.__names__.dc4e6db4-ab95-4c47-8fce-6c7baa2df791','\"Downloads Picker\"'),('meta.__names__.de419883-87b5-42f0-8225-85aac6ae5fdd','\"LinkItem\"'),('meta.__names__.e16fdeab-a1c9-4eb0-93f4-26f76245de66','\"Downloads Assets\"'),('meta.__names__.eb1cb63c-522c-4d85-b36a-032c74affb66','\"Images\"'),('meta.__names__.fb70777d-d33c-4c53-9467-f431d2bccfe0','\"Marina Services\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"5.0.0.1\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.defaultPlacement','\"end\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.enableVersioning','true'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.entryTypes.0.uid','\"add5f8a7-08ca-4430-83ab-e74311413432\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.handle','\"home\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.maxAuthors','1'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.name','\"Home\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.previewTargets.0.label','\"Primary entry page\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.previewTargets.0.refresh','\"1\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.previewTargets.0.urlFormat','\"{url}\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.propagationMethod','\"all\"'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','false'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','null'),('sections.089f3017-d69d-448a-9974-7dc9b0112620.type','\"single\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.defaultPlacement','\"end\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.enableVersioning','true'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.entryTypes.0.uid','\"de419883-87b5-42f0-8225-85aac6ae5fdd\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.handle','\"topNav\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.maxAuthors','1'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.name','\"Top Nav\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.previewTargets.0.label','\"Primary entry page\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.previewTargets.0.refresh','\"1\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.previewTargets.0.urlFormat','\"\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.propagationMethod','\"all\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','false'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','null'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.structure.maxLevels','null'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.structure.uid','\"1ea8decf-7342-48c2-a442-bb72c98d0539\"'),('sections.1aeb2341-a2cc-427e-964c-9b459fa9ae36.type','\"structure\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.defaultPlacement','\"end\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.enableVersioning','true'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.entryTypes.0.uid','\"cdeed09c-d8b0-4d7a-89a6-afc58a5f3228\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.handle','\"pages\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.maxAuthors','1'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.name','\"Pages\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.previewTargets.0.label','\"Primary entry page\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.previewTargets.0.refresh','\"1\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.previewTargets.0.urlFormat','\"{url}\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.propagationMethod','\"all\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"{slug}\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.structure.maxLevels','null'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.structure.uid','\"f71fd2d7-836b-4007-9293-24a5a5ae5969\"'),('sections.1ec0d828-056d-4ff9-8234-2c96071330fe.type','\"structure\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.defaultPlacement','\"end\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.enableVersioning','true'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.entryTypes.0.uid','\"57302291-a92e-4488-9dd7-a4a019ffa78b\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.handle','\"evCharging\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.maxAuthors','1'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.name','\"EV Charging\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.previewTargets.0.label','\"Primary entry page\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.previewTargets.0.refresh','\"1\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.previewTargets.0.urlFormat','\"{url}\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.propagationMethod','\"all\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"ev-charging/{slug}\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.structure.maxLevels','null'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.structure.uid','\"6f6222db-2634-464f-b16a-96e321971510\"'),('sections.5a09ccc2-58be-4b23-a044-18e30847f91f.type','\"structure\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.defaultPlacement','\"end\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.enableVersioning','true'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.entryTypes.0.uid','\"a1207125-0943-4a3b-8f5d-54d8048b6d50\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.handle','\"blog\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.maxAuthors','1'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.name','\"Blogs\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.previewTargets.0.label','\"Primary entry page\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.previewTargets.0.refresh','\"1\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.previewTargets.0.urlFormat','\"{url}\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.propagationMethod','\"all\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"blogs/{slug}\"'),('sections.64e10dcc-1c2f-401e-b7af-1b60721efc30.type','\"channel\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.defaultPlacement','\"end\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.enableVersioning','true'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.entryTypes.0.uid','\"77f5d694-e74c-422a-8041-75d2b67ac9f5\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.handle','\"downloads\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.maxAuthors','1'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.name','\"Downloads\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.previewTargets.0.label','\"Primary entry page\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.previewTargets.0.refresh','\"1\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.previewTargets.0.urlFormat','\"{url}\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.propagationMethod','\"all\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"downloads\"'),('sections.67d00366-083e-466f-be3d-fd6728d4d980.type','\"single\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.defaultPlacement','\"end\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.enableVersioning','true'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.entryTypes.0.uid','\"6c0be145-1a14-442b-985a-44b9658af58c\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.handle','\"marinaServices\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.maxAuthors','1'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.name','\"Marina Services\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.previewTargets.0.label','\"Primary entry page\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.previewTargets.0.refresh','\"1\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.previewTargets.0.urlFormat','\"{url}\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.propagationMethod','\"all\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"marina-services/{slug}\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.structure.maxLevels','null'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.structure.uid','\"53e26c49-f92c-42ac-8340-398ff2020641\"'),('sections.6f0ea29d-909b-4f4a-8b12-3783e1b01b27.type','\"structure\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.defaultPlacement','\"end\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.enableVersioning','true'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.entryTypes.0.uid','\"aff402df-4838-4da1-ba16-03efa924d0b9\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.handle','\"caravanHookUps\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.maxAuthors','1'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.name','\"Caravan Hook-Ups\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.previewTargets.0.label','\"Primary entry page\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.previewTargets.0.refresh','\"1\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.previewTargets.0.urlFormat','\"{url}\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.propagationMethod','\"all\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.enabledByDefault','true'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.template','null'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.siteSettings.2f7b266a-df88-4000-846d-383293e57d56.uriFormat','\"caravan-hook-ups/{slug}\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.structure.maxLevels','null'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.structure.uid','\"de915557-d5d9-445f-90d6-296c4ccc67a2\"'),('sections.8af35cd4-be51-45ea-a707-5d64165187e3.type','\"structure\"'),('siteGroups.9a2c7666-06b1-4bc2-b860-99a02e59175d.name','\"craftdemo\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.enabled','true'),('sites.2f7b266a-df88-4000-846d-383293e57d56.handle','\"default\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.hasUrls','true'),('sites.2f7b266a-df88-4000-846d-383293e57d56.language','\"en\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.name','\"craftdemo\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.primary','true'),('sites.2f7b266a-df88-4000-846d-383293e57d56.siteGroup','\"9a2c7666-06b1-4bc2-b860-99a02e59175d\"'),('sites.2f7b266a-df88-4000-846d-383293e57d56.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"craftdemo\"'),('system.schemaVersion','\"5.9.0.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.altTranslationKeyFormat','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.altTranslationMethod','\"none\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardThumbAlignment','\"end\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.0','\"dateUpdated\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.1','\"dateCreated\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.2','\"kind\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.3','\"dateModified\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.4','\"size\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.5','\"filename\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.6','\"id\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.cardView.7','\"link\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elementCondition','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.autocapitalize','true'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.autocomplete','false'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.autocorrect','true'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.class','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.dateAdded','\"2026-03-10T10:06:49+00:00\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.disabled','false'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.elementCondition','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.id','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.inputType','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.instructions','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.label','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.max','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.min','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.name','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.orientation','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.placeholder','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.readonly','false'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.requirable','false'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.size','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.step','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.tip','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.title','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.uid','\"61812ad5-aafb-4afe-bda0-d4b1f3d5962f\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.userCondition','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.warning','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.elements.0.width','100'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.name','\"Content\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.uid','\"73f623ac-a164-4887-bc7d-c539f064985a\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.tabs.0.userCondition','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fieldLayouts.17bb55c9-1713-4b80-88bf-3cf65ca5ce5b.thumbFieldKey','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.fs','\"downloads\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.handle','\"downloads\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.name','\"Downloads\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.sortOrder','2'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.subpath','\"\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.titleTranslationKeyFormat','null'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.titleTranslationMethod','\"site\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.transformFs','\"\"'),('volumes.2ade3efe-b97d-4fea-999b-8668f095bc4d.transformSubpath','\"\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.altTranslationKeyFormat','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.altTranslationMethod','\"none\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.cardThumbAlignment','\"end\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elementCondition','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.autocapitalize','true'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.autocomplete','false'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.autocorrect','true'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.class','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.dateAdded','\"2026-03-05T14:19:18+00:00\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.disabled','false'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.elementCondition','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.id','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.inputType','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.instructions','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.label','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.max','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.min','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.name','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.orientation','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.placeholder','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.readonly','false'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.requirable','false'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.size','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.step','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.tip','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.title','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.uid','\"d4ac4512-fe65-4b8c-a71a-7c6c18f39f43\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.userCondition','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.warning','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.elements.0.width','100'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.name','\"Content\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.uid','\"14c06302-6c8d-4828-8c77-b6aa92bc21ac\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.tabs.0.userCondition','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fieldLayouts.2093ee67-1965-45cb-a86f-b140f85fc3ea.thumbFieldKey','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.fs','\"images\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.handle','\"images\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.name','\"Images\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.sortOrder','1'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.subpath','\"\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.titleTranslationKeyFormat','null'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.titleTranslationMethod','\"site\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.transformFs','\"images\"'),('volumes.eb1cb63c-522c-4d85-b36a-032c74affb66.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_wkwckxnhnntbtpbgcttjzlpwyzlgkkfeuqry` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zjdtuumphixxvulnjbssmfttaxbwckmmdxem` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fiiabdbqfuytmyravfspyjjdtgntrbveaxeq` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_efvimnipttlgribrarlozuauzbbldcksfsqb` (`sourceId`),
  KEY `idx_nqdbqstipranicclfafthsmwgfwvyuejkhto` (`targetId`),
  KEY `idx_okxpljxqqqxxsunitmhjfjawjvwahngwtowo` (`sourceSiteId`),
  CONSTRAINT `fk_caqvemhkiylaetrahntkdkegoympktypdbus` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kyczydxuftslshmdvredravraeehzdvalrno` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uozsojfuziupolzfqfwnkcmrkovbpjkwjdsv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (2,3,21,NULL,19,1,'2026-03-06 11:53:21','2026-03-06 11:53:21','4530363a-f298-4abc-bc8b-509c01a81c42'),(3,3,24,NULL,19,1,'2026-03-06 11:53:21','2026-03-06 11:53:21','fc0b6652-7dba-4ff3-ac01-5e1d4d138ebc'),(5,3,28,NULL,27,1,'2026-03-06 12:26:28','2026-03-06 12:26:28','cd07c9f8-2a7b-4a5c-9109-d5fcbae123a8'),(6,3,30,NULL,27,1,'2026-03-06 12:26:28','2026-03-06 12:26:28','5cf757e0-2b87-46b6-ab8f-91529afbfeff'),(7,4,33,1,2,1,'2026-03-09 09:58:34','2026-03-09 09:58:34','0d08865e-51dc-46e5-8691-ea216f202f1c'),(8,4,35,1,2,1,'2026-03-09 10:07:46','2026-03-09 10:07:46','fa4e93b5-9efe-467e-a788-814ea7df04ce'),(9,4,37,1,6,1,'2026-03-09 10:09:29','2026-03-09 10:09:29','5e6785a1-a93b-4973-97d0-537831c582f1'),(13,4,44,1,2,1,'2026-03-09 12:28:57','2026-03-09 12:28:57','cecf63ca-0dbc-43af-a32d-4e68c9c36b22'),(14,4,46,1,6,1,'2026-03-09 12:29:33','2026-03-09 12:29:33','cdf85e21-3cec-4eff-bbd6-4de7a8911d8e'),(15,4,49,1,6,1,'2026-03-09 13:11:37','2026-03-09 13:11:37','c5cfa416-6abd-4d00-b512-e4c4991cc6aa'),(17,4,51,1,6,1,'2026-03-09 13:15:05','2026-03-09 13:15:05','90c1ba51-0504-4a4e-b5fe-b14c7cff6436'),(21,4,56,1,6,1,'2026-03-09 13:21:11','2026-03-09 13:21:11','85ec8977-b5d2-4698-9e2c-db9a5a43e6c4'),(24,4,62,1,6,1,'2026-03-09 13:38:52','2026-03-09 13:38:52','e0f45734-2af7-4944-bccd-169fb330727c'),(25,4,63,1,6,1,'2026-03-09 13:38:58','2026-03-09 13:38:58','2d184a2a-d666-4df9-acaf-88f48ec0c68b'),(28,4,75,1,2,1,'2026-03-09 14:39:21','2026-03-09 14:39:21','c7439e10-7c4d-4575-9660-1b806bb95280'),(31,4,54,1,2,1,'2026-03-09 14:50:00','2026-03-09 14:50:00','054fc3af-886a-4006-84d9-796176af9590'),(32,4,81,1,2,1,'2026-03-09 14:50:00','2026-03-09 14:50:00','90b040de-438f-429b-8bdd-89f747d62b98'),(34,4,100,1,93,1,'2026-03-09 16:20:32','2026-03-09 16:20:32','491d156b-bf8d-4614-bcb9-004e9e474b85'),(35,4,101,1,93,1,'2026-03-09 16:20:37','2026-03-09 16:20:37','d1906dcc-721e-4181-b4d6-acb81bcfc557'),(37,3,106,NULL,105,1,'2026-03-09 16:25:06','2026-03-09 16:25:06','f9f6cd6e-1f4d-4d0f-b65d-6e27fa528d79'),(38,3,108,NULL,105,1,'2026-03-09 16:25:06','2026-03-09 16:25:06','49e16a39-437b-4ad9-8da0-ba6a1e9f5b4d'),(39,6,126,NULL,127,1,'2026-03-10 10:39:47','2026-03-10 10:39:47','74c07b6f-d633-43ef-81ed-f0183253eeb1'),(40,6,131,NULL,127,1,'2026-03-10 10:46:13','2026-03-10 10:46:13','cbd5d176-01fb-4c05-bd9b-e67d8981a5c3'),(41,6,136,NULL,127,1,'2026-03-10 10:47:55','2026-03-10 10:47:55','c24ab786-1cfb-4526-8038-5b00b901a3a7'),(47,3,146,NULL,144,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','5b40754b-fa3c-4a76-a5eb-99320a0a59f7'),(48,6,147,NULL,127,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','f12ebecc-da03-4737-b187-2469b9c99a7f'),(49,6,149,NULL,127,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','dc3cdcb8-1cc2-4675-9bfb-9a2f2fc85d0e'),(50,3,151,NULL,144,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','57c48244-bb6a-49a6-9b5e-6b16742298a0'),(51,6,152,NULL,127,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','3041f0d2-561d-417e-bb55-c78c09150b98'),(52,6,154,NULL,127,1,'2026-03-10 10:54:47','2026-03-10 10:54:47','b2c7881c-3fb1-4142-bb4a-bf397dd81133'),(54,3,2,NULL,105,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','6c115e31-a7d4-4574-9a44-804e64882c29'),(55,3,164,NULL,105,1,'2026-03-11 11:36:47','2026-03-11 11:36:47','104ef6d1-ec68-42fd-bed3-6a1c51fc87ab');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('12765d81','@craft/web/assets/selectize/dist'),('1563e7a3','@craft/web/assets/tailwindreset/dist'),('1a2a9b15','@craft/ckeditor/web/assets/ckeditor/dist'),('1d539915','@craft/ckeditor/web/assets/fieldsettings/dist'),('1e3effc9','@craft/web/assets/cp/dist'),('220ff16f','@craft/web/assets/axios/dist'),('397d0c62','@craft/web/assets/conditionbuilder/dist'),('3afa6436','@craft/web/assets/recententries/dist'),('40bd980','@craft/web/assets/d3/dist'),('4402658','@craft/web/assets/updateswidget/dist'),('44ccc703','@craft/web/assets/utilities/dist'),('46a31149','@craft/web/assets/userpermissions/dist'),('54e6513d','@craft/web/assets/fabric/dist'),('64d7fc66','@craft/web/assets/graphiql/dist'),('6dda25d5','@craft/web/assets/admintable/dist'),('7c54662a','@craft/web/assets/garnish/dist'),('87844af8','@craft/web/assets/editsection/dist'),('87dcbaa7','@craft/web/assets/vue/dist'),('9030501','@craft/web/assets/fieldsettings/dist'),('93fc62fc','@craft/web/assets/velocity/dist'),('9638bf29','@craft/web/assets/jquerytouchevents/dist'),('966b604b','@craft/web/assets/jquerypayment/dist'),('9cf9ed15','@craft/web/assets/feed/dist'),('a1880795','@craft/web/assets/xregexp/dist'),('a3ecd051','@craft/web/assets/craftsupport/dist'),('a5424a29','@craft/web/assets/timepicker/dist'),('aa30ba95','@craft/web/assets/picturefill/dist'),('c0c5cb83','@bower/jquery/dist'),('ca225b95','@craft/web/assets/jqueryui/dist'),('cc88585','@craft/web/assets/theme/dist'),('d4598d3e','@craft/web/assets/fileupload/dist'),('dfd1ae57','@craft/web/assets/prismjs/dist'),('e5bacbde','@craft/web/assets/dashboard/dist'),('f16c4951','@craft/web/assets/htmx/dist'),('f6ad037','@craft/web/assets/iframeresizer/dist'),('fffc0083','@craft/web/assets/animationblocker/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uryypbhfvxgxddhabsjfzffwuigklrwzunlh` (`canonicalId`,`num`),
  KEY `fk_powrbdzeninsepsorkwhaozqcavnqrijpqcp` (`creatorId`),
  CONSTRAINT `fk_powrbdzeninsepsorkwhaozqcavnqrijpqcp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qbjmkpcbalpcknbdgvgwvuvlxkcitfgectfa` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,'Applied “Draft 1”'),(3,6,1,1,''),(4,8,1,1,''),(5,8,1,2,'Applied “Draft 1”'),(6,2,1,3,NULL),(7,2,1,4,NULL),(8,2,1,5,'Applied “Draft 1”'),(9,20,1,1,NULL),(10,21,1,1,NULL),(11,2,1,6,'Applied “Draft 1”'),(12,28,1,1,NULL),(13,2,1,7,'Applied “Draft 1”'),(14,60,1,1,''),(15,62,1,1,''),(16,65,1,1,''),(17,67,1,1,''),(18,68,1,1,NULL),(19,54,1,1,'Revision from Mar 9, 2026, 6:24:46 AM'),(20,54,1,2,'Applied “Draft 1”'),(21,54,1,3,'Applied “Draft 1”'),(22,54,1,4,'Applied “Draft 1”'),(23,2,1,8,'Applied “Draft 1”'),(24,54,1,5,'Applied “Draft 1”'),(25,2,1,9,NULL),(26,2,1,10,'Applied “Draft 1”'),(27,65,1,2,'Applied “Draft 1”'),(28,88,1,1,NULL),(29,93,1,1,''),(30,94,1,1,NULL),(31,97,1,1,''),(32,97,1,2,''),(33,100,1,1,''),(34,93,1,2,'Applied “Draft 1”'),(35,106,1,1,NULL),(36,60,1,2,'Applied “Draft 1”'),(37,112,1,1,NULL),(38,112,1,2,'Applied “Draft 1”'),(39,112,1,3,'Applied “Draft 1”'),(40,146,1,1,NULL),(41,147,1,1,NULL),(42,148,1,1,NULL),(43,149,1,1,NULL),(44,155,1,1,''),(45,157,1,1,''),(46,159,1,1,''),(47,2,1,11,NULL),(48,2,1,12,'Applied “Draft 1”'),(49,162,1,1,NULL),(50,163,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vybvnnlumjcveolpffiugeddcjqzxcqwegex` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' mel mel com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' mel '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(6,'slug',0,1,' blog 01 '),(6,'title',0,1,' blog 01 '),(8,'slug',0,1,' blog two '),(8,'title',0,1,' blog two '),(19,'alt',0,1,''),(19,'extension',0,1,' jpg '),(19,'filename',0,1,' rolec ev chargers jpg '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' rolec ev chargers '),(20,'slug',0,1,' this is hero block title '),(20,'title',0,1,' this is hero block title '),(21,'slug',0,1,' this is img block caption '),(21,'title',0,1,' this is img block caption '),(24,'slug',0,1,' this is img block caption '),(24,'title',0,1,' this is img block caption '),(27,'alt',0,1,''),(27,'extension',0,1,' jpg '),(27,'filename',0,1,' matcha jpg '),(27,'kind',0,1,' image '),(27,'slug',0,1,''),(27,'title',0,1,' matcha '),(28,'slug',0,1,' hi matcha '),(28,'title',0,1,' hi matcha '),(33,'slug',0,1,' home '),(33,'title',0,1,' home '),(34,'slug',0,1,' blog '),(34,'title',0,1,' blog '),(35,'slug',0,1,' home '),(35,'title',0,1,' home '),(36,'slug',0,1,' blogs '),(36,'title',0,1,' blogs '),(37,'slug',0,1,' blog 01 '),(37,'title',0,1,' blog 01 '),(44,'slug',0,1,' home '),(44,'title',0,1,' home '),(45,'slug',0,1,' blogs '),(45,'title',0,1,' blog '),(46,'slug',0,1,' blog 01 '),(46,'title',0,1,' blog 01 '),(48,'slug',0,1,' blogs '),(48,'title',0,1,' blogs '),(49,'slug',0,1,' blog 1 '),(49,'title',0,1,' blog 1 '),(51,'slug',0,1,' blog 0 1 '),(51,'title',0,1,' blog 01 '),(54,'slug',0,1,' home '),(54,'title',0,1,' home '),(55,'slug',0,1,' blogs '),(55,'title',0,1,' blogs '),(56,'slug',0,1,' blog 01 '),(56,'title',0,1,' blog 01 '),(59,'slug',0,1,' smith '),(59,'title',0,1,' smith '),(60,'slug',0,1,' blogs '),(60,'title',0,1,' news blogs '),(62,'slug',0,1,' blog post 1 '),(62,'title',0,1,' blog post 1 '),(64,'slug',0,1,' temp peupatmjzhaztllsliskkxwlsdagnjdvzwgn '),(64,'title',0,1,''),(65,'slug',0,1,' about '),(65,'title',0,1,' about '),(67,'slug',0,1,' ev charging '),(67,'title',0,1,' ev charging '),(68,'slug',0,1,' hero title '),(68,'title',0,1,' hero title '),(83,'slug',0,1,' home '),(83,'title',0,1,' home '),(88,'slug',0,1,' about hero '),(88,'title',0,1,' about hero '),(91,'slug',0,1,' hero title '),(91,'title',0,1,' hero title '),(92,'slug',0,1,' ev charging '),(92,'title',0,1,' ev charging '),(93,'slug',0,1,' about '),(93,'title',0,1,' about '),(94,'slug',0,1,' hero about '),(94,'title',0,1,' hero about '),(97,'slug',0,1,' test page '),(97,'title',0,1,' testtt page '),(100,'slug',0,1,' about '),(100,'title',0,1,' about '),(104,'alt',0,1,''),(104,'extension',0,1,' jpg '),(104,'filename',0,1,' rolec ev chargers 2026 03 09 162452 gcko jpg '),(104,'kind',0,1,' image '),(104,'slug',0,1,''),(104,'title',0,1,' rolec ev chargers '),(105,'alt',0,1,''),(105,'extension',0,1,' jpg '),(105,'filename',0,1,' sample pic jpg '),(105,'kind',0,1,' image '),(105,'slug',0,1,''),(105,'title',0,1,' sample pic '),(106,'slug',0,1,' about image '),(106,'title',0,1,' about image '),(111,'slug',0,1,' downloads '),(111,'title',0,1,' downloads '),(112,'slug',0,1,' downloads '),(112,'title',0,1,' downloads '),(116,'slug',0,1,' temp qusalcgreatzlbudcbfjifaoktswydpmvwav '),(116,'title',0,1,''),(118,'slug',0,1,' download '),(118,'title',0,1,' download '),(119,'slug',0,1,' temp zzbxitrzvfastfzouwbkdqvlrxaszubnencl '),(119,'title',0,1,''),(120,'slug',0,1,' ev charging '),(120,'title',0,1,' ev charging '),(121,'slug',0,1,' marina services '),(121,'title',0,1,' marina services '),(122,'slug',0,1,' caravan hook ups '),(122,'title',0,1,' caravan hook ups '),(123,'slug',0,1,' ev charger doc '),(123,'title',0,1,' ev charger doc '),(124,'slug',0,1,' temp pslovrebxyqikoqgwptmtvwbsfkjbpzrguvt '),(124,'title',0,1,''),(125,'slug',0,1,' ev charger doc 01 '),(125,'title',0,1,' ev charger doc 01 '),(126,'slug',0,1,' ev charger doc 1 '),(126,'title',0,1,' ev charger doc 1 '),(127,'alt',0,1,''),(127,'extension',0,1,' pdf '),(127,'filename',0,1,' sample pdf '),(127,'kind',0,1,' pdf '),(127,'slug',0,1,''),(127,'title',0,1,' sample '),(128,'slug',0,1,' temp hafelxgrjmgbfwafulmqympdegqcfhqsjvxs '),(128,'title',0,1,''),(129,'slug',0,1,' caravan doc 01 '),(129,'title',0,1,' caravan doc 01 '),(131,'slug',0,1,''),(131,'title',0,1,''),(132,'slug',0,1,' temp mqejysganwqkbdlwwpkjjddhpimlrmpbzfma '),(132,'title',0,1,''),(133,'slug',0,1,' ev charging doc '),(133,'title',0,1,' ev charging doc '),(134,'slug',0,1,''),(134,'title',0,1,''),(135,'slug',0,1,' marina services '),(135,'title',0,1,' marina services document '),(136,'slug',0,1,''),(136,'title',0,1,''),(144,'alt',0,1,''),(144,'extension',0,1,' jpg '),(144,'filename',0,1,' evo pic jpg '),(144,'kind',0,1,' image '),(144,'slug',0,1,''),(144,'title',0,1,' evo pic '),(146,'slug',0,1,' evo '),(146,'title',0,1,' evo '),(147,'slug',0,1,''),(147,'title',0,1,''),(148,'slug',0,1,''),(148,'title',0,1,''),(149,'slug',0,1,''),(149,'title',0,1,''),(155,'slug',0,1,' evo '),(155,'title',0,1,' evo '),(157,'slug',0,1,' direct connection units '),(157,'title',0,1,' direct connection units '),(159,'slug',0,1,' service pedestals '),(159,'title',0,1,' service pedestals '),(162,'slug',0,1,' download '),(162,'title',0,1,' download '),(163,'slug',0,1,' temp zzbxitrzvfastfzouwbkdqvlrxaszubnencl '),(163,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fpgmlonqknruhdnuqgvulkpsblzexvotzmqd` (`elementId`,`siteId`,`reserved`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_qcdzgowkbjmkqlpqkelpxhsthrotgdgebmcp` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_pjxpprkiixmvhyzxsbrevdzytdpvutiscvxk` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qapsxlzzdxwjjfxaxlcygxnlcubnorylgsjo` (`handle`),
  KEY `idx_slfpnklsyntegowwrwmauzqeaiwprptxxlqv` (`name`),
  KEY `idx_fvkkujirymeyrkmculceidtpinfhzfoyjcar` (`structureId`),
  KEY `idx_aktuplytweuyfrpcqnctzdrabqwsgwzjcafy` (`dateDeleted`),
  CONSTRAINT `fk_feicsbnkaeczwlfernnqiifgsaxhngkqcrmi` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-05 09:46:06','2026-03-05 09:46:06',NULL,'089f3017-d69d-448a-9974-7dc9b0112620'),(2,NULL,'Blogs','blog','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-05 10:38:46','2026-03-09 13:39:37',NULL,'64e10dcc-1c2f-401e-b7af-1b60721efc30'),(3,2,'Top Nav','topNav','structure',0,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-09 09:57:48','2026-03-09 09:57:48','2026-03-09 10:06:33','62132715-3e1e-48ae-8476-456b7d847e46'),(4,3,'Top Nav','topNav','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"\"}]','2026-03-09 10:07:30','2026-03-09 13:33:26',NULL,'1aeb2341-a2cc-427e-964c-9b459fa9ae36'),(5,4,'Pages','pages','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-09 13:51:44','2026-03-09 13:51:44',NULL,'1ec0d828-056d-4ff9-8234-2c96071330fe'),(6,NULL,'Downloads','downloads','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-10 09:05:54','2026-03-10 09:05:54',NULL,'67d00366-083e-466f-be3d-fd6728d4d980'),(7,8,'EV Charging','evCharging','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-10 10:58:22','2026-03-10 10:58:22',NULL,'5a09ccc2-58be-4b23-a044-18e30847f91f'),(8,9,'Marina Services','marinaServices','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-10 10:59:33','2026-03-10 10:59:33',NULL,'6f0ea29d-909b-4f4a-8b12-3783e1b01b27'),(9,10,'Caravan Hook-Ups','caravanHookUps','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-10 11:00:39','2026-03-10 11:00:39',NULL,'8af35cd4-be51-45ea-a707-5d64165187e3');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_pbejlpudreghjnstrldzezplhisbstejvaxc` (`typeId`),
  CONSTRAINT `fk_pbejlpudreghjnstrldzezplhisbstejvaxc` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsgvevbgdabwgsqmyfvdnuajlniadsbysybw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL),(3,7,1,NULL,NULL,NULL),(4,7,1,NULL,NULL,NULL),(5,9,1,NULL,NULL,NULL),(6,10,1,NULL,NULL,NULL),(7,13,1,NULL,NULL,NULL),(8,14,1,NULL,NULL,NULL),(9,15,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yzjpkeyjvywlmywegjiaepqrldsawkglhxrc` (`sectionId`,`siteId`),
  KEY `idx_jlulolajeoqqxkbmunckguqljdfppkzbfxuo` (`siteId`),
  CONSTRAINT `fk_efxazxiyrqakbsoolvgaatszrmahewgloeaf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vlalmpxlogfgnmpraigcdumvyykhssjxawcc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2026-03-05 09:46:06','2026-03-09 14:50:52','add46da7-fb3a-428f-809d-eebe00ede57c'),(2,2,1,1,'blogs/{slug}',NULL,1,'2026-03-05 10:38:46','2026-03-09 13:39:37','b62ba3cb-b112-4a8e-b6d1-192706c2c89d'),(3,3,1,0,NULL,NULL,1,'2026-03-09 09:57:48','2026-03-09 09:57:48','a8b4a355-5e3f-45fc-ba42-47cbbb6b9bb7'),(4,4,1,0,NULL,NULL,1,'2026-03-09 10:07:30','2026-03-09 10:07:30','4861ec8d-6504-4f40-915e-ffe0a6ea6288'),(5,5,1,1,'{slug}',NULL,1,'2026-03-09 13:51:44','2026-03-09 13:51:44','dfd0b673-4f63-40da-8756-8ba259a55377'),(6,6,1,1,'downloads',NULL,1,'2026-03-10 09:05:54','2026-03-10 09:05:54','ada29783-e5cc-447f-a8d0-4cedad1d6b19'),(7,7,1,1,'ev-charging/{slug}',NULL,1,'2026-03-10 10:58:22','2026-03-10 10:58:22','e38243ef-9204-4cfc-a238-8ca17d5e7995'),(8,8,1,1,'marina-services/{slug}',NULL,1,'2026-03-10 10:59:33','2026-03-10 10:59:33','69a0fd34-eb30-4a67-8e2d-252055ab0652'),(9,9,1,1,'caravan-hook-ups/{slug}',NULL,1,'2026-03-10 11:00:39','2026-03-10 11:00:39','59d6cac2-5b78-47e7-a16a-e65061f02bfe');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dwdtalwblkfbmpymdhaexjyxcwgqbtpiffog` (`uid`),
  KEY `idx_cgdmpmhipuxztbnunyfmhitytgsbbcixvfhy` (`token`),
  KEY `idx_nvfxrybnlucqifxvseyeqvatgqmcjunbptds` (`dateUpdated`),
  KEY `idx_dfcoukfolutjuaukqsmmdwvvdgumcifpnixg` (`userId`),
  CONSTRAINT `fk_auwpofrsvaxxdyememlrnsgwhwppittriryj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'R-oNRt4U9EWbT6lk9YD7QUN10sJCExeRq91HdtgWdFnOKqhriw8Sr3VL3k2K-0QB-hxE2P56DX6XMHluRGUJr4QodIwJah87hRgJ','2026-03-05 09:25:46','2026-03-05 10:18:11','2a181d99-0b5b-47d0-8286-039bb2366960'),(2,1,'nO6MIzyAYcvL2QR6Zu-N2hX9ww3D5lxGzVZC4oRLx2vAQlEOcNCEhSbWo8PRwNCb9bhYkEztnkEYq2e1BFv2kUqk44HlfpjSxPVQ','2026-03-05 09:44:48','2026-03-05 09:50:25','7210a7cf-3383-4d60-a5d6-fe32547a563f'),(3,1,'BiasYZdX4SBeGMqkBiVC9Vt-4Ad8S09Nc5QnoargqztyRUcs8p7cmDmbO7GU74gH7pZ-ya1uhMMKdL86h-jHbZDzYlPr39p_gfLW','2026-03-05 09:50:25','2026-03-05 10:44:14','77a4485e-5b53-48ca-976e-88b96c1fa606'),(4,1,'F8ef_vt0q0x50ibzG5xbUfo2o3ERVOTBlG5ZhbiK-K5woIvE-xvljtJ-TyJN0gm9uI6lGc1-iP2uQB2csTsM8VJgHFLk7p3Ng301','2026-03-05 10:18:11','2026-03-05 10:25:37','4e412b26-2634-4135-8df0-61dd89dcee26'),(5,1,'VEx3bHRs8wwtbn0104QuEwgSEVVMF0FM4480GzY7B9jkVRICq3D74Nscdb5MUlcrEEEqbpViF9M5H8JZalqIW-DoX-msEU_Sjx6p','2026-03-05 10:25:38','2026-03-05 10:44:43','5f07e825-48f2-45ca-aa07-c3ffc1c0a862'),(6,1,'0yomxUuR7-EiqDPgJ0RsME_v8cOOwXf8c3eyqh35bnzitY0juq7nR8roqx3qwulITl5B1Qx-RWiZBSCWaD2c61zB83D-0ePptL1t','2026-03-05 10:44:39','2026-03-05 10:49:51','b5dae74e-96ec-42cd-bf46-f39a2ffb629c'),(7,1,'mYhSnEXJE9X2LotPezDYRH5Oj4xq-YgeBdcg-yQQnqanYrW4681izJoWSsM3tA8WvAIhRkWK5Skz7JrTa4Iioc9168MNI3AL2K4E','2026-03-05 10:49:51','2026-03-05 11:55:28','1c130f4d-3ce3-4d79-828e-9a6d8e9f1a0f'),(9,1,'1XUqNn6_04imqYwjQx1Z3ih3ugMkBXELRzD-LsY8lljfLAvSKsE8fS8N084CQa5pyvfsShgif341NLmSioQqA266qAc_EhWVabKK','2026-03-05 13:43:33','2026-03-05 14:11:56','8486253e-07d3-4be2-a4aa-a3eeadae75ec'),(13,1,'rE9QSiD-qcjftVs1AfRTXXmo4UJDzdBbFiN_Aifu5rIMDeKiYED2glfiV78AeOQAFOU2-wnNqyXpMULe32Dc2g3jBhP97dpXTwGo','2026-03-06 11:18:08','2026-03-06 12:02:50','48a8ef76-4bbd-4992-9e04-85d9d6c973bc'),(14,1,'StV4ojutTHcDR1qVZ_jlJqVpvTc1BArT_-Ey0-WQHGYK_-Yjxcuf9gf3cXA_73z86f7wXWS_yzki2uxuDovwczxv1B9q36Bts3Af','2026-03-06 12:02:50','2026-03-06 12:13:17','f437d08b-0c1d-4a16-971c-2b296c79438c'),(15,1,'Jw7UJGeIzJoWxAolT22TttRAEvp-fucnI1bmP0ChTnkaBW93Yz4H8WIE_4RYbjRhvTjLLFwchDZ26TvIvxYPI31vw1YjxGBfAesX','2026-03-06 12:13:17','2026-03-06 13:21:02','f14f52d4-ecb3-4900-9505-b5e26a4c6c8e'),(17,1,'lfylzG1eWgwOfq9G4EMYffNZupZ0FS43LqdnxDLm56TyLva_lN1iccx0YbXAsjzIPONB_Y6VM5V0MyHAWVRNk8OTU3jJSSsmHPkH','2026-03-09 09:01:07','2026-03-09 10:12:11','8fdc0527-7d81-42f0-a326-448c018c0083'),(18,1,'AIVYfY1BWY2IeOq3gJe-q1RiiaKiKjxQbqJYAwjKoehwwksKR_4jqAaAvoetwoH6yM0sooOCeqA0kkmmIcePXeSIahbTVlnkS6Z4','2026-03-09 10:12:11','2026-03-09 10:20:57','51730768-8d64-4b01-be96-e3a6ba05543a'),(19,1,'ubsrEEpjrfCUf5FTbPNcDchTuxnwPiRxPoLiZxRIWdlF_yd0vYC9Pc6uOUZZ43dIB9-PwIBsI7jCgnZZLvbO6lBPDPH3TzxnDFLB','2026-03-09 10:20:58','2026-03-09 15:08:38','852783f4-656a-43c2-b0c0-2e22477d219b'),(20,1,'fA6dukp7vlHgSDkEMFcPKxmnCkFWnBviFueAihDKJc0B8B35TPcAXatFoeZPh1v8PbHysqr-iS_i-4nbpm3mDzKLThQoocLQwoll','2026-03-09 15:08:38','2026-03-09 15:55:37','4dec6877-76de-49c8-9a98-5a8669e20d49'),(21,1,'asmqZkOGJPFngnsY3m4rGAh3xh1NSMbc1Dq8LIzKEAIK2lIu5WDa5AjLbvxswqyRj9iEOwGW-fvYeLnd0tJc1cGkrhS62E-DIiZU','2026-03-09 15:55:38','2026-03-09 16:48:56','5946045b-d82c-494a-94d8-0c354c210487'),(26,1,'DZFoJ1vCjCABDUqvpu2t49SAPaOojbGi4ZI--mCE_hxyIFN-Zg6M09d60eCb8s4bHdxNo9UTUtMG81pM4U4_HQ-txMK9R_rOATF9','2026-03-11 11:36:04','2026-03-11 11:42:49','82c0fc02-d4e7-4ca8-9443-4999a50bcf05');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szztufwibqikwkicctxmiiklekskjshdwnie` (`userId`,`message`),
  CONSTRAINT `fk_dcfsyfmzlaleeyluziwczipdbmhmwyzddfby` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cussqkyarpbpbcluggylsjydlxfkffbqvgkv` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'craftdemo','2026-03-05 09:24:30','2026-03-05 09:24:30',NULL,'9a2c7666-06b1-4bc2-b860-99a02e59175d');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nrnfbkzggyfuzligepllhrdqebfdyecyeuzc` (`dateDeleted`),
  KEY `idx_aglokkyubrwygwkmyiqzekeldtmmbqatlohi` (`handle`),
  KEY `idx_beigcpraygrlunkvwqdnblzrwsfjcmeuewlr` (`sortOrder`),
  KEY `fk_jkbipgkgwtwdonqcrjnxskzlwvyyhltypows` (`groupId`),
  CONSTRAINT `fk_jkbipgkgwtwdonqcrjnxskzlwvyyhltypows` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','craftdemo','default','en',1,'$PRIMARY_SITE_URL',1,'2026-03-05 09:24:30','2026-03-09 11:49:55',NULL,'2f7b266a-df88-4000-846d-383293e57d56');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_yykfaqdhrllikxmdhvmqzaeddcifhpyiolpf` (`userId`),
  CONSTRAINT `fk_yykfaqdhrllikxmdhvmqzaeddcifhpyiolpf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_svylcqkimbejrswjmhwmalykejecgzxnuplf` (`structureId`,`elementId`),
  KEY `idx_utkklohneddruflfhtoqekxfgigoekqeezwi` (`root`),
  KEY `idx_zqvzfthktkygenxeqhpugeteysgkclgqaext` (`lft`),
  KEY `idx_ukyhrwnbyzzfwpactmffjcuavocskphqfvpd` (`rgt`),
  KEY `idx_cgukpwxuplbihmmxgeefjudaksylgylwhdtj` (`level`),
  KEY `idx_kgthqwhppvubeenfjybzjfjyjyeumkmpbqqm` (`elementId`),
  CONSTRAINT `fk_scwgmoizeghnvjxcrhclqkdgvewibmroxqas` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES (1,2,NULL,1,1,6,0,'2026-03-09 09:58:19','2026-03-09 09:58:41','34402f22-3d2a-42b8-9252-73a46ba8c4fe'),(2,2,33,1,2,3,1,'2026-03-09 09:58:19','2026-03-09 09:58:19','f283f3fc-10c4-4cca-ad75-f3cc518d7dd9'),(3,2,34,1,4,5,1,'2026-03-09 09:58:41','2026-03-09 09:58:41','29d8abac-f12a-4743-835f-d919b9b9163f'),(4,3,NULL,4,1,10,0,'2026-03-09 10:07:36','2026-03-10 08:54:51','d4d8a76f-490e-43f1-8892-b2b05e880bad'),(19,3,60,4,4,7,1,'2026-03-09 13:38:09','2026-03-09 16:20:46','4dc470ff-c296-4536-ba4c-43d349e327cf'),(20,3,62,4,5,6,2,'2026-03-09 13:38:36','2026-03-09 16:20:46','f3fc6961-edbf-4432-9663-9b4d57168174'),(21,4,NULL,21,1,12,0,'2026-03-09 13:53:49','2026-03-09 16:00:37','85931fa2-6821-4c6e-8833-326f8ab55804'),(22,4,64,21,2,3,1,'2026-03-09 13:53:49','2026-03-09 13:53:49','38170ca9-5d09-4fad-be46-4c919ff95c7e'),(23,4,65,21,4,5,1,'2026-03-09 13:53:57','2026-03-09 13:53:57','e36676e2-5819-4de4-9761-66195beb1b81'),(24,4,67,21,6,7,1,'2026-03-09 14:05:20','2026-03-09 14:05:20','96e51a73-8fce-4130-9fcb-24f35202baca'),(25,4,93,21,8,9,1,'2026-03-09 15:39:04','2026-03-09 15:39:04','21c9d98e-726f-4218-a96c-a801cde014c7'),(26,4,97,21,10,11,1,'2026-03-09 16:00:37','2026-03-09 16:00:37','a63f43e8-677d-48a7-8e25-744f081c4c84'),(27,3,100,4,2,3,1,'2026-03-09 16:20:24','2026-03-09 16:20:46','b587e72c-324d-43a1-a787-bf4ed533d321'),(28,3,111,4,8,9,1,'2026-03-10 08:54:51','2026-03-10 08:54:51','f4ebfb28-b101-4784-b616-b5f0c6b9be56'),(29,1,NULL,29,1,6,0,'2026-03-10 09:24:36','2026-03-10 10:40:10','32ceec40-5c6c-423f-a34b-8524c82e9b73'),(30,1,116,29,2,3,1,'2026-03-10 09:24:36','2026-03-10 09:24:36','d763555b-0037-4e64-9baa-1b52125d27bf'),(35,1,125,29,4,5,1,'2026-03-10 10:39:10','2026-03-10 10:40:10','96da5774-25f5-4750-8644-cab01c860465'),(36,7,NULL,36,1,8,0,'2026-03-10 10:44:54','2026-03-10 10:46:23','93ecdc39-c906-4d4d-b760-e94e66b9ef68'),(37,7,128,36,2,3,1,'2026-03-10 10:44:54','2026-03-10 10:44:54','3561222a-58f3-45b1-8f90-5188341d9f98'),(38,7,129,36,4,5,1,'2026-03-10 10:45:02','2026-03-10 10:45:02','23807ce5-923e-4e0c-8e35-fa9748fafcc0'),(39,7,132,36,6,7,1,'2026-03-10 10:46:23','2026-03-10 10:46:23','ed5ce613-87f1-46e5-81ba-79ef3e8bf67e'),(40,5,NULL,40,1,4,0,'2026-03-10 10:46:49','2026-03-10 10:46:49','b1ec5628-215c-45b0-8587-c2a1d7a1bc31'),(41,5,133,40,2,3,1,'2026-03-10 10:46:49','2026-03-10 10:46:49','fe694a3b-fdb5-4ffc-bba9-b866a6b02955'),(42,6,NULL,42,1,4,0,'2026-03-10 10:47:40','2026-03-10 10:47:40','932ecb97-9ebd-470e-9de5-716a8d46b7f2'),(43,6,135,42,2,3,1,'2026-03-10 10:47:40','2026-03-10 10:47:40','55365c56-b8e7-411d-a04a-46dfb2d94a8a'),(44,8,NULL,44,1,4,0,'2026-03-10 11:01:32','2026-03-10 11:01:32','0aa56cfd-27ae-4369-a80e-6736a96e1a65'),(45,8,155,44,2,3,1,'2026-03-10 11:01:32','2026-03-10 11:01:32','a6ef10cc-d0c0-47e4-8156-1a7fed5f2217'),(46,10,NULL,46,1,4,0,'2026-03-10 11:02:12','2026-03-10 11:02:12','bb5211aa-b434-4373-8fd0-835fd30262db'),(47,10,157,46,2,3,1,'2026-03-10 11:02:12','2026-03-10 11:02:12','9a438266-6cf2-4561-aa45-de5c511daa6c'),(48,9,NULL,48,1,4,0,'2026-03-10 11:03:04','2026-03-10 11:03:04','99046ec9-177e-4b14-bc27-e27be1482f12'),(49,9,159,48,2,3,1,'2026-03-10 11:03:04','2026-03-10 11:03:04','0ce52c7f-6fa6-4a13-b558-66606c8516b2');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rbtmljqukqkpruhlchihquqfvsqleljqqutv` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,NULL,'2026-03-05 14:19:57','2026-03-05 14:19:57','2026-03-10 10:44:41','24b979f2-f45c-4202-85f1-0dea91d114ad'),(2,NULL,'2026-03-09 09:57:48','2026-03-09 09:57:48','2026-03-09 10:06:33','e926ce31-0b1d-41d2-97d6-6f620516a13e'),(3,NULL,'2026-03-09 10:07:30','2026-03-09 10:07:30',NULL,'1ea8decf-7342-48c2-a442-bb72c98d0539'),(4,NULL,'2026-03-09 13:51:44','2026-03-09 13:51:44',NULL,'f71fd2d7-836b-4007-9293-24a5a5ae5969'),(5,NULL,'2026-03-10 10:41:49','2026-03-10 10:41:49',NULL,'8b47240e-339d-4e1f-b595-deb130b51fc7'),(6,NULL,'2026-03-10 10:43:31','2026-03-10 10:43:31',NULL,'e3b04e12-564f-45de-8cbc-9d666672db10'),(7,NULL,'2026-03-10 10:43:52','2026-03-10 10:43:52',NULL,'9b7efcea-bf5f-4756-bafe-bd8edaf57716'),(8,NULL,'2026-03-10 10:58:22','2026-03-10 10:58:22',NULL,'6f6222db-2634-464f-b16a-96e321971510'),(9,NULL,'2026-03-10 10:59:33','2026-03-10 10:59:33',NULL,'53e26c49-f92c-42ac-8340-398ff2020641'),(10,NULL,'2026-03-10 11:00:39','2026-03-10 11:00:39',NULL,'de915557-d5d9-445f-90d6-296c4ccc67a2');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vdzrkcpxmgwdpmdyncyiuzbdpucxxmcxofpp` (`key`,`language`),
  KEY `idx_shpofudlfnlpvhpovbainzeuyxthzyqporub` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_efhjjfhkgtdmruklarknanypsuyldvxsvedl` (`name`),
  KEY `idx_fpsjaraijruckmjakyliussbmhzcysqahomt` (`handle`),
  KEY `idx_dgkrrxlxuwjlaxwoozrnznzocmqocycfoeec` (`dateDeleted`),
  KEY `fk_hnqsqwngfrdxtzpyvjpzbwmrxaolctjkdoxz` (`fieldLayoutId`),
  CONSTRAINT `fk_hnqsqwngfrdxtzpyvjpzbwmrxaolctjkdoxz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_drpmfwtwepsdvvhpsltlvapfexaqsmajrjxa` (`groupId`),
  CONSTRAINT `fk_ggroyidkaybilgxfpaycanemkhvxzkrxaolf` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zuplcualzrpujlaaosvwpwucdipiyebxxnub` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qtzgdvapzlzzruioxklfjrvurkcefokcwpnp` (`token`),
  KEY `idx_vuakeykuzrikqoqboguzjizkjtqwaiqbavrd` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rmphnfkrrdgjbsrsgvubjtbwbalgkydbtvlm` (`handle`),
  KEY `idx_mrirklqdfauryxqukjvjurqfeazthnkiahfp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES (1,'Team','team',NULL,'2026-03-05 09:43:56','2026-03-05 09:43:56','c55ca0a9-4bd6-409b-afd8-c1884dafecd0');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jnjicqwgcvhxuihztqahiyoxaztolhvuwirr` (`groupId`,`userId`),
  KEY `idx_ichuiqllmqiecrjffddwrzcnowuwefmiwvdx` (`userId`),
  CONSTRAINT `fk_cdwewmkhkniwurmehdujbndgggancyzmapuw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymvfwqoncbvtjcbvtaitlphxpmbjyyxecwei` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cgjfrjjrkszuyegiptmvctlohqwtmuxowsiz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_avffrbipsutofvklfndpxsotmeudrlwpcrkf` (`permissionId`,`groupId`),
  KEY `idx_lbvnaihmwojvoacvqyiqjrznfbyxjutptllm` (`groupId`),
  CONSTRAINT `fk_oxzssxfnclafhrnuvxdjgunnfmthntruiihw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_suuevcpdpguedrkmrvdjaohocaoqagjxxqib` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cwiaivdverryxrccwdptpvnrsubsvnpjzfyh` (`permissionId`,`userId`),
  KEY `idx_byogknnoykdzkbjxvgscitlkwyfjodoqylhk` (`userId`),
  CONSTRAINT `fk_izdbbmwotfkqgdztdfcjjgqdcnkptfjqcssw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vyumkzlutucakoiqmtwlpjhgivpvhgpknoul` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_rqytgnnqlxgpcrwfnpycltgoqeijysvkmvgl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ueoixajrlzlvvazlgsbcxozdrzpiyrpiazyp` (`active`),
  KEY `idx_gcyfbxonkyrwblvvudappskxeonhwoukasqm` (`locked`),
  KEY `idx_jbtohcewbdyjxhkrerlgcckthhwxwlavhbcp` (`pending`),
  KEY `idx_cwsbohitdxocoaxgxgmleecqeuujruqaedlq` (`suspended`),
  KEY `idx_vgfuddtpkbgcffcatsbbdmwswvsacprlhyum` (`verificationCode`),
  KEY `idx_pryhpxwnlugudyshnrwwqeulmclqizwtnpap` (`email`),
  KEY `idx_tmzxzbxwkkmzecxohnmzzgcceftuaucfajjv` (`username`),
  KEY `fk_hlkxmivqvurntlsrmrcqfiqgxtrzxejmkxze` (`photoId`),
  KEY `fk_aywfhgsdyvibikrhhzbhtccjsbvyomkyxfol` (`affiliatedSiteId`),
  CONSTRAINT `fk_aaqxaduzwfujpegpsjjtayamtmsflatnbkal` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_aywfhgsdyvibikrhhzbhtccjsbvyomkyxfol` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hlkxmivqvurntlsrmrcqfiqgxtrzxejmkxze` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'mel',NULL,NULL,NULL,'mel@mel.com','$2y$13$3T/.Sw1FBb33ziz8vjh7JO0qAl6KWDZhhAND2lXROH6.4XA1lD//G','2026-03-11 11:36:04',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-03-05 09:24:31','2026-03-05 09:24:31','2026-03-11 11:36:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gfzkfgnlbxezeahqjaxmiptbziiwyvzelheu` (`name`,`parentId`,`volumeId`),
  KEY `idx_jofaobkwhkweiteaebuoqohhrjwuozplfbhd` (`parentId`),
  KEY `idx_uupemvhcdgfhnucyqwgyyggrjhuvxtbwkymt` (`volumeId`),
  CONSTRAINT `fk_dxodbmuickfsbzsphrjzuuoikzsgyxdyzwyj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yveuegsyjzyxqqaqzsthqaiizinmzbsgywru` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images',NULL,'2026-03-05 14:21:00','2026-03-06 12:17:18','52830df4-29f3-43a1-bbee-dc1d6ce7aa4e'),(2,NULL,NULL,'Temporary Uploads',NULL,'2026-03-05 14:21:02','2026-03-05 14:21:02','5eb85833-2b64-498d-a723-354eb8cfd38e'),(3,2,NULL,'user_1','user_1/','2026-03-05 14:21:02','2026-03-05 14:21:02','07e8bcc7-21b9-42a2-bb6f-949af87bf2e7'),(4,NULL,2,'Downloads','','2026-03-10 10:21:33','2026-03-10 10:21:33','b2551809-e73f-4b83-9849-94d00fe02077');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xapctmrzsduemgamtdkbjturlitesecklmvw` (`name`),
  KEY `idx_qqnzkwwdudobbmfryylplssgkisdkbasjnnj` (`handle`),
  KEY `idx_byuyizgnjijusllrxbtycggsllyhvnqjjufi` (`fieldLayoutId`),
  KEY `idx_spajqwsyqmzktbojvpglfdyszhpeqlsmwfdo` (`dateDeleted`),
  CONSTRAINT `fk_eomopjquwkloqyzadytynwqbjzrneyeofncx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,4,'Images','images','images','','images','','site',NULL,'none',NULL,1,'2026-03-05 14:21:00','2026-03-06 12:17:18',NULL,'eb1cb63c-522c-4d85-b36a-032c74affb66'),(2,13,'Downloads','downloads','downloads','','','','site',NULL,'none',NULL,2,'2026-03-10 10:21:33','2026-03-10 10:21:33',NULL,'2ade3efe-b97d-4fea-999b-8668f095bc4d');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_klzqsrntjrtyktqjijefuwtdakkgafwczxqq` (`userId`),
  CONSTRAINT `fk_klzqsrntjrtyktqjijefuwtdakkgafwczxqq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gsdxcxmymygfgjyxctpjmhcqumfmurqwswec` (`userId`),
  CONSTRAINT `fk_mjyvtgflekcbzyfxjnzorkmxxcmrvolgdhwp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}','2026-03-05 09:25:47','2026-03-05 09:25:47','028f6987-2670-41d3-a79d-103a27220f1d'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]','2026-03-05 09:25:47','2026-03-05 09:25:47','f5ecb75a-ea54-4682-8621-6d18695d4c96'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]','2026-03-05 09:25:47','2026-03-05 09:25:47','a085c7af-077f-4ea3-b31e-c126c0f522ff'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}','2026-03-05 09:25:47','2026-03-05 09:25:47','7b7e8f63-0736-4d6d-9ba6-c16627dc0b47');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 13:17:09
