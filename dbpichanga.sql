-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bdpichanga
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbautorizaciones`
--

DROP TABLE IF EXISTS `tbautorizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbautorizaciones` (
  `idautorizacion` int NOT NULL AUTO_INCREMENT,
  `idmenu` int DEFAULT NULL,
  `idperfil` int DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idautorizacion`),
  KEY `fk_tbautorizaciones_tbmenu` (`idmenu`),
  KEY `fk_tbautorizaciones_tbperfiles` (`idperfil`),
  CONSTRAINT `fk_tbautorizaciones_tbmenu` FOREIGN KEY (`idmenu`) REFERENCES `tbmenu` (`idmenu`),
  CONSTRAINT `fk_tbautorizaciones_tbperfiles` FOREIGN KEY (`idperfil`) REFERENCES `tbperfiles` (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla para autorizar el perfil y menu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbautorizaciones`
--

LOCK TABLES `tbautorizaciones` WRITE;
/*!40000 ALTER TABLE `tbautorizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbautorizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbeventodeportivo`
--

DROP TABLE IF EXISTS `tbeventodeportivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbeventodeportivo` (
  `ideventodeportivo` int NOT NULL AUTO_INCREMENT,
  `nombreevento` text,
  `fechainicio` datetime DEFAULT NULL,
  `fechatermino` datetime DEFAULT NULL,
  `direccion` text,
  `nparticipantes` int DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`ideventodeportivo`),
  UNIQUE KEY `unq_tbeventodeportivo_idusuario` (`idusuario`),
  CONSTRAINT `fk_tbeventodeportivo` FOREIGN KEY (`idusuario`) REFERENCES `tbusuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla para crear las pichangas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbeventodeportivo`
--

LOCK TABLES `tbeventodeportivo` WRITE;
/*!40000 ALTER TABLE `tbeventodeportivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbeventodeportivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmenu`
--

DROP TABLE IF EXISTS `tbmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbmenu` (
  `idmenu` int NOT NULL AUTO_INCREMENT,
  `padreid` int DEFAULT NULL,
  `hijoid` int DEFAULT NULL,
  `url` text,
  `nombre` text,
  `descripcion` text,
  `menunivel` int DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla de menu dinamico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmenu`
--

LOCK TABLES `tbmenu` WRITE;
/*!40000 ALTER TABLE `tbmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbperfiles`
--

DROP TABLE IF EXISTS `tbperfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbperfiles` (
  `idperfil` int NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla de perfiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbperfiles`
--

LOCK TABLES `tbperfiles` WRITE;
/*!40000 ALTER TABLE `tbperfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbperfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbperfilusuarios`
--

DROP TABLE IF EXISTS `tbperfilusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbperfilusuarios` (
  `idperfilusuarios` int NOT NULL AUTO_INCREMENT,
  `idusuarios` int DEFAULT NULL,
  `idperfil` int DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idperfilusuarios`),
  UNIQUE KEY `unq_tbperfilusuarios_idusuarios` (`idusuarios`),
  KEY `fk_tbperfilusuarios_tbperfiles` (`idperfil`),
  CONSTRAINT `fk_tbperfilusuarios_tbperfiles` FOREIGN KEY (`idperfil`) REFERENCES `tbperfiles` (`idperfil`),
  CONSTRAINT `fk_tbperfilusuarios_tbusuarios` FOREIGN KEY (`idusuarios`) REFERENCES `tbusuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla de configuracion para  usuarios y perfiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbperfilusuarios`
--

LOCK TABLES `tbperfilusuarios` WRITE;
/*!40000 ALTER TABLE `tbperfilusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbperfilusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuarios`
--

DROP TABLE IF EXISTS `tbusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbusuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `apepaterno` text,
  `apematerno` text,
  `nombres` text,
  `telefono` text,
  `correo` text,
  `fechacreacion` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla para los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuarios`
--

LOCK TABLES `tbusuarios` WRITE;
/*!40000 ALTER TABLE `tbusuarios` DISABLE KEYS */;
INSERT INTO `tbusuarios` VALUES (1,'jlopez','123','LOPEZ','Aguilar','Julio Cesar','944408018','zepol181194@gmail.com','2023-03-06 11:36:37',1);
/*!40000 ALTER TABLE `tbusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 15:52:30
