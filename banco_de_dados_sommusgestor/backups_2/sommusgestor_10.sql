-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_10
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
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=latin1;
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
INSERT INTO `configuracao` VALUES (17,0,0,0,'','',0.00,NULL,NULL,NULL,0.0000,0,0,0.0000,0,0,0,0.0000,0,0,NULL,0,0,0,0,NULL,0,'','',0,NULL,NULL,0,0,0,'',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `conta` VALUES (1,17,1,0,'Caixa interno',1,0.00,0.00,'2022-10-30','','','',NULL,1,0);
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
INSERT INTO `empresa` VALUES (17,'Finanças','Teste','58101194000100','','','2022-10-27','','',0,1,0);
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
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-10-31 17:20:24'),(2,2,'Cheque',1,2,2,1,0,1,'2022-10-31 17:20:24'),(3,3,'Cartão',1,3,3,0,0,0,'2022-10-31 17:20:24'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-10-31 17:20:24'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-10-31 17:20:24'),(6,6,'PIX',1,6,17,0,0,1,'2022-10-31 17:20:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-10-31 17:20:24',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome Fantasia\":\"Teste\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"58.101.194/0001-00\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(2,NULL,'2022-10-31 17:20:24',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 9999-9999\",\"[identificacao]\":\"(37) 9999-9999\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome Fantasia\":\"Teste\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"58.101.194/0001-00\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(3,NULL,'2022-10-31 17:20:24',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"E-mail\",\"Contato\":\"leohpaim@gmail.com\",\"[identificacao]\":\"leohpaim@gmail.com\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome Fantasia\":\"Teste\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"58.101.194/0001-00\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(4,NULL,'2022-10-31 17:20:24',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.591-262\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Finanças\",\"[identificacao]\":\"Finanças\",\"Nome Fantasia\":\"Teste\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"58.101.194/0001-00\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}'),(5,NULL,'2022-10-31 17:20:24',1,91,17,'{\"ID\":\"17\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(6,NULL,'2022-10-31 17:20:24',2,91,17,'{\"ID\":\"17\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(7,NULL,'2022-10-31 17:20:24',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(8,NULL,'2022-10-31 17:20:24',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(9,NULL,'2022-10-31 17:20:24',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(10,NULL,'2022-10-31 17:20:24',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(11,NULL,'2022-10-31 17:20:24',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(12,NULL,'2022-10-31 17:20:24',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(13,NULL,'2022-10-31 17:20:24',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(14,NULL,'2022-10-31 17:20:24',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(15,NULL,'2022-10-31 17:20:24',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(16,NULL,'2022-10-31 17:20:24',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(17,NULL,'2022-10-31 17:20:24',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(18,NULL,'2022-10-31 17:20:24',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(19,NULL,'2022-10-31 17:20:24',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(20,NULL,'2022-10-31 17:20:24',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(21,NULL,'2022-10-31 17:20:24',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(22,NULL,'2022-10-31 17:20:24',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(23,NULL,'2022-10-31 17:20:24',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(24,NULL,'2022-10-31 17:20:24',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(25,NULL,'2022-10-31 17:20:24',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(26,NULL,'2022-10-31 17:20:24',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(27,NULL,'2022-10-31 17:20:24',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(28,NULL,'2022-10-31 17:20:24',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(29,NULL,'2022-10-31 17:20:24',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(30,NULL,'2022-10-31 17:20:24',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(31,NULL,'2022-10-31 17:20:24',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(32,NULL,'2022-10-31 17:20:24',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(33,NULL,'2022-10-31 17:20:24',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(34,NULL,'2022-10-31 17:20:24',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(35,NULL,'2022-10-31 17:20:24',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(36,NULL,'2022-10-31 17:20:24',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(37,NULL,'2022-10-31 17:20:24',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(38,NULL,'2022-10-31 17:20:24',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(39,NULL,'2022-10-31 17:20:24',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(40,NULL,'2022-10-31 17:20:24',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(41,NULL,'2022-10-31 17:20:24',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(42,NULL,'2022-10-31 17:20:24',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(43,NULL,'2022-10-31 17:20:24',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(44,NULL,'2022-10-31 17:20:24',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(45,NULL,'2022-10-31 17:20:24',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(46,NULL,'2022-10-31 17:20:24',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(47,NULL,'2022-10-31 17:20:24',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(48,NULL,'2022-10-31 17:20:24',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(49,NULL,'2022-10-31 17:20:24',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(50,NULL,'2022-10-31 17:20:24',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(51,NULL,'2022-10-31 17:20:24',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(52,NULL,'2022-10-31 17:20:24',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(53,NULL,'2022-10-31 17:20:24',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(54,NULL,'2022-10-31 17:20:24',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(55,NULL,'2022-10-31 17:20:24',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(56,NULL,'2022-10-31 17:20:24',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(57,NULL,'2022-10-31 17:20:24',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(58,NULL,'2022-10-31 17:20:24',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(59,NULL,'2022-10-31 17:20:24',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(60,NULL,'2022-10-31 17:20:24',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(61,NULL,'2022-10-31 17:20:24',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(62,NULL,'2022-10-31 17:20:24',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(63,NULL,'2022-10-31 17:20:24',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(64,NULL,'2022-10-31 17:20:24',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(65,NULL,'2022-10-31 17:20:24',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(66,NULL,'2022-10-31 17:20:24',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(67,NULL,'2022-10-31 17:20:24',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(68,NULL,'2022-10-31 17:20:24',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(69,NULL,'2022-10-31 17:20:24',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(70,NULL,'2022-10-31 17:20:24',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(71,NULL,'2022-10-31 17:20:24',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(72,NULL,'2022-10-31 17:20:24',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(73,NULL,'2022-10-31 17:20:24',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(74,NULL,'2022-10-31 17:20:24',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(75,NULL,'2022-10-31 17:20:24',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(76,NULL,'2022-10-31 17:20:24',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(77,NULL,'2022-10-31 17:20:24',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(78,NULL,'2022-10-31 17:20:24',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(79,NULL,'2022-10-31 17:20:24',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(80,NULL,'2022-10-31 17:20:24',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(81,NULL,'2022-10-31 17:20:24',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(82,NULL,'2022-10-31 17:20:24',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(83,NULL,'2022-10-31 17:20:24',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(84,NULL,'2022-10-31 17:20:24',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(85,NULL,'2022-10-31 17:20:24',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(86,NULL,'2022-10-31 17:20:24',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(87,NULL,'2022-10-31 17:20:24',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(88,NULL,'2022-10-31 17:20:24',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(89,NULL,'2022-10-31 17:20:24',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(90,NULL,'2022-10-31 17:20:24',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(91,NULL,'2022-10-31 17:20:24',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(92,NULL,'2022-10-31 17:20:24',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(93,NULL,'2022-10-31 17:20:24',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(94,NULL,'2022-10-31 17:20:24',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(95,NULL,'2022-10-31 17:20:24',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(96,NULL,'2022-10-31 17:20:24',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(97,NULL,'2022-10-31 17:20:24',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(98,NULL,'2022-10-31 17:20:24',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(99,NULL,'2022-10-31 17:20:24',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(100,NULL,'2022-10-31 17:20:24',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(101,NULL,'2022-10-31 17:20:24',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(102,NULL,'2022-10-31 17:20:24',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(103,NULL,'2022-10-31 17:20:24',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(104,NULL,'2022-10-31 17:20:24',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(105,NULL,'2022-10-31 17:20:24',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(106,NULL,'2022-10-31 17:20:24',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(107,NULL,'2022-10-31 17:20:24',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(108,NULL,'2022-10-31 17:20:24',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(109,NULL,'2022-10-31 17:20:24',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(110,NULL,'2022-10-31 17:20:24',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(111,NULL,'2022-10-31 17:20:24',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(112,NULL,'2022-10-31 17:20:24',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(113,NULL,'2022-10-31 17:20:24',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(114,NULL,'2022-10-31 17:20:24',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(115,NULL,'2022-10-31 17:20:24',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(116,NULL,'2022-10-31 17:20:24',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(117,NULL,'2022-10-31 17:20:24',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(118,NULL,'2022-10-31 17:20:24',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(119,NULL,'2022-10-31 17:20:24',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(120,NULL,'2022-10-31 17:20:24',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(121,NULL,'2022-10-31 17:20:24',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(122,NULL,'2022-10-31 17:20:24',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(123,NULL,'2022-10-31 17:20:24',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(124,NULL,'2022-10-31 17:20:24',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(125,NULL,'2022-10-31 17:20:24',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(126,NULL,'2022-10-31 17:20:24',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(127,NULL,'2022-10-31 17:20:24',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(128,NULL,'2022-10-31 17:20:24',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(129,NULL,'2022-10-31 17:20:24',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(130,NULL,'2022-10-31 17:20:24',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(131,NULL,'2022-10-31 17:20:24',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(132,NULL,'2022-10-31 17:20:24',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(133,NULL,'2022-10-31 17:20:24',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(134,NULL,'2022-10-31 17:20:24',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(135,NULL,'2022-10-31 17:20:24',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(136,NULL,'2022-10-31 17:20:24',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(137,NULL,'2022-10-31 17:20:24',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(138,NULL,'2022-10-31 17:20:24',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(139,NULL,'2022-10-31 17:20:24',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(140,NULL,'2022-10-31 17:20:24',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(141,NULL,'2022-10-31 17:20:24',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,''),(142,NULL,'2022-10-31 17:20:24',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"30/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":17}',0,0,''),(143,17,'2022-10-31 20:21:44',1,27,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":17}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(8,17),(9,17),(10,17),(11,17),(12,17),(13,17),(14,17),(15,17),(16,17),(17,17),(18,17),(19,17),(20,17),(21,17),(22,17),(23,17),(24,17),(25,17),(26,17),(27,17),(28,17),(29,17),(30,17),(31,17),(32,17),(33,17),(34,17),(35,17),(36,17),(37,17),(38,17),(39,17),(40,17),(41,17),(42,17),(43,17),(44,17),(45,17),(46,17),(47,17),(48,17),(49,17),(50,17),(51,17),(52,17),(53,17),(54,17),(55,17),(56,17),(57,17),(58,17),(59,17),(60,17),(61,17),(62,17),(63,17),(64,17),(65,17),(66,17),(67,17),(68,17),(69,17),(70,17),(71,17),(72,17),(73,17),(74,17),(75,17),(76,17),(77,17),(78,17),(79,17),(80,17),(81,17),(82,17),(83,17),(84,17),(85,17),(86,17),(87,17),(88,17),(89,17),(90,17),(91,17),(92,17),(93,17),(94,17),(95,17),(96,17),(97,17),(98,17),(99,17),(100,17),(101,17),(102,17),(103,17),(104,17),(105,17),(106,17),(107,17),(108,17),(109,17),(110,17),(111,17),(112,17),(113,17),(114,17),(115,17),(116,17),(117,17),(118,17),(119,17),(120,17),(121,17),(122,17),(123,17),(124,17),(125,17),(126,17),(127,17),(128,17),(129,17),(130,17),(131,17),(132,17),(133,17),(134,17),(135,17),(136,17),(137,17),(138,17),(139,17),(140,17),(141,17),(142,17),(143,17);
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
INSERT INTO `operacao_empresa` VALUES (1,17,1,1,0),(2,17,1,1,0),(3,17,1,1,0),(4,17,1,1,0),(5,17,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Finanças','Teste',NULL,'','58101194000100','','','',0,'','','','','0001-01-01',0,17,'0001-01-01 00:00:00'),(2,'F',0,'Leonardo Henrique Paim','','08945693688','14245460',NULL,'','','',9,'','','','','1988-03-23',0,0,'2022-10-31 20:21:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,28,2,'(37) 9999-9999',''),(2,1,29,4,'leohpaim@gmail.com','');
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
INSERT INTO `pessoa_empresa` VALUES (2,17,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,15,'Av. Brasil','1','Centro','','35591262','Lagoa da Prata','MG','3137205','',1);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,1,'');
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-10-31 17:20:24'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-10-31 17:20:24'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-10-31 17:20:24'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-10-31 17:20:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=1103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20220725.231548.845','2022-10-27 15:38:18','15d64e872f2da6af0f6c22a058a6b1ff'),(2,2,'20220927.231853.021-financas','2022-10-27 15:38:18','759ac8c004e9326f5951450d6b336517'),(3,2,'20220927.231856.052-financas','2022-10-27 15:38:18','0523848664605aae41d0775f857eca52'),(4,2,'20220927.231859.082-financas','2022-10-27 15:38:18','34ee8b45b131cfd59145dd0bab1a598a'),(5,2,'20220927.231902.116-financas','2022-10-27 15:38:18','05bbd5aaf5d8052c747f79e684e3a0fe'),(6,2,'20220927.231905.158-financas','2022-10-27 15:38:18','edfefac5ed95695a6fe119d8e7143ebf'),(7,2,'20220927.231908.190-financas','2022-10-27 15:38:18','941d689c93c9b1610d0532b6faec630c'),(8,2,'20220927.231911.215-financas','2022-10-27 15:38:18','c2cd97a8a6cf264edf7ae9bbb38a6b4d'),(9,2,'20220927.231914.237-financas','2022-10-27 15:38:18','9d1eee60b61cc720759d73b1ef3da1b8'),(10,2,'20220927.231917.275-financas','2022-10-27 15:38:18','586f64d6579dcd78c48156b9bc1aafab'),(11,2,'20220927.231920.311-financas','2022-10-27 15:38:18','ccb2d5e11445bbd1d862a2a5f844744f'),(12,2,'20220927.231923.342-financas','2022-10-27 15:38:18','4d09192f1b2e30fa3b2501d1325da07e'),(13,2,'20220927.231926.383-financas','2022-10-27 15:38:18','3c1e5aee5392e14a978198e81469d75d'),(14,2,'20220927.231929.422-financas','2022-10-27 15:38:19','33e572e7278c3de9386d2bd4e583ccd2'),(15,2,'20220927.231932.449-financas','2022-10-27 15:38:19','127619e3526c4ca549e73bc539d1e927'),(16,2,'20220927.231935.475-financas','2022-10-27 15:38:19','14470745af23fdf67a506fe487ce215b'),(17,2,'20220927.231938.503-financas','2022-10-27 15:38:19','4a18600b0bfcb757519492c8e469405c'),(18,2,'20220927.231941.539-financas','2022-10-27 15:38:19','bbd222d3466b45dfe8ff1895e343dd71'),(19,2,'20220927.231944.560-financas','2022-10-27 15:38:19','7accaa2b30a400928e0cec1c520a0945'),(20,2,'20220927.231947.591-financas','2022-10-27 15:38:19','b337d3af915c816fd5fe85069e48bf19'),(21,2,'20220927.231950.619-financas','2022-10-27 15:38:19','7b87f320461ad6eca0419cf6c715d1ef'),(22,2,'20220927.231953.643-financas','2022-10-27 15:38:19','d21dbfe5605aba04425251f62de45f09'),(23,2,'20220927.231956.678-financas','2022-10-27 15:38:19','af0b3dcc7641b26ef8f5c3fd485f27b4'),(24,2,'20220927.231959.720-financas','2022-10-27 15:38:19','ba9442a1b7aaf098c6056e6562da9587'),(25,2,'20220927.232002.752-financas','2022-10-27 15:38:19','a2edc7f2f9c2cc4ac9724880046acfc9'),(26,2,'20220927.232005.779-financas','2022-10-27 15:38:19','9bf3f8bc5dbe7ebc1755ae8efd2ad948'),(27,2,'20220927.232008.813-financas','2022-10-27 15:38:19','320ebae0e70c5fe858af22d319cabb5c'),(28,2,'20220927.232011.839-financas','2022-10-27 15:38:19','bee4ae162d7d6111e25c22a6c2a3b2d3'),(29,2,'20220927.232014.867-financas','2022-10-27 15:38:19','f584e31765e4274aef5c38078febf71e'),(30,2,'20220927.232017.894-financas','2022-10-27 15:38:19','e68377477f0328b4d3354f00d8d01109'),(31,2,'20220927.232020.927-financas','2022-10-27 15:38:19','9b0468c1fc9ac7b8fb90ae1fbc10b5b3'),(32,2,'20220927.232023.968-financas','2022-10-27 15:38:19','8fa979f8fe5f9840d027b810758b98a3'),(33,2,'20220927.232026.997-financas','2022-10-27 15:38:19','c6feb93da56cf78ebe964824054fcadc'),(34,2,'20220927.232030.018-financas','2022-10-27 15:38:19','5a34b3979fa5a15b02431ed7f316d48a'),(35,2,'20220927.232033.051-financas','2022-10-27 15:38:19','ae0970e5461394e09d2046025ab07a57'),(36,2,'20220927.232036.093-financas','2022-10-27 15:38:19','547274c5eae5a6d79028eed50ddfdccc'),(37,2,'20220927.232039.127-financas','2022-10-27 15:38:19','7192b36bb13045e23101cc9797956edb'),(38,2,'20220927.232042.162-financas','2022-10-27 15:38:19','f24a7b6f3322266e2df3b5360e509b5e'),(39,2,'20220927.232045.187-financas','2022-10-27 15:38:19','3232d35f0930c423c2623fc7dd889335'),(40,2,'20220927.232048.220-financas','2022-10-27 15:38:19','96428f4c373b9bca28c4a11758870e30'),(41,2,'20220927.232051.257-financas','2022-10-27 15:38:19','92f27099b4afee3a3074248122818901'),(42,2,'20220927.232054.286-financas','2022-10-27 15:38:19','ec7bc6649762a89081ebd057be5bfac7'),(43,2,'20220927.232057.328-financas','2022-10-27 15:38:19','a550992705e4f44c50695b5c53ebbac1'),(44,2,'20220927.232100.367-financas','2022-10-27 15:38:19','7203053923db8221171cd7ea5c773a86'),(45,2,'20220927.232103.395-financas','2022-10-27 15:38:19','db6ad4d7292f834a5efdfde76c566982'),(46,2,'20220927.232106.423-financas','2022-10-27 15:38:19','0895407571f27435f05e6e8ea5b0d296'),(47,2,'20220927.232109.456-financas','2022-10-27 15:38:19','e2dd0120624bc68b3d5bd39f027b019b'),(48,2,'20220927.232112.491-financas','2022-10-27 15:38:19','0b69ce8c22639bf52071152b63de520a'),(49,2,'20220927.232115.513-financas','2022-10-27 15:38:19','f4c2c11ac3d6332936b67633be383db2'),(50,2,'20220927.232118.547-financas','2022-10-27 15:38:19','8d6d2466c36f0c6aa3748e65a2bc50bd'),(51,2,'20220927.232121.575-financas','2022-10-27 15:38:19','c0463f2b154080372ef9993ec03b3393'),(52,2,'20220927.232124.607-financas','2022-10-27 15:38:19','368f131ba575cfaae175e3aa5e73bf75'),(53,2,'20220927.232127.635-financas','2022-10-27 15:38:19','91ab5e64e1e105f33a27745525f0c798'),(54,2,'20220927.232130.676-financas','2022-10-27 15:38:19','e4f47a8f932b21f1d39ceb8e3d0e29e6'),(55,2,'20220927.232133.705-financas','2022-10-27 15:38:19','0015bb022d34006d7d1531a48f795706'),(56,2,'20220927.232136.737-financas','2022-10-27 15:38:19','065d4629c52592b3631fb70a1a0b895a'),(57,2,'20220927.232139.771-financas','2022-10-27 15:38:19','b0410715cf77e616e8be2487d18b61b9'),(58,2,'20220927.232142.802-financas','2022-10-27 15:38:19','236f282e780e809a51faeb00d9551f95'),(59,2,'20220927.232145.829-financas','2022-10-27 15:38:19','b6b7721e556cfc88809f9072fd55fbbe'),(60,2,'20220927.232148.858-financas','2022-10-27 15:38:19','c6dc3db923a1c8b5acb3a14c1d0fa894'),(61,2,'20220927.232151.889-financas','2022-10-27 15:38:19','68977f7f2353bd258f27856343755fa4'),(62,2,'20220927.232154.913-financas','2022-10-27 15:38:19','c57ce6ff11519a7b30772e1633e619e8'),(63,2,'20220927.232157.949-financas','2022-10-27 15:38:19','57467bb250069de0462643cc64abc2c7'),(64,2,'20220927.232200.972-financas','2022-10-27 15:38:19','b02ba76c9c470c4b6b3ab6beb5a15a82'),(65,2,'20220927.232204.006-financas','2022-10-27 15:38:19','29de96007294dae458aa09b58e765f42'),(66,2,'20220927.232207.039-financas','2022-10-27 15:38:19','af261e1313a0c8851cf1d4fbbdc4ca0b'),(67,2,'20220927.232210.064-financas','2022-10-27 15:38:19','9ec22daabd0b778179bea2ec19fd3466'),(68,2,'20220927.232213.090-financas','2022-10-27 15:38:19','b999c594c8c864c50816cfdfcbebc5c2'),(69,2,'20220927.232216.129-financas','2022-10-27 15:38:19','cea59f0da6f59a627f0c80b3ff8571f0'),(70,2,'20220927.232219.167-financas','2022-10-27 15:38:19','473033f5bcb7ad4ca7cbceac60a434fd'),(71,2,'20220927.232222.193-financas','2022-10-27 15:38:19','ad9363c9cd2d7eda823524b3262457a3'),(72,2,'20220927.232225.219-financas','2022-10-27 15:38:19','f8b56e1c266e2fdf4fc1bc783cc376bd'),(73,2,'20220927.232228.256-financas','2022-10-27 15:38:19','1d8247fe78ba12dd052a49beaadcfc5b'),(74,2,'20220927.232231.283-financas','2022-10-27 15:38:19','b135a60286676b61bba7686734b0ebff'),(75,2,'20220927.232234.314-financas','2022-10-27 15:38:19','a8a01d8979ec0d1f8da64a8821e5b6c1'),(76,2,'20220927.232237.348-financas','2022-10-27 15:38:19','522e77b77ebfc661c91859ef943c6b7c'),(77,2,'20220927.232240.374-financas','2022-10-27 15:38:19','955775494d51d9ecbb66aad4b31a8f9a'),(78,2,'20220927.232243.406-financas','2022-10-27 15:38:19','31793f2d8776199f7a449e3911c5092e'),(79,2,'20220927.232246.448-financas','2022-10-27 15:38:19','e66881224f2219a154b62ea037f7cc55'),(80,2,'20220927.232249.485-financas','2022-10-27 15:38:19','8dd27a8972a7812a3775d983e7663f4d'),(81,2,'20220927.232252.522-financas','2022-10-27 15:38:19','f758ae67bcca8d7d62786610086f023d'),(82,2,'20220927.232255.558-financas','2022-10-27 15:38:19','fa426289ff8c744c8fe5261b1bb18f1b'),(83,2,'20220927.232258.583-financas','2022-10-27 15:38:19','74077f2aaffdc77bf85193b88de55cbf'),(84,2,'20220927.232301.622-financas','2022-10-27 15:38:19','68f9428534d70488406d768dda3a4db4'),(85,2,'20220927.232304.657-financas','2022-10-27 15:38:19','a9274e66be152ec60dccbc484254eaad'),(86,2,'20220927.232307.681-financas','2022-10-27 15:38:19','54822b0525b95ee94b618a5c3c00ba04'),(87,2,'20220927.232310.703-financas','2022-10-27 15:38:19','76a00a561cd10f2d8c261c1de45c1d70'),(88,2,'20220927.232313.739-financas','2022-10-27 15:38:19','11582343ff6aa5c5ff18a91fe4769f42'),(89,2,'20220927.232316.772-financas','2022-10-27 15:38:19','6ea9da2f7720890d78434bec064c1fec'),(90,2,'20220927.232319.805-financas','2022-10-27 15:38:19','8b43359fd698a19c4bf19246110d28c3'),(91,2,'20220927.232322.838-financas','2022-10-27 15:38:19','d242369c8ae847b9417b62336858d18e'),(92,2,'20220927.232325.873-financas','2022-10-27 15:38:19','4a9f25e97e383af19f80e980e378bfc5'),(93,2,'20220927.232328.902-financas','2022-10-27 15:38:19','8b5aac26bd0cbf1ca872ed6417dfc712'),(94,2,'20220927.232331.926-financas','2022-10-27 15:38:19','935e2065360271b3e477fa44f6c33998'),(95,2,'20220927.232334.967-financas','2022-10-27 15:38:19','49e0b9db237fcc6c94c28d947e10a8e5'),(96,2,'20220927.232338.003-financas','2022-10-27 15:38:19','d4e19fed515e990115bad7126c0e663f'),(97,2,'20220927.232341.029-financas','2022-10-27 15:38:19','2d53b82714ab9e28661c6fb9f09477db'),(98,2,'20220927.232344.066-financas','2022-10-27 15:38:19','687cd70a5b855626152af0133d7347bc'),(99,2,'20220927.232347.103-financas','2022-10-27 15:38:19','e62703c3a678e39ee55780060ce15caf'),(100,2,'20220927.232350.132-financas','2022-10-27 15:38:19','15ad50db957deb62ab0d3e877a756163'),(101,2,'20220927.232353.175-financas','2022-10-27 15:38:19','68e8cb44df0351d6634cfa0d97efe723'),(102,2,'20220927.232356.206-financas','2022-10-27 15:38:19','1079bfe5f2ea0a329ae10f6b671da09d'),(103,2,'20220927.232359.244-financas','2022-10-27 15:38:19','08d6e966c4b8c29b8f4ea03f6ed57047'),(104,2,'20220927.232402.269-financas','2022-10-27 15:38:19','70c1e302c705a0aa480bdaccd2325e7d'),(105,2,'20220927.232405.304-financas','2022-10-27 15:38:19','4e4c5a1e8c0d6ce9caa00602291e2597'),(106,2,'20220927.232408.343-financas','2022-10-27 15:38:19','18ff52baffc8acbf3a44988ba3fdcc23'),(107,2,'20220927.232411.376-financas','2022-10-27 15:38:19','47fedfa617d32dbedbcb242761f78288'),(108,2,'20220927.232414.410-financas','2022-10-27 15:38:19','050bc6826ce5010cc78f564a82b5056b'),(109,2,'20220927.232417.444-financas','2022-10-27 15:38:19','6766a0e74f65f0daf16c89fe430afc05'),(110,2,'20220927.232420.471-financas','2022-10-27 15:38:19','4d686dad57e4aed8590aff739ffefde5'),(111,2,'20220927.232423.505-financas','2022-10-27 15:38:19','49f5805c8d0b1281d15f3f17650f1b64'),(112,2,'20220927.232426.546-financas','2022-10-27 15:38:19','f29e1b07404f52795563681390b5f52a'),(113,2,'20220927.232429.583-financas','2022-10-27 15:38:19','7b8d4548c91d2f7edb2ed865f42fa7f5'),(114,2,'20220927.232432.614-financas','2022-10-27 15:38:19','8f9c2ad6f6ae17b17f9788b85062bd5b'),(115,2,'20220927.232435.654-financas','2022-10-27 15:38:19','1f21a8aacfa2b1ac5cc71edbb9a2ee5f'),(116,2,'20220927.232438.684-financas','2022-10-27 15:38:19','899508980e73469c6052b62a869f2239'),(117,2,'20220927.232441.715-financas','2022-10-27 15:38:19','627d1d25191ae6375bd86f4dd8d245e5'),(118,2,'20220927.232444.751-financas','2022-10-27 15:38:19','a4414211a4506990059c37a8ebc6e5a9'),(119,2,'20220927.232447.784-financas','2022-10-27 15:38:19','b84f71d1e0f901df57f49e6ba3c8a2ea'),(120,2,'20220927.232450.819-financas','2022-10-27 15:38:19','54de66ee43ad8c948733a513f4f0cfb8'),(121,2,'20220927.232453.859-financas','2022-10-27 15:38:19','5fb5db68355afb3714fc096e8e5e253a'),(122,2,'20220927.232456.892-financas','2022-10-27 15:38:19','ab2a0108a055fbf541f3bc7b498719ed'),(123,2,'20220927.232459.921-financas','2022-10-27 15:38:19','aafb471e07b4b760fe91125c74dfaf1c'),(124,2,'20220927.232502.953-financas','2022-10-27 15:38:19','6fa05362136477d3e7b93d22bc45b6d3'),(125,2,'20220927.232505.981-financas','2022-10-27 15:38:19','004a513b3c400657dcbb9117e22921a7'),(126,2,'20220927.232509.010-financas','2022-10-27 15:38:19','1e19a4f02249a7a106e8d4f2ed84405b'),(127,2,'20220927.232512.043-financas','2022-10-27 15:38:19','7ef4f314b4d02821ee1b430ec58c8510'),(128,2,'20220927.232515.073-financas','2022-10-27 15:38:19','9ce84b90f0a0141e917337e977a2d96d'),(129,2,'20220927.232518.111-financas','2022-10-27 15:38:19','f9eec6c968232296a2c3829b774d0b17'),(130,2,'20220927.232521.154-financas','2022-10-27 15:38:19','60d6cc87a5ed1d796d3201e5fb6af78f'),(131,2,'20220927.232524.192-financas','2022-10-27 15:38:19','5fa0e202e64f1acf7a709e9800f65e3b'),(132,2,'20220927.232527.226-financas','2022-10-27 15:38:19','e34164017e7b25a4ce659640adcdcfbf'),(133,2,'20220927.232530.257-financas','2022-10-27 15:38:19','caed0fe19a04af2d35ec37ac8e0c0298'),(134,2,'20220927.232533.279-financas','2022-10-27 15:38:19','74e162004e64a9597d5fde19d61af327'),(135,2,'20220927.232536.304-financas','2022-10-27 15:38:19','bd84a8ba98684602076f31be659fc6f0'),(136,2,'20220927.232539.334-financas','2022-10-27 15:38:19','9087c88635785c5c9fb4c600b0851e04'),(137,2,'20220927.232542.376-financas','2022-10-27 15:38:19','8b7dea79e9f2084b72337a207f1a2c87'),(138,2,'20220927.232545.411-financas','2022-10-27 15:38:19','94405c67a1f2efeb081461d330ef8fb8'),(139,2,'20220927.232548.441-financas','2022-10-27 15:38:19','688213660162801dce54095907038392'),(140,2,'20220927.232551.469-financas','2022-10-27 15:38:19','13a4ecbcce9dd3a454880ebe10d4a0c2'),(141,2,'20220927.232554.498-financas','2022-10-27 15:38:19','37f96c98636de287f484677d11dc02cf'),(142,2,'20220927.232557.529-financas','2022-10-27 15:38:19','3e10271a922aa653ce892cd04bf52dec'),(143,2,'20220927.232600.560-financas','2022-10-27 15:38:19','4fa9cc0cfe424c7c8b81c2f801cb6591'),(144,2,'20220927.232603.602-financas','2022-10-27 15:38:19','78e9c77b6cb7b824ba2182533b898912'),(145,2,'20220927.232606.641-financas','2022-10-27 15:38:19','6837ff9bf8c233a6a6b5fe25ccc853c7'),(146,2,'20220927.232609.672-financas','2022-10-27 15:38:19','2c5cfc8a4817243aee7effab9332c912'),(147,2,'20220927.232612.696-financas','2022-10-27 15:38:19','5054ad9d1d19c2ddda42544a70ddea76'),(148,2,'20220927.232615.725-financas','2022-10-27 15:38:19','b4a3c5062c13ff856db9893847ceaacf'),(149,2,'20220927.232618.759-financas','2022-10-27 15:38:19','b8139477c4b3710b4231d4a055c825cb'),(150,2,'20220927.232621.791-financas','2022-10-27 15:38:19','beee3099c24938c01364c4da71e6b56a'),(151,2,'20220927.232624.818-financas','2022-10-27 15:38:19','6a50d447ea8cff28ad343a331eb0541d'),(152,2,'20220927.232627.854-financas','2022-10-27 15:38:19','6a0c37b03fb5ccaa2c5a6d9b01783e16'),(153,2,'20220927.232630.891-financas','2022-10-27 15:38:19','557277161f96e5db4c79d9fe79528177'),(154,2,'20220927.232633.913-financas','2022-10-27 15:38:19','0b68aa87ebc8ba935a6fea21c2994803'),(155,2,'20220927.232636.944-financas','2022-10-27 15:38:19','805dd7b51465b36d58fcfcd7bba31fbb'),(156,2,'20220927.232639.974-financas','2022-10-27 15:38:19','415008fc4c40141b9cd7def62425c4a3'),(157,2,'20220927.232643.008-financas','2022-10-27 15:38:19','1d9fec5df5340d575e7880bb0d90eaa1'),(158,2,'20220927.232646.039-financas','2022-10-27 15:38:19','027847ecfc21a0f0533ab1cfe71eae9c'),(159,2,'20220927.232649.072-financas','2022-10-27 15:38:19','6ec0f0849072c37418944b3ac9a4ceb4'),(160,2,'20220927.232652.103-financas','2022-10-27 15:38:19','5994133f80908d93beb87f3b578d1426'),(161,2,'20220927.232655.134-financas','2022-10-27 15:38:19','7809f4800a10d5d1bdfc5e6d48d0465f'),(162,2,'20220927.232658.169-financas','2022-10-27 15:38:19','a7d58b9dabbb935ca3faa111be4baf27'),(163,2,'20220927.232701.204-financas','2022-10-27 15:38:19','aa94f5659d6a685b4146cebd3060d88f'),(164,2,'20220927.232704.237-financas','2022-10-27 15:38:19','070182b58c640c12d16f536a6b524d1a'),(165,2,'20220927.232707.265-financas','2022-10-27 15:38:19','4248e7955d8f28c587ecb4bc4d82a56b'),(166,2,'20220927.232710.291-financas','2022-10-27 15:38:19','36f650fce26de6730e2c9b6825a754f0'),(167,2,'20220927.232713.319-financas','2022-10-27 15:38:19','87f353f165a9e79bdd9c6df0a2c00ca7'),(168,2,'20220927.232716.345-financas','2022-10-27 15:38:19','3e4cc4b9066929d66c3ddc79896b359e'),(169,2,'20220927.232719.376-financas','2022-10-27 15:38:19','a9ad0766772acf284a737450762ebf65'),(170,2,'20220927.232722.413-financas','2022-10-27 15:38:19','223e7e9b3ecf6742ea60ac09a6213d94'),(171,2,'20220927.232725.451-financas','2022-10-27 15:38:19','9973f35ad6af3bb0c55391a4b0df71f9'),(172,2,'20220927.232728.475-financas','2022-10-27 15:38:19','e341f23b851fe1ad78f594c59489e30c'),(173,2,'20220927.232731.509-financas','2022-10-27 15:38:19','2c23a580429799a68eda2858ed99da4f'),(174,2,'20220927.232734.538-financas','2022-10-27 15:38:19','44d67b4e1eb27853fbe2235bb9f63335'),(175,2,'20220927.232737.569-financas','2022-10-27 15:38:19','9d89436861e00a547c1f58a429ec0884'),(176,2,'20220927.232740.596-financas','2022-10-27 15:38:19','a9c2de782f7dc23d17514095cae054ad'),(177,2,'20220927.232743.629-financas','2022-10-27 15:38:19','d363f0f2c500da9bf0465468c3bbad9d'),(178,2,'20220927.232746.669-financas','2022-10-27 15:38:19','668cf2eb10cd52bb574daad1f76c40be'),(179,2,'20220927.232749.707-financas','2022-10-27 15:38:19','d4c85f2c6a5c35a4535f9fe54d197d10'),(180,2,'20220927.232752.736-financas','2022-10-27 15:38:19','d58b7d8be32c54c6357d8d00ed3d230a'),(181,2,'20220927.232755.766-financas','2022-10-27 15:38:19','780fad228cf007b245f77a285f891708'),(182,2,'20220927.232758.799-financas','2022-10-27 15:38:19','eb2886de8daa53ca8674766c8f833c75'),(183,2,'20220927.232801.839-financas','2022-10-27 15:38:19','0932ee764f0efbbc5e67cc702ae8b029'),(184,2,'20220927.232804.868-financas','2022-10-27 15:38:19','00ae855be8f29d490f63a5e57d934a51'),(185,2,'20220927.232807.904-financas','2022-10-27 15:38:19','c4f9571b09a7ec4a3a0df37738b16a60'),(186,2,'20220927.232810.940-financas','2022-10-27 15:38:19','0ba59984946456d52ea54adaacc7fa65'),(187,2,'20220927.232813.974-financas','2022-10-27 15:38:19','37ffb0e813fe7c9123d52ded9f9c6114'),(188,2,'20220927.232817.010-financas','2022-10-27 15:38:19','6186b2bf20904b0db338be5869535446'),(189,2,'20220927.232820.040-financas','2022-10-27 15:38:19','60c8ee378e3fe21d175b07ef1bfd12ab'),(190,2,'20220927.232823.062-financas','2022-10-27 15:38:19','35e764c8d9fe9abd2352851a877eeb00'),(191,2,'20220927.232826.092-financas','2022-10-27 15:38:19','fae816e9db46641fcf4731a1d7b578c2'),(192,2,'20220927.232829.122-financas','2022-10-27 15:38:19','81ee4718f01978628d54f966e907fc38'),(193,2,'20220927.232832.143-financas','2022-10-27 15:38:19','d06f726409695c46602c55bcf4e1d396'),(194,2,'20220927.232835.174-financas','2022-10-27 15:38:19','89c7bcd7f25a8b6c489ffc7b315a8e9b'),(195,2,'20220927.232838.193-financas','2022-10-27 15:38:19','c68f1f320fe46fda66aa0cb4e24121f7'),(196,2,'20220927.232841.224-financas','2022-10-27 15:38:19','ba0db49995d6674cdb2b6731f58be791'),(197,2,'20220927.232844.252-financas','2022-10-27 15:38:19','66e150b5ed23d9fb44b7cbba6508b1ac'),(198,2,'20220927.232847.290-financas','2022-10-27 15:38:19','21851a94184430a3607710a470f0df65'),(199,2,'20220927.232850.325-financas','2022-10-27 15:38:19','e1aa97941a771c00a792f24987133fe5'),(200,2,'20220927.232853.357-financas','2022-10-27 15:38:19','14a9b853d55e7700cdc1c88151af5420'),(201,2,'20220927.232856.391-financas','2022-10-27 15:38:19','a25c395f59f713c4dadf5006b0b4f4ba'),(202,2,'20220927.232859.421-financas','2022-10-27 15:38:19','34919aab8b98ffe07e5a36fbff0014fb'),(203,2,'20220927.232902.454-financas','2022-10-27 15:38:19','7fe91003ddf659c04af68716462b8dc4'),(204,2,'20220927.232905.477-financas','2022-10-27 15:38:19','7a2d42321012f3688a45190826855279'),(205,2,'20220927.232908.500-financas','2022-10-27 15:38:19','cd1962e6c868abcd6c14578e1b914377'),(206,2,'20220927.232911.522-financas','2022-10-27 15:38:19','47b0f23b15f0293edc27d43bdf210c2e'),(207,2,'20220927.232914.565-financas','2022-10-27 15:38:19','666b0b74dc709d91a5e0612b2138b467'),(208,2,'20220927.232917.598-financas','2022-10-27 15:38:19','3b1522c10672b59672bfdff311f9db2c'),(209,2,'20220927.232920.621-financas','2022-10-27 15:38:19','868580944db97ed323e075c0580562bb'),(210,2,'20220927.232923.657-financas','2022-10-27 15:38:19','18b23c4d4c20b35829f7f83220d54804'),(211,2,'20220927.232926.695-financas','2022-10-27 15:38:19','5366e7c386867e80e5a2a9b8b5e64ca4'),(212,2,'20220927.232929.719-financas','2022-10-27 15:38:19','9ce2381ccdb4b4b9ef64510858f3bad7'),(213,2,'20220927.232932.746-financas','2022-10-27 15:38:19','51a6215c5f6bfbf3b6f1b2fd31124f13'),(214,2,'20220927.232935.782-financas','2022-10-27 15:38:19','26848f7e10d3334e8812f870921b73f4'),(215,2,'20220927.232938.815-financas','2022-10-27 15:38:19','45f7235017f99f75f225801fb5a7d604'),(216,2,'20220927.232941.849-financas','2022-10-27 15:38:19','ba506b444378ab04ccf9befd7c84531d'),(217,2,'20220927.232944.888-financas','2022-10-27 15:38:19','3982bbf24a00dccf4cdbd09844a15f0a'),(218,2,'20220927.232947.917-financas','2022-10-27 15:38:19','50cc84a92f577b76d2527b99c2ee5500'),(219,2,'20220927.232950.951-financas','2022-10-27 15:38:19','ad3b4b857267eca22ffbe70e85c8a7f5'),(220,2,'20220927.232953.974-financas','2022-10-27 15:38:19','9cff24ad782e9fd7c170571ccacfc9be'),(221,2,'20220927.232957.014-financas','2022-10-27 15:38:19','51b7d49c368b74f2942577d8450ec8bf'),(222,2,'20220927.233000.051-financas','2022-10-27 15:38:19','f4be407fe788d58eab2921ea37aba436'),(223,2,'20220927.233003.079-financas','2022-10-27 15:38:19','d8dd2d4296fbf6f2c7b3b7375bf9c5e5'),(224,2,'20220927.233006.103-financas','2022-10-27 15:38:19','ad2b605feda00af05e56b0d5d298a175'),(225,2,'20220927.233009.138-financas','2022-10-27 15:38:19','4a235e4361fcaf8bedff214c6cc9172c'),(226,2,'20220927.233012.173-financas','2022-10-27 15:38:19','6b73dc6ece0bdf8ecad97694c2f0303a'),(227,2,'20220927.233015.214-financas','2022-10-27 15:38:19','1978c63ec85d41a6ca92981a96d58f12'),(228,2,'20220927.233018.251-financas','2022-10-27 15:38:19','fe2d50bc0b99c754c816d03e314bbde1'),(229,2,'20220927.233021.285-financas','2022-10-27 15:38:19','e72c6e3e7f44c66918401cfc284a8a52'),(230,2,'20220927.233024.319-financas','2022-10-27 15:38:19','ecf4df069c326228f4ae08e81903a0e8'),(231,2,'20220927.233027.356-financas','2022-10-27 15:38:19','d0ddc540c6d3a27228ce8095b7c7d4fd'),(232,2,'20220927.233030.384-financas','2022-10-27 15:38:19','65698a23f0bc5cea3511f0f9b259d7fa'),(233,2,'20220927.233033.418-financas','2022-10-27 15:38:19','af17bf742b97239b1134727934de62de'),(234,2,'20220927.233036.448-financas','2022-10-27 15:38:19','7a71903c4ac7955fa711a136fdedef07'),(235,2,'20220927.233039.475-financas','2022-10-27 15:38:19','750e1460c3f00bf78354462a48444939'),(236,2,'20220927.233042.508-financas','2022-10-27 15:38:19','f41c5d76290cca895917fd06ff1e0403'),(237,2,'20220927.233045.537-financas','2022-10-27 15:38:19','bec300856f0dba494db202281279a03c'),(238,2,'20220927.233048.574-financas','2022-10-27 15:38:19','f98f358f66277a06e93bcc752256b05b'),(239,2,'20220927.233051.607-financas','2022-10-27 15:38:19','c50c7d6d829dfb1b5f8dc16787d52471'),(240,2,'20220927.233054.633-financas','2022-10-27 15:38:19','fc4eb003ec60467b5faf8e700bca1dc8'),(241,2,'20220927.233057.670-financas','2022-10-27 15:38:19','8ced552588b10812087b86fdea84e1f7'),(242,2,'20220927.233100.705-financas','2022-10-27 15:38:19','dc2e7e13858b6b23618e527add0b065c'),(243,2,'20220927.233103.739-financas','2022-10-27 15:38:19','6d92245cf75ba823394a8c0b547004a8'),(244,2,'20220927.233106.773-financas','2022-10-27 15:38:19','f677c30d8af3fb1611868542cef527a4'),(245,2,'20220927.233109.798-financas','2022-10-27 15:38:19','4f047da7d3279094c79fe35e3860157e'),(246,2,'20220927.233112.826-financas','2022-10-27 15:38:19','9905f82c343d36565220fb2fe2962777'),(247,2,'20220927.233115.869-financas','2022-10-27 15:38:19','9bd123aee61d4543851feeec282a921d'),(248,2,'20220927.233118.907-financas','2022-10-27 15:38:19','d7e05612ae10869e9794e4fbbc06a743'),(249,2,'20220927.233121.950-financas','2022-10-27 15:38:19','80c006879f41918fec350f24578a9792'),(250,2,'20220927.233124.971-financas','2022-10-27 15:38:19','a5683d9b9e28634111f04d41199232e8'),(251,2,'20220927.233127.996-financas','2022-10-27 15:38:19','d64e3ece15e193759089ecf0321a825b'),(252,2,'20220927.233131.020-financas','2022-10-27 15:38:19','82a0ef882bfd48fa528f055a14f2c2e8'),(253,2,'20220927.233134.048-financas','2022-10-27 15:38:19','b5643989c282460dac80cfc57a0bc89b'),(254,2,'20220927.233137.082-financas','2022-10-27 15:38:19','76eaede609683267e36de9c444a6dc19'),(255,2,'20220927.233140.114-financas','2022-10-27 15:38:19','3369c630ac54bb0b022bef5942614304'),(256,2,'20220927.233143.138-financas','2022-10-27 15:38:19','91e4216de8e5626fc3594a432d1a9780'),(257,2,'20220927.233146.165-financas','2022-10-27 15:38:19','837033d439efce92e2f8fbc73061ddec'),(258,2,'20220927.233149.197-financas','2022-10-27 15:38:19','21f91182173523da8e2dd74fe3d97bc3'),(259,2,'20220927.233152.220-financas','2022-10-27 15:38:19','8f875dbce57de54041f36ef7c1d64652'),(260,2,'20220927.233155.254-financas','2022-10-27 15:38:19','6d9d115f3c676cf3812d58e24c22cc94'),(261,2,'20220927.233158.293-financas','2022-10-27 15:38:19','4b5ddaa9c94ce02f4bde3dcb152d0c5d'),(262,2,'20220927.233201.333-financas','2022-10-27 15:38:19','201b2313f9ab62bcc779e39c563059ee'),(263,2,'20220927.233204.354-financas','2022-10-27 15:38:19','9c28cc1e6cce310c59161d64266dc3de'),(264,2,'20220927.233207.389-financas','2022-10-27 15:38:19','2a2cecae8f6b24cb10242ebe4129fac9'),(265,2,'20220927.233210.421-financas','2022-10-27 15:38:19','6524488242ecde09825f05a50315c1cb'),(266,2,'20220927.233213.451-financas','2022-10-27 15:38:19','982aaa95381af07f5bc88885a260a025'),(267,2,'20220927.233216.484-financas','2022-10-27 15:38:19','91d64064ba2444c7fd28fbdf6d6f179f'),(268,2,'20220927.233219.516-financas','2022-10-27 15:38:19','e6c5bbe9edb4c9d97338d7ca1d47a20f'),(269,2,'20220927.233222.552-financas','2022-10-27 15:38:19','2af3435a1dbf7179e4b092e047cf1c3a'),(270,2,'20220927.233225.592-financas','2022-10-27 15:38:19','eb67232d503063f81cfb459d8913dae1'),(271,2,'20220927.233228.620-financas','2022-10-27 15:38:19','eaaaad5cf02d2a9af5fc14e1bf4a1d14'),(272,2,'20220927.233231.649-financas','2022-10-27 15:38:19','fe62c87b195882a7410b8ee3a15e2c1c'),(273,2,'20220927.233234.669-financas','2022-10-27 15:38:19','de087d6129cd482420841632cbbf6660'),(274,2,'20220927.233237.700-financas','2022-10-27 15:38:19','002da4f25faf67832420dd1bab57e3cc'),(275,2,'20220927.233240.741-financas','2022-10-27 15:38:19','84144261282541ec217b4b55dd8d3cac'),(276,2,'20220927.233243.772-financas','2022-10-27 15:38:19','50ff9da876e84afac90c5836ece52db2'),(277,2,'20220927.233246.800-financas','2022-10-27 15:38:19','856c10822a5d3981198221f7f46b5ab7'),(278,2,'20220927.233249.833-financas','2022-10-27 15:38:19','21e52e6315198f1ac724b29e782ef0d4'),(279,2,'20220927.233252.865-financas','2022-10-27 15:38:19','6a5bbf4ed5f20decd18e63cb2b3ef258'),(280,2,'20220927.233255.902-financas','2022-10-27 15:38:19','922b9d215593184bd393e2f9bfec40b6'),(281,2,'20220927.233258.928-financas','2022-10-27 15:38:19','59173360eefd02cd277085d83e1768fc'),(282,2,'20220927.233301.965-financas','2022-10-27 15:38:19','f214b02ca4415f5e25d2cdc9b8286360'),(283,2,'20220927.233304.995-financas','2022-10-27 15:38:19','25ae3bfdceff96663fc0936458ad270d'),(284,2,'20220927.233308.032-financas','2022-10-27 15:38:19','550af8a962118e6614d84c4d4a1b0ed8'),(285,2,'20220927.233311.065-financas','2022-10-27 15:38:19','21a3caf982d7c92b40e4ebe35909b460'),(286,2,'20220927.233314.087-financas','2022-10-27 15:38:19','fd6b4ecf034e0738e74b5f16d438acaf'),(287,2,'20220927.233317.123-financas','2022-10-27 15:38:19','340f0979359b9366aab447cd397514ed'),(288,2,'20220927.233320.152-financas','2022-10-27 15:38:19','7d55117d7d726197fc63860303124098'),(289,2,'20220927.233323.176-financas','2022-10-27 15:38:19','a717a759088918f40ef8e2ce6b8fbbf9'),(290,2,'20220927.233326.216-financas','2022-10-27 15:38:19','c2d83571701f4c7742a6d0321ad6afec'),(291,2,'20220927.233329.250-financas','2022-10-27 15:38:19','d1d5e02d6ca991f0ffcff3ad7376845b'),(292,2,'20220927.233332.286-financas','2022-10-27 15:38:19','e7d2a9fac2d7823b99087ebccaef1647'),(293,2,'20220927.233335.309-financas','2022-10-27 15:38:19','b6d68860906ad2174460ac3d233c8159'),(294,2,'20220927.233338.333-financas','2022-10-27 15:38:19','163977c0d689d75ee45b1c965b314fbe'),(295,2,'20220927.233341.370-financas','2022-10-27 15:38:19','ea5d5b3dea856d588281d7a467c6c2eb'),(296,2,'20220927.233344.403-financas','2022-10-27 15:38:19','0e746bcc154e3aa56bb45f419e1a7d46'),(297,2,'20220927.233347.437-financas','2022-10-27 15:38:19','e63e9c8f33b888221e7499e9e5f855e7'),(298,2,'20220927.233350.473-financas','2022-10-27 15:38:19','0625ac4108c7f25443decfe93ef08f76'),(299,2,'20220927.233353.505-financas','2022-10-27 15:38:19','8525ca41443a963182b098357413a1f9'),(300,2,'20220927.233356.539-financas','2022-10-27 15:38:19','db1a699d965859043346dcbae639ffe3'),(301,2,'20220927.233359.570-financas','2022-10-27 15:38:19','6e2699f3f9be0403145eeba109790c11'),(302,2,'20220927.233402.594-financas','2022-10-27 15:38:19','752b419d22034918518e657b33bbd79d'),(303,2,'20220927.233405.621-financas','2022-10-27 15:38:19','2c0d3577cefe1c494fb9ab8b787116f7'),(304,2,'20220927.233408.650-financas','2022-10-27 15:38:19','b0aad81289f7f2abe8030e37fbf5af93'),(305,2,'20220927.233411.675-financas','2022-10-27 15:38:19','7486a0fc4ea549647befe79dae055ba9'),(306,2,'20220927.233414.710-financas','2022-10-27 15:38:19','3b0f33355dc7528c13568c93bfeb2a2b'),(307,2,'20220927.233417.737-financas','2022-10-27 15:38:19','9e7ae43c5342022b7519ca9768cdd01a'),(308,2,'20220927.233420.764-financas','2022-10-27 15:38:19','89b8b09f9628b03d9819c2483b80b6fe'),(309,2,'20220927.233423.788-financas','2022-10-27 15:38:19','40cfe05106d0bb6e3343eb49fbe78130'),(310,2,'20220927.233426.817-financas','2022-10-27 15:38:19','f7c87343a00a0ad1adc873dfa3bc5617'),(311,2,'20220927.233429.843-financas','2022-10-27 15:38:19','6f99d77cee596100e7697210028e68d7'),(312,2,'20220927.233432.871-financas','2022-10-27 15:38:19','f1a6f68a9faacb04bc5ed0b68053f355'),(313,2,'20220927.233435.901-financas','2022-10-27 15:38:19','608368fea4d5b3f611bfe5039ac58899'),(314,2,'20220927.233438.928-financas','2022-10-27 15:38:19','a9c9a168b4db1541cd7b697e20409c51'),(315,2,'20220927.233441.956-financas','2022-10-27 15:38:19','55e85de063696330d6a20d6fc985a8e6'),(316,2,'20220927.233444.994-financas','2022-10-27 15:38:19','ad3e5e169cd16bae0998ec8c48e6ff52'),(317,2,'20220927.233448.030-financas','2022-10-27 15:38:19','428150978f59b2d7305a3653ebb02e3a'),(318,2,'20220927.233451.058-financas','2022-10-27 15:38:19','a40309a1a1d4f0b731d335e5307f9d89'),(319,2,'20220927.233454.093-financas','2022-10-27 15:38:19','39b394d572d1c59829b4b71b237b6b35'),(320,2,'20220927.233457.121-financas','2022-10-27 15:38:19','2343931dac881e3c379f5dc2579be0c6'),(321,2,'20220927.233500.160-financas','2022-10-27 15:38:19','ffb93da22671d1bab6054e7809768e75'),(322,2,'20220927.233503.188-financas','2022-10-27 15:38:19','0f36114ff52e1b6ef2e6d86f580f7578'),(323,2,'20220927.233506.220-financas','2022-10-27 15:38:19','2f4a33fceda43e9233fcbf36e3b08d20'),(324,2,'20220927.233509.252-financas','2022-10-27 15:38:19','55c400451ba671b384dca9cd17b9cb83'),(325,2,'20220927.233512.279-financas','2022-10-27 15:38:19','aca97d165c95c425b4348425d06da94e'),(326,2,'20220927.233515.317-financas','2022-10-27 15:38:19','50c191ea507f7b7416c483691711d3f2'),(327,2,'20220927.233518.346-financas','2022-10-27 15:38:19','f2a1c7945242ff819dcab4615dc31701'),(328,2,'20220927.233521.383-financas','2022-10-27 15:38:19','d65214690af95cdda2b1eba5ab3c084a'),(329,2,'20220927.233524.416-financas','2022-10-27 15:38:19','462a46d0ed20d830482f81137e44b495'),(330,2,'20220927.233527.451-financas','2022-10-27 15:38:19','ecab31e71e6aa31a36668ee5519af055'),(331,2,'20220927.233530.482-financas','2022-10-27 15:38:19','64f3bb092c85731b28fcd1428a3b608f'),(332,2,'20220927.233533.508-financas','2022-10-27 15:38:19','b720a78b65e951500c924bb651b9c852'),(333,2,'20220927.233536.538-financas','2022-10-27 15:38:19','ffe8b6b5319a34467baa75de69a461dc'),(334,2,'20220927.233539.570-financas','2022-10-27 15:38:19','57c74ced13dfb8299c8e6fc6457563b4'),(335,2,'20220927.233542.602-financas','2022-10-27 15:38:19','96e8c08d25b4e31b939efda96ec24fcc'),(336,2,'20220927.233545.635-financas','2022-10-27 15:38:19','76bbaab8de82885312ed3dcb2a58764d'),(337,2,'20220927.233548.663-financas','2022-10-27 15:38:19','2c28efa0334dffbd5927a9d9f983cdba'),(338,2,'20220927.233551.702-financas','2022-10-27 15:38:19','9fdd9607c3aa8780684060babb41a4e6'),(339,2,'20220927.233554.731-financas','2022-10-27 15:38:19','2be9e3fa10f6f600ebd862fe68f9b9f6'),(340,2,'20220927.233557.763-financas','2022-10-27 15:38:19','7a206f651d8a4fd754510699d67e2ad2'),(341,2,'20220927.233600.787-financas','2022-10-27 15:38:19','caade775f0a5898030abd92d522e2533'),(342,2,'20220927.233603.828-financas','2022-10-27 15:38:19','93597c4874f25dc19a0990ac55a17d7e'),(343,2,'20220927.233606.856-financas','2022-10-27 15:38:19','a3855fbfdbc5d932155930e1ed2559d9'),(344,2,'20220927.233609.882-financas','2022-10-27 15:38:19','f179486429ef03f47326d40d585997f6'),(345,2,'20220927.233612.916-financas','2022-10-27 15:38:19','cc2f26296a37a41fe1883c0992b2242b'),(346,2,'20220927.233615.956-financas','2022-10-27 15:38:19','6c2f55e9f063c37fa72b2ec989610d48'),(347,2,'20220927.233618.986-financas','2022-10-27 15:38:19','87d137d04e958001a99ae2741ab2e84f'),(348,2,'20220927.233622.014-financas','2022-10-27 15:38:19','b0780bc35eb14810dd1105ab83e4d118'),(349,2,'20220927.233625.042-financas','2022-10-27 15:38:19','a9ac25c20d9d04e600f3e415a74b6f9e'),(350,2,'20220927.233628.079-financas','2022-10-27 15:38:19','b435e14a53a9da313019d506b96732dc'),(351,2,'20220927.233631.113-financas','2022-10-27 15:38:19','f382a79412cec20a5f8ca5b1e404682b'),(352,2,'20220927.233634.148-financas','2022-10-27 15:38:19','4c2ba6ca0757a560ada9a243387f34a4'),(353,2,'20220927.233637.174-financas','2022-10-27 15:38:19','2f8173f726186fbc1a118d2139665f67'),(354,2,'20220927.233640.203-financas','2022-10-27 15:38:19','e647d3cde40aac846e3ec4c7dd8b6f85'),(355,2,'20220927.233643.239-financas','2022-10-27 15:38:19','404ecb561a3cfed8f2b635f466e4dd98'),(356,2,'20220927.233646.274-financas','2022-10-27 15:38:19','20d850ea5b80166661dc16952b99a315'),(357,2,'20220927.233649.314-financas','2022-10-27 15:38:19','871c9b2ef100b96ac2f8394bc57c2812'),(358,2,'20220927.233652.341-financas','2022-10-27 15:38:19','4da4cb03d8bfe37df795a2bdd2fe77e2'),(359,2,'20220927.233655.369-financas','2022-10-27 15:38:19','b1b3a3fd63410de5c7871367b15bc493'),(360,2,'20220927.233658.406-financas','2022-10-27 15:38:19','b83ad0357558a8e7b08809c2e6ddd1db'),(361,2,'20220927.233701.434-financas','2022-10-27 15:38:19','3b12b9a064708c40013395ac6d101524'),(362,2,'20220927.233704.470-financas','2022-10-27 15:38:19','e82356ff3dd9bd876d6dada79c2b6fed'),(363,2,'20220927.233707.503-financas','2022-10-27 15:38:19','811c5bd0cd3580564cb0b26a4a730625'),(364,2,'20220927.233710.545-financas','2022-10-27 15:38:19','66496a3e35c44512a1a0f60aa67b3c65'),(365,2,'20220927.233713.585-financas','2022-10-27 15:38:19','b39148df17adf44bd6267709a663dc62'),(366,2,'20220927.233716.615-financas','2022-10-27 15:38:19','a57a4a73464b8291d3487c021046b49e'),(367,2,'20220927.233719.646-financas','2022-10-27 15:38:19','374d30b9ca318232891b20ccb2fec74d'),(368,2,'20220927.233722.675-financas','2022-10-27 15:38:19','ec87bb9ca4bf4e67e5019df4eccdd1d6'),(369,2,'20220927.233725.702-financas','2022-10-27 15:38:19','72202655a66ed7e3e0f7e53a68bbff98'),(370,2,'20220927.233728.733-financas','2022-10-27 15:38:19','fb7b14b4bf53031aaa705e6d01a25ae7'),(371,2,'20220927.233731.770-financas','2022-10-27 15:38:19','cc0416e41d8c3287709d732d3af39ac5'),(372,2,'20220927.233734.803-financas','2022-10-27 15:38:19','b734eb885d453a4da226a634d94f7d10'),(373,2,'20220927.233737.839-financas','2022-10-27 15:38:19','7014ce857254a8b7a61a77df7819267a'),(374,2,'20220927.233740.871-financas','2022-10-27 15:38:19','0f00aea48bbfa001db5e296f2ce06112'),(375,2,'20220927.233743.907-financas','2022-10-27 15:38:19','c4c4c27b7fc6083b4d227813a268db84'),(376,2,'20220927.233746.934-financas','2022-10-27 15:38:19','15aafb923681d47ab89f4f8379b60dba'),(377,2,'20220927.233749.963-financas','2022-10-27 15:38:19','ed128e88b6359950eb212db690cdc83b'),(378,2,'20220927.233753.003-financas','2022-10-27 15:38:19','b99b44265c69974d0eb9f20cd13ae7db'),(379,2,'20220927.233756.033-financas','2022-10-27 15:38:19','34fcf203cac49f0df8219b71e6a58e0b'),(380,2,'20220927.233759.067-financas','2022-10-27 15:38:19','6ec8571169db60b7ffd0caec0da8c5ab'),(381,2,'20220927.233802.099-financas','2022-10-27 15:38:19','03e68771133184bc43b0b80fdb6ecce9'),(382,2,'20220927.233805.139-financas','2022-10-27 15:38:19','741fe8afd55f31de6ebb66c2c620d675'),(383,2,'20220927.233808.164-financas','2022-10-27 15:38:19','f7c787d6955abb2072cb4acb201da352'),(384,2,'20220927.233811.192-financas','2022-10-27 15:38:19','ef9a181ea1d825fb5b2e1959159eadc4'),(385,2,'20220927.233814.222-financas','2022-10-27 15:38:19','d5943663ce52f9cc6a4989779f208e0e'),(386,2,'20220927.233817.252-financas','2022-10-27 15:38:19','050fc55af03b2904cdacfc06d1f89732'),(387,2,'20220927.233820.280-financas','2022-10-27 15:38:19','99211e55d0d0a35198309b48458209d3'),(388,2,'20220927.233823.308-financas','2022-10-27 15:38:19','c094e1f477c403472a0a22ed99b9d4bd'),(389,2,'20220927.233826.348-financas','2022-10-27 15:38:19','b94108a2b60f8dac9360b31099fc04b7'),(390,2,'20220927.233829.388-financas','2022-10-27 15:38:19','739d4df75eaa72f3f7f2659ddf506b46'),(391,2,'20220927.233832.426-financas','2022-10-27 15:38:19','4851dd28455b8f66064b5b6c509520f5'),(392,2,'20220927.233835.452-financas','2022-10-27 15:38:19','cfa73476126b46518e903f9b6f3a152e'),(393,2,'20220927.233838.483-financas','2022-10-27 15:38:19','96bfbae470b1a5268c1f6808b4c90866'),(394,2,'20220927.233841.510-financas','2022-10-27 15:38:19','fafae97cd5cd3b5cb19694ead5620465'),(395,2,'20220927.233844.540-financas','2022-10-27 15:38:19','4dd24e8b7c3ffb276245131c23042883'),(396,2,'20220927.233847.567-financas','2022-10-27 15:38:19','96c6a817034b06b14896fb3cabd14ebe'),(397,2,'20220927.233850.604-financas','2022-10-27 15:38:19','d1c0e181919082980717852b2627d5ed'),(398,2,'20220927.233853.626-financas','2022-10-27 15:38:19','f1aa0d5173be6c51744af7441c67bbef'),(399,2,'20220927.233856.660-financas','2022-10-27 15:38:19','1bab9e03b40ed84179e387df74ac155f'),(400,2,'20220927.233859.698-financas','2022-10-27 15:38:19','041c12325053114442e96aa2725ec22a'),(401,2,'20220927.233902.727-financas','2022-10-27 15:38:19','140d9fe43e77bd521de29d200559fd5f'),(402,2,'20220927.233905.755-financas','2022-10-27 15:38:19','8696830fd5afc3ee45c828118854774f'),(403,2,'20220927.233908.783-financas','2022-10-27 15:38:19','2f6e8f19311744f3ae66ffe80c2c490f'),(404,2,'20220927.233911.822-financas','2022-10-27 15:38:19','c6d6bcb3a70b2d5d51c36e48c0f159de'),(405,2,'20220927.233914.848-financas','2022-10-27 15:38:19','bc503ef81ccd3f3cdf8480c65633f5d5'),(406,2,'20220927.233917.883-financas','2022-10-27 15:38:19','3abe54b762ffa5f5646ca6366cd1671e'),(407,2,'20220927.233920.911-financas','2022-10-27 15:38:19','ee81bb6c01809aa69b1778a736c84084'),(408,2,'20220927.233923.943-financas','2022-10-27 15:38:19','ac727e37bfb0564f8e64f343fba9b1ba'),(409,2,'20220927.233926.980-financas','2022-10-27 15:38:19','2c7ec210079147d5fd8ed50e5e539af6'),(410,2,'20220927.233930.002-financas','2022-10-27 15:38:19','977c1d853f540acd8d8e92e003807fc7'),(411,2,'20220927.233933.033-financas','2022-10-27 15:38:19','9d6a7c8f4dd4aa2aa8f062cdc920856a'),(412,2,'20220927.233936.059-financas','2022-10-27 15:38:19','d1a2b2b735b47646c7204bc474da8f2d'),(413,2,'20220927.233939.083-financas','2022-10-27 15:38:19','e34db637a450fb124936f0ac2bf98c4a'),(414,2,'20220927.233942.114-financas','2022-10-27 15:38:19','a98403e5a6d4c546ea0178dc330e86a4'),(415,2,'20220927.233945.146-financas','2022-10-27 15:38:19','2c14c3e660dba1c2a0c08230e4fe6798'),(416,2,'20220927.233948.182-financas','2022-10-27 15:38:19','f9d9e792a88df827dff7564e99e03f72'),(417,2,'20220927.233951.214-financas','2022-10-27 15:38:19','1f9ae13869fbf1c3acffd68c1287c5b0'),(418,2,'20220927.233954.246-financas','2022-10-27 15:38:19','6a7eb16255c4e6a4ef3a8a1735ffb12d'),(419,2,'20220927.233957.277-financas','2022-10-27 15:38:19','6ccd8a003c8af009fffd3e08cbbba467'),(420,2,'20220927.234000.314-financas','2022-10-27 15:38:19','8ef8b24f68e4fe52aacc2405ae16ecfb'),(421,2,'20220927.234003.355-financas','2022-10-27 15:38:19','78639c2f3f69e821abebb137c7e608f3'),(422,2,'20220927.234006.387-financas','2022-10-27 15:38:19','1cb8a832aff47257d5ffa3de36e3ef1a'),(423,2,'20220927.234009.422-financas','2022-10-27 15:38:19','ad719697db30dfbad702c5bed6b3d758'),(424,2,'20220927.234012.459-financas','2022-10-27 15:38:19','4cad56e6f729105346ecbc5eb67203bb'),(425,2,'20220927.234015.492-financas','2022-10-27 15:38:19','1d69ab00a990e35c868e817b5d84c0f4'),(426,2,'20220927.234018.526-financas','2022-10-27 15:38:19','bf1615a885a3e5dd4afc5e8c0ad0cf79'),(427,2,'20220927.234021.564-financas','2022-10-27 15:38:19','96de4877e79a8c35946b7d8000cd1102'),(428,2,'20220927.234024.597-financas','2022-10-27 15:38:19','11890f04d2e870b3cd6e355cc269cf23'),(429,2,'20220927.234027.624-financas','2022-10-27 15:38:19','6119bb4ace80f1fbe1e6f67b6d09f29d'),(430,2,'20220927.234030.652-financas','2022-10-27 15:38:19','81530247b61f8c0e492e737b127a3739'),(431,2,'20220927.234033.680-financas','2022-10-27 15:38:19','92d4b98a2dd5b22919a3f524347b3b5e'),(432,2,'20220927.234036.716-financas','2022-10-27 15:38:19','d8a1a8a063cb082c688c63ee98375f08'),(433,2,'20220927.234039.750-financas','2022-10-27 15:38:19','97efdc82d21be1028600356f6983f866'),(434,2,'20220927.234042.783-financas','2022-10-27 15:38:19','f821566cce231b11d2e73fbd1647e80c'),(435,2,'20220927.234045.824-financas','2022-10-27 15:38:19','f1303465ed5014e3375a391b46abb9c2'),(436,2,'20220927.234048.861-financas','2022-10-27 15:38:19','28e8ad5f87697cb9d46653827b7fb933'),(437,2,'20220927.234051.896-financas','2022-10-27 15:38:19','e80098df3cba16cf58cfb8c604bf66a7'),(438,2,'20220927.234054.919-financas','2022-10-27 15:38:19','b50971cbe064b0339319faa1368a412a'),(439,2,'20220927.234057.948-financas','2022-10-27 15:38:19','9e2d1d561e77af5f404bf049d632d767'),(440,2,'20220927.234100.982-financas','2022-10-27 15:38:19','56dc449c593ed78fc60f2fbb20ca984b'),(441,2,'20220927.234104.009-financas','2022-10-27 15:38:19','9063f8bbe3e06e592695fac6ebb80f4f'),(442,2,'20220927.234107.042-financas','2022-10-27 15:38:19','d10bac545780edfd651501eea47b3234'),(443,2,'20220927.234110.074-financas','2022-10-27 15:38:19','8c536d4b35deaae3127fb92696c57f88'),(444,2,'20220927.234113.111-financas','2022-10-27 15:38:19','62e6f41f61bd0e9ed903ad4e34724ff8'),(445,2,'20220927.234116.143-financas','2022-10-27 15:38:19','68e4a004a8993881ca3f5aaa0f4b1765'),(446,2,'20220927.234119.177-financas','2022-10-27 15:38:19','f402df7da31fc6ea112faa9aebf13826'),(447,2,'20220927.234122.223-financas','2022-10-27 15:38:19','a9188b0405e90e8ea7850614a3a5240c'),(448,2,'20220927.234125.250-financas','2022-10-27 15:38:19','5043073367d6ee11d81f48e6094ecd9a'),(449,2,'20220927.234128.279-financas','2022-10-27 15:38:19','60de815a332cbb0de74af29a7e2c894b'),(450,2,'20220927.234131.309-financas','2022-10-27 15:38:19','a0392ea8e25b8813323944099a4ee41d'),(451,2,'20220927.234134.344-financas','2022-10-27 15:38:19','73434a886c6f6b430240a016043ff211'),(452,2,'20220927.234137.383-financas','2022-10-27 15:38:19','0ec0cf1367cd63caf81bc64fef3e859b'),(453,2,'20220927.234140.415-financas','2022-10-27 15:38:19','d3c696b445fe83e1a66218faee4b22a8'),(454,2,'20220927.234143.438-financas','2022-10-27 15:38:19','5564ebc0abae367ff5a80cbff8d55e4b'),(455,2,'20220927.234146.463-financas','2022-10-27 15:38:19','fe5437ce3421d2bd597ddf7fa9e52937'),(456,2,'20220927.234149.499-financas','2022-10-27 15:38:19','a8dc21496e4eb310ed8835b082985402'),(457,2,'20220927.234152.529-financas','2022-10-27 15:38:19','da5573f7e35f46164cc5404694470ea3'),(458,2,'20220927.234155.560-financas','2022-10-27 15:38:19','b5958912ba32be1dff853450ea96217e'),(459,2,'20220927.234158.602-financas','2022-10-27 15:38:19','555d714ed4fd21a5ef02b7209bf908f2'),(460,2,'20220927.234201.632-financas','2022-10-27 15:38:19','d4d47f797b8175614b1e58303a13ee66'),(461,2,'20220927.234204.659-financas','2022-10-27 15:38:19','9289d99e146028f16b3584b236fb1cc1'),(462,2,'20220927.234207.685-financas','2022-10-27 15:38:19','224dd4d97f47b436ea32372b53e0d9cd'),(463,2,'20220927.234210.720-financas','2022-10-27 15:38:19','9d6caaa1e1fd0ad5d450ce6275f3810f'),(464,2,'20220927.234213.750-financas','2022-10-27 15:38:19','dc64a4d484e0a98f21312cd036016971'),(465,2,'20220927.234216.790-financas','2022-10-27 15:38:19','ad43a555fef0f8ed4efe01cbbde0acc8'),(466,2,'20220927.234219.817-financas','2022-10-27 15:38:19','02f5ee3ae63fdd21ddb7c8709c451aef'),(467,2,'20220927.234222.846-financas','2022-10-27 15:38:19','fb1d1d3b2860167d94294c5370586300'),(468,2,'20220927.234225.877-financas','2022-10-27 15:38:19','d6574d14ab6791dbfc41ecfa0f6b0c7a'),(469,2,'20220927.234228.905-financas','2022-10-27 15:38:19','a901d111233456de9778996d88505e4e'),(470,2,'20220927.234231.935-financas','2022-10-27 15:38:19','b96097f50242f5a1138f8ec3e59037b5'),(471,2,'20220927.234234.973-financas','2022-10-27 15:38:19','10f523fddce2a2c70be9e4869749325a'),(472,2,'20220927.234237.995-financas','2022-10-27 15:38:19','7171fc416db82f9a5117f3c40fb98367'),(473,2,'20220927.234241.022-financas','2022-10-27 15:38:19','ea5d1302176cf327dac55185e4a740ba'),(474,2,'20220927.234244.049-financas','2022-10-27 15:38:19','5b4ed33a867f028d9fb57a6bacf05c9e'),(475,2,'20220927.234247.072-financas','2022-10-27 15:38:19','a933f63f85811bb885d793972f90d257'),(476,2,'20220927.234250.102-financas','2022-10-27 15:38:19','b35bb26255f2946915fdf46ae1bdb2ff'),(477,2,'20220927.234253.132-financas','2022-10-27 15:38:19','6500c880870078f2007cd16ef7f95868'),(478,2,'20220927.234256.154-financas','2022-10-27 15:38:19','3abc610f70ca89c5d1f938f608de0a3a'),(479,2,'20220927.234259.185-financas','2022-10-27 15:38:19','d489680fd988c804663aa152f34970ef'),(480,2,'20220927.234302.226-financas','2022-10-27 15:38:19','9d191f81cdd5eefd2ca261b1e1da8908'),(481,2,'20220927.234305.266-financas','2022-10-27 15:38:19','b927102d0bf74bd35e912f03fe17517d'),(482,2,'20220927.234308.285-financas','2022-10-27 15:38:19','839dd3bca1685f27fc2472d570f59027'),(483,2,'20220927.234311.309-financas','2022-10-27 15:38:19','9f2bab40ffccfb81d2fad85dd47cafde'),(484,2,'20220927.234314.346-financas','2022-10-27 15:38:19','0e2d40b3132246178f42f6197ba1c91b'),(485,2,'20220927.234317.371-financas','2022-10-27 15:38:19','abd578f54ae2007a1dc89c42f280948a'),(486,2,'20220927.234320.407-financas','2022-10-27 15:38:19','ea8a04f5c7c6cff8b8974c7d8e37b8bc'),(487,2,'20220927.234323.442-financas','2022-10-27 15:38:19','b7f16834bb58e26b4545ef7a302307b6'),(488,2,'20220927.234326.470-financas','2022-10-27 15:38:19','ebcdf7e196d339dd4445a93b9aa512c6'),(489,2,'20220927.234329.500-financas','2022-10-27 15:38:19','171379d7e6db25fd1318284691021c18'),(490,2,'20220927.234332.536-financas','2022-10-27 15:38:19','367c6843389c6de3ed1f72000a270f01'),(491,2,'20220927.234335.565-financas','2022-10-27 15:38:19','9f7b7d4980b77612490b8dffeec5dc0c'),(492,2,'20220927.234338.589-financas','2022-10-27 15:38:19','abfdba46239b2824c2669df4e61d7c8e'),(493,2,'20220927.234341.613-financas','2022-10-27 15:38:19','ce46927885339f2e96992184d37f2084'),(494,2,'20220927.234344.648-financas','2022-10-27 15:38:19','e1b7b9924056367cbcdb9cef595d4e6a'),(495,2,'20220927.234347.686-financas','2022-10-27 15:38:19','8dcee026d2d75cbf67ddabbf91c61550'),(496,2,'20220927.234350.718-financas','2022-10-27 15:38:19','1621b7ebd326ac10bfefb32ee544bb94'),(497,2,'20220927.234353.754-financas','2022-10-27 15:38:19','30fd9a33bd0f1efa6812af158fb2ddb9'),(498,2,'20220927.234356.786-financas','2022-10-27 15:38:19','45ea3fc14d5bae68899cf0e4b4e5fa4b'),(499,2,'20220927.234359.815-financas','2022-10-27 15:38:19','22c7f417122496068dd582463b4491a6'),(500,2,'20220927.234402.850-financas','2022-10-27 15:38:19','e9fe10d31b387638cd3b1c9d652f810f'),(501,2,'20220927.234405.879-financas','2022-10-27 15:38:19','2e30a144fec63364fd4293346bff914c'),(502,2,'20220927.234408.909-financas','2022-10-27 15:38:19','888760227d857cb2fda55ecc135722ab'),(503,2,'20220927.234411.945-financas','2022-10-27 15:38:19','0218c6e58cd7bcabd95e7c14e2031e9c'),(504,2,'20220927.234414.973-financas','2022-10-27 15:38:19','38260771adbe5a3c767d63573de6856e'),(505,2,'20220927.234418.005-financas','2022-10-27 15:38:19','4d1070e0813182e96b29f6bef3cde91e'),(506,2,'20220927.234421.033-financas','2022-10-27 15:38:19','3782919320c2051f26bad16cc7422b64'),(507,2,'20220927.234424.053-financas','2022-10-27 15:38:19','f1529a7e90a939db2352e3c09a479898'),(508,2,'20220927.234427.086-financas','2022-10-27 15:38:20','cf1629318dba11e36f61ee23c0acae25'),(509,2,'20220927.234430.124-financas','2022-10-27 15:38:20','d665567170e231815f702625d5d9fdf4'),(510,2,'20220927.234433.150-financas','2022-10-27 15:38:20','622e795c04bf9e6340fd3b3499be640e'),(511,2,'20220927.234436.187-financas','2022-10-27 15:38:20','90f604a7ef89a3dc126a0988eb873a18'),(512,2,'20220927.234439.218-financas','2022-10-27 15:38:20','5bba784f90a022cb1d2867ea6be5560b'),(513,2,'20220927.234442.242-financas','2022-10-27 15:38:20','87f08da34a63d1704dedac6e4a39fd13'),(514,2,'20220927.234445.280-financas','2022-10-27 15:38:20','f1d422a6bb8c34e06726f183a8ca3949'),(515,2,'20220927.234448.302-financas','2022-10-27 15:38:20','b97340f736f88bb7579714dfd45cd551'),(516,2,'20220927.234451.337-financas','2022-10-27 15:38:20','9f3da9a555f2f0138aa3be58596f9786'),(517,2,'20220927.234454.363-financas','2022-10-27 15:38:20','b3d650f6b7ab14748e13d891afcbd01a'),(518,2,'20220927.234457.399-financas','2022-10-27 15:38:20','e83c3c78fd113b3e2d7109739ecdcce3'),(519,2,'20220927.234500.428-financas','2022-10-27 15:38:20','a9649f36ec4a80ffe1c0a066da55fe9e'),(520,2,'20220927.234503.466-financas','2022-10-27 15:38:20','be3387ad7e8cf945dec945caab814843'),(521,2,'20220927.234506.492-financas','2022-10-27 15:38:20','7110a8a60ed67a7337f6b3ea286e454d'),(522,2,'20220927.234509.515-financas','2022-10-27 15:38:20','c79f7a08833aa5333b8eabca9a205131'),(523,2,'20220927.234512.544-financas','2022-10-27 15:38:20','5eddb249e38786f618d4fb5684561252'),(524,2,'20220927.234515.573-financas','2022-10-27 15:38:20','3cea7994cd509d8962cd3081490259fb'),(525,2,'20220927.234518.607-financas','2022-10-27 15:38:20','f8ab08dff13056089647820af817fa01'),(526,2,'20220927.234521.650-financas','2022-10-27 15:38:20','009bd5118f3f9ba90276c7e3a211075c'),(527,2,'20220927.234524.691-financas','2022-10-27 15:38:20','cf1ab1e700ed567e341c6deecf0f0682'),(528,2,'20220927.234527.727-financas','2022-10-27 15:38:20','82e2e2a85e936ef41387ba50a36e9c98'),(529,2,'20220927.234530.755-financas','2022-10-27 15:38:20','c1a073aa7d869dff35c89d5b70df9aa8'),(530,2,'20220927.234533.783-financas','2022-10-27 15:38:20','3978eb0e425d78693d9cc847df161a3b'),(531,2,'20220927.234536.811-financas','2022-10-27 15:38:20','176fe843c532c223a699fc140746deb3'),(532,2,'20220927.234539.840-financas','2022-10-27 15:38:20','bcceee678c43624829f6fbac6b49c624'),(533,2,'20220927.234542.875-financas','2022-10-27 15:38:20','dd8d1309ae4347c1f4859df1f9498d8c'),(534,2,'20220927.234545.915-financas','2022-10-27 15:38:20','afd406c93e5104e7eabd2877693f4b00'),(535,2,'20220927.234548.943-financas','2022-10-27 15:38:20','ce46d796eb81c9cd95cb60a775c38b4e'),(536,2,'20220927.234551.965-financas','2022-10-27 15:38:20','1ee46216211236a4050b85bd575005cd'),(537,2,'20220927.234554.999-financas','2022-10-27 15:38:20','fdaa3e71f1a99977fbfdd85bb5a8ff7b'),(538,2,'20220927.234558.033-financas','2022-10-27 15:38:20','f175997de36a3e6de7cb5cf5893d115e'),(539,2,'20220927.234601.061-financas','2022-10-27 15:38:20','11a82d100015e398e1e16e56f55ea4b9'),(540,2,'20220927.234604.087-financas','2022-10-27 15:38:20','1d966dc44dec6ebfc6b9997adcd645ca'),(541,2,'20220927.234607.113-financas','2022-10-27 15:38:20','5b23f5d7d4b48a622dfb54bd6e58d97d'),(542,2,'20220927.234610.142-financas','2022-10-27 15:38:20','51fb0db23ca25201586b0e4390db25be'),(543,2,'20220927.234613.167-financas','2022-10-27 15:38:20','55bcb3c8b06f4e5377f115bc506b19f1'),(544,2,'20220927.234616.199-financas','2022-10-27 15:38:20','494862954e5d7eb4d88d4e4abf167537'),(545,2,'20220927.234619.225-financas','2022-10-27 15:38:20','d0ee04f0eb8aac84401879a9074bfc52'),(546,2,'20220927.234622.260-financas','2022-10-27 15:38:20','f02bb4d3b7415be6dc5c44ee5e217930'),(547,2,'20220927.234625.281-financas','2022-10-27 15:38:20','169cad5fdb5cad358e1d9e0cae5aaba3'),(548,2,'20220927.234628.310-financas','2022-10-27 15:38:20','8d37a1871e5cde1423a2fa520f136392'),(549,2,'20220927.234631.345-financas','2022-10-27 15:38:20','7269fbe33747146d3fa4cc04725383f1'),(550,2,'20220927.234634.367-financas','2022-10-27 15:38:20','699e7fef7ae5dc58ab8205993d58d6c9'),(551,2,'20220927.234637.395-financas','2022-10-27 15:38:20','60c1101f545f9dd8bba79258f5b26ddb'),(552,2,'20220927.234640.433-financas','2022-10-27 15:38:20','507ba9cae51e8d195595bbe69da3053f'),(553,2,'20220927.234643.466-financas','2022-10-27 15:38:20','1f82f327d9b1fdb354b95374b4d998a6'),(554,2,'20220927.234646.499-financas','2022-10-27 15:38:20','f4357b8719e6188568d7804df016d2a5'),(555,2,'20220927.234649.531-financas','2022-10-27 15:38:20','29074687cb1f9306d7c505ad0ee593dc'),(556,2,'20220927.234652.558-financas','2022-10-27 15:38:20','4f9e33084c3da7a517f8e97d239aaef6'),(557,2,'20220927.234655.593-financas','2022-10-27 15:38:20','fcbc4f2803e2ab62e7b398dd3e2f4f54'),(558,2,'20220927.234658.628-financas','2022-10-27 15:38:20','3c2f470213335dd20c16db602bd66511'),(559,2,'20220927.234701.655-financas','2022-10-27 15:38:20','e742d16593c0d885a0913c2ff21931d6'),(560,2,'20220927.234704.694-financas','2022-10-27 15:38:20','7ba4dd0fd8d5bb057fc98b2ee3fc57e0'),(561,2,'20220927.234707.731-financas','2022-10-27 15:38:20','c3832f793c0e5440bc56660496bb9cfb'),(562,2,'20220927.234710.762-financas','2022-10-27 15:38:20','ccc04ef3105bf3a29a01f6459678ee78'),(563,2,'20220927.234713.798-financas','2022-10-27 15:38:20','df03cb356722c9ed9be92c624d54edb9'),(564,2,'20220927.234716.828-financas','2022-10-27 15:38:20','ff6931799bc7f5fbabb9a4495f6b751d'),(565,2,'20220927.234719.859-financas','2022-10-27 15:38:20','4fe59449257829bd98692e7e321d3265'),(566,2,'20220927.234722.892-financas','2022-10-27 15:38:20','a7ea588675e2626521d0a11d2b8828df'),(567,2,'20220927.234725.924-financas','2022-10-27 15:38:20','2db171504a859cefcac84a517cd2f8d3'),(568,2,'20220927.234728.952-financas','2022-10-27 15:38:20','868ccceea5df942386e5c76b7dc59c68'),(569,2,'20220927.234731.973-financas','2022-10-27 15:38:20','db9d06661dc22a218eb5ae68de756d9b'),(570,2,'20220927.234735.011-financas','2022-10-27 15:38:20','c40882ec2977e1d2caaebf6710c01ff4'),(571,2,'20220927.234738.038-financas','2022-10-27 15:38:20','71ad4f3c8f120d41fb608212af344010'),(572,2,'20220927.234741.072-financas','2022-10-27 15:38:20','8b44ba8ec4dd41fd333e7560d5aa003c'),(573,2,'20220927.234744.110-financas','2022-10-27 15:38:20','977f2a5cb63077ba08d5b85e6792b663'),(574,2,'20220927.234747.131-financas','2022-10-27 15:38:20','8209dcae5ab40c7802d2a365f695538e'),(575,2,'20220927.234750.167-financas','2022-10-27 15:38:20','cf2903ce18829f914bcb5b6b3ed87be5'),(576,2,'20220927.234753.206-financas','2022-10-27 15:38:20','f9a5978e5ccc1870b3cf9da12ac678c4'),(577,2,'20220927.234756.227-financas','2022-10-27 15:38:20','0c41bb373bedc77ed4b55d46485bc344'),(578,2,'20220927.234759.250-financas','2022-10-27 15:38:20','900a12a14bed0852a5294c76a8059e2f'),(579,2,'20220927.234802.280-financas','2022-10-27 15:38:20','466ca134e11bbd4ec45e35edfac0eef5'),(580,2,'20220927.234805.310-financas','2022-10-27 15:38:20','604cc9ca79d762ea41253bd504de6b97'),(581,2,'20220927.234808.348-financas','2022-10-27 15:38:20','b667c7b8362dc38e2f9f7e8d30561c13'),(582,2,'20220927.234811.383-financas','2022-10-27 15:38:20','20fe99857ac2cd251fac6c157101fc7e'),(583,2,'20220927.234814.409-financas','2022-10-27 15:38:20','4dfab6d91685e46e792fc218b92b5c9a'),(584,2,'20220927.234817.434-financas','2022-10-27 15:38:20','568356c9d5030d0bb45091cfa9906ef2'),(585,2,'20220927.234820.463-financas','2022-10-27 15:38:20','15bb521f5d62021bb1dece928be92ad3'),(586,2,'20220927.234823.502-financas','2022-10-27 15:38:20','04060030a59cab808fa0e6d7c61fbe1d'),(587,2,'20220927.234826.538-financas','2022-10-27 15:38:20','ee515f9b53372c0e48dbcd3bbcfbf03c'),(588,2,'20220927.234829.575-financas','2022-10-27 15:38:20','4e1cd95721c8df75ffbbce9dccab091b'),(589,2,'20220927.234832.602-financas','2022-10-27 15:38:20','c93ac34a63689894083b2510faf79d35'),(590,2,'20220927.234835.630-financas','2022-10-27 15:38:20','ee516b518878f7bd559eda51dbc52c9b'),(591,2,'20220927.234838.660-financas','2022-10-27 15:38:20','ce6ec65646b449ff7db231812e177742'),(592,2,'20220927.234841.690-financas','2022-10-27 15:38:20','6e3af173029f91af4348fffebacdf613'),(593,2,'20220927.234844.722-financas','2022-10-27 15:38:20','c3ece171617d2d02833aee93805c6120'),(594,2,'20220927.234847.754-financas','2022-10-27 15:38:20','579e6522e217ac51a6fff75d3d92fab1'),(595,2,'20220927.234850.785-financas','2022-10-27 15:38:20','5d7f20ce7bb13eef5bc54b5df2b50ca7'),(596,2,'20220927.234853.816-financas','2022-10-27 15:38:20','ad79c57702d032f443db05304ef81154'),(597,2,'20220927.234856.851-financas','2022-10-27 15:38:20','bb6e0bc6171339c80e1196c3e18e00d7'),(598,2,'20220927.234859.884-financas','2022-10-27 15:38:20','27107f6e0efa73fa17d2a3b95d4cacbd'),(599,2,'20220927.234902.915-financas','2022-10-27 15:38:20','b7532b590594e6ff484ce92b9bb0f163'),(600,2,'20220927.234905.942-financas','2022-10-27 15:38:20','e3b37c8f0ee310eceb0ebf8d5a51d86f'),(601,2,'20220927.234908.972-financas','2022-10-27 15:38:20','8021777782779a6103e84c733604ebf0'),(602,2,'20220927.234912.012-financas','2022-10-27 15:38:20','c377bb810678ee531b91677be22fc295'),(603,2,'20220927.234915.041-financas','2022-10-27 15:38:20','a6166c82e227736d43a2d76b51da6195'),(604,2,'20220927.234918.072-financas','2022-10-27 15:38:20','d0eca585537c25e76d2061f3d6df116e'),(605,2,'20220927.234921.102-financas','2022-10-27 15:38:20','f0827ea2d431ae063d3850b449505321'),(606,2,'20220927.234924.137-financas','2022-10-27 15:38:20','431ef8135ed9437502e044232b4d6e18'),(607,2,'20220927.234927.161-financas','2022-10-27 15:38:20','770b95074cd4f3aad491220ab7d65f59'),(608,2,'20220927.234930.194-financas','2022-10-27 15:38:20','6b9f9e3065ab694584d1da8ce90c2f7f'),(609,2,'20220927.234933.230-financas','2022-10-27 15:38:20','803278f2ea9c92431eed4012f75c8eb7'),(610,2,'20220927.234936.271-financas','2022-10-27 15:38:20','911bb482a59a3f0ae2ea4dd762dfd9bf'),(611,2,'20220927.234939.304-financas','2022-10-27 15:38:20','a4720bf5ae45e253fa29614674efc783'),(612,2,'20220927.234942.345-financas','2022-10-27 15:38:20','6a519cc4748cb19a4c44fa07d1e2a681'),(613,2,'20220927.234945.373-financas','2022-10-27 15:38:20','a38133524ef0fd12f9f226a5df017f8d'),(614,2,'20220927.234948.402-financas','2022-10-27 15:38:20','b8bc607f3e6b3001da892171074286a9'),(615,2,'20220927.234951.434-financas','2022-10-27 15:38:20','15efd1b5ec83c55844ce7c194b7ff64b'),(616,2,'20220927.234954.459-financas','2022-10-27 15:38:20','1d8b978fe8e4deb542a84404bef09943'),(617,2,'20220927.234957.495-financas','2022-10-27 15:38:20','3f8acb60154adb9280398dd3a1dc7793'),(618,2,'20220927.235000.524-financas','2022-10-27 15:38:20','3506b380b4d2f8ad605811fc00e5ccd0'),(619,2,'20220927.235003.563-financas','2022-10-27 15:38:20','0389ac96973349892c21621b2a0705b6'),(620,2,'20220927.235006.601-financas','2022-10-27 15:38:20','54380654bd237d22960613df07efa39f'),(621,2,'20220927.235009.641-financas','2022-10-27 15:38:20','985e5961fd9358a5328b9c2dc8c3b538'),(622,2,'20220927.235012.672-financas','2022-10-27 15:38:20','d2794173d4d75c14cf91a3e4ed1f0a77'),(623,2,'20220927.235015.708-financas','2022-10-27 15:38:20','d8ca0be19977720026a84faf7f591e8b'),(624,2,'20220927.235018.735-financas','2022-10-27 15:38:20','a6f47c8b9bdf190b1f0951e266bcfc08'),(625,2,'20220927.235021.757-financas','2022-10-27 15:38:20','7ee369991ed19c73e68f62e1791031e0'),(626,2,'20220927.235024.793-financas','2022-10-27 15:38:20','42916f03dba3c1f57ed5129d86e10fe2'),(627,2,'20220927.235027.823-financas','2022-10-27 15:38:20','3d4f70ea81f05d36af59da9d6fff454a'),(628,2,'20220927.235030.846-financas','2022-10-27 15:38:20','93d695972181dc758c70ee98ca54f35c'),(629,2,'20220927.235033.878-financas','2022-10-27 15:38:20','d48ec84935136c401ecf77fb8d196ed3'),(630,2,'20220927.235036.915-financas','2022-10-27 15:38:20','5dcf27beb1d5b55cd9270222ff05f968'),(631,2,'20220927.235039.947-financas','2022-10-27 15:38:20','293d4daa90fc11e9b733cef677619ab7'),(632,2,'20220927.235042.973-financas','2022-10-27 15:38:20','b463ca3e33d909401a12b7a571459516'),(633,2,'20220927.235046.013-financas','2022-10-27 15:38:20','6573717483ec1f783a4c6a2847c69ee3'),(634,2,'20220927.235049.050-financas','2022-10-27 15:38:20','0fffb97a8ea3faf84a48586950e653ec'),(635,2,'20220927.235052.078-financas','2022-10-27 15:38:20','d36f1158c78b9981feaaf1965fbbab6d'),(636,2,'20220927.235055.115-financas','2022-10-27 15:38:20','21e861f7e7108e0443f79825c677269e'),(637,2,'20220927.235058.144-financas','2022-10-27 15:38:20','af4fd51d6faa60bb611311c2fee3a77f'),(638,2,'20220927.235101.172-financas','2022-10-27 15:38:20','82f343916f8a210e83564915ab94e3be'),(639,2,'20220927.235104.194-financas','2022-10-27 15:38:20','913b2549bb68f4848978980db0b55eda'),(640,2,'20220927.235107.216-financas','2022-10-27 15:38:20','9a55590e0b2fb8b4dd201328c52a66b6'),(641,2,'20220927.235110.249-financas','2022-10-27 15:38:20','e31330977c24cd64f8e3cff9823a0dee'),(642,2,'20220927.235113.276-financas','2022-10-27 15:38:20','f9c4d7afa95e05fec29e4e65a8e3dbfa'),(643,2,'20220927.235116.302-financas','2022-10-27 15:38:20','46e6bb37f4702ab72924394dad3609fb'),(644,2,'20220927.235119.328-financas','2022-10-27 15:38:20','b2e104feb074f56c8e9796968c00c5a8'),(645,2,'20220927.235122.351-financas','2022-10-27 15:38:20','9016af19ef194d5cb971675804260f27'),(646,2,'20220927.235125.386-financas','2022-10-27 15:38:20','82cf8182bc4ca783a6bad7f40a7fedc5'),(647,2,'20220927.235128.420-financas','2022-10-27 15:38:20','9342ab91a2670b5c0730fb790b6fb59a'),(648,2,'20220927.235131.460-financas','2022-10-27 15:38:20','1c421b0deac24100334f5f3c5663a688'),(649,2,'20220927.235134.496-financas','2022-10-27 15:38:20','77fc810f41ba05759b11d5f462977db2'),(650,2,'20220927.235137.532-financas','2022-10-27 15:38:20','fa5d0804a71003e9c13dc9c08d6df835'),(651,2,'20220927.235140.567-financas','2022-10-27 15:38:20','3e3678350f21d46e7394020f22611508'),(652,2,'20220927.235143.592-financas','2022-10-27 15:38:20','8a067e5df3ade619aff5ab61a9a75869'),(653,2,'20220927.235146.623-financas','2022-10-27 15:38:20','2ee199d938cbb38d7e0c4b07db8fa6a9'),(654,2,'20220927.235149.654-financas','2022-10-27 15:38:20','2693ce724b271e2e4597ec889ce37d42'),(655,2,'20220927.235152.687-financas','2022-10-27 15:38:20','34b2bcf26b637aaaf8fc6b9216aa4a06'),(656,2,'20220927.235155.719-financas','2022-10-27 15:38:20','ab422ae2355b7ef5b2b82d3961dda782'),(657,2,'20220927.235158.761-financas','2022-10-27 15:38:20','babada8c2a73b3c88b13c13639ca661b'),(658,2,'20220927.235201.793-financas','2022-10-27 15:38:20','57f4827a11bc9d5fac7b9b7359f478b9'),(659,2,'20220927.235204.821-financas','2022-10-27 15:38:20','32c47ffc8ebf164fe0da05e7a40f3c30'),(660,2,'20220927.235207.849-financas','2022-10-27 15:38:20','8f8d520d17381ae7ad5190df7aa0d569'),(661,2,'20220927.235210.873-financas','2022-10-27 15:38:20','2ca1b7438939d0b994ef39251d42233f'),(662,2,'20220927.235213.904-financas','2022-10-27 15:38:20','e3baf761d2e29a59f147e0690fe525e1'),(663,2,'20220927.235216.930-financas','2022-10-27 15:38:20','50ae0691a0239d1f6bed85bd311d700c'),(664,2,'20220927.235219.962-financas','2022-10-27 15:38:20','8963cf493245e833e1a0d7d19b76f220'),(665,2,'20220927.235223.000-financas','2022-10-27 15:38:20','ae0a4d6db00c70702f99b7ca46df20f4'),(666,2,'20220927.235226.039-financas','2022-10-27 15:38:20','873c16be9c1f212fe98342d0e4ba6404'),(667,2,'20220927.235229.077-financas','2022-10-27 15:38:20','b0e8c491997328ef24ba68c6c9b140d3'),(668,2,'20220927.235232.112-financas','2022-10-27 15:38:20','f1c5be022f51d529f686ef344cc83495'),(669,2,'20220927.235235.148-financas','2022-10-27 15:38:20','94cd1f4b35d37b4ebee12b5d138e9922'),(670,2,'20220927.235238.169-financas','2022-10-27 15:38:20','97d43766d850c3d18e71c9e8dc3c9b9f'),(671,2,'20220927.235241.201-financas','2022-10-27 15:38:20','1475b616da3a6eace318bff0cd7e955e'),(672,2,'20220927.235244.238-financas','2022-10-27 15:38:20','bc5e807178ae26714d021cb726b4547d'),(673,2,'20220927.235247.273-financas','2022-10-27 15:38:20','143041fc93ba11aee4d61611337b5e75'),(674,2,'20220927.235250.314-financas','2022-10-27 15:38:20','02936a79ea763d632401242487a8ad9b'),(675,2,'20220927.235253.354-financas','2022-10-27 15:38:20','cef53e6d1c7d7068a8ee71d291d8ad13'),(676,2,'20220927.235256.392-financas','2022-10-27 15:38:20','99bf8ded0e64cf704f9d192973066504'),(677,2,'20220927.235259.428-financas','2022-10-27 15:38:20','ccc7b6a1c312aac6ef289d2155721ce8'),(678,2,'20220927.235302.466-financas','2022-10-27 15:38:20','157fa853cc993d437ca401a0fc95eaaa'),(679,2,'20220927.235305.497-financas','2022-10-27 15:38:20','60a0e2f5f0b5e6efa46ac5ede3b013f1'),(680,2,'20220927.235308.533-financas','2022-10-27 15:38:20','3d4b0c11f68c6abfdcc44a19085f6607'),(681,2,'20220927.235311.562-financas','2022-10-27 15:38:20','1084403c2247c09aae088a2bec2351a3'),(682,2,'20220927.235314.587-financas','2022-10-27 15:38:20','ec6e117dfcad0918a9b70388a4bd579f'),(683,2,'20220927.235317.617-financas','2022-10-27 15:38:20','8baa1f03a1e9884a2a87becfd8a91868'),(684,2,'20220927.235320.649-financas','2022-10-27 15:38:20','8443d3fdbf01b4e6bca3ff5162878ac3'),(685,2,'20220927.235323.682-financas','2022-10-27 15:38:20','ddebbb2e198f94c4e4755a98a3fcebb5'),(686,2,'20220927.235326.705-financas','2022-10-27 15:38:20','607a3bec5ff259eb0e50f035ee1cd5ea'),(687,2,'20220927.235329.737-financas','2022-10-27 15:38:20','76dc16210a215e2b1a3e6a9fe971e52f'),(688,2,'20220927.235332.770-financas','2022-10-27 15:38:20','e44b819869526a56fd6cf9dfbacf8413'),(689,2,'20220927.235335.808-financas','2022-10-27 15:38:20','47682aec4df8aa978a27cc0870365389'),(690,2,'20220927.235338.835-financas','2022-10-27 15:38:20','c8a021a2b5fe3f56abf19c4406d95bc5'),(691,2,'20220927.235341.861-financas','2022-10-27 15:38:20','3458022094aebbe9f185478f1aa9ba8f'),(692,2,'20220927.235344.896-financas','2022-10-27 15:38:20','4e052bc7271a1e6a15510aff1c67e001'),(693,2,'20220927.235347.928-financas','2022-10-27 15:38:20','cfb1b768b983351fc679e52c58152c7d'),(694,2,'20220927.235350.958-financas','2022-10-27 15:38:20','e1f4c641cbc83d786b2bf573a5c1fa01'),(695,2,'20220927.235353.995-financas','2022-10-27 15:38:20','89357a76c99323b3df19359b72eb94e5'),(696,2,'20220927.235357.023-financas','2022-10-27 15:38:20','89e2032e45a6c803320414ff2a4b8522'),(697,2,'20220927.235400.059-financas','2022-10-27 15:38:20','06eca050f6d5de45842da3c7c95648de'),(698,2,'20220927.235403.084-financas','2022-10-27 15:38:20','60e9ec254298b1cd600989aab35d0a70'),(699,2,'20220927.235406.119-financas','2022-10-27 15:38:20','fc34bea7447abb8d4b97eb8f89de4ce1'),(700,2,'20220927.235409.151-financas','2022-10-27 15:38:20','4fc31b7fc4b8ce4f131f00e93a1eb6d5'),(701,2,'20220927.235412.174-financas','2022-10-27 15:38:20','73d2c1afe08e92a629e35f8f31a3e50d'),(702,2,'20220927.235415.207-financas','2022-10-27 15:38:20','514bca18062ae9fbcead362c03e025f0'),(703,2,'20220927.235418.237-financas','2022-10-27 15:38:20','b618eaf062929c3c5e420350d02cb69f'),(704,2,'20220927.235421.275-financas','2022-10-27 15:38:20','46ad86cfaa29110d4c3a0fd3d53bb493'),(705,2,'20220927.235424.300-financas','2022-10-27 15:38:20','d2153b3990922956fdd78c517568106f'),(706,2,'20220927.235427.335-financas','2022-10-27 15:38:20','68b19295a5f5c04cf454061470f16a36'),(707,2,'20220927.235430.368-financas','2022-10-27 15:38:20','3122fa45592b0bf11da508e88e7ee599'),(708,2,'20220927.235433.407-financas','2022-10-27 15:38:20','b09c5a14d7f4c02eaccab838781f2bce'),(709,2,'20220927.235436.447-financas','2022-10-27 15:38:20','a74a79884076d1ab05f003625d0cadbf'),(710,2,'20220927.235439.474-financas','2022-10-27 15:38:20','c440266b4a003faae1412d5be55c8d30'),(711,2,'20220927.235442.510-financas','2022-10-27 15:38:20','d2fce773ce1be49ab69cb17edd1b458b'),(712,2,'20220927.235445.534-financas','2022-10-27 15:38:20','025efc9aa361f759dc77abc9a0a65b39'),(713,2,'20220927.235448.567-financas','2022-10-27 15:38:20','2bd7388bf84b78dd65d1b084f47e41b5'),(714,2,'20220927.235451.600-financas','2022-10-27 15:38:20','9c8e1d3f83ea79581f9485f755441dd7'),(715,2,'20220927.235454.638-financas','2022-10-27 15:38:20','862fe1a21344a454473cacc2150419c3'),(716,2,'20220927.235457.667-financas','2022-10-27 15:38:20','97a27e8f9bd19b2bd5ac54db29671ceb'),(717,2,'20220927.235500.697-financas','2022-10-27 15:38:20','b37f0b347ad714d0184e29003ff04391'),(718,2,'20220927.235503.731-financas','2022-10-27 15:38:20','37da5382ce154a0ed29654e3dc8278d9'),(719,2,'20220927.235506.752-financas','2022-10-27 15:38:20','651c4fbd11d78c5b2c753ccf7f863b34'),(720,2,'20220927.235509.782-financas','2022-10-27 15:38:20','56618f59a998ddaaec32df688a5d6f3c'),(721,2,'20220927.235512.810-financas','2022-10-27 15:38:20','7cd8fdc614a9c2f76a11594e9ae80a70'),(722,2,'20220927.235515.845-financas','2022-10-27 15:38:20','cabcf930925a63c9e81bb08a4858777d'),(723,2,'20220927.235518.879-financas','2022-10-27 15:38:20','8e86d3ddec382dd87163a683f0f9dd77'),(724,2,'20220927.235521.906-financas','2022-10-27 15:38:20','8b7ccb9f31f88f1f78d5c9a8d7c7dacd'),(725,2,'20220927.235524.939-financas','2022-10-27 15:38:20','1fa7fa2d0055e9bd8825b91a979d2f51'),(726,2,'20220927.235527.970-financas','2022-10-27 15:38:20','a9fd5efa3b540e2497aa5b3ac8421457'),(727,2,'20220927.235531.000-financas','2022-10-27 15:38:20','aad99ae37aa2250aab25a7fd2fbe4f11'),(728,2,'20220927.235534.023-financas','2022-10-27 15:38:20','148295d8db39d185a429c0a54380e625'),(729,2,'20220927.235537.052-financas','2022-10-27 15:38:20','c86a4478b6afd2dfdfa3b02859ddcaef'),(730,2,'20220927.235540.086-financas','2022-10-27 15:38:20','7d5d97f86028520cdcba025d04ed6ac2'),(731,2,'20220927.235543.124-financas','2022-10-27 15:38:20','40b82dcce8db3915bdae36dd5e112091'),(732,2,'20220927.235546.152-financas','2022-10-27 15:38:20','d0a71163edb3447afcb2a083b201d76e'),(733,2,'20220927.235549.180-financas','2022-10-27 15:38:20','1cae90b28f6e9276de2c16c600d8269f'),(734,2,'20220927.235552.219-financas','2022-10-27 15:38:20','faf1e51647c97e9377dc3f746bcc895f'),(735,2,'20220927.235555.246-financas','2022-10-27 15:38:20','ab030ca6ec82ca288d9fe39a8cd4b7ed'),(736,2,'20220927.235558.272-financas','2022-10-27 15:38:20','74036f57291eccf84d48f9cb18704e7f'),(737,2,'20220927.235601.302-financas','2022-10-27 15:38:20','d830b08e95369c82354028f48d994dc0'),(738,2,'20220927.235604.335-financas','2022-10-27 15:38:20','48a0bd8230edc76e14480c1e0be66314'),(739,2,'20220927.235607.359-financas','2022-10-27 15:38:20','38f937aaf65c934bd5c0f34430fea957'),(740,2,'20220927.235610.382-financas','2022-10-27 15:38:20','2744b9749bd06c3f2235a1919c3f9316'),(741,2,'20220927.235613.417-financas','2022-10-27 15:38:20','6e45a981d9724be3cb1c4edfb68d4ab1'),(742,2,'20220927.235616.438-financas','2022-10-27 15:38:20','da336246cc01713db0c02b04face0ab2'),(743,2,'20220927.235619.469-financas','2022-10-27 15:38:20','ed203f40ff9a654f3aaf60022bbb02ca'),(744,2,'20220927.235622.494-financas','2022-10-27 15:38:20','f9240cedbc8962fa94b83ba2593f240c'),(745,2,'20220927.235625.524-financas','2022-10-27 15:38:20','5373aa794d3fdccebffbc5acc0e9bf6a'),(746,2,'20220927.235628.559-financas','2022-10-27 15:38:20','3938f498d6977c87b21d68493f769a3f'),(747,2,'20220927.235631.600-financas','2022-10-27 15:38:20','adf9743275856dca1b91bab49171ec66'),(748,2,'20220927.235634.627-financas','2022-10-27 15:38:20','c6e761eaaa790b6254181c8cf03c6271'),(749,2,'20220927.235637.664-financas','2022-10-27 15:38:20','6fcbc6fb5805d8cb3b57872aee999de2'),(750,2,'20220927.235640.695-financas','2022-10-27 15:38:20','4277a63487c41c989c22d0e203fd0b07'),(751,2,'20220927.235643.725-financas','2022-10-27 15:38:20','5b5bd0db72e908afb8876abb60590a04'),(752,2,'20220927.235646.750-financas','2022-10-27 15:38:20','2442f0d5832361f97e1ada2a78c913ea'),(753,2,'20220927.235649.785-financas','2022-10-27 15:38:20','cc1676b55403b1d741ab881ea469cb44'),(754,2,'20220927.235652.818-financas','2022-10-27 15:38:20','e28037ee6dbf586ef8d6fe00703355bd'),(755,2,'20220927.235655.851-financas','2022-10-27 15:38:20','2b7f10445c73d4b1ccf746a401980cad'),(756,2,'20220927.235658.889-financas','2022-10-27 15:38:20','9024b2477ad7dec04376e7ebaee80ff5'),(757,2,'20220927.235701.929-financas','2022-10-27 15:38:20','f0ca1ba4c18428c2826e8beafa647b95'),(758,2,'20220927.235704.953-financas','2022-10-27 15:38:20','30d256c39abe2c74fd5b6f99b48b9248'),(759,2,'20220927.235707.975-financas','2022-10-27 15:38:20','4691724c4af4945e145b0e74e88c3897'),(760,2,'20220927.235711.002-financas','2022-10-27 15:38:20','aa5f5aaff11ee7c3c477befff8e735a9'),(761,2,'20220927.235714.052-financas','2022-10-27 15:38:20','453b96af1ebbb4aeb43290a540ed3f11'),(762,2,'20220927.235717.084-financas','2022-10-27 15:38:20','779dd088c494e4c3cb345a3199c58f6e'),(763,2,'20220927.235720.105-financas','2022-10-27 15:38:20','247fbdd5bbd8841443cb0d5e6619a28c'),(764,2,'20220927.235723.141-financas','2022-10-27 15:38:20','f206b60fef6cb251ae15c44a29d4d6c6'),(765,2,'20220927.235726.169-financas','2022-10-27 15:38:20','e06fc47bd4a03c38b01f28a736ddf9f2'),(766,2,'20220927.235729.202-financas','2022-10-27 15:38:20','15da9e752b8319d777c47cd29f3d50a0'),(767,2,'20220927.235732.236-financas','2022-10-27 15:38:20','8a93c98519997eddbaa2841fdf84f1b7'),(768,2,'20220927.235735.268-financas','2022-10-27 15:38:20','eb76c0e4ee36c00733a5614991c2c431'),(769,2,'20220927.235738.302-financas','2022-10-27 15:38:20','9fddc04fb25f8b86fdcb2e1b37769c9f'),(770,2,'20220927.235741.334-financas','2022-10-27 15:38:20','aca8285f9cd12c1b76639ee1677e5908'),(771,2,'20220927.235744.369-financas','2022-10-27 15:38:20','d1e9c8d4f96217edd272e3839fbfe857'),(772,2,'20220927.235747.398-financas','2022-10-27 15:38:20','fb07783cc3cd108da456c5fe0f19026b'),(773,2,'20220927.235750.435-financas','2022-10-27 15:38:20','e9cf20e34970a6a88074e6c696357277'),(774,2,'20220927.235753.476-financas','2022-10-27 15:38:20','510a5a5560f387c220795b081407b877'),(775,2,'20220927.235756.506-financas','2022-10-27 15:38:20','495aa85fe6222af70da9e18cd80a7ef2'),(776,2,'20220927.235759.543-financas','2022-10-27 15:38:20','52a451d8587460c317bbcd1499e55abf'),(777,2,'20220927.235802.580-financas','2022-10-27 15:38:20','12c92c8385149ccc1058e07c7d48f4ee'),(778,2,'20220927.235805.609-financas','2022-10-27 15:38:20','840aa85b91c55248928206eab9159344'),(779,2,'20220927.235808.641-financas','2022-10-27 15:38:20','f1e7ec9226c47dc83e5248083f977822'),(780,2,'20220927.235811.673-financas','2022-10-27 15:38:20','1fd3cc5958594e4d371f457503b372cf'),(781,2,'20220927.235814.705-financas','2022-10-27 15:38:20','6a2cc11b6cf8532165f09eb3357ff9b8'),(782,2,'20220927.235817.734-financas','2022-10-27 15:38:20','309cd044726ec0c5e43006a7db324b53'),(783,2,'20220927.235820.769-financas','2022-10-27 15:38:20','178f9c27fb5618e7b84af300837ce96d'),(784,2,'20220927.235823.807-financas','2022-10-27 15:38:20','843a5d5b27bc0ae1fd7e1f0bd09f6ba5'),(785,2,'20220927.235826.843-financas','2022-10-27 15:38:20','ff2a82a3c64670e205788cc30fa2d33d'),(786,2,'20220927.235829.876-financas','2022-10-27 15:38:20','50933ebe88efda5a1871136e56805259'),(787,2,'20220927.235832.900-financas','2022-10-27 15:38:20','097a2a187c80c1c8f4b6dda210999d82'),(788,2,'20220927.235835.926-financas','2022-10-27 15:38:20','1fc827a879601c77be2bd7eaf05bf089'),(789,2,'20220927.235838.957-financas','2022-10-27 15:38:20','42b4021dac47d8289953a67fbc880754'),(790,2,'20220927.235841.991-financas','2022-10-27 15:38:20','8bfaa907453dd9bef40b9a1ac184f934'),(791,2,'20220927.235845.017-financas','2022-10-27 15:38:20','081e292480fff1e1ca544658b3f3f497'),(792,2,'20220927.235848.044-financas','2022-10-27 15:38:20','75bd512da4f3f641d749fe1e354b68e2'),(793,2,'20220927.235851.083-financas','2022-10-27 15:38:20','48ff2254f0d53d7d703179c7efe728ef'),(794,2,'20220927.235854.111-financas','2022-10-27 15:38:20','b3c2cb806a6476b953d81c2b39c57bef'),(795,2,'20220927.235857.136-financas','2022-10-27 15:38:20','7c8b1b8569af9ca7a0e6e9965179cb91'),(796,2,'20220927.235900.162-financas','2022-10-27 15:38:20','560b28a8235d0400b97e834ab8a3a586'),(797,2,'20220927.235903.197-financas','2022-10-27 15:38:20','5be8af6e3359924f1c7196c7b2217b12'),(798,2,'20220927.235906.224-financas','2022-10-27 15:38:20','c07e7ff2b61f461faa1346b381872248'),(799,2,'20220927.235909.255-financas','2022-10-27 15:38:20','753fa58b94904062b0f65477047e7093'),(800,2,'20220927.235912.287-financas','2022-10-27 15:38:20','b415d1df5227967f562e993bfbc70c90'),(801,2,'20220927.235915.315-financas','2022-10-27 15:38:20','4e81d85a46a97d355f0919a9daa34f39'),(802,2,'20220927.235918.338-financas','2022-10-27 15:38:20','68101001c65bd75f068586ddbfa69121'),(803,2,'20220927.235921.371-financas','2022-10-27 15:38:20','8ada6d038a39a4b0c8b5b7349015b17f'),(804,2,'20220927.235924.407-financas','2022-10-27 15:38:20','9624a1cf73c4852f8772c3eb58ff7919'),(805,2,'20220927.235927.435-financas','2022-10-27 15:38:20','27c39f8b1b2b461df27237bca89eabe2'),(806,2,'20220927.235930.460-financas','2022-10-27 15:38:20','419da8afca4756f550c87d8e501d8b37'),(807,2,'20220927.235933.488-financas','2022-10-27 15:38:20','55fc9917b030b12163d324162e052577'),(808,2,'20220927.235936.518-financas','2022-10-27 15:38:20','c4fd5111e7039d03259edd304d1dde7f'),(809,2,'20220927.235939.552-financas','2022-10-27 15:38:20','fbcfe13c4177dabdefda38f2c174f750'),(810,2,'20220927.235942.589-financas','2022-10-27 15:38:20','c8e2d72e3706cbcd7ba9dd7415f4957d'),(811,2,'20220927.235945.621-financas','2022-10-27 15:38:20','cf1f425c55b29d27da3a627f03b51ba1'),(812,2,'20220927.235948.650-financas','2022-10-27 15:38:20','26499d03beedfd052c65dcbf8b2276a9'),(813,2,'20220927.235951.682-financas','2022-10-27 15:38:20','de8174db1b05bbd8f869d4595d101de9'),(814,2,'20220927.235954.711-financas','2022-10-27 15:38:20','997b680975811d5a2a01be9c693e0ba1'),(815,2,'20220927.235957.739-financas','2022-10-27 15:38:20','59b144840720dfc62b573b4e972d79da'),(816,2,'20220928.000000.777-financas','2022-10-27 15:38:20','bd2303413a2b250133b668178e964fed'),(817,2,'20220928.000003.802-financas','2022-10-27 15:38:20','3f464baa9a8e82de79dddd3f14d1004d'),(818,2,'20220928.000006.822-financas','2022-10-27 15:38:20','46fa740f867305bbe98ddf070b58ea5b'),(819,2,'20220928.000009.863-financas','2022-10-27 15:38:20','6fe251bbdaab710e457cde613ebccc3b'),(820,2,'20220928.000012.903-financas','2022-10-27 15:38:20','a27177a7eaa887d119d4232b01ecfa59'),(821,2,'20220928.000015.943-financas','2022-10-27 15:38:20','ed074cd3b1640adf03829dfa01681a3d'),(822,2,'20220928.000018.981-financas','2022-10-27 15:38:20','e00f253b3435ab3340e633271830ff77'),(823,2,'20220928.000022.009-financas','2022-10-27 15:38:20','20a40493bd482144ec488b525c2caffb'),(824,2,'20220928.000025.041-financas','2022-10-27 15:38:20','88a42575b8b7580630ad21a8f5907dcb'),(825,2,'20220928.000028.081-financas','2022-10-27 15:38:20','8baf4c6ae87861dee8908fb4121379fe'),(826,2,'20220928.000031.113-financas','2022-10-27 15:38:20','c2ef7871bf031ae71c21c39bc32011d7'),(827,2,'20220928.000034.142-financas','2022-10-27 15:38:20','da4fa22035a04f6312d9f0007431c81f'),(828,2,'20220928.000037.169-financas','2022-10-27 15:38:20','5ca97c958676f43002ca7222d2e0e3a6'),(829,2,'20220928.000040.202-financas','2022-10-27 15:38:20','08f68d1087752549eedde02518f20f21'),(830,2,'20220928.000043.228-financas','2022-10-27 15:38:20','3c050b5145235f0e34e307b8a21012d8'),(831,2,'20220928.000046.263-financas','2022-10-27 15:38:20','300a4664420e24d2cddeb2576acd88e7'),(832,2,'20220928.000049.305-financas','2022-10-27 15:38:20','6562b3a1c0a652e6d589e84301cc5e5b'),(833,2,'20220928.000052.334-financas','2022-10-27 15:38:20','13b2267df1bade0dfd0cd3c94adbdbfd'),(834,2,'20220928.000055.360-financas','2022-10-27 15:38:20','97b450ed5dfeb76e197ce57deeb82468'),(835,2,'20220928.000058.393-financas','2022-10-27 15:38:20','2000599e28a9b2f0ac62bdf1109599e5'),(836,2,'20220928.000101.432-financas','2022-10-27 15:38:20','e0ab4ec72fdb1c05b5ef997afd8bdb4f'),(837,2,'20220928.000104.459-financas','2022-10-27 15:38:20','684cb7c9a069d1f3421d96cb116a7137'),(838,2,'20220928.000107.487-financas','2022-10-27 15:38:20','5af3ae02cdab938b4eaf69a0218ac471'),(839,2,'20220928.000110.527-financas','2022-10-27 15:38:20','0e2471581e7d9660d644074a64733e02'),(840,2,'20220928.000113.561-financas','2022-10-27 15:38:20','e4222ab7d181117c7db205ae064a667e'),(841,2,'20220928.000116.585-financas','2022-10-27 15:38:20','9cf9253e329c0ea70259b5158af0dbbd'),(842,2,'20220928.000119.618-financas','2022-10-27 15:38:20','556d3f3abf957c2cd9d211a2e4743740'),(843,2,'20220928.000122.659-financas','2022-10-27 15:38:20','2a0d0990efff7e1a7049bf6c38b5e50b'),(844,2,'20220928.000125.688-financas','2022-10-27 15:38:20','db4fa62610364dc94c943ac7c3ecb9c0'),(845,2,'20220928.000128.722-financas','2022-10-27 15:38:20','e21e4b8894cc66ba8a2c81158778a633'),(846,2,'20220928.000131.753-financas','2022-10-27 15:38:20','44c7db805ed358581ef2a2dc25365e38'),(847,2,'20220928.000134.781-financas','2022-10-27 15:38:20','223649e61a8c86a0342cbaabec735a4e'),(848,2,'20220928.000137.820-financas','2022-10-27 15:38:20','1623d204737bfa76f07b8edb0dacfd3c'),(849,2,'20220928.000140.842-financas','2022-10-27 15:38:20','70c1ca916207bc6a99e14085f43e1540'),(850,2,'20220928.000143.871-financas','2022-10-27 15:38:20','619fbf758dfe3dd154eafb028823f5ea'),(851,2,'20220928.000146.906-financas','2022-10-27 15:38:20','08969d9d6b24a166f58662d01fa88b94'),(852,2,'20220928.000149.934-financas','2022-10-27 15:38:20','59c83b81219a977873e91b04d95b3dd3'),(853,2,'20220928.000152.956-financas','2022-10-27 15:38:20','7baaf2195351eb7273a03e401c5ac441'),(854,2,'20220928.000155.994-financas','2022-10-27 15:38:20','4160ffdf2465f3d4c7404d37fa827023'),(855,2,'20220928.000159.026-financas','2022-10-27 15:38:20','586849d48c1737699513c357cdf9ca95'),(856,2,'20220928.000202.058-financas','2022-10-27 15:38:20','1a736b6d619a4968c0ee6c5ace9f5add'),(857,2,'20220928.000205.078-financas','2022-10-27 15:38:20','8e69e9a930d2e177b04e9924a3c98910'),(858,2,'20220928.000208.110-financas','2022-10-27 15:38:20','2fb079711ab4f27ad8082df239661d1a'),(859,2,'20220928.000211.138-financas','2022-10-27 15:38:20','0eb9a0538b953415b8333c0241dbbcf3'),(860,2,'20220928.000214.166-financas','2022-10-27 15:38:20','85a2769db8ae0a147fb00db2918efcaf'),(861,2,'20220928.000217.206-financas','2022-10-27 15:38:20','df1ee83783d27971caee468936a262c5'),(862,2,'20220928.000220.226-financas','2022-10-27 15:38:20','b4a2bfeee276a28b36b37589f7260aa6'),(863,2,'20220928.000223.258-financas','2022-10-27 15:38:20','76005845d5e816f17ee2a199195def8d'),(864,2,'20220928.000226.295-financas','2022-10-27 15:38:20','d829a9e606e8ced3b58bfbbab95523c3'),(865,2,'20220928.000229.320-financas','2022-10-27 15:38:20','5c49ef3cf23bd0d42424f9737ece0369'),(866,2,'20220928.000232.351-financas','2022-10-27 15:38:20','81ae9441af38d4921e9bc6dae24e2199'),(867,2,'20220928.000235.389-financas','2022-10-27 15:38:20','7282e7aede1541477dad99b417c5ee5a'),(868,2,'20220928.000238.415-financas','2022-10-27 15:38:20','8a4cc50c4219603634fba255614fd8de'),(869,2,'20220928.000241.445-financas','2022-10-27 15:38:20','7aaf3757d63d1caa70167c79cd2916f6'),(870,2,'20220928.000244.477-financas','2022-10-27 15:38:20','75ed80468ea4c151125b8fef009776f9'),(871,2,'20220928.000247.501-financas','2022-10-27 15:38:20','1a395b2fd626ff96f41021a8ba6e9117'),(872,2,'20220928.000250.533-financas','2022-10-27 15:38:20','458ac88d560916b4ba5963bdd431095e'),(873,2,'20220928.000253.562-financas','2022-10-27 15:38:20','8999251db1e9b3ece8edd2a3041c419c'),(874,2,'20220928.000256.601-financas','2022-10-27 15:38:20','c4aa47a72486992d47c216122ccd6f8c'),(875,2,'20220928.000259.628-financas','2022-10-27 15:38:20','ead47a3f02625f1bb13d2d03acfb1854'),(876,2,'20220928.000302.658-financas','2022-10-27 15:38:20','a22971ca09dd94955845c476dcef22fb'),(877,2,'20220928.000305.684-financas','2022-10-27 15:38:20','7961f820c5bca95eea0886e3eabc4e8a'),(878,2,'20220928.000308.714-financas','2022-10-27 15:38:20','c8852e769f8734dde8875b3ca92d87c8'),(879,2,'20220928.000311.741-financas','2022-10-27 15:38:20','4d8eabcbd5a9796c4d7592ef64d6c9b8'),(880,2,'20220928.000314.771-financas','2022-10-27 15:38:20','226a4b096052987374ece7477110ab3a'),(881,2,'20220928.000317.799-financas','2022-10-27 15:38:20','d2f690909af6aee385027d4170cd6b2a'),(882,2,'20220928.000320.836-financas','2022-10-27 15:38:20','139dbbc863932c133d373429afedc00d'),(883,2,'20220928.000323.866-financas','2022-10-27 15:38:20','fce3e0b621b09ff256eceb51ecefca92'),(884,2,'20220928.000326.888-financas','2022-10-27 15:38:20','fcad88de2e68fc10e9eb9b6361318c36'),(885,2,'20220928.000329.925-financas','2022-10-27 15:38:20','1253fe8974e760ea5aecc20068eae8d1'),(886,2,'20220928.000332.967-financas','2022-10-27 15:38:20','0f5117692f86945f40d84423febe9f9b'),(887,2,'20220928.000335.991-financas','2022-10-27 15:38:20','bfd245cb6f27a84493ee60056a5110f1'),(888,2,'20220928.000339.022-financas','2022-10-27 15:38:20','b065196bd29a43cbf6de95c1e90003fa'),(889,2,'20220928.000342.050-financas','2022-10-27 15:38:20','91046152d0bc3a7c23534978cf568ac7'),(890,2,'20220928.000345.072-financas','2022-10-27 15:38:20','334f13288347eabdb6e992b4d931058f'),(891,2,'20220928.000348.111-financas','2022-10-27 15:38:20','2ccabb7969757bdd4e968b7937cf1363'),(892,2,'20220928.000351.138-financas','2022-10-27 15:38:20','cd08e81addf56aae39f36664972e589d'),(893,2,'20220928.000354.170-financas','2022-10-27 15:38:20','b17467300269c07bf2f436c3e391dc05'),(894,2,'20220928.000357.198-financas','2022-10-27 15:38:20','a8eca9df5fd1c2e325edafeabc27d747'),(895,2,'20220928.000400.229-financas','2022-10-27 15:38:20','49f8c74b0cada2fb7ad4fb6d63cb55aa'),(896,2,'20220928.000403.254-financas','2022-10-27 15:38:20','fb3cc81e1fd4716f45b20e1c9256f4b8'),(897,2,'20220928.000406.288-financas','2022-10-27 15:38:20','0e12c28d6b9c1ebca67bee073607b512'),(898,2,'20220928.000409.316-financas','2022-10-27 15:38:20','b8289044d8f66d6eb4582b663224fb5f'),(899,2,'20220928.000412.356-financas','2022-10-27 15:38:20','7e01a0d72773c95267e1dc8c8983eba3'),(900,2,'20220928.000415.390-financas','2022-10-27 15:38:20','36b430cd756f9d8cab1d540645b97722'),(901,2,'20220928.000418.428-financas','2022-10-27 15:38:20','47619ac9f7a8514b537c2b4a80604d42'),(902,2,'20220928.000421.451-financas','2022-10-27 15:38:20','d143cdb3f326ea890b313023183ad48b'),(903,2,'20220928.000424.491-financas','2022-10-27 15:38:20','a4a4471fb2e3742368997aab3738f4a0'),(904,2,'20220928.000427.532-financas','2022-10-27 15:38:20','19b2faf9e6ebfeda0fd8e4712ec73551'),(905,2,'20220928.000430.557-financas','2022-10-27 15:38:20','a4dcbfce7552a55646e5a0b8fafd6367'),(906,2,'20220928.000433.586-financas','2022-10-27 15:38:20','a5a4bc41a9c2e15d9cd38ee0cf4128a3'),(907,2,'20220928.000436.627-financas','2022-10-27 15:38:20','9284e71f1b52091fbd0ca62c81d2ab1c'),(908,2,'20220928.000439.659-financas','2022-10-27 15:38:20','9be876a40b1ee29702002f52e62fa28a'),(909,2,'20220928.000442.697-financas','2022-10-27 15:38:20','3785e17b79f32bed621214e7c08ce94f'),(910,2,'20220928.000445.727-financas','2022-10-27 15:38:20','21a687a0f40816818f13072fbc5c9f30'),(911,2,'20220928.000448.754-financas','2022-10-27 15:38:20','43b32702b36bfc906abb8428c22e2260'),(912,2,'20220928.000451.790-financas','2022-10-27 15:38:20','cc12cd6e26203a2bf8f8e8f534b17f1c'),(913,2,'20220928.000454.830-financas','2022-10-27 15:38:20','7fde7473a0cf94cb7ac22d18b1c0d233'),(914,2,'20220928.000457.858-financas','2022-10-27 15:38:20','4268542af6d1445444de57b222ecbbcc'),(915,2,'20220928.000500.883-financas','2022-10-27 15:38:20','16624e253c060da4be213acbfe53d4f7'),(916,2,'20220928.000503.923-financas','2022-10-27 15:38:20','d7d67714fa5f71fe7761f3cd997b4465'),(917,2,'20220928.000506.955-financas','2022-10-27 15:38:20','cc19b503f62d929022df6905bac16fce'),(918,2,'20220928.000509.991-financas','2022-10-27 15:38:20','ce89bdfcf3250f22435a43492bae8376'),(919,2,'20220928.000513.015-financas','2022-10-27 15:38:20','4f7ad112b209462ca108eeb47bc1f67d'),(920,2,'20220928.000516.050-financas','2022-10-27 15:38:20','36f224b2b4f846ab9e86fbc9bcf5ee7e'),(921,2,'20220928.000519.083-financas','2022-10-27 15:38:20','bfc6167870d3f4e818d1f8c19b3c6a8e'),(922,2,'20220928.000522.115-financas','2022-10-27 15:38:20','8c4115ac4976aa412d1dbd7cea1f0c40'),(923,2,'20220928.000525.156-financas','2022-10-27 15:38:20','129631c69f89eaca5edfd4c1f61c5891'),(924,2,'20220928.000528.187-financas','2022-10-27 15:38:20','d9330d904e219f9504bbc6c3cc8490cb'),(925,2,'20220928.000531.223-financas','2022-10-27 15:38:20','4f1e4943e7baa763eb61d3df0d61090c'),(926,2,'20220928.000534.253-financas','2022-10-27 15:38:20','b0ff37cdbd6b225820b62aea0cbfe2d8'),(927,2,'20220928.000537.274-financas','2022-10-27 15:38:20','a11b1feff9fd9ac8bbde3a886d1153d8'),(928,2,'20220928.000540.310-financas','2022-10-27 15:38:20','c372f605d41e92d3c96c983f4532ea71'),(929,2,'20220928.000543.338-financas','2022-10-27 15:38:20','ace474b913302a87f851e7942ab0910e'),(930,2,'20220928.000546.372-financas','2022-10-27 15:38:20','177a166102237dbdc11ef619340d6d85'),(931,2,'20220928.000549.408-financas','2022-10-27 15:38:20','fdfc466f707d7d8764ba6e214ba7811a'),(932,2,'20220928.000552.450-financas','2022-10-27 15:38:20','dfb6add0d4a0f07ef0f5e4f419d1fa3f'),(933,2,'20220928.000555.478-financas','2022-10-27 15:38:20','61d0686a9b485d7cb32bb9bf1363dcc7'),(934,2,'20220928.000558.508-financas','2022-10-27 15:38:20','98cfaf7f350d48a51b58634b01534c61'),(935,2,'20220928.000601.544-financas','2022-10-27 15:38:20','293ef7219011c32e6085d319d7179633'),(936,2,'20220928.000604.564-financas','2022-10-27 15:38:20','45cc1e7b9bfac4db0045a05da1f34b31'),(937,2,'20220928.000607.588-financas','2022-10-27 15:38:20','cfa4bfe9bea476f7092fa890a8a4f18f'),(938,2,'20220928.000610.626-financas','2022-10-27 15:38:20','3ffdba60226c98d2ea67f828eeb3f548'),(939,2,'20220928.000613.667-financas','2022-10-27 15:38:20','8f3dae763a3f4f807c6d8c8a66bb2be5'),(940,2,'20220928.000616.703-financas','2022-10-27 15:38:20','c005d88ec2cb6fc3c158d02cca78b4be'),(941,2,'20220928.000619.731-financas','2022-10-27 15:38:20','68bc78a4ee2c6ce42ef227f8565c23ba'),(942,2,'20220928.000622.761-financas','2022-10-27 15:38:20','8495cdef02423b799a5983d461a8d2cb'),(943,2,'20220928.000625.789-financas','2022-10-27 15:38:20','c9ef3d38b4aece9fa83b1a58e88c49bd'),(944,2,'20220928.000628.819-financas','2022-10-27 15:38:20','e0bffb8885f17f7a078db69bc4e28362'),(945,2,'20220928.000631.844-financas','2022-10-27 15:38:20','3616f90c40b0914874bf4df6c0e5caa3'),(946,2,'20220928.000634.882-financas','2022-10-27 15:38:20','c349b5b30fdfb554f539c8d7e46caf6e'),(947,2,'20220928.000637.921-financas','2022-10-27 15:38:20','67bc53b922e09db75fc265f509bd38b5'),(948,2,'20220928.000640.954-financas','2022-10-27 15:38:20','ca0364bca76f4fe2037ea213ae11ce07'),(949,2,'20220928.000643.980-financas','2022-10-27 15:38:20','f74630451541a017ebc59730887425be'),(950,2,'20220928.000647.008-financas','2022-10-27 15:38:20','c70210d29bf5df78bb7bc8e05498d678'),(951,2,'20220928.000650.050-financas','2022-10-27 15:38:20','9955abd76c9ba3d5e35ab3b63021be9e'),(952,2,'20220928.000653.076-financas','2022-10-27 15:38:20','99caeb59a1ab67a7ef1bdc99c77b40d9'),(953,2,'20220928.000656.104-financas','2022-10-27 15:38:20','fdf498b058eb861fdd65399964bafa15'),(954,2,'20220928.000659.138-financas','2022-10-27 15:38:20','88f7de691c25c0463413c6ddf7027ecf'),(955,2,'20220928.000702.173-financas','2022-10-27 15:38:20','bbbc9a866a83a5141930d3c84941bf74'),(956,2,'20220928.000705.207-financas','2022-10-27 15:38:20','140ea6d30376c03e8d3454775a825633'),(957,2,'20220928.000708.236-financas','2022-10-27 15:38:20','c38a9e0daa04acd64835949f33dfd126'),(958,2,'20220928.000711.264-financas','2022-10-27 15:38:20','5a8850ab83166745d1b896aba5df8f85'),(959,2,'20220928.000714.288-financas','2022-10-27 15:38:20','c14dfa3b5387d585d073aff9971d3479'),(960,2,'20220928.000717.326-financas','2022-10-27 15:38:20','6ea763ed38e99e0dfb07aec10569e695'),(961,2,'20220928.000720.359-financas','2022-10-27 15:38:20','20756492e6e5a0174bf531a37b1a6a4a'),(962,2,'20220928.000723.400-financas','2022-10-27 15:38:20','b8cf3b48bfee80349bcf55d6f0cf730b'),(963,2,'20220928.000726.434-financas','2022-10-27 15:38:20','d2852b83cb895890797842c794022c2c'),(964,2,'20220928.000729.468-financas','2022-10-27 15:38:20','86f90e2b1b8897d8076e7c16f0772f82'),(965,2,'20220928.000732.501-financas','2022-10-27 15:38:20','37b1ff2c163f284d065017356ea099aa'),(966,2,'20220928.000735.533-financas','2022-10-27 15:38:20','b7c8a6e315f57f9e35000675249a33be'),(967,2,'20220928.000738.567-financas','2022-10-27 15:38:20','5b9915627e6ee364938534227391b5ac'),(968,2,'20220928.000741.592-financas','2022-10-27 15:38:20','5faad48a5ead1fc2a4b880e8c05ac3ec'),(969,2,'20220928.000744.622-financas','2022-10-27 15:38:20','8317af1da7e905c838c4709f85de35bd'),(970,2,'20220928.000747.645-financas','2022-10-27 15:38:20','69ada8aec8f74696c1fe61471ebdf3c0'),(971,2,'20220928.000750.686-financas','2022-10-27 15:38:20','582fdf55a032634ee299a6b89306a8d3'),(972,2,'20220928.000753.718-financas','2022-10-27 15:38:20','d3872976995ac54181516ca31a34d21b'),(973,2,'20220928.000756.745-financas','2022-10-27 15:38:20','ca7b5105322e8128462e63cc0cacaa61'),(974,2,'20220928.000759.767-financas','2022-10-27 15:38:20','758f116259ebbba45cf93e503138d9c3'),(975,2,'20220928.000802.796-financas','2022-10-27 15:38:20','1c9a9a8d122aa3ff6874c579660a6a6b'),(976,2,'20220928.000805.827-financas','2022-10-27 15:38:20','dd6828f85a82d789efeeae973beb5972'),(977,2,'20220928.000808.858-financas','2022-10-27 15:38:20','739d93aefe126dc0fef7e216b58ea55c'),(978,2,'20220928.000811.893-financas','2022-10-27 15:38:20','106d268f8ec9668417cfb6c7b9563795'),(979,2,'20220928.000814.920-financas','2022-10-27 15:38:20','213a780427cb7329f38f0fdafd0ae561'),(980,2,'20220928.000817.950-financas','2022-10-27 15:38:20','793386a11e572f3ec4c7e2a44d8733fe'),(981,2,'20220928.000820.970-financas','2022-10-27 15:38:20','7fb25524be974cc550c6ddd630c6e9a6'),(982,2,'20220928.000823.991-financas','2022-10-27 15:38:20','8962c7f3ff5948ab4e8dd65b9666d7f7'),(983,2,'20220928.000827.017-financas','2022-10-27 15:38:20','f9609f8057d7a2f3930aaca2f50aa62c'),(984,2,'20220928.000830.051-financas','2022-10-27 15:38:20','6f3966b079c2b9ccbdae9c9a11d82639'),(985,2,'20220928.000833.075-financas','2022-10-27 15:38:20','012643617fe99a41aceead7386cd1695'),(986,2,'20220928.000836.114-financas','2022-10-27 15:38:20','720eb55b9524fd0e958bafdc425065ed'),(987,2,'20220928.000839.133-financas','2022-10-27 15:38:20','7861ff71f8e272901296c4dcd82d51b5'),(988,2,'20220928.000842.159-financas','2022-10-27 15:38:20','c7b1e19f49cfc84d9918319ddcf96347'),(989,2,'20220928.000845.191-financas','2022-10-27 15:38:20','e9fd2e75e9e8877ba8d0d2c305659c80'),(990,2,'20220928.000848.226-financas','2022-10-27 15:38:20','fa29ef8447593d415f8390d996ce8f68'),(991,2,'20220928.000851.258-financas','2022-10-27 15:38:20','999dbc37960004f1843fd55578cd7f6d'),(992,2,'20220928.000854.278-financas','2022-10-27 15:38:20','62dc5b5df03a347aaf1ed511b77223a9'),(993,2,'20220928.000857.314-financas','2022-10-27 15:38:20','bda9e3069a9108055b1ee58e1e8558b1'),(994,2,'20220928.000900.341-financas','2022-10-27 15:38:20','9670c31ca034e96f9c815fed2b948a22'),(995,2,'20220928.000903.379-financas','2022-10-27 15:38:20','88a66d7b4b22de7c9b89d1dab5749999'),(996,2,'20220928.000906.405-financas','2022-10-27 15:38:20','0ed5eebbb41c86584547ab1765bfa45b'),(997,2,'20220928.000909.435-financas','2022-10-27 15:38:20','957dd282d5d74d658b7899e272f296ce'),(998,2,'20220928.000912.472-financas','2022-10-27 15:38:20','29bc6bc1b8bcb93b3c6ee5b71e4df9ec'),(999,2,'20220928.000915.501-financas','2022-10-27 15:38:20','626c41e15211369cfd16bf2dedc1bbcb'),(1000,2,'20220928.000918.537-financas','2022-10-27 15:38:20','148c1898311887e2f515701c6045ddc6'),(1001,2,'20220928.000921.566-financas','2022-10-27 15:38:20','1ab1f4499b77f5ef438ab940a447f4e2'),(1002,2,'20220928.000924.597-financas','2022-10-27 15:38:20','16f0d2cb342ef9175c477b4f49514d81'),(1003,2,'20220928.000927.634-financas','2022-10-27 15:38:20','f361a7b7f9dcf0543582d16937b51338'),(1004,2,'20220928.000930.662-financas','2022-10-27 15:38:20','720aa4aace5ec482cf5a886d728ff9b3'),(1005,2,'20220928.000933.690-financas','2022-10-27 15:38:20','c31780fa9fd1baffcada4cf5302a63ca'),(1006,2,'20220928.000936.726-financas','2022-10-27 15:38:20','7a5a16e86e8afe523676f65cf403adae'),(1007,2,'20220928.000939.759-financas','2022-10-27 15:38:20','f04b419e7175a37e4e458e81054b3fdb'),(1008,2,'20220928.000942.790-financas','2022-10-27 15:38:20','f79234faa28f423a8c2819ee9c43fd1a'),(1009,2,'20220928.000945.820-financas','2022-10-27 15:38:20','a6e7b754ea16730c6e211e8a92c9327d'),(1010,2,'20220928.000948.853-financas','2022-10-27 15:38:20','7d92fc9ddc0912aa7c1ed76d344b881e'),(1011,2,'20220928.000951.893-financas','2022-10-27 15:38:20','6eb16593af2e689cde68308d17537674'),(1012,2,'20220928.000954.921-financas','2022-10-27 15:38:20','3c4669ae89ad6183d3f397ffc56e3546'),(1013,2,'20220928.000957.956-financas','2022-10-27 15:38:20','c55a82a5bd5570e94a1c71a690f4c641'),(1014,2,'20220928.001000.995-financas','2022-10-27 15:38:20','628bc42a2f83c51e772847dc3aad2899'),(1015,2,'20220928.001004.029-financas','2022-10-27 15:38:20','ff67ba01b59d0ae03bc1b4f19b38c021'),(1016,2,'20220928.001007.053-financas','2022-10-27 15:38:20','0865aee6262341693a535d74f0fa96dc'),(1017,2,'20220928.001010.083-financas','2022-10-27 15:38:20','caf1e63450a23d8a4f904c2377a1b6c7'),(1018,2,'20220928.001013.112-financas','2022-10-27 15:38:20','ee3be29daedbed557fa937922aa5df5a'),(1019,2,'20220928.001016.152-financas','2022-10-27 15:38:20','efea2ad54f0bb0331e937544ab324b29'),(1020,2,'20220928.001019.181-financas','2022-10-27 15:38:20','921852c7b08bbeabafa8d07334fc04b2'),(1021,2,'20220928.001022.212-financas','2022-10-27 15:38:20','aa1073005b9b1738548a3f529702ad95'),(1022,2,'20220928.001025.248-financas','2022-10-27 15:38:20','8297238e22f7f17aadc65adf5410f37c'),(1023,2,'20220928.001028.277-financas','2022-10-27 15:38:20','b9849003a861c8c600cb8aee3b917d93'),(1024,2,'20220928.001031.307-financas','2022-10-27 15:38:20','bd8f4005c24b2441547110b9adcbfc6a'),(1025,2,'20220928.001034.339-financas','2022-10-27 15:38:20','9577a520beba0c83efed3293b95592b8'),(1026,2,'20220928.001037.359-financas','2022-10-27 15:38:20','9836086818fa854660e4d5ad81f80129'),(1027,2,'20220928.001040.393-financas','2022-10-27 15:38:20','d7b79fb42e29c4ae6057247362517774'),(1028,2,'20220928.001043.426-financas','2022-10-27 15:38:20','d64bc0792fd78b51c38099234fa615fa'),(1029,2,'20220928.001046.452-financas','2022-10-27 15:38:20','194af98291f7f876bb86358d3bb9dedd'),(1030,2,'20220928.001049.483-financas','2022-10-27 15:38:20','54ca9ac473cb26963bb8a1332be7f159'),(1031,2,'20220928.001052.524-financas','2022-10-27 15:38:20','87a442195cea5095bba0f114575611b1'),(1032,2,'20220928.001055.558-financas','2022-10-27 15:38:20','a6366cb794b3513d70c11003321f4bd3'),(1033,2,'20220928.001058.601-financas','2022-10-27 15:38:20','99ab1c26cf23684f2e77d91134c1a49f'),(1034,2,'20220928.001101.633-financas','2022-10-27 15:38:20','ba51a71d69e1a8b79bbcee839e7de418'),(1035,2,'20220928.001104.657-financas','2022-10-27 15:38:20','0b480e6ea4dd0130e9affbb39aee8335'),(1036,2,'20220928.001107.695-financas','2022-10-27 15:38:20','b7b94cb277c7b112e06a1b6b93712961'),(1037,2,'20220928.001110.735-financas','2022-10-27 15:38:20','119bfb3cbbaee30822d19d037d3f187d'),(1038,2,'20220928.001113.775-financas','2022-10-27 15:38:20','24e2d9f5518731c7144317ccc9b6b1b3'),(1039,2,'20220928.001116.803-financas','2022-10-27 15:38:20','0877b988b48a445729bb9170ddf8882a'),(1040,2,'20220928.001119.834-financas','2022-10-27 15:38:20','3afb543d3ffd03dc364685ff3116b843'),(1041,2,'20220928.001122.856-financas','2022-10-27 15:38:20','419d3e3d1758377566247fbe1055f66b'),(1042,2,'20220928.001125.889-financas','2022-10-27 15:38:21','e34e3cf62f2e1b9c95e5cde861661c8f'),(1043,2,'20220928.001128.921-financas','2022-10-27 15:38:21','c3952f8bb8774a7d61638aaed8cbcfab'),(1044,2,'20220928.001131.962-financas','2022-10-27 15:38:21','23cfccb90189bc745fa3ed462b068d0f'),(1045,2,'20220928.001134.990-financas','2022-10-27 15:38:21','41c4db423a6b7f69dedb42cd34039453'),(1046,2,'20220928.001138.026-financas','2022-10-27 15:38:21','2f092d6edbb8741c8f65ad04a5459457'),(1047,2,'20220928.001141.052-financas','2022-10-27 15:38:21','9eb714845901075359316f9db22fa4a0'),(1048,2,'20220928.001144.081-financas','2022-10-27 15:38:21','59a7962edba02a2d46086824270c794b'),(1049,2,'20220928.001147.123-financas','2022-10-27 15:38:21','de112efca114853010282940e34828f9'),(1050,2,'20220928.001150.151-financas','2022-10-27 15:38:21','bd69326661a6bba69b30bae570bc40af'),(1051,2,'20220928.001153.173-financas','2022-10-27 15:38:21','241db9893c6d0ec39530c5388a169c24'),(1052,2,'20220928.001156.206-financas','2022-10-27 15:38:21','ca03d70a2f3eecad7e9815d617304b81'),(1053,2,'20220928.001159.245-financas','2022-10-27 15:38:21','8fd7cb82ca109f7f53296f8ad2f08b95'),(1054,2,'20220928.001202.273-financas','2022-10-27 15:38:21','a008580111cdfec29c2d7496cf7c5ed2'),(1055,2,'20220928.001205.305-financas','2022-10-27 15:38:21','de73bbe73d2741217c907c0c13393fd7'),(1056,2,'20220928.001208.339-financas','2022-10-27 15:38:21','9908157100c86f5222c234432e5c52b3'),(1057,2,'20220928.001211.375-financas','2022-10-27 15:38:21','1242fbc9a6861a982882341deccdd585'),(1058,2,'20220928.001214.407-financas','2022-10-27 15:38:21','d97d8ed296906dcbff73a0bcf4b2adb4'),(1059,2,'20220928.001217.433-financas','2022-10-27 15:38:21','63a39c32a3f3320b3e6d68ee70c4ae5a'),(1060,2,'20220928.001220.463-financas','2022-10-27 15:38:21','c884069a507a3ed3156fa5c7c13bdf51'),(1061,2,'20220928.001223.491-financas','2022-10-27 15:38:21','98bb7e7214504f33bd4a5d536a9ef32f'),(1062,2,'20220928.001226.518-financas','2022-10-27 15:38:21','d9da86367c871c0b5852866cac318ed5'),(1063,2,'20220928.001229.546-financas','2022-10-27 15:38:21','457e7faf0c6961a8fd0042e6cbd9a0cb'),(1064,2,'20220928.001232.578-financas','2022-10-27 15:38:21','6e3b3a739128aac039c0c5a069e491d1'),(1065,2,'20220928.001235.619-financas','2022-10-27 15:38:21','83d307dc6ba69fe289e9be4a69cd026f'),(1066,2,'20220928.001238.658-financas','2022-10-27 15:38:21','ee0921e2dac83adeeb9adcf66d73315c'),(1067,2,'20220928.001241.691-financas','2022-10-27 15:38:21','b9a95122fc4fe3942185f4aa768c2d91'),(1068,2,'20220928.001244.721-financas','2022-10-27 15:38:21','164f141725b442004d01d1c6c6b026f2'),(1069,2,'20220928.001247.753-financas','2022-10-27 15:38:21','852834b69bf64ac8e6bf8e01d564fb0d'),(1070,2,'20220928.001250.785-financas','2022-10-27 15:38:21','900f85213fc92d300c5cb5e6631e2261'),(1071,2,'20220928.001253.812-financas','2022-10-27 15:38:21','9856b9d3e788cf29d2637ac8335dbdd0'),(1072,2,'20220928.001256.838-financas','2022-10-27 15:38:21','87eb1aecd8424deaa97d7c0bd07c2c68'),(1073,2,'20220928.001259.867-financas','2022-10-27 15:38:21','676b3479630427c7c0002f01eb666587'),(1074,2,'20220928.001302.909-financas','2022-10-27 15:38:21','9c6aee48edf3a60874b53e8a23061ef0'),(1075,2,'20220928.001305.942-financas','2022-10-27 15:38:21','dfb327522fac65a93af59c0fd484d1bc'),(1076,2,'20220928.001308.980-financas','2022-10-27 15:38:21','b58dd8e3a427d2794a63fff921f98327'),(1077,2,'20220928.001312.010-financas','2022-10-27 15:38:21','d801c228b5f2f45a49a6923bb1506363'),(1078,2,'20220928.001315.039-financas','2022-10-27 15:38:21','00c677b8ed3f615eceac3eb9fc17854a'),(1079,2,'20220928.001318.070-financas','2022-10-27 15:38:21','3ab33fabb5173412edf2da8238482ccb'),(1080,2,'20220928.001321.102-financas','2022-10-27 15:38:21','3cceb66991ff6347f18ea372bc4fc217'),(1081,2,'20220928.001324.136-financas','2022-10-27 15:38:21','7ff2c7086371a68abf9b275979aeaf89'),(1082,2,'20220928.001327.166-financas','2022-10-27 15:38:21','7334216a577a0081026177bec0576594'),(1083,2,'20220928.001330.196-financas','2022-10-27 15:38:21','8ebac594d92c9196676f830ad9c95b61'),(1084,2,'20220928.001333.225-financas','2022-10-27 15:38:21','e2f9a186646a90349e1a8c41dbd93d7f'),(1085,2,'20220928.001336.250-financas','2022-10-27 15:38:21','70c995fd5b55777eda14bd8bb691b783'),(1086,2,'20220928.001339.281-financas','2022-10-27 15:38:21','224edd45b8e14556d46d358ddde241e6'),(1087,2,'20220928.001342.306-financas','2022-10-27 15:38:21','f981f92d0de67ef3d130c2aaa9927b3e'),(1088,2,'20220928.001345.336-financas','2022-10-27 15:38:21','e96547d2ea988d9afbf32b0ef62521c3'),(1089,2,'20220928.001348.365-financas','2022-10-27 15:38:21','8fa6b7939d475c4fc0238463bef40b79'),(1090,2,'20220928.001351.392-financas','2022-10-27 15:38:21','5ec8ca5d56b070b7c0480d87e4858f59'),(1091,2,'20220928.001354.423-financas','2022-10-27 15:38:21','7a782b803fd57486b8f15ee4985ce9e2'),(1092,2,'20220928.001357.454-financas','2022-10-27 15:38:21','fdb8226b1865cd494d43af43a09f1a55'),(1093,2,'20220928.001400.490-financas','2022-10-27 15:38:21','85280c1c2e000b945d331f5e14ff0661'),(1094,2,'20220928.001403.510-financas','2022-10-27 15:38:21','728a5be999b142189a9d69c1b376a64d'),(1095,2,'20220928.001406.543-financas','2022-10-27 15:38:21','b9dfbd997c19bc3522b54c1116f39db8'),(1096,2,'20220928.001409.571-financas','2022-10-27 15:38:21','65b1c8b212b6fa9f3ba9867e176fc19f'),(1097,2,'20220928.001412.597-financas','2022-10-27 15:38:21','fa2f87263f4a97980c0f0da93ea969ee'),(1098,2,'20221010.125555.282-financas','2022-10-27 15:38:21','eec1ede996b3ca1676d79ec3e0ace62a'),(1100,2,'20221003.115456.935','2022-10-31 08:42:24','a038c103468667dbd89e2f5aff35875c'),(1101,2,'20221003.115500.121','2022-10-31 08:42:24','bd69cf82511f3634d27c4104eb9e6ce4'),(1102,1,'1.0.21.95','2022-10-31 08:42:25','1ae50f02af1512b6c2a59a1b5435853e');
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

-- Dump completed on 2022-10-31 20:32:31
