-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_2
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
-- Table structure for table `bordero`
--

DROP TABLE IF EXISTS `bordero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bordero` (
  `bordero_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `taxa` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`bordero_id`),
  KEY `k_bordero_1` (`empresa_id`),
  KEY `k_bordero_2` (`conta_id`),
  CONSTRAINT `fk_bordero_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_bordero_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bordero`
--

LOCK TABLES `bordero` WRITE;
/*!40000 ALTER TABLE `bordero` DISABLE KEYS */;
/*!40000 ALTER TABLE `bordero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bordero_cheque`
--

DROP TABLE IF EXISTS `bordero_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bordero_cheque` (
  `bordero_id` int(11) NOT NULL DEFAULT '0',
  `cheque_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bordero_id`,`cheque_id`),
  KEY `k_bordero_cheque_1` (`bordero_id`),
  KEY `k_bordero_cheque_2` (`cheque_id`),
  CONSTRAINT `fk_bordero_cheque_1` FOREIGN KEY (`bordero_id`) REFERENCES `bordero` (`bordero_id`),
  CONSTRAINT `fk_bordero_cheque_2` FOREIGN KEY (`cheque_id`) REFERENCES `cheque` (`cheque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bordero_cheque`
--

LOCK TABLES `bordero_cheque` WRITE;
/*!40000 ALTER TABLE `bordero_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `bordero_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `caixa_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `pdv_id` int(11) NOT NULL DEFAULT '0',
  `abertura_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `abertura_usuario_id` int(11) NOT NULL DEFAULT '0',
  `fechamento_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `fechamento_usuario_id` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `saldo_inicial` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_atual` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`caixa_id`),
  KEY `k_caixa_1` (`empresa_id`),
  KEY `k_caixa_2` (`pdv_id`),
  KEY `k_caixa_3` (`abertura_usuario_id`),
  KEY `k_caixa_4` (`fechamento_usuario_id`),
  CONSTRAINT `fk_caixa_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_caixa_2` FOREIGN KEY (`pdv_id`) REFERENCES `pdv` (`pdv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_usuario`
--

DROP TABLE IF EXISTS `caixa_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa_usuario` (
  `caixa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `responsavel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`caixa_id`,`usuario_id`),
  KEY `k_caixa_usuario_1` (`caixa_id`),
  KEY `k_caixa_usuario_2` (`usuario_id`),
  CONSTRAINT `fk_caixa_usuario_1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`caixa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_usuario`
--

LOCK TABLES `caixa_usuario` WRITE;
/*!40000 ALTER TABLE `caixa_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixa_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa_valor`
--

DROP TABLE IF EXISTS `caixa_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa_valor` (
  `caixa_id` int(11) NOT NULL DEFAULT '0',
  `forma_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `valor_apurado` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_informado` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`caixa_id`,`forma_pagamento_id`),
  KEY `f_caixa_valor_1` (`caixa_id`),
  KEY `f_caixa_valor_2` (`forma_pagamento_id`),
  CONSTRAINT `fk_caixa_valor_1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`caixa_id`),
  CONSTRAINT `fk_caixa_valor_2` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa_valor`
--

LOCK TABLES `caixa_valor` WRITE;
/*!40000 ALTER TABLE `caixa_valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixa_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao` (
  `cartao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `adquirente_id` int(11) NOT NULL DEFAULT '0',
  `bandeira_id` int(11) NOT NULL DEFAULT '0',
  `emissor_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `taxa` decimal(6,2) NOT NULL DEFAULT '0.00',
  `data_transacao` date NOT NULL DEFAULT '0001-01-01',
  `data_recebimento` date NOT NULL DEFAULT '0001-01-01',
  `parcelamento` int(1) NOT NULL DEFAULT '0',
  `parcelas` int(3) NOT NULL DEFAULT '0',
  `nsu` varchar(50) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartao_id`),
  UNIQUE KEY `uk_cartao_1` (`nsu`),
  KEY `k_cartao_1` (`empresa_id`),
  KEY `k_cartao_2` (`adquirente_id`),
  KEY `k_cartao_3` (`bandeira_id`),
  KEY `k_cartao_4` (`emissor_id`),
  CONSTRAINT `fk_cartao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito`
--

DROP TABLE IF EXISTS `cartao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito` (
  `cartao_credito_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `limite` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fechamento` int(2) NOT NULL DEFAULT '0',
  `vencimento` int(2) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartao_credito_id`),
  KEY `k_cartao_credito_1` (`empresa_id`),
  KEY `k_cartao_credito_2` (`conta_id`),
  CONSTRAINT `fk_cartao_credito_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_cartao_credito_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito`
--

LOCK TABLES `cartao_credito` WRITE;
/*!40000 ALTER TABLE `cartao_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_anexo`
--

DROP TABLE IF EXISTS `cartao_credito_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_anexo` (
  `cartao_credito_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartao_credito_movimento_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`cartao_credito_anexo_id`),
  KEY `k_cartao_credito_anexo_1` (`cartao_credito_movimento_id`),
  CONSTRAINT `fk_cartao_credito_anexo_1` FOREIGN KEY (`cartao_credito_movimento_id`) REFERENCES `cartao_credito_movimento` (`cartao_credito_movimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_anexo`
--

LOCK TABLES `cartao_credito_anexo` WRITE;
/*!40000 ALTER TABLE `cartao_credito_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_categoria`
--

DROP TABLE IF EXISTS `cartao_credito_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_categoria` (
  `cartao_credito_movimento_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`cartao_credito_movimento_id`,`categoria_id`),
  KEY `k_cartao_credito_categoria_1` (`cartao_credito_movimento_id`),
  KEY `k_cartao_credito_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_cartao_credito_categoria_1` FOREIGN KEY (`cartao_credito_movimento_id`) REFERENCES `cartao_credito_movimento` (`cartao_credito_movimento_id`),
  CONSTRAINT `fk_cartao_credito_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_categoria`
--

LOCK TABLES `cartao_credito_categoria` WRITE;
/*!40000 ALTER TABLE `cartao_credito_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_centro_resultado`
--

DROP TABLE IF EXISTS `cartao_credito_centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_centro_resultado` (
  `cartao_credito_movimento_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`cartao_credito_movimento_id`,`centro_resultado_id`),
  KEY `k_cartao_credito_centro_resultado_1` (`cartao_credito_movimento_id`),
  KEY `k_cartao_credito_centro_resultado_2` (`centro_resultado_id`),
  CONSTRAINT `fk_cartao_credito_centro_resultado_1` FOREIGN KEY (`cartao_credito_movimento_id`) REFERENCES `cartao_credito_movimento` (`cartao_credito_movimento_id`),
  CONSTRAINT `fk_cartao_credito_centro_resultado_2` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_centro_resultado`
--

LOCK TABLES `cartao_credito_centro_resultado` WRITE;
/*!40000 ALTER TABLE `cartao_credito_centro_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_centro_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_conta_contabil`
--

DROP TABLE IF EXISTS `cartao_credito_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_conta_contabil` (
  `cartao_credito_movimento_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartao_credito_movimento_id`,`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_cartao_credito_conta_contabil_1` (`cartao_credito_movimento_id`),
  KEY `k_cartao_credito_conta_contabil_2` (`categoria_id`),
  KEY `k_cartao_credito_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_cartao_credito_conta_contabil_4` (`cartao_credito_movimento_id`,`categoria_id`),
  CONSTRAINT `fk_cartao_credito_conta_contabil_1` FOREIGN KEY (`cartao_credito_movimento_id`) REFERENCES `cartao_credito_movimento` (`cartao_credito_movimento_id`),
  CONSTRAINT `fk_cartao_credito_conta_contabil_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_cartao_credito_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_cartao_credito_conta_contabil_4` FOREIGN KEY (`cartao_credito_movimento_id`, `categoria_id`) REFERENCES `cartao_credito_categoria` (`cartao_credito_movimento_id`, `categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_conta_contabil`
--

LOCK TABLES `cartao_credito_conta_contabil` WRITE;
/*!40000 ALTER TABLE `cartao_credito_conta_contabil` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_fatura`
--

DROP TABLE IF EXISTS `cartao_credito_fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_fatura` (
  `cartao_credito_fatura_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartao_credito_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fechada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartao_credito_fatura_id`),
  UNIQUE KEY `uk_cartao_credito_fatura_1` (`cartao_credito_id`,`mes`),
  KEY `k_cartao_credito_fatura_1` (`cartao_credito_id`),
  KEY `k_cartao_credito_fatura_2` (`conta_id`),
  CONSTRAINT `fk_cartao_credito_fatura_1` FOREIGN KEY (`cartao_credito_id`) REFERENCES `cartao_credito` (`cartao_credito_id`),
  CONSTRAINT `fk_cartao_credito_fatura_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_fatura`
--

LOCK TABLES `cartao_credito_fatura` WRITE;
/*!40000 ALTER TABLE `cartao_credito_fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_credito_movimento`
--

DROP TABLE IF EXISTS `cartao_credito_movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartao_credito_movimento` (
  `cartao_credito_movimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartao_credito_fatura_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) DEFAULT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `data` date NOT NULL DEFAULT '0001-01-01',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`cartao_credito_movimento_id`),
  KEY `k_cartao_credito_movimento_1` (`cartao_credito_fatura_id`),
  KEY `k_cartao_credito_movimento_2` (`fornecedor_id`),
  KEY `k_cartao_credito_movimento_3` (`compra_id`),
  CONSTRAINT `fk_cartao_credito_movimento_1` FOREIGN KEY (`cartao_credito_fatura_id`) REFERENCES `cartao_credito_fatura` (`cartao_credito_fatura_id`),
  CONSTRAINT `fk_cartao_credito_movimento_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cartao_credito_movimento_3` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito_movimento`
--

LOCK TABLES `cartao_credito_movimento` WRITE;
/*!40000 ALTER TABLE `cartao_credito_movimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao_credito_movimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `codigo` varchar(30) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `categoria_grupo_id` int(11) DEFAULT NULL,
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `uk_categoria_1` (`codigo_interno`),
  KEY `k_categoria_1` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,'','S',3),(117,28,'2','CUSTOS',NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,'C','A',4),(124,35,'3','DESPESAS',NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,'D','A',4),(130,41,'3.1.01.005','Cartório',23,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,'D','A',4),(135,46,'3.1.01.010','Correios',23,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,'D','A',4),(137,48,'3.1.01.012','Doações',23,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,'D','A',4),(156,67,'3.1.02.002','Comissões',24,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,'D','A',4),(158,69,'3.1.02.004','Premiações',24,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,'D','A',4),(172,83,'3.1.05.004','Jornais',27,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,'D','A',4),(182,93,'3.1.06.005','Comissão',28,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,'D','A',4),(185,96,'3.1.06.008','Férias',28,'D','A',4),(186,97,'3.1.06.009','FGTS',28,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,'D','A',4),(188,99,'3.1.06.011','INSS',28,'D','A',4),(189,100,'3.1.06.012','IRRF',28,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,'D','A',4),(191,102,'3.1.06.014','Salário',28,'D','A',4),(192,103,'3.1.06.015','Salário família',28,'D','A',4),(193,104,'3.1.06.016','Seguro',28,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,'D','A',4),(208,119,'4.1.01.002','Ações',32,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,'','S',3),(225,NULL,'6.1.01.001','Contas a receber',38,'C','A',4),(226,NULL,'2.1.01.006','Devolução de compra à prazo',22,'C','A',4),(227,NULL,'1.1.01.011','(Teste Movimento) - Vendas a Vista',1,'C','A',4),(228,NULL,'1.1.01.012','(Teste Movimento) - Vendas a Prazo',2,'C','A',4),(229,NULL,'1.1.01.013','(Teste Movimento) - Recebimento de vendas a prazo',5,'C','A',4);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_categoria before insert on categoria for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nome';
	end if;
	if new.categoria_grupo_id <= 0 and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.categoria_grupo_id > 0 and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.credito_debito not in ('c','d') and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.credito_debito <> '' and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nivel';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_categoria before update on categoria for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nome';
	end if;
	if new.categoria_grupo_id <= 0 and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.categoria_grupo_id > 0 and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.categoria_grupo_id';
	end if;
	if new.credito_debito not in ('c','d') and new.analitica_sintetica = 'a' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.credito_debito <> '' and new.analitica_sintetica = 's' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.credito_debito';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: categoria.nivel';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria_centro_resultado`
--

DROP TABLE IF EXISTS `categoria_centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_centro_resultado` (
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`categoria_id`,`centro_resultado_id`,`empresa_id`),
  KEY `k_categoria_centro_resultado_1` (`categoria_id`),
  KEY `k_categoria_centro_resultado_2` (`centro_resultado_id`),
  KEY `k_categoria_centro_resultado_3` (`empresa_id`),
  CONSTRAINT `fk_categoria_centro_resultado_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria_centro_resultado_2` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`),
  CONSTRAINT `fk_categoria_centro_resultado_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_centro_resultado`
--

LOCK TABLES `categoria_centro_resultado` WRITE;
/*!40000 ALTER TABLE `categoria_centro_resultado` DISABLE KEYS */;
INSERT INTO `categoria_centro_resultado` VALUES (227,4,3,100.0000),(228,4,3,100.0000),(229,4,3,100.0000);
/*!40000 ALTER TABLE `categoria_centro_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_conta_contabil`
--

DROP TABLE IF EXISTS `categoria_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_conta_contabil` (
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_categoria_conta_contabil_1` (`categoria_id`),
  KEY `k_categoria_conta_contabil_2` (`conta_contabil_id`),
  CONSTRAINT `fk_categoria_conta_contabil_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria_conta_contabil_2` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_conta_contabil`
--

LOCK TABLES `categoria_conta_contabil` WRITE;
/*!40000 ALTER TABLE `categoria_conta_contabil` DISABLE KEYS */;
INSERT INTO `categoria_conta_contabil` VALUES (1,5,3,100.0000,1),(1,40,1,100.0000,1),(1,40,4,100.0000,2),(1,145,1,100.0000,2),(1,160,1,100.0000,1),(2,4,3,100.0000,2),(2,40,1,100.0000,2),(3,4,3,100.0000,2),(3,40,1,100.0000,2),(4,4,3,100.0000,1),(4,40,1,100.0000,1),(4,40,4,100.0000,2),(4,156,1,100.0000,2),(4,170,1,100.0000,1),(5,5,3,100.0000,1),(5,37,1,100.0000,1),(5,37,4,100.0000,2),(5,95,1,100.0000,2),(5,120,1,100.0000,1),(6,5,3,100.0000,1),(6,37,1,100.0000,1),(6,37,4,100.0000,2),(6,93,1,100.0000,2),(6,118,1,100.0000,1),(7,5,3,100.0000,1),(7,37,1,100.0000,1),(7,37,4,100.0000,2),(7,110,1,100.0000,2),(7,135,1,100.0000,1),(8,5,3,100.0000,1),(8,40,1,100.0000,1),(8,40,4,100.0000,2),(8,153,1,100.0000,2),(8,167,1,100.0000,1),(9,5,3,100.0000,1),(9,23,2,100.0000,2),(9,37,1,100.0000,1),(9,37,4,100.0000,2),(9,194,1,100.0000,1),(10,5,3,100.0000,1),(10,193,1,100.0000,1),(10,196,1,100.0000,1),(11,5,3,100.0000,1),(11,13,2,100.0000,2),(11,37,1,100.0000,1),(11,37,4,100.0000,2),(11,84,1,100.0000,1),(12,4,3,100.0000,1),(12,12,2,100.0000,1),(12,84,1,100.0000,1),(13,5,3,100.0000,1),(13,37,1,100.0000,1),(13,37,4,100.0000,2),(13,98,1,100.0000,2),(13,123,1,100.0000,1),(14,12,2,100.0000,2),(14,37,4,100.0000,2),(15,4,3,100.0000,1),(15,12,2,100.0000,1),(15,83,1,100.0000,1),(16,5,3,100.0000,1),(16,37,1,100.0000,1),(16,37,4,100.0000,2),(16,98,1,100.0000,2),(16,123,1,100.0000,1),(17,5,3,100.0000,1),(17,37,1,100.0000,1),(17,37,4,100.0000,2),(17,108,1,100.0000,2),(17,133,1,100.0000,1),(18,4,3,100.0000,1),(18,46,1,100.0000,1),(18,46,4,100.0000,2),(18,173,1,100.0000,2),(18,174,1,100.0000,1),(19,5,3,100.0000,1),(19,37,1,100.0000,1),(19,37,4,100.0000,2),(19,105,1,100.0000,2),(19,130,1,100.0000,1),(20,4,3,100.0000,1),(20,40,1,100.0000,1),(20,40,4,100.0000,2),(20,155,1,100.0000,2),(20,169,1,100.0000,1),(21,40,1,100.0000,2),(21,46,4,100.0000,2),(22,40,1,100.0000,2),(22,144,4,100.0000,2),(23,40,1,100.0000,2),(23,46,4,100.0000,2),(24,5,2,100.0000,1),(24,40,1,100.0000,2),(24,40,4,100.0000,1),(24,152,4,100.0000,2),(25,40,1,100.0000,2),(25,144,4,100.0000,2),(26,40,1,100.0000,2),(26,144,4,100.0000,2),(27,38,1,100.0000,1),(27,39,4,100.0000,1),(28,7,3,100.0000,1),(28,8,2,100.0000,1),(29,12,3,100.0000,2),(29,37,1,100.0000,2),(30,5,2,100.0000,1),(30,12,3,100.0000,1),(30,83,4,100.0000,1),(31,10,3,100.0000,2),(31,12,2,100.0000,2),(31,59,1,100.0000,2),(31,80,4,100.0000,2),(32,5,3,100.0000,1),(32,12,2,100.0000,1),(32,59,1,100.0000,1),(32,61,1,100.0000,1),(32,80,4,100.0000,1),(33,5,3,100.0000,1),(33,43,1,100.0000,1),(33,43,4,100.0000,2),(33,180,1,100.0000,2),(33,186,1,100.0000,1),(34,5,3,100.0000,1),(34,46,1,100.0000,1),(34,46,4,100.0000,2),(34,146,1,100.0000,2),(34,161,1,100.0000,1),(35,5,3,100.0000,1),(35,37,1,100.0000,1),(35,37,4,100.0000,2),(35,94,1,100.0000,2),(35,119,1,100.0000,1),(36,5,3,100.0000,1),(36,46,1,100.0000,1),(36,46,4,100.0000,2),(36,147,1,100.0000,2),(36,162,1,100.0000,1),(37,5,3,100.0000,1),(37,37,1,100.0000,1),(37,37,4,100.0000,2),(37,97,1,100.0000,2),(37,122,1,100.0000,1),(38,5,3,100.0000,1),(38,37,1,100.0000,1),(38,37,4,100.0000,2),(38,151,1,100.0000,2),(38,166,1,100.0000,1),(39,5,3,100.0000,1),(39,45,1,100.0000,1),(39,45,4,100.0000,2),(39,100,1,100.0000,2),(39,125,1,100.0000,1),(40,5,3,100.0000,1),(40,45,1,100.0000,1),(40,45,4,100.0000,2),(40,100,1,100.0000,2),(40,125,1,100.0000,1),(41,5,3,100.0000,1),(41,45,1,100.0000,1),(41,45,4,100.0000,2),(41,100,1,100.0000,2),(41,125,1,100.0000,1),(42,5,3,100.0000,1),(42,45,1,100.0000,1),(42,45,4,100.0000,2),(42,146,1,100.0000,2),(42,161,1,100.0000,1),(43,5,3,100.0000,1),(43,33,2,100.0000,1),(43,195,1,100.0000,1),(44,40,2,100.0000,2),(44,42,4,100.0000,2),(45,5,3,100.0000,1),(45,41,1,100.0000,1),(45,41,4,100.0000,2),(45,181,1,100.0000,2),(45,187,1,100.0000,1),(46,5,3,100.0000,1),(46,37,1,100.0000,1),(46,37,4,100.0000,2),(46,115,1,100.0000,2),(46,140,1,100.0000,1),(47,5,3,100.0000,1),(47,37,1,100.0000,1),(47,37,4,100.0000,2),(47,109,1,100.0000,2),(47,134,1,100.0000,1),(48,5,3,100.0000,1),(48,37,1,100.0000,1),(48,37,4,100.0000,2),(48,101,1,100.0000,2),(48,126,1,100.0000,1),(49,4,3,100.0000,1),(49,37,1,100.0000,1),(49,37,4,100.0000,2),(49,117,1,100.0000,2),(49,142,1,100.0000,1),(50,5,3,100.0000,1),(50,37,1,100.0000,1),(50,37,4,100.0000,2),(50,107,1,100.0000,2),(50,132,1,100.0000,1),(51,5,3,100.0000,1),(51,37,1,100.0000,1),(51,37,4,100.0000,2),(51,102,1,100.0000,2),(51,127,1,100.0000,1),(52,4,3,100.0000,1),(52,46,1,100.0000,1),(52,174,1,100.0000,1),(53,5,3,100.0000,1),(53,151,1,100.0000,1),(53,166,1,100.0000,1),(54,4,3,100.0000,1),(54,46,1,100.0000,1),(54,161,1,100.0000,1),(55,5,3,100.0000,1),(55,148,1,100.0000,1),(55,163,1,100.0000,1),(56,4,3,100.0000,1),(56,37,1,100.0000,1),(56,37,4,100.0000,2),(56,154,1,100.0000,2),(56,168,1,100.0000,1),(57,4,3,100.0000,1),(57,37,1,100.0000,1),(57,37,4,100.0000,2),(57,158,1,100.0000,2),(57,172,1,100.0000,1),(58,4,3,100.0000,1),(58,42,1,100.0000,1),(58,125,1,100.0000,1),(59,10,2,100.0000,2),(59,60,4,100.0000,2),(60,4,2,100.0000,1),(60,60,4,100.0000,1),(60,62,4,100.0000,1),(61,12,2,100.0000,1),(61,15,3,100.0000,1),(62,13,3,100.0000,1),(62,15,2,100.0000,1),(63,5,2,100.0000,1),(63,8,3,100.0000,1),(64,4,2,100.0000,1),(64,10,3,100.0000,1),(64,65,4,100.0000,1),(65,5,2,100.0000,1),(65,6,3,100.0000,1),(66,4,2,100.0000,1),(66,10,3,100.0000,1),(66,64,4,100.0000,1),(67,5,2,100.0000,1),(67,43,4,100.0000,1),(68,5,2,100.0000,1),(68,33,3,100.0000,1),(69,4,3,100.0000,1),(69,54,1,100.0000,2),(69,55,1,100.0000,1),(69,55,4,100.0000,2),(69,216,1,100.0000,1),(70,4,3,100.0000,1),(70,40,1,100.0000,1),(70,40,4,100.0000,2),(70,148,1,100.0000,2),(70,163,1,100.0000,1),(71,4,3,100.0000,1),(71,40,1,100.0000,1),(71,40,4,100.0000,2),(71,157,1,100.0000,2),(71,171,1,100.0000,1),(72,5,3,100.0000,1),(72,40,1,100.0000,1),(72,40,4,100.0000,2),(72,144,1,100.0000,2),(72,159,1,100.0000,1),(73,4,3,100.0000,1),(73,5,2,100.0000,1),(74,5,3,100.0000,1),(74,37,1,100.0000,1),(74,37,4,100.0000,2),(74,149,1,100.0000,2),(74,164,1,100.0000,1),(75,5,3,100.0000,1),(75,37,1,100.0000,1),(75,37,4,100.0000,2),(75,114,1,100.0000,2),(75,139,1,100.0000,1),(76,5,3,100.0000,1),(76,37,1,100.0000,1),(76,37,4,100.0000,2),(76,116,1,100.0000,2),(76,141,1,100.0000,1),(77,5,3,100.0000,1),(77,37,1,100.0000,1),(77,37,4,100.0000,2),(77,111,1,100.0000,2),(77,136,1,100.0000,1),(78,5,3,100.0000,1),(78,37,1,100.0000,1),(78,37,4,100.0000,2),(78,99,1,100.0000,2),(78,124,1,100.0000,1),(79,5,3,100.0000,1),(79,37,1,100.0000,1),(79,37,4,100.0000,2),(79,112,1,100.0000,2),(79,137,1,100.0000,1),(80,4,2,100.0000,1),(80,5,3,100.0000,1),(81,5,3,100.0000,1),(81,37,1,100.0000,1),(81,37,4,100.0000,2),(81,179,1,100.0000,2),(81,182,1,100.0000,1),(82,5,3,100.0000,1),(82,37,1,100.0000,1),(82,37,4,100.0000,2),(82,176,1,100.0000,2),(82,183,1,100.0000,1),(83,4,3,100.0000,1),(83,37,1,100.0000,1),(83,37,4,100.0000,2),(83,93,1,100.0000,2),(83,118,1,100.0000,1),(84,5,3,100.0000,1),(84,37,1,100.0000,1),(84,37,4,100.0000,2),(84,96,1,100.0000,2),(84,121,1,100.0000,1),(85,10,2,100.0000,2),(85,12,3,100.0000,2),(85,59,4,100.0000,2),(85,80,1,100.0000,2),(86,4,2,100.0000,1),(86,12,3,100.0000,1),(86,59,4,100.0000,1),(86,61,4,100.0000,1),(86,80,1,100.0000,1),(87,4,2,100.0000,1),(87,12,3,100.0000,1),(87,60,4,100.0000,1),(87,80,1,100.0000,1),(88,5,3,100.0000,1),(88,37,1,100.0000,1),(88,37,4,100.0000,2),(88,106,1,100.0000,2),(88,131,1,100.0000,1),(89,5,3,100.0000,1),(89,37,1,100.0000,1),(89,83,1,100.0000,1),(90,5,2,100.0000,1),(90,13,3,100.0000,1);
/*!40000 ALTER TABLE `categoria_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_empresa`
--

DROP TABLE IF EXISTS `categoria_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_empresa` (
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_cartao_id` int(11) DEFAULT NULL,
  `credito_debito_conta_cartao` char(1) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`,`empresa_id`),
  KEY `k_categoria_empresa_1` (`categoria_id`),
  KEY `k_categoria_empresa_2` (`empresa_id`),
  KEY `k_categoria_empresa_3` (`conta_cartao_id`),
  CONSTRAINT `fk_categoria_empresa_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_categoria_empresa_3` FOREIGN KEY (`conta_cartao_id`) REFERENCES `conta_cartao` (`conta_cartao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_empresa`
--

LOCK TABLES `categoria_empresa` WRITE;
/*!40000 ALTER TABLE `categoria_empresa` DISABLE KEYS */;
INSERT INTO `categoria_empresa` VALUES (90,3,NULL,'',1,0),(91,3,NULL,'',1,0),(92,3,NULL,'',1,0),(93,3,NULL,'',1,0),(94,3,NULL,'',1,0),(95,3,NULL,'',1,0),(96,3,NULL,'',1,0),(97,3,NULL,'',1,0),(98,3,NULL,'',1,0),(99,3,NULL,'',1,0),(100,3,NULL,'',1,0),(101,3,NULL,'',1,0),(102,3,NULL,'',1,0),(103,3,NULL,'',1,0),(104,3,NULL,'',1,0),(105,3,NULL,'',1,0),(106,3,NULL,'',1,0),(107,3,NULL,'',1,0),(108,3,NULL,'',1,0),(109,3,NULL,'',1,0),(110,3,NULL,'',1,0),(111,3,NULL,'',1,0),(112,3,NULL,'',1,0),(113,3,NULL,'',1,0),(114,3,NULL,'',1,0),(115,3,NULL,'',1,0),(116,3,NULL,'',1,0),(117,3,NULL,'',1,0),(118,3,NULL,'',1,0),(119,3,NULL,'',1,0),(120,3,NULL,'',1,0),(121,3,NULL,'',1,0),(122,3,NULL,'',1,0),(123,3,NULL,'',1,0),(124,3,NULL,'',1,0),(125,3,NULL,'',1,0),(126,3,NULL,'',1,0),(127,3,NULL,'',1,0),(128,3,NULL,'',1,0),(129,3,NULL,'',1,0),(130,3,NULL,'',1,0),(131,3,NULL,'',1,0),(132,3,NULL,'',1,0),(133,3,NULL,'',1,0),(134,3,NULL,'',1,0),(135,3,NULL,'',1,0),(136,3,NULL,'',1,0),(137,3,NULL,'',1,0),(138,3,NULL,'',1,0),(139,3,NULL,'',1,0),(140,3,NULL,'',1,0),(141,3,NULL,'',1,0),(142,3,NULL,'',1,0),(143,3,NULL,'',1,0),(144,3,NULL,'',1,0),(145,3,NULL,'',1,0),(146,3,NULL,'',1,0),(147,3,NULL,'',1,0),(148,3,NULL,'',1,0),(149,3,NULL,'',1,0),(150,3,NULL,'',1,0),(151,3,NULL,'',1,0),(152,3,NULL,'',1,0),(153,3,NULL,'',1,0),(154,3,NULL,'',1,0),(155,3,NULL,'',1,0),(156,3,NULL,'',1,0),(157,3,NULL,'',1,0),(158,3,NULL,'',1,0),(159,3,NULL,'',1,0),(160,3,NULL,'',1,0),(161,3,NULL,'',1,0),(162,3,NULL,'',1,0),(163,3,NULL,'',1,0),(164,3,NULL,'',1,0),(165,3,NULL,'',1,0),(166,3,NULL,'',1,0),(167,3,NULL,'',1,0),(168,3,NULL,'',1,0),(169,3,NULL,'',1,0),(170,3,NULL,'',1,0),(171,3,NULL,'',1,0),(172,3,NULL,'',1,0),(173,3,NULL,'',1,0),(174,3,NULL,'',1,0),(175,3,NULL,'',1,0),(176,3,NULL,'',1,0),(177,3,NULL,'',1,0),(178,3,NULL,'',1,0),(179,3,NULL,'',1,0),(180,3,NULL,'',1,0),(181,3,NULL,'',1,0),(182,3,NULL,'',1,0),(183,3,NULL,'',1,0),(184,3,NULL,'',1,0),(185,3,NULL,'',1,0),(186,3,NULL,'',1,0),(187,3,NULL,'',1,0),(188,3,NULL,'',1,0),(189,3,NULL,'',1,0),(190,3,NULL,'',1,0),(191,3,NULL,'',1,0),(192,3,NULL,'',1,0),(193,3,NULL,'',1,0),(194,3,NULL,'',1,0),(195,3,NULL,'',1,0),(196,3,NULL,'',1,0),(197,3,NULL,'',1,0),(198,3,NULL,'',1,0),(199,3,NULL,'',1,0),(200,3,NULL,'',1,0),(201,3,NULL,'',1,0),(202,3,NULL,'',1,0),(203,3,NULL,'',1,0),(204,3,NULL,'',1,0),(205,3,NULL,'',1,0),(206,3,NULL,'',1,0),(207,3,NULL,'',1,0),(208,3,NULL,'',1,0),(209,3,NULL,'',1,0),(210,3,NULL,'',1,0),(211,3,NULL,'',1,0),(212,3,NULL,'',1,0),(213,3,NULL,'',1,0),(214,3,NULL,'',1,0),(215,3,NULL,'',1,0),(216,3,NULL,'',1,0),(217,3,NULL,'',1,0),(218,3,NULL,'',1,0),(219,3,NULL,'',1,0),(220,3,NULL,'',1,0),(221,3,NULL,'',1,0),(222,3,NULL,'',1,0),(223,3,NULL,'',1,0),(224,3,NULL,'',1,0),(225,3,NULL,'',1,0),(226,3,NULL,'',1,0),(227,3,NULL,'',1,0),(228,3,NULL,'',1,0),(229,3,NULL,'',1,0);
/*!40000 ALTER TABLE `categoria_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_grupo`
--

DROP TABLE IF EXISTS `categoria_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_grupo` (
  `categoria_grupo_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `codigo` varchar(30) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoria_grupo_id`),
  UNIQUE KEY `uk_categoria_grupo_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo`
--

LOCK TABLES `categoria_grupo` WRITE;
/*!40000 ALTER TABLE `categoria_grupo` DISABLE KEYS */;
INSERT INTO `categoria_grupo` VALUES (1,1,'1.1.01','Venda de produto a vista','C'),(2,2,'1.1.01','Venda de produto a prazo','C'),(3,3,'1.1.01','Venda de serviço a vista','C'),(4,4,'1.1.01','Venda de serviço a prazo','C'),(5,5,'1.1.01','Recebimento de venda de produto','C'),(6,6,'1.1.01','Recebimento de venda de serviço','C'),(7,7,'1.1.01','Devolução de venda de produto a vista','D'),(8,8,'1.1.01','Devolução de venda de produto a prazo','D'),(9,9,'1.1.01','Devolução de venda de serviço a vista','D'),(10,10,'1.1.01','Devolução de venda de serviço a prazo','D'),(11,11,'1.1.02','Recorrência de serviços','C'),(12,12,'1.1.02','Recebimento de recorrência de serviços','C'),(13,13,'1.2.01','Receitas com integralização de capital','C'),(14,14,'1.2.02','Receitas com vendas de imobilizados','C'),(15,15,'1.2.03','Receitas com investimentos','C'),(16,16,'1.2.04','Receitas com reembolsos','C'),(17,17,'1.2.05','Outras receitas','C'),(18,18,'2.1.01','Compra de produto a vista','D'),(19,19,'2.1.01','Compra de produto a prazo','D'),(20,20,'2.1.01','Pagamento de compra de produto','D'),(21,21,'2.1.01','Devolução de compra de produto a vista','C'),(22,22,'2.1.01','Devolução de compra de produto a prazo','C'),(23,23,'3.1.01','Despesas administrativas','D'),(24,24,'3.1.02','Despesas comerciais','D'),(25,25,'3.1.03','Despesas financeiras','D'),(26,26,'3.1.04','Despesas tributárias','D'),(27,27,'3.1.05','Despesas com marketing','D'),(28,28,'3.1.06','Pagamentos de colaboradores','D'),(29,29,'3.1.06','Descontos de colaboradores','C'),(30,30,'3.1.07','Despesas com sócios','D'),(31,31,'3.1.08','Outras despesas','D'),(32,32,'4.1.01','Investimentos rentáveis','D'),(33,33,'4.1.02','Investimentos em imobilizados','D'),(34,34,'4.1.03','Investimentos em intangíveis','D'),(35,35,'5.1.01','Tomadas de empréstimos','C'),(36,36,'5.1.02','Pagamentos de empréstimos','D'),(37,37,'5.1.03','Pagamentos de juros de empréstimos','D'),(38,38,'6.1.01','Créditos de terceiros','C'),(39,39,'6.1.02','Débitos de terceiros','D');
/*!40000 ALTER TABLE `categoria_grupo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_categoria_grupo before insert on categoria_grupo for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.nome';
	end if;
	if new.credito_debito not in ('c','d') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.credito_debito';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_categoria_grupo before update on categoria_grupo for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.codigo';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.nome';
	end if;
	if new.credito_debito not in ('c','d') then
		signal sqlstate '45000' set message_text = 'invalid value: categoria_grupo.credito_debito';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria_grupo_conta_contabil`
--

DROP TABLE IF EXISTS `categoria_grupo_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_grupo_conta_contabil` (
  `categoria_grupo_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `origem` int(2) NOT NULL DEFAULT '0',
  `saldo` int(1) NOT NULL DEFAULT '0',
  `valor` int(1) NOT NULL DEFAULT '0',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_grupo_id`,`conta_contabil_id`,`origem`,`regime`),
  KEY `k_categoria_grupo_conta_contabil_1` (`categoria_grupo_id`),
  KEY `k_categoria_grupo_conta_contabil_2` (`conta_contabil_id`),
  CONSTRAINT `fk_categoria_grupo_conta_contabil_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_grupo_conta_contabil_2` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo_conta_contabil`
--

LOCK TABLES `categoria_grupo_conta_contabil` WRITE;
/*!40000 ALTER TABLE `categoria_grupo_conta_contabil` DISABLE KEYS */;
INSERT INTO `categoria_grupo_conta_contabil` VALUES (1,4,1,1,1,2),(1,9,1,2,2,2),(1,29,1,1,1,2),(1,34,1,1,1,1),(1,34,1,1,1,2),(1,56,1,1,2,2),(1,78,1,1,1,1),(1,78,1,1,1,2),(2,6,2,1,1,2),(2,9,2,2,2,2),(2,29,2,1,1,2),(2,34,2,1,1,2),(2,56,2,1,2,2),(2,78,2,1,1,2),(3,4,1,1,1,2),(3,29,1,1,1,2),(3,35,1,1,1,1),(3,35,1,1,1,2),(3,78,1,1,1,1),(3,78,1,1,1,2),(4,6,2,1,1,2),(4,29,2,1,1,2),(4,35,2,1,1,2),(4,78,2,1,1,2),(5,4,9,1,1,2),(5,6,9,2,7,2),(5,29,9,1,10,2),(5,36,9,1,7,1),(5,50,9,1,9,1),(5,50,9,1,9,2),(5,71,9,1,8,1),(5,71,9,1,8,2),(5,78,9,1,1,1),(5,78,9,1,10,2),(6,4,9,1,1,2),(6,6,9,2,7,2),(6,29,9,1,10,2),(6,37,9,1,7,1),(6,50,9,1,9,1),(6,50,9,1,9,2),(6,71,9,1,8,1),(6,71,9,1,8,2),(6,78,9,1,1,1),(6,78,9,1,10,2),(7,4,5,2,1,2),(7,9,5,1,2,2),(7,29,5,2,1,2),(7,38,5,2,1,1),(7,38,5,2,1,2),(7,56,5,2,2,2),(7,78,5,2,1,1),(7,78,5,2,1,2),(8,6,6,2,1,2),(8,9,6,1,2,2),(8,29,6,2,1,2),(8,38,6,2,1,2),(8,56,6,2,2,2),(8,78,6,2,1,2),(9,4,5,2,1,2),(9,29,5,2,1,2),(9,39,5,2,1,1),(9,39,5,2,1,2),(9,78,5,2,1,1),(9,78,5,2,1,2),(10,6,6,2,1,2),(10,29,6,2,1,2),(10,39,6,2,1,2),(10,78,6,2,1,2),(11,6,15,1,1,2),(11,29,15,1,1,2),(11,41,15,1,1,2),(11,78,15,1,1,2),(12,4,9,1,1,2),(12,6,9,2,7,2),(12,29,9,1,10,2),(12,41,9,1,7,1),(12,50,9,1,9,1),(12,50,9,1,9,2),(12,71,9,1,8,1),(12,71,9,1,8,2),(12,78,9,1,1,1),(12,78,9,1,10,2),(13,4,9,1,1,2),(13,4,11,1,1,2),(13,7,9,2,7,2),(13,7,12,1,1,2),(13,25,11,1,1,2),(13,25,12,1,1,2),(13,29,9,1,10,2),(13,45,9,1,7,1),(13,45,11,1,1,1),(13,45,11,1,1,2),(13,45,12,1,1,2),(13,50,9,1,9,1),(13,50,9,1,9,2),(13,71,9,1,8,1),(13,71,9,1,8,2),(13,78,9,1,1,1),(13,78,9,1,10,2),(13,78,11,1,1,1),(13,78,11,1,1,2),(13,78,12,1,1,2),(14,4,1,1,1,2),(14,4,9,1,1,2),(14,7,2,1,1,2),(14,7,9,2,7,2),(14,13,1,2,1,2),(14,13,2,2,1,2),(14,29,9,1,10,2),(14,46,1,1,1,1),(14,46,9,1,7,1),(14,50,9,1,9,1),(14,50,9,1,9,2),(14,71,9,1,8,1),(14,71,9,1,8,2),(14,78,1,1,1,1),(14,78,9,1,1,1),(14,78,9,1,10,2),(15,4,9,1,1,2),(15,4,11,1,1,2),(15,7,9,2,7,2),(15,7,12,1,1,2),(15,12,11,2,1,2),(15,12,12,2,1,2),(15,29,9,1,10,2),(15,47,9,1,7,1),(15,47,11,1,1,1),(15,50,9,1,9,1),(15,50,9,1,9,2),(15,71,9,1,8,1),(15,71,9,1,8,2),(15,78,9,1,1,1),(15,78,9,1,10,2),(15,78,11,1,1,1),(16,4,9,1,1,2),(16,4,11,1,1,2),(16,7,9,2,7,2),(16,7,12,1,1,2),(16,29,9,1,10,2),(16,29,11,1,1,2),(16,29,12,1,1,2),(16,48,9,1,7,1),(16,48,11,1,1,1),(16,48,11,1,1,2),(16,48,12,1,1,2),(16,50,9,1,9,1),(16,50,9,1,9,2),(16,71,9,1,8,1),(16,71,9,1,8,2),(16,78,9,1,1,1),(16,78,9,1,10,2),(16,78,11,1,1,1),(16,78,11,1,1,2),(16,78,12,1,1,2),(17,4,9,1,1,2),(17,4,11,1,1,2),(17,7,9,2,7,2),(17,7,12,1,1,2),(17,29,9,1,10,2),(17,29,11,1,1,2),(17,29,12,1,1,2),(17,50,9,1,9,1),(17,50,9,1,9,2),(17,52,9,1,7,1),(17,52,11,1,1,1),(17,52,11,1,1,2),(17,52,12,1,1,2),(17,71,9,1,8,1),(17,71,9,1,8,2),(17,78,9,1,1,1),(17,78,9,1,10,2),(17,78,11,1,1,1),(17,78,11,1,1,2),(17,78,12,1,1,2),(18,4,3,2,1,2),(18,9,3,1,1,2),(18,56,3,1,1,1),(18,78,3,2,1,1),(19,9,4,1,1,2),(19,18,4,1,1,2),(20,4,10,1,1,2),(20,18,10,2,7,2),(20,29,10,2,10,2),(20,49,10,1,8,1),(20,49,10,1,8,2),(20,56,10,1,7,1),(20,72,10,1,9,1),(20,72,10,1,9,2),(20,78,10,1,1,1),(20,78,10,2,10,2),(21,4,7,1,1,2),(21,9,7,2,1,2),(21,56,7,2,1,1),(21,78,7,1,1,1),(22,9,8,2,1,2),(22,18,8,2,1,2),(23,4,10,1,1,2),(23,4,11,2,1,2),(23,21,10,2,7,2),(23,21,13,1,1,2),(23,29,10,2,10,2),(23,29,11,2,1,2),(23,29,13,2,1,2),(23,49,10,1,8,1),(23,49,10,1,8,2),(23,63,10,1,7,1),(23,63,11,1,1,1),(23,63,11,1,1,2),(23,63,13,1,1,2),(23,72,10,1,9,1),(23,72,10,1,9,2),(23,78,10,1,1,1),(23,78,10,2,10,2),(23,78,11,2,1,1),(23,78,11,2,1,2),(23,78,13,2,1,2),(24,4,10,1,1,2),(24,4,11,2,1,2),(24,21,10,2,7,2),(24,21,13,1,1,2),(24,29,10,2,10,2),(24,29,11,2,1,2),(24,29,13,2,1,2),(24,49,10,1,8,1),(24,49,10,1,8,2),(24,64,10,1,7,1),(24,64,11,1,1,1),(24,64,11,1,1,2),(24,64,13,1,1,2),(24,72,10,1,9,1),(24,72,10,1,9,2),(24,78,10,1,1,1),(24,78,10,2,10,2),(24,78,11,2,1,1),(24,78,11,2,1,2),(24,78,13,2,1,2),(25,4,10,1,1,2),(25,4,11,2,1,2),(25,21,10,2,7,2),(25,21,13,1,1,2),(25,29,10,2,10,2),(25,29,11,2,1,2),(25,29,13,2,1,2),(25,49,10,1,8,1),(25,49,10,1,8,2),(25,65,10,1,7,1),(25,65,11,1,1,1),(25,65,11,1,1,2),(25,65,13,1,1,2),(25,72,10,1,9,1),(25,72,10,1,9,2),(25,78,10,1,1,1),(25,78,10,2,10,2),(25,78,11,2,1,1),(25,78,11,2,1,2),(25,78,13,2,1,2),(26,4,10,1,1,2),(26,4,11,2,1,2),(26,21,10,2,7,2),(26,21,13,1,1,2),(26,29,10,2,10,2),(26,29,11,2,1,2),(26,29,13,2,1,2),(26,49,10,1,8,1),(26,49,10,1,8,2),(26,66,10,1,7,1),(26,66,11,1,1,1),(26,66,11,1,1,2),(26,66,13,1,1,2),(26,72,10,1,9,1),(26,72,10,1,9,2),(26,78,10,1,1,1),(26,78,10,2,10,2),(26,78,11,2,1,1),(26,78,11,2,1,2),(26,78,13,2,1,2),(27,4,10,1,1,2),(27,4,11,2,1,2),(27,21,10,2,7,2),(27,21,13,1,1,2),(27,29,10,2,10,2),(27,29,11,2,1,2),(27,29,13,2,1,2),(27,49,10,1,8,1),(27,49,10,1,8,2),(27,67,10,1,7,1),(27,67,11,1,1,1),(27,67,11,1,1,2),(27,67,13,1,1,2),(27,72,10,1,9,1),(27,72,10,1,9,2),(27,78,10,1,1,1),(27,78,10,2,10,2),(27,78,11,2,1,1),(27,78,11,2,1,2),(27,78,13,2,1,2),(28,4,14,2,1,2),(28,29,14,2,1,2),(28,68,14,1,1,1),(28,68,14,1,1,2),(28,78,14,2,1,1),(28,78,14,2,1,2),(29,4,14,1,1,2),(29,29,14,1,1,2),(29,68,14,2,1,1),(29,68,14,2,1,2),(29,78,14,1,1,1),(29,78,14,1,1,2),(30,4,10,1,1,2),(30,4,11,2,1,2),(30,21,10,2,7,2),(30,21,13,1,1,2),(30,29,10,2,10,2),(30,29,11,2,1,2),(30,29,13,2,1,2),(30,49,10,1,8,1),(30,49,10,1,8,2),(30,69,10,1,7,1),(30,69,11,1,1,1),(30,69,11,1,1,2),(30,69,13,1,1,2),(30,72,10,1,9,1),(30,72,10,1,9,2),(30,78,10,1,1,1),(30,78,10,2,10,2),(30,78,11,2,1,1),(30,78,11,2,1,2),(30,78,13,2,1,2),(31,4,10,1,1,2),(31,4,11,2,1,2),(31,21,10,2,7,2),(31,21,13,1,1,2),(31,29,10,2,10,2),(31,29,11,2,1,2),(31,29,13,2,1,2),(31,49,10,1,8,1),(31,49,10,1,8,2),(31,72,10,1,9,1),(31,72,10,1,9,2),(31,74,10,1,7,1),(31,74,11,1,1,1),(31,74,11,1,1,2),(31,74,13,1,1,2),(31,78,10,1,1,1),(31,78,10,2,10,2),(31,78,11,2,1,1),(31,78,11,2,1,2),(31,78,13,2,1,2),(32,4,10,1,1,2),(32,4,11,2,1,2),(32,12,11,1,1,2),(32,12,13,1,1,2),(32,21,10,2,7,2),(32,21,13,2,1,2),(32,29,10,2,10,2),(32,49,10,1,8,1),(32,49,10,1,8,2),(32,58,10,1,7,1),(32,58,11,1,1,1),(32,72,10,1,9,1),(32,72,10,1,9,2),(32,78,10,1,1,1),(32,78,10,2,10,2),(32,78,11,2,1,1),(33,4,3,2,1,2),(33,4,10,1,1,2),(33,13,3,1,1,2),(33,13,4,1,1,2),(33,21,4,2,1,2),(33,21,10,2,7,2),(33,29,10,2,10,2),(33,49,10,1,8,1),(33,49,10,1,8,2),(33,59,3,1,1,1),(33,59,10,1,7,1),(33,72,10,1,9,1),(33,72,10,1,9,2),(33,78,3,2,1,1),(33,78,10,1,1,1),(33,78,10,2,10,2),(34,4,10,1,1,2),(34,4,11,2,1,2),(34,14,11,1,1,2),(34,14,13,1,1,2),(34,21,10,2,7,2),(34,21,13,2,1,2),(34,29,10,2,10,2),(34,49,10,1,8,1),(34,49,10,1,8,2),(34,60,10,1,7,1),(34,60,11,1,1,1),(34,72,10,1,9,1),(34,72,10,1,9,2),(34,78,10,1,1,1),(34,78,10,2,10,2),(34,78,11,2,1,1),(35,4,16,1,3,2),(35,19,16,1,4,2),(35,20,16,2,6,2),(35,29,16,2,5,2),(35,65,16,1,5,1),(35,65,16,1,5,2),(35,78,16,2,5,1),(35,78,16,2,5,2),(36,4,10,2,1,2),(36,19,10,2,7,2),(36,29,10,2,10,2),(36,49,10,1,8,1),(36,49,10,1,8,2),(36,72,10,1,9,1),(36,72,10,1,9,2),(36,78,10,2,10,1),(36,78,10,2,10,2),(37,4,10,2,1,2),(37,19,10,2,7,2),(37,20,10,1,7,2),(37,29,10,2,1,2),(37,49,10,1,8,1),(37,49,10,1,8,2),(37,65,10,1,7,1),(37,65,10,1,7,2),(37,72,10,1,9,1),(37,72,10,1,9,2),(37,78,10,2,1,1),(37,78,10,2,1,2),(38,4,9,1,1,2),(38,4,11,1,1,2),(38,7,9,2,7,2),(38,7,12,1,1,2),(38,29,9,1,10,2),(38,30,11,1,1,2),(38,30,12,1,1,2),(38,50,9,1,9,1),(38,50,9,1,9,2),(38,51,9,1,7,1),(38,51,11,1,1,1),(38,51,11,1,1,2),(38,51,12,1,1,2),(38,71,9,1,8,1),(38,71,9,1,8,2),(38,78,9,1,1,1),(38,78,9,1,10,2),(38,78,11,1,1,1),(38,78,11,1,1,2),(38,78,12,1,1,2),(39,4,10,1,1,2),(39,4,11,2,1,2),(39,21,10,2,7,2),(39,21,13,1,1,2),(39,29,10,2,10,2),(39,30,11,2,1,2),(39,30,13,2,1,2),(39,49,10,1,8,1),(39,49,10,1,8,2),(39,72,10,1,9,1),(39,72,10,1,9,2),(39,73,10,1,7,1),(39,73,11,1,1,1),(39,73,11,1,1,2),(39,73,13,1,1,2),(39,78,10,1,1,1),(39,78,10,2,10,2),(39,78,11,2,1,1),(39,78,11,2,1,2),(39,78,13,2,1,2);
/*!40000 ALTER TABLE `categoria_grupo_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_grupo_empresa`
--

DROP TABLE IF EXISTS `categoria_grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_grupo_empresa` (
  `categoria_grupo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_grupo_id`,`empresa_id`),
  KEY `k_categoria_grupo_empresa_1` (`categoria_grupo_id`),
  KEY `k_categoria_grupo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_categoria_grupo_empresa_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_grupo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo_empresa`
--

LOCK TABLES `categoria_grupo_empresa` WRITE;
/*!40000 ALTER TABLE `categoria_grupo_empresa` DISABLE KEYS */;
INSERT INTO `categoria_grupo_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0),(10,3,1,0),(11,3,1,0),(12,3,1,0),(13,3,1,0),(14,3,1,0),(15,3,1,0),(16,3,1,0),(17,3,1,0),(18,3,1,0),(19,3,1,0),(20,3,1,0),(21,3,1,0),(22,3,1,0),(23,3,1,0);
/*!40000 ALTER TABLE `categoria_grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_resultado`
--

DROP TABLE IF EXISTS `centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_resultado` (
  `centro_resultado_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `centro_resultado_integracao` varchar(30) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`centro_resultado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_resultado`
--

LOCK TABLES `centro_resultado` WRITE;
/*!40000 ALTER TABLE `centro_resultado` DISABLE KEYS */;
INSERT INTO `centro_resultado` VALUES (1,'Departamento Desenvolvimento - Orçamento','',1,0),(2,'Departamento Desenvolvimento - Faturamento','',1,0),(3,'Departamento Administrativo - Orçamento','',1,0),(4,'Departamento Administrativo - Faturamento','',1,0),(5,'Teste exclusão','',1,0);
/*!40000 ALTER TABLE `centro_resultado` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_centro_resultado before insert on centro_resultado for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.excluido';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_centro_resultado before update on centro_resultado for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.nome';
    end if;
    if new.ativo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.ativo';
    end if;
    if new.excluido not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: centro_resultado.excluido';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `centro_resultado_empresa`
--

DROP TABLE IF EXISTS `centro_resultado_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_resultado_empresa` (
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`centro_resultado_id`,`empresa_id`),
  KEY `k_centro_resultado_empresa_1` (`centro_resultado_id`),
  KEY `k_centro_resultado_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_centro_resultado_empresa_1` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`),
  CONSTRAINT `fk_centro_resultado_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_resultado_empresa`
--

LOCK TABLES `centro_resultado_empresa` WRITE;
/*!40000 ALTER TABLE `centro_resultado_empresa` DISABLE KEYS */;
INSERT INTO `centro_resultado_empresa` VALUES (1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `centro_resultado_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfe_mfe`
--

DROP TABLE IF EXISTS `cfe_mfe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfe_mfe` (
  `cfe_mfe_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfe_mfe_id`),
  KEY `k_cfe_mfe_1` (`empresa_id`),
  CONSTRAINT `fk_cfe_mfe_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfe_mfe`
--

LOCK TABLES `cfe_mfe` WRITE;
/*!40000 ALTER TABLE `cfe_mfe` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfe_mfe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfe_mfe_item`
--

DROP TABLE IF EXISTS `cfe_mfe_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfe_mfe_item` (
  `cfe_mfe_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfe_mfe_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfe_mfe_item_id`),
  KEY `k_cfe_mfe_item_1` (`cfe_mfe_id`),
  CONSTRAINT `fk_cfe_mfe_item_1` FOREIGN KEY (`cfe_mfe_id`) REFERENCES `cfe_mfe` (`cfe_mfe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfe_mfe_item`
--

LOCK TABLES `cfe_mfe_item` WRITE;
/*!40000 ALTER TABLE `cfe_mfe_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfe_mfe_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfe_sat`
--

DROP TABLE IF EXISTS `cfe_sat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfe_sat` (
  `cfe_sat_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfe_sat_id`),
  KEY `k_cfe_sat_1` (`empresa_id`),
  CONSTRAINT `fk_cfe_sat_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfe_sat`
--

LOCK TABLES `cfe_sat` WRITE;
/*!40000 ALTER TABLE `cfe_sat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfe_sat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfe_sat_item`
--

DROP TABLE IF EXISTS `cfe_sat_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfe_sat_item` (
  `cfe_sat_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cfe_sat_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfe_sat_item_id`),
  KEY `k_cfe_sat_item_1` (`cfe_sat_id`),
  CONSTRAINT `fk_cfe_sat_item_1` FOREIGN KEY (`cfe_sat_id`) REFERENCES `cfe_sat` (`cfe_sat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfe_sat_item`
--

LOCK TABLES `cfe_sat_item` WRITE;
/*!40000 ALTER TABLE `cfe_sat_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfe_sat_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheque`
--

DROP TABLE IF EXISTS `cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheque` (
  `cheque_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `emitente_id` int(11) NOT NULL DEFAULT '0',
  `banco` int(3) NOT NULL DEFAULT '0',
  `agencia` varchar(15) NOT NULL DEFAULT '',
  `conta` varchar(15) NOT NULL DEFAULT '',
  `numero` varchar(15) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `emissao` date NOT NULL DEFAULT '0001-01-01',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  `emitido_recebido` char(1) NOT NULL DEFAULT '',
  `url_cheque` varchar(500) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cheque_id`),
  UNIQUE KEY `uk_cheque_1` (`banco`,`agencia`,`conta`,`numero`),
  KEY `k_cheque_1` (`empresa_id`),
  KEY `k_cheque_2` (`conta_id`),
  KEY `k_cheque_3` (`pessoa_id`),
  KEY `k_cheque_4` (`emitente_id`),
  CONSTRAINT `fk_cheque_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_cheque_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_cheque_3` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cheque_4` FOREIGN KEY (`emitente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque`
--

LOCK TABLES `cheque` WRITE;
/*!40000 ALTER TABLE `cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_certificado`
--

DROP TABLE IF EXISTS `cliente_certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_certificado` (
  `cliente_certificado_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `signatario` varchar(100) NOT NULL DEFAULT '',
  `cpf_cnpj` varchar(20) NOT NULL DEFAULT '',
  `validade` date NOT NULL DEFAULT '0001-01-01',
  `senha` varchar(50) NOT NULL DEFAULT '',
  `url_certificado` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_certificado_id`),
  KEY `k_cliente_certificado_1` (`cliente_id`),
  CONSTRAINT `fk_cliente_certificado_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_certificado`
--

LOCK TABLES `cliente_certificado` WRITE;
/*!40000 ALTER TABLE `cliente_certificado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_certificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_cnae`
--

DROP TABLE IF EXISTS `cliente_cnae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_cnae` (
  `cliente_cnae_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_cnae_id`),
  UNIQUE KEY `uk_cliente_cnae_1` (`cliente_id`,`codigo`),
  KEY `k_cliente_cnae_1` (`cliente_id`),
  CONSTRAINT `fk_cliente_cnae_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_cnae`
--

LOCK TABLES `cliente_cnae` WRITE;
/*!40000 ALTER TABLE `cliente_cnae` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_cnae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato`
--

DROP TABLE IF EXISTS `cliente_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato` (
  `cliente_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `parceiro_contrato_id` int(11) DEFAULT NULL,
  `servico_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) DEFAULT NULL,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `sla_id` int(11) DEFAULT NULL,
  `data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `data_fim` date NOT NULL DEFAULT '0001-01-01',
  `data_ultimo_reajuste` date NOT NULL DEFAULT '0001-01-01',
  `data_ultimo_faturamento` date NOT NULL DEFAULT '0001-01-01',
  `dia_vencimento` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `desconto` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `indice_reajuste` int(1) NOT NULL DEFAULT '0',
  `faturamento_tipo` int(1) NOT NULL DEFAULT '0',
  `faturamento_calculo` int(1) NOT NULL DEFAULT '0',
  `faturamento_periodicidade` int(1) NOT NULL DEFAULT '0',
  `documento_receber` int(1) NOT NULL DEFAULT '0',
  `documento_fiscal` int(1) NOT NULL DEFAULT '0',
  `parceiro_atendimento` int(1) NOT NULL DEFAULT '0',
  `parceiro_faturamento` int(1) NOT NULL DEFAULT '0',
  `parceiro_financeiro` int(1) NOT NULL DEFAULT '0',
  `parceiro_remuneracao` int(1) NOT NULL DEFAULT '0',
  `parceiro_percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `observacao` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_contrato_id`),
  KEY `k_cliente_contrato_1` (`empresa_id`),
  KEY `k_cliente_contrato_2` (`cliente_id`),
  KEY `k_cliente_contrato_4` (`servico_id`),
  KEY `k_cliente_contrato_5` (`produto_id`),
  KEY `k_cliente_contrato_6` (`conta_id`),
  KEY `k_cliente_contrato_7` (`categoria_id`),
  KEY `k_cliente_contrato_8` (`sla_id`),
  KEY `k_cliente_contrato_3` (`parceiro_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_cliente_contrato_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cliente_contrato_3` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_4` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_cliente_contrato_5` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_cliente_contrato_6` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_cliente_contrato_7` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_cliente_contrato_8` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato`
--

LOCK TABLES `cliente_contrato` WRITE;
/*!40000 ALTER TABLE `cliente_contrato` DISABLE KEYS */;
INSERT INTO `cliente_contrato` VALUES (1,3,2,NULL,4,NULL,1,119,NULL,'2021-10-19','2024-10-19','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,3,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0);
/*!40000 ALTER TABLE `cliente_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato_anexo`
--

DROP TABLE IF EXISTS `cliente_contrato_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_anexo` (
  `cliente_contrato_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_contrato_anexo_id`),
  KEY `k_cliente_contrato_anexo_1` (`cliente_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_anexo_1` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_anexo`
--

LOCK TABLES `cliente_contrato_anexo` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato_atividade`
--

DROP TABLE IF EXISTS `cliente_contrato_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_atividade` (
  `cliente_contrato_atividade_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `assinatura_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `atividade` int(2) NOT NULL DEFAULT '0',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `desconto` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `carencia_data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `carencia_data_fim` date NOT NULL DEFAULT '0001-01-01',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `usuarios` int(4) NOT NULL DEFAULT '0',
  `cliente_contrato_motivo_cancelamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliente_contrato_atividade_id`),
  KEY `k_cliente_contrato_atividade_1` (`cliente_contrato_id`),
  KEY `k_cliente_contrato_atividade_2` (`assinatura_id`),
  KEY `k_cliente_contrato_atividade_3` (`usuario_id`),
  KEY `k_cliente_contrato_atividade_4` (`cliente_contrato_motivo_cancelamento_id`),
  CONSTRAINT `fk_cliente_contrato_atividade_1` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_atividade_4` FOREIGN KEY (`cliente_contrato_motivo_cancelamento_id`) REFERENCES `cliente_contrato_motivo_cancelamento` (`cliente_contrato_motivo_cancelamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_atividade`
--

LOCK TABLES `cliente_contrato_atividade` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato_carencia`
--

DROP TABLE IF EXISTS `cliente_contrato_carencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_carencia` (
  `cliente_contrato_carencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `data_fim` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`cliente_contrato_carencia_id`),
  KEY `k_cliente_contrato_carencia_1` (`cliente_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_carencia_1` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_carencia`
--

LOCK TABLES `cliente_contrato_carencia` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_carencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_carencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato_motivo_cancelamento`
--

DROP TABLE IF EXISTS `cliente_contrato_motivo_cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_motivo_cancelamento` (
  `cliente_contrato_motivo_cancelamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_contrato_motivo_cancelamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_motivo_cancelamento`
--

LOCK TABLES `cliente_contrato_motivo_cancelamento` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_motivo_cancelamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_motivo_cancelamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_contrato_motivo_cancelamento_empresa`
--

DROP TABLE IF EXISTS `cliente_contrato_motivo_cancelamento_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_motivo_cancelamento_empresa` (
  `cliente_contrato_motivo_cancelamento_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `assinatura` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_contrato_motivo_cancelamento_id`,`empresa_id`),
  KEY `k_cliente_contrato_motivo_cancelamento_empresa_1` (`cliente_contrato_motivo_cancelamento_id`),
  KEY `k_cliente_contrato_motivo_cancelamento_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_cliente_contrato_motivo_cancelamento_empresa_1` FOREIGN KEY (`cliente_contrato_motivo_cancelamento_id`) REFERENCES `cliente_contrato_motivo_cancelamento` (`cliente_contrato_motivo_cancelamento_id`),
  CONSTRAINT `fk_cliente_contrato_motivo_cancelamento_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_motivo_cancelamento_empresa`
--

LOCK TABLES `cliente_contrato_motivo_cancelamento_empresa` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_motivo_cancelamento_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_motivo_cancelamento_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_credito`
--

DROP TABLE IF EXISTS `cliente_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_credito` (
  `cliente_credito_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `venda_id` int(11) DEFAULT NULL,
  `devolucao_venda_id` int(11) DEFAULT NULL,
  `recebimento_id` int(11) DEFAULT NULL,
  `recebimento_cancelado_id` int(11) DEFAULT NULL,
  `faturamento_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_credito_id`),
  KEY `k_cliente_credito_1` (`cliente_id`),
  KEY `k_cliente_credito_2` (`empresa_id`),
  KEY `k_cliente_credito_3` (`venda_id`),
  KEY `k_cliente_credito_4` (`devolucao_venda_id`),
  KEY `k_cliente_credito_5` (`recebimento_id`),
  KEY `k_cliente_credito_6` (`recebimento_cancelado_id`),
  KEY `k_cliente_credito_7` (`faturamento_id`),
  CONSTRAINT `fk_cliente_credito_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cliente_credito_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_cliente_credito_3` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_cliente_credito_4` FOREIGN KEY (`devolucao_venda_id`) REFERENCES `devolucao_venda` (`devolucao_venda_id`),
  CONSTRAINT `fk_cliente_credito_5` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`),
  CONSTRAINT `fk_cliente_credito_6` FOREIGN KEY (`recebimento_cancelado_id`) REFERENCES `recebimento_cancelado` (`recebimento_cancelado_id`),
  CONSTRAINT `fk_cliente_credito_7` FOREIGN KEY (`faturamento_id`) REFERENCES `faturamento` (`faturamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_credito`
--

LOCK TABLES `cliente_credito` WRITE;
/*!40000 ALTER TABLE `cliente_credito` DISABLE KEYS */;
INSERT INTO `cliente_credito` VALUES (1,4,3,NULL,1,NULL,NULL,NULL,'2022-10-19 08:57:29',10.50,'C');
/*!40000 ALTER TABLE `cliente_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_departamento`
--

DROP TABLE IF EXISTS `cliente_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_departamento` (
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `departamento_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_id`,`departamento_id`),
  KEY `k_cliente_departamento_1` (`cliente_id`),
  KEY `k_cliente_departamento_2` (`departamento_id`),
  KEY `k_cliente_departamento_3` (`colaborador_id`),
  CONSTRAINT `fk_cliente_departamento_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cliente_departamento_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`),
  CONSTRAINT `fk_cliente_departamento_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_departamento`
--

LOCK TABLES `cliente_departamento` WRITE;
/*!40000 ALTER TABLE `cliente_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_infraestrutura`
--

DROP TABLE IF EXISTS `cliente_infraestrutura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_infraestrutura` (
  `cliente_infraestrutura_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`cliente_infraestrutura_id`),
  KEY `k_cliente_infraestrutura_1` (`cliente_id`),
  CONSTRAINT `fk_cliente_infraestrutura_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_infraestrutura`
--

LOCK TABLES `cliente_infraestrutura` WRITE;
/*!40000 ALTER TABLE `cliente_infraestrutura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_infraestrutura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_infraestrutura_tag`
--

DROP TABLE IF EXISTS `cliente_infraestrutura_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_infraestrutura_tag` (
  `cliente_infraestrutura_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_infraestrutura_id`,`tag_id`),
  KEY `k_cliente_infraestrutura_tag_1` (`cliente_infraestrutura_id`),
  KEY `k_cliente_infraestrutura_tag_2` (`tag_id`),
  CONSTRAINT `fk_cliente_infraestrutura_tag_1` FOREIGN KEY (`cliente_infraestrutura_id`) REFERENCES `cliente_infraestrutura` (`cliente_infraestrutura_id`),
  CONSTRAINT `fk_cliente_infraestrutura_tag_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_infraestrutura_tag`
--

LOCK TABLES `cliente_infraestrutura_tag` WRITE;
/*!40000 ALTER TABLE `cliente_infraestrutura_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_infraestrutura_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_senha`
--

DROP TABLE IF EXISTS `cliente_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_senha` (
  `cliente_senha_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `servico` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `usuario` varchar(50) NOT NULL DEFAULT '',
  `senha` varchar(50) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  PRIMARY KEY (`cliente_senha_id`),
  KEY `k_cliente_senha_1` (`cliente_id`),
  CONSTRAINT `fk_cliente_senha_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_senha`
--

LOCK TABLES `cliente_senha` WRITE;
/*!40000 ALTER TABLE `cliente_senha` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_senha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_solicitante`
--

DROP TABLE IF EXISTS `cliente_solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_solicitante` (
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `solicitante_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_id`,`solicitante_id`),
  KEY `k_cliente_solicitante_1` (`cliente_id`),
  KEY `k_cliente_solicitante_2` (`solicitante_id`),
  CONSTRAINT `fk_cliente_solicitante_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cliente_solicitante_2` FOREIGN KEY (`solicitante_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_solicitante`
--

LOCK TABLES `cliente_solicitante` WRITE;
/*!40000 ALTER TABLE `cliente_solicitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_cargo`
--

DROP TABLE IF EXISTS `colaborador_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_cargo` (
  `colaborador_cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `salario` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`colaborador_cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_cargo`
--

LOCK TABLES `colaborador_cargo` WRITE;
/*!40000 ALTER TABLE `colaborador_cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_cargo_empresa`
--

DROP TABLE IF EXISTS `colaborador_cargo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_cargo_empresa` (
  `colaborador_cargo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`colaborador_cargo_id`,`empresa_id`),
  KEY `k_colaborador_cargo_empresa_1` (`colaborador_cargo_id`),
  KEY `k_colaborador_cargo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_colaborador_cargo_empresa_1` FOREIGN KEY (`colaborador_cargo_id`) REFERENCES `colaborador_cargo` (`colaborador_cargo_id`),
  CONSTRAINT `fk_colaborador_cargo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_cargo_empresa`
--

LOCK TABLES `colaborador_cargo_empresa` WRITE;
/*!40000 ALTER TABLE `colaborador_cargo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_cargo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_contrato`
--

DROP TABLE IF EXISTS `colaborador_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_contrato` (
  `colaborador_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) DEFAULT NULL,
  `colaborador_cargo_id` int(11) DEFAULT NULL,
  `admissao_data` date NOT NULL DEFAULT '0001-01-01',
  `demissao_data` date NOT NULL DEFAULT '0001-01-01',
  `demissao_causa` varchar(200) NOT NULL DEFAULT '',
  `salario` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`colaborador_contrato_id`),
  KEY `k_colaborador_contrato_1` (`empresa_id`),
  KEY `k_colaborador_contrato_2` (`colaborador_id`),
  KEY `k_colaborador_contrato_3` (`centro_resultado_id`),
  KEY `k_colaborador_contrato_4` (`colaborador_cargo_id`),
  CONSTRAINT `fk_colaborador_contrato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_colaborador_contrato_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_colaborador_contrato_3` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`),
  CONSTRAINT `fk_colaborador_contrato_4` FOREIGN KEY (`colaborador_cargo_id`) REFERENCES `colaborador_cargo` (`colaborador_cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato`
--

LOCK TABLES `colaborador_contrato` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_contrato_horario`
--

DROP TABLE IF EXISTS `colaborador_contrato_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_contrato_horario` (
  `colaborador_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` int(1) NOT NULL DEFAULT '0',
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_final` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`colaborador_contrato_id`,`dia_semana`),
  KEY `k_colaborador_contrato_horario_1` (`colaborador_contrato_id`),
  CONSTRAINT `fk_colaborador_contrato_horario_1` FOREIGN KEY (`colaborador_contrato_id`) REFERENCES `colaborador_contrato` (`colaborador_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato_horario`
--

LOCK TABLES `colaborador_contrato_horario` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_contrato_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_lancamento_auto`
--

DROP TABLE IF EXISTS `colaborador_lancamento_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_lancamento_auto` (
  `colaborador_lancamento_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `folha_pagamento_evento_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `forma_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) DEFAULT NULL,
  `lancamento_vencimento_id` int(11) DEFAULT NULL,
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `percentual_salario` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `dia_lancamento` int(2) NOT NULL DEFAULT '0',
  `mes_lancamento` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`colaborador_lancamento_auto_id`),
  UNIQUE KEY `uk_colaborador_lancamento_auto_1` (`empresa_id`,`folha_pagamento_evento_id`,`colaborador_id`,`conta_id`),
  KEY `k_colaborador_lancamento_auto_1` (`empresa_id`),
  KEY `k_colaborador_lancamento_auto_2` (`folha_pagamento_evento_id`),
  KEY `k_colaborador_lancamento_auto_3` (`colaborador_id`),
  KEY `k_colaborador_lancamento_auto_4` (`conta_id`),
  KEY `k_colaborador_lancamento_auto_5` (`forma_pagamento_id`),
  KEY `k_colaborador_lancamento_auto_6` (`centro_resultado_id`),
  KEY `k_colaborador_lancamento_auto_7` (`lancamento_vencimento_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_2` FOREIGN KEY (`folha_pagamento_evento_id`) REFERENCES `folha_pagamento_evento` (`folha_pagamento_evento_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_4` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_5` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_6` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`),
  CONSTRAINT `fk_colaborador_lancamento_auto_7` FOREIGN KEY (`lancamento_vencimento_id`) REFERENCES `colaborador_lancamento_auto` (`colaborador_lancamento_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_lancamento_auto`
--

LOCK TABLES `colaborador_lancamento_auto` WRITE;
/*!40000 ALTER TABLE `colaborador_lancamento_auto` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador_lancamento_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `tipo_frete` int(1) NOT NULL DEFAULT '0',
  `transportador_id` int(11) DEFAULT NULL,
  `data_entrada` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `quantidade_parcelas` int(3) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_impostos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `devolvida` tinyint(1) NOT NULL DEFAULT '0',
  `nfe_id` int(11) DEFAULT NULL,
  `nf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `k_compra_1` (`empresa_id`),
  KEY `k_compra_2` (`operacao_id`),
  KEY `k_compra_3` (`fornecedor_id`),
  KEY `k_compra_4` (`transportador_id`),
  KEY `k_compra_5` (`estoque_id`),
  KEY `k_compra_6` (`nfe_id`),
  KEY `k_compra_7` (`nf_id`),
  CONSTRAINT `fk_compra_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_compra_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_compra_3` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_compra_4` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_compra_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_compra_6` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_compra_7` FOREIGN KEY (`nf_id`) REFERENCES `nf` (`nf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,3,105522,6,3,9,NULL,'2022-10-19',1,0,300.00,300.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,3,NULL),(2,3,129589,6,3,9,NULL,'2022-10-19',2,2,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,4,NULL),(3,3,19985761,6,3,9,NULL,'2022-10-19',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,5,NULL),(4,3,19985762,6,3,9,NULL,'2022-10-19',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,6,NULL),(5,3,19985763,6,3,9,NULL,'2022-10-19',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,7,NULL),(6,3,19985764,6,3,9,NULL,'2022-10-19',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,8,NULL),(7,3,129581,6,3,9,NULL,'2022-10-19',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,9,NULL),(8,3,129582,6,3,9,NULL,'2022-10-19',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,10,NULL),(9,3,129583,6,3,9,NULL,'2022-10-19',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,1,11,NULL),(10,3,129584,6,3,9,NULL,'2022-10-19',2,2,700.00,700.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,12,NULL),(11,3,129585,6,3,9,NULL,'2022-10-19',1,0,70.00,70.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(12,3,129586,6,3,9,NULL,'2022-10-19',1,0,80.00,80.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(13,3,129587,6,3,9,NULL,'2022-10-19',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(14,3,13250,6,3,9,NULL,'2022-10-19',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_item`
--

DROP TABLE IF EXISTS `compra_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_item` (
  `compra_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_impostos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `nfe_item_id` int(11) DEFAULT NULL,
  `nf_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`compra_item_id`),
  KEY `k_compra_item_1` (`compra_id`),
  KEY `k_compra_item_2` (`produto_id`),
  KEY `k_compra_item_3` (`produto_grade_id`),
  KEY `k_compra_item_4` (`produto_lote_id`),
  KEY `k_compra_item_5` (`nfe_item_id`),
  KEY `k_compra_item_6` (`nf_item_id`),
  CONSTRAINT `fk_compra_item_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_compra_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_compra_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_compra_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_compra_item_5` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`),
  CONSTRAINT `fk_compra_item_6` FOREIGN KEY (`nf_item_id`) REFERENCES `nf_item` (`nf_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_item`
--

LOCK TABLES `compra_item` WRITE;
/*!40000 ALTER TABLE `compra_item` DISABLE KEYS */;
INSERT INTO `compra_item` VALUES (1,1,3,NULL,NULL,1,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,3,NULL),(2,1,5,NULL,NULL,2,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,4,NULL),(3,1,1,1,NULL,3,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,5,NULL),(4,2,1,1,NULL,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,6,NULL),(5,3,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,7,NULL),(6,4,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,8,NULL),(7,5,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,9,NULL),(8,6,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,10,NULL),(9,7,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,11,NULL),(10,8,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,12,NULL),(11,9,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,13,NULL),(12,10,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,14,NULL),(13,10,3,NULL,NULL,2,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,15,NULL),(14,10,5,NULL,NULL,3,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,16,NULL),(15,11,7,NULL,NULL,1,10.0000,7.0000,70.00,70.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(16,12,7,NULL,NULL,1,10.0000,8.0000,80.00,80.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(17,13,7,NULL,NULL,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(18,14,1,1,NULL,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,0.00,NULL,1);
/*!40000 ALTER TABLE `compra_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_pendente`
--

DROP TABLE IF EXISTS `compra_pendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_pendente` (
  `compra_pendente_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `operacao_id` int(11) DEFAULT NULL,
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `tipo_frete` int(2) NOT NULL DEFAULT '0',
  `transportador_id` int(11) DEFAULT NULL,
  `data_emissao` date NOT NULL DEFAULT '0001-01-01',
  `data_entrada` date NOT NULL DEFAULT '0001-01-01',
  `serie` int(3) NOT NULL DEFAULT '0',
  `modelo` char(3) NOT NULL DEFAULT '',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `quantidade_parcelas` int(3) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `url_xml` varchar(500) NOT NULL DEFAULT '',
  `estoque_id` int(11) DEFAULT NULL,
  `observacao` text NOT NULL,
  `observacao_fisco` text NOT NULL,
  PRIMARY KEY (`compra_pendente_id`),
  KEY `k_compra_pendente_1` (`empresa_id`),
  KEY `k_compra_pendente_2` (`operacao_id`),
  KEY `k_compra_pendente_3` (`fornecedor_id`),
  KEY `k_compra_pendente_4` (`transportador_id`),
  KEY `k_compra_pendente_5` (`estoque_id`),
  CONSTRAINT `fk_compra_pendente_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_compra_pendente_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_compra_pendente_3` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_compra_pendente_4` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_compra_pendente_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_pendente`
--

LOCK TABLES `compra_pendente` WRITE;
/*!40000 ALTER TABLE `compra_pendente` DISABLE KEYS */;
INSERT INTO `compra_pendente` VALUES (2,3,6,'31190249051659000166550000001391461077451590',7745159,3,9,NULL,'2022-10-19','2022-10-19',1,'55',1,0,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'',''),(16,3,6,'31160704731855000143550010007485481189117075',105522,3,9,NULL,'2022-10-19','2022-10-19',1,'55',1,0,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'','');
/*!40000 ALTER TABLE `compra_pendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_pendente_item`
--

DROP TABLE IF EXISTS `compra_pendente_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_pendente_item` (
  `compra_pendente_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_pendente_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `cfop` int(4) NOT NULL DEFAULT '0',
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_ipi` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_credito_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_bc_c_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`compra_pendente_item_id`),
  KEY `k_compra_pendente_item_1` (`compra_pendente_id`),
  KEY `k_compra_pendente_item_2` (`produto_id`),
  KEY `k_compra_pendente_item_3` (`produto_grade_id`),
  KEY `k_compra_pendente_item_4` (`produto_lote_id`),
  KEY `k_compra_pendente_item_5` (`conta_contabil_id`),
  CONSTRAINT `fk_compra_pendente_item_1` FOREIGN KEY (`compra_pendente_id`) REFERENCES `compra_pendente` (`compra_pendente_id`),
  CONSTRAINT `fk_compra_pendente_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_compra_pendente_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_compra_pendente_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_compra_pendente_item_5` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_pendente_item`
--

LOCK TABLES `compra_pendente_item` WRITE;
/*!40000 ALTER TABLE `compra_pendente_item` DISABLE KEYS */;
INSERT INTO `compra_pendente_item` VALUES (4,2,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',100.00,18.0000,18.00,0.00,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,56),(21,16,1,1,NULL,1102,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',100.00,18.0000,18.00,0.00,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,56);
/*!40000 ALTER TABLE `compra_pendente_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromisso`
--

DROP TABLE IF EXISTS `compromisso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisso` (
  `compromisso_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  `data_hora_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `concluido` tinyint(1) NOT NULL DEFAULT '0',
  `tarefa_id` int(11) DEFAULT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`compromisso_id`),
  UNIQUE KEY `uk_compromisso_1` (`tarefa_id`),
  KEY `k_compromisso_1` (`usuario_id`),
  CONSTRAINT `fk_compromisso_1` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso`
--

LOCK TABLES `compromisso` WRITE;
/*!40000 ALTER TABLE `compromisso` DISABLE KEYS */;
/*!40000 ALTER TABLE `compromisso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromisso_notificacao`
--

DROP TABLE IF EXISTS `compromisso_notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisso_notificacao` (
  `compromisso_notificacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `compromisso_id` int(11) NOT NULL DEFAULT '0',
  `job_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `tempo` int(3) NOT NULL DEFAULT '0',
  `metrica` int(1) NOT NULL DEFAULT '0',
  `destino` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`compromisso_notificacao_id`),
  KEY `k_compromisso_notificacao_1` (`compromisso_id`),
  CONSTRAINT `fk_compromisso_notificacao_1` FOREIGN KEY (`compromisso_id`) REFERENCES `compromisso` (`compromisso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso_notificacao`
--

LOCK TABLES `compromisso_notificacao` WRITE;
/*!40000 ALTER TABLE `compromisso_notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `compromisso_notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao`
--

DROP TABLE IF EXISTS `configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracao` (
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `regime_tributario` int(1) NOT NULL DEFAULT '0',
  `regime_tributario_especial` int(1) NOT NULL DEFAULT '0',
  `incentivo_fiscal` tinyint(1) NOT NULL DEFAULT '0',
  `certificado_a1` varchar(150) NOT NULL DEFAULT '',
  `certificado_a1_senha` varchar(100) NOT NULL DEFAULT '',
  `salario_minimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cliente_contrato_conta_id` int(11) DEFAULT NULL,
  `cliente_contrato_categoria_id` int(11) DEFAULT NULL,
  `importacao_retorno_forma_pagamento_id` int(11) DEFAULT NULL,
  `juros_diario` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `juros_carencia` int(4) NOT NULL DEFAULT '0',
  `juros_calculo` int(1) NOT NULL DEFAULT '0',
  `multa` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `multa_carencia` int(4) NOT NULL DEFAULT '0',
  `crm_dias_reserva_conta` int(3) NOT NULL DEFAULT '0',
  `crm_pipeline_periodo` int(1) NOT NULL DEFAULT '0',
  `crm_pipeline_multiplicador_meta` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `crm_pipeline_fase_inicial` int(11) NOT NULL DEFAULT '0',
  `crm_pipeline_temperatura_inicial` int(2) NOT NULL DEFAULT '0',
  `faturamento_operacao_id` int(11) DEFAULT NULL,
  `nfse_gateway` int(1) NOT NULL DEFAULT '0',
  `nfse_numero_lote` int(11) NOT NULL DEFAULT '0',
  `orcamento_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `pedido_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `venda_operacao_id` int(11) DEFAULT NULL,
  `venda_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `nfce_csc_token` varchar(50) NOT NULL DEFAULT '',
  `nfce_csc_id` varchar(20) NOT NULL DEFAULT '',
  `ordem_servico_modelo` int(1) NOT NULL DEFAULT '0',
  `conta_corrente_conta_contabil_id` int(11) DEFAULT NULL,
  `inventario_conta_contabil_id` int(11) DEFAULT NULL,
  `integracao_contabil_layout` int(2) NOT NULL DEFAULT '0',
  `integracao_contabil_dia_envio` int(2) NOT NULL DEFAULT '0',
  `integracao_contabil_bloqueia_lancamento` tinyint(1) NOT NULL DEFAULT '0',
  `sintegra_responsavel_nome` varchar(50) NOT NULL DEFAULT '',
  `pdv_venda_operacao_id` int(11) DEFAULT NULL,
  `pdv_sangria_categoria_id` int(11) DEFAULT NULL,
  `pdv_suprimento_categoria_id` int(11) DEFAULT NULL,
  `plugnotas_certificado_a1_id` varchar(36) NOT NULL DEFAULT '',
  `servicedesk_clientes` int(1) NOT NULL DEFAULT '0',
  `cadastro_cliente_obrigatorio_cpf` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_cliente_obrigatorio_rg` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_cliente_obrigatorio_cnpj` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_cliente_obrigatorio_ie` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_fornecedor_obrigatorio_cpf` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_fornecedor_obrigatorio_rg` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_fornecedor_obrigatorio_cnpj` tinyint(1) NOT NULL DEFAULT '0',
  `cadastro_fornecedor_obrigatorio_ie` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`empresa_id`),
  KEY `k_configuracao_2` (`cliente_contrato_conta_id`),
  KEY `k_configuracao_3` (`cliente_contrato_categoria_id`),
  KEY `k_configuracao_4` (`importacao_retorno_forma_pagamento_id`),
  KEY `k_configuracao_5` (`faturamento_operacao_id`),
  KEY `k_configuracao_6` (`venda_operacao_id`),
  KEY `k_configuracao_7` (`conta_corrente_conta_contabil_id`),
  KEY `k_configuracao_8` (`inventario_conta_contabil_id`),
  KEY `k_configuracao_9` (`pdv_venda_operacao_id`),
  KEY `k_configuracao_10` (`pdv_sangria_categoria_id`),
  KEY `k_configuracao_11` (`pdv_suprimento_categoria_id`),
  CONSTRAINT `fk_configuracao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_configuracao_10` FOREIGN KEY (`pdv_sangria_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_11` FOREIGN KEY (`pdv_suprimento_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_2` FOREIGN KEY (`cliente_contrato_conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_configuracao_3` FOREIGN KEY (`cliente_contrato_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_4` FOREIGN KEY (`importacao_retorno_forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_configuracao_5` FOREIGN KEY (`faturamento_operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_configuracao_6` FOREIGN KEY (`venda_operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_configuracao_7` FOREIGN KEY (`conta_corrente_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_8` FOREIGN KEY (`inventario_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_9` FOREIGN KEY (`pdv_venda_operacao_id`) REFERENCES `operacao` (`operacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao`
--

LOCK TABLES `configuracao` WRITE;
/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
INSERT INTO `configuracao` VALUES (3,1,6,0,'','',1045.00,1,96,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,5,0,0,0,0,8,0,'0123456789','1',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,'',1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `configuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `conta_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `codigo_interno` int(11) DEFAULT NULL,
  `instituicao_financeira_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_inicial` decimal(15,2) NOT NULL DEFAULT '0.00',
  `data_saldo_inicial` date NOT NULL DEFAULT '0001-01-01',
  `numero_agencia` varchar(20) NOT NULL DEFAULT '',
  `numero_conta` varchar(20) NOT NULL DEFAULT '',
  `numero_operacao` char(3) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_id`),
  UNIQUE KEY `uk_conta_1` (`empresa_id`,`codigo_interno`),
  KEY `k_conta_1` (`empresa_id`),
  KEY `k_conta_2` (`instituicao_financeira_id`),
  KEY `k_conta_3` (`conta_contabil_id`),
  CONSTRAINT `fk_conta_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_conta_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,3,1,0,'Caixa interno',1,-340.00,0.00,'2022-10-18','','','',NULL,1,0),(2,3,NULL,0,'Caixa',1,203230.02,0.00,'2022-10-18','','','',NULL,1,0);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_boleto`
--

DROP TABLE IF EXISTS `conta_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_boleto` (
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `carteira` varchar(20) NOT NULL DEFAULT '',
  `variacao_carteira` varchar(20) NOT NULL DEFAULT '',
  `tipo_carteira` int(1) NOT NULL DEFAULT '0',
  `forma_cadastramento` int(1) NOT NULL DEFAULT '0',
  `impressao` int(1) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `distribuicao` int(1) NOT NULL DEFAULT '0',
  `local_pagamento` varchar(200) NOT NULL DEFAULT '',
  `mensagem` varchar(200) NOT NULL DEFAULT '',
  `nosso_numero` varchar(20) NOT NULL DEFAULT '',
  `layout_remessa` int(1) NOT NULL DEFAULT '0',
  `codigo_cedente` varchar(20) NOT NULL DEFAULT '',
  `cpf_cnpj_cedente` varchar(20) NOT NULL DEFAULT '',
  `nome_razao_social_cedente` varchar(100) NOT NULL DEFAULT '',
  `especie` int(1) NOT NULL DEFAULT '0',
  `aceite` tinyint(1) NOT NULL DEFAULT '0',
  `juros_diario` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `juros_carencia` int(4) NOT NULL DEFAULT '0',
  `multa` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `multa_carencia` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_id`),
  CONSTRAINT `fk_conta_boleto_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_boleto`
--

LOCK TABLES `conta_boleto` WRITE;
/*!40000 ALTER TABLE `conta_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_cartao`
--

DROP TABLE IF EXISTS `conta_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_cartao` (
  `conta_cartao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `adquirente_id` int(11) NOT NULL DEFAULT '0',
  `bandeira_id` int(11) NOT NULL DEFAULT '0',
  `emissor_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `taxa` decimal(6,2) NOT NULL DEFAULT '0.00',
  `vencimento` int(2) NOT NULL DEFAULT '0',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_cartao_id`),
  UNIQUE KEY `uk_conta_cartao_1` (`empresa_id`,`adquirente_id`,`bandeira_id`),
  KEY `k_conta_cartao_1` (`empresa_id`),
  KEY `k_conta_cartao_2` (`adquirente_id`),
  KEY `k_conta_cartao_3` (`bandeira_id`),
  KEY `k_conta_cartao_4` (`emissor_id`),
  KEY `k_conta_cartao_5` (`conta_id`),
  CONSTRAINT `fk_conta_cartao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_conta_cartao_5` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_cartao`
--

LOCK TABLES `conta_cartao` WRITE;
/*!40000 ALTER TABLE `conta_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_cartao_saldo`
--

DROP TABLE IF EXISTS `conta_cartao_saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_cartao_saldo` (
  `conta_cartao_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`conta_cartao_id`,`data`),
  KEY `k_conta_cartao_saldo_1` (`conta_cartao_id`),
  KEY `k_conta_cartao_saldo_2` (`data`),
  CONSTRAINT `fk_conta_cartao_saldo_1` FOREIGN KEY (`conta_cartao_id`) REFERENCES `conta_cartao` (`conta_cartao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_cartao_saldo`
--

LOCK TABLES `conta_cartao_saldo` WRITE;
/*!40000 ALTER TABLE `conta_cartao_saldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_cartao_saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_contabil`
--

DROP TABLE IF EXISTS `conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_contabil` (
  `conta_contabil_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `codigo` varchar(30) NOT NULL DEFAULT '',
  `codigo_reduzido` int(6) NOT NULL DEFAULT '0',
  `codigo_rfb` varchar(30) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `natureza` int(1) NOT NULL DEFAULT '0',
  `grupo` int(1) NOT NULL DEFAULT '0',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_contabil_id`),
  UNIQUE KEY `uk_conta_contabil_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contabil`
--

LOCK TABLES `conta_contabil` WRITE;
/*!40000 ALTER TABLE `conta_contabil` DISABLE KEYS */;
INSERT INTO `conta_contabil` VALUES (1,1,'1',1,'','ATIVO',2,1,'S',1),(2,2,'1.1',2,'','CIRCULANTE',2,1,'S',2),(3,3,'1.1.1',3,'','DISPONIVEL',2,1,'S',3),(4,4,'1.1.1.001',4,'','Contas correntes',2,1,'A',4),(5,5,'1.1.2',5,'','CONTAS A RECEBER',2,1,'S',3),(6,6,'1.1.2.001',6,'','Clientes',2,1,'A',4),(7,7,'1.1.2.002',7,'','Outras contas a receber',2,1,'A',4),(8,8,'1.1.3',8,'','ESTOQUE',2,1,'S',3),(9,9,'1.1.3.001',9,'','Estoque de produtos',2,1,'A',4),(10,10,'1.2',10,'','NÃO CIRCULANTE',2,1,'S',2),(11,11,'1.2.1',11,'','INVESTIMENTOS',2,1,'S',3),(12,12,'1.2.1.001',12,'','Rentáveis',2,1,'A',4),(13,13,'1.2.1.002',13,'','Imobilizado',2,1,'A',4),(14,14,'1.2.1.003',14,'','Intangível',2,1,'A',4),(15,15,'2',15,'','PASSIVO',1,2,'S',1),(16,16,'2.1',16,'','CIRCULANTE',1,2,'S',2),(17,17,'2.1.1',17,'','CONTAS A PAGAR',1,2,'S',3),(18,18,'2.1.1.001',18,'','Fornecedores',1,2,'A',4),(19,19,'2.1.1.002',19,'','Empréstimos',1,2,'A',4),(20,20,'2.1.1.003',20,'','(-) Juros de empréstimos',2,2,'A',4),(21,21,'2.1.1.004',21,'','Outras contas a pagar',1,2,'A',4),(22,22,'3',22,'','PATRIMÔNIO LÍQUIDO',1,3,'S',1),(23,23,'3.1',23,'','CAPITAL',1,3,'S',2),(24,24,'3.1.1',24,'','CAPITAL SOCIAL',1,3,'S',3),(25,25,'3.1.1.001',25,'','Capital integralizado',1,3,'A',4),(26,26,'3.1.1.002',26,'','Integralização de capital de outras empresas',1,3,'A',4),(27,27,'3.1.1.003',27,'','(-) Desintegralização de capital para outras empresas',2,3,'A',4),(28,28,'3.1.2',28,'','LUCROS E PREJUÍZOS',1,3,'S',3),(29,29,'3.1.2.001',29,'','Lucros e prejuizos acumulados',1,3,'A',4),(30,30,'3.1.2.002',30,'','Terceiros',1,3,'A',4),(31,31,'4',31,'','RECEITAS',1,4,'S',1),(32,32,'4.1',32,'','RECEITAS OPERACIONAIS',1,4,'S',2),(33,33,'4.1.1',33,'','RECEITAS COM VENDAS',1,4,'S',3),(34,34,'4.1.1.001',34,'','Receitas com vendas de produtos',1,4,'A',4),(35,35,'4.1.1.002',35,'','Receitas com vendas de serviços',1,4,'A',4),(36,36,'4.1.1.003',36,'','Receitas com recebimentos de vendas de produtos',1,4,'A',4),(37,37,'4.1.1.004',37,'','Receitas com recebimentos de vendas de serviços',1,4,'A',4),(38,38,'4.1.1.005',38,'','(-) Devoluções de vendas de produtos',2,4,'A',4),(39,39,'4.1.1.006',39,'','(-) Devoluções de vendas de serviços',2,4,'A',4),(40,40,'4.1.2',40,'','RECEITAS COM RECORRÊNCIAS',1,4,'S',3),(41,41,'4.1.2.001',41,'','Receitas com recorrências de serviços',1,4,'A',4),(42,42,'4.1.2.002',42,'','Receitas com recebimentos de recorrências',1,4,'A',4),(43,43,'4.2',43,'','RECEITAS NÃO OPERACIONAIS',1,4,'S',2),(44,44,'4.2.1',44,'','RECEITAS DIVERSAS',1,4,'S',3),(45,45,'4.2.1.001',45,'','Receitas com integralização de capital',1,4,'A',4),(46,46,'4.2.1.002',46,'','Receitas com vendas de imobilizados',1,4,'A',4),(47,47,'4.2.1.003',47,'','Receitas com investimentos',1,4,'A',4),(48,48,'4.2.1.004',48,'','Receitas com reembolsos',1,4,'A',4),(49,49,'4.2.1.005',49,'','Receitas com descontos recebidos',1,4,'A',4),(50,50,'4.2.1.006',50,'','Receitas com acréscimos recebidos',1,4,'A',4),(51,51,'4.2.1.007',51,'','Receitas de terceiros',1,4,'A',4),(52,52,'4.2.1.008',52,'','Outras receitas',1,4,'A',4),(53,53,'5',53,'','CUSTOS E DESPESAS',2,4,'S',1),(54,54,'5.1',54,'','CUSTOS',2,4,'S',2),(55,55,'5.1.1',55,'','CUSTOS DE VENDAS',2,4,'S',3),(56,56,'5.1.1.001',56,'','Custos de vendas de produtos (CMV)',2,4,'A',4),(57,57,'5.1.2',57,'','CUSTOS DE INVESTIMENTOS',2,4,'S',3),(58,58,'5.1.2.001',58,'','Custos com investimentos rentáveis',2,4,'A',4),(59,59,'5.1.2.002',59,'','Custos com investimentos imobilizado',2,4,'A',4),(60,60,'5.1.2.003',60,'','Custos com investimentos intangíveis',2,4,'A',4),(61,61,'5.2',61,'','DESPESAS',2,4,'S',2),(62,62,'5.2.1',62,'','DESPESAS OPERACIONAIS',2,4,'S',3),(63,63,'5.2.1.001',63,'','Despesas administrativas',2,4,'A',4),(64,64,'5.2.1.002',64,'','Despesas comerciais',2,4,'A',4),(65,65,'5.2.1.003',65,'','Despesas financeiras',2,4,'A',4),(66,66,'5.2.1.004',66,'','Despesas tributárias',2,4,'A',4),(67,67,'5.2.1.005',67,'','Despesas com marketing',2,4,'A',4),(68,68,'5.2.1.006',68,'','Despesas com colaboradores',2,4,'A',4),(69,69,'5.2.1.007',69,'','Despesas com sócios',2,4,'A',4),(70,70,'5.2.2',70,'','DESPESAS NÃO OPERACIONAIS',2,4,'S',3),(71,71,'5.2.2.001',71,'','Despesas com descontos concedidos',2,4,'A',4),(72,72,'5.2.2.002',72,'','Despesas com acréscimos pagos',2,4,'A',4),(73,73,'5.2.2.003',73,'','Despesas de terceiros',2,4,'A',4),(74,74,'5.2.2.004',74,'','Outras despesas',2,4,'A',4),(75,75,'6',75,'','RESULTADO',1,4,'S',1),(76,76,'6.1',76,'','APURAÇÃO',1,4,'S',2),(77,77,'6.1.1',77,'','APURAÇÃO DE RESULTADO',1,4,'S',3),(78,78,'6.1.1.001',78,'','Resultado do exercício',1,4,'A',4);
/*!40000 ALTER TABLE `conta_contabil` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_conta_contabil before insert on conta_contabil for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo';
	end if;
	if new.codigo_reduzido <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_reduzido';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nome';
	end if;
	if new.natureza not in (1,2) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.natureza';
	end if;
	if new.grupo not in (1,2,3,4) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.grupo';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_conta_contabil before update on conta_contabil for each row
begin
	if new.codigo = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo';
	end if;
	if new.codigo_reduzido <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_reduzido';
	end if;
	if new.nome = '' then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nome';
	end if;
	if new.natureza not in (1,2) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.natureza';
	end if;
	if new.grupo not in (1,2,3,4) then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.grupo';
	end if;
	if new.analitica_sintetica not in ('a','s') then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
	end if;
	if new.nivel <= 0 then
		signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conta_contabil_empresa`
--

DROP TABLE IF EXISTS `conta_contabil_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_contabil_empresa` (
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_integracao` varchar(30) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_contabil_id`,`empresa_id`),
  KEY `k_conta_contabil_empresa_1` (`conta_contabil_id`),
  KEY `k_conta_contabil_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_conta_contabil_empresa_1` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_conta_contabil_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contabil_empresa`
--

LOCK TABLES `conta_contabil_empresa` WRITE;
/*!40000 ALTER TABLE `conta_contabil_empresa` DISABLE KEYS */;
INSERT INTO `conta_contabil_empresa` VALUES (1,3,'',1,0),(2,3,'',1,0),(3,3,'',1,0),(4,3,'',1,0),(5,3,'',1,0),(6,3,'',1,0),(7,3,'',1,0),(8,3,'',1,0),(9,3,'',1,0),(10,3,'',1,0),(11,3,'',1,0),(12,3,'',1,0),(13,3,'',1,0),(14,3,'',1,0),(15,3,'',1,0),(16,3,'',1,0),(17,3,'',1,0),(18,3,'',1,0),(19,3,'',1,0),(20,3,'',1,0),(21,3,'',1,0),(22,3,'',1,0),(23,3,'',1,0),(24,3,'',1,0),(25,3,'',1,0),(26,3,'',1,0),(27,3,'',1,0),(28,3,'',1,0),(29,3,'',1,0),(30,3,'',1,0),(31,3,'',1,0),(32,3,'',1,0),(33,3,'',1,0),(34,3,'',1,0),(35,3,'',1,0),(36,3,'',1,0),(37,3,'',1,0),(38,3,'',1,0),(39,3,'',1,0),(40,3,'',1,0),(41,3,'',1,0),(42,3,'',1,0),(43,3,'',1,0),(44,3,'',1,0),(45,3,'',1,0),(46,3,'',1,0),(47,3,'',1,0),(48,3,'',1,0),(49,3,'',1,0),(50,3,'',1,0),(51,3,'',1,0),(52,3,'',1,0),(53,3,'',1,0),(54,3,'',1,0),(55,3,'',1,0),(56,3,'',1,0),(57,3,'',1,0),(58,3,'',1,0),(59,3,'',1,0),(60,3,'',1,0),(61,3,'',1,0),(62,3,'',1,0),(63,3,'',1,0),(64,3,'',1,0),(65,3,'',1,0),(66,3,'',1,0),(67,3,'',1,0),(68,3,'',1,0),(69,3,'',1,0),(70,3,'',1,0),(71,3,'',1,0),(72,3,'',1,0),(73,3,'',1,0),(74,3,'',1,0),(75,3,'',1,0),(76,3,'',1,0),(77,3,'',1,0),(78,3,'',1,0),(79,3,'',1,0),(80,3,'',1,0),(81,3,'',1,0),(82,3,'',1,0),(83,3,'',1,0),(84,3,'',1,0),(85,3,'',1,0),(86,3,'',1,0),(87,3,'',1,0),(88,3,'',1,0),(89,3,'',1,0),(90,3,'',1,0),(91,3,'',1,0),(92,3,'',1,0),(93,3,'',1,0),(94,3,'',1,0),(95,3,'',1,0),(96,3,'',1,0),(97,3,'',1,0),(98,3,'',1,0),(99,3,'',1,0),(100,3,'',1,0),(101,3,'',1,0),(102,3,'',1,0),(103,3,'',1,0),(104,3,'',1,0),(105,3,'',1,0),(106,3,'',1,0),(107,3,'',1,0),(108,3,'',1,0),(109,3,'',1,0),(110,3,'',1,0),(111,3,'',1,0),(112,3,'',1,0),(113,3,'',1,0),(114,3,'',1,0),(115,3,'',1,0),(116,3,'',1,0),(117,3,'',1,0),(118,3,'',1,0),(119,3,'',1,0),(120,3,'',1,0),(121,3,'',1,0),(122,3,'',1,0),(123,3,'',1,0),(124,3,'',1,0),(125,3,'',1,0),(126,3,'',1,0),(127,3,'',1,0),(128,3,'',1,0),(129,3,'',1,0),(130,3,'',1,0),(131,3,'',1,0),(132,3,'',1,0),(133,3,'',1,0),(134,3,'',1,0),(135,3,'',1,0),(136,3,'',1,0),(137,3,'',1,0),(138,3,'',1,0),(139,3,'',1,0),(140,3,'',1,0),(141,3,'',1,0),(142,3,'',1,0),(143,3,'',1,0),(144,3,'',1,0),(145,3,'',1,0),(146,3,'',1,0),(147,3,'',1,0),(148,3,'',1,0),(149,3,'',1,0),(150,3,'',1,0),(151,3,'',1,0),(152,3,'',1,0),(153,3,'',1,0),(154,3,'',1,0),(155,3,'',1,0),(156,3,'',1,0),(157,3,'',1,0),(158,3,'',1,0),(159,3,'',1,0),(160,3,'',1,0),(161,3,'',1,0),(162,3,'',1,0),(163,3,'',1,0),(164,3,'',1,0),(165,3,'',1,0),(166,3,'',1,0),(167,3,'',1,0),(168,3,'',1,0),(169,3,'',1,0),(170,3,'',1,0),(171,3,'',1,0),(172,3,'',1,0),(173,3,'',1,0),(174,3,'',1,0),(175,3,'',1,0),(176,3,'',1,0),(177,3,'',1,0),(178,3,'',1,0),(179,3,'',1,0),(180,3,'',1,0),(181,3,'',1,0),(182,3,'',1,0),(183,3,'',1,0),(184,3,'',1,0),(185,3,'',1,0),(186,3,'',1,0),(187,3,'',1,0),(188,3,'',1,0),(189,3,'',1,0),(190,3,'',1,0),(191,3,'',1,0),(192,3,'',1,0),(193,3,'',1,0),(194,3,'',1,0),(195,3,'',1,0),(196,3,'',1,0),(197,3,'',1,0),(198,3,'',1,0),(199,3,'',1,0),(200,3,'',1,0),(201,3,'',1,0),(202,3,'',1,0),(203,3,'',1,0),(204,3,'',1,0),(205,3,'',1,0),(206,3,'',1,0),(207,3,'',1,0),(208,3,'',1,0),(209,3,'',1,0),(210,3,'',1,0),(211,3,'',1,0),(212,3,'',1,0),(213,3,'',1,0),(214,3,'',1,0),(215,3,'',1,0),(216,3,'',1,0),(217,3,'',1,0),(218,3,'',1,0);
/*!40000 ALTER TABLE `conta_contabil_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_contabil_saldo`
--

DROP TABLE IF EXISTS `conta_contabil_saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_contabil_saldo` (
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_contabil_id`,`empresa_id`,`mes`,`regime`),
  KEY `k_conta_contabil_saldo_1` (`conta_contabil_id`),
  KEY `k_conta_contabil_saldo_2` (`empresa_id`),
  CONSTRAINT `fk_conta_contabil_saldo_1` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_conta_contabil_saldo_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contabil_saldo`
--

LOCK TABLES `conta_contabil_saldo` WRITE;
/*!40000 ALTER TABLE `conta_contabil_saldo` DISABLE KEYS */;
INSERT INTO `conta_contabil_saldo` VALUES (4,3,'202210',-90.00,1),(4,3,'202210',203349.52,2),(6,3,'202210',135.44,2),(7,3,'202210',170.50,2),(9,3,'202210',1390.00,1),(9,3,'202210',-709.50,2),(18,3,'202210',1300.00,1),(18,3,'202210',-700.00,2),(21,3,'202210',10.00,2),(29,3,'202210',203074.96,2),(30,3,'202210',170.50,2),(34,3,'202210',203160.02,1),(34,3,'202210',203295.46,2),(38,3,'202210',-10.50,1),(38,3,'202210',-10.50,2),(49,3,'202210',200.00,1),(49,3,'202210',200.00,2),(51,3,'202210',170.50,2),(56,3,'202210',290.00,1),(56,3,'202210',209.50,2),(63,3,'202210',10.00,2),(72,3,'202210',200.00,1),(72,3,'202210',200.00,2),(78,3,'202210',203259.52,1),(78,3,'202210',203245.46,2);
/*!40000 ALTER TABLE `conta_contabil_saldo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_conta_contabil_saldo before insert on conta_contabil_saldo for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.mes';
    end if;
    if new.regime not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.regime';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_conta_contabil_saldo before update on conta_contabil_saldo for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.mes';
    end if;
    if new.regime not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil_saldo.regime';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conta_saldo`
--

DROP TABLE IF EXISTS `conta_saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_saldo` (
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`conta_id`,`data`),
  KEY `k_conta_saldo_1` (`conta_id`),
  KEY `k_conta_saldo_2` (`data`),
  CONSTRAINT `fk_conta_saldo_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_saldo`
--

LOCK TABLES `conta_saldo` WRITE;
/*!40000 ALTER TABLE `conta_saldo` DISABLE KEYS */;
INSERT INTO `conta_saldo` VALUES (1,'2022-10-19',-340.00),(2,'2022-10-18',0.00),(2,'2022-10-19',203230.02);
/*!40000 ALTER TABLE `conta_saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte`
--

DROP TABLE IF EXISTS `cte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte` (
  `cte_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `cfop` int(4) NOT NULL DEFAULT '0',
  `modelo` int(2) NOT NULL DEFAULT '0',
  `serie` int(3) NOT NULL DEFAULT '0',
  `data_hora_emissao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_prestacao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `modal` int(1) NOT NULL DEFAULT '0',
  `tipo_servico` int(1) NOT NULL DEFAULT '0',
  `emitente` int(1) NOT NULL DEFAULT '0',
  `inicio_codigo_municipio` varchar(7) NOT NULL DEFAULT '',
  `inicio_municipio` varchar(50) NOT NULL DEFAULT '',
  `inicio_uf` char(2) NOT NULL DEFAULT '',
  `fim_codigo_municipio` varchar(7) NOT NULL DEFAULT '',
  `fim_municipio` varchar(50) NOT NULL DEFAULT '',
  `fim_uf` char(2) NOT NULL DEFAULT '',
  `tipo_tomador` int(1) NOT NULL DEFAULT '0',
  `tomador_id` int(11) DEFAULT NULL,
  `remetente_id` int(11) DEFAULT NULL,
  `expedidor_id` int(11) DEFAULT NULL,
  `recebedor_id` int(11) DEFAULT NULL,
  `destinatario_emitente_id` int(11) DEFAULT NULL,
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_receber` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `reducao_base_calculo_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_carga` decimal(15,2) NOT NULL DEFAULT '0.00',
  `produto_predominante` varchar(100) NOT NULL DEFAULT '',
  `caracteristicas_carga` varchar(50) NOT NULL DEFAULT '',
  `fatura_numero` varchar(60) NOT NULL DEFAULT '',
  `fatura_valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fatura_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `protocolo` varchar(15) NOT NULL DEFAULT '',
  `recibo` varchar(15) NOT NULL DEFAULT '',
  `url_xml` varchar(500) NOT NULL DEFAULT '',
  `url_xml_cancelamento` varchar(500) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  `observacao_fisco` text NOT NULL,
  `conta_contabil_id` int(11) DEFAULT NULL,
  `emitido` tinyint(1) NOT NULL DEFAULT '0',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cte_id`),
  KEY `k_cte_1` (`empresa_id`),
  KEY `k_cte_2` (`tomador_id`),
  KEY `k_cte_3` (`remetente_id`),
  KEY `k_cte_4` (`expedidor_id`),
  KEY `k_cte_5` (`recebedor_id`),
  KEY `k_cte_6` (`destinatario_emitente_id`),
  KEY `k_cte_7` (`conta_contabil_id`),
  CONSTRAINT `fk_cte_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_cte_2` FOREIGN KEY (`tomador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cte_3` FOREIGN KEY (`remetente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cte_4` FOREIGN KEY (`expedidor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cte_5` FOREIGN KEY (`recebedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cte_6` FOREIGN KEY (`destinatario_emitente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_cte_7` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte`
--

LOCK TABLES `cte` WRITE;
/*!40000 ALTER TABLE `cte` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_carga`
--

DROP TABLE IF EXISTS `cte_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_carga` (
  `cte_carga_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_id` int(11) NOT NULL DEFAULT '0',
  `unidade_medida` int(1) NOT NULL DEFAULT '0',
  `tipo_medida` varchar(30) NOT NULL DEFAULT '',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`cte_carga_id`),
  KEY `k_cte_carga_1` (`cte_id`),
  CONSTRAINT `fk_cte_carga_1` FOREIGN KEY (`cte_id`) REFERENCES `cte` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_carga`
--

LOCK TABLES `cte_carga` WRITE;
/*!40000 ALTER TABLE `cte_carga` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_carga_unidade`
--

DROP TABLE IF EXISTS `cte_carga_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_carga_unidade` (
  `cte_carga_unidade_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_documento_id` int(11) NOT NULL DEFAULT '0',
  `cte_transporte_unidade_id` int(11) DEFAULT NULL,
  `tipo_unidade_carga` int(1) NOT NULL DEFAULT '0',
  `identificacao` varchar(20) NOT NULL DEFAULT '',
  `quantidade_rateada` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`cte_carga_unidade_id`),
  KEY `k_cte_carga_unidade_1` (`cte_documento_id`),
  KEY `k_cte_carga_unidade_2` (`cte_transporte_unidade_id`),
  CONSTRAINT `fk_cte_carga_unidade_1` FOREIGN KEY (`cte_documento_id`) REFERENCES `cte_documento` (`cte_documento_id`),
  CONSTRAINT `fk_cte_carga_unidade_2` FOREIGN KEY (`cte_transporte_unidade_id`) REFERENCES `cte_transporte_unidade` (`cte_transporte_unidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_carga_unidade`
--

LOCK TABLES `cte_carga_unidade` WRITE;
/*!40000 ALTER TABLE `cte_carga_unidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_carga_unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_carga_unidade_lacre`
--

DROP TABLE IF EXISTS `cte_carga_unidade_lacre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_carga_unidade_lacre` (
  `cte_carga_unidade_lacre_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_carga_unidade_id` int(11) NOT NULL DEFAULT '0',
  `numero` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`cte_carga_unidade_lacre_id`),
  KEY `k_cte_carga_unidade_lacre_1` (`cte_carga_unidade_id`),
  CONSTRAINT `fk_cte_carga_unidade_lacre_1` FOREIGN KEY (`cte_carga_unidade_id`) REFERENCES `cte_carga_unidade` (`cte_carga_unidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_carga_unidade_lacre`
--

LOCK TABLES `cte_carga_unidade_lacre` WRITE;
/*!40000 ALTER TABLE `cte_carga_unidade_lacre` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_carga_unidade_lacre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_documento`
--

DROP TABLE IF EXISTS `cte_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_documento` (
  `cte_documento_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_id` int(11) NOT NULL DEFAULT '0',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `pin_suframa` varchar(9) NOT NULL DEFAULT '',
  `data_prevista_entrega` date NOT NULL DEFAULT '0001-01-01',
  `romaneio` varchar(20) NOT NULL DEFAULT '',
  `pedido` varchar(20) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL DEFAULT '0',
  `modelo` int(2) NOT NULL DEFAULT '0',
  `serie` int(3) NOT NULL DEFAULT '0',
  `data_emissao` date NOT NULL DEFAULT '0001-01-01',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_produtos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cfop` int(4) NOT NULL DEFAULT '0',
  `peso` decimal(15,2) NOT NULL DEFAULT '0.00',
  `descricao` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`cte_documento_id`),
  KEY `k_cte_documento_1` (`cte_id`),
  CONSTRAINT `fk_cte_documento_1` FOREIGN KEY (`cte_id`) REFERENCES `cte` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_documento`
--

LOCK TABLES `cte_documento` WRITE;
/*!40000 ALTER TABLE `cte_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_documento_transporte_anterior`
--

DROP TABLE IF EXISTS `cte_documento_transporte_anterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_documento_transporte_anterior` (
  `cte_documento_transporte_anterior_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_id` int(11) NOT NULL DEFAULT '0',
  `cnpj` varchar(14) NOT NULL DEFAULT '',
  `inscricao_estadual` varchar(20) NOT NULL DEFAULT '',
  `razao_social` varchar(100) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  PRIMARY KEY (`cte_documento_transporte_anterior_id`),
  KEY `k_cte_documento_transporte_anterior_1` (`cte_id`),
  CONSTRAINT `fk_cte_documento_transporte_anterior_1` FOREIGN KEY (`cte_id`) REFERENCES `cte` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_documento_transporte_anterior`
--

LOCK TABLES `cte_documento_transporte_anterior` WRITE;
/*!40000 ALTER TABLE `cte_documento_transporte_anterior` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_documento_transporte_anterior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_duplicata`
--

DROP TABLE IF EXISTS `cte_duplicata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_duplicata` (
  `cte_duplicata_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_id` int(11) NOT NULL DEFAULT '0',
  `numero` varchar(60) NOT NULL DEFAULT '',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`cte_duplicata_id`),
  KEY `k_cte_duplicata_1` (`cte_id`),
  CONSTRAINT `fk_cte_duplicata_1` FOREIGN KEY (`cte_id`) REFERENCES `cte` (`cte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_duplicata`
--

LOCK TABLES `cte_duplicata` WRITE;
/*!40000 ALTER TABLE `cte_duplicata` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_duplicata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_transporte_unidade`
--

DROP TABLE IF EXISTS `cte_transporte_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_transporte_unidade` (
  `cte_transporte_unidade_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_documento_id` int(11) NOT NULL DEFAULT '0',
  `tipo_unidade_transporte` int(1) NOT NULL DEFAULT '0',
  `identificacao` varchar(20) NOT NULL DEFAULT '',
  `quantidade_rateada` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`cte_transporte_unidade_id`),
  KEY `k_cte_transporte_unidade_1` (`cte_documento_id`),
  CONSTRAINT `fk_cte_transporte_unidade_1` FOREIGN KEY (`cte_documento_id`) REFERENCES `cte_documento` (`cte_documento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_transporte_unidade`
--

LOCK TABLES `cte_transporte_unidade` WRITE;
/*!40000 ALTER TABLE `cte_transporte_unidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_transporte_unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cte_transporte_unidade_lacre`
--

DROP TABLE IF EXISTS `cte_transporte_unidade_lacre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cte_transporte_unidade_lacre` (
  `cte_transporte_unidade_lacre_id` int(11) NOT NULL AUTO_INCREMENT,
  `cte_transporte_unidade_id` int(11) NOT NULL DEFAULT '0',
  `numero` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`cte_transporte_unidade_lacre_id`),
  KEY `k_cte_transporte_unidade_lacre_1` (`cte_transporte_unidade_id`),
  CONSTRAINT `fk_cte_transporte_unidade_lacre_1` FOREIGN KEY (`cte_transporte_unidade_id`) REFERENCES `cte_transporte_unidade` (`cte_transporte_unidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte_transporte_unidade_lacre`
--

LOCK TABLES `cte_transporte_unidade_lacre` WRITE;
/*!40000 ALTER TABLE `cte_transporte_unidade_lacre` DISABLE KEYS */;
/*!40000 ALTER TABLE `cte_transporte_unidade_lacre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `departamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `gerente_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departamento_id`),
  KEY `k_departamento_1` (`empresa_id`),
  KEY `k_departamento_2` (`gerente_id`),
  CONSTRAINT `fk_departamento_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_departamento_2` FOREIGN KEY (`gerente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento_colaborador`
--

DROP TABLE IF EXISTS `departamento_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento_colaborador` (
  `departamento_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departamento_id`,`colaborador_id`),
  KEY `k_departamento_colaborador_1` (`departamento_id`),
  KEY `k_departamento_colaborador_2` (`colaborador_id`),
  CONSTRAINT `fk_departamento_colaborador_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`),
  CONSTRAINT `fk_departamento_colaborador_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento_colaborador`
--

LOCK TABLES `departamento_colaborador` WRITE;
/*!40000 ALTER TABLE `departamento_colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao_compra`
--

DROP TABLE IF EXISTS `devolucao_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao_compra` (
  `devolucao_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `compra_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `transportador_id` int(11) DEFAULT NULL,
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_impostos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `emissao_nfe` int(1) NOT NULL DEFAULT '0',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `nfe_id` int(11) DEFAULT NULL,
  `nf_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`devolucao_compra_id`),
  KEY `k_devolucao_compra_1` (`empresa_id`),
  KEY `k_devolucao_compra_2` (`compra_id`),
  KEY `k_devolucao_compra_3` (`operacao_id`),
  KEY `k_devolucao_compra_4` (`fornecedor_id`),
  KEY `k_devolucao_compra_5` (`transportador_id`),
  KEY `k_devolucao_compra_6` (`estoque_id`),
  KEY `k_devolucao_compra_7` (`nfe_id`),
  KEY `k_devolucao_compra_8` (`nf_id`),
  CONSTRAINT `fk_devolucao_compra_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_devolucao_compra_2` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_devolucao_compra_3` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_devolucao_compra_4` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_devolucao_compra_5` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_devolucao_compra_6` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_devolucao_compra_7` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_devolucao_compra_8` FOREIGN KEY (`nf_id`) REFERENCES `nf` (`nf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_compra`
--

LOCK TABLES `devolucao_compra` WRITE;
/*!40000 ALTER TABLE `devolucao_compra` DISABLE KEYS */;
INSERT INTO `devolucao_compra` VALUES (1,3,9,'2022-10-19 08:57:29',4,3,NULL,500.00,500.00,0.00,0.00,0.00,0.00,0.00,0,1,NULL,NULL,2);
/*!40000 ALTER TABLE `devolucao_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao_compra_item`
--

DROP TABLE IF EXISTS `devolucao_compra_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao_compra_item` (
  `devolucao_compra_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `devolucao_compra_id` int(11) NOT NULL DEFAULT '0',
  `compra_item_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_impostos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `nfe_item_id` int(11) DEFAULT NULL,
  `nf_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`devolucao_compra_item_id`),
  KEY `k_devolucao_compra_item_1` (`devolucao_compra_id`),
  KEY `k_devolucao_compra_item_2` (`compra_item_id`),
  KEY `k_devolucao_compra_item_3` (`produto_id`),
  KEY `k_devolucao_compra_item_4` (`produto_grade_id`),
  KEY `k_devolucao_compra_item_5` (`produto_lote_id`),
  KEY `k_devolucao_compra_item_6` (`nfe_item_id`),
  KEY `k_devolucao_compra_item_7` (`nf_item_id`),
  CONSTRAINT `fk_devolucao_compra_item_1` FOREIGN KEY (`devolucao_compra_id`) REFERENCES `devolucao_compra` (`devolucao_compra_id`),
  CONSTRAINT `fk_devolucao_compra_item_2` FOREIGN KEY (`compra_item_id`) REFERENCES `compra_item` (`compra_item_id`),
  CONSTRAINT `fk_devolucao_compra_item_3` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_devolucao_compra_item_4` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_devolucao_compra_item_5` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_devolucao_compra_item_6` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`),
  CONSTRAINT `fk_devolucao_compra_item_7` FOREIGN KEY (`nf_item_id`) REFERENCES `nf_item` (`nf_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_compra_item`
--

LOCK TABLES `devolucao_compra_item` WRITE;
/*!40000 ALTER TABLE `devolucao_compra_item` DISABLE KEYS */;
INSERT INTO `devolucao_compra_item` VALUES (1,1,11,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL);
/*!40000 ALTER TABLE `devolucao_compra_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao_venda`
--

DROP TABLE IF EXISTS `devolucao_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao_venda` (
  `devolucao_venda_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `venda_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) DEFAULT NULL,
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `nfe_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`devolucao_venda_id`),
  KEY `k_devolucao_venda_1` (`empresa_id`),
  KEY `k_devolucao_venda_2` (`venda_id`),
  KEY `k_devolucao_venda_3` (`operacao_id`),
  KEY `k_devolucao_venda_4` (`cliente_id`),
  KEY `k_devolucao_venda_5` (`usuario_id`),
  KEY `k_devolucao_venda_6` (`estoque_id`),
  KEY `k_devolucao_venda_7` (`nfe_id`),
  CONSTRAINT `fk_devolucao_venda_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_devolucao_venda_2` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_devolucao_venda_3` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_devolucao_venda_4` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_devolucao_venda_6` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_devolucao_venda_7` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda`
--

LOCK TABLES `devolucao_venda` WRITE;
/*!40000 ALTER TABLE `devolucao_venda` DISABLE KEYS */;
INSERT INTO `devolucao_venda` VALUES (1,3,11,'2022-10-19 08:57:29',11,NULL,10.50,10.50,0.00,0.00,0.00,0.00,1,1,NULL,2);
/*!40000 ALTER TABLE `devolucao_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao_venda_item`
--

DROP TABLE IF EXISTS `devolucao_venda_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao_venda_item` (
  `devolucao_venda_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `devolucao_venda_id` int(11) NOT NULL DEFAULT '0',
  `venda_item_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `nfe_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`devolucao_venda_item_id`),
  KEY `k_devolucao_venda_item_1` (`devolucao_venda_id`),
  KEY `k_devolucao_venda_item_2` (`venda_item_id`),
  KEY `k_devolucao_venda_item_3` (`produto_id`),
  KEY `k_devolucao_venda_item_4` (`produto_grade_id`),
  KEY `k_devolucao_venda_item_5` (`produto_lote_id`),
  KEY `k_devolucao_venda_item_6` (`usuario_id`),
  KEY `k_devolucao_venda_item_7` (`nfe_item_id`),
  CONSTRAINT `fk_devolucao_venda_item_1` FOREIGN KEY (`devolucao_venda_id`) REFERENCES `devolucao_venda` (`devolucao_venda_id`),
  CONSTRAINT `fk_devolucao_venda_item_2` FOREIGN KEY (`venda_item_id`) REFERENCES `venda_item` (`venda_item_id`),
  CONSTRAINT `fk_devolucao_venda_item_3` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_devolucao_venda_item_4` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_devolucao_venda_item_5` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_devolucao_venda_item_7` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda_item`
--

LOCK TABLES `devolucao_venda_item` WRITE;
/*!40000 ALTER TABLE `devolucao_venda_item` DISABLE KEYS */;
INSERT INTO `devolucao_venda_item` VALUES (1,1,41,3,NULL,NULL,1,1.0000,2.0000,10.5000,10.50,10.50,0.00,0.00,0.00,0.00,1,NULL);
/*!40000 ALTER TABLE `devolucao_venda_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `documento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `conteudo` text NOT NULL,
  `url_modelo` varchar(500) NOT NULL DEFAULT '',
  `competencia` tinyint(1) NOT NULL DEFAULT '0',
  `formato_competencia` int(1) NOT NULL DEFAULT '0',
  `valido` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`documento_id`),
  UNIQUE KEY `uk_documento_1` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dominio`
--

DROP TABLE IF EXISTS `dominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dominio` (
  `dominio_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_id` int(11) DEFAULT NULL,
  `nfce_id` int(11) DEFAULT NULL,
  `nfse_id` int(11) DEFAULT NULL,
  `envio` varchar(50) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  `job` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dominio_id`),
  UNIQUE KEY `uk_dominio_1` (`job`),
  KEY `k_dominio_1` (`nfe_id`),
  KEY `k_dominio_2` (`nfce_id`),
  KEY `k_dominio_3` (`nfse_id`),
  CONSTRAINT `fk_dominio_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_dominio_2` FOREIGN KEY (`nfce_id`) REFERENCES `nfce` (`nfce_id`),
  CONSTRAINT `fk_dominio_3` FOREIGN KEY (`nfse_id`) REFERENCES `nfse` (`nfse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominio`
--

LOCK TABLES `dominio` WRITE;
/*!40000 ALTER TABLE `dominio` DISABLE KEYS */;
/*!40000 ALTER TABLE `dominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `razao_social` varchar(150) NOT NULL DEFAULT '',
  `nome_fantasia` varchar(150) NOT NULL DEFAULT '',
  `cnpj` varchar(14) NOT NULL DEFAULT '',
  `inscricao_estadual` varchar(20) NOT NULL DEFAULT '',
  `inscricao_municipal` varchar(20) NOT NULL DEFAULT '',
  `data_cadastro` date NOT NULL DEFAULT '0001-01-01',
  `url_logo` varchar(500) NOT NULL DEFAULT '',
  `enotas_empresa_id` varchar(36) NOT NULL DEFAULT '',
  `enotas_atualizado` tinyint(1) NOT NULL DEFAULT '0',
  `plugnotas_atualizado` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `uk_empresa_1` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2022-10-19','Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',0,0,1,0);
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
    if new.enotas_atualizado not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.enotas_atualizado';
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
    if new.enotas_atualizado not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: empresa.enotas_atualizado';
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
  `empresa_contato_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `contato` varchar(50) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  PRIMARY KEY (`empresa_contato_id`),
  KEY `k_empresa_contato_1` (`empresa_id`),
  CONSTRAINT `fk_empresa_contato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_contato`
--

LOCK TABLES `empresa_contato` WRITE;
/*!40000 ALTER TABLE `empresa_contato` DISABLE KEYS */;
INSERT INTO `empresa_contato` VALUES (3,3,2,'037998653157',''),(24,3,3,'037999887766','');
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
  `empresa_endereco_id` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_endereco`
--

LOCK TABLES `empresa_endereco` WRITE;
/*!40000 ALTER TABLE `empresa_endereco` DISABLE KEYS */;
INSERT INTO `empresa_endereco` VALUES (4,3,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1);
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
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `emprestimo_id` int(11) NOT NULL AUTO_INCREMENT,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_juros` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `parcelas` int(3) NOT NULL DEFAULT '0',
  `vencimento_dia` int(2) NOT NULL DEFAULT '0',
  `vencimento_primeira_parcela` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emprestimo_id`),
  KEY `k_emprestimo_1` (`conta_id`),
  KEY `k_emprestimo_2` (`fornecedor_id`),
  CONSTRAINT `fk_emprestimo_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_emprestimo_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo_categoria`
--

DROP TABLE IF EXISTS `emprestimo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo_categoria` (
  `emprestimo_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emprestimo_id`,`categoria_id`),
  UNIQUE KEY `uk_emprestimo_categoria_1` (`emprestimo_id`,`tipo`),
  KEY `k_emprestimo_categoria_1` (`emprestimo_id`),
  KEY `k_emprestimo_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_emprestimo_categoria_1` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimo` (`emprestimo_id`),
  CONSTRAINT `fk_emprestimo_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo_categoria`
--

LOCK TABLES `emprestimo_categoria` WRITE;
/*!40000 ALTER TABLE `emprestimo_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe` (
  `equipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `lider_id` int(11) NOT NULL DEFAULT '0',
  `departamento_id` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`equipe_id`),
  KEY `k_equipe_1` (`empresa_id`),
  KEY `k_equipe_2` (`lider_id`),
  KEY `k_equipe_3` (`departamento_id`),
  CONSTRAINT `fk_equipe_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_equipe_2` FOREIGN KEY (`lider_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_equipe_3` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_colaborador`
--

DROP TABLE IF EXISTS `equipe_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipe_colaborador` (
  `equipe_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`equipe_id`,`colaborador_id`),
  KEY `k_equipe_colaborador_1` (`equipe_id`),
  KEY `k_equipe_colaborador_2` (`colaborador_id`),
  CONSTRAINT `fk_equipe_colaborador_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipe` (`equipe_id`),
  CONSTRAINT `fk_equipe_colaborador_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_colaborador`
--

LOCK TABLES `equipe_colaborador` WRITE;
/*!40000 ALTER TABLE `equipe_colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `estoque_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `logradouro` varchar(100) NOT NULL DEFAULT '',
  `numero` varchar(10) NOT NULL DEFAULT '',
  `bairro` varchar(50) NOT NULL DEFAULT '',
  `complemento` varchar(50) NOT NULL DEFAULT '',
  `cep` varchar(10) NOT NULL DEFAULT '',
  `cidade` varchar(50) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  `codigo_municipio` varchar(7) NOT NULL DEFAULT '',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-10-19 08:55:30');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_configuracao`
--

DROP TABLE IF EXISTS `estoque_configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque_configuracao` (
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `posicao` int(2) NOT NULL DEFAULT '0',
  `nome` varchar(20) NOT NULL DEFAULT '',
  `tamanho` int(2) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`estoque_id`,`posicao`),
  KEY `k_estoque_configuracao_1` (`estoque_id`),
  CONSTRAINT `fk_estoque_configuracao_1` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_configuracao`
--

LOCK TABLES `estoque_configuracao` WRITE;
/*!40000 ALTER TABLE `estoque_configuracao` DISABLE KEYS */;
INSERT INTO `estoque_configuracao` VALUES (1,1,'Corredor',2,2),(1,2,'Prateleira',2,2);
/*!40000 ALTER TABLE `estoque_configuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_empresa`
--

DROP TABLE IF EXISTS `estoque_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque_empresa` (
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`estoque_id`,`empresa_id`),
  KEY `k_estoque_empresa_1` (`estoque_id`),
  KEY `k_estoque_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_estoque_empresa_1` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_estoque_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_empresa`
--

LOCK TABLES `estoque_empresa` WRITE;
/*!40000 ALTER TABLE `estoque_empresa` DISABLE KEYS */;
INSERT INTO `estoque_empresa` VALUES (1,3,0,1,0);
/*!40000 ALTER TABLE `estoque_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrato`
--

DROP TABLE IF EXISTS `extrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extrato` (
  `extrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `identificador` varchar(50) NOT NULL DEFAULT '',
  `importacao_tipo` int(1) NOT NULL DEFAULT '0',
  `importacao_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `processamento_data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `processamento_usuario_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`extrato_id`),
  UNIQUE KEY `uk_extrato_1` (`empresa_id`,`identificador`),
  KEY `k_extrato_1` (`empresa_id`),
  KEY `k_extrato_2` (`processamento_usuario_id`),
  CONSTRAINT `fk_extrato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrato`
--

LOCK TABLES `extrato` WRITE;
/*!40000 ALTER TABLE `extrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `extrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrato_movimento`
--

DROP TABLE IF EXISTS `extrato_movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extrato_movimento` (
  `extrato_id` int(11) NOT NULL DEFAULT '0',
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`extrato_id`,`movimento_id`),
  KEY `k_extrato_movimento_1` (`extrato_id`),
  KEY `k_extrato_movimento_2` (`movimento_id`),
  CONSTRAINT `fk_extrato_movimento_1` FOREIGN KEY (`extrato_id`) REFERENCES `extrato` (`extrato_id`),
  CONSTRAINT `fk_extrato_movimento_2` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrato_movimento`
--

LOCK TABLES `extrato_movimento` WRITE;
/*!40000 ALTER TABLE `extrato_movimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `extrato_movimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento`
--

DROP TABLE IF EXISTS `faturamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento` (
  `faturamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faturamento_id`),
  KEY `k_faturamento_1` (`empresa_id`),
  CONSTRAINT `fk_faturamento_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento`
--

LOCK TABLES `faturamento` WRITE;
/*!40000 ALTER TABLE `faturamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento_contrato`
--

DROP TABLE IF EXISTS `faturamento_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento_contrato` (
  `faturamento_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `faturamento_id` int(11) NOT NULL DEFAULT '0',
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `nfse_id` int(11) DEFAULT NULL,
  `periodo_inicial` date NOT NULL DEFAULT '0001-01-01',
  `periodo_final` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`faturamento_contrato_id`),
  UNIQUE KEY `uk_faturamento_contrato_1` (`faturamento_id`,`cliente_contrato_id`,`periodo_inicial`,`periodo_final`),
  KEY `k_faturamento_contrato_1` (`faturamento_id`),
  KEY `k_faturamento_contrato_2` (`cliente_contrato_id`),
  KEY `k_faturamento_contrato_3` (`nfse_id`),
  CONSTRAINT `fk_faturamento_contrato_1` FOREIGN KEY (`faturamento_id`) REFERENCES `faturamento` (`faturamento_id`),
  CONSTRAINT `fk_faturamento_contrato_2` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_faturamento_contrato_3` FOREIGN KEY (`nfse_id`) REFERENCES `nfse` (`nfse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento_contrato`
--

LOCK TABLES `faturamento_contrato` WRITE;
/*!40000 ALTER TABLE `faturamento_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento_contrato_pagar`
--

DROP TABLE IF EXISTS `faturamento_contrato_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento_contrato_pagar` (
  `faturamento_contrato_id` int(11) NOT NULL DEFAULT '0',
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faturamento_contrato_id`,`pagar_id`),
  KEY `k_faturamento_contrato_pagar_1` (`faturamento_contrato_id`),
  KEY `k_faturamento_contrato_pagar_2` (`pagar_id`),
  CONSTRAINT `fk_faturamento_contrato_pagar_1` FOREIGN KEY (`faturamento_contrato_id`) REFERENCES `faturamento_contrato` (`faturamento_contrato_id`),
  CONSTRAINT `fk_faturamento_contrato_pagar_2` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento_contrato_pagar`
--

LOCK TABLES `faturamento_contrato_pagar` WRITE;
/*!40000 ALTER TABLE `faturamento_contrato_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento_contrato_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento_contrato_receber`
--

DROP TABLE IF EXISTS `faturamento_contrato_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento_contrato_receber` (
  `faturamento_contrato_id` int(11) NOT NULL DEFAULT '0',
  `receber_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faturamento_contrato_id`,`receber_id`),
  KEY `k_faturamento_contrato_receber_1` (`faturamento_contrato_id`),
  KEY `k_faturamento_contrato_receber_2` (`receber_id`),
  CONSTRAINT `fk_faturamento_contrato_receber_1` FOREIGN KEY (`faturamento_contrato_id`) REFERENCES `faturamento_contrato` (`faturamento_contrato_id`),
  CONSTRAINT `fk_faturamento_contrato_receber_2` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento_contrato_receber`
--

LOCK TABLES `faturamento_contrato_receber` WRITE;
/*!40000 ALTER TABLE `faturamento_contrato_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento_contrato_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faturamento_parcial`
--

DROP TABLE IF EXISTS `faturamento_parcial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faturamento_parcial` (
  `faturamento_parcial_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `periodo_inicial` date NOT NULL DEFAULT '0001-01-01',
  `periodo_final` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`faturamento_parcial_id`),
  UNIQUE KEY `uk_faturamento_parcial_1` (`cliente_contrato_id`,`periodo_inicial`,`periodo_final`),
  KEY `k_faturamento_parcial_1` (`cliente_contrato_id`),
  CONSTRAINT `fk_faturamento_parcial_1` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento_parcial`
--

LOCK TABLES `faturamento_parcial` WRITE;
/*!40000 ALTER TABLE `faturamento_parcial` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturamento_parcial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorito` (
  `favorito_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `opcao_id` int(11) NOT NULL DEFAULT '0',
  `acao_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`favorito_id`),
  KEY `k_favorito_1` (`empresa_id`),
  KEY `k_favorito_2` (`usuario_id`),
  CONSTRAINT `fk_favorito_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feriado`
--

DROP TABLE IF EXISTS `feriado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feriado` (
  `feriado_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL DEFAULT '0001-01-01',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `cidade` varchar(50) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`feriado_id`),
  KEY `k_feriado_1` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriado`
--

LOCK TABLES `feriado` WRITE;
/*!40000 ALTER TABLE `feriado` DISABLE KEYS */;
/*!40000 ALTER TABLE `feriado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_pagamento`
--

DROP TABLE IF EXISTS `folha_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folha_pagamento` (
  `folha_pagamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`folha_pagamento_id`),
  UNIQUE KEY `uk_folha_pagamento_1` (`empresa_id`,`mes`,`tipo`),
  KEY `k_folha_pagamento_1` (`empresa_id`),
  CONSTRAINT `fk_folha_pagamento_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento`
--

LOCK TABLES `folha_pagamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `folha_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_pagamento_evento`
--

DROP TABLE IF EXISTS `folha_pagamento_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folha_pagamento_evento` (
  `folha_pagamento_evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `vencimento_desconto` char(1) NOT NULL DEFAULT '',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `percentual_salario` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`folha_pagamento_evento_id`),
  UNIQUE KEY `uk_folha_pagamento_evento_1` (`codigo_interno`),
  KEY `k_folha_pagamento_evento_1` (`categoria_id`),
  CONSTRAINT `fk_folha_pagamento_evento_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_evento`
--

LOCK TABLES `folha_pagamento_evento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_evento` DISABLE KEYS */;
INSERT INTO `folha_pagamento_evento` VALUES (1,1,'Salário','V',191,100.0000),(2,2,'Adiantamento de salário','D',179,0.0000),(3,3,'13º salário','V',178,50.0000),(4,4,'Adiantamento do 13º salário','V',180,50.0000),(5,5,'Férias','V',185,100.0000),(6,6,'1/3 sobre férias','V',185,33.3333),(7,7,'Hora extra 50%','V',187,150.0000),(8,8,'Hora extra 100%','V',187,200.0000),(9,9,'Desconto de faltas','D',197,0.0000),(10,10,'Comissão','V',182,0.0000),(11,11,'Desconto de plano de saúde','D',200,0.0000),(12,12,'Vale Alimentação','V',194,0.0000),(13,13,'Descanso semanal remunerado','V',184,0.0000),(14,14,'Adicional noturno, insalubridade e periculosidade','V',181,0.0000),(15,15,'Salário família','V',192,0.0000),(16,16,'Desconto de IRRF','D',199,0.0000),(17,17,'Desconto de vale transporte','D',202,0.0000),(18,18,'Desconto de INSS','D',198,0.0000),(19,19,'Desconto de contribuição sindical','D',196,0.0000),(20,20,'Desconto de vale alimentação','D',201,0.0000),(21,21,'Vale transporte','V',195,0.0000);
/*!40000 ALTER TABLE `folha_pagamento_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_pagamento_evento_empresa`
--

DROP TABLE IF EXISTS `folha_pagamento_evento_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folha_pagamento_evento_empresa` (
  `folha_pagamento_evento_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`folha_pagamento_evento_id`,`empresa_id`),
  KEY `k_folha_pagamento_evento_empresa_1` (`folha_pagamento_evento_id`),
  KEY `k_folha_pagamento_evento_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_folha_pagamento_evento_empresa_1` FOREIGN KEY (`folha_pagamento_evento_id`) REFERENCES `folha_pagamento_evento` (`folha_pagamento_evento_id`),
  CONSTRAINT `fk_folha_pagamento_evento_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_evento_empresa`
--

LOCK TABLES `folha_pagamento_evento_empresa` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_evento_empresa` DISABLE KEYS */;
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0),(10,3,1,0),(11,3,1,0),(12,3,1,0),(13,3,1,0),(14,3,1,0),(15,3,1,0),(16,3,1,0),(17,3,1,0),(18,3,1,0),(19,3,1,0),(20,3,1,0),(21,3,1,0);
/*!40000 ALTER TABLE `folha_pagamento_evento_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_pagamento_lancamento`
--

DROP TABLE IF EXISTS `folha_pagamento_lancamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folha_pagamento_lancamento` (
  `folha_pagamento_lancamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `folha_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `folha_pagamento_evento_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `forma_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `data_lancamento` date NOT NULL DEFAULT '0001-01-01',
  `data_vencimento` date NOT NULL DEFAULT '0001-01-01',
  `data_pagamento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `vencimento_desconto` char(1) NOT NULL DEFAULT '',
  `lancamento_vencimento_id` int(11) DEFAULT NULL,
  `lancamento_automatico` tinyint(1) NOT NULL DEFAULT '0',
  `pago` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`folha_pagamento_lancamento_id`),
  KEY `k_folha_pagamento_lancamento_1` (`folha_pagamento_id`),
  KEY `k_folha_pagamento_lancamento_2` (`colaborador_id`),
  KEY `k_folha_pagamento_lancamento_3` (`folha_pagamento_evento_id`),
  KEY `k_folha_pagamento_lancamento_4` (`conta_id`),
  KEY `k_folha_pagamento_lancamento_5` (`forma_pagamento_id`),
  KEY `k_folha_pagamento_lancamento_6` (`centro_resultado_id`),
  KEY `k_folha_pagamento_lancamento_7` (`categoria_id`),
  KEY `k_folha_pagamento_lancamento_8` (`lancamento_vencimento_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_1` FOREIGN KEY (`folha_pagamento_id`) REFERENCES `folha_pagamento` (`folha_pagamento_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_3` FOREIGN KEY (`folha_pagamento_evento_id`) REFERENCES `folha_pagamento_evento` (`folha_pagamento_evento_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_4` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_5` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_6` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_7` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_8` FOREIGN KEY (`lancamento_vencimento_id`) REFERENCES `folha_pagamento_lancamento` (`folha_pagamento_lancamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_lancamento`
--

LOCK TABLES `folha_pagamento_lancamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_lancamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `folha_pagamento_lancamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_pagamento_lancamento_conta_contabil`
--

DROP TABLE IF EXISTS `folha_pagamento_lancamento_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folha_pagamento_lancamento_conta_contabil` (
  `folha_pagamento_lancamento_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`folha_pagamento_lancamento_id`,`conta_contabil_id`,`operacao`),
  KEY `k_folha_pagamento_lancamento_conta_contabil_1` (`folha_pagamento_lancamento_id`),
  KEY `k_folha_pagamento_lancamento_conta_contabil_2` (`conta_contabil_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_id_1` FOREIGN KEY (`folha_pagamento_lancamento_id`) REFERENCES `folha_pagamento_lancamento` (`folha_pagamento_lancamento_id`),
  CONSTRAINT `fk_folha_pagamento_lancamento_id_2` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_lancamento_conta_contabil`
--

LOCK TABLES `folha_pagamento_lancamento_conta_contabil` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_lancamento_conta_contabil` DISABLE KEYS */;
/*!40000 ALTER TABLE `folha_pagamento_lancamento_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pagamento` (
  `forma_pagamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `grupo_pagamento` int(2) NOT NULL DEFAULT '0',
  `forma_pagamento_nfe` int(2) NOT NULL DEFAULT '0',
  `abre_gaveta` tinyint(1) NOT NULL DEFAULT '0',
  `tef` tinyint(1) NOT NULL DEFAULT '0',
  `saldo` tinyint(1) NOT NULL DEFAULT '0',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`forma_pagamento_id`),
  UNIQUE KEY `uk_forma_pagamento_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-10-19 08:55:48'),(2,2,'Cheque',1,2,2,1,0,1,'2022-10-19 08:55:48'),(3,3,'Cartão',1,3,3,0,0,0,'2022-10-19 08:55:48'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-10-19 08:55:48'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-10-19 08:55:48'),(6,6,'PIX',1,6,17,0,0,1,'2022-10-19 08:55:48'),(7,NULL,'Dinheiro',1,1,0,0,0,1,'2022-10-19 08:55:37'),(8,NULL,'Outros',9,99,0,0,0,0,'2022-10-19 08:55:48'),(9,NULL,'Cheque',9,2,0,0,0,1,'2022-10-19 08:55:37'),(10,NULL,'Cartão',9,3,0,0,0,1,'2022-10-19 08:55:37'),(11,NULL,'Crediário',2,4,0,0,0,1,'2022-10-19 08:55:37'),(12,NULL,'PIX',1,6,0,0,0,1,'2022-10-19 08:55:37');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_forma_pagamento before insert on forma_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.nome';
    end if;
    if new.pagamento not in (1,2,9) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.grupo_pagamento';
    end if;
    if new.abre_gaveta not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.abre_gaveta';
    end if;
    if new.tef not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.tef';
    end if;
    if new.saldo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.saldo';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.atualizado';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_forma_pagamento before update on forma_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.nome';
    end if;
    if new.pagamento not in (1,2,9) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.grupo_pagamento';
    end if;
    if new.abre_gaveta not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.abre_gaveta';
    end if;
    if new.tef not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.tef';
    end if;
    if new.saldo not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.saldo';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: forma_pagamento.atualizado';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `forma_pagamento_empresa`
--

DROP TABLE IF EXISTS `forma_pagamento_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pagamento_empresa` (
  `forma_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forma_pagamento_id`,`empresa_id`),
  KEY `k_forma_pagamento_empresa_1` (`forma_pagamento_id`),
  KEY `k_forma_pagamento_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_forma_pagamento_empresa_1` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_forma_pagamento_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento_empresa`
--

LOCK TABLES `forma_pagamento_empresa` WRITE;
/*!40000 ALTER TABLE `forma_pagamento_empresa` DISABLE KEYS */;
INSERT INTO `forma_pagamento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,0,0),(8,3,1,0),(9,3,0,0),(10,3,0,0),(11,3,0,0),(12,3,0,0);
/*!40000 ALTER TABLE `forma_pagamento_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_especial`
--

DROP TABLE IF EXISTS `horario_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario_especial` (
  `horario_especial_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL DEFAULT '0001-01-01',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_final` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`horario_especial_id`),
  UNIQUE KEY `uk_horario_especial_1` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_especial`
--

LOCK TABLES `horario_especial` WRITE;
/*!40000 ALTER TABLE `horario_especial` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_especial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_especial_empresa`
--

DROP TABLE IF EXISTS `horario_especial_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario_especial_empresa` (
  `horario_especial_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`horario_especial_id`,`empresa_id`),
  KEY `k_horario_especial_empresa_1` (`horario_especial_id`),
  KEY `k_horario_especial_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_horario_especial_empresa_1` FOREIGN KEY (`horario_especial_id`) REFERENCES `horario_especial` (`horario_especial_id`),
  CONSTRAINT `fk_horario_especial_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_especial_empresa`
--

LOCK TABLES `horario_especial_empresa` WRITE;
/*!40000 ALTER TABLE `horario_especial_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_especial_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibpt`
--

DROP TABLE IF EXISTS `ibpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibpt` (
  `ibpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ncm` varchar(11) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  `ex` varchar(10) NOT NULL DEFAULT '',
  `tipo` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(1000) NOT NULL,
  `nacional_federal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `importados_federal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `estadual` decimal(15,2) NOT NULL DEFAULT '0.00',
  `municipal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `vigencia_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `vigencia_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `chave` varchar(25) NOT NULL DEFAULT '',
  `versao` varchar(25) NOT NULL DEFAULT '',
  `fonte` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ibpt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibpt`
--

LOCK TABLES `ibpt` WRITE;
/*!40000 ALTER TABLE `ibpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibpt_atualizacao`
--

DROP TABLE IF EXISTS `ibpt_atualizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibpt_atualizacao` (
  `ibpt_arquivo_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ibpt_arquivo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibpt_atualizacao`
--

LOCK TABLES `ibpt_atualizacao` WRITE;
/*!40000 ALTER TABLE `ibpt_atualizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibpt_atualizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideia`
--

DROP TABLE IF EXISTS `ideia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideia` (
  `ideia_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `visibilidade` int(1) NOT NULL DEFAULT '0',
  `solicitacao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ideia_id`),
  KEY `k_ideia_1` (`usuario_id`),
  KEY `k_ideia_2` (`solicitacao_id`),
  CONSTRAINT `fk_ideia_2` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideia`
--

LOCK TABLES `ideia` WRITE;
/*!40000 ALTER TABLE `ideia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideia_voto`
--

DROP TABLE IF EXISTS `ideia_voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideia_voto` (
  `ideia_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ideia_id`,`usuario_id`),
  KEY `k_ideia_voto_1` (`ideia_id`),
  KEY `k_ideia_voto_2` (`usuario_id`),
  CONSTRAINT `fk_ideia_voto_1` FOREIGN KEY (`ideia_id`) REFERENCES `ideia` (`ideia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideia_voto`
--

LOCK TABLES `ideia_voto` WRITE;
/*!40000 ALTER TABLE `ideia_voto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideia_voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igpm`
--

DROP TABLE IF EXISTS `igpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `igpm` (
  `mes` char(6) NOT NULL DEFAULT '',
  `indice` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igpm`
--

LOCK TABLES `igpm` WRITE;
/*!40000 ALTER TABLE `igpm` DISABLE KEYS */;
/*!40000 ALTER TABLE `igpm` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_igpm before insert on igpm for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: igpm.mes';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_igpm before update on igpm for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: igpm.mes';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `importacao`
--

DROP TABLE IF EXISTS `importacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importacao` (
  `importacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `job` varchar(255) NOT NULL DEFAULT '',
  `url_arquivo` varchar(500) NOT NULL DEFAULT '',
  `url_relatorio` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`importacao_id`),
  KEY `k_importacao_1` (`empresa_id`),
  KEY `k_importacao_2` (`usuario_id`),
  CONSTRAINT `fk_importacao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importacao`
--

LOCK TABLES `importacao` WRITE;
/*!40000 ALTER TABLE `importacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `importacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integracao_bancaria`
--

DROP TABLE IF EXISTS `integracao_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integracao_bancaria` (
  `integracao_bancaria_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `instituicao_financeira_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tipo_arquivo` int(1) NOT NULL DEFAULT '0',
  `url_arquivo` varchar(500) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`integracao_bancaria_id`),
  KEY `k_integracao_bancaria_1` (`empresa_id`),
  KEY `k_integracao_bancaria_2` (`conta_id`),
  CONSTRAINT `fk_integracao_bancaria_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_integracao_bancaria_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integracao_bancaria`
--

LOCK TABLES `integracao_bancaria` WRITE;
/*!40000 ALTER TABLE `integracao_bancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `integracao_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integracao_bancaria_boleto`
--

DROP TABLE IF EXISTS `integracao_bancaria_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integracao_bancaria_boleto` (
  `integracao_bancaria_boleto_id` int(11) NOT NULL AUTO_INCREMENT,
  `integracao_bancaria_id` int(11) NOT NULL DEFAULT '0',
  `receber_boleto_id` int(11) DEFAULT NULL,
  `nosso_numero` varchar(20) NOT NULL DEFAULT '',
  `documento` varchar(20) NOT NULL DEFAULT '',
  `emissao` date NOT NULL DEFAULT '0001-01-01',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ocorrencia` char(2) NOT NULL DEFAULT '',
  `instituicao_financeira_id` int(11) NOT NULL DEFAULT '0',
  `numero_agencia` varchar(20) NOT NULL DEFAULT '',
  `cpf_cnpj_sacado` varchar(20) NOT NULL DEFAULT '',
  `nome_sacado` varchar(100) NOT NULL DEFAULT '',
  `observacao` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`integracao_bancaria_boleto_id`),
  KEY `k_integracao_bancaria_boleto_1` (`integracao_bancaria_id`),
  KEY `k_integracao_bancaria_boleto_2` (`receber_boleto_id`),
  CONSTRAINT `fk_integracao_bancaria_boleto_1` FOREIGN KEY (`integracao_bancaria_id`) REFERENCES `integracao_bancaria` (`integracao_bancaria_id`),
  CONSTRAINT `fk_integracao_bancaria_boleto_2` FOREIGN KEY (`receber_boleto_id`) REFERENCES `receber_boleto` (`receber_boleto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integracao_bancaria_boleto`
--

LOCK TABLES `integracao_bancaria_boleto` WRITE;
/*!40000 ALTER TABLE `integracao_bancaria_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `integracao_bancaria_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipca`
--

DROP TABLE IF EXISTS `ipca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipca` (
  `mes` char(6) NOT NULL DEFAULT '',
  `indice` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipca`
--

LOCK TABLES `ipca` WRITE;
/*!40000 ALTER TABLE `ipca` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipca` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_ipca before insert on ipca for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: ipca.mes';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_ipca before update on ipca for each row
begin
    if character_length(trim(new.mes)) <> 6 then
        signal sqlstate '45000' set message_text = 'invalid value: ipca.mes';
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
  KEY `k_log_4` (`objeto_referente`,`objeto_referente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-10-19 08:55:07',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(2,NULL,'2022-10-19 08:55:07',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3798653157\",\"[identificacao]\":\"3798653157\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(3,NULL,'2022-10-19 08:55:07',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. A\",\"[identificacao]\":\"Av. A\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(4,NULL,'2022-10-19 08:55:15',2,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}',0,0,''),(5,NULL,'2022-10-19 08:55:15',2,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"037998653157\",\"[identificacao]\":\"037998653157\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(6,NULL,'2022-10-19 08:55:15',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"037999887766\",\"[identificacao]\":\"037999887766\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(7,NULL,'2022-10-19 08:55:15',2,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Almirante Tamandaré\",\"[identificacao]\":\"Av. Almirante Tamandaré\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(8,NULL,'2022-10-19 08:55:18',1,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(9,NULL,'2022-10-19 08:55:18',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(10,NULL,'2022-10-19 08:55:18',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(11,NULL,'2022-10-19 08:55:18',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(12,NULL,'2022-10-19 08:55:18',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(13,NULL,'2022-10-19 08:55:18',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(14,NULL,'2022-10-19 08:55:18',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(15,NULL,'2022-10-19 08:55:18',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(16,NULL,'2022-10-19 08:55:18',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(17,NULL,'2022-10-19 08:55:18',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(18,NULL,'2022-10-19 08:55:18',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(19,NULL,'2022-10-19 08:55:18',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(20,NULL,'2022-10-19 08:55:18',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(21,NULL,'2022-10-19 08:55:18',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(22,NULL,'2022-10-19 08:55:18',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(23,NULL,'2022-10-19 08:55:18',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(24,NULL,'2022-10-19 08:55:18',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(25,NULL,'2022-10-19 08:55:18',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(26,NULL,'2022-10-19 08:55:18',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(27,NULL,'2022-10-19 08:55:18',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(28,NULL,'2022-10-19 08:55:18',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(29,NULL,'2022-10-19 08:55:18',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(30,NULL,'2022-10-19 08:55:18',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(31,NULL,'2022-10-19 08:55:18',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(32,NULL,'2022-10-19 08:55:18',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(33,NULL,'2022-10-19 08:55:18',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(34,NULL,'2022-10-19 08:55:18',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(35,NULL,'2022-10-19 08:55:18',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(36,NULL,'2022-10-19 08:55:18',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(37,NULL,'2022-10-19 08:55:18',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(38,NULL,'2022-10-19 08:55:18',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(39,NULL,'2022-10-19 08:55:18',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(40,NULL,'2022-10-19 08:55:18',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(41,NULL,'2022-10-19 08:55:18',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(42,NULL,'2022-10-19 08:55:18',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(43,NULL,'2022-10-19 08:55:18',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(44,NULL,'2022-10-19 08:55:18',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(45,NULL,'2022-10-19 08:55:18',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(46,NULL,'2022-10-19 08:55:18',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(47,NULL,'2022-10-19 08:55:18',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(48,NULL,'2022-10-19 08:55:18',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(49,NULL,'2022-10-19 08:55:18',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(50,NULL,'2022-10-19 08:55:18',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(51,NULL,'2022-10-19 08:55:18',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(52,NULL,'2022-10-19 08:55:18',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(53,NULL,'2022-10-19 08:55:18',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(54,NULL,'2022-10-19 08:55:18',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(55,NULL,'2022-10-19 08:55:18',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(56,NULL,'2022-10-19 08:55:18',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(57,NULL,'2022-10-19 08:55:18',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(58,NULL,'2022-10-19 08:55:18',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(59,NULL,'2022-10-19 08:55:18',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(60,NULL,'2022-10-19 08:55:18',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(61,NULL,'2022-10-19 08:55:18',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(62,NULL,'2022-10-19 08:55:18',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(63,NULL,'2022-10-19 08:55:18',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(64,NULL,'2022-10-19 08:55:18',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(65,NULL,'2022-10-19 08:55:18',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(66,NULL,'2022-10-19 08:55:18',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(67,NULL,'2022-10-19 08:55:18',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(68,NULL,'2022-10-19 08:55:18',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(69,NULL,'2022-10-19 08:55:18',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(70,NULL,'2022-10-19 08:55:18',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(71,NULL,'2022-10-19 08:55:18',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(72,NULL,'2022-10-19 08:55:18',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(73,NULL,'2022-10-19 08:55:18',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(74,NULL,'2022-10-19 08:55:18',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(75,NULL,'2022-10-19 08:55:18',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(76,NULL,'2022-10-19 08:55:18',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(77,NULL,'2022-10-19 08:55:18',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(78,NULL,'2022-10-19 08:55:18',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(79,NULL,'2022-10-19 08:55:18',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(80,NULL,'2022-10-19 08:55:18',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(81,NULL,'2022-10-19 08:55:18',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(82,NULL,'2022-10-19 08:55:18',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(83,NULL,'2022-10-19 08:55:18',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(84,NULL,'2022-10-19 08:55:18',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(85,NULL,'2022-10-19 08:55:18',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(86,NULL,'2022-10-19 08:55:18',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(87,NULL,'2022-10-19 08:55:18',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(88,NULL,'2022-10-19 08:55:18',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(89,NULL,'2022-10-19 08:55:18',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(90,NULL,'2022-10-19 08:55:18',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(91,NULL,'2022-10-19 08:55:18',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(92,NULL,'2022-10-19 08:55:18',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(93,NULL,'2022-10-19 08:55:18',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(94,NULL,'2022-10-19 08:55:18',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(95,NULL,'2022-10-19 08:55:18',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(96,NULL,'2022-10-19 08:55:18',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(97,NULL,'2022-10-19 08:55:18',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(98,NULL,'2022-10-19 08:55:18',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(99,NULL,'2022-10-19 08:55:18',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(100,NULL,'2022-10-19 08:55:18',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(101,NULL,'2022-10-19 08:55:18',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(102,NULL,'2022-10-19 08:55:18',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(103,NULL,'2022-10-19 08:55:18',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(104,NULL,'2022-10-19 08:55:18',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(105,NULL,'2022-10-19 08:55:18',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(106,NULL,'2022-10-19 08:55:18',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(107,NULL,'2022-10-19 08:55:18',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(108,NULL,'2022-10-19 08:55:18',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(109,NULL,'2022-10-19 08:55:18',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(110,NULL,'2022-10-19 08:55:18',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(111,NULL,'2022-10-19 08:55:18',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(112,NULL,'2022-10-19 08:55:18',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(113,NULL,'2022-10-19 08:55:18',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(114,NULL,'2022-10-19 08:55:18',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(115,NULL,'2022-10-19 08:55:18',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(116,NULL,'2022-10-19 08:55:18',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(117,NULL,'2022-10-19 08:55:18',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(118,NULL,'2022-10-19 08:55:18',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(119,NULL,'2022-10-19 08:55:18',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(120,NULL,'2022-10-19 08:55:18',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(121,NULL,'2022-10-19 08:55:18',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(122,NULL,'2022-10-19 08:55:18',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(123,NULL,'2022-10-19 08:55:18',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(124,NULL,'2022-10-19 08:55:18',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(125,NULL,'2022-10-19 08:55:18',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(126,NULL,'2022-10-19 08:55:18',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(127,NULL,'2022-10-19 08:55:18',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(128,NULL,'2022-10-19 08:55:18',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(129,NULL,'2022-10-19 08:55:18',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(130,NULL,'2022-10-19 08:55:18',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(131,NULL,'2022-10-19 08:55:18',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(132,NULL,'2022-10-19 08:55:18',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(133,NULL,'2022-10-19 08:55:18',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(134,NULL,'2022-10-19 08:55:18',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(135,NULL,'2022-10-19 08:55:18',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(136,NULL,'2022-10-19 08:55:18',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(137,NULL,'2022-10-19 08:55:18',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(138,NULL,'2022-10-19 08:55:18',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(139,NULL,'2022-10-19 08:55:18',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(140,NULL,'2022-10-19 08:55:18',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(141,NULL,'2022-10-19 08:55:18',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(142,NULL,'2022-10-19 08:55:18',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(143,NULL,'2022-10-19 08:55:18',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(144,NULL,'2022-10-19 08:55:18',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"18/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(145,1,'2022-10-19 08:55:18',1,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(146,1,'2022-10-19 08:55:18',1,2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(147,1,'2022-10-19 08:55:18',1,3,1,'{\"ID\":\"1\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(148,1,'2022-10-19 08:55:18',1,3,2,'{\"ID\":\"2\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(149,1,'2022-10-19 08:55:18',1,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(150,1,'2022-10-19 08:55:18',1,3,4,'{\"ID\":\"4\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"BA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(151,1,'2022-10-19 08:55:18',1,3,5,'{\"ID\":\"5\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AL\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(152,1,'2022-10-19 08:55:18',1,3,6,'{\"ID\":\"6\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"CE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(153,1,'2022-10-19 08:55:18',1,3,7,'{\"ID\":\"7\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"DF\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(154,1,'2022-10-19 08:55:18',1,3,8,'{\"ID\":\"8\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"ES\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(155,1,'2022-10-19 08:55:18',1,3,9,'{\"ID\":\"9\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"GO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(156,1,'2022-10-19 08:55:18',1,3,10,'{\"ID\":\"10\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(157,1,'2022-10-19 08:55:18',1,3,11,'{\"ID\":\"11\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(158,1,'2022-10-19 08:55:18',1,3,12,'{\"ID\":\"12\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(159,1,'2022-10-19 08:55:18',1,3,13,'{\"ID\":\"13\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MT\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(160,1,'2022-10-19 08:55:18',1,3,14,'{\"ID\":\"14\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(161,1,'2022-10-19 08:55:18',1,3,15,'{\"ID\":\"15\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PB\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(162,1,'2022-10-19 08:55:18',1,3,16,'{\"ID\":\"16\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(163,1,'2022-10-19 08:55:18',1,3,17,'{\"ID\":\"17\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PI\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(164,1,'2022-10-19 08:55:18',1,3,18,'{\"ID\":\"18\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(165,1,'2022-10-19 08:55:18',1,3,19,'{\"ID\":\"19\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RJ\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(166,1,'2022-10-19 08:55:18',1,3,20,'{\"ID\":\"20\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RN\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(167,1,'2022-10-19 08:55:18',1,3,21,'{\"ID\":\"21\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(168,1,'2022-10-19 08:55:18',1,3,22,'{\"ID\":\"22\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(169,1,'2022-10-19 08:55:18',1,3,23,'{\"ID\":\"23\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(170,1,'2022-10-19 08:55:18',1,3,24,'{\"ID\":\"24\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(171,1,'2022-10-19 08:55:18',1,3,25,'{\"ID\":\"25\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(172,1,'2022-10-19 08:55:18',1,3,26,'{\"ID\":\"26\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(173,1,'2022-10-19 08:55:18',1,3,27,'{\"ID\":\"27\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"TO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(174,1,'2022-10-19 08:55:18',1,3,28,'{\"ID\":\"28\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":2,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"98\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(175,1,'2022-10-19 08:55:18',1,3,29,'{\"ID\":\"29\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":3,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"71\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(176,1,'2022-10-19 08:55:18',1,3,30,'{\"ID\":\"30\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(177,1,'2022-10-19 08:55:18',1,3,31,'{\"ID\":\"31\",\"Nome\":\"Isentos\",\"[identificacao]\":\"Isentos\",\"Operação\":5,\"UF\":\"\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Isenta de ISS\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"Isenção\",\"Natureza da Operação do serviço\":\"Sem Dedução\",\"Alíquota ISS\":\"1,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":60,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\"}'),(178,NULL,'2022-10-19 08:55:18',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(179,1,'2022-10-19 08:55:20',1,20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(180,1,'2022-10-19 08:55:20',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Benedito\",\"[identificacao]\":\"Av. Benedito\",\"Número\":\"S\",\"Bairro\":\"Mangabeiras\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(181,1,'2022-10-19 08:55:20',1,9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(182,1,'2022-10-19 08:55:20',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(037) 2594-1157\",\"[identificacao]\":\"(037) 2594-1157\",\"Observação\":\"\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(183,1,'2022-10-19 08:55:20',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"555\",\"Bairro\":\"Centro\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(184,1,'2022-10-19 08:55:22',1,27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(185,1,'2022-10-19 08:55:22',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(186,1,'2022-10-19 08:55:22',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(187,1,'2022-10-19 08:55:23',1,33,1,'{\"ID\":\"1\",\"Ano de fabricação\":\"2011\",\"Ano do modelo\":\"2012\",\"Tipo de combustível\":\"Gasolina\",\"Placa\":\"ABC0153\",\"[identificacao]\":\"ABC0153\",\"Descrição\":\"Carro da empresa\",\"Marca\":\"Volkswagen\",\"Modelo\":\"Gol G5 1.0\",\"Cor\":\"Prata\",\"Renavam\":\"00535581587335\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(188,1,'2022-10-19 08:55:23',1,33,2,'{\"ID\":\"2\",\"Ano de fabricação\":\"2015\",\"Ano do modelo\":\"2016\",\"Tipo de combustível\":\"Alcool\",\"Placa\":\"QWE8237\",\"[identificacao]\":\"QWE8237\",\"Descrição\":\"Carro de passeio\",\"Marca\":\"Fiat\",\"Modelo\":\"Palho 1.0\",\"Cor\":\"Branco\",\"Renavam\":\"8234729840373\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(189,1,'2022-10-19 08:55:23',3,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(190,1,'2022-10-19 08:55:23',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(191,1,'2022-10-19 08:55:23',3,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(192,1,'2022-10-19 08:55:23',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Av. Chedid Jafet\",\"[identificacao]\":\"Av. Chedid Jafet\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(193,1,'2022-10-19 08:55:23',1,32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(194,1,'2022-10-19 08:55:23',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(195,1,'2022-10-19 08:55:23',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(196,1,'2022-10-19 08:55:23',1,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(197,1,'2022-10-19 08:55:23',2,32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(198,1,'2022-10-19 08:55:23',3,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(199,1,'2022-10-19 08:55:23',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(200,1,'2022-10-19 08:55:23',3,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(201,1,'2022-10-19 08:55:23',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(202,1,'2022-10-19 08:55:23',3,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(203,1,'2022-10-19 08:55:23',1,76,2,'{\"ID\":\"2\",\"Mês\":\"Setembro/2019\",\"[identificacao]\":\"Setembro/2019\",\"Valor\":\"8290,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(204,1,'2022-10-19 08:55:24',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Geral\",\"[identificacao]\":\"Geral\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(205,1,'2022-10-19 08:55:24',1,2,3,'{\"ID\":\"3\",\"Nome\":\"Produtos Tributados\",\"[identificacao]\":\"Produtos Tributados\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(206,1,'2022-10-19 08:55:24',1,2,4,'{\"ID\":\"4\",\"Nome\":\"Serviços Tributados\",\"[identificacao]\":\"Serviços Tributados\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(207,1,'2022-10-19 08:55:24',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UN\",\"[identificacao]\":\"UN\",\"Nome\":\"Unidade\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(208,1,'2022-10-19 08:55:28',1,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(209,1,'2022-10-19 08:55:28',1,14,1,'{\"ID\":\"1\",\"Grade\":\"GRD 2\",\"[identificacao]\":\"GRD 2\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(210,1,'2022-10-19 08:55:28',1,12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(211,1,'2022-10-19 08:55:28',1,13,1,'{\"ID\":\"1\",\"Lote\":\"LT 1\",\"[identificacao]\":\"LT 1\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(212,1,'2022-10-19 08:55:28',1,13,2,'{\"ID\":\"2\",\"Lote\":\"LT354RA48\",\"[identificacao]\":\"LT354RA48\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(213,1,'2022-10-19 08:55:28',1,12,3,'{\"ID\":\"3\",\"Nome\":\"Macarrão Sta Amália\",\"[identificacao]\":\"Macarrão Sta Amália\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(214,1,'2022-10-19 08:55:28',1,12,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Tipo\":\"Serviços\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(215,1,'2022-10-19 08:55:28',1,12,5,'{\"ID\":\"5\",\"Nome\":\"Coca-Cola 2L\",\"[identificacao]\":\"Coca-Cola 2L\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(216,1,'2022-10-19 08:55:28',1,12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(217,1,'2022-10-19 08:55:28',1,14,2,'{\"ID\":\"2\",\"Grade\":\"Grade teste\",\"[identificacao]\":\"Grade teste\",\"Códigos de barras\":\"\",\"Ativo\":\"Não\"}',12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(218,1,'2022-10-19 08:55:28',1,12,7,'{\"ID\":\"7\",\"Nome\":\"Feijão Carioca\",\"[identificacao]\":\"Feijão Carioca\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7896422505390\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(219,1,'2022-10-19 08:55:28',2,12,3,'{\"ID\":\"3\",\"Nome\":\"Fósforo\",\"[identificacao]\":\"Fósforo\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(220,1,'2022-10-19 08:55:28',2,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(221,1,'2022-10-19 08:55:28',2,14,1,'{\"ID\":\"1\",\"Grade\":\"P\",\"[identificacao]\":\"P\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(222,1,'2022-10-19 08:55:28',1,14,3,'{\"ID\":\"3\",\"Grade\":\"M\",\"[identificacao]\":\"M\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(223,1,'2022-10-19 08:55:30',1,42,1,'{\"ID\":\"1\",\"Nome\":\"Departamento Desenvolvimento - Orçamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(224,1,'2022-10-19 08:55:30',1,42,2,'{\"ID\":\"2\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(225,1,'2022-10-19 08:55:30',1,42,3,'{\"ID\":\"3\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(226,1,'2022-10-19 08:55:30',1,42,4,'{\"ID\":\"4\",\"Nome\":\"Departamento Administrativo - Faturamento\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(227,1,'2022-10-19 08:55:30',1,42,5,'{\"ID\":\"5\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(228,1,'2022-10-19 08:55:33',1,8,225,'{\"ID\":\"225\",\"Código\":\"6.1.01.001\",\"Nome\":\"Contas a receber\",\"[identificacao]\":\"Contas a receber\",\"Grupo\":38,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(229,1,'2022-10-19 08:55:33',1,8,226,'{\"ID\":\"226\",\"Código\":\"2.1.01.006\",\"Nome\":\"Devolução de compra à prazo\",\"[identificacao]\":\"Devolução de compra à prazo\",\"Grupo\":22,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(230,1,'2022-10-19 08:55:33',1,7,2,'{\"ID\":\"2\",\"Nome\":\"Caixa\",\"[identificacao]\":\"Caixa\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"18/10/2022 08:55:33\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(231,1,'2022-10-19 08:55:34',1,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias\",\"[identificacao]\":\"Compra de Mercadorias\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(232,1,'2022-10-19 08:55:34',1,1,7,'{\"ID\":\"7\",\"Nome\":\"Prestação de Serviço\",\"[identificacao]\":\"Prestação de Serviço\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(233,1,'2022-10-19 08:55:34',1,1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(234,1,'2022-10-19 08:55:34',1,8,93,'{\"ID\":93,\"Tipo\":\"Venda de produtos a vista\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(235,1,'2022-10-19 08:55:34',1,8,94,'{\"ID\":94,\"Tipo\":\"Venda de produtos a prazo\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(236,1,'2022-10-19 08:55:34',1,8,97,'{\"ID\":97,\"Tipo\":\"Recebimento de venda a prazo\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(237,1,'2022-10-19 08:55:34',1,1,9,'{\"ID\":\"9\",\"Nome\":\"NFe de entrada\",\"[identificacao]\":\"NFe de entrada\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(238,1,'2022-10-19 08:55:34',1,1,10,'{\"ID\":\"10\",\"Nome\":\"NFe de saída\",\"[identificacao]\":\"NFe de saída\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(239,1,'2022-10-19 08:55:35',1,3,32,'{\"ID\":\"32\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(240,1,'2022-10-19 08:55:35',1,3,33,'{\"ID\":\"33\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(241,1,'2022-10-19 08:55:35',1,3,34,'{\"ID\":\"34\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(242,1,'2022-10-19 08:55:35',1,3,35,'{\"ID\":\"35\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":9,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(243,1,'2022-10-19 08:55:35',1,3,36,'{\"ID\":\"36\",\"Nome\":\"NFe de Saída\",\"[identificacao]\":\"NFe de Saída\",\"Operação\":10,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(244,1,'2022-10-19 08:55:35',1,3,37,'{\"ID\":\"37\",\"Nome\":\"Prestação de Serviço Tributada\",\"[identificacao]\":\"Prestação de Serviço Tributada\",\"Operação\":7,\"UF\":\"\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Tributável dentro do município\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"3,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"01\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\"}'),(245,1,'2022-10-19 08:55:35',1,8,119,'{\"ID\":119,\"Tipo\":\"Compra de produtos a vista\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(246,1,'2022-10-19 08:55:35',1,8,120,'{\"ID\":120,\"Tipo\":\"Compra de produtos a prazo\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(247,1,'2022-10-19 08:55:35',1,8,121,'{\"ID\":121,\"Tipo\":\"Pagamento de compra a prazo\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(248,1,'2022-10-19 08:55:35',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(249,1,'2022-10-19 08:55:36',1,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro 1\",\"[identificacao]\":\"Dinheiro 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(250,1,'2022-10-19 08:55:37',2,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro\",\"[identificacao]\":\"Dinheiro\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(251,1,'2022-10-19 08:55:37',1,22,8,'{\"ID\":\"8\",\"Nome\":\"Outros\",\"[identificacao]\":\"Outros\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Outros\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(252,1,'2022-10-19 08:55:37',1,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque 1\",\"[identificacao]\":\"Cheque 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(253,1,'2022-10-19 08:55:37',2,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque\",\"[identificacao]\":\"Cheque\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(254,1,'2022-10-19 08:55:37',1,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão 1\",\"[identificacao]\":\"Cartão 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(255,1,'2022-10-19 08:55:37',2,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão\",\"[identificacao]\":\"Cartão\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(256,1,'2022-10-19 08:55:37',1,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário 1\",\"[identificacao]\":\"Crediário 1\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(257,1,'2022-10-19 08:55:37',2,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário\",\"[identificacao]\":\"Crediário\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(258,1,'2022-10-19 08:55:37',1,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX 1\",\"[identificacao]\":\"PIX 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(259,1,'2022-10-19 08:55:37',2,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX\",\"[identificacao]\":\"PIX\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(260,1,'2022-10-19 08:55:50',1,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"555\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:55:49\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(261,1,'2022-10-19 08:55:50',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:55:49\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(262,1,'2022-10-19 08:55:50',1,112,2,'{\"ID\":\"2\",\"Série\":\"1\",\"Número\":\"4123\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:55:50\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(263,1,'2022-10-19 08:55:51',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:55:49\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(264,1,'2022-10-19 08:56:00',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(265,1,'2022-10-19 08:56:01',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(266,1,'2022-10-19 08:56:02',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(267,1,'2022-10-19 08:56:03',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(268,1,'2022-10-19 08:56:06',1,35,1,'{\"ID\":\"1\",\"Conta\":1,\"Data pagamento\":\"19/10/2022 08:56:05\",\"Valor\":\"200,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"200,00\",\"[identificacao]\":\"200,00\",\"EmpresaEspecificaId\":3}',0,0,''),(269,1,'2022-10-19 08:56:07',1,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista 2\",\"[identificacao]\":\"À vista 2\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(270,1,'2022-10-19 08:56:07',2,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista\",\"[identificacao]\":\"À vista\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(271,1,'2022-10-19 08:56:07',1,23,6,'{\"ID\":\"6\",\"Nome\":\"À prazo 30/60/90\",\"[identificacao]\":\"À prazo 30/60/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"30 / 60 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(272,1,'2022-10-19 08:56:07',1,23,7,'{\"ID\":\"7\",\"Nome\":\"À prazo 20 dias\",\"[identificacao]\":\"À prazo 20 dias\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Vencimento no próximo dia ...\",\"Vencimento\":\"20\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(273,1,'2022-10-19 08:56:07',1,23,8,'{\"ID\":\"8\",\"Nome\":\"À prazo Entrada/30/45/60/75/90\",\"[identificacao]\":\"À prazo Entrada/30/45/60/75/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"0 / 30 / 45 / 60 / 75 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(274,1,'2022-10-19 08:56:07',1,23,9,'{\"ID\":\"9\",\"Nome\":\"Vencimento dia 10 do próximo mês\",\"[identificacao]\":\"Vencimento dia 10 do próximo mês\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Vencimento no dia ... do próximo mês\",\"Vencimento\":\"10\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(275,1,'2022-10-19 08:56:42',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(276,1,'2022-10-19 08:56:59',1,8,227,'{\"ID\":\"227\",\"Código\":\"1.1.01.011\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Grupo\":1,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(277,1,'2022-10-19 08:56:59',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,227,'{\"ID\":\"227\",\"Código\":\"1.1.01.011\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Grupo\":1,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\"}'),(278,1,'2022-10-19 08:56:59',1,8,228,'{\"ID\":\"228\",\"Código\":\"1.1.01.012\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Grupo\":2,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(279,1,'2022-10-19 08:56:59',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,228,'{\"ID\":\"228\",\"Código\":\"1.1.01.012\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Grupo\":2,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\"}'),(280,1,'2022-10-19 08:56:59',1,8,229,'{\"ID\":\"229\",\"Código\":\"1.1.01.013\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Grupo\":5,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(281,1,'2022-10-19 08:56:59',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,229,'{\"ID\":\"229\",\"Código\":\"1.1.01.013\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Grupo\":5,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\"}'),(282,1,'2022-10-19 08:56:59',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"8\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(283,1,'2022-10-19 08:57:04',1,108,21,'{\"ID\":\"21\",\"Tipo de movimento\":\"Perdas\",\"[identificacao]\":\"Perdas\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"19/10/2022\",\"Quantidade\":\"15,00\",\"Observação\":\"Vencimento do produto\",\"EmpresaEspecificaId\":3}',0,0,''),(284,1,'2022-10-19 08:57:04',1,108,22,'{\"ID\":\"22\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"19/10/2022\",\"Quantidade\":\"25,00\",\"Observação\":\"Recontagem de estoqueo\",\"EmpresaEspecificaId\":3}',0,0,''),(285,1,'2022-10-19 08:57:04',1,108,23,'{\"ID\":\"23\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"29/09/2022\",\"Quantidade\":\"58,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(286,1,'2022-10-19 08:57:04',1,108,24,'{\"ID\":\"24\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Fósforo\",\"Grade\":\"\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"29/09/2022\",\"Quantidade\":\"40,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(287,1,'2022-10-19 08:57:07',1,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"19/10/2022 08:57:07\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(288,1,'2022-10-19 08:57:09',2,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"19/10/2022 08:57:07\",\"Data de saída\":\"19/10/2022 08:57:09\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(289,1,'2022-10-19 08:57:12',1,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"19/10/2022 08:57:11\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(290,1,'2022-10-19 08:57:14',2,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"19/10/2022 08:57:12\",\"Data de saída\":\"19/10/2022 08:57:13\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(291,1,'2022-10-19 08:57:16',1,24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(292,1,'2022-10-19 08:57:16',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(293,1,'2022-10-19 08:57:16',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(294,1,'2022-10-19 08:57:16',1,112,13,'{\"ID\":\"13\",\"Série\":\"1\",\"Número\":\"958\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:57:15\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(295,1,'2022-10-19 08:57:23',1,32,7,'{\"Comissão\":\"0,00\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/10/2002\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(296,NULL,'2022-10-19 08:57:23',1,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"118,00\",\"Preço médio de custo\":\"45,9674\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(297,NULL,'2022-10-19 08:57:23',1,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(298,NULL,'2022-10-19 08:57:23',1,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(299,NULL,'2022-10-19 08:57:23',1,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(300,NULL,'2022-10-19 08:57:23',1,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(301,NULL,'2022-10-19 08:57:23',1,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(302,1,'2022-10-19 08:57:23',3,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(303,1,'2022-10-19 08:57:23',1,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"5,00\",\"Preço médio de custo\":\"10,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(304,1,'2022-10-19 08:57:23',2,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(305,1,'2022-10-19 08:57:24',3,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"118,00\",\"Preço médio de custo\":\"45,9674\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(306,1,'2022-10-19 08:57:24',3,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(307,1,'2022-10-19 08:57:24',3,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(308,1,'2022-10-19 08:57:24',3,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(309,1,'2022-10-19 08:57:24',3,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(310,1,'2022-10-19 08:57:24',3,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(311,1,'2022-10-19 08:57:24',1,114,8,'{\"ID\":\"8\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"58,00\",\"Preço médio de custo\":\"45,9674\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(312,1,'2022-10-19 08:57:24',1,114,9,'{\"ID\":\"9\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(313,1,'2022-10-19 08:57:24',1,114,10,'{\"ID\":\"10\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"40,00\",\"Preço médio de custo\":\"2,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(314,1,'2022-10-19 08:57:24',1,114,11,'{\"ID\":\"11\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(315,1,'2022-10-19 08:57:24',1,114,12,'{\"ID\":\"12\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(316,1,'2022-10-19 08:57:24',1,114,13,'{\"ID\":\"13\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202209,'{\"ID\":\"202209\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"EmpresaEspecificaId\":3}'),(317,1,'2022-10-19 08:57:24',1,112,14,'{\"ID\":\"14\",\"Série\":\"1\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":10,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"20/10/2022 08:57:23\",\"Destinatário\":3,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(318,1,'2022-10-19 08:57:29',1,1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(319,1,'2022-10-19 08:57:29',1,8,99,'{\"ID\":99,\"Tipo\":\"Devolução de venda de produtos a vista\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(320,1,'2022-10-19 08:57:29',1,8,100,'{\"ID\":100,\"Tipo\":\"Devolução de venda de produtos a prazo\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(321,1,'2022-10-19 08:57:30',1,9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(322,1,'2022-10-19 08:57:30',1,16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"19/10/2022 08:57:30\",\"Vencimento\":\"19/11/2022 08:57:30\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(323,1,'2022-10-19 08:57:30',1,8,141,'{\"ID\":141}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"19/10/2022 08:57:30\",\"Vencimento\":\"19/11/2022 08:57:30\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(324,1,'2022-10-19 08:57:30',1,16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"19/10/2022 08:57:30\",\"Vencimento\":\"19/11/2022 08:57:30\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(325,1,'2022-10-19 08:57:30',1,8,141,'{\"ID\":141}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"19/10/2022 08:57:30\",\"Vencimento\":\"19/11/2022 08:57:30\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(326,1,'2022-10-19 08:57:41',1,27,9,'{\"ID\":\"9\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(327,1,'2022-10-19 08:57:42',2,27,1,'{\"ID\":\"1\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(328,1,'2022-10-19 08:57:43',1,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(329,1,'2022-10-19 08:57:43',2,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(330,1,'2022-10-19 08:57:43',2,29,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Grupo\":1,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"80,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(331,1,'2022-10-19 08:57:43',1,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":119,\"Data início\":\"19/10/2021 08:57:43\",\"Data término\":\"19/10/2024 08:57:43\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IPCA\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(332,1,'2022-10-19 08:57:45',2,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":119,\"Data início\":\"19/10/2021\",\"Data término\":\"19/10/2024\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IPCA\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(333,1,'2022-10-19 08:57:45',1,37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"19/10/2022 08:57:44\",\"Vencimento\":\"24/10/2022 08:57:44\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(334,1,'2022-10-19 08:57:45',1,8,225,'{\"ID\":225}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"19/10/2022 08:57:44\",\"Vencimento\":\"24/10/2022 08:57:44\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(335,1,'2022-10-19 08:57:46',2,37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"19/10/2022\",\"Vencimento\":\"24/10/2022\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(336,1,'2022-10-19 08:57:46',3,8,225,'{\"ID\":225}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"19/10/2022\",\"Vencimento\":\"24/10/2022\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(337,1,'2022-10-19 08:57:46',1,8,225,'{\"ID\":225}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"19/10/2022\",\"Vencimento\":\"24/10/2022\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `log_empresa` VALUES (1,3),(2,3),(3,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(122,3),(123,3),(124,3),(125,3),(126,3),(127,3),(128,3),(129,3),(130,3),(131,3),(132,3),(133,3),(134,3),(135,3),(136,3),(137,3),(138,3),(139,3),(140,3),(141,3),(142,3),(143,3),(144,3),(145,3),(146,3),(147,3),(148,3),(149,3),(150,3),(151,3),(152,3),(153,3),(154,3),(155,3),(156,3),(157,3),(158,3),(159,3),(160,3),(161,3),(162,3),(163,3),(164,3),(165,3),(166,3),(167,3),(168,3),(169,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,3),(178,3),(179,3),(180,3),(181,3),(182,3),(183,3),(184,3),(185,3),(186,3),(187,3),(188,3),(189,3),(190,3),(191,3),(192,3),(193,3),(194,3),(195,3),(196,3),(197,3),(198,3),(199,3),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(228,3),(229,3),(230,3),(231,3),(232,3),(233,3),(234,3),(235,3),(236,3),(237,3),(238,3),(239,3),(240,3),(241,3),(242,3),(243,3),(244,3),(245,3),(246,3),(247,3),(248,3),(249,3),(250,3),(251,3),(252,3),(253,3),(254,3),(255,3),(256,3),(257,3),(258,3),(259,3),(260,3),(261,3),(262,3),(263,3),(264,3),(265,3),(266,3),(267,3),(268,3),(269,3),(270,3),(271,3),(272,3),(273,3),(274,3),(275,3),(276,3),(277,3),(278,3),(279,3),(280,3),(281,3),(282,3),(283,3),(284,3),(285,3),(286,3),(287,3),(288,3),(289,3),(290,3),(291,3),(292,3),(293,3),(294,3),(295,3),(296,3),(297,3),(298,3),(299,3),(300,3),(301,3),(302,3),(303,3),(304,3),(305,3),(306,3),(307,3),(308,3),(309,3),(310,3),(311,3),(312,3),(313,3),(314,3),(315,3),(316,3),(317,3),(318,3),(319,3),(320,3),(321,3),(322,3),(323,3),(324,3),(325,3),(326,3),(327,3),(328,3),(329,3),(330,3),(331,3),(332,3),(333,3),(334,3),(335,3),(336,3),(337,3);
/*!40000 ALTER TABLE `log_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento`
--

DROP TABLE IF EXISTS `movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento` (
  `movimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `caixa_id` int(11) DEFAULT NULL,
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `data_hora_lancamento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_movimento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `compra_id` int(11) DEFAULT NULL,
  `venda_id` int(11) DEFAULT NULL,
  `pagamento_id` int(11) DEFAULT NULL,
  `recebimento_id` int(11) DEFAULT NULL,
  `folha_pagamento_lancamento_id` int(11) DEFAULT NULL,
  `transferencia_id` int(11) DEFAULT NULL,
  `pagar_id` int(11) DEFAULT NULL,
  `receber_id` int(11) DEFAULT NULL,
  `devolucao_compra_id` int(11) DEFAULT NULL,
  `devolucao_venda_id` int(11) DEFAULT NULL,
  `emprestimo_id` int(11) DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `pendente` tinyint(1) NOT NULL DEFAULT '0',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movimento_id`),
  KEY `k_movimento_1` (`empresa_id`),
  KEY `k_movimento_2` (`conta_id`),
  KEY `k_movimento_3` (`caixa_id`),
  KEY `k_movimento_4` (`compra_id`),
  KEY `k_movimento_5` (`venda_id`),
  KEY `k_movimento_6` (`pagamento_id`),
  KEY `k_movimento_7` (`recebimento_id`),
  KEY `k_movimento_8` (`folha_pagamento_lancamento_id`),
  KEY `k_movimento_9` (`transferencia_id`),
  KEY `k_movimento_10` (`pagar_id`),
  KEY `k_movimento_11` (`receber_id`),
  KEY `k_movimento_12` (`devolucao_compra_id`),
  KEY `k_movimento_13` (`devolucao_venda_id`),
  KEY `k_movimento_14` (`emprestimo_id`),
  CONSTRAINT `fk_movimento_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_movimento_10` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_movimento_11` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_movimento_12` FOREIGN KEY (`devolucao_compra_id`) REFERENCES `devolucao_compra` (`devolucao_compra_id`),
  CONSTRAINT `fk_movimento_13` FOREIGN KEY (`devolucao_venda_id`) REFERENCES `devolucao_venda` (`devolucao_venda_id`),
  CONSTRAINT `fk_movimento_14` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimo` (`emprestimo_id`),
  CONSTRAINT `fk_movimento_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_movimento_3` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`caixa_id`),
  CONSTRAINT `fk_movimento_4` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_movimento_5` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_movimento_6` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`pagamento_id`),
  CONSTRAINT `fk_movimento_7` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`),
  CONSTRAINT `fk_movimento_8` FOREIGN KEY (`folha_pagamento_lancamento_id`) REFERENCES `folha_pagamento_lancamento` (`folha_pagamento_lancamento_id`),
  CONSTRAINT `fk_movimento_9` FOREIGN KEY (`transferencia_id`) REFERENCES `movimento` (`movimento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2022-10-19 08:56:00','2022-10-19 08:55:59',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,1),(2,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2022-10-19 08:56:00','2022-10-19 08:56:00',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(3,3,1,NULL,'Conclusão da compra 19985763 do fornecedor Femsa LTDA','2022-10-19 08:56:02','2022-10-19 08:56:01',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(4,3,1,NULL,'Conclusão da compra 19985764 do fornecedor Femsa LTDA','2022-10-19 08:56:02','2022-10-19 08:56:02',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(5,3,1,NULL,'Conclusão da compra 129583 do fornecedor Femsa LTDA','2022-10-19 08:56:03','2022-10-19 08:56:03',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(6,3,1,NULL,'Conclusão da compra 129584 do fornecedor Femsa LTDA','2022-10-19 08:56:04','2022-10-19 08:56:03',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(7,3,1,NULL,'Conclusão da compra 129585 do fornecedor Femsa LTDA','2022-10-19 08:56:04','2022-10-19 08:56:04',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,'D',0,1),(8,3,1,NULL,'Conclusão da compra 129586 do fornecedor Femsa LTDA','2022-10-19 08:56:05','2022-10-19 08:56:04',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',0,1),(9,3,1,NULL,'Conclusão da compra 129587 do fornecedor Femsa LTDA','2022-10-19 08:56:05','2022-10-19 08:56:04',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,1),(10,3,1,NULL,'Conclusão da compra 13250 do fornecedor Femsa LTDA','2022-10-19 08:56:05','2022-10-19 08:56:05',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,0),(11,3,1,NULL,'Pagamento: 10 - Femsa LTDA','2022-10-19 08:56:05','2022-10-19 08:56:05',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(12,3,2,NULL,'Conclusão da venda 11 para consumidor final','2022-10-19 08:57:07','2022-10-19 08:57:07',NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105.00,'C',0,0),(13,3,2,NULL,'Conclusão da venda 12  para o cliente Jeff Bezos','2022-10-19 08:57:07','2022-10-19 08:57:07',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200000.01,'C',0,0),(14,3,2,NULL,'Conclusão da venda 13 para consumidor final','2022-10-19 08:57:07','2022-10-19 08:57:07',NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(15,3,2,NULL,'Conclusão da venda 14 para consumidor final','2022-10-19 08:57:07','2022-10-19 08:57:07',NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.01,'C',0,0),(16,3,2,NULL,'Conclusão da venda 16  para o cliente Jeff Bezos','2022-10-19 08:57:15','2022-10-19 08:57:15',NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135.44,'C',0,0),(17,3,2,NULL,'Conclusão da venda 17 para consumidor final','2022-10-19 08:57:15','2022-10-19 08:57:15',NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',0,0),(18,3,2,NULL,'Conclusão da venda 18 para consumidor final','2022-10-19 08:57:15','2022-10-19 08:57:15',NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',0,0),(19,3,2,NULL,'Devolução da venda 11 para consumidor final','2022-10-19 08:57:29','2022-10-19 08:57:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,10.50,'D',0,0),(20,3,1,NULL,'Devolução da compra 129583 do fornecedor ','2022-10-19 08:57:29','2022-10-19 08:57:29',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'C',0,0),(21,3,1,NULL,'Documento à pagar: 0000000007','2022-10-19 08:57:30','2022-10-19 08:57:30',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,5.00,'D',0,0),(22,3,1,NULL,'Documento à pagar: 0000000007','2022-10-19 08:57:30','2022-10-19 08:57:30',NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,5.00,'D',0,0),(23,3,1,NULL,'Documento à receber: Teste api','2022-10-19 08:57:44','2022-10-19 08:57:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,170.50,'C',0,0);
/*!40000 ALTER TABLE `movimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_anexo`
--

DROP TABLE IF EXISTS `movimento_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_anexo` (
  `movimento_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`movimento_anexo_id`),
  KEY `k_movimento_anexo_1` (`movimento_id`),
  CONSTRAINT `fk_movimento_anexo_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_anexo`
--

LOCK TABLES `movimento_anexo` WRITE;
/*!40000 ALTER TABLE `movimento_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimento_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_categoria`
--

DROP TABLE IF EXISTS `movimento_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_categoria` (
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_cartao_id` int(11) DEFAULT NULL,
  `credito_debito_conta_cartao` char(1) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`movimento_id`,`categoria_id`),
  KEY `k_movimento_categoria_1` (`movimento_id`),
  KEY `k_movimento_categoria_2` (`categoria_id`),
  KEY `k_movimento_categoria_3` (`conta_cartao_id`),
  CONSTRAINT `fk_movimento_categoria_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`),
  CONSTRAINT `fk_movimento_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_movimento_categoria_3` FOREIGN KEY (`conta_cartao_id`) REFERENCES `conta_cartao` (`conta_cartao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_categoria`
--

LOCK TABLES `movimento_categoria` WRITE;
/*!40000 ALTER TABLE `movimento_categoria` DISABLE KEYS */;
INSERT INTO `movimento_categoria` VALUES (1,119,NULL,'',300.00),(2,120,NULL,'',100.00),(3,119,NULL,'',500.00),(4,119,NULL,'',500.00),(5,120,NULL,'',500.00),(6,120,NULL,'',700.00),(7,119,NULL,'',70.00),(8,119,NULL,'',80.00),(9,119,NULL,'',90.00),(10,119,NULL,'',90.00),(11,121,NULL,'',200.00),(12,93,NULL,'',105.00),(13,93,NULL,'',200000.01),(14,93,NULL,'',30.00),(15,93,NULL,'',3000.01),(16,94,NULL,'',135.44),(17,93,NULL,'',10.00),(18,93,NULL,'',15.00),(19,99,NULL,'',10.50),(20,123,NULL,'',500.00),(21,141,NULL,'',5.00),(22,141,NULL,'',5.00),(23,225,NULL,'',170.50);
/*!40000 ALTER TABLE `movimento_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_centro_resultado`
--

DROP TABLE IF EXISTS `movimento_centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_centro_resultado` (
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`movimento_id`,`centro_resultado_id`),
  KEY `k_movimento_centro_resultado_1` (`movimento_id`),
  KEY `k_movimento_centro_resultado_2` (`centro_resultado_id`),
  CONSTRAINT `fk_movimento_centro_resultado_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`),
  CONSTRAINT `fk_movimento_centro_resultado_2` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_centro_resultado`
--

LOCK TABLES `movimento_centro_resultado` WRITE;
/*!40000 ALTER TABLE `movimento_centro_resultado` DISABLE KEYS */;
INSERT INTO `movimento_centro_resultado` VALUES (1,1,50.00),(1,2,250.00);
/*!40000 ALTER TABLE `movimento_centro_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_conta_contabil`
--

DROP TABLE IF EXISTS `movimento_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_conta_contabil` (
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo` int(1) NOT NULL DEFAULT '0',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movimento_id`,`categoria_id`,`conta_contabil_id`,`regime`),
  KEY `k_movimento_conta_contabil_1` (`movimento_id`),
  KEY `k_movimento_conta_contabil_2` (`categoria_id`),
  KEY `k_movimento_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_movimento_conta_contabil_4` (`movimento_id`,`categoria_id`),
  CONSTRAINT `fk_movimento_conta_contabil_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`),
  CONSTRAINT `fk_movimento_conta_contabil_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_movimento_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_movimento_conta_contabil_4` FOREIGN KEY (`movimento_id`, `categoria_id`) REFERENCES `movimento_categoria` (`movimento_id`, `categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_conta_contabil`
--

LOCK TABLES `movimento_conta_contabil` WRITE;
/*!40000 ALTER TABLE `movimento_conta_contabil` DISABLE KEYS */;
INSERT INTO `movimento_conta_contabil` VALUES (1,119,4,300.00,2,2),(1,119,9,300.00,1,2),(1,119,56,300.00,1,1),(1,119,78,300.00,2,1),(2,120,9,100.00,1,2),(2,120,18,100.00,1,2),(3,119,4,500.00,2,2),(3,119,9,500.00,1,2),(3,119,56,500.00,1,1),(3,119,78,500.00,2,1),(4,119,4,500.00,2,2),(4,119,9,500.00,1,2),(4,119,56,500.00,1,1),(4,119,78,500.00,2,1),(5,120,9,500.00,1,2),(5,120,18,500.00,1,2),(6,120,9,700.00,1,2),(6,120,18,700.00,1,2),(7,119,4,70.00,2,2),(7,119,9,70.00,1,2),(7,119,56,70.00,1,1),(7,119,78,70.00,2,1),(8,119,4,80.00,2,2),(8,119,9,80.00,1,2),(8,119,56,80.00,1,1),(8,119,78,80.00,2,1),(9,119,4,90.00,2,2),(9,119,9,90.00,1,2),(9,119,56,90.00,1,1),(9,119,78,90.00,2,1),(10,119,4,90.00,2,2),(10,119,9,90.00,1,2),(10,119,56,90.00,1,1),(10,119,78,90.00,2,1),(11,121,4,200.00,1,2),(11,121,18,200.00,2,2),(11,121,29,200.00,2,2),(11,121,49,200.00,1,1),(11,121,49,200.00,1,2),(11,121,56,200.00,1,1),(11,121,72,200.00,1,1),(11,121,72,200.00,1,2),(11,121,78,200.00,1,1),(11,121,78,200.00,2,2),(12,93,4,105.00,1,2),(12,93,9,20.00,2,2),(12,93,29,105.00,1,2),(12,93,34,105.00,1,1),(12,93,34,105.00,1,2),(12,93,56,20.00,1,2),(12,93,78,105.00,1,1),(12,93,78,105.00,1,2),(13,93,4,200000.01,1,2),(13,93,9,2.00,2,2),(13,93,29,200000.01,1,2),(13,93,34,200000.01,1,1),(13,93,34,200000.01,1,2),(13,93,56,2.00,1,2),(13,93,78,200000.01,1,1),(13,93,78,200000.01,1,2),(14,93,4,30.00,1,2),(14,93,9,6.00,2,2),(14,93,29,30.00,1,2),(14,93,34,30.00,1,1),(14,93,34,30.00,1,2),(14,93,56,6.00,1,2),(14,93,78,30.00,1,1),(14,93,78,30.00,1,2),(15,93,4,3000.01,1,2),(15,93,9,2.00,2,2),(15,93,29,3000.01,1,2),(15,93,34,3000.01,1,1),(15,93,34,3000.01,1,2),(15,93,56,2.00,1,2),(15,93,78,3000.01,1,1),(15,93,78,3000.01,1,2),(16,94,6,135.44,1,2),(16,94,9,154.00,2,2),(16,94,29,135.44,1,2),(16,94,34,135.44,1,2),(16,94,56,154.00,1,2),(16,94,78,135.44,1,2),(17,93,4,10.00,1,2),(17,93,9,9.00,2,2),(17,93,29,10.00,1,2),(17,93,34,10.00,1,1),(17,93,34,10.00,1,2),(17,93,56,9.00,1,2),(17,93,78,10.00,1,1),(17,93,78,10.00,1,2),(18,93,4,15.00,1,2),(18,93,9,27.00,2,2),(18,93,29,15.00,1,2),(18,93,34,15.00,1,1),(18,93,34,15.00,1,2),(18,93,56,27.00,1,2),(18,93,78,15.00,1,1),(18,93,78,15.00,1,2),(19,99,4,10.50,2,2),(19,99,9,10.50,1,2),(19,99,29,10.50,2,2),(19,99,38,10.50,2,1),(19,99,38,10.50,2,2),(19,99,56,10.50,2,2),(19,99,78,10.50,2,1),(19,99,78,10.50,2,2),(20,123,9,500.00,2,2),(20,123,18,500.00,2,2),(21,141,21,5.00,1,2),(21,141,29,5.00,2,2),(21,141,63,5.00,1,2),(21,141,78,5.00,2,2),(22,141,21,5.00,1,2),(22,141,29,5.00,2,2),(22,141,63,5.00,1,2),(22,141,78,5.00,2,2),(23,225,7,170.50,1,2),(23,225,30,170.50,1,2),(23,225,51,170.50,1,2),(23,225,78,170.50,1,2);
/*!40000 ALTER TABLE `movimento_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_forma_pagamento`
--

DROP TABLE IF EXISTS `movimento_forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_forma_pagamento` (
  `movimento_forma_pagamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `forma_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `cheque_id` int(11) DEFAULT NULL,
  `cartao_id` int(11) DEFAULT NULL,
  `pix_id` int(11) DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `saldo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movimento_forma_pagamento_id`),
  KEY `k_movimento_forma_pagamento_1` (`movimento_id`),
  KEY `k_movimento_forma_pagamento_2` (`forma_pagamento_id`),
  KEY `k_movimento_forma_pagamento_3` (`cheque_id`),
  KEY `k_movimento_forma_pagamento_4` (`cartao_id`),
  KEY `k_movimento_forma_pagamento_5` (`pix_id`),
  CONSTRAINT `fk_movimento_forma_pagamento_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`),
  CONSTRAINT `fk_movimento_forma_pagamento_2` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_movimento_forma_pagamento_3` FOREIGN KEY (`cheque_id`) REFERENCES `cheque` (`cheque_id`),
  CONSTRAINT `fk_movimento_forma_pagamento_4` FOREIGN KEY (`cartao_id`) REFERENCES `cartao` (`cartao_id`),
  CONSTRAINT `fk_movimento_forma_pagamento_5` FOREIGN KEY (`pix_id`) REFERENCES `pix` (`pix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,1,NULL,NULL,NULL,300.00,'D',1),(2,2,1,NULL,NULL,NULL,30.00,'D',1),(3,2,1,NULL,NULL,NULL,70.00,'D',1),(4,3,8,NULL,NULL,NULL,500.00,'D',0),(5,4,1,NULL,NULL,NULL,500.00,'D',1),(6,5,1,NULL,NULL,NULL,200.00,'D',1),(7,5,8,NULL,NULL,NULL,300.00,'D',0),(8,6,1,NULL,NULL,NULL,250.00,'D',1),(9,6,8,NULL,NULL,NULL,450.00,'D',0),(10,7,1,NULL,NULL,NULL,70.00,'D',1),(11,8,1,NULL,NULL,NULL,80.00,'D',1),(12,9,1,NULL,NULL,NULL,90.00,'D',1),(13,10,1,NULL,NULL,NULL,90.00,'D',1),(14,11,1,NULL,NULL,NULL,200.00,'D',1),(15,12,1,NULL,NULL,NULL,105.00,'C',1),(16,13,1,NULL,NULL,NULL,200000.01,'C',1),(17,14,1,NULL,NULL,NULL,50.00,'C',1),(18,14,1,NULL,NULL,NULL,20.00,'D',1),(19,15,1,NULL,NULL,NULL,3000.01,'C',1),(20,16,1,NULL,NULL,NULL,30.00,'C',1),(21,16,4,NULL,NULL,NULL,105.44,'C',0),(22,17,1,NULL,NULL,NULL,10.00,'C',1),(23,18,1,NULL,NULL,NULL,15.00,'C',1);
/*!40000 ALTER TABLE `movimento_forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_operacao`
--

DROP TABLE IF EXISTS `movimento_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimento_operacao` (
  `movimento_id` int(11) NOT NULL DEFAULT '0',
  `movimentou_estoque` tinyint(1) NOT NULL DEFAULT '0',
  `movimentou_financeiro` tinyint(1) NOT NULL DEFAULT '0',
  `atualizou_precos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movimento_id`),
  CONSTRAINT `fk_movimento_operacao_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_operacao`
--

LOCK TABLES `movimento_operacao` WRITE;
/*!40000 ALTER TABLE `movimento_operacao` DISABLE KEYS */;
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,0,1,1),(4,0,1,1),(5,1,1,1),(6,1,1,1),(7,1,1,1),(8,1,1,1),(9,1,1,1),(10,1,1,1),(12,1,1,1),(13,1,1,1),(14,1,1,1),(15,1,1,1),(16,1,1,1),(17,1,1,1),(18,1,1,1),(19,1,1,1),(20,1,1,1);
/*!40000 ALTER TABLE `movimento_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nf`
--

DROP TABLE IF EXISTS `nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nf` (
  `nf_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_emissao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_entrada` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `serie` int(3) NOT NULL DEFAULT '0',
  `emitente_id` int(11) NOT NULL DEFAULT '0',
  `tipo_frete` int(2) NOT NULL DEFAULT '0',
  `transportador_id` int(11) DEFAULT NULL,
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nf_id`),
  KEY `k_nf_1` (`empresa_id`),
  KEY `k_nf_2` (`operacao_id`),
  KEY `k_nf_3` (`emitente_id`),
  KEY `k_nf_4` (`transportador_id`),
  KEY `k_nf_5` (`estoque_id`),
  CONSTRAINT `fk_nf_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_nf_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_nf_3` FOREIGN KEY (`emitente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nf_4` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nf_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf`
--

LOCK TABLES `nf` WRITE;
/*!40000 ALTER TABLE `nf` DISABLE KEYS */;
INSERT INTO `nf` VALUES (1,3,13250,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,3,9,NULL,1,90.00,90.00,0.00,0.00,0.00,0.00,90.00,16.20,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0);
/*!40000 ALTER TABLE `nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nf_item`
--

DROP TABLE IF EXISTS `nf_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nf_item` (
  `nf_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `nf_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `cfop` int(4) NOT NULL DEFAULT '0',
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_unitario_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_st_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_ipi` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_credito_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_bc_c_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nf_item_id`),
  KEY `k_nf_item_1` (`nf_id`),
  KEY `k_nf_item_2` (`produto_id`),
  KEY `k_nf_item_3` (`produto_grade_id`),
  KEY `k_nf_item_4` (`produto_lote_id`),
  KEY `k_nf_item_5` (`conta_contabil_id`),
  CONSTRAINT `fk_nf_item_1` FOREIGN KEY (`nf_id`) REFERENCES `nf` (`nf_id`),
  CONSTRAINT `fk_nf_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_nf_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_nf_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_nf_item_5` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf_item`
--

LOCK TABLES `nf_item` WRITE;
/*!40000 ALTER TABLE `nf_item` DISABLE KEYS */;
INSERT INTO `nf_item` VALUES (1,1,1,1,NULL,1102,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,'00',90.00,18.0000,16.20,0.00,0.0000,0.0000,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,56,0);
/*!40000 ALTER TABLE `nf_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfce`
--

DROP TABLE IF EXISTS `nfce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfce` (
  `nfce_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL DEFAULT '0',
  `serie` int(3) NOT NULL DEFAULT '0',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `protocolo` varchar(15) NOT NULL DEFAULT '',
  `recibo` varchar(15) NOT NULL DEFAULT '',
  `data_hora_emissao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_saida` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tipo_emissao` int(2) NOT NULL DEFAULT '0',
  `url_xml` varchar(500) NOT NULL DEFAULT '',
  `url_xml_cancelamento` varchar(500) NOT NULL DEFAULT '',
  `data_hora_cancelamento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `justificativa_cancelamento` text NOT NULL,
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `observacao_fisco` text NOT NULL,
  `job` varchar(255) NOT NULL DEFAULT '',
  `emitida` tinyint(1) NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `substituida` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfce_id`),
  KEY `k_nfce_1` (`empresa_id`),
  KEY `k_nfce_2` (`cliente_id`),
  KEY `k_nfce_3` (`estoque_id`),
  CONSTRAINT `fk_nfce_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_nfce_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nfce_3` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce`
--

LOCK TABLES `nfce` WRITE;
/*!40000 ALTER TABLE `nfce` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfce_contingencia`
--

DROP TABLE IF EXISTS `nfce_contingencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfce_contingencia` (
  `nfce_contingencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_entrada` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_saida` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `justificativa` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfce_contingencia_id`),
  KEY `k_nfce_contingencia_1` (`empresa_id`),
  CONSTRAINT `fk_nfce_contingencia_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_contingencia`
--

LOCK TABLES `nfce_contingencia` WRITE;
/*!40000 ALTER TABLE `nfce_contingencia` DISABLE KEYS */;
INSERT INTO `nfce_contingencia` VALUES (1,3,'2022-10-19 08:57:07','2022-10-19 08:57:09','teste modo de contingencia',0);
/*!40000 ALTER TABLE `nfce_contingencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfce_item`
--

DROP TABLE IF EXISTS `nfce_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfce_item` (
  `nfce_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfce_id` int(11) NOT NULL DEFAULT '0',
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `cfop` int(4) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_iss` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_contribuicao_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_receita_pis_cofins` char(3) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nfce_item_id`),
  KEY `k_nfce_item_1` (`nfce_id`),
  KEY `k_nfce_item_2` (`produto_id`),
  KEY `k_nfce_item_3` (`produto_grade_id`),
  KEY `k_nfce_item_4` (`produto_lote_id`),
  KEY `k_nfce_item_5` (`conta_contabil_id`),
  CONSTRAINT `fk_nfce_item_1` FOREIGN KEY (`nfce_id`) REFERENCES `nfce` (`nfce_id`),
  CONSTRAINT `fk_nfce_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_nfce_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_nfce_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_nfce_item_5` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_item`
--

LOCK TABLES `nfce_item` WRITE;
/*!40000 ALTER TABLE `nfce_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfce_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfce_numeracao_inutilizada`
--

DROP TABLE IF EXISTS `nfce_numeracao_inutilizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfce_numeracao_inutilizada` (
  `nfce_numeracao_inutilizada_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `serie` int(3) NOT NULL DEFAULT '0',
  `numero_inicial` int(11) NOT NULL DEFAULT '0',
  `numero_final` int(11) NOT NULL DEFAULT '0',
  `justificativa` text NOT NULL,
  `url_xml` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfce_numeracao_inutilizada_id`),
  KEY `k_nfce_numeracao_inutilizada_1` (`empresa_id`),
  CONSTRAINT `fk_nfce_numeracao_inutilizada_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_numeracao_inutilizada`
--

LOCK TABLES `nfce_numeracao_inutilizada` WRITE;
/*!40000 ALTER TABLE `nfce_numeracao_inutilizada` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfce_numeracao_inutilizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfce_substituta`
--

DROP TABLE IF EXISTS `nfce_substituta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfce_substituta` (
  `nfce_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `serie` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfce_id`),
  KEY `k_nfce_substituta_1` (`nfce_id`),
  CONSTRAINT `fk_nfce_substituta_1` FOREIGN KEY (`nfce_id`) REFERENCES `nfce` (`nfce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_substituta`
--

LOCK TABLES `nfce_substituta` WRITE;
/*!40000 ALTER TABLE `nfce_substituta` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfce_substituta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe`
--

DROP TABLE IF EXISTS `nfe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe` (
  `nfe_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `entrada_saida` char(1) NOT NULL DEFAULT '',
  `finalidade` int(1) NOT NULL DEFAULT '0',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `protocolo` varchar(15) NOT NULL DEFAULT '',
  `recibo` varchar(15) NOT NULL DEFAULT '',
  `consumidor_final` tinyint(1) NOT NULL DEFAULT '0',
  `presenca` int(2) NOT NULL DEFAULT '0',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_emissao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_entrada_saida` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `serie` int(3) NOT NULL DEFAULT '0',
  `emitente` int(1) NOT NULL DEFAULT '0',
  `destinatario_emitente_id` int(11) NOT NULL DEFAULT '0',
  `tipo_frete` int(2) NOT NULL DEFAULT '0',
  `transportador_id` int(11) DEFAULT NULL,
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_diferimento_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `url_xml` varchar(500) NOT NULL DEFAULT '',
  `url_xml_cancelamento` varchar(500) NOT NULL DEFAULT '',
  `estoque_id` int(11) DEFAULT NULL,
  `observacao` text NOT NULL,
  `observacao_fisco` text NOT NULL,
  `emitida` tinyint(1) NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `denegada` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_id`),
  KEY `k_nfe_1` (`empresa_id`),
  KEY `k_nfe_2` (`operacao_id`),
  KEY `k_nfe_3` (`destinatario_emitente_id`),
  KEY `k_nfe_4` (`transportador_id`),
  KEY `k_nfe_5` (`estoque_id`),
  CONSTRAINT `fk_nfe_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_nfe_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_nfe_3` FOREIGN KEY (`destinatario_emitente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nfe_4` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nfe_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe`
--

LOCK TABLES `nfe` WRITE;
/*!40000 ALTER TABLE `nfe` DISABLE KEYS */;
INSERT INTO `nfe` VALUES (1,3,888,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-10-20 08:55:49',1,0,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(2,3,4123,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-10-20 08:55:50',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,1),(3,3,105522,'E',1,'31160704731855000143550010007485481189117075','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,1,300.00,300.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(4,3,129589,'E',1,'35170556639107000139550010001295891214189392','','',0,0,6,'2022-10-17 00:00:00','2022-10-19 00:00:00',5,1,3,9,NULL,2,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(5,3,19985761,'E',1,'31190824634181000176550240000051671667165118','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(6,3,19985762,'E',1,'31190724634181000176550740000000091895382522','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(7,3,19985763,'E',1,'31190624634181000176550240000051471672414309','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(8,3,19985764,'E',1,'31190624634181000176550240000051461229102452','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(9,3,129581,'E',1,'31190624634181000176550240000051451431684303','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(10,3,129582,'E',1,'31190624634181000176550240000051441127964116','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(11,3,129583,'E',1,'31190524634181000176550240000051431383098847','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(12,3,129584,'E',1,'31190524634181000176550240000051421383098840','','',0,0,6,'2022-10-19 00:00:00','2022-10-19 00:00:00',1,1,3,9,NULL,2,700.00,700.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(13,3,958,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-10-20 08:57:16',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(14,3,0,'S',1,'','','',0,0,10,'0001-01-01 00:00:00','2022-10-20 08:57:24',1,0,3,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0);
/*!40000 ALTER TABLE `nfe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_ajuste_item`
--

DROP TABLE IF EXISTS `nfe_ajuste_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_ajuste_item` (
  `nfe_ajuste_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_id` int(11) NOT NULL DEFAULT '0',
  `cfop` int(4) NOT NULL DEFAULT '0',
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `codigo` varchar(10) NOT NULL DEFAULT '',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`nfe_ajuste_item_id`),
  KEY `k_nfe_ajuste_item_1` (`nfe_id`),
  CONSTRAINT `fk_nfe_ajuste_item_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_ajuste_item`
--

LOCK TABLES `nfe_ajuste_item` WRITE;
/*!40000 ALTER TABLE `nfe_ajuste_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_ajuste_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_cce`
--

DROP TABLE IF EXISTS `nfe_cce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_cce` (
  `nfe_cce_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `sequencia` int(11) NOT NULL DEFAULT '0',
  `correcao` text NOT NULL,
  `url_xml` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_cce_id`),
  KEY `k_nfe_cce_1` (`nfe_id`),
  CONSTRAINT `fk_nfe_cce_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_cce`
--

LOCK TABLES `nfe_cce` WRITE;
/*!40000 ALTER TABLE `nfe_cce` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_cce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_contingencia`
--

DROP TABLE IF EXISTS `nfe_contingencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_contingencia` (
  `nfe_contingencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_entrada` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_saida` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `justificativa` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_contingencia_id`),
  KEY `k_nfe_contingencia_1` (`empresa_id`),
  CONSTRAINT `fk_nfe_contingencia_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_contingencia`
--

LOCK TABLES `nfe_contingencia` WRITE;
/*!40000 ALTER TABLE `nfe_contingencia` DISABLE KEYS */;
INSERT INTO `nfe_contingencia` VALUES (1,3,'2022-10-19 08:57:12','2022-10-19 08:57:14','teste modo de contingencia',0);
/*!40000 ALTER TABLE `nfe_contingencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_item`
--

DROP TABLE IF EXISTS `nfe_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_item` (
  `nfe_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `cfop` int(4) NOT NULL DEFAULT '0',
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_unitario_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_frete` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_outras_despesas` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `modalidade_bc_icms` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_diferimento_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_diferimento_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `modalidade_bc_icms_st` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_st_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `mva_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `base_calculo_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_ipi` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_ipi` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_iss` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `quantidade_emissao_nfe` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `base_calculo_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st_retido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_fcp_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_fcp_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_credito_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_bc_c_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `codigo_contribuicao_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_receita_pis_cofins` char(3) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_item_id`),
  KEY `k_nfe_item_1` (`nfe_id`),
  KEY `k_nfe_item_2` (`produto_id`),
  KEY `k_nfe_item_3` (`produto_grade_id`),
  KEY `k_nfe_item_4` (`produto_lote_id`),
  KEY `k_nfe_item_5` (`conta_contabil_id`),
  CONSTRAINT `fk_nfe_item_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_nfe_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_nfe_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_nfe_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_nfe_item_5` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_item`
--

LOCK TABLES `nfe_item` WRITE;
/*!40000 ALTER TABLE `nfe_item` DISABLE KEYS */;
INSERT INTO `nfe_item` VALUES (1,1,1,2,NULL,1102,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'03',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,1),(2,2,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(3,3,3,NULL,NULL,1102,1,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(4,3,5,NULL,NULL,1102,2,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(5,3,1,1,NULL,1102,3,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(6,4,1,1,NULL,1101,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(7,5,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(8,6,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(9,7,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(10,8,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(11,9,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(12,10,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(13,11,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(14,12,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(15,12,3,NULL,NULL,1102,2,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(16,12,5,NULL,NULL,1102,3,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(17,13,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0);
/*!40000 ALTER TABLE `nfe_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_item_icms_st_retido`
--

DROP TABLE IF EXISTS `nfe_item_icms_st_retido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_item_icms_st_retido` (
  `nfe_item_icms_st_retido_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_item_id` int(11) NOT NULL DEFAULT '0',
  `saida_nfe_item_id` int(11) DEFAULT NULL,
  `saida_nfce_item_id` int(11) DEFAULT NULL,
  `saida_cfe_sat_item_id` int(11) DEFAULT NULL,
  `saida_cfe_mfe_item_id` int(11) DEFAULT NULL,
  `saida_quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`nfe_item_icms_st_retido_id`),
  UNIQUE KEY `uk_nfe_item_icms_st_retido_1` (`nfe_item_id`,`saida_nfe_item_id`,`saida_nfce_item_id`,`saida_cfe_sat_item_id`,`saida_cfe_mfe_item_id`),
  KEY `k_nfe_item_icms_st_retido_1` (`nfe_item_id`),
  KEY `k_nfe_item_icms_st_retido_2` (`saida_nfe_item_id`),
  KEY `k_nfe_item_icms_st_retido_3` (`saida_nfce_item_id`),
  KEY `k_nfe_item_icms_st_retido_4` (`saida_cfe_sat_item_id`),
  KEY `k_nfe_item_icms_st_retido_5` (`saida_cfe_mfe_item_id`),
  CONSTRAINT `fk_nfe_item_icms_st_retido_1` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`),
  CONSTRAINT `fk_nfe_item_icms_st_retido_2` FOREIGN KEY (`saida_nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`),
  CONSTRAINT `fk_nfe_item_icms_st_retido_3` FOREIGN KEY (`saida_nfce_item_id`) REFERENCES `nfce_item` (`nfce_item_id`),
  CONSTRAINT `fk_nfe_item_icms_st_retido_4` FOREIGN KEY (`saida_cfe_sat_item_id`) REFERENCES `cfe_sat_item` (`cfe_sat_item_id`),
  CONSTRAINT `fk_nfe_item_icms_st_retido_5` FOREIGN KEY (`saida_cfe_mfe_item_id`) REFERENCES `cfe_mfe_item` (`cfe_mfe_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_item_icms_st_retido`
--

LOCK TABLES `nfe_item_icms_st_retido` WRITE;
/*!40000 ALTER TABLE `nfe_item_icms_st_retido` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_item_icms_st_retido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_numeracao_inutilizada`
--

DROP TABLE IF EXISTS `nfe_numeracao_inutilizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_numeracao_inutilizada` (
  `nfe_numeracao_inutilizada_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `serie` int(3) NOT NULL DEFAULT '0',
  `numero_inicial` int(11) NOT NULL DEFAULT '0',
  `numero_final` int(11) NOT NULL DEFAULT '0',
  `justificativa` text NOT NULL,
  `url_xml` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_numeracao_inutilizada_id`),
  KEY `k_nfe_numeracao_inutilizada_1` (`empresa_id`),
  CONSTRAINT `fk_nfe_numeracao_inutilizada_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_numeracao_inutilizada`
--

LOCK TABLES `nfe_numeracao_inutilizada` WRITE;
/*!40000 ALTER TABLE `nfe_numeracao_inutilizada` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_numeracao_inutilizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_referenciada`
--

DROP TABLE IF EXISTS `nfe_referenciada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_referenciada` (
  `nfe_id` int(11) NOT NULL DEFAULT '0',
  `chave_acesso_nfe_referenciada` varchar(44) NOT NULL DEFAULT '',
  PRIMARY KEY (`nfe_id`,`chave_acesso_nfe_referenciada`),
  KEY `k_nfe_referenciada_1` (`nfe_id`),
  CONSTRAINT `fk_nfe_referenciada_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_referenciada`
--

LOCK TABLES `nfe_referenciada` WRITE;
/*!40000 ALTER TABLE `nfe_referenciada` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_referenciada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_volume`
--

DROP TABLE IF EXISTS `nfe_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_volume` (
  `nfe_volume_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_id` int(11) NOT NULL DEFAULT '0',
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `especie` varchar(60) NOT NULL DEFAULT '',
  `marca` varchar(60) NOT NULL DEFAULT '',
  `numeracao` varchar(60) NOT NULL DEFAULT '',
  `peso_liquido` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `peso_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`nfe_volume_id`),
  KEY `k_nfe_volume_1` (`nfe_id`),
  CONSTRAINT `fk_nfe_volume_1` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_volume`
--

LOCK TABLES `nfe_volume` WRITE;
/*!40000 ALTER TABLE `nfe_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfe_volume_lacre`
--

DROP TABLE IF EXISTS `nfe_volume_lacre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfe_volume_lacre` (
  `nfe_volume_lacre_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfe_volume_id` int(11) NOT NULL DEFAULT '0',
  `numero` varchar(60) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfe_volume_lacre_id`),
  KEY `k_nfe_volume_lacre_1` (`nfe_volume_id`),
  CONSTRAINT `fk_nfe_volume_lacre_1` FOREIGN KEY (`nfe_volume_id`) REFERENCES `nfe_volume` (`nfe_volume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_volume_lacre`
--

LOCK TABLES `nfe_volume_lacre` WRITE;
/*!40000 ALTER TABLE `nfe_volume_lacre` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfe_volume_lacre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfse`
--

DROP TABLE IF EXISTS `nfse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfse` (
  `nfse_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` bigint(20) NOT NULL DEFAULT '0',
  `numero_rps` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `chave_acesso` varchar(44) NOT NULL DEFAULT '',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `data_emissao` date NOT NULL DEFAULT '0001-01-01',
  `data_competencia` date NOT NULL DEFAULT '0001-01-01',
  `serie` int(3) NOT NULL DEFAULT '0',
  `cliente_id` int(11) DEFAULT NULL,
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_servicos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `url_pdf` varchar(500) NOT NULL DEFAULT '',
  `url_xml` varchar(500) NOT NULL DEFAULT '',
  `url_xml_cancelamento` varchar(500) NOT NULL DEFAULT '',
  `tecnospeed_handle` int(11) NOT NULL DEFAULT '0',
  `tecnospeed_erro` varchar(500) NOT NULL DEFAULT '',
  `enotas_nfse_id` varchar(36) NOT NULL DEFAULT '',
  `plugnotas_nfse_id` varchar(36) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfse_id`),
  KEY `k_nfse_1` (`empresa_id`),
  KEY `k_nfse_2` (`operacao_id`),
  KEY `k_nfse_3` (`cliente_id`),
  CONSTRAINT `fk_nfse_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_nfse_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_nfse_3` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfse`
--

LOCK TABLES `nfse` WRITE;
/*!40000 ALTER TABLE `nfse` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfse_item`
--

DROP TABLE IF EXISTS `nfse_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfse_item` (
  `nfse_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `nfse_id` int(11) NOT NULL DEFAULT '0',
  `servico_id` int(11) NOT NULL DEFAULT '0',
  `descricao` text NOT NULL,
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_servico` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_iss` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_iss` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tipo_tributacao_servico` int(1) NOT NULL DEFAULT '0',
  `natureza_tributacao_servico` int(1) NOT NULL DEFAULT '0',
  `iss_retido` tinyint(1) NOT NULL DEFAULT '0',
  `exigibilidade_iss` int(1) NOT NULL DEFAULT '0',
  `operacao_servico` int(1) NOT NULL DEFAULT '0',
  `codigo_cnae` varchar(10) NOT NULL DEFAULT '',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_contribuicao_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_receita_pis_cofins` char(3) NOT NULL DEFAULT '',
  `codigo_tributacao_municipio` varchar(20) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfse_item_id`),
  KEY `k_nfse_item_1` (`nfse_id`),
  KEY `k_nfse_item_2` (`servico_id`),
  KEY `k_nfse_item_3` (`conta_contabil_id`),
  CONSTRAINT `fk_nfse_item_1` FOREIGN KEY (`nfse_id`) REFERENCES `nfse` (`nfse_id`),
  CONSTRAINT `fk_nfse_item_2` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_nfse_item_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfse_item`
--

LOCK TABLES `nfse_item` WRITE;
/*!40000 ALTER TABLE `nfse_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfse_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfse_substituta`
--

DROP TABLE IF EXISTS `nfse_substituta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfse_substituta` (
  `nfse_id` int(11) NOT NULL DEFAULT '0',
  `numero_rps` int(11) NOT NULL DEFAULT '0',
  `serie_rps` int(3) NOT NULL DEFAULT '0',
  `tipo_rps` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nfse_id`),
  KEY `k_nfse_substituta_1` (`nfse_id`),
  CONSTRAINT `fk_nfse_substituta_1` FOREIGN KEY (`nfse_id`) REFERENCES `nfse` (`nfse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfse_substituta`
--

LOCK TABLES `nfse_substituta` WRITE;
/*!40000 ALTER TABLE `nfse_substituta` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfse_substituta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeracao`
--

DROP TABLE IF EXISTS `numeracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeracao` (
  `numeracao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `serie` int(3) NOT NULL DEFAULT '0',
  `pdv_id` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numeracao_id`),
  UNIQUE KEY `uk_numeracao_1` (`empresa_id`,`tipo`,`serie`),
  KEY `k_numeracao_1` (`empresa_id`),
  KEY `k_numeracao_2` (`pdv_id`),
  CONSTRAINT `fk_numeracao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_numeracao_2` FOREIGN KEY (`pdv_id`) REFERENCES `pdv` (`pdv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeracao`
--

LOCK TABLES `numeracao` WRITE;
/*!40000 ALTER TABLE `numeracao` DISABLE KEYS */;
INSERT INTO `numeracao` VALUES (1,3,1,4,NULL,20),(2,3,1,5,NULL,1),(3,3,1,55,NULL,11);
/*!40000 ALTER TABLE `numeracao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_numeracao before insert on numeracao for each row
begin
    if new.tipo not in (1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.tipo';
    end if;
    if new.serie < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.serie';
    end if;
    if new.numero < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.numero';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_numeracao before update on numeracao for each row
begin
    if new.tipo not in (1,2,3,4,5,6,7,8) then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.tipo';
    end if;
    if new.serie < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.serie';
    end if;
    if new.numero < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: numeracao.numero';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `odf`
--

DROP TABLE IF EXISTS `odf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odf` (
  `odf_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL DEFAULT '0',
  `data_emissao` date NOT NULL DEFAULT '0001-01-01',
  `data_entrada` date NOT NULL DEFAULT '0001-01-01',
  `serie` char(3) NOT NULL DEFAULT '',
  `modelo` char(3) NOT NULL DEFAULT '',
  `situacao` int(2) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `pagamento` int(11) NOT NULL DEFAULT '0',
  `valor_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cfop` int(4) NOT NULL DEFAULT '0',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `base_calculo_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `base_calculo_pis_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `codigo_credito_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_bc_c_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `classe_consumo_energia` int(2) NOT NULL DEFAULT '0',
  `tipo_ligacao_eletrica` int(1) NOT NULL DEFAULT '0',
  `grupo_tensao_eletrica` int(2) NOT NULL DEFAULT '0',
  `tipo_assinatura` int(1) NOT NULL DEFAULT '0',
  `classe_consumo_agua` int(3) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  PRIMARY KEY (`odf_id`),
  KEY `k_odf_1` (`empresa_id`),
  KEY `k_odf_2` (`fornecedor_id`),
  KEY `k_odf_3` (`conta_contabil_id`),
  CONSTRAINT `fk_odf_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_odf_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_odf_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odf`
--

LOCK TABLES `odf` WRITE;
/*!40000 ALTER TABLE `odf` DISABLE KEYS */;
/*!40000 ALTER TABLE `odf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao` (
  `operacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `entrada_saida` char(1) NOT NULL DEFAULT '',
  `movimenta_estoque` tinyint(1) NOT NULL DEFAULT '0',
  `movimenta_financeiro` tinyint(1) NOT NULL DEFAULT '0',
  `atualiza_precos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operacao_id`),
  UNIQUE KEY `uk_operacao_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(5,5,'Prestação de serviços','S',0,1,1),(6,NULL,'Compra de Mercadorias para revenda','E',1,1,1),(7,NULL,'Prestação de Serviço','S',0,0,0),(8,NULL,'Venda de Mercadorias','S',1,1,1),(9,NULL,'NFe de entrada','E',1,0,1),(10,NULL,'NFe de saída','S',1,0,1),(11,NULL,'Devolução de Venda','E',1,1,1);
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_categoria`
--

DROP TABLE IF EXISTS `operacao_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_categoria` (
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operacao_id`,`categoria_id`),
  UNIQUE KEY `uk_operacao_categoria_1` (`operacao_id`,`tipo`),
  KEY `k_operacao_categoria_1` (`operacao_id`),
  KEY `k_operacao_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_operacao_categoria_1` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_operacao_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_categoria`
--

LOCK TABLES `operacao_categoria` WRITE;
/*!40000 ALTER TABLE `operacao_categoria` DISABLE KEYS */;
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,97,9),(2,99,5),(2,100,6),(3,119,3),(3,120,4),(3,121,10),(4,122,7),(4,123,8),(5,98,9),(5,95,11),(5,96,12),(6,119,3),(6,120,4),(6,121,10),(8,93,1),(8,94,2),(8,97,9),(11,99,5),(11,100,6);
/*!40000 ALTER TABLE `operacao_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_conta_contabil`
--

DROP TABLE IF EXISTS `operacao_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_conta_contabil` (
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  `custo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operacao_id`,`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_operacao_conta_contabil_1` (`operacao_id`),
  KEY `k_operacao_conta_contabil_2` (`categoria_id`),
  KEY `k_operacao_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_operacao_conta_contabil_4` (`operacao_id`,`categoria_id`),
  CONSTRAINT `fk_operacao_conta_contabil_1` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_operacao_conta_contabil_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_operacao_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_operacao_conta_contabil_4` FOREIGN KEY (`operacao_id`, `categoria_id`) REFERENCES `operacao_categoria` (`operacao_id`, `categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_conta_contabil`
--

LOCK TABLES `operacao_conta_contabil` WRITE;
/*!40000 ALTER TABLE `operacao_conta_contabil` DISABLE KEYS */;
INSERT INTO `operacao_conta_contabil` VALUES (1,66,4,2,100.0000,1,0),(1,66,10,3,100.0000,1,0),(1,85,4,2,100.0000,1,0),(1,85,10,2,100.0000,2,0),(1,85,10,3,100.0000,1,0),(1,85,12,3,100.0000,2,1),(1,85,59,4,100.0000,2,0),(1,85,80,1,100.0000,2,1),(1,86,4,2,100.0000,1,0),(1,86,12,3,100.0000,1,1),(1,86,59,4,100.0000,1,0),(1,86,61,4,100.0000,1,0),(1,86,80,1,100.0000,1,1),(2,31,10,3,100.0000,2,0),(2,31,12,2,100.0000,2,1),(2,31,59,1,100.0000,2,0),(2,31,80,4,100.0000,2,1),(2,32,5,3,100.0000,1,0),(2,32,12,2,100.0000,1,1),(2,32,59,1,100.0000,1,0),(2,32,80,4,100.0000,1,1),(3,14,5,3,100.0000,1,0),(3,14,12,2,100.0000,2,1),(3,14,37,1,100.0000,1,0),(3,14,37,4,100.0000,2,0),(3,14,83,1,100.0000,1,1),(3,15,4,3,100.0000,1,0),(3,15,12,2,100.0000,1,0),(3,15,83,1,100.0000,1,0),(3,89,5,3,100.0000,1,0),(3,89,37,1,100.0000,1,0),(3,89,83,1,100.0000,1,0),(4,29,12,3,100.0000,2,0),(4,29,37,1,100.0000,2,0),(4,30,5,2,100.0000,1,0),(4,30,12,3,100.0000,1,0),(4,30,83,4,100.0000,1,0),(5,59,4,2,100.0000,1,0),(5,59,10,2,100.0000,2,0),(5,59,10,3,100.0000,1,0),(5,59,60,4,100.0000,2,0),(5,60,4,2,100.0000,1,0),(5,60,60,4,100.0000,1,0),(5,60,62,4,100.0000,1,0),(5,64,4,2,100.0000,1,0),(5,64,10,3,100.0000,1,0),(5,64,65,4,100.0000,1,0),(8,66,4,2,100.0000,1,0),(8,66,10,3,100.0000,1,0),(8,85,4,2,100.0000,1,0),(8,85,10,2,100.0000,2,0),(8,85,10,3,100.0000,1,0),(8,85,12,3,100.0000,2,0),(8,85,59,4,100.0000,2,0),(8,85,80,1,100.0000,2,0),(8,86,4,2,100.0000,1,0),(8,86,12,3,100.0000,1,0),(8,86,59,4,100.0000,1,0),(8,86,80,1,100.0000,1,0);
/*!40000 ALTER TABLE `operacao_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao_empresa`
--

DROP TABLE IF EXISTS `operacao_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao_empresa` (
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operacao_id`,`empresa_id`),
  KEY `k_operacao_empresa_1` (`operacao_id`),
  KEY `k_operacao_empresa_2` (`empresa_id`),
  KEY `k_operacao_empresa_3` (`conta_id`),
  CONSTRAINT `fk_operacao_empresa_1` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_operacao_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_operacao_empresa_3` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao_empresa`
--

LOCK TABLES `operacao_empresa` WRITE;
/*!40000 ALTER TABLE `operacao_empresa` DISABLE KEYS */;
INSERT INTO `operacao_empresa` VALUES (1,3,1,1,0),(2,3,1,1,0),(3,3,1,1,0),(4,3,1,1,0),(5,3,1,1,0),(6,3,NULL,1,0),(7,3,2,1,0),(8,3,2,1,0),(9,3,2,1,0),(10,3,2,1,0),(11,3,1,1,0);
/*!40000 ALTER TABLE `operacao_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade`
--

DROP TABLE IF EXISTS `oportunidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade` (
  `oportunidade_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `pessoa_crm_id` int(11) DEFAULT NULL,
  `conta_crm_id` int(11) NOT NULL DEFAULT '0',
  `vendedor_id` int(11) NOT NULL DEFAULT '0',
  `oportunidade_origem_id` int(11) DEFAULT NULL,
  `oportunidade_solucao_id` int(11) NOT NULL DEFAULT '0',
  `oportunidade_fase_id` int(11) NOT NULL DEFAULT '0',
  `oportunidade_status_id` int(11) NOT NULL DEFAULT '0',
  `oportunidade_motivo_id` int(11) DEFAULT NULL,
  `oportunidade_tipo_id` int(11) DEFAULT NULL,
  `descricao` varchar(300) NOT NULL DEFAULT '',
  `valor_produtos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_servicos` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_recorrencia` decimal(15,2) NOT NULL DEFAULT '0.00',
  `meses_recorrencia` int(3) NOT NULL DEFAULT '0',
  `valor_ticket` decimal(15,2) NOT NULL DEFAULT '0.00',
  `entrada` date NOT NULL DEFAULT '0001-01-01',
  `previsao` date NOT NULL DEFAULT '0001-01-01',
  `conclusao` date NOT NULL DEFAULT '0001-01-01',
  `chance_vitoria` int(1) NOT NULL DEFAULT '0',
  `proximidade_conclusao` int(1) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_id`),
  KEY `k_oportunidade_1` (`empresa_id`),
  KEY `k_oportunidade_2` (`pessoa_crm_id`),
  KEY `k_oportunidade_3` (`conta_crm_id`),
  KEY `k_oportunidade_4` (`vendedor_id`),
  KEY `k_oportunidade_5` (`oportunidade_origem_id`),
  KEY `k_oportunidade_6` (`oportunidade_solucao_id`),
  KEY `k_oportunidade_7` (`oportunidade_motivo_id`),
  KEY `k_oportunidade_8` (`oportunidade_tipo_id`),
  CONSTRAINT `fk_oportunidade_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_oportunidade_2` FOREIGN KEY (`pessoa_crm_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_oportunidade_3` FOREIGN KEY (`conta_crm_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_oportunidade_4` FOREIGN KEY (`vendedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_oportunidade_5` FOREIGN KEY (`oportunidade_origem_id`) REFERENCES `oportunidade_origem` (`oportunidade_origem_id`),
  CONSTRAINT `fk_oportunidade_6` FOREIGN KEY (`oportunidade_solucao_id`) REFERENCES `oportunidade_solucao` (`oportunidade_solucao_id`),
  CONSTRAINT `fk_oportunidade_7` FOREIGN KEY (`oportunidade_motivo_id`) REFERENCES `oportunidade_motivo` (`oportunidade_motivo_id`),
  CONSTRAINT `fk_oportunidade_8` FOREIGN KEY (`oportunidade_tipo_id`) REFERENCES `oportunidade_tipo` (`oportunidade_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade`
--

LOCK TABLES `oportunidade` WRITE;
/*!40000 ALTER TABLE `oportunidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_concorrente`
--

DROP TABLE IF EXISTS `oportunidade_concorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_concorrente` (
  `oportunidade_id` int(11) NOT NULL DEFAULT '0',
  `concorrente_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_id`,`concorrente_id`),
  KEY `k_oportunidade_concorrente_1` (`oportunidade_id`),
  KEY `k_oportunidade_concorrente_2` (`concorrente_id`),
  CONSTRAINT `fk_oportunidade_concorrente_1` FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidade` (`oportunidade_id`),
  CONSTRAINT `fk_oportunidade_concorrente_2` FOREIGN KEY (`concorrente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_concorrente`
--

LOCK TABLES `oportunidade_concorrente` WRITE;
/*!40000 ALTER TABLE `oportunidade_concorrente` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_concorrente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_motivo`
--

DROP TABLE IF EXISTS `oportunidade_motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_motivo` (
  `oportunidade_motivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_motivo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_motivo`
--

LOCK TABLES `oportunidade_motivo` WRITE;
/*!40000 ALTER TABLE `oportunidade_motivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_motivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_motivo_empresa`
--

DROP TABLE IF EXISTS `oportunidade_motivo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_motivo_empresa` (
  `oportunidade_motivo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_motivo_id`,`empresa_id`),
  KEY `k_oportunidade_motivo_empresa_1` (`oportunidade_motivo_id`),
  KEY `k_oportunidade_motivo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_oportunidade_motivo_empresa_1` FOREIGN KEY (`oportunidade_motivo_id`) REFERENCES `oportunidade_motivo` (`oportunidade_motivo_id`),
  CONSTRAINT `fk_oportunidade_motivo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_motivo_empresa`
--

LOCK TABLES `oportunidade_motivo_empresa` WRITE;
/*!40000 ALTER TABLE `oportunidade_motivo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_motivo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_origem`
--

DROP TABLE IF EXISTS `oportunidade_origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_origem` (
  `oportunidade_origem_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`oportunidade_origem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_origem`
--

LOCK TABLES `oportunidade_origem` WRITE;
/*!40000 ALTER TABLE `oportunidade_origem` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_origem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_origem_empresa`
--

DROP TABLE IF EXISTS `oportunidade_origem_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_origem_empresa` (
  `oportunidade_origem_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_origem_id`,`empresa_id`),
  KEY `k_oportunidade_origem_empresa_1` (`oportunidade_origem_id`),
  KEY `k_oportunidade_origem_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_oportunidade_origem_empresa_1` FOREIGN KEY (`oportunidade_origem_id`) REFERENCES `oportunidade_origem` (`oportunidade_origem_id`),
  CONSTRAINT `fk_oportunidade_origem_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_origem_empresa`
--

LOCK TABLES `oportunidade_origem_empresa` WRITE;
/*!40000 ALTER TABLE `oportunidade_origem_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_origem_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_solucao`
--

DROP TABLE IF EXISTS `oportunidade_solucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_solucao` (
  `oportunidade_solucao_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`oportunidade_solucao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_solucao`
--

LOCK TABLES `oportunidade_solucao` WRITE;
/*!40000 ALTER TABLE `oportunidade_solucao` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_solucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_solucao_empresa`
--

DROP TABLE IF EXISTS `oportunidade_solucao_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_solucao_empresa` (
  `oportunidade_solucao_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_solucao_id`,`empresa_id`),
  KEY `k_oportunidade_solucao_empresa_1` (`oportunidade_solucao_id`),
  KEY `k_oportunidade_solucao_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_oportunidade_solucao_empresa_1` FOREIGN KEY (`oportunidade_solucao_id`) REFERENCES `oportunidade_solucao` (`oportunidade_solucao_id`),
  CONSTRAINT `fk_oportunidade_solucao_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_solucao_empresa`
--

LOCK TABLES `oportunidade_solucao_empresa` WRITE;
/*!40000 ALTER TABLE `oportunidade_solucao_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_solucao_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_tarefa`
--

DROP TABLE IF EXISTS `oportunidade_tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_tarefa` (
  `oportunidade_id` int(11) NOT NULL DEFAULT '0',
  `tarefa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_id`,`tarefa_id`),
  KEY `k_oportunidade_tarefa_1` (`oportunidade_id`),
  KEY `k_oportunidade_tarefa_2` (`tarefa_id`),
  CONSTRAINT `fk_oportunidade_tarefa_1` FOREIGN KEY (`oportunidade_id`) REFERENCES `oportunidade` (`oportunidade_id`),
  CONSTRAINT `fk_oportunidade_tarefa_2` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_tarefa`
--

LOCK TABLES `oportunidade_tarefa` WRITE;
/*!40000 ALTER TABLE `oportunidade_tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_tipo`
--

DROP TABLE IF EXISTS `oportunidade_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_tipo` (
  `oportunidade_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`oportunidade_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_tipo`
--

LOCK TABLES `oportunidade_tipo` WRITE;
/*!40000 ALTER TABLE `oportunidade_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oportunidade_tipo_empresa`
--

DROP TABLE IF EXISTS `oportunidade_tipo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oportunidade_tipo_empresa` (
  `oportunidade_tipo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oportunidade_tipo_id`,`empresa_id`),
  KEY `k_oportunidade_tipo_empresa_1` (`oportunidade_tipo_id`),
  KEY `k_oportunidade_tipo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_oportunidade_tipo_empresa_1` FOREIGN KEY (`oportunidade_tipo_id`) REFERENCES `oportunidade_tipo` (`oportunidade_tipo_id`),
  CONSTRAINT `fk_oportunidade_tipo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_tipo_empresa`
--

LOCK TABLES `oportunidade_tipo_empresa` WRITE;
/*!40000 ALTER TABLE `oportunidade_tipo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `oportunidade_tipo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `ordem_servico_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_abertura` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_previsao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_entrega` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `veiculo_id` int(11) DEFAULT NULL,
  `veiculo_km` decimal(15,2) NOT NULL DEFAULT '0.00',
  `equipamento_descricao` varchar(100) NOT NULL DEFAULT '',
  `equipamento_numero_serie` varchar(30) NOT NULL DEFAULT '',
  `equipamento_marca` varchar(30) NOT NULL DEFAULT '',
  `equipamento_modelo` varchar(30) NOT NULL DEFAULT '',
  `descricao_problema` text NOT NULL,
  `descricao_recebimento` text NOT NULL,
  `descricao_servico` text NOT NULL,
  `observacao` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordem_servico_id`),
  KEY `k_ordem_servico_1` (`empresa_id`),
  KEY `k_ordem_servico_2` (`cliente_id`),
  KEY `k_ordem_servico_3` (`colaborador_id`),
  KEY `k_ordem_servico_4` (`veiculo_id`),
  CONSTRAINT `fk_ordem_servico_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_ordem_servico_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_ordem_servico_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_ordem_servico_4` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico_anexo`
--

DROP TABLE IF EXISTS `ordem_servico_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico_anexo` (
  `ordem_servico_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordem_servico_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordem_servico_anexo_id`),
  KEY `k_ordem_servico_anexo_1` (`ordem_servico_id`),
  CONSTRAINT `fk_ordem_servico_anexo_1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`ordem_servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_anexo`
--

LOCK TABLES `ordem_servico_anexo` WRITE;
/*!40000 ALTER TABLE `ordem_servico_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico_atividade`
--

DROP TABLE IF EXISTS `ordem_servico_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico_atividade` (
  `ordem_servico_atividade_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordem_servico_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `atividade` int(2) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `data_hora_previsao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_entrega` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ordem_servico_anexo_id` int(11) DEFAULT NULL,
  `descricao_problema` text NOT NULL,
  `descricao_recebimento` text NOT NULL,
  `descricao_servico` text NOT NULL,
  PRIMARY KEY (`ordem_servico_atividade_id`),
  KEY `k_ordem_servico_atividade_1` (`ordem_servico_id`),
  KEY `k_ordem_servico_atividade_2` (`usuario_id`),
  KEY `k_ordem_servico_atividade_3` (`colaborador_id`),
  KEY `k_ordem_servico_atividade_4` (`ordem_servico_anexo_id`),
  CONSTRAINT `fk_ordem_servico_atividade_1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`ordem_servico_id`),
  CONSTRAINT `fk_ordem_servico_atividade_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_ordem_servico_atividade_4` FOREIGN KEY (`ordem_servico_anexo_id`) REFERENCES `ordem_servico_anexo` (`ordem_servico_anexo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_atividade`
--

LOCK TABLES `ordem_servico_atividade` WRITE;
/*!40000 ALTER TABLE `ordem_servico_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico_comentario`
--

DROP TABLE IF EXISTS `ordem_servico_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico_comentario` (
  `ordem_servico_comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordem_servico_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `comentario` text NOT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordem_servico_comentario_id`),
  KEY `k_ordem_servico_comentario_1` (`ordem_servico_id`),
  KEY `k_ordem_servico_comentario_2` (`usuario_id`),
  CONSTRAINT `fk_ordem_servico_comentario_1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`ordem_servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_comentario`
--

LOCK TABLES `ordem_servico_comentario` WRITE;
/*!40000 ALTER TABLE `ordem_servico_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `pagamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagamento_id`),
  KEY `k_pagamento_1` (`conta_id`),
  CONSTRAINT `fk_pagamento_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,'2022-10-19',200.00,0.00,0.00,200.00,0);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_cancelado`
--

DROP TABLE IF EXISTS `pagamento_cancelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento_cancelado` (
  `pagamento_cancelado_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagamento_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`pagamento_cancelado_id`),
  KEY `k_pagamento_cancelado_1` (`pagamento_id`),
  CONSTRAINT `fk_pagamento_cancelado_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_cancelado`
--

LOCK TABLES `pagamento_cancelado` WRITE;
/*!40000 ALTER TABLE `pagamento_cancelado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento_cancelado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_cancelado_pagar`
--

DROP TABLE IF EXISTS `pagamento_cancelado_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento_cancelado_pagar` (
  `pagamento_cancelado_id` int(11) NOT NULL DEFAULT '0',
  `pagamento_id` int(11) NOT NULL DEFAULT '0',
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagamento_cancelado_id`,`pagamento_id`,`pagar_id`),
  KEY `k_pagamento_cancelado_pagar_1` (`pagamento_cancelado_id`),
  KEY `k_pagamento_cancelado_pagar_2` (`pagamento_id`),
  KEY `k_pagamento_cancelado_pagar_3` (`pagar_id`),
  CONSTRAINT `fk_pagamento_cancelado_pagar_1` FOREIGN KEY (`pagamento_cancelado_id`) REFERENCES `pagamento_cancelado` (`pagamento_cancelado_id`),
  CONSTRAINT `fk_pagamento_cancelado_pagar_2` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`pagamento_id`),
  CONSTRAINT `fk_pagamento_cancelado_pagar_3` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_cancelado_pagar`
--

LOCK TABLES `pagamento_cancelado_pagar` WRITE;
/*!40000 ALTER TABLE `pagamento_cancelado_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento_cancelado_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_pagar`
--

DROP TABLE IF EXISTS `pagamento_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento_pagar` (
  `pagamento_pagar_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagamento_id` int(11) NOT NULL DEFAULT '0',
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagamento_pagar_id`),
  UNIQUE KEY `uk_pagamento_pagar_1` (`pagamento_id`,`pagar_id`),
  KEY `k_pagamento_pagar_1` (`pagamento_id`),
  KEY `k_pagamento_pagar_2` (`pagar_id`),
  CONSTRAINT `fk_pagamento_pagar_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`pagamento_id`),
  CONSTRAINT `fk_pagamento_pagar_2` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_pagar`
--

LOCK TABLES `pagamento_pagar` WRITE;
/*!40000 ALTER TABLE `pagamento_pagar` DISABLE KEYS */;
INSERT INTO `pagamento_pagar` VALUES (1,1,3,200.00,0.00,0.00,200.00,0);
/*!40000 ALTER TABLE `pagamento_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_pagar_categoria`
--

DROP TABLE IF EXISTS `pagamento_pagar_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento_pagar_categoria` (
  `pagamento_pagar_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`pagamento_pagar_id`,`categoria_id`),
  KEY `k_pagamento_pagar_categoria_1` (`pagamento_pagar_id`),
  KEY `k_pagamento_pagar_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_pagamento_pagar_categoria_1` FOREIGN KEY (`pagamento_pagar_id`) REFERENCES `pagamento_pagar` (`pagamento_pagar_id`),
  CONSTRAINT `fk_pagamento_pagar_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_pagar_categoria`
--

LOCK TABLES `pagamento_pagar_categoria` WRITE;
/*!40000 ALTER TABLE `pagamento_pagar_categoria` DISABLE KEYS */;
INSERT INTO `pagamento_pagar_categoria` VALUES (1,121,200.00);
/*!40000 ALTER TABLE `pagamento_pagar_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar`
--

DROP TABLE IF EXISTS `pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar` (
  `pagar_id` int(11) NOT NULL AUTO_INCREMENT,
  `importacao_pagar_id` varchar(20) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `compra_id` int(11) DEFAULT NULL,
  `emprestimo_id` int(11) DEFAULT NULL,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `documento` varchar(30) NOT NULL DEFAULT '',
  `emissao` date NOT NULL DEFAULT '0001-01-01',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `observacao` text NOT NULL,
  `substituido` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagar_id`),
  KEY `k_pagar_1` (`empresa_id`),
  KEY `k_pagar_2` (`fornecedor_id`),
  KEY `k_pagar_3` (`compra_id`),
  KEY `k_pagar_4` (`emprestimo_id`),
  KEY `k_pagar_5` (`conta_id`),
  CONSTRAINT `fk_pagar_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_pagar_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_pagar_3` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_pagar_4` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimo` (`emprestimo_id`),
  CONSTRAINT `fk_pagar_5` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,3,3,2,NULL,1,'1','2022-10-19','2022-10-29','0001-01-01',30.00,0.00,0.00,0.00,'',0,0),(2,NULL,3,3,2,NULL,1,'2','2022-10-19','2022-11-18','0001-01-01',70.00,0.00,0.00,0.00,'',0,0),(3,NULL,3,3,9,NULL,1,'10','2022-10-19','2022-10-29','2022-10-19',200.00,0.00,0.00,200.00,'',0,0),(4,NULL,3,3,9,NULL,1,'20','2022-10-19','2022-11-18','0001-01-01',300.00,0.00,0.00,0.00,'',0,1),(5,NULL,3,3,10,NULL,1,'10','2022-10-19','2022-10-29','0001-01-01',250.00,0.00,0.00,0.00,'',0,0),(6,NULL,3,3,10,NULL,1,'20','2022-10-19','2022-11-18','0001-01-01',450.00,0.00,0.00,0.00,'',0,0),(7,NULL,3,3,NULL,NULL,1,'0000000007','2022-10-19','2022-11-19','0001-01-01',5.00,0.00,0.00,0.00,'',0,0),(8,NULL,3,7,NULL,NULL,1,'0000000007','2022-10-19','2022-11-19','0001-01-01',5.00,0.00,0.00,0.00,'',0,0);
/*!40000 ALTER TABLE `pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar_anexo`
--

DROP TABLE IF EXISTS `pagar_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar_anexo` (
  `pagar_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`pagar_anexo_id`),
  KEY `k_pagar_anexo_1` (`pagar_id`),
  CONSTRAINT `fk_pagar_anexo_1` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar_anexo`
--

LOCK TABLES `pagar_anexo` WRITE;
/*!40000 ALTER TABLE `pagar_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagar_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar_categoria`
--

DROP TABLE IF EXISTS `pagar_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar_categoria` (
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`pagar_id`,`categoria_id`),
  KEY `k_pagar_categoria_1` (`pagar_id`),
  KEY `k_pagar_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_pagar_categoria_1` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_pagar_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar_categoria`
--

LOCK TABLES `pagar_categoria` WRITE;
/*!40000 ALTER TABLE `pagar_categoria` DISABLE KEYS */;
INSERT INTO `pagar_categoria` VALUES (1,121,100.0000),(2,121,100.0000),(3,121,100.0000),(4,121,100.0000),(5,121,100.0000),(6,121,100.0000),(7,141,100.0000),(8,141,100.0000);
/*!40000 ALTER TABLE `pagar_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar_centro_resultado`
--

DROP TABLE IF EXISTS `pagar_centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar_centro_resultado` (
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`pagar_id`,`centro_resultado_id`),
  KEY `k_pagar_centro_resultado_1` (`pagar_id`),
  KEY `k_pagar_centro_resultado_2` (`centro_resultado_id`),
  CONSTRAINT `fk_pagar_centro_resultado_1` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_pagar_centro_resultado_2` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar_centro_resultado`
--

LOCK TABLES `pagar_centro_resultado` WRITE;
/*!40000 ALTER TABLE `pagar_centro_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagar_centro_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar_conta_contabil`
--

DROP TABLE IF EXISTS `pagar_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar_conta_contabil` (
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagar_id`,`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_pagar_conta_contabil_1` (`pagar_id`),
  KEY `k_pagar_conta_contabil_2` (`categoria_id`),
  KEY `k_pagar_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_pagar_conta_contabil_4` (`pagar_id`,`categoria_id`),
  CONSTRAINT `fk_pagar_conta_contabil_1` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_pagar_conta_contabil_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_pagar_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_pagar_conta_contabil_4` FOREIGN KEY (`pagar_id`, `categoria_id`) REFERENCES `pagar_categoria` (`pagar_id`, `categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar_conta_contabil`
--

LOCK TABLES `pagar_conta_contabil` WRITE;
/*!40000 ALTER TABLE `pagar_conta_contabil` DISABLE KEYS */;
INSERT INTO `pagar_conta_contabil` VALUES (1,89,5,3,100.0000,1),(1,89,37,1,100.0000,1),(1,89,83,1,100.0000,1),(2,89,5,3,100.0000,1),(2,89,37,1,100.0000,1),(2,89,83,1,100.0000,1),(3,89,5,3,100.0000,1),(3,89,37,1,100.0000,1),(3,89,83,1,100.0000,1),(4,89,5,3,100.0000,1),(4,89,37,1,100.0000,1),(4,89,83,1,100.0000,1),(5,89,5,3,100.0000,1),(5,89,37,1,100.0000,1),(5,89,83,1,100.0000,1),(6,89,5,3,100.0000,1),(6,89,37,1,100.0000,1),(6,89,83,1,100.0000,1);
/*!40000 ALTER TABLE `pagar_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagar_substituido`
--

DROP TABLE IF EXISTS `pagar_substituido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagar_substituido` (
  `pagar_id` int(11) NOT NULL DEFAULT '0',
  `pagar_substituido_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagar_id`,`pagar_substituido_id`),
  KEY `k_pagar_substituido_1` (`pagar_id`),
  KEY `k_pagar_substituido_2` (`pagar_substituido_id`),
  CONSTRAINT `fk_pagar_substituido_1` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_pagar_substituido_2` FOREIGN KEY (`pagar_substituido_id`) REFERENCES `pagar` (`pagar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar_substituido`
--

LOCK TABLES `pagar_substituido` WRITE;
/*!40000 ALTER TABLE `pagar_substituido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagar_substituido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato`
--

DROP TABLE IF EXISTS `parceiro_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato` (
  `parceiro_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `parceiro_id` int(11) NOT NULL DEFAULT '0',
  `codigo` varchar(30) NOT NULL DEFAULT '',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `atendimento` int(1) NOT NULL DEFAULT '0',
  `faturamento` int(1) NOT NULL DEFAULT '0',
  `financeiro` int(1) NOT NULL DEFAULT '0',
  `remuneracao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `desconto` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `data_fim` date NOT NULL DEFAULT '0001-01-01',
  `documento_receber` int(1) NOT NULL DEFAULT '0',
  `documento_fiscal` int(1) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parceiro_contrato_id`),
  KEY `k_parceiro_contrato_1` (`empresa_id`),
  KEY `k_parceiro_contrato_2` (`parceiro_id`),
  CONSTRAINT `fk_parceiro_contrato_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_parceiro_contrato_2` FOREIGN KEY (`parceiro_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato`
--

LOCK TABLES `parceiro_contrato` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_anexo`
--

DROP TABLE IF EXISTS `parceiro_contrato_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_anexo` (
  `parceiro_contrato_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`parceiro_contrato_anexo_id`),
  KEY `k_parceiro_contrato_anexo_1` (`parceiro_contrato_id`),
  CONSTRAINT `fk_parceiro_contrato_anexo_1` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_anexo`
--

LOCK TABLES `parceiro_contrato_anexo` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_cidade`
--

DROP TABLE IF EXISTS `parceiro_contrato_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_cidade` (
  `cep` varchar(10) NOT NULL DEFAULT '',
  `cidade` varchar(50) NOT NULL DEFAULT '',
  `uf` char(2) NOT NULL DEFAULT '',
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `exclusivo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cep`),
  KEY `k_parceiro_contrato_cidade_1` (`parceiro_contrato_id`),
  CONSTRAINT `fk_parceiro_contrato_cidade_1` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_cidade`
--

LOCK TABLES `parceiro_contrato_cidade` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_conta`
--

DROP TABLE IF EXISTS `parceiro_contrato_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_conta` (
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `pagar_receber` char(1) NOT NULL DEFAULT '',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `vencimento_tipo` int(1) NOT NULL DEFAULT '0',
  `vencimento_dia` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parceiro_contrato_id`,`pagar_receber`),
  KEY `k_parceiro_contrato_conta_1` (`conta_id`),
  KEY `k_parceiro_contrato_conta_2` (`categoria_id`),
  CONSTRAINT `fk_parceiro_contrato_conta_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_parceiro_contrato_conta_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_conta`
--

LOCK TABLES `parceiro_contrato_conta` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_faixa`
--

DROP TABLE IF EXISTS `parceiro_contrato_faixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_faixa` (
  `parceiro_contrato_faixa_id` int(11) NOT NULL AUTO_INCREMENT,
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `minimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `maximo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`parceiro_contrato_faixa_id`),
  KEY `k_parceiro_contrato_faixa_1` (`parceiro_contrato_id`),
  CONSTRAINT `fk_parceiro_contrato_faixa_1` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_faixa`
--

LOCK TABLES `parceiro_contrato_faixa` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_faixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_faixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_produto`
--

DROP TABLE IF EXISTS `parceiro_contrato_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_produto` (
  `parceiro_contrato_produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `base_calculo` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`parceiro_contrato_produto_id`),
  UNIQUE KEY `uk_parceiro_contrato_produto_1` (`parceiro_contrato_id`,`produto_id`,`modulo_id`),
  KEY `k_parceiro_contrato_produto_1` (`parceiro_contrato_id`),
  KEY `k_parceiro_contrato_produto_2` (`produto_id`),
  KEY `k_parceiro_contrato_produto_3` (`modulo_id`),
  CONSTRAINT `fk_parceiro_contrato_produto_1` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`),
  CONSTRAINT `fk_parceiro_contrato_produto_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_produto`
--

LOCK TABLES `parceiro_contrato_produto` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_contrato_servico`
--

DROP TABLE IF EXISTS `parceiro_contrato_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parceiro_contrato_servico` (
  `parceiro_contrato_servico_id` int(11) NOT NULL AUTO_INCREMENT,
  `parceiro_contrato_id` int(11) NOT NULL DEFAULT '0',
  `servico_id` int(11) NOT NULL DEFAULT '0',
  `base_calculo` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`parceiro_contrato_servico_id`),
  UNIQUE KEY `uk_parceiro_contrato_servico_1` (`parceiro_contrato_id`,`servico_id`),
  KEY `k_parceiro_contrato_servico_1` (`parceiro_contrato_id`),
  KEY `k_parceiro_contrato_servico_2` (`servico_id`),
  CONSTRAINT `fk_parceiro_contrato_servico_1` FOREIGN KEY (`parceiro_contrato_id`) REFERENCES `parceiro_contrato` (`parceiro_contrato_id`),
  CONSTRAINT `fk_parceiro_contrato_servico_2` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_servico`
--

LOCK TABLES `parceiro_contrato_servico` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_contrato_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdv`
--

DROP TABLE IF EXISTS `pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdv` (
  `pdv_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(4) DEFAULT NULL,
  `identificador` varchar(50) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pdv_id`),
  UNIQUE KEY `uk_pdv_1` (`empresa_id`,`numero`),
  KEY `k_pdv_1` (`empresa_id`),
  KEY `k_pdv_2` (`usuario_id`),
  KEY `k_pdv_3` (`conta_id`),
  CONSTRAINT `fk_pdv_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_pdv_3` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdv`
--

LOCK TABLES `pdv` WRITE;
/*!40000 ALTER TABLE `pdv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `pessoa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fisica_juridica` char(1) NOT NULL DEFAULT '',
  `regime_tributario` int(1) NOT NULL DEFAULT '0',
  `nome_razao_social` varchar(100) NOT NULL DEFAULT '',
  `nome_fantasia` varchar(100) NOT NULL DEFAULT '',
  `cpf` varchar(11) DEFAULT NULL,
  `identidade` varchar(20) NOT NULL DEFAULT '',
  `cnpj` varchar(14) DEFAULT NULL,
  `inscricao_estadual` varchar(20) NOT NULL DEFAULT '',
  `inscricao_municipal` varchar(20) NOT NULL DEFAULT '',
  `inscricao_estadual_produtor_rural` varchar(20) NOT NULL DEFAULT '',
  `contribuinte` int(1) NOT NULL DEFAULT '0',
  `crc` varchar(15) NOT NULL DEFAULT '',
  `apelido` varchar(30) NOT NULL DEFAULT '',
  `nome_pai` varchar(100) NOT NULL DEFAULT '',
  `nome_mae` varchar(100) NOT NULL DEFAULT '',
  `data_nascimento` date NOT NULL DEFAULT '0001-01-01',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`pessoa_id`),
  UNIQUE KEY `uk_pessoa_1` (`cpf`),
  UNIQUE KEY `uk_pessoa_2` (`cnpj`),
  KEY `k_pessoa_1` (`usuario_id`),
  KEY `k_pessoa_2` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,'0001-01-01 00:00:00'),(2,'J',1,'João','João',NULL,'','16629339000191','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-10-19 08:55:20'),(3,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-10-19 08:55:20'),(4,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','CPR15725',9,'','','','','1999-11-29',0,0,'2022-10-19 08:57:42'),(5,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,'2022-10-19 08:55:24'),(6,'J',1,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-10-19 08:57:16'),(7,'F',0,'Vendedor excluído','','37077148610','1348213',NULL,'','','',0,'','','','','2002-10-19',0,0,'2022-10-19 08:57:23'),(8,'J',2,'Leonardo e Breno Comercio de Bebidas Ltda','Leonardo e Breno Comercio de Bebidas Ltda',NULL,'','18206937000183','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-10-19 08:57:30'),(9,'F',0,'Eliane Bianca Freitas','','80577321560','MG123',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-10-19 08:57:42');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_contato`
--

DROP TABLE IF EXISTS `pessoa_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_contato` (
  `pessoa_contato_id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `empresa_contato_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `contato` varchar(50) NOT NULL DEFAULT '',
  `observacao` text NOT NULL,
  PRIMARY KEY (`pessoa_contato_id`),
  KEY `k_pessoa_contato_1` (`pessoa_id`),
  KEY `k_pessoa_contato_2` (`empresa_contato_id`),
  CONSTRAINT `fk_pessoa_contato_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,3,2,'037998653157',''),(2,1,24,3,'037999887766',''),(3,3,0,1,'(037) 2594-1157',''),(5,4,0,2,'(011) 4191-4433',''),(7,5,0,2,'(011) 4191-4433',''),(8,6,0,2,'(37) 3261-9150','');
/*!40000 ALTER TABLE `pessoa_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_empresa`
--

DROP TABLE IF EXISTS `pessoa_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_empresa` (
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `veiculo_venda` int(1) NOT NULL DEFAULT '0',
  `limite_credito` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_credito` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bloqueado` tinyint(1) NOT NULL DEFAULT '0',
  `comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `vendedor_id` int(11) DEFAULT NULL,
  `reserva` date NOT NULL DEFAULT '0001-01-01',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pessoa_id`,`empresa_id`,`tipo`),
  KEY `k_pessoa_empresa_1` (`pessoa_id`),
  KEY `k_pessoa_empresa_2` (`empresa_id`),
  KEY `k_pessoa_empresa_3` (`vendedor_id`),
  CONSTRAINT `fk_pessoa_empresa_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_pessoa_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_pessoa_empresa_3` FOREIGN KEY (`vendedor_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_empresa`
--

LOCK TABLES `pessoa_empresa` WRITE;
/*!40000 ALTER TABLE `pessoa_empresa` DISABLE KEYS */;
INSERT INTO `pessoa_empresa` VALUES (2,3,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(5,3,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,3,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,3,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,1),(8,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
/*!40000 ALTER TABLE `pessoa_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_endereco`
--

DROP TABLE IF EXISTS `pessoa_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_endereco` (
  `pessoa_endereco_id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `empresa_endereco_id` int(11) NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`pessoa_endereco_id`),
  KEY `k_pessoa_endereco_1` (`pessoa_id`),
  KEY `k_pessoa_endereco_2` (`empresa_endereco_id`),
  CONSTRAINT `fk_pessoa_endereco_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,4,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1),(2,2,0,'Av. Benedito','S','Mangabeiras','','35590000','Lagoa da Prata','MG','3137205','',1),(3,3,0,'Av. Brasil','555','Centro','Loja 1','35580000','Lagoa da Prata','MG','3137205','',1),(5,4,0,'Av. Chedid Jafet','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1),(7,5,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1),(8,6,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1);
/*!40000 ALTER TABLE `pessoa_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_tipo`
--

DROP TABLE IF EXISTS `pessoa_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_tipo` (
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `importacao_pessoa_id` varchar(20) DEFAULT NULL,
  `tipo` int(2) NOT NULL DEFAULT '0',
  `observacao` text NOT NULL,
  PRIMARY KEY (`pessoa_id`,`tipo`),
  KEY `k_pessoa_tipo_1` (`pessoa_id`),
  CONSTRAINT `fk_pessoa_tipo_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_tipo`
--

LOCK TABLES `pessoa_tipo` WRITE;
/*!40000 ALTER TABLE `pessoa_tipo` DISABLE KEYS */;
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,8,''),(3,NULL,2,''),(4,NULL,1,''),(5,NULL,5,''),(6,NULL,3,''),(7,NULL,5,''),(8,NULL,2,''),(9,NULL,1,'');
/*!40000 ALTER TABLE `pessoa_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_veiculo`
--

DROP TABLE IF EXISTS `pessoa_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_veiculo` (
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `veiculo_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pessoa_id`,`veiculo_id`),
  KEY `k_pessoa_veiculo_1` (`pessoa_id`),
  KEY `k_pessoa_veiculo_2` (`veiculo_id`),
  CONSTRAINT `fk_pessoa_veiculo_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_pessoa_veiculo_2` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_veiculo`
--

LOCK TABLES `pessoa_veiculo` WRITE;
/*!40000 ALTER TABLE `pessoa_veiculo` DISABLE KEYS */;
INSERT INTO `pessoa_veiculo` VALUES (4,1),(4,2);
/*!40000 ALTER TABLE `pessoa_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pix`
--

DROP TABLE IF EXISTS `pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pix` (
  `pix_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tarifa` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '0',
  `pensebank_hash` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pix_id`),
  KEY `k_pix_1` (`empresa_id`),
  CONSTRAINT `fk_pix_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pix`
--

LOCK TABLES `pix` WRITE;
/*!40000 ALTER TABLE `pix` DISABLE KEYS */;
/*!40000 ALTER TABLE `pix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_pagamento`
--

DROP TABLE IF EXISTS `plano_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_pagamento` (
  `plano_pagamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `grupo_pagamento` int(2) NOT NULL DEFAULT '0',
  `parcelamento` int(1) NOT NULL DEFAULT '0',
  `vencimento` int(3) NOT NULL DEFAULT '0',
  `edita` tinyint(1) NOT NULL DEFAULT '0',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`plano_pagamento_id`),
  UNIQUE KEY `uk_plano_pagamento_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento`
--

LOCK TABLES `plano_pagamento` WRITE;
/*!40000 ALTER TABLE `plano_pagamento` DISABLE KEYS */;
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-10-19 08:56:08'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-10-19 08:56:08'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-10-19 08:56:08'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-10-19 08:56:08'),(5,NULL,'À vista',1,1,0,0,0,'2022-10-19 08:56:07'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2022-10-19 08:56:08'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2022-10-19 08:56:08'),(8,NULL,'À prazo Entrada/30/45/60/75/90',2,4,1,0,0,'2022-10-19 08:56:08'),(9,NULL,'Vencimento dia 10 do próximo mês',2,4,4,10,0,'2022-10-19 08:56:08');
/*!40000 ALTER TABLE `plano_pagamento` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_plano_pagamento before insert on plano_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.nome';
    end if;
    if new.pagamento not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.grupo_pagamento';
    end if;
    if new.parcelamento not in (0,1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.parcelamento';
    end if;
    if new.vencimento < 0 or new.vencimento > 31 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.vencimento';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.atualizado';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_plano_pagamento before update on plano_pagamento for each row
begin
    if new.nome = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.nome';
    end if;
    if new.pagamento not in (1,2) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.pagamento';
    end if;
    if new.grupo_pagamento not in (1,2,3,4,5,6,99) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.grupo_pagamento';
    end if;
    if new.parcelamento not in (0,1,2,3,4,5) then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.parcelamento';
    end if;
    if new.vencimento < 0 or new.vencimento > 31 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.vencimento';
    end if;
    if new.atualizado = '' then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento.atualizado';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plano_pagamento_empresa`
--

DROP TABLE IF EXISTS `plano_pagamento_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_pagamento_empresa` (
  `plano_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plano_pagamento_id`,`empresa_id`),
  KEY `k_plano_pagamento_empresa_1` (`plano_pagamento_id`),
  KEY `k_plano_pagamento_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_plano_pagamento_empresa_1` FOREIGN KEY (`plano_pagamento_id`) REFERENCES `plano_pagamento` (`plano_pagamento_id`),
  CONSTRAINT `fk_plano_pagamento_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento_empresa`
--

LOCK TABLES `plano_pagamento_empresa` WRITE;
/*!40000 ALTER TABLE `plano_pagamento_empresa` DISABLE KEYS */;
INSERT INTO `plano_pagamento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,0,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0);
/*!40000 ALTER TABLE `plano_pagamento_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano_pagamento_prazo`
--

DROP TABLE IF EXISTS `plano_pagamento_prazo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_pagamento_prazo` (
  `plano_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `prazo` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plano_pagamento_id`,`prazo`),
  KEY `k_plano_pagamento_prazo_1` (`plano_pagamento_id`),
  CONSTRAINT `fk_plano_pagamento_prazo_1` FOREIGN KEY (`plano_pagamento_id`) REFERENCES `plano_pagamento` (`plano_pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento_prazo`
--

LOCK TABLES `plano_pagamento_prazo` WRITE;
/*!40000 ALTER TABLE `plano_pagamento_prazo` DISABLE KEYS */;
INSERT INTO `plano_pagamento_prazo` VALUES (2,30),(3,30),(3,60),(4,30),(4,60),(4,90),(6,30),(6,60),(6,90),(8,0),(8,30),(8,45),(8,60),(8,75),(8,90);
/*!40000 ALTER TABLE `plano_pagamento_prazo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_plano_pagamento_prazo before insert on plano_pagamento_prazo for each row
begin
    if new.prazo < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento_prazo.prazo';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_plano_pagamento_prazo before update on plano_pagamento_prazo for each row
begin
    if new.prazo < 0 then
        signal sqlstate '45000' set message_text = 'invalid value: plano_pagamento_prazo.prazo';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `importacao_produto_id` varchar(20) DEFAULT NULL,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `regra_tributaria_id` int(11) DEFAULT NULL,
  `referencia` varchar(30) NOT NULL DEFAULT '',
  `produto_grupo_id` int(11) DEFAULT NULL,
  `produto_unidade_id` int(11) DEFAULT NULL,
  `origem_cst` int(11) NOT NULL DEFAULT '0',
  `codigo_ncm` varchar(11) NOT NULL DEFAULT '',
  `codigo_cest` varchar(8) NOT NULL DEFAULT '',
  `codigo_anp` varchar(10) NOT NULL DEFAULT '',
  `codigo_codif` varchar(10) NOT NULL DEFAULT '',
  `codigo_servico` char(6) NOT NULL DEFAULT '',
  `ciap_vida_util` int(11) NOT NULL DEFAULT '0',
  `ciap_numero_parcela` int(11) NOT NULL DEFAULT '0',
  `ciap_funcao_bem` text NOT NULL,
  `embalagem` int(11) NOT NULL DEFAULT '0',
  `url_imagem` varchar(500) NOT NULL DEFAULT '',
  `interno` tinyint(1) NOT NULL DEFAULT '0',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`produto_id`),
  KEY `k_produto_1` (`regra_tributaria_id`),
  KEY `k_produto_2` (`produto_grupo_id`),
  KEY `k_produto_3` (`produto_unidade_id`),
  CONSTRAINT `fk_produto_1` FOREIGN KEY (`regra_tributaria_id`) REFERENCES `regra_tributaria` (`regra_tributaria_id`),
  CONSTRAINT `fk_produto_2` FOREIGN KEY (`produto_grupo_id`) REFERENCES `produto_grupo` (`produto_grupo_id`),
  CONSTRAINT `fk_produto_3` FOREIGN KEY (`produto_unidade_id`) REFERENCES `produto_unidade` (`produto_unidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,NULL,'Arroz Codil Tipo 1','',0,3,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(2,NULL,'Café','',0,NULL,'',1,1,0,'10064000','','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(3,NULL,'Fósforo','',0,3,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(4,NULL,'Troca de óleo','Troca de óleo',9,NULL,'',1,1,0,'','','','','',0,0,'',0,'',0,'2022-10-19 08:57:43'),(5,NULL,'Coca-Cola 2L','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(6,NULL,'Produto teste','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(7,NULL,'Feijão Carioca','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-10-19 08:55:29'),(8,NULL,'Manutenção de computadores','Manutenção de computadores',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-19 08:57:43');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_codigo_ean`
--

DROP TABLE IF EXISTS `produto_codigo_ean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_codigo_ean` (
  `produto_codigo_ean_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `codigo_ean` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`produto_codigo_ean_id`),
  UNIQUE KEY `uk_produto_codigo_ean_1` (`produto_id`,`produto_grade_id`,`codigo_ean`),
  KEY `k_produto_codigo_ean_1` (`produto_id`),
  KEY `k_produto_codigo_ean_2` (`produto_grade_id`),
  CONSTRAINT `fk_produto_codigo_ean_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_codigo_ean_2` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_codigo_ean`
--

LOCK TABLES `produto_codigo_ean` WRITE;
/*!40000 ALTER TABLE `produto_codigo_ean` DISABLE KEYS */;
INSERT INTO `produto_codigo_ean` VALUES (1,1,NULL,'7891098000163'),(2,2,NULL,'7891040105427'),(3,7,NULL,'7896422505390');
/*!40000 ALTER TABLE `produto_codigo_ean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_desconto`
--

DROP TABLE IF EXISTS `produto_desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_desconto` (
  `produto_desconto_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`produto_desconto_id`),
  UNIQUE KEY `uk_produto_desconto_1` (`empresa_id`,`produto_id`,`tipo`,`quantidade`),
  KEY `k_produto_desconto_1` (`empresa_id`),
  KEY `k_produto_desconto_2` (`produto_id`),
  CONSTRAINT `fk_produto_desconto_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_produto_desconto_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_desconto`
--

LOCK TABLES `produto_desconto` WRITE;
/*!40000 ALTER TABLE `produto_desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_empresa`
--

DROP TABLE IF EXISTS `produto_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_empresa` (
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `enotas_codigo_servico` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_id`,`empresa_id`),
  KEY `k_produto_empresa_1` (`produto_id`),
  KEY `k_produto_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_produto_empresa_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_empresa`
--

LOCK TABLES `produto_empresa` WRITE;
/*!40000 ALTER TABLE `produto_empresa` DISABLE KEYS */;
INSERT INTO `produto_empresa` VALUES (1,3,0,1,0),(2,3,0,1,0),(3,3,0,1,0),(4,3,0,1,0),(5,3,0,1,0),(6,3,0,1,0),(7,3,0,1,0),(8,3,0,1,0);
/*!40000 ALTER TABLE `produto_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_estoque`
--

DROP TABLE IF EXISTS `produto_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_estoque` (
  `produto_estoque_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `localizacao` varchar(50) NOT NULL DEFAULT '',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `compra` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `venda` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`produto_estoque_id`),
  UNIQUE KEY `uk_produto_estoque_1` (`produto_id`,`produto_grade_id`,`produto_lote_id`,`empresa_id`,`estoque_id`),
  KEY `k_produto_estoque_1` (`produto_id`),
  KEY `k_produto_estoque_2` (`produto_grade_id`),
  KEY `k_produto_estoque_3` (`produto_lote_id`),
  KEY `k_produto_estoque_4` (`empresa_id`),
  KEY `k_produto_estoque_5` (`estoque_id`),
  CONSTRAINT `fk_produto_estoque_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_estoque_2` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_produto_estoque_3` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_produto_estoque_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_produto_estoque_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,3,NULL,NULL,3,1,'',26.0000,50.0000,64.0000),(2,5,NULL,NULL,3,1,'',20.0000,20.0000,0.0000),(3,1,1,NULL,3,1,'',108.0000,50.0000,10.0000),(4,7,NULL,NULL,3,1,'',0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_fornecedor` (
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id` int(11) NOT NULL DEFAULT '0',
  `codigo_produto_fornecedor` varchar(60) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_id`,`fornecedor_id`,`codigo_produto_fornecedor`),
  KEY `k_produto_fornecedor_1` (`produto_id`),
  KEY `k_produto_fornecedor_2` (`fornecedor_id`),
  CONSTRAINT `fk_produto_fornecedor_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_fornecedor_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_grade`
--

DROP TABLE IF EXISTS `produto_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_grade` (
  `produto_grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `grade` varchar(30) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_grade_id`),
  KEY `k_produto_grade_1` (`produto_id`),
  CONSTRAINT `fk_produto_grade_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grade`
--

LOCK TABLES `produto_grade` WRITE;
/*!40000 ALTER TABLE `produto_grade` DISABLE KEYS */;
INSERT INTO `produto_grade` VALUES (1,1,'P',1,0),(2,6,'Grade teste',0,0),(3,1,'M',1,0);
/*!40000 ALTER TABLE `produto_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_grupo`
--

DROP TABLE IF EXISTS `produto_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_grupo` (
  `produto_grupo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`produto_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Geral','2022-10-19 08:55:29');
/*!40000 ALTER TABLE `produto_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_grupo_empresa`
--

DROP TABLE IF EXISTS `produto_grupo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_grupo_empresa` (
  `produto_grupo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_grupo_id`,`empresa_id`),
  KEY `k_produto_grupo_empresa_1` (`produto_grupo_id`),
  KEY `k_produto_grupo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_produto_grupo_empresa_1` FOREIGN KEY (`produto_grupo_id`) REFERENCES `produto_grupo` (`produto_grupo_id`),
  CONSTRAINT `fk_produto_grupo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo_empresa`
--

LOCK TABLES `produto_grupo_empresa` WRITE;
/*!40000 ALTER TABLE `produto_grupo_empresa` DISABLE KEYS */;
INSERT INTO `produto_grupo_empresa` VALUES (1,3,1,0);
/*!40000 ALTER TABLE `produto_grupo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_inventario`
--

DROP TABLE IF EXISTS `produto_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_inventario` (
  `produto_inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_medio` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`produto_inventario_id`),
  KEY `k_produto_inventario_1` (`empresa_id`),
  KEY `k_produto_inventario_2` (`produto_id`),
  CONSTRAINT `fk_produto_inventario_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_produto_inventario_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_inventario`
--

LOCK TABLES `produto_inventario` WRITE;
/*!40000 ALTER TABLE `produto_inventario` DISABLE KEYS */;
INSERT INTO `produto_inventario` VALUES (8,3,1,'202209',58.0000,45.9674),(9,3,2,'202209',0.0000,5.8000),(10,3,3,'202209',40.0000,2.0000),(11,3,5,'202209',0.0000,5.0000),(12,3,6,'202209',0.0000,0.0000),(13,3,7,'202209',0.0000,8.0000);
/*!40000 ALTER TABLE `produto_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_lote`
--

DROP TABLE IF EXISTS `produto_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_lote` (
  `produto_lote_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `lote` varchar(20) NOT NULL DEFAULT '',
  `validade` date NOT NULL DEFAULT '0001-01-01',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_lote_id`),
  KEY `k_produto_lote_1` (`produto_id`),
  CONSTRAINT `fk_produto_lote_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_lote`
--

LOCK TABLES `produto_lote` WRITE;
/*!40000 ALTER TABLE `produto_lote` DISABLE KEYS */;
INSERT INTO `produto_lote` VALUES (1,2,'LT 1','0001-01-01',1,0),(2,2,'LT354RA48','0001-01-01',1,0);
/*!40000 ALTER TABLE `produto_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_movimento`
--

DROP TABLE IF EXISTS `produto_movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_movimento` (
  `produto_movimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `estoque_id` int(11) NOT NULL DEFAULT '0',
  `compra_id` int(11) DEFAULT NULL,
  `venda_id` int(11) DEFAULT NULL,
  `devolucao_compra_id` int(11) DEFAULT NULL,
  `devolucao_venda_id` int(11) DEFAULT NULL,
  `nfe_id` int(11) DEFAULT NULL,
  `data_hora_lancamento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_movimento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `entrada_saida` char(1) NOT NULL DEFAULT '',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `observacao` text NOT NULL,
  PRIMARY KEY (`produto_movimento_id`),
  KEY `k_produto_movimento_1` (`produto_id`),
  KEY `k_produto_movimento_2` (`produto_grade_id`),
  KEY `k_produto_movimento_3` (`produto_lote_id`),
  KEY `k_produto_movimento_4` (`empresa_id`),
  KEY `k_produto_movimento_5` (`estoque_id`),
  KEY `k_produto_movimento_6` (`compra_id`),
  KEY `k_produto_movimento_7` (`venda_id`),
  KEY `k_produto_movimento_8` (`devolucao_compra_id`),
  KEY `k_produto_movimento_9` (`devolucao_venda_id`),
  KEY `k_produto_movimento_10` (`nfe_id`),
  CONSTRAINT `fk_produto_movimento_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_movimento_10` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_produto_movimento_2` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_produto_movimento_3` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_produto_movimento_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_produto_movimento_5` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_produto_movimento_6` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_produto_movimento_7` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_produto_movimento_8` FOREIGN KEY (`devolucao_compra_id`) REFERENCES `devolucao_compra` (`devolucao_compra_id`),
  CONSTRAINT `fk_produto_movimento_9` FOREIGN KEY (`devolucao_venda_id`) REFERENCES `devolucao_venda` (`devolucao_venda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:00','2022-10-19 00:00:00','E',50.0000,''),(2,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:00','2022-10-19 00:00:00','E',20.0000,''),(3,1,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:00','2022-10-19 00:00:00','E',10.0000,''),(4,1,1,NULL,3,1,2,NULL,NULL,NULL,NULL,'2022-10-19 08:56:00','2022-10-19 00:00:00','E',10.0000,''),(5,1,1,NULL,3,1,7,NULL,NULL,NULL,NULL,'2022-10-19 08:56:02','2022-10-19 00:00:00','E',10.0000,''),(6,1,1,NULL,3,1,8,NULL,NULL,NULL,NULL,'2022-10-19 08:56:03','2022-10-19 00:00:00','E',10.0000,''),(7,1,1,NULL,3,1,9,NULL,NULL,NULL,NULL,'2022-10-19 08:56:03','2022-10-19 00:00:00','E',10.0000,''),(8,1,1,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-10-19 08:56:04','2022-10-19 00:00:00','E',10.0000,''),(9,3,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-10-19 08:56:04','2022-10-19 00:00:00','E',50.0000,''),(10,5,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-10-19 08:56:04','2022-10-19 00:00:00','E',20.0000,''),(11,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2022-10-19 08:56:04','2022-10-19 00:00:00','E',10.0000,''),(12,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2022-10-19 08:56:05','2022-10-19 00:00:00','E',10.0000,''),(13,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2022-10-19 08:56:05','2022-10-19 00:00:00','E',10.0000,''),(14,1,1,NULL,3,1,14,NULL,NULL,NULL,NULL,'2022-10-19 08:56:05','2022-10-19 00:00:00','E',10.0000,''),(15,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',50.0000,''),(16,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',20.0000,''),(17,1,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',10.0000,''),(18,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',10.0000,''),(19,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',10.0000,''),(20,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2022-10-19 08:56:06','2022-10-19 00:00:00','S',10.0000,''),(21,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:04','2022-10-19 08:57:03','S',15.0000,'Vencimento do produto'),(22,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:04','2022-10-19 08:57:04','E',25.0000,'Recontagem de estoqueo'),(23,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:04','2022-09-29 08:57:04','E',58.0000,'Balanço'),(24,3,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:04','2022-09-29 08:57:04','E',40.0000,'Balanço'),(25,3,NULL,NULL,3,1,NULL,11,NULL,NULL,NULL,'2022-10-19 08:57:07','2022-10-19 08:57:07','S',10.0000,''),(26,3,NULL,NULL,3,1,NULL,12,NULL,NULL,NULL,'2022-10-19 08:57:07','2022-10-19 08:57:07','S',1.0000,''),(27,3,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2022-10-19 08:57:07','2022-10-19 08:57:07','S',3.0000,''),(28,3,NULL,NULL,3,1,NULL,14,NULL,NULL,NULL,'2022-10-19 08:57:07','2022-10-19 08:57:07','S',1.0000,''),(29,1,1,NULL,3,1,NULL,16,NULL,NULL,NULL,'2022-10-19 08:57:15','2022-10-19 08:57:15','S',6.0000,''),(30,3,NULL,NULL,3,1,NULL,16,NULL,NULL,NULL,'2022-10-19 08:57:15','2022-10-19 08:57:15','S',50.0000,''),(31,1,1,NULL,3,1,NULL,17,NULL,NULL,NULL,'2022-10-19 08:57:15','2022-10-19 08:57:15','S',1.0000,''),(32,1,1,NULL,3,1,NULL,18,NULL,NULL,NULL,'2022-10-19 08:57:15','2022-10-19 08:57:15','S',3.0000,''),(33,3,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,'2022-10-19 08:57:29','2022-10-19 08:57:29','E',1.0000,''),(34,1,1,NULL,3,1,NULL,NULL,1,NULL,NULL,'2022-10-19 08:57:29','2022-10-19 08:57:29','S',10.0000,'');
/*!40000 ALTER TABLE `produto_movimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_preco`
--

DROP TABLE IF EXISTS `produto_preco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_preco` (
  `produto_preco_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `preco_custo` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_medio` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_ultimo` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda_medio` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda_ultimo` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `margem_lucro` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`produto_preco_id`),
  UNIQUE KEY `uk_produto_preco_1` (`produto_id`,`modulo_id`,`produto_grade_id`,`empresa_id`),
  KEY `k_produto_preco_1` (`produto_id`),
  KEY `k_produto_preco_2` (`modulo_id`),
  KEY `k_produto_preco_3` (`produto_grade_id`),
  KEY `k_produto_preco_4` (`empresa_id`),
  CONSTRAINT `fk_produto_preco_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_produto_preco_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_produto_preco_4` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,3,9.0000,45.9674,9.0000,7.9000,6.0940,5.0000,0.0000),(2,1,0,1,3,9.0000,45.9674,9.0000,7.9000,6.0940,5.0000,0.0000),(3,2,0,NULL,3,5.8000,0.0000,0.0000,7.3000,0.0000,0.0000,0.0000),(4,3,0,NULL,3,2.0000,2.0000,2.0000,0.4900,3126.6849,1.9900,0.0000),(5,4,0,NULL,3,0.0000,0.0000,0.0000,80.0000,0.0000,0.0000,0.0000),(6,5,0,NULL,3,5.0000,5.0000,5.0000,5.5000,0.0000,0.0000,0.0000),(7,6,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(8,6,0,2,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(9,7,0,NULL,3,8.0000,0.0000,0.0000,6.3000,0.0000,0.0000,0.0000),(10,1,0,3,3,5.5000,0.0000,0.0000,7.9000,0.0000,0.0000,0.0000),(11,8,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000);
/*!40000 ALTER TABLE `produto_preco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_sped`
--

DROP TABLE IF EXISTS `produto_sped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_sped` (
  `produto_sped_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `data_inicio` date NOT NULL DEFAULT '0001-01-01',
  `data_fim` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`produto_sped_id`),
  KEY `k_produto_sped_1` (`produto_id`),
  CONSTRAINT `fk_produto_sped_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_sped`
--

LOCK TABLES `produto_sped` WRITE;
/*!40000 ALTER TABLE `produto_sped` DISABLE KEYS */;
INSERT INTO `produto_sped` VALUES (1,1,'Arroz Codil Tipo 1','2022-10-19','0001-01-01'),(2,2,'Café','2022-10-19','0001-01-01'),(3,3,'Macarrão Sta Amália','2022-10-19','2022-10-18'),(4,4,'Troca de óleo','2022-10-19','0001-01-01'),(5,5,'Coca-Cola 2L','2022-10-19','0001-01-01'),(6,6,'Produto teste','2022-10-19','0001-01-01'),(7,7,'Feijão Carioca','2022-10-19','0001-01-01'),(8,3,'Fósforo','2022-10-19','0001-01-01');
/*!40000 ALTER TABLE `produto_sped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_sped_empresa`
--

DROP TABLE IF EXISTS `produto_sped_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_sped_empresa` (
  `produto_sped_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `sped` int(1) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`produto_sped_id`,`empresa_id`,`sped`),
  KEY `k_produto_sped_empresa_1` (`produto_sped_id`),
  KEY `k_produto_sped_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_produto_sped_empresa_1` FOREIGN KEY (`produto_sped_id`) REFERENCES `produto_sped` (`produto_sped_id`),
  CONSTRAINT `fk_produto_sped_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_sped_empresa`
--

LOCK TABLES `produto_sped_empresa` WRITE;
/*!40000 ALTER TABLE `produto_sped_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_sped_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_unidade`
--

DROP TABLE IF EXISTS `produto_unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_unidade` (
  `produto_unidade_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `simbolo` varchar(6) NOT NULL DEFAULT '',
  `fraciona` tinyint(1) NOT NULL DEFAULT '0',
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`produto_unidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
INSERT INTO `produto_unidade` VALUES (1,'Unidade','UN',0,'2022-10-19 08:55:29');
/*!40000 ALTER TABLE `produto_unidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_unidade_empresa`
--

DROP TABLE IF EXISTS `produto_unidade_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_unidade_empresa` (
  `produto_unidade_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produto_unidade_id`,`empresa_id`),
  KEY `k_produto_unidade_empresa_1` (`produto_unidade_id`),
  KEY `k_produto_unidade_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_produto_unidade_empresa_1` FOREIGN KEY (`produto_unidade_id`) REFERENCES `produto_unidade` (`produto_unidade_id`),
  CONSTRAINT `fk_produto_unidade_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade_empresa`
--

LOCK TABLES `produto_unidade_empresa` WRITE;
/*!40000 ALTER TABLE `produto_unidade_empresa` DISABLE KEYS */;
INSERT INTO `produto_unidade_empresa` VALUES (1,3,1,0);
/*!40000 ALTER TABLE `produto_unidade_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `projeto_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `gerente_id` int(11) NOT NULL DEFAULT '0',
  `data_inicio_previsto` date NOT NULL DEFAULT '0001-01-01',
  `status` int(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projeto_id`),
  KEY `k_projeto_1` (`empresa_id`),
  KEY `k_projeto_2` (`gerente_id`),
  CONSTRAINT `fk_projeto_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_projeto_2` FOREIGN KEY (`gerente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_colaborador`
--

DROP TABLE IF EXISTS `projeto_colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_colaborador` (
  `projeto_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `custo_hora` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_hora` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`projeto_id`,`colaborador_id`),
  KEY `k_projeto_colaborador_1` (`projeto_id`),
  KEY `k_projeto_colaborador_2` (`colaborador_id`),
  CONSTRAINT `fk_projeto_colaborador_1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`projeto_id`),
  CONSTRAINT `fk_projeto_colaborador_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_colaborador`
--

LOCK TABLES `projeto_colaborador` WRITE;
/*!40000 ALTER TABLE `projeto_colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_colaborador_dedicacao`
--

DROP TABLE IF EXISTS `projeto_colaborador_dedicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_colaborador_dedicacao` (
  `projeto_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) NOT NULL DEFAULT '0',
  `dia_semana` int(1) NOT NULL DEFAULT '0',
  `tempo_dedicado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projeto_id`,`colaborador_id`,`dia_semana`),
  KEY `k_projeto_colaborador_dedicacao_1` (`projeto_id`),
  KEY `k_projeto_colaborador_dedicacao_2` (`colaborador_id`),
  CONSTRAINT `fk_projeto_colaborador_dedicacao_1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`projeto_id`),
  CONSTRAINT `fk_projeto_colaborador_dedicacao_2` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_colaborador_dedicacao`
--

LOCK TABLES `projeto_colaborador_dedicacao` WRITE;
/*!40000 ALTER TABLE `projeto_colaborador_dedicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_colaborador_dedicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_etapa`
--

DROP TABLE IF EXISTS `projeto_etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_etapa` (
  `projeto_etapa_id` int(11) NOT NULL AUTO_INCREMENT,
  `projeto_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projeto_etapa_id`),
  KEY `k_projeto_etapa_1` (`projeto_id`),
  CONSTRAINT `fk_projeto_etapa_1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`projeto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_etapa`
--

LOCK TABLES `projeto_etapa` WRITE;
/*!40000 ALTER TABLE `projeto_etapa` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_ocorrencia`
--

DROP TABLE IF EXISTS `projeto_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_ocorrencia` (
  `projeto_ocorrencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `projeto_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `status_projeto` int(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projeto_ocorrencia_id`),
  KEY `k_projeto_ocorrencia_1` (`projeto_id`),
  CONSTRAINT `fk_projeto_ocorrencia_1` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`projeto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_ocorrencia`
--

LOCK TABLES `projeto_ocorrencia` WRITE;
/*!40000 ALTER TABLE `projeto_ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_tarefa`
--

DROP TABLE IF EXISTS `projeto_tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_tarefa` (
  `projeto_etapa_id` int(11) NOT NULL DEFAULT '0',
  `tarefa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projeto_etapa_id`,`tarefa_id`),
  KEY `k_projeto_tarefa_1` (`projeto_etapa_id`),
  KEY `k_projeto_tarefa_2` (`tarefa_id`),
  CONSTRAINT `fk_projeto_tarefa_1` FOREIGN KEY (`projeto_etapa_id`) REFERENCES `projeto_etapa` (`projeto_etapa_id`),
  CONSTRAINT `fk_projeto_tarefa_2` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_tarefa`
--

LOCK TABLES `projeto_tarefa` WRITE;
/*!40000 ALTER TABLE `projeto_tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber`
--

DROP TABLE IF EXISTS `receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber` (
  `receber_id` int(11) NOT NULL AUTO_INCREMENT,
  `importacao_receber_id` varchar(20) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  `parceiro_id` int(11) DEFAULT NULL,
  `venda_id` int(11) DEFAULT NULL,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `documento` varchar(50) NOT NULL DEFAULT '',
  `emissao` date NOT NULL DEFAULT '0001-01-01',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `parceiro_percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `observacao` text NOT NULL,
  `substituido` tinyint(1) NOT NULL DEFAULT '0',
  `perdido` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receber_id`),
  KEY `k_receber_1` (`empresa_id`),
  KEY `k_receber_2` (`cliente_id`),
  KEY `k_receber_3` (`parceiro_id`),
  KEY `k_receber_4` (`venda_id`),
  KEY `k_receber_5` (`conta_id`),
  CONSTRAINT `fk_receber_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_receber_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_receber_3` FOREIGN KEY (`parceiro_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_receber_4` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_receber_5` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,3,4,NULL,16,2,'0000000001','2022-10-19','2022-11-18','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(2,NULL,3,4,NULL,16,2,'0000000002','2022-10-19','2022-12-18','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(3,NULL,3,4,NULL,16,2,'0000000003','2022-10-19','2023-01-17','0001-01-01',35.14,0.00,0.00,0.00,0.0000,'',0,0,0),(4,NULL,3,8,NULL,NULL,1,'Teste api','2022-10-19','2022-10-24','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0);
/*!40000 ALTER TABLE `receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_anexo`
--

DROP TABLE IF EXISTS `receber_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_anexo` (
  `receber_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`receber_anexo_id`),
  KEY `k_receber_anexo_1` (`receber_id`),
  CONSTRAINT `fk_receber_anexo_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_anexo`
--

LOCK TABLES `receber_anexo` WRITE;
/*!40000 ALTER TABLE `receber_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_boleto`
--

DROP TABLE IF EXISTS `receber_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_boleto` (
  `receber_boleto_id` int(11) NOT NULL AUTO_INCREMENT,
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `nosso_numero` varchar(20) NOT NULL DEFAULT '',
  `emissao` date NOT NULL DEFAULT '0001-01-01',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `juros_diario` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `juros_carencia` int(4) NOT NULL DEFAULT '0',
  `multa` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `multa_carencia` int(4) NOT NULL DEFAULT '0',
  `url_boleto` varchar(500) NOT NULL DEFAULT '',
  `url_remessa` varchar(500) NOT NULL DEFAULT '',
  `url_retorno` varchar(500) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receber_boleto_id`),
  KEY `k_receber_boleto_1` (`receber_id`),
  CONSTRAINT `fk_receber_boleto_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_boleto`
--

LOCK TABLES `receber_boleto` WRITE;
/*!40000 ALTER TABLE `receber_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_categoria`
--

DROP TABLE IF EXISTS `receber_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_categoria` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`receber_id`,`categoria_id`),
  KEY `k_receber_categoria_1` (`receber_id`),
  KEY `k_receber_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_receber_categoria_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_receber_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_categoria`
--

LOCK TABLES `receber_categoria` WRITE;
/*!40000 ALTER TABLE `receber_categoria` DISABLE KEYS */;
INSERT INTO `receber_categoria` VALUES (1,97,100.0000),(2,97,100.0000),(3,97,100.0000),(4,225,100.0000);
/*!40000 ALTER TABLE `receber_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_centro_resultado`
--

DROP TABLE IF EXISTS `receber_centro_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_centro_resultado` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `centro_resultado_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`receber_id`,`centro_resultado_id`),
  KEY `k_receber_centro_resultado_1` (`receber_id`),
  KEY `k_receber_centro_resultado_2` (`centro_resultado_id`),
  CONSTRAINT `fk_receber_centro_resultado_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_receber_centro_resultado_2` FOREIGN KEY (`centro_resultado_id`) REFERENCES `centro_resultado` (`centro_resultado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_centro_resultado`
--

LOCK TABLES `receber_centro_resultado` WRITE;
/*!40000 ALTER TABLE `receber_centro_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_centro_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_conta_contabil`
--

DROP TABLE IF EXISTS `receber_conta_contabil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_conta_contabil` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `operacao` int(1) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receber_id`,`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_receber_conta_contabil_1` (`receber_id`),
  KEY `k_receber_conta_contabil_2` (`categoria_id`),
  KEY `k_receber_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_receber_conta_contabil_4` (`receber_id`,`categoria_id`),
  CONSTRAINT `fk_receber_conta_contabil_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_receber_conta_contabil_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_receber_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_receber_conta_contabil_4` FOREIGN KEY (`receber_id`, `categoria_id`) REFERENCES `receber_categoria` (`receber_id`, `categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_conta_contabil`
--

LOCK TABLES `receber_conta_contabil` WRITE;
/*!40000 ALTER TABLE `receber_conta_contabil` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_conta_contabil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receber_substituido`
--

DROP TABLE IF EXISTS `receber_substituido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_substituido` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `receber_substituido_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receber_id`,`receber_substituido_id`),
  KEY `k_receber_substituido_1` (`receber_id`),
  KEY `k_receber_substituido_2` (`receber_substituido_id`),
  CONSTRAINT `fk_receber_substituido_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_receber_substituido_2` FOREIGN KEY (`receber_substituido_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_substituido`
--

LOCK TABLES `receber_substituido` WRITE;
/*!40000 ALTER TABLE `receber_substituido` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_substituido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento`
--

DROP TABLE IF EXISTS `recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento` (
  `recebimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `conta_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recebimento_id`),
  KEY `k_recebimento_1` (`conta_id`),
  CONSTRAINT `fk_recebimento_1` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento_cancelado`
--

DROP TABLE IF EXISTS `recebimento_cancelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento_cancelado` (
  `recebimento_cancelado_id` int(11) NOT NULL AUTO_INCREMENT,
  `recebimento_id` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`recebimento_cancelado_id`),
  KEY `k_recebimento_cancelado_1` (`recebimento_id`),
  CONSTRAINT `fk_recebimento_cancelado_1` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_cancelado`
--

LOCK TABLES `recebimento_cancelado` WRITE;
/*!40000 ALTER TABLE `recebimento_cancelado` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento_cancelado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento_cancelado_receber`
--

DROP TABLE IF EXISTS `recebimento_cancelado_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento_cancelado_receber` (
  `recebimento_cancelado_id` int(11) NOT NULL DEFAULT '0',
  `recebimento_id` int(11) NOT NULL DEFAULT '0',
  `receber_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recebimento_cancelado_id`,`recebimento_id`,`receber_id`),
  KEY `k_recebimento_cancelado_receber_1` (`recebimento_cancelado_id`),
  KEY `k_recebimento_cancelado_receber_2` (`recebimento_id`),
  KEY `k_recebimento_cancelado_receber_3` (`receber_id`),
  CONSTRAINT `fk_recebimento_cancelado_receber_1` FOREIGN KEY (`recebimento_cancelado_id`) REFERENCES `recebimento_cancelado` (`recebimento_cancelado_id`),
  CONSTRAINT `fk_recebimento_cancelado_receber_2` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`),
  CONSTRAINT `fk_recebimento_cancelado_receber_3` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_cancelado_receber`
--

LOCK TABLES `recebimento_cancelado_receber` WRITE;
/*!40000 ALTER TABLE `recebimento_cancelado_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento_cancelado_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento_informado`
--

DROP TABLE IF EXISTS `recebimento_informado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento_informado` (
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `pagamento` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`receber_id`),
  KEY `k_recebimento_informado_1` (`receber_id`),
  KEY `k_recebimento_informado_2` (`usuario_id`),
  CONSTRAINT `fk_recebimento_informado_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_informado`
--

LOCK TABLES `recebimento_informado` WRITE;
/*!40000 ALTER TABLE `recebimento_informado` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento_informado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento_receber`
--

DROP TABLE IF EXISTS `recebimento_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento_receber` (
  `recebimento_receber_id` int(11) NOT NULL AUTO_INCREMENT,
  `recebimento_id` int(11) NOT NULL DEFAULT '0',
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_pago` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recebimento_receber_id`),
  UNIQUE KEY `uk_recebimento_receber_1` (`recebimento_id`,`receber_id`),
  KEY `k_recebimento_receber_1` (`recebimento_id`),
  KEY `k_recebimento_receber_2` (`receber_id`),
  CONSTRAINT `fk_recebimento_receber_1` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`),
  CONSTRAINT `fk_recebimento_receber_2` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_receber`
--

LOCK TABLES `recebimento_receber` WRITE;
/*!40000 ALTER TABLE `recebimento_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento_receber_categoria`
--

DROP TABLE IF EXISTS `recebimento_receber_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recebimento_receber_categoria` (
  `recebimento_receber_id` int(11) NOT NULL DEFAULT '0',
  `categoria_id` int(11) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`recebimento_receber_id`,`categoria_id`),
  KEY `k_recebimento_receber_categoria_1` (`recebimento_receber_id`),
  KEY `k_recebimento_receber_categoria_2` (`categoria_id`),
  CONSTRAINT `fk_recebimento_receber_categoria_1` FOREIGN KEY (`recebimento_receber_id`) REFERENCES `recebimento_receber` (`recebimento_receber_id`),
  CONSTRAINT `fk_recebimento_receber_categoria_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_receber_categoria`
--

LOCK TABLES `recebimento_receber_categoria` WRITE;
/*!40000 ALTER TABLE `recebimento_receber_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `recebimento_receber_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regra_tributaria`
--

DROP TABLE IF EXISTS `regra_tributaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regra_tributaria` (
  `regra_tributaria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `produto_servico` char(1) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`regra_tributaria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
INSERT INTO `regra_tributaria` VALUES (1,'Substituição tributária','P',1,0),(2,'Serviços isentos','S',1,0),(3,'Produtos Tributados','P',1,0),(4,'Serviços Tributados','S',1,0);
/*!40000 ALTER TABLE `regra_tributaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regra_tributaria_operacao`
--

DROP TABLE IF EXISTS `regra_tributaria_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regra_tributaria_operacao` (
  `regra_tributaria_operacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `regra_tributaria_id` int(11) NOT NULL DEFAULT '0',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `regime_tributario` int(1) NOT NULL DEFAULT '0',
  `uf` char(2) NOT NULL DEFAULT '',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `cfop` int(4) NOT NULL DEFAULT '0',
  `cst_icms` char(3) NOT NULL DEFAULT '',
  `modalidade_bc_icms` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `percentual_diferimento_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `modalidade_bc_icms_st` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_st_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_ipi_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `mva_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `aliquota_ipi` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_ipi` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_ipi` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_ipi` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_ipi` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_tributacao_servico` int(1) NOT NULL DEFAULT '0',
  `natureza_tributacao_servico` int(1) NOT NULL DEFAULT '0',
  `aliquota_iss` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `iss_retido` tinyint(1) NOT NULL DEFAULT '0',
  `exigibilidade_iss` int(1) NOT NULL DEFAULT '0',
  `operacao_servico` int(1) NOT NULL DEFAULT '0',
  `codigo_cnae` varchar(10) NOT NULL DEFAULT '',
  `cst_pis_cofins` char(3) NOT NULL DEFAULT '',
  `aliquota_pis` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_cofins` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_pis_cofins` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_pis_cofins` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_pis_cofins` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_pis_cofins` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_credito_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_bc_c_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `codigo_contribuicao_pis_cofins` int(3) NOT NULL DEFAULT '0',
  `natureza_receita_pis_cofins` char(3) NOT NULL DEFAULT '',
  `calcular_mva_ajustada` tinyint(1) NOT NULL DEFAULT '0',
  `fcp_percentual_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `fcp_percentual_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `fcp_percentual_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `fcp_aliquota_icms_st_retido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `codigo_tributacao_municipio` varchar(20) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `observacao` text NOT NULL,
  PRIMARY KEY (`regra_tributaria_operacao_id`),
  KEY `k_regra_tributaria_operacao_1` (`regra_tributaria_id`),
  KEY `k_regra_tributaria_operacao_2` (`operacao_id`),
  KEY `k_regra_tributaria_operacao_3` (`conta_contabil_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_1` FOREIGN KEY (`regra_tributaria_id`) REFERENCES `regra_tributaria` (`regra_tributaria_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(3,1,1,0,'AP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(31,2,5,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',60,''),(32,3,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(33,3,8,0,'MG','Venda',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(34,3,8,0,'AM','Venda',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(35,3,4,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',9,''),(36,3,10,0,'MG','NFe de Saída',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(37,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',NULL,'');
/*!40000 ALTER TABLE `regra_tributaria_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regra_tributaria_operacao_empresa`
--

DROP TABLE IF EXISTS `regra_tributaria_operacao_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regra_tributaria_operacao_empresa` (
  `regra_tributaria_operacao_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`regra_tributaria_operacao_id`,`empresa_id`),
  KEY `k_regra_tributaria_empresa_operacao_1` (`regra_tributaria_operacao_id`),
  KEY `k_regra_tributaria_empresa_operacao_2` (`empresa_id`),
  CONSTRAINT `fk_regra_tributaria_empresa_operacao_1` FOREIGN KEY (`regra_tributaria_operacao_id`) REFERENCES `regra_tributaria_operacao` (`regra_tributaria_operacao_id`),
  CONSTRAINT `fk_regra_tributaria_empresa_operacao_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao_empresa`
--

LOCK TABLES `regra_tributaria_operacao_empresa` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao_empresa` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao_empresa` VALUES (1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3);
/*!40000 ALTER TABLE `regra_tributaria_operacao_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio`
--

DROP TABLE IF EXISTS `relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio` (
  `relatorio_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `tabela_referencia_id` char(5) NOT NULL DEFAULT '',
  `modulo_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relatorio_id`),
  UNIQUE KEY `uk_relatorio_1` (`nome`),
  KEY `k_relatorio_1` (`modulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio`
--

LOCK TABLES `relatorio` WRITE;
/*!40000 ALTER TABLE `relatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_campo`
--

DROP TABLE IF EXISTS `relatorio_campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_campo` (
  `relatorio_campo_id` int(11) NOT NULL AUTO_INCREMENT,
  `relatorio_id` int(11) NOT NULL DEFAULT '0',
  `campo_id` char(10) NOT NULL DEFAULT '',
  `ordem` int(2) NOT NULL DEFAULT '0',
  `nome_personalizado` varchar(50) NOT NULL DEFAULT '',
  `totalizar` tinyint(1) NOT NULL DEFAULT '0',
  `agrupar` tinyint(1) NOT NULL DEFAULT '0',
  `ordenar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relatorio_campo_id`),
  KEY `k_relatorio_campo_1` (`relatorio_id`),
  CONSTRAINT `fk_relatorio_campo_1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`relatorio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_campo`
--

LOCK TABLES `relatorio_campo` WRITE;
/*!40000 ALTER TABLE `relatorio_campo` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_campo_calculado`
--

DROP TABLE IF EXISTS `relatorio_campo_calculado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_campo_calculado` (
  `relatorio_campo_calculado_id` int(11) NOT NULL AUTO_INCREMENT,
  `relatorio_id` int(11) NOT NULL DEFAULT '0',
  `numero_campo_calculado` int(11) NOT NULL DEFAULT '0',
  `formula` text NOT NULL,
  `ordem` int(2) NOT NULL DEFAULT '0',
  `nome_personalizado` varchar(50) NOT NULL DEFAULT '',
  `totalizar` tinyint(1) NOT NULL DEFAULT '0',
  `ordenar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relatorio_campo_calculado_id`),
  KEY `k_relatorio_campo_calculado_1` (`relatorio_id`),
  CONSTRAINT `fk_relatorio_campo_calculado_1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`relatorio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_campo_calculado`
--

LOCK TABLES `relatorio_campo_calculado` WRITE;
/*!40000 ALTER TABLE `relatorio_campo_calculado` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_campo_calculado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_empresa`
--

DROP TABLE IF EXISTS `relatorio_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_empresa` (
  `relatorio_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relatorio_id`,`empresa_id`),
  KEY `k_relatorio_empresa_1` (`relatorio_id`),
  KEY `k_relatorio_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_relatorio_empresa_1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`relatorio_id`),
  CONSTRAINT `fk_relatorio_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_empresa`
--

LOCK TABLES `relatorio_empresa` WRITE;
/*!40000 ALTER TABLE `relatorio_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_parametro`
--

DROP TABLE IF EXISTS `relatorio_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_parametro` (
  `relatorio_parametro_id` int(11) NOT NULL AUTO_INCREMENT,
  `relatorio_id` int(11) NOT NULL DEFAULT '0',
  `tipo` int(1) NOT NULL DEFAULT '0',
  `campo_id` char(10) NOT NULL DEFAULT '',
  `numero_campo_calculado` int(11) NOT NULL DEFAULT '0',
  `operador_relacional` int(1) NOT NULL DEFAULT '0',
  `operador_logico` int(1) NOT NULL DEFAULT '0',
  `valor` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`relatorio_parametro_id`),
  KEY `k_relatorio_parametro_1` (`relatorio_id`),
  CONSTRAINT `fk_relatorio_parametro_1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`relatorio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_parametro`
--

LOCK TABLES `relatorio_parametro` WRITE;
/*!40000 ALTER TABLE `relatorio_parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_usuario`
--

DROP TABLE IF EXISTS `relatorio_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_usuario` (
  `relatorio_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `permissao` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relatorio_id`,`usuario_id`),
  KEY `k_relatorio_usuario_1` (`relatorio_id`),
  KEY `k_relatorio_usuario_2` (`usuario_id`),
  CONSTRAINT `fk_relatorio_usuario_1` FOREIGN KEY (`relatorio_id`) REFERENCES `relatorio` (`relatorio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_usuario`
--

LOCK TABLES `relatorio_usuario` WRITE;
/*!40000 ALTER TABLE `relatorio_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_empresa`
--

DROP TABLE IF EXISTS `service_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_empresa` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `versao_id` int(11) NOT NULL DEFAULT '0',
  `job_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`service_id`,`empresa_id`),
  KEY `k_service_empresa_1` (`service_id`),
  KEY `k_service_empresa_2` (`empresa_id`),
  KEY `k_service_empresa_3` (`versao_id`),
  KEY `k_service_empresa_4` (`job_id`),
  CONSTRAINT `fk_service_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_service_empresa_3` FOREIGN KEY (`versao_id`) REFERENCES `versao` (`versao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_empresa`
--

LOCK TABLES `service_empresa` WRITE;
/*!40000 ALTER TABLE `service_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla` (
  `sla_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(200) NOT NULL DEFAULT '',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `atende_feriado` tinyint(1) NOT NULL DEFAULT '0',
  `atende_horario_especial` tinyint(1) NOT NULL DEFAULT '0',
  `tempo_espera_prioridade_critica` int(11) NOT NULL DEFAULT '0',
  `tempo_espera_prioridade_alta` int(11) NOT NULL DEFAULT '0',
  `tempo_espera_prioridade_media` int(11) NOT NULL DEFAULT '0',
  `tempo_espera_prioridade_baixa` int(11) NOT NULL DEFAULT '0',
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sla_id`),
  KEY `k_sla_1` (`empresa_id`),
  CONSTRAINT `fk_sla_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_equipe`
--

DROP TABLE IF EXISTS `sla_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla_equipe` (
  `sla_id` int(11) NOT NULL DEFAULT '0',
  `equipe_id` int(11) NOT NULL DEFAULT '0',
  `nivel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sla_id`,`equipe_id`),
  KEY `k_sla_equipe_1` (`sla_id`),
  KEY `k_sla_equipe_2` (`equipe_id`),
  CONSTRAINT `fk_sla_equipe_1` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`),
  CONSTRAINT `fk_sla_equipe_2` FOREIGN KEY (`equipe_id`) REFERENCES `equipe` (`equipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_equipe`
--

LOCK TABLES `sla_equipe` WRITE;
/*!40000 ALTER TABLE `sla_equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_horario`
--

DROP TABLE IF EXISTS `sla_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla_horario` (
  `sla_id` int(11) NOT NULL DEFAULT '0',
  `dia_semana` int(1) NOT NULL DEFAULT '0',
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_intervalo_final` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`sla_id`,`dia_semana`),
  KEY `k_sla_horario_1` (`sla_id`),
  CONSTRAINT `fk_sla_horario_1` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_horario`
--

LOCK TABLES `sla_horario` WRITE;
/*!40000 ALTER TABLE `sla_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_nivel`
--

DROP TABLE IF EXISTS `sla_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla_nivel` (
  `sla_id` int(11) NOT NULL DEFAULT '0',
  `nivel` int(1) NOT NULL DEFAULT '0',
  `tempo_solucao_prioridade_critica` int(11) NOT NULL DEFAULT '0',
  `tempo_solucao_prioridade_alta` int(11) NOT NULL DEFAULT '0',
  `tempo_solucao_prioridade_media` int(11) NOT NULL DEFAULT '0',
  `tempo_solucao_prioridade_baixa` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sla_id`,`nivel`),
  KEY `k_sla_nivel_1` (`sla_id`),
  CONSTRAINT `fk_sla_nivel_1` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_nivel`
--

LOCK TABLES `sla_nivel` WRITE;
/*!40000 ALTER TABLE `sla_nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao` (
  `solicitacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `descricao` text NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `solicitante_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `equipe_id` int(11) DEFAULT NULL,
  `cliente_contrato_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `sla_id` int(11) DEFAULT NULL,
  `solicitacao_categoria_id` int(11) NOT NULL DEFAULT '0',
  `solicitacao_origem_id` int(11) DEFAULT NULL,
  `solicitacao_tipo_id` int(1) NOT NULL DEFAULT '0',
  `projeto_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `urgencia` int(1) NOT NULL DEFAULT '0',
  `impacto` int(1) NOT NULL DEFAULT '0',
  `prioridade` int(1) NOT NULL DEFAULT '0',
  `vencimento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `nivel` int(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_id`),
  KEY `k_solicitacao_1` (`empresa_id`),
  KEY `k_solicitacao_2` (`cliente_id`),
  KEY `k_solicitacao_3` (`solicitante_id`),
  KEY `k_solicitacao_4` (`usuario_id`),
  KEY `k_solicitacao_5` (`colaborador_id`),
  KEY `k_solicitacao_6` (`departamento_id`),
  KEY `k_solicitacao_7` (`equipe_id`),
  KEY `k_solicitacao_8` (`cliente_contrato_id`),
  KEY `k_solicitacao_9` (`produto_id`),
  KEY `k_solicitacao_10` (`servico_id`),
  KEY `k_solicitacao_11` (`sla_id`),
  KEY `k_solicitacao_12` (`solicitacao_categoria_id`),
  KEY `k_solicitacao_13` (`solicitacao_origem_id`),
  KEY `k_solicitacao_14` (`solicitacao_tipo_id`),
  KEY `k_solicitacao_15` (`projeto_id`),
  CONSTRAINT `fk_solicitacao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_solicitacao_10` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_solicitacao_11` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`sla_id`),
  CONSTRAINT `fk_solicitacao_12` FOREIGN KEY (`solicitacao_categoria_id`) REFERENCES `solicitacao_categoria` (`solicitacao_categoria_id`),
  CONSTRAINT `fk_solicitacao_13` FOREIGN KEY (`solicitacao_origem_id`) REFERENCES `solicitacao_origem` (`solicitacao_origem_id`),
  CONSTRAINT `fk_solicitacao_14` FOREIGN KEY (`solicitacao_tipo_id`) REFERENCES `solicitacao_tipo` (`solicitacao_tipo_id`),
  CONSTRAINT `fk_solicitacao_15` FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`projeto_id`),
  CONSTRAINT `fk_solicitacao_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_solicitacao_3` FOREIGN KEY (`solicitante_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_solicitacao_5` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_solicitacao_6` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`),
  CONSTRAINT `fk_solicitacao_7` FOREIGN KEY (`equipe_id`) REFERENCES `equipe` (`equipe_id`),
  CONSTRAINT `fk_solicitacao_8` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_solicitacao_9` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao`
--

LOCK TABLES `solicitacao` WRITE;
/*!40000 ALTER TABLE `solicitacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_anexo`
--

DROP TABLE IF EXISTS `solicitacao_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_anexo` (
  `solicitacao_anexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `url_anexo` varchar(500) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_anexo_id`),
  KEY `k_solicitacao_anexo_1` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_anexo_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_anexo`
--

LOCK TABLES `solicitacao_anexo` WRITE;
/*!40000 ALTER TABLE `solicitacao_anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_atividade`
--

DROP TABLE IF EXISTS `solicitacao_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_atividade` (
  `solicitacao_atividade_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `atividade` int(2) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `equipe_id` int(11) DEFAULT NULL,
  `solicitacao_status` int(1) NOT NULL DEFAULT '0',
  `solicitacao_tipo_id` int(11) DEFAULT NULL,
  `solicitacao_categoria_id` int(11) DEFAULT NULL,
  `urgencia` int(1) NOT NULL DEFAULT '0',
  `impacto` int(1) NOT NULL DEFAULT '0',
  `prioridade` int(1) NOT NULL DEFAULT '0',
  `vencimento` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `nivel` int(1) NOT NULL DEFAULT '0',
  `tarefa_id` int(11) DEFAULT NULL,
  `tarefa_status` int(1) NOT NULL DEFAULT '0',
  `compromisso_id` int(11) DEFAULT NULL,
  `compromisso_data_hora_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `compromisso_data_hora_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `solicitacao_anexo_id` int(11) DEFAULT NULL,
  `cliente_contrato_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`solicitacao_atividade_id`),
  KEY `k_solicitacao_atividade_1` (`solicitacao_id`),
  KEY `k_solicitacao_atividade_2` (`usuario_id`),
  KEY `k_solicitacao_atividade_3` (`colaborador_id`),
  KEY `k_solicitacao_atividade_4` (`departamento_id`),
  KEY `k_solicitacao_atividade_5` (`equipe_id`),
  KEY `k_solicitacao_atividade_6` (`solicitacao_tipo_id`),
  KEY `k_solicitacao_atividade_7` (`solicitacao_categoria_id`),
  KEY `k_solicitacao_atividade_8` (`tarefa_id`),
  KEY `k_solicitacao_atividade_9` (`compromisso_id`),
  KEY `k_solicitacao_atividade_10` (`solicitacao_anexo_id`),
  KEY `k_solicitacao_atividade_11` (`cliente_contrato_id`),
  KEY `k_solicitacao_atividade_12` (`produto_id`),
  KEY `k_solicitacao_atividade_13` (`servico_id`),
  CONSTRAINT `fk_solicitacao_atividade_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_atividade_10` FOREIGN KEY (`solicitacao_anexo_id`) REFERENCES `solicitacao_anexo` (`solicitacao_anexo_id`),
  CONSTRAINT `fk_solicitacao_atividade_11` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_solicitacao_atividade_12` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_solicitacao_atividade_13` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_solicitacao_atividade_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_solicitacao_atividade_4` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`),
  CONSTRAINT `fk_solicitacao_atividade_5` FOREIGN KEY (`equipe_id`) REFERENCES `equipe` (`equipe_id`),
  CONSTRAINT `fk_solicitacao_atividade_6` FOREIGN KEY (`solicitacao_tipo_id`) REFERENCES `solicitacao_tipo` (`solicitacao_tipo_id`),
  CONSTRAINT `fk_solicitacao_atividade_7` FOREIGN KEY (`solicitacao_categoria_id`) REFERENCES `solicitacao_categoria` (`solicitacao_categoria_id`),
  CONSTRAINT `fk_solicitacao_atividade_8` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`),
  CONSTRAINT `fk_solicitacao_atividade_9` FOREIGN KEY (`compromisso_id`) REFERENCES `compromisso` (`compromisso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_atividade`
--

LOCK TABLES `solicitacao_atividade` WRITE;
/*!40000 ALTER TABLE `solicitacao_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_avaliacao`
--

DROP TABLE IF EXISTS `solicitacao_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_avaliacao` (
  `solicitacao_avaliacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `avaliador_id` int(11) NOT NULL DEFAULT '0',
  `colaborador_id` int(11) DEFAULT NULL,
  `nota` int(1) NOT NULL DEFAULT '0',
  `comentario` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`solicitacao_avaliacao_id`),
  UNIQUE KEY `uk_solicitacao_avaliacao_1` (`solicitacao_id`,`avaliador_id`,`colaborador_id`),
  KEY `k_solicitacao_avaliacao_1` (`solicitacao_id`),
  KEY `k_solicitacao_avaliacao_2` (`avaliador_id`),
  KEY `k_solicitacao_avaliacao_3` (`colaborador_id`),
  CONSTRAINT `fk_solicitacao_avaliacao_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_avaliacao_3` FOREIGN KEY (`colaborador_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_avaliacao`
--

LOCK TABLES `solicitacao_avaliacao` WRITE;
/*!40000 ALTER TABLE `solicitacao_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_categoria`
--

DROP TABLE IF EXISTS `solicitacao_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_categoria` (
  `solicitacao_categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`solicitacao_categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_categoria`
--

LOCK TABLES `solicitacao_categoria` WRITE;
/*!40000 ALTER TABLE `solicitacao_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_categoria_empresa`
--

DROP TABLE IF EXISTS `solicitacao_categoria_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_categoria_empresa` (
  `solicitacao_categoria_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_categoria_id`,`empresa_id`),
  KEY `k_solicitacao_categoria_empresa_1` (`solicitacao_categoria_id`),
  KEY `k_solicitacao_categoria_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_solicitacao_categoria_empresa_1` FOREIGN KEY (`solicitacao_categoria_id`) REFERENCES `solicitacao_categoria` (`solicitacao_categoria_id`),
  CONSTRAINT `fk_solicitacao_categoria_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_categoria_empresa`
--

LOCK TABLES `solicitacao_categoria_empresa` WRITE;
/*!40000 ALTER TABLE `solicitacao_categoria_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_categoria_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_cobranca`
--

DROP TABLE IF EXISTS `solicitacao_cobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_cobranca` (
  `solicitacao_cobranca_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `url_documento` varchar(500) NOT NULL DEFAULT '',
  `inicio` date NOT NULL DEFAULT '0001-01-01',
  `fim` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`solicitacao_cobranca_id`),
  UNIQUE KEY `uk_solicitacao_cobranca_1` (`solicitacao_id`,`nome`),
  KEY `k_solicitacao_cobranca_1` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_cobranca_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_cobranca`
--

LOCK TABLES `solicitacao_cobranca` WRITE;
/*!40000 ALTER TABLE `solicitacao_cobranca` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_cobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_comentario`
--

DROP TABLE IF EXISTS `solicitacao_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_comentario` (
  `solicitacao_comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `comentario` text NOT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_comentario_id`),
  KEY `k_solicitacao_comentario_1` (`solicitacao_id`),
  KEY `k_solicitacao_comentario_2` (`usuario_id`),
  CONSTRAINT `fk_solicitacao_comentario_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_comentario`
--

LOCK TABLES `solicitacao_comentario` WRITE;
/*!40000 ALTER TABLE `solicitacao_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_documento`
--

DROP TABLE IF EXISTS `solicitacao_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_documento` (
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `documento_id` int(11) NOT NULL DEFAULT '0',
  `url_documento` varchar(500) NOT NULL DEFAULT '',
  `vencimento` date NOT NULL DEFAULT '0001-01-01',
  `entrega` date NOT NULL DEFAULT '0001-01-01',
  `competencia` char(6) NOT NULL DEFAULT '',
  `multa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_id`,`documento_id`),
  KEY `k_solicitacao_documento_1` (`solicitacao_id`),
  KEY `k_solicitacao_documento_2` (`documento_id`),
  CONSTRAINT `fk_solicitacao_documento_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_documento_2` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`documento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_documento`
--

LOCK TABLES `solicitacao_documento` WRITE;
/*!40000 ALTER TABLE `solicitacao_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_lista`
--

DROP TABLE IF EXISTS `solicitacao_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_lista` (
  `solicitacao_lista_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_lista_id`),
  KEY `k_solicitacao_lista_1` (`empresa_id`),
  KEY `k_solicitacao_lista_2` (`usuario_id`),
  CONSTRAINT `fk_solicitacao_lista_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_lista`
--

LOCK TABLES `solicitacao_lista` WRITE;
/*!40000 ALTER TABLE `solicitacao_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_lista_item`
--

DROP TABLE IF EXISTS `solicitacao_lista_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_lista_item` (
  `solicitacao_lista_id` int(11) NOT NULL DEFAULT '0',
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `ordem` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_lista_id`,`solicitacao_id`),
  KEY `k_solicitacao_lista_item_1` (`solicitacao_lista_id`),
  KEY `k_solicitacao_lista_item_2` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_lista_item_1` FOREIGN KEY (`solicitacao_lista_id`) REFERENCES `solicitacao_lista` (`solicitacao_lista_id`),
  CONSTRAINT `fk_solicitacao_lista_item_2` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_lista_item`
--

LOCK TABLES `solicitacao_lista_item` WRITE;
/*!40000 ALTER TABLE `solicitacao_lista_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_lista_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_origem`
--

DROP TABLE IF EXISTS `solicitacao_origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_origem` (
  `solicitacao_origem_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`solicitacao_origem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_origem`
--

LOCK TABLES `solicitacao_origem` WRITE;
/*!40000 ALTER TABLE `solicitacao_origem` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_origem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_origem_empresa`
--

DROP TABLE IF EXISTS `solicitacao_origem_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_origem_empresa` (
  `solicitacao_origem_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_origem_id`,`empresa_id`),
  KEY `k_solicitacao_origem_empresa_1` (`solicitacao_origem_id`),
  KEY `k_solicitacao_origem_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_solicitacao_origem_empresa_1` FOREIGN KEY (`solicitacao_origem_id`) REFERENCES `solicitacao_origem` (`solicitacao_origem_id`),
  CONSTRAINT `fk_solicitacao_origem_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_origem_empresa`
--

LOCK TABLES `solicitacao_origem_empresa` WRITE;
/*!40000 ALTER TABLE `solicitacao_origem_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_origem_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_recorrente`
--

DROP TABLE IF EXISTS `solicitacao_recorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_recorrente` (
  `solicitacao_recorrente_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `departamento_id` int(11) NOT NULL DEFAULT '0',
  `servico_id` int(11) NOT NULL DEFAULT '0',
  `solicitacao_categoria_id` int(11) NOT NULL DEFAULT '0',
  `frequencia` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_recorrente_id`),
  KEY `k_solicitacao_recorrente_1` (`empresa_id`),
  KEY `k_solicitacao_recorrente_2` (`departamento_id`),
  KEY `k_solicitacao_recorrente_3` (`servico_id`),
  KEY `k_solicitacao_recorrente_4` (`solicitacao_categoria_id`),
  CONSTRAINT `fk_solicitacao_recorrente_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_solicitacao_recorrente_2` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`),
  CONSTRAINT `fk_solicitacao_recorrente_3` FOREIGN KEY (`servico_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_solicitacao_recorrente_4` FOREIGN KEY (`solicitacao_categoria_id`) REFERENCES `solicitacao_categoria` (`solicitacao_categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_recorrente`
--

LOCK TABLES `solicitacao_recorrente` WRITE;
/*!40000 ALTER TABLE `solicitacao_recorrente` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_recorrente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_recorrente_cliente`
--

DROP TABLE IF EXISTS `solicitacao_recorrente_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_recorrente_cliente` (
  `solicitacao_recorrente_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_recorrente_id`,`cliente_id`),
  KEY `k_solicitacao_recorrente_cliente_1` (`solicitacao_recorrente_id`),
  KEY `k_solicitacao_recorrente_cliente_2` (`cliente_id`),
  CONSTRAINT `fk_solicitacao_recorrente_cliente_1` FOREIGN KEY (`solicitacao_recorrente_id`) REFERENCES `solicitacao_recorrente` (`solicitacao_recorrente_id`),
  CONSTRAINT `fk_solicitacao_recorrente_cliente_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_recorrente_cliente`
--

LOCK TABLES `solicitacao_recorrente_cliente` WRITE;
/*!40000 ALTER TABLE `solicitacao_recorrente_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_recorrente_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_recorrente_cobranca`
--

DROP TABLE IF EXISTS `solicitacao_recorrente_cobranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_recorrente_cobranca` (
  `solicitacao_recorrente_cobranca_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_recorrente_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '',
  `inicio` int(2) NOT NULL DEFAULT '0',
  `fim` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_recorrente_cobranca_id`),
  UNIQUE KEY `uk_solicitacao_recorrente_cobranca_1` (`solicitacao_recorrente_id`,`nome`),
  KEY `k_solicitacao_recorrente_cobranca_1` (`solicitacao_recorrente_id`),
  CONSTRAINT `fk_solicitacao_recorrente_cobranca_1` FOREIGN KEY (`solicitacao_recorrente_id`) REFERENCES `solicitacao_recorrente` (`solicitacao_recorrente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_recorrente_cobranca`
--

LOCK TABLES `solicitacao_recorrente_cobranca` WRITE;
/*!40000 ALTER TABLE `solicitacao_recorrente_cobranca` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_recorrente_cobranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_recorrente_documento`
--

DROP TABLE IF EXISTS `solicitacao_recorrente_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_recorrente_documento` (
  `solicitacao_recorrente_id` int(11) NOT NULL DEFAULT '0',
  `documento_id` int(11) NOT NULL DEFAULT '0',
  `vencimento` int(2) NOT NULL DEFAULT '0',
  `entrega` int(2) NOT NULL DEFAULT '0',
  `competencia` int(2) NOT NULL DEFAULT '0',
  `multa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_recorrente_id`,`documento_id`),
  KEY `k_solicitacao_recorrente_documento_1` (`solicitacao_recorrente_id`),
  KEY `k_solicitacao_recorrente_documento_2` (`documento_id`),
  CONSTRAINT `fk_solicitacao_recorrente_documento_1` FOREIGN KEY (`solicitacao_recorrente_id`) REFERENCES `solicitacao_recorrente` (`solicitacao_recorrente_id`),
  CONSTRAINT `fk_solicitacao_recorrente_documento_2` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`documento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_recorrente_documento`
--

LOCK TABLES `solicitacao_recorrente_documento` WRITE;
/*!40000 ALTER TABLE `solicitacao_recorrente_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_recorrente_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_referente`
--

DROP TABLE IF EXISTS `solicitacao_referente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_referente` (
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `solicitacao_referente_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_id`,`solicitacao_referente_id`),
  KEY `k_solicitacao_referente_1` (`solicitacao_id`),
  KEY `k_solicitacao_referente_2` (`solicitacao_referente_id`),
  CONSTRAINT `fk_solicitacao_referente_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_referente_2` FOREIGN KEY (`solicitacao_referente_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_referente`
--

LOCK TABLES `solicitacao_referente` WRITE;
/*!40000 ALTER TABLE `solicitacao_referente` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_referente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_sla_atividade`
--

DROP TABLE IF EXISTS `solicitacao_sla_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_sla_atividade` (
  `solicitacao_sla_atividade_id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `nivel` int(1) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `atividade` int(2) NOT NULL DEFAULT '0',
  `data_hora_vencimento_sla` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_vencimento_slo` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`solicitacao_sla_atividade_id`),
  KEY `k_solicitacao_sla_atividade_1` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_sla_atividade_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_sla_atividade`
--

LOCK TABLES `solicitacao_sla_atividade` WRITE;
/*!40000 ALTER TABLE `solicitacao_sla_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_sla_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_tarefa`
--

DROP TABLE IF EXISTS `solicitacao_tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_tarefa` (
  `solicitacao_id` int(11) NOT NULL DEFAULT '0',
  `tarefa_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_id`,`tarefa_id`),
  KEY `k_solicitacao_tarefa_1` (`solicitacao_id`),
  KEY `k_solicitacao_tarefa_2` (`tarefa_id`),
  CONSTRAINT `fk_solicitacao_tarefa_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacao` (`solicitacao_id`),
  CONSTRAINT `fk_solicitacao_tarefa_2` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_tarefa`
--

LOCK TABLES `solicitacao_tarefa` WRITE;
/*!40000 ALTER TABLE `solicitacao_tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_tipo`
--

DROP TABLE IF EXISTS `solicitacao_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_tipo` (
  `solicitacao_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '',
  `classificacao` int(1) NOT NULL DEFAULT '0',
  `sla` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_tipo`
--

LOCK TABLES `solicitacao_tipo` WRITE;
/*!40000 ALTER TABLE `solicitacao_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_tipo_empresa`
--

DROP TABLE IF EXISTS `solicitacao_tipo_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitacao_tipo_empresa` (
  `solicitacao_tipo_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`solicitacao_tipo_id`,`empresa_id`),
  KEY `k_solicitacao_tipo_empresa_1` (`solicitacao_tipo_id`),
  KEY `k_solicitacao_tipo_empresa_2` (`empresa_id`),
  CONSTRAINT `fk_solicitacao_tipo_empresa_1` FOREIGN KEY (`solicitacao_tipo_id`) REFERENCES `solicitacao_tipo` (`solicitacao_tipo_id`),
  CONSTRAINT `fk_solicitacao_tipo_empresa_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_tipo_empresa`
--

LOCK TABLES `solicitacao_tipo_empresa` WRITE;
/*!40000 ALTER TABLE `solicitacao_tipo_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitacao_tipo_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sommusdash_usuario`
--

DROP TABLE IF EXISTS `sommusdash_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sommusdash_usuario` (
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `senha` varchar(32) NOT NULL DEFAULT '',
  `departamento` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `uk_sommusdash_usuario_1` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sommusdash_usuario`
--

LOCK TABLES `sommusdash_usuario` WRITE;
/*!40000 ALTER TABLE `sommusdash_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `sommusdash_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sped_credito_pis_cofins`
--

DROP TABLE IF EXISTS `sped_credito_pis_cofins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sped_credito_pis_cofins` (
  `sped_credito_pis_cofins_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `mes_origem` char(6) NOT NULL DEFAULT '',
  `mes_utilizado` char(6) NOT NULL DEFAULT '',
  `codigo_credito` int(3) NOT NULL DEFAULT '0',
  `valor_credito_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_credito_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_restante_pis` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_restante_cofins` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`sped_credito_pis_cofins_id`),
  UNIQUE KEY `uk_sped_credito_pis_cofins_1` (`empresa_id`,`mes_origem`,`mes_utilizado`,`codigo_credito`),
  KEY `k_sped_credito_pis_cofins_1` (`empresa_id`),
  CONSTRAINT `fk_sped_credito_pis_cofins_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sped_credito_pis_cofins`
--

LOCK TABLES `sped_credito_pis_cofins` WRITE;
/*!40000 ALTER TABLE `sped_credito_pis_cofins` DISABLE KEYS */;
INSERT INTO `sped_credito_pis_cofins` VALUES (1,3,'092022','092022',101,165.00,760.00,65.00,260.00),(2,3,'082022','082022',101,165.00,760.00,65.00,260.00);
/*!40000 ALTER TABLE `sped_credito_pis_cofins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa` (
  `tarefa_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(300) NOT NULL DEFAULT '',
  `data_hora_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_previsao` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `status` int(1) NOT NULL DEFAULT '0',
  `percentual_concluido` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `origem` int(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tarefa_id`),
  KEY `k_tarefa_1` (`empresa_id`),
  KEY `k_tarefa_2` (`usuario_id`),
  CONSTRAINT `fk_tarefa_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa_tempo`
--

DROP TABLE IF EXISTS `tarefa_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa_tempo` (
  `tarefa_tempo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tarefa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora_sistema_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_sistema_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_usuario_inicio` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `data_hora_usuario_fim` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tarefa_tempo_id`),
  KEY `k_tarefa_tempo_1` (`tarefa_id`),
  CONSTRAINT `fk_tarefa_tempo_1` FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`tarefa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa_tempo`
--

LOCK TABLES `tarefa_tempo` WRITE;
/*!40000 ALTER TABLE `tarefa_tempo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarefa_tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `veiculo_id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(7) NOT NULL DEFAULT '',
  `descricao` varchar(50) NOT NULL DEFAULT '',
  `marca` varchar(30) NOT NULL DEFAULT '',
  `modelo` varchar(30) NOT NULL DEFAULT '',
  `cor` varchar(30) NOT NULL DEFAULT '',
  `ano_fabricacao` int(4) NOT NULL DEFAULT '0',
  `ano_modelo` int(4) NOT NULL DEFAULT '0',
  `combustivel` int(1) NOT NULL DEFAULT '0',
  `renavam` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`veiculo_id`),
  UNIQUE KEY `uk_veiculo_1` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'ABC0153','Carro da empresa','Volkswagen','Gol G5 1.0','Prata',2011,2012,1,'00535581587335'),(2,'QWE8237','Carro de passeio','Fiat','Palho 1.0','Branco',2015,2016,2,'8234729840373');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `venda_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `operacao_id` int(11) NOT NULL DEFAULT '0',
  `cliente_id` int(11) DEFAULT NULL,
  `plano_pagamento_id` int(11) NOT NULL DEFAULT '0',
  `pagamento` int(1) NOT NULL DEFAULT '0',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_desconto_subtotal` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `percentual_acrescimo_subtotal` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `veiculo_id` int(11) DEFAULT NULL,
  `km_veiculo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `comprador` varchar(50) NOT NULL DEFAULT '',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `vendedor_id` int(11) DEFAULT NULL,
  `estoque_id` int(11) DEFAULT NULL,
  `validade` date NOT NULL DEFAULT '0000-00-00',
  `status` int(2) NOT NULL DEFAULT '0',
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `devolvida` tinyint(1) NOT NULL DEFAULT '0',
  `ordem_servico_id` int(11) DEFAULT NULL,
  `nfe_id` int(11) DEFAULT NULL,
  `nfce_id` int(11) DEFAULT NULL,
  `nfse_id` int(11) DEFAULT NULL,
  `cfe_sat_id` int(11) DEFAULT NULL,
  `cfe_mfe_id` int(11) DEFAULT NULL,
  `pdv_id` int(11) DEFAULT NULL,
  `atualizado` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`venda_id`),
  KEY `k_venda_1` (`empresa_id`),
  KEY `k_venda_2` (`operacao_id`),
  KEY `k_venda_3` (`cliente_id`),
  KEY `k_venda_4` (`plano_pagamento_id`),
  KEY `k_venda_5` (`veiculo_id`),
  KEY `k_venda_6` (`usuario_id`),
  KEY `k_venda_7` (`vendedor_id`),
  KEY `k_venda_8` (`estoque_id`),
  KEY `k_venda_9` (`ordem_servico_id`),
  KEY `k_venda_10` (`nfe_id`),
  KEY `k_venda_11` (`nfce_id`),
  KEY `k_venda_12` (`nfse_id`),
  KEY `k_venda_13` (`cfe_sat_id`),
  KEY `k_venda_14` (`cfe_mfe_id`),
  KEY `k_venda_15` (`pdv_id`),
  CONSTRAINT `fk_venda_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_venda_10` FOREIGN KEY (`nfe_id`) REFERENCES `nfe` (`nfe_id`),
  CONSTRAINT `fk_venda_11` FOREIGN KEY (`nfce_id`) REFERENCES `nfce` (`nfce_id`),
  CONSTRAINT `fk_venda_12` FOREIGN KEY (`nfse_id`) REFERENCES `nfse` (`nfse_id`),
  CONSTRAINT `fk_venda_13` FOREIGN KEY (`cfe_sat_id`) REFERENCES `cfe_sat` (`cfe_sat_id`),
  CONSTRAINT `fk_venda_14` FOREIGN KEY (`cfe_mfe_id`) REFERENCES `cfe_mfe` (`cfe_mfe_id`),
  CONSTRAINT `fk_venda_15` FOREIGN KEY (`pdv_id`) REFERENCES `pdv` (`pdv_id`),
  CONSTRAINT `fk_venda_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_venda_3` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_venda_4` FOREIGN KEY (`plano_pagamento_id`) REFERENCES `plano_pagamento` (`plano_pagamento_id`),
  CONSTRAINT `fk_venda_5` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`veiculo_id`),
  CONSTRAINT `fk_venda_7` FOREIGN KEY (`vendedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_venda_8` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_venda_9` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`ordem_servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,3,'2022-10-19 08:57:01',8,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:02'),(2,3,'2022-10-19 08:57:01',8,4,1,1,100.00,90.00,0.00,10.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Floriano Peixoto',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:03'),(3,3,'2022-10-19 08:57:01',8,4,1,1,70.00,50.00,0.00,20.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(4,3,'2022-10-19 08:57:01',8,4,1,1,15.07,15.00,0.00,0.07,0.00,0.00,0.0000,0.0000,NULL,0.00,'Eliane Bruna Ester das Neves',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(5,3,'2022-10-19 08:57:01',8,4,1,1,70.00,90.00,0.00,0.00,0.00,20.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(6,3,'2022-10-19 08:57:01',8,4,4,2,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(7,3,'2022-10-19 08:57:01',8,NULL,1,1,120.00,120.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(8,3,'2022-10-19 08:57:01',8,4,1,1,300.00,300.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(9,3,'2022-10-19 08:57:02',8,NULL,1,1,80.00,80.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:01'),(10,3,'2022-10-19 08:57:02',8,NULL,1,1,250.00,249.00,0.00,1.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:15'),(11,3,'2022-10-19 08:57:07',8,NULL,1,1,105.00,105.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:06'),(12,3,'2022-10-19 08:57:07',8,4,1,1,200000.01,200000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:06'),(13,3,'2022-10-19 08:57:07',8,NULL,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:06'),(14,3,'2022-10-19 08:57:07',8,NULL,1,1,3000.01,3000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:07'),(15,3,'2022-10-19 08:57:14',8,NULL,1,1,6.30,7.00,0.00,0.00,0.70,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:15'),(16,3,'2022-10-19 08:57:14',8,4,4,2,135.44,135.44,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:14'),(17,3,'2022-10-19 08:57:15',8,NULL,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:14'),(18,3,'2022-10-19 08:57:15',8,NULL,1,1,15.00,15.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-10-19 08:57:15');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_item`
--

DROP TABLE IF EXISTS `venda_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_item` (
  `venda_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) NOT NULL DEFAULT '0',
  `produto_id` int(11) NOT NULL DEFAULT '0',
  `produto_grade_id` int(11) DEFAULT NULL,
  `produto_lote_id` int(11) DEFAULT NULL,
  `descricao` text NOT NULL,
  `numero_item` int(11) NOT NULL DEFAULT '0',
  `quantidade` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_custo_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `preco_venda_bruto` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `valor_total_bruto` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_total_liquido` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_desconto_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_item` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_acrescimo_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int(11) NOT NULL DEFAULT '0',
  `vendedor_id` int(11) DEFAULT NULL,
  `tecnico_id` int(11) DEFAULT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `nfe_item_id` int(11) DEFAULT NULL,
  `nfce_item_id` int(11) DEFAULT NULL,
  `nfse_item_id` int(11) DEFAULT NULL,
  `cfe_sat_item_id` int(11) DEFAULT NULL,
  `cfe_mfe_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`venda_item_id`),
  KEY `k_venda_item_1` (`venda_id`),
  KEY `k_venda_item_2` (`produto_id`),
  KEY `k_venda_item_3` (`produto_grade_id`),
  KEY `k_venda_item_4` (`produto_lote_id`),
  KEY `k_venda_item_5` (`usuario_id`),
  KEY `k_venda_item_6` (`vendedor_id`),
  KEY `k_venda_item_7` (`tecnico_id`),
  KEY `k_venda_item_8` (`nfe_item_id`),
  KEY `k_venda_item_9` (`nfce_item_id`),
  KEY `k_venda_item_10` (`nfse_item_id`),
  KEY `k_venda_item_11` (`cfe_sat_item_id`),
  KEY `k_venda_item_12` (`cfe_mfe_item_id`),
  CONSTRAINT `fk_venda_item_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_venda_item_10` FOREIGN KEY (`nfse_item_id`) REFERENCES `nfse_item` (`nfse_item_id`),
  CONSTRAINT `fk_venda_item_11` FOREIGN KEY (`cfe_sat_item_id`) REFERENCES `cfe_sat_item` (`cfe_sat_item_id`),
  CONSTRAINT `fk_venda_item_12` FOREIGN KEY (`cfe_mfe_item_id`) REFERENCES `cfe_mfe_item` (`cfe_mfe_item_id`),
  CONSTRAINT `fk_venda_item_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`produto_id`),
  CONSTRAINT `fk_venda_item_3` FOREIGN KEY (`produto_grade_id`) REFERENCES `produto_grade` (`produto_grade_id`),
  CONSTRAINT `fk_venda_item_4` FOREIGN KEY (`produto_lote_id`) REFERENCES `produto_lote` (`produto_lote_id`),
  CONSTRAINT `fk_venda_item_6` FOREIGN KEY (`vendedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_venda_item_7` FOREIGN KEY (`tecnico_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_venda_item_8` FOREIGN KEY (`nfe_item_id`) REFERENCES `nfe_item` (`nfe_item_id`),
  CONSTRAINT `fk_venda_item_9` FOREIGN KEY (`nfce_item_id`) REFERENCES `nfce_item` (`nfce_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
INSERT INTO `venda_item` VALUES (1,1,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,1,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(3,2,1,1,NULL,'',1,2.0000,9.0000,100.0000,200.00,200.00,0.00,0.00,0.00,0.00,0,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(4,2,3,NULL,NULL,'',1,1.0000,2.0000,100.0000,100.00,90.00,0.00,10.00,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,3,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,3,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,3,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,3,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,3,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,3,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(11,3,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(12,4,3,NULL,NULL,'',1,1.0000,2.0000,1.0700,1.07,1.06,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(13,4,1,1,NULL,'',2,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(14,4,1,1,NULL,'',3,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(15,4,1,1,NULL,'',4,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(16,4,1,1,NULL,'',5,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(17,4,1,1,NULL,'',6,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(18,4,1,1,NULL,'',7,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(19,4,1,1,NULL,'',8,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(20,4,1,1,NULL,'',9,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(21,4,1,1,NULL,'',10,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(22,4,1,1,NULL,'',11,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(23,4,1,1,NULL,'',12,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(24,4,1,1,NULL,'',13,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(25,4,1,1,NULL,'',14,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(26,4,1,1,NULL,'',15,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(27,5,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(28,5,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(29,5,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(30,5,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(31,5,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(32,5,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(33,5,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(34,6,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(35,6,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(36,7,3,NULL,NULL,'',1,12.0000,2.0000,10.0000,120.00,120.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(37,8,3,NULL,NULL,'',1,30.0000,2.0000,10.0000,300.00,300.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(38,9,5,NULL,NULL,'',1,1.0000,5.0000,80.0000,80.00,80.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(39,10,1,1,NULL,'',1,1.0000,9.0000,100.0000,100.00,99.60,0.00,0.40,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(40,10,3,NULL,NULL,'',2,1.0000,2.0000,150.0000,150.00,149.40,0.00,0.60,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(41,11,3,NULL,NULL,'',1,10.0000,2.0000,10.5000,105.00,105.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(42,12,3,NULL,NULL,'',1,1.0000,2.0000,200000.0100,200000.01,200000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(43,13,3,NULL,NULL,'',1,3.0000,2.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(44,14,3,NULL,NULL,'',1,1.0000,2.0000,3000.0100,3000.01,3000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(45,15,5,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,7.00,0.00,0.00,0.70,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(46,16,1,1,NULL,'',1,6.0000,9.0000,5.9900,35.94,35.94,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(47,16,3,NULL,NULL,'',2,50.0000,2.0000,1.9900,99.50,99.50,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(48,17,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(49,18,1,1,NULL,'',1,3.0000,9.0000,5.0000,15.00,15.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `venda_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_meta`
--

DROP TABLE IF EXISTS `vendedor_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor_meta` (
  `vendedor_meta_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendedor_id` int(11) NOT NULL DEFAULT '0',
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `mes` char(6) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`vendedor_meta_id`),
  UNIQUE KEY `uk_vendedor_meta_1` (`vendedor_id`,`empresa_id`,`mes`),
  KEY `k_vendedor_meta_1` (`vendedor_id`),
  KEY `k_vendedor_meta_2` (`empresa_id`),
  CONSTRAINT `fk_vendedor_meta_1` FOREIGN KEY (`vendedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_vendedor_meta_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_meta`
--

LOCK TABLES `vendedor_meta` WRITE;
/*!40000 ALTER TABLE `vendedor_meta` DISABLE KEYS */;
INSERT INTO `vendedor_meta` VALUES (2,5,3,'201909',8290.30);
/*!40000 ALTER TABLE `vendedor_meta` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=1105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20220725.231548.845','2022-10-19 08:55:04','1febdd59a6e7961f0c4a7e7b5fb7bcee'),(2,2,'20220927.231853.021-financas','2022-10-19 08:55:04','5def7e019b416c54f9ed2ef3beaa6f82'),(3,2,'20220927.231856.052-financas','2022-10-19 08:55:04','6cab6520c2f6a53df7b21b566afd664f'),(4,2,'20220927.231859.082-financas','2022-10-19 08:55:04','3f916b09b2a18277a8e25b4203653425'),(5,2,'20220927.231902.116-financas','2022-10-19 08:55:04','10d334584ff261af84befbeb2388d19e'),(6,2,'20220927.231905.158-financas','2022-10-19 08:55:04','6e177b69fdacf60b4dca4627f889a0f1'),(7,2,'20220927.231908.190-financas','2022-10-19 08:55:04','bcc6ca1c88d9c2b535846801c7b1010d'),(8,2,'20220927.231911.215-financas','2022-10-19 08:55:04','20b83f439c02564180e5aa82b60d2ead'),(9,2,'20220927.231914.237-financas','2022-10-19 08:55:04','3504811ff764a7a7ccf0143f6a66711b'),(10,2,'20220927.231917.275-financas','2022-10-19 08:55:04','c49849292752f2c6e03a291d5d27a042'),(11,2,'20220927.231920.311-financas','2022-10-19 08:55:04','c0bdfb8f1fbad81e21486c39eec96517'),(12,2,'20220927.231923.342-financas','2022-10-19 08:55:04','ba2ec105455abb0ea45f0da3c43a283a'),(13,2,'20220927.231926.383-financas','2022-10-19 08:55:04','f9d976af507b05aeef7e7fbf26e825b4'),(14,2,'20220927.231929.422-financas','2022-10-19 08:55:04','5d1219042267198e9e6b76a630349ed0'),(15,2,'20220927.231932.449-financas','2022-10-19 08:55:04','e7181401559bfb2cbd392116ca535b3c'),(16,2,'20220927.231935.475-financas','2022-10-19 08:55:04','65c81a9e2fb2edf05c300e81ca5fb377'),(17,2,'20220927.231938.503-financas','2022-10-19 08:55:04','f8efa9fa1589b21e68f03fe8ff0997fb'),(18,2,'20220927.231941.539-financas','2022-10-19 08:55:04','2fd1f224cba7b358231a4c9fe7325311'),(19,2,'20220927.231944.560-financas','2022-10-19 08:55:04','fb22d5c5eadc8702cb56fd2c76b12d11'),(20,2,'20220927.231947.591-financas','2022-10-19 08:55:04','11a63419b7ea8f7e95c9e8f2413cfef3'),(21,2,'20220927.231950.619-financas','2022-10-19 08:55:05','2c9423d7045aad33e7d983edf4d54d57'),(22,2,'20220927.231953.643-financas','2022-10-19 08:55:05','139bf1d96ac7c5f62ee55badeee31312'),(23,2,'20220927.231956.678-financas','2022-10-19 08:55:05','f3daf6a6abf3a65d99311d72497cdaf3'),(24,2,'20220927.231959.720-financas','2022-10-19 08:55:05','e71c0dfc3548ede58e8168602fe207b7'),(25,2,'20220927.232002.752-financas','2022-10-19 08:55:05','cfa23e92deff258ecdfa2f79458bf48f'),(26,2,'20220927.232005.779-financas','2022-10-19 08:55:05','312add1ca9df880f5fc1ea1a8522a1e9'),(27,2,'20220927.232008.813-financas','2022-10-19 08:55:05','7e7d3c082155e4e6688a54d40e1d0e56'),(28,2,'20220927.232011.839-financas','2022-10-19 08:55:05','4a49f03076d5fb06732eed081d792069'),(29,2,'20220927.232014.867-financas','2022-10-19 08:55:05','bde19a6e5fee70709901d9313cbbbd9d'),(30,2,'20220927.232017.894-financas','2022-10-19 08:55:05','616f901595d47737ec73cdec5c4d039f'),(31,2,'20220927.232020.927-financas','2022-10-19 08:55:05','621299fe22210bb427bf60c6bf4b68ef'),(32,2,'20220927.232023.968-financas','2022-10-19 08:55:05','4dbaf485728ae4f9b2d014099cbf0b70'),(33,2,'20220927.232026.997-financas','2022-10-19 08:55:05','b0fb10404169ca47170763fe70fcbcdc'),(34,2,'20220927.232030.018-financas','2022-10-19 08:55:05','1ef332dc2b3f74e724603c5276e8e318'),(35,2,'20220927.232033.051-financas','2022-10-19 08:55:05','902c3b5078b0c1e2670af91d512bc067'),(36,2,'20220927.232036.093-financas','2022-10-19 08:55:05','37ae63d399699464273032d1fe86a960'),(37,2,'20220927.232039.127-financas','2022-10-19 08:55:05','4c5ae65d82a487f250db0c4d774e06fe'),(38,2,'20220927.232042.162-financas','2022-10-19 08:55:05','5036d14101f73d706ed4af1dd1c7e4ad'),(39,2,'20220927.232045.187-financas','2022-10-19 08:55:05','b35173124cf85253350efb89f0ed6612'),(40,2,'20220927.232048.220-financas','2022-10-19 08:55:05','8502052ca9cbb6f3b4d5797d50493983'),(41,2,'20220927.232051.257-financas','2022-10-19 08:55:05','a32bb6097266011f9d4c44be2be127aa'),(42,2,'20220927.232054.286-financas','2022-10-19 08:55:05','89a8bb4925069b5d04aa4c75af6c69df'),(43,2,'20220927.232057.328-financas','2022-10-19 08:55:05','f1ba6db2ed337674b756271303e6d3d1'),(44,2,'20220927.232100.367-financas','2022-10-19 08:55:05','4a56dc8ad645f444be66be1c7624a8a9'),(45,2,'20220927.232103.395-financas','2022-10-19 08:55:05','b6eb68cd0b098158a0f05774ea80f338'),(46,2,'20220927.232106.423-financas','2022-10-19 08:55:05','51d0f6dcb63069b36ad355c682b32f35'),(47,2,'20220927.232109.456-financas','2022-10-19 08:55:05','717e3ed3314930dd68266018bb8803ef'),(48,2,'20220927.232112.491-financas','2022-10-19 08:55:05','d16bd2c6ab5a9d5977f50fefe90baae2'),(49,2,'20220927.232115.513-financas','2022-10-19 08:55:05','e9d9fb94b7c9cb14c3d4ff24fbdac7d7'),(50,2,'20220927.232118.547-financas','2022-10-19 08:55:05','b7650c2033c342a3a62339ae925fb88d'),(51,2,'20220927.232121.575-financas','2022-10-19 08:55:05','4f560e0be469a8a573f448a1645b4fef'),(52,2,'20220927.232124.607-financas','2022-10-19 08:55:05','c13fd5597a116c4675b431744746d205'),(53,2,'20220927.232127.635-financas','2022-10-19 08:55:05','80354eeaa1ada36591ffe4bafde9cac5'),(54,2,'20220927.232130.676-financas','2022-10-19 08:55:05','40b721e08d181172f4663d971a078e65'),(55,2,'20220927.232133.705-financas','2022-10-19 08:55:05','e587a2a1c9645a62bd4fd50cd5e963eb'),(56,2,'20220927.232136.737-financas','2022-10-19 08:55:05','87350e8ea658aef9bf42ec4a5e3cd7b1'),(57,2,'20220927.232139.771-financas','2022-10-19 08:55:05','c52a5a626820f95ac52f11620d001cc3'),(58,2,'20220927.232142.802-financas','2022-10-19 08:55:05','e801a67aae0f679245b3eba6f3c64c29'),(59,2,'20220927.232145.829-financas','2022-10-19 08:55:05','9fb0e9223880a0c92857916747b3cc37'),(60,2,'20220927.232148.858-financas','2022-10-19 08:55:05','687438ecb53378b40033b43733fce159'),(61,2,'20220927.232151.889-financas','2022-10-19 08:55:05','80a3919dd4a23fd88614d760a7f91f6c'),(62,2,'20220927.232154.913-financas','2022-10-19 08:55:05','3c8acafd399457a1fbae1c5207d9932f'),(63,2,'20220927.232157.949-financas','2022-10-19 08:55:05','2f7b5aadfc9b7cbebabde582098e7634'),(64,2,'20220927.232200.972-financas','2022-10-19 08:55:05','a20a2a28e03c53fb4e744909e38fcda1'),(65,2,'20220927.232204.006-financas','2022-10-19 08:55:05','0ca7c197f982837e70b79c10399ecdc5'),(66,2,'20220927.232207.039-financas','2022-10-19 08:55:05','7ee428ce0d4cd129e3f59f7384d4c403'),(67,2,'20220927.232210.064-financas','2022-10-19 08:55:05','77b97bf7eaef58651893a9918070d1fd'),(68,2,'20220927.232213.090-financas','2022-10-19 08:55:05','ac30f0e216554bcd7d4078f74d4b8f22'),(69,2,'20220927.232216.129-financas','2022-10-19 08:55:05','b9b1f621e13f8be5d5f5fa225aa178fe'),(70,2,'20220927.232219.167-financas','2022-10-19 08:55:05','57e0c1aba4da600727d9784c309ef4d5'),(71,2,'20220927.232222.193-financas','2022-10-19 08:55:05','f36a6e8f18d45d42e73611339e109697'),(72,2,'20220927.232225.219-financas','2022-10-19 08:55:05','64b3ef9a4f49bea16dc40eeccccdd66e'),(73,2,'20220927.232228.256-financas','2022-10-19 08:55:05','a2e2bc88e837c0b214abe09bfee0a70b'),(74,2,'20220927.232231.283-financas','2022-10-19 08:55:05','9e3ff4db59c3f134bb8388aae98af085'),(75,2,'20220927.232234.314-financas','2022-10-19 08:55:05','5b82306d683fee0beac4caa778cb9365'),(76,2,'20220927.232237.348-financas','2022-10-19 08:55:05','0dca1f04aee5664bc93074050cd4e389'),(77,2,'20220927.232240.374-financas','2022-10-19 08:55:05','f41d42c2d50950ac16e8b5f7fe9aa3f1'),(78,2,'20220927.232243.406-financas','2022-10-19 08:55:05','5d02af0e35ebbb9813278e73566c541e'),(79,2,'20220927.232246.448-financas','2022-10-19 08:55:05','9315b4056c08b8d50317f96c1b5aca88'),(80,2,'20220927.232249.485-financas','2022-10-19 08:55:05','d890fa5c4b925db03f33867cc16043e2'),(81,2,'20220927.232252.522-financas','2022-10-19 08:55:05','5dd869197257886f5032642b39cf4138'),(82,2,'20220927.232255.558-financas','2022-10-19 08:55:05','0ded82692e40aee50a131698a99a0d62'),(83,2,'20220927.232258.583-financas','2022-10-19 08:55:05','b20731801e8cdc4befa97009874a61ed'),(84,2,'20220927.232301.622-financas','2022-10-19 08:55:05','d33fb29d555aff12914b3a492f3f012c'),(85,2,'20220927.232304.657-financas','2022-10-19 08:55:05','514244fde2fb58380514f3ec47f87f23'),(86,2,'20220927.232307.681-financas','2022-10-19 08:55:05','101e55ccb2fe18f3d4af29353f102794'),(87,2,'20220927.232310.703-financas','2022-10-19 08:55:05','391ef6c382e77d31c06ac4594e02dfc1'),(88,2,'20220927.232313.739-financas','2022-10-19 08:55:05','175226b91e2c1dad824584731333ba27'),(89,2,'20220927.232316.772-financas','2022-10-19 08:55:05','ea588c3385dcf52355b8097396278581'),(90,2,'20220927.232319.805-financas','2022-10-19 08:55:05','38629b8da8d83b1636bb030bc585661f'),(91,2,'20220927.232322.838-financas','2022-10-19 08:55:05','57695a0ad2ccdb2cee28a11b6ee548ab'),(92,2,'20220927.232325.873-financas','2022-10-19 08:55:05','3b23b4cfdc8d0bfb7f8ccd86b9207abb'),(93,2,'20220927.232328.902-financas','2022-10-19 08:55:05','be12953fdf1d40cfa3392b34198b955d'),(94,2,'20220927.232331.926-financas','2022-10-19 08:55:05','24066b3935ba9f686f922b69892c0e68'),(95,2,'20220927.232334.967-financas','2022-10-19 08:55:05','bd885e2ae2379da2aad24442de5c045c'),(96,2,'20220927.232338.003-financas','2022-10-19 08:55:05','29310eea6da7a327cb99cf697f40b1e2'),(97,2,'20220927.232341.029-financas','2022-10-19 08:55:05','b08a4bb656b81673da4df6d66de20a20'),(98,2,'20220927.232344.066-financas','2022-10-19 08:55:05','54a8ace2384fbf6675b166747fcdb500'),(99,2,'20220927.232347.103-financas','2022-10-19 08:55:05','6395b43f4b92d14b4a1d9eb615254ef0'),(100,2,'20220927.232350.132-financas','2022-10-19 08:55:05','5507b6dd8f96c613cf9556da51141ab7'),(101,2,'20220927.232353.175-financas','2022-10-19 08:55:05','63e966a23146d4169109e140f42ede86'),(102,2,'20220927.232356.206-financas','2022-10-19 08:55:05','22d325d17e16866ef50d0adb482eed9b'),(103,2,'20220927.232359.244-financas','2022-10-19 08:55:05','e34f5c2ef6908e264f2eb118909e12d0'),(104,2,'20220927.232402.269-financas','2022-10-19 08:55:05','9dba3ea89d15b9e72c99391fd6a41f3f'),(105,2,'20220927.232405.304-financas','2022-10-19 08:55:05','26d3125e0c30aa7a75b994243b34b2d0'),(106,2,'20220927.232408.343-financas','2022-10-19 08:55:05','9a2b4025ad7092868e1050382ec4be46'),(107,2,'20220927.232411.376-financas','2022-10-19 08:55:05','72c750ee4b2d2310644819d8612966b4'),(108,2,'20220927.232414.410-financas','2022-10-19 08:55:05','1077dbcf39e4ccb8e2c1e7a1d52482de'),(109,2,'20220927.232417.444-financas','2022-10-19 08:55:05','f16af4d9869b783e428d919dfa6e6485'),(110,2,'20220927.232420.471-financas','2022-10-19 08:55:05','a4ef098c1185a87efd25704553eb3570'),(111,2,'20220927.232423.505-financas','2022-10-19 08:55:05','76d93abbaf7611fc473c8803ec4ddc0f'),(112,2,'20220927.232426.546-financas','2022-10-19 08:55:05','eded8593dd82a994f2cd12f9448260a0'),(113,2,'20220927.232429.583-financas','2022-10-19 08:55:05','51c8f1e5ffd570b4f1dff20ae448485e'),(114,2,'20220927.232432.614-financas','2022-10-19 08:55:05','6fe5997550575022e61b498a927b0fa9'),(115,2,'20220927.232435.654-financas','2022-10-19 08:55:05','a423c8c4e84f032442014662b11bfd0f'),(116,2,'20220927.232438.684-financas','2022-10-19 08:55:05','b9b2df33f911c34a452670d4cdbeb828'),(117,2,'20220927.232441.715-financas','2022-10-19 08:55:05','65265840d474dd3c6915b16c600faed7'),(118,2,'20220927.232444.751-financas','2022-10-19 08:55:05','d0030323ce482b54e09d7a17c0f56a35'),(119,2,'20220927.232447.784-financas','2022-10-19 08:55:05','9428ece45cb13b0baf93d43b32a145d7'),(120,2,'20220927.232450.819-financas','2022-10-19 08:55:05','e41b8be7912001162bc60da693e80f20'),(121,2,'20220927.232453.859-financas','2022-10-19 08:55:05','764dff95d79ee9cbfb83437f29258a21'),(122,2,'20220927.232456.892-financas','2022-10-19 08:55:05','dc0540906d781dad5ee5776cf26830ff'),(123,2,'20220927.232459.921-financas','2022-10-19 08:55:05','b5edb41d2451175af167a16eceecfd04'),(124,2,'20220927.232502.953-financas','2022-10-19 08:55:05','d12f6ebdaf06aa6fd4e5f2ce04125204'),(125,2,'20220927.232505.981-financas','2022-10-19 08:55:05','7d916d54e88dd832b9841e487249e52a'),(126,2,'20220927.232509.010-financas','2022-10-19 08:55:05','3b5ac7259ada814cdd537e32a52301e9'),(127,2,'20220927.232512.043-financas','2022-10-19 08:55:05','655f13d6e1796ae268291a8d34c926d8'),(128,2,'20220927.232515.073-financas','2022-10-19 08:55:05','b4bc500f7d218e87e5332ef730bbb6aa'),(129,2,'20220927.232518.111-financas','2022-10-19 08:55:05','5a414e925ae8e5158b4249ada8448dde'),(130,2,'20220927.232521.154-financas','2022-10-19 08:55:05','34ce8e6e5b76d29f31070899727d001b'),(131,2,'20220927.232524.192-financas','2022-10-19 08:55:05','668e98cf943dcf76583345f16fa1b3c4'),(132,2,'20220927.232527.226-financas','2022-10-19 08:55:05','48efd0cb0087780f76b26af12fe16922'),(133,2,'20220927.232530.257-financas','2022-10-19 08:55:05','eda815b419c3c45f084ab31c66994830'),(134,2,'20220927.232533.279-financas','2022-10-19 08:55:05','77678b84fb0f8a73cf7ffa85558e9ea8'),(135,2,'20220927.232536.304-financas','2022-10-19 08:55:05','a0b4279554a38aaeb3c0fd38e9538944'),(136,2,'20220927.232539.334-financas','2022-10-19 08:55:05','ac3af1953cd389683d24ceb6eb1d3757'),(137,2,'20220927.232542.376-financas','2022-10-19 08:55:05','1407ee908e620d68e618b48187e3ff80'),(138,2,'20220927.232545.411-financas','2022-10-19 08:55:05','2a869aee3e9a7da1c21759deb4ae9a62'),(139,2,'20220927.232548.441-financas','2022-10-19 08:55:05','2ad95fe6c311c02deeb05157c5a13d67'),(140,2,'20220927.232551.469-financas','2022-10-19 08:55:05','b267575eb5f460ebcb7f47b1a277ba33'),(141,2,'20220927.232554.498-financas','2022-10-19 08:55:05','9df3bb89024203631688a53708d1c731'),(142,2,'20220927.232557.529-financas','2022-10-19 08:55:05','d0719ca5e5e5839d810dbc7c63a1a333'),(143,2,'20220927.232600.560-financas','2022-10-19 08:55:05','7a6c9eb45a31c2445770c603302b15a1'),(144,2,'20220927.232603.602-financas','2022-10-19 08:55:05','559404931a775cbcedffa11c95a7575b'),(145,2,'20220927.232606.641-financas','2022-10-19 08:55:05','896cb29b5dc4c3e3b8a37323aed8a69b'),(146,2,'20220927.232609.672-financas','2022-10-19 08:55:05','3111c7d96e8a1557ab20f87da0969a12'),(147,2,'20220927.232612.696-financas','2022-10-19 08:55:05','ab552afa7a05c691d7314eb678a47079'),(148,2,'20220927.232615.725-financas','2022-10-19 08:55:05','377de3972b671b2034309a42e7ee7438'),(149,2,'20220927.232618.759-financas','2022-10-19 08:55:05','c7c37ef03da0a426723b05928bd8d280'),(150,2,'20220927.232621.791-financas','2022-10-19 08:55:05','e7805026312ec23302a1e161455f18b4'),(151,2,'20220927.232624.818-financas','2022-10-19 08:55:05','c580f458be35d0e0b893ebba9e453898'),(152,2,'20220927.232627.854-financas','2022-10-19 08:55:05','b65bd1b040390de5cf19019786c02959'),(153,2,'20220927.232630.891-financas','2022-10-19 08:55:05','849c6b76e1d899e79153ffd729fbdb22'),(154,2,'20220927.232633.913-financas','2022-10-19 08:55:05','56065fc7ce82b345dcf00087b82e8d96'),(155,2,'20220927.232636.944-financas','2022-10-19 08:55:05','6863cd577ecbae2d6830619c458ccbe0'),(156,2,'20220927.232639.974-financas','2022-10-19 08:55:05','5173815950e0bd883f93a01ae626e0cf'),(157,2,'20220927.232643.008-financas','2022-10-19 08:55:05','4a2bda7ed8fc2d24b9994cdb9bf69202'),(158,2,'20220927.232646.039-financas','2022-10-19 08:55:05','0cdc2511006cfa60d710825ec5cdae2a'),(159,2,'20220927.232649.072-financas','2022-10-19 08:55:05','222f104b52ae1203c96643782d68efd5'),(160,2,'20220927.232652.103-financas','2022-10-19 08:55:05','aac43e521a67a987b86e870ecf3278f4'),(161,2,'20220927.232655.134-financas','2022-10-19 08:55:05','c5463e04d22cb804ceea642468642cd6'),(162,2,'20220927.232658.169-financas','2022-10-19 08:55:05','048e7e1583d8c07d3876c232741a77cb'),(163,2,'20220927.232701.204-financas','2022-10-19 08:55:05','46536f3b86771b559283656386707877'),(164,2,'20220927.232704.237-financas','2022-10-19 08:55:05','ddc0be96200c7c8aa2b111d0fc79242f'),(165,2,'20220927.232707.265-financas','2022-10-19 08:55:05','d7573bd603d247e64b516728fe405693'),(166,2,'20220927.232710.291-financas','2022-10-19 08:55:05','46e2c27bfdee5282fd8dfdbc1a3e04b7'),(167,2,'20220927.232713.319-financas','2022-10-19 08:55:05','bf17040c77a864c48041e4ed59b68524'),(168,2,'20220927.232716.345-financas','2022-10-19 08:55:05','5c1967de364017170bd22efec11125a1'),(169,2,'20220927.232719.376-financas','2022-10-19 08:55:05','28bf3d7e527df798151eb03f32c229cd'),(170,2,'20220927.232722.413-financas','2022-10-19 08:55:05','99583e121811c8bd08f6b8c68e89c921'),(171,2,'20220927.232725.451-financas','2022-10-19 08:55:05','fd0cf529950b7215683b8b553b3f7a8f'),(172,2,'20220927.232728.475-financas','2022-10-19 08:55:05','44e014d655cf89fe782f2af7cb7ceac8'),(173,2,'20220927.232731.509-financas','2022-10-19 08:55:05','5b9662dacee906f4780f5e8a073f3935'),(174,2,'20220927.232734.538-financas','2022-10-19 08:55:05','08dc9572f08d4f6bb1b6122cae984802'),(175,2,'20220927.232737.569-financas','2022-10-19 08:55:05','50acc27b62a689a263122bd641e75a86'),(176,2,'20220927.232740.596-financas','2022-10-19 08:55:05','24036c2703b63fca1dfb6543e5cd0720'),(177,2,'20220927.232743.629-financas','2022-10-19 08:55:05','b4e4a0d2ff8edbfe3e97ee1b64beecbe'),(178,2,'20220927.232746.669-financas','2022-10-19 08:55:05','4ba757c9933e6d0d0d6f5f413251321d'),(179,2,'20220927.232749.707-financas','2022-10-19 08:55:05','05888712f516f06c39aacf30aa864cdd'),(180,2,'20220927.232752.736-financas','2022-10-19 08:55:05','95045156ef99f90e4a338924454a7c15'),(181,2,'20220927.232755.766-financas','2022-10-19 08:55:05','3a1f95cba7e0a43cfa14ca8d60894371'),(182,2,'20220927.232758.799-financas','2022-10-19 08:55:05','9c6e7331d3781a18b0a111b1d7bbaf40'),(183,2,'20220927.232801.839-financas','2022-10-19 08:55:05','d7fa939f9523a96e667f03f6ea5f2ead'),(184,2,'20220927.232804.868-financas','2022-10-19 08:55:05','2870e83ca3298f31a0387e12448b2261'),(185,2,'20220927.232807.904-financas','2022-10-19 08:55:05','ca286f71ea437e19c4f2fa2ef5b66696'),(186,2,'20220927.232810.940-financas','2022-10-19 08:55:05','ea65bbb1d71ebc86871ff0f9328c03d1'),(187,2,'20220927.232813.974-financas','2022-10-19 08:55:05','247521c468d64795b96968363854cf25'),(188,2,'20220927.232817.010-financas','2022-10-19 08:55:05','dc0b793afed341ebc319e52fa2720768'),(189,2,'20220927.232820.040-financas','2022-10-19 08:55:05','4b4e1123bde6d1e32c37456f7c78b37b'),(190,2,'20220927.232823.062-financas','2022-10-19 08:55:05','a776fd7f75b4df600a3f1bbb0b3cf347'),(191,2,'20220927.232826.092-financas','2022-10-19 08:55:05','f83e15eff0d230024a239a36ba7590af'),(192,2,'20220927.232829.122-financas','2022-10-19 08:55:05','4ad3a9fba0bfd19665ac4801ab1ee133'),(193,2,'20220927.232832.143-financas','2022-10-19 08:55:05','b4325c1c4ac535ca3f2d66540f62f063'),(194,2,'20220927.232835.174-financas','2022-10-19 08:55:05','701819a28c3f280903651e607d3b1e87'),(195,2,'20220927.232838.193-financas','2022-10-19 08:55:05','1d89243cca7dc546c093476271148174'),(196,2,'20220927.232841.224-financas','2022-10-19 08:55:05','b73fe3aa68f000e0c090f36f2893b2e4'),(197,2,'20220927.232844.252-financas','2022-10-19 08:55:05','0ddee0811fc147f8ad44e79e0294bca7'),(198,2,'20220927.232847.290-financas','2022-10-19 08:55:05','c1ae9f72c26e747a130d454a9f0cba3d'),(199,2,'20220927.232850.325-financas','2022-10-19 08:55:05','e546d395b9310e11f8ef80599ada09c6'),(200,2,'20220927.232853.357-financas','2022-10-19 08:55:05','b5248df76b7e38443aa64c8b61c66d5b'),(201,2,'20220927.232856.391-financas','2022-10-19 08:55:05','edc6d85f9a6d86d664b1a440df7d219b'),(202,2,'20220927.232859.421-financas','2022-10-19 08:55:05','67b9a18b28fcf138ea560e60c3c079e5'),(203,2,'20220927.232902.454-financas','2022-10-19 08:55:05','0daac72328086413a0109a64df67ad17'),(204,2,'20220927.232905.477-financas','2022-10-19 08:55:05','f62f46938bcc2dcf9bb77dba3430e210'),(205,2,'20220927.232908.500-financas','2022-10-19 08:55:05','4b19106b0960096175d2ed863b8ce086'),(206,2,'20220927.232911.522-financas','2022-10-19 08:55:05','35b1223b1fcd518ab9be4385d006e5b8'),(207,2,'20220927.232914.565-financas','2022-10-19 08:55:05','88ddd585515080ed791769c8f6b49d6f'),(208,2,'20220927.232917.598-financas','2022-10-19 08:55:05','234488ff3df99b6858432a87a07df5f8'),(209,2,'20220927.232920.621-financas','2022-10-19 08:55:05','d2cfe190639df84b3a130e13cd39d698'),(210,2,'20220927.232923.657-financas','2022-10-19 08:55:05','2a0fb1ff473b93808e5b9ed2a357ce42'),(211,2,'20220927.232926.695-financas','2022-10-19 08:55:05','11311525b1140c8dde6262f3b6b00c40'),(212,2,'20220927.232929.719-financas','2022-10-19 08:55:05','dd41660eb0cbb3d5ec4f99c68eb9dc76'),(213,2,'20220927.232932.746-financas','2022-10-19 08:55:05','9bb2a0ee50aba264c81c1fbf76158442'),(214,2,'20220927.232935.782-financas','2022-10-19 08:55:05','05e7cc6959c7427d4d0e457e58c93bd1'),(215,2,'20220927.232938.815-financas','2022-10-19 08:55:05','27b502636ffa6dcdca2dd23034a96080'),(216,2,'20220927.232941.849-financas','2022-10-19 08:55:05','dd900bdf3f3d26eaf536b527ff0acae5'),(217,2,'20220927.232944.888-financas','2022-10-19 08:55:05','2085fe6661d6b982cf27c25d620a17d0'),(218,2,'20220927.232947.917-financas','2022-10-19 08:55:05','660048da39cccb30d36c7b625bddabf0'),(219,2,'20220927.232950.951-financas','2022-10-19 08:55:05','9ec4db4648085960eec7c70a0b932075'),(220,2,'20220927.232953.974-financas','2022-10-19 08:55:05','6658b7f1583967e18a2a10d362208a62'),(221,2,'20220927.232957.014-financas','2022-10-19 08:55:05','c299a418a770ea867b02cc72918bdd05'),(222,2,'20220927.233000.051-financas','2022-10-19 08:55:05','d8130cfd7a630995ab9d824d8670e563'),(223,2,'20220927.233003.079-financas','2022-10-19 08:55:05','7d1a8092b6cf9005ccaee81e26442c38'),(224,2,'20220927.233006.103-financas','2022-10-19 08:55:05','c8f391ac861077c3e8f9e703657673d9'),(225,2,'20220927.233009.138-financas','2022-10-19 08:55:05','2dd75dd9f32e2863728b347d51fc1830'),(226,2,'20220927.233012.173-financas','2022-10-19 08:55:05','e68c8e1a655c9dd0473d69251fe9f972'),(227,2,'20220927.233015.214-financas','2022-10-19 08:55:05','ead511b31afd43bad4d00d15348be28f'),(228,2,'20220927.233018.251-financas','2022-10-19 08:55:05','c6c25911d49e0ec98a1e6042698945c3'),(229,2,'20220927.233021.285-financas','2022-10-19 08:55:05','28d99650a61846b9a247eef394363d5f'),(230,2,'20220927.233024.319-financas','2022-10-19 08:55:05','0d4327f2ab037144893450148e243654'),(231,2,'20220927.233027.356-financas','2022-10-19 08:55:05','d0d40139aad233e181c9a74e494a536e'),(232,2,'20220927.233030.384-financas','2022-10-19 08:55:05','1a1f5489205a967c54a05dec56d311b5'),(233,2,'20220927.233033.418-financas','2022-10-19 08:55:05','6cead2b503bdd911914a723859c6a9c5'),(234,2,'20220927.233036.448-financas','2022-10-19 08:55:05','0dd26f089047096ee54680404bcb9d5f'),(235,2,'20220927.233039.475-financas','2022-10-19 08:55:05','b81429a3d5f2bb0159f01f335cb9d30a'),(236,2,'20220927.233042.508-financas','2022-10-19 08:55:05','5aa972bffc5e5715dd17b9a0ab45afbe'),(237,2,'20220927.233045.537-financas','2022-10-19 08:55:05','8428c370d557761ba08444a5140636b3'),(238,2,'20220927.233048.574-financas','2022-10-19 08:55:05','140dda8a65b860686d754a793500b8d9'),(239,2,'20220927.233051.607-financas','2022-10-19 08:55:05','3c637d0787a80fa632923193fa3843ac'),(240,2,'20220927.233054.633-financas','2022-10-19 08:55:05','9fbd4282fedc985d000f11a8757ddada'),(241,2,'20220927.233057.670-financas','2022-10-19 08:55:05','b586dc1ada4234952226d0161ea7897e'),(242,2,'20220927.233100.705-financas','2022-10-19 08:55:05','fbf460921f46ea70ed41884db1529d43'),(243,2,'20220927.233103.739-financas','2022-10-19 08:55:05','e3247ed630bd1e698f4b2f28f4fcb6fd'),(244,2,'20220927.233106.773-financas','2022-10-19 08:55:05','1c04e15e0e09e7bac09c26f12216e104'),(245,2,'20220927.233109.798-financas','2022-10-19 08:55:05','f3e7b22f2f0942ac5fca9af405698707'),(246,2,'20220927.233112.826-financas','2022-10-19 08:55:05','0191fe70e3448f8dce6f5746efeac11b'),(247,2,'20220927.233115.869-financas','2022-10-19 08:55:05','e94db1f5394eb6aa463d1544f1a3a260'),(248,2,'20220927.233118.907-financas','2022-10-19 08:55:05','fd05718ce84efd0442a36a3e4faa22f4'),(249,2,'20220927.233121.950-financas','2022-10-19 08:55:05','274971e0e06438d4b04131eb322c7bdf'),(250,2,'20220927.233124.971-financas','2022-10-19 08:55:05','134b2f32ceb7ecd28dd9b9cf2d3c1a2c'),(251,2,'20220927.233127.996-financas','2022-10-19 08:55:05','3c6f0c992fc95b87135cee717d91b9b8'),(252,2,'20220927.233131.020-financas','2022-10-19 08:55:05','957ec817aad950e9ae95a6f865578f9e'),(253,2,'20220927.233134.048-financas','2022-10-19 08:55:05','5aa984b73696e7aebbee9647acabb27c'),(254,2,'20220927.233137.082-financas','2022-10-19 08:55:05','0fb8f3457697dae09c1a27fe45b928ce'),(255,2,'20220927.233140.114-financas','2022-10-19 08:55:05','30037b635ae92d0388105ad7559ae920'),(256,2,'20220927.233143.138-financas','2022-10-19 08:55:05','9baa0ad9b7ae3c3809ac231eb62cf9d5'),(257,2,'20220927.233146.165-financas','2022-10-19 08:55:05','a1f096f8e008429aa32afb1261ceb341'),(258,2,'20220927.233149.197-financas','2022-10-19 08:55:05','8d1c1ee741771b19869708efb5cd2c13'),(259,2,'20220927.233152.220-financas','2022-10-19 08:55:05','0705e1cedc3c9719aeb743868862c1ec'),(260,2,'20220927.233155.254-financas','2022-10-19 08:55:05','39d42d3e6ecf1163062200b95e6906a5'),(261,2,'20220927.233158.293-financas','2022-10-19 08:55:05','1acbdc61b76617553d982c720ccc8fdf'),(262,2,'20220927.233201.333-financas','2022-10-19 08:55:05','6134c14941331330f607278dd5b6a2a2'),(263,2,'20220927.233204.354-financas','2022-10-19 08:55:05','f89223a5b16d05aca8f15affbb4a7295'),(264,2,'20220927.233207.389-financas','2022-10-19 08:55:05','54af90aec4472e836d77f038d906e9c8'),(265,2,'20220927.233210.421-financas','2022-10-19 08:55:05','5d632d727c4e167c269dc63d2a70ab2b'),(266,2,'20220927.233213.451-financas','2022-10-19 08:55:05','2b95e1fad0e682fe8c1d26c162886a1b'),(267,2,'20220927.233216.484-financas','2022-10-19 08:55:05','347ac24926dc34930bf9c87222bbdcdf'),(268,2,'20220927.233219.516-financas','2022-10-19 08:55:05','d5fefd85cf40bbdab2c3f15cecc85f97'),(269,2,'20220927.233222.552-financas','2022-10-19 08:55:05','91e3861904ce2665c869aa5e49ca5312'),(270,2,'20220927.233225.592-financas','2022-10-19 08:55:05','2d55436770a48014e453f51849dbbc88'),(271,2,'20220927.233228.620-financas','2022-10-19 08:55:05','f57dca6e2f2f0e6cea743d665c7b2dbb'),(272,2,'20220927.233231.649-financas','2022-10-19 08:55:05','dc3b81ef524997fba6d7abf58d71165d'),(273,2,'20220927.233234.669-financas','2022-10-19 08:55:05','058d62890d4138293cd4914968d40ab7'),(274,2,'20220927.233237.700-financas','2022-10-19 08:55:05','3de202c15c7a297b8606458636fe7e8c'),(275,2,'20220927.233240.741-financas','2022-10-19 08:55:05','403272343b047dcde80e55a8d65105e8'),(276,2,'20220927.233243.772-financas','2022-10-19 08:55:05','453c4b7cad9293047443cf41f4a583f9'),(277,2,'20220927.233246.800-financas','2022-10-19 08:55:05','ae40adf1ac0567a6043d5883ba1b0e94'),(278,2,'20220927.233249.833-financas','2022-10-19 08:55:05','5cc493df1ebcb0857aa0e850b3a59ff2'),(279,2,'20220927.233252.865-financas','2022-10-19 08:55:05','bc264593165893a3d9518e2122cd24f3'),(280,2,'20220927.233255.902-financas','2022-10-19 08:55:05','720d1ac9000b3292c5ca239c8e54e20e'),(281,2,'20220927.233258.928-financas','2022-10-19 08:55:05','10a6df85e7fc49672befd348dc7b4c6c'),(282,2,'20220927.233301.965-financas','2022-10-19 08:55:05','d1669494f098263af381758060af0245'),(283,2,'20220927.233304.995-financas','2022-10-19 08:55:05','3f508d6295aac9b0fba88e71c7d89c02'),(284,2,'20220927.233308.032-financas','2022-10-19 08:55:05','b3b3bdc632a308a718a41c7e8c9f90e0'),(285,2,'20220927.233311.065-financas','2022-10-19 08:55:05','61ed0368e384aa65ead7b2c33b2f4c05'),(286,2,'20220927.233314.087-financas','2022-10-19 08:55:05','1ef10fda1def1467d5f6187253465cdd'),(287,2,'20220927.233317.123-financas','2022-10-19 08:55:05','e18eed8c6c8909f985e8692507946de0'),(288,2,'20220927.233320.152-financas','2022-10-19 08:55:05','b70cf3576b1f100c20e5297171594dc3'),(289,2,'20220927.233323.176-financas','2022-10-19 08:55:05','6f96afdde2bfc8e191ca9e2a80516a96'),(290,2,'20220927.233326.216-financas','2022-10-19 08:55:05','d9c43da069f824722928d0ec04217d97'),(291,2,'20220927.233329.250-financas','2022-10-19 08:55:05','544ce105f5ab3b8fcb60173bfb650070'),(292,2,'20220927.233332.286-financas','2022-10-19 08:55:05','83ce14c48c5607460b69705333c2eb03'),(293,2,'20220927.233335.309-financas','2022-10-19 08:55:05','cedfae53f0ea96ccd76c5eb17d0fb141'),(294,2,'20220927.233338.333-financas','2022-10-19 08:55:05','b76b52f0251e8a77cc4a31a39557b35a'),(295,2,'20220927.233341.370-financas','2022-10-19 08:55:05','1dc44439566d36b6146ebf2487e9f476'),(296,2,'20220927.233344.403-financas','2022-10-19 08:55:05','8cf38da529aaca0de9ce770028b31c25'),(297,2,'20220927.233347.437-financas','2022-10-19 08:55:05','77c2e3882e2f3bfa2b1820a3b3879f7b'),(298,2,'20220927.233350.473-financas','2022-10-19 08:55:05','abcb6297f1edd6dabbe11d420db02a35'),(299,2,'20220927.233353.505-financas','2022-10-19 08:55:05','e9eaaf9a2d92ba28310b0a77010cdb3d'),(300,2,'20220927.233356.539-financas','2022-10-19 08:55:05','ea75b61f80e377bb5023fb3f167dd7e1'),(301,2,'20220927.233359.570-financas','2022-10-19 08:55:05','1d7ae2e7d1d840d034689e3ea215379f'),(302,2,'20220927.233402.594-financas','2022-10-19 08:55:05','95d3a9b5ace29c5f44a0ca7c336baba5'),(303,2,'20220927.233405.621-financas','2022-10-19 08:55:05','2689462c2a80f2a5ea6063cb11518c98'),(304,2,'20220927.233408.650-financas','2022-10-19 08:55:05','875973a82dbfc65e4b7670d33e918b82'),(305,2,'20220927.233411.675-financas','2022-10-19 08:55:05','57294b4a77125515ccc7679a42b3909b'),(306,2,'20220927.233414.710-financas','2022-10-19 08:55:05','e773f5a890103e05d7c80a68d744b315'),(307,2,'20220927.233417.737-financas','2022-10-19 08:55:05','7d7d06e782e82eb75fe5f20b95c37696'),(308,2,'20220927.233420.764-financas','2022-10-19 08:55:05','52b60fe6cb30e114abad689f78fff55f'),(309,2,'20220927.233423.788-financas','2022-10-19 08:55:05','e49c9cd8d7ae3e1e47534066de3123ca'),(310,2,'20220927.233426.817-financas','2022-10-19 08:55:05','2d856e6bca6c25624dd68057cf719d2d'),(311,2,'20220927.233429.843-financas','2022-10-19 08:55:05','33d5ec03c801b9029eae7b8828fad2ea'),(312,2,'20220927.233432.871-financas','2022-10-19 08:55:05','b19c7f598ada37edbe00031a68019fa2'),(313,2,'20220927.233435.901-financas','2022-10-19 08:55:05','45cd9da2a140295cb6dfba2314e0c37d'),(314,2,'20220927.233438.928-financas','2022-10-19 08:55:05','4bf41f675f9bbb66c18790bf7cc91b96'),(315,2,'20220927.233441.956-financas','2022-10-19 08:55:05','f8faa433a1539fd6e2d1aafd650c112c'),(316,2,'20220927.233444.994-financas','2022-10-19 08:55:05','0b42f2cb7cc264d81d5b9a1d7607d8fe'),(317,2,'20220927.233448.030-financas','2022-10-19 08:55:05','cab6e0b437d4a6c932f79de03d6c8201'),(318,2,'20220927.233451.058-financas','2022-10-19 08:55:05','d45c4dd9f0bc954de25ed2c61fd69839'),(319,2,'20220927.233454.093-financas','2022-10-19 08:55:05','91d6afbb3e399d7c77daa31f4630cedc'),(320,2,'20220927.233457.121-financas','2022-10-19 08:55:05','999fe67f836fc70799771e653e4c4a8a'),(321,2,'20220927.233500.160-financas','2022-10-19 08:55:05','a759f812c3a018aa3f865ac0833ce189'),(322,2,'20220927.233503.188-financas','2022-10-19 08:55:05','f9a0d4be880c1e308a44e41ff5def419'),(323,2,'20220927.233506.220-financas','2022-10-19 08:55:05','51b9e2c2fc3abde1d0736cd2ee0c8629'),(324,2,'20220927.233509.252-financas','2022-10-19 08:55:05','3a7389e04c23eaba3562f2277cfed604'),(325,2,'20220927.233512.279-financas','2022-10-19 08:55:05','102d4e3f95c4d1ec5770dd38f3f7c264'),(326,2,'20220927.233515.317-financas','2022-10-19 08:55:05','a813e1a5760f160f25c58e5e61c8df18'),(327,2,'20220927.233518.346-financas','2022-10-19 08:55:05','30a7149b062f7e803a3e01747738a5c0'),(328,2,'20220927.233521.383-financas','2022-10-19 08:55:05','9805cbbb30d0d274e7604563d38c8881'),(329,2,'20220927.233524.416-financas','2022-10-19 08:55:05','a109d241b1a5210d4adbfa6dc337aa08'),(330,2,'20220927.233527.451-financas','2022-10-19 08:55:05','e8611a132cf1316d58dd895b0e7d0712'),(331,2,'20220927.233530.482-financas','2022-10-19 08:55:05','50afdd35ad91e0c64f1d9875545912b6'),(332,2,'20220927.233533.508-financas','2022-10-19 08:55:05','fbf2cdb13cec26c9ee9b142c1654b50b'),(333,2,'20220927.233536.538-financas','2022-10-19 08:55:05','c9396ea46301204e36a1e1ebe16dc317'),(334,2,'20220927.233539.570-financas','2022-10-19 08:55:05','9395c01006318f3fbf4b7f507decfad3'),(335,2,'20220927.233542.602-financas','2022-10-19 08:55:05','49bb45f589f3c6ac6cfa7567da59691b'),(336,2,'20220927.233545.635-financas','2022-10-19 08:55:05','2b8e9bf2744feef9f5e35436a5069da4'),(337,2,'20220927.233548.663-financas','2022-10-19 08:55:05','5b5e156dd60beeca71b4ccf8418cb2c0'),(338,2,'20220927.233551.702-financas','2022-10-19 08:55:05','dd508480a2bd41d1151f6d5fac271f3e'),(339,2,'20220927.233554.731-financas','2022-10-19 08:55:05','7e96e4ad9904b75e89497a3f64c3ff4e'),(340,2,'20220927.233557.763-financas','2022-10-19 08:55:05','a8179efe1abe2133de60b46b520a2e8d'),(341,2,'20220927.233600.787-financas','2022-10-19 08:55:05','0081cfc83d01f32c27dcb957484f2dff'),(342,2,'20220927.233603.828-financas','2022-10-19 08:55:05','7d8bce6f4ab374cc881b8cd02fd2519d'),(343,2,'20220927.233606.856-financas','2022-10-19 08:55:05','f747ce48adfcba58392c7a1dded939a1'),(344,2,'20220927.233609.882-financas','2022-10-19 08:55:05','27396e3896cc6816c91365baa27795c5'),(345,2,'20220927.233612.916-financas','2022-10-19 08:55:05','8e819ed7721bf6c2ef4be81e690b9930'),(346,2,'20220927.233615.956-financas','2022-10-19 08:55:05','5ebd5d7b4e90f3851c11b508de34c3d9'),(347,2,'20220927.233618.986-financas','2022-10-19 08:55:05','72aeff01ce5026bc70b9c5cd9fad0778'),(348,2,'20220927.233622.014-financas','2022-10-19 08:55:05','8955532c6d9b10b6e95dd3d2bf5b7da4'),(349,2,'20220927.233625.042-financas','2022-10-19 08:55:05','53ed0b3bebef2732f4a210025efefa49'),(350,2,'20220927.233628.079-financas','2022-10-19 08:55:05','1f5b07205184bb7430c52871ee65c980'),(351,2,'20220927.233631.113-financas','2022-10-19 08:55:05','c0037ab7006d74e1d5bb7b53c073a578'),(352,2,'20220927.233634.148-financas','2022-10-19 08:55:05','681674933fad9401097709c1c680b1b2'),(353,2,'20220927.233637.174-financas','2022-10-19 08:55:05','9569d75a6e806fd48f9bad5d8a49ba89'),(354,2,'20220927.233640.203-financas','2022-10-19 08:55:05','b7bc5ece778a9297a2ff8c059d53e6e0'),(355,2,'20220927.233643.239-financas','2022-10-19 08:55:05','684824c7857287dc6c9cd55783f546ac'),(356,2,'20220927.233646.274-financas','2022-10-19 08:55:05','a135eadab893bc4a4e876fdeb662bad6'),(357,2,'20220927.233649.314-financas','2022-10-19 08:55:05','e2ec53ad5c2bed8ba9860e546d6e6365'),(358,2,'20220927.233652.341-financas','2022-10-19 08:55:05','8d6633dc9a51b48ccb14a5b46be52b4e'),(359,2,'20220927.233655.369-financas','2022-10-19 08:55:05','55ba36486316d7e90ba9a9da145e9325'),(360,2,'20220927.233658.406-financas','2022-10-19 08:55:05','cff4ac665b9eba9da31ad1bd95d4cd1e'),(361,2,'20220927.233701.434-financas','2022-10-19 08:55:05','af8a13a7e89ce3460c152b1bbf7e8e37'),(362,2,'20220927.233704.470-financas','2022-10-19 08:55:05','6c7efc74b59382df005a4bbc56cd02be'),(363,2,'20220927.233707.503-financas','2022-10-19 08:55:05','41200fa8c7089419dc66c188a7ff46a2'),(364,2,'20220927.233710.545-financas','2022-10-19 08:55:05','f7e342f3d6f4cf29bb3c337e3fbb6a43'),(365,2,'20220927.233713.585-financas','2022-10-19 08:55:05','8655748f22d235b730fe6a38174b23a1'),(366,2,'20220927.233716.615-financas','2022-10-19 08:55:05','b797151139b0d0efb172de30eacb0124'),(367,2,'20220927.233719.646-financas','2022-10-19 08:55:05','1cfb1c59509b5e3f443dbcac14e7b369'),(368,2,'20220927.233722.675-financas','2022-10-19 08:55:05','6744ef2cb2a8d012045d46f8e97b66f0'),(369,2,'20220927.233725.702-financas','2022-10-19 08:55:05','162f1bbf7884b64cab96e99dfad5f3ba'),(370,2,'20220927.233728.733-financas','2022-10-19 08:55:05','6a42ed77dc8e73ba370c16278a14a775'),(371,2,'20220927.233731.770-financas','2022-10-19 08:55:05','6a2eda31603200f329eca3a383c1e64c'),(372,2,'20220927.233734.803-financas','2022-10-19 08:55:05','f1fbd002de16baabd8b0b74cb0e89927'),(373,2,'20220927.233737.839-financas','2022-10-19 08:55:05','85002ddcdfcdf5128058820533fa0df3'),(374,2,'20220927.233740.871-financas','2022-10-19 08:55:05','3650d63d10dcffa10ef157ae1f48644c'),(375,2,'20220927.233743.907-financas','2022-10-19 08:55:05','00bbd6c75f371e62fbfb17b14c30c71f'),(376,2,'20220927.233746.934-financas','2022-10-19 08:55:05','f73255c7f16be284cd83bd1e3ba0d2b1'),(377,2,'20220927.233749.963-financas','2022-10-19 08:55:05','b2b392c7edd50da269640a118e014474'),(378,2,'20220927.233753.003-financas','2022-10-19 08:55:05','b96c80098a83b52de0042a79c69d04d0'),(379,2,'20220927.233756.033-financas','2022-10-19 08:55:05','38d54c4d11588f9f0ee1c7e7e9431f8f'),(380,2,'20220927.233759.067-financas','2022-10-19 08:55:05','489724c19fb629a66b30f95d2dc0eca3'),(381,2,'20220927.233802.099-financas','2022-10-19 08:55:05','e803ec28015eb46e4d78a5e0e8918aa9'),(382,2,'20220927.233805.139-financas','2022-10-19 08:55:05','314fdb54c7acc66ea6bc50f6c31c59e6'),(383,2,'20220927.233808.164-financas','2022-10-19 08:55:05','1b552690efe1b3617d66985862472729'),(384,2,'20220927.233811.192-financas','2022-10-19 08:55:05','865cb5ab66bb8fe9c1bd1a17679be29c'),(385,2,'20220927.233814.222-financas','2022-10-19 08:55:05','e39aa3252f78e720838da96d696fd9a5'),(386,2,'20220927.233817.252-financas','2022-10-19 08:55:05','16e115fe232a13cb23b1d45e459a09f5'),(387,2,'20220927.233820.280-financas','2022-10-19 08:55:05','2a97918ed03bd38528fa6946178c2375'),(388,2,'20220927.233823.308-financas','2022-10-19 08:55:05','4741e8f24163f20d1ea82e17577f59dd'),(389,2,'20220927.233826.348-financas','2022-10-19 08:55:05','4e648ec9b1339bffeab1b2a504c7c998'),(390,2,'20220927.233829.388-financas','2022-10-19 08:55:05','6c02870a9b7bdccb33ba7dbbe02d728c'),(391,2,'20220927.233832.426-financas','2022-10-19 08:55:05','a7f59307e8287e7f0e5cc9c5953ab852'),(392,2,'20220927.233835.452-financas','2022-10-19 08:55:05','8b02350429eb6e120e587c355ec4e8e3'),(393,2,'20220927.233838.483-financas','2022-10-19 08:55:05','30c97ce491be528e547901cdef35bd80'),(394,2,'20220927.233841.510-financas','2022-10-19 08:55:05','77eae517406c9e18c40503f459e211a0'),(395,2,'20220927.233844.540-financas','2022-10-19 08:55:05','10579482a146933a3be8b2fbfc6ac18d'),(396,2,'20220927.233847.567-financas','2022-10-19 08:55:05','6455959cefcf9684f9a8ef8b59b73b84'),(397,2,'20220927.233850.604-financas','2022-10-19 08:55:05','9519ef1eb35ab7f69d09fd1c0772b6db'),(398,2,'20220927.233853.626-financas','2022-10-19 08:55:05','d1a9a4b8bc0ec1f306527546ffb5e245'),(399,2,'20220927.233856.660-financas','2022-10-19 08:55:05','817693f8ad533810e754bca128a9e9c9'),(400,2,'20220927.233859.698-financas','2022-10-19 08:55:05','2c160153e063402a748982bb7f1be37f'),(401,2,'20220927.233902.727-financas','2022-10-19 08:55:05','dcc3093406a77d615447cf4255c92c0e'),(402,2,'20220927.233905.755-financas','2022-10-19 08:55:05','cd7598db3b355d358482b433c633c813'),(403,2,'20220927.233908.783-financas','2022-10-19 08:55:05','410ce5c6ade4db7c3fb1b86151ace2ec'),(404,2,'20220927.233911.822-financas','2022-10-19 08:55:05','32c947ccce771e8fd2e35b1a2581fb01'),(405,2,'20220927.233914.848-financas','2022-10-19 08:55:05','197feb810cdf95c5d05f8a7a804cca83'),(406,2,'20220927.233917.883-financas','2022-10-19 08:55:05','ed34470c3cdf8651e6758075f17733f6'),(407,2,'20220927.233920.911-financas','2022-10-19 08:55:05','d056330d8e2fdf75a1423a6524e14ad5'),(408,2,'20220927.233923.943-financas','2022-10-19 08:55:05','76f814e0943b3b6d1ead473440e8808a'),(409,2,'20220927.233926.980-financas','2022-10-19 08:55:05','5405e766f3b58646a7c24d6e217de7ec'),(410,2,'20220927.233930.002-financas','2022-10-19 08:55:05','4d1c3987ef4ea07c738a94a143aa1780'),(411,2,'20220927.233933.033-financas','2022-10-19 08:55:05','2241686675c8defa83dd07f8ae80bf51'),(412,2,'20220927.233936.059-financas','2022-10-19 08:55:05','318a18066aa24ef14ad5ed5ff6fe9f7e'),(413,2,'20220927.233939.083-financas','2022-10-19 08:55:05','a56ab0a7789fe9aaa6b1428568bdb174'),(414,2,'20220927.233942.114-financas','2022-10-19 08:55:05','a883522ee6a822fa4433d7725d3f7718'),(415,2,'20220927.233945.146-financas','2022-10-19 08:55:05','7b44895da2583801cc9297fb41f7f3e0'),(416,2,'20220927.233948.182-financas','2022-10-19 08:55:05','9e89170c9566781e78a1d62b8e478cc4'),(417,2,'20220927.233951.214-financas','2022-10-19 08:55:05','971b2f877dfb2edf4db2d40ba0c1815c'),(418,2,'20220927.233954.246-financas','2022-10-19 08:55:05','fffe0698b5361eb6ec6832fa9bf429a1'),(419,2,'20220927.233957.277-financas','2022-10-19 08:55:05','035ab99f405e9c98ae18d80fe993a737'),(420,2,'20220927.234000.314-financas','2022-10-19 08:55:05','fb56b4bfabcc3ef07e76271c604c9d42'),(421,2,'20220927.234003.355-financas','2022-10-19 08:55:05','b83cd1e542b95614a64be27bd755060a'),(422,2,'20220927.234006.387-financas','2022-10-19 08:55:05','626e222d331386992b019a3a42ea4865'),(423,2,'20220927.234009.422-financas','2022-10-19 08:55:05','39ad97ed127d6cba6265a3f494acf241'),(424,2,'20220927.234012.459-financas','2022-10-19 08:55:05','83a5c5bc8b697caae9a2d7d8ba5a6458'),(425,2,'20220927.234015.492-financas','2022-10-19 08:55:05','3ff325a519ec104d7a2d2ad6efaa4aa7'),(426,2,'20220927.234018.526-financas','2022-10-19 08:55:05','adc528bafcd8928a013d4320572524e0'),(427,2,'20220927.234021.564-financas','2022-10-19 08:55:05','4544f92d2ccbceacc2ba5cd191e69264'),(428,2,'20220927.234024.597-financas','2022-10-19 08:55:05','6391e8f9bae247b38e4fbb8b00024326'),(429,2,'20220927.234027.624-financas','2022-10-19 08:55:05','d95053073816d46ad92d24fc8e9d6a7f'),(430,2,'20220927.234030.652-financas','2022-10-19 08:55:05','7194f138504edf301a63e4e5c6bbc292'),(431,2,'20220927.234033.680-financas','2022-10-19 08:55:05','8b856d4765e9eb2399702e2a8ce5be71'),(432,2,'20220927.234036.716-financas','2022-10-19 08:55:05','9ecd984302bbf61a6a2cda0f28b64fa3'),(433,2,'20220927.234039.750-financas','2022-10-19 08:55:05','8269d455f86ece3baf13a194efc38272'),(434,2,'20220927.234042.783-financas','2022-10-19 08:55:05','80750f5e7071a187d4fa53c5f6b72f11'),(435,2,'20220927.234045.824-financas','2022-10-19 08:55:05','4523d8e332684b0528b27816431c14f8'),(436,2,'20220927.234048.861-financas','2022-10-19 08:55:05','4ac61b10902dba8d014593cf5485bc49'),(437,2,'20220927.234051.896-financas','2022-10-19 08:55:05','c148661206a3872268b145e4b6744c80'),(438,2,'20220927.234054.919-financas','2022-10-19 08:55:05','a95e87e8e2cb997b745c9ac01fc3a77c'),(439,2,'20220927.234057.948-financas','2022-10-19 08:55:05','ea6fec6e97971d5bebe2fd0f11b18a57'),(440,2,'20220927.234100.982-financas','2022-10-19 08:55:05','f7dd7d1b8f1fd34d4f7988378578d7ec'),(441,2,'20220927.234104.009-financas','2022-10-19 08:55:05','a1a637e8e66419b73ccc535d7c242f59'),(442,2,'20220927.234107.042-financas','2022-10-19 08:55:05','674f1772c57a339babdf481fd8822d61'),(443,2,'20220927.234110.074-financas','2022-10-19 08:55:05','f30212fe5cc6517b9cac746baf9b7f55'),(444,2,'20220927.234113.111-financas','2022-10-19 08:55:05','a8e665f3eef63ca80e070380c3163bee'),(445,2,'20220927.234116.143-financas','2022-10-19 08:55:05','4b795f0a0b23ec3e4ec32d6a62614eb3'),(446,2,'20220927.234119.177-financas','2022-10-19 08:55:05','0d4052a93487caf844d1ab7d999d3247'),(447,2,'20220927.234122.223-financas','2022-10-19 08:55:05','863ff71fc6d24daaf68b0913a997901c'),(448,2,'20220927.234125.250-financas','2022-10-19 08:55:05','299356e85f0f7775f591276a45411839'),(449,2,'20220927.234128.279-financas','2022-10-19 08:55:05','f3c4cb6588700b59ce457b72973ca790'),(450,2,'20220927.234131.309-financas','2022-10-19 08:55:05','2c3716e4653b22bc0d81d79b1da51521'),(451,2,'20220927.234134.344-financas','2022-10-19 08:55:05','64d383b2c819b56c9af6c287454a5af6'),(452,2,'20220927.234137.383-financas','2022-10-19 08:55:05','c0c6aa2dd5a9187712af335ff1464fdc'),(453,2,'20220927.234140.415-financas','2022-10-19 08:55:05','a36d79c4da56d69315859b567e288dbf'),(454,2,'20220927.234143.438-financas','2022-10-19 08:55:05','d484a08fc2b841eeb62bb2c309e00dcb'),(455,2,'20220927.234146.463-financas','2022-10-19 08:55:05','5a834bf007216782ae1737d015717f51'),(456,2,'20220927.234149.499-financas','2022-10-19 08:55:05','29f31ceca0becaf91244dc4351817f6c'),(457,2,'20220927.234152.529-financas','2022-10-19 08:55:05','8bab2cebeb79913e6f2418e5ed9ada8f'),(458,2,'20220927.234155.560-financas','2022-10-19 08:55:05','bc5029459a8084b25c135d4152cd1436'),(459,2,'20220927.234158.602-financas','2022-10-19 08:55:05','0a7cfb84125991b2725c484428aed602'),(460,2,'20220927.234201.632-financas','2022-10-19 08:55:05','2aa15f467a9834e12edabb4031205de4'),(461,2,'20220927.234204.659-financas','2022-10-19 08:55:05','3029888bf69161f989abb4724539f6c5'),(462,2,'20220927.234207.685-financas','2022-10-19 08:55:05','1bd1600f6168c3570f2160cc47bcf795'),(463,2,'20220927.234210.720-financas','2022-10-19 08:55:05','645847196a48d617f34be14fda1c648e'),(464,2,'20220927.234213.750-financas','2022-10-19 08:55:05','2e8ed157a728cbd6e08858d65acd5657'),(465,2,'20220927.234216.790-financas','2022-10-19 08:55:05','e2d90659eda7badcdc879f5a3b175496'),(466,2,'20220927.234219.817-financas','2022-10-19 08:55:05','f7c59988bb3eecd047343401aac03166'),(467,2,'20220927.234222.846-financas','2022-10-19 08:55:05','de183008ae15534869ed9466b91889e5'),(468,2,'20220927.234225.877-financas','2022-10-19 08:55:05','085fbd2bc9a073d747141a3233a9dfc2'),(469,2,'20220927.234228.905-financas','2022-10-19 08:55:05','76fb3b285bb8d07a751ce06e74e29164'),(470,2,'20220927.234231.935-financas','2022-10-19 08:55:05','858bbc7cd6a1c9df89a02d41ebc4eb5e'),(471,2,'20220927.234234.973-financas','2022-10-19 08:55:05','f9ecf9532615611c8dcfbc61a96c690a'),(472,2,'20220927.234237.995-financas','2022-10-19 08:55:05','d75cb0aa9fb8d323f0ab007127437f68'),(473,2,'20220927.234241.022-financas','2022-10-19 08:55:05','bac64a5bc9ee9de46feae83190febb96'),(474,2,'20220927.234244.049-financas','2022-10-19 08:55:05','aa8208e0290374da844847c053675ed3'),(475,2,'20220927.234247.072-financas','2022-10-19 08:55:05','0b3fec6581dff76d4a655ca19f77b811'),(476,2,'20220927.234250.102-financas','2022-10-19 08:55:05','f927fbb4b401631cbbdaeb0b145f0552'),(477,2,'20220927.234253.132-financas','2022-10-19 08:55:05','d26627c7a88fb1698254b81b7e3e1ed6'),(478,2,'20220927.234256.154-financas','2022-10-19 08:55:05','045b184f6d061174bdb7ee5287f7a9fb'),(479,2,'20220927.234259.185-financas','2022-10-19 08:55:05','579027f00b134f59c971c3d45292dc95'),(480,2,'20220927.234302.226-financas','2022-10-19 08:55:05','09f86211e78f89d336db02be7a9a20ff'),(481,2,'20220927.234305.266-financas','2022-10-19 08:55:05','39064d28390b19de1f1cbbfd4a69cb7e'),(482,2,'20220927.234308.285-financas','2022-10-19 08:55:05','213a5dfa91b111d0c6c1cdc69b5b4ea3'),(483,2,'20220927.234311.309-financas','2022-10-19 08:55:05','b1bc41a25e7890f21e0669cdf4386245'),(484,2,'20220927.234314.346-financas','2022-10-19 08:55:05','1e4d292091101528b597c3cb873c2725'),(485,2,'20220927.234317.371-financas','2022-10-19 08:55:05','50d11669aadd7989ac79dc81d4132d0c'),(486,2,'20220927.234320.407-financas','2022-10-19 08:55:05','4af65253baf2679560576a22b5094deb'),(487,2,'20220927.234323.442-financas','2022-10-19 08:55:05','a926a712ee3789569445011261d7f103'),(488,2,'20220927.234326.470-financas','2022-10-19 08:55:05','98742a376bf489f49996b57a2b000688'),(489,2,'20220927.234329.500-financas','2022-10-19 08:55:05','888e27ec8ee9971bcf369039b671de3c'),(490,2,'20220927.234332.536-financas','2022-10-19 08:55:05','3342a94870f4a62da5529573517a87bf'),(491,2,'20220927.234335.565-financas','2022-10-19 08:55:05','2226160619003dcfec168b50061fd868'),(492,2,'20220927.234338.589-financas','2022-10-19 08:55:05','7a27889b35bd69cdd04064b5f3ae8e54'),(493,2,'20220927.234341.613-financas','2022-10-19 08:55:05','a881b3e26fc5dee8ebfffb840b9ea3ad'),(494,2,'20220927.234344.648-financas','2022-10-19 08:55:05','60e634b81035ac72d976a784352c77a1'),(495,2,'20220927.234347.686-financas','2022-10-19 08:55:05','8f2760ec1eff29b8a01efd82081e7f34'),(496,2,'20220927.234350.718-financas','2022-10-19 08:55:05','2e372aa31a069b8e9a11d1ce1ae7c676'),(497,2,'20220927.234353.754-financas','2022-10-19 08:55:05','6a75f8d90660501f1fdbcd8b090ffc67'),(498,2,'20220927.234356.786-financas','2022-10-19 08:55:05','15529466b56b443d3548a6df68f02232'),(499,2,'20220927.234359.815-financas','2022-10-19 08:55:05','c20372ab30490c4bc4243628b8fecb1b'),(500,2,'20220927.234402.850-financas','2022-10-19 08:55:05','242bbad1d04b7deafd6a5a7ef5bbd3fa'),(501,2,'20220927.234405.879-financas','2022-10-19 08:55:05','aed92e399ca5c8de42e282d22fc796ef'),(502,2,'20220927.234408.909-financas','2022-10-19 08:55:05','a2b69701221bd388e527c0d69ca5e4ac'),(503,2,'20220927.234411.945-financas','2022-10-19 08:55:05','edf88546bbe4fdcc56e57c0312c8f9aa'),(504,2,'20220927.234414.973-financas','2022-10-19 08:55:05','e484dfbfab92a5393467f618d501f614'),(505,2,'20220927.234418.005-financas','2022-10-19 08:55:05','525b18c51e6b0d694231a0ab55cd5345'),(506,2,'20220927.234421.033-financas','2022-10-19 08:55:05','d7df15add85099425e9c81157f102928'),(507,2,'20220927.234424.053-financas','2022-10-19 08:55:05','a8e17b221574877620b7cfd12a45b325'),(508,2,'20220927.234427.086-financas','2022-10-19 08:55:05','21915f1b8d220077915c12eb81dedcf5'),(509,2,'20220927.234430.124-financas','2022-10-19 08:55:05','9285475ac46d6ba903907d8a55525afd'),(510,2,'20220927.234433.150-financas','2022-10-19 08:55:05','596a6583885c58ebc928bf4920c04f57'),(511,2,'20220927.234436.187-financas','2022-10-19 08:55:05','f6226a144866a821ef7de6832f1319b8'),(512,2,'20220927.234439.218-financas','2022-10-19 08:55:05','298898b9dd1a84aceb868c3d82bab47a'),(513,2,'20220927.234442.242-financas','2022-10-19 08:55:05','695ebf5d5e3e5d2f64308deffdd6b9c8'),(514,2,'20220927.234445.280-financas','2022-10-19 08:55:05','b5b583e24b06e429273258cb5a307015'),(515,2,'20220927.234448.302-financas','2022-10-19 08:55:05','8b4f11deafaba972ac5a49d9f2191f5f'),(516,2,'20220927.234451.337-financas','2022-10-19 08:55:05','1487ddab80d7c0f9a675946ffbf848aa'),(517,2,'20220927.234454.363-financas','2022-10-19 08:55:05','c00821bfe24b98d60c0bbbf1f413e140'),(518,2,'20220927.234457.399-financas','2022-10-19 08:55:05','eb602610bad985e1b9726c343e006f1b'),(519,2,'20220927.234500.428-financas','2022-10-19 08:55:05','862d45d7a7645ecc68418fcc59687742'),(520,2,'20220927.234503.466-financas','2022-10-19 08:55:05','32f8318d8b2373dd696c0c6e4971d3e9'),(521,2,'20220927.234506.492-financas','2022-10-19 08:55:05','ea1852822633ef55253b5f6b33746df3'),(522,2,'20220927.234509.515-financas','2022-10-19 08:55:05','d24f5a6902859c43d6d0df0d0f4e3627'),(523,2,'20220927.234512.544-financas','2022-10-19 08:55:05','93af4d95a405d26fd9f0819118b8e9cb'),(524,2,'20220927.234515.573-financas','2022-10-19 08:55:05','6590fd6fd68b0eff3ff921c96204714c'),(525,2,'20220927.234518.607-financas','2022-10-19 08:55:05','9467db419cebefeb478abb273daaf172'),(526,2,'20220927.234521.650-financas','2022-10-19 08:55:05','fb28a09e21795bde54238d822eb806a8'),(527,2,'20220927.234524.691-financas','2022-10-19 08:55:05','57b1f08f54fb37d34400b89ea2467dd2'),(528,2,'20220927.234527.727-financas','2022-10-19 08:55:05','00a1f3066385fc5d91dec050b6a5d167'),(529,2,'20220927.234530.755-financas','2022-10-19 08:55:05','2b93bb3c52c5aa35546a8ecd5804d547'),(530,2,'20220927.234533.783-financas','2022-10-19 08:55:05','31b7d19415cc299daff8e02faa6545ab'),(531,2,'20220927.234536.811-financas','2022-10-19 08:55:05','7c5acafda6cb47f2588e0cb58c470e1b'),(532,2,'20220927.234539.840-financas','2022-10-19 08:55:05','ab3b973cce0707c0cebce4b748bab59c'),(533,2,'20220927.234542.875-financas','2022-10-19 08:55:05','e781c32472bfc432c3a212e6f1077ed7'),(534,2,'20220927.234545.915-financas','2022-10-19 08:55:05','595fa5723b569fa30a7d9a7e3e2d6f49'),(535,2,'20220927.234548.943-financas','2022-10-19 08:55:05','0f112b5bae2e3cd42a54c7c0d59ee85b'),(536,2,'20220927.234551.965-financas','2022-10-19 08:55:05','38f8db3ecd1379edd0bac89aded18165'),(537,2,'20220927.234554.999-financas','2022-10-19 08:55:05','271659d1c5c97fb233f3b2b844dd2a1d'),(538,2,'20220927.234558.033-financas','2022-10-19 08:55:05','bf204611d6eb60ff7cddab13101b5744'),(539,2,'20220927.234601.061-financas','2022-10-19 08:55:05','bb712882f14edf7ed93fc013a7ab8afb'),(540,2,'20220927.234604.087-financas','2022-10-19 08:55:05','5cc9573e7c1a6393cd77f541c9b1db1b'),(541,2,'20220927.234607.113-financas','2022-10-19 08:55:05','da27d2e5c2b3c00d2eb2daf55b598fb2'),(542,2,'20220927.234610.142-financas','2022-10-19 08:55:05','73247351344fd0c0c88f545700c344d9'),(543,2,'20220927.234613.167-financas','2022-10-19 08:55:05','3ec13594101e6ea7a091474aa685ad40'),(544,2,'20220927.234616.199-financas','2022-10-19 08:55:05','6d33108c6bb7d4eb507e74f24a2a4975'),(545,2,'20220927.234619.225-financas','2022-10-19 08:55:05','d259e61190a8dc89c0bef45e5461f88f'),(546,2,'20220927.234622.260-financas','2022-10-19 08:55:05','769fc189f9852d537f4f73fcf37eeaa1'),(547,2,'20220927.234625.281-financas','2022-10-19 08:55:05','7d6237459150dc79ea50c6ac4350f8a2'),(548,2,'20220927.234628.310-financas','2022-10-19 08:55:05','1492e5205623e1bf07274c9f7c0ad056'),(549,2,'20220927.234631.345-financas','2022-10-19 08:55:05','0d6915db2d643b393711f1426fc899bd'),(550,2,'20220927.234634.367-financas','2022-10-19 08:55:05','41790b9313bfc37eda38a3a2df7ac2f5'),(551,2,'20220927.234637.395-financas','2022-10-19 08:55:05','f06450f55c6c07ea2e7ea41407a9dd60'),(552,2,'20220927.234640.433-financas','2022-10-19 08:55:05','62a1cb32f8bc044bcea17c9682025f68'),(553,2,'20220927.234643.466-financas','2022-10-19 08:55:05','fa6bb001b3cf4396abefd33eb3fc0678'),(554,2,'20220927.234646.499-financas','2022-10-19 08:55:05','72e79f2b8f83ac6af693a26af74392e8'),(555,2,'20220927.234649.531-financas','2022-10-19 08:55:05','5dd20d1f44856658507e697fc022084a'),(556,2,'20220927.234652.558-financas','2022-10-19 08:55:05','35cd15d8548c915c7f9da9e9c1ac677b'),(557,2,'20220927.234655.593-financas','2022-10-19 08:55:05','458ab5afe4e2d9c96cf1a40918da9491'),(558,2,'20220927.234658.628-financas','2022-10-19 08:55:05','a83f75e6431edac2e437fd2af89a5d37'),(559,2,'20220927.234701.655-financas','2022-10-19 08:55:05','4204b437f7647215053d2bdd32be624e'),(560,2,'20220927.234704.694-financas','2022-10-19 08:55:05','b3d7fad567d6c61819c7197ddde3a4ad'),(561,2,'20220927.234707.731-financas','2022-10-19 08:55:05','d96875de3bf51b54fcf2bc0a32fd4f78'),(562,2,'20220927.234710.762-financas','2022-10-19 08:55:05','ac8fe3309ca13de41ee1df6ff165015a'),(563,2,'20220927.234713.798-financas','2022-10-19 08:55:05','6eeadfaacbdf339ad73202d3cbd6f8ca'),(564,2,'20220927.234716.828-financas','2022-10-19 08:55:05','d58d06ccf8f64d12854bc03767a8c1a9'),(565,2,'20220927.234719.859-financas','2022-10-19 08:55:05','14c00cba0beafd3ce03aa06ce72a0fd1'),(566,2,'20220927.234722.892-financas','2022-10-19 08:55:05','15e5fb17c53b6f132f1d058b5bb743e6'),(567,2,'20220927.234725.924-financas','2022-10-19 08:55:05','0ce3f1817a350673514cc7c076c42b26'),(568,2,'20220927.234728.952-financas','2022-10-19 08:55:05','dc88317bfffc62a11a946c8255c3dfc2'),(569,2,'20220927.234731.973-financas','2022-10-19 08:55:05','2a940f740fbe27e89b56c30e9737976d'),(570,2,'20220927.234735.011-financas','2022-10-19 08:55:05','b14ffe0b2438ab659fdcaca5d6f3c9a5'),(571,2,'20220927.234738.038-financas','2022-10-19 08:55:05','cb0465ba46830805d3de80ccccca03e5'),(572,2,'20220927.234741.072-financas','2022-10-19 08:55:05','e450ee31732990c059240b0a99ba32f6'),(573,2,'20220927.234744.110-financas','2022-10-19 08:55:05','13163be0d636e2b1566ca7aabf19db6f'),(574,2,'20220927.234747.131-financas','2022-10-19 08:55:05','0b8f49b293a5b3f47a062c9b6439da8d'),(575,2,'20220927.234750.167-financas','2022-10-19 08:55:05','4e654f7b982b7383aa882a726af47284'),(576,2,'20220927.234753.206-financas','2022-10-19 08:55:05','60d7c542b27817741fa133fa93b38d97'),(577,2,'20220927.234756.227-financas','2022-10-19 08:55:05','2d7e6c56613769a9125efe01218e1652'),(578,2,'20220927.234759.250-financas','2022-10-19 08:55:05','ce6df5adb480bcfa16f1e61baa151344'),(579,2,'20220927.234802.280-financas','2022-10-19 08:55:05','29d22765e8a143828534dbeb7e7ea403'),(580,2,'20220927.234805.310-financas','2022-10-19 08:55:05','5157712e72d048ddc633571f2a76bd38'),(581,2,'20220927.234808.348-financas','2022-10-19 08:55:05','e437b44c031817ab4a3bdae75d1b8069'),(582,2,'20220927.234811.383-financas','2022-10-19 08:55:05','b90e6355fb88f1457267a0667b5ce77a'),(583,2,'20220927.234814.409-financas','2022-10-19 08:55:05','9c5992d04a190f36068cbf77755ddd22'),(584,2,'20220927.234817.434-financas','2022-10-19 08:55:05','b247f5cae9a5d583eab6d6a873ebe658'),(585,2,'20220927.234820.463-financas','2022-10-19 08:55:05','40836d0c50cf579b283c58d43dabe80d'),(586,2,'20220927.234823.502-financas','2022-10-19 08:55:05','7a91cb82852d9ffca9a9428b521fcdcb'),(587,2,'20220927.234826.538-financas','2022-10-19 08:55:05','b99a52e989b94815172c46f43ecd055b'),(588,2,'20220927.234829.575-financas','2022-10-19 08:55:05','8d27450cf272017184ac81b0a93c4dd9'),(589,2,'20220927.234832.602-financas','2022-10-19 08:55:05','e29d1c2d6719ef13651fdaebaca93c26'),(590,2,'20220927.234835.630-financas','2022-10-19 08:55:05','9a815e7d8bbcae03556333425d7563db'),(591,2,'20220927.234838.660-financas','2022-10-19 08:55:05','73b6e17bd151569847b96cd7fda69ed2'),(592,2,'20220927.234841.690-financas','2022-10-19 08:55:05','c830d52551f53a40f563e12e15145058'),(593,2,'20220927.234844.722-financas','2022-10-19 08:55:05','741b97df02f4cd02878b0c1e8d9c9871'),(594,2,'20220927.234847.754-financas','2022-10-19 08:55:05','820f0d80e935c5e0b3ca6da8726651ef'),(595,2,'20220927.234850.785-financas','2022-10-19 08:55:05','09756e1ca86d3e49e9a39f42b4408758'),(596,2,'20220927.234853.816-financas','2022-10-19 08:55:05','1c173935d21bb23e647a9d755e69bc34'),(597,2,'20220927.234856.851-financas','2022-10-19 08:55:05','d16fcd055bc3e914be4c0c4088b77253'),(598,2,'20220927.234859.884-financas','2022-10-19 08:55:05','fc6d022cf0fd53c5856714dce4ee856a'),(599,2,'20220927.234902.915-financas','2022-10-19 08:55:05','84c05980cf3c3741debbeb58f047aee8'),(600,2,'20220927.234905.942-financas','2022-10-19 08:55:05','0c864d72c4504ecbb5ab28a9a65a7b15'),(601,2,'20220927.234908.972-financas','2022-10-19 08:55:05','01fad2e29af841027b99d325ed3bdc83'),(602,2,'20220927.234912.012-financas','2022-10-19 08:55:05','b497aa9b75c8c904cc09a1d2b3045231'),(603,2,'20220927.234915.041-financas','2022-10-19 08:55:05','ab1ea9f3b809b62a0d47f8ad32ae1b4f'),(604,2,'20220927.234918.072-financas','2022-10-19 08:55:05','6b93d47c0fc84927d1b553461fd18a7d'),(605,2,'20220927.234921.102-financas','2022-10-19 08:55:05','f8f8b46238c77c1f8b84f5b602d3f369'),(606,2,'20220927.234924.137-financas','2022-10-19 08:55:05','5a17f4acd187ab1966175310a37c1e7a'),(607,2,'20220927.234927.161-financas','2022-10-19 08:55:05','96a2c5462894b4f35b7d734bd7470511'),(608,2,'20220927.234930.194-financas','2022-10-19 08:55:05','8f2e91b2649589f4291cdb77fe96bcd4'),(609,2,'20220927.234933.230-financas','2022-10-19 08:55:05','e271ee78e19b732831a53ad91ccac4fd'),(610,2,'20220927.234936.271-financas','2022-10-19 08:55:05','7cd1f59805ddde916bd58d5a9376bec9'),(611,2,'20220927.234939.304-financas','2022-10-19 08:55:05','8688930fb264125227fb76c5c6c4413d'),(612,2,'20220927.234942.345-financas','2022-10-19 08:55:05','fd9c6bbae6352f699a83ea6d8e9c612a'),(613,2,'20220927.234945.373-financas','2022-10-19 08:55:05','365323bbde1db9ea53352dd664d76a54'),(614,2,'20220927.234948.402-financas','2022-10-19 08:55:05','469ec0a40004f05f286d4fbcc22cd109'),(615,2,'20220927.234951.434-financas','2022-10-19 08:55:05','cf2ca163bfb91b797735f639c331be69'),(616,2,'20220927.234954.459-financas','2022-10-19 08:55:05','287c48da93b3a93dcf2ad9a9b497d2ff'),(617,2,'20220927.234957.495-financas','2022-10-19 08:55:05','8878a390c6d725589748e8a15ece4850'),(618,2,'20220927.235000.524-financas','2022-10-19 08:55:05','5a4005b51fb588bfa3bcfd6ac2cdc383'),(619,2,'20220927.235003.563-financas','2022-10-19 08:55:05','9722b8ac04fec610cc0cd6e83c227521'),(620,2,'20220927.235006.601-financas','2022-10-19 08:55:05','31b2af2819a4580794cd48aefc5763e6'),(621,2,'20220927.235009.641-financas','2022-10-19 08:55:05','ff3b2cbabea008a4b1bdf04367f88843'),(622,2,'20220927.235012.672-financas','2022-10-19 08:55:05','6726024c5aec014bc4ca289910237b71'),(623,2,'20220927.235015.708-financas','2022-10-19 08:55:05','bcc38cee80c77ddd5bc89afa07c14710'),(624,2,'20220927.235018.735-financas','2022-10-19 08:55:05','f47e07244f23152b0ae4afd644624e96'),(625,2,'20220927.235021.757-financas','2022-10-19 08:55:05','baeff379fcd3f1b0aff0671586f769ff'),(626,2,'20220927.235024.793-financas','2022-10-19 08:55:05','618d142ea67207e9029350ba6286b493'),(627,2,'20220927.235027.823-financas','2022-10-19 08:55:05','3bb59f864592851ade57744180fafe88'),(628,2,'20220927.235030.846-financas','2022-10-19 08:55:05','1a2576495a492cb012252f64e1097f6e'),(629,2,'20220927.235033.878-financas','2022-10-19 08:55:05','4c5d08bac0a5b88f56e434ef5b08dce7'),(630,2,'20220927.235036.915-financas','2022-10-19 08:55:05','dc2e2faa409f87b1d3d972db1955470c'),(631,2,'20220927.235039.947-financas','2022-10-19 08:55:05','cc8ce660d869dec7baf67ca81d508576'),(632,2,'20220927.235042.973-financas','2022-10-19 08:55:05','ba8e78fb5720306348902977a0083f8b'),(633,2,'20220927.235046.013-financas','2022-10-19 08:55:05','2bc9a665930c774cd5a8c6a106a18404'),(634,2,'20220927.235049.050-financas','2022-10-19 08:55:05','ad9338adb10bb345286e6ffa8c3b3ccd'),(635,2,'20220927.235052.078-financas','2022-10-19 08:55:05','925dfee72f1f6bc0cef090e16140bbf7'),(636,2,'20220927.235055.115-financas','2022-10-19 08:55:05','d00496ad436bb091a8ee56326de9993e'),(637,2,'20220927.235058.144-financas','2022-10-19 08:55:05','e6b093ffe0f640654cb01956bffd3dfc'),(638,2,'20220927.235101.172-financas','2022-10-19 08:55:05','8fa53e115951fab48b0b88530a002629'),(639,2,'20220927.235104.194-financas','2022-10-19 08:55:05','084bf951fb89aad027a1296066e359b6'),(640,2,'20220927.235107.216-financas','2022-10-19 08:55:05','dc221014b01c9e12d2124bedb627a1aa'),(641,2,'20220927.235110.249-financas','2022-10-19 08:55:05','1af6dd4e721aafe3c9accb7e5a8a26a3'),(642,2,'20220927.235113.276-financas','2022-10-19 08:55:05','4066641cc965d590622dd4fc699d6e9b'),(643,2,'20220927.235116.302-financas','2022-10-19 08:55:05','494d37d1c33e5db0e2dc7f675a648446'),(644,2,'20220927.235119.328-financas','2022-10-19 08:55:05','dfbcde528ab4509159bd4f45c3ba2277'),(645,2,'20220927.235122.351-financas','2022-10-19 08:55:05','d0edc9999f5f246d34317b3ac714c69d'),(646,2,'20220927.235125.386-financas','2022-10-19 08:55:05','de7711e64e98c96a6883658dccaaa7c6'),(647,2,'20220927.235128.420-financas','2022-10-19 08:55:05','4d253edccf637ccf0697a0755b6ff7de'),(648,2,'20220927.235131.460-financas','2022-10-19 08:55:05','1b9c2069c29ba907b11631f91a389210'),(649,2,'20220927.235134.496-financas','2022-10-19 08:55:05','eae78fdba230c51c8f872af759c74b45'),(650,2,'20220927.235137.532-financas','2022-10-19 08:55:05','846f146cea57aa0c39b043bd17b9f2f0'),(651,2,'20220927.235140.567-financas','2022-10-19 08:55:05','ec003eaa00f6634f85bd1efa5a8a195c'),(652,2,'20220927.235143.592-financas','2022-10-19 08:55:05','541748c75ec14199d18a294eaf074a74'),(653,2,'20220927.235146.623-financas','2022-10-19 08:55:05','6650c35c5ada5fe85ed8d9522fe04fa9'),(654,2,'20220927.235149.654-financas','2022-10-19 08:55:05','69b71dfa35c25463d1d16fe42a75ff29'),(655,2,'20220927.235152.687-financas','2022-10-19 08:55:05','168513329f0ba80d2384b9e10a63bd48'),(656,2,'20220927.235155.719-financas','2022-10-19 08:55:05','2d9997e9797986e402faa61279b1e224'),(657,2,'20220927.235158.761-financas','2022-10-19 08:55:05','56fd0811f2f8bd8a4bce432d3d5878e8'),(658,2,'20220927.235201.793-financas','2022-10-19 08:55:05','f8eb3e5d4725bc861d574bc3de9b4436'),(659,2,'20220927.235204.821-financas','2022-10-19 08:55:05','dfeccafac881953d46db0083cf48ce2f'),(660,2,'20220927.235207.849-financas','2022-10-19 08:55:05','497639067adc23f00b8bff282bd0b1dd'),(661,2,'20220927.235210.873-financas','2022-10-19 08:55:05','fcdda55df6b26945802c298f5d497717'),(662,2,'20220927.235213.904-financas','2022-10-19 08:55:05','dcf3f11692af80a07752bfd978ee2faf'),(663,2,'20220927.235216.930-financas','2022-10-19 08:55:05','f2b00a97dbfdfc752c8c152e966b7060'),(664,2,'20220927.235219.962-financas','2022-10-19 08:55:05','36f8ac8d6a77023af30f6c468385ea27'),(665,2,'20220927.235223.000-financas','2022-10-19 08:55:05','e27b23ab21e04ff167fede93046e2d45'),(666,2,'20220927.235226.039-financas','2022-10-19 08:55:05','d88b3769366d3ef10db9db3f7b4923d0'),(667,2,'20220927.235229.077-financas','2022-10-19 08:55:05','848d085b57458f3a8d3079afa14bd14f'),(668,2,'20220927.235232.112-financas','2022-10-19 08:55:05','8720eb69c18c05ba53f407807caf4c77'),(669,2,'20220927.235235.148-financas','2022-10-19 08:55:05','04074ea672fc7b04a2b9a73f3dfa1088'),(670,2,'20220927.235238.169-financas','2022-10-19 08:55:06','8aa91379880e3963bb69513f94521380'),(671,2,'20220927.235241.201-financas','2022-10-19 08:55:06','16762e9cc169f425483ca404d6c7ff3d'),(672,2,'20220927.235244.238-financas','2022-10-19 08:55:06','df75b830e6295f451216799775d238f6'),(673,2,'20220927.235247.273-financas','2022-10-19 08:55:06','235949305e4afe07278b2eee61e14de4'),(674,2,'20220927.235250.314-financas','2022-10-19 08:55:06','6821fcc7d9ffedc312826f234c0447b9'),(675,2,'20220927.235253.354-financas','2022-10-19 08:55:06','9d6e941830bd63acc61df9511ff38e55'),(676,2,'20220927.235256.392-financas','2022-10-19 08:55:06','1f42fee4eba9e6fd9dedb081c98b18e7'),(677,2,'20220927.235259.428-financas','2022-10-19 08:55:06','764242b97e42726592ad3721f6151c54'),(678,2,'20220927.235302.466-financas','2022-10-19 08:55:06','571d9af5d16be66795818f893023d5e9'),(679,2,'20220927.235305.497-financas','2022-10-19 08:55:06','a32a9817a1ff003310cbba2c90c85767'),(680,2,'20220927.235308.533-financas','2022-10-19 08:55:06','0781aae741c22524f15ed3e8dbf46bba'),(681,2,'20220927.235311.562-financas','2022-10-19 08:55:06','9e82ac920cd6d45c084efb7a86911580'),(682,2,'20220927.235314.587-financas','2022-10-19 08:55:06','6d74cd2f09bb6689323edf908ec4e4f1'),(683,2,'20220927.235317.617-financas','2022-10-19 08:55:06','7b3a1500dfc5a063f39d4d5738b05c7c'),(684,2,'20220927.235320.649-financas','2022-10-19 08:55:06','73ee8d0ee2bb995c37192e95d34b26fb'),(685,2,'20220927.235323.682-financas','2022-10-19 08:55:06','4405313fd09b15d91355ba97a89960c7'),(686,2,'20220927.235326.705-financas','2022-10-19 08:55:06','262ca41a3f0743eba1cb715bcfb76d4e'),(687,2,'20220927.235329.737-financas','2022-10-19 08:55:06','aee0c13ae396ec96fcd393680952f6f2'),(688,2,'20220927.235332.770-financas','2022-10-19 08:55:06','ecd1e02d9ecb512c8266ccc4c37909dd'),(689,2,'20220927.235335.808-financas','2022-10-19 08:55:06','e15bf0efa55f45f353fa0107e29e5bc0'),(690,2,'20220927.235338.835-financas','2022-10-19 08:55:06','6233d22b876f4fbcf5557b65ffdfb413'),(691,2,'20220927.235341.861-financas','2022-10-19 08:55:06','a5a76a187cf506693d1c2d8392c00804'),(692,2,'20220927.235344.896-financas','2022-10-19 08:55:06','38d36af983861df96e8e18ce0bb4bc7a'),(693,2,'20220927.235347.928-financas','2022-10-19 08:55:06','35c5c10b02a5ad5f726fe8208d735b51'),(694,2,'20220927.235350.958-financas','2022-10-19 08:55:06','d7f160ad2fda28ab8f193b3984e56748'),(695,2,'20220927.235353.995-financas','2022-10-19 08:55:06','bec1261e58e36cfcc456020c4ff5ab25'),(696,2,'20220927.235357.023-financas','2022-10-19 08:55:06','047e9a5f8c9e8fb85aad7ad024e91983'),(697,2,'20220927.235400.059-financas','2022-10-19 08:55:06','d2f15737750afaa2d8882c90af92373f'),(698,2,'20220927.235403.084-financas','2022-10-19 08:55:06','e676fb16b4f6ef6eafa93116de8896c7'),(699,2,'20220927.235406.119-financas','2022-10-19 08:55:06','dce3f2949159857f1c249f55c7d79e46'),(700,2,'20220927.235409.151-financas','2022-10-19 08:55:06','8e9926bf9d6f4fbfd9443deffad5e028'),(701,2,'20220927.235412.174-financas','2022-10-19 08:55:06','14d8dcaf3f1993420d15fc219a54bdf3'),(702,2,'20220927.235415.207-financas','2022-10-19 08:55:06','6120199c33e5a7881429c762156e2144'),(703,2,'20220927.235418.237-financas','2022-10-19 08:55:06','97ab28f73477ab76bc0a9421131ad43e'),(704,2,'20220927.235421.275-financas','2022-10-19 08:55:06','1d71f837c30487d8e274cfc88a4de373'),(705,2,'20220927.235424.300-financas','2022-10-19 08:55:06','c34b3dc044f7d54ba4b7673bead4f0d4'),(706,2,'20220927.235427.335-financas','2022-10-19 08:55:06','6d20009c1b81aa4a24edbd398e8e0c46'),(707,2,'20220927.235430.368-financas','2022-10-19 08:55:06','b52fe643a049be120275335eafe76ba0'),(708,2,'20220927.235433.407-financas','2022-10-19 08:55:06','9ecfa7e08c7e78e37ee0e0cccb009cdc'),(709,2,'20220927.235436.447-financas','2022-10-19 08:55:06','79fb98ec581a20481f817fd82bc47c51'),(710,2,'20220927.235439.474-financas','2022-10-19 08:55:06','8d785bb4bb9bc936d9d0c0f5d8c2a1a0'),(711,2,'20220927.235442.510-financas','2022-10-19 08:55:06','76cb38afa8b7a7c2b37800e2abbd1f16'),(712,2,'20220927.235445.534-financas','2022-10-19 08:55:06','58e7f05be09f91335f9b70cd2bfa3be7'),(713,2,'20220927.235448.567-financas','2022-10-19 08:55:06','5a59c72f0fc797fb69d79d7b619764d8'),(714,2,'20220927.235451.600-financas','2022-10-19 08:55:06','37b2c69e19d53db890b30f0ad691c279'),(715,2,'20220927.235454.638-financas','2022-10-19 08:55:06','5a541ad8a9987cadcce001e74f7ec79d'),(716,2,'20220927.235457.667-financas','2022-10-19 08:55:06','3fbfa1b70338fcbfd106b6965f3b7365'),(717,2,'20220927.235500.697-financas','2022-10-19 08:55:06','ea1545687cd3ad1042e72ee0d77e7ece'),(718,2,'20220927.235503.731-financas','2022-10-19 08:55:06','e783ac094935506cc5fb31ce3163fa56'),(719,2,'20220927.235506.752-financas','2022-10-19 08:55:06','becc79b094ff8bc451234453911c4686'),(720,2,'20220927.235509.782-financas','2022-10-19 08:55:06','aee61b4ea3fd72797c8d580be48a714d'),(721,2,'20220927.235512.810-financas','2022-10-19 08:55:06','8f5c4f24e0980f48aa674ce84faecdf8'),(722,2,'20220927.235515.845-financas','2022-10-19 08:55:06','b42c9882b12c8e66d41202f0a199f384'),(723,2,'20220927.235518.879-financas','2022-10-19 08:55:06','4117122c3ac9625c7d9ca25e92977e3e'),(724,2,'20220927.235521.906-financas','2022-10-19 08:55:06','51047d8be04435a490a73e0f01bc28a5'),(725,2,'20220927.235524.939-financas','2022-10-19 08:55:06','edd7e3f8b2eeace4f46a7381af57924e'),(726,2,'20220927.235527.970-financas','2022-10-19 08:55:06','1945da44a81c0b80b5a6f98282a36349'),(727,2,'20220927.235531.000-financas','2022-10-19 08:55:06','f81470632b26ef6dec4d47510c0cc1e4'),(728,2,'20220927.235534.023-financas','2022-10-19 08:55:06','045d370a91063d7f61fe0f12aa70c3dc'),(729,2,'20220927.235537.052-financas','2022-10-19 08:55:06','d75d59e612adf2cbd4a13d2bb4e048fe'),(730,2,'20220927.235540.086-financas','2022-10-19 08:55:06','5142d6a915f5d775f9c37937fc4b3683'),(731,2,'20220927.235543.124-financas','2022-10-19 08:55:06','870a2f2cc87d2966527d75114f462bfd'),(732,2,'20220927.235546.152-financas','2022-10-19 08:55:06','454a0216cfeeec1085b9a9d481071197'),(733,2,'20220927.235549.180-financas','2022-10-19 08:55:06','6022f2e8adf8ae8d0160723b1af7c520'),(734,2,'20220927.235552.219-financas','2022-10-19 08:55:06','7f982544e78fcaba0f612c40c99e1f7c'),(735,2,'20220927.235555.246-financas','2022-10-19 08:55:06','e78e4a5509b73d6b37de80c946f1706e'),(736,2,'20220927.235558.272-financas','2022-10-19 08:55:06','c04d16593e8ccd231c999c0e4d401cb4'),(737,2,'20220927.235601.302-financas','2022-10-19 08:55:06','6269656b56a87d0f7214f86b57bb9bad'),(738,2,'20220927.235604.335-financas','2022-10-19 08:55:06','cdc4d1603ac4f3dd2f796038869fad3a'),(739,2,'20220927.235607.359-financas','2022-10-19 08:55:06','abdc90508df45952f3708cca0a3f56b9'),(740,2,'20220927.235610.382-financas','2022-10-19 08:55:06','317c249a26ae362e2b3200f316059456'),(741,2,'20220927.235613.417-financas','2022-10-19 08:55:06','2dc3a4c010bad772322db3e9df4f75ea'),(742,2,'20220927.235616.438-financas','2022-10-19 08:55:06','c6db9e5799cb14cacc8771aa1176e347'),(743,2,'20220927.235619.469-financas','2022-10-19 08:55:06','60864cd00a2fc924298aa9d3e78ab168'),(744,2,'20220927.235622.494-financas','2022-10-19 08:55:06','1f48d19f33ba3529aea46d64f3dbd03f'),(745,2,'20220927.235625.524-financas','2022-10-19 08:55:06','d8fecf28344e5b18397b105ab50dee69'),(746,2,'20220927.235628.559-financas','2022-10-19 08:55:06','ac696cbc435da78c007acf65948609c3'),(747,2,'20220927.235631.600-financas','2022-10-19 08:55:06','3501ae56d70edbe9e5e93c28752b05ab'),(748,2,'20220927.235634.627-financas','2022-10-19 08:55:06','657db6503eb6b0e91e4bfa7f5558e2e9'),(749,2,'20220927.235637.664-financas','2022-10-19 08:55:06','39498dd006a3a5b11d64a600e4a0bf0b'),(750,2,'20220927.235640.695-financas','2022-10-19 08:55:06','1640c6fc6922dbfbc39b5cc0c1fc56b2'),(751,2,'20220927.235643.725-financas','2022-10-19 08:55:06','b3b136f7e9e81ffd482bfc8d103dd5ce'),(752,2,'20220927.235646.750-financas','2022-10-19 08:55:06','1430a211e9a25e2831c5d7c4102aa769'),(753,2,'20220927.235649.785-financas','2022-10-19 08:55:06','c9d2af05c053cf4aa890826dd71e9429'),(754,2,'20220927.235652.818-financas','2022-10-19 08:55:06','8f23a5d4be1d7fcdd2b0e929fa6c7eb8'),(755,2,'20220927.235655.851-financas','2022-10-19 08:55:06','83fb416e1655ef3945fb4d6352616230'),(756,2,'20220927.235658.889-financas','2022-10-19 08:55:06','42320665a35fa516a51800e77c875c6c'),(757,2,'20220927.235701.929-financas','2022-10-19 08:55:06','9a7d543dcdcf8c3ff58edd68d523db61'),(758,2,'20220927.235704.953-financas','2022-10-19 08:55:06','0a5efb41e9bc7923073aaf0842e15838'),(759,2,'20220927.235707.975-financas','2022-10-19 08:55:06','593e35815423982fd98f965b38c85cdd'),(760,2,'20220927.235711.002-financas','2022-10-19 08:55:06','90b695ff92d2baca8c1cef3e01288b23'),(761,2,'20220927.235714.052-financas','2022-10-19 08:55:06','7f4c4ca8bdcf743bbf405ff73fdbd741'),(762,2,'20220927.235717.084-financas','2022-10-19 08:55:06','f1be55f475ccd7031ab919d4bf203cea'),(763,2,'20220927.235720.105-financas','2022-10-19 08:55:06','2225e5b2c72e707d0b5d712edc7aee5a'),(764,2,'20220927.235723.141-financas','2022-10-19 08:55:06','a3eab67525ef119d8284774324f77548'),(765,2,'20220927.235726.169-financas','2022-10-19 08:55:06','bd3486458fc4d8a4aa7f5a53528af930'),(766,2,'20220927.235729.202-financas','2022-10-19 08:55:06','8955c16e3c4431255c18e83d08591e48'),(767,2,'20220927.235732.236-financas','2022-10-19 08:55:06','bfb0373157d5c939aba445494665dc65'),(768,2,'20220927.235735.268-financas','2022-10-19 08:55:06','ed98d03a50a68fd41d216616ec4c526d'),(769,2,'20220927.235738.302-financas','2022-10-19 08:55:06','921a4a92efc7787a5cdc14a6f0c67190'),(770,2,'20220927.235741.334-financas','2022-10-19 08:55:06','9c93564913f96bc1f42a862e69aa2711'),(771,2,'20220927.235744.369-financas','2022-10-19 08:55:06','d1dc1ed7d58a45467fe74f08ae83f33a'),(772,2,'20220927.235747.398-financas','2022-10-19 08:55:06','a9dd24c40acf79c1103fba9e08d65486'),(773,2,'20220927.235750.435-financas','2022-10-19 08:55:06','9c4de3d2cea27355f2fbb312ef861a21'),(774,2,'20220927.235753.476-financas','2022-10-19 08:55:06','19492f7d2eb8bf86fc880d689b3251ec'),(775,2,'20220927.235756.506-financas','2022-10-19 08:55:06','3b6b38b6fc6abd05f9e81cb8f4d16a92'),(776,2,'20220927.235759.543-financas','2022-10-19 08:55:06','0ce1905a2628fce6c8497160708ed428'),(777,2,'20220927.235802.580-financas','2022-10-19 08:55:06','48b427eb32933bddffbb11b17568819e'),(778,2,'20220927.235805.609-financas','2022-10-19 08:55:06','294e1069bd20a12cbeeef2769862318f'),(779,2,'20220927.235808.641-financas','2022-10-19 08:55:06','0c3f13fd3111d5428183c33ecc26ec89'),(780,2,'20220927.235811.673-financas','2022-10-19 08:55:06','4b2c96052ae93991c9af0b8928995797'),(781,2,'20220927.235814.705-financas','2022-10-19 08:55:06','338f39a0391dfdffa7e5a49376687f6b'),(782,2,'20220927.235817.734-financas','2022-10-19 08:55:06','e1f7bfaae229e86f4d39de6b8364fdc6'),(783,2,'20220927.235820.769-financas','2022-10-19 08:55:06','aaf987071c98f5f7e2f150d955e9817a'),(784,2,'20220927.235823.807-financas','2022-10-19 08:55:06','364cd02b2b2e42cd8daaa4b699ad86ea'),(785,2,'20220927.235826.843-financas','2022-10-19 08:55:06','6a5b8ad6874fca9afa6bfd5a381e306f'),(786,2,'20220927.235829.876-financas','2022-10-19 08:55:06','c6eaac481857791570b80fc954bc7f00'),(787,2,'20220927.235832.900-financas','2022-10-19 08:55:06','726561a91712c17f0e7a0d0ce65e42ca'),(788,2,'20220927.235835.926-financas','2022-10-19 08:55:06','92bf4e0d9be587ede9add16bca169e36'),(789,2,'20220927.235838.957-financas','2022-10-19 08:55:06','2aa79b80a6885cdc5bf0b10c76f79063'),(790,2,'20220927.235841.991-financas','2022-10-19 08:55:06','ef3879b8f9e962338f9c4a28531c2945'),(791,2,'20220927.235845.017-financas','2022-10-19 08:55:06','562af5252cef09818319bad0b807908a'),(792,2,'20220927.235848.044-financas','2022-10-19 08:55:06','b7e4069ca9ee200eda966228f08adf3c'),(793,2,'20220927.235851.083-financas','2022-10-19 08:55:06','4c4273163a980fe1f93e67ea6d00d247'),(794,2,'20220927.235854.111-financas','2022-10-19 08:55:06','9eb5cab0f5d24eb6b238f300922db13c'),(795,2,'20220927.235857.136-financas','2022-10-19 08:55:06','f6a7287f4bae185fa670edbd8f84424a'),(796,2,'20220927.235900.162-financas','2022-10-19 08:55:06','e871d1190f50513e99d6ff7a60f7e334'),(797,2,'20220927.235903.197-financas','2022-10-19 08:55:06','cefd8d5afe35d8c47b755741971aaadf'),(798,2,'20220927.235906.224-financas','2022-10-19 08:55:06','c86dea50dc0a50665ef4d0409e392437'),(799,2,'20220927.235909.255-financas','2022-10-19 08:55:06','82a492c4e0bdad94beed59f42d7df783'),(800,2,'20220927.235912.287-financas','2022-10-19 08:55:06','7c8f75b7c414bf578163af9e65323507'),(801,2,'20220927.235915.315-financas','2022-10-19 08:55:06','d1b7f6bc5588c6b90f3ffb15c8c72288'),(802,2,'20220927.235918.338-financas','2022-10-19 08:55:06','d7265785a2042e362063ce948fa722ee'),(803,2,'20220927.235921.371-financas','2022-10-19 08:55:06','f858713d1ea9d2030b7a53c34dd19dc3'),(804,2,'20220927.235924.407-financas','2022-10-19 08:55:06','616d7920370a5434f3fc235fe125c0e6'),(805,2,'20220927.235927.435-financas','2022-10-19 08:55:06','2567dfb776c810c24e09760e16f5fdc9'),(806,2,'20220927.235930.460-financas','2022-10-19 08:55:06','f683d6019f68bd747b1d2cfe7d5fbac9'),(807,2,'20220927.235933.488-financas','2022-10-19 08:55:06','697a4e3eff043085e74cc47a2a926190'),(808,2,'20220927.235936.518-financas','2022-10-19 08:55:06','0ae7cfb3a24e53fae328f0546567d69a'),(809,2,'20220927.235939.552-financas','2022-10-19 08:55:06','61e3def1e9bd986e5723925e74abfa84'),(810,2,'20220927.235942.589-financas','2022-10-19 08:55:06','bf69b61237074eded7fad6dc06e4f406'),(811,2,'20220927.235945.621-financas','2022-10-19 08:55:06','0392a8fceb00fde3b09c8313b68474f4'),(812,2,'20220927.235948.650-financas','2022-10-19 08:55:06','2176ab3ce581e7e4212604f204aab130'),(813,2,'20220927.235951.682-financas','2022-10-19 08:55:06','ddb416e40cf155cdc0419f602b4521dd'),(814,2,'20220927.235954.711-financas','2022-10-19 08:55:06','dc879c1189065d602675cc94f2a10983'),(815,2,'20220927.235957.739-financas','2022-10-19 08:55:06','46a985d39699c561641bf8fa3da46023'),(816,2,'20220928.000000.777-financas','2022-10-19 08:55:06','ecc1aa2c23fbba1e397474ba7a039451'),(817,2,'20220928.000003.802-financas','2022-10-19 08:55:06','085c8835c18259f0b156398e0ef1d0ac'),(818,2,'20220928.000006.822-financas','2022-10-19 08:55:06','488b9b27c1c526bd1e0bbd27f69b6867'),(819,2,'20220928.000009.863-financas','2022-10-19 08:55:06','9506c298b5729a06e40df14b22b587fc'),(820,2,'20220928.000012.903-financas','2022-10-19 08:55:06','49423df03f8000b55bd5ab79e61a4541'),(821,2,'20220928.000015.943-financas','2022-10-19 08:55:06','34a1e6a8bc992d86245278952d95c57f'),(822,2,'20220928.000018.981-financas','2022-10-19 08:55:06','3d74928d2693f38559a1a80410e7dba0'),(823,2,'20220928.000022.009-financas','2022-10-19 08:55:06','23c20e687b427a99605938a0a7adf27a'),(824,2,'20220928.000025.041-financas','2022-10-19 08:55:06','5b288d2195a6ea31b93705366849874b'),(825,2,'20220928.000028.081-financas','2022-10-19 08:55:06','49f85522c38a269c8bdd0ba22f0ed2bb'),(826,2,'20220928.000031.113-financas','2022-10-19 08:55:06','072bfe2bb61c8d731ebf7c9a731a5ec7'),(827,2,'20220928.000034.142-financas','2022-10-19 08:55:06','69977c705cf81ddfc13bf2c498591fa4'),(828,2,'20220928.000037.169-financas','2022-10-19 08:55:06','82d0685755b0b050009960ad8de2eb91'),(829,2,'20220928.000040.202-financas','2022-10-19 08:55:06','52d4a2dcffb5991fb2f871620e291803'),(830,2,'20220928.000043.228-financas','2022-10-19 08:55:06','75e48e4eeea6effff396aa072bc9b9fa'),(831,2,'20220928.000046.263-financas','2022-10-19 08:55:06','53e4fa80c064d88fd2d6eed71c384d25'),(832,2,'20220928.000049.305-financas','2022-10-19 08:55:06','d6efc0463308e4e61e6a297000612004'),(833,2,'20220928.000052.334-financas','2022-10-19 08:55:06','32a05fc06f1699d13095f897399c9704'),(834,2,'20220928.000055.360-financas','2022-10-19 08:55:06','923ffaa4909131a4ff2838c01c7f5a97'),(835,2,'20220928.000058.393-financas','2022-10-19 08:55:06','6ec0b5297de9d59a0e01b5ad57ffc10b'),(836,2,'20220928.000101.432-financas','2022-10-19 08:55:06','cc3029ee3e88a64325e25df84ad083c5'),(837,2,'20220928.000104.459-financas','2022-10-19 08:55:06','ae93bcdb9a1abb17749c5cdfb3e5acc2'),(838,2,'20220928.000107.487-financas','2022-10-19 08:55:06','7570a443f4082a424f2fe51c5d91c89a'),(839,2,'20220928.000110.527-financas','2022-10-19 08:55:06','9f3c362a7742e331e8ffe75d9c9e419f'),(840,2,'20220928.000113.561-financas','2022-10-19 08:55:06','bec08f3c39a4e9c99dea057389eff196'),(841,2,'20220928.000116.585-financas','2022-10-19 08:55:06','06f2241586718b6a1179f64af8f2d660'),(842,2,'20220928.000119.618-financas','2022-10-19 08:55:06','78366aa17c99dcc11d60ee2705c05fb0'),(843,2,'20220928.000122.659-financas','2022-10-19 08:55:06','99d444ece8760798396a426477aed075'),(844,2,'20220928.000125.688-financas','2022-10-19 08:55:06','ef2afc9b5ebe5a45d5341f70efdf97f2'),(845,2,'20220928.000128.722-financas','2022-10-19 08:55:06','45ba89e531c8566bbf2f2266b2c47847'),(846,2,'20220928.000131.753-financas','2022-10-19 08:55:06','4ceae497d09264c6a57603eecc5425b2'),(847,2,'20220928.000134.781-financas','2022-10-19 08:55:06','e4af9f724dc69cd967439116538b6003'),(848,2,'20220928.000137.820-financas','2022-10-19 08:55:06','90bec1bc21ca093b9299dea21ecea084'),(849,2,'20220928.000140.842-financas','2022-10-19 08:55:06','8267fc37a1fa7f05001907fc0269a458'),(850,2,'20220928.000143.871-financas','2022-10-19 08:55:06','14bcd7ad722872790d5bfbe38f3069e5'),(851,2,'20220928.000146.906-financas','2022-10-19 08:55:06','f3b5fccff44cee29ec085d6f7b85db99'),(852,2,'20220928.000149.934-financas','2022-10-19 08:55:06','65fd32b3b9576e5a23b6c9a855989361'),(853,2,'20220928.000152.956-financas','2022-10-19 08:55:06','7e0967c236cd1838ad84febaa059d3b9'),(854,2,'20220928.000155.994-financas','2022-10-19 08:55:06','b723d5dffdb57dc5c4832578feee4ab1'),(855,2,'20220928.000159.026-financas','2022-10-19 08:55:06','b0b786cac36491fda0c0eef90c864604'),(856,2,'20220928.000202.058-financas','2022-10-19 08:55:06','3060b873a283d7c8b97da5be7e366174'),(857,2,'20220928.000205.078-financas','2022-10-19 08:55:06','c7eb3bab4886b3c7d4bb68aa557e5ace'),(858,2,'20220928.000208.110-financas','2022-10-19 08:55:06','dbde7405bc2824094e1a4665723f0720'),(859,2,'20220928.000211.138-financas','2022-10-19 08:55:06','4eb2f80522162976a7f5c1089e17f7fa'),(860,2,'20220928.000214.166-financas','2022-10-19 08:55:06','49cb439b0f1aebc06d608b518ce85332'),(861,2,'20220928.000217.206-financas','2022-10-19 08:55:06','3228b6b988b00fdf20c64775ee13ef66'),(862,2,'20220928.000220.226-financas','2022-10-19 08:55:06','9f1544c18621bd0ec2864438ab3fbfc1'),(863,2,'20220928.000223.258-financas','2022-10-19 08:55:06','8b5f698fd48864f1cd713a116d6c7da7'),(864,2,'20220928.000226.295-financas','2022-10-19 08:55:06','aff0cbbc8cc4cdd9b221f165d51024d4'),(865,2,'20220928.000229.320-financas','2022-10-19 08:55:06','b1dcfadcba8805cd06569d6136e24844'),(866,2,'20220928.000232.351-financas','2022-10-19 08:55:06','f1dd2ee93ed301521264ae32a87bb7d1'),(867,2,'20220928.000235.389-financas','2022-10-19 08:55:06','005158ab90f13f375b027e89c1824c0c'),(868,2,'20220928.000238.415-financas','2022-10-19 08:55:06','f9cbb7ebabc9547f1c9e4ea2553bf76f'),(869,2,'20220928.000241.445-financas','2022-10-19 08:55:06','18b5537a1b42fa8c5c064eaef513c794'),(870,2,'20220928.000244.477-financas','2022-10-19 08:55:06','783a648a3d3792e75527fdfb66b1a76b'),(871,2,'20220928.000247.501-financas','2022-10-19 08:55:06','2e7ab25eeeccf8f399e7e35c38aeb4fb'),(872,2,'20220928.000250.533-financas','2022-10-19 08:55:06','61d33525935490762639a0a0dc21ef83'),(873,2,'20220928.000253.562-financas','2022-10-19 08:55:06','99f02898bf58fde24f2ab86f886678b7'),(874,2,'20220928.000256.601-financas','2022-10-19 08:55:06','66717496922a8b1bcee7ae2fd9827319'),(875,2,'20220928.000259.628-financas','2022-10-19 08:55:06','b68a9e39c99cc1cb4db46eb79cac44f3'),(876,2,'20220928.000302.658-financas','2022-10-19 08:55:06','67f98d152bd913ddd53ca26aa608d305'),(877,2,'20220928.000305.684-financas','2022-10-19 08:55:06','30c48653358a92cad7975dbc89886ce8'),(878,2,'20220928.000308.714-financas','2022-10-19 08:55:06','e3dc3af7eb86175c655642dc5fd17d15'),(879,2,'20220928.000311.741-financas','2022-10-19 08:55:06','98835bbce85efacc101e7e4aea27120f'),(880,2,'20220928.000314.771-financas','2022-10-19 08:55:06','be6804d96a9d54b77cd3e70eccbf4938'),(881,2,'20220928.000317.799-financas','2022-10-19 08:55:06','a4b1076a9df06e36be2ef1b00e6eb04f'),(882,2,'20220928.000320.836-financas','2022-10-19 08:55:06','ef536a4e758b4ecc42d54d921213844f'),(883,2,'20220928.000323.866-financas','2022-10-19 08:55:06','fd0e070a83d9dc7865c985ed9bda44e6'),(884,2,'20220928.000326.888-financas','2022-10-19 08:55:06','4cfa165a5938794b66e47420fa800114'),(885,2,'20220928.000329.925-financas','2022-10-19 08:55:06','f5bfb8721fd2cd10eee9e4b87855235c'),(886,2,'20220928.000332.967-financas','2022-10-19 08:55:06','b33341552266201d228d1c8b73aee4b3'),(887,2,'20220928.000335.991-financas','2022-10-19 08:55:06','f98d415e8ded9d45a2fb2d970523e2fe'),(888,2,'20220928.000339.022-financas','2022-10-19 08:55:06','1e6a1d95695d31bd7b2846a31e6a49e0'),(889,2,'20220928.000342.050-financas','2022-10-19 08:55:06','0bfe74af30d541f5e48a4311961619c0'),(890,2,'20220928.000345.072-financas','2022-10-19 08:55:06','cf2e76109c487b207e472eb4c1bd8cc2'),(891,2,'20220928.000348.111-financas','2022-10-19 08:55:06','731e8d3dc3c17a07e523d4e90de6197d'),(892,2,'20220928.000351.138-financas','2022-10-19 08:55:06','1ea4e5d8555b4a2ae1be35913d5b6f3d'),(893,2,'20220928.000354.170-financas','2022-10-19 08:55:06','d8cf822100d5ab8d3f357d72f1bd775e'),(894,2,'20220928.000357.198-financas','2022-10-19 08:55:06','22719b4f05093b109c9f277fc07d6f1b'),(895,2,'20220928.000400.229-financas','2022-10-19 08:55:06','f59f788f6851453396051e861a19e22f'),(896,2,'20220928.000403.254-financas','2022-10-19 08:55:06','e93dc987931f2b9580baa4e39f52bcf9'),(897,2,'20220928.000406.288-financas','2022-10-19 08:55:06','4467ae2e09c55331d2a261b904808e82'),(898,2,'20220928.000409.316-financas','2022-10-19 08:55:06','13f3897b815863bba23e440c8389e644'),(899,2,'20220928.000412.356-financas','2022-10-19 08:55:06','3f82e03262e40018868be220c405a25b'),(900,2,'20220928.000415.390-financas','2022-10-19 08:55:06','e563dc3d20d460c7eb64955187992492'),(901,2,'20220928.000418.428-financas','2022-10-19 08:55:06','4d09a12ffd13b79fb7ae77348d95a5f9'),(902,2,'20220928.000421.451-financas','2022-10-19 08:55:06','0adffef5d467b6c7ab4ac205d1243033'),(903,2,'20220928.000424.491-financas','2022-10-19 08:55:06','118e5b68963d3701868cfa5f32189539'),(904,2,'20220928.000427.532-financas','2022-10-19 08:55:06','da83e0b4053d8047e407ea583e766eeb'),(905,2,'20220928.000430.557-financas','2022-10-19 08:55:06','f7b702d444638086128c1805c3cfef75'),(906,2,'20220928.000433.586-financas','2022-10-19 08:55:06','92f1807836631a64af45d43c64b83b2c'),(907,2,'20220928.000436.627-financas','2022-10-19 08:55:06','5bee5b97dd9688eb86f59a1a9bdf5a3f'),(908,2,'20220928.000439.659-financas','2022-10-19 08:55:06','ce515bc5a399a9cb38c5be2676259fb5'),(909,2,'20220928.000442.697-financas','2022-10-19 08:55:06','efc1474aa1c92e9f3af20dad79d92259'),(910,2,'20220928.000445.727-financas','2022-10-19 08:55:06','49b8395abb39e834b1fa15e90a16d59a'),(911,2,'20220928.000448.754-financas','2022-10-19 08:55:06','d7936002ee068d857a2ddeb2524c2ac4'),(912,2,'20220928.000451.790-financas','2022-10-19 08:55:06','f1f7875a4a859ac10fec62e2cd647cc7'),(913,2,'20220928.000454.830-financas','2022-10-19 08:55:06','4fb9846f248053a16c62525947a5ce1b'),(914,2,'20220928.000457.858-financas','2022-10-19 08:55:06','8d97f54938a2e849f3ab1f016bf37925'),(915,2,'20220928.000500.883-financas','2022-10-19 08:55:06','b8136cdfd2a630beafdcc4fc20de9579'),(916,2,'20220928.000503.923-financas','2022-10-19 08:55:06','d3b0edffa4bff7c600b53b28b870da1b'),(917,2,'20220928.000506.955-financas','2022-10-19 08:55:06','de52e2669300617c8e5ffd94721941b9'),(918,2,'20220928.000509.991-financas','2022-10-19 08:55:06','1dd11f6d224af00f86ff01f81bb7b549'),(919,2,'20220928.000513.015-financas','2022-10-19 08:55:06','eae450470359bd3d13876c9ce27b1df7'),(920,2,'20220928.000516.050-financas','2022-10-19 08:55:06','e84cc4a06b664a895872309ba324f67b'),(921,2,'20220928.000519.083-financas','2022-10-19 08:55:06','69bd5b698ebfb54ab6449b01e495472c'),(922,2,'20220928.000522.115-financas','2022-10-19 08:55:06','051519097c92589864042380d60fc869'),(923,2,'20220928.000525.156-financas','2022-10-19 08:55:06','fa23322c089bf600ecc84d7b13429dcb'),(924,2,'20220928.000528.187-financas','2022-10-19 08:55:06','4d620706775e6a21e2c52c7932278f19'),(925,2,'20220928.000531.223-financas','2022-10-19 08:55:06','f10d0a37149b0e7a15343ed6ab63c225'),(926,2,'20220928.000534.253-financas','2022-10-19 08:55:06','c3ba9e9619f44951b6f653ca4b3fdb5e'),(927,2,'20220928.000537.274-financas','2022-10-19 08:55:06','f05872aade5bd9998891536b87b9816e'),(928,2,'20220928.000540.310-financas','2022-10-19 08:55:06','274e08fd5ef7007f9567cd70b8272d02'),(929,2,'20220928.000543.338-financas','2022-10-19 08:55:06','3f50b66229d7b5e3fd0918bf51623547'),(930,2,'20220928.000546.372-financas','2022-10-19 08:55:06','18a5c79fc1bf12c259f4aacdd2b7ecb3'),(931,2,'20220928.000549.408-financas','2022-10-19 08:55:06','a49c2b76ac62f95070f7862fc9211fde'),(932,2,'20220928.000552.450-financas','2022-10-19 08:55:06','5078f282e1dbc2f9f15052edbd43a045'),(933,2,'20220928.000555.478-financas','2022-10-19 08:55:06','961fa28d0ac70673f7f515333c742e24'),(934,2,'20220928.000558.508-financas','2022-10-19 08:55:06','673b9e274ff0c75e437da44fdffb7ca0'),(935,2,'20220928.000601.544-financas','2022-10-19 08:55:06','1916efeb32e6abe68b8ae8390b8045d2'),(936,2,'20220928.000604.564-financas','2022-10-19 08:55:06','59cdf6866865a081c3da2d4d912a0882'),(937,2,'20220928.000607.588-financas','2022-10-19 08:55:06','b9c22f027d0c140254cd7046f0bad249'),(938,2,'20220928.000610.626-financas','2022-10-19 08:55:06','94207d50421a7d38192e727a853fd981'),(939,2,'20220928.000613.667-financas','2022-10-19 08:55:06','ceb36cebfee6618d8b85415219f38b63'),(940,2,'20220928.000616.703-financas','2022-10-19 08:55:06','c98f0e222c8fa679a2991ebc208033e6'),(941,2,'20220928.000619.731-financas','2022-10-19 08:55:06','7f8c9bc382e6c88fa46582a20b51eb6e'),(942,2,'20220928.000622.761-financas','2022-10-19 08:55:06','ab90cf088eac52130399071a2c1b4fd8'),(943,2,'20220928.000625.789-financas','2022-10-19 08:55:06','5394e0b15e7c400fea23cb27226b99c5'),(944,2,'20220928.000628.819-financas','2022-10-19 08:55:06','045dda4259944ca654326e443dc8ae45'),(945,2,'20220928.000631.844-financas','2022-10-19 08:55:06','c4c248ea20e27fbd2eb66f8f66e4792b'),(946,2,'20220928.000634.882-financas','2022-10-19 08:55:06','e0fece8a983c956d896d4e5f84938ffe'),(947,2,'20220928.000637.921-financas','2022-10-19 08:55:06','f9f70a2fea64e660eca1e93a4483b2a1'),(948,2,'20220928.000640.954-financas','2022-10-19 08:55:06','1e1954a34b6ccda6c6a231e72dc4568d'),(949,2,'20220928.000643.980-financas','2022-10-19 08:55:06','e3eedf133ed025855a43bdb79d034d4c'),(950,2,'20220928.000647.008-financas','2022-10-19 08:55:06','429d68ac6614f670c56141259f96c7a1'),(951,2,'20220928.000650.050-financas','2022-10-19 08:55:06','6295ac26df3ef76be2b621cc7da178d8'),(952,2,'20220928.000653.076-financas','2022-10-19 08:55:06','0b1f7cc20832eb61ae15b4b89963271b'),(953,2,'20220928.000656.104-financas','2022-10-19 08:55:06','2823d9e120b88265425a6d195c9f4e56'),(954,2,'20220928.000659.138-financas','2022-10-19 08:55:06','1d5e759967a887449b97c069047797bd'),(955,2,'20220928.000702.173-financas','2022-10-19 08:55:06','c4321968b77722723921f60573800258'),(956,2,'20220928.000705.207-financas','2022-10-19 08:55:06','1da937288f7e894b9134307b400492a8'),(957,2,'20220928.000708.236-financas','2022-10-19 08:55:06','f1bf5a7a0c1493bb6f73599c2bdb685f'),(958,2,'20220928.000711.264-financas','2022-10-19 08:55:06','54e53a28c8376e6ad427e031c346a6af'),(959,2,'20220928.000714.288-financas','2022-10-19 08:55:06','171ab54a4a53003a98a95c394ced35cb'),(960,2,'20220928.000717.326-financas','2022-10-19 08:55:06','bc9695ee433024150a58bebaa874e9f8'),(961,2,'20220928.000720.359-financas','2022-10-19 08:55:06','44a0ec7bfc000f303b7fbe9181c95777'),(962,2,'20220928.000723.400-financas','2022-10-19 08:55:06','e4e0cdee4a25a1327892bc0ee9dd646e'),(963,2,'20220928.000726.434-financas','2022-10-19 08:55:06','d8705819bc200d8e74b42a24b7d57d9e'),(964,2,'20220928.000729.468-financas','2022-10-19 08:55:06','a7e24c3c42628a9597a871e00b0881b8'),(965,2,'20220928.000732.501-financas','2022-10-19 08:55:06','9cbece56e12cc2ea22fd9429711a8e45'),(966,2,'20220928.000735.533-financas','2022-10-19 08:55:06','ef4aeb6d8f4b205f43f09294ffee8e8f'),(967,2,'20220928.000738.567-financas','2022-10-19 08:55:06','4e03fd38a467c752c298f9b05068147e'),(968,2,'20220928.000741.592-financas','2022-10-19 08:55:06','e793ff5c8b6373491e713a31fc66a50c'),(969,2,'20220928.000744.622-financas','2022-10-19 08:55:06','bff56a9e0c7fb2c1b4616f1d40ef6013'),(970,2,'20220928.000747.645-financas','2022-10-19 08:55:06','c9e29fda8bcfa4f4be3b73b77a30146c'),(971,2,'20220928.000750.686-financas','2022-10-19 08:55:06','278322d620886fdbe746c4b202e5be45'),(972,2,'20220928.000753.718-financas','2022-10-19 08:55:06','f14a407b331f78df7a46b05c02e1438b'),(973,2,'20220928.000756.745-financas','2022-10-19 08:55:06','a7b9e7a54c1ccc0597f9fc49bec91cdd'),(974,2,'20220928.000759.767-financas','2022-10-19 08:55:06','b10c59be9e6ed0254b1545ffeea0d16e'),(975,2,'20220928.000802.796-financas','2022-10-19 08:55:06','c0e989fe2fd1df8270ec6fc7f28de5f7'),(976,2,'20220928.000805.827-financas','2022-10-19 08:55:06','4c8812cd333e9a7de7d4c7f7854507f3'),(977,2,'20220928.000808.858-financas','2022-10-19 08:55:06','83e9dfcdaee765c96305c680d59b15f0'),(978,2,'20220928.000811.893-financas','2022-10-19 08:55:06','9f6fc0c2d7a44f92bce5f79512278d5a'),(979,2,'20220928.000814.920-financas','2022-10-19 08:55:06','88b6f035da35c08778e0fbfbac34c962'),(980,2,'20220928.000817.950-financas','2022-10-19 08:55:06','f9f22951d4488a62956965feb7c9a8e8'),(981,2,'20220928.000820.970-financas','2022-10-19 08:55:06','22fc5263d56a7012fc8d1166dc02f512'),(982,2,'20220928.000823.991-financas','2022-10-19 08:55:06','223d6576bd1af0964fca50a7f67fe191'),(983,2,'20220928.000827.017-financas','2022-10-19 08:55:06','1bfa0cf30287527c079a1198fa10f676'),(984,2,'20220928.000830.051-financas','2022-10-19 08:55:06','20a03535c4604bb326d099f48db41c34'),(985,2,'20220928.000833.075-financas','2022-10-19 08:55:06','ceeddf746e10aa2b1d38dc1716ae5b94'),(986,2,'20220928.000836.114-financas','2022-10-19 08:55:06','bb4a897944be266a00ff03ab34e0c86f'),(987,2,'20220928.000839.133-financas','2022-10-19 08:55:06','7c6114c1c23ce2d51215ee63b678137d'),(988,2,'20220928.000842.159-financas','2022-10-19 08:55:06','5595b96463a454512189e4938ff7a547'),(989,2,'20220928.000845.191-financas','2022-10-19 08:55:06','d452ba86c7258017612de1ef2c83a90f'),(990,2,'20220928.000848.226-financas','2022-10-19 08:55:06','eb341a18e9e78fbcdc4902142406809f'),(991,2,'20220928.000851.258-financas','2022-10-19 08:55:06','c9592bb6b85528c03daaa25083df1e61'),(992,2,'20220928.000854.278-financas','2022-10-19 08:55:06','0381edd985bb51501014406d1d468f12'),(993,2,'20220928.000857.314-financas','2022-10-19 08:55:06','d0d7323ebcd495d74f265237f15c5209'),(994,2,'20220928.000900.341-financas','2022-10-19 08:55:06','47b0009dfb6cdd611bfacefa9f30b514'),(995,2,'20220928.000903.379-financas','2022-10-19 08:55:06','ec7e5a8c894e63d4b9e1e6a73de4097c'),(996,2,'20220928.000906.405-financas','2022-10-19 08:55:06','f97e1856bba415a3155bdde93a440f77'),(997,2,'20220928.000909.435-financas','2022-10-19 08:55:06','dd33eae1f0ac16cecddbfd76b13dabf2'),(998,2,'20220928.000912.472-financas','2022-10-19 08:55:06','00aebae9af9969292d473cdb8316f16f'),(999,2,'20220928.000915.501-financas','2022-10-19 08:55:06','bd41d837a1b8e1ff40d701eac4ac89e5'),(1000,2,'20220928.000918.537-financas','2022-10-19 08:55:06','58ba40849bdf0c2a557d10e5ff2fd1a0'),(1001,2,'20220928.000921.566-financas','2022-10-19 08:55:06','89fb7dfb220d2e36b17d88f59ce0cad7'),(1002,2,'20220928.000924.597-financas','2022-10-19 08:55:06','4f162ed7649233c5ec5eb3531c40d8a3'),(1003,2,'20220928.000927.634-financas','2022-10-19 08:55:06','84136dfa7590ae50d2fa1abd1ae51304'),(1004,2,'20220928.000930.662-financas','2022-10-19 08:55:06','5879d9535d95138b2d1f68fec7a6fa98'),(1005,2,'20220928.000933.690-financas','2022-10-19 08:55:06','262816300ee07c49716107c5ebd1fd77'),(1006,2,'20220928.000936.726-financas','2022-10-19 08:55:06','a9e9e6911453bcb49b0d74f402c14e5e'),(1007,2,'20220928.000939.759-financas','2022-10-19 08:55:06','60b82eaed2563221f0b0149c9b109663'),(1008,2,'20220928.000942.790-financas','2022-10-19 08:55:06','379ff3b4e612fd2fe9980c84837d8251'),(1009,2,'20220928.000945.820-financas','2022-10-19 08:55:06','4c3c973d1c7b4e9896ce622a02d193f7'),(1010,2,'20220928.000948.853-financas','2022-10-19 08:55:06','dafc874968091c2523138b1d83e6d4fc'),(1011,2,'20220928.000951.893-financas','2022-10-19 08:55:06','0204194684cf59c545170504ada29890'),(1012,2,'20220928.000954.921-financas','2022-10-19 08:55:06','7c836656c4d8781de361240a7738be8f'),(1013,2,'20220928.000957.956-financas','2022-10-19 08:55:06','2d38515b6c49dd2edb91dc4a71a45a6a'),(1014,2,'20220928.001000.995-financas','2022-10-19 08:55:06','6ebd18b678bf4a815ec871fd3c399917'),(1015,2,'20220928.001004.029-financas','2022-10-19 08:55:06','abb827ba1927f45f60ce0d67f44244b5'),(1016,2,'20220928.001007.053-financas','2022-10-19 08:55:06','30d9e34c869aec5185c16f1f628dc1fe'),(1017,2,'20220928.001010.083-financas','2022-10-19 08:55:06','13c81ff778c7a62e2824f0f4056b9a24'),(1018,2,'20220928.001013.112-financas','2022-10-19 08:55:06','3bbde5528e283e87b84efb1256d3b6c1'),(1019,2,'20220928.001016.152-financas','2022-10-19 08:55:06','854ae2f3b5c84aad4a320641fb5910df'),(1020,2,'20220928.001019.181-financas','2022-10-19 08:55:06','309891efc2bb1d0a7d95d889b67fd64d'),(1021,2,'20220928.001022.212-financas','2022-10-19 08:55:06','f7c7351408fb878104ad922e91710961'),(1022,2,'20220928.001025.248-financas','2022-10-19 08:55:06','8bb8e68042b55da467489af31b32472c'),(1023,2,'20220928.001028.277-financas','2022-10-19 08:55:06','72e75e33e9f3afc5532c1741658be748'),(1024,2,'20220928.001031.307-financas','2022-10-19 08:55:06','8e64f33a3b137e3e8a88910268d3fd2d'),(1025,2,'20220928.001034.339-financas','2022-10-19 08:55:06','3083fecae7831f8c138e70fc55b0b4e7'),(1026,2,'20220928.001037.359-financas','2022-10-19 08:55:06','aff9950f80a462b811d98671f9925bf3'),(1027,2,'20220928.001040.393-financas','2022-10-19 08:55:06','71dbe91e0946386a3711fbc734de964e'),(1028,2,'20220928.001043.426-financas','2022-10-19 08:55:06','a305985fcfde167612010ce8f859a88f'),(1029,2,'20220928.001046.452-financas','2022-10-19 08:55:06','c96a0b7db5df122536a0c65c12b3b67e'),(1030,2,'20220928.001049.483-financas','2022-10-19 08:55:06','7e5ce22f8dde66dcacf65d9977af6c18'),(1031,2,'20220928.001052.524-financas','2022-10-19 08:55:06','c1f1853226cc78bf1b14b6a249b69b06'),(1032,2,'20220928.001055.558-financas','2022-10-19 08:55:06','2a58ae774ede66a7736c52b509e0c014'),(1033,2,'20220928.001058.601-financas','2022-10-19 08:55:06','58eaf2312b6fc09802ef2daa72558df8'),(1034,2,'20220928.001101.633-financas','2022-10-19 08:55:06','e134864562f86a2c6cb56d71766656f4'),(1035,2,'20220928.001104.657-financas','2022-10-19 08:55:06','e9fbad3bda4c9f15d7315d2cadc11e61'),(1036,2,'20220928.001107.695-financas','2022-10-19 08:55:06','dd16ada291ae75306a0fc2a609449fca'),(1037,2,'20220928.001110.735-financas','2022-10-19 08:55:06','ae72a2abeaf0de56d0be37dfada21f31'),(1038,2,'20220928.001113.775-financas','2022-10-19 08:55:06','4ff1f3f402233f689edaffda67045341'),(1039,2,'20220928.001116.803-financas','2022-10-19 08:55:06','c652bcaf9719b5ef3109eca146a68ccf'),(1040,2,'20220928.001119.834-financas','2022-10-19 08:55:06','13a736883b7f3b6684c21e413d1216c6'),(1041,2,'20220928.001122.856-financas','2022-10-19 08:55:06','76481f84c7e22deb27e44f21273015c9'),(1042,2,'20220928.001125.889-financas','2022-10-19 08:55:06','1b82ac768d3d40804658728ceaaa2d58'),(1043,2,'20220928.001128.921-financas','2022-10-19 08:55:06','f2827c1ce6c0f06f52c4d8076855807f'),(1044,2,'20220928.001131.962-financas','2022-10-19 08:55:06','c8ac4981d0430d944dc0342747443bcc'),(1045,2,'20220928.001134.990-financas','2022-10-19 08:55:06','8591699d096a76b98bc03f83a4594bf9'),(1046,2,'20220928.001138.026-financas','2022-10-19 08:55:06','9fa9d760a29caac4ebdfcdf1d7a3ec62'),(1047,2,'20220928.001141.052-financas','2022-10-19 08:55:06','3a59fde1c80ac304717001bcab093f13'),(1048,2,'20220928.001144.081-financas','2022-10-19 08:55:06','1730a0e4173fb5edf19541551e62a69f'),(1049,2,'20220928.001147.123-financas','2022-10-19 08:55:06','52240324a1071c1e77fe604ba3623833'),(1050,2,'20220928.001150.151-financas','2022-10-19 08:55:06','82a88829f169246d3be35f27447e152d'),(1051,2,'20220928.001153.173-financas','2022-10-19 08:55:06','798db8254f9d7efb1adfd60ee74bc724'),(1052,2,'20220928.001156.206-financas','2022-10-19 08:55:06','5623332913a031fd9ddd842eae1ab7d2'),(1053,2,'20220928.001159.245-financas','2022-10-19 08:55:06','8f07e7648d7eee7ade96573976093d40'),(1054,2,'20220928.001202.273-financas','2022-10-19 08:55:06','844c3293d8f21da26fa6381794b0b77a'),(1055,2,'20220928.001205.305-financas','2022-10-19 08:55:06','c2bbc843a88a596016741bf1656116a0'),(1056,2,'20220928.001208.339-financas','2022-10-19 08:55:06','7dc7aa6f1e0af4c5c7b7ccc5378c12a6'),(1057,2,'20220928.001211.375-financas','2022-10-19 08:55:06','3453e82129a44a489a09a2160728f268'),(1058,2,'20220928.001214.407-financas','2022-10-19 08:55:06','5b8a170f58e34b727357503e4eb08e19'),(1059,2,'20220928.001217.433-financas','2022-10-19 08:55:06','4c1639c488a5f3786397d4fa18ae44f9'),(1060,2,'20220928.001220.463-financas','2022-10-19 08:55:06','bb3ca4f9867359b041a48041c331a9c6'),(1061,2,'20220928.001223.491-financas','2022-10-19 08:55:06','6f7eb79639821664feeaebe673f1c1cf'),(1062,2,'20220928.001226.518-financas','2022-10-19 08:55:06','6ef813f5559ead25cac67b4783bda2c9'),(1063,2,'20220928.001229.546-financas','2022-10-19 08:55:06','ef4558562d700820f4fe3530e22cfbaa'),(1064,2,'20220928.001232.578-financas','2022-10-19 08:55:06','f1c80d52ebe5aa3c82667447f374acc7'),(1065,2,'20220928.001235.619-financas','2022-10-19 08:55:06','95b951466bb7a9ce790e5b77ac84ae72'),(1066,2,'20220928.001238.658-financas','2022-10-19 08:55:06','9860bd860dd706f06b758f9bc048caeb'),(1067,2,'20220928.001241.691-financas','2022-10-19 08:55:06','b7296b2e9ccd58da17aeac4666ec629c'),(1068,2,'20220928.001244.721-financas','2022-10-19 08:55:06','c6ae1f647e71fd7e665ee364277a704b'),(1069,2,'20220928.001247.753-financas','2022-10-19 08:55:06','ce9d60435b09decb3f6cf79dd2a8bad3'),(1070,2,'20220928.001250.785-financas','2022-10-19 08:55:06','51757215d67da3ad63a7b211272bb489'),(1071,2,'20220928.001253.812-financas','2022-10-19 08:55:06','389ea6563c7b9a9f2e81afd3716b65ea'),(1072,2,'20220928.001256.838-financas','2022-10-19 08:55:06','ec94ace77cc98f4fec2bb4db73ca0e4c'),(1073,2,'20220928.001259.867-financas','2022-10-19 08:55:06','5ef53957bcdc65a1de8b85ca64a52fcc'),(1074,2,'20220928.001302.909-financas','2022-10-19 08:55:06','0a8c9b1bf984c2e138153456f0f10c71'),(1075,2,'20220928.001305.942-financas','2022-10-19 08:55:06','6c433c464284c32aea5411db4ee85f08'),(1076,2,'20220928.001308.980-financas','2022-10-19 08:55:06','e74c19fc6861c227be51ed693b6df637'),(1077,2,'20220928.001312.010-financas','2022-10-19 08:55:06','db20ad8948fdb17f258a01dad830e821'),(1078,2,'20220928.001315.039-financas','2022-10-19 08:55:06','d71e6492b70154be79dceb40d8ccf1bd'),(1079,2,'20220928.001318.070-financas','2022-10-19 08:55:06','37218e1455f43873523488de7cd5dad9'),(1080,2,'20220928.001321.102-financas','2022-10-19 08:55:06','c09bc46e2a443930b843145112ea49bb'),(1081,2,'20220928.001324.136-financas','2022-10-19 08:55:06','3116ef58d5a13b36eb8383d860a83bd6'),(1082,2,'20220928.001327.166-financas','2022-10-19 08:55:06','e8e4225d3ac3560def4cdfe043eeb9c4'),(1083,2,'20220928.001330.196-financas','2022-10-19 08:55:06','1cf048681c03571cce2490d60ff8a511'),(1084,2,'20220928.001333.225-financas','2022-10-19 08:55:06','4711e0b0a2b8914601e8df9f3dc0b060'),(1085,2,'20220928.001336.250-financas','2022-10-19 08:55:06','46f117785aeed27678fa1072518a1981'),(1086,2,'20220928.001339.281-financas','2022-10-19 08:55:06','5049b511f7a36695ae55ebc17264fc21'),(1087,2,'20220928.001342.306-financas','2022-10-19 08:55:06','bfb2895366d566a6b84309f8eb1225fc'),(1088,2,'20220928.001345.336-financas','2022-10-19 08:55:06','467c83e32e86c6c242ecced0a4c8c368'),(1089,2,'20220928.001348.365-financas','2022-10-19 08:55:06','7256d3f73278f3382b4aaef2dd05ea93'),(1090,2,'20220928.001351.392-financas','2022-10-19 08:55:06','e1bb7efadb0381c10ed814950cd9f3ac'),(1091,2,'20220928.001354.423-financas','2022-10-19 08:55:07','0764f69889f54f4cd47bd0999a2a7cdc'),(1092,2,'20220928.001357.454-financas','2022-10-19 08:55:07','c7599c36af812d85384c3b0ff6f210a2'),(1093,2,'20220928.001400.490-financas','2022-10-19 08:55:07','ae84ebe0ba4649481eeccf598e6f0409'),(1094,2,'20220928.001403.510-financas','2022-10-19 08:55:07','e75e0ba1b72c09c32d68e4a943feace3'),(1095,2,'20220928.001406.543-financas','2022-10-19 08:55:07','3164aa923acd450808d64f8938af6984'),(1096,2,'20220928.001409.571-financas','2022-10-19 08:55:07','aca110d43da6e64b3e2161c48b3d6d69'),(1097,2,'20220928.001412.597-financas','2022-10-19 08:55:07','29149b9a384fe30ca970538cdba10e7d'),(1098,2,'20221010.125555.282-financas','2022-10-19 08:55:07','258b9fbac5f1bf1b8ed3e909ab482d1a'),(1099,2,'20221003.115456.935','2022-10-19 14:51:52','f094c0abb852fe4e111eb94b6b46c35f'),(1100,2,'20221003.115500.121','2022-10-19 14:51:52','dabb7533652ef52e5cfd4817589be935'),(1101,2,'20200909.123438.905-plugnotas','2022-10-19 14:51:52','dcd27d340b0c7cf425c4aec3a57cad80'),(1102,2,'20200909.123439.436-plugnotas','2022-10-19 14:51:52','36d84cb7090792b51d4c956842593c5e'),(1103,2,'20200909.123439.966-plugnotas','2022-10-19 14:51:52','ce408dd5fe34c32cc2fb822f00aa2baf'),(1104,1,'1.0.21.90','2022-10-19 14:51:52','d9a5a46715fa4527d754019f7785a567');
/*!40000 ALTER TABLE `versao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 15:16:33
