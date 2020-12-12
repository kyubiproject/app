-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rentavan
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rentavan` ;

-- -----------------------------------------------------
-- Schema rentavan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rentavan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rentavan` ;

-- -----------------------------------------------------
-- Table `rentavan`.`comun__delegacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__delegacion` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__delegacion` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `whatsapp` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rentavan`.`comun__oficina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__oficina` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__oficina` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `direccion` TINYBLOB NULL DEFAULT NULL,
  `horario` TINYBLOB NULL DEFAULT NULL,
  `ubicacion` VARCHAR(30) NULL DEFAULT NULL,
  `correo` VARCHAR(20) NULL,
  `telefono` VARCHAR(100) NULL DEFAULT NULL,
  `whatsapp` VARCHAR(20) NULL DEFAULT NULL,
  `delegacion_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `comun__oficina_ibfk_1`
    FOREIGN KEY (`delegacion_id`)
    REFERENCES `rentavan`.`comun__delegacion` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `delegacion__id` ON `rentavan`.`comun__oficina` (`delegacion_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`flota__marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__marca` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__marca` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `correo` VARCHAR(100) NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rentavan`.`flota__modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__modelo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__modelo` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `marca_id` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `flota__modelo_ibfk_1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `rentavan`.`flota__marca` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `marca__id` ON `rentavan`.`flota__modelo` (`marca_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__periodo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__periodo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__periodo` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__tarifa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__tarifa` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__tarifa` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hasta` TINYINT UNSIGNED NOT NULL,
  `tipo_tarifa` ENUM('HORA', 'DIA', 'MES') NOT NULL,
  `periodo_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__tarifa_tarifa__periodo1`
    FOREIGN KEY (`periodo_id`)
    REFERENCES `rentavan`.`tarifa__periodo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `UNIQUE` ON `rentavan`.`tarifa__tarifa` (`hasta` ASC, `tipo_tarifa` ASC, `periodo_id` ASC);

CREATE INDEX `fk_flota__tarifa_tarifa__periodo1_idx` ON `rentavan`.`tarifa__tarifa` (`periodo_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__item` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__item` (
  `id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `tarifa` FLOAT(7,2) UNSIGNED NULL,
  `cantidad` FLOAT(7,2) UNSIGNED NULL,
  `magnitud` ENUM('HORA', 'DIA', 'MES', 'KM', 'LT') NULL DEFAULT NULL,
  `tipo` ENUM('UNICO', 'CICLO', 'REFERENCIA') NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `cantidad` ON `rentavan`.`tarifa__item` (`tarifa` ASC, `magnitud` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__grupo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__grupo` (
  `id` CHAR(3) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `tipo_vehiculo` ENUM('COMERCIAL', 'ESPECIAL', 'MONOVOLUMEN', 'TODOTERRENO', 'TURISMO') NULL,
  `fianza` FLOAT(7,2) UNSIGNED NULL DEFAULT NULL,
  `franquicia` FLOAT(7,2) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rentavan`.`flota__modelo_carga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__modelo_carga` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__modelo_carga` (
  `id` SMALLINT UNSIGNED NOT NULL,
  `largo` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  `ancho` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  `alto` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  `peso` VARCHAR(10) NULL DEFAULT NULL,
  `volumen` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__vehiculo_carga_flota__modelo1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`flota__modelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rentavan`.`flota__vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__vehiculo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__vehiculo` (
  `id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(10) NOT NULL,
  `fecha_matricula` DATE NULL DEFAULT NULL,
  `bastidor` VARCHAR(30) NULL DEFAULT NULL,
  `estado` ENUM('DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA') NULL,
  `fecha_estado` TIMESTAMP NOT NULL,
  `modelo_id` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `flota__vehiculo_ibfk_1`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `rentavan`.`flota__modelo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `matricula` ON `rentavan`.`flota__vehiculo` (`matricula` ASC);

CREATE INDEX `modelo__id` ON `rentavan`.`flota__vehiculo` (`modelo_id` ASC);

CREATE UNIQUE INDEX `bastidor_UNIQUE` ON `rentavan`.`flota__vehiculo` (`bastidor` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`operacion__document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`operacion__document` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`operacion__document` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` CHAR(16) NOT NULL,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo` ENUM('PRESUPUESTO', 'RESERVA', 'CONTRATO') NOT NULL,
  `estado` ENUM('EN VIGOR', 'ANULADO', 'FINALIZADO', 'RENOVADO') NULL DEFAULT NULL,
  `fecha_estado` TIMESTAMP NULL,
  `document_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_operacion__document_operacion__document1`
    FOREIGN KEY (`document_id`)
    REFERENCES `rentavan`.`operacion__document` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `codigo_UNIQUE` ON `rentavan`.`operacion__document` (`codigo` ASC);

CREATE INDEX `fk_operacion__document_operacion__document1_idx` ON `rentavan`.`operacion__document` (`document_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__persona` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__persona` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `dni` VARCHAR(20) NOT NULL,
  `pais_dni` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dni_UNIQUE` ON `rentavan`.`comun__persona` (`dni` ASC, `pais_dni` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__cliente` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__cliente` (
  `id` INT UNSIGNED NOT NULL,
  `tipo` SET('PERSONA', 'EMPRESA') NOT NULL,
  `observacion` TEXT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comun__persona_has_operacion__orden_comun__persona1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`comun__persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comun__persona_has_operacion__orden_comun__persona1_idx` ON `rentavan`.`comun__cliente` (`id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`operacion__orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`operacion__orden` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`operacion__orden` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_contrato` ENUM('CORTO', 'LARGO') NOT NULL,
  `tarifa_id` SMALLINT UNSIGNED NOT NULL,
  `fecha_entrega` DATETIME NULL,
  `fecha_recogida` DATETIME NULL,
  `fecha_alta` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_baja` TIMESTAMP NULL,
  `cliente_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_operacion__orden_detalles_tarifa__tarifa1`
    FOREIGN KEY (`tarifa_id`)
    REFERENCES `rentavan`.`tarifa__tarifa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_comun__cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `rentavan`.`comun__cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_operacion__orden_detalles_tarifa__tarifa1_idx` ON `rentavan`.`operacion__orden` (`tarifa_id` ASC);

CREATE INDEX `fk_operacion__orden_comun__cliente1_idx` ON `rentavan`.`operacion__orden` (`cliente_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`flota__vehiculo_movimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__vehiculo_movimiento` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__vehiculo_movimiento` (
  `id` MEDIUMINT UNSIGNED NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `fecha` DATE NULL,
  `combustible` TINYINT(2) NULL,
  `km` MEDIUMINT UNSIGNED NULL,
  `estado` ENUM('DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA', 'ENTREGADO', 'RECIBIDO', 'RENOVADO', 'SISTEMA') NOT NULL,
  `fecha_estado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `documento_codigo` CHAR(16) NULL,
  CONSTRAINT `fk_flota__vehiculo_historico_flota__vehiculo1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`flota__vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__vehiculo_movimiento_operacion__document1`
    FOREIGN KEY (`documento_codigo`)
    REFERENCES `rentavan`.`operacion__document` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__vehiculo_historico_flota__vehiculo1_idx` ON `rentavan`.`flota__vehiculo_movimiento` (`id` ASC);

CREATE INDEX `fk_flota__vehiculo_movimiento_operacion__document1_idx` ON `rentavan`.`flota__vehiculo_movimiento` (`documento_codigo` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`flota__vehiculo_delegacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__vehiculo_delegacion` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__vehiculo_delegacion` (
  `vehiculo_id` MEDIUMINT UNSIGNED NOT NULL,
  `delegacion_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`vehiculo_id`, `delegacion_id`),
  CONSTRAINT `fk_flota__vehiculo_has_comun__delegacion_flota__vehiculo1`
    FOREIGN KEY (`vehiculo_id`)
    REFERENCES `rentavan`.`flota__vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__vehiculo_has_comun__delegacion_comun__delegacion1`
    FOREIGN KEY (`delegacion_id`)
    REFERENCES `rentavan`.`comun__delegacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__vehiculo_has_comun__delegacion_comun__delegacion1_idx` ON `rentavan`.`flota__vehiculo_delegacion` (`delegacion_id` ASC);

CREATE INDEX `fk_flota__vehiculo_has_comun__delegacion_flota__vehiculo1_idx` ON `rentavan`.`flota__vehiculo_delegacion` (`vehiculo_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`flota__vehiculo_caracteristicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__vehiculo_caracteristicas` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__vehiculo_caracteristicas` (
  `id` MEDIUMINT UNSIGNED NOT NULL,
  `color` VARCHAR(20) NULL DEFAULT NULL,
  `anio` YEAR NULL,
  `transmision` ENUM('MANUAL', 'AUTOMATICO', 'DUAL') NULL DEFAULT NULL,
  `plazas` TINYINT(2) UNSIGNED NULL DEFAULT NULL,
  `puertas` TINYINT(2) UNSIGNED NULL DEFAULT NULL,
  `extra` SET('GPS', 'AIRE', '4X4', 'MULTIMEDIA', 'ALARMA') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__vehiculo_caracteristicas_flota__vehiculo1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`flota__vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__vehiculo_caracteristicas_flota__vehiculo1_idx` ON `rentavan`.`flota__vehiculo_caracteristicas` (`id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`flota__modelo_caracteristicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`flota__modelo_caracteristicas` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`flota__modelo_caracteristicas` (
  `id` SMALLINT UNSIGNED NOT NULL,
  `potencia` VARCHAR(10) NULL DEFAULT NULL,
  `combustible` ENUM('GASOLINA', 'DIESEL', 'ELECTRICO', 'HIBRIDO') NULL DEFAULT NULL,
  `combustible_cap` TINYINT UNSIGNED NULL DEFAULT NULL,
  `largo` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  `ancho` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  `alto` FLOAT(5,2) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_flota__modelo_caracteristicas_flota__modelo1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`flota__modelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__grupo_modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__grupo_modelo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__grupo_modelo` (
  `grupo_id` CHAR(3) NOT NULL,
  `modelo_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`grupo_id`, `modelo_id`),
  CONSTRAINT `fk_flota__tipo_has_flota__modelo_flota__tipo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `rentavan`.`tarifa__grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tipo_has_flota__modelo_flota__modelo1`
    FOREIGN KEY (`modelo_id`)
    REFERENCES `rentavan`.`flota__modelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__tipo_has_flota__modelo_flota__modelo1_idx` ON `rentavan`.`tarifa__grupo_modelo` (`modelo_id` ASC);

CREATE INDEX `fk_flota__tipo_has_flota__modelo_flota__tipo1_idx` ON `rentavan`.`tarifa__grupo_modelo` (`grupo_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__grupo_tarifa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__grupo_tarifa` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__grupo_tarifa` (
  `grupo_id` CHAR(3) NOT NULL,
  `tarifa_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`grupo_id`, `tarifa_id`),
  CONSTRAINT `fk_flota__tarifa_has_flota__segmento_flota__tarifa1`
    FOREIGN KEY (`tarifa_id`)
    REFERENCES `rentavan`.`tarifa__tarifa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tarifa_has_flota__segmento_flota__segmento1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `rentavan`.`tarifa__grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__tarifa_has_flota__segmento_flota__segmento1_idx` ON `rentavan`.`tarifa__grupo_tarifa` (`grupo_id` ASC);

CREATE INDEX `fk_flota__tarifa_has_flota__segmento_flota__tarifa1_idx` ON `rentavan`.`tarifa__grupo_tarifa` (`tarifa_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`tarifa__tarifa_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`tarifa__tarifa_item` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`tarifa__tarifa_item` (
  `tarifa_id` SMALLINT UNSIGNED NOT NULL,
  `item_id` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`tarifa_id`, `item_id`),
  CONSTRAINT `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa1`
    FOREIGN KEY (`tarifa_id`)
    REFERENCES `rentavan`.`tarifa__tarifa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `rentavan`.`tarifa__item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa_item1_idx` ON `rentavan`.`tarifa__tarifa_item` (`item_id` ASC);

CREATE INDEX `fk_flota__tarifa_has_flota__tarifa_item_flota__tarifa1_idx` ON `rentavan`.`tarifa__tarifa_item` (`tarifa_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`operacion__orden_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`operacion__orden_vehiculo` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`operacion__orden_vehiculo` (
  `orden_id` INT UNSIGNED NOT NULL,
  `vehiculo_id` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`orden_id`, `vehiculo_id`),
  CONSTRAINT `fk_operacion__orden_has_flota__vehiculo_flota__vehiculo1`
    FOREIGN KEY (`vehiculo_id`)
    REFERENCES `rentavan`.`flota__vehiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_vehiculo_1`
    FOREIGN KEY (`orden_id`)
    REFERENCES `rentavan`.`operacion__orden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_operacion__orden_has_flota__vehiculo_flota__vehiculo1_idx` ON `rentavan`.`operacion__orden_vehiculo` (`vehiculo_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`operacion__orden_document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`operacion__orden_document` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`operacion__orden_document` (
  `orden_id` INT UNSIGNED NOT NULL,
  `document_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`orden_id`, `document_id`),
  CONSTRAINT `fk_operacion__orden_has_operacion__document_operacion__orden1`
    FOREIGN KEY (`orden_id`)
    REFERENCES `rentavan`.`operacion__orden` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operacion__orden_document_1`
    FOREIGN KEY (`document_id`)
    REFERENCES `rentavan`.`operacion__document` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_operacion__orden_has_operacion__document_operacion__docu_idx` ON `rentavan`.`operacion__orden_document` (`document_id` ASC);

CREATE INDEX `fk_operacion__orden_has_operacion__document_operacion__orde_idx` ON `rentavan`.`operacion__orden_document` (`orden_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__conductor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__conductor` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__conductor` (
  `id` INT UNSIGNED NOT NULL,
  `carnet` VARCHAR(20) NOT NULL,
  `carnet_pais` VARCHAR(45) NULL,
  `fecha_expedicion` DATE NULL,
  `fecha_vencimiento` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comun__conductor_comun__persona1`
    FOREIGN KEY (`id`)
    REFERENCES `rentavan`.`comun__persona` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `index2` ON `rentavan`.`comun__conductor` (`carnet` ASC, `carnet_pais` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__cliente_conductor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__cliente_conductor` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__cliente_conductor` (
  `cliente_id` INT UNSIGNED NOT NULL,
  `conductor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cliente_id`, `conductor_id`),
  CONSTRAINT `fk_comun__cliente_has_comun__conductor_comun__cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `rentavan`.`comun__cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comun__cliente_has_comun__conductor_comun__conductor1`
    FOREIGN KEY (`conductor_id`)
    REFERENCES `rentavan`.`comun__conductor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comun__cliente_has_comun__conductor_comun__conductor1_idx` ON `rentavan`.`comun__cliente_conductor` (`conductor_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__persona_contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__persona_contacto` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__persona_contacto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `informacion` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL,
  `tipo` ENUM('CORREO', 'TELEFONO', 'MOVIL', 'FAX', 'WEB', 'PERSONA') NULL,
  `clase` SET('PRINCIPAL', 'EMERGENCIA', 'REFERENCIA', 'PERSONAL', 'FAMILIAR', 'OTRO') NULL,
  `persona_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comun__persona_contacto_comun__persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `rentavan`.`comun__persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comun__persona_contacto_comun__persona1_idx` ON `rentavan`.`comun__persona_contacto` (`persona_id` ASC);


-- -----------------------------------------------------
-- Table `rentavan`.`comun__persona_direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentavan`.`comun__persona_direccion` ;

CREATE TABLE IF NOT EXISTS `rentavan`.`comun__persona_direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `direccion` TEXT NOT NULL,
  `problacion` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(15) NULL,
  `clase` SET('PRINCIPAL', 'FISCAL', 'OFICINA', 'CASA') NULL,
  `persona_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comun__persona_contacto_comun__persona10`
    FOREIGN KEY (`persona_id`)
    REFERENCES `rentavan`.`comun__persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comun__persona_contacto_comun__persona1_idx` ON `rentavan`.`comun__persona_direccion` (`persona_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

