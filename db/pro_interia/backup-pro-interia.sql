-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pro_interia
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB-1:11.0.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_categories`
--

DROP TABLE IF EXISTS `t_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL,
  `cat_pending` char(1) DEFAULT '1',
  `cat_img` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_categories`
--

LOCK TABLES `t_categories` WRITE;
/*!40000 ALTER TABLE `t_categories` DISABLE KEYS */;
INSERT INTO `t_categories` VALUES
(1,'Guitarra','0','uploads/default.svg'),
(2,'Cacharreo','0','uploads/default.svg'),
(3,'Costura','0','uploads/default.svg'),
(4,'Magia','0','uploads/default.svg'),
(5,'Desarrollo Web','0','uploads/default.svg'),
(6,'Inglés','0','uploads/default.svg'),
(7,'Alemán','0','uploads/default.svg'),
(8,'Cocina','0','uploads/default.svg');
/*!40000 ALTER TABLE `t_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_likes`
--

DROP TABLE IF EXISTS `t_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_likes` (
  `lks_tut_id` int(11) NOT NULL,
  `lks_usr_id` int(11) NOT NULL,
  KEY `lks_fk1` (`lks_usr_id`),
  KEY `lks_fk2` (`lks_tut_id`),
  CONSTRAINT `lks_fk1` FOREIGN KEY (`lks_usr_id`) REFERENCES `t_users` (`usr_id`) ON DELETE CASCADE,
  CONSTRAINT `lks_fk2` FOREIGN KEY (`lks_tut_id`) REFERENCES `t_tutorials` (`tut_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_likes`
--

LOCK TABLES `t_likes` WRITE;
/*!40000 ALTER TABLE `t_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reports`
--

DROP TABLE IF EXISTS `t_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_reports` (
  `rpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `rpt_tut_id` int(11) NOT NULL,
  `rpt_usr_id` int(11) NOT NULL,
  PRIMARY KEY (`rpt_id`),
  KEY `rpt_fk1` (`rpt_usr_id`),
  KEY `rpt_fk2` (`rpt_tut_id`),
  CONSTRAINT `rpt_fk1` FOREIGN KEY (`rpt_usr_id`) REFERENCES `t_users` (`usr_id`) ON DELETE CASCADE,
  CONSTRAINT `rpt_fk2` FOREIGN KEY (`rpt_tut_id`) REFERENCES `t_tutorials` (`tut_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reports`
--

LOCK TABLES `t_reports` WRITE;
/*!40000 ALTER TABLE `t_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tutorials`
--

DROP TABLE IF EXISTS `t_tutorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tutorials` (
  `tut_id` int(11) NOT NULL AUTO_INCREMENT,
  `tut_url` varchar(100) NOT NULL,
  `tut_approved` char(1) DEFAULT '0',
  `tut_published_date` date NOT NULL,
  `tut_cat_id` int(11) NOT NULL,
  `tut_usr_id` int(11) NOT NULL,
  `tut_likes` int(11) DEFAULT NULL,
  `tut_title` varchar(120) NOT NULL,
  `tut_author` varchar(80) NOT NULL,
  `tut_src_image` varchar(50) NOT NULL,
  `tut_length` varchar(30) NOT NULL,
  `tut_yb_likes` int(11) NOT NULL,
  PRIMARY KEY (`tut_id`),
  UNIQUE KEY `tut_title` (`tut_title`),
  KEY `tut_fk1` (`tut_usr_id`),
  KEY `tut_fk2` (`tut_cat_id`),
  CONSTRAINT `tut_fk1` FOREIGN KEY (`tut_usr_id`) REFERENCES `t_users` (`usr_id`) ON DELETE CASCADE,
  CONSTRAINT `tut_fk2` FOREIGN KEY (`tut_cat_id`) REFERENCES `t_categories` (`cat_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tutorials`
--

LOCK TABLES `t_tutorials` WRITE;
/*!40000 ALTER TABLE `t_tutorials` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tutorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_nick` varchar(20) NOT NULL,
  `usr_password` varchar(200) NOT NULL,
  `usr_email` varchar(50) DEFAULT NULL,
  `usr_role` varchar(6) DEFAULT 'user',
  `usr_avatar` varchar(110) DEFAULT 'uploads/avatar.png',
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `usr_nick` (`usr_nick`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` VALUES
(1,'test','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','mail@mail.com','admin','uploads/avatar.png'),
(2,'Cristian','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','mail@mail.com','user','uploads/avatar.png'),
(3,'Chaneys','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','chaney4512@google.com','user','uploads/avatar.png'),
(4,'Germaine','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','germaine@google.com','user','uploads/avatar.png'),
(5,'Lamar','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','lamar2508@google.net','user','uploads/avatar.png'),
(6,'Samuel','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','samuel805@google.edu','user','uploads/avatar.png'),
(7,'Zahir','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','zahir@google.edu','user','uploads/avatar.png'),
(8,'Nina','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','nina@google.net','user','uploads/avatar.png'),
(9,'George','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','george5493@google.net','user','uploads/avatar.png');
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 16:10:53
