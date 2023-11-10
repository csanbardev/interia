-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tutowebdb
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pending` char(1) DEFAULT NULL,
  `category_img` text DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'cocina','1','uploads/cocina.svg'),
(2,'carpintería','1','uploads/carpinteria.svg'),
(3,'diseño','1','uploads/design.svg'),
(6,'música','1','uploads/musica.svg'),
(7,'dibujo','1','uploads/draw.svg'),
(8,'matemáticas','1','uploads/math.svg'),
(9,'Guitarra','1','uploads/cocina.svg'),
(10,'Prueba','1','uploads/cocina.svg'),
(11,'nuev','1','uploads/cocina.svg'),
(13,'Nueva','1','uploads/avatar-1695206204281106-italy.svg'),
(16,'kac222','0',NULL),
(17,'ew34','0',NULL),
(18,'2e22','0',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id_tutorial` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES
(12,1),
(14,1),
(24,14),
(23,14);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tutorial` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES
(6,21,14);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorials`
--

DROP TABLE IF EXISTS `tutorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorials` (
  `id_tutorial` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `approved` char(1) NOT NULL,
  `published_date` date DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `author` varchar(40) NOT NULL,
  `src_image` varchar(50) NOT NULL,
  `length` text DEFAULT NULL,
  `yb_likes` text DEFAULT NULL,
  PRIMARY KEY (`id_tutorial`),
  UNIQUE KEY `url` (`url`) USING HASH,
  UNIQUE KEY `url_2` (`url`) USING HASH,
  KEY `fk_tutorials_user` (`id_user`),
  KEY `fk_tutorials_cat` (`id_category`),
  CONSTRAINT `fk_tutorials_cat` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  CONSTRAINT `fk_tutorials_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorials`
--

LOCK TABLES `tutorials` WRITE;
/*!40000 ALTER TABLE `tutorials` DISABLE KEYS */;
INSERT INTO `tutorials` VALUES
(22,'https://www.youtube.com/watch?v=6q-dxizNiis','0','2020-11-19',6,14,NULL,'5 SENCILLOS PASOS para TOCAR MEJOR la ARMÓNICA | HARPVARD','Harpvard','https://i.ytimg.com/vi/6q-dxizNiis/mqdefault.jpg',NULL,NULL),
(23,'https://www.youtube.com/watch?v=XMFi_Oz2ofw','0','2023-07-27',6,14,1,'COMO LLEGAR A LAS NOTAS MÁS AGUDAS DE LA VOZ HUMANA CANTANDO ROCK (Método CHIQUITO)!','LAHUELLAGUITAR','https://i.ytimg.com/vi/XMFi_Oz2ofw/mqdefault.jpg',NULL,NULL),
(26,'https://www.youtube.com/watch?v=-RDBMu7BreE','0','2022-10-27',8,14,NULL,'APRENDE MATEMÁTICAS DESDE CERO. Nivel Básico','Matemáticas con Juan','https://i.ytimg.com/vi/-RDBMu7BreE/mqdefault.jpg','3h. 12m. 22s.','88939'),
(27,'https://www.youtube.com/watch?v=3BUJjez7wEQ','0','2022-09-22',6,14,NULL,'[UPDATED] Duvet - bôa - guitar tutorial (strumming/chords)','Lia Bennett','https://i.ytimg.com/vi/3BUJjez7wEQ/mqdefault.jpg','8m. 40s.','675'),
(28,'https://www.youtube.com/watch?v=JB-rgtbxkhQ','0','2023-08-31',6,14,NULL,'MÚSICA de PIRATAS ¿por qué suena así? | Análisis musical de videojuegos','Ludofonía','https://i.ytimg.com/vi/JB-rgtbxkhQ/mqdefault.jpg','14m. 18s.','41607'),
(29,'https://www.youtube.com/watch?v=4fUbj8DzT6Q','0','2020-12-02',3,14,NULL,'💡 6 Principios del DISEÑO GRÁFICO que debes conocer | Hey Jaime','Hey Jaime','https://i.ytimg.com/vi/4fUbj8DzT6Q/mqdefault.jpg','8m. 37s.','7737'),
(30,'https://www.youtube.com/watch?v=f2RMgqKMsFE','0','2023-09-11',2,14,NULL,'¿Qué es el SIBO? TODO lo que debes SABER','La Hiperactina','https://i.ytimg.com/vi/f2RMgqKMsFE/mqdefault.jpg','15m. 13s.','6550');
/*!40000 ALTER TABLE `tutorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `role` varchar(6) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'user','$2b$10$RxtcJMR0UnBCNRKjKt.PR.QRolWGGAOJCZvTM7WmaASKtdrrL7NPG','user@mail.com','admin','uploads/avatar-1693391608844day59-kitchen.svg'),
(14,'test','$2b$10$CbSOlSOWq/tfesu4967ZGO1kW7s/mwtwdYGaIFodWfsV1X8wK.dQ6','test@mail.com','user','uploads/avatar-1693391608844day59-kitchen.svg'),
(255,'prueba','$2b$10$P.IwEFoMw1JPc0LbE9fyeeXsjFSs7j12CsXc1t5ocK2Mf6r9b6LZC','mail@mail.com','user','uploads/user.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 15:02:32
