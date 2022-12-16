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
INSERT INTO `categoria_grupo_conta_contabil` VALUES (1,1,34,1,1,1,1),(2,1,78,1,1,1,1),(3,1,4,1,1,1,2),(4,1,9,1,2,2,2),(5,1,34,1,1,1,2),(6,1,56,1,1,2,2),(7,1,78,1,1,1,2),(8,1,29,1,1,1,2),(9,2,6,2,1,1,2),(10,2,9,2,2,2,2),(11,2,34,2,1,1,2),(12,2,56,2,1,2,2),(13,2,78,2,1,1,2),(14,2,29,2,1,1,2),(15,3,35,1,1,1,1),(16,3,78,1,1,1,1),(17,3,4,1,1,1,2),(18,3,35,1,1,1,2),(19,3,78,1,1,1,2),(20,3,29,1,1,1,2),(21,4,6,2,1,1,2),(22,4,35,2,1,1,2),(23,4,78,2,1,1,2),(24,4,29,2,1,1,2),(25,5,36,9,1,6,1),(26,5,71,9,1,7,1),(27,5,50,9,1,8,1),(28,5,78,9,1,1,1),(29,5,4,9,1,1,2),(30,5,6,9,2,6,2),(31,5,71,9,1,7,2),(32,5,50,9,1,8,2),(33,5,78,9,1,9,2),(34,5,29,9,1,9,2),(35,6,37,9,1,6,1),(36,6,71,9,1,7,1),(37,6,50,9,1,8,1),(38,6,78,9,1,1,1),(39,6,4,9,1,1,2),(40,6,6,9,2,6,2),(41,6,71,9,1,7,2),(42,6,50,9,1,8,2),(43,6,78,9,1,9,2),(44,6,29,9,1,9,2),(45,7,38,5,2,1,1),(46,7,78,5,2,1,1),(47,7,4,5,2,1,2),(48,7,9,5,1,2,2),(49,7,38,5,2,1,2),(50,7,56,5,2,2,2),(51,7,78,5,2,1,2),(52,7,29,5,2,1,2),(53,8,6,6,2,1,2),(54,8,9,6,1,2,2),(55,8,38,6,2,1,2),(56,8,56,6,2,2,2),(57,8,78,6,2,1,2),(58,8,29,6,2,1,2),(59,9,39,5,2,1,1),(60,9,78,5,2,1,1),(61,9,4,5,2,1,2),(62,9,39,5,2,1,2),(63,9,78,5,2,1,2),(64,9,29,5,2,1,2),(65,10,6,6,2,1,2),(66,10,39,6,2,1,2),(67,10,78,6,2,1,2),(68,10,29,6,2,1,2),(69,11,6,15,1,1,2),(70,11,41,15,1,1,2),(71,11,78,15,1,1,2),(72,11,29,15,1,1,2),(73,12,41,9,1,6,1),(74,12,71,9,1,7,1),(75,12,50,9,1,8,1),(76,12,78,9,1,1,1),(77,12,4,9,1,1,2),(78,12,6,9,2,6,2),(79,12,71,9,1,7,2),(80,12,50,9,1,8,2),(81,12,78,9,1,9,2),(82,12,29,9,1,9,2),(83,13,45,11,1,1,1),(84,13,78,11,1,1,1),(85,13,4,11,1,1,2),(86,13,45,11,1,1,2),(87,13,78,11,1,1,2),(88,13,25,11,1,1,2),(89,13,7,12,1,1,2),(90,13,45,12,1,1,2),(91,13,78,12,1,1,2),(92,13,25,12,1,1,2),(93,13,45,9,1,6,1),(94,13,71,9,1,7,1),(95,13,50,9,1,8,1),(96,13,78,9,1,1,1),(97,13,4,9,1,1,2),(98,13,7,9,2,6,2),(99,13,71,9,1,7,2),(100,13,50,9,1,8,2),(101,13,78,9,1,9,2),(102,13,29,9,1,9,2),(103,14,46,11,1,1,1),(104,14,78,11,1,1,1),(105,14,4,11,1,1,2),(106,14,13,11,2,1,2),(107,14,7,12,1,1,2),(108,14,13,12,2,1,2),(109,14,46,9,1,6,1),(110,14,71,9,1,7,1),(111,14,50,9,1,8,1),(112,14,78,9,1,1,1),(113,14,4,9,1,1,2),(114,14,7,9,2,6,2),(115,14,71,9,1,7,2),(116,14,50,9,1,8,2),(117,14,78,9,1,9,2),(118,14,29,9,1,9,2),(119,15,47,11,1,1,1),(120,15,78,11,1,1,1),(121,15,4,11,1,1,2),(122,15,12,11,2,1,2),(123,15,7,12,1,1,2),(124,15,12,12,2,1,2),(125,15,47,9,1,6,1),(126,15,71,9,1,7,1),(127,15,50,9,1,8,1),(128,15,78,9,1,1,1),(129,15,4,9,1,1,2),(130,15,7,9,2,6,2),(131,15,71,9,1,7,2),(132,15,50,9,1,8,2),(133,15,78,9,1,9,2),(134,15,29,9,1,9,2),(135,16,48,11,1,1,1),(136,16,78,11,1,1,1),(137,16,4,11,1,1,2),(138,16,48,11,1,1,2),(139,16,78,11,1,1,2),(140,16,29,11,1,1,2),(141,16,7,12,1,1,2),(142,16,48,12,1,1,2),(143,16,78,12,1,1,2),(144,16,29,12,1,1,2),(145,16,48,9,1,6,1),(146,16,71,9,1,7,1),(147,16,50,9,1,8,1),(148,16,78,9,1,1,1),(149,16,4,9,1,1,2),(150,16,7,9,2,6,2),(151,16,71,9,1,7,2),(152,16,50,9,1,8,2),(153,16,78,9,1,9,2),(154,16,29,9,1,9,2),(155,17,52,11,1,1,1),(156,17,78,11,1,1,1),(157,17,4,11,1,1,2),(158,17,52,11,1,1,2),(159,17,78,11,1,1,2),(160,17,29,11,1,1,2),(161,17,7,12,1,1,2),(162,17,52,12,1,1,2),(163,17,78,12,1,1,2),(164,17,29,12,1,1,2),(165,17,52,9,1,6,1),(166,17,71,9,1,7,1),(167,17,50,9,1,8,1),(168,17,78,9,1,1,1),(169,17,4,9,1,1,2),(170,17,7,9,2,6,2),(171,17,71,9,1,7,2),(172,17,50,9,1,8,2),(173,17,78,9,1,9,2),(174,17,29,9,1,9,2),(175,18,56,3,1,1,1),(176,18,78,3,2,1,1),(177,18,4,3,2,1,2),(178,18,9,3,1,1,2),(179,19,18,4,1,1,2),(180,19,9,4,1,1,2),(181,20,56,10,1,6,1),(182,20,49,10,1,7,1),(183,20,72,10,1,8,1),(184,20,78,10,1,1,1),(185,20,4,10,1,1,2),(186,20,18,10,2,6,2),(187,20,49,10,1,7,2),(188,20,72,10,1,8,2),(189,20,78,10,2,9,2),(190,20,29,10,2,9,2),(191,21,56,7,2,1,1),(192,21,78,7,1,1,1),(193,21,4,7,1,1,2),(194,21,9,7,2,1,2),(195,22,18,8,2,1,2),(196,22,9,8,2,1,2),(197,23,63,11,1,1,1),(198,23,78,11,2,1,1),(199,23,4,11,2,1,2),(200,23,63,11,1,1,2),(201,23,78,11,2,1,2),(202,23,29,11,2,1,2),(203,23,21,13,1,1,2),(204,23,63,13,1,1,2),(205,23,78,13,2,1,2),(206,23,29,13,2,1,2),(207,23,63,10,1,6,1),(208,23,49,10,1,7,1),(209,23,72,10,1,8,1),(210,23,78,10,1,1,1),(211,23,4,10,1,1,2),(212,23,21,10,2,6,2),(213,23,49,10,1,7,2),(214,23,72,10,1,8,2),(215,23,78,10,2,9,2),(216,23,29,10,2,9,2),(217,24,64,11,1,1,1),(218,24,78,11,2,1,1),(219,24,4,11,2,1,2),(220,24,64,11,1,1,2),(221,24,78,11,2,1,2),(222,24,29,11,2,1,2),(223,24,21,13,1,1,2),(224,24,64,13,1,1,2),(225,24,78,13,2,1,2),(226,24,29,13,2,1,2),(227,24,64,10,1,6,1),(228,24,49,10,1,7,1),(229,24,72,10,1,8,1),(230,24,78,10,1,1,1),(231,24,4,10,1,1,2),(232,24,21,10,2,6,2),(233,24,49,10,1,7,2),(234,24,72,10,1,8,2),(235,24,78,10,2,9,2),(236,24,29,10,2,9,2),(237,25,65,11,1,1,1),(238,25,78,11,2,1,1),(239,25,4,11,2,1,2),(240,25,65,11,1,1,2),(241,25,78,11,2,1,2),(242,25,29,11,2,1,2),(243,25,21,13,1,1,2),(244,25,65,13,1,1,2),(245,25,78,13,2,1,2),(246,25,29,13,2,1,2),(247,25,65,10,1,6,1),(248,25,49,10,1,7,1),(249,25,72,10,1,8,1),(250,25,78,10,1,1,1),(251,25,4,10,1,1,2),(252,25,21,10,2,6,2),(253,25,49,10,1,7,2),(254,25,72,10,1,8,2),(255,25,78,10,2,9,2),(256,25,29,10,2,9,2),(257,26,66,11,1,1,1),(258,26,78,11,2,1,1),(259,26,4,11,2,1,2),(260,26,66,11,1,1,2),(261,26,78,11,2,1,2),(262,26,29,11,2,1,2),(263,26,21,13,1,1,2),(264,26,66,13,1,1,2),(265,26,78,13,2,1,2),(266,26,29,13,2,1,2),(267,26,66,10,1,6,1),(268,26,49,10,1,7,1),(269,26,72,10,1,8,1),(270,26,78,10,1,1,1),(271,26,4,10,1,1,2),(272,26,21,10,2,6,2),(273,26,49,10,1,7,2),(274,26,72,10,1,8,2),(275,26,78,10,2,9,2),(276,26,29,10,2,9,2),(277,27,67,11,1,1,1),(278,27,78,11,2,1,1),(279,27,4,11,2,1,2),(280,27,67,11,1,1,2),(281,27,78,11,2,1,2),(282,27,29,11,2,1,2),(283,27,21,13,1,1,2),(284,27,67,13,1,1,2),(285,27,78,13,2,1,2),(286,27,29,13,2,1,2),(287,27,67,10,1,6,1),(288,27,49,10,1,7,1),(289,27,72,10,1,8,1),(290,27,78,10,1,1,1),(291,27,4,10,1,1,2),(292,27,21,10,2,6,2),(293,27,49,10,1,7,2),(294,27,72,10,1,8,2),(295,27,78,10,2,9,2),(296,27,29,10,2,9,2),(297,28,68,14,1,1,1),(298,28,78,14,2,1,1),(299,28,4,14,2,1,2),(300,28,68,14,1,1,2),(301,28,78,14,2,1,2),(302,28,29,14,2,1,2),(303,29,68,14,2,1,1),(304,29,78,14,1,1,1),(305,29,4,14,1,1,2),(306,29,68,14,2,1,2),(307,29,78,14,1,1,2),(308,29,29,14,1,1,2),(309,30,69,11,1,1,1),(310,30,78,11,2,1,1),(311,30,4,11,2,1,2),(312,30,69,11,1,1,2),(313,30,78,11,2,1,2),(314,30,29,11,2,1,2),(315,30,21,13,1,1,2),(316,30,69,13,1,1,2),(317,30,78,13,2,1,2),(318,30,29,13,2,1,2),(319,30,69,10,1,6,1),(320,30,49,10,1,7,1),(321,30,72,10,1,8,1),(322,30,78,10,1,1,1),(323,30,4,10,1,1,2),(324,30,21,10,2,6,2),(325,30,49,10,1,7,2),(326,30,72,10,1,8,2),(327,30,78,10,2,9,2),(328,30,29,10,2,9,2),(329,31,74,11,1,1,1),(330,31,78,11,2,1,1),(331,31,4,11,2,1,2),(332,31,74,11,1,1,2),(333,31,78,11,2,1,2),(334,31,29,11,2,1,2),(335,31,21,13,1,1,2),(336,31,74,13,1,1,2),(337,31,78,13,2,1,2),(338,31,29,13,2,1,2),(339,31,74,10,1,6,1),(340,31,49,10,1,7,1),(341,31,72,10,1,8,1),(342,31,78,10,1,1,1),(343,31,4,10,1,1,2),(344,31,21,10,2,6,2),(345,31,49,10,1,7,2),(346,31,72,10,1,8,2),(347,31,78,10,2,9,2),(348,31,29,10,2,9,2),(349,32,58,11,1,1,1),(350,32,78,11,2,1,1),(351,32,4,11,2,1,2),(352,32,12,11,1,1,2),(353,32,21,13,2,1,2),(354,32,12,13,1,1,2),(355,32,58,10,1,6,1),(356,32,49,10,1,7,1),(357,32,72,10,1,8,1),(358,32,78,10,1,1,1),(359,32,4,10,1,1,2),(360,32,21,10,2,6,2),(361,32,49,10,1,7,2),(362,32,72,10,1,8,2),(363,32,78,10,2,9,2),(364,32,29,10,2,9,2),(365,33,59,11,1,1,1),(366,33,78,11,2,1,1),(367,33,4,11,2,1,2),(368,33,13,11,1,1,2),(369,33,21,13,2,1,2),(370,33,13,13,1,1,2),(371,33,59,10,1,6,1),(372,33,49,10,1,7,1),(373,33,72,10,1,8,1),(374,33,78,10,1,1,1),(375,33,4,10,1,1,2),(376,33,21,10,2,6,2),(377,33,49,10,1,7,2),(378,33,72,10,1,8,2),(379,33,78,10,2,9,2),(380,33,29,10,2,9,2),(381,34,60,11,1,1,1),(382,34,78,11,2,1,1),(383,34,4,11,2,1,2),(384,34,14,11,1,1,2),(385,34,21,13,2,1,2),(386,34,14,13,1,1,2),(387,34,60,10,1,6,1),(388,34,49,10,1,7,1),(389,34,72,10,1,8,1),(390,34,78,10,1,1,1),(391,34,4,10,1,1,2),(392,34,21,10,2,6,2),(393,34,49,10,1,7,2),(394,34,72,10,1,8,2),(395,34,78,10,2,9,2),(396,34,29,10,2,9,2),(397,35,4,16,1,3,2),(398,35,19,16,1,4,2),(399,35,20,16,2,5,2),(400,36,49,10,1,7,1),(401,36,72,10,1,8,1),(402,36,78,10,2,9,1),(403,36,4,10,2,1,2),(404,36,19,10,2,6,2),(405,36,49,10,1,7,2),(406,36,72,10,1,8,2),(407,36,78,10,2,9,2),(408,36,29,10,2,9,2),(409,37,65,10,1,6,1),(410,37,49,10,1,7,1),(411,37,72,10,1,8,1),(412,37,78,10,2,1,1),(413,37,4,10,2,1,2),(414,37,19,10,2,6,2),(415,37,20,10,1,6,2),(416,37,65,10,1,6,2),(417,37,49,10,1,7,2),(418,37,72,10,1,8,2),(419,37,78,10,2,1,2),(420,37,29,10,2,1,2),(421,38,51,11,1,1,1),(422,38,78,11,1,1,1),(423,38,4,11,1,1,2),(424,38,51,11,1,1,2),(425,38,78,11,1,1,2),(426,38,30,11,1,1,2),(427,38,7,12,1,1,2),(428,38,51,12,1,1,2),(429,38,78,12,1,1,2),(430,38,30,12,1,1,2),(431,38,51,9,1,6,1),(432,38,71,9,1,7,1),(433,38,50,9,1,8,1),(434,38,78,9,1,1,1),(435,38,4,9,1,1,2),(436,38,7,9,2,6,2),(437,38,71,9,1,7,2),(438,38,50,9,1,8,2),(439,38,78,9,1,9,2),(440,38,29,9,1,9,2),(441,39,73,11,1,1,1),(442,39,78,11,2,1,1),(443,39,4,11,2,1,2),(444,39,73,11,1,1,2),(445,39,78,11,2,1,2),(446,39,30,11,2,1,2),(447,39,21,13,1,1,2),(448,39,73,13,1,1,2),(449,39,78,13,2,1,2),(450,39,30,13,2,1,2),(451,39,73,10,1,6,1),(452,39,49,10,1,7,1),(453,39,72,10,1,8,1),(454,39,78,10,1,1,1),(455,39,4,10,1,1,2),(456,39,21,10,2,6,2),(457,39,49,10,1,7,2),(458,39,72,10,1,8,2),(459,39,78,10,2,9,2),(460,39,29,10,2,9,2);
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
INSERT INTO `configuracao` VALUES (16,1,6,0,'','',1045.00,1,96,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,1,0,0,1,1,1,1,'','',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
INSERT INTO `conta` VALUES (1,16,1,0,'Caixa interno',1,0.00,0.00,'2022-11-22','','','',NULL,1,0);
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
INSERT INTO `empresa` VALUES (16,'Generic Inc','Generic Inc','08771592000157','','','2022-11-23','','',0,1,0);
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
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-11-23 10:22:15'),(2,2,'Cheque',1,2,2,1,0,1,'2022-11-23 10:22:15'),(3,3,'Cartão',1,3,3,0,0,0,'2022-11-23 10:22:15'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-11-23 10:22:15'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-11-23 10:22:15'),(6,6,'PIX',1,6,17,0,0,1,'2022-11-23 10:22:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,95,3),(1,96,4),(1,97,5),(1,98,6),(2,99,7),(2,100,8),(2,101,9),(2,102,10),(3,119,11),(3,120,12),(3,121,13),(4,122,14),(4,123,15);
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
INSERT INTO `operacao_empresa` VALUES (1,16,1,1,0),(2,16,1,1,0),(3,16,1,1,0),(4,16,1,1,0);
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-11-23 10:22:15'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-11-23 10:22:15'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-11-23 10:22:15'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-11-23 10:22:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2022-11-23 10:22:02','dbf5996ab5ef46860db15af2f2655f62'),(2,2,'20221114.182125.297','2022-11-23 10:22:02','2055538edaeba22188be7171569e96c9'),(3,2,'20220927.231853.021-financas','2022-11-23 10:22:02','25e4a38d37e52304bf04695aaea9d5dd'),(4,2,'20220927.231856.052-financas','2022-11-23 10:22:02','dc3415ef889879fdcb842ec7276b47e8'),(5,2,'20220927.231859.082-financas','2022-11-23 10:22:02','3668bc558b5b84c1c7367dfb3f9ea654'),(6,2,'20220927.231902.116-financas','2022-11-23 10:22:02','b54e686525ada88ae1a0358c0e986ba3'),(7,2,'20220927.231905.158-financas','2022-11-23 10:22:02','cd6bcb8fc8a705424f6b951c9c1a19c4'),(8,2,'20220927.231908.190-financas','2022-11-23 10:22:02','30fa6853c3c8f5fc6c6be0c58d3b4124'),(9,2,'20220927.231911.215-financas','2022-11-23 10:22:02','165375341432c13fa7daf0e19243a5c4'),(10,2,'20220927.231914.237-financas','2022-11-23 10:22:02','7850c1a082d3b0d441f213691fc15617'),(11,2,'20220927.231917.275-financas','2022-11-23 10:22:02','fa0c899ecd21af55a8bea537717132d4'),(12,2,'20220927.231920.311-financas','2022-11-23 10:22:02','244a61a699d4a58f1b779b2c7f7ab563'),(13,2,'20220927.231923.342-financas','2022-11-23 10:22:02','37b4119af87162f1d7fba76bfe08aabf'),(14,2,'20220927.231926.383-financas','2022-11-23 10:22:02','427ac23ebade9b75f448d01db79fddb0'),(15,2,'20220927.231929.422-financas','2022-11-23 10:22:02','e6bd543b7db0655db97475d3c99371c8'),(16,2,'20220927.231932.449-financas','2022-11-23 10:22:03','13c51a01cb5ad98ea4898433439d2883'),(17,2,'20220927.231935.475-financas','2022-11-23 10:22:03','f074caa16c9b4eadb34b6e60d2bebfd0'),(18,2,'20220927.231938.503-financas','2022-11-23 10:22:03','e0337265441583de2a52498a0f074f15'),(19,2,'20220927.231941.539-financas','2022-11-23 10:22:03','5f06d7db5ce0d37901a12d2c95a23021'),(20,2,'20220927.231944.560-financas','2022-11-23 10:22:03','357d64219aec54d4d33048eff9484bd3'),(21,2,'20220927.231947.591-financas','2022-11-23 10:22:03','b7f5caf8a670147314813817f745d9d3'),(22,2,'20220927.231950.619-financas','2022-11-23 10:22:03','bc94747b16167c60d67310888b4b4d82'),(23,2,'20220927.231953.643-financas','2022-11-23 10:22:03','bdeb9b7cf24458417025499368af8a22'),(24,2,'20220927.231956.678-financas','2022-11-23 10:22:03','68d9145d36348d5f24b245834538b619'),(25,2,'20220927.231959.720-financas','2022-11-23 10:22:03','d88c26e37ac491a8f4ef0ac7cb8545ac'),(26,2,'20220927.232002.752-financas','2022-11-23 10:22:03','0ca157ed24122047a66fb563ece2a6e5'),(27,2,'20220927.232005.779-financas','2022-11-23 10:22:03','9b7c94a62eee5b87c032898d98b0bace'),(28,2,'20220927.232008.813-financas','2022-11-23 10:22:03','56f6ff0a92f71c8b11b816423d815278'),(29,2,'20220927.232011.839-financas','2022-11-23 10:22:03','aec50290aca12e89c155806c04f9d638'),(30,2,'20220927.232014.867-financas','2022-11-23 10:22:03','16dd1769ec2f1db7ba900740ffe8ba17'),(31,2,'20220927.232017.894-financas','2022-11-23 10:22:03','be43fe476b718902983b6d885c139f15'),(32,2,'20220927.232020.927-financas','2022-11-23 10:22:03','d7e5a1d380c5b5c4ed4342d3533275e2'),(33,2,'20220927.232023.968-financas','2022-11-23 10:22:03','bae176cf6f578a9506608748ccf6ad2b'),(34,2,'20220927.232026.997-financas','2022-11-23 10:22:03','6db5bdecc56381e98c36dea7b3df8fec'),(35,2,'20220927.232030.018-financas','2022-11-23 10:22:03','25034e7cb86571bcbada9a4a70823f61'),(36,2,'20220927.232033.051-financas','2022-11-23 10:22:03','1e90af66dd31175c48a2787bd435a8b8'),(37,2,'20220927.232036.093-financas','2022-11-23 10:22:03','3aa4ca4a7d978374d1f54e756e57188f'),(38,2,'20220927.232039.127-financas','2022-11-23 10:22:03','573c35a223c1342045d0dca267a3c1e9'),(39,2,'20220927.232042.162-financas','2022-11-23 10:22:03','cc8105b5a65df76fca174ea9ced82aee'),(40,2,'20220927.232045.187-financas','2022-11-23 10:22:03','d275846b076990860060b51ae3118453'),(41,2,'20220927.232048.220-financas','2022-11-23 10:22:03','f04216480988b4dccab735d3e3703a27'),(42,2,'20220927.232051.257-financas','2022-11-23 10:22:03','fae688de1ca44487afa2b5dcb4f7247e'),(43,2,'20220927.232054.286-financas','2022-11-23 10:22:03','45d58ca8c7962f5684f86ac04e9ef1cd'),(44,2,'20220927.232057.328-financas','2022-11-23 10:22:03','d0945f2da2ea1380bc20a02e035cba4c'),(45,2,'20220927.232100.367-financas','2022-11-23 10:22:03','ff17dad74f754d0116d22af89e194a1a'),(46,2,'20220927.232103.395-financas','2022-11-23 10:22:03','b1032f3f1d8669664575721ec1a14d72'),(47,2,'20220927.232106.423-financas','2022-11-23 10:22:03','51031a39a290beba3bebd084beaa24a5'),(48,2,'20220927.232109.456-financas','2022-11-23 10:22:03','6dd766053bbb8c57d374d8341efad753'),(49,2,'20220927.232112.491-financas','2022-11-23 10:22:03','2c08d2d3b165c9778f2107eb19ef28d7'),(50,2,'20220927.232115.513-financas','2022-11-23 10:22:03','671b1b53f61b38a79c68d1e851c71f04'),(51,2,'20220927.232118.547-financas','2022-11-23 10:22:03','91046c2bbd8244f21c4c59579fc37f85'),(52,2,'20220927.232121.575-financas','2022-11-23 10:22:03','952f6badb247c859154f639c7b398530'),(53,2,'20220927.232124.607-financas','2022-11-23 10:22:03','3d7af3ac04cf0baf301dfcc143185b20'),(54,2,'20220927.232127.635-financas','2022-11-23 10:22:03','9b72b05d84b7bd906c98c98ff76b0b77'),(55,2,'20220927.232130.676-financas','2022-11-23 10:22:03','323e9466673cb9fc6263fb9c96cf5a86'),(56,2,'20220927.232133.705-financas','2022-11-23 10:22:03','d615d9ca333db4cc3fdbc395d70a589d'),(57,2,'20220927.232136.737-financas','2022-11-23 10:22:03','494b7bb94e646acb4ef0ba63d6073787'),(58,2,'20220927.232139.771-financas','2022-11-23 10:22:03','6636f39b3f7f89ccd6543860c4761db1'),(59,2,'20220927.232142.802-financas','2022-11-23 10:22:03','c4c06634558ee3a8d13c902912ae02d5'),(60,2,'20220927.232145.829-financas','2022-11-23 10:22:03','61e384f8113cade5c3c31c204b4b00e6'),(61,2,'20220927.232148.858-financas','2022-11-23 10:22:03','ee76818675fdae26c87b71cd171b58a9'),(62,2,'20220927.232151.889-financas','2022-11-23 10:22:03','caf825889463f3d977a39708e73f8ab4'),(63,2,'20220927.232154.913-financas','2022-11-23 10:22:03','34c642f342f2b0365d4d66c799a8bc94'),(64,2,'20220927.232157.949-financas','2022-11-23 10:22:03','03ed894a4e5c893b33616dea07884638'),(65,2,'20220927.232200.972-financas','2022-11-23 10:22:03','52a406e01d4b59e2de6ccedea2e617d2'),(66,2,'20220927.232204.006-financas','2022-11-23 10:22:03','a0b8703ecb81027eb93d01ddbe8fd3a4'),(67,2,'20220927.232207.039-financas','2022-11-23 10:22:03','b13a7d54e6ea818604e39e0b19efbde9'),(68,2,'20220927.232210.064-financas','2022-11-23 10:22:03','e6b2f291fe01b5713c8d743e106e57bd'),(69,2,'20220927.232213.090-financas','2022-11-23 10:22:03','7b46bd7cfacff8ed448e4727501e42a2'),(70,2,'20220927.232216.129-financas','2022-11-23 10:22:03','2c1dff69f89d101ba80b2aa7e3b9099b'),(71,2,'20220927.232219.167-financas','2022-11-23 10:22:03','2449531e4acc8a5235c0459fd042429b'),(72,2,'20220927.232222.193-financas','2022-11-23 10:22:03','a465deb8ee8c5be8c31564e0e22664c5'),(73,2,'20220927.232225.219-financas','2022-11-23 10:22:03','0c362abeddbf2728e89a5d995c070218'),(74,2,'20220927.232228.256-financas','2022-11-23 10:22:03','831a914d126e8b85ebbc631a14bf4d4b'),(75,2,'20220927.232231.283-financas','2022-11-23 10:22:03','d2b4177567c5cfadce2e5a6bcac4e0c8'),(76,2,'20220927.232234.314-financas','2022-11-23 10:22:03','c405aab5e414ba3775d95b2a30b39383'),(77,2,'20220927.232237.348-financas','2022-11-23 10:22:03','27c2a55bf29d55b6925697f1d7441246'),(78,2,'20220927.232240.374-financas','2022-11-23 10:22:03','5f414c464da5e6852c00589c4ad55e6c'),(79,2,'20220927.232243.406-financas','2022-11-23 10:22:03','66782d81da98254c41f0b8e4231a7b5b'),(80,2,'20220927.232246.448-financas','2022-11-23 10:22:03','970602ee988462714def0055193a73a8'),(81,2,'20220927.232249.485-financas','2022-11-23 10:22:03','10b4d8b575340d2de3acb91a9c883321'),(82,2,'20220927.232252.522-financas','2022-11-23 10:22:03','cfffcceddb49ca8972b21849ece1946a'),(83,2,'20220927.232255.558-financas','2022-11-23 10:22:03','e81910a75c40c42a6f3063dd471936b1'),(84,2,'20220927.232258.583-financas','2022-11-23 10:22:03','7b1a9a832301f25dd0d30d317f3b2910'),(85,2,'20220927.232301.622-financas','2022-11-23 10:22:03','032069d8d066f4eed817801b2fddc6b9'),(86,2,'20220927.232304.657-financas','2022-11-23 10:22:03','14d251d46fec1ab013e65ca51bccf810'),(87,2,'20220927.232307.681-financas','2022-11-23 10:22:03','d5b544ee4a5a91718cc5343688eeaf9b'),(88,2,'20220927.232310.703-financas','2022-11-23 10:22:03','520326eef04ba63511fcfe78534ec087'),(89,2,'20220927.232313.739-financas','2022-11-23 10:22:03','0eebf70942e16d00795c832610a8810d'),(90,2,'20220927.232316.772-financas','2022-11-23 10:22:03','a1576979644f887b505644af470c1060'),(91,2,'20220927.232319.805-financas','2022-11-23 10:22:03','35a46c31561a442ae815f8276dbbf6f7'),(92,2,'20220927.232322.838-financas','2022-11-23 10:22:03','1915048c0b5bb9d40d83ee48008faa9c'),(93,2,'20220927.232325.873-financas','2022-11-23 10:22:03','a8ff71e7a34d6cd9c806e90290dc87f8'),(94,2,'20220927.232328.902-financas','2022-11-23 10:22:03','ea9c3a7af342ca3aff0a58e6457dafa6'),(95,2,'20220927.232331.926-financas','2022-11-23 10:22:03','4ac9f45debdcfce0944ad0a16c407dbe'),(96,2,'20220927.232334.967-financas','2022-11-23 10:22:03','fd69b83a52fd9cec606afbbace093e32'),(97,2,'20220927.232338.003-financas','2022-11-23 10:22:03','15f6a205d0e92d29095a86ab3f95b004'),(98,2,'20220927.232341.029-financas','2022-11-23 10:22:03','f644b38bf99e9089c7d02dea7885c941'),(99,2,'20220927.232344.066-financas','2022-11-23 10:22:03','bcf0373a78269e57b2c81bf183fa04ca'),(100,2,'20220927.232347.103-financas','2022-11-23 10:22:03','9ddc19d7f80f27fcb87b1104145563ef'),(101,2,'20220927.232350.132-financas','2022-11-23 10:22:03','438f7d3f5dd2ed51fb63408baab1cdf5'),(102,2,'20220927.232353.175-financas','2022-11-23 10:22:03','81f7cb6e190968da4243c783f73827ff'),(103,2,'20220927.232356.206-financas','2022-11-23 10:22:03','20a5ae743e009a1f9b2ebbe810fd9d03'),(104,2,'20220927.232359.244-financas','2022-11-23 10:22:03','b3d9334e8e6c9dafd8b6bc42e7ffc790'),(105,2,'20220927.232402.269-financas','2022-11-23 10:22:03','a84b2e5f8e56b2c25d4325d7ab8923e7'),(106,2,'20220927.232405.304-financas','2022-11-23 10:22:03','038902c0c30254362569852a37136fef'),(107,2,'20220927.232408.343-financas','2022-11-23 10:22:03','a944390994b78666015c8c7181f100b1'),(108,2,'20220927.232411.376-financas','2022-11-23 10:22:03','80dfca1776c1e9e8674feac989644ad6'),(109,2,'20220927.232414.410-financas','2022-11-23 10:22:03','23f26e7746c5cdd49574abb97981276d'),(110,2,'20220927.232417.444-financas','2022-11-23 10:22:03','3fe897966c53f71f31071ab5480ab862'),(111,2,'20220927.232420.471-financas','2022-11-23 10:22:03','3bfdd6800cce12b30798f8f7b3ec6a28'),(112,2,'20220927.232423.505-financas','2022-11-23 10:22:03','429112d5f4b805e2eb35e344ca32f84e'),(113,2,'20220927.232426.546-financas','2022-11-23 10:22:03','c8515928a034963ca9b97d6b30195512'),(114,2,'20220927.232429.583-financas','2022-11-23 10:22:03','02a07046584b6924ba2ec6e48f4f5ae2'),(115,2,'20220927.232432.614-financas','2022-11-23 10:22:03','60fda6fac582b395e83347337d6c1fb1'),(116,2,'20220927.232435.654-financas','2022-11-23 10:22:03','8c999e8453337284cb4e586cc0597f00'),(117,2,'20220927.232438.684-financas','2022-11-23 10:22:03','741052e633e75059a20cd7fce2dbba3e'),(118,2,'20220927.232441.715-financas','2022-11-23 10:22:03','e4441c651a3285a37b6560f21e587323'),(119,2,'20220927.232444.751-financas','2022-11-23 10:22:03','3404b53b368287d5c7a124b6395579c9'),(120,2,'20220927.232447.784-financas','2022-11-23 10:22:03','91b847ce22b490300a9fae69108b1603'),(121,2,'20220927.232450.819-financas','2022-11-23 10:22:03','905ca89d1851538e0f88cef05ce9f02d'),(122,2,'20220927.232453.859-financas','2022-11-23 10:22:03','af605f0a39295ebccc2f1dd987a06423'),(123,2,'20220927.232456.892-financas','2022-11-23 10:22:03','7e7856f21652d9cac0cfe1fa1f078432'),(124,2,'20220927.232459.921-financas','2022-11-23 10:22:03','fa34a54716d052974fafdbf31fefdfbf'),(125,2,'20220927.232502.953-financas','2022-11-23 10:22:03','4de68038e800758043db0453ea9807e1'),(126,2,'20220927.232505.981-financas','2022-11-23 10:22:03','3077dfac3877614d6a551c0484110669'),(127,2,'20220927.232509.010-financas','2022-11-23 10:22:03','f6191fd5534884e3f593a4771d1a752b'),(128,2,'20220927.232512.043-financas','2022-11-23 10:22:03','9713c80990ca4d670420dc011d134338'),(129,2,'20220927.232515.073-financas','2022-11-23 10:22:03','daf8101a87e942c0e1ec465f111d4e54'),(130,2,'20220927.232518.111-financas','2022-11-23 10:22:03','f60ff7d25cb2504b47d39f8cefd342b6'),(131,2,'20220927.232521.154-financas','2022-11-23 10:22:03','22769eef269ccbfbe9844f674021c28d'),(132,2,'20220927.232524.192-financas','2022-11-23 10:22:03','1b42ad15523eeff2ce9a1aa92c9f13fa'),(133,2,'20220927.232527.226-financas','2022-11-23 10:22:03','fca74aca3b1d45fb31e1c2b9075d5818'),(134,2,'20220927.232530.257-financas','2022-11-23 10:22:03','3f0e3bb4041341089a356c80eaf83f53'),(135,2,'20220927.232533.279-financas','2022-11-23 10:22:03','4fc6731e324255617d20acab7e4f8e0f'),(136,2,'20220927.232536.304-financas','2022-11-23 10:22:03','8f423b236601ce662ddf131aa6e1d1cd'),(137,2,'20220927.232539.334-financas','2022-11-23 10:22:03','045be286e5d582dac6646a98345d1f83'),(138,2,'20220927.232542.376-financas','2022-11-23 10:22:03','a4a48a11f9a7b43809456844f88232bc'),(139,2,'20220927.232545.411-financas','2022-11-23 10:22:03','e10754db731c755dc1c651cd836d96a3'),(140,2,'20220927.232548.441-financas','2022-11-23 10:22:03','6910b36d8ed0b03dac06607ba470166f'),(141,2,'20220927.232551.469-financas','2022-11-23 10:22:03','180bf53af64db58ff599f6845799c1c3'),(142,2,'20220927.232554.498-financas','2022-11-23 10:22:03','b504fd6930dca5eec17ee69f19b7f2dd'),(143,2,'20220927.232557.529-financas','2022-11-23 10:22:03','e152a1dbb49b3579ddad63063e22fec0'),(144,2,'20220927.232600.560-financas','2022-11-23 10:22:03','df471c912a9feafcdaeafa967c3f0dde'),(145,2,'20220927.232603.602-financas','2022-11-23 10:22:03','9f1515495c9a0f81157a278df941e12a'),(146,2,'20220927.232606.641-financas','2022-11-23 10:22:03','585b117123cbc5d5e2de64e6fc85195d'),(147,2,'20220927.232609.672-financas','2022-11-23 10:22:03','b1f1b831746cc6d01c7d6fbe9ec88fd9'),(148,2,'20220927.232612.696-financas','2022-11-23 10:22:03','e25737bb9b524e4045632d237aeef673'),(149,2,'20220927.232615.725-financas','2022-11-23 10:22:03','b516280721360005a9fca80b5b2701c0'),(150,2,'20220927.232618.759-financas','2022-11-23 10:22:03','234dbbec7495f7eebcceed15398c0d71'),(151,2,'20220927.232621.791-financas','2022-11-23 10:22:03','31f9aec2a095d8c3eb4e5abbcbb6b6b4'),(152,2,'20220927.232624.818-financas','2022-11-23 10:22:03','156184034ffd7f1e45578486953d8e34'),(153,2,'20220927.232627.854-financas','2022-11-23 10:22:03','86727da8d21cfbaf2a65a1a40f2562ad'),(154,2,'20220927.232630.891-financas','2022-11-23 10:22:03','4d476c54d9a00cd2a3050eab9df6fcfb'),(155,2,'20220927.232633.913-financas','2022-11-23 10:22:03','0eac42630006fc95cec9e746597f71c6'),(156,2,'20220927.232636.944-financas','2022-11-23 10:22:03','1bd4041ef1ca5b1b61db202a03af9877'),(157,2,'20220927.232639.974-financas','2022-11-23 10:22:03','0496eda436848af68e9d1f444d2dfc5f'),(158,2,'20220927.232643.008-financas','2022-11-23 10:22:03','5c27635455de84188e638435e4d4e2cd'),(159,2,'20220927.232646.039-financas','2022-11-23 10:22:03','4acf202b782bf8450f134c2e6dc08c6b'),(160,2,'20220927.232649.072-financas','2022-11-23 10:22:03','e7d80b472bc5cbc649bee0a51b2078b2'),(161,2,'20220927.232652.103-financas','2022-11-23 10:22:03','89d926f19d21e61f5a8778738d049348'),(162,2,'20220927.232655.134-financas','2022-11-23 10:22:03','cee50e100ae2add272c57067f2bfa036'),(163,2,'20220927.232658.169-financas','2022-11-23 10:22:03','d1bf64d8cd31ef94a26f5e6fcddfb9b9'),(164,2,'20220927.232701.204-financas','2022-11-23 10:22:03','661c50c24ab55912439ee49f2c3aaa2e'),(165,2,'20220927.232704.237-financas','2022-11-23 10:22:03','ad5c36dc8cdeda11d3d16e957ed54a06'),(166,2,'20220927.232707.265-financas','2022-11-23 10:22:03','be63812566e76db5cfdec456b08fb822'),(167,2,'20220927.232710.291-financas','2022-11-23 10:22:03','7da5bbd1695a2bfe76c541b79b3a4fb9'),(168,2,'20220927.232713.319-financas','2022-11-23 10:22:03','e585f179a2620c8c9f5828803e3936f3'),(169,2,'20220927.232716.345-financas','2022-11-23 10:22:03','94612419306c57d659b737be4070dee0'),(170,2,'20220927.232719.376-financas','2022-11-23 10:22:03','85dc6c34cb06c44535cc683045fd12ad'),(171,2,'20220927.232722.413-financas','2022-11-23 10:22:03','7341e928e5e1b5b86b3d9c7e3c703866'),(172,2,'20220927.232725.451-financas','2022-11-23 10:22:03','59efc26aafee9a917a567bfda52d71ff'),(173,2,'20220927.232728.475-financas','2022-11-23 10:22:03','5acbd0da0701bdc216ccca148ac9374b'),(174,2,'20220927.232731.509-financas','2022-11-23 10:22:03','04a9a0c67484160f14283d8e04640039'),(175,2,'20220927.232734.538-financas','2022-11-23 10:22:03','5f7d06ccf2613ec16d7bfbbe3d5454f6'),(176,2,'20220927.232737.569-financas','2022-11-23 10:22:03','b7a0ee311a6a8444699980d2fe677f24'),(177,2,'20220927.232740.596-financas','2022-11-23 10:22:03','4e4f106e075d3a7e83a270978397b7b2'),(178,2,'20220927.232743.629-financas','2022-11-23 10:22:03','787bde47544b1d78576951e0d85a7bc6'),(179,2,'20220927.232746.669-financas','2022-11-23 10:22:03','bb7419e521361cd3e36a5867f136c190'),(180,2,'20220927.232749.707-financas','2022-11-23 10:22:03','bc05faa4a8dbb3b9bceee751f20b2ef9'),(181,2,'20220927.232752.736-financas','2022-11-23 10:22:03','65c7353442ea7f1534288f4855967c9e'),(182,2,'20220927.232755.766-financas','2022-11-23 10:22:03','65b3105eb222cb0f32bc83ec5573400a'),(183,2,'20220927.232758.799-financas','2022-11-23 10:22:03','d612e2d148aea362903db9ec65c90a4a'),(184,2,'20220927.232801.839-financas','2022-11-23 10:22:03','b64f2122d6919d016a03c956940f0287'),(185,2,'20220927.232804.868-financas','2022-11-23 10:22:03','fb6770689b7fa0a3e581f5e4e0725656'),(186,2,'20220927.232807.904-financas','2022-11-23 10:22:03','5688a760f5cf8021a6a8db029e0e027d'),(187,2,'20220927.232810.940-financas','2022-11-23 10:22:03','765203194737cc2c9d12d333daaef1f4'),(188,2,'20220927.232813.974-financas','2022-11-23 10:22:03','f026f6c0c9580e767172b3f9fff360ad'),(189,2,'20220927.232817.010-financas','2022-11-23 10:22:03','623542a03dc84ab9866e085e9c23d5bd'),(190,2,'20220927.232820.040-financas','2022-11-23 10:22:03','12df508545ca8eb8bf986a527934bb44'),(191,2,'20220927.232823.062-financas','2022-11-23 10:22:03','cc874808a751f6dacea784c3bf4b87f5'),(192,2,'20220927.232826.092-financas','2022-11-23 10:22:03','eacc1b11e885717a59b304f32e91fa40'),(193,2,'20220927.232829.122-financas','2022-11-23 10:22:03','0a20217b2f04649bc9012b57c6a92905'),(194,2,'20220927.232832.143-financas','2022-11-23 10:22:03','8001c81e90b3570ec8abbe96c558c17d'),(195,2,'20220927.232835.174-financas','2022-11-23 10:22:03','136431a2533348c8368141491924a6f3'),(196,2,'20220927.232838.193-financas','2022-11-23 10:22:03','3e08df2619a284a1b4a80baeb815c51c'),(197,2,'20220927.232841.224-financas','2022-11-23 10:22:03','d30c1e545a8f39d8edd13819ee81ba09'),(198,2,'20220927.232844.252-financas','2022-11-23 10:22:03','872ab93ee51dd6d3c2899d9ff1da9734'),(199,2,'20220927.232847.290-financas','2022-11-23 10:22:03','a0a58ccf8d6f5b731daf01e26ea4ffde'),(200,2,'20220927.232850.325-financas','2022-11-23 10:22:03','842cdf146ad20c67c348ed0134a6c416'),(201,2,'20220927.232853.357-financas','2022-11-23 10:22:03','406fbc408d15964e5772656955e52027'),(202,2,'20220927.232856.391-financas','2022-11-23 10:22:03','1dcf3996caa44b7bee346c692859ed32'),(203,2,'20220927.232859.421-financas','2022-11-23 10:22:03','e1158df16bcd6d401fe5721e17aa0e97'),(204,2,'20220927.232902.454-financas','2022-11-23 10:22:03','3ead2a382f2a01214633531f3b658366'),(205,2,'20220927.232905.477-financas','2022-11-23 10:22:03','6b80668004b6b60d9ded6920772dcd30'),(206,2,'20220927.232908.500-financas','2022-11-23 10:22:03','5cfbb3ccce621a4278b4155fba116449'),(207,2,'20220927.232911.522-financas','2022-11-23 10:22:03','78e1a7d17de60afb6933c0694b57092c'),(208,2,'20220927.232914.565-financas','2022-11-23 10:22:03','eea30116aa8551776904a28fd779348d'),(209,2,'20220927.232917.598-financas','2022-11-23 10:22:03','10af4294cf97d732c9189dae56e8b06c'),(210,2,'20220927.232920.621-financas','2022-11-23 10:22:03','4939b38eb240e54292c59fdc6dd4b798'),(211,2,'20220927.232923.657-financas','2022-11-23 10:22:03','db9d1effbfa800fd8e5b84ff2757b600'),(212,2,'20220927.232926.695-financas','2022-11-23 10:22:03','ff492e6a396b35f3ec19e10644942a12'),(213,2,'20220927.232929.719-financas','2022-11-23 10:22:03','493737f66635def8324f21874fb3b1bb'),(214,2,'20220927.232932.746-financas','2022-11-23 10:22:03','6f7367a9b353e6d2626b143423a46363'),(215,2,'20220927.232935.782-financas','2022-11-23 10:22:03','c72ad681c39fb559e2f65fd1f059cb18'),(216,2,'20220927.232938.815-financas','2022-11-23 10:22:03','07b4fa3c45b0107bbad93e78c1298956'),(217,2,'20220927.232941.849-financas','2022-11-23 10:22:03','cfe7b79be9ec6fdf0f2e0fd4dabbe725'),(218,2,'20220927.232944.888-financas','2022-11-23 10:22:03','3701225cfb213d0f934e8b4d0a4b8ccc'),(219,2,'20220927.232947.917-financas','2022-11-23 10:22:03','6e3863f431b06c2de8a5687afcc92047'),(220,2,'20220927.232950.951-financas','2022-11-23 10:22:03','b5508f6acb5f077372df44effd85f5da'),(221,2,'20220927.232953.974-financas','2022-11-23 10:22:03','a0f4ade3589973992f19b7523be802c4'),(222,2,'20220927.232957.014-financas','2022-11-23 10:22:03','3ebbd57566caa48315707e3c15599cd1'),(223,2,'20220927.233000.051-financas','2022-11-23 10:22:03','4dc2eda624a2b1ef55fa59b104829dc7'),(224,2,'20220927.233003.079-financas','2022-11-23 10:22:03','d25b103d142bc1a29722ccd8048cf42f'),(225,2,'20220927.233006.103-financas','2022-11-23 10:22:03','848b6195d12769642b2a8042f4119514'),(226,2,'20220927.233009.138-financas','2022-11-23 10:22:03','ff168b3281d30bb69afd8de9da8e27c2'),(227,2,'20220927.233012.173-financas','2022-11-23 10:22:03','bfa05f042cd1d84ee09cc94d21cdcfbb'),(228,2,'20220927.233015.214-financas','2022-11-23 10:22:03','7366e4e9ddd9f767ec490433150d0794'),(229,2,'20220927.233018.251-financas','2022-11-23 10:22:03','114b166960d286fbdbeee671653750b9'),(230,2,'20220927.233021.285-financas','2022-11-23 10:22:03','fa0ebda700bd7d2731f0e4760103aa1c'),(231,2,'20220927.233024.319-financas','2022-11-23 10:22:03','752ec86042c30c8efbf467d37fd39a26'),(232,2,'20220927.233027.356-financas','2022-11-23 10:22:03','a662080d70478246c1537b0d1464d9e8'),(233,2,'20220927.233030.384-financas','2022-11-23 10:22:03','d301fbbeef3850c89c797d9f8b7d0293'),(234,2,'20220927.233033.418-financas','2022-11-23 10:22:03','463074e834603a2d4f9796d83f221b8a'),(235,2,'20220927.233036.448-financas','2022-11-23 10:22:03','51bba85647e90ed4e1dbd83c51425121'),(236,2,'20220927.233039.475-financas','2022-11-23 10:22:03','3a468634f23c15398f1757a4f794396d'),(237,2,'20220927.233042.508-financas','2022-11-23 10:22:03','03ca185922d44e80bf23d041613c98b0'),(238,2,'20220927.233045.537-financas','2022-11-23 10:22:03','678f97cd5ab5d1f48b77f7f085ad4abf'),(239,2,'20220927.233048.574-financas','2022-11-23 10:22:03','8a01ca52ed5d2d7420221af50526b0ee'),(240,2,'20220927.233051.607-financas','2022-11-23 10:22:03','8bdbb8383f4cd6dd787e7ed8fbc63ae8'),(241,2,'20220927.233054.633-financas','2022-11-23 10:22:03','d2caad05e2e35c8d57a128acd2787c3d'),(242,2,'20220927.233057.670-financas','2022-11-23 10:22:03','25c31ea8766cc050b332a9e75c5ca0cd'),(243,2,'20220927.233100.705-financas','2022-11-23 10:22:03','eb8920e8496f6b60e004281917817d22'),(244,2,'20220927.233103.739-financas','2022-11-23 10:22:03','e0159e5d882ce9f1d04f177e5775e1a4'),(245,2,'20220927.233106.773-financas','2022-11-23 10:22:03','63269aa0cf2a5b9efa2c70b412d83fbf'),(246,2,'20220927.233109.798-financas','2022-11-23 10:22:03','17708aeeb48e9034303d5da96e105af1'),(247,2,'20220927.233112.826-financas','2022-11-23 10:22:03','15ee9dcfa706908add882839327fbe52'),(248,2,'20220927.233115.869-financas','2022-11-23 10:22:03','c7b2c2a2dc735e4be8006781fd9b8c14'),(249,2,'20220927.233118.907-financas','2022-11-23 10:22:03','d40ff720b11dbf85e0de8f7eeb54bc76'),(250,2,'20220927.233121.950-financas','2022-11-23 10:22:03','bcab3f7aa8033f89b03dfab4a5b131bc'),(251,2,'20220927.233124.971-financas','2022-11-23 10:22:03','3ba6759785c48ca128d2614950d08695'),(252,2,'20220927.233127.996-financas','2022-11-23 10:22:03','8e0b19c2ab3b60d290838db609452dcf'),(253,2,'20220927.233131.020-financas','2022-11-23 10:22:03','52ee03b0a517bcfca85fbeb55c7fdde6'),(254,2,'20220927.233134.048-financas','2022-11-23 10:22:03','8e04dbf9a74031bc3e9f17c8f688f26f'),(255,2,'20220927.233137.082-financas','2022-11-23 10:22:03','332a351a74d1158e77018e9438c35ae0'),(256,2,'20220927.233140.114-financas','2022-11-23 10:22:03','e36e197a5b5cfaf66fbce432826bbcfe'),(257,2,'20220927.233143.138-financas','2022-11-23 10:22:03','1738fe9bda691b98203cd288263a0c78'),(258,2,'20220927.233146.165-financas','2022-11-23 10:22:03','d2a82285c2997428f6b021233bf923f0'),(259,2,'20220927.233149.197-financas','2022-11-23 10:22:03','abe8d88d5bc87cb29cb4415e8539bc4e'),(260,2,'20220927.233152.220-financas','2022-11-23 10:22:03','954f56fbd7c8701631d4080f56e71609'),(261,2,'20220927.233155.254-financas','2022-11-23 10:22:03','9184cef16dc0356685f938bb4c7cbbfe'),(262,2,'20220927.233158.293-financas','2022-11-23 10:22:03','5abf1e7b5dcbbe2e09a3f976af7673c3'),(263,2,'20220927.233201.333-financas','2022-11-23 10:22:03','0074aca072cf1407ffd44b32e4a177cc'),(264,2,'20220927.233204.354-financas','2022-11-23 10:22:03','f14f31657855c22d5c6a4e876b06138b'),(265,2,'20220927.233207.389-financas','2022-11-23 10:22:03','ada82d9c4ac0ce9afa3423032f845a3a'),(266,2,'20220927.233210.421-financas','2022-11-23 10:22:03','7b51b1b9b288a12f95e6dbebc5d6e9e2'),(267,2,'20220927.233213.451-financas','2022-11-23 10:22:03','faaf1988335cd35eb9e96ae9e662ed41'),(268,2,'20220927.233216.484-financas','2022-11-23 10:22:03','8d50274e6879250d3c212171b7cc4873'),(269,2,'20220927.233219.516-financas','2022-11-23 10:22:03','203f3833b4c336e9920142a91d8565cc'),(270,2,'20220927.233222.552-financas','2022-11-23 10:22:03','bd87e6c24a8ae0b6030bf82cab2f9d8e'),(271,2,'20220927.233225.592-financas','2022-11-23 10:22:03','9f26ddc9d45cc18321f111e38ead4af2'),(272,2,'20220927.233228.620-financas','2022-11-23 10:22:03','683975214fcad53e9e36f4393cdc8a19'),(273,2,'20220927.233231.649-financas','2022-11-23 10:22:03','80a00ef6fbd589ffc44057ee3eec0502'),(274,2,'20220927.233234.669-financas','2022-11-23 10:22:03','89671728741af156fd0ee2841dcfd5a2'),(275,2,'20220927.233237.700-financas','2022-11-23 10:22:03','50f076dae7d5b6949b3e175d3fa10672'),(276,2,'20220927.233240.741-financas','2022-11-23 10:22:03','ab726f07e04170315765ea8c2a6f2acc'),(277,2,'20220927.233243.772-financas','2022-11-23 10:22:03','c9d9fe35f4c41edd4bf35283042518a0'),(278,2,'20220927.233246.800-financas','2022-11-23 10:22:03','7f5981354d7362436028cba4b3d8d642'),(279,2,'20220927.233249.833-financas','2022-11-23 10:22:03','91dcf89df7a498cea125bd74a4e9b758'),(280,2,'20220927.233252.865-financas','2022-11-23 10:22:03','b90d7714dd0d1e59429e18a69309cbfd'),(281,2,'20220927.233255.902-financas','2022-11-23 10:22:03','c037980127ec35adf3e6de66ef9d0285'),(282,2,'20220927.233258.928-financas','2022-11-23 10:22:03','d19ae80011fa3ca92b74fdff94861218'),(283,2,'20220927.233301.965-financas','2022-11-23 10:22:03','79a8ab86a70d6803bdb729322da85b91'),(284,2,'20220927.233304.995-financas','2022-11-23 10:22:03','ba71b433b7aa798fee3c36e6f569136b'),(285,2,'20220927.233308.032-financas','2022-11-23 10:22:03','3d0cf0bb27b9a8990a4e3a209e4e06f5'),(286,2,'20220927.233311.065-financas','2022-11-23 10:22:03','689b8b8c7f747f0b42d3fce487dd1cb2'),(287,2,'20220927.233314.087-financas','2022-11-23 10:22:03','f1ccdd283dec0a50e3ea8a0ec39d7ec5'),(288,2,'20220927.233317.123-financas','2022-11-23 10:22:03','77923783793941ecd0811438fcf4c441'),(289,2,'20220927.233320.152-financas','2022-11-23 10:22:03','b84ada4928870d436509c56549fdd12f'),(290,2,'20220927.233323.176-financas','2022-11-23 10:22:03','9d229cc1ffab5d9a2cf1eae2b2466f8e'),(291,2,'20220927.233326.216-financas','2022-11-23 10:22:03','834c1753832e5bd841f55a06139f4d9d'),(292,2,'20220927.233329.250-financas','2022-11-23 10:22:03','a97500072a3d35ac1d147ad9194c57ab'),(293,2,'20220927.233332.286-financas','2022-11-23 10:22:03','19dbcab9d16c5a2a8c88577b7247e0cb'),(294,2,'20220927.233335.309-financas','2022-11-23 10:22:03','2ac4e9480b76b56f8a6224fab1c5134b'),(295,2,'20220927.233338.333-financas','2022-11-23 10:22:03','842ec436682ab9055c27218d8ff8fd52'),(296,2,'20220927.233341.370-financas','2022-11-23 10:22:03','ce94358d8c4128708e9dc482e4d7ff35'),(297,2,'20220927.233344.403-financas','2022-11-23 10:22:03','946fd84de6b0c7f76747574179a16038'),(298,2,'20220927.233347.437-financas','2022-11-23 10:22:03','26859cd43e40755fbae17c109e515bc0'),(299,2,'20220927.233350.473-financas','2022-11-23 10:22:03','5086bae00ddf70fb5364cb15094d3167'),(300,2,'20220927.233353.505-financas','2022-11-23 10:22:03','3e344e57fbfb9c112beedc041139d2b5'),(301,2,'20220927.233356.539-financas','2022-11-23 10:22:03','6dcfd35f190f13d8fe8874279b7bddba'),(302,2,'20220927.233359.570-financas','2022-11-23 10:22:03','68893800530e12b1eae2409b8ca2cc06'),(303,2,'20220927.233402.594-financas','2022-11-23 10:22:03','4f32d85e1dfbfc7b6e9011e7168379ba'),(304,2,'20220927.233405.621-financas','2022-11-23 10:22:03','e3894b31df106e7b1ce1eb5a5c818cc4'),(305,2,'20220927.233408.650-financas','2022-11-23 10:22:03','dd3560ae34d4ab034dfef3cbd7882232'),(306,2,'20220927.233411.675-financas','2022-11-23 10:22:03','187f27c710f877e99e48966785ef8604'),(307,2,'20220927.233414.710-financas','2022-11-23 10:22:03','f891c9f0a5165b1f93e5731bbf1bfdc8'),(308,2,'20220927.233417.737-financas','2022-11-23 10:22:03','e7ee0adcc193591618009face3c6d721'),(309,2,'20220927.233420.764-financas','2022-11-23 10:22:03','9114029836812667729b72ad323c5df2'),(310,2,'20220927.233423.788-financas','2022-11-23 10:22:03','8289db59febf142e069ce925c95da9a1'),(311,2,'20220927.233426.817-financas','2022-11-23 10:22:03','aae8b95499c8ea9e2562e08fec83a97b'),(312,2,'20220927.233429.843-financas','2022-11-23 10:22:03','5b8365d7c24481481b2991119cba6d26'),(313,2,'20220927.233432.871-financas','2022-11-23 10:22:03','929493b169999f12ebca71af9a276c11'),(314,2,'20220927.233435.901-financas','2022-11-23 10:22:03','16550f04b195f581f87b241d9b6e7116'),(315,2,'20220927.233438.928-financas','2022-11-23 10:22:03','65bcf63011a41fd67b5f302ff63bd057'),(316,2,'20220927.233441.956-financas','2022-11-23 10:22:03','50d144ef35661d6483d9f9ade3262c54'),(317,2,'20220927.233444.994-financas','2022-11-23 10:22:03','9d101fa54ef785a130bd70e8db3c058e'),(318,2,'20220927.233448.030-financas','2022-11-23 10:22:03','365f54169df881dd92f0a78182c4655f'),(319,2,'20220927.233451.058-financas','2022-11-23 10:22:03','1686e8acdbdf0858864a1bccb7fdeda6'),(320,2,'20220927.233454.093-financas','2022-11-23 10:22:03','9a100fe2ccf647872598d7d7486b7d8a'),(321,2,'20220927.233457.121-financas','2022-11-23 10:22:03','8ee7f1838022537eec2ca2a74612f05d'),(322,2,'20220927.233500.160-financas','2022-11-23 10:22:03','d6768b7276314587e8e080873932486d'),(323,2,'20220927.233503.188-financas','2022-11-23 10:22:03','ef1645e369af8557f09f5acd0a4b91a6'),(324,2,'20220927.233506.220-financas','2022-11-23 10:22:03','c3d3bf52596d9edfc5cacd36c17f745d'),(325,2,'20220927.233509.252-financas','2022-11-23 10:22:03','dc51e0f9be8ee17d49fb090b1621b450'),(326,2,'20220927.233512.279-financas','2022-11-23 10:22:03','3a6bcc68c5b17f93c18788d86914411c'),(327,2,'20220927.233515.317-financas','2022-11-23 10:22:03','24ac1a42f7111a18d36328ed2b50e4f9'),(328,2,'20220927.233518.346-financas','2022-11-23 10:22:03','39f9e1f3da54d58570932e85cafe8d11'),(329,2,'20220927.233521.383-financas','2022-11-23 10:22:03','19cf8a4c5dec03e7b56a4537f6d655d9'),(330,2,'20220927.233524.416-financas','2022-11-23 10:22:03','ac2d9192c0922fddca86d339dabf2816'),(331,2,'20220927.233527.451-financas','2022-11-23 10:22:03','8f28c74ad74db0d5703573e0f9dfdb3e'),(332,2,'20220927.233530.482-financas','2022-11-23 10:22:03','2b18d1e79443a18f5269c19452cc6cd0'),(333,2,'20220927.233533.508-financas','2022-11-23 10:22:03','306510e48e196f5394e8807c47a87a23'),(334,2,'20220927.233536.538-financas','2022-11-23 10:22:03','58ce23195593838fc88b466dc3e48f7f'),(335,2,'20220927.233539.570-financas','2022-11-23 10:22:03','754ed5f13b1bfdbc019ca07e4efde9c7'),(336,2,'20220927.233542.602-financas','2022-11-23 10:22:03','b1a0473ca5afbacf3585cd3688495a7b'),(337,2,'20220927.233545.635-financas','2022-11-23 10:22:03','42f123e79f21d0db638471f26790ccdb'),(338,2,'20220927.233548.663-financas','2022-11-23 10:22:03','d2c545200a19ff87f71611d6ca3aa230'),(339,2,'20220927.233551.702-financas','2022-11-23 10:22:03','03489bd10f48313cc4fc77ce29793297'),(340,2,'20220927.233554.731-financas','2022-11-23 10:22:03','a37341daeef49723f9d5a7656dd5669f'),(341,2,'20220927.233557.763-financas','2022-11-23 10:22:03','e0cfca547835e1ab5f24861e9fe5ee63'),(342,2,'20220927.233600.787-financas','2022-11-23 10:22:03','384bf29fbd7495b524a29e79c589337c'),(343,2,'20220927.233603.828-financas','2022-11-23 10:22:03','eb9c2b63fae8f643db6851fc812dd868'),(344,2,'20220927.233606.856-financas','2022-11-23 10:22:03','7d947d8e8c1c7afe1442966273c0c5d4'),(345,2,'20220927.233609.882-financas','2022-11-23 10:22:03','5c43f94ccb8e51efd161a322ffcf0535'),(346,2,'20220927.233612.916-financas','2022-11-23 10:22:03','bc42c0ea463457f790d9aaffc605e842'),(347,2,'20220927.233615.956-financas','2022-11-23 10:22:03','d07046ca82fe1c7acf1f5d6f750fd23a'),(348,2,'20220927.233618.986-financas','2022-11-23 10:22:03','be95f9fca1713cfb36e1475e69e915bc'),(349,2,'20220927.233622.014-financas','2022-11-23 10:22:03','4befab065b1e58c7ca90a4f3b0d381e0'),(350,2,'20220927.233625.042-financas','2022-11-23 10:22:03','71c6d12ea7d75602f78a1293d685fa1e'),(351,2,'20220927.233628.079-financas','2022-11-23 10:22:03','deb67b70d86ef8b25623fb6add90624a'),(352,2,'20220927.233631.113-financas','2022-11-23 10:22:03','86b15ea56bd18da95bbb851748bac461'),(353,2,'20220927.233634.148-financas','2022-11-23 10:22:03','ce2f91454c6bba0227dcd051e8a7fe43'),(354,2,'20220927.233637.174-financas','2022-11-23 10:22:03','dc5e3fc4b050e218cffcfe8242745f28'),(355,2,'20220927.233640.203-financas','2022-11-23 10:22:03','ed19d5798b5e80fb62847053cc1df76e'),(356,2,'20220927.233643.239-financas','2022-11-23 10:22:03','8e08add28346cc6dd5dc3792c677b382'),(357,2,'20220927.233646.274-financas','2022-11-23 10:22:03','f8b9715d4a84c5732c7e95c2fe77891e'),(358,2,'20220927.233649.314-financas','2022-11-23 10:22:03','bb1ab689eff40690a5150f6f2075aaf0'),(359,2,'20220927.233652.341-financas','2022-11-23 10:22:03','4bda74898eedf562a626710860dca90c'),(360,2,'20220927.233655.369-financas','2022-11-23 10:22:03','bd25d704304781249f63c261e2ddcc7f'),(361,2,'20220927.233658.406-financas','2022-11-23 10:22:03','c10a5d7642495d47b3a8dc23bb057dd9'),(362,2,'20220927.233701.434-financas','2022-11-23 10:22:03','c23b843c4b61fbd0a59a26fefce1a5f5'),(363,2,'20220927.233704.470-financas','2022-11-23 10:22:03','0606d0bbf516e32f5cd1d73354ed56e4'),(364,2,'20220927.233707.503-financas','2022-11-23 10:22:03','0b448d53398283fe0e86f1d4226518d2'),(365,2,'20220927.233710.545-financas','2022-11-23 10:22:03','a1fcb076cb05dadc214894e5faae3fa0'),(366,2,'20220927.233713.585-financas','2022-11-23 10:22:03','1ee6d7c25e76d102f58d304bf528e7a1'),(367,2,'20220927.233716.615-financas','2022-11-23 10:22:03','c80a7b93c8dea1430b770fb322618745'),(368,2,'20220927.233719.646-financas','2022-11-23 10:22:03','7f97009fdbd31dc096659ed956de063c'),(369,2,'20220927.233722.675-financas','2022-11-23 10:22:03','ea05eb3775bea2e61f6bea9e4eda097c'),(370,2,'20220927.233725.702-financas','2022-11-23 10:22:03','117e2ac523ebc5ddc5e540185dba515d'),(371,2,'20220927.233728.733-financas','2022-11-23 10:22:03','3f94f301588d508b83bb27b70b82b1dc'),(372,2,'20220927.233731.770-financas','2022-11-23 10:22:03','5e9cee91f6580026bd91ee7b3bcf5623'),(373,2,'20220927.233734.803-financas','2022-11-23 10:22:03','4ecda7261e2b44735e131f1f2684cd2c'),(374,2,'20220927.233737.839-financas','2022-11-23 10:22:03','4edd250f75e8328f8571d99491366ac5'),(375,2,'20220927.233740.871-financas','2022-11-23 10:22:03','aad37244458c1be6d81de2ad6128a17f'),(376,2,'20220927.233743.907-financas','2022-11-23 10:22:03','9d7eb41403023ee781b7dde7b8303cf2'),(377,2,'20220927.233746.934-financas','2022-11-23 10:22:03','d4393f027d3f02a9297e8fa7af60e117'),(378,2,'20220927.233749.963-financas','2022-11-23 10:22:03','af8a8474afafb570e2f2c9cf0012eee6'),(379,2,'20220927.233753.003-financas','2022-11-23 10:22:03','63acafd77051f51546a330529c3b510d'),(380,2,'20220927.233756.033-financas','2022-11-23 10:22:03','2a382b26968816dd4420054e8fb53ac4'),(381,2,'20220927.233759.067-financas','2022-11-23 10:22:03','011deb10929760444f2735061803e888'),(382,2,'20220927.233802.099-financas','2022-11-23 10:22:03','2b9982f34bef1688653557eb62422b19'),(383,2,'20220927.233805.139-financas','2022-11-23 10:22:03','961957bae933cc7a5a7fda49ace7e164'),(384,2,'20220927.233808.164-financas','2022-11-23 10:22:03','c12c0d6924331443b1d9e74795b4b59c'),(385,2,'20220927.233811.192-financas','2022-11-23 10:22:03','4298fc3ba9b37f189c51fe15cddbb001'),(386,2,'20220927.233814.222-financas','2022-11-23 10:22:03','d7eb9f4d3d02ae2768cdeab0296552a7'),(387,2,'20220927.233817.252-financas','2022-11-23 10:22:03','12f0a31ca72824fa71c8d10047fc6439'),(388,2,'20220927.233820.280-financas','2022-11-23 10:22:03','f595520032ff4b252c825a81244ffc4b'),(389,2,'20220927.233823.308-financas','2022-11-23 10:22:03','71e727285d371449c554e08712f5104d'),(390,2,'20220927.233826.348-financas','2022-11-23 10:22:03','63cee51d739399f1434e69dd0f1e6142'),(391,2,'20220927.233829.388-financas','2022-11-23 10:22:03','f52c3084848a3dff72698ecce8936c3f'),(392,2,'20220927.233832.426-financas','2022-11-23 10:22:03','17b85ff7b853182b38c909f86f81dc5d'),(393,2,'20220927.233835.452-financas','2022-11-23 10:22:03','1df359fea765c6fa83d10f37ea7c97b5'),(394,2,'20220927.233838.483-financas','2022-11-23 10:22:03','50e7476cc70a3160a48e7bfc1e63c993'),(395,2,'20220927.233841.510-financas','2022-11-23 10:22:03','1ba886382f033ab76d8df972f3e85378'),(396,2,'20220927.233844.540-financas','2022-11-23 10:22:03','32932b0976e916dff8214c1db1f85148'),(397,2,'20220927.233847.567-financas','2022-11-23 10:22:03','4429a826b02ef90842d42b9de20f2b53'),(398,2,'20220927.233850.604-financas','2022-11-23 10:22:03','3b8756c991e17f7fbf140d6986c982f6'),(399,2,'20220927.233853.626-financas','2022-11-23 10:22:03','7389d989534cff8cf33ce3228dace7b4'),(400,2,'20220927.233856.660-financas','2022-11-23 10:22:03','d795371439ef1d7e76a1ddf2043bed31'),(401,2,'20220927.233859.698-financas','2022-11-23 10:22:03','1052e2697880ed2c0157b18483f56440'),(402,2,'20220927.233902.727-financas','2022-11-23 10:22:03','f4e69e784dd9628b28cf4b7e424606e2'),(403,2,'20220927.233905.755-financas','2022-11-23 10:22:03','0fd231389d09430972f703d6d5d1b011'),(404,2,'20220927.233908.783-financas','2022-11-23 10:22:03','318aa21737fcab8372bd8c86d080ef48'),(405,2,'20220927.233911.822-financas','2022-11-23 10:22:03','b46ad9957cff3699d7ba06c802894284'),(406,2,'20220927.233914.848-financas','2022-11-23 10:22:03','f751b2694a4c93adc55f81bc5674254d'),(407,2,'20220927.233917.883-financas','2022-11-23 10:22:03','74b4032fa206868152aba45196eec247'),(408,2,'20220927.233920.911-financas','2022-11-23 10:22:03','474461b65e884e3e549ce4e73d2fab9f'),(409,2,'20220927.233923.943-financas','2022-11-23 10:22:03','118f3c4973d1582f4eb001f4e91bd08c'),(410,2,'20220927.233926.980-financas','2022-11-23 10:22:03','175e06afa45e8f977d13d834ff1966b2'),(411,2,'20220927.233930.002-financas','2022-11-23 10:22:03','50a316cc38c9fad145c69b8d33310085'),(412,2,'20220927.233933.033-financas','2022-11-23 10:22:03','7d874e9bac71abdfb28adc4753587602'),(413,2,'20220927.233936.059-financas','2022-11-23 10:22:03','2ab9aa3ce647dae7d296aa1a2cd03041'),(414,2,'20220927.233939.083-financas','2022-11-23 10:22:03','aa85ed16321002ef46216acbabcdf244'),(415,2,'20220927.233942.114-financas','2022-11-23 10:22:03','9a2ca8f1df870185e9f943a86331de6b'),(416,2,'20220927.233945.146-financas','2022-11-23 10:22:03','52b1316de293775550b82c9df4c432ec'),(417,2,'20220927.233948.182-financas','2022-11-23 10:22:03','eeb0eafc5078c320728e8887a083b4ae'),(418,2,'20220927.233951.214-financas','2022-11-23 10:22:03','12ae1bfc504cf9acd4ae343e9e726218'),(419,2,'20220927.233954.246-financas','2022-11-23 10:22:03','48547aaa9340a7c80e64d14430aaf7b7'),(420,2,'20220927.233957.277-financas','2022-11-23 10:22:03','f618ee34d8b27d6cd9e940b85d6b779b'),(421,2,'20220927.234000.314-financas','2022-11-23 10:22:03','45329fa1627b36281798cead58eebe42'),(422,2,'20220927.234003.355-financas','2022-11-23 10:22:03','2f066bdeea48d5b62183f6c803003187'),(423,2,'20220927.234006.387-financas','2022-11-23 10:22:03','c847767af4821cd3fd854dce6b0f7e59'),(424,2,'20220927.234009.422-financas','2022-11-23 10:22:03','34269b86f5689a05af9ab2a50cf2b4f4'),(425,2,'20220927.234012.459-financas','2022-11-23 10:22:03','e949aba28b0376043b9a475da210bc5e'),(426,2,'20220927.234015.492-financas','2022-11-23 10:22:03','18a2913784fbf6ec1c33e90543237c56'),(427,2,'20220927.234018.526-financas','2022-11-23 10:22:03','0ade624f75c20eea694dfde71e7849ff'),(428,2,'20220927.234021.564-financas','2022-11-23 10:22:03','edacd7e0411a22435d3d02aca9be9475'),(429,2,'20220927.234024.597-financas','2022-11-23 10:22:03','11aa67793feb7a00033d3f713fbad811'),(430,2,'20220927.234027.624-financas','2022-11-23 10:22:03','2f8c6f8615744720b47dd7265d0b6d44'),(431,2,'20220927.234030.652-financas','2022-11-23 10:22:03','0a5c0003983a0068d776ebb7b145266e'),(432,2,'20220927.234033.680-financas','2022-11-23 10:22:03','10f3f82df834d6c6f16c72853162710b'),(433,2,'20220927.234036.716-financas','2022-11-23 10:22:03','feeb4782fed12f27b13d03e699d379f5'),(434,2,'20220927.234039.750-financas','2022-11-23 10:22:03','3b5b0fd73265260bab2027158798c67f'),(435,2,'20220927.234042.783-financas','2022-11-23 10:22:03','93c4739867b6d106b1b7070700ed7f80'),(436,2,'20220927.234045.824-financas','2022-11-23 10:22:03','a12f9f93e2c6d64a0f177e63f97d8ae2'),(437,2,'20220927.234048.861-financas','2022-11-23 10:22:03','0727231f3318d17ee8b5975ad9f060d3'),(438,2,'20220927.234051.896-financas','2022-11-23 10:22:03','f2a2d71558ec89a746f43874a48de10a'),(439,2,'20220927.234054.919-financas','2022-11-23 10:22:03','61312c67e1b684ef16eaef0842720b88'),(440,2,'20220927.234057.948-financas','2022-11-23 10:22:03','2384ed22d58ff6397f6ccfd93e288249'),(441,2,'20220927.234100.982-financas','2022-11-23 10:22:03','89383f990a70f2f98bdca2621cf5b7db'),(442,2,'20220927.234104.009-financas','2022-11-23 10:22:03','4bc41f65e12e0b022011d5aae0b374fb'),(443,2,'20220927.234107.042-financas','2022-11-23 10:22:03','31433a274636bb46ebb5123149bdcdc9'),(444,2,'20220927.234110.074-financas','2022-11-23 10:22:03','c5d9213019ecce361e147ef672cecc61'),(445,2,'20220927.234113.111-financas','2022-11-23 10:22:03','aadab4c3a7a92c24ebceb5f37b17bce8'),(446,2,'20220927.234116.143-financas','2022-11-23 10:22:03','b4b238740c85731e24083eeb19aaae73'),(447,2,'20220927.234119.177-financas','2022-11-23 10:22:03','6040e5e8f85bf140d9a697b4052e4750'),(448,2,'20220927.234122.223-financas','2022-11-23 10:22:03','be7c5fe9e5a0a77a462d885c2f0c7115'),(449,2,'20220927.234125.250-financas','2022-11-23 10:22:03','86bf0a4f1afa28d1e86ba177eb0d7f6d'),(450,2,'20220927.234128.279-financas','2022-11-23 10:22:03','80107cb28f51f1749b77e5d683813692'),(451,2,'20220927.234131.309-financas','2022-11-23 10:22:03','330651700134142f7fbcca4ceadd1c4c'),(452,2,'20220927.234134.344-financas','2022-11-23 10:22:03','a99ab0b3b3ef3f9ddd330e9ad7b237f4'),(453,2,'20220927.234137.383-financas','2022-11-23 10:22:03','609a090c46a360911c9746d05c26ff84'),(454,2,'20220927.234140.415-financas','2022-11-23 10:22:03','5e591cafcc0275bc3a4cc231011017ed'),(455,2,'20220927.234143.438-financas','2022-11-23 10:22:03','6a87c7b7a01905ec3ecb7310adddc978'),(456,2,'20220927.234146.463-financas','2022-11-23 10:22:03','08a308a1f98d9119ae971374df072358'),(457,2,'20220927.234149.499-financas','2022-11-23 10:22:03','cce9d7d6f83c62cbf77b29a8332530f4'),(458,2,'20220927.234152.529-financas','2022-11-23 10:22:03','5b2f13ad51911173c7c2d8f06099244a'),(459,2,'20220927.234155.560-financas','2022-11-23 10:22:03','67eca1df396cab61db620e0b8e5aeef0'),(460,2,'20220927.234158.602-financas','2022-11-23 10:22:03','7a4ca2460de9a85ec9a4c940db4512ee'),(461,2,'20220927.234201.632-financas','2022-11-23 10:22:03','c88b2debf88abc683f72dec95e62f43c'),(462,2,'20220927.234204.659-financas','2022-11-23 10:22:03','c022504077a10602db848f2502072b82'),(463,2,'20220927.234207.685-financas','2022-11-23 10:22:03','f47bd1a026af390ff8e1abf54fda99c0'),(464,2,'20220927.234210.720-financas','2022-11-23 10:22:03','a282dd44fca4afbe1cc90b451a2ef908'),(465,2,'20220927.234213.750-financas','2022-11-23 10:22:03','90116ce06ebd8b35cd6c3f0b01bf8872'),(466,2,'20220927.234216.790-financas','2022-11-23 10:22:03','c53e3977b31d6053c32bb98edc27018e'),(467,2,'20220927.234219.817-financas','2022-11-23 10:22:03','8be3df12ff91209c7ff6d4c802da9920'),(468,2,'20220927.234222.846-financas','2022-11-23 10:22:03','7cc3eb516f60f642db242e18caaab589'),(469,2,'20220927.234225.877-financas','2022-11-23 10:22:03','9394d5868fda1e96b79d3155636d45fb'),(470,2,'20220927.234228.905-financas','2022-11-23 10:22:03','60145160feb003a5050d0ee571f4bcf0'),(471,2,'20220927.234231.935-financas','2022-11-23 10:22:03','05b626e5225658ee4398b78804a05aab'),(472,2,'20220927.234234.973-financas','2022-11-23 10:22:03','25edb0298a4aca8f21c679cf7fdf7744'),(473,2,'20220927.234237.995-financas','2022-11-23 10:22:03','7d5a0b0e41268cec097eb0de99f3523b'),(474,2,'20220927.234241.022-financas','2022-11-23 10:22:03','de1b70751216f1ca5ba82121af0c7a0f'),(475,2,'20220927.234244.049-financas','2022-11-23 10:22:03','75a34743da38315e6a9630cf531bec5a'),(476,2,'20220927.234247.072-financas','2022-11-23 10:22:03','444aeeec61f4fcbd1070412c6d40ce8e'),(477,2,'20220927.234250.102-financas','2022-11-23 10:22:03','f3af2ba68c961a8f4ce4dd2f0b46d837'),(478,2,'20220927.234253.132-financas','2022-11-23 10:22:03','0c766d9e83d18d5b979620930593d1ba'),(479,2,'20220927.234256.154-financas','2022-11-23 10:22:03','42ee3fde97b9f75ba5db815cf6142317'),(480,2,'20220927.234259.185-financas','2022-11-23 10:22:03','40d501d4536fdeb2e183d98f50762d6f'),(481,2,'20220927.234302.226-financas','2022-11-23 10:22:03','5bcc8bb987479170036ffd07aaa2ae61'),(482,2,'20220927.234305.266-financas','2022-11-23 10:22:03','5e14c9824a8034a988a2788781ab7b65'),(483,2,'20220927.234308.285-financas','2022-11-23 10:22:03','96fc7035fa64565d0f38557a2acbac20'),(484,2,'20220927.234311.309-financas','2022-11-23 10:22:03','a7fc4b4d69dc2794b2009d62934b4adc'),(485,2,'20220927.234314.346-financas','2022-11-23 10:22:03','88074c538124d2e4c60fcfcdcdc43857'),(486,2,'20220927.234317.371-financas','2022-11-23 10:22:03','86dd7b6c85ebe4de49a8d93bc9710bf3'),(487,2,'20220927.234320.407-financas','2022-11-23 10:22:03','f4f961d9e3966c9e25bbc3b50abeca99'),(488,2,'20220927.234323.442-financas','2022-11-23 10:22:03','b77019b4ddb20c4b18cc0f72c6b9e065'),(489,2,'20220927.234326.470-financas','2022-11-23 10:22:03','58d53ddc8a5bea5d804a2b73f0b08e65'),(490,2,'20220927.234329.500-financas','2022-11-23 10:22:03','cff8d01cb665404752d2eb42d025ff4c'),(491,2,'20220927.234332.536-financas','2022-11-23 10:22:03','62367499bff3c8b806cec3e5682e7513'),(492,2,'20220927.234335.565-financas','2022-11-23 10:22:03','9fd2343fc15486934089b0db59f50f28'),(493,2,'20220927.234338.589-financas','2022-11-23 10:22:03','3fbcf114a6f6eb799e7ba43da8dcaeda'),(494,2,'20220927.234341.613-financas','2022-11-23 10:22:03','13f86cce8d4deeaf2e2767e7995ad4a5'),(495,2,'20220927.234344.648-financas','2022-11-23 10:22:03','c0c8e6fa9b62e77d0a42c813ff02cf22'),(496,2,'20220927.234347.686-financas','2022-11-23 10:22:03','72ed4671d1f7ba63c2a031cb69931b64'),(497,2,'20220927.234350.718-financas','2022-11-23 10:22:03','465d5c0f80d89d65318210bc334775c4'),(498,2,'20220927.234353.754-financas','2022-11-23 10:22:03','95f8a53ffeafb8dd8c47a40c38bab1f1'),(499,2,'20220927.234356.786-financas','2022-11-23 10:22:03','3c88867ebbbae584d2e812e50d720a7d'),(500,2,'20220927.234359.815-financas','2022-11-23 10:22:03','483fb49dc2327f604274b93e1cc751b0'),(501,2,'20220927.234402.850-financas','2022-11-23 10:22:03','cd98600e69fe59edfe2d7bd514ffa878'),(502,2,'20220927.234405.879-financas','2022-11-23 10:22:03','78ec708a8b523dfe6cff0a2ddacbc723'),(503,2,'20220927.234408.909-financas','2022-11-23 10:22:03','423c8b143df2dc356458cc031ef5ea95'),(504,2,'20220927.234411.945-financas','2022-11-23 10:22:03','f28b946a723d2c2a791d8fb389c04c03'),(505,2,'20220927.234414.973-financas','2022-11-23 10:22:03','83a93832a14d452d48af29ea9f24862e'),(506,2,'20220927.234418.005-financas','2022-11-23 10:22:03','ba03de8fabd0262eeb78ddd4eab5d811'),(507,2,'20220927.234421.033-financas','2022-11-23 10:22:03','737b08a5d7b7de9abe96ffd350e8af84'),(508,2,'20220927.234424.053-financas','2022-11-23 10:22:03','59d3c7a516da3109e63d1541ec882b51'),(509,2,'20220927.234427.086-financas','2022-11-23 10:22:03','1e1416dc2542b8f30d394fd7192eacb2'),(510,2,'20220927.234430.124-financas','2022-11-23 10:22:03','3a8b060a09677508339b41c69c06a612'),(511,2,'20220927.234433.150-financas','2022-11-23 10:22:03','32fbeb1b3c3dc2cb56432e6b3cf54085'),(512,2,'20220927.234436.187-financas','2022-11-23 10:22:03','4296852f54a11fd50a3784038e4f1986'),(513,2,'20220927.234439.218-financas','2022-11-23 10:22:03','2b860b3cc53aeef6c4a07d8455679f04'),(514,2,'20220927.234442.242-financas','2022-11-23 10:22:03','5aa771efd15aef238fc00a863a428943'),(515,2,'20220927.234445.280-financas','2022-11-23 10:22:03','9b544a44961b25ac8913976f553629c0'),(516,2,'20220927.234448.302-financas','2022-11-23 10:22:03','66f6ef2e14b257f340ae778c1af9ea44'),(517,2,'20220927.234451.337-financas','2022-11-23 10:22:03','921f58a8c5226ee81e4c06b386a1f07a'),(518,2,'20220927.234454.363-financas','2022-11-23 10:22:03','e255d1c8c617db6927cbd33e6c353a3d'),(519,2,'20220927.234457.399-financas','2022-11-23 10:22:03','4283ebd30c85ddf3387e1d5fb69c18a5'),(520,2,'20220927.234500.428-financas','2022-11-23 10:22:03','7d87c6386462c201b39d879630f78e6e'),(521,2,'20220927.234503.466-financas','2022-11-23 10:22:03','41e2319628f36be93cd235f8e81d3e47'),(522,2,'20220927.234506.492-financas','2022-11-23 10:22:03','8f052def5c5a2cad029a82330e4ed305'),(523,2,'20220927.234509.515-financas','2022-11-23 10:22:03','2bb0002d0ca3e087703990969c32ab95'),(524,2,'20220927.234512.544-financas','2022-11-23 10:22:03','f9a29a30680d6adddf1855252befedd2'),(525,2,'20220927.234515.573-financas','2022-11-23 10:22:03','eee7fa5078439bf11c3ca95f427611eb'),(526,2,'20220927.234518.607-financas','2022-11-23 10:22:03','64b553fb2d51ae4a67fd10b405970898'),(527,2,'20220927.234521.650-financas','2022-11-23 10:22:03','eeda3dc54e752142757f6d3071b23190'),(528,2,'20220927.234524.691-financas','2022-11-23 10:22:03','48215dadb11afd9574ce23f9059a8c6c'),(529,2,'20220927.234527.727-financas','2022-11-23 10:22:03','778b8b0a877d8065f554496f665f71e5'),(530,2,'20220927.234530.755-financas','2022-11-23 10:22:03','a2ab0de09cafa60a7e883b9ee671cb56'),(531,2,'20220927.234533.783-financas','2022-11-23 10:22:03','bea994b66a25f06f7d5eb3eb6c2e31df'),(532,2,'20220927.234536.811-financas','2022-11-23 10:22:03','3560eb9dbbbca786230e2baf6e7c346e'),(533,2,'20220927.234539.840-financas','2022-11-23 10:22:03','18ef9ae051228df9b8d44d3c78556179'),(534,2,'20220927.234542.875-financas','2022-11-23 10:22:03','886d5f301119a84afee93b6b41f264d4'),(535,2,'20220927.234545.915-financas','2022-11-23 10:22:03','d4fdc004dff8691a51b5aeafe342b780'),(536,2,'20220927.234548.943-financas','2022-11-23 10:22:03','c09473fbb5e35b664158dabeb8004b70'),(537,2,'20220927.234551.965-financas','2022-11-23 10:22:03','903ef6ac856939d69071be1e83b36b4d'),(538,2,'20220927.234554.999-financas','2022-11-23 10:22:03','68d81c45a0f0a742b4e42301e8a41239'),(539,2,'20220927.234558.033-financas','2022-11-23 10:22:03','d93487d5045fe1da7984e0a57e2c0279'),(540,2,'20220927.234601.061-financas','2022-11-23 10:22:03','3d3505bc236ff10a8f532c650a35dcde'),(541,2,'20220927.234604.087-financas','2022-11-23 10:22:03','610d592a5201d14e8d0448c45aade331'),(542,2,'20220927.234607.113-financas','2022-11-23 10:22:03','e2f6e72f0228fcbc881bf4a3fd0d0e55'),(543,2,'20220927.234610.142-financas','2022-11-23 10:22:03','99093c823ccbd85ae38ee79200477969'),(544,2,'20220927.234613.167-financas','2022-11-23 10:22:03','824a786d00c6f4ae888448d554b2571d'),(545,2,'20220927.234616.199-financas','2022-11-23 10:22:03','939e3f048c184d25e2cc61658f3d0ac6'),(546,2,'20220927.234619.225-financas','2022-11-23 10:22:03','199c060caa012058c5bfae90ee6ed6de'),(547,2,'20220927.234622.260-financas','2022-11-23 10:22:03','291301713158ddf4845c7f7fa2af56c6'),(548,2,'20220927.234625.281-financas','2022-11-23 10:22:03','1f976ecbe401a1ea1713c94da4963444'),(549,2,'20220927.234628.310-financas','2022-11-23 10:22:03','5fcd7963a280f155ead206c48ae30879'),(550,2,'20220927.234631.345-financas','2022-11-23 10:22:03','a1c648d9a0bdeb5db97e6e8c6cf97bca'),(551,2,'20220927.234634.367-financas','2022-11-23 10:22:03','03c24a4d1862a1db9b6976fd77f1727c'),(552,2,'20220927.234637.395-financas','2022-11-23 10:22:03','4cd891cd2ebd66c40eee6c1063bab710'),(553,2,'20220927.234640.433-financas','2022-11-23 10:22:03','6243c0a692ba7fe2ed7de7880d76a793'),(554,2,'20220927.234643.466-financas','2022-11-23 10:22:03','773b2954230cd08aea9460bc88c788fe'),(555,2,'20220927.234646.499-financas','2022-11-23 10:22:03','305897b09fb76d5e14c8b20377243a3d'),(556,2,'20220927.234649.531-financas','2022-11-23 10:22:03','5ddf7fb3e8fc0b62530beef23da70146'),(557,2,'20220927.234652.558-financas','2022-11-23 10:22:03','d246fea9a659b84a1f270313ceea58a9'),(558,2,'20220927.234655.593-financas','2022-11-23 10:22:03','689bb18290760b8d5bed2575d6641be2'),(559,2,'20220927.234658.628-financas','2022-11-23 10:22:03','f59a47cade346a630e4db4772b6d8eea'),(560,2,'20220927.234701.655-financas','2022-11-23 10:22:03','b864a14a6abb31b64faa567c2c81c582'),(561,2,'20220927.234704.694-financas','2022-11-23 10:22:03','44968c70cb9ddd182a2873db71db75bb'),(562,2,'20220927.234707.731-financas','2022-11-23 10:22:03','613a121ffb71b216c46b6a4b8e68db80'),(563,2,'20220927.234710.762-financas','2022-11-23 10:22:03','24051535c0cf22ee112d50aba55c281d'),(564,2,'20220927.234713.798-financas','2022-11-23 10:22:03','7fe27ff392eda9e60e7c21192692000e'),(565,2,'20220927.234716.828-financas','2022-11-23 10:22:03','542f3658aa827876fea709f447857362'),(566,2,'20220927.234719.859-financas','2022-11-23 10:22:03','d6a36a7378b6e13ce0a613a576a49b24'),(567,2,'20220927.234722.892-financas','2022-11-23 10:22:03','7051707c7eadd89f8e96ccc9642d91a4'),(568,2,'20220927.234725.924-financas','2022-11-23 10:22:03','a3b9f9513096fbf45949c16caea11904'),(569,2,'20220927.234728.952-financas','2022-11-23 10:22:03','1b6a6ebc18c51ea392111fe123c42cfb'),(570,2,'20220927.234731.973-financas','2022-11-23 10:22:03','9631613331d4f2c640272b1788596e83'),(571,2,'20220927.234735.011-financas','2022-11-23 10:22:03','9bfce3e7b8bcdbbcd9e3b0d301459b83'),(572,2,'20220927.234738.038-financas','2022-11-23 10:22:03','775de7032c68016c0613513e34c01b12'),(573,2,'20220927.234741.072-financas','2022-11-23 10:22:03','c2aae37e47aa2c9397a6da41ebf58582'),(574,2,'20220927.234744.110-financas','2022-11-23 10:22:03','2c7cafd5cd2a038142165fcbf3e4cc9e'),(575,2,'20220927.234747.131-financas','2022-11-23 10:22:03','b554af147e7727126c5b27b7f0fad0a6'),(576,2,'20220927.234750.167-financas','2022-11-23 10:22:03','d47999659ebbc1b99543b14e71a9873e'),(577,2,'20220927.234753.206-financas','2022-11-23 10:22:03','a364a30e65b56615f95ecf12ac895f74'),(578,2,'20220927.234756.227-financas','2022-11-23 10:22:03','ec73fc5fb26cbeb9e75234ca5d40e43d'),(579,2,'20220927.234759.250-financas','2022-11-23 10:22:03','a07aa0c056de49fd03f2fe98ca018c2d'),(580,2,'20220927.234802.280-financas','2022-11-23 10:22:03','eea6121ca5c9c100c08c3b8270576406'),(581,2,'20220927.234805.310-financas','2022-11-23 10:22:03','8d9dac6880afc51b051203b665abf02b'),(582,2,'20220927.234808.348-financas','2022-11-23 10:22:03','b0923c5c09b8fa64eda3231ae4aa33c8'),(583,2,'20220927.234811.383-financas','2022-11-23 10:22:03','b6f402e1275ca06eb0fbd778cc9afa4f'),(584,2,'20220927.234814.409-financas','2022-11-23 10:22:03','151c2e6220b7286d97ba6dd68f84a6e6'),(585,2,'20220927.234817.434-financas','2022-11-23 10:22:03','375bd934e79e6accceed11cd01018231'),(586,2,'20220927.234820.463-financas','2022-11-23 10:22:03','5d962ce0837d5cc7ab0de5356a3148d6'),(587,2,'20220927.234823.502-financas','2022-11-23 10:22:03','e2d9022d59ed235daadcd062798eefa6'),(588,2,'20220927.234826.538-financas','2022-11-23 10:22:03','5e4522616279c9b2b03957c6033a0b98'),(589,2,'20220927.234829.575-financas','2022-11-23 10:22:04','254c5111d13f7007a4aa226047f10754'),(590,2,'20220927.234832.602-financas','2022-11-23 10:22:04','535efc4d605a05be5665b5c1e11ea93b'),(591,2,'20220927.234835.630-financas','2022-11-23 10:22:04','632bcf368cada78c4db561e18efa15aa'),(592,2,'20220927.234838.660-financas','2022-11-23 10:22:04','f3ffae22f0c508079797049dca6ec2e2'),(593,2,'20220927.234841.690-financas','2022-11-23 10:22:04','7effcfb133abccf1ecb180b274d0ccbc'),(594,2,'20220927.234844.722-financas','2022-11-23 10:22:04','59e62f33374a8d0654128bdbd85dc682'),(595,2,'20220927.234847.754-financas','2022-11-23 10:22:04','b20e5ce232b5a11dc9862ed01d1f42bb'),(596,2,'20220927.234850.785-financas','2022-11-23 10:22:04','003657cb90786faaee8e51ded41ff323'),(597,2,'20220927.234853.816-financas','2022-11-23 10:22:04','33b3f8b822c3472534c522ef95229ae8'),(598,2,'20220927.234856.851-financas','2022-11-23 10:22:04','afe347d1f4ba8a814a3b0f31756e034e'),(599,2,'20220927.234859.884-financas','2022-11-23 10:22:04','298d15726d716b4054de389d97fb54fa'),(600,2,'20220927.234902.915-financas','2022-11-23 10:22:04','6746861f323dc91e1cc8100027b5f569'),(601,2,'20220927.234905.942-financas','2022-11-23 10:22:04','18b297ab2e1ba7ad848f3e887b88757d'),(602,2,'20220927.234908.972-financas','2022-11-23 10:22:04','ec06ca314b80cd576b67a68f7c44e3aa'),(603,2,'20220927.234912.012-financas','2022-11-23 10:22:04','0b85bd51e09b2c307e7bbeeec8370156'),(604,2,'20220927.234915.041-financas','2022-11-23 10:22:04','7631d2c2c7c72c45b9a6a82134fccb6c'),(605,2,'20220927.234918.072-financas','2022-11-23 10:22:04','62b4066db17593c51bd41ee63a5c7761'),(606,2,'20220927.234921.102-financas','2022-11-23 10:22:04','9ce82ef854eca2f725db7151ded20dbd'),(607,2,'20220927.234924.137-financas','2022-11-23 10:22:04','4c182cb166ed172a521119392f239a18'),(608,2,'20220927.234927.161-financas','2022-11-23 10:22:04','fef6bffc0a2eea528ae03e6dfc0fb1cf'),(609,2,'20220927.234930.194-financas','2022-11-23 10:22:04','eee0aa0b96f969ada09941648091763a'),(610,2,'20220927.234933.230-financas','2022-11-23 10:22:04','bc318343bac32b94e15d6ebb813b680a'),(611,2,'20220927.234936.271-financas','2022-11-23 10:22:04','8c229361063d4425b7a90affa028c76f'),(612,2,'20220927.234939.304-financas','2022-11-23 10:22:04','4df25df6d88d4feadf84e03e97a30ace'),(613,2,'20220927.234942.345-financas','2022-11-23 10:22:04','d8a5a3a194c1460e270013c4a725a1b8'),(614,2,'20220927.234945.373-financas','2022-11-23 10:22:04','576c3188ca12c681594e60f0cab76d51'),(615,2,'20220927.234948.402-financas','2022-11-23 10:22:04','f50804e79d3a273f9eddf07b59b68257'),(616,2,'20220927.234951.434-financas','2022-11-23 10:22:04','7c4dfb4de675f621267767f20b6b43c4'),(617,2,'20220927.234954.459-financas','2022-11-23 10:22:04','b9223e50ae4672f1802dc4f9ee170c46'),(618,2,'20220927.234957.495-financas','2022-11-23 10:22:04','417a8e9b5e917ea27613d540c24df8d5'),(619,2,'20220927.235000.524-financas','2022-11-23 10:22:04','1a03d5f78822e77cb0b40ed0bd531cf6'),(620,2,'20220927.235003.563-financas','2022-11-23 10:22:04','709dd8ef05baac994c8a092702825c2f'),(621,2,'20220927.235006.601-financas','2022-11-23 10:22:04','a133757c308ca8c37f625cf44ad81ef9'),(622,2,'20220927.235009.641-financas','2022-11-23 10:22:04','534524bfb3c6fffdd505c58e92fcfda3'),(623,2,'20220927.235012.672-financas','2022-11-23 10:22:04','ec49837340b1a357735a7839613dac5b'),(624,2,'20220927.235015.708-financas','2022-11-23 10:22:04','72106bfbe9d14cb530912b31a4750278'),(625,2,'20220927.235018.735-financas','2022-11-23 10:22:04','1df0d323799b409c0cba10aed0e19bb2'),(626,2,'20220927.235021.757-financas','2022-11-23 10:22:04','958c2103358dcd2c4ec60b13925f3757'),(627,2,'20220927.235024.793-financas','2022-11-23 10:22:04','ff07afe2d360d53de82a24625752631b'),(628,2,'20220927.235027.823-financas','2022-11-23 10:22:04','9529af98b80022d6f900d4fc0c50789d'),(629,2,'20220927.235030.846-financas','2022-11-23 10:22:04','ac67fa63b0c2d5ecd489b77fbafa5903'),(630,2,'20220927.235033.878-financas','2022-11-23 10:22:04','f4ba56c92e0e2b0f084acb6d42ff5d2c'),(631,2,'20220927.235036.915-financas','2022-11-23 10:22:04','3fa59acaad6cd7d9b36da2e14770dacc'),(632,2,'20220927.235039.947-financas','2022-11-23 10:22:04','5d54047794e9e3f4b4a566253bec2493'),(633,2,'20220927.235042.973-financas','2022-11-23 10:22:04','e728c60331e42bd2c454c105d0211857'),(634,2,'20220927.235046.013-financas','2022-11-23 10:22:04','1e915c8ec6c43608c88169184f5145cc'),(635,2,'20220927.235049.050-financas','2022-11-23 10:22:04','0dac2eb31dd984e22e6bc7584e3f3142'),(636,2,'20220927.235052.078-financas','2022-11-23 10:22:04','923899180084fa5275708e130249101c'),(637,2,'20220927.235055.115-financas','2022-11-23 10:22:04','ad76f58850e360450de31459eccf3614'),(638,2,'20220927.235058.144-financas','2022-11-23 10:22:04','b1282cc14201b9ac085e70eb54103ea3'),(639,2,'20220927.235101.172-financas','2022-11-23 10:22:04','1e6f52bd17e4cb7ae98ac583dd63a9c8'),(640,2,'20220927.235104.194-financas','2022-11-23 10:22:04','1f6217a1450c4c0804982df500d37926'),(641,2,'20220927.235107.216-financas','2022-11-23 10:22:04','d7959e4fe55f9f5870c55b14f9a76b7b'),(642,2,'20220927.235110.249-financas','2022-11-23 10:22:04','ab853acf0509fd780b151a6f51615076'),(643,2,'20220927.235113.276-financas','2022-11-23 10:22:04','f332e41efc7be588cc8667b2ed5f95aa'),(644,2,'20220927.235116.302-financas','2022-11-23 10:22:04','57ba595efc8d0cc1e7e71232a2ef24e4'),(645,2,'20220927.235119.328-financas','2022-11-23 10:22:04','e582256317c8920815dd6175d745950f'),(646,2,'20220927.235122.351-financas','2022-11-23 10:22:04','7cd9c563ccbb5a85fac47b145998b395'),(647,2,'20220927.235125.386-financas','2022-11-23 10:22:04','ffc08cecb1e3dd9d702be4247b33e853'),(648,2,'20220927.235128.420-financas','2022-11-23 10:22:04','6888d860ac8c015f2f465915587f5a30'),(649,2,'20220927.235131.460-financas','2022-11-23 10:22:04','7b04bb6dddc18375e361086ea5f0dc6b'),(650,2,'20220927.235134.496-financas','2022-11-23 10:22:04','87f49ee3bb6e3933e524941fe51069e0'),(651,2,'20220927.235137.532-financas','2022-11-23 10:22:04','9b87f1fe04704d49926794b20db77655'),(652,2,'20220927.235140.567-financas','2022-11-23 10:22:04','046c76fce22ba45e925fd122d8d2bc88'),(653,2,'20220927.235143.592-financas','2022-11-23 10:22:04','5ef5e6970f387e25e14185ce65ea8538'),(654,2,'20220927.235146.623-financas','2022-11-23 10:22:04','fc7912adf5491d2b35aed309a5cbbc4c'),(655,2,'20220927.235149.654-financas','2022-11-23 10:22:04','9eccb004d8031f634b872f991de8e643'),(656,2,'20220927.235152.687-financas','2022-11-23 10:22:04','be2bf5fce1c156eb6fc45d1cbced2778'),(657,2,'20220927.235155.719-financas','2022-11-23 10:22:04','08a6c6ccf77c640f860ec84ae84b0205'),(658,2,'20220927.235158.761-financas','2022-11-23 10:22:04','7600828a958f422a04dcb7144a89a2f2'),(659,2,'20220927.235201.793-financas','2022-11-23 10:22:04','04c26890b374225718799ecb8ad045b7'),(660,2,'20220927.235204.821-financas','2022-11-23 10:22:04','ef20adeabe330ceb86780a795eb1d584'),(661,2,'20220927.235207.849-financas','2022-11-23 10:22:04','18ce4859da05ced6228a784d6e508d8b'),(662,2,'20220927.235210.873-financas','2022-11-23 10:22:04','6c0fe0254bcf0116c65175c99d03cd9e'),(663,2,'20220927.235213.904-financas','2022-11-23 10:22:04','07d91028b795e576af418f02be27488c'),(664,2,'20220927.235216.930-financas','2022-11-23 10:22:04','6aff90704a61318f3685630e5db2177a'),(665,2,'20220927.235219.962-financas','2022-11-23 10:22:04','26edda0750b57a86772c7933c5a02dfd'),(666,2,'20220927.235223.000-financas','2022-11-23 10:22:04','e9875bc6cd37e2a15bef8bf6a92ad940'),(667,2,'20220927.235226.039-financas','2022-11-23 10:22:04','8c96f412f2b315a59f7ef3c0e076c96a'),(668,2,'20220927.235229.077-financas','2022-11-23 10:22:04','89c486f298477c7f9615e5b8d5fee00c'),(669,2,'20220927.235232.112-financas','2022-11-23 10:22:04','e4a5a28ab2acb6d6f363981bef9edea9'),(670,2,'20220927.235235.148-financas','2022-11-23 10:22:04','e885f6b2369b8a76d7db998d9b78a404'),(671,2,'20220927.235238.169-financas','2022-11-23 10:22:04','b7414994df014a7cc1d4008b99fc3fe5'),(672,2,'20220927.235241.201-financas','2022-11-23 10:22:04','8c7cefa032c4b740d3bab0246be95323'),(673,2,'20220927.235244.238-financas','2022-11-23 10:22:04','4d5696bf2a963d5aa85bbf19fe89c01e'),(674,2,'20220927.235247.273-financas','2022-11-23 10:22:04','02b96a02aca4f1f8723dfc1fea615a5e'),(675,2,'20220927.235250.314-financas','2022-11-23 10:22:04','c664fecbae17423fcbd892bba16157cc'),(676,2,'20220927.235253.354-financas','2022-11-23 10:22:04','c0ae1205eeb8a0fed00d43cd7a335731'),(677,2,'20220927.235256.392-financas','2022-11-23 10:22:04','bb8580eea09c83eceab2d5373abaffc4'),(678,2,'20220927.235259.428-financas','2022-11-23 10:22:04','2c67292138de6c85cf816bcc40222f1f'),(679,2,'20220927.235302.466-financas','2022-11-23 10:22:04','1966e0a1b29e8788357734fdc899cc6f'),(680,2,'20220927.235305.497-financas','2022-11-23 10:22:04','1aa07b0abf9ef603eb4f2ad4745c3714'),(681,2,'20220927.235308.533-financas','2022-11-23 10:22:04','aa37ad5922a5f7c177de4f4e708f188b'),(682,2,'20220927.235311.562-financas','2022-11-23 10:22:04','bc578e3c8144febfcf92cc4d4d75261b'),(683,2,'20220927.235314.587-financas','2022-11-23 10:22:04','c9b298d4313eb81c71ad8947d1f09fe7'),(684,2,'20220927.235317.617-financas','2022-11-23 10:22:04','4998a96945b07e6d8d0730cc609ab9b2'),(685,2,'20220927.235320.649-financas','2022-11-23 10:22:04','e0c441b4e2b7cb9e42a6172fd87b4b4f'),(686,2,'20220927.235323.682-financas','2022-11-23 10:22:04','55cb76bbe3748e3eb47e2a9d4795c577'),(687,2,'20220927.235326.705-financas','2022-11-23 10:22:04','8aa75fcc530a34d885d2978cfdc38099'),(688,2,'20220927.235329.737-financas','2022-11-23 10:22:04','d1f74981631ed63236756157f27b8052'),(689,2,'20220927.235332.770-financas','2022-11-23 10:22:04','89f62c3fe9977aa52b02236b38321116'),(690,2,'20220927.235335.808-financas','2022-11-23 10:22:04','64afa4fa15d8684df153d006a8c7d0c3'),(691,2,'20220927.235338.835-financas','2022-11-23 10:22:04','72f51cb2512fce623d761d2b68412982'),(692,2,'20220927.235341.861-financas','2022-11-23 10:22:04','e29a632aed0a20aa67b6907b97fe9d69'),(693,2,'20220927.235344.896-financas','2022-11-23 10:22:04','b79a9e010f30ab61db43202b29c28444'),(694,2,'20220927.235347.928-financas','2022-11-23 10:22:04','c5aa4027db545c2472532efa9e290b41'),(695,2,'20220927.235350.958-financas','2022-11-23 10:22:04','accfc7f14da13b85af389b1d57df61ca'),(696,2,'20220927.235353.995-financas','2022-11-23 10:22:04','a7051d3db923de0a3cb67d62ede48c07'),(697,2,'20220927.235357.023-financas','2022-11-23 10:22:04','44444bb0383cddf67e58e610956ee144'),(698,2,'20220927.235400.059-financas','2022-11-23 10:22:04','421488364b9f29c317f7c102d6616bd6'),(699,2,'20220927.235403.084-financas','2022-11-23 10:22:04','1622f231a9d30a7e3b6f17b27859b56f'),(700,2,'20220927.235406.119-financas','2022-11-23 10:22:04','a4eb0cc21d1d91ef04fa370e89bfaa0e'),(701,2,'20220927.235409.151-financas','2022-11-23 10:22:04','c5c6cbcabcad2098d30b534632c34c39'),(702,2,'20220927.235412.174-financas','2022-11-23 10:22:04','2fcd2e8084656d362bd8ed79960531d3'),(703,2,'20220927.235415.207-financas','2022-11-23 10:22:04','2b17ecce8e9c91903ce693f70f629abb'),(704,2,'20220927.235418.237-financas','2022-11-23 10:22:04','1abcb62751c9694b185dde9baa7e8957'),(705,2,'20220927.235421.275-financas','2022-11-23 10:22:04','50b2bf3c2706a2789348fbe88418b2da'),(706,2,'20220927.235424.300-financas','2022-11-23 10:22:04','31b34a7c356a34662dcece296db1f4bf'),(707,2,'20220927.235427.335-financas','2022-11-23 10:22:04','a14bce06a81f0df150f45bbf8b9b898b'),(708,2,'20220927.235430.368-financas','2022-11-23 10:22:04','281bcaae5443585b1dc2f201b253d3a7'),(709,2,'20220927.235433.407-financas','2022-11-23 10:22:04','3eedee67300170f00354588272f1b029'),(710,2,'20220927.235436.447-financas','2022-11-23 10:22:04','4b33bef357d6e3da20ad36c16ceea448'),(711,2,'20220927.235439.474-financas','2022-11-23 10:22:04','d62fe3dcf33cbd58a336b89b4629cb38'),(712,2,'20220927.235442.510-financas','2022-11-23 10:22:04','9da473a46680c827fa2b987abe0d9f0a'),(713,2,'20220927.235445.534-financas','2022-11-23 10:22:04','acee91ee1d74edef1d6218e4d01e68ce'),(714,2,'20220927.235448.567-financas','2022-11-23 10:22:04','d967b93daffd0af762dfd8578be7fe85'),(715,2,'20220927.235451.600-financas','2022-11-23 10:22:04','37971eb2dd208dcdf1a802b43a66a882'),(716,2,'20220927.235454.638-financas','2022-11-23 10:22:04','5ef2ac0aa3dc510a1f7182452b7e162a'),(717,2,'20220927.235457.667-financas','2022-11-23 10:22:04','580741187e0f35ec1dbe71cc9951f818'),(718,2,'20220927.235500.697-financas','2022-11-23 10:22:04','0457f76367589b4e734986d7f177ad72'),(719,2,'20220927.235503.731-financas','2022-11-23 10:22:04','068f5d34609b5958bf87dedd47e2f816'),(720,2,'20220927.235506.752-financas','2022-11-23 10:22:04','64a7b43809754f0784ea5249ee7fc1ec'),(721,2,'20220927.235509.782-financas','2022-11-23 10:22:04','6916b63858b732169f05cac2ad5d9b30'),(722,2,'20220927.235512.810-financas','2022-11-23 10:22:04','49c9e84e0bc8116207f4ea3d7288fe06'),(723,2,'20220927.235515.845-financas','2022-11-23 10:22:04','9533435db8365c40fddf32ef6346df2b'),(724,2,'20220927.235518.879-financas','2022-11-23 10:22:04','f72839c3a1c9287ca40da73ad472b0c4'),(725,2,'20220927.235521.906-financas','2022-11-23 10:22:04','9f085a4667780082f1d324161c741692'),(726,2,'20220927.235524.939-financas','2022-11-23 10:22:04','304a4caa665afa2986140470383174ed'),(727,2,'20220927.235527.970-financas','2022-11-23 10:22:04','9b592840caa72effcc832fbcb58fdbae'),(728,2,'20220927.235531.000-financas','2022-11-23 10:22:04','813652cf500cb110a02b097ba284398f'),(729,2,'20220927.235534.023-financas','2022-11-23 10:22:04','c49fc98e331a6abde5ece461d2a6e96b'),(730,2,'20220927.235537.052-financas','2022-11-23 10:22:04','622f36699f48b60cc5d33eacfc38e6ce'),(731,2,'20220927.235540.086-financas','2022-11-23 10:22:04','16f79ad241a03a6a31432620d67248ad'),(732,2,'20220927.235543.124-financas','2022-11-23 10:22:04','04e3624e78b37e6d02a5ec533c40b9f5'),(733,2,'20220927.235546.152-financas','2022-11-23 10:22:04','4323dae9f2a2e8f99057f25e105330d1'),(734,2,'20220927.235549.180-financas','2022-11-23 10:22:04','e04ed56cc3558506a00672f4c6820787'),(735,2,'20220927.235552.219-financas','2022-11-23 10:22:04','8be4afd35eefca977f98f95465f28c7d'),(736,2,'20220927.235555.246-financas','2022-11-23 10:22:04','bb755fdbfb2ba5aba9d0bb63b25e113e'),(737,2,'20220927.235558.272-financas','2022-11-23 10:22:04','751f641248e6fe2a31d47932f780bcb5'),(738,2,'20220927.235601.302-financas','2022-11-23 10:22:04','36c09b57ebb875f838e0467ce504d103'),(739,2,'20220927.235604.335-financas','2022-11-23 10:22:04','838a86c2ceb4f34a6666238a93b1cae3'),(740,2,'20220927.235607.359-financas','2022-11-23 10:22:04','d71d4e59975a9587f313924354dfc902'),(741,2,'20220927.235610.382-financas','2022-11-23 10:22:04','ef6cd7e75dfe8cecc40e04b9bf8f905a'),(742,2,'20220927.235613.417-financas','2022-11-23 10:22:04','46a4dff4899b2a92dbba65d142437adc'),(743,2,'20220927.235616.438-financas','2022-11-23 10:22:04','f8d8e3922db591093a79fe0b6fb4b190'),(744,2,'20220927.235619.469-financas','2022-11-23 10:22:04','fc0125c2d15626ec33e6307763325a77'),(745,2,'20220927.235622.494-financas','2022-11-23 10:22:04','2f9d8b270afc5b9747835e51447bb4b7'),(746,2,'20220927.235625.524-financas','2022-11-23 10:22:04','ac6da54add78df52e1383ebe9c2338a8'),(747,2,'20220927.235628.559-financas','2022-11-23 10:22:04','48f561bdb85c61f891cef937b06eb2d0'),(748,2,'20220927.235631.600-financas','2022-11-23 10:22:04','58815b4e1bee7fdd50b1d78db2cb1084'),(749,2,'20220927.235634.627-financas','2022-11-23 10:22:04','8e69108f1b45bc78bc2438b8330546bc'),(750,2,'20220927.235637.664-financas','2022-11-23 10:22:04','b4dd79b4b6a8cb98e5b211a912a3621a'),(751,2,'20220927.235640.695-financas','2022-11-23 10:22:04','e969eff4320b86c082d867d97a8a9c78'),(752,2,'20220927.235643.725-financas','2022-11-23 10:22:04','496e19154ea087b01fcfc06b6daadbc9'),(753,2,'20220927.235646.750-financas','2022-11-23 10:22:04','1c80d4013f529f66fd63cb01372200d7'),(754,2,'20220927.235649.785-financas','2022-11-23 10:22:04','50ecc24bf48104ea2a86dd781d7ffd89'),(755,2,'20220927.235652.818-financas','2022-11-23 10:22:04','de1f1af09af1afd36366629862f121e9'),(756,2,'20220927.235655.851-financas','2022-11-23 10:22:04','e26477f71eeaf3166837499e2650abda'),(757,2,'20220927.235658.889-financas','2022-11-23 10:22:04','4d060e45fa3184cfcf4012ff520a2138'),(758,2,'20220927.235701.929-financas','2022-11-23 10:22:04','5c55891f5eab7d70f8f3c7d8271c7370'),(759,2,'20220927.235704.953-financas','2022-11-23 10:22:04','1290d8bd04b17be600e483648bffa9f7'),(760,2,'20220927.235707.975-financas','2022-11-23 10:22:04','5168cc4166a4cb6ea332650ed7fe97e4'),(761,2,'20220927.235711.002-financas','2022-11-23 10:22:04','07b7bf9a85ab215004357fb4ddce7c29'),(762,2,'20220927.235714.052-financas','2022-11-23 10:22:04','e3666e596a4d5d5352752ea03733c830'),(763,2,'20220927.235717.084-financas','2022-11-23 10:22:04','64c7ce8db2b55d8f806ec7358b7e4b2b'),(764,2,'20220927.235720.105-financas','2022-11-23 10:22:04','3affed485e7bb6db18d42b0f537ca6c2'),(765,2,'20220927.235723.141-financas','2022-11-23 10:22:04','91dc77d242e15da3d8149da488e5e9c8'),(766,2,'20220927.235726.169-financas','2022-11-23 10:22:04','a00776e3dae7c7c44ac921753bdf276c'),(767,2,'20220927.235729.202-financas','2022-11-23 10:22:04','1792ca743e9126815cd2c59fd52c90cb'),(768,2,'20220927.235732.236-financas','2022-11-23 10:22:04','1f340b47cef3073bbde9a90012cfdfd3'),(769,2,'20220927.235735.268-financas','2022-11-23 10:22:04','80d3b7eb7252cab93705a77004388d8c'),(770,2,'20220927.235738.302-financas','2022-11-23 10:22:04','90c14f202d10ea6ef018a0dad0bde3fc'),(771,2,'20220927.235741.334-financas','2022-11-23 10:22:04','b818111884047a6f8d0b9a09638e88c6'),(772,2,'20220927.235744.369-financas','2022-11-23 10:22:04','1c4248547031a0cef0355168b50af137'),(773,2,'20220927.235747.398-financas','2022-11-23 10:22:04','a975a028ddd375e5d56c88431500f0ee'),(774,2,'20220927.235750.435-financas','2022-11-23 10:22:04','ceb7ede815ebcd4c947b21c5b6fd424e'),(775,2,'20220927.235753.476-financas','2022-11-23 10:22:04','6bb79ac23d5eafa06b4dd8c437301749'),(776,2,'20220927.235756.506-financas','2022-11-23 10:22:04','cdcce184449a8a0dd3c955a5c7e2c12c'),(777,2,'20220927.235759.543-financas','2022-11-23 10:22:04','778f89492d5a09228b711feb9b22bd71'),(778,2,'20220927.235802.580-financas','2022-11-23 10:22:04','294bc12aa0dce2f0dbeb54de5aea9124'),(779,2,'20220927.235805.609-financas','2022-11-23 10:22:04','c94430ef0ba40364300ea161fe52c737'),(780,2,'20220927.235808.641-financas','2022-11-23 10:22:04','266a8375a1869d73c38625363f9fa0c1'),(781,2,'20220927.235811.673-financas','2022-11-23 10:22:04','beb64ecddb6d53b5e07282f495aae476'),(782,2,'20220927.235814.705-financas','2022-11-23 10:22:04','91ebc50a4fed413b86c938519dab65bd'),(783,2,'20220927.235817.734-financas','2022-11-23 10:22:04','a7d3713334b825647a4d8c6ebf1cce0b'),(784,2,'20220927.235820.769-financas','2022-11-23 10:22:04','505734e67962e96de4b9e992566c7913'),(785,2,'20220927.235823.807-financas','2022-11-23 10:22:04','711ac379cd8d5045cf54ebafbf99c672'),(786,2,'20220927.235826.843-financas','2022-11-23 10:22:04','4c21b086f1729e10900bf88f27afce55'),(787,2,'20220927.235829.876-financas','2022-11-23 10:22:04','763792861f3af6f9f6971aa6745abae0'),(788,2,'20220927.235832.900-financas','2022-11-23 10:22:04','c22b3a3f964c7b78a535f7bfd8fab475'),(789,2,'20220927.235835.926-financas','2022-11-23 10:22:04','7428d713764b3661ac723d7d4e4e3f8f'),(790,2,'20220927.235838.957-financas','2022-11-23 10:22:04','dadc24468002a13b22010ff0124c10b3'),(791,2,'20220927.235841.991-financas','2022-11-23 10:22:04','24ce78d31992261a320bb62cdca64eef'),(792,2,'20220927.235845.017-financas','2022-11-23 10:22:04','358d7f7001e7ef86da3f3b78892a88ed'),(793,2,'20220927.235848.044-financas','2022-11-23 10:22:04','eb745f9f4622309e4322d69dc6aabb48'),(794,2,'20220927.235851.083-financas','2022-11-23 10:22:04','dad540bde9d6ae82bcf08683d155387a'),(795,2,'20220927.235854.111-financas','2022-11-23 10:22:04','d56a9955a66831e3cd10bea22197dd16'),(796,2,'20220927.235857.136-financas','2022-11-23 10:22:04','18443af42dc526a8c7913d6f52d28c27'),(797,2,'20220927.235900.162-financas','2022-11-23 10:22:04','87af76b3ebeb669f8f64fed2d40762b8'),(798,2,'20220927.235903.197-financas','2022-11-23 10:22:04','fb75ed5f27c7009c39aac6b9bbfde6ee'),(799,2,'20220927.235906.224-financas','2022-11-23 10:22:04','577f8604c03e3dd525f45bb29c12d11a'),(800,2,'20220927.235909.255-financas','2022-11-23 10:22:04','080f520da88104eb896ca4cf580180c2'),(801,2,'20220927.235912.287-financas','2022-11-23 10:22:04','af69a3a116345e027f89dbccb8fbfd17'),(802,2,'20220927.235915.315-financas','2022-11-23 10:22:04','d7098656f9877815978eaa9abcf0b634'),(803,2,'20220927.235918.338-financas','2022-11-23 10:22:04','5e82f68bffef13b0457b723fd3d63658'),(804,2,'20220927.235921.371-financas','2022-11-23 10:22:04','96cf360ceef7cddfd842c19b9450bb7f'),(805,2,'20220927.235924.407-financas','2022-11-23 10:22:04','756ed9d79cae58e2c3cee3f2e38c5a84'),(806,2,'20220927.235927.435-financas','2022-11-23 10:22:04','f7014c1d329a51b7699b2b129377aff1'),(807,2,'20220927.235930.460-financas','2022-11-23 10:22:04','11848c0962b063843e22f907ddf07ef8'),(808,2,'20220927.235933.488-financas','2022-11-23 10:22:04','35ad92e5351d87bc2b35728ba12cf21a'),(809,2,'20220927.235936.518-financas','2022-11-23 10:22:04','470d5ea7d3d5e594b37ba239aec45552'),(810,2,'20220927.235939.552-financas','2022-11-23 10:22:04','8acf6ed462dcf15c7d27b6fcf637b960'),(811,2,'20220927.235942.589-financas','2022-11-23 10:22:04','ba31738665b064d382ee3b906c2b9e55'),(812,2,'20220927.235945.621-financas','2022-11-23 10:22:04','a2511814f808f2ad37f36819f774e102'),(813,2,'20220927.235948.650-financas','2022-11-23 10:22:04','115d239b199aa9db09002554c2e6aa76'),(814,2,'20220927.235951.682-financas','2022-11-23 10:22:04','f399f9b58e81364d8c39a4c1b5439a00'),(815,2,'20220927.235954.711-financas','2022-11-23 10:22:04','aa521d7f4fdf376918eca4e7d2bec694'),(816,2,'20220927.235957.739-financas','2022-11-23 10:22:04','56be01365b6abf0b3deff49241a78fb4'),(817,2,'20220928.000000.777-financas','2022-11-23 10:22:04','b6e253e20acd39311b9502d727711040'),(818,2,'20220928.000003.802-financas','2022-11-23 10:22:04','adfaeb0fc320eaba8116a2c42c478007'),(819,2,'20220928.000006.822-financas','2022-11-23 10:22:04','11a57b20efd804e15cc14beebb4dd8de'),(820,2,'20220928.000009.863-financas','2022-11-23 10:22:04','48485204bdb6d62d06076de6afa721c7'),(821,2,'20220928.000012.903-financas','2022-11-23 10:22:04','ba35b3d1f02fe2c7c4f504dd3ec1e6f0'),(822,2,'20220928.000015.943-financas','2022-11-23 10:22:04','b911be1ed198aa51bc46d4f2cc7fc86b'),(823,2,'20220928.000018.981-financas','2022-11-23 10:22:04','019ac18c78b48eb5f49c55923d57ca55'),(824,2,'20220928.000022.009-financas','2022-11-23 10:22:04','ca46c7c9cba4ac5b2691b572a2183d0b'),(825,2,'20220928.000025.041-financas','2022-11-23 10:22:04','5f23e627a971248ac800c893591d3bfd'),(826,2,'20220928.000028.081-financas','2022-11-23 10:22:04','cdef9e1131064800c1c7eeff363cee03'),(827,2,'20220928.000031.113-financas','2022-11-23 10:22:04','811b3f33debbcfa3f0643f7e7b8a09ec'),(828,2,'20220928.000034.142-financas','2022-11-23 10:22:04','2d7925f5932b2c6d51ad92c184e7f505'),(829,2,'20220928.000037.169-financas','2022-11-23 10:22:04','9bccb91339cee9d71a362cafa7d09b44'),(830,2,'20220928.000040.202-financas','2022-11-23 10:22:04','62908dca8568efeb6c4f1459c113463b'),(831,2,'20220928.000043.228-financas','2022-11-23 10:22:04','5e9d95df413f290776c246ff0092353c'),(832,2,'20220928.000046.263-financas','2022-11-23 10:22:04','bfa99eb0d81089bd2a62ad28cc53d9da'),(833,2,'20220928.000049.305-financas','2022-11-23 10:22:04','dadc8867fb1e850d2783f9b6b9f06790'),(834,2,'20220928.000052.334-financas','2022-11-23 10:22:04','678794e6d0f286f9c8d76be2d10608d9'),(835,2,'20220928.000055.360-financas','2022-11-23 10:22:04','e14ef6fc1699e557f7fff89811b414d2'),(836,2,'20220928.000058.393-financas','2022-11-23 10:22:04','f5e60839c98fd886b4cdca30ea8a6132'),(837,2,'20220928.000101.432-financas','2022-11-23 10:22:04','96f8bae9cae2bddf2a03db8b87a536f4'),(838,2,'20220928.000104.459-financas','2022-11-23 10:22:04','b89decc15dd379709c93138825677c45'),(839,2,'20220928.000107.487-financas','2022-11-23 10:22:04','69d87f403ffda7dc67183f4b4493a07e'),(840,2,'20220928.000110.527-financas','2022-11-23 10:22:04','f88d913af6326fd29c4785b2a688dc48'),(841,2,'20220928.000113.561-financas','2022-11-23 10:22:04','f95863595e9b1f8b263c3e33fb52c260'),(842,2,'20220928.000116.585-financas','2022-11-23 10:22:04','c833ecca1f956deac82fb6fd51f4ba37'),(843,2,'20220928.000119.618-financas','2022-11-23 10:22:04','c3713e26d2b72c7118ca69f18ff2076a'),(844,2,'20220928.000122.659-financas','2022-11-23 10:22:04','53da388b6a63c4c91ebc9a90aa80ff6b'),(845,2,'20220928.000125.688-financas','2022-11-23 10:22:04','76690153e03a2ad87c9a6ee54d1ea1e2'),(846,2,'20220928.000128.722-financas','2022-11-23 10:22:04','40eae6f44de870332b0ddb7c2aefaca2'),(847,2,'20220928.000131.753-financas','2022-11-23 10:22:04','fee4f7a4f159dc6061078c51e57ce683'),(848,2,'20220928.000134.781-financas','2022-11-23 10:22:04','37e022d77ff617ff9a2517c9348ffc8b'),(849,2,'20220928.000137.820-financas','2022-11-23 10:22:04','2cbafd94883d540c93aa99428c1baa2d'),(850,2,'20220928.000140.842-financas','2022-11-23 10:22:04','d03a7fc7a8bc51f39617c1d3fbedbf60'),(851,2,'20220928.000143.871-financas','2022-11-23 10:22:04','b49047f4f0af68c5fca8adeb51165637'),(852,2,'20220928.000146.906-financas','2022-11-23 10:22:04','905ad6ef7b3ff45b62b8b9bca517c436'),(853,2,'20220928.000149.934-financas','2022-11-23 10:22:04','cc1b8f562af50f2a28b7264b0dde4d62'),(854,2,'20220928.000152.956-financas','2022-11-23 10:22:04','46a6b07362e27f7d10e697f17a6dfd68'),(855,2,'20220928.000155.994-financas','2022-11-23 10:22:04','5e6549f6fbf2428083b9d3a2dddb268f'),(856,2,'20220928.000159.026-financas','2022-11-23 10:22:04','e71ddc3d12008e591650525e696f15d0'),(857,2,'20220928.000202.058-financas','2022-11-23 10:22:04','239c8e3ae93ce728c9c8f0f591ba7f81'),(858,2,'20220928.000205.078-financas','2022-11-23 10:22:04','4b7e2e370f8187236613f681ee1591b0'),(859,2,'20220928.000208.110-financas','2022-11-23 10:22:04','bf0fd576ecc7b16b5b5e14e9d734cb23'),(860,2,'20220928.000211.138-financas','2022-11-23 10:22:04','163f1763bd7dedcdc70ff6c4567aac8f'),(861,2,'20220928.000214.166-financas','2022-11-23 10:22:04','01851ec36870c83f7b6eac5ca276782f'),(862,2,'20220928.000217.206-financas','2022-11-23 10:22:04','102ecab1258d2e1761bd4bd2608b71a6'),(863,2,'20220928.000220.226-financas','2022-11-23 10:22:04','eab827afdf91f24956622df845135bc0'),(864,2,'20220928.000223.258-financas','2022-11-23 10:22:04','32d0ff125cd817e9abae3c6e83075fe8'),(865,2,'20220928.000226.295-financas','2022-11-23 10:22:04','7b51e05c5689073fa89bdee387700b89'),(866,2,'20220928.000229.320-financas','2022-11-23 10:22:04','5bb97c5fd9b78e8af59d7fd50a793ee6'),(867,2,'20220928.000232.351-financas','2022-11-23 10:22:04','e03b1b5dc85ddc623fdc915331998ce0'),(868,2,'20220928.000235.389-financas','2022-11-23 10:22:04','95369db7bc5443298c77330716ae8aab'),(869,2,'20220928.000238.415-financas','2022-11-23 10:22:04','c8f2b4c933493d7b13f9a5b904548a97'),(870,2,'20220928.000241.445-financas','2022-11-23 10:22:04','eaccbb29076bb77f850aa14cf5e94560'),(871,2,'20220928.000244.477-financas','2022-11-23 10:22:04','3202a72f2393908681a271a5051844f7'),(872,2,'20220928.000247.501-financas','2022-11-23 10:22:04','4ef4f55948156d2c98b695bd1b2951d0'),(873,2,'20220928.000250.533-financas','2022-11-23 10:22:04','cc39b20082d2e00030f513db311d3872'),(874,2,'20220928.000253.562-financas','2022-11-23 10:22:04','5fd5f6826ac4784ce444bc0c2ad07019'),(875,2,'20220928.000256.601-financas','2022-11-23 10:22:04','24ed0937e6706d3d1cd5b4a4a16299c8'),(876,2,'20220928.000259.628-financas','2022-11-23 10:22:04','8dd61af86439cee932f7147f7de841d4'),(877,2,'20220928.000302.658-financas','2022-11-23 10:22:04','521d6a62107b59bf70384e42fc228f57'),(878,2,'20220928.000305.684-financas','2022-11-23 10:22:04','3ed8c633a325085a62cb3806935cc3fd'),(879,2,'20220928.000308.714-financas','2022-11-23 10:22:04','636168aebd918a7f8a4cd8c4bbd7f356'),(880,2,'20220928.000311.741-financas','2022-11-23 10:22:04','00f413cdbac08f722314257430ccea4d'),(881,2,'20220928.000314.771-financas','2022-11-23 10:22:04','f6945103747d30f62a72dfb93f668b1f'),(882,2,'20220928.000317.799-financas','2022-11-23 10:22:04','6248ec4a58585af6281347b50f90b8cb'),(883,2,'20220928.000320.836-financas','2022-11-23 10:22:04','7b52a31c5386292407ced654f041fb3a'),(884,2,'20220928.000323.866-financas','2022-11-23 10:22:04','eb8c3f092775bed74707609b193c00b4'),(885,2,'20220928.000326.888-financas','2022-11-23 10:22:04','df7812b126b561a265057ea5dd423c36'),(886,2,'20220928.000329.925-financas','2022-11-23 10:22:04','2c2855fb3335607cfc08a05be44ec222'),(887,2,'20220928.000332.967-financas','2022-11-23 10:22:04','ee0623f7f92ea767d89cf83e37b712fa'),(888,2,'20220928.000335.991-financas','2022-11-23 10:22:04','f3fce8b63dacf81e26863c4cc6b9e31d'),(889,2,'20220928.000339.022-financas','2022-11-23 10:22:04','6cd87c8554f0a426ef6f9b7bb8266698'),(890,2,'20220928.000342.050-financas','2022-11-23 10:22:04','e4a750fe48ae88137190761193e17148'),(891,2,'20220928.000345.072-financas','2022-11-23 10:22:04','75d35f9827e1f0dc4a3f18afc98ad11e'),(892,2,'20220928.000348.111-financas','2022-11-23 10:22:04','4e0417e7e48551844bf83c5aa5975941'),(893,2,'20220928.000351.138-financas','2022-11-23 10:22:04','626723f1b6d582b2f7d06666ccc4e056'),(894,2,'20220928.000354.170-financas','2022-11-23 10:22:04','f2bae0e178df68b72973fe3b8e4bb9cd'),(895,2,'20220928.000357.198-financas','2022-11-23 10:22:04','b2dd13849b6ce31eeca1ea7a4ee341d6'),(896,2,'20220928.000400.229-financas','2022-11-23 10:22:04','ade2d54c56518198d5a73f7284612384'),(897,2,'20220928.000403.254-financas','2022-11-23 10:22:04','598035eb69664b113d46113528a8b321'),(898,2,'20220928.000406.288-financas','2022-11-23 10:22:04','903f2dad080642469fa33c8b6f9b456a'),(899,2,'20220928.000409.316-financas','2022-11-23 10:22:04','aa49db351a8d35355e6115f53f21edf5'),(900,2,'20220928.000412.356-financas','2022-11-23 10:22:04','460543a855a0e3d86192a64d39b5bbfe'),(901,2,'20220928.000415.390-financas','2022-11-23 10:22:04','6a2363af38e0357450dce2ccb95fa776'),(902,2,'20220928.000418.428-financas','2022-11-23 10:22:04','01ed4278638d8963652b346a3d77e558'),(903,2,'20220928.000421.451-financas','2022-11-23 10:22:04','fd2d40e5dc25cb7aab646dfb8d16dfc3'),(904,2,'20220928.000424.491-financas','2022-11-23 10:22:04','0fbc917a96eb6f896f0558de774b796e'),(905,2,'20220928.000427.532-financas','2022-11-23 10:22:04','cf79c263f569246d39db4851159369aa'),(906,2,'20220928.000430.557-financas','2022-11-23 10:22:04','f0ac36ee40b8fc1e0272e562cddfbd9b'),(907,2,'20220928.000433.586-financas','2022-11-23 10:22:04','89b1072628cd1230388f2430d1013294'),(908,2,'20220928.000436.627-financas','2022-11-23 10:22:04','27df7ddb82257bc1ad0f37155d7ea6fb'),(909,2,'20220928.000439.659-financas','2022-11-23 10:22:04','322248405392c1ca4a2c020d7c420d14'),(910,2,'20220928.000442.697-financas','2022-11-23 10:22:04','a58c5c79b34813c4ef032e16625e9341'),(911,2,'20220928.000445.727-financas','2022-11-23 10:22:04','bb316a0411c0fd4aa4a360991d0008cf'),(912,2,'20220928.000448.754-financas','2022-11-23 10:22:04','1b891ca3ac345d3226d88262ae965faf'),(913,2,'20220928.000451.790-financas','2022-11-23 10:22:04','7e0712cba900865caa2ee64c2fc8934f'),(914,2,'20220928.000454.830-financas','2022-11-23 10:22:04','72f207e3450ae626a89e04e498c77f23'),(915,2,'20220928.000457.858-financas','2022-11-23 10:22:04','3a759285b7d0dd54801c4ccb3e592230'),(916,2,'20220928.000500.883-financas','2022-11-23 10:22:04','3d07a649165ec4a98efc992f78c9136e'),(917,2,'20220928.000503.923-financas','2022-11-23 10:22:04','c97af7faac498bfce222935050088098'),(918,2,'20220928.000506.955-financas','2022-11-23 10:22:04','20ed636ea1ee1a86dee36d2202f6f6f3'),(919,2,'20220928.000509.991-financas','2022-11-23 10:22:04','ca7d1342874e5206b30f4ae42cef912d'),(920,2,'20220928.000513.015-financas','2022-11-23 10:22:04','9a9e0da3b455428dda0e6bbe7f804d99'),(921,2,'20220928.000516.050-financas','2022-11-23 10:22:04','4f31f7aa2e57e17d9952a509c6318c0d'),(922,2,'20220928.000519.083-financas','2022-11-23 10:22:04','e6c63dbbeb17dddc877906bbefbdcc7d'),(923,2,'20220928.000522.115-financas','2022-11-23 10:22:04','5283348430938a94ebbf4786c989a2f3'),(924,2,'20220928.000525.156-financas','2022-11-23 10:22:04','e30915ccc6741c972c029969e466b3e1'),(925,2,'20220928.000528.187-financas','2022-11-23 10:22:04','f7eef8bc44926e00e0a903c172fe0118'),(926,2,'20220928.000531.223-financas','2022-11-23 10:22:04','486c9755fd98c45e595b558b46fd3e71'),(927,2,'20220928.000534.253-financas','2022-11-23 10:22:04','72be136c7e97209505dbddf9d19b323c'),(928,2,'20220928.000537.274-financas','2022-11-23 10:22:04','9082c482e664d565062c24caae961b62'),(929,2,'20220928.000540.310-financas','2022-11-23 10:22:04','ada3b454d48d9b003519bbdd9a8fb918'),(930,2,'20220928.000543.338-financas','2022-11-23 10:22:04','b26662136d5cad426b073d0c53eb803f'),(931,2,'20220928.000546.372-financas','2022-11-23 10:22:04','87a01a1d77351866d2cbf39ba3193590'),(932,2,'20220928.000549.408-financas','2022-11-23 10:22:04','68176f14fff364db47a789b32fc94040'),(933,2,'20220928.000552.450-financas','2022-11-23 10:22:04','49a3f1177409005b9988e7b940eee4bb'),(934,2,'20220928.000555.478-financas','2022-11-23 10:22:04','d08ee249c47be10fd206cacced928980'),(935,2,'20220928.000558.508-financas','2022-11-23 10:22:04','4a51768683fc3d46b7db91184437c332'),(936,2,'20220928.000601.544-financas','2022-11-23 10:22:04','a23344fb918fa867dc44d5cf8c30cb3f'),(937,2,'20220928.000604.564-financas','2022-11-23 10:22:04','79c428a6fd785453ce34dc2224577a53'),(938,2,'20220928.000607.588-financas','2022-11-23 10:22:04','3ad582f1e8ca46c7df235c98475a1ba9'),(939,2,'20220928.000610.626-financas','2022-11-23 10:22:04','0a40e4cc7f6c4848c388d74bd013c0c4'),(940,2,'20220928.000613.667-financas','2022-11-23 10:22:04','6b8a89cfdc305218e9d778a7ffbd4cd5'),(941,2,'20220928.000616.703-financas','2022-11-23 10:22:04','9d72519bf72b69d6fcb3160728f91a98'),(942,2,'20220928.000619.731-financas','2022-11-23 10:22:04','89d3371a4338fd7f74858a184814a844'),(943,2,'20220928.000622.761-financas','2022-11-23 10:22:04','91b959e337114aaaf6b225ad12142755'),(944,2,'20220928.000625.789-financas','2022-11-23 10:22:04','1f9ec8e908b993c725f0d09334fb19b7'),(945,2,'20220928.000628.819-financas','2022-11-23 10:22:04','5d6772f12f48ea2e94d4066f32e638c9'),(946,2,'20220928.000631.844-financas','2022-11-23 10:22:04','75748124a2f265728c495ca922f914a7'),(947,2,'20220928.000634.882-financas','2022-11-23 10:22:04','137d527416192e1d15f3a348d2f1cf82'),(948,2,'20220928.000637.921-financas','2022-11-23 10:22:04','94ce27bc56453fbb259b6ee3ca2ed85e'),(949,2,'20220928.000640.954-financas','2022-11-23 10:22:04','b0c21502f4717044301c5b979cf703e4'),(950,2,'20220928.000643.980-financas','2022-11-23 10:22:04','1cce069b94308eb8ab26c35f8c9db11c'),(951,2,'20220928.000647.008-financas','2022-11-23 10:22:04','8ae5428f9edbe2fa3b6344396937c6a5'),(952,2,'20220928.000650.050-financas','2022-11-23 10:22:04','82be79ba467a93e2a6bfc75904088028'),(953,2,'20220928.000653.076-financas','2022-11-23 10:22:04','82787a6c16562143526ce0d6ede63992'),(954,2,'20220928.000656.104-financas','2022-11-23 10:22:04','5ea5dbc90359fdae88e7e19c126f9bf6'),(955,2,'20220928.000659.138-financas','2022-11-23 10:22:04','360ffac42221eb43a31193542c705f28'),(956,2,'20220928.000702.173-financas','2022-11-23 10:22:04','542270084aedd0a8e3279833919c5123'),(957,2,'20220928.000705.207-financas','2022-11-23 10:22:04','5b2782bb8acd162e7ba18e92f5de3709'),(958,2,'20220928.000708.236-financas','2022-11-23 10:22:04','52addc1dee9de5caaea64f368ce7da3a'),(959,2,'20220928.000711.264-financas','2022-11-23 10:22:04','36e10da0d076a091884208ee048f988e'),(960,2,'20220928.000714.288-financas','2022-11-23 10:22:04','a05a4838c06db3997b34df53ce1699df'),(961,2,'20220928.000717.326-financas','2022-11-23 10:22:04','29ec052e80bc83d6edbd82e365c28234'),(962,2,'20220928.000720.359-financas','2022-11-23 10:22:04','dad75d3b9cbf8de6b4a534216822c9fa'),(963,2,'20220928.000723.400-financas','2022-11-23 10:22:04','1562dd92f6294c03fdb241bcdb9198e7'),(964,2,'20220928.000726.434-financas','2022-11-23 10:22:04','023bff25a0500a35da8426489b1e1f2d'),(965,2,'20220928.000729.468-financas','2022-11-23 10:22:04','1a1d55fe0519b419a695fb6d45f960ce'),(966,2,'20220928.000732.501-financas','2022-11-23 10:22:04','3eb4ecc8d7bcf49c38aed75096d36554'),(967,2,'20220928.000735.533-financas','2022-11-23 10:22:04','60483703493a4ae6f5983186192bff90'),(968,2,'20220928.000738.567-financas','2022-11-23 10:22:04','aef3d6bd2ba89e8da43bf1b9ed679175'),(969,2,'20220928.000741.592-financas','2022-11-23 10:22:04','18db1d0e5dcfd3fa0f7dd0fa38b567c9'),(970,2,'20220928.000744.622-financas','2022-11-23 10:22:04','44566e6ba07ec4d942b60eeb96282884'),(971,2,'20220928.000747.645-financas','2022-11-23 10:22:04','ec8dcb7f2eb75a918e3da01b4d526c4a'),(972,2,'20220928.000750.686-financas','2022-11-23 10:22:04','964858bb6be76c37e6d94ba47b2a5999'),(973,2,'20220928.000753.718-financas','2022-11-23 10:22:04','a03e279f6530d14bed6f4e71e9de7cdc'),(974,2,'20220928.000756.745-financas','2022-11-23 10:22:04','f336a8efd690e49e080b1bb5482c005f'),(975,2,'20220928.000759.767-financas','2022-11-23 10:22:04','4c1b52d064a6ebd1c0154ecc3b279055'),(976,2,'20220928.000802.796-financas','2022-11-23 10:22:04','c0aeecad58d42499f46a5f097525655a'),(977,2,'20220928.000805.827-financas','2022-11-23 10:22:04','ee3378fe913eb6124ac946523873cc4f'),(978,2,'20220928.000808.858-financas','2022-11-23 10:22:04','59ddf72fbb8d2993c62480c88a6343ca'),(979,2,'20220928.000811.893-financas','2022-11-23 10:22:04','1e710cb0b2a250547c25b4a075c410cf'),(980,2,'20220928.000814.920-financas','2022-11-23 10:22:04','8ec2b59efd7e7b83399240bf30328830'),(981,2,'20220928.000817.950-financas','2022-11-23 10:22:04','3235490b8d3e9cb94ba6b87a04f19cf6'),(982,2,'20220928.000820.970-financas','2022-11-23 10:22:04','ef865aa1736a34058b3ac92cca4616e6'),(983,2,'20220928.000823.991-financas','2022-11-23 10:22:04','f1d644365980d21a4f1af42c100203bf'),(984,2,'20220928.000827.017-financas','2022-11-23 10:22:04','45a70caae357b4e62d56462fbeda7b15'),(985,2,'20220928.000830.051-financas','2022-11-23 10:22:04','8fa24fda5d0114962dfacd89cb8fb133'),(986,2,'20220928.000833.075-financas','2022-11-23 10:22:04','7db7f9d78dc78c0160d3c226d504b20e'),(987,2,'20220928.000836.114-financas','2022-11-23 10:22:04','24f797e518cb8be8488841d194ddcd1c'),(988,2,'20220928.000839.133-financas','2022-11-23 10:22:04','dddbd02a94932a4787aaf030e62d55ea'),(989,2,'20220928.000842.159-financas','2022-11-23 10:22:04','e94feff932a87dbd1118883bcec82c05'),(990,2,'20220928.000845.191-financas','2022-11-23 10:22:04','4cc9172431a42e85945a645d3d5d7fba'),(991,2,'20220928.000848.226-financas','2022-11-23 10:22:04','8edd87013cbed9b454aa34abfe30cc55'),(992,2,'20220928.000851.258-financas','2022-11-23 10:22:04','876c84730d8f795cfa0d7f53103ff95d'),(993,2,'20220928.000854.278-financas','2022-11-23 10:22:04','0ea07426b60927495660fd358193d69e'),(994,2,'20220928.000857.314-financas','2022-11-23 10:22:04','0e704dfea9c4a9b500e25a2f43e67200'),(995,2,'20220928.000900.341-financas','2022-11-23 10:22:04','d2fab49d93650f25a77ecf1e1269669d'),(996,2,'20220928.000903.379-financas','2022-11-23 10:22:04','217c07e005d12d85bb48bbfdaa6a59e9'),(997,2,'20220928.000906.405-financas','2022-11-23 10:22:04','06c9b74be026fa30bb57550ef4c6eae3'),(998,2,'20220928.000909.435-financas','2022-11-23 10:22:04','71b6a6491510b840323fe2aa630d03d2'),(999,2,'20220928.000912.472-financas','2022-11-23 10:22:04','7aa4cf56ba3ea6c4564c676822752b70'),(1000,2,'20220928.000915.501-financas','2022-11-23 10:22:04','39e322b0fd453ae04a92833c5d77f136'),(1001,2,'20220928.000918.537-financas','2022-11-23 10:22:04','8f6ffa6e9f57362312ae97987670cf2c'),(1002,2,'20220928.000921.566-financas','2022-11-23 10:22:04','c30240a48a9b753adab1ae824649612d'),(1003,2,'20220928.000924.597-financas','2022-11-23 10:22:04','3226f2d79557a442acfd1c31d0024943'),(1004,2,'20220928.000927.634-financas','2022-11-23 10:22:04','7e09644ea8edc39125b33509a876698c'),(1005,2,'20220928.000930.662-financas','2022-11-23 10:22:04','fa30c381d22babec0cd991e3a7a4daec'),(1006,2,'20220928.000933.690-financas','2022-11-23 10:22:04','50547917e9d2aad5ed781314f0875ab4'),(1007,2,'20220928.000936.726-financas','2022-11-23 10:22:04','17b03863ce98bee0dfca671bc7493851'),(1008,2,'20220928.000939.759-financas','2022-11-23 10:22:04','38841f2c00be4af6ae0d177453db86cb'),(1009,2,'20220928.000942.790-financas','2022-11-23 10:22:04','7c9e875b60f8504382bc2bd7e37d7d7c'),(1010,2,'20220928.000945.820-financas','2022-11-23 10:22:04','242a285fa1318da312358908c7030aef'),(1011,2,'20220928.000948.853-financas','2022-11-23 10:22:04','57b65bf36f729aeb398587b2003813c7'),(1012,2,'20220928.000951.893-financas','2022-11-23 10:22:04','d23f06350e3b10923427f71e54daa7de'),(1013,2,'20220928.000954.921-financas','2022-11-23 10:22:04','4cb0324aa928a3d8bb5159cdea243f31'),(1014,2,'20220928.000957.956-financas','2022-11-23 10:22:04','f579dfdbebf41282614cadc84b3f514a'),(1015,2,'20220928.001000.995-financas','2022-11-23 10:22:04','7c36c112ff34837fecb23d64cf12437a'),(1016,2,'20220928.001004.029-financas','2022-11-23 10:22:04','fc964cf31c8656abbb3c556305f8f54e'),(1017,2,'20220928.001007.053-financas','2022-11-23 10:22:04','12d3de3c2d3a261b84702f9d15966ad6'),(1018,2,'20220928.001010.083-financas','2022-11-23 10:22:04','d1b491219c14367dcc1deb1e915d8058'),(1019,2,'20220928.001013.112-financas','2022-11-23 10:22:04','13e1b452d259a6e9bd8f514b17d77b07'),(1020,2,'20220928.001016.152-financas','2022-11-23 10:22:04','7bfbb482dca05e3962591de1878384a6'),(1021,2,'20220928.001019.181-financas','2022-11-23 10:22:04','dffd5a1edb7072a7d645c662c067afd3'),(1022,2,'20220928.001022.212-financas','2022-11-23 10:22:04','f1ef37919cb14eadf10e794a7c3acbce'),(1023,2,'20220928.001025.248-financas','2022-11-23 10:22:04','811e19d6e3cb2b533134c5005607ce0c'),(1024,2,'20220928.001028.277-financas','2022-11-23 10:22:04','04829d955eb1287e37439278098c1bb9'),(1025,2,'20220928.001031.307-financas','2022-11-23 10:22:04','0db084624eda9aa236a1153d0cd4ff8c'),(1026,2,'20220928.001034.339-financas','2022-11-23 10:22:04','9ffb30d9ff56544d8d5ff5df67682878'),(1027,2,'20220928.001037.359-financas','2022-11-23 10:22:04','f2a0f21e11f1460f0674a326364a5d1a'),(1028,2,'20220928.001040.393-financas','2022-11-23 10:22:04','04eb5b4135c0e64f132116811aa1b51c'),(1029,2,'20220928.001043.426-financas','2022-11-23 10:22:04','555ee173f82b6ca8124cd08a2a277cd8'),(1030,2,'20220928.001046.452-financas','2022-11-23 10:22:04','1bb61ed396de24e98f7d956f66ea21e8'),(1031,2,'20220928.001049.483-financas','2022-11-23 10:22:04','a286ede87b852c957839e5d39497ff65'),(1032,2,'20220928.001052.524-financas','2022-11-23 10:22:04','d4940fd3c89c34759ad2ccc8d7f21ab5'),(1033,2,'20220928.001055.558-financas','2022-11-23 10:22:04','4c437cd931eb749e5a8241c7f333cf25'),(1034,2,'20220928.001058.601-financas','2022-11-23 10:22:04','d3105435c326be9b990e349e47e1fbe1'),(1035,2,'20220928.001101.633-financas','2022-11-23 10:22:04','066805883b7215fe6c0c406a3c18df76'),(1036,2,'20220928.001104.657-financas','2022-11-23 10:22:04','6f490b2c3cab473d920ff83be3fd1fcb'),(1037,2,'20220928.001107.695-financas','2022-11-23 10:22:04','bdbcc5d5f2974930f82379ee79df34bd'),(1038,2,'20220928.001110.735-financas','2022-11-23 10:22:04','6c1c031deb010b28dad534d15223ca5d'),(1039,2,'20220928.001113.775-financas','2022-11-23 10:22:04','968f3963758e1dc9f1876a1efc92a91d'),(1040,2,'20220928.001116.803-financas','2022-11-23 10:22:04','c57b9fefd819e427e499447c50552a56'),(1041,2,'20220928.001119.834-financas','2022-11-23 10:22:04','86576e1365ee125cf7e63c880b1e3afa'),(1042,2,'20220928.001122.856-financas','2022-11-23 10:22:04','01ea1fe27812d029087b6305ba5d5387'),(1043,2,'20220928.001125.889-financas','2022-11-23 10:22:04','a3ec36700368a54d4888a77496fb5ea9'),(1044,2,'20220928.001128.921-financas','2022-11-23 10:22:04','cbc5cb9020ac2cb61f816ce713827687'),(1045,2,'20220928.001131.962-financas','2022-11-23 10:22:04','83d8444b17ba84580ed0373bd47218ec'),(1046,2,'20220928.001134.990-financas','2022-11-23 10:22:04','9d104b4c79e9869b073f0701ef99ee22'),(1047,2,'20220928.001138.026-financas','2022-11-23 10:22:04','c9019bbb4459b5caa0a4dd0d002f1b91'),(1048,2,'20220928.001141.052-financas','2022-11-23 10:22:04','fc58618e49f7025364d0f984ef4c79d1'),(1049,2,'20220928.001144.081-financas','2022-11-23 10:22:04','0b939ff542a96aa26fee3cf6ab13e15e'),(1050,2,'20220928.001147.123-financas','2022-11-23 10:22:04','fe53da7620a80e3585bdfb9c32793df7'),(1051,2,'20220928.001150.151-financas','2022-11-23 10:22:04','daf3d8bb7d93309b495366cf7947a9d6'),(1052,2,'20220928.001153.173-financas','2022-11-23 10:22:04','e096b1a670b926bb9af650582db9c8ff'),(1053,2,'20220928.001156.206-financas','2022-11-23 10:22:04','276103c49a9adc64d755b6facf68923b'),(1054,2,'20220928.001159.245-financas','2022-11-23 10:22:04','59a6dffd80a8b7731e84957c89863438'),(1055,2,'20220928.001202.273-financas','2022-11-23 10:22:04','43cecea08623de87ea591965bbca1827'),(1056,2,'20220928.001205.305-financas','2022-11-23 10:22:04','fa84ca219eaf623e9f188ac6b649b4d2'),(1057,2,'20220928.001208.339-financas','2022-11-23 10:22:04','c6c78bab765cb78f4c07fd3771f2e79d'),(1058,2,'20220928.001211.375-financas','2022-11-23 10:22:04','b23c2b1c1b22f75b9162be82a47a5464'),(1059,2,'20220928.001214.407-financas','2022-11-23 10:22:04','d899a17804c689ca47825d0f13c77356'),(1060,2,'20220928.001217.433-financas','2022-11-23 10:22:04','6a7d9e3440a59388b3675ebbb6a9755e'),(1061,2,'20220928.001220.463-financas','2022-11-23 10:22:04','951282abe531ac9a4b10c26d0037eeec'),(1062,2,'20220928.001223.491-financas','2022-11-23 10:22:04','46b22c155488a686d5e790e6adfe7862'),(1063,2,'20220928.001226.518-financas','2022-11-23 10:22:04','4aa6dd1105610b3fc50ffe5fea831569'),(1064,2,'20220928.001229.546-financas','2022-11-23 10:22:04','360f51012ca7db796539ad40f55cd629'),(1065,2,'20220928.001232.578-financas','2022-11-23 10:22:04','85fce6250ba62ebc1b602b9f3be18c55'),(1066,2,'20220928.001235.619-financas','2022-11-23 10:22:04','21bd98edb326008a5226d582bf5262c6'),(1067,2,'20220928.001238.658-financas','2022-11-23 10:22:04','2c294cfff37b78fd402d3f2bd6c6dc42'),(1068,2,'20220928.001241.691-financas','2022-11-23 10:22:04','9cde74bf28f7680e59770e2632fba133'),(1069,2,'20220928.001244.721-financas','2022-11-23 10:22:04','f5ba17e9358f315c904a4bd61285a7fb'),(1070,2,'20220928.001247.753-financas','2022-11-23 10:22:04','ac24de4097d594f2174cab90cc9094e4'),(1071,2,'20220928.001250.785-financas','2022-11-23 10:22:04','8b494b7dd980b29f272b14a05d353b42'),(1072,2,'20220928.001253.812-financas','2022-11-23 10:22:04','952566cd9f02742f9eed75eed332a953'),(1073,2,'20220928.001256.838-financas','2022-11-23 10:22:04','185087acd003ec17c2b561acfc3ac8a7'),(1074,2,'20220928.001259.867-financas','2022-11-23 10:22:04','b08137d41158d6bad7a8f9546a656688'),(1075,2,'20220928.001302.909-financas','2022-11-23 10:22:04','932946e12e3a8de2b716eba5bca28046'),(1076,2,'20220928.001305.942-financas','2022-11-23 10:22:04','d2c96b6cef2b0b20bcdb642e3cd2c58d'),(1077,2,'20220928.001308.980-financas','2022-11-23 10:22:04','ce8b3566f735129fcaa297ea53fb1b6a'),(1078,2,'20220928.001312.010-financas','2022-11-23 10:22:04','fd49b8a5fb8271469469231af32a1061'),(1079,2,'20220928.001315.039-financas','2022-11-23 10:22:04','4057270c27d880e5a86c0c44cc51dae5'),(1080,2,'20220928.001318.070-financas','2022-11-23 10:22:04','cabf756ef4f0aeed72d43324b5fe99a1'),(1081,2,'20220928.001321.102-financas','2022-11-23 10:22:04','e64c6633f6eb51aa3ac731b3a7997c2a'),(1082,2,'20220928.001324.136-financas','2022-11-23 10:22:04','f5bdba9a299929bce287a78d017b291c'),(1083,2,'20220928.001327.166-financas','2022-11-23 10:22:04','05038694087fe3b41c623d607e50e42f'),(1084,2,'20220928.001330.196-financas','2022-11-23 10:22:04','0cb5a39619c16121604c552e14fdae22'),(1085,2,'20220928.001333.225-financas','2022-11-23 10:22:04','acc4699ae326b8a236ba2bbd12d22843'),(1086,2,'20220928.001336.250-financas','2022-11-23 10:22:05','8a7ef6db6933a6b3571792196133f7ed'),(1087,2,'20220928.001339.281-financas','2022-11-23 10:22:05','905b72ccb806c515604621070cea2ffe'),(1088,2,'20220928.001342.306-financas','2022-11-23 10:22:05','8c32411e308fa4c7b124693869a4fb6f'),(1089,2,'20220928.001345.336-financas','2022-11-23 10:22:05','7ed36de605151abe78733ba646959834'),(1090,2,'20220928.001348.365-financas','2022-11-23 10:22:05','232cc88245ceaf36269d84af6bde04d7'),(1091,2,'20220928.001351.392-financas','2022-11-23 10:22:05','9c591a2fc47d0b0ca35fa8301ceb0dab'),(1092,2,'20220928.001354.423-financas','2022-11-23 10:22:05','7ece45b6b39b8e4c62c005d133d1b769'),(1093,2,'20220928.001357.454-financas','2022-11-23 10:22:05','b139ad81f767efbbc14ab5b92852ab04'),(1094,2,'20220928.001400.490-financas','2022-11-23 10:22:05','c9a34978d17fb6e6c0cb4264add2d2bc'),(1095,2,'20220928.001403.510-financas','2022-11-23 10:22:05','9c7c98955aeebdea3096cc503e29a3e6'),(1096,2,'20220928.001406.543-financas','2022-11-23 10:22:05','8cfd41d787b5d20c7c83a09afd4640c0'),(1097,2,'20220928.001409.571-financas','2022-11-23 10:22:05','f3ab11124c85f5bcc8357fdb3b6fcff3'),(1098,2,'20220928.001412.597-financas','2022-11-23 10:22:05','5a9a464b80ee215ad45b4899cf88d5b2'),(1099,2,'20221010.125555.282-financas','2022-11-23 10:22:05','43497a55c9de558f56e12327e9da3984'),(1100,2,'20221109.220608.516-financas','2022-11-23 10:22:05','7ead4911ae7c16498bc6ff0720de798f'),(1101,2,'20221109.220611.556-financas','2022-11-23 10:22:05','3a6497178f47cbb459cd9aa878f8b059'),(1102,2,'20221109.220614.587-financas','2022-11-23 10:22:05','ec276b57f1669df0d28182a8694d2524'),(1103,2,'20221109.220617.620-financas','2022-11-23 10:22:05','50f52a4a1cad285ac827cfa04dbb463e'),(1104,2,'20221109.220620.652-financas','2022-11-23 10:22:05','70d428f251c3d675a1044311dd978798'),(1105,2,'20221109.220623.682-financas','2022-11-23 10:22:05','ca89b67a443c28c2fd57cc91a53df80d'),(1106,2,'20221109.220626.717-financas','2022-11-23 10:22:05','fa269b4c5a0a75ddabadee1be612d18a'),(1107,2,'20221109.220629.751-financas','2022-11-23 10:22:05','0546e85cd5e74268c1197acaea512f11'),(1108,2,'20221109.220632.783-financas','2022-11-23 10:22:05','d75084b09925f5804a141e61583b2dae'),(1109,2,'20221109.220635.812-financas','2022-11-23 10:22:05','5ac81302a7da91d9f93a38000244da8c'),(1110,2,'20221109.220638.847-financas','2022-11-23 10:22:05','89d3b52575ded02e3b486838c2fa5203'),(1111,2,'20221109.220641.879-financas','2022-11-23 10:22:05','4753c4cdd89baa8ec4c7a5777936b032'),(1112,2,'20221109.220644.908-financas','2022-11-23 10:22:05','805a9b4df9be37d51859c0268d96d222'),(1113,2,'20221109.220647.939-financas','2022-11-23 10:22:05','bd747af198775167d865e91713c1e020'),(1114,2,'20221111.190830.275-financas','2022-11-23 10:22:05','a0a5603b7c104d9a982a22114916737c'),(1115,2,'20221111.191354.353-financas','2022-11-23 10:22:05','a73aac0f6b0c6b25596516c3bbd77f27'),(1116,2,'20221117.190045.919-financas','2022-11-23 10:22:05','901e9d0b29ec0fb56be0b245ab3bb688'),(1117,2,'20221117.190048.951-financas','2022-11-23 10:22:05','f07b0b9899867f069edcb5ef02d3d8d8'),(1118,2,'20221117.190051.979-financas','2022-11-23 10:22:05','7953c1d2296c686c4450d3fd2476c431'),(1119,2,'20221117.190055.001-financas','2022-11-23 10:22:05','64d331219ef60687e9569b256dd53d98'),(1120,2,'20221122.233150.252-financas','2022-11-23 10:22:05','09379b4f73291527963d9db66efbd071'),(1121,2,'20221122.233153.288-financas','2022-11-23 10:22:05','584a6b3f3332cc7541c4aa9376f1f0fa'),(1122,2,'20221122.233156.331-financas','2022-11-23 10:22:05','6554dcd84b7829c95463dac955d517cf');
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

-- Dump completed on 2022-11-25 12:37:27
