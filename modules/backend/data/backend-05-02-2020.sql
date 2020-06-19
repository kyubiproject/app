/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.4.6-MariaDB : Database - webapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `webapp`;

/*Table structure for table `backend__permission` */

DROP TABLE IF EXISTS `backend__permission`;

CREATE TABLE `backend__permission` (
  `profile__id` smallint(3) unsigned NOT NULL,
  `route` varchar(120) NOT NULL,
  `actions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`profile__id`,`route`),
  CONSTRAINT `backend__permission_ibfk_2` FOREIGN KEY (`profile__id`) REFERENCES `backend__profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backend__permission` */

LOCK TABLES `backend__permission` WRITE;

insert  into `backend__permission`(`profile__id`,`route`,`actions`) values (1,'backend/profile','index,create,view,update,delete,active,inactive'),(1,'backend/role','index,create,view,update,delete'),(1,'backend/user','index,create,view,update,delete,simulate,token'),(1,'studio/admin',NULL),(1,'studio/code',NULL),(1,'studio/data',NULL),(1,'studio/default',NULL),(2,'backend/profile',NULL),(2,'backend/role',NULL),(2,'backend/user','index,create,view,update,delete,simulate,token'),(2,'studio/admin',NULL),(2,'studio/code',NULL),(2,'studio/data',NULL),(2,'studio/default',NULL),(4,'backend/profile',NULL),(4,'backend/role',NULL),(4,'backend/user',NULL),(4,'studio/admin','get,create,update,delete,rename'),(4,'studio/code','get,create,update,delete,copy,rename'),(4,'studio/data','get,create,update,delete,rename'),(4,'studio/default','index,build,reverse');

UNLOCK TABLES;

/*Table structure for table `backend__profile` */

DROP TABLE IF EXISTS `backend__profile`;

CREATE TABLE `backend__profile` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `backend__profile` */

LOCK TABLES `backend__profile` WRITE;

insert  into `backend__profile`(`id`,`name`,`is_active`) values (1,'Control de acceso',''),(2,'Gestion de usuarios',''),(4,'Desarrollador','');

UNLOCK TABLES;

/*Table structure for table `backend__role` */

DROP TABLE IF EXISTS `backend__role`;

CREATE TABLE `backend__role` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `backend__role` */

LOCK TABLES `backend__role` WRITE;

insert  into `backend__role`(`id`,`name`,`is_active`) values (1,'Administrador',''),(2,'Desarrollador','');

UNLOCK TABLES;

/*Table structure for table `backend__role_profile` */

DROP TABLE IF EXISTS `backend__role_profile`;

CREATE TABLE `backend__role_profile` (
  `profile__id` smallint(4) unsigned NOT NULL,
  `role__id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`role__id`,`profile__id`),
  KEY `permission__id` (`profile__id`),
  CONSTRAINT `backend__role_profile_ibfk_2` FOREIGN KEY (`profile__id`) REFERENCES `backend__profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `backend__role_profile_ibfk_3` FOREIGN KEY (`role__id`) REFERENCES `backend__role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `backend__role_profile` */

LOCK TABLES `backend__role_profile` WRITE;

insert  into `backend__role_profile`(`profile__id`,`role__id`) values (1,1),(1,2),(4,2);

UNLOCK TABLES;

/*Table structure for table `backend__user` */

DROP TABLE IF EXISTS `backend__user`;

CREATE TABLE `backend__user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `group` enum('ADMIN','USER','ROOT') NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `token` varchar(36) DEFAULT NULL,
  `status` set('ACTIVE','VERIFED','DISABLED','BANNED') NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `backend__user` */

LOCK TABLES `backend__user` WRITE;

insert  into `backend__user`(`id`,`username`,`group`,`name`,`email`,`password`,`token`,`status`) values (1,'root','ROOT','ROOT','root@mail.com','$2y$13$5IxE1jUM43j8g6Es6ChpQODecW6dlZ3eLaVvmJSlc5yLRxjybcHxW','$2y$13$5IxE1jUM43j8g6Es6ChpQODecW6dl','ACTIVE,DISABLED'),(3,'admin','ADMIN','Administrador','admin@mail.com','$2y$13$7FiPzmOadyJLs/lwzNs6cuLUM1eKnwhqd4GbBaHzgR5h/zHGx8c1G',NULL,'ACTIVE,VERIFED,DISABLED');

UNLOCK TABLES;

/*Table structure for table `backend__user_role` */

DROP TABLE IF EXISTS `backend__user_role`;

CREATE TABLE `backend__user_role` (
  `user__id` smallint(5) unsigned NOT NULL,
  `role__id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`role__id`,`user__id`),
  KEY `user__id` (`user__id`),
  CONSTRAINT `backend__user_role_ibfk_1` FOREIGN KEY (`user__id`) REFERENCES `backend__user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `backend__user_role_ibfk_2` FOREIGN KEY (`role__id`) REFERENCES `backend__role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backend__user_role` */

LOCK TABLES `backend__user_role` WRITE;

insert  into `backend__user_role`(`user__id`,`role__id`) values (1,1),(3,1),(1,2),(3,2);

UNLOCK TABLES;

/* Procedure structure for procedure `backend__get_access` */

/*!50003 DROP PROCEDURE IF EXISTS  `backend__get_access` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `backend__get_access`(IN userId SMALLINT)
BEGIN
SELECT	a.route,
	GROUP_CONCAT(a.`actions` SEPARATOR ', ') AS actions
FROM (backend__permission a 
LEFT JOIN `backend__role_profile` p ON a.`profile__id` = p.`profile__id`)
RIGHT JOIN backend__user_role u ON p.role__id = u.role__id 
RIGHT JOIN backend__role r ON u.role__id = r.id 
WHERE a.actions IS NOT NULL
GROUP BY a.`route`;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
