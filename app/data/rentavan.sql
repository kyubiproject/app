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
  `tipo` set('PERSONA','EMPRESA') NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comun__persona_has_operacion__orden_comun__persona1_idx` (`id`),
  CONSTRAINT `fk_comun__persona_has_operacion__orden_comun__persona1` FOREIGN KEY (`id`) REFERENCES `comun__persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__cliente` */

/*Table structure for table `comun__cliente_conductor` */

DROP TABLE IF EXISTS `comun__cliente_conductor`;

CREATE TABLE `comun__cliente_conductor` (
  `cliente_id` int(10) unsigned NOT NULL,
  `conductor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cliente_id`,`conductor_id`),
  KEY `fk_comun__cliente_has_comun__conductor_comun__conductor1_idx` (`conductor_id`),
  CONSTRAINT `fk_comun__cliente_has_comun__conductor_comun__cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `comun__cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comun__cliente_has_comun__conductor_comun__conductor1` FOREIGN KEY (`conductor_id`) REFERENCES `comun__conductor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__cliente_conductor` */

/*Table structure for table `comun__conductor` */

DROP TABLE IF EXISTS `comun__conductor`;

CREATE TABLE `comun__conductor` (
  `id` int(10) unsigned NOT NULL,
  `carnet` varchar(20) NOT NULL,
  `carnet_pais` varchar(45) DEFAULT NULL,
  `fecha_expedicion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`carnet`,`carnet_pais`),
  CONSTRAINT `fk_comun__conductor_comun__persona1` FOREIGN KEY (`id`) REFERENCES `comun__persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__conductor` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comun__delegacion` */

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
  CONSTRAINT `fk_comun__persona_contacto_comun__persona1` FOREIGN KEY (`persona_id`) REFERENCES `comun__persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `fk_comun__persona_contacto_comun__persona10` FOREIGN KEY (`persona_id`) REFERENCES `comun__persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `flota__marca` */

insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (2,'Chevrolet','','aaa','');
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (3,'FIAT',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (4,'Ford',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (5,'KIA',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (6,'Susuki',NULL,NULL,NULL);
insert  into `flota__marca`(`id`,`nombre`,`descripcion`,`correo`,`telefono`) values (7,'JEEP',NULL,NULL,NULL);

/*Table structure for table `flota__modelo` */

DROP TABLE IF EXISTS `flota__modelo`;

CREATE TABLE `flota__modelo` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `marca_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marca__id` (`marca_id`),
  CONSTRAINT `flota__modelo_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `flota__marca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo` */

insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`) values (1,'UNO','',3);
insert  into `flota__modelo`(`id`,`nombre`,`descripcion`,`marca_id`) values (2,'VITARA','BB',2);

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
  CONSTRAINT `fk_flota__modelo_caracteristicas_flota__modelo1` FOREIGN KEY (`id`) REFERENCES `flota__modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo_caracteristicas` */

insert  into `flota__modelo_caracteristicas`(`id`,`potencia`,`combustible`,`combustible_cap`,`largo`,`ancho`,`alto`) values (1,'','',NULL,NULL,NULL,NULL);
insert  into `flota__modelo_caracteristicas`(`id`,`potencia`,`combustible`,`combustible_cap`,`largo`,`ancho`,`alto`) values (2,'140','GASOLINA',NULL,NULL,NULL,NULL);

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
  CONSTRAINT `fk_flota__vehiculo_carga_flota__modelo1` FOREIGN KEY (`id`) REFERENCES `flota__modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo_carga` */

insert  into `flota__modelo_carga`(`id`,`largo`,`ancho`,`alto`,`peso`,`volumen`) values (1,NULL,NULL,NULL,'','');
insert  into `flota__modelo_carga`(`id`,`largo`,`ancho`,`alto`,`peso`,`volumen`) values (2,NULL,NULL,NULL,'','');

/*Table structure for table `flota__modelo_tipo` */

DROP TABLE IF EXISTS `flota__modelo_tipo`;

CREATE TABLE `flota__modelo_tipo` (
  `modelo_id` smallint(5) unsigned NOT NULL,
  `tipo_id` char(3) NOT NULL,
  PRIMARY KEY (`tipo_id`,`modelo_id`),
  KEY `fk_flota__tipo_has_flota__modelo_flota__modelo1_idx` (`modelo_id`),
  KEY `fk_flota__tipo_has_flota__modelo_flota__tipo1_idx` (`tipo_id`),
  CONSTRAINT `fk_flota__tipo_has_flota__modelo_flota__modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `flota__modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tipo_has_flota__modelo_flota__tipo1` FOREIGN KEY (`tipo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__modelo_tipo` */

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

insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A','Derivado de Turismo','Furgoneta de alquiler ideal para el transporte de cargas ligeras como paquetería, cajas o pequeño mobiliario con un volumen de carga de entre 2-3 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez. Es el modelo de carga más pequeño que encontrarás en nuestra flota.111','TURISMO',300.00,600.00);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A+','Derivado de Turismo Plus','Furgoneta de alquiler ideal para transportar personas (modelo combi) o cargas ligeras (modelo comercial) con un volumen de carga de entre 2,5 - 3,5 m³, lo que te permitirá un transporte bajo en consumo, fácil manejo en accesos difíciles y rapidez.','',NULL,NULL);
insert  into `flota__tipo`(`id`,`nombre`,`descripcion`,`tipo_vehiculo`,`fianza`,`franquicia`) values ('A-C','Derivado de Turismo Combi','Es el modelo de furgoneta más pequeño, aun así sus dimensiones son más amplias que cualquier vehículo turismo medio. Este modelo combi tiene capacidad para transportar hasta 5 personas de forma cómoda y confortable, ofreciendo una flexibilidad total a la hora de abatir algún asiento para ganar más espacio para carga si fuera necesario. A estas características se le suma un muy bajo consumo y una gran facilidad y comodidad de conducción similar a la de los modelos más recientes de turismos.','',NULL,NULL);
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
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA') DEFAULT NULL,
  `fecha_estado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modelo_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`),
  UNIQUE KEY `bastidor_UNIQUE` (`bastidor`),
  KEY `modelo__id` (`modelo_id`),
  CONSTRAINT `flota__vehiculo_ibfk_1` FOREIGN KEY (`modelo_id`) REFERENCES `flota__modelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo` */

insert  into `flota__vehiculo`(`id`,`matricula`,`fecha_matricula`,`bastidor`,`estado`,`fecha_estado`,`modelo_id`) values (1,'IAP28L','2007-05-06','1111111111','DISPONIBLE','2020-12-12 12:37:55',1);

/*Table structure for table `flota__vehiculo_caracteristicas` */

DROP TABLE IF EXISTS `flota__vehiculo_caracteristicas`;

CREATE TABLE `flota__vehiculo_caracteristicas` (
  `id` mediumint(8) unsigned NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `anio` year(4) DEFAULT NULL,
  `transmision` enum('MANUAL','AUTOMATICO','DUAL') DEFAULT NULL,
  `plazas` tinyint(2) unsigned DEFAULT NULL,
  `puertas` tinyint(2) unsigned DEFAULT NULL,
  `extra` set('GPS','AIRE','4X4','MULTIMEDIA','ALARMA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flota__vehiculo_caracteristicas_flota__vehiculo1_idx` (`id`),
  CONSTRAINT `fk_flota__vehiculo_caracteristicas_flota__vehiculo1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_caracteristicas` */

/*Table structure for table `flota__vehiculo_delegacion` */

DROP TABLE IF EXISTS `flota__vehiculo_delegacion`;

CREATE TABLE `flota__vehiculo_delegacion` (
  `vehiculo_id` mediumint(8) unsigned NOT NULL,
  `delegacion_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`vehiculo_id`,`delegacion_id`),
  KEY `fk_flota__vehiculo_has_comun__delegacion_comun__delegacion1_idx` (`delegacion_id`),
  KEY `fk_flota__vehiculo_has_comun__delegacion_flota__vehiculo1_idx` (`vehiculo_id`),
  CONSTRAINT `fk_flota__vehiculo_has_comun__delegacion_comun__delegacion1` FOREIGN KEY (`delegacion_id`) REFERENCES `comun__delegacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__vehiculo_has_comun__delegacion_flota__vehiculo1` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_delegacion` */

/*Table structure for table `flota__vehiculo_movimiento` */

DROP TABLE IF EXISTS `flota__vehiculo_movimiento`;

CREATE TABLE `flota__vehiculo_movimiento` (
  `id` mediumint(8) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `combustible` tinyint(2) DEFAULT NULL,
  `km` mediumint(8) unsigned DEFAULT NULL,
  `estado` enum('DISPONIBLE','RESERVADO','CONTRATADO','AVERIADO','MANTENIMIENTO','BAJA','ENTREGADO','RECIBIDO','RENOVADO','SISTEMA') NOT NULL,
  `fecha_estado` timestamp NOT NULL DEFAULT current_timestamp(),
  `documento_codigo` char(16) DEFAULT NULL,
  KEY `fk_flota__vehiculo_historico_flota__vehiculo1_idx` (`id`),
  KEY `fk_flota__vehiculo_movimiento_operacion__document1_idx` (`documento_codigo`),
  CONSTRAINT `fk_flota__vehiculo_historico_flota__vehiculo1` FOREIGN KEY (`id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__vehiculo_movimiento_operacion__document1` FOREIGN KEY (`documento_codigo`) REFERENCES `operacion__document` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `flota__vehiculo_movimiento` */

/*Table structure for table `operacion__document` */

DROP TABLE IF EXISTS `operacion__document`;

CREATE TABLE `operacion__document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` char(16) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` enum('PRESUPUESTO','RESERVA','CONTRATO') NOT NULL,
  `estado` enum('EN VIGOR','ANULADO','FINALIZADO','RENOVADO') DEFAULT NULL,
  `fecha_estado` timestamp NULL DEFAULT NULL,
  `document_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_operacion__document_operacion__document1_idx` (`document_id`),
  CONSTRAINT `fk_operacion__document_operacion__document1` FOREIGN KEY (`document_id`) REFERENCES `operacion__document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__document` */

/*Table structure for table `operacion__orden` */

DROP TABLE IF EXISTS `operacion__orden`;

CREATE TABLE `operacion__orden` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_contrato` enum('CORTO','LARGO') NOT NULL,
  `tarifa_id` smallint(5) unsigned NOT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_recogida` datetime DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_baja` timestamp NULL DEFAULT NULL,
  `cliente_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_operacion__orden_detalles_tarifa__tarifa1_idx` (`tarifa_id`),
  KEY `fk_operacion__orden_comun__cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_operacion__orden_comun__cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `comun__cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_detalles_tarifa__tarifa1` FOREIGN KEY (`tarifa_id`) REFERENCES `tarifa__tarifa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden` */

/*Table structure for table `operacion__orden_document` */

DROP TABLE IF EXISTS `operacion__orden_document`;

CREATE TABLE `operacion__orden_document` (
  `orden_id` int(10) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`orden_id`,`document_id`),
  KEY `fk_operacion__orden_has_operacion__document_operacion__docu_idx` (`document_id`),
  KEY `fk_operacion__orden_has_operacion__document_operacion__orde_idx` (`orden_id`),
  CONSTRAINT `fk_operacion__orden_document_1` FOREIGN KEY (`document_id`) REFERENCES `operacion__document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_has_operacion__document_operacion__orden1` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_document` */

/*Table structure for table `operacion__orden_vehiculo` */

DROP TABLE IF EXISTS `operacion__orden_vehiculo`;

CREATE TABLE `operacion__orden_vehiculo` (
  `orden_id` int(10) unsigned NOT NULL,
  `vehiculo_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`orden_id`,`vehiculo_id`),
  KEY `fk_operacion__orden_has_flota__vehiculo_flota__vehiculo1_idx` (`vehiculo_id`),
  CONSTRAINT `fk_operacion__orden_has_flota__vehiculo_flota__vehiculo1` FOREIGN KEY (`vehiculo_id`) REFERENCES `flota__vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_vehiculo_1` FOREIGN KEY (`orden_id`) REFERENCES `operacion__orden` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operacion__orden_vehiculo` */

/*Table structure for table `tarifa__item` */

DROP TABLE IF EXISTS `tarifa__item`;

CREATE TABLE `tarifa__item` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tarifa` float(7,2) unsigned DEFAULT NULL,
  `cantidad` float(7,2) unsigned DEFAULT NULL,
  `magnitud` enum('HORA','DIA','MES','KM','LT') DEFAULT NULL,
  `tipo` enum('UNICO','CICLO','REFERENCIA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cantidad` (`tarifa`,`magnitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tarifa__item` */

/*Table structure for table `tarifa__periodo` */

DROP TABLE IF EXISTS `tarifa__periodo`;

CREATE TABLE `tarifa__periodo` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tarifa__periodo` */

/*Table structure for table `tarifa__tarifa` */

DROP TABLE IF EXISTS `tarifa__tarifa`;

CREATE TABLE `tarifa__tarifa` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `hasta` tinyint(3) unsigned NOT NULL,
  `tipo_tarifa` enum('HORA','DIA','MES') NOT NULL,
  `periodo_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`hasta`,`tipo_tarifa`,`periodo_id`),
  KEY `fk_flota__tarifa_tarifa__periodo1_idx` (`periodo_id`),
  CONSTRAINT `fk_flota__tarifa_tarifa__periodo1` FOREIGN KEY (`periodo_id`) REFERENCES `tarifa__periodo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tarifa__tarifa` */

/*Table structure for table `tarifa__tarifa_item` */

DROP TABLE IF EXISTS `tarifa__tarifa_item`;

CREATE TABLE `tarifa__tarifa_item` (
  `tarifa_id` smallint(5) unsigned NOT NULL,
  `item_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tarifa_id`,`item_id`),
  KEY `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa_item1_idx` (`item_id`),
  KEY `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa1_idx` (`tarifa_id`),
  CONSTRAINT `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa1` FOREIGN KEY (`tarifa_id`) REFERENCES `tarifa__tarifa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa_item1` FOREIGN KEY (`item_id`) REFERENCES `tarifa__item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tarifa__tarifa_item` */

/*Table structure for table `tarifa__tarifa_tipo` */

DROP TABLE IF EXISTS `tarifa__tarifa_tipo`;

CREATE TABLE `tarifa__tarifa_tipo` (
  `tarifa_id` smallint(5) unsigned NOT NULL,
  `grupo_id` char(3) NOT NULL,
  PRIMARY KEY (`grupo_id`,`tarifa_id`),
  KEY `fk_flota__tarifa_has_flota__segmento_flota__segmento1_idx` (`grupo_id`),
  KEY `fk_flota__tarifa_has_flota__segmento_flota__tarifa1_idx` (`tarifa_id`),
  CONSTRAINT `fk_flota__tarifa_has_flota__segmento_flota__segmento1` FOREIGN KEY (`grupo_id`) REFERENCES `flota__tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tarifa_has_flota__segmento_flota__tarifa1` FOREIGN KEY (`tarifa_id`) REFERENCES `tarifa__tarifa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tarifa__tarifa_tipo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
