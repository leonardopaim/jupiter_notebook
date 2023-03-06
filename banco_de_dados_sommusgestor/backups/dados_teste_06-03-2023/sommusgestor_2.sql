-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_2
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,3,2,'2023-03-04 11:57:47',1,'2023-03-05 11:57:47',1,2,10.00,15.00);
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
INSERT INTO `caixa_usuario` VALUES (1,1,1);
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
INSERT INTO `caixa_valor` VALUES (1,1,7.00,7.00),(1,2,3.00,3.00);
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
  `recebimento_pagamento_categoria_id` int(11) DEFAULT NULL,
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `uk_categoria_1` (`codigo_interno`),
  KEY `k_categoria_1` (`categoria_grupo_id`),
  KEY `k_categoria_2` (`recebimento_pagamento_categoria_id`),
  CONSTRAINT `fk_categoria_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_2` FOREIGN KEY (`recebimento_pagamento_categoria_id`) REFERENCES `categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,NULL,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,97,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,NULL,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,98,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,NULL,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,NULL,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,NULL,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,NULL,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,NULL,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,NULL,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,105,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,NULL,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,NULL,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,NULL,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,NULL,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,NULL,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,NULL,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,NULL,'','S',3),(117,28,'2','CUSTOS',NULL,NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,NULL,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,121,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,NULL,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,NULL,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,NULL,'C','A',4),(124,35,'3','DESPESAS',NULL,NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,NULL,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,NULL,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,NULL,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,NULL,'D','A',4),(130,41,'3.1.01.005','Cartório',23,NULL,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,NULL,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,NULL,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,NULL,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,NULL,'D','A',4),(135,46,'3.1.01.010','Correios',23,NULL,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,NULL,'D','A',4),(137,48,'3.1.01.012','Doações',23,NULL,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,NULL,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,NULL,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,NULL,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,NULL,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,NULL,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,NULL,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,NULL,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,NULL,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,NULL,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,NULL,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,NULL,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,NULL,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,NULL,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,NULL,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,NULL,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,NULL,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,NULL,'D','A',4),(156,67,'3.1.02.002','Comissões',24,NULL,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,NULL,'D','A',4),(158,69,'3.1.02.004','Premiações',24,NULL,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,NULL,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,NULL,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,NULL,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,NULL,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,NULL,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,NULL,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,NULL,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,NULL,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,NULL,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,NULL,'D','A',4),(172,83,'3.1.05.004','Jornais',27,NULL,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,NULL,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,NULL,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,NULL,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,NULL,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,NULL,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,NULL,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,NULL,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,NULL,'D','A',4),(182,93,'3.1.06.005','Comissão',28,NULL,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,NULL,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,NULL,'D','A',4),(185,96,'3.1.06.008','Férias',28,NULL,'D','A',4),(186,97,'3.1.06.009','FGTS',28,NULL,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,NULL,'D','A',4),(188,99,'3.1.06.011','INSS',28,NULL,'D','A',4),(189,100,'3.1.06.012','IRRF',28,NULL,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,NULL,'D','A',4),(191,102,'3.1.06.014','Salário',28,NULL,'D','A',4),(192,103,'3.1.06.015','Salário família',28,NULL,'D','A',4),(193,104,'3.1.06.016','Seguro',28,NULL,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,NULL,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,NULL,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,NULL,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,NULL,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,NULL,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,NULL,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,NULL,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,NULL,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,NULL,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,NULL,'D','A',4),(208,119,'4.1.01.002','Ações',32,NULL,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,NULL,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,NULL,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,NULL,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,NULL,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,NULL,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,NULL,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,NULL,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,NULL,'','S',3),(225,NULL,'6.1.01.001','Contas a receber',38,NULL,'C','A',4),(226,NULL,'2.1.01.006','Devolução de compra à prazo',22,NULL,'C','A',4),(227,NULL,'1.1.01.011','(Teste Movimento) - Vendas a Vista',1,NULL,'C','A',4),(228,NULL,'1.1.01.012','(Teste Movimento) - Vendas a Prazo',2,NULL,'C','A',4),(229,NULL,'1.1.01.013','(Teste Movimento) - Recebimento de vendas a prazo',5,NULL,'C','A',4),(230,NULL,'5.1.01.001','(Teste Empréstimo) - Tomada empréstimo',35,NULL,'C','A',4),(231,NULL,'5.1.02.001','(Teste Empréstimo) - Pagamento empréstimo',36,NULL,'D','A',4),(232,NULL,'5.1.03.001','(Teste Empréstimo) - Pagamento juros empréstimo',37,NULL,'D','A',4);
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
INSERT INTO `categoria_centro_resultado` VALUES (227,4,3,100.0000),(228,4,3,100.0000),(229,4,3,100.0000),(230,4,3,100.0000),(231,4,3,100.0000),(232,4,3,100.0000);
/*!40000 ALTER TABLE `categoria_centro_resultado` ENABLE KEYS */;
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
INSERT INTO `categoria_empresa` VALUES (90,3,NULL,'',1,0),(91,3,NULL,'',1,0),(92,3,NULL,'',1,0),(93,3,NULL,'',1,0),(94,3,NULL,'',1,0),(95,3,NULL,'',1,0),(96,3,NULL,'',1,0),(97,3,NULL,'',1,0),(98,3,NULL,'',1,0),(99,3,NULL,'',1,0),(100,3,NULL,'',1,0),(101,3,NULL,'',1,0),(102,3,NULL,'',1,0),(103,3,NULL,'',1,0),(104,3,NULL,'',1,0),(105,3,NULL,'',1,0),(106,3,NULL,'',1,0),(107,3,NULL,'',1,0),(108,3,NULL,'',1,0),(109,3,NULL,'',1,0),(110,3,NULL,'',1,0),(111,3,NULL,'',1,0),(112,3,NULL,'',1,0),(113,3,NULL,'',1,0),(114,3,NULL,'',1,0),(115,3,NULL,'',1,0),(116,3,NULL,'',1,0),(117,3,NULL,'',1,0),(118,3,NULL,'',1,0),(119,3,NULL,'',1,0),(120,3,NULL,'',1,0),(121,3,NULL,'',1,0),(122,3,NULL,'',1,0),(123,3,NULL,'',1,0),(124,3,NULL,'',1,0),(125,3,NULL,'',1,0),(126,3,NULL,'',1,0),(127,3,NULL,'',1,0),(128,3,NULL,'',1,0),(129,3,NULL,'',1,0),(130,3,NULL,'',1,0),(131,3,NULL,'',1,0),(132,3,NULL,'',1,0),(133,3,NULL,'',1,0),(134,3,NULL,'',1,0),(135,3,NULL,'',1,0),(136,3,NULL,'',1,0),(137,3,NULL,'',1,0),(138,3,NULL,'',1,0),(139,3,NULL,'',1,0),(140,3,NULL,'',1,0),(141,3,NULL,'',1,0),(142,3,NULL,'',1,0),(143,3,NULL,'',1,0),(144,3,NULL,'',1,0),(145,3,NULL,'',1,0),(146,3,NULL,'',1,0),(147,3,NULL,'',1,0),(148,3,NULL,'',1,0),(149,3,NULL,'',1,0),(150,3,NULL,'',1,0),(151,3,NULL,'',1,0),(152,3,NULL,'',1,0),(153,3,NULL,'',1,0),(154,3,NULL,'',1,0),(155,3,NULL,'',1,0),(156,3,NULL,'',1,0),(157,3,NULL,'',1,0),(158,3,NULL,'',1,0),(159,3,NULL,'',1,0),(160,3,NULL,'',1,0),(161,3,NULL,'',1,0),(162,3,NULL,'',1,0),(163,3,NULL,'',1,0),(164,3,NULL,'',1,0),(165,3,NULL,'',1,0),(166,3,NULL,'',1,0),(167,3,NULL,'',1,0),(168,3,NULL,'',1,0),(169,3,NULL,'',1,0),(170,3,NULL,'',1,0),(171,3,NULL,'',1,0),(172,3,NULL,'',1,0),(173,3,NULL,'',1,0),(174,3,NULL,'',1,0),(175,3,NULL,'',1,0),(176,3,NULL,'',1,0),(177,3,NULL,'',1,0),(178,3,NULL,'',1,0),(179,3,NULL,'',1,0),(180,3,NULL,'',1,0),(181,3,NULL,'',1,0),(182,3,NULL,'',1,0),(183,3,NULL,'',1,0),(184,3,NULL,'',1,0),(185,3,NULL,'',1,0),(186,3,NULL,'',1,0),(187,3,NULL,'',1,0),(188,3,NULL,'',1,0),(189,3,NULL,'',1,0),(190,3,NULL,'',1,0),(191,3,NULL,'',1,0),(192,3,NULL,'',1,0),(193,3,NULL,'',1,0),(194,3,NULL,'',1,0),(195,3,NULL,'',1,0),(196,3,NULL,'',1,0),(197,3,NULL,'',1,0),(198,3,NULL,'',1,0),(199,3,NULL,'',1,0),(200,3,NULL,'',1,0),(201,3,NULL,'',1,0),(202,3,NULL,'',1,0),(203,3,NULL,'',1,0),(204,3,NULL,'',1,0),(205,3,NULL,'',1,0),(206,3,NULL,'',1,0),(207,3,NULL,'',1,0),(208,3,NULL,'',1,0),(209,3,NULL,'',1,0),(210,3,NULL,'',1,0),(211,3,NULL,'',1,0),(212,3,NULL,'',1,0),(213,3,NULL,'',1,0),(214,3,NULL,'',1,0),(215,3,NULL,'',1,0),(216,3,NULL,'',1,0),(217,3,NULL,'',1,0),(218,3,NULL,'',1,0),(219,3,NULL,'',1,0),(220,3,NULL,'',1,0),(221,3,NULL,'',1,0),(222,3,NULL,'',1,0),(223,3,NULL,'',1,0),(224,3,NULL,'',1,0),(225,3,NULL,'',1,0),(226,3,NULL,'',1,0),(227,3,NULL,'',1,0),(228,3,NULL,'',1,0),(229,3,NULL,'',1,0),(230,3,NULL,'',1,0),(231,3,NULL,'',1,0),(232,3,NULL,'',1,0);
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
  `categoria_grupo_conta_contabil_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_grupo_id` int(11) NOT NULL DEFAULT '0',
  `conta_contabil_id` int(11) NOT NULL DEFAULT '0',
  `origem` int(2) NOT NULL DEFAULT '0',
  `saldo` int(1) NOT NULL DEFAULT '0',
  `valor` int(1) NOT NULL DEFAULT '0',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_grupo_conta_contabil_id`),
  UNIQUE KEY `uk_categoria_grupo_conta_contabil_1` (`categoria_grupo_id`,`conta_contabil_id`,`origem`,`regime`),
  KEY `k_categoria_grupo_conta_contabil_1` (`categoria_grupo_id`),
  KEY `k_categoria_grupo_conta_contabil_2` (`conta_contabil_id`),
  CONSTRAINT `fk_categoria_grupo_conta_contabil_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_grupo_conta_contabil_2` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo_conta_contabil`
--

LOCK TABLES `categoria_grupo_conta_contabil` WRITE;
/*!40000 ALTER TABLE `categoria_grupo_conta_contabil` DISABLE KEYS */;
INSERT INTO `categoria_grupo_conta_contabil` VALUES (1,1,34,1,1,1,1),(2,1,78,1,1,1,1),(3,1,4,1,1,1,2),(4,1,9,1,2,2,2),(5,1,34,1,1,1,2),(6,1,56,1,1,2,2),(7,1,78,1,1,3,2),(8,1,29,1,1,3,2),(9,2,6,2,1,1,2),(10,2,9,2,2,2,2),(11,2,34,2,1,1,2),(12,2,56,2,1,2,2),(13,2,78,2,1,3,2),(14,2,29,2,1,3,2),(15,3,35,1,1,1,1),(16,3,78,1,1,1,1),(17,3,4,1,1,1,2),(18,3,35,1,1,1,2),(19,3,78,1,1,1,2),(20,3,29,1,1,1,2),(21,4,6,2,1,1,2),(22,4,35,2,1,1,2),(23,4,78,2,1,1,2),(24,4,29,2,1,1,2),(25,5,36,9,1,7,1),(26,5,71,9,1,8,1),(27,5,50,9,1,9,1),(28,5,78,9,1,1,1),(29,5,4,9,1,1,2),(30,5,6,9,2,7,2),(31,5,71,9,1,8,2),(32,5,50,9,1,9,2),(33,5,78,9,1,10,2),(34,5,29,9,1,10,2),(35,6,37,9,1,7,1),(36,6,71,9,1,8,1),(37,6,50,9,1,9,1),(38,6,78,9,1,1,1),(39,6,4,9,1,1,2),(40,6,6,9,2,7,2),(41,6,71,9,1,8,2),(42,6,50,9,1,9,2),(43,6,78,9,1,10,2),(44,6,29,9,1,10,2),(45,7,38,5,2,1,1),(46,7,78,5,2,1,1),(47,7,4,5,2,1,2),(48,7,9,5,1,2,2),(49,7,38,5,2,1,2),(50,7,56,5,2,2,2),(51,7,78,5,2,3,2),(52,7,29,5,2,3,2),(53,8,6,6,2,1,2),(54,8,9,6,1,2,2),(55,8,38,6,2,1,2),(56,8,56,6,2,2,2),(57,8,78,6,2,3,2),(58,8,29,6,2,3,2),(59,9,39,5,2,1,1),(60,9,78,5,2,1,1),(61,9,4,5,2,1,2),(62,9,39,5,2,1,2),(63,9,78,5,2,1,2),(64,9,29,5,2,1,2),(65,10,6,6,2,1,2),(66,10,39,6,2,1,2),(67,10,78,6,2,1,2),(68,10,29,6,2,1,2),(69,11,6,15,1,1,2),(70,11,41,15,1,1,2),(71,11,78,15,1,1,2),(72,11,29,15,1,1,2),(73,12,41,9,1,7,1),(74,12,71,9,1,8,1),(75,12,50,9,1,9,1),(76,12,78,9,1,1,1),(77,12,4,9,1,1,2),(78,12,6,9,2,7,2),(79,12,71,9,1,8,2),(80,12,50,9,1,9,2),(81,12,78,9,1,10,2),(82,12,29,9,1,10,2),(83,13,45,11,1,1,1),(84,13,78,11,1,1,1),(85,13,4,11,1,1,2),(86,13,45,11,1,1,2),(87,13,78,11,1,1,2),(88,13,25,11,1,1,2),(89,13,7,12,1,1,2),(90,13,45,12,1,1,2),(91,13,78,12,1,1,2),(92,13,25,12,1,1,2),(93,13,45,9,1,7,1),(94,13,71,9,1,8,1),(95,13,50,9,1,9,1),(96,13,78,9,1,1,1),(97,13,4,9,1,1,2),(98,13,7,9,2,7,2),(99,13,71,9,1,8,2),(100,13,50,9,1,9,2),(101,13,78,9,1,10,2),(102,13,29,9,1,10,2),(103,14,46,11,1,1,1),(104,14,78,11,1,1,1),(105,14,4,11,1,1,2),(106,14,13,11,2,1,2),(107,14,7,12,1,1,2),(108,14,13,12,2,1,2),(109,14,46,9,1,7,1),(110,14,71,9,1,8,1),(111,14,50,9,1,9,1),(112,14,78,9,1,1,1),(113,14,4,9,1,1,2),(114,14,7,9,2,7,2),(115,14,71,9,1,8,2),(116,14,50,9,1,9,2),(117,14,78,9,1,10,2),(118,14,29,9,1,10,2),(119,15,47,11,1,1,1),(120,15,78,11,1,1,1),(121,15,4,11,1,1,2),(122,15,12,11,2,1,2),(123,15,7,12,1,1,2),(124,15,12,12,2,1,2),(125,15,47,9,1,7,1),(126,15,71,9,1,8,1),(127,15,50,9,1,9,1),(128,15,78,9,1,1,1),(129,15,4,9,1,1,2),(130,15,7,9,2,7,2),(131,15,71,9,1,8,2),(132,15,50,9,1,9,2),(133,15,78,9,1,10,2),(134,15,29,9,1,10,2),(135,16,48,11,1,1,1),(136,16,78,11,1,1,1),(137,16,4,11,1,1,2),(138,16,48,11,1,1,2),(139,16,78,11,1,1,2),(140,16,29,11,1,1,2),(141,16,7,12,1,1,2),(142,16,48,12,1,1,2),(143,16,78,12,1,1,2),(144,16,29,12,1,1,2),(145,16,48,9,1,7,1),(146,16,71,9,1,8,1),(147,16,50,9,1,9,1),(148,16,78,9,1,1,1),(149,16,4,9,1,1,2),(150,16,7,9,2,7,2),(151,16,71,9,1,8,2),(152,16,50,9,1,9,2),(153,16,78,9,1,10,2),(154,16,29,9,1,10,2),(155,17,52,11,1,1,1),(156,17,78,11,1,1,1),(157,17,4,11,1,1,2),(158,17,52,11,1,1,2),(159,17,78,11,1,1,2),(160,17,29,11,1,1,2),(161,17,7,12,1,1,2),(162,17,52,12,1,1,2),(163,17,78,12,1,1,2),(164,17,29,12,1,1,2),(165,17,52,9,1,7,1),(166,17,71,9,1,8,1),(167,17,50,9,1,9,1),(168,17,78,9,1,1,1),(169,17,4,9,1,1,2),(170,17,7,9,2,7,2),(171,17,71,9,1,8,2),(172,17,50,9,1,9,2),(173,17,78,9,1,10,2),(174,17,29,9,1,10,2),(175,18,56,3,1,1,1),(176,18,78,3,2,1,1),(177,18,4,3,2,1,2),(178,18,9,3,1,1,2),(179,19,18,4,1,1,2),(180,19,9,4,1,1,2),(181,20,56,10,1,7,1),(182,20,49,10,1,8,1),(183,20,72,10,1,9,1),(184,20,78,10,2,1,1),(185,20,4,10,2,1,2),(186,20,18,10,2,7,2),(187,20,49,10,1,8,2),(188,20,72,10,1,9,2),(189,20,78,10,2,10,2),(190,20,29,10,2,10,2),(191,21,56,7,2,1,1),(192,21,78,7,1,1,1),(193,21,4,7,1,1,2),(194,21,9,7,2,1,2),(195,22,18,8,2,1,2),(196,22,9,8,2,1,2),(197,23,63,11,1,1,1),(198,23,78,11,2,1,1),(199,23,4,11,2,1,2),(200,23,63,11,1,1,2),(201,23,78,11,2,1,2),(202,23,29,11,2,1,2),(203,23,21,13,1,1,2),(204,23,63,13,1,1,2),(205,23,78,13,2,1,2),(206,23,29,13,2,1,2),(207,23,63,10,1,7,1),(208,23,49,10,1,8,1),(209,23,72,10,1,9,1),(210,23,78,10,2,1,1),(211,23,4,10,2,1,2),(212,23,21,10,2,7,2),(213,23,49,10,1,8,2),(214,23,72,10,1,9,2),(215,23,78,10,2,10,2),(216,23,29,10,2,10,2),(217,24,64,11,1,1,1),(218,24,78,11,2,1,1),(219,24,4,11,2,1,2),(220,24,64,11,1,1,2),(221,24,78,11,2,1,2),(222,24,29,11,2,1,2),(223,24,21,13,1,1,2),(224,24,64,13,1,1,2),(225,24,78,13,2,1,2),(226,24,29,13,2,1,2),(227,24,64,10,1,7,1),(228,24,49,10,1,8,1),(229,24,72,10,1,9,1),(230,24,78,10,2,1,1),(231,24,4,10,2,1,2),(232,24,21,10,2,7,2),(233,24,49,10,1,8,2),(234,24,72,10,1,9,2),(235,24,78,10,2,10,2),(236,24,29,10,2,10,2),(237,25,65,11,1,1,1),(238,25,78,11,2,1,1),(239,25,4,11,2,1,2),(240,25,65,11,1,1,2),(241,25,78,11,2,1,2),(242,25,29,11,2,1,2),(243,25,21,13,1,1,2),(244,25,65,13,1,1,2),(245,25,78,13,2,1,2),(246,25,29,13,2,1,2),(247,25,65,10,1,7,1),(248,25,49,10,1,8,1),(249,25,72,10,1,9,1),(250,25,78,10,2,1,1),(251,25,4,10,2,1,2),(252,25,21,10,2,7,2),(253,25,49,10,1,8,2),(254,25,72,10,1,9,2),(255,25,78,10,2,10,2),(256,25,29,10,2,10,2),(257,26,66,11,1,1,1),(258,26,78,11,2,1,1),(259,26,4,11,2,1,2),(260,26,66,11,1,1,2),(261,26,78,11,2,1,2),(262,26,29,11,2,1,2),(263,26,21,13,1,1,2),(264,26,66,13,1,1,2),(265,26,78,13,2,1,2),(266,26,29,13,2,1,2),(267,26,66,10,1,7,1),(268,26,49,10,1,8,1),(269,26,72,10,1,9,1),(270,26,78,10,2,1,1),(271,26,4,10,2,1,2),(272,26,21,10,2,7,2),(273,26,49,10,1,8,2),(274,26,72,10,1,9,2),(275,26,78,10,2,10,2),(276,26,29,10,2,10,2),(277,27,67,11,1,1,1),(278,27,78,11,2,1,1),(279,27,4,11,2,1,2),(280,27,67,11,1,1,2),(281,27,78,11,2,1,2),(282,27,29,11,2,1,2),(283,27,21,13,1,1,2),(284,27,67,13,1,1,2),(285,27,78,13,2,1,2),(286,27,29,13,2,1,2),(287,27,67,10,1,7,1),(288,27,49,10,1,8,1),(289,27,72,10,1,9,1),(290,27,78,10,2,1,1),(291,27,4,10,2,1,2),(292,27,21,10,2,7,2),(293,27,49,10,1,8,2),(294,27,72,10,1,9,2),(295,27,78,10,2,10,2),(296,27,29,10,2,10,2),(297,28,68,14,1,1,1),(298,28,78,14,2,1,1),(299,28,4,14,2,1,2),(300,28,68,14,1,1,2),(301,28,78,14,2,1,2),(302,28,29,14,2,1,2),(303,29,68,14,2,1,1),(304,29,78,14,1,1,1),(305,29,4,14,1,1,2),(306,29,68,14,2,1,2),(307,29,78,14,1,1,2),(308,29,29,14,1,1,2),(309,30,69,11,1,1,1),(310,30,78,11,2,1,1),(311,30,4,11,2,1,2),(312,30,69,11,1,1,2),(313,30,78,11,2,1,2),(314,30,29,11,2,1,2),(315,30,21,13,1,1,2),(316,30,69,13,1,1,2),(317,30,78,13,2,1,2),(318,30,29,13,2,1,2),(319,30,69,10,1,7,1),(320,30,49,10,1,8,1),(321,30,72,10,1,9,1),(322,30,78,10,2,1,1),(323,30,4,10,2,1,2),(324,30,21,10,2,7,2),(325,30,49,10,1,8,2),(326,30,72,10,1,9,2),(327,30,78,10,2,10,2),(328,30,29,10,2,10,2),(329,31,74,11,1,1,1),(330,31,78,11,2,1,1),(331,31,4,11,2,1,2),(332,31,74,11,1,1,2),(333,31,78,11,2,1,2),(334,31,29,11,2,1,2),(335,31,21,13,1,1,2),(336,31,74,13,1,1,2),(337,31,78,13,2,1,2),(338,31,29,13,2,1,2),(339,31,74,10,1,7,1),(340,31,49,10,1,8,1),(341,31,72,10,1,9,1),(342,31,78,10,2,1,1),(343,31,4,10,2,1,2),(344,31,21,10,2,7,2),(345,31,49,10,1,8,2),(346,31,72,10,1,9,2),(347,31,78,10,2,10,2),(348,31,29,10,2,10,2),(349,32,58,11,1,1,1),(350,32,78,11,2,1,1),(351,32,4,11,2,1,2),(352,32,12,11,1,1,2),(353,32,21,13,1,1,2),(354,32,12,13,1,1,2),(355,32,58,10,1,7,1),(356,32,49,10,1,8,1),(357,32,72,10,1,9,1),(358,32,78,10,2,1,1),(359,32,4,10,2,1,2),(360,32,21,10,2,7,2),(361,32,49,10,1,8,2),(362,32,72,10,1,9,2),(363,32,78,10,2,10,2),(364,32,29,10,2,10,2),(365,33,59,11,1,1,1),(366,33,78,11,2,1,1),(367,33,4,11,2,1,2),(368,33,13,11,1,1,2),(369,33,21,13,1,1,2),(370,33,13,13,1,1,2),(371,33,59,10,1,7,1),(372,33,49,10,1,8,1),(373,33,72,10,1,9,1),(374,33,78,10,2,1,1),(375,33,4,10,2,1,2),(376,33,21,10,2,7,2),(377,33,49,10,1,8,2),(378,33,72,10,1,9,2),(379,33,78,10,2,10,2),(380,33,29,10,2,10,2),(381,34,60,11,1,1,1),(382,34,78,11,2,1,1),(383,34,4,11,2,1,2),(384,34,14,11,1,1,2),(385,34,21,13,1,1,2),(386,34,14,13,1,1,2),(387,34,60,10,1,7,1),(388,34,49,10,1,8,1),(389,34,72,10,1,9,1),(390,34,78,10,2,1,1),(391,34,4,10,2,1,2),(392,34,21,10,2,7,2),(393,34,49,10,1,8,2),(394,34,72,10,1,9,2),(395,34,78,10,2,10,2),(396,34,29,10,2,10,2),(397,35,4,16,1,4,2),(398,35,19,16,1,5,2),(399,35,20,16,2,6,2),(400,36,49,10,1,8,1),(401,36,72,10,1,9,1),(402,36,78,10,2,10,1),(403,36,4,10,2,1,2),(404,36,19,10,2,7,2),(405,36,49,10,1,8,2),(406,36,72,10,1,9,2),(407,36,78,10,2,10,2),(408,36,29,10,2,10,2),(409,37,65,10,1,7,1),(410,37,49,10,1,8,1),(411,37,72,10,1,9,1),(412,37,78,10,2,1,1),(413,37,4,10,2,1,2),(414,37,19,10,2,7,2),(415,37,20,10,1,7,2),(416,37,65,10,1,7,2),(417,37,49,10,1,8,2),(418,37,72,10,1,9,2),(419,37,78,10,2,1,2),(420,37,29,10,2,1,2),(421,38,51,11,1,1,1),(422,38,78,11,1,1,1),(423,38,4,11,1,1,2),(424,38,51,11,1,1,2),(425,38,78,11,1,1,2),(426,38,30,11,1,1,2),(427,38,7,12,1,1,2),(428,38,51,12,1,1,2),(429,38,78,12,1,1,2),(430,38,30,12,1,1,2),(431,38,51,9,1,7,1),(432,38,71,9,1,8,1),(433,38,50,9,1,9,1),(434,38,78,9,1,1,1),(435,38,4,9,1,1,2),(436,38,7,9,2,7,2),(437,38,71,9,1,8,2),(438,38,50,9,1,9,2),(439,38,78,9,1,10,2),(440,38,29,9,1,10,2),(441,39,73,11,1,1,1),(442,39,78,11,2,1,1),(443,39,4,11,2,1,2),(444,39,73,11,1,1,2),(445,39,78,11,2,1,2),(446,39,30,11,2,1,2),(447,39,21,13,1,1,2),(448,39,73,13,1,1,2),(449,39,78,13,2,1,2),(450,39,30,13,2,1,2),(451,39,73,10,1,7,1),(452,39,49,10,1,8,1),(453,39,72,10,1,9,1),(454,39,78,10,2,1,1),(455,39,4,10,2,1,2),(456,39,21,10,2,7,2),(457,39,49,10,1,8,2),(458,39,72,10,1,9,2),(459,39,78,10,2,10,2),(460,39,29,10,2,10,2);
/*!40000 ALTER TABLE `categoria_grupo_conta_contabil` ENABLE KEYS */;
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
INSERT INTO `cliente_contrato` VALUES (1,3,2,NULL,4,NULL,1,119,NULL,'2022-03-04','2025-03-04','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,3,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0);
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
INSERT INTO `cliente_credito` VALUES (1,4,3,NULL,1,NULL,NULL,NULL,'2023-03-04 11:47:32',10.50,'C');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,3,105522,6,3,9,NULL,'2023-03-04',1,0,300.00,300.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,3,NULL),(2,3,129589,6,3,9,NULL,'2023-03-04',2,2,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,4,NULL),(3,3,19985761,6,3,9,NULL,'2023-03-04',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,5,NULL),(4,3,19985762,6,3,9,NULL,'2023-03-04',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,6,NULL),(5,3,19985763,6,3,9,NULL,'2023-03-04',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,7,NULL),(6,3,19985764,6,3,9,NULL,'2023-03-04',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,8,NULL),(7,3,129581,6,3,9,NULL,'2023-03-04',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,9,NULL),(8,3,129582,6,3,9,NULL,'2023-03-04',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,10,NULL),(9,3,129583,6,3,9,NULL,'2023-03-04',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,1,11,NULL),(10,3,129584,6,3,9,NULL,'2023-03-04',2,2,700.00,700.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,12,NULL),(11,3,129585,6,3,9,NULL,'2023-03-04',1,0,70.00,70.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(12,3,129586,6,3,9,NULL,'2023-03-04',1,0,80.00,80.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(13,3,129587,6,3,9,NULL,'2023-03-04',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(14,3,13250,6,3,9,NULL,'2023-03-04',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,1),(15,3,19985763,6,3,9,NULL,'2023-03-04',1,0,1000.00,1008.00,0.00,0.00,0.00,0.00,8.00,1,'',0,0,19,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_item`
--

