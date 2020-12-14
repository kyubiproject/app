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
-- Table structure for table `flota__tipo`
--

DROP TABLE IF EXISTS `flota__tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flota__tipo` (
  `id` char(3) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo_vehiculo` enum('COMERCIAL','ESPECIAL','MONOVOLUMEN','TODOTERRENO','TURISMO') DEFAULT NULL,
  `fianza` float(7,2) unsigned DEFAULT NULL,
  `franquicia` float(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flota__tipo`
--

LOCK TABLES `flota__tipo` WRITE;
/*!40000 ALTER TABLE `flota__tipo` DISABLE KEYS */;
INSERT INTO `flota__tipo` VALUES ('A','Derivado de Turismo','Furgoneta de alquiler ideal para el transporte de cargas ligeras como paquetería, cajas o pequeño mobiliario con un volumen de carga de entre 2-3 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez. Es el modelo de carga más pequeño que encontrarás en nuestra flota.111','TURISMO',300.00,600.00),('A+','Derivado de Turismo Plus','Furgoneta de alquiler ideal para transportar personas (modelo combi) o cargas ligeras (modelo comercial) con un volumen de carga de entre 2,5 - 3,5 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez.','',NULL,NULL),('A-C','Derivado de Turismo Combi','Es el modelo de furgoneta más pequeño, aun así sus dimensiones son más amplias que cualquier vehículo turismo medio. Este modelo combi tiene capacidad para transportar hasta 5 personas de forma cómoda y confortable, ofreciendo una flexibilidad total a la hora de abatir algún asiento para ganar más espacio para carga si fuera necesario. A estas características se le suma un muy bajo consumo y una gran facilidad y comodidad de conducción similar a la de los modelos más recientes de turismos.','',NULL,NULL),('B','Furgoneta Pequeña','Furgoneta de alquiler con espacio de carga aproximado entre 6 - 8 m³ ideal para transportar cargas donde no necesitemos una gran altura en el espacio de carga pero ganando en profundidad o longitud, por lo que podremos incorporar cargas más voluminosas que puedan ser transportadas preferiblemente de forma horizontal en el espacio de carga.','',NULL,NULL),('C','Furgoneta Mediana','Furgoneta de alquiler con espacio de carga aproximado entre 8 - 10 m³ ideal para transportar cargas que requieran una mayor altura, siendo la profundidad o longitud del espacio de carga similar al del segmento pequeño. Ganamos volumen de carga gracias a una mayor altura.','',NULL,NULL),('D','Furgoneta Grande','Furgoneta de alquiler con espacio de carga aproximado entre 10 - 12 m³ ideal para transportar cargas voluminosas como pequeñas mudanzas o transporte de mercancías altas. Ganamos altura, anchura y profundidad o longitud en el espacio de carga. Es la furgoneta más utilizada en el transporte de cargas con volúmenes considerables.','',NULL,NULL);
/*!40000 ALTER TABLE `flota__tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 10:28:01
