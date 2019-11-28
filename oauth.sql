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
  `access_token` varchar(40) NOT NULL COMMENT '获取资源的access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_access_tokens` */

/*Table structure for table `oauth_authorization_codes` */

DROP TABLE IF EXISTS `oauth_authorization_codes`;

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL COMMENT '通过Authorization 获取到的code，用于获取access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `redirect_uri` varchar(2000) DEFAULT NULL COMMENT '认证后跳转的url',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_authorization_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `client_secret` varchar(80) NOT NULL COMMENT '开发者AppSecret',
  `redirect_uri` varchar(2000) NOT NULL COMMENT '认证后跳转的url',
  `grant_types` varchar(80) DEFAULT NULL COMMENT '认证的方式，client_credentials、password、refresh_token、authorization_code、authorization_access_token',
  `scope` varchar(100) DEFAULT NULL COMMENT '权限容器',
  `user_id` varchar(80) DEFAULT NULL COMMENT '开发者用户id',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`client_id`,`client_secret`,`redirect_uri`,`grant_types`,`scope`,`user_id`) values 
('client2','pass2','http://localhost','authorization_code','file node userinfo cloud','xiaocao'),
('testclient','testpass','http://localhost','client_credentials password authorization_code refresh_token','file node userinfo cloud','xiaocao');

/*Table structure for table `oauth_jwt` */

DROP TABLE IF EXISTS `oauth_jwt`;

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者用户id',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_jwt` */

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL COMMENT '跟新access_token的token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `oauth_scopes` */

DROP TABLE IF EXISTS `oauth_scopes`;

CREATE TABLE `oauth_scopes` (
  `scope` text COMMENT '容器名字',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认拥有，1=>是，0=>否'
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
  `username` varchar(255) NOT NULL COMMENT '内部时候使用的认证用户名',
  `password` varchar(2000) DEFAULT NULL COMMENT '内部时候使用的认证用户密码',
  `first_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
  `last_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
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
