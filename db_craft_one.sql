-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_craft_one
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cokymikxjcsgkhnhxirdfvhidbokpxzkbtpv` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_jyzrcicrmdmwzjmejjdlkgslwkvencejqvzy` (`dateRead`),
  KEY `fk_djnzdtozlefserxvunahjsycykohrfkmomyb` (`pluginId`),
  CONSTRAINT `fk_djnzdtozlefserxvunahjsycykohrfkmomyb` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ypmqdqwegchtekfkobzhkqfgmbcqmepgtsyu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_paoppzdjfyqocgklxvzdoxdlcnmblrlzksju` (`sessionId`,`volumeId`),
  KEY `idx_bwqqnzjwahnmudqmlhcznrrutwfkwgrmkiel` (`volumeId`),
  CONSTRAINT `fk_zxjjqwhicltfceeqmcdedktvxmqdkdkwdqzh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
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
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aqbltlwbpaqinvqeregymdwzzfpxjtkkutvx` (`filename`,`folderId`),
  KEY `idx_ubxogtkuennqdmxusndudmduzxaznbecnuux` (`folderId`),
  KEY `idx_sfwzvxwoiioddalkatyerjjpadfghztfoimk` (`volumeId`),
  KEY `fk_pktfspwqontsjpelkfdzsxugmfhldpmbsfej` (`uploaderId`),
  CONSTRAINT `fk_hpsaffgnteqeklzjragepugdfvcathrdkgvk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oaejdvcnseaqkkxfogpuvyvvinrdyovwkfhb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pktfspwqontsjpelkfdzsxugmfhldpmbsfej` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zlvfjvbwblotfuvhvleznvznndgoquljsrcv` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dsibsmkcdlpdkcptipcnizdkmcyfjgidymce` (`volumeId`,`assetId`,`location`),
  KEY `idx_lhwvffijupdivewqogvmcwjjmbureziidpwv` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yccdyqkllbvljymmhyqibncnymdcbftjnbho` (`name`),
  KEY `idx_mwxhxsaefsqkfzgswvscshclefvirbwxkqhi` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xsmaafxodypynpceodrdseqhabhmotqxrtuo` (`groupId`),
  KEY `fk_zkkmxmodedmxvfskilzibbwtejrwccvgkieb` (`parentId`),
  CONSTRAINT `fk_khhffnezikqiwdqapuynwgkmxbbnzezeotba` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oczkjmnakqfiwvrqjoiapadetjoapmjsmsyj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkkmxmodedmxvfskilzibbwtejrwccvgkieb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pseumbpelhogafrvnuosqxmwdqhqaogkalac` (`name`),
  KEY `idx_dlfilofzbgnxdyzvdccwgimjgytwglfgqskg` (`handle`),
  KEY `idx_kxqgpxtuvtzbcqniscdpwlqghhhnvuanamfb` (`structureId`),
  KEY `idx_vfafbcxloksnsxzdhqyinsdfrbsutdnemgsj` (`fieldLayoutId`),
  KEY `idx_vnvgfrobxkawxtjcfppxdqitskcpvbatvxut` (`dateDeleted`),
  CONSTRAINT `fk_nlkliyvaelngiznmelkjewvbbdklrvuitqcy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vyymvojbdrzbzaqrvoanjmlfoezjidexsuhh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
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
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lrlcytkeofgaakpouyspearpfbqubiqzksrj` (`groupId`,`siteId`),
  KEY `idx_rnssxarhqhnhbcyaihufhhcairzafqzzbzci` (`siteId`),
  CONSTRAINT `fk_ceaqonaujupnxchpfyfpckjgnrazazncmmjo` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zspgifunrnelidmxciklvxbazrpgtprijrpn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
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
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_wmrvdrhmgjscbpkoecyfegupdiuanlntmcxd` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_agnrxjdwrekmsnqzlxhjlyubpvjfnetbadku` (`siteId`),
  KEY `fk_fouogwzliqaeqtdejglesosqwdmfhvzreizm` (`userId`),
  CONSTRAINT `fk_agnrxjdwrekmsnqzlxhjlyubpvjfnetbadku` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fouogwzliqaeqtdejglesosqwdmfhvzreizm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mfnrvbilbpnvmczhgoyrwclvsniffhrykfbj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2022-02-20 11:56:50',0,1),(1,1,'lastName','2022-02-20 11:56:50',0,1),(2,1,'title','2022-02-21 13:32:54',0,1),(2,1,'uri','2022-02-21 13:29:26',0,1);
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
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_pmbnfnjykoynavvlmlheylkdsbtxfqnvsver` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cdqtbxumimvqinjpmddhkefykodqogzsrour` (`siteId`),
  KEY `fk_zvuxvdnnjrlrohbubjqgwjjtpfgiizhjrthr` (`fieldId`),
  KEY `fk_xrmekknphozqerpqbagzzimdhityidrfyfph` (`userId`),
  CONSTRAINT `fk_cdqtbxumimvqinjpmddhkefykodqogzsrour` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xmydkffixmvtmbvlcxtvkbwplldubgkhmulg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xrmekknphozqerpqbagzzimdhityidrfyfph` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zvuxvdnnjrlrohbubjqgwjjtpfgiizhjrthr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_urjvsyqkqoduapcbbbipppocwinlzswgqjwi` (`elementId`,`siteId`),
  KEY `idx_oiymvhidvyspoxvbsqhgqpockerrzwjgugeh` (`siteId`),
  KEY `idx_amhhzbzmxnbvcxirihiiccqjjibgedogcwdn` (`title`),
  CONSTRAINT `fk_iyutokjakjrxlrvlpruenxemuaeynetoakfk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rwbdpwyoachehcgdxjfcacregafzmevjmbag` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-02-20 10:15:56','2022-02-20 11:57:58','ce000613-186b-4258-90e5-585b6fa50d71'),(2,2,1,'Contact','2022-02-20 10:53:01','2022-02-21 13:32:54','52d20799-0b72-47c3-a9e7-d9ee97891902'),(3,3,1,'contact','2022-02-20 10:53:01','2022-02-20 10:53:01','7a5300ed-e42e-47a0-856f-a960d0b78d16'),(4,4,1,NULL,'2022-02-21 13:05:31','2022-02-21 13:06:21','39a6500c-9923-48b3-9c8b-32f6a02917f1'),(5,5,1,NULL,'2022-02-21 13:27:06','2022-02-21 13:35:18','cf1d7db6-19fa-491d-b790-e8568085b01b'),(7,7,1,'contact','2022-02-21 13:29:26','2022-02-21 13:29:26','6e12cf2b-0dc9-4e8d-899c-84b00680510a'),(8,8,1,'About Us','2022-02-21 13:30:34','2022-02-21 13:30:34','9f4799b3-1253-44d6-b2c6-968d5acb5d40'),(9,9,1,'About Us','2022-02-21 13:30:34','2022-02-21 13:30:34','e8c1c873-7bb0-456c-adf1-180494db4811'),(10,10,1,'Services','2022-02-21 13:31:17','2022-02-21 13:31:17','445ce74c-5cdf-4107-a647-2e2c427a6276'),(11,11,1,'Services','2022-02-21 13:31:17','2022-02-21 13:31:17','4ed813a1-ef0e-4147-852b-253aee94fc71'),(12,12,1,'Clients','2022-02-21 13:31:47','2022-02-21 13:31:47','ae9b92c7-07d0-46a1-89c5-0c3ced17a5f2'),(13,13,1,'Clients','2022-02-21 13:31:47','2022-02-21 13:31:47','9522d585-1052-4601-a1b4-94e5a114a370'),(14,14,1,'Media','2022-02-21 13:32:12','2022-02-21 13:32:12','afa8460d-d007-4301-8c3a-1d772e221db1'),(15,15,1,'Media','2022-02-21 13:32:12','2022-02-21 13:32:12','9d2fd673-93ec-4cd8-8ec4-72c8f8340474'),(16,16,1,'Contact','2022-02-21 13:32:54','2022-02-21 13:32:54','447991d1-081f-489b-a3bf-25e20d92a07b'),(17,22,1,NULL,'2022-02-21 13:56:15','2022-02-21 13:58:08','ba76d70c-215f-4479-bf67-c1cf15605dca');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
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
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gegdredngqlmoebdzsyphjmogorentlkkigw` (`userId`),
  CONSTRAINT `fk_gegdredngqlmoebdzsyphjmogorentlkkigw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mcgecxsaomxofdjkkvqiwwtsbdeuulepdeer` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_vyoedmneujgfnnsaphkufysynfrgclcyzsec` (`creatorId`,`provisional`),
  KEY `idx_aiqbcctkjagkykxubxpjwkhjmsszlbwuytrd` (`saved`),
  KEY `fk_mxfeqbjnjghsaxdpiwiunidkxrtkpznyennd` (`sourceId`),
  CONSTRAINT `fk_mxfeqbjnjghsaxdpiwiunidkxrtkpznyennd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_szbymidkswpagititwaxswwxuzasfzgcwxdh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uwnmoaxlczpjshpkymxubdxntxvtazipyudi` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
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
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_abkbzjxeztpkmewjkgzotlcbbigicqypgzye` (`dateDeleted`),
  KEY `idx_ieymtegdxrzpglqcolfcfmgkpwgydcquqhtg` (`fieldLayoutId`),
  KEY `idx_gxyttvxftfxxvgrpaavsdnqesbhrueonvbgx` (`type`),
  KEY `idx_bkavshvdvrhwimxomeyalpzjpzujxufubyyr` (`enabled`),
  KEY `idx_rkummngevwglegepqbkvmzgaixjhwwrpxbze` (`archived`,`dateCreated`),
  KEY `idx_esebnssyrouvvsyfwudvpjohwptzwcjngeio` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_aeestszmidsaiqqddzyzpuldjlifojxbqxhb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_tokesdljmkbuasbmnyfegffjegzjfifxouad` (`canonicalId`),
  KEY `fk_hozhgocwsfdozaqwengyhqasgzvwdsfgosuo` (`draftId`),
  KEY `fk_moscimukygwkxaetcfhtwvmndmdxvanvgfab` (`revisionId`),
  CONSTRAINT `fk_hozhgocwsfdozaqwengyhqasgzvwdsfgosuo` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_moscimukygwkxaetcfhtwvmndmdxvanvgfab` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nrnqbadgdfeshaflxmblfptxmuutxjyqoqvs` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tokesdljmkbuasbmnyfegffjegzjfifxouad` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-02-20 10:15:56','2022-02-20 11:57:57',NULL,NULL,'d4b58686-ecbc-46d6-a1e8-ca86d1e96665'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-02-20 10:53:01','2022-02-21 13:32:54',NULL,NULL,'f35dcf20-49e7-442c-b7d8-d48fed36f502'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-02-20 10:53:01','2022-02-20 10:53:01',NULL,NULL,'30cb9f28-f7c4-488a-a951-1b590cbcceca'),(4,NULL,NULL,NULL,2,'craft\\elements\\GlobalSet',1,0,'2022-02-21 13:05:31','2022-02-21 13:06:21',NULL,'2022-02-21 13:13:03','b2958896-4743-4288-8bb3-392c6db5baee'),(5,NULL,NULL,NULL,5,'craft\\elements\\GlobalSet',1,0,'2022-02-21 13:27:06','2022-02-21 13:35:18',NULL,NULL,'a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1'),(7,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-02-21 13:29:26','2022-02-21 13:29:26',NULL,NULL,'00942e29-59fe-4dcb-855f-c6a9833fefce'),(8,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2022-02-21 13:30:34','2022-02-21 13:30:34',NULL,NULL,'f6377ef5-2e84-441a-818c-179455f8da08'),(9,8,NULL,3,6,'craft\\elements\\Entry',1,0,'2022-02-21 13:30:34','2022-02-21 13:30:34',NULL,NULL,'95231e24-f62b-484e-9baf-a363931467bd'),(10,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2022-02-21 13:31:17','2022-02-21 13:31:17',NULL,NULL,'32017551-672e-48c5-9603-8ec4c73f7195'),(11,10,NULL,4,7,'craft\\elements\\Entry',1,0,'2022-02-21 13:31:17','2022-02-21 13:31:17',NULL,NULL,'182f24ac-e14b-47aa-9141-8830181b0069'),(12,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-02-21 13:31:47','2022-02-21 13:31:47',NULL,NULL,'da010203-e95f-4533-8b7a-12beba060ef4'),(13,12,NULL,5,8,'craft\\elements\\Entry',1,0,'2022-02-21 13:31:47','2022-02-21 13:31:47',NULL,NULL,'10c7ee6b-e815-4a8d-887a-eacb0a6be34a'),(14,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2022-02-21 13:32:12','2022-02-21 13:32:12',NULL,NULL,'706b69d7-f890-4653-ae0e-0d47cc431cd0'),(15,14,NULL,6,9,'craft\\elements\\Entry',1,0,'2022-02-21 13:32:12','2022-02-21 13:32:12',NULL,NULL,'5122699f-cee4-4071-9e3a-913a899ecd1c'),(16,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-02-21 13:32:54','2022-02-21 13:32:54',NULL,NULL,'92a0a12c-188b-4b5f-be44-6567ad1e91d6'),(17,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-02-21 13:35:18','2022-02-21 13:35:18',NULL,NULL,'cf8ae080-a8c5-4738-a186-9d6f6c9b78e0'),(18,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-02-21 13:35:18','2022-02-21 13:35:18',NULL,NULL,'689a99ef-1057-438a-9079-057e8f760e5f'),(19,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-02-21 13:35:18','2022-02-21 13:35:18',NULL,NULL,'461f0a24-c1f4-4345-8013-2efdcdc38ca4'),(20,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-02-21 13:35:18','2022-02-21 13:35:18',NULL,NULL,'5bba40b2-3d7a-4126-9902-f02b2a15cc9b'),(21,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-02-21 13:35:18','2022-02-21 13:35:18',NULL,NULL,'b69a5629-1ea4-45f9-b03e-da24468fc230'),(22,NULL,NULL,NULL,10,'craft\\elements\\GlobalSet',1,0,'2022-02-21 13:56:15','2022-02-21 13:58:08',NULL,'2022-02-21 13:58:55','85a654c5-1e17-4ad0-834e-44359ea55920');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
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
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ujzyiodnetwbpmuqnczgkytyaitaskptexhu` (`elementId`,`siteId`),
  KEY `idx_zacvsnqmpzdyvzgwijxmzqozkigjnhzbqtgw` (`siteId`),
  KEY `idx_dtlsgactuhiuofsvvskohbemvfslatghxrqh` (`slug`,`siteId`),
  KEY `idx_fdqtpvyynzmepslblysnitemcnukevicybzj` (`enabled`),
  KEY `idx_tcytretdxzjefptkavfwfzvshfauwracfqlw` (`uri`,`siteId`),
  CONSTRAINT `fk_pyhuupcheknoekmdfjomquoiuxdfgtkrjciy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yjznpgjlvdasfnehfpibzpsbwauwnxasdjbo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-02-20 10:15:56','2022-02-20 10:15:56','90ed192d-a447-4219-975d-1fed630d9659'),(2,2,1,'contact','contact',1,'2022-02-20 10:53:01','2022-02-21 13:29:26','c8a05e0b-6e4b-46f9-a3e9-5fe91bfe4b09'),(3,3,1,'contact','localhost/example-craft-one/web/contact',1,'2022-02-20 10:53:01','2022-02-20 10:53:01','5829e851-2fd7-47be-8ea9-8967022955d5'),(4,4,1,NULL,NULL,1,'2022-02-21 13:05:31','2022-02-21 13:05:31','d80f7d87-1aed-4208-9367-d35ae0168832'),(5,5,1,NULL,NULL,1,'2022-02-21 13:27:06','2022-02-21 13:27:06','7c784363-55fd-4536-9df5-e77c591fdb9e'),(7,7,1,'contact','contact',1,'2022-02-21 13:29:26','2022-02-21 13:29:26','d78e790f-e18a-481d-84e2-5dc6e311b6f3'),(8,8,1,'about-us','about',1,'2022-02-21 13:30:34','2022-02-21 13:30:34','ea1bd170-5fd2-4ef0-95d8-57e5752b727e'),(9,9,1,'about-us','about',1,'2022-02-21 13:30:34','2022-02-21 13:30:34','38b27cbc-d6fe-4ab4-a8da-1c2297350f11'),(10,10,1,'services','services',1,'2022-02-21 13:31:17','2022-02-21 13:31:17','28f8fa3b-5b3f-4996-8a6d-dc659b7cb9ff'),(11,11,1,'services','services',1,'2022-02-21 13:31:17','2022-02-21 13:31:17','c44a3635-aaac-43ef-96ba-4a6597fd33ec'),(12,12,1,'clients','clients',1,'2022-02-21 13:31:47','2022-02-21 13:31:47','98c34fae-1e06-4c93-9d0a-9d5cc2ae6989'),(13,13,1,'clients','clients',1,'2022-02-21 13:31:47','2022-02-21 13:31:47','b6b1911d-a428-4152-8cc9-b574562e2a46'),(14,14,1,'media','media',1,'2022-02-21 13:32:12','2022-02-21 13:32:12','42d0dd8e-a5f8-4c45-be59-290d8a0f7649'),(15,15,1,'media','media',1,'2022-02-21 13:32:12','2022-02-21 13:32:12','4f438fbf-0760-4848-ad2d-82cfea3de71c'),(16,16,1,'contact','contact',1,'2022-02-21 13:32:54','2022-02-21 13:32:54','7622d198-cdf5-4576-b0f9-6595241e22fc'),(17,17,1,NULL,NULL,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','046378a7-3016-4271-8d04-ad70208c0d51'),(18,18,1,NULL,NULL,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','8e887090-4c18-4eb9-9f59-b9caf420239c'),(19,19,1,NULL,NULL,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','3680c9d4-1df8-422a-951c-9c2721100948'),(20,20,1,NULL,NULL,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','4810765f-fea1-41b6-b15d-9c395067fbb8'),(21,21,1,NULL,NULL,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','f8059d08-7cdd-4f13-895b-9369e7558d35'),(22,22,1,NULL,NULL,1,'2022-02-21 13:56:15','2022-02-21 13:56:15','fccd5e6f-ff9d-47b6-878f-3eac0a2af904');
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
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztuoxhuhywfozgoonwhegglxqfqgdzyrkidr` (`postDate`),
  KEY `idx_vvtgpmxuhgvejolsschuhjimopvatmrfpgik` (`expiryDate`),
  KEY `idx_vddyudyrsjyepketvpooidhlkeaxwhyqohzv` (`authorId`),
  KEY `idx_kirrunqabhiyljcxjbmhobbokxlwyqccytwu` (`sectionId`),
  KEY `idx_nfgtpnumjuwpmicbpflatbxcwccipbgnhksc` (`typeId`),
  KEY `fk_xccfgojwdbaalcpixolvzuyelycspydtlttc` (`parentId`),
  CONSTRAINT `fk_idpqidqwzusduixvkqcpthokzyuxolsqegvi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jqfjamlczggwwopdlfqifvamzhysbjvofmoq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lnqneapvkxugumjnyldqrqgqmbewoxxiqnht` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qddrsxwastfwcfkbtgyiozfkpcarpffarhrn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xccfgojwdbaalcpixolvzuyelycspydtlttc` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2022-02-20 10:53:00',NULL,NULL,'2022-02-20 10:53:01','2022-02-20 10:53:01','fb3b3863-1521-4ca4-ae40-62f77532ee50'),(3,1,NULL,1,NULL,'2022-02-20 10:53:00',NULL,NULL,'2022-02-20 10:53:01','2022-02-20 10:53:01','c2c1a6b3-ede8-45cc-b30f-9c7c5d0bf93b'),(7,1,NULL,1,NULL,'2022-02-20 10:53:00',NULL,NULL,'2022-02-21 13:29:26','2022-02-21 13:29:26','ef1b522d-f371-4fb4-9058-83cc79bac786'),(8,2,NULL,2,NULL,'2022-02-21 13:30:00',NULL,NULL,'2022-02-21 13:30:34','2022-02-21 13:30:34','2c7c471d-e842-4d08-9077-de1b76ca3c47'),(9,2,NULL,2,NULL,'2022-02-21 13:30:00',NULL,NULL,'2022-02-21 13:30:34','2022-02-21 13:30:34','38827532-63b5-4aec-9e80-293ebfd703f7'),(10,3,NULL,3,NULL,'2022-02-21 13:31:00',NULL,NULL,'2022-02-21 13:31:17','2022-02-21 13:31:17','2c30e2cb-5928-4f8a-a08d-614b1fdcc693'),(11,3,NULL,3,NULL,'2022-02-21 13:31:00',NULL,NULL,'2022-02-21 13:31:17','2022-02-21 13:31:17','da5775a4-0037-4193-952d-47295c66d774'),(12,4,NULL,4,NULL,'2022-02-21 13:31:00',NULL,NULL,'2022-02-21 13:31:47','2022-02-21 13:31:47','63260f7d-d773-4532-801f-4412087d5630'),(13,4,NULL,4,NULL,'2022-02-21 13:31:00',NULL,NULL,'2022-02-21 13:31:47','2022-02-21 13:31:47','4a55fe42-62ef-4af8-abb8-5bc662a5358c'),(14,5,NULL,5,NULL,'2022-02-21 13:32:00',NULL,NULL,'2022-02-21 13:32:12','2022-02-21 13:32:12','e4a5d6d7-d88e-4eed-a560-6a57fed4c522'),(15,5,NULL,5,NULL,'2022-02-21 13:32:00',NULL,NULL,'2022-02-21 13:32:12','2022-02-21 13:32:12','ebfeb3f5-57a3-4e87-849e-1b9aacf49b74'),(16,1,NULL,1,NULL,'2022-02-20 10:53:00',NULL,NULL,'2022-02-21 13:32:54','2022-02-21 13:32:54','8ad3df98-204f-4320-8dcf-eb440837eb84');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmlqazzmokpmkavfofaehmzdekyymnhelqxo` (`name`,`sectionId`),
  KEY `idx_zqxvelpcxktrzchxsnbevsfainofzdarcwxh` (`handle`,`sectionId`),
  KEY `idx_mqmmmcjthwebubwuzpbcxdilocykpsrcsgtz` (`sectionId`),
  KEY `idx_hfazwrbplpsuaasjuaopllxbowhryqanuqms` (`fieldLayoutId`),
  KEY `idx_idlldcqltiuibvzbgfogjkpunegbmjfblsea` (`dateDeleted`),
  CONSTRAINT `fk_bxvqbgbgkyglfwhancygnykupcvnsbbsjzks` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hibozanfhhmxoytfbokwesjheeqscjqicthh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Contact','contact',0,'site',NULL,'{section.name|raw}',1,'2022-02-20 10:53:01','2022-02-21 13:32:54',NULL,'21db52f6-c3ca-4c68-ab9c-919416b071dc'),(2,2,6,'About Us','about',0,'site',NULL,'{section.name|raw}',1,'2022-02-21 13:30:34','2022-02-21 13:30:34',NULL,'6464eb26-37ac-4543-b412-7cffdb3ab8d1'),(3,3,7,'Services','services',0,'site',NULL,'{section.name|raw}',1,'2022-02-21 13:31:17','2022-02-21 13:31:17',NULL,'78151dfa-65d5-4575-867f-0f743efaac0d'),(4,4,8,'Clients','clients',0,'site',NULL,'{section.name|raw}',1,'2022-02-21 13:31:47','2022-02-21 13:31:47',NULL,'07947859-a55f-4c09-987f-de0b639a5300'),(5,5,9,'Media','media',0,'site',NULL,'{section.name|raw}',1,'2022-02-21 13:32:12','2022-02-21 13:32:12',NULL,'cb2411de-20bc-4a27-b5ad-e388f94e6c93');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uuwtmnqwwimktppnjbyokkaocyayluostayn` (`name`),
  KEY `idx_jnelnkfgmdcwitifhmuwdcggzelithwlmnjc` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-02-20 10:15:56','2022-02-20 10:15:56',NULL,'2b232fb3-8c46-45ba-8cf6-033789dbedf4'),(2,'Main Navigation','2022-02-21 13:16:39','2022-02-21 13:16:39','2022-02-21 13:21:27','d10b2497-cf57-468b-918d-de52d465cb46');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vaewctklftrmglzzyjukyslfyyudcyaoavbb` (`layoutId`,`fieldId`),
  KEY `idx_bggmqpcokextxhskcbiannfpwwcugrazjmda` (`sortOrder`),
  KEY `idx_jbiltebquubkfocdtheiwereybpmaaunvwyi` (`tabId`),
  KEY `idx_otkacaqvnhczvautuwlowgczzyykqrbldwmy` (`fieldId`),
  CONSTRAINT `fk_fgpmxclzgacvjsnippalagjmmusizgioyhku` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_grmjckdcbnmurqbtiqcodcrmebguobprdzdl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymwljpfurkawhywtwhgxrasrahiewhobvvpl` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (3,4,6,4,1,0,'2022-02-21 13:25:50','2022-02-21 13:25:50','736dbb83-afe3-4bc8-a940-4273d7cf5f59'),(4,4,6,5,1,1,'2022-02-21 13:25:50','2022-02-21 13:25:50','ada0a4b4-d633-4595-9e6a-10ce4990baa6'),(5,5,7,3,0,0,'2022-02-21 13:27:06','2022-02-21 13:27:06','fd91e25c-1806-487b-90c3-d6efa61a0879');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lvqkrgjnorsaehamvnrlddbrouoieupiqjkh` (`dateDeleted`),
  KEY `idx_xetseyiqydyugroeatuorkiiyzpryzastofq` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-02-20 10:53:01','2022-02-20 10:53:01',NULL,'081c1484-21c8-4487-948b-1da0a13db78f'),(2,'craft\\elements\\GlobalSet','2022-02-21 13:05:30','2022-02-21 13:05:30','2022-02-21 13:13:03','9b6e8a03-101f-42c3-9aa2-3c467820d20b'),(3,'craft\\elements\\MatrixBlock','2022-02-21 13:20:23','2022-02-21 13:20:23','2022-02-21 13:21:27','e09095c0-cc17-413e-b0ba-237fe1b9fe0e'),(4,'craft\\elements\\MatrixBlock','2022-02-21 13:22:16','2022-02-21 13:22:16',NULL,'16e35c38-944d-4daf-ad7a-901bce3aab83'),(5,'craft\\elements\\GlobalSet','2022-02-21 13:27:06','2022-02-21 13:27:06',NULL,'201bb17d-1193-4006-8ce6-e47fe8c2d610'),(6,'craft\\elements\\Entry','2022-02-21 13:30:34','2022-02-21 13:30:34',NULL,'73305c7e-0266-4607-908d-35c7fff0f1a7'),(7,'craft\\elements\\Entry','2022-02-21 13:31:17','2022-02-21 13:31:17',NULL,'ca754324-8974-47f2-8990-3b5dfdb333ac'),(8,'craft\\elements\\Entry','2022-02-21 13:31:47','2022-02-21 13:31:47',NULL,'b813fd0b-08c9-4ea2-b87f-03acb7030da6'),(9,'craft\\elements\\Entry','2022-02-21 13:32:12','2022-02-21 13:32:12',NULL,'63cc22fb-faaf-4ba5-beed-8f950295e92c'),(10,'craft\\elements\\GlobalSet','2022-02-21 13:56:15','2022-02-21 13:56:15','2022-02-21 13:58:55','0d33bf72-aeed-4ad0-a09b-620e5597ee6e');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_brtqqohxkayopoqzlngflyjeayftbsossbyt` (`sortOrder`),
  KEY `idx_qfxeeuvstlptzxpouakqlazvlylesyxeihwr` (`layoutId`),
  CONSTRAINT `fk_dypsmizdydvntyhyxcviiwcqasghqlcinwpx` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (3,2,'home','[{\"type\":\"craft\\\\fieldlayoutelements\\\\Heading\",\"heading\":\"Home\"}]',1,'2022-02-21 13:06:21','2022-02-21 13:06:21','4fc928d2-16c3-461e-a754-6ffdc89a56f2'),(4,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":75,\"fieldUid\":\"a31f57f5-9e0b-433d-a570-16656fd10fdf\"}]',1,'2022-02-21 13:20:23','2022-02-21 13:20:23','c79e5de1-c69a-4839-be36-36545d98eb1b'),(6,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"66572391-eb02-4ac6-8012-251bb8ab626d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"8f29e7f1-4c89-4fd7-a889-3b70a397efd1\"}]',1,'2022-02-21 13:25:49','2022-02-21 13:25:49','02f608d3-9aaa-4556-b557-8cfe60fe3437'),(7,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5805266d-5664-4a42-91a6-cad390cda016\"}]',1,'2022-02-21 13:27:06','2022-02-21 13:27:06','a6db2a8c-90b1-4316-a3e9-ed809e3877a7'),(8,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-21 13:30:34','2022-02-21 13:30:34','9cf3f6e0-33c4-48b8-8dd3-127a8e0e5e84'),(9,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-21 13:31:17','2022-02-21 13:31:17','3741982a-9820-40da-a116-f48023a1c9b3'),(10,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-21 13:31:47','2022-02-21 13:31:47','d764d828-8ca1-4237-9b05-b276dadaf1cc'),(11,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-21 13:32:12','2022-02-21 13:32:12','0b69d529-398a-4242-b762-613dedb40322'),(12,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-21 13:32:54','2022-02-21 13:32:54','78083331-2ee0-4c84-a67f-6d14fbd53fe8'),(13,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2684b69b-204b-49de-b025-b003808b0244\"}]',1,'2022-02-21 13:56:15','2022-02-21 13:56:15','915ae754-0042-49a1-8dc0-199d35c289ef');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tmzmrbidjdtalrbbqibgimrdcjfqagdkpecu` (`handle`,`context`),
  KEY `idx_ylhuwchhfjnqyvmfyksycbfyomrqkadiiffc` (`groupId`),
  KEY `idx_ywkmjjmmfimvtxajbuiqlyteyqvdkhpdkuws` (`context`),
  CONSTRAINT `fk_ilrudrynkyqrfsqdrvrvnsokbhlndfzxxdrf` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (3,1,'Nav Links','navLinks','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_navlinks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-02-21 13:22:16','2022-02-21 13:22:16','5805266d-5664-4a42-91a6-cad390cda016'),(4,NULL,'Link Text','linkText','matrixBlockType:11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-02-21 13:22:16','2022-02-21 13:25:49','66572391-eb02-4ac6-8012-251bb8ab626d'),(5,NULL,'Link Destination','linkDestination','matrixBlockType:11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"Select an entry\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-02-21 13:25:49','2022-02-21 13:25:49','8f29e7f1-4c89-4fd7-a889-3b70a397efd1');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eltfybvyfmloudvmuizqmvyiztdfiwiiolcg` (`name`),
  KEY `idx_gcgvxekqrpwlpmyautsfprglswcgfezuvjml` (`handle`),
  KEY `idx_wbyntqpucgzuhcxoiwyqkbkwqxsgstmuzzvf` (`fieldLayoutId`),
  KEY `idx_mbdzqbplzoshorcfmiaijegiepjtlkucaszt` (`sortOrder`),
  CONSTRAINT `fk_kindtfxabzrvavrpixewtzrbqmqhtuurjarv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vhjoyafcphirwxcdsqgxwmvlvrshspuaxyky` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (4,'list-nav','listNav',2,1,'2022-02-21 13:05:31','2022-02-21 13:05:31','b2958896-4743-4288-8bb3-392c6db5baee'),(5,'Header','header',5,2,'2022-02-21 13:27:06','2022-02-21 13:27:06','a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1'),(22,'Jumbotron','jumbotron',10,3,'2022-02-21 13:56:15','2022-02-21 13:56:15','85a654c5-1e17-4ad0-834e-44359ea55920');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gkibjoloteepwwbcmpaaonfkbxlydguuhgcc` (`accessToken`),
  UNIQUE KEY `idx_uuwzktvzrsebsepewikfjhzlcqwnxoectvuk` (`name`),
  KEY `fk_jrrasohllzpmyxrizmxmwexsyewggdrkqzgh` (`schemaId`),
  CONSTRAINT `fk_jrrasohllzpmyxrizmxmwexsyewggdrkqzgh` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.7.33','3.7.33',0,'jmbbidrknbrc','2@xldhwecket','2022-02-20 10:15:56','2022-02-21 14:09:07','c04a738f-80c7-4e9c-be4c-76126631fccd');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vfjnbmdbpgcctggszuostomaumhdqjxhtuvn` (`ownerId`),
  KEY `idx_cndbkofrndqfdtzzyosmiodcnpigjpqzbipe` (`fieldId`),
  KEY `idx_zcaprzirrqmcjkogqmuoondahesuhdtrjxbg` (`typeId`),
  KEY `idx_pcirzczorzcvumgyqhekqtyslxomspeoewgd` (`sortOrder`),
  CONSTRAINT `fk_gmrbsjkceelxfoenfcqhqmifigstjpjsgdrf` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mckxuclzuqjqoqfcnvzbjytkozzqbtuhmhgw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnzdnhoeezjmqxhgdvvfgqezinievrktgfvc` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrxrffyuailzkqzhrdiplpuquaybthttkflw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (17,5,3,2,1,NULL,'2022-02-21 13:35:18','2022-02-21 13:35:18','103dce83-2160-4dc8-9c8a-39fc4e14ab96'),(18,5,3,2,2,NULL,'2022-02-21 13:35:18','2022-02-21 13:35:18','2c66cb15-e3b3-4c04-a7d9-b76b5077797c'),(19,5,3,2,3,NULL,'2022-02-21 13:35:18','2022-02-21 13:35:18','e3b7a509-738f-4208-8be1-a885001b5c7a'),(20,5,3,2,4,NULL,'2022-02-21 13:35:18','2022-02-21 13:35:18','25f93a7f-e354-494d-a4ee-aea53ede6822'),(21,5,3,2,5,NULL,'2022-02-21 13:35:18','2022-02-21 13:35:18','6f92d775-8449-4707-ab64-5002314e421b');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qvpvxkjzdwyamnttowxbxjqkhkeyhpubgfmh` (`name`,`fieldId`),
  KEY `idx_kocuwhzvusgmksfnlvekhmywknhhwbfacpom` (`handle`,`fieldId`),
  KEY `idx_yieoxwrymkiepjnamfxekleadtwacssgzppd` (`fieldId`),
  KEY `idx_swkkjjxghbnqmcydjmheppivnnblkapnsnqm` (`fieldLayoutId`),
  CONSTRAINT `fk_fpyabdahtuulsjsapusbidjhefdwgmaqbyra` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jfiplmesowebsvfuoompqicorqpikhqcwkjo` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (2,3,4,'Link','link',1,'2022-02-21 13:22:16','2022-02-21 13:22:16','11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_navlinks`
--

DROP TABLE IF EXISTS `matrixcontent_navlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixcontent_navlinks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_link_linkText` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rmbhshyvumjmjoecqudybzmqhpqdmwqqfohq` (`elementId`,`siteId`),
  KEY `fk_pktzjvpnxxnzgeasjlidachbdaqsnmspjpsi` (`siteId`),
  CONSTRAINT `fk_lzkdtvexgihkoehsxgjqejyehbkuzuelslng` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pktzjvpnxxnzgeasjlidachbdaqsnmspjpsi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_navlinks`
--

LOCK TABLES `matrixcontent_navlinks` WRITE;
/*!40000 ALTER TABLE `matrixcontent_navlinks` DISABLE KEYS */;
INSERT INTO `matrixcontent_navlinks` VALUES (1,17,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','3b7c23b7-5fb4-4bd0-b6d6-e0b5a05154e1','About Us'),(2,18,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','9fd40986-6a0f-473d-b0b4-3ff7722de7fb','Services'),(3,19,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','71333a7e-4d09-469d-b460-706b0ac81edb','Clients'),(4,20,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','b73271ac-ae75-401d-95b1-818e4d344343','Media'),(5,21,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','dc238831-8c20-4a91-88a4-01e5b840cfb5','Contact');
/*!40000 ALTER TABLE `matrixcontent_navlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sycacaocwvegxduezygvionatgadzbsubpdq` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b5e8c9cf-f631-4eb7-b4cc-24101b3ab3a2'),(2,'craft','m150403_183908_migrations_table_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2702e984-c95e-444f-b46f-af1b973a67a5'),(3,'craft','m150403_184247_plugins_table_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','9351a2bf-f14c-49f5-9873-a7664cf65439'),(4,'craft','m150403_184533_field_version','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a2dd003d-3bf7-4860-b505-8e24875862fc'),(5,'craft','m150403_184729_type_columns','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','06d7ed5a-dcfd-466e-b746-2c8698e83ddf'),(6,'craft','m150403_185142_volumes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','86e3792e-3de0-4b44-88a4-3ee79e061f84'),(7,'craft','m150428_231346_userpreferences','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','72878f95-6c88-409d-bd3e-c5847e998ec4'),(8,'craft','m150519_150900_fieldversion_conversion','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0df01c61-e7bc-4397-ae21-b0f3a450c918'),(9,'craft','m150617_213829_update_email_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ffc64f50-b497-42ee-a0a8-841ddc9e83eb'),(10,'craft','m150721_124739_templatecachequeries','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','70d6d9ef-f4de-4a31-9cdf-a33b91fa21ed'),(11,'craft','m150724_140822_adjust_quality_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e3431ee4-9006-4e74-aa8a-42454755aee2'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','16cc1d1e-4a25-4b41-9a09-d8d2524bcf91'),(13,'craft','m151002_095935_volume_cache_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8c270be2-4528-4970-aa65-00d84f2e850e'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','efdc4680-2465-4907-bbe9-a70f475385c2'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f37e42a0-cef3-4083-be1b-750cc23dfc39'),(16,'craft','m151209_000000_move_logo','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ad24ed5d-d137-427d-be67-b98b0ddb1ce7'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c7f9047e-01e2-4810-962c-d417d7668eca'),(18,'craft','m151215_000000_rename_asset_permissions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a6f83d5c-954f-42e2-85cb-0597ac21e9e1'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c4f899f6-e489-4468-b075-2467ae58264a'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','27acb358-46a2-4d77-ba82-aa1b5746bd35'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ea69e4ea-ed53-40f5-b871-bc3835fc0034'),(22,'craft','m160727_194637_column_cleanup','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6f324445-0c7a-46dd-be40-92ecf039b02c'),(23,'craft','m160804_110002_userphotos_to_assets','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a1ec2e1f-f6e7-4d4b-a041-9cf45c762fa5'),(24,'craft','m160807_144858_sites','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','3fcdbdbc-2937-4afa-a7c4-a8286b5536c5'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','1ccae2d8-17b8-43a5-8e8d-c2b802f8a902'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','51b3bc4a-ca15-4385-9622-344113ec289f'),(27,'craft','m160912_230520_require_entry_type_id','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','1bd23a7a-cc10-42dd-a40a-b12d31c708cc'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','fa1ef009-d0b1-4a65-8440-8419fd42975c'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6a00c286-c075-4bdf-8401-c99c9eb45b5c'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','02685f96-b1e5-430c-97c9-a8152b77b819'),(31,'craft','m160925_113941_route_uri_parts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0156b84d-341b-48b9-a2c4-7fe39f9587ce'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b50f0f7c-1963-470a-b8c8-ed81b863e488'),(33,'craft','m161007_130653_update_email_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4c273ccb-b0a5-44d8-b461-5ac56e11701d'),(34,'craft','m161013_175052_newParentId','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d40396e5-8c1e-45c6-b89a-0da22cc0b35d'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4be088fe-00f3-49d7-8c21-bb2d472f16e4'),(36,'craft','m161021_182140_rename_get_help_widget','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','16a25e99-a48e-4320-804e-dcf5b2c07f62'),(37,'craft','m161025_000000_fix_char_columns','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','959bc0d5-f0a9-4497-98fb-7ee8bae9c5af'),(38,'craft','m161029_124145_email_message_languages','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','df6b553a-0ee8-4fcf-81fd-77e880f9cbb4'),(39,'craft','m161108_000000_new_version_format','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4c3069fe-3171-4578-86bf-0b30ff75a6c9'),(40,'craft','m161109_000000_index_shuffle','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c2cf6455-cca6-4ee0-8191-a34700dfafab'),(41,'craft','m161122_185500_no_craft_app','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8e860f21-2c7e-4c42-86f4-10df7c089139'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8e6f99a9-88e2-410b-845f-42fc4d43f3d7'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5aca4a3c-6336-4225-b9d8-4f0fe4f6402b'),(44,'craft','m170114_161144_udates_permission','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','47d17818-3126-4847-9d63-b74d95897120'),(45,'craft','m170120_000000_schema_cleanup','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e6ac2f30-dcce-4986-ba9e-e33088c7b685'),(46,'craft','m170126_000000_assets_focal_point','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a875ee70-a13b-4963-9482-de917ddeeae4'),(47,'craft','m170206_142126_system_name','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','52a7a7a3-1ec7-408e-9c50-2c126417859a'),(48,'craft','m170217_044740_category_branch_limits','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d35cab8e-3563-4d59-9f07-cc91d2825695'),(49,'craft','m170217_120224_asset_indexing_columns','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4fb7f1d9-85c6-4683-a462-8b2b61b9a81a'),(50,'craft','m170223_224012_plain_text_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0056384c-4d3d-4ad4-a264-3b322d67f48d'),(51,'craft','m170227_120814_focal_point_percentage','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','9cff60e9-a49a-4b45-9c28-9dddc1a8f06a'),(52,'craft','m170228_171113_system_messages','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d8d1d78b-88d3-477a-a8b8-6ab25e819da8'),(53,'craft','m170303_140500_asset_field_source_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','7f8a67f4-c76d-49e8-aa67-dc0ffdc5b4f8'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d1824c5e-a743-4283-96bc-c1efa9e0f6f6'),(55,'craft','m170523_190652_element_field_layout_ids','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','872c0a13-2e24-4c0a-bb2b-ada08f8d1c20'),(56,'craft','m170621_195237_format_plugin_handles','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','93d28f35-85b1-4146-af9d-7e72ca7bcce8'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','bd8e693d-3c7d-422b-9c65-2505b72354f3'),(58,'craft','m170630_161028_deprecation_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','279356a7-85b9-47a3-8f9a-144104386f28'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','fb16df27-0283-451b-a4c8-9039ba10213b'),(60,'craft','m170704_134916_sites_tables','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5ea2a80e-b805-4243-ab2c-54e2d6530c21'),(61,'craft','m170706_183216_rename_sequences','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b132285d-eba2-44df-9235-0cc06525f67c'),(62,'craft','m170707_094758_delete_compiled_traits','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','abacd6bc-83a1-4ff1-b638-fbe063aa51fc'),(63,'craft','m170731_190138_drop_asset_packagist','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','15ad3a89-65a7-4732-9199-7eddde8f748f'),(64,'craft','m170810_201318_create_queue_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c5756b6c-3b38-4814-901f-bd1faf3c64c7'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6ea7a0b5-55d1-4bb4-bf1c-0bf55b3c29f0'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','790dbea0-90fd-4e40-9c9f-abcdd8bc2028'),(67,'craft','m171011_214115_site_groups','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2eda10f1-d129-451e-957b-30b6c2185b23'),(68,'craft','m171012_151440_primary_site','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0f29f45c-85c2-4fe4-893e-0c1087a5930e'),(69,'craft','m171013_142500_transform_interlace','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2c40218b-0338-4e9e-9af5-f1cbd03fb732'),(70,'craft','m171016_092553_drop_position_select','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','75a2ae1d-f7e7-46dd-9727-fec037b6827b'),(71,'craft','m171016_221244_less_strict_translation_method','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d3ad4ef7-dedf-4203-b425-2f26274697a6'),(72,'craft','m171107_000000_assign_group_permissions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6c921f2a-9bdc-4e7b-a5d8-d979ec631f9b'),(73,'craft','m171117_000001_templatecache_index_tune','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','02496954-215f-4d5a-94ab-baad8a3aaf3d'),(74,'craft','m171126_105927_disabled_plugins','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','449a7416-616a-43b9-a71a-107cc4d35721'),(75,'craft','m171130_214407_craftidtokens_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f7df191c-a9f4-4c71-b1d2-711d725f5e6a'),(76,'craft','m171202_004225_update_email_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5ca717ad-40b0-42c5-84db-2e809096b0e3'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','274ba3e0-f04f-48fa-88a3-d131b63296f5'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5ef98cfe-859f-419a-b898-eeada7eedd60'),(79,'craft','m171218_143135_longtext_query_column','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','52d10afc-67b4-47ba-8fe5-e44712395f11'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','44fc77ef-8204-4245-9eb4-376e7f199051'),(81,'craft','m180113_153740_drop_users_archived_column','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','9aa06b36-a98c-4d86-bc83-fc2f6eb55392'),(82,'craft','m180122_213433_propagate_entries_setting','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6fbbaacc-7516-4415-b8a8-aa9fa15490cc'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0631ccee-5ddd-4cf1-ab28-dec05054bd55'),(84,'craft','m180128_235202_set_tag_slugs','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','43e85b91-eb97-448e-ae57-9c83f29996ec'),(85,'craft','m180202_185551_fix_focal_points','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','38179ce3-fef9-49a1-8a2d-7413f2e7ce7f'),(86,'craft','m180217_172123_tiny_ints','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','fe0eb2f5-9a0d-4a66-881b-8051d7fd7644'),(87,'craft','m180321_233505_small_ints','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','1deadfcd-8e67-4692-86f0-29e28d149738'),(88,'craft','m180404_182320_edition_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e04f10a2-bea6-40d6-854f-6b0739144b19'),(89,'craft','m180411_102218_fix_db_routes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','80487db4-b6df-4715-9522-d17b471b6286'),(90,'craft','m180416_205628_resourcepaths_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8bedb6e4-1b49-4618-812a-f49c76f7829b'),(91,'craft','m180418_205713_widget_cleanup','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','86572a4b-f9b1-47a4-80a1-f37ea439fca8'),(92,'craft','m180425_203349_searchable_fields','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f2f82e47-3d9e-4fb9-b3f3-66f3b8b79102'),(93,'craft','m180516_153000_uids_in_field_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','555786b2-97ee-4fce-ac4e-19a77175297e'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','05a989ab-12a1-4578-9ca5-edc7f5c52546'),(95,'craft','m180518_173000_permissions_to_uid','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','aeb73c26-eedc-4398-ad6f-9829f5a04ef4'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','660ef32e-f5a9-47b8-b405-1aa6a25c44b6'),(97,'craft','m180521_172900_project_config_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','70dfa4d2-a441-4746-b96d-45686c37aba5'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','938cf68d-39a1-461a-9ccc-ccb8e226388a'),(99,'craft','m180731_162030_soft_delete_sites','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','05c8c328-a3bf-4e57-bb5a-d5ce3ea22073'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d0d6a790-24c6-4ce4-a71c-c6ae3abe38b5'),(101,'craft','m180810_214439_soft_delete_elements','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','78312e93-ff44-413d-9cd0-c572e246c457'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','7f50af42-d385-464e-a6cb-2311298c6719'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','1d0369c1-8654-457a-83c7-6566b820b37d'),(104,'craft','m180904_112109_permission_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a9a15303-f8d9-4596-bc73-bbb602b5e131'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8cb98cb8-9366-4200-92fc-b3f2c6a5dae6'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','39e825bd-8c80-4a46-84a9-eed8cb4ed805'),(107,'craft','m181016_183648_set_default_user_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ff505c55-17c6-4426-80b1-ef06a4bdb93a'),(108,'craft','m181017_225222_system_config_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','474cdd60-2a54-4576-b862-8ab9f6532df2'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','723e6f0c-cdc6-4344-ad0c-e94f273c42a9'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2695247f-209a-429f-b09b-0dd58efe99c1'),(111,'craft','m181112_203955_sequences_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b403d4c5-855c-48e8-b262-e5c5a22615fd'),(112,'craft','m181121_001712_cleanup_field_configs','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8304f12d-48ef-40b3-8cd9-1af66b8167e3'),(113,'craft','m181128_193942_fix_project_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','cfc408bf-c658-4c80-b422-9e7e48d8a870'),(114,'craft','m181130_143040_fix_schema_version','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5c5a7baf-e59f-4a62-913d-415493fa8111'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5619b73e-df2c-4feb-b236-bcf36d564bca'),(116,'craft','m181217_153000_fix_structure_uids','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f4269ee1-484f-44b3-b9ba-a6ee74fa963d'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','196c69a0-723d-46eb-ba73-06a688faf8ac'),(118,'craft','m190108_110000_cleanup_project_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','46e61642-9ded-4411-aca6-01007300c350'),(119,'craft','m190108_113000_asset_field_setting_change','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','eca13882-6dd4-40b9-bfef-8be604b84179'),(120,'craft','m190109_172845_fix_colspan','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','350ed35b-057b-426e-953f-b59ef0e069ba'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4bbabe67-f4c9-45ef-8dd1-364bd6215edc'),(122,'craft','m190110_214819_soft_delete_volumes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0830c815-d064-419f-81a5-a8b6a1732f7b'),(123,'craft','m190112_124737_fix_user_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d5f74cd2-0999-4a42-a176-e974b7356ee7'),(124,'craft','m190112_131225_fix_field_layouts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2f8a062c-48fc-4912-a126-b306ab54fbb5'),(125,'craft','m190112_201010_more_soft_deletes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','fbba1fec-bc1d-4e20-a45a-898993e88025'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','9841f178-1e22-49eb-85e5-90afe62bb7ee'),(127,'craft','m190121_120000_rich_text_config_setting','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8932ef53-4274-4c01-9861-ccc49b186356'),(128,'craft','m190125_191628_fix_email_transport_password','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5da45239-96ab-4ff2-b96d-d70172c87576'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c40b460b-5fb9-4e48-9943-8cb188585c4c'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e5e272de-903d-4ae2-bf11-1f36d9e57115'),(131,'craft','m190218_143000_element_index_settings_uid','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','79802481-f7b3-4bb6-8d60-cd04b68ee4a8'),(132,'craft','m190312_152740_element_revisions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','85854a3a-d069-4fc5-8717-3a503b0dc0d9'),(133,'craft','m190327_235137_propagation_method','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6f98ed62-7cf6-4b7b-9f8b-c74586a005e8'),(134,'craft','m190401_223843_drop_old_indexes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4ad4f6fa-1d24-4dca-8c14-e3868972dac0'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','46fcf5b5-2029-4a0c-8a81-14ec80ee1558'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','50f409a5-4d46-4ee0-8ab5-4378b8c759e6'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4d5c4356-1e1e-48b5-b36c-b90c3eac315c'),(138,'craft','m190504_150349_preview_targets','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','7e8363c2-b7d7-48e3-bef3-f9fe05747dcd'),(139,'craft','m190516_184711_job_progress_label','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','dd28cd90-1ffb-4872-816e-71fbadb8de14'),(140,'craft','m190523_190303_optional_revision_creators','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0e1e8f3f-a7a0-48a6-ab4a-63ff8e6933b0'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','92e6f012-288e-4046-a5ff-f170e903376c'),(142,'craft','m190605_223807_unsaved_drafts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','839650fd-f677-4832-bbd1-1ade23d00664'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ab2a4514-379f-4dcf-be27-5370bdb53c4f'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','34996158-1be3-4b4d-a191-c80e1809fd6d'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','94a58d11-c7c1-4a4b-9afe-2f473eec29c5'),(146,'craft','m190624_234204_matrix_propagation_method','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','7e00ab37-2a94-4ad6-94e1-5389aa6a5fa9'),(147,'craft','m190711_153020_drop_snapshots','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e0ef915b-9809-45fd-bad3-e183f8895bdf'),(148,'craft','m190712_195914_no_draft_revisions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a1e02d0f-6fb3-41b9-a675-9a2b301e405e'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6b2505b5-6d1e-4121-b3d2-4bb9c34b8194'),(150,'craft','m190820_003519_flush_compiled_templates','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f9a168b6-1a97-47c4-b6bd-9073c2df5bcb'),(151,'craft','m190823_020339_optional_draft_creators','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','367916a2-a64a-4e57-ab35-bb9ff06ec560'),(152,'craft','m190913_152146_update_preview_targets','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','35720547-1d52-4ebd-b007-84393f8b0897'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','faaf53cc-7843-4c5b-b8f9-33a8e1f8331c'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','05af98b0-10c0-4e9b-8509-e8ef6c88a7e9'),(155,'craft','m191206_001148_change_tracking','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b66dae5c-ed29-4e01-b03d-58557c5e0c86'),(156,'craft','m191216_191635_asset_upload_tracking','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','872a0536-96b3-4453-965f-540158ef1e23'),(157,'craft','m191222_002848_peer_asset_permissions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','0e4a5967-7aa9-43a8-83a1-428416593e59'),(158,'craft','m200127_172522_queue_channels','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','69d355ea-e2f1-4fcd-b2e9-3ec5a68a1381'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','02e5747f-36be-4768-b623-956bee123a5a'),(160,'craft','m200213_172522_new_elements_index','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','a1b939eb-b256-4b52-8758-866d454d9bb2'),(161,'craft','m200228_195211_long_deprecation_messages','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','89e4ecef-4df3-4745-af07-7a9ba7c91672'),(162,'craft','m200306_054652_disabled_sites','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','2282c266-3159-4edc-8a8d-9c4adc310cfc'),(163,'craft','m200522_191453_clear_template_caches','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','117dd655-b233-416f-8c67-0ed89dc275e1'),(164,'craft','m200606_231117_migration_tracks','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','9c0d6a96-9f68-4105-9301-b5a5fe451433'),(165,'craft','m200619_215137_title_translation_method','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8eac9dce-d70d-4d04-b358-83710b2df57b'),(166,'craft','m200620_005028_user_group_descriptions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d3a22d07-87ca-4570-b982-5833d513ce13'),(167,'craft','m200620_230205_field_layout_changes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ac4b7947-6dc1-4b97-afb1-1a7d8d1220bc'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','081b82e0-20ac-4201-b683-7091f9a57594'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','49b1f9b6-be93-4435-85da-32ef9c779a26'),(170,'craft','m200630_183000_drop_configmap','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','fac48b0a-e6fb-45e6-8aff-666e91b65f67'),(171,'craft','m200715_113400_transform_index_error_flag','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','5330044e-4f89-4f67-aeba-df5ea1dc1cb6'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','6cb5828e-fd2a-4139-bf03-04f9e52404bd'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8ff09d1d-6cd4-4590-8071-3a7260445550'),(174,'craft','m200720_175543_drop_unique_constraints','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','3ded2470-fad9-4478-a2b6-dfef876b375f'),(175,'craft','m200825_051217_project_config_version','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ac3a7df2-309a-4df5-95a5-41577890c877'),(176,'craft','m201116_190500_asset_title_translation_method','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4ae7705e-43a2-48f2-986a-009a98fbe63f'),(177,'craft','m201124_003555_plugin_trials','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','d9a3ed20-eee4-4c38-a470-34ad604349a3'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','78e07229-f85f-4aa2-be39-58410907f3b5'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','960a6f28-d522-42e0-9f21-ff91de05f412'),(180,'craft','m210214_202731_track_saved_drafts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c4e5b406-54b7-4fb0-90c4-ff8c8b008eee'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','e6757587-b2f8-419e-8c7f-be1ec4b59f31'),(182,'craft','m210302_212318_canonical_elements','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','c126f0ca-0e21-426b-ab21-8257db10341f'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','4ddc9493-b42f-4237-9c91-61636d8bec5b'),(184,'craft','m210329_214847_field_column_suffixes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ef733dbb-c1a1-43be-a537-5dab27f258c3'),(185,'craft','m210331_220322_null_author','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','f6abe11f-4f1c-420e-9d7b-133c61b82c81'),(186,'craft','m210405_231315_provisional_drafts','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','928dcf59-eb5a-4784-809f-adb3ee09dfb0'),(187,'craft','m210602_111300_project_config_names_in_config','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','b3f8ce25-897f-4ca5-8a5e-9c7115d30da2'),(188,'craft','m210611_233510_default_placement_settings','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','ec1b6089-5caa-4947-8ff7-73a7090c4cc7'),(189,'craft','m210613_145522_sortable_global_sets','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','cb9c6b7c-95b4-41f7-b271-290a57f6fb7f'),(190,'craft','m210613_184103_announcements','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','023ad375-372a-4a28-9524-1303eb599330'),(191,'craft','m210829_000000_element_index_tweak','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','8801ee3e-d0ab-4b1b-8a30-286222e424af'),(192,'craft','m220209_095604_add_indexes','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','315f4717-c1f3-47ff-948a-2ab2024783fd'),(193,'craft','m220214_000000_truncate_sessions','2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-20 10:15:57','85bba2c4-16e4-4d4a-be2a-10a869f24046');
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
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rrbrvbitagzvfnscvcfbwerzxzmczekkuktx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1645452547'),('email.fromEmail','\"waisalriyanto.rpl2.16@gmail.com\"'),('email.fromName','\"localhost/example-craft-one\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.autocapitalize','true'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.autocomplete','false'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.autocorrect','true'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.class','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.disabled','false'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.id','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.instructions','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.label','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.max','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.min','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.name','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.orientation','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.placeholder','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.readonly','false'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.requirable','false'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.size','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.step','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.tip','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.title','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.warning','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.elements.0.width','100'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.name','\"Content\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.fieldLayouts.b813fd0b-08c9-4ea2-b87f-03acb7030da6.tabs.0.sortOrder','1'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.handle','\"clients\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.hasTitleField','false'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.name','\"Clients\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.section','\"7269c2cc-4ab9-49cf-a31e-1a4ed9f52485\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.sortOrder','1'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.titleFormat','\"{section.name|raw}\"'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.titleTranslationKeyFormat','null'),('entryTypes.07947859-a55f-4c09-987f-de0b639a5300.titleTranslationMethod','\"site\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.autocapitalize','true'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.autocomplete','false'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.autocorrect','true'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.class','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.disabled','false'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.id','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.instructions','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.label','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.max','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.min','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.name','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.orientation','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.placeholder','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.readonly','false'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.requirable','false'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.size','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.step','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.tip','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.title','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.warning','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.elements.0.width','100'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.name','\"Content\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.fieldLayouts.081c1484-21c8-4487-948b-1da0a13db78f.tabs.0.sortOrder','1'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.handle','\"contact\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.hasTitleField','false'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.name','\"Contact\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.section','\"358210bf-5a75-47a8-b81f-0427df41731a\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.sortOrder','1'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.titleFormat','\"{section.name|raw}\"'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.titleTranslationKeyFormat','null'),('entryTypes.21db52f6-c3ca-4c68-ab9c-919416b071dc.titleTranslationMethod','\"site\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.autocapitalize','true'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.autocomplete','false'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.autocorrect','true'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.class','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.disabled','false'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.id','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.instructions','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.label','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.max','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.min','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.name','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.orientation','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.placeholder','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.readonly','false'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.requirable','false'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.size','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.step','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.tip','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.title','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.warning','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.elements.0.width','100'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.name','\"Content\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.fieldLayouts.73305c7e-0266-4607-908d-35c7fff0f1a7.tabs.0.sortOrder','1'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.handle','\"about\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.hasTitleField','false'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.name','\"About Us\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.section','\"a744ca11-952b-41b5-8cd7-66af90faacf6\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.sortOrder','1'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.titleFormat','\"{section.name|raw}\"'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.titleTranslationKeyFormat','null'),('entryTypes.6464eb26-37ac-4543-b412-7cffdb3ab8d1.titleTranslationMethod','\"site\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.autocapitalize','true'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.autocomplete','false'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.autocorrect','true'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.class','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.disabled','false'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.id','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.instructions','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.label','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.max','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.min','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.name','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.orientation','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.placeholder','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.readonly','false'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.requirable','false'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.size','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.step','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.tip','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.title','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.warning','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.elements.0.width','100'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.name','\"Content\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.fieldLayouts.ca754324-8974-47f2-8990-3b5dfdb333ac.tabs.0.sortOrder','1'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.handle','\"services\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.hasTitleField','false'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.name','\"Services\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.section','\"00ee182b-4d8f-4ad2-a473-86b7306fc904\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.sortOrder','1'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.titleFormat','\"{section.name|raw}\"'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.titleTranslationKeyFormat','null'),('entryTypes.78151dfa-65d5-4575-867f-0f743efaac0d.titleTranslationMethod','\"site\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.autocomplete','false'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.autocorrect','true'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.class','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.disabled','false'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.id','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.instructions','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.label','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.max','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.min','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.name','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.orientation','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.placeholder','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.readonly','false'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.requirable','false'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.size','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.step','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.tip','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.title','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.warning','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.elements.0.width','100'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.name','\"Content\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.fieldLayouts.63cc22fb-faaf-4ba5-beed-8f950295e92c.tabs.0.sortOrder','1'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.handle','\"media\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.hasTitleField','false'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.name','\"Media\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.section','\"a09a5068-06ce-4797-849b-bda38218d639\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.sortOrder','1'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.titleFormat','\"{section.name|raw}\"'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.titleTranslationKeyFormat','null'),('entryTypes.cb2411de-20bc-4a27-b5ad-e388f94e6c93.titleTranslationMethod','\"site\"'),('fieldGroups.2b232fb3-8c46-45ba-8cf6-033789dbedf4.name','\"Common\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.columnSuffix','null'),('fields.5805266d-5664-4a42-91a6-cad390cda016.contentColumnType','\"string\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.fieldGroup','\"2b232fb3-8c46-45ba-8cf6-033789dbedf4\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.handle','\"navLinks\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.instructions','\"\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.name','\"Nav Links\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.searchable','false'),('fields.5805266d-5664-4a42-91a6-cad390cda016.settings.contentTable','\"{{%matrixcontent_navlinks}}\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.settings.maxBlocks','\"\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.settings.minBlocks','\"\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.settings.propagationKeyFormat','null'),('fields.5805266d-5664-4a42-91a6-cad390cda016.settings.propagationMethod','\"all\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.translationKeyFormat','null'),('fields.5805266d-5664-4a42-91a6-cad390cda016.translationMethod','\"site\"'),('fields.5805266d-5664-4a42-91a6-cad390cda016.type','\"craft\\\\fields\\\\Matrix\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.fieldUid','\"5805266d-5664-4a42-91a6-cad390cda016\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.instructions','null'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.label','null'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.required','false'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.tip','null'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.warning','null'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.elements.0.width','100'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.name','\"Content\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.fieldLayouts.201bb17d-1193-4006-8ce6-e47fe8c2d610.tabs.0.sortOrder','1'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.handle','\"header\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.name','\"Header\"'),('globalSets.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1.sortOrder','2'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.field','\"5805266d-5664-4a42-91a6-cad390cda016\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.fieldUid','\"66572391-eb02-4ac6-8012-251bb8ab626d\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.label','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.required','true'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.tip','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.warning','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.0.width','100'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.fieldUid','\"8f29e7f1-4c89-4fd7-a889-3b70a397efd1\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.label','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.required','true'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.tip','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.warning','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.elements.1.width','100'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.name','\"Content\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fieldLayouts.16e35c38-944d-4daf-ad7a-901bce3aab83.tabs.0.sortOrder','1'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.columnSuffix','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.contentColumnType','\"text\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.fieldGroup','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.handle','\"linkText\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.instructions','\"\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.name','\"Link Text\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.searchable','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.byteLimit','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.charLimit','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.code','\"\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.columnType','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.initialRows','\"4\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.multiline','\"\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.placeholder','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.settings.uiMode','\"normal\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.translationKeyFormat','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.translationMethod','\"none\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.66572391-eb02-4ac6-8012-251bb8ab626d.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.columnSuffix','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.contentColumnType','\"string\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.fieldGroup','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.handle','\"linkDestination\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.instructions','\"\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.name','\"Link Destination\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.searchable','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.allowSelfRelations','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.limit','\"1\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.localizeRelations','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.selectionLabel','\"Select an entry\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.showSiteMenu','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.source','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.sources','\"*\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.targetSiteId','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.validateRelatedElements','false'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.settings.viewMode','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.translationKeyFormat','null'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.translationMethod','\"site\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.fields.8f29e7f1-4c89-4fd7-a889-3b70a397efd1.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.handle','\"link\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.name','\"Link\"'),('matrixBlockTypes.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1.sortOrder','1'),('meta.__names__.00ee182b-4d8f-4ad2-a473-86b7306fc904','\"Services\"'),('meta.__names__.07947859-a55f-4c09-987f-de0b639a5300','\"Clients\"'),('meta.__names__.11a49352-9bf8-4497-8d9c-bfa0d4b9ecd1','\"Link\"'),('meta.__names__.21db52f6-c3ca-4c68-ab9c-919416b071dc','\"Contact\"'),('meta.__names__.2b232fb3-8c46-45ba-8cf6-033789dbedf4','\"Common\"'),('meta.__names__.358210bf-5a75-47a8-b81f-0427df41731a','\"Contact\"'),('meta.__names__.5805266d-5664-4a42-91a6-cad390cda016','\"Nav Links\"'),('meta.__names__.60e619f9-0c07-431e-a4ca-ae9599eacea8','\"localhost/example-craft-one\"'),('meta.__names__.6464eb26-37ac-4543-b412-7cffdb3ab8d1','\"About Us\"'),('meta.__names__.66572391-eb02-4ac6-8012-251bb8ab626d','\"Link Text\"'),('meta.__names__.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485','\"Clients\"'),('meta.__names__.78151dfa-65d5-4575-867f-0f743efaac0d','\"Services\"'),('meta.__names__.7a9179e3-91ee-4a6f-8549-73951bed032b','\"localhost/example-craft-one\"'),('meta.__names__.8f29e7f1-4c89-4fd7-a889-3b70a397efd1','\"Link Destination\"'),('meta.__names__.a09a5068-06ce-4797-849b-bda38218d639','\"Media\"'),('meta.__names__.a31f57f5-9e0b-433d-a570-16656fd10fdf','\"Home\"'),('meta.__names__.a591f0a0-f0df-411a-8d97-7ad5e6c6dfe1','\"Header\"'),('meta.__names__.a744ca11-952b-41b5-8cd7-66af90faacf6','\"About Us\"'),('meta.__names__.cb2411de-20bc-4a27-b5ad-e388f94e6c93','\"Media\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.defaultPlacement','\"end\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.enableVersioning','true'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.handle','\"services\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.name','\"Services\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.propagationMethod','\"all\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabledByDefault','true'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.template','\"services.twig\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.uriFormat','\"services\"'),('sections.00ee182b-4d8f-4ad2-a473-86b7306fc904.type','\"single\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.defaultPlacement','\"end\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.enableVersioning','true'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.handle','\"contact\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.name','\"Contact\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.propagationMethod','\"all\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabledByDefault','true'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.template','\"contact.twig\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.uriFormat','\"contact\"'),('sections.358210bf-5a75-47a8-b81f-0427df41731a.type','\"single\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.defaultPlacement','\"end\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.enableVersioning','true'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.handle','\"clients\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.name','\"Clients\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.propagationMethod','\"all\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabledByDefault','true'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.template','\"clients.twig\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.uriFormat','\"clients\"'),('sections.7269c2cc-4ab9-49cf-a31e-1a4ed9f52485.type','\"single\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.defaultPlacement','\"end\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.enableVersioning','true'),('sections.a09a5068-06ce-4797-849b-bda38218d639.handle','\"media\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.name','\"Media\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.propagationMethod','\"all\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabledByDefault','true'),('sections.a09a5068-06ce-4797-849b-bda38218d639.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sections.a09a5068-06ce-4797-849b-bda38218d639.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.template','\"media.twig\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.uriFormat','\"media\"'),('sections.a09a5068-06ce-4797-849b-bda38218d639.type','\"single\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.defaultPlacement','\"end\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.enableVersioning','true'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.handle','\"about\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.name','\"About Us\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.propagationMethod','\"all\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabledByDefault','true'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.template','\"about.twig\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.siteSettings.60e619f9-0c07-431e-a4ca-ae9599eacea8.uriFormat','\"about\"'),('sections.a744ca11-952b-41b5-8cd7-66af90faacf6.type','\"single\"'),('siteGroups.7a9179e3-91ee-4a6f-8549-73951bed032b.name','\"localhost/example-craft-one\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.enabled','true'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.handle','\"default\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.hasUrls','true'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.language','\"en-US\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.name','\"localhost/example-craft-one\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.primary','true'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.siteGroup','\"7a9179e3-91ee-4a6f-8549-73951bed032b\"'),('sites.60e619f9-0c07-431e-a4ca-ae9599eacea8.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"$PRIMARY_SITE_URL\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
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
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_xmtjxsoeontcwovjzkbhktrfuywfqvxyytys` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_sumfdmuiolnhpormauanjmbycjglxjmgpgej` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aoivtclgfsaxysobtcptwmgnrhtxcszzbrpv` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_osxrjopzldxmxbzxyttpsryyvblafoaxwiip` (`sourceId`),
  KEY `idx_pkjrswuekthrzlqrrxvjamitrnnjqmqnnlax` (`targetId`),
  KEY `idx_nixtbtuhnusaeitfwhhcmzpfgopxiwqfpcpi` (`sourceSiteId`),
  CONSTRAINT `fk_dnnrsxylszsbqlyivqlebtecbpbpvgmlsqwx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iznprvwtgryyhcfmfvtiokxgcdcgqgxxbzca` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_netbiogbalrkgipovstmekftcsnfjxcjophr` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vdypvhqshvdqguakcwkzmvmlxwuiubcxpjzu` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,5,17,NULL,8,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','bb4c90b4-3775-47b1-b404-b5c72ed70476'),(2,5,18,NULL,10,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','e1550cad-0c72-41fd-bd29-ecddd53d926f'),(3,5,19,NULL,12,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','06ed929b-b49e-43b5-b883-664be0e1072e'),(4,5,20,NULL,14,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','d67f5c2f-e3b9-4845-9601-46421dec734b'),(5,5,21,NULL,2,1,'2022-02-21 13:35:18','2022-02-21 13:35:18','abc11126-6066-4824-86cd-4130098e0159');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('147e0c93','@craft/web/assets/matrixsettings/dist'),('191d92c8','@craft/web/assets/elementresizedetector/dist'),('2099bc3c','@craft/web/assets/dashboard/dist'),('22858e0e','@craft/web/assets/edituser/dist'),('298e3174','@craft/web/assets/craftsupport/dist'),('2a995c8f','@craft/web/assets/sites/dist'),('2dcf4f7c','@craft/web/assets/vue/dist'),('37d0dee3','@bower/jquery/dist'),('39ef9727','@craft/web/assets/velocity/dist'),('3d374ef5','@craft/web/assets/jqueryui/dist'),('3f7e3c','@craft/web/assets/editentry/dist'),('40c1abb6','@craft/web/assets/feed/dist'),('42a73d1a','@craft/web/assets/editsection/dist'),('443e9eb4','@craft/web/assets/picturefill/dist'),('4a776d99','@craft/web/assets/recententries/dist'),('5cff72fc','@craft/web/assets/login/dist'),('612daa49','@craft/web/assets/jquerytouchevents/dist'),('617e752b','@craft/web/assets/jquerypayment/dist'),('62fb542e','@craft/web/assets/selectize/dist'),('861cb9d','@craft/web/assets/fileupload/dist'),('88de179e','@craft/web/assets/fabric/dist'),('8b41734a','@craft/web/assets/garnish/dist'),('8d472fad','@craft/web/assets/cp/dist'),('9a5b72c8','@craft/web/assets/axios/dist'),('a219375b','@craft/web/assets/matrix/dist'),('ae53d383','@craft/web/assets/updateswidget/dist'),('b8cc9ba3','@craft/web/assets/fields/dist'),('b9bf24e','@craft/web/assets/xregexp/dist'),('c0fd0af1','@craft/web/assets/focusvisible/dist'),('c128ae62','@craft/web/assets/d3/dist'),('d53b43a2','@craft/web/assets/fieldsettings/dist'),('d58ea672','@craft/web/assets/admintable/dist'),('e457b17f','@craft/web/assets/installer/dist'),('eedf32d8','@craft/web/assets/utilities/dist'),('f87fc557','@craft/web/assets/iframeresizer/dist'),('fa7a6763','@craft/web/assets/generalsettings/dist');
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
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ehostsxsauwweysnnnitasmawqhtlhtkczvs` (`sourceId`,`num`),
  KEY `fk_rmurvtezkfnfomvidamtlxtwqjfbzdagyzik` (`creatorId`),
  CONSTRAINT `fk_qecppfjloynrplowgncqzvuqtuypeiimbexj` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rmurvtezkfnfomvidamtlxtwqjfbzdagyzik` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,8,1,1,NULL),(4,10,1,1,NULL),(5,12,1,1,NULL),(6,14,1,1,NULL),(7,2,1,3,NULL);
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
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_mlbjxtxrkoxaqxiozspjnwkpqdbxqdjznreg` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(8,'title',0,1,' about us '),(8,'slug',0,1,' about us '),(1,'email',0,1,' waisalriyanto rpl2 16 gmail com '),(1,'slug',0,1,''),(4,'slug',0,1,''),(5,'slug',0,1,''),(2,'title',0,1,' contact '),(2,'slug',0,1,' contact '),(10,'title',0,1,' services '),(10,'slug',0,1,' services '),(12,'title',0,1,' clients '),(12,'slug',0,1,' clients '),(14,'title',0,1,' media '),(14,'slug',0,1,' media '),(17,'slug',0,1,''),(18,'slug',0,1,''),(19,'slug',0,1,''),(20,'slug',0,1,''),(21,'slug',0,1,''),(22,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_filtizgzolrepmgthwmndbxdxxvnvjibodaj` (`handle`),
  KEY `idx_nlukfpenytrzxrvcaobmwyiqhhscrgngyxai` (`name`),
  KEY `idx_ijyyvhnfpxncyyjxxycbtsmkfmocnniesbld` (`structureId`),
  KEY `idx_hmbmcudnjwuvuyfrgmqvqpzzloxibqcnqvch` (`dateDeleted`),
  CONSTRAINT `fk_qhqrxfockecbhytezozbnprihirmabcvwfcq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Contact','contact','single',1,'all','end',NULL,'2022-02-20 10:53:01','2022-02-21 13:32:54',NULL,'358210bf-5a75-47a8-b81f-0427df41731a'),(2,NULL,'About Us','about','single',1,'all','end',NULL,'2022-02-21 13:30:33','2022-02-21 13:30:33',NULL,'a744ca11-952b-41b5-8cd7-66af90faacf6'),(3,NULL,'Services','services','single',1,'all','end',NULL,'2022-02-21 13:31:17','2022-02-21 13:31:17',NULL,'00ee182b-4d8f-4ad2-a473-86b7306fc904'),(4,NULL,'Clients','clients','single',1,'all','end',NULL,'2022-02-21 13:31:47','2022-02-21 13:31:47',NULL,'7269c2cc-4ab9-49cf-a31e-1a4ed9f52485'),(5,NULL,'Media','media','single',1,'all','end',NULL,'2022-02-21 13:32:11','2022-02-21 13:32:11',NULL,'a09a5068-06ce-4797-849b-bda38218d639');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
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
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zqyvojoqhgxpcmxuovtdtlikjtwbukymmigz` (`sectionId`,`siteId`),
  KEY `idx_gluljslvpglipytwyalolwrcqzewjxlubjuc` (`siteId`),
  CONSTRAINT `fk_icxnrzfuizfzflqghkjokwvpfrmfinzodtvd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rfpmlkhgshnzuawyahskrgknceetcxhhbdsb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'contact','contact.twig',1,'2022-02-20 10:53:01','2022-02-21 13:29:25','42c5c387-0839-4d2b-8e5b-99df1af8720e'),(2,2,1,1,'about','about.twig',1,'2022-02-21 13:30:33','2022-02-21 13:30:33','37caa247-3806-4432-9585-0ab4c0509b67'),(3,3,1,1,'services','services.twig',1,'2022-02-21 13:31:17','2022-02-21 13:31:17','05a0ba71-c385-4cd4-b52c-c5cc16543810'),(4,4,1,1,'clients','clients.twig',1,'2022-02-21 13:31:47','2022-02-21 13:31:47','24164d8f-2ca3-40bc-bc44-d4bb2612a49d'),(5,5,1,1,'media','media.twig',1,'2022-02-21 13:32:11','2022-02-21 13:32:11','5268f9c1-6bb5-460e-aa1e-390e12f37b9a');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hkjwkrfqpmztvwtvzoeyjnxonfsnfjckgjdr` (`uid`),
  KEY `idx_zgbornonupqtxrvtjqrabvieiltmvhejofws` (`token`),
  KEY `idx_ggkisfyxwhizjytrhgcuqjqlbqgofglhxgpa` (`dateUpdated`),
  KEY `idx_gdfjdwcjxxidtmdihuhrdbsuhqmflbriwdkz` (`userId`),
  CONSTRAINT `fk_pwtyziuhoyolbvwyglzipjnnoaxuzyjnatfm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'nnygLhxFu8Lxv_aydD4U_k2vhWYO9nrpl6xyU9tjE4I2r6CqQbcyatsEtTzKCnvA3ML1TG7O7RvsB-P9lJGIzJ5KIbFWygmXgHAP','2022-02-20 10:18:25','2022-02-20 12:43:29','129ca09c-034d-4d55-ba3c-f91028d0dcac'),(2,1,'AKG8iBH39Y33waJZZhQIDb0X7H52hP3k2TafNUyvJ4MldAXhwSOo5WuqAA3agYVoMC3OF6zwNRs3dF5rPKX_N__s7lj5kKHnoQGc','2022-02-21 13:00:45','2022-02-21 14:20:27','edade817-d88d-48d8-9287-11e51a21bbc5');
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
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zymprwqkkdkravkmhjjfgkfgeqtkjvjkhjla` (`userId`,`message`),
  CONSTRAINT `fk_gnojlxojfrecyijyczipkikmvhqrtrsfwohb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dqgfhygcaggbkgqexwrjtklwjhiwasezfqie` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'localhost/example-craft-one','2022-02-20 10:15:56','2022-02-20 10:15:56',NULL,'7a9179e3-91ee-4a6f-8549-73951bed032b');
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
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbqhghqmjsmfjmzfjpxrlmhxhjwcjijdodda` (`dateDeleted`),
  KEY `idx_mliwiblujjpqxeaeorknbwbkdbgcsgceyplf` (`handle`),
  KEY `idx_qtcwkbabokjhgwporvhqsmasltmlctopcczk` (`sortOrder`),
  KEY `fk_lqlqwtktpykalmtgkmjaeefszkgvbrfcejhe` (`groupId`),
  CONSTRAINT `fk_lqlqwtktpykalmtgkmjaeefszkgvbrfcejhe` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'localhost/example-craft-one','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-02-20 10:15:56','2022-02-21 14:09:07',NULL,'60e619f9-0c07-431e-a4ca-ae9599eacea8');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cdhkjmuiikktruglsoogyxhlpqrnmqzwcyhw` (`structureId`,`elementId`),
  KEY `idx_knqosmpwdgvnqaidsokilywmceahrwibkjxz` (`root`),
  KEY `idx_xwusipkemzqihdepyesncebduehcctjgnvcp` (`lft`),
  KEY `idx_auvjajnpyczccjrurvniphfsjdthnaequbpz` (`rgt`),
  KEY `idx_zxsurvwdywomyseifhwzsjhkkecdsvwrbhzu` (`level`),
  KEY `idx_whpmcyebxpzauoqdixlfjbgxblsajcoxqoym` (`elementId`),
  CONSTRAINT `fk_rimxdhaeusqctxykjeuymxskfdvlusmxabwl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vssrvgadespclibygflaqfmnvytqenthhsri` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yvwjnypyynziztnuauyxadzsodhyuoibqtmb` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
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
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rhnhfwfrutjjqxymthuaxzwhzpugrfemxewp` (`key`,`language`),
  KEY `idx_ndcuvmjtwievgnzmdqvkeurqvoyoncsccnhx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ecvbcdqcvceytnonsmrwhtyshzxnmueheexw` (`name`),
  KEY `idx_kwvjlknvjtywcxvtyhodbykpnixkkpxgqgeb` (`handle`),
  KEY `idx_rzxgiougygmmeibzvwdynrrajwehewooukvk` (`dateDeleted`),
  KEY `fk_jcalqmjrfmoxoxpcboqlrghglkgutqhqujdx` (`fieldLayoutId`),
  CONSTRAINT `fk_jcalqmjrfmoxoxpcboqlrghglkgutqhqujdx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vibzjxtlpypsgornlxbrspyabwvlzqcxyhku` (`groupId`),
  CONSTRAINT `fk_moxyopljvqhvohlpedmrqdexrswgriymevam` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wklnlobsjuxoyswyhjmtovfadxoqyalibati` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fowghmnnmixyyhhxizhvxkmlzytmmqyugvln` (`cacheId`),
  KEY `idx_yrqmvbzvnjyaogrkdcwboxltlstzfkccrniu` (`elementId`),
  CONSTRAINT `fk_kppqeffvsocninlfrycpfiqjfonqjokbkouq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ycnzrypqntnauyszldtbarzvndqjfpvmipba` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cwjjvdwzpxwtbwxpxnarxpobdozehjkqmfcx` (`cacheId`),
  KEY `idx_dleibbuovmsrirbjaucuiuwnojmfasmfcias` (`type`),
  CONSTRAINT `fk_qsoivsxyevpwhckpcalawfcwokhmsrwnsyxn` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jsbluazmlpomiujynmovegnbuqrmsorwrjwj` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_juoagsbsyeevjpxzxdvwfesnkkpqvmcfxbku` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_ttarmvkyvhobecosbkggfbcnhddpcexiyenv` (`siteId`),
  CONSTRAINT `fk_hrbohlmhkyzqgjftqkbaftpfugbiipkoclvc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mxnstkoskduibnwyedoqkhvjacflwszxahry` (`token`),
  KEY `idx_ugsyvkjzvdxqxxutjdjmpqbhumyrtyagnitg` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tfgcsxtcpybtjhvuvvpymaljuzmqugxbaqvg` (`handle`),
  KEY `idx_chuekgclpcvynenspsqmhygzqmkoxyrlylnr` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqajtbvnarmncpaaqsooyaeoxcewocdtwszb` (`groupId`,`userId`),
  KEY `idx_ebhjzihetuypwonsmhxmilktgzoakalypqko` (`userId`),
  CONSTRAINT `fk_geiybeorqbtnrlgjmytslnibwlzzmurtbbxv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mscsipnavapalbabsfruyecmuthrqylxywqh` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jnvsjeagizrghmbgzcqjraskgfxcavlpctik` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ghzrcexwgdwwyycvkookuamcpcxvxqliohpn` (`permissionId`,`groupId`),
  KEY `idx_tibqksdldbecjrswomhmkgzuvuoecdpgjyan` (`groupId`),
  CONSTRAINT `fk_qhpajmepnzgcfwgxsqvrdfjsltzumegphact` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjxpbadfsocfomcqrymzrvaecrqjbtzjlwqd` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aygflvcnwyvmtysqmcstvucgnsdjxkhtvksc` (`permissionId`,`userId`),
  KEY `idx_vsadwikclltrtwnylwdiztljctusgaupaaoj` (`userId`),
  CONSTRAINT `fk_mroapojihdpqxantimssyzsrrfwbklqriehd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzbxynryhehlwjkjltuscxkwexyqjcfyklfg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_luemqsqtvdnpqszknkdjwzrammzftipicpli` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
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
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yzhrzoourepasjymennkbaabfregagohtamt` (`uid`),
  KEY `idx_lphvdzgbnxonoenjgyqwicmsslfucfhhzkzo` (`verificationCode`),
  KEY `idx_iwqxvaaiplenamrjlmwcoxfejfjghjaynqiy` (`email`),
  KEY `idx_atkehnzgozreztmlapxmkrzamlfqluuzexut` (`username`),
  KEY `fk_exbdjtwtkazbrzazzecerotjnzyxstfetjvb` (`photoId`),
  CONSTRAINT `fk_exbdjtwtkazbrzazzecerotjnzyxstfetjvb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fggemfiapdymojoclsntuiqtoklxgvkzdadl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,'','','waisalriyanto.rpl2.16@gmail.com','$2y$13$xlw5RcGHoAdV9JNBKEiXJ.E6new4ELlISLt4woJBtBCv7c8uZiYrm',1,0,0,0,'2022-02-21 13:00:45',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-02-20 10:15:57','2022-02-20 10:15:57','2022-02-21 13:00:45','809a695d-73b8-4f0a-b05a-3df623ae3ab1');
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vtwrsfaduadqsurudpdrqoniyfcsnpmbowkc` (`name`,`parentId`,`volumeId`),
  KEY `idx_acfseybgpkqakzqcfcytjhuwlpcchybscodj` (`parentId`),
  KEY `idx_tdrpjldgshlieobwixpnozbtcoyflwmurpcq` (`volumeId`),
  CONSTRAINT `fk_qmgyixjdkveuvnwayudkqaeaopvjwumqlwae` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qwidoeuqnxakjalhrokovvmaruyvxvozqktn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjgezuilmzgbwxcydfwemfjcibeearzmflyw` (`name`),
  KEY `idx_eiecrbdlaxbwgdltkocfacaymuzckdcuwyie` (`handle`),
  KEY `idx_xporzhsekeozcfreokopvygwmxoscrzuopbv` (`fieldLayoutId`),
  KEY `idx_hmcuxvlqhpldtazjpcstlxqindybtwuuytpw` (`dateDeleted`),
  CONSTRAINT `fk_nkocvmmpptxsskukqfwtynkgmmeliubvfbqh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
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
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_utyiuspdmqnbsvhflpragumvavlgyhqytkne` (`userId`),
  CONSTRAINT `fk_fvyyzseuvazqgcastenmapdivxbtioshqcqu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-02-20 10:18:26','2022-02-20 10:18:26','13b78fb6-ef97-4f8b-9511-696b3b3ddd69'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-02-20 10:18:26','2022-02-20 10:18:26','24ccc843-eb10-4edd-a9b0-3ae7a383f7d5'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-02-20 10:18:26','2022-02-20 10:18:26','f094b4d4-af66-444c-9147-72b6a3a7a16c'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-02-20 10:18:26','2022-02-20 10:18:26','7c52f399-effb-4326-93f3-515246ecdab9');
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

-- Dump completed on 2022-02-21 21:21:05
