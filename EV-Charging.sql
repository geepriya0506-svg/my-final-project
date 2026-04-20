/*
SQLyog Community v12.02 (32 bit)
MySQL - 5.5.29 : Database - evcharge
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`evcharge` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `evcharge`;

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(50) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `station_name` varchar(150) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `time_slot` varchar(50) DEFAULT NULL,
  `charger_type` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount_paid` int(11) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `cvv_number` varchar(5) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `charging_status` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

insert  into `booking`(`id`,`booking_id`,`user`,`station_id`,`station_name`,`booking_date`,`time_slot`,`charger_type`,`price`,`amount_paid`,`card_number`,`cvv_number`,`status`,`charging_status`,`created_at`) values (1,'EVBK1770721249104','camy',2,'EV charging station','2026-03-06','09:00 - 10:00','Normal',99,NULL,NULL,NULL,'CONFIRMED','COMPLETED','2026-02-10 03:00:49'),(2,'EVBK1770793360947','camy',5,'station 3','2026-03-07','09:00 - 10:00','Normal',11,NULL,NULL,NULL,'CONFIRMED','COMPLETED','2026-02-10 23:02:40'),(3,'EVBK1770794070033','camy',6,'station 1','2026-03-07','10:00 - 11:00','Normal',50,50,'12345678901234','111','CONFIRMED','COMPLETED','2026-02-10 23:14:30'),(4,'EVBK1770794148819','camy',3,'station 1','2026-03-06','09:00 - 10:00','Normal',100,NULL,NULL,NULL,'CONFIRMED','COMPLETED','2026-02-10 23:15:48'),(5,'EVBK1770794288718','camy',2,'EV charging station','2026-02-28','09:00 - 10:00','Normal',111,111,'12345678901234','222','CONFIRMED','CHARGING','2026-02-10 23:18:08'),(6,'EVBK1770805753953','camy',2,'EV charging station','2026-02-12','10:00 - 11:00','Fast',111,111,'12345678901234','111','CONFIRMED','COMPLETED','2026-02-11 02:29:13'),(7,'EVBK1770811066974','camy',2,'EV charging station','2026-03-07','09:00 - 10:00','Normal',1111,1111,'12345678901234','111','CONFIRMED','COMPLETED','2026-02-11 03:57:46');

/*Table structure for table `creq` */

DROP TABLE IF EXISTS `creq`;

CREATE TABLE `creq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `vehicle` varchar(100) DEFAULT NULL,
  `Kwh` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT 'PENDING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `creq` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `station_name` varchar(100) DEFAULT NULL,
  `feedback` text,
  `fdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`user`,`location`,`station_name`,`feedback`,`fdate`) values (1,'jeva','chennai','EV charging station','good service','2026-02-09 02:58:43'),(2,NULL,NULL,NULL,NULL,'2026-02-09 02:59:35'),(3,NULL,NULL,NULL,NULL,'2026-02-09 02:59:49'),(4,NULL,NULL,NULL,NULL,'2026-02-09 03:01:29'),(5,NULL,NULL,NULL,NULL,'2026-02-09 03:01:38'),(6,'camy','madurai','station 3','dd','2026-02-11 03:57:23');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'DEACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`id`,`username`,`password`,`email`,`contact`,`location`,`profile_image`,`status`) values (1,'admin','1111','tpsjavateam@gmail.com','1234567890','chennai','C:/ev_uploads/1770620026572_images (1).jpg','ACTIVE');

/*Table structure for table `station` */

DROP TABLE IF EXISTS `station`;

CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(100) DEFAULT NULL,
  `station_name` varchar(100) DEFAULT NULL,
  `charger_type` varchar(50) DEFAULT NULL,
  `cost` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `station_image` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `normal_price` int(11) DEFAULT NULL,
  `fast_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `station` */

insert  into `station`(`id`,`owner`,`station_name`,`charger_type`,`cost`,`contact`,`location`,`station_image`,`status`,`normal_price`,`fast_price`) values (1,'admin','EV charging station',NULL,NULL,'1234567890','chennai','C:/ev_uploads/1770623415285_images (1).jpg','INACTIVE',99,199),(2,'admin','EV charging station',NULL,NULL,'1234567890','chennai','C:/ev_uploads/1770624302470_images (1).jpg','ACTIVE',99,199),(3,'admin','station 1',NULL,NULL,'1234567890','madurai','C:/ev_uploads/1770788957177_images.jpg','ACTIVE',100,200),(4,'admin','station 2',NULL,NULL,'1234567890','tirchy','C:/ev_uploads/1770789156204_images.jpg','ACTIVE',99,199),(5,'admin','station 3',NULL,NULL,'1234567890','vellore','C:/ev_uploads/1770790415923_images.jpg','ACTIVE',11,133),(6,'admin','station 1',NULL,NULL,'1234567890','madurai','C:/ev_uploads/1770790727573_images.jpg','ACTIVE',111,222),(7,'admin','station 1',NULL,NULL,'1234567890','vellore','C:/ev_uploads/1770791176979_images.jpg','REJECTED',1111,111);

/*Table structure for table `station1` */

DROP TABLE IF EXISTS `station1`;

CREATE TABLE `station1` (
  `sno` int(22) DEFAULT NULL,
  `user` varchar(222) DEFAULT NULL,
  `sid` varchar(222) DEFAULT NULL,
  `sname` varchar(222) DEFAULT NULL,
  `cost` varchar(222) DEFAULT NULL,
  `contact` varchar(222) DEFAULT NULL,
  `location` varchar(222) DEFAULT NULL,
  `status` varchar(222) DEFAULT 'Waiting',
  `feed` varchar(222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `station1` */

insert  into `station1`(`sno`,`user`,`sid`,`sname`,`cost`,`contact`,`location`,`status`,`feed`) values (3,'Maran','SID8112','Lectron Charging Station','RS:34','044 4952 1212','Anna Salai','Reserved Successfully','Good'),(5,'jeva','SID4824','Lectron Charging Station','RS:200','8678667567','Chennai','Waiting',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'DEACTIVE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`contact`,`location`,`profile_image`,`status`) values (1,'jeva','1111','tpsjavateam@gmail.com','1234567890','chennai','upload/1770618154685_images (1).jpg','DEACTIVE'),(2,'camy','1111','tpsjavateam@gmail.com','1234567890','chennai','C:/ev_uploads/1770618298578_images (1).jpg','ACTIVE'),(3,'jeva','1111','tpsjavateam@gmail.com','1234567890','chennai','C:/ev_uploads/1770618366410_images (1).jpg','ACTIVE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
