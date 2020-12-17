/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.4.11-MariaDB : Database - rentavan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rentavan` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `comun__cliente` */

DROP TABLE IF EXISTS `comun__cliente`;

CREATE TABLE `comun__cliente` (
  `id` int(10) unsigned NOT NULL,
  `tipo` enum('PERSONA','EMPRESA') NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comun__persona_has_operacion__orden_comun__persona1` FOREIGN KEY (`id`) REFERENCES `comun__persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__cliente` */

/*Table structure for table `comun__delegacion` */

DROP TABLE IF EXISTS `comun__delegacion`;

CREATE TABLE `comun__delegacion` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `comun__delegacion` */

insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (2,'Madrid',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (8,'Almería',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (14,'Barcelona',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (20,'Granada',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (21,'Málaga',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (25,'Burgos',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (28,'Córdoba',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (29,'Sevilla',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (30,'San Sebastian',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (31,'Bilbao',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (42,'Cantabria',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (44,'Asturias',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (45,'Pontevedra',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (47,'Murcia',NULL,NULL,NULL,NULL);

/*Table structure for table `comun__oficina` */

DROP TABLE IF EXISTS `comun__oficina`;

CREATE TABLE `comun__oficina` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `direccion` tinyblob DEFAULT NULL,
  `horario` tinyblob DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delegacion__id` (`delegacion_id`),
  CONSTRAINT `comun__oficina_ibfk_1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__oficina` */

/*Table structure for table `comun__persona` */

DROP TABLE IF EXISTS `comun__persona`;

CREATE TABLE `comun__persona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `pais_dni` varchar(45) NOT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`,`pais_dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__persona` */

/*Table structure for table `comun__persona_contacto` */

DROP TABLE IF EXISTS `comun__persona_contacto`;

CREATE TABLE `comun__persona_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo` enum('CORREO','TELEFONO','MOVIL','FAX','WEB','PERSONA') DEFAULT NULL,
  `clase` set('PRINCIPAL','EMERGENCIA','REFERENCIA','PERSONAL','FAMILIAR','OTRO') DEFAULT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comun__persona_contacto_comun__persona1_idx` (`persona_id`),
  CONSTRAINT `fk_comun__persona_contacto_comun__persona1` FOREIGN KEY (`persona_id`) REFERENCES `comun__persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__persona_contacto` */

/*Table structure for table `comun__persona_direccion` */

DROP TABLE IF EXISTS `comun__persona_direccion`;

CREATE TABLE `comun__persona_direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` text NOT NULL,
  `problacion` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(15) DEFAULT NULL,
  `clase` set('PRINCIPAL','FISCAL','OFICINA','CASA') DEFAULT NULL,
  `persona_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comun__persona_contacto_comun__persona1_idx` (`persona_id`),
  CONSTRAINT `fk_comun__persona_contacto_comun__persona10` FOREIGN KEY (`persona_id`) REFERENCES `comun__persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__persona_direccion` */

/*Table structure for table `flota__marca` */

DROP TABLE IF EXISTS `flota__marca`;

CREATE TABLE `flota__marca` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `flota__marca` */

insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (1,'KIA',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (2,'SUSUKI',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (3,'TOYOTA',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (4,'CHEVROLET',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (5,'FIAT',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (6,'DAIHATSU','TEST',NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (7,'HYUNDAI',NULL,NULL,NULL);

/*Table structure for table `flota__modelo` */

DROP TABLE IF EXISTS `flota__modelo`;

CREATE TABLE `flota__modelo` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `marca_id` smallint(5) unsigned DEFAULT NULL,
  `tipo_id` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marca__id` (`marca_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `flota__modelo_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `flota__marca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__modelo_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo` */

insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (1,'SPORTAGE',NULL,1,'A');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (2,'GRAND VITARA',NULL,2,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (3,'COROLLA','',3,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (4,'BLAZER 4X2',NULL,4,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (5,'SIENA TAXI FIRE',NULL,5,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (6,'TERIOS COOL SIN',NULL,6,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (7,'ELANTRA 2.0L GL',NULL,7,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (15,'CORSA','',4,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (16,'CORSA','',4,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (17,'CORSA','',4,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (18,'CORSA','',4,NULL);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (19,'CORSA','',4,NULL);

/*Table structure for table `flota__modelo_caracteristicas` */

DROP TABLE IF EXISTS `flota__modelo_caracteristicas`;

CREATE TABLE `flota__modelo_caracteristicas` (
  `id` smallint(5) unsigned NOT NULL,
  `potencia` varchar(10) DEFAULT NULL,
  `combustible` enum('GASOLINA','DIESEL','ELECTRICO','HIBRIDO') DEFAULT NULL,
  `combustible_cap` tinyint(3) unsigned DEFAULT NULL,
  `largo` float(5,2) unsigned DEFAULT NULL,
  `ancho` float(5,2) unsigned DEFAULT NULL,
  `alto` float(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__modelo_caracteristicas_flota__modelo1` FOREIGN KEY (`id`) REFERENCES `flota__modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo_caracteristicas` */

insert  into `flota__modelo_caracteristicas`(`id`,`potencia`,`combustible`,`combustible_cap`,`largo`,`ancho`,`alto`) values (3,'90','GASOLINA',NULL,NULL,NULL,NULL);

/*Table structure for table `flota__modelo_carga` */

DROP TABLE IF EXISTS `flota__modelo_carga`;

CREATE TABLE `flota__modelo_carga` (
  `id` smallint(5) unsigned NOT NULL,
  `largo` float(5,2) unsigned DEFAULT NULL,
  `ancho` float(5,2) unsigned DEFAULT NULL,
  `alto` float(5,2) unsigned DEFAULT NULL,
  `peso` varchar(10) DEFAULT NULL,
  `volumen` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__vehiculo_carga_flota__modelo1` FOREIGN KEY (`id`) REFERENCES `flota__modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo_carga` */

insert  into `flota__modelo_carga`(`id`,`largo`,`ancho`,`alto`,`peso`,`volumen`) values (3,NULL,NULL,NULL,'','');

/*Table structure for table `flota__tarifa` */

DROP TABLE IF EXISTS `flota__tarifa`;

CREATE TABLE `flota__tarifa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `desde` tinyint(1) unsigned zerofill DEFAULT NULL,
  `hasta` tinyint(3) unsigned NOT NULL,
  `tipo_tarifa` enum('DIA','MES','HORA') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `km` float(7,2) unsigned DEFAULT NULL,
  `eur_km` float(7,2) unsigned DEFAULT NULL,
  `eur_lt` float(7,2) unsigned DEFAULT NULL,
  `hora` float(7,2) unsigned DEFAULT NULL,
  `eur_hora` float(7,2) unsigned DEFAULT NULL,
  `eur_dia` float(7,2) unsigned DEFAULT NULL,
  `eur_mes` float(7,2) unsigned DEFAULT NULL,
  `tipo_id` char(3) NOT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__tarifa_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa` */

insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (1,0,21,'MES','2020-10-31','2020-12-15',350.00,1.00,1.00,1.00,49.00,49.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (2,2,3,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (3,3,4,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (4,4,7,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (5,7,14,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (6,14,22,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (7,22,30,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (8,30,90,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (9,0,2,'HORA','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (10,2,4,'HORA','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (11,0,3,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (12,3,6,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (13,6,24,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,460.00,'A',2);

/*Table structure for table `flota__tarifa_historia` */

DROP TABLE IF EXISTS `flota__tarifa_historia`;

CREATE TABLE `flota__tarifa_historia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tarifa_id` int(10) unsigned NOT NULL,
  `desde` tinyint(1) unsigned zerofill DEFAULT NULL,
  `hasta` tinyint(3) unsigned NOT NULL,
  `tipo_tarifa` enum('DIA','MES','HORA') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `km` float(7,2) unsigned DEFAULT NULL,
  `eur_km` float(7,2) unsigned DEFAULT NULL,
  `eur_lt` float(7,2) unsigned DEFAULT NULL,
  `hora` float(7,2) unsigned DEFAULT NULL,
  `eur_hora` float(7,2) unsigned DEFAULT NULL,
  `eur_dia` float(7,2) unsigned DEFAULT NULL,
  `eur_mes` float(7,2) unsigned DEFAULT NULL,
  `tipo_id` char(3) NOT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  `fecha_transaccion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tarifa_id` (`tarifa_id`),
  KEY `delegacion_id` (`delegacion_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `flota__tarifa_historia_ibfk_1` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_historia_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_historia_ibfk_3` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa_historia` */

insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (1,1,0,21,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',NULL,'2020-12-15 01:32:24');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (2,1,0,21,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',14,'2020-12-15 01:43:27');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (3,1,0,21,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 01:43:49');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (4,1,0,21,'MES','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 01:44:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (5,1,0,21,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 01:45:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (6,1,0,21,'DIA','2020-10-31','2020-12-15',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 03:18:55');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (7,2,2,3,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',2,'2020-12-15 05:00:28');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (8,3,3,4,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (9,4,4,7,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (10,5,7,14,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (11,6,14,22,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (12,7,22,30,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (13,8,30,90,'DIA','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (14,9,0,2,'HORA','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (15,10,2,4,'HORA','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (16,11,0,3,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (17,12,3,6,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (18,13,6,24,'MES','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,460.00,'A',2,'2020-12-15 05:00:36');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (19,1,0,21,'MES','2020-10-31','2020-12-15',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 09:51:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (20,1,0,21,'HORA','2020-10-31','2020-12-15',300.00,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:38:12');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (21,1,0,21,'HORA','2020-10-31','2020-12-15',300.00,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:38:27');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (22,1,0,21,'DIA','2020-10-31','2020-12-15',300.15,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:55:13');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (23,1,0,21,'HORA','2020-10-31','2020-12-15',300.33,1.40,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:57:20');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (24,1,0,21,'HORA','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:57:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (25,1,0,21,'MES','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:27');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (26,1,0,21,'MES','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:43');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (27,1,0,21,'DIA','2020-10-31','2020-12-15',3600.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:54');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (28,1,0,21,'MES','2020-10-31','2020-12-15',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:23:39');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (29,1,0,21,'MES','2020-10-31','2020-12-15',350.00,1.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-17 14:50:55');

/*Table structure for table `flota__tipo` */

DROP TABLE IF EXISTS `flota__tipo`;

CREATE TABLE `flota__tipo` (
  `id` char(3) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_vehiculo` enum('COMERCIAL','ESPECIAL','MONOVOLUMEN','TODOTERRENO','TURISMO') DEFAULT NULL,
  `fianza` float(7,2) unsigned DEFAULT NULL,
  `franquicia` float(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__tipo` */

insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A','Derivado de Turismo','Furgoneta de alquiler ideal para el transporte de cargas ligeras como paquetería, cajas o pequeño mobiliario con un volumen de carga de entre 2-3 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez. Es el modelo de carga más pequeño que encontrarás en nuestra flota.111','COMERCIAL',300.00,600.50);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A+','Derivado de Turismo Plus','Furgoneta de alquiler ideal para transportar personas (modelo combi) o cargas ligeras (modelo comercial) con un volumen de carga de entre 2,5 - 3,5 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez.','',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A-C','Derivado de Turismo Combi','Es el modelo de furgoneta más pequeño, aun así sus dimensiones son más amplias que cualquier vehículo turismo medio. Este modelo combi tiene capacidad para transportar hasta 5 personas de forma cómoda y confortable, ofreciendo una flexibilidad total a la hora de abatir algún asiento para ganar más espacio para carga si fuera necesario. A estas características se le suma un muy bajo consumo y una gran facilidad y comodidad de conducción similar a la de los modelos más recientes de turismos.','',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A1','A',NULL,'COMERCIAL',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('B','Furgoneta Pequeña','Furgoneta de alquiler con espacio de carga aproximado entre 6 - 8 m³ ideal para transportar cargas donde no necesitemos una gran altura en el espacio de carga pero ganando en profundidad o longitud, por lo que podremos incorporar cargas más voluminosas que puedan ser transportadas preferiblemente de forma horizontal en el espacio de carga.','',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('C','Furgoneta Mediana','Furgoneta de alquiler con espacio de carga aproximado entre 8 - 10 m³ ideal para transportar cargas que requieran una mayor altura, siendo la profundidad o longitud del espacio de carga similar al del segmento pequeño. Ganamos volumen de carga gracias a una mayor altura.','',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('D','Furgoneta Grande','Furgoneta de alquiler con espacio de carga aproximado entre 10 - 12 m³ ideal para transportar cargas voluminosas como pequeñas mudanzas o transporte de mercancías altas. Ganamos altura, anchura y profundidad o longitud en el espacio de carga. Es la furgoneta más utilizada en el transporte de cargas con volúmenes considerables.','',NULL,NULL);

/*Table structure for table `flota__vehiculo` */

DROP TABLE IF EXISTS `flota__vehiculo`;

CREATE TABLE `flota__vehiculo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  `bastidor` varchar(30) DEFAULT NULL,
  `modelo_id` smallint(5) unsigned DEFAULT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`),
  UNIQUE KEY `bastidor_UNIQUE` (`bastidor`),
  KEY `modelo__id` (`modelo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_ibfk_1` FOREIGN KEY (`modelo_id`) REFERENCES `flota__modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo` */

insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (1,'AB706RD','2020-11-30','xyz321789',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (2,'AI414OG',NULL,'5ED9D2755',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (4,'7A1A6DU',NULL,'5E1E74755',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (5,'0000000',NULL,'C34615755',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (6,'0000012',NULL,'925616755',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (7,'0000112',NULL,'036617755',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (8,'00AA2ED',NULL,'39B618755',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (9,'00AA3EV',NULL,'62C619755',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (10,'00AA4ZU',NULL,'7BC610855',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (11,'00AA5HY',NULL,'3BD611855',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (12,'00AA7IW',NULL,'E8E612855',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (13,'00AB1XL',NULL,'62F613855',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (14,'00AB3XL',NULL,'89F614855',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (15,'00AB4CL',NULL,'F10715855',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (16,'00AB4XL',NULL,'C90716855',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (17,'00AB5WL',NULL,'C01717855',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (18,'00AB9CL',NULL,'3A1718855',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (19,'00AC0UL',NULL,'812719855',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (20,'00AC5UL',NULL,'982710955',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (21,'00AC7XL',NULL,'903711955',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (22,'00ACOUL',NULL,'AD3712955',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (23,'00AD4LL',NULL,'864713955',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (24,'00AD5ML',NULL,'9E4714955',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (25,'00AD8IL',NULL,'175715955',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (26,'01AA4FX',NULL,'01B716955',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (27,'01AA6FX',NULL,'FCB717955',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (28,'01AA9FX',NULL,'86C718955',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (29,'01AB1CL',NULL,'4EC719955',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (30,'01AB3VL',NULL,'75D710065',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (31,'01AB3XL',NULL,'ADD711065',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (32,'01AB4JU',NULL,'77E712065',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (33,'01AB7PL',NULL,'F0F713065',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (34,'01AB7WL',NULL,'9CF714065',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (35,'01AB9XL',NULL,'760815065',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (36,'01AC5HL',NULL,'FF0816065',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (37,'01AD7LL',NULL,'8A1817065',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (38,'01AE6LS',NULL,'022818065',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (39,'02AA0FX',NULL,'0F7819065',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (40,'02AA1FX',NULL,'A88810165',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (41,'02AA3RM',NULL,'829811165',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (42,'02AA7XP',NULL,'2A9812165',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (43,'02AA8FX',NULL,'A2A813165',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (44,'02AA9BB',NULL,'0AA814165',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (45,'02AA9FX',NULL,'D2B815165',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (46,'02AA9TP',NULL,'1BB816165',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (47,'02AB0AL',NULL,'A2C817165',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (48,'02AB0XL',NULL,'2BC818165',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (49,'02AB3PL',NULL,'94D819165',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (50,'02AB4VT',NULL,'BED810265',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (51,'02AB6PL',NULL,'F0F811265',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (52,'02AB7CL',NULL,'98F812265',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (53,'02AB8EE',NULL,'B10913265',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (54,'02AB9WL',NULL,'0A0914265',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (55,'02AC2UL',NULL,'D11915265',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (56,'02AD1EL',NULL,'5D1916265',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (57,'02AD4IL',NULL,'962917265',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (58,'02AD6LL',NULL,'173918265',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (59,'02AH7MV',NULL,'DF3919265',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (60,'03AA2CL',NULL,'61E910365',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (61,'03AA8FX',NULL,'3BE911365',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (62,'03AB2CL',NULL,'43F912365',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (63,'03AB3CL',NULL,'6BF913365',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (64,'03AB4RV',NULL,'940A14365',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (65,'03AB6PL',NULL,'931A15365',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (66,'03AB7JL',NULL,'3B1A16365',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (67,'03AB7TL',NULL,'852A17365',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (68,'03AB9PL',NULL,'1D2A18365',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (69,'03AC3UL',NULL,'BC3A19365',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (70,'03AC5UL',NULL,'064A10465',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (71,'03AC6VL',NULL,'FE4A11465',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (72,'03AD3LL',NULL,'B85A12465',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (73,'04A03IL',NULL,'6DBA13465',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (74,'04AA0FX',NULL,'67CA14465',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (75,'04AA0JC',NULL,'38DA15465',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (76,'04AA3FX',NULL,'CFDA16465',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (77,'04AA3XL',NULL,'50FA17465',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (78,'04AA5ZL',NULL,'9CFA18465',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (79,'04AA7JK',NULL,'360B19465',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (80,'04AA8WL',NULL,'7F0B10565',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (81,'04AB3AD',NULL,'E61B11565',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (82,'04AB3CL',NULL,'882B12565',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (83,'04AB4PL',NULL,'C63B13565',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (84,'04AB5AL',NULL,'8F3B14565',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (85,'04AB5CL',NULL,'6F4B15565',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (86,'04AB5XL',NULL,'295B16565',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (87,'04AB7CL',NULL,'E66B17565',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (88,'04AB87L',NULL,'4F6B18565',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (89,'04AC9VS',NULL,'A87B19565',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (90,'04AD3LL',NULL,'018B10665',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (91,'04AE9AK',NULL,'CA8B11665',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (92,'04AH7JK',NULL,'749B12665',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (93,'05AA6ID',NULL,'1B0C13665',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (94,'05AA6IT',NULL,'971C14665',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (95,'05AA6RL',NULL,'0E2C15665',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (96,'05AA8EL',NULL,'693C16665',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (97,'05AB0GV',NULL,'314C17665',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (98,'05AB2HT',NULL,'E94C18665',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (99,'05AB5OA',NULL,'B15C19665',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (100,'05AB8HT',NULL,'3A5C10765',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (101,'05AB9CL',NULL,'F96C11765',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (102,'05AC5PL',NULL,'C57C12765',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (103,'05AC6PL',NULL,'CD7C13765',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (104,'05AC9KL',NULL,'278C14765',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (105,'05AD6HL',NULL,'7F8C15765',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (106,'05AD7JL',NULL,'699C16765',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (107,'05AD86I',NULL,'79AC17765',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (108,'05AD8CL',NULL,'A2BC18765',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (109,'05AD8GL',NULL,'8BBC19765',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (110,'05AD8JL',NULL,'16CC10865',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (111,'06AA0FL',NULL,'1C1D11865',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (112,'06AA3EL',NULL,'842D12865',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (113,'06AA5IL',NULL,'EB2D13865',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (114,'06AA6LA',NULL,'FA3D14865',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (115,'06AA6LF',NULL,'724D15865',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (116,'06AA8DK',NULL,'C05D16865',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (117,'06AB1SL',NULL,'095D17865',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (118,'06AB2HT',NULL,'516D18865',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (119,'06AB3CL',NULL,'896D19865',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (120,'06AB4TL',NULL,'347D10965',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (121,'06AB5HT',NULL,'838D11965',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (122,'06AB6PT',NULL,'3C8D12965',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (123,'06AB7HT',NULL,'549D13965',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (124,'06AB8HT',NULL,'6F9D14965',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (125,'06ABIEE',NULL,'8BAD15965',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (126,'06ABOHT',NULL,'35BD16965',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (127,'06AC3KL',NULL,'3DBD17965',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (128,'06AC3XL',NULL,'74CD18965',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (129,'06AC4KL',NULL,'80DD19965',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (130,'06AC5NL',NULL,'98DD10075',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (131,'06AC9AL',NULL,'EFDD11075',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (132,'06AD0FL',NULL,'87ED12075',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (133,'06AD0JL',NULL,'86FD13075',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (134,'06AD3JL',NULL,'3FFD14075',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (135,'06AE9BK',NULL,'D60E15075',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (136,'072-LAK',NULL,'F37E16075',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (137,'073A0FE',NULL,'669E17075',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (138,'07AA0CL',NULL,'C7AE18075',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (139,'07AA0DK',NULL,'93BE19075',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (140,'07AA1AW',NULL,'D0CE10175',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (141,'07AA1EL',NULL,'7DCE11175',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (142,'07AA3SG',NULL,'78DE12175',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (143,'07AA7SE',NULL,'48EE13175',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (144,'07AA7SZ',NULL,'D0FE14175',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (145,'07AA9EL',NULL,'BAFE15175',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (146,'07AB0HT',NULL,'920F16175',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (147,'07AB3SL',NULL,'5B0F17175',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (148,'07AB3TL',NULL,'A41F18175',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (149,'07AB4WL',NULL,'302F19175',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (150,'07AB5HT',NULL,'BA2F10275',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (151,'07AB6TL',NULL,'014F11275',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (152,'07AC2KL',NULL,'594F12275',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (153,'07AC6AL',NULL,'915F13275',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (154,'07AC7GV',NULL,'5A5F14275',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (155,'07AD8GL',NULL,'C26F15275',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (156,'07AD9GL',NULL,'FB6F16275',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (157,'07AI8XV',NULL,'268F17275',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (158,'08AA1HE',NULL,'002028275',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (159,'08AA3VL',NULL,'782029275',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (160,'08AA5FL',NULL,'973020375',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (161,'08AA6SL',NULL,'004021375',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (162,'08AA7EL',NULL,'AE4022375',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (163,'08AAIHE',NULL,'965023375',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (164,'08AB0SL',NULL,'1F5024375',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (165,'08AB25L',NULL,'286025375',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (166,'08AB7SL',NULL,'617026375',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (167,'08AB95L',NULL,'C97027375',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (168,'08AB9HT',NULL,'228028375',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (169,'08AB9WL',NULL,'FA8029375',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (170,'08AC1VL',NULL,'739020475',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (171,'08AC7NL',NULL,'0C9021475',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (172,'08AD8JL',NULL,'F3A022475',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (173,'09AA2EL',NULL,'775123475',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (174,'09AA3FL',NULL,'A26124475',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (175,'09AA7BT',NULL,'AD6125475',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (176,'09AA9FL',NULL,'887126475',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (177,'09AB0HT',NULL,'308127475',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (178,'09AC3AL',NULL,'288128475',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (179,'09AD9GL',NULL,'DF8129475',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (180,'0AG878T',NULL,'1E2220575',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (181,'0AGZ34T',NULL,'244221575',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (182,'0OAB0WL',NULL,'C1A222575',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (183,'10A5B2L',NULL,'D7E223575',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (184,'10A5B3L',NULL,'AFE224575',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (185,'10A6A6L',NULL,'79F225575',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (186,'10A7B0L',NULL,'3F0326575',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (187,'1111111',NULL,'F25327575',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (188,'1234ABC',NULL,'F1F328575',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (189,'127-7AG',NULL,'720429575',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (190,'12A2A4T',NULL,'C90420675',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (191,'13A535L',NULL,'056421675',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (192,'13A5A2L',NULL,'6C6422675',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (193,'14A9A0L',NULL,'60D423675',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (194,'16A7A4L',NULL,'91C524675',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (195,'16A8A9P',NULL,'0AC525675',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (196,'16A9A2L',NULL,'53D526675',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (197,'16ASA2G',NULL,'72F527675',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (198,'17A7A3L',NULL,'91A628675',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (199,'17A8A5L',NULL,'8EA629675',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (200,'17A9C1V',NULL,'C4C620775',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (201,'181-AAC',NULL,'617721775',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (202,'189BC4E',NULL,'C3B722775',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (203,'1C00001',NULL,'03B823775',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (204,'1C00283',NULL,'AAB824775',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (205,'1C00D01',NULL,'53C825775',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (206,'1COO180',NULL,'BCC826775',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (207,'1D561LV',NULL,'A4D827775',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (208,'1OA5B3L',NULL,'0CD828775',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (209,'1OA8A7P',NULL,'C3E829775',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (210,'20A57AL',NULL,'3D3920875',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (211,'20A59AM',NULL,'484921875',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (212,'21A24AE',NULL,'032A22875',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (213,'21A71BM',NULL,'AB2A23875',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (214,'21JVAAZ',NULL,'824A24875',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (215,'2222222',NULL,'24CA25875',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (216,'22A55AL',NULL,'E4EA26875',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (217,'22A86AL',NULL,'0EEA27875',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (218,'22A89AL',NULL,'A5FA28875',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (219,'22A92AL',NULL,'FEFA29875',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (220,'22A97AL',NULL,'B80B20975',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (221,'234G2AL',NULL,'654B21975',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (222,'23A50AL',NULL,'D96B22975',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (223,'23A54AL',NULL,'237B23975',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (224,'23A65AL',NULL,'C38B24975',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (225,'23A82AI',NULL,'FC8B25975',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (226,'23A82AL',NULL,'679B26975',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (227,'25A32AL',NULL,'71FB27975',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (228,'25A56AL',NULL,'4BFB28975',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (229,'25A59AL',NULL,'540C29975',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (230,'25A65AL',NULL,'DB0C20085',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (231,'25A69AL',NULL,'F41C21085',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (232,'25A85AL',NULL,'DC1C22085',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (233,'25A98AL',NULL,'582C23085',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (234,'25AG2AL',NULL,'343C24085',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (235,'25AO4AL',NULL,'904C25085',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (236,'26A08AL',NULL,'06DC26085',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (237,'26A35AV',NULL,'8DDC27085',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (238,'271-LAF',NULL,'9FFC28085',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (239,'2791961',NULL,'183D29085',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (240,'27A22AL',NULL,'804D20185',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (241,'27A42AL',NULL,'5C4D21185',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (242,'27A52AL',NULL,'C55D22185',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (243,'27A54AL',NULL,'D06D23185',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (244,'27A68AL',NULL,'5A6D24185',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (245,'27A78AS',NULL,'327D25185',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (246,'27AG3AL',NULL,'997D26185',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (247,'2992470',NULL,'291E27185',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (248,'2OA57AL',NULL,'6FAE28185',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (249,'2OA78AD',NULL,'B6BE29185',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (250,'2ZA91AL',NULL,'FEBE20285',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (251,'300X008',NULL,'C9CE21285',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (252,'335KVAA',NULL,'DF2032285',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (253,'36KKKAV',NULL,'684133285',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (254,'374X1FN',NULL,'FB9134285',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (255,'3A00008',NULL,'23B235285',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (256,'3C00346',NULL,'14D236285',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (257,'3C00382',NULL,'5DD237285',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (258,'3C00387',NULL,'F4E238285',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (259,'3C00602',NULL,'DCE239285',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (260,'3COO382',NULL,'D4F230385',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (261,'3COO602',NULL,'3CF231385',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (262,'3PO12O9',NULL,'222332385',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (263,'400A5AV',NULL,'0A2333385',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (264,'404A5AT',NULL,'AA3334385',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (265,'408A1AO',NULL,'FE4335385',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (266,'409DB9G',NULL,'975336385',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (267,'4118A8Z',NULL,'3C9337385',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (268,'411A8AL',NULL,'F4A338385',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (269,'415CB9M',NULL,'1BD339385',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (270,'416A4AO',NULL,'5DE330485',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (271,'418A7AP',NULL,'F5F331485',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (272,'420A1AL',NULL,'872432485',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (273,'421A5AL',NULL,'014433485',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (274,'422A0AL',NULL,'594434485',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (275,'422A1AL',NULL,'595435485',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (276,'422A2AL',NULL,'656436485',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (277,'422A3AL',NULL,'2D6437485',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (278,'422A4AL',NULL,'057438485',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (279,'423A2AS',NULL,'D48439485',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (280,'433A4AL',NULL,'702530585',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (281,'43BBBAC',NULL,'D94531585',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (282,'43NVLAC',NULL,'0A6532585',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (283,'441-S4G',NULL,'D49533585',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (284,'441A0AL',NULL,'8E9534585',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (285,'442A3AL',NULL,'5FA535585',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (286,'449A74L',NULL,'FEE536585',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (287,'449AZAL',NULL,'96F537585',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (288,'4500EFI',NULL,'528638585',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (289,'450A1AV',NULL,'8E8639585',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (290,'456A2AW',NULL,'9CC630685',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (291,'45YAG4P',NULL,'57F631685',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (292,'464-LAB',NULL,'420732685',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (293,'46420PK',NULL,'ED0733685',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (294,'469A3AA',NULL,'491734685',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (295,'477BK1A',NULL,'F79735685',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (296,'479A9AT',NULL,'D3A736685',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (297,'492AI7J',NULL,'72F837685',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (298,'495DR7K',NULL,'9D0938685',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (299,'497A3AL',NULL,'0A1939685',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (300,'497A9AL',NULL,'772930785',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (301,'497EI8M',NULL,'443931785',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (302,'4ACA9VS',NULL,'0D7932785',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (303,'4D8G06D',NULL,'7F9933785',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (304,'4F211PA',NULL,'F3B934785',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (305,'4F5F20V',NULL,'F0C935785',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (306,'4G209BG',NULL,'ECC936785',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (307,'4H9T48D',NULL,'09D937785',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (308,'4L1A5AL',NULL,'86E938785',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (309,'4O4A5AT',NULL,'72F939785',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (310,'5000514',NULL,'100A30885',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (311,'5000982',NULL,'8E0A31885',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (312,'500AA5V',NULL,'2C1A32885',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (313,'504AA6L',NULL,'355A33885',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (314,'515AA4E',NULL,'0A2B34885',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (315,'521AA6L',NULL,'C9AB35885',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (316,'523AA6L',NULL,'C6BB36885',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (317,'534AA9E',NULL,'C05C37885',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (318,'54OAB2S',NULL,'171D38885',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (319,'553AA1L',NULL,'4F7D39885',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (320,'553AA4L',NULL,'AC8D30985',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (321,'554AA0L',NULL,'789D31985',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (322,'5555555',NULL,'20BD32985',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (323,'556AASL',NULL,'2DBD33985',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (324,'557AA5L',NULL,'99CD34985',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (325,'559AA74',NULL,'512E35985',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (326,'559AA7A',NULL,'FD2E36985',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (327,'559AA9G',NULL,'693E37985',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (328,'561AA3L',NULL,'DB8E38985',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (329,'561AA7P',NULL,'C79E39985',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (330,'563AA0P',NULL,'F4AE30095',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (331,'565AA4P',NULL,'21BE31095',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (332,'567AA45',NULL,'99CE32095',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (333,'567AAOP',NULL,'25DE33095',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (334,'569-XIA',NULL,'A1EE34095',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (335,'570AA8M',NULL,'B4AF35095',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (336,'572AA5L',NULL,'C1BF36095',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (337,'575AA05',NULL,'E9CF37095',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (338,'575AA8L',NULL,'A6DF38095',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (339,'576AA4L',NULL,'42EF39095',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (340,'576AA6L',NULL,'7EEF30195',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (341,'595AA4L',NULL,'7C0141195',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (342,'596AA4L',NULL,'DE2142195',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (343,'596AA8L',NULL,'0C3143195',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (344,'597AA5L',NULL,'874144195',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (345,'598AA4L',NULL,'7A6145195',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (346,'5A7A1DL',NULL,'0FC146195',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (347,'5AE04WZ',NULL,'9F0247195',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (348,'5O3AA7L',NULL,'0B9248195',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (349,'5O8AA9S',NULL,'E6A249195',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (350,'60AA8DX',NULL,'6BE240295',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (351,'6247DKJ',NULL,'461441295',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (352,'665J61F',NULL,'B4D542295',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (353,'682-ABH',NULL,'4A1743295',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (354,'6A7A6WK',NULL,'E81844295',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (355,'6C0D53U',NULL,'EC3845295',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (356,'6O35A9L',NULL,'828846295',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (357,'6UA7273',NULL,'819847295',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (358,'6UA7801',NULL,'7D9848295',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (359,'6VECESA',NULL,'C5B849295',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (360,'740-XDY',NULL,'E8FA40395',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (361,'741A0EM',NULL,'C01B41395',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (362,'743420U',NULL,'853B42395',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (363,'743DOWS',NULL,'414B43395',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (364,'745-MBE',NULL,'CA5B44395',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (365,'745AOIV',NULL,'E66B45395',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (366,'745DAIS',NULL,'E37B46395',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (367,'74645AL',NULL,'DB8B47395',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (368,'747B4FK',NULL,'0A9B48395',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (369,'747B8MP',NULL,'F5AB49395',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (370,'747BOCV',NULL,'E1BB40495',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (371,'748A0WL',NULL,'0FBB41495',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (372,'748A5BI',NULL,'8ACB42495',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (373,'749A9KV',NULL,'63EB43495',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (374,'7A0A0GO',NULL,'A0CE44495',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (375,'7A0A0KK',NULL,'C9CE45495',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (376,'7A0A0KT',NULL,'32DE46495',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (377,'7A0A0MV',NULL,'1DDE47495',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (378,'7A0A1HA',NULL,'D6EE48495',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (379,'7A0A1IP',NULL,'A2FE49495',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (380,'7A0A1NU',NULL,'9CFE40595',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (381,'7A0A1SM',NULL,'940F41595',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (382,'7A0A1WK',NULL,'291F42595',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (383,'7A0A200',NULL,'FF2F43595',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (384,'7A0A260',NULL,'693F44595',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (385,'7A0A2AW',NULL,'C44F45595',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (386,'7A0A2CA',NULL,'3E4F46595',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (387,'7A0A2OO',NULL,'8C5F47595',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (388,'7A0A2UO',NULL,'146F48595',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (389,'7A0A2UU',NULL,'677F49595',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (390,'7A0A2YD',NULL,'798F40695',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (391,'7A0A3EU',NULL,'D39F41695',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (392,'7A0A3GN',NULL,'8B9F42695',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (393,'7A0A3JO',NULL,'24AF43695',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (394,'7A0A3MO',NULL,'1DAF44695',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (395,'7A0A3UE',NULL,'E9BF45695',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (396,'7A0A4AA',NULL,'16CF46695',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (397,'7A0A4DU',NULL,'43DF47695',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (398,'7A0A4ME',NULL,'A0EF48695',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (399,'7A0A4T0',NULL,'77FF49695',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (400,'7A0A4TT',NULL,'C40050795',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (401,'7A0A5CL',NULL,'7E0051795',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (402,'7A0A5HT',NULL,'761052795',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (403,'7A0A5IP',NULL,'9F1053795',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (404,'7A0A5LB',NULL,'6B2054795',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (405,'7A0A5UO',NULL,'963055795',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (406,'7A0A6AX',NULL,'E04056795',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (407,'7A0A6IB',NULL,'2C4057795',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (408,'7A0A6IP',NULL,'085058795',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (409,'7A0A6JB',NULL,'C36059795',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (410,'7A0A6KT',NULL,'8F6050895',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (411,'7A0A6VV',NULL,'748051895',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (412,'7A0A700',NULL,'889052895',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (413,'7A0A7DX',NULL,'25A053895',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (414,'7A0A7EM',NULL,'A4B054895',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (415,'7A0A7FG',NULL,'95C055895',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (416,'7A0A7GO',NULL,'A0D056895',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (417,'7A0A7NB',NULL,'B8D057895',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (418,'7A0A80E',NULL,'40E058895',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (419,'7A0A8AA',NULL,'9AE059895',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (420,'7A0A8CF',NULL,'15F050995',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (421,'7A0A8DV',NULL,'ACF051995',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (422,'7A0A8DX',NULL,'740152995',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (423,'7A0A8EU',NULL,'EB0153995',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (424,'7A0A8FL',NULL,'741154995',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (425,'7A0A8GM',NULL,'6F1155995',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (426,'7A0A8IO',NULL,'472156995',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (427,'7A0A90W',NULL,'FF2157995',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (428,'7A0A97O',NULL,'CA3158995',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (429,'7A0A9AM',NULL,'554159995',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (430,'7A0A9BI',NULL,'FF4150006',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (431,'7A0A9CF',NULL,'695151006',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (432,'7A0A9DY',NULL,'7B6152006',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (433,'7A0A9ED',NULL,'557153006',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (434,'7A0A9EU',NULL,'D58154006',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (435,'7A0A9FU',NULL,'429155006',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (436,'7A0A9JH',NULL,'CD9156006',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (437,'7A0A9KK',NULL,'60B157006',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (438,'7A0A9OW',NULL,'FAB158006',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (439,'7A0A9RK',NULL,'ABC159006',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (440,'7A0A9RU',NULL,'74D150106',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (441,'7A0A9T0',NULL,'AFD151106',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (442,'7A0AGAN',NULL,'E8E152106',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (443,'7A0B1FD',NULL,'A1F153106',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (444,'7A0B1LV',NULL,'8AF154106',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (445,'7A0B1RV',NULL,'BD0255106',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (446,'7A0B2DG',NULL,'F42256106',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (447,'7A0B2GK',NULL,'313257106',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (448,'7A0B2MV',NULL,'264258106',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (449,'7A0B45V',NULL,'BC5259106',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (450,'7A0B4DV',NULL,'C86250206',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (451,'7A0B4F0',NULL,'C67251206',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (452,'7A0B4RV',NULL,'B18252206',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (453,'7A0B5EG',NULL,'119253206',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (454,'7A0B5LV',NULL,'C89254206',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (455,'7A0B5PK',NULL,'BAA255206',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (456,'7A0B5RV',NULL,'A5B256206',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (457,'7A0B8ZV',NULL,'30D257206',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (458,'7A0B9C0',NULL,'1BD258206',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (459,'7A0B9GK',NULL,'54E259206',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (460,'7A0B9RV',NULL,'AEE250306',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (461,'7A0C3PS',NULL,'38F251306',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (462,'7A0C4US',NULL,'440352306',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (463,'7A0C4XA',NULL,'4D0353306',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (464,'7A0C5JV',NULL,'A71354306',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (465,'7A0C5LV',NULL,'B22355306',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (466,'7A0C8OV',NULL,'FD2356306',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (467,'7A0C8PA',NULL,'FA3357306',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (468,'7A0CANV',NULL,'534358306',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (469,'7A0D0DA',NULL,'685359306',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (470,'7A0D1DA',NULL,'4A6350406',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (471,'7A0D5DA',NULL,'F97351406',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (472,'7A0D6MS',NULL,'B28352406',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (473,'7A0D7NB',NULL,'6F8353406',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (474,'7A0D8NA',NULL,'9B9354406',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (475,'7A0D9DA',NULL,'87A355406',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (476,'7A0E0BS',NULL,'31B356406',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (477,'7A1A0DA',NULL,'95C357406',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (478,'7A1A0FA',NULL,'13D358406',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (479,'7A1A0MK',NULL,'D6E359406',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (480,'7A1A0OV',NULL,'51F350506',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (481,'7A1A0SU',NULL,'B70451506',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (482,'7A1A1AA',NULL,'B31452506',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (483,'7A1A1AT',NULL,'0E1453506',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (484,'7A1A1EN',NULL,'EA2454506',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (485,'7A1A1I0',NULL,'204455506',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (486,'7A1A1LW',NULL,'945456506',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (487,'7A1A2BV',NULL,'6B6457506',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (488,'7A1A2CL',NULL,'518458506',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (489,'7A1A2FU',NULL,'A69459506',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (490,'7A1A2KU',NULL,'DAA450606',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (491,'7A1A2NG',NULL,'41C451606',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (492,'7A1A2SU',NULL,'8AC452606',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (493,'7A1A3BL',NULL,'C5D453606',1,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (494,'7A1A3DY',NULL,'42E454606',2,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (495,'7A1A3HK',NULL,'B6F455606',3,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (496,'7A1A3RD',NULL,'940556606',4,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (497,'7A1A40V',NULL,'021557606',5,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (498,'7A1A45U',NULL,'2D1558606',6,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (499,'7A1A4AA',NULL,'B92559606',7,NULL);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (500,'7A1A4AN',NULL,'273550706',1,NULL);

/*Table structure for table `flota__vehiculo_caracteristicas` */

DROP TABLE IF EXISTS `flota__vehiculo_caracteristicas`;

CREATE TABLE `flota__vehiculo_caracteristicas` (
  `id` mediumint(8) unsigned NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `anio` year(4) DEFAULT NULL,
  `transmision` enum('MANUAL','AUTOMATICO','DUAL') DEFAULT NULL,
  `plazas` tinyint(3) unsigned DEFAULT NULL,
  `puertas` tinyint(3) unsigned DEFAULT NULL,
  `extra` set('GPS','AIRE','4X4','MULTIMEDIA','ALARMA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `flota__vehiculo_caracteristicas_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_caracteristicas` */

insert  into `flota__vehiculo_caracteristicas`(`id`,`color`,`anio`,`transmision`,`plazas`,`puertas`,`extra`) values (1,'BLANCO',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `flota__vehiculo_historia` */

DROP TABLE IF EXISTS `flota__vehiculo_historia`;

CREATE TABLE `flota__vehiculo_historia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehiculo_id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA','ENTREGADO','RECIBIDO','RENOVADO','SISTEMA') NOT NULL,
  `fecha_transaccion` timestamp NULL DEFAULT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) DEFAULT NULL,
  `fecha` date NOT NULL,
  `contrato_numero` char(16) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flota__vehiculo_movimiento_operacion__document1_idx` (`contrato_numero`),
  KEY `fk_flota__vehiculo_movimiento_flota__vehiculo1_idx` (`vehiculo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_historia_ibfk_1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_historia_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_historia` */

insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (10,1,20,'CONTRATADO','2020-12-14 21:09:01',1,11,'2020-12-14',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (11,1,44,'CONTRATADO','2020-12-15 12:57:31',1,11,'2020-12-15',NULL,'PRUEBA');

/*Table structure for table `flota__vehiculo_observacion` */

DROP TABLE IF EXISTS `flota__vehiculo_observacion`;

CREATE TABLE `flota__vehiculo_observacion` (
  `id` mediumint(8) unsigned NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `flota__vehiculo_observacion_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_observacion` */

insert  into `flota__vehiculo_observacion`(`id`,`observacion`) values (1,'CONTENIDO');

/*Table structure for table `flota__vehiculo_situacion` */

DROP TABLE IF EXISTS `flota__vehiculo_situacion`;

CREATE TABLE `flota__vehiculo_situacion` (
  `id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA','ENTREGADO','RECIBIDO','RENOVADO') NOT NULL,
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text NOT NULL,
  `emplazamiento` text DEFAULT NULL,
  `km` smallint(6) unsigned NOT NULL,
  `combustible` tinyint(3) unsigned NOT NULL,
  `codigo_llave` varchar(10) DEFAULT NULL,
  `codigo_radio` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_situacion_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_situacion_ibfk_3` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_situacion` */

insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (1,44,'CONTRATADO','2020-12-14 21:09:01','PRUEBA','111111111',1,11,'1',NULL);

/*Table structure for table `operacion__orden` */

DROP TABLE IF EXISTS `operacion__orden`;

CREATE TABLE `operacion__orden` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `tipo_contrato` enum('CP','LP') NOT NULL,
  `tipo_id` char(3) NOT NULL,
  `tipo_tarifa` enum('HORA','DIA','MES') NOT NULL,
  `momento` enum('PRESUPUESTO','RESERVA','CONTRATO','EXTENSION') DEFAULT NULL,
  `estado` enum('EN VIGOR','ANULADO','FINALIZADO') NOT NULL DEFAULT 'EN VIGOR',
  `codigo` char(16) NOT NULL,
  `orden_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_operacion__orden_comun__cliente1_idx` (`cliente`),
  KEY `delegacion_id` (`delegacion_id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `orden_id` (`orden_id`),
  CONSTRAINT `operacion__orden_ibfk_1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_ibfk_3` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden` */

insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (61,2,'MARIA PEÑA','CP','A','HORA','PRESUPUESTO','EN VIGOR','02CP/2020-00001',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (79,2,'ANA VERA','LP','A+','HORA','PRESUPUESTO','EN VIGOR','02CP/2020-00013',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (80,2,'MARIA PEÑA','CP','A','HORA','RESERVA','EN VIGOR','02CP/2020-00003',61);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (81,2,'MARIA PEÑA','CP','A','HORA','CONTRATO','EN VIGOR','02CP/2020-00004',80);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (82,2,'ANA VERA','LP','A+','HORA','RESERVA','EN VIGOR','02LP/2020-00005',79);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (83,2,'ANA VERA','LP','A+','HORA','CONTRATO','EN VIGOR','02LP/2020-00006',82);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (84,2,'ANA VERA','LP','A+','HORA','EXTENSION','EN VIGOR','02LP/2020-00007',83);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (85,2,'ANA VERA','LP','A+','HORA','RESERVA','EN VIGOR','02LP/2020-00008',84);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (86,14,'PEDRO PEREZ','LP','A','HORA','PRESUPUESTO','EN VIGOR','14LP/2020-00001',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (87,14,'PEDRO PEREZ','LP','A','HORA','PRESUPUESTO','EN VIGOR','14LP/2020-00002',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (88,14,'PEDRO PEREZ','LP','A','HORA','RESERVA','EN VIGOR','14LP/2020-00003',87);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (89,14,'PEDRO PEREZ','LP','A','HORA','RESERVA','EN VIGOR','14LP/2020-00004',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (90,14,'PEDRO PEREZ','LP','A','HORA','CONTRATO','EN VIGOR','14LP/2020-00005',89);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (91,2,'ANA VERA','LP','A+','HORA','EXTENSION','EN VIGOR','02LP/2020-00009',83);

/*Table structure for table `operacion__orden_detalles` */

DROP TABLE IF EXISTS `operacion__orden_detalles`;

CREATE TABLE `operacion__orden_detalles` (
  `id` int(10) unsigned NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora_entrega` time DEFAULT NULL,
  `entrega_directa` bit(1) DEFAULT NULL,
  `fecha_recogida` date NOT NULL,
  `hora_recogida` time DEFAULT NULL,
  `recogida_directa` bit(1) DEFAULT NULL,
  `comisionista` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_detalles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_detalles` */

insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (61,'2020-12-12',NULL,'\0','2020-12-26',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (79,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (80,'2020-12-12',NULL,'\0','2020-12-26',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (81,'2020-12-12',NULL,'\0','2020-12-26',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (82,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (83,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (87,'2020-12-18',NULL,'\0','2020-12-12',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (88,'2020-12-18',NULL,'\0','2020-12-12',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (89,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`) values (90,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL);

/*Table structure for table `operacion__orden_historia` */

DROP TABLE IF EXISTS `operacion__orden_historia`;

CREATE TABLE `operacion__orden_historia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orden_id` int(10) unsigned NOT NULL,
  `estado_orden` enum('PRESUPUESTO','RESERVA','CONTRATO') NOT NULL,
  `codigo` char(16) NOT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  `tipo_contrato` enum('CP','LP') DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `vehiculo_matricula` varchar(10) DEFAULT NULL,
  `tipo_id` char(3) DEFAULT NULL,
  `tarifa_id` int(10) unsigned DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `estado` enum('EN VIGOR','ANULADO','FINALIZADO') NOT NULL DEFAULT 'EN VIGOR',
  `fecha_transaccion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `orden_id` (`orden_id`),
  KEY `delegacion_id` (`delegacion_id`),
  KEY `vehiculo_matricula` (`vehiculo_matricula`),
  KEY `tipo_id` (`tipo_id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `operacion__orden_historia_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_3` FOREIGN KEY (`vehiculo_matricula`) REFERENCES `flota__vehiculo` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_4` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_5` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_historia` */

/*Table structure for table `operacion__orden_observacion` */

DROP TABLE IF EXISTS `operacion__orden_observacion`;

CREATE TABLE `operacion__orden_observacion` (
  `id` int(10) unsigned NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_observacion_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_observacion` */

insert  into `operacion__orden_observacion`(`id`,`observacion`) values (61,'HOLA');
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (79,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (81,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (86,'PRUEBA COMENTARIO');
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (87,'PRUEBA COMENTARIO');
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (88,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (89,NULL);

/*Table structure for table `operacion__orden_vehiculo` */

DROP TABLE IF EXISTS `operacion__orden_vehiculo`;

CREATE TABLE `operacion__orden_vehiculo` (
  `id` int(10) unsigned NOT NULL,
  `vehiculo_matricula` varchar(10) NOT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) unsigned DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_matricula` (`vehiculo_matricula`),
  CONSTRAINT `operacion__orden_vehiculo_ibfk_2` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_vehiculo_ibfk_3` FOREIGN KEY (`vehiculo_matricula`) REFERENCES `flota__vehiculo` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_vehiculo` */

insert  into `operacion__orden_vehiculo`(`id`,`vehiculo_matricula`,`km`,`combustible`,`detalle`) values (81,'00AA5HY',NULL,NULL,NULL);
insert  into `operacion__orden_vehiculo`(`id`,`vehiculo_matricula`,`km`,`combustible`,`detalle`) values (88,'AB706RD',NULL,NULL,NULL);
insert  into `operacion__orden_vehiculo`(`id`,`vehiculo_matricula`,`km`,`combustible`,`detalle`) values (89,'00AA2ED',NULL,NULL,NULL);
insert  into `operacion__orden_vehiculo`(`id`,`vehiculo_matricula`,`km`,`combustible`,`detalle`) values (90,'00AA2ED',NULL,NULL,NULL);

/*Table structure for table `operacion_orden_tarifa` */

DROP TABLE IF EXISTS `operacion_orden_tarifa`;

CREATE TABLE `operacion_orden_tarifa` (
  `id` int(10) unsigned NOT NULL,
  `tarifa_id` int(10) unsigned DEFAULT NULL,
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `operacion_orden_tarifa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion_orden_tarifa_ibfk_2` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa_historia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion_orden_tarifa` */

/* Trigger structure for table `flota__tarifa` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__tarifa_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__tarifa_after_insert` AFTER INSERT ON `flota__tarifa` FOR EACH ROW BEGIN
CALL `flota__actualizar_tarifa`(NEW.id);
    END */$$


DELIMITER ;

/* Trigger structure for table `flota__tarifa` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__tarifa_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__tarifa_after_update` AFTER UPDATE ON `flota__tarifa` FOR EACH ROW BEGIN
CALL `flota__actualizar_tarifa`(NEW.id);
    END */$$


DELIMITER ;

/* Trigger structure for table `flota__vehiculo_situacion` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__vehiculo_situacion_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__vehiculo_situacion_after_insert` AFTER INSERT ON `flota__vehiculo_situacion` FOR EACH ROW BEGIN
  CALL flota__actualizar_vehiculo (
    NEW.id,
    'flota__vehiculo_situacion'
  ) ;
END */$$


DELIMITER ;

/* Trigger structure for table `flota__vehiculo_situacion` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__vehiculo_situacion_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__vehiculo_situacion_after_update` AFTER UPDATE ON `flota__vehiculo_situacion` FOR EACH ROW BEGIN
  CALL flota__actualizar_vehiculo (
    NEW.id,
    'flota__vehiculo_situacion'
  ) ;
END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_before_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_before_insert` BEFORE INSERT ON `operacion__orden` FOR EACH ROW BEGIN
	
	IF NOT ISNULL(NEW.orden_id) THEN
	
		SELECT `delegacion_id`, `cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`
		INTO @delegacion_id, @cliente, @tipo_contrato, @tipo_id, @tipo_tarifa, @momento
		FROM `operacion__orden`
		WHERE `id`=NEW.orden_id 
		LIMIT 1;
		SET 	NEW.delegacion_id = @delegacion_id,
			NEW.cliente = @cliente, 
			NEW.tipo_contrato = @tipo_contrato,
			NEW.tipo_id = @tipo_id, 
			NEW.tipo_tarifa = @tipo_tarifa;
		CASE @momento
		WHEN "RESERVA" THEN
			SET NEW.momento = "CONTRATO";
		WHEN "CONTRATO" THEN
			SET NEW.momento = "EXTENSION";
		ELSE
			SET NEW.momento = "RESERVA";
		END CASE;	
		
	END IF;
    
    	SELECT COUNT(id) INTO @numero
	FROM operacion__orden WHERE delegacion_id=NEW.delegacion_id;
	SET NEW.codigo = CONCAT(LPAD(NEW.delegacion_id, 2, '0'),NEW.tipo_contrato,'/',YEAR(NOW()),'-', LPAD(@numero + 1, 5, '0'));
	
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_after_insert` AFTER INSERT ON `operacion__orden` FOR EACH ROW BEGIN
  IF NOT ISNULL(NEW.orden_id) 
  AND NEW.`momento` IN ("RESERVA", "CONTRATO") 
  THEN 
  INSERT INTO `operacion__orden_detalles` 
  SELECT 
    NEW.id,
    `fecha_entrega`,
    `hora_entrega`,
    `entrega_directa`,
    `fecha_recogida`,
    `hora_recogida`,
    `recogida_directa`,
    `comisionista` 
  FROM
    operacion__orden_detalles 
  WHERE id = NEW.orden_id 
  LIMIT 1 ;
  
  INSERT INTO `operacion__orden_vehiculo` (`id`, `vehiculo_matricula`) 
  SELECT 
    NEW.id,
    `vehiculo_matricula` 
  FROM
    operacion__orden_vehiculo 
  WHERE id = NEW.orden_id 
  LIMIT 1 ;
  
  END IF ;
  
END */$$


DELIMITER ;

/* Procedure structure for procedure `flota__actualizar_tarifa` */

/*!50003 DROP PROCEDURE IF EXISTS  `flota__actualizar_tarifa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `flota__actualizar_tarifa`(in id INT)
BEGIN
	INSERT INTO flota__tarifa_historia
	SELECT NULL, t.*, NOW() FROM flota__tarifa t WHERE t.id=id LIMIT 1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `flota__actualizar_vehiculo` */

/*!50003 DROP PROCEDURE IF EXISTS  `flota__actualizar_vehiculo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `flota__actualizar_vehiculo`(in id INT, in fuente VARCHAR(100))
BEGIN
CASE fuente
WHEN 'flota__vehiculo_situacion' THEN 
	INSERT INTO `flota__vehiculo_historia` 
	(`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`descripcion`)
	SELECT 
	`id`,`delegacion_id`,`estado`,NOW(),`km`,`combustible`,DATE(NOW()),`descripcion`
	FROM `flota__vehiculo_situacion` t WHERE t.id=id LIMIT 1;
END CASE;
	
    END */$$
DELIMITER ;

/*Table structure for table `operacion__contrato_search` */

DROP TABLE IF EXISTS `operacion__contrato_search`;

/*!50001 DROP VIEW IF EXISTS `operacion__contrato_search` */;
/*!50001 DROP TABLE IF EXISTS `operacion__contrato_search` */;

/*!50001 CREATE TABLE  `operacion__contrato_search`(
 `id` int(10) unsigned ,
 `delegacion_id` smallint(5) unsigned ,
 `cliente` varchar(100) ,
 `tipo_contrato` enum('CP','LP') ,
 `tipo_id` char(3) ,
 `tipo_tarifa` enum('HORA','DIA','MES') ,
 `momento` enum('PRESUPUESTO','RESERVA','CONTRATO','EXTENSION') ,
 `estado` enum('EN VIGOR','ANULADO','FINALIZADO') ,
 `codigo` char(16) ,
 `orden_id` int(10) unsigned ,
 `tipo` enum('CP','LP') ,
 `delegacion_nombre` varchar(100) ,
 `fecha_entrega` date ,
 `fecha_recogida` date ,
 `matricula` varchar(10) 
)*/;

/*Table structure for table `operacion__presupuesto_search` */

DROP TABLE IF EXISTS `operacion__presupuesto_search`;

/*!50001 DROP VIEW IF EXISTS `operacion__presupuesto_search` */;
/*!50001 DROP TABLE IF EXISTS `operacion__presupuesto_search` */;

/*!50001 CREATE TABLE  `operacion__presupuesto_search`(
 `id` int(10) unsigned ,
 `delegacion_id` smallint(5) unsigned ,
 `cliente` varchar(100) ,
 `tipo_contrato` enum('CP','LP') ,
 `tipo_id` char(3) ,
 `tipo_tarifa` enum('HORA','DIA','MES') ,
 `momento` enum('PRESUPUESTO','RESERVA','CONTRATO','EXTENSION') ,
 `estado` enum('EN VIGOR','ANULADO','FINALIZADO') ,
 `codigo` char(16) ,
 `orden_id` int(10) unsigned ,
 `tipo` enum('CP','LP') ,
 `delegacion_nombre` varchar(100) ,
 `fecha_entrega` date ,
 `fecha_recogida` date 
)*/;

/*Table structure for table `operacion__reserva_search` */

DROP TABLE IF EXISTS `operacion__reserva_search`;

/*!50001 DROP VIEW IF EXISTS `operacion__reserva_search` */;
/*!50001 DROP TABLE IF EXISTS `operacion__reserva_search` */;

/*!50001 CREATE TABLE  `operacion__reserva_search`(
 `id` int(10) unsigned ,
 `delegacion_id` smallint(5) unsigned ,
 `cliente` varchar(100) ,
 `tipo_contrato` enum('CP','LP') ,
 `tipo_id` char(3) ,
 `tipo_tarifa` enum('HORA','DIA','MES') ,
 `momento` enum('PRESUPUESTO','RESERVA','CONTRATO','EXTENSION') ,
 `estado` enum('EN VIGOR','ANULADO','FINALIZADO') ,
 `codigo` char(16) ,
 `orden_id` int(10) unsigned ,
 `tipo` enum('CP','LP') ,
 `delegacion_nombre` varchar(100) ,
 `fecha_entrega` date ,
 `fecha_recogida` date ,
 `matricula` varchar(10) 
)*/;

/*View structure for view operacion__contrato_search */

/*!50001 DROP TABLE IF EXISTS `operacion__contrato_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__contrato_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__contrato_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`vehiculo_matricula` AS `matricula` from (((`operacion__orden` `t` left join `operacion__orden_vehiculo` `vehiculo` on(`vehiculo`.`id` = `t`.`id`)) left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) where `t`.`momento` = 'CONTRATO') */;

/*View structure for view operacion__presupuesto_search */

/*!50001 DROP TABLE IF EXISTS `operacion__presupuesto_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__presupuesto_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__presupuesto_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida` from ((`operacion__orden` `t` left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) where `t`.`momento` = 'PRESUPUESTO') */;

/*View structure for view operacion__reserva_search */

/*!50001 DROP TABLE IF EXISTS `operacion__reserva_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__reserva_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__reserva_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`vehiculo_matricula` AS `matricula` from (((`operacion__orden` `t` left join `operacion__orden_vehiculo` `vehiculo` on(`vehiculo`.`id` = `t`.`id`)) left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) where `t`.`momento` = 'RESERVA') */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
