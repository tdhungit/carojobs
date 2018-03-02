# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.26)
# Database: ua_carojobs
# Generation Time: 2017-04-21 14:28:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add permission',2,'add_permission'),
	(5,'Can change permission',2,'change_permission'),
	(6,'Can delete permission',2,'delete_permission'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add group',4,'add_group'),
	(11,'Can change group',4,'change_group'),
	(12,'Can delete group',4,'delete_group'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add grant',7,'add_grant'),
	(20,'Can change grant',7,'change_grant'),
	(21,'Can delete grant',7,'delete_grant'),
	(22,'Can add access token',8,'add_accesstoken'),
	(23,'Can change access token',8,'change_accesstoken'),
	(24,'Can delete access token',8,'delete_accesstoken'),
	(25,'Can add refresh token',9,'add_refreshtoken'),
	(26,'Can change refresh token',9,'change_refreshtoken'),
	(27,'Can delete refresh token',9,'delete_refreshtoken'),
	(28,'Can add application',10,'add_application'),
	(29,'Can change application',10,'change_application'),
	(30,'Can delete application',10,'delete_application'),
	(31,'Can add company',11,'add_company'),
	(32,'Can change company',11,'change_company'),
	(33,'Can delete company',11,'delete_company'),
	(34,'Can add membership',12,'add_membership'),
	(35,'Can change membership',12,'change_membership'),
	(36,'Can delete membership',12,'delete_membership'),
	(37,'Can add location',13,'add_location'),
	(38,'Can change location',13,'change_location'),
	(39,'Can delete location',13,'delete_location'),
	(40,'Can add employer account',14,'add_employeraccount'),
	(41,'Can change employer account',14,'change_employeraccount'),
	(42,'Can delete employer account',14,'delete_employeraccount'),
	(43,'Can add account',15,'add_account'),
	(44,'Can change account',15,'change_account'),
	(45,'Can delete account',15,'delete_account'),
	(46,'Can add employer',16,'add_employer'),
	(47,'Can change employer',16,'change_employer'),
	(48,'Can delete employer',16,'delete_employer'),
	(49,'Can add job',17,'add_job'),
	(50,'Can change job',17,'change_job'),
	(51,'Can delete job',17,'delete_job'),
	(52,'Can add job category',18,'add_jobcategory'),
	(53,'Can change job category',18,'change_jobcategory'),
	(54,'Can delete job category',18,'delete_jobcategory'),
	(55,'Can add config',19,'add_config'),
	(56,'Can change config',19,'change_config'),
	(57,'Can delete config',19,'delete_config');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$30000$09P18PZjAJgv$frm1BU7vJpr4jHvQAsOMwpFKNQ0P0BUQnkJUXqZ65NY=','2017-04-20 06:15:30.412224',1,'admin','','','admin@gmail.com',1,1,'2017-03-24 07:53:35.694748'),
	(2,'pbkdf2_sha256$30000$c4vqMfDp8MBh$beEpMFOmbXWoRfhMRuvKxRc0SYwp8OQUhF4f1PzNDZ0=',NULL,0,'jacky','','','',0,1,'2017-03-26 23:15:14.824173'),
	(3,'123',NULL,0,'jackytran','','','',0,1,'2017-04-03 23:48:39.681536'),
	(4,'pbkdf2_sha256$30000$6l84k0arUbbo$gKbLL2akl5w4hHEHESvj/pQmlsQziqjGfRD7Wgc1RE4=',NULL,0,'jackytran1','Jacky','Tran','',0,1,'2017-04-03 23:55:27.174636'),
	(5,'pbkdf2_sha256$30000$kLsEcDtedHGh$UiH00mbgH5GvjkGIPdPyrdjlaIGocd+pDAWcyMxH+CY=',NULL,0,'jackytran2','Jacky','Tran','jacky@carodev.com',0,1,'2017-04-04 02:05:10.065131'),
	(6,'pbkdf2_sha256$30000$PEtmxrk5E4WZ$VySVSNcH012XX6D2rpmTNQjnCTafb43w/EHeb+xoUaU=',NULL,0,'bill','bill','nguyen','bill@gmail.com',0,1,'2017-04-05 05:38:07.958796'),
	(7,'pbkdf2_sha256$30000$EAlHVbwgafR3$LrnYfgHcf376ECYT+V8X16N27nMA64HOPj+4/oAvUok=',NULL,0,'jackytran001','Jacky 001','Tran','jacky14@carodev.com',0,1,'2017-04-15 11:36:36.338705'),
	(8,'pbkdf2_sha256$30000$RECa3eCRJ6Z0$00N07lTIGTUcT4QLJDK/rY/A6vwBFEOOLoi5FzO/TE4=',NULL,0,'jackytran002','Jacky 002','Tran','jacky15@carodev.com',0,1,'2017-04-15 11:38:51.168712'),
	(9,'pbkdf2_sha256$30000$CYqIQWclJS4O$D8CnhF/LHgFV2JPxAcxeaHeg+it9jfYrr51s2Dm3smA=',NULL,0,'jackytran003','Jacky 003','Tran','jacky16@carodev.com',0,1,'2017-04-15 11:43:19.615816');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2017-03-26 23:15:14.965255','2','jacky',1,'[{\"added\": {}}]',3,1),
	(2,'2017-04-04 14:26:35.709761','1','CaroJobs',2,'[{\"changed\": {\"fields\": [\"client_id\", \"client_secret\"]}}]',10,1),
	(3,'2017-04-04 14:30:10.815449','1','carodev',1,'[{\"added\": {}}]',7,1),
	(4,'2017-04-05 23:11:25.180870','18','RWZAmyS1ZI2aeQ5dvTodgZwH6eAM0q',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',8,1),
	(5,'2017-04-10 23:23:53.232298','19','ZwHylh6TVNAyfkMGk9RBfPvapxExt3',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',8,1),
	(6,'2017-04-13 08:03:15.540509','20','0qSMkSCSLHCel2ql3KsxSXwxTZN2Ph',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',8,1),
	(7,'2017-04-14 03:15:26.553776','20','0qSMkSCSLHCel2ql3KsxSXwxTZN2Ph',3,'',8,1),
	(8,'2017-04-14 03:15:26.560150','19','ZwHylh6TVNAyfkMGk9RBfPvapxExt3',3,'',8,1),
	(9,'2017-04-14 03:15:26.561579','18','RWZAmyS1ZI2aeQ5dvTodgZwH6eAM0q',3,'',8,1),
	(10,'2017-04-14 03:15:26.564246','17','7d4wwNL15ZEBUF5C49Bozv8zSReaHE',3,'',8,1),
	(11,'2017-04-14 03:15:26.565788','16','7bP7cjfk9nMp4ZvytCqXf00tJMtJRN',3,'',8,1),
	(12,'2017-04-14 03:15:26.566935','15','ljT509QQ8jprxRphlDylsEvm00LJ6E',3,'',8,1),
	(13,'2017-04-14 03:15:26.568032','14','2ovjJrusr5fQCWkQkhXcB8HaQDc3d3',3,'',8,1),
	(14,'2017-04-14 03:15:26.569134','13','f9SH0T6hdtw6X0yb4rFBHNesS0RaJK',3,'',8,1),
	(15,'2017-04-14 03:15:26.570475','12','matPGB3acjHmZgTATx9B7wrtM2E2mu',3,'',8,1),
	(16,'2017-04-14 03:15:26.572610','11','DT1FrCpEgYFmb6X5FCx0VqtDJS99zv',3,'',8,1),
	(17,'2017-04-14 03:15:26.574318','10','UbIh8LjCoxOl0PMeXeizZ6LLXrLmCM',3,'',8,1),
	(18,'2017-04-14 03:15:26.575757','9','a35pb0VrW6ERGv0mLuIwEf6fouQPTe',3,'',8,1),
	(19,'2017-04-14 03:15:26.576990','8','mEyaWtU6bIwzpOGFCgaIh5p7mNV7Xk',3,'',8,1),
	(20,'2017-04-14 03:15:26.578197','7','4cyiJTH8jmQzeBL7q7DLOrH6WIqfwO',3,'',8,1),
	(21,'2017-04-14 03:15:26.579311','6','IugTrAqF6S0MtHU7odAdlUvrmYKcWA',3,'',8,1),
	(22,'2017-04-14 03:15:26.580479','5','mhLVW6epOkQQDdmBIjpIGjt04DjyjB',3,'',8,1),
	(23,'2017-04-14 03:15:26.582118','4','x5ursLTs3i1DwSGyLJH6MkVF35TV3o',3,'',8,1),
	(24,'2017-04-14 03:15:26.583305','3','JHFurHG6U3RNKc8AoSY2HnY5fMxHJJ',3,'',8,1),
	(25,'2017-04-14 03:15:26.584935','2','DKnsGnbCpuuDIK2V2T1s9YlbKOKp3t',3,'',8,1),
	(26,'2017-04-14 03:15:26.586195','1','sAFuN6QyszRh6N2vYpYSjKH8e4w9US',3,'',8,1),
	(27,'2017-04-14 03:32:22.961216','21','y5o4bEoMwXSWmFCby1khCSH5KXQRrd',3,'',8,1),
	(28,'2017-04-14 03:56:11.840384','22','KUqAHfiyqHLVYbQE8BkIqizsFkdYn0',3,'',8,1),
	(29,'2017-04-14 04:00:19.596970','23','cxXB58MysyuQjegjI8f34REW1orwon',3,'',8,1),
	(30,'2017-04-14 04:12:17.894770','24','p4sFpOBCmzwkJNXgya6XKUdXJFfWTy',3,'',8,1),
	(31,'2017-04-14 04:19:24.340275','25','woPQNOmW8kBgZSDgIQOuPz10RNh1D9',3,'',8,1),
	(32,'2017-04-14 04:40:51.889940','26','aml8ZZq3GIzXGS2Km8mv6Pm8dOkEHX',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',8,1),
	(33,'2017-04-20 08:01:38.019787','33','dKsdhRPVSMzuHFmlWBOK5RflJYmmlE',3,'',8,1),
	(34,'2017-04-20 08:01:38.022158','32','oNCuUFM15fUG7riGerekKE8RmPM05o',3,'',8,1),
	(35,'2017-04-20 08:01:38.023672','31','yWjDEFU8il7YdfIwYKGzYsH76Uiedx',3,'',8,1),
	(36,'2017-04-20 08:01:38.025326','30','LDrxImKO4sBjpAY3KZPbtyZWKA1IoE',3,'',8,1),
	(37,'2017-04-20 08:01:38.026844','29','Q2aOlthTGGIZzRKrdjLLBYly1rTljj',3,'',8,1),
	(38,'2017-04-20 08:01:38.028558','28','iysTzQfENKIPpfpmVKT79pp0cdtjRQ',3,'',8,1),
	(39,'2017-04-20 08:01:38.030302','27','W6eiiuWogGFNQgkIrZNB97eoRMomNA',3,'',8,1),
	(40,'2017-04-20 08:01:38.031622','26','aml8ZZq3GIzXGS2Km8mv6Pm8dOkEHX',3,'',8,1),
	(41,'2017-04-20 08:03:34.856699','34','Rxlhi9JDfkYl0JkrPP311yvZGQKPpZ',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',8,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(4,'auth','group'),
	(2,'auth','permission'),
	(3,'auth','user'),
	(5,'contenttypes','contenttype'),
	(8,'oauth2_provider','accesstoken'),
	(10,'oauth2_provider','application'),
	(7,'oauth2_provider','grant'),
	(9,'oauth2_provider','refreshtoken'),
	(15,'recruitment','account'),
	(11,'recruitment','company'),
	(19,'recruitment','config'),
	(16,'recruitment','employer'),
	(14,'recruitment','employeraccount'),
	(17,'recruitment','job'),
	(18,'recruitment','jobcategory'),
	(13,'recruitment','location'),
	(12,'recruitment','membership'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2017-03-24 07:52:57.268888'),
	(2,'auth','0001_initial','2017-03-24 07:52:57.854779'),
	(3,'admin','0001_initial','2017-03-24 07:52:57.960848'),
	(4,'admin','0002_logentry_remove_auto_add','2017-03-24 07:52:58.044974'),
	(5,'contenttypes','0002_remove_content_type_name','2017-03-24 07:52:58.177792'),
	(6,'auth','0002_alter_permission_name_max_length','2017-03-24 07:52:58.219559'),
	(7,'auth','0003_alter_user_email_max_length','2017-03-24 07:52:58.264985'),
	(8,'auth','0004_alter_user_username_opts','2017-03-24 07:52:58.291318'),
	(9,'auth','0005_alter_user_last_login_null','2017-03-24 07:52:58.347783'),
	(10,'auth','0006_require_contenttypes_0002','2017-03-24 07:52:58.350459'),
	(11,'auth','0007_alter_validators_add_error_messages','2017-03-24 07:52:58.370308'),
	(12,'auth','0008_alter_user_username_max_length','2017-03-24 07:52:58.418418'),
	(13,'sessions','0001_initial','2017-03-24 07:52:58.471117'),
	(14,'oauth2_provider','0001_initial','2017-03-26 22:49:39.548922'),
	(15,'oauth2_provider','0002_08_updates','2017-03-26 22:49:39.835983'),
	(16,'oauth2_provider','0003_auto_20160316_1503','2017-03-26 22:49:39.949010'),
	(17,'oauth2_provider','0004_auto_20160525_1623','2017-03-26 22:49:40.103852'),
	(22,'recruitment','0001_initial','2017-03-30 11:03:08.022677'),
	(23,'recruitment','0002_auto_20170414_2352','2017-04-14 23:53:52.974905'),
	(24,'recruitment','0003_auto_20170418_0721','2017-04-18 07:22:43.962005'),
	(26,'recruitment','0004_config','2017-04-20 05:00:09.752448'),
	(27,'recruitment','0005_auto_20170421_0739','2017-04-21 07:39:34.187943');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('1vkntm4mxdh0866euxgr3upcudiq0sqs','MGFiOTE4MzM4NDUzZmNjOTA3ZTNiZDZmYWE4NTZkOGNmOWY0OWRlZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YTcwYTQwZDRmMjNjODBhMDZmZWUzN2MzODZhZWNkMmMxNTkzZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-04 06:15:30.414591'),
	('bbsjf6pu5sdfv5877peqhy0gdh17p4cy','MGFiOTE4MzM4NDUzZmNjOTA3ZTNiZDZmYWE4NTZkOGNmOWY0OWRlZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YTcwYTQwZDRmMjNjODBhMDZmZWUzN2MzODZhZWNkMmMxNTkzZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-24 23:23:34.903686'),
	('j8r63hiw8rbaqamdw3rq1brgednc0qpc','MGFiOTE4MzM4NDUzZmNjOTA3ZTNiZDZmYWE4NTZkOGNmOWY0OWRlZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YTcwYTQwZDRmMjNjODBhMDZmZWUzN2MzODZhZWNkMmMxNTkzZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-19 02:19:36.715207'),
	('mg53k3w78b4bsab0gm6ei86x9ktfnmjf','MGFiOTE4MzM4NDUzZmNjOTA3ZTNiZDZmYWE4NTZkOGNmOWY0OWRlZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YTcwYTQwZDRmMjNjODBhMDZmZWUzN2MzODZhZWNkMmMxNTkzZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-09 22:52:54.319963'),
	('nila02ixwqesbcc66gv2zgu7x01bnsbz','OGRkMzQ4MDQwZmM0NzIyYTZhMWE0NmJiMGM4MTI5ZGY1N2IxOTIxYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0YTcwYTQwZDRmMjNjODBhMDZmZWUzN2MzODZhZWNkMmMxNTkzZWQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-04-18 15:14:16.952756');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth2_provider_accesstoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;

CREATE TABLE `oauth2_provider_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`),
  KEY `oauth2_application_id_b22886e1_fk_oauth2_provider_application_id` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_application_id_b22886e1_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;

INSERT INTO `oauth2_provider_accesstoken` (`id`, `token`, `expires`, `scope`, `application_id`, `user_id`)
VALUES
	(34,'Rxlhi9JDfkYl0JkrPP311yvZGQKPpZ','2017-06-30 18:02:07.000000','read write',1,5);

/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth2_provider_application
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth2_provider_application`;

CREATE TABLE `oauth2_provider_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_9d667c2b` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;

INSERT INTO `oauth2_provider_application` (`id`, `client_id`, `redirect_uris`, `client_type`, `authorization_grant_type`, `client_secret`, `name`, `user_id`, `skip_authorization`)
VALUES
	(1,'carojobs','','confidential','password','carodev@carojobs','CaroJobs',1,0);

/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth2_provider_grant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth2_provider_grant`;

CREATE TABLE `oauth2_provider_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`),
  KEY `oauth2_application_id_81923564_fk_oauth2_provider_application_id` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_application_id_81923564_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;

INSERT INTO `oauth2_provider_grant` (`id`, `code`, `expires`, `redirect_uri`, `scope`, `application_id`, `user_id`)
VALUES
	(1,'carodev','2017-04-30 00:00:00.000000','http://127.0.0.1:8000/','',1,5);

/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth2_provider_refreshtoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;

CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_d090daa4_uniq` (`token`),
  KEY `oauth2_application_id_2d1c311b_fk_oauth2_provider_application_id` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_application_id_2d1c311b_fk_oauth2_provider_application_id` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `oauth_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;

INSERT INTO `oauth2_provider_refreshtoken` (`id`, `token`, `access_token_id`, `application_id`, `user_id`)
VALUES
	(34,'Y92jBYfYTeU7eAnS0WSbj8PrhzrEG5',34,1,5);

/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_account`;

CREATE TABLE `recruitment_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `number_employee` int(11) NOT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `post_code` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `billing_address1` varchar(200) DEFAULT NULL,
  `billing_address2` varchar(200) DEFAULT NULL,
  `billing_state` varchar(200) DEFAULT NULL,
  `billing_city` varchar(200) DEFAULT NULL,
  `billing_post_code` varchar(200) DEFAULT NULL,
  `billing_country` varchar(200) DEFAULT NULL,
  `posts` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment__membership_id_f12c6b46_fk_recruitment_membership_id` (`membership_id`),
  CONSTRAINT `recruitment__membership_id_f12c6b46_fk_recruitment_membership_id` FOREIGN KEY (`membership_id`) REFERENCES `recruitment_membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_account` WRITE;
/*!40000 ALTER TABLE `recruitment_account` DISABLE KEYS */;

INSERT INTO `recruitment_account` (`id`, `created_date`, `deleted`, `name`, `logo`, `description`, `email`, `phone`, `industry`, `number_employee`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `billing_address1`, `billing_address2`, `billing_state`, `billing_city`, `billing_post_code`, `billing_country`, `posts`, `users`, `views`, `membership_id`)
VALUES
	(5,'2017-03-31 00:06:56.920623',0,'CaroDev','B','Bill Nguyen','bill@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(6,'2017-03-31 06:00:06.094844',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(7,'2017-03-31 06:03:49.289795',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(8,'2017-03-31 06:03:51.569454',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(9,'2017-03-31 06:06:28.164964',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(10,'2017-03-31 06:11:34.601933',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(11,'2017-03-31 06:13:39.455118',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(12,'2017-03-31 06:15:00.606258',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(13,'2017-03-31 06:15:27.641744',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(14,'2017-03-31 06:16:26.356076',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(15,'2017-04-03 23:48:39.706169',0,'CaroDev','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(16,'2017-04-03 23:55:27.336824',0,'CaroDev','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(17,'2017-04-04 02:05:10.256552',0,'CaroDev','C','CaroJobs','info@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(18,'2017-04-05 05:38:08.139476',0,'BSD','N','bill nguyen','bill@gmail.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1),
	(19,'2017-04-15 11:36:36.558317',0,'CaroDev001','N','Jacky 001 Tran','jacky14@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1);

/*!40000 ALTER TABLE `recruitment_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_company`;

CREATE TABLE `recruitment_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `number_employee` int(11) NOT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `post_code` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `billing_address1` varchar(200) DEFAULT NULL,
  `billing_address2` varchar(200) DEFAULT NULL,
  `billing_state` varchar(200) DEFAULT NULL,
  `billing_city` varchar(200) DEFAULT NULL,
  `billing_post_code` varchar(200) DEFAULT NULL,
  `billing_country` varchar(200) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_compan_account_id_51b020a0_fk_recruitment_account_id` (`account_id`),
  CONSTRAINT `recruitment_compan_account_id_51b020a0_fk_recruitment_account_id` FOREIGN KEY (`account_id`) REFERENCES `recruitment_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_company` WRITE;
/*!40000 ALTER TABLE `recruitment_company` DISABLE KEYS */;

INSERT INTO `recruitment_company` (`id`, `created_date`, `deleted`, `name`, `logo`, `description`, `email`, `phone`, `industry`, `number_employee`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `billing_address1`, `billing_address2`, `billing_state`, `billing_city`, `billing_post_code`, `billing_country`, `account_id`)
VALUES
	(2,'2017-03-31 00:06:56.967806',0,'CaroDev','B','Bill Nguyen','bill@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),
	(3,'2017-03-31 06:00:06.131545',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6),
	(4,'2017-03-31 06:03:49.327630',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7),
	(5,'2017-03-31 06:03:51.602109',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8),
	(6,'2017-03-31 06:06:28.199993',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9),
	(7,'2017-03-31 06:11:34.636889',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),
	(8,'2017-03-31 06:13:39.492605',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11),
	(9,'2017-03-31 06:15:00.642935',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12),
	(10,'2017-03-31 06:15:27.673991',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13),
	(11,'2017-03-31 06:16:26.384662',0,'CaroDev2','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14),
	(12,'2017-04-03 23:48:39.713336',0,'CaroDev','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15),
	(13,'2017-04-03 23:55:27.371327',0,'CaroDev','J','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16),
	(14,'2017-04-04 02:05:10.288145',0,'CaroDev2','C','Jacky Tran','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17),
	(15,'2017-04-05 05:38:08.169594',0,'BSD','N','bill nguyen','bill@gmail.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18),
	(16,'2017-04-11 23:49:26.514582',0,'UpCRM','Up','UpCRM up up up','support@upcrm.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15),
	(17,'2017-04-12 10:37:07.770200',1,'CaroDev2','CD','Jacky Tran 14 Clone','jacky@carodev.com','0972014011',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17),
	(18,'2017-04-15 11:36:36.590386',0,'CaroDev001','N','Jacky 001 Tran','jacky14@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19),
	(19,'2017-04-16 13:33:13.425981',0,'CaroDev002','/2017/04/16/jacky.jpg','oursourcing','support@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17);

/*!40000 ALTER TABLE `recruitment_company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_config`;

CREATE TABLE `recruitment_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_type` varchar(200) NOT NULL,
  `config_label` varchar(200) DEFAULT NULL,
  `config_value` longtext NOT NULL,
  `config_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_config` WRITE;
/*!40000 ALTER TABLE `recruitment_config` DISABLE KEYS */;

INSERT INTO `recruitment_config` (`id`, `config_type`, `config_label`, `config_value`, `config_default`)
VALUES
	(1,'employment_types','FullTime','FullTime',0),
	(2,'employment_types','PartTime','PartTime',0),
	(3,'currencies','USD','USD',0),
	(4,'currencies','VND','VND',0),
	(5,'salary_types','Monthly','Monthly',0),
	(6,'salary_types','Daily','Daily',0);

/*!40000 ALTER TABLE `recruitment_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_employer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_employer`;

CREATE TABLE `recruitment_employer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recruitment_employer_email_693e64de_uniq` (`email`),
  KEY `recruitment_employer_user_id_8ec5dd2e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `recruitment_employer_user_id_8ec5dd2e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_employer` WRITE;
/*!40000 ALTER TABLE `recruitment_employer` DISABLE KEYS */;

INSERT INTO `recruitment_employer` (`id`, `created_date`, `deleted`, `name`, `avatar`, `email`, `status`, `first_name`, `last_name`, `phone`, `user_id`)
VALUES
	(5,'2017-03-31 00:06:56.957588',0,'Bill Nguyen','J','jacky1@carodev.com','','Jacky','Tran','0972014011',1),
	(6,'2017-03-31 06:00:06.115475',0,'Jacky Tran','J','jacky2@carodev.com','','Jacky','Tran','0972014011',1),
	(7,'2017-03-31 06:03:49.314491',0,'Jacky Tran','J','jacky3@carodev.com','','Jacky','Tran','0972014011',1),
	(8,'2017-03-31 06:03:51.576770',0,'Jacky Tran','J','jacky4@carodev.com','','Jacky','Tran','0972014011',1),
	(9,'2017-03-31 06:06:28.195903',0,'Jacky Tran','J','jacky5@carodev.com','','Jacky','Tran','0972014011',1),
	(10,'2017-03-31 06:11:34.632739',0,'Jacky Tran','J','jacky6@carodev.com','','Jacky','Tran','0972014011',1),
	(11,'2017-03-31 06:13:39.458737',0,'Jacky Tran','J','jacky7@carodev.com','','Jacky','Tran','0972014011',1),
	(12,'2017-03-31 06:15:00.622916',0,'Jacky Tran','J','jacky8@carodev.com','','Jacky','Tran','0972014011',1),
	(13,'2017-03-31 06:15:27.653650',0,'Jacky Tran','J','jacky9@carodev.com','','Jacky','Tran','0972014011',1),
	(14,'2017-03-31 06:16:26.366072',0,'Jacky Tran','J','jacky10@carodev.com','','Jacky','Tran','0972014011',1),
	(15,'2017-04-03 23:48:39.709491',0,'Jacky Tran','J','jacky11@carodev.com','','Jacky','Tran','0972014011',3),
	(16,'2017-04-03 23:55:27.367245',0,'Jacky Tran','J','jacky12@carodev.com','','Jacky','Tran','0972014011',4),
	(17,'2017-04-04 02:05:10.278620',0,'Jacky Tran','/2017/04/11/jacky.jpg','jacky13@carodev.com','','Jacky','Tran','0972014011',5),
	(18,'2017-04-05 05:38:08.163747',0,'bill nguyen','N','bill@gmail.com','','bill','nguyen','0909090909',6),
	(19,'2017-04-15 11:36:36.584753',0,'Jacky 001 Tran','N','jacky14@carodev.com','','Jacky 001','Tran','0909090909',7),
	(20,'2017-04-15 11:38:51.365619',0,'','N','jacky15@carodev.com','','Jacky 002','Tran','0909090909',8),
	(21,'2017-04-15 11:43:19.806775',0,'','N','jacky16@carodev.com','','Jacky 003','Tran','0909090909',9);

/*!40000 ALTER TABLE `recruitment_employer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_employeraccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_employeraccount`;

CREATE TABLE `recruitment_employeraccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `role` varchar(200) NOT NULL,
  `account_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_employ_account_id_111cb71a_fk_recruitment_account_id` (`account_id`),
  KEY `recruitment_empl_employer_id_02379d57_fk_recruitment_employer_id` (`employer_id`),
  CONSTRAINT `recruitment_empl_employer_id_02379d57_fk_recruitment_employer_id` FOREIGN KEY (`employer_id`) REFERENCES `recruitment_employer` (`id`),
  CONSTRAINT `recruitment_employ_account_id_111cb71a_fk_recruitment_account_id` FOREIGN KEY (`account_id`) REFERENCES `recruitment_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_employeraccount` WRITE;
/*!40000 ALTER TABLE `recruitment_employeraccount` DISABLE KEYS */;

INSERT INTO `recruitment_employeraccount` (`id`, `created_date`, `deleted`, `role`, `account_id`, `employer_id`)
VALUES
	(3,'2017-03-31 00:06:56.963924',0,'Administrator',5,5),
	(4,'2017-03-31 06:00:06.128941',0,'Administrator',6,6),
	(5,'2017-03-31 06:03:49.325546',0,'Administrator',7,7),
	(6,'2017-03-31 06:03:51.590472',0,'Administrator',8,8),
	(7,'2017-03-31 06:06:28.197887',0,'Administrator',9,9),
	(8,'2017-03-31 06:11:34.634949',0,'Administrator',10,10),
	(9,'2017-03-31 06:13:39.471896',0,'Administrator',11,11),
	(10,'2017-03-31 06:15:00.635032',0,'Administrator',12,12),
	(11,'2017-03-31 06:15:27.671460',0,'Administrator',13,13),
	(12,'2017-03-31 06:16:26.377408',0,'Administrator',14,14),
	(13,'2017-04-03 23:48:39.711352',0,'Administrator',15,15),
	(14,'2017-04-03 23:55:27.369334',0,'Administrator',16,16),
	(15,'2017-04-04 02:05:10.285865',0,'Administrator',17,17),
	(16,'2017-04-05 05:38:08.166683',0,'Administrator',18,18),
	(17,'2017-04-15 11:36:36.587376',0,'Administrator',19,19),
	(18,'2017-04-15 11:43:19.822311',0,'Administrator',17,21);

/*!40000 ALTER TABLE `recruitment_employeraccount` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_job`;

CREATE TABLE `recruitment_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `summary_1` varchar(200) NOT NULL,
  `summary_2` varchar(200) NOT NULL,
  `summary_3` varchar(200) NOT NULL,
  `location_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `salary_max` int(11) NOT NULL,
  `salary_currency` varchar(200) NOT NULL,
  `salary_type` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_j_category_id_664916ec_fk_recruitment_jobcategory_id` (`category_id`),
  KEY `recruitment_job_company_id_11cbc981_fk_recruitment_company_id` (`company_id`),
  KEY `recruitment_job_location_id_545f3f8d_uniq` (`location_id`),
  CONSTRAINT `recruitment_j_category_id_664916ec_fk_recruitment_jobcategory_id` FOREIGN KEY (`category_id`) REFERENCES `recruitment_jobcategory` (`id`),
  CONSTRAINT `recruitment_job_company_id_11cbc981_fk_recruitment_company_id` FOREIGN KEY (`company_id`) REFERENCES `recruitment_company` (`id`),
  CONSTRAINT `recruitment_job_location_id_545f3f8d_fk_recruitment_location_id` FOREIGN KEY (`location_id`) REFERENCES `recruitment_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_job` WRITE;
/*!40000 ALTER TABLE `recruitment_job` DISABLE KEYS */;

INSERT INTO `recruitment_job` (`id`, `created_date`, `deleted`, `name`, `detail`, `summary_1`, `summary_2`, `summary_3`, `location_id`, `type`, `salary_min`, `salary_max`, `salary_currency`, `salary_type`, `category_id`, `company_id`)
VALUES
	(1,'2017-04-20 08:35:03.608276',0,'Software Engineer','tuyen dung nhan tai dat viet','tuyen dung nhan tai dat viet','tuyen dung nhan tai dat viet','tuyen dung nhan tai dat viet',1,'FullTime',2000,4000,'USD','Monthly',1,14);

/*!40000 ALTER TABLE `recruitment_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_jobcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_jobcategory`;

CREATE TABLE `recruitment_jobcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_jobcategory` WRITE;
/*!40000 ALTER TABLE `recruitment_jobcategory` DISABLE KEYS */;

INSERT INTO `recruitment_jobcategory` (`id`, `created_date`, `deleted`, `name`, `slug`)
VALUES
	(1,'2017-04-18 20:52:15.000000',0,'Software','software'),
	(2,'2017-04-18 20:52:32.000000',0,'Accounting','accounting');

/*!40000 ALTER TABLE `recruitment_jobcategory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_location`;

CREATE TABLE `recruitment_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `post_code` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_locati_company_id_62c3e532_fk_recruitment_company_id` (`company_id`),
  CONSTRAINT `recruitment_locati_company_id_62c3e532_fk_recruitment_company_id` FOREIGN KEY (`company_id`) REFERENCES `recruitment_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_location` WRITE;
/*!40000 ALTER TABLE `recruitment_location` DISABLE KEYS */;

INSERT INTO `recruitment_location` (`id`, `created_date`, `deleted`, `name`, `email`, `phone`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `company_id`)
VALUES
	(1,'2017-03-31 07:18:03.108948',0,'BlueSeed','jacky@carodev.com','0972014011','12 Ton Dan','Quan 4','HCM','Ho Chi Minh','700000','VN',14),
	(2,'2017-04-19 06:19:08.589708',0,'Head Office','admin@carodev.com','0909090909','401 Cach Mang Thang 8','Ward 13, District 10','HCM','Ho Chi Minh','700000','Viet Nam',19),
	(3,'2017-04-19 06:51:45.221721',0,'Chi nhanh Phu Nhuan','support2@carodev.com','0909090909','198 Phan Dinh Phung','Phuong 2, Quan Phu Nhuan','HCM','Ho Chi Minh','700000','Viet Nam',19),
	(4,'2017-04-19 06:53:19.310528',0,'Chi nhanh quan 1','quan1@carodev.com','0909090909','227 Nguyen Van Cu','Phuong 1, Quan 5','HCM','Ho Chi Minh','700000','Viet Nam',19),
	(5,'2017-04-19 06:55:07.505474',0,'Chi nhanh quan 5','quan5@carodev.com','0909090909','227 Nguyen Van Cu','Phuong 1, Quan 5','HCM','Ho Chi Minh','700000','Viet Nam',19),
	(6,'2017-04-19 09:21:10.384725',0,'Chi nhanh quan 10','billgay@carodev.com','0909090909','200 CMT8','Phuong 4, Quan 3','HCM','Ho Chi Minh','700000','Viet Nam',19),
	(7,'2017-04-19 09:33:04.081299',0,'chi nhanh quan4','jacky@carodev.com','0909090909','12 ton dan','phuong 13, quan 4','hcm','ho chi minh','700000','vietnam',19),
	(8,'2017-04-19 10:20:16.818043',0,'chi nhanh brvt','hungtd@blueseed.tv','0909090909','chau pha','tan thanh','br','ba ria','640000','vietnam',19),
	(9,'2017-04-19 10:30:18.430309',0,'chi nhanh can tho','cantho@carodev.com','09123123123','can tho','can tho','ct','ct','99999','vietnam',19),
	(10,'2017-04-20 00:01:02.434125',0,'blueseed ha noi','hanoi@blueseed.tv','0912121212','12122','dasd asdasd','123','hcm','900000','vietnam',14),
	(11,'2017-04-20 00:01:56.598597',0,'head office','support@blueseed.tv','092423423','qw asda','qweqw asdasd','adasd','asdas','9000','vietnam',14),
	(12,'2017-04-20 00:04:43.273478',0,'adasdasd','asdasd@adasd.vm','0909090909','asdasd','asdasdasd','asd','asd','asd','asd',14),
	(13,'2017-04-20 00:05:58.222426',0,'asdasd','asdasd@ads.com','asdasd','asdasd','asdad','asdad','asdad','asdad','asdasdad',14),
	(14,'2017-04-20 00:07:38.140347',0,'asdasdasd','asdasd@asd.com','asdasd','asdasd','asdasd','asdasd','asdasd','asdasd','asdasd',14),
	(15,'2017-04-20 00:10:21.308166',0,'location 001','l@carodev.com','0987665555','123 qwe','p10, q3','hcm','ho chi minh','9999','vietnam',14),
	(16,'2017-04-20 03:40:43.878641',0,'location 002','002@carodev.com','002002002','002','002','002','002','002','002',14),
	(17,'2017-04-20 04:00:46.728997',0,'location 003','003@carodev.com','004','003','003','003','003','003','003',14),
	(18,'2017-04-20 04:11:23.696962',0,'location 004','004@carodv.com','004','004','004','004','004','004','004',14);

/*!40000 ALTER TABLE `recruitment_location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_membership
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_membership`;

CREATE TABLE `recruitment_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `posts` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `rules` longtext NOT NULL,
  `is_default` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_membership` WRITE;
/*!40000 ALTER TABLE `recruitment_membership` DISABLE KEYS */;

INSERT INTO `recruitment_membership` (`id`, `created_date`, `deleted`, `name`, `description`, `posts`, `users`, `views`, `rules`, `is_default`)
VALUES
	(1,'2017-03-30 11:03:56.903091',0,'Register','Register Users',0,0,0,'Register Users Require',0),
	(2,'2017-03-31 03:40:58.793918',0,'VIP','VIP Users',0,0,0,'VIP User Require',0);

/*!40000 ALTER TABLE `recruitment_membership` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
