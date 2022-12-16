-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor
-- ------------------------------------------------------
-- Server version	5.7.37-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aceite`
--

DROP TABLE IF EXISTS `aceite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aceite` (
  `aceite_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) DEFAULT NULL,
  `avaliacao_id` int(11) DEFAULT NULL,
  `assinatura_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `versao` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`aceite_id`),
  KEY `k_aceite_1` (`usuario_id`),
  KEY `k_aceite_2` (`empresa_id`),
  KEY `k_aceite_3` (`avaliacao_id`),
  KEY `k_aceite_4` (`assinatura_id`),
  CONSTRAINT `fk_aceite_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `fk_aceite_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_aceite_3` FOREIGN KEY (`avaliacao_id`) REFERENCES `avaliacao` (`avaliacao_id`),
  CONSTRAINT `fk_aceite_4` FOREIGN KEY (`assinatura_id`) REFERENCES `assinatura` (`assinatura_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aceite`
--

LOCK TABLES `aceite` WRITE;
/*!40000 ALTER TABLE `aceite` DISABLE KEYS */;
INSERT INTO `aceite` VALUES (1,2,NULL,NULL,NULL,'2022-10-26 11:51:34','1.2'),(2,3,NULL,NULL,NULL,'2022-10-26 11:51:34','1.2'),(3,9,NULL,NULL,NULL,'2022-10-26 11:51:35','1.2'),(4,16,15,14,NULL,'2022-10-26 11:53:12','1.2'),(5,1,6,NULL,1,'2022-10-26 11:53:27','1.2'),(6,1,6,NULL,2,'2022-10-26 11:53:27','1.2'),(7,1,6,NULL,1,'2022-10-26 11:53:28','1.2'),(8,1,6,NULL,2,'2022-10-26 11:53:28','1.2'),(9,1,6,NULL,1,'2022-10-26 11:53:28','1.2'),(10,1,6,NULL,1,'2022-10-26 11:53:28','1.2'),(11,17,17,16,NULL,'2022-10-27 15:37:25','1.2'),(12,17,17,NULL,3,'2022-10-31 17:20:25','1.2');
/*!40000 ALTER TABLE `aceite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_aceite before insert on aceite for each row
begin
    if new.empresa_id>0 and (new.avaliacao_id <= 0 and new.assinatura_id <= 0) then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.empresa_id';
    end if;
    if new.avaliacao_id > 0 and new.empresa_id <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.avaliacao_id';
    end if;
    if new.assinatura_id > 0 and new.empresa_id <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.assinatura_id';
    end if;
    if new.data_hora < '2018-12-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.data_hora';
    end if;
    if character_length(trim(new.versao)) = 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.versao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_aceite before update on aceite for each row
begin
    if new.empresa_id>0 and (new.avaliacao_id <= 0 and new.assinatura_id <= 0) then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.empresa_id';
    end if;
    if new.avaliacao_id > 0 and new.empresa_id <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.avaliacao_id';
    end if;
    if new.assinatura_id > 0 and new.empresa_id <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.assinatura_id';
    end if;
    if new.data_hora < '2018-12-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.data_hora';
    end if;
    if character_length(trim(new.versao)) = 0 then
        signal sqlstate '45000' set message_text = 'invalid value: aceite.versao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `assinatura`
--

DROP TABLE IF EXISTS `assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assinatura` (
  `assinatura_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `produto_servico_id` int(11) NOT NULL DEFAULT '0',
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `promocao_id` int(11) DEFAULT NULL,
  `usuarios` int(4) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assinatura_id`),
  UNIQUE KEY `uk_assinatura_1` (`cliente_contrato_id`),
  KEY `k_assinatura_1` (`empresa_id`),
  KEY `k_assinatura_2` (`produto_servico_id`),
  KEY `k_assinatura_3` (`cliente_contrato_id`),
  KEY `k_assinatura_4` (`promocao_id`),
  CONSTRAINT `fk_assinatura_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_assinatura_2` FOREIGN KEY (`produto_servico_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`),
  CONSTRAINT `fk_assinatura_3` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `sommusgestor_1`.`cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_assinatura_4` FOREIGN KEY (`promocao_id`) REFERENCES `promocao` (`promocao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura`
--

LOCK TABLES `assinatura` WRITE;
/*!40000 ALTER TABLE `assinatura` DISABLE KEYS */;
INSERT INTO `assinatura` VALUES (1,6,1,8,NULL,5,1,0),(2,6,2,12,NULL,8,1,0),(3,17,1,14,NULL,1,1,0);
/*!40000 ALTER TABLE `assinatura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_assinatura before insert on assinatura for each row
begin
    if new.usuarios <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: assinatura.usuarios';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: assinatura.ativo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_assinatura before update on assinatura for each row
begin
    if new.usuarios <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: assinatura.usuarios';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: assinatura.ativo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `assinatura_modulo`
--

DROP TABLE IF EXISTS `assinatura_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assinatura_modulo` (
  `assinatura_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assinatura_id`,`modulo_id`),
  KEY `k_assinatura_modulo_1` (`assinatura_id`),
  KEY `k_assinatura_modulo_2` (`modulo_id`),
  CONSTRAINT `fk_assinatura_modulo_1` FOREIGN KEY (`assinatura_id`) REFERENCES `assinatura` (`assinatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura_modulo`
--

LOCK TABLES `assinatura_modulo` WRITE;
/*!40000 ALTER TABLE `assinatura_modulo` DISABLE KEYS */;
INSERT INTO `assinatura_modulo` VALUES (1,1),(1,4),(1,5),(3,1),(3,2),(3,3),(3,5),(3,6),(3,7),(3,9),(3,10),(3,11);
/*!40000 ALTER TABLE `assinatura_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assinatura_usuario`
--

DROP TABLE IF EXISTS `assinatura_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assinatura_usuario` (
  `assinatura_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assinatura_id`,`usuario_id`),
  KEY `k_assinatura_usuario_1` (`assinatura_id`),
  KEY `k_assinatura_usuario_2` (`usuario_id`),
  CONSTRAINT `fk_assinatura_usuario_1` FOREIGN KEY (`assinatura_id`) REFERENCES `assinatura` (`assinatura_id`),
  CONSTRAINT `fk_assinatura_usuario_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura_usuario`
--

LOCK TABLES `assinatura_usuario` WRITE;
/*!40000 ALTER TABLE `assinatura_usuario` DISABLE KEYS */;
INSERT INTO `assinatura_usuario` VALUES (2,1),(2,2);
/*!40000 ALTER TABLE `assinatura_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacao`
--

DROP TABLE IF EXISTS `autorizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizacao` (
  `autorizacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `opcao_id` int(11) NOT NULL DEFAULT '0',
  `acao_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`autorizacao_id`),
  UNIQUE KEY `uk_autorizacao_1` (`modulo_id`,`opcao_id`,`acao_id`),
  KEY `k_autorizacao_1` (`modulo_id`),
  KEY `k_autorizacao_2` (`opcao_id`),
  KEY `k_autorizacao_3` (`acao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao`
--

LOCK TABLES `autorizacao` WRITE;
/*!40000 ALTER TABLE `autorizacao` DISABLE KEYS */;
INSERT INTO `autorizacao` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,1,1,4),(5,1,1,8),(6,1,2,1),(7,1,2,2),(8,1,2,3),(9,1,2,4),(10,1,3,1),(11,1,3,2),(12,1,3,3),(13,1,3,4),(16,1,4,4),(14,1,4,5),(15,1,4,6),(17,1,4,7),(18,1,5,1),(19,1,5,2),(20,1,5,3),(21,1,5,4),(22,1,6,1),(23,1,6,2),(24,1,6,3),(25,1,6,4),(26,1,7,1),(27,1,7,2),(28,1,7,3),(29,1,7,4),(30,1,8,1),(31,1,8,2),(32,1,8,3),(33,1,8,4),(34,1,9,1),(35,1,9,2),(36,1,9,3),(37,1,9,4),(38,1,10,1),(39,1,10,2),(40,1,10,3),(41,1,10,4),(46,1,12,1),(47,1,12,2),(48,1,12,3),(49,1,12,4),(50,1,13,1),(51,1,13,2),(52,1,13,3),(53,1,13,4),(54,1,14,1),(55,1,14,2),(56,1,14,3),(57,1,14,4),(58,1,15,1),(59,1,15,2),(60,1,15,3),(61,1,15,4),(62,1,16,1),(63,1,16,2),(64,1,16,3),(65,1,16,4),(66,1,17,4),(67,1,18,1),(68,1,18,4),(42,1,67,1),(43,1,67,2),(44,1,67,3),(45,1,67,4),(78,2,1,1),(79,2,1,2),(80,2,1,3),(81,2,1,4),(82,2,1,8),(93,2,9,1),(94,2,9,2),(95,2,9,3),(96,2,9,4),(105,2,12,1),(106,2,12,2),(107,2,12,3),(108,2,12,4),(117,2,13,1),(118,2,13,2),(119,2,13,3),(120,2,13,4),(121,2,14,1),(122,2,14,2),(123,2,14,3),(124,2,14,4),(125,2,15,1),(126,2,15,2),(127,2,15,3),(128,2,15,4),(129,2,16,1),(130,2,16,2),(131,2,16,3),(132,2,16,4),(133,2,17,4),(134,2,18,1),(135,2,18,4),(73,2,19,1),(74,2,19,2),(75,2,19,3),(76,2,19,4),(77,2,19,9),(101,2,20,1),(102,2,20,2),(103,2,20,3),(104,2,20,4),(83,2,21,1),(84,2,21,2),(85,2,21,3),(86,2,21,4),(87,2,21,8),(88,2,43,1),(89,2,43,2),(90,2,43,3),(91,2,43,4),(92,2,43,10),(136,2,54,1),(137,2,54,2),(138,2,54,3),(139,2,54,4),(69,2,56,1),(70,2,56,2),(71,2,56,3),(72,2,56,4),(109,2,67,1),(110,2,67,2),(111,2,67,3),(112,2,67,4),(113,2,76,1),(114,2,76,2),(115,2,76,3),(116,2,76,4),(97,2,119,1),(98,2,119,2),(99,2,119,3),(100,2,119,4),(153,3,1,1),(154,3,1,2),(155,3,1,3),(156,3,1,4),(157,3,1,8),(163,3,4,4),(180,3,12,1),(181,3,12,2),(182,3,12,3),(183,3,12,4),(188,3,13,1),(189,3,13,2),(190,3,13,3),(191,3,13,4),(192,3,14,1),(193,3,14,2),(194,3,14,3),(195,3,14,4),(196,3,15,1),(197,3,15,2),(198,3,15,3),(199,3,15,4),(200,3,16,1),(201,3,16,2),(202,3,16,3),(203,3,16,4),(204,3,17,4),(205,3,18,1),(206,3,18,4),(140,3,19,1),(141,3,19,2),(142,3,19,3),(143,3,19,4),(144,3,19,9),(158,3,21,1),(159,3,21,2),(160,3,21,3),(161,3,21,4),(162,3,21,8),(164,3,22,1),(165,3,22,2),(166,3,22,3),(167,3,22,4),(168,3,23,1),(169,3,23,2),(170,3,23,3),(171,3,23,4),(145,3,35,1),(146,3,35,2),(147,3,35,3),(148,3,35,4),(149,3,56,1),(150,3,56,2),(151,3,56,3),(152,3,56,4),(184,3,76,1),(185,3,76,2),(186,3,76,3),(187,3,76,4),(172,3,113,1),(173,3,113,2),(174,3,113,3),(175,3,113,4),(176,3,119,1),(177,3,119,2),(178,3,119,3),(179,3,119,4),(212,5,2,1),(213,5,2,2),(214,5,2,3),(215,5,2,4),(264,5,15,1),(265,5,15,2),(266,5,15,3),(267,5,15,4),(268,5,16,1),(269,5,16,2),(270,5,16,3),(271,5,16,4),(272,5,17,4),(273,5,18,1),(274,5,18,4),(207,5,19,1),(208,5,19,2),(209,5,19,3),(210,5,19,4),(211,5,19,9),(220,5,25,1),(221,5,25,2),(222,5,25,3),(223,5,25,4),(224,5,26,1),(225,5,26,2),(226,5,26,3),(227,5,26,4),(228,5,26,16),(229,5,26,18),(230,5,27,1),(231,5,27,2),(232,5,27,3),(233,5,27,4),(234,5,27,15),(235,5,27,19),(236,5,28,1),(237,5,28,2),(239,5,28,4),(238,5,28,23),(245,5,29,4),(244,5,29,14),(247,5,30,4),(246,5,30,17),(252,5,31,1),(253,5,31,2),(254,5,31,3),(255,5,31,4),(256,5,32,1),(257,5,32,2),(258,5,32,3),(259,5,32,4),(260,5,33,1),(261,5,33,2),(262,5,33,3),(263,5,33,4),(216,5,58,1),(217,5,58,2),(218,5,58,3),(219,5,58,4),(248,5,98,1),(249,5,98,2),(250,5,98,3),(251,5,98,4),(240,5,124,1),(241,5,124,2),(243,5,124,4),(242,5,124,23),(290,6,17,4),(291,6,18,1),(292,6,18,4),(275,6,35,1),(276,6,35,2),(277,6,35,3),(278,6,35,4),(283,6,36,1),(284,6,36,2),(285,6,36,3),(286,6,36,4),(287,6,37,1),(288,6,37,2),(289,6,37,4),(279,6,123,1),(280,6,123,2),(281,6,123,3),(282,6,123,4),(329,7,17,4),(330,7,18,1),(331,7,18,4),(293,7,56,1),(294,7,56,2),(295,7,56,3),(296,7,56,4),(297,7,59,1),(298,7,59,2),(299,7,59,3),(300,7,59,4),(301,7,60,1),(302,7,60,2),(303,7,60,3),(304,7,60,4),(305,7,61,1),(306,7,61,2),(307,7,61,3),(308,7,61,4),(309,7,62,1),(310,7,62,2),(311,7,62,3),(312,7,62,4),(313,7,63,1),(314,7,63,2),(315,7,63,3),(316,7,63,4),(317,7,64,1),(318,7,64,2),(319,7,64,3),(320,7,64,4),(321,7,65,1),(322,7,65,2),(323,7,65,3),(324,7,65,4),(325,7,66,1),(326,7,66,2),(327,7,66,3),(328,7,66,4),(332,7,70,4),(333,7,71,4),(393,9,1,4),(395,9,17,4),(396,9,18,1),(397,9,18,4),(334,9,19,1),(335,9,19,2),(336,9,19,3),(337,9,19,4),(394,9,21,4),(392,9,23,4),(341,9,35,1),(342,9,35,2),(343,9,35,3),(344,9,35,4),(345,9,79,1),(348,9,79,2),(346,9,79,3),(347,9,79,4),(451,9,79,25),(352,9,80,1),(353,9,80,2),(354,9,80,3),(355,9,80,4),(356,9,84,1),(357,9,84,2),(358,9,84,3),(359,9,84,4),(360,9,85,1),(361,9,85,2),(362,9,85,3),(363,9,85,4),(364,9,86,1),(365,9,86,2),(366,9,86,3),(367,9,86,4),(368,9,87,1),(369,9,87,2),(370,9,87,3),(371,9,87,4),(380,9,89,1),(381,9,89,2),(382,9,89,3),(383,9,89,4),(384,9,90,1),(385,9,90,2),(386,9,90,3),(387,9,90,4),(388,9,91,1),(389,9,91,2),(390,9,91,3),(391,9,91,4),(376,9,95,1),(377,9,95,2),(378,9,95,3),(379,9,95,4),(349,9,96,1),(350,9,96,3),(351,9,96,4),(338,9,103,1),(339,9,103,2),(340,9,103,4),(398,9,104,1),(399,9,104,2),(400,9,104,3),(401,9,104,4),(372,9,106,1),(373,9,106,2),(374,9,106,3),(375,9,106,4),(407,10,12,1),(408,10,12,2),(409,10,12,3),(410,10,12,4),(432,10,31,1),(433,10,31,2),(434,10,31,3),(435,10,31,4),(436,10,32,1),(437,10,32,2),(438,10,32,3),(439,10,32,4),(440,10,33,1),(441,10,33,2),(442,10,33,3),(443,10,33,4),(402,10,38,2),(403,10,38,4),(411,10,39,4),(412,10,39,7),(413,10,40,11),(415,10,41,11),(414,10,41,12),(406,10,45,4),(404,10,55,2),(405,10,55,4),(416,10,67,1),(417,10,67,2),(418,10,67,3),(419,10,67,4),(420,10,68,1),(421,10,68,2),(422,10,68,3),(423,10,68,4),(424,10,76,1),(425,10,76,2),(426,10,76,3),(427,10,76,4),(428,10,98,1),(429,10,98,2),(430,10,98,3),(431,10,98,4),(449,11,18,1),(450,11,18,4),(446,11,21,4),(444,11,42,4),(445,11,43,4),(447,11,45,4),(448,11,45,20);
/*!40000 ALTER TABLE `autorizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `avaliacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_servico_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `data_fim` date NOT NULL DEFAULT '0001-01-01',
  `utm_source` varchar(100) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avaliacao_id`),
  KEY `k_avaliacao_1` (`produto_servico_id`),
  KEY `k_avaliacao_2` (`empresa_id`),
  CONSTRAINT `fk_avaliacao_1` FOREIGN KEY (`produto_servico_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`),
  CONSTRAINT `fk_avaliacao_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,1,2,'2022-10-26','2022-11-09','',1),(2,1,3,'2022-10-26','2022-11-09','',1),(3,1,4,'2022-10-26','2022-11-09','',1),(4,1,5,'2022-10-26','2022-11-09','',1),(5,1,6,'2022-10-26','2022-11-09','',2),(6,1,7,'2022-10-26','2022-11-09','',1),(7,1,8,'2022-10-26','2022-11-09','',1),(8,1,9,'2022-10-26','2022-11-09','',1),(9,1,10,'2022-10-26','2022-11-09','',1),(10,1,11,'2022-10-26','2022-11-09','',1),(11,1,12,'2022-10-26','2022-11-09','',1),(12,1,13,'2022-10-26','2022-11-09','',1),(13,1,14,'2022-10-26','2022-11-09','',1),(14,1,15,'2022-10-26','2022-11-09','',1),(15,1,16,'2022-10-26','2022-11-09','',1),(16,1,17,'2022-10-27','2022-11-10','',2);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_avaliacao before insert on avaliacao for each row
begin
    if new.data_inicio < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.data_inicio';
    end if;
    if new.data_fim < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.data_fim';
    end if;
    if new.status not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.status';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_avaliacao before update on avaliacao for each row
begin
    if new.data_inicio < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.data_inicio';
    end if;
    if new.data_fim < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.data_fim';
    end if;
    if new.status not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: avaliacao.status';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aws_cliente`
--

DROP TABLE IF EXISTS `aws_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_cliente` (
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `reset_maximo_dias` int(2) NOT NULL DEFAULT '0',
  `reset_online` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_id`),
  CONSTRAINT `fk_aws_cliente_1` FOREIGN KEY (`cliente_id`) REFERENCES `sommusgestor_1`.`pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_cliente`
--

LOCK TABLES `aws_cliente` WRITE;
/*!40000 ALTER TABLE `aws_cliente` DISABLE KEYS */;
INSERT INTO `aws_cliente` VALUES (1,25,1);
/*!40000 ALTER TABLE `aws_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_modulo`
--

DROP TABLE IF EXISTS `aws_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_modulo` (
  `aws_modulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`aws_modulo_id`),
  KEY `k_aws_modulo_1` (`produto_id`),
  CONSTRAINT `fk_aws_modulo_1` FOREIGN KEY (`produto_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_modulo`
--

LOCK TABLES `aws_modulo` WRITE;
/*!40000 ALTER TABLE `aws_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_modulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_aws_modulo before insert on aws_modulo for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_modulo.nome';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_aws_modulo before update on aws_modulo for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_modulo.nome';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aws_produto`
--

DROP TABLE IF EXISTS `aws_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_produto` (
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `codigo_produto` int(3) NOT NULL DEFAULT '0',
  `chave_protecao` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`produto_id`),
  UNIQUE KEY `uk_aws_produto_1` (`codigo_produto`),
  CONSTRAINT `fk_aws_produto_1` FOREIGN KEY (`produto_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_produto`
--

LOCK TABLES `aws_produto` WRITE;
/*!40000 ALTER TABLE `aws_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_receber`
--

DROP TABLE IF EXISTS `aws_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_receber` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `aviso_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `aviso_usuario` varchar(50) NOT NULL DEFAULT '',
  `aberto_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `aberto_usuario` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`receber_id`),
  CONSTRAINT `fk_aws_receber_1` FOREIGN KEY (`receber_id`) REFERENCES `sommusgestor_1`.`receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_receber`
--

LOCK TABLES `aws_receber` WRITE;
/*!40000 ALTER TABLE `aws_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_registro_ecf`
--

DROP TABLE IF EXISTS `aws_registro_ecf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_registro_ecf` (
  `aws_registro_ecf_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `colaborador_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `ecf` varchar(50) NOT NULL DEFAULT '',
  `numero_serie` varchar(50) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aws_registro_ecf_id`),
  KEY `k_aws_registro_ecf_1` (`colaborador_id`),
  KEY `k_aws_registro_ecf_2` (`cliente_id`),
  CONSTRAINT `fk_aws_registro_ecf_1` FOREIGN KEY (`colaborador_id`) REFERENCES `sommusgestor_1`.`pessoa` (`pessoa_id`),
  CONSTRAINT `fk_aws_registro_ecf_2` FOREIGN KEY (`cliente_id`) REFERENCES `sommusgestor_1`.`pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_registro_ecf`
--

LOCK TABLES `aws_registro_ecf` WRITE;
/*!40000 ALTER TABLE `aws_registro_ecf` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_registro_ecf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_aws_registro_ecf before insert on aws_registro_ecf for each row
begin
    if new.ecf = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_registro_ecf.ecf';
    end if;
    if new.numero_serie = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_registro_ecf.numero_serie';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_aws_registro_ecf before update on aws_registro_ecf for each row
begin
    if new.ecf = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_registro_ecf.ecf';
    end if;
    if new.numero_serie = '' then
        signal sqlstate '45000' set message_text = 'invalid value: aws_registro_ecf.numero_serie';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aws_reset`
--

DROP TABLE IF EXISTS `aws_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_reset` (
  `aws_reset_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `colaborador_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `aws_modulo_id` int(11) DEFAULT NULL,
  `contador` int(5) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `dias` int(2) NOT NULL DEFAULT '0',
  `contas_atrasadas` int(4) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aws_reset_id`),
  KEY `k_aws_reset_1` (`colaborador_id`),
  KEY `k_aws_reset_2` (`cliente_id`),
  KEY `k_aws_reset_3` (`produto_id`),
  KEY `k_aws_reset_4` (`aws_modulo_id`),
  CONSTRAINT `fk_aws_reset_1` FOREIGN KEY (`colaborador_id`) REFERENCES `sommusgestor_1`.`pessoa` (`pessoa_id`),
  CONSTRAINT `fk_aws_reset_2` FOREIGN KEY (`cliente_id`) REFERENCES `sommusgestor_1`.`pessoa` (`pessoa_id`),
  CONSTRAINT `fk_aws_reset_3` FOREIGN KEY (`produto_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`),
  CONSTRAINT `fk_aws_reset_4` FOREIGN KEY (`aws_modulo_id`) REFERENCES `aws_modulo` (`aws_modulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_reset`
--

LOCK TABLES `aws_reset` WRITE;
/*!40000 ALTER TABLE `aws_reset` DISABLE KEYS */;
INSERT INTO `aws_reset` VALUES (1,'2022-10-26 11:55:11',2,13,901,NULL,2,4,15,2,'',1);
/*!40000 ALTER TABLE `aws_reset` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_aws_reset before insert on aws_reset for each row
begin
    if new.tipo not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_reset.tipo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_aws_reset before update on aws_reset for each row
begin
    if new.tipo not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_reset.tipo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aws_usuario`
--

DROP TABLE IF EXISTS `aws_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_usuario` (
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `reset_definitivo` tinyint(1) NOT NULL DEFAULT '0',
  `reset_inadimplente` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_aws_usuario_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_usuario`
--

LOCK TABLES `aws_usuario` WRITE;
/*!40000 ALTER TABLE `aws_usuario` DISABLE KEYS */;
INSERT INTO `aws_usuario` VALUES (1,1,1);
/*!40000 ALTER TABLE `aws_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_aws_usuario before insert on aws_usuario for each row
begin
    if new.reset_definitivo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_usuario.reset_definitivo';
    end if;
    if new.reset_inadimplente not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_usuario.reset_inadimplente';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_aws_usuario before update on aws_usuario for each row
begin
    if new.reset_definitivo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_usuario.reset_definitivo';
    end if;
    if new.reset_inadimplente not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: aws_usuario.reset_inadimplente';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chave`
--

DROP TABLE IF EXISTS `chave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chave` (
  `chave_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `servico` int(2) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `chave` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`chave_id`),
  UNIQUE KEY `uk_chave_1` (`empresa_id`,`servico`,`tipo`),
  UNIQUE KEY `uk_chave_2` (`produto_id`),
  KEY `k_chave_1` (`empresa_id`),
  KEY `k_chave_2` (`produto_id`),
  CONSTRAINT `fk_chave_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_chave_2` FOREIGN KEY (`produto_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chave`
--

LOCK TABLES `chave` WRITE;
/*!40000 ALTER TABLE `chave` DISABLE KEYS */;
INSERT INTO `chave` VALUES (1,2,NULL,0,2,'','802qkmB3mBn89N55cxVMujuCd4RgaFlxDV7uHEY5EYs'),(2,3,NULL,0,2,'','dWfzQ_nNl6JF17GiNaUNl4OkZQQoTj_AhY744LpITag'),(3,4,NULL,0,2,'','gk9SaFJoI_-MrKTkIDucVM-GSCsNc-hipvIA_H0TwOE'),(4,5,NULL,0,2,'','l36Z1F06FuFKAVZNYONiPPwwRrdcx4Oz6ASG34WGcag'),(5,6,NULL,0,2,'','bua1uytSE_LQuSq80nM1ssjFt6yzs1MPJjVr9EPGgns'),(6,7,NULL,0,2,'','DQPgisET_Mx1iT_W9Hx6FGNhMsB4413w6QNv82cNNpA'),(7,8,NULL,0,2,'','-4qlEILtV-TUO51h3KFZXLgz34eczYY79rFKk6-Cbrs'),(8,9,NULL,0,2,'','mV00rtTcYZJbXWD2kpUBAnj93Uw6XN4CWrVHSjis6Jw'),(9,10,NULL,0,2,'','4APpPygTFKNtPUmvveo6U6B4LAIqsAPnm-53x9gIa-g'),(10,11,NULL,0,2,'','0GuQE-WoimfHzmbaNQLxD0TbuVuXeVhDjJTJR_M_gbQ'),(11,12,NULL,0,2,'','mYavedVxtDuKmfq25XUba9O3GlY5OloO7ZoPktYlIP8'),(12,13,NULL,0,2,'','hVmfzyEu1UpnPPymHdyWgk0N_o9xewkrU_2QFIkjM2w'),(13,14,NULL,0,2,'','zOnCKlMvx_yhC4N2l1N5GUS9q1CbBK-BwXPQvGzoso4'),(14,NULL,4,0,1,'','tqApk0ON2xIEkmuVPVRf1uMk3OftT5hVpgCXruIqgPg'),(15,NULL,NULL,0,1,'PenseGestão','B0oEOhXQJc5Tqd7Sh4y6aSlPjVP0F9mIS_iCRbG1o80'),(16,NULL,NULL,2,3,'','E9O22Fwg1mtgPlfirHbueaxfCTwAquAOXHOVaXtKguQ'),(17,NULL,NULL,1,1,'','123TESTE321CHAVE1'),(18,NULL,NULL,1,2,'','123TESTE321CHAVE2'),(19,2,NULL,7,7,'','uMafnDIB1V36TWwf6KF_Pi8ututgJ'),(20,2,NULL,8,3,'','Insira aqui sua chave de acesso a API do PenseBank'),(21,16,NULL,0,2,'','AqEhnnPporoZgq9TDP0mzi3elhBgKh8aDtW8QrLi2y4');
/*!40000 ALTER TABLE `chave` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_chave before insert on chave for each row
begin
    if new.servico not in (0,1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: chave.servico';
    end if;
    if new.tipo not in (1,2,3,4,5,6,7) then
        signal sqlstate '45000' set message_text = 'invalid value: chave.tipo';
    end if;
    if new.chave = '' then
        signal sqlstate '45000' set message_text = 'invalid value: chave.chave';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_chave before update on chave for each row
begin
    if new.servico not in (0,1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: chave.servico';
    end if;
    if new.tipo not in (1,2,3,4,5,6,7) then
        signal sqlstate '45000' set message_text = 'invalid value: chave.tipo';
    end if;
    if new.chave = '' then
        signal sqlstate '45000' set message_text = 'invalid value: chave.chave';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_indicador`
--

DROP TABLE IF EXISTS `dashboard_indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_indicador` (
  `dashboard_id` int(11) NOT NULL DEFAULT '0',
  `indicador_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dashboard_id`,`indicador_id`),
  KEY `k_dashboard_indicador_1` (`dashboard_id`),
  KEY `k_dashboard_indicador_2` (`indicador_id`),
  CONSTRAINT `fk_dashboard_indicador_1` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboard` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_indicador`
--

LOCK TABLES `dashboard_indicador` WRITE;
/*!40000 ALTER TABLE `dashboard_indicador` DISABLE KEYS */;
INSERT INTO `dashboard_indicador` VALUES (1,1),(1,3),(1,5),(1,6),(1,8),(2,3),(2,10),(3,1),(3,7);
/*!40000 ALTER TABLE `dashboard_indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(150) NOT NULL DEFAULT '',
  `nome_fantasia` varchar(150) NOT NULL DEFAULT '',
  `cnpj` varchar(14) NOT NULL DEFAULT '',
  `inscricao_estadual` varchar(20) NOT NULL DEFAULT '',
  `inscricao_municipal` varchar(20) NOT NULL DEFAULT '',
  `data_cadastro` date NOT NULL DEFAULT '0001-01-01',
  `grupo_empresa_id` int(11) NOT NULL DEFAULT '0',
  `url_logo` varchar(500) NOT NULL DEFAULT '',
  `enotas_empresa_id` varchar(36) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `uk_empresa_1` (`empresa_id`,`grupo_empresa_id`),
  UNIQUE KEY `uk_empresa_2` (`cnpj`),
  KEY `k_empresa_1` (`grupo_empresa_id`),
  CONSTRAINT `fk_empresa_1` FOREIGN KEY (`grupo_empresa_id`) REFERENCES `grupo_empresa` (`grupo_empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Sommus Automação Comercial LTDA','Sommus Sistemas','04717475000154','ISENTO','5956','2022-10-26',1,'Empresas/1/Logo/c4ca4238a0b923820dcc509a6f75849b','',1,0),(2,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA','24634181000176','0027467430027','','2022-10-26',1,'Empresas/2/Logo/c81e728d9d4c2f636f067f89cc14862c','',1,0),(3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2022-10-26',2,'Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',1,0),(4,'Teste Selenium LTDA','Teste Selenium','21993456000170','','','2022-10-26',3,'','',1,0),(5,'Stacao Moda Com.Art.Vest.LTDA-Arcos','Stação Modas (Arcos)','01339768000742','','','2022-10-26',4,'','',1,0),(6,'Stacao Moda Com.Art.Vest.LTDA-BD L1','Stação Modas (Bom Despacho)','01339768000157','MG321457011','','2022-10-26',4,'','',1,0),(7,'Stacao Moda Com.Art.Vest.LTDA-Divinopol.','Stação Modas (Divinópolis)','01339768000580','mg','','2022-10-26',4,'','',1,0),(8,'Vap Minas Supermercado LTDA','Vap Minas','25623570000169','','','2022-10-26',5,'','',1,0),(9,'Vap Mix Supermercados LTDA','Vap Mix','05350238000160','','','2022-10-26',5,'','',1,0),(10,'Vap Supermercado Bom Despacho','Vap Supermercados','86670643000168','','','2022-10-26',5,'','',1,0),(11,'Carlos Henrique Gomes Jardim','Conceito K','07393318000129','','','2022-10-26',1,'','',0,0),(12,'Júlio Rodrigues da Silva','Delta','76189544000105','','','2022-10-26',1,'','',0,1),(13,'Ismar Roberto','Supermercado do Roberto','18558288000180','','','2022-10-26',1,'','',1,0),(14,'Registro para exclusão','Registro para exclusão','47214601000160','0012345678909','','2022-10-26',1,'','',1,0),(15,'Empresa do usuário que se auto cadastrou','','31948004000120','','','2022-10-26',8,'','',1,0),(16,'Generic Inc','Generic Inc','08771592000157','','','2022-10-26',9,'','',1,0),(17,'Finanças','Teste','58101194000100','','','2022-10-27',10,'','',1,0);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_empresa before insert on empresa for each row
begin
    if new.razao_social = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.razao_social';
    end if;
    if new.cnpj = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.cnpj';
    end if;
    if new.data_cadastro < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.data_cadastro';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_empresa before update on empresa for each row
begin
    if new.razao_social = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.razao_social';
    end if;
    if new.cnpj = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.cnpj';
    end if;
    if new.data_cadastro < '2018-12-01' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.data_cadastro';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresa_contato`
--

DROP TABLE IF EXISTS `empresa_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_contato` (
  `empresa_contato_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `contato` varchar(50) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  PRIMARY KEY (`empresa_contato_id`),
  KEY `k_empresa_contato_1` (`empresa_id`),
  CONSTRAINT `fk_empresa_contato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_contato`
--

LOCK TABLES `empresa_contato` WRITE;
/*!40000 ALTER TABLE `empresa_contato` DISABLE KEYS */;
INSERT INTO `empresa_contato` VALUES (1,1,2,'(037) 3261-9150',''),(2,2,2,'03732619150',''),(3,3,2,'037998653157',''),(4,4,2,'3732613333',''),(5,4,4,'apsf09@yahoo.com.br',''),(6,5,2,'3733511571',''),(7,5,3,'37999539601',''),(8,5,4,'stacaomodas@hotmail.com',''),(9,6,2,'3735224796',''),(10,6,2,'3735224796',''),(11,6,4,'stacaomodas@hotmail.com',''),(12,7,2,'3732133501',''),(13,7,2,'37988082041',''),(14,7,4,'stacaomodas@hotmail.com',''),(15,8,2,'3735214301',''),(16,8,4,'vap4@grupovap.com.br',''),(17,9,2,'3735214305',''),(18,9,4,'vap4@grupovap.com.br',''),(19,10,2,'3735214302',''),(20,10,4,'vap4@grupovap.com.br',''),(21,11,2,'(031) 99324-5860',''),(22,12,2,'(031) 99324-5860',''),(23,14,2,'03732610000',''),(24,3,3,'037999887766',''),(25,2,1,'03732619150','teste'),(28,17,2,'(37) 9999-9999',''),(29,17,4,'leohpaim@gmail.com','');
/*!40000 ALTER TABLE `empresa_contato` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_empresa_contato before insert on empresa_contato for each row
begin
    if new.tipo not in (1,2,3,4,5,6) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.tipo';
    end if;
    if new.contato = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.contato';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_empresa_contato before update on empresa_contato for each row
begin
    if new.tipo not in (1,2,3,4,5,6) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.tipo';
    end if;
    if new.contato = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_contato.contato';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresa_endereco`
--

DROP TABLE IF EXISTS `empresa_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_endereco` (
  `empresa_endereco_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `logradouro` varchar(100) NOT NULL DEFAULT '',
  `numero` varchar(10) NOT NULL DEFAULT '',
  `bairro` varchar(50) NOT NULL DEFAULT '',
  `complemento` varchar(50) NOT NULL DEFAULT '',
  `cep` varchar(10) NOT NULL DEFAULT '',
  `cidade` varchar(50) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  `codigo_municipio` varchar(7) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`empresa_endereco_id`),
  KEY `k_empresa_endereco_1` (`empresa_id`),
  CONSTRAINT `fk_empresa_endereco_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_endereco`
--

LOCK TABLES `empresa_endereco` WRITE;
/*!40000 ALTER TABLE `empresa_endereco` DISABLE KEYS */;
INSERT INTO `empresa_endereco` VALUES (1,1,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35580000','Lagoa da Prata','MG','3137205','',1),(2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',0),(3,2,'Av. Brasil','328','Centro','2º Andar','35590000','Lagoa da Prata','MG','3137205','',1),(4,3,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1),(5,4,'Rua Luiz Guadalupe','247','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(6,5,'Rua das Antilhas','300','Dom Joaquim','','35600000','Bom Despacho','MG','3107406','',1),(7,6,'Rua das Antilhas','300','Dom Joaquim','','35600000','Bom Despacho','MG','3107406','',1),(8,7,'Rua das Antilhas','300','Dom Joaquim','','35600000','Bom Despacho','MG','3107406','',1),(9,8,'FAUSTINO TEIXEIRA','220','Centro','','35600000','Bom Despacho','MG','3171303','',1),(10,9,'AV ANA ROSA','79','Ana Rosa','','35600000','Bom Despacho','MG','3171303','',1),(11,10,'AV GOVERNADOR VALADARES','117','São Vicente','','35600000','Bom Despacho','MG','3171303','',1),(12,11,'R Prof Bartira Mourão','459','Buritis','','30240280','Belo Horizonte','MG','3106200','',1),(13,12,'Rua Geraldo de Abreu','175','São José','','35560000','Santo Antônio do Monte','MG','3160405','',1),(14,14,'Av. 1','2','3','','35590000','Lagoa da Prata','MG','3137205','',1),(15,17,'Av. Brasil','1','Centro','','35591262','Lagoa da Prata','MG','3137205','',1);
/*!40000 ALTER TABLE `empresa_endereco` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_empresa_endereco before insert on empresa_endereco for each row
begin
    if new.logradouro = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.logradouro';
    end if;
    if new.codigo_municipio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.codigo_municipio';
    end if;
    if new.principal not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.principal';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_empresa_endereco before update on empresa_endereco for each row
begin
    if new.logradouro = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.logradouro';
    end if;
    if new.codigo_municipio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.codigo_municipio';
    end if;
    if new.principal not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa_endereco.principal';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresa_pix`
--

DROP TABLE IF EXISTS `empresa_pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_pix` (
  `empresa_pix_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `pix_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tarifa` decimal(15,2) NOT NULL DEFAULT '0.00',
  `comissao` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '0',
  `pensebank_alias` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`empresa_pix_id`),
  UNIQUE KEY `uk_empresa_pix_1` (`empresa_id`,`pix_id`),
  UNIQUE KEY `uk_empresa_pix_2` (`pensebank_alias`),
  KEY `k_empresa_pix_1` (`empresa_id`),
  CONSTRAINT `fk_empresa_pix_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_pix`
--

LOCK TABLES `empresa_pix` WRITE;
/*!40000 ALTER TABLE `empresa_pix` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_pix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_tarifa`
--

DROP TABLE IF EXISTS `empresa_tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa_tarifa` (
  `empresa_tarifa_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `produto` int(2) NOT NULL DEFAULT '0',
  `minimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `maximo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `tarifa` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`empresa_tarifa_id`),
  KEY `k_empresa_tarifa_1` (`empresa_id`),
  CONSTRAINT `fk_empresa_tarifa_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_tarifa`
--

LOCK TABLES `empresa_tarifa` WRITE;
/*!40000 ALTER TABLE `empresa_tarifa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `rota` varchar(200) NOT NULL DEFAULT '',
  `avaliacao` int(1) NOT NULL DEFAULT '0',
  `comentario` text NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `k_feedback_1` (`empresa_id`),
  KEY `k_feedback_2` (`usuario_id`),
  KEY `k_feedback_3` (`modulo_id`),
  CONSTRAINT `fk_feedback_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_feedback_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,1,1,'2022-10-26 11:53:30','Teste',1,'Teste');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_feedback before insert on feedback for each row
begin
    if new.rota = '' then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.rota';
    end if;
    if new.avaliacao not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.avaliacao';
    end if;
    if new.comentario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.comentario';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_feedback before update on feedback for each row
begin
    if new.rota = '' then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.rota';
    end if;
    if new.avaliacao not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.avaliacao';
    end if;
    if new.comentario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: feedback.comentario';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo_empresa`
--

DROP TABLE IF EXISTS `grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_empresa` (
  `grupo_empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `instancia_banco_dados_id` int(11) NOT NULL DEFAULT '0',
  `dados_avaliacao` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`grupo_empresa_id`),
  KEY `k_grupo_empresa_1` (`instancia_banco_dados_id`),
  CONSTRAINT `fk_grupo_empresa_1` FOREIGN KEY (`instancia_banco_dados_id`) REFERENCES `instancia_banco_dados` (`instancia_banco_dados_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_empresa`
--

LOCK TABLES `grupo_empresa` WRITE;
/*!40000 ALTER TABLE `grupo_empresa` DISABLE KEYS */;
INSERT INTO `grupo_empresa` VALUES (1,'Sommus Group',1,0,0),(2,'Posto Liberdade',1,0,0),(3,'Teste Selenium Group',1,1,0),(4,'Stação Modas',1,0,0),(5,'Vap Supermercados',1,1,0),(6,'Supermercado do Roberto',1,1,0),(7,'Registro excluído',1,1,1),(8,'Empresa do usuário que se auto cadastrou',2,1,0),(9,'Generic Group',1,0,0),(10,'Finanças',2,0,0);
/*!40000 ALTER TABLE `grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_grupo_empresa before insert on grupo_empresa for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_empresa.nome';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_empresa.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_grupo_empresa before update on grupo_empresa for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_empresa.nome';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_empresa.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_usuario` (
  `grupo_usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `grupo_empresa_id` int(11) NOT NULL DEFAULT '0',
  `permissao_id` int(11) DEFAULT NULL,
  `restricao_id` int(11) DEFAULT NULL,
  `dashboard_id` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`grupo_usuario_id`),
  KEY `k_grupo_usuario_1` (`grupo_empresa_id`),
  KEY `k_grupo_usuario_2` (`permissao_id`),
  KEY `k_grupo_usuario_3` (`restricao_id`),
  KEY `k_grupo_usuario_4` (`dashboard_id`),
  CONSTRAINT `fk_grupo_usuario_1` FOREIGN KEY (`grupo_empresa_id`) REFERENCES `grupo_empresa` (`grupo_empresa_id`),
  CONSTRAINT `fk_grupo_usuario_2` FOREIGN KEY (`permissao_id`) REFERENCES `permissao` (`permissao_id`),
  CONSTRAINT `fk_grupo_usuario_3` FOREIGN KEY (`restricao_id`) REFERENCES `restricao` (`restricao_id`),
  CONSTRAINT `fk_grupo_usuario_4` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboard` (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_usuario`
--

LOCK TABLES `grupo_usuario` WRITE;
/*!40000 ALTER TABLE `grupo_usuario` DISABLE KEYS */;
INSERT INTO `grupo_usuario` VALUES (1,'Vendedor',1,1,1,1,1,0),(2,'Grupo 2',2,2,2,NULL,1,0),(3,'Administrador',1,3,NULL,2,1,0),(4,'Grupo teste para ser excluido',1,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_grupo_usuario before insert on grupo_usuario for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_grupo_usuario before update on grupo_usuario for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: grupo_usuario.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ibpt_arquivo`
--

DROP TABLE IF EXISTS `ibpt_arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibpt_arquivo` (
  `ibpt_arquivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `uf` char(2) NOT NULL DEFAULT '',
  `vigencia_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `vigencia_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `versao` varchar(25) NOT NULL DEFAULT '',
  `url_arquivo` varchar(500) NOT NULL DEFAULT '',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_importacao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `status` int(1) NOT NULL DEFAULT '0',
  `job` varchar(255) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ibpt_arquivo_id`),
  KEY `k_ibpt_arquivo_1` (`usuario_id`),
  CONSTRAINT `fk_ibpt_arquivo_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibpt_arquivo`
--

LOCK TABLES `ibpt_arquivo` WRITE;
/*!40000 ALTER TABLE `ibpt_arquivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibpt_arquivo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_ibpt_arquivo before insert on ibpt_arquivo for each row
begin
    if character_length(trim(new.uf)) <> 2 then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.uf';
    end if;
    if new.vigencia_inicio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.vigencia_inicio';
    end if;
    if new.vigencia_fim < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.vigencia_fim';
    end if;
    if new.data_hora_importacao < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.data_hora_importacao';
    end if;
    if new.status not in (0,1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.status';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_ibpt_arquivo before update on ibpt_arquivo for each row
begin
    if character_length(trim(new.uf)) <> 2 then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.uf';
    end if;
    if new.vigencia_inicio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.vigencia_inicio';
    end if;
    if new.vigencia_fim < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.vigencia_fim';
    end if;
    if new.data_hora_importacao < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.data_hora_importacao';
    end if;
    if new.status not in (0,1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.status';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: ibpt_arquivo.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagem` (
  `imagem_id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` char(4) NOT NULL DEFAULT '',
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `posicao_horizontal` int(3) NOT NULL DEFAULT '0',
  `posicao_vertical` int(3) NOT NULL DEFAULT '0',
  `url_imagem` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`imagem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES (1,'0101','Confraternização Universal Alterado','Você tem 365 novas chances de recomeçar...',0,0,'Imagens/01/01/20221026115353'),(2,'2512','Feliz Natal Alterado','Revigore suas esperanças e viva melhor.',0,0,'Imagens/12/25/20221026115355'),(3,'0202','Seja feliz','Cuide bem dos seus joelhos...',0,0,'Imagens/02/02/20221026115353'),(4,'0202','Seja feliz','Cuide bem dos seus joelhos...',0,0,'Imagens/02/02/20221026115354'),(5,'0202','Seja feliz','Cuide bem dos seus joelhos...',0,0,'Imagens/02/02/20221026115354'),(6,'0202','Seja feliz','Cuide bem dos seus joelhos...',0,0,'Imagens/02/02/20221026115354');
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_imagem before insert on imagem for each row
begin
    if character_length(trim(new.dia)) <> 4 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.dia';
    end if;
    if new.posicao_horizontal < 0 or new.posicao_horizontal > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.posicao_horizontal';
    end if;
    if new.posicao_vertical < 0 or new.posicao_vertical > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.posicao_vertical';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_imagem before update on imagem for each row
begin
    if character_length(trim(new.dia)) <> 4 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.dia';
    end if;
    if new.posicao_horizontal < 0 or new.posicao_horizontal > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.posicao_horizontal';
    end if;
    if new.posicao_vertical < 0 or new.posicao_vertical > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: imagem.posicao_vertical';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `instancia_banco_dados`
--

DROP TABLE IF EXISTS `instancia_banco_dados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instancia_banco_dados` (
  `instancia_banco_dados_id` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(100) NOT NULL DEFAULT '',
  `porta` varchar(100) NOT NULL DEFAULT '',
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `senha` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`instancia_banco_dados_id`),
  UNIQUE KEY `uk_instancia_banco_dados_1` (`endereco`,`porta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instancia_banco_dados`
--

LOCK TABLES `instancia_banco_dados` WRITE;
/*!40000 ALTER TABLE `instancia_banco_dados` DISABLE KEYS */;
INSERT INTO `instancia_banco_dados` VALUES (1,'9AkzwATyjLDhj+AmXiHbpg==','UHKfrqo/vVH5xFzXVxQZGQ==','T+njpRK3G/i70nn0bwdsbQ==','T+njpRK3G/i70nn0bwdsbQ=='),(2,'4rCnBh8WgfLvBgQl4Q3oJg==','UHKfrqo/vVH5xFzXVxQZGQ==','T+njpRK3G/i70nn0bwdsbQ==','T+njpRK3G/i70nn0bwdsbQ==');
/*!40000 ALTER TABLE `instancia_banco_dados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_instancia_banco_dados before insert on instancia_banco_dados for each row
begin
    if new.endereco = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.endereco';
    end if;
    if new.porta = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.porta';
    end if;
    if new.usuario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.usuario';
    end if;
    if new.senha = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.senha';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_instancia_banco_dados before update on instancia_banco_dados for each row
begin
    if new.endereco = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.endereco';
    end if;
    if new.porta = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.porta';
    end if;
    if new.usuario = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.usuario';
    end if;
    if new.senha = '' then
        signal sqlstate '45000' set message_text = 'invalid value: instancia_banco_dados.senha';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `acao` int(2) NOT NULL DEFAULT '0',
  `objeto` int(3) NOT NULL DEFAULT '0',
  `objeto_id` int(11) NOT NULL DEFAULT '0',
  `objeto_dados` text NOT NULL,
  `objeto_referente` int(3) NOT NULL DEFAULT '0',
  `objeto_referente_id` int(11) NOT NULL DEFAULT '0',
  `objeto_referente_dados` text NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `k_log_1` (`usuario_id`),
  KEY `k_log_2` (`data_hora`),
  KEY `k_log_3` (`objeto`,`objeto_id`),
  KEY `k_log_4` (`objeto_referente`,`objeto_referente_id`),
  CONSTRAINT `fk_log_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-10-26 11:51:10',1,45,1,'{\"ID\":\"1\",\"[password]Endereço\":\"9AkzwATyjLDhj+AmXiHbpg==\",\"[password]Porta\":\"UHKfrqo/vVH5xFzXVxQZGQ==\",\"[password]Usuário\":\"T+njpRK3G/i70nn0bwdsbQ==\",\"[password]Senha\":\"T+njpRK3G/i70nn0bwdsbQ==\"}',0,0,''),(2,NULL,'2022-10-26 11:51:10',1,55,1,'{\"ID\":\"1\",\"Nome\":\"Sommus\",\"[identificacao]\":\"Sommus\",\"Banco de dados\":1}',0,0,''),(3,NULL,'2022-10-26 11:51:10',1,43,1,'{\"ID\":\"1\",\"Razão social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome fantasia\":\"Sommus Sistemas\",\"CNPJ\":\"04.717.475/0001-54\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(4,NULL,'2022-10-26 11:51:10',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Luciano\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":1}',43,1,'{\"ID\":\"1\",\"Razão social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome fantasia\":\"Sommus Sistemas\",\"CNPJ\":\"04.717.475/0001-54\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(5,NULL,'2022-10-26 11:51:10',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\",\"EmpresaEspecificaId\":1}',43,1,'{\"ID\":\"1\",\"Razão social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome fantasia\":\"Sommus Sistemas\",\"CNPJ\":\"04.717.475/0001-54\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(6,NULL,'2022-10-26 11:51:10',1,18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"sommusgestor\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Não\"}',0,0,''),(7,NULL,'2022-10-26 11:51:10',1,96,1,'{\"ID\":\"1\",\"Grupo de empresa\":0,\"Empresa\":1,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Sim\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"sommusgestor\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Não\"}'),(8,NULL,'2022-10-26 11:51:10',2,18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"03208f41f8c158f415bd42e3b1efa9e2\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Sim\"}',0,0,''),(9,1,'2022-10-26 11:51:12',1,45,2,'{\"ID\":\"2\",\"[password]Endereço\":\"4rCnBh8WgfLvBgQl4Q3oJg==\",\"[password]Porta\":\"UHKfrqo/vVH5xFzXVxQZGQ==\",\"[password]Usuário\":\"T+njpRK3G/i70nn0bwdsbQ==\",\"[password]Senha\":\"T+njpRK3G/i70nn0bwdsbQ==\"}',0,0,''),(10,1,'2022-10-26 11:51:12',1,45,3,'{\"ID\":\"3\",\"[password]Endereço\":\"RMfIjsFXcaa3ymKHIfIC4VnN1u9A4riyDuET04vmydc=\",\"[password]Porta\":\"X3xGYowMYU8IHpZcgBiHOw==\",\"[password]Usuário\":\"ttaJKrWV6oNYmTVgyBbzdQ==\",\"[password]Senha\":\"SzLkC4hBmJyH+zyUo2skyg==\"}',0,0,''),(11,1,'2022-10-26 11:51:12',3,45,3,'{\"ID\":\"3\",\"[password]Endereço\":\"RMfIjsFXcaa3ymKHIfIC4VnN1u9A4riyDuET04vmydc=\",\"[password]Porta\":\"X3xGYowMYU8IHpZcgBiHOw==\",\"[password]Usuário\":\"ttaJKrWV6oNYmTVgyBbzdQ==\",\"[password]Senha\":\"SzLkC4hBmJyH+zyUo2skyg==\"}',0,0,''),(12,1,'2022-10-26 11:51:26',1,128,1,'{\"ID\":\"1\",\"Código\":\"PASCOA10\",\"[identificacao]\":\"PASCOA10\",\"Descrição\":\"Promoção de Páscoa (válida)\",\"Desconto\":\"10,00\",\"Carência\":\"0\",\"Início da vigência\":\"26/10/2022 11:51:25\",\"Fim da vigência\":\"25/11/2022 11:51:25\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"50,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Sim\"}',0,0,''),(13,1,'2022-10-26 11:51:26',1,128,2,'{\"ID\":\"2\",\"Código\":\"SZE63B2B\",\"[identificacao]\":\"SZE63B2B\",\"Descrição\":\"Código automático (válida)\",\"Desconto\":\"0,00\",\"Carência\":\"120\",\"Início da vigência\":\"26/10/2022 11:51:25\",\"Fim da vigência\":\"05/11/2022 11:51:25\",\"Produto/serviço\":\"2\",\"UF\":\"MG\",\"Valor mímino\":\"30,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Sim\"}',0,0,''),(14,1,'2022-10-26 11:51:26',1,128,3,'{\"ID\":\"3\",\"Código\":\"EXCLUSIVO20\",\"[identificacao]\":\"EXCLUSIVO20\",\"Descrição\":\"Promoção exclusiva (válida)\",\"Desconto\":\"20,00\",\"Carência\":\"15\",\"Início da vigência\":\"05/11/2022 11:51:25\",\"Fim da vigência\":\"10/11/2022 11:51:25\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"80,00\",\"Exclusivo\":\"Sim\",\"Ativo\":\"Sim\"}',0,0,''),(15,1,'2022-10-26 11:51:26',1,128,4,'{\"ID\":\"4\",\"Código\":\"PASCOA10\",\"[identificacao]\":\"PASCOA10\",\"Descrição\":\"Promoção de Páscoa (duplicado, mas inativa) (válida)\",\"Desconto\":\"20,00\",\"Carência\":\"0\",\"Início da vigência\":\"26/10/2022 11:51:25\",\"Fim da vigência\":\"25/11/2022 11:51:25\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"50,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Não\"}',0,0,''),(16,1,'2022-10-26 11:51:26',2,128,2,'{\"ID\":\"2\",\"Código\":\"SZE63B2BTESTECODIGOX\",\"[identificacao]\":\"SZE63B2BTESTECODIGOX\",\"Descrição\":\"Código automático\",\"Desconto\":\"10,00\",\"Carência\":\"130\",\"Início da vigência\":\"26/10/2022\",\"Fim da vigência\":\"08/11/2022\",\"Produto/serviço\":\"2\",\"UF\":\"MG\",\"Valor mímino\":\"30,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Sim\"}',0,0,''),(17,1,'2022-10-26 11:51:26',2,128,4,'{\"ID\":\"4\",\"Código\":\"PASCOA10TESTECODIGOX\",\"[identificacao]\":\"PASCOA10TESTECODIGOX\",\"Descrição\":\"Promoção de Páscoa (duplicado, mas inativa)\",\"Desconto\":\"30,00\",\"Carência\":\"10\",\"Início da vigência\":\"26/10/2022\",\"Fim da vigência\":\"28/11/2022\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"50,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Não\"}',0,0,''),(18,1,'2022-10-26 11:51:26',2,128,1,'{\"ID\":\"1\",\"Código\":\"PASCOA10TESTECODIGOX\",\"[identificacao]\":\"PASCOA10TESTECODIGOX\",\"Descrição\":\"Promoção de Páscoa\",\"Desconto\":\"20,00\",\"Carência\":\"10\",\"Início da vigência\":\"26/10/2022\",\"Fim da vigência\":\"28/11/2022\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"50,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Sim\"}',0,0,''),(19,1,'2022-10-26 11:51:26',2,128,3,'{\"ID\":\"3\",\"Código\":\"EXCLUSIVO20TESTECODIGOX\",\"[identificacao]\":\"EXCLUSIVO20TESTECODIGOX\",\"Descrição\":\"Promoção exclusiva\",\"Desconto\":\"30,00\",\"Carência\":\"25\",\"Início da vigência\":\"26/10/2022\",\"Fim da vigência\":\"13/11/2022\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"80,00\",\"Exclusivo\":\"Sim\",\"Ativo\":\"Sim\"}',0,0,''),(20,1,'2022-10-26 11:51:26',1,128,5,'{\"ID\":\"5\",\"Código\":\"TESTE50\",\"[identificacao]\":\"TESTE50\",\"Descrição\":\"Promoção (excluir)\",\"Desconto\":\"15,00\",\"Carência\":\"0\",\"Início da vigência\":\"26/10/2022 11:51:25\",\"Fim da vigência\":\"25/11/2022 11:51:25\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"0,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Não\"}',0,0,''),(21,1,'2022-10-26 11:51:26',3,128,5,'{\"ID\":\"5\",\"Código\":\"TESTE50\",\"[identificacao]\":\"TESTE50\",\"Descrição\":\"Promoção (excluir)\",\"Desconto\":\"15,00\",\"Carência\":\"0\",\"Início da vigência\":\"26/10/2022\",\"Fim da vigência\":\"25/11/2022\",\"Produto/serviço\":\"0\",\"UF\":\"\",\"Valor mímino\":\"0,00\",\"Exclusivo\":\"Não\",\"Ativo\":\"Não\"}',0,0,''),(22,1,'2022-10-26 11:51:26',1,55,2,'{\"ID\":\"2\",\"Nome\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Banco de dados\":1}',0,0,''),(23,1,'2022-10-26 11:51:26',1,55,3,'{\"ID\":\"3\",\"Nome\":\"Teste Selenium Group\",\"[identificacao]\":\"Teste Selenium Group\",\"Banco de dados\":1}',0,0,''),(24,1,'2022-10-26 11:51:26',1,55,4,'{\"ID\":\"4\",\"Nome\":\"Stação Modas\",\"[identificacao]\":\"Stação Modas\",\"Banco de dados\":1}',0,0,''),(25,1,'2022-10-26 11:51:26',1,55,5,'{\"ID\":\"5\",\"Nome\":\"Vap Supermercados\",\"[identificacao]\":\"Vap Supermercados\",\"Banco de dados\":1}',0,0,''),(26,1,'2022-10-26 11:51:26',1,55,6,'{\"ID\":\"6\",\"Nome\":\"Supermercado do Roberto\",\"[identificacao]\":\"Supermercado do Roberto\",\"Banco de dados\":1}',0,0,''),(27,1,'2022-10-26 11:51:26',2,55,1,'{\"ID\":\"1\",\"Nome\":\"Sommus Group\",\"[identificacao]\":\"Sommus Group\",\"Banco de dados\":1}',0,0,''),(28,1,'2022-10-26 11:51:26',1,55,7,'{\"ID\":\"7\",\"Nome\":\"Registro excluído\",\"[identificacao]\":\"Registro excluído\",\"Banco de dados\":1}',0,0,''),(29,1,'2022-10-26 11:51:26',3,55,7,'{\"ID\":\"7\",\"Nome\":\"Registro excluído\",\"[identificacao]\":\"Registro excluído\",\"Banco de dados\":1}',0,0,''),(30,1,'2022-10-26 11:51:27',1,43,2,'{\"ID\":\"2\",\"Razão social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome fantasia\":\"TEMPERO CRISTALINA\",\"CNPJ\":\"24.634.181/0001-76\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(31,1,'2022-10-26 11:51:27',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Dr. Luciano\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Não\",\"EmpresaEspecificaId\":2}',43,2,'{\"ID\":\"2\",\"Razão social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome fantasia\":\"TEMPERO CRISTALINA\",\"CNPJ\":\"24.634.181/0001-76\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(32,1,'2022-10-26 11:51:27',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"328\",\"Bairro\":\"Centro\",\"Complemento\":\"2º Andar\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":2}',43,2,'{\"ID\":\"2\",\"Razão social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome fantasia\":\"TEMPERO CRISTALINA\",\"CNPJ\":\"24.634.181/0001-76\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(33,1,'2022-10-26 11:51:27',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\",\"EmpresaEspecificaId\":2}',43,2,'{\"ID\":\"2\",\"Razão social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome fantasia\":\"TEMPERO CRISTALINA\",\"CNPJ\":\"24.634.181/0001-76\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(34,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"YxyKLC7NptoxbzfeG1-76c3czTshajJqWATHTrdhgWQ\",\"ID\":\"2\",\"EmpresaEspecificaId\":2}',0,0,''),(35,1,'2022-10-26 11:51:27',1,43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(36,1,'2022-10-26 11:51:27',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. A\",\"[identificacao]\":\"Av. A\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":3}',43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(37,1,'2022-10-26 11:51:27',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3798653157\",\"[identificacao]\":\"3798653157\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(38,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"dWfzQ_nNl6JF17GiNaUNl4OkZQQoTj_AhY744LpITag\",\"ID\":\"2\",\"EmpresaEspecificaId\":3}',0,0,''),(39,1,'2022-10-26 11:51:27',1,43,4,'{\"ID\":\"4\",\"Razão social\":\"Teste Selenium LTDA\",\"[identificacao]\":\"Teste Selenium LTDA\",\"Nome fantasia\":\"Teste Selenium\",\"CNPJ\":\"21.993.456/0001-70\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":3,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":4}',0,0,''),(40,1,'2022-10-26 11:51:27',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Rua Luiz Guadalupe\",\"[identificacao]\":\"Rua Luiz Guadalupe\",\"Número\":\"247\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":4}',43,4,'{\"ID\":\"4\",\"Razão social\":\"Teste Selenium LTDA\",\"[identificacao]\":\"Teste Selenium LTDA\",\"Nome fantasia\":\"Teste Selenium\",\"CNPJ\":\"21.993.456/0001-70\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":3,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(41,1,'2022-10-26 11:51:27',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3732613333\",\"[identificacao]\":\"3732613333\",\"Observação\":\"\",\"EmpresaEspecificaId\":4}',43,4,'{\"ID\":\"4\",\"Razão social\":\"Teste Selenium LTDA\",\"[identificacao]\":\"Teste Selenium LTDA\",\"Nome fantasia\":\"Teste Selenium\",\"CNPJ\":\"21.993.456/0001-70\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":3,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(42,1,'2022-10-26 11:51:27',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"E-mail\",\"Contato\":\"apsf09@yahoo.com.br\",\"[identificacao]\":\"apsf09@yahoo.com.br\",\"Observação\":\"\",\"EmpresaEspecificaId\":4}',43,4,'{\"ID\":\"4\",\"Razão social\":\"Teste Selenium LTDA\",\"[identificacao]\":\"Teste Selenium LTDA\",\"Nome fantasia\":\"Teste Selenium\",\"CNPJ\":\"21.993.456/0001-70\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":3,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(43,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"gk9SaFJoI_-MrKTkIDucVM-GSCsNc-hipvIA_H0TwOE\",\"ID\":\"2\",\"EmpresaEspecificaId\":4}',0,0,''),(44,1,'2022-10-26 11:51:27',1,43,5,'{\"ID\":\"5\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"Nome fantasia\":\"Stação Modas (Arcos)\",\"CNPJ\":\"01.339.768/0007-42\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":5}',0,0,''),(45,1,'2022-10-26 11:51:27',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Rua das Antilhas\",\"[identificacao]\":\"Rua das Antilhas\",\"Número\":\"300\",\"Bairro\":\"Dom Joaquim\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3107406\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":5}',43,5,'{\"ID\":\"5\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"Nome fantasia\":\"Stação Modas (Arcos)\",\"CNPJ\":\"01.339.768/0007-42\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(46,1,'2022-10-26 11:51:27',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3733511571\",\"[identificacao]\":\"3733511571\",\"Observação\":\"\",\"EmpresaEspecificaId\":5}',43,5,'{\"ID\":\"5\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"Nome fantasia\":\"Stação Modas (Arcos)\",\"CNPJ\":\"01.339.768/0007-42\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(47,1,'2022-10-26 11:51:27',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"37999539601\",\"[identificacao]\":\"37999539601\",\"Observação\":\"\",\"EmpresaEspecificaId\":5}',43,5,'{\"ID\":\"5\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"Nome fantasia\":\"Stação Modas (Arcos)\",\"CNPJ\":\"01.339.768/0007-42\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(48,1,'2022-10-26 11:51:27',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"E-mail\",\"Contato\":\"stacaomodas@hotmail.com\",\"[identificacao]\":\"stacaomodas@hotmail.com\",\"Observação\":\"\",\"EmpresaEspecificaId\":5}',43,5,'{\"ID\":\"5\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Arcos\",\"Nome fantasia\":\"Stação Modas (Arcos)\",\"CNPJ\":\"01.339.768/0007-42\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(49,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"l36Z1F06FuFKAVZNYONiPPwwRrdcx4Oz6ASG34WGcag\",\"ID\":\"2\",\"EmpresaEspecificaId\":5}',0,0,''),(50,1,'2022-10-26 11:51:27',1,43,6,'{\"ID\":\"6\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"Nome fantasia\":\"Stação Modas (Bom Despacho)\",\"CNPJ\":\"01.339.768/0001-57\",\"Inscrição estadual\":\"MG321457011\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":6}',0,0,''),(51,1,'2022-10-26 11:51:27',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Rua das Antilhas\",\"[identificacao]\":\"Rua das Antilhas\",\"Número\":\"300\",\"Bairro\":\"Dom Joaquim\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3107406\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":6}',43,6,'{\"ID\":\"6\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"Nome fantasia\":\"Stação Modas (Bom Despacho)\",\"CNPJ\":\"01.339.768/0001-57\",\"Inscrição estadual\":\"MG321457011\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(52,1,'2022-10-26 11:51:27',1,63,9,'{\"ID\":\"9\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3735224796\",\"[identificacao]\":\"3735224796\",\"Observação\":\"\",\"EmpresaEspecificaId\":6}',43,6,'{\"ID\":\"6\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"Nome fantasia\":\"Stação Modas (Bom Despacho)\",\"CNPJ\":\"01.339.768/0001-57\",\"Inscrição estadual\":\"MG321457011\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(53,1,'2022-10-26 11:51:27',1,63,10,'{\"ID\":\"10\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3735224796\",\"[identificacao]\":\"3735224796\",\"Observação\":\"\",\"EmpresaEspecificaId\":6}',43,6,'{\"ID\":\"6\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"Nome fantasia\":\"Stação Modas (Bom Despacho)\",\"CNPJ\":\"01.339.768/0001-57\",\"Inscrição estadual\":\"MG321457011\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(54,1,'2022-10-26 11:51:27',1,63,11,'{\"ID\":\"11\",\"Tipo\":\"E-mail\",\"Contato\":\"stacaomodas@hotmail.com\",\"[identificacao]\":\"stacaomodas@hotmail.com\",\"Observação\":\"\",\"EmpresaEspecificaId\":6}',43,6,'{\"ID\":\"6\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-BD L1\",\"Nome fantasia\":\"Stação Modas (Bom Despacho)\",\"CNPJ\":\"01.339.768/0001-57\",\"Inscrição estadual\":\"MG321457011\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(55,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"bua1uytSE_LQuSq80nM1ssjFt6yzs1MPJjVr9EPGgns\",\"ID\":\"2\",\"EmpresaEspecificaId\":6}',0,0,''),(56,1,'2022-10-26 11:51:27',1,43,7,'{\"ID\":\"7\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"Nome fantasia\":\"Stação Modas (Divinópolis)\",\"CNPJ\":\"01.339.768/0005-80\",\"Inscrição estadual\":\"mg\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":7}',0,0,''),(57,1,'2022-10-26 11:51:27',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Rua das Antilhas\",\"[identificacao]\":\"Rua das Antilhas\",\"Número\":\"300\",\"Bairro\":\"Dom Joaquim\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3107406\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":7}',43,7,'{\"ID\":\"7\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"Nome fantasia\":\"Stação Modas (Divinópolis)\",\"CNPJ\":\"01.339.768/0005-80\",\"Inscrição estadual\":\"mg\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(58,1,'2022-10-26 11:51:27',1,63,12,'{\"ID\":\"12\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3732133501\",\"[identificacao]\":\"3732133501\",\"Observação\":\"\",\"EmpresaEspecificaId\":7}',43,7,'{\"ID\":\"7\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"Nome fantasia\":\"Stação Modas (Divinópolis)\",\"CNPJ\":\"01.339.768/0005-80\",\"Inscrição estadual\":\"mg\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(59,1,'2022-10-26 11:51:27',1,63,13,'{\"ID\":\"13\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"37988082041\",\"[identificacao]\":\"37988082041\",\"Observação\":\"\",\"EmpresaEspecificaId\":7}',43,7,'{\"ID\":\"7\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"Nome fantasia\":\"Stação Modas (Divinópolis)\",\"CNPJ\":\"01.339.768/0005-80\",\"Inscrição estadual\":\"mg\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(60,1,'2022-10-26 11:51:27',1,63,14,'{\"ID\":\"14\",\"Tipo\":\"E-mail\",\"Contato\":\"stacaomodas@hotmail.com\",\"[identificacao]\":\"stacaomodas@hotmail.com\",\"Observação\":\"\",\"EmpresaEspecificaId\":7}',43,7,'{\"ID\":\"7\",\"Razão social\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"[identificacao]\":\"Stacao Moda Com.Art.Vest.LTDA-Divinopol.\",\"Nome fantasia\":\"Stação Modas (Divinópolis)\",\"CNPJ\":\"01.339.768/0005-80\",\"Inscrição estadual\":\"mg\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":4,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(61,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"DQPgisET_Mx1iT_W9Hx6FGNhMsB4413w6QNv82cNNpA\",\"ID\":\"2\",\"EmpresaEspecificaId\":7}',0,0,''),(62,1,'2022-10-26 11:51:27',1,43,8,'{\"ID\":\"8\",\"Razão social\":\"Vap Minas Supermercado LTDA\",\"[identificacao]\":\"Vap Minas Supermercado LTDA\",\"Nome fantasia\":\"Vap Minas\",\"CNPJ\":\"25.623.570/0001-69\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":8}',0,0,''),(63,1,'2022-10-26 11:51:27',1,44,9,'{\"ID\":\"9\",\"Logradouro\":\"FAUSTINO TEIXEIRA\",\"[identificacao]\":\"FAUSTINO TEIXEIRA\",\"Número\":\"220\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3171303\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":8}',43,8,'{\"ID\":\"8\",\"Razão social\":\"Vap Minas Supermercado LTDA\",\"[identificacao]\":\"Vap Minas Supermercado LTDA\",\"Nome fantasia\":\"Vap Minas\",\"CNPJ\":\"25.623.570/0001-69\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(64,1,'2022-10-26 11:51:27',1,63,15,'{\"ID\":\"15\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3735214301\",\"[identificacao]\":\"3735214301\",\"Observação\":\"\",\"EmpresaEspecificaId\":8}',43,8,'{\"ID\":\"8\",\"Razão social\":\"Vap Minas Supermercado LTDA\",\"[identificacao]\":\"Vap Minas Supermercado LTDA\",\"Nome fantasia\":\"Vap Minas\",\"CNPJ\":\"25.623.570/0001-69\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(65,1,'2022-10-26 11:51:27',1,63,16,'{\"ID\":\"16\",\"Tipo\":\"E-mail\",\"Contato\":\"vap4@grupovap.com.br\",\"[identificacao]\":\"vap4@grupovap.com.br\",\"Observação\":\"\",\"EmpresaEspecificaId\":8}',43,8,'{\"ID\":\"8\",\"Razão social\":\"Vap Minas Supermercado LTDA\",\"[identificacao]\":\"Vap Minas Supermercado LTDA\",\"Nome fantasia\":\"Vap Minas\",\"CNPJ\":\"25.623.570/0001-69\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(66,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"-4qlEILtV-TUO51h3KFZXLgz34eczYY79rFKk6-Cbrs\",\"ID\":\"2\",\"EmpresaEspecificaId\":8}',0,0,''),(67,1,'2022-10-26 11:51:27',1,43,9,'{\"ID\":\"9\",\"Razão social\":\"Vap Mix Supermercados LTDA\",\"[identificacao]\":\"Vap Mix Supermercados LTDA\",\"Nome fantasia\":\"Vap Mix\",\"CNPJ\":\"05.350.238/0001-60\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":9}',0,0,''),(68,1,'2022-10-26 11:51:27',1,44,10,'{\"ID\":\"10\",\"Logradouro\":\"AV ANA ROSA\",\"[identificacao]\":\"AV ANA ROSA\",\"Número\":\"79\",\"Bairro\":\"Ana Rosa\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3171303\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":9}',43,9,'{\"ID\":\"9\",\"Razão social\":\"Vap Mix Supermercados LTDA\",\"[identificacao]\":\"Vap Mix Supermercados LTDA\",\"Nome fantasia\":\"Vap Mix\",\"CNPJ\":\"05.350.238/0001-60\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(69,1,'2022-10-26 11:51:27',1,63,17,'{\"ID\":\"17\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3735214305\",\"[identificacao]\":\"3735214305\",\"Observação\":\"\",\"EmpresaEspecificaId\":9}',43,9,'{\"ID\":\"9\",\"Razão social\":\"Vap Mix Supermercados LTDA\",\"[identificacao]\":\"Vap Mix Supermercados LTDA\",\"Nome fantasia\":\"Vap Mix\",\"CNPJ\":\"05.350.238/0001-60\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(70,1,'2022-10-26 11:51:27',1,63,18,'{\"ID\":\"18\",\"Tipo\":\"E-mail\",\"Contato\":\"vap4@grupovap.com.br\",\"[identificacao]\":\"vap4@grupovap.com.br\",\"Observação\":\"\",\"EmpresaEspecificaId\":9}',43,9,'{\"ID\":\"9\",\"Razão social\":\"Vap Mix Supermercados LTDA\",\"[identificacao]\":\"Vap Mix Supermercados LTDA\",\"Nome fantasia\":\"Vap Mix\",\"CNPJ\":\"05.350.238/0001-60\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(71,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"mV00rtTcYZJbXWD2kpUBAnj93Uw6XN4CWrVHSjis6Jw\",\"ID\":\"2\",\"EmpresaEspecificaId\":9}',0,0,''),(72,1,'2022-10-26 11:51:27',1,43,10,'{\"ID\":\"10\",\"Razão social\":\"Vap Supermercado Bom Despacho\",\"[identificacao]\":\"Vap Supermercado Bom Despacho\",\"Nome fantasia\":\"Vap Supermercados\",\"CNPJ\":\"86.670.643/0001-68\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":10}',0,0,''),(73,1,'2022-10-26 11:51:27',1,44,11,'{\"ID\":\"11\",\"Logradouro\":\"AV GOVERNADOR VALADARES\",\"[identificacao]\":\"AV GOVERNADOR VALADARES\",\"Número\":\"117\",\"Bairro\":\"São Vicente\",\"Complemento\":\"\",\"Cidade\":\"Bom Despacho\",\"Código do município\":\"3171303\",\"CEP\":\"35.600-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":10}',43,10,'{\"ID\":\"10\",\"Razão social\":\"Vap Supermercado Bom Despacho\",\"[identificacao]\":\"Vap Supermercado Bom Despacho\",\"Nome fantasia\":\"Vap Supermercados\",\"CNPJ\":\"86.670.643/0001-68\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(74,1,'2022-10-26 11:51:27',1,63,19,'{\"ID\":\"19\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3735214302\",\"[identificacao]\":\"3735214302\",\"Observação\":\"\",\"EmpresaEspecificaId\":10}',43,10,'{\"ID\":\"10\",\"Razão social\":\"Vap Supermercado Bom Despacho\",\"[identificacao]\":\"Vap Supermercado Bom Despacho\",\"Nome fantasia\":\"Vap Supermercados\",\"CNPJ\":\"86.670.643/0001-68\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(75,1,'2022-10-26 11:51:27',1,63,20,'{\"ID\":\"20\",\"Tipo\":\"E-mail\",\"Contato\":\"vap4@grupovap.com.br\",\"[identificacao]\":\"vap4@grupovap.com.br\",\"Observação\":\"\",\"EmpresaEspecificaId\":10}',43,10,'{\"ID\":\"10\",\"Razão social\":\"Vap Supermercado Bom Despacho\",\"[identificacao]\":\"Vap Supermercado Bom Despacho\",\"Nome fantasia\":\"Vap Supermercados\",\"CNPJ\":\"86.670.643/0001-68\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":5,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(76,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"4APpPygTFKNtPUmvveo6U6B4LAIqsAPnm-53x9gIa-g\",\"ID\":\"2\",\"EmpresaEspecificaId\":10}',0,0,''),(77,1,'2022-10-26 11:51:27',1,43,11,'{\"ID\":\"11\",\"Razão social\":\"Carlos Henrique Gomes Jardim\",\"[identificacao]\":\"Carlos Henrique Gomes Jardim\",\"Nome fantasia\":\"Conceito K\",\"CNPJ\":\"07.393.318/0001-29\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":11}',0,0,''),(78,1,'2022-10-26 11:51:27',1,44,12,'{\"ID\":\"12\",\"Logradouro\":\"R Prof Bartira Mourão\",\"[identificacao]\":\"R Prof Bartira Mourão\",\"Número\":\"459\",\"Bairro\":\"Buritis\",\"Complemento\":\"\",\"Cidade\":\"Belo Horizonte\",\"Código do município\":\"3106200\",\"CEP\":\"30.240-280\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":11}',43,11,'{\"ID\":\"11\",\"Razão social\":\"Carlos Henrique Gomes Jardim\",\"[identificacao]\":\"Carlos Henrique Gomes Jardim\",\"Nome fantasia\":\"Conceito K\",\"CNPJ\":\"07.393.318/0001-29\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\"}'),(79,1,'2022-10-26 11:51:27',1,63,21,'{\"ID\":\"21\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(031) 99324-5860\",\"[identificacao]\":\"(031) 99324-5860\",\"Observação\":\"\",\"EmpresaEspecificaId\":11}',43,11,'{\"ID\":\"11\",\"Razão social\":\"Carlos Henrique Gomes Jardim\",\"[identificacao]\":\"Carlos Henrique Gomes Jardim\",\"Nome fantasia\":\"Conceito K\",\"CNPJ\":\"07.393.318/0001-29\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\"}'),(80,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"0GuQE-WoimfHzmbaNQLxD0TbuVuXeVhDjJTJR_M_gbQ\",\"ID\":\"2\",\"EmpresaEspecificaId\":11}',0,0,''),(81,1,'2022-10-26 11:51:27',1,43,12,'{\"ID\":\"12\",\"Razão social\":\"Júlio Rodrigues da Silva\",\"[identificacao]\":\"Júlio Rodrigues da Silva\",\"Nome fantasia\":\"Delta\",\"CNPJ\":\"76.189.544/0001-05\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":12}',0,0,''),(82,1,'2022-10-26 11:51:27',1,44,13,'{\"ID\":\"13\",\"Logradouro\":\"Rua Geraldo de Abreu\",\"[identificacao]\":\"Rua Geraldo de Abreu\",\"Número\":\"175\",\"Bairro\":\"São José\",\"Complemento\":\"\",\"Cidade\":\"Santo Antônio do Monte\",\"Código do município\":\"3160405\",\"CEP\":\"35.560-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":12}',43,12,'{\"ID\":\"12\",\"Razão social\":\"Júlio Rodrigues da Silva\",\"[identificacao]\":\"Júlio Rodrigues da Silva\",\"Nome fantasia\":\"Delta\",\"CNPJ\":\"76.189.544/0001-05\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\"}'),(83,1,'2022-10-26 11:51:27',1,63,22,'{\"ID\":\"22\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(031) 99324-5860\",\"[identificacao]\":\"(031) 99324-5860\",\"Observação\":\"\",\"EmpresaEspecificaId\":12}',43,12,'{\"ID\":\"12\",\"Razão social\":\"Júlio Rodrigues da Silva\",\"[identificacao]\":\"Júlio Rodrigues da Silva\",\"Nome fantasia\":\"Delta\",\"CNPJ\":\"76.189.544/0001-05\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\"}'),(84,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"mYavedVxtDuKmfq25XUba9O3GlY5OloO7ZoPktYlIP8\",\"ID\":\"2\",\"EmpresaEspecificaId\":12}',0,0,''),(85,1,'2022-10-26 11:51:27',1,43,13,'{\"ID\":\"13\",\"Razão social\":\"Ismar Roberto\",\"[identificacao]\":\"Ismar Roberto\",\"Nome fantasia\":\"Supermercado do Roberto\",\"CNPJ\":\"18.558.288/0001-80\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":13}',0,0,''),(86,1,'2022-10-26 11:51:27',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"hVmfzyEu1UpnPPymHdyWgk0N_o9xewkrU_2QFIkjM2w\",\"ID\":\"2\",\"EmpresaEspecificaId\":13}',0,0,''),(87,1,'2022-10-26 11:51:28',1,43,14,'{\"ID\":\"14\",\"Razão social\":\"Registro para exclusão\",\"[identificacao]\":\"Registro para exclusão\",\"Nome fantasia\":\"Registro para exclusão\",\"CNPJ\":\"47.214.601/0001-60\",\"Inscrição estadual\":\"0012345678909\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":14}',0,0,''),(88,1,'2022-10-26 11:51:28',1,44,14,'{\"ID\":\"14\",\"Logradouro\":\"Av. 1\",\"[identificacao]\":\"Av. 1\",\"Número\":\"2\",\"Bairro\":\"3\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":14}',43,14,'{\"ID\":\"14\",\"Razão social\":\"Registro para exclusão\",\"[identificacao]\":\"Registro para exclusão\",\"Nome fantasia\":\"Registro para exclusão\",\"CNPJ\":\"47.214.601/0001-60\",\"Inscrição estadual\":\"0012345678909\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(89,1,'2022-10-26 11:51:28',1,63,23,'{\"ID\":\"23\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"03732610000\",\"[identificacao]\":\"03732610000\",\"Observação\":\"\",\"EmpresaEspecificaId\":14}',43,14,'{\"ID\":\"14\",\"Razão social\":\"Registro para exclusão\",\"[identificacao]\":\"Registro para exclusão\",\"Nome fantasia\":\"Registro para exclusão\",\"CNPJ\":\"47.214.601/0001-60\",\"Inscrição estadual\":\"0012345678909\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(90,1,'2022-10-26 11:51:28',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"zOnCKlMvx_yhC4N2l1N5GUS9q1CbBK-BwXPQvGzoso4\",\"ID\":\"2\",\"EmpresaEspecificaId\":14}',0,0,''),(91,1,'2022-10-26 11:51:28',3,43,12,'{\"ID\":\"12\",\"Razão social\":\"Júlio Rodrigues da Silva\",\"[identificacao]\":\"Júlio Rodrigues da Silva\",\"Nome fantasia\":\"Delta\",\"CNPJ\":\"76.189.544/0001-05\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":0,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":12}',0,0,''),(92,1,'2022-10-26 11:51:28',2,43,1,'{\"ID\":\"1\",\"Razão social\":\"Sommus Automacao Comercial Ltda - Me\",\"[identificacao]\":\"Sommus Automacao Comercial Ltda - Me\",\"Nome fantasia\":\"Sommus Sistemas\",\"CNPJ\":\"04.717.475/0001-54\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(93,1,'2022-10-26 11:51:28',1,17,1,'{\"ID\":\"1\",\"Nome\":\"Vendedor\",\"[identificacao]\":\"Vendedor\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Incluir\"},{\"ID\":\"2\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Alterar\"},{\"ID\":\"5\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Definir preços\"},{\"ID\":\"7\",\"Módulo\":\"Compras\",\"Opção\":\"Fornecedores\",\"Ação\":\"Alterar\"},{\"ID\":\"8\",\"Módulo\":\"Compras\",\"Opção\":\"Fornecedores\",\"Ação\":\"Excluir\"},{\"ID\":\"10\",\"Módulo\":\"Compras\",\"Opção\":\"Transportadores\",\"Ação\":\"Incluir\"},{\"ID\":\"28\",\"Módulo\":\"Compras\",\"Opção\":\"Pedidos\",\"Ação\":\"Excluir\"}]}}',0,0,''),(94,1,'2022-10-26 11:51:28',1,17,2,'{\"ID\":\"2\",\"Nome\":\"Grupo 2\",\"[identificacao]\":\"Grupo 2\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Incluir\"},{\"ID\":\"2\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Alterar\"},{\"ID\":\"5\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Definir preços\"}]}}',0,0,''),(95,1,'2022-10-26 11:51:28',1,17,3,'{\"ID\":\"3\",\"Nome\":\"Adm\",\"[identificacao]\":\"Adm\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Incluir\"}]}}',0,0,''),(96,1,'2022-10-26 11:51:29',2,17,3,'{\"ID\":\"3\",\"Nome\":\"Administrador\",\"[identificacao]\":\"Administrador\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Incluir\"},{\"ID\":\"2\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Alterar\"},{\"ID\":\"6\",\"Módulo\":\"Compras\",\"Opção\":\"Fornecedores\",\"Ação\":\"Incluir\"},{\"ID\":\"10\",\"Módulo\":\"Compras\",\"Opção\":\"Transportadores\",\"Ação\":\"Incluir\"},{\"ID\":\"11\",\"Módulo\":\"Compras\",\"Opção\":\"Transportadores\",\"Ação\":\"Alterar\"},{\"ID\":\"20\",\"Módulo\":\"Compras\",\"Opção\":\"Requisições\",\"Ação\":\"Excluir\"},{\"ID\":\"22\",\"Módulo\":\"Compras\",\"Opção\":\"Cotações\",\"Ação\":\"Incluir\"},{\"ID\":\"28\",\"Módulo\":\"Compras\",\"Opção\":\"Pedidos\",\"Ação\":\"Excluir\"}]}}',0,0,''),(97,1,'2022-10-26 11:51:29',2,17,3,'{\"ID\":\"3\",\"Nome\":\"Administrador\",\"[identificacao]\":\"Administrador\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"Compras\",\"Opção\":\"Produtos\",\"Ação\":\"Incluir\"},{\"ID\":\"10\",\"Módulo\":\"Compras\",\"Opção\":\"Transportadores\",\"Ação\":\"Incluir\"},{\"ID\":\"11\",\"Módulo\":\"Compras\",\"Opção\":\"Transportadores\",\"Ação\":\"Alterar\"},{\"ID\":\"20\",\"Módulo\":\"Compras\",\"Opção\":\"Requisições\",\"Ação\":\"Excluir\"},{\"ID\":\"22\",\"Módulo\":\"Compras\",\"Opção\":\"Cotações\",\"Ação\":\"Incluir\"}]}}',0,0,''),(98,1,'2022-10-26 11:51:29',1,17,4,'{\"ID\":\"4\",\"Nome\":\"Grupo teste para ser excluido\",\"[identificacao]\":\"Grupo teste para ser excluido\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":[{\"ID\":\"54\",\"Módulo\":\"Compras\",\"Opção\":\"Regras tributárias\",\"Ação\":\"Incluir\"}]}}',0,0,''),(99,1,'2022-10-26 11:51:29',3,17,4,'{\"ID\":\"4\",\"Nome\":\"Grupo teste para ser excluido\",\"[identificacao]\":\"Grupo teste para ser excluido\",\"Ativo\":\"Sim\",\"Permissões\":{\"Autorizações\":{}}}',0,0,''),(100,1,'2022-10-26 11:51:29',1,18,2,'{\"ID\":\"2\",\"E-mail\":\"sommus2@sommus.com\",\"[identificacao]\":\"sommus2@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(101,1,'2022-10-26 11:51:29',1,96,2,'{\"ID\":\"2\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,2,'{\"ID\":\"2\",\"E-mail\":\"sommus2@sommus.com\",\"[identificacao]\":\"sommus2@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(102,1,'2022-10-26 11:51:30',1,18,3,'{\"ID\":\"3\",\"E-mail\":\"usuario@selenium.com\",\"[identificacao]\":\"usuario@selenium.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(103,1,'2022-10-26 11:51:30',1,96,3,'{\"ID\":\"3\",\"Grupo de empresa\":3,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,3,'{\"ID\":\"3\",\"E-mail\":\"usuario@selenium.com\",\"[identificacao]\":\"usuario@selenium.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(104,1,'2022-10-26 11:51:30',1,18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(105,1,'2022-10-26 11:51:30',1,96,4,'{\"ID\":\"4\",\"Grupo de empresa\":4,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(106,4,'2022-10-26 11:51:31',1,18,5,'{\"ID\":\"5\",\"E-mail\":\"admninempresastacao1@sommus.com\",\"[identificacao]\":\"admninempresastacao1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(107,4,'2022-10-26 11:51:31',1,96,5,'{\"ID\":\"5\",\"Grupo de empresa\":4,\"Empresa\":5,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Sim\"}',18,5,'{\"ID\":\"5\",\"E-mail\":\"admninempresastacao1@sommus.com\",\"[identificacao]\":\"admninempresastacao1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(108,4,'2022-10-26 11:51:31',1,18,6,'{\"ID\":\"6\",\"E-mail\":\"usuariostacao1@sommus.com\",\"[identificacao]\":\"usuariostacao1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(109,4,'2022-10-26 11:51:31',1,96,6,'{\"ID\":\"6\",\"Grupo de empresa\":4,\"Empresa\":5,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":[{\"ID\":\"66\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"112\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"22\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"33\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"44\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"11\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"55\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"77\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"88\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"99\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,6,'{\"ID\":\"6\",\"E-mail\":\"usuariostacao1@sommus.com\",\"[identificacao]\":\"usuariostacao1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(110,1,'2022-10-26 11:51:32',1,18,7,'{\"ID\":\"7\",\"E-mail\":\"admninvap@sommus.com\",\"[identificacao]\":\"admninvap@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(111,1,'2022-10-26 11:51:32',1,96,7,'{\"ID\":\"7\",\"Grupo de empresa\":5,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,7,'{\"ID\":\"7\",\"E-mail\":\"admninvap@sommus.com\",\"[identificacao]\":\"admninvap@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(112,7,'2022-10-26 11:51:32',1,18,8,'{\"ID\":\"8\",\"E-mail\":\"usuariovap1@sommus.com\",\"[identificacao]\":\"usuariovap1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(113,7,'2022-10-26 11:51:32',1,96,8,'{\"ID\":\"8\",\"Grupo de empresa\":5,\"Empresa\":10,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":[{\"ID\":\"29\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"42\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"111\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"72\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"2\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"6\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"102\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"33\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"47\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"92\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"25\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,8,'{\"ID\":\"8\",\"E-mail\":\"usuariovap1@sommus.com\",\"[identificacao]\":\"usuariovap1@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(114,1,'2022-10-26 11:51:32',1,18,9,'{\"ID\":\"9\",\"E-mail\":\"admpostoliberdade@sommus.com\",\"[identificacao]\":\"admpostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(115,1,'2022-10-26 11:51:32',1,96,9,'{\"ID\":\"9\",\"Grupo de empresa\":2,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,9,'{\"ID\":\"9\",\"E-mail\":\"admpostoliberdade@sommus.com\",\"[identificacao]\":\"admpostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(116,9,'2022-10-26 11:51:33',1,18,10,'{\"ID\":\"10\",\"E-mail\":\"usuariopostoliberdade@sommus.com\",\"[identificacao]\":\"usuariopostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(117,9,'2022-10-26 11:51:33',1,96,10,'{\"ID\":\"10\",\"Grupo de empresa\":2,\"Empresa\":3,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"2\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"5\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"8\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,10,'{\"ID\":\"10\",\"E-mail\":\"usuariopostoliberdade@sommus.com\",\"[identificacao]\":\"usuariopostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(118,2,'2022-10-26 11:51:33',2,18,2,'{\"ID\":\"2\",\"E-mail\":\"sommus2@sommus.com\",\"[identificacao]\":\"sommus2@sommus.com\",\"[password]Senha\":\"4ac1b8abceb80628e5349bed3dae6c23\",\"Nome\":\"Sommus Sistemas 2\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(119,3,'2022-10-26 11:51:34',2,18,3,'{\"ID\":\"3\",\"E-mail\":\"usuario@selenium.com\",\"[identificacao]\":\"usuario@selenium.com\",\"[password]Senha\":\"e2fa14969e900cf70eb2e22dcec6c085\",\"Nome\":\"Usuário Selenium\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(120,9,'2022-10-26 11:51:35',2,18,9,'{\"ID\":\"9\",\"E-mail\":\"admpostoliberdade@sommus.com\",\"[identificacao]\":\"admpostoliberdade@sommus.com\",\"[password]Senha\":\"034717746497c8c1f3f5ffa6b61f0830\",\"Nome\":\"Administrador\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(121,1,'2022-10-26 11:51:35',1,96,11,'{\"ID\":\"11\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(122,1,'2022-10-26 11:51:35',1,96,12,'{\"ID\":\"12\",\"Grupo de empresa\":2,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(123,1,'2022-10-26 11:51:35',2,96,2,'{\"ID\":\"2\",\"Grupo de empresa\":1,\"Empresa\":2,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Sim\"}',18,2,'{\"ID\":\"2\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(124,1,'2022-10-26 11:51:35',2,96,2,'{\"ID\":\"2\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,2,'{\"ID\":\"2\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(125,1,'2022-10-26 11:51:35',2,96,2,'{\"ID\":\"2\",\"Grupo de empresa\":1,\"Empresa\":2,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,2,'{\"ID\":\"2\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(126,1,'2022-10-26 11:51:36',2,96,2,'{\"ID\":\"2\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,2,'{\"ID\":\"2\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(127,9,'2022-10-26 11:51:36',2,96,10,'{\"ID\":\"10\",\"Grupo de empresa\":2,\"Empresa\":3,\"Grupo de usuário\":2,\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"2\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"5\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"8\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,10,'{\"ID\":\"10\",\"E-mail\":\"usuariopostoliberdade@sommus.com\",\"[identificacao]\":\"usuariopostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(128,1,'2022-10-26 11:51:36',2,96,11,'{\"ID\":\"11\",\"Grupo de empresa\":1,\"Empresa\":2,\"Grupo de usuário\":1,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Sim\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(129,1,'2022-10-26 11:51:36',2,96,11,'{\"ID\":\"11\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"\",\"[identificacao]\":\"\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(130,1,'2022-10-26 11:51:36',1,18,11,'{\"ID\":\"11\",\"E-mail\":\"admgrupo@sommus.com\",\"[identificacao]\":\"admgrupo@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(131,1,'2022-10-26 11:51:36',1,96,13,'{\"ID\":\"13\",\"Grupo de empresa\":1,\"Empresa\":1,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Sim\"}',18,11,'{\"ID\":\"11\",\"E-mail\":\"admgrupo@sommus.com\",\"[identificacao]\":\"admgrupo@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(132,1,'2022-10-26 11:51:37',1,18,12,'{\"ID\":\"12\",\"E-mail\":\"admexcluido@sommus.com\",\"[identificacao]\":\"admexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(133,1,'2022-10-26 11:51:37',1,96,14,'{\"ID\":\"14\",\"Grupo de empresa\":0,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Sim\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,12,'{\"ID\":\"12\",\"E-mail\":\"admexcluido@sommus.com\",\"[identificacao]\":\"admexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(134,1,'2022-10-26 11:51:37',3,18,12,'{\"ID\":\"12\",\"E-mail\":\"admexcluido@sommus.com\",\"[identificacao]\":\"admexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(135,1,'2022-10-26 11:51:37',1,18,13,'{\"ID\":\"13\",\"E-mail\":\"admgrupoexcluido@sommus.com\",\"[identificacao]\":\"admgrupoexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(136,1,'2022-10-26 11:51:37',1,96,15,'{\"ID\":\"15\",\"Grupo de empresa\":1,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,13,'{\"ID\":\"13\",\"E-mail\":\"admgrupoexcluido@sommus.com\",\"[identificacao]\":\"admgrupoexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(137,1,'2022-10-26 11:51:38',3,18,13,'{\"ID\":\"13\",\"E-mail\":\"admgrupoexcluido@sommus.com\",\"[identificacao]\":\"admgrupoexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(138,1,'2022-10-26 11:51:38',1,18,14,'{\"ID\":\"14\",\"E-mail\":\"admempresaexcluido@sommus.com\",\"[identificacao]\":\"admempresaexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(139,1,'2022-10-26 11:51:38',1,96,16,'{\"ID\":\"16\",\"Grupo de empresa\":1,\"Empresa\":2,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Sim\"}',18,14,'{\"ID\":\"14\",\"E-mail\":\"admempresaexcluido@sommus.com\",\"[identificacao]\":\"admempresaexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(140,1,'2022-10-26 11:51:38',3,18,14,'{\"ID\":\"14\",\"E-mail\":\"admempresaexcluido@sommus.com\",\"[identificacao]\":\"admempresaexcluido@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(141,1,'2022-10-26 11:51:39',1,18,15,'{\"ID\":\"15\",\"E-mail\":\"dev@sommus.com\",\"[identificacao]\":\"dev@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(142,1,'2022-10-26 11:51:39',1,96,17,'{\"ID\":\"17\",\"Grupo de empresa\":1,\"Empresa\":1,\"Grupo de usuário\":1,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,15,'{\"ID\":\"15\",\"E-mail\":\"dev@sommus.com\",\"[identificacao]\":\"dev@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(143,9,'2022-10-26 11:51:52',2,96,10,'{\"ID\":\"10\",\"Grupo de empresa\":2,\"Empresa\":3,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"2\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"5\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"8\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,10,'{\"ID\":\"10\",\"E-mail\":\"usuariopostoliberdade@sommus.com\",\"[identificacao]\":\"usuariopostoliberdade@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(144,1,'2022-10-26 11:51:57',2,43,1,'{\"ID\":\"1\",\"Razão social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome fantasia\":\"Sommus Sistemas\",\"CNPJ\":\"04.717.475/0001-54\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(145,1,'2022-10-26 11:51:57',2,43,2,'{\"ID\":\"2\",\"Razão social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome fantasia\":\"TEMPERO CRISTALINA\",\"CNPJ\":\"24.634.181/0001-76\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":1,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(146,1,'2022-10-26 11:51:57',2,43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(147,1,'2022-10-26 11:51:57',2,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. Almirante Tamandaré\",\"[identificacao]\":\"Av. Almirante Tamandaré\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":3}',43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(148,1,'2022-10-26 11:51:57',2,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"037998653157\",\"[identificacao]\":\"037998653157\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(149,1,'2022-10-26 11:51:57',1,63,24,'{\"ID\":\"24\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"037999887766\",\"[identificacao]\":\"037999887766\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',43,3,'{\"ID\":\"3\",\"Razão social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome fantasia\":\"Posto Liberdade\",\"CNPJ\":\"87.976.874/0001-67\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":2,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(150,1,'2022-10-26 11:53:11',1,46,1,'{\"ID\":\"1\",\"Nome\":\"Diamante\",\"[identificacao]\":\"Diamante\",\"Serviço\":1,\"Quantidade de usuários\":\"5\",\"Subtotal\":\"160,00\",\"Desconto\":\"6,00\",\"Valor total\":\"154,00\",\"Módulos\":\"Compras / Vendas / Serviços / Finanças / Contador / Gestor\"}',0,0,''),(151,1,'2022-10-26 11:53:11',1,46,2,'{\"ID\":\"2\",\"Nome\":\"Ouro\",\"[identificacao]\":\"Ouro\",\"Serviço\":1,\"Quantidade de usuários\":\"3\",\"Subtotal\":\"110,00\",\"Desconto\":\"5,00\",\"Valor total\":\"105,00\",\"Módulos\":\"Vendas / Serviços / Finanças / Contador / Gestor\"}',0,0,''),(152,1,'2022-10-26 11:53:11',1,46,3,'{\"ID\":\"3\",\"Nome\":\"Prata\",\"[identificacao]\":\"Prata\",\"Serviço\":1,\"Quantidade de usuários\":\"2\",\"Subtotal\":\"80,00\",\"Desconto\":\"0,00\",\"Valor total\":\"80,00\",\"Módulos\":\"Serviços / Finanças / Contador / Gestor\"}',0,0,''),(153,1,'2022-10-26 11:53:11',1,46,4,'{\"ID\":\"4\",\"Nome\":\"Bronze\",\"[identificacao]\":\"Bronze\",\"Serviço\":1,\"Quantidade de usuários\":\"1\",\"Subtotal\":\"50,00\",\"Desconto\":\"0,00\",\"Valor total\":\"50,00\",\"Módulos\":\"Serviços / Contador / Gestor\"}',0,0,''),(154,1,'2022-10-26 11:53:11',1,46,5,'{\"ID\":\"5\",\"Nome\":\"Diamante\",\"[identificacao]\":\"Diamante\",\"Serviço\":2,\"Quantidade de usuários\":\"5\",\"Subtotal\":\"100,00\",\"Desconto\":\"0,00\",\"Valor total\":\"100,00\",\"Módulos\":\"\"}',0,0,''),(155,1,'2022-10-26 11:53:11',1,46,6,'{\"ID\":\"6\",\"Nome\":\"Ouro\",\"[identificacao]\":\"Ouro\",\"Serviço\":2,\"Quantidade de usuários\":\"3\",\"Subtotal\":\"60,00\",\"Desconto\":\"0,00\",\"Valor total\":\"60,00\",\"Módulos\":\"\"}',0,0,''),(156,1,'2022-10-26 11:53:11',1,46,7,'{\"ID\":\"7\",\"Nome\":\"Prata\",\"[identificacao]\":\"Prata\",\"Serviço\":2,\"Quantidade de usuários\":\"2\",\"Subtotal\":\"40,00\",\"Desconto\":\"0,00\",\"Valor total\":\"40,00\",\"Módulos\":\"\"}',0,0,''),(157,1,'2022-10-26 11:53:11',1,46,8,'{\"ID\":\"8\",\"Nome\":\"Nome de teste\",\"[identificacao]\":\"Nome de teste\",\"Serviço\":2,\"Quantidade de usuários\":\"1\",\"Subtotal\":\"20,00\",\"Desconto\":\"0,00\",\"Valor total\":\"20,00\",\"Módulos\":\"\"}',0,0,''),(158,1,'2022-10-26 11:53:11',1,46,9,'{\"ID\":\"9\",\"Nome\":\"Diamante\",\"[identificacao]\":\"Diamante\",\"Serviço\":3,\"Quantidade de usuários\":\"5\",\"Subtotal\":\"150,00\",\"Desconto\":\"0,00\",\"Valor total\":\"150,00\",\"Módulos\":\"\"}',0,0,''),(159,1,'2022-10-26 11:53:11',1,46,10,'{\"ID\":\"10\",\"Nome\":\"Ouro\",\"[identificacao]\":\"Ouro\",\"Serviço\":3,\"Quantidade de usuários\":\"3\",\"Subtotal\":\"90,00\",\"Desconto\":\"0,00\",\"Valor total\":\"90,00\",\"Módulos\":\"\"}',0,0,''),(160,1,'2022-10-26 11:53:11',1,46,11,'{\"ID\":\"11\",\"Nome\":\"Prata\",\"[identificacao]\":\"Prata\",\"Serviço\":3,\"Quantidade de usuários\":\"2\",\"Subtotal\":\"60,00\",\"Desconto\":\"0,00\",\"Valor total\":\"60,00\",\"Módulos\":\"\"}',0,0,''),(161,1,'2022-10-26 11:53:11',1,46,12,'{\"ID\":\"12\",\"Nome\":\"Bronze\",\"[identificacao]\":\"Bronze\",\"Serviço\":3,\"Quantidade de usuários\":\"1\",\"Subtotal\":\"30,00\",\"Desconto\":\"0,00\",\"Valor total\":\"30,00\",\"Módulos\":\"\"}',0,0,''),(162,1,'2022-10-26 11:53:11',1,46,13,'{\"ID\":\"13\",\"Nome\":\"Ouro\",\"[identificacao]\":\"Ouro\",\"Serviço\":4,\"Quantidade de usuários\":\"3\",\"Subtotal\":\"150,00\",\"Desconto\":\"0,00\",\"Valor total\":\"150,00\",\"Módulos\":\"\"}',0,0,''),(163,1,'2022-10-26 11:53:11',1,46,14,'{\"ID\":\"14\",\"Nome\":\"Prata\",\"[identificacao]\":\"Prata\",\"Serviço\":4,\"Quantidade de usuários\":\"2\",\"Subtotal\":\"100,00\",\"Desconto\":\"0,00\",\"Valor total\":\"100,00\",\"Módulos\":\"\"}',0,0,''),(164,1,'2022-10-26 11:53:11',1,46,15,'{\"ID\":\"15\",\"Nome\":\"Bronze\",\"[identificacao]\":\"Bronze\",\"Serviço\":4,\"Quantidade de usuários\":\"1\",\"Subtotal\":\"50,00\",\"Desconto\":\"0,00\",\"Valor total\":\"50,00\",\"Módulos\":\"\"}',0,0,''),(165,1,'2022-10-26 11:53:11',2,46,8,'{\"ID\":\"8\",\"Nome\":\"Bronze\",\"[identificacao]\":\"Bronze\",\"Serviço\":2,\"Quantidade de usuários\":\"1\",\"Subtotal\":\"20,00\",\"Desconto\":\"0,00\",\"Valor total\":\"20,00\",\"Módulos\":\"\"}',0,0,''),(166,1,'2022-10-26 11:53:12',1,46,16,'{\"ID\":\"16\",\"Nome\":\"registro para exclusão\",\"[identificacao]\":\"registro para exclusão\",\"Serviço\":4,\"Quantidade de usuários\":\"10\",\"Subtotal\":\"500,00\",\"Desconto\":\"0,00\",\"Valor total\":\"500,00\",\"Módulos\":\"\"}',0,0,''),(167,1,'2022-10-26 11:53:12',3,46,16,'{\"ID\":\"16\",\"Nome\":\"registro para exclusão\",\"[identificacao]\":\"registro para exclusão\",\"Serviço\":4,\"Quantidade de usuários\":\"10\",\"Subtotal\":\"0,00\",\"Desconto\":\"0,00\",\"Valor total\":\"0,00\",\"Módulos\":\"\"}',0,0,''),(168,NULL,'2022-10-26 11:53:12',1,18,16,'{\"ID\":\"16\",\"E-mail\":\"novousuario@sommus-test.com\",\"[identificacao]\":\"novousuario@sommus-test.com\",\"[password]Senha\":\"f246f076119ee34fecacd4013aa35885\",\"Nome\":\"Usuario que se auto cadastrou\",\"Ativo\":\"Não\"}',0,0,''),(169,NULL,'2022-10-26 11:53:12',1,96,18,'{\"ID\":\"18\",\"Grupo de empresa\":8,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,16,'{\"ID\":\"16\",\"E-mail\":\"novousuario@sommus-test.com\",\"[identificacao]\":\"novousuario@sommus-test.com\",\"[password]Senha\":\"f246f076119ee34fecacd4013aa35885\",\"Nome\":\"Usuario que se auto cadastrou\",\"Ativo\":\"Não\"}'),(170,NULL,'2022-10-26 11:53:12',1,43,15,'{\"ID\":\"15\",\"Razão social\":\"Empresa do usuário que se auto cadastrou\",\"[identificacao]\":\"Empresa do usuário que se auto cadastrou\",\"Nome fantasia\":\"\",\"CNPJ\":\"31.948.004/0001-20\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":8,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":15}',0,0,''),(171,NULL,'2022-10-26 11:53:12',1,55,8,'{\"ID\":\"8\",\"Nome\":\"Empresa do usuário que se auto cadastrou\",\"[identificacao]\":\"Empresa do usuário que se auto cadastrou\",\"Banco de dados\":2}',0,0,''),(172,1,'2022-10-26 11:53:25',1,56,1,'{\"Produto\":\"4\",\"Tipo\":\"ClientId\",\"Key\":\"tqApk0ON2xIEkmuVPVRf1uMk3OftT5hVpgCXruIqgPg\",\"ID\":\"1\",\"EmpresaEspecificaId\":2}',0,0,''),(173,1,'2022-10-26 11:53:25',1,56,1,'{\"Produto\":\"0\",\"Tipo\":\"ClientId\",\"Key\":\"B0oEOhXQJc5Tqd7Sh4y6aSlPjVP0F9mIS_iCRbG1o80\",\"ID\":\"1\",\"EmpresaEspecificaId\":2}',0,0,''),(174,1,'2022-10-26 11:53:25',2,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"uMafnDIB1V36TWwf6KF_Pi8ututgJ\",\"ID\":\"2\",\"EmpresaEspecificaId\":2}',0,0,''),(175,1,'2022-10-26 11:53:25',1,56,7,'{\"Produto\":\"0\",\"Tipo\":\"integration_key\",\"Key\":\"GYBtKWR5QjSwVqt2ikFs72qOCkMLtiR_aIVwRu0\",\"ID\":\"7\",\"EmpresaEspecificaId\":2}',0,0,''),(176,1,'2022-10-26 11:53:25',1,56,3,'{\"Produto\":\"0\",\"Tipo\":\"ApiKey\",\"Key\":\"Insira aqui sua chave de acesso a API do PenseBank\",\"ID\":\"3\",\"EmpresaEspecificaId\":2}',0,0,''),(177,1,'2022-10-26 11:53:25',2,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"abc123\",\"ID\":\"2\",\"EmpresaEspecificaId\":2}',0,0,''),(178,1,'2022-10-26 11:53:25',2,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"uMafnDIB1V36TWwf6KF_Pi8ututgJ\",\"ID\":\"2\",\"EmpresaEspecificaId\":2}',0,0,''),(179,1,'2022-10-26 11:53:25',2,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"802qkmB3mBn89N55cxVMujuCd4RgaFlxDV7uHEY5EYs\",\"ID\":\"2\",\"EmpresaEspecificaId\":2}',0,0,''),(180,1,'2022-10-26 11:53:25',2,56,7,'{\"Produto\":\"0\",\"Tipo\":\"integration_key\",\"Key\":\"uMafnDIB1V36TWwf6KF_Pi8ututgJ\",\"ID\":\"7\",\"EmpresaEspecificaId\":2}',0,0,''),(181,1,'2022-10-26 11:53:30',1,47,1,'{\"ID\":\"1\",\"Módulo\":\"Compras\",\"[identificacao]\":\"Compras\",\"Avaliação\":\"Muito Satisfeito\",\"Rota\":\"Teste\",\"Comentário\":\"Teste\",\"EmpresaEspecificaId\":1}',0,0,''),(182,1,'2022-10-26 11:53:30',1,62,1,'{\"ID\":\"1\",\"Descrição\":\"[Teste] Treinamento do módulo Compra\",\"[identificacao]\":\"[Teste] Treinamento do módulo Compra\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 11:53:00\",\"Data/hora término\":\"27/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(183,1,'2022-10-26 11:53:30',1,62,2,'{\"ID\":\"2\",\"Descrição\":\"Treinamento do módulo Finanças\",\"[identificacao]\":\"Treinamento do módulo Finanças\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 13:53:00\",\"Data/hora término\":\"27/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(184,1,'2022-10-26 11:53:30',1,62,3,'{\"ID\":\"3\",\"Descrição\":\"Treinamento do módulo Folha\",\"[identificacao]\":\"Treinamento do módulo Folha\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(185,1,'2022-10-26 11:53:30',1,62,4,'{\"ID\":\"4\",\"Descrição\":\"Treinamento do módulo Venda\",\"[identificacao]\":\"Treinamento do módulo Venda\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(186,1,'2022-10-26 11:53:30',1,62,5,'{\"ID\":\"5\",\"Descrição\":\"Treinamento do módulo Contador\",\"[identificacao]\":\"Treinamento do módulo Contador\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 13:53:00\",\"Data/hora término\":\"28/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(187,1,'2022-10-26 11:53:30',1,62,6,'{\"ID\":\"6\",\"Descrição\":\"Treinamento do módulo Compra\",\"[identificacao]\":\"Treinamento do módulo Compra\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 11:53:00\",\"Data/hora término\":\"28/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(188,1,'2022-10-26 11:53:30',1,62,7,'{\"ID\":\"7\",\"Descrição\":\"Treinamento do módulo CRM\",\"[identificacao]\":\"Treinamento do módulo CRM\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(189,1,'2022-10-26 11:53:30',2,62,1,'{\"ID\":\"1\",\"Descrição\":\"Treinamento do módulo Administração\",\"[identificacao]\":\"Treinamento do módulo Administração\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 15:03:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(190,1,'2022-10-26 11:53:30',1,62,8,'{\"ID\":\"8\",\"Descrição\":\"Treinamento para teste de exclusão\",\"[identificacao]\":\"Treinamento para teste de exclusão\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 11:53:00\",\"Data/hora término\":\"27/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(191,1,'2022-10-26 11:53:30',3,62,8,'{\"ID\":\"8\",\"Descrição\":\"Treinamento para teste de exclusão\",\"[identificacao]\":\"Treinamento para teste de exclusão\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 11:53:00\",\"Data/hora término\":\"27/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(192,1,'2022-10-26 11:53:30',1,94,11,'{\"ID\":\"11\",\"Participante\":1}',62,1,'{\"ID\":\"1\",\"Descrição\":\"Treinamento do módulo Administração\",\"[identificacao]\":\"Treinamento do módulo Administração\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 15:03:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":6}'),(193,1,'2022-10-26 11:53:30',1,94,71,'{\"ID\":\"71\",\"Participante\":1}',62,7,'{\"ID\":\"7\",\"Descrição\":\"Treinamento do módulo CRM\",\"[identificacao]\":\"Treinamento do módulo CRM\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":6}'),(194,1,'2022-10-26 11:53:30',1,94,31,'{\"ID\":\"31\",\"Participante\":1}',62,3,'{\"ID\":\"3\",\"Descrição\":\"Treinamento do módulo Folha\",\"[identificacao]\":\"Treinamento do módulo Folha\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":6}'),(195,1,'2022-10-26 11:53:30',1,94,41,'{\"ID\":\"41\",\"Participante\":1}',62,4,'{\"ID\":\"4\",\"Descrição\":\"Treinamento do módulo Venda\",\"[identificacao]\":\"Treinamento do módulo Venda\",\"Instrutor\":1,\"Data/hora início\":\"26/10/2022 12:03:00\",\"Data/hora término\":\"26/10/2022 14:03:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":6}'),(196,1,'2022-10-26 11:53:30',1,94,21,'{\"ID\":\"21\",\"Participante\":1}',62,2,'{\"ID\":\"2\",\"Descrição\":\"Treinamento do módulo Finanças\",\"[identificacao]\":\"Treinamento do módulo Finanças\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 13:53:00\",\"Data/hora término\":\"27/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":6}'),(197,1,'2022-10-26 11:53:30',1,94,61,'{\"ID\":\"61\",\"Participante\":1}',62,6,'{\"ID\":\"6\",\"Descrição\":\"Treinamento do módulo Compra\",\"[identificacao]\":\"Treinamento do módulo Compra\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 11:53:00\",\"Data/hora término\":\"28/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":6}'),(198,1,'2022-10-26 11:53:30',1,94,51,'{\"ID\":\"51\",\"Participante\":1}',62,5,'{\"ID\":\"5\",\"Descrição\":\"Treinamento do módulo Contador\",\"[identificacao]\":\"Treinamento do módulo Contador\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 13:53:00\",\"Data/hora término\":\"28/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":6}'),(199,1,'2022-10-26 11:53:30',3,94,21,'{\"ID\":\"21\",\"Participante\":1}',62,2,'{\"ID\":\"2\",\"Descrição\":\"Treinamento do módulo Finanças\",\"[identificacao]\":\"Treinamento do módulo Finanças\",\"Instrutor\":1,\"Data/hora início\":\"27/10/2022 13:53:00\",\"Data/hora término\":\"27/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}'),(200,1,'2022-10-26 11:53:30',3,94,61,'{\"ID\":\"61\",\"Participante\":1}',62,6,'{\"ID\":\"6\",\"Descrição\":\"Treinamento do módulo Compra\",\"[identificacao]\":\"Treinamento do módulo Compra\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 11:53:00\",\"Data/hora término\":\"28/10/2022 13:53:00\",\"Gratuito\":\"Sim\",\"EmpresaEspecificaId\":1}'),(201,1,'2022-10-26 11:53:30',3,94,51,'{\"ID\":\"51\",\"Participante\":1}',62,5,'{\"ID\":\"5\",\"Descrição\":\"Treinamento do módulo Contador\",\"[identificacao]\":\"Treinamento do módulo Contador\",\"Instrutor\":1,\"Data/hora início\":\"28/10/2022 13:53:00\",\"Data/hora término\":\"28/10/2022 15:53:00\",\"Gratuito\":\"Não\",\"EmpresaEspecificaId\":1}'),(202,1,'2022-10-26 11:53:54',1,100,1,'{\"ID\":\"1\",\"Dia e mês\":\"0101\",\"Título\":\"Confraternização Universal\",\"[identificacao]\":\"Confraternização Universal\"}',0,0,''),(203,1,'2022-10-26 11:53:54',1,100,2,'{\"ID\":\"2\",\"Dia e mês\":\"2512\",\"Título\":\"Feliz Natal\",\"[identificacao]\":\"Feliz Natal\"}',0,0,''),(204,1,'2022-10-26 11:53:54',1,100,3,'{\"ID\":\"3\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(205,1,'2022-10-26 11:53:54',1,100,4,'{\"ID\":\"4\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(206,1,'2022-10-26 11:53:55',1,100,5,'{\"ID\":\"5\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(207,1,'2022-10-26 11:53:55',1,100,6,'{\"ID\":\"6\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(208,1,'2022-10-26 11:53:55',1,100,7,'{\"ID\":\"7\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(209,1,'2022-10-26 11:53:55',2,100,1,'{\"ID\":\"1\",\"Dia e mês\":\"0101\",\"Título\":\"Confraternização Universal Alterado\",\"[identificacao]\":\"Confraternização Universal Alterado\"}',0,0,''),(210,1,'2022-10-26 11:53:55',2,100,2,'{\"ID\":\"2\",\"Dia e mês\":\"2512\",\"Título\":\"Feliz Natal Alterado\",\"[identificacao]\":\"Feliz Natal Alterado\"}',0,0,''),(211,1,'2022-10-26 11:53:56',3,100,7,'{\"ID\":\"7\",\"Dia e mês\":\"0202\",\"Título\":\"Seja feliz\",\"[identificacao]\":\"Seja feliz\"}',0,0,''),(212,1,'2022-10-26 11:54:33',1,55,9,'{\"ID\":\"9\",\"Nome\":\"Generic Group\",\"[identificacao]\":\"Generic Group\",\"Banco de dados\":1}',0,0,''),(213,1,'2022-10-26 11:54:33',1,43,16,'{\"ID\":\"16\",\"Razão social\":\"Generic Inc\",\"[identificacao]\":\"Generic Inc\",\"Nome fantasia\":\"Generic Inc\",\"CNPJ\":\"08.771.592/0001-57\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":9,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":16}',0,0,''),(214,1,'2022-10-26 11:54:33',1,56,2,'{\"Produto\":\"0\",\"Tipo\":\"ClientSecret\",\"Key\":\"AqEhnnPporoZgq9TDP0mzi3elhBgKh8aDtW8QrLi2y4\",\"ID\":\"2\",\"EmpresaEspecificaId\":16}',0,0,''),(215,1,'2022-10-26 11:54:33',1,18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"03208f41f8c158f415bd42e3b1efa9e2\",\"Nome\":\"SommusGestor\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":16}',0,0,''),(216,1,'2022-10-26 11:54:33',1,96,19,'{\"ID\":\"19\",\"Grupo de empresa\":9,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,1,'{\"ID\":\"1\",\"E-mail\":\"sommusgestor@sommusgestor.com\",\"[identificacao]\":\"sommusgestor@sommusgestor.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}'),(217,1,'2022-10-26 11:54:58',1,96,20,'{\"ID\":\"20\",\"Grupo de empresa\":2,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(218,1,'2022-10-26 11:54:58',3,96,20,'{\"ID\":\"20\",\"Grupo de empresa\":2,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}'),(219,9,'2022-10-26 11:54:58',1,96,21,'{\"ID\":\"21\",\"Grupo de empresa\":2,\"Empresa\":3,\"Grupo de usuário\":2,\"Permissões\":{\"Autorizações\":[{\"ID\":\"1\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"2\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"5\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"},{\"ID\":\"8\",\"Módulo\":\"0\",\"Opção\":\"0\",\"Ação\":\"0\"}]},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(220,9,'2022-10-26 11:54:58',3,96,21,'{\"ID\":\"21\",\"Grupo de empresa\":2,\"Empresa\":3,\"Grupo de usuário\":2,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Não\",\"Administrador da empresa\":\"Não\"}',18,4,'{\"ID\":\"4\",\"E-mail\":\"admninstacaomodas@sommus.com\",\"[identificacao]\":\"admninstacaomodas@sommus.com\",\"[password]Senha\":\"\",\"Nome\":\"\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(221,NULL,'2022-10-27 15:37:25',1,18,17,'{\"ID\":\"17\",\"E-mail\":\"leohpaim@gmail.com\",\"[identificacao]\":\"leohpaim@gmail.com\",\"[password]Senha\":\"56457b43d703d1633b36fec9a01ea51e\",\"Nome\":\"Financeiro\",\"Ativo\":\"Não\"}',0,0,''),(222,NULL,'2022-10-27 15:37:25',1,96,20,'{\"ID\":\"20\",\"Grupo de empresa\":10,\"Empresa\":0,\"Grupo de usuário\":0,\"Permissões\":{\"Autorizações\":{}},\"Administrador do sistema\":\"Não\",\"Administrador do grupo\":\"Sim\",\"Administrador da empresa\":\"Não\"}',18,17,'{\"ID\":\"17\",\"E-mail\":\"leohpaim@gmail.com\",\"[identificacao]\":\"leohpaim@gmail.com\",\"[password]Senha\":\"56457b43d703d1633b36fec9a01ea51e\",\"Nome\":\"Financeiro\",\"Ativo\":\"Não\"}'),(223,NULL,'2022-10-27 15:37:25',1,43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(224,NULL,'2022-10-27 15:37:25',1,55,10,'{\"ID\":\"10\",\"Nome\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Banco de dados\":2}',0,0,''),(225,17,'2022-10-31 17:20:16',2,43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(226,17,'2022-10-31 17:20:16',1,44,15,'{\"ID\":\"15\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.591-262\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\",\"EmpresaEspecificaId\":17}',43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(227,17,'2022-10-31 17:20:16',3,63,26,'{\"ID\":\"26\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 99999-9999\",\"[identificacao]\":\"(37) 99999-9999\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(228,17,'2022-10-31 17:20:16',3,63,27,'{\"ID\":\"27\",\"Tipo\":\"E-mail\",\"Contato\":\"leohpaim@gmail.com\",\"[identificacao]\":\"leohpaim@gmail.com\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(229,17,'2022-10-31 17:20:16',1,63,28,'{\"ID\":\"28\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 9999-9999\",\"[identificacao]\":\"(37) 9999-9999\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}'),(230,17,'2022-10-31 17:20:16',1,63,29,'{\"ID\":\"29\",\"Tipo\":\"E-mail\",\"Contato\":\"leohpaim@gmail.com\",\"[identificacao]\":\"leohpaim@gmail.com\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',43,17,'{\"ID\":\"17\",\"Razão social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome fantasia\":\"Teste\",\"CNPJ\":\"58.101.194/0001-00\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Url logo\":\"\",\"Grupo\":10,\"NFSe - ID da Empresa no eNotas\":null,\"Ativo\":\"Sim\"}');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_log before insert on log for each row
begin
    if new.data_hora > '0001-01-01 00:00:00' and new.data_hora < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: log.data_hora';
    end if;
    if new.acao not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: log.acao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_log before update on log for each row
begin
    if new.data_hora > '0001-01-01 00:00:00' and new.data_hora < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: log.data_hora';
    end if;
    if new.acao not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: log.acao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_empresa`
--

DROP TABLE IF EXISTS `log_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_empresa` (
  `log_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`,`empresa_id`),
  KEY `k_log_empresa_1` (`log_id`),
  KEY `k_log_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_log_empresa_1` FOREIGN KEY (`log_id`) REFERENCES `log` (`log_id`),
  CONSTRAINT `fk_log_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_empresa`
--

LOCK TABLES `log_empresa` WRITE;
/*!40000 ALTER TABLE `log_empresa` DISABLE KEYS */;
INSERT INTO `log_empresa` VALUES (3,1),(4,1),(5,1),(30,2),(31,2),(32,2),(33,2),(34,2),(35,3),(36,3),(37,3),(38,3),(39,4),(40,4),(41,4),(42,4),(43,4),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,6),(51,6),(52,6),(53,6),(54,6),(55,6),(56,7),(57,7),(58,7),(59,7),(60,7),(61,7),(62,8),(63,8),(64,8),(65,8),(66,8),(67,9),(68,9),(69,9),(70,9),(71,9),(72,10),(73,10),(74,10),(75,10),(76,10),(77,11),(78,11),(79,11),(80,11),(81,12),(82,12),(83,12),(84,12),(85,13),(86,13),(87,14),(88,14),(89,14),(90,14),(91,12),(92,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,2),(124,2),(125,2),(126,2),(127,3),(128,2),(129,2),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,3),(144,1),(145,2),(146,3),(147,3),(148,3),(149,3),(170,15),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,2),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,6),(193,6),(194,6),(195,6),(196,6),(197,6),(198,6),(199,1),(200,1),(201,1),(213,16),(214,16),(215,16),(216,16),(217,1),(218,1),(219,3),(220,3),(223,17),(225,17),(226,17),(227,17),(228,17),(229,17),(230,17);
/*!40000 ALTER TABLE `log_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacao` (
  `notificacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_envio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_leitura` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `titulo` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`notificacao_id`),
  KEY `k_notificacao_1` (`usuario_id`),
  CONSTRAINT `fk_notificacao_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_notificacao before insert on notificacao for each row
begin
    if new.data_hora_envio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.data_hora_envio';
    end if;
    if new.data_hora_leitura > '0001-01-01 00:00:00' and new.data_hora_leitura < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.data_hora_leitura';
    end if;
    if new.titulo = '' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.titulo';
    end if;
    if new.descricao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.descricao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_notificacao before update on notificacao for each row
begin
    if new.data_hora_envio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.data_hora_envio';
    end if;
    if new.data_hora_leitura > '0001-01-01 00:00:00' and new.data_hora_leitura < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.data_hora_leitura';
    end if;
    if new.titulo = '' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.titulo';
    end if;
    if new.descricao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: notificacao.descricao';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao` (
  `permissao_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`permissao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1),(2),(3),(5),(6),(7),(8),(9),(10),(11);
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao_autorizacao`
--

DROP TABLE IF EXISTS `permissao_autorizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao_autorizacao` (
  `permissao_id` int(11) NOT NULL DEFAULT '0',
  `autorizacao_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissao_id`,`autorizacao_id`),
  KEY `k_permissao_autorizacao_1` (`permissao_id`),
  KEY `k_permissao_autorizacao_2` (`autorizacao_id`),
  CONSTRAINT `fk_permissao_autorizacao_1` FOREIGN KEY (`permissao_id`) REFERENCES `permissao` (`permissao_id`),
  CONSTRAINT `fk_permissao_autorizacao_2` FOREIGN KEY (`autorizacao_id`) REFERENCES `autorizacao` (`autorizacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao_autorizacao`
--

LOCK TABLES `permissao_autorizacao` WRITE;
/*!40000 ALTER TABLE `permissao_autorizacao` DISABLE KEYS */;
INSERT INTO `permissao_autorizacao` VALUES (1,1),(1,2),(1,5),(1,7),(1,8),(1,10),(1,28),(2,1),(2,10),(2,11),(2,20),(2,22),(3,1),(5,11),(5,22),(5,33),(5,44),(5,55),(5,66),(5,77),(5,88),(5,99),(5,112),(6,2),(6,6),(6,25),(6,29),(6,33),(6,42),(6,47),(6,72),(6,92),(6,102),(6,111),(7,1),(7,2),(7,5),(7,8),(8,1),(8,2),(8,5),(8,8),(9,1),(9,2),(9,5),(9,8),(10,1),(10,2),(10,5),(10,8),(11,1),(11,2),(11,5),(11,8);
/*!40000 ALTER TABLE `permissao_autorizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_assinatura`
--

DROP TABLE IF EXISTS `plano_assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_assinatura` (
  `plano_assinatura_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_servico_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `usuarios` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plano_assinatura_id`),
  UNIQUE KEY `uk_plano_assinatura_1` (`produto_servico_id`,`nome`),
  KEY `k_plano_assinatura_1` (`produto_servico_id`),
  CONSTRAINT `fk_plano_assinatura_1` FOREIGN KEY (`produto_servico_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_assinatura`
--

LOCK TABLES `plano_assinatura` WRITE;
/*!40000 ALTER TABLE `plano_assinatura` DISABLE KEYS */;
INSERT INTO `plano_assinatura` VALUES (1,1,'Diamante',5),(2,1,'Ouro',3),(3,1,'Prata',2),(4,1,'Bronze',1),(5,2,'Diamante',5),(6,2,'Ouro',3),(7,2,'Prata',2),(8,2,'Bronze',1),(9,3,'Diamante',5),(10,3,'Ouro',3),(11,3,'Prata',2),(12,3,'Bronze',1),(13,4,'Ouro',3),(14,4,'Prata',2),(15,4,'Bronze',1);
/*!40000 ALTER TABLE `plano_assinatura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_plano_assinatura before insert on plano_assinatura for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_assinatura.nome';
    end if;
    if new.usuarios <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_assinatura.usuarios';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_plano_assinatura before update on plano_assinatura for each row begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_assinatura.nome';
    end if;
    if new.usuarios <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_assinatura.usuarios';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plano_assinatura_modulo`
--

DROP TABLE IF EXISTS `plano_assinatura_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_assinatura_modulo` (
  `plano_assinatura_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plano_assinatura_id`,`modulo_id`),
  KEY `k_plano_assinatura_modulo_1` (`plano_assinatura_id`),
  KEY `k_plano_assinatura_modulo_2` (`modulo_id`),
  CONSTRAINT `fk_plano_assinatura_modulo_1` FOREIGN KEY (`plano_assinatura_id`) REFERENCES `plano_assinatura` (`plano_assinatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_assinatura_modulo`
--

LOCK TABLES `plano_assinatura_modulo` WRITE;
/*!40000 ALTER TABLE `plano_assinatura_modulo` DISABLE KEYS */;
INSERT INTO `plano_assinatura_modulo` VALUES (1,1),(1,2),(1,3),(1,5),(1,10),(1,11),(2,2),(2,3),(2,5),(2,10),(2,11),(3,3),(3,5),(3,10),(3,11),(4,3),(4,10),(4,11);
/*!40000 ALTER TABLE `plano_assinatura_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao`
--

DROP TABLE IF EXISTS `promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocao` (
  `promocao_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL DEFAULT '',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `desconto` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `carencia` int(3) NOT NULL DEFAULT '0',
  `vigencia_inicio` date NOT NULL DEFAULT '0001-01-01',
  `vigencia_fim` date NOT NULL DEFAULT '0001-01-01',
  `produto_servico_id` int(11) DEFAULT NULL,
  `valor_minimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `uf` char(2) NOT NULL DEFAULT '',
  `exclusivo` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`promocao_id`),
  KEY `k_promocao_1` (`produto_servico_id`),
  CONSTRAINT `fk_promocao_1` FOREIGN KEY (`produto_servico_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao`
--

LOCK TABLES `promocao` WRITE;
/*!40000 ALTER TABLE `promocao` DISABLE KEYS */;
INSERT INTO `promocao` VALUES (1,'PASCOA10','Promoção de Páscoa',10.0000,0,'2022-10-26','2022-11-28',NULL,50.00,'',0,1,0),(2,'SZE63B2B','Código automático',0.0000,120,'2022-10-26','2022-11-08',2,30.00,'MG',0,1,0),(3,'EXCLUSIVO20','Promoção exclusiva',20.0000,15,'2022-10-26','2022-11-13',NULL,80.00,'',1,1,0),(4,'PASCOA10','Promoção de Páscoa (duplicado, mas inativa)',20.0000,0,'2022-10-26','2022-11-28',NULL,50.00,'',0,0,0),(5,'TESTE50','Promoção (excluir)',15.0000,0,'2022-10-26','2022-11-25',NULL,0.00,'',0,0,1);
/*!40000 ALTER TABLE `promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restricao`
--

DROP TABLE IF EXISTS `restricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricao` (
  `restricao_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`restricao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricao`
--

LOCK TABLES `restricao` WRITE;
/*!40000 ALTER TABLE `restricao` DISABLE KEYS */;
INSERT INTO `restricao` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `restricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restricao_horario`
--

