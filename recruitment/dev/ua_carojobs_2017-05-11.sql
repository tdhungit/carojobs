# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: ua_carojobs
# Generation Time: 2017-05-11 03:19:28 +0000
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add permission',3,'add_permission'),
	(8,'Can change permission',3,'change_permission'),
	(9,'Can delete permission',3,'delete_permission'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add membership',7,'add_membership'),
	(20,'Can change membership',7,'change_membership'),
	(21,'Can delete membership',7,'delete_membership'),
	(22,'Can add account',8,'add_account'),
	(23,'Can change account',8,'change_account'),
	(24,'Can delete account',8,'delete_account'),
	(25,'Can add employer account',9,'add_employeraccount'),
	(26,'Can change employer account',9,'change_employeraccount'),
	(27,'Can delete employer account',9,'delete_employeraccount'),
	(28,'Can add config',10,'add_config'),
	(29,'Can change config',10,'change_config'),
	(30,'Can delete config',10,'delete_config'),
	(31,'Can add location',11,'add_location'),
	(32,'Can change location',11,'change_location'),
	(33,'Can delete location',11,'delete_location'),
	(34,'Can add company',12,'add_company'),
	(35,'Can change company',12,'change_company'),
	(36,'Can delete company',12,'delete_company'),
	(37,'Can add job',13,'add_job'),
	(38,'Can change job',13,'change_job'),
	(39,'Can delete job',13,'delete_job'),
	(40,'Can add job category',14,'add_jobcategory'),
	(41,'Can change job category',14,'change_jobcategory'),
	(42,'Can delete job category',14,'delete_jobcategory'),
	(43,'Can add employer',15,'add_employer'),
	(44,'Can change employer',15,'change_employer'),
	(45,'Can delete employer',15,'delete_employer'),
	(46,'Can add refresh token',16,'add_refreshtoken'),
	(47,'Can change refresh token',16,'change_refreshtoken'),
	(48,'Can delete refresh token',16,'delete_refreshtoken'),
	(49,'Can add grant',17,'add_grant'),
	(50,'Can change grant',17,'change_grant'),
	(51,'Can delete grant',17,'delete_grant'),
	(52,'Can add application',18,'add_application'),
	(53,'Can change application',18,'change_application'),
	(54,'Can delete application',18,'delete_application'),
	(55,'Can add access token',19,'add_accesstoken'),
	(56,'Can change access token',19,'change_accesstoken'),
	(57,'Can delete access token',19,'delete_accesstoken'),
	(58,'Can add candidate',20,'add_candidate'),
	(59,'Can change candidate',20,'change_candidate'),
	(60,'Can delete candidate',20,'delete_candidate'),
	(61,'Can add job apply',21,'add_jobapply'),
	(62,'Can change job apply',21,'change_jobapply'),
	(63,'Can delete job apply',21,'delete_jobapply'),
	(64,'Can add resume',22,'add_resume'),
	(65,'Can change resume',22,'change_resume'),
	(66,'Can delete resume',22,'delete_resume'),
	(67,'Can add education',23,'add_education'),
	(68,'Can change education',23,'change_education'),
	(69,'Can delete education',23,'delete_education'),
	(70,'Can add experience',24,'add_experience'),
	(71,'Can change experience',24,'change_experience'),
	(72,'Can delete experience',24,'delete_experience'),
	(73,'Can add experience skill',25,'add_experienceskill'),
	(74,'Can change experience skill',25,'change_experienceskill'),
	(75,'Can delete experience skill',25,'delete_experienceskill');

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
	(1,'pbkdf2_sha256$36000$DU5HxaJecLtW$p6ZocQlTv7ZJ1qHUmhvEF6fObM6JPvP8Lxj//CzfD3w=','2017-05-03 07:47:30.913223',1,'admin','','','admin@gmail.com',1,1,'2017-05-03 07:47:19.037206'),
	(2,'pbkdf2_sha256$36000$k2WcsfGK8GvV$TvpePfOIeicQbkzqnHij04U0zZqbT+NzZq3IxgPaya8=',NULL,0,'jacky','Jacky','Tran','jacky@carodev.com',0,1,'2017-05-03 08:42:42.360402'),
	(3,'pbkdf2_sha256$36000$Yh8h65DtNJhF$qJfl3lblk6Wt1nMDKkMnqqAArbNySm5u5mix4nhR+ts=',NULL,0,'jacky2','Jacky','Tran','jacky@carodev.com',0,1,'2017-05-03 08:45:20.453188'),
	(4,'pbkdf2_sha256$36000$IvZMHP1oDN43$gsmdCGFFE2iNIn8TMuQfeo/hrlUGx2XE2XVxI7CprHM=',NULL,0,'candidate1','candidate','001','candidate1@gmail.com',0,1,'2017-05-05 08:55:16.042522');

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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2017-05-03 07:48:34.577759','1','carojobsforemployer',1,'[{\"added\": {}}]',18,1),
	(2,'2017-05-03 09:04:28.225561','1','JobCategory object',1,'[{\"added\": {}}]',14,1),
	(3,'2017-05-03 09:04:47.756135','2','JobCategory object',1,'[{\"added\": {}}]',14,1),
	(4,'2017-05-03 09:12:46.499185','1','Config object',1,'[{\"added\": {}}]',10,1),
	(5,'2017-05-03 09:13:06.394153','2','Config object',1,'[{\"added\": {}}]',10,1),
	(6,'2017-05-03 09:13:38.093943','3','Config object',1,'[{\"added\": {}}]',10,1),
	(7,'2017-05-03 09:13:51.465269','4','Config object',1,'[{\"added\": {}}]',10,1),
	(8,'2017-05-03 09:18:40.981933','5','Config object',1,'[{\"added\": {}}]',10,1),
	(9,'2017-05-03 09:18:53.736929','6','Config object',1,'[{\"added\": {}}]',10,1),
	(10,'2017-05-03 09:36:02.018308','2','JobCategory object',2,'[{\"changed\": {\"fields\": [\"job_count\"]}}]',14,1),
	(11,'2017-05-03 09:36:06.986938','1','JobCategory object',2,'[{\"changed\": {\"fields\": [\"job_count\"]}}]',14,1),
	(12,'2017-05-10 02:37:18.367232','3','lmo0ftn64f0Q1kQLhxnRTI2XEx9SpB',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',19,1),
	(13,'2017-05-10 03:48:49.162836','4','hkBLzGYnglqblVgu1lroihG8RQl8iN',2,'[{\"changed\": {\"fields\": [\"expires\"]}}]',19,1);

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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(2,'auth','group'),
	(3,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(19,'oauth2_provider','accesstoken'),
	(18,'oauth2_provider','application'),
	(17,'oauth2_provider','grant'),
	(16,'oauth2_provider','refreshtoken'),
	(8,'recruitment','account'),
	(20,'recruitment','candidate'),
	(12,'recruitment','company'),
	(10,'recruitment','config'),
	(23,'recruitment','education'),
	(15,'recruitment','employer'),
	(9,'recruitment','employeraccount'),
	(24,'recruitment','experience'),
	(25,'recruitment','experienceskill'),
	(13,'recruitment','job'),
	(21,'recruitment','jobapply'),
	(14,'recruitment','jobcategory'),
	(11,'recruitment','location'),
	(7,'recruitment','membership'),
	(22,'recruitment','resume'),
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
	(1,'contenttypes','0001_initial','2017-05-03 07:19:56.691462'),
	(2,'auth','0001_initial','2017-05-03 07:20:00.054606'),
	(3,'admin','0001_initial','2017-05-03 07:20:00.699763'),
	(4,'admin','0002_logentry_remove_auto_add','2017-05-03 07:20:01.061425'),
	(5,'contenttypes','0002_remove_content_type_name','2017-05-03 07:20:01.392425'),
	(6,'auth','0002_alter_permission_name_max_length','2017-05-03 07:20:01.539791'),
	(7,'auth','0003_alter_user_email_max_length','2017-05-03 07:20:01.673787'),
	(8,'auth','0004_alter_user_username_opts','2017-05-03 07:20:01.688119'),
	(9,'auth','0005_alter_user_last_login_null','2017-05-03 07:20:01.832938'),
	(10,'auth','0006_require_contenttypes_0002','2017-05-03 07:20:01.835440'),
	(11,'auth','0007_alter_validators_add_error_messages','2017-05-03 07:20:01.849265'),
	(12,'auth','0008_alter_user_username_max_length','2017-05-03 07:20:02.009551'),
	(13,'oauth2_provider','0001_initial','2017-05-03 07:20:04.616055'),
	(14,'oauth2_provider','0002_08_updates','2017-05-03 07:20:05.891692'),
	(15,'oauth2_provider','0003_auto_20160316_1503','2017-05-03 07:20:06.466736'),
	(16,'oauth2_provider','0004_auto_20160525_1623','2017-05-03 07:20:07.535564'),
	(17,'recruitment','0001_initial','2017-05-03 07:20:10.275112'),
	(18,'recruitment','0002_auto_20170414_2352','2017-05-03 07:20:10.406000'),
	(19,'recruitment','0003_auto_20170418_0721','2017-05-03 07:20:11.299453'),
	(20,'recruitment','0004_config','2017-05-03 07:20:11.464235'),
	(21,'recruitment','0005_auto_20170421_0739','2017-05-03 07:20:12.062818'),
	(22,'recruitment','0006_auto_20170503_0653','2017-05-03 07:20:12.671698'),
	(23,'sessions','0001_initial','2017-05-03 07:20:13.076912'),
	(24,'recruitment','0007_auto_20170505_0714','2017-05-05 07:15:20.278905'),
	(25,'recruitment','0008_auto_20170505_0853','2017-05-05 08:54:03.702681'),
	(26,'recruitment','0009_auto_20170508_0543','2017-05-08 05:43:38.426235'),
	(27,'recruitment','0010_auto_20170509_0430','2017-05-09 04:30:37.971680'),
	(28,'recruitment','0011_experienceskill','2017-05-09 08:24:13.681851'),
	(29,'recruitment','0012_experienceskill_resume','2017-05-10 02:58:46.679042');

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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('dujg70hsac50s1yhxpdhnxjrj0zgi8b9','OTU3ZTM0ZjBjNDg0NjZlMzViNDkxN2ZhMmUxMzQxOGM0NjE1Y2UwODp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiYjQ2M2JjYWM3MGQzZWNhOWRmYTQwZjM5MTdhMWE2NGRjNzE0ZTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-17 07:47:30.957206');

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
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;

INSERT INTO `oauth2_provider_accesstoken` (`id`, `token`, `expires`, `scope`, `application_id`, `user_id`)
VALUES
	(1,'7VnV9WiqUtYLRtASzOk4ZShOe3mnLi','2017-05-03 18:45:27.419433','read write',1,3),
	(2,'mt7NGbtLmS22JtYDLsGbz4UZ51VsDl','2017-05-04 18:54:18.559128','read write',1,3),
	(3,'lmo0ftn64f0Q1kQLhxnRTI2XEx9SpB','2017-06-30 12:36:30.000000','read write',1,4),
	(4,'hkBLzGYnglqblVgu1lroihG8RQl8iN','2017-05-31 13:47:02.000000','read write',1,4);

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
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;

INSERT INTO `oauth2_provider_application` (`id`, `client_id`, `redirect_uris`, `client_type`, `authorization_grant_type`, `client_secret`, `name`, `user_id`, `skip_authorization`)
VALUES
	(1,'carojobs','','confidential','password','carodev@carojobs','carojobsforemployer',1,0);

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
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;

INSERT INTO `oauth2_provider_refreshtoken` (`id`, `token`, `access_token_id`, `application_id`, `user_id`)
VALUES
	(1,'mPD3UXHsPaNnjU0FUVAmE08DzJ9BpS',1,1,3),
	(2,'Ra0WMLkW5HDvDHuBfPIPzkA6RXVtmV',2,1,3),
	(3,'6UINsc1TpKRkBGuFRvLVsninquVeJ7',3,1,4),
	(4,'X0sAXQDS8OeHid1nQ6ulXfetybLUik',4,1,4);

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
  KEY `recruitment_account_membership_id_f12c6b46_fk_recruitme` (`membership_id`),
  CONSTRAINT `recruitment_account_membership_id_f12c6b46_fk_recruitme` FOREIGN KEY (`membership_id`) REFERENCES `recruitment_membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_account` WRITE;
/*!40000 ALTER TABLE `recruitment_account` DISABLE KEYS */;

INSERT INTO `recruitment_account` (`id`, `created_date`, `deleted`, `name`, `logo`, `description`, `email`, `phone`, `industry`, `number_employee`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `billing_address1`, `billing_address2`, `billing_state`, `billing_city`, `billing_post_code`, `billing_country`, `posts`, `users`, `views`, `membership_id`)
VALUES
	(2,'2017-05-03 08:45:20.631601',0,'CaroDev','N','Jacky Tran','jacky@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1);

/*!40000 ALTER TABLE `recruitment_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_candidate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_candidate`;

CREATE TABLE `recruitment_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `status` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `alternate_phone` varchar(200) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `post_code` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_candidate_user_id_0f3a2532_fk_auth_user_id` (`user_id`),
  CONSTRAINT `recruitment_candidate_user_id_0f3a2532_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_candidate` WRITE;
/*!40000 ALTER TABLE `recruitment_candidate` DISABLE KEYS */;

INSERT INTO `recruitment_candidate` (`id`, `created_date`, `deleted`, `name`, `first_name`, `last_name`, `avatar`, `email`, `status`, `phone`, `alternate_phone`, `birthday`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `user_id`)
VALUES
	(1,'2017-05-05 08:55:16.282597',0,'candidate 001','candidate','001','/2017/05/05/logo.png','candidate1@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4);

/*!40000 ALTER TABLE `recruitment_candidate` ENABLE KEYS */;
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
  `job_count` int(10) unsigned NOT NULL,
  `lnk_facebook` varchar(200) DEFAULT NULL,
  `lnk_linkedin` varchar(200) DEFAULT NULL,
  `lnk_tumblr` varchar(200) DEFAULT NULL,
  `lnk_twitter` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_company_account_id_51b020a0_fk_recruitme` (`account_id`),
  CONSTRAINT `recruitment_company_account_id_51b020a0_fk_recruitme` FOREIGN KEY (`account_id`) REFERENCES `recruitment_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_company` WRITE;
/*!40000 ALTER TABLE `recruitment_company` DISABLE KEYS */;

INSERT INTO `recruitment_company` (`id`, `created_date`, `deleted`, `name`, `logo`, `description`, `email`, `phone`, `industry`, `number_employee`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `billing_address1`, `billing_address2`, `billing_state`, `billing_city`, `billing_post_code`, `billing_country`, `account_id`, `job_count`, `lnk_facebook`, `lnk_linkedin`, `lnk_tumblr`, `lnk_twitter`, `website`)
VALUES
	(1,'2017-05-03 08:45:20.640350',0,'CaroDev','N','Jacky Tran','jacky@carodev.com','0909090909',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,NULL,NULL,NULL,NULL);

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
	(3,'salary_types','Monthly','Monthly',0),
	(4,'salary_types','Daily','Daily',0),
	(5,'currencies','USD','USD',0),
	(6,'currencies','VND','VND',0);

/*!40000 ALTER TABLE `recruitment_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_education
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_education`;

CREATE TABLE `recruitment_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `degree` varchar(200) DEFAULT NULL,
  `description` longtext NOT NULL,
  `resume_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_educatio_resume_id_7c80c066_fk_recruitme` (`resume_id`),
  CONSTRAINT `recruitment_educatio_resume_id_7c80c066_fk_recruitme` FOREIGN KEY (`resume_id`) REFERENCES `recruitment_resume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_education` WRITE;
/*!40000 ALTER TABLE `recruitment_education` DISABLE KEYS */;

INSERT INTO `recruitment_education` (`id`, `created_date`, `deleted`, `name`, `date_start`, `date_end`, `degree`, `description`, `resume_id`)
VALUES
	(1,'2017-05-10 02:58:57.705471',0,'KHTN','2005-09-01','2010-09-01','Cu Nhan','Toan-Tin',2),
	(2,'2017-05-10 03:00:07.098236',0,'KHTN','2005-09-01','2010-09-01','Cu Nhan','Toan-Tin',3),
	(6,'2017-05-10 08:34:19.931425',0,'KHTN','2005-09-01','2010-09-01','Cu Nhan','Toan-Tin',4),
	(7,'2017-05-10 08:38:31.337527',0,'CNTT','2006-09-01','2010-09-01','Cu Nhan','Dai Hoc Cong Nghe Thong Tin',5),
	(8,'2017-05-10 08:42:49.948248',0,'HUFLIT','2010-01-01','2015-01-01','Ky Su','Generate Strong Diffie-Hellman Group',6),
	(9,'2017-05-10 08:48:10.082576',0,'Ky Thuat Cong Nghe','2010-10-10','2015-10-10','Ky Su','Let’s Encrypt 2016 In Review',7);

/*!40000 ALTER TABLE `recruitment_education` ENABLE KEYS */;
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
	(1,'2017-05-03 08:45:20.633317',0,'Jacky Tran','N','jacky@carodev.com','','Jacky','Tran','0909090909',3);

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
  KEY `recruitment_employer_account_id_111cb71a_fk_recruitme` (`account_id`),
  KEY `recruitment_employer_employer_id_02379d57_fk_recruitme` (`employer_id`),
  CONSTRAINT `recruitment_employer_account_id_111cb71a_fk_recruitme` FOREIGN KEY (`account_id`) REFERENCES `recruitment_account` (`id`),
  CONSTRAINT `recruitment_employer_employer_id_02379d57_fk_recruitme` FOREIGN KEY (`employer_id`) REFERENCES `recruitment_employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_employeraccount` WRITE;
/*!40000 ALTER TABLE `recruitment_employeraccount` DISABLE KEYS */;

INSERT INTO `recruitment_employeraccount` (`id`, `created_date`, `deleted`, `role`, `account_id`, `employer_id`)
VALUES
	(1,'2017-05-03 08:45:20.638449',0,'Administrator',2,1);

/*!40000 ALTER TABLE `recruitment_employeraccount` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_experience
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_experience`;

CREATE TABLE `recruitment_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `description` longtext,
  `resume_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_experien_resume_id_5930becb_fk_recruitme` (`resume_id`),
  CONSTRAINT `recruitment_experien_resume_id_5930becb_fk_recruitme` FOREIGN KEY (`resume_id`) REFERENCES `recruitment_resume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_experience` WRITE;
/*!40000 ALTER TABLE `recruitment_experience` DISABLE KEYS */;

INSERT INTO `recruitment_experience` (`id`, `created_date`, `deleted`, `name`, `date_start`, `date_end`, `description`, `resume_id`)
VALUES
	(1,'2017-05-10 02:58:57.703884',0,'Neowiz','2009-07-01','2017-10-01','Dev Web',2),
	(2,'2017-05-10 03:00:07.094891',0,'Neowiz','2009-07-01','2017-10-01','Dev Web',3),
	(8,'2017-05-10 08:34:19.929070',0,'Neowiz','2009-07-01','2017-10-01','Dev Web',4),
	(9,'2017-05-10 08:34:19.930265',0,'Leader','2010-10-01','2011-10-01','NTIS',4),
	(10,'2017-05-10 08:38:31.335914',0,'Software Engineer','2010-11-01','2013-11-01','Lava',5),
	(11,'2017-05-10 08:42:49.945506',0,'Tester','2015-01-01','2015-12-12','Generate Strong Diffie-Hellman Group',6),
	(12,'2017-05-10 08:48:10.080780',0,'Developer','2010-01-01','2012-12-12','Let’s Encrypt 2016 In Review',7);

/*!40000 ALTER TABLE `recruitment_experience` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_experienceskill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_experienceskill`;

CREATE TABLE `recruitment_experienceskill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `experience` int(11) NOT NULL,
  `resume_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_experien_resume_id_06dcc6f9_fk_recruitme` (`resume_id`),
  CONSTRAINT `recruitment_experien_resume_id_06dcc6f9_fk_recruitme` FOREIGN KEY (`resume_id`) REFERENCES `recruitment_resume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_experienceskill` WRITE;
/*!40000 ALTER TABLE `recruitment_experienceskill` DISABLE KEYS */;

INSERT INTO `recruitment_experienceskill` (`id`, `created_date`, `deleted`, `name`, `category`, `experience`, `resume_id`)
VALUES
	(1,'2017-05-10 02:58:57.699159',0,'Java','Skill',1,2),
	(2,'2017-05-10 02:58:57.700945',0,'PHP','Skill',7,2),
	(3,'2017-05-10 02:58:57.702467',0,'Python','Skill',2,2),
	(4,'2017-05-10 03:00:07.087594',0,'Java','Skill',1,3),
	(5,'2017-05-10 03:00:07.088906',0,'PHP','Skill',7,3),
	(6,'2017-05-10 03:00:07.090613',0,'Python','Skill',2,3),
	(17,'2017-05-10 08:34:19.922394',0,'Java','Skill',1,4),
	(18,'2017-05-10 08:34:19.923971',0,'PHP','Skill',7,4),
	(19,'2017-05-10 08:34:19.925428',0,'Python','Skill',2,4),
	(20,'2017-05-10 08:34:19.926600',0,'Linux','Operation System',5,4),
	(21,'2017-05-10 08:34:19.927801',0,'English','Language',3,4),
	(22,'2017-05-10 08:38:31.250748',0,'PHP','Skill',7,5),
	(23,'2017-05-10 08:38:31.261663',0,'Python','Skill',2,5),
	(24,'2017-05-10 08:38:31.283086',0,'Linux','Operation System',6,5),
	(25,'2017-05-10 08:38:31.334339',0,'English','Language',5,5),
	(26,'2017-05-10 08:42:49.936549',0,'PHP','Skill',5,6),
	(27,'2017-05-10 08:42:49.939308',0,'NodeJs','Skill',1,6),
	(28,'2017-05-10 08:42:49.941961',0,'Linux','Operation System',1,6),
	(29,'2017-05-10 08:42:49.943662',0,'English','Language',5,6),
	(30,'2017-05-10 08:48:10.054211',0,'PHP','Skill',5,7),
	(31,'2017-05-10 08:48:10.056123',0,'Python','Skill',2,7),
	(32,'2017-05-10 08:48:10.074412',0,'Linux','Operation System',1,7),
	(33,'2017-05-10 08:48:10.077682',0,'English','Language',6,7);

/*!40000 ALTER TABLE `recruitment_experienceskill` ENABLE KEYS */;
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
  KEY `recruitment_job_category_id_664916ec_fk_recruitme` (`category_id`),
  KEY `recruitment_job_company_id_11cbc981_fk_recruitment_company_id` (`company_id`),
  KEY `recruitment_job_location_id_545f3f8d` (`location_id`),
  CONSTRAINT `recruitment_job_category_id_664916ec_fk_recruitme` FOREIGN KEY (`category_id`) REFERENCES `recruitment_jobcategory` (`id`),
  CONSTRAINT `recruitment_job_company_id_11cbc981_fk_recruitment_company_id` FOREIGN KEY (`company_id`) REFERENCES `recruitment_company` (`id`),
  CONSTRAINT `recruitment_job_location_id_545f3f8d_fk_recruitment_location_id` FOREIGN KEY (`location_id`) REFERENCES `recruitment_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_job` WRITE;
/*!40000 ALTER TABLE `recruitment_job` DISABLE KEYS */;

INSERT INTO `recruitment_job` (`id`, `created_date`, `deleted`, `name`, `detail`, `summary_1`, `summary_2`, `summary_3`, `location_id`, `type`, `salary_min`, `salary_max`, `salary_currency`, `salary_type`, `category_id`, `company_id`)
VALUES
	(1,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(2,'2017-05-03 09:33:12.024215',0,'IT Support','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Career Description for a Software Engineer','Career Description for a Software Engineer','Career Description for a Software Engineer',1,'FullTime',400,500,'USD','Monthly',1,1),
	(3,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(4,'2017-05-03 09:33:12.024215',0,'IT Support','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Career Description for a Software Engineer','Career Description for a Software Engineer','Career Description for a Software Engineer',1,'FullTime',400,500,'USD','Monthly',1,1),
	(5,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(6,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(7,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(8,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(9,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(10,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(11,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(12,'2017-05-03 09:33:12.024215',0,'IT Support','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Career Description for a Software Engineer','Career Description for a Software Engineer','Career Description for a Software Engineer',1,'FullTime',400,500,'USD','Monthly',1,1),
	(13,'2017-05-03 09:22:37.565872',0,'Software Engineer','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Manage Multiple Projects in Deadline-Driven Environments','Work Well with Teams','Understand Software Engineering Best Practices',1,'FullTime',500,1000,'USD','Monthly',2,1),
	(14,'2017-05-03 09:33:12.024215',0,'IT Support','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Career Description for a Software Engineer','Career Description for a Software Engineer','Career Description for a Software Engineer',1,'FullTime',400,500,'USD','Monthly',1,1),
	(15,'2017-05-03 09:33:12.024215',0,'IT Support','Career Description for a Software Engineer. ... Software engineers tend to specialize in a few areas of development, such as networks, operating systems, databases or applications, and each area requires fluency in its own set of computer languages and development environments.','Career Description for a Software Engineer','Career Description for a Software Engineer','Career Description for a Software Engineer',1,'FullTime',400,500,'USD','Monthly',1,1);

/*!40000 ALTER TABLE `recruitment_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_jobapply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_jobapply`;

CREATE TABLE `recruitment_jobapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `apply_date` date NOT NULL,
  `status` varchar(200) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_jobapply_candidate_id_d7da9554_fk_recruitme` (`candidate_id`),
  KEY `recruitment_jobapply_job_id_9e14bde1_fk_recruitment_job_id` (`job_id`),
  CONSTRAINT `recruitment_jobapply_candidate_id_d7da9554_fk_recruitme` FOREIGN KEY (`candidate_id`) REFERENCES `recruitment_candidate` (`id`),
  CONSTRAINT `recruitment_jobapply_job_id_9e14bde1_fk_recruitment_job_id` FOREIGN KEY (`job_id`) REFERENCES `recruitment_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table recruitment_jobcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_jobcategory`;

CREATE TABLE `recruitment_jobcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `job_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_jobcategory` WRITE;
/*!40000 ALTER TABLE `recruitment_jobcategory` DISABLE KEYS */;

INSERT INTO `recruitment_jobcategory` (`id`, `created_date`, `deleted`, `name`, `slug`, `job_count`)
VALUES
	(1,'2017-05-03 09:04:28.224871',0,'IT','it',5),
	(2,'2017-05-03 09:04:47.755467',0,'Software','software',10);

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
  KEY `recruitment_location_company_id_62c3e532_fk_recruitme` (`company_id`),
  CONSTRAINT `recruitment_location_company_id_62c3e532_fk_recruitme` FOREIGN KEY (`company_id`) REFERENCES `recruitment_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_location` WRITE;
/*!40000 ALTER TABLE `recruitment_location` DISABLE KEYS */;

INSERT INTO `recruitment_location` (`id`, `created_date`, `deleted`, `name`, `email`, `phone`, `address1`, `address2`, `state`, `city`, `post_code`, `country`, `company_id`)
VALUES
	(1,'2017-05-03 09:22:24.333614',0,'Head Office','support@carodev.com','0909090909','123','456','789','10','10','10',1);

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
	(1,'2017-05-03 15:44:17.000000',0,'Register','',0,0,0,'',0);

/*!40000 ALTER TABLE `recruitment_membership` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recruitment_resume
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recruitment_resume`;

CREATE TABLE `recruitment_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `middle_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `lnk_facebook` varchar(200) DEFAULT NULL,
  `lnk_twitter` varchar(200) DEFAULT NULL,
  `lnk_linkedin` varchar(200) DEFAULT NULL,
  `lnk_tumlbr` varchar(200) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_resume_candidate_id_665e40df_fk_recruitme` (`candidate_id`),
  CONSTRAINT `recruitment_resume_candidate_id_665e40df_fk_recruitme` FOREIGN KEY (`candidate_id`) REFERENCES `recruitment_candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recruitment_resume` WRITE;
/*!40000 ALTER TABLE `recruitment_resume` DISABLE KEYS */;

INSERT INTO `recruitment_resume` (`id`, `created_date`, `deleted`, `name`, `first_name`, `middle_name`, `last_name`, `avatar`, `email`, `phone`, `website`, `lnk_facebook`, `lnk_twitter`, `lnk_linkedin`, `lnk_tumlbr`, `status`, `country`, `city`, `address`, `description`, `candidate_id`)
VALUES
	(1,'2017-05-10 02:52:15.431239',0,'Software Engineer','Tran','Dinh','Hung','/2017/05/10/logo.png','tdhungit@gmail.com','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','HCM','12 Ton Dan','Our first full year as a live CA was an exciting one. I’m incredibly proud of what our team and community accomplished during 2016. I’d like to share some thoughts about how we’ve changed, what we’ve accomplished, and what we’ve learned.',1),
	(2,'2017-05-10 02:58:57.678590',0,'Software Engineer','Tran','Dinh','Hung','/2017/05/10/logo.png','tdhungit@gmail.com','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','HCM','12 Ton Dan','Our first full year as a live CA was an exciting one. I’m incredibly proud of what our team and community accomplished during 2016. I’d like to share some thoughts about how we’ve changed, what we’ve accomplished, and what we’ve learned.',1),
	(3,'2017-05-10 03:00:07.085291',0,'Software Engineer','Tran','Dinh','Hung','/2017/05/10/logo.png','tdhungit@gmail.com','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','HCM','12 Ton Dan','Our first full year as a live CA was an exciting one. I’m incredibly proud of what our team and community accomplished during 2016. I’d like to share some thoughts about how we’ve changed, what we’ve accomplished, and what we’ve learned.',1),
	(4,'2017-05-10 03:01:31.411619',0,'Software Engineer','Tran','Dinh','Hung','/2017/05/10/logo.png','tdhungit@gmail.com','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','HCM','12 Ton Dan','Our first full year as a live CA was an exciting one. I’m incredibly proud of what our team and community accomplished during 2016. I’d like to share some thoughts about how we’ve changed, what we’ve accomplished, and what we’ve learned.',1),
	(5,'2017-05-10 08:38:31.211928',0,'Lead Software Engineer','Nguyen','Van','Hieu','/2017/05/10/logo.png','hieunv@blueseed.tv','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','Ho Chi Minh','12 Ton Dan','This object is the top-level bid response object (i.e., the unnamed outer JSON object). The id attribute\nis a reflection of the bid request ID for logging purposes. Similarly, bidid is an optional response\ntracking ID for bidders. If specified, it can be included in the subsequent win notice call if the bidder\nwins. At least one seatbid object is required, which contains at least one bid for an impression. Other\nattributes are optional.\nTo express a “no-bid”, the options are to return an empty response with HTTP 204. Alternately if the\nbidder wishes to convey to the exchange a reason for not bidding, just a BidResponse object is\nreturned with a reason code in the nbr attribute.',1),
	(6,'2017-05-10 08:42:49.890791',0,'Data Science','Vo','Tan','Phat','/2017/05/10/logo.png','tdhungit@gmail.com','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','Ho Chi Minh','12 Ton Dan','Our first full year as a live CA was an exciting one. I’m incredibly proud of what our team and community accomplished during 2016. I’d like to share some thoughts about how we’ve changed, what we’ve accomplished, and what we’ve learned.',1),
	(7,'2017-05-10 08:48:10.010019',0,'Lead Software Engineer','Tran','Dinh','Ngoc','/2017/05/10/logo.png','ngoctd@blueseed.tv','0909090909','http://carodev.com',NULL,NULL,NULL,NULL,'Active','VietNam','Ho Chi Minh','12 Ton Dan','To set up Nginx SSL securely, we will be using the recommendations by Remy van Elst on the Cipherli.st site. This site is designed to provide easy-to-consume encryption settings for popular software. You can read more about his decisions regarding the Nginx choices here.',1);

/*!40000 ALTER TABLE `recruitment_resume` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
