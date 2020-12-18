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
USE `rentavan`;

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

insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (1,'Madrid',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (2,'Almería',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (3,'Barcelona',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (4,'Granada',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (5,'Málaga',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (6,'Burgos',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (7,'Córdoba',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (8,'Sevilla',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (9,'San Sebastian',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (10,'Bilbao',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (11,'Cantabria',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (12,'Asturias',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (13,'Pontevedra',NULL,NULL,NULL,NULL);
insert  into `comun__delegacion`(`id`,`nombre`,`descripcion`,`correo`,`telefono`,`whatsapp`) values (14,'Murcia',NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `comun__oficina` */

insert  into `comun__oficina`(`id`,`nombre`,`descripcion`,`direccion`,`horario`,`ubicacion`,`correo`,`telefono`,`whatsapp`,`delegacion_id`) values (1,'PRUEBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo` */

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
  `tipo_tarifa` enum('DAY','MONTH','HOUR') NOT NULL DEFAULT 'DAY',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa` */

insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (1,0,2,'DAY','2020-10-31','2020-12-15',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (2,2,3,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (3,3,4,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (4,4,7,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (5,7,14,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (6,14,22,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (7,22,30,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (8,30,90,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (9,0,2,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (10,2,4,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (11,0,3,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (12,3,6,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`) values (13,6,24,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,460.00,'A',3);

/*Table structure for table `flota__tarifa_historia` */

DROP TABLE IF EXISTS `flota__tarifa_historia`;

CREATE TABLE `flota__tarifa_historia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tarifa_id` int(10) unsigned NOT NULL,
  `desde` tinyint(1) unsigned zerofill DEFAULT NULL,
  `hasta` tinyint(3) unsigned NOT NULL,
  `tipo_tarifa` enum('DAY','MONTH','HOUR') NOT NULL DEFAULT 'DAY',
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa_historia` */

insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (7,2,2,3,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',2,'2020-12-15 05:00:28');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (8,3,3,4,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (9,4,4,7,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (10,5,7,14,'','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (11,6,14,22,'','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',2,'2020-12-15 05:00:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (12,7,22,30,'','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (13,8,30,90,'','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (14,9,0,2,'','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2,'2020-12-15 05:00:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (15,10,2,4,'','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (16,11,0,3,'','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (17,12,3,6,'','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',2,'2020-12-15 05:00:31');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (18,13,6,24,'','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,460.00,'A',2,'2020-12-15 05:00:36');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (19,1,0,21,'','2020-10-31','2020-12-15',300.00,0.21,1.40,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 09:51:29');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (20,1,0,21,'','2020-10-31','2020-12-15',300.00,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:38:12');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (21,1,0,21,'','2020-10-31','2020-12-15',300.00,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:38:27');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (22,1,0,21,'','2020-10-31','2020-12-15',300.15,0.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:55:13');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (23,1,0,21,'','2020-10-31','2020-12-15',300.33,1.40,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:57:20');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (24,1,0,21,'','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 11:57:30');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (25,1,0,21,'','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:27');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (26,1,0,21,'','2020-10-31','2020-12-15',300.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:43');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (27,1,0,21,'','2020-10-31','2020-12-15',3600.33,1.99,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:19:54');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (28,1,0,21,'','2020-10-31','2020-12-15',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',2,'2020-12-15 12:23:39');

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
  `delegacion_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`),
  UNIQUE KEY `bastidor_UNIQUE` (`bastidor`),
  KEY `modelo__id` (`modelo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_ibfk_1` FOREIGN KEY (`modelo_id`) REFERENCES `flota__modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo` */

insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (1,'AB706RD','2020-11-30','xyz321789',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (2,'AI414OG',NULL,'5ED9D2755',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (4,'7A1A6DU',NULL,'5E1E74755',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (6,'0000012',NULL,'925616755',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (7,'0000112',NULL,'036617755',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (8,'00AA2ED',NULL,'39B618755',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (9,'00AA3EV',NULL,'62C619755',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (10,'00AA4ZU',NULL,'7BC610855',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (11,'00AA5HY',NULL,'3BD611855',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (13,'00AB1XL',NULL,'62F613855',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (14,'00AB3XL',NULL,'89F614855',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (15,'00AB4CL',NULL,'F10715855',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (16,'00AB4XL',NULL,'C90716855',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (17,'00AB5WL',NULL,'C01717855',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (18,'00AB9CL',NULL,'3A1718855',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (20,'00AC5UL',NULL,'982710955',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (21,'00AC7XL',NULL,'903711955',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (22,'00ACOUL',NULL,'AD3712955',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (23,'00AD4LL',NULL,'864713955',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (24,'00AD5ML',NULL,'9E4714955',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (25,'00AD8IL',NULL,'175715955',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (26,'01AA4FX',NULL,'01B716955',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (27,'01AA6FX',NULL,'FCB717955',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (28,'01AA9FX',NULL,'86C718955',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (29,'01AB1CL',NULL,'4EC719955',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (30,'01AB3VL',NULL,'75D710065',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (31,'01AB3XL',NULL,'ADD711065',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (33,'01AB7PL',NULL,'F0F713065',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (34,'01AB7WL',NULL,'9CF714065',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (35,'01AB9XL',NULL,'760815065',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (36,'01AC5HL',NULL,'FF0816065',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (37,'01AD7LL',NULL,'8A1817065',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (38,'01AE6LS',NULL,'022818065',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (40,'02AA1FX',NULL,'A88810165',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (41,'02AA3RM',NULL,'829811165',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (42,'02AA7XP',NULL,'2A9812165',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (43,'02AA8FX',NULL,'A2A813165',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (44,'02AA9BB',NULL,'0AA814165',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (45,'02AA9FX',NULL,'D2B815165',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (47,'02AB0AL',NULL,'A2C817165',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (48,'02AB0XL',NULL,'2BC818165',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (49,'02AB3PL',NULL,'94D819165',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (50,'02AB4VT',NULL,'BED810265',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (51,'02AB6PL',NULL,'F0F811265',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (52,'02AB7CL',NULL,'98F812265',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (54,'02AB9WL',NULL,'0A0914265',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (55,'02AC2UL',NULL,'D11915265',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (56,'02AD1EL',NULL,'5D1916265',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (57,'02AD4IL',NULL,'962917265',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (58,'02AD6LL',NULL,'173918265',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (59,'02AH7MV',NULL,'DF3919265',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (60,'03AA2CL',NULL,'61E910365',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (61,'03AA8FX',NULL,'3BE911365',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (63,'03AB3CL',NULL,'6BF913365',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (64,'03AB4RV',NULL,'940A14365',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (65,'03AB6PL',NULL,'931A15365',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (66,'03AB7JL',NULL,'3B1A16365',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (67,'03AB7TL',NULL,'852A17365',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (68,'03AB9PL',NULL,'1D2A18365',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (70,'03AC5UL',NULL,'064A10465',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (71,'03AC6VL',NULL,'FE4A11465',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (72,'03AD3LL',NULL,'B85A12465',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (73,'04A03IL',NULL,'6DBA13465',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (74,'04AA0FX',NULL,'67CA14465',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (75,'04AA0JC',NULL,'38DA15465',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (76,'04AA3FX',NULL,'CFDA16465',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (78,'04AA5ZL',NULL,'9CFA18465',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (79,'04AA7JK',NULL,'360B19465',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (80,'04AA8WL',NULL,'7F0B10565',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (81,'04AB3AD',NULL,'E61B11565',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (82,'04AB3CL',NULL,'882B12565',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (83,'04AB4PL',NULL,'C63B13565',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (85,'04AB5CL',NULL,'6F4B15565',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (86,'04AB5XL',NULL,'295B16565',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (87,'04AB7CL',NULL,'E66B17565',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (88,'04AB87L',NULL,'4F6B18565',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (89,'04AC9VS',NULL,'A87B19565',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (90,'04AD3LL',NULL,'018B10665',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (92,'04AH7JK',NULL,'749B12665',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (93,'05AA6ID',NULL,'1B0C13665',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (94,'05AA6IT',NULL,'971C14665',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (95,'05AA6RL',NULL,'0E2C15665',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (96,'05AA8EL',NULL,'693C16665',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (97,'05AB0GV',NULL,'314C17665',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (99,'05AB5OA',NULL,'B15C19665',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (100,'05AB8HT',NULL,'3A5C10765',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (101,'05AB9CL',NULL,'F96C11765',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (102,'05AC5PL',NULL,'C57C12765',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (103,'05AC6PL',NULL,'CD7C13765',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (104,'05AC9KL',NULL,'278C14765',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (106,'05AD7JL',NULL,'699C16765',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (107,'05AD86I',NULL,'79AC17765',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (108,'05AD8CL',NULL,'A2BC18765',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (109,'05AD8GL',NULL,'8BBC19765',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (110,'05AD8JL',NULL,'16CC10865',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (111,'06AA0FL',NULL,'1C1D11865',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (112,'06AA3EL',NULL,'842D12865',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (114,'06AA6LA',NULL,'FA3D14865',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (115,'06AA6LF',NULL,'724D15865',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (116,'06AA8DK',NULL,'C05D16865',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (117,'06AB1SL',NULL,'095D17865',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (118,'06AB2HT',NULL,'516D18865',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (119,'06AB3CL',NULL,'896D19865',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (121,'06AB5HT',NULL,'838D11965',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (122,'06AB6PT',NULL,'3C8D12965',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (123,'06AB7HT',NULL,'549D13965',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (124,'06AB8HT',NULL,'6F9D14965',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (125,'06ABIEE',NULL,'8BAD15965',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (126,'06ABOHT',NULL,'35BD16965',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (128,'06AC3XL',NULL,'74CD18965',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (129,'06AC4KL',NULL,'80DD19965',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (130,'06AC5NL',NULL,'98DD10075',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (131,'06AC9AL',NULL,'EFDD11075',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (132,'06AD0FL',NULL,'87ED12075',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (133,'06AD0JL',NULL,'86FD13075',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (135,'06AE9BK',NULL,'D60E15075',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (136,'072-LAK',NULL,'F37E16075',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (137,'073A0FE',NULL,'669E17075',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (138,'07AA0CL',NULL,'C7AE18075',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (140,'07AA1AW',NULL,'D0CE10175',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (141,'07AA1EL',NULL,'7DCE11175',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (142,'07AA3SG',NULL,'78DE12175',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (143,'07AA7SE',NULL,'48EE13175',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (144,'07AA7SZ',NULL,'D0FE14175',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (145,'07AA9EL',NULL,'BAFE15175',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (147,'07AB3SL',NULL,'5B0F17175',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (148,'07AB3TL',NULL,'A41F18175',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (149,'07AB4WL',NULL,'302F19175',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (150,'07AB5HT',NULL,'BA2F10275',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (151,'07AB6TL',NULL,'014F11275',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (152,'07AC2KL',NULL,'594F12275',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (154,'07AC7GV',NULL,'5A5F14275',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (155,'07AD8GL',NULL,'C26F15275',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (156,'07AD9GL',NULL,'FB6F16275',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (157,'07AI8XV',NULL,'268F17275',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (158,'08AA1HE',NULL,'002028275',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (159,'08AA3VL',NULL,'782029275',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (160,'08AA5FL',NULL,'973020375',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (161,'08AA6SL',NULL,'004021375',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (163,'08AAIHE',NULL,'965023375',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (164,'08AB0SL',NULL,'1F5024375',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (165,'08AB25L',NULL,'286025375',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (166,'08AB7SL',NULL,'617026375',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (167,'08AB95L',NULL,'C97027375',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (168,'08AB9HT',NULL,'228028375',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (170,'08AC1VL',NULL,'739020475',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (171,'08AC7NL',NULL,'0C9021475',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (172,'08AD8JL',NULL,'F3A022475',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (173,'09AA2EL',NULL,'775123475',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (174,'09AA3FL',NULL,'A26124475',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (175,'09AA7BT',NULL,'AD6125475',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (177,'09AB0HT',NULL,'308127475',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (178,'09AC3AL',NULL,'288128475',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (179,'09AD9GL',NULL,'DF8129475',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (180,'0AG878T',NULL,'1E2220575',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (181,'0AGZ34T',NULL,'244221575',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (182,'0OAB0WL',NULL,'C1A222575',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (183,'10A5B2L',NULL,'D7E223575',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (184,'10A5B3L',NULL,'AFE224575',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (185,'10A6A6L',NULL,'79F225575',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (186,'10A7B0L',NULL,'3F0326575',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (187,'1111111',NULL,'F25327575',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (188,'1234ABC',NULL,'F1F328575',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (190,'12A2A4T',NULL,'C90420675',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (191,'13A535L',NULL,'056421675',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (192,'13A5A2L',NULL,'6C6422675',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (193,'14A9A0L',NULL,'60D423675',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (194,'16A7A4L',NULL,'91C524675',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (195,'16A8A9P',NULL,'0AC525675',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (197,'16ASA2G',NULL,'72F527675',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (199,'17A8A5L',NULL,'8EA629675',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (200,'17A9C1V',NULL,'C4C620775',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (202,'189BC4E',NULL,'C3B722775',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (203,'1C00001',NULL,'03B823775',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (204,'1C00283',NULL,'AAB824775',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (205,'1C00D01',NULL,'53C825775',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (207,'1D561LV',NULL,'A4D827775',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (208,'1OA5B3L',NULL,'0CD828775',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (209,'1OA8A7P',NULL,'C3E829775',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (210,'20A57AL',NULL,'3D3920875',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (211,'20A59AM',NULL,'484921875',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (213,'21A71BM',NULL,'AB2A23875',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (214,'21JVAAZ',NULL,'824A24875',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (216,'22A55AL',NULL,'E4EA26875',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (217,'22A86AL',NULL,'0EEA27875',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (218,'22A89AL',NULL,'A5FA28875',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (219,'22A92AL',NULL,'FEFA29875',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (221,'234G2AL',NULL,'654B21975',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (222,'23A50AL',NULL,'D96B22975',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (223,'23A54AL',NULL,'237B23975',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (224,'23A65AL',NULL,'C38B24975',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (225,'23A82AI',NULL,'FC8B25975',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (226,'23A82AL',NULL,'679B26975',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (228,'25A56AL',NULL,'4BFB28975',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (229,'25A59AL',NULL,'540C29975',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (230,'25A65AL',NULL,'DB0C20085',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (231,'25A69AL',NULL,'F41C21085',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (232,'25A85AL',NULL,'DC1C22085',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (233,'25A98AL',NULL,'582C23085',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (235,'25AO4AL',NULL,'904C25085',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (237,'26A35AV',NULL,'8DDC27085',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (238,'271-LAF',NULL,'9FFC28085',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (239,'2791961',NULL,'183D29085',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (240,'27A22AL',NULL,'804D20185',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (241,'27A42AL',NULL,'5C4D21185',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (242,'27A52AL',NULL,'C55D22185',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (244,'27A68AL',NULL,'5A6D24185',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (245,'27A78AS',NULL,'327D25185',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (246,'27AG3AL',NULL,'997D26185',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (247,'2992470',NULL,'291E27185',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (248,'2OA57AL',NULL,'6FAE28185',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (249,'2OA78AD',NULL,'B6BE29185',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (250,'2ZA91AL',NULL,'FEBE20285',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (251,'300X008',NULL,'C9CE21285',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (252,'335KVAA',NULL,'DF2032285',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (253,'36KKKAV',NULL,'684133285',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (254,'374X1FN',NULL,'FB9134285',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (256,'3C00346',NULL,'14D236285',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (257,'3C00382',NULL,'5DD237285',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (258,'3C00387',NULL,'F4E238285',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (259,'3C00602',NULL,'DCE239285',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (261,'3COO602',NULL,'3CF231385',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (262,'3PO12O9',NULL,'222332385',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (263,'400A5AV',NULL,'0A2333385',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (264,'404A5AT',NULL,'AA3334385',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (265,'408A1AO',NULL,'FE4335385',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (266,'409DB9G',NULL,'975336385',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (267,'4118A8Z',NULL,'3C9337385',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (268,'411A8AL',NULL,'F4A338385',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (269,'415CB9M',NULL,'1BD339385',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (270,'416A4AO',NULL,'5DE330485',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (271,'418A7AP',NULL,'F5F331485',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (272,'420A1AL',NULL,'872432485',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (273,'421A5AL',NULL,'014433485',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (274,'422A0AL',NULL,'594434485',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (275,'422A1AL',NULL,'595435485',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (277,'422A3AL',NULL,'2D6437485',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (278,'422A4AL',NULL,'057438485',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (279,'423A2AS',NULL,'D48439485',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (280,'433A4AL',NULL,'702530585',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (281,'43BBBAC',NULL,'D94531585',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (282,'43NVLAC',NULL,'0A6532585',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (283,'441-S4G',NULL,'D49533585',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (285,'442A3AL',NULL,'5FA535585',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (286,'449A74L',NULL,'FEE536585',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (287,'449AZAL',NULL,'96F537585',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (288,'4500EFI',NULL,'528638585',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (290,'456A2AW',NULL,'9CC630685',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (291,'45YAG4P',NULL,'57F631685',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (292,'464-LAB',NULL,'420732685',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (293,'46420PK',NULL,'ED0733685',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (294,'469A3AA',NULL,'491734685',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (295,'477BK1A',NULL,'F79735685',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (298,'495DR7K',NULL,'9D0938685',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (299,'497A3AL',NULL,'0A1939685',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (300,'497A9AL',NULL,'772930785',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (301,'497EI8M',NULL,'443931785',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (302,'4ACA9VS',NULL,'0D7932785',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (303,'4D8G06D',NULL,'7F9933785',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (305,'4F5F20V',NULL,'F0C935785',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (306,'4G209BG',NULL,'ECC936785',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (307,'4H9T48D',NULL,'09D937785',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (308,'4L1A5AL',NULL,'86E938785',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (309,'4O4A5AT',NULL,'72F939785',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (310,'5000514',NULL,'100A30885',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (312,'500AA5V',NULL,'2C1A32885',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (313,'504AA6L',NULL,'355A33885',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (314,'515AA4E',NULL,'0A2B34885',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (315,'521AA6L',NULL,'C9AB35885',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (316,'523AA6L',NULL,'C6BB36885',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (317,'534AA9E',NULL,'C05C37885',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (318,'54OAB2S',NULL,'171D38885',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (319,'553AA1L',NULL,'4F7D39885',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (320,'553AA4L',NULL,'AC8D30985',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (321,'554AA0L',NULL,'789D31985',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (322,'5555555',NULL,'20BD32985',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (324,'557AA5L',NULL,'99CD34985',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (325,'559AA74',NULL,'512E35985',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (326,'559AA7A',NULL,'FD2E36985',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (328,'561AA3L',NULL,'DB8E38985',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (329,'561AA7P',NULL,'C79E39985',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (331,'565AA4P',NULL,'21BE31095',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (332,'567AA45',NULL,'99CE32095',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (333,'567AAOP',NULL,'25DE33095',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (334,'569-XIA',NULL,'A1EE34095',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (335,'570AA8M',NULL,'B4AF35095',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (336,'572AA5L',NULL,'C1BF36095',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (337,'575AA05',NULL,'E9CF37095',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (339,'576AA4L',NULL,'42EF39095',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (340,'576AA6L',NULL,'7EEF30195',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (341,'595AA4L',NULL,'7C0141195',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (342,'596AA4L',NULL,'DE2142195',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (344,'597AA5L',NULL,'874144195',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (345,'598AA4L',NULL,'7A6145195',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (346,'5A7A1DL',NULL,'0FC146195',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (347,'5AE04WZ',NULL,'9F0247195',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (348,'5O3AA7L',NULL,'0B9248195',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (349,'5O8AA9S',NULL,'E6A249195',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (350,'60AA8DX',NULL,'6BE240295',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (351,'6247DKJ',NULL,'461441295',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (352,'665J61F',NULL,'B4D542295',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (354,'6A7A6WK',NULL,'E81844295',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (355,'6C0D53U',NULL,'EC3845295',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (356,'6O35A9L',NULL,'828846295',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (357,'6UA7273',NULL,'819847295',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (358,'6UA7801',NULL,'7D9848295',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (359,'6VECESA',NULL,'C5B849295',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (361,'741A0EM',NULL,'C01B41395',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (362,'743420U',NULL,'853B42395',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (363,'743DOWS',NULL,'414B43395',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (365,'745AOIV',NULL,'E66B45395',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (366,'745DAIS',NULL,'E37B46395',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (367,'74645AL',NULL,'DB8B47395',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (368,'747B4FK',NULL,'0A9B48395',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (369,'747B8MP',NULL,'F5AB49395',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (371,'748A0WL',NULL,'0FBB41495',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (372,'748A5BI',NULL,'8ACB42495',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (373,'749A9KV',NULL,'63EB43495',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (374,'7A0A0GO',NULL,'A0CE44495',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (375,'7A0A0KK',NULL,'C9CE45495',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (377,'7A0A0MV',NULL,'1DDE47495',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (378,'7A0A1HA',NULL,'D6EE48495',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (379,'7A0A1IP',NULL,'A2FE49495',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (380,'7A0A1NU',NULL,'9CFE40595',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (381,'7A0A1SM',NULL,'940F41595',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (382,'7A0A1WK',NULL,'291F42595',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (384,'7A0A260',NULL,'693F44595',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (385,'7A0A2AW',NULL,'C44F45595',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (386,'7A0A2CA',NULL,'3E4F46595',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (387,'7A0A2OO',NULL,'8C5F47595',5,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (388,'7A0A2UO',NULL,'146F48595',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (389,'7A0A2UU',NULL,'677F49595',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (391,'7A0A3EU',NULL,'D39F41695',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (392,'7A0A3GN',NULL,'8B9F42695',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (393,'7A0A3JO',NULL,'24AF43695',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (394,'7A0A3MO',NULL,'1DAF44695',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (395,'7A0A3UE',NULL,'E9BF45695',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (396,'7A0A4AA',NULL,'16CF46695',7,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (398,'7A0A4ME',NULL,'A0EF48695',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (399,'7A0A4T0',NULL,'77FF49695',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (400,'7A0A4TT',NULL,'C40050795',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (401,'7A0A5CL',NULL,'7E0051795',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (402,'7A0A5HT',NULL,'761052795',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (403,'7A0A5IP',NULL,'9F1053795',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (405,'7A0A5UO',NULL,'963055795',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (406,'7A0A6AX',NULL,'E04056795',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (407,'7A0A6IB',NULL,'2C4057795',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (408,'7A0A6IP',NULL,'085058795',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (409,'7A0A6JB',NULL,'C36059795',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (410,'7A0A6KT',NULL,'8F6050895',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (412,'7A0A700',NULL,'889052895',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (413,'7A0A7DX',NULL,'25A053895',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (414,'7A0A7EM',NULL,'A4B054895',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (415,'7A0A7FG',NULL,'95C055895',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (416,'7A0A7GO',NULL,'A0D056895',6,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (417,'7A0A7NB',NULL,'B8D057895',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (419,'7A0A8AA',NULL,'9AE059895',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (420,'7A0A8CF',NULL,'15F050995',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (421,'7A0A8DV',NULL,'ACF051995',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (422,'7A0A8DX',NULL,'740152995',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (423,'7A0A8EU',NULL,'EB0153995',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (424,'7A0A8FL',NULL,'741154995',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (426,'7A0A8IO',NULL,'472156995',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (427,'7A0A90W',NULL,'FF2157995',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (428,'7A0A97O',NULL,'CA3158995',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (429,'7A0A9AM',NULL,'554159995',5,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (430,'7A0A9BI',NULL,'FF4150006',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (431,'7A0A9CF',NULL,'695151006',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (433,'7A0A9ED',NULL,'557153006',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (434,'7A0A9EU',NULL,'D58154006',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (435,'7A0A9FU',NULL,'429155006',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (436,'7A0A9JH',NULL,'CD9156006',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (437,'7A0A9KK',NULL,'60B157006',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (438,'7A0A9OW',NULL,'FAB158006',7,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (440,'7A0A9RU',NULL,'74D150106',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (441,'7A0A9T0',NULL,'AFD151106',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (442,'7A0AGAN',NULL,'E8E152106',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (443,'7A0B1FD',NULL,'A1F153106',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (444,'7A0B1LV',NULL,'8AF154106',6,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (445,'7A0B1RV',NULL,'BD0255106',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (447,'7A0B2GK',NULL,'313257106',2,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (448,'7A0B2MV',NULL,'264258106',3,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (449,'7A0B45V',NULL,'BC5259106',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (450,'7A0B4DV',NULL,'C86250206',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (451,'7A0B4F0',NULL,'C67251206',6,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (452,'7A0B4RV',NULL,'B18252206',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (454,'7A0B5LV',NULL,'C89254206',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (455,'7A0B5PK',NULL,'BAA255206',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (456,'7A0B5RV',NULL,'A5B256206',4,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (457,'7A0B8ZV',NULL,'30D257206',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (458,'7A0B9C0',NULL,'1BD258206',7,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (460,'7A0B9RV',NULL,'AEE250306',2,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (461,'7A0C3PS',NULL,'38F251306',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (462,'7A0C4US',NULL,'440352306',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (463,'7A0C4XA',NULL,'4D0353306',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (464,'7A0C5JV',NULL,'A71354306',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (465,'7A0C5LV',NULL,'B22355306',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (467,'7A0C8PA',NULL,'FA3357306',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (468,'7A0CANV',NULL,'534358306',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (469,'7A0D0DA',NULL,'685359306',5,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (470,'7A0D1DA',NULL,'4A6350406',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (471,'7A0D5DA',NULL,'F97351406',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (473,'7A0D7NB',NULL,'6F8353406',2,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (474,'7A0D8NA',NULL,'9B9354406',3,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (475,'7A0D9DA',NULL,'87A355406',4,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (476,'7A0E0BS',NULL,'31B356406',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (477,'7A1A0DA',NULL,'95C357406',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (478,'7A1A0FA',NULL,'13D358406',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (480,'7A1A0OV',NULL,'51F350506',2,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (481,'7A1A0SU',NULL,'B70451506',3,5);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (482,'7A1A1AA',NULL,'B31452506',4,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (483,'7A1A1AT',NULL,'0E1453506',5,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (484,'7A1A1EN',NULL,'EA2454506',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (485,'7A1A1I0',NULL,'204455506',7,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (487,'7A1A2BV',NULL,'6B6457506',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (488,'7A1A2CL',NULL,'518458506',3,1);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (489,'7A1A2FU',NULL,'A69459506',4,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (490,'7A1A2KU',NULL,'DAA450606',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (491,'7A1A2NG',NULL,'41C451606',6,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (492,'7A1A2SU',NULL,'8AC452606',7,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (494,'7A1A3DY',NULL,'42E454606',2,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (495,'7A1A3HK',NULL,'B6F455606',3,4);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (496,'7A1A3RD',NULL,'940556606',4,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (497,'7A1A40V',NULL,'021557606',5,2);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (498,'7A1A45U',NULL,'2D1558606',6,3);
insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`modelo_id`,`delegacion_id`) values (499,'7A1A4AA',NULL,'B92559606',7,3);

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
insert  into `flota__vehiculo_caracteristicas`(`id`,`color`,`anio`,`transmision`,`plazas`,`puertas`,`extra`) values (16,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_caracteristicas`(`id`,`color`,`anio`,`transmision`,`plazas`,`puertas`,`extra`) values (45,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_caracteristicas`(`id`,`color`,`anio`,`transmision`,`plazas`,`puertas`,`extra`) values (241,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `flota__vehiculo_estado` */

DROP TABLE IF EXISTS `flota__vehiculo_estado`;

CREATE TABLE `flota__vehiculo_estado` (
  `id` mediumint(8) unsigned NOT NULL,
  `orden_id` int(10) unsigned DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVA','CONTRATO','OCUPADO','NODISPONIBLE') NOT NULL DEFAULT 'DISPONIBLE',
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden_id` (`orden_id`),
  CONSTRAINT `flota__vehiculo_estado_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_estado_ibfk_2` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_estado` */

insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (1,61,'2020-12-01','2020-12-26','OCUPADO','2020-12-18 02:59:18');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (2,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (4,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (6,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (7,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (8,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (9,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (10,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (11,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (13,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (14,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (15,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (16,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (17,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (18,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (20,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (21,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (22,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (23,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (24,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (25,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (26,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (27,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (28,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (29,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (30,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (31,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (33,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (34,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (35,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (36,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (37,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (38,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (40,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (41,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (42,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (43,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (44,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (45,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (47,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (48,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (49,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (50,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (51,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (52,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (54,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (55,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (56,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (57,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (58,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (59,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (60,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (61,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (63,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (64,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (65,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (66,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (67,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (68,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (70,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (71,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (72,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (73,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (74,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (75,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (76,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (78,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (79,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (80,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (81,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (82,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (83,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (85,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (86,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (87,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (88,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (89,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (90,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (92,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (93,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (94,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (95,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (96,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (97,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (99,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (100,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (101,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (102,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (103,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (104,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (106,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (107,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (108,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (109,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (110,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (111,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (112,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (114,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (115,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (116,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (117,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (118,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (119,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (121,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (122,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (123,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (124,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (125,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (126,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (128,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (129,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (130,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (131,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (132,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (133,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (135,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (136,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (137,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (138,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (140,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (141,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (142,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (143,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (144,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (145,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (147,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (148,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (149,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (150,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (151,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (152,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (154,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (155,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (156,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (157,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (158,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (159,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (160,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (161,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (163,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (164,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (165,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (166,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (167,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (168,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (170,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (171,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (172,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (173,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (174,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (175,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (177,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (178,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (179,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (180,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (181,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (182,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (183,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (184,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (185,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (186,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (187,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (188,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (190,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (191,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (192,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (193,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (194,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (195,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (197,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (199,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (200,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (202,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (203,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (204,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (205,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (207,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (208,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (209,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (210,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (211,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (213,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (214,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (216,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (217,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (218,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (219,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (221,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (222,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (223,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (224,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (225,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (226,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (228,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (229,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (230,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (231,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (232,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (233,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (235,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (237,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (238,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (239,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (240,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (241,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (242,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (244,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (245,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (246,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (247,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (248,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (249,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (250,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (251,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (252,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (253,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (254,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (256,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (257,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (258,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (259,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (261,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (262,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (263,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (264,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (265,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (266,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (267,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (268,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (269,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (270,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (271,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (272,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (273,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (274,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (275,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (277,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (278,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (279,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (280,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (281,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (282,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (283,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (285,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (286,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (287,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (288,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (290,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (291,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (292,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (293,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (294,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (295,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (298,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (299,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (300,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (301,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (302,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (303,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (305,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (306,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (307,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (308,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (309,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (310,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (312,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (313,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (314,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (315,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (316,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (317,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (318,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (319,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (320,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (321,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (322,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (324,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (325,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (326,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (328,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (329,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (331,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (332,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (333,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (334,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (335,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (336,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (337,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (339,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (340,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (341,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (342,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (344,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (345,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (346,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (347,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (348,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (349,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (350,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (351,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (352,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (354,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (355,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (356,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (357,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (358,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (359,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (361,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (362,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (363,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (365,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (366,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (367,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (368,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (369,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (371,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (372,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (373,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (374,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (375,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (377,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (378,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (379,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (380,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (381,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (382,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (384,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (385,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (386,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (387,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (388,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (389,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (391,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (392,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (393,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (394,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (395,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (396,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (398,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (399,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (400,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (401,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (402,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (403,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (405,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (406,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (407,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (408,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (409,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (410,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (412,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (413,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (414,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (415,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (416,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (417,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (419,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (420,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (421,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (422,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (423,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (424,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (426,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (427,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (428,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (429,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (430,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (431,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (433,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (434,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (435,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (436,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (437,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (438,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (440,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (441,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (442,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (443,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (444,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (445,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (447,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (448,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (449,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (450,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (451,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (452,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (454,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (455,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (456,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (457,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (458,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (460,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (461,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (462,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (463,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (464,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (465,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (467,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (468,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (469,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (470,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (471,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (473,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (474,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (475,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (476,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (477,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (478,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (480,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (481,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (482,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (483,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (484,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (485,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (487,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (488,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (489,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (490,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (491,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (492,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (494,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (495,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (496,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (497,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (498,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');
insert  into `flota__vehiculo_estado`(`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`,`estado`,`fecha_transaccion`) values (499,NULL,NULL,NULL,'DISPONIBLE','2020-12-18 02:33:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=952 DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_historia` */

insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (10,1,4,'CONTRATADO','2020-12-14 21:09:01',1,11,'2020-12-14',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (11,1,12,'CONTRATADO','2020-12-15 12:57:31',1,11,'2020-12-15',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (12,45,1,'CONTRATADO','2020-12-17 19:12:30',11,11,'2020-12-17',NULL,'AAAAAAA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (13,45,3,'CONTRATADO','2020-12-17 19:19:53',11,11,'2020-12-17',NULL,'AAAAAAA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (14,1,3,'CONTRATADO','2020-12-17 19:20:07',1,11,'2020-12-17',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (15,16,11,'ENTREGADO','2020-12-17 19:38:09',50,70,'2020-12-17',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (16,1,3,'CONTRATADO','2020-12-17 19:39:20',1,11,'2020-12-17',NULL,'2');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (17,1,5,'CONTRATADO','2020-12-17 20:27:02',1,11,'2020-12-17',NULL,'2');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (18,241,10,'RECIBIDO','2020-12-17 20:33:49',50,50,'2020-12-17',NULL,'AAAAAAA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (19,1,5,'CONTRATADO','2020-12-18 00:29:13',1,11,'2020-12-18',NULL,'2');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (20,1,5,'CONTRATADO','2020-12-18 00:29:20',1,11,'2020-12-18',NULL,'2');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (21,1,3,'RECIBIDO','2020-12-18 00:33:14',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (22,1,3,'DISPONIBLE','2020-12-18 00:33:23',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (23,1,3,'','2020-12-18 00:35:12',NULL,NULL,'2020-12-18',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (24,1,3,'RENOVADO','2020-12-18 00:35:17',NULL,NULL,'2020-12-18',NULL,'PRUEBA');
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (25,2,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (26,7,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (27,9,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (28,11,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (29,13,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (30,14,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (31,20,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (32,28,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (33,31,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (34,33,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (35,45,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (36,59,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (38,70,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (39,85,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (41,94,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (42,95,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (43,103,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (44,110,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (45,114,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (46,119,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (47,121,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (48,137,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (49,142,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (50,144,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (52,149,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (53,151,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (54,152,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (56,154,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (57,159,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (58,164,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (59,165,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (60,166,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (61,167,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (62,172,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (63,180,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (64,181,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (65,187,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (66,188,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (67,192,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (69,211,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (70,218,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (72,226,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (73,229,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (75,235,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (76,242,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (77,246,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (78,250,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (79,254,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (81,259,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (82,262,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (83,263,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (84,264,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (86,277,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (87,285,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (88,287,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (89,291,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (90,314,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (91,320,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (92,322,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (93,326,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (94,328,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (95,329,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (97,346,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (98,350,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (99,352,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (100,362,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (103,385,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (104,388,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (105,395,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (106,406,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (107,412,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (108,416,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (110,422,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (111,424,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (112,426,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (113,443,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (114,445,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (115,454,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (116,455,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (117,460,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (118,465,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (119,468,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (120,469,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (121,471,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (122,475,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (123,478,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (124,485,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (125,488,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (126,10,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (127,17,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (128,18,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (129,24,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (130,25,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (131,27,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (132,44,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (133,52,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (134,54,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (135,72,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (136,75,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (137,97,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (139,99,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (140,100,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (141,102,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (142,109,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (144,133,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (145,135,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (146,136,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (148,143,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (149,145,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (150,155,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (151,156,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (152,168,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (153,171,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (154,174,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (155,179,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (156,186,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (157,195,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (158,209,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (160,217,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (161,219,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (162,237,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (164,244,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (165,248,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (166,251,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (168,269,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (169,271,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (170,280,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (171,283,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (172,292,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (175,317,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (176,318,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (177,321,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (181,332,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (182,333,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (183,341,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (184,348,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (185,354,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (186,355,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (187,358,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (188,366,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (189,371,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (190,373,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (191,374,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (192,375,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (194,391,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (195,393,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (196,401,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (197,402,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (198,403,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (199,409,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (201,427,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (202,428,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (203,433,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (204,437,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (205,440,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (206,450,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (209,461,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (210,462,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (212,474,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (213,476,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (214,480,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (215,484,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (217,490,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (218,491,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (219,492,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (221,496,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (222,497,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (223,1,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (225,16,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (226,23,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (227,29,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (228,37,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (229,42,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (230,43,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (231,50,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (233,65,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (234,66,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (235,67,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (236,71,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (237,73,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (238,80,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (239,82,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (240,83,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (242,86,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (243,87,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (244,89,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (246,107,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (247,124,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (249,128,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (250,130,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (251,131,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (252,140,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (253,147,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (254,160,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (257,194,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (259,200,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (261,202,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (262,207,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (263,208,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (264,210,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (265,216,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (266,221,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (267,224,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (269,232,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (270,233,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (272,239,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (273,241,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (274,245,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (275,256,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (276,257,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (277,265,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (278,270,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (279,273,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (280,282,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (281,286,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (282,288,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (283,293,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (284,295,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (285,298,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (286,301,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (287,305,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (288,307,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (289,308,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (290,310,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (291,313,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (292,315,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (293,334,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (294,336,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (295,345,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (298,367,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (299,372,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (300,377,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (301,379,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (302,381,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (303,382,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (304,387,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (305,392,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (306,396,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (308,400,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (311,413,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (312,419,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (313,421,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (314,430,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (316,435,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (318,442,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (319,448,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (320,457,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (321,464,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (322,467,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (323,470,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (324,477,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (326,482,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (327,487,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (328,494,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (329,498,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (330,499,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (333,15,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (334,30,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (336,34,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (337,35,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (338,36,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (339,38,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (341,49,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (342,55,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (343,56,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (344,60,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (345,61,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (346,63,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (347,64,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (349,90,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (350,92,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (351,106,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (352,108,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (353,111,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (354,116,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (355,118,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (356,132,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (357,138,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (358,141,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (359,150,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (360,157,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (361,158,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (363,170,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (364,175,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (365,197,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (367,199,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (368,203,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (369,204,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (370,205,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (371,213,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (373,223,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (374,228,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (375,238,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (376,240,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (377,249,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (378,253,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (379,258,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (380,272,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (381,279,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (382,281,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (384,290,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (385,299,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (386,300,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (387,309,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (389,312,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (390,319,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (391,324,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (392,325,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (393,335,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (394,337,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (395,339,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (396,342,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (398,344,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (399,347,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (401,365,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (402,368,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (403,369,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (404,378,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (405,380,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (406,386,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (407,407,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (408,410,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (409,415,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (410,423,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (411,431,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (412,436,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (413,438,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (414,447,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (415,451,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (416,463,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (417,483,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (418,489,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (419,495,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (420,4,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (421,6,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (422,8,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (424,21,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (425,22,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (426,26,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (428,40,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (429,41,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (430,47,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (431,48,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (432,51,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (433,57,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (434,58,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (435,68,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (436,74,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (437,76,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (439,78,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (440,79,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (441,81,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (442,88,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (443,93,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (444,96,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (445,101,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (446,104,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (447,112,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (448,115,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (449,117,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (451,122,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (452,123,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (453,125,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (454,126,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (455,129,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (457,148,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (458,161,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (459,163,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (460,173,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (461,177,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (462,178,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (463,182,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (464,183,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (465,184,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (466,185,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (468,190,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (469,191,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (470,193,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (471,214,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (472,222,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (473,225,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (474,230,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (475,231,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (476,247,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (477,252,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (478,261,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (479,266,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (480,267,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (481,268,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (482,274,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (483,275,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (484,278,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (486,294,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (488,302,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (489,303,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (490,306,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (491,316,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (492,331,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (493,340,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (494,349,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (495,351,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (496,356,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (497,357,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (498,359,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (499,361,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (500,363,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (502,384,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (503,389,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (504,394,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (505,398,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (506,399,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (507,405,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (508,408,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (509,414,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (510,417,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (511,420,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (512,429,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (513,434,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (514,441,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (515,444,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (517,449,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (518,452,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (519,456,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (520,458,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (522,473,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (523,481,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (524,1,1,'DISPONIBLE','2020-12-18 01:36:59',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (525,1,3,'DISPONIBLE','2020-12-18 01:37:05',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (526,1,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (527,2,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (528,4,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (529,6,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (530,7,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (531,8,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (532,9,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (533,10,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (534,11,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (535,13,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (536,14,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (537,15,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (538,16,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (539,17,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (540,18,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (541,20,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (542,21,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (543,22,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (544,23,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (545,24,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (546,25,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (547,26,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (548,27,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (549,28,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (550,29,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (551,30,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (552,31,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (553,33,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (554,34,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (555,35,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (556,36,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (557,37,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (558,38,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (559,40,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (560,41,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (561,42,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (562,43,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (563,44,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (564,45,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (565,47,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (566,48,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (567,49,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (568,50,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (569,51,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (570,52,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (571,54,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (572,55,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (573,56,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (574,57,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (575,58,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (576,59,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (577,60,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (578,61,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (579,63,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (580,64,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (581,65,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (582,66,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (583,67,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (584,68,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (585,70,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (586,71,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (587,72,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (588,73,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (589,74,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (590,75,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (591,76,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (592,78,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (593,79,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (594,80,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (595,81,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (596,82,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (597,83,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (598,85,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (599,86,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (600,87,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (601,88,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (602,89,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (603,90,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (604,92,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (605,93,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (606,94,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (607,95,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (608,96,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (609,97,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (610,99,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (611,100,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (612,101,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (613,102,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (614,103,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (615,104,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (616,106,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (617,107,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (618,108,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (619,109,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (620,110,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (621,111,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (622,112,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (623,114,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (624,115,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (625,116,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (626,117,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (627,118,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (628,119,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (629,121,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (630,122,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (631,123,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (632,124,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (633,125,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (634,126,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (635,128,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (636,129,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (637,130,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (638,131,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (639,132,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (640,133,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (641,135,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (642,136,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (643,137,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (644,138,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (645,140,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (646,141,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (647,142,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (648,143,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (649,144,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (650,145,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (651,147,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (652,148,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (653,149,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (654,150,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (655,151,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (656,152,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (657,154,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (658,155,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (659,156,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (660,157,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (661,158,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (662,159,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (663,160,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (664,161,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (665,163,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (666,164,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (667,165,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (668,166,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (669,167,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (670,168,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (671,170,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (672,171,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (673,172,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (674,173,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (675,174,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (676,175,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (677,177,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (678,178,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (679,179,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (680,180,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (681,181,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (682,182,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (683,183,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (684,184,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (685,185,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (686,186,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (687,187,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (688,188,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (689,190,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (690,191,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (691,192,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (692,193,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (693,194,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (694,195,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (695,197,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (696,199,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (697,200,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (698,202,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (699,203,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (700,204,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (701,205,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (702,207,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (703,208,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (704,209,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (705,210,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (706,211,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (707,213,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (708,214,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (709,216,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (710,217,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (711,218,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (712,219,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (713,221,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (714,222,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (715,223,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (716,224,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (717,225,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (718,226,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (719,228,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (720,229,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (721,230,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (722,231,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (723,232,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (724,233,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (725,235,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (726,237,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (727,238,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (728,239,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (729,240,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (730,241,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (731,242,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (732,244,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (733,245,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (734,246,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (735,247,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (736,248,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (737,249,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (738,250,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (739,251,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (740,252,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (741,253,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (742,254,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (743,256,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (744,257,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (745,258,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (746,259,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (747,261,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (748,262,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (749,263,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (750,264,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (751,265,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (752,266,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (753,267,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (754,268,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (755,269,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (756,270,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (757,271,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (758,272,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (759,273,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (760,274,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (761,275,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (762,277,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (763,278,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (764,279,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (765,280,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (766,281,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (767,282,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (768,283,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (769,285,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (770,286,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (771,287,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (772,288,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (773,290,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (774,291,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (775,292,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (776,293,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (777,294,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (778,295,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (779,298,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (780,299,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (781,300,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (782,301,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (783,302,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (784,303,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (785,305,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (786,306,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (787,307,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (788,308,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (789,309,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (790,310,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (791,312,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (792,313,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (793,314,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (794,315,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (795,316,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (796,317,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (797,318,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (798,319,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (799,320,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (800,321,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (801,322,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (802,324,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (803,325,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (804,326,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (805,328,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (806,329,1,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (807,331,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (808,332,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (809,333,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (810,334,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (811,335,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (812,336,3,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (813,337,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (814,339,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (815,340,5,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (816,341,2,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (817,342,4,'DISPONIBLE','2020-12-18 01:52:16',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (818,344,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (819,345,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (820,346,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (821,347,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (822,348,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (823,349,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (824,350,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (825,351,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (826,352,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (827,354,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (828,355,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (829,356,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (830,357,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (831,358,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (832,359,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (833,361,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (834,362,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (835,363,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (836,365,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (837,366,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (838,367,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (839,368,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (840,369,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (841,371,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (842,372,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (843,373,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (844,374,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (845,375,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (846,377,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (847,378,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (848,379,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (849,380,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (850,381,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (851,382,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (852,384,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (853,385,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (854,386,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (855,387,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (856,388,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (857,389,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (858,391,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (859,392,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (860,393,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (861,394,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (862,395,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (863,396,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (864,398,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (865,399,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (866,400,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (867,401,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (868,402,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (869,403,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (870,405,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (871,406,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (872,407,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (873,408,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (874,409,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (875,410,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (876,412,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (877,413,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (878,414,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (879,415,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (880,416,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (881,417,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (882,419,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (883,420,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (884,421,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (885,422,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (886,423,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (887,424,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (888,426,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (889,427,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (890,428,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (891,429,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (892,430,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (893,431,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (894,433,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (895,434,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (896,435,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (897,436,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (898,437,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (899,438,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (900,440,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (901,441,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (902,442,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (903,443,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (904,444,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (905,445,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (906,447,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (907,448,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (908,449,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (909,450,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (910,451,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (911,452,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (912,454,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (913,455,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (914,456,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (915,457,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (916,458,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (917,460,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (918,461,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (919,462,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (920,463,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (921,464,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (922,465,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (923,467,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (924,468,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (925,469,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (926,470,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (927,471,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (928,473,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (929,474,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (930,475,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (931,476,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (932,477,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (933,478,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (934,480,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (935,481,5,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (936,482,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (937,483,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (938,484,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (939,485,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (940,487,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (941,488,1,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (942,489,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (943,490,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (944,491,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (945,492,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (946,494,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (947,495,4,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (948,496,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (949,497,2,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (950,498,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);
insert  into `flota__vehiculo_historia`(`id`,`vehiculo_id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`,`fecha`,`contrato_numero`,`descripcion`) values (951,499,3,'DISPONIBLE','2020-12-18 01:52:17',NULL,NULL,'2020-12-18',NULL,NULL);

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
insert  into `flota__vehiculo_observacion`(`id`,`observacion`) values (16,NULL);
insert  into `flota__vehiculo_observacion`(`id`,`observacion`) values (45,NULL);
insert  into `flota__vehiculo_observacion`(`id`,`observacion`) values (241,NULL);

/*Table structure for table `flota__vehiculo_situacion` */

DROP TABLE IF EXISTS `flota__vehiculo_situacion`;

CREATE TABLE `flota__vehiculo_situacion` (
  `id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA','ENTREGADO','RECIBIDO','RENOVADO') NOT NULL DEFAULT 'DISPONIBLE',
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` text DEFAULT NULL,
  `emplazamiento` text DEFAULT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) unsigned DEFAULT NULL,
  `codigo_llave` varchar(10) DEFAULT NULL,
  `codigo_radio` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_situacion_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_situacion_ibfk_3` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_situacion` */

insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (1,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (2,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (4,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (6,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (7,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (8,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (9,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (10,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (11,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (13,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (14,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (15,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (16,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (17,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (18,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (20,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (21,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (22,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (23,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (24,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (25,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (26,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (27,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (28,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (29,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (30,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (31,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (33,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (34,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (35,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (36,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (37,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (38,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (40,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (41,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (42,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (43,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (44,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (45,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (47,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (48,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (49,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (50,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (51,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (52,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (54,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (55,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (56,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (57,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (58,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (59,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (60,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (61,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (63,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (64,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (65,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (66,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (67,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (68,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (70,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (71,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (72,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (73,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (74,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (75,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (76,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (78,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (79,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (80,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (81,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (82,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (83,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (85,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (86,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (87,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (88,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (89,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (90,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (92,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (93,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (94,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (95,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (96,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (97,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (99,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (100,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (101,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (102,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (103,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (104,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (106,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (107,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (108,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (109,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (110,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (111,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (112,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (114,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (115,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (116,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (117,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (118,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (119,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (121,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (122,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (123,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (124,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (125,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (126,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (128,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (129,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (130,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (131,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (132,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (133,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (135,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (136,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (137,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (138,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (140,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (141,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (142,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (143,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (144,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (145,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (147,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (148,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (149,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (150,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (151,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (152,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (154,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (155,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (156,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (157,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (158,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (159,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (160,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (161,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (163,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (164,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (165,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (166,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (167,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (168,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (170,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (171,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (172,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (173,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (174,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (175,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (177,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (178,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (179,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (180,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (181,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (182,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (183,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (184,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (185,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (186,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (187,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (188,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (190,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (191,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (192,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (193,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (194,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (195,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (197,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (199,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (200,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (202,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (203,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (204,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (205,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (207,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (208,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (209,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (210,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (211,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (213,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (214,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (216,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (217,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (218,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (219,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (221,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (222,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (223,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (224,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (225,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (226,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (228,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (229,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (230,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (231,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (232,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (233,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (235,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (237,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (238,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (239,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (240,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (241,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (242,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (244,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (245,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (246,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (247,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (248,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (249,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (250,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (251,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (252,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (253,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (254,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (256,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (257,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (258,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (259,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (261,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (262,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (263,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (264,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (265,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (266,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (267,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (268,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (269,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (270,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (271,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (272,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (273,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (274,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (275,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (277,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (278,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (279,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (280,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (281,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (282,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (283,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (285,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (286,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (287,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (288,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (290,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (291,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (292,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (293,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (294,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (295,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (298,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (299,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (300,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (301,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (302,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (303,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (305,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (306,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (307,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (308,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (309,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (310,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (312,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (313,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (314,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (315,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (316,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (317,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (318,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (319,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (320,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (321,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (322,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (324,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (325,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (326,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (328,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (329,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (331,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (332,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (333,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (334,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (335,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (336,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (337,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (339,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (340,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (341,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (342,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (344,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (345,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (346,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (347,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (348,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (349,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (350,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (351,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (352,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (354,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (355,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (356,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (357,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (358,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (359,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (361,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (362,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (363,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (365,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (366,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (367,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (368,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (369,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (371,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (372,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (373,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (374,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (375,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (377,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (378,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (379,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (380,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (381,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (382,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (384,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (385,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (386,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (387,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (388,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (389,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (391,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (392,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (393,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (394,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (395,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (396,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (398,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (399,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (400,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (401,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (402,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (403,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (405,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (406,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (407,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (408,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (409,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (410,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (412,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (413,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (414,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (415,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (416,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (417,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (419,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (420,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (421,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (422,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (423,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (424,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (426,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (427,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (428,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (429,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (430,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (431,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (433,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (434,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (435,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (436,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (437,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (438,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (440,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (441,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (442,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (443,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (444,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (445,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (447,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (448,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (449,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (450,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (451,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (452,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (454,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (455,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (456,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (457,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (458,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (460,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (461,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (462,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (463,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (464,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (465,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (467,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (468,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (469,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (470,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (471,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (473,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (474,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (475,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (476,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (477,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (478,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (480,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (481,5,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (482,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (483,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (484,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (485,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (487,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (488,1,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (489,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (490,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (491,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (492,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (494,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (495,4,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (496,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (497,2,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (498,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `flota__vehiculo_situacion`(`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`descripcion`,`emplazamiento`,`km`,`combustible`,`codigo_llave`,`codigo_radio`) values (499,3,'DISPONIBLE','2020-12-18 01:35:40',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `operacion__orden` */

DROP TABLE IF EXISTS `operacion__orden`;

CREATE TABLE `operacion__orden` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `tipo_contrato` enum('CP','LP') NOT NULL,
  `tipo_id` char(3) NOT NULL,
  `tipo_tarifa` enum('DAY','MONTH','HOUR') NOT NULL DEFAULT 'DAY',
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

insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (61,1,'MARIA PEÑA','CP','A','','PRESUPUESTO','EN VIGOR','01CP/2020-00001',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (79,1,'ANA VERA','LP','A+','','PRESUPUESTO','EN VIGOR','01LP/2020-00002',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (80,1,'MARIA PEÑA','CP','A','','RESERVA','EN VIGOR','01CP/2020-00003',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (81,1,'MARIA PEÑA','CP','A','','CONTRATO','EN VIGOR','01CP/2020-00004',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (82,1,'ANA VERA','LP','A+','','RESERVA','EN VIGOR','01LP/2020-00005',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (83,1,'ANA VERA','LP','A+','','CONTRATO','EN VIGOR','01LP/2020-00006',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (84,1,'ANA VERA','LP','A+','','EXTENSION','EN VIGOR','01LP/2020-00007',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (85,1,'ANA VERA','LP','A+','','RESERVA','EN VIGOR','01LP/2020-00008',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (86,3,'PEDRO PEREZ','LP','A','','PRESUPUESTO','EN VIGOR','03LP/2020-00001',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (87,3,'PEDRO PEREZ','LP','A','','PRESUPUESTO','EN VIGOR','03LP/2020-00002',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (88,3,'PEDRO PEREZ','LP','A','','RESERVA','EN VIGOR','03LP/2020-00003',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (89,3,'PEDRO PEREZ','LP','A','','RESERVA','EN VIGOR','03LP/2020-00004',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (90,3,'PEDRO PEREZ','LP','A','','CONTRATO','EN VIGOR','03LP/2020-00005',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (91,1,'ANA VERA','LP','A+','','EXTENSION','EN VIGOR','01LP/2020-00009',NULL);

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
  `vehiculo_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  CONSTRAINT `operacion__orden_detalles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_detalles_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_detalles` */

insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (61,'2020-12-01',NULL,'\0','2020-12-26',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (79,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL,2);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (80,'2020-12-12',NULL,'\0','2020-12-26',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (81,'2020-12-12',NULL,'\0','2020-12-26',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (82,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL,8);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (83,'2020-12-25',NULL,'\0','2020-12-25',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (87,'2020-12-18',NULL,'\0','2020-12-12',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (88,'2020-12-18',NULL,'\0','2020-12-12',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (89,'2020-12-25',NULL,'\0','2021-02-06',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (90,'2020-12-25',NULL,'\0','2021-01-01',NULL,'\0',NULL,1);

/*Table structure for table `operacion__orden_entrega` */

DROP TABLE IF EXISTS `operacion__orden_entrega`;

CREATE TABLE `operacion__orden_entrega` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `km` smallint(6) unsigned NOT NULL,
  `combustible` tinyint(3) unsigned NOT NULL,
  `detalle` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_entrega_ibfk_2` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_entrega` */

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
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (90,NULL);

/*Table structure for table `operacion__orden_recogida` */

DROP TABLE IF EXISTS `operacion__orden_recogida`;

CREATE TABLE `operacion__orden_recogida` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `km` smallint(6) unsigned NOT NULL,
  `combustible` tinyint(3) unsigned NOT NULL,
  `detalle` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_recogida_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_recogida` */

/*Table structure for table `operacion__orden_tarifa` */

DROP TABLE IF EXISTS `operacion__orden_tarifa`;

CREATE TABLE `operacion__orden_tarifa` (
  `id` int(10) unsigned NOT NULL,
  `tarifa_id` int(10) unsigned DEFAULT NULL,
  `periodo` tinyint(3) unsigned DEFAULT NULL,
  `fraccion` tinyint(3) unsigned DEFAULT NULL,
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `operacion__orden_tarifa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_tarifa_ibfk_2` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa_historia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_tarifa` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(60) NOT NULL,
  `auth_key` char(60) DEFAULT NULL,
  `access_token` char(60) DEFAULT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`auth_key`,`access_token`,`delegacion_id`) values (1,'admin','$2y$10$X9J2IRMgCn3VT9q..v76numeJk5FKPOxHnwbJynXgQ/1zClZPxTY.',NULL,NULL,3);

/* Trigger structure for table `flota__vehiculo_estado` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__vehiculo_estado_before_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__vehiculo_estado_before_update` BEFORE UPDATE ON `flota__vehiculo_estado` FOR EACH ROW BEGIN
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
	UPDATE `flota__vehiculo` SET `delegacion_id`=NEW.delegacion_id LIMIT 1;
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

/* Trigger structure for table `operacion__orden_detalles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_detalles_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_detalles_after_insert` AFTER INSERT ON `operacion__orden_detalles` FOR EACH ROW BEGIN
DECLARE $periodo INT DEFAULT NULL;
DECLARE $fraccion VARCHAR(0) DEFAULT NULL;
  
SELECT `delegacion_id`,`tipo_id`,`tipo_tarifa`,`momento`,`orden_id`
INTO @delegacion, @tipo, @tarifa, @momento, @orden
FROM `operacion__orden`
WHERE id=NEW.id LIMIT 1;
IF @momento IN ("RESERVA","CONTRATO") THEN
  
  CASE @tarifa 
  WHEN "HOUR" THEN
	SET $periodo = HOUR(TIMEDIFF(NEW.fecha_recogida, NEW.fecha_entrega));
  WHEN "MONTH" THEN
	SET $periodo = PERIOD_DIFF(DATE_FORMAT(NEW.fecha_recogida, '%Y%m'), DATE_FORMAT(NEW.fecha_entrega, '%Y%m'));
	SET $fraccion = DAY(NEW.fecha_recogida) - DAY(NEW.fecha_entrega);
  ELSE
	SET $periodo = DATEDIFF(NEW.fecha_recogida, NEW.fecha_entrega);
	SET $fraccion = HOUR(TIMEDIFF(NEW.fecha_recogida, NEW.fecha_entrega));
  END CASE;
  
  IF $fraccion < 0 THEN
	SET $fraccion = 0;
  END IF;
  
loop_one:LOOP
	INSERT INTO `operacion__orden_tarifa` 
	SELECT NEW.id, id, hasta - desde, $fraccion
	FROM `flota__tarifa`
	WHERE `delegacion_id`=@delegacion AND `tipo_id`=@tipo AND `tipo_tarifa`=@tarifa
	AND `fecha_inicio` >= NEW.fecha_entrega  AND `fecha_fin` <= NEW.fecha_recogida AND hasta <= $periodo
	ORDER BY hasta DESC 
	LIMIT 1;
	
	SET $periodo = $period - $diff;
	
	IF $periodo > 0 THEN
		SET $fraccion = 0;
		ITERATE loop_one ;
	END IF ;
	LEAVE loop_one ;
END LOOP loop_one ;
END IF;
IF NOT ISNULL(NEW.vehiculo_id) THEN
	REPLACE INTO `flota__vehiculo_estado` 
	SELECT (NEW.vehiculo_id, NEW.id, NEW.fecha_entrega, NEW.fecha_recogida, @momento);
END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_detalles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_detalles_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_detalles_after_update` AFTER UPDATE ON `operacion__orden_detalles` FOR EACH ROW BEGIN
IF NOT ISNULL(NEW.vehiculo_id) THEN
REPLACE INTO `flota__vehiculo_estado` (`id`,`orden_id`,`fecha_entrega`,`fecha_recogida`)
VALUES (NEW.vehiculo_id, NEW.id, NEW.fecha_entrega, NEW.fecha_recogida);
END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_entrega` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_entrega_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_entrega_after_insert` AFTER INSERT ON `operacion__orden_entrega` FOR EACH ROW BEGIN
REPLACE INTO `flota__vehiculo_estado` (id, orden_id,estado)
SELECT vehiculo_id, id, "OCUPADO"
FROM `flota__vehiculo_detalles`
WHERE id=NEW.id LIMIT 1;
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_recogida` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_recogida_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_recogida_after_insert` AFTER INSERT ON `operacion__orden_recogida` FOR EACH ROW BEGIN
REPLACE INTO `flota__vehiculo_estado` (id, estado)
SELECT vehiculo_id, "DISPONIBLE"
FROM `flota__vehiculo_detalles`
WHERE id=NEW.id LIMIT 1;
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

/* Procedure structure for procedure `flota__obtener_tarifa` */

/*!50003 DROP PROCEDURE IF EXISTS  `flota__obtener_tarifa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `flota__obtener_tarifa`(
  $delegacion INT,
  $tipo VARCHAR (5),
  $tarifa VARCHAR (5),
  $fecha_entrega DATE,
  $fecha_recogida DATE,
  $hora_entrega TIME,
  $hora_recogida TIME
)
    DETERMINISTIC
BEGIN
  DECLARE $periodo INT DEFAULT NULL;
  DECLARE $fraccion VARCHAR(0) DEFAULT NULL;
  CASE $tarifa 
  WHEN "HOUR" THEN
	SET $periodo = HOUR(TIMEDIFF($fecha_recogida, $fecha_entrega));
  WHEN "MONTH" THEN
	SET $periodo = PERIOD_DIFF(DATE_FORMAT($fecha_recogida, '%Y%m'), DATE_FORMAT($fecha_entrega, '%Y%m'));
	SET $fraccion = DAY($fecha_recogida) - DAY($fecha_entrega);
  ELSE
	SET $periodo = DATEDIFF($fecha_recogida, $fecha_entrega);
	SET $fraccion = HOUR(TIMEDIFF($fecha_recogida, $fecha_entrega));
  END CASE;
  
  iF $fraccion < 0 THEN
	SET $fraccion = 0;
  END IF;
  
loop_one:LOOP
	SELECT ABS(hasta - desde) INTO @diff
	FROM `flota__tarifa`
	WHERE `delegacion_id`= $delegacion AND `tipo_id`=$tipo AND `tipo_tarifa`=$tarifa
	AND `fecha_inicio` >= $fecha_entrega  AND `fecha_fin` <= $fecha_recogida AND hasta <= $periodo
	ORDER BY hasta DESC 
	LIMIT 1;
	
	SET $periodo = $period - $diff;
	
	IF $periodo > 0 THEN
		ITERATE loop_one ;
	END IF ;
	LEAVE loop_one ;
END LOOP loop_one ;
  
	
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
 `tipo_tarifa` enum('DAY','MONTH','HOUR') ,
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
 `tipo_tarifa` enum('DAY','MONTH','HOUR') ,
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
 `tipo_tarifa` enum('DAY','MONTH','HOUR') ,
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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__contrato_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`estado`.`fecha_entrega` AS `fecha_entrega`,`estado`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`matricula` AS `matricula` from (((`operacion__orden` `t` left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) left join `flota__vehiculo_estado` `estado` on(`estado`.`orden_id` = `t`.`id`)) left join `flota__vehiculo` `vehiculo` on(`vehiculo`.`id` = `estado`.`id`)) where `t`.`momento` = 'CONTRATO') */;

/*View structure for view operacion__presupuesto_search */

/*!50001 DROP TABLE IF EXISTS `operacion__presupuesto_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__presupuesto_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__presupuesto_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida` from ((`operacion__orden` `t` left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) where `t`.`momento` = 'PRESUPUESTO') */;

/*View structure for view operacion__reserva_search */

/*!50001 DROP TABLE IF EXISTS `operacion__reserva_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__reserva_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__reserva_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`estado`.`fecha_entrega` AS `fecha_entrega`,`estado`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`matricula` AS `matricula` from (((`operacion__orden` `t` left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) left join `flota__vehiculo_estado` `estado` on(`estado`.`orden_id` = `t`.`id`)) left join `flota__vehiculo` `vehiculo` on(`vehiculo`.`id` = `estado`.`id`)) where `t`.`momento` = 'RESERVA') */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