DROP TABLE IF EXISTS `restricao_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricao_horario` (
  `restricao_horario_id` int(11) NOT NULL AUTO_INCREMENT,
  `restricao_id` int(11) NOT NULL DEFAULT '0',
  `dia` int(1) NOT NULL DEFAULT '0',
  `horario_inicio` time NOT NULL DEFAULT '00:00:00',
  `horario_termino` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`restricao_horario_id`),
  KEY `k_restricao_horario_1` (`restricao_id`),
  CONSTRAINT `fk_restricao_horario_1` FOREIGN KEY (`restricao_id`) REFERENCES `restricao` (`restricao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricao_horario`
--

LOCK TABLES `restricao_horario` WRITE;
/*!40000 ALTER TABLE `restricao_horario` DISABLE KEYS */;
INSERT INTO `restricao_horario` VALUES (1,1,2,'08:00:00','17:30:00'),(2,1,3,'08:00:00','17:30:00'),(3,1,4,'08:00:00','17:30:00'),(4,1,5,'08:00:00','17:30:00'),(5,1,6,'08:00:00','15:30:00'),(6,2,1,'08:00:00','18:30:00'),(7,3,2,'08:00:00','14:45:00'),(8,3,6,'08:00:00','16:45:00'),(9,5,4,'04:00:00','04:30:00'),(10,6,4,'04:00:00','04:30:00');
/*!40000 ALTER TABLE `restricao_horario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_restricao_horario before insert on restricao_horario for each row
begin
    if new.dia not in (1,2,3,4,5,6,7) then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.dia';
    end if;
    if new.horario_inicio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.horario_inicio';
    end if;
    if new.horario_termino = '' then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.horario_termino';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_restricao_horario before update on restricao_horario for each row
begin
    if new.dia not in (1,2,3,4,5,6,7) then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.dia';
    end if;
    if new.horario_inicio = '' then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.horario_inicio';
    end if;
    if new.horario_termino = '' then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_horario.horario_termino';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `restricao_ip`
--

DROP TABLE IF EXISTS `restricao_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricao_ip` (
  `restricao_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `restricao_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`restricao_ip_id`),
  KEY `k_restricao_ip_1` (`restricao_id`),
  CONSTRAINT `fk_restricao_ip_1` FOREIGN KEY (`restricao_id`) REFERENCES `restricao` (`restricao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricao_ip`
--

LOCK TABLES `restricao_ip` WRITE;
/*!40000 ALTER TABLE `restricao_ip` DISABLE KEYS */;
INSERT INTO `restricao_ip` VALUES (1,1,'127.0.0.1'),(2,1,'215.11.234.77'),(3,3,'217.22.81.55'),(4,4,'153.17.44.11');
/*!40000 ALTER TABLE `restricao_ip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_restricao_ip before insert on restricao_ip for each row
begin
    if character_length(trim(new.ip)) < 7 then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_ip.ip';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_restricao_ip before update on restricao_ip for each row
begin
    if character_length(trim(new.ip)) < 7 then
        signal sqlstate '45000' set message_text = 'invalid value: restricao_ip.ip';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tarefa_agendada`
--

DROP TABLE IF EXISTS `tarefa_agendada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa_agendada` (
  `tarefa_agendada_id` int(11) NOT NULL AUTO_INCREMENT,
  `tarefa` int(3) NOT NULL DEFAULT '0',
  `frequencia` int(1) NOT NULL DEFAULT '0',
  `dia_semana` int(1) NOT NULL DEFAULT '0',
  `dia` int(2) NOT NULL DEFAULT '0',
  `dia_mes` char(4) NOT NULL DEFAULT '',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `job` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tarefa_agendada_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa_agendada`
--

LOCK TABLES `tarefa_agendada` WRITE;
/*!40000 ALTER TABLE `tarefa_agendada` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefa_agendada` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_tarefa_agendada before insert on tarefa_agendada for each row
begin
    if new.tarefa not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.tarefa';
    end if;
    if new.frequencia not in (1,2,3,4) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.frequencia';
    end if;
    if (new.frequencia = 2 and new.dia_semana not in (1,2,3,4,5,6,7)) or (new.frequencia <> 2 and new.dia_semana <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia_semana';
    end if;
    if (new.frequencia = 3 and (new.dia < 1 or new.dia > 31)) or (new.frequencia <> 3 and new.dia <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia';
    end if;
    if (new.frequencia = 4 and (substring(new.dia_mes,1,2) < '01' or substring(new.dia_mes,1,2) > '31' or substring(new.dia_mes,3,2) < '01' or substring(new.dia_mes,3,2) > '12')) or (new.frequencia <> 4 and character_length(trim(new.dia_mes)) <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia_mes';
    end if;
    if character_length(trim(new.hora)) = 0 then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.hora';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_tarefa_agendada before update on tarefa_agendada for each row
begin
    if new.tarefa not in (1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.tarefa';
    end if;
    if new.frequencia not in (1,2,3,4) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.frequencia';
    end if;
    if (new.frequencia = 2 and new.dia_semana not in (1,2,3,4,5,6,7)) or (new.frequencia <> 2 and new.dia_semana <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia_semana';
    end if;
    if (new.frequencia = 3 and (new.dia < 1 or new.dia > 31)) or (new.frequencia <> 3 and new.dia <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia';
    end if;
    if (new.frequencia = 4 and (substring(new.dia_mes,1,2) < '01' or substring(new.dia_mes,1,2) > '31' or substring(new.dia_mes,3,2) < '01' or substring(new.dia_mes,3,2) > '12')) or (new.frequencia <> 4 and character_length(trim(new.dia_mes)) <> 0) then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.dia_mes';
    end if;
    if character_length(trim(new.hora)) = 0 then
        signal sqlstate '45000' set message_text = 'invalid value: tarefa_agendada.hora';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treinamento`
--

DROP TABLE IF EXISTS `treinamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treinamento` (
  `treinamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `sala_id` int(11) NOT NULL DEFAULT '0',
  `instrutor_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `gratuito` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`treinamento_id`),
  UNIQUE KEY `uk_treinamento_1` (`sala_id`),
  KEY `k_treinamento_1` (`instrutor_id`),
  CONSTRAINT `fk_treinamento_1` FOREIGN KEY (`instrutor_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinamento`
--

LOCK TABLES `treinamento` WRITE;
/*!40000 ALTER TABLE `treinamento` DISABLE KEYS */;
INSERT INTO `treinamento` VALUES (1,72772,1,'2022-10-26 12:03:00','2022-10-26 15:03:00','Treinamento do módulo Administração',0),(2,92290,1,'2022-10-27 13:53:00','2022-10-27 15:53:00','Treinamento do módulo Finanças',0),(3,28172,1,'2022-10-26 12:03:00','2022-10-26 14:03:00','Treinamento do módulo Folha',1),(4,11810,1,'2022-10-26 12:03:00','2022-10-26 14:03:00','Treinamento do módulo Venda',1),(5,47690,1,'2022-10-28 13:53:00','2022-10-28 15:53:00','Treinamento do módulo Contador',0),(6,31328,1,'2022-10-28 11:53:00','2022-10-28 13:53:00','Treinamento do módulo Compra',1),(7,67208,1,'2022-10-26 12:03:00','2022-10-26 14:03:00','Treinamento do módulo CRM',0);
/*!40000 ALTER TABLE `treinamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_treinamento before insert on treinamento for each row
begin
    if new.data_hora_inicio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.data_hora_inicio';
    end if;
    if new.data_hora_fim <= new.data_hora_inicio then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.data_hora_fim';
    end if;
    if new.descricao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.descricao';
    end if;
    if new.gratuito not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.gratuito';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_treinamento before update on treinamento for each row
begin
    if new.data_hora_inicio < '2019-01-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.data_hora_inicio';
    end if;
    if new.data_hora_fim <= new.data_hora_inicio then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.data_hora_fim';
    end if;
    if new.descricao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.descricao';
    end if;
    if new.gratuito not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento.gratuito';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treinamento_participante`
--

DROP TABLE IF EXISTS `treinamento_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treinamento_participante` (
  `treinamento_id` int(11) NOT NULL DEFAULT '0',
  `participante_id` int(11) NOT NULL DEFAULT '0',
  `url_acesso` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`treinamento_id`,`participante_id`),
  UNIQUE KEY `uk_treinamento_participante_1` (`url_acesso`),
  KEY `k_treinamento_participante_1` (`treinamento_id`),
  KEY `k_treinamento_participante_2` (`participante_id`),
  CONSTRAINT `fk_treinamento_participante_1` FOREIGN KEY (`treinamento_id`) REFERENCES `treinamento` (`treinamento_id`),
  CONSTRAINT `fk_treinamento_participante_2` FOREIGN KEY (`participante_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinamento_participante`
--

LOCK TABLES `treinamento_participante` WRITE;
/*!40000 ALTER TABLE `treinamento_participante` DISABLE KEYS */;
INSERT INTO `treinamento_participante` VALUES (1,1,'529237'),(3,1,'724422'),(4,1,'83227'),(7,1,'888042');
/*!40000 ALTER TABLE `treinamento_participante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_treinamento_participante before insert on treinamento_participante for each row
begin
    if new.url_acesso = '' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento_participante.url_acesso';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_treinamento_participante before update on treinamento_participante for each row
begin
    if new.url_acesso = '' then
        signal sqlstate '45000' set message_text = 'invalid value: treinamento_participante.url_acesso';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `senha` varchar(32) NOT NULL DEFAULT '',
  `url_foto` varchar(500) NOT NULL DEFAULT '',
  `redefinir_senha` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `uk_usuario_1` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SommusGestor','sommusgestor@sommusgestor.com','03208f41f8c158f415bd42e3b1efa9e2','',0,1),(2,'Sommus Sistemas 2','sommus2@sommus.com','4ac1b8abceb80628e5349bed3dae6c23','',0,1),(3,'Usuário Selenium','usuario@selenium.com','e2fa14969e900cf70eb2e22dcec6c085','',0,1),(4,'','admninstacaomodas@sommus.com','','',0,0),(5,'','admninempresastacao1@sommus.com','','',0,0),(6,'','usuariostacao1@sommus.com','','',0,0),(7,'','admninvap@sommus.com','','',0,0),(8,'','usuariovap1@sommus.com','','',0,0),(9,'Administrador','admpostoliberdade@sommus.com','034717746497c8c1f3f5ffa6b61f0830','',1,1),(10,'','usuariopostoliberdade@sommus.com','','',0,0),(11,'','admgrupo@sommus.com','','',0,0),(12,'','admexcluido@sommus.com','','',0,0),(13,'','admgrupoexcluido@sommus.com','','',0,0),(14,'','admempresaexcluido@sommus.com','','',0,0),(15,'','dev@sommus.com','','',0,0),(16,'Usuario que se auto cadastrou','novousuario@sommus-test.com','f246f076119ee34fecacd4013aa35885','',0,1),(17,'Financeiro','leohpaim@gmail.com','56457b43d703d1633b36fec9a01ea51e','',0,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_usuario before insert on usuario for each row
begin
    if locate('@',new.email) < 2 then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.email';
    end if;
    if new.redefinir_senha not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.redefinir_senha';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.ativo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_usuario before update on usuario for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.nome';
    end if;
    if locate('@',new.email) < 2 then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.email';
    end if;
    if character_length(trim(new.senha)) <> 32 then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.senha';
    end if;
    if new.redefinir_senha not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.redefinir_senha';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario.ativo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario_acesso`
--

DROP TABLE IF EXISTS `usuario_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_acesso` (
  `usuario_acesso_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) DEFAULT NULL,
  `grupo_usuario_id` int(11) DEFAULT NULL,
  `grupo_empresa_id` int(11) DEFAULT NULL,
  `permissao_id` int(11) DEFAULT NULL,
  `restricao_id` int(11) DEFAULT NULL,
  `dashboard_id` int(11) DEFAULT NULL,
  `administrador_sistema` tinyint(1) NOT NULL DEFAULT '0',
  `administrador_grupo` tinyint(1) NOT NULL DEFAULT '0',
  `administrador_empresa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_acesso_id`),
  KEY `k_usuario_acesso_1` (`usuario_id`),
  KEY `k_usuario_acesso_2` (`empresa_id`),
  KEY `k_usuario_acesso_3` (`grupo_usuario_id`),
  KEY `k_usuario_acesso_4` (`grupo_empresa_id`),
  KEY `k_usuario_acesso_5` (`permissao_id`),
  KEY `k_usuario_acesso_6` (`restricao_id`),
  KEY `k_usuario_acesso_7` (`dashboard_id`),
  CONSTRAINT `fk_usuario_acesso_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `fk_usuario_acesso_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_usuario_acesso_3` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `grupo_usuario` (`grupo_usuario_id`),
  CONSTRAINT `fk_usuario_acesso_4` FOREIGN KEY (`grupo_empresa_id`) REFERENCES `grupo_empresa` (`grupo_empresa_id`),
  CONSTRAINT `fk_usuario_acesso_5` FOREIGN KEY (`permissao_id`) REFERENCES `permissao` (`permissao_id`),
  CONSTRAINT `fk_usuario_acesso_6` FOREIGN KEY (`restricao_id`) REFERENCES `restricao` (`restricao_id`),
  CONSTRAINT `fk_usuario_acesso_7` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboard` (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_acesso`
--

LOCK TABLES `usuario_acesso` WRITE;
/*!40000 ALTER TABLE `usuario_acesso` DISABLE KEYS */;
INSERT INTO `usuario_acesso` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,1,0,0),(2,2,NULL,NULL,1,NULL,NULL,NULL,0,1,0),(3,3,NULL,NULL,3,NULL,NULL,NULL,0,1,0),(4,4,NULL,NULL,4,NULL,NULL,NULL,0,1,0),(5,5,5,NULL,4,NULL,NULL,NULL,0,0,1),(6,6,5,NULL,4,5,3,NULL,0,0,0),(7,7,NULL,NULL,5,NULL,NULL,NULL,0,1,0),(8,8,10,NULL,5,6,4,NULL,0,0,0),(9,9,NULL,NULL,2,NULL,NULL,NULL,0,1,0),(10,10,3,NULL,2,11,6,NULL,0,0,0),(11,1,NULL,NULL,1,NULL,NULL,NULL,0,1,0),(12,1,NULL,NULL,2,NULL,NULL,NULL,0,1,0),(13,11,1,NULL,1,NULL,NULL,NULL,0,0,1),(17,15,1,1,1,1,NULL,1,0,0,0),(18,16,NULL,NULL,8,NULL,NULL,NULL,0,1,0),(19,1,NULL,NULL,9,NULL,NULL,NULL,0,1,0),(20,17,NULL,NULL,10,NULL,NULL,NULL,0,1,0);
/*!40000 ALTER TABLE `usuario_acesso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_usuario_acesso before insert on usuario_acesso for each row
begin
    if new.administrador_sistema not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_sistema';
    end if;
    if new.administrador_grupo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_grupo';
    end if;
    if new.administrador_empresa not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_empresa';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_usuario_acesso before update on usuario_acesso for each row
begin
    if new.administrador_sistema not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_sistema';
    end if;
    if new.administrador_grupo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_grupo';
    end if;
    if new.administrador_empresa not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_acesso.administrador_empresa';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario_atividade`
--

DROP TABLE IF EXISTS `usuario_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_atividade` (
  `usuario_atividade_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `atividade` int(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `opcao_id` int(11) NOT NULL DEFAULT '0',
  `produto_servico_id` int(11) DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`usuario_atividade_id`),
  KEY `k_usuario_atividade_1` (`usuario_id`),
  KEY `k_usuario_atividade_2` (`empresa_id`),
  KEY `k_usuario_atividade_3` (`produto_servico_id`),
  CONSTRAINT `fk_usuario_atividade_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `fk_usuario_atividade_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_usuario_atividade_3` FOREIGN KEY (`produto_servico_id`) REFERENCES `sommusgestor_1`.`produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_atividade`
--

LOCK TABLES `usuario_atividade` WRITE;
/*!40000 ALTER TABLE `usuario_atividade` DISABLE KEYS */;
INSERT INTO `usuario_atividade` VALUES (1,1,1,'2022-10-26 11:51:58',1,'',1,0,NULL,0.00),(2,1,1,'2022-10-26 11:51:58',2,'192.168.0.1',0,0,NULL,0.00),(3,1,1,'2022-10-26 11:51:58',3,'',0,0,1,100.00),(4,1,1,'2022-10-26 11:51:58',4,'',0,0,1,50.00),(5,1,1,'2022-10-26 11:51:58',2,'192.168.0.1',0,0,NULL,0.00),(6,1,1,'2022-10-26 11:51:58',2,'192.168.0.1',0,0,NULL,0.00),(7,1,1,'2022-10-26 11:51:58',2,'192.168.0.1',0,0,NULL,0.00),(8,1,1,'2022-10-26 11:51:58',2,'192.168.0.1',0,0,NULL,0.00),(9,1,1,'2022-10-26 11:51:58',1,'',1,19,NULL,0.00),(10,1,1,'2022-10-26 11:51:58',1,'',1,44,NULL,0.00),(11,1,1,'2022-10-26 11:51:58',1,'',1,98,NULL,0.00),(12,1,3,'2022-10-26 16:26:26',2,'127.0.0.1',0,0,NULL,0.00),(13,1,3,'2022-10-26 16:26:30',1,'',2,19,NULL,0.00),(14,1,3,'2022-10-26 16:28:21',1,'',2,28,NULL,0.00),(15,1,3,'2022-10-26 16:29:16',1,'',2,28,NULL,0.00),(16,1,3,'2022-10-26 16:29:23',1,'',2,43,NULL,0.00),(17,1,3,'2022-10-26 16:29:53',1,'',2,43,NULL,0.00),(18,1,3,'2022-10-26 16:30:00',1,'',2,28,NULL,0.00),(19,1,3,'2022-10-26 16:31:44',1,'',2,28,NULL,0.00),(20,1,3,'2022-10-26 16:46:08',1,'',5,32,NULL,0.00),(21,1,3,'2022-10-26 16:49:23',1,'',2,13,NULL,0.00),(22,1,3,'2022-10-26 16:49:52',1,'',2,13,NULL,0.00),(23,1,3,'2022-10-26 16:49:58',1,'',2,13,NULL,0.00),(24,1,3,'2022-10-26 16:50:03',1,'',2,13,NULL,0.00),(25,1,3,'2022-10-26 16:50:46',1,'',2,14,NULL,0.00),(26,1,3,'2022-10-26 16:51:03',1,'',2,14,NULL,0.00),(27,1,3,'2022-10-26 16:51:21',1,'',2,14,NULL,0.00),(28,1,3,'2022-10-26 16:51:24',1,'',2,13,NULL,0.00),(29,1,3,'2022-10-26 16:51:36',1,'',2,13,NULL,0.00),(30,1,3,'2022-10-26 16:51:41',1,'',2,13,NULL,0.00),(31,1,3,'2022-10-26 16:51:51',1,'',2,13,NULL,0.00),(32,1,3,'2022-10-26 16:51:56',1,'',2,13,NULL,0.00),(33,1,3,'2022-10-26 17:04:54',1,'',2,13,NULL,0.00),(34,1,3,'2022-10-26 17:05:27',1,'',2,13,NULL,0.00),(35,1,3,'2022-10-26 17:05:43',1,'',5,26,NULL,0.00),(36,1,3,'2022-10-26 17:06:41',1,'',1,8,NULL,0.00),(37,1,3,'2022-10-27 08:34:42',2,'127.0.0.1',0,0,NULL,0.00),(38,1,3,'2022-10-27 10:18:33',1,'',2,13,NULL,0.00),(39,1,3,'2022-10-27 10:18:48',1,'',2,13,NULL,0.00),(40,1,3,'2022-10-27 10:18:57',1,'',2,13,NULL,0.00),(41,1,3,'2022-10-27 10:19:19',1,'',1,8,NULL,0.00),(42,1,3,'2022-10-27 10:20:30',1,'',3,113,NULL,0.00),(43,1,3,'2022-10-27 10:20:51',1,'',3,113,NULL,0.00),(44,1,3,'2022-10-27 10:20:55',1,'',3,113,NULL,0.00),(45,1,3,'2022-10-27 10:21:06',1,'',3,23,NULL,0.00),(46,1,3,'2022-10-27 10:21:50',1,'',2,68,NULL,0.00),(47,1,3,'2022-10-27 10:22:33',1,'',2,67,NULL,0.00),(48,1,3,'2022-10-27 10:22:58',1,'',2,13,NULL,0.00),(49,1,3,'2022-10-27 10:23:08',1,'',2,13,NULL,0.00),(50,1,3,'2022-10-27 10:23:18',1,'',2,13,NULL,0.00),(51,1,3,'2022-10-27 10:23:21',1,'',2,13,NULL,0.00),(52,1,3,'2022-10-27 10:23:27',1,'',2,13,NULL,0.00),(53,1,3,'2022-10-27 10:23:39',1,'',2,13,NULL,0.00),(54,1,3,'2022-10-27 10:23:48',1,'',2,13,NULL,0.00),(55,1,3,'2022-10-27 10:24:03',1,'',2,13,NULL,0.00),(56,1,3,'2022-10-27 10:24:08',1,'',2,13,NULL,0.00),(57,1,3,'2022-10-27 10:24:35',1,'',2,13,NULL,0.00),(58,1,3,'2022-10-27 10:25:09',1,'',2,13,NULL,0.00),(59,1,3,'2022-10-27 15:07:49',1,'',5,27,NULL,0.00),(60,1,3,'2022-10-27 15:08:13',1,'',2,19,NULL,0.00),(61,1,3,'2022-10-27 15:08:34',1,'',2,19,NULL,0.00),(62,1,3,'2022-10-27 15:09:19',1,'',5,31,NULL,0.00),(63,1,3,'2022-10-27 15:11:22',2,'127.0.0.1',0,0,NULL,0.00),(64,17,17,'2022-10-27 15:38:29',2,'127.0.0.1',0,0,NULL,0.00),(65,17,17,'2022-10-27 15:58:45',1,'',3,21,NULL,0.00),(66,17,17,'2022-10-31 08:42:26',2,'127.0.0.1',0,0,NULL,0.00),(67,17,17,'2022-10-31 08:42:31',2,'127.0.0.1',0,0,NULL,0.00),(68,17,17,'2022-10-31 08:42:45',1,'',5,27,NULL,0.00),(69,17,17,'2022-10-31 08:43:49',1,'',5,31,NULL,0.00),(70,17,17,'2022-10-31 08:44:55',1,'',5,31,NULL,0.00),(71,17,17,'2022-10-31 08:45:27',1,'',5,27,NULL,0.00),(72,17,17,'2022-10-31 14:47:24',1,'',5,31,NULL,0.00),(73,17,17,'2022-10-31 14:49:04',1,'',5,31,NULL,0.00),(74,17,17,'2022-10-31 14:49:55',1,'',5,31,NULL,0.00),(75,17,17,'2022-10-31 14:50:04',1,'',5,27,NULL,0.00),(76,17,17,'2022-10-31 16:10:19',1,'',5,27,NULL,0.00),(77,17,17,'2022-10-31 16:10:24',1,'',5,27,NULL,0.00),(78,17,17,'2022-10-31 16:11:38',1,'',5,27,NULL,0.00),(79,17,17,'2022-10-31 16:12:15',1,'',5,27,NULL,0.00),(80,17,17,'2022-10-31 16:15:01',1,'',5,27,NULL,0.00),(81,17,17,'2022-10-31 16:26:45',1,'',5,17,NULL,0.00),(82,17,17,'2022-10-31 16:27:19',1,'',5,17,NULL,0.00),(83,17,17,'2022-10-31 16:27:33',1,'',5,17,NULL,0.00),(84,17,17,'2022-10-31 16:28:55',1,'',5,17,NULL,0.00),(85,17,17,'2022-10-31 16:32:17',1,'',5,27,NULL,0.00),(86,17,17,'2022-10-31 16:32:41',1,'',5,27,NULL,0.00),(87,17,17,'2022-10-31 16:33:19',1,'',5,27,NULL,0.00),(88,17,17,'2022-10-31 16:33:46',1,'',5,27,NULL,0.00),(89,17,17,'2022-10-31 16:34:01',1,'',5,27,NULL,0.00),(90,17,17,'2022-10-31 16:34:15',1,'',5,27,NULL,0.00),(91,17,17,'2022-10-31 16:36:13',1,'',5,27,NULL,0.00),(92,17,17,'2022-10-31 16:36:23',1,'',5,27,NULL,0.00),(93,17,17,'2022-10-31 16:36:33',1,'',5,27,NULL,0.00),(94,17,17,'2022-10-31 16:36:56',1,'',5,27,NULL,0.00),(95,17,17,'2022-10-31 16:41:45',1,'',5,17,NULL,0.00),(96,17,17,'2022-10-31 20:20:40',1,'',5,26,NULL,0.00),(97,17,17,'2022-10-31 20:20:56',1,'',5,27,NULL,0.00),(98,17,17,'2022-10-31 20:21:07',1,'',2,19,NULL,0.00),(99,17,17,'2022-10-31 20:21:44',1,'',2,19,NULL,0.00),(100,17,17,'2022-10-31 20:21:51',1,'',5,27,NULL,0.00);
/*!40000 ALTER TABLE `usuario_atividade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_usuario_atividade before insert on usuario_atividade for each row
begin
    if new.data_hora < '2020-06-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.data_hora';
    end if;
    if new.atividade not in (1,2,3,4) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.atividade';
    end if;
    if new.valor < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.valor';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_usuario_atividade before update on usuario_atividade for each row
begin
    if new.data_hora < '2020-06-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.data_hora';
    end if;
    if new.atividade not in (1,2,3,4) then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.atividade';
    end if;
    if new.valor < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: usuario_atividade.valor';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `versao`
--

DROP TABLE IF EXISTS `versao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versao` (
  `versao_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(1) NOT NULL DEFAULT '0',
  `versao` varchar(100) NOT NULL DEFAULT '',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`versao_id`),
  UNIQUE KEY `uk_versao_1` (`tipo`,`versao`),
  KEY `k_versao_1` (`versao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20220823.141626.689','2022-10-26 11:51:10','3b7264736eab6740a0ded5e67662878d'),(2,2,'20221010.125522.593-financas','2022-10-26 11:51:10','b2004b8e8c07451b2c63be41cfb254d4'),(3,1,'1.0.21.61','2022-10-26 16:20:16','0a2be3c6f578fe600d34940f35995aee'),(4,1,'1.0.21.95','2022-10-31 08:41:53','026a944ec373185038206bf17411ea40');
/*!40000 ALTER TABLE `versao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_versao before insert on versao for each row
begin
    if new.tipo not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: versao.tipo';
    end if;
    if new.versao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: versao.versao';
    end if;
    if new.data_hora < '2018-12-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: versao.data_hora';
    end if;
    if character_length(trim(new.hash)) <> 32 then
        signal sqlstate '45000' set message_text = 'invalid value: versao.hash';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_versao before update on versao for each row
begin
    if new.tipo not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: versao.tipo';
    end if;
    if new.versao = '' then
        signal sqlstate '45000' set message_text = 'invalid value: versao.versao';
    end if;
    if new.data_hora < '2018-12-01 00:00:00' then
        signal sqlstate '45000' set message_text = 'invalid value: versao.data_hora';
    end if;
    if character_length(trim(new.hash)) <> 32 then
        signal sqlstate '45000' set message_text = 'invalid value: versao.hash';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:32:21
