-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pre_interia
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
  `cat_name` varchar(20) NOT NULL,
  `cat_pending` char(1) DEFAULT '1',
  `cat_img` varchar(70) DEFAULT NULL,
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
(1,'Guitarra','0','uploads/guitarra.svg'),
(2,'Cacharreo','0','uploads/cacharreo.svg'),
(3,'Costura','0','uploads/costura.svg'),
(4,'Magia','0','uploads/magia.svg'),
(5,'Desarrollo Web','0','uploads/web-dev.svg'),
(6,'Inglés','0','uploads/ingles.svg'),
(7,'Alemán','0','uploads/aleman.svg'),
(8,'Cocina','0','uploads/cocina.svg');
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
INSERT INTO `t_likes` VALUES
(8,43),
(17,43),
(15,43),
(4,44),
(6,44),
(9,44),
(21,44),
(19,44),
(26,44),
(24,44),
(8,45),
(5,45),
(26,45);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tutorials`
--

LOCK TABLES `t_tutorials` WRITE;
/*!40000 ALTER TABLE `t_tutorials` DISABLE KEYS */;
INSERT INTO `t_tutorials` VALUES
(4,'https://youtu.be/UwU1n6GhXWg','1','2021-09-12',2,2,NULL,'Si Eres Principiante Necesitas Estos Componentes Electrónicos','Wexter Home','https://i.ytimg.com/vi/UwU1n6GhXWg/mqdefault.jpg','12m. 57s.',14017),
(5,'https://youtu.be/qVBiAdVj4EE','1','2020-07-03',6,2,NULL,'How to introduce yourself in English - Like a NATIVE! Fun English Lesson 2020.','Smashing English! Free and Fun English Lessons!','https://i.ytimg.com/vi/qVBiAdVj4EE/mqdefault.jpg','11m. 14s.',2336),
(6,'https://youtu.be/D332DCt4Y5Y','1','2022-12-21',5,2,NULL,'Aprende a dockerizar tu aplicación de Frontend (React, Angular) y ahorra tiempo y recursos','Leifer Mendez','https://i.ytimg.com/vi/D332DCt4Y5Y/mqdefault.jpg','21m. 11s.',1088),
(7,'https://youtu.be/hUFj6sbOiPA','1','2023-08-31',6,2,NULL,'YES, it\'s possible - Daily Routine at C1 (Advanced) Level of English!','English with Lucy','https://i.ytimg.com/vi/hUFj6sbOiPA/mqdefault.jpg','14m. 19s.',43794),
(8,'https://youtu.be/-mDIIQfGfmY','1','2023-10-08',6,2,NULL,'How To Understand FAST Spoken English','Smashing English! Free and Fun English Lessons!','https://i.ytimg.com/vi/-mDIIQfGfmY/mqdefault.jpg','21m. 29s.',23809),
(9,'https://youtu.be/VcxXipZg1-0','1','2020-05-08',5,2,NULL,'Lazy Load, Suspense y paginación con React','midudev','https://i.ytimg.com/vi/VcxXipZg1-0/mqdefault.jpg','1h. 27m. 47s.',2254),
(10,'https://youtu.be/gm2V2lMDUAg','1','2022-12-25',1,2,NULL,'Las 5 REGLAS de ORO para tocar RITMOS en GUITARRA','Karma Guitar','https://i.ytimg.com/vi/gm2V2lMDUAg/mqdefault.jpg','14m. 53s.',7404),
(11,'https://youtu.be/52RWMFbZmRg','1','2022-05-30',1,2,NULL,'Duvet - bôa - Simple acoustic guitar tutorial','Lia Bennett','https://i.ytimg.com/vi/52RWMFbZmRg/mqdefault.jpg','6m. 3s.',7775),
(12,'https://youtu.be/LyWBXNk_KMY','1','2021-08-13',3,2,NULL,'20 trucos y técnicas de costura','Coser fácil y más Menudo Numerito','https://i.ytimg.com/vi/LyWBXNk_KMY/mqdefault.jpg','6m. 33s.',2805),
(13,'https://www.youtube.com/watch?v=6CseDngW_TI','1','2023-06-19',3,2,NULL,'Chaleco sin costuras','La Casa de Rosina','https://i.ytimg.com/vi/6CseDngW_TI/mqdefault.jpg','3m. 37s.',837),
(14,'https://www.youtube.com/watch?v=StzJE5lrhcI','1','2020-04-12',7,2,NULL,'Aprender Alemán Desde Cero (A1): Lo Más Importante Para Empezar Tu Aprendizaje 💡🎓 (1/4)','Henry de todoaleman','https://i.ytimg.com/vi/StzJE5lrhcI/mqdefault.jpg','31m. 13s.',55000),
(15,'https://www.youtube.com/watch?v=reWTm9SBG38','1','2020-10-08',7,2,NULL,'Cómo saber el GÉNERO de SUSTANTIVOS en ALEMÁN (DER, DIE, DAS) | Curso de Alemán 🇩🇪','AndyGM en Berlín','https://i.ytimg.com/vi/reWTm9SBG38/mqdefault.jpg','12m. 40s.',7280),
(16,'https://www.youtube.com/watch?v=k7t91g7wvB4','1','2020-04-30',7,2,NULL,'ALEMÁN DESDE 0 -CLASE 1- EL ALFABETO ALEMÁN- ALEMÁN FÁCIL PARA PRINCIPIANTES','AlemanDesde0','https://i.ytimg.com/vi/k7t91g7wvB4/mqdefault.jpg','6m. 6s.',6450),
(17,'https://www.youtube.com/watch?v=tEcRygjNrTE','1','2023-05-09',7,2,NULL,'🇩🇪 Cómo aprendí Alemán (contado en alemán) 🇩🇪 + Recursos para aprender por tu cuenta','Wissbegierde','https://i.ytimg.com/vi/tEcRygjNrTE/mqdefault.jpg','10m. 35s.',2384),
(18,'https://www.youtube.com/watch?v=XnjP_DXE_8E','1','2021-11-26',4,2,NULL,'Aprende tu primer truco de magia en 2 minutos','Julio Ribera','https://i.ytimg.com/vi/XnjP_DXE_8E/mqdefault.jpg','2m. 15s.',16385),
(19,'https://www.youtube.com/watch?v=Bguyn9WpdQU','1','2020-03-27',4,2,NULL,'HAZ LEVITAR UNA MONEDA CON TUS MANOS! TUTORIAL','Sr. Mago','https://i.ytimg.com/vi/Bguyn9WpdQU/mqdefault.jpg','10m. 3s.',57765),
(20,'https://www.youtube.com/watch?v=GvmPHX-BNrA','1','2021-11-16',4,2,NULL,'El mejor truco con cartas fácil y automático explicado! 🔝','Magia & Cardistry','https://i.ytimg.com/vi/GvmPHX-BNrA/mqdefault.jpg','10m. 59s.',7527),
(21,'https://www.youtube.com/watch?v=Caaokoo2yUo','1','2020-05-13',4,2,NULL,'Cómo Empezar a Hacer Magia - Aprende magia','Domina La Magia','https://i.ytimg.com/vi/Caaokoo2yUo/mqdefault.jpg','7m. 56s.',3326),
(22,'https://www.youtube.com/watch?v=cUAFAztS4kI','1','2023-03-20',8,2,NULL,'Plato japonés completo en 8 minutos','¡Que el papeo te acompañe!','https://i.ytimg.com/vi/cUAFAztS4kI/mqdefault.jpg','4m. 14s.',4058),
(23,'https://www.youtube.com/watch?v=dUtFGQ8xLKk','1','2023-11-21',8,2,NULL,'ALIOLI 🤤 || RECETARIO DE DON TÓMAS || EPISODIO 5','Arrozydesgracias','https://i.ytimg.com/vi/dUtFGQ8xLKk/mqdefault.jpg','9m. 18s.',2893),
(24,'https://www.youtube.com/watch?v=naKZsMx84UM','1','2015-02-04',8,2,NULL,'🦑 Como hacer CALAMARES al AJILLO en MICROONDAS #13','CocinarEnMicroondas','https://i.ytimg.com/vi/naKZsMx84UM/mqdefault.jpg','2m. 5s.',366),
(25,'https://www.youtube.com/watch?v=p1rquwEvTuI','1','2023-02-22',8,2,NULL,'Focaccia Súper Fácil (SIN AMASAR) 😏','Cocina con Coqui','https://i.ytimg.com/vi/p1rquwEvTuI/mqdefault.jpg','5m. 53s.',14239),
(26,'https://www.youtube.com/watch?v=qkvh0OonIdc','1','2023-09-25',8,2,NULL,'He hecho una TARTA de LASAÑA','¡Que el papeo te acompañe!','https://i.ytimg.com/vi/qkvh0OonIdc/mqdefault.jpg','11m. 1s.',3473);
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
  `usr_avatar` varchar(50) DEFAULT 'uploads/avatar.png',
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `usr_nick` (`usr_nick`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` VALUES
(1,'test','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','mail@mail.com','admin','uploads/avatar.png'),
(2,'Cristian','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','mail@mail.com','user','uploads/avatar.png'),
(43,'Chaneys','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','chaney4512@google.com','user','uploads/avatar.png'),
(44,'Germaine','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','germaine@google.com','user','uploads/avatar.png'),
(45,'Lamar','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','lamar2508@google.net','user','uploads/avatar.png'),
(46,'Samuel','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','samuel805@google.edu','user','uploads/avatar.png'),
(47,'Zahir','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','zahir@google.edu','user','uploads/avatar.png'),
(48,'Nina','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','nina@google.net','user','uploads/avatar.png'),
(49,'George','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','george5493@google.net','user','uploads/avatar.png'),
(50,'Deirdre','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','deirdre@google.com','user','uploads/avatar.png'),
(51,'Tanek','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','tanek@google.net','user','uploads/avatar.png'),
(52,'Xena','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','xena@google.edu','user','uploads/avatar.png'),
(53,'Hope','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','hope@google.couk','user','uploads/avatar.png'),
(54,'Ariel','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','ariel1130@google.com','user','uploads/avatar.png'),
(55,'Nola','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','nola@google.ca','user','uploads/avatar.png'),
(56,'Violet','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','violet412@google.ca','user','uploads/avatar.png'),
(57,'Chaney','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','chaney@google.org','user','uploads/avatar.png'),
(58,'Nadine','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','nadine6378@google.com','user','uploads/avatar.png'),
(59,'Hall','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','hall6278@google.org','user','uploads/avatar.png'),
(60,'Cameron','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','cameron8411@google.com','user','uploads/avatar.png'),
(61,'Ivy','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','ivy5853@google.com','user','uploads/avatar.png'),
(62,'Jamal','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','jamal@google.ca','user','uploads/avatar.png');
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

-- Dump completed on 2023-11-27 10:00:34
