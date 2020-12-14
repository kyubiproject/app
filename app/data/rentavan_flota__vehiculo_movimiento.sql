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
-- Table structure for table `flota__vehiculo_movimiento`
--

DROP TABLE IF EXISTS `flota__vehiculo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flota__vehiculo_movimiento` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha` date DEFAULT NULL,
  `combustible` tinyint DEFAULT NULL,
  `km` mediumint unsigned DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA','ENTREGADO','RECIBIDO','RENOVADO','SISTEMA') NOT NULL,
  `fecha_estado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contrato_numero` char(16) DEFAULT NULL,
  `vehiculo_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flota__vehiculo_movimiento_operacion__document1_idx` (`contrato_numero`),
  KEY `fk_flota__vehiculo_movimiento_flota__vehiculo1_idx` (`vehiculo_id`),
  CONSTRAINT `fk_flota__vehiculo_movimiento_flota__vehiculo1` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flota__vehiculo_movimiento_operacion__document1` FOREIGN KEY (`contrato_numero`) REFERENCES `operacion__document` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flota__vehiculo_movimiento`
--

LOCK TABLES `flota__vehiculo_movimiento` WRITE;
/*!40000 ALTER TABLE `flota__vehiculo_movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `flota__vehiculo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 10:28:03
