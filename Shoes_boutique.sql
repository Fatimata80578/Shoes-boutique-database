-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Shoes_boutique
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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


CREATE DATABASE IF NOT EXISTS `Shoes_boutique` DEFAULT CHARACTER SET ="utf8";
USE `Shoes_boutique`;

--
-- Table structure for table `chaussures`
--

DROP TABLE IF EXISTS `chaussures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chaussures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `nombre` int(11) unsigned NOT NULL,
  `pointure` int(11) NOT NULL DEFAULT '0',
  `couleur` varchar(255) NOT NULL DEFAULT '',
  `modèle_id` int(1) unsigned NOT NULL,
  `commande_id` int(11) unsigned NOT NULL,
  `client_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modèle` (`modèle_id`),
  KEY `fk_commande` (`commande_id`),
  KEY `fk_client` (`client_id`),
  CONSTRAINT `fk_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_commande` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  CONSTRAINT `fk_modèle` FOREIGN KEY (`modèle_id`) REFERENCES `modèle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chaussures`
--

LOCK TABLES `chaussures` WRITE;
/*!40000 ALTER TABLE `chaussures` DISABLE KEYS */;
/*!40000 ALTER TABLE `chaussures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_modèle`
--

DROP TABLE IF EXISTS `commande_modèle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande_modèle` (
  `commande_id` int(11) unsigned NOT NULL,
  `modèle_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`commande_id`,`modèle_id`),
  KEY `fk_commande_modèle_commande_id` (`commande_id`),
  KEY `fk_commande_modèle_modèle_id` (`modèle_id`),
  CONSTRAINT `fk_commande_modèle_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  CONSTRAINT `fk_commande_modèle_modèle_id` FOREIGN KEY (`modèle_id`) REFERENCES `modèle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_modèle`
--

LOCK TABLES `commande_modèle` WRITE;
/*!40000 ALTER TABLE `commande_modèle` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande_modèle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleur` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleur`
--

LOCK TABLES `couleur` WRITE;
/*!40000 ALTER TABLE `couleur` DISABLE KEYS */;
/*!40000 ALTER TABLE `couleur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleur_modèle`
--

DROP TABLE IF EXISTS `couleur_modèle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleur_modèle` (
  `couleur_id` int(11) unsigned NOT NULL,
  `modèle_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`couleur_id`,`modèle_id`),
  KEY `fk_couleur_modèle_couleur_id` (`couleur_id`),
  KEY `fk_couleur_modèle_modèle_id` (`modèle_id`),
  CONSTRAINT `fk_couleur_modèle_couleur_id` FOREIGN KEY (`couleur_id`) REFERENCES `couleur` (`id`),
  CONSTRAINT `fk_couleur_modèle_modèle_id` FOREIGN KEY (`modèle_id`) REFERENCES `modèle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleur_modèle`
--

LOCK TABLES `couleur_modèle` WRITE;
/*!40000 ALTER TABLE `couleur_modèle` DISABLE KEYS */;
/*!40000 ALTER TABLE `couleur_modèle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modèle`
--

DROP TABLE IF EXISTS `modèle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modèle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modèle`
--

LOCK TABLES `modèle` WRITE;
/*!40000 ALTER TABLE `modèle` DISABLE KEYS */;
/*!40000 ALTER TABLE `modèle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-04 14:32:24
