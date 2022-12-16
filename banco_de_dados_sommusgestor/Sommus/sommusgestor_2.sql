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
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,'','S',3),(117,28,'2','CUSTOS',NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,'C','A',4),(124,35,'3','DESPESAS',NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,'D','A',4),(130,41,'3.1.01.005','Cartório',23,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,'D','A',4),(135,46,'3.1.01.010','Correios',23,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,'D','A',4),(137,48,'3.1.01.012','Doações',23,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,'D','A',4),(156,67,'3.1.02.002','Comissões',24,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,'D','A',4),(158,69,'3.1.02.004','Premiações',24,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,'D','A',4),(172,83,'3.1.05.004','Jornais',27,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,'D','A',4),(182,93,'3.1.06.005','Comissão',28,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,'D','A',4),(185,96,'3.1.06.008','Férias',28,'D','A',4),(186,97,'3.1.06.009','FGTS',28,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,'D','A',4),(188,99,'3.1.06.011','INSS',28,'D','A',4),(189,100,'3.1.06.012','IRRF',28,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,'D','A',4),(191,102,'3.1.06.014','Salário',28,'D','A',4),(192,103,'3.1.06.015','Salário família',28,'D','A',4),(193,104,'3.1.06.016','Seguro',28,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,'D','A',4),(208,119,'4.1.01.002','Ações',32,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,'','S',3),(225,NULL,'5.1.01.001','Tomada de Empréstimo',35,'C','A',4),(226,NULL,'5.1.02.001','Pagamento de Empréstimo',36,'D','A',4),(227,NULL,'5.1.03.001','Pagamento de Juros de Empréstimo',37,'D','A',4);
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
INSERT INTO `categoria_empresa` VALUES (90,3,NULL,'',1,0),(91,3,NULL,'',1,0),(92,3,NULL,'',1,0),(93,3,NULL,'',1,0),(94,3,NULL,'',1,0),(95,3,NULL,'',1,0),(96,3,NULL,'',1,0),(97,3,NULL,'',1,0),(98,3,NULL,'',1,0),(99,3,NULL,'',1,0),(100,3,NULL,'',1,0),(101,3,NULL,'',1,0),(102,3,NULL,'',1,0),(103,3,NULL,'',1,0),(104,3,NULL,'',1,0),(105,3,NULL,'',1,0),(106,3,NULL,'',1,0),(107,3,NULL,'',1,0),(108,3,NULL,'',1,0),(109,3,NULL,'',1,0),(110,3,NULL,'',1,0),(111,3,NULL,'',1,0),(112,3,NULL,'',1,0),(113,3,NULL,'',1,0),(114,3,NULL,'',1,0),(115,3,NULL,'',1,0),(116,3,NULL,'',1,0),(117,3,NULL,'',1,0),(118,3,NULL,'',1,0),(119,3,NULL,'',1,0),(120,3,NULL,'',1,0),(121,3,NULL,'',1,0),(122,3,NULL,'',1,0),(123,3,NULL,'',1,0),(124,3,NULL,'',1,0),(125,3,NULL,'',1,0),(126,3,NULL,'',1,0),(127,3,NULL,'',1,0),(128,3,NULL,'',1,0),(129,3,NULL,'',1,0),(130,3,NULL,'',1,0),(131,3,NULL,'',1,0),(132,3,NULL,'',1,0),(133,3,NULL,'',1,0),(134,3,NULL,'',1,0),(135,3,NULL,'',1,0),(136,3,NULL,'',1,0),(137,3,NULL,'',1,0),(138,3,NULL,'',1,0),(139,3,NULL,'',1,0),(140,3,NULL,'',1,0),(141,3,NULL,'',1,0),(142,3,NULL,'',1,0),(143,3,NULL,'',1,0),(144,3,NULL,'',1,0),(145,3,NULL,'',1,0),(146,3,NULL,'',1,0),(147,3,NULL,'',1,0),(148,3,NULL,'',1,0),(149,3,NULL,'',1,0),(150,3,NULL,'',1,0),(151,3,NULL,'',1,0),(152,3,NULL,'',1,0),(153,3,NULL,'',1,0),(154,3,NULL,'',1,0),(155,3,NULL,'',1,0),(156,3,NULL,'',1,0),(157,3,NULL,'',1,0),(158,3,NULL,'',1,0),(159,3,NULL,'',1,0),(160,3,NULL,'',1,0),(161,3,NULL,'',1,0),(162,3,NULL,'',1,0),(163,3,NULL,'',1,0),(164,3,NULL,'',1,0),(165,3,NULL,'',1,0),(166,3,NULL,'',1,0),(167,3,NULL,'',1,0),(168,3,NULL,'',1,0),(169,3,NULL,'',1,0),(170,3,NULL,'',1,0),(171,3,NULL,'',1,0),(172,3,NULL,'',1,0),(173,3,NULL,'',1,0),(174,3,NULL,'',1,0),(175,3,NULL,'',1,0),(176,3,NULL,'',1,0),(177,3,NULL,'',1,0),(178,3,NULL,'',1,0),(179,3,NULL,'',1,0),(180,3,NULL,'',1,0),(181,3,NULL,'',1,0),(182,3,NULL,'',1,0),(183,3,NULL,'',1,0),(184,3,NULL,'',1,0),(185,3,NULL,'',1,0),(186,3,NULL,'',1,0),(187,3,NULL,'',1,0),(188,3,NULL,'',1,0),(189,3,NULL,'',1,0),(190,3,NULL,'',1,0),(191,3,NULL,'',1,0),(192,3,NULL,'',1,0),(193,3,NULL,'',1,0),(194,3,NULL,'',1,0),(195,3,NULL,'',1,0),(196,3,NULL,'',1,0),(197,3,NULL,'',1,0),(198,3,NULL,'',1,0),(199,3,NULL,'',1,0),(200,3,NULL,'',1,0),(201,3,NULL,'',1,0),(202,3,NULL,'',1,0),(203,3,NULL,'',1,0),(204,3,NULL,'',1,0),(205,3,NULL,'',1,0),(206,3,NULL,'',1,0),(207,3,NULL,'',1,0),(208,3,NULL,'',1,0),(209,3,NULL,'',1,0),(210,3,NULL,'',1,0),(211,3,NULL,'',1,0),(212,3,NULL,'',1,0),(213,3,NULL,'',1,0),(214,3,NULL,'',1,0),(215,3,NULL,'',1,0),(216,3,NULL,'',1,0),(217,3,NULL,'',1,0),(218,3,NULL,'',1,0),(219,3,NULL,'',1,0),(220,3,NULL,'',1,0),(221,3,NULL,'',1,0),(222,3,NULL,'',1,0),(223,3,NULL,'',1,0),(224,3,NULL,'',1,0),(225,3,NULL,'',1,0),(226,3,NULL,'',1,0),(227,3,NULL,'',1,0);
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
INSERT INTO `categoria_grupo_conta_contabil` VALUES (1,1,34,1,1,1,1),(2,1,78,1,1,1,1),(3,1,4,1,1,1,2),(4,1,9,1,2,2,2),(5,1,34,1,1,1,2),(6,1,56,1,1,2,2),(7,1,78,1,1,3,2),(8,1,29,1,1,3,2),(9,2,6,2,1,1,2),(10,2,9,2,2,2,2),(11,2,34,2,1,1,2),(12,2,56,2,1,2,2),(13,2,78,2,1,3,2),(14,2,29,2,1,3,2),(15,3,35,1,1,1,1),(16,3,78,1,1,1,1),(17,3,4,1,1,1,2),(18,3,35,1,1,1,2),(19,3,78,1,1,1,2),(20,3,29,1,1,1,2),(21,4,6,2,1,1,2),(22,4,35,2,1,1,2),(23,4,78,2,1,1,2),(24,4,29,2,1,1,2),(25,5,36,9,1,7,1),(26,5,71,9,1,8,1),(27,5,50,9,1,9,1),(28,5,78,9,1,1,1),(29,5,4,9,1,1,2),(30,5,6,9,2,7,2),(31,5,71,9,1,8,2),(32,5,50,9,1,9,2),(33,5,78,9,1,10,2),(34,5,29,9,1,10,2),(35,6,37,9,1,7,1),(36,6,71,9,1,8,1),(37,6,50,9,1,9,1),(38,6,78,9,1,1,1),(39,6,4,9,1,1,2),(40,6,6,9,2,7,2),(41,6,71,9,1,8,2),(42,6,50,9,1,9,2),(43,6,78,9,1,10,2),(44,6,29,9,1,10,2),(45,7,38,5,2,1,1),(46,7,78,5,2,1,1),(47,7,4,5,2,1,2),(48,7,9,5,1,2,2),(49,7,38,5,2,1,2),(50,7,56,5,2,2,2),(51,7,78,5,2,3,2),(52,7,29,5,2,3,2),(53,8,6,6,2,1,2),(54,8,9,6,1,2,2),(55,8,38,6,2,1,2),(56,8,56,6,2,2,2),(57,8,78,6,2,3,2),(58,8,29,6,2,3,2),(59,9,39,5,2,1,1),(60,9,78,5,2,1,1),(61,9,4,5,2,1,2),(62,9,39,5,2,1,2),(63,9,78,5,2,1,2),(64,9,29,5,2,1,2),(65,10,6,6,2,1,2),(66,10,39,6,2,1,2),(67,10,78,6,2,1,2),(68,10,29,6,2,1,2),(69,11,6,15,1,1,2),(70,11,41,15,1,1,2),(71,11,78,15,1,1,2),(72,11,29,15,1,1,2),(73,12,41,9,1,7,1),(74,12,71,9,1,8,1),(75,12,50,9,1,9,1),(76,12,78,9,1,1,1),(77,12,4,9,1,1,2),(78,12,6,9,2,7,2),(79,12,71,9,1,8,2),(80,12,50,9,1,9,2),(81,12,78,9,1,10,2),(82,12,29,9,1,10,2),(83,13,45,11,1,1,1),(84,13,78,11,1,1,1),(85,13,4,11,1,1,2),(86,13,45,11,1,1,2),(87,13,78,11,1,1,2),(88,13,25,11,1,1,2),(89,13,7,12,1,1,2),(90,13,45,12,1,1,2),(91,13,78,12,1,1,2),(92,13,25,12,1,1,2),(93,13,45,9,1,7,1),(94,13,71,9,1,8,1),(95,13,50,9,1,9,1),(96,13,78,9,1,1,1),(97,13,4,9,1,1,2),(98,13,7,9,2,7,2),(99,13,71,9,1,8,2),(100,13,50,9,1,9,2),(101,13,78,9,1,10,2),(102,13,29,9,1,10,2),(103,14,46,11,1,1,1),(104,14,78,11,1,1,1),(105,14,4,11,1,1,2),(106,14,13,11,2,1,2),(107,14,7,12,1,1,2),(108,14,13,12,2,1,2),(109,14,46,9,1,7,1),(110,14,71,9,1,8,1),(111,14,50,9,1,9,1),(112,14,78,9,1,1,1),(113,14,4,9,1,1,2),(114,14,7,9,2,7,2),(115,14,71,9,1,8,2),(116,14,50,9,1,9,2),(117,14,78,9,1,10,2),(118,14,29,9,1,10,2),(119,15,47,11,1,1,1),(120,15,78,11,1,1,1),(121,15,4,11,1,1,2),(122,15,12,11,2,1,2),(123,15,7,12,1,1,2),(124,15,12,12,2,1,2),(125,15,47,9,1,7,1),(126,15,71,9,1,8,1),(127,15,50,9,1,9,1),(128,15,78,9,1,1,1),(129,15,4,9,1,1,2),(130,15,7,9,2,7,2),(131,15,71,9,1,8,2),(132,15,50,9,1,9,2),(133,15,78,9,1,10,2),(134,15,29,9,1,10,2),(135,16,48,11,1,1,1),(136,16,78,11,1,1,1),(137,16,4,11,1,1,2),(138,16,48,11,1,1,2),(139,16,78,11,1,1,2),(140,16,29,11,1,1,2),(141,16,7,12,1,1,2),(142,16,48,12,1,1,2),(143,16,78,12,1,1,2),(144,16,29,12,1,1,2),(145,16,48,9,1,7,1),(146,16,71,9,1,8,1),(147,16,50,9,1,9,1),(148,16,78,9,1,1,1),(149,16,4,9,1,1,2),(150,16,7,9,2,7,2),(151,16,71,9,1,8,2),(152,16,50,9,1,9,2),(153,16,78,9,1,10,2),(154,16,29,9,1,10,2),(155,17,52,11,1,1,1),(156,17,78,11,1,1,1),(157,17,4,11,1,1,2),(158,17,52,11,1,1,2),(159,17,78,11,1,1,2),(160,17,29,11,1,1,2),(161,17,7,12,1,1,2),(162,17,52,12,1,1,2),(163,17,78,12,1,1,2),(164,17,29,12,1,1,2),(165,17,52,9,1,7,1),(166,17,71,9,1,8,1),(167,17,50,9,1,9,1),(168,17,78,9,1,1,1),(169,17,4,9,1,1,2),(170,17,7,9,2,7,2),(171,17,71,9,1,8,2),(172,17,50,9,1,9,2),(173,17,78,9,1,10,2),(174,17,29,9,1,10,2),(175,18,56,3,1,1,1),(176,18,78,3,2,1,1),(177,18,4,3,2,1,2),(178,18,9,3,1,1,2),(179,19,18,4,1,1,2),(180,19,9,4,1,1,2),(181,20,56,10,1,7,1),(182,20,49,10,1,8,1),(183,20,72,10,1,9,1),(184,20,78,10,1,1,1),(185,20,4,10,1,1,2),(186,20,18,10,2,7,2),(187,20,49,10,1,8,2),(188,20,72,10,1,9,2),(189,20,78,10,2,10,2),(190,20,29,10,2,10,2),(191,21,56,7,2,1,1),(192,21,78,7,1,1,1),(193,21,4,7,1,1,2),(194,21,9,7,2,1,2),(195,22,18,8,2,1,2),(196,22,9,8,2,1,2),(197,23,63,11,1,1,1),(198,23,78,11,2,1,1),(199,23,4,11,2,1,2),(200,23,63,11,1,1,2),(201,23,78,11,2,1,2),(202,23,29,11,2,1,2),(203,23,21,13,1,1,2),(204,23,63,13,1,1,2),(205,23,78,13,2,1,2),(206,23,29,13,2,1,2),(207,23,63,10,1,7,1),(208,23,49,10,1,8,1),(209,23,72,10,1,9,1),(210,23,78,10,1,1,1),(211,23,4,10,1,1,2),(212,23,21,10,2,7,2),(213,23,49,10,1,8,2),(214,23,72,10,1,9,2),(215,23,78,10,2,10,2),(216,23,29,10,2,10,2),(217,24,64,11,1,1,1),(218,24,78,11,2,1,1),(219,24,4,11,2,1,2),(220,24,64,11,1,1,2),(221,24,78,11,2,1,2),(222,24,29,11,2,1,2),(223,24,21,13,1,1,2),(224,24,64,13,1,1,2),(225,24,78,13,2,1,2),(226,24,29,13,2,1,2),(227,24,64,10,1,7,1),(228,24,49,10,1,8,1),(229,24,72,10,1,9,1),(230,24,78,10,1,1,1),(231,24,4,10,1,1,2),(232,24,21,10,2,7,2),(233,24,49,10,1,8,2),(234,24,72,10,1,9,2),(235,24,78,10,2,10,2),(236,24,29,10,2,10,2),(237,25,65,11,1,1,1),(238,25,78,11,2,1,1),(239,25,4,11,2,1,2),(240,25,65,11,1,1,2),(241,25,78,11,2,1,2),(242,25,29,11,2,1,2),(243,25,21,13,1,1,2),(244,25,65,13,1,1,2),(245,25,78,13,2,1,2),(246,25,29,13,2,1,2),(247,25,65,10,1,7,1),(248,25,49,10,1,8,1),(249,25,72,10,1,9,1),(250,25,78,10,1,1,1),(251,25,4,10,1,1,2),(252,25,21,10,2,7,2),(253,25,49,10,1,8,2),(254,25,72,10,1,9,2),(255,25,78,10,2,10,2),(256,25,29,10,2,10,2),(257,26,66,11,1,1,1),(258,26,78,11,2,1,1),(259,26,4,11,2,1,2),(260,26,66,11,1,1,2),(261,26,78,11,2,1,2),(262,26,29,11,2,1,2),(263,26,21,13,1,1,2),(264,26,66,13,1,1,2),(265,26,78,13,2,1,2),(266,26,29,13,2,1,2),(267,26,66,10,1,7,1),(268,26,49,10,1,8,1),(269,26,72,10,1,9,1),(270,26,78,10,1,1,1),(271,26,4,10,1,1,2),(272,26,21,10,2,7,2),(273,26,49,10,1,8,2),(274,26,72,10,1,9,2),(275,26,78,10,2,10,2),(276,26,29,10,2,10,2),(277,27,67,11,1,1,1),(278,27,78,11,2,1,1),(279,27,4,11,2,1,2),(280,27,67,11,1,1,2),(281,27,78,11,2,1,2),(282,27,29,11,2,1,2),(283,27,21,13,1,1,2),(284,27,67,13,1,1,2),(285,27,78,13,2,1,2),(286,27,29,13,2,1,2),(287,27,67,10,1,7,1),(288,27,49,10,1,8,1),(289,27,72,10,1,9,1),(290,27,78,10,1,1,1),(291,27,4,10,1,1,2),(292,27,21,10,2,7,2),(293,27,49,10,1,8,2),(294,27,72,10,1,9,2),(295,27,78,10,2,10,2),(296,27,29,10,2,10,2),(297,28,68,14,1,1,1),(298,28,78,14,2,1,1),(299,28,4,14,2,1,2),(300,28,68,14,1,1,2),(301,28,78,14,2,1,2),(302,28,29,14,2,1,2),(303,29,68,14,2,1,1),(304,29,78,14,1,1,1),(305,29,4,14,1,1,2),(306,29,68,14,2,1,2),(307,29,78,14,1,1,2),(308,29,29,14,1,1,2),(309,30,69,11,1,1,1),(310,30,78,11,2,1,1),(311,30,4,11,2,1,2),(312,30,69,11,1,1,2),(313,30,78,11,2,1,2),(314,30,29,11,2,1,2),(315,30,21,13,1,1,2),(316,30,69,13,1,1,2),(317,30,78,13,2,1,2),(318,30,29,13,2,1,2),(319,30,69,10,1,7,1),(320,30,49,10,1,8,1),(321,30,72,10,1,9,1),(322,30,78,10,1,1,1),(323,30,4,10,1,1,2),(324,30,21,10,2,7,2),(325,30,49,10,1,8,2),(326,30,72,10,1,9,2),(327,30,78,10,2,10,2),(328,30,29,10,2,10,2),(329,31,74,11,1,1,1),(330,31,78,11,2,1,1),(331,31,4,11,2,1,2),(332,31,74,11,1,1,2),(333,31,78,11,2,1,2),(334,31,29,11,2,1,2),(335,31,21,13,1,1,2),(336,31,74,13,1,1,2),(337,31,78,13,2,1,2),(338,31,29,13,2,1,2),(339,31,74,10,1,7,1),(340,31,49,10,1,8,1),(341,31,72,10,1,9,1),(342,31,78,10,1,1,1),(343,31,4,10,1,1,2),(344,31,21,10,2,7,2),(345,31,49,10,1,8,2),(346,31,72,10,1,9,2),(347,31,78,10,2,10,2),(348,31,29,10,2,10,2),(349,32,58,11,1,1,1),(350,32,78,11,2,1,1),(351,32,4,11,2,1,2),(352,32,12,11,1,1,2),(353,32,21,13,2,1,2),(354,32,12,13,1,1,2),(355,32,58,10,1,7,1),(356,32,49,10,1,8,1),(357,32,72,10,1,9,1),(358,32,78,10,1,1,1),(359,32,4,10,1,1,2),(360,32,21,10,2,7,2),(361,32,49,10,1,8,2),(362,32,72,10,1,9,2),(363,32,78,10,2,10,2),(364,32,29,10,2,10,2),(365,33,59,11,1,1,1),(366,33,78,11,2,1,1),(367,33,4,11,2,1,2),(368,33,13,11,1,1,2),(369,33,21,13,2,1,2),(370,33,13,13,1,1,2),(371,33,59,10,1,7,1),(372,33,49,10,1,8,1),(373,33,72,10,1,9,1),(374,33,78,10,1,1,1),(375,33,4,10,1,1,2),(376,33,21,10,2,7,2),(377,33,49,10,1,8,2),(378,33,72,10,1,9,2),(379,33,78,10,2,10,2),(380,33,29,10,2,10,2),(381,34,60,11,1,1,1),(382,34,78,11,2,1,1),(383,34,4,11,2,1,2),(384,34,14,11,1,1,2),(385,34,21,13,2,1,2),(386,34,14,13,1,1,2),(387,34,60,10,1,7,1),(388,34,49,10,1,8,1),(389,34,72,10,1,9,1),(390,34,78,10,1,1,1),(391,34,4,10,1,1,2),(392,34,21,10,2,7,2),(393,34,49,10,1,8,2),(394,34,72,10,1,9,2),(395,34,78,10,2,10,2),(396,34,29,10,2,10,2),(397,35,4,16,1,4,2),(398,35,19,16,1,5,2),(399,35,20,16,2,6,2),(400,36,49,10,1,8,1),(401,36,72,10,1,9,1),(402,36,78,10,2,10,1),(403,36,4,10,2,1,2),(404,36,19,10,2,7,2),(405,36,49,10,1,8,2),(406,36,72,10,1,9,2),(407,36,78,10,2,10,2),(408,36,29,10,2,10,2),(409,37,65,10,1,7,1),(410,37,49,10,1,8,1),(411,37,72,10,1,9,1),(412,37,78,10,2,1,1),(413,37,4,10,2,1,2),(414,37,19,10,2,7,2),(415,37,20,10,1,7,2),(416,37,65,10,1,7,2),(417,37,49,10,1,8,2),(418,37,72,10,1,9,2),(419,37,78,10,2,1,2),(420,37,29,10,2,1,2),(421,38,51,11,1,1,1),(422,38,78,11,1,1,1),(423,38,4,11,1,1,2),(424,38,51,11,1,1,2),(425,38,78,11,1,1,2),(426,38,30,11,1,1,2),(427,38,7,12,1,1,2),(428,38,51,12,1,1,2),(429,38,78,12,1,1,2),(430,38,30,12,1,1,2),(431,38,51,9,1,7,1),(432,38,71,9,1,8,1),(433,38,50,9,1,9,1),(434,38,78,9,1,1,1),(435,38,4,9,1,1,2),(436,38,7,9,2,7,2),(437,38,71,9,1,8,2),(438,38,50,9,1,9,2),(439,38,78,9,1,10,2),(440,38,29,9,1,10,2),(441,39,73,11,1,1,1),(442,39,78,11,2,1,1),(443,39,4,11,2,1,2),(444,39,73,11,1,1,2),(445,39,78,11,2,1,2),(446,39,30,11,2,1,2),(447,39,21,13,1,1,2),(448,39,73,13,1,1,2),(449,39,78,13,2,1,2),(450,39,30,13,2,1,2),(451,39,73,10,1,7,1),(452,39,49,10,1,8,1),(453,39,72,10,1,9,1),(454,39,78,10,1,1,1),(455,39,4,10,1,1,2),(456,39,21,10,2,7,2),(457,39,49,10,1,8,2),(458,39,72,10,1,9,2),(459,39,78,10,2,10,2),(460,39,29,10,2,10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_resultado`
--

LOCK TABLES `centro_resultado` WRITE;
/*!40000 ALTER TABLE `centro_resultado` DISABLE KEYS */;
INSERT INTO `centro_resultado` VALUES (1,'Centro de Resultado','',1,0);
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
INSERT INTO `centro_resultado_empresa` VALUES (1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (2,3,1,3,2,9,NULL,'2022-12-14',1,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,2),(3,3,2,3,2,9,NULL,'2022-12-14',1,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,3),(4,3,3,3,2,9,NULL,'2022-12-15',1,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,4),(5,3,4,3,2,9,NULL,'2022-12-15',2,2,250.00,250.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_item`
--

LOCK TABLES `compra_item` WRITE;
/*!40000 ALTER TABLE `compra_item` DISABLE KEYS */;
INSERT INTO `compra_item` VALUES (2,2,1,NULL,NULL,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,NULL,2),(3,3,1,NULL,NULL,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,NULL,3),(4,4,1,NULL,NULL,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0.00,NULL,4),(5,5,1,NULL,NULL,1,1.0000,250.0000,250.00,250.00,0.00,0.00,0.00,0.00,0.00,NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
INSERT INTO `configuracao` VALUES (3,0,0,0,'','',0.00,NULL,NULL,NULL,0.0000,0,0,0.0000,0,0,0,0.0000,0,0,NULL,0,0,0,0,1,3,'','',0,NULL,NULL,0,0,0,'',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `conta` VALUES (1,3,1,0,'Caixa interno',1,-450.00,0.00,'2022-11-30','','','',NULL,1,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (4,3,'202212',-100.00,2),(9,3,'202212',350.00,2),(18,3,'202212',250.00,2),(56,3,'202212',100.00,1),(78,3,'202212',-100.00,1);
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
INSERT INTO `conta_saldo` VALUES (1,'2022-12-14',-100.00),(1,'2022-12-15',-350.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda`
--

LOCK TABLES `devolucao_venda` WRITE;
/*!40000 ALTER TABLE `devolucao_venda` DISABLE KEYS */;
INSERT INTO `devolucao_venda` VALUES (1,3,1,'2022-12-13 20:32:58',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(2,3,2,'2022-12-13 20:35:22',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(3,3,3,'2022-12-13 21:12:59',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(4,3,4,'2022-12-13 21:14:50',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(5,3,10,'2022-12-13 21:17:02',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(6,3,10,'2022-12-13 21:18:38',2,NULL,450.00,450.00,0.00,0.00,0.00,0.00,1,1,NULL,2),(7,3,11,'2022-12-13 22:11:59',2,NULL,100.00,100.00,0.00,0.00,0.00,0.00,1,1,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao_venda_item`
--

LOCK TABLES `devolucao_venda_item` WRITE;
/*!40000 ALTER TABLE `devolucao_venda_item` DISABLE KEYS */;
INSERT INTO `devolucao_venda_item` VALUES (1,1,1,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL),(2,2,2,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL),(3,3,3,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL),(4,4,4,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL),(5,5,11,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL),(6,6,10,1,NULL,NULL,1,2.5000,60.0000,100.0000,250.00,250.00,0.00,0.00,0.00,0.00,1,NULL),(7,6,11,1,NULL,NULL,2,2.0000,60.0000,100.0000,200.00,200.00,0.00,0.00,0.00,0.00,1,NULL),(8,7,12,1,NULL,NULL,1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,1,NULL);
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
INSERT INTO `empresa` VALUES (3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2022-12-01','Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,2,'2022-12-12 17:05:19',1000.00,0.00,100.00,1100.00,5,10,'2023-01-10 00:00:00',1),(2,1,2,'2022-12-12 17:45:11',100.00,0.00,10.00,110.00,2,5,'2023-01-05 00:00:00',1),(3,1,2,'2022-12-12 17:48:13',100.00,0.00,10.00,110.00,2,5,'2023-01-05 00:00:00',0),(4,1,2,'2022-12-12 17:52:14',100.00,0.00,10.00,110.00,2,5,'2023-01-05 00:00:00',0),(5,1,2,'2022-12-12 17:54:20',50.00,0.00,5.00,55.00,2,5,'2023-01-05 00:00:00',1),(6,1,2,'2022-12-12 17:56:23',100.00,0.00,10.00,110.00,1,5,'2023-01-05 00:00:00',1),(7,1,2,'2022-12-12 17:58:19',100.00,0.00,10.00,110.00,1,5,'2023-01-05 00:00:00',0),(8,1,2,'2022-12-12 18:38:34',100.00,0.00,10.00,110.00,2,5,'2023-01-05 00:00:00',0),(9,1,2,'2022-12-12 19:40:22',1000.00,20.00,100.00,1100.00,2,5,'2023-01-05 00:00:00',0),(10,1,2,'2022-12-12 19:45:41',200.00,13.00,20.00,220.00,2,5,'2023-01-05 00:00:00',0),(11,1,2,'2022-12-12 19:47:26',15000.00,53.00,1000.00,16000.00,2,5,'2023-01-05 00:00:00',0),(12,1,2,'2022-12-14 12:23:57',1000.00,0.00,100.00,1100.00,1,5,'2023-01-05 00:00:00',1),(13,1,2,'2022-12-14 12:33:29',1000.00,0.00,100.00,1100.00,1,5,'2023-01-05 00:00:00',1),(14,1,2,'2022-12-14 12:41:17',1000.00,20.00,100.00,1100.00,1,5,'2023-01-05 00:00:00',1),(15,1,2,'2022-12-14 13:31:44',1000.00,20.00,100.00,1100.00,1,5,'2023-01-05 00:00:00',1);
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
INSERT INTO `emprestimo_categoria` VALUES (1,225,1),(1,162,2),(1,226,3),(1,227,4),(2,225,1),(2,162,2),(2,226,3),(2,227,4),(3,225,1),(3,162,2),(3,226,3),(3,227,4),(4,225,1),(4,162,2),(4,226,3),(4,227,4),(5,225,1),(5,162,2),(5,226,3),(5,227,4),(6,225,1),(6,162,2),(6,226,3),(6,227,4),(7,225,1),(7,162,2),(7,226,3),(7,227,4),(8,225,1),(8,162,2),(8,226,3),(8,227,4),(9,225,1),(9,162,2),(9,226,3),(9,227,4),(10,225,1),(10,162,2),(10,226,3),(10,227,4),(11,225,1),(11,162,2),(11,226,3),(11,227,4),(12,225,1),(12,162,2),(12,226,3),(12,227,4),(13,225,1),(13,162,2),(13,226,3),(13,227,4),(14,225,1),(14,162,2),(14,226,3),(14,227,4),(15,225,1),(15,162,2),(15,226,3),(15,227,4);
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
INSERT INTO `estoque` VALUES (1,'Loja','','','','','','','','','','2022-12-01 20:57:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-12-01 20:54:55'),(2,2,'Cheque',1,2,2,1,0,1,'2022-12-01 20:54:55'),(3,3,'Cartão',1,3,3,0,0,0,'2022-12-01 20:54:55'),(4,4,'Crediário',2,4,99,0,0,0,'2022-12-01 20:54:55'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-12-01 20:54:55'),(6,6,'PIX',1,6,17,0,0,1,'2022-12-01 20:54:55');
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
INSERT INTO `forma_pagamento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-12-01 20:54:54',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(2,NULL,'2022-12-01 20:54:54',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(03) 7998-6531\",\"[identificacao]\":\"(03) 7998-6531\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(3,NULL,'2022-12-01 20:54:54',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Almirante Tamandaré\",\"[identificacao]\":\"Av. Almirante Tamandaré\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(4,NULL,'2022-12-01 20:54:54',1,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Informa que não tem estoque e não permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(5,NULL,'2022-12-01 20:54:54',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(6,NULL,'2022-12-01 20:54:54',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(7,NULL,'2022-12-01 20:54:54',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(8,NULL,'2022-12-01 20:54:54',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(9,NULL,'2022-12-01 20:54:54',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(10,NULL,'2022-12-01 20:54:54',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(11,NULL,'2022-12-01 20:54:54',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(12,NULL,'2022-12-01 20:54:54',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(13,NULL,'2022-12-01 20:54:54',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(14,NULL,'2022-12-01 20:54:54',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(15,NULL,'2022-12-01 20:54:54',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(16,NULL,'2022-12-01 20:54:54',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(17,NULL,'2022-12-01 20:54:54',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(18,NULL,'2022-12-01 20:54:54',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(19,NULL,'2022-12-01 20:54:54',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(20,NULL,'2022-12-01 20:54:54',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(21,NULL,'2022-12-01 20:54:54',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(22,NULL,'2022-12-01 20:54:54',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(23,NULL,'2022-12-01 20:54:54',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(24,NULL,'2022-12-01 20:54:54',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(25,NULL,'2022-12-01 20:54:54',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(26,NULL,'2022-12-01 20:54:54',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(27,NULL,'2022-12-01 20:54:54',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(28,NULL,'2022-12-01 20:54:54',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(29,NULL,'2022-12-01 20:54:54',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(30,NULL,'2022-12-01 20:54:54',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(31,NULL,'2022-12-01 20:54:54',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(32,NULL,'2022-12-01 20:54:54',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(33,NULL,'2022-12-01 20:54:54',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(34,NULL,'2022-12-01 20:54:54',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(35,NULL,'2022-12-01 20:54:54',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(36,NULL,'2022-12-01 20:54:54',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(37,NULL,'2022-12-01 20:54:54',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(38,NULL,'2022-12-01 20:54:54',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(39,NULL,'2022-12-01 20:54:54',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(40,NULL,'2022-12-01 20:54:54',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(41,NULL,'2022-12-01 20:54:54',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(42,NULL,'2022-12-01 20:54:54',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(43,NULL,'2022-12-01 20:54:54',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(44,NULL,'2022-12-01 20:54:54',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(45,NULL,'2022-12-01 20:54:54',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(46,NULL,'2022-12-01 20:54:54',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(47,NULL,'2022-12-01 20:54:54',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(48,NULL,'2022-12-01 20:54:54',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(49,NULL,'2022-12-01 20:54:54',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(50,NULL,'2022-12-01 20:54:54',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(51,NULL,'2022-12-01 20:54:54',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(52,NULL,'2022-12-01 20:54:54',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(53,NULL,'2022-12-01 20:54:54',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(54,NULL,'2022-12-01 20:54:54',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(55,NULL,'2022-12-01 20:54:54',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(56,NULL,'2022-12-01 20:54:54',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(57,NULL,'2022-12-01 20:54:54',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(58,NULL,'2022-12-01 20:54:54',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(59,NULL,'2022-12-01 20:54:54',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(60,NULL,'2022-12-01 20:54:54',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(61,NULL,'2022-12-01 20:54:54',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(62,NULL,'2022-12-01 20:54:54',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(63,NULL,'2022-12-01 20:54:54',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(64,NULL,'2022-12-01 20:54:54',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(65,NULL,'2022-12-01 20:54:54',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(66,NULL,'2022-12-01 20:54:54',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(67,NULL,'2022-12-01 20:54:54',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(68,NULL,'2022-12-01 20:54:54',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(69,NULL,'2022-12-01 20:54:54',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(70,NULL,'2022-12-01 20:54:54',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(71,NULL,'2022-12-01 20:54:54',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(72,NULL,'2022-12-01 20:54:54',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(73,NULL,'2022-12-01 20:54:54',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(74,NULL,'2022-12-01 20:54:54',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(75,NULL,'2022-12-01 20:54:54',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(76,NULL,'2022-12-01 20:54:54',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(77,NULL,'2022-12-01 20:54:54',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(78,NULL,'2022-12-01 20:54:54',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(79,NULL,'2022-12-01 20:54:54',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(80,NULL,'2022-12-01 20:54:54',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(81,NULL,'2022-12-01 20:54:54',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(82,NULL,'2022-12-01 20:54:54',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(83,NULL,'2022-12-01 20:54:54',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(84,NULL,'2022-12-01 20:54:54',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(85,NULL,'2022-12-01 20:54:54',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(86,NULL,'2022-12-01 20:54:54',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(87,NULL,'2022-12-01 20:54:54',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(88,NULL,'2022-12-01 20:54:54',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(89,NULL,'2022-12-01 20:54:54',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(90,NULL,'2022-12-01 20:54:54',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(91,NULL,'2022-12-01 20:54:54',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(92,NULL,'2022-12-01 20:54:54',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(93,NULL,'2022-12-01 20:54:54',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(94,NULL,'2022-12-01 20:54:54',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(95,NULL,'2022-12-01 20:54:54',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(96,NULL,'2022-12-01 20:54:54',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(97,NULL,'2022-12-01 20:54:55',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(98,NULL,'2022-12-01 20:54:55',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(99,NULL,'2022-12-01 20:54:55',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(100,NULL,'2022-12-01 20:54:55',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(101,NULL,'2022-12-01 20:54:55',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(102,NULL,'2022-12-01 20:54:55',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(103,NULL,'2022-12-01 20:54:55',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(104,NULL,'2022-12-01 20:54:55',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(105,NULL,'2022-12-01 20:54:55',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(106,NULL,'2022-12-01 20:54:55',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(107,NULL,'2022-12-01 20:54:55',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(108,NULL,'2022-12-01 20:54:55',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(109,NULL,'2022-12-01 20:54:55',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(110,NULL,'2022-12-01 20:54:55',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(111,NULL,'2022-12-01 20:54:55',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(112,NULL,'2022-12-01 20:54:55',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(113,NULL,'2022-12-01 20:54:55',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(114,NULL,'2022-12-01 20:54:55',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(115,NULL,'2022-12-01 20:54:55',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(116,NULL,'2022-12-01 20:54:55',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(117,NULL,'2022-12-01 20:54:55',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(118,NULL,'2022-12-01 20:54:55',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(119,NULL,'2022-12-01 20:54:55',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(120,NULL,'2022-12-01 20:54:55',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(121,NULL,'2022-12-01 20:54:55',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(122,NULL,'2022-12-01 20:54:55',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(123,NULL,'2022-12-01 20:54:55',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(124,NULL,'2022-12-01 20:54:55',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(125,NULL,'2022-12-01 20:54:55',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(126,NULL,'2022-12-01 20:54:55',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(127,NULL,'2022-12-01 20:54:55',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(128,NULL,'2022-12-01 20:54:55',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(129,NULL,'2022-12-01 20:54:55',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(130,NULL,'2022-12-01 20:54:55',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(131,NULL,'2022-12-01 20:54:55',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(132,NULL,'2022-12-01 20:54:55',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(133,NULL,'2022-12-01 20:54:55',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(134,NULL,'2022-12-01 20:54:55',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(135,NULL,'2022-12-01 20:54:55',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(136,NULL,'2022-12-01 20:54:55',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(137,NULL,'2022-12-01 20:54:55',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(138,NULL,'2022-12-01 20:54:55',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(139,NULL,'2022-12-01 20:54:55',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(140,NULL,'2022-12-01 20:54:55',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(141,NULL,'2022-12-01 20:54:55',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"30/11/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(142,1,'2022-12-01 20:56:03',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(143,1,'2022-12-01 20:56:21',1,32,2,'{\"Comissão\":\"0,00\",\"ID\":\"2\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(144,1,'2022-12-01 20:56:40',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Geral\",\"[identificacao]\":\"Geral\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(145,1,'2022-12-01 20:56:47',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UND\",\"[identificacao]\":\"UND\",\"Nome\":\"Unidade\",\"Fraciona\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(146,1,'2022-12-01 20:56:54',1,12,1,'{\"ID\":\"1\",\"Nome\":\"Produto\",\"[identificacao]\":\"Produto\",\"Descrição\":\"Produto\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(147,1,'2022-12-12 17:01:15',2,9,2,'{\"Tipo pessoa\":\"Pessoa Física\",\"ID\":\"2\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(148,1,'2022-12-12 17:03:16',1,8,225,'{\"ID\":\"225\",\"Código\":\"5.1.01.001\",\"Nome\":\"Tomada de Empréstimo\",\"[identificacao]\":\"Tomada de Empréstimo\",\"Grupo\":35,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(149,1,'2022-12-12 17:03:35',1,8,226,'{\"ID\":\"226\",\"Código\":\"5.1.02.001\",\"Nome\":\"Pagamento de Empréstimo\",\"[identificacao]\":\"Pagamento de Empréstimo\",\"Grupo\":36,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(150,1,'2022-12-12 17:03:57',1,8,227,'{\"ID\":\"227\",\"Código\":\"5.1.03.001\",\"Nome\":\"Pagamento de Juros de Empréstimo\",\"[identificacao]\":\"Pagamento de Juros de Empréstimo\",\"Grupo\":37,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(151,1,'2022-12-12 17:05:19',1,8,226,'{\"ID\":226}',16,1,'{\"ID\":\"1\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"01/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(152,1,'2022-12-12 17:05:19',1,8,227,'{\"ID\":227}',16,1,'{\"ID\":\"1\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"01/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(153,1,'2022-12-12 17:05:19',1,8,226,'{\"ID\":226}',16,2,'{\"ID\":\"2\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000002\",\"[identificacao]\":\"0000000002\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"02/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(154,1,'2022-12-12 17:05:19',1,8,227,'{\"ID\":227}',16,2,'{\"ID\":\"2\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000002\",\"[identificacao]\":\"0000000002\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"02/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(155,1,'2022-12-12 17:05:19',1,8,226,'{\"ID\":226}',16,3,'{\"ID\":\"3\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000003\",\"[identificacao]\":\"0000000003\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"03/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(156,1,'2022-12-12 17:05:19',1,8,227,'{\"ID\":227}',16,3,'{\"ID\":\"3\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000003\",\"[identificacao]\":\"0000000003\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"03/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(157,1,'2022-12-12 17:05:19',1,8,226,'{\"ID\":226}',16,4,'{\"ID\":\"4\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000004\",\"[identificacao]\":\"0000000004\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"04/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(158,1,'2022-12-12 17:05:19',1,8,227,'{\"ID\":227}',16,4,'{\"ID\":\"4\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000004\",\"[identificacao]\":\"0000000004\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"04/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(159,1,'2022-12-12 17:05:19',1,8,226,'{\"ID\":226}',16,5,'{\"ID\":\"5\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000005\",\"[identificacao]\":\"0000000005\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"05/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(160,1,'2022-12-12 17:05:19',1,8,227,'{\"ID\":227}',16,5,'{\"ID\":\"5\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000005\",\"[identificacao]\":\"0000000005\",\"Emprestimo\":1,\"Emissão\":\"12/12/2022 17:05:19\",\"Vencimento\":\"05/10/2023\",\"Pagamento\":\"\",\"Valor\":\"220,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"220,00\",\"Valor em aberto\":\"220,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(161,1,'2022-12-12 17:05:19',1,133,1,'{\"Conta\":1,\"ID\":\"1\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(162,1,'2022-12-12 17:42:41',3,133,1,'{\"Conta\":1,\"ID\":\"1\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(163,1,'2022-12-12 17:45:11',1,8,226,'{\"ID\":226}',16,6,'{\"ID\":\"6\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000006\",\"[identificacao]\":\"0000000006\",\"Emprestimo\":2,\"Emissão\":\"12/12/2022 17:45:10\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(164,1,'2022-12-12 17:45:11',1,8,227,'{\"ID\":227}',16,6,'{\"ID\":\"6\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000006\",\"[identificacao]\":\"0000000006\",\"Emprestimo\":2,\"Emissão\":\"12/12/2022 17:45:10\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(165,1,'2022-12-12 17:45:11',1,8,226,'{\"ID\":226}',16,7,'{\"ID\":\"7\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":2,\"Emissão\":\"12/12/2022 17:45:10\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(166,1,'2022-12-12 17:45:11',1,8,227,'{\"ID\":227}',16,7,'{\"ID\":\"7\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emprestimo\":2,\"Emissão\":\"12/12/2022 17:45:10\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(167,1,'2022-12-12 17:45:11',1,133,2,'{\"Conta\":1,\"ID\":\"2\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(168,1,'2022-12-12 17:45:24',3,133,2,'{\"Conta\":1,\"ID\":\"2\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(169,1,'2022-12-12 17:49:56',1,8,226,'{\"ID\":226}',16,8,'{\"ID\":\"8\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000008\",\"[identificacao]\":\"0000000008\",\"Emprestimo\":3,\"Emissão\":\"12/12/2022 17:49:42\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(170,1,'2022-12-12 17:49:56',1,8,227,'{\"ID\":227}',16,8,'{\"ID\":\"8\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000008\",\"[identificacao]\":\"0000000008\",\"Emprestimo\":3,\"Emissão\":\"12/12/2022 17:49:42\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(171,1,'2022-12-12 17:50:22',1,8,226,'{\"ID\":226}',16,9,'{\"ID\":\"9\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000009\",\"[identificacao]\":\"0000000009\",\"Emprestimo\":3,\"Emissão\":\"12/12/2022 17:49:58\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(172,1,'2022-12-12 17:50:26',1,8,227,'{\"ID\":227}',16,9,'{\"ID\":\"9\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000009\",\"[identificacao]\":\"0000000009\",\"Emprestimo\":3,\"Emissão\":\"12/12/2022 17:49:58\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(173,1,'2022-12-12 17:50:45',1,133,3,'{\"Conta\":1,\"ID\":\"3\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(174,1,'2022-12-12 17:52:26',1,8,226,'{\"ID\":226}',16,10,'{\"ID\":\"10\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000010\",\"[identificacao]\":\"0000000010\",\"Emprestimo\":4,\"Emissão\":\"12/12/2022 17:52:25\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(175,1,'2022-12-12 17:52:26',1,8,227,'{\"ID\":227}',16,10,'{\"ID\":\"10\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000010\",\"[identificacao]\":\"0000000010\",\"Emprestimo\":4,\"Emissão\":\"12/12/2022 17:52:25\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(176,1,'2022-12-12 17:52:26',1,8,226,'{\"ID\":226}',16,11,'{\"ID\":\"11\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000011\",\"[identificacao]\":\"0000000011\",\"Emprestimo\":4,\"Emissão\":\"12/12/2022 17:52:25\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(177,1,'2022-12-12 17:52:26',1,8,227,'{\"ID\":227}',16,11,'{\"ID\":\"11\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000011\",\"[identificacao]\":\"0000000011\",\"Emprestimo\":4,\"Emissão\":\"12/12/2022 17:52:25\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(178,1,'2022-12-12 17:52:26',1,133,4,'{\"Conta\":1,\"ID\":\"4\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(179,1,'2022-12-12 17:54:20',1,8,226,'{\"ID\":226}',16,12,'{\"ID\":\"12\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000012\",\"[identificacao]\":\"0000000012\",\"Emprestimo\":5,\"Emissão\":\"12/12/2022 17:54:20\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"27,50\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"27,50\",\"Valor em aberto\":\"27,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(180,1,'2022-12-12 17:54:20',1,8,227,'{\"ID\":227}',16,12,'{\"ID\":\"12\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000012\",\"[identificacao]\":\"0000000012\",\"Emprestimo\":5,\"Emissão\":\"12/12/2022 17:54:20\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"27,50\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"27,50\",\"Valor em aberto\":\"27,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(181,1,'2022-12-12 17:54:20',1,8,226,'{\"ID\":226}',16,13,'{\"ID\":\"13\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000013\",\"[identificacao]\":\"0000000013\",\"Emprestimo\":5,\"Emissão\":\"12/12/2022 17:54:20\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"27,50\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"27,50\",\"Valor em aberto\":\"27,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(182,1,'2022-12-12 17:54:20',1,8,227,'{\"ID\":227}',16,13,'{\"ID\":\"13\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000013\",\"[identificacao]\":\"0000000013\",\"Emprestimo\":5,\"Emissão\":\"12/12/2022 17:54:20\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"27,50\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"27,50\",\"Valor em aberto\":\"27,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(183,1,'2022-12-12 17:54:20',1,133,5,'{\"Conta\":1,\"ID\":\"5\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(184,1,'2022-12-12 17:55:38',3,133,5,'{\"Conta\":1,\"ID\":\"5\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(185,1,'2022-12-12 17:56:23',1,8,226,'{\"ID\":226}',16,14,'{\"ID\":\"14\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000014\",\"[identificacao]\":\"0000000014\",\"Emprestimo\":6,\"Emissão\":\"12/12/2022 17:56:22\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(186,1,'2022-12-12 17:56:23',1,8,227,'{\"ID\":227}',16,14,'{\"ID\":\"14\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000014\",\"[identificacao]\":\"0000000014\",\"Emprestimo\":6,\"Emissão\":\"12/12/2022 17:56:22\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(187,1,'2022-12-12 17:56:23',1,133,6,'{\"Conta\":1,\"ID\":\"6\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(188,1,'2022-12-12 17:57:08',3,133,6,'{\"Conta\":1,\"ID\":\"6\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(189,1,'2022-12-12 17:58:20',1,8,226,'{\"ID\":226}',16,15,'{\"ID\":\"15\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000015\",\"[identificacao]\":\"0000000015\",\"Emprestimo\":7,\"Emissão\":\"12/12/2022 17:58:19\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(190,1,'2022-12-12 17:58:20',1,8,227,'{\"ID\":227}',16,15,'{\"ID\":\"15\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000015\",\"[identificacao]\":\"0000000015\",\"Emprestimo\":7,\"Emissão\":\"12/12/2022 17:58:19\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(191,1,'2022-12-12 17:58:20',1,133,7,'{\"Conta\":1,\"ID\":\"7\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(192,1,'2022-12-12 18:38:34',1,8,226,'{\"ID\":226}',16,16,'{\"ID\":\"16\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000016\",\"[identificacao]\":\"0000000016\",\"Emprestimo\":8,\"Emissão\":\"12/12/2022 18:38:34\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(193,1,'2022-12-12 18:38:34',1,8,227,'{\"ID\":227}',16,16,'{\"ID\":\"16\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000016\",\"[identificacao]\":\"0000000016\",\"Emprestimo\":8,\"Emissão\":\"12/12/2022 18:38:34\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(194,1,'2022-12-12 18:38:34',1,8,226,'{\"ID\":226}',16,17,'{\"ID\":\"17\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000017\",\"[identificacao]\":\"0000000017\",\"Emprestimo\":8,\"Emissão\":\"12/12/2022 18:38:34\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(195,1,'2022-12-12 18:38:34',1,8,227,'{\"ID\":227}',16,17,'{\"ID\":\"17\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000017\",\"[identificacao]\":\"0000000017\",\"Emprestimo\":8,\"Emissão\":\"12/12/2022 18:38:34\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"55,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"55,00\",\"Valor em aberto\":\"55,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(196,1,'2022-12-12 18:38:34',1,133,8,'{\"Conta\":1,\"ID\":\"8\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(197,1,'2022-12-12 19:40:22',1,8,226,'{\"ID\":226}',16,18,'{\"ID\":\"18\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000018\",\"[identificacao]\":\"0000000018\",\"Emprestimo\":9,\"Emissão\":\"12/12/2022 19:40:22\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"550,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"550,00\",\"Valor em aberto\":\"550,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(198,1,'2022-12-12 19:40:22',1,8,227,'{\"ID\":227}',16,18,'{\"ID\":\"18\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000018\",\"[identificacao]\":\"0000000018\",\"Emprestimo\":9,\"Emissão\":\"12/12/2022 19:40:22\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"550,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"550,00\",\"Valor em aberto\":\"550,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(199,1,'2022-12-12 19:40:22',1,8,226,'{\"ID\":226}',16,19,'{\"ID\":\"19\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000019\",\"[identificacao]\":\"0000000019\",\"Emprestimo\":9,\"Emissão\":\"12/12/2022 19:40:22\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"550,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"550,00\",\"Valor em aberto\":\"550,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(200,1,'2022-12-12 19:40:22',1,8,227,'{\"ID\":227}',16,19,'{\"ID\":\"19\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000019\",\"[identificacao]\":\"0000000019\",\"Emprestimo\":9,\"Emissão\":\"12/12/2022 19:40:22\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"550,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"550,00\",\"Valor em aberto\":\"550,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(201,1,'2022-12-12 19:40:22',1,133,9,'{\"Conta\":1,\"ID\":\"9\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(202,1,'2022-12-12 19:45:41',1,8,226,'{\"ID\":226}',16,20,'{\"ID\":\"20\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000020\",\"[identificacao]\":\"0000000020\",\"Emprestimo\":10,\"Emissão\":\"12/12/2022 19:45:40\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(203,1,'2022-12-12 19:45:41',1,8,227,'{\"ID\":227}',16,20,'{\"ID\":\"20\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000020\",\"[identificacao]\":\"0000000020\",\"Emprestimo\":10,\"Emissão\":\"12/12/2022 19:45:40\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(204,1,'2022-12-12 19:45:41',1,8,226,'{\"ID\":226}',16,21,'{\"ID\":\"21\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000021\",\"[identificacao]\":\"0000000021\",\"Emprestimo\":10,\"Emissão\":\"12/12/2022 19:45:40\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(205,1,'2022-12-12 19:45:41',1,8,227,'{\"ID\":227}',16,21,'{\"ID\":\"21\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000021\",\"[identificacao]\":\"0000000021\",\"Emprestimo\":10,\"Emissão\":\"12/12/2022 19:45:40\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"110,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"110,00\",\"Valor em aberto\":\"110,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(206,1,'2022-12-12 19:45:41',1,133,10,'{\"Conta\":1,\"ID\":\"10\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(207,1,'2022-12-12 19:47:26',1,8,226,'{\"ID\":226}',16,22,'{\"ID\":\"22\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000022\",\"[identificacao]\":\"0000000022\",\"Emprestimo\":11,\"Emissão\":\"12/12/2022 19:47:26\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"8000,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"8000,00\",\"Valor em aberto\":\"8000,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(208,1,'2022-12-12 19:47:26',1,8,227,'{\"ID\":227}',16,22,'{\"ID\":\"22\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000022\",\"[identificacao]\":\"0000000022\",\"Emprestimo\":11,\"Emissão\":\"12/12/2022 19:47:26\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"8000,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"8000,00\",\"Valor em aberto\":\"8000,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(209,1,'2022-12-12 19:47:26',1,8,226,'{\"ID\":226}',16,23,'{\"ID\":\"23\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000023\",\"[identificacao]\":\"0000000023\",\"Emprestimo\":11,\"Emissão\":\"12/12/2022 19:47:26\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"8000,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"8000,00\",\"Valor em aberto\":\"8000,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(210,1,'2022-12-12 19:47:26',1,8,227,'{\"ID\":227}',16,23,'{\"ID\":\"23\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000023\",\"[identificacao]\":\"0000000023\",\"Emprestimo\":11,\"Emissão\":\"12/12/2022 19:47:26\",\"Vencimento\":\"02/05/2023\",\"Pagamento\":\"\",\"Valor\":\"8000,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"8000,00\",\"Valor em aberto\":\"8000,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(211,1,'2022-12-12 19:47:26',1,133,11,'{\"Conta\":1,\"ID\":\"11\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(212,1,'2022-12-13 22:13:44',1,29,2,'{\"ID\":\"2\",\"Nome\":\"Serviço\",\"[identificacao]\":\"Serviço\",\"Descrição\":\"Serviço externo\",\"Grupo\":1,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"250,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(213,1,'2022-12-14 12:24:05',1,8,226,'{\"ID\":226}',16,24,'{\"ID\":\"24\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000024\",\"[identificacao]\":\"0000000024\",\"Emprestimo\":12,\"Emissão\":\"14/12/2022 12:24:05\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(214,1,'2022-12-14 12:24:05',1,8,227,'{\"ID\":227}',16,24,'{\"ID\":\"24\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000024\",\"[identificacao]\":\"0000000024\",\"Emprestimo\":12,\"Emissão\":\"14/12/2022 12:24:05\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(215,1,'2022-12-14 12:24:05',1,133,12,'{\"Conta\":1,\"ID\":\"12\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(216,1,'2022-12-14 12:31:16',3,133,12,'{\"Conta\":1,\"ID\":\"12\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(217,1,'2022-12-14 12:33:29',1,8,226,'{\"ID\":226}',16,25,'{\"ID\":\"25\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000025\",\"[identificacao]\":\"0000000025\",\"Emprestimo\":13,\"Emissão\":\"14/12/2022 12:33:28\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(218,1,'2022-12-14 12:33:29',1,8,227,'{\"ID\":227}',16,25,'{\"ID\":\"25\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000025\",\"[identificacao]\":\"0000000025\",\"Emprestimo\":13,\"Emissão\":\"14/12/2022 12:33:28\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(219,1,'2022-12-14 12:33:29',1,133,13,'{\"Conta\":1,\"ID\":\"13\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(220,1,'2022-12-14 12:39:55',3,133,13,'{\"Conta\":1,\"ID\":\"13\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(221,1,'2022-12-14 12:41:17',1,8,226,'{\"ID\":226}',16,26,'{\"ID\":\"26\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000026\",\"[identificacao]\":\"0000000026\",\"Emprestimo\":14,\"Emissão\":\"14/12/2022 12:41:17\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(222,1,'2022-12-14 12:41:17',1,8,227,'{\"ID\":227}',16,26,'{\"ID\":\"26\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000026\",\"[identificacao]\":\"0000000026\",\"Emprestimo\":14,\"Emissão\":\"14/12/2022 12:41:17\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(223,1,'2022-12-14 12:41:17',1,133,14,'{\"Conta\":1,\"ID\":\"14\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(224,1,'2022-12-14 12:46:00',3,133,14,'{\"Conta\":1,\"ID\":\"14\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(225,1,'2022-12-14 13:31:44',1,8,226,'{\"ID\":226}',16,27,'{\"ID\":\"27\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000027\",\"[identificacao]\":\"0000000027\",\"Emprestimo\":15,\"Emissão\":\"14/12/2022 13:31:43\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(226,1,'2022-12-14 13:31:44',1,8,227,'{\"ID\":227}',16,27,'{\"ID\":\"27\",\"Fornecedor\":2,\"Conta\":1,\"Documento\":\"0000000027\",\"[identificacao]\":\"0000000027\",\"Emprestimo\":15,\"Emissão\":\"14/12/2022 13:31:43\",\"Vencimento\":\"01/05/2023\",\"Pagamento\":\"\",\"Valor\":\"1100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"1100,00\",\"Valor em aberto\":\"1100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(227,1,'2022-12-14 13:31:44',1,133,15,'{\"Conta\":1,\"ID\":\"15\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(228,1,'2022-12-14 13:32:04',3,133,15,'{\"Conta\":1,\"ID\":\"15\",\"Fornecedor\":2,\"EmpresaEspecificaId\":3}',0,0,''),(229,1,'2022-12-14 17:03:18',2,27,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(230,1,'2022-12-14 17:10:47',1,27,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"12/03/1995\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(231,1,'2022-12-14 17:12:19',1,37,1,'{\"ID\":\"1\",\"Cliente\":3,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emissão\":\"14/12/2022\",\"Vencimento\":\"14/01/2023\",\"Pagamento\":\"\",\"Valor\":\"100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(232,1,'2022-12-14 17:12:19',1,8,111,'{\"ID\":111}',37,1,'{\"ID\":\"1\",\"Cliente\":3,\"Conta\":1,\"Documento\":\"0000000001\",\"[identificacao]\":\"0000000001\",\"Emissão\":\"14/12/2022\",\"Vencimento\":\"14/01/2023\",\"Pagamento\":\"\",\"Valor\":\"100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"100,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(233,1,'2022-12-14 17:13:05',1,38,1,'{\"ID\":\"1\",\"Conta\":1,\"Data recebimento\":\"14/12/2022\",\"Valor\":\"100,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"100,00\",\"[identificacao]\":\"100,00\",\"EmpresaEspecificaId\":3}',0,0,''),(234,1,'2022-12-15 14:46:23',1,42,1,'{\"ID\":\"1\",\"Nome\":\"Centro de Resultado\",\"[identificacao]\":\"Centro de Resultado\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(122,3),(123,3),(124,3),(125,3),(126,3),(127,3),(128,3),(129,3),(130,3),(131,3),(132,3),(133,3),(134,3),(135,3),(136,3),(137,3),(138,3),(139,3),(140,3),(141,3),(142,3),(143,3),(144,3),(145,3),(146,3),(147,3),(148,3),(149,3),(150,3),(151,3),(152,3),(153,3),(154,3),(155,3),(156,3),(157,3),(158,3),(159,3),(160,3),(161,3),(162,3),(163,3),(164,3),(165,3),(166,3),(167,3),(168,3),(169,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,3),(178,3),(179,3),(180,3),(181,3),(182,3),(183,3),(184,3),(185,3),(186,3),(187,3),(188,3),(189,3),(190,3),(191,3),(192,3),(193,3),(194,3),(195,3),(196,3),(197,3),(198,3),(199,3),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(223,3),(224,3),(225,3),(226,3),(227,3),(228,3),(229,3),(230,3),(231,3),(232,3),(233,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,3,1,NULL,'Conclusão da venda 1 para consumidor final','2022-12-01 20:57:37','2022-12-01 20:57:37',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(2,3,1,NULL,'Conclusão da venda 2 para consumidor final','2022-12-01 21:08:50','2022-12-01 21:08:50',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(3,3,1,NULL,'Conclusão da venda 3 para consumidor final','2022-12-08 16:11:20','2022-12-08 16:11:20',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(4,3,1,NULL,'Conclusão da venda 4 para consumidor final','2022-12-08 16:18:38','2022-12-08 16:18:38',NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(5,3,1,NULL,'Conclusão da venda 5 para consumidor final','2022-12-08 16:20:44','2022-12-08 16:20:44',NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(6,3,1,NULL,'Conclusão da venda 6 para consumidor final','2022-12-08 16:29:38','2022-12-08 16:29:38',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(7,3,1,NULL,'Conclusão da venda 7 para consumidor final','2022-12-08 16:30:44','2022-12-08 16:30:44',NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'C',0,0),(8,3,1,NULL,'Conclusão da venda 8 para consumidor final','2022-12-08 16:31:55','2022-12-08 16:31:55',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105.00,'C',0,0),(9,3,1,NULL,'Conclusão da venda 9 para consumidor final','2022-12-08 17:45:43','2022-12-08 17:45:43',NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,1),(10,3,1,NULL,'Tomada do empréstimo: 1','2022-12-12 17:05:19','2022-12-12 17:05:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'C',0,0),(11,3,1,NULL,'Tomada do empréstimo: 2','2022-12-12 17:45:10','2022-12-12 17:45:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(12,3,1,NULL,'Tomada do empréstimo: 3','2022-12-12 17:49:00','2022-12-12 17:49:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(13,3,1,NULL,'Tomada do empréstimo: 4','2022-12-12 17:52:17','2022-12-12 17:52:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(14,3,1,NULL,'Tomada do empréstimo: 5','2022-12-12 17:54:20','2022-12-12 17:54:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,50.00,'C',0,0),(15,3,1,NULL,'Tomada do empréstimo: 6','2022-12-12 17:56:22','2022-12-12 17:56:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,100.00,'C',0,0),(16,3,1,NULL,'Tomada do empréstimo: 7','2022-12-12 17:58:19','2022-12-12 17:58:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,100.00,'C',0,0),(17,3,1,NULL,'Tomada do empréstimo: 8','2022-12-12 18:38:34','2022-12-12 18:38:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,100.00,'C',0,0),(18,3,1,NULL,'Despesas do empréstimo: 9','2022-12-12 19:40:22','2022-12-12 19:40:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,20.00,'D',0,0),(19,3,1,NULL,'Tomada do empréstimo: 9','2022-12-12 19:40:22','2022-12-12 19:40:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,1000.00,'C',0,0),(20,3,1,NULL,'Despesas do empréstimo: 10','2022-12-12 19:45:40','2022-12-12 19:45:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,13.00,'D',0,0),(21,3,1,NULL,'Tomada do empréstimo: 10','2022-12-12 19:45:40','2022-12-12 19:45:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,200.00,'C',0,0),(22,3,1,NULL,'Despesas do empréstimo: 11','2022-12-12 19:47:26','2022-12-12 19:47:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,53.00,'D',0,0),(23,3,1,NULL,'Tomada do empréstimo: 11','2022-12-12 19:47:26','2022-12-12 19:47:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,15000.00,'C',0,0),(24,3,1,NULL,'Devolução da venda 1 para consumidor final','2022-12-13 20:33:14','2022-12-13 20:33:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,100.00,'D',0,0),(25,3,1,NULL,'Devolução da venda 2 para consumidor final','2022-12-13 20:35:39','2022-12-13 20:35:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,100.00,'D',0,0),(26,3,1,NULL,'Devolução da venda 2 para consumidor final','2022-12-13 20:35:39','2022-12-13 20:35:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,100.00,'D',0,0),(27,3,1,NULL,'Devolução da venda 2 para consumidor final','2022-12-13 20:35:39','2022-12-13 20:35:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,100.00,'D',0,0),(28,3,1,NULL,'Devolução da venda 2 para consumidor final','2022-12-13 20:35:39','2022-12-13 20:35:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,100.00,'D',0,0),(29,3,1,NULL,'Devolução da venda 3 para consumidor final','2022-12-13 21:13:19','2022-12-13 21:13:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,100.00,'D',0,0),(30,3,1,NULL,'Devolução da venda 4 para consumidor final','2022-12-13 21:15:08','2022-12-13 21:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,100.00,'D',0,0),(31,3,1,NULL,'Conclusão da venda 10 para consumidor final','2022-12-13 21:16:10','2022-12-13 21:16:10',NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,'C',0,0),(32,3,1,NULL,'Devolução da venda 10 para consumidor final','2022-12-13 21:17:13','2022-12-13 21:17:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,100.00,'D',0,0),(33,3,1,NULL,'Devolução da venda 10 para consumidor final','2022-12-13 21:18:47','2022-12-13 21:18:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,450.00,'D',0,0),(34,3,1,NULL,'Conclusão da venda 11 para consumidor final','2022-12-13 22:11:11','2022-12-13 22:11:11',NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'C',0,0),(35,3,1,NULL,'Devolução da venda 11 para consumidor final','2022-12-13 22:12:10','2022-12-13 22:12:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,100.00,'D',0,0),(36,3,1,NULL,'Conclusão da venda 12 para consumidor final','2022-12-13 22:14:12','2022-12-13 22:14:12',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,250.00,'C',0,1),(37,3,1,NULL,'Conclusão da venda 13 para consumidor final','2022-12-13 22:15:47','2022-12-13 22:15:47',NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,350.00,'C',0,1),(38,3,1,NULL,'Tomada do empréstimo: 12','2022-12-14 12:23:57','2022-12-14 12:23:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,1000.00,'C',0,1),(39,3,1,NULL,'Tomada do empréstimo: 13','2022-12-14 12:33:29','2022-12-14 12:33:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,1000.00,'C',0,1),(40,3,1,NULL,'Tomada do empréstimo: 14','2022-12-14 12:41:17','2022-12-14 12:41:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,1000.00,'C',0,1),(41,3,1,NULL,'Despesas do empréstimo: 14','2022-12-14 12:41:17','2022-12-14 12:41:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,20.00,'D',0,1),(42,3,1,NULL,'Tomada do empréstimo: 15','2022-12-14 13:31:44','2022-12-14 13:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,1000.00,'C',0,1),(43,3,1,NULL,'Despesas do empréstimo: 15','2022-12-14 13:31:44','2022-12-14 13:31:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,20.00,'D',0,1),(44,3,1,NULL,'Documento à receber: 0000000001','2022-12-14 17:12:18','2022-12-14 17:12:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,100.00,'C',0,0),(45,3,1,NULL,'Recebimento: 0000000001 - Francisco Danilo Rodrigues ','2022-12-14 00:00:00','2022-12-14 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,100.00,'C',0,0),(46,3,1,NULL,'Conclusão da compra 1 do fornecedor Leonardo Henrique Paim','2022-12-14 00:00:00','2022-12-14 00:00:00',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(47,3,1,NULL,'Conclusão da compra 2 do fornecedor Leonardo Henrique Paim','2022-12-14 00:00:00','2022-12-14 00:00:00',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(48,3,1,NULL,'Conclusão da compra 3 do fornecedor Leonardo Henrique Paim','2022-12-15 00:00:00','2022-12-15 00:00:00',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(49,3,1,NULL,'Conclusão da compra 4 do fornecedor Leonardo Henrique Paim','2022-12-15 00:00:00','2022-12-15 00:00:00',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,250.00,'D',0,0);
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
INSERT INTO `movimento_categoria` VALUES (39,225,NULL,'',1000.00),(40,225,NULL,'',1000.00),(41,162,NULL,'',20.00),(42,225,NULL,'',1000.00),(43,162,NULL,'',20.00),(44,111,NULL,'',100.00),(45,111,NULL,'',100.00),(46,119,NULL,'',100.00),(47,119,NULL,'',100.00),(48,119,NULL,'',100.00),(49,120,NULL,'',250.00);
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
INSERT INTO `movimento_centro_resultado` VALUES (48,1,100.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (39,225,4,1000.00,1,2),(39,225,19,1100.00,1,2),(39,225,20,100.00,2,2),(40,225,4,1000.00,1,2),(40,225,19,1100.00,1,2),(40,225,20,100.00,2,2),(41,162,4,20.00,2,2),(41,162,29,20.00,2,2),(41,162,65,20.00,1,1),(41,162,65,20.00,1,2),(41,162,78,20.00,2,1),(41,162,78,20.00,2,2),(42,225,4,1000.00,1,2),(42,225,19,1100.00,1,2),(42,225,20,100.00,2,2),(43,162,4,20.00,2,2),(43,162,29,20.00,2,2),(43,162,65,20.00,1,1),(43,162,65,20.00,1,2),(43,162,78,20.00,2,1),(43,162,78,20.00,2,2),(44,111,7,100.00,1,2),(44,111,13,100.00,2,2),(45,111,4,100.00,1,2),(45,111,7,100.00,2,2),(45,111,46,100.00,1,1),(45,111,78,100.00,1,1),(46,119,4,100.00,2,2),(46,119,9,100.00,1,2),(46,119,56,100.00,1,1),(46,119,78,100.00,2,1),(47,119,4,100.00,2,2),(47,119,9,100.00,1,2),(47,119,56,100.00,1,1),(47,119,78,100.00,2,1),(48,119,4,100.00,2,2),(48,119,9,100.00,1,2),(48,119,56,100.00,1,1),(48,119,78,100.00,2,1),(49,120,9,250.00,1,2),(49,120,18,250.00,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,1,NULL,NULL,NULL,100.00,'C',1),(2,2,1,NULL,NULL,NULL,100.00,'C',1),(3,3,1,NULL,NULL,NULL,100.00,'C',1),(4,4,1,NULL,NULL,NULL,100.00,'C',1),(5,5,1,NULL,NULL,NULL,100.00,'C',1),(6,6,1,NULL,NULL,NULL,100.00,'C',1),(7,7,1,NULL,NULL,NULL,500.00,'C',1),(8,8,1,NULL,NULL,NULL,105.00,'C',1),(9,9,1,NULL,NULL,NULL,100.00,'C',1),(10,24,1,NULL,NULL,NULL,100.00,'C',0),(11,25,1,NULL,NULL,NULL,100.00,'C',0),(12,26,1,NULL,NULL,NULL,100.00,'C',0),(13,27,1,NULL,NULL,NULL,100.00,'D',1),(14,28,1,NULL,NULL,NULL,100.00,'D',1),(15,29,1,NULL,NULL,NULL,100.00,'D',1),(16,30,1,NULL,NULL,NULL,100.00,'D',1),(17,31,1,NULL,NULL,NULL,800.00,'C',1),(18,32,1,NULL,NULL,NULL,100.00,'D',1),(19,33,1,NULL,NULL,NULL,450.00,'D',1),(20,34,1,NULL,NULL,NULL,100.00,'C',1),(21,35,1,NULL,NULL,NULL,100.00,'D',1),(22,36,1,NULL,NULL,NULL,250.00,'C',1),(23,37,1,NULL,NULL,NULL,350.00,'C',1),(24,46,1,NULL,NULL,NULL,100.00,'D',1),(25,47,1,NULL,NULL,NULL,100.00,'D',1),(26,48,1,NULL,NULL,NULL,100.00,'D',1),(27,49,4,NULL,NULL,NULL,125.00,'D',1),(28,49,4,NULL,NULL,NULL,125.00,'D',1);
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
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,1,1,1),(4,1,1,1),(5,1,1,1),(6,1,1,1),(7,1,1,1),(8,1,1,1),(9,1,1,1),(10,0,0,0),(11,0,0,0),(12,0,0,0),(13,0,0,0),(14,0,0,0),(15,0,0,0),(16,0,0,0),(17,0,0,0),(18,0,0,0),(19,0,0,0),(20,0,0,0),(21,0,0,0),(22,0,0,0),(23,0,0,0),(24,1,1,1),(25,1,1,1),(26,1,1,1),(27,1,1,1),(28,1,1,1),(29,1,1,1),(30,1,1,1),(31,1,1,1),(32,1,1,1),(33,1,1,1),(34,1,1,1),(35,1,1,1),(36,1,1,1),(37,1,1,1),(38,0,1,0),(39,0,1,0),(40,0,1,0),(41,0,1,0),(42,0,1,0),(43,0,1,0),(45,0,1,0),(46,1,1,1),(47,1,1,1),(48,1,1,1),(49,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf`
--

LOCK TABLES `nf` WRITE;
/*!40000 ALTER TABLE `nf` DISABLE KEYS */;
INSERT INTO `nf` VALUES (2,3,1,3,'2022-12-14 00:00:00','2022-12-14 00:00:00',0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0),(3,3,2,3,'2022-12-14 00:00:00','2022-12-14 00:00:00',0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0),(4,3,3,3,'2022-12-15 00:00:00','2022-12-15 00:00:00',0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0),(5,3,4,3,'2022-12-15 00:00:00','2022-12-15 00:00:00',0,2,9,NULL,2,250.00,250.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nf_item`
--

LOCK TABLES `nf_item` WRITE;
/*!40000 ALTER TABLE `nf_item` DISABLE KEYS */;
INSERT INTO `nf_item` VALUES (2,2,1,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'90',0.00,0.0000,0.00,0.00,0.0000,0.0000,0.00,'',0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,NULL,0),(3,3,1,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'90',0.00,0.0000,0.00,0.00,0.0000,0.0000,0.00,'',0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,NULL,0),(4,4,1,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'90',0.00,0.0000,0.00,0.00,0.0000,0.0000,0.00,'',0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,NULL,0),(5,5,1,NULL,NULL,1403,1,1.0000,250.0000,250.00,250.00,0.00,0.00,0.00,0.00,'90',0.00,0.0000,0.00,0.00,0.0000,0.0000,0.00,'',0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,NULL,0);
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
INSERT INTO `operacao_empresa` VALUES (1,3,1,1,0),(2,3,1,1,0),(3,3,1,1,0),(4,3,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,3,2,NULL,1,1,'0000000001','2022-12-12','2023-10-01','0001-01-01',220.00,0.00,0.00,0.00,'',0,1),(2,NULL,3,2,NULL,1,1,'0000000002','2022-12-12','2023-10-02','0001-01-01',220.00,0.00,0.00,0.00,'',0,1),(3,NULL,3,2,NULL,1,1,'0000000003','2022-12-12','2023-10-03','0001-01-01',220.00,0.00,0.00,0.00,'',0,1),(4,NULL,3,2,NULL,1,1,'0000000004','2022-12-12','2023-10-04','0001-01-01',220.00,0.00,0.00,0.00,'',0,1),(5,NULL,3,2,NULL,1,1,'0000000005','2022-12-12','2023-10-05','0001-01-01',220.00,0.00,0.00,0.00,'',0,1),(6,NULL,3,2,NULL,2,1,'0000000006','2022-12-12','2023-05-01','0001-01-01',55.00,0.00,0.00,0.00,'',0,1),(7,NULL,3,2,NULL,2,1,'0000000007','2022-12-12','2023-05-02','0001-01-01',55.00,0.00,0.00,0.00,'',0,1),(8,NULL,3,2,NULL,3,1,'0000000008','2022-12-12','2023-05-01','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(9,NULL,3,2,NULL,3,1,'0000000009','2022-12-12','2023-05-02','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(10,NULL,3,2,NULL,4,1,'0000000010','2022-12-12','2023-05-01','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(11,NULL,3,2,NULL,4,1,'0000000011','2022-12-12','2023-05-02','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(12,NULL,3,2,NULL,5,1,'0000000012','2022-12-12','2023-05-01','0001-01-01',27.50,0.00,0.00,0.00,'',0,1),(13,NULL,3,2,NULL,5,1,'0000000013','2022-12-12','2023-05-02','0001-01-01',27.50,0.00,0.00,0.00,'',0,1),(14,NULL,3,2,NULL,6,1,'0000000014','2022-12-12','2023-05-01','0001-01-01',110.00,0.00,0.00,0.00,'',0,1),(15,NULL,3,2,NULL,7,1,'0000000015','2022-12-12','2023-05-01','0001-01-01',110.00,0.00,0.00,0.00,'',0,0),(16,NULL,3,2,NULL,8,1,'0000000016','2022-12-12','2023-05-01','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(17,NULL,3,2,NULL,8,1,'0000000017','2022-12-12','2023-05-02','0001-01-01',55.00,0.00,0.00,0.00,'',0,0),(18,NULL,3,2,NULL,9,1,'0000000018','2022-12-12','2023-05-01','0001-01-01',550.00,0.00,0.00,0.00,'',0,0),(19,NULL,3,2,NULL,9,1,'0000000019','2022-12-12','2023-05-02','0001-01-01',550.00,0.00,0.00,0.00,'',0,0),(20,NULL,3,2,NULL,10,1,'0000000020','2022-12-12','2023-05-01','0001-01-01',110.00,0.00,0.00,0.00,'',0,0),(21,NULL,3,2,NULL,10,1,'0000000021','2022-12-12','2023-05-02','0001-01-01',110.00,0.00,0.00,0.00,'',0,0),(22,NULL,3,2,NULL,11,1,'0000000022','2022-12-12','2023-05-01','0001-01-01',8000.00,0.00,0.00,0.00,'',0,0),(23,NULL,3,2,NULL,11,1,'0000000023','2022-12-12','2023-05-02','0001-01-01',8000.00,0.00,0.00,0.00,'',0,0),(24,NULL,3,2,NULL,12,1,'0000000024','2022-12-14','2023-05-01','0001-01-01',1100.00,0.00,0.00,0.00,'',0,1),(25,NULL,3,2,NULL,13,1,'0000000025','2022-12-14','2023-05-01','0001-01-01',1100.00,0.00,0.00,0.00,'',0,1),(26,NULL,3,2,NULL,14,1,'0000000026','2022-12-14','2023-05-01','0001-01-01',1100.00,0.00,0.00,0.00,'',0,1),(27,NULL,3,2,NULL,15,1,'0000000027','2022-12-14','2023-05-01','0001-01-01',1100.00,0.00,0.00,0.00,'',0,1),(28,NULL,3,2,5,NULL,1,'41','2022-12-15','2023-01-14','0001-01-01',125.00,0.00,0.00,0.00,'',0,0),(29,NULL,3,2,5,NULL,1,'42','2022-12-15','2023-02-13','0001-01-01',125.00,0.00,0.00,0.00,'',0,0);
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
INSERT INTO `pagar_categoria` VALUES (1,226,90.9091),(1,227,9.0909),(2,226,90.9091),(2,227,9.0909),(3,226,90.9091),(3,227,9.0909),(4,226,90.9091),(4,227,9.0909),(5,226,90.9091),(5,227,9.0909),(6,226,90.9091),(6,227,9.0909),(7,226,90.9091),(7,227,9.0909),(8,226,90.9091),(8,227,9.0909),(9,226,90.9091),(9,227,9.0909),(10,226,90.9091),(10,227,9.0909),(11,226,90.9091),(11,227,9.0909),(12,226,90.9091),(12,227,9.0909),(13,226,90.9091),(13,227,9.0909),(14,226,90.9091),(14,227,9.0909),(15,226,90.9091),(15,227,9.0909),(16,226,90.9091),(16,227,9.0909),(17,226,90.9091),(17,227,9.0909),(18,226,90.9091),(18,227,9.0909),(19,226,90.9091),(19,227,9.0909),(20,226,90.9091),(20,227,9.0909),(21,226,90.9091),(21,227,9.0909),(22,226,93.7500),(22,227,6.2500),(23,226,93.7500),(23,227,6.2500),(24,226,90.9091),(24,227,9.0909),(25,226,90.9091),(25,227,9.0909),(26,226,90.9091),(26,227,9.0909),(27,226,90.9091),(27,227,9.0909),(28,121,100.0000),(29,121,100.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,'0001-01-01 00:00:00'),(2,'F',0,'Leonardo Henrique Paim','','08945693688','14245460',NULL,'','','',9,'','','','','1988-03-23',0,0,'2022-12-14 17:08:46'),(3,'F',0,'Francisco Danilo Rodrigues','','91290946159','29.205.572-9',NULL,'','','',9,'','','','','1995-03-12',0,0,'2022-12-14 17:10:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,26,2,'(03) 7998-6531','');
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
INSERT INTO `pessoa_empresa` VALUES (2,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(2,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(2,3,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
INSERT INTO `pessoa_endereco` VALUES (1,1,15,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,1,''),(2,NULL,2,''),(2,NULL,5,''),(3,NULL,1,'');
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-12-01 20:54:55'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-12-01 20:54:55'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-12-01 20:54:55'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-12-01 20:54:55');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,NULL,'Produto','Produto',0,NULL,'',1,1,0,'','','','','',0,0,'',0,'',0,'2022-12-01 20:56:54'),(2,NULL,'Serviço','Serviço externo',9,NULL,'',1,NULL,0,'','','','','',0,0,'',0,'',0,'2022-12-13 22:13:44');
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
INSERT INTO `produto_empresa` VALUES (1,3,0,1,0),(2,3,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,1,NULL,NULL,3,1,'',-6.5000,4.0000,10.5000);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Geral','2022-12-01 20:56:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,1,NULL,NULL,3,1,NULL,1,NULL,NULL,NULL,'2022-12-01 20:57:37','2022-12-01 20:57:37','S',1.0000,''),(2,1,NULL,NULL,3,1,NULL,2,NULL,NULL,NULL,'2022-12-01 21:08:50','2022-12-01 21:08:50','S',1.0000,''),(3,1,NULL,NULL,3,1,NULL,3,NULL,NULL,NULL,'2022-12-08 16:11:20','2022-12-08 16:11:20','S',1.0000,''),(4,1,NULL,NULL,3,1,NULL,4,NULL,NULL,NULL,'2022-12-08 16:18:38','2022-12-08 16:18:38','S',1.0000,''),(5,1,NULL,NULL,3,1,NULL,5,NULL,NULL,NULL,'2022-12-08 16:20:44','2022-12-08 16:20:44','S',1.0000,''),(6,1,NULL,NULL,3,1,NULL,6,NULL,NULL,NULL,'2022-12-08 16:29:38','2022-12-08 16:29:38','S',1.0000,''),(7,1,NULL,NULL,3,1,NULL,7,NULL,NULL,NULL,'2022-12-08 16:30:44','2022-12-08 16:30:44','S',5.0000,''),(8,1,NULL,NULL,3,1,NULL,8,NULL,NULL,NULL,'2022-12-08 16:31:55','2022-12-08 16:31:55','S',1.0000,''),(9,1,NULL,NULL,3,1,NULL,9,NULL,NULL,NULL,'2022-12-08 17:45:43','2022-12-08 17:45:43','S',1.0000,''),(10,1,NULL,NULL,3,1,NULL,9,NULL,NULL,NULL,'2022-12-08 17:46:26','2022-12-08 17:46:26','E',1.0000,''),(12,1,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,'2022-12-13 20:33:14','2022-12-13 20:33:14','E',1.0000,''),(13,1,NULL,NULL,3,1,NULL,NULL,NULL,2,NULL,'2022-12-13 20:35:39','2022-12-13 20:35:39','E',1.0000,''),(14,1,NULL,NULL,3,1,NULL,NULL,NULL,3,NULL,'2022-12-13 21:13:19','2022-12-13 21:13:19','E',1.0000,''),(15,1,NULL,NULL,3,1,NULL,NULL,NULL,4,NULL,'2022-12-13 21:15:08','2022-12-13 21:15:08','E',1.0000,''),(16,1,NULL,NULL,3,1,NULL,10,NULL,NULL,NULL,'2022-12-13 21:16:10','2022-12-13 21:16:10','S',5.0000,''),(17,1,NULL,NULL,3,1,NULL,10,NULL,NULL,NULL,'2022-12-13 21:16:10','2022-12-13 21:16:10','S',3.0000,''),(18,1,NULL,NULL,3,1,NULL,NULL,NULL,5,NULL,'2022-12-13 21:17:13','2022-12-13 21:17:13','E',1.0000,''),(19,1,NULL,NULL,3,1,NULL,NULL,NULL,6,NULL,'2022-12-13 21:18:47','2022-12-13 21:18:47','E',2.5000,''),(20,1,NULL,NULL,3,1,NULL,NULL,NULL,6,NULL,'2022-12-13 21:18:47','2022-12-13 21:18:47','E',2.0000,''),(21,1,NULL,NULL,3,1,NULL,11,NULL,NULL,NULL,'2022-12-13 22:11:11','2022-12-13 22:11:11','S',1.0000,''),(22,1,NULL,NULL,3,1,NULL,NULL,NULL,7,NULL,'2022-12-13 22:12:10','2022-12-13 22:12:10','E',1.0000,''),(23,1,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2022-12-13 22:15:47','2022-12-13 22:15:47','S',1.0000,''),(24,1,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2022-12-13 22:19:01','2022-12-13 22:19:01','E',1.0000,''),(26,1,NULL,NULL,3,1,2,NULL,NULL,NULL,NULL,'2022-12-15 09:26:19','2022-12-14 00:00:00','E',1.0000,''),(27,1,NULL,NULL,3,1,3,NULL,NULL,NULL,NULL,'2022-12-15 14:44:41','2022-12-14 00:00:00','E',1.0000,''),(28,1,NULL,NULL,3,1,4,NULL,NULL,NULL,NULL,'2022-12-15 14:46:57','2022-12-15 00:00:00','E',1.0000,''),(29,1,NULL,NULL,3,1,5,NULL,NULL,NULL,NULL,'2022-12-15 14:54:35','2022-12-15 00:00:00','E',1.0000,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,3,250.0000,137.5000,250.0000,100.0000,100.0000,100.0000,0.0000),(2,2,0,NULL,3,0.0000,0.0000,0.0000,250.0000,0.0000,0.0000,0.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_sped`
--

LOCK TABLES `produto_sped` WRITE;
/*!40000 ALTER TABLE `produto_sped` DISABLE KEYS */;
INSERT INTO `produto_sped` VALUES (1,1,'Produto','2022-12-01','0001-01-01');
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
INSERT INTO `produto_unidade` VALUES (1,'Unidade','UND',0,'2022-12-01 20:56:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,3,3,NULL,NULL,1,'0000000001','2022-12-14','2023-01-14','2022-12-14',100.00,0.00,0.00,100.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,111,100.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
INSERT INTO `recebimento` VALUES (1,1,'2022-12-14',100.00,0.00,0.00,100.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_receber`
--

LOCK TABLES `recebimento_receber` WRITE;
/*!40000 ALTER TABLE `recebimento_receber` DISABLE KEYS */;
INSERT INTO `recebimento_receber` VALUES (1,1,1,100.00,0.00,0.00,100.00,0);
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
INSERT INTO `recebimento_receber_categoria` VALUES (1,111,100.00);
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
INSERT INTO `service_empresa` VALUES (1,3,1125,4,'2022-12-08 16:08:42');
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
INSERT INTO `sommusdash_usuario` VALUES (1,'SommusGestor','1c1394a566f41533bc1a75293f3c5b6b','','sommusgestor@sommusgestor.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,3,'2022-12-01 20:57:20',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 20:34:26'),(2,3,'2022-12-01 21:08:38',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 21:09:19'),(3,3,'2022-12-08 16:11:02',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 21:14:14'),(4,3,'2022-12-08 16:18:24',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 21:15:14'),(5,3,'2022-12-08 16:20:32',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 16:20:43'),(6,3,'2022-12-08 16:29:26',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 16:29:38'),(7,3,'2022-12-08 16:30:27',1,NULL,1,1,500.00,500.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 16:30:44'),(8,3,'2022-12-08 16:31:37',1,NULL,1,1,100.00,105.00,0.00,0.00,5.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 16:31:55'),(9,3,'2022-12-08 17:45:32',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 17:46:25'),(10,3,'2022-12-13 21:15:48',1,NULL,1,1,800.00,800.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 21:16:09'),(11,3,'2022-12-13 22:10:57',1,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 22:12:09'),(12,3,'2022-12-13 22:13:57',1,NULL,1,1,250.00,250.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 22:15:11'),(13,3,'2022-12-13 22:15:29',1,NULL,1,1,350.00,350.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,2,1,'0001-01-01',4,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-13 22:19:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
INSERT INTO `venda_item` VALUES (1,1,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(3,3,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(4,4,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,5,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,6,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,7,1,NULL,NULL,'',1,5.0000,60.0000,100.0000,500.00,500.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,8,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,105.00,0.00,0.00,5.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,9,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,10,1,NULL,NULL,'',1,5.0000,60.0000,100.0000,500.00,500.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(11,10,1,NULL,NULL,'',2,3.0000,60.0000,100.0000,300.00,300.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(12,11,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(13,12,2,NULL,NULL,'Serviço externo',1,1.0000,0.0000,250.0000,250.00,250.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(14,13,1,NULL,NULL,'',1,1.0000,60.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL),(15,13,2,NULL,NULL,'Serviço externo',2,1.0000,0.0000,250.0000,250.00,250.00,0.00,0.00,0.00,0.00,0,2,NULL,0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2022-12-01 20:41:39','41a536e645647230c6a463a4e47937db'),(2,2,'20221114.182125.297','2022-12-01 20:41:39','8af8ff302ef0717d6f7ce05e11c0eb71'),(3,2,'20220927.231853.021-financas','2022-12-01 20:41:39','fa276e0cb44e37c93be4f066c5ca1d46'),(4,2,'20220927.231856.052-financas','2022-12-01 20:41:39','35a26de21be24356e49a660dcfc0ce12'),(5,2,'20220927.231859.082-financas','2022-12-01 20:41:39','e38cf2299934f7ed663de23a93311f49'),(6,2,'20220927.231902.116-financas','2022-12-01 20:41:39','7ddc35036ede7524fb8f16c1fa847efd'),(7,2,'20220927.231905.158-financas','2022-12-01 20:41:39','03a3cbe50b59c93ccbd2b43c67842803'),(8,2,'20220927.231908.190-financas','2022-12-01 20:41:39','6e60b6060f2cdb9e5b15ab0ff6f2dfe3'),(9,2,'20220927.231911.215-financas','2022-12-01 20:41:39','b48c79cb196a572dc6894284ecdf3738'),(10,2,'20220927.231914.237-financas','2022-12-01 20:41:39','4af8ce983cb1dc6590965d1166f4d7b8'),(11,2,'20220927.231917.275-financas','2022-12-01 20:41:39','5755d2136a2e8fd0d7327740c5bf0889'),(12,2,'20220927.231920.311-financas','2022-12-01 20:41:39','6c53b18316f616e3d3c3755611852189'),(13,2,'20220927.231923.342-financas','2022-12-01 20:41:39','f8a9adb5440ed6091d9705eae3d136f6'),(14,2,'20220927.231926.383-financas','2022-12-01 20:41:39','aa3e0e16d5ebd455001e63d6238192d0'),(15,2,'20220927.231929.422-financas','2022-12-01 20:41:39','86096abd862edcc9c6bd1863ed711616'),(16,2,'20220927.231932.449-financas','2022-12-01 20:41:39','8cb437b7e2c0b94eb12c7d7736ae450a'),(17,2,'20220927.231935.475-financas','2022-12-01 20:41:39','dae5cc338d043b8af998ce0ef1ffd631'),(18,2,'20220927.231938.503-financas','2022-12-01 20:41:39','ee311ca51061bd5c8ae57659ee14979f'),(19,2,'20220927.231941.539-financas','2022-12-01 20:41:39','54cb8daae96274e1e04bf07d91b42c9d'),(20,2,'20220927.231944.560-financas','2022-12-01 20:41:39','5ae25e22e0b93ae2f9fddedd45503aa0'),(21,2,'20220927.231947.591-financas','2022-12-01 20:41:39','b1a64bad5f2d56f3dd581da32b41589b'),(22,2,'20220927.231950.619-financas','2022-12-01 20:41:39','42061e2256fb0fdab5cf4307e3bb6637'),(23,2,'20220927.231953.643-financas','2022-12-01 20:41:39','b74dbefed36dcad6f280d0099df59f61'),(24,2,'20220927.231956.678-financas','2022-12-01 20:41:39','6b84bb7edc3aaa00c26bc887a9672f53'),(25,2,'20220927.231959.720-financas','2022-12-01 20:41:39','0eb14a961d8a6fbc5e36728f81bc59a3'),(26,2,'20220927.232002.752-financas','2022-12-01 20:41:39','401fbd71136742416b9aa04d24346f90'),(27,2,'20220927.232005.779-financas','2022-12-01 20:41:39','d168dd9106ebfa6343d32f92d3ef767d'),(28,2,'20220927.232008.813-financas','2022-12-01 20:41:39','d32b04ddea67c72ff9746b7f689a46dd'),(29,2,'20220927.232011.839-financas','2022-12-01 20:41:39','8e6c643370128cb210a3ee4d5bc496af'),(30,2,'20220927.232014.867-financas','2022-12-01 20:41:39','5d0df1218cc838c8184d05b4ff7267c8'),(31,2,'20220927.232017.894-financas','2022-12-01 20:41:39','85d50298f59f43ca87ae93d6741f4789'),(32,2,'20220927.232020.927-financas','2022-12-01 20:41:39','19f669c90d8e478bda2c72da85325d6c'),(33,2,'20220927.232023.968-financas','2022-12-01 20:41:39','36eb3effe92a204e4be1206e8676c6cc'),(34,2,'20220927.232026.997-financas','2022-12-01 20:41:39','6b84f62489733db6d6d138f2790e20aa'),(35,2,'20220927.232030.018-financas','2022-12-01 20:41:39','8dbe1014c49d13a8021451ec29058e76'),(36,2,'20220927.232033.051-financas','2022-12-01 20:41:39','68e538dc2de0f31dadf773d7cff93ff4'),(37,2,'20220927.232036.093-financas','2022-12-01 20:41:39','bede179ec08d3605ff94f51616013e6b'),(38,2,'20220927.232039.127-financas','2022-12-01 20:41:39','06bbae8dbefe8d98bb2dee5286027a15'),(39,2,'20220927.232042.162-financas','2022-12-01 20:41:39','f2983305ef93aeebbf88c0b0276a3ebb'),(40,2,'20220927.232045.187-financas','2022-12-01 20:41:39','e90445382950955fc4ee85d3b610e053'),(41,2,'20220927.232048.220-financas','2022-12-01 20:41:39','840ae779dddcecd2da97a03d3b368ef5'),(42,2,'20220927.232051.257-financas','2022-12-01 20:41:39','22f6e53e88f06415ee780d7e43253243'),(43,2,'20220927.232054.286-financas','2022-12-01 20:41:39','4d66c171278551847d392c1b88d2c99f'),(44,2,'20220927.232057.328-financas','2022-12-01 20:41:39','cf971280da7e4243a2a2b6903bc3c7e6'),(45,2,'20220927.232100.367-financas','2022-12-01 20:41:39','105c313327e3404dbbf12d07787e7d9f'),(46,2,'20220927.232103.395-financas','2022-12-01 20:41:39','e357d749d458f0c81f6d33935fcb5be6'),(47,2,'20220927.232106.423-financas','2022-12-01 20:41:39','f749795bb985fc8cc18f0567d7c1a4b4'),(48,2,'20220927.232109.456-financas','2022-12-01 20:41:39','1bc01c3de1adff2a15c2568392757be9'),(49,2,'20220927.232112.491-financas','2022-12-01 20:41:39','53e333ed6c66239ace6907e998eea43d'),(50,2,'20220927.232115.513-financas','2022-12-01 20:41:39','c74d902b9cd2008cef4ac462a1d4fb64'),(51,2,'20220927.232118.547-financas','2022-12-01 20:41:39','8f7e4e0edf729642dfb0d339a47c1cb2'),(52,2,'20220927.232121.575-financas','2022-12-01 20:41:39','386824b47c49d763dddde75e09aba882'),(53,2,'20220927.232124.607-financas','2022-12-01 20:41:39','c31de76a0780c29b7f859aef2fbcb566'),(54,2,'20220927.232127.635-financas','2022-12-01 20:41:39','fa8c4964f0e4b99a8979c1c3a178304b'),(55,2,'20220927.232130.676-financas','2022-12-01 20:41:39','b4b815af239bcb17751ec92b60875245'),(56,2,'20220927.232133.705-financas','2022-12-01 20:41:39','6067e769d2a2a142b414592e92774111'),(57,2,'20220927.232136.737-financas','2022-12-01 20:41:39','feeebb6889d782478687affa03915ad8'),(58,2,'20220927.232139.771-financas','2022-12-01 20:41:39','e121380ebcc352602973c5ce82bd97db'),(59,2,'20220927.232142.802-financas','2022-12-01 20:41:39','1f85dbbe677a546874523d43e56e4c2a'),(60,2,'20220927.232145.829-financas','2022-12-01 20:41:39','fc81daf9c2b0b8d8de64f241bcf742ae'),(61,2,'20220927.232148.858-financas','2022-12-01 20:41:39','64c705ee371a21f09fb359cf5e337c4b'),(62,2,'20220927.232151.889-financas','2022-12-01 20:41:39','70d88c5ef77e3da257e05eee97a18d73'),(63,2,'20220927.232154.913-financas','2022-12-01 20:41:39','9a037cbc5deebe4c0efdf1ecce1bac35'),(64,2,'20220927.232157.949-financas','2022-12-01 20:41:39','1c288756ec31a35f10d837848e565b8b'),(65,2,'20220927.232200.972-financas','2022-12-01 20:41:39','7caf6714470dd0e7c2c1af7bcbcc0f8b'),(66,2,'20220927.232204.006-financas','2022-12-01 20:41:39','d3a2d072d0bc9585b4748982a3c99790'),(67,2,'20220927.232207.039-financas','2022-12-01 20:41:39','d54ed86c937b54c85fc19846e70f7cad'),(68,2,'20220927.232210.064-financas','2022-12-01 20:41:39','1a525b8ab37165bf9478e5f40b1a471d'),(69,2,'20220927.232213.090-financas','2022-12-01 20:41:39','40a4ca414b637be158f32ede083c728f'),(70,2,'20220927.232216.129-financas','2022-12-01 20:41:39','694064b6414afcc0f74cf6aeeacfdf42'),(71,2,'20220927.232219.167-financas','2022-12-01 20:41:39','f8a7d1d6c892bc804a59a1d9c0a92764'),(72,2,'20220927.232222.193-financas','2022-12-01 20:41:39','9ec10be25fac4ed1aa02c7972cded57e'),(73,2,'20220927.232225.219-financas','2022-12-01 20:41:39','b4f356f01f44d06aa5f8a300f105846f'),(74,2,'20220927.232228.256-financas','2022-12-01 20:41:39','170715d8e0d9f83dd00d9db531aeb2b1'),(75,2,'20220927.232231.283-financas','2022-12-01 20:41:39','4de2e9c0db2d128d923392336121c482'),(76,2,'20220927.232234.314-financas','2022-12-01 20:41:39','b00e6e743f6356c008e610413ea44667'),(77,2,'20220927.232237.348-financas','2022-12-01 20:41:39','2c485f50f16ac4ac5050f4d1561fd673'),(78,2,'20220927.232240.374-financas','2022-12-01 20:41:39','cdd95c3cf3ddf5115d0a66e5f58ec079'),(79,2,'20220927.232243.406-financas','2022-12-01 20:41:39','705af0d289f5186850f529dc6dddb5fe'),(80,2,'20220927.232246.448-financas','2022-12-01 20:41:39','f4fc0bc9a32c5bcc26a37946bac549e1'),(81,2,'20220927.232249.485-financas','2022-12-01 20:41:39','4175402a8d1e471286c1260e1d0c6a5d'),(82,2,'20220927.232252.522-financas','2022-12-01 20:41:39','318b9464829fa8d2e27271ff773a60bc'),(83,2,'20220927.232255.558-financas','2022-12-01 20:41:39','8448fda3e0ac096a41021281ccfbbb95'),(84,2,'20220927.232258.583-financas','2022-12-01 20:41:39','e35b14fbdb4b15890f5cdd1900befb6b'),(85,2,'20220927.232301.622-financas','2022-12-01 20:41:39','1e00181f67737c84ee7b2355349717e6'),(86,2,'20220927.232304.657-financas','2022-12-01 20:41:39','537dae0ad9892e03149b51bb5e190ba6'),(87,2,'20220927.232307.681-financas','2022-12-01 20:41:39','53b64d54b0537113d1f2051611053776'),(88,2,'20220927.232310.703-financas','2022-12-01 20:41:39','98f8bca5ddcdea10ee7f97ec134aeeb5'),(89,2,'20220927.232313.739-financas','2022-12-01 20:41:39','3c25712b2f6a12b9252e9ad21a08918e'),(90,2,'20220927.232316.772-financas','2022-12-01 20:41:39','e6d5bdf84a125eb476e4e0de96a92020'),(91,2,'20220927.232319.805-financas','2022-12-01 20:41:39','888e252b6009a4ccd573a29c4df3a6b9'),(92,2,'20220927.232322.838-financas','2022-12-01 20:41:39','e8d6bf9fe17b7dcb6ff1f3da18aa393d'),(93,2,'20220927.232325.873-financas','2022-12-01 20:41:39','0d8a19b4c4646f9256865253748f64b6'),(94,2,'20220927.232328.902-financas','2022-12-01 20:41:39','b176db2211234f5b7f05200c6651ffc8'),(95,2,'20220927.232331.926-financas','2022-12-01 20:41:39','092e72b8406a4ce71d2b4f69e0cd6182'),(96,2,'20220927.232334.967-financas','2022-12-01 20:41:39','d54a66158cbf681e13dcf9b6fc1fd302'),(97,2,'20220927.232338.003-financas','2022-12-01 20:41:39','330a4095bf1eb0b08f85ef842e649019'),(98,2,'20220927.232341.029-financas','2022-12-01 20:41:39','67c137cb6e8db225d837df5fa0b7213f'),(99,2,'20220927.232344.066-financas','2022-12-01 20:41:39','29b6cb38f89e76c71041024f47f277c5'),(100,2,'20220927.232347.103-financas','2022-12-01 20:41:39','9b651795bc74e3ff5e8af4242b832f7c'),(101,2,'20220927.232350.132-financas','2022-12-01 20:41:39','a3eef560c9c3c5a5056e696dda5ed999'),(102,2,'20220927.232353.175-financas','2022-12-01 20:41:39','a476841c5bd9e66b2da649afda3d6106'),(103,2,'20220927.232356.206-financas','2022-12-01 20:41:39','2709f1f5b5458fafb6dc43ffc4d4ec9f'),(104,2,'20220927.232359.244-financas','2022-12-01 20:41:39','2ec6dbf5e17919ba0e569e7175a013fd'),(105,2,'20220927.232402.269-financas','2022-12-01 20:41:39','167262248cd8082bd19d065f19343351'),(106,2,'20220927.232405.304-financas','2022-12-01 20:41:39','0f641dd900a0f458c57e4eed407e1448'),(107,2,'20220927.232408.343-financas','2022-12-01 20:41:39','004839ae8b8f166440afc67ac650c107'),(108,2,'20220927.232411.376-financas','2022-12-01 20:41:39','637850e554b479d1f52b360293e605f5'),(109,2,'20220927.232414.410-financas','2022-12-01 20:41:39','d87eda40b47eb67268c1feae3afa11e4'),(110,2,'20220927.232417.444-financas','2022-12-01 20:41:40','88a45d01f02ef286fbfbc227b456405b'),(111,2,'20220927.232420.471-financas','2022-12-01 20:41:40','572025e831698ce9deb17548bbbfe10d'),(112,2,'20220927.232423.505-financas','2022-12-01 20:41:40','a05e07c87b1a5229553da5608afc3033'),(113,2,'20220927.232426.546-financas','2022-12-01 20:41:40','424e183af519f8cfa29c81e26affe378'),(114,2,'20220927.232429.583-financas','2022-12-01 20:41:40','f84f7a63c8f701b035659aa46089afc5'),(115,2,'20220927.232432.614-financas','2022-12-01 20:41:40','1d03e86736487c9197eb90d37bef4d8a'),(116,2,'20220927.232435.654-financas','2022-12-01 20:41:40','32262e4e1fea91ac89efacc59789e5f6'),(117,2,'20220927.232438.684-financas','2022-12-01 20:41:40','f31455a8e53288d04b0c8e07452415f6'),(118,2,'20220927.232441.715-financas','2022-12-01 20:41:40','e46bb5b5c1eb5049ba2713b53f9471d9'),(119,2,'20220927.232444.751-financas','2022-12-01 20:41:40','e010de157cb62adf69dc112c426da04e'),(120,2,'20220927.232447.784-financas','2022-12-01 20:41:40','3eea71487994726496cb870c3ee66e44'),(121,2,'20220927.232450.819-financas','2022-12-01 20:41:40','d95c32a3b5df88de05b84b059f691b2d'),(122,2,'20220927.232453.859-financas','2022-12-01 20:41:40','0b2ed76dd229e59f9b94c0d6bba36886'),(123,2,'20220927.232456.892-financas','2022-12-01 20:41:40','e4a4b3534a7d22ccc39e0cb2f8e5057e'),(124,2,'20220927.232459.921-financas','2022-12-01 20:41:40','3bf2eb7a39d1da5f32e187261ff26f84'),(125,2,'20220927.232502.953-financas','2022-12-01 20:41:40','a47cb9333ee250acf0e97f5983956b6a'),(126,2,'20220927.232505.981-financas','2022-12-01 20:41:40','ff08fccc14373d7e1778a21a7d247f51'),(127,2,'20220927.232509.010-financas','2022-12-01 20:41:40','83394ddb5f41124eddd810a4e41f80e4'),(128,2,'20220927.232512.043-financas','2022-12-01 20:41:40','7590c2b9f26cb1f348a6fd64cbeb2f5d'),(129,2,'20220927.232515.073-financas','2022-12-01 20:41:40','e1d45ae9fa570526d83d935c4ef6198b'),(130,2,'20220927.232518.111-financas','2022-12-01 20:41:40','974cc90e225cda6bbbc35184a8111ae1'),(131,2,'20220927.232521.154-financas','2022-12-01 20:41:40','664b25795367857d8ef3c080b6e740c0'),(132,2,'20220927.232524.192-financas','2022-12-01 20:41:40','abebad179cdc945139e9726949971a75'),(133,2,'20220927.232527.226-financas','2022-12-01 20:41:40','1f0fecb5aab2a1dcd13b0201b37ec4ef'),(134,2,'20220927.232530.257-financas','2022-12-01 20:41:40','e9a6b5475ac05371fcfdda5a9bfd0bc3'),(135,2,'20220927.232533.279-financas','2022-12-01 20:41:40','a0327cd0672acf9fe6e6a9765e37776f'),(136,2,'20220927.232536.304-financas','2022-12-01 20:41:40','b780556efdc3830d7356ecd84c1554f3'),(137,2,'20220927.232539.334-financas','2022-12-01 20:41:40','dfd40fca2f623aed098da1b7c2ce8ec6'),(138,2,'20220927.232542.376-financas','2022-12-01 20:41:40','9735f8fa841ab5cab0419973d2b2edf1'),(139,2,'20220927.232545.411-financas','2022-12-01 20:41:40','29891f65c62f82e22473680cad2da749'),(140,2,'20220927.232548.441-financas','2022-12-01 20:41:40','21b5b626a626733cad913f53e2ecf6b4'),(141,2,'20220927.232551.469-financas','2022-12-01 20:41:40','9e7df8a568f188d907c4a90b90a269d8'),(142,2,'20220927.232554.498-financas','2022-12-01 20:41:40','e244f869661fcb977dd0af237db1347c'),(143,2,'20220927.232557.529-financas','2022-12-01 20:41:40','72e3fe7f79f5743427651562a88ab89c'),(144,2,'20220927.232600.560-financas','2022-12-01 20:41:40','0f2cbdb54a1ea3ddff30733fd32d2d98'),(145,2,'20220927.232603.602-financas','2022-12-01 20:41:40','53c0932c14ed1b4d6690cee15565ae93'),(146,2,'20220927.232606.641-financas','2022-12-01 20:41:40','077a0da4694769bb497a12ed1f633753'),(147,2,'20220927.232609.672-financas','2022-12-01 20:41:40','94aca69ccfc8a9d245cf9115bca62f13'),(148,2,'20220927.232612.696-financas','2022-12-01 20:41:40','0f38ac8b490183f44b898eb9e675c612'),(149,2,'20220927.232615.725-financas','2022-12-01 20:41:40','d99a71cb268c4dc79227ef56cf59cfef'),(150,2,'20220927.232618.759-financas','2022-12-01 20:41:40','7f0889ff356385a49a2b48a1b82916d3'),(151,2,'20220927.232621.791-financas','2022-12-01 20:41:40','5bd5fbf241add0eb178e8910ac5c17fc'),(152,2,'20220927.232624.818-financas','2022-12-01 20:41:40','4614001ffeadc939bd018de4781062b0'),(153,2,'20220927.232627.854-financas','2022-12-01 20:41:40','4bb323633a7553325f7e3ebe0d13bc1a'),(154,2,'20220927.232630.891-financas','2022-12-01 20:41:40','36d2f23a31309b3f68084a6f565c3a38'),(155,2,'20220927.232633.913-financas','2022-12-01 20:41:40','26c9adb88d13e50f5f871ef16245e59c'),(156,2,'20220927.232636.944-financas','2022-12-01 20:41:40','d6e126e85aaf84a889493ce15664db83'),(157,2,'20220927.232639.974-financas','2022-12-01 20:41:40','b5eaba4d95e2f72e0cc688f7aa52a422'),(158,2,'20220927.232643.008-financas','2022-12-01 20:41:40','31b34fca1addb7cf058a031f82f90adb'),(159,2,'20220927.232646.039-financas','2022-12-01 20:41:40','5f0726032972b691199005cbcf3659dc'),(160,2,'20220927.232649.072-financas','2022-12-01 20:41:40','8f82296f75f1ce9ea9e515aa8a2804fe'),(161,2,'20220927.232652.103-financas','2022-12-01 20:41:40','dc12deba5a54655895980f0adf251a4a'),(162,2,'20220927.232655.134-financas','2022-12-01 20:41:40','2246e41a6ded2ed98017a5bf7ef46373'),(163,2,'20220927.232658.169-financas','2022-12-01 20:41:40','6cb0a7779eea104acfcdcf8284859b3f'),(164,2,'20220927.232701.204-financas','2022-12-01 20:41:40','fbcaf02c22c0196edcf9102ec7bee4b3'),(165,2,'20220927.232704.237-financas','2022-12-01 20:41:40','3a8f5d8a4f6910baabeab8c7fc8af40c'),(166,2,'20220927.232707.265-financas','2022-12-01 20:41:40','4827a710d583b0c42fa2c24dbe5c4f66'),(167,2,'20220927.232710.291-financas','2022-12-01 20:41:40','7357e031a9493804814210a94ca8836d'),(168,2,'20220927.232713.319-financas','2022-12-01 20:41:40','9b680781950cab1affdbd0de3ae7393c'),(169,2,'20220927.232716.345-financas','2022-12-01 20:41:40','b4bc7f49d7b9d4e3d33000ad6a2022b5'),(170,2,'20220927.232719.376-financas','2022-12-01 20:41:40','9e8bf621b8f359d4ccfd48c75c7aaa81'),(171,2,'20220927.232722.413-financas','2022-12-01 20:41:40','955f5d99d326976dbc20ebc902d54f01'),(172,2,'20220927.232725.451-financas','2022-12-01 20:41:40','25a7ca20af6a27533e2814dfb6c5a989'),(173,2,'20220927.232728.475-financas','2022-12-01 20:41:40','cfd1a10cc177a8bc68ceaca53202d6d6'),(174,2,'20220927.232731.509-financas','2022-12-01 20:41:40','200fba7cf990f987143aa0e9e1dc2ade'),(175,2,'20220927.232734.538-financas','2022-12-01 20:41:40','a09e01a380e4b02e73076cc99e3707d1'),(176,2,'20220927.232737.569-financas','2022-12-01 20:41:40','032d5a977eb2c6d118c3255f26c22df7'),(177,2,'20220927.232740.596-financas','2022-12-01 20:41:40','14eab946db73a23a92f1292d65957c3d'),(178,2,'20220927.232743.629-financas','2022-12-01 20:41:40','13f0ea3f4666dcbb45496995c38bb44b'),(179,2,'20220927.232746.669-financas','2022-12-01 20:41:40','b78ea51e0b4ba4908877a1cdd64e6a3f'),(180,2,'20220927.232749.707-financas','2022-12-01 20:41:40','cf8f730de4dfe826cb35881ebeac4b1b'),(181,2,'20220927.232752.736-financas','2022-12-01 20:41:40','36370dd145e28f93f4e10dd39bba45de'),(182,2,'20220927.232755.766-financas','2022-12-01 20:41:40','1739fb2086d045ff8d3c1039bfe7ff37'),(183,2,'20220927.232758.799-financas','2022-12-01 20:41:40','dfa968f178c344ffbb617189a69f1dde'),(184,2,'20220927.232801.839-financas','2022-12-01 20:41:40','b882d3d52b250e75d51d01f60dcb5a74'),(185,2,'20220927.232804.868-financas','2022-12-01 20:41:40','9182b03ed4c971de8e978608cfade076'),(186,2,'20220927.232807.904-financas','2022-12-01 20:41:40','74865b989ad787f8dde404c76cb14a53'),(187,2,'20220927.232810.940-financas','2022-12-01 20:41:40','64574cb890d3a68f55c399c71b94f28e'),(188,2,'20220927.232813.974-financas','2022-12-01 20:41:40','e439c0c5f5647d0934067c2f3b9853f9'),(189,2,'20220927.232817.010-financas','2022-12-01 20:41:40','b3b207a85d9796d1a56cce4c1a56b49b'),(190,2,'20220927.232820.040-financas','2022-12-01 20:41:40','72f29ff02dfee9425447758dc8f83990'),(191,2,'20220927.232823.062-financas','2022-12-01 20:41:40','2d22cabecc5ae170491689fdb56ff5d1'),(192,2,'20220927.232826.092-financas','2022-12-01 20:41:40','a27473b63f64a63a37d2d2180d135469'),(193,2,'20220927.232829.122-financas','2022-12-01 20:41:40','88cf35517dde7073f16846380c4baf6a'),(194,2,'20220927.232832.143-financas','2022-12-01 20:41:40','19ad4aaf52c08c22ad580db22b8a6a29'),(195,2,'20220927.232835.174-financas','2022-12-01 20:41:40','567175ba4c8e622d7a5248a7d7635097'),(196,2,'20220927.232838.193-financas','2022-12-01 20:41:40','3f2533bc336cc8c5242705b16e369f23'),(197,2,'20220927.232841.224-financas','2022-12-01 20:41:40','3fa456adefcd2eba1814deeab7ce3381'),(198,2,'20220927.232844.252-financas','2022-12-01 20:41:40','488e3e23cff6b5a31071221e374816f4'),(199,2,'20220927.232847.290-financas','2022-12-01 20:41:40','190104956b5306498dd328efdf4adc65'),(200,2,'20220927.232850.325-financas','2022-12-01 20:41:40','09ce0d9146b2513e4b8b57dc628df66b'),(201,2,'20220927.232853.357-financas','2022-12-01 20:41:40','61b3a95a48e5ab9bfc37a9f9a91bbdb3'),(202,2,'20220927.232856.391-financas','2022-12-01 20:41:40','b71e9b9d50162a269bff1586818ce063'),(203,2,'20220927.232859.421-financas','2022-12-01 20:41:40','51c3b3a59e3356ce3b654714d26b85f2'),(204,2,'20220927.232902.454-financas','2022-12-01 20:41:40','f6a37d218011050805455dc0cad711bd'),(205,2,'20220927.232905.477-financas','2022-12-01 20:41:40','7a336a61192c8ffb765ef03ad9dcde81'),(206,2,'20220927.232908.500-financas','2022-12-01 20:41:40','fd47afc5bc06e627ec70f006df081873'),(207,2,'20220927.232911.522-financas','2022-12-01 20:41:40','f37a155c9a0427b31772d5bc946ce41d'),(208,2,'20220927.232914.565-financas','2022-12-01 20:41:40','d425d352d91a432ed675562cc717aa9e'),(209,2,'20220927.232917.598-financas','2022-12-01 20:41:40','208cef8d71f4e0dacedfad7ea94c13df'),(210,2,'20220927.232920.621-financas','2022-12-01 20:41:40','14c75c6aa86c1eb191e3298067a2faa1'),(211,2,'20220927.232923.657-financas','2022-12-01 20:41:40','bbd379b9733bab5a5a204ad821786a25'),(212,2,'20220927.232926.695-financas','2022-12-01 20:41:40','4bf55087cf08a779a841666d936a55e2'),(213,2,'20220927.232929.719-financas','2022-12-01 20:41:40','212ee2d357c76416d713e0825a980021'),(214,2,'20220927.232932.746-financas','2022-12-01 20:41:40','ac674b49b5397d4fd59c74b697879111'),(215,2,'20220927.232935.782-financas','2022-12-01 20:41:40','7b59297376a6c7146b80f20b5308f31c'),(216,2,'20220927.232938.815-financas','2022-12-01 20:41:40','3ea2f2e63a146a34932efd09a23ddc2c'),(217,2,'20220927.232941.849-financas','2022-12-01 20:41:40','358c71beb8405c6f7eb053d1d0ba6a31'),(218,2,'20220927.232944.888-financas','2022-12-01 20:41:40','6a044a1b96c2a9251f10a105be1a637e'),(219,2,'20220927.232947.917-financas','2022-12-01 20:41:40','2c8a7330a5599a4a40b04f9b4aa696b3'),(220,2,'20220927.232950.951-financas','2022-12-01 20:41:40','ff64404aa074204e5a6f07ed3886d0a3'),(221,2,'20220927.232953.974-financas','2022-12-01 20:41:40','47baae3f12fa3f8297f76fa869c48619'),(222,2,'20220927.232957.014-financas','2022-12-01 20:41:40','7cc79931afe99ff5791671b18102872a'),(223,2,'20220927.233000.051-financas','2022-12-01 20:41:40','5063f07e29ddc3c774192b3c26d6b680'),(224,2,'20220927.233003.079-financas','2022-12-01 20:41:40','f3879a3003e72345b3bb15f1d2aadfb3'),(225,2,'20220927.233006.103-financas','2022-12-01 20:41:40','f7fcafc647bd4184b367898ffca4bbac'),(226,2,'20220927.233009.138-financas','2022-12-01 20:41:40','7041d82950f9390058be53b144d4218c'),(227,2,'20220927.233012.173-financas','2022-12-01 20:41:40','f63e01c2a77f84305960c15033f14de8'),(228,2,'20220927.233015.214-financas','2022-12-01 20:41:40','e2777dbe1c276f772cfa93582612e694'),(229,2,'20220927.233018.251-financas','2022-12-01 20:41:40','4d2257521a320eafab4e5564460bc699'),(230,2,'20220927.233021.285-financas','2022-12-01 20:41:40','cc4c94e40ed2d32fce779328dc6ce228'),(231,2,'20220927.233024.319-financas','2022-12-01 20:41:40','41138f629eba092198bdd65ded8b6dc4'),(232,2,'20220927.233027.356-financas','2022-12-01 20:41:40','72924ccb8a43269766d5818f635fd41a'),(233,2,'20220927.233030.384-financas','2022-12-01 20:41:40','66a6330d655014ebde3eb1310b1e12c8'),(234,2,'20220927.233033.418-financas','2022-12-01 20:41:40','d11f8a686a4fb7c2fd7219e4157547d8'),(235,2,'20220927.233036.448-financas','2022-12-01 20:41:40','2a4bc95c5e0f1d8a80ec3399d2c29f40'),(236,2,'20220927.233039.475-financas','2022-12-01 20:41:40','396c7d14c688d610f1a08197190c5299'),(237,2,'20220927.233042.508-financas','2022-12-01 20:41:40','97bff24e01e06e06ee05d2ad24bbecaa'),(238,2,'20220927.233045.537-financas','2022-12-01 20:41:40','a9da7e19350ae7bb47072de3e38aad6c'),(239,2,'20220927.233048.574-financas','2022-12-01 20:41:40','ce0926b5676eeeef97047b70791ffc2c'),(240,2,'20220927.233051.607-financas','2022-12-01 20:41:40','833487f814a3e0293e8b4f05d64778cc'),(241,2,'20220927.233054.633-financas','2022-12-01 20:41:40','5ddacd9ef5def32e72caf9180da27314'),(242,2,'20220927.233057.670-financas','2022-12-01 20:41:40','15f410b2b9837b8c2d0cfa7297586fa8'),(243,2,'20220927.233100.705-financas','2022-12-01 20:41:40','7a1e22a743e88efff36160f72223adde'),(244,2,'20220927.233103.739-financas','2022-12-01 20:41:40','364fc610dd86e15d483b0a87b8b179d5'),(245,2,'20220927.233106.773-financas','2022-12-01 20:41:40','01271c74ff643daba6be5ee2774074cd'),(246,2,'20220927.233109.798-financas','2022-12-01 20:41:40','bd974f4504a8b1bc56df8f5beed0f4c0'),(247,2,'20220927.233112.826-financas','2022-12-01 20:41:40','af91fd9a79324fcda596c5467903b1a0'),(248,2,'20220927.233115.869-financas','2022-12-01 20:41:40','3b2092aa56f66423368016b8426b921d'),(249,2,'20220927.233118.907-financas','2022-12-01 20:41:40','51dafabad217294457f3ad53e3853bb3'),(250,2,'20220927.233121.950-financas','2022-12-01 20:41:40','84c8358e211ced943082400b20b4d6db'),(251,2,'20220927.233124.971-financas','2022-12-01 20:41:40','7a3b14443c1b762fb1f64719983228c8'),(252,2,'20220927.233127.996-financas','2022-12-01 20:41:40','fa95e2cafe4c1aaccbbe6ead6a85c9ca'),(253,2,'20220927.233131.020-financas','2022-12-01 20:41:40','5a85602ff427e03ccacd076c95163f2b'),(254,2,'20220927.233134.048-financas','2022-12-01 20:41:40','e4c21ff50569fd4cdaf4ea9fd5910a9f'),(255,2,'20220927.233137.082-financas','2022-12-01 20:41:40','0f77435c2db2dfe22bee60ba56079746'),(256,2,'20220927.233140.114-financas','2022-12-01 20:41:40','032b18d573e1057118a838dfb743a243'),(257,2,'20220927.233143.138-financas','2022-12-01 20:41:40','3a85ccf7bdf69f4457157d2c67672e38'),(258,2,'20220927.233146.165-financas','2022-12-01 20:41:40','de446a686f3d407b4f55188938ede2ae'),(259,2,'20220927.233149.197-financas','2022-12-01 20:41:40','6a4a2e1f6c515a07173f31d4186fdab1'),(260,2,'20220927.233152.220-financas','2022-12-01 20:41:40','d3b1f75b9df65ed67bd548b2a2e81684'),(261,2,'20220927.233155.254-financas','2022-12-01 20:41:40','4df02e74bccd1a78ffc3df21b92dbd61'),(262,2,'20220927.233158.293-financas','2022-12-01 20:41:40','77aa43417c18dfd5c8456b2789b8f378'),(263,2,'20220927.233201.333-financas','2022-12-01 20:41:40','055961ce0504dc178e6ac76a875fad3a'),(264,2,'20220927.233204.354-financas','2022-12-01 20:41:40','4be1b35c506591f481bcc9571bcd2528'),(265,2,'20220927.233207.389-financas','2022-12-01 20:41:40','c0e69adabbb063d1c451bb37d69a4ade'),(266,2,'20220927.233210.421-financas','2022-12-01 20:41:40','f59172ba8868056247336df4ea9ce5e5'),(267,2,'20220927.233213.451-financas','2022-12-01 20:41:40','c44fdbaebaf08aeed6a71b72da56fa4d'),(268,2,'20220927.233216.484-financas','2022-12-01 20:41:40','82e0d8a88cedd8da8405ba3e148b3fd7'),(269,2,'20220927.233219.516-financas','2022-12-01 20:41:40','ce176befd552884e660a3f80d763aa37'),(270,2,'20220927.233222.552-financas','2022-12-01 20:41:40','7bc01f39e46ee26b01b3d9531da815c4'),(271,2,'20220927.233225.592-financas','2022-12-01 20:41:40','c64b567f59a1d2a54cc37c4dfe48a0f5'),(272,2,'20220927.233228.620-financas','2022-12-01 20:41:40','97c263197a04f9e58a9b70c8541a2655'),(273,2,'20220927.233231.649-financas','2022-12-01 20:41:40','4aa173db26665a1d767d91aabccf2765'),(274,2,'20220927.233234.669-financas','2022-12-01 20:41:40','954423b319ca3f84e9b9ed6891440d59'),(275,2,'20220927.233237.700-financas','2022-12-01 20:41:40','ce3a55fa3150486b35b624a608394c7a'),(276,2,'20220927.233240.741-financas','2022-12-01 20:41:40','260fc528ccad083802455156310cf2cf'),(277,2,'20220927.233243.772-financas','2022-12-01 20:41:40','af114d7416dbee6a645b5e2fad093bf9'),(278,2,'20220927.233246.800-financas','2022-12-01 20:41:40','cdfe0692a7b8452223ebf6b656ce0243'),(279,2,'20220927.233249.833-financas','2022-12-01 20:41:40','67c555acf3237f9401cbf5f12f5e6a2b'),(280,2,'20220927.233252.865-financas','2022-12-01 20:41:40','b4b6837168909bc6b8faffc67dbaeb2b'),(281,2,'20220927.233255.902-financas','2022-12-01 20:41:40','0b2f98434b422157a1370277855e7139'),(282,2,'20220927.233258.928-financas','2022-12-01 20:41:40','77f47dbe8488d79297d13afee593b41c'),(283,2,'20220927.233301.965-financas','2022-12-01 20:41:40','48416e93fd48ba1f45445139e5f46639'),(284,2,'20220927.233304.995-financas','2022-12-01 20:41:40','de78fe57dbd03461854a6b1984050869'),(285,2,'20220927.233308.032-financas','2022-12-01 20:41:40','3b67b5cbd82decc47752dd79f7b792b9'),(286,2,'20220927.233311.065-financas','2022-12-01 20:41:40','dcfff3bff2b459c65c13eac5045418e4'),(287,2,'20220927.233314.087-financas','2022-12-01 20:41:40','0ce74d04eaac15302b8a388fd50f523d'),(288,2,'20220927.233317.123-financas','2022-12-01 20:41:40','454a2c568da8f872041267fddebef7f9'),(289,2,'20220927.233320.152-financas','2022-12-01 20:41:40','6b6fb39d360aedbd3a101710e617f9e8'),(290,2,'20220927.233323.176-financas','2022-12-01 20:41:40','29ef3b60c5b259f298cf6996e106b16c'),(291,2,'20220927.233326.216-financas','2022-12-01 20:41:40','e85380628e2426a5bde217ee55e32a4c'),(292,2,'20220927.233329.250-financas','2022-12-01 20:41:40','d2ced8c25bc4472ba551c53e1bacb72f'),(293,2,'20220927.233332.286-financas','2022-12-01 20:41:40','9c6e10a416ce19f26300c12084047b83'),(294,2,'20220927.233335.309-financas','2022-12-01 20:41:40','c9a461ac3337e8a22b5d5d4d0af9a543'),(295,2,'20220927.233338.333-financas','2022-12-01 20:41:40','6b3e13d2e7a888d69a3174b067686852'),(296,2,'20220927.233341.370-financas','2022-12-01 20:41:40','497a60c7193170376456444c8f17ca46'),(297,2,'20220927.233344.403-financas','2022-12-01 20:41:40','17cd8418e8a90868e6e9079469ca9d1f'),(298,2,'20220927.233347.437-financas','2022-12-01 20:41:40','14544f04041a955c4be133299e7f6c81'),(299,2,'20220927.233350.473-financas','2022-12-01 20:41:40','6bf6048982570f304b77d165ae3cec5a'),(300,2,'20220927.233353.505-financas','2022-12-01 20:41:40','5493d3c470a20fb2335fa6656b9695d2'),(301,2,'20220927.233356.539-financas','2022-12-01 20:41:40','1453da127faa7be28f6efeabadae0506'),(302,2,'20220927.233359.570-financas','2022-12-01 20:41:40','e57161ab5d5acd10a442f6e3aa920410'),(303,2,'20220927.233402.594-financas','2022-12-01 20:41:40','dbb7694496f0c41c0ca6ebbfd273c0ae'),(304,2,'20220927.233405.621-financas','2022-12-01 20:41:40','1409808ea7cf06be7eae08d6e7bf6b03'),(305,2,'20220927.233408.650-financas','2022-12-01 20:41:40','a9752b00849c534d2ca470c007abb1a0'),(306,2,'20220927.233411.675-financas','2022-12-01 20:41:40','71a4f36c56020b1ec208b02d710e6340'),(307,2,'20220927.233414.710-financas','2022-12-01 20:41:40','63f55ef15538ba0c4f148c8915bb0de3'),(308,2,'20220927.233417.737-financas','2022-12-01 20:41:40','051b50a9406b063cb2de4007c0cd9320'),(309,2,'20220927.233420.764-financas','2022-12-01 20:41:40','4804222e1d8c831322b947e066310e3e'),(310,2,'20220927.233423.788-financas','2022-12-01 20:41:40','54338e6336e5578c645e63f93a0bc600'),(311,2,'20220927.233426.817-financas','2022-12-01 20:41:40','ecb6329e6062802f3b7c3c5d8914962a'),(312,2,'20220927.233429.843-financas','2022-12-01 20:41:40','08ea222035b69e961454c2c3e610ca18'),(313,2,'20220927.233432.871-financas','2022-12-01 20:41:40','f8e6257fa9167fb647f365941521a35d'),(314,2,'20220927.233435.901-financas','2022-12-01 20:41:40','7ff2b100be313e5880712508c3bca0e3'),(315,2,'20220927.233438.928-financas','2022-12-01 20:41:40','2546fa679be69da5d6d55c02a1788364'),(316,2,'20220927.233441.956-financas','2022-12-01 20:41:40','6e458d3685a09478df2ceda7e824fd3f'),(317,2,'20220927.233444.994-financas','2022-12-01 20:41:40','15e1655459bcf3a3d0d34cd7c2f9d2fa'),(318,2,'20220927.233448.030-financas','2022-12-01 20:41:40','abd81e3751a9898791e5538a18988ad7'),(319,2,'20220927.233451.058-financas','2022-12-01 20:41:40','319e10ad2dcb6b27f078f79eaacca4b0'),(320,2,'20220927.233454.093-financas','2022-12-01 20:41:40','18bd385d8b762ae732cae16fbd219dd2'),(321,2,'20220927.233457.121-financas','2022-12-01 20:41:40','96b9ad364963d87c3b33c997c558ab79'),(322,2,'20220927.233500.160-financas','2022-12-01 20:41:40','27e1dc59888a56cd62120c0c885806b6'),(323,2,'20220927.233503.188-financas','2022-12-01 20:41:40','047a87662b67f59f42c9941ff80cba72'),(324,2,'20220927.233506.220-financas','2022-12-01 20:41:40','3aa588107fa55b24eebc6df4aa048045'),(325,2,'20220927.233509.252-financas','2022-12-01 20:41:40','487b2d52ecc9212c3413e3a96f2c7aa3'),(326,2,'20220927.233512.279-financas','2022-12-01 20:41:40','4b6b9089d150f4ed91dd14027b27e64d'),(327,2,'20220927.233515.317-financas','2022-12-01 20:41:40','04b81ab7822d4aa7c63fce6dd23ef978'),(328,2,'20220927.233518.346-financas','2022-12-01 20:41:40','ca0fd413d7b00410e8a596296072bdf4'),(329,2,'20220927.233521.383-financas','2022-12-01 20:41:40','a8cdb306fd1eb3f9c8bcdb0aa4f798e8'),(330,2,'20220927.233524.416-financas','2022-12-01 20:41:40','14a5cbe9220461250c3bc7551a1e4af3'),(331,2,'20220927.233527.451-financas','2022-12-01 20:41:40','ff52b887efc19e70e5260ca3edbe31f0'),(332,2,'20220927.233530.482-financas','2022-12-01 20:41:40','8882f33d7a5e9a7069d7c4173165faae'),(333,2,'20220927.233533.508-financas','2022-12-01 20:41:40','6963761a305b6c6dfca911c87f8551e4'),(334,2,'20220927.233536.538-financas','2022-12-01 20:41:40','bde006fb0ba3affcd47f9650203fa58b'),(335,2,'20220927.233539.570-financas','2022-12-01 20:41:40','b764ec4eae582a884513a5258b833530'),(336,2,'20220927.233542.602-financas','2022-12-01 20:41:40','c39444e13ccb35bf0079b7a03fb0d7f2'),(337,2,'20220927.233545.635-financas','2022-12-01 20:41:40','c1bdc0e60885b7814e28ebea59f93570'),(338,2,'20220927.233548.663-financas','2022-12-01 20:41:40','8361676e24708c063bbba38cb74aabae'),(339,2,'20220927.233551.702-financas','2022-12-01 20:41:40','063f9b295cbb7072b63bdfcfdf42a443'),(340,2,'20220927.233554.731-financas','2022-12-01 20:41:40','439d8b9b55b65c10d27adc5e48cf9e20'),(341,2,'20220927.233557.763-financas','2022-12-01 20:41:40','83069e1e4c9e5e46b70beb72b94d6aa7'),(342,2,'20220927.233600.787-financas','2022-12-01 20:41:40','667b41ed9b20b84c76661bfb642e1a97'),(343,2,'20220927.233603.828-financas','2022-12-01 20:41:40','8fa04ca50f0c63ff599e4ce949af2fb6'),(344,2,'20220927.233606.856-financas','2022-12-01 20:41:40','b0e5cec3e9aedf4e8157d5b914caadf9'),(345,2,'20220927.233609.882-financas','2022-12-01 20:41:40','f7b553a3431a00420ecc83266c126d4b'),(346,2,'20220927.233612.916-financas','2022-12-01 20:41:40','667182dee7a0e6bae68a9b84ad871900'),(347,2,'20220927.233615.956-financas','2022-12-01 20:41:40','4ba96add7ab8e521ac3b283f4e18a630'),(348,2,'20220927.233618.986-financas','2022-12-01 20:41:40','8d1aa222e99d88801083032ca26c7883'),(349,2,'20220927.233622.014-financas','2022-12-01 20:41:40','a306c94c92c141ed64c6f7ab290c5287'),(350,2,'20220927.233625.042-financas','2022-12-01 20:41:40','cc04663a0070a83940c45e9b8d1fcca1'),(351,2,'20220927.233628.079-financas','2022-12-01 20:41:40','fe6eab6c4d435833a725afae9ad5ec17'),(352,2,'20220927.233631.113-financas','2022-12-01 20:41:40','ac0a5a1728ed1a9a41405d6ac0c54865'),(353,2,'20220927.233634.148-financas','2022-12-01 20:41:40','448dd53e9d2dadb82feb222ee1cad0bd'),(354,2,'20220927.233637.174-financas','2022-12-01 20:41:40','a8e1cf309df914706f4c86f1df399f90'),(355,2,'20220927.233640.203-financas','2022-12-01 20:41:40','d6f26cfd547952a7958415f0b3d6c889'),(356,2,'20220927.233643.239-financas','2022-12-01 20:41:40','96d9f49dc505bd590caa181c4195fbc1'),(357,2,'20220927.233646.274-financas','2022-12-01 20:41:40','39f005980f757bdb67e236660deb6bd6'),(358,2,'20220927.233649.314-financas','2022-12-01 20:41:40','011abdf6ccdc7c46dae03a67458cd0c1'),(359,2,'20220927.233652.341-financas','2022-12-01 20:41:40','918ef79b616872b7332d6c4d2385b547'),(360,2,'20220927.233655.369-financas','2022-12-01 20:41:40','cfe20b4da7ee9552a51d0110849fb4b3'),(361,2,'20220927.233658.406-financas','2022-12-01 20:41:40','244bd2fb1cd806c5ca894eb3ab5a0123'),(362,2,'20220927.233701.434-financas','2022-12-01 20:41:40','f356b7c451552af320db238a1c3b2ab2'),(363,2,'20220927.233704.470-financas','2022-12-01 20:41:40','edf3f63beeda6a28bffee682bac6cd2f'),(364,2,'20220927.233707.503-financas','2022-12-01 20:41:40','fdfc54bfe7d1d30723d1b00cb3c4467f'),(365,2,'20220927.233710.545-financas','2022-12-01 20:41:40','2ab3ccd6ee789b976f8e2e8620c8470c'),(366,2,'20220927.233713.585-financas','2022-12-01 20:41:40','b7f8b0ed024027e599ef7a9c5853edff'),(367,2,'20220927.233716.615-financas','2022-12-01 20:41:40','4d4b73e4166124a99a1bdee018ce5684'),(368,2,'20220927.233719.646-financas','2022-12-01 20:41:40','147d8ca8dc690a634252f6f3d2b9d3af'),(369,2,'20220927.233722.675-financas','2022-12-01 20:41:40','c936bc72010822c18c42436e99628b81'),(370,2,'20220927.233725.702-financas','2022-12-01 20:41:40','1d95d53488a12da8fff75617f30526a4'),(371,2,'20220927.233728.733-financas','2022-12-01 20:41:40','bca53baf3b92ded8c1147be481e3e63b'),(372,2,'20220927.233731.770-financas','2022-12-01 20:41:40','b07eca19dad4102f8b19990eabb36304'),(373,2,'20220927.233734.803-financas','2022-12-01 20:41:40','d402dba13e1146eec5e092a3c8e8e44c'),(374,2,'20220927.233737.839-financas','2022-12-01 20:41:40','7807796a0b079648cd9970bba150ea0c'),(375,2,'20220927.233740.871-financas','2022-12-01 20:41:40','25f92b1ded8e8943d61ac1021b52e194'),(376,2,'20220927.233743.907-financas','2022-12-01 20:41:40','3794ed01c44cd9dddac7328aba75cdf4'),(377,2,'20220927.233746.934-financas','2022-12-01 20:41:40','3906ef9597618e302916f0481fc1cd29'),(378,2,'20220927.233749.963-financas','2022-12-01 20:41:40','3f67b3e2a418a8a4c6d92a57815eb3fd'),(379,2,'20220927.233753.003-financas','2022-12-01 20:41:40','307a2563083fe9f6ca72dd48e81ea4c8'),(380,2,'20220927.233756.033-financas','2022-12-01 20:41:40','8babe5733551c5ebc5284bc2c4ab0498'),(381,2,'20220927.233759.067-financas','2022-12-01 20:41:40','81a0d6800c4f807097e5ef68894ac7d4'),(382,2,'20220927.233802.099-financas','2022-12-01 20:41:40','3d3a5db3acf5cd50c81f31edd464746d'),(383,2,'20220927.233805.139-financas','2022-12-01 20:41:40','318dc96e2f6d77dd3c930ced254d5bda'),(384,2,'20220927.233808.164-financas','2022-12-01 20:41:40','dfcb8580340ec068b9f7908ff1b64fb5'),(385,2,'20220927.233811.192-financas','2022-12-01 20:41:40','2485064ef72e437210d7a519aa7a9d60'),(386,2,'20220927.233814.222-financas','2022-12-01 20:41:40','ad4eeeccb37655bba7d08d2a504b648a'),(387,2,'20220927.233817.252-financas','2022-12-01 20:41:40','a0b18e452da06b60265ca1c555afca8f'),(388,2,'20220927.233820.280-financas','2022-12-01 20:41:40','f7e0fb859be7584819a8b4f490aaedc8'),(389,2,'20220927.233823.308-financas','2022-12-01 20:41:40','0b5531ada9839465f5821798ba8eba04'),(390,2,'20220927.233826.348-financas','2022-12-01 20:41:40','9ae54a7ab3366dc717f7b2dadb142b21'),(391,2,'20220927.233829.388-financas','2022-12-01 20:41:40','a372cda87bd70be705936a3d77d8014c'),(392,2,'20220927.233832.426-financas','2022-12-01 20:41:40','ae83a57f354b1545fdbcd38ce6873b0d'),(393,2,'20220927.233835.452-financas','2022-12-01 20:41:40','84cefc04202a24bf4e68f49e52fd11e1'),(394,2,'20220927.233838.483-financas','2022-12-01 20:41:40','54c512c9e89077f3e1f04087b8c9d55c'),(395,2,'20220927.233841.510-financas','2022-12-01 20:41:40','70c7a66a027a9adea8195f56bae97e97'),(396,2,'20220927.233844.540-financas','2022-12-01 20:41:40','744f9c98ce083c62bec8b0fcc80191c2'),(397,2,'20220927.233847.567-financas','2022-12-01 20:41:40','7a602488fbd4f52d95ed44ed6fd7e0cd'),(398,2,'20220927.233850.604-financas','2022-12-01 20:41:40','85393855b14681a05bd9134ec000f641'),(399,2,'20220927.233853.626-financas','2022-12-01 20:41:40','4b2831b531e3772406648238c8226de4'),(400,2,'20220927.233856.660-financas','2022-12-01 20:41:40','fa359b7cb7704cb8478501a03fe4ee51'),(401,2,'20220927.233859.698-financas','2022-12-01 20:41:40','13290b60396596a06ef4b2b8e0e0b3c6'),(402,2,'20220927.233902.727-financas','2022-12-01 20:41:40','d8758b7d1bb07a806bc58f1a6838ee41'),(403,2,'20220927.233905.755-financas','2022-12-01 20:41:40','2b96555dd7f0c444ce05de7f3bdd778a'),(404,2,'20220927.233908.783-financas','2022-12-01 20:41:40','33335e78eadba1a2c7960ff3dcabe464'),(405,2,'20220927.233911.822-financas','2022-12-01 20:41:40','fc108941da7c144e12995aed065acec5'),(406,2,'20220927.233914.848-financas','2022-12-01 20:41:40','64b6872924ae8c9b18d8c29a7bdb22f7'),(407,2,'20220927.233917.883-financas','2022-12-01 20:41:40','e6750582c15fa1a84e543e9663a2ffb5'),(408,2,'20220927.233920.911-financas','2022-12-01 20:41:40','44658e8dca334b5b8337647d66480347'),(409,2,'20220927.233923.943-financas','2022-12-01 20:41:40','92a7b72f2cd8c69a8856cbb592699717'),(410,2,'20220927.233926.980-financas','2022-12-01 20:41:40','bfa035856c43bb1c8a9f28be527cd91d'),(411,2,'20220927.233930.002-financas','2022-12-01 20:41:40','84e93d760c7e6ea6e466a165b03b9d74'),(412,2,'20220927.233933.033-financas','2022-12-01 20:41:40','0fa362bbf44de1952b69045e2cf9304f'),(413,2,'20220927.233936.059-financas','2022-12-01 20:41:40','02cb7192f8d062dadcc292829a40a80b'),(414,2,'20220927.233939.083-financas','2022-12-01 20:41:40','84e8a7fa993d7fa24a286e4417c45fbd'),(415,2,'20220927.233942.114-financas','2022-12-01 20:41:40','80b8956f57f6bd99983cedebda9dd222'),(416,2,'20220927.233945.146-financas','2022-12-01 20:41:40','d3b5788f310aa495a0ad438a2027cff9'),(417,2,'20220927.233948.182-financas','2022-12-01 20:41:40','7a47b374ead33167d5e44be7b8ddedbf'),(418,2,'20220927.233951.214-financas','2022-12-01 20:41:40','2a03be2eb7f34dc98ab767b2e35e9cd4'),(419,2,'20220927.233954.246-financas','2022-12-01 20:41:40','427a4c0e778c67d24b4dfef503d16f0b'),(420,2,'20220927.233957.277-financas','2022-12-01 20:41:40','e0ca3a2fa4abe45126f202b5d3892982'),(421,2,'20220927.234000.314-financas','2022-12-01 20:41:40','999a89fe1cd6b9ff822d4ae93ef0215b'),(422,2,'20220927.234003.355-financas','2022-12-01 20:41:40','4c59e8c7f89a6c69092b8a785fe624e6'),(423,2,'20220927.234006.387-financas','2022-12-01 20:41:40','83093987c62859c87c81c6b0303ba2d8'),(424,2,'20220927.234009.422-financas','2022-12-01 20:41:40','702e3613be5c9bcf21fce8a08e267636'),(425,2,'20220927.234012.459-financas','2022-12-01 20:41:40','f6a1a9c4812469359c147d38c3b914b0'),(426,2,'20220927.234015.492-financas','2022-12-01 20:41:40','7f0f1fbaaf130d324d90593ca2da958e'),(427,2,'20220927.234018.526-financas','2022-12-01 20:41:40','1b39a353693c5e02739173276440bef5'),(428,2,'20220927.234021.564-financas','2022-12-01 20:41:40','0727cc893bf653e7dce909c0818a70af'),(429,2,'20220927.234024.597-financas','2022-12-01 20:41:40','df0bbec1389caed68d6bc9bdf7ec61d8'),(430,2,'20220927.234027.624-financas','2022-12-01 20:41:40','b02abbd66865c4fb95d975ec23efc2ec'),(431,2,'20220927.234030.652-financas','2022-12-01 20:41:40','a076d9daad5c2a41468c1d481840fca8'),(432,2,'20220927.234033.680-financas','2022-12-01 20:41:40','8046705142b60d304a4c4dd9b82a4e57'),(433,2,'20220927.234036.716-financas','2022-12-01 20:41:40','4989aa5b2910de21450cf2ecbf110dac'),(434,2,'20220927.234039.750-financas','2022-12-01 20:41:40','7cc9c560d1eb2df40dab32d9f305a043'),(435,2,'20220927.234042.783-financas','2022-12-01 20:41:40','5b16b2ea7856a1dc9d942ccdbd2ef028'),(436,2,'20220927.234045.824-financas','2022-12-01 20:41:40','3e5cc3781e2180fbe19d67c48ba81b4d'),(437,2,'20220927.234048.861-financas','2022-12-01 20:41:40','f25941bce1096324026338be94cbf21b'),(438,2,'20220927.234051.896-financas','2022-12-01 20:41:40','89c800dc4e9639d97c692e9a3f99526d'),(439,2,'20220927.234054.919-financas','2022-12-01 20:41:40','4998df48f9c35a1a8ab6b09eab516786'),(440,2,'20220927.234057.948-financas','2022-12-01 20:41:40','f7914bd5416d7a81633a9d23e520aec6'),(441,2,'20220927.234100.982-financas','2022-12-01 20:41:40','503b18d8c42a1e0972709f14449637f5'),(442,2,'20220927.234104.009-financas','2022-12-01 20:41:40','b9cbd4b8b3fc2dc4b4c3171806d2e3b4'),(443,2,'20220927.234107.042-financas','2022-12-01 20:41:40','f91619cb511ccfa6965f3a9fa9514f5c'),(444,2,'20220927.234110.074-financas','2022-12-01 20:41:40','537c35d2d4da05e1be88a9b704fbea09'),(445,2,'20220927.234113.111-financas','2022-12-01 20:41:40','c39ff9e77c33b47c792f1cf9a5415490'),(446,2,'20220927.234116.143-financas','2022-12-01 20:41:40','609b896da7beabdeae92878424ad26a1'),(447,2,'20220927.234119.177-financas','2022-12-01 20:41:40','126d918670cb527509ba8e4eda8ab2bd'),(448,2,'20220927.234122.223-financas','2022-12-01 20:41:40','3a620305d3ac77e23730c32514f3ad49'),(449,2,'20220927.234125.250-financas','2022-12-01 20:41:40','3b7db4faa592de8fc211c2e8c3ffdfb8'),(450,2,'20220927.234128.279-financas','2022-12-01 20:41:40','66c6dbb858fc836475953413fd4d381e'),(451,2,'20220927.234131.309-financas','2022-12-01 20:41:40','9ffa49b3062c50b5e26f432d51866c09'),(452,2,'20220927.234134.344-financas','2022-12-01 20:41:40','17555fe8eb828d765757168beea35d17'),(453,2,'20220927.234137.383-financas','2022-12-01 20:41:40','e1970899a8742cd9b4595627eed5bb6d'),(454,2,'20220927.234140.415-financas','2022-12-01 20:41:40','fc7dc595e5662fc5aab68110df046f0a'),(455,2,'20220927.234143.438-financas','2022-12-01 20:41:40','b0079e696f29b955d44d78e390110b19'),(456,2,'20220927.234146.463-financas','2022-12-01 20:41:40','152f2d8dcf23713f6dff31a3f305bcdc'),(457,2,'20220927.234149.499-financas','2022-12-01 20:41:40','b04b223ddef84420727ef5ea0a066d23'),(458,2,'20220927.234152.529-financas','2022-12-01 20:41:40','057b6425874c9b3dd6ada0bf98f8bb82'),(459,2,'20220927.234155.560-financas','2022-12-01 20:41:40','e2d5c17d0232c96dc112c32b90b1aec7'),(460,2,'20220927.234158.602-financas','2022-12-01 20:41:40','c367c72a8d9bc49a9158e4690d298d27'),(461,2,'20220927.234201.632-financas','2022-12-01 20:41:40','0a7e40e0b99273d4785a66f3fed95dfe'),(462,2,'20220927.234204.659-financas','2022-12-01 20:41:40','19632b53b2190238c57b66de9584b844'),(463,2,'20220927.234207.685-financas','2022-12-01 20:41:40','b558608b4141cadceb8d36ddb1cdfd38'),(464,2,'20220927.234210.720-financas','2022-12-01 20:41:40','272040b8daf2f2e5f98b252193614023'),(465,2,'20220927.234213.750-financas','2022-12-01 20:41:40','2c600631427d63cf2a39c1cf35a3849f'),(466,2,'20220927.234216.790-financas','2022-12-01 20:41:40','cf1d62f6c1140460e38a88bc86001838'),(467,2,'20220927.234219.817-financas','2022-12-01 20:41:40','9f653993fc45ee4ca5c65c106ef567cf'),(468,2,'20220927.234222.846-financas','2022-12-01 20:41:40','6f65217433111ae806d198f3c6b62d24'),(469,2,'20220927.234225.877-financas','2022-12-01 20:41:40','cc3fccd803c4af17b9e438c10dbff6ee'),(470,2,'20220927.234228.905-financas','2022-12-01 20:41:40','33c1143f0e041117aad08898fb23f257'),(471,2,'20220927.234231.935-financas','2022-12-01 20:41:40','7fb7c330d7f94d09a343624895141014'),(472,2,'20220927.234234.973-financas','2022-12-01 20:41:40','0cc0be1fc60d2c38ad694ea588d093d8'),(473,2,'20220927.234237.995-financas','2022-12-01 20:41:40','4981750ce74067e6846d4cc313269a94'),(474,2,'20220927.234241.022-financas','2022-12-01 20:41:40','42bf7ce23d0fc825f08423d83b69b64e'),(475,2,'20220927.234244.049-financas','2022-12-01 20:41:40','02742216af9e155cf836911bb3b67509'),(476,2,'20220927.234247.072-financas','2022-12-01 20:41:40','9ecc3ff1279f7589bd0034074b10c783'),(477,2,'20220927.234250.102-financas','2022-12-01 20:41:40','005d47a5f8571048fa61f24b3f543382'),(478,2,'20220927.234253.132-financas','2022-12-01 20:41:40','4f343b87a963c6ad0af5e7d6395bcbf3'),(479,2,'20220927.234256.154-financas','2022-12-01 20:41:40','82c67530ec7d1aff4d0648d61a328f8f'),(480,2,'20220927.234259.185-financas','2022-12-01 20:41:40','d259a45bfd2321790446ceb997eabc1d'),(481,2,'20220927.234302.226-financas','2022-12-01 20:41:40','5cdfe8361bd57afce34c9e3744dcfc41'),(482,2,'20220927.234305.266-financas','2022-12-01 20:41:40','abc575302d517c121906acc59f5cf5aa'),(483,2,'20220927.234308.285-financas','2022-12-01 20:41:40','6635de39bc3243feefc919c3649851da'),(484,2,'20220927.234311.309-financas','2022-12-01 20:41:40','c5e09efcc5b5e4da0e2b93fe1d471530'),(485,2,'20220927.234314.346-financas','2022-12-01 20:41:40','f79be9628a773474a32a460ffb12a951'),(486,2,'20220927.234317.371-financas','2022-12-01 20:41:40','8c0c0422bf7e5945baad836f398b0668'),(487,2,'20220927.234320.407-financas','2022-12-01 20:41:40','886285dba36593568117c82d9a3cb8c7'),(488,2,'20220927.234323.442-financas','2022-12-01 20:41:40','077400bc3ec68ab5f64b546563b8449d'),(489,2,'20220927.234326.470-financas','2022-12-01 20:41:40','62a9879787e9e96b9b92af78861153c8'),(490,2,'20220927.234329.500-financas','2022-12-01 20:41:40','633fcf954d95430f1dd0ef2991899105'),(491,2,'20220927.234332.536-financas','2022-12-01 20:41:40','2970aea98ae1406ec5f9cb083831fc11'),(492,2,'20220927.234335.565-financas','2022-12-01 20:41:40','0f0ca0f13bcb82e5bffc9b6b2001efb9'),(493,2,'20220927.234338.589-financas','2022-12-01 20:41:40','1e29be1a65d90207325d1ba0424f51af'),(494,2,'20220927.234341.613-financas','2022-12-01 20:41:40','a52efd417964bd2f0df924362c991bcc'),(495,2,'20220927.234344.648-financas','2022-12-01 20:41:40','c3e10cd1109d2d804b2c653bc3d138bc'),(496,2,'20220927.234347.686-financas','2022-12-01 20:41:40','7ad84285e37fa153b1c5b8c9b1e5c5b4'),(497,2,'20220927.234350.718-financas','2022-12-01 20:41:40','16edc37225ea27ee7e73f057231ebec0'),(498,2,'20220927.234353.754-financas','2022-12-01 20:41:40','1b4de94c417003c735033193ba62ffc3'),(499,2,'20220927.234356.786-financas','2022-12-01 20:41:40','30b51ffe2e65e1c496ad43b0557f1131'),(500,2,'20220927.234359.815-financas','2022-12-01 20:41:40','5668d8f5704cfdf2d97c939233541be1'),(501,2,'20220927.234402.850-financas','2022-12-01 20:41:40','68b04c4f517c56f3e7d4e4b62cd70b06'),(502,2,'20220927.234405.879-financas','2022-12-01 20:41:40','3e4053de6a868ef2897ce59af33cc659'),(503,2,'20220927.234408.909-financas','2022-12-01 20:41:40','6af441c471a1b393c91503a85a947c46'),(504,2,'20220927.234411.945-financas','2022-12-01 20:41:40','cd021e4b68597101968caec8b79b1e49'),(505,2,'20220927.234414.973-financas','2022-12-01 20:41:40','801220cde140753c5d594a881425f3ca'),(506,2,'20220927.234418.005-financas','2022-12-01 20:41:40','fa656d9ae657fc3f2afaa224c3bfdede'),(507,2,'20220927.234421.033-financas','2022-12-01 20:41:40','12e0b475c27f4cca66a22e4391a1309a'),(508,2,'20220927.234424.053-financas','2022-12-01 20:41:40','12ac72aed39c01dfd9fe0c34506d9945'),(509,2,'20220927.234427.086-financas','2022-12-01 20:41:40','b1ae3376344f8036ff5eae445c9c3ca6'),(510,2,'20220927.234430.124-financas','2022-12-01 20:41:40','92e270a4dbd5148adc2ee9b0c4496c83'),(511,2,'20220927.234433.150-financas','2022-12-01 20:41:40','938ff918a31e4cf4946bf124c7259c7b'),(512,2,'20220927.234436.187-financas','2022-12-01 20:41:40','85af9dd239ae4c551ec86df5d8f04e7c'),(513,2,'20220927.234439.218-financas','2022-12-01 20:41:40','a1c5a5c3e502a353b2acd4b959260324'),(514,2,'20220927.234442.242-financas','2022-12-01 20:41:40','89358832009a9b24971afc582192dd92'),(515,2,'20220927.234445.280-financas','2022-12-01 20:41:40','87f9bcff601eb594648eb1fbec99b750'),(516,2,'20220927.234448.302-financas','2022-12-01 20:41:40','7b9ef98cb397ad6fdb5b01a08d9d3529'),(517,2,'20220927.234451.337-financas','2022-12-01 20:41:40','de335b94913680b6dfe2ead084726450'),(518,2,'20220927.234454.363-financas','2022-12-01 20:41:40','cf8d64f369aadac491392705f16476a1'),(519,2,'20220927.234457.399-financas','2022-12-01 20:41:40','ab95510371caec77ae881b81b2dcc5a9'),(520,2,'20220927.234500.428-financas','2022-12-01 20:41:40','cf396da4302917045d8976668ea70091'),(521,2,'20220927.234503.466-financas','2022-12-01 20:41:40','49170bfed25798790cdc3c2355c6be59'),(522,2,'20220927.234506.492-financas','2022-12-01 20:41:40','04d553b3362e9572971b4d63a6618f7c'),(523,2,'20220927.234509.515-financas','2022-12-01 20:41:40','82c5323c4c54c5bec56ac4aecc091646'),(524,2,'20220927.234512.544-financas','2022-12-01 20:41:40','d809d85098a5e2437d0b7857eb617e33'),(525,2,'20220927.234515.573-financas','2022-12-01 20:41:40','5242eadcb24d64d87a28495afb8c83ef'),(526,2,'20220927.234518.607-financas','2022-12-01 20:41:40','8e4e39ecb20b71ef2b7da15e7b8963ad'),(527,2,'20220927.234521.650-financas','2022-12-01 20:41:40','e2c640c655dd86030b40537302aa93ee'),(528,2,'20220927.234524.691-financas','2022-12-01 20:41:40','2dd6f83f6fd125bcd8f9ff31691f8424'),(529,2,'20220927.234527.727-financas','2022-12-01 20:41:40','6aba2f1adf8675321f51e8fc71c9d1cd'),(530,2,'20220927.234530.755-financas','2022-12-01 20:41:40','77cef2ee803e45bc662e7541aba0c93a'),(531,2,'20220927.234533.783-financas','2022-12-01 20:41:40','63f2adfa0d94d8ebc57d49c04230876a'),(532,2,'20220927.234536.811-financas','2022-12-01 20:41:40','4cd892757b01501238f7bf2e9be5ed9c'),(533,2,'20220927.234539.840-financas','2022-12-01 20:41:40','c9ee37ced5ea5626829d8caaab8f119f'),(534,2,'20220927.234542.875-financas','2022-12-01 20:41:40','8db8dd7545eea5717ab7d19178bcab82'),(535,2,'20220927.234545.915-financas','2022-12-01 20:41:40','1415ef29dd0ce416d86cea038d35767a'),(536,2,'20220927.234548.943-financas','2022-12-01 20:41:40','0e01c2e789e384be5f0b5350bf38b20b'),(537,2,'20220927.234551.965-financas','2022-12-01 20:41:40','aaf78dc31567193f374a095ac9d3a215'),(538,2,'20220927.234554.999-financas','2022-12-01 20:41:40','86857611cdf8b06ece3e290ab94da9d9'),(539,2,'20220927.234558.033-financas','2022-12-01 20:41:40','67c5d948272a4d1a4a7b3ce28ef51c87'),(540,2,'20220927.234601.061-financas','2022-12-01 20:41:40','edeb3fa14d36eb62849352d671a44948'),(541,2,'20220927.234604.087-financas','2022-12-01 20:41:40','2c166ced7a5558852a83c252c60e01b5'),(542,2,'20220927.234607.113-financas','2022-12-01 20:41:40','df380b6b68ebe940878872ba844a40cd'),(543,2,'20220927.234610.142-financas','2022-12-01 20:41:40','17ba96c45ba47eb4693218c361839210'),(544,2,'20220927.234613.167-financas','2022-12-01 20:41:40','fe1f3e89b312f400c1778846ebb3e278'),(545,2,'20220927.234616.199-financas','2022-12-01 20:41:40','c81af5baad158032ef398600e5cd5887'),(546,2,'20220927.234619.225-financas','2022-12-01 20:41:40','790ea039e5732284fc4414c6ea159376'),(547,2,'20220927.234622.260-financas','2022-12-01 20:41:40','c7eb00426596e4b06ca74178b00a80b4'),(548,2,'20220927.234625.281-financas','2022-12-01 20:41:40','66aecfe2824a78bf6bb3c26a2720043e'),(549,2,'20220927.234628.310-financas','2022-12-01 20:41:40','0540e6d0d8180be7b27e08b2a207be41'),(550,2,'20220927.234631.345-financas','2022-12-01 20:41:40','1ab420238ec26240079ef75dcf15e073'),(551,2,'20220927.234634.367-financas','2022-12-01 20:41:40','96d756b1d9824156b957ee44800f54d5'),(552,2,'20220927.234637.395-financas','2022-12-01 20:41:40','68baba0aa7de37c2d39025f09567bf7f'),(553,2,'20220927.234640.433-financas','2022-12-01 20:41:40','ecb30e3bbbd73d35a74bf2af0fbf64ca'),(554,2,'20220927.234643.466-financas','2022-12-01 20:41:40','0519dffacdeb51d582b70355df9ab93d'),(555,2,'20220927.234646.499-financas','2022-12-01 20:41:40','4fc76a120f0d279de4a70638609c8cb4'),(556,2,'20220927.234649.531-financas','2022-12-01 20:41:40','0776434d2e852be5280a5d93ff572b1b'),(557,2,'20220927.234652.558-financas','2022-12-01 20:41:40','916bbcd4cba16471f2cb940f5a0d32e9'),(558,2,'20220927.234655.593-financas','2022-12-01 20:41:40','646a6f952e07593c43e0927aed2d6c8a'),(559,2,'20220927.234658.628-financas','2022-12-01 20:41:40','0c6c201bb337c411ff28a71f8ed863cd'),(560,2,'20220927.234701.655-financas','2022-12-01 20:41:40','779731977de0d03bcf5a92b5b377bb3c'),(561,2,'20220927.234704.694-financas','2022-12-01 20:41:40','6f6d568fa775741b7771ce3531d251f0'),(562,2,'20220927.234707.731-financas','2022-12-01 20:41:40','1f1559e7bde0cce4a4ee6dbc9316224c'),(563,2,'20220927.234710.762-financas','2022-12-01 20:41:40','e02bc247121560cdfe6aad6b5362a2ba'),(564,2,'20220927.234713.798-financas','2022-12-01 20:41:40','cb9d24822a8829c2056d2fc782e5dd91'),(565,2,'20220927.234716.828-financas','2022-12-01 20:41:40','3264fb4092d2ceaa0d58d74259647518'),(566,2,'20220927.234719.859-financas','2022-12-01 20:41:40','91e70cd7b21def210a16078f31868ab6'),(567,2,'20220927.234722.892-financas','2022-12-01 20:41:40','ba33592c137b3ba09ca786493e32a6f0'),(568,2,'20220927.234725.924-financas','2022-12-01 20:41:40','8f8d6ee23c1ed5e60c863463fde73a9a'),(569,2,'20220927.234728.952-financas','2022-12-01 20:41:40','90b248f18b500d47181decb8c6224565'),(570,2,'20220927.234731.973-financas','2022-12-01 20:41:40','180f68790b5af63cfb476e23d349b77d'),(571,2,'20220927.234735.011-financas','2022-12-01 20:41:40','d961d6855f0efd5fb50ee405ea459597'),(572,2,'20220927.234738.038-financas','2022-12-01 20:41:40','51a032055727f2107bebcc3229c2ce3b'),(573,2,'20220927.234741.072-financas','2022-12-01 20:41:40','207355ab283044fc94c8c81f0658dd1f'),(574,2,'20220927.234744.110-financas','2022-12-01 20:41:40','d4f7640775bbc8033ec61b67c6c750c8'),(575,2,'20220927.234747.131-financas','2022-12-01 20:41:40','d6d007899014adeca2063978fc9ccb7d'),(576,2,'20220927.234750.167-financas','2022-12-01 20:41:40','9d52d20299217ab71588257df14b5496'),(577,2,'20220927.234753.206-financas','2022-12-01 20:41:40','d425bbd6588fd40e554df2266d50506c'),(578,2,'20220927.234756.227-financas','2022-12-01 20:41:40','1832d78fec161d6ae0452374bbfe431a'),(579,2,'20220927.234759.250-financas','2022-12-01 20:41:40','f29de7ced8badc2899b9c45f20b90f9b'),(580,2,'20220927.234802.280-financas','2022-12-01 20:41:40','a919442bad4cbf914c6bfec5ba5bd0e4'),(581,2,'20220927.234805.310-financas','2022-12-01 20:41:40','af31aad7b2848c9138f7c3a0981841d3'),(582,2,'20220927.234808.348-financas','2022-12-01 20:41:40','3751d2491a6d71f1b19d31c59a884d3c'),(583,2,'20220927.234811.383-financas','2022-12-01 20:41:40','c5ea5ec0e70c6a11225c253af8ec76b8'),(584,2,'20220927.234814.409-financas','2022-12-01 20:41:40','d2d0dd104c470c0e054f097fb609f570'),(585,2,'20220927.234817.434-financas','2022-12-01 20:41:40','5aea62eec2fca26e7cb5916e37626019'),(586,2,'20220927.234820.463-financas','2022-12-01 20:41:40','293412003d5ec368a2646cf0954685f5'),(587,2,'20220927.234823.502-financas','2022-12-01 20:41:40','5589f59fcee5d810e7770e8853eeda0b'),(588,2,'20220927.234826.538-financas','2022-12-01 20:41:40','6ceef354de2432db6db3430adc5541b2'),(589,2,'20220927.234829.575-financas','2022-12-01 20:41:40','ede188f77292c262de65a9f65811154b'),(590,2,'20220927.234832.602-financas','2022-12-01 20:41:40','dc172fc5185ead41867b4a8830487792'),(591,2,'20220927.234835.630-financas','2022-12-01 20:41:40','d72ceaec02dda3a59ebf5bd610dce40c'),(592,2,'20220927.234838.660-financas','2022-12-01 20:41:40','e21c499b3ba2cfd6f295f507794ece11'),(593,2,'20220927.234841.690-financas','2022-12-01 20:41:40','a0e7e811514677228c7da98c82206a28'),(594,2,'20220927.234844.722-financas','2022-12-01 20:41:40','a2893913055feb2b627935e746e78276'),(595,2,'20220927.234847.754-financas','2022-12-01 20:41:40','45460b10c9a2b12a79907759ee9f987e'),(596,2,'20220927.234850.785-financas','2022-12-01 20:41:40','99eab707b7734406c409b1d768a689b3'),(597,2,'20220927.234853.816-financas','2022-12-01 20:41:40','fdaee7915fa7512420026eb00acb6649'),(598,2,'20220927.234856.851-financas','2022-12-01 20:41:40','d340e5d86e7e5589537ce7b211429339'),(599,2,'20220927.234859.884-financas','2022-12-01 20:41:40','fee7e40e9eb22a0bc3096ec3ef3f4487'),(600,2,'20220927.234902.915-financas','2022-12-01 20:41:40','892983d3b3a3ecd4321781e1c5b3f0d6'),(601,2,'20220927.234905.942-financas','2022-12-01 20:41:40','06b7d24f9a86466c5444b235332c8979'),(602,2,'20220927.234908.972-financas','2022-12-01 20:41:40','7b92495c0318138eeb7da24cc16d3914'),(603,2,'20220927.234912.012-financas','2022-12-01 20:41:40','d53a5505eb02e0b6196b79b95ed18019'),(604,2,'20220927.234915.041-financas','2022-12-01 20:41:40','713f7763a09952759531db80ec81e733'),(605,2,'20220927.234918.072-financas','2022-12-01 20:41:40','5ef08e290f95c1a9b1bd034205a8a97a'),(606,2,'20220927.234921.102-financas','2022-12-01 20:41:40','cc8e978307a348f42364a114f309f433'),(607,2,'20220927.234924.137-financas','2022-12-01 20:41:40','debb6d4539f32a123e51c7c67b792e6f'),(608,2,'20220927.234927.161-financas','2022-12-01 20:41:40','d9d24043d7ca9f647db46fabbb1084eb'),(609,2,'20220927.234930.194-financas','2022-12-01 20:41:40','be833c16414b31d35d9e4bdc2eef9b72'),(610,2,'20220927.234933.230-financas','2022-12-01 20:41:40','fc582f544172d716d11c66084d15e167'),(611,2,'20220927.234936.271-financas','2022-12-01 20:41:40','6f219be2a0332440cf23e9d91abe6527'),(612,2,'20220927.234939.304-financas','2022-12-01 20:41:40','8546ac32f13c5569e1a64dcd307070d2'),(613,2,'20220927.234942.345-financas','2022-12-01 20:41:40','741508204b5693fcbca68287bbdcd32a'),(614,2,'20220927.234945.373-financas','2022-12-01 20:41:40','2e0f523f71f854d233426967bfde9e45'),(615,2,'20220927.234948.402-financas','2022-12-01 20:41:40','9c7fcf5254b896c419d757fae45c4154'),(616,2,'20220927.234951.434-financas','2022-12-01 20:41:40','72e1a38af70414e3963a3fa8e0f01e0e'),(617,2,'20220927.234954.459-financas','2022-12-01 20:41:40','5ada6c61180f19e9440593e59b197057'),(618,2,'20220927.234957.495-financas','2022-12-01 20:41:40','96d169fd1af08629cd181e54d3719795'),(619,2,'20220927.235000.524-financas','2022-12-01 20:41:40','6902fe7f8f04e4caa52a3685e903d4ad'),(620,2,'20220927.235003.563-financas','2022-12-01 20:41:40','3b5513f6e9f4df9b27260521c252941c'),(621,2,'20220927.235006.601-financas','2022-12-01 20:41:40','6291b53ef06fd60d0eca1f1fa6072272'),(622,2,'20220927.235009.641-financas','2022-12-01 20:41:40','7fbcb0ed2ca1675377ae5c7283eb9248'),(623,2,'20220927.235012.672-financas','2022-12-01 20:41:40','4c8b606ac7195f2a6e4cae28c9703828'),(624,2,'20220927.235015.708-financas','2022-12-01 20:41:40','b74749a7eebea1cec9a2bfa8f698b2a1'),(625,2,'20220927.235018.735-financas','2022-12-01 20:41:40','83d5f15ee796089ca1fa4ec139d11af5'),(626,2,'20220927.235021.757-financas','2022-12-01 20:41:40','1339bf1295ed81ae2ee56743f9012afe'),(627,2,'20220927.235024.793-financas','2022-12-01 20:41:40','6f1720043ed5a0f0ba497a2bad6d4aa5'),(628,2,'20220927.235027.823-financas','2022-12-01 20:41:40','bc09b30ad121f66d2d3bbccf58cfd176'),(629,2,'20220927.235030.846-financas','2022-12-01 20:41:40','b9f4a2137805445314ba89db8d2b5f1f'),(630,2,'20220927.235033.878-financas','2022-12-01 20:41:40','49348ccbc6e1cb503d92fab09da14b54'),(631,2,'20220927.235036.915-financas','2022-12-01 20:41:40','dc1645f5ba90f9f0f8e4694321159e8a'),(632,2,'20220927.235039.947-financas','2022-12-01 20:41:40','1816f2ec4d2eee5f780ff5748e190523'),(633,2,'20220927.235042.973-financas','2022-12-01 20:41:40','d93adf290c509c38df1b158a52f63239'),(634,2,'20220927.235046.013-financas','2022-12-01 20:41:40','be6094ab3be3f2a880eb7f38ca176df2'),(635,2,'20220927.235049.050-financas','2022-12-01 20:41:40','c4aa0b6ef53e89f01dc39312462055c7'),(636,2,'20220927.235052.078-financas','2022-12-01 20:41:40','4f912eaff6ee0e74adcc3b275936fd8a'),(637,2,'20220927.235055.115-financas','2022-12-01 20:41:40','8929e30355b7637572fd3c0f7aac1849'),(638,2,'20220927.235058.144-financas','2022-12-01 20:41:40','2a8fb4aecb978f8e22f881f972d59945'),(639,2,'20220927.235101.172-financas','2022-12-01 20:41:40','6960aeaa0fcceb14057348fd02346edb'),(640,2,'20220927.235104.194-financas','2022-12-01 20:41:40','8888aaeb25fb767fed814bbe0e8b0dde'),(641,2,'20220927.235107.216-financas','2022-12-01 20:41:40','d2b17f3576f3c6432d34fc4de288b436'),(642,2,'20220927.235110.249-financas','2022-12-01 20:41:40','77b4b1516f02b20e8ea4c186cd134da8'),(643,2,'20220927.235113.276-financas','2022-12-01 20:41:40','da3c20f3e4c2e1cc9b6ee9cea4f0f8fe'),(644,2,'20220927.235116.302-financas','2022-12-01 20:41:40','a17d82eb4fe47657e2ddf071609c9b82'),(645,2,'20220927.235119.328-financas','2022-12-01 20:41:40','428a65e1a8d1b9da8500e4f1b214bb61'),(646,2,'20220927.235122.351-financas','2022-12-01 20:41:40','5a095a98fecb4ad41558bb21283d5e5a'),(647,2,'20220927.235125.386-financas','2022-12-01 20:41:40','60cd97e12ddda5264d979bd041ab689c'),(648,2,'20220927.235128.420-financas','2022-12-01 20:41:40','2c5d97de431defb83b6cab25914d6ccf'),(649,2,'20220927.235131.460-financas','2022-12-01 20:41:40','822da31d2ed4d972631305fa9e6351f5'),(650,2,'20220927.235134.496-financas','2022-12-01 20:41:40','7b506bad2aa2cd69152df808dd4ab462'),(651,2,'20220927.235137.532-financas','2022-12-01 20:41:40','b645a577fd4a84b5a6e439640c7a3482'),(652,2,'20220927.235140.567-financas','2022-12-01 20:41:40','df0c5d9c3dcc7d81bafc246867f5f077'),(653,2,'20220927.235143.592-financas','2022-12-01 20:41:40','692acfb99145a711e88b13967fd388f4'),(654,2,'20220927.235146.623-financas','2022-12-01 20:41:40','9edc3116f0644078e3e38ed1b0588242'),(655,2,'20220927.235149.654-financas','2022-12-01 20:41:40','b2413dfe902c0f93844a393b307bad65'),(656,2,'20220927.235152.687-financas','2022-12-01 20:41:40','cae841ca399a089ca2e81a8f7bb69df9'),(657,2,'20220927.235155.719-financas','2022-12-01 20:41:40','a9b1f9efd396fb51ee039f4eb52243bf'),(658,2,'20220927.235158.761-financas','2022-12-01 20:41:40','917f283d30e19f189476da0aaa05bcb4'),(659,2,'20220927.235201.793-financas','2022-12-01 20:41:40','5ab7d19fbea65400c5f40ada03210c15'),(660,2,'20220927.235204.821-financas','2022-12-01 20:41:40','d04031269083134a026d0808ba375571'),(661,2,'20220927.235207.849-financas','2022-12-01 20:41:40','18e2aea387752cbfb36daf6622cc7b4c'),(662,2,'20220927.235210.873-financas','2022-12-01 20:41:40','caa335653c8798c698b6916edca3a9f6'),(663,2,'20220927.235213.904-financas','2022-12-01 20:41:40','73a2bf7643663da8056cdb6a4b2aed22'),(664,2,'20220927.235216.930-financas','2022-12-01 20:41:41','dfb4a23c102e0aa7267a81db23bdcce3'),(665,2,'20220927.235219.962-financas','2022-12-01 20:41:41','6b1efba188bb09e8a3bdaa4c8abe46f1'),(666,2,'20220927.235223.000-financas','2022-12-01 20:41:41','ee0ab0338b5249c6d10abd6a0bd16483'),(667,2,'20220927.235226.039-financas','2022-12-01 20:41:41','f894e2e78aea19ea49320ecd126aee3c'),(668,2,'20220927.235229.077-financas','2022-12-01 20:41:41','85da0db0a13b4acb1653d19b67433e24'),(669,2,'20220927.235232.112-financas','2022-12-01 20:41:41','8168766444a6ec59bdf76fce4a1b0bbe'),(670,2,'20220927.235235.148-financas','2022-12-01 20:41:41','a535e7c71de9d9834bf1e2bb99cb312b'),(671,2,'20220927.235238.169-financas','2022-12-01 20:41:41','cfcdb52138d5aa8a46b1673033ae6851'),(672,2,'20220927.235241.201-financas','2022-12-01 20:41:41','0b4592267d2d530f380e1c09e0311185'),(673,2,'20220927.235244.238-financas','2022-12-01 20:41:41','1ebdb76f2f2fc4d369243492be0786bd'),(674,2,'20220927.235247.273-financas','2022-12-01 20:41:41','55d38f782cb7f473317859af68222ad4'),(675,2,'20220927.235250.314-financas','2022-12-01 20:41:41','417461a920a5d3dd6f984770b8bb2e72'),(676,2,'20220927.235253.354-financas','2022-12-01 20:41:41','294682ed4bdf47138030a93ed166782a'),(677,2,'20220927.235256.392-financas','2022-12-01 20:41:41','e95df0af7105c5bdfb4ec689c74dc2d9'),(678,2,'20220927.235259.428-financas','2022-12-01 20:41:41','8a9432d48e0a3672fc4693af81b51316'),(679,2,'20220927.235302.466-financas','2022-12-01 20:41:41','44603c14cc790062db07d51e1ba28b22'),(680,2,'20220927.235305.497-financas','2022-12-01 20:41:41','6c6052b56351daad097da2324f34daf6'),(681,2,'20220927.235308.533-financas','2022-12-01 20:41:41','658e086edf380d835b55471e22c31d2a'),(682,2,'20220927.235311.562-financas','2022-12-01 20:41:41','dd0cba1a95eb0396b778bc7969825015'),(683,2,'20220927.235314.587-financas','2022-12-01 20:41:41','7c3e3ba59008b3d2b222feba411ae1e3'),(684,2,'20220927.235317.617-financas','2022-12-01 20:41:41','1985b11b9fce33f4898b6da23e314ecc'),(685,2,'20220927.235320.649-financas','2022-12-01 20:41:41','20e12c47e23290e0246d5eddb73828c7'),(686,2,'20220927.235323.682-financas','2022-12-01 20:41:41','97926ca0f9e737613d186366c4a8bd1a'),(687,2,'20220927.235326.705-financas','2022-12-01 20:41:41','b562197fa32abd739261a491b8d2f0ef'),(688,2,'20220927.235329.737-financas','2022-12-01 20:41:41','d7aa442cb1bf434d166bdbf766152a71'),(689,2,'20220927.235332.770-financas','2022-12-01 20:41:41','ae11edebf8a46212148093ce1ba2ba8e'),(690,2,'20220927.235335.808-financas','2022-12-01 20:41:41','3145ade3b48851a2c6b49163de8c024c'),(691,2,'20220927.235338.835-financas','2022-12-01 20:41:41','f7c522a0928546f066f728c4658e6de1'),(692,2,'20220927.235341.861-financas','2022-12-01 20:41:41','883d229469f43ada0c1912a59391ff44'),(693,2,'20220927.235344.896-financas','2022-12-01 20:41:41','fa7b3f5066b421a60533c811bd6c6371'),(694,2,'20220927.235347.928-financas','2022-12-01 20:41:41','880578c65abc99eb5cf190ef6c7fd021'),(695,2,'20220927.235350.958-financas','2022-12-01 20:41:41','f7c30e260f570791ede395097982048a'),(696,2,'20220927.235353.995-financas','2022-12-01 20:41:41','c61db4f899dc68d7135ec4f2e11ae195'),(697,2,'20220927.235357.023-financas','2022-12-01 20:41:41','4eaa175b11b2e60a51c6406d449ad213'),(698,2,'20220927.235400.059-financas','2022-12-01 20:41:41','c142ccc908e8dd9e8dec7301ac2515f0'),(699,2,'20220927.235403.084-financas','2022-12-01 20:41:41','67636067dc44cbf55c5801825c2be81e'),(700,2,'20220927.235406.119-financas','2022-12-01 20:41:41','6d261b476b98b2fd2efdebe9935d5be1'),(701,2,'20220927.235409.151-financas','2022-12-01 20:41:41','6e73b0a0bcae31178baa6f96583778e2'),(702,2,'20220927.235412.174-financas','2022-12-01 20:41:41','9e4b9e034d255719719834f8e773de04'),(703,2,'20220927.235415.207-financas','2022-12-01 20:41:41','3b08f8d826f891417c8c9e4b26171011'),(704,2,'20220927.235418.237-financas','2022-12-01 20:41:41','2849f46da38134853602921f5fa09353'),(705,2,'20220927.235421.275-financas','2022-12-01 20:41:41','b0dcdf91d15a55a03e3364204a73c146'),(706,2,'20220927.235424.300-financas','2022-12-01 20:41:41','cbc39310033ba9c23947e13465cc3c07'),(707,2,'20220927.235427.335-financas','2022-12-01 20:41:41','fc20f1e06cd34e98903a89ea9e530fd3'),(708,2,'20220927.235430.368-financas','2022-12-01 20:41:41','017888efd8447a972dba02d343a038a8'),(709,2,'20220927.235433.407-financas','2022-12-01 20:41:41','c3dde03201245431b7f568f9f079ee3a'),(710,2,'20220927.235436.447-financas','2022-12-01 20:41:41','4a9131d2e9299513fd2f73b3659e9318'),(711,2,'20220927.235439.474-financas','2022-12-01 20:41:41','f7c277619567e9e9792845a70add6b96'),(712,2,'20220927.235442.510-financas','2022-12-01 20:41:41','1c8e8ca357df44a25e29cc880e832cf5'),(713,2,'20220927.235445.534-financas','2022-12-01 20:41:41','06f5988c5249d0ef39b1f07ee3b8bab9'),(714,2,'20220927.235448.567-financas','2022-12-01 20:41:41','b817eeaec0f5171d5012e65644ee41c1'),(715,2,'20220927.235451.600-financas','2022-12-01 20:41:41','36e0e4a15e34b143eeccbe7f2255a927'),(716,2,'20220927.235454.638-financas','2022-12-01 20:41:41','ad065d89d92e521885ba328a42e5fe62'),(717,2,'20220927.235457.667-financas','2022-12-01 20:41:41','ad8def50071bf788dc0894867f60a43a'),(718,2,'20220927.235500.697-financas','2022-12-01 20:41:41','c07a5290db59df2f3d9803c48919d970'),(719,2,'20220927.235503.731-financas','2022-12-01 20:41:41','cc5585638ff9b75a55f16345c87acdb9'),(720,2,'20220927.235506.752-financas','2022-12-01 20:41:41','aa5b5b29e731b82c6d1608480fc2c8d6'),(721,2,'20220927.235509.782-financas','2022-12-01 20:41:41','c18cd5c47e9bf5a465da8096192c8e8e'),(722,2,'20220927.235512.810-financas','2022-12-01 20:41:41','8a961810d7ac2c35ee6e734ffa4506a6'),(723,2,'20220927.235515.845-financas','2022-12-01 20:41:41','1ce2dc5086dde5b7ce0f3025caf68238'),(724,2,'20220927.235518.879-financas','2022-12-01 20:41:41','91424e9b871c214b200d9f1a1d701734'),(725,2,'20220927.235521.906-financas','2022-12-01 20:41:41','4c13543c785ce3de3e6643ea556e7658'),(726,2,'20220927.235524.939-financas','2022-12-01 20:41:41','9a25663193bcc76f79af71c1c5b74445'),(727,2,'20220927.235527.970-financas','2022-12-01 20:41:41','4f3a1454f42f6b59d7fcc1b6e45a8431'),(728,2,'20220927.235531.000-financas','2022-12-01 20:41:41','01b3cfe0963250efa300c6753fb6c47d'),(729,2,'20220927.235534.023-financas','2022-12-01 20:41:41','ddda8ac9c18584462e035189ae637e2f'),(730,2,'20220927.235537.052-financas','2022-12-01 20:41:41','10e37f1f8a32e9ce049583d5eefd552b'),(731,2,'20220927.235540.086-financas','2022-12-01 20:41:41','4452653ae15ffe464298904d550da9fa'),(732,2,'20220927.235543.124-financas','2022-12-01 20:41:41','d2529f41dc0b573dfba68dfea46e55d1'),(733,2,'20220927.235546.152-financas','2022-12-01 20:41:41','bc9b3f99b2571703dc98db9e28442d1d'),(734,2,'20220927.235549.180-financas','2022-12-01 20:41:41','25a0bd98b53c6df9475cb027bd6460ce'),(735,2,'20220927.235552.219-financas','2022-12-01 20:41:41','080d4b54d4fda2904302b725dc7ae123'),(736,2,'20220927.235555.246-financas','2022-12-01 20:41:41','756bdbbaae5f8d08464978a62a92c325'),(737,2,'20220927.235558.272-financas','2022-12-01 20:41:41','9117e6710bd5ba8acf3f54c2b6bd385b'),(738,2,'20220927.235601.302-financas','2022-12-01 20:41:41','a1c6f89c4a0e5fcf2fbccbebec650eb3'),(739,2,'20220927.235604.335-financas','2022-12-01 20:41:41','1da7d9eb12975f66d3ff6a5b2c2575ad'),(740,2,'20220927.235607.359-financas','2022-12-01 20:41:41','b968e446550691a5ab8360c40e473f15'),(741,2,'20220927.235610.382-financas','2022-12-01 20:41:41','14ba8aa1d353bf1d055146ee0089580c'),(742,2,'20220927.235613.417-financas','2022-12-01 20:41:41','1f2b923ff1f4290715f2ab8d67c51b5d'),(743,2,'20220927.235616.438-financas','2022-12-01 20:41:41','b827d0bad9dd7d932a3952d8b85a22d2'),(744,2,'20220927.235619.469-financas','2022-12-01 20:41:41','cb6110abcc3a2ce2347c1ca18fc26fd1'),(745,2,'20220927.235622.494-financas','2022-12-01 20:41:41','8400efcf91e38c34dc2a27d849770a88'),(746,2,'20220927.235625.524-financas','2022-12-01 20:41:41','ad119b3c159242526f91f90434b78577'),(747,2,'20220927.235628.559-financas','2022-12-01 20:41:41','f8b6ecf27862b674810d1c8022c21ae2'),(748,2,'20220927.235631.600-financas','2022-12-01 20:41:41','822d5443b76032f70715f7303afcaf59'),(749,2,'20220927.235634.627-financas','2022-12-01 20:41:41','c18d19694c228b340a202dc466ed75a9'),(750,2,'20220927.235637.664-financas','2022-12-01 20:41:41','a54f42adbc5bdfc07c79b92454853673'),(751,2,'20220927.235640.695-financas','2022-12-01 20:41:41','8490ba0ef83688a0adb0bf61a17904e4'),(752,2,'20220927.235643.725-financas','2022-12-01 20:41:41','fc7c7028c53bad9d71b85ade635784cc'),(753,2,'20220927.235646.750-financas','2022-12-01 20:41:41','144360553665e598894aab34d9470bfa'),(754,2,'20220927.235649.785-financas','2022-12-01 20:41:41','872dc41d37967f230dfd83dc25ec99cd'),(755,2,'20220927.235652.818-financas','2022-12-01 20:41:41','78c0499006cf4418f141d5517c0bfb23'),(756,2,'20220927.235655.851-financas','2022-12-01 20:41:41','c339ee0db890d45094f262670c944382'),(757,2,'20220927.235658.889-financas','2022-12-01 20:41:41','2c2632243de53282a84ca76da165111f'),(758,2,'20220927.235701.929-financas','2022-12-01 20:41:41','69cefcb5cdf42c7fdf33cbb278c0734b'),(759,2,'20220927.235704.953-financas','2022-12-01 20:41:41','de211206d04fb1432fd9f719d6300e0d'),(760,2,'20220927.235707.975-financas','2022-12-01 20:41:41','063353aa7ae5f1b18426b2d57e368b31'),(761,2,'20220927.235711.002-financas','2022-12-01 20:41:41','5cb19bc16a83dca5e832ebd7a5c2ece3'),(762,2,'20220927.235714.052-financas','2022-12-01 20:41:41','5641316dba3a667f5860a60947384ed2'),(763,2,'20220927.235717.084-financas','2022-12-01 20:41:41','c54ae00a7d19f17c84a77a00118979dc'),(764,2,'20220927.235720.105-financas','2022-12-01 20:41:41','d43a7e834b78a696c199a2e624090fed'),(765,2,'20220927.235723.141-financas','2022-12-01 20:41:41','81bab3f7c989d90bed202aa9dad99387'),(766,2,'20220927.235726.169-financas','2022-12-01 20:41:41','fbc95d3466ab6b4c8b54345e517e6945'),(767,2,'20220927.235729.202-financas','2022-12-01 20:41:41','e2b5614272d1ffd5ac991e08fbedefc1'),(768,2,'20220927.235732.236-financas','2022-12-01 20:41:41','1ce56781b06ee51cb5faa3605a08bf2b'),(769,2,'20220927.235735.268-financas','2022-12-01 20:41:41','b88db12819f99b165b868611537af9ee'),(770,2,'20220927.235738.302-financas','2022-12-01 20:41:41','9e1d4066793c3cdee53669f35b0aa9f9'),(771,2,'20220927.235741.334-financas','2022-12-01 20:41:41','1fc9135911dc717ffc962b05c3f2cf2c'),(772,2,'20220927.235744.369-financas','2022-12-01 20:41:41','ad9ace043938c0df4383eec5c4aad567'),(773,2,'20220927.235747.398-financas','2022-12-01 20:41:41','5f71dd2679e029ecd5060db05b221404'),(774,2,'20220927.235750.435-financas','2022-12-01 20:41:41','4d0bf2f89bbb24dcec0c8a8b34061829'),(775,2,'20220927.235753.476-financas','2022-12-01 20:41:41','3a047df2421181c3d0eba1c3411d6e08'),(776,2,'20220927.235756.506-financas','2022-12-01 20:41:41','289220f72f0a67d3f180a0cc472839d2'),(777,2,'20220927.235759.543-financas','2022-12-01 20:41:41','b80d8cb29053b844c6dfb24b8291646e'),(778,2,'20220927.235802.580-financas','2022-12-01 20:41:41','3a32fdc46de74e98eac2e7f4e3c1ace8'),(779,2,'20220927.235805.609-financas','2022-12-01 20:41:41','33e6578785004736fc0c5a53eb57aea4'),(780,2,'20220927.235808.641-financas','2022-12-01 20:41:41','2073e5d6c8b221c1e8332616c6837145'),(781,2,'20220927.235811.673-financas','2022-12-01 20:41:41','8d377e67944d1bc47ae44f8b5eab9702'),(782,2,'20220927.235814.705-financas','2022-12-01 20:41:41','5697547fbc0d30f4839dc80d7cc78dba'),(783,2,'20220927.235817.734-financas','2022-12-01 20:41:41','c45955f7b7e390042cc8bc50fc35ea25'),(784,2,'20220927.235820.769-financas','2022-12-01 20:41:41','fb095be0df1d480ee08a851fd0119265'),(785,2,'20220927.235823.807-financas','2022-12-01 20:41:41','2c554fb24f17432fa120642ea5af56ca'),(786,2,'20220927.235826.843-financas','2022-12-01 20:41:41','0ec9355f1a23ee597d55a27f20a674ab'),(787,2,'20220927.235829.876-financas','2022-12-01 20:41:41','85bd1c357da2dc57f0ba85381649536d'),(788,2,'20220927.235832.900-financas','2022-12-01 20:41:41','6c41728de6b2118ad7660dd961b67504'),(789,2,'20220927.235835.926-financas','2022-12-01 20:41:41','02d46a368fbc084aa471e4631a4804fa'),(790,2,'20220927.235838.957-financas','2022-12-01 20:41:41','3564b9fb2d542bfcdffddc786458c883'),(791,2,'20220927.235841.991-financas','2022-12-01 20:41:41','29a9806ee096ef3f4d9908e5f9ed8bad'),(792,2,'20220927.235845.017-financas','2022-12-01 20:41:41','3343178e2464f7466bc77a4da6254139'),(793,2,'20220927.235848.044-financas','2022-12-01 20:41:41','60d228f33ea626d07b346514e0514926'),(794,2,'20220927.235851.083-financas','2022-12-01 20:41:41','94f4c52b28bbde9bf0ad3003a6727713'),(795,2,'20220927.235854.111-financas','2022-12-01 20:41:41','499ff43127ba450b90a42d9b1234291c'),(796,2,'20220927.235857.136-financas','2022-12-01 20:41:41','ff23890b2e818a1442ec401791362896'),(797,2,'20220927.235900.162-financas','2022-12-01 20:41:41','085bceb56164a7b746f6bbce91437b11'),(798,2,'20220927.235903.197-financas','2022-12-01 20:41:41','fb9cfa9f93ffba3518d769edb56d6941'),(799,2,'20220927.235906.224-financas','2022-12-01 20:41:41','4c5e99e72dac554f523d5da63f13c376'),(800,2,'20220927.235909.255-financas','2022-12-01 20:41:41','0dc41104bd06a55539f3f1a0576d25fc'),(801,2,'20220927.235912.287-financas','2022-12-01 20:41:41','a0a4ccd8486c580f61989315abe5c7c7'),(802,2,'20220927.235915.315-financas','2022-12-01 20:41:41','35b00529006820a2b8d2e2d6d7aae815'),(803,2,'20220927.235918.338-financas','2022-12-01 20:41:41','94ee20156a72aca04cbeb8ec007e3aad'),(804,2,'20220927.235921.371-financas','2022-12-01 20:41:41','4254d3737fd09de1d8a2346b5fed060a'),(805,2,'20220927.235924.407-financas','2022-12-01 20:41:41','12bf5fc56749008b7c9b2785e63d7c10'),(806,2,'20220927.235927.435-financas','2022-12-01 20:41:41','65a79b6c5e9122ec8951650609f89d97'),(807,2,'20220927.235930.460-financas','2022-12-01 20:41:41','25b4c5cd9386925672812590c1b5ef9e'),(808,2,'20220927.235933.488-financas','2022-12-01 20:41:41','38033bedc4c3038a3b3c328235776858'),(809,2,'20220927.235936.518-financas','2022-12-01 20:41:41','e45a430b836f0fe70955749285655706'),(810,2,'20220927.235939.552-financas','2022-12-01 20:41:41','bca136aa94ab15012774398edcb03d8a'),(811,2,'20220927.235942.589-financas','2022-12-01 20:41:41','e1697b5aabb1a16039f2e64ddd4eee00'),(812,2,'20220927.235945.621-financas','2022-12-01 20:41:41','313e1c916171cccca59a73b37a738aa5'),(813,2,'20220927.235948.650-financas','2022-12-01 20:41:41','8fa4161eaae3b4ca8776dc31fb14e031'),(814,2,'20220927.235951.682-financas','2022-12-01 20:41:41','2685a2b9f72c5eac6379f6b4ae003987'),(815,2,'20220927.235954.711-financas','2022-12-01 20:41:41','5e2a3f748de0f6b2fa28aa35cc0ebb1d'),(816,2,'20220927.235957.739-financas','2022-12-01 20:41:41','54e282317be37507d8b0bb19dca343d3'),(817,2,'20220928.000000.777-financas','2022-12-01 20:41:41','2add5ee96a864070348081dfcb59c36c'),(818,2,'20220928.000003.802-financas','2022-12-01 20:41:41','1babe0f1789b69e42338394994000c26'),(819,2,'20220928.000006.822-financas','2022-12-01 20:41:41','0cac43205c07b7c7a818c3c89e143d02'),(820,2,'20220928.000009.863-financas','2022-12-01 20:41:41','409ac44521f82e73942cf07fd850c495'),(821,2,'20220928.000012.903-financas','2022-12-01 20:41:41','0b17d4ff41e9b4a8b3fa282e05b3e53d'),(822,2,'20220928.000015.943-financas','2022-12-01 20:41:41','bc0b0d5a24df64b85cfe0197831bac8c'),(823,2,'20220928.000018.981-financas','2022-12-01 20:41:41','f4c47d96d3357c8d62e6a68e9c9f7cfd'),(824,2,'20220928.000022.009-financas','2022-12-01 20:41:41','f98e028e7baf0dfab18f435877d1e4ce'),(825,2,'20220928.000025.041-financas','2022-12-01 20:41:41','31ba20a047425e89f4f70f3b18ff8fce'),(826,2,'20220928.000028.081-financas','2022-12-01 20:41:41','640d1e44b40ba2110e3dbedc7589cbed'),(827,2,'20220928.000031.113-financas','2022-12-01 20:41:41','9a32de625fa1a70d59597522a8fc6cd5'),(828,2,'20220928.000034.142-financas','2022-12-01 20:41:41','47aa490231291c7309e800bfb093f440'),(829,2,'20220928.000037.169-financas','2022-12-01 20:41:41','703c1f72464604be35c0affa51a75adf'),(830,2,'20220928.000040.202-financas','2022-12-01 20:41:41','63b44d87b4b14f446b96f23f08ad73e4'),(831,2,'20220928.000043.228-financas','2022-12-01 20:41:41','7eb6574e2cec7821c46c5597a4f9f9de'),(832,2,'20220928.000046.263-financas','2022-12-01 20:41:41','6f21a8e4178d9c882fa80e80d93483ad'),(833,2,'20220928.000049.305-financas','2022-12-01 20:41:41','e20dcde9a2ef1f4e56aadb51deb10dd1'),(834,2,'20220928.000052.334-financas','2022-12-01 20:41:41','d603122c1dc37fe548bc443dcdd042a0'),(835,2,'20220928.000055.360-financas','2022-12-01 20:41:41','5f37332434d743ce8d95367b7dc12ecc'),(836,2,'20220928.000058.393-financas','2022-12-01 20:41:41','45dce5cf4ca2bc28f5bee929f27436bf'),(837,2,'20220928.000101.432-financas','2022-12-01 20:41:41','a9963d2fecf417f62b68da800b0a9a33'),(838,2,'20220928.000104.459-financas','2022-12-01 20:41:41','12e0732ba62064891207251c4fb5a1b7'),(839,2,'20220928.000107.487-financas','2022-12-01 20:41:41','ca20a9890bf1627ac723cd1287209792'),(840,2,'20220928.000110.527-financas','2022-12-01 20:41:41','f3acae5ba72ca402de92edf540f072ee'),(841,2,'20220928.000113.561-financas','2022-12-01 20:41:41','ae806e0762a260d4383134b3be2c9efa'),(842,2,'20220928.000116.585-financas','2022-12-01 20:41:41','df702334b24fe859f44b333c4ca53bac'),(843,2,'20220928.000119.618-financas','2022-12-01 20:41:41','4df58466c73f3774dc34e5286781b109'),(844,2,'20220928.000122.659-financas','2022-12-01 20:41:41','6ebf6c7ba62254cc99521422fc2e4246'),(845,2,'20220928.000125.688-financas','2022-12-01 20:41:41','7cf71da7b69bcc4e7734f545b11f848e'),(846,2,'20220928.000128.722-financas','2022-12-01 20:41:41','c45514f13feb969429f2876885292bec'),(847,2,'20220928.000131.753-financas','2022-12-01 20:41:41','aeab86d14aee2e8ff27719847d772afd'),(848,2,'20220928.000134.781-financas','2022-12-01 20:41:41','b4e034ad0f976d7756a9f27089e1aca7'),(849,2,'20220928.000137.820-financas','2022-12-01 20:41:41','db4392c3f3fa8e0d6f89ade4efe4e639'),(850,2,'20220928.000140.842-financas','2022-12-01 20:41:41','e730a2e13ef6824d49a3ab80623580a7'),(851,2,'20220928.000143.871-financas','2022-12-01 20:41:41','c3bbc24cdf686b9dc2045a5ac7f52a85'),(852,2,'20220928.000146.906-financas','2022-12-01 20:41:41','a864f76295917492240990ebf33564cc'),(853,2,'20220928.000149.934-financas','2022-12-01 20:41:41','7ebfae8e4c6535a340e1e80a039723bf'),(854,2,'20220928.000152.956-financas','2022-12-01 20:41:41','34cc97a455211015e44bd2b35d0316b3'),(855,2,'20220928.000155.994-financas','2022-12-01 20:41:41','7991d385b06c68edf2921480139f4587'),(856,2,'20220928.000159.026-financas','2022-12-01 20:41:41','05b03615eee981367f38950d1cbd4427'),(857,2,'20220928.000202.058-financas','2022-12-01 20:41:41','60b082a996546c1d27e8f6b548ec8e78'),(858,2,'20220928.000205.078-financas','2022-12-01 20:41:41','d7d4435c4a388d2c85e60284275546df'),(859,2,'20220928.000208.110-financas','2022-12-01 20:41:41','08a28796032f878723f9ca745c14c105'),(860,2,'20220928.000211.138-financas','2022-12-01 20:41:41','673b6615b97f601febb8e63aac9f0636'),(861,2,'20220928.000214.166-financas','2022-12-01 20:41:41','b2d286cbc4eb622d57bd58b8fdef155e'),(862,2,'20220928.000217.206-financas','2022-12-01 20:41:41','f4d439281a68b9e1523131de6967e114'),(863,2,'20220928.000220.226-financas','2022-12-01 20:41:41','32e11b6ccb3093995ab364d98cbc5df3'),(864,2,'20220928.000223.258-financas','2022-12-01 20:41:41','bd81175e5a5a2b1f146fa1daf31dc74f'),(865,2,'20220928.000226.295-financas','2022-12-01 20:41:41','9cfef23e84bed8ee5027610980890309'),(866,2,'20220928.000229.320-financas','2022-12-01 20:41:41','8cdb95838d6802fd6c14114a60ff0f0c'),(867,2,'20220928.000232.351-financas','2022-12-01 20:41:41','ecd1bb8a3ee617b408a89660caf02284'),(868,2,'20220928.000235.389-financas','2022-12-01 20:41:41','c9c0ca728dbe3f8a0679a3cc85ba80dd'),(869,2,'20220928.000238.415-financas','2022-12-01 20:41:41','b23770b6b6a457abcc6b42b78a365b13'),(870,2,'20220928.000241.445-financas','2022-12-01 20:41:41','8d9dfc614f15e0a46bcbfe6dcdb3bea9'),(871,2,'20220928.000244.477-financas','2022-12-01 20:41:41','3a458e3895f4852e2e3b678f36fd9006'),(872,2,'20220928.000247.501-financas','2022-12-01 20:41:41','8b93b15b4a4014a026aaead8b21f25b6'),(873,2,'20220928.000250.533-financas','2022-12-01 20:41:41','8be18e61e4b317a647f5b8ced811201a'),(874,2,'20220928.000253.562-financas','2022-12-01 20:41:41','a3001ea1d4cbe2487c79336d8a5c1473'),(875,2,'20220928.000256.601-financas','2022-12-01 20:41:41','8b7763d0d9c02d55c8dc17fb4573326d'),(876,2,'20220928.000259.628-financas','2022-12-01 20:41:41','4e8cf4cf6e7d33c8a1f62818a7e5e065'),(877,2,'20220928.000302.658-financas','2022-12-01 20:41:41','6a817edab0461e399de604d1098418fd'),(878,2,'20220928.000305.684-financas','2022-12-01 20:41:41','8e26f909d13ec0ba8ff3ec513864cf48'),(879,2,'20220928.000308.714-financas','2022-12-01 20:41:41','af1878efd397f91978010d329fd96190'),(880,2,'20220928.000311.741-financas','2022-12-01 20:41:41','72cea2787911b3eaa8178863939a168a'),(881,2,'20220928.000314.771-financas','2022-12-01 20:41:41','69f6ae80653b011dfa95aecc38bfa500'),(882,2,'20220928.000317.799-financas','2022-12-01 20:41:41','7cb5fccd0545ce08f2dabb2b7d089683'),(883,2,'20220928.000320.836-financas','2022-12-01 20:41:41','49a066f9b6274c0064a4d9e7084ac5b5'),(884,2,'20220928.000323.866-financas','2022-12-01 20:41:41','16a0ba93be17edb5a07197c79df34ef7'),(885,2,'20220928.000326.888-financas','2022-12-01 20:41:41','d658769c8050ea81b93e0a6850562139'),(886,2,'20220928.000329.925-financas','2022-12-01 20:41:41','0b6a2c7555005a14f25ec9de291454f8'),(887,2,'20220928.000332.967-financas','2022-12-01 20:41:41','439855c59ea8980724db8ed8f0a3f94e'),(888,2,'20220928.000335.991-financas','2022-12-01 20:41:41','803b85f09f863732be8c48aec36c70b7'),(889,2,'20220928.000339.022-financas','2022-12-01 20:41:41','15218c489ac1682aa29a57fdaeb8b45d'),(890,2,'20220928.000342.050-financas','2022-12-01 20:41:41','ac975e9be275f6b164f49361ec600450'),(891,2,'20220928.000345.072-financas','2022-12-01 20:41:41','4b085338400d0dbc1b4b4e3b28a7ccc1'),(892,2,'20220928.000348.111-financas','2022-12-01 20:41:41','2f8730ecc72178626062a1ef928edc90'),(893,2,'20220928.000351.138-financas','2022-12-01 20:41:41','d475abb5b99cd5589ee07b44789b1389'),(894,2,'20220928.000354.170-financas','2022-12-01 20:41:41','566fc045d998230159aa470d66fc373b'),(895,2,'20220928.000357.198-financas','2022-12-01 20:41:41','9980bbb0d03600fc104eba008020097d'),(896,2,'20220928.000400.229-financas','2022-12-01 20:41:41','7abc2227eec042d616d28d331c628090'),(897,2,'20220928.000403.254-financas','2022-12-01 20:41:41','0f27a9881121f4fe334ea8c08301301b'),(898,2,'20220928.000406.288-financas','2022-12-01 20:41:41','5951661edc02f2c9008831eb8128c2bd'),(899,2,'20220928.000409.316-financas','2022-12-01 20:41:41','0fbd984b490aeeaa16399369cb1b21ce'),(900,2,'20220928.000412.356-financas','2022-12-01 20:41:41','3c3babde7d148807d561bf8bfa62bfbb'),(901,2,'20220928.000415.390-financas','2022-12-01 20:41:41','be3284410f982e496e453031efa5624b'),(902,2,'20220928.000418.428-financas','2022-12-01 20:41:41','d0ef94aa2ebfd26506d5b6d864ea75e8'),(903,2,'20220928.000421.451-financas','2022-12-01 20:41:41','ce41f07bc8ddcfd15af29e25bdf5b3dc'),(904,2,'20220928.000424.491-financas','2022-12-01 20:41:41','888a160ce593b1075f23651b47d32c60'),(905,2,'20220928.000427.532-financas','2022-12-01 20:41:41','4ccb3575c53e7b00e8146ee9241ebc5d'),(906,2,'20220928.000430.557-financas','2022-12-01 20:41:41','c82a517c7c4cbc480518ef463ed218a7'),(907,2,'20220928.000433.586-financas','2022-12-01 20:41:41','8996b4bb4c0da2bc33f9afcc3fc0874f'),(908,2,'20220928.000436.627-financas','2022-12-01 20:41:41','df24f59c2d0143131168c2e7b5137d20'),(909,2,'20220928.000439.659-financas','2022-12-01 20:41:41','7a45c105555853b555bfe14b17f55459'),(910,2,'20220928.000442.697-financas','2022-12-01 20:41:41','d4c8b23fc2ac0fbae8ea87561f113abf'),(911,2,'20220928.000445.727-financas','2022-12-01 20:41:41','3c7e979a04d2023de478ae197ffae4d7'),(912,2,'20220928.000448.754-financas','2022-12-01 20:41:41','5c8ef78be87c35c742848c0bf326a362'),(913,2,'20220928.000451.790-financas','2022-12-01 20:41:41','428d97b381e66a8e16a27c52c81f1dcb'),(914,2,'20220928.000454.830-financas','2022-12-01 20:41:41','cbb517877e601adfc8cadad1f3a14c15'),(915,2,'20220928.000457.858-financas','2022-12-01 20:41:41','da485b78fcd7e014ccdd4f3c86cdebb6'),(916,2,'20220928.000500.883-financas','2022-12-01 20:41:41','26e78c22571a87acf6462e33357889bd'),(917,2,'20220928.000503.923-financas','2022-12-01 20:41:41','5f87aadefde55f0a7cde7dcbfda4e52e'),(918,2,'20220928.000506.955-financas','2022-12-01 20:41:41','0a18b78760893d59f7429f8828b4c851'),(919,2,'20220928.000509.991-financas','2022-12-01 20:41:41','5afab5b0bb201dfdb113af6145430014'),(920,2,'20220928.000513.015-financas','2022-12-01 20:41:41','8276bfd3e3d149141d83d295251801b1'),(921,2,'20220928.000516.050-financas','2022-12-01 20:41:41','abf0507cabd657098357bb3d2f428eef'),(922,2,'20220928.000519.083-financas','2022-12-01 20:41:41','16c4c89d1e46934f2ff99f1e9a95db12'),(923,2,'20220928.000522.115-financas','2022-12-01 20:41:41','269eb278e4a812dfa99cbac36ca1ba89'),(924,2,'20220928.000525.156-financas','2022-12-01 20:41:41','f3a940a25743f641c742001a46a95112'),(925,2,'20220928.000528.187-financas','2022-12-01 20:41:41','1e0a1f3390a552fa9231f8f22d377976'),(926,2,'20220928.000531.223-financas','2022-12-01 20:41:41','6721a836b47d0dc3f3a42a6940b75914'),(927,2,'20220928.000534.253-financas','2022-12-01 20:41:41','7a15d87b0333b39358c24cc05c7916de'),(928,2,'20220928.000537.274-financas','2022-12-01 20:41:41','32f91793d2bc79057a5e90b197673cab'),(929,2,'20220928.000540.310-financas','2022-12-01 20:41:41','4f6bd656bc3a9915165ba634f249790b'),(930,2,'20220928.000543.338-financas','2022-12-01 20:41:41','d89a29777a4834eee9c051140e2bbe6e'),(931,2,'20220928.000546.372-financas','2022-12-01 20:41:41','0b65eb6d934eeb7a749672bccb1efc65'),(932,2,'20220928.000549.408-financas','2022-12-01 20:41:41','b23d78600a1878952305563317cb9860'),(933,2,'20220928.000552.450-financas','2022-12-01 20:41:41','c254b9445d5f9138c9abdf701310a726'),(934,2,'20220928.000555.478-financas','2022-12-01 20:41:41','6b23c6254430e9730602012677c65bf9'),(935,2,'20220928.000558.508-financas','2022-12-01 20:41:41','e3629f888e1998f095f34c2b0b2fa5d8'),(936,2,'20220928.000601.544-financas','2022-12-01 20:41:41','cd2037235b703c85beeef2e7c3763d9f'),(937,2,'20220928.000604.564-financas','2022-12-01 20:41:41','005e7f986f88856e2629ae9fdb130497'),(938,2,'20220928.000607.588-financas','2022-12-01 20:41:41','9f812265e7d7e8ef255c8c0d42c61b23'),(939,2,'20220928.000610.626-financas','2022-12-01 20:41:41','c3175104f22313a61f4994abf1a860e1'),(940,2,'20220928.000613.667-financas','2022-12-01 20:41:41','b9cb8aef5b31b85f57c85fd3c301dc37'),(941,2,'20220928.000616.703-financas','2022-12-01 20:41:41','a45f144f2c3de4c5e51f61061ae239ae'),(942,2,'20220928.000619.731-financas','2022-12-01 20:41:41','067ec3c1fe3f0b0abb932539a9b38413'),(943,2,'20220928.000622.761-financas','2022-12-01 20:41:41','5dfdcafb3430b5f71ad25afde4ba4771'),(944,2,'20220928.000625.789-financas','2022-12-01 20:41:41','5a82e67e390fbe2c8b26313b94ae8b0a'),(945,2,'20220928.000628.819-financas','2022-12-01 20:41:41','8157eb84f2b161d5f848ae2b953f2906'),(946,2,'20220928.000631.844-financas','2022-12-01 20:41:41','8f888a8b2746aa11525c3f4a3c39737e'),(947,2,'20220928.000634.882-financas','2022-12-01 20:41:41','7a8e517fc3e1db92c18a1ccdef3845a9'),(948,2,'20220928.000637.921-financas','2022-12-01 20:41:41','80c84792fed24c30396fc7440c618aea'),(949,2,'20220928.000640.954-financas','2022-12-01 20:41:41','b8129b722a643886deb8629c230fc8c7'),(950,2,'20220928.000643.980-financas','2022-12-01 20:41:41','909228aafd477260af74a6b86793a6f7'),(951,2,'20220928.000647.008-financas','2022-12-01 20:41:41','936f73515c674887553e1c60180a1b31'),(952,2,'20220928.000650.050-financas','2022-12-01 20:41:41','55f7aa3c422ced39f16bb74191dd47bf'),(953,2,'20220928.000653.076-financas','2022-12-01 20:41:41','2ae5d1f0a5a475e9a66e087ddfbba041'),(954,2,'20220928.000656.104-financas','2022-12-01 20:41:41','908060163952ea365effae3cc65bf69f'),(955,2,'20220928.000659.138-financas','2022-12-01 20:41:41','7e2a47dc94e80c7b8b090b8fa4ad593b'),(956,2,'20220928.000702.173-financas','2022-12-01 20:41:41','3d9704ddb1fac389e6ba04847e9e6a6b'),(957,2,'20220928.000705.207-financas','2022-12-01 20:41:41','6edb6fb781b7aabc9f52d4f8899c22d5'),(958,2,'20220928.000708.236-financas','2022-12-01 20:41:41','9ec1c022d2624529a8bc38d7dafa1c41'),(959,2,'20220928.000711.264-financas','2022-12-01 20:41:41','5522f46695d428c97147604c7125e390'),(960,2,'20220928.000714.288-financas','2022-12-01 20:41:41','0b5da96996cb3e1fb61a56cf9158c0ba'),(961,2,'20220928.000717.326-financas','2022-12-01 20:41:41','6863eb93fb36948d5e429411dcb7821a'),(962,2,'20220928.000720.359-financas','2022-12-01 20:41:41','366459a1b8f6498bb14943d8173f496f'),(963,2,'20220928.000723.400-financas','2022-12-01 20:41:41','234090039351df11ce83f39609557ffc'),(964,2,'20220928.000726.434-financas','2022-12-01 20:41:41','e9a148537a2394d6c034ea907f8ae3f1'),(965,2,'20220928.000729.468-financas','2022-12-01 20:41:41','8e7aa5db0de78e5041aa619ebf08c8ed'),(966,2,'20220928.000732.501-financas','2022-12-01 20:41:41','da4bf7ad5c9d76610bd4089ec51f95d4'),(967,2,'20220928.000735.533-financas','2022-12-01 20:41:41','0f32a270f3d1db7d658329c93479f7e4'),(968,2,'20220928.000738.567-financas','2022-12-01 20:41:41','f95034c965f658e0d887de474797c7d5'),(969,2,'20220928.000741.592-financas','2022-12-01 20:41:41','c80414639f7028b95b90c13549ef51be'),(970,2,'20220928.000744.622-financas','2022-12-01 20:41:41','b368a2a77ce7844db68b4b5ba9cb8e2d'),(971,2,'20220928.000747.645-financas','2022-12-01 20:41:41','6e410e2b33a92f404eecd76db015b8ac'),(972,2,'20220928.000750.686-financas','2022-12-01 20:41:41','7286450289a20e333f18d5fd39940a64'),(973,2,'20220928.000753.718-financas','2022-12-01 20:41:41','5e6f50ecfcf3482cdb9c6391de2e3b0a'),(974,2,'20220928.000756.745-financas','2022-12-01 20:41:41','e8a58697f13a8bbe48cccc27989f9508'),(975,2,'20220928.000759.767-financas','2022-12-01 20:41:41','af01b93215e84d9a22a74057069c03b1'),(976,2,'20220928.000802.796-financas','2022-12-01 20:41:41','e248f39eb216047c18b4d7ca60ea11ad'),(977,2,'20220928.000805.827-financas','2022-12-01 20:41:41','9cda2c167362e7b84dea453e2c96b2d1'),(978,2,'20220928.000808.858-financas','2022-12-01 20:41:41','a08bfea4e703336616042b09884517e5'),(979,2,'20220928.000811.893-financas','2022-12-01 20:41:41','8b7f62d6fa41f56134cc181634c00db5'),(980,2,'20220928.000814.920-financas','2022-12-01 20:41:41','bdae13b1e3ae7759da88116a15ef3792'),(981,2,'20220928.000817.950-financas','2022-12-01 20:41:41','7492cc9f486bb7917de660cb8bc01b66'),(982,2,'20220928.000820.970-financas','2022-12-01 20:41:41','228f90f38af9c376a87bd0efd06946c0'),(983,2,'20220928.000823.991-financas','2022-12-01 20:41:41','558a047d0da1a3f3c29ed61a76976012'),(984,2,'20220928.000827.017-financas','2022-12-01 20:41:41','19d6c2074abcb40d0f953f556bdec465'),(985,2,'20220928.000830.051-financas','2022-12-01 20:41:41','68339fa8e0aae1d86b442fd2ff33dbd8'),(986,2,'20220928.000833.075-financas','2022-12-01 20:41:41','50af8b7609dd7fec970d572c973d67f5'),(987,2,'20220928.000836.114-financas','2022-12-01 20:41:41','a996fb426d1da2d278ae105fbbe54d55'),(988,2,'20220928.000839.133-financas','2022-12-01 20:41:41','0e3863ce59193b3b3c5b353f91621a47'),(989,2,'20220928.000842.159-financas','2022-12-01 20:41:41','17e71018b7eaa5357b8fc05587b9906d'),(990,2,'20220928.000845.191-financas','2022-12-01 20:41:41','d054bb5b6a62dfa3fc0417c888ef63b7'),(991,2,'20220928.000848.226-financas','2022-12-01 20:41:41','414fbf9abe1f5b4adbc911c74add8722'),(992,2,'20220928.000851.258-financas','2022-12-01 20:41:41','9c62a90129c28260c3e39a812bf5aeee'),(993,2,'20220928.000854.278-financas','2022-12-01 20:41:41','70b5149f29d2f2eae46af9b2eb378a5f'),(994,2,'20220928.000857.314-financas','2022-12-01 20:41:41','6857405b6e0e0012f07e80318a644ce9'),(995,2,'20220928.000900.341-financas','2022-12-01 20:41:41','de223ebdefdb7f6ef4941d2a20304a5f'),(996,2,'20220928.000903.379-financas','2022-12-01 20:41:41','b0ec7ba76568a7ad4a1fe7a4511eaaca'),(997,2,'20220928.000906.405-financas','2022-12-01 20:41:41','525bc3748aac0c5d310f9ddf20987e81'),(998,2,'20220928.000909.435-financas','2022-12-01 20:41:41','8bb8f6c0b6ff9ee30d52cb002bbfd264'),(999,2,'20220928.000912.472-financas','2022-12-01 20:41:41','3cedfbe85fe5861c6cc3e1fc0f98cfeb'),(1000,2,'20220928.000915.501-financas','2022-12-01 20:41:41','a11bf6ed57a688f3df6a139c5e595fe0'),(1001,2,'20220928.000918.537-financas','2022-12-01 20:41:41','81b45b8fdfd519182ec57e4e0b2b3cd4'),(1002,2,'20220928.000921.566-financas','2022-12-01 20:41:41','b280988fbf2d3cbd2a2e909a0dffdc91'),(1003,2,'20220928.000924.597-financas','2022-12-01 20:41:41','a5d8b1fc5ae70a460d776e372185eeb0'),(1004,2,'20220928.000927.634-financas','2022-12-01 20:41:41','c9cd53d4793a90aa57d2b30820b8fcdb'),(1005,2,'20220928.000930.662-financas','2022-12-01 20:41:41','7e7b04454aca016d38a9e03ea4996502'),(1006,2,'20220928.000933.690-financas','2022-12-01 20:41:41','0e066bc71d74e7503b65054204a46311'),(1007,2,'20220928.000936.726-financas','2022-12-01 20:41:41','2734ca2e5075f4d2b6b4d014da4d073a'),(1008,2,'20220928.000939.759-financas','2022-12-01 20:41:41','b3c6aff5a05713198b744528bfe02d10'),(1009,2,'20220928.000942.790-financas','2022-12-01 20:41:41','b437b0c10eed2e64fbaab55dc2ced626'),(1010,2,'20220928.000945.820-financas','2022-12-01 20:41:41','0999488290966ae353ee0584750f6659'),(1011,2,'20220928.000948.853-financas','2022-12-01 20:41:41','343ff80ae4ba74c6ff3bc13aaf3a50c9'),(1012,2,'20220928.000951.893-financas','2022-12-01 20:41:41','620601333e42f78e9c878b6e9775173e'),(1013,2,'20220928.000954.921-financas','2022-12-01 20:41:41','c626c6d4b6c9a62863f73cefcbc67614'),(1014,2,'20220928.000957.956-financas','2022-12-01 20:41:41','df3eb00be1f28c8fa0415b1416d17fa6'),(1015,2,'20220928.001000.995-financas','2022-12-01 20:41:41','2196749f6f196e0620d5713d29c3ed1e'),(1016,2,'20220928.001004.029-financas','2022-12-01 20:41:41','f00158a7b8b239a5fb8657ee2115e3df'),(1017,2,'20220928.001007.053-financas','2022-12-01 20:41:41','6438bfb098c3a3deca41c17b3204fc53'),(1018,2,'20220928.001010.083-financas','2022-12-01 20:41:41','bb9e8ce8dbf957721c459740e611ee6e'),(1019,2,'20220928.001013.112-financas','2022-12-01 20:41:41','fc38e178f2e6c9ecc24b0b336aaf293f'),(1020,2,'20220928.001016.152-financas','2022-12-01 20:41:41','17d581d1dce1f85c3c9b0a7f0b36f949'),(1021,2,'20220928.001019.181-financas','2022-12-01 20:41:41','96e60e2536fbbc9b91486f83c191b3d7'),(1022,2,'20220928.001022.212-financas','2022-12-01 20:41:41','83de76f82c47ed83f04622e0f792d4ad'),(1023,2,'20220928.001025.248-financas','2022-12-01 20:41:41','09113ca0a0225dc5c19df1fa01c7049d'),(1024,2,'20220928.001028.277-financas','2022-12-01 20:41:41','3faa26d459c59d45d06ce914bdf18bc3'),(1025,2,'20220928.001031.307-financas','2022-12-01 20:41:41','8aedf435aaf1e9937876078ba51bc17c'),(1026,2,'20220928.001034.339-financas','2022-12-01 20:41:41','79bc79db25a9eb67c3fb6b33a8a83743'),(1027,2,'20220928.001037.359-financas','2022-12-01 20:41:41','6cdf54d46e2d785bf45906e9dedb9a27'),(1028,2,'20220928.001040.393-financas','2022-12-01 20:41:41','4333106960c622e8d2dea9b79065b426'),(1029,2,'20220928.001043.426-financas','2022-12-01 20:41:41','14d6e93dbfd71461d605f289ebde35b9'),(1030,2,'20220928.001046.452-financas','2022-12-01 20:41:41','f8f2d0cdf7046973efc9cffa4ce5ea9e'),(1031,2,'20220928.001049.483-financas','2022-12-01 20:41:41','b447564de0e5b430cbf1aa0d9ec262ff'),(1032,2,'20220928.001052.524-financas','2022-12-01 20:41:41','feef5125238a6674641826847ed61a4a'),(1033,2,'20220928.001055.558-financas','2022-12-01 20:41:41','f61200f9651cd84dbc51efe40bbaf9d9'),(1034,2,'20220928.001058.601-financas','2022-12-01 20:41:41','6f3c198d67fe8de26287aa3ab5f64c51'),(1035,2,'20220928.001101.633-financas','2022-12-01 20:41:41','9df90e121bee67efbc098490691410e0'),(1036,2,'20220928.001104.657-financas','2022-12-01 20:41:41','8bd1a84b692e9d6a31aa6375af289321'),(1037,2,'20220928.001107.695-financas','2022-12-01 20:41:41','2dafe896b3b48346cec563edda9477a5'),(1038,2,'20220928.001110.735-financas','2022-12-01 20:41:41','c291f06419db567db9d31b7d72ec7b3e'),(1039,2,'20220928.001113.775-financas','2022-12-01 20:41:41','1a454edf278ffe0c60d9911b18d1f99d'),(1040,2,'20220928.001116.803-financas','2022-12-01 20:41:41','976fa0a8b3a201dd6a8f2bedcad455b2'),(1041,2,'20220928.001119.834-financas','2022-12-01 20:41:41','3a74f7ec770e418861aa133a5cdabdd8'),(1042,2,'20220928.001122.856-financas','2022-12-01 20:41:41','b83bd47f3de8fab1a3cc50f305959378'),(1043,2,'20220928.001125.889-financas','2022-12-01 20:41:41','defe0bbd65200693c1aeab9fe13b7891'),(1044,2,'20220928.001128.921-financas','2022-12-01 20:41:41','65cdf1490b78befbb92bd9843e9520c6'),(1045,2,'20220928.001131.962-financas','2022-12-01 20:41:41','f5859742a51864aa8ce8158b86d9487e'),(1046,2,'20220928.001134.990-financas','2022-12-01 20:41:41','60ee7b9a90102e1bf7373e2e3bcfce42'),(1047,2,'20220928.001138.026-financas','2022-12-01 20:41:41','b54a5c70839d4e176ea7460d67cfdc45'),(1048,2,'20220928.001141.052-financas','2022-12-01 20:41:41','4a67bc0e2c22dc39109bc97e41e0a680'),(1049,2,'20220928.001144.081-financas','2022-12-01 20:41:41','8b86bcd38b32e7f441ece8eb8996f009'),(1050,2,'20220928.001147.123-financas','2022-12-01 20:41:41','2f404c105d2abc0d9cdc9231f741f2d7'),(1051,2,'20220928.001150.151-financas','2022-12-01 20:41:41','9a9673d8dbcd2d17ab894f3cb75d50ba'),(1052,2,'20220928.001153.173-financas','2022-12-01 20:41:41','d3967160b50e1366e918dfcc5a5f55f5'),(1053,2,'20220928.001156.206-financas','2022-12-01 20:41:41','0f99daf42f6bfa0d3d199775db0f982e'),(1054,2,'20220928.001159.245-financas','2022-12-01 20:41:41','a60517d4db3b5b52052eb96ccb568cd7'),(1055,2,'20220928.001202.273-financas','2022-12-01 20:41:41','3e34d83bbf99c7febf22b6f7b769df90'),(1056,2,'20220928.001205.305-financas','2022-12-01 20:41:41','6c0e2d07102f1b5cc8247e3180aa0e4b'),(1057,2,'20220928.001208.339-financas','2022-12-01 20:41:41','7c6671d84c0c6487eb8f8f6f5612b406'),(1058,2,'20220928.001211.375-financas','2022-12-01 20:41:41','9c9a56732960d0ea7fbeab2bd09f058d'),(1059,2,'20220928.001214.407-financas','2022-12-01 20:41:41','60110ccc755fc588c60f8477331242e8'),(1060,2,'20220928.001217.433-financas','2022-12-01 20:41:41','c5e10ac04c9eba8d2502bfac4cc02fe6'),(1061,2,'20220928.001220.463-financas','2022-12-01 20:41:41','fb05562fed502185ce91e91dd0c7cb8a'),(1062,2,'20220928.001223.491-financas','2022-12-01 20:41:41','143a3e228bdf59c49853b775d5b0d47a'),(1063,2,'20220928.001226.518-financas','2022-12-01 20:41:41','0f60e781f473b99de1e092522dd87232'),(1064,2,'20220928.001229.546-financas','2022-12-01 20:41:41','e7415439593d422ade345a4988a4cc5b'),(1065,2,'20220928.001232.578-financas','2022-12-01 20:41:41','2c2087242ab1c089a360b6e9c8080132'),(1066,2,'20220928.001235.619-financas','2022-12-01 20:41:41','1a9c53947587905d050ab09379823c8e'),(1067,2,'20220928.001238.658-financas','2022-12-01 20:41:41','99208c3518c9e5f09b973dc95792cc13'),(1068,2,'20220928.001241.691-financas','2022-12-01 20:41:41','5c3a45a2068745ac0adbdda46cf1a9cf'),(1069,2,'20220928.001244.721-financas','2022-12-01 20:41:41','812be16567a9160f126c91f7ba3d6a2e'),(1070,2,'20220928.001247.753-financas','2022-12-01 20:41:41','6aa3ae70ee347248e941989f99369328'),(1071,2,'20220928.001250.785-financas','2022-12-01 20:41:41','55325f47a9538adae15480820e760c22'),(1072,2,'20220928.001253.812-financas','2022-12-01 20:41:41','4c3d6316747a2ad97e987ddf711cc31a'),(1073,2,'20220928.001256.838-financas','2022-12-01 20:41:41','bf1a28c95e0505a9ff316d153dc27038'),(1074,2,'20220928.001259.867-financas','2022-12-01 20:41:41','66194d946081acd241e33d53566c0f9b'),(1075,2,'20220928.001302.909-financas','2022-12-01 20:41:41','bc2dfe792632ff191f3a34c3cfad137c'),(1076,2,'20220928.001305.942-financas','2022-12-01 20:41:41','e3aed515ddaaa2043158fcbdb76cc7e7'),(1077,2,'20220928.001308.980-financas','2022-12-01 20:41:41','21b86034d7921d11c07435caa69929db'),(1078,2,'20220928.001312.010-financas','2022-12-01 20:41:41','a4ccb90a26a8a673e445debfa4a9a426'),(1079,2,'20220928.001315.039-financas','2022-12-01 20:41:41','36d2b61d18c6b664297d4c8cdd35b531'),(1080,2,'20220928.001318.070-financas','2022-12-01 20:41:41','5633f3a3bc4b518233577b182842289c'),(1081,2,'20220928.001321.102-financas','2022-12-01 20:41:41','bc0b45efcc455918d554c32c48defb20'),(1082,2,'20220928.001324.136-financas','2022-12-01 20:41:41','7afc8f4ed6330b7de739d5c8a4ac10ee'),(1083,2,'20220928.001327.166-financas','2022-12-01 20:41:41','9ec6e7140076b9e6b55f474357a04b93'),(1084,2,'20220928.001330.196-financas','2022-12-01 20:41:41','95a41b96910f4b87f79862c45f25ba7b'),(1085,2,'20220928.001333.225-financas','2022-12-01 20:41:41','323d5e9aca80c00dab77909817855ec1'),(1086,2,'20220928.001336.250-financas','2022-12-01 20:41:41','dfd93ea6489b284e1a11aaa647189c80'),(1087,2,'20220928.001339.281-financas','2022-12-01 20:41:41','6f7228eb94e18e87c0a02c263e1d5209'),(1088,2,'20220928.001342.306-financas','2022-12-01 20:41:41','0344a8a914d37fc8e7d1b44cc7848753'),(1089,2,'20220928.001345.336-financas','2022-12-01 20:41:41','d462672d01f3f5b537bb9d92f066ae60'),(1090,2,'20220928.001348.365-financas','2022-12-01 20:41:41','1ebcd71163334b7b52bf5bd910677c08'),(1091,2,'20220928.001351.392-financas','2022-12-01 20:41:41','ff1ecfe770e0af1c88d223fe1808a01d'),(1092,2,'20220928.001354.423-financas','2022-12-01 20:41:42','20a9aaeeb46a78456569eb2c2e52eeef'),(1093,2,'20220928.001357.454-financas','2022-12-01 20:41:42','2f6bc2d871883ac26e7125d8f56fe804'),(1094,2,'20220928.001400.490-financas','2022-12-01 20:41:42','1c20d06085776e6e2358f3dd1497fb3f'),(1095,2,'20220928.001403.510-financas','2022-12-01 20:41:42','dc4aefebbe36afdb004dd0878ecfca1d'),(1096,2,'20220928.001406.543-financas','2022-12-01 20:41:42','c0359ea137757ebf3e2327b8b9d3e3dd'),(1097,2,'20220928.001409.571-financas','2022-12-01 20:41:42','07edd338119bfe5e39dda42ef68ea5c0'),(1098,2,'20220928.001412.597-financas','2022-12-01 20:41:42','1bf26f6f2116ea7182a026fc521ec142'),(1099,2,'20221010.125555.282-financas','2022-12-01 20:41:42','311d30dcf4f8cb8e2aff91889b897409'),(1100,2,'20221109.220608.516-financas','2022-12-01 20:41:42','7b01b8757ff367e6f96ff6d73e46129e'),(1101,2,'20221109.220611.556-financas','2022-12-01 20:41:42','a03221ca3f82da12c62dbf3ffd18a0c5'),(1102,2,'20221109.220614.587-financas','2022-12-01 20:41:42','75539cc062e3ffadef4c99671048e1ea'),(1103,2,'20221109.220617.620-financas','2022-12-01 20:41:42','28dfd3a5eed14f532d00e285c8e1c1bf'),(1104,2,'20221109.220620.652-financas','2022-12-01 20:41:42','ee6f018bb3a370819cbc3eb604cf6910'),(1105,2,'20221109.220623.682-financas','2022-12-01 20:41:42','513ff5c161a37ba900433ae95a34293d'),(1106,2,'20221109.220626.717-financas','2022-12-01 20:41:42','ab3d4117015873ab0874b10d5e8d765b'),(1107,2,'20221109.220629.751-financas','2022-12-01 20:41:42','583d3c00b72dcbbc1df53bc8126bfed5'),(1108,2,'20221109.220632.783-financas','2022-12-01 20:41:42','9df88e8f47530a2a540c7134afe2c760'),(1109,2,'20221109.220635.812-financas','2022-12-01 20:41:42','421f538508c6b3ce2dd1bdededd96bef'),(1110,2,'20221109.220638.847-financas','2022-12-01 20:41:42','4ebd2f5106e9879be456bd5bbf36becf'),(1111,2,'20221109.220641.879-financas','2022-12-01 20:41:42','b6e329bba5c369b6368b612ec769c555'),(1112,2,'20221109.220644.908-financas','2022-12-01 20:41:42','2e38bff8222c78930e03ba26fa15df64'),(1113,2,'20221109.220647.939-financas','2022-12-01 20:41:42','10a19b8122660aae8bc9c4ed64b51a07'),(1114,2,'20221111.190830.275-financas','2022-12-01 20:41:42','1ac7eadd6a9ee10ee8e3ba5b23852051'),(1115,2,'20221111.191354.353-financas','2022-12-01 20:41:42','84f3bfc79fd3d53cbd74142697ec45c8'),(1116,2,'20221117.190045.919-financas','2022-12-01 20:41:42','d0b5316b67f5249ba652c7423adbe91c'),(1117,2,'20221117.190048.951-financas','2022-12-01 20:41:42','65422af48c5ba074311b6c0dc4c38da6'),(1118,2,'20221117.190051.979-financas','2022-12-01 20:41:42','095e297543c28ddbce1ddfd1d20a446f'),(1119,2,'20221117.190055.001-financas','2022-12-01 20:41:42','5c6b3a52f1a14bd04a6de54887b5709c'),(1120,2,'20221122.233150.252-financas','2022-12-01 20:41:42','7909d10ecf60bc13432d435c35ae7925'),(1121,2,'20221122.233153.288-financas','2022-12-01 20:41:42','16b994a8b51a32b41c27fe444417ea74'),(1122,2,'20221122.233156.331-financas','2022-12-01 20:41:42','05697be12bce0e6ada850ef82ea47377'),(1123,2,'20221201.224522.145-financas','2022-12-01 20:41:42','0af702328ca763d43ea990c25a96f659'),(1124,2,'20221201.224525.175-financas','2022-12-01 20:41:42','14cde8a0baa06aca5feb29d620eec48a'),(1125,1,'1.0.21.110','2022-12-01 20:54:37','d151256ff0a8bf909b2f6cadf899c946'),(1126,2,'20221125.121856.591','2022-12-07 12:57:46','fc7b34264ad166c220b9e8c12ec4f308'),(1127,2,'20221202.223424.865','2022-12-07 12:57:46','664102fba5aa09ee87183c2d1fe4ade2'),(1128,2,'20221202.223427.909','2022-12-07 12:57:46','01368da2f6d5cda43daa969dce93bae2'),(1129,2,'20221202.223430.937','2022-12-07 12:57:46','3388b9f0ac792c15d2ac030a5f7478fa'),(1130,2,'20221202.223433.969','2022-12-07 12:57:46','6386e9c5992563862bfeb07b6b671f00'),(1131,2,'20221202.223437.001','2022-12-07 12:57:46','6cbb09b24292d061d7ee5bf8307f65b8'),(1132,2,'20221202.223440.031','2022-12-07 12:57:46','ac74a1b4c5f1ded99a323df7b7b7d25c'),(1133,2,'20221202.223443.055','2022-12-07 12:57:46','7cbe48eb6875de08cae8f07059056aea'),(1134,2,'20221202.223446.083','2022-12-07 12:57:46','edd535fd3f1c2a58b08b26ef2436516e'),(1135,2,'20221202.223449.117','2022-12-07 12:57:46','324b84d64b81f826535adf0ab1734b97'),(1136,2,'20221202.223452.148','2022-12-07 12:57:46','ee859db97259c2fb17e92c42d793c475'),(1137,2,'20221202.223455.177','2022-12-07 12:57:46','69490ca7fa39e484991476d650bdc852'),(1138,2,'20221202.223458.207','2022-12-07 12:57:46','bfe7be687798f2cf2822991a7968e484'),(1139,1,'1.0.21.118','2022-12-07 12:57:47','7baea9a014d0407dce3f5791d71a7a17');
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

-- Dump completed on 2022-12-15 16:02:27
