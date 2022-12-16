-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_hangfire
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
-- Table structure for table `aggregatedcounter`
--

DROP TABLE IF EXISTS `aggregatedcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregatedcounter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_CounterAggregated_Key` (`Key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregatedcounter`
--

LOCK TABLES `aggregatedcounter` WRITE;
/*!40000 ALTER TABLE `aggregatedcounter` DISABLE KEYS */;
INSERT INTO `aggregatedcounter` VALUES (1,'stats:succeeded',4,NULL),(2,'stats:succeeded:2022-10-26',1,'2022-11-26 19:26:30'),(4,'stats:succeeded:2022-10-27',2,'2022-11-27 18:38:32'),(8,'stats:succeeded:2022-10-31',1,'2022-11-30 11:42:08'),(9,'stats:succeeded:2022-10-31-11',1,'2022-11-01 11:42:08');
/*!40000 ALTER TABLE `aggregatedcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Counter_Key` (`Key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributedlock`
--

DROP TABLE IF EXISTS `distributedlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributedlock` (
  `Resource` varchar(100) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributedlock`
--

LOCK TABLES `distributedlock` WRITE;
/*!40000 ALTER TABLE `distributedlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributedlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hash`
--

DROP TABLE IF EXISTS `hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hash` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Field` varchar(40) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Hash_Key_Field` (`Key`,`Field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hash`
--

LOCK TABLES `hash` WRITE;
/*!40000 ALTER TABLE `hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StateId` int(11) DEFAULT NULL,
  `StateName` varchar(20) DEFAULT NULL,
  `InvocationData` longtext NOT NULL,
  `Arguments` longtext NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Job_StateName` (`StateName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (3,13,'Succeeded','{\"Type\":\"Sommus.Gestor.Core.Infra.Email.EmailService, Sommus.Gestor.Core.Infra, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"Envia\",\"ParameterTypes\":\"[\\\"System.Collections.Generic.List`1[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\\\",\\\"System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\\\",\\\"System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\\\",\\\"System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\\\"]\",\"Arguments\":\"[\\\"[\\\\\\\"leohpaim@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"SommusGestor - Agenda\\\\\\\"\\\",\\\"\\\\\\\"Compromisso da Agenda\\\\\\\"\\\",\\\"\\\\\\\"Olá, temos um lembrete pra você.<br /><br />Retornar para cliente e verificar se já avaliou a proposta.<br /><br />Marcado para: <b>domingo, 30 de outubro de 2022 às 15:38</b>\\\\\\\"\\\"]\"}','[\"[\\\"leohpaim@gmail.com\\\"]\",\"\\\"SommusGestor - Agenda\\\"\",\"\\\"Compromisso da Agenda\\\"\",\"\\\"Olá, temos um lembrete pra você.<br /><br />Retornar para cliente e verificar se já avaliou a proposta.<br /><br />Marcado para: <b>domingo, 30 de outubro de 2022 às 15:38</b>\\\"\"]','2022-10-27 18:38:29.278757','2022-11-01 11:42:07.709078');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobparameter`
--

DROP TABLE IF EXISTS `jobparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobparameter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_JobParameter_JobId_Name` (`JobId`,`Name`),
  KEY `FK_JobParameter_Job` (`JobId`),
  CONSTRAINT `FK_JobParameter_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobparameter`
--

LOCK TABLES `jobparameter` WRITE;
/*!40000 ALTER TABLE `jobparameter` DISABLE KEYS */;
INSERT INTO `jobparameter` VALUES (5,3,'CurrentCulture','\"pt-BR\"'),(6,3,'CurrentUICulture','\"pt-BR\"');
/*!40000 ALTER TABLE `jobparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobqueue`
--

DROP TABLE IF EXISTS `jobqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobqueue` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `FetchedAt` datetime(6) DEFAULT NULL,
  `Queue` varchar(50) NOT NULL,
  `FetchToken` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_JobQueue_QueueAndFetchedAt` (`Queue`,`FetchedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobqueue`
--

LOCK TABLES `jobqueue` WRITE;
/*!40000 ALTER TABLE `jobqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobstate`
--

DROP TABLE IF EXISTS `jobstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobstate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Data` longtext,
  PRIMARY KEY (`Id`),
  KEY `FK_JobState_Job` (`JobId`),
  CONSTRAINT `FK_JobState_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobstate`
--

LOCK TABLES `jobstate` WRITE;
/*!40000 ALTER TABLE `jobstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `Id` varchar(100) NOT NULL,
  `Data` longtext NOT NULL,
  `LastHeartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set`
--

DROP TABLE IF EXISTS `set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `set` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `Score` float NOT NULL,
  `ExpireAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Set_Key_Value` (`Key`,`Value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set`
--

LOCK TABLES `set` WRITE;
/*!40000 ALTER TABLE `set` DISABLE KEYS */;
/*!40000 ALTER TABLE `set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Data` longtext,
  PRIMARY KEY (`Id`),
  KEY `FK_HangFire_State_Job` (`JobId`),
  CONSTRAINT `FK_HangFire_State_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (7,3,'Scheduled',NULL,'2022-10-27 18:38:29.287758','{\"EnqueueAt\":\"2022-10-30T08:38:29.1640556Z\",\"ScheduledAt\":\"2022-10-27T18:38:29.2747570Z\"}'),(11,3,'Enqueued','Triggered by DelayedJobScheduler','2022-10-31 11:41:51.833232','{\"EnqueuedAt\":\"2022-10-31T11:41:51.7238565Z\",\"Queue\":\"default\"}'),(12,3,'Processing',NULL,'2022-10-31 11:42:06.666235','{\"StartedAt\":\"2022-10-31T11:42:06.6662355Z\",\"ServerId\":\"desktop:17340:05835414-16a4-41da-a281-0d89158ce5bc\",\"WorkerId\":\"5fd1a53a-bcd3-4e4c-b5f5-02ba2d8e5705\"}'),(13,3,'Succeeded',NULL,'2022-10-31 11:42:07.703078','{\"SucceededAt\":\"2022-10-31T11:42:07.6940781Z\",\"PerformanceDuration\":\"1010\",\"Latency\":\"320617403\"}');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:32:20
