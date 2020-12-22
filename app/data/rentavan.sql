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

insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (2,'GRAND VITARA',NULL,2,'A');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (3,'COROLLA','',3,'A');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (4,'BLAZER 4X2',NULL,4,'A+');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (5,'SIENA TAXI FIRE',NULL,5,'A+');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (6,'TERIOS COOL SIN',NULL,6,'B');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (7,'ELANTRA 2.0L GL',NULL,7,'B');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (15,'CORSA','',4,'C');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (16,'CORSA','',4,'C');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (17,'CORSA','',4,'A');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (18,'CORSA','',4,'A+');
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`,`tipo_id`) values (19,'CORSA','',4,'A-C');

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
  `tarifa_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `flota__tarifa_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_ibfk_3` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa_historia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa` */

insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (1,0,2,'DAY','2020-10-31','2020-12-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,107);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (2,2,3,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,108);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (3,3,4,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,109);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (4,4,7,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,110);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (5,7,14,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,111);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (6,14,22,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,112);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (7,22,30,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,113);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (8,30,90,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,114);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (9,0,2,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,115);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (10,2,4,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,116);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (11,0,3,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,117);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (12,3,6,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,118);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (659,7,14,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,119);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (660,2,4,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,120);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (661,0,2,'DAY','2021-01-01','2021-03-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,121);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (662,14,22,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,122);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (663,0,3,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,123);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (664,2,3,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,124);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (665,22,30,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,125);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (666,3,6,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,126);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (667,3,4,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,127);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (668,30,90,'DAY','2021-01-01','2021-03-31',300.00,0.21,4.00,1.00,24.00,24.00,NULL,'A',3,143);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (669,4,7,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,129);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (670,0,2,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,130);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (674,2,4,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,131);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (675,0,2,'DAY','2020-08-02','2020-10-30',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,132);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (676,14,22,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,133);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (677,0,3,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,134);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (678,2,3,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,135);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (679,22,30,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,136);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (680,3,6,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,137);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (681,3,4,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,138);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (682,30,90,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,139);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (683,4,7,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,140);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (684,0,2,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,141);
insert  into `flota__tarifa`(`id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`tarifa_id`) values (685,7,14,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,142);

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
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tarifa_id` (`tarifa_id`),
  KEY `delegacion_id` (`delegacion_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `flota__tarifa_historia_ibfk_1` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_historia_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__tarifa_historia_ibfk_3` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `flota__tarifa_historia` */

insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (71,1,0,2,'DAY','2020-10-31','2020-12-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:43:05');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (72,2,2,3,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (73,3,3,4,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (74,4,4,7,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (75,5,7,14,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (76,6,14,22,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (77,7,22,30,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (78,8,30,90,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (79,9,0,2,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (80,10,2,4,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (81,11,0,3,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (82,12,3,6,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (83,659,7,14,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (84,660,2,4,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (85,661,0,2,'DAY','2021-01-01','2021-03-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (86,662,14,22,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (87,663,0,3,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (88,664,2,3,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (89,665,22,30,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (90,666,3,6,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (91,667,3,4,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (92,668,30,90,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (93,669,4,7,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (94,670,0,2,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (95,674,2,4,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (96,675,0,2,'DAY','2020-08-02','2020-10-30',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (97,676,14,22,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (98,677,0,3,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (99,678,2,3,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (100,679,22,30,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (101,680,3,6,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (102,681,3,4,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (103,682,30,90,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (104,683,4,7,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (105,684,0,2,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (106,685,7,14,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:43:06');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (107,1,0,2,'DAY','2020-10-31','2020-12-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (108,2,2,3,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (109,3,3,4,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (110,4,4,7,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (111,5,7,14,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (112,6,14,22,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (113,7,22,30,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (114,8,30,90,'DAY','2020-10-31','2020-12-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (115,9,0,2,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (116,10,2,4,'HOUR','2020-10-31','2020-12-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (117,11,0,3,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (118,12,3,6,'MONTH','2020-10-31','2020-12-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (119,659,7,14,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (120,660,2,4,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (121,661,0,2,'DAY','2021-01-01','2021-03-31',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (122,662,14,22,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (123,663,0,3,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (124,664,2,3,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (125,665,22,30,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (126,666,3,6,'MONTH','2021-01-01','2021-03-31',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (127,667,3,4,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (128,668,30,90,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (129,669,4,7,'DAY','2021-01-01','2021-03-31',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (130,670,0,2,'HOUR','2021-01-01','2021-03-31',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (131,674,2,4,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (132,675,0,2,'DAY','2020-08-02','2020-10-30',3.60,1.00,1.00,1.00,49.00,49.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (133,676,14,22,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,30.00,30.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (134,677,0,3,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,500.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (135,678,2,3,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,48.00,48.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (136,679,22,30,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,26.00,26.00,NULL,'A',2,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (137,680,3,6,'MONTH','2020-08-02','2020-10-30',3500.00,0.21,1.40,NULL,NULL,NULL,485.00,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (138,681,3,4,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,47.00,47.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (139,682,30,90,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,24.00,24.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (140,683,4,7,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,36.00,36.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (141,684,0,2,'HOUR','2020-08-02','2020-10-30',0.00,0.21,1.40,NULL,NULL,NULL,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (142,685,7,14,'DAY','2020-08-02','2020-10-30',300.00,0.21,1.40,1.00,32.00,32.00,NULL,'A',3,'2020-12-20 21:47:53');
insert  into `flota__tarifa_historia`(`id`,`tarifa_id`,`desde`,`hasta`,`tipo_tarifa`,`fecha_inicio`,`fecha_fin`,`km`,`eur_km`,`eur_lt`,`hora`,`eur_hora`,`eur_dia`,`eur_mes`,`tipo_id`,`delegacion_id`,`fecha_transaccion`) values (143,668,30,90,'DAY','2021-01-01','2021-03-31',300.00,0.21,4.00,1.00,24.00,24.00,NULL,'A',3,'2020-12-21 19:06:55');

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

/*Table structure for table `flota__vehiculo_historia` */

DROP TABLE IF EXISTS `flota__vehiculo_historia`;

CREATE TABLE `flota__vehiculo_historia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehiculo_id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVA','CONTRATO','ENTREGADO','AVERIADO','MANTENIMIENTO','BAJA') NOT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) DEFAULT NULL,
  `orden_codigo` char(16) DEFAULT NULL,
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_flota__vehiculo_movimiento_operacion__document1_idx` (`orden_codigo`),
  KEY `fk_flota__vehiculo_movimiento_flota__vehiculo1_idx` (`vehiculo_id`),
  KEY `delegacion_id` (`delegacion_id`),
  CONSTRAINT `flota__vehiculo_historia_ibfk_1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_historia_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flota__vehiculo_historia_ibfk_3` FOREIGN KEY (`orden_codigo`) REFERENCES `operacion__orden` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_historia` */

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

