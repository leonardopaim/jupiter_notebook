-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_9
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,'','S',3),(117,28,'2','CUSTOS',NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,'C','A',4),(124,35,'3','DESPESAS',NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,'D','A',4),(130,41,'3.1.01.005','Cartório',23,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,'D','A',4),(135,46,'3.1.01.010','Correios',23,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,'D','A',4),(137,48,'3.1.01.012','Doações',23,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,'D','A',4),(156,67,'3.1.02.002','Comissões',24,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,'D','A',4),(158,69,'3.1.02.004','Premiações',24,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,'D','A',4),(172,83,'3.1.05.004','Jornais',27,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,'D','A',4),(182,93,'3.1.06.005','Comissão',28,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,'D','A',4),(185,96,'3.1.06.008','Férias',28,'D','A',4),(186,97,'3.1.06.009','FGTS',28,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,'D','A',4),(188,99,'3.1.06.011','INSS',28,'D','A',4),(189,100,'3.1.06.012','IRRF',28,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,'D','A',4),(191,102,'3.1.06.014','Salário',28,'D','A',4),(192,103,'3.1.06.015','Salário família',28,'D','A',4),(193,104,'3.1.06.016','Seguro',28,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,'D','A',4),(208,119,'4.1.01.002','Ações',32,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,'','S',3);
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
INSERT INTO `categoria_empresa` VALUES (90,16,NULL,'',1,0),(91,16,NULL,'',1,0),(92,16,NULL,'',1,0),(93,16,NULL,'',1,0),(94,16,NULL,'',1,0),(95,16,NULL,'',1,0),(96,16,NULL,'',1,0),(97,16,NULL,'',1,0),(98,16,NULL,'',1,0),(99,16,NULL,'',1,0),(100,16,NULL,'',1,0),(101,16,NULL,'',1,0),(102,16,NULL,'',1,0),(103,16,NULL,'',1,0),(104,16,NULL,'',1,0),(105,16,NULL,'',1,0),(106,16,NULL,'',1,0),(107,16,NULL,'',1,0),(108,16,NULL,'',1,0),(109,16,NULL,'',1,0),(110,16,NULL,'',1,0),(111,16,NULL,'',1,0),(112,16,NULL,'',1,0),(113,16,NULL,'',1,0),(114,16,NULL,'',1,0),(115,16,NULL,'',1,0),(116,16,NULL,'',1,0),(117,16,NULL,'',1,0),(118,16,NULL,'',1,0),(119,16,NULL,'',1,0),(120,16,NULL,'',1,0),(121,16,NULL,'',1,0),(122,16,NULL,'',1,0),(123,16,NULL,'',1,0),(124,16,NULL,'',1,0),(125,16,NULL,'',1,0),(126,16,NULL,'',1,0),(127,16,NULL,'',1,0),(128,16,NULL,'',1,0),(129,16,NULL,'',1,0),(130,16,NULL,'',1,0),(131,16,NULL,'',1,0),(132,16,NULL,'',1,0),(133,16,NULL,'',1,0),(134,16,NULL,'',1,0),(135,16,NULL,'',1,0),(136,16,NULL,'',1,0),(137,16,NULL,'',1,0),(138,16,NULL,'',1,0),(139,16,NULL,'',1,0),(140,16,NULL,'',1,0),(141,16,NULL,'',1,0),(142,16,NULL,'',1,0),(143,16,NULL,'',1,0),(144,16,NULL,'',1,0),(145,16,NULL,'',1,0),(146,16,NULL,'',1,0),(147,16,NULL,'',1,0),(148,16,NULL,'',1,0),(149,16,NULL,'',1,0),(150,16,NULL,'',1,0),(151,16,NULL,'',1,0),(152,16,NULL,'',1,0),(153,16,NULL,'',1,0),(154,16,NULL,'',1,0),(155,16,NULL,'',1,0),(156,16,NULL,'',1,0),(157,16,NULL,'',1,0),(158,16,NULL,'',1,0),(159,16,NULL,'',1,0),(160,16,NULL,'',1,0),(161,16,NULL,'',1,0),(162,16,NULL,'',1,0),(163,16,NULL,'',1,0),(164,16,NULL,'',1,0),(165,16,NULL,'',1,0),(166,16,NULL,'',1,0),(167,16,NULL,'',1,0),(168,16,NULL,'',1,0),(169,16,NULL,'',1,0),(170,16,NULL,'',1,0),(171,16,NULL,'',1,0),(172,16,NULL,'',1,0),(173,16,NULL,'',1,0),(174,16,NULL,'',1,0),(175,16,NULL,'',1,0),(176,16,NULL,'',1,0),(177,16,NULL,'',1,0),(178,16,NULL,'',1,0),(179,16,NULL,'',1,0),(180,16,NULL,'',1,0),(181,16,NULL,'',1,0),(182,16,NULL,'',1,0),(183,16,NULL,'',1,0),(184,16,NULL,'',1,0),(185,16,NULL,'',1,0),(186,16,NULL,'',1,0),(187,16,NULL,'',1,0),(188,16,NULL,'',1,0),(189,16,NULL,'',1,0),(190,16,NULL,'',1,0),(191,16,NULL,'',1,0),(192,16,NULL,'',1,0),(193,16,NULL,'',1,0),(194,16,NULL,'',1,0),(195,16,NULL,'',1,0),(196,16,NULL,'',1,0),(197,16,NULL,'',1,0),(198,16,NULL,'',1,0),(199,16,NULL,'',1,0),(200,16,NULL,'',1,0),(201,16,NULL,'',1,0),(202,16,NULL,'',1,0),(203,16,NULL,'',1,0),(204,16,NULL,'',1,0),(205,16,NULL,'',1,0),(206,16,NULL,'',1,0),(207,16,NULL,'',1,0),(208,16,NULL,'',1,0),(209,16,NULL,'',1,0),(210,16,NULL,'',1,0),(211,16,NULL,'',1,0),(212,16,NULL,'',1,0),(213,16,NULL,'',1,0),(214,16,NULL,'',1,0),(215,16,NULL,'',1,0),(216,16,NULL,'',1,0),(217,16,NULL,'',1,0),(218,16,NULL,'',1,0),(219,16,NULL,'',1,0),(220,16,NULL,'',1,0),(221,16,NULL,'',1,0),(222,16,NULL,'',1,0),(223,16,NULL,'',1,0),(224,16,NULL,'',1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato`
--

LOCK TABLES `cliente_contrato` WRITE;
/*!40000 ALTER TABLE `cliente_contrato` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_item`
--

LOCK TABLES `compra_item` WRITE;
/*!40000 ALTER TABLE `compra_item` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
INSERT INTO `configuracao` VALUES (16,1,6,0,'','',1045.00,1,96,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,5,0,0,1,1,1,1,'','',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
INSERT INTO `conta` VALUES (1,16,1,0,'Caixa interno',1,0.00,0.00,'2022-10-25','','','',NULL,1,0);
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
INSERT INTO `empresa` VALUES (16,'Generic Inc','Generic Inc','08771592000157','','','2022-10-26','','',0,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
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
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,16,1,0),(2,16,1,0),(3,16,1,0),(4,16,1,0),(5,16,1,0),(6,16,1,0),(7,16,1,0),(8,16,1,0),(9,16,1,0),(10,16,1,0),(11,16,1,0),(12,16,1,0),(13,16,1,0),(14,16,1,0),(15,16,1,0),(16,16,1,0),(17,16,1,0),(18,16,1,0),(19,16,1,0),(20,16,1,0),(21,16,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-10-26 11:54:55'),(2,2,'Cheque',1,2,2,1,0,1,'2022-10-26 11:54:55'),(3,3,'Cartão',1,3,3,0,0,0,'2022-10-26 11:54:55'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-10-26 11:54:55'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-10-26 11:54:55'),(6,6,'PIX',1,6,17,0,0,1,'2022-10-26 11:54:55');
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
INSERT INTO `forma_pagamento_empresa` VALUES (1,16,1,0),(2,16,1,0),(3,16,1,0),(4,16,1,0),(5,16,1,0),(6,16,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-10-26 11:54:54',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(2,NULL,'2022-10-26 11:54:54',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(3,NULL,'2022-10-26 11:54:54',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(4,NULL,'2022-10-26 11:54:54',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(5,NULL,'2022-10-26 11:54:54',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(6,NULL,'2022-10-26 11:54:54',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(7,NULL,'2022-10-26 11:54:54',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(8,NULL,'2022-10-26 11:54:54',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(9,NULL,'2022-10-26 11:54:54',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(10,NULL,'2022-10-26 11:54:54',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(11,NULL,'2022-10-26 11:54:54',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(12,NULL,'2022-10-26 11:54:54',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(13,NULL,'2022-10-26 11:54:54',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(14,NULL,'2022-10-26 11:54:54',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(15,NULL,'2022-10-26 11:54:54',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(16,NULL,'2022-10-26 11:54:54',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(17,NULL,'2022-10-26 11:54:54',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(18,NULL,'2022-10-26 11:54:54',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(19,NULL,'2022-10-26 11:54:54',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(20,NULL,'2022-10-26 11:54:54',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(21,NULL,'2022-10-26 11:54:54',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(22,NULL,'2022-10-26 11:54:54',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(23,NULL,'2022-10-26 11:54:54',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(24,NULL,'2022-10-26 11:54:54',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(25,NULL,'2022-10-26 11:54:54',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(26,NULL,'2022-10-26 11:54:54',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(27,NULL,'2022-10-26 11:54:54',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(28,NULL,'2022-10-26 11:54:54',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(29,NULL,'2022-10-26 11:54:54',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(30,NULL,'2022-10-26 11:54:54',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(31,NULL,'2022-10-26 11:54:54',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(32,NULL,'2022-10-26 11:54:54',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(33,NULL,'2022-10-26 11:54:54',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(34,NULL,'2022-10-26 11:54:54',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(35,NULL,'2022-10-26 11:54:54',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(36,NULL,'2022-10-26 11:54:54',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(37,NULL,'2022-10-26 11:54:54',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(38,NULL,'2022-10-26 11:54:54',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(39,NULL,'2022-10-26 11:54:54',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(40,NULL,'2022-10-26 11:54:54',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(41,NULL,'2022-10-26 11:54:54',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(42,NULL,'2022-10-26 11:54:54',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(43,NULL,'2022-10-26 11:54:54',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(44,NULL,'2022-10-26 11:54:54',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(45,NULL,'2022-10-26 11:54:54',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(46,NULL,'2022-10-26 11:54:54',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(47,NULL,'2022-10-26 11:54:54',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(48,NULL,'2022-10-26 11:54:54',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(49,NULL,'2022-10-26 11:54:54',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(50,NULL,'2022-10-26 11:54:54',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(51,NULL,'2022-10-26 11:54:54',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(52,NULL,'2022-10-26 11:54:54',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(53,NULL,'2022-10-26 11:54:54',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(54,NULL,'2022-10-26 11:54:54',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(55,NULL,'2022-10-26 11:54:54',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(56,NULL,'2022-10-26 11:54:54',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(57,NULL,'2022-10-26 11:54:54',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(58,NULL,'2022-10-26 11:54:54',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(59,NULL,'2022-10-26 11:54:54',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(60,NULL,'2022-10-26 11:54:54',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(61,NULL,'2022-10-26 11:54:54',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(62,NULL,'2022-10-26 11:54:54',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(63,NULL,'2022-10-26 11:54:54',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(64,NULL,'2022-10-26 11:54:54',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(65,NULL,'2022-10-26 11:54:54',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(66,NULL,'2022-10-26 11:54:54',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(67,NULL,'2022-10-26 11:54:54',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(68,NULL,'2022-10-26 11:54:54',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(69,NULL,'2022-10-26 11:54:54',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(70,NULL,'2022-10-26 11:54:54',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(71,NULL,'2022-10-26 11:54:54',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(72,NULL,'2022-10-26 11:54:54',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(73,NULL,'2022-10-26 11:54:54',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(74,NULL,'2022-10-26 11:54:54',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(75,NULL,'2022-10-26 11:54:54',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(76,NULL,'2022-10-26 11:54:54',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(77,NULL,'2022-10-26 11:54:54',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(78,NULL,'2022-10-26 11:54:54',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(79,NULL,'2022-10-26 11:54:54',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(80,NULL,'2022-10-26 11:54:54',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(81,NULL,'2022-10-26 11:54:54',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(82,NULL,'2022-10-26 11:54:54',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(83,NULL,'2022-10-26 11:54:54',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(84,NULL,'2022-10-26 11:54:54',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(85,NULL,'2022-10-26 11:54:54',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(86,NULL,'2022-10-26 11:54:54',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(87,NULL,'2022-10-26 11:54:54',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(88,NULL,'2022-10-26 11:54:54',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(89,NULL,'2022-10-26 11:54:54',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(90,NULL,'2022-10-26 11:54:54',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(91,NULL,'2022-10-26 11:54:54',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(92,NULL,'2022-10-26 11:54:54',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(93,NULL,'2022-10-26 11:54:54',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(94,NULL,'2022-10-26 11:54:54',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(95,NULL,'2022-10-26 11:54:54',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(96,NULL,'2022-10-26 11:54:54',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(97,NULL,'2022-10-26 11:54:54',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(98,NULL,'2022-10-26 11:54:54',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(99,NULL,'2022-10-26 11:54:54',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(100,NULL,'2022-10-26 11:54:54',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(101,NULL,'2022-10-26 11:54:54',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(102,NULL,'2022-10-26 11:54:54',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(103,NULL,'2022-10-26 11:54:54',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(104,NULL,'2022-10-26 11:54:54',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(105,NULL,'2022-10-26 11:54:54',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(106,NULL,'2022-10-26 11:54:54',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(107,NULL,'2022-10-26 11:54:54',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(108,NULL,'2022-10-26 11:54:54',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(109,NULL,'2022-10-26 11:54:54',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(110,NULL,'2022-10-26 11:54:54',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(111,NULL,'2022-10-26 11:54:54',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(112,NULL,'2022-10-26 11:54:54',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(113,NULL,'2022-10-26 11:54:54',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(114,NULL,'2022-10-26 11:54:54',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(115,NULL,'2022-10-26 11:54:54',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(116,NULL,'2022-10-26 11:54:54',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(117,NULL,'2022-10-26 11:54:54',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(118,NULL,'2022-10-26 11:54:54',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(119,NULL,'2022-10-26 11:54:54',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(120,NULL,'2022-10-26 11:54:54',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(121,NULL,'2022-10-26 11:54:54',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(122,NULL,'2022-10-26 11:54:54',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(123,NULL,'2022-10-26 11:54:54',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(124,NULL,'2022-10-26 11:54:54',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(125,NULL,'2022-10-26 11:54:54',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(126,NULL,'2022-10-26 11:54:54',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(127,NULL,'2022-10-26 11:54:54',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(128,NULL,'2022-10-26 11:54:54',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(129,NULL,'2022-10-26 11:54:54',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(130,NULL,'2022-10-26 11:54:54',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(131,NULL,'2022-10-26 11:54:54',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(132,NULL,'2022-10-26 11:54:54',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(133,NULL,'2022-10-26 11:54:54',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(134,NULL,'2022-10-26 11:54:54',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(135,NULL,'2022-10-26 11:54:54',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":16}',0,0,''),(136,NULL,'2022-10-26 11:54:55',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"25/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":16}',0,0,''),(137,NULL,'2022-10-26 11:54:55',1,91,16,'{\"ID\":\"16\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":16}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,16),(2,16),(3,16),(4,16),(5,16),(6,16),(7,16),(8,16),(9,16),(10,16),(11,16),(12,16),(13,16),(14,16),(15,16),(16,16),(17,16),(18,16),(19,16),(20,16),(21,16),(22,16),(23,16),(24,16),(25,16),(26,16),(27,16),(28,16),(29,16),(30,16),(31,16),(32,16),(33,16),(34,16),(35,16),(36,16),(37,16),(38,16),(39,16),(40,16),(41,16),(42,16),(43,16),(44,16),(45,16),(46,16),(47,16),(48,16),(49,16),(50,16),(51,16),(52,16),(53,16),(54,16),(55,16),(56,16),(57,16),(58,16),(59,16),(60,16),(61,16),(62,16),(63,16),(64,16),(65,16),(66,16),(67,16),(68,16),(69,16),(70,16),(71,16),(72,16),(73,16),(74,16),(75,16),(76,16),(77,16),(78,16),(79,16),(80,16),(81,16),(82,16),(83,16),(84,16),(85,16),(86,16),(87,16),(88,16),(89,16),(90,16),(91,16),(92,16),(93,16),(94,16),(95,16),(96,16),(97,16),(98,16),(99,16),(100,16),(101,16),(102,16),(103,16),(104,16),(105,16),(106,16),(107,16),(108,16),(109,16),(110,16),(111,16),(112,16),(113,16),(114,16),(115,16),(116,16),(117,16),(118,16),(119,16),(120,16),(121,16),(122,16),(123,16),(124,16),(125,16),(126,16),(127,16),(128,16),(129,16),(130,16),(131,16),(132,16),(133,16),(134,16),(135,16),(136,16),(137,16);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
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
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(5,5,'Prestação de serviços','S',0,1,1);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,97,9),(2,99,5),(2,100,6),(3,119,3),(3,120,4),(3,121,10),(4,122,7),(4,123,8),(5,98,9),(5,95,11),(5,96,12);
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
INSERT INTO `operacao_empresa` VALUES (1,16,1,1,0),(2,16,1,1,0),(3,16,1,1,0),(4,16,1,1,0),(5,16,1,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_pagar`
--

LOCK TABLES `pagamento_pagar` WRITE;
/*!40000 ALTER TABLE `pagamento_pagar` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-10-26 11:54:55'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-10-26 11:54:55'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-10-26 11:54:55'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-10-26 11:54:55');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,16,1,0),(2,16,1,0),(3,16,1,0),(4,16,1,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_sped`
--

LOCK TABLES `produto_sped` WRITE;
/*!40000 ALTER TABLE `produto_sped` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1099 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20220725.231548.845','2022-10-26 11:54:42','51bc9efca98e68b852dec37a30e2c230'),(2,2,'20220927.231853.021-financas','2022-10-26 11:54:42','6df5344d8526109800e0ed82a98a11b2'),(3,2,'20220927.231856.052-financas','2022-10-26 11:54:42','ad10f0cadfeea2bc2ab040f152e3ab0c'),(4,2,'20220927.231859.082-financas','2022-10-26 11:54:42','6dc703165d43390a271202a3431ab146'),(5,2,'20220927.231902.116-financas','2022-10-26 11:54:42','a32515fa592195a82d88fef67901d3cc'),(6,2,'20220927.231905.158-financas','2022-10-26 11:54:42','c1f27f439b5c7488af14427fd0dea0a7'),(7,2,'20220927.231908.190-financas','2022-10-26 11:54:42','bfea9fcafe3acf06c0339632388c6601'),(8,2,'20220927.231911.215-financas','2022-10-26 11:54:42','79806e65be9f43501718cd0be7cfea48'),(9,2,'20220927.231914.237-financas','2022-10-26 11:54:42','c5166606d81f8d99fc355a5991d65549'),(10,2,'20220927.231917.275-financas','2022-10-26 11:54:42','ec5da64781a796e29ad81918e24193d5'),(11,2,'20220927.231920.311-financas','2022-10-26 11:54:42','99647965b4c642bbcf87fc0552156a26'),(12,2,'20220927.231923.342-financas','2022-10-26 11:54:42','c17f3186cb13318d457660dfd9424e6d'),(13,2,'20220927.231926.383-financas','2022-10-26 11:54:42','8a94a4097513253cc708f479e73a0418'),(14,2,'20220927.231929.422-financas','2022-10-26 11:54:42','eba25556762eff1b034ef8a83f711b24'),(15,2,'20220927.231932.449-financas','2022-10-26 11:54:42','ef4e594c381389ef9d471c2186f4c944'),(16,2,'20220927.231935.475-financas','2022-10-26 11:54:42','ea9696c43a8652c7238ac3ce02c28f6e'),(17,2,'20220927.231938.503-financas','2022-10-26 11:54:42','a7985263f5302b41b5711a036480e99e'),(18,2,'20220927.231941.539-financas','2022-10-26 11:54:42','c49b25cd910a27df70e305576cfa7a71'),(19,2,'20220927.231944.560-financas','2022-10-26 11:54:42','c93bf331d3b2362605bc853df104ac26'),(20,2,'20220927.231947.591-financas','2022-10-26 11:54:42','795030bf5522b01879668c1029c2c5a4'),(21,2,'20220927.231950.619-financas','2022-10-26 11:54:42','c8ce57c9d6445519f6729dadec3dffc0'),(22,2,'20220927.231953.643-financas','2022-10-26 11:54:42','0eb64707e1823091885fc4a4a4bb74b1'),(23,2,'20220927.231956.678-financas','2022-10-26 11:54:42','4fa63cc53441ccd0420e04785189c9e4'),(24,2,'20220927.231959.720-financas','2022-10-26 11:54:42','091519d0d7facc39b799df176ed123dd'),(25,2,'20220927.232002.752-financas','2022-10-26 11:54:42','a041b83490ffc1ecfda4267cc48cf60a'),(26,2,'20220927.232005.779-financas','2022-10-26 11:54:42','c23428f02b6134dff60ffe6ea9559042'),(27,2,'20220927.232008.813-financas','2022-10-26 11:54:42','4d8ad257ac7bb0cc4bb70234bc395460'),(28,2,'20220927.232011.839-financas','2022-10-26 11:54:42','528f10364ccbd508fdf18d8743ec110a'),(29,2,'20220927.232014.867-financas','2022-10-26 11:54:42','cb4967e87d481e1d3882022f5967bd1f'),(30,2,'20220927.232017.894-financas','2022-10-26 11:54:42','258109824f01797b9a975e4cfe4ed8f9'),(31,2,'20220927.232020.927-financas','2022-10-26 11:54:42','e42da017bf8d5e0d78c7aca210e2dbbe'),(32,2,'20220927.232023.968-financas','2022-10-26 11:54:42','1edcbc861cf171a16de1cbf1a6805dfa'),(33,2,'20220927.232026.997-financas','2022-10-26 11:54:42','560785a573522316131d0c40c9ab6c4b'),(34,2,'20220927.232030.018-financas','2022-10-26 11:54:42','bdbde9db6b65b8f0e92a2a388e05fc96'),(35,2,'20220927.232033.051-financas','2022-10-26 11:54:42','fefe2732f31720287d2d65af96eb661f'),(36,2,'20220927.232036.093-financas','2022-10-26 11:54:42','bfafcc44ee5411395ee1d4854e20d643'),(37,2,'20220927.232039.127-financas','2022-10-26 11:54:42','95f4e4fafb9dfff169d801ec69670835'),(38,2,'20220927.232042.162-financas','2022-10-26 11:54:42','70c16c5c666d046395f3a7e03d203237'),(39,2,'20220927.232045.187-financas','2022-10-26 11:54:42','fb6c5ba1bb15d383b558d76f4447e7ae'),(40,2,'20220927.232048.220-financas','2022-10-26 11:54:42','e9d79269a722d583011127f81302f3ed'),(41,2,'20220927.232051.257-financas','2022-10-26 11:54:42','aa31e108c3408d1eb9bd2e2ffd6bbadf'),(42,2,'20220927.232054.286-financas','2022-10-26 11:54:42','66c06ebde3be621d302aa60afc644e3e'),(43,2,'20220927.232057.328-financas','2022-10-26 11:54:42','a512b0d56750a3ef4c73fe6ac041d5ca'),(44,2,'20220927.232100.367-financas','2022-10-26 11:54:42','b1ea3bb85d538aaa792fe1d0ee6789ed'),(45,2,'20220927.232103.395-financas','2022-10-26 11:54:42','f9776db6a17f462720310099f1aa0a0e'),(46,2,'20220927.232106.423-financas','2022-10-26 11:54:42','4d661f10f437f8625bc7ba34fa887d68'),(47,2,'20220927.232109.456-financas','2022-10-26 11:54:42','61194d0b9d3980ef97ae152273655e72'),(48,2,'20220927.232112.491-financas','2022-10-26 11:54:42','24eb0cd671909f575b0aceee0d3b101d'),(49,2,'20220927.232115.513-financas','2022-10-26 11:54:42','14152d1f287ecf2367a0293aca9b6ff0'),(50,2,'20220927.232118.547-financas','2022-10-26 11:54:42','50f0fe377a8f1a85a462bbe6c0ef02cc'),(51,2,'20220927.232121.575-financas','2022-10-26 11:54:42','0f5a4e81a57ca679a7b06cfcb261f6e2'),(52,2,'20220927.232124.607-financas','2022-10-26 11:54:42','40e9063905cc321a6457ea9c98e1292f'),(53,2,'20220927.232127.635-financas','2022-10-26 11:54:42','a988cbecec924072ace1ac37878eb229'),(54,2,'20220927.232130.676-financas','2022-10-26 11:54:42','78d1ffbf026153221ba0914fc157ba8d'),(55,2,'20220927.232133.705-financas','2022-10-26 11:54:42','36979fd24bc742a62a26ae4d7fc02e4b'),(56,2,'20220927.232136.737-financas','2022-10-26 11:54:42','b866556a5e0f17156e78e10a5ea8c138'),(57,2,'20220927.232139.771-financas','2022-10-26 11:54:42','7179dc6cfc85f7f7190094a47e304df4'),(58,2,'20220927.232142.802-financas','2022-10-26 11:54:42','85f08f58c1fae602df3513c8a1336d56'),(59,2,'20220927.232145.829-financas','2022-10-26 11:54:42','2c95c417b77e756f9f8fd6f0de2c31a0'),(60,2,'20220927.232148.858-financas','2022-10-26 11:54:42','f74456fbbded2ca714428633b8714cc0'),(61,2,'20220927.232151.889-financas','2022-10-26 11:54:42','f14cbb6186ca055fe3e84324f7d2a517'),(62,2,'20220927.232154.913-financas','2022-10-26 11:54:42','2d098c6e8a818642d64265b3b9ff9b7f'),(63,2,'20220927.232157.949-financas','2022-10-26 11:54:42','c9df448983d7f3d6c955ab659aa088e5'),(64,2,'20220927.232200.972-financas','2022-10-26 11:54:42','94006e9f2f7701c8206a5ae93faa7a93'),(65,2,'20220927.232204.006-financas','2022-10-26 11:54:42','ad98fcebee6158cb85b705086b3c7688'),(66,2,'20220927.232207.039-financas','2022-10-26 11:54:42','1f7fa2d89d63bc09c6bfd9134bb7f2de'),(67,2,'20220927.232210.064-financas','2022-10-26 11:54:42','f5334a98c7826be57d54a83f6779d9d9'),(68,2,'20220927.232213.090-financas','2022-10-26 11:54:42','762bb62d108173e305d1e08a85cecb3b'),(69,2,'20220927.232216.129-financas','2022-10-26 11:54:42','01b9dd083853446348b7be1b6da0ab78'),(70,2,'20220927.232219.167-financas','2022-10-26 11:54:42','70fa7313bc9d4cff4d0f1778a7ad5e8e'),(71,2,'20220927.232222.193-financas','2022-10-26 11:54:42','df12bbf78c99817eb00ad170cb4a1198'),(72,2,'20220927.232225.219-financas','2022-10-26 11:54:42','adcb97c13677fffeb7328ccb53c179ea'),(73,2,'20220927.232228.256-financas','2022-10-26 11:54:42','4be54888ded17518b57306c83a67f45c'),(74,2,'20220927.232231.283-financas','2022-10-26 11:54:42','07ec2f9ceee90f3fdad56e9fe72095ba'),(75,2,'20220927.232234.314-financas','2022-10-26 11:54:42','9852d36b597a97a775d4add766ebad72'),(76,2,'20220927.232237.348-financas','2022-10-26 11:54:42','2cd484a6672facff64bf027f08b69f9c'),(77,2,'20220927.232240.374-financas','2022-10-26 11:54:42','d6a53bbfc15705eed656e081d1404185'),(78,2,'20220927.232243.406-financas','2022-10-26 11:54:42','1ab9a437eb26acac994f07f54f2221e5'),(79,2,'20220927.232246.448-financas','2022-10-26 11:54:42','a0e61d0fc6677382ccef55df0e2d9762'),(80,2,'20220927.232249.485-financas','2022-10-26 11:54:42','684303e9531eef54858aa4c5005ba6f8'),(81,2,'20220927.232252.522-financas','2022-10-26 11:54:42','e91cb77f3c79c792201836f5cb3df108'),(82,2,'20220927.232255.558-financas','2022-10-26 11:54:42','3b2b651b604e1fe6a2c40bdbb255a729'),(83,2,'20220927.232258.583-financas','2022-10-26 11:54:42','c5edd12244def0c194ba66071ae946e2'),(84,2,'20220927.232301.622-financas','2022-10-26 11:54:42','1c7cbb677950da6f7809a4f2baddf153'),(85,2,'20220927.232304.657-financas','2022-10-26 11:54:42','a54f71e959334cc5ec90585a4030ed3d'),(86,2,'20220927.232307.681-financas','2022-10-26 11:54:42','0fd74e4ce8a99cfb157753c507c22009'),(87,2,'20220927.232310.703-financas','2022-10-26 11:54:42','450e28d0835654f9e1610c839eee933d'),(88,2,'20220927.232313.739-financas','2022-10-26 11:54:42','ec60180ea892181665a37d85ac8ab0d8'),(89,2,'20220927.232316.772-financas','2022-10-26 11:54:42','22eee16b528c5ad7f0edf8b67059a4ca'),(90,2,'20220927.232319.805-financas','2022-10-26 11:54:42','3aa801b0fb99277eb9ecf8d25600dfe2'),(91,2,'20220927.232322.838-financas','2022-10-26 11:54:42','e4f5a366d2f047aaccc84d7f135a5b6a'),(92,2,'20220927.232325.873-financas','2022-10-26 11:54:42','61a3bd02973cabf2a2cde5de6f443e5b'),(93,2,'20220927.232328.902-financas','2022-10-26 11:54:42','f25bf975f04afda1a6d113fbdea2b73e'),(94,2,'20220927.232331.926-financas','2022-10-26 11:54:42','92c9af217f8f49d9b9a9993370c1c196'),(95,2,'20220927.232334.967-financas','2022-10-26 11:54:42','1f966f67e1c2194ba7a99a4dbc92df31'),(96,2,'20220927.232338.003-financas','2022-10-26 11:54:42','01e5e8f7fd0722ee0457ef47f0931f6d'),(97,2,'20220927.232341.029-financas','2022-10-26 11:54:42','1466e322c37ed930812c579bdb014903'),(98,2,'20220927.232344.066-financas','2022-10-26 11:54:42','4af41f0c3ff1b9731c6e6b740e22790b'),(99,2,'20220927.232347.103-financas','2022-10-26 11:54:42','5b68a54e7165e93fe0d43fcee4e55682'),(100,2,'20220927.232350.132-financas','2022-10-26 11:54:42','9a4d09f84a13f3c34b791dee5828ca75'),(101,2,'20220927.232353.175-financas','2022-10-26 11:54:42','0757abd287838dac619a23374a59f888'),(102,2,'20220927.232356.206-financas','2022-10-26 11:54:42','9496afa193347d8d6471cb77189797f8'),(103,2,'20220927.232359.244-financas','2022-10-26 11:54:42','c07329370479c3d7d5e58e710ea2af5f'),(104,2,'20220927.232402.269-financas','2022-10-26 11:54:42','b3ba72a5b3268f8fb59d7283505611bd'),(105,2,'20220927.232405.304-financas','2022-10-26 11:54:42','c2c36a90a39419432a3552dba9dd8179'),(106,2,'20220927.232408.343-financas','2022-10-26 11:54:42','eda60c060f8e8798c7f7e8db08c004e6'),(107,2,'20220927.232411.376-financas','2022-10-26 11:54:42','44d4bf3eee9bae89ee93f7f74b64f292'),(108,2,'20220927.232414.410-financas','2022-10-26 11:54:42','8c8a3418f6e52fd929ec2c16cb2729fc'),(109,2,'20220927.232417.444-financas','2022-10-26 11:54:42','7963e18a88bb7dd3609f487cb076bbad'),(110,2,'20220927.232420.471-financas','2022-10-26 11:54:42','5f065b1aa6f99faac55967911c3c6f98'),(111,2,'20220927.232423.505-financas','2022-10-26 11:54:42','0556cbb706d48c102d2c023a5cd327db'),(112,2,'20220927.232426.546-financas','2022-10-26 11:54:42','22614546f2436ad271b1ceb24925404d'),(113,2,'20220927.232429.583-financas','2022-10-26 11:54:42','0fa4e2cb10a5cffc71456c5af2f49b1c'),(114,2,'20220927.232432.614-financas','2022-10-26 11:54:42','9967b2dbcb90c170ed1862c751a1926a'),(115,2,'20220927.232435.654-financas','2022-10-26 11:54:42','0e29e164af6d4fc9dee7a3ac254aba1e'),(116,2,'20220927.232438.684-financas','2022-10-26 11:54:42','e76e5704a04b7641c93898beda9cb615'),(117,2,'20220927.232441.715-financas','2022-10-26 11:54:42','a3c6ed3b19a494482d63a4d7ff58b5ef'),(118,2,'20220927.232444.751-financas','2022-10-26 11:54:42','0900c80d9a673cf26e2432192ac00add'),(119,2,'20220927.232447.784-financas','2022-10-26 11:54:42','ac66de67e3d4cb3441b341ba735f6cf4'),(120,2,'20220927.232450.819-financas','2022-10-26 11:54:42','9ac9fb70b1e57dce515cdaad0fbb07a4'),(121,2,'20220927.232453.859-financas','2022-10-26 11:54:42','0abab095dd7e0ef8dad9b4c74f55b4c8'),(122,2,'20220927.232456.892-financas','2022-10-26 11:54:42','55d96445824ec2100c79ee861c26779b'),(123,2,'20220927.232459.921-financas','2022-10-26 11:54:42','5af4beb062a7b1ab329cadc54bd3c6f4'),(124,2,'20220927.232502.953-financas','2022-10-26 11:54:42','2ec2b7d4f813c8c9c55376674a751444'),(125,2,'20220927.232505.981-financas','2022-10-26 11:54:42','ad5f9d4e1059729d806bf03d9929f9d2'),(126,2,'20220927.232509.010-financas','2022-10-26 11:54:42','93321f5b3944ab65b2d54cf24009a827'),(127,2,'20220927.232512.043-financas','2022-10-26 11:54:42','dbc208214166dfd331f1181fa5ac898e'),(128,2,'20220927.232515.073-financas','2022-10-26 11:54:42','a7e5d629baf479b8421d1f353ed83b6a'),(129,2,'20220927.232518.111-financas','2022-10-26 11:54:42','f72bb369c0c1f658dbf29153a8d53fd4'),(130,2,'20220927.232521.154-financas','2022-10-26 11:54:42','20694d67f1efb85822ea1fd5468f1ffc'),(131,2,'20220927.232524.192-financas','2022-10-26 11:54:42','338412ff0bd8dd1b3aa8e7b5059bc091'),(132,2,'20220927.232527.226-financas','2022-10-26 11:54:42','7530a19c2b91d08ff365a1635eb73cbe'),(133,2,'20220927.232530.257-financas','2022-10-26 11:54:42','3a9cc0b29cd03929287733927ed2d166'),(134,2,'20220927.232533.279-financas','2022-10-26 11:54:42','77da416a18b2f921862452633d576b74'),(135,2,'20220927.232536.304-financas','2022-10-26 11:54:42','ba9b582b916ad80d666b624489947f66'),(136,2,'20220927.232539.334-financas','2022-10-26 11:54:42','48a1ad37b8ca8a5680a96b318ef44b77'),(137,2,'20220927.232542.376-financas','2022-10-26 11:54:42','c6ab4f9bfe7d2ddb4d8cc8658ea10cb9'),(138,2,'20220927.232545.411-financas','2022-10-26 11:54:42','edafa11364a821dba8827dffdd981e56'),(139,2,'20220927.232548.441-financas','2022-10-26 11:54:42','28dec9abad0e3babf0123bbd4799f8f8'),(140,2,'20220927.232551.469-financas','2022-10-26 11:54:42','c60d64dc5162eff36060b2bc76debeba'),(141,2,'20220927.232554.498-financas','2022-10-26 11:54:42','710ee1d2f170bfff9c0973a654165cf9'),(142,2,'20220927.232557.529-financas','2022-10-26 11:54:42','f102cb9afdd9c4fccfd99beee87d7ba2'),(143,2,'20220927.232600.560-financas','2022-10-26 11:54:42','e256af09fda7afa16e781bbac18b2b9f'),(144,2,'20220927.232603.602-financas','2022-10-26 11:54:42','476c61ba18e5350b862f1613d377aea3'),(145,2,'20220927.232606.641-financas','2022-10-26 11:54:42','78ace72b407841d6613c666b9587a192'),(146,2,'20220927.232609.672-financas','2022-10-26 11:54:42','bb25b7f419a427b1ca542fb99095e9c6'),(147,2,'20220927.232612.696-financas','2022-10-26 11:54:42','c992f79aa69ebf7bf4cbc82852d53444'),(148,2,'20220927.232615.725-financas','2022-10-26 11:54:42','770851f9646e056dace15a04f7fa9eb8'),(149,2,'20220927.232618.759-financas','2022-10-26 11:54:42','1438b6d7577bb4f7ffea26c2d6e10393'),(150,2,'20220927.232621.791-financas','2022-10-26 11:54:42','02811b9102f89d04cbb4575468dda12d'),(151,2,'20220927.232624.818-financas','2022-10-26 11:54:42','d03145ebada5114962471bb666130d5d'),(152,2,'20220927.232627.854-financas','2022-10-26 11:54:42','a3ed552852ee730d48add17b41d50937'),(153,2,'20220927.232630.891-financas','2022-10-26 11:54:42','48c4ddc17865e11e52cf97dc8583ce0d'),(154,2,'20220927.232633.913-financas','2022-10-26 11:54:42','a50a0833d3fb2179aa3c22e568626ca3'),(155,2,'20220927.232636.944-financas','2022-10-26 11:54:42','9acf1385f1a1c021aafe59b869241813'),(156,2,'20220927.232639.974-financas','2022-10-26 11:54:42','86a412710b09f7d87afa3cb7a85ee9d1'),(157,2,'20220927.232643.008-financas','2022-10-26 11:54:42','d03edf06965527dc9248dee34aa5dbae'),(158,2,'20220927.232646.039-financas','2022-10-26 11:54:42','e2a36ea3a895e8b3a4af91ba4279ee49'),(159,2,'20220927.232649.072-financas','2022-10-26 11:54:42','256dfe77df849cdbb296ed75f0e77f33'),(160,2,'20220927.232652.103-financas','2022-10-26 11:54:42','da32de9d96e8ba3af6ffc90882840fa5'),(161,2,'20220927.232655.134-financas','2022-10-26 11:54:42','def6b5e1416ff0d72e854940a8bc552d'),(162,2,'20220927.232658.169-financas','2022-10-26 11:54:42','cb552e402cbb55c8be85fb6ce2375b91'),(163,2,'20220927.232701.204-financas','2022-10-26 11:54:42','e45f3c37f59166d2c522e1e951118a69'),(164,2,'20220927.232704.237-financas','2022-10-26 11:54:42','c7bbbe0e096f2dde7c44301cf48189a1'),(165,2,'20220927.232707.265-financas','2022-10-26 11:54:42','7dd90b8c7e04028d639c18a2bf887377'),(166,2,'20220927.232710.291-financas','2022-10-26 11:54:42','04d5366fddf1a18da24be5086a07200f'),(167,2,'20220927.232713.319-financas','2022-10-26 11:54:42','50b455cb54074c0cf3b43261ca1499a3'),(168,2,'20220927.232716.345-financas','2022-10-26 11:54:42','45016b582c8f3887bb6a011f1c5a4ce0'),(169,2,'20220927.232719.376-financas','2022-10-26 11:54:42','b5a547ce161e274a17ba4306b3bcf492'),(170,2,'20220927.232722.413-financas','2022-10-26 11:54:42','31c9b796dccb690484f05b578af77277'),(171,2,'20220927.232725.451-financas','2022-10-26 11:54:42','7cfa53a53ce38c6225e73d997e1e8e37'),(172,2,'20220927.232728.475-financas','2022-10-26 11:54:42','0c2d481dad3afb90e4d74e0aed6847b8'),(173,2,'20220927.232731.509-financas','2022-10-26 11:54:42','60a54d27ede1b795ed9ca4294befc224'),(174,2,'20220927.232734.538-financas','2022-10-26 11:54:42','bc7351d9581a819dd4c61a7c253c91e1'),(175,2,'20220927.232737.569-financas','2022-10-26 11:54:42','aa7fefe7da46efe937fc3a064a47ef06'),(176,2,'20220927.232740.596-financas','2022-10-26 11:54:42','bf50edd9db5786c7d135df3a38311330'),(177,2,'20220927.232743.629-financas','2022-10-26 11:54:42','dd4638cf223ce36bf3d8b56a8eb5ac3b'),(178,2,'20220927.232746.669-financas','2022-10-26 11:54:42','cb1bdba3b3ab0e4f69b97bd2d1c0ddce'),(179,2,'20220927.232749.707-financas','2022-10-26 11:54:42','c292048b79b25bfd6dd8c3ff728b3f47'),(180,2,'20220927.232752.736-financas','2022-10-26 11:54:42','9f00c2c3edc238d32961a230e4b3bc9e'),(181,2,'20220927.232755.766-financas','2022-10-26 11:54:42','e833fe1134cfe7506e90d1eb2413c467'),(182,2,'20220927.232758.799-financas','2022-10-26 11:54:42','7791fc3627e0fb758909077162f13a83'),(183,2,'20220927.232801.839-financas','2022-10-26 11:54:42','333db68a949d721edfcdc18901b5cee5'),(184,2,'20220927.232804.868-financas','2022-10-26 11:54:42','7c76100090c2106903875dccdaa88e79'),(185,2,'20220927.232807.904-financas','2022-10-26 11:54:42','e7a622912211e1604142e36f2c0a8039'),(186,2,'20220927.232810.940-financas','2022-10-26 11:54:42','fd04c6c64123b87495e8e00529bff7e1'),(187,2,'20220927.232813.974-financas','2022-10-26 11:54:42','c9849aafc03935ef4474b9b9be681e02'),(188,2,'20220927.232817.010-financas','2022-10-26 11:54:42','01cfd2ba5e2438f80f9b4f16cbd7d43d'),(189,2,'20220927.232820.040-financas','2022-10-26 11:54:42','12bf29045c35cf03a683062aae2f5fe5'),(190,2,'20220927.232823.062-financas','2022-10-26 11:54:42','a4ee4a8758d54c36aed048445ba1d54f'),(191,2,'20220927.232826.092-financas','2022-10-26 11:54:42','5dca26b7457922862c9614088efb972c'),(192,2,'20220927.232829.122-financas','2022-10-26 11:54:42','52a9f11f5f5e91f40078a977dc81e0f2'),(193,2,'20220927.232832.143-financas','2022-10-26 11:54:42','a82c1e5881b0a9b34730bdba3c17edb7'),(194,2,'20220927.232835.174-financas','2022-10-26 11:54:42','8f8b035bb723c35b03b2cef1e0f00c6e'),(195,2,'20220927.232838.193-financas','2022-10-26 11:54:42','c73f8a1c828bb8cbd071cf4a71d4128e'),(196,2,'20220927.232841.224-financas','2022-10-26 11:54:42','475caed18404473201e3bb5314f5700e'),(197,2,'20220927.232844.252-financas','2022-10-26 11:54:42','4878ae87ab629c298938d54c29eb2a0c'),(198,2,'20220927.232847.290-financas','2022-10-26 11:54:42','089e451329a503348c174f04745037c5'),(199,2,'20220927.232850.325-financas','2022-10-26 11:54:42','9af0c2b2e89fa5a00c65f409dc5da826'),(200,2,'20220927.232853.357-financas','2022-10-26 11:54:42','18df3ce78807000083894b346281c3c0'),(201,2,'20220927.232856.391-financas','2022-10-26 11:54:42','b31c2cffed137608ae6274585c4b776e'),(202,2,'20220927.232859.421-financas','2022-10-26 11:54:42','325d38da54d7ddab3f7506c74f6ee7d3'),(203,2,'20220927.232902.454-financas','2022-10-26 11:54:42','f4b5585bb04544803313a4d2660a97eb'),(204,2,'20220927.232905.477-financas','2022-10-26 11:54:42','92b93bd72c6041a36a9c4c33285b63fa'),(205,2,'20220927.232908.500-financas','2022-10-26 11:54:42','c712d4d464de75b357c76b0d838f31d3'),(206,2,'20220927.232911.522-financas','2022-10-26 11:54:42','d062c95934b3a227b9b444d100e34d80'),(207,2,'20220927.232914.565-financas','2022-10-26 11:54:42','ffe96dbd3739e2484f7bdc312b762189'),(208,2,'20220927.232917.598-financas','2022-10-26 11:54:42','050ed3427873a80091b2e639ae52b36b'),(209,2,'20220927.232920.621-financas','2022-10-26 11:54:42','3a97c33612b08ba97c6943ecaf3cc4dd'),(210,2,'20220927.232923.657-financas','2022-10-26 11:54:42','eb0237dad88eeaedc9ffb3d66b985e6a'),(211,2,'20220927.232926.695-financas','2022-10-26 11:54:42','cf7fadc5d4078703fb232b0b757bd3a4'),(212,2,'20220927.232929.719-financas','2022-10-26 11:54:42','a069aff70d3e5fca9ab8f06ce296b306'),(213,2,'20220927.232932.746-financas','2022-10-26 11:54:42','51c576b1a38c7982bea0a33142bbc0d8'),(214,2,'20220927.232935.782-financas','2022-10-26 11:54:42','3f569b9b6885aa1606fa334a850ce8cc'),(215,2,'20220927.232938.815-financas','2022-10-26 11:54:42','cf01e90fae963f2f9d475770b62fbff4'),(216,2,'20220927.232941.849-financas','2022-10-26 11:54:42','57cca4bfd84257700fe67f7fa20fe111'),(217,2,'20220927.232944.888-financas','2022-10-26 11:54:42','aeb8006e3508c8dba8c0f70286dfc59a'),(218,2,'20220927.232947.917-financas','2022-10-26 11:54:42','6d499ff6e7c3d3698105f4d4b2d8a4cd'),(219,2,'20220927.232950.951-financas','2022-10-26 11:54:42','6d8c2ca385e9250ca3d7d0ef114f9b3c'),(220,2,'20220927.232953.974-financas','2022-10-26 11:54:42','0efeb37f5664861375cfec44d87e4947'),(221,2,'20220927.232957.014-financas','2022-10-26 11:54:42','eb00238de7e616c5b975f1091a5f9d5d'),(222,2,'20220927.233000.051-financas','2022-10-26 11:54:42','2c0cc6d5a04461a38ad482807a09adb1'),(223,2,'20220927.233003.079-financas','2022-10-26 11:54:42','c047144ce938fa5f5af8869a2db9af67'),(224,2,'20220927.233006.103-financas','2022-10-26 11:54:42','6548859ed48ff3d90f7eb9e1deacd3ae'),(225,2,'20220927.233009.138-financas','2022-10-26 11:54:42','9736c7bb2dfb07293345939ed755487a'),(226,2,'20220927.233012.173-financas','2022-10-26 11:54:42','b33b89ce078eeaadd339a36d8926b3e5'),(227,2,'20220927.233015.214-financas','2022-10-26 11:54:42','72297b4d09556fafb20c06016e0a8725'),(228,2,'20220927.233018.251-financas','2022-10-26 11:54:42','308df680b9397a5cb1783b7971406626'),(229,2,'20220927.233021.285-financas','2022-10-26 11:54:42','c53d8120c98ad975e6ef16fb4ace8cf7'),(230,2,'20220927.233024.319-financas','2022-10-26 11:54:42','ab5923f46f8a51c84fc3c7b8b3c77618'),(231,2,'20220927.233027.356-financas','2022-10-26 11:54:42','d908f9e5b9baffb5481815fbffc0d4ce'),(232,2,'20220927.233030.384-financas','2022-10-26 11:54:42','e5756d6ddd2d343b2f2e82b23d6f72db'),(233,2,'20220927.233033.418-financas','2022-10-26 11:54:42','da27632eb50ba4fcfa0b8454840c9654'),(234,2,'20220927.233036.448-financas','2022-10-26 11:54:42','40b648d4225ea080cb3f6289ae64ce50'),(235,2,'20220927.233039.475-financas','2022-10-26 11:54:42','0f1f33e2b563a2c7fc37a6cd70284762'),(236,2,'20220927.233042.508-financas','2022-10-26 11:54:42','cfa21575c064505b51596c605a2564cd'),(237,2,'20220927.233045.537-financas','2022-10-26 11:54:43','e8e4d50241f558120e154125026aeacb'),(238,2,'20220927.233048.574-financas','2022-10-26 11:54:43','59d1e10d1739a4459145c72bcffceef5'),(239,2,'20220927.233051.607-financas','2022-10-26 11:54:43','5547675100f91786736b6362d364bd30'),(240,2,'20220927.233054.633-financas','2022-10-26 11:54:43','18f95c85448c2423d7b403134edb4a64'),(241,2,'20220927.233057.670-financas','2022-10-26 11:54:43','a9a24cb39890d7dfc219266dd5a4fb7e'),(242,2,'20220927.233100.705-financas','2022-10-26 11:54:43','8d5b04d9b2ad56181b4b5fb807e45cff'),(243,2,'20220927.233103.739-financas','2022-10-26 11:54:43','67e559d9232ef6a96aeeae4df30a468d'),(244,2,'20220927.233106.773-financas','2022-10-26 11:54:43','5c87cf721a3cfab1115de009c256eb03'),(245,2,'20220927.233109.798-financas','2022-10-26 11:54:43','979e0f20cfbae78d1aa7ad64874fb10e'),(246,2,'20220927.233112.826-financas','2022-10-26 11:54:43','3e29fec74b0f99ceb47bdafe2815afa7'),(247,2,'20220927.233115.869-financas','2022-10-26 11:54:43','ce4b3e095a09c271b01a38b8559d7b26'),(248,2,'20220927.233118.907-financas','2022-10-26 11:54:43','926d05fc74e7858a160eba4abc1204c1'),(249,2,'20220927.233121.950-financas','2022-10-26 11:54:43','182c4a03299310161c7dcd43e2fa0456'),(250,2,'20220927.233124.971-financas','2022-10-26 11:54:43','95518b344ea9cdb77b78b935b6050c71'),(251,2,'20220927.233127.996-financas','2022-10-26 11:54:43','d939039c6303df1a334ffc57437748f4'),(252,2,'20220927.233131.020-financas','2022-10-26 11:54:43','d897078f2e16445658bc887d647a0307'),(253,2,'20220927.233134.048-financas','2022-10-26 11:54:43','b15cfa8895b0ce13dd0b9df24fb57ef5'),(254,2,'20220927.233137.082-financas','2022-10-26 11:54:43','4fe2580822bcca2f72adc1d3bc217f4e'),(255,2,'20220927.233140.114-financas','2022-10-26 11:54:43','4fa9976b3f7450df8fdbc39478cedb2f'),(256,2,'20220927.233143.138-financas','2022-10-26 11:54:43','3fdd409a411b4bc39c4673d09ecee1f3'),(257,2,'20220927.233146.165-financas','2022-10-26 11:54:43','c2b768b7448c92420e8952d49f9f49e2'),(258,2,'20220927.233149.197-financas','2022-10-26 11:54:43','ad9a96c3f361682f8984e16044d9cc1c'),(259,2,'20220927.233152.220-financas','2022-10-26 11:54:43','3ffc6a111df339b0ad1164ead61d1f71'),(260,2,'20220927.233155.254-financas','2022-10-26 11:54:43','e0f1ca6c57726e63255ea9f2df08c931'),(261,2,'20220927.233158.293-financas','2022-10-26 11:54:43','3d81adb42763139d984722fe41420502'),(262,2,'20220927.233201.333-financas','2022-10-26 11:54:43','10469c62039940ef628a7808087ef861'),(263,2,'20220927.233204.354-financas','2022-10-26 11:54:43','4e6acf07cd712ef6a186d657c1b52574'),(264,2,'20220927.233207.389-financas','2022-10-26 11:54:43','0f2e76885efa4a1f3ac12689b6da0c37'),(265,2,'20220927.233210.421-financas','2022-10-26 11:54:43','e8626ac59a715aec8b53064474313d17'),(266,2,'20220927.233213.451-financas','2022-10-26 11:54:43','6aabb0de87e381fb2d04ec177d8c7f58'),(267,2,'20220927.233216.484-financas','2022-10-26 11:54:43','8d641294984db66aa0d4381b2869bf72'),(268,2,'20220927.233219.516-financas','2022-10-26 11:54:43','23996233481d64d3883ad04d1ae0d20c'),(269,2,'20220927.233222.552-financas','2022-10-26 11:54:43','00228e5b0cdca102cadb036df6625557'),(270,2,'20220927.233225.592-financas','2022-10-26 11:54:43','661b95e274dc63306fe9ef3d4345f2c9'),(271,2,'20220927.233228.620-financas','2022-10-26 11:54:43','2825182068909f2cd222f30901d57628'),(272,2,'20220927.233231.649-financas','2022-10-26 11:54:43','fad496e85d8f64813a405652ceaf9b3e'),(273,2,'20220927.233234.669-financas','2022-10-26 11:54:43','8a0a053a63a4b04be4573fc12fcb57e0'),(274,2,'20220927.233237.700-financas','2022-10-26 11:54:43','02f1fa62785aecc2f4231e1b9e7ffef6'),(275,2,'20220927.233240.741-financas','2022-10-26 11:54:43','da94de64aa6ed617b0bfa60f73600ca7'),(276,2,'20220927.233243.772-financas','2022-10-26 11:54:43','ab6b0bd960262503f37a5b72de54e725'),(277,2,'20220927.233246.800-financas','2022-10-26 11:54:43','668cbfd4f3e95fc38eeb0e1cc355a75c'),(278,2,'20220927.233249.833-financas','2022-10-26 11:54:43','34d9836b9bce4b00879ad133ac427579'),(279,2,'20220927.233252.865-financas','2022-10-26 11:54:43','6378d47312c174a7c49ef8313a86f3dc'),(280,2,'20220927.233255.902-financas','2022-10-26 11:54:43','273b622478bf9747ae3e0ee4a3d9214c'),(281,2,'20220927.233258.928-financas','2022-10-26 11:54:43','1e6801537cdcb52875279a06dbbf6804'),(282,2,'20220927.233301.965-financas','2022-10-26 11:54:43','452ec0cc74f38c2d0e5e9bb2d86dc5ae'),(283,2,'20220927.233304.995-financas','2022-10-26 11:54:43','6b33e4e11027b8c5a9ef5ae92bf3324b'),(284,2,'20220927.233308.032-financas','2022-10-26 11:54:43','2039410af9f6016bc247ef9d4dd0f253'),(285,2,'20220927.233311.065-financas','2022-10-26 11:54:43','ed25c2f5989e3199c8a4de3ff2fe8ba3'),(286,2,'20220927.233314.087-financas','2022-10-26 11:54:43','876f2222b6167ee6684c48f98a35e0ad'),(287,2,'20220927.233317.123-financas','2022-10-26 11:54:43','c7aa8ee6ba62566a2182a2e0462f05d7'),(288,2,'20220927.233320.152-financas','2022-10-26 11:54:43','ecc39c92a1bc16108c8546dcf62d6366'),(289,2,'20220927.233323.176-financas','2022-10-26 11:54:43','cedd242e60e241bf944246889c21b504'),(290,2,'20220927.233326.216-financas','2022-10-26 11:54:43','a5b50acea5ee3bc94801ffc078245be7'),(291,2,'20220927.233329.250-financas','2022-10-26 11:54:43','22dc03a71521955d636391ccc6603fc4'),(292,2,'20220927.233332.286-financas','2022-10-26 11:54:43','f51d2762812625376d5daf74a75baa07'),(293,2,'20220927.233335.309-financas','2022-10-26 11:54:43','e325297fb82c311f0c92897428cb2c3c'),(294,2,'20220927.233338.333-financas','2022-10-26 11:54:43','aa6c8784ee4f6db068de11cebbbe3d3d'),(295,2,'20220927.233341.370-financas','2022-10-26 11:54:43','d7242a17995eae5e421db333dbdc8b1b'),(296,2,'20220927.233344.403-financas','2022-10-26 11:54:43','163c552086e662a8ca40b6e7148b1266'),(297,2,'20220927.233347.437-financas','2022-10-26 11:54:43','bac57c218cb1b524b69f5d3d8c751a20'),(298,2,'20220927.233350.473-financas','2022-10-26 11:54:43','a02a47ec5a58b3a3143a36fec01884c8'),(299,2,'20220927.233353.505-financas','2022-10-26 11:54:43','e1ae999ed1df0c6bc8e27aa44146565a'),(300,2,'20220927.233356.539-financas','2022-10-26 11:54:43','0f48a701f586ea661f67b049e61ca842'),(301,2,'20220927.233359.570-financas','2022-10-26 11:54:43','23d6a023c28c6cd2607ec85d782eff30'),(302,2,'20220927.233402.594-financas','2022-10-26 11:54:43','b8d9eadf351fb15d8ee1db49f23d79a2'),(303,2,'20220927.233405.621-financas','2022-10-26 11:54:43','62e7fba332ba4b814101fc1dab7505a7'),(304,2,'20220927.233408.650-financas','2022-10-26 11:54:43','fbdc153dfcd1dc127504e7d356af3fcf'),(305,2,'20220927.233411.675-financas','2022-10-26 11:54:43','520b1dee00387066889c73c9b75dcba7'),(306,2,'20220927.233414.710-financas','2022-10-26 11:54:43','20f4ec8b22c2773d9a982a103f80606c'),(307,2,'20220927.233417.737-financas','2022-10-26 11:54:43','8a1c0180055cf8443843f8b5ae353de1'),(308,2,'20220927.233420.764-financas','2022-10-26 11:54:43','082470d6f78273a02872c9bbf71b906f'),(309,2,'20220927.233423.788-financas','2022-10-26 11:54:43','a93909daae952ac41f066ff155b68fa4'),(310,2,'20220927.233426.817-financas','2022-10-26 11:54:43','8d17073f864509325187390adfebe3d2'),(311,2,'20220927.233429.843-financas','2022-10-26 11:54:43','4ecb6b22dffe9808b5619c1f464b920a'),(312,2,'20220927.233432.871-financas','2022-10-26 11:54:43','b01de06f0999d0888048d4c24c2eadc1'),(313,2,'20220927.233435.901-financas','2022-10-26 11:54:43','487aced78a0a6c637466871b6390cd55'),(314,2,'20220927.233438.928-financas','2022-10-26 11:54:43','e11eae9def330f5d56bdd8ba1a5ba16e'),(315,2,'20220927.233441.956-financas','2022-10-26 11:54:43','a5bb3c76278e37cbc7a77990c7dfe1db'),(316,2,'20220927.233444.994-financas','2022-10-26 11:54:43','c2dd9ed7dbc93ed018f20d3734da7915'),(317,2,'20220927.233448.030-financas','2022-10-26 11:54:43','2511a9381daa8af91b54bbc15b83659e'),(318,2,'20220927.233451.058-financas','2022-10-26 11:54:43','cae190ce0d0098feaf3ffc7ca0bc98de'),(319,2,'20220927.233454.093-financas','2022-10-26 11:54:43','32199a554aa664cd2c622209fb8314f1'),(320,2,'20220927.233457.121-financas','2022-10-26 11:54:43','164c83c26c579dd3b94a653736aa2093'),(321,2,'20220927.233500.160-financas','2022-10-26 11:54:43','8961e57dcaf60e246e1808a45465cb03'),(322,2,'20220927.233503.188-financas','2022-10-26 11:54:43','533f35e85d1f31039eb182fd7961056e'),(323,2,'20220927.233506.220-financas','2022-10-26 11:54:43','c836eaf8cde918e7fc24af52d108e4d1'),(324,2,'20220927.233509.252-financas','2022-10-26 11:54:43','66683422f1557504acd998475b038def'),(325,2,'20220927.233512.279-financas','2022-10-26 11:54:43','0bac27cbca4b47cb8797066f551d3337'),(326,2,'20220927.233515.317-financas','2022-10-26 11:54:43','3979e4df4ed403707497524e231cfdbb'),(327,2,'20220927.233518.346-financas','2022-10-26 11:54:43','f9e8f87d573e0ad050de955756853e70'),(328,2,'20220927.233521.383-financas','2022-10-26 11:54:43','6760d7fc3758c55303dbd3e953df8d6a'),(329,2,'20220927.233524.416-financas','2022-10-26 11:54:43','d9187cf0ed92fa2aca66b139b2986850'),(330,2,'20220927.233527.451-financas','2022-10-26 11:54:43','45847f6945f16f893e238f58589c6604'),(331,2,'20220927.233530.482-financas','2022-10-26 11:54:43','7fe011c3a00b1c52014b9667771e331d'),(332,2,'20220927.233533.508-financas','2022-10-26 11:54:43','f0bd6dec6c0d0c85730efd11cf3b9aae'),(333,2,'20220927.233536.538-financas','2022-10-26 11:54:43','aca6c7ee02c345f575103d6b3405a668'),(334,2,'20220927.233539.570-financas','2022-10-26 11:54:43','f27f46933b866a2fdf778b82da4ada88'),(335,2,'20220927.233542.602-financas','2022-10-26 11:54:43','4dc9739a9ba3ee5ac474425d05f2ec8a'),(336,2,'20220927.233545.635-financas','2022-10-26 11:54:43','cf4dba02bb3f507e2f43ed2a5fae3ed1'),(337,2,'20220927.233548.663-financas','2022-10-26 11:54:43','2a940576dc375429923a76b46fabca37'),(338,2,'20220927.233551.702-financas','2022-10-26 11:54:43','36270da4ea983e2be8f8640c142d0a1c'),(339,2,'20220927.233554.731-financas','2022-10-26 11:54:43','e55bd6ef6da239ba6bdb88a24e4aadb9'),(340,2,'20220927.233557.763-financas','2022-10-26 11:54:43','675d0a80e7f55b942d4d0a7cfa4a9fd7'),(341,2,'20220927.233600.787-financas','2022-10-26 11:54:43','dc76cbb137d7a97c7c431bb314ce7627'),(342,2,'20220927.233603.828-financas','2022-10-26 11:54:43','919e8ef8b4829b77c51227ab8d1e649b'),(343,2,'20220927.233606.856-financas','2022-10-26 11:54:43','e1d1a449d7a37f0c702e5912260104c7'),(344,2,'20220927.233609.882-financas','2022-10-26 11:54:43','a00e1fcebfb4d86da013c72732c30522'),(345,2,'20220927.233612.916-financas','2022-10-26 11:54:43','cc759b50c2946d2f7ff00dd251602d60'),(346,2,'20220927.233615.956-financas','2022-10-26 11:54:43','0f957033870d4cc181054604bd59a721'),(347,2,'20220927.233618.986-financas','2022-10-26 11:54:43','4e26c4f088c410764a96f527e46e4385'),(348,2,'20220927.233622.014-financas','2022-10-26 11:54:43','3ab86bfdbb1a2c69c63def320f5ab5a2'),(349,2,'20220927.233625.042-financas','2022-10-26 11:54:43','5e522bfc6d0cdcb0c5aea6f74fb8f15f'),(350,2,'20220927.233628.079-financas','2022-10-26 11:54:43','0a4579f2019c731c5981d7c9a61ca37a'),(351,2,'20220927.233631.113-financas','2022-10-26 11:54:43','514c9e5372191e8c8949b6d7f845ca5b'),(352,2,'20220927.233634.148-financas','2022-10-26 11:54:43','586f195ab0b7d2edbfee106a49e8a856'),(353,2,'20220927.233637.174-financas','2022-10-26 11:54:43','0afea038f3338a2322ce6fd31b5eb5b0'),(354,2,'20220927.233640.203-financas','2022-10-26 11:54:43','996502cbd86d346a6e329c437dfcfe64'),(355,2,'20220927.233643.239-financas','2022-10-26 11:54:43','ebce92dbbe439cb1b0f56bed60a197be'),(356,2,'20220927.233646.274-financas','2022-10-26 11:54:43','7c2a131d5a8603b961b16d69206813bd'),(357,2,'20220927.233649.314-financas','2022-10-26 11:54:43','9c19494551992bdd625b19f3f012db3c'),(358,2,'20220927.233652.341-financas','2022-10-26 11:54:43','0e7276daf24ddd4fe6b3d14e0467b58d'),(359,2,'20220927.233655.369-financas','2022-10-26 11:54:43','a06781bd2ec33539a811af8e1a4e2c09'),(360,2,'20220927.233658.406-financas','2022-10-26 11:54:43','5bb01c337c1d32f0640f9fbe8dd97a18'),(361,2,'20220927.233701.434-financas','2022-10-26 11:54:43','bbcbdf02ecdb552287639d0c428e1351'),(362,2,'20220927.233704.470-financas','2022-10-26 11:54:43','23b44d37a3e3c565badc9d87ce2e384c'),(363,2,'20220927.233707.503-financas','2022-10-26 11:54:43','fc388b780e50cb7153a4e9dc927327b6'),(364,2,'20220927.233710.545-financas','2022-10-26 11:54:43','b9d4dc4f778a7956ff622fcd61ef6bcb'),(365,2,'20220927.233713.585-financas','2022-10-26 11:54:43','9030aa6dc47f22636345763e4bac826a'),(366,2,'20220927.233716.615-financas','2022-10-26 11:54:43','1c4b82b909dfa21afe6fbcf7ed5ac275'),(367,2,'20220927.233719.646-financas','2022-10-26 11:54:43','0fb12407b7d74f3c741e51b6f2efde6d'),(368,2,'20220927.233722.675-financas','2022-10-26 11:54:43','a0fcbdbf764347525daf479bef809c77'),(369,2,'20220927.233725.702-financas','2022-10-26 11:54:43','b9bff862660752bb9b05cec82a5a2a06'),(370,2,'20220927.233728.733-financas','2022-10-26 11:54:43','d186bc6c015b85952b9811c2ccae3b38'),(371,2,'20220927.233731.770-financas','2022-10-26 11:54:43','db99f246bc3ee83f2572a223cd9976a4'),(372,2,'20220927.233734.803-financas','2022-10-26 11:54:43','13cf963f21836ae22be45b66b80546e4'),(373,2,'20220927.233737.839-financas','2022-10-26 11:54:43','415c8b69c80e6605566eac0e214c1ee8'),(374,2,'20220927.233740.871-financas','2022-10-26 11:54:43','371a4a90cf58dce9681e086795b02e88'),(375,2,'20220927.233743.907-financas','2022-10-26 11:54:43','9dd9ff6dd9586d6a3d8abd5041ed0d7f'),(376,2,'20220927.233746.934-financas','2022-10-26 11:54:43','3580bf29c963da4887def84633f0e8b6'),(377,2,'20220927.233749.963-financas','2022-10-26 11:54:43','a9403f33c4411ef788297adc977e74f1'),(378,2,'20220927.233753.003-financas','2022-10-26 11:54:43','53ceb32347cb0f25e8dafde4541db216'),(379,2,'20220927.233756.033-financas','2022-10-26 11:54:43','0462bead0d41dfa0dbde35743df711cb'),(380,2,'20220927.233759.067-financas','2022-10-26 11:54:43','7965479cab96bcc16cb3ff449b4a5640'),(381,2,'20220927.233802.099-financas','2022-10-26 11:54:43','2cba67032b7a76fe67a0de4c285389af'),(382,2,'20220927.233805.139-financas','2022-10-26 11:54:43','e99ce7872b757f749ddf24382b7786b1'),(383,2,'20220927.233808.164-financas','2022-10-26 11:54:43','03761af6b4acbe2bb1555f092adcd8e8'),(384,2,'20220927.233811.192-financas','2022-10-26 11:54:43','d826a170d0f0f499fa769f26f72d431e'),(385,2,'20220927.233814.222-financas','2022-10-26 11:54:43','262243ff06cb46befa0985762fa25208'),(386,2,'20220927.233817.252-financas','2022-10-26 11:54:43','fcb003adbf244236f792573302131afc'),(387,2,'20220927.233820.280-financas','2022-10-26 11:54:43','9738f1aa786628100f5e297e2935db3d'),(388,2,'20220927.233823.308-financas','2022-10-26 11:54:43','607048567e6e223bb3895cb3e68a3f90'),(389,2,'20220927.233826.348-financas','2022-10-26 11:54:43','cb4e8043bd864618f452b0ce2c0b0451'),(390,2,'20220927.233829.388-financas','2022-10-26 11:54:43','2216d274ef84630e8cd7a82a934b8bb7'),(391,2,'20220927.233832.426-financas','2022-10-26 11:54:43','27a61730a4a95a19421734dbaf5211e3'),(392,2,'20220927.233835.452-financas','2022-10-26 11:54:43','7653f158cb1155cdd25e74f96849a9cd'),(393,2,'20220927.233838.483-financas','2022-10-26 11:54:43','4223f24ceef7b07d35dc1042a830f5a1'),(394,2,'20220927.233841.510-financas','2022-10-26 11:54:43','3af9641378be55892602c54425e7ea4d'),(395,2,'20220927.233844.540-financas','2022-10-26 11:54:43','6d65e574ae6a8ce580cda1cf7048e89c'),(396,2,'20220927.233847.567-financas','2022-10-26 11:54:43','0a5889133fb1bdfb930675025872412a'),(397,2,'20220927.233850.604-financas','2022-10-26 11:54:43','3d270b31a534ad523734159ee4cbf7f0'),(398,2,'20220927.233853.626-financas','2022-10-26 11:54:43','d3be0b4f1287c7bdba15fef9bb8bb314'),(399,2,'20220927.233856.660-financas','2022-10-26 11:54:43','aaec767ab71db555a71cc594e981af5a'),(400,2,'20220927.233859.698-financas','2022-10-26 11:54:43','4e186e7c9c00252e0b39bbb82d307dd4'),(401,2,'20220927.233902.727-financas','2022-10-26 11:54:43','889b72208430a61da6dff7e565dd459d'),(402,2,'20220927.233905.755-financas','2022-10-26 11:54:43','0049d88422546b608faf4c88554611d6'),(403,2,'20220927.233908.783-financas','2022-10-26 11:54:43','f5055740d4a202aceee5e9d6f00f3e2a'),(404,2,'20220927.233911.822-financas','2022-10-26 11:54:43','7b5ab7452093b21782cbf9e9a8dc8287'),(405,2,'20220927.233914.848-financas','2022-10-26 11:54:43','d90e9913c9f6e135bca1292fe2262edb'),(406,2,'20220927.233917.883-financas','2022-10-26 11:54:43','8eacb31a446b8b772b626456ed222ba9'),(407,2,'20220927.233920.911-financas','2022-10-26 11:54:43','0c80d867cf783904fa6b2f6f6b31865b'),(408,2,'20220927.233923.943-financas','2022-10-26 11:54:43','589393276b9aaaadc87a815d314e5d45'),(409,2,'20220927.233926.980-financas','2022-10-26 11:54:43','99678c8af25388abc56e708d75cdf102'),(410,2,'20220927.233930.002-financas','2022-10-26 11:54:43','a0fe5a1b28bad869ed93eeb0688d6d37'),(411,2,'20220927.233933.033-financas','2022-10-26 11:54:43','3749f3895e07e155ab6d809908202c7f'),(412,2,'20220927.233936.059-financas','2022-10-26 11:54:43','61d8832685fe416c2057652017ec0cb3'),(413,2,'20220927.233939.083-financas','2022-10-26 11:54:43','5c5385524b2af1c50ed7e32bb1cead1d'),(414,2,'20220927.233942.114-financas','2022-10-26 11:54:43','f5b48f7a8682566d61176b29b5665d72'),(415,2,'20220927.233945.146-financas','2022-10-26 11:54:43','1d14877b82b5a70bd6bceb9f9a9b11ef'),(416,2,'20220927.233948.182-financas','2022-10-26 11:54:43','84a891e8470e90686d863c3ccedc6019'),(417,2,'20220927.233951.214-financas','2022-10-26 11:54:43','205d049e13f10114cf9b6006289c8eea'),(418,2,'20220927.233954.246-financas','2022-10-26 11:54:43','3632f1f3780b4f8625d635f46ab7b7c7'),(419,2,'20220927.233957.277-financas','2022-10-26 11:54:43','6231aafae252058629601f509b1ff404'),(420,2,'20220927.234000.314-financas','2022-10-26 11:54:43','a870634a1dc99e9e4379e004d8ea9e05'),(421,2,'20220927.234003.355-financas','2022-10-26 11:54:43','20cf6e99181ce24d31b84dbac786dedf'),(422,2,'20220927.234006.387-financas','2022-10-26 11:54:43','ab53ffbfa116951af88e7bda783542ab'),(423,2,'20220927.234009.422-financas','2022-10-26 11:54:43','34d4ce021b1a240392d50cc7b08fe078'),(424,2,'20220927.234012.459-financas','2022-10-26 11:54:43','b8fb3ec915a581bd17aecad2a9b99364'),(425,2,'20220927.234015.492-financas','2022-10-26 11:54:43','2275c6b0b24d00ec0cbf270efe8a96f5'),(426,2,'20220927.234018.526-financas','2022-10-26 11:54:43','0de0300119772172da1e1aa279e0f30f'),(427,2,'20220927.234021.564-financas','2022-10-26 11:54:43','b9a6b7f4c5f60e04f6ac55f62b949b21'),(428,2,'20220927.234024.597-financas','2022-10-26 11:54:43','b1e82d9062d0b419539713b31503d047'),(429,2,'20220927.234027.624-financas','2022-10-26 11:54:43','c682aec4a49ec16cf9866b2a5e381f65'),(430,2,'20220927.234030.652-financas','2022-10-26 11:54:43','5133df61ebd81255313fbfcb69a79219'),(431,2,'20220927.234033.680-financas','2022-10-26 11:54:43','ae886819c34b88c29cb0719f28bad1ad'),(432,2,'20220927.234036.716-financas','2022-10-26 11:54:43','e63a32f28031fcc604f1737d652523c8'),(433,2,'20220927.234039.750-financas','2022-10-26 11:54:43','689a8f0df0f6a90b6f1a7a206395784c'),(434,2,'20220927.234042.783-financas','2022-10-26 11:54:43','b4816b20354afa5472ab04e33833428a'),(435,2,'20220927.234045.824-financas','2022-10-26 11:54:43','f96e6faade78efc6d2fdff5a4c5ce459'),(436,2,'20220927.234048.861-financas','2022-10-26 11:54:43','f01921f1e496e0306b8fe01944b1bae6'),(437,2,'20220927.234051.896-financas','2022-10-26 11:54:43','a11536b6223320e1533136e23b325ec0'),(438,2,'20220927.234054.919-financas','2022-10-26 11:54:43','83522b6297ce86f0831a089c3162984a'),(439,2,'20220927.234057.948-financas','2022-10-26 11:54:43','7a7983d871f9cbfb2e0c85a6be214e54'),(440,2,'20220927.234100.982-financas','2022-10-26 11:54:43','9dba32d7637e378400a0eb4cc8477b20'),(441,2,'20220927.234104.009-financas','2022-10-26 11:54:43','d834709d35d092a38eea027df2468cee'),(442,2,'20220927.234107.042-financas','2022-10-26 11:54:43','4ae3ea2547a82efe09d91706fc5ffb72'),(443,2,'20220927.234110.074-financas','2022-10-26 11:54:43','fa5439abadb74691b03f722c74af2cea'),(444,2,'20220927.234113.111-financas','2022-10-26 11:54:43','f29d11a88ece575569af6d88e0786c97'),(445,2,'20220927.234116.143-financas','2022-10-26 11:54:43','e52b0757b335998bbe28393386c6af72'),(446,2,'20220927.234119.177-financas','2022-10-26 11:54:43','80fb0dea69858edbdfe676e49dfeb49d'),(447,2,'20220927.234122.223-financas','2022-10-26 11:54:43','4de877f853ca774664a27cd0953e5e75'),(448,2,'20220927.234125.250-financas','2022-10-26 11:54:43','c0aeebb2a76403cf534ee7a1a161e19e'),(449,2,'20220927.234128.279-financas','2022-10-26 11:54:43','66756361927f499bfc6ed48acab04482'),(450,2,'20220927.234131.309-financas','2022-10-26 11:54:43','000f6272fbd8a9363d61250473838879'),(451,2,'20220927.234134.344-financas','2022-10-26 11:54:43','d7cd40cdbeb5efdeeec853bbd3198344'),(452,2,'20220927.234137.383-financas','2022-10-26 11:54:43','df135627b01c999822ed785cbf9474b5'),(453,2,'20220927.234140.415-financas','2022-10-26 11:54:43','eecd7ba80274cdcfafddaeef72ed78c6'),(454,2,'20220927.234143.438-financas','2022-10-26 11:54:43','90a8c8bfa37899401b50824c574b3514'),(455,2,'20220927.234146.463-financas','2022-10-26 11:54:43','1ea0af1c829702dadba20d8aef1f2467'),(456,2,'20220927.234149.499-financas','2022-10-26 11:54:43','2371efe3ef2b2c675658c51583fbbe1f'),(457,2,'20220927.234152.529-financas','2022-10-26 11:54:43','d65420fc8ca19b84a63c305fc24b13b5'),(458,2,'20220927.234155.560-financas','2022-10-26 11:54:43','08c355f5a1e7c17e9aca2f44ee2cc33f'),(459,2,'20220927.234158.602-financas','2022-10-26 11:54:43','9dae425aefa27d41d75b0b710a73b885'),(460,2,'20220927.234201.632-financas','2022-10-26 11:54:43','707242e80bfb4063e552d59a1f5d3272'),(461,2,'20220927.234204.659-financas','2022-10-26 11:54:43','19243d42b142d3b5a6e55124a79e7465'),(462,2,'20220927.234207.685-financas','2022-10-26 11:54:43','88ec7c640c6c181856d5024c88bd5674'),(463,2,'20220927.234210.720-financas','2022-10-26 11:54:43','27be5c0527b8447cf8525ad54e46343f'),(464,2,'20220927.234213.750-financas','2022-10-26 11:54:43','7eb84e0fd942658dc4d4d9901537591d'),(465,2,'20220927.234216.790-financas','2022-10-26 11:54:43','2473aa6804d482343a536aa6f0fa4d57'),(466,2,'20220927.234219.817-financas','2022-10-26 11:54:43','65c4673a2b12851cdd202db154aa11c9'),(467,2,'20220927.234222.846-financas','2022-10-26 11:54:43','83646ad5a49544b5ae06a9544ce87ada'),(468,2,'20220927.234225.877-financas','2022-10-26 11:54:43','a46fc27ad32ba1e22332206f1f62e2fa'),(469,2,'20220927.234228.905-financas','2022-10-26 11:54:43','7736d0821ea92e0875cffdb017c87012'),(470,2,'20220927.234231.935-financas','2022-10-26 11:54:43','a75ed4d93ef9ed04eacf811fad2a8347'),(471,2,'20220927.234234.973-financas','2022-10-26 11:54:43','e3825d821950c08fe97e37be34fb2d9b'),(472,2,'20220927.234237.995-financas','2022-10-26 11:54:43','fac27992f12419f5ea2ea6caf6f746b4'),(473,2,'20220927.234241.022-financas','2022-10-26 11:54:43','2ea573568603c78547a494b809d40284'),(474,2,'20220927.234244.049-financas','2022-10-26 11:54:43','6a45c82c14f47f29cfac706d04cc9de4'),(475,2,'20220927.234247.072-financas','2022-10-26 11:54:43','8f469c163c2d0fa08641d0cccaac92dd'),(476,2,'20220927.234250.102-financas','2022-10-26 11:54:43','5961af361cb110e945e685df833ee4e2'),(477,2,'20220927.234253.132-financas','2022-10-26 11:54:43','9c822ba44efef99c3dd6fc7e163553f0'),(478,2,'20220927.234256.154-financas','2022-10-26 11:54:43','2da6afaa93f51028ce9f6c826f752a19'),(479,2,'20220927.234259.185-financas','2022-10-26 11:54:43','4d24ed2840434d332a723706821714fd'),(480,2,'20220927.234302.226-financas','2022-10-26 11:54:43','7b7b78dbeef9bd5fbcd1109e7dca00c5'),(481,2,'20220927.234305.266-financas','2022-10-26 11:54:43','c46b22200012499aba6522aedb1fa043'),(482,2,'20220927.234308.285-financas','2022-10-26 11:54:43','0b34a400a73ea86bd4fff927de8ef25b'),(483,2,'20220927.234311.309-financas','2022-10-26 11:54:43','16b470c39cbd038613fd1c1d0dfcef36'),(484,2,'20220927.234314.346-financas','2022-10-26 11:54:43','c78823358d2c03bc91a2c00cb17c56bc'),(485,2,'20220927.234317.371-financas','2022-10-26 11:54:43','e50ec3a642a15fbe4a37b33ff00b2029'),(486,2,'20220927.234320.407-financas','2022-10-26 11:54:43','25bc3e8e493bd9a92ab0c1f181a85bf3'),(487,2,'20220927.234323.442-financas','2022-10-26 11:54:43','8dcf808e73e9e9d866db2d97a08171fc'),(488,2,'20220927.234326.470-financas','2022-10-26 11:54:43','516a5568b169e75a1069bb4edb0ca636'),(489,2,'20220927.234329.500-financas','2022-10-26 11:54:43','80700ea5cd450e7493ae05ef3fcf3190'),(490,2,'20220927.234332.536-financas','2022-10-26 11:54:43','c07fd9402406b86e50f268bf13f4e188'),(491,2,'20220927.234335.565-financas','2022-10-26 11:54:43','6ada1fe1b1806567e97f38e3c0931f06'),(492,2,'20220927.234338.589-financas','2022-10-26 11:54:43','980ba3be911b577c34bd23f47f676941'),(493,2,'20220927.234341.613-financas','2022-10-26 11:54:43','015d3cf697e40d79c81c152cfc8e0e6c'),(494,2,'20220927.234344.648-financas','2022-10-26 11:54:43','1250c8f8edc0973ae1ea2bfd1f005aa4'),(495,2,'20220927.234347.686-financas','2022-10-26 11:54:43','b17fd564521df63761a210d043d21ccc'),(496,2,'20220927.234350.718-financas','2022-10-26 11:54:43','a33d9ea4df555f84882e038738be9ff8'),(497,2,'20220927.234353.754-financas','2022-10-26 11:54:43','2dbbcb1c6cdb91b6612ac685c81bb9dd'),(498,2,'20220927.234356.786-financas','2022-10-26 11:54:43','88c4a1d8d7e324533ce69765c6b5f75f'),(499,2,'20220927.234359.815-financas','2022-10-26 11:54:43','c82cfe2a488229b15b27c0d1ecefeb01'),(500,2,'20220927.234402.850-financas','2022-10-26 11:54:43','e84dd1b3ba6e37ad77b36036aaa11e0e'),(501,2,'20220927.234405.879-financas','2022-10-26 11:54:43','1e649add174f858b88eaca820ac734d6'),(502,2,'20220927.234408.909-financas','2022-10-26 11:54:43','0f7d127e2109f7673efe4b752b086797'),(503,2,'20220927.234411.945-financas','2022-10-26 11:54:43','3b399b98f6bbacbb0d3d68dcb27212fe'),(504,2,'20220927.234414.973-financas','2022-10-26 11:54:43','2c249b1f5a3d75d4dddd036be040d9af'),(505,2,'20220927.234418.005-financas','2022-10-26 11:54:43','3c003106a17477cc63ad56c086955a92'),(506,2,'20220927.234421.033-financas','2022-10-26 11:54:43','eb0d207f0d5fa33ca5d3e1b91c569f2d'),(507,2,'20220927.234424.053-financas','2022-10-26 11:54:43','8ae7823f4a7359a2626fbcdee875bd1f'),(508,2,'20220927.234427.086-financas','2022-10-26 11:54:43','24d5cefa19d42187e5203462fc7f59ee'),(509,2,'20220927.234430.124-financas','2022-10-26 11:54:43','a44045870982b816f2583ce722c6819e'),(510,2,'20220927.234433.150-financas','2022-10-26 11:54:43','3a9cb67171f45f1cf51ba17c74c942b4'),(511,2,'20220927.234436.187-financas','2022-10-26 11:54:43','06b005e4db3418ad30b43136f586a0b0'),(512,2,'20220927.234439.218-financas','2022-10-26 11:54:43','afa1bc58ab41ef056cef03335873f0ff'),(513,2,'20220927.234442.242-financas','2022-10-26 11:54:43','201d672ee7bc3604760d4647e4f716bb'),(514,2,'20220927.234445.280-financas','2022-10-26 11:54:43','7bb678c82a1a2436672f35e2c9206b89'),(515,2,'20220927.234448.302-financas','2022-10-26 11:54:43','0235e71f3d3cf35433e2db7e1dc6e4d0'),(516,2,'20220927.234451.337-financas','2022-10-26 11:54:43','9bc391769c591e646ef24bd270aa02d1'),(517,2,'20220927.234454.363-financas','2022-10-26 11:54:43','0334c3e28c6f54697cfe817e1bf7bdc6'),(518,2,'20220927.234457.399-financas','2022-10-26 11:54:43','931b68406ee031daff5281615c83b235'),(519,2,'20220927.234500.428-financas','2022-10-26 11:54:43','464daa2d5474f7bdad2e9aab733b5960'),(520,2,'20220927.234503.466-financas','2022-10-26 11:54:43','4c3de9071b62a198720bb3b060fb8e26'),(521,2,'20220927.234506.492-financas','2022-10-26 11:54:43','da5f9cb5b0f261c4ba9641ce182c37cb'),(522,2,'20220927.234509.515-financas','2022-10-26 11:54:43','bf6e023e0859c2889eddfa45a2170135'),(523,2,'20220927.234512.544-financas','2022-10-26 11:54:43','40cde9b8c2e332c6b4e34ab80c82b12f'),(524,2,'20220927.234515.573-financas','2022-10-26 11:54:43','d0a755656136661610bb23378b29217d'),(525,2,'20220927.234518.607-financas','2022-10-26 11:54:43','8bbd296f133b8daef734a276dbe13eb5'),(526,2,'20220927.234521.650-financas','2022-10-26 11:54:43','c4fae2c609659c8d4c165b9d3ad96629'),(527,2,'20220927.234524.691-financas','2022-10-26 11:54:43','658a727b43f64af99796cd6eb1cd206b'),(528,2,'20220927.234527.727-financas','2022-10-26 11:54:43','38e822e874cb530d219af354bbce4b7b'),(529,2,'20220927.234530.755-financas','2022-10-26 11:54:43','86f75fc84932463dfaca842dc1d59ce6'),(530,2,'20220927.234533.783-financas','2022-10-26 11:54:43','ef3a0f274784f0baea42241d3b196952'),(531,2,'20220927.234536.811-financas','2022-10-26 11:54:43','c3bdeb78b50db983db1fb6d488b4b6e0'),(532,2,'20220927.234539.840-financas','2022-10-26 11:54:43','23e3d0f373df753026bd640cf0158eca'),(533,2,'20220927.234542.875-financas','2022-10-26 11:54:43','827a65c3cdc5009262ebc19d9c3225f7'),(534,2,'20220927.234545.915-financas','2022-10-26 11:54:43','f642f1b9073c769893ca0d2f4a3accb0'),(535,2,'20220927.234548.943-financas','2022-10-26 11:54:43','8a24b2ee3954d3ae9af20392d6609628'),(536,2,'20220927.234551.965-financas','2022-10-26 11:54:43','1eb9db04b9804b447d696f383f77166e'),(537,2,'20220927.234554.999-financas','2022-10-26 11:54:43','5d505c05268b1f9b4386383a6bd1e9c7'),(538,2,'20220927.234558.033-financas','2022-10-26 11:54:43','fdf5aa9fad54526ae67ecf8841a72451'),(539,2,'20220927.234601.061-financas','2022-10-26 11:54:43','6e6a94f8725b8618068ffcd56de2fc92'),(540,2,'20220927.234604.087-financas','2022-10-26 11:54:43','35eb8a75e92aff9b7d2905cd0ef91fb2'),(541,2,'20220927.234607.113-financas','2022-10-26 11:54:43','aa0eb8d89b8b72f7a4a08ed62cf07c54'),(542,2,'20220927.234610.142-financas','2022-10-26 11:54:43','14ae85462a294b3d1082f6b5a5a51a6c'),(543,2,'20220927.234613.167-financas','2022-10-26 11:54:43','16a66b1c4a8a85f9d9e3fabd6a156067'),(544,2,'20220927.234616.199-financas','2022-10-26 11:54:43','a0775cca2437f3f6011fd4372e3f8cc3'),(545,2,'20220927.234619.225-financas','2022-10-26 11:54:43','c8b06c5d158ea4aec132240d91a4d01c'),(546,2,'20220927.234622.260-financas','2022-10-26 11:54:43','5149888e3a17b2125fc3a2644e9745f7'),(547,2,'20220927.234625.281-financas','2022-10-26 11:54:43','4ce7edfe27821ffa0057f47c96dc70c6'),(548,2,'20220927.234628.310-financas','2022-10-26 11:54:43','ccda7ff58f62ef8ff7ee2eca29fd4694'),(549,2,'20220927.234631.345-financas','2022-10-26 11:54:43','e2eb7719300f78f2fea5594f7172dca1'),(550,2,'20220927.234634.367-financas','2022-10-26 11:54:43','4c467d73e8e5a6729dad286aab04f7f4'),(551,2,'20220927.234637.395-financas','2022-10-26 11:54:43','934cb27222fdb24fcf3027f357002d4c'),(552,2,'20220927.234640.433-financas','2022-10-26 11:54:43','a8365ef6a95bd878bc5262807a0a75b8'),(553,2,'20220927.234643.466-financas','2022-10-26 11:54:43','b2952ad4705a47b9b8466a83cf6a2b34'),(554,2,'20220927.234646.499-financas','2022-10-26 11:54:43','fdc0b92975fd9d60e12df5bc9a84ea53'),(555,2,'20220927.234649.531-financas','2022-10-26 11:54:43','bba1e78b00c0bd6639817154398f29ba'),(556,2,'20220927.234652.558-financas','2022-10-26 11:54:43','118be2ba030bc57e90afa1905467d8b0'),(557,2,'20220927.234655.593-financas','2022-10-26 11:54:43','de4be115d804cebecb22988157c13e9c'),(558,2,'20220927.234658.628-financas','2022-10-26 11:54:43','57298fc372a9aca39d70fbadfc8fa01a'),(559,2,'20220927.234701.655-financas','2022-10-26 11:54:43','92a9818f8f69738b5f2c55cffd219828'),(560,2,'20220927.234704.694-financas','2022-10-26 11:54:43','72d9b44e7f8c19b5c4ea15b8ef4213aa'),(561,2,'20220927.234707.731-financas','2022-10-26 11:54:43','9bb6201541ed4bf1b0d77f3aa4bba103'),(562,2,'20220927.234710.762-financas','2022-10-26 11:54:43','7154281812ab48e2f2bcb994718475f7'),(563,2,'20220927.234713.798-financas','2022-10-26 11:54:43','8e636c7e95dadada999d9cf6dc0a86fc'),(564,2,'20220927.234716.828-financas','2022-10-26 11:54:43','15cae2f4cf288a0409579a49e924567e'),(565,2,'20220927.234719.859-financas','2022-10-26 11:54:43','dcc3daf236414ca72cac9200b2ec3204'),(566,2,'20220927.234722.892-financas','2022-10-26 11:54:43','3b1c4e7175d7b9dfa1f73bb3cf77e9e5'),(567,2,'20220927.234725.924-financas','2022-10-26 11:54:43','f3a3d02df92f9e0e86255133ed68ec27'),(568,2,'20220927.234728.952-financas','2022-10-26 11:54:43','447304dbce5c80ab288af83d06a2b5ad'),(569,2,'20220927.234731.973-financas','2022-10-26 11:54:43','17d40432fb7a31c2fc6fddc5f8538a19'),(570,2,'20220927.234735.011-financas','2022-10-26 11:54:43','acbc574a1abba4a2fd8ef825b2e7a044'),(571,2,'20220927.234738.038-financas','2022-10-26 11:54:43','283b182fd8784211d4d29b40a7168d47'),(572,2,'20220927.234741.072-financas','2022-10-26 11:54:43','f894d2f58f2d710fd866f862e8dd6dd5'),(573,2,'20220927.234744.110-financas','2022-10-26 11:54:43','8a39a5de53d4ae1ad142494aa2581a2b'),(574,2,'20220927.234747.131-financas','2022-10-26 11:54:43','54ce04c9595f3e60ed307dff50459ff4'),(575,2,'20220927.234750.167-financas','2022-10-26 11:54:43','aa17a3838bdcab19e0e3bd0578b6170a'),(576,2,'20220927.234753.206-financas','2022-10-26 11:54:43','2c9680d286a46c5ca9df3a0d40527a5f'),(577,2,'20220927.234756.227-financas','2022-10-26 11:54:43','ccd047eca3ab88ab599d7beef8ca7984'),(578,2,'20220927.234759.250-financas','2022-10-26 11:54:43','8e42884c9f04fd9ec772653c5b96d0d2'),(579,2,'20220927.234802.280-financas','2022-10-26 11:54:43','ff750a0df37ace3440b79aa82c12f7ec'),(580,2,'20220927.234805.310-financas','2022-10-26 11:54:43','4c7dedba758ff9074b191eae9fe809a0'),(581,2,'20220927.234808.348-financas','2022-10-26 11:54:43','cbe27823dc156c234bd73f872be99f0b'),(582,2,'20220927.234811.383-financas','2022-10-26 11:54:43','b779af6d9738fe9596f57b73b4ca1807'),(583,2,'20220927.234814.409-financas','2022-10-26 11:54:43','c657838a08789fc96131bc8fa36f7860'),(584,2,'20220927.234817.434-financas','2022-10-26 11:54:43','c94597a40757d825f8aede18b1778b3e'),(585,2,'20220927.234820.463-financas','2022-10-26 11:54:43','0f403f50928162c043aa69f2bbfe8f85'),(586,2,'20220927.234823.502-financas','2022-10-26 11:54:43','4d80ddf1662a994238368a784d8931de'),(587,2,'20220927.234826.538-financas','2022-10-26 11:54:43','519013dfc2e1f64e9305f2871d1d3f34'),(588,2,'20220927.234829.575-financas','2022-10-26 11:54:43','184e90377d5c718746bd682b6467ad3d'),(589,2,'20220927.234832.602-financas','2022-10-26 11:54:43','3712c9da0fd03e0a67e7bd5e6c6fc745'),(590,2,'20220927.234835.630-financas','2022-10-26 11:54:43','d56422f2a41d565539a393c517cb7859'),(591,2,'20220927.234838.660-financas','2022-10-26 11:54:43','f0ac5d3b0bf0cf4e8f81053971622235'),(592,2,'20220927.234841.690-financas','2022-10-26 11:54:43','7b80db276e48ace4a00e109334087ba1'),(593,2,'20220927.234844.722-financas','2022-10-26 11:54:43','4e8f2efac57a48fe5bcaca66157e527f'),(594,2,'20220927.234847.754-financas','2022-10-26 11:54:43','496136f616cc6c7f642ed2aad61a863e'),(595,2,'20220927.234850.785-financas','2022-10-26 11:54:43','3863e644c391a4a4c9780e1d86f03db1'),(596,2,'20220927.234853.816-financas','2022-10-26 11:54:43','ee1e2c0da0bdfba8c6cfa1af2b3fd957'),(597,2,'20220927.234856.851-financas','2022-10-26 11:54:43','136d9172997495c3b378b637b5865c07'),(598,2,'20220927.234859.884-financas','2022-10-26 11:54:43','be92e13c6a0d050a5f31910c6a3ca38e'),(599,2,'20220927.234902.915-financas','2022-10-26 11:54:43','b5f78ede4dedb3177d04ecd09ff1a6b8'),(600,2,'20220927.234905.942-financas','2022-10-26 11:54:43','631216ca13116c8eb18a767f68f0f448'),(601,2,'20220927.234908.972-financas','2022-10-26 11:54:43','59837960b38d8c08b584c45983d5bb64'),(602,2,'20220927.234912.012-financas','2022-10-26 11:54:43','202783e9fec83dc88059c1177baa5e4a'),(603,2,'20220927.234915.041-financas','2022-10-26 11:54:43','e43e78de385c0eff09f75d505e3db3ce'),(604,2,'20220927.234918.072-financas','2022-10-26 11:54:43','cd468f8156ddd4f21c8443f3f74e4543'),(605,2,'20220927.234921.102-financas','2022-10-26 11:54:43','1d2d2a6bfb1b725d1acbaee20dcf36e0'),(606,2,'20220927.234924.137-financas','2022-10-26 11:54:43','7ef3d85040fb1618f011ed48f04975be'),(607,2,'20220927.234927.161-financas','2022-10-26 11:54:43','30ced0baaf5ad02dd4c2d8c712133d63'),(608,2,'20220927.234930.194-financas','2022-10-26 11:54:43','9db9cc7f192c86226d8bfccab9913882'),(609,2,'20220927.234933.230-financas','2022-10-26 11:54:43','87eaf55642bdf682951bf230e93375d8'),(610,2,'20220927.234936.271-financas','2022-10-26 11:54:43','8438b9ff5a76d844577ea96ebecdf1c3'),(611,2,'20220927.234939.304-financas','2022-10-26 11:54:43','e85480acc73a5228ad1aecf48d0e1018'),(612,2,'20220927.234942.345-financas','2022-10-26 11:54:43','448ace5911748fc1d8b3bfbf58ea6879'),(613,2,'20220927.234945.373-financas','2022-10-26 11:54:43','6b37c8d7bd728f83c4e429010938764a'),(614,2,'20220927.234948.402-financas','2022-10-26 11:54:43','433bf7fe2c3a9a121120473403f0baa0'),(615,2,'20220927.234951.434-financas','2022-10-26 11:54:43','8ea6feb5bc69c285ceb4677ef6821f0c'),(616,2,'20220927.234954.459-financas','2022-10-26 11:54:43','ace28cc481dc4241d859586e462c2e46'),(617,2,'20220927.234957.495-financas','2022-10-26 11:54:43','061816268ee58ace88447356bf4c04f1'),(618,2,'20220927.235000.524-financas','2022-10-26 11:54:43','d7cc885ad84c369b95b112f6bf5b55e3'),(619,2,'20220927.235003.563-financas','2022-10-26 11:54:43','f5fa2c80c71d45d8d16c50fe257db258'),(620,2,'20220927.235006.601-financas','2022-10-26 11:54:43','33f9909207682da86a47f83c7f255b4c'),(621,2,'20220927.235009.641-financas','2022-10-26 11:54:43','5a5b6a3fb4fab134ab90eb7077619bc8'),(622,2,'20220927.235012.672-financas','2022-10-26 11:54:43','1cd36ce89941f035bcf769491a89d8e7'),(623,2,'20220927.235015.708-financas','2022-10-26 11:54:43','30a80d234d0c9eff5d0086400541c087'),(624,2,'20220927.235018.735-financas','2022-10-26 11:54:43','9b86553b8254b0d66741d64457ae9acd'),(625,2,'20220927.235021.757-financas','2022-10-26 11:54:43','fddc551b73ada5ba1b96b15c0a537b82'),(626,2,'20220927.235024.793-financas','2022-10-26 11:54:43','6190b5d05171869e42c49737379c0de5'),(627,2,'20220927.235027.823-financas','2022-10-26 11:54:43','d269c3fd0f28c97115a059f91b1521bb'),(628,2,'20220927.235030.846-financas','2022-10-26 11:54:43','e78f8f70f510c493feef710538972749'),(629,2,'20220927.235033.878-financas','2022-10-26 11:54:43','f3fb96f7d780747fa7c0e5907530bf14'),(630,2,'20220927.235036.915-financas','2022-10-26 11:54:43','5789bf31c1567fae1d535b7dace625ce'),(631,2,'20220927.235039.947-financas','2022-10-26 11:54:43','3b86b22066ee6fd9e39754d3136c82f4'),(632,2,'20220927.235042.973-financas','2022-10-26 11:54:43','80ffb5b8d80549af25d51ef600478753'),(633,2,'20220927.235046.013-financas','2022-10-26 11:54:43','653a77e6009e52bbb9dd8f3f26bd2064'),(634,2,'20220927.235049.050-financas','2022-10-26 11:54:43','61d4244159621de801f0eecdfbba8d27'),(635,2,'20220927.235052.078-financas','2022-10-26 11:54:43','9b6c998853d6190d81e5bfc4a5c7e2cf'),(636,2,'20220927.235055.115-financas','2022-10-26 11:54:43','0d42de0e6b9cc91c7ccc0bd5f653828f'),(637,2,'20220927.235058.144-financas','2022-10-26 11:54:43','ab2d75665852d6cc42af636cbf1ff7af'),(638,2,'20220927.235101.172-financas','2022-10-26 11:54:43','9eb7186d4e7a2da8ad6861487859a6e8'),(639,2,'20220927.235104.194-financas','2022-10-26 11:54:43','d0f2bcf9c5a3d242a07a0f783d4c42a8'),(640,2,'20220927.235107.216-financas','2022-10-26 11:54:43','071d92d33ba469592ad7b580a408d55a'),(641,2,'20220927.235110.249-financas','2022-10-26 11:54:43','8aef9095a03434441ed0b5d4a0caa9c2'),(642,2,'20220927.235113.276-financas','2022-10-26 11:54:43','05a1332c6740bb1ce9bceeb2e73a3481'),(643,2,'20220927.235116.302-financas','2022-10-26 11:54:43','885a6a96c7a60669453e2d1cd3753fd8'),(644,2,'20220927.235119.328-financas','2022-10-26 11:54:43','de08d7ac2b519673d89f7f05c0f64528'),(645,2,'20220927.235122.351-financas','2022-10-26 11:54:43','85f16db6946eda139aa95b160e751bd5'),(646,2,'20220927.235125.386-financas','2022-10-26 11:54:43','2b316620be7fa0cf5ea618f745a7b8fc'),(647,2,'20220927.235128.420-financas','2022-10-26 11:54:43','9eb3edd86a0302ab0514f07e0f6b4986'),(648,2,'20220927.235131.460-financas','2022-10-26 11:54:43','8de9dc976782cdaab3efb32cbd606cb8'),(649,2,'20220927.235134.496-financas','2022-10-26 11:54:43','6f5991f5c6414e5f73f33c870a4a10fd'),(650,2,'20220927.235137.532-financas','2022-10-26 11:54:43','748382c45be6c748324f88c96d461aa4'),(651,2,'20220927.235140.567-financas','2022-10-26 11:54:43','9f0c63dfd007d924c0b86bd7a99d735c'),(652,2,'20220927.235143.592-financas','2022-10-26 11:54:43','6e079e9ecf9217459daf50b6c5194be9'),(653,2,'20220927.235146.623-financas','2022-10-26 11:54:43','4a13823a67bb77009e52a6d28dfb21f1'),(654,2,'20220927.235149.654-financas','2022-10-26 11:54:43','836ad1a132da26fba096336d5352f163'),(655,2,'20220927.235152.687-financas','2022-10-26 11:54:43','ca225d674c96bae72482215378cdedd6'),(656,2,'20220927.235155.719-financas','2022-10-26 11:54:43','6130c7c71eaf19a0c21b062204ad4c86'),(657,2,'20220927.235158.761-financas','2022-10-26 11:54:43','06d4154a053eab59e071c1135caa7830'),(658,2,'20220927.235201.793-financas','2022-10-26 11:54:43','289164de3e7ba6d1c921d2189da83213'),(659,2,'20220927.235204.821-financas','2022-10-26 11:54:43','99ab858a38a26bd3485db08b0c4cede3'),(660,2,'20220927.235207.849-financas','2022-10-26 11:54:43','59e4677a32ab99e53bed59587086b9d9'),(661,2,'20220927.235210.873-financas','2022-10-26 11:54:43','d60f8010e7335fac9b5a1392dda1e75c'),(662,2,'20220927.235213.904-financas','2022-10-26 11:54:43','2f89c52e69db4cc8e8e9d262425d7d77'),(663,2,'20220927.235216.930-financas','2022-10-26 11:54:43','2294c77a396a0bb2b11b61dc749a6e0e'),(664,2,'20220927.235219.962-financas','2022-10-26 11:54:43','55650985531f00c87e6d704d80b1d24f'),(665,2,'20220927.235223.000-financas','2022-10-26 11:54:43','a8c3dd7ce71404dace5c941df142f93b'),(666,2,'20220927.235226.039-financas','2022-10-26 11:54:43','6878811e69a3cfd77f18e2091b9511b6'),(667,2,'20220927.235229.077-financas','2022-10-26 11:54:43','9e9d2f6a16567a5c9ffcd905577f9d86'),(668,2,'20220927.235232.112-financas','2022-10-26 11:54:43','4de08681da845a2360109459f2fc89a6'),(669,2,'20220927.235235.148-financas','2022-10-26 11:54:43','1df453c1fa1de5f271df7891722e84e6'),(670,2,'20220927.235238.169-financas','2022-10-26 11:54:43','60602a4423972b7ac5e096411b60626d'),(671,2,'20220927.235241.201-financas','2022-10-26 11:54:43','ebb7224112441ed4da9bf9e08b3e95cd'),(672,2,'20220927.235244.238-financas','2022-10-26 11:54:43','b4d2548d0e15a4d5304c5e6ed66ac44c'),(673,2,'20220927.235247.273-financas','2022-10-26 11:54:43','6aae0197980813745bc4ed3cf4705781'),(674,2,'20220927.235250.314-financas','2022-10-26 11:54:43','029001a202646d42b247828395d670a7'),(675,2,'20220927.235253.354-financas','2022-10-26 11:54:43','d80367b9290e8e935c82ce558eb75454'),(676,2,'20220927.235256.392-financas','2022-10-26 11:54:43','a8e560efb9666d262755a55017a90e5f'),(677,2,'20220927.235259.428-financas','2022-10-26 11:54:43','87c5e607acfcbf0fa7e618db9a877f50'),(678,2,'20220927.235302.466-financas','2022-10-26 11:54:43','831fac3d482cfb1952426a86622b7522'),(679,2,'20220927.235305.497-financas','2022-10-26 11:54:43','caefdbc00234e147910e794d3f819788'),(680,2,'20220927.235308.533-financas','2022-10-26 11:54:43','21af9920d689d93e5f4c25472b61f2fd'),(681,2,'20220927.235311.562-financas','2022-10-26 11:54:43','5653a4814fcf5bd7e52bc8f7e38d444a'),(682,2,'20220927.235314.587-financas','2022-10-26 11:54:43','2008ae75bef9a92f9adbe434618c5da5'),(683,2,'20220927.235317.617-financas','2022-10-26 11:54:43','9743e0436432c2de6495e405f1aedeae'),(684,2,'20220927.235320.649-financas','2022-10-26 11:54:43','2c49b2f4f7b866983bbb116940592be8'),(685,2,'20220927.235323.682-financas','2022-10-26 11:54:43','8719748948c484fb203206f7ebc5d4d0'),(686,2,'20220927.235326.705-financas','2022-10-26 11:54:43','099f448bc6b692a75990e06f04ec33c3'),(687,2,'20220927.235329.737-financas','2022-10-26 11:54:43','913133db46930053f5e1e7ecf30a883e'),(688,2,'20220927.235332.770-financas','2022-10-26 11:54:43','a34a3643403d0afe23eac0872618c9c0'),(689,2,'20220927.235335.808-financas','2022-10-26 11:54:43','e5d8d3a045b8edca2dc746d9215ef0fd'),(690,2,'20220927.235338.835-financas','2022-10-26 11:54:43','f312c97de524bc9e55b810b0090b61ee'),(691,2,'20220927.235341.861-financas','2022-10-26 11:54:43','149bb239768dabfe09e24cfa2391cc59'),(692,2,'20220927.235344.896-financas','2022-10-26 11:54:43','623b9fb825165eaa01dd7136a2d9907c'),(693,2,'20220927.235347.928-financas','2022-10-26 11:54:43','f0b1c6c792bcceb60a3512e0e68fac00'),(694,2,'20220927.235350.958-financas','2022-10-26 11:54:43','8e434138ecb2e218430dae014049cfa6'),(695,2,'20220927.235353.995-financas','2022-10-26 11:54:43','30f746341431d4222dd4da5ac7c1ec3b'),(696,2,'20220927.235357.023-financas','2022-10-26 11:54:43','a9e595333cafc4a38e58ce10316098cc'),(697,2,'20220927.235400.059-financas','2022-10-26 11:54:43','dc55fefb8adfb18ab2ffca3549ec69f5'),(698,2,'20220927.235403.084-financas','2022-10-26 11:54:43','78e4db612f09470a59c21e7b1712d85f'),(699,2,'20220927.235406.119-financas','2022-10-26 11:54:43','7405a6506e64f3b3f963fb0904ded743'),(700,2,'20220927.235409.151-financas','2022-10-26 11:54:43','43cb8e24ad4993cf985de0428cc84f54'),(701,2,'20220927.235412.174-financas','2022-10-26 11:54:43','b8fb6e9646a616213a4d581a602d7b14'),(702,2,'20220927.235415.207-financas','2022-10-26 11:54:43','5625e737384df593f6719542d539d7a8'),(703,2,'20220927.235418.237-financas','2022-10-26 11:54:43','c4e5128ed0f5175bd92e1959ece72bdf'),(704,2,'20220927.235421.275-financas','2022-10-26 11:54:43','c219fde776b1afad201710e29224c793'),(705,2,'20220927.235424.300-financas','2022-10-26 11:54:43','62690f3a4e7d5f1b6fa3583bbab1b468'),(706,2,'20220927.235427.335-financas','2022-10-26 11:54:43','81cc68f3ad937e87b074931902a505b8'),(707,2,'20220927.235430.368-financas','2022-10-26 11:54:43','ac98b488a44daf69646751679b8ced4c'),(708,2,'20220927.235433.407-financas','2022-10-26 11:54:43','90579c49eaa64707bcfd656774e3540b'),(709,2,'20220927.235436.447-financas','2022-10-26 11:54:43','403cc5a4119a81e8825a7b0656e44c94'),(710,2,'20220927.235439.474-financas','2022-10-26 11:54:43','5970f76053fec903e1077ec299900c42'),(711,2,'20220927.235442.510-financas','2022-10-26 11:54:43','6d44c496364571e94ba21f8d3215fdc5'),(712,2,'20220927.235445.534-financas','2022-10-26 11:54:43','02fec5f7d5417c95f1eeb442dd7fa3a7'),(713,2,'20220927.235448.567-financas','2022-10-26 11:54:43','618d1dedaa4cd690f55ffa3e50afd05a'),(714,2,'20220927.235451.600-financas','2022-10-26 11:54:43','6a659e1c047be8a5446a5439010406eb'),(715,2,'20220927.235454.638-financas','2022-10-26 11:54:43','dfbb3e6d7c5b6002b795c4875ea2fe73'),(716,2,'20220927.235457.667-financas','2022-10-26 11:54:43','0bf0d78de104b8fc4f745c9798f494c2'),(717,2,'20220927.235500.697-financas','2022-10-26 11:54:43','2ff3bc4a16803743624214e1cc80fe30'),(718,2,'20220927.235503.731-financas','2022-10-26 11:54:43','50756cc9ae438706143d1202fd21a0d6'),(719,2,'20220927.235506.752-financas','2022-10-26 11:54:43','d5cdd44d7b1e57759362c966106f9122'),(720,2,'20220927.235509.782-financas','2022-10-26 11:54:43','a7792ca320a1d1bb78680507e9da9897'),(721,2,'20220927.235512.810-financas','2022-10-26 11:54:43','79de27e699fddb2c0195e6de88dfeb96'),(722,2,'20220927.235515.845-financas','2022-10-26 11:54:43','b6e0e8d0bf091fbd94070c36db8ddd51'),(723,2,'20220927.235518.879-financas','2022-10-26 11:54:43','c7ab36de310a2fef0a3a5202177676e6'),(724,2,'20220927.235521.906-financas','2022-10-26 11:54:43','dac1811477259b176446ed2fadab9e0c'),(725,2,'20220927.235524.939-financas','2022-10-26 11:54:43','05713aca1ffe87d0f89ff4b29a976f85'),(726,2,'20220927.235527.970-financas','2022-10-26 11:54:43','78d1e4e2778433033dd580918ad4b219'),(727,2,'20220927.235531.000-financas','2022-10-26 11:54:43','1f7c3ad86bf2c4769951bf887829a099'),(728,2,'20220927.235534.023-financas','2022-10-26 11:54:43','4ffb1c3e1e094e16d1dae6e2ea659bd9'),(729,2,'20220927.235537.052-financas','2022-10-26 11:54:43','b118bdfe1fef7ae705ca165dda01b112'),(730,2,'20220927.235540.086-financas','2022-10-26 11:54:43','1fdcfaf23e9366592b45cd3bf67b3c2f'),(731,2,'20220927.235543.124-financas','2022-10-26 11:54:43','2128c380a89a291959e598c80a1d83ce'),(732,2,'20220927.235546.152-financas','2022-10-26 11:54:43','3893982a8c6347f0cffceca96581db29'),(733,2,'20220927.235549.180-financas','2022-10-26 11:54:43','b0b6bde13267d2336f61bffd41f0f054'),(734,2,'20220927.235552.219-financas','2022-10-26 11:54:43','16a0e4d898dfc338335fadf517352ae4'),(735,2,'20220927.235555.246-financas','2022-10-26 11:54:43','0188d4d2061d945d30c16da9a944d7e9'),(736,2,'20220927.235558.272-financas','2022-10-26 11:54:43','b2b268526ce0eb1a669a869c04793ea6'),(737,2,'20220927.235601.302-financas','2022-10-26 11:54:43','e1009de553eb4567cf7500bdfca9e8cb'),(738,2,'20220927.235604.335-financas','2022-10-26 11:54:43','e0184cc1a6c4a7d29616db9b6b0b7565'),(739,2,'20220927.235607.359-financas','2022-10-26 11:54:43','b7dd4fb81d4f81f97db31b11c8a963cd'),(740,2,'20220927.235610.382-financas','2022-10-26 11:54:43','ea0a4219a9b2cda9c8563f59c24be437'),(741,2,'20220927.235613.417-financas','2022-10-26 11:54:43','2ce0b844389c9949a5b651613d2ba136'),(742,2,'20220927.235616.438-financas','2022-10-26 11:54:43','02eb2bb0f67ba3c10c664e66eec356cc'),(743,2,'20220927.235619.469-financas','2022-10-26 11:54:43','8d1fc3499302de8831dc207040ed53d7'),(744,2,'20220927.235622.494-financas','2022-10-26 11:54:43','d9f5cae4f594015cd0a5055946044b54'),(745,2,'20220927.235625.524-financas','2022-10-26 11:54:43','62f26f854e29dd7d67809c412f10f309'),(746,2,'20220927.235628.559-financas','2022-10-26 11:54:43','4e59ae07382ccee74c5d437e3011d946'),(747,2,'20220927.235631.600-financas','2022-10-26 11:54:43','030a1c4aad97d6eb2cfeec7e153d16b2'),(748,2,'20220927.235634.627-financas','2022-10-26 11:54:43','a7bea03a7901da001b07f25935f2f65b'),(749,2,'20220927.235637.664-financas','2022-10-26 11:54:43','53ededd1a84440c69d8a12573058c3a2'),(750,2,'20220927.235640.695-financas','2022-10-26 11:54:43','640980d306a6b0caa7bcf3998e8a5b7a'),(751,2,'20220927.235643.725-financas','2022-10-26 11:54:43','44582ef8ad20942bb3b75cfb2736519a'),(752,2,'20220927.235646.750-financas','2022-10-26 11:54:43','e21414b65e9df8fd8e685b5eb3d8c5c7'),(753,2,'20220927.235649.785-financas','2022-10-26 11:54:43','a046877d8c6e517ba8fa6163b410ff58'),(754,2,'20220927.235652.818-financas','2022-10-26 11:54:43','b1d61209081a303d4d7086bdc2c5a6d7'),(755,2,'20220927.235655.851-financas','2022-10-26 11:54:43','2f5146f74de0cb9a54914d0648950b07'),(756,2,'20220927.235658.889-financas','2022-10-26 11:54:43','85b50583977ddfd26ab196bf0b30383b'),(757,2,'20220927.235701.929-financas','2022-10-26 11:54:43','badafe6ab66b9d39fea7f606b5018b96'),(758,2,'20220927.235704.953-financas','2022-10-26 11:54:43','f03eb7bc1d1df672c58d21594f34408f'),(759,2,'20220927.235707.975-financas','2022-10-26 11:54:43','a215830562fbe56ecd90c1ef3e964544'),(760,2,'20220927.235711.002-financas','2022-10-26 11:54:43','9d20e723a6be3aab3131e4a1a25c1d13'),(761,2,'20220927.235714.052-financas','2022-10-26 11:54:43','9f64890d43ac25988652fa0125206a7d'),(762,2,'20220927.235717.084-financas','2022-10-26 11:54:43','aa9093d1d1c8a3df44f0f33f3fe39f98'),(763,2,'20220927.235720.105-financas','2022-10-26 11:54:43','8cdd6540335181ace5bd1dc14cc179ad'),(764,2,'20220927.235723.141-financas','2022-10-26 11:54:43','65e90a53eecd880047e2cce2e7aca5ac'),(765,2,'20220927.235726.169-financas','2022-10-26 11:54:43','3403ee00445091526298d9caca8acb6d'),(766,2,'20220927.235729.202-financas','2022-10-26 11:54:43','76f9025a87649a3ca78e4354fd534347'),(767,2,'20220927.235732.236-financas','2022-10-26 11:54:43','e33e926202ed959e5b7c35f00f5e6753'),(768,2,'20220927.235735.268-financas','2022-10-26 11:54:43','4e56f25f39e2d9138a39f069c048c9e1'),(769,2,'20220927.235738.302-financas','2022-10-26 11:54:43','edc520b6c2474270fa71edaaecfd436e'),(770,2,'20220927.235741.334-financas','2022-10-26 11:54:43','c36c04b292cfb54c172f2d64f0661593'),(771,2,'20220927.235744.369-financas','2022-10-26 11:54:43','760d2098733e75f0b2eda4a48c0cf05a'),(772,2,'20220927.235747.398-financas','2022-10-26 11:54:43','cbef1ea961d1c82708ab0a7632d4d862'),(773,2,'20220927.235750.435-financas','2022-10-26 11:54:43','40c752a321c0644a339d037c8b75cae4'),(774,2,'20220927.235753.476-financas','2022-10-26 11:54:43','9769b1dad38dbc9dfeaee9eba4b7468a'),(775,2,'20220927.235756.506-financas','2022-10-26 11:54:43','2afa5f5f87d99630b79f50c5e3538fcf'),(776,2,'20220927.235759.543-financas','2022-10-26 11:54:43','59769da2a25b6cf34a4f3b898c14d5f8'),(777,2,'20220927.235802.580-financas','2022-10-26 11:54:43','3e1a0c401902755018120f86aab7fd95'),(778,2,'20220927.235805.609-financas','2022-10-26 11:54:43','465c45b6ce62c4898ef75ee8e7a1edc3'),(779,2,'20220927.235808.641-financas','2022-10-26 11:54:43','bf683f89448018291060d7115111fb25'),(780,2,'20220927.235811.673-financas','2022-10-26 11:54:43','716808372b572b50e40382c7ab06e246'),(781,2,'20220927.235814.705-financas','2022-10-26 11:54:43','2a25a85138c48bec72634f303d93d7e2'),(782,2,'20220927.235817.734-financas','2022-10-26 11:54:43','c7f017223da25876f3a8830bb74903d0'),(783,2,'20220927.235820.769-financas','2022-10-26 11:54:43','2173af2be09d52c0b4e342d59c90af8c'),(784,2,'20220927.235823.807-financas','2022-10-26 11:54:43','d9ff5ad554bbd241a79b1deddf2774c6'),(785,2,'20220927.235826.843-financas','2022-10-26 11:54:43','136fed17bd7a4836ea240f7356c97eae'),(786,2,'20220927.235829.876-financas','2022-10-26 11:54:43','e25910f8c85fb60cf9b7838d6ae7c6c9'),(787,2,'20220927.235832.900-financas','2022-10-26 11:54:43','1201d6e7ef74d3b77aa03b975db1dbac'),(788,2,'20220927.235835.926-financas','2022-10-26 11:54:43','6192d4a9212abfc7e3e622710196d723'),(789,2,'20220927.235838.957-financas','2022-10-26 11:54:43','4ff6a889818ad12c424a7795fec4dca0'),(790,2,'20220927.235841.991-financas','2022-10-26 11:54:43','07181b6f2f8b443d662a93e6ce3675ad'),(791,2,'20220927.235845.017-financas','2022-10-26 11:54:43','c6f327dae3b06e043eaa76d255f4af62'),(792,2,'20220927.235848.044-financas','2022-10-26 11:54:43','507c414b44a97fbf4914696164731b3a'),(793,2,'20220927.235851.083-financas','2022-10-26 11:54:43','ce2c62707e029b6aa8dc72700915aaa3'),(794,2,'20220927.235854.111-financas','2022-10-26 11:54:43','c147d680c47469b1a6db2c3c6ca43e18'),(795,2,'20220927.235857.136-financas','2022-10-26 11:54:43','badedd9ca49b87c70dadd617dcb568a7'),(796,2,'20220927.235900.162-financas','2022-10-26 11:54:43','284ebb6248716a512227b488c192d1b4'),(797,2,'20220927.235903.197-financas','2022-10-26 11:54:43','09d1aba2a7238423c56e76c0e3fa166e'),(798,2,'20220927.235906.224-financas','2022-10-26 11:54:43','ea00e4906b380ff00bde4fc53ff37b44'),(799,2,'20220927.235909.255-financas','2022-10-26 11:54:43','e1509204678b07a7e11a279fd1a4eae8'),(800,2,'20220927.235912.287-financas','2022-10-26 11:54:43','b37e955d0bea13af6a252754d2248b27'),(801,2,'20220927.235915.315-financas','2022-10-26 11:54:43','8133fd56e87b2598c564036181c2d52d'),(802,2,'20220927.235918.338-financas','2022-10-26 11:54:43','f83af4bcd7a5b9485f88e86ab088907b'),(803,2,'20220927.235921.371-financas','2022-10-26 11:54:43','dfa8a5657caa504de641e51d51ab0fe1'),(804,2,'20220927.235924.407-financas','2022-10-26 11:54:43','d1e703547192d51a313d593aeaa34560'),(805,2,'20220927.235927.435-financas','2022-10-26 11:54:43','571499e779d984df34339528e728daff'),(806,2,'20220927.235930.460-financas','2022-10-26 11:54:43','12824e2402472706b9d0e419db5e40d7'),(807,2,'20220927.235933.488-financas','2022-10-26 11:54:43','efbf2f4df10453ce674a2511c28d4bb5'),(808,2,'20220927.235936.518-financas','2022-10-26 11:54:43','e77d9ef74f214ff971e82c681c3bcf1c'),(809,2,'20220927.235939.552-financas','2022-10-26 11:54:43','a4529072d3e05f51db0f888753ab7bc2'),(810,2,'20220927.235942.589-financas','2022-10-26 11:54:43','c768fa20d221855ec725ac30b53f4bf1'),(811,2,'20220927.235945.621-financas','2022-10-26 11:54:43','b88c86841b59c87365a88a25afc64fe3'),(812,2,'20220927.235948.650-financas','2022-10-26 11:54:44','c99300559fd3385fdd55c96bc8861e10'),(813,2,'20220927.235951.682-financas','2022-10-26 11:54:44','fcd6ad849008c801c36f0ef0c95395d8'),(814,2,'20220927.235954.711-financas','2022-10-26 11:54:44','68849706c6d2e670c5904a5a2fa45da0'),(815,2,'20220927.235957.739-financas','2022-10-26 11:54:44','93922a607221ab6a816853df4f274391'),(816,2,'20220928.000000.777-financas','2022-10-26 11:54:44','577f00178e690e87b4f06f7789937a14'),(817,2,'20220928.000003.802-financas','2022-10-26 11:54:44','1639741f6dbe0c13f45ef06e5dce1558'),(818,2,'20220928.000006.822-financas','2022-10-26 11:54:44','000eec9ca0a75dfc942508bb4c96e22d'),(819,2,'20220928.000009.863-financas','2022-10-26 11:54:44','94e6b866e66ce32211835d4bba4bcc60'),(820,2,'20220928.000012.903-financas','2022-10-26 11:54:44','5cae2ae971412f3f999c34d2e1400fb3'),(821,2,'20220928.000015.943-financas','2022-10-26 11:54:44','8ae58a76286b50328b6170c7aeb4d381'),(822,2,'20220928.000018.981-financas','2022-10-26 11:54:44','41190a2db1d344834f33267c298e96e8'),(823,2,'20220928.000022.009-financas','2022-10-26 11:54:44','2a26c2b6b7544c5b36c80b516883c43e'),(824,2,'20220928.000025.041-financas','2022-10-26 11:54:44','3ea8bdd6be6558399bbbeecae56f3723'),(825,2,'20220928.000028.081-financas','2022-10-26 11:54:44','d05fb9eb134ec409bb9bc0d880f96daa'),(826,2,'20220928.000031.113-financas','2022-10-26 11:54:44','7f8c739f935a5f7f033068065fbd8412'),(827,2,'20220928.000034.142-financas','2022-10-26 11:54:44','1f9bf94a32033d5c0009f949d002a616'),(828,2,'20220928.000037.169-financas','2022-10-26 11:54:44','670ac4a3590f6c9452a3edf1c2b564d0'),(829,2,'20220928.000040.202-financas','2022-10-26 11:54:44','d235e41a647fd98a0e22fc9cfeadb9f2'),(830,2,'20220928.000043.228-financas','2022-10-26 11:54:44','328e41560ebbd6847ee60f8d19366127'),(831,2,'20220928.000046.263-financas','2022-10-26 11:54:44','c0b4a832d9a782d76e9912018da4a268'),(832,2,'20220928.000049.305-financas','2022-10-26 11:54:44','8c4e2a1fb64c2316a6de3196189590c5'),(833,2,'20220928.000052.334-financas','2022-10-26 11:54:44','62fefab466cbb4a4b1b0a4da3d8c5a7f'),(834,2,'20220928.000055.360-financas','2022-10-26 11:54:44','0917cd0e0ae2c94fd0c6219bbe4bd75f'),(835,2,'20220928.000058.393-financas','2022-10-26 11:54:44','4dc399736814f7e74c95621e13fcfaa4'),(836,2,'20220928.000101.432-financas','2022-10-26 11:54:44','e92eb142102bd3f20f3ab5cd96996ead'),(837,2,'20220928.000104.459-financas','2022-10-26 11:54:44','f183c98e9fb57e38364607ac45ff19b2'),(838,2,'20220928.000107.487-financas','2022-10-26 11:54:44','f36e8a0aeee96fd69f38f142e19f1a02'),(839,2,'20220928.000110.527-financas','2022-10-26 11:54:44','e3532da4d667873313daa9425f4a56f3'),(840,2,'20220928.000113.561-financas','2022-10-26 11:54:44','d6ed290659590b32d24456055bca7b65'),(841,2,'20220928.000116.585-financas','2022-10-26 11:54:44','0835bc63a6e61117b56dffc78596e8f4'),(842,2,'20220928.000119.618-financas','2022-10-26 11:54:44','352050d968c146a0535d3954d8fca9d3'),(843,2,'20220928.000122.659-financas','2022-10-26 11:54:44','a8ffa77caccb1c3012264bc67afc31a5'),(844,2,'20220928.000125.688-financas','2022-10-26 11:54:44','a936ff04e07e599eb9e82eaed9c0e9c1'),(845,2,'20220928.000128.722-financas','2022-10-26 11:54:44','a54b3906364fb5a74940783aa8f021a3'),(846,2,'20220928.000131.753-financas','2022-10-26 11:54:44','051e5803587365f814d166fa6088bb36'),(847,2,'20220928.000134.781-financas','2022-10-26 11:54:44','f5d83df3ef7ef7c1e9b301265e5569d1'),(848,2,'20220928.000137.820-financas','2022-10-26 11:54:44','f54a470b7f26e1a58226e84cab035676'),(849,2,'20220928.000140.842-financas','2022-10-26 11:54:44','3248eba690b4ba269ce10794dca17a09'),(850,2,'20220928.000143.871-financas','2022-10-26 11:54:44','23e4ca77c3386d413ecf8affe85bcbab'),(851,2,'20220928.000146.906-financas','2022-10-26 11:54:44','f077b8d2797aabca76b39dcb48824bea'),(852,2,'20220928.000149.934-financas','2022-10-26 11:54:44','901d77f1055c9c90d488da35c140fa9f'),(853,2,'20220928.000152.956-financas','2022-10-26 11:54:44','78ef721a4c8549b096c4c7cf6544aac9'),(854,2,'20220928.000155.994-financas','2022-10-26 11:54:44','3d1652e2025bc77aae356e51b9b8f60f'),(855,2,'20220928.000159.026-financas','2022-10-26 11:54:44','6a25f27d5ff100ae71e94787103593d1'),(856,2,'20220928.000202.058-financas','2022-10-26 11:54:44','8074026d998d61b2f44b664b24b21f92'),(857,2,'20220928.000205.078-financas','2022-10-26 11:54:44','e32aeb3b1e6416b2493bbc4955949747'),(858,2,'20220928.000208.110-financas','2022-10-26 11:54:44','5f815fdaa7ac8018e5bfa2f3fa745a76'),(859,2,'20220928.000211.138-financas','2022-10-26 11:54:44','65f3385ca2064db6c4bd100d7190d827'),(860,2,'20220928.000214.166-financas','2022-10-26 11:54:44','9dbc1ce5d51e32db9d5925a80615cdbb'),(861,2,'20220928.000217.206-financas','2022-10-26 11:54:44','10946d7390f9f832a1581dce6d43f4fe'),(862,2,'20220928.000220.226-financas','2022-10-26 11:54:44','718d6ed77e2c8a04e2bb29ed921f2257'),(863,2,'20220928.000223.258-financas','2022-10-26 11:54:44','c69737097cefabc2372f7fd5d347cd2e'),(864,2,'20220928.000226.295-financas','2022-10-26 11:54:44','cee31a3e8ef4a3fc7e4159d26cbb7a5a'),(865,2,'20220928.000229.320-financas','2022-10-26 11:54:44','84ea01f433e4b84ba330b006d386c0f9'),(866,2,'20220928.000232.351-financas','2022-10-26 11:54:44','b66fdc4f863215b521f7a512e7f9ae65'),(867,2,'20220928.000235.389-financas','2022-10-26 11:54:44','1447c1a84a4a31793234ff135b178638'),(868,2,'20220928.000238.415-financas','2022-10-26 11:54:44','d02f2cea6dab3f49bf88f64fce308118'),(869,2,'20220928.000241.445-financas','2022-10-26 11:54:44','b63a65d67af08e0595f72314374c9c61'),(870,2,'20220928.000244.477-financas','2022-10-26 11:54:44','525f8438fa4568e6c073490febc6dbb5'),(871,2,'20220928.000247.501-financas','2022-10-26 11:54:44','9dc8d5d6db4933ddbb272ffb1e3d108c'),(872,2,'20220928.000250.533-financas','2022-10-26 11:54:44','73c0e2eec94cee5acd4e76922b9b55e4'),(873,2,'20220928.000253.562-financas','2022-10-26 11:54:44','ec3496d9ba26a0ab600350bb1c125807'),(874,2,'20220928.000256.601-financas','2022-10-26 11:54:44','4c25e973d1c2e13b14b64de77615271b'),(875,2,'20220928.000259.628-financas','2022-10-26 11:54:44','88b5a63540da1a5604b4681ca8d278d9'),(876,2,'20220928.000302.658-financas','2022-10-26 11:54:44','8c997a2db2b5db50f35091203db32e61'),(877,2,'20220928.000305.684-financas','2022-10-26 11:54:44','3d21705f1fddb19d208d7144474dea83'),(878,2,'20220928.000308.714-financas','2022-10-26 11:54:44','94fdcf6064fe286e364bfc511f46f554'),(879,2,'20220928.000311.741-financas','2022-10-26 11:54:44','8acef8dea348f73eb6ba764688051ee8'),(880,2,'20220928.000314.771-financas','2022-10-26 11:54:44','e931a32396690825d7211a3b09b4daac'),(881,2,'20220928.000317.799-financas','2022-10-26 11:54:44','7b25054c6e7255ab140b0da554a86801'),(882,2,'20220928.000320.836-financas','2022-10-26 11:54:44','0c5e25aef8444a11bd35ee024365271b'),(883,2,'20220928.000323.866-financas','2022-10-26 11:54:44','403c097443921cf67758a74b3d031312'),(884,2,'20220928.000326.888-financas','2022-10-26 11:54:44','c41d0f08c1737c2e4de3a049afc1f4e7'),(885,2,'20220928.000329.925-financas','2022-10-26 11:54:44','cd959977ffe18ea243292e1c98d2aea8'),(886,2,'20220928.000332.967-financas','2022-10-26 11:54:44','3f58a063ce72d844a4ba7508762b558d'),(887,2,'20220928.000335.991-financas','2022-10-26 11:54:44','a21e9c4ee8a6d52d6f37e0d3ec7d2bf3'),(888,2,'20220928.000339.022-financas','2022-10-26 11:54:44','95e3771ab34343f975706c24427d55ad'),(889,2,'20220928.000342.050-financas','2022-10-26 11:54:44','e98e733c5130c545d8a8183f23fb8c34'),(890,2,'20220928.000345.072-financas','2022-10-26 11:54:44','334c18f15877f1a4fcba2661c5b93e9b'),(891,2,'20220928.000348.111-financas','2022-10-26 11:54:44','dc1c4b6b0052399babe5005b4fbfe005'),(892,2,'20220928.000351.138-financas','2022-10-26 11:54:44','f159e7f6f5e006d67bd53e8821ac7845'),(893,2,'20220928.000354.170-financas','2022-10-26 11:54:44','60499d4018cfea65bc4fbbcf17dc2969'),(894,2,'20220928.000357.198-financas','2022-10-26 11:54:44','6705962ac24e4a7e663a782634fd141c'),(895,2,'20220928.000400.229-financas','2022-10-26 11:54:44','f58709982b4ab5fea5f33da414c7a732'),(896,2,'20220928.000403.254-financas','2022-10-26 11:54:44','b58558484ec05a59a4952c862756fabb'),(897,2,'20220928.000406.288-financas','2022-10-26 11:54:44','9806504c1f89ef55ede4ecf497bc96ed'),(898,2,'20220928.000409.316-financas','2022-10-26 11:54:44','ff391b9f48f5be13ab1f5a951ee7b79e'),(899,2,'20220928.000412.356-financas','2022-10-26 11:54:44','3f21bb8bb621b9ef7dcb0c7c9bc8d8bf'),(900,2,'20220928.000415.390-financas','2022-10-26 11:54:44','f95fdc18c30727a79af5b89ef7b92bf6'),(901,2,'20220928.000418.428-financas','2022-10-26 11:54:44','2fd7a9a071e5990fafee5b1b090f6225'),(902,2,'20220928.000421.451-financas','2022-10-26 11:54:44','2e5980141dda8c5a1c918fa2e8b8d56a'),(903,2,'20220928.000424.491-financas','2022-10-26 11:54:44','fe83cf4d2fcdb9ff6d1c3f893a13abda'),(904,2,'20220928.000427.532-financas','2022-10-26 11:54:44','eb0ef6e082e0f3385b52e44e97ff4c71'),(905,2,'20220928.000430.557-financas','2022-10-26 11:54:44','f2b2f34c81a30624994e0e53ba09f151'),(906,2,'20220928.000433.586-financas','2022-10-26 11:54:44','1cf5a725f544e374a5cbca47146d7df7'),(907,2,'20220928.000436.627-financas','2022-10-26 11:54:44','f7c6cfc07c0baaa1d6fb6f046d2e20f5'),(908,2,'20220928.000439.659-financas','2022-10-26 11:54:44','61ff6bbe5167435307ee5530267179b6'),(909,2,'20220928.000442.697-financas','2022-10-26 11:54:44','27f94edb087a94e09412ff7f1c0751a8'),(910,2,'20220928.000445.727-financas','2022-10-26 11:54:44','77e99a7bfee3bd824a3d1e9d069a6aed'),(911,2,'20220928.000448.754-financas','2022-10-26 11:54:44','0bdf2b42660e39b340861d65ed0acabd'),(912,2,'20220928.000451.790-financas','2022-10-26 11:54:44','cd353a3ab963d3239791e491711ae4ec'),(913,2,'20220928.000454.830-financas','2022-10-26 11:54:44','782eec062f196b2e31601d2dba13e3d5'),(914,2,'20220928.000457.858-financas','2022-10-26 11:54:44','a8bd721fabb371983f9234b34b7522f6'),(915,2,'20220928.000500.883-financas','2022-10-26 11:54:44','d874c5c7d49ea0d3dd415ce5d00d484b'),(916,2,'20220928.000503.923-financas','2022-10-26 11:54:44','ae24755ece3e1f55b30805766694df6a'),(917,2,'20220928.000506.955-financas','2022-10-26 11:54:44','881311884b981f0bc50a1dce3dcbe51d'),(918,2,'20220928.000509.991-financas','2022-10-26 11:54:44','0c6ec7f204f59d8a68f84a76fd4203f6'),(919,2,'20220928.000513.015-financas','2022-10-26 11:54:44','7fc88c9d11da8b41d7338257d371d693'),(920,2,'20220928.000516.050-financas','2022-10-26 11:54:44','5286b172c065a710f09bd664634fe2a9'),(921,2,'20220928.000519.083-financas','2022-10-26 11:54:44','7e2524692e0660ac77df76b51cf913d8'),(922,2,'20220928.000522.115-financas','2022-10-26 11:54:44','f43e1c333c7345e46d96323e43f118e3'),(923,2,'20220928.000525.156-financas','2022-10-26 11:54:44','e6a71612e518931a8589003dd8460ee7'),(924,2,'20220928.000528.187-financas','2022-10-26 11:54:44','9b4265bc98af86e159fd32b18bb68ca5'),(925,2,'20220928.000531.223-financas','2022-10-26 11:54:44','53134f07521f141eb65d8ab7d3381127'),(926,2,'20220928.000534.253-financas','2022-10-26 11:54:44','c5d548aee1dccc434824af4d1f133410'),(927,2,'20220928.000537.274-financas','2022-10-26 11:54:44','ea5279aa276feab1b5ddb59f3f53883f'),(928,2,'20220928.000540.310-financas','2022-10-26 11:54:44','05202457e429a209a0f7a7c7a101dc5f'),(929,2,'20220928.000543.338-financas','2022-10-26 11:54:44','ecb4170e7e18d3460b5be50b1c161edd'),(930,2,'20220928.000546.372-financas','2022-10-26 11:54:44','a561a8b9e48b2e11a30103ee2e7a7272'),(931,2,'20220928.000549.408-financas','2022-10-26 11:54:44','23b7e4cc6d4aced93ff3d18c8c415d84'),(932,2,'20220928.000552.450-financas','2022-10-26 11:54:44','085da3bc3e4eb386308fb6ecad9e715c'),(933,2,'20220928.000555.478-financas','2022-10-26 11:54:44','8cf6ff4c1a9c32c6580e63ea923499e4'),(934,2,'20220928.000558.508-financas','2022-10-26 11:54:44','75f93d6c4016dec3668c51123d0a733a'),(935,2,'20220928.000601.544-financas','2022-10-26 11:54:44','427c13df92d6b617742f65485ef06de2'),(936,2,'20220928.000604.564-financas','2022-10-26 11:54:44','8ee3753be1cb08ce3ea058338378853f'),(937,2,'20220928.000607.588-financas','2022-10-26 11:54:44','e1dd80dad5374bbaab38a272fa28ee0c'),(938,2,'20220928.000610.626-financas','2022-10-26 11:54:44','763c58cec02eda4e9c506f24340c41bc'),(939,2,'20220928.000613.667-financas','2022-10-26 11:54:44','fdc1d4b8e3518c828577b9f291f903d0'),(940,2,'20220928.000616.703-financas','2022-10-26 11:54:44','eda06810febc404a5a49322872e079e4'),(941,2,'20220928.000619.731-financas','2022-10-26 11:54:44','0a179bcc5d39aca7c9a885539b09fd7c'),(942,2,'20220928.000622.761-financas','2022-10-26 11:54:44','65f71fd39fdc089f059902ada0d52954'),(943,2,'20220928.000625.789-financas','2022-10-26 11:54:44','2d5c6c2564803384277cc26ef06a2614'),(944,2,'20220928.000628.819-financas','2022-10-26 11:54:44','2e5d6d7a1bc3f6ff382506e8e609da1a'),(945,2,'20220928.000631.844-financas','2022-10-26 11:54:44','b81037ffd892a7255d2a7bc424ebd929'),(946,2,'20220928.000634.882-financas','2022-10-26 11:54:44','6d554e038a50299b4310b4c520d136b5'),(947,2,'20220928.000637.921-financas','2022-10-26 11:54:44','4aab31fa96d61ebdc54502012f9dbf4f'),(948,2,'20220928.000640.954-financas','2022-10-26 11:54:44','28ca8e8c76087a4097ebfb1e5b83ace0'),(949,2,'20220928.000643.980-financas','2022-10-26 11:54:44','ed855404a8d1cbcc59d341afe7054e79'),(950,2,'20220928.000647.008-financas','2022-10-26 11:54:44','85c63f178dfd1ee3e4312cda94a6e72f'),(951,2,'20220928.000650.050-financas','2022-10-26 11:54:44','3f9ab01764911778d1aec76fe7c3fe6d'),(952,2,'20220928.000653.076-financas','2022-10-26 11:54:44','1bb2ed607d14c6533e5ff76f6a0153a8'),(953,2,'20220928.000656.104-financas','2022-10-26 11:54:44','4dcffa882bc646d9d9d29184d5d5fbba'),(954,2,'20220928.000659.138-financas','2022-10-26 11:54:44','6e365cb479396fadd802f90bfa1e00ff'),(955,2,'20220928.000702.173-financas','2022-10-26 11:54:44','060d305596e134f0003a02d83ef65019'),(956,2,'20220928.000705.207-financas','2022-10-26 11:54:44','8b659953684644e3c906b22d16941a04'),(957,2,'20220928.000708.236-financas','2022-10-26 11:54:44','f6641bc86efb1fb67322dad28e912c3c'),(958,2,'20220928.000711.264-financas','2022-10-26 11:54:44','333843d7e2fb9ccd3440da385bd0f2b1'),(959,2,'20220928.000714.288-financas','2022-10-26 11:54:44','e702a1b357c187050e2c373e093059fe'),(960,2,'20220928.000717.326-financas','2022-10-26 11:54:44','e99f503f556118980f650fb654fa51b5'),(961,2,'20220928.000720.359-financas','2022-10-26 11:54:44','fa4fbc6db6d4a3bf52f221181405767a'),(962,2,'20220928.000723.400-financas','2022-10-26 11:54:44','54440c2609e54bbae53b946fa9a529a5'),(963,2,'20220928.000726.434-financas','2022-10-26 11:54:44','1e2d10fa51d7608b659e31bd1503a235'),(964,2,'20220928.000729.468-financas','2022-10-26 11:54:44','1a581a4a87a381915447ef30f548993c'),(965,2,'20220928.000732.501-financas','2022-10-26 11:54:44','5fa49aec08341028f1dca6b8161257f9'),(966,2,'20220928.000735.533-financas','2022-10-26 11:54:44','14ae03340b5e874e4cc43af6ca93b480'),(967,2,'20220928.000738.567-financas','2022-10-26 11:54:44','48c1cb329e3bb0deec1a95417eafda54'),(968,2,'20220928.000741.592-financas','2022-10-26 11:54:44','1eda5f70c299654c93e03e0e54c86bf1'),(969,2,'20220928.000744.622-financas','2022-10-26 11:54:44','8f4cf8b3108b4cc9e455d3e4a858043f'),(970,2,'20220928.000747.645-financas','2022-10-26 11:54:44','d3ac4201a69a439838d15847d94686b0'),(971,2,'20220928.000750.686-financas','2022-10-26 11:54:44','22901571eedc74acb6aa6d5c28d0fa23'),(972,2,'20220928.000753.718-financas','2022-10-26 11:54:44','fda920cd36950cce6873d8f2ab55c798'),(973,2,'20220928.000756.745-financas','2022-10-26 11:54:44','7d6b8e13f48e9d21835271993bfe4ba6'),(974,2,'20220928.000759.767-financas','2022-10-26 11:54:44','91426d09ba6c88dd8f0cb7dcc6ee9570'),(975,2,'20220928.000802.796-financas','2022-10-26 11:54:44','f2878e3eb2746e52d8588c7b00e95f3d'),(976,2,'20220928.000805.827-financas','2022-10-26 11:54:44','96fb9fa3d2709db4e4053dd74a612ac9'),(977,2,'20220928.000808.858-financas','2022-10-26 11:54:44','c26fe035dad0e17e5919584897653c8c'),(978,2,'20220928.000811.893-financas','2022-10-26 11:54:44','89dd74b39d41a7913f94c2aba0a4a0fa'),(979,2,'20220928.000814.920-financas','2022-10-26 11:54:44','9ff340ea74f2def4a1c990ec177068eb'),(980,2,'20220928.000817.950-financas','2022-10-26 11:54:44','55bff82c775ee6d01cf46d2a93a66d90'),(981,2,'20220928.000820.970-financas','2022-10-26 11:54:44','6da452889ee143d612bd77abaacd8cf0'),(982,2,'20220928.000823.991-financas','2022-10-26 11:54:44','88d13872f7b719ebb7d1090184c3fc38'),(983,2,'20220928.000827.017-financas','2022-10-26 11:54:44','89facf24c3b98e7476cd5f49710ccf17'),(984,2,'20220928.000830.051-financas','2022-10-26 11:54:44','0a19bea573014aa7eec2090d849c6dd1'),(985,2,'20220928.000833.075-financas','2022-10-26 11:54:44','5955d4eeaf602a8882204b72b0825acf'),(986,2,'20220928.000836.114-financas','2022-10-26 11:54:44','beb058189d0ea63a61a48e3c137c4888'),(987,2,'20220928.000839.133-financas','2022-10-26 11:54:44','a9e77592751c3eacf96b03e7d129fb2f'),(988,2,'20220928.000842.159-financas','2022-10-26 11:54:44','bb64e9f8608a6a39c3a5958ae645c783'),(989,2,'20220928.000845.191-financas','2022-10-26 11:54:44','7058c4f1757e745598ce3afe97060458'),(990,2,'20220928.000848.226-financas','2022-10-26 11:54:44','6e79e8c2723c96f49dad2760ee269a13'),(991,2,'20220928.000851.258-financas','2022-10-26 11:54:44','d3f2484abc60d6ca8767b69cd55dda97'),(992,2,'20220928.000854.278-financas','2022-10-26 11:54:44','37057062fab5bf33db9aa4785188c5e7'),(993,2,'20220928.000857.314-financas','2022-10-26 11:54:44','984275fd8f5776257962de3a9d41f4c5'),(994,2,'20220928.000900.341-financas','2022-10-26 11:54:44','d7a7bcc23094cddefa0fdf0a5d510736'),(995,2,'20220928.000903.379-financas','2022-10-26 11:54:44','948c5f529579b1fe126ab17116f53f7e'),(996,2,'20220928.000906.405-financas','2022-10-26 11:54:44','d83cd98f1d065391978296e83857e4ad'),(997,2,'20220928.000909.435-financas','2022-10-26 11:54:44','232c746480f55e4a326cfbc61d679ef3'),(998,2,'20220928.000912.472-financas','2022-10-26 11:54:44','7e03b17a95ead9de41852d162d378881'),(999,2,'20220928.000915.501-financas','2022-10-26 11:54:44','5a088d2abcb38dccc48fe1a360ef850f'),(1000,2,'20220928.000918.537-financas','2022-10-26 11:54:44','23c3f0478d374c45bb74c0f213e2516a'),(1001,2,'20220928.000921.566-financas','2022-10-26 11:54:44','b8c4361694aa612a29bd4ee59ff3c9f2'),(1002,2,'20220928.000924.597-financas','2022-10-26 11:54:44','9f085e46954c756eb4ca86c9a17028f6'),(1003,2,'20220928.000927.634-financas','2022-10-26 11:54:44','8f287f03940126d51c1e72d9332aadc3'),(1004,2,'20220928.000930.662-financas','2022-10-26 11:54:44','61431449b100f4a39a0060fde8efac1e'),(1005,2,'20220928.000933.690-financas','2022-10-26 11:54:44','43ba2c836c701a66fdc291631e87dee2'),(1006,2,'20220928.000936.726-financas','2022-10-26 11:54:44','28e9f2e713d1566789961ccb6d75a1bf'),(1007,2,'20220928.000939.759-financas','2022-10-26 11:54:44','5b414dc6d6304a1c4bf995155e4515c5'),(1008,2,'20220928.000942.790-financas','2022-10-26 11:54:44','6465d2e60487068145ba5fdf6b87835d'),(1009,2,'20220928.000945.820-financas','2022-10-26 11:54:44','111590920922b83ae83c0951807b6675'),(1010,2,'20220928.000948.853-financas','2022-10-26 11:54:44','ed929f68c3650e1256792507798b7c1e'),(1011,2,'20220928.000951.893-financas','2022-10-26 11:54:44','c5940973fd9f8404303229737d3a0376'),(1012,2,'20220928.000954.921-financas','2022-10-26 11:54:44','2f6177aec0ff4600e52043a12d0a61e4'),(1013,2,'20220928.000957.956-financas','2022-10-26 11:54:44','073a73be57f70542cfcd12adf5ad1ad6'),(1014,2,'20220928.001000.995-financas','2022-10-26 11:54:44','cb9f12f91b5d25eda2cb181e6f378173'),(1015,2,'20220928.001004.029-financas','2022-10-26 11:54:44','35eaa6a4783b91f485b79ec2eb3675c2'),(1016,2,'20220928.001007.053-financas','2022-10-26 11:54:44','3f9ab2c413bb256996bf763dffeb9031'),(1017,2,'20220928.001010.083-financas','2022-10-26 11:54:44','749028320880def80c444a1f652c4a2e'),(1018,2,'20220928.001013.112-financas','2022-10-26 11:54:44','daecc559d1d528c9f9a2bf4c3d9cdab5'),(1019,2,'20220928.001016.152-financas','2022-10-26 11:54:44','a6052d6a0503e263f03c334241f8d825'),(1020,2,'20220928.001019.181-financas','2022-10-26 11:54:44','96974e1f1833c1fa1d3a64fad3a1171f'),(1021,2,'20220928.001022.212-financas','2022-10-26 11:54:44','5f59ed2e516e1a64990bc4141c7d1efc'),(1022,2,'20220928.001025.248-financas','2022-10-26 11:54:44','412f94c4178d9d3b07c495a1a079f638'),(1023,2,'20220928.001028.277-financas','2022-10-26 11:54:44','93182de0b24f57a7f2c544d09876b546'),(1024,2,'20220928.001031.307-financas','2022-10-26 11:54:44','25c0089a0b8c26009c295be637dfcc3b'),(1025,2,'20220928.001034.339-financas','2022-10-26 11:54:44','68961fb0fc5ba860e548f68a21ed99b4'),(1026,2,'20220928.001037.359-financas','2022-10-26 11:54:44','0f65c61815a0bb6ddb6f93df15967616'),(1027,2,'20220928.001040.393-financas','2022-10-26 11:54:44','d942fe8326819f31c795a89b69bc04aa'),(1028,2,'20220928.001043.426-financas','2022-10-26 11:54:44','70eee671d81da7478a89f0670a460af3'),(1029,2,'20220928.001046.452-financas','2022-10-26 11:54:44','c4f2fabda951d43a5a10e0945d8ab12c'),(1030,2,'20220928.001049.483-financas','2022-10-26 11:54:44','f0a3117e41a4fb9ba38eaf3409bcf511'),(1031,2,'20220928.001052.524-financas','2022-10-26 11:54:44','8b4b6bedb8f84f6ea37f33e984b7c6a2'),(1032,2,'20220928.001055.558-financas','2022-10-26 11:54:44','c0dcd58735950cb5d2abc26d4f3fcbeb'),(1033,2,'20220928.001058.601-financas','2022-10-26 11:54:44','abc1099e709e8c9152a52798728a079a'),(1034,2,'20220928.001101.633-financas','2022-10-26 11:54:44','b1e8d58db0e8070919f55cf978e478bc'),(1035,2,'20220928.001104.657-financas','2022-10-26 11:54:44','10fa8aa2cd71bc9014602457655f0be8'),(1036,2,'20220928.001107.695-financas','2022-10-26 11:54:44','be0ac91796588198cadeb3a168410a5c'),(1037,2,'20220928.001110.735-financas','2022-10-26 11:54:44','272454d756a2805c26f14eca487e4019'),(1038,2,'20220928.001113.775-financas','2022-10-26 11:54:44','007d752a08c7856f79a65f58fdf53cb8'),(1039,2,'20220928.001116.803-financas','2022-10-26 11:54:44','77d36fa6704021306a1b6fb874a8732e'),(1040,2,'20220928.001119.834-financas','2022-10-26 11:54:44','d1e26b6298de9d1cbb0f57b4c8d04c66'),(1041,2,'20220928.001122.856-financas','2022-10-26 11:54:44','81c60e6bcefff9e83e1e1052282640ed'),(1042,2,'20220928.001125.889-financas','2022-10-26 11:54:44','5fc67683522c0d132aa4c269bf3837f9'),(1043,2,'20220928.001128.921-financas','2022-10-26 11:54:44','8ee28b5bd1ee9541a1adf825af5ec71e'),(1044,2,'20220928.001131.962-financas','2022-10-26 11:54:44','e5ef1eb5005cc96d27398d68db0817d4'),(1045,2,'20220928.001134.990-financas','2022-10-26 11:54:44','895bf8155a8978793f0598f0a95f1cd2'),(1046,2,'20220928.001138.026-financas','2022-10-26 11:54:44','8eb67e9f1b5b612940c6bd87b70a2824'),(1047,2,'20220928.001141.052-financas','2022-10-26 11:54:44','8287cac465a2854e648a0c3676c54172'),(1048,2,'20220928.001144.081-financas','2022-10-26 11:54:44','10a6c192485466037ec228f5791a2db6'),(1049,2,'20220928.001147.123-financas','2022-10-26 11:54:44','fe673710b1292ccadb3a2176b7d3952a'),(1050,2,'20220928.001150.151-financas','2022-10-26 11:54:44','f1fd1ae624f043c9d877abdc0a0d9438'),(1051,2,'20220928.001153.173-financas','2022-10-26 11:54:44','16e21a3f4ea3c595d076a003f9b749e6'),(1052,2,'20220928.001156.206-financas','2022-10-26 11:54:44','1a620ca8fed222ed96339417c74bee7c'),(1053,2,'20220928.001159.245-financas','2022-10-26 11:54:44','8725a67a1b2a8c31a9b3f15f80144c82'),(1054,2,'20220928.001202.273-financas','2022-10-26 11:54:44','75420063c015b85163664b6c916d5a89'),(1055,2,'20220928.001205.305-financas','2022-10-26 11:54:44','574239fb88f23fa196d193e0c90cc436'),(1056,2,'20220928.001208.339-financas','2022-10-26 11:54:44','2ec19c7cce051916ea76b41b99b1bf46'),(1057,2,'20220928.001211.375-financas','2022-10-26 11:54:44','267db999692329d5f1766db9cea12e55'),(1058,2,'20220928.001214.407-financas','2022-10-26 11:54:44','91ead6663bb6352ef30262f8dfa119a9'),(1059,2,'20220928.001217.433-financas','2022-10-26 11:54:44','6ca651edeab7cf4782221eba7140d589'),(1060,2,'20220928.001220.463-financas','2022-10-26 11:54:44','19de553eea34281a217d83619fba397a'),(1061,2,'20220928.001223.491-financas','2022-10-26 11:54:44','7fb6c89e48a30cefbde50f1adaf647f5'),(1062,2,'20220928.001226.518-financas','2022-10-26 11:54:44','1a164e667a533fe6c428d48613adb348'),(1063,2,'20220928.001229.546-financas','2022-10-26 11:54:44','3ac7386f18ac82d1ee2c807549c57145'),(1064,2,'20220928.001232.578-financas','2022-10-26 11:54:44','96d648d85881a72319120178e6e6aee1'),(1065,2,'20220928.001235.619-financas','2022-10-26 11:54:44','a4bb1b6bec7ec890f5bca1ed2e8c177e'),(1066,2,'20220928.001238.658-financas','2022-10-26 11:54:44','9bbc6d8618e59919747bfc4299dc8de7'),(1067,2,'20220928.001241.691-financas','2022-10-26 11:54:44','dc5f35d350f2be825f155b9e4ab643ce'),(1068,2,'20220928.001244.721-financas','2022-10-26 11:54:44','9485c7f8f21efa26cf3f70512e2c7de5'),(1069,2,'20220928.001247.753-financas','2022-10-26 11:54:44','68cea815fe0bd7791fa7352d893e2562'),(1070,2,'20220928.001250.785-financas','2022-10-26 11:54:44','5abf9d64c1c026616e7cfb8990e9ca46'),(1071,2,'20220928.001253.812-financas','2022-10-26 11:54:44','e0aedfe3bbba9c44cf67712f746db6ee'),(1072,2,'20220928.001256.838-financas','2022-10-26 11:54:44','f5f7b0059c2a516f9e62899aa8b6d120'),(1073,2,'20220928.001259.867-financas','2022-10-26 11:54:44','efd8992664f4a4651c5e5d9df5dcc728'),(1074,2,'20220928.001302.909-financas','2022-10-26 11:54:44','5658a04dbfa09a3216c3c7c6665c97ed'),(1075,2,'20220928.001305.942-financas','2022-10-26 11:54:44','ae4ecae4f1b6945e37618fb852a79f9f'),(1076,2,'20220928.001308.980-financas','2022-10-26 11:54:44','d624db842d1dd623a586bb0fb209a1f4'),(1077,2,'20220928.001312.010-financas','2022-10-26 11:54:44','0b7cb58c2bbec290acd08bb6b5443967'),(1078,2,'20220928.001315.039-financas','2022-10-26 11:54:44','7c765068fc9ca5552872c89903e43684'),(1079,2,'20220928.001318.070-financas','2022-10-26 11:54:44','1beeeb8a2c0583368b00339ddc79bcd2'),(1080,2,'20220928.001321.102-financas','2022-10-26 11:54:44','8bcec4308c8ec1025cde812ea1930e9d'),(1081,2,'20220928.001324.136-financas','2022-10-26 11:54:44','fe7d39752cf9131421103a394662db14'),(1082,2,'20220928.001327.166-financas','2022-10-26 11:54:44','5fb9a6d190400d0e05de28e21e52ce23'),(1083,2,'20220928.001330.196-financas','2022-10-26 11:54:44','8881bc490225b746028e9a80299356d3'),(1084,2,'20220928.001333.225-financas','2022-10-26 11:54:44','96ad83c897252c9d74b9e0612962402c'),(1085,2,'20220928.001336.250-financas','2022-10-26 11:54:44','1ba4d6b9507b9a923df7ab7ddb6bb855'),(1086,2,'20220928.001339.281-financas','2022-10-26 11:54:44','08f2e64921c58f30eb766ed0aa3a70c8'),(1087,2,'20220928.001342.306-financas','2022-10-26 11:54:44','4f35aef9dc875e7915898d855a28f078'),(1088,2,'20220928.001345.336-financas','2022-10-26 11:54:44','fd72abe5ed000badf6f1a03aade6deab'),(1089,2,'20220928.001348.365-financas','2022-10-26 11:54:44','5b3bd8b7ffb8e8c33f534339871ed514'),(1090,2,'20220928.001351.392-financas','2022-10-26 11:54:44','d39f76dc4cfcc46b8e9abdef6895ef49'),(1091,2,'20220928.001354.423-financas','2022-10-26 11:54:44','d96505e3b5be60d441529c525e51b21d'),(1092,2,'20220928.001357.454-financas','2022-10-26 11:54:44','083d08567a6033a3ec51e3d080ecb061'),(1093,2,'20220928.001400.490-financas','2022-10-26 11:54:44','4c0a60ca3fe5bea4530f5595d07d3853'),(1094,2,'20220928.001403.510-financas','2022-10-26 11:54:44','46a5ac17446cd3368d00c0421888b5f7'),(1095,2,'20220928.001406.543-financas','2022-10-26 11:54:44','900819bc601fa8e95ead7c8c024a6fe5'),(1096,2,'20220928.001409.571-financas','2022-10-26 11:54:44','0d0a115037475d8fa611227e0c2450b4'),(1097,2,'20220928.001412.597-financas','2022-10-26 11:54:44','9c0e963c53fd76c9e1dcacdab8ca95b4'),(1098,2,'20221010.125555.282-financas','2022-10-26 11:54:44','cfacfc10a483a64892a352ca2b809425');
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

-- Dump completed on 2022-10-27 16:17:40
