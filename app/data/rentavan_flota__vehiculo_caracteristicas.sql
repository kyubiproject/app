-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: rentavan
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `flota__vehiculo_caracteristicas`
--

DROP TABLE IF EXISTS `flota__vehiculo_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flota__vehiculo_caracteristicas` (
  `id` mediumint unsigned NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `anio` year DEFAULT NULL,
  `transmision` enum('MANUAL','AUTOMATICO','DUAL') DEFAULT NULL,
  `plazas` tinyint unsigned DEFAULT NULL,
  `puertas` tinyint unsigned DEFAULT NULL,
  `extra` set('GPS','AIRE','4X4','MULTIMEDIA','ALARMA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flota__vehiculo_caracteristicas_flota__vehiculo1_idx` (`id`),
  CONSTRAINT `fk_flota__vehiculo_caracteristicas_flota__vehiculo1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flota__vehiculo_caracteristicas`
--

LOCK TABLES `flota__vehiculo_caracteristicas` WRITE;
/*!40000 ALTER TABLE `flota__vehiculo_caracteristicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `flota__vehiculo_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 10:28:02