LOCK TABLES `compra_item` WRITE;
/*!40000 ALTER TABLE `compra_item` DISABLE KEYS */;
INSERT INTO `compra_item` VALUES (1,1,3,NULL,NULL,1,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,3,NULL),(2,1,5,NULL,NULL,2,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,4,NULL),(3,1,3,1,NULL,3,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,5,NULL),(4,2,1,1,NULL,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,6,NULL),(5,3,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,7,NULL),(6,4,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,8,NULL),(7,5,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,9,NULL),(8,6,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,10,NULL),(9,7,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,11,NULL),(10,8,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,12,NULL),(11,9,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,13,NULL),(12,10,1,1,NULL,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,0.00,14,NULL),(13,10,3,NULL,NULL,2,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,15,NULL),(14,10,5,NULL,NULL,3,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,16,NULL),(15,11,7,NULL,NULL,1,10.0000,7.0000,70.00,70.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(16,12,7,NULL,NULL,1,10.0000,8.0000,80.00,80.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(17,13,7,NULL,NULL,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(18,14,1,1,NULL,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,0.00,NULL,1),(19,15,1,1,NULL,1,10.0000,50.0000,500.00,503.00,0.00,0.00,0.00,0.00,3.00,20,NULL),(20,15,1,1,NULL,2,10.0000,50.0000,500.00,505.00,0.00,0.00,0.00,0.00,5.00,21,NULL);
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
INSERT INTO `compra_pendente` VALUES (2,3,6,'31190249051659000166550000001391461077451590',7745159,3,9,NULL,'2023-03-04','2023-03-04',1,'55',1,0,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'',''),(16,3,6,'31160704731855000143550010007485481189117075',105522,3,9,NULL,'2023-03-04','2023-03-04',1,'55',1,0,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'','');
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
INSERT INTO `configuracao` VALUES (3,1,6,0,'','',1045.00,1,104,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,1,0,0,0,0,8,0,'0123456789','1',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,3,1,0,'Caixa interno',1,-290.00,0.00,'2023-03-03','','','',NULL,1,0),(2,3,NULL,0,'Caixa',1,203308.06,0.00,'2023-03-03','','','',NULL,1,0),(6,3,NULL,0,'Pdv Teste',1,0.00,0.00,'2023-03-04','','','',NULL,0,0),(7,3,NULL,0,'Pdv Teste',1,5.00,0.00,'2023-03-04','','','',NULL,1,0);
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
  `numero_remessa` int(7) NOT NULL DEFAULT '0',
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
INSERT INTO `conta_contabil_saldo` VALUES (4,3,'202101',6.30,2),(4,3,'202303',202865.82,2),(6,3,'202101',6.30,2),(6,3,'202303',141.74,2),(9,3,'202101',-10.00,2),(9,3,'202303',662.00,2),(18,3,'202303',600.00,2),(19,3,'202303',0.00,2),(20,3,'202303',0.00,2),(29,3,'202101',2.60,2),(29,3,'202303',203069.56,2),(34,3,'202101',6.30,1),(34,3,'202101',12.60,2),(34,3,'202303',203166.32,1),(34,3,'202303',203308.06,2),(38,3,'202303',-10.50,1),(38,3,'202303',-10.50,2),(56,3,'202101',10.00,2),(56,3,'202303',290.00,1),(56,3,'202303',228.00,2),(65,3,'202303',0.00,1),(65,3,'202303',0.00,2),(78,3,'202101',6.30,1),(78,3,'202101',2.60,2),(78,3,'202303',202865.82,1),(78,3,'202303',203069.56,2);
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
INSERT INTO `conta_saldo` VALUES (1,'2023-03-04',-290.00),(2,'2021-01-01',12.60),(2,'2023-03-03',12.60),(2,'2023-03-04',203308.06);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cte`
--

LOCK TABLES `cte` WRITE;
/*!40000 ALTER TABLE `cte` DISABLE KEYS */;
INSERT INTO `cte` VALUES (1,3,15,1353,2,1,'2023-03-04 11:57:44','2023-03-04 11:57:44',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31230321148618000173570010000000151000000152','','','','','','',NULL,0,0,0),(2,3,15,1353,2,1,'2023-03-03 11:57:44','2023-03-04 11:57:44',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31230321148618000173570010000000151000000152','','','','','','',NULL,0,0,0);
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
INSERT INTO `devolucao_compra` VALUES (1,3,9,'2023-03-04 11:47:32',4,3,NULL,500.00,500.00,0.00,0.00,0.00,0.00,0.00,0,1,NULL,NULL,2);
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
INSERT INTO `devolucao_venda` VALUES (1,3,11,'2023-03-04 11:47:32',11,NULL,10.50,10.50,0.00,0.00,0.00,0.00,1,1,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominio`
--

LOCK TABLES `dominio` WRITE;
/*!40000 ALTER TABLE `dominio` DISABLE KEYS */;
INSERT INTO `dominio` VALUES (1,1,NULL,NULL,'NfeDominioTest',1,'DOMINIO;NFe;1'),(2,2,NULL,NULL,'VendaNfeDominioTest',1,'DOMINIO;NFe;2'),(3,3,NULL,NULL,'ComprasNfeDominioTest',1,'DOMINIO;NFe;3'),(4,NULL,1,NULL,'VendaNfceDominioTest',1,'DOMINIO;NFce;4');
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
INSERT INTO `empresa` VALUES (3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2023-03-04','Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,2,3,'2023-03-04 11:58:04',100.00,5.00,10.00,110.00,5,5,'2023-03-05 11:58:04',1);
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
INSERT INTO `emprestimo_categoria` VALUES (1,230,1),(1,161,2),(1,231,3),(1,232,4);
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
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2023-03-04 11:45:05');
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
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2023-03-04 11:45:28'),(2,2,'Cheque',1,2,2,1,0,1,'2023-03-04 11:45:28'),(3,3,'Cartão',1,3,3,0,0,0,'2023-03-04 11:45:28'),(4,4,'Crédiário',2,4,99,0,0,0,'2023-03-04 11:45:28'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2023-03-04 11:45:29'),(6,6,'PIX',1,6,17,0,0,1,'2023-03-04 11:45:29'),(7,NULL,'Dinheiro',1,1,0,0,0,1,'2023-03-04 11:45:14'),(8,NULL,'Outros',9,99,0,0,0,0,'2023-03-04 11:45:29'),(9,NULL,'Cheque',9,2,0,0,0,1,'2023-03-04 11:45:15'),(10,NULL,'Cartão',9,3,0,0,0,1,'2023-03-04 11:45:15'),(11,NULL,'Crediário',2,4,0,0,0,1,'2023-03-04 11:45:15'),(12,NULL,'PIX',1,6,0,0,0,1,'2023-03-04 11:45:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2023-03-04 11:44:36',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(2,NULL,'2023-03-04 11:44:36',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"3798653157\",\"[identificacao]\":\"3798653157\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(3,NULL,'2023-03-04 11:44:36',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. A\",\"[identificacao]\":\"Av. A\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(4,NULL,'2023-03-04 11:44:45',2,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}',0,0,''),(5,NULL,'2023-03-04 11:44:45',2,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"037998653157\",\"[identificacao]\":\"037998653157\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(6,NULL,'2023-03-04 11:44:45',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"037999887766\",\"[identificacao]\":\"037999887766\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(7,NULL,'2023-03-04 11:44:45',2,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Almirante Tamandaré\",\"[identificacao]\":\"Av. Almirante Tamandaré\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(8,NULL,'2023-03-04 11:44:49',1,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(9,NULL,'2023-03-04 11:44:49',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(10,NULL,'2023-03-04 11:44:49',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(11,NULL,'2023-03-04 11:44:49',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(12,NULL,'2023-03-04 11:44:49',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(13,NULL,'2023-03-04 11:44:49',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(14,NULL,'2023-03-04 11:44:49',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(15,NULL,'2023-03-04 11:44:49',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(16,NULL,'2023-03-04 11:44:49',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(17,NULL,'2023-03-04 11:44:49',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(18,NULL,'2023-03-04 11:44:49',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(19,NULL,'2023-03-04 11:44:49',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(20,NULL,'2023-03-04 11:44:49',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(21,NULL,'2023-03-04 11:44:49',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(22,NULL,'2023-03-04 11:44:49',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(23,NULL,'2023-03-04 11:44:49',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(24,NULL,'2023-03-04 11:44:49',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(25,NULL,'2023-03-04 11:44:49',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(26,NULL,'2023-03-04 11:44:49',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(27,NULL,'2023-03-04 11:44:49',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(28,NULL,'2023-03-04 11:44:49',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(29,NULL,'2023-03-04 11:44:49',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(30,NULL,'2023-03-04 11:44:49',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(31,NULL,'2023-03-04 11:44:49',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(32,NULL,'2023-03-04 11:44:49',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(33,NULL,'2023-03-04 11:44:49',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(34,NULL,'2023-03-04 11:44:49',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(35,NULL,'2023-03-04 11:44:49',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(36,NULL,'2023-03-04 11:44:49',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(37,NULL,'2023-03-04 11:44:49',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(38,NULL,'2023-03-04 11:44:49',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(39,NULL,'2023-03-04 11:44:49',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(40,NULL,'2023-03-04 11:44:49',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(41,NULL,'2023-03-04 11:44:49',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(42,NULL,'2023-03-04 11:44:49',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(43,NULL,'2023-03-04 11:44:49',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(44,NULL,'2023-03-04 11:44:49',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(45,NULL,'2023-03-04 11:44:49',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(46,NULL,'2023-03-04 11:44:49',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(47,NULL,'2023-03-04 11:44:49',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(48,NULL,'2023-03-04 11:44:49',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(49,NULL,'2023-03-04 11:44:49',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(50,NULL,'2023-03-04 11:44:49',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(51,NULL,'2023-03-04 11:44:49',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(52,NULL,'2023-03-04 11:44:49',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(53,NULL,'2023-03-04 11:44:49',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(54,NULL,'2023-03-04 11:44:49',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(55,NULL,'2023-03-04 11:44:49',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(56,NULL,'2023-03-04 11:44:49',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(57,NULL,'2023-03-04 11:44:49',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(58,NULL,'2023-03-04 11:44:49',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(59,NULL,'2023-03-04 11:44:49',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(60,NULL,'2023-03-04 11:44:49',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(61,NULL,'2023-03-04 11:44:49',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(62,NULL,'2023-03-04 11:44:49',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(63,NULL,'2023-03-04 11:44:49',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(64,NULL,'2023-03-04 11:44:49',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(65,NULL,'2023-03-04 11:44:49',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(66,NULL,'2023-03-04 11:44:49',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(67,NULL,'2023-03-04 11:44:49',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(68,NULL,'2023-03-04 11:44:49',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(69,NULL,'2023-03-04 11:44:49',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(70,NULL,'2023-03-04 11:44:49',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(71,NULL,'2023-03-04 11:44:49',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(72,NULL,'2023-03-04 11:44:49',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(73,NULL,'2023-03-04 11:44:49',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(74,NULL,'2023-03-04 11:44:49',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(75,NULL,'2023-03-04 11:44:49',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(76,NULL,'2023-03-04 11:44:49',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(77,NULL,'2023-03-04 11:44:49',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(78,NULL,'2023-03-04 11:44:49',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(79,NULL,'2023-03-04 11:44:49',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(80,NULL,'2023-03-04 11:44:50',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(81,NULL,'2023-03-04 11:44:50',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(82,NULL,'2023-03-04 11:44:50',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(83,NULL,'2023-03-04 11:44:50',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(84,NULL,'2023-03-04 11:44:50',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(85,NULL,'2023-03-04 11:44:50',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(86,NULL,'2023-03-04 11:44:50',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(87,NULL,'2023-03-04 11:44:50',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(88,NULL,'2023-03-04 11:44:50',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(89,NULL,'2023-03-04 11:44:50',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(90,NULL,'2023-03-04 11:44:50',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(91,NULL,'2023-03-04 11:44:50',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(92,NULL,'2023-03-04 11:44:50',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(93,NULL,'2023-03-04 11:44:50',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(94,NULL,'2023-03-04 11:44:50',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(95,NULL,'2023-03-04 11:44:50',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(96,NULL,'2023-03-04 11:44:50',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(97,NULL,'2023-03-04 11:44:50',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(98,NULL,'2023-03-04 11:44:50',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(99,NULL,'2023-03-04 11:44:50',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(100,NULL,'2023-03-04 11:44:50',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(101,NULL,'2023-03-04 11:44:50',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(102,NULL,'2023-03-04 11:44:50',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(103,NULL,'2023-03-04 11:44:50',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(104,NULL,'2023-03-04 11:44:50',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(105,NULL,'2023-03-04 11:44:50',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(106,NULL,'2023-03-04 11:44:50',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(107,NULL,'2023-03-04 11:44:50',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(108,NULL,'2023-03-04 11:44:50',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(109,NULL,'2023-03-04 11:44:50',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(110,NULL,'2023-03-04 11:44:50',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(111,NULL,'2023-03-04 11:44:50',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(112,NULL,'2023-03-04 11:44:50',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(113,NULL,'2023-03-04 11:44:50',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(114,NULL,'2023-03-04 11:44:50',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(115,NULL,'2023-03-04 11:44:50',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(116,NULL,'2023-03-04 11:44:50',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(117,NULL,'2023-03-04 11:44:50',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(118,NULL,'2023-03-04 11:44:50',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(119,NULL,'2023-03-04 11:44:50',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(120,NULL,'2023-03-04 11:44:50',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(121,NULL,'2023-03-04 11:44:50',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(122,NULL,'2023-03-04 11:44:50',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(123,NULL,'2023-03-04 11:44:50',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(124,NULL,'2023-03-04 11:44:50',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(125,NULL,'2023-03-04 11:44:50',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(126,NULL,'2023-03-04 11:44:50',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(127,NULL,'2023-03-04 11:44:50',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(128,NULL,'2023-03-04 11:44:50',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(129,NULL,'2023-03-04 11:44:50',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(130,NULL,'2023-03-04 11:44:50',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(131,NULL,'2023-03-04 11:44:50',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(132,NULL,'2023-03-04 11:44:50',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(133,NULL,'2023-03-04 11:44:50',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(134,NULL,'2023-03-04 11:44:50',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(135,NULL,'2023-03-04 11:44:50',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(136,NULL,'2023-03-04 11:44:50',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(137,NULL,'2023-03-04 11:44:50',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(138,NULL,'2023-03-04 11:44:50',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(139,NULL,'2023-03-04 11:44:50',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(140,NULL,'2023-03-04 11:44:50',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(141,NULL,'2023-03-04 11:44:50',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(142,NULL,'2023-03-04 11:44:50',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(143,NULL,'2023-03-04 11:44:50',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(144,NULL,'2023-03-04 11:44:50',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/03/2023\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(145,1,'2023-03-04 11:44:50',1,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(146,1,'2023-03-04 11:44:50',1,2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(147,1,'2023-03-04 11:44:50',1,3,1,'{\"ID\":\"1\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(148,1,'2023-03-04 11:44:50',1,3,2,'{\"ID\":\"2\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(149,1,'2023-03-04 11:44:50',1,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(150,1,'2023-03-04 11:44:50',1,3,4,'{\"ID\":\"4\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"BA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(151,1,'2023-03-04 11:44:50',1,3,5,'{\"ID\":\"5\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AL\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(152,1,'2023-03-04 11:44:50',1,3,6,'{\"ID\":\"6\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"CE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(153,1,'2023-03-04 11:44:50',1,3,7,'{\"ID\":\"7\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"DF\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(154,1,'2023-03-04 11:44:50',1,3,8,'{\"ID\":\"8\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"ES\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(155,1,'2023-03-04 11:44:50',1,3,9,'{\"ID\":\"9\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"GO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(156,1,'2023-03-04 11:44:50',1,3,10,'{\"ID\":\"10\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(157,1,'2023-03-04 11:44:50',1,3,11,'{\"ID\":\"11\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(158,1,'2023-03-04 11:44:50',1,3,12,'{\"ID\":\"12\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(159,1,'2023-03-04 11:44:51',1,3,13,'{\"ID\":\"13\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MT\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(160,1,'2023-03-04 11:44:51',1,3,14,'{\"ID\":\"14\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(161,1,'2023-03-04 11:44:51',1,3,15,'{\"ID\":\"15\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PB\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(162,1,'2023-03-04 11:44:51',1,3,16,'{\"ID\":\"16\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(163,1,'2023-03-04 11:44:51',1,3,17,'{\"ID\":\"17\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PI\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(164,1,'2023-03-04 11:44:51',1,3,18,'{\"ID\":\"18\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(165,1,'2023-03-04 11:44:51',1,3,19,'{\"ID\":\"19\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RJ\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(166,1,'2023-03-04 11:44:51',1,3,20,'{\"ID\":\"20\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RN\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(167,1,'2023-03-04 11:44:51',1,3,21,'{\"ID\":\"21\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(168,1,'2023-03-04 11:44:51',1,3,22,'{\"ID\":\"22\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(169,1,'2023-03-04 11:44:51',1,3,23,'{\"ID\":\"23\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(170,1,'2023-03-04 11:44:51',1,3,24,'{\"ID\":\"24\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(171,1,'2023-03-04 11:44:51',1,3,25,'{\"ID\":\"25\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(172,1,'2023-03-04 11:44:51',1,3,26,'{\"ID\":\"26\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(173,1,'2023-03-04 11:44:51',1,3,27,'{\"ID\":\"27\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"TO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(174,1,'2023-03-04 11:44:51',1,3,28,'{\"ID\":\"28\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":2,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"98\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(175,1,'2023-03-04 11:44:51',1,3,29,'{\"ID\":\"29\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":3,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"71\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(176,1,'2023-03-04 11:44:51',1,3,30,'{\"ID\":\"30\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(177,1,'2023-03-04 11:44:51',1,3,31,'{\"ID\":\"31\",\"Nome\":\"Isentos\",\"[identificacao]\":\"Isentos\",\"Operação\":1,\"UF\":\"\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Isenta de ISS\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"Isenção\",\"Natureza da Operação do serviço\":\"Sem Dedução\",\"Alíquota ISS\":\"1,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":60,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\"}'),(178,NULL,'2023-03-04 11:44:51',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"104\",\"Operação padrão\":\"1\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(179,1,'2023-03-04 11:44:53',1,20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(180,1,'2023-03-04 11:44:53',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Benedito\",\"[identificacao]\":\"Av. Benedito\",\"Número\":\"S\",\"Bairro\":\"Mangabeiras\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(181,1,'2023-03-04 11:44:54',1,9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(182,1,'2023-03-04 11:44:54',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(037) 2594-1157\",\"[identificacao]\":\"(037) 2594-1157\",\"Observação\":\"\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(183,1,'2023-03-04 11:44:54',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"555\",\"Bairro\":\"Centro\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(184,1,'2023-03-04 11:44:56',1,27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(185,1,'2023-03-04 11:44:56',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(186,1,'2023-03-04 11:44:56',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(187,1,'2023-03-04 11:44:57',1,33,1,'{\"ID\":\"1\",\"Ano de fabricação\":\"2011\",\"Ano do modelo\":\"2012\",\"Tipo de combustível\":\"Gasolina\",\"Placa\":\"ABC0153\",\"[identificacao]\":\"ABC0153\",\"Descrição\":\"Carro da empresa\",\"Marca\":\"Volkswagen\",\"Modelo\":\"Gol G5 1.0\",\"Cor\":\"Prata\",\"Renavam\":\"00535581587335\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(188,1,'2023-03-04 11:44:57',1,33,2,'{\"ID\":\"2\",\"Ano de fabricação\":\"2015\",\"Ano do modelo\":\"2016\",\"Tipo de combustível\":\"Alcool\",\"Placa\":\"QWE8237\",\"[identificacao]\":\"QWE8237\",\"Descrição\":\"Carro de passeio\",\"Marca\":\"Fiat\",\"Modelo\":\"Palho 1.0\",\"Cor\":\"Branco\",\"Renavam\":\"8234729840373\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(189,1,'2023-03-04 11:44:57',3,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(190,1,'2023-03-04 11:44:57',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(191,1,'2023-03-04 11:44:57',3,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(192,1,'2023-03-04 11:44:57',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Av. Chedid Jafet\",\"[identificacao]\":\"Av. Chedid Jafet\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(193,1,'2023-03-04 11:44:58',1,32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(194,1,'2023-03-04 11:44:58',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(195,1,'2023-03-04 11:44:58',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(196,1,'2023-03-04 11:44:58',1,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(197,1,'2023-03-04 11:44:58',2,32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(198,1,'2023-03-04 11:44:58',3,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(199,1,'2023-03-04 11:44:58',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(200,1,'2023-03-04 11:44:58',3,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(201,1,'2023-03-04 11:44:58',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(202,1,'2023-03-04 11:44:58',3,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(203,1,'2023-03-04 11:44:58',1,76,2,'{\"ID\":\"2\",\"Mês\":\"Setembro/2019\",\"[identificacao]\":\"Setembro/2019\",\"Valor\":\"8290,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(204,1,'2023-03-04 11:44:59',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Geral\",\"[identificacao]\":\"Geral\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(205,1,'2023-03-04 11:44:59',1,2,3,'{\"ID\":\"3\",\"Nome\":\"Produtos Tributados\",\"[identificacao]\":\"Produtos Tributados\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(206,1,'2023-03-04 11:44:59',1,2,4,'{\"ID\":\"4\",\"Nome\":\"Serviços Tributados\",\"[identificacao]\":\"Serviços Tributados\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(207,1,'2023-03-04 11:44:59',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UN\",\"[identificacao]\":\"UN\",\"Nome\":\"Unidade\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(208,1,'2023-03-04 11:45:03',1,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(209,1,'2023-03-04 11:45:03',1,14,1,'{\"ID\":\"1\",\"Grade\":\"GRD 2\",\"[identificacao]\":\"GRD 2\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(210,1,'2023-03-04 11:45:03',1,12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(211,1,'2023-03-04 11:45:03',1,13,1,'{\"ID\":\"1\",\"Lote\":\"LT 1\",\"[identificacao]\":\"LT 1\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(212,1,'2023-03-04 11:45:03',1,13,2,'{\"ID\":\"2\",\"Lote\":\"LT354RA48\",\"[identificacao]\":\"LT354RA48\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(213,1,'2023-03-04 11:45:03',1,12,3,'{\"ID\":\"3\",\"Nome\":\"Macarrão Sta Amália\",\"[identificacao]\":\"Macarrão Sta Amália\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(214,1,'2023-03-04 11:45:03',1,12,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Tipo\":\"Serviços\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(215,1,'2023-03-04 11:45:03',1,12,5,'{\"ID\":\"5\",\"Nome\":\"Coca-Cola 2L\",\"[identificacao]\":\"Coca-Cola 2L\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(216,1,'2023-03-04 11:45:03',1,12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(217,1,'2023-03-04 11:45:03',1,14,2,'{\"ID\":\"2\",\"Grade\":\"Grade teste\",\"[identificacao]\":\"Grade teste\",\"Códigos de barras\":\"\",\"Ativo\":\"Não\"}',12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(218,1,'2023-03-04 11:45:03',1,12,7,'{\"ID\":\"7\",\"Nome\":\"Feijão Carioca\",\"[identificacao]\":\"Feijão Carioca\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7896422505390\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(219,1,'2023-03-04 11:45:03',2,12,3,'{\"ID\":\"3\",\"Nome\":\"Fósforo\",\"[identificacao]\":\"Fósforo\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(220,1,'2023-03-04 11:45:04',2,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(221,1,'2023-03-04 11:45:04',2,14,1,'{\"ID\":\"1\",\"Grade\":\"P\",\"[identificacao]\":\"P\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(222,1,'2023-03-04 11:45:04',1,14,3,'{\"ID\":\"3\",\"Grade\":\"M\",\"[identificacao]\":\"M\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(223,1,'2023-03-04 11:45:06',1,42,1,'{\"ID\":\"1\",\"Nome\":\"Departamento Desenvolvimento - Orçamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(224,1,'2023-03-04 11:45:06',1,42,2,'{\"ID\":\"2\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(225,1,'2023-03-04 11:45:06',1,42,3,'{\"ID\":\"3\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(226,1,'2023-03-04 11:45:06',1,42,4,'{\"ID\":\"4\",\"Nome\":\"Departamento Administrativo - Faturamento\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(227,1,'2023-03-04 11:45:06',1,42,5,'{\"ID\":\"5\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(228,1,'2023-03-04 11:45:09',1,8,225,'{\"ID\":\"225\",\"Código\":\"6.1.01.001\",\"Nome\":\"Contas a receber\",\"[identificacao]\":\"Contas a receber\",\"Grupo\":38,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(229,1,'2023-03-04 11:45:09',1,8,226,'{\"ID\":\"226\",\"Código\":\"2.1.01.006\",\"Nome\":\"Devolução de compra à prazo\",\"[identificacao]\":\"Devolução de compra à prazo\",\"Grupo\":22,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(230,1,'2023-03-04 11:45:10',1,7,2,'{\"ID\":\"2\",\"Nome\":\"Caixa\",\"[identificacao]\":\"Caixa\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/03/2023 11:45:10\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(231,1,'2023-03-04 11:45:11',1,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias\",\"[identificacao]\":\"Compra de Mercadorias\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(232,1,'2023-03-04 11:45:11',1,1,7,'{\"ID\":\"7\",\"Nome\":\"Prestação de Serviço\",\"[identificacao]\":\"Prestação de Serviço\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(233,1,'2023-03-04 11:45:11',1,1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(234,1,'2023-03-04 11:45:11',1,8,93,'{\"ID\":93,\"Tipo\":\"Venda de produtos a vista\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(235,1,'2023-03-04 11:45:11',1,8,94,'{\"ID\":94,\"Tipo\":\"Venda de produtos a prazo\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(236,1,'2023-03-04 11:45:11',1,1,9,'{\"ID\":\"9\",\"Nome\":\"NFe de entrada\",\"[identificacao]\":\"NFe de entrada\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(237,1,'2023-03-04 11:45:11',1,1,10,'{\"ID\":\"10\",\"Nome\":\"NFe de saída\",\"[identificacao]\":\"NFe de saída\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(238,1,'2023-03-04 11:45:12',1,3,32,'{\"ID\":\"32\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(239,1,'2023-03-04 11:45:12',1,3,33,'{\"ID\":\"33\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(240,1,'2023-03-04 11:45:12',1,3,34,'{\"ID\":\"34\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(241,1,'2023-03-04 11:45:12',1,3,35,'{\"ID\":\"35\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":9,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(242,1,'2023-03-04 11:45:12',1,3,36,'{\"ID\":\"36\",\"Nome\":\"NFe de Saída\",\"[identificacao]\":\"NFe de Saída\",\"Operação\":10,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(243,1,'2023-03-04 11:45:12',1,3,37,'{\"ID\":\"37\",\"Nome\":\"Prestação de Serviço Tributada\",\"[identificacao]\":\"Prestação de Serviço Tributada\",\"Operação\":7,\"UF\":\"\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Tributável dentro do município\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"3,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"01\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\"}'),(244,1,'2023-03-04 11:45:13',1,8,119,'{\"ID\":119,\"Tipo\":\"Compra de produtos a vista\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(245,1,'2023-03-04 11:45:13',1,8,120,'{\"ID\":120,\"Tipo\":\"Compra de produtos a prazo\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(246,1,'2023-03-04 11:45:13',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(247,1,'2023-03-04 11:45:14',1,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro 1\",\"[identificacao]\":\"Dinheiro 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(248,1,'2023-03-04 11:45:14',2,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro\",\"[identificacao]\":\"Dinheiro\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(249,1,'2023-03-04 11:45:14',1,22,8,'{\"ID\":\"8\",\"Nome\":\"Outros\",\"[identificacao]\":\"Outros\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Outros\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(250,1,'2023-03-04 11:45:15',1,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque 1\",\"[identificacao]\":\"Cheque 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(251,1,'2023-03-04 11:45:15',2,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque\",\"[identificacao]\":\"Cheque\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(252,1,'2023-03-04 11:45:15',1,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão 1\",\"[identificacao]\":\"Cartão 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(253,1,'2023-03-04 11:45:15',2,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão\",\"[identificacao]\":\"Cartão\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(254,1,'2023-03-04 11:45:15',1,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário 1\",\"[identificacao]\":\"Crediário 1\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(255,1,'2023-03-04 11:45:15',2,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário\",\"[identificacao]\":\"Crediário\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(256,1,'2023-03-04 11:45:15',1,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX 1\",\"[identificacao]\":\"PIX 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(257,1,'2023-03-04 11:45:15',2,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX\",\"[identificacao]\":\"PIX\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(258,1,'2023-03-04 11:45:30',1,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"555\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:45:29\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(259,1,'2023-03-04 11:45:31',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:45:30\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(260,1,'2023-03-04 11:45:31',1,112,2,'{\"ID\":\"2\",\"Série\":\"1\",\"Número\":\"4123\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:45:31\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(261,1,'2023-03-04 11:45:31',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:45:30\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(262,1,'2023-03-04 11:45:43',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(263,1,'2023-03-04 11:45:44',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(264,1,'2023-03-04 11:45:45',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(265,1,'2023-03-04 11:45:46',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(266,1,'2023-03-04 11:45:49',1,35,1,'{\"ID\":\"1\",\"Conta\":1,\"Data pagamento\":\"04/03/2023 11:45:48\",\"Valor\":\"200,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"200,00\",\"[identificacao]\":\"200,00\",\"EmpresaEspecificaId\":3}',0,0,''),(267,1,'2023-03-04 11:45:50',1,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista 2\",\"[identificacao]\":\"À vista 2\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(268,1,'2023-03-04 11:45:50',2,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista\",\"[identificacao]\":\"À vista\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(269,1,'2023-03-04 11:45:50',1,23,6,'{\"ID\":\"6\",\"Nome\":\"À prazo 30/60/90\",\"[identificacao]\":\"À prazo 30/60/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"30 / 60 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(270,1,'2023-03-04 11:45:50',1,23,7,'{\"ID\":\"7\",\"Nome\":\"À prazo 20 dias\",\"[identificacao]\":\"À prazo 20 dias\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Vencimento no próximo dia ...\",\"Vencimento\":\"20\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(271,1,'2023-03-04 11:45:50',1,23,8,'{\"ID\":\"8\",\"Nome\":\"À prazo Entrada/30/45/60/75/90\",\"[identificacao]\":\"À prazo Entrada/30/45/60/75/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"0 / 30 / 45 / 60 / 75 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(272,1,'2023-03-04 11:45:50',1,23,9,'{\"ID\":\"9\",\"Nome\":\"Vencimento dia 10 do próximo mês\",\"[identificacao]\":\"Vencimento dia 10 do próximo mês\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Vencimento no dia ... do próximo mês\",\"Vencimento\":\"10\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(273,1,'2023-03-04 11:46:31',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"104\",\"Operação padrão\":\"1\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(274,1,'2023-03-04 11:46:54',1,8,227,'{\"ID\":\"227\",\"Código\":\"1.1.01.011\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Grupo\":1,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(275,1,'2023-03-04 11:46:54',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,227,'{\"ID\":\"227\",\"Código\":\"1.1.01.011\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Grupo\":1,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(276,1,'2023-03-04 11:46:54',1,8,228,'{\"ID\":\"228\",\"Código\":\"1.1.01.012\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Grupo\":2,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(277,1,'2023-03-04 11:46:54',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,228,'{\"ID\":\"228\",\"Código\":\"1.1.01.012\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Grupo\":2,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(278,1,'2023-03-04 11:46:54',1,8,229,'{\"ID\":\"229\",\"Código\":\"1.1.01.013\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Grupo\":5,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(279,1,'2023-03-04 11:46:54',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,229,'{\"ID\":\"229\",\"Código\":\"1.1.01.013\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Grupo\":5,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(280,1,'2023-03-04 11:46:54',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"104\",\"Operação padrão\":\"1\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"8\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(281,1,'2023-03-04 11:47:00',1,108,23,'{\"ID\":\"23\",\"Tipo de movimento\":\"Perdas\",\"[identificacao]\":\"Perdas\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"04/03/2023\",\"Quantidade\":\"15,00\",\"Observação\":\"Vencimento do produto\",\"EmpresaEspecificaId\":3}',0,0,''),(282,1,'2023-03-04 11:47:00',1,108,24,'{\"ID\":\"24\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"04/03/2023\",\"Quantidade\":\"25,00\",\"Observação\":\"Recontagem de estoqueo\",\"EmpresaEspecificaId\":3}',0,0,''),(283,1,'2023-03-04 11:47:00',1,108,25,'{\"ID\":\"25\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"12/02/2023\",\"Quantidade\":\"58,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(284,1,'2023-03-04 11:47:00',1,108,26,'{\"ID\":\"26\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Fósforo\",\"Grade\":\"\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"12/02/2023\",\"Quantidade\":\"40,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(285,1,'2023-03-04 11:47:04',1,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"04/03/2023 11:47:03\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(286,1,'2023-03-04 11:47:06',2,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"04/03/2023 11:47:04\",\"Data de saída\":\"04/03/2023 11:47:05\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(287,1,'2023-03-04 11:47:09',1,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"04/03/2023 11:47:08\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(288,1,'2023-03-04 11:47:11',2,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"04/03/2023 11:47:09\",\"Data de saída\":\"04/03/2023 11:47:10\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(289,1,'2023-03-04 11:47:14',1,24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(290,1,'2023-03-04 11:47:14',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(291,1,'2023-03-04 11:47:14',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(292,1,'2023-03-04 11:47:14',1,112,13,'{\"ID\":\"13\",\"Série\":\"1\",\"Número\":\"21\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:47:14\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(293,1,'2023-03-04 11:47:22',1,32,7,'{\"Comissão\":\"0,00\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/03/2003\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(294,NULL,'2023-03-04 11:47:23',1,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"98,00\",\"Preço médio de custo\":\"34,34\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(295,NULL,'2023-03-04 11:47:23',1,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(296,NULL,'2023-03-04 11:47:23',1,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,0001\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(297,NULL,'2023-03-04 11:47:23',1,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(298,NULL,'2023-03-04 11:47:23',1,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(299,NULL,'2023-03-04 11:47:23',1,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(300,1,'2023-03-04 11:47:23',3,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(301,1,'2023-03-04 11:47:23',1,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"5,00\",\"Preço médio de custo\":\"10,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(302,1,'2023-03-04 11:47:23',2,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(303,1,'2023-03-04 11:47:24',3,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"98,00\",\"Preço médio de custo\":\"34,34\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(304,1,'2023-03-04 11:47:24',3,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(305,1,'2023-03-04 11:47:24',3,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(306,1,'2023-03-04 11:47:24',3,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(307,1,'2023-03-04 11:47:24',3,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,0001\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(308,1,'2023-03-04 11:47:24',3,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(309,1,'2023-03-04 11:47:24',1,114,8,'{\"ID\":\"8\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"58,00\",\"Preço médio de custo\":\"34,34\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(310,1,'2023-03-04 11:47:24',1,114,9,'{\"ID\":\"9\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(311,1,'2023-03-04 11:47:24',1,114,10,'{\"ID\":\"10\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"40,00\",\"Preço médio de custo\":\"2,0001\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(312,1,'2023-03-04 11:47:24',1,114,11,'{\"ID\":\"11\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(313,1,'2023-03-04 11:47:24',1,114,12,'{\"ID\":\"12\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(314,1,'2023-03-04 11:47:24',1,114,13,'{\"ID\":\"13\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202302,'{\"ID\":\"202302\",\"Competência\":\"Fevereiro/2023\",\"[identificacao]\":\"Fevereiro/2023\",\"EmpresaEspecificaId\":3}'),(315,1,'2023-03-04 11:47:24',1,112,14,'{\"ID\":\"14\",\"Série\":\"1\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":10,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:47:23\",\"Destinatário\":3,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(316,1,'2023-03-04 11:47:31',1,1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(317,1,'2023-03-04 11:47:31',1,8,99,'{\"ID\":99,\"Tipo\":\"Devolução de venda de produtos a vista\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(318,1,'2023-03-04 11:47:31',1,8,100,'{\"ID\":100,\"Tipo\":\"Devolução de venda de produtos a prazo\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(319,1,'2023-03-04 11:47:34',1,9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(320,1,'2023-03-04 11:47:34',1,16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"04/03/2023 11:47:34\",\"Vencimento\":\"04/04/2023 11:47:34\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(321,1,'2023-03-04 11:47:34',1,8,141,'{\"ID\":141}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"04/03/2023 11:47:34\",\"Vencimento\":\"04/04/2023 11:47:34\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(322,1,'2023-03-04 11:47:34',1,16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"04/03/2023 11:47:34\",\"Vencimento\":\"04/04/2023 11:47:34\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(323,1,'2023-03-04 11:47:34',1,8,141,'{\"ID\":141}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":0,\"Emissão\":\"04/03/2023 11:47:34\",\"Vencimento\":\"04/04/2023 11:47:34\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(324,1,'2023-03-04 11:47:50',1,27,9,'{\"ID\":\"9\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(325,1,'2023-03-04 11:47:51',2,27,1,'{\"ID\":\"1\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(326,1,'2023-03-04 11:47:52',1,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(327,1,'2023-03-04 11:47:53',2,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(328,1,'2023-03-04 11:47:53',2,29,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Grupo\":1,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"80,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(329,1,'2023-03-04 11:47:53',1,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":119,\"Data início\":\"04/03/2022 11:47:52\",\"Data término\":\"04/03/2025 11:47:52\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IPCA\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(330,1,'2023-03-04 11:47:54',2,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":119,\"Data início\":\"04/03/2022\",\"Data término\":\"04/03/2025\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IPCA\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(331,1,'2023-03-04 11:47:54',1,37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"04/03/2023 11:47:54\",\"Vencimento\":\"09/03/2023 11:47:54\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(332,1,'2023-03-04 11:47:54',1,8,225,'{\"ID\":225}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"04/03/2023 11:47:54\",\"Vencimento\":\"09/03/2023 11:47:54\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(333,1,'2023-03-04 11:57:49',1,112,15,'{\"ID\":\"15\",\"Série\":\"1\",\"Número\":\"579\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e de ajuste\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"05/03/2023 11:57:48\",\"Destinatário\":2,\"Modalidade do frete\":\"Contratação do Frete por conta do Remetente\",\"Transportador\":0,\"Pagamento\":\"0\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(334,1,'2023-03-04 11:57:51',1,112,16,'{\"ID\":\"16\",\"Série\":\"1\",\"Número\":\"8385\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"04/03/2023 11:57:50\",\"Data e hora de saída\":\"04/03/2023 11:57:50\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(335,1,'2023-03-04 11:57:51',1,112,17,'{\"ID\":\"17\",\"Série\":\"1\",\"Número\":\"1625\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"04/03/2023 11:57:51\",\"Data e hora de saída\":\"04/03/2023 11:57:51\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(336,1,'2023-03-04 11:57:52',1,112,18,'{\"ID\":\"18\",\"Série\":\"1\",\"Número\":\"4100\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"04/03/2023 11:57:51\",\"Data e hora de saída\":\"04/03/2023 11:57:51\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(337,1,'2023-03-04 11:57:52',2,112,18,'{\"ID\":\"18\",\"Série\":\"1\",\"Número\":\"4100\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"04/03/2023 11:57:52\",\"Data e hora de saída\":\"04/03/2023 11:57:52\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(338,1,'2023-03-04 11:57:53',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(339,1,'2023-03-04 11:58:04',1,8,230,'{\"ID\":\"230\",\"Código\":\"5.1.01.001\",\"Nome\":\"(Teste Empréstimo) - Tomada empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Tomada empréstimo\",\"Grupo\":35,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(340,1,'2023-03-04 11:58:04',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,230,'{\"ID\":\"230\",\"Código\":\"5.1.01.001\",\"Nome\":\"(Teste Empréstimo) - Tomada empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Tomada empréstimo\",\"Grupo\":35,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(341,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":\"231\",\"Código\":\"5.1.02.001\",\"Nome\":\"(Teste Empréstimo) - Pagamento empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Pagamento empréstimo\",\"Grupo\":36,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(342,1,'2023-03-04 11:58:04',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,231,'{\"ID\":\"231\",\"Código\":\"5.1.02.001\",\"Nome\":\"(Teste Empréstimo) - Pagamento empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Pagamento empréstimo\",\"Grupo\":36,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(343,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":\"232\",\"Código\":\"5.1.03.001\",\"Nome\":\"(Teste Empréstimo) - Pagamento juros empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Pagamento juros empréstimo\",\"Grupo\":37,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":3}',0,0,''),(344,1,'2023-03-04 11:58:04',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,232,'{\"ID\":\"232\",\"Código\":\"5.1.03.001\",\"Nome\":\"(Teste Empréstimo) - Pagamento juros empréstimo\",\"[identificacao]\":\"(Teste Empréstimo) - Pagamento juros empréstimo\",\"Grupo\":37,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\"}'),(345,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":231}',16,9,'{\"ID\":\"9\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000009\",\"[identificacao]\":\"0000000009\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/03/2023 11:58:04\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(346,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":232}',16,9,'{\"ID\":\"9\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000009\",\"[identificacao]\":\"0000000009\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/03/2023 11:58:04\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(347,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":231}',16,10,'{\"ID\":\"10\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000010\",\"[identificacao]\":\"0000000010\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/04/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(348,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":232}',16,10,'{\"ID\":\"10\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000010\",\"[identificacao]\":\"0000000010\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/04/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(349,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":231}',16,11,'{\"ID\":\"11\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000011\",\"[identificacao]\":\"0000000011\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/05/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(350,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":232}',16,11,'{\"ID\":\"11\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000011\",\"[identificacao]\":\"0000000011\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/05/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(351,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":231}',16,12,'{\"ID\":\"12\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000012\",\"[identificacao]\":\"0000000012\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/06/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(352,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":232}',16,12,'{\"ID\":\"12\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000012\",\"[identificacao]\":\"0000000012\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/06/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(353,1,'2023-03-04 11:58:04',1,8,231,'{\"ID\":231}',16,13,'{\"ID\":\"13\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000013\",\"[identificacao]\":\"0000000013\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/07/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(354,1,'2023-03-04 11:58:04',1,8,232,'{\"ID\":232}',16,13,'{\"ID\":\"13\",\"Fornecedor\":3,\"Conta\":2,\"Documento\":\"0000000013\",\"[identificacao]\":\"0000000013\",\"Emprestimo\":1,\"Emissão\":\"04/03/2023 11:58:04\",\"Vencimento\":\"05/07/2023\",\"Pagamento\":\"\",\"Valor\":\"22,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"22,00\",\"Valor em aberto\":\"22,00\",\"Realizado\":\"Não\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(355,1,'2023-03-04 11:58:04',1,133,1,'{\"Conta\":2,\"ID\":\"1\",\"Fornecedor\":3,\"EmpresaEspecificaId\":3}',0,0,''),(356,1,'2023-03-04 11:58:04',3,133,1,'{\"Conta\":2,\"ID\":\"1\",\"Fornecedor\":3,\"EmpresaEspecificaId\":3}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,3),(2,3),(3,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(122,3),(123,3),(124,3),(125,3),(126,3),(127,3),(128,3),(129,3),(130,3),(131,3),(132,3),(133,3),(134,3),(135,3),(136,3),(137,3),(138,3),(139,3),(140,3),(141,3),(142,3),(143,3),(144,3),(145,3),(146,3),(147,3),(148,3),(149,3),(150,3),(151,3),(152,3),(153,3),(154,3),(155,3),(156,3),(157,3),(158,3),(159,3),(160,3),(161,3),(162,3),(163,3),(164,3),(165,3),(166,3),(167,3),(168,3),(169,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,3),(178,3),(179,3),(180,3),(181,3),(182,3),(183,3),(184,3),(185,3),(186,3),(187,3),(188,3),(189,3),(190,3),(191,3),(192,3),(193,3),(194,3),(195,3),(196,3),(197,3),(198,3),(199,3),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(228,3),(229,3),(230,3),(231,3),(232,3),(233,3),(234,3),(235,3),(236,3),(237,3),(238,3),(239,3),(240,3),(241,3),(242,3),(243,3),(244,3),(245,3),(246,3),(247,3),(248,3),(249,3),(250,3),(251,3),(252,3),(253,3),(254,3),(255,3),(256,3),(257,3),(258,3),(259,3),(260,3),(261,3),(262,3),(263,3),(264,3),(265,3),(266,3),(267,3),(268,3),(269,3),(270,3),(271,3),(272,3),(273,3),(274,3),(275,3),(276,3),(277,3),(278,3),(279,3),(280,3),(281,3),(282,3),(283,3),(284,3),(285,3),(286,3),(287,3),(288,3),(289,3),(290,3),(291,3),(292,3),(293,3),(294,3),(295,3),(296,3),(297,3),(298,3),(299,3),(300,3),(301,3),(302,3),(303,3),(304,3),(305,3),(306,3),(307,3),(308,3),(309,3),(310,3),(311,3),(312,3),(313,3),(314,3),(315,3),(316,3),(317,3),(318,3),(319,3),(320,3),(321,3),(322,3),(323,3),(324,3),(325,3),(326,3),(327,3),(328,3),(329,3),(330,3),(331,3),(332,3),(333,3),(334,3),(335,3),(336,3),(337,3),(338,3),(339,3),(340,3),(341,3),(342,3),(343,3),(344,3),(345,3),(346,3),(347,3),(348,3),(349,3),(350,3),(351,3),(352,3),(353,3),(354,3),(355,3),(356,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2023-03-04 11:45:42','2023-03-04 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,1),(2,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2023-03-04 11:45:42','2023-03-04 00:00:00',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(3,3,1,NULL,'Conclusão da compra 19985761 do fornecedor Femsa LTDA','2023-03-04 11:45:43','2023-03-04 00:00:00',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(4,3,1,NULL,'Conclusão da compra 19985762 do fornecedor Femsa LTDA','2023-03-04 11:45:44','2023-03-04 00:00:00',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(5,3,1,NULL,'Conclusão da compra 19985763 do fornecedor Femsa LTDA','2023-03-04 11:45:44','2023-03-04 00:00:00',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(6,3,1,NULL,'Conclusão da compra 19985764 do fornecedor Femsa LTDA','2023-03-04 11:45:45','2023-03-04 00:00:00',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(7,3,1,NULL,'Conclusão da compra 129581 do fornecedor Femsa LTDA','2023-03-04 11:45:45','2023-03-04 00:00:00',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(8,3,1,NULL,'Conclusão da compra 129582 do fornecedor Femsa LTDA','2023-03-04 11:45:46','2023-03-04 00:00:00',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(9,3,1,NULL,'Conclusão da compra 129583 do fornecedor Femsa LTDA','2023-03-04 11:45:46','2023-03-04 00:00:00',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(10,3,1,NULL,'Conclusão da compra 129584 do fornecedor Femsa LTDA','2023-03-04 11:45:47','2023-03-04 00:00:00',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(11,3,1,NULL,'Conclusão da compra 129585 do fornecedor Femsa LTDA','2023-03-04 11:45:47','2023-03-04 00:00:00',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,'D',0,1),(12,3,1,NULL,'Conclusão da compra 129586 do fornecedor Femsa LTDA','2023-03-04 11:45:47','2023-03-04 00:00:00',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',0,1),(13,3,1,NULL,'Conclusão da compra 129587 do fornecedor Femsa LTDA','2023-03-04 11:45:48','2023-03-04 00:00:00',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,1),(14,3,1,NULL,'Conclusão da compra 13250 do fornecedor Femsa LTDA','2023-03-04 11:45:48','2023-03-04 00:00:00',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,0),(15,3,1,NULL,'Pagamento: 10 - Femsa LTDA','2023-03-04 11:45:49','2023-03-04 11:45:49',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(16,3,2,NULL,'Conclusão da venda 11 para consumidor final','2023-03-04 11:47:03','2023-03-04 11:47:03',NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105.00,'C',0,0),(17,3,2,NULL,'Conclusão da venda 12  para o cliente Jeff Bezos','2023-03-04 11:47:03','2023-03-04 11:47:03',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200000.01,'C',0,0),(18,3,2,NULL,'Conclusão da venda 13 para consumidor final','2023-03-04 11:47:03','2023-03-04 11:47:03',NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(19,3,2,NULL,'Conclusão da venda 14 para consumidor final','2023-03-04 11:47:04','2023-03-04 11:47:04',NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.01,'C',0,0),(20,3,2,NULL,'Conclusão da venda 16  para o cliente Jeff Bezos','2023-03-04 11:47:13','2023-03-04 11:47:13',NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135.44,'C',0,0),(21,3,2,NULL,'Conclusão da venda 17 para consumidor final','2023-03-04 11:47:13','2023-03-04 11:47:13',NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',0,0),(22,3,2,NULL,'Conclusão da venda 18 para consumidor final','2023-03-04 11:47:13','2023-03-04 11:47:13',NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',0,0),(23,3,2,NULL,'Devolução da venda 11 para consumidor final','2023-03-04 11:47:32','2023-03-04 11:47:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,10.50,'D',0,0),(24,3,1,NULL,'Devolução da compra 129583 do fornecedor ','2023-03-04 11:47:33','2023-03-04 11:47:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,500.00,'C',0,0),(25,3,7,1,'Sangria','2023-03-04 11:56:47','2023-03-04 11:56:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.00,'D',0,0),(26,3,7,1,'Suprimento','2023-03-04 11:56:47','2023-03-04 11:56:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8.00,'C',0,0),(27,3,2,NULL,'Conclusão da venda 19 para consumidor final','2023-03-04 11:57:51','2021-01-01 00:00:00',NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',0,0),(28,3,2,NULL,'Conclusão da venda 20  para o cliente Jeff Bezos','2023-03-04 11:57:51','2021-01-01 00:00:00',NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',0,0),(29,3,1,NULL,'Conclusão da compra 19985763 do fornecedor Femsa LTDA','2023-03-04 11:57:53','2023-03-04 00:00:00',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1008.00,'D',0,0),(30,3,2,NULL,'Tomada do empréstimo: 1','2023-03-04 11:58:04','2023-03-04 11:58:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,100.00,'C',0,1),(31,3,2,NULL,'Despesas do empréstimo: 1','2023-03-04 11:58:04','2023-03-04 11:58:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5.00,'D',0,1);
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
INSERT INTO `movimento_categoria` VALUES (1,119,NULL,'',300.00),(2,120,NULL,'',100.00),(5,119,NULL,'',500.00),(6,119,NULL,'',500.00),(9,120,NULL,'',500.00),(10,120,NULL,'',700.00),(11,119,NULL,'',70.00),(12,119,NULL,'',80.00),(13,119,NULL,'',90.00),(14,119,NULL,'',90.00),(15,121,NULL,'',200.00),(16,93,NULL,'',105.00),(17,93,NULL,'',200000.01),(18,93,NULL,'',30.00),(19,93,NULL,'',3000.01),(20,94,NULL,'',135.44),(21,93,NULL,'',10.00),(22,93,NULL,'',15.00),(23,99,NULL,'',10.50),(24,123,NULL,'',500.00),(27,93,NULL,'',6.30),(28,94,NULL,'',6.30),(30,230,NULL,'',100.00),(31,161,NULL,'',5.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,119,4,300.00,2,2),(1,119,9,300.00,1,2),(1,119,56,300.00,1,1),(1,119,78,300.00,2,1),(2,120,9,100.00,1,2),(2,120,18,100.00,1,2),(5,119,4,500.00,2,2),(5,119,9,500.00,1,2),(5,119,56,500.00,1,1),(5,119,78,500.00,2,1),(6,119,4,500.00,2,2),(6,119,9,500.00,1,2),(6,119,56,500.00,1,1),(6,119,78,500.00,2,1),(9,120,9,500.00,1,2),(9,120,18,500.00,1,2),(10,120,9,700.00,1,2),(10,120,18,700.00,1,2),(11,119,4,70.00,2,2),(11,119,9,70.00,1,2),(11,119,56,70.00,1,1),(11,119,78,70.00,2,1),(12,119,4,80.00,2,2),(12,119,9,80.00,1,2),(12,119,56,80.00,1,1),(12,119,78,80.00,2,1),(13,119,4,90.00,2,2),(13,119,9,90.00,1,2),(13,119,56,90.00,1,1),(13,119,78,90.00,2,1),(14,119,4,90.00,2,2),(14,119,9,90.00,1,2),(14,119,56,90.00,1,1),(14,119,78,90.00,2,1),(15,121,4,200.00,2,2),(15,121,18,200.00,2,2),(15,121,56,200.00,1,1),(15,121,78,200.00,2,1),(16,93,4,105.00,1,2),(16,93,9,20.00,2,2),(16,93,29,85.00,1,2),(16,93,34,105.00,1,1),(16,93,34,105.00,1,2),(16,93,56,20.00,1,2),(16,93,78,105.00,1,1),(16,93,78,85.00,1,2),(17,93,4,200000.01,1,2),(17,93,9,2.00,2,2),(17,93,29,199998.01,1,2),(17,93,34,200000.01,1,1),(17,93,34,200000.01,1,2),(17,93,56,2.00,1,2),(17,93,78,200000.01,1,1),(17,93,78,199998.01,1,2),(18,93,4,30.00,1,2),(18,93,9,6.00,2,2),(18,93,29,24.00,1,2),(18,93,34,30.00,1,1),(18,93,34,30.00,1,2),(18,93,56,6.00,1,2),(18,93,78,30.00,1,1),(18,93,78,24.00,1,2),(19,93,4,3000.01,1,2),(19,93,9,2.00,2,2),(19,93,29,2998.01,1,2),(19,93,34,3000.01,1,1),(19,93,34,3000.01,1,2),(19,93,56,2.00,1,2),(19,93,78,3000.01,1,1),(19,93,78,2998.01,1,2),(20,94,6,135.44,1,2),(20,94,9,154.00,2,2),(20,94,29,-18.56,1,2),(20,94,34,135.44,1,2),(20,94,56,154.00,1,2),(20,94,78,-18.56,1,2),(21,93,4,10.00,1,2),(21,93,9,9.00,2,2),(21,93,29,1.00,1,2),(21,93,34,10.00,1,1),(21,93,34,10.00,1,2),(21,93,56,9.00,1,2),(21,93,78,10.00,1,1),(21,93,78,1.00,1,2),(22,93,4,15.00,1,2),(22,93,9,27.00,2,2),(22,93,29,-12.00,1,2),(22,93,34,15.00,1,1),(22,93,34,15.00,1,2),(22,93,56,27.00,1,2),(22,93,78,15.00,1,1),(22,93,78,-12.00,1,2),(23,99,4,10.50,2,2),(23,99,9,2.00,1,2),(23,99,29,8.50,2,2),(23,99,38,10.50,2,1),(23,99,38,10.50,2,2),(23,99,56,2.00,2,2),(23,99,78,10.50,2,1),(23,99,78,8.50,2,2),(24,123,9,500.00,2,2),(24,123,18,500.00,2,2),(27,93,4,6.30,1,2),(27,93,9,5.00,2,2),(27,93,29,1.30,1,2),(27,93,34,6.30,1,1),(27,93,34,6.30,1,2),(27,93,56,5.00,1,2),(27,93,78,6.30,1,1),(27,93,78,1.30,1,2),(28,94,6,6.30,1,2),(28,94,9,5.00,2,2),(28,94,29,1.30,1,2),(28,94,34,6.30,1,2),(28,94,56,5.00,1,2),(28,94,78,1.30,1,2),(30,230,4,100.00,1,2),(30,230,19,110.00,1,2),(30,230,20,10.00,2,2),(31,161,4,5.00,2,2),(31,161,29,5.00,2,2),(31,161,65,5.00,1,1),(31,161,65,5.00,1,2),(31,161,78,5.00,2,1),(31,161,78,5.00,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,1,NULL,NULL,NULL,300.00,'D',1),(2,2,1,NULL,NULL,NULL,30.00,'D',0),(3,2,1,NULL,NULL,NULL,70.00,'D',0),(4,3,8,NULL,NULL,NULL,500.00,'D',0),(5,4,1,NULL,NULL,NULL,500.00,'D',1),(6,5,8,NULL,NULL,NULL,500.00,'D',0),(7,6,1,NULL,NULL,NULL,500.00,'D',1),(8,7,1,NULL,NULL,NULL,200.00,'D',0),(9,7,8,NULL,NULL,NULL,300.00,'D',0),(10,8,1,NULL,NULL,NULL,200.00,'D',0),(11,8,8,NULL,NULL,NULL,300.00,'D',0),(12,9,1,NULL,NULL,NULL,200.00,'D',0),(13,9,8,NULL,NULL,NULL,300.00,'D',0),(14,10,1,NULL,NULL,NULL,250.00,'D',0),(15,10,8,NULL,NULL,NULL,450.00,'D',0),(16,11,1,NULL,NULL,NULL,70.00,'D',1),(17,12,1,NULL,NULL,NULL,80.00,'D',1),(18,13,1,NULL,NULL,NULL,90.00,'D',1),(19,14,1,NULL,NULL,NULL,90.00,'D',1),(20,15,1,NULL,NULL,NULL,200.00,'D',1),(21,16,1,NULL,NULL,NULL,105.00,'C',1),(22,17,1,NULL,NULL,NULL,200000.01,'C',1),(23,18,1,NULL,NULL,NULL,30.00,'C',1),(24,19,1,NULL,NULL,NULL,3000.01,'C',1),(25,20,1,NULL,NULL,NULL,30.00,'C',1),(26,20,4,NULL,NULL,NULL,105.44,'C',1),(27,21,1,NULL,NULL,NULL,10.00,'C',1),(28,22,1,NULL,NULL,NULL,15.00,'C',1),(29,25,1,NULL,NULL,NULL,3.00,'D',1),(30,26,1,NULL,NULL,NULL,8.00,'C',1),(31,27,1,NULL,NULL,NULL,6.30,'C',1),(32,28,4,NULL,NULL,NULL,6.30,'C',1),(33,29,8,NULL,NULL,NULL,1008.00,'D',0);
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
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,0,0,1),(4,0,0,1),(5,0,1,1),(6,0,1,1),(7,1,0,1),(8,1,0,1),(9,1,1,1),(10,1,1,1),(11,1,1,1),(12,1,1,1),(13,1,1,1),(14,1,1,1),(15,0,1,0),(16,1,1,1),(17,1,1,1),(18,1,1,1),(19,1,1,1),(20,1,1,1),(21,1,1,1),(22,1,1,1),(23,1,1,1),(24,1,1,1),(27,1,1,1),(28,1,1,1),(29,0,0,1),(30,0,1,0),(31,0,1,0);
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
INSERT INTO `nf` VALUES (1,3,13250,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,3,9,NULL,1,90.00,90.00,0.00,0.00,0.00,0.00,90.00,16.20,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce`
--

LOCK TABLES `nfce` WRITE;
/*!40000 ALTER TABLE `nfce` DISABLE KEYS */;
INSERT INTO `nfce` VALUES (1,3,NULL,3551,1,'31230287976874000167650010000035511000035517','','','2023-02-05 00:00:00','2023-02-05 00:00:00',1,200.00,200.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'','','0001-01-01 00:00:00','',1,'','','',1,0,0,0);
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
INSERT INTO `nfce_contingencia` VALUES (1,3,'2023-03-04 11:47:04','2023-03-04 11:47:06','teste modo de contingencia',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_item`
--

LOCK TABLES `nfce_item` WRITE;
/*!40000 ALTER TABLE `nfce_item` DISABLE KEYS */;
INSERT INTO `nfce_item` VALUES (1,1,1,1,NULL,NULL,5403,2.0000,100.0000,200.00,200.00,0.00,0.00,0.00,0.00,'00',200.00,18.0000,36.00,0.00,0.0000,0.00,0.00,0.0000,0.00,'06',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,'105',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe`
--

LOCK TABLES `nfe` WRITE;
/*!40000 ALTER TABLE `nfe` DISABLE KEYS */;
INSERT INTO `nfe` VALUES (1,3,888,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2023-03-05 11:45:30',1,0,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(2,3,4123,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2023-03-05 11:45:31',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,1),(3,3,105522,'E',1,'31160704731855000143550010007485481189117075','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,300.00,300.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(4,3,129589,'E',1,'35170556639107000139550010001295891214189392','','',0,0,6,'2023-03-02 00:00:00','2023-03-04 00:00:00',5,1,3,9,NULL,2,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(5,3,19985761,'E',1,'31190824634181000176550240000051671667165118','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(6,3,19985762,'E',1,'31190724634181000176550740000000091895382522','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(7,3,19985763,'E',1,'31190624634181000176550240000051471672414309','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(8,3,19985764,'E',1,'31190624634181000176550240000051461229102452','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(9,3,129581,'E',1,'31190624634181000176550240000051451431684303','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(10,3,129582,'E',1,'31190624634181000176550240000051441127964116','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(11,3,129583,'E',1,'31190524634181000176550240000051431383098847','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(12,3,129584,'E',1,'31190524634181000176550240000051421383098840','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,2,700.00,700.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(13,3,21,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2023-03-05 11:47:14',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(14,3,0,'S',1,'','','',0,0,10,'0001-01-01 00:00:00','2023-03-05 11:47:24',1,0,3,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(15,3,579,'E',3,'','','',0,0,9,'0001-01-01 00:00:00','2023-03-05 11:57:48',1,0,2,0,NULL,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',0,0,0,0),(16,3,8385,'E',1,'31200620319623000139550010000584391752772151','','',0,0,9,'2023-03-04 11:57:51','2023-03-04 11:57:51',1,1,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(17,3,1625,'E',1,'31200829826502000158550010000198201919116443','','',0,0,9,'2023-03-04 11:57:51','2023-03-04 11:57:51',1,1,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(18,3,4100,'E',1,'31200906249102000121550020002381841003458376','','',0,0,9,'2023-03-04 11:57:52','2023-03-04 11:57:52',1,1,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(19,3,19985763,'E',1,'31230321148618000174550010045642481045642487','','',0,0,6,'2023-03-04 00:00:00','2023-03-04 00:00:00',1,1,3,9,NULL,1,1000.00,1008.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,2.00,3.00,2.00,3.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2.00,2.00,0.00,0.00,'','',1,'','',1,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_ajuste_item`
--

LOCK TABLES `nfe_ajuste_item` WRITE;
/*!40000 ALTER TABLE `nfe_ajuste_item` DISABLE KEYS */;
INSERT INTO `nfe_ajuste_item` VALUES (1,15,1403,1,'MG70000026','Estorno de crédito',75.00),(2,15,1102,2,'MG10000504','Diferencial de Alíquota',25.00);
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
INSERT INTO `nfe_contingencia` VALUES (1,3,'2023-03-04 11:47:09','2023-03-04 11:47:11','teste modo de contingencia',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_item`
--

LOCK TABLES `nfe_item` WRITE;
/*!40000 ALTER TABLE `nfe_item` DISABLE KEYS */;
INSERT INTO `nfe_item` VALUES (1,1,1,2,NULL,1102,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'03',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,1),(2,2,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(3,3,3,NULL,NULL,1102,1,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(4,3,5,NULL,NULL,1102,2,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(5,3,3,1,NULL,1102,3,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(6,4,1,1,NULL,1101,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(7,5,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(8,6,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(9,7,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(10,8,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(11,9,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(12,10,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(13,11,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(14,12,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(15,12,3,NULL,NULL,1102,2,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(16,12,5,NULL,NULL,1102,3,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'00',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',56,0),(17,13,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(18,16,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(19,18,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.0000,0.00,0.0000,'02',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,1),(20,19,1,1,NULL,1102,1,10.0000,50.0000,500.00,503.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,1.00,0.0000,0.0000,1.00,0.0000,'00',1.00,0.0000,1.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,1.00,0.0000,1.00,0.00,0.0000,0.00,0,0,0,'',56,0),(21,19,1,1,NULL,1102,2,10.0000,50.0000,500.00,505.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,18.00,0.0000,0.00,0,0.0000,1.00,0.0000,0.0000,2.00,0.0000,'00',1.00,0.0000,2.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,1.00,0.0000,1.00,0.00,0.0000,0.00,0,0,0,'',56,0);
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
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(6,NULL,'Compra de Mercadorias para revenda','E',0,0,1),(7,NULL,'Prestação de Serviço','S',0,0,0),(8,NULL,'Venda de Mercadorias','S',1,1,1),(9,NULL,'NFe de entrada','E',1,0,1),(10,NULL,'NFe de saída','S',1,0,1),(11,NULL,'Devolução de Venda','E',1,1,1);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,95,3),(1,96,4),(2,99,5),(2,100,6),(2,101,7),(2,102,8),(3,119,9),(3,120,10),(4,122,11),(4,123,12),(6,119,9),(6,120,10),(8,93,1),(8,94,2),(11,99,5),(11,100,6);
/*!40000 ALTER TABLE `operacao_categoria` ENABLE KEYS */;
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
INSERT INTO `operacao_empresa` VALUES (1,3,1,1,0),(2,3,1,1,0),(3,3,1,1,0),(4,3,1,1,0),(6,3,NULL,1,0),(7,3,2,1,0),(8,3,2,1,0),(9,3,2,1,0),(10,3,2,1,0),(11,3,1,1,0);
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
INSERT INTO `pagamento` VALUES (1,1,'2023-03-04',200.00,0.00,0.00,200.00,0);
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
  `realizado` tinyint(1) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,3,3,2,NULL,1,'1','2023-03-04','2023-03-14','0001-01-01',30.00,0.00,0.00,0.00,'',1,0,0),(2,NULL,3,3,2,NULL,1,'2','2023-03-04','2023-04-03','0001-01-01',70.00,0.00,0.00,0.00,'',1,0,0),(3,NULL,3,3,9,NULL,1,'10','2023-03-04','2023-03-14','2023-03-04',200.00,0.00,0.00,200.00,'',1,0,0),(4,NULL,3,3,9,NULL,1,'20','2023-03-04','2023-04-03','0001-01-01',300.00,0.00,0.00,0.00,'',1,0,1),(5,NULL,3,3,10,NULL,1,'10','2023-03-04','2023-03-14','0001-01-01',250.00,0.00,0.00,0.00,'',1,0,0),(6,NULL,3,3,10,NULL,1,'20','2023-03-04','2023-04-03','0001-01-01',450.00,0.00,0.00,0.00,'',1,0,0),(7,NULL,3,3,NULL,NULL,1,'0000000007','2023-03-04','2023-04-04','0001-01-01',5.00,0.00,0.00,0.00,'',0,0,0),(8,NULL,3,7,NULL,NULL,1,'0000000007','2023-03-04','2023-04-04','0001-01-01',5.00,0.00,0.00,0.00,'',0,0,0),(9,NULL,3,3,NULL,1,2,'0000000009','2023-03-04','2023-03-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,0,1),(10,NULL,3,3,NULL,1,2,'0000000010','2023-03-04','2023-04-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,0,1),(11,NULL,3,3,NULL,1,2,'0000000011','2023-03-04','2023-05-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,0,1),(12,NULL,3,3,NULL,1,2,'0000000012','2023-03-04','2023-06-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,0,1),(13,NULL,3,3,NULL,1,2,'0000000013','2023-03-04','2023-07-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,0,1);
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
INSERT INTO `pagar_categoria` VALUES (1,120,100.0000),(2,120,100.0000),(3,120,100.0000),(4,120,100.0000),(5,120,100.0000),(6,120,100.0000),(7,141,100.0000),(8,141,100.0000),(9,231,90.9091),(9,232,9.0909),(10,231,90.9091),(10,232,9.0909),(11,231,90.9091),(11,232,9.0909),(12,231,90.9091),(12,232,9.0909),(13,231,90.9091),(13,232,9.0909);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdv`
--

LOCK TABLES `pdv` WRITE;
/*!40000 ALTER TABLE `pdv` DISABLE KEYS */;
INSERT INTO `pdv` VALUES (1,3,1,6,NULL,'identificador-teste','Pdv Teste',2,0),(2,3,1,7,NULL,'identificador-teste','Pdv Teste',2,1);
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
INSERT INTO `pessoa` VALUES (1,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,'0001-01-01 00:00:00'),(2,'J',1,'João','João',NULL,'','16629339000191','ISENTO','','',9,'','','','','0001-01-01',0,0,'2023-03-04 11:44:53'),(3,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,'2023-03-04 11:44:54'),(4,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','CPR15725',9,'','','','','1999-11-29',0,0,'2023-03-04 11:47:52'),(5,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,'2023-03-04 11:44:58'),(6,'J',1,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,'2023-03-04 11:47:14'),(7,'F',0,'Vendedor excluído','','37077148610','1348213',NULL,'','','',0,'','','','','2003-03-04',0,0,'2023-03-04 11:47:22'),(8,'J',2,'Leonardo e Breno Comercio de Bebidas Ltda','Leonardo e Breno Comercio de Bebidas Ltda',NULL,'','18206937000183','ISENTO','','',9,'','','','','0001-01-01',0,0,'2023-03-04 11:47:34'),(9,'F',0,'Eliane Bianca Freitas','','80577321560','MG123',NULL,'','','',0,'','','','','0001-01-01',0,0,'2023-03-04 11:47:51');
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2023-03-04 11:45:51'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2023-03-04 11:45:51'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2023-03-04 11:45:51'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2023-03-04 11:45:51'),(5,NULL,'À vista',1,1,0,0,0,'2023-03-04 11:45:50'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2023-03-04 11:45:51'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2023-03-04 11:45:51'),(8,NULL,'À prazo Entrada/30/45/60/75/90',2,4,1,0,0,'2023-03-04 11:45:51'),(9,NULL,'Vencimento dia 10 do próximo mês',2,4,4,10,0,'2023-03-04 11:45:51');
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
INSERT INTO `produto` VALUES (1,NULL,'Arroz Codil Tipo 1','',0,3,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(2,NULL,'Café','',0,NULL,'',1,1,0,'10064000','','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(3,NULL,'Fósforo','',0,1,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(4,NULL,'Troca de óleo','Troca de óleo',9,NULL,'',1,1,0,'','','','','',0,0,'',0,'',0,'2023-03-04 11:47:53'),(5,NULL,'Coca-Cola 2L','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(6,NULL,'Produto teste','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(7,NULL,'Feijão Carioca','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2023-03-04 11:45:05'),(8,NULL,'Manutenção de computadores','Manutenção de computadores',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2023-03-04 11:47:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,3,NULL,NULL,3,1,'',26.0000,50.0000,64.0000),(2,5,NULL,NULL,3,1,'',20.0000,20.0000,0.0000),(3,3,1,NULL,3,1,'',0.0000,0.0000,0.0000),(4,1,1,NULL,3,1,'',88.0000,30.0000,10.0000),(5,7,NULL,NULL,3,1,'',-2.0000,0.0000,2.0000);
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
INSERT INTO `produto_grupo` VALUES (1,'Geral','2023-03-04 11:45:05');
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
INSERT INTO `produto_inventario` VALUES (8,3,1,'202302',58.0000,34.3400),(9,3,2,'202302',0.0000,5.8000),(10,3,3,'202302',40.0000,2.0001),(11,3,5,'202302',0.0000,5.0000),(12,3,6,'202302',0.0000,0.0000),(13,3,7,'202302',0.0000,8.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:42','2023-03-04 00:00:00','E',50.0000,''),(2,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:42','2023-03-04 00:00:00','E',20.0000,''),(3,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:42','2023-03-04 00:00:00','E',10.0000,''),(4,1,1,NULL,3,1,2,NULL,NULL,NULL,NULL,'2023-03-04 11:45:42','2023-03-04 00:00:00','E',10.0000,''),(5,1,1,NULL,3,1,7,NULL,NULL,NULL,NULL,'2023-03-04 11:45:45','2023-03-04 00:00:00','E',10.0000,''),(6,1,1,NULL,3,1,8,NULL,NULL,NULL,NULL,'2023-03-04 11:45:46','2023-03-04 00:00:00','E',10.0000,''),(7,1,1,NULL,3,1,9,NULL,NULL,NULL,NULL,'2023-03-04 11:45:46','2023-03-04 00:00:00','E',10.0000,''),(8,1,1,NULL,3,1,10,NULL,NULL,NULL,NULL,'2023-03-04 11:45:47','2023-03-04 00:00:00','E',10.0000,''),(9,3,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2023-03-04 11:45:47','2023-03-04 00:00:00','E',50.0000,''),(10,5,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2023-03-04 11:45:47','2023-03-04 00:00:00','E',20.0000,''),(11,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2023-03-04 11:45:47','2023-03-04 00:00:00','E',10.0000,''),(12,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2023-03-04 11:45:47','2023-03-04 00:00:00','E',10.0000,''),(13,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2023-03-04 11:45:48','2023-03-04 00:00:00','E',10.0000,''),(14,1,1,NULL,3,1,14,NULL,NULL,NULL,NULL,'2023-03-04 11:45:48','2023-03-04 00:00:00','E',10.0000,''),(15,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:48','2023-03-04 00:00:00','S',50.0000,''),(16,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:48','2023-03-04 00:00:00','S',20.0000,''),(17,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2023-03-04 11:45:48','2023-03-04 00:00:00','S',10.0000,''),(18,1,1,NULL,3,1,7,NULL,NULL,NULL,NULL,'2023-03-04 11:45:49','2023-03-04 00:00:00','S',10.0000,''),(19,1,1,NULL,3,1,8,NULL,NULL,NULL,NULL,'2023-03-04 11:45:49','2023-03-04 00:00:00','S',10.0000,''),(20,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2023-03-04 11:45:49','2023-03-04 00:00:00','S',10.0000,''),(21,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2023-03-04 11:45:49','2023-03-04 00:00:00','S',10.0000,''),(22,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2023-03-04 11:45:49','2023-03-04 00:00:00','S',10.0000,''),(23,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:00','2023-03-04 11:46:59','S',15.0000,'Vencimento do produto'),(24,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:00','2023-03-04 11:47:00','E',25.0000,'Recontagem de estoqueo'),(25,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:00','2023-02-12 11:47:00','E',58.0000,'Balanço'),(26,3,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:00','2023-02-12 11:47:00','E',40.0000,'Balanço'),(27,3,NULL,NULL,3,1,NULL,11,NULL,NULL,NULL,'2023-03-04 11:47:03','2023-03-04 11:47:03','S',10.0000,''),(28,3,NULL,NULL,3,1,NULL,12,NULL,NULL,NULL,'2023-03-04 11:47:03','2023-03-04 11:47:03','S',1.0000,''),(29,3,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2023-03-04 11:47:03','2023-03-04 11:47:03','S',3.0000,''),(30,3,NULL,NULL,3,1,NULL,14,NULL,NULL,NULL,'2023-03-04 11:47:04','2023-03-04 11:47:04','S',1.0000,''),(31,1,1,NULL,3,1,NULL,16,NULL,NULL,NULL,'2023-03-04 11:47:13','2023-03-04 11:47:13','S',6.0000,''),(32,3,NULL,NULL,3,1,NULL,16,NULL,NULL,NULL,'2023-03-04 11:47:13','2023-03-04 11:47:13','S',50.0000,''),(33,1,1,NULL,3,1,NULL,17,NULL,NULL,NULL,'2023-03-04 11:47:13','2023-03-04 11:47:13','S',1.0000,''),(34,1,1,NULL,3,1,NULL,18,NULL,NULL,NULL,'2023-03-04 11:47:13','2023-03-04 11:47:13','S',3.0000,''),(35,3,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,'2023-03-04 11:47:32','2023-03-04 11:47:32','E',1.0000,''),(36,1,1,NULL,3,1,NULL,NULL,1,NULL,NULL,'2023-03-04 11:47:33','2023-03-04 11:47:33','S',10.0000,''),(37,7,NULL,NULL,3,1,NULL,19,NULL,NULL,NULL,'2023-03-04 11:57:51','2023-03-04 11:57:51','S',1.0000,''),(38,7,NULL,NULL,3,1,NULL,20,NULL,NULL,NULL,'2023-03-04 11:57:51','2023-03-04 11:57:51','S',1.0000,'');
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
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,3,50.0000,41.1913,50.0000,7.9000,6.0940,5.0000,0.0000),(2,1,0,1,3,50.0000,40.1408,50.0000,7.9000,6.0940,5.0000,0.0000),(3,2,0,NULL,3,5.8000,0.0000,0.0000,7.3000,0.0000,0.0000,0.0000),(4,3,0,NULL,3,2.0000,2.0001,0.0000,0.4900,3126.6849,1.9900,0.0000),(5,4,0,NULL,3,0.0000,0.0000,0.0000,80.0000,0.0000,0.0000,0.0000),(6,5,0,NULL,3,5.0000,5.0000,5.0000,5.5000,0.0000,0.0000,0.0000),(7,6,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(8,6,0,2,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(9,7,0,NULL,3,8.0000,0.0000,0.0000,6.3000,6.3000,6.3000,0.0000),(10,1,0,3,3,5.5000,0.0000,0.0000,7.9000,0.0000,0.0000,0.0000),(11,8,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000);
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
INSERT INTO `produto_sped` VALUES (1,1,'Arroz Codil Tipo 1','2023-03-04','0001-01-01'),(2,2,'Café','2023-03-04','0001-01-01'),(3,3,'Macarrão Sta Amália','2023-03-04','2023-03-03'),(4,4,'Troca de óleo','2023-03-04','0001-01-01'),(5,5,'Coca-Cola 2L','2023-03-04','0001-01-01'),(6,6,'Produto teste','2023-03-04','0001-01-01'),(7,7,'Feijão Carioca','2023-03-04','0001-01-01'),(8,3,'Fósforo','2023-03-04','0001-01-01');
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
INSERT INTO `produto_unidade` VALUES (1,'Unidade','UN',0,'2023-03-04 11:45:05');
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
  `realizado` tinyint(1) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,3,4,NULL,16,2,'0000000001','2023-03-04','2023-04-03','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',1,0,0,0),(2,NULL,3,4,NULL,16,2,'0000000002','2023-03-04','2023-05-03','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',1,0,0,0),(3,NULL,3,4,NULL,16,2,'0000000003','2023-03-04','2023-06-02','0001-01-01',35.14,0.00,0.00,0.00,0.0000,'',1,0,0,0),(4,NULL,3,8,NULL,NULL,1,'Teste api','2023-03-04','2023-03-09','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0,0),(5,NULL,3,4,NULL,20,2,'0000000005','2021-01-01','2021-02-01','0001-01-01',6.30,0.00,0.00,0.00,0.0000,'',1,0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,94,100.0000),(2,94,100.0000),(3,94,100.0000),(4,225,100.0000),(5,94,100.0000);
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
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(3,1,1,0,'AP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(31,2,1,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',60,''),(32,3,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(33,3,8,0,'MG','Venda',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(34,3,8,0,'AM','Venda',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(35,3,4,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',9,''),(36,3,10,0,'MG','NFe de Saída',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',4,''),(37,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sped_credito_pis_cofins`
--

LOCK TABLES `sped_credito_pis_cofins` WRITE;
/*!40000 ALTER TABLE `sped_credito_pis_cofins` DISABLE KEYS */;
INSERT INTO `sped_credito_pis_cofins` VALUES (1,3,'022023','022023',101,165.00,760.00,65.00,260.00),(2,3,'012023','012023',101,165.00,760.00,65.00,260.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,3,'2023-03-04 11:46:56',8,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:58'),(2,3,'2023-03-04 11:46:56',8,4,1,1,100.00,90.00,0.00,10.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Floriano Peixoto',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:58'),(3,3,'2023-03-04 11:46:56',8,4,1,1,70.00,50.00,0.00,20.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(4,3,'2023-03-04 11:46:56',8,4,1,1,15.07,15.00,0.00,0.07,0.00,0.00,0.0000,0.0000,NULL,0.00,'Eliane Bruna Ester das Neves',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(5,3,'2023-03-04 11:46:57',8,4,1,1,70.00,90.00,0.00,0.00,0.00,20.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(6,3,'2023-03-04 11:46:57',8,4,4,2,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(7,3,'2023-03-04 11:46:57',8,NULL,1,1,120.00,120.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(8,3,'2023-03-04 11:46:57',8,4,1,1,300.00,300.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(9,3,'2023-03-04 11:46:57',8,NULL,1,1,80.00,80.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:46:56'),(10,3,'2023-03-04 11:46:57',8,NULL,1,1,250.00,249.00,0.00,1.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:13'),(11,3,'2023-03-04 11:47:03',8,NULL,1,1,105.00,105.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:02'),(12,3,'2023-03-04 11:47:03',8,4,1,1,200000.01,200000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:03'),(13,3,'2023-03-04 11:47:03',8,NULL,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:03'),(14,3,'2023-03-04 11:47:04',8,NULL,1,1,3000.01,3000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:03'),(15,3,'2023-03-04 11:47:11',8,NULL,1,1,6.30,7.00,0.00,0.00,0.70,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:13'),(16,3,'2023-03-04 11:47:12',8,4,4,2,135.44,135.44,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:12'),(17,3,'2023-03-04 11:47:13',8,NULL,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:12'),(18,3,'2023-03-04 11:47:13',8,NULL,1,1,15.00,15.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:47:13'),(19,3,'2021-01-01 00:00:00',8,NULL,1,1,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:57:50'),(20,3,'2021-01-01 00:00:00',8,4,4,2,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-04 11:57:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
INSERT INTO `venda_item` VALUES (1,1,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,1,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(3,2,1,1,NULL,'',1,2.0000,9.0000,100.0000,200.00,200.00,0.00,0.00,0.00,0.00,0,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(4,2,3,NULL,NULL,'',1,1.0000,2.0000,100.0000,100.00,90.00,0.00,10.00,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,3,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,3,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,3,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,3,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,3,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,3,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(11,3,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(12,4,3,NULL,NULL,'',1,1.0000,2.0000,1.0700,1.07,1.06,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(13,4,1,1,NULL,'',2,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(14,4,1,1,NULL,'',3,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(15,4,1,1,NULL,'',4,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(16,4,1,1,NULL,'',5,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(17,4,1,1,NULL,'',6,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(18,4,1,1,NULL,'',7,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(19,4,1,1,NULL,'',8,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(20,4,1,1,NULL,'',9,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(21,4,1,1,NULL,'',10,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(22,4,1,1,NULL,'',11,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(23,4,1,1,NULL,'',12,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(24,4,1,1,NULL,'',13,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(25,4,1,1,NULL,'',14,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(26,4,1,1,NULL,'',15,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(27,5,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(28,5,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(29,5,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(30,5,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(31,5,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(32,5,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(33,5,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(34,6,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(35,6,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(36,7,3,NULL,NULL,'',1,12.0000,2.0000,10.0000,120.00,120.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(37,8,3,NULL,NULL,'',1,30.0000,2.0000,10.0000,300.00,300.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(38,9,5,NULL,NULL,'',1,1.0000,5.0000,80.0000,80.00,80.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(39,10,1,1,NULL,'',1,1.0000,9.0000,100.0000,100.00,99.60,0.00,0.40,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(40,10,3,NULL,NULL,'',2,1.0000,2.0000,150.0000,150.00,149.40,0.00,0.60,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(41,11,3,NULL,NULL,'',1,10.0000,2.0000,10.5000,105.00,105.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(42,12,3,NULL,NULL,'',1,1.0000,2.0000,200000.0100,200000.01,200000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(43,13,3,NULL,NULL,'',1,3.0000,2.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(44,14,3,NULL,NULL,'',1,1.0000,2.0000,3000.0100,3000.01,3000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(45,15,5,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,7.00,0.00,0.00,0.70,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(46,16,1,1,NULL,'',1,6.0000,9.0000,5.9900,35.94,35.94,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(47,16,3,NULL,NULL,'',2,50.0000,2.0000,1.9900,99.50,99.50,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(48,17,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(49,18,1,1,NULL,'',1,3.0000,9.0000,5.0000,15.00,15.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(50,19,7,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,6.30,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(51,20,7,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,6.30,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2023-03-04 11:44:33','c6f53f79b486f62baa9b97f8d929a7e5'),(2,2,'20221114.182125.297','2023-03-04 11:44:33','9f6abbb2bca653f75f9ebea9845c27c4'),(3,2,'20220927.231853.021-financas','2023-03-04 11:44:33','8a0d469a82378aad71d3bd3681447557'),(4,2,'20220927.231856.052-financas','2023-03-04 11:44:33','1f92049d09908357fe03d81b91ab0ac3'),(5,2,'20220927.231859.082-financas','2023-03-04 11:44:33','7f2e006c2dba4d9dc86b056111af5d98'),(6,2,'20220927.231902.116-financas','2023-03-04 11:44:33','47ba21609586c5992682f1aeeec7e375'),(7,2,'20220927.231905.158-financas','2023-03-04 11:44:33','7f336572723131d100a061ce013e6f2f'),(8,2,'20220927.231908.190-financas','2023-03-04 11:44:33','7b9eaac689a7de33f5af7f98bca62426'),(9,2,'20220927.231911.215-financas','2023-03-04 11:44:33','cb0c6c1bceb61ff687e61c7f1e61c931'),(10,2,'20220927.231914.237-financas','2023-03-04 11:44:33','71aa263a509cd70276c80f2c7715e74a'),(11,2,'20220927.231917.275-financas','2023-03-04 11:44:33','f02c806a4b2666c88869b3ddb5d5c710'),(12,2,'20220927.231920.311-financas','2023-03-04 11:44:33','aefc972d2ae8b65116499e083aea7ac5'),(13,2,'20220927.231923.342-financas','2023-03-04 11:44:33','fac6835df1b2de5ea5047d67e5f0d4c9'),(14,2,'20220927.231926.383-financas','2023-03-04 11:44:33','0f1e00b5797be7e885a22ea810089475'),(15,2,'20220927.231929.422-financas','2023-03-04 11:44:33','4b1b8d835f4ae13e8523f04ec85bfa87'),(16,2,'20220927.231932.449-financas','2023-03-04 11:44:33','fc65f02981d04a52b1708d9cfa55f12e'),(17,2,'20220927.231935.475-financas','2023-03-04 11:44:33','360957f56eaf7b2758be697bda858476'),(18,2,'20220927.231938.503-financas','2023-03-04 11:44:33','55a1802c4d5c3f659bf6d8cfd2de576c'),(19,2,'20220927.231941.539-financas','2023-03-04 11:44:33','159838eef3637b0fb64c3d5629381494'),(20,2,'20220927.231944.560-financas','2023-03-04 11:44:33','9500421ea9bec9b87ddc96220de1e6c9'),(21,2,'20220927.231947.591-financas','2023-03-04 11:44:33','27b402a9ba5651788ab8a22a5bf30834'),(22,2,'20220927.231950.619-financas','2023-03-04 11:44:33','323a852413ee2e85889769674dc10364'),(23,2,'20220927.231953.643-financas','2023-03-04 11:44:33','9872d5eb52b2fa587e42097120c0fb9a'),(24,2,'20220927.231956.678-financas','2023-03-04 11:44:33','aa1f974882df44dfb1918cc8df635cf3'),(25,2,'20220927.231959.720-financas','2023-03-04 11:44:33','b4108e6b5606aa4674d1348d996e0609'),(26,2,'20220927.232002.752-financas','2023-03-04 11:44:33','3652a2c88627d6f005e8a563948e65cd'),(27,2,'20220927.232005.779-financas','2023-03-04 11:44:33','d53b274fa1dd4632ff0bed984a860aa1'),(28,2,'20220927.232008.813-financas','2023-03-04 11:44:33','f8bf5e2ee83fde069a75373d01a34094'),(29,2,'20220927.232011.839-financas','2023-03-04 11:44:33','1b94558446f1bed132dda89e92e679fb'),(30,2,'20220927.232014.867-financas','2023-03-04 11:44:33','95e866d2bc55ab3a063a6ba704244f24'),(31,2,'20220927.232017.894-financas','2023-03-04 11:44:33','e40e3ce3baff890fb18c792aea68ea69'),(32,2,'20220927.232020.927-financas','2023-03-04 11:44:33','2dcf61a729a2856ff2b2b9f30a32320d'),(33,2,'20220927.232023.968-financas','2023-03-04 11:44:33','5f62221d05d1dc2826ec9673ef6d40e2'),(34,2,'20220927.232026.997-financas','2023-03-04 11:44:33','d0c65d2b052fbacdd4c33da42f367f92'),(35,2,'20220927.232030.018-financas','2023-03-04 11:44:33','fdcc96b4dd612075cfdd670e9cbf2b57'),(36,2,'20220927.232033.051-financas','2023-03-04 11:44:33','69d6bc2f1ff107a53c35eb0fe78b311c'),(37,2,'20220927.232036.093-financas','2023-03-04 11:44:33','883f4933c6a875cf97add3f4cc777a0e'),(38,2,'20220927.232039.127-financas','2023-03-04 11:44:33','634ad404d846094b294161c44d8cbc92'),(39,2,'20220927.232042.162-financas','2023-03-04 11:44:33','b90ef2eca182f94048b7e27c56fe4f7c'),(40,2,'20220927.232045.187-financas','2023-03-04 11:44:33','923d140b604b7816e73ba8d9d283377f'),(41,2,'20220927.232048.220-financas','2023-03-04 11:44:33','cbc4127b1ecefd55dd8aef0d395388d4'),(42,2,'20220927.232051.257-financas','2023-03-04 11:44:33','ddbc0bd8984111e9d9f054da9691a627'),(43,2,'20220927.232054.286-financas','2023-03-04 11:44:33','8d4551dd29de2c713c6f5abdf9b3d265'),(44,2,'20220927.232057.328-financas','2023-03-04 11:44:33','31a67940e271c096638acfb9c5f341ad'),(45,2,'20220927.232100.367-financas','2023-03-04 11:44:33','8ef75d15746b4c08a7118460e467d09e'),(46,2,'20220927.232103.395-financas','2023-03-04 11:44:33','4dbfe47476b30edf17f1a71274d88d1c'),(47,2,'20220927.232106.423-financas','2023-03-04 11:44:34','d1cc3d1b253fa4b42c6462e3e30076eb'),(48,2,'20220927.232109.456-financas','2023-03-04 11:44:34','6bff162f15c02959839683d00c1dbc84'),(49,2,'20220927.232112.491-financas','2023-03-04 11:44:34','d89410b45ee9a059e2c9007874e89423'),(50,2,'20220927.232115.513-financas','2023-03-04 11:44:34','6985eca451616f7af6312ae82e016439'),(51,2,'20220927.232118.547-financas','2023-03-04 11:44:34','119ec235cd8f90cf7c7c8e0623211f66'),(52,2,'20220927.232121.575-financas','2023-03-04 11:44:34','3476489add9492e9f150c333538f73ff'),(53,2,'20220927.232124.607-financas','2023-03-04 11:44:34','0b295f5fe7eb5787713242d1f2cfb56a'),(54,2,'20220927.232127.635-financas','2023-03-04 11:44:34','5badf8f9750b11450e2de66f6ef0674a'),(55,2,'20220927.232130.676-financas','2023-03-04 11:44:34','90b9dae6a24e7f2dd255ba9afd93310d'),(56,2,'20220927.232133.705-financas','2023-03-04 11:44:34','6cf3cdfb804d468e5d991d66c5cff792'),(57,2,'20220927.232136.737-financas','2023-03-04 11:44:34','8d357d149f8238c9fd2b82fa07a35020'),(58,2,'20220927.232139.771-financas','2023-03-04 11:44:34','4b11c207fdae921c2456c9893e825951'),(59,2,'20220927.232142.802-financas','2023-03-04 11:44:34','2fc7b38b3be539c65bca0a0ebceb10f9'),(60,2,'20220927.232145.829-financas','2023-03-04 11:44:34','26e21738fef39113b87f1ae171d91d3f'),(61,2,'20220927.232148.858-financas','2023-03-04 11:44:34','1dcf99315a9e260a0e2d0c73bff60f29'),(62,2,'20220927.232151.889-financas','2023-03-04 11:44:34','9f3ea0d531afae7bf39f175cec67d542'),(63,2,'20220927.232154.913-financas','2023-03-04 11:44:34','a3cab97baabdb8f5ab83e6c94374cfc7'),(64,2,'20220927.232157.949-financas','2023-03-04 11:44:34','944700ad2105036969b68953e9f1e1ad'),(65,2,'20220927.232200.972-financas','2023-03-04 11:44:34','bbac0b87dd663d0a52ab2dc560b9f0ff'),(66,2,'20220927.232204.006-financas','2023-03-04 11:44:34','f21a3cafbd59f55a62b136cb0428d50d'),(67,2,'20220927.232207.039-financas','2023-03-04 11:44:34','74b5934396fd7d3832b4728f721aa56f'),(68,2,'20220927.232210.064-financas','2023-03-04 11:44:34','bb7eac20539ace2684ab7f3ae62081b3'),(69,2,'20220927.232213.090-financas','2023-03-04 11:44:34','0b5629398d88fef34af8b900e4485f6e'),(70,2,'20220927.232216.129-financas','2023-03-04 11:44:34','04cd2bbe7e3311a3eac0bdfee5d89491'),(71,2,'20220927.232219.167-financas','2023-03-04 11:44:34','df0a4997450e4f249a07e83cbbd7634c'),(72,2,'20220927.232222.193-financas','2023-03-04 11:44:34','7949fc5431660b0339d9980f8434316b'),(73,2,'20220927.232225.219-financas','2023-03-04 11:44:34','a98b9d02e6a9582caf14980595b9f93a'),(74,2,'20220927.232228.256-financas','2023-03-04 11:44:34','42a707e8b35aa25a9cd9e9e025516dc9'),(75,2,'20220927.232231.283-financas','2023-03-04 11:44:34','4d33a833e9558ee3457c1d4cfe931927'),(76,2,'20220927.232234.314-financas','2023-03-04 11:44:34','136d4746a2c90f37d2ffbb6012c9cf13'),(77,2,'20220927.232237.348-financas','2023-03-04 11:44:34','865238bf5120c090f43987114f8ccefe'),(78,2,'20220927.232240.374-financas','2023-03-04 11:44:34','c01e543860d6ecf4f9ec4619318e5f3f'),(79,2,'20220927.232243.406-financas','2023-03-04 11:44:34','5029bde5c230455a4b28e0ce7d5f489c'),(80,2,'20220927.232246.448-financas','2023-03-04 11:44:34','78cdf63e631ccdf621a17a7a21eb81ef'),(81,2,'20220927.232249.485-financas','2023-03-04 11:44:34','2385ee4c8105ca26e7456cf07ca14591'),(82,2,'20220927.232252.522-financas','2023-03-04 11:44:34','3ba6574243249c8c879e7d259e11d67f'),(83,2,'20220927.232255.558-financas','2023-03-04 11:44:34','c37117ef2ab222624b4e68f1bff083c0'),(84,2,'20220927.232258.583-financas','2023-03-04 11:44:34','966a92d9d8e87a9f0c10efe80a399010'),(85,2,'20220927.232301.622-financas','2023-03-04 11:44:34','79b9cd1c57a4ef3ce65a07e2cc828cd8'),(86,2,'20220927.232304.657-financas','2023-03-04 11:44:34','1ea61cd5faef6612b6517e861d5d029d'),(87,2,'20220927.232307.681-financas','2023-03-04 11:44:34','d2da3637e824956ac864a75ae132e662'),(88,2,'20220927.232310.703-financas','2023-03-04 11:44:34','18987c7f47b143b776282e08ba9f4381'),(89,2,'20220927.232313.739-financas','2023-03-04 11:44:34','7f8f59a96132ea43ae9fbb62877cbea2'),(90,2,'20220927.232316.772-financas','2023-03-04 11:44:34','02dc95ec4e691d1fe2ed42a31896229d'),(91,2,'20220927.232319.805-financas','2023-03-04 11:44:34','ddc13ae71d62c208b11036d127183317'),(92,2,'20220927.232322.838-financas','2023-03-04 11:44:34','c99ba07a180efcf398a7f8f7aef5f691'),(93,2,'20220927.232325.873-financas','2023-03-04 11:44:34','bfb183a5d1fe3ca6ded1e4f27d0d5711'),(94,2,'20220927.232328.902-financas','2023-03-04 11:44:34','804c2fb4c6d9bfb505a312be12f78150'),(95,2,'20220927.232331.926-financas','2023-03-04 11:44:34','1c6761419336070cd4e16dfcb2bed410'),(96,2,'20220927.232334.967-financas','2023-03-04 11:44:34','40bf5fbee80666d517e3e5bf06551773'),(97,2,'20220927.232338.003-financas','2023-03-04 11:44:34','b8760615d67ef02900ac0ace70b2934b'),(98,2,'20220927.232341.029-financas','2023-03-04 11:44:34','99c5cb47fa1319bf2b23048055717a27'),(99,2,'20220927.232344.066-financas','2023-03-04 11:44:34','cd565e199b1d4676b0637c14ae5db1cc'),(100,2,'20220927.232347.103-financas','2023-03-04 11:44:34','ff3e5751eb85c711b6d6575decb97f37'),(101,2,'20220927.232350.132-financas','2023-03-04 11:44:34','feb89cd96edfe91fc2299c7b13cfaaf6'),(102,2,'20220927.232353.175-financas','2023-03-04 11:44:34','4d25998f89d1001bec00cf62e950a36e'),(103,2,'20220927.232356.206-financas','2023-03-04 11:44:34','967cd585ed9bdb67f628a9985f92c674'),(104,2,'20220927.232359.244-financas','2023-03-04 11:44:34','943275f7a3c6963a99336dd211348e7f'),(105,2,'20220927.232402.269-financas','2023-03-04 11:44:34','8afbac9ececa259b2d543b5081cbb9fe'),(106,2,'20220927.232405.304-financas','2023-03-04 11:44:34','e22e63872d19a8bdd94aac55f8c8864a'),(107,2,'20220927.232408.343-financas','2023-03-04 11:44:34','2f70dd20ef84f9b90c5a124d2f9c2de5'),(108,2,'20220927.232411.376-financas','2023-03-04 11:44:34','5104aaa7d1d2f6ddf3b48fe4d1b0cc1e'),(109,2,'20220927.232414.410-financas','2023-03-04 11:44:34','9dbe5624acba69a5c49fa279e07b19c5'),(110,2,'20220927.232417.444-financas','2023-03-04 11:44:34','bec1469292a07abc56da1e7ae7719b59'),(111,2,'20220927.232420.471-financas','2023-03-04 11:44:34','e54f14c4ed079106768e3d01b8e1de0e'),(112,2,'20220927.232423.505-financas','2023-03-04 11:44:34','eefdfa30ba3e2a96bb7f9b2d8e975d41'),(113,2,'20220927.232426.546-financas','2023-03-04 11:44:34','e7e7dae1b5954460c673845d7f4aa553'),(114,2,'20220927.232429.583-financas','2023-03-04 11:44:34','2a5152ef5c40b2949e0319c4f943ae2e'),(115,2,'20220927.232432.614-financas','2023-03-04 11:44:34','d306d38be77e7169e07f7fbbc101239b'),(116,2,'20220927.232435.654-financas','2023-03-04 11:44:34','5585ca194c801ca54e7ef086afab9266'),(117,2,'20220927.232438.684-financas','2023-03-04 11:44:34','76355b6e9a7e379202539fa73fbbed61'),(118,2,'20220927.232441.715-financas','2023-03-04 11:44:34','3d531daa751dcbb2efaef7a31c0f9205'),(119,2,'20220927.232444.751-financas','2023-03-04 11:44:34','b52a136f9969b932fe2cfc35cecf921a'),(120,2,'20220927.232447.784-financas','2023-03-04 11:44:34','cea7c9b0f9751a159e2f18c5fc5e469c'),(121,2,'20220927.232450.819-financas','2023-03-04 11:44:34','b4a3301c459e4a209fe842c530004dd1'),(122,2,'20220927.232453.859-financas','2023-03-04 11:44:34','6066f2ce3e09bf17bb8c390cbeb7b839'),(123,2,'20220927.232456.892-financas','2023-03-04 11:44:34','561339ae9f01bf0e8429068959bc3ca5'),(124,2,'20220927.232459.921-financas','2023-03-04 11:44:34','41776c80cd0de68e14207cc8ad545376'),(125,2,'20220927.232502.953-financas','2023-03-04 11:44:34','85865cf8e5215b6120afede2223c9aab'),(126,2,'20220927.232505.981-financas','2023-03-04 11:44:34','0d7ecb5627908f5b7338ec793a3d541f'),(127,2,'20220927.232509.010-financas','2023-03-04 11:44:34','5e8b0bed146b4377440f6e285cdf6394'),(128,2,'20220927.232512.043-financas','2023-03-04 11:44:34','32de4c33605beebb3f471b942b7c71c6'),(129,2,'20220927.232515.073-financas','2023-03-04 11:44:34','202a0da8e93e6071754307b5fea45d3a'),(130,2,'20220927.232518.111-financas','2023-03-04 11:44:34','6d61f627b408004d0c69252802193432'),(131,2,'20220927.232521.154-financas','2023-03-04 11:44:34','206b8f49e49eb7f2e34af1a1dcf2a134'),(132,2,'20220927.232524.192-financas','2023-03-04 11:44:34','89e153e9e9c915bbad8d48271ec2d0a9'),(133,2,'20220927.232527.226-financas','2023-03-04 11:44:34','90d70d6ecc56aa1d67636cbea2892535'),(134,2,'20220927.232530.257-financas','2023-03-04 11:44:34','64a741a09e880713fb7786131fd643cc'),(135,2,'20220927.232533.279-financas','2023-03-04 11:44:34','01cd6903bcbdaaf10ff499d83082091d'),(136,2,'20220927.232536.304-financas','2023-03-04 11:44:34','ce6e813644fded2ecbebc793699319a8'),(137,2,'20220927.232539.334-financas','2023-03-04 11:44:34','178791c2d09d4116655453eb1def97ed'),(138,2,'20220927.232542.376-financas','2023-03-04 11:44:34','8da7449b70cce7d2fc1de4191f7636f8'),(139,2,'20220927.232545.411-financas','2023-03-04 11:44:34','a62a51f61e12fd0db79b22f27bcd1e3a'),(140,2,'20220927.232548.441-financas','2023-03-04 11:44:34','db102649431b5bcef8a33d4bc719411b'),(141,2,'20220927.232551.469-financas','2023-03-04 11:44:34','d2ba2e3eee3e9d80f3edfb187df705fe'),(142,2,'20220927.232554.498-financas','2023-03-04 11:44:34','68bb8d0e7ae3669385553e86b9f33148'),(143,2,'20220927.232557.529-financas','2023-03-04 11:44:34','44914809f55bb1fe8a2b8dedfc2e949d'),(144,2,'20220927.232600.560-financas','2023-03-04 11:44:34','90a351ee3bebe13a56aa2d883177fef4'),(145,2,'20220927.232603.602-financas','2023-03-04 11:44:34','466cd4fcde731a438c02d88be4e1f599'),(146,2,'20220927.232606.641-financas','2023-03-04 11:44:34','9399f537ef805aeda133577b4efa60ef'),(147,2,'20220927.232609.672-financas','2023-03-04 11:44:34','da9bf16d6b6bda79d50c457fe8a54b63'),(148,2,'20220927.232612.696-financas','2023-03-04 11:44:34','9c58d8b7d11c5d1c133fbfdc5d203c8b'),(149,2,'20220927.232615.725-financas','2023-03-04 11:44:34','9f1b733d05725780700892ced3bc1678'),(150,2,'20220927.232618.759-financas','2023-03-04 11:44:34','edf00e91e929725cbf5fd5ebf925a667'),(151,2,'20220927.232621.791-financas','2023-03-04 11:44:34','78736347bb208d5a4e78ed3884048f9f'),(152,2,'20220927.232624.818-financas','2023-03-04 11:44:34','49fa93f4724247dc78a3e5d46e542283'),(153,2,'20220927.232627.854-financas','2023-03-04 11:44:34','3f9b66908feb745a33292c0809fc335e'),(154,2,'20220927.232630.891-financas','2023-03-04 11:44:34','a4961f24fef60adcc1f66003716a5e62'),(155,2,'20220927.232633.913-financas','2023-03-04 11:44:34','c8d52a1fd4457c113c4002857f2856bf'),(156,2,'20220927.232636.944-financas','2023-03-04 11:44:34','a2aaefc8e86cb71e6314a0ef37caa59e'),(157,2,'20220927.232639.974-financas','2023-03-04 11:44:34','2ea3a0f754f2f1ea1bba548771a83d3b'),(158,2,'20220927.232643.008-financas','2023-03-04 11:44:34','cb86333daf1a712ff654ba09636c50fe'),(159,2,'20220927.232646.039-financas','2023-03-04 11:44:34','c4a143159076b2b79f27b3de712695ad'),(160,2,'20220927.232649.072-financas','2023-03-04 11:44:34','5f1a918654297224fed7d58044a4d3ee'),(161,2,'20220927.232652.103-financas','2023-03-04 11:44:34','5551620952941d966b11aec304d5e519'),(162,2,'20220927.232655.134-financas','2023-03-04 11:44:34','3a6b4e6b3c0cc6b2100bed59cca578bd'),(163,2,'20220927.232658.169-financas','2023-03-04 11:44:34','6aa43665f23f99578171f577ffa8c6ef'),(164,2,'20220927.232701.204-financas','2023-03-04 11:44:34','949df91a799686e3885745fd1cd7a2a0'),(165,2,'20220927.232704.237-financas','2023-03-04 11:44:34','6fffd5b89e0d5a24658cb25111feed08'),(166,2,'20220927.232707.265-financas','2023-03-04 11:44:34','be67f3345d98e0b8575e6362bb2106ba'),(167,2,'20220927.232710.291-financas','2023-03-04 11:44:34','45cfe4a8be40995059135a6f6b0ef5f0'),(168,2,'20220927.232713.319-financas','2023-03-04 11:44:34','d68a7ad26b3edb4db0a58bb37053337f'),(169,2,'20220927.232716.345-financas','2023-03-04 11:44:34','9d0e6de720274b06b405e148d5c4dfd4'),(170,2,'20220927.232719.376-financas','2023-03-04 11:44:34','51b72002d51bde4165ee94e2fa4f6891'),(171,2,'20220927.232722.413-financas','2023-03-04 11:44:34','501bfa63289d674f1b872fbfc2a16a41'),(172,2,'20220927.232725.451-financas','2023-03-04 11:44:34','fa5670f7518509e03420edb7372f415c'),(173,2,'20220927.232728.475-financas','2023-03-04 11:44:34','f2902c318ce28bd5d122e231d8f04915'),(174,2,'20220927.232731.509-financas','2023-03-04 11:44:34','959bc8bd9db9f4619d3354ca8949c4aa'),(175,2,'20220927.232734.538-financas','2023-03-04 11:44:34','fb7b2d35519061e5a450bcd8c3d3ed49'),(176,2,'20220927.232737.569-financas','2023-03-04 11:44:34','447517f8699311531481890445383821'),(177,2,'20220927.232740.596-financas','2023-03-04 11:44:34','b77061e835f583a2acdc6692768486f5'),(178,2,'20220927.232743.629-financas','2023-03-04 11:44:34','913a061d3dd77f7c787ae2470f96b38a'),(179,2,'20220927.232746.669-financas','2023-03-04 11:44:34','e2b81fbb034ff18476d49d5881cf0711'),(180,2,'20220927.232749.707-financas','2023-03-04 11:44:34','db83b105289d601f774e0f132364b543'),(181,2,'20220927.232752.736-financas','2023-03-04 11:44:34','5a952abdf0220d2ecc8dba3baad4f3a7'),(182,2,'20220927.232755.766-financas','2023-03-04 11:44:34','f164d465c065223411b73e138131afae'),(183,2,'20220927.232758.799-financas','2023-03-04 11:44:34','c566cc4bb261b86eadc1622696c942af'),(184,2,'20220927.232801.839-financas','2023-03-04 11:44:34','50e878012dbb8be8a69f3c7f3a186e24'),(185,2,'20220927.232804.868-financas','2023-03-04 11:44:34','d52130a2c9980c1bb90aac3e24c4bd0a'),(186,2,'20220927.232807.904-financas','2023-03-04 11:44:34','08a1fce7776edcfd900c424ab4a9af23'),(187,2,'20220927.232810.940-financas','2023-03-04 11:44:34','1fc5b8c8fcdc7566529439910d739478'),(188,2,'20220927.232813.974-financas','2023-03-04 11:44:34','4b6ae1a6be899b63271f1f662edf75ac'),(189,2,'20220927.232817.010-financas','2023-03-04 11:44:34','2f4ad1786afb35476e4842f4b07b0d96'),(190,2,'20220927.232820.040-financas','2023-03-04 11:44:34','ccc31573bcdb15c7548675c6cd7ec927'),(191,2,'20220927.232823.062-financas','2023-03-04 11:44:34','21d506bf63c915df5c15de8deea41a2e'),(192,2,'20220927.232826.092-financas','2023-03-04 11:44:34','1b21773d49c5b3096a29068c6a5815d5'),(193,2,'20220927.232829.122-financas','2023-03-04 11:44:34','4f6fa135b0d1f09c88f085690dce3556'),(194,2,'20220927.232832.143-financas','2023-03-04 11:44:34','2389ac39f216af3468e7d10450be437f'),(195,2,'20220927.232835.174-financas','2023-03-04 11:44:34','f0865c9698f7036f9f8b7ee0e4e4d55b'),(196,2,'20220927.232838.193-financas','2023-03-04 11:44:34','12d69edf01e2a4e5d46dfc3992fa1842'),(197,2,'20220927.232841.224-financas','2023-03-04 11:44:34','f96f962934039c8b68996e7356cdfdfb'),(198,2,'20220927.232844.252-financas','2023-03-04 11:44:34','70cb886516cb39d14e50acb1954b06f1'),(199,2,'20220927.232847.290-financas','2023-03-04 11:44:34','af5b0a7f0d5663505f32a3741e30dfed'),(200,2,'20220927.232850.325-financas','2023-03-04 11:44:34','1fe411655f270de8b13b97fe29fad7b4'),(201,2,'20220927.232853.357-financas','2023-03-04 11:44:34','f43d7ab4e96549e1d4dac027f9960a75'),(202,2,'20220927.232856.391-financas','2023-03-04 11:44:34','f8291d2b88926ad3ae0f2eebe9cab8b9'),(203,2,'20220927.232859.421-financas','2023-03-04 11:44:34','d1578f6f2fb276647bed3b51ae5e45eb'),(204,2,'20220927.232902.454-financas','2023-03-04 11:44:34','4580ca6ce933780d3c0688ba59ad1b4f'),(205,2,'20220927.232905.477-financas','2023-03-04 11:44:34','5826e491f355118c0864313c9e1ed763'),(206,2,'20220927.232908.500-financas','2023-03-04 11:44:34','cfaf50d0b5465aa5a2761fe2a3caf6d9'),(207,2,'20220927.232911.522-financas','2023-03-04 11:44:34','c925c0b519827645a12de03446e5fe08'),(208,2,'20220927.232914.565-financas','2023-03-04 11:44:34','d814d2bba37a6d2bd269356c1f0beca2'),(209,2,'20220927.232917.598-financas','2023-03-04 11:44:34','bc64a8e7121378b91ccb9a76815053f9'),(210,2,'20220927.232920.621-financas','2023-03-04 11:44:34','2025112f31421f76a58005badf1c6353'),(211,2,'20220927.232923.657-financas','2023-03-04 11:44:34','b50d656042b0408291d34e07276b2066'),(212,2,'20220927.232926.695-financas','2023-03-04 11:44:34','3199c81d1c9e96686af70e19648bb0ed'),(213,2,'20220927.232929.719-financas','2023-03-04 11:44:34','b84b6de7d91be87256869e7826d9f778'),(214,2,'20220927.232932.746-financas','2023-03-04 11:44:34','90edce98e005715268a80e780fff7c49'),(215,2,'20220927.232935.782-financas','2023-03-04 11:44:34','2c116f2adc84363d666924cf3de38982'),(216,2,'20220927.232938.815-financas','2023-03-04 11:44:34','af11af3d41f03cebdbe0270a634f2ba5'),(217,2,'20220927.232941.849-financas','2023-03-04 11:44:34','33a051123975d16ff5cf59e483acc1f3'),(218,2,'20220927.232944.888-financas','2023-03-04 11:44:34','10cbc4cad7942c2034af83d9ab91e5dd'),(219,2,'20220927.232947.917-financas','2023-03-04 11:44:34','e36747f41cc26b998fd047767a3099ad'),(220,2,'20220927.232950.951-financas','2023-03-04 11:44:34','ff83b2c62e318f3c6143f961650d6579'),(221,2,'20220927.232953.974-financas','2023-03-04 11:44:34','88d12912efcd879eff0ddbf9172fbaaa'),(222,2,'20220927.232957.014-financas','2023-03-04 11:44:34','b605e06119e642411cd235162aedb969'),(223,2,'20220927.233000.051-financas','2023-03-04 11:44:34','52399452685c767e8243d8e7c5e855cd'),(224,2,'20220927.233003.079-financas','2023-03-04 11:44:34','0796f712a9b367e0ba9646d8b0ca8c64'),(225,2,'20220927.233006.103-financas','2023-03-04 11:44:34','1ab8dd2d481090be89a41a2a8b60baee'),(226,2,'20220927.233009.138-financas','2023-03-04 11:44:34','1a229da74ea32b0adbf5db1353287e87'),(227,2,'20220927.233012.173-financas','2023-03-04 11:44:34','3c1189ca20cc6814063316d322a0e9b1'),(228,2,'20220927.233015.214-financas','2023-03-04 11:44:34','9af25cc787b146765488e72c8f427d51'),(229,2,'20220927.233018.251-financas','2023-03-04 11:44:34','c7aee296f89d98501f1e41c52c4c7d99'),(230,2,'20220927.233021.285-financas','2023-03-04 11:44:34','6098efe1d002ca31eddb14d62fc30448'),(231,2,'20220927.233024.319-financas','2023-03-04 11:44:34','46563e6f139cdb17a35045e7abd138e9'),(232,2,'20220927.233027.356-financas','2023-03-04 11:44:34','87e638d8409a72dc23ea4b058360fe1e'),(233,2,'20220927.233030.384-financas','2023-03-04 11:44:34','4b4687449d4ed16173ec72b392774d81'),(234,2,'20220927.233033.418-financas','2023-03-04 11:44:34','885d439f92cef983fb1ff1e4f3f2da15'),(235,2,'20220927.233036.448-financas','2023-03-04 11:44:34','841f52ade7f0a92e116e2be74cc2b0db'),(236,2,'20220927.233039.475-financas','2023-03-04 11:44:34','e38766c79380497bedda86c234ed9895'),(237,2,'20220927.233042.508-financas','2023-03-04 11:44:34','69918607652d306102bcbc305f648dd8'),(238,2,'20220927.233045.537-financas','2023-03-04 11:44:34','2fd22469ac6e17810493ce690e174ced'),(239,2,'20220927.233048.574-financas','2023-03-04 11:44:34','6a7b55892da3a94fd99d7d4818b90d97'),(240,2,'20220927.233051.607-financas','2023-03-04 11:44:34','d10e089444159840f7c16533f86fbdd5'),(241,2,'20220927.233054.633-financas','2023-03-04 11:44:34','56de5d5ae94c33f0a8b9c143d5f41366'),(242,2,'20220927.233057.670-financas','2023-03-04 11:44:34','53b8f2bb053a0569719e4152ebe858c4'),(243,2,'20220927.233100.705-financas','2023-03-04 11:44:34','3547c4a5708f6c92b2cc9dfafc4f334b'),(244,2,'20220927.233103.739-financas','2023-03-04 11:44:34','87acc63251dbd03c2ceca69d905c99e6'),(245,2,'20220927.233106.773-financas','2023-03-04 11:44:34','2ce6f7d11a341bd0a77e3c8ee919bf0f'),(246,2,'20220927.233109.798-financas','2023-03-04 11:44:34','850c2d91e645d15b0527c6baffc96d31'),(247,2,'20220927.233112.826-financas','2023-03-04 11:44:34','b3dd1e01aa835f0f7b8e4f0601c5858a'),(248,2,'20220927.233115.869-financas','2023-03-04 11:44:34','98032ba437df99bc8de8c96a00084d71'),(249,2,'20220927.233118.907-financas','2023-03-04 11:44:34','a9d17e029128ed673d70c3cccffe37ec'),(250,2,'20220927.233121.950-financas','2023-03-04 11:44:34','a50beab7e7655f0ff72e56e08aa2db69'),(251,2,'20220927.233124.971-financas','2023-03-04 11:44:34','1bdac50ee5367faf375da628b3aab74b'),(252,2,'20220927.233127.996-financas','2023-03-04 11:44:34','fee2b8e76974f38c75943870bfa070ad'),(253,2,'20220927.233131.020-financas','2023-03-04 11:44:34','e1dc1e3f8fd6623d458f5b96ab4a613a'),(254,2,'20220927.233134.048-financas','2023-03-04 11:44:34','5db1d3f2f378ee08739d156e8949fdff'),(255,2,'20220927.233137.082-financas','2023-03-04 11:44:34','d15353f9fcde68baa33f5f6c7ca4be24'),(256,2,'20220927.233140.114-financas','2023-03-04 11:44:34','046553745f7e7d9e7956053dbdfa9911'),(257,2,'20220927.233143.138-financas','2023-03-04 11:44:34','d487f3c9ea001e0a438244e3af29f56b'),(258,2,'20220927.233146.165-financas','2023-03-04 11:44:34','761cf6e99aca1044e0e3828cd43f2f1c'),(259,2,'20220927.233149.197-financas','2023-03-04 11:44:34','85b466a00afe24fc5e8dcded0f3051e1'),(260,2,'20220927.233152.220-financas','2023-03-04 11:44:34','7125eae22b686311289f0d7e2315e1f2'),(261,2,'20220927.233155.254-financas','2023-03-04 11:44:34','6dd0c3f2112bc240e0ea90b8e80fa41f'),(262,2,'20220927.233158.293-financas','2023-03-04 11:44:34','3967a199bd8cef408fb2fe2f5cd701be'),(263,2,'20220927.233201.333-financas','2023-03-04 11:44:34','d356997ccd040d5c60c099c1646fac91'),(264,2,'20220927.233204.354-financas','2023-03-04 11:44:34','bbd34edbcf8fe23079488bcae6700a14'),(265,2,'20220927.233207.389-financas','2023-03-04 11:44:34','5038edef3ad22252f935c90676e34ca0'),(266,2,'20220927.233210.421-financas','2023-03-04 11:44:34','e46e263a76ebea9af31cf1e88ff3881e'),(267,2,'20220927.233213.451-financas','2023-03-04 11:44:34','576955e4746172c0f4652449b6e8ffce'),(268,2,'20220927.233216.484-financas','2023-03-04 11:44:34','5a424239c328accd29222fe2fc2e0dc2'),(269,2,'20220927.233219.516-financas','2023-03-04 11:44:34','4c6759ba8903eb38564ad2851fdde612'),(270,2,'20220927.233222.552-financas','2023-03-04 11:44:34','c0ddcad02ae3d6ebb4e17413dc839486'),(271,2,'20220927.233225.592-financas','2023-03-04 11:44:34','d245c69f2e0b798eba96e02cccbdc10e'),(272,2,'20220927.233228.620-financas','2023-03-04 11:44:34','4e19e18300c7cd63f2130fc96bc1aa30'),(273,2,'20220927.233231.649-financas','2023-03-04 11:44:34','625055bc98b7a0ccfc9b0646ea937f06'),(274,2,'20220927.233234.669-financas','2023-03-04 11:44:34','4d34913ed689c70d97d5ad4bdedad49c'),(275,2,'20220927.233237.700-financas','2023-03-04 11:44:34','39b383871792c8382edd3392d79932e9'),(276,2,'20220927.233240.741-financas','2023-03-04 11:44:34','feed844b69f0c3f4e6accd5a1c4ac905'),(277,2,'20220927.233243.772-financas','2023-03-04 11:44:34','190dd3a4e7fab2c84fb6247acc56d5cd'),(278,2,'20220927.233246.800-financas','2023-03-04 11:44:34','b435eae76dd366a929948a1b598fcf0e'),(279,2,'20220927.233249.833-financas','2023-03-04 11:44:34','d9ecc8343740dd7700600d6e605cfdfb'),(280,2,'20220927.233252.865-financas','2023-03-04 11:44:34','d23df872e84fa1ecbb9adcd62ce5fb98'),(281,2,'20220927.233255.902-financas','2023-03-04 11:44:34','019ecfef149412de207384037068c590'),(282,2,'20220927.233258.928-financas','2023-03-04 11:44:34','d90bad79c8760b104cd50ec687669ff6'),(283,2,'20220927.233301.965-financas','2023-03-04 11:44:34','0cd4200677eaa767897019e7633e8f91'),(284,2,'20220927.233304.995-financas','2023-03-04 11:44:34','fe73b2505008855895edf36fc81d3178'),(285,2,'20220927.233308.032-financas','2023-03-04 11:44:34','831a8e84f118eb03be4cbd55fddc8171'),(286,2,'20220927.233311.065-financas','2023-03-04 11:44:34','293e41937e5b0b21af8e79876aaf4fad'),(287,2,'20220927.233314.087-financas','2023-03-04 11:44:34','1b31d190ed24af04556ee46dc538312b'),(288,2,'20220927.233317.123-financas','2023-03-04 11:44:34','a406b328cc48c2137268df2ab3f0940c'),(289,2,'20220927.233320.152-financas','2023-03-04 11:44:34','a3a7c0b409475c022c06e5cc60806f07'),(290,2,'20220927.233323.176-financas','2023-03-04 11:44:34','d7cdb917d87f033c8bc3b668d4ec2c51'),(291,2,'20220927.233326.216-financas','2023-03-04 11:44:34','e41248d7b6ee4b70bf26a57588391fdc'),(292,2,'20220927.233329.250-financas','2023-03-04 11:44:34','08adafbf4c57385d0879e44e02715925'),(293,2,'20220927.233332.286-financas','2023-03-04 11:44:34','6ae95699fcf63698b4638326ab4675f6'),(294,2,'20220927.233335.309-financas','2023-03-04 11:44:34','b8fc88d69d0f15adc36e6445d2be4e9e'),(295,2,'20220927.233338.333-financas','2023-03-04 11:44:34','79b2ff04cefbdbdf4608c0510e2e9527'),(296,2,'20220927.233341.370-financas','2023-03-04 11:44:34','6ec76e70cb487603e7bc3a885cb935a4'),(297,2,'20220927.233344.403-financas','2023-03-04 11:44:34','bdb31c9eb7fc15a27fed2ece18b47950'),(298,2,'20220927.233347.437-financas','2023-03-04 11:44:34','157c2e70ba1e58d7dd48fe3bab7a42ee'),(299,2,'20220927.233350.473-financas','2023-03-04 11:44:34','5cacb42c57200dd5fd7a5753465fafb0'),(300,2,'20220927.233353.505-financas','2023-03-04 11:44:34','8387388e039fb2f696c4a08b27c7ebc3'),(301,2,'20220927.233356.539-financas','2023-03-04 11:44:34','5b1f96163a75790ae2a96cb2c9378243'),(302,2,'20220927.233359.570-financas','2023-03-04 11:44:34','b525a195ea2bc8893e0af692ede4f899'),(303,2,'20220927.233402.594-financas','2023-03-04 11:44:34','5e716079b7739406ed9b5d287637068a'),(304,2,'20220927.233405.621-financas','2023-03-04 11:44:34','65c222cc5beb684382f0fe1becda4a6d'),(305,2,'20220927.233408.650-financas','2023-03-04 11:44:34','ab7098134fc1cc63cf954568a254246d'),(306,2,'20220927.233411.675-financas','2023-03-04 11:44:34','28dc67213c10949b95179f7929c46c80'),(307,2,'20220927.233414.710-financas','2023-03-04 11:44:34','d393f4f22b2900092786dba5dc1b5289'),(308,2,'20220927.233417.737-financas','2023-03-04 11:44:34','3296fa2278d7043f3d67ea5bfaf469a6'),(309,2,'20220927.233420.764-financas','2023-03-04 11:44:34','18c5756036f396b0813a0f2cbe203cd1'),(310,2,'20220927.233423.788-financas','2023-03-04 11:44:34','9f0af661177cf29159942a1d734d5b14'),(311,2,'20220927.233426.817-financas','2023-03-04 11:44:34','a1b2ce72905ea6ab2f437af836e20a25'),(312,2,'20220927.233429.843-financas','2023-03-04 11:44:34','cbb76eb138367cf01406ae3a4606d8aa'),(313,2,'20220927.233432.871-financas','2023-03-04 11:44:34','a7f68c12fbbc5d14aebabf00f47f788f'),(314,2,'20220927.233435.901-financas','2023-03-04 11:44:34','74f60693d61d6f7fe480c09c350af40e'),(315,2,'20220927.233438.928-financas','2023-03-04 11:44:34','4b9cf9417f39687fa0194dd995f6b0ee'),(316,2,'20220927.233441.956-financas','2023-03-04 11:44:34','2b14365e9dfe974e6bd4cc2af5f81788'),(317,2,'20220927.233444.994-financas','2023-03-04 11:44:34','7df0db3b012ca3ed3535c42f275c725b'),(318,2,'20220927.233448.030-financas','2023-03-04 11:44:34','d5ec1bc5bc6ffa2fea458976e4d9d214'),(319,2,'20220927.233451.058-financas','2023-03-04 11:44:34','fd74f2faf9fbd4bacfca8b76cfa03111'),(320,2,'20220927.233454.093-financas','2023-03-04 11:44:34','bd94542202010a25207142e2ea9a5f5a'),(321,2,'20220927.233457.121-financas','2023-03-04 11:44:34','dd2da72eea1e3bb1231d5ea33fc4f05f'),(322,2,'20220927.233500.160-financas','2023-03-04 11:44:34','5b988e1b970b57c21ed5237a5502269e'),(323,2,'20220927.233503.188-financas','2023-03-04 11:44:34','967a8ed6d27a246ff7c3ea2d88fdf090'),(324,2,'20220927.233506.220-financas','2023-03-04 11:44:34','6aa7548b36d118655a35525fd463b5dd'),(325,2,'20220927.233509.252-financas','2023-03-04 11:44:34','1f9bc9d3e138d40a7a51ef227f6e40c3'),(326,2,'20220927.233512.279-financas','2023-03-04 11:44:34','2753e8f4326876bd48ad3df8938620f3'),(327,2,'20220927.233515.317-financas','2023-03-04 11:44:34','14fa39562468b923169f025c7aa8adc9'),(328,2,'20220927.233518.346-financas','2023-03-04 11:44:34','f6735d6939d8e84a4400f1973dc6d8e8'),(329,2,'20220927.233521.383-financas','2023-03-04 11:44:34','fed7b1daaec0fadc8a78757f611a8a2e'),(330,2,'20220927.233524.416-financas','2023-03-04 11:44:34','d6d8f291d7c3c83d32a7652b50769048'),(331,2,'20220927.233527.451-financas','2023-03-04 11:44:34','bf3da4a37b4888a1f81aba61b970bf9b'),(332,2,'20220927.233530.482-financas','2023-03-04 11:44:34','b8b2c902eff25536cb64f854d0e9d85e'),(333,2,'20220927.233533.508-financas','2023-03-04 11:44:34','fe6d46fe5b58059e79a9f0ed0bc359ac'),(334,2,'20220927.233536.538-financas','2023-03-04 11:44:34','062723c05eaed642ab93198b163a87c2'),(335,2,'20220927.233539.570-financas','2023-03-04 11:44:34','970c34165fa7d8a7e0305ae9c4e45a49'),(336,2,'20220927.233542.602-financas','2023-03-04 11:44:34','dba6ddd71b87ef68116e44019352fec9'),(337,2,'20220927.233545.635-financas','2023-03-04 11:44:34','d2057b881e8aedd8814010a66abc1deb'),(338,2,'20220927.233548.663-financas','2023-03-04 11:44:34','0ea184bb76679d90229b56ad7f31975c'),(339,2,'20220927.233551.702-financas','2023-03-04 11:44:34','5e761913d5f80a3d2ed0a78dcd1e4d75'),(340,2,'20220927.233554.731-financas','2023-03-04 11:44:34','0eea80aaa21cbf554ec6516a0452928d'),(341,2,'20220927.233557.763-financas','2023-03-04 11:44:34','0455c42ecc4bcb0c3371fd9601890207'),(342,2,'20220927.233600.787-financas','2023-03-04 11:44:34','2b8b1f44d7ff0da2e85ad29b6a9d98a4'),(343,2,'20220927.233603.828-financas','2023-03-04 11:44:34','209dd4733e91681688b067b7cdbeb1a9'),(344,2,'20220927.233606.856-financas','2023-03-04 11:44:34','86dcec69657219899e0f6e528a5ff405'),(345,2,'20220927.233609.882-financas','2023-03-04 11:44:34','2864d37073f72636f22feebad763412c'),(346,2,'20220927.233612.916-financas','2023-03-04 11:44:34','4534603671527e05b668accada71532a'),(347,2,'20220927.233615.956-financas','2023-03-04 11:44:34','769dc6a4fa897d4aa15484913f475628'),(348,2,'20220927.233618.986-financas','2023-03-04 11:44:34','9c98a4ca9a265d6fd1e35cd9fa822a90'),(349,2,'20220927.233622.014-financas','2023-03-04 11:44:34','57683cda5521b7b36c37fede11fe19ff'),(350,2,'20220927.233625.042-financas','2023-03-04 11:44:34','d600fbebecb2be2ad256785a603d3dce'),(351,2,'20220927.233628.079-financas','2023-03-04 11:44:34','e79b34a03d181cb61d6f8fe984b3ec34'),(352,2,'20220927.233631.113-financas','2023-03-04 11:44:34','e9efdbc5b52a6fe2cc04c71c1d8c1eba'),(353,2,'20220927.233634.148-financas','2023-03-04 11:44:34','d191760e6c93aced764847dc00ae9205'),(354,2,'20220927.233637.174-financas','2023-03-04 11:44:34','75bcc358cf0ba24c5ef3842576f495fe'),(355,2,'20220927.233640.203-financas','2023-03-04 11:44:34','375bdca8f89e4f7544c1132bda2426e4'),(356,2,'20220927.233643.239-financas','2023-03-04 11:44:34','a932a6d81600d699bc1e77f22bb30f23'),(357,2,'20220927.233646.274-financas','2023-03-04 11:44:34','32e74813ecc85214416196affa5e8af5'),(358,2,'20220927.233649.314-financas','2023-03-04 11:44:34','5a2de9523985a009201d5cd143ff0236'),(359,2,'20220927.233652.341-financas','2023-03-04 11:44:34','c51145512bae45622d3296a30ff605f5'),(360,2,'20220927.233655.369-financas','2023-03-04 11:44:34','bacb7e3f76c182592bd44efcbe18fb5d'),(361,2,'20220927.233658.406-financas','2023-03-04 11:44:34','9aa13760bed4a95b0e944e8c8ee7c8c3'),(362,2,'20220927.233701.434-financas','2023-03-04 11:44:34','df4d1f4a19d78d7882f699796047e60d'),(363,2,'20220927.233704.470-financas','2023-03-04 11:44:34','0b0321bde31b71735b2c8bcf1e50f458'),(364,2,'20220927.233707.503-financas','2023-03-04 11:44:34','3f3cf9708a6afb0ff8222001e62d7255'),(365,2,'20220927.233710.545-financas','2023-03-04 11:44:34','6163780cad54ecd3e78fcc233ad6c214'),(366,2,'20220927.233713.585-financas','2023-03-04 11:44:34','1d20a1faeb841fa832c0fb27820fdabc'),(367,2,'20220927.233716.615-financas','2023-03-04 11:44:34','97bc9f39d40afb864f14d5ba57b8f882'),(368,2,'20220927.233719.646-financas','2023-03-04 11:44:34','25f7ea11bf2b30e148e07477c5cae3c2'),(369,2,'20220927.233722.675-financas','2023-03-04 11:44:34','522e00123aff37191d35e9c135bdbbff'),(370,2,'20220927.233725.702-financas','2023-03-04 11:44:34','c18b8fd502414de5fde433eff7ccfa66'),(371,2,'20220927.233728.733-financas','2023-03-04 11:44:34','3aaf66f58488b22fc48004325d681e3d'),(372,2,'20220927.233731.770-financas','2023-03-04 11:44:34','17301fa3652ed1aabfbb37b4236b4d86'),(373,2,'20220927.233734.803-financas','2023-03-04 11:44:34','6810b389dad44524ac7ab5710337ca3f'),(374,2,'20220927.233737.839-financas','2023-03-04 11:44:34','e439b33864362182c875023762f7e373'),(375,2,'20220927.233740.871-financas','2023-03-04 11:44:34','b56d9431ec85a0dcb471a94a1f8374a6'),(376,2,'20220927.233743.907-financas','2023-03-04 11:44:34','6d42425dba23e8411dd0726df9359a40'),(377,2,'20220927.233746.934-financas','2023-03-04 11:44:34','a59f21587da68899f386e0af8907bf06'),(378,2,'20220927.233749.963-financas','2023-03-04 11:44:34','75cd634753e0df19937a9a2de917ce02'),(379,2,'20220927.233753.003-financas','2023-03-04 11:44:34','ccf0636f817a0c8c7b319a85b5877948'),(380,2,'20220927.233756.033-financas','2023-03-04 11:44:34','e54488f65d2c87e38b5a0a3c18f59ca9'),(381,2,'20220927.233759.067-financas','2023-03-04 11:44:34','043465f8a6fd865c9d7490f68acdf180'),(382,2,'20220927.233802.099-financas','2023-03-04 11:44:34','f72b36b4b7149bc1097a326df06e5564'),(383,2,'20220927.233805.139-financas','2023-03-04 11:44:34','4ec4084888b835713962355d00070e9c'),(384,2,'20220927.233808.164-financas','2023-03-04 11:44:34','c44ac8238582f5b0793fab46007824db'),(385,2,'20220927.233811.192-financas','2023-03-04 11:44:34','e1909ab0612f7756cf2e4a387c25c453'),(386,2,'20220927.233814.222-financas','2023-03-04 11:44:34','896f2dd8691a5984a2ed5c3a266f49ef'),(387,2,'20220927.233817.252-financas','2023-03-04 11:44:34','5106bddef321863b4da6a867dbdf6557'),(388,2,'20220927.233820.280-financas','2023-03-04 11:44:34','15df777cb878d39fda4c2e9c4ca8b2a2'),(389,2,'20220927.233823.308-financas','2023-03-04 11:44:34','352c58c2b6e593a22830da279d8f3561'),(390,2,'20220927.233826.348-financas','2023-03-04 11:44:34','3d6cba9a8908947e135f683d0e73903c'),(391,2,'20220927.233829.388-financas','2023-03-04 11:44:34','f926c68235c35573604362405873c236'),(392,2,'20220927.233832.426-financas','2023-03-04 11:44:34','94f79de3c8db59b5fee7fd842722f0c9'),(393,2,'20220927.233835.452-financas','2023-03-04 11:44:34','3b57974a8a1c988b0a1fd211baa51adb'),(394,2,'20220927.233838.483-financas','2023-03-04 11:44:34','a874b625d4ee701673b19947646b3bf6'),(395,2,'20220927.233841.510-financas','2023-03-04 11:44:34','3d72f418d587dae7ba2e3a597434f955'),(396,2,'20220927.233844.540-financas','2023-03-04 11:44:34','2a16097f3d758c02e0a5979c1cbe6c18'),(397,2,'20220927.233847.567-financas','2023-03-04 11:44:34','832f5fbdfb9cee73cf0d45e4685bfc74'),(398,2,'20220927.233850.604-financas','2023-03-04 11:44:34','36d80824f442a71090b61715ac45075a'),(399,2,'20220927.233853.626-financas','2023-03-04 11:44:34','f4191eddeb20a6199fb8abf99ccfcb60'),(400,2,'20220927.233856.660-financas','2023-03-04 11:44:34','e43fa109e5c9487e0f7079662a68f00f'),(401,2,'20220927.233859.698-financas','2023-03-04 11:44:34','7b8f8c42a1a24ce8af74f1a560b1c4f1'),(402,2,'20220927.233902.727-financas','2023-03-04 11:44:34','e2e7926e2a3d51ecfd43255bda64ed6a'),(403,2,'20220927.233905.755-financas','2023-03-04 11:44:34','a5e89db1c01542980416dcb9a3d3438f'),(404,2,'20220927.233908.783-financas','2023-03-04 11:44:34','d801d135da11fb52149b8e844f85dce9'),(405,2,'20220927.233911.822-financas','2023-03-04 11:44:34','6d990b170a0dbc8fccde8a5b421be801'),(406,2,'20220927.233914.848-financas','2023-03-04 11:44:34','23504e021f5a495a962cd8937583c8f8'),(407,2,'20220927.233917.883-financas','2023-03-04 11:44:34','d8df98ee5aa0842c668e556f787734f7'),(408,2,'20220927.233920.911-financas','2023-03-04 11:44:34','24b8dbcc06aa1918426c7c6021555460'),(409,2,'20220927.233923.943-financas','2023-03-04 11:44:34','d0e2660fb98f61c22a9ab7a35142804b'),(410,2,'20220927.233926.980-financas','2023-03-04 11:44:34','6487099b12ffdff27deaaac8b748f56e'),(411,2,'20220927.233930.002-financas','2023-03-04 11:44:34','30db65e310ed541f2983fd7221e9a9e3'),(412,2,'20220927.233933.033-financas','2023-03-04 11:44:34','07231fd5dcc49f2014d4b6b620005347'),(413,2,'20220927.233936.059-financas','2023-03-04 11:44:34','770eb7774c9e3539ccdbf5f018bc67fc'),(414,2,'20220927.233939.083-financas','2023-03-04 11:44:34','3365bec788af14720e2122eb4f897528'),(415,2,'20220927.233942.114-financas','2023-03-04 11:44:34','ac057496221775f944d06dc51cf8a8fb'),(416,2,'20220927.233945.146-financas','2023-03-04 11:44:34','653bc69f18ad3280ce56d06ea8470dae'),(417,2,'20220927.233948.182-financas','2023-03-04 11:44:34','4977446c03078719e6f5fd9cb3744f37'),(418,2,'20220927.233951.214-financas','2023-03-04 11:44:34','50b623c18c8bea9775a839c793d55ab3'),(419,2,'20220927.233954.246-financas','2023-03-04 11:44:34','df2d526fa3c794a89b0af563298884d1'),(420,2,'20220927.233957.277-financas','2023-03-04 11:44:34','3a7188bf3b1502513755b486b2a7207c'),(421,2,'20220927.234000.314-financas','2023-03-04 11:44:34','9ddb9c9870df72fe22e65fed3c2a3f31'),(422,2,'20220927.234003.355-financas','2023-03-04 11:44:34','01df2881d161893de75e5be73c710316'),(423,2,'20220927.234006.387-financas','2023-03-04 11:44:34','0e64159d8f45184dea11d4654bf4a993'),(424,2,'20220927.234009.422-financas','2023-03-04 11:44:34','94017cc172db4f6b726bc9ffe9f91ff1'),(425,2,'20220927.234012.459-financas','2023-03-04 11:44:34','fff33108f59e57b71d20905a3643d7b1'),(426,2,'20220927.234015.492-financas','2023-03-04 11:44:34','b3933de21bcd2a774af4ba3f982b3b28'),(427,2,'20220927.234018.526-financas','2023-03-04 11:44:34','7511a370e95aae5fd7365e5e2586abdf'),(428,2,'20220927.234021.564-financas','2023-03-04 11:44:34','966571a732fc24b97e835953ea6286e5'),(429,2,'20220927.234024.597-financas','2023-03-04 11:44:34','106e688cc50ab8fa260066534b05c9c7'),(430,2,'20220927.234027.624-financas','2023-03-04 11:44:34','2592958e60f3bdd2691f1b7db355c3b7'),(431,2,'20220927.234030.652-financas','2023-03-04 11:44:34','6047f46440fee8670ecdd9495c792b1d'),(432,2,'20220927.234033.680-financas','2023-03-04 11:44:34','7e418d4c3430257dac8aedf363332e09'),(433,2,'20220927.234036.716-financas','2023-03-04 11:44:34','f764d1cd02e502bad13aba11570909cc'),(434,2,'20220927.234039.750-financas','2023-03-04 11:44:34','83a1f95d883375f461b87f3ad06f7e1a'),(435,2,'20220927.234042.783-financas','2023-03-04 11:44:34','56f4c2ec3f3e51bcdf015faaa4d6dfaf'),(436,2,'20220927.234045.824-financas','2023-03-04 11:44:34','a8a05faf57c93c65d8ebead4016a9850'),(437,2,'20220927.234048.861-financas','2023-03-04 11:44:34','860f64c0c4c0500d4c307805d2b71d53'),(438,2,'20220927.234051.896-financas','2023-03-04 11:44:34','6eb81190b3102793fc617b14e5c020b9'),(439,2,'20220927.234054.919-financas','2023-03-04 11:44:34','09ba79dbe3371959380f76977e420e3f'),(440,2,'20220927.234057.948-financas','2023-03-04 11:44:34','7045335fbc649da4fafb10b3fe5c1c98'),(441,2,'20220927.234100.982-financas','2023-03-04 11:44:34','1db2390e9ed3e654fe3f29ae661211ca'),(442,2,'20220927.234104.009-financas','2023-03-04 11:44:34','4f1f21fb04a9cb1e93888498d18395e1'),(443,2,'20220927.234107.042-financas','2023-03-04 11:44:34','a10e0240684fbacb25198478f721875d'),(444,2,'20220927.234110.074-financas','2023-03-04 11:44:34','5b11a613c9c8fa6e01ccb289e58e23d4'),(445,2,'20220927.234113.111-financas','2023-03-04 11:44:34','426dafaa42724b2f3ce312824307caab'),(446,2,'20220927.234116.143-financas','2023-03-04 11:44:34','93d085d06152cbcb0a322bfa26eef9f5'),(447,2,'20220927.234119.177-financas','2023-03-04 11:44:34','fe970c3213cc9f00dc0607e0700d4d54'),(448,2,'20220927.234122.223-financas','2023-03-04 11:44:34','fcde5f6246e85e7d18102754e3cd01f9'),(449,2,'20220927.234125.250-financas','2023-03-04 11:44:34','7b36ea4bab241ddf34a6a7ce3a34345c'),(450,2,'20220927.234128.279-financas','2023-03-04 11:44:34','d5241ee150bd197ae71d559fa259be0c'),(451,2,'20220927.234131.309-financas','2023-03-04 11:44:34','d4301f2f7e0a869ceb93c0f7c39784c6'),(452,2,'20220927.234134.344-financas','2023-03-04 11:44:34','276c0a9bf6679806a4efb8efa10f6267'),(453,2,'20220927.234137.383-financas','2023-03-04 11:44:34','0baa59c8d3a22b1e08ed4c673e733d76'),(454,2,'20220927.234140.415-financas','2023-03-04 11:44:34','31522b8c87b02a61c905b699223d9e2c'),(455,2,'20220927.234143.438-financas','2023-03-04 11:44:34','b7af1924c207fc7456717ef9db00aec2'),(456,2,'20220927.234146.463-financas','2023-03-04 11:44:34','64a7313e1d7763851052c421ab2ddabd'),(457,2,'20220927.234149.499-financas','2023-03-04 11:44:34','84d62da375d5826d25a178998760e406'),(458,2,'20220927.234152.529-financas','2023-03-04 11:44:34','784d55edd917d31d696df80d295d862d'),(459,2,'20220927.234155.560-financas','2023-03-04 11:44:34','6cabba2bf75661d70e190963d2cee04e'),(460,2,'20220927.234158.602-financas','2023-03-04 11:44:34','a9b7e18330c05035e51f0e00fcbfff48'),(461,2,'20220927.234201.632-financas','2023-03-04 11:44:34','a4f4abda8e8a84e3de520062bf66c5da'),(462,2,'20220927.234204.659-financas','2023-03-04 11:44:34','8ea9438df2768b6e4abcd4677c9dc834'),(463,2,'20220927.234207.685-financas','2023-03-04 11:44:34','67894bff5a6130e0ae0b080354a90ed4'),(464,2,'20220927.234210.720-financas','2023-03-04 11:44:34','91067837465ca1c9832c5e40c60d630a'),(465,2,'20220927.234213.750-financas','2023-03-04 11:44:34','c4dc4331d0b1c05bd2432a3491437417'),(466,2,'20220927.234216.790-financas','2023-03-04 11:44:34','ce0a07b4d9e4b36013e134962a6a0829'),(467,2,'20220927.234219.817-financas','2023-03-04 11:44:34','5e342c3020a156576f4c563e0a9106ef'),(468,2,'20220927.234222.846-financas','2023-03-04 11:44:34','f1642160201fc14d0911753ccd3a1ac9'),(469,2,'20220927.234225.877-financas','2023-03-04 11:44:34','0d4ea84196a022ef6549a0cca4e407b3'),(470,2,'20220927.234228.905-financas','2023-03-04 11:44:34','91e4c70c190a9dcbb75dbd6761f1fef9'),(471,2,'20220927.234231.935-financas','2023-03-04 11:44:34','d6f83e4ab284f10c2be70bc439be1503'),(472,2,'20220927.234234.973-financas','2023-03-04 11:44:34','931681bbf4e90ef603ec3321d57bb0b0'),(473,2,'20220927.234237.995-financas','2023-03-04 11:44:34','9e5dfa058ce9f94c70b8c2436ba20ea4'),(474,2,'20220927.234241.022-financas','2023-03-04 11:44:34','d987ec55316391882c7e25ef9b0e51c7'),(475,2,'20220927.234244.049-financas','2023-03-04 11:44:34','a2af09cf811da4a67e1a00885b4d838a'),(476,2,'20220927.234247.072-financas','2023-03-04 11:44:34','c788fcb2697b02adf17c6954c664d609'),(477,2,'20220927.234250.102-financas','2023-03-04 11:44:34','1764bb3d44b1f4b15e584ab9429a9fc6'),(478,2,'20220927.234253.132-financas','2023-03-04 11:44:34','d5a2009d37481f5106b5f51960b6ad0c'),(479,2,'20220927.234256.154-financas','2023-03-04 11:44:34','e1e9014f1ec0c6ea962db1d2140bfcc5'),(480,2,'20220927.234259.185-financas','2023-03-04 11:44:34','33dafed4b20229027de6a857c961a908'),(481,2,'20220927.234302.226-financas','2023-03-04 11:44:34','9e0227ec08edb0aeeb91403121ac37f7'),(482,2,'20220927.234305.266-financas','2023-03-04 11:44:34','b1c475bb026b5d463ccaf928478f29f0'),(483,2,'20220927.234308.285-financas','2023-03-04 11:44:34','bebb14b3734edf45146ff696ec32f502'),(484,2,'20220927.234311.309-financas','2023-03-04 11:44:34','c725d8d54f9be70cb3993e70854244f8'),(485,2,'20220927.234314.346-financas','2023-03-04 11:44:34','e889e25e46b1d7f9edc0960dfd696da7'),(486,2,'20220927.234317.371-financas','2023-03-04 11:44:34','7ac25694c89aa4696ba918f31515fd45'),(487,2,'20220927.234320.407-financas','2023-03-04 11:44:34','f7d793a184f57e5559a897dc6e83a4dc'),(488,2,'20220927.234323.442-financas','2023-03-04 11:44:34','73a36125f6d6a694c256daf2afd6429e'),(489,2,'20220927.234326.470-financas','2023-03-04 11:44:34','482e07aa8a15af58f12e5391845fe132'),(490,2,'20220927.234329.500-financas','2023-03-04 11:44:34','c9c7b43bb73b990eeb110cdf4fa62621'),(491,2,'20220927.234332.536-financas','2023-03-04 11:44:34','bcdba3063f0883480e02eb051e897b4f'),(492,2,'20220927.234335.565-financas','2023-03-04 11:44:34','44cf240239a6d3daf666d0287bdb691a'),(493,2,'20220927.234338.589-financas','2023-03-04 11:44:34','bc5f65a4892440d7d7fb7cc670b5c762'),(494,2,'20220927.234341.613-financas','2023-03-04 11:44:34','5e08a4f296d9e1c5a5be7674244dc066'),(495,2,'20220927.234344.648-financas','2023-03-04 11:44:34','c16ee56f67bcf611098acef02b3432cc'),(496,2,'20220927.234347.686-financas','2023-03-04 11:44:34','975c4632712479cf0984f041839c9867'),(497,2,'20220927.234350.718-financas','2023-03-04 11:44:34','10003aa197e32cf7e69428daa556910e'),(498,2,'20220927.234353.754-financas','2023-03-04 11:44:34','9bb7a4571a041ddd0cf0fc49dea689b9'),(499,2,'20220927.234356.786-financas','2023-03-04 11:44:34','d0a52d52c1fef50d99e4ca3e07801fb5'),(500,2,'20220927.234359.815-financas','2023-03-04 11:44:34','90ad7a6685fee79e0f61faaea5b4a031'),(501,2,'20220927.234402.850-financas','2023-03-04 11:44:34','1b0c4527cf0bab67fd953debcd9a48bc'),(502,2,'20220927.234405.879-financas','2023-03-04 11:44:34','d23310b3c95a6c06d69236e1bf385487'),(503,2,'20220927.234408.909-financas','2023-03-04 11:44:34','c6ba9bdaa2a1e9b21bfff1aff3340bcd'),(504,2,'20220927.234411.945-financas','2023-03-04 11:44:34','cbcceaa12973e8cd667cc705983a5aa4'),(505,2,'20220927.234414.973-financas','2023-03-04 11:44:34','4e24717143f714eb327bbe8adcfe87e0'),(506,2,'20220927.234418.005-financas','2023-03-04 11:44:34','5bbca9a93ceafc66f49c2577446e9bc9'),(507,2,'20220927.234421.033-financas','2023-03-04 11:44:34','8ed34d599beb09e2c4c06ac9a1f810a9'),(508,2,'20220927.234424.053-financas','2023-03-04 11:44:34','73619714d7ddef887c933a022c884cf4'),(509,2,'20220927.234427.086-financas','2023-03-04 11:44:34','848593777af3ab178c26ee57d074b2a4'),(510,2,'20220927.234430.124-financas','2023-03-04 11:44:34','20d3b27823840f8be3a64148d32605cc'),(511,2,'20220927.234433.150-financas','2023-03-04 11:44:34','5be75ccf141039f2824f9446c8a70ede'),(512,2,'20220927.234436.187-financas','2023-03-04 11:44:34','4d2790fc91c41bcc0adb6c681fea69b4'),(513,2,'20220927.234439.218-financas','2023-03-04 11:44:34','197df0db96984d22ef6d749e686d2fc8'),(514,2,'20220927.234442.242-financas','2023-03-04 11:44:34','fe15843932c174a284a2456df9d2f2a9'),(515,2,'20220927.234445.280-financas','2023-03-04 11:44:34','295a17e6fb60e4c8ec94c9ae20f1cf1e'),(516,2,'20220927.234448.302-financas','2023-03-04 11:44:34','81cfa4f9cf91012662bc958f7a398822'),(517,2,'20220927.234451.337-financas','2023-03-04 11:44:34','1812a2bc35254cc05b8483de9b72c94c'),(518,2,'20220927.234454.363-financas','2023-03-04 11:44:34','68f7661070821a1cb058cf7c33134d1c'),(519,2,'20220927.234457.399-financas','2023-03-04 11:44:34','e53030ee94fbb0fd8ad3ef405288cf39'),(520,2,'20220927.234500.428-financas','2023-03-04 11:44:34','7e4f5046e63d3914319b94f56c6bbb72'),(521,2,'20220927.234503.466-financas','2023-03-04 11:44:34','cda86fb9c968ca17b2e136f042fc8e56'),(522,2,'20220927.234506.492-financas','2023-03-04 11:44:34','01013fa780e4d549daba4c8af1cea222'),(523,2,'20220927.234509.515-financas','2023-03-04 11:44:34','8fd25680d72dcef4117eb32838492b0d'),(524,2,'20220927.234512.544-financas','2023-03-04 11:44:34','92e89eaf11441c663dccd3f857848654'),(525,2,'20220927.234515.573-financas','2023-03-04 11:44:34','68330405fdc7462735202212e5c3abdb'),(526,2,'20220927.234518.607-financas','2023-03-04 11:44:34','3f8333d7459d2e7eb9843dc026291038'),(527,2,'20220927.234521.650-financas','2023-03-04 11:44:34','a052c973a510d463b9d4e7cf2c1e057c'),(528,2,'20220927.234524.691-financas','2023-03-04 11:44:34','2ebec118067527d1e2bc271e50af177a'),(529,2,'20220927.234527.727-financas','2023-03-04 11:44:34','3121a70ef3b1ca34c46b8d44cc4b7c9f'),(530,2,'20220927.234530.755-financas','2023-03-04 11:44:34','858701437f6548238b62a7108474db27'),(531,2,'20220927.234533.783-financas','2023-03-04 11:44:34','0ef1d3387ac3b4e36091d6f7452e3209'),(532,2,'20220927.234536.811-financas','2023-03-04 11:44:34','3ce4f87fa4c18dea0e991b54586a4fb6'),(533,2,'20220927.234539.840-financas','2023-03-04 11:44:34','292fc7d3e41f110558dec567f89d9f3b'),(534,2,'20220927.234542.875-financas','2023-03-04 11:44:34','fcb9142b3b231a72a8be62b964d9c55f'),(535,2,'20220927.234545.915-financas','2023-03-04 11:44:34','0d127036cc5ba9266c1843f254b28fb1'),(536,2,'20220927.234548.943-financas','2023-03-04 11:44:34','21055daf262b3f4400cccfa8959b06c2'),(537,2,'20220927.234551.965-financas','2023-03-04 11:44:34','8a99838ca1ff61c89af7be96df223047'),(538,2,'20220927.234554.999-financas','2023-03-04 11:44:34','618dc247b67cafecdfc75e2602acfdd8'),(539,2,'20220927.234558.033-financas','2023-03-04 11:44:34','a64687d01d45d91a65cec4caf16ce09d'),(540,2,'20220927.234601.061-financas','2023-03-04 11:44:34','f52b99563e03dfd625206623dc533798'),(541,2,'20220927.234604.087-financas','2023-03-04 11:44:34','4dd3418733a1df173bff0b40a0c82e74'),(542,2,'20220927.234607.113-financas','2023-03-04 11:44:34','cdc73d5f7eccaa8bc4f9f6277838533f'),(543,2,'20220927.234610.142-financas','2023-03-04 11:44:34','5bb267f2c3fd0e60490484f270b7588a'),(544,2,'20220927.234613.167-financas','2023-03-04 11:44:34','bab2bdf2758df3bec6bbc34e0fb701d9'),(545,2,'20220927.234616.199-financas','2023-03-04 11:44:34','7c43fdcc727b5a0d5ff5dd01ae945d1e'),(546,2,'20220927.234619.225-financas','2023-03-04 11:44:34','da61e80d22c12ccdaa5835e463fb387c'),(547,2,'20220927.234622.260-financas','2023-03-04 11:44:34','bffa0aa2879a1994447ab7ffbd77c3bd'),(548,2,'20220927.234625.281-financas','2023-03-04 11:44:34','e2490a7af2f7057de19bbbf3200dac83'),(549,2,'20220927.234628.310-financas','2023-03-04 11:44:34','6da350983bc3ff8300a0ed17ce1461cc'),(550,2,'20220927.234631.345-financas','2023-03-04 11:44:34','6dc531894b881ed16a4c569945197fc2'),(551,2,'20220927.234634.367-financas','2023-03-04 11:44:34','ca14812a8cce9960766fbd2be9d1a1fe'),(552,2,'20220927.234637.395-financas','2023-03-04 11:44:34','04aef5e7e864cc48c8e4d4c0591a1479'),(553,2,'20220927.234640.433-financas','2023-03-04 11:44:34','f5b164185da8d9acc271ec40abcfd59b'),(554,2,'20220927.234643.466-financas','2023-03-04 11:44:34','fa8287c7d1e83ecc2023db9c572df483'),(555,2,'20220927.234646.499-financas','2023-03-04 11:44:34','d2565423a48bcf516bc1ebc12cad2fdd'),(556,2,'20220927.234649.531-financas','2023-03-04 11:44:34','1f85f333a577a05e3d28d719b3b9be21'),(557,2,'20220927.234652.558-financas','2023-03-04 11:44:34','34e148728f380d451815b7011da8e8fb'),(558,2,'20220927.234655.593-financas','2023-03-04 11:44:34','7881bce04142611d546d11fafd9da9cc'),(559,2,'20220927.234658.628-financas','2023-03-04 11:44:34','17db42809aa397f9be70f113ca6ad7eb'),(560,2,'20220927.234701.655-financas','2023-03-04 11:44:34','1bee348c831bedc84f8f52d1fb974e18'),(561,2,'20220927.234704.694-financas','2023-03-04 11:44:34','40d366ce498b26f4ea098a24b5437bfe'),(562,2,'20220927.234707.731-financas','2023-03-04 11:44:34','3e11ceebc4c130ad864e1db1831e21f1'),(563,2,'20220927.234710.762-financas','2023-03-04 11:44:34','36e424e7d6aad52d8d58c0ba7a284d99'),(564,2,'20220927.234713.798-financas','2023-03-04 11:44:34','ee328ce3c3824926bdb220e2190cee38'),(565,2,'20220927.234716.828-financas','2023-03-04 11:44:34','ed1a3b188c7ca3c576707851d0a6d6f7'),(566,2,'20220927.234719.859-financas','2023-03-04 11:44:34','0e5e6fcfa8f0ae3132e580596773f7a3'),(567,2,'20220927.234722.892-financas','2023-03-04 11:44:34','4a5916a58531d5ca9b81d8c905f165b6'),(568,2,'20220927.234725.924-financas','2023-03-04 11:44:34','f1d293db09af41dc4036427887bd30c8'),(569,2,'20220927.234728.952-financas','2023-03-04 11:44:34','eae105891bb790b6584ef6e25c33a774'),(570,2,'20220927.234731.973-financas','2023-03-04 11:44:34','c31d019fdd00242ecfb61a1da44740fb'),(571,2,'20220927.234735.011-financas','2023-03-04 11:44:34','f2953b7a6b91a8f0538ec1940feebbf3'),(572,2,'20220927.234738.038-financas','2023-03-04 11:44:34','c5bd4a0073dbfe2c2eefb337029c4502'),(573,2,'20220927.234741.072-financas','2023-03-04 11:44:34','74b02f7dba6683b66be45eb11badb478'),(574,2,'20220927.234744.110-financas','2023-03-04 11:44:34','81a1d02e4dfab9f15008bad2d7cc2587'),(575,2,'20220927.234747.131-financas','2023-03-04 11:44:34','e0c7230f615eec640f28982256bd97af'),(576,2,'20220927.234750.167-financas','2023-03-04 11:44:34','8bfe3aaba4bbfce4b3eed2171cd93eca'),(577,2,'20220927.234753.206-financas','2023-03-04 11:44:34','af3611a21bc30700d584359c264b0d92'),(578,2,'20220927.234756.227-financas','2023-03-04 11:44:34','7fcd1ea38923c6f0a078a4d33d394f35'),(579,2,'20220927.234759.250-financas','2023-03-04 11:44:34','7b85276b4a9a5df57b102ffd20680d7a'),(580,2,'20220927.234802.280-financas','2023-03-04 11:44:34','817f6cf84afb6cbfcd63ac45e5ad2564'),(581,2,'20220927.234805.310-financas','2023-03-04 11:44:34','786668ba02122a208c8d17738e568e3a'),(582,2,'20220927.234808.348-financas','2023-03-04 11:44:34','c2e8db6713c3f5806d8e0b33cf0a2c5e'),(583,2,'20220927.234811.383-financas','2023-03-04 11:44:34','2e53b0c253f762c2ed675199256bec38'),(584,2,'20220927.234814.409-financas','2023-03-04 11:44:34','5a7feb6eb00b8655a76447ebfba56096'),(585,2,'20220927.234817.434-financas','2023-03-04 11:44:34','361e824feb39ce13e11a9df80b244ca6'),(586,2,'20220927.234820.463-financas','2023-03-04 11:44:34','d5d3c6b9e0aaeff12d8a4f81428f42bd'),(587,2,'20220927.234823.502-financas','2023-03-04 11:44:34','2f4bbfd85d6df40de72654f3557df6c9'),(588,2,'20220927.234826.538-financas','2023-03-04 11:44:34','ec1e6b7f4a1076798dcd989cc5854a4a'),(589,2,'20220927.234829.575-financas','2023-03-04 11:44:34','1874fc99e61e7c9a8a7128153609dc52'),(590,2,'20220927.234832.602-financas','2023-03-04 11:44:34','8d06541c64d86e210950bec6ba22d0cd'),(591,2,'20220927.234835.630-financas','2023-03-04 11:44:34','89eb0a1d7f077f347be00da05d88d4ae'),(592,2,'20220927.234838.660-financas','2023-03-04 11:44:34','be1df40f3b6b82a51834827eb1c969bb'),(593,2,'20220927.234841.690-financas','2023-03-04 11:44:34','4ef192f33b2e62daf93ebdae7f9c72a3'),(594,2,'20220927.234844.722-financas','2023-03-04 11:44:34','4cddfbcc8b3a5cd0a306453185d388fb'),(595,2,'20220927.234847.754-financas','2023-03-04 11:44:34','130c28e03dc404823bb4f641f9875175'),(596,2,'20220927.234850.785-financas','2023-03-04 11:44:34','4208557520733a4b53d74350dc8434f8'),(597,2,'20220927.234853.816-financas','2023-03-04 11:44:34','ca4c2756252836fd4f04db256122380c'),(598,2,'20220927.234856.851-financas','2023-03-04 11:44:34','4fc0cf239575a6215ffecf504effe968'),(599,2,'20220927.234859.884-financas','2023-03-04 11:44:34','fdd1f7b9cdfd169edcce22561aa660a0'),(600,2,'20220927.234902.915-financas','2023-03-04 11:44:34','ce88c173bed8a3a0500b54d48b4bed3d'),(601,2,'20220927.234905.942-financas','2023-03-04 11:44:34','9ec5bb3c0b33ff4716ba5a631f62da19'),(602,2,'20220927.234908.972-financas','2023-03-04 11:44:34','224f51d30473478a6a8d409485a238ff'),(603,2,'20220927.234912.012-financas','2023-03-04 11:44:34','32a4d7021399d55a02f4ee1dcefb98ff'),(604,2,'20220927.234915.041-financas','2023-03-04 11:44:34','012305c01fe017e346202165da9a2cc3'),(605,2,'20220927.234918.072-financas','2023-03-04 11:44:34','a0cd5be9c0b1c7c680e8e45723d8b57b'),(606,2,'20220927.234921.102-financas','2023-03-04 11:44:34','faa96db773fe0965ab3a587ddc366980'),(607,2,'20220927.234924.137-financas','2023-03-04 11:44:34','2b6a2fb5c53c99cf686d64e4ab0b9869'),(608,2,'20220927.234927.161-financas','2023-03-04 11:44:34','dc0b2dc12db010254d16f27f8fe3f366'),(609,2,'20220927.234930.194-financas','2023-03-04 11:44:34','921c430fb3182d053899e018053c3a00'),(610,2,'20220927.234933.230-financas','2023-03-04 11:44:34','876cca1c3ed98f5fbe5c8235297f650a'),(611,2,'20220927.234936.271-financas','2023-03-04 11:44:34','5ae1146818e342fecc44993ca65485a0'),(612,2,'20220927.234939.304-financas','2023-03-04 11:44:34','b137afc18fe95eb1a974ab771d18b209'),(613,2,'20220927.234942.345-financas','2023-03-04 11:44:34','7ad2109428b413634bfa857cac47dc49'),(614,2,'20220927.234945.373-financas','2023-03-04 11:44:34','8fe85eff766efedc95cd196ae766d81c'),(615,2,'20220927.234948.402-financas','2023-03-04 11:44:34','1cc10f9b7540a5e09b46ef4fb00ca99a'),(616,2,'20220927.234951.434-financas','2023-03-04 11:44:34','c19bbd6e2f5f9edd03355873f6223d94'),(617,2,'20220927.234954.459-financas','2023-03-04 11:44:34','05ce59f318599ea6aeac6b02dec8faff'),(618,2,'20220927.234957.495-financas','2023-03-04 11:44:35','7d08b2bb44a76a661752f93986db96b2'),(619,2,'20220927.235000.524-financas','2023-03-04 11:44:35','fe8bd58211983a0edd81678531536f08'),(620,2,'20220927.235003.563-financas','2023-03-04 11:44:35','639bfeb19627d1111e18f7e3d801361c'),(621,2,'20220927.235006.601-financas','2023-03-04 11:44:35','148df9918d015a10ede5fe5e4832ce12'),(622,2,'20220927.235009.641-financas','2023-03-04 11:44:35','c26ccf26051fad49fb96cef7dbaaac25'),(623,2,'20220927.235012.672-financas','2023-03-04 11:44:35','bdef2b13607eeb235fda540934aa7c6a'),(624,2,'20220927.235015.708-financas','2023-03-04 11:44:35','f4aa2cebceeaed36f07f0f1029e11586'),(625,2,'20220927.235018.735-financas','2023-03-04 11:44:35','8543380b07cbdb75d965bc60a8a51288'),(626,2,'20220927.235021.757-financas','2023-03-04 11:44:35','6f77e3e59ab61fce535ae7f82755921b'),(627,2,'20220927.235024.793-financas','2023-03-04 11:44:35','727e5fee77ccb1c8ae5a1826c20cd279'),(628,2,'20220927.235027.823-financas','2023-03-04 11:44:35','930af09ee3213c1a1f7e1a5a2836ea24'),(629,2,'20220927.235030.846-financas','2023-03-04 11:44:35','daffa50f35313c6e9ee563f11525b022'),(630,2,'20220927.235033.878-financas','2023-03-04 11:44:35','8ebd6f68cd0fad2685d5b2b3ca306454'),(631,2,'20220927.235036.915-financas','2023-03-04 11:44:35','8fdcba8d3d7974f2f0ffbdc47fd6862f'),(632,2,'20220927.235039.947-financas','2023-03-04 11:44:35','6bb4e6a4eab4b5cd2463e33709a8c9fa'),(633,2,'20220927.235042.973-financas','2023-03-04 11:44:35','92966c6846964fd6aa4d0e1596e436ce'),(634,2,'20220927.235046.013-financas','2023-03-04 11:44:35','e2d493293513b03dd30c84263fe9ab68'),(635,2,'20220927.235049.050-financas','2023-03-04 11:44:35','ce4f8a652cd1f8d091c9b17c24321cb0'),(636,2,'20220927.235052.078-financas','2023-03-04 11:44:35','d4d67e9ebd8ebacda9631470d54e3a59'),(637,2,'20220927.235055.115-financas','2023-03-04 11:44:35','ca7aba075f98b69e8fe50d0495fbd373'),(638,2,'20220927.235058.144-financas','2023-03-04 11:44:35','5b52f566051f7c2e5774c20644d357bf'),(639,2,'20220927.235101.172-financas','2023-03-04 11:44:35','d686121797c81074def0c5a30a72a46d'),(640,2,'20220927.235104.194-financas','2023-03-04 11:44:35','a684310df85642bc306148125f1377b7'),(641,2,'20220927.235107.216-financas','2023-03-04 11:44:35','085a2d3abfbafcf919d0a5fb0153044a'),(642,2,'20220927.235110.249-financas','2023-03-04 11:44:35','a951e42d37594c90b88f2b7f3dea1342'),(643,2,'20220927.235113.276-financas','2023-03-04 11:44:35','67f15c42856bf0f9d1132a2a6eb7727b'),(644,2,'20220927.235116.302-financas','2023-03-04 11:44:35','507a4bce296fb072580d7f8b4ed24141'),(645,2,'20220927.235119.328-financas','2023-03-04 11:44:35','6fe1a43f9d53eae487fea38ba87b4db1'),(646,2,'20220927.235122.351-financas','2023-03-04 11:44:35','db5479c9bb5863ae3198e726d8f60ea8'),(647,2,'20220927.235125.386-financas','2023-03-04 11:44:35','065c7b9814bfb2604490e004e70b9601'),(648,2,'20220927.235128.420-financas','2023-03-04 11:44:35','15e4e403b2070194fe97d2efae775f84'),(649,2,'20220927.235131.460-financas','2023-03-04 11:44:35','a0c843263f93f6dca19f74b4b14b4878'),(650,2,'20220927.235134.496-financas','2023-03-04 11:44:35','1ab95ba160affee01a8f27175eb4524f'),(651,2,'20220927.235137.532-financas','2023-03-04 11:44:35','9962422d563ca096463ae805ed9685b0'),(652,2,'20220927.235140.567-financas','2023-03-04 11:44:35','fafcf5c3c27f702ac945f92d271c90d5'),(653,2,'20220927.235143.592-financas','2023-03-04 11:44:35','cb6f0406146c03756deec7daf512fefc'),(654,2,'20220927.235146.623-financas','2023-03-04 11:44:35','f8fcc8a4c8d1c95e972d4cecb504ae49'),(655,2,'20220927.235149.654-financas','2023-03-04 11:44:35','e70e055538bcef8b23bd5660e7d0a52e'),(656,2,'20220927.235152.687-financas','2023-03-04 11:44:35','f3e4789e0832779f85f1e1b7837b7e96'),(657,2,'20220927.235155.719-financas','2023-03-04 11:44:35','0b3a301ce1770ff6ef15a9702a1870c1'),(658,2,'20220927.235158.761-financas','2023-03-04 11:44:35','ee34f08cff18f711cdf9c1963c18fc52'),(659,2,'20220927.235201.793-financas','2023-03-04 11:44:35','7ea042af7c70fa2aef1bc5ca316f301f'),(660,2,'20220927.235204.821-financas','2023-03-04 11:44:35','25ccc1cc8c647ef7039dce52b8fb1b0e'),(661,2,'20220927.235207.849-financas','2023-03-04 11:44:35','90d50a3972bd7eec6170600b7a50f498'),(662,2,'20220927.235210.873-financas','2023-03-04 11:44:35','ec9bd4696e1c7b7c552a5e9456929889'),(663,2,'20220927.235213.904-financas','2023-03-04 11:44:35','7cf3c858bd64fe7cee82b79745ce535c'),(664,2,'20220927.235216.930-financas','2023-03-04 11:44:35','47de2e526b26a391e1be5bdee4f4a7c7'),(665,2,'20220927.235219.962-financas','2023-03-04 11:44:35','7c091bd274f15d055509c586bb76c4ac'),(666,2,'20220927.235223.000-financas','2023-03-04 11:44:35','6bac0711f4319512f832db8520871612'),(667,2,'20220927.235226.039-financas','2023-03-04 11:44:35','3c83d24930c63bdb9f35f5796391eb75'),(668,2,'20220927.235229.077-financas','2023-03-04 11:44:35','45cfd30df6674a08b54f34968cc19b43'),(669,2,'20220927.235232.112-financas','2023-03-04 11:44:35','756c0027ec744c5e7964d4b89c3c82f6'),(670,2,'20220927.235235.148-financas','2023-03-04 11:44:35','f0939df54c930df8335fb0b66fa77f0e'),(671,2,'20220927.235238.169-financas','2023-03-04 11:44:35','cebfe5786a47e5196bbb846c52be83d8'),(672,2,'20220927.235241.201-financas','2023-03-04 11:44:35','d275c9221c14482e95b7540d88264ecd'),(673,2,'20220927.235244.238-financas','2023-03-04 11:44:35','797c9befccfd80a60414bed56da9b639'),(674,2,'20220927.235247.273-financas','2023-03-04 11:44:35','fd4eb977edcdd54a958a03d44791504c'),(675,2,'20220927.235250.314-financas','2023-03-04 11:44:35','d1b3ae75248b8f33caef1fac006db97d'),(676,2,'20220927.235253.354-financas','2023-03-04 11:44:35','d0d4b5a523e4ed994994dcd701282450'),(677,2,'20220927.235256.392-financas','2023-03-04 11:44:35','95a78016bb41a8119a9d62621f88b892'),(678,2,'20220927.235259.428-financas','2023-03-04 11:44:35','89f70bccd01a8113c89957b739859cbd'),(679,2,'20220927.235302.466-financas','2023-03-04 11:44:35','b27b5ce2d4624655396f7e6b0cd66da8'),(680,2,'20220927.235305.497-financas','2023-03-04 11:44:35','1d84e4c3bd2eee306947043df6fdae85'),(681,2,'20220927.235308.533-financas','2023-03-04 11:44:35','5019ccfa8a9c763001694e9829eeb60e'),(682,2,'20220927.235311.562-financas','2023-03-04 11:44:35','df99ea06fcae004568d4f214d31fd94a'),(683,2,'20220927.235314.587-financas','2023-03-04 11:44:35','da19bf3aaf3ff63b7103e1569634bbda'),(684,2,'20220927.235317.617-financas','2023-03-04 11:44:35','f1050aa6e9418cd206b4790785410a7d'),(685,2,'20220927.235320.649-financas','2023-03-04 11:44:35','159e15779da43278c419000026f5b103'),(686,2,'20220927.235323.682-financas','2023-03-04 11:44:35','c1e8432ba79b5029e9d9aac1a8e15c11'),(687,2,'20220927.235326.705-financas','2023-03-04 11:44:35','50b3f613a8733324b8cdbf69f202553f'),(688,2,'20220927.235329.737-financas','2023-03-04 11:44:35','245463e3b5635a9d383d4a1a3540fb3e'),(689,2,'20220927.235332.770-financas','2023-03-04 11:44:35','77d792244c401988267e8542b5674fdb'),(690,2,'20220927.235335.808-financas','2023-03-04 11:44:35','5191bd35bd89d2260a0b761c18f5d789'),(691,2,'20220927.235338.835-financas','2023-03-04 11:44:35','e37e39cf78f3bd439ca627675dcfdcb4'),(692,2,'20220927.235341.861-financas','2023-03-04 11:44:35','b4a412338a0813965748b087d6cc6fb3'),(693,2,'20220927.235344.896-financas','2023-03-04 11:44:35','79690754bb3372b625b9ace5f785bc6a'),(694,2,'20220927.235347.928-financas','2023-03-04 11:44:35','fe80f926c393125fe325da08f0923611'),(695,2,'20220927.235350.958-financas','2023-03-04 11:44:35','6cf56392091d59cb7b197ac4fe03f070'),(696,2,'20220927.235353.995-financas','2023-03-04 11:44:35','ca53257d017e55da6a878bcbb0d96bd1'),(697,2,'20220927.235357.023-financas','2023-03-04 11:44:35','4ba7c33a43b7726bef1e0e711a56e65b'),(698,2,'20220927.235400.059-financas','2023-03-04 11:44:35','9840ae21871ce4912dad6f978a737725'),(699,2,'20220927.235403.084-financas','2023-03-04 11:44:35','8746579c543a2de97e50214819eac290'),(700,2,'20220927.235406.119-financas','2023-03-04 11:44:35','8fb87db0bc6453eb86fd632695c9c36f'),(701,2,'20220927.235409.151-financas','2023-03-04 11:44:35','737d0c7866cd424d0ecada9dd6756834'),(702,2,'20220927.235412.174-financas','2023-03-04 11:44:35','c16aadd7447340d6f37c62c431c8f8bb'),(703,2,'20220927.235415.207-financas','2023-03-04 11:44:35','b72dd0508010a7433297e48b8b468bca'),(704,2,'20220927.235418.237-financas','2023-03-04 11:44:35','3a0afac58baf807e6a97bb7c9b0e5133'),(705,2,'20220927.235421.275-financas','2023-03-04 11:44:35','da9c609e007b817e9113aa7ab3cc77b7'),(706,2,'20220927.235424.300-financas','2023-03-04 11:44:35','1b05b085ebd66a746b8cfe586596afc4'),(707,2,'20220927.235427.335-financas','2023-03-04 11:44:35','5c4eb78f2d675c5713b00ee6ac2a41c2'),(708,2,'20220927.235430.368-financas','2023-03-04 11:44:35','ffb1938bf868665a0ec4a587004cfad4'),(709,2,'20220927.235433.407-financas','2023-03-04 11:44:35','fa199f8a78b0cd2e1b18576ab9693136'),(710,2,'20220927.235436.447-financas','2023-03-04 11:44:35','3988e1259a23d19aa1ea0669f194cff8'),(711,2,'20220927.235439.474-financas','2023-03-04 11:44:35','9431748fca7eae7f8cf19c46cbdd9e41'),(712,2,'20220927.235442.510-financas','2023-03-04 11:44:35','cd59264de1881c6e30a8506a61c4560a'),(713,2,'20220927.235445.534-financas','2023-03-04 11:44:35','a2068dbabf34dc6d9e094cead19222ad'),(714,2,'20220927.235448.567-financas','2023-03-04 11:44:35','c069f23f87cb5d5b20a3782b47e5dc5f'),(715,2,'20220927.235451.600-financas','2023-03-04 11:44:35','8797e45ac8bbbe6c9be130a9fcd5495c'),(716,2,'20220927.235454.638-financas','2023-03-04 11:44:35','0355982456eff58a6a2219cd4e215113'),(717,2,'20220927.235457.667-financas','2023-03-04 11:44:35','e9a68b447a9e84802e2b15aa18ef1386'),(718,2,'20220927.235500.697-financas','2023-03-04 11:44:35','bfa285dfca7b37677b33ed5ecc28fb3e'),(719,2,'20220927.235503.731-financas','2023-03-04 11:44:35','f3e6176368f3fd3b85890a15b31ea183'),(720,2,'20220927.235506.752-financas','2023-03-04 11:44:35','2681d1541ef612be2f50954037770bdc'),(721,2,'20220927.235509.782-financas','2023-03-04 11:44:35','94443a907dccb64c488b57388f2d4889'),(722,2,'20220927.235512.810-financas','2023-03-04 11:44:35','c56d607cc143484faa084ad2dc2a5dfb'),(723,2,'20220927.235515.845-financas','2023-03-04 11:44:35','504d013a8a4ebd2ce52c16dd7abdeb37'),(724,2,'20220927.235518.879-financas','2023-03-04 11:44:35','bb97369cf1644171ad242453ebd44cd0'),(725,2,'20220927.235521.906-financas','2023-03-04 11:44:35','d45e8158070084d2121d9dd3b7d20d66'),(726,2,'20220927.235524.939-financas','2023-03-04 11:44:35','4753d9c2743a6d6c037b107a06b51c5a'),(727,2,'20220927.235527.970-financas','2023-03-04 11:44:35','a16e6e45f4bc19b7226b8ac27812648a'),(728,2,'20220927.235531.000-financas','2023-03-04 11:44:35','6beeb4790ecd182b53dec4a837095488'),(729,2,'20220927.235534.023-financas','2023-03-04 11:44:35','0a30d9006b5e487505203cf0d63ce9f0'),(730,2,'20220927.235537.052-financas','2023-03-04 11:44:35','ea77f2c01b7703f2df45c9e7637a31a1'),(731,2,'20220927.235540.086-financas','2023-03-04 11:44:35','e3fc82fc56adab3c451a81696a0c74e2'),(732,2,'20220927.235543.124-financas','2023-03-04 11:44:35','4642dd18223c146aadaac048e86bfe34'),(733,2,'20220927.235546.152-financas','2023-03-04 11:44:35','21bb6f2455658b2ec79a85396e823712'),(734,2,'20220927.235549.180-financas','2023-03-04 11:44:35','73e6ec2d6ff1d8a838533db096b5a960'),(735,2,'20220927.235552.219-financas','2023-03-04 11:44:35','ef9ebef73ea4d394bf375210ca3590ac'),(736,2,'20220927.235555.246-financas','2023-03-04 11:44:35','89609c92bf1bc52483c0a7f3d1bf021d'),(737,2,'20220927.235558.272-financas','2023-03-04 11:44:35','c0eab62563bbb9a6bd8c742250681cbe'),(738,2,'20220927.235601.302-financas','2023-03-04 11:44:35','dc2f02dfcb6da0700629b53ef24c5725'),(739,2,'20220927.235604.335-financas','2023-03-04 11:44:35','145a078a9201de22cd2477369b814bc0'),(740,2,'20220927.235607.359-financas','2023-03-04 11:44:35','666ca4957e684da1211f6d55fb193d1c'),(741,2,'20220927.235610.382-financas','2023-03-04 11:44:35','1dc34c5b059793fcaddcd61c45799721'),(742,2,'20220927.235613.417-financas','2023-03-04 11:44:35','4c8cd7a016ad09e1f32215b9ad317f11'),(743,2,'20220927.235616.438-financas','2023-03-04 11:44:35','60bda7e039676c07c28f7a1fbd953fd8'),(744,2,'20220927.235619.469-financas','2023-03-04 11:44:35','7cf9b15dc2bac4adc2d0238da2685df7'),(745,2,'20220927.235622.494-financas','2023-03-04 11:44:35','a5666e73e9817ccb76f6b6e1cc046eaf'),(746,2,'20220927.235625.524-financas','2023-03-04 11:44:35','be6042fae0fc2e1a4436f43d12cab7c7'),(747,2,'20220927.235628.559-financas','2023-03-04 11:44:35','6bd8fe57fa71ee697689f70f457f4db4'),(748,2,'20220927.235631.600-financas','2023-03-04 11:44:35','c6f0f32932bbadc805bc602bdb83a235'),(749,2,'20220927.235634.627-financas','2023-03-04 11:44:35','a6df98adcbe95f39c7447567f17e07e9'),(750,2,'20220927.235637.664-financas','2023-03-04 11:44:35','0dc3c613a8988560f8137fe87f985395'),(751,2,'20220927.235640.695-financas','2023-03-04 11:44:35','81209e5db33f83297302801e5fce959d'),(752,2,'20220927.235643.725-financas','2023-03-04 11:44:35','3b066c816fdc4db24c3ee2011f0d8a08'),(753,2,'20220927.235646.750-financas','2023-03-04 11:44:35','c4f22b0608e4b0e0dfa25f9fed415bd4'),(754,2,'20220927.235649.785-financas','2023-03-04 11:44:35','3d087a2e2f6d8d7d6c92b5c9bd1cc89b'),(755,2,'20220927.235652.818-financas','2023-03-04 11:44:35','ab60604c44365b80f5025f022ee46ead'),(756,2,'20220927.235655.851-financas','2023-03-04 11:44:35','d03ed6c42b9bab1503670dc0e93504b7'),(757,2,'20220927.235658.889-financas','2023-03-04 11:44:35','7772938ae105bf0515562e3fb178082b'),(758,2,'20220927.235701.929-financas','2023-03-04 11:44:35','5f326f7156fcda65a8c9121bbba7e6f0'),(759,2,'20220927.235704.953-financas','2023-03-04 11:44:35','c863c908ba409d19d272039dad685bc7'),(760,2,'20220927.235707.975-financas','2023-03-04 11:44:35','b106a4901f83787c34d5801d7cd2a564'),(761,2,'20220927.235711.002-financas','2023-03-04 11:44:35','2bfc1af44cf1d931c6ef9d885c5f24a4'),(762,2,'20220927.235714.052-financas','2023-03-04 11:44:35','06bf6e5af8ce4282af40ad0187daa5bb'),(763,2,'20220927.235717.084-financas','2023-03-04 11:44:35','a43cc9b3d0af183841e8ae49d5d51154'),(764,2,'20220927.235720.105-financas','2023-03-04 11:44:35','7ba062c5bad3aa7e61c64d49e52ff6aa'),(765,2,'20220927.235723.141-financas','2023-03-04 11:44:35','3d67958cb00a876f4e9a9ac28061d0fa'),(766,2,'20220927.235726.169-financas','2023-03-04 11:44:35','9578ba77ab8a009eb2a56ca7fead11a2'),(767,2,'20220927.235729.202-financas','2023-03-04 11:44:35','497db7f7907311f92bfdb5e0d9a929c6'),(768,2,'20220927.235732.236-financas','2023-03-04 11:44:35','b18715c835c7846dd2dde6faa78c9968'),(769,2,'20220927.235735.268-financas','2023-03-04 11:44:35','05ed4c18feda55a497c7bc1176b89cdd'),(770,2,'20220927.235738.302-financas','2023-03-04 11:44:35','0548586de7e459a47a0c0416be23f33c'),(771,2,'20220927.235741.334-financas','2023-03-04 11:44:35','d254867aef388bce79e4195d8b75ec01'),(772,2,'20220927.235744.369-financas','2023-03-04 11:44:35','450ac43b225ee66317fdfcb0e9b78d49'),(773,2,'20220927.235747.398-financas','2023-03-04 11:44:35','082454d891949a0da7bb2fa7adb94d67'),(774,2,'20220927.235750.435-financas','2023-03-04 11:44:35','ef02eb1fa10e915619f6acdf458e4eb9'),(775,2,'20220927.235753.476-financas','2023-03-04 11:44:35','ce0f4a5438e8347cafb04415d09b5617'),(776,2,'20220927.235756.506-financas','2023-03-04 11:44:35','f4cde4e2b8a599dedcf524062852c5b9'),(777,2,'20220927.235759.543-financas','2023-03-04 11:44:35','5daeeb3a7a96a1d4454c214e0e1e1ee1'),(778,2,'20220927.235802.580-financas','2023-03-04 11:44:35','872cd734ffc6dcbed3cecb8fa2c1891f'),(779,2,'20220927.235805.609-financas','2023-03-04 11:44:35','a07476a3b31aa4566173ca27324a79fa'),(780,2,'20220927.235808.641-financas','2023-03-04 11:44:35','514c7fec81578d19543386385456bf0d'),(781,2,'20220927.235811.673-financas','2023-03-04 11:44:35','73b6aa76f7e0e1ab462ab8f37bd23204'),(782,2,'20220927.235814.705-financas','2023-03-04 11:44:35','a4976e51586c0fe224fcf8bb47c26000'),(783,2,'20220927.235817.734-financas','2023-03-04 11:44:35','fb40ca71c3ab08fe470ff906f5b9e424'),(784,2,'20220927.235820.769-financas','2023-03-04 11:44:35','fe0520cf55d7830fa8aed349387dc955'),(785,2,'20220927.235823.807-financas','2023-03-04 11:44:35','501b017a4f6832f9c465583b6c4b95dc'),(786,2,'20220927.235826.843-financas','2023-03-04 11:44:35','2b76771ca57360eb2a9fc1857b8dba41'),(787,2,'20220927.235829.876-financas','2023-03-04 11:44:35','ccdce9669c575e5f9576c726197e3178'),(788,2,'20220927.235832.900-financas','2023-03-04 11:44:35','ca57260fe9df8228bc4807685b7e6b79'),(789,2,'20220927.235835.926-financas','2023-03-04 11:44:35','818c89f1e6db2940634285896304739b'),(790,2,'20220927.235838.957-financas','2023-03-04 11:44:35','6dca356d06d657d75c2a251948f4c762'),(791,2,'20220927.235841.991-financas','2023-03-04 11:44:35','1ad1ddcaf8cf4b2bc317cc2f971192b7'),(792,2,'20220927.235845.017-financas','2023-03-04 11:44:35','fac464ebc9793247b4f67393319ec914'),(793,2,'20220927.235848.044-financas','2023-03-04 11:44:35','b410149f69fce072c2e224ff30e7cbe0'),(794,2,'20220927.235851.083-financas','2023-03-04 11:44:35','2abbbcce0df3843aa8465cb1ad419e25'),(795,2,'20220927.235854.111-financas','2023-03-04 11:44:35','1cf251e3b7a293dd5e76c24719f31704'),(796,2,'20220927.235857.136-financas','2023-03-04 11:44:35','fd769109f7f29839bf53f3b888915d24'),(797,2,'20220927.235900.162-financas','2023-03-04 11:44:35','0b02f74d3e6c058681dd4a940d417c1b'),(798,2,'20220927.235903.197-financas','2023-03-04 11:44:35','25bae9692a188996fb2b865a847a6cb6'),(799,2,'20220927.235906.224-financas','2023-03-04 11:44:35','3e8ee582b1e710a8697c69efb8de4709'),(800,2,'20220927.235909.255-financas','2023-03-04 11:44:35','4a2d962aeee73dc28f4604edcb366ab1'),(801,2,'20220927.235912.287-financas','2023-03-04 11:44:35','5558af87bd302fd11aab6b68f6f3d100'),(802,2,'20220927.235915.315-financas','2023-03-04 11:44:35','40be553fdab7069f632356356dfed85f'),(803,2,'20220927.235918.338-financas','2023-03-04 11:44:35','fa92429f75e481284c0b19bc32bbe697'),(804,2,'20220927.235921.371-financas','2023-03-04 11:44:35','010ca7b9c24f979b49c36c95a0aa9f94'),(805,2,'20220927.235924.407-financas','2023-03-04 11:44:35','88ac207db31939ad594eadcab2b0598d'),(806,2,'20220927.235927.435-financas','2023-03-04 11:44:35','72fffb62cdae5778b96fdafe63c59f89'),(807,2,'20220927.235930.460-financas','2023-03-04 11:44:35','9d6447ad7d9e53575089bf6f8bb20510'),(808,2,'20220927.235933.488-financas','2023-03-04 11:44:35','6337688f01a3d14e07b88c825e59ea8c'),(809,2,'20220927.235936.518-financas','2023-03-04 11:44:35','0d7a1d415bae53a3e6a60a560b371d73'),(810,2,'20220927.235939.552-financas','2023-03-04 11:44:35','b502cabd0a261f5e5aad5d0ac3e8fe6a'),(811,2,'20220927.235942.589-financas','2023-03-04 11:44:35','4ce46b5d3d3e9e5c5d4a11ef7f2efa49'),(812,2,'20220927.235945.621-financas','2023-03-04 11:44:35','8980883053fcc8ac3f7327c355c46ff8'),(813,2,'20220927.235948.650-financas','2023-03-04 11:44:35','b6fda359795bd077cd67a4bebf61611b'),(814,2,'20220927.235951.682-financas','2023-03-04 11:44:35','d9b633a47cddfc0c6783343f0526aa36'),(815,2,'20220927.235954.711-financas','2023-03-04 11:44:35','c1aa122d5ad29a7744d469ea6817e726'),(816,2,'20220927.235957.739-financas','2023-03-04 11:44:35','49d388dfc3a3d85f62e3b7086aea5ce4'),(817,2,'20220928.000000.777-financas','2023-03-04 11:44:35','c8f7eda71831093f9e1976a998b4dd9a'),(818,2,'20220928.000003.802-financas','2023-03-04 11:44:35','d820b13e48a5f29c27ddc998887a61c2'),(819,2,'20220928.000006.822-financas','2023-03-04 11:44:35','6d1a6d32175f5ce416e12301418c01a4'),(820,2,'20220928.000009.863-financas','2023-03-04 11:44:35','4ab0efc1d39ee71a1395a33089f176a6'),(821,2,'20220928.000012.903-financas','2023-03-04 11:44:35','86fc18b53136289f1b6c538169b27af7'),(822,2,'20220928.000015.943-financas','2023-03-04 11:44:35','e348b97b0edb462321f357323bf0a9ee'),(823,2,'20220928.000018.981-financas','2023-03-04 11:44:35','ec533b83533c1b8e8e7035349df2240f'),(824,2,'20220928.000022.009-financas','2023-03-04 11:44:35','ce0d8fca3bd5fd67b2a54b6cde4cf6b0'),(825,2,'20220928.000025.041-financas','2023-03-04 11:44:35','1fcb7cb156fe729cab030a48edf4a2c8'),(826,2,'20220928.000028.081-financas','2023-03-04 11:44:35','5f5af89e57a79212bffdb8618e01508a'),(827,2,'20220928.000031.113-financas','2023-03-04 11:44:35','a464cddc341bd6ef0bc759aad67fd939'),(828,2,'20220928.000034.142-financas','2023-03-04 11:44:35','ccdafc15bdb00c8a82901b0b2906d128'),(829,2,'20220928.000037.169-financas','2023-03-04 11:44:35','205e537c2a47ae5edbcf12a75da73b68'),(830,2,'20220928.000040.202-financas','2023-03-04 11:44:35','e4e3938d983733b12ef582bee8e51fef'),(831,2,'20220928.000043.228-financas','2023-03-04 11:44:35','86ae3f3e827cf4f974c4e5934c05089a'),(832,2,'20220928.000046.263-financas','2023-03-04 11:44:35','1f692467f74b1dc61272e2e383a5bcec'),(833,2,'20220928.000049.305-financas','2023-03-04 11:44:35','64fa57f357079bb3c905169a4d4c3302'),(834,2,'20220928.000052.334-financas','2023-03-04 11:44:35','ffe24f986624cb46dfe39223b2ccd244'),(835,2,'20220928.000055.360-financas','2023-03-04 11:44:35','80f4520d763f670dee8348bde62e62ce'),(836,2,'20220928.000058.393-financas','2023-03-04 11:44:35','000faf86fea48a753ca5d7f82d45f8a2'),(837,2,'20220928.000101.432-financas','2023-03-04 11:44:35','3e2115c76e8e3a16656df0de8318670e'),(838,2,'20220928.000104.459-financas','2023-03-04 11:44:35','6131f657cab34aab61e0980fac24ab8d'),(839,2,'20220928.000107.487-financas','2023-03-04 11:44:35','4ddd08f4195aa42e5100ce0faec20596'),(840,2,'20220928.000110.527-financas','2023-03-04 11:44:35','fc5e163039fddbc85cf72a4423f39526'),(841,2,'20220928.000113.561-financas','2023-03-04 11:44:35','6362bd317291e55d941d4b1af7f323d4'),(842,2,'20220928.000116.585-financas','2023-03-04 11:44:35','6100468a75581e10b5ae9f0f4498ba98'),(843,2,'20220928.000119.618-financas','2023-03-04 11:44:35','8bd00d9d6074ee4ffac6fce1b03bba95'),(844,2,'20220928.000122.659-financas','2023-03-04 11:44:35','dc1c1e9fd1f46bc0bf272962ea6abcda'),(845,2,'20220928.000125.688-financas','2023-03-04 11:44:35','1a35c395273eb9efe781111103243051'),(846,2,'20220928.000128.722-financas','2023-03-04 11:44:35','abe3605ad98a36060b8cf9cb9fed013c'),(847,2,'20220928.000131.753-financas','2023-03-04 11:44:35','0b76310ff16926786b4dca24a4facf15'),(848,2,'20220928.000134.781-financas','2023-03-04 11:44:35','f1b7ba61f90f5524acf86d94caabfbb6'),(849,2,'20220928.000137.820-financas','2023-03-04 11:44:35','19bc236a505f4a202ea8e5be0857da47'),(850,2,'20220928.000140.842-financas','2023-03-04 11:44:35','177b2a43843165fdb2e47f25ed689d84'),(851,2,'20220928.000143.871-financas','2023-03-04 11:44:35','084a60ab495f9408a4600385f0d41429'),(852,2,'20220928.000146.906-financas','2023-03-04 11:44:35','6505eccc9668b72a72cf2a0aa11130c0'),(853,2,'20220928.000149.934-financas','2023-03-04 11:44:35','d2b5cce72a7977a6351b69eb92d671b4'),(854,2,'20220928.000152.956-financas','2023-03-04 11:44:35','5e84719097da2bc161e42feb7a69dc18'),(855,2,'20220928.000155.994-financas','2023-03-04 11:44:35','a123fbb622d6e3ce1d03567e0ade9f1b'),(856,2,'20220928.000159.026-financas','2023-03-04 11:44:35','66761bbfc9130834785f7dc3cb412625'),(857,2,'20220928.000202.058-financas','2023-03-04 11:44:35','258d67c98928c994408114e7ec403ade'),(858,2,'20220928.000205.078-financas','2023-03-04 11:44:35','f8491dcea0187e304c99d0cd8e3f99ab'),(859,2,'20220928.000208.110-financas','2023-03-04 11:44:35','260c377866441882889254bbe44ef540'),(860,2,'20220928.000211.138-financas','2023-03-04 11:44:35','c7e30a98a23f91d5268117e3eca194ae'),(861,2,'20220928.000214.166-financas','2023-03-04 11:44:35','a96c1c9c16b5f1a76dad3a9bcdd63604'),(862,2,'20220928.000217.206-financas','2023-03-04 11:44:35','2a21970f03a1ceff3592737b84bea53c'),(863,2,'20220928.000220.226-financas','2023-03-04 11:44:35','7da7e8cf901a214eb59c336c1977cad2'),(864,2,'20220928.000223.258-financas','2023-03-04 11:44:35','34f942023c0715ed53f62b0a25668ded'),(865,2,'20220928.000226.295-financas','2023-03-04 11:44:35','7b523f3a16c67991d01cfb25ca868a08'),(866,2,'20220928.000229.320-financas','2023-03-04 11:44:35','9a84f9737651331f951ccfbe3822aed4'),(867,2,'20220928.000232.351-financas','2023-03-04 11:44:35','a3411984988ebad8763d545da7f8a169'),(868,2,'20220928.000235.389-financas','2023-03-04 11:44:35','dc309b6bffadf62fcfc239681e15731b'),(869,2,'20220928.000238.415-financas','2023-03-04 11:44:35','ebd68981f1562e3050810eb98dcc6aa0'),(870,2,'20220928.000241.445-financas','2023-03-04 11:44:35','0c98f80e1e3c5c8f79b6bf3bd9ca17da'),(871,2,'20220928.000244.477-financas','2023-03-04 11:44:35','1b75985913add2bc070fee48829e398e'),(872,2,'20220928.000247.501-financas','2023-03-04 11:44:35','480a0396b329092b4f5dc629c4a75356'),(873,2,'20220928.000250.533-financas','2023-03-04 11:44:35','bdce9d351a6d11d5bbc2c448c7c71487'),(874,2,'20220928.000253.562-financas','2023-03-04 11:44:35','8ee677274679ba2a12424043984dced4'),(875,2,'20220928.000256.601-financas','2023-03-04 11:44:35','7fc1073045ac37881b550b4934a38b11'),(876,2,'20220928.000259.628-financas','2023-03-04 11:44:35','238f783735bcb671bf5e67faa10043a7'),(877,2,'20220928.000302.658-financas','2023-03-04 11:44:35','5207bdc898246c8f89e0319a88e91fa5'),(878,2,'20220928.000305.684-financas','2023-03-04 11:44:35','0cb7b1e3cdcb9b5f971805173b91231e'),(879,2,'20220928.000308.714-financas','2023-03-04 11:44:35','083c46857d0e4cb878d994cc83e679e8'),(880,2,'20220928.000311.741-financas','2023-03-04 11:44:35','90ee4e24be3e08e4921fde7e68d01516'),(881,2,'20220928.000314.771-financas','2023-03-04 11:44:35','68523d47d6e8f145e640537bfa9950a5'),(882,2,'20220928.000317.799-financas','2023-03-04 11:44:35','f162b6f0641e55f526be539d600d73e2'),(883,2,'20220928.000320.836-financas','2023-03-04 11:44:35','21b88f0cc112de93409acba7bdfcf42a'),(884,2,'20220928.000323.866-financas','2023-03-04 11:44:35','281385bdc7368a2fd786b82bd396d9bf'),(885,2,'20220928.000326.888-financas','2023-03-04 11:44:35','3bce2a6d8334f0f3ccf7c8d60c317b16'),(886,2,'20220928.000329.925-financas','2023-03-04 11:44:35','56e028cc72d48d2909885febd8163407'),(887,2,'20220928.000332.967-financas','2023-03-04 11:44:35','2c05b7373491ff56b999684436efbc56'),(888,2,'20220928.000335.991-financas','2023-03-04 11:44:35','72cca22b8a8a1a1849f452ff75e02fd9'),(889,2,'20220928.000339.022-financas','2023-03-04 11:44:35','1d5867c7bcd846d130bb8465027698fc'),(890,2,'20220928.000342.050-financas','2023-03-04 11:44:35','80100a5432cdfd684da59c3cb25aef73'),(891,2,'20220928.000345.072-financas','2023-03-04 11:44:35','c9e4e1a6d4ca825ee8806c4498ed5277'),(892,2,'20220928.000348.111-financas','2023-03-04 11:44:35','3f550403397dc2fc2af6e2d074261ef4'),(893,2,'20220928.000351.138-financas','2023-03-04 11:44:35','3177de96698e2f8de1d60160cef37af2'),(894,2,'20220928.000354.170-financas','2023-03-04 11:44:35','dbc07d6dd45d686f9677276c274844f4'),(895,2,'20220928.000357.198-financas','2023-03-04 11:44:35','ba58e9cb90723df3f16eec751eacdd6a'),(896,2,'20220928.000400.229-financas','2023-03-04 11:44:35','4dce814c2de6632f2a4fa8a5c4648a13'),(897,2,'20220928.000403.254-financas','2023-03-04 11:44:35','4a63f72a3c97d7ac65d2c5e46da81b35'),(898,2,'20220928.000406.288-financas','2023-03-04 11:44:35','cfcb37fbb9d05f30e9fadb69660a1a9f'),(899,2,'20220928.000409.316-financas','2023-03-04 11:44:35','183b21f6bf3ba3c1cc86b76626a6c182'),(900,2,'20220928.000412.356-financas','2023-03-04 11:44:35','20e9de7006957ce68d7944c5a3da12e1'),(901,2,'20220928.000415.390-financas','2023-03-04 11:44:35','32807aa97e9dea8277cc621c53740a36'),(902,2,'20220928.000418.428-financas','2023-03-04 11:44:35','820b69725b3592144b8c67a547ad0e4a'),(903,2,'20220928.000421.451-financas','2023-03-04 11:44:35','fe438017a6c8d7972935e3cfc8fc5eba'),(904,2,'20220928.000424.491-financas','2023-03-04 11:44:35','1adf52521c5714cdcb5afdca4e51dfac'),(905,2,'20220928.000427.532-financas','2023-03-04 11:44:35','7eb1f9c3e3569fca838d40ad2caddcc1'),(906,2,'20220928.000430.557-financas','2023-03-04 11:44:35','1a2ad05af4a5eaf57436e012e1109211'),(907,2,'20220928.000433.586-financas','2023-03-04 11:44:35','9016b73a1e3e1ddc020aeffbfb4efd3b'),(908,2,'20220928.000436.627-financas','2023-03-04 11:44:35','d431c289bcff011c10cc284b6a1ffeb0'),(909,2,'20220928.000439.659-financas','2023-03-04 11:44:35','0c4b5a0e876b123ca1abe8bc583508da'),(910,2,'20220928.000442.697-financas','2023-03-04 11:44:35','ef9c63badb918492cc45dc158843e60b'),(911,2,'20220928.000445.727-financas','2023-03-04 11:44:35','0dbd5a183761bbb401427328e48cd601'),(912,2,'20220928.000448.754-financas','2023-03-04 11:44:35','0a1970e2872e51510ecf44375ca2b2cc'),(913,2,'20220928.000451.790-financas','2023-03-04 11:44:35','a34951d2aa55a32bc74734731710ed41'),(914,2,'20220928.000454.830-financas','2023-03-04 11:44:35','4709337ca8f75de7bdb1eebbbb846a72'),(915,2,'20220928.000457.858-financas','2023-03-04 11:44:35','761274b822602a820a9e0cc922af3cb2'),(916,2,'20220928.000500.883-financas','2023-03-04 11:44:35','ea9ad1c3ca9d88c3f58cfd0661e37ae3'),(917,2,'20220928.000503.923-financas','2023-03-04 11:44:35','dea522966164588041868dfca3d24781'),(918,2,'20220928.000506.955-financas','2023-03-04 11:44:35','30e7509ed4944799e21721136f13b34f'),(919,2,'20220928.000509.991-financas','2023-03-04 11:44:35','a2134e7bc66823b77e9412506c851910'),(920,2,'20220928.000513.015-financas','2023-03-04 11:44:35','3e996671087b3b29fbdcf816f995e25e'),(921,2,'20220928.000516.050-financas','2023-03-04 11:44:35','4cdf080247b3121f1c5c8984db09abd6'),(922,2,'20220928.000519.083-financas','2023-03-04 11:44:35','dcf85adf283312e735af846728ec1f7f'),(923,2,'20220928.000522.115-financas','2023-03-04 11:44:35','ef2a3b8a2a9a59614a6d9c8821125022'),(924,2,'20220928.000525.156-financas','2023-03-04 11:44:35','792c92e0f14fd97418e427e8cfa03ccf'),(925,2,'20220928.000528.187-financas','2023-03-04 11:44:35','1a0c45a9b8e49adf229cac03b80f68a7'),(926,2,'20220928.000531.223-financas','2023-03-04 11:44:35','50e3f96a8ffd9f33aaad69bea00adb7a'),(927,2,'20220928.000534.253-financas','2023-03-04 11:44:35','5a8511def82efc0b99267dcd282a5301'),(928,2,'20220928.000537.274-financas','2023-03-04 11:44:35','89742a46b37983dedae21e7f00c10f0c'),(929,2,'20220928.000540.310-financas','2023-03-04 11:44:35','ae5a557b061adca64dbf8c35d3491f48'),(930,2,'20220928.000543.338-financas','2023-03-04 11:44:35','ae47564e665662799eb3178fdea50aed'),(931,2,'20220928.000546.372-financas','2023-03-04 11:44:35','107ce94ac7dc32e8a509e24bbe7984fb'),(932,2,'20220928.000549.408-financas','2023-03-04 11:44:35','9e4dd5d75c4e41ce8501985bb5a91198'),(933,2,'20220928.000552.450-financas','2023-03-04 11:44:35','8a52e0e1973b18d93a32d7854ae0d777'),(934,2,'20220928.000555.478-financas','2023-03-04 11:44:35','dc7938ff7d6ed3cf5ad784803cbe9c2b'),(935,2,'20220928.000558.508-financas','2023-03-04 11:44:35','ef9212e95cac77e6850eb09b2b41387b'),(936,2,'20220928.000601.544-financas','2023-03-04 11:44:35','94254801833807f258aa161308ec897b'),(937,2,'20220928.000604.564-financas','2023-03-04 11:44:35','031a20d20ef64bfa3c476818c3e87e56'),(938,2,'20220928.000607.588-financas','2023-03-04 11:44:35','2fd17abce2a37bf2769e5a4db6acb572'),(939,2,'20220928.000610.626-financas','2023-03-04 11:44:35','8106c047c5936e6b06812e4ace99815b'),(940,2,'20220928.000613.667-financas','2023-03-04 11:44:35','a1abbce81c81ba6bae514d7060c8e4fa'),(941,2,'20220928.000616.703-financas','2023-03-04 11:44:35','52d9197ea21d872142e00a2147647354'),(942,2,'20220928.000619.731-financas','2023-03-04 11:44:35','a28c95718f0ab085e8aeb44379230bfc'),(943,2,'20220928.000622.761-financas','2023-03-04 11:44:35','02c2702eb998c0f61b267f1bc7a956a3'),(944,2,'20220928.000625.789-financas','2023-03-04 11:44:35','df0d180c678eb4d620f365351cc35829'),(945,2,'20220928.000628.819-financas','2023-03-04 11:44:35','6eeb10872e59943c201361f4e06494c6'),(946,2,'20220928.000631.844-financas','2023-03-04 11:44:35','e100e1b7d7ba7e9326a02445c286ea9a'),(947,2,'20220928.000634.882-financas','2023-03-04 11:44:35','bfbc7bb1bab53b6f02f13b326099c0b7'),(948,2,'20220928.000637.921-financas','2023-03-04 11:44:35','66765a4fe3c955ef709112a36b173366'),(949,2,'20220928.000640.954-financas','2023-03-04 11:44:35','0e4d3e6101f6e29dd8cb2bc698468ff8'),(950,2,'20220928.000643.980-financas','2023-03-04 11:44:35','312858cd80d59294d9b962fd7e64ec31'),(951,2,'20220928.000647.008-financas','2023-03-04 11:44:35','c29a0edb97863d2bda61a3ff124d1ab8'),(952,2,'20220928.000650.050-financas','2023-03-04 11:44:35','7c99d1e018944fb95c1adb9515f59e72'),(953,2,'20220928.000653.076-financas','2023-03-04 11:44:35','879238db850ac148c614f0ba50f7a720'),(954,2,'20220928.000656.104-financas','2023-03-04 11:44:35','03ada47674b0abe2b90f655dbe9d35f7'),(955,2,'20220928.000659.138-financas','2023-03-04 11:44:35','45b9934b5fe4335860e223e631a29ad9'),(956,2,'20220928.000702.173-financas','2023-03-04 11:44:35','21c37a19c3c111bd446bd506dbae4f3a'),(957,2,'20220928.000705.207-financas','2023-03-04 11:44:35','aca900b2472ab6f827f3d3212af3724b'),(958,2,'20220928.000708.236-financas','2023-03-04 11:44:35','70a744fa7ac818575489086ec47015b4'),(959,2,'20220928.000711.264-financas','2023-03-04 11:44:35','b49beac547826fe1a277a305006549aa'),(960,2,'20220928.000714.288-financas','2023-03-04 11:44:35','a250941c4cb7fbf25b3764ce71b40a20'),(961,2,'20220928.000717.326-financas','2023-03-04 11:44:35','52a2debec6baf87ee5f847df82019daf'),(962,2,'20220928.000720.359-financas','2023-03-04 11:44:35','06aadf4404a2c49b3bedca1967093489'),(963,2,'20220928.000723.400-financas','2023-03-04 11:44:35','4e1fe0b861ccc0e7c34128abc06f4d86'),(964,2,'20220928.000726.434-financas','2023-03-04 11:44:35','6aec3389b9e65679f13384a143d2994a'),(965,2,'20220928.000729.468-financas','2023-03-04 11:44:35','9f1a6b675c7e3a2e588eed00a6faadf5'),(966,2,'20220928.000732.501-financas','2023-03-04 11:44:35','7f8c74b906fa06fec3b5ee7429ac772c'),(967,2,'20220928.000735.533-financas','2023-03-04 11:44:35','bdfb8953c06a3cf33e138a81b367311e'),(968,2,'20220928.000738.567-financas','2023-03-04 11:44:35','b66feb75f73638fc357f80f4c38fd4af'),(969,2,'20220928.000741.592-financas','2023-03-04 11:44:35','7cb9e8f21070558a81f9547846fccbc3'),(970,2,'20220928.000744.622-financas','2023-03-04 11:44:35','2d418ed521751220f7fe8e6e8e8dd85b'),(971,2,'20220928.000747.645-financas','2023-03-04 11:44:35','cf7fc354d426dc4ec3270405db9b463b'),(972,2,'20220928.000750.686-financas','2023-03-04 11:44:35','98bd4e380315d24b2b53ce0b78b30e17'),(973,2,'20220928.000753.718-financas','2023-03-04 11:44:35','2fba7e2d5a111e4d11ae59835a1c93d7'),(974,2,'20220928.000756.745-financas','2023-03-04 11:44:35','c4db084b5e184ac5ca310731a109255f'),(975,2,'20220928.000759.767-financas','2023-03-04 11:44:35','ec8608f8231cdfbfae7a728df757a41a'),(976,2,'20220928.000802.796-financas','2023-03-04 11:44:35','7f7f776ea79e41c5a0107725c531fa43'),(977,2,'20220928.000805.827-financas','2023-03-04 11:44:35','35c7ef7860eae506426af31feab46d3e'),(978,2,'20220928.000808.858-financas','2023-03-04 11:44:35','ef12daa586b29a6353bf3749daa30cf4'),(979,2,'20220928.000811.893-financas','2023-03-04 11:44:35','f7fd4bc1ad843e25669b2b6f82225817'),(980,2,'20220928.000814.920-financas','2023-03-04 11:44:35','0359022ea4f8b27d2a4bfc2740829aed'),(981,2,'20220928.000817.950-financas','2023-03-04 11:44:35','213ecf42626f6512601e6c3ecfab6088'),(982,2,'20220928.000820.970-financas','2023-03-04 11:44:35','5392168bdd9380c067d11440b92295bf'),(983,2,'20220928.000823.991-financas','2023-03-04 11:44:35','6118a4645813eedbea999bd2740317e4'),(984,2,'20220928.000827.017-financas','2023-03-04 11:44:35','609364a6243d4caec2f9b3ce4eb39876'),(985,2,'20220928.000830.051-financas','2023-03-04 11:44:35','c59a56abdebcfa8a22c65f7bde12ecd7'),(986,2,'20220928.000833.075-financas','2023-03-04 11:44:35','3dc7f8978c5f22dea574ff02d90b29bd'),(987,2,'20220928.000836.114-financas','2023-03-04 11:44:35','f682ee24e454ced6b2931a452209ebf0'),(988,2,'20220928.000839.133-financas','2023-03-04 11:44:35','452204d4de75bbd2c6daec7bf3e4e260'),(989,2,'20220928.000842.159-financas','2023-03-04 11:44:35','f2465d438fedb59d080b4613719d7989'),(990,2,'20220928.000845.191-financas','2023-03-04 11:44:35','16399a10a3270a5761b4cbb62233f888'),(991,2,'20220928.000848.226-financas','2023-03-04 11:44:35','49399ec82df74064040875ec51af8b93'),(992,2,'20220928.000851.258-financas','2023-03-04 11:44:35','d1b1f343c5daa3fccd03ae1eb8496585'),(993,2,'20220928.000854.278-financas','2023-03-04 11:44:35','bd65531dec43662b1ca08f6088f07f1e'),(994,2,'20220928.000857.314-financas','2023-03-04 11:44:35','cd21e9cadb3764008e97ca2e1ece1366'),(995,2,'20220928.000900.341-financas','2023-03-04 11:44:35','1b318f51889d1b9900aecb3b71a97540'),(996,2,'20220928.000903.379-financas','2023-03-04 11:44:35','99a1af1d9dce2ead11fdd686ded1ae46'),(997,2,'20220928.000906.405-financas','2023-03-04 11:44:35','3da2f2295327d972032f950d794d40ce'),(998,2,'20220928.000909.435-financas','2023-03-04 11:44:35','1ac6cd63513b6c7406479a8b066cdf7e'),(999,2,'20220928.000912.472-financas','2023-03-04 11:44:35','9f4b3a3f49f6851df02434300435d3d9'),(1000,2,'20220928.000915.501-financas','2023-03-04 11:44:35','5e216f81088f8690fe3673799f3fc908'),(1001,2,'20220928.000918.537-financas','2023-03-04 11:44:35','99e66426ef6821954da79cbbdec0b9d8'),(1002,2,'20220928.000921.566-financas','2023-03-04 11:44:35','33a79fc7fe5a0e0a5c87e515e1cfb6aa'),(1003,2,'20220928.000924.597-financas','2023-03-04 11:44:35','144bb2d049e3fc9666e0a2dea6b7f563'),(1004,2,'20220928.000927.634-financas','2023-03-04 11:44:35','1699906fa3ad4985dc691e57da8cb755'),(1005,2,'20220928.000930.662-financas','2023-03-04 11:44:35','f64d0256866c0601dce0f1e179af8e4a'),(1006,2,'20220928.000933.690-financas','2023-03-04 11:44:35','27b0ede857123fdfb44f2b19b290fd6b'),(1007,2,'20220928.000936.726-financas','2023-03-04 11:44:35','5766e741c59ae0c1f17a6bcb63fe40e0'),(1008,2,'20220928.000939.759-financas','2023-03-04 11:44:35','b6c4606f437a77ddfc97196e40dd5189'),(1009,2,'20220928.000942.790-financas','2023-03-04 11:44:35','37b636c2a5d74518c5e9ab0375024e9e'),(1010,2,'20220928.000945.820-financas','2023-03-04 11:44:35','5c163a16a7d1b00d9b3d57dee69c7ff3'),(1011,2,'20220928.000948.853-financas','2023-03-04 11:44:35','d5d27dc57f7e4456a83e91543f76a989'),(1012,2,'20220928.000951.893-financas','2023-03-04 11:44:35','8901a8b5e215a17060cec55438e878b1'),(1013,2,'20220928.000954.921-financas','2023-03-04 11:44:35','bb3c6671b871f40eb6f76f99541fe7b5'),(1014,2,'20220928.000957.956-financas','2023-03-04 11:44:35','b6068dfb05237308495531b154e85343'),(1015,2,'20220928.001000.995-financas','2023-03-04 11:44:35','275dc13a6a7eafffb1b42eea97ed12ab'),(1016,2,'20220928.001004.029-financas','2023-03-04 11:44:35','70c3838b5746f2e1a00104b15428c484'),(1017,2,'20220928.001007.053-financas','2023-03-04 11:44:35','ad89d8ac59ef6b8f91bf0a25b4b59a0c'),(1018,2,'20220928.001010.083-financas','2023-03-04 11:44:35','3ffc1af67ae0e4092598d8cd3f1957a3'),(1019,2,'20220928.001013.112-financas','2023-03-04 11:44:35','0a16b2df48916d07b4e85acaa2862cab'),(1020,2,'20220928.001016.152-financas','2023-03-04 11:44:35','6914faf6b22c6e637e5f0e76912379c6'),(1021,2,'20220928.001019.181-financas','2023-03-04 11:44:35','dfa895ae2633bfea8e173b9d744731fe'),(1022,2,'20220928.001022.212-financas','2023-03-04 11:44:35','3d23cb36e9abd842e061de8a6bab29c8'),(1023,2,'20220928.001025.248-financas','2023-03-04 11:44:35','bac249fdf74601aaa79dfc0239be0f3a'),(1024,2,'20220928.001028.277-financas','2023-03-04 11:44:35','0894db52424f1a36ef36f0a69819001b'),(1025,2,'20220928.001031.307-financas','2023-03-04 11:44:35','18c63f63642cfe3614a021c8b3c51ebe'),(1026,2,'20220928.001034.339-financas','2023-03-04 11:44:35','208c7e02e61ea77e3e824f5d0c8092ec'),(1027,2,'20220928.001037.359-financas','2023-03-04 11:44:35','55684006629cd488264d6122713ef16a'),(1028,2,'20220928.001040.393-financas','2023-03-04 11:44:35','e6bfc5d5bb07aafa3db031ec20087713'),(1029,2,'20220928.001043.426-financas','2023-03-04 11:44:35','85c83b236e41555d5e9d5b39a6ad35c8'),(1030,2,'20220928.001046.452-financas','2023-03-04 11:44:35','81db4b6f5be5564bb9cc13b5ae5a25d7'),(1031,2,'20220928.001049.483-financas','2023-03-04 11:44:35','7ff9b64b52928d1294a03c6e4ee17f40'),(1032,2,'20220928.001052.524-financas','2023-03-04 11:44:35','23a7caa133a657469da5e50d16039b1a'),(1033,2,'20220928.001055.558-financas','2023-03-04 11:44:35','dcb645d900bb0fcaaf229d89c5e37e06'),(1034,2,'20220928.001058.601-financas','2023-03-04 11:44:35','1094c07318896f83fd38db1b46be6e56'),(1035,2,'20220928.001101.633-financas','2023-03-04 11:44:35','60d45e50b80f2692324496906076f390'),(1036,2,'20220928.001104.657-financas','2023-03-04 11:44:35','70630ffdf97a6d6020b8351ec82c6c04'),(1037,2,'20220928.001107.695-financas','2023-03-04 11:44:35','f05a9fe2bf62d09f1f857e334c92f8ab'),(1038,2,'20220928.001110.735-financas','2023-03-04 11:44:35','290521a7f593fec108c9fa83bc2c2bc0'),(1039,2,'20220928.001113.775-financas','2023-03-04 11:44:35','747b7d9598713346c2ca90a54c08bc76'),(1040,2,'20220928.001116.803-financas','2023-03-04 11:44:35','93f61f33baf589c8fbc48c71979822ea'),(1041,2,'20220928.001119.834-financas','2023-03-04 11:44:35','6cbb00491ba5b1a6ac1e16b80a459030'),(1042,2,'20220928.001122.856-financas','2023-03-04 11:44:35','dd3e3ec1fa37291f4a27be508fd4cc75'),(1043,2,'20220928.001125.889-financas','2023-03-04 11:44:35','c10182863ff6643fac846689fee489da'),(1044,2,'20220928.001128.921-financas','2023-03-04 11:44:35','c04e98c85fa243876b4bfce9220e9639'),(1045,2,'20220928.001131.962-financas','2023-03-04 11:44:35','92fe1e13feb4905d298cf75d99766b8e'),(1046,2,'20220928.001134.990-financas','2023-03-04 11:44:35','5e82fed6adc99f4c10e788be34075cc1'),(1047,2,'20220928.001138.026-financas','2023-03-04 11:44:35','b02fdae8d9f73afd6a242d876bb991d4'),(1048,2,'20220928.001141.052-financas','2023-03-04 11:44:35','fb9d94bce9c61ae924f56079cd35ac03'),(1049,2,'20220928.001144.081-financas','2023-03-04 11:44:35','3fed042d90111c0394b0acd888b29864'),(1050,2,'20220928.001147.123-financas','2023-03-04 11:44:35','46a878526232a3040e455de14fd902e8'),(1051,2,'20220928.001150.151-financas','2023-03-04 11:44:35','67e9e3d4b7713a0003eb74cd853d4513'),(1052,2,'20220928.001153.173-financas','2023-03-04 11:44:35','77bb78564b4bcbf648aaf507971a7aee'),(1053,2,'20220928.001156.206-financas','2023-03-04 11:44:35','d648ef1291fc5f1c4789029a29e91220'),(1054,2,'20220928.001159.245-financas','2023-03-04 11:44:35','a8a3e8a35871ad94fca9be437a7ec3d0'),(1055,2,'20220928.001202.273-financas','2023-03-04 11:44:35','2186acb894cb03f0c6f35e525a57f382'),(1056,2,'20220928.001205.305-financas','2023-03-04 11:44:35','63c807fbf8d3b9d000c48a082de5b986'),(1057,2,'20220928.001208.339-financas','2023-03-04 11:44:35','5deae84757fbd6dfb73ddde81961ac1d'),(1058,2,'20220928.001211.375-financas','2023-03-04 11:44:35','9bb6b3cfc774d477e3dac5953ea13ec3'),(1059,2,'20220928.001214.407-financas','2023-03-04 11:44:35','85a3bb6b8abc4547a3ec3547ca91fee3'),(1060,2,'20220928.001217.433-financas','2023-03-04 11:44:35','54b132094a25e1819d1a8de95c3408f6'),(1061,2,'20220928.001220.463-financas','2023-03-04 11:44:35','f16a0c7b6a852a0fc5f26e901ef43ba1'),(1062,2,'20220928.001223.491-financas','2023-03-04 11:44:35','3afa39b9298f2ffa88c070ea6174c7e7'),(1063,2,'20220928.001226.518-financas','2023-03-04 11:44:35','a2a2cd7abd8650bdd2b1ad8b8eab1166'),(1064,2,'20220928.001229.546-financas','2023-03-04 11:44:35','1f42f78e83163f174df609950ab83824'),(1065,2,'20220928.001232.578-financas','2023-03-04 11:44:35','c22c9f98b195413edf4beaeb28ae9862'),(1066,2,'20220928.001235.619-financas','2023-03-04 11:44:35','2c112d1593ec09c5cbb644f4d4fb2843'),(1067,2,'20220928.001238.658-financas','2023-03-04 11:44:35','531870c90c709eb9f1afea2ab1626d46'),(1068,2,'20220928.001241.691-financas','2023-03-04 11:44:35','6a23e5ba24d1943882f6576cfc11d7b5'),(1069,2,'20220928.001244.721-financas','2023-03-04 11:44:35','bc43adc5ecd881aae88e6c44b4d2eb71'),(1070,2,'20220928.001247.753-financas','2023-03-04 11:44:35','8589fc0b3d3a4d536a344394c13d28c2'),(1071,2,'20220928.001250.785-financas','2023-03-04 11:44:35','f4aca580b6cd0edfffd18aadb0341e02'),(1072,2,'20220928.001253.812-financas','2023-03-04 11:44:35','d72bdbf5a26c72bc2424951091f53440'),(1073,2,'20220928.001256.838-financas','2023-03-04 11:44:35','c916699da36efe1a2c34c983f982d84c'),(1074,2,'20220928.001259.867-financas','2023-03-04 11:44:35','f72f3555410bf01f0d8dae500ce9018d'),(1075,2,'20220928.001302.909-financas','2023-03-04 11:44:35','58f410ac4b1ba3e132233913e7800b60'),(1076,2,'20220928.001305.942-financas','2023-03-04 11:44:35','7480bbffe491131be1300c0b24e72217'),(1077,2,'20220928.001308.980-financas','2023-03-04 11:44:35','ddfd6dd5bcae98a310d1b1418d6c04f0'),(1078,2,'20220928.001312.010-financas','2023-03-04 11:44:35','e98fbfbd09be7ce0457bbd249b98b9e9'),(1079,2,'20220928.001315.039-financas','2023-03-04 11:44:35','0761890b35cde8c0da1399428ff314f5'),(1080,2,'20220928.001318.070-financas','2023-03-04 11:44:35','3ffa5212e1836156e905a0cc7836ce79'),(1081,2,'20220928.001321.102-financas','2023-03-04 11:44:35','988e2efdbd31a5055ad019d0b87bd9cf'),(1082,2,'20220928.001324.136-financas','2023-03-04 11:44:35','9ce9732d31cc1a4f73085a73c7e6e45c'),(1083,2,'20220928.001327.166-financas','2023-03-04 11:44:35','7afabcc349b19399f6098388b10fa344'),(1084,2,'20220928.001330.196-financas','2023-03-04 11:44:35','5ce4445d49f97559466a35cf3fb5afc9'),(1085,2,'20220928.001333.225-financas','2023-03-04 11:44:35','7228f7506e00c55126a6d2460b1ee777'),(1086,2,'20220928.001336.250-financas','2023-03-04 11:44:35','20b4153a01580ce0c5a1506b7e41406f'),(1087,2,'20220928.001339.281-financas','2023-03-04 11:44:35','cc2bd5e96bb74a81f4469328770cd5c8'),(1088,2,'20220928.001342.306-financas','2023-03-04 11:44:36','32101f455587e26bffc19b1a5c0c8100'),(1089,2,'20220928.001345.336-financas','2023-03-04 11:44:36','5bbb5304e6b550e1bf7460ab9fdab33c'),(1090,2,'20220928.001348.365-financas','2023-03-04 11:44:36','624047fa0068988f2cf1502302bc6f34'),(1091,2,'20220928.001351.392-financas','2023-03-04 11:44:36','ce5b098edf85b1e4b4f462b46605a137'),(1092,2,'20220928.001354.423-financas','2023-03-04 11:44:36','637e918bac5491419b8a66194515d98f'),(1093,2,'20220928.001357.454-financas','2023-03-04 11:44:36','bca607fc133b94b7772e5feacbec072c'),(1094,2,'20220928.001400.490-financas','2023-03-04 11:44:36','6ff5f237430a927fa9154ced6c7a9b44'),(1095,2,'20220928.001403.510-financas','2023-03-04 11:44:36','7816c702444fdac791d3c0e51ac50c6d'),(1096,2,'20220928.001406.543-financas','2023-03-04 11:44:36','0af52da70149afac9e629c7d86cce936'),(1097,2,'20220928.001409.571-financas','2023-03-04 11:44:36','1dd2d89ef1173087caf79674fa66d5a6'),(1098,2,'20220928.001412.597-financas','2023-03-04 11:44:36','6d5c23342dcfb5035175d52247b3a41e'),(1099,2,'20221010.125555.282-financas','2023-03-04 11:44:36','f02654ccaea770152ad09fa4dfa4e747'),(1100,2,'20221109.220608.516-financas','2023-03-04 11:44:36','ea5f7e05d913a325c773d37694f55223'),(1101,2,'20221109.220611.556-financas','2023-03-04 11:44:36','edcdfb735ce024a8b0c801a8660f786a'),(1102,2,'20221109.220614.587-financas','2023-03-04 11:44:36','b11cc35b2f80c1ced6f2c06ddbf6d5f3'),(1103,2,'20221109.220617.620-financas','2023-03-04 11:44:36','5306b12eed646be2991ae791439693af'),(1104,2,'20221109.220620.652-financas','2023-03-04 11:44:36','1f8599358b4ba3f6d96b8af440c80f1c'),(1105,2,'20221109.220623.682-financas','2023-03-04 11:44:36','554f2fa27ffecc7217ec94723ffa0160'),(1106,2,'20221109.220626.717-financas','2023-03-04 11:44:36','8b92767288d659ee1e980e7c03102471'),(1107,2,'20221109.220629.751-financas','2023-03-04 11:44:36','89698ddb72fbbc7952231c7eab3ab36d'),(1108,2,'20221109.220632.783-financas','2023-03-04 11:44:36','0911975ea83542b225878fcbe00ba42d'),(1109,2,'20221109.220635.812-financas','2023-03-04 11:44:36','da4516949165f493b0424fdc45b47abc'),(1110,2,'20221109.220638.847-financas','2023-03-04 11:44:36','bf4a0233b131fd238cd874ce14de0c54'),(1111,2,'20221109.220641.879-financas','2023-03-04 11:44:36','f68ffd72cdc27ed401fa7dde061c8656'),(1112,2,'20221109.220644.908-financas','2023-03-04 11:44:36','c6aa1b7ceec41e32de19e6d0a34dd309'),(1113,2,'20221109.220647.939-financas','2023-03-04 11:44:36','f4bea757d7a553097e36e3422a44abc5'),(1114,2,'20221111.190830.275-financas','2023-03-04 11:44:36','a73d2d9a799d4b7875058e593a55575f'),(1115,2,'20221111.191354.353-financas','2023-03-04 11:44:36','33f079badaccb7fbef82c0f08ab78048'),(1116,2,'20221117.190045.919-financas','2023-03-04 11:44:36','b7c806b76100b7997a615a7859a0f123'),(1117,2,'20221117.190048.951-financas','2023-03-04 11:44:36','bad1e43cc95f80cc97488a3f25a6bd08'),(1118,2,'20221117.190051.979-financas','2023-03-04 11:44:36','d5f1cdc834f0b69e05e78cef1c46ed56'),(1119,2,'20221117.190055.001-financas','2023-03-04 11:44:36','737ed519e8d0c076d3b2271a2f205e30'),(1120,2,'20221122.233150.252-financas','2023-03-04 11:44:36','5a5cc062fa5de9171f0411746102dfcf'),(1121,2,'20221122.233153.288-financas','2023-03-04 11:44:36','f499d8461b90d8ca938162cd63e5d12d'),(1122,2,'20221122.233156.331-financas','2023-03-04 11:44:36','b94705ddcc64b29977565d657cdfc772'),(1123,2,'20221201.224522.145-financas','2023-03-04 11:44:36','772296ec810a684adbc1dafb9c09a149'),(1124,2,'20221201.224525.175-financas','2023-03-04 11:44:36','e5287682bb5af669398f65e0ee97d16a'),(1125,2,'20221220.194047.193-financas','2023-03-04 11:44:36','4c6d52440204c054c32b0dc828b3a4b1'),(1126,2,'20221220.194050.224-financas','2023-03-04 11:44:36','bb1233bc0ff3de3978bde6993c7ff73c'),(1127,2,'20221220.194053.256-financas','2023-03-04 11:44:36','b44d00aed0130b5a7410f0ad33ad9acd'),(1128,2,'20221220.194056.285-financas','2023-03-04 11:44:36','554234cebacd994abf4a8c5dae85b29b'),(1129,2,'20221220.194059.310-financas','2023-03-04 11:44:36','9fbb2839e221016f060afa9d4e31c369'),(1130,2,'20221220.194102.332-financas','2023-03-04 11:44:36','94670d3b3b92696dc0cd52df62c16e56'),(1131,2,'20221220.194105.360-financas','2023-03-04 11:44:36','1bf177152b2c193f31628c53aef8dbc5'),(1132,2,'20221220.194108.395-financas','2023-03-04 11:44:36','918ed2b3f8b82ee7e274338ea0a395d2'),(1133,2,'20221220.194111.419-financas','2023-03-04 11:44:36','d590d1f406d87420f04d68dac0c3cb31'),(1134,2,'20221220.194114.446-financas','2023-03-04 11:44:36','0671e58f67821fe36d57cfefb948bbef'),(1135,2,'20221220.194117.479-financas','2023-03-04 11:44:36','951cc95b78e66f812059eac735690144'),(1136,2,'20221220.194120.507-financas','2023-03-04 11:44:36','28f29e78b6e6d265dacb523a9df0e829'),(1137,2,'20221220.194123.539-financas','2023-03-04 11:44:36','6bd8d5aa613373ffc0732fb805dd03d7'),(1138,2,'20221220.194126.571-financas','2023-03-04 11:44:36','d9c7c06e6f0cddf3c03969892aef575b'),(1139,2,'20221220.194129.595-financas','2023-03-04 11:44:36','63bb46f5b089e524117cb4707059533d'),(1140,2,'20221220.194132.624-financas','2023-03-04 11:44:36','be86cd7c6ff5e063ccdd3693262290a7'),(1141,2,'20230112.000154.665-financas','2023-03-04 11:44:36','1f5161264b3ef56e3ec6ffcb051dadac'),(1142,2,'20230112.000157.707-financas','2023-03-04 11:44:36','3dd831359ae8e86376d01bac6bdde677'),(1143,2,'20230223.183932.325-financas','2023-03-04 11:44:36','1c9cb4ae3bfbfe3bc2440aea5bd704f5'),(1144,2,'20230223.183935.356-financas','2023-03-04 11:44:36','abe24ec74d834dbfca36e66f14e3b8f9'),(1145,2,'20230223.183938.384-financas','2023-03-04 11:44:36','d826a2274863937295312618f076871c'),(1146,2,'20230223.183941.416-financas','2023-03-04 11:44:36','d3a68cdef540dbd134fc89c568416f2e'),(1147,2,'20230301.163119.222-financas','2023-03-04 11:44:36','a01351b39b76bd8e37f61a98ccad7fb2');
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

-- Dump completed on 2023-03-06 10:25:00
