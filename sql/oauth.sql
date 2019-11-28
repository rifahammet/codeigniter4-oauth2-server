/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.17 : Database - oauth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oauth` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oauth`;

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL COMMENT 'access_token',
  `client_id` varchar(80) NOT NULL COMMENT 'Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT 'scope',
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_access_tokens` */

/*Table structure for table `oauth_authorization_codes` */

DROP TABLE IF EXISTS `oauth_authorization_codes`;

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL COMMENT 'Authorization code，access_token',
  `client_id` varchar(80) NOT NULL COMMENT 'Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'id',
  `redirect_uri` varchar(2000) DEFAULT NULL COMMENT 'url',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT 'scope',
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_authorization_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL COMMENT 'AppId',
  `client_secret` varchar(80) NOT NULL COMMENT 'AppSecret',
  `redirect_uri` varchar(2000) NOT NULL COMMENT 'url',
  `grant_types` varchar(80) DEFAULT NULL COMMENT 'grant_type',
  `scope` varchar(100) DEFAULT NULL COMMENT 'scope',
  `user_id` varchar(80) DEFAULT NULL COMMENT 'user_id',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`client_id`,`client_secret`,`redirect_uri`,`grant_types`,`scope`,`user_id`) values 
('client2','pass2','http://localhost','authorization_code','file node userinfo cloud','xiaocao'),
('testclient','testpass','http://localhost','client_credentials password authorization_code refresh_token','file node userinfo cloud','xiaocao');

/*Table structure for table `oauth_jwt` */

DROP TABLE IF EXISTS `oauth_jwt`;

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL COMMENT 'id',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_jwt` */

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL COMMENT 'refresh_token for access_token',
  `client_id` varchar(80) NOT NULL COMMENT 'AppId',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT 'scope',
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `oauth_scopes` */

DROP TABLE IF EXISTS `oauth_scopes`;

CREATE TABLE `oauth_scopes` (
  `scope` text COMMENT 'scope',
  `is_default` tinyint(1) DEFAULT NULL COMMENT 'Default 1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_scopes` */

insert  into `oauth_scopes`(`scope`,`is_default`) values 
('userinfo',1),
('file',1),
('node',1),
('cloud',1),
('share',1);

/*Table structure for table `oauth_users` */

DROP TABLE IF EXISTS `oauth_users`;

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL COMMENT 'username',
  `password` varchar(2000) DEFAULT NULL COMMENT 'password',
  `first_name` varchar(255) DEFAULT NULL COMMENT 'firstname',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'lastname',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_users` */

insert  into `oauth_users`(`username`,`password`,`first_name`,`last_name`) values 
('user','pass','xiaocao','grasses'),
('username','password','xiaocao','grasses');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
