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
-- Table structure for table `operacion__orden_movimiento`
--

DROP TABLE IF EXISTS `operacion__orden_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacion__orden_movimiento` (
  `orden_vehiculo_id` int unsigned NOT NULL,
  `movimiento_id` int unsigned NOT NULL,
  PRIMARY KEY (`orden_vehiculo_id`,`movimiento_id`),
  KEY `fk_operacion__orden_vehiculo_has_flota__vehiculo_movimiento_idx` (`movimiento_id`),
  KEY `fk_operacion__orden_vehiculo_has_flota__vehiculo_movimiento_idx1` (`orden_vehiculo_id`),
  CONSTRAINT `fk_operacion__orden_vehiculo_has_flota__vehiculo_movimiento_f1` FOREIGN KEY (`movimiento_id`) REFERENCES `flota__vehiculo_movimiento` (`id`),
  CONSTRAINT `fk_operacion__orden_vehiculo_has_flota__vehiculo_movimiento_o1` FOREIGN KEY (`orden_vehiculo_id`) REFERENCES `operacion__orden_vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion__orden_movimiento`
--

LOCK TABLES `operacion__orden_movimiento` WRITE;
/*!40000 ALTER TABLE `operacion__orden_movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacion__orden_movimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 10:28:06