/*Table structure for table `flota__vehiculo_situacion` */

DROP TABLE IF EXISTS `flota__vehiculo_situacion`;

CREATE TABLE `flota__vehiculo_situacion` (
  `id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  `estado` enum('DISPONIBLE','RESERVA','CONTRATO','ENTREGADO','AVERIADO','MANTENIMIENTO','BAJA') NOT NULL DEFAULT 'DISPONIBLE',
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden` */

insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (131,3,'PEDRO PEREZ','CP','A','DAY','PRESUPUESTO','EN VIGOR','03CP/2020-00001',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (132,3,'PEDRO PEREZ','CP','A','MONTH','PRESUPUESTO','EN VIGOR','03CP/2020-00002',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (133,3,'PEDRO PEREZ','CP','A','HOUR','PRESUPUESTO','EN VIGOR','03CP/2020-00003',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (134,3,'PEDRO PEREZ','CP','A','DAY','RESERVA','EN VIGOR','03CP/2020-00004',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (135,3,'PEDRO PEREZ','CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00005',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (136,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00006',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (138,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00007',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (139,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00008',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (141,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00010',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (142,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00011',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (143,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00012',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (144,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00013',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (145,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00014',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (146,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00015',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (147,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00016',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (148,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00017',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (149,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00018',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (152,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00150',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (153,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00153',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (154,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00154',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (155,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00155',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (158,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00022',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (159,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00023',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (160,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00024',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (161,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00025',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (162,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00026',NULL);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (163,3,'PEDRO PEREZ','CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00027',134);
insert  into `operacion__orden`(`id`,`delegacion_id`,`cliente`,`tipo_contrato`,`tipo_id`,`tipo_tarifa`,`momento`,`estado`,`codigo`,`orden_id`) values (164,3,NULL,'CP','A','DAY','CONTRATO','EN VIGOR','03CP/2020-00028',NULL);

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

insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (131,'2020-10-10','15:30:00','\0','2021-03-10','18:40:00','\0',NULL,NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (132,'2020-10-10','15:30:00','\0','2021-03-10','18:40:00','\0',NULL,NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (133,'2020-10-10','15:30:00','\0','2021-03-10','18:40:00','\0',NULL,NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (134,'2020-10-10','15:30:00','\0','2021-03-10','18:40:00','\0',NULL,NULL);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (135,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,16);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (141,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (142,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (144,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (145,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (153,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (162,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (163,'2020-10-10',NULL,'\0','2021-03-10',NULL,'\0',NULL,1);
insert  into `operacion__orden_detalles`(`id`,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`) values (164,'2021-01-01',NULL,'\0','2021-01-07',NULL,'\0',NULL,37);

/*Table structure for table `operacion__orden_entrega` */

DROP TABLE IF EXISTS `operacion__orden_entrega`;

CREATE TABLE `operacion__orden_entrega` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) unsigned DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_entrega_ibfk_2` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_entrega` */

insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (135,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (141,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (142,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (144,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (145,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (153,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (162,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (163,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_entrega`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (164,NULL,NULL,NULL,NULL,NULL);

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
  CONSTRAINT `operacion__orden_historia_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_2` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_3` FOREIGN KEY (`vehiculo_matricula`) REFERENCES `flota__vehiculo` (`matricula`) ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_4` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_historia_ibfk_5` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa` (`id`) ON UPDATE CASCADE
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

insert  into `operacion__orden_observacion`(`id`,`observacion`) values (131,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (132,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (133,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (135,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (141,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (142,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (144,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (145,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (153,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (162,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (163,NULL);
insert  into `operacion__orden_observacion`(`id`,`observacion`) values (164,NULL);

/*Table structure for table `operacion__orden_recogida` */

DROP TABLE IF EXISTS `operacion__orden_recogida`;

CREATE TABLE `operacion__orden_recogida` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `km` smallint(6) unsigned DEFAULT NULL,
  `combustible` tinyint(3) unsigned DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `operacion__orden_recogida_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_recogida` */

insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (135,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (141,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (142,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (144,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (145,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (153,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (162,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (163,NULL,NULL,NULL,NULL,NULL);
insert  into `operacion__orden_recogida`(`id`,`fecha`,`hora`,`km`,`combustible`,`descripcion`) values (164,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `operacion__orden_tarifa` */

DROP TABLE IF EXISTS `operacion__orden_tarifa`;

CREATE TABLE `operacion__orden_tarifa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orden_id` int(10) unsigned NOT NULL,
  `tarifa_id` int(10) unsigned NOT NULL,
  `periodo` tinyint(3) unsigned DEFAULT NULL,
  `fraccion` tinyint(3) unsigned DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `fecha_transaccion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orden_id` (`orden_id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `operacion__orden_tarifa_ibfk_2` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_tarifa_ibfk_3` FOREIGN KEY (`tarifa_id`) REFERENCES `flota__tarifa_historia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_tarifa` */

insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (205,131,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:03:43');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (206,131,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:03:43');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (207,131,128,68,4,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:03:43');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (208,132,134,1,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:04:24');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (209,132,117,2,0,'2020-10-31','2020-12-31','2020-11-10','2020-12-31','2020-12-21 19:04:24');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (210,132,123,2,1,'2021-01-01','2021-03-31','2021-01-10','2021-03-10','2020-12-21 19:04:24');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (211,133,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:04:53');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (212,133,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:04:53');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (213,133,128,68,0,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:04:53');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (214,133,131,4,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:04:53');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (215,134,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:05:33');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (216,134,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:05:33');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (217,134,128,68,4,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:05:33');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (221,153,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:28:02');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (222,153,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:28:02');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (223,153,143,68,0,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:28:02');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (224,162,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:35:55');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (225,162,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:35:55');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (226,162,143,68,0,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:35:55');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (230,163,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:38:48');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (231,163,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:38:48');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (232,163,143,68,0,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:38:48');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (236,135,133,21,0,'2020-08-02','2020-10-30','2020-10-10','2020-10-30','2020-12-21 19:58:00');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (237,135,114,62,0,'2020-10-31','2020-12-31','2020-10-31','2020-12-31','2020-12-21 19:58:00');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (238,135,143,68,0,'2021-01-01','2021-03-31','2021-01-01','2021-03-10','2020-12-21 19:58:00');
insert  into `operacion__orden_tarifa`(`id`,`orden_id`,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`,`fecha_transaccion`) values (239,164,129,6,0,'2021-01-01','2021-03-31','2021-01-01','2021-01-07','2020-12-21 20:26:04');

/*Table structure for table `operacion__orden_vehiculo` */

DROP TABLE IF EXISTS `operacion__orden_vehiculo`;

CREATE TABLE `operacion__orden_vehiculo` (
  `id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `vehiculo_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`,`fecha`),
  UNIQUE KEY `vehiculo_id` (`vehiculo_id`,`fecha`),
  CONSTRAINT `operacion__orden_vehiculo_ibfk_1` FOREIGN KEY (`id`) REFERENCES `operacion__orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `operacion__orden_vehiculo_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_vehiculo` */

insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-11',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-12',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-13',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-14',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-15',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-16',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-17',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-18',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-19',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-20',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-21',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-22',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-23',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-24',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-25',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-26',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-27',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-28',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-29',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-30',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-10-31',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-01',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-02',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-03',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-04',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-05',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-06',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-07',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-08',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-09',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-11',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-12',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-13',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-14',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-15',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-16',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-17',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-18',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-19',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-20',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-21',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-22',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-23',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-24',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-25',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-26',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-27',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-28',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-29',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-11-30',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-01',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-02',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-03',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-04',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-05',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-06',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-07',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-08',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-09',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-11',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-12',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-13',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-14',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-15',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-16',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-17',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-18',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-19',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-20',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-21',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-22',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-23',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-24',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-25',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-26',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-27',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-28',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-29',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-30',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2020-12-31',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-01',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-02',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-03',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-04',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-05',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-06',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-07',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-08',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-09',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-11',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-12',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-13',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-14',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-15',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-16',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-17',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-18',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-19',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-20',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-21',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-22',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-23',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-24',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-25',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-26',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-27',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-28',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-29',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-30',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-01-31',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-01',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-02',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-03',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-04',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-05',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-06',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-07',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-08',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-09',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-11',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-12',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-13',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-14',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-15',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-16',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-17',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-18',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-19',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-20',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-21',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-22',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-23',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-24',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-25',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-26',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-27',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-02-28',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-01',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-02',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-03',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-04',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-05',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-06',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-07',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-08',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-09',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (163,'2021-03-10',1);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-11',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-12',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-13',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-14',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-15',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-16',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-17',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-18',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-19',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-20',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-21',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-22',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-23',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-24',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-25',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-26',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-27',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-28',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-29',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-30',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-10-31',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-01',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-02',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-03',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-04',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-05',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-06',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-07',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-08',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-09',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-11',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-12',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-13',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-14',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-15',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-16',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-17',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-18',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-19',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-20',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-21',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-22',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-23',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-24',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-25',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-26',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-27',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-28',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-29',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-11-30',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-01',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-02',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-03',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-04',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-05',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-06',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-07',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-08',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-09',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-11',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-12',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-13',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-14',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-15',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-16',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-17',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-18',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-19',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-20',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-21',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-22',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-23',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-24',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-25',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-26',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-27',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-28',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-29',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-30',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2020-12-31',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-01',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-02',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-03',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-04',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-05',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-06',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-07',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-08',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-09',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-11',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-12',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-13',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-14',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-15',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-16',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-17',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-18',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-19',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-20',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-21',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-22',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-23',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-24',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-25',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-26',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-27',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-28',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-29',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-30',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-01-31',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-01',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-02',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-03',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-04',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-05',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-06',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-07',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-08',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-09',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-11',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-12',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-13',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-14',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-15',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-16',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-17',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-18',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-19',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-20',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-21',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-22',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-23',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-24',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-25',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-26',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-27',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-02-28',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-01',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-02',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-03',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-04',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-05',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-06',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-07',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-08',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-09',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (135,'2021-03-10',16);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-01',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-02',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-03',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-04',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-05',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-06',37);
insert  into `operacion__orden_vehiculo`(`id`,`fecha`,`vehiculo_id`) values (164,'2021-01-07',37);

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

/* Trigger structure for table `flota__tarifa` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__tarifa_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__tarifa_after_insert` AFTER INSERT ON `flota__tarifa` FOR EACH ROW BEGIN
  INSERT INTO `flota__tarifa_historia` 
  VALUES
    (
      NULL,
      NEW.id,
      NEW.desde,
      NEW.hasta,
      NEW.tipo_tarifa,
      NEW.fecha_inicio,
      NEW.fecha_fin,
      NEW.km,
      NEW.eur_km,
      NEW.eur_lt,
      NEW.hora,
      NEW.eur_hora,
      NEW.eur_dia,
      NEW.eur_mes,
      NEW.tipo_id,
      NEW.delegacion_id,
      NOW()
    );
END */$$


DELIMITER ;

/* Trigger structure for table `flota__tarifa` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__tarifa_before_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__tarifa_before_update` BEFORE UPDATE ON `flota__tarifa` FOR EACH ROW BEGIN
    INSERT INTO `flota__tarifa_historia` 
	VALUES (
      NULL,
      NEW.id,
      NEW.desde,
      NEW.hasta,
      NEW.tipo_tarifa,
      NEW.fecha_inicio,
      NEW.fecha_fin,
      NEW.km,
      NEW.eur_km,
      NEW.eur_lt,
      NEW.hora,
      NEW.eur_hora,
      NEW.eur_dia,
      NEW.eur_mes,
      NEW.tipo_id,
      NEW.delegacion_id,
      NOW()
    );
    SET NEW.tarifa_id=LAST_INSERT_ID();
END */$$


DELIMITER ;

/* Trigger structure for table `flota__vehiculo_historia` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__vehiculo_historia_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__vehiculo_historia_after_insert` AFTER INSERT ON `flota__vehiculo_historia` FOR EACH ROW BEGIN
IF NOT ISNULL(NEW.orden_codigo) AND NOT ISNULL(NEW.km)THEN
	REPLACE INTO `flota__vehiculo_situacion` (`id`,`delegacion_id`,`estado`,`fecha_transaccion`,`km`,`combustible`)
	VALUES (NEW.vehiculo_id,NEW.delegacion_id,NEW.estado,NEW.fecha_transaccion,NEW.km,NEW.combustible);
END IF;    
    
    END */$$


DELIMITER ;

/* Trigger structure for table `flota__vehiculo_situacion` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `flota__vehiculo_situacion_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `flota__vehiculo_situacion_after_insert` AFTER INSERT ON `flota__vehiculo_situacion` FOR EACH ROW BEGIN
  INSERT INTO `flota__vehiculo_historia`
  VALUES
    (
      NULL,
      NEW.id,
      NEW.delegacion_id,
      NEW.estado,
      NEW.km,
      NEW.combustible
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
IF NOT ISNULL(NEW.orden_id) THEN
	INSERT INTO `operacion__orden_detalles`
	SELECT NEW.id,`fecha_entrega`,`hora_entrega`,`entrega_directa`,`fecha_recogida`,`hora_recogida`,`recogida_directa`,`comisionista`,`vehiculo_id`
	FROM operacion__orden_detalles
	WHERE `id`=NEW.orden_id
	LIMIT 1;
END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_after_update` AFTER UPDATE ON `operacion__orden` FOR EACH ROW BEGIN
IF NEW.estado NOT IN ("ANULADO", "FINALIZADO") THEN 
	CALl vincular_vehiculo(NEW.id,NULL,NULL,NULL);
ELSEIF NEW.delegacion_id!=OLD.delegacion_id OR NEW.tipo_id!=OLD.tipo_id OR NEW.tipo_tarifa!=OLD.tipo_tarifa THEN
	SELECT `fecha_entrega`,`fecha_recogida`,`fecha_recogida`,`hora_recogida` 
	INTO @fecha_entrega,@fecha_recogida,@fecha_recogida,@hora_recogida
	FROM `operacion__orden_detalles`
	WHERE id=NEW.id
	LIMIT 1;
	IF NOT ISNULL(@fecha_entrega) THEN
		CALL `obtener_tarifas`(NEW.id,NEW.delegacion_id,NEW.tipo_id,NEW.tipo_tarifa,@fecha_entrega,@fecha_recogida,@hora_entrega,@hora_recogida);
	END IF;
END IF; 
   
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_detalles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_detalles_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_detalles_after_insert` AFTER INSERT ON `operacion__orden_detalles` FOR EACH ROW BEGIN
SELECT delegacion_id, tipo_id, tipo_tarifa, momento, orden_id
INTO @delegacion, @tipo, @tarifa, @momento, @orden
FROM `operacion__orden` t
WHERE t.id=NEW.id
LIMIT 1;
IF ISNULL(@orden) THEN
	CALL `obtener_tarifas`(NEW.id,@delegacion,@tipo,@tarifa,NEW.fecha_entrega,NEW.fecha_recogida,NEW.hora_entrega,NEW.hora_recogida);
ELSE
	INSERT INTO `operacion__orden_tarifa`
	SELECT NULL, NEW.id,`tarifa_id`,`periodo`,`fraccion`,`fecha_inicio`,`fecha_fin`,`fecha_entrega`,`fecha_recogida`, NOW()
	FROM `operacion__orden_tarifa`
	WHERE `orden_id`=@orden;
END IF;
CALL vincular_vehiculo(NEW.id,NEW.vehiculo_id,NEW.fecha_entrega,NEW.fecha_recogida);
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_detalles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_detalles_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_detalles_after_update` AFTER UPDATE ON `operacion__orden_detalles` FOR EACH ROW BEGIN
SELECT delegacion_id, tipo_id, tipo_tarifa, momento
INTO @delegacion, @tipo, @tarifa, @momento
FROM `operacion__orden` t
WHERE t.id=NEW.id
LIMIT 1;    
IF NEW.fecha_entrega!=OLD.fecha_entrega OR NEW.fecha_recogida!=OLD.fecha_entrega OR NEW.hora_recogida!=OLD.hora_recogida OR NEW.hora_entrega!=OLD.hora_entrega THEN
	CALL `obtener_tarifas`(NEW.id,@delegacion,@tipo,@tarifa,NEW.fecha_entrega,NEW.fecha_recogida,NEW.hora_entrega,NEW.hora_recogida);
END IF;
CALL vincular_vehiculo(NEW.id,NEW.vehiculo_id,NEW.fecha_entrega,NEW.fecha_recogida);
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_recogida` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_recogida_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_recogida_after_insert` AFTER INSERT ON `operacion__orden_recogida` FOR EACH ROW BEGIN
IF NOT ISNULL(NEW.fecha) THEN
	SELECT t.`vehiculo_id`, orden.`delegacion_id`,orden.momento, orden.`codigo`
	INTO @vehiculo,@delegacion,@momento,@codigo
	FROM `operacion__orden_detalles` t
	LEFT JOIN `operacion__orden` orden ON orden.id=t.id
	WHERE t.id=NEW.id
	LIMIT 1;
	IF NOT ISNULL(@vehiculo) AND @momento IN ("CONTRATO") THEN
		INSERT INTO `flota__vehiculo_historia` VALUES
		(NULL,@vehiculo,@delegacion,"DISPONIBLE",NEW.km,NEW.combustible,@codigo);
	END IF;
END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `operacion__orden_recogida` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `operacion__orden_recogida_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `operacion__orden_recogida_after_update` AFTER UPDATE ON `operacion__orden_recogida` FOR EACH ROW BEGIN
IF NOT ISNULL(NEW.fecha) THEN
	SELECT t.`vehiculo_id`, orden.`delegacion_id`,orden.momento, orden.`codigo`
	INTO @vehiculo,@delegacion,@momento,@codigo
	FROM `operacion__orden_detalles` t
	LEFT JOIN `operacion__orden` orden ON orden.id=t.id
	WHERE t.id=NEW.id
	LIMIT 1;
	IF NOT ISNULL(@vehiculo) AND @momento IN ("CONTRATO") THEN
		INSERT INTO `flota__vehiculo_historia` VALUES
		(NULL,@vehiculo,@delegacion,"DISPONIBLE",NEW.km,NEW.combustible,@codigo);
	END IF;
END IF;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `disponibilidad_vehiculos` */

/*!50003 DROP PROCEDURE IF EXISTS  `disponibilidad_vehiculos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `disponibilidad_vehiculos`(
  delegacion INT,
  fecha_entrega DATE,
  fecha_recogida DATE
)
BEGIN
  IF ISNULL(fecha_entrega) 
  THEN SET fecha_entrega = DATE(NOW()) ;
  END IF ;
  IF ISNULL(fecha_recogida) 
  THEN SET fecha_recogida = DATE(NOW()) ;
  END IF ;
  WHILE
    fecha_recogida >= fecha_entrega DO 
    SELECT 
      t.id,
      t.matricula,
      fecha_entrega,
      orden.momento,
      orden.codigo,
      orden.id
    FROM
      `flota__vehiculo` t 
    LEFT JOIN operacion__orden_vehiculo vehiculo ON vehiculo.vehiculo_id = t.id AND vehiculo.fecha = fecha_entrega 
    LEFT JOIN operacion__orden orden ON orden.id = vehiculo.id 
    WHERE t.delegacion_id = delegacion ;
    SET fecha_entrega = DATE_ADD(fecha_entrega, INTERVAL 1 DAY) ;
  END WHILE ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `obtener_tarifas` */

/*!50003 DROP PROCEDURE IF EXISTS  `obtener_tarifas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `obtener_tarifas`(
  orden INT,
  delegacion INT,
  tipo VARCHAR (5),
  tarifa VARCHAR (5),
  fecha_entrega DATE,
  fecha_recogida DATE,
  hora_entrega TIME,
  hora_recogida TIME
)
BEGIN
  DELETE 
  FROM
    operacion__orden_tarifa 
  WHERE `orden_id` = orden ;
  UPDATE 
    `flota__tarifa` 
  SET
    `tarifa_id` = NULL 
  WHERE ISNULL(tarifa_id) ;
  
  CALL obtener_tarifas_exec (
    orden,
    delegacion,
    tipo,
    tarifa,
    fecha_entrega,
    fecha_recogida,
    hora_entrega,
    hora_recogida
  ) ;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `obtener_tarifas_exec` */

/*!50003 DROP PROCEDURE IF EXISTS  `obtener_tarifas_exec` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `obtener_tarifas_exec`(orden INT, delegacion INT, tipo VARCHAR (5), tarifa VARCHAR (5), fecha_entrega DATE, fecha_recogida DATE, hora_entrega TIME, hora_recogida TIME)
    DETERMINISTIC
BEGIN
  DECLARE periodo INT DEFAULT 0 ;
  DECLARE fraccion INT DEFAULT 0 ;
  DECLARE fecha_inicio DATE DEFAULT NULL ;
  CASE tarifa 
  WHEN "HOUR" THEN
	IF DATEDIFF(fecha_recogida, fecha_entrega) > 0 
		THEN CALL obtener_tarifas_exec(orden,delegacion,tipo,"DAY",fecha_entrega,fecha_recogida,NULL,NULL);
	END IF ;
	SET periodo = TIMEDIFF(hora_recogida, hora_entrega);
	SET periodo = IF(periodo > 0,HOUR(periodo) + (MINUTE(hora_recogida)>MINUTE(hora_entrega)),0);
	SET fraccion = 0;
  WHEN "MONTH" THEN
	SET periodo = PERIOD_DIFF(DATE_FORMAT(fecha_recogida, '%Y%m'),DATE_FORMAT(fecha_entrega, '%Y%m')) ;
	SET fraccion = DAY(fecha_recogida) - DAY(fecha_entrega);
	SET fraccion = IF(fraccion>=0,fraccion + (TIMEDIFF(hora_recogida, hora_entrega)>0),0);
  ELSE
	SET tarifa = "DAY";
	SET periodo = DATEDIFF(fecha_recogida, fecha_entrega) ;
	SET fraccion = TIMEDIFF(hora_recogida, hora_entrega);
	SET fraccion = IF(fraccion>0,HOUR(fraccion) + (MINUTE(hora_recogida)>MINUTE(hora_entrega)),0);
  END CASE ;
  IF periodo < 1 THEN
	SET periodo = 1;
	SET fraccion = 0;
  END IF;
  calc :LOOP
    CASE tarifa 
    WHEN "HOUR" THEN 
      SELECT t.tarifa_id,t.fecha_inicio,t.fecha_fin,
	IF(periodo > t.hasta, t.hasta, periodo)
      INTO @tarifa,@fecha_inicio,@fecha_fin,@period 
      FROM flota__tarifa t 
      WHERE t.delegacion_id = delegacion AND t.tipo_id = tipo AND t.tipo_tarifa = tarifa AND (fecha_entrega BETWEEN t.fecha_inicio AND t.fecha_fin) 
        AND (t.hasta < periodo XOR (periodo BETWEEN t.desde AND t.hasta)) 
      ORDER BY t.hasta DESC 
      LIMIT 1 ;
    WHEN "MONTH" THEN 
      SELECT t.tarifa_id,t.fecha_inicio,t.fecha_fin,
        IF(t.fecha_fin < fecha_recogida,PERIOD_DIFF(DATE_FORMAT(t.fecha_fin, '%Y%m'),DATE_FORMAT(fecha_entrega, '%Y%m')),PERIOD_DIFF(DATE_FORMAT(fecha_recogida, '%Y%m'),DATE_FORMAT(fecha_entrega, '%Y%m'))) + 1
      INTO @tarifa,@fecha_inicio,@fecha_fin,@period 
      FROM flota__tarifa t 
      WHERE t.delegacion_id = delegacion AND t.tipo_id = tipo AND t.tipo_tarifa = tarifa AND (fecha_entrega BETWEEN t.fecha_inicio AND t.fecha_fin) 
        AND (IF(t.fecha_fin < fecha_recogida,PERIOD_DIFF(DATE_FORMAT(t.fecha_fin, '%Y%m'),DATE_FORMAT(fecha_entrega, '%Y%m')),PERIOD_DIFF(DATE_FORMAT(fecha_recogida, '%Y%m'),DATE_FORMAT(fecha_entrega, '%Y%m'))) BETWEEN t.desde AND t.hasta) 
      ORDER BY t.hasta DESC 
      LIMIT 1 ;
    ELSE
      SELECT t.tarifa_id,t.fecha_inicio,t.fecha_fin,
        IF(t.fecha_fin < fecha_recogida,DATEDIFF(t.fecha_fin, fecha_entrega),DATEDIFF(fecha_recogida, fecha_entrega)) + 1
      INTO @tarifa,@fecha_inicio,@fecha_fin,@period 
      FROM flota__tarifa t 
      WHERE t.delegacion_id = delegacion AND t.tipo_id = tipo AND t.tipo_tarifa = tarifa AND (fecha_entrega BETWEEN t.fecha_inicio AND t.fecha_fin) 
        AND (IF(t.fecha_fin < fecha_recogida,DATEDIFF(t.fecha_fin, fecha_entrega),DATEDIFF(fecha_recogida, fecha_entrega)) BETWEEN t.desde AND t.hasta) 
      ORDER BY t.hasta DESC 
      LIMIT 1 ;
    END CASE ;
        
iF @tarifa THEN
    INSERT INTO operacion__orden_tarifa
    VALUES (NULL,orden,@tarifa,IF(periodo < @period, periodo, @period),IF(periodo - @period > 0, 0, fraccion),@fecha_inicio,@fecha_fin,fecha_entrega,IF(fecha_recogida>@fecha_fin,@fecha_fin,fecha_recogida),NOW());
ELSE 
    LEAVE calc ;
END IF;
    
    IF tarifa = "DAY" THEN 
      SET fecha_entrega = DATE_ADD(fecha_entrega,INTERVAL @period DAY) ;
    ELSEIF tarifa = "MONTH" THEN 
      SET fecha_entrega = DATE_ADD(fecha_entrega,INTERVAL @period MONTH);
    END IF;    
    
    SET periodo = periodo - @period ;
    IF periodo > 0 THEN
	ITERATE calc ;
    END IF ;
    LEAVE calc ;
  END LOOP calc ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `valida_vehiculo` */

/*!50003 DROP PROCEDURE IF EXISTS  `valida_vehiculo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `valida_vehiculo`(
  vehiculo INT,
  fecha_entrega DATE,
  fecha_recogida DATE
)
BEGIN
  IF ISNULL(fecha_entrega) 
  THEN SET fecha_entrega = DATE(NOW()) ;
  END IF ;
  IF ISNULL(fecha_recogida) 
  THEN SET fecha_recogida = DATE(NOW()) ;
  END IF ;
  SELECT 
    MIN(fecha) AS 'fecha_entrega',
    MAX(fecha) AS 'fecha_recogida' 
  FROM
    operacion__orden_vehiculo 
  WHERE `vehiculo_id` = vehiculo 
    AND `fecha` between fecha_entrega 
    AND fecha_recogida 
  LIMIT 1 ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `vincular_vehiculo` */

/*!50003 DROP PROCEDURE IF EXISTS  `vincular_vehiculo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `vincular_vehiculo`(orden INT, vehiculo INT, fecha_entrega DATE, fecha_recogida DATE)
BEGIN
DELETE FROm `operacion__orden_vehiculo`
WHERE id=orden;
IF NOT isNULL(vehiculo) THEN
while fecha_recogida >= fecha_entrega DO
	INSERT INTO operacion__orden_vehiculo
	VALUES (orden,fecha_entrega,vehiculo);
	
	SET fecha_entrega = DATE_ADD(fecha_entrega, INTERVAL 1 DAY);
END WHILE;
END IF;
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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__contrato_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`matricula` AS `matricula` from (((`operacion__orden` `t` left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) left join `flota__vehiculo` `vehiculo` on(`vehiculo`.`id` = `detalles`.`vehiculo_id`)) where `t`.`momento` = 'CONTRATO') */;

/*View structure for view operacion__presupuesto_search */

/*!50001 DROP TABLE IF EXISTS `operacion__presupuesto_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__presupuesto_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__presupuesto_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida` from ((`operacion__orden` `t` left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) where `t`.`momento` = 'PRESUPUESTO') */;

/*View structure for view operacion__reserva_search */

/*!50001 DROP TABLE IF EXISTS `operacion__reserva_search` */;
/*!50001 DROP VIEW IF EXISTS `operacion__reserva_search` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `operacion__reserva_search` AS (select `t`.`id` AS `id`,`t`.`delegacion_id` AS `delegacion_id`,`t`.`cliente` AS `cliente`,`t`.`tipo_contrato` AS `tipo_contrato`,`t`.`tipo_id` AS `tipo_id`,`t`.`tipo_tarifa` AS `tipo_tarifa`,`t`.`momento` AS `momento`,`t`.`estado` AS `estado`,`t`.`codigo` AS `codigo`,`t`.`orden_id` AS `orden_id`,`t`.`tipo_contrato` AS `tipo`,`delagacion`.`nombre` AS `delegacion_nombre`,`detalles`.`fecha_entrega` AS `fecha_entrega`,`detalles`.`fecha_recogida` AS `fecha_recogida`,`vehiculo`.`matricula` AS `matricula` from (((`operacion__orden` `t` left join `operacion__orden_detalles` `detalles` on(`detalles`.`id` = `t`.`id`)) left join `comun__delegacion` `delagacion` on(`delagacion`.`id` = `t`.`delegacion_id`)) left join `flota__vehiculo` `vehiculo` on(`vehiculo`.`id` = `detalles`.`vehiculo_id`)) where `t`.`momento` = 'RESERVA') */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
