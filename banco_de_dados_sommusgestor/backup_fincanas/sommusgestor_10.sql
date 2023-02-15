-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_10
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,NULL,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,97,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,NULL,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,98,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,NULL,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,NULL,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,NULL,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,NULL,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,NULL,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,NULL,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,105,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,NULL,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,NULL,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,NULL,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,NULL,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,NULL,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,NULL,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,NULL,'','S',3),(117,28,'2','CUSTOS',NULL,NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,NULL,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,121,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,NULL,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,NULL,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,NULL,'C','A',4),(124,35,'3','DESPESAS',NULL,NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,NULL,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,NULL,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,NULL,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,NULL,'D','A',4),(130,41,'3.1.01.005','Cartório',23,NULL,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,NULL,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,NULL,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,NULL,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,NULL,'D','A',4),(135,46,'3.1.01.010','Correios',23,NULL,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,NULL,'D','A',4),(137,48,'3.1.01.012','Doações',23,NULL,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,NULL,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,NULL,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,NULL,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,NULL,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,NULL,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,NULL,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,NULL,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,NULL,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,NULL,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,NULL,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,NULL,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,NULL,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,NULL,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,NULL,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,NULL,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,NULL,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,NULL,'D','A',4),(156,67,'3.1.02.002','Comissões',24,NULL,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,NULL,'D','A',4),(158,69,'3.1.02.004','Premiações',24,NULL,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,NULL,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,NULL,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,NULL,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,NULL,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,NULL,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,NULL,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,NULL,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,NULL,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,NULL,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,NULL,'D','A',4),(172,83,'3.1.05.004','Jornais',27,NULL,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,NULL,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,NULL,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,NULL,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,NULL,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,NULL,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,NULL,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,NULL,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,NULL,'D','A',4),(182,93,'3.1.06.005','Comissão',28,NULL,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,NULL,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,NULL,'D','A',4),(185,96,'3.1.06.008','Férias',28,NULL,'D','A',4),(186,97,'3.1.06.009','FGTS',28,NULL,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,NULL,'D','A',4),(188,99,'3.1.06.011','INSS',28,NULL,'D','A',4),(189,100,'3.1.06.012','IRRF',28,NULL,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,NULL,'D','A',4),(191,102,'3.1.06.014','Salário',28,NULL,'D','A',4),(192,103,'3.1.06.015','Salário família',28,NULL,'D','A',4),(193,104,'3.1.06.016','Seguro',28,NULL,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,NULL,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,NULL,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,NULL,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,NULL,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,NULL,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,NULL,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,NULL,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,NULL,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,NULL,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,NULL,'D','A',4),(208,119,'4.1.01.002','Ações',32,NULL,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,NULL,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,NULL,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,NULL,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,NULL,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,NULL,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,NULL,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,NULL,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,NULL,'','S',3);
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
INSERT INTO `categoria_empresa` VALUES (90,17,NULL,'',1,0),(91,17,NULL,'',1,0),(92,17,NULL,'',1,0),(93,17,NULL,'',1,0),(94,17,NULL,'',1,0),(95,17,NULL,'',1,0),(96,17,NULL,'',1,0),(97,17,NULL,'',1,0),(98,17,NULL,'',1,0),(99,17,NULL,'',1,0),(100,17,NULL,'',1,0),(101,17,NULL,'',1,0),(102,17,NULL,'',1,0),(103,17,NULL,'',1,0),(104,17,NULL,'',1,0),(105,17,NULL,'',1,0),(106,17,NULL,'',1,0),(107,17,NULL,'',1,0),(108,17,NULL,'',1,0),(109,17,NULL,'',1,0),(110,17,NULL,'',1,0),(111,17,NULL,'',1,0),(112,17,NULL,'',1,0),(113,17,NULL,'',1,0),(114,17,NULL,'',1,0),(115,17,NULL,'',1,0),(116,17,NULL,'',1,0),(117,17,NULL,'',1,0),(118,17,NULL,'',1,0),(119,17,NULL,'',1,0),(120,17,NULL,'',1,0),(121,17,NULL,'',1,0),(122,17,NULL,'',1,0),(123,17,NULL,'',1,0),(124,17,NULL,'',1,0),(125,17,NULL,'',1,0),(126,17,NULL,'',1,0),(127,17,NULL,'',1,0),(128,17,NULL,'',1,0),(129,17,NULL,'',1,0),(130,17,NULL,'',1,0),(131,17,NULL,'',1,0),(132,17,NULL,'',1,0),(133,17,NULL,'',1,0),(134,17,NULL,'',1,0),(135,17,NULL,'',1,0),(136,17,NULL,'',1,0),(137,17,NULL,'',1,0),(138,17,NULL,'',1,0),(139,17,NULL,'',1,0),(140,17,NULL,'',1,0),(141,17,NULL,'',1,0),(142,17,NULL,'',1,0),(143,17,NULL,'',1,0),(144,17,NULL,'',1,0),(145,17,NULL,'',1,0),(146,17,NULL,'',1,0),(147,17,NULL,'',1,0),(148,17,NULL,'',1,0),(149,17,NULL,'',1,0),(150,17,NULL,'',1,0),(151,17,NULL,'',1,0),(152,17,NULL,'',1,0),(153,17,NULL,'',1,0),(154,17,NULL,'',1,0),(155,17,NULL,'',1,0),(156,17,NULL,'',1,0),(157,17,NULL,'',1,0),(158,17,NULL,'',1,0),(159,17,NULL,'',1,0),(160,17,NULL,'',1,0),(161,17,NULL,'',1,0),(162,17,NULL,'',1,0),(163,17,NULL,'',1,0),(164,17,NULL,'',1,0),(165,17,NULL,'',1,0),(166,17,NULL,'',1,0),(167,17,NULL,'',1,0),(168,17,NULL,'',1,0),(169,17,NULL,'',1,0),(170,17,NULL,'',1,0),(171,17,NULL,'',1,0),(172,17,NULL,'',1,0),(173,17,NULL,'',1,0),(174,17,NULL,'',1,0),(175,17,NULL,'',1,0),(176,17,NULL,'',1,0),(177,17,NULL,'',1,0),(178,17,NULL,'',1,0),(179,17,NULL,'',1,0),(180,17,NULL,'',1,0),(181,17,NULL,'',1,0),(182,17,NULL,'',1,0),(183,17,NULL,'',1,0),(184,17,NULL,'',1,0),(185,17,NULL,'',1,0),(186,17,NULL,'',1,0),(187,17,NULL,'',1,0),(188,17,NULL,'',1,0),(189,17,NULL,'',1,0),(190,17,NULL,'',1,0),(191,17,NULL,'',1,0),(192,17,NULL,'',1,0),(193,17,NULL,'',1,0),(194,17,NULL,'',1,0),(195,17,NULL,'',1,0),(196,17,NULL,'',1,0),(197,17,NULL,'',1,0),(198,17,NULL,'',1,0),(199,17,NULL,'',1,0),(200,17,NULL,'',1,0),(201,17,NULL,'',1,0),(202,17,NULL,'',1,0),(203,17,NULL,'',1,0),(204,17,NULL,'',1,0),(205,17,NULL,'',1,0),(206,17,NULL,'',1,0),(207,17,NULL,'',1,0),(208,17,NULL,'',1,0),(209,17,NULL,'',1,0),(210,17,NULL,'',1,0),(211,17,NULL,'',1,0),(212,17,NULL,'',1,0),(213,17,NULL,'',1,0),(214,17,NULL,'',1,0),(215,17,NULL,'',1,0),(216,17,NULL,'',1,0),(217,17,NULL,'',1,0),(218,17,NULL,'',1,0),(219,17,NULL,'',1,0),(220,17,NULL,'',1,0),(221,17,NULL,'',1,0),(222,17,NULL,'',1,0),(223,17,NULL,'',1,0),(224,17,NULL,'',1,0);
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
INSERT INTO `categoria_grupo_conta_contabil` VALUES (1,1,34,1,1,1,1),(2,1,78,1,1,1,1),(3,1,4,1,1,1,2),(4,1,9,1,2,2,2),(5,1,34,1,1,1,2),(6,1,56,1,1,2,2),(7,1,78,1,1,3,2),(8,1,29,1,1,3,2),(9,2,6,2,1,1,2),(10,2,9,2,2,2,2),(11,2,34,2,1,1,2),(12,2,56,2,1,2,2),(13,2,78,2,1,3,2),(14,2,29,2,1,3,2),(15,3,35,1,1,1,1),(16,3,78,1,1,1,1),(17,3,4,1,1,1,2),(18,3,35,1,1,1,2),(19,3,78,1,1,1,2),(20,3,29,1,1,1,2),(21,4,6,2,1,1,2),(22,4,35,2,1,1,2),(23,4,78,2,1,1,2),(24,4,29,2,1,1,2),(25,5,36,9,1,7,1),(26,5,71,9,1,8,1),(27,5,50,9,1,9,1),(28,5,78,9,1,1,1),(29,5,4,9,1,1,2),(30,5,6,9,2,7,2),(31,5,71,9,1,8,2),(32,5,50,9,1,9,2),(33,5,78,9,1,10,2),(34,5,29,9,1,10,2),(35,6,37,9,1,7,1),(36,6,71,9,1,8,1),(37,6,50,9,1,9,1),(38,6,78,9,1,1,1),(39,6,4,9,1,1,2),(40,6,6,9,2,7,2),(41,6,71,9,1,8,2),(42,6,50,9,1,9,2),(43,6,78,9,1,10,2),(44,6,29,9,1,10,2),(45,7,38,5,2,1,1),(46,7,78,5,2,1,1),(47,7,4,5,2,1,2),(48,7,9,5,1,2,2),(49,7,38,5,2,1,2),(50,7,56,5,2,2,2),(51,7,78,5,2,3,2),(52,7,29,5,2,3,2),(53,8,6,6,2,1,2),(54,8,9,6,1,2,2),(55,8,38,6,2,1,2),(56,8,56,6,2,2,2),(57,8,78,6,2,3,2),(58,8,29,6,2,3,2),(59,9,39,5,2,1,1),(60,9,78,5,2,1,1),(61,9,4,5,2,1,2),(62,9,39,5,2,1,2),(63,9,78,5,2,1,2),(64,9,29,5,2,1,2),(65,10,6,6,2,1,2),(66,10,39,6,2,1,2),(67,10,78,6,2,1,2),(68,10,29,6,2,1,2),(69,11,6,15,1,1,2),(70,11,41,15,1,1,2),(71,11,78,15,1,1,2),(72,11,29,15,1,1,2),(73,12,41,9,1,7,1),(74,12,71,9,1,8,1),(75,12,50,9,1,9,1),(76,12,78,9,1,1,1),(77,12,4,9,1,1,2),(78,12,6,9,2,7,2),(79,12,71,9,1,8,2),(80,12,50,9,1,9,2),(81,12,78,9,1,10,2),(82,12,29,9,1,10,2),(83,13,45,11,1,1,1),(84,13,78,11,1,1,1),(85,13,4,11,1,1,2),(86,13,45,11,1,1,2),(87,13,78,11,1,1,2),(88,13,25,11,1,1,2),(89,13,7,12,1,1,2),(90,13,45,12,1,1,2),(91,13,78,12,1,1,2),(92,13,25,12,1,1,2),(93,13,45,9,1,7,1),(94,13,71,9,1,8,1),(95,13,50,9,1,9,1),(96,13,78,9,1,1,1),(97,13,4,9,1,1,2),(98,13,7,9,2,7,2),(99,13,71,9,1,8,2),(100,13,50,9,1,9,2),(101,13,78,9,1,10,2),(102,13,29,9,1,10,2),(103,14,46,11,1,1,1),(104,14,78,11,1,1,1),(105,14,4,11,1,1,2),(106,14,13,11,2,1,2),(107,14,7,12,1,1,2),(108,14,13,12,2,1,2),(109,14,46,9,1,7,1),(110,14,71,9,1,8,1),(111,14,50,9,1,9,1),(112,14,78,9,1,1,1),(113,14,4,9,1,1,2),(114,14,7,9,2,7,2),(115,14,71,9,1,8,2),(116,14,50,9,1,9,2),(117,14,78,9,1,10,2),(118,14,29,9,1,10,2),(119,15,47,11,1,1,1),(120,15,78,11,1,1,1),(121,15,4,11,1,1,2),(122,15,12,11,2,1,2),(123,15,7,12,1,1,2),(124,15,12,12,2,1,2),(125,15,47,9,1,7,1),(126,15,71,9,1,8,1),(127,15,50,9,1,9,1),(128,15,78,9,1,1,1),(129,15,4,9,1,1,2),(130,15,7,9,2,7,2),(131,15,71,9,1,8,2),(132,15,50,9,1,9,2),(133,15,78,9,1,10,2),(134,15,29,9,1,10,2),(135,16,48,11,1,1,1),(136,16,78,11,1,1,1),(137,16,4,11,1,1,2),(138,16,48,11,1,1,2),(139,16,78,11,1,1,2),(140,16,29,11,1,1,2),(141,16,7,12,1,1,2),(142,16,48,12,1,1,2),(143,16,78,12,1,1,2),(144,16,29,12,1,1,2),(145,16,48,9,1,7,1),(146,16,71,9,1,8,1),(147,16,50,9,1,9,1),(148,16,78,9,1,1,1),(149,16,4,9,1,1,2),(150,16,7,9,2,7,2),(151,16,71,9,1,8,2),(152,16,50,9,1,9,2),(153,16,78,9,1,10,2),(154,16,29,9,1,10,2),(155,17,52,11,1,1,1),(156,17,78,11,1,1,1),(157,17,4,11,1,1,2),(158,17,52,11,1,1,2),(159,17,78,11,1,1,2),(160,17,29,11,1,1,2),(161,17,7,12,1,1,2),(162,17,52,12,1,1,2),(163,17,78,12,1,1,2),(164,17,29,12,1,1,2),(165,17,52,9,1,7,1),(166,17,71,9,1,8,1),(167,17,50,9,1,9,1),(168,17,78,9,1,1,1),(169,17,4,9,1,1,2),(170,17,7,9,2,7,2),(171,17,71,9,1,8,2),(172,17,50,9,1,9,2),(173,17,78,9,1,10,2),(174,17,29,9,1,10,2),(175,18,56,3,1,1,1),(176,18,78,3,2,1,1),(177,18,4,3,2,1,2),(178,18,9,3,1,1,2),(179,19,18,4,1,1,2),(180,19,9,4,1,1,2),(181,20,56,10,1,7,1),(182,20,49,10,1,8,1),(183,20,72,10,1,9,1),(184,20,78,10,2,1,1),(185,20,4,10,1,1,2),(186,20,18,10,2,7,2),(187,20,49,10,1,8,2),(188,20,72,10,1,9,2),(189,20,78,10,2,10,2),(190,20,29,10,2,10,2),(191,21,56,7,2,1,1),(192,21,78,7,1,1,1),(193,21,4,7,1,1,2),(194,21,9,7,2,1,2),(195,22,18,8,2,1,2),(196,22,9,8,2,1,2),(197,23,63,11,1,1,1),(198,23,78,11,2,1,1),(199,23,4,11,2,1,2),(200,23,63,11,1,1,2),(201,23,78,11,2,1,2),(202,23,29,11,2,1,2),(203,23,21,13,1,1,2),(204,23,63,13,1,1,2),(205,23,78,13,2,1,2),(206,23,29,13,2,1,2),(207,23,63,10,1,7,1),(208,23,49,10,1,8,1),(209,23,72,10,1,9,1),(210,23,78,10,2,1,1),(211,23,4,10,2,1,2),(212,23,21,10,2,7,2),(213,23,49,10,1,8,2),(214,23,72,10,1,9,2),(215,23,78,10,2,10,2),(216,23,29,10,2,10,2),(217,24,64,11,1,1,1),(218,24,78,11,2,1,1),(219,24,4,11,2,1,2),(220,24,64,11,1,1,2),(221,24,78,11,2,1,2),(222,24,29,11,2,1,2),(223,24,21,13,1,1,2),(224,24,64,13,1,1,2),(225,24,78,13,2,1,2),(226,24,29,13,2,1,2),(227,24,64,10,1,7,1),(228,24,49,10,1,8,1),(229,24,72,10,1,9,1),(230,24,78,10,2,1,1),(231,24,4,10,2,1,2),(232,24,21,10,2,7,2),(233,24,49,10,1,8,2),(234,24,72,10,1,9,2),(235,24,78,10,2,10,2),(236,24,29,10,2,10,2),(237,25,65,11,1,1,1),(238,25,78,11,2,1,1),(239,25,4,11,2,1,2),(240,25,65,11,1,1,2),(241,25,78,11,2,1,2),(242,25,29,11,2,1,2),(243,25,21,13,1,1,2),(244,25,65,13,1,1,2),(245,25,78,13,2,1,2),(246,25,29,13,2,1,2),(247,25,65,10,1,7,1),(248,25,49,10,1,8,1),(249,25,72,10,1,9,1),(250,25,78,10,2,1,1),(251,25,4,10,2,1,2),(252,25,21,10,2,7,2),(253,25,49,10,1,8,2),(254,25,72,10,1,9,2),(255,25,78,10,2,10,2),(256,25,29,10,2,10,2),(257,26,66,11,1,1,1),(258,26,78,11,2,1,1),(259,26,4,11,2,1,2),(260,26,66,11,1,1,2),(261,26,78,11,2,1,2),(262,26,29,11,2,1,2),(263,26,21,13,1,1,2),(264,26,66,13,1,1,2),(265,26,78,13,2,1,2),(266,26,29,13,2,1,2),(267,26,66,10,1,7,1),(268,26,49,10,1,8,1),(269,26,72,10,1,9,1),(270,26,78,10,2,1,1),(271,26,4,10,2,1,2),(272,26,21,10,2,7,2),(273,26,49,10,1,8,2),(274,26,72,10,1,9,2),(275,26,78,10,2,10,2),(276,26,29,10,2,10,2),(277,27,67,11,1,1,1),(278,27,78,11,2,1,1),(279,27,4,11,2,1,2),(280,27,67,11,1,1,2),(281,27,78,11,2,1,2),(282,27,29,11,2,1,2),(283,27,21,13,1,1,2),(284,27,67,13,1,1,2),(285,27,78,13,2,1,2),(286,27,29,13,2,1,2),(287,27,67,10,1,7,1),(288,27,49,10,1,8,1),(289,27,72,10,1,9,1),(290,27,78,10,2,1,1),(291,27,4,10,2,1,2),(292,27,21,10,2,7,2),(293,27,49,10,1,8,2),(294,27,72,10,1,9,2),(295,27,78,10,2,10,2),(296,27,29,10,2,10,2),(297,28,68,14,1,1,1),(298,28,78,14,2,1,1),(299,28,4,14,2,1,2),(300,28,68,14,1,1,2),(301,28,78,14,2,1,2),(302,28,29,14,2,1,2),(303,29,68,14,2,1,1),(304,29,78,14,1,1,1),(305,29,4,14,1,1,2),(306,29,68,14,2,1,2),(307,29,78,14,1,1,2),(308,29,29,14,1,1,2),(309,30,69,11,1,1,1),(310,30,78,11,2,1,1),(311,30,4,11,2,1,2),(312,30,69,11,1,1,2),(313,30,78,11,2,1,2),(314,30,29,11,2,1,2),(315,30,21,13,1,1,2),(316,30,69,13,1,1,2),(317,30,78,13,2,1,2),(318,30,29,13,2,1,2),(319,30,69,10,1,7,1),(320,30,49,10,1,8,1),(321,30,72,10,1,9,1),(322,30,78,10,2,1,1),(323,30,4,10,2,1,2),(324,30,21,10,2,7,2),(325,30,49,10,1,8,2),(326,30,72,10,1,9,2),(327,30,78,10,2,10,2),(328,30,29,10,2,10,2),(329,31,74,11,1,1,1),(330,31,78,11,2,1,1),(331,31,4,11,2,1,2),(332,31,74,11,1,1,2),(333,31,78,11,2,1,2),(334,31,29,11,2,1,2),(335,31,21,13,1,1,2),(336,31,74,13,1,1,2),(337,31,78,13,2,1,2),(338,31,29,13,2,1,2),(339,31,74,10,1,7,1),(340,31,49,10,1,8,1),(341,31,72,10,1,9,1),(342,31,78,10,2,1,1),(343,31,4,10,2,1,2),(344,31,21,10,2,7,2),(345,31,49,10,1,8,2),(346,31,72,10,1,9,2),(347,31,78,10,2,10,2),(348,31,29,10,2,10,2),(349,32,58,11,1,1,1),(350,32,78,11,2,1,1),(351,32,4,11,2,1,2),(352,32,12,11,1,1,2),(353,32,21,13,1,1,2),(354,32,12,13,1,1,2),(355,32,58,10,1,7,1),(356,32,49,10,1,8,1),(357,32,72,10,1,9,1),(358,32,78,10,2,1,1),(359,32,4,10,2,1,2),(360,32,21,10,2,7,2),(361,32,49,10,1,8,2),(362,32,72,10,1,9,2),(363,32,78,10,2,10,2),(364,32,29,10,2,10,2),(365,33,59,11,1,1,1),(366,33,78,11,2,1,1),(367,33,4,11,2,1,2),(368,33,13,11,1,1,2),(369,33,21,13,1,1,2),(370,33,13,13,1,1,2),(371,33,59,10,1,7,1),(372,33,49,10,1,8,1),(373,33,72,10,1,9,1),(374,33,78,10,2,1,1),(375,33,4,10,2,1,2),(376,33,21,10,2,7,2),(377,33,49,10,1,8,2),(378,33,72,10,1,9,2),(379,33,78,10,2,10,2),(380,33,29,10,2,10,2),(381,34,60,11,1,1,1),(382,34,78,11,2,1,1),(383,34,4,11,2,1,2),(384,34,14,11,1,1,2),(385,34,21,13,1,1,2),(386,34,14,13,1,1,2),(387,34,60,10,1,7,1),(388,34,49,10,1,8,1),(389,34,72,10,1,9,1),(390,34,78,10,2,1,1),(391,34,4,10,2,1,2),(392,34,21,10,2,7,2),(393,34,49,10,1,8,2),(394,34,72,10,1,9,2),(395,34,78,10,2,10,2),(396,34,29,10,2,10,2),(397,35,4,16,1,4,2),(398,35,19,16,1,5,2),(399,35,20,16,2,6,2),(400,36,49,10,1,8,1),(401,36,72,10,1,9,1),(402,36,78,10,2,10,1),(403,36,4,10,2,1,2),(404,36,19,10,2,7,2),(405,36,49,10,1,8,2),(406,36,72,10,1,9,2),(407,36,78,10,2,10,2),(408,36,29,10,2,10,2),(409,37,65,10,1,7,1),(410,37,49,10,1,8,1),(411,37,72,10,1,9,1),(412,37,78,10,2,1,1),(413,37,4,10,2,1,2),(414,37,19,10,2,7,2),(415,37,20,10,1,7,2),(416,37,65,10,1,7,2),(417,37,49,10,1,8,2),(418,37,72,10,1,9,2),(419,37,78,10,2,1,2),(420,37,29,10,2,1,2),(421,38,51,11,1,1,1),(422,38,78,11,1,1,1),(423,38,4,11,1,1,2),(424,38,51,11,1,1,2),(425,38,78,11,1,1,2),(426,38,30,11,1,1,2),(427,38,7,12,1,1,2),(428,38,51,12,1,1,2),(429,38,78,12,1,1,2),(430,38,30,12,1,1,2),(431,38,51,9,1,7,1),(432,38,71,9,1,8,1),(433,38,50,9,1,9,1),(434,38,78,9,1,1,1),(435,38,4,9,1,1,2),(436,38,7,9,2,7,2),(437,38,71,9,1,8,2),(438,38,50,9,1,9,2),(439,38,78,9,1,10,2),(440,38,29,9,1,10,2),(441,39,73,11,1,1,1),(442,39,78,11,2,1,1),(443,39,4,11,2,1,2),(444,39,73,11,1,1,2),(445,39,78,11,2,1,2),(446,39,30,11,2,1,2),(447,39,21,13,1,1,2),(448,39,73,13,1,1,2),(449,39,78,13,2,1,2),(450,39,30,13,2,1,2),(451,39,73,10,1,7,1),(452,39,49,10,1,8,1),(453,39,72,10,1,9,1),(454,39,78,10,2,1,1),(455,39,4,10,2,1,2),(456,39,21,10,2,7,2),(457,39,49,10,1,8,2),(458,39,72,10,1,9,2),(459,39,78,10,2,10,2),(460,39,29,10,2,10,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_resultado`
--

LOCK TABLES `centro_resultado` WRITE;
/*!40000 ALTER TABLE `centro_resultado` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato`
--

LOCK TABLES `cliente_contrato` WRITE;
/*!40000 ALTER TABLE `cliente_contrato` DISABLE KEYS */;
INSERT INTO `cliente_contrato` VALUES (1,17,2,NULL,8,NULL,1,104,NULL,'2023-02-13','0001-01-01','0001-01-01','2023-02-13',15,0.00,7.1770,0.0000,1,2,2,1,3,1,0,0,0,0,0.0000,'',1,0),(2,17,4,NULL,8,NULL,1,104,NULL,'2023-02-13','0001-01-01','0001-01-01','2023-02-13',5,0.00,7.1770,0.0000,1,2,2,1,3,1,0,0,0,0,0.0000,'',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_atividade`
--

LOCK TABLES `cliente_contrato_atividade` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_atividade` DISABLE KEYS */;
INSERT INTO `cliente_contrato_atividade` VALUES (1,1,NULL,17,'2023-02-13 16:42:30',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(2,1,NULL,17,'2023-02-13 16:42:30',3,'',0.00,7.1770,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(3,2,NULL,17,'2023-02-13 16:42:30',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(4,2,NULL,17,'2023-02-13 16:42:30',3,'',0.00,7.1770,0.0000,'0001-01-01','0001-01-01',0,0,NULL);
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
-- Table structure for table `cliente_contrato_comissao`
--

DROP TABLE IF EXISTS `cliente_contrato_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_contrato_comissao` (
  `cliente_contrato_comissao_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_contrato_id` int(11) NOT NULL DEFAULT '0',
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `recorrencia` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cliente_contrato_comissao_id`),
  UNIQUE KEY `uk_cliente_contrato_comissao_1` (`cliente_contrato_id`,`pessoa_id`,`recorrencia`),
  KEY `k_cliente_contrato_comissao_1` (`cliente_contrato_id`),
  KEY `k_cliente_contrato_comissao_2` (`pessoa_id`),
  CONSTRAINT `fk_cliente_contrato_comissao_1` FOREIGN KEY (`cliente_contrato_id`) REFERENCES `cliente_contrato` (`cliente_contrato_id`),
  CONSTRAINT `fk_cliente_contrato_comissao_2` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_comissao`
--

LOCK TABLES `cliente_contrato_comissao` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_contrato_comissao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_cliente_contrato_comissao before insert on cliente_contrato_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: cliente_contrato_comissao.percentual';
    end if;
    if new.recorrencia not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: cliente_contrato_comissao.recorrencia';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_cliente_contrato_comissao before update on cliente_contrato_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: cliente_contrato_comissao.percentual';
    end if;
    if new.recorrencia not in (1,2,3) then
        signal sqlstate '45000' set message_text = 'invalid value: cliente_contrato_comissao.recorrencia';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_credito`
--

LOCK TABLES `cliente_credito` WRITE;
/*!40000 ALTER TABLE `cliente_credito` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato`
--

LOCK TABLES `colaborador_contrato` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato` DISABLE KEYS */;
INSERT INTO `colaborador_contrato` VALUES (1,17,15,NULL,NULL,'2022-02-10','0001-01-01','',1520.00),(2,17,7,NULL,NULL,'2022-01-01','0001-01-01','',1600.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato_horario`
--

LOCK TABLES `colaborador_contrato_horario` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato_horario` DISABLE KEYS */;
INSERT INTO `colaborador_contrato_horario` VALUES (1,1,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,2,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,3,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,4,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,5,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,6,'00:00:00','00:00:00','00:00:00','00:00:00'),(1,7,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,1,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,2,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,3,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,4,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,5,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,6,'00:00:00','00:00:00','00:00:00','00:00:00'),(2,7,'00:00:00','00:00:00','00:00:00','00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_lancamento_auto`
--

LOCK TABLES `colaborador_lancamento_auto` WRITE;
/*!40000 ALTER TABLE `colaborador_lancamento_auto` DISABLE KEYS */;
INSERT INTO `colaborador_lancamento_auto` VALUES (1,17,1,15,1,1,NULL,NULL,'Salário',100.0000,0.00,1,1),(2,17,15,15,1,1,NULL,NULL,'Salário família',0.0000,20.00,1,1),(3,17,1,7,1,1,NULL,NULL,'Salário',100.0000,0.00,1,1);
/*!40000 ALTER TABLE `colaborador_lancamento_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comissao` (
  `comissao_id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL DEFAULT '0',
  `venda_id` int(11) DEFAULT NULL,
  `receber_id` int(11) DEFAULT NULL,
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `valor_operacao` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_comissao` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`comissao_id`),
  KEY `k_comissao_1` (`empresa_id`),
  KEY `k_comissao_2` (`venda_id`),
  KEY `k_comissao_3` (`receber_id`),
  KEY `k_comissao_4` (`pessoa_id`),
  CONSTRAINT `fk_comissao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_comissao_2` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_comissao_3` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_comissao_4` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao`
--

LOCK TABLES `comissao` WRITE;
/*!40000 ALTER TABLE `comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `comissao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_comissao before insert on comissao for each row
begin
    if new.receber_id is null and new.venda_id is null then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.receber_id e comissao.venda_id';
    end if;
	if substr(new.data_hora,1,4)<'2022' then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.data_hora';
    end if;
	if new.valor_operacao <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.valor_operacao';
    end if;
	if new.valor_comissao <= 0 or new.valor_comissao > new.valor_operacao then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.valor_comissao';
    end if;
    if new.credito_debito not in ('C','D') then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.credito_debito';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_comissao before update on comissao for each row
begin
    if new.receber_id is null and new.venda_id is null then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.receber_id e comissao.venda_id';
    end if;
	if substr(new.data_hora,1,4)<'2022' then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.data_hora';
    end if;
	if new.valor_operacao <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.valor_operacao';
    end if;
	if new.valor_comissao <= 0 or new.valor_comissao > new.valor_operacao then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.valor_comissao';
    end if;
    if new.credito_debito not in ('C','D') then
        signal sqlstate '45000' set message_text = 'invalid value: comissao.credito_debito';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,17,12354,3,5,9,NULL,'2023-02-13',1,0,19760.00,19760.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_item`
--

LOCK TABLES `compra_item` WRITE;
/*!40000 ALTER TABLE `compra_item` DISABLE KEYS */;
INSERT INTO `compra_item` VALUES (1,1,1,NULL,NULL,1,6.0000,1200.0000,7200.00,7200.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(2,1,2,NULL,NULL,2,3.0000,1100.0000,3300.00,3300.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(3,1,3,NULL,NULL,3,4.0000,1500.0000,6000.00,6000.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(4,1,4,NULL,NULL,4,10.0000,12.0000,120.00,120.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(5,1,5,NULL,NULL,5,3.0000,700.0000,2100.00,2100.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL),(6,1,6,NULL,NULL,6,8.0000,130.0000,1040.00,1040.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_pendente`
--

LOCK TABLES `compra_pendente` WRITE;
/*!40000 ALTER TABLE `compra_pendente` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_pendente_item`
--

LOCK TABLES `compra_pendente_item` WRITE;
/*!40000 ALTER TABLE `compra_pendente_item` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso`
--

LOCK TABLES `compromisso` WRITE;
/*!40000 ALTER TABLE `compromisso` DISABLE KEYS */;
INSERT INTO `compromisso` VALUES (1,9,'Retornar para cliente e verificar se já avaliou a proposta.','2023-02-16 16:42:31','2023-02-16 17:42:31',0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso_notificacao`
--

LOCK TABLES `compromisso_notificacao` WRITE;
/*!40000 ALTER TABLE `compromisso_notificacao` DISABLE KEYS */;
INSERT INTO `compromisso_notificacao` VALUES (1,1,1,2,10,2,'jadralutro@gufum.com');
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
INSERT INTO `configuracao` VALUES (17,1,6,0,'','',1045.00,1,104,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,1,0,0,1,1,1,1,'','',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,17,1,0,'Caixa interno',1,-20860.80,0.00,'2023-02-12','','','',NULL,1,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (4,17,'202302',-23140.80,2),(6,17,'202302',2430.00,2),(9,17,'202302',17030.00,2),(21,17,'202301',780.00,2),(21,17,'202302',-90.00,2),(29,17,'202301',-780.00,2),(29,17,'202302',-4370.80,2),(34,17,'202302',539.20,1),(34,17,'202302',2819.20,2),(41,17,'202302',150.00,2),(56,17,'202302',19760.00,1),(56,17,'202302',2730.00,2),(63,17,'202301',780.00,2),(63,17,'202302',780.00,1),(63,17,'202302',690.00,2),(68,17,'202302',3140.00,1),(68,17,'202302',3140.00,2),(78,17,'202301',-780.00,2),(78,17,'202302',-23140.80,1),(78,17,'202302',-4370.80,2);
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
INSERT INTO `conta_saldo` VALUES (1,'2023-02-12',0.00),(1,'2023-02-13',-20860.80);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_compra`
--

LOCK TABLES `devolucao_compra` WRITE;
/*!40000 ALTER TABLE `devolucao_compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_compra_item`
--

LOCK TABLES `devolucao_compra_item` WRITE;
/*!40000 ALTER TABLE `devolucao_compra_item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda`
--

LOCK TABLES `devolucao_venda` WRITE;
/*!40000 ALTER TABLE `devolucao_venda` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda_item`
--

LOCK TABLES `devolucao_venda_item` WRITE;
/*!40000 ALTER TABLE `devolucao_venda_item` DISABLE KEYS */;
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
INSERT INTO `empresa` VALUES (17,'Teste Samuel','','04216956000186','','','2023-02-13','','',0,1,0);
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
INSERT INTO `empresa_contato` VALUES (27,17,2,'(37) 99999-9999',''),(28,17,4,'jadralutro@gufum.com','');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Loja','','','','','','','','','','2023-02-13 16:42:29'),(2,'Depósito','','','','','','','','','','2023-02-13 16:42:29');
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
INSERT INTO `estoque_empresa` VALUES (1,17,0,1,0),(2,17,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento`
--

LOCK TABLES `faturamento` WRITE;
/*!40000 ALTER TABLE `faturamento` DISABLE KEYS */;
INSERT INTO `faturamento` VALUES (1,17,'2023-02-13',150.00,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturamento_contrato`
--

LOCK TABLES `faturamento_contrato` WRITE;
/*!40000 ALTER TABLE `faturamento_contrato` DISABLE KEYS */;
INSERT INTO `faturamento_contrato` VALUES (1,1,1,NULL,'2023-02-01','2023-02-28',75.00),(2,1,2,NULL,'2023-02-01','2023-02-28',75.00);
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
INSERT INTO `faturamento_contrato_receber` VALUES (1,5),(2,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento`
--

LOCK TABLES `folha_pagamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento` DISABLE KEYS */;
INSERT INTO `folha_pagamento` VALUES (1,17,'202301',1,2);
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
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,17,1,0),(2,17,1,0),(3,17,1,0),(4,17,1,0),(5,17,1,0),(6,17,1,0),(7,17,1,0),(8,17,1,0),(9,17,1,0),(10,17,1,0),(11,17,1,0),(12,17,1,0),(13,17,1,0),(14,17,1,0),(15,17,1,0),(16,17,1,0),(17,17,1,0),(18,17,1,0),(19,17,1,0),(20,17,1,0),(21,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_lancamento`
--

LOCK TABLES `folha_pagamento_lancamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_lancamento` DISABLE KEYS */;
INSERT INTO `folha_pagamento_lancamento` VALUES (1,1,15,1,1,1,NULL,191,'Salário','2023-02-13','0001-01-01','0001-01-01',1520.00,'V',NULL,1,0,0),(2,1,15,15,1,1,NULL,192,'Salário família','2023-02-13','0001-01-01','0001-01-01',20.00,'V',NULL,1,0,0),(3,1,7,1,1,1,NULL,191,'Salário','2023-02-13','0001-01-01','0001-01-01',1600.00,'V',NULL,1,0,0),(4,1,15,2,1,1,NULL,179,'Adiantamento de salário','2023-02-13','2023-03-13','0001-01-01',120.00,'D',1,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2023-02-13 16:42:23'),(2,2,'Cheque',1,2,2,1,0,1,'2023-02-13 16:42:23'),(3,3,'Cartão',1,3,3,0,0,0,'2023-02-13 16:42:23'),(4,4,'Crediário',2,4,99,0,0,0,'2023-02-13 16:42:23'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2023-02-13 16:42:23'),(6,6,'PIX',1,6,17,0,0,1,'2023-02-13 16:42:23');
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
INSERT INTO `forma_pagamento_empresa` VALUES (1,17,1,0),(2,17,1,0),(3,17,1,0),(4,17,1,0),(5,17,1,0),(6,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2023-02-13 16:42:22',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Teste Samuel\",\"[identificacao]\":\"Teste Samuel\",\"Nome Fantasia\":\"\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.216.956/0001-86\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(2,NULL,'2023-02-13 16:42:22',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 99999-9999\",\"[identificacao]\":\"(37) 99999-9999\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Teste Samuel\",\"[identificacao]\":\"Teste Samuel\",\"Nome Fantasia\":\"\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.216.956/0001-86\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(3,NULL,'2023-02-13 16:42:22',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"E-mail\",\"Contato\":\"jadralutro@gufum.com\",\"[identificacao]\":\"jadralutro@gufum.com\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Teste Samuel\",\"[identificacao]\":\"Teste Samuel\",\"Nome Fantasia\":\"\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.216.956/0001-86\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(4,NULL,'2023-02-13 16:42:23',1,91,17,'{\"ID\":\"17\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(5,NULL,'2023-02-13 16:42:23',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(6,NULL,'2023-02-13 16:42:23',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(7,NULL,'2023-02-13 16:42:23',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(8,NULL,'2023-02-13 16:42:23',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(9,NULL,'2023-02-13 16:42:23',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(10,NULL,'2023-02-13 16:42:23',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(11,NULL,'2023-02-13 16:42:23',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(12,NULL,'2023-02-13 16:42:23',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(13,NULL,'2023-02-13 16:42:23',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(14,NULL,'2023-02-13 16:42:23',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(15,NULL,'2023-02-13 16:42:23',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(16,NULL,'2023-02-13 16:42:23',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(17,NULL,'2023-02-13 16:42:23',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(18,NULL,'2023-02-13 16:42:23',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(19,NULL,'2023-02-13 16:42:23',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(20,NULL,'2023-02-13 16:42:23',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(21,NULL,'2023-02-13 16:42:23',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(22,NULL,'2023-02-13 16:42:23',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(23,NULL,'2023-02-13 16:42:23',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(24,NULL,'2023-02-13 16:42:23',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(25,NULL,'2023-02-13 16:42:23',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(26,NULL,'2023-02-13 16:42:23',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(27,NULL,'2023-02-13 16:42:23',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(28,NULL,'2023-02-13 16:42:23',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(29,NULL,'2023-02-13 16:42:23',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(30,NULL,'2023-02-13 16:42:23',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(31,NULL,'2023-02-13 16:42:23',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(32,NULL,'2023-02-13 16:42:23',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(33,NULL,'2023-02-13 16:42:23',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(34,NULL,'2023-02-13 16:42:23',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(35,NULL,'2023-02-13 16:42:23',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(36,NULL,'2023-02-13 16:42:23',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(37,NULL,'2023-02-13 16:42:23',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(38,NULL,'2023-02-13 16:42:23',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(39,NULL,'2023-02-13 16:42:23',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(40,NULL,'2023-02-13 16:42:23',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(41,NULL,'2023-02-13 16:42:23',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(42,NULL,'2023-02-13 16:42:23',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(43,NULL,'2023-02-13 16:42:23',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(44,NULL,'2023-02-13 16:42:23',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(45,NULL,'2023-02-13 16:42:23',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(46,NULL,'2023-02-13 16:42:23',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(47,NULL,'2023-02-13 16:42:23',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(48,NULL,'2023-02-13 16:42:23',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(49,NULL,'2023-02-13 16:42:23',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(50,NULL,'2023-02-13 16:42:23',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(51,NULL,'2023-02-13 16:42:23',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(52,NULL,'2023-02-13 16:42:23',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(53,NULL,'2023-02-13 16:42:23',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(54,NULL,'2023-02-13 16:42:23',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(55,NULL,'2023-02-13 16:42:23',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(56,NULL,'2023-02-13 16:42:23',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(57,NULL,'2023-02-13 16:42:23',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(58,NULL,'2023-02-13 16:42:23',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(59,NULL,'2023-02-13 16:42:23',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(60,NULL,'2023-02-13 16:42:23',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(61,NULL,'2023-02-13 16:42:23',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(62,NULL,'2023-02-13 16:42:23',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(63,NULL,'2023-02-13 16:42:23',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(64,NULL,'2023-02-13 16:42:23',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(65,NULL,'2023-02-13 16:42:23',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(66,NULL,'2023-02-13 16:42:23',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(67,NULL,'2023-02-13 16:42:23',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(68,NULL,'2023-02-13 16:42:23',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(69,NULL,'2023-02-13 16:42:23',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(70,NULL,'2023-02-13 16:42:23',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(71,NULL,'2023-02-13 16:42:23',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(72,NULL,'2023-02-13 16:42:23',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(73,NULL,'2023-02-13 16:42:23',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(74,NULL,'2023-02-13 16:42:23',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(75,NULL,'2023-02-13 16:42:23',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(76,NULL,'2023-02-13 16:42:23',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(77,NULL,'2023-02-13 16:42:23',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(78,NULL,'2023-02-13 16:42:23',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(79,NULL,'2023-02-13 16:42:23',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(80,NULL,'2023-02-13 16:42:23',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(81,NULL,'2023-02-13 16:42:23',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(82,NULL,'2023-02-13 16:42:23',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(83,NULL,'2023-02-13 16:42:23',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(84,NULL,'2023-02-13 16:42:23',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(85,NULL,'2023-02-13 16:42:23',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(86,NULL,'2023-02-13 16:42:23',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(87,NULL,'2023-02-13 16:42:23',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(88,NULL,'2023-02-13 16:42:23',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(89,NULL,'2023-02-13 16:42:23',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(90,NULL,'2023-02-13 16:42:23',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(91,NULL,'2023-02-13 16:42:23',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(92,NULL,'2023-02-13 16:42:23',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(93,NULL,'2023-02-13 16:42:23',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(94,NULL,'2023-02-13 16:42:23',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(95,NULL,'2023-02-13 16:42:23',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(96,NULL,'2023-02-13 16:42:23',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(97,NULL,'2023-02-13 16:42:23',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(98,NULL,'2023-02-13 16:42:23',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(99,NULL,'2023-02-13 16:42:23',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(100,NULL,'2023-02-13 16:42:23',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(101,NULL,'2023-02-13 16:42:23',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(102,NULL,'2023-02-13 16:42:23',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(103,NULL,'2023-02-13 16:42:23',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(104,NULL,'2023-02-13 16:42:23',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(105,NULL,'2023-02-13 16:42:23',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(106,NULL,'2023-02-13 16:42:23',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(107,NULL,'2023-02-13 16:42:23',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(108,NULL,'2023-02-13 16:42:23',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(109,NULL,'2023-02-13 16:42:23',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(110,NULL,'2023-02-13 16:42:23',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(111,NULL,'2023-02-13 16:42:23',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(112,NULL,'2023-02-13 16:42:23',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(113,NULL,'2023-02-13 16:42:23',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(114,NULL,'2023-02-13 16:42:23',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(115,NULL,'2023-02-13 16:42:23',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(116,NULL,'2023-02-13 16:42:23',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(117,NULL,'2023-02-13 16:42:23',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(118,NULL,'2023-02-13 16:42:23',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(119,NULL,'2023-02-13 16:42:23',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(120,NULL,'2023-02-13 16:42:23',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(121,NULL,'2023-02-13 16:42:23',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(122,NULL,'2023-02-13 16:42:23',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(123,NULL,'2023-02-13 16:42:23',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(124,NULL,'2023-02-13 16:42:23',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(125,NULL,'2023-02-13 16:42:23',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(126,NULL,'2023-02-13 16:42:23',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(127,NULL,'2023-02-13 16:42:23',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(128,NULL,'2023-02-13 16:42:23',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(129,NULL,'2023-02-13 16:42:23',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(130,NULL,'2023-02-13 16:42:23',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(131,NULL,'2023-02-13 16:42:23',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(132,NULL,'2023-02-13 16:42:23',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(133,NULL,'2023-02-13 16:42:23',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(134,NULL,'2023-02-13 16:42:23',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(135,NULL,'2023-02-13 16:42:23',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(136,NULL,'2023-02-13 16:42:23',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(137,NULL,'2023-02-13 16:42:23',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(138,NULL,'2023-02-13 16:42:23',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(139,NULL,'2023-02-13 16:42:23',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"Recebimento Pagamento\":\"0\",\"EmpresaEspecificaId\":17}',0,0,''),(140,NULL,'2023-02-13 16:42:23',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"12/02/2023\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(141,NULL,'2023-02-13 16:42:23',2,91,17,'{\"ID\":\"17\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"104\",\"Operação padrão\":\"1\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(142,17,'2023-02-13 16:42:23',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UND\",\"[identificacao]\":\"UND\",\"Nome\":\"Unidades\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(143,17,'2023-02-13 16:42:23',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Bikes\",\"[identificacao]\":\"Bikes\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(144,17,'2023-02-13 16:42:24',1,11,2,'{\"ID\":\"2\",\"Nome\":\"Peças\",\"[identificacao]\":\"Peças\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(145,17,'2023-02-13 16:42:24',1,11,3,'{\"ID\":\"3\",\"Nome\":\"Serviços\",\"[identificacao]\":\"Serviços\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(146,17,'2023-02-13 16:42:24',1,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(147,17,'2023-02-13 16:42:24',1,2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(148,17,'2023-02-13 16:42:24',1,3,1,'{\"ID\":\"1\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(149,17,'2023-02-13 16:42:24',1,3,2,'{\"ID\":\"2\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(150,17,'2023-02-13 16:42:24',1,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(151,17,'2023-02-13 16:42:24',1,3,4,'{\"ID\":\"4\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"BA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(152,17,'2023-02-13 16:42:24',1,3,5,'{\"ID\":\"5\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AL\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(153,17,'2023-02-13 16:42:25',1,3,6,'{\"ID\":\"6\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"CE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(154,17,'2023-02-13 16:42:25',1,3,7,'{\"ID\":\"7\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"DF\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(155,17,'2023-02-13 16:42:25',1,3,8,'{\"ID\":\"8\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"ES\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(156,17,'2023-02-13 16:42:25',1,3,9,'{\"ID\":\"9\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"GO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(157,17,'2023-02-13 16:42:25',1,3,10,'{\"ID\":\"10\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(158,17,'2023-02-13 16:42:25',1,3,11,'{\"ID\":\"11\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(159,17,'2023-02-13 16:42:26',1,3,12,'{\"ID\":\"12\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(160,17,'2023-02-13 16:42:26',1,3,13,'{\"ID\":\"13\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MT\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(161,17,'2023-02-13 16:42:26',1,3,14,'{\"ID\":\"14\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(162,17,'2023-02-13 16:42:26',1,3,15,'{\"ID\":\"15\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PB\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(163,17,'2023-02-13 16:42:26',1,3,16,'{\"ID\":\"16\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(164,17,'2023-02-13 16:42:26',1,3,17,'{\"ID\":\"17\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PI\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(165,17,'2023-02-13 16:42:26',1,3,18,'{\"ID\":\"18\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(166,17,'2023-02-13 16:42:27',1,3,19,'{\"ID\":\"19\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RJ\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(167,17,'2023-02-13 16:42:27',1,3,20,'{\"ID\":\"20\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RN\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(168,17,'2023-02-13 16:42:27',1,3,21,'{\"ID\":\"21\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(169,17,'2023-02-13 16:42:27',1,3,22,'{\"ID\":\"22\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(170,17,'2023-02-13 16:42:27',1,3,23,'{\"ID\":\"23\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(171,17,'2023-02-13 16:42:27',1,3,24,'{\"ID\":\"24\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(172,17,'2023-02-13 16:42:28',1,3,25,'{\"ID\":\"25\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(173,17,'2023-02-13 16:42:28',1,3,26,'{\"ID\":\"26\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(174,17,'2023-02-13 16:42:28',1,3,27,'{\"ID\":\"27\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"TO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(175,17,'2023-02-13 16:42:28',1,3,28,'{\"ID\":\"28\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":2,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"98\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(176,17,'2023-02-13 16:42:28',1,3,29,'{\"ID\":\"29\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":3,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"71\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(177,17,'2023-02-13 16:42:28',1,3,30,'{\"ID\":\"30\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(178,17,'2023-02-13 16:42:29',1,3,31,'{\"ID\":\"31\",\"Nome\":\"Isentos\",\"[identificacao]\":\"Isentos\",\"Operação\":1,\"UF\":\"\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Isenta de ISS\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"Isenção\",\"Natureza da Operação do serviço\":\"Sem Dedução\",\"Alíquota ISS\":\"1,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":60,\"Observação\":\"\",\"ListaEmpresasId\":[17]}',2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\"}'),(179,17,'2023-02-13 16:42:29',1,12,1,'{\"ID\":\"1\",\"Nome\":\"Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco\",\"[identificacao]\":\"Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco\",\"Descrição\":\"Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"87120010\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(180,17,'2023-02-13 16:42:29',1,12,2,'{\"ID\":\"2\",\"Nome\":\"Bicicleta Sense One 2020 Shimano Aro 29\",\"[identificacao]\":\"Bicicleta Sense One 2020 Shimano Aro 29\",\"Descrição\":\"Bicicleta Sense One 2020 Shimano Aro 29\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"87120010\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":2,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(181,17,'2023-02-13 16:42:29',1,12,3,'{\"ID\":\"3\",\"Nome\":\"Bicicleta Urbana Sense Move 2019\",\"[identificacao]\":\"Bicicleta Urbana Sense Move 2019\",\"Descrição\":\"Bicicleta Urbana Sense Move 2019\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"87120010\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(182,17,'2023-02-13 16:42:29',1,12,4,'{\"ID\":\"4\",\"Nome\":\"Cadeado para Bicicleta Tramontina com Segredo\",\"[identificacao]\":\"Cadeado para Bicicleta Tramontina com Segredo\",\"Descrição\":\"Cadeado para Bicicleta Tramontina com Segredo\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"83011000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":2,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(183,17,'2023-02-13 16:42:29',1,12,5,'{\"ID\":\"5\",\"Nome\":\"Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire\",\"[identificacao]\":\"Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire\",\"Descrição\":\"Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"87120010\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":2,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(184,17,'2023-02-13 16:42:29',1,12,6,'{\"ID\":\"6\",\"Nome\":\"Pedal Shimano M505\",\"[identificacao]\":\"Pedal Shimano M505\",\"Descrição\":\"Pedal Shimano M505\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"87120010\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":2,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(185,17,'2023-02-13 16:42:29',1,29,7,'{\"ID\":\"7\",\"Nome\":\"Substituição pedal\",\"[identificacao]\":\"Substituição pedal\",\"Descrição\":\"Substituição pedal\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"14.01\",\"Valor\":\"50,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(186,17,'2023-02-13 16:42:29',1,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção preventiva de bikes\",\"[identificacao]\":\"Manutenção preventiva de bikes\",\"Descrição\":\"Manutenção preventiva de bikes\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"14.01\",\"Valor\":\"75,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(187,17,'2023-02-13 16:42:29',1,27,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2001\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(188,17,'2023-02-13 16:42:29',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(37) 3261-9879\",\"[identificacao]\":\"(37) 3261-9879\",\"Observação\":\"\"}',27,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2001\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(189,17,'2023-02-13 16:42:29',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Rua Guanabara\",\"[identificacao]\":\"Rua Guanabara\",\"Número\":\"26\",\"Bairro\":\"Santa Efigênia\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2001\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(190,17,'2023-02-13 16:42:29',1,27,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(191,17,'2023-02-13 16:42:29',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',27,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(192,17,'2023-02-13 16:42:29',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"1200\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(193,17,'2023-02-13 16:42:29',1,27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(194,17,'2023-02-13 16:42:29',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(195,17,'2023-02-13 16:42:29',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Luciano\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(196,17,'2023-02-13 16:42:29',1,9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(197,17,'2023-02-13 16:42:29',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(31) 3226-8564\",\"[identificacao]\":\"(31) 3226-8564\",\"Observação\":\"\"}',9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(198,17,'2023-02-13 16:42:29',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. Bias Fortes\",\"[identificacao]\":\"Av. Bias Fortes\",\"Número\":\"783\",\"Bairro\":\"Lourdes\",\"Complemento\":\"\",\"Cidade\":\"Belo Horizonte\",\"Código do município\":\"3106200\",\"CEP\":\"31.548-778\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(199,17,'2023-02-13 16:42:29',1,9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(200,17,'2023-02-13 16:42:29',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-1000\",\"[identificacao]\":\"(37) 3261-1000\",\"Observação\":\"\"}',9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(201,17,'2023-02-13 16:42:29',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Av. Benedito Valadares\",\"[identificacao]\":\"Av. Benedito Valadares\",\"Número\":\"1564\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(202,17,'2023-02-13 16:42:29',1,32,6,'{\"Comissão\":\"0,00\",\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2004\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(203,17,'2023-02-13 16:42:29',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 99885-5456\",\"[identificacao]\":\"(37) 99885-5456\",\"Observação\":\"\"}',32,6,'{\"Comissão\":\"0,00\",\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2004\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(204,17,'2023-02-13 16:42:29',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Rua Maria Rita\",\"[identificacao]\":\"Rua Maria Rita\",\"Número\":\"82\",\"Bairro\":\"Santa Helena\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,6,'{\"Comissão\":\"0,00\",\"ID\":\"6\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"13/02/2004\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(205,17,'2023-02-13 16:42:29',1,51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(206,17,'2023-02-13 16:42:29',1,63,9,'{\"ID\":\"9\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 99885-5456\",\"[identificacao]\":\"(37) 99885-5456\",\"Observação\":\"\"}',51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(207,17,'2023-02-13 16:42:29',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Rua Maria Rita\",\"[identificacao]\":\"Rua Maria Rita\",\"Número\":\"82\",\"Bairro\":\"Santa Helena\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(208,17,'2023-02-13 16:42:29',1,66,1,'{\"ID\":\"1\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"0\",\"Valor\":\"0,00\",\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":17}',51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(209,17,'2023-02-13 16:42:29',1,66,2,'{\"ID\":\"2\",\"Descrição\":\"Salário família\",\"[identificacao]\":\"Salário família\",\"Evento\":15,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"0\",\"Valor\":\"20,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":17}',51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(210,17,'2023-02-13 16:42:29',1,67,1,'{\"ID\":\"1\",\"Centro de resultado\":\"0\",\"Cargo\":0,\"Data de admissão\":\"10/02/2022\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"1520,00\",\"Horas semanais\":\"0:0\",\"EmpresaEspecificaId\":17}',51,15,'{\"Nome\":\"Fátima Stefany da Conceição\",\"[identificacao]\":\"Fátima Stefany da Conceição\",\"ID\":\"15\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"21/03/1987\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(211,17,'2023-02-13 16:42:29',1,51,7,'{\"Nome\":\"Guilherme Ferreira Silva\",\"[identificacao]\":\"Guilherme Ferreira Silva\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/05/1989\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(212,17,'2023-02-13 16:42:29',1,63,10,'{\"ID\":\"10\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 98825-6344\",\"[identificacao]\":\"(37) 98825-6344\",\"Observação\":\"\"}',51,7,'{\"Nome\":\"Guilherme Ferreira Silva\",\"[identificacao]\":\"Guilherme Ferreira Silva\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/05/1989\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(213,17,'2023-02-13 16:42:29',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Rua Sete de Setembro\",\"[identificacao]\":\"Rua Sete de Setembro\",\"Número\":\"1501\",\"Bairro\":\"Américo Silva\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,7,'{\"Nome\":\"Guilherme Ferreira Silva\",\"[identificacao]\":\"Guilherme Ferreira Silva\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/05/1989\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(214,17,'2023-02-13 16:42:29',1,66,3,'{\"ID\":\"3\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"0\",\"Valor\":\"0,00\",\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":17}',51,7,'{\"Nome\":\"Guilherme Ferreira Silva\",\"[identificacao]\":\"Guilherme Ferreira Silva\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/05/1989\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(215,17,'2023-02-13 16:42:29',1,67,2,'{\"ID\":\"2\",\"Centro de resultado\":\"0\",\"Cargo\":0,\"Data de admissão\":\"01/01/2022\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"1600,00\",\"Horas semanais\":\"0:0\",\"EmpresaEspecificaId\":17}',51,7,'{\"Nome\":\"Guilherme Ferreira Silva\",\"[identificacao]\":\"Guilherme Ferreira Silva\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"19/05/1989\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(216,17,'2023-02-13 16:42:29',2,78,4,'{\"ID\":\"4\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1998\",\"EmpresaEspecificaId\":17}',0,0,''),(217,17,'2023-02-13 16:42:29',3,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',78,4,'{\"ID\":\"4\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1998\",\"EmpresaEspecificaId\":17}'),(218,17,'2023-02-13 16:42:29',2,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',78,4,'{\"ID\":\"4\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1998\",\"EmpresaEspecificaId\":17}'),(219,17,'2023-02-13 16:42:29',3,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Luciano\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',78,4,'{\"ID\":\"4\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1998\",\"EmpresaEspecificaId\":17}'),(220,17,'2023-02-13 16:42:29',2,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Luciano\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',78,4,'{\"ID\":\"4\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1998\",\"EmpresaEspecificaId\":17}'),(221,17,'2023-02-13 16:42:29',1,78,9,'{\"ID\":\"9\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1994\",\"EmpresaEspecificaId\":17}',0,0,''),(222,17,'2023-02-13 16:42:29',1,63,11,'{\"ID\":\"11\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 3222-5042\'\",\"[identificacao]\":\"(37) 3222-5042\'\",\"Observação\":\"\"}',78,9,'{\"ID\":\"9\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1994\",\"EmpresaEspecificaId\":17}'),(223,17,'2023-02-13 16:42:29',1,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Av. Antônio de Loyola\",\"[identificacao]\":\"Av. Antônio de Loyola\",\"Número\":\"47\",\"Bairro\":\"Cidade Jardim\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',78,9,'{\"ID\":\"9\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Data de nascimento\":\"13/02/1994\",\"EmpresaEspecificaId\":17}'),(224,17,'2023-02-13 16:42:29',2,77,4,'{\"ID\":\"4\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Maria Clara Souza Xavier\",\"[identificacao]\":\"Maria Clara Souza Xavier\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"435.746.460-97\",\"Identidade\":\"MG 4578777\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}',0,0,''),(225,17,'2023-02-13 16:42:29',2,77,9,'{\"ID\":\"9\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}',0,0,''),(226,17,'2023-02-13 16:42:29',3,63,11,'{\"ID\":\"11\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 3222-5042\'\",\"[identificacao]\":\"(37) 3222-5042\'\",\"Observação\":\"\"}',77,9,'{\"ID\":\"9\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}'),(227,17,'2023-02-13 16:42:29',1,63,12,'{\"ID\":\"12\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"(37) 3222-5042\'\",\"[identificacao]\":\"(37) 3222-5042\'\",\"Observação\":\"\"}',77,9,'{\"ID\":\"9\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}'),(228,17,'2023-02-13 16:42:29',3,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Av. Antônio de Loyola\",\"[identificacao]\":\"Av. Antônio de Loyola\",\"Número\":\"47\",\"Bairro\":\"Cidade Jardim\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',77,9,'{\"ID\":\"9\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}'),(229,17,'2023-02-13 16:42:29',1,44,10,'{\"ID\":\"10\",\"Logradouro\":\"Av. Antônio de Loyola\",\"[identificacao]\":\"Av. Antônio de Loyola\",\"Número\":\"47\",\"Bairro\":\"Cidade Jardim\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',77,9,'{\"ID\":\"9\",\"Validade da reserva\":\"13/03/2023 16:42:29\",\"Nome\":\"Carlos Antônio Ribeiro\",\"[identificacao]\":\"Carlos Antônio Ribeiro\",\"Tipo pessoa\":\"Pessoa Física\",\"CPF\":\"504.281.420-52\",\"Identidade\":\"MG485787\",\"CNPJ\":\"\",\"Inscrição estadual\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"Observação\":\"\",\"Vendedor\":6,\"EmpresaEspecificaId\":17}'),(230,17,'2023-02-13 16:42:29',1,84,1,'{\"ID\":\"1\",\"Nome\":\"Proposta aprovada\",\"[identificacao]\":\"Proposta aprovada\",\"Descrição\":\"\",\"Tipo\":\"Conquistadas\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(231,17,'2023-02-13 16:42:29',1,84,2,'{\"ID\":\"2\",\"Nome\":\"Valor de proposta recusado\",\"[identificacao]\":\"Valor de proposta recusado\",\"Descrição\":\"\",\"Tipo\":\"Perdidas\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(232,17,'2023-02-13 16:42:29',1,83,1,'{\"ID\":\"1\",\"Nome\":\"Proposta aprovada\",\"[identificacao]\":\"Proposta aprovada\",\"Descrição\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(233,17,'2023-02-13 16:42:29',1,83,2,'{\"ID\":\"2\",\"Nome\":\"Valor de proposta recusado\",\"[identificacao]\":\"Valor de proposta recusado\",\"Descrição\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(234,17,'2023-02-13 16:42:29',1,82,1,'{\"ID\":\"1\",\"Nome\":\"Manutenção preventiva\",\"[identificacao]\":\"Manutenção preventiva\",\"Descrição\":\"Manutenção preventiva em bicicletas.\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[17]}',0,0,''),(235,17,'2023-02-13 16:42:29',1,85,1,'{\"ID\":\"1\",\"Nome\":\"Novo cliente\",\"[identificacao]\":\"Novo cliente\",\"Descrição\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(236,17,'2023-02-13 16:42:29',1,85,2,'{\"ID\":\"2\",\"Nome\":\"Upgrade de contrato\",\"[identificacao]\":\"Upgrade de contrato\",\"Descrição\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(237,17,'2023-02-13 16:42:30',1,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":8,\"SLA\":0,\"Conta\":1,\"Categoria\":104,\"Data início\":\"13/02/2023 16:42:29\",\"Data término\":\"\",\"Dia do vencimento\":\"15\",\"Valor\":\"0,00\",\"Percentual\":\"7,177\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"Salário mínimo\",\"Documento fiscal\":\"Recibo\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(238,17,'2023-02-13 16:42:30',1,28,2,'{\"ID\":\"2\",\"Cliente\":4,\"Parceiro\":0,\"Serviço\":8,\"SLA\":0,\"Conta\":1,\"Categoria\":104,\"Data início\":\"13/02/2023 16:42:29\",\"Data término\":\"\",\"Dia do vencimento\":\"5\",\"Valor\":\"0,00\",\"Percentual\":\"7,177\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"Salário mínimo\",\"Documento fiscal\":\"Recibo\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(239,17,'2023-02-13 16:42:30',1,16,1,'{\"ID\":\"1\",\"Fornecedor\":8,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emprestimo\":0,\"Emissão\":\"01/01/2023\",\"Vencimento\":\"28/02/2023 16:42:29\",\"Pagamento\":\"\",\"Valor\":\"780,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"780,00\",\"Valor em aberto\":\"780,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',0,0,''),(240,17,'2023-02-13 16:42:30',1,8,126,'{\"ID\":126}',16,1,'{\"ID\":\"1\",\"Fornecedor\":8,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emprestimo\":0,\"Emissão\":\"01/01/2023\",\"Vencimento\":\"28/02/2023 16:42:29\",\"Pagamento\":\"\",\"Valor\":\"780,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"780,00\",\"Valor em aberto\":\"780,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}'),(241,17,'2023-02-13 16:42:30',1,16,2,'{\"ID\":\"2\",\"Fornecedor\":8,\"Conta\":1,\"Documento\":\"0000000002\",\"[identificacao]\":\"0000000002\",\"Emprestimo\":0,\"Emissão\":\"13/02/2023 16:42:29\",\"Vencimento\":\"18/02/2023 16:42:29\",\"Pagamento\":\"\",\"Valor\":\"690,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"690,00\",\"Valor em aberto\":\"690,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}',0,0,''),(242,17,'2023-02-13 16:42:30',1,8,127,'{\"ID\":127}',16,2,'{\"ID\":\"2\",\"Fornecedor\":8,\"Conta\":1,\"Documento\":\"0000000002\",\"[identificacao]\":\"0000000002\",\"Emprestimo\":0,\"Emissão\":\"13/02/2023 16:42:29\",\"Vencimento\":\"18/02/2023 16:42:29\",\"Pagamento\":\"\",\"Valor\":\"690,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"690,00\",\"Valor em aberto\":\"690,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":17}'),(243,17,'2023-02-13 16:42:30',1,35,1,'{\"ID\":\"1\",\"Conta\":1,\"Data pagamento\":\"13/02/2023 16:42:30\",\"Valor\":\"780,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"780,00\",\"[identificacao]\":\"780,00\",\"EmpresaEspecificaId\":17}',0,0,''),(244,17,'2023-02-13 16:42:30',1,58,1,'{\"ID\":\"1\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Valor\":\"1520,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"13/02/2023 16:42:30\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":15,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Janeiro/2023\",\"[identificacao]\":\"Janeiro/2023\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":17}'),(245,17,'2023-02-13 16:42:30',1,58,2,'{\"ID\":\"2\",\"Descrição\":\"Salário família\",\"[identificacao]\":\"Salário família\",\"Valor\":\"20,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"13/02/2023 16:42:30\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":15,\"Vencimento referente\":\"0\",\"Colaborador\":15,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":192,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Janeiro/2023\",\"[identificacao]\":\"Janeiro/2023\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":17}'),(246,17,'2023-02-13 16:42:30',1,58,3,'{\"ID\":\"3\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Valor\":\"1600,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"13/02/2023 16:42:30\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":7,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Janeiro/2023\",\"[identificacao]\":\"Janeiro/2023\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":17}'),(247,17,'2023-02-13 16:42:30',1,57,1,'{\"ID\":\"1\",\"Competência\":\"Janeiro/2023\",\"[identificacao]\":\"Janeiro/2023\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":17}',0,0,''),(248,17,'2023-02-13 16:42:30',1,58,4,'{\"ID\":\"4\",\"Descrição\":\"Adiantamento de salário\",\"[identificacao]\":\"Adiantamento de salário\",\"Valor\":\"120,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"13/02/2023 16:42:30\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"13/03/2023 16:42:30\",\"Evento\":2,\"Vencimento referente\":\"1\",\"Colaborador\":15,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Janeiro/2023\",\"[identificacao]\":\"Janeiro/2023\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":17}'),(249,17,'2023-02-13 16:42:31',1,61,1,'{\"ID\":\"1\",\"Data\":\"13/02/2023 16:42:30\",\"Valor\":\"150,00\",\"[identificacao]\":\"150,00\",\"Status\":\"Processado\",\"EmpresaEspecificaId\":17}',0,0,''),(250,17,'2023-02-13 16:42:31',1,79,1,'{\"ID\":\"1\",\"Descrição\":\"Manutenção preventiva para bicicleta. O cliente pratica trilhas em terrenos acidentados.\",\"[identificacao]\":\"Manutenção preventiva para bicicleta. O cliente pratica trilhas em terrenos acidentados.\",\"Chance de vitória\":\"Alta\",\"Proximidade de conclusão\":\"Media\",\"Temperatura %\":\"80\",\"Data de previsão\":\"13/03/2023 16:42:30\",\"Data de conclusão\":\"\",\"Pessoa\":9,\"Conta\":9,\"Solução\":1,\"Origem\":1,\"Vendedor\":6,\"Fase\":\"Apresentacao\",\"Status\":\"Aberta\",\"Motivo da conclusão\":0,\"Ticket\":{\"Produtos\":\"420,00\",\"Serviços\":\"50,00\",\"Recorrência\":\"75,00\",\"Meses\":\"12\",\"Total\":\"1370,00\"},\"Tipo\":1,\"Observação\":\"\",\"EmpresaEspecificaId\":17}',0,0,''),(251,17,'2023-02-13 16:42:31',1,80,1,'{\"ID\":\"1\",\"Descrição\":\"Retornar para cliente e verificar se já avaliou a proposta.\",\"[identificacao]\":\"Retornar para cliente e verificar se já avaliou a proposta.\",\"Data/hora início\":\"\",\"Data/hora término\":\"\",\"Data/hora previsão término\":\"16/02/2023 16:42:30\",\"Origem\":\"CRM\",\"Status\":\"Fazer\",\"Usuário atribuído\":9,\"Empresa\":17}',79,1,'{\"ID\":\"1\",\"Descrição\":\"Manutenção preventiva para bicicleta. O cliente pratica trilhas em terrenos acidentados.\",\"[identificacao]\":\"Manutenção preventiva para bicicleta. O cliente pratica trilhas em terrenos acidentados.\",\"Chance de vitória\":\"Alta\",\"Proximidade de conclusão\":\"Media\",\"Temperatura %\":\"80\",\"Data de previsão\":\"13/03/2023 16:42:30\",\"Data de conclusão\":\"\",\"Pessoa\":9,\"Conta\":9,\"Solução\":1,\"Origem\":1,\"Vendedor\":6,\"Fase\":\"Apresentacao\",\"Status\":\"Aberta\",\"Motivo da conclusão\":0,\"Ticket\":{\"Produtos\":\"420,00\",\"Serviços\":\"50,00\",\"Recorrência\":\"75,00\",\"Meses\":\"12\",\"Total\":\"1370,00\"},\"Tipo\":1,\"Observação\":\"\",\"EmpresaEspecificaId\":17}'),(252,17,'2023-02-13 16:42:31',1,80,1,'{\"ID\":\"1\",\"Descrição\":\"Retornar para cliente e verificar se já avaliou a proposta.\",\"[identificacao]\":\"Retornar para cliente e verificar se já avaliou a proposta.\",\"Data/hora início\":\"\",\"Data/hora término\":\"\",\"Data/hora previsão término\":\"16/02/2023 16:42:30\",\"Origem\":\"CRM\",\"Status\":\"Fazer\",\"Usuário atribuído\":9,\"Empresa\":17,\"EmpresaEspecificaId\":17}',0,0,''),(253,17,'2023-02-13 16:42:31',1,79,2,'{\"ID\":\"2\",\"Descrição\":\"Manutenção preventiva.\",\"[identificacao]\":\"Manutenção preventiva.\",\"Chance de vitória\":\"Baixa\",\"Proximidade de conclusão\":\"Baixa\",\"Temperatura %\":\"10\",\"Data de previsão\":\"13/03/2023 16:42:30\",\"Data de conclusão\":\"13/02/2023 16:42:30\",\"Pessoa\":4,\"Conta\":4,\"Solução\":1,\"Origem\":2,\"Vendedor\":6,\"Fase\":\"Conclusao\",\"Status\":\"Perdida\",\"Motivo da conclusão\":2,\"Ticket\":{\"Produtos\":\"0,00\",\"Serviços\":\"0,00\",\"Recorrência\":\"75,00\",\"Meses\":\"24\",\"Total\":\"1800,00\"},\"Tipo\":1,\"Observação\":\"\",\"EmpresaEspecificaId\":17}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(8,17),(9,17),(10,17),(11,17),(12,17),(13,17),(14,17),(15,17),(16,17),(17,17),(18,17),(19,17),(20,17),(21,17),(22,17),(23,17),(24,17),(25,17),(26,17),(27,17),(28,17),(29,17),(30,17),(31,17),(32,17),(33,17),(34,17),(35,17),(36,17),(37,17),(38,17),(39,17),(40,17),(41,17),(42,17),(43,17),(44,17),(45,17),(46,17),(47,17),(48,17),(49,17),(50,17),(51,17),(52,17),(53,17),(54,17),(55,17),(56,17),(57,17),(58,17),(59,17),(60,17),(61,17),(62,17),(63,17),(64,17),(65,17),(66,17),(67,17),(68,17),(69,17),(70,17),(71,17),(72,17),(73,17),(74,17),(75,17),(76,17),(77,17),(78,17),(79,17),(80,17),(81,17),(82,17),(83,17),(84,17),(85,17),(86,17),(87,17),(88,17),(89,17),(90,17),(91,17),(92,17),(93,17),(94,17),(95,17),(96,17),(97,17),(98,17),(99,17),(100,17),(101,17),(102,17),(103,17),(104,17),(105,17),(106,17),(107,17),(108,17),(109,17),(110,17),(111,17),(112,17),(113,17),(114,17),(115,17),(116,17),(117,17),(118,17),(119,17),(120,17),(121,17),(122,17),(123,17),(124,17),(125,17),(126,17),(127,17),(128,17),(129,17),(130,17),(131,17),(132,17),(133,17),(134,17),(135,17),(136,17),(137,17),(138,17),(139,17),(140,17),(141,17),(142,17),(143,17),(144,17),(145,17),(146,17),(147,17),(148,17),(149,17),(150,17),(151,17),(152,17),(153,17),(154,17),(155,17),(156,17),(157,17),(158,17),(159,17),(160,17),(161,17),(162,17),(163,17),(164,17),(165,17),(166,17),(167,17),(168,17),(169,17),(170,17),(171,17),(172,17),(173,17),(174,17),(175,17),(176,17),(177,17),(178,17),(179,17),(180,17),(181,17),(182,17),(183,17),(184,17),(185,17),(186,17),(187,17),(188,17),(189,17),(190,17),(191,17),(192,17),(193,17),(194,17),(195,17),(196,17),(197,17),(198,17),(199,17),(200,17),(201,17),(202,17),(203,17),(204,17),(205,17),(206,17),(207,17),(208,17),(209,17),(210,17),(211,17),(212,17),(213,17),(214,17),(215,17),(216,17),(217,17),(218,17),(219,17),(220,17),(221,17),(222,17),(223,17),(224,17),(225,17),(226,17),(227,17),(228,17),(229,17),(230,17),(231,17),(232,17),(233,17),(234,17),(235,17),(236,17),(237,17),(238,17),(239,17),(240,17),(241,17),(242,17),(243,17),(244,17),(245,17),(246,17),(247,17),(248,17),(249,17),(250,17),(251,17),(252,17),(253,17);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,17,1,NULL,'Conclusão da compra 12354 do fornecedor Blue Cycle & Fishing Distribuidora S/A','2023-02-13 16:42:30','2023-02-13 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19760.00,'D',0,0),(2,17,1,NULL,'Conclusão da venda 1  para o cliente Maria Clara Souza Xavier','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1920.00,'C',0,0),(3,17,1,NULL,'Conclusão da venda 2  para o cliente Maria Clara Souza Xavier','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,539.20,'C',0,0),(4,17,1,NULL,'Conclusão da venda 4  para o cliente Antônio Carlos Ribeiro','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,360.00,'C',0,0),(5,17,1,NULL,'Documento à pagar: 0000000001','2023-02-13 16:42:30','2023-01-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,780.00,'D',0,0),(6,17,1,NULL,'Documento à pagar: 0000000002','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,690.00,'D',0,0),(7,17,1,NULL,'Pagamento: 0000000001 - Companhia Energética de Minas Gerais','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,780.00,'D',0,0),(8,17,1,NULL,'Salário (Fátima Stefany da Conceição, Folha de pagamento: Janeiro/2023)','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,1520.00,'D',0,0),(9,17,1,NULL,'Salário família (Fátima Stefany da Conceição, Folha de pagamento: Janeiro/2023)','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,20.00,'D',0,0),(10,17,1,NULL,'Salário (Guilherme Ferreira Silva, Folha de pagamento: Janeiro/2023)','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,'D',0,0),(11,17,1,NULL,'Documento à receber: 0000000005','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,75.00,'C',0,0),(12,17,1,NULL,'Documento à receber: 0000000006','2023-02-13 16:42:30','2023-02-13 16:42:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,75.00,'C',0,0);
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
INSERT INTO `movimento_categoria` VALUES (1,119,NULL,'',19760.00),(2,94,NULL,'',1920.00),(3,93,NULL,'',539.20),(4,94,NULL,'',360.00),(5,126,NULL,'',780.00),(6,127,NULL,'',690.00),(7,126,NULL,'',780.00),(8,191,NULL,'',1520.00),(9,192,NULL,'',20.00),(10,191,NULL,'',1600.00),(11,104,NULL,'',75.00),(12,104,NULL,'',75.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,119,4,19760.00,2,2),(1,119,9,19760.00,1,2),(1,119,56,19760.00,1,1),(1,119,78,19760.00,2,1),(2,94,6,1920.00,1,2),(2,94,9,1200.00,2,2),(2,94,29,720.00,1,2),(2,94,34,1920.00,1,2),(2,94,56,1200.00,1,2),(2,94,78,720.00,1,2),(3,93,4,539.20,1,2),(3,93,9,830.00,2,2),(3,93,29,-290.80,1,2),(3,93,34,539.20,1,1),(3,93,34,539.20,1,2),(3,93,56,830.00,1,2),(3,93,78,539.20,1,1),(3,93,78,-290.80,1,2),(4,94,6,360.00,1,2),(4,94,9,700.00,2,2),(4,94,29,-340.00,1,2),(4,94,34,360.00,1,2),(4,94,56,700.00,1,2),(4,94,78,-340.00,1,2),(5,126,21,780.00,1,2),(5,126,29,780.00,2,2),(5,126,63,780.00,1,2),(5,126,78,780.00,2,2),(6,127,21,690.00,1,2),(6,127,29,690.00,2,2),(6,127,63,690.00,1,2),(6,127,78,690.00,2,2),(7,126,4,780.00,2,2),(7,126,21,780.00,2,2),(7,126,63,780.00,1,1),(7,126,78,780.00,2,1),(8,191,4,1520.00,2,2),(8,191,29,1520.00,2,2),(8,191,68,1520.00,1,1),(8,191,68,1520.00,1,2),(8,191,78,1520.00,2,1),(8,191,78,1520.00,2,2),(9,192,4,20.00,2,2),(9,192,29,20.00,2,2),(9,192,68,20.00,1,1),(9,192,68,20.00,1,2),(9,192,78,20.00,2,1),(9,192,78,20.00,2,2),(10,191,4,1600.00,2,2),(10,191,29,1600.00,2,2),(10,191,68,1600.00,1,1),(10,191,68,1600.00,1,2),(10,191,78,1600.00,2,1),(10,191,78,1600.00,2,2),(11,104,6,75.00,1,2),(11,104,29,75.00,1,2),(11,104,41,75.00,1,2),(11,104,78,75.00,1,2),(12,104,6,75.00,1,2),(12,104,29,75.00,1,2),(12,104,41,75.00,1,2),(12,104,78,75.00,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,2,NULL,NULL,NULL,19760.00,'D',1),(2,2,4,NULL,NULL,NULL,1920.00,'C',1),(3,3,1,NULL,NULL,NULL,239.20,'C',1),(4,3,3,NULL,NULL,NULL,300.00,'C',1),(5,4,4,NULL,NULL,NULL,360.00,'C',1),(6,7,1,NULL,NULL,NULL,780.00,'D',1),(7,8,1,NULL,NULL,NULL,1520.00,'D',1),(8,9,1,NULL,NULL,NULL,20.00,'D',1),(9,10,1,NULL,NULL,NULL,1600.00,'D',1);
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
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,1,1,1),(4,1,1,1),(5,0,1,0),(6,0,1,0),(7,0,1,0),(8,0,1,0),(9,0,1,0),(10,0,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf`
--

LOCK TABLES `nf` WRITE;
/*!40000 ALTER TABLE `nf` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf_item`
--

LOCK TABLES `nf_item` WRITE;
/*!40000 ALTER TABLE `nf_item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfce_contingencia`
--

LOCK TABLES `nfce_contingencia` WRITE;
/*!40000 ALTER TABLE `nfce_contingencia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe`
--

LOCK TABLES `nfe` WRITE;
/*!40000 ALTER TABLE `nfe` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_contingencia`
--

LOCK TABLES `nfe_contingencia` WRITE;
/*!40000 ALTER TABLE `nfe_contingencia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_item`
--

LOCK TABLES `nfe_item` WRITE;
/*!40000 ALTER TABLE `nfe_item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeracao`
--

LOCK TABLES `numeracao` WRITE;
/*!40000 ALTER TABLE `numeracao` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,95,3),(1,96,4),(2,99,5),(2,100,6),(2,101,7),(2,102,8),(3,119,9),(3,120,10),(4,122,11),(4,123,12);
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
INSERT INTO `operacao_empresa` VALUES (1,17,1,1,0),(2,17,1,1,0),(3,17,1,1,0),(4,17,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade`
--

LOCK TABLES `oportunidade` WRITE;
/*!40000 ALTER TABLE `oportunidade` DISABLE KEYS */;
INSERT INTO `oportunidade` VALUES (1,17,9,9,6,1,1,3,1,NULL,1,'Manutenção preventiva para bicicleta. O cliente pratica trilhas em terrenos acidentados.',420.00,50.00,75.00,12,1370.00,'2023-02-13','2023-03-13','0001-01-01',3,2,'',0),(2,17,4,4,6,2,1,6,3,2,1,'Manutenção preventiva.',0.00,0.00,75.00,24,1800.00,'2023-02-13','2023-03-13','2023-02-13',1,1,'',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_motivo`
--

LOCK TABLES `oportunidade_motivo` WRITE;
/*!40000 ALTER TABLE `oportunidade_motivo` DISABLE KEYS */;
INSERT INTO `oportunidade_motivo` VALUES (1,'Proposta aprovada','',1),(2,'Valor de proposta recusado','',2);
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
INSERT INTO `oportunidade_motivo_empresa` VALUES (1,17,1,0),(2,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_origem`
--

LOCK TABLES `oportunidade_origem` WRITE;
/*!40000 ALTER TABLE `oportunidade_origem` DISABLE KEYS */;
INSERT INTO `oportunidade_origem` VALUES (1,'Proposta aprovada',''),(2,'Valor de proposta recusado','');
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
INSERT INTO `oportunidade_origem_empresa` VALUES (1,17,1,0),(2,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_solucao`
--

LOCK TABLES `oportunidade_solucao` WRITE;
/*!40000 ALTER TABLE `oportunidade_solucao` DISABLE KEYS */;
INSERT INTO `oportunidade_solucao` VALUES (1,'Manutenção preventiva','Manutenção preventiva em bicicletas.');
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
INSERT INTO `oportunidade_solucao_empresa` VALUES (1,17,1,0);
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
INSERT INTO `oportunidade_tarefa` VALUES (1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_tipo`
--

LOCK TABLES `oportunidade_tipo` WRITE;
/*!40000 ALTER TABLE `oportunidade_tipo` DISABLE KEYS */;
INSERT INTO `oportunidade_tipo` VALUES (1,'Novo cliente',''),(2,'Upgrade de contrato','');
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
INSERT INTO `oportunidade_tipo_empresa` VALUES (1,17,1,0),(2,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (1,17,2,7,'2023-02-13 16:42:30','2023-02-13 19:42:30','0001-01-01 00:00:00',NULL,0.00,'','','','','','Cabo do freio traseiro quase arrebentando.','As marchas não estão sendo selecionadas corretamente.','',1),(2,17,4,7,'2023-02-14 16:42:30','2023-02-14 16:46:30','0001-01-01 00:00:00',NULL,0.00,'','','','','','Verificar câmbio de marchas.','Pedais estragados.','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_atividade`
--

LOCK TABLES `ordem_servico_atividade` WRITE;
/*!40000 ALTER TABLE `ordem_servico_atividade` DISABLE KEYS */;
INSERT INTO `ordem_servico_atividade` VALUES (1,1,17,'2023-02-13 16:42:30',1,NULL,0,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','Cabo do freio traseiro quase arrebentando.','As marchas não estão sendo selecionadas corretamente.'),(2,2,17,'2023-02-13 16:42:30',1,NULL,0,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','Verificar câmbio de marchas.','Pedais estragados.');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico_comentario`
--

LOCK TABLES `ordem_servico_comentario` WRITE;
/*!40000 ALTER TABLE `ordem_servico_comentario` DISABLE KEYS */;
INSERT INTO `ordem_servico_comentario` VALUES (1,2,17,'2023-02-13 16:42:30','Cliente ligou solicitando posição do reparo.',0);
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
INSERT INTO `pagamento` VALUES (1,1,'2023-02-13',780.00,0.00,0.00,780.00,0);
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
INSERT INTO `pagamento_pagar` VALUES (1,1,1,780.00,0.00,0.00,780.00,0);
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
INSERT INTO `pagamento_pagar_categoria` VALUES (1,126,780.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,17,8,NULL,NULL,1,'0000000001','2023-01-01','2023-02-28','2023-02-13',780.00,0.00,0.00,780.00,'',0,0),(2,NULL,17,8,NULL,NULL,1,'0000000002','2023-02-13','2023-02-18','0001-01-01',690.00,0.00,0.00,0.00,'',0,0);
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
INSERT INTO `pagar_categoria` VALUES (1,126,100.0000),(2,127,100.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Teste Samuel','',NULL,'','04216956000186','','','',0,'','','','','0001-01-01',0,17,'0001-01-01 00:00:00'),(2,'F',0,'Antônio Carlos Ribeiro','','58248281051','MG545878',NULL,'','','',0,'','','','','2001-02-13',0,0,'2023-02-13 16:42:29'),(3,'J',0,'Ciclo Bike Ltda','Ciclo Bike',NULL,'','84724809000156','45487877877','','',1,'','','','','0001-01-01',0,0,'2023-02-13 16:42:29'),(4,'F',0,'Maria Clara Souza Xavier','','43574646097','MG 4578777',NULL,'','','',9,'','','','','1998-02-13',0,0,'2023-02-13 16:42:29'),(5,'J',0,'Blue Cycle & Fishing Distribuidora S/A','Blue Cycle',NULL,'','88160161000193','0014568787892','','',1,'','','','','0001-01-01',0,0,'2023-02-13 16:42:29'),(6,'F',0,'Ana Maria Silva Caetano','','22050592035','MG15487',NULL,'','','',0,'','','','','2004-02-13',0,0,'2023-02-13 16:42:29'),(7,'F',0,'Guilherme Ferreira Silva','','47138507054','MG15457',NULL,'','','',0,'','','','','1989-05-19',0,0,'2023-02-13 16:42:29'),(8,'J',0,'Companhia Energética de Minas Gerais','Cemig',NULL,'','09745935000171','121212112','','',1,'','','','','0001-01-01',0,0,'2023-02-13 16:42:29'),(9,'F',0,'Carlos Antônio Ribeiro','','50428142052','MG485787',NULL,'','','',0,'','','','','1994-02-13',0,0,'2023-02-13 16:42:29'),(15,'F',0,'Fátima Stefany da Conceição','','28455582014','MG 47.370.060-8',NULL,'','','',0,'','','','','1987-03-21',0,0,'2023-02-13 16:42:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,27,2,'(37) 99999-9999',''),(2,1,28,4,'jadralutro@gufum.com',''),(3,2,0,1,'(37) 3261-9879',''),(4,4,0,1,'(37) 3261-9150',''),(6,5,0,2,'(31) 3226-8564',''),(7,8,0,2,'(37) 3261-1000',''),(8,6,0,3,'(37) 99885-5456',''),(9,15,0,3,'(37) 99885-5456',''),(10,7,0,3,'(37) 98825-6344',''),(12,9,0,3,'(37) 3222-5042\'','');
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
INSERT INTO `pessoa_empresa` VALUES (2,17,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,17,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,17,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,17,10,0,0.00,0.00,0,0.00,6,'2023-03-13',1,0),(4,17,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(5,17,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,17,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,17,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(8,17,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,17,10,0,0.00,0.00,0,0.00,6,'2023-03-13',1,0),(9,17,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(15,17,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,2,0,'Rua Guanabara','26','Santa Efigênia','','35590000','Lagoa da Prata','MG','3137205','',1),(2,3,0,'Av. Brasil','1200','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(4,4,0,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35590000','Lagoa da Prata','MG','3137205','',1),(5,8,0,'Av. Benedito Valadares','1564','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(6,6,0,'Rua Maria Rita','82','Santa Helena','','35590000','Lagoa da Prata','MG','3137205','',1),(7,15,0,'Rua Maria Rita','82','Santa Helena','','35590000','Lagoa da Prata','MG','3137205','',1),(8,7,0,'Rua Sete de Setembro','1501','Américo Silva','','35590000','Lagoa da Prata','MG','3137205','',1),(10,9,0,'Av. Antônio de Loyola','47','Cidade Jardim','','35590000','Lagoa da Prata','MG','3137205','',1);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,1,''),(3,NULL,1,''),(4,NULL,1,''),(4,NULL,10,''),(4,NULL,11,''),(5,NULL,2,''),(6,NULL,5,''),(7,NULL,7,''),(8,NULL,2,''),(9,NULL,10,''),(9,NULL,11,''),(15,NULL,7,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento`
--

LOCK TABLES `plano_pagamento` WRITE;
/*!40000 ALTER TABLE `plano_pagamento` DISABLE KEYS */;
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2023-02-13 16:42:23'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2023-02-13 16:42:23'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2023-02-13 16:42:23'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2023-02-13 16:42:23');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,17,1,0),(2,17,1,0),(3,17,1,0),(4,17,1,0);
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
INSERT INTO `plano_pagamento_prazo` VALUES (2,30),(3,30),(3,60),(4,30),(4,60),(4,90);
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
INSERT INTO `produto` VALUES (1,NULL,'Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco','Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco',0,1,'',1,1,0,'87120010','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(2,NULL,'Bicicleta Sense One 2020 Shimano Aro 29','Bicicleta Sense One 2020 Shimano Aro 29',0,1,'',2,1,0,'87120010','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(3,NULL,'Bicicleta Urbana Sense Move 2019','Bicicleta Urbana Sense Move 2019',0,1,'',1,1,0,'87120010','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(4,NULL,'Cadeado para Bicicleta Tramontina com Segredo','Cadeado para Bicicleta Tramontina com Segredo',0,1,'',2,1,0,'83011000','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(5,NULL,'Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire','Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire',0,1,'',2,1,0,'87120010','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(6,NULL,'Pedal Shimano M505','Pedal Shimano M505',0,1,'',2,1,0,'87120010','','','','',0,0,'',0,'',0,'2023-02-13 16:42:29'),(7,NULL,'Substituição pedal','Substituição pedal',9,2,'',3,NULL,0,'','','','','1401',0,0,'',0,'',0,'2023-02-13 16:42:29'),(8,NULL,'Manutenção preventiva de bikes','Manutenção preventiva de bikes',9,2,'',3,NULL,0,'','','','','1401',0,0,'',0,'',0,'2023-02-13 16:42:29');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_codigo_ean`
--

LOCK TABLES `produto_codigo_ean` WRITE;
/*!40000 ALTER TABLE `produto_codigo_ean` DISABLE KEYS */;
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
INSERT INTO `produto_empresa` VALUES (1,17,0,1,0),(2,17,0,1,0),(3,17,0,1,0),(4,17,0,1,0),(5,17,0,1,0),(6,17,0,1,0),(7,17,0,1,0),(8,17,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,1,NULL,NULL,17,1,'',5.0000,6.0000,1.0000),(2,2,NULL,NULL,17,1,'',3.0000,3.0000,0.0000),(3,3,NULL,NULL,17,1,'',4.0000,4.0000,0.0000),(4,4,NULL,NULL,17,1,'',10.0000,10.0000,0.0000),(5,5,NULL,NULL,17,1,'',1.0000,3.0000,2.0000),(6,6,NULL,NULL,17,1,'',7.0000,8.0000,1.0000);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grade`
--

LOCK TABLES `produto_grade` WRITE;
/*!40000 ALTER TABLE `produto_grade` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Bikes','2023-02-13 16:42:29'),(2,'Peças','2023-02-13 16:42:29'),(3,'Serviços','2023-02-13 16:42:24');
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
INSERT INTO `produto_grupo_empresa` VALUES (1,17,1,0),(2,17,1,0),(3,17,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_inventario`
--

LOCK TABLES `produto_inventario` WRITE;
/*!40000 ALTER TABLE `produto_inventario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_lote`
--

LOCK TABLES `produto_lote` WRITE;
/*!40000 ALTER TABLE `produto_lote` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,1,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29','2023-02-13 00:00:00','E',6.0000,''),(2,2,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 00:00:00','E',3.0000,''),(3,3,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 00:00:00','E',4.0000,''),(4,4,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 00:00:00','E',10.0000,''),(5,5,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 00:00:00','E',3.0000,''),(6,6,NULL,NULL,17,1,1,NULL,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 00:00:00','E',8.0000,''),(7,1,NULL,NULL,17,1,NULL,1,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 16:42:30','S',1.0000,''),(8,5,NULL,NULL,17,1,NULL,2,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 16:42:30','S',1.0000,''),(9,6,NULL,NULL,17,1,NULL,2,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 16:42:30','S',1.0000,''),(10,5,NULL,NULL,17,1,NULL,4,NULL,NULL,NULL,'2023-02-13 16:42:30','2023-02-13 16:42:30','S',1.0000,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,17,1200.0000,1200.0000,1200.0000,1920.0000,1920.0000,1920.0000,60.0000),(2,2,0,NULL,17,1100.0000,1100.0000,1100.0000,2240.0000,0.0000,0.0000,60.0000),(3,3,0,NULL,17,1500.0000,1500.0000,1500.0000,1318.5000,0.0000,0.0000,50.0000),(4,4,0,NULL,17,12.0000,12.0000,12.0000,30.0000,0.0000,0.0000,67.5790),(5,5,0,NULL,17,700.0000,700.0000,700.0000,360.0000,360.0000,360.0000,50.0000),(6,6,0,NULL,17,130.0000,130.0000,130.0000,179.2000,179.2000,179.2000,60.0000),(7,7,0,NULL,17,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(8,8,0,NULL,17,0.0000,0.0000,0.0000,75.0000,0.0000,0.0000,0.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_sped`
--

LOCK TABLES `produto_sped` WRITE;
/*!40000 ALTER TABLE `produto_sped` DISABLE KEYS */;
INSERT INTO `produto_sped` VALUES (1,1,'Bicicleta Sense 2019 One aro 29x19 21 Marchas Shimano Freio a Disco','2023-02-13','0001-01-01'),(2,2,'Bicicleta Sense One 2020 Shimano Aro 29','2023-02-13','0001-01-01'),(3,3,'Bicicleta Urbana Sense Move 2019','2023-02-13','0001-01-01'),(4,4,'Cadeado para Bicicleta Tramontina com Segredo','2023-02-13','0001-01-01'),(5,5,'Kit 21 Marchas Shimano Tourney Catraca Corrente Rapid Fire','2023-02-13','0001-01-01'),(6,6,'Pedal Shimano M505','2023-02-13','0001-01-01');
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
INSERT INTO `produto_unidade` VALUES (1,'Unidades','UND',0,'2023-02-13 16:42:29');
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
INSERT INTO `produto_unidade_empresa` VALUES (1,17,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,17,4,NULL,1,1,'0000000001','2023-02-13','2023-03-15','0001-01-01',640.00,0.00,0.00,0.00,0.0000,'',0,0,0),(2,NULL,17,4,NULL,1,1,'0000000002','2023-02-13','2023-04-14','0001-01-01',640.00,0.00,0.00,0.00,0.0000,'',0,0,0),(3,NULL,17,4,NULL,1,1,'0000000003','2023-02-13','2023-05-14','0001-01-01',640.00,0.00,0.00,0.00,0.0000,'',0,0,0),(4,NULL,17,2,NULL,4,1,'0000000004','2023-02-13','2023-03-15','0001-01-01',360.00,0.00,0.00,0.00,0.0000,'',0,0,0),(5,NULL,17,2,NULL,NULL,1,'0000000005','2023-02-13','2023-03-15','0001-01-01',75.00,0.00,0.00,0.00,0.0000,'',0,0,0),(6,NULL,17,4,NULL,NULL,1,'0000000006','2023-02-13','2023-03-05','0001-01-01',75.00,0.00,0.00,0.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,94,100.0000),(2,94,100.0000),(3,94,100.0000),(4,94,100.0000),(5,104,100.0000),(6,104,100.0000);
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
-- Table structure for table `receber_comissao`
--

DROP TABLE IF EXISTS `receber_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receber_comissao` (
  `receber_comissao_id` int(11) NOT NULL AUTO_INCREMENT,
  `receber_id` int(11) NOT NULL DEFAULT '0',
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`receber_comissao_id`),
  UNIQUE KEY `uk_receber_comissao_1` (`receber_id`,`pessoa_id`),
  KEY `k_receber_comissao_1` (`receber_id`),
  KEY `k_receber_comissao_2` (`pessoa_id`),
  CONSTRAINT `fk_receber_comissao_1` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_receber_comissao_2` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber_comissao`
--

LOCK TABLES `receber_comissao` WRITE;
/*!40000 ALTER TABLE `receber_comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `receber_comissao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_receber_comissao before insert on receber_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: receber_comissao.percentual';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_receber_comissao before update on receber_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: receber_comissao.percentual';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
INSERT INTO `regra_tributaria` VALUES (1,'Substituição tributária','P',1,0),(2,'Serviços isentos','S',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(3,1,1,0,'AP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(31,2,1,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',60,'');
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
INSERT INTO `regra_tributaria_operacao_empresa` VALUES (1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(8,17),(9,17),(10,17),(11,17),(12,17),(13,17),(14,17),(15,17),(16,17),(17,17),(18,17),(19,17),(20,17),(21,17),(22,17),(23,17),(24,17),(25,17),(26,17),(27,17),(28,17),(29,17),(30,17),(31,17);
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
INSERT INTO `service_empresa` VALUES (1,17,1143,2,'2023-02-13 16:42:40');
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
INSERT INTO `sommusdash_usuario` VALUES (17,'Teste','202cb962ac59075b964b07152d234b70','','jadralutro@gufum.com');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sped_credito_pis_cofins`
--

LOCK TABLES `sped_credito_pis_cofins` WRITE;
/*!40000 ALTER TABLE `sped_credito_pis_cofins` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (1,17,9,'Retornar para cliente e verificar se já avaliou a proposta.','0001-01-01 00:00:00','0001-01-01 00:00:00','2023-02-16 16:42:31',1,0.0000,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,17,'2023-02-13 16:42:30',1,4,4,2,1920.00,1920.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',17,6,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29'),(2,17,'2023-02-13 16:42:30',1,4,1,1,539.20,539.20,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',17,6,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29'),(3,17,'2023-02-13 16:42:30',1,3,2,2,2690.00,2690.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',17,6,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29'),(4,17,'2023-02-13 16:42:30',1,2,2,2,360.00,360.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',17,6,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29'),(5,17,'2023-02-13 16:42:30',1,4,1,1,229.20,229.20,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',17,6,1,'0001-01-01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-13 16:42:29');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_comissao`
--

DROP TABLE IF EXISTS `venda_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_comissao` (
  `venda_comissao_id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) NOT NULL DEFAULT '0',
  `pessoa_id` int(11) NOT NULL DEFAULT '0',
  `percentual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`venda_comissao_id`),
  UNIQUE KEY `uk_venda_comissao_1` (`venda_id`,`pessoa_id`),
  KEY `k_venda_comissao_1` (`venda_id`),
  KEY `k_venda_comissao_2` (`pessoa_id`),
  CONSTRAINT `fk_venda_comissao_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_venda_comissao_2` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_comissao`
--

LOCK TABLES `venda_comissao` WRITE;
/*!40000 ALTER TABLE `venda_comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_comissao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bi_venda_comissao before insert on venda_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: venda_comissao.percentual';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger bu_venda_comissao before update on venda_comissao for each row
begin
    if new.percentual < 0 or new.percentual > 100 then
        signal sqlstate '45000' set message_text = 'invalid value: venda_comissao.percentual';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
INSERT INTO `venda_item` VALUES (1,1,1,NULL,NULL,'',1,1.0000,1200.0000,1920.0000,1920.00,1920.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(2,2,5,NULL,NULL,'',1,1.0000,700.0000,360.0000,360.00,360.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(3,2,6,NULL,NULL,'',2,1.0000,130.0000,179.2000,179.20,179.20,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(4,3,2,NULL,NULL,'',1,1.0000,1100.0000,2240.0000,2240.00,2240.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,3,4,NULL,NULL,'',2,3.0000,12.0000,30.0000,90.00,90.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,3,5,NULL,NULL,'',3,1.0000,700.0000,360.0000,360.00,360.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,4,5,NULL,NULL,'',1,1.0000,700.0000,360.0000,360.00,360.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,5,7,NULL,NULL,'',1,1.0000,0.0000,50.0000,50.00,50.00,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,5,6,NULL,NULL,'',2,1.0000,130.0000,179.2000,179.20,179.20,0.00,0.00,0.00,0.00,17,6,NULL,0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_meta`
--

LOCK TABLES `vendedor_meta` WRITE;
/*!40000 ALTER TABLE `vendedor_meta` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2023-02-13 16:42:19','34be18e32ca577d8ab60383b9ec66478'),(2,2,'20221114.182125.297','2023-02-13 16:42:19','d8330d59caf5d125d2160d281450a668'),(3,2,'20220927.231853.021-financas','2023-02-13 16:42:19','4cac2cc7d7f75a3faed0038d94b79d05'),(4,2,'20220927.231856.052-financas','2023-02-13 16:42:19','1306e169c081d09cb678e950d240839c'),(5,2,'20220927.231859.082-financas','2023-02-13 16:42:19','a5292e35b6cee09e339c3387cafad826'),(6,2,'20220927.231902.116-financas','2023-02-13 16:42:19','a691fde4f4edd45f857e6fa97c6e1cb5'),(7,2,'20220927.231905.158-financas','2023-02-13 16:42:19','162a60ff0d209c717e79f7520412ef25'),(8,2,'20220927.231908.190-financas','2023-02-13 16:42:19','33dc381f473f8b355efc4ab61edc4904'),(9,2,'20220927.231911.215-financas','2023-02-13 16:42:19','163d1a933e8c641baa4cd71918ff7103'),(10,2,'20220927.231914.237-financas','2023-02-13 16:42:19','b34dff083e361f7a970aeb0206d52de9'),(11,2,'20220927.231917.275-financas','2023-02-13 16:42:19','f2a9c66bf644124ad875fa3152d74594'),(12,2,'20220927.231920.311-financas','2023-02-13 16:42:19','8eb2a802d1f77c2c2a9f1f960ea4236b'),(13,2,'20220927.231923.342-financas','2023-02-13 16:42:19','4e5e8b80a512338bc96fa813349e8f20'),(14,2,'20220927.231926.383-financas','2023-02-13 16:42:19','3f1c9c94b954649e0e550cad38e88d8e'),(15,2,'20220927.231929.422-financas','2023-02-13 16:42:19','8f07782de818c65c44d9572b8add90da'),(16,2,'20220927.231932.449-financas','2023-02-13 16:42:19','6af7c1cdfbd269805dc423b9f5d91d8a'),(17,2,'20220927.231935.475-financas','2023-02-13 16:42:19','2b3901de1dd572366a506a52493f5691'),(18,2,'20220927.231938.503-financas','2023-02-13 16:42:19','5e6916faecb363414ef4f698ce1a8bce'),(19,2,'20220927.231941.539-financas','2023-02-13 16:42:19','cccb729dabace0dcb910a22f23f1db80'),(20,2,'20220927.231944.560-financas','2023-02-13 16:42:19','fd172a99f37b23f2e59bc64ba1516696'),(21,2,'20220927.231947.591-financas','2023-02-13 16:42:19','a00f142b195db411d9ba64a8c8f781f9'),(22,2,'20220927.231950.619-financas','2023-02-13 16:42:19','0ca3b8b4391b59c8acff706ff2607288'),(23,2,'20220927.231953.643-financas','2023-02-13 16:42:19','17673a2f945a381e3b31f44ea7c2a9a4'),(24,2,'20220927.231956.678-financas','2023-02-13 16:42:19','3993f6eff040741ef93826a7942e547b'),(25,2,'20220927.231959.720-financas','2023-02-13 16:42:19','1efc262b181aac9cca782916334e328e'),(26,2,'20220927.232002.752-financas','2023-02-13 16:42:19','c968dd8b123c5d679a9a3f27ce0bab89'),(27,2,'20220927.232005.779-financas','2023-02-13 16:42:19','a8953d979dce61f9f05387ab852de7f9'),(28,2,'20220927.232008.813-financas','2023-02-13 16:42:19','905ea0a346ce960a96bc0e6b6ae42e9f'),(29,2,'20220927.232011.839-financas','2023-02-13 16:42:19','978cf0c14f658f9a6ec150c468187c58'),(30,2,'20220927.232014.867-financas','2023-02-13 16:42:20','de0adbc07c1e0319204f975c2423c297'),(31,2,'20220927.232017.894-financas','2023-02-13 16:42:20','ebde5b6c85a70077c6b60ebe267e3424'),(32,2,'20220927.232020.927-financas','2023-02-13 16:42:20','7234955be4cf5fe959f5c9606cac11c5'),(33,2,'20220927.232023.968-financas','2023-02-13 16:42:20','f7f83dabe077a8694ae76a5f9360f72b'),(34,2,'20220927.232026.997-financas','2023-02-13 16:42:20','a3b114ef517c36c75e6e111da198fd1f'),(35,2,'20220927.232030.018-financas','2023-02-13 16:42:20','aef00011cb67387967878e9bc65dc32c'),(36,2,'20220927.232033.051-financas','2023-02-13 16:42:20','e6b10626b12d3232513136ce707a11ba'),(37,2,'20220927.232036.093-financas','2023-02-13 16:42:20','4250c121d338cd0b8c5f44b77985bb67'),(38,2,'20220927.232039.127-financas','2023-02-13 16:42:20','b3b553d9aef2ae3b242a565dba56d814'),(39,2,'20220927.232042.162-financas','2023-02-13 16:42:20','1bf4e2ce4d84e615459b37713ce9fc89'),(40,2,'20220927.232045.187-financas','2023-02-13 16:42:20','bd0c18367b4dbb233222384884545f40'),(41,2,'20220927.232048.220-financas','2023-02-13 16:42:20','b796838e2dde2d259d17deaa99b67128'),(42,2,'20220927.232051.257-financas','2023-02-13 16:42:20','e1d33d75bb2ec96fee7a7c4b17116078'),(43,2,'20220927.232054.286-financas','2023-02-13 16:42:20','4d9a05412b648f64b8848ca00282132f'),(44,2,'20220927.232057.328-financas','2023-02-13 16:42:20','a78c828c81c18b8688b4ffdd24706b3f'),(45,2,'20220927.232100.367-financas','2023-02-13 16:42:20','d8a5707b5bfce3297db29c7e9f244d08'),(46,2,'20220927.232103.395-financas','2023-02-13 16:42:20','6bf68b59f73406f68083b06a76f585ce'),(47,2,'20220927.232106.423-financas','2023-02-13 16:42:20','a8851a7a62b547788ebd9ea27a5c97cb'),(48,2,'20220927.232109.456-financas','2023-02-13 16:42:20','edcbb5f42dcc7c3aa70a4bad46351829'),(49,2,'20220927.232112.491-financas','2023-02-13 16:42:20','355e18fe7368e5a30af05bd3e3f10500'),(50,2,'20220927.232115.513-financas','2023-02-13 16:42:20','51397b5942e302781996ef4a7961d5a1'),(51,2,'20220927.232118.547-financas','2023-02-13 16:42:20','5eb5c16631ad2c7e7c801e3529f5a68f'),(52,2,'20220927.232121.575-financas','2023-02-13 16:42:20','9944cd34a73d07dd40d634f3365bbc1a'),(53,2,'20220927.232124.607-financas','2023-02-13 16:42:20','709434be6032c2348250fcd92eb96908'),(54,2,'20220927.232127.635-financas','2023-02-13 16:42:20','cdd31d0deea3ed724fb6a424bd205d4b'),(55,2,'20220927.232130.676-financas','2023-02-13 16:42:20','df1fd016f551b1c1b7ca1fc417e2d6a4'),(56,2,'20220927.232133.705-financas','2023-02-13 16:42:20','7c879de2dbb058e0eb8c1b63a7498edb'),(57,2,'20220927.232136.737-financas','2023-02-13 16:42:20','9674ef56a9309029bf30890db760d446'),(58,2,'20220927.232139.771-financas','2023-02-13 16:42:20','67ad9f0825492f173e8602c912a74f0c'),(59,2,'20220927.232142.802-financas','2023-02-13 16:42:20','8890fc9939c515956de6f3771dcaa184'),(60,2,'20220927.232145.829-financas','2023-02-13 16:42:20','d738d69c6e7000a231686699748f6e8e'),(61,2,'20220927.232148.858-financas','2023-02-13 16:42:20','1a2d139f9ce8c803a29569e34560cb7c'),(62,2,'20220927.232151.889-financas','2023-02-13 16:42:20','97ca8fba1018e84773c4fa421e4fe7ea'),(63,2,'20220927.232154.913-financas','2023-02-13 16:42:20','bfd5a1621c68bd98e015bad9eadc34e9'),(64,2,'20220927.232157.949-financas','2023-02-13 16:42:20','874d15e9eac4293565ee67526b857cd7'),(65,2,'20220927.232200.972-financas','2023-02-13 16:42:20','d1ec4c53cc42037e1f9c14ea2987a3db'),(66,2,'20220927.232204.006-financas','2023-02-13 16:42:20','cc7cbd5164cef6471dcfff0a3358c7ed'),(67,2,'20220927.232207.039-financas','2023-02-13 16:42:20','684a8c1e0a272a1c63e65237d3cb511c'),(68,2,'20220927.232210.064-financas','2023-02-13 16:42:20','418eb4287277140c8f7411898c295d10'),(69,2,'20220927.232213.090-financas','2023-02-13 16:42:20','f73e79cc1252000e64c7bf8da720c0bf'),(70,2,'20220927.232216.129-financas','2023-02-13 16:42:20','dd6b834f85df91b9c4d0d74106a8fd07'),(71,2,'20220927.232219.167-financas','2023-02-13 16:42:20','25a5cebeffc9e6ab8f8529e825e54851'),(72,2,'20220927.232222.193-financas','2023-02-13 16:42:20','26397ca03299bd2cdf2c5abea268123b'),(73,2,'20220927.232225.219-financas','2023-02-13 16:42:20','fbb98b6ab6aed9882b4fcf3c4a7a8d90'),(74,2,'20220927.232228.256-financas','2023-02-13 16:42:20','d08c2d61a1b1e61245092b56fafcb780'),(75,2,'20220927.232231.283-financas','2023-02-13 16:42:20','12b9dd839b534705590c484d846f15f2'),(76,2,'20220927.232234.314-financas','2023-02-13 16:42:20','ac3279af046b3bea88896b6f51806ff2'),(77,2,'20220927.232237.348-financas','2023-02-13 16:42:20','d4ff256978f2de8d493a50c4e6d6536d'),(78,2,'20220927.232240.374-financas','2023-02-13 16:42:20','2ef6839f7ae49fcb4d5e1b4ebc541973'),(79,2,'20220927.232243.406-financas','2023-02-13 16:42:20','f1d93bd805e5d0b6d1e6bac266deb643'),(80,2,'20220927.232246.448-financas','2023-02-13 16:42:20','29092b075da2f4a097acd0d2a0c519e0'),(81,2,'20220927.232249.485-financas','2023-02-13 16:42:20','dcbcb647a9c304552eb021d944f0b96e'),(82,2,'20220927.232252.522-financas','2023-02-13 16:42:20','3834e07cb3563b780336a8e16c3011e9'),(83,2,'20220927.232255.558-financas','2023-02-13 16:42:20','a3bd07f2efc522b88316faf302303a10'),(84,2,'20220927.232258.583-financas','2023-02-13 16:42:20','0d06ff3c392544427783e0ed1c2e7e8b'),(85,2,'20220927.232301.622-financas','2023-02-13 16:42:20','29d3ea7d918a9d3b22617476f7ba8256'),(86,2,'20220927.232304.657-financas','2023-02-13 16:42:20','38a10665cf9d4442a9a552a1f370d0ee'),(87,2,'20220927.232307.681-financas','2023-02-13 16:42:20','e08b505a088d62c28113e2c3710264d1'),(88,2,'20220927.232310.703-financas','2023-02-13 16:42:20','d06a6a16b39694dde0945cdfa77e7a8a'),(89,2,'20220927.232313.739-financas','2023-02-13 16:42:20','52e0689b4520d8b54b5fcac886efd8b1'),(90,2,'20220927.232316.772-financas','2023-02-13 16:42:20','5b40a010e92ef565e01f79ea9885e562'),(91,2,'20220927.232319.805-financas','2023-02-13 16:42:20','f00023a2063f4b5855d999915ecb5586'),(92,2,'20220927.232322.838-financas','2023-02-13 16:42:20','78230384b86fbc6742b9b2558e6358e0'),(93,2,'20220927.232325.873-financas','2023-02-13 16:42:20','5db3354e39786a80c02bc59ce2c613f6'),(94,2,'20220927.232328.902-financas','2023-02-13 16:42:20','915f5c3cb222fe728867dbeac1fbaf96'),(95,2,'20220927.232331.926-financas','2023-02-13 16:42:20','3e37d17df0fc237131f3f7d505491e0a'),(96,2,'20220927.232334.967-financas','2023-02-13 16:42:20','279fcc60bcbdb8618035a2fb49955fd6'),(97,2,'20220927.232338.003-financas','2023-02-13 16:42:20','685957bc7d4aff147d28ecf275cb457f'),(98,2,'20220927.232341.029-financas','2023-02-13 16:42:20','f0511ade393f7fbaad30c6d79b8a4a10'),(99,2,'20220927.232344.066-financas','2023-02-13 16:42:20','fbbfe554da3e6266d9af058c4e981313'),(100,2,'20220927.232347.103-financas','2023-02-13 16:42:20','f9d7132741f032572aa55ed33e68d1e0'),(101,2,'20220927.232350.132-financas','2023-02-13 16:42:20','9fc5d85c83af0d588acdda2a90d35e01'),(102,2,'20220927.232353.175-financas','2023-02-13 16:42:20','6ad0370ad11a777dcf2a36eab159a2a7'),(103,2,'20220927.232356.206-financas','2023-02-13 16:42:20','0641b81247a296d6262b97731b2ca9cf'),(104,2,'20220927.232359.244-financas','2023-02-13 16:42:20','c379d8a3ef3f5a2693586e8f7234510d'),(105,2,'20220927.232402.269-financas','2023-02-13 16:42:20','b3a0fbe8200db89278e11c4f7f1ac7b1'),(106,2,'20220927.232405.304-financas','2023-02-13 16:42:20','9340b029ef5ffff75af4b904355e1fde'),(107,2,'20220927.232408.343-financas','2023-02-13 16:42:20','1964418f143134bf2e0496d841a43bf5'),(108,2,'20220927.232411.376-financas','2023-02-13 16:42:20','53683f6e38f359a873f06891eed58c07'),(109,2,'20220927.232414.410-financas','2023-02-13 16:42:20','9fd5438033f1f37de0cbfafe6b1bce46'),(110,2,'20220927.232417.444-financas','2023-02-13 16:42:20','c3d0afdfd72a43f72dbe330d7b3e3b18'),(111,2,'20220927.232420.471-financas','2023-02-13 16:42:20','7d0920c76bb4f60bd9943196c1eac28d'),(112,2,'20220927.232423.505-financas','2023-02-13 16:42:20','bf9a75d80dca2db163b18223fe9f6f06'),(113,2,'20220927.232426.546-financas','2023-02-13 16:42:20','9a196ae33c6d9e4524d1fa0949e2cb36'),(114,2,'20220927.232429.583-financas','2023-02-13 16:42:20','4dfa7bd89ba22244bd5cac360a61980a'),(115,2,'20220927.232432.614-financas','2023-02-13 16:42:20','4c9447fd3d38314a5e129b40bb9a596f'),(116,2,'20220927.232435.654-financas','2023-02-13 16:42:20','0a34aabc4ec3fa21d1aae427b0369465'),(117,2,'20220927.232438.684-financas','2023-02-13 16:42:20','f47308f7401a3aa21f7234c29a472ea5'),(118,2,'20220927.232441.715-financas','2023-02-13 16:42:20','6b3c1568265f91b36129dff6098df47f'),(119,2,'20220927.232444.751-financas','2023-02-13 16:42:20','c64503bfc0bd8874a1113fd75cae3bb8'),(120,2,'20220927.232447.784-financas','2023-02-13 16:42:20','a2ff71b32ab8d026ae4a45207496ea5d'),(121,2,'20220927.232450.819-financas','2023-02-13 16:42:20','1fe336b2f16b3ed3717564c372cdd643'),(122,2,'20220927.232453.859-financas','2023-02-13 16:42:20','781f90156213fb09c4af20baae65b106'),(123,2,'20220927.232456.892-financas','2023-02-13 16:42:20','4d6f7a9410427bd4ca6d3e2af913c5a4'),(124,2,'20220927.232459.921-financas','2023-02-13 16:42:20','f4c594402fc33b576c99241e367c8114'),(125,2,'20220927.232502.953-financas','2023-02-13 16:42:20','c3134556c1766ed4a34f4967ec38c4a8'),(126,2,'20220927.232505.981-financas','2023-02-13 16:42:20','7b08acaf64010b39218226d35a598b17'),(127,2,'20220927.232509.010-financas','2023-02-13 16:42:20','25b86310ca287b040f006807cd461169'),(128,2,'20220927.232512.043-financas','2023-02-13 16:42:20','981a1391c75cd94be02b5c8a417941a7'),(129,2,'20220927.232515.073-financas','2023-02-13 16:42:20','a2685f7e0c753022dfc0669b10861a4d'),(130,2,'20220927.232518.111-financas','2023-02-13 16:42:20','9bce5d218439032312fbdc35151d4cc4'),(131,2,'20220927.232521.154-financas','2023-02-13 16:42:20','500ff7d9641f69846318b545e57a3a39'),(132,2,'20220927.232524.192-financas','2023-02-13 16:42:20','515460010f08a28305eef63af56b086b'),(133,2,'20220927.232527.226-financas','2023-02-13 16:42:20','1cd55b2b79d3c6a071e1d5d15b6acc84'),(134,2,'20220927.232530.257-financas','2023-02-13 16:42:20','4a2e6b2af6f5efe9f827eeb424282bf6'),(135,2,'20220927.232533.279-financas','2023-02-13 16:42:20','1f3d8c20a7258f1f1c95510006c34ad9'),(136,2,'20220927.232536.304-financas','2023-02-13 16:42:20','98d4de1302509563b7bb2a6279073fb5'),(137,2,'20220927.232539.334-financas','2023-02-13 16:42:20','7d19dc0f70a37f44d8de657b857dcc9e'),(138,2,'20220927.232542.376-financas','2023-02-13 16:42:20','ee93862578d6da21f6918547961e89bb'),(139,2,'20220927.232545.411-financas','2023-02-13 16:42:20','a2f6d7f56e22c61642bdea0c0ed1aca2'),(140,2,'20220927.232548.441-financas','2023-02-13 16:42:20','74b173c039609025fece35195b0a71fb'),(141,2,'20220927.232551.469-financas','2023-02-13 16:42:20','3081357a48c13550844e80cd1a994788'),(142,2,'20220927.232554.498-financas','2023-02-13 16:42:20','b12860f79cf9a001f89c2ec47a8a2d2b'),(143,2,'20220927.232557.529-financas','2023-02-13 16:42:20','375ba57a0e0930c7e3d3633e50f626e5'),(144,2,'20220927.232600.560-financas','2023-02-13 16:42:20','9588c861356cb974b8262d05411a6642'),(145,2,'20220927.232603.602-financas','2023-02-13 16:42:20','1c4c33f6dc4d3bbeeb89150360bd4343'),(146,2,'20220927.232606.641-financas','2023-02-13 16:42:20','a862044c8af256342639e37fa07e5623'),(147,2,'20220927.232609.672-financas','2023-02-13 16:42:20','78bb8bd3b033feaa63d6832a7d918b45'),(148,2,'20220927.232612.696-financas','2023-02-13 16:42:20','92f4b238e20054966f8008569f66cbcc'),(149,2,'20220927.232615.725-financas','2023-02-13 16:42:20','0255cb60bb276c39ec9490e7650d161f'),(150,2,'20220927.232618.759-financas','2023-02-13 16:42:20','6e910b60164540b203db049a2f405f0f'),(151,2,'20220927.232621.791-financas','2023-02-13 16:42:20','21df70a377d4ea15b7e71084cd7e5d60'),(152,2,'20220927.232624.818-financas','2023-02-13 16:42:20','483775ad495b2557387d7548d55c45b0'),(153,2,'20220927.232627.854-financas','2023-02-13 16:42:20','913f65a4bc45282877ace5e93173f453'),(154,2,'20220927.232630.891-financas','2023-02-13 16:42:20','11dc72c4a7fb626da49bf489a80180aa'),(155,2,'20220927.232633.913-financas','2023-02-13 16:42:20','7e55a9d11e3f7785c926212cec4b84bf'),(156,2,'20220927.232636.944-financas','2023-02-13 16:42:20','55cf72f9ba9a2e9d86e246bfdda378ef'),(157,2,'20220927.232639.974-financas','2023-02-13 16:42:20','20825e97ed1c461e12f885810ecebdbc'),(158,2,'20220927.232643.008-financas','2023-02-13 16:42:20','0ce04bd3778367235106ea9931129ecc'),(159,2,'20220927.232646.039-financas','2023-02-13 16:42:20','3635657c7bf7d41e87a821f9c5d0840c'),(160,2,'20220927.232649.072-financas','2023-02-13 16:42:20','141be1e973fc594bb04963c75b0ba389'),(161,2,'20220927.232652.103-financas','2023-02-13 16:42:20','3a107899b9436a13caf496ce8deb4329'),(162,2,'20220927.232655.134-financas','2023-02-13 16:42:20','795583be9a0e1d557bd53de8f6b70cbb'),(163,2,'20220927.232658.169-financas','2023-02-13 16:42:20','371b4f6a92700e627949e57a9ff5cf6a'),(164,2,'20220927.232701.204-financas','2023-02-13 16:42:20','8523725f57fe4c89587aae966ce0b7b9'),(165,2,'20220927.232704.237-financas','2023-02-13 16:42:20','106995f55fec83c2373c17e57e572ee2'),(166,2,'20220927.232707.265-financas','2023-02-13 16:42:20','238c34ff48d4d6093537892eb1ecead9'),(167,2,'20220927.232710.291-financas','2023-02-13 16:42:20','597017889e227df7c3a8ef03ba8063c7'),(168,2,'20220927.232713.319-financas','2023-02-13 16:42:20','f87b75035087f3779871fe59baa9c14d'),(169,2,'20220927.232716.345-financas','2023-02-13 16:42:20','0aca01c83007262d27d0431964f81e4f'),(170,2,'20220927.232719.376-financas','2023-02-13 16:42:20','7d582d4707d3fd82c5b21cd547469ab0'),(171,2,'20220927.232722.413-financas','2023-02-13 16:42:20','8ad2f0ae59ba908121c9234da78d152f'),(172,2,'20220927.232725.451-financas','2023-02-13 16:42:20','1c7c8287122ecedcdbc847f9c2b44e12'),(173,2,'20220927.232728.475-financas','2023-02-13 16:42:20','7c974f6a76555e67587083255a94bfab'),(174,2,'20220927.232731.509-financas','2023-02-13 16:42:20','8cbe18b01d91efd6313ee701c6cf9ef7'),(175,2,'20220927.232734.538-financas','2023-02-13 16:42:20','71be8b465f7ab35f9beb1b6a5b6bca61'),(176,2,'20220927.232737.569-financas','2023-02-13 16:42:20','9fbcb15f98b2fa30240d9909243b15e5'),(177,2,'20220927.232740.596-financas','2023-02-13 16:42:20','004f7194585e75de16042b69105bc7ca'),(178,2,'20220927.232743.629-financas','2023-02-13 16:42:20','004ac44d1a9cc1a7aee25ad381aecbbc'),(179,2,'20220927.232746.669-financas','2023-02-13 16:42:20','330ce892ef73a1a5909488d4e0a894ee'),(180,2,'20220927.232749.707-financas','2023-02-13 16:42:20','a7372c8532719a6432983d90e59989f7'),(181,2,'20220927.232752.736-financas','2023-02-13 16:42:20','8d6393b32af2914a92db738cf18ba619'),(182,2,'20220927.232755.766-financas','2023-02-13 16:42:20','b2052c003420d5a1898eec7848f92e61'),(183,2,'20220927.232758.799-financas','2023-02-13 16:42:20','32c01145d0abc693ee2b6b05f2b898bd'),(184,2,'20220927.232801.839-financas','2023-02-13 16:42:20','ad8b567fd43d037d16324067b150a9c8'),(185,2,'20220927.232804.868-financas','2023-02-13 16:42:20','2017e4e113f142877b4d2ceb200e2e67'),(186,2,'20220927.232807.904-financas','2023-02-13 16:42:20','6c1105ee032464b4a43daa1104ba939b'),(187,2,'20220927.232810.940-financas','2023-02-13 16:42:20','962181aa33a62e2124caf2283b4a4abb'),(188,2,'20220927.232813.974-financas','2023-02-13 16:42:20','1acf1844c8e1efa88faeaf5ebd76e060'),(189,2,'20220927.232817.010-financas','2023-02-13 16:42:20','b34acbe3deb18ab5d7ece5ff813a1c62'),(190,2,'20220927.232820.040-financas','2023-02-13 16:42:20','d74a2c2001615e66b983338b2d5340a6'),(191,2,'20220927.232823.062-financas','2023-02-13 16:42:20','7c35843c0bfb680490ac070638513ab1'),(192,2,'20220927.232826.092-financas','2023-02-13 16:42:20','0cccbf5bab0ce6d62833994edf3686b5'),(193,2,'20220927.232829.122-financas','2023-02-13 16:42:20','f6fb38453caae444079bdd24190a6eb6'),(194,2,'20220927.232832.143-financas','2023-02-13 16:42:20','b1d4461a80e8847c3b1bdfb46a3b25af'),(195,2,'20220927.232835.174-financas','2023-02-13 16:42:20','668213ec28e33b46a895cbb3adf97fc2'),(196,2,'20220927.232838.193-financas','2023-02-13 16:42:20','22d3cdfcc7bf1bc0d4a97e6b1a04fb61'),(197,2,'20220927.232841.224-financas','2023-02-13 16:42:20','144169e37182b5d3c148ae7b97ba096f'),(198,2,'20220927.232844.252-financas','2023-02-13 16:42:20','8182e299d1fdb0a41ce377e24db9c212'),(199,2,'20220927.232847.290-financas','2023-02-13 16:42:20','814f20643a11b80ea303b4b34042158f'),(200,2,'20220927.232850.325-financas','2023-02-13 16:42:20','5b6273060fe10c16f0c12b1f9e822f05'),(201,2,'20220927.232853.357-financas','2023-02-13 16:42:20','4b7d69284af96ec7c4bf2cccfa783b46'),(202,2,'20220927.232856.391-financas','2023-02-13 16:42:20','49b9894509e95ae59ee2f975bc319a39'),(203,2,'20220927.232859.421-financas','2023-02-13 16:42:20','31fc56d753eb077a84e661426ffa84c6'),(204,2,'20220927.232902.454-financas','2023-02-13 16:42:20','c22cf95c8f497f5e976c5daff83701c6'),(205,2,'20220927.232905.477-financas','2023-02-13 16:42:20','d76f6720856f39da5567bb12b3c7512a'),(206,2,'20220927.232908.500-financas','2023-02-13 16:42:20','2c4aae1ceb04c91ab18e3befc3f3c745'),(207,2,'20220927.232911.522-financas','2023-02-13 16:42:20','0ad830acad70953dbdb3e43f324b076b'),(208,2,'20220927.232914.565-financas','2023-02-13 16:42:20','ec9002d3f401c4a395e7f0a1fe1d71e7'),(209,2,'20220927.232917.598-financas','2023-02-13 16:42:20','11bd24fa74d91f3f0b2e0552a9fb96e5'),(210,2,'20220927.232920.621-financas','2023-02-13 16:42:20','2920a8b92e6961a2aea869e4f0e04788'),(211,2,'20220927.232923.657-financas','2023-02-13 16:42:20','ada3a6d1a5c56766dd9944dcfe0f4cc5'),(212,2,'20220927.232926.695-financas','2023-02-13 16:42:20','da6a17f7b4ba7694116ff28a91513df2'),(213,2,'20220927.232929.719-financas','2023-02-13 16:42:20','5e93443c8055a1659719c1fa3784964e'),(214,2,'20220927.232932.746-financas','2023-02-13 16:42:20','9f1db5000ad68bf9dc1e2a08c67ab661'),(215,2,'20220927.232935.782-financas','2023-02-13 16:42:20','320f7e60db24ce71ad4e8596a4cec377'),(216,2,'20220927.232938.815-financas','2023-02-13 16:42:20','3857edb255631932bdfb8900463d5fc4'),(217,2,'20220927.232941.849-financas','2023-02-13 16:42:20','5a70021a3c4c46dc96134ae120080839'),(218,2,'20220927.232944.888-financas','2023-02-13 16:42:20','58cbdabe1c1a9279292d8c00bc82d4a4'),(219,2,'20220927.232947.917-financas','2023-02-13 16:42:20','ad73228334b899aadcbb2e7f2b05a210'),(220,2,'20220927.232950.951-financas','2023-02-13 16:42:20','681d11dd4607e1b365f07443de6af507'),(221,2,'20220927.232953.974-financas','2023-02-13 16:42:20','e10f7691089066ae26abd6cf38c66b40'),(222,2,'20220927.232957.014-financas','2023-02-13 16:42:20','a6a019d5cb1931478fbe675bd8b72143'),(223,2,'20220927.233000.051-financas','2023-02-13 16:42:20','3dafb219d3093922661917a18a171a10'),(224,2,'20220927.233003.079-financas','2023-02-13 16:42:20','c68193f3786049ae9331d3d268ff7b4b'),(225,2,'20220927.233006.103-financas','2023-02-13 16:42:20','769bd051f994e218e72ef2760b119aaa'),(226,2,'20220927.233009.138-financas','2023-02-13 16:42:20','4d58eb40649d44e41c1c05db5abd934d'),(227,2,'20220927.233012.173-financas','2023-02-13 16:42:20','da512a1b669a6e213fea873998ec8cc1'),(228,2,'20220927.233015.214-financas','2023-02-13 16:42:20','f7313c9be047e5789d4b545e5f87dbff'),(229,2,'20220927.233018.251-financas','2023-02-13 16:42:20','55eddf230dfd957f00d8e40cb3985836'),(230,2,'20220927.233021.285-financas','2023-02-13 16:42:20','fb869b9ba9ff361b42d71ae05fb7a23e'),(231,2,'20220927.233024.319-financas','2023-02-13 16:42:20','d39ec346da13a74f2bd7497669b335ee'),(232,2,'20220927.233027.356-financas','2023-02-13 16:42:20','877c1cce9b2b3efd816a8e4c2dffca08'),(233,2,'20220927.233030.384-financas','2023-02-13 16:42:20','3f824c79796a41d6e173f597e42421e5'),(234,2,'20220927.233033.418-financas','2023-02-13 16:42:20','6bb789961c08c4c25063ef6a6cabf26f'),(235,2,'20220927.233036.448-financas','2023-02-13 16:42:20','728b3838904f90a8876dadcd126fe6e5'),(236,2,'20220927.233039.475-financas','2023-02-13 16:42:20','d9b240e882ea24cd55a3008e3a15c40b'),(237,2,'20220927.233042.508-financas','2023-02-13 16:42:20','abca578f31a37038988e3814f6c0d8d1'),(238,2,'20220927.233045.537-financas','2023-02-13 16:42:20','643453a6042974a9f1b15bd0bada175a'),(239,2,'20220927.233048.574-financas','2023-02-13 16:42:20','ae305da9526c1040ee0773b80ac6d6ae'),(240,2,'20220927.233051.607-financas','2023-02-13 16:42:20','c9aaf6203ff3cc0a2e4d52fb7723041a'),(241,2,'20220927.233054.633-financas','2023-02-13 16:42:20','cd4bd91a9d77ff9cf353fe7640d4c10d'),(242,2,'20220927.233057.670-financas','2023-02-13 16:42:20','6854abb1f5723efaaa5ac5e4d7f9c417'),(243,2,'20220927.233100.705-financas','2023-02-13 16:42:20','0f8fbae277edaa65f724609e9846b405'),(244,2,'20220927.233103.739-financas','2023-02-13 16:42:20','18a0b80f948b0c3b8f36ce1c39cea96e'),(245,2,'20220927.233106.773-financas','2023-02-13 16:42:20','d7f831086e9f3bb0a0099dc220cf09f7'),(246,2,'20220927.233109.798-financas','2023-02-13 16:42:20','0f9f0b346434098c77d54d2d6bf3c2b8'),(247,2,'20220927.233112.826-financas','2023-02-13 16:42:20','8fe469787501a2d9f3ccf706f458643a'),(248,2,'20220927.233115.869-financas','2023-02-13 16:42:20','20196eed54ecd5d80e2bb85d4062ce36'),(249,2,'20220927.233118.907-financas','2023-02-13 16:42:20','eecee138fcbf722eaa42eae9c060e76c'),(250,2,'20220927.233121.950-financas','2023-02-13 16:42:20','afba487f9d66dad8fbd65d7947d7f020'),(251,2,'20220927.233124.971-financas','2023-02-13 16:42:20','b9bce4cd22256bea43827c5a2d9c294f'),(252,2,'20220927.233127.996-financas','2023-02-13 16:42:20','a82363125489fc701ed73e2006be6af0'),(253,2,'20220927.233131.020-financas','2023-02-13 16:42:20','8d6de8b2789a2d8e57c78179ce18d90e'),(254,2,'20220927.233134.048-financas','2023-02-13 16:42:20','33e27392f238474075481114f3e7bbed'),(255,2,'20220927.233137.082-financas','2023-02-13 16:42:20','85c2ecc3974992350be1f43230700f6b'),(256,2,'20220927.233140.114-financas','2023-02-13 16:42:20','3cea1fda741fdc08ab57d4777c6b1587'),(257,2,'20220927.233143.138-financas','2023-02-13 16:42:20','b05f48095379c0f634221b796e28fe06'),(258,2,'20220927.233146.165-financas','2023-02-13 16:42:20','58468f6ee70bb3042e44d1034a8e3dae'),(259,2,'20220927.233149.197-financas','2023-02-13 16:42:20','588fed615f8d0e17d89a2b039cdb929e'),(260,2,'20220927.233152.220-financas','2023-02-13 16:42:20','5a6a6be8d10932ebb67381e8342d28e9'),(261,2,'20220927.233155.254-financas','2023-02-13 16:42:20','08e1400d68f0dec50f95634e0b2a085d'),(262,2,'20220927.233158.293-financas','2023-02-13 16:42:20','1bf30f665ff3f9f3824f01962cd4169d'),(263,2,'20220927.233201.333-financas','2023-02-13 16:42:20','699ee358e9e75b69a86a75ffd2638021'),(264,2,'20220927.233204.354-financas','2023-02-13 16:42:20','b2d23d244cd829368b9fe7f723e4c7d7'),(265,2,'20220927.233207.389-financas','2023-02-13 16:42:20','f55fbfbb99816d93506fb3acf97559dc'),(266,2,'20220927.233210.421-financas','2023-02-13 16:42:20','1a3d0d50cb41231f9cd007cd3382c21f'),(267,2,'20220927.233213.451-financas','2023-02-13 16:42:20','5ef31dcbf6d9285be37c9b7d72154074'),(268,2,'20220927.233216.484-financas','2023-02-13 16:42:20','5e10c682f054444e9e6207d0e3605711'),(269,2,'20220927.233219.516-financas','2023-02-13 16:42:20','6f83755f25637c65ecfeaf0fa172a616'),(270,2,'20220927.233222.552-financas','2023-02-13 16:42:20','77fb89124db7340945a1a47da8c6219b'),(271,2,'20220927.233225.592-financas','2023-02-13 16:42:20','08932176def8bbbe3db1fde596e666b3'),(272,2,'20220927.233228.620-financas','2023-02-13 16:42:20','130793d9d458c735c845a837d8918237'),(273,2,'20220927.233231.649-financas','2023-02-13 16:42:20','a91d539a4330449afe81c172814683a6'),(274,2,'20220927.233234.669-financas','2023-02-13 16:42:20','a4d8eef78fe977799b8a5d14da486d7a'),(275,2,'20220927.233237.700-financas','2023-02-13 16:42:20','7220b1bfab7cc94bc5840aed5c24ccfe'),(276,2,'20220927.233240.741-financas','2023-02-13 16:42:20','c49816cb027ffe7b1ba04341d0f51c43'),(277,2,'20220927.233243.772-financas','2023-02-13 16:42:20','ff524ceb4ca3e72f4bee1fc5431553bf'),(278,2,'20220927.233246.800-financas','2023-02-13 16:42:20','299307f2152a3249e8c727265e33f9ba'),(279,2,'20220927.233249.833-financas','2023-02-13 16:42:20','9a36e2ce2e297d441c6103dbfe2232e3'),(280,2,'20220927.233252.865-financas','2023-02-13 16:42:20','918c2e98b09471fb1e01cf1d0bcff232'),(281,2,'20220927.233255.902-financas','2023-02-13 16:42:20','67c866f6383f54e4d071cd2c67a0472d'),(282,2,'20220927.233258.928-financas','2023-02-13 16:42:20','5968a9d3404b8943dff56d8d2d196a3a'),(283,2,'20220927.233301.965-financas','2023-02-13 16:42:20','489b96ba1f7f4edee673754dfebf8d41'),(284,2,'20220927.233304.995-financas','2023-02-13 16:42:20','ceaaf33a08386a423d2ffbee531c3075'),(285,2,'20220927.233308.032-financas','2023-02-13 16:42:20','58a00ae0805df8c9d5c3c78773f739b1'),(286,2,'20220927.233311.065-financas','2023-02-13 16:42:20','bd6e230682db1160e9776e0ff47b9225'),(287,2,'20220927.233314.087-financas','2023-02-13 16:42:20','cc03c269df276585870540dcc678c293'),(288,2,'20220927.233317.123-financas','2023-02-13 16:42:20','26ecc7e900880c02e1be1a17bb24affc'),(289,2,'20220927.233320.152-financas','2023-02-13 16:42:20','e140ee4fa524027c8d3f3b4625ea9b2e'),(290,2,'20220927.233323.176-financas','2023-02-13 16:42:20','7ba517650ac98a1e154c8ec9ef2f4670'),(291,2,'20220927.233326.216-financas','2023-02-13 16:42:20','59e4be0d981ec1f9480c5b2cf8fa1d8b'),(292,2,'20220927.233329.250-financas','2023-02-13 16:42:20','427a5d3ac804a1c63c79fe8e3740533a'),(293,2,'20220927.233332.286-financas','2023-02-13 16:42:20','3c5f4d40f1f25ff285f45ea2b6b4690b'),(294,2,'20220927.233335.309-financas','2023-02-13 16:42:20','3bc7a63cb56a6adcef9d514e3a7fa31f'),(295,2,'20220927.233338.333-financas','2023-02-13 16:42:20','41c2b95ba1027eabd42c4a98b282f344'),(296,2,'20220927.233341.370-financas','2023-02-13 16:42:20','4c3d07dcc0fd551684e04c0b7c99cdb7'),(297,2,'20220927.233344.403-financas','2023-02-13 16:42:20','92917ea4d322cb08c9769a7aaaf72e5f'),(298,2,'20220927.233347.437-financas','2023-02-13 16:42:20','13840cd782a2dfad78fd8ff3cd07ff7c'),(299,2,'20220927.233350.473-financas','2023-02-13 16:42:20','e9de01db31c82a15985874b941f88ba2'),(300,2,'20220927.233353.505-financas','2023-02-13 16:42:20','75193f0ec5204210fd7e07f3cd7dc2b5'),(301,2,'20220927.233356.539-financas','2023-02-13 16:42:20','a81d2596d5d39818ff1ef0219143ac8f'),(302,2,'20220927.233359.570-financas','2023-02-13 16:42:20','4ae0927e2f3361591834edf364223bbf'),(303,2,'20220927.233402.594-financas','2023-02-13 16:42:20','edc4d92e7d66eb5d5c0fef1669f017fc'),(304,2,'20220927.233405.621-financas','2023-02-13 16:42:20','8e42ba1129e0f40bbe2359fe8c3879eb'),(305,2,'20220927.233408.650-financas','2023-02-13 16:42:20','8e0bd36e909c4bfb5f609bf812c42e42'),(306,2,'20220927.233411.675-financas','2023-02-13 16:42:20','8d0d649fd8298ec45da8de095dd0b530'),(307,2,'20220927.233414.710-financas','2023-02-13 16:42:20','f7b585dbf3ff72ee6b0c579b44126f2a'),(308,2,'20220927.233417.737-financas','2023-02-13 16:42:20','1a8a42244ce2041d53ca98d43fd35a0c'),(309,2,'20220927.233420.764-financas','2023-02-13 16:42:20','7f372b32fb76cfa43e047ae52dcee10c'),(310,2,'20220927.233423.788-financas','2023-02-13 16:42:20','7173010fc65195f36bdcc0d3b06d3624'),(311,2,'20220927.233426.817-financas','2023-02-13 16:42:20','282c88e39b402375c84636fa7bb8d087'),(312,2,'20220927.233429.843-financas','2023-02-13 16:42:20','434b36f4974f72ec6e5452d9dd46de15'),(313,2,'20220927.233432.871-financas','2023-02-13 16:42:20','8b31438dbab070215e7876aa6197f633'),(314,2,'20220927.233435.901-financas','2023-02-13 16:42:20','9eb61a9c364fcb5df118be7983939f24'),(315,2,'20220927.233438.928-financas','2023-02-13 16:42:20','906b6f2d5d340e70996cf1f5fc159a27'),(316,2,'20220927.233441.956-financas','2023-02-13 16:42:20','b7d8ce0b88a5c5c86837664b76800f15'),(317,2,'20220927.233444.994-financas','2023-02-13 16:42:20','d1e04724e7bd99f06997327e3d47257d'),(318,2,'20220927.233448.030-financas','2023-02-13 16:42:20','e1317ca043fc2c02ff1f06703ddedae1'),(319,2,'20220927.233451.058-financas','2023-02-13 16:42:20','1f84625c0d73d5cc2999ad1a6cbe360c'),(320,2,'20220927.233454.093-financas','2023-02-13 16:42:20','ee814fdbc7ac2cb0ea71ec8db9f1580b'),(321,2,'20220927.233457.121-financas','2023-02-13 16:42:20','4712c9066051b2fcc447caac6253511d'),(322,2,'20220927.233500.160-financas','2023-02-13 16:42:20','fd5687144e5b1091d653711dade1fc59'),(323,2,'20220927.233503.188-financas','2023-02-13 16:42:20','bf0191000e8c5d77c64ff1c3abae1e34'),(324,2,'20220927.233506.220-financas','2023-02-13 16:42:20','e5811dfdda37dfc3c97a21422a735e13'),(325,2,'20220927.233509.252-financas','2023-02-13 16:42:20','d64b4f7535aa7454792dbcabef59c2a3'),(326,2,'20220927.233512.279-financas','2023-02-13 16:42:20','b387fdf68d75dfa69057d4ead1f01194'),(327,2,'20220927.233515.317-financas','2023-02-13 16:42:20','4ae3dcf7af3558d23293dd4931631e40'),(328,2,'20220927.233518.346-financas','2023-02-13 16:42:20','073099a88ca58bf4cb3062ebd9894f26'),(329,2,'20220927.233521.383-financas','2023-02-13 16:42:20','82f6e662013a7f5af521746589184871'),(330,2,'20220927.233524.416-financas','2023-02-13 16:42:20','ef17675ac693f493b1e8d30c59eabf00'),(331,2,'20220927.233527.451-financas','2023-02-13 16:42:20','a7e39f0fa17a98e56419eda88ca06d7c'),(332,2,'20220927.233530.482-financas','2023-02-13 16:42:20','293765b2eb27676efb88a6429fa76847'),(333,2,'20220927.233533.508-financas','2023-02-13 16:42:20','8b0005a2baf716eecdc4108d06bef227'),(334,2,'20220927.233536.538-financas','2023-02-13 16:42:20','9c79fa90666b9a69775fba1e33c09025'),(335,2,'20220927.233539.570-financas','2023-02-13 16:42:20','7065c3c439337a151b6fc112b345e787'),(336,2,'20220927.233542.602-financas','2023-02-13 16:42:20','8fde71b3e6e15adb70ebd18a1ec48e12'),(337,2,'20220927.233545.635-financas','2023-02-13 16:42:20','f95524fb1fcf704ddaa7838b8fa0a345'),(338,2,'20220927.233548.663-financas','2023-02-13 16:42:20','aab408e07f1bc17dac9ed5da6a5addcd'),(339,2,'20220927.233551.702-financas','2023-02-13 16:42:20','585143751939f7073d24cce4d5ddbc6d'),(340,2,'20220927.233554.731-financas','2023-02-13 16:42:20','57a0d31c7314903c4899843d63318018'),(341,2,'20220927.233557.763-financas','2023-02-13 16:42:20','0d556a076781c3c61c050bc52bea7390'),(342,2,'20220927.233600.787-financas','2023-02-13 16:42:20','544bf59c80ac9c42e272e7717e5b124c'),(343,2,'20220927.233603.828-financas','2023-02-13 16:42:20','6eddec23ca5a439240570439a75c260d'),(344,2,'20220927.233606.856-financas','2023-02-13 16:42:20','546404773806fa3562bb588ee612ffe9'),(345,2,'20220927.233609.882-financas','2023-02-13 16:42:20','6c2326178a9d7c682ad01a32601512d7'),(346,2,'20220927.233612.916-financas','2023-02-13 16:42:20','5f6afe342c7b9727ac3d6438e1f4bfa5'),(347,2,'20220927.233615.956-financas','2023-02-13 16:42:20','ded4837f51bf6c787a8a19be3598174e'),(348,2,'20220927.233618.986-financas','2023-02-13 16:42:20','14a14b5ada606afa1d1359965dc7e47d'),(349,2,'20220927.233622.014-financas','2023-02-13 16:42:20','5dbebbaa112fae42295f3baa943397f6'),(350,2,'20220927.233625.042-financas','2023-02-13 16:42:20','0a59bc884d1009bb7ba4d19289da33dd'),(351,2,'20220927.233628.079-financas','2023-02-13 16:42:20','d874de1f26b8df0b470022d538de7712'),(352,2,'20220927.233631.113-financas','2023-02-13 16:42:20','72ecf0c897e4eb4b39ad011495f08ec1'),(353,2,'20220927.233634.148-financas','2023-02-13 16:42:20','32373672c9c643855f4b0568a1b5e397'),(354,2,'20220927.233637.174-financas','2023-02-13 16:42:20','d533ab6de51df2f6eeb8a1768233bf76'),(355,2,'20220927.233640.203-financas','2023-02-13 16:42:20','3890f3705959e4db8b215d5ac6b34776'),(356,2,'20220927.233643.239-financas','2023-02-13 16:42:20','ba23b0b005e749349260f7b6b569266d'),(357,2,'20220927.233646.274-financas','2023-02-13 16:42:20','29002d2b56028dc1de72f2764b8d614a'),(358,2,'20220927.233649.314-financas','2023-02-13 16:42:20','0d530444d44f41494529c53de0df8410'),(359,2,'20220927.233652.341-financas','2023-02-13 16:42:20','ae2b59958d12923599e4adf5acc59c01'),(360,2,'20220927.233655.369-financas','2023-02-13 16:42:20','620475b6ae204034f08ae77dfe152d84'),(361,2,'20220927.233658.406-financas','2023-02-13 16:42:20','a74ebd4bcb3d6d39cc2692eccc46569f'),(362,2,'20220927.233701.434-financas','2023-02-13 16:42:20','07fee8e379a5ade1d1fcd4fcbd7cc487'),(363,2,'20220927.233704.470-financas','2023-02-13 16:42:20','4d0ee35191aacfe498565b8e7df01c2c'),(364,2,'20220927.233707.503-financas','2023-02-13 16:42:20','7a58c7169dc7c5411ad537e6ce5484e7'),(365,2,'20220927.233710.545-financas','2023-02-13 16:42:20','6bb68791f19091802e134e7a7eac1269'),(366,2,'20220927.233713.585-financas','2023-02-13 16:42:20','31915d38a2026a48cc09563002ee1fab'),(367,2,'20220927.233716.615-financas','2023-02-13 16:42:20','7ab1326fc885aeeb254be13149f44d59'),(368,2,'20220927.233719.646-financas','2023-02-13 16:42:20','0ea61fb1d4a37c8eaebea227f2f5e319'),(369,2,'20220927.233722.675-financas','2023-02-13 16:42:20','0de8a3cee69d4b2579c65a1a55f5562a'),(370,2,'20220927.233725.702-financas','2023-02-13 16:42:20','2abf3790f901cff89bd857af22c9a3a4'),(371,2,'20220927.233728.733-financas','2023-02-13 16:42:20','5b402f7a8d295ff4485058de6069b0d6'),(372,2,'20220927.233731.770-financas','2023-02-13 16:42:20','4ee45ef7583bbf6de738a895842b1dcb'),(373,2,'20220927.233734.803-financas','2023-02-13 16:42:20','da495b41048a8a2c2c3144270826be46'),(374,2,'20220927.233737.839-financas','2023-02-13 16:42:20','640b1e045be4cbd810928862bcd13fdc'),(375,2,'20220927.233740.871-financas','2023-02-13 16:42:20','28d5b1cc1b50f87074209c97cad19893'),(376,2,'20220927.233743.907-financas','2023-02-13 16:42:20','1939b15f9fbf0f7be58b96c61e2473f1'),(377,2,'20220927.233746.934-financas','2023-02-13 16:42:20','7c1ed708755dc84eb6fee4278ae6f437'),(378,2,'20220927.233749.963-financas','2023-02-13 16:42:20','7dc7dd0a112b5c912b4df8136593f1a6'),(379,2,'20220927.233753.003-financas','2023-02-13 16:42:20','4f7d309095a7c329e8b548d23433ccce'),(380,2,'20220927.233756.033-financas','2023-02-13 16:42:20','e44d1172cf6eb7a5de07d6c86cc42011'),(381,2,'20220927.233759.067-financas','2023-02-13 16:42:20','2ce9467d4a9e7cb947fd0014657d33e3'),(382,2,'20220927.233802.099-financas','2023-02-13 16:42:20','58158374137eeba024f6067dfd42e80a'),(383,2,'20220927.233805.139-financas','2023-02-13 16:42:20','86246ba53c8e239894708e6d4c753482'),(384,2,'20220927.233808.164-financas','2023-02-13 16:42:20','de1efd7f6b4feaef1177e5782d895ae0'),(385,2,'20220927.233811.192-financas','2023-02-13 16:42:20','2494c5b43664ade1b666592d70df1c40'),(386,2,'20220927.233814.222-financas','2023-02-13 16:42:20','869da868ec0731ba216e708de78cbf49'),(387,2,'20220927.233817.252-financas','2023-02-13 16:42:20','931ddb3d4937415c3d5c6643df5e5ea3'),(388,2,'20220927.233820.280-financas','2023-02-13 16:42:20','b1f95e7fbabcb07186d9fc1213c8fea3'),(389,2,'20220927.233823.308-financas','2023-02-13 16:42:20','1259d5e08a34b425488b80f089cfebde'),(390,2,'20220927.233826.348-financas','2023-02-13 16:42:20','d6d81ec6a362298ede14cb5df7d83c50'),(391,2,'20220927.233829.388-financas','2023-02-13 16:42:20','fb2a9d3b47110d529da22fed25692635'),(392,2,'20220927.233832.426-financas','2023-02-13 16:42:20','ce3f582b881145c39c68f6f729d893a8'),(393,2,'20220927.233835.452-financas','2023-02-13 16:42:20','5355cc7089e50c0529cfaaf1c0c025d4'),(394,2,'20220927.233838.483-financas','2023-02-13 16:42:20','a4a381fd7ef0b7582acb5721ac56c017'),(395,2,'20220927.233841.510-financas','2023-02-13 16:42:20','1ef6564939b761bc39dfe2280405020c'),(396,2,'20220927.233844.540-financas','2023-02-13 16:42:20','99ad86b472e31c3fbb41bef28aad093a'),(397,2,'20220927.233847.567-financas','2023-02-13 16:42:20','430bf87936a02e0b07b21dc1792ade1e'),(398,2,'20220927.233850.604-financas','2023-02-13 16:42:20','1887478f76cf8925d1d75ba84be837f9'),(399,2,'20220927.233853.626-financas','2023-02-13 16:42:20','a962dc1f3a11700e238955bf23140df4'),(400,2,'20220927.233856.660-financas','2023-02-13 16:42:20','846c34b276aeabdf9afd69a55a370267'),(401,2,'20220927.233859.698-financas','2023-02-13 16:42:20','2c637240a26584f78283c7dbcd37ee43'),(402,2,'20220927.233902.727-financas','2023-02-13 16:42:20','54707519e7c80af266e8b9bff4b3a308'),(403,2,'20220927.233905.755-financas','2023-02-13 16:42:20','e7fb20eed7db674af70dbf9a96b323c6'),(404,2,'20220927.233908.783-financas','2023-02-13 16:42:20','f22989877976ac5fa9cfb33fc965ad30'),(405,2,'20220927.233911.822-financas','2023-02-13 16:42:20','9d11abcee1f323f9041fbfa078014d51'),(406,2,'20220927.233914.848-financas','2023-02-13 16:42:20','830bc3eb994af3bd3b73ee1776567e35'),(407,2,'20220927.233917.883-financas','2023-02-13 16:42:20','d664b2c71ae4eea5d4f7f54904fcca09'),(408,2,'20220927.233920.911-financas','2023-02-13 16:42:20','24573f175910aadf8a7ed397848f3e45'),(409,2,'20220927.233923.943-financas','2023-02-13 16:42:20','d45dd5ce46d1b935e1cd6d43acd263d1'),(410,2,'20220927.233926.980-financas','2023-02-13 16:42:20','0e6542363d1427174ab41da92be2ffe5'),(411,2,'20220927.233930.002-financas','2023-02-13 16:42:20','7baf1cb95cedda52a2324b65a52441ae'),(412,2,'20220927.233933.033-financas','2023-02-13 16:42:20','1eb3bdb86264d44800e6984dd7041dcb'),(413,2,'20220927.233936.059-financas','2023-02-13 16:42:20','81566efb4158487c672cd3214874ab87'),(414,2,'20220927.233939.083-financas','2023-02-13 16:42:20','cd8cbfbef7044c7a83489781f9ec1c0e'),(415,2,'20220927.233942.114-financas','2023-02-13 16:42:20','29d18d2b7edb49828d66ff1f03be8111'),(416,2,'20220927.233945.146-financas','2023-02-13 16:42:20','ef58fb80bc349fb6a8b69080602e3655'),(417,2,'20220927.233948.182-financas','2023-02-13 16:42:20','5ecb63fd386e9e700bcb1bc52def2d08'),(418,2,'20220927.233951.214-financas','2023-02-13 16:42:20','291af85d16bdb47f0e59470b3e45e728'),(419,2,'20220927.233954.246-financas','2023-02-13 16:42:20','ed76b3d56f8b169d706cbc6d2f547012'),(420,2,'20220927.233957.277-financas','2023-02-13 16:42:20','2925f9318effc098fd07979a6f3e9ec6'),(421,2,'20220927.234000.314-financas','2023-02-13 16:42:20','f5fddea6473ced17a46a7f3ec219dccd'),(422,2,'20220927.234003.355-financas','2023-02-13 16:42:20','75ecd14d363d41ef07de52a372cd3255'),(423,2,'20220927.234006.387-financas','2023-02-13 16:42:20','cb7271a2a242623dfab0762a01a1856f'),(424,2,'20220927.234009.422-financas','2023-02-13 16:42:20','3c78e729ef950433c97f13f9ca27853a'),(425,2,'20220927.234012.459-financas','2023-02-13 16:42:20','b4deac91acc5e174c6d16950aa051509'),(426,2,'20220927.234015.492-financas','2023-02-13 16:42:20','93134f48bce2a07eca4876e8ade6deb3'),(427,2,'20220927.234018.526-financas','2023-02-13 16:42:20','1579ad472926da8671b7a976142765b9'),(428,2,'20220927.234021.564-financas','2023-02-13 16:42:20','2ed51c3189fe1c70c45d815e05f0c7f1'),(429,2,'20220927.234024.597-financas','2023-02-13 16:42:20','2e3eb04d49f0ddea6dc6e476884318a4'),(430,2,'20220927.234027.624-financas','2023-02-13 16:42:20','2007360cd26ee43eb4bb0a36aa369056'),(431,2,'20220927.234030.652-financas','2023-02-13 16:42:20','cad2781bae6948b76280ceeb9e39cbba'),(432,2,'20220927.234033.680-financas','2023-02-13 16:42:20','a714c7c02d7b761411b8d7d7ec0b9072'),(433,2,'20220927.234036.716-financas','2023-02-13 16:42:20','e939e9902b41157c0bbd63fbba1412ff'),(434,2,'20220927.234039.750-financas','2023-02-13 16:42:20','33a370feaf1dca9d52ca1c58eca56079'),(435,2,'20220927.234042.783-financas','2023-02-13 16:42:20','5354bdec32901b480cebed5f488654f5'),(436,2,'20220927.234045.824-financas','2023-02-13 16:42:20','a2d0c4bb64c50f6557644721b5237ad2'),(437,2,'20220927.234048.861-financas','2023-02-13 16:42:20','fb2415c9e71125721a46bd213260536e'),(438,2,'20220927.234051.896-financas','2023-02-13 16:42:20','3b328a50504aa2cf509da9e713f5fa8f'),(439,2,'20220927.234054.919-financas','2023-02-13 16:42:20','cb7d5b98e445e9d228cc54714a1f168e'),(440,2,'20220927.234057.948-financas','2023-02-13 16:42:20','88b009decba951097bbbda4e0e7c0025'),(441,2,'20220927.234100.982-financas','2023-02-13 16:42:20','7916260c5f9be1e7ccfe6ec0f6694c54'),(442,2,'20220927.234104.009-financas','2023-02-13 16:42:20','16b626d86beff4684c2efa20ba6388d1'),(443,2,'20220927.234107.042-financas','2023-02-13 16:42:20','0c312d897520e34862259aeb49213f4c'),(444,2,'20220927.234110.074-financas','2023-02-13 16:42:20','a47bcad89fe1cec4ba0d1175f26a2f81'),(445,2,'20220927.234113.111-financas','2023-02-13 16:42:20','27d0731e36bc8641ac2bbe318cc41ade'),(446,2,'20220927.234116.143-financas','2023-02-13 16:42:20','22d3e5ac7d13c1727a19a9ccc91d5788'),(447,2,'20220927.234119.177-financas','2023-02-13 16:42:20','e3f12422ae9330177ddc86d57da4443b'),(448,2,'20220927.234122.223-financas','2023-02-13 16:42:20','d05d5ba8ce30f70c129bb5eae6ff869b'),(449,2,'20220927.234125.250-financas','2023-02-13 16:42:20','944763000f6ff0805889b8633b5aa5f5'),(450,2,'20220927.234128.279-financas','2023-02-13 16:42:20','4341f394cf1d95d909613f59d03352ef'),(451,2,'20220927.234131.309-financas','2023-02-13 16:42:20','9ef992e6e2f24ade3fda3b43fd33ac76'),(452,2,'20220927.234134.344-financas','2023-02-13 16:42:20','294cf17693619d34bf0c409cef9e8e86'),(453,2,'20220927.234137.383-financas','2023-02-13 16:42:20','b66c11d8454d6b72f007d4c8d68a157d'),(454,2,'20220927.234140.415-financas','2023-02-13 16:42:20','e29c94fac6ec1c07f1543fe9e2e5d1ac'),(455,2,'20220927.234143.438-financas','2023-02-13 16:42:20','3d11d986f4dfe1ef98b8ece057829e02'),(456,2,'20220927.234146.463-financas','2023-02-13 16:42:20','1c599d566f6bd96b5756619699a44a24'),(457,2,'20220927.234149.499-financas','2023-02-13 16:42:20','671f61e5820c9148149416ac5a57fed7'),(458,2,'20220927.234152.529-financas','2023-02-13 16:42:20','0bd4cd54a46867523c26f09a56fb7eea'),(459,2,'20220927.234155.560-financas','2023-02-13 16:42:20','5a88f22a0bfb825a27f0f66bcf64ec6c'),(460,2,'20220927.234158.602-financas','2023-02-13 16:42:20','96a0b047f2adbd4e6412c90eea8b8243'),(461,2,'20220927.234201.632-financas','2023-02-13 16:42:20','96b914e4159b9746258ac1b5732e8539'),(462,2,'20220927.234204.659-financas','2023-02-13 16:42:20','4aae1562140990421a7697cf320aed37'),(463,2,'20220927.234207.685-financas','2023-02-13 16:42:20','4c64ff1c1892bff54bee7701c2674e89'),(464,2,'20220927.234210.720-financas','2023-02-13 16:42:20','e98822e63eb12df230dcf54dfb5f1bde'),(465,2,'20220927.234213.750-financas','2023-02-13 16:42:20','5d9d9b1baf1433cd5b9dc6d9b5431fe1'),(466,2,'20220927.234216.790-financas','2023-02-13 16:42:20','3f64abe943cd3802f557ee3df487bca7'),(467,2,'20220927.234219.817-financas','2023-02-13 16:42:20','9714753ec2e64b6167068386a9c22b98'),(468,2,'20220927.234222.846-financas','2023-02-13 16:42:20','dcd996af93d6646a46705e0d26ea9235'),(469,2,'20220927.234225.877-financas','2023-02-13 16:42:20','71803575a0287808ecde7d43624ee850'),(470,2,'20220927.234228.905-financas','2023-02-13 16:42:20','aabf0964ae01263ebaa6274bc682bf91'),(471,2,'20220927.234231.935-financas','2023-02-13 16:42:20','699c487b7bd922220b145fcf35ff5348'),(472,2,'20220927.234234.973-financas','2023-02-13 16:42:20','bb0671b84395e14d87616b247b87a3df'),(473,2,'20220927.234237.995-financas','2023-02-13 16:42:20','d04ec8aba483e930f420f91170800d2a'),(474,2,'20220927.234241.022-financas','2023-02-13 16:42:20','88bbacb5adc9020bde1d4a6752ce6d8a'),(475,2,'20220927.234244.049-financas','2023-02-13 16:42:20','7bf2a0cf069331464f3678801169b38b'),(476,2,'20220927.234247.072-financas','2023-02-13 16:42:20','aeac84c2dac8599bf3dee32e878f0694'),(477,2,'20220927.234250.102-financas','2023-02-13 16:42:20','205aaf4bfa49ccf3d64216f2129e89c9'),(478,2,'20220927.234253.132-financas','2023-02-13 16:42:20','d8c22e856b7c035da8aba739aa9029ac'),(479,2,'20220927.234256.154-financas','2023-02-13 16:42:20','6f2fa87d1f98fc423960f5744b5b44e3'),(480,2,'20220927.234259.185-financas','2023-02-13 16:42:20','c7f588685a9a55807c526eb06dae5d13'),(481,2,'20220927.234302.226-financas','2023-02-13 16:42:20','9ac1901536593f82e6d2eefffc9dfab9'),(482,2,'20220927.234305.266-financas','2023-02-13 16:42:20','e8bcc5626c4eba3e5a0bb3d0b00fa8c7'),(483,2,'20220927.234308.285-financas','2023-02-13 16:42:20','db7f9d96ba4a7887b09f2ed858f5f419'),(484,2,'20220927.234311.309-financas','2023-02-13 16:42:20','8e11ed1f38168ff11393a4d4ff9177fd'),(485,2,'20220927.234314.346-financas','2023-02-13 16:42:20','78601958a6323760db0bd11d387ba837'),(486,2,'20220927.234317.371-financas','2023-02-13 16:42:20','7f0cc69f7b3f6d3876a438d324a14950'),(487,2,'20220927.234320.407-financas','2023-02-13 16:42:20','74db619428f9fcdb55f58ff8c79800db'),(488,2,'20220927.234323.442-financas','2023-02-13 16:42:20','cc8720514a0d3f24a49cba773ca6a17f'),(489,2,'20220927.234326.470-financas','2023-02-13 16:42:20','6a0e0d66ca22237ad9293ea60a7180dc'),(490,2,'20220927.234329.500-financas','2023-02-13 16:42:20','733438623c02f5e9f12587238886fc95'),(491,2,'20220927.234332.536-financas','2023-02-13 16:42:20','32317ab7cc1251e6cfd53363c1bb73c3'),(492,2,'20220927.234335.565-financas','2023-02-13 16:42:20','11213b82130e3384e928cd72608300e0'),(493,2,'20220927.234338.589-financas','2023-02-13 16:42:20','f4e2e368aa1cc4496ecaea9cf078dcdf'),(494,2,'20220927.234341.613-financas','2023-02-13 16:42:20','a5cdd729705c38643f58096ec6e1d3c4'),(495,2,'20220927.234344.648-financas','2023-02-13 16:42:20','8cbde15c59999a13bd84846b23c5e313'),(496,2,'20220927.234347.686-financas','2023-02-13 16:42:20','58e4f63bcbe8ebda386b5f6ebf8ce232'),(497,2,'20220927.234350.718-financas','2023-02-13 16:42:20','2083ad825e956b1b417d5b159e5a829e'),(498,2,'20220927.234353.754-financas','2023-02-13 16:42:20','5ed148db9b20af36900f6c9980c0d3fb'),(499,2,'20220927.234356.786-financas','2023-02-13 16:42:20','6d51b4f530051b0ca6065759c298d1f7'),(500,2,'20220927.234359.815-financas','2023-02-13 16:42:20','74158b45bbbd08130aac0c6df0c0a494'),(501,2,'20220927.234402.850-financas','2023-02-13 16:42:20','a4efd619d027708fdfb22a159b1fcbbb'),(502,2,'20220927.234405.879-financas','2023-02-13 16:42:20','559fdaf80e59caa308aafcf64cb20e51'),(503,2,'20220927.234408.909-financas','2023-02-13 16:42:20','29ae7ce0d6c905e9c5325386051a5554'),(504,2,'20220927.234411.945-financas','2023-02-13 16:42:20','52813c423dc0e047f11a9a9f3aff4903'),(505,2,'20220927.234414.973-financas','2023-02-13 16:42:20','1e4797dc6d57dc2b584eda7dbaaeb586'),(506,2,'20220927.234418.005-financas','2023-02-13 16:42:20','fd5b7fc1478f72f67f4b91b9f8972656'),(507,2,'20220927.234421.033-financas','2023-02-13 16:42:20','5f37f48ae19085a81af60bde0e59b26c'),(508,2,'20220927.234424.053-financas','2023-02-13 16:42:20','1c633c2ed354dd3470c4dd325fea0c85'),(509,2,'20220927.234427.086-financas','2023-02-13 16:42:20','48e8afa6cefa8469f7e9f01476b42a6a'),(510,2,'20220927.234430.124-financas','2023-02-13 16:42:20','751bc425d29c7b30b1611ff7040477e7'),(511,2,'20220927.234433.150-financas','2023-02-13 16:42:20','47eb41d0067e2ff43067859fd21770d1'),(512,2,'20220927.234436.187-financas','2023-02-13 16:42:20','3496444f7c88c8afd9f402e5db651bb2'),(513,2,'20220927.234439.218-financas','2023-02-13 16:42:20','9788d076b93f93e0f9d91e0f44929457'),(514,2,'20220927.234442.242-financas','2023-02-13 16:42:20','8357b0028c5e55f93f9ccb0f039eb4de'),(515,2,'20220927.234445.280-financas','2023-02-13 16:42:20','d9e1284c9f211a093f89efeff2f06b7e'),(516,2,'20220927.234448.302-financas','2023-02-13 16:42:20','7c561347278431da5049c10b6f343151'),(517,2,'20220927.234451.337-financas','2023-02-13 16:42:20','fb765649ce85b36c61fb43a6960f6df4'),(518,2,'20220927.234454.363-financas','2023-02-13 16:42:20','6105883c7d540c271d60e859c2a9f74e'),(519,2,'20220927.234457.399-financas','2023-02-13 16:42:20','51663380024957105cb47dd80b6a6c83'),(520,2,'20220927.234500.428-financas','2023-02-13 16:42:20','911c4c403d113c2bba8d5a73499576a3'),(521,2,'20220927.234503.466-financas','2023-02-13 16:42:20','8d5da34a436fb2d355a14a62ccf1e921'),(522,2,'20220927.234506.492-financas','2023-02-13 16:42:20','08c404b35c6c940f999e09e0ca9360f3'),(523,2,'20220927.234509.515-financas','2023-02-13 16:42:20','f849c7dd026bcadce16c9d81d05bfe8b'),(524,2,'20220927.234512.544-financas','2023-02-13 16:42:20','ef23e29c742644ad13dae48822a8f63b'),(525,2,'20220927.234515.573-financas','2023-02-13 16:42:20','59eded4c492aa413970642ee482816a4'),(526,2,'20220927.234518.607-financas','2023-02-13 16:42:21','20015e703a56babefa5d666a3cdc77c6'),(527,2,'20220927.234521.650-financas','2023-02-13 16:42:21','ba40711eb9ad72dcb06fe246071f3ded'),(528,2,'20220927.234524.691-financas','2023-02-13 16:42:21','affa9b8420cf9694d6170d574cb869ee'),(529,2,'20220927.234527.727-financas','2023-02-13 16:42:21','60afe91b4c256fe8143d937d2983d9ff'),(530,2,'20220927.234530.755-financas','2023-02-13 16:42:21','baecc47b898c41315b0d786b4abe7888'),(531,2,'20220927.234533.783-financas','2023-02-13 16:42:21','cf22ce94dabec56d2dbb3327bcffb9ff'),(532,2,'20220927.234536.811-financas','2023-02-13 16:42:21','ec9ad52b3bef43b02c6d4386fa482f2a'),(533,2,'20220927.234539.840-financas','2023-02-13 16:42:21','8c1d6d209cf19c680f4a60fc306d4c43'),(534,2,'20220927.234542.875-financas','2023-02-13 16:42:21','efd035ac775e432f35543e4097538197'),(535,2,'20220927.234545.915-financas','2023-02-13 16:42:21','27f71a375ab50f1eb6e63f7f72a72e2a'),(536,2,'20220927.234548.943-financas','2023-02-13 16:42:21','0225ffe19eda56f2aa0632d5fad2c6d2'),(537,2,'20220927.234551.965-financas','2023-02-13 16:42:21','5307469c928139452f8a18b61015af5d'),(538,2,'20220927.234554.999-financas','2023-02-13 16:42:21','8b8e13e528011f4131f0a4f2973c08d5'),(539,2,'20220927.234558.033-financas','2023-02-13 16:42:21','6d2df880c6a4f355c3766a299c27d216'),(540,2,'20220927.234601.061-financas','2023-02-13 16:42:21','3a008173c95fb6b1b3791b674d0c63a8'),(541,2,'20220927.234604.087-financas','2023-02-13 16:42:21','fd18bd1fbd3f3df26e353bbea1ededeb'),(542,2,'20220927.234607.113-financas','2023-02-13 16:42:21','41c049a4bb94c4de6988fed4d1e655ea'),(543,2,'20220927.234610.142-financas','2023-02-13 16:42:21','4267e94de7d651b52be78e496131fe91'),(544,2,'20220927.234613.167-financas','2023-02-13 16:42:21','179441244fb5c7e57ed7eb09086d6437'),(545,2,'20220927.234616.199-financas','2023-02-13 16:42:21','98c6977206d869116fde9767e8a80f50'),(546,2,'20220927.234619.225-financas','2023-02-13 16:42:21','ff66b7a18d45a0d91c39955ba9b65ec4'),(547,2,'20220927.234622.260-financas','2023-02-13 16:42:21','eba339827f087d236f4b6678da7fbbd2'),(548,2,'20220927.234625.281-financas','2023-02-13 16:42:21','690766b7200faee92b07041fc907f646'),(549,2,'20220927.234628.310-financas','2023-02-13 16:42:21','ebc8a9e0ec970c678feb085839396373'),(550,2,'20220927.234631.345-financas','2023-02-13 16:42:21','353076b6d453bb491a107faa272f83b4'),(551,2,'20220927.234634.367-financas','2023-02-13 16:42:21','1d61c6f5cd9194e9e029535f9ce5e4f5'),(552,2,'20220927.234637.395-financas','2023-02-13 16:42:21','8380b41babd38bb3f8d22ef62a8ffc90'),(553,2,'20220927.234640.433-financas','2023-02-13 16:42:21','d16b64496b6a60ea05a0e7c8d98b35bd'),(554,2,'20220927.234643.466-financas','2023-02-13 16:42:21','958fcea7a7b0227a0cc56d681b0074e4'),(555,2,'20220927.234646.499-financas','2023-02-13 16:42:21','d8a62a4cd4a55382f2e255aab71f2f88'),(556,2,'20220927.234649.531-financas','2023-02-13 16:42:21','9b6b19bfd1d30220d81672582d4ec879'),(557,2,'20220927.234652.558-financas','2023-02-13 16:42:21','0177eddaa9e1aa38bd72d68f4e545bcc'),(558,2,'20220927.234655.593-financas','2023-02-13 16:42:21','d4537ff4658fc3147967071b179b00d8'),(559,2,'20220927.234658.628-financas','2023-02-13 16:42:21','dcc297e275da2c621c9eee8c6559455b'),(560,2,'20220927.234701.655-financas','2023-02-13 16:42:21','ea5d19d0376c152950dbff625857d3cf'),(561,2,'20220927.234704.694-financas','2023-02-13 16:42:21','a2a0a132f8e03f50ee8bc491fde36ed6'),(562,2,'20220927.234707.731-financas','2023-02-13 16:42:21','5b8c2f6d3467150d25eee51bea2c9a7c'),(563,2,'20220927.234710.762-financas','2023-02-13 16:42:21','6309c6126f1f6afe75d308fb82a2dde7'),(564,2,'20220927.234713.798-financas','2023-02-13 16:42:21','68dcca1a8c67c4b6b67b3bac149aa4c4'),(565,2,'20220927.234716.828-financas','2023-02-13 16:42:21','92cec710b3c4d6bb712510b262108a2f'),(566,2,'20220927.234719.859-financas','2023-02-13 16:42:21','a21319c31c185ca3eed23a0906acdfa6'),(567,2,'20220927.234722.892-financas','2023-02-13 16:42:21','c5c8d092cea99ad4bc1672a1b2b93455'),(568,2,'20220927.234725.924-financas','2023-02-13 16:42:21','b2f824ca249d6a2cd5160ae23bd98b7c'),(569,2,'20220927.234728.952-financas','2023-02-13 16:42:21','f19c2acedc72991673092a4d0be591ea'),(570,2,'20220927.234731.973-financas','2023-02-13 16:42:21','9e64d76d99fd9f31fd7160cca78d6d6a'),(571,2,'20220927.234735.011-financas','2023-02-13 16:42:21','64adba36b5ca0b3e11ed05d6c3e4fec6'),(572,2,'20220927.234738.038-financas','2023-02-13 16:42:21','8152b1a47caae36cbb5ee3b6369ea7a2'),(573,2,'20220927.234741.072-financas','2023-02-13 16:42:21','caca675b49847069b389e4e66008f51f'),(574,2,'20220927.234744.110-financas','2023-02-13 16:42:21','34c1eafea1b5daf73f3fbe55fe37db80'),(575,2,'20220927.234747.131-financas','2023-02-13 16:42:21','0a3875c07172276ffacc4d4b72f4528b'),(576,2,'20220927.234750.167-financas','2023-02-13 16:42:21','e342c4ffccf27519cada42d6d51119d5'),(577,2,'20220927.234753.206-financas','2023-02-13 16:42:21','bb7da62b9e9e049758ae1ab7f8c193a5'),(578,2,'20220927.234756.227-financas','2023-02-13 16:42:21','c364e50f58e88f08fc7201e3b02f6334'),(579,2,'20220927.234759.250-financas','2023-02-13 16:42:21','a67f02b75220963c7ea3a4fcf6d4abbb'),(580,2,'20220927.234802.280-financas','2023-02-13 16:42:21','7c02fdfb1b6c20a94daa74656d1472ce'),(581,2,'20220927.234805.310-financas','2023-02-13 16:42:21','370cd64c9b417037e6096afbc2f7af9f'),(582,2,'20220927.234808.348-financas','2023-02-13 16:42:21','f8f82b8b9c51b54f868fe75e2e79403e'),(583,2,'20220927.234811.383-financas','2023-02-13 16:42:21','a737df1b6b2c0e53f8b6492e637983de'),(584,2,'20220927.234814.409-financas','2023-02-13 16:42:21','47cc3cfb5354e0e8ea4e73cd0b70966d'),(585,2,'20220927.234817.434-financas','2023-02-13 16:42:21','db4f1c73c5e673062741840ad6eb1767'),(586,2,'20220927.234820.463-financas','2023-02-13 16:42:21','b10fd31e407c14e1cdde8caebda7dcd2'),(587,2,'20220927.234823.502-financas','2023-02-13 16:42:21','ce63e1616eb958f82ef1cb518f0cf948'),(588,2,'20220927.234826.538-financas','2023-02-13 16:42:21','bfe69aec0fec49f0275c09857cabc549'),(589,2,'20220927.234829.575-financas','2023-02-13 16:42:21','72959fba5d9b23b31934f2e29278a0d4'),(590,2,'20220927.234832.602-financas','2023-02-13 16:42:21','281fa31403d389ed81414da27de28dde'),(591,2,'20220927.234835.630-financas','2023-02-13 16:42:21','3b53880ef28de5a166ccf87a75f32222'),(592,2,'20220927.234838.660-financas','2023-02-13 16:42:21','0e860e89eb47790650370bd1507d8ca4'),(593,2,'20220927.234841.690-financas','2023-02-13 16:42:21','8dc1c61134de72810c65d4601a935c57'),(594,2,'20220927.234844.722-financas','2023-02-13 16:42:21','1bc944b1b06dc385cb39f3c34c2657f3'),(595,2,'20220927.234847.754-financas','2023-02-13 16:42:21','50a4086c4b20241699fa21ed5b9fda08'),(596,2,'20220927.234850.785-financas','2023-02-13 16:42:21','5e81c0098a6a8a7c59fcf8075b0b63ff'),(597,2,'20220927.234853.816-financas','2023-02-13 16:42:21','06c690d34ef4698b934d8865d4e29013'),(598,2,'20220927.234856.851-financas','2023-02-13 16:42:21','3b37009024614b1785d209bbf4280b61'),(599,2,'20220927.234859.884-financas','2023-02-13 16:42:21','435345af074d18f5ca9e08081e6359b6'),(600,2,'20220927.234902.915-financas','2023-02-13 16:42:21','b47ea4532ed10c67e57f23672edc97df'),(601,2,'20220927.234905.942-financas','2023-02-13 16:42:21','4256396755e7fe73e9279a9e2d2a1a66'),(602,2,'20220927.234908.972-financas','2023-02-13 16:42:21','bcefcc00fb3ad480c08e7c57b8538025'),(603,2,'20220927.234912.012-financas','2023-02-13 16:42:21','f3ab0db4669562d603246bcdebe99774'),(604,2,'20220927.234915.041-financas','2023-02-13 16:42:21','3cc63aec4dece839dd36495e527b7509'),(605,2,'20220927.234918.072-financas','2023-02-13 16:42:21','5af7a6fe088508038ce3b6c85de81404'),(606,2,'20220927.234921.102-financas','2023-02-13 16:42:21','a5d0d0aacd3364968e3cfe870e6d01e6'),(607,2,'20220927.234924.137-financas','2023-02-13 16:42:21','f276879bf307c5761f3641e4d792c753'),(608,2,'20220927.234927.161-financas','2023-02-13 16:42:21','74a6e0ce943b39851d50127b1110ab0a'),(609,2,'20220927.234930.194-financas','2023-02-13 16:42:21','9fecb1d50ff101e83af3c03e192fd02d'),(610,2,'20220927.234933.230-financas','2023-02-13 16:42:21','11ff169aa262419d18de80b986f84a40'),(611,2,'20220927.234936.271-financas','2023-02-13 16:42:21','5ef30a02248dd67ff942c97ab049c4dd'),(612,2,'20220927.234939.304-financas','2023-02-13 16:42:21','3d59a56c32be6a3c4bd012f302cb5f4c'),(613,2,'20220927.234942.345-financas','2023-02-13 16:42:21','d74de90fface1bc3acd3d977ca46c469'),(614,2,'20220927.234945.373-financas','2023-02-13 16:42:21','aa7cec9dbcc92bcaffd0dc82322e2b5f'),(615,2,'20220927.234948.402-financas','2023-02-13 16:42:21','e9408bffc88e594e0147d707409f2ca5'),(616,2,'20220927.234951.434-financas','2023-02-13 16:42:21','2bf65f59ca3897e493b5ddaa7f0b4016'),(617,2,'20220927.234954.459-financas','2023-02-13 16:42:21','f90418e92ad0fc517aa856b8649fdfdd'),(618,2,'20220927.234957.495-financas','2023-02-13 16:42:21','41989b24b2972b16d98a58daa4f59aa0'),(619,2,'20220927.235000.524-financas','2023-02-13 16:42:21','ff4f6feb4048d372a3012d824ce37630'),(620,2,'20220927.235003.563-financas','2023-02-13 16:42:21','d6dea01b954f110a71b8fe37e1c1850a'),(621,2,'20220927.235006.601-financas','2023-02-13 16:42:21','018a7b4d0d0c48e2f70e3d34cc61ec26'),(622,2,'20220927.235009.641-financas','2023-02-13 16:42:21','e86cf1efaf8a9170adc2ebb60c6a23aa'),(623,2,'20220927.235012.672-financas','2023-02-13 16:42:21','635b2ebf28b0d65ec4dbc790a6c46c2d'),(624,2,'20220927.235015.708-financas','2023-02-13 16:42:21','c02f0dfe761127af4a086331b89447cf'),(625,2,'20220927.235018.735-financas','2023-02-13 16:42:21','762855ac4cb325962727a4c8d2450fcf'),(626,2,'20220927.235021.757-financas','2023-02-13 16:42:21','62c7433e5477cb06f9c28026ecfc331d'),(627,2,'20220927.235024.793-financas','2023-02-13 16:42:21','c83a8554144ac02992c6f4228fabc98c'),(628,2,'20220927.235027.823-financas','2023-02-13 16:42:21','ab11a1b71528482a4b0a361e09cb1ddf'),(629,2,'20220927.235030.846-financas','2023-02-13 16:42:21','2048ad74f9abca2f713ae86a3a2610b4'),(630,2,'20220927.235033.878-financas','2023-02-13 16:42:21','4c58823696295549f2d3e5656682f475'),(631,2,'20220927.235036.915-financas','2023-02-13 16:42:21','e2d3513a6b9b91a245955080b508401e'),(632,2,'20220927.235039.947-financas','2023-02-13 16:42:21','8bfcbeb68718e385427b1e0699cca300'),(633,2,'20220927.235042.973-financas','2023-02-13 16:42:21','acdb51e5aba235cb81ceebf3c9b0634d'),(634,2,'20220927.235046.013-financas','2023-02-13 16:42:21','4c088027a699a7c419f301d02a9c1059'),(635,2,'20220927.235049.050-financas','2023-02-13 16:42:21','8b5451163e293ec9821b45e7d9ef74b6'),(636,2,'20220927.235052.078-financas','2023-02-13 16:42:21','9c01ac0c798e0bc7137a570ea3dac846'),(637,2,'20220927.235055.115-financas','2023-02-13 16:42:21','5c59ca20d7df15dbad359fc5bf623fca'),(638,2,'20220927.235058.144-financas','2023-02-13 16:42:21','ea308446523986220ced97d2a56c4071'),(639,2,'20220927.235101.172-financas','2023-02-13 16:42:21','398de560ad1d029fe7b3a42ec11cbce6'),(640,2,'20220927.235104.194-financas','2023-02-13 16:42:21','44ffe33b3b4da50fff22e8d0728ebd12'),(641,2,'20220927.235107.216-financas','2023-02-13 16:42:21','b40b8331114932aacf50647b9c899ba3'),(642,2,'20220927.235110.249-financas','2023-02-13 16:42:21','2189cc90d13327d5f017496a14c3bf2f'),(643,2,'20220927.235113.276-financas','2023-02-13 16:42:21','7a9e83c59fd1640ee861893ef07eaafa'),(644,2,'20220927.235116.302-financas','2023-02-13 16:42:21','59d6ffa435a0df7c880a30bd604ccb02'),(645,2,'20220927.235119.328-financas','2023-02-13 16:42:21','7b7154d26adbe561f3fa2135271f3adf'),(646,2,'20220927.235122.351-financas','2023-02-13 16:42:21','89d05b4fd0e549bd1aaea7d89108974b'),(647,2,'20220927.235125.386-financas','2023-02-13 16:42:21','5e60cdf8753c4aadf484b8c2e53132be'),(648,2,'20220927.235128.420-financas','2023-02-13 16:42:21','6547dcb07d0579b9bb20fae7cdc6cfcd'),(649,2,'20220927.235131.460-financas','2023-02-13 16:42:21','143533c194478de4dbc18f0dee59991e'),(650,2,'20220927.235134.496-financas','2023-02-13 16:42:21','a51e22225db0fa329fa3723cd0ce773c'),(651,2,'20220927.235137.532-financas','2023-02-13 16:42:21','a1e49e24c80148cfbbc4e189f31a3a31'),(652,2,'20220927.235140.567-financas','2023-02-13 16:42:21','810d64f0f20ebc28a9d72a378136a4de'),(653,2,'20220927.235143.592-financas','2023-02-13 16:42:21','90f14b44fe9ffa6c0ab40df0bd0342fd'),(654,2,'20220927.235146.623-financas','2023-02-13 16:42:21','c436e077448f2388686122538e345d1f'),(655,2,'20220927.235149.654-financas','2023-02-13 16:42:21','4308d79669a732fb1eac9aad16456649'),(656,2,'20220927.235152.687-financas','2023-02-13 16:42:21','e1d218bb802e9edae08ca998608392c5'),(657,2,'20220927.235155.719-financas','2023-02-13 16:42:21','957fc32a516439818052527a8606378a'),(658,2,'20220927.235158.761-financas','2023-02-13 16:42:21','c61e4c4e965ed1357a8ea8d79e862998'),(659,2,'20220927.235201.793-financas','2023-02-13 16:42:21','284250c73705ccc0c1703aedeb9dad8a'),(660,2,'20220927.235204.821-financas','2023-02-13 16:42:21','80c0cb6f78e97760db329ad15d615411'),(661,2,'20220927.235207.849-financas','2023-02-13 16:42:21','4dfef947950ab092db2e84035831394b'),(662,2,'20220927.235210.873-financas','2023-02-13 16:42:21','628360e4a4779bea0f186b2c481951df'),(663,2,'20220927.235213.904-financas','2023-02-13 16:42:21','e6076e0fe81732fc4e8f08e5e956184b'),(664,2,'20220927.235216.930-financas','2023-02-13 16:42:21','668a38d123c78fc0587d93c3ce95b5cd'),(665,2,'20220927.235219.962-financas','2023-02-13 16:42:21','478c597d55e61399c84c41740150a47c'),(666,2,'20220927.235223.000-financas','2023-02-13 16:42:21','65df6875d2bca4511b03b82ff563f63a'),(667,2,'20220927.235226.039-financas','2023-02-13 16:42:21','b92dbbc52b277cd15f1f41ca011c597f'),(668,2,'20220927.235229.077-financas','2023-02-13 16:42:21','701466fdf801f8bfb2884b2d6708a1cf'),(669,2,'20220927.235232.112-financas','2023-02-13 16:42:21','dc4400707516023a1f43446f73fb1806'),(670,2,'20220927.235235.148-financas','2023-02-13 16:42:21','fede5241663ddcd91727ec05e292ebcf'),(671,2,'20220927.235238.169-financas','2023-02-13 16:42:21','31e2b7443461bdaa60e535c60c3034e6'),(672,2,'20220927.235241.201-financas','2023-02-13 16:42:21','f2bf7abff0e14064dcecdd33279a9f99'),(673,2,'20220927.235244.238-financas','2023-02-13 16:42:21','2db700f4ccf3f1726583a03a2f9d7d5f'),(674,2,'20220927.235247.273-financas','2023-02-13 16:42:21','d17ce014239af91d365d662c9f139b0c'),(675,2,'20220927.235250.314-financas','2023-02-13 16:42:21','d99d0a02d8fca9bca19d2d5dfa22d443'),(676,2,'20220927.235253.354-financas','2023-02-13 16:42:21','dccd83b05ffbada531f800d4ea3db081'),(677,2,'20220927.235256.392-financas','2023-02-13 16:42:21','edbacc68747dddf92fdc2cb0c5ef4af4'),(678,2,'20220927.235259.428-financas','2023-02-13 16:42:21','1168582362f6f30984a211acce06a6d3'),(679,2,'20220927.235302.466-financas','2023-02-13 16:42:21','5db5f1eba55e446d30711efb693ee11a'),(680,2,'20220927.235305.497-financas','2023-02-13 16:42:21','6d400ac77714d06404b5f24566350dae'),(681,2,'20220927.235308.533-financas','2023-02-13 16:42:21','5af85a207d70452027ad7f6ff130e046'),(682,2,'20220927.235311.562-financas','2023-02-13 16:42:21','4c604b89c1acfc6452eafd3fcf3b7d47'),(683,2,'20220927.235314.587-financas','2023-02-13 16:42:21','a051a7a2c73a143b96be0cda627bda7c'),(684,2,'20220927.235317.617-financas','2023-02-13 16:42:21','37a0315f0a005b981bb02f4b0a9e4d29'),(685,2,'20220927.235320.649-financas','2023-02-13 16:42:21','6d4392c5ba1e2145fab50fd9f558a262'),(686,2,'20220927.235323.682-financas','2023-02-13 16:42:21','c10c21845a9b4417e31b3be41703cccf'),(687,2,'20220927.235326.705-financas','2023-02-13 16:42:21','6b4d94ff7e209ea31302e23ec1a18f60'),(688,2,'20220927.235329.737-financas','2023-02-13 16:42:21','64fab0c9d262ee1464e9b0dcac2161aa'),(689,2,'20220927.235332.770-financas','2023-02-13 16:42:21','5b25bbb65a4891d33c4e01fabe70702b'),(690,2,'20220927.235335.808-financas','2023-02-13 16:42:21','59f01766eae7908719f461b74bbe7b41'),(691,2,'20220927.235338.835-financas','2023-02-13 16:42:21','64b9007505cf8f751bf8279ae909fd31'),(692,2,'20220927.235341.861-financas','2023-02-13 16:42:21','f3d1835862ea5748008e65313d8b6ef4'),(693,2,'20220927.235344.896-financas','2023-02-13 16:42:21','eae3a4a526f8493e781a0bcf2aa93285'),(694,2,'20220927.235347.928-financas','2023-02-13 16:42:21','6acfa0f322cb084f5b88af1aa94a0abb'),(695,2,'20220927.235350.958-financas','2023-02-13 16:42:21','2e93a04e0de8cd2992864fffa7961402'),(696,2,'20220927.235353.995-financas','2023-02-13 16:42:21','5210e151ad7291ee88f3552b84c35f8a'),(697,2,'20220927.235357.023-financas','2023-02-13 16:42:21','5f97d470017cc600b37a586db5dba3b3'),(698,2,'20220927.235400.059-financas','2023-02-13 16:42:21','341c7b5702ebce1c3e1183a52c29a66f'),(699,2,'20220927.235403.084-financas','2023-02-13 16:42:21','70f3b9f17e16622ff0386070cf60e857'),(700,2,'20220927.235406.119-financas','2023-02-13 16:42:21','36832dd8803a1c2deff9d0bf946120f0'),(701,2,'20220927.235409.151-financas','2023-02-13 16:42:21','9e9c031453bd79ef7a4d165d007cbf6a'),(702,2,'20220927.235412.174-financas','2023-02-13 16:42:21','f5396b2dde78c206b245ff06896c46f3'),(703,2,'20220927.235415.207-financas','2023-02-13 16:42:21','0f23d0d6647440785bc00bd1033bf112'),(704,2,'20220927.235418.237-financas','2023-02-13 16:42:21','c964a4923755507ceb714e7429c36780'),(705,2,'20220927.235421.275-financas','2023-02-13 16:42:21','8df2d45143fecd17da96341813fa2d46'),(706,2,'20220927.235424.300-financas','2023-02-13 16:42:21','cfd38c7b4c360d5343bcbf15c8450c02'),(707,2,'20220927.235427.335-financas','2023-02-13 16:42:21','bcbbd975d03dd1a0cf7580c7998eebb8'),(708,2,'20220927.235430.368-financas','2023-02-13 16:42:21','6507d16d03b93f453eca07cf3e0335fe'),(709,2,'20220927.235433.407-financas','2023-02-13 16:42:21','c975373d961804e09e2484e75d6a40c5'),(710,2,'20220927.235436.447-financas','2023-02-13 16:42:21','3040a39333b7380a7a9d59866a0ff3c9'),(711,2,'20220927.235439.474-financas','2023-02-13 16:42:21','8844fac81d152200f10c5ea6122a9c8c'),(712,2,'20220927.235442.510-financas','2023-02-13 16:42:21','371205e4a01a325698ffb7059043582c'),(713,2,'20220927.235445.534-financas','2023-02-13 16:42:21','845dfdbf45aa3a3814d70db4997cbe8f'),(714,2,'20220927.235448.567-financas','2023-02-13 16:42:21','9b33152bddd666442cc382791e71f96f'),(715,2,'20220927.235451.600-financas','2023-02-13 16:42:21','d2a7e3f37114dac9631c4c2de769d0e2'),(716,2,'20220927.235454.638-financas','2023-02-13 16:42:21','30bdc17f329fc83f6a8c918377cc3fca'),(717,2,'20220927.235457.667-financas','2023-02-13 16:42:21','d3e5dd43bf17b45a0606b832d6288989'),(718,2,'20220927.235500.697-financas','2023-02-13 16:42:21','9f327fb4aa5eb3fc3f2f22189134b01c'),(719,2,'20220927.235503.731-financas','2023-02-13 16:42:21','1c054a841c00bca4a01edaed9b929743'),(720,2,'20220927.235506.752-financas','2023-02-13 16:42:21','4e4deb19220306403521d93e8246444d'),(721,2,'20220927.235509.782-financas','2023-02-13 16:42:21','8e5bd08d771be0de0871fbe737495e5c'),(722,2,'20220927.235512.810-financas','2023-02-13 16:42:21','a6e1b94350154fdc71b9ccc48b481b34'),(723,2,'20220927.235515.845-financas','2023-02-13 16:42:21','b01335e2133e92da159dc35189ac6a16'),(724,2,'20220927.235518.879-financas','2023-02-13 16:42:21','9dc81ae5e6fcc3b1651acc54c1a04a44'),(725,2,'20220927.235521.906-financas','2023-02-13 16:42:21','3c5f6181a3b02abb9cb717e5f75d5d73'),(726,2,'20220927.235524.939-financas','2023-02-13 16:42:21','86533538875629a59ebb2b78f06d9c4d'),(727,2,'20220927.235527.970-financas','2023-02-13 16:42:21','bb701311edff9eddbc8dcdc2b2e35948'),(728,2,'20220927.235531.000-financas','2023-02-13 16:42:21','8088e8e3423573d86457e97004e27b11'),(729,2,'20220927.235534.023-financas','2023-02-13 16:42:21','5c692964f254bff3728aba52e7323ee0'),(730,2,'20220927.235537.052-financas','2023-02-13 16:42:21','dda659229fe2d966792676a5f9e4d5a6'),(731,2,'20220927.235540.086-financas','2023-02-13 16:42:21','9c4bf07c5e66727ad77dce3d8b8bb59f'),(732,2,'20220927.235543.124-financas','2023-02-13 16:42:21','72987362b6208585ece36400c6f27ee0'),(733,2,'20220927.235546.152-financas','2023-02-13 16:42:21','887d05e88fc39e14305aafabbbcbb785'),(734,2,'20220927.235549.180-financas','2023-02-13 16:42:21','58da4b43ffe3385103837f2934113181'),(735,2,'20220927.235552.219-financas','2023-02-13 16:42:21','a9d0f917150100d545214141e6ec5073'),(736,2,'20220927.235555.246-financas','2023-02-13 16:42:21','65c7cdcaf2b773327242e514a2f842d7'),(737,2,'20220927.235558.272-financas','2023-02-13 16:42:21','afae79369e5c42cc3542e381a6339fea'),(738,2,'20220927.235601.302-financas','2023-02-13 16:42:21','97487a34d7040af958111cdd18948249'),(739,2,'20220927.235604.335-financas','2023-02-13 16:42:21','3a3e5ea2cf70434ac66583c783d721bd'),(740,2,'20220927.235607.359-financas','2023-02-13 16:42:21','cd3c36b8086335aba3f34023349de9e4'),(741,2,'20220927.235610.382-financas','2023-02-13 16:42:21','5829f8c554ce17b4e711372158c096f3'),(742,2,'20220927.235613.417-financas','2023-02-13 16:42:21','3ec786662ef688e9ab7146122593f3e0'),(743,2,'20220927.235616.438-financas','2023-02-13 16:42:21','c898ac48507317d8c4d7e46a8c6ce5f0'),(744,2,'20220927.235619.469-financas','2023-02-13 16:42:21','3fc62190e7e0dd26d9f09a49b014ed69'),(745,2,'20220927.235622.494-financas','2023-02-13 16:42:21','9ad5ef5d5cd0a608b4b16635d2c15315'),(746,2,'20220927.235625.524-financas','2023-02-13 16:42:21','3c82f9d6ebbe4fcd912213c150da04d3'),(747,2,'20220927.235628.559-financas','2023-02-13 16:42:21','1e40e1ba5e296a73506dbbfdd34b8590'),(748,2,'20220927.235631.600-financas','2023-02-13 16:42:21','ffbd69e3c3b5932f1ca7a4198a86102e'),(749,2,'20220927.235634.627-financas','2023-02-13 16:42:21','7ce61c8b4e12cb7ad294a048f88903d4'),(750,2,'20220927.235637.664-financas','2023-02-13 16:42:21','5ca171a4b5fd0ac6a9505b06672626f2'),(751,2,'20220927.235640.695-financas','2023-02-13 16:42:21','d34d7ee0bb19021eda772d174d473816'),(752,2,'20220927.235643.725-financas','2023-02-13 16:42:21','a8eb9e486a9b81f257a794e242e8f8f8'),(753,2,'20220927.235646.750-financas','2023-02-13 16:42:21','2ace91b28c948f8adbb92e62cab500f6'),(754,2,'20220927.235649.785-financas','2023-02-13 16:42:21','0bd024324ff9e351ccd6ff5381ae1fdc'),(755,2,'20220927.235652.818-financas','2023-02-13 16:42:21','01e3bec6976af4c0d5e8e78626f04547'),(756,2,'20220927.235655.851-financas','2023-02-13 16:42:21','b828ae8627e9e1d350e200f3a9969a6e'),(757,2,'20220927.235658.889-financas','2023-02-13 16:42:21','c27e86aefe5591a77caa6afadc999874'),(758,2,'20220927.235701.929-financas','2023-02-13 16:42:21','3cba4167eacb406bc66e5273365dd1d5'),(759,2,'20220927.235704.953-financas','2023-02-13 16:42:21','8f04ff6611974591656270faa5ee517e'),(760,2,'20220927.235707.975-financas','2023-02-13 16:42:21','33ec7cdfa2a1b649ffbe2561ffdddf83'),(761,2,'20220927.235711.002-financas','2023-02-13 16:42:21','8f426e23f15a6cd2bd2736a986b1654c'),(762,2,'20220927.235714.052-financas','2023-02-13 16:42:21','3d371d777caad5594acf1bebe709e0e9'),(763,2,'20220927.235717.084-financas','2023-02-13 16:42:21','3f0f62e3464f8c14d2d2ffc085b20eaf'),(764,2,'20220927.235720.105-financas','2023-02-13 16:42:21','4637f7d59a901d2edc2d61912f219594'),(765,2,'20220927.235723.141-financas','2023-02-13 16:42:21','4d36bd68c328fc52889ba3e815193e76'),(766,2,'20220927.235726.169-financas','2023-02-13 16:42:21','8baf6b6bef6880a2ef535b91217e8278'),(767,2,'20220927.235729.202-financas','2023-02-13 16:42:21','6d1f697ddd253b8df173cbb30adc5e0b'),(768,2,'20220927.235732.236-financas','2023-02-13 16:42:21','40214fe20569793509961aeb9b817e31'),(769,2,'20220927.235735.268-financas','2023-02-13 16:42:21','833f9dbb7e6986cff6342942135378ae'),(770,2,'20220927.235738.302-financas','2023-02-13 16:42:21','670ab53787f8ba77fcb5e63e61931f12'),(771,2,'20220927.235741.334-financas','2023-02-13 16:42:21','c46c132924291e9b5c924d32c5716ca3'),(772,2,'20220927.235744.369-financas','2023-02-13 16:42:21','aa0da56d09b3c458eb1dabc11ebe80de'),(773,2,'20220927.235747.398-financas','2023-02-13 16:42:21','8b2ef8557407998e046a23506b53fa1b'),(774,2,'20220927.235750.435-financas','2023-02-13 16:42:21','b02d7b628766d08f6d38eb7fa8876833'),(775,2,'20220927.235753.476-financas','2023-02-13 16:42:21','aba82aadc60f910660520b6e7d641933'),(776,2,'20220927.235756.506-financas','2023-02-13 16:42:21','d5790f73781b98229a72730b3df9fb7b'),(777,2,'20220927.235759.543-financas','2023-02-13 16:42:21','7e831d9d848255f503f693fa29b4a33b'),(778,2,'20220927.235802.580-financas','2023-02-13 16:42:21','c4851e57143452b75d1fdbcd82147dc4'),(779,2,'20220927.235805.609-financas','2023-02-13 16:42:21','31c319c2b1662b94670a48ca1a686fcb'),(780,2,'20220927.235808.641-financas','2023-02-13 16:42:21','f9dd58a5fe94fddba66392752b9c7cff'),(781,2,'20220927.235811.673-financas','2023-02-13 16:42:21','db4dccca4da15ce6579d204eef7102b8'),(782,2,'20220927.235814.705-financas','2023-02-13 16:42:21','b2d2501ba09cf1915438d63e0bb074f0'),(783,2,'20220927.235817.734-financas','2023-02-13 16:42:21','83ea6ff8935b6d1d539b71cfefa1f400'),(784,2,'20220927.235820.769-financas','2023-02-13 16:42:21','64dcbe4075aa2d4267c6ebd643f134a5'),(785,2,'20220927.235823.807-financas','2023-02-13 16:42:21','abf73e7525906358b01c9ddf82d9df0f'),(786,2,'20220927.235826.843-financas','2023-02-13 16:42:21','86fdb1595f8886fb7dc1f9f07cc3fc64'),(787,2,'20220927.235829.876-financas','2023-02-13 16:42:21','17ab79a99bdeeee26e6eb93621ddfc4a'),(788,2,'20220927.235832.900-financas','2023-02-13 16:42:21','e695f47e65d6e2398d749f17004658de'),(789,2,'20220927.235835.926-financas','2023-02-13 16:42:21','cf3da8b1cf57eec769a0f77da39e5ffe'),(790,2,'20220927.235838.957-financas','2023-02-13 16:42:21','9c420b04251368cdcade198fd859f308'),(791,2,'20220927.235841.991-financas','2023-02-13 16:42:21','c1d99b88220a8de3e7b1f88ccf3bb923'),(792,2,'20220927.235845.017-financas','2023-02-13 16:42:21','63eef4bb97ad6879efe53720bdf4a813'),(793,2,'20220927.235848.044-financas','2023-02-13 16:42:21','82269abe7f151e0862f823e8d1ea8a13'),(794,2,'20220927.235851.083-financas','2023-02-13 16:42:21','8fae6d0999867d241b1aeb80fecf2eff'),(795,2,'20220927.235854.111-financas','2023-02-13 16:42:21','7f895452e2f9e1f0a4865a1724538078'),(796,2,'20220927.235857.136-financas','2023-02-13 16:42:21','5d479b7e88a6085435ceb13e8e3bbe36'),(797,2,'20220927.235900.162-financas','2023-02-13 16:42:21','e159f6ad4319decefce90f94402baee8'),(798,2,'20220927.235903.197-financas','2023-02-13 16:42:21','79441d44b5030fc13ff9eb6b79fe31e1'),(799,2,'20220927.235906.224-financas','2023-02-13 16:42:21','1150348a6c57d4f5a0bfd6f47118ca15'),(800,2,'20220927.235909.255-financas','2023-02-13 16:42:21','1477479d1516400afb9b282a854d3684'),(801,2,'20220927.235912.287-financas','2023-02-13 16:42:21','b5808fde568153a4c8b89e0a46517ba8'),(802,2,'20220927.235915.315-financas','2023-02-13 16:42:21','5befb6d1717bda6bd3c75d80aa2e4f3b'),(803,2,'20220927.235918.338-financas','2023-02-13 16:42:21','8258a85f143840d1d5c7a92355014ab6'),(804,2,'20220927.235921.371-financas','2023-02-13 16:42:21','d8f79e877a4430757a7da2ab99755bc4'),(805,2,'20220927.235924.407-financas','2023-02-13 16:42:21','81e2aa30923d961c3558612f87d09473'),(806,2,'20220927.235927.435-financas','2023-02-13 16:42:21','21e6fb9f9f92717ac4b63287aa12f7bd'),(807,2,'20220927.235930.460-financas','2023-02-13 16:42:21','30b82e5c15e9e9ea7abd8d569a445729'),(808,2,'20220927.235933.488-financas','2023-02-13 16:42:21','abc6c601da46400b3bf4fd6bd2933328'),(809,2,'20220927.235936.518-financas','2023-02-13 16:42:21','c0c4000e7841c575483f8e6333e3a6c3'),(810,2,'20220927.235939.552-financas','2023-02-13 16:42:21','8e89614a38291e5800e024bdcee00fde'),(811,2,'20220927.235942.589-financas','2023-02-13 16:42:21','0b9b0a8692567f101553a85cfd06158e'),(812,2,'20220927.235945.621-financas','2023-02-13 16:42:21','93646e67047a9fbff8afa012964e9955'),(813,2,'20220927.235948.650-financas','2023-02-13 16:42:21','2f0e42294408b9150f1973b84a3f5a24'),(814,2,'20220927.235951.682-financas','2023-02-13 16:42:21','f7b4cb9e4cb7fe0de00630e61b192eef'),(815,2,'20220927.235954.711-financas','2023-02-13 16:42:21','bef9fce313e111b57888774bc6f50f02'),(816,2,'20220927.235957.739-financas','2023-02-13 16:42:21','ec2b9772de53eb04218d625d820274f3'),(817,2,'20220928.000000.777-financas','2023-02-13 16:42:21','c9b621799702f2694e2cc09de416f071'),(818,2,'20220928.000003.802-financas','2023-02-13 16:42:21','7dab62c389438c15f7a9d5496d87b519'),(819,2,'20220928.000006.822-financas','2023-02-13 16:42:21','20a7873b4274c4a395e6c7f4c73bd80d'),(820,2,'20220928.000009.863-financas','2023-02-13 16:42:21','009f61bcf7822c4aa910c8c649171366'),(821,2,'20220928.000012.903-financas','2023-02-13 16:42:21','1cfeea2a6787b22e69da4eb6513351d5'),(822,2,'20220928.000015.943-financas','2023-02-13 16:42:21','126a7735838724f0bb2b2b377996247e'),(823,2,'20220928.000018.981-financas','2023-02-13 16:42:21','534be60611ed6fc0c90eb9be8a408b8b'),(824,2,'20220928.000022.009-financas','2023-02-13 16:42:21','aae1e6b032a0ea243f442b938a1c0c3a'),(825,2,'20220928.000025.041-financas','2023-02-13 16:42:21','475b91db19795d08ed433a3f1da18c11'),(826,2,'20220928.000028.081-financas','2023-02-13 16:42:21','e9533add2c01ef6386a9b291b40528cb'),(827,2,'20220928.000031.113-financas','2023-02-13 16:42:21','d6d14343f1a236eb0a3a1bb53ec49b87'),(828,2,'20220928.000034.142-financas','2023-02-13 16:42:21','34bdeef3f0c68e80134968a51c0ecac6'),(829,2,'20220928.000037.169-financas','2023-02-13 16:42:21','a43e1c515d65952c3a43d760d54e4dff'),(830,2,'20220928.000040.202-financas','2023-02-13 16:42:21','d037b99455f8a2bba8fcde266473604e'),(831,2,'20220928.000043.228-financas','2023-02-13 16:42:21','0701f481bc971794f89dd5bfd83a1b43'),(832,2,'20220928.000046.263-financas','2023-02-13 16:42:21','ce1c364cff7a5ecceed73bb13dcc4623'),(833,2,'20220928.000049.305-financas','2023-02-13 16:42:21','bd54f5760d4848f304f1952fbeb83585'),(834,2,'20220928.000052.334-financas','2023-02-13 16:42:21','58b32bf85457925eb8d43f3ced3bdc5d'),(835,2,'20220928.000055.360-financas','2023-02-13 16:42:21','055f3b1c08e15324e7ff19242f31f0f6'),(836,2,'20220928.000058.393-financas','2023-02-13 16:42:21','8c09bd377a00036e8f499bce96a6dcfd'),(837,2,'20220928.000101.432-financas','2023-02-13 16:42:21','ecbabd94344949baf687ba59c6f6f5ac'),(838,2,'20220928.000104.459-financas','2023-02-13 16:42:21','859d6a0df58ffdf070e89c14acd5a8b5'),(839,2,'20220928.000107.487-financas','2023-02-13 16:42:21','03cf47f9fce060b6c14ba485193cd004'),(840,2,'20220928.000110.527-financas','2023-02-13 16:42:21','b7809e904b4463721a3f3d2a570df3ef'),(841,2,'20220928.000113.561-financas','2023-02-13 16:42:21','c9236375438ba95b1a47f632fb41c27c'),(842,2,'20220928.000116.585-financas','2023-02-13 16:42:21','7adf87d1d7cb6d4190458559f6c934d2'),(843,2,'20220928.000119.618-financas','2023-02-13 16:42:21','0b147705777364af58c21d8856767be2'),(844,2,'20220928.000122.659-financas','2023-02-13 16:42:21','a6cba9a81cbed642e44cef7a689f6bad'),(845,2,'20220928.000125.688-financas','2023-02-13 16:42:21','c54aec4419cc882ed0bf87ac4933121e'),(846,2,'20220928.000128.722-financas','2023-02-13 16:42:21','d806b3b58b100e29e13d589cda69e27a'),(847,2,'20220928.000131.753-financas','2023-02-13 16:42:21','c470aa37cf14c3fc7d96e8f2977b7ff0'),(848,2,'20220928.000134.781-financas','2023-02-13 16:42:21','c6a4ceb6a1fd4aab3eb3e43b4a66d2d5'),(849,2,'20220928.000137.820-financas','2023-02-13 16:42:21','7870ebe73addb733f2badf5c4131ab84'),(850,2,'20220928.000140.842-financas','2023-02-13 16:42:21','2a8ec2d2cff5fa11b7de02c700a6ec6a'),(851,2,'20220928.000143.871-financas','2023-02-13 16:42:21','be1ae7d021bca8a22452451b04bcaaa7'),(852,2,'20220928.000146.906-financas','2023-02-13 16:42:21','30a92bea0c6ab835e7e0bea22ac06c10'),(853,2,'20220928.000149.934-financas','2023-02-13 16:42:21','cea25387267da578fa3501b6830242c0'),(854,2,'20220928.000152.956-financas','2023-02-13 16:42:21','87aeb44ad2e4b6b725fa080e9c8b2803'),(855,2,'20220928.000155.994-financas','2023-02-13 16:42:21','d2b2614ab20587bdc95e7a04f27fc0a8'),(856,2,'20220928.000159.026-financas','2023-02-13 16:42:21','5dd35b3ce41d1051f8eece6d53ae2fc1'),(857,2,'20220928.000202.058-financas','2023-02-13 16:42:21','ac5555eea048ecbe55e3851e84d61d09'),(858,2,'20220928.000205.078-financas','2023-02-13 16:42:21','1cf3701bb1441212616141ee8072d98f'),(859,2,'20220928.000208.110-financas','2023-02-13 16:42:21','bc69e34c9a6cb60727f1ab84558e6845'),(860,2,'20220928.000211.138-financas','2023-02-13 16:42:21','fbdd44d85492d434cdafb49cc964f558'),(861,2,'20220928.000214.166-financas','2023-02-13 16:42:21','ac097ed741d42c9ffe8ade0810cd05fd'),(862,2,'20220928.000217.206-financas','2023-02-13 16:42:21','c949175911728ef8bcc7de20d5836a95'),(863,2,'20220928.000220.226-financas','2023-02-13 16:42:21','52c042266af7e985294472ec9bfb3210'),(864,2,'20220928.000223.258-financas','2023-02-13 16:42:21','79095760f1bea593dce2aec51c33066a'),(865,2,'20220928.000226.295-financas','2023-02-13 16:42:21','dc2d40304dcbbd9190535dc288633f3f'),(866,2,'20220928.000229.320-financas','2023-02-13 16:42:21','0cf37db86de637d4f98970545174ce40'),(867,2,'20220928.000232.351-financas','2023-02-13 16:42:21','f1dd8911f25003078cee8d2dd5bfdd10'),(868,2,'20220928.000235.389-financas','2023-02-13 16:42:21','8f4721918dc1a4cbaa1305f4f0e0bd7d'),(869,2,'20220928.000238.415-financas','2023-02-13 16:42:21','10952ab96d6e2282af82e250e0263e34'),(870,2,'20220928.000241.445-financas','2023-02-13 16:42:21','f859636f757ff51643400b0a06da04c7'),(871,2,'20220928.000244.477-financas','2023-02-13 16:42:21','f9f14c437f56e7229bb2699dd07400b1'),(872,2,'20220928.000247.501-financas','2023-02-13 16:42:21','b27a48113a16fa4174aa68495c8eb6b5'),(873,2,'20220928.000250.533-financas','2023-02-13 16:42:21','8168a2459df477925a3677ca295441f3'),(874,2,'20220928.000253.562-financas','2023-02-13 16:42:21','086a715dcf7069a4db09390e6c7eb1b8'),(875,2,'20220928.000256.601-financas','2023-02-13 16:42:21','9623689549b6857712f980c44343d886'),(876,2,'20220928.000259.628-financas','2023-02-13 16:42:21','cf7bd6c116b865766f074a8115820725'),(877,2,'20220928.000302.658-financas','2023-02-13 16:42:21','ebb8a5e9ffd981673e97de59571b4363'),(878,2,'20220928.000305.684-financas','2023-02-13 16:42:21','3a5df7ec7212a120b7a62aaa9c4611c1'),(879,2,'20220928.000308.714-financas','2023-02-13 16:42:21','b138663188b50315abed55359f43ff90'),(880,2,'20220928.000311.741-financas','2023-02-13 16:42:21','709ab4facdc1984071fb27643d2439cd'),(881,2,'20220928.000314.771-financas','2023-02-13 16:42:21','02444d41eca2d66ed054ed7f9ffce8b1'),(882,2,'20220928.000317.799-financas','2023-02-13 16:42:21','7cc70cb860ddbcb4b9e8984087800f18'),(883,2,'20220928.000320.836-financas','2023-02-13 16:42:21','cb8289376f62c876e8e46ee071c272b6'),(884,2,'20220928.000323.866-financas','2023-02-13 16:42:21','49db5ea117090a21add2c19a578655cc'),(885,2,'20220928.000326.888-financas','2023-02-13 16:42:21','fe9bd6c13561532e9f2134f9c74bc7f5'),(886,2,'20220928.000329.925-financas','2023-02-13 16:42:21','2f4fb790ba04aad451dfc663f7671996'),(887,2,'20220928.000332.967-financas','2023-02-13 16:42:21','7f227ba5be1c0128b282bdd32ede1c8c'),(888,2,'20220928.000335.991-financas','2023-02-13 16:42:21','c2d995f2c23b2262af56399667a32096'),(889,2,'20220928.000339.022-financas','2023-02-13 16:42:21','4fd9641296119cb933799e2034e459f2'),(890,2,'20220928.000342.050-financas','2023-02-13 16:42:21','dbb4abd49a0188ee0530340000f6d078'),(891,2,'20220928.000345.072-financas','2023-02-13 16:42:21','806026485fad92c1233616201ce5d194'),(892,2,'20220928.000348.111-financas','2023-02-13 16:42:21','1a5f22347695f8a7ab6ad6a65e3eb1c2'),(893,2,'20220928.000351.138-financas','2023-02-13 16:42:21','04b430fcb856c91ede2a70f62869f7d0'),(894,2,'20220928.000354.170-financas','2023-02-13 16:42:21','51992e114bcab2ce19fdb7a89b806f6b'),(895,2,'20220928.000357.198-financas','2023-02-13 16:42:21','3d9c7c18a6081e2600d50fb121be2ea5'),(896,2,'20220928.000400.229-financas','2023-02-13 16:42:21','7d85685d1d9e8eaff3827d8648da51a8'),(897,2,'20220928.000403.254-financas','2023-02-13 16:42:21','c292b997344bdc86faf9df4d48c6ffd8'),(898,2,'20220928.000406.288-financas','2023-02-13 16:42:21','2f7fb8d37f510d2193a4cad1cfb85111'),(899,2,'20220928.000409.316-financas','2023-02-13 16:42:21','7b8b625bdf3afd5289f69b1ffd80dd4c'),(900,2,'20220928.000412.356-financas','2023-02-13 16:42:21','9b10ead6dd73cea2788c26356a5e254e'),(901,2,'20220928.000415.390-financas','2023-02-13 16:42:21','0c3011f8de56f8daf9a520cc5079d618'),(902,2,'20220928.000418.428-financas','2023-02-13 16:42:21','00992b0a893aabbf3d22afb9e7a197d6'),(903,2,'20220928.000421.451-financas','2023-02-13 16:42:21','6fb16f70f2d419d830e8ea38dd2b9396'),(904,2,'20220928.000424.491-financas','2023-02-13 16:42:21','5b3affc472b0655e13eb31da4bf1acae'),(905,2,'20220928.000427.532-financas','2023-02-13 16:42:21','dea6e01fcda832f06d80050842fea8dd'),(906,2,'20220928.000430.557-financas','2023-02-13 16:42:21','f31a09a3f62c3eb13276da36a2844151'),(907,2,'20220928.000433.586-financas','2023-02-13 16:42:21','e410e4ef9544458c93046526947e0624'),(908,2,'20220928.000436.627-financas','2023-02-13 16:42:21','12229287128c339583e455930819b5a9'),(909,2,'20220928.000439.659-financas','2023-02-13 16:42:21','9ce3c52a1a84489b715db6bfc7f83744'),(910,2,'20220928.000442.697-financas','2023-02-13 16:42:21','721a580efb579bd13e633c3cf0bf4f84'),(911,2,'20220928.000445.727-financas','2023-02-13 16:42:21','6192934d39221613b5962d501e0ab102'),(912,2,'20220928.000448.754-financas','2023-02-13 16:42:21','73332cf447631769579c33435aba30be'),(913,2,'20220928.000451.790-financas','2023-02-13 16:42:21','293be17daa578fb8a2353ee6137ffdc4'),(914,2,'20220928.000454.830-financas','2023-02-13 16:42:21','b398c164ff196db3ba00e8afc93f87bb'),(915,2,'20220928.000457.858-financas','2023-02-13 16:42:21','053583a83ca9e41ebec129dba39fa6ec'),(916,2,'20220928.000500.883-financas','2023-02-13 16:42:21','5b7a15acb06d60c891b748836f4a6dba'),(917,2,'20220928.000503.923-financas','2023-02-13 16:42:21','1544277f9f8d1e332e04aca76b389371'),(918,2,'20220928.000506.955-financas','2023-02-13 16:42:21','21870ff8ba32aa33df4a27fc05acdf9d'),(919,2,'20220928.000509.991-financas','2023-02-13 16:42:21','8c451b760ed8591730897b673b253eb2'),(920,2,'20220928.000513.015-financas','2023-02-13 16:42:21','f8b6f2fcd9b01d1a4d74fa605f159a1b'),(921,2,'20220928.000516.050-financas','2023-02-13 16:42:21','b38319c0f669a95b13884aca8ea45294'),(922,2,'20220928.000519.083-financas','2023-02-13 16:42:21','3778c3ff101a04c9a5f9df58c35ce209'),(923,2,'20220928.000522.115-financas','2023-02-13 16:42:21','bad58acb5d7826499323bcb8e61fc45a'),(924,2,'20220928.000525.156-financas','2023-02-13 16:42:21','e77e0297f34c535792cbf040583cb0df'),(925,2,'20220928.000528.187-financas','2023-02-13 16:42:21','13e7e96a625dc150a5590d92069a7a9b'),(926,2,'20220928.000531.223-financas','2023-02-13 16:42:21','3129c28ae9d36f561616bf7ea826f1a9'),(927,2,'20220928.000534.253-financas','2023-02-13 16:42:21','d4bcce4e02a4f4cbbd19762beef44f8b'),(928,2,'20220928.000537.274-financas','2023-02-13 16:42:21','432d6ce0b22ea3029f0a1c29a6b42186'),(929,2,'20220928.000540.310-financas','2023-02-13 16:42:21','ec50458d450836016573d36dc943b95b'),(930,2,'20220928.000543.338-financas','2023-02-13 16:42:21','4cc1e863e898e38228bacc218f67e4c3'),(931,2,'20220928.000546.372-financas','2023-02-13 16:42:21','5055a8fa684011a7862303fc86587dfc'),(932,2,'20220928.000549.408-financas','2023-02-13 16:42:21','84eddd178affdc3f8ff3a787846e44b8'),(933,2,'20220928.000552.450-financas','2023-02-13 16:42:21','e1698475fad96fd66b312e3202d719c7'),(934,2,'20220928.000555.478-financas','2023-02-13 16:42:21','d956f109a8caa7e3b92fc3511d577252'),(935,2,'20220928.000558.508-financas','2023-02-13 16:42:21','4f91368b8a52bdb326f75dc716520035'),(936,2,'20220928.000601.544-financas','2023-02-13 16:42:21','8199b12d215a5d1d69eb07500b5d2c1f'),(937,2,'20220928.000604.564-financas','2023-02-13 16:42:21','93f4bbf62c3dc71c7139b8c6f30beac5'),(938,2,'20220928.000607.588-financas','2023-02-13 16:42:21','bb01d5a5ece4a18a23aced27da59231e'),(939,2,'20220928.000610.626-financas','2023-02-13 16:42:21','ee13a7f6283983d9d65ada13fe87668e'),(940,2,'20220928.000613.667-financas','2023-02-13 16:42:21','9e2163d3801cb5853d1a76c4033840f8'),(941,2,'20220928.000616.703-financas','2023-02-13 16:42:21','7b91cef41830a2d081505963d430031a'),(942,2,'20220928.000619.731-financas','2023-02-13 16:42:21','42bc5f779f0574ac63b219d514cedb28'),(943,2,'20220928.000622.761-financas','2023-02-13 16:42:21','7fa700fe34d1e30e4259bee6ac96114a'),(944,2,'20220928.000625.789-financas','2023-02-13 16:42:21','51ef23db3e9ced41c513b307c4de5f4a'),(945,2,'20220928.000628.819-financas','2023-02-13 16:42:21','cf8f112ffe087a4b7a4382127e84c1e3'),(946,2,'20220928.000631.844-financas','2023-02-13 16:42:21','12f861d4198cab07704b02649c9eb07b'),(947,2,'20220928.000634.882-financas','2023-02-13 16:42:21','333997ae3f612ebcd072934349a5d89a'),(948,2,'20220928.000637.921-financas','2023-02-13 16:42:21','6eed9d57b1a9cbd20fa46c7a82323c57'),(949,2,'20220928.000640.954-financas','2023-02-13 16:42:21','76fd38bb2e071c2061d9049123001175'),(950,2,'20220928.000643.980-financas','2023-02-13 16:42:21','f5cd72d836bfe1a8d56376d9692a1996'),(951,2,'20220928.000647.008-financas','2023-02-13 16:42:21','c4eed8a92f0c0db757aa2045526f4039'),(952,2,'20220928.000650.050-financas','2023-02-13 16:42:21','620558012d141e94345f30356e84416c'),(953,2,'20220928.000653.076-financas','2023-02-13 16:42:21','d74291b2b8aeadba8938b96a943b0d8d'),(954,2,'20220928.000656.104-financas','2023-02-13 16:42:21','7d9cfccc2fb59700694efccf34bde665'),(955,2,'20220928.000659.138-financas','2023-02-13 16:42:21','474e667050761472706471899f1afc76'),(956,2,'20220928.000702.173-financas','2023-02-13 16:42:21','0142cc7f277dc6174a92aa3d230df414'),(957,2,'20220928.000705.207-financas','2023-02-13 16:42:21','18738ebd732f3a6ec5dfd2f8658279ae'),(958,2,'20220928.000708.236-financas','2023-02-13 16:42:21','7e162ad11da7b531b38108f6395ad1ee'),(959,2,'20220928.000711.264-financas','2023-02-13 16:42:21','16674cc03aaad0d44e07091099e4a171'),(960,2,'20220928.000714.288-financas','2023-02-13 16:42:21','07131b5b6172884d1dfbe9f05fb06ee0'),(961,2,'20220928.000717.326-financas','2023-02-13 16:42:21','b80ba31e193c337f816edc7892046bce'),(962,2,'20220928.000720.359-financas','2023-02-13 16:42:21','ee39ec82a2fd54769d400c72293fb7be'),(963,2,'20220928.000723.400-financas','2023-02-13 16:42:21','6e49e1c48e633f1010060de6c6f8f552'),(964,2,'20220928.000726.434-financas','2023-02-13 16:42:21','826d0ddb8209a2be9047c576418691ef'),(965,2,'20220928.000729.468-financas','2023-02-13 16:42:21','0907034427aaa48f9b91b449c82e9eb4'),(966,2,'20220928.000732.501-financas','2023-02-13 16:42:21','ead51cdb09d4d933ee6458516095c7bb'),(967,2,'20220928.000735.533-financas','2023-02-13 16:42:21','1225cf18a3f8306d6a89b19f3efc3cf0'),(968,2,'20220928.000738.567-financas','2023-02-13 16:42:21','e6595a884ae68ddf31bd9909fa508b37'),(969,2,'20220928.000741.592-financas','2023-02-13 16:42:21','e543e21c1db9a380b222571ca26fa726'),(970,2,'20220928.000744.622-financas','2023-02-13 16:42:21','80432b10962a095ec813c77f02ee2667'),(971,2,'20220928.000747.645-financas','2023-02-13 16:42:21','1f5dafcc74aa5e2afdacdd3d53ddce5e'),(972,2,'20220928.000750.686-financas','2023-02-13 16:42:21','cdfe0cef958c88e2662116dda1973f71'),(973,2,'20220928.000753.718-financas','2023-02-13 16:42:21','8668dc1539b5b5a2e9bc3a85d3aee2fa'),(974,2,'20220928.000756.745-financas','2023-02-13 16:42:21','845a04d1d2f6d6e2e9e00446312a90b3'),(975,2,'20220928.000759.767-financas','2023-02-13 16:42:21','c0852e72d9e11d2065e091b887fa0fcd'),(976,2,'20220928.000802.796-financas','2023-02-13 16:42:21','a6b5224d9bee5c2ba3fab3980bd2ab59'),(977,2,'20220928.000805.827-financas','2023-02-13 16:42:21','0955d68ecad12289f0d9b2a439cba482'),(978,2,'20220928.000808.858-financas','2023-02-13 16:42:21','3e0ccead39ace0feb3e8827dbc8d898b'),(979,2,'20220928.000811.893-financas','2023-02-13 16:42:21','dc079dfd393ca276d67f5a5d5331c812'),(980,2,'20220928.000814.920-financas','2023-02-13 16:42:21','f2bd8e09f0ecbe3d1930534264d1b6e2'),(981,2,'20220928.000817.950-financas','2023-02-13 16:42:21','a5a540f41e4d05ed8b5b4e74580374e2'),(982,2,'20220928.000820.970-financas','2023-02-13 16:42:21','699c80e523c25ecd69c281b2c55d9f0d'),(983,2,'20220928.000823.991-financas','2023-02-13 16:42:21','b57429a1e04a97d25a35089355834fbc'),(984,2,'20220928.000827.017-financas','2023-02-13 16:42:21','c4525f87843d1be7fba78cc670bc9fa3'),(985,2,'20220928.000830.051-financas','2023-02-13 16:42:21','8c9658e82d655af060c918ef3f49b471'),(986,2,'20220928.000833.075-financas','2023-02-13 16:42:21','f353c409611d28922dc864d213ada00a'),(987,2,'20220928.000836.114-financas','2023-02-13 16:42:21','58431b8db81d67a109b1e6b668068134'),(988,2,'20220928.000839.133-financas','2023-02-13 16:42:21','733f03dc7dc97da6086970f12cf25b2c'),(989,2,'20220928.000842.159-financas','2023-02-13 16:42:21','0d5e0c44bedb0ae38f22e98f838d7f49'),(990,2,'20220928.000845.191-financas','2023-02-13 16:42:21','411c2077b55f65445507e42f80ab8fd0'),(991,2,'20220928.000848.226-financas','2023-02-13 16:42:21','0b502b40817ebd4a9ef11571283c82c5'),(992,2,'20220928.000851.258-financas','2023-02-13 16:42:21','f123ea8b70ff58ad41b70a028df62472'),(993,2,'20220928.000854.278-financas','2023-02-13 16:42:21','d689f7e72a7a49bcc697e95233c1ba8b'),(994,2,'20220928.000857.314-financas','2023-02-13 16:42:21','3b30f9b5ecf6861953adcda2623bebb3'),(995,2,'20220928.000900.341-financas','2023-02-13 16:42:21','c2f852eb6c79d29f881602efcb0d7037'),(996,2,'20220928.000903.379-financas','2023-02-13 16:42:21','a08dfb58ecfe93fe3d6111a8a43ffcbc'),(997,2,'20220928.000906.405-financas','2023-02-13 16:42:21','b9f7e24e92aa9f1fac0e229d663fe595'),(998,2,'20220928.000909.435-financas','2023-02-13 16:42:21','09e5c75672a2b9a02b94ca748a619bb5'),(999,2,'20220928.000912.472-financas','2023-02-13 16:42:21','1171de904468f60d8f1d52d08f2fe5fb'),(1000,2,'20220928.000915.501-financas','2023-02-13 16:42:21','eabb23b6960b7a897dc7cf8feecc0c0d'),(1001,2,'20220928.000918.537-financas','2023-02-13 16:42:21','570a6d5f6d1efd0fdc3003f2023d3332'),(1002,2,'20220928.000921.566-financas','2023-02-13 16:42:21','30db491a519fb454f55967b1a261ab67'),(1003,2,'20220928.000924.597-financas','2023-02-13 16:42:21','dff6570a9a9db013276312dcb62d4a8e'),(1004,2,'20220928.000927.634-financas','2023-02-13 16:42:21','47b7081a1d92469585bda283fb487847'),(1005,2,'20220928.000930.662-financas','2023-02-13 16:42:21','68a2857775a1846ac5a764bf11647ec9'),(1006,2,'20220928.000933.690-financas','2023-02-13 16:42:21','ba7b5d45d6efa8a7d508cbebb9b0395b'),(1007,2,'20220928.000936.726-financas','2023-02-13 16:42:21','0857961547a9c1cfa6cc8540d49f47df'),(1008,2,'20220928.000939.759-financas','2023-02-13 16:42:21','01112c02ce9525a909890b00196bfe03'),(1009,2,'20220928.000942.790-financas','2023-02-13 16:42:21','3ce270dce8276c74562dc820e49993f1'),(1010,2,'20220928.000945.820-financas','2023-02-13 16:42:21','eff8d1090f5786d6d438f8d86d2ed131'),(1011,2,'20220928.000948.853-financas','2023-02-13 16:42:21','acbfebf29318d14a133c54324032d453'),(1012,2,'20220928.000951.893-financas','2023-02-13 16:42:21','c0e2be01ade4980159cc04b8ce29cc33'),(1013,2,'20220928.000954.921-financas','2023-02-13 16:42:21','185fa629beaaee987c33556f067df9fa'),(1014,2,'20220928.000957.956-financas','2023-02-13 16:42:21','3ca56505bf296d0efc7145e3d6f108fe'),(1015,2,'20220928.001000.995-financas','2023-02-13 16:42:21','1a1039342abd4275141a90081ad8b889'),(1016,2,'20220928.001004.029-financas','2023-02-13 16:42:21','0ba64249b3b5fc8a0975173445e8876a'),(1017,2,'20220928.001007.053-financas','2023-02-13 16:42:21','e2fb8d47ddb13826f980af9fecfa0872'),(1018,2,'20220928.001010.083-financas','2023-02-13 16:42:21','922e64562c75ef94a982642940ed49d9'),(1019,2,'20220928.001013.112-financas','2023-02-13 16:42:21','5abae34b6d2858e0b43ab60907d21c65'),(1020,2,'20220928.001016.152-financas','2023-02-13 16:42:21','7f6b062f09407371310d492c27a49601'),(1021,2,'20220928.001019.181-financas','2023-02-13 16:42:21','b9ef1b2620679da43b0c6bd7dba450dc'),(1022,2,'20220928.001022.212-financas','2023-02-13 16:42:21','c4d9c7fe75fb7997646612b4d06b7b69'),(1023,2,'20220928.001025.248-financas','2023-02-13 16:42:21','688da8e167085ff54cc8baa7b6484dd0'),(1024,2,'20220928.001028.277-financas','2023-02-13 16:42:21','28a2d01f21bc172a6a5b94d362783ccf'),(1025,2,'20220928.001031.307-financas','2023-02-13 16:42:21','31e89b2add64958a2123860723ba29dc'),(1026,2,'20220928.001034.339-financas','2023-02-13 16:42:21','3ea3a20027f9a29e9590c3ebd3621371'),(1027,2,'20220928.001037.359-financas','2023-02-13 16:42:21','39a3058bceabe6215fac407771da6475'),(1028,2,'20220928.001040.393-financas','2023-02-13 16:42:21','0fc919c7e6bb08812498b182ffbfeb3a'),(1029,2,'20220928.001043.426-financas','2023-02-13 16:42:21','f39ac2ff1599199117198b9da4c63676'),(1030,2,'20220928.001046.452-financas','2023-02-13 16:42:21','65434d969eec2253d6f1deed43d8fb56'),(1031,2,'20220928.001049.483-financas','2023-02-13 16:42:21','f31567997d045e6932c409f38507b683'),(1032,2,'20220928.001052.524-financas','2023-02-13 16:42:21','97c6dee89eb3b470d24906ab37f5fc6f'),(1033,2,'20220928.001055.558-financas','2023-02-13 16:42:21','540c3bc1bb49d9390c2bd7f8c02f7cc9'),(1034,2,'20220928.001058.601-financas','2023-02-13 16:42:21','6ebe8ecf8e9ad8b8585ecacf8a107df1'),(1035,2,'20220928.001101.633-financas','2023-02-13 16:42:21','80593fd600c8d892257c48d99d4608d2'),(1036,2,'20220928.001104.657-financas','2023-02-13 16:42:21','5d67589f599efe32dee1d7685f515d54'),(1037,2,'20220928.001107.695-financas','2023-02-13 16:42:21','8b9714c080f6e999c2516c9be0f98ebb'),(1038,2,'20220928.001110.735-financas','2023-02-13 16:42:21','ba5f83d50f00675d244475d1d5b13c07'),(1039,2,'20220928.001113.775-financas','2023-02-13 16:42:21','a7c7f4ffdea5a5dbbb3d499bcbf291ac'),(1040,2,'20220928.001116.803-financas','2023-02-13 16:42:21','0e0f8ba4340f103226dfcf7914944ca5'),(1041,2,'20220928.001119.834-financas','2023-02-13 16:42:21','cdecec905f5fac85aac5944681e8c933'),(1042,2,'20220928.001122.856-financas','2023-02-13 16:42:21','c4905909724c7b120d99798be8dec039'),(1043,2,'20220928.001125.889-financas','2023-02-13 16:42:21','727f99b8885097e5e0be427137202a55'),(1044,2,'20220928.001128.921-financas','2023-02-13 16:42:21','bfea6d931d931ff32e7b8d037bf390f6'),(1045,2,'20220928.001131.962-financas','2023-02-13 16:42:21','6d75faf521dacafca6d07569d9bac692'),(1046,2,'20220928.001134.990-financas','2023-02-13 16:42:21','b32e83fc99629ad81290585480f5da6e'),(1047,2,'20220928.001138.026-financas','2023-02-13 16:42:21','3ebe761a4ec4cb852d06f5f90d61e752'),(1048,2,'20220928.001141.052-financas','2023-02-13 16:42:21','563a00ac14c540df8e289b10ae9bc911'),(1049,2,'20220928.001144.081-financas','2023-02-13 16:42:21','0edfa095a83729b30899b741dd307e30'),(1050,2,'20220928.001147.123-financas','2023-02-13 16:42:21','57a97fdb8ce8521cca86d2bec2623451'),(1051,2,'20220928.001150.151-financas','2023-02-13 16:42:21','c482c5ae5ae6238f42ac1807f8fd7e17'),(1052,2,'20220928.001153.173-financas','2023-02-13 16:42:21','6a6c0f3c39960706ea306813d25f9cf7'),(1053,2,'20220928.001156.206-financas','2023-02-13 16:42:21','eb540c00c933a8002a4963bcdaa57683'),(1054,2,'20220928.001159.245-financas','2023-02-13 16:42:21','0163a518ad99b3e5c26bf49bca4a7060'),(1055,2,'20220928.001202.273-financas','2023-02-13 16:42:21','662c2994f60686be3eeae5b18fec8f85'),(1056,2,'20220928.001205.305-financas','2023-02-13 16:42:21','821be0d4f762b600adf2c5fca097d0f8'),(1057,2,'20220928.001208.339-financas','2023-02-13 16:42:21','7f2ce230bed186e6603783c28ff9c13f'),(1058,2,'20220928.001211.375-financas','2023-02-13 16:42:21','dfaaacaf7fb603ed2386eeed927d00c5'),(1059,2,'20220928.001214.407-financas','2023-02-13 16:42:21','e5803b7e3253b6c63908a5a522a0cae7'),(1060,2,'20220928.001217.433-financas','2023-02-13 16:42:21','7adf66d950fc2381d587dc18d23b778a'),(1061,2,'20220928.001220.463-financas','2023-02-13 16:42:21','a088ff13f9b21362a97ca3fdb07d4f84'),(1062,2,'20220928.001223.491-financas','2023-02-13 16:42:21','5d6177e9ee7e9845ddc3f1225db4ea7e'),(1063,2,'20220928.001226.518-financas','2023-02-13 16:42:21','9f0f8533f569ae6f2e88a60630b52e67'),(1064,2,'20220928.001229.546-financas','2023-02-13 16:42:21','fbc72954945066c881f1c5e921766c4c'),(1065,2,'20220928.001232.578-financas','2023-02-13 16:42:21','8955d77491b36d6590d946f76ddeaee5'),(1066,2,'20220928.001235.619-financas','2023-02-13 16:42:21','7cba4a6491d88c4a8543292b258b4a50'),(1067,2,'20220928.001238.658-financas','2023-02-13 16:42:21','4519f78ed87be4355cc3c100890ffa9d'),(1068,2,'20220928.001241.691-financas','2023-02-13 16:42:21','a0d555a61b84b2b24a7e9ed20d43ca5b'),(1069,2,'20220928.001244.721-financas','2023-02-13 16:42:21','2118e4d21c45606f16bec68b2f02481d'),(1070,2,'20220928.001247.753-financas','2023-02-13 16:42:21','5d505b37daf9c7f71f9fd42a6bd06608'),(1071,2,'20220928.001250.785-financas','2023-02-13 16:42:21','dca03f3a513ac04e45e2171f16290a27'),(1072,2,'20220928.001253.812-financas','2023-02-13 16:42:21','230ed83cd0a99a9288fb12372edc51e9'),(1073,2,'20220928.001256.838-financas','2023-02-13 16:42:21','7ba16dd2f88d7914954b6826c07831f3'),(1074,2,'20220928.001259.867-financas','2023-02-13 16:42:22','3e3c22159edd8071c8cc388c8f3c9814'),(1075,2,'20220928.001302.909-financas','2023-02-13 16:42:22','03908a8914194d534bdd6fde6d7d015c'),(1076,2,'20220928.001305.942-financas','2023-02-13 16:42:22','8c9285cb02c8d5472e84760d1183d67b'),(1077,2,'20220928.001308.980-financas','2023-02-13 16:42:22','869585dbfd451b7de08df96e4e0a9760'),(1078,2,'20220928.001312.010-financas','2023-02-13 16:42:22','cdbf2a04286cf85913d3978c42db17e5'),(1079,2,'20220928.001315.039-financas','2023-02-13 16:42:22','f9340389cadd8bf1628d9e6df511f132'),(1080,2,'20220928.001318.070-financas','2023-02-13 16:42:22','3707d0194b5e8e1d3d22ee62134f9c5e'),(1081,2,'20220928.001321.102-financas','2023-02-13 16:42:22','8451e4f10b7f658251c9cced790fe36b'),(1082,2,'20220928.001324.136-financas','2023-02-13 16:42:22','b491ae644265f0c051fcd2d82a20f256'),(1083,2,'20220928.001327.166-financas','2023-02-13 16:42:22','8e3b6ec49e4214fe6858d013acfb63aa'),(1084,2,'20220928.001330.196-financas','2023-02-13 16:42:22','85c4592ecb7fd2837c87f66c3655329f'),(1085,2,'20220928.001333.225-financas','2023-02-13 16:42:22','0f47527b7ea2ca2cb2879d83b983595a'),(1086,2,'20220928.001336.250-financas','2023-02-13 16:42:22','5642c1476b29e06c962b1f48f062c341'),(1087,2,'20220928.001339.281-financas','2023-02-13 16:42:22','bebdcc953d0afb51aca591f52a9462cb'),(1088,2,'20220928.001342.306-financas','2023-02-13 16:42:22','59ef420dddc40b4b0d31cb76e695b626'),(1089,2,'20220928.001345.336-financas','2023-02-13 16:42:22','c6759732ded889cc146347d6b95c0325'),(1090,2,'20220928.001348.365-financas','2023-02-13 16:42:22','6914650e3dff498b78b0c072bdf32154'),(1091,2,'20220928.001351.392-financas','2023-02-13 16:42:22','2904cf18b0f60eb77adfc29fc7f92099'),(1092,2,'20220928.001354.423-financas','2023-02-13 16:42:22','bc260c6427fe8d742ebab8db5c974827'),(1093,2,'20220928.001357.454-financas','2023-02-13 16:42:22','5d697da28993d679434435615a9a4673'),(1094,2,'20220928.001400.490-financas','2023-02-13 16:42:22','ef1731c2304f274012c9f64de4b1b19b'),(1095,2,'20220928.001403.510-financas','2023-02-13 16:42:22','1c39a8440442e3461a4f0124d7386b9f'),(1096,2,'20220928.001406.543-financas','2023-02-13 16:42:22','ea97a29b9f9541af6c0366a1ae2f574c'),(1097,2,'20220928.001409.571-financas','2023-02-13 16:42:22','b962e7fe35aa5903dbe8739dcfaa2c43'),(1098,2,'20220928.001412.597-financas','2023-02-13 16:42:22','16fcd5bb23ec8bb5c6dac52a1b574b04'),(1099,2,'20221010.125555.282-financas','2023-02-13 16:42:22','d2499be06bed8dbf98717b4f03f4e375'),(1100,2,'20221109.220608.516-financas','2023-02-13 16:42:22','59fb7855ed338b843d4d51f57c6bf805'),(1101,2,'20221109.220611.556-financas','2023-02-13 16:42:22','3f661ba7e1a2ed1e4863bd6c82e83ff2'),(1102,2,'20221109.220614.587-financas','2023-02-13 16:42:22','6e8d9118de4b7d6e96766bb7eed2d7d1'),(1103,2,'20221109.220617.620-financas','2023-02-13 16:42:22','c0df64a7450dae45c568690408642c67'),(1104,2,'20221109.220620.652-financas','2023-02-13 16:42:22','561aca83e3414a9f9914cdc1c0f2c368'),(1105,2,'20221109.220623.682-financas','2023-02-13 16:42:22','15dcf50db97f76af7127b18227aca98f'),(1106,2,'20221109.220626.717-financas','2023-02-13 16:42:22','337dccf1f9accd3bf4764af6f6f37d33'),(1107,2,'20221109.220629.751-financas','2023-02-13 16:42:22','aae4f82c1318409b1b97ec5ba941cc3d'),(1108,2,'20221109.220632.783-financas','2023-02-13 16:42:22','0d80919116e6fd60c3312b2b2a83bbe9'),(1109,2,'20221109.220635.812-financas','2023-02-13 16:42:22','2593a9079712606c46f8b274368d4927'),(1110,2,'20221109.220638.847-financas','2023-02-13 16:42:22','d62c0d796f1bbc6ef57ed4f4cf3b88d7'),(1111,2,'20221109.220641.879-financas','2023-02-13 16:42:22','e008a0649868a8dbaca697a677479c83'),(1112,2,'20221109.220644.908-financas','2023-02-13 16:42:22','a6d1150b0f66fa1cd7d8262535b8f51c'),(1113,2,'20221109.220647.939-financas','2023-02-13 16:42:22','812d2455019ed37f08cf1e0e1bfa2054'),(1114,2,'20221111.190830.275-financas','2023-02-13 16:42:22','5bcefcf1cad1dc8b33a9e23a836b748a'),(1115,2,'20221111.191354.353-financas','2023-02-13 16:42:22','04107a887302001ab9d8413d04a82d90'),(1116,2,'20221117.190045.919-financas','2023-02-13 16:42:22','13878a8cbfec6f04bc798fa6905cbc5f'),(1117,2,'20221117.190048.951-financas','2023-02-13 16:42:22','cc58e5a166a96e57e278b2f649c87711'),(1118,2,'20221117.190051.979-financas','2023-02-13 16:42:22','4c8f5340098e117f8021322bd00cb7a1'),(1119,2,'20221117.190055.001-financas','2023-02-13 16:42:22','1cbacebcb77c42a0837754d52b69adad'),(1120,2,'20221122.233150.252-financas','2023-02-13 16:42:22','f9327c5a97a481373873bb4c2655c4da'),(1121,2,'20221122.233153.288-financas','2023-02-13 16:42:22','5c169e9a5906cc5088a901b29cb518d5'),(1122,2,'20221122.233156.331-financas','2023-02-13 16:42:22','c90b0fd2cf46a02fbd83d3ed3e721ff5'),(1123,2,'20221201.224522.145-financas','2023-02-13 16:42:22','a37168fbe12ba6ece2bc085a1d6cd408'),(1124,2,'20221201.224525.175-financas','2023-02-13 16:42:22','654cb15616f0def597dabbbd371c52c9'),(1125,2,'20221220.194047.193-financas','2023-02-13 16:42:22','ac34787607964dfc7c2f017eb025306c'),(1126,2,'20221220.194050.224-financas','2023-02-13 16:42:22','42a898305153df0bcf850f50a43db35f'),(1127,2,'20221220.194053.256-financas','2023-02-13 16:42:22','6f6c56989739b7eadec1154cdf7cf8ee'),(1128,2,'20221220.194056.285-financas','2023-02-13 16:42:22','d3382165ebfb753c6386637876a5de20'),(1129,2,'20221220.194059.310-financas','2023-02-13 16:42:22','328ed730705fcad84b03ca25e9b63433'),(1130,2,'20221220.194102.332-financas','2023-02-13 16:42:22','698f26ef00c9bd59b91fe078420dd43d'),(1131,2,'20221220.194105.360-financas','2023-02-13 16:42:22','14d6e1998fb6d260264d1051679d2a19'),(1132,2,'20221220.194108.395-financas','2023-02-13 16:42:22','c255697dab456972ce1ae3216b23f377'),(1133,2,'20221220.194111.419-financas','2023-02-13 16:42:22','fd666012f1ee8bc7adce84bb1f876a3a'),(1134,2,'20221220.194114.446-financas','2023-02-13 16:42:22','e862ff1ba9d19da020f8fe30e0c77aad'),(1135,2,'20221220.194117.479-financas','2023-02-13 16:42:22','d8f057f2a304f62502142d0badbb88bc'),(1136,2,'20221220.194120.507-financas','2023-02-13 16:42:22','eeb22f9b2ccb91ceb757a9e5ef6ca005'),(1137,2,'20221220.194123.539-financas','2023-02-13 16:42:22','cde7c3aff4b3d402ef197112da62e17d'),(1138,2,'20221220.194126.571-financas','2023-02-13 16:42:22','a3ea5df47f8cdc1e69e653625d969f04'),(1139,2,'20221220.194129.595-financas','2023-02-13 16:42:22','2c5944593b400ab4d7847dbdc7e02b35'),(1140,2,'20221220.194132.624-financas','2023-02-13 16:42:22','adccf252435e16285d563fb1291aec9b'),(1141,2,'20230112.000154.665-financas','2023-02-13 16:42:22','09441865c736f686dc1ddd5740a70be5'),(1142,2,'20230112.000157.707-financas','2023-02-13 16:42:22','85122b79d4a74b60a23018dd700661da'),(1143,1,'1.0.21.110','2023-02-13 16:42:31','e3e22b910a7190ee7709f4d5f007fece'),(1144,2,'20221125.121856.591','2023-02-13 17:03:19','a5ab0013f917dd949e2644984878857b'),(1145,2,'20221202.223424.865','2023-02-13 17:03:19','241aa3f1abe1af1ea4be210b2e924d74'),(1146,2,'20221202.223427.909','2023-02-13 17:03:19','21a98b29886fab3e1ebc9b7ec3bd8c1b'),(1147,2,'20221202.223430.937','2023-02-13 17:03:19','2b563ed9d5af71475dd488db7472c30f'),(1148,2,'20221202.223433.969','2023-02-13 17:03:19','30da4a0ede41c350dfc5d7278f396801'),(1149,2,'20221202.223437.001','2023-02-13 17:03:19','9472536725f6ef1f476cffa8cf7e1346'),(1150,2,'20221202.223440.031','2023-02-13 17:03:19','ed69e6824fc8a0c63802b1d97a2bb6ff'),(1151,2,'20221202.223443.055','2023-02-13 17:03:19','11c9f6e3805706afb7aeaa02d3f8476a'),(1152,2,'20221202.223446.083','2023-02-13 17:03:19','fdabb65a4364df8af64d9d8a2ba46421'),(1153,2,'20221202.223449.117','2023-02-13 17:03:19','534760c1bc1026bb5c72743d68bb2d2e'),(1154,2,'20221202.223452.148','2023-02-13 17:03:19','b1cdf1b3c177ea3cc7b45a303852ab95'),(1155,2,'20221202.223455.177','2023-02-13 17:03:19','5e74084b2f4932865cb61228c1eda45c'),(1156,2,'20221202.223458.207','2023-02-13 17:03:19','1bde92b6ed8e3483d52d31de6f22aab0'),(1157,1,'1.0.22.17','2023-02-13 17:03:20','0ada0ae8bc8125a7da0a84ae49a3059e');
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

-- Dump completed on 2023-02-13 17:28:00
