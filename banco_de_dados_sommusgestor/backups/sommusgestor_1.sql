-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_1
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
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,'','S',3),(117,28,'2','CUSTOS',NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,'C','A',4),(124,35,'3','DESPESAS',NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,'D','A',4),(130,41,'3.1.01.005','Cartório',23,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,'D','A',4),(135,46,'3.1.01.010','Correios',23,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,'D','A',4),(137,48,'3.1.01.012','Doações',23,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,'D','A',4),(156,67,'3.1.02.002','Comissões',24,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,'D','A',4),(158,69,'3.1.02.004','Premiações',24,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,'D','A',4),(172,83,'3.1.05.004','Jornais',27,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,'D','A',4),(182,93,'3.1.06.005','Comissão',28,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,'D','A',4),(185,96,'3.1.06.008','Férias',28,'D','A',4),(186,97,'3.1.06.009','FGTS',28,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,'D','A',4),(188,99,'3.1.06.011','INSS',28,'D','A',4),(189,100,'3.1.06.012','IRRF',28,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,'D','A',4),(191,102,'3.1.06.014','Salário',28,'D','A',4),(192,103,'3.1.06.015','Salário família',28,'D','A',4),(193,104,'3.1.06.016','Seguro',28,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,'D','A',4),(208,119,'4.1.01.002','Ações',32,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,'','S',3),(225,NULL,'6.1.01.001','Contas a receber',38,'C','A',4),(226,NULL,'4.1.02.006','Recebimento cartão',23,'C','A',4),(227,NULL,'6.1.02.001','Categoria excluída',39,'C','A',4);
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
INSERT INTO `categoria_centro_resultado` VALUES (226,1,2,100.0000);
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
INSERT INTO `categoria_empresa` VALUES (90,1,NULL,'',1,0),(90,2,NULL,'',1,0),(91,1,NULL,'',1,0),(91,2,NULL,'',1,0),(92,1,NULL,'',1,0),(92,2,NULL,'',1,0),(93,1,NULL,'',1,0),(93,2,NULL,'',1,0),(94,1,NULL,'',1,0),(94,2,NULL,'',1,0),(95,1,NULL,'',1,0),(95,2,NULL,'',1,0),(96,1,NULL,'',1,0),(96,2,NULL,'',1,0),(97,1,NULL,'',1,0),(97,2,NULL,'',1,0),(98,1,NULL,'',1,0),(98,2,NULL,'',1,0),(99,1,NULL,'',1,0),(99,2,NULL,'',1,0),(100,1,NULL,'',1,0),(100,2,NULL,'',1,0),(101,1,NULL,'',1,0),(101,2,NULL,'',1,0),(102,1,NULL,'',1,0),(102,2,NULL,'',1,0),(103,1,NULL,'',1,0),(103,2,NULL,'',1,0),(104,1,NULL,'',1,0),(104,2,NULL,'',1,0),(105,1,NULL,'',1,0),(105,2,NULL,'',1,0),(106,1,NULL,'',1,0),(106,2,NULL,'',1,0),(107,1,NULL,'',1,0),(107,2,NULL,'',1,0),(108,1,NULL,'',1,0),(108,2,NULL,'',1,0),(109,1,NULL,'',1,0),(109,2,NULL,'',1,0),(110,1,NULL,'',1,0),(110,2,NULL,'',1,0),(111,1,NULL,'',1,0),(111,2,NULL,'',1,0),(112,1,NULL,'',1,0),(112,2,NULL,'',1,0),(113,1,NULL,'',1,0),(113,2,NULL,'',1,0),(114,1,NULL,'',1,0),(114,2,NULL,'',1,0),(115,1,NULL,'',1,0),(115,2,NULL,'',1,0),(116,1,NULL,'',1,0),(116,2,NULL,'',1,0),(117,1,NULL,'',1,0),(117,2,NULL,'',1,0),(118,1,NULL,'',1,0),(118,2,NULL,'',1,0),(119,1,NULL,'',1,0),(119,2,NULL,'',1,0),(120,1,NULL,'',1,0),(120,2,NULL,'',1,0),(121,1,NULL,'',1,0),(121,2,NULL,'',1,0),(122,1,NULL,'',1,0),(122,2,NULL,'',1,0),(123,1,NULL,'',1,0),(123,2,NULL,'',1,0),(124,1,NULL,'',1,0),(124,2,NULL,'',1,0),(125,1,NULL,'',1,0),(125,2,NULL,'',1,0),(126,1,NULL,'',1,0),(126,2,NULL,'',1,0),(127,1,NULL,'',1,0),(127,2,NULL,'',1,0),(128,1,NULL,'',1,0),(128,2,NULL,'',1,0),(129,1,NULL,'',1,0),(129,2,NULL,'',1,0),(130,1,NULL,'',1,0),(130,2,NULL,'',1,0),(131,1,NULL,'',1,0),(131,2,NULL,'',1,0),(132,1,NULL,'',1,0),(132,2,NULL,'',1,0),(133,1,NULL,'',1,0),(133,2,NULL,'',1,0),(134,1,NULL,'',1,0),(134,2,NULL,'',1,0),(135,1,NULL,'',1,0),(135,2,NULL,'',1,0),(136,1,NULL,'',1,0),(136,2,NULL,'',1,0),(137,1,NULL,'',1,0),(137,2,NULL,'',1,0),(138,1,NULL,'',1,0),(138,2,NULL,'',1,0),(139,1,NULL,'',1,0),(139,2,NULL,'',1,0),(140,1,NULL,'',1,0),(140,2,NULL,'',1,0),(141,1,NULL,'',1,0),(141,2,NULL,'',1,0),(142,1,NULL,'',1,0),(142,2,NULL,'',1,0),(143,1,NULL,'',1,0),(143,2,NULL,'',1,0),(144,1,NULL,'',1,0),(144,2,NULL,'',1,0),(145,1,NULL,'',1,0),(145,2,NULL,'',1,0),(146,1,NULL,'',1,0),(146,2,NULL,'',1,0),(147,1,NULL,'',1,0),(147,2,NULL,'',1,0),(148,1,NULL,'',1,0),(148,2,NULL,'',1,0),(149,1,NULL,'',1,0),(149,2,NULL,'',1,0),(150,1,NULL,'',1,0),(150,2,NULL,'',1,0),(151,1,NULL,'',1,0),(151,2,NULL,'',1,0),(152,1,NULL,'',1,0),(152,2,NULL,'',1,0),(153,1,NULL,'',1,0),(153,2,NULL,'',1,0),(154,1,NULL,'',1,0),(154,2,NULL,'',1,0),(155,1,NULL,'',1,0),(155,2,NULL,'',1,0),(156,1,NULL,'',1,0),(156,2,NULL,'',1,0),(157,1,NULL,'',1,0),(157,2,NULL,'',1,0),(158,1,NULL,'',1,0),(158,2,NULL,'',1,0),(159,1,NULL,'',1,0),(159,2,NULL,'',1,0),(160,1,NULL,'',1,0),(160,2,NULL,'',1,0),(161,1,NULL,'',1,0),(161,2,NULL,'',1,0),(162,1,NULL,'',1,0),(162,2,NULL,'',1,0),(163,1,NULL,'',1,0),(163,2,NULL,'',1,0),(164,1,NULL,'',1,0),(164,2,NULL,'',1,0),(165,1,NULL,'',1,0),(165,2,NULL,'',1,0),(166,1,NULL,'',1,0),(166,2,NULL,'',1,0),(167,1,NULL,'',1,0),(167,2,NULL,'',1,0),(168,1,NULL,'',1,0),(168,2,NULL,'',1,0),(169,1,NULL,'',1,0),(169,2,NULL,'',1,0),(170,1,NULL,'',1,0),(170,2,NULL,'',1,0),(171,1,NULL,'',1,0),(171,2,NULL,'',1,0),(172,1,NULL,'',1,0),(172,2,NULL,'',1,0),(173,1,NULL,'',1,0),(173,2,NULL,'',1,0),(174,1,NULL,'',1,0),(174,2,NULL,'',1,0),(175,1,NULL,'',1,0),(175,2,NULL,'',1,0),(176,1,NULL,'',1,0),(176,2,NULL,'',1,0),(177,1,NULL,'',1,0),(177,2,NULL,'',1,0),(178,1,NULL,'',1,0),(178,2,NULL,'',1,0),(179,1,NULL,'',1,0),(179,2,NULL,'',1,0),(180,1,NULL,'',1,0),(180,2,NULL,'',1,0),(181,1,NULL,'',1,0),(181,2,NULL,'',1,0),(182,1,NULL,'',1,0),(182,2,NULL,'',1,0),(183,1,NULL,'',1,0),(183,2,NULL,'',1,0),(184,1,NULL,'',1,0),(184,2,NULL,'',1,0),(185,1,NULL,'',1,0),(185,2,NULL,'',1,0),(186,1,NULL,'',1,0),(186,2,NULL,'',1,0),(187,1,NULL,'',1,0),(187,2,NULL,'',1,0),(188,1,NULL,'',1,0),(188,2,NULL,'',1,0),(189,1,NULL,'',1,0),(189,2,NULL,'',1,0),(190,1,NULL,'',1,0),(190,2,NULL,'',1,0),(191,1,NULL,'',1,0),(191,2,NULL,'',1,0),(192,1,NULL,'',1,0),(192,2,NULL,'',1,0),(193,1,NULL,'',1,0),(193,2,NULL,'',1,0),(194,1,NULL,'',1,0),(194,2,NULL,'',1,0),(195,1,NULL,'',1,0),(195,2,NULL,'',1,0),(196,1,NULL,'',1,0),(196,2,NULL,'',1,0),(197,1,NULL,'',1,0),(197,2,NULL,'',1,0),(198,1,NULL,'',1,0),(198,2,NULL,'',1,0),(199,1,NULL,'',1,0),(199,2,NULL,'',1,0),(200,1,NULL,'',1,0),(200,2,NULL,'',1,0),(201,1,NULL,'',1,0),(201,2,NULL,'',1,0),(202,1,NULL,'',1,0),(202,2,NULL,'',1,0),(203,1,NULL,'',1,0),(203,2,NULL,'',1,0),(204,1,NULL,'',1,0),(204,2,NULL,'',1,0),(205,1,NULL,'',1,0),(205,2,NULL,'',1,0),(206,1,NULL,'',1,0),(206,2,NULL,'',1,0),(207,1,NULL,'',1,0),(207,2,NULL,'',1,0),(208,1,NULL,'',1,0),(208,2,NULL,'',1,0),(209,1,NULL,'',1,0),(209,2,NULL,'',1,0),(210,1,NULL,'',1,0),(210,2,NULL,'',1,0),(211,1,NULL,'',1,0),(211,2,NULL,'',1,0),(212,1,NULL,'',1,0),(212,2,NULL,'',1,0),(213,1,NULL,'',1,0),(213,2,NULL,'',1,0),(214,1,NULL,'',1,0),(214,2,NULL,'',1,0),(215,1,NULL,'',1,0),(215,2,NULL,'',1,0),(216,1,NULL,'',1,0),(216,2,NULL,'',1,0),(217,1,NULL,'',1,0),(217,2,NULL,'',1,0),(218,1,NULL,'',1,0),(218,2,NULL,'',1,0),(219,1,NULL,'',1,0),(219,2,NULL,'',1,0),(220,1,NULL,'',1,0),(220,2,NULL,'',1,0),(221,1,NULL,'',1,0),(221,2,NULL,'',1,0),(222,1,NULL,'',1,0),(222,2,NULL,'',1,0),(223,1,NULL,'',1,0),(223,2,NULL,'',1,0),(224,1,NULL,'',1,0),(224,2,NULL,'',1,0),(225,2,NULL,'',1,0),(226,1,NULL,'',1,0),(226,2,NULL,'',1,0),(227,2,NULL,'',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_resultado`
--

LOCK TABLES `centro_resultado` WRITE;
/*!40000 ALTER TABLE `centro_resultado` DISABLE KEYS */;
INSERT INTO `centro_resultado` VALUES (1,'Departamento Administrativo - Orçamento','813548',1,0),(2,'Departamento Desenvolvimento - Faturamento','438181',1,0),(3,'Departamento Administrativo - Orçamento','',1,0),(4,'Departamento Administrativo - Faturamento','1658440',1,0),(5,'Teste exclusão','',0,1),(6,'Departamento Desenvolvimento - Orçamento','',1,0),(7,'Departamento Desenvolvimento - Faturamento','',1,0),(8,'Departamento Administrativo - Orçamento','',1,0),(9,'Departamento Administrativo - Faturamento','',1,0),(10,'Teste exclusão','',1,0);
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
INSERT INTO `centro_resultado_empresa` VALUES (1,1),(2,1),(3,1),(4,1),(6,2),(7,2),(8,2),(9,2),(10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_motivo_cancelamento`
--

LOCK TABLES `cliente_contrato_motivo_cancelamento` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_motivo_cancelamento` DISABLE KEYS */;
INSERT INTO `cliente_contrato_motivo_cancelamento` VALUES (1,'A empresa encerrou suas atividades'),(2,'Trocou de sistema'),(3,'Redução de custos'),(4,'Registro a ser excluído');
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
INSERT INTO `cliente_contrato_motivo_cancelamento_empresa` VALUES (1,1,0,1,0),(1,2,0,1,0),(2,1,1,1,0),(2,2,0,1,0),(3,1,0,1,0),(3,2,0,1,0),(4,1,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_cargo`
--

LOCK TABLES `colaborador_cargo` WRITE;
/*!40000 ALTER TABLE `colaborador_cargo` DISABLE KEYS */;
INSERT INTO `colaborador_cargo` VALUES (1,'Programador',1000.00),(2,'Desenvolvedor',2000.00),(3,'Analista de Suporte',3000.00),(4,'Gerente',4000.00),(5,'Estagiário',1000.00),(6,'Secretária',3000.00),(7,'Pintor',2500.00),(8,'Arquiteto',6500.00),(9,'Analista',3000.00);
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
INSERT INTO `colaborador_cargo_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,1,0),(5,2,1,0),(6,1,1,0),(6,2,1,0),(7,1,1,0),(7,2,1,0),(8,1,1,0),(8,2,1,0),(9,1,1,0),(9,2,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato`
--

LOCK TABLES `colaborador_contrato` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato` DISABLE KEYS */;
INSERT INTO `colaborador_contrato` VALUES (1,2,18,1,2,'2022-10-04','0001-01-01','',2000.00),(2,2,19,NULL,4,'2022-10-04','0001-01-01','',3000.00),(3,2,20,NULL,3,'2022-10-04','0001-01-01','',2400.00),(4,2,21,NULL,3,'2022-10-04','0001-01-01','',2400.00),(5,2,22,NULL,4,'2022-10-04','0001-01-01','',3000.00),(6,2,23,NULL,3,'2022-10-04','0001-01-01','',2400.00),(7,2,24,NULL,4,'2022-10-04','0001-01-01','',3000.00),(8,2,25,NULL,3,'2022-10-04','0001-01-01','',2400.00),(9,2,26,NULL,4,'2022-10-04','0001-01-01','',3000.00),(10,2,27,NULL,4,'2022-10-04','0001-01-01','',3000.00),(11,2,28,NULL,4,'2022-10-04','0001-01-01','',3000.00),(12,2,29,NULL,3,'2022-10-04','0001-01-01','',2400.00),(13,2,30,NULL,4,'2022-10-04','0001-01-01','',3000.00),(14,2,31,NULL,4,'2022-10-04','0001-01-01','',3000.00),(15,2,32,NULL,3,'2022-10-04','0001-01-01','',2400.00),(16,2,33,NULL,3,'2022-10-04','0001-01-01','',2400.00),(17,2,34,NULL,4,'2022-10-04','0001-01-01','',3000.00),(18,2,35,NULL,3,'2022-10-04','0001-01-01','',2400.00),(19,2,36,NULL,3,'2022-10-04','0001-01-01','',2400.00),(20,2,37,NULL,4,'2022-10-04','0001-01-01','',3000.00),(21,2,38,NULL,5,'2022-10-04','0001-01-01','',900.00),(22,2,39,NULL,5,'2022-10-04','0001-01-01','',900.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato_horario`
--

LOCK TABLES `colaborador_contrato_horario` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato_horario` DISABLE KEYS */;
INSERT INTO `colaborador_contrato_horario` VALUES (1,2,'08:00:00','11:30:00','12:45:00','18:00:00'),(1,3,'08:00:00','11:30:00','12:45:00','18:00:00'),(1,4,'08:00:00','11:30:00','12:45:00','18:00:00'),(1,5,'08:00:00','11:30:00','12:45:00','18:00:00'),(1,6,'08:00:00','11:30:00','12:45:00','18:00:00'),(2,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(3,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(4,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(5,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(6,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(7,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(8,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(9,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(10,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(11,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(12,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(13,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(14,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(15,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(16,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(17,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(18,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(19,1,'06:00:00','14:00:00','14:15:00','22:00:00'),(20,1,'06:00:00','14:00:00','14:15:00','22:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_lancamento_auto`
--

LOCK TABLES `colaborador_lancamento_auto` WRITE;
/*!40000 ALTER TABLE `colaborador_lancamento_auto` DISABLE KEYS */;
INSERT INTO `colaborador_lancamento_auto` VALUES (2,2,1,19,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(3,2,1,19,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(4,2,18,19,1,1,1,3,'Desconto INSS',0.0000,30.00,1,1),(5,2,1,20,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(6,2,1,20,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(7,2,18,20,1,1,1,6,'Desconto INSS',0.0000,30.00,1,1),(8,2,1,21,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(9,2,1,21,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(10,2,18,21,1,1,1,9,'Desconto INSS',0.0000,30.00,1,1),(11,2,1,22,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(12,2,1,22,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(13,2,18,22,1,1,1,12,'Desconto INSS',0.0000,30.00,1,1),(14,2,1,23,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(15,2,1,23,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(16,2,18,23,1,1,1,15,'Desconto INSS',0.0000,30.00,1,1),(17,2,1,24,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(18,2,1,24,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(19,2,18,24,1,1,1,18,'Desconto INSS',0.0000,30.00,1,1),(20,2,1,25,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(21,2,1,25,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(22,2,18,25,1,1,1,21,'Desconto INSS',0.0000,30.00,1,1),(23,2,1,26,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(24,2,1,26,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(25,2,18,26,1,1,1,24,'Desconto INSS',0.0000,30.00,1,1),(26,2,1,27,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(27,2,1,27,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(28,2,18,27,1,1,1,27,'Desconto INSS',0.0000,30.00,1,1),(29,2,1,28,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(30,2,1,28,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(31,2,18,28,1,1,1,30,'Desconto INSS',0.0000,30.00,1,1),(32,2,1,29,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(33,2,1,29,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(34,2,18,29,1,1,1,33,'Desconto INSS',0.0000,30.00,1,1),(35,2,1,30,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(36,2,1,30,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(37,2,18,30,1,1,1,36,'Desconto INSS',0.0000,30.00,1,1),(38,2,1,31,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(39,2,1,31,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(40,2,18,31,1,1,1,39,'Desconto INSS',0.0000,30.00,1,1),(41,2,1,32,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(42,2,1,32,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(43,2,18,32,1,1,1,42,'Desconto INSS',0.0000,30.00,1,1),(44,2,1,33,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(45,2,1,33,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(46,2,18,33,1,1,1,45,'Desconto INSS',0.0000,30.00,1,1),(47,2,1,34,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(48,2,1,34,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(49,2,18,34,1,1,1,48,'Desconto INSS',0.0000,30.00,1,1),(50,2,1,35,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(51,2,1,35,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(52,2,18,35,1,1,1,51,'Desconto INSS',0.0000,30.00,1,1),(53,2,1,36,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(54,2,1,36,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(55,2,18,36,1,1,1,54,'Desconto INSS',0.0000,30.00,1,1),(56,2,1,37,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(57,2,1,37,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(58,2,18,37,1,1,1,57,'Desconto INSS',0.0000,30.00,1,1),(59,2,1,18,2,1,1,NULL,'Salário LagoaCred',44.0000,0.00,1,1),(60,2,1,18,1,1,1,NULL,'Salário Banco do Brasil',56.0000,0.00,1,1),(61,2,18,18,1,1,1,60,'Desconto INSS',0.0000,20.00,1,1),(62,2,1,38,2,1,1,NULL,'Salário',0.0000,900.00,1,1),(63,2,18,38,3,1,1,62,'Desconto INSS',0.0000,900.00,1,1),(64,2,10,38,2,1,1,NULL,'Comissão',0.0000,300.00,1,1);
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
INSERT INTO `configuracao` VALUES (1,1,6,0,'','',1045.00,1,96,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,5,0,0,3,3,1,3,'','',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1),(2,1,6,0,'','',1045.00,2,96,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,5,0,0,3,3,1,3,'','',3,NULL,NULL,1,1,1,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
INSERT INTO `conta` VALUES (1,1,1,0,'Caixa interno',1,-4050.00,0.00,'2022-10-03','','','',NULL,1,0),(2,2,1,0,'Caixa interno',1,-1200.00,0.00,'2022-10-03','','','',NULL,1,0),(3,2,NULL,756,'Sicoob',3,900.00,0.00,'2022-10-03','4113','2220-0','001',NULL,1,0),(4,2,NULL,0,'Caixa',1,0.00,0.00,'2022-10-03','','','',NULL,1,0),(5,2,NULL,0,'Cofre',2,0.00,0.00,'2022-10-03','','','',NULL,1,0),(6,1,NULL,0,'Conta Sommus',3,0.00,0.00,'2022-10-03','','','',NULL,1,0),(7,2,NULL,0,'Conta exclusão',3,0.00,0.00,'2022-10-03','','','',NULL,0,1);
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
INSERT INTO `conta_boleto` VALUES (3,'1','01',1,1,2,1,2,'NÃO RECEBER BOLETO - APENAS DE TESTES','TESTE DE BOLETO SOMMUS GESTOR - BOLETO SEM VALOR','700',0,'4235','','',2,0,0.2000,30,2.0000,0),(6,'','',1,1,2,1,2,'PAGÁVEL EM QUALQUER BANCO ATÉ A DATA DE VENCIMENTO.','','',0,'','','',2,0,0.0000,0,0.0000,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (4,2,'202209',-59410.00,2),(4,2,'202211',-55360.00,2),(4,2,'202212',-58350.00,2),(29,2,'202209',-59410.00,2),(29,2,'202211',-55360.00,2),(29,2,'202212',-58350.00,2),(68,2,'202209',59410.00,2),(68,2,'202210',4350.00,1),(68,2,'202211',55360.00,2),(68,2,'202212',58350.00,2),(78,2,'202209',-59410.00,2),(78,2,'202210',-4350.00,1),(78,2,'202211',-55360.00,2),(78,2,'202212',-58350.00,2);
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
INSERT INTO `conta_saldo` VALUES (1,'2022-10-04',-4050.00),(2,'2022-10-04',-1200.00),(3,'2022-10-03',0.00),(3,'2022-10-04',900.00),(4,'2022-10-03',0.00),(5,'2022-10-03',0.00),(6,'2022-10-03',0.00),(7,'2022-10-03',0.00);
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
INSERT INTO `empresa` VALUES (1,'Sommus Automação Comercial LTDA','Sommus Sistemas','04717475000154','ISENTO','5956','2022-10-04','Empresas/1/Logo/c4ca4238a0b923820dcc509a6f75849b','',0,1,0),(2,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA','24634181000176','0027467430027','','2022-10-04','Empresas/2/Logo/c81e728d9d4c2f636f067f89cc14862c','',0,1,0);
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
INSERT INTO `empresa_contato` VALUES (1,1,2,'(037) 3261-9150',''),(2,2,2,'03732619150','');
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
INSERT INTO `empresa_endereco` VALUES (1,1,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35580000','Lagoa da Prata','MG','3137205','',1),(2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',0),(3,2,'Av. Brasil','328','Centro','2º Andar','35590000','Lagoa da Prata','MG','3137205','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-10-04 16:38:30'),(2,'Deposito','Deposito do Centro','Av. Brasil','995','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-10-04 16:38:30'),(3,'Teste exclusão','','','','','','','','','','2022-10-04 16:38:30');
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
INSERT INTO `estoque_configuracao` VALUES (1,1,'Corredor',2,2),(1,2,'Prateleira',2,2),(2,1,'Corredor',2,2),(2,2,'Prateleira',2,2),(2,3,'Nível',2,1);
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
INSERT INTO `estoque_empresa` VALUES (1,1,0,1,0),(1,2,0,1,0),(2,1,0,1,0),(2,2,0,1,0),(3,1,0,0,1),(3,2,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento`
--

LOCK TABLES `folha_pagamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento` DISABLE KEYS */;
INSERT INTO `folha_pagamento` VALUES (1,2,'202209',1,2),(2,2,'202211',1,1),(3,2,'202211',2,2),(4,2,'202212',3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_evento`
--

LOCK TABLES `folha_pagamento_evento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_evento` DISABLE KEYS */;
INSERT INTO `folha_pagamento_evento` VALUES (1,1,'Salário','V',191,100.0000),(2,2,'Adiantamento de salário','D',179,0.0000),(3,3,'13º salário','V',178,50.0000),(4,4,'Adiantamento do 13º salário','V',180,50.0000),(5,5,'Férias','V',185,100.0000),(6,6,'1/3 sobre férias','V',185,33.3333),(7,7,'Hora extra 50%','V',187,150.0000),(8,8,'Hora extra 100%','V',187,200.0000),(9,9,'Desconto de faltas','D',197,0.0000),(10,10,'Comissão','V',182,0.0000),(11,11,'Desconto de plano de saúde','D',200,0.0000),(12,12,'Vale Alimentação','V',194,0.0000),(13,13,'Descanso semanal remunerado','V',184,0.0000),(14,14,'Adicional noturno, insalubridade e periculosidade','V',181,0.0000),(15,15,'Salário família','V',192,0.0000),(16,16,'Desconto de IRRF','D',199,0.0000),(17,17,'Desconto de vale transporte','D',202,0.0000),(18,18,'Desconto de INSS','D',198,0.0000),(19,19,'Desconto de contribuição sindical','D',196,0.0000),(20,20,'Desconto de vale alimentação','D',201,0.0000),(21,21,'Vale transporte','V',195,0.0000),(22,NULL,'Salário Inicial','V',191,0.0000),(23,NULL,'Desconto INSS (update)','D',191,0.0000),(24,NULL,'Cadastro Teste de Busca','V',137,0.0000),(25,NULL,'Contribuição AMAVI','V',137,0.0000);
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
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,1,0),(5,2,1,0),(6,1,1,0),(6,2,1,0),(7,1,1,0),(7,2,1,0),(8,1,1,0),(8,2,1,0),(9,1,1,0),(9,2,1,0),(10,1,1,0),(10,2,1,0),(11,1,1,0),(11,2,1,0),(12,1,1,0),(12,2,1,0),(13,1,1,0),(13,2,1,0),(14,1,1,0),(14,2,1,0),(15,1,1,0),(15,2,1,0),(16,1,1,0),(16,2,1,0),(17,1,1,0),(17,2,1,0),(18,1,1,0),(18,2,1,0),(19,1,1,0),(19,2,1,0),(20,1,1,0),(20,2,1,0),(21,1,1,0),(21,2,1,0),(22,1,1,0),(22,2,1,0),(23,1,1,0),(23,2,1,0),(24,1,1,0),(24,2,1,0),(25,1,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_lancamento`
--

LOCK TABLES `folha_pagamento_lancamento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_lancamento` DISABLE KEYS */;
INSERT INTO `folha_pagamento_lancamento` VALUES (1,1,38,10,2,1,1,182,'Comissão','2022-10-04','0001-01-01','2022-10-04',300.00,'V',NULL,1,1,0),(2,1,38,1,2,1,1,191,'Salário','2022-10-04','0001-01-01','2022-10-04',900.00,'V',NULL,1,1,0),(3,1,38,18,3,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','2022-10-04',900.00,'D',2,1,1,0),(4,1,18,1,1,1,1,191,'Salário Banco do Brasil (alterado)','2022-10-04','0001-01-01','0001-01-01',1120.00,'V',NULL,1,0,0),(5,1,18,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',880.00,'V',NULL,1,0,0),(6,1,18,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',20.00,'D',4,1,0,0),(7,1,19,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(8,1,19,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(9,1,19,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',7,1,0,0),(10,1,20,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(11,1,20,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(12,1,20,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',10,1,0,0),(13,1,21,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(14,1,21,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(15,1,21,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',13,1,0,0),(16,1,22,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(17,1,22,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(18,1,22,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',16,1,0,0),(19,1,23,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(20,1,23,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(21,1,23,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',19,1,0,0),(22,1,24,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(23,1,24,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(24,1,24,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',22,1,0,0),(25,1,25,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(26,1,25,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(27,1,25,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',25,1,0,0),(28,1,26,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(29,1,26,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(30,1,26,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',28,1,0,0),(31,1,27,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(32,1,27,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(33,1,27,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',31,1,0,0),(34,1,28,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(35,1,28,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(36,1,28,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',34,1,0,0),(37,1,29,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(38,1,29,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(39,1,29,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',37,1,0,0),(40,1,30,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(41,1,30,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(42,1,30,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',40,1,0,0),(43,1,31,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(44,1,31,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(45,1,31,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',43,1,0,0),(46,1,32,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(47,1,32,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(48,1,32,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',46,1,0,0),(49,1,33,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(50,1,33,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(51,1,33,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',49,1,0,0),(52,1,34,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(53,1,34,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(54,1,34,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',52,1,0,0),(55,1,35,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(56,1,35,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(57,1,35,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',55,1,0,0),(58,1,36,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(59,1,36,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(60,1,36,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',58,1,0,0),(61,1,37,1,1,1,1,191,'Salário Banco do Brasil','2022-10-04','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(62,1,37,1,2,1,1,191,'Salário LagoaCred','2022-10-04','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(63,1,37,18,1,1,1,198,'Desconto INSS','2022-10-04','0001-01-01','0001-01-01',30.00,'D',61,1,0,0),(64,1,18,1,1,1,NULL,191,'Salário teste','2022-10-04','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(65,2,18,1,1,1,NULL,191,'Salário teste 2','2022-10-04','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(66,1,18,2,1,1,1,179,'Adiantamento de salário teste 1 (alterado)','2022-10-04','0001-01-01','0001-01-01',100.00,'D',64,0,0,0),(67,2,18,2,1,1,1,179,'Adiantamento de salário teste 2','2022-10-04','0001-01-01','0001-01-01',40.00,'D',NULL,0,0,1),(68,3,18,4,1,1,1,180,'Adiantamento do 13º salário','2022-10-04','0001-01-01','0001-01-01',1000.00,'V',65,0,0,0),(69,4,18,3,1,1,1,178,'13º salário','2022-10-04','0001-01-01','0001-01-01',2000.00,'V',NULL,0,0,0),(70,4,18,2,1,1,1,179,'Adiantamento do 13º salário','2022-10-04','0001-01-01','0001-01-01',1000.00,'D',69,0,0,0),(71,2,18,1,1,1,1,191,'ZZSalário pago (excluído)','2022-10-04','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(72,2,18,1,1,1,1,191,'ZZSalário (excluído)','2022-10-04','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(73,2,18,1,1,1,1,191,'ZZAditantamento Salário pago (excluído)','2022-10-04','0001-01-01','2022-10-04',50.00,'V',72,0,1,0),(74,1,38,1,1,1,1,191,'Salário CEF 7','2022-10-04','2022-11-04','2022-10-04',1000.00,'V',NULL,0,1,0),(75,1,38,10,1,1,NULL,182,'Comissão 7','2022-10-04','0001-01-01','2022-10-04',500.00,'V',NULL,0,1,0),(76,1,38,1,1,1,1,191,'Salário CEF 1','2022-10-04','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(77,1,38,1,1,1,1,191,'Salário CEF 2','2022-10-04','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(78,1,38,2,1,1,1,179,'Vale - 2','2022-10-04','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(79,1,38,1,1,1,1,191,'Salário CEF 3','2022-10-04','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(80,1,38,2,1,1,1,179,'Vale 3','2022-10-04','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(81,1,38,1,1,1,1,191,'Salário CEF 4','2022-10-04','0001-01-01','2022-10-04',1000.00,'V',NULL,0,1,0),(82,1,38,2,1,1,1,179,'Vale - 4','2022-10-04','0001-01-01','2022-10-04',700.00,'D',81,0,1,0),(83,1,38,1,1,1,1,191,'Salário CEF 5','2022-10-04','2022-11-04','0001-01-01',1000.00,'V',NULL,0,0,1),(84,1,38,2,1,1,1,179,'Vale - 5','2022-10-04','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(85,1,38,1,1,1,1,191,'Salário CEF 6','2022-10-04','2022-11-04','0001-01-01',1000.00,'V',NULL,0,0,1),(86,1,38,10,1,1,NULL,182,'Comissão 6','2022-10-04','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,1),(87,1,38,2,1,1,1,179,'Vale - 6','2022-10-04','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(88,1,39,1,1,1,1,191,'Salário CEF','2022-10-04','0001-01-01','0001-01-01',800.00,'V',NULL,0,0,0),(89,1,39,2,1,1,1,179,'Vale','2022-10-04','0001-01-01','0001-01-01',600.00,'D',NULL,0,0,1),(90,1,39,2,1,1,1,179,'Vale 2','2022-10-04','0001-01-01','0001-01-01',400.00,'D',88,0,0,0),(91,1,39,2,1,1,1,179,'Vale 2','2022-10-04','0001-01-01','0001-01-01',200.00,'D',88,0,0,0),(92,1,38,1,1,1,1,191,'Salário CEF 7','2022-10-04','2022-11-04','2022-10-04',1000.00,'V',NULL,0,1,0),(93,1,38,10,1,1,NULL,182,'Comissão 7','2022-10-04','0001-01-01','2022-10-04',500.00,'V',NULL,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-10-04 16:38:54'),(2,2,'Cheque',1,2,2,1,0,1,'2022-10-04 16:38:54'),(3,3,'Cartão',1,3,3,0,0,0,'2022-10-04 16:38:54'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-10-04 16:38:54'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-10-04 16:38:54'),(6,6,'PIX',1,6,17,0,0,1,'2022-10-04 16:38:54'),(7,NULL,'Dinheiro (Alterado)',1,1,0,0,0,1,'2022-10-04 16:38:54'),(8,NULL,'Outros',9,99,0,0,0,0,'2022-10-04 16:38:54'),(9,NULL,'Cheque',9,2,0,0,0,1,'2022-10-04 16:38:39'),(10,NULL,'Cartão',9,3,0,0,0,1,'2022-10-04 16:38:39'),(11,NULL,'Teste exclusão',1,1,0,0,0,0,'2022-10-04 16:38:54');
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
INSERT INTO `forma_pagamento_empresa` VALUES (1,1,0,0),(1,2,0,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,1,0),(5,2,1,0),(6,1,1,0),(6,2,1,0),(7,1,1,0),(7,2,1,0),(8,1,1,0),(8,2,1,0),(9,1,0,0),(9,2,0,0),(10,1,0,0),(10,2,0,0),(11,1,0,1),(11,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=846 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2022-10-04 16:37:30',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome Fantasia\":\"Sommus Sistemas\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.717.475/0001-54\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(2,NULL,'2022-10-04 16:37:30',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome Fantasia\":\"Sommus Sistemas\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.717.475/0001-54\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(3,NULL,'2022-10-04 16:37:30',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Luciano\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Sommus Automação Comercial LTDA\",\"[identificacao]\":\"Sommus Automação Comercial LTDA\",\"Nome Fantasia\":\"Sommus Sistemas\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.717.475/0001-54\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"5956\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(4,NULL,'2022-10-04 16:37:35',1,29,2,'{\"ID\":\"2\",\"Nome\":\"Treinamento Online\",\"[identificacao]\":\"Treinamento Online\",\"Descrição\":\"Treinamento Online\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(5,NULL,'2022-10-04 16:37:35',1,29,901,'{\"ID\":\"901\",\"Nome\":\"Suporte técnico\",\"[identificacao]\":\"Suporte técnico\",\"Descrição\":\"Suporte técnico\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(6,NULL,'2022-10-04 16:37:35',1,12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(7,NULL,'2022-10-04 16:37:35',1,12,3,'{\"ID\":\"3\",\"Nome\":\"SommusVendas (Mobile)\",\"[identificacao]\":\"SommusVendas (Mobile)\",\"Descrição\":\"SommusVendas (Mobile)\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(8,NULL,'2022-10-04 16:37:35',1,12,4,'{\"ID\":\"4\",\"Nome\":\"SommusVendas (Desktop)\",\"[identificacao]\":\"SommusVendas (Desktop)\",\"Descrição\":\"SommusVendas (Desktop)\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(9,1,'2022-10-04 16:37:35',2,89,1,'{\"ID\":\"1\",\"Preço de custo\":\"0,00\",\"Preço de venda\":\"20,00\",\"Margem de lucro\":\"0,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(10,NULL,'2022-10-04 16:37:38',2,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Sommus Automacao Comercial Ltda - Me\",\"[identificacao]\":\"Sommus Automacao Comercial Ltda - Me\",\"Nome Fantasia\":\"Sommus Sistemas\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"04.717.475/0001-54\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"ISENTO\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(11,NULL,'2022-10-04 16:37:53',1,20,2,'{\"ID\":\"2\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(12,NULL,'2022-10-04 16:37:53',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\"}',20,2,'{\"ID\":\"2\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(13,NULL,'2022-10-04 16:37:53',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Dr. Luciano\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Não\"}',20,2,'{\"ID\":\"2\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(14,NULL,'2022-10-04 16:37:53',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"328\",\"Bairro\":\"Centro\",\"Complemento\":\"2º Andar\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,2,'{\"ID\":\"2\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva 99553082653\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(15,NULL,'2022-10-04 16:38:13',1,91,1,'{\"ID\":\"1\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(16,NULL,'2022-10-04 16:38:13',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(17,NULL,'2022-10-04 16:38:13',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(18,NULL,'2022-10-04 16:38:13',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(19,NULL,'2022-10-04 16:38:13',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(20,NULL,'2022-10-04 16:38:13',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(21,NULL,'2022-10-04 16:38:13',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(22,NULL,'2022-10-04 16:38:13',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(23,NULL,'2022-10-04 16:38:13',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(24,NULL,'2022-10-04 16:38:13',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(25,NULL,'2022-10-04 16:38:13',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(26,NULL,'2022-10-04 16:38:13',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(27,NULL,'2022-10-04 16:38:13',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(28,NULL,'2022-10-04 16:38:13',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(29,NULL,'2022-10-04 16:38:13',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(30,NULL,'2022-10-04 16:38:13',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(31,NULL,'2022-10-04 16:38:13',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(32,NULL,'2022-10-04 16:38:13',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(33,NULL,'2022-10-04 16:38:13',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(34,NULL,'2022-10-04 16:38:13',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(35,NULL,'2022-10-04 16:38:13',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(36,NULL,'2022-10-04 16:38:13',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(37,NULL,'2022-10-04 16:38:13',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(38,NULL,'2022-10-04 16:38:13',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(39,NULL,'2022-10-04 16:38:13',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(40,NULL,'2022-10-04 16:38:13',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(41,NULL,'2022-10-04 16:38:13',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(42,NULL,'2022-10-04 16:38:13',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(43,NULL,'2022-10-04 16:38:13',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(44,NULL,'2022-10-04 16:38:13',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(45,NULL,'2022-10-04 16:38:13',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(46,NULL,'2022-10-04 16:38:13',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(47,NULL,'2022-10-04 16:38:13',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(48,NULL,'2022-10-04 16:38:13',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(49,NULL,'2022-10-04 16:38:13',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(50,NULL,'2022-10-04 16:38:13',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(51,NULL,'2022-10-04 16:38:13',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(52,NULL,'2022-10-04 16:38:13',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(53,NULL,'2022-10-04 16:38:13',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(54,NULL,'2022-10-04 16:38:13',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(55,NULL,'2022-10-04 16:38:13',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(56,NULL,'2022-10-04 16:38:13',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(57,NULL,'2022-10-04 16:38:13',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(58,NULL,'2022-10-04 16:38:13',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(59,NULL,'2022-10-04 16:38:13',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(60,NULL,'2022-10-04 16:38:13',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(61,NULL,'2022-10-04 16:38:13',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(62,NULL,'2022-10-04 16:38:13',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(63,NULL,'2022-10-04 16:38:13',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(64,NULL,'2022-10-04 16:38:13',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(65,NULL,'2022-10-04 16:38:13',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(66,NULL,'2022-10-04 16:38:13',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(67,NULL,'2022-10-04 16:38:13',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(68,NULL,'2022-10-04 16:38:13',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(69,NULL,'2022-10-04 16:38:13',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(70,NULL,'2022-10-04 16:38:13',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(71,NULL,'2022-10-04 16:38:13',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(72,NULL,'2022-10-04 16:38:13',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(73,NULL,'2022-10-04 16:38:13',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(74,NULL,'2022-10-04 16:38:13',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(75,NULL,'2022-10-04 16:38:13',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(76,NULL,'2022-10-04 16:38:13',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(77,NULL,'2022-10-04 16:38:13',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(78,NULL,'2022-10-04 16:38:13',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(79,NULL,'2022-10-04 16:38:13',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(80,NULL,'2022-10-04 16:38:13',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(81,NULL,'2022-10-04 16:38:13',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(82,NULL,'2022-10-04 16:38:13',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(83,NULL,'2022-10-04 16:38:13',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(84,NULL,'2022-10-04 16:38:13',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(85,NULL,'2022-10-04 16:38:13',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(86,NULL,'2022-10-04 16:38:13',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(87,NULL,'2022-10-04 16:38:13',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(88,NULL,'2022-10-04 16:38:13',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(89,NULL,'2022-10-04 16:38:13',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(90,NULL,'2022-10-04 16:38:13',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(91,NULL,'2022-10-04 16:38:13',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(92,NULL,'2022-10-04 16:38:13',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(93,NULL,'2022-10-04 16:38:13',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(94,NULL,'2022-10-04 16:38:13',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(95,NULL,'2022-10-04 16:38:13',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(96,NULL,'2022-10-04 16:38:13',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(97,NULL,'2022-10-04 16:38:13',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(98,NULL,'2022-10-04 16:38:13',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(99,NULL,'2022-10-04 16:38:13',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(100,NULL,'2022-10-04 16:38:13',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(101,NULL,'2022-10-04 16:38:13',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(102,NULL,'2022-10-04 16:38:13',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(103,NULL,'2022-10-04 16:38:13',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(104,NULL,'2022-10-04 16:38:13',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(105,NULL,'2022-10-04 16:38:13',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(106,NULL,'2022-10-04 16:38:13',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(107,NULL,'2022-10-04 16:38:13',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(108,NULL,'2022-10-04 16:38:13',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(109,NULL,'2022-10-04 16:38:13',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(110,NULL,'2022-10-04 16:38:13',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(111,NULL,'2022-10-04 16:38:13',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(112,NULL,'2022-10-04 16:38:13',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(113,NULL,'2022-10-04 16:38:13',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(114,NULL,'2022-10-04 16:38:13',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(115,NULL,'2022-10-04 16:38:13',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(116,NULL,'2022-10-04 16:38:13',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(117,NULL,'2022-10-04 16:38:13',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(118,NULL,'2022-10-04 16:38:13',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(119,NULL,'2022-10-04 16:38:13',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(120,NULL,'2022-10-04 16:38:13',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(121,NULL,'2022-10-04 16:38:13',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(122,NULL,'2022-10-04 16:38:13',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(123,NULL,'2022-10-04 16:38:13',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(124,NULL,'2022-10-04 16:38:13',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(125,NULL,'2022-10-04 16:38:13',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(126,NULL,'2022-10-04 16:38:13',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(127,NULL,'2022-10-04 16:38:13',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(128,NULL,'2022-10-04 16:38:13',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(129,NULL,'2022-10-04 16:38:13',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(130,NULL,'2022-10-04 16:38:13',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(131,NULL,'2022-10-04 16:38:13',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(132,NULL,'2022-10-04 16:38:13',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(133,NULL,'2022-10-04 16:38:13',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(134,NULL,'2022-10-04 16:38:13',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(135,NULL,'2022-10-04 16:38:13',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(136,NULL,'2022-10-04 16:38:13',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(137,NULL,'2022-10-04 16:38:13',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(138,NULL,'2022-10-04 16:38:13',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(139,NULL,'2022-10-04 16:38:13',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(140,NULL,'2022-10-04 16:38:13',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(141,NULL,'2022-10-04 16:38:13',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(142,NULL,'2022-10-04 16:38:13',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(143,NULL,'2022-10-04 16:38:13',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(144,NULL,'2022-10-04 16:38:13',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(145,NULL,'2022-10-04 16:38:13',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(146,NULL,'2022-10-04 16:38:13',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(147,NULL,'2022-10-04 16:38:13',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(148,NULL,'2022-10-04 16:38:13',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(149,NULL,'2022-10-04 16:38:13',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(150,NULL,'2022-10-04 16:38:13',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(151,NULL,'2022-10-04 16:38:13',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(152,1,'2022-10-04 16:38:14',1,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(153,1,'2022-10-04 16:38:14',1,2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(154,1,'2022-10-04 16:38:14',1,3,1,'{\"ID\":\"1\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(155,1,'2022-10-04 16:38:14',1,3,2,'{\"ID\":\"2\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(156,1,'2022-10-04 16:38:14',1,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(157,1,'2022-10-04 16:38:14',1,3,4,'{\"ID\":\"4\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"BA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(158,1,'2022-10-04 16:38:14',1,3,5,'{\"ID\":\"5\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AL\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(159,1,'2022-10-04 16:38:14',1,3,6,'{\"ID\":\"6\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"CE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(160,1,'2022-10-04 16:38:14',1,3,7,'{\"ID\":\"7\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"DF\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(161,1,'2022-10-04 16:38:14',1,3,8,'{\"ID\":\"8\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"ES\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(162,1,'2022-10-04 16:38:14',1,3,9,'{\"ID\":\"9\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"GO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(163,1,'2022-10-04 16:38:14',1,3,10,'{\"ID\":\"10\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(164,1,'2022-10-04 16:38:14',1,3,11,'{\"ID\":\"11\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(165,1,'2022-10-04 16:38:14',1,3,12,'{\"ID\":\"12\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(166,1,'2022-10-04 16:38:14',1,3,13,'{\"ID\":\"13\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MT\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(167,1,'2022-10-04 16:38:14',1,3,14,'{\"ID\":\"14\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(168,1,'2022-10-04 16:38:14',1,3,15,'{\"ID\":\"15\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PB\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(169,1,'2022-10-04 16:38:14',1,3,16,'{\"ID\":\"16\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(170,1,'2022-10-04 16:38:14',1,3,17,'{\"ID\":\"17\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PI\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(171,1,'2022-10-04 16:38:14',1,3,18,'{\"ID\":\"18\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(172,1,'2022-10-04 16:38:14',1,3,19,'{\"ID\":\"19\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RJ\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(173,1,'2022-10-04 16:38:14',1,3,20,'{\"ID\":\"20\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RN\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(174,1,'2022-10-04 16:38:14',1,3,21,'{\"ID\":\"21\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(175,1,'2022-10-04 16:38:14',1,3,22,'{\"ID\":\"22\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(176,1,'2022-10-04 16:38:14',1,3,23,'{\"ID\":\"23\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(177,1,'2022-10-04 16:38:14',1,3,24,'{\"ID\":\"24\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(178,1,'2022-10-04 16:38:14',1,3,25,'{\"ID\":\"25\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(179,1,'2022-10-04 16:38:14',1,3,26,'{\"ID\":\"26\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(180,1,'2022-10-04 16:38:14',1,3,27,'{\"ID\":\"27\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"TO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(181,1,'2022-10-04 16:38:14',1,3,28,'{\"ID\":\"28\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":2,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"98\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(182,1,'2022-10-04 16:38:14',1,3,29,'{\"ID\":\"29\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":3,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"71\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(183,1,'2022-10-04 16:38:14',1,3,30,'{\"ID\":\"30\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(184,1,'2022-10-04 16:38:14',1,3,31,'{\"ID\":\"31\",\"Nome\":\"Isentos\",\"[identificacao]\":\"Isentos\",\"Operação\":5,\"UF\":\"\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Isenta de ISS\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"Isenção\",\"Natureza da Operação do serviço\":\"Sem Dedução\",\"Alíquota ISS\":\"1,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":60,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\"}'),(185,NULL,'2022-10-04 16:38:14',2,91,1,'{\"ID\":\"1\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(186,NULL,'2022-10-04 16:38:14',1,91,2,'{\"ID\":\"2\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(187,NULL,'2022-10-04 16:38:14',1,8,90,'{\"ID\":\"90\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(188,NULL,'2022-10-04 16:38:14',1,8,91,'{\"ID\":\"91\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(189,NULL,'2022-10-04 16:38:14',1,8,92,'{\"ID\":\"92\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(190,NULL,'2022-10-04 16:38:14',1,8,93,'{\"ID\":\"93\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(191,NULL,'2022-10-04 16:38:14',1,8,94,'{\"ID\":\"94\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(192,NULL,'2022-10-04 16:38:14',1,8,95,'{\"ID\":\"95\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(193,NULL,'2022-10-04 16:38:14',1,8,96,'{\"ID\":\"96\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(194,NULL,'2022-10-04 16:38:14',1,8,97,'{\"ID\":\"97\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(195,NULL,'2022-10-04 16:38:14',1,8,98,'{\"ID\":\"98\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(196,NULL,'2022-10-04 16:38:14',1,8,99,'{\"ID\":\"99\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(197,NULL,'2022-10-04 16:38:14',1,8,100,'{\"ID\":\"100\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(198,NULL,'2022-10-04 16:38:14',1,8,101,'{\"ID\":\"101\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(199,NULL,'2022-10-04 16:38:14',1,8,102,'{\"ID\":\"102\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(200,NULL,'2022-10-04 16:38:14',1,8,103,'{\"ID\":\"103\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(201,NULL,'2022-10-04 16:38:14',1,8,104,'{\"ID\":\"104\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(202,NULL,'2022-10-04 16:38:14',1,8,105,'{\"ID\":\"105\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(203,NULL,'2022-10-04 16:38:14',1,8,106,'{\"ID\":\"106\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(204,NULL,'2022-10-04 16:38:14',1,8,107,'{\"ID\":\"107\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(205,NULL,'2022-10-04 16:38:14',1,8,108,'{\"ID\":\"108\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(206,NULL,'2022-10-04 16:38:14',1,8,109,'{\"ID\":\"109\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(207,NULL,'2022-10-04 16:38:14',1,8,110,'{\"ID\":\"110\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(208,NULL,'2022-10-04 16:38:14',1,8,111,'{\"ID\":\"111\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(209,NULL,'2022-10-04 16:38:14',1,8,112,'{\"ID\":\"112\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(210,NULL,'2022-10-04 16:38:14',1,8,113,'{\"ID\":\"113\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(211,NULL,'2022-10-04 16:38:14',1,8,114,'{\"ID\":\"114\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(212,NULL,'2022-10-04 16:38:14',1,8,115,'{\"ID\":\"115\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(213,NULL,'2022-10-04 16:38:14',1,8,116,'{\"ID\":\"116\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(214,NULL,'2022-10-04 16:38:14',1,8,117,'{\"ID\":\"117\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(215,NULL,'2022-10-04 16:38:14',1,8,118,'{\"ID\":\"118\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(216,NULL,'2022-10-04 16:38:14',1,8,119,'{\"ID\":\"119\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(217,NULL,'2022-10-04 16:38:14',1,8,120,'{\"ID\":\"120\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(218,NULL,'2022-10-04 16:38:14',1,8,121,'{\"ID\":\"121\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(219,NULL,'2022-10-04 16:38:14',1,8,122,'{\"ID\":\"122\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(220,NULL,'2022-10-04 16:38:14',1,8,123,'{\"ID\":\"123\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(221,NULL,'2022-10-04 16:38:14',1,8,124,'{\"ID\":\"124\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(222,NULL,'2022-10-04 16:38:14',1,8,125,'{\"ID\":\"125\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(223,NULL,'2022-10-04 16:38:14',1,8,126,'{\"ID\":\"126\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(224,NULL,'2022-10-04 16:38:14',1,8,127,'{\"ID\":\"127\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(225,NULL,'2022-10-04 16:38:14',1,8,128,'{\"ID\":\"128\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(226,NULL,'2022-10-04 16:38:14',1,8,129,'{\"ID\":\"129\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(227,NULL,'2022-10-04 16:38:14',1,8,130,'{\"ID\":\"130\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(228,NULL,'2022-10-04 16:38:14',1,8,131,'{\"ID\":\"131\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(229,NULL,'2022-10-04 16:38:14',1,8,132,'{\"ID\":\"132\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(230,NULL,'2022-10-04 16:38:14',1,8,133,'{\"ID\":\"133\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(231,NULL,'2022-10-04 16:38:14',1,8,134,'{\"ID\":\"134\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(232,NULL,'2022-10-04 16:38:14',1,8,135,'{\"ID\":\"135\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(233,NULL,'2022-10-04 16:38:14',1,8,136,'{\"ID\":\"136\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(234,NULL,'2022-10-04 16:38:14',1,8,137,'{\"ID\":\"137\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(235,NULL,'2022-10-04 16:38:14',1,8,138,'{\"ID\":\"138\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(236,NULL,'2022-10-04 16:38:14',1,8,139,'{\"ID\":\"139\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(237,NULL,'2022-10-04 16:38:14',1,8,140,'{\"ID\":\"140\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(238,NULL,'2022-10-04 16:38:14',1,8,141,'{\"ID\":\"141\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(239,NULL,'2022-10-04 16:38:14',1,8,142,'{\"ID\":\"142\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(240,NULL,'2022-10-04 16:38:14',1,8,143,'{\"ID\":\"143\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(241,NULL,'2022-10-04 16:38:14',1,8,144,'{\"ID\":\"144\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(242,NULL,'2022-10-04 16:38:14',1,8,145,'{\"ID\":\"145\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(243,NULL,'2022-10-04 16:38:14',1,8,146,'{\"ID\":\"146\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(244,NULL,'2022-10-04 16:38:14',1,8,147,'{\"ID\":\"147\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(245,NULL,'2022-10-04 16:38:14',1,8,148,'{\"ID\":\"148\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(246,NULL,'2022-10-04 16:38:14',1,8,149,'{\"ID\":\"149\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(247,NULL,'2022-10-04 16:38:14',1,8,150,'{\"ID\":\"150\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(248,NULL,'2022-10-04 16:38:14',1,8,151,'{\"ID\":\"151\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(249,NULL,'2022-10-04 16:38:14',1,8,152,'{\"ID\":\"152\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(250,NULL,'2022-10-04 16:38:14',1,8,153,'{\"ID\":\"153\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(251,NULL,'2022-10-04 16:38:14',1,8,154,'{\"ID\":\"154\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(252,NULL,'2022-10-04 16:38:14',1,8,155,'{\"ID\":\"155\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(253,NULL,'2022-10-04 16:38:14',1,8,156,'{\"ID\":\"156\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(254,NULL,'2022-10-04 16:38:14',1,8,157,'{\"ID\":\"157\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(255,NULL,'2022-10-04 16:38:14',1,8,158,'{\"ID\":\"158\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(256,NULL,'2022-10-04 16:38:14',1,8,159,'{\"ID\":\"159\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(257,NULL,'2022-10-04 16:38:14',1,8,160,'{\"ID\":\"160\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(258,NULL,'2022-10-04 16:38:14',1,8,161,'{\"ID\":\"161\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(259,NULL,'2022-10-04 16:38:14',1,8,162,'{\"ID\":\"162\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(260,NULL,'2022-10-04 16:38:14',1,8,163,'{\"ID\":\"163\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(261,NULL,'2022-10-04 16:38:14',1,8,164,'{\"ID\":\"164\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(262,NULL,'2022-10-04 16:38:14',1,8,165,'{\"ID\":\"165\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(263,NULL,'2022-10-04 16:38:14',1,8,166,'{\"ID\":\"166\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(264,NULL,'2022-10-04 16:38:14',1,8,167,'{\"ID\":\"167\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(265,NULL,'2022-10-04 16:38:14',1,8,168,'{\"ID\":\"168\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(266,NULL,'2022-10-04 16:38:14',1,8,169,'{\"ID\":\"169\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(267,NULL,'2022-10-04 16:38:14',1,8,170,'{\"ID\":\"170\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(268,NULL,'2022-10-04 16:38:14',1,8,171,'{\"ID\":\"171\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(269,NULL,'2022-10-04 16:38:14',1,8,172,'{\"ID\":\"172\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(270,NULL,'2022-10-04 16:38:14',1,8,173,'{\"ID\":\"173\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(271,NULL,'2022-10-04 16:38:14',1,8,174,'{\"ID\":\"174\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(272,NULL,'2022-10-04 16:38:14',1,8,175,'{\"ID\":\"175\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(273,NULL,'2022-10-04 16:38:14',1,8,176,'{\"ID\":\"176\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(274,NULL,'2022-10-04 16:38:14',1,8,177,'{\"ID\":\"177\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(275,NULL,'2022-10-04 16:38:14',1,8,178,'{\"ID\":\"178\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(276,NULL,'2022-10-04 16:38:14',1,8,179,'{\"ID\":\"179\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(277,NULL,'2022-10-04 16:38:14',1,8,180,'{\"ID\":\"180\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(278,NULL,'2022-10-04 16:38:14',1,8,181,'{\"ID\":\"181\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(279,NULL,'2022-10-04 16:38:14',1,8,182,'{\"ID\":\"182\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(280,NULL,'2022-10-04 16:38:14',1,8,183,'{\"ID\":\"183\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(281,NULL,'2022-10-04 16:38:14',1,8,184,'{\"ID\":\"184\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(282,NULL,'2022-10-04 16:38:14',1,8,185,'{\"ID\":\"185\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(283,NULL,'2022-10-04 16:38:14',1,8,186,'{\"ID\":\"186\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(284,NULL,'2022-10-04 16:38:14',1,8,187,'{\"ID\":\"187\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(285,NULL,'2022-10-04 16:38:14',1,8,188,'{\"ID\":\"188\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(286,NULL,'2022-10-04 16:38:14',1,8,189,'{\"ID\":\"189\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(287,NULL,'2022-10-04 16:38:14',1,8,190,'{\"ID\":\"190\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(288,NULL,'2022-10-04 16:38:14',1,8,191,'{\"ID\":\"191\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(289,NULL,'2022-10-04 16:38:14',1,8,192,'{\"ID\":\"192\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(290,NULL,'2022-10-04 16:38:14',1,8,193,'{\"ID\":\"193\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(291,NULL,'2022-10-04 16:38:14',1,8,194,'{\"ID\":\"194\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(292,NULL,'2022-10-04 16:38:14',1,8,195,'{\"ID\":\"195\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(293,NULL,'2022-10-04 16:38:14',1,8,196,'{\"ID\":\"196\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(294,NULL,'2022-10-04 16:38:14',1,8,197,'{\"ID\":\"197\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(295,NULL,'2022-10-04 16:38:14',1,8,198,'{\"ID\":\"198\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(296,NULL,'2022-10-04 16:38:14',1,8,199,'{\"ID\":\"199\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(297,NULL,'2022-10-04 16:38:14',1,8,200,'{\"ID\":\"200\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(298,NULL,'2022-10-04 16:38:14',1,8,201,'{\"ID\":\"201\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(299,NULL,'2022-10-04 16:38:14',1,8,202,'{\"ID\":\"202\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(300,NULL,'2022-10-04 16:38:14',1,8,203,'{\"ID\":\"203\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(301,NULL,'2022-10-04 16:38:14',1,8,204,'{\"ID\":\"204\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(302,NULL,'2022-10-04 16:38:14',1,8,205,'{\"ID\":\"205\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(303,NULL,'2022-10-04 16:38:14',1,8,206,'{\"ID\":\"206\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(304,NULL,'2022-10-04 16:38:14',1,8,207,'{\"ID\":\"207\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(305,NULL,'2022-10-04 16:38:14',1,8,208,'{\"ID\":\"208\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(306,NULL,'2022-10-04 16:38:14',1,8,209,'{\"ID\":\"209\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(307,NULL,'2022-10-04 16:38:14',1,8,210,'{\"ID\":\"210\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(308,NULL,'2022-10-04 16:38:14',1,8,211,'{\"ID\":\"211\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(309,NULL,'2022-10-04 16:38:14',1,8,212,'{\"ID\":\"212\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(310,NULL,'2022-10-04 16:38:14',1,8,213,'{\"ID\":\"213\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(311,NULL,'2022-10-04 16:38:14',1,8,214,'{\"ID\":\"214\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(312,NULL,'2022-10-04 16:38:14',1,8,215,'{\"ID\":\"215\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(313,NULL,'2022-10-04 16:38:14',1,8,216,'{\"ID\":\"216\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(314,NULL,'2022-10-04 16:38:14',1,8,217,'{\"ID\":\"217\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(315,NULL,'2022-10-04 16:38:14',1,8,218,'{\"ID\":\"218\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(316,NULL,'2022-10-04 16:38:14',1,8,219,'{\"ID\":\"219\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(317,NULL,'2022-10-04 16:38:14',1,8,220,'{\"ID\":\"220\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(318,NULL,'2022-10-04 16:38:14',1,8,221,'{\"ID\":\"221\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(319,NULL,'2022-10-04 16:38:14',1,8,222,'{\"ID\":\"222\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(320,NULL,'2022-10-04 16:38:14',1,8,223,'{\"ID\":\"223\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(321,NULL,'2022-10-04 16:38:14',1,8,224,'{\"ID\":\"224\",\"Código\":\"\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Grupo\":0,\"Tipo\":\"0\",\"Analítica/Sintética\":\"0\",\"Nível\":\"0\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(322,NULL,'2022-10-04 16:38:14',1,7,2,'{\"ID\":\"2\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(323,NULL,'2022-10-04 16:38:14',2,91,2,'{\"ID\":\"2\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"2\",\"Categoria padrão\":\"96\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(324,1,'2022-10-04 16:38:16',1,118,1,'{\"ID\":\"1\",\"Nome\":\"Cliente fechou a empresa\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(325,1,'2022-10-04 16:38:16',1,118,2,'{\"ID\":\"2\",\"Nome\":\"Trocou de sistema\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(326,1,'2022-10-04 16:38:16',1,118,3,'{\"ID\":\"3\",\"Nome\":\"Redução de custos\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(327,1,'2022-10-04 16:38:16',2,118,1,'{\"ID\":\"1\",\"Nome\":\"A empresa encerrou suas atividades\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(328,1,'2022-10-04 16:38:16',2,118,3,'{\"ID\":\"3\",\"Nome\":\"Redução de custos\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(329,1,'2022-10-04 16:38:16',1,118,4,'{\"ID\":\"4\",\"Nome\":\"Registro a ser excluído\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(330,1,'2022-10-04 16:38:17',1,20,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(331,1,'2022-10-04 16:38:17',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. Benedito\",\"[identificacao]\":\"Av. Benedito\",\"Número\":\"S\",\"Bairro\":\"Mangabeiras\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(332,1,'2022-10-04 16:38:17',3,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. Benedito\",\"[identificacao]\":\"Av. Benedito\",\"Número\":\"S\",\"Bairro\":\"Mangabeiras\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(333,1,'2022-10-04 16:38:17',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"555\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,3,'{\"ID\":\"3\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(334,1,'2022-10-04 16:38:18',1,20,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Produtor Rural\",\"Data de nascimento\":\"01/01/1995\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(335,1,'2022-10-04 16:38:18',1,9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(336,1,'2022-10-04 16:38:18',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(337,1,'2022-10-04 16:38:18',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Dr. Luciano\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,5,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"5\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(338,1,'2022-10-04 16:38:18',1,9,6,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"6\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(339,1,'2022-10-04 16:38:18',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(037) 2594-1157\",\"[identificacao]\":\"(037) 2594-1157\",\"Observação\":\"\"}',9,6,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"6\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(340,1,'2022-10-04 16:38:18',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"555\",\"Bairro\":\"Centro\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,6,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"6\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(341,1,'2022-10-04 16:38:20',1,9,7,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"7\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(342,1,'2022-10-04 16:38:20',1,27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(343,1,'2022-10-04 16:38:20',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(344,1,'2022-10-04 16:38:20',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(345,1,'2022-10-04 16:38:21',2,27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(346,1,'2022-10-04 16:38:21',3,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(347,1,'2022-10-04 16:38:21',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(348,1,'2022-10-04 16:38:21',3,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(349,1,'2022-10-04 16:38:21',1,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Av. Chedid Jafet\",\"[identificacao]\":\"Av. Chedid Jafet\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(350,1,'2022-10-04 16:38:21',1,33,1,'{\"ID\":\"1\",\"Ano de fabricação\":\"2011\",\"Ano do modelo\":\"2012\",\"Tipo de combustível\":\"Gasolina\",\"Placa\":\"ABC0153\",\"[identificacao]\":\"ABC0153\",\"Descrição\":\"Carro da empresa\",\"Marca\":\"Volkswagen\",\"Modelo\":\"Gol G5 1.0\",\"Cor\":\"Prata\",\"Renavam\":\"00535581587335\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(351,1,'2022-10-04 16:38:21',1,33,2,'{\"ID\":\"2\",\"Ano de fabricação\":\"2015\",\"Ano do modelo\":\"2016\",\"Tipo de combustível\":\"Alcool\",\"Placa\":\"QWE8237\",\"[identificacao]\":\"QWE8237\",\"Descrição\":\"Carro de passeio\",\"Marca\":\"Fiat\",\"Modelo\":\"Palho 1.0\",\"Cor\":\"Branco\",\"Renavam\":\"8234729840373\"}',27,8,'{\"ID\":\"8\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(352,1,'2022-10-04 16:38:22',1,32,9,'{\"Comissão\":\"10,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(353,1,'2022-10-04 16:38:22',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,9,'{\"Comissão\":\"10,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(354,1,'2022-10-04 16:38:22',1,44,10,'{\"ID\":\"10\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,9,'{\"Comissão\":\"10,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(355,1,'2022-10-04 16:38:22',1,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,9,'{\"Comissão\":\"10,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(356,1,'2022-10-04 16:38:22',2,32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(357,1,'2022-10-04 16:38:22',3,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(358,1,'2022-10-04 16:38:22',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(359,1,'2022-10-04 16:38:22',3,44,10,'{\"ID\":\"10\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(360,1,'2022-10-04 16:38:22',1,44,11,'{\"ID\":\"11\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(361,1,'2022-10-04 16:38:22',3,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(362,1,'2022-10-04 16:38:22',1,76,2,'{\"ID\":\"2\",\"Mês\":\"Setembro/2019\",\"[identificacao]\":\"Setembro/2019\",\"Valor\":\"8290,30\"}',32,9,'{\"Comissão\":\"0,00\",\"ID\":\"9\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(363,1,'2022-10-04 16:38:22',1,30,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[2]}',0,0,''),(364,1,'2022-10-04 16:38:22',1,63,9,'{\"ID\":\"9\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',30,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[2]}'),(365,1,'2022-10-04 16:38:22',1,63,10,'{\"ID\":\"10\",\"Tipo\":\"Fax\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',30,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[2]}'),(366,1,'2022-10-04 16:38:22',1,63,11,'{\"ID\":\"11\",\"Tipo\":\"E-mail\",\"Contato\":\"sommus@sommus.com\",\"[identificacao]\":\"sommus@sommus.com\",\"Observação\":\"\"}',30,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[2]}'),(367,1,'2022-10-04 16:38:22',1,44,12,'{\"ID\":\"12\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"33\",\"Bairro\":\"Centro\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',30,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[2]}'),(368,1,'2022-10-04 16:38:23',1,30,11,'{\"ID\":\"11\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"25/12/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[1,2]}',0,0,''),(369,1,'2022-10-04 16:38:23',1,63,12,'{\"ID\":\"12\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-2003\",\"[identificacao]\":\"(037) 3261-2003\",\"Observação\":\"\"}',30,11,'{\"ID\":\"11\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"25/12/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[1,2]}'),(370,1,'2022-10-04 16:38:23',1,63,13,'{\"ID\":\"13\",\"Tipo\":\"Fax\",\"Contato\":\"(037) 3261-2003\",\"[identificacao]\":\"(037) 3261-2003\",\"Observação\":\"\"}',30,11,'{\"ID\":\"11\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"25/12/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[1,2]}'),(371,1,'2022-10-04 16:38:23',1,63,14,'{\"ID\":\"14\",\"Tipo\":\"E-mail\",\"Contato\":\"desenvolvimento1@sommus.com\",\"[identificacao]\":\"desenvolvimento1@sommus.com\",\"Observação\":\"\"}',30,11,'{\"ID\":\"11\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"25/12/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[1,2]}'),(372,1,'2022-10-04 16:38:23',1,44,13,'{\"ID\":\"13\",\"Logradouro\":\"Av. Modesto Gomes\",\"[identificacao]\":\"Av. Modesto Gomes\",\"Número\":\"52\",\"Bairro\":\"Centro\",\"Complemento\":\"Casa\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',30,11,'{\"ID\":\"11\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"25/12/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Não\",\"Excluido\":\"Não\",\"ListaEmpresasId\":[1,2]}'),(373,1,'2022-10-04 16:38:23',1,49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium\",\"[identificacao]\":\"Patrimonium\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[2]}',0,0,''),(374,1,'2022-10-04 16:38:23',1,63,15,'{\"ID\":\"15\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-2003\",\"[identificacao]\":\"(037) 3261-2003\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium\",\"[identificacao]\":\"Patrimonium\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[2]}'),(375,1,'2022-10-04 16:38:23',1,63,16,'{\"ID\":\"16\",\"Tipo\":\"Fax\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium\",\"[identificacao]\":\"Patrimonium\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[2]}'),(376,1,'2022-10-04 16:38:23',1,63,17,'{\"ID\":\"17\",\"Tipo\":\"E-mail\",\"Contato\":\"desenvolvimento1@sommus.com\",\"[identificacao]\":\"desenvolvimento1@sommus.com\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium\",\"[identificacao]\":\"Patrimonium\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[2]}'),(377,1,'2022-10-04 16:38:23',1,44,14,'{\"ID\":\"14\",\"Logradouro\":\"Pç Coronel Carlos Bernardes\",\"[identificacao]\":\"Pç Coronel Carlos Bernardes\",\"Número\":\"15\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium\",\"[identificacao]\":\"Patrimonium\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[2]}'),(378,1,'2022-10-04 16:38:23',2,49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}',0,0,''),(379,1,'2022-10-04 16:38:23',3,63,15,'{\"ID\":\"15\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-2003\",\"[identificacao]\":\"(037) 3261-2003\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(380,1,'2022-10-04 16:38:23',3,63,16,'{\"ID\":\"16\",\"Tipo\":\"Fax\",\"Contato\":\"(037) 3261-9150\",\"[identificacao]\":\"(037) 3261-9150\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(381,1,'2022-10-04 16:38:23',3,63,17,'{\"ID\":\"17\",\"Tipo\":\"E-mail\",\"Contato\":\"desenvolvimento1@sommus.com\",\"[identificacao]\":\"desenvolvimento1@sommus.com\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(382,1,'2022-10-04 16:38:23',1,63,18,'{\"ID\":\"18\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(037) 3261-9450\",\"[identificacao]\":\"(037) 3261-9450\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(383,1,'2022-10-04 16:38:23',1,63,19,'{\"ID\":\"19\",\"Tipo\":\"Fax\",\"Contato\":\"(037) 3261-2003\",\"[identificacao]\":\"(037) 3261-2003\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(384,1,'2022-10-04 16:38:23',1,63,20,'{\"ID\":\"20\",\"Tipo\":\"E-mail\",\"Contato\":\"atendimento@patrimoniumcontabilidade.com.br\",\"[identificacao]\":\"atendimento@patrimoniumcontabilidade.com.br\",\"Observação\":\"\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(385,1,'2022-10-04 16:38:23',3,44,14,'{\"ID\":\"14\",\"Logradouro\":\"Pç Coronel Carlos Bernardes\",\"[identificacao]\":\"Pç Coronel Carlos Bernardes\",\"Número\":\"15\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(386,1,'2022-10-04 16:38:23',1,44,15,'{\"ID\":\"15\",\"Logradouro\":\"Praça Coronel Carlos Bernardes\",\"[identificacao]\":\"Praça Coronel Carlos Bernardes\",\"Número\":\"15\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',49,12,'{\"ID\":\"12\",\"Razão social\":\"Patrimonium Contabilidade\",\"[identificacao]\":\"Patrimonium Contabilidade\",\"CNPJ\":\"47.717.436/0001-60\",\"ListaEmpresasId\":[1,2]}'),(387,1,'2022-10-04 16:38:23',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Cereais\",\"[identificacao]\":\"Cereais\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(388,1,'2022-10-04 16:38:23',1,11,2,'{\"ID\":\"2\",\"Nome\":\"Enlatados\",\"[identificacao]\":\"Enlatados\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(389,1,'2022-10-04 16:38:23',1,11,3,'{\"ID\":\"3\",\"Nome\":\"Serviços de Suporte\",\"[identificacao]\":\"Serviços de Suporte\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(390,1,'2022-10-04 16:38:23',1,2,3,'{\"ID\":\"3\",\"Nome\":\"Produtos Tributados\",\"[identificacao]\":\"Produtos Tributados\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(391,1,'2022-10-04 16:38:23',1,2,4,'{\"ID\":\"4\",\"Nome\":\"Serviços Tributados\",\"[identificacao]\":\"Serviços Tributados\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(392,1,'2022-10-04 16:38:23',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UN\",\"[identificacao]\":\"UN\",\"Nome\":\"Unidade\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(393,1,'2022-10-04 16:38:23',1,10,2,'{\"ID\":\"2\",\"Símbolo\":\"PCT\",\"[identificacao]\":\"PCT\",\"Nome\":\"Pacote\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(394,1,'2022-10-04 16:38:23',2,11,1,'{\"ID\":\"1\",\"Nome\":\"Cereais alterados\",\"[identificacao]\":\"Cereais alterados\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(395,1,'2022-10-04 16:38:23',1,11,4,'{\"ID\":\"4\",\"Nome\":\"Higiene\",\"[identificacao]\":\"Higiene\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(396,1,'2022-10-04 16:38:24',2,2,1,'{\"ID\":\"1\",\"Nome\":\"Produtos Monofasicos\",\"[identificacao]\":\"Produtos Monofasicos\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(397,1,'2022-10-04 16:38:24',1,2,5,'{\"ID\":\"5\",\"Nome\":\"Grupo excluido\",\"[identificacao]\":\"Grupo excluido\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(398,1,'2022-10-04 16:38:24',3,2,5,'{\"ID\":\"5\",\"Nome\":\"Grupo excluido\",\"[identificacao]\":\"Grupo excluido\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(399,1,'2022-10-04 16:38:24',2,10,1,'{\"ID\":\"1\",\"Símbolo\":\"CX\",\"[identificacao]\":\"CX\",\"Nome\":\"Caixa\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(400,1,'2022-10-04 16:38:24',1,10,3,'{\"ID\":\"3\",\"Símbolo\":\"Test\",\"[identificacao]\":\"Test\",\"Nome\":\"Teste\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(401,1,'2022-10-04 16:38:24',1,29,1001,'{\"ID\":\"1001\",\"Nome\":\"Outro serviço\",\"[identificacao]\":\"Outro serviço\",\"Descrição\":\"Outro serviço\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"01.07\",\"Valor\":\"0,70\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(402,1,'2022-10-04 16:38:24',1,29,1002,'{\"ID\":\"1002\",\"Nome\":\"Implantação\",\"[identificacao]\":\"Implantação\",\"Descrição\":\"Implantação em loco\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"01.07\",\"Valor\":\"500,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(403,1,'2022-10-04 16:38:25',1,29,1003,'{\"ID\":\"1003\",\"Nome\":\"Customização\",\"[identificacao]\":\"Customização\",\"Descrição\":\"Customização por hora\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"01.04\",\"Valor\":\"50,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(404,1,'2022-10-04 16:38:25',1,29,1004,'{\"ID\":\"1004\",\"Nome\":\"Consultoria\",\"[identificacao]\":\"Consultoria\",\"Descrição\":\"Consultoria\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"01.07\",\"Valor\":\"500,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(405,1,'2022-10-04 16:38:25',2,29,1004,'{\"ID\":\"1004\",\"Nome\":\"Consultoria\",\"[identificacao]\":\"Consultoria\",\"Descrição\":\"Consultoria Fiscal\",\"Grupo\":3,\"Regra tributária\":2,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"01.07\",\"Valor\":\"350,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(406,1,'2022-10-04 16:38:25',2,29,2,'{\"ID\":\"2\",\"Nome\":\"Treinamento Online\",\"[identificacao]\":\"Treinamento Online\",\"Descrição\":\"Treinamento Online\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"20,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(407,1,'2022-10-04 16:38:25',1,29,1005,'{\"ID\":\"1005\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Descrição\":\"Teste exclusão\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(408,1,'2022-10-04 16:38:26',1,53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(409,1,'2022-10-04 16:38:26',1,63,21,'{\"ID\":\"21\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(32) 3531-5523\",\"[identificacao]\":\"(32) 3531-5523\",\"Observação\":\"\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(410,1,'2022-10-04 16:38:26',1,44,16,'{\"ID\":\"16\",\"Logradouro\":\"Av. Cristiano Rocas\",\"[identificacao]\":\"Av. Cristiano Rocas\",\"Número\":\"52\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Ubá\",\"Código do município\":\"\",\"CEP\":\"36.500-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(411,1,'2022-10-04 16:38:26',1,54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(412,1,'2022-10-04 16:38:26',1,73,1,'{\"ID\":\"1\",\"URL\":\"https://www.habitusbrasil.com/wp-content/uploads/2016/03/habitus-modelo3-contrato-marcenaria.pdf\",\"[identificacao]\":\"https://www.habitusbrasil.com/wp-content/uploads/2016/03/habitus-modelo3-contrato-marcenaria.pdf\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(413,1,'2022-10-04 16:38:26',1,74,1,'{\"ID\":\"1\",\"CEP\":\"35.590-000\",\"Cidade\":\"Lagoa da Prata\",\"[identificacao]\":\"Lagoa da Prata\",\"UF\":\"MG\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(414,1,'2022-10-04 16:38:26',1,74,1,'{\"ID\":\"1\",\"CEP\":\"35.580-000\",\"Cidade\":\"Japaraíba\",\"[identificacao]\":\"Japaraíba\",\"UF\":\"MG\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(415,1,'2022-10-04 16:38:26',1,7,1,'{\"ID\":1,\"Receber/Pagar\":\"Pagar\",\"Tipo de vencimento\":\"No mês do vencimento\",\"Dia de vencimento\":\"1\",\"Categoria\":128}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(416,1,'2022-10-04 16:38:26',1,29,1004,'{\"ID\":1004,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(417,1,'2022-10-04 16:38:26',1,29,1003,'{\"ID\":1003,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(418,1,'2022-10-04 16:38:26',1,29,1002,'{\"ID\":1002,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(419,1,'2022-10-04 16:38:26',1,29,1001,'{\"ID\":1001,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(420,1,'2022-10-04 16:38:26',1,29,901,'{\"ID\":901,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(421,1,'2022-10-04 16:38:26',1,29,2,'{\"ID\":2,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(422,1,'2022-10-04 16:38:26',1,12,1,'{\"ID\":1,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(423,1,'2022-10-04 16:38:26',1,12,4,'{\"ID\":4,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(424,1,'2022-10-04 16:38:26',1,12,3,'{\"ID\":3,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(425,1,'2022-10-04 16:38:26',1,61,1,'{\"ID\":\"1\",\"Valor mínimo\":\"0,00\",\"Valor máximo\":\"2000,00\",\"Percentual\":\"25,50\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(426,1,'2022-10-04 16:38:26',1,61,2,'{\"ID\":\"2\",\"Valor mínimo\":\"2001,00\",\"Valor máximo\":\"4000,00\",\"Percentual\":\"23,50\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(427,1,'2022-10-04 16:38:26',1,61,3,'{\"ID\":\"3\",\"Valor mínimo\":\"4001,00\",\"Valor máximo\":\"6000,00\",\"Percentual\":\"21,50\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(428,1,'2022-10-04 16:38:26',1,61,4,'{\"ID\":\"4\",\"Valor mínimo\":\"6001,00\",\"Valor máximo\":\"10000,00\",\"Percentual\":\"18,50\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(429,1,'2022-10-04 16:38:26',1,61,5,'{\"ID\":\"5\",\"Valor mínimo\":\"10001,00\",\"Valor máximo\":\"50000,00\",\"Percentual\":\"15,00\"}',54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(430,1,'2022-10-04 16:38:26',1,53,14,'{\"ID\":\"14\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(431,1,'2022-10-04 16:38:26',1,63,22,'{\"ID\":\"22\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(32) 3531-5523\",\"[identificacao]\":\"(32) 3531-5523\",\"Observação\":\"\"}',53,14,'{\"ID\":\"14\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(432,1,'2022-10-04 16:38:26',1,44,17,'{\"ID\":\"17\",\"Logradouro\":\"Rua da Flores\",\"[identificacao]\":\"Rua da Flores\",\"Número\":\"352\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Capelinha\",\"Código do município\":\"\",\"CEP\":\"39.680-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',53,14,'{\"ID\":\"14\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(433,1,'2022-10-04 16:38:26',1,54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',53,14,'{\"ID\":\"14\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(434,1,'2022-10-04 16:38:26',1,29,1004,'{\"ID\":1004,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(435,1,'2022-10-04 16:38:26',1,29,1003,'{\"ID\":1003,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(436,1,'2022-10-04 16:38:26',1,29,1002,'{\"ID\":1002,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(437,1,'2022-10-04 16:38:26',1,29,1001,'{\"ID\":1001,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(438,1,'2022-10-04 16:38:26',1,29,901,'{\"ID\":901,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(439,1,'2022-10-04 16:38:26',1,29,2,'{\"ID\":2,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"30,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(440,1,'2022-10-04 16:38:26',1,12,1,'{\"ID\":1,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(441,1,'2022-10-04 16:38:26',1,12,4,'{\"ID\":4,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(442,1,'2022-10-04 16:38:26',1,12,3,'{\"ID\":3,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(443,1,'2022-10-04 16:38:26',1,61,6,'{\"ID\":\"6\",\"Valor mínimo\":\"0,00\",\"Valor máximo\":\"2000,00\",\"Percentual\":\"25,50\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(444,1,'2022-10-04 16:38:26',1,61,7,'{\"ID\":\"7\",\"Valor mínimo\":\"2001,00\",\"Valor máximo\":\"4000,00\",\"Percentual\":\"23,50\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(445,1,'2022-10-04 16:38:26',1,61,8,'{\"ID\":\"8\",\"Valor mínimo\":\"4001,00\",\"Valor máximo\":\"6000,00\",\"Percentual\":\"21,50\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(446,1,'2022-10-04 16:38:26',1,61,9,'{\"ID\":\"9\",\"Valor mínimo\":\"6001,00\",\"Valor máximo\":\"10000,00\",\"Percentual\":\"18,50\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(447,1,'2022-10-04 16:38:26',1,61,10,'{\"ID\":\"10\",\"Valor mínimo\":\"10001,00\",\"Valor máximo\":\"50000,00\",\"Percentual\":\"15,00\"}',54,2,'{\"ID\":\"2\",\"Descricao\":\"Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único\",\"Parceiro\":\"14\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o faturamento\",\"Remuneração\":\"Percentual de comissão único\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(448,1,'2022-10-04 16:38:26',1,53,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/10/1992\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(449,1,'2022-10-04 16:38:26',1,63,23,'{\"ID\":\"23\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 99197-3003\",\"[identificacao]\":\"(37) 99197-3003\",\"Observação\":\"\"}',53,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/10/1992\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(450,1,'2022-10-04 16:38:26',1,44,18,'{\"ID\":\"18\",\"Logradouro\":\"Av. Joaquim Gomes Pereira\",\"[identificacao]\":\"Av. Joaquim Gomes Pereira\",\"Número\":\"774\",\"Bairro\":\"Gomes\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',53,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/10/1992\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(451,1,'2022-10-04 16:38:26',1,54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',53,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/10/1992\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(452,1,'2022-10-04 16:38:26',1,29,1004,'{\"ID\":1004,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(453,1,'2022-10-04 16:38:26',1,29,1003,'{\"ID\":1003,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(454,1,'2022-10-04 16:38:26',1,29,1002,'{\"ID\":1002,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(455,1,'2022-10-04 16:38:26',1,29,1001,'{\"ID\":1001,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(456,1,'2022-10-04 16:38:26',1,29,901,'{\"ID\":901,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(457,1,'2022-10-04 16:38:26',1,29,2,'{\"ID\":2,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(458,1,'2022-10-04 16:38:26',1,12,1,'{\"ID\":1,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(459,1,'2022-10-04 16:38:26',1,12,4,'{\"ID\":4,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(460,1,'2022-10-04 16:38:26',1,12,3,'{\"ID\":3,\"Base de cálculo\":\"Salário mínimo\",\"Percentual\":\"20,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(461,1,'2022-10-04 16:38:26',1,61,11,'{\"ID\":\"11\",\"Valor mínimo\":\"0,00\",\"Valor máximo\":\"2000,00\",\"Percentual\":\"25,50\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(462,1,'2022-10-04 16:38:26',1,61,12,'{\"ID\":\"12\",\"Valor mínimo\":\"2001,00\",\"Valor máximo\":\"4000,00\",\"Percentual\":\"23,50\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(463,1,'2022-10-04 16:38:26',1,61,13,'{\"ID\":\"13\",\"Valor mínimo\":\"4001,00\",\"Valor máximo\":\"6000,00\",\"Percentual\":\"21,50\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(464,1,'2022-10-04 16:38:26',1,61,14,'{\"ID\":\"14\",\"Valor mínimo\":\"6001,00\",\"Valor máximo\":\"10000,00\",\"Percentual\":\"18,50\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(465,1,'2022-10-04 16:38:26',1,61,15,'{\"ID\":\"15\",\"Valor mínimo\":\"10001,00\",\"Valor máximo\":\"50000,00\",\"Percentual\":\"15,00\"}',54,3,'{\"ID\":\"3\",\"Descricao\":\"W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"15\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende o cliente e o parceiro\",\"Faturamento\":\"A empresa fatura para o cliente\",\"Financeiro\":\"A empresa paga ao parceiro após o recebimento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(466,1,'2022-10-04 16:38:26',3,63,21,'{\"ID\":\"21\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(32) 3531-5523\",\"[identificacao]\":\"(32) 3531-5523\",\"Observação\":\"\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(467,1,'2022-10-04 16:38:26',1,63,24,'{\"ID\":\"24\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(32) 3531-5523\",\"[identificacao]\":\"(32) 3531-5523\",\"Observação\":\"\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(468,1,'2022-10-04 16:38:26',3,44,16,'{\"ID\":\"16\",\"Logradouro\":\"Av. Cristiano Rocas\",\"[identificacao]\":\"Av. Cristiano Rocas\",\"Número\":\"52\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Ubá\",\"Código do município\":\"\",\"CEP\":\"36.500-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(469,1,'2022-10-04 16:38:26',1,44,19,'{\"ID\":\"19\",\"Logradouro\":\"Av. Cristiano Rocas\",\"[identificacao]\":\"Av. Cristiano Rocas\",\"Número\":\"52\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Ubá\",\"Código do município\":\"\",\"CEP\":\"36.500-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(470,1,'2022-10-04 16:38:26',3,54,1,'{\"ID\":\"1\",\"Descricao\":\"Aliber - Atendimento próprio - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços\",\"Parceiro\":\"13\",\"Vigência início\":\"01/01/2017\",\"Vigência término\":\"01/01/2022\",\"Atendimento\":\"A empresa atende somente o parceiro\",\"Faturamento\":\"O parceiro fatura para o cliente\",\"Financeiro\":\"A empresa recebe do parceiro após o faturamento\",\"Remuneração\":\"Percentual por produto ou serviço\",\"Documento fiscal\":\"Nota fiscal\",\"Documento receber\":\"Boleto bancário\",\"Percentual\":\"0,00\",\"Desconto\":\"5,00\",\"Observação\":\"Bom parceiro\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',53,13,'{\"ID\":\"13\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(471,1,'2022-10-04 16:38:28',2,12,3,'{\"ID\":\"3\",\"Nome\":\"SommusVendas (Mobile)\",\"[identificacao]\":\"SommusVendas (Mobile)\",\"Descrição\":\"SommusVendas (Mobile)\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(472,1,'2022-10-04 16:38:28',2,12,4,'{\"ID\":\"4\",\"Nome\":\"SommusVendas (Desktop)\",\"[identificacao]\":\"SommusVendas (Desktop)\",\"Descrição\":\"SommusVendas (Desktop)\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(473,1,'2022-10-04 16:38:29',1,12,1006,'{\"ID\":\"1006\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":0,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(474,1,'2022-10-04 16:38:30',2,12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(475,1,'2022-10-04 16:38:30',1,117,1,'{\"ID\":\"1\",\"Tipo\":\"Quantidade de módulos\",\"[identificacao]\":\"Quantidade de módulos\",\"Quantidade\":\"5\",\"Percentual\":\"10,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Outras\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(476,1,'2022-10-04 16:38:30',1,117,2,'{\"ID\":\"2\",\"Tipo\":\"Quantidade de módulos\",\"[identificacao]\":\"Quantidade de módulos\",\"Quantidade\":\"10\",\"Percentual\":\"20,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Outras\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(477,1,'2022-10-04 16:38:30',1,117,3,'{\"ID\":\"3\",\"Tipo\":\"Quantidade de módulos\",\"[identificacao]\":\"Quantidade de módulos\",\"Quantidade\":\"35\",\"Percentual\":\"40,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Outras\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(478,1,'2022-10-04 16:38:30',1,117,4,'{\"ID\":\"4\",\"Tipo\":\"Quantidade de usuários\",\"[identificacao]\":\"Quantidade de usuários\",\"Quantidade\":\"15\",\"Percentual\":\"30,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Outras\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(479,1,'2022-10-04 16:38:30',1,117,5,'{\"ID\":\"5\",\"Tipo\":\"Quantidade de usuários\",\"[identificacao]\":\"Quantidade de usuários\",\"Quantidade\":\"40\",\"Percentual\":\"50,00\",\"EmpresaEspecificaId\":1}',12,1,'{\"ID\":\"1\",\"Nome\":\"SommusGestor\",\"[identificacao]\":\"SommusGestor\",\"Descrição\":\"SommusGestor\",\"Tipo\":\"Outras\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":0,\"Grupo regra tributária\":0,\"Ativo\":\"Sim\"}'),(480,1,'2022-10-04 16:38:30',1,117,6,'{\"ID\":\"6\",\"Tipo\":\"Quantidade de usuários\",\"[identificacao]\":\"Quantidade de usuários\",\"Quantidade\":\"15\",\"Percentual\":\"30,00\",\"EmpresaEspecificaId\":1}',29,2,'{\"ID\":\"2\",\"Nome\":\"Treinamento Online\",\"[identificacao]\":\"Treinamento Online\",\"Descrição\":\"Treinamento Online\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"20,00\",\"Ativo\":\"Sim\"}'),(481,1,'2022-10-04 16:38:31',1,117,7,'{\"ID\":\"7\",\"Tipo\":\"Quantidade de usuários\",\"[identificacao]\":\"Quantidade de usuários\",\"Quantidade\":\"40\",\"Percentual\":\"50,00\",\"EmpresaEspecificaId\":1}',29,2,'{\"ID\":\"2\",\"Nome\":\"Treinamento Online\",\"[identificacao]\":\"Treinamento Online\",\"Descrição\":\"Treinamento Online\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"20,00\",\"Ativo\":\"Sim\"}'),(482,1,'2022-10-04 16:38:31',2,29,2,'{\"ID\":\"2\",\"Nome\":\"Treinamento Online\",\"[identificacao]\":\"Treinamento Online\",\"Descrição\":\"Treinamento Online\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"20,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(483,1,'2022-10-04 16:38:31',1,42,1,'{\"ID\":\"1\",\"Nome\":\"Departamento Desenvolvimento - Orçamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(484,1,'2022-10-04 16:38:31',1,42,2,'{\"ID\":\"2\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(485,1,'2022-10-04 16:38:31',1,42,3,'{\"ID\":\"3\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(486,1,'2022-10-04 16:38:31',1,42,4,'{\"ID\":\"4\",\"Nome\":\"Departamento Administrativo - Faturamento\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(487,1,'2022-10-04 16:38:31',1,42,5,'{\"ID\":\"5\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(488,1,'2022-10-04 16:38:31',1,42,6,'{\"ID\":\"6\",\"Nome\":\"Departamento Desenvolvimento - Orçamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(489,1,'2022-10-04 16:38:31',1,42,7,'{\"ID\":\"7\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(490,1,'2022-10-04 16:38:31',1,42,8,'{\"ID\":\"8\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(491,1,'2022-10-04 16:38:31',1,42,9,'{\"ID\":\"9\",\"Nome\":\"Departamento Administrativo - Faturamento\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(492,1,'2022-10-04 16:38:31',1,42,10,'{\"ID\":\"10\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(493,1,'2022-10-04 16:38:31',2,42,1,'{\"ID\":\"1\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1]}',0,0,''),(494,1,'2022-10-04 16:38:31',3,42,5,'{\"ID\":\"5\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(495,1,'2022-10-04 16:38:31',1,24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(496,1,'2022-10-04 16:38:31',1,63,25,'{\"ID\":\"25\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(497,1,'2022-10-04 16:38:31',1,44,20,'{\"ID\":\"20\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(498,1,'2022-10-04 16:38:32',2,24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(499,1,'2022-10-04 16:38:32',3,63,25,'{\"ID\":\"25\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(500,1,'2022-10-04 16:38:32',1,63,26,'{\"ID\":\"26\",\"Tipo\":\"E-mail\",\"Contato\":\"sommus@sommus.com\",\"[identificacao]\":\"sommus@sommus.com\",\"Observação\":\"\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(501,1,'2022-10-04 16:38:32',3,44,20,'{\"ID\":\"20\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(502,1,'2022-10-04 16:38:32',1,44,21,'{\"ID\":\"21\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,16,'{\"ID\":\"16\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(503,1,'2022-10-04 16:38:32',1,24,17,'{\"ID\":\"17\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(504,1,'2022-10-04 16:38:33',1,131,2,'{\"ID\":\"2\",\"Layout\":\"SCI\",\"Dias para envio automático\":\"5\",\"Bloqueia lançamentos\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(505,1,'2022-10-04 16:38:33',2,131,2,'{\"ID\":\"2\",\"Layout\":\"Domínio\",\"Dias para envio automático\":\"1\",\"Bloqueia lançamentos\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(506,1,'2022-10-04 16:38:33',1,130,1,'{\"ID\":\"1\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Centro de resultado\":{\"ID\":\"1\",\"Nome\":\"Departamento Administrativo - Orçamento\"},\"Código de integração\":\"813548\",\"EmpresaEspecificaId\":2}',0,0,''),(507,1,'2022-10-04 16:38:33',1,130,2,'{\"ID\":\"2\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Centro de resultado\":{\"ID\":\"2\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\"},\"Código de integração\":\"438181\",\"EmpresaEspecificaId\":2}',0,0,''),(508,1,'2022-10-04 16:38:33',1,130,3,'{\"ID\":\"3\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Centro de resultado\":{\"ID\":\"3\",\"Nome\":\"Departamento Administrativo - Orçamento\"},\"Código de integração\":\"\",\"EmpresaEspecificaId\":2}',0,0,''),(509,1,'2022-10-04 16:38:33',1,130,4,'{\"ID\":\"4\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Centro de resultado\":{\"ID\":\"4\",\"Nome\":\"Departamento Administrativo - Faturamento\"},\"Código de integração\":\"1658440\",\"EmpresaEspecificaId\":2}',0,0,''),(510,1,'2022-10-04 16:38:34',1,8,225,'{\"ID\":\"225\",\"Código\":\"6.1.01.001\",\"Nome\":\"Contas a receber\",\"[identificacao]\":\"Contas a receber\",\"Grupo\":38,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(511,1,'2022-10-04 16:38:34',1,8,226,'{\"ID\":\"226\",\"Código\":\"4.1.02.006\",\"Nome\":\"Aquisição de Ativo Imobilizado\",\"[identificacao]\":\"Aquisição de Ativo Imobilizado\",\"Grupo\":33,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(512,1,'2022-10-04 16:38:34',2,8,172,'{\"ID\":\"172\",\"Código\":\"3.1.05.004\",\"Nome\":\"Jornais\",\"[identificacao]\":\"Jornais\",\"Grupo\":27,\"Tipo\":\"Débito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(513,1,'2022-10-04 16:38:34',2,8,226,'{\"ID\":\"226\",\"Código\":\"4.1.02.006\",\"Nome\":\"Recebimento cartão\",\"[identificacao]\":\"Recebimento cartão\",\"Grupo\":23,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(514,1,'2022-10-04 16:38:34',1,42,1,'{\"ID\":1,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":2}',8,226,'{\"ID\":\"226\",\"Código\":\"4.1.02.006\",\"Nome\":\"Recebimento cartão\",\"[identificacao]\":\"Recebimento cartão\",\"Grupo\":23,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\"}'),(515,1,'2022-10-04 16:38:34',1,8,227,'{\"ID\":\"227\",\"Código\":\"6.1.02.001\",\"Nome\":\"Categoria excluída\",\"[identificacao]\":\"Categoria excluída\",\"Grupo\":39,\"Tipo\":\"Crédito\",\"Analítica/Sintética\":\"Analítica\",\"Nível\":\"4\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(516,1,'2022-10-04 16:38:34',1,7,3,'{\"ID\":\"3\",\"Nome\":\"Sicoob\",\"[identificacao]\":\"Sicoob\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"756\"},\"Agência\":\"4113\",\"Conta\":\"2220-0\",\"Operação\":\"001\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(517,1,'2022-10-04 16:38:34',1,69,3,'{\"ID\":\"3\",\"Código do cedente\":\"4235\",\"CPF/CNPJ do cedente\":\"\",\"Nome/Razão Social do cedente\":\"\",\"Carteira\":\"1\",\"Variação da carteira\":\"01\",\"Local de pagamento\":\"NÃO RECEBER BOLETO - APENAS DE TESTES\",\"Mensagem\":\"TESTE DE BOLETO SOMMUS GESTOR - BOLETO SEM VALOR\",\"Nosso número\":\"700\",\"Juros %\":\"0,20\",\"Dias de carência dos juros\":\"30\",\"Multa %\":\"2,00\",\"Dias de carência da multa\":\"0\",\"Aceite\":\"Não\",\"Layout remessa\":\"Cnab240\",\"Tipo de carteira\":\"Carteira cobrança simples\",\"Forma cadastramento\":\"Com registro\",\"Impressão\":\"Empresa emite\",\"Distribuição\":\"Empresa distribui\",\"Espécie\":\"Duplicata Mercantil\"}',7,3,'{\"ID\":\"3\",\"Nome\":\"Sicoob\",\"[identificacao]\":\"Sicoob\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"756\"},\"Agência\":\"4113\",\"Conta\":\"2220-0\",\"Operação\":\"001\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}'),(518,1,'2022-10-04 16:38:34',1,7,4,'{\"ID\":\"4\",\"Nome\":\"Caixa\",\"[identificacao]\":\"Caixa\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(519,1,'2022-10-04 16:38:34',1,7,5,'{\"ID\":\"5\",\"Nome\":\"Conta (excluida)\",\"[identificacao]\":\"Conta (excluida)\",\"Tipo de conta\":\"Cofre\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"047\"},\"Agência\":\"1382\",\"Conta\":\"1234-5\",\"Operação\":\"001\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(520,1,'2022-10-04 16:38:35',1,7,6,'{\"ID\":\"6\",\"Nome\":\"Conta Sommus\",\"[identificacao]\":\"Conta Sommus\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}',0,0,''),(521,1,'2022-10-04 16:38:35',1,69,6,'{\"ID\":\"6\",\"Código do cedente\":\"\",\"CPF/CNPJ do cedente\":\"\",\"Nome/Razão Social do cedente\":\"\",\"Carteira\":\"\",\"Variação da carteira\":\"\",\"Local de pagamento\":\"PAGÁVEL EM QUALQUER BANCO ATÉ A DATA DE VENCIMENTO.\",\"Mensagem\":\"\",\"Nosso número\":\"\",\"Juros %\":\"0,00\",\"Dias de carência dos juros\":\"0\",\"Multa %\":\"0,00\",\"Dias de carência da multa\":\"0\",\"Aceite\":\"Não\",\"Layout remessa\":\"Cnab240\",\"Tipo de carteira\":\"Carteira cobrança simples\",\"Forma cadastramento\":\"Com registro\",\"Impressão\":\"Empresa emite\",\"Distribuição\":\"Empresa distribui\",\"Espécie\":\"Duplicata Mercantil\"}',7,6,'{\"ID\":\"6\",\"Nome\":\"Conta Sommus\",\"[identificacao]\":\"Conta Sommus\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":1}'),(522,1,'2022-10-04 16:38:35',2,7,5,'{\"ID\":\"5\",\"Nome\":\"Cofre\",\"[identificacao]\":\"Cofre\",\"Tipo de conta\":\"Cofre\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(523,1,'2022-10-04 16:38:35',1,7,7,'{\"ID\":\"7\",\"Nome\":\"Conta exclusão\",\"[identificacao]\":\"Conta exclusão\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(524,1,'2022-10-04 16:38:35',1,69,7,'{\"ID\":\"7\",\"Código do cedente\":\"\",\"CPF/CNPJ do cedente\":\"\",\"Nome/Razão Social do cedente\":\"\",\"Carteira\":\"\",\"Variação da carteira\":\"\",\"Local de pagamento\":\"PAGÁVEL EM QUALQUER BANCO ATÉ A DATA DE VENCIMENTO.\",\"Mensagem\":\"\",\"Nosso número\":\"\",\"Juros %\":\"0,00\",\"Dias de carência dos juros\":\"0\",\"Multa %\":\"0,00\",\"Dias de carência da multa\":\"0\",\"Aceite\":\"Não\",\"Layout remessa\":\"Cnab240\",\"Tipo de carteira\":\"Carteira cobrança simples\",\"Forma cadastramento\":\"Com registro\",\"Impressão\":\"Empresa emite\",\"Distribuição\":\"Empresa distribui\",\"Espécie\":\"Duplicata Mercantil\"}',7,7,'{\"ID\":\"7\",\"Nome\":\"Conta exclusão\",\"[identificacao]\":\"Conta exclusão\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022 16:38:34\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}'),(525,1,'2022-10-04 16:38:35',3,7,7,'{\"ID\":\"7\",\"Nome\":\"Conta exclusão\",\"[identificacao]\":\"Conta exclusão\",\"Tipo de conta\":\"Conta Corrente\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"03/10/2022\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(526,1,'2022-10-04 16:38:35',1,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias\",\"[identificacao]\":\"Compra de Mercadorias\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(527,1,'2022-10-04 16:38:35',1,1,7,'{\"ID\":\"7\",\"Nome\":\"Prestação de Serviço\",\"[identificacao]\":\"Prestação de Serviço\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(528,1,'2022-10-04 16:38:35',1,1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(529,1,'2022-10-04 16:38:35',1,8,93,'{\"ID\":93,\"Tipo\":\"Venda de produtos a vista\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(530,1,'2022-10-04 16:38:36',1,3,32,'{\"ID\":\"32\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(531,1,'2022-10-04 16:38:36',1,3,33,'{\"ID\":\"33\",\"Nome\":\"Prestação de Serviço Tributada\",\"[identificacao]\":\"Prestação de Serviço Tributada\",\"Operação\":7,\"UF\":\"\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Tributável dentro do município\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"3,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"01\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\"}'),(532,1,'2022-10-04 16:38:37',1,8,119,'{\"ID\":119,\"Tipo\":\"Compra de produtos a vista\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}'),(533,1,'2022-10-04 16:38:37',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(534,1,'2022-10-04 16:38:37',1,1,9,'{\"ID\":\"9\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(535,1,'2022-10-04 16:38:38',2,3,32,'{\"ID\":\"32\",\"Nome\":\"Compra de Mercadorias Tributadas\",\"[identificacao]\":\"Compra de Mercadorias Tributadas\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(536,1,'2022-10-04 16:38:39',1,3,34,'{\"ID\":\"34\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(537,1,'2022-10-04 16:38:39',3,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS ST\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[1,2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Produtos Monofasicos\",\"[identificacao]\":\"Produtos Monofasicos\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(538,1,'2022-10-04 16:38:39',1,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro 1\",\"[identificacao]\":\"Dinheiro 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(539,1,'2022-10-04 16:38:39',2,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro\",\"[identificacao]\":\"Dinheiro\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(540,1,'2022-10-04 16:38:39',1,22,8,'{\"ID\":\"8\",\"Nome\":\"Outros\",\"[identificacao]\":\"Outros\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Outros\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(541,1,'2022-10-04 16:38:39',1,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque 1\",\"[identificacao]\":\"Cheque 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(542,1,'2022-10-04 16:38:39',2,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque\",\"[identificacao]\":\"Cheque\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(543,1,'2022-10-04 16:38:39',1,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão 1\",\"[identificacao]\":\"Cartão 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(544,1,'2022-10-04 16:38:39',2,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão\",\"[identificacao]\":\"Cartão\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(545,1,'2022-10-04 16:38:39',1,52,22,'{\"ID\":\"22\",\"Nome\":\"Salário Inicial\",\"[identificacao]\":\"Salário Inicial\",\"Categoria\":191,\"Tipo\":\"Vencimento\",\"Percentual do salário\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(546,1,'2022-10-04 16:38:39',1,52,23,'{\"ID\":\"23\",\"Nome\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Categoria\":191,\"Tipo\":\"Desconto\",\"Percentual do salário\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(547,1,'2022-10-04 16:38:39',2,52,23,'{\"ID\":\"23\",\"Nome\":\"Desconto INSS (update)\",\"[identificacao]\":\"Desconto INSS (update)\",\"Categoria\":191,\"Tipo\":\"Desconto\",\"Percentual do salário\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(548,1,'2022-10-04 16:38:39',1,52,24,'{\"ID\":\"24\",\"Nome\":\"Cadastro Teste de Busca\",\"[identificacao]\":\"Cadastro Teste de Busca\",\"Categoria\":137,\"Tipo\":\"Vencimento\",\"Percentual do salário\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(549,1,'2022-10-04 16:38:39',1,52,25,'{\"ID\":\"25\",\"Nome\":\"Contribuição AMAVI\",\"[identificacao]\":\"Contribuição AMAVI\",\"Categoria\":137,\"Tipo\":\"Vencimento\",\"Percentual do salário\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(550,1,'2022-10-04 16:38:40',1,132,1,'{\"ID\":\"1\",\"Nome\":\"Programador\",\"[identificacao]\":\"Programador\",\"Salário\":\"1000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1,2]}',0,0,''),(551,1,'2022-10-04 16:38:40',1,132,2,'{\"ID\":\"2\",\"Nome\":\"Desenvolvedor\",\"[identificacao]\":\"Desenvolvedor\",\"Salário\":\"2000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[2]}',0,0,''),(552,1,'2022-10-04 16:38:40',1,132,3,'{\"ID\":\"3\",\"Nome\":\"Analista de Suporte\",\"[identificacao]\":\"Analista de Suporte\",\"Salário\":\"3000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[2]}',0,0,''),(553,1,'2022-10-04 16:38:40',1,132,4,'{\"ID\":\"4\",\"Nome\":\"Gerente\",\"[identificacao]\":\"Gerente\",\"Salário\":\"4000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[2]}',0,0,''),(554,1,'2022-10-04 16:38:40',1,132,5,'{\"ID\":\"5\",\"Nome\":\"Estagiário\",\"[identificacao]\":\"Estagiário\",\"Salário\":\"1000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[2]}',0,0,''),(555,1,'2022-10-04 16:38:40',1,132,6,'{\"ID\":\"6\",\"Nome\":\"Secretária\",\"[identificacao]\":\"Secretária\",\"Salário\":\"2000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1]}',0,0,''),(556,1,'2022-10-04 16:38:40',2,132,6,'{\"ID\":\"6\",\"Nome\":\"Secretária\",\"[identificacao]\":\"Secretária\",\"Salário\":\"3000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[2]}',0,0,''),(557,1,'2022-10-04 16:38:40',1,132,7,'{\"ID\":\"7\",\"Nome\":\"Pintor\",\"[identificacao]\":\"Pintor\",\"Salário\":\"2500,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1]}',0,0,''),(558,1,'2022-10-04 16:38:40',1,132,8,'{\"ID\":\"8\",\"Nome\":\"Arquiteto\",\"[identificacao]\":\"Arquiteto\",\"Salário\":\"6500,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1]}',0,0,''),(559,1,'2022-10-04 16:38:40',1,132,9,'{\"ID\":\"9\",\"Nome\":\"Analista\",\"[identificacao]\":\"Analista\",\"Salário\":\"3000,00\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[1]}',0,0,''),(560,1,'2022-10-04 16:38:41',1,51,18,'{\"Nome\":\"Joseph A. Climber\",\"[identificacao]\":\"Joseph A. Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(561,1,'2022-10-04 16:38:41',1,63,27,'{\"ID\":\"27\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',51,18,'{\"Nome\":\"Joseph A. Climber\",\"[identificacao]\":\"Joseph A. Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(562,1,'2022-10-04 16:38:41',1,44,22,'{\"ID\":\"22\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,18,'{\"Nome\":\"Joseph A. Climber\",\"[identificacao]\":\"Joseph A. Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(563,1,'2022-10-04 16:38:41',1,66,1,'{\"ID\":\"1\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"1200,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph A. Climber\",\"[identificacao]\":\"Joseph A. Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(564,1,'2022-10-04 16:38:41',1,67,1,'{\"ID\":\"1\",\"Centro de resultado\":\"1\",\"Cargo\":1,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"900,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph A. Climber\",\"[identificacao]\":\"Joseph A. Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(565,1,'2022-10-04 16:38:41',1,51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(566,1,'2022-10-04 16:38:41',1,63,28,'{\"ID\":\"28\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(567,1,'2022-10-04 16:38:41',1,44,23,'{\"ID\":\"23\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(568,1,'2022-10-04 16:38:41',1,66,2,'{\"ID\":\"2\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(569,1,'2022-10-04 16:38:41',1,66,3,'{\"ID\":\"3\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(570,1,'2022-10-04 16:38:41',1,66,4,'{\"ID\":\"4\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"3\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(571,1,'2022-10-04 16:38:41',1,67,2,'{\"ID\":\"2\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,19,'{\"Nome\":\"Trabalhador 01\",\"[identificacao]\":\"Trabalhador 01\",\"ID\":\"19\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(572,1,'2022-10-04 16:38:41',1,51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(573,1,'2022-10-04 16:38:41',1,63,29,'{\"ID\":\"29\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(574,1,'2022-10-04 16:38:41',1,44,24,'{\"ID\":\"24\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(575,1,'2022-10-04 16:38:41',1,66,5,'{\"ID\":\"5\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(576,1,'2022-10-04 16:38:41',1,66,6,'{\"ID\":\"6\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(577,1,'2022-10-04 16:38:41',1,66,7,'{\"ID\":\"7\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"6\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(578,1,'2022-10-04 16:38:41',1,67,3,'{\"ID\":\"3\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,20,'{\"Nome\":\"Trabalhador 02\",\"[identificacao]\":\"Trabalhador 02\",\"ID\":\"20\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(579,1,'2022-10-04 16:38:41',1,51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(580,1,'2022-10-04 16:38:41',1,63,30,'{\"ID\":\"30\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(581,1,'2022-10-04 16:38:41',1,44,25,'{\"ID\":\"25\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(582,1,'2022-10-04 16:38:41',1,66,8,'{\"ID\":\"8\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(583,1,'2022-10-04 16:38:41',1,66,9,'{\"ID\":\"9\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(584,1,'2022-10-04 16:38:41',1,66,10,'{\"ID\":\"10\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"9\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(585,1,'2022-10-04 16:38:41',1,67,4,'{\"ID\":\"4\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,21,'{\"Nome\":\"Trabalhador 03\",\"[identificacao]\":\"Trabalhador 03\",\"ID\":\"21\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(586,1,'2022-10-04 16:38:41',1,51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(587,1,'2022-10-04 16:38:41',1,63,31,'{\"ID\":\"31\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(588,1,'2022-10-04 16:38:41',1,44,26,'{\"ID\":\"26\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(589,1,'2022-10-04 16:38:41',1,66,11,'{\"ID\":\"11\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(590,1,'2022-10-04 16:38:41',1,66,12,'{\"ID\":\"12\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(591,1,'2022-10-04 16:38:41',1,66,13,'{\"ID\":\"13\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"12\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(592,1,'2022-10-04 16:38:41',1,67,5,'{\"ID\":\"5\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,22,'{\"Nome\":\"Trabalhador 04\",\"[identificacao]\":\"Trabalhador 04\",\"ID\":\"22\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(593,1,'2022-10-04 16:38:41',1,51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(594,1,'2022-10-04 16:38:41',1,63,32,'{\"ID\":\"32\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(595,1,'2022-10-04 16:38:41',1,44,27,'{\"ID\":\"27\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(596,1,'2022-10-04 16:38:41',1,66,14,'{\"ID\":\"14\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(597,1,'2022-10-04 16:38:41',1,66,15,'{\"ID\":\"15\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(598,1,'2022-10-04 16:38:41',1,66,16,'{\"ID\":\"16\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"15\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(599,1,'2022-10-04 16:38:41',1,67,6,'{\"ID\":\"6\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,23,'{\"Nome\":\"Trabalhador 05\",\"[identificacao]\":\"Trabalhador 05\",\"ID\":\"23\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(600,1,'2022-10-04 16:38:42',1,51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(601,1,'2022-10-04 16:38:42',1,63,33,'{\"ID\":\"33\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(602,1,'2022-10-04 16:38:42',1,44,28,'{\"ID\":\"28\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(603,1,'2022-10-04 16:38:42',1,66,17,'{\"ID\":\"17\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(604,1,'2022-10-04 16:38:42',1,66,18,'{\"ID\":\"18\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(605,1,'2022-10-04 16:38:42',1,66,19,'{\"ID\":\"19\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"18\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(606,1,'2022-10-04 16:38:42',1,67,7,'{\"ID\":\"7\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,24,'{\"Nome\":\"Trabalhador 06\",\"[identificacao]\":\"Trabalhador 06\",\"ID\":\"24\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(607,1,'2022-10-04 16:38:42',1,51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(608,1,'2022-10-04 16:38:42',1,63,34,'{\"ID\":\"34\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(609,1,'2022-10-04 16:38:42',1,44,29,'{\"ID\":\"29\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(610,1,'2022-10-04 16:38:42',1,66,20,'{\"ID\":\"20\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(611,1,'2022-10-04 16:38:42',1,66,21,'{\"ID\":\"21\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(612,1,'2022-10-04 16:38:42',1,66,22,'{\"ID\":\"22\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"21\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(613,1,'2022-10-04 16:38:42',1,67,8,'{\"ID\":\"8\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,25,'{\"Nome\":\"Trabalhador 07\",\"[identificacao]\":\"Trabalhador 07\",\"ID\":\"25\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(614,1,'2022-10-04 16:38:42',1,51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(615,1,'2022-10-04 16:38:42',1,63,35,'{\"ID\":\"35\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(616,1,'2022-10-04 16:38:42',1,44,30,'{\"ID\":\"30\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(617,1,'2022-10-04 16:38:42',1,66,23,'{\"ID\":\"23\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(618,1,'2022-10-04 16:38:42',1,66,24,'{\"ID\":\"24\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(619,1,'2022-10-04 16:38:42',1,66,25,'{\"ID\":\"25\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"24\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(620,1,'2022-10-04 16:38:42',1,67,9,'{\"ID\":\"9\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,26,'{\"Nome\":\"Trabalhador 08\",\"[identificacao]\":\"Trabalhador 08\",\"ID\":\"26\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(621,1,'2022-10-04 16:38:42',1,51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(622,1,'2022-10-04 16:38:42',1,63,36,'{\"ID\":\"36\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(623,1,'2022-10-04 16:38:42',1,44,31,'{\"ID\":\"31\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(624,1,'2022-10-04 16:38:42',1,66,26,'{\"ID\":\"26\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(625,1,'2022-10-04 16:38:42',1,66,27,'{\"ID\":\"27\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(626,1,'2022-10-04 16:38:42',1,66,28,'{\"ID\":\"28\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"27\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(627,1,'2022-10-04 16:38:42',1,67,10,'{\"ID\":\"10\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,27,'{\"Nome\":\"Trabalhador 09\",\"[identificacao]\":\"Trabalhador 09\",\"ID\":\"27\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(628,1,'2022-10-04 16:38:42',1,51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(629,1,'2022-10-04 16:38:42',1,63,37,'{\"ID\":\"37\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(630,1,'2022-10-04 16:38:42',1,44,32,'{\"ID\":\"32\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(631,1,'2022-10-04 16:38:42',1,66,29,'{\"ID\":\"29\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(632,1,'2022-10-04 16:38:42',1,66,30,'{\"ID\":\"30\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(633,1,'2022-10-04 16:38:42',1,66,31,'{\"ID\":\"31\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"30\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(634,1,'2022-10-04 16:38:42',1,67,11,'{\"ID\":\"11\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,28,'{\"Nome\":\"Trabalhador 10\",\"[identificacao]\":\"Trabalhador 10\",\"ID\":\"28\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(635,1,'2022-10-04 16:38:42',1,51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(636,1,'2022-10-04 16:38:42',1,63,38,'{\"ID\":\"38\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(637,1,'2022-10-04 16:38:42',1,44,33,'{\"ID\":\"33\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(638,1,'2022-10-04 16:38:42',1,66,32,'{\"ID\":\"32\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(639,1,'2022-10-04 16:38:42',1,66,33,'{\"ID\":\"33\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(640,1,'2022-10-04 16:38:42',1,66,34,'{\"ID\":\"34\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"33\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(641,1,'2022-10-04 16:38:42',1,67,12,'{\"ID\":\"12\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,29,'{\"Nome\":\"Trabalhador 11\",\"[identificacao]\":\"Trabalhador 11\",\"ID\":\"29\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(642,1,'2022-10-04 16:38:42',1,51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(643,1,'2022-10-04 16:38:42',1,63,39,'{\"ID\":\"39\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(644,1,'2022-10-04 16:38:42',1,44,34,'{\"ID\":\"34\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(645,1,'2022-10-04 16:38:42',1,66,35,'{\"ID\":\"35\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(646,1,'2022-10-04 16:38:42',1,66,36,'{\"ID\":\"36\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(647,1,'2022-10-04 16:38:42',1,66,37,'{\"ID\":\"37\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"36\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(648,1,'2022-10-04 16:38:42',1,67,13,'{\"ID\":\"13\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,30,'{\"Nome\":\"Trabalhador 12\",\"[identificacao]\":\"Trabalhador 12\",\"ID\":\"30\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(649,1,'2022-10-04 16:38:43',1,51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(650,1,'2022-10-04 16:38:43',1,63,40,'{\"ID\":\"40\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(651,1,'2022-10-04 16:38:43',1,44,35,'{\"ID\":\"35\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(652,1,'2022-10-04 16:38:43',1,66,38,'{\"ID\":\"38\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(653,1,'2022-10-04 16:38:43',1,66,39,'{\"ID\":\"39\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(654,1,'2022-10-04 16:38:43',1,66,40,'{\"ID\":\"40\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"39\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(655,1,'2022-10-04 16:38:43',1,67,14,'{\"ID\":\"14\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,31,'{\"Nome\":\"Trabalhador 13\",\"[identificacao]\":\"Trabalhador 13\",\"ID\":\"31\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(656,1,'2022-10-04 16:38:43',1,51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(657,1,'2022-10-04 16:38:43',1,63,41,'{\"ID\":\"41\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(658,1,'2022-10-04 16:38:43',1,44,36,'{\"ID\":\"36\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(659,1,'2022-10-04 16:38:43',1,66,41,'{\"ID\":\"41\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(660,1,'2022-10-04 16:38:43',1,66,42,'{\"ID\":\"42\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(661,1,'2022-10-04 16:38:43',1,66,43,'{\"ID\":\"43\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"42\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(662,1,'2022-10-04 16:38:43',1,67,15,'{\"ID\":\"15\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,32,'{\"Nome\":\"Trabalhador 14\",\"[identificacao]\":\"Trabalhador 14\",\"ID\":\"32\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(663,1,'2022-10-04 16:38:43',1,51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(664,1,'2022-10-04 16:38:43',1,63,42,'{\"ID\":\"42\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(665,1,'2022-10-04 16:38:43',1,44,37,'{\"ID\":\"37\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(666,1,'2022-10-04 16:38:43',1,66,44,'{\"ID\":\"44\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(667,1,'2022-10-04 16:38:43',1,66,45,'{\"ID\":\"45\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(668,1,'2022-10-04 16:38:43',1,66,46,'{\"ID\":\"46\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"45\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(669,1,'2022-10-04 16:38:43',1,67,16,'{\"ID\":\"16\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,33,'{\"Nome\":\"Trabalhador 15\",\"[identificacao]\":\"Trabalhador 15\",\"ID\":\"33\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(670,1,'2022-10-04 16:38:43',1,51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(671,1,'2022-10-04 16:38:43',1,63,43,'{\"ID\":\"43\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(672,1,'2022-10-04 16:38:43',1,44,38,'{\"ID\":\"38\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(673,1,'2022-10-04 16:38:43',1,66,47,'{\"ID\":\"47\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(674,1,'2022-10-04 16:38:43',1,66,48,'{\"ID\":\"48\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(675,1,'2022-10-04 16:38:43',1,66,49,'{\"ID\":\"49\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"48\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(676,1,'2022-10-04 16:38:43',1,67,17,'{\"ID\":\"17\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,34,'{\"Nome\":\"Trabalhador 16\",\"[identificacao]\":\"Trabalhador 16\",\"ID\":\"34\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(677,1,'2022-10-04 16:38:43',1,51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(678,1,'2022-10-04 16:38:43',1,63,44,'{\"ID\":\"44\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(679,1,'2022-10-04 16:38:43',1,44,39,'{\"ID\":\"39\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(680,1,'2022-10-04 16:38:43',1,66,50,'{\"ID\":\"50\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(681,1,'2022-10-04 16:38:43',1,66,51,'{\"ID\":\"51\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(682,1,'2022-10-04 16:38:43',1,66,52,'{\"ID\":\"52\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"51\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(683,1,'2022-10-04 16:38:43',1,67,18,'{\"ID\":\"18\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,35,'{\"Nome\":\"Trabalhador 17\",\"[identificacao]\":\"Trabalhador 17\",\"ID\":\"35\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(684,1,'2022-10-04 16:38:43',1,51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(685,1,'2022-10-04 16:38:43',1,63,45,'{\"ID\":\"45\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(686,1,'2022-10-04 16:38:43',1,44,40,'{\"ID\":\"40\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(687,1,'2022-10-04 16:38:43',1,66,53,'{\"ID\":\"53\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(688,1,'2022-10-04 16:38:43',1,66,54,'{\"ID\":\"54\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(689,1,'2022-10-04 16:38:43',1,66,55,'{\"ID\":\"55\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"54\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(690,1,'2022-10-04 16:38:43',1,67,19,'{\"ID\":\"19\",\"Centro de resultado\":\"0\",\"Cargo\":3,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2400,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,36,'{\"Nome\":\"Trabalhador 18\",\"[identificacao]\":\"Trabalhador 18\",\"ID\":\"36\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(691,1,'2022-10-04 16:38:44',1,51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(692,1,'2022-10-04 16:38:44',1,63,46,'{\"ID\":\"46\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 5482-5485\",\"[identificacao]\":\"(011) 5482-5485\",\"Observação\":\"\"}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(693,1,'2022-10-04 16:38:44',1,44,41,'{\"ID\":\"41\",\"Logradouro\":\"Rua Goiás\",\"[identificacao]\":\"Rua Goiás\",\"Número\":\"2645\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(694,1,'2022-10-04 16:38:44',1,66,56,'{\"ID\":\"56\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(695,1,'2022-10-04 16:38:44',1,66,57,'{\"ID\":\"57\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(696,1,'2022-10-04 16:38:44',1,66,58,'{\"ID\":\"58\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"57\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"30,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(697,1,'2022-10-04 16:38:44',1,67,20,'{\"ID\":\"20\",\"Centro de resultado\":\"0\",\"Cargo\":4,\"Data de admissão\":\"04/10/2022 16:38:40\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"3000,00\",\"Horas semanais\":\"15:45\",\"EmpresaEspecificaId\":2}',51,37,'{\"Nome\":\"Trabalhador 19\",\"[identificacao]\":\"Trabalhador 19\",\"ID\":\"37\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/2000\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(698,1,'2022-10-04 16:38:44',3,63,27,'{\"ID\":\"27\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(699,1,'2022-10-04 16:38:44',1,63,47,'{\"ID\":\"47\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 3458-8875\",\"[identificacao]\":\"(011) 3458-8875\",\"Observação\":\"\"}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(700,1,'2022-10-04 16:38:44',3,44,22,'{\"ID\":\"22\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(701,1,'2022-10-04 16:38:44',1,44,42,'{\"ID\":\"42\",\"Logradouro\":\"Rua Bahia\",\"[identificacao]\":\"Rua Bahia\",\"Número\":\"2015\",\"Bairro\":\"Centro\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}'),(702,1,'2022-10-04 16:38:44',3,66,1,'{\"ID\":\"1\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"1200,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(703,1,'2022-10-04 16:38:44',1,66,59,'{\"ID\":\"59\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"44,00\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(704,1,'2022-10-04 16:38:44',1,66,60,'{\"ID\":\"60\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"56,00\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(705,1,'2022-10-04 16:38:44',1,66,61,'{\"ID\":\"61\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"60\",\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"20,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(706,1,'2022-10-04 16:38:44',2,67,1,'{\"ID\":\"1\",\"Centro de resultado\":\"1\",\"Cargo\":2,\"Data de admissão\":\"04/10/2022 16:38:43\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"2000,00\",\"Horas semanais\":\"43:45\",\"EmpresaEspecificaId\":2}',51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(707,1,'2022-10-04 16:38:44',2,51,18,'{\"Nome\":\"Joseph Climber\",\"[identificacao]\":\"Joseph Climber\",\"ID\":\"18\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"04/08/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(708,1,'2022-10-04 16:38:44',1,51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(709,1,'2022-10-04 16:38:44',1,67,21,'{\"ID\":\"21\",\"Centro de resultado\":\"0\",\"Cargo\":5,\"Data de admissão\":\"04/10/2022 16:38:44\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"900,00\",\"Horas semanais\":\"0:0\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(710,1,'2022-10-04 16:38:44',1,51,39,'{\"Nome\":\"Colaborador teste relação entre lançamentos 2\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 2\",\"ID\":\"39\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(711,1,'2022-10-04 16:38:44',1,67,22,'{\"ID\":\"22\",\"Centro de resultado\":\"0\",\"Cargo\":5,\"Data de admissão\":\"04/10/2022 16:38:44\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"900,00\",\"Horas semanais\":\"0:0\",\"EmpresaEspecificaId\":2}',51,39,'{\"Nome\":\"Colaborador teste relação entre lançamentos 2\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 2\",\"ID\":\"39\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(712,1,'2022-10-04 16:38:45',1,66,62,'{\"ID\":\"62\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"80,00\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(713,1,'2022-10-04 16:38:45',1,66,63,'{\"ID\":\"63\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"62\",\"Conta\":3,\"Forma de pagamento\":1,\"Centro de resultado\":\"0\",\"Valor\":\"180,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(714,1,'2022-10-04 16:38:45',2,67,21,'{\"ID\":\"21\",\"Centro de resultado\":\"0\",\"Cargo\":5,\"Data de admissão\":\"04/10/2022\",\"Data de demissão\":\"\",\"Causa da demissão\":\"\",\"Salário\":\"900,00\",\"Horas semanais\":\"0:0\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(715,1,'2022-10-04 16:38:45',2,66,63,'{\"ID\":\"63\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"62\",\"Conta\":3,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"0,00\",\"Percentual\":\"8,16\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(716,1,'2022-10-04 16:38:45',1,66,64,'{\"ID\":\"64\",\"Descrição\":\"Comissão\",\"[identificacao]\":\"Comissão\",\"Evento\":10,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"300,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(717,1,'2022-10-04 16:38:45',2,66,62,'{\"ID\":\"62\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Evento\":1,\"Lançamento referente\":\"0\",\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"900,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(718,1,'2022-10-04 16:38:45',2,66,63,'{\"ID\":\"63\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Evento\":18,\"Lançamento referente\":\"62\",\"Conta\":3,\"Forma de pagamento\":1,\"Centro de resultado\":\"1\",\"Valor\":\"900,00\",\"Percentual\":\"0,00\",\"EmpresaEspecificaId\":2}',51,38,'{\"Nome\":\"Colaborador teste relação entre lançamentos 1\",\"[identificacao]\":\"Colaborador teste relação entre lançamentos 1\",\"ID\":\"38\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"01/11/1995\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\"}'),(719,1,'2022-10-04 16:38:47',1,58,1,'{\"ID\":\"1\",\"Descrição\":\"Comissão\",\"[identificacao]\":\"Comissão\",\"Valor\":\"300,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":182,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(720,1,'2022-10-04 16:38:47',1,58,2,'{\"ID\":\"2\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Valor\":\"900,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(721,1,'2022-10-04 16:38:47',1,58,3,'{\"ID\":\"3\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"900,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"2\",\"Colaborador\":38,\"Conta\":3,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(722,1,'2022-10-04 16:38:48',1,58,4,'{\"ID\":\"4\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1120,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(723,1,'2022-10-04 16:38:48',1,58,5,'{\"ID\":\"5\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"880,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(724,1,'2022-10-04 16:38:48',1,58,6,'{\"ID\":\"6\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"20,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"4\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(725,1,'2022-10-04 16:38:48',1,58,7,'{\"ID\":\"7\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":19,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(726,1,'2022-10-04 16:38:48',1,58,8,'{\"ID\":\"8\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":19,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(727,1,'2022-10-04 16:38:48',1,58,9,'{\"ID\":\"9\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"7\",\"Colaborador\":19,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(728,1,'2022-10-04 16:38:48',1,58,10,'{\"ID\":\"10\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":20,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(729,1,'2022-10-04 16:38:48',1,58,11,'{\"ID\":\"11\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":20,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(730,1,'2022-10-04 16:38:48',1,58,12,'{\"ID\":\"12\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"10\",\"Colaborador\":20,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(731,1,'2022-10-04 16:38:48',1,58,13,'{\"ID\":\"13\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":21,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(732,1,'2022-10-04 16:38:48',1,58,14,'{\"ID\":\"14\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":21,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(733,1,'2022-10-04 16:38:48',1,58,15,'{\"ID\":\"15\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"13\",\"Colaborador\":21,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(734,1,'2022-10-04 16:38:48',1,58,16,'{\"ID\":\"16\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":22,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(735,1,'2022-10-04 16:38:48',1,58,17,'{\"ID\":\"17\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":22,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(736,1,'2022-10-04 16:38:48',1,58,18,'{\"ID\":\"18\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"16\",\"Colaborador\":22,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(737,1,'2022-10-04 16:38:48',1,58,19,'{\"ID\":\"19\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":23,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(738,1,'2022-10-04 16:38:48',1,58,20,'{\"ID\":\"20\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":23,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(739,1,'2022-10-04 16:38:48',1,58,21,'{\"ID\":\"21\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"19\",\"Colaborador\":23,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(740,1,'2022-10-04 16:38:48',1,58,22,'{\"ID\":\"22\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":24,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(741,1,'2022-10-04 16:38:48',1,58,23,'{\"ID\":\"23\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":24,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(742,1,'2022-10-04 16:38:48',1,58,24,'{\"ID\":\"24\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"22\",\"Colaborador\":24,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(743,1,'2022-10-04 16:38:48',1,58,25,'{\"ID\":\"25\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":25,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(744,1,'2022-10-04 16:38:48',1,58,26,'{\"ID\":\"26\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":25,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(745,1,'2022-10-04 16:38:48',1,58,27,'{\"ID\":\"27\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"25\",\"Colaborador\":25,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(746,1,'2022-10-04 16:38:48',1,58,28,'{\"ID\":\"28\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":26,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(747,1,'2022-10-04 16:38:48',1,58,29,'{\"ID\":\"29\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":26,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(748,1,'2022-10-04 16:38:48',1,58,30,'{\"ID\":\"30\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"28\",\"Colaborador\":26,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(749,1,'2022-10-04 16:38:48',1,58,31,'{\"ID\":\"31\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":27,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(750,1,'2022-10-04 16:38:48',1,58,32,'{\"ID\":\"32\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":27,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(751,1,'2022-10-04 16:38:48',1,58,33,'{\"ID\":\"33\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"31\",\"Colaborador\":27,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(752,1,'2022-10-04 16:38:48',1,58,34,'{\"ID\":\"34\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":28,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(753,1,'2022-10-04 16:38:48',1,58,35,'{\"ID\":\"35\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":28,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(754,1,'2022-10-04 16:38:48',1,58,36,'{\"ID\":\"36\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"34\",\"Colaborador\":28,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(755,1,'2022-10-04 16:38:48',1,58,37,'{\"ID\":\"37\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":29,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(756,1,'2022-10-04 16:38:48',1,58,38,'{\"ID\":\"38\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":29,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(757,1,'2022-10-04 16:38:48',1,58,39,'{\"ID\":\"39\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"37\",\"Colaborador\":29,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(758,1,'2022-10-04 16:38:48',1,58,40,'{\"ID\":\"40\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":30,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(759,1,'2022-10-04 16:38:48',1,58,41,'{\"ID\":\"41\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:47\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":30,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(760,1,'2022-10-04 16:38:48',1,58,42,'{\"ID\":\"42\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"40\",\"Colaborador\":30,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(761,1,'2022-10-04 16:38:48',1,58,43,'{\"ID\":\"43\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":31,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(762,1,'2022-10-04 16:38:48',1,58,44,'{\"ID\":\"44\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":31,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(763,1,'2022-10-04 16:38:48',1,58,45,'{\"ID\":\"45\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"43\",\"Colaborador\":31,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(764,1,'2022-10-04 16:38:48',1,58,46,'{\"ID\":\"46\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":32,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(765,1,'2022-10-04 16:38:48',1,58,47,'{\"ID\":\"47\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":32,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(766,1,'2022-10-04 16:38:48',1,58,48,'{\"ID\":\"48\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"46\",\"Colaborador\":32,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(767,1,'2022-10-04 16:38:48',1,58,49,'{\"ID\":\"49\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":33,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(768,1,'2022-10-04 16:38:48',1,58,50,'{\"ID\":\"50\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":33,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(769,1,'2022-10-04 16:38:48',1,58,51,'{\"ID\":\"51\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"49\",\"Colaborador\":33,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(770,1,'2022-10-04 16:38:48',1,58,52,'{\"ID\":\"52\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":34,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(771,1,'2022-10-04 16:38:48',1,58,53,'{\"ID\":\"53\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":34,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(772,1,'2022-10-04 16:38:48',1,58,54,'{\"ID\":\"54\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"52\",\"Colaborador\":34,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(773,1,'2022-10-04 16:38:48',1,58,55,'{\"ID\":\"55\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":35,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(774,1,'2022-10-04 16:38:48',1,58,56,'{\"ID\":\"56\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":35,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(775,1,'2022-10-04 16:38:48',1,58,57,'{\"ID\":\"57\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"55\",\"Colaborador\":35,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(776,1,'2022-10-04 16:38:48',1,58,58,'{\"ID\":\"58\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1344,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":36,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(777,1,'2022-10-04 16:38:48',1,58,59,'{\"ID\":\"59\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1056,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":36,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(778,1,'2022-10-04 16:38:48',1,58,60,'{\"ID\":\"60\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"58\",\"Colaborador\":36,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(779,1,'2022-10-04 16:38:48',1,58,61,'{\"ID\":\"61\",\"Descrição\":\"Salário Banco do Brasil\",\"[identificacao]\":\"Salário Banco do Brasil\",\"Valor\":\"1680,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":37,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(780,1,'2022-10-04 16:38:48',1,58,62,'{\"ID\":\"62\",\"Descrição\":\"Salário LagoaCred\",\"[identificacao]\":\"Salário LagoaCred\",\"Valor\":\"1320,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":37,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(781,1,'2022-10-04 16:38:48',1,58,63,'{\"ID\":\"63\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"30,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022 16:38:48\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"61\",\"Colaborador\":37,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(782,1,'2022-10-04 16:38:48',1,57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}',0,0,''),(783,1,'2022-10-04 16:38:49',2,57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Fechado\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}',0,0,''),(784,1,'2022-10-04 16:38:49',1,58,64,'{\"ID\":\"64\",\"Descrição\":\"Salário teste\",\"[identificacao]\":\"Salário teste\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Fechado\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(785,1,'2022-10-04 16:38:49',1,57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}',0,0,''),(786,1,'2022-10-04 16:38:49',1,58,65,'{\"ID\":\"65\",\"Descrição\":\"Salário teste 2\",\"[identificacao]\":\"Salário teste 2\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"\",\"[identificacao]\":\"\",\"Status\":\"0\",\"Tipo\":\"0\",\"EmpresaEspecificaId\":2}'),(787,1,'2022-10-04 16:38:49',1,58,66,'{\"ID\":\"66\",\"Descrição\":\"Adiantamento de salário teste 1\",\"[identificacao]\":\"Adiantamento de salário teste 1\",\"Valor\":\"200,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"64\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Fechado\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(788,1,'2022-10-04 16:38:49',1,58,67,'{\"ID\":\"67\",\"Descrição\":\"Adiantamento de salário teste 2\",\"[identificacao]\":\"Adiantamento de salário teste 2\",\"Valor\":\"40,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"65\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(789,1,'2022-10-04 16:38:49',1,57,3,'{\"ID\":\"3\",\"Competência\":\"Adiantamento 13º Salário/2022\",\"[identificacao]\":\"Adiantamento 13º Salário/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Adiantamento 13º Salário\",\"EmpresaEspecificaId\":2}',0,0,''),(790,1,'2022-10-04 16:38:49',1,58,68,'{\"ID\":\"68\",\"Descrição\":\"Adiantamento do 13º salário\",\"[identificacao]\":\"Adiantamento do 13º salário\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":4,\"Vencimento referente\":\"65\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":180,\"Origem lançamento automático\":\"Não\"}',57,3,'{\"ID\":\"3\",\"Competência\":\"\",\"[identificacao]\":\"\",\"Status\":\"0\",\"Tipo\":\"0\",\"EmpresaEspecificaId\":2}'),(791,1,'2022-10-04 16:38:49',1,57,4,'{\"ID\":\"4\",\"Competência\":\"13º Salário/2022\",\"[identificacao]\":\"13º Salário/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"13º Salário\",\"EmpresaEspecificaId\":2}',0,0,''),(792,1,'2022-10-04 16:38:49',1,58,69,'{\"ID\":\"69\",\"Descrição\":\"13º salário\",\"[identificacao]\":\"13º salário\",\"Valor\":\"2000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":3,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":178,\"Origem lançamento automático\":\"Não\"}',57,4,'{\"ID\":\"4\",\"Competência\":\"\",\"[identificacao]\":\"\",\"Status\":\"0\",\"Tipo\":\"0\",\"EmpresaEspecificaId\":2}'),(793,1,'2022-10-04 16:38:49',1,58,70,'{\"ID\":\"70\",\"Descrição\":\"Adiantamento do 13º salário\",\"[identificacao]\":\"Adiantamento do 13º salário\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"69\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,4,'{\"ID\":\"4\",\"Competência\":\"13º Salário/2022\",\"[identificacao]\":\"13º Salário/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"13º Salário\",\"EmpresaEspecificaId\":2}'),(794,1,'2022-10-04 16:38:49',2,58,4,'{\"ID\":\"4\",\"Descrição\":\"Salário Banco do Brasil (alterado)\",\"[identificacao]\":\"Salário Banco do Brasil (alterado)\",\"Valor\":\"1120,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Fechado\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(795,1,'2022-10-04 16:38:49',2,58,66,'{\"ID\":\"66\",\"Descrição\":\"Adiantamento de salário teste 1 (alterado)\",\"[identificacao]\":\"Adiantamento de salário teste 1 (alterado)\",\"Valor\":\"100,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"64\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Fechado\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(796,1,'2022-10-04 16:38:49',1,58,71,'{\"ID\":\"71\",\"Descrição\":\"ZZSalário pago (excluído)\",\"[identificacao]\":\"ZZSalário pago (excluído)\",\"Valor\":\"5000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(797,1,'2022-10-04 16:38:49',3,58,67,'{\"ID\":\"67\",\"Descrição\":\"Adiantamento de salário teste 2\",\"[identificacao]\":\"Adiantamento de salário teste 2\",\"Valor\":\"40,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"65\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(798,1,'2022-10-04 16:38:50',1,58,72,'{\"ID\":\"72\",\"Descrição\":\"ZZSalário (excluído)\",\"[identificacao]\":\"ZZSalário (excluído)\",\"Valor\":\"5000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(799,1,'2022-10-04 16:38:50',1,58,73,'{\"ID\":\"73\",\"Descrição\":\"ZZAditantamento Salário pago (excluído)\",\"[identificacao]\":\"ZZAditantamento Salário pago (excluído)\",\"Valor\":\"50,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"72\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(800,1,'2022-10-04 16:38:50',3,58,71,'{\"ID\":\"71\",\"Descrição\":\"ZZSalário pago (excluído)\",\"[identificacao]\":\"ZZSalário pago (excluído)\",\"Valor\":\"5000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(801,1,'2022-10-04 16:38:50',3,58,72,'{\"ID\":\"72\",\"Descrição\":\"ZZSalário (excluído)\",\"[identificacao]\":\"ZZSalário (excluído)\",\"Valor\":\"5000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":18,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,2,'{\"ID\":\"2\",\"Competência\":\"Novembro/2022\",\"[identificacao]\":\"Novembro/2022\",\"Status\":\"Aberto sem lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(802,1,'2022-10-04 16:38:50',2,57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}',0,0,''),(803,1,'2022-10-04 16:38:50',1,58,74,'{\"ID\":\"74\",\"Descrição\":\"Salário CEF 7\",\"[identificacao]\":\"Salário CEF 7\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(804,1,'2022-10-04 16:38:50',1,58,75,'{\"ID\":\"75\",\"Descrição\":\"Comissão 7\",\"[identificacao]\":\"Comissão 7\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(805,1,'2022-10-04 16:38:50',2,58,1,'{\"ID\":\"1\",\"Descrição\":\"Comissão\",\"[identificacao]\":\"Comissão\",\"Valor\":\"300,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":182,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(806,1,'2022-10-04 16:38:50',2,58,2,'{\"ID\":\"2\",\"Descrição\":\"Salário\",\"[identificacao]\":\"Salário\",\"Valor\":\"900,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":2,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(807,1,'2022-10-04 16:38:50',2,58,3,'{\"ID\":\"3\",\"Descrição\":\"Desconto INSS\",\"[identificacao]\":\"Desconto INSS\",\"Valor\":\"900,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":18,\"Vencimento referente\":\"2\",\"Colaborador\":38,\"Conta\":3,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":198,\"Origem lançamento automático\":\"Sim\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(808,1,'2022-10-04 16:38:50',2,58,74,'{\"ID\":\"74\",\"Descrição\":\"Salário CEF 7\",\"[identificacao]\":\"Salário CEF 7\",\"Valor\":\"1000,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(809,1,'2022-10-04 16:38:50',2,58,75,'{\"ID\":\"75\",\"Descrição\":\"Comissão 7\",\"[identificacao]\":\"Comissão 7\",\"Valor\":\"500,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(810,1,'2022-10-04 16:38:50',1,58,76,'{\"ID\":\"76\",\"Descrição\":\"Salário CEF 1\",\"[identificacao]\":\"Salário CEF 1\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(811,1,'2022-10-04 16:38:50',3,58,76,'{\"ID\":\"76\",\"Descrição\":\"Salário CEF 1\",\"[identificacao]\":\"Salário CEF 1\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(812,1,'2022-10-04 16:38:50',1,58,77,'{\"ID\":\"77\",\"Descrição\":\"Salário CEF 2\",\"[identificacao]\":\"Salário CEF 2\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(813,1,'2022-10-04 16:38:50',1,58,78,'{\"ID\":\"78\",\"Descrição\":\"Vale - 2\",\"[identificacao]\":\"Vale - 2\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"77\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(814,1,'2022-10-04 16:38:50',3,58,78,'{\"ID\":\"78\",\"Descrição\":\"Vale - 2\",\"[identificacao]\":\"Vale - 2\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"77\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(815,1,'2022-10-04 16:38:50',3,58,77,'{\"ID\":\"77\",\"Descrição\":\"Salário CEF 2\",\"[identificacao]\":\"Salário CEF 2\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(816,1,'2022-10-04 16:38:50',1,58,79,'{\"ID\":\"79\",\"Descrição\":\"Salário CEF 3\",\"[identificacao]\":\"Salário CEF 3\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(817,1,'2022-10-04 16:38:50',1,58,80,'{\"ID\":\"80\",\"Descrição\":\"Vale 3\",\"[identificacao]\":\"Vale 3\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"79\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(818,1,'2022-10-04 16:38:50',3,58,80,'{\"ID\":\"80\",\"Descrição\":\"Vale 3\",\"[identificacao]\":\"Vale 3\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"79\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(819,1,'2022-10-04 16:38:50',3,58,79,'{\"ID\":\"79\",\"Descrição\":\"Salário CEF 3\",\"[identificacao]\":\"Salário CEF 3\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(820,1,'2022-10-04 16:38:50',1,58,81,'{\"ID\":\"81\",\"Descrição\":\"Salário CEF 4\",\"[identificacao]\":\"Salário CEF 4\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(821,1,'2022-10-04 16:38:50',1,58,82,'{\"ID\":\"82\",\"Descrição\":\"Vale - 4\",\"[identificacao]\":\"Vale - 4\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"81\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(822,1,'2022-10-04 16:38:50',2,58,81,'{\"ID\":\"81\",\"Descrição\":\"Salário CEF 4\",\"[identificacao]\":\"Salário CEF 4\",\"Valor\":\"1000,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(823,1,'2022-10-04 16:38:51',1,58,83,'{\"ID\":\"83\",\"Descrição\":\"Salário CEF 5\",\"[identificacao]\":\"Salário CEF 5\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(824,1,'2022-10-04 16:38:51',1,58,84,'{\"ID\":\"84\",\"Descrição\":\"Vale - 5\",\"[identificacao]\":\"Vale - 5\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"83\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(825,1,'2022-10-04 16:38:51',3,58,84,'{\"ID\":\"84\",\"Descrição\":\"Vale - 5\",\"[identificacao]\":\"Vale - 5\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"83\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(826,1,'2022-10-04 16:38:51',3,58,83,'{\"ID\":\"83\",\"Descrição\":\"Salário CEF 5\",\"[identificacao]\":\"Salário CEF 5\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(827,1,'2022-10-04 16:38:51',1,58,85,'{\"ID\":\"85\",\"Descrição\":\"Salário CEF 6\",\"[identificacao]\":\"Salário CEF 6\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(828,1,'2022-10-04 16:38:51',1,58,86,'{\"ID\":\"86\",\"Descrição\":\"Comissão 6\",\"[identificacao]\":\"Comissão 6\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(829,1,'2022-10-04 16:38:51',1,58,87,'{\"ID\":\"87\",\"Descrição\":\"Vale - 6\",\"[identificacao]\":\"Vale - 6\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"85\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(830,1,'2022-10-04 16:38:51',3,58,87,'{\"ID\":\"87\",\"Descrição\":\"Vale - 6\",\"[identificacao]\":\"Vale - 6\",\"Valor\":\"700,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"85\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(831,1,'2022-10-04 16:38:51',3,58,86,'{\"ID\":\"86\",\"Descrição\":\"Comissão 6\",\"[identificacao]\":\"Comissão 6\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(832,1,'2022-10-04 16:38:51',3,58,85,'{\"ID\":\"85\",\"Descrição\":\"Salário CEF 6\",\"[identificacao]\":\"Salário CEF 6\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(833,1,'2022-10-04 16:38:51',1,58,88,'{\"ID\":\"88\",\"Descrição\":\"Salário CEF\",\"[identificacao]\":\"Salário CEF\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(834,1,'2022-10-04 16:38:51',1,58,89,'{\"ID\":\"89\",\"Descrição\":\"Vale\",\"[identificacao]\":\"Vale\",\"Valor\":\"600,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"88\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(835,1,'2022-10-04 16:38:51',1,58,90,'{\"ID\":\"90\",\"Descrição\":\"Vale 2\",\"[identificacao]\":\"Vale 2\",\"Valor\":\"400,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"88\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(836,1,'2022-10-04 16:38:51',3,58,89,'{\"ID\":\"89\",\"Descrição\":\"Vale\",\"[identificacao]\":\"Vale\",\"Valor\":\"600,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"88\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(837,1,'2022-10-04 16:38:51',1,58,91,'{\"ID\":\"91\",\"Descrição\":\"Vale 2\",\"[identificacao]\":\"Vale 2\",\"Valor\":\"200,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"88\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(838,1,'2022-10-04 16:38:51',2,58,88,'{\"ID\":\"88\",\"Descrição\":\"Salário CEF\",\"[identificacao]\":\"Salário CEF\",\"Valor\":\"800,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":39,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(839,1,'2022-10-04 16:38:51',1,58,92,'{\"ID\":\"92\",\"Descrição\":\"Salário CEF 7\",\"[identificacao]\":\"Salário CEF 7\",\"Valor\":\"1000,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(840,1,'2022-10-04 16:38:51',1,58,93,'{\"ID\":\"93\",\"Descrição\":\"Comissão 7\",\"[identificacao]\":\"Comissão 7\",\"Valor\":\"500,00\",\"Pago\":\"Não\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(841,1,'2022-10-04 16:38:51',2,58,82,'{\"ID\":\"82\",\"Descrição\":\"Vale - 4\",\"[identificacao]\":\"Vale - 4\",\"Valor\":\"700,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":2,\"Vencimento referente\":\"81\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":179,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(842,1,'2022-10-04 16:38:51',2,58,92,'{\"ID\":\"92\",\"Descrição\":\"Salário CEF 7\",\"[identificacao]\":\"Salário CEF 7\",\"Valor\":\"1000,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"04/11/2022\",\"Evento\":1,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":1,\"Categoria\":191,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(843,1,'2022-10-04 16:38:51',2,58,93,'{\"ID\":\"93\",\"Descrição\":\"Comissão 7\",\"[identificacao]\":\"Comissão 7\",\"Valor\":\"500,00\",\"Pago\":\"Sim\",\"Data de lançamento\":\"04/10/2022\",\"Data de pagamento\":\"04/10/2022\",\"Data de vencimento\":\"\",\"Evento\":10,\"Vencimento referente\":\"0\",\"Colaborador\":38,\"Conta\":1,\"Forma de pagamento\":1,\"Centro de resultado\":0,\"Categoria\":182,\"Origem lançamento automático\":\"Não\"}',57,1,'{\"ID\":\"1\",\"Competência\":\"Setembro/2022\",\"[identificacao]\":\"Setembro/2022\",\"Status\":\"Aberto com lançamento automático\",\"Tipo\":\"Normal\",\"EmpresaEspecificaId\":2}'),(844,1,'2022-10-04 16:38:54',2,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro (Alterado)\",\"[identificacao]\":\"Dinheiro (Alterado)\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":1}',0,0,''),(845,1,'2022-10-04 16:38:54',1,22,11,'{\"ID\":\"11\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2),(12,2),(13,2),(14,2),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(154,2),(155,1),(155,2),(156,1),(156,2),(157,1),(157,2),(158,1),(158,2),(159,1),(159,2),(160,1),(160,2),(161,1),(161,2),(162,1),(162,2),(163,1),(163,2),(164,1),(164,2),(165,1),(165,2),(166,1),(166,2),(167,1),(167,2),(168,1),(168,2),(169,1),(169,2),(170,1),(170,2),(171,1),(171,2),(172,1),(172,2),(173,1),(173,2),(174,1),(174,2),(175,1),(175,2),(176,1),(176,2),(177,1),(177,2),(178,1),(178,2),(179,1),(179,2),(180,1),(180,2),(181,1),(181,2),(182,1),(182,2),(183,1),(183,2),(184,1),(184,2),(185,1),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(220,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,2),(233,2),(234,2),(235,2),(236,2),(237,2),(238,2),(239,2),(240,2),(241,2),(242,2),(243,2),(244,2),(245,2),(246,2),(247,2),(248,2),(249,2),(250,2),(251,2),(252,2),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(273,2),(274,2),(275,2),(276,2),(277,2),(278,2),(279,2),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,2),(287,2),(288,2),(289,2),(290,2),(291,2),(292,2),(293,2),(294,2),(295,2),(296,2),(297,2),(298,2),(299,2),(300,2),(301,2),(302,2),(303,2),(304,2),(305,2),(306,2),(307,2),(308,2),(309,2),(310,2),(311,2),(312,2),(313,2),(314,2),(315,2),(316,2),(317,2),(318,2),(319,2),(320,2),(321,2),(322,2),(323,2),(324,1),(325,1),(326,1),(327,1),(328,1),(329,1),(330,2),(331,2),(332,2),(333,2),(334,2),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,2),(346,2),(347,2),(348,2),(349,2),(350,2),(351,2),(352,1),(353,1),(354,1),(355,1),(356,1),(357,1),(358,1),(359,1),(360,1),(361,1),(362,1),(363,2),(364,2),(365,2),(366,2),(367,2),(368,1),(368,2),(369,1),(369,2),(370,1),(370,2),(371,1),(371,2),(372,1),(372,2),(373,2),(374,2),(375,2),(376,2),(377,2),(378,1),(378,2),(379,1),(379,2),(380,1),(380,2),(381,1),(381,2),(382,1),(382,2),(383,1),(383,2),(384,1),(384,2),(385,1),(385,2),(386,1),(386,2),(387,2),(388,2),(389,2),(390,1),(391,1),(392,1),(393,1),(394,1),(395,1),(396,1),(397,1),(398,1),(399,1),(400,1),(401,1),(402,1),(403,1),(404,1),(405,1),(406,1),(407,2),(408,1),(409,1),(410,1),(411,1),(412,1),(413,1),(414,1),(415,1),(416,1),(417,1),(418,1),(419,1),(420,1),(421,1),(422,1),(423,1),(424,1),(425,1),(426,1),(427,1),(428,1),(429,1),(430,1),(431,1),(432,1),(433,1),(434,1),(435,1),(436,1),(437,1),(438,1),(439,1),(440,1),(441,1),(442,1),(443,1),(444,1),(445,1),(446,1),(447,1),(448,1),(449,1),(450,1),(451,1),(452,1),(453,1),(454,1),(455,1),(456,1),(457,1),(458,1),(459,1),(460,1),(461,1),(462,1),(463,1),(464,1),(465,1),(466,1),(467,1),(468,1),(469,1),(470,1),(471,1),(472,1),(473,2),(474,1),(475,1),(476,1),(477,1),(478,1),(479,1),(480,1),(481,1),(482,1),(493,1),(495,1),(496,1),(497,1),(498,1),(499,1),(500,1),(501,1),(502,1),(503,1),(504,2),(505,2),(506,2),(507,2),(508,2),(509,2),(510,2),(511,2),(512,2),(513,2),(514,2),(515,2),(516,2),(517,2),(518,2),(519,2),(520,1),(521,1),(522,2),(523,2),(524,2),(525,2),(526,2),(527,2),(528,2),(529,2),(530,1),(530,2),(531,1),(531,2),(532,2),(533,2),(534,2),(535,1),(535,2),(536,1),(536,2),(537,1),(537,2),(538,1),(539,1),(540,1),(541,1),(542,1),(543,1),(544,1),(545,1),(546,1),(547,1),(548,1),(549,1),(550,1),(550,2),(551,2),(552,2),(553,2),(554,2),(555,1),(556,2),(557,1),(558,1),(559,1),(560,1),(561,1),(562,1),(563,2),(564,2),(565,1),(566,1),(567,1),(568,2),(569,2),(570,2),(571,2),(572,1),(573,1),(574,1),(575,2),(576,2),(577,2),(578,2),(579,1),(580,1),(581,1),(582,2),(583,2),(584,2),(585,2),(586,1),(587,1),(588,1),(589,2),(590,2),(591,2),(592,2),(593,1),(594,1),(595,1),(596,2),(597,2),(598,2),(599,2),(600,1),(601,1),(602,1),(603,2),(604,2),(605,2),(606,2),(607,1),(608,1),(609,1),(610,2),(611,2),(612,2),(613,2),(614,1),(615,1),(616,1),(617,2),(618,2),(619,2),(620,2),(621,1),(622,1),(623,1),(624,2),(625,2),(626,2),(627,2),(628,1),(629,1),(630,1),(631,2),(632,2),(633,2),(634,2),(635,1),(636,1),(637,1),(638,2),(639,2),(640,2),(641,2),(642,1),(643,1),(644,1),(645,2),(646,2),(647,2),(648,2),(649,1),(650,1),(651,1),(652,2),(653,2),(654,2),(655,2),(656,1),(657,1),(658,1),(659,2),(660,2),(661,2),(662,2),(663,1),(664,1),(665,1),(666,2),(667,2),(668,2),(669,2),(670,1),(671,1),(672,1),(673,2),(674,2),(675,2),(676,2),(677,1),(678,1),(679,1),(680,2),(681,2),(682,2),(683,2),(684,1),(685,1),(686,1),(687,2),(688,2),(689,2),(690,2),(691,1),(692,1),(693,1),(694,2),(695,2),(696,2),(697,2),(698,1),(699,1),(700,1),(701,1),(702,2),(703,2),(704,2),(705,2),(706,2),(707,1),(708,1),(709,2),(710,1),(711,2),(712,2),(713,2),(714,2),(715,2),(716,2),(717,2),(718,2),(719,2),(720,2),(721,2),(722,2),(723,2),(724,2),(725,2),(726,2),(727,2),(728,2),(729,2),(730,2),(731,2),(732,2),(733,2),(734,2),(735,2),(736,2),(737,2),(738,2),(739,2),(740,2),(741,2),(742,2),(743,2),(744,2),(745,2),(746,2),(747,2),(748,2),(749,2),(750,2),(751,2),(752,2),(753,2),(754,2),(755,2),(756,2),(757,2),(758,2),(759,2),(760,2),(761,2),(762,2),(763,2),(764,2),(765,2),(766,2),(767,2),(768,2),(769,2),(770,2),(771,2),(772,2),(773,2),(774,2),(775,2),(776,2),(777,2),(778,2),(779,2),(780,2),(781,2),(782,2),(783,2),(784,2),(785,2),(786,2),(787,2),(788,2),(789,2),(790,2),(791,2),(792,2),(793,2),(794,2),(795,2),(796,2),(797,2),(798,2),(799,2),(800,2),(801,2),(802,2),(803,2),(804,2),(805,2),(806,2),(807,2),(808,2),(809,2),(810,2),(811,2),(812,2),(813,2),(814,2),(815,2),(816,2),(817,2),(818,2),(819,2),(820,2),(821,2),(822,2),(823,2),(824,2),(825,2),(826,2),(827,2),(828,2),(829,2),(830,2),(831,2),(832,2),(833,2),(834,2),(835,2),(836,2),(837,2),(838,2),(839,2),(840,2),(841,2),(842,2),(843,2),(844,1),(845,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(2,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'D',0,0),(3,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'C',0,0),(4,2,1,NULL,'Salário Banco do Brasil (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1120.00,'D',0,0),(5,2,2,NULL,'Salário LagoaCred (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,880.00,'D',0,0),(6,2,1,NULL,'Desconto INSS (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,20.00,'C',0,0),(7,2,1,NULL,'Salário Banco do Brasil (Trabalhador 01, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(8,2,2,NULL,'Salário LagoaCred (Trabalhador 01, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(9,2,1,NULL,'Desconto INSS (Trabalhador 01, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(10,2,1,NULL,'Salário Banco do Brasil (Trabalhador 02, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(11,2,2,NULL,'Salário LagoaCred (Trabalhador 02, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(12,2,1,NULL,'Desconto INSS (Trabalhador 02, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(13,2,1,NULL,'Salário Banco do Brasil (Trabalhador 03, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(14,2,2,NULL,'Salário LagoaCred (Trabalhador 03, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(15,2,1,NULL,'Desconto INSS (Trabalhador 03, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(16,2,1,NULL,'Salário Banco do Brasil (Trabalhador 04, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(17,2,2,NULL,'Salário LagoaCred (Trabalhador 04, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(18,2,1,NULL,'Desconto INSS (Trabalhador 04, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(19,2,1,NULL,'Salário Banco do Brasil (Trabalhador 05, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(20,2,2,NULL,'Salário LagoaCred (Trabalhador 05, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(21,2,1,NULL,'Desconto INSS (Trabalhador 05, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(22,2,1,NULL,'Salário Banco do Brasil (Trabalhador 06, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(23,2,2,NULL,'Salário LagoaCred (Trabalhador 06, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(24,2,1,NULL,'Desconto INSS (Trabalhador 06, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(25,2,1,NULL,'Salário Banco do Brasil (Trabalhador 07, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(26,2,2,NULL,'Salário LagoaCred (Trabalhador 07, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(27,2,1,NULL,'Desconto INSS (Trabalhador 07, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(28,2,1,NULL,'Salário Banco do Brasil (Trabalhador 08, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(29,2,2,NULL,'Salário LagoaCred (Trabalhador 08, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(30,2,1,NULL,'Desconto INSS (Trabalhador 08, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(31,2,1,NULL,'Salário Banco do Brasil (Trabalhador 09, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(32,2,2,NULL,'Salário LagoaCred (Trabalhador 09, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(33,2,1,NULL,'Desconto INSS (Trabalhador 09, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(34,2,1,NULL,'Salário Banco do Brasil (Trabalhador 10, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(35,2,2,NULL,'Salário LagoaCred (Trabalhador 10, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(36,2,1,NULL,'Desconto INSS (Trabalhador 10, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(37,2,1,NULL,'Salário Banco do Brasil (Trabalhador 11, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(38,2,2,NULL,'Salário LagoaCred (Trabalhador 11, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(39,2,1,NULL,'Desconto INSS (Trabalhador 11, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(40,2,1,NULL,'Salário Banco do Brasil (Trabalhador 12, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:47','2022-09-30 16:38:47',NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(41,2,2,NULL,'Salário LagoaCred (Trabalhador 12, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(42,2,1,NULL,'Desconto INSS (Trabalhador 12, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(43,2,1,NULL,'Salário Banco do Brasil (Trabalhador 13, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(44,2,2,NULL,'Salário LagoaCred (Trabalhador 13, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(45,2,1,NULL,'Desconto INSS (Trabalhador 13, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(46,2,1,NULL,'Salário Banco do Brasil (Trabalhador 14, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(47,2,2,NULL,'Salário LagoaCred (Trabalhador 14, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(48,2,1,NULL,'Desconto INSS (Trabalhador 14, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(49,2,1,NULL,'Salário Banco do Brasil (Trabalhador 15, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(50,2,2,NULL,'Salário LagoaCred (Trabalhador 15, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(51,2,1,NULL,'Desconto INSS (Trabalhador 15, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(52,2,1,NULL,'Salário Banco do Brasil (Trabalhador 16, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(53,2,2,NULL,'Salário LagoaCred (Trabalhador 16, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(54,2,1,NULL,'Desconto INSS (Trabalhador 16, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(55,2,1,NULL,'Salário Banco do Brasil (Trabalhador 17, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(56,2,2,NULL,'Salário LagoaCred (Trabalhador 17, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(57,2,1,NULL,'Desconto INSS (Trabalhador 17, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(58,2,1,NULL,'Salário Banco do Brasil (Trabalhador 18, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(59,2,2,NULL,'Salário LagoaCred (Trabalhador 18, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(60,2,1,NULL,'Desconto INSS (Trabalhador 18, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(61,2,1,NULL,'Salário Banco do Brasil (Trabalhador 19, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(62,2,2,NULL,'Salário LagoaCred (Trabalhador 19, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(63,2,1,NULL,'Desconto INSS (Trabalhador 19, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:48','2022-09-30 16:38:48',NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(64,2,1,NULL,'Salário teste (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:49','2022-09-30 16:38:49',NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(65,2,1,NULL,'Salário teste 2 (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(66,2,1,NULL,'Adiantamento de salário teste 1 (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:49','2022-09-30 16:38:49',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,1),(67,2,1,NULL,'Adiantamento de salário teste 2 (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,NULL,NULL,40.00,'D',0,1),(68,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(69,2,1,NULL,'13º salário (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 16:38:49','2022-12-31 16:38:49',NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,'D',0,0),(70,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 16:38:49','2022-12-31 16:38:49',NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(71,2,1,NULL,'Adiantamento de salário teste 1 (alterado) (Joseph Climber, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:49','2022-09-30 16:38:49',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(72,2,1,NULL,'ZZSalário pago (excluído) (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,5000.00,'D',0,1),(73,2,1,NULL,'ZZSalário (excluído) (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,NULL,NULL,5000.00,'D',0,1),(74,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 16:38:49','2022-11-30 16:38:49',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(75,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(76,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:49','2022-09-30 16:38:49',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(77,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:49','2022-09-30 16:38:49',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(78,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(79,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'D',0,0),(80,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'C',0,0),(81,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(82,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:49','2022-10-04 16:38:49',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(83,2,1,NULL,'Salário CEF 1 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(84,2,1,NULL,'Salário CEF 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,77,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(85,2,1,NULL,'Vale - 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(86,2,1,NULL,'Salário CEF 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,79,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(87,2,1,NULL,'Vale 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(88,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(89,2,1,NULL,'Vale - 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(90,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:50','2022-10-04 16:38:50',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(91,2,1,NULL,'Salário CEF 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(92,2,1,NULL,'Vale - 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(93,2,1,NULL,'Salário CEF 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(94,2,1,NULL,'Comissão 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(95,2,1,NULL,'Vale - 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(96,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(97,2,1,NULL,'Vale (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,600.00,'D',0,1),(98,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:50','2022-09-30 16:38:50',NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,NULL,NULL,400.00,'D',0,0),(99,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:51','2022-09-30 16:38:51',NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(100,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:51','2022-09-30 16:38:51',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(101,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:51','2022-09-30 16:38:51',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(102,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-09-30 16:38:51','2022-09-30 16:38:51',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(103,2,1,NULL,'Vale - 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:51','2022-10-04 16:38:51',NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(104,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:51','2022-10-04 16:38:51',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(105,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Setembro/2022)','2022-10-04 16:38:51','2022-10-04 16:38:51',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0);
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
INSERT INTO `movimento_categoria` VALUES (1,182,NULL,'',300.00),(2,191,NULL,'',900.00),(3,198,NULL,'',900.00),(4,191,NULL,'',1120.00),(5,191,NULL,'',880.00),(6,198,NULL,'',20.00),(7,191,NULL,'',1680.00),(8,191,NULL,'',1320.00),(9,198,NULL,'',30.00),(10,191,NULL,'',1344.00),(11,191,NULL,'',1056.00),(12,198,NULL,'',30.00),(13,191,NULL,'',1344.00),(14,191,NULL,'',1056.00),(15,198,NULL,'',30.00),(16,191,NULL,'',1680.00),(17,191,NULL,'',1320.00),(18,198,NULL,'',30.00),(19,191,NULL,'',1344.00),(20,191,NULL,'',1056.00),(21,198,NULL,'',30.00),(22,191,NULL,'',1680.00),(23,191,NULL,'',1320.00),(24,198,NULL,'',30.00),(25,191,NULL,'',1344.00),(26,191,NULL,'',1056.00),(27,198,NULL,'',30.00),(28,191,NULL,'',1680.00),(29,191,NULL,'',1320.00),(30,198,NULL,'',30.00),(31,191,NULL,'',1680.00),(32,191,NULL,'',1320.00),(33,198,NULL,'',30.00),(34,191,NULL,'',1680.00),(35,191,NULL,'',1320.00),(36,198,NULL,'',30.00),(37,191,NULL,'',1344.00),(38,191,NULL,'',1056.00),(39,198,NULL,'',30.00),(40,191,NULL,'',1680.00),(41,191,NULL,'',1320.00),(42,198,NULL,'',30.00),(43,191,NULL,'',1680.00),(44,191,NULL,'',1320.00),(45,198,NULL,'',30.00),(46,191,NULL,'',1344.00),(47,191,NULL,'',1056.00),(48,198,NULL,'',30.00),(49,191,NULL,'',1344.00),(50,191,NULL,'',1056.00),(51,198,NULL,'',30.00),(52,191,NULL,'',1680.00),(53,191,NULL,'',1320.00),(54,198,NULL,'',30.00),(55,191,NULL,'',1344.00),(56,191,NULL,'',1056.00),(57,198,NULL,'',30.00),(58,191,NULL,'',1344.00),(59,191,NULL,'',1056.00),(60,198,NULL,'',30.00),(61,191,NULL,'',1680.00),(62,191,NULL,'',1320.00),(63,198,NULL,'',30.00),(64,191,NULL,'',500.00),(65,191,NULL,'',500.00),(66,179,NULL,'',200.00),(67,179,NULL,'',40.00),(68,180,NULL,'',1000.00),(69,178,NULL,'',2000.00),(70,179,NULL,'',1000.00),(71,179,NULL,'',100.00),(72,191,NULL,'',5000.00),(73,191,NULL,'',5000.00),(74,191,NULL,'',50.00),(75,191,NULL,'',50.00),(76,191,NULL,'',1000.00),(77,182,NULL,'',500.00),(78,182,NULL,'',300.00),(79,191,NULL,'',900.00),(80,198,NULL,'',900.00),(81,191,NULL,'',1000.00),(82,182,NULL,'',500.00),(83,191,NULL,'',1000.00),(84,191,NULL,'',1000.00),(85,179,NULL,'',700.00),(86,191,NULL,'',1000.00),(87,179,NULL,'',700.00),(88,191,NULL,'',1000.00),(89,179,NULL,'',700.00),(90,191,NULL,'',300.00),(91,191,NULL,'',1000.00),(92,179,NULL,'',700.00),(93,191,NULL,'',1000.00),(94,182,NULL,'',500.00),(95,179,NULL,'',700.00),(96,191,NULL,'',1000.00),(97,179,NULL,'',600.00),(98,179,NULL,'',400.00),(99,179,NULL,'',200.00),(100,191,NULL,'',200.00),(101,191,NULL,'',1000.00),(102,182,NULL,'',500.00),(103,179,NULL,'',700.00),(104,191,NULL,'',1000.00),(105,182,NULL,'',500.00);
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
INSERT INTO `movimento_centro_resultado` VALUES (1,1,300.00),(2,1,900.00),(3,1,900.00),(4,1,1120.00),(5,1,880.00),(6,1,20.00),(7,1,1680.00),(8,1,1320.00),(9,1,30.00),(10,1,1344.00),(11,1,1056.00),(12,1,30.00),(13,1,1344.00),(14,1,1056.00),(15,1,30.00),(16,1,1680.00),(17,1,1320.00),(18,1,30.00),(19,1,1344.00),(20,1,1056.00),(21,1,30.00),(22,1,1680.00),(23,1,1320.00),(24,1,30.00),(25,1,1344.00),(26,1,1056.00),(27,1,30.00),(28,1,1680.00),(29,1,1320.00),(30,1,30.00),(31,1,1680.00),(32,1,1320.00),(33,1,30.00),(34,1,1680.00),(35,1,1320.00),(36,1,30.00),(37,1,1344.00),(38,1,1056.00),(39,1,30.00),(40,1,1680.00),(41,1,1320.00),(42,1,30.00),(43,1,1680.00),(44,1,1320.00),(45,1,30.00),(46,1,1344.00),(47,1,1056.00),(48,1,30.00),(49,1,1344.00),(50,1,1056.00),(51,1,30.00),(52,1,1680.00),(53,1,1320.00),(54,1,30.00),(55,1,1344.00),(56,1,1056.00),(57,1,30.00),(58,1,1344.00),(59,1,1056.00),(60,1,30.00),(61,1,1680.00),(62,1,1320.00),(63,1,30.00),(66,1,200.00),(67,1,40.00),(68,1,1000.00),(69,1,2000.00),(70,1,1000.00),(71,1,100.00),(72,1,5000.00),(73,1,5000.00),(74,1,50.00),(75,1,50.00),(76,1,1000.00),(78,1,300.00),(79,1,900.00),(80,1,900.00),(81,1,1000.00),(83,1,1000.00),(84,1,1000.00),(85,1,700.00),(86,1,1000.00),(87,1,700.00),(88,1,1000.00),(89,1,700.00),(90,1,300.00),(91,1,1000.00),(92,1,700.00),(93,1,1000.00),(95,1,700.00),(96,1,1000.00),(97,1,600.00),(98,1,400.00),(99,1,200.00),(100,1,200.00),(101,1,1000.00),(103,1,700.00),(104,1,1000.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,182,4,300.00,2,2),(1,182,29,300.00,2,2),(1,182,68,300.00,1,2),(1,182,78,300.00,2,2),(2,191,4,900.00,2,2),(2,191,29,900.00,2,2),(2,191,68,900.00,1,2),(2,191,78,900.00,2,2),(3,198,4,900.00,1,2),(3,198,29,900.00,1,2),(3,198,68,900.00,2,2),(3,198,78,900.00,1,2),(4,191,4,1120.00,2,2),(4,191,29,1120.00,2,2),(4,191,68,1120.00,1,2),(4,191,78,1120.00,2,2),(5,191,4,880.00,2,2),(5,191,29,880.00,2,2),(5,191,68,880.00,1,2),(5,191,78,880.00,2,2),(6,198,4,20.00,1,2),(6,198,29,20.00,1,2),(6,198,68,20.00,2,2),(6,198,78,20.00,1,2),(7,191,4,1680.00,2,2),(7,191,29,1680.00,2,2),(7,191,68,1680.00,1,2),(7,191,78,1680.00,2,2),(8,191,4,1320.00,2,2),(8,191,29,1320.00,2,2),(8,191,68,1320.00,1,2),(8,191,78,1320.00,2,2),(9,198,4,30.00,1,2),(9,198,29,30.00,1,2),(9,198,68,30.00,2,2),(9,198,78,30.00,1,2),(10,191,4,1344.00,2,2),(10,191,29,1344.00,2,2),(10,191,68,1344.00,1,2),(10,191,78,1344.00,2,2),(11,191,4,1056.00,2,2),(11,191,29,1056.00,2,2),(11,191,68,1056.00,1,2),(11,191,78,1056.00,2,2),(12,198,4,30.00,1,2),(12,198,29,30.00,1,2),(12,198,68,30.00,2,2),(12,198,78,30.00,1,2),(13,191,4,1344.00,2,2),(13,191,29,1344.00,2,2),(13,191,68,1344.00,1,2),(13,191,78,1344.00,2,2),(14,191,4,1056.00,2,2),(14,191,29,1056.00,2,2),(14,191,68,1056.00,1,2),(14,191,78,1056.00,2,2),(15,198,4,30.00,1,2),(15,198,29,30.00,1,2),(15,198,68,30.00,2,2),(15,198,78,30.00,1,2),(16,191,4,1680.00,2,2),(16,191,29,1680.00,2,2),(16,191,68,1680.00,1,2),(16,191,78,1680.00,2,2),(17,191,4,1320.00,2,2),(17,191,29,1320.00,2,2),(17,191,68,1320.00,1,2),(17,191,78,1320.00,2,2),(18,198,4,30.00,1,2),(18,198,29,30.00,1,2),(18,198,68,30.00,2,2),(18,198,78,30.00,1,2),(19,191,4,1344.00,2,2),(19,191,29,1344.00,2,2),(19,191,68,1344.00,1,2),(19,191,78,1344.00,2,2),(20,191,4,1056.00,2,2),(20,191,29,1056.00,2,2),(20,191,68,1056.00,1,2),(20,191,78,1056.00,2,2),(21,198,4,30.00,1,2),(21,198,29,30.00,1,2),(21,198,68,30.00,2,2),(21,198,78,30.00,1,2),(22,191,4,1680.00,2,2),(22,191,29,1680.00,2,2),(22,191,68,1680.00,1,2),(22,191,78,1680.00,2,2),(23,191,4,1320.00,2,2),(23,191,29,1320.00,2,2),(23,191,68,1320.00,1,2),(23,191,78,1320.00,2,2),(24,198,4,30.00,1,2),(24,198,29,30.00,1,2),(24,198,68,30.00,2,2),(24,198,78,30.00,1,2),(25,191,4,1344.00,2,2),(25,191,29,1344.00,2,2),(25,191,68,1344.00,1,2),(25,191,78,1344.00,2,2),(26,191,4,1056.00,2,2),(26,191,29,1056.00,2,2),(26,191,68,1056.00,1,2),(26,191,78,1056.00,2,2),(27,198,4,30.00,1,2),(27,198,29,30.00,1,2),(27,198,68,30.00,2,2),(27,198,78,30.00,1,2),(28,191,4,1680.00,2,2),(28,191,29,1680.00,2,2),(28,191,68,1680.00,1,2),(28,191,78,1680.00,2,2),(29,191,4,1320.00,2,2),(29,191,29,1320.00,2,2),(29,191,68,1320.00,1,2),(29,191,78,1320.00,2,2),(30,198,4,30.00,1,2),(30,198,29,30.00,1,2),(30,198,68,30.00,2,2),(30,198,78,30.00,1,2),(31,191,4,1680.00,2,2),(31,191,29,1680.00,2,2),(31,191,68,1680.00,1,2),(31,191,78,1680.00,2,2),(32,191,4,1320.00,2,2),(32,191,29,1320.00,2,2),(32,191,68,1320.00,1,2),(32,191,78,1320.00,2,2),(33,198,4,30.00,1,2),(33,198,29,30.00,1,2),(33,198,68,30.00,2,2),(33,198,78,30.00,1,2),(34,191,4,1680.00,2,2),(34,191,29,1680.00,2,2),(34,191,68,1680.00,1,2),(34,191,78,1680.00,2,2),(35,191,4,1320.00,2,2),(35,191,29,1320.00,2,2),(35,191,68,1320.00,1,2),(35,191,78,1320.00,2,2),(36,198,4,30.00,1,2),(36,198,29,30.00,1,2),(36,198,68,30.00,2,2),(36,198,78,30.00,1,2),(37,191,4,1344.00,2,2),(37,191,29,1344.00,2,2),(37,191,68,1344.00,1,2),(37,191,78,1344.00,2,2),(38,191,4,1056.00,2,2),(38,191,29,1056.00,2,2),(38,191,68,1056.00,1,2),(38,191,78,1056.00,2,2),(39,198,4,30.00,1,2),(39,198,29,30.00,1,2),(39,198,68,30.00,2,2),(39,198,78,30.00,1,2),(40,191,4,1680.00,2,2),(40,191,29,1680.00,2,2),(40,191,68,1680.00,1,2),(40,191,78,1680.00,2,2),(41,191,4,1320.00,2,2),(41,191,29,1320.00,2,2),(41,191,68,1320.00,1,2),(41,191,78,1320.00,2,2),(42,198,4,30.00,1,2),(42,198,29,30.00,1,2),(42,198,68,30.00,2,2),(42,198,78,30.00,1,2),(43,191,4,1680.00,2,2),(43,191,29,1680.00,2,2),(43,191,68,1680.00,1,2),(43,191,78,1680.00,2,2),(44,191,4,1320.00,2,2),(44,191,29,1320.00,2,2),(44,191,68,1320.00,1,2),(44,191,78,1320.00,2,2),(45,198,4,30.00,1,2),(45,198,29,30.00,1,2),(45,198,68,30.00,2,2),(45,198,78,30.00,1,2),(46,191,4,1344.00,2,2),(46,191,29,1344.00,2,2),(46,191,68,1344.00,1,2),(46,191,78,1344.00,2,2),(47,191,4,1056.00,2,2),(47,191,29,1056.00,2,2),(47,191,68,1056.00,1,2),(47,191,78,1056.00,2,2),(48,198,4,30.00,1,2),(48,198,29,30.00,1,2),(48,198,68,30.00,2,2),(48,198,78,30.00,1,2),(49,191,4,1344.00,2,2),(49,191,29,1344.00,2,2),(49,191,68,1344.00,1,2),(49,191,78,1344.00,2,2),(50,191,4,1056.00,2,2),(50,191,29,1056.00,2,2),(50,191,68,1056.00,1,2),(50,191,78,1056.00,2,2),(51,198,4,30.00,1,2),(51,198,29,30.00,1,2),(51,198,68,30.00,2,2),(51,198,78,30.00,1,2),(52,191,4,1680.00,2,2),(52,191,29,1680.00,2,2),(52,191,68,1680.00,1,2),(52,191,78,1680.00,2,2),(53,191,4,1320.00,2,2),(53,191,29,1320.00,2,2),(53,191,68,1320.00,1,2),(53,191,78,1320.00,2,2),(54,198,4,30.00,1,2),(54,198,29,30.00,1,2),(54,198,68,30.00,2,2),(54,198,78,30.00,1,2),(55,191,4,1344.00,2,2),(55,191,29,1344.00,2,2),(55,191,68,1344.00,1,2),(55,191,78,1344.00,2,2),(56,191,4,1056.00,2,2),(56,191,29,1056.00,2,2),(56,191,68,1056.00,1,2),(56,191,78,1056.00,2,2),(57,198,4,30.00,1,2),(57,198,29,30.00,1,2),(57,198,68,30.00,2,2),(57,198,78,30.00,1,2),(58,191,4,1344.00,2,2),(58,191,29,1344.00,2,2),(58,191,68,1344.00,1,2),(58,191,78,1344.00,2,2),(59,191,4,1056.00,2,2),(59,191,29,1056.00,2,2),(59,191,68,1056.00,1,2),(59,191,78,1056.00,2,2),(60,198,4,30.00,1,2),(60,198,29,30.00,1,2),(60,198,68,30.00,2,2),(60,198,78,30.00,1,2),(61,191,4,1680.00,2,2),(61,191,29,1680.00,2,2),(61,191,68,1680.00,1,2),(61,191,78,1680.00,2,2),(62,191,4,1320.00,2,2),(62,191,29,1320.00,2,2),(62,191,68,1320.00,1,2),(62,191,78,1320.00,2,2),(63,198,4,30.00,1,2),(63,198,29,30.00,1,2),(63,198,68,30.00,2,2),(63,198,78,30.00,1,2),(64,191,4,500.00,2,2),(64,191,29,500.00,2,2),(64,191,68,500.00,1,2),(64,191,78,500.00,2,2),(65,191,4,500.00,2,2),(65,191,29,500.00,2,2),(65,191,68,500.00,1,2),(65,191,78,500.00,2,2),(66,179,4,200.00,2,2),(66,179,29,200.00,2,2),(66,179,68,200.00,1,2),(66,179,78,200.00,2,2),(67,179,4,40.00,2,2),(67,179,29,40.00,2,2),(67,179,68,40.00,1,2),(67,179,78,40.00,2,2),(68,180,4,1000.00,2,2),(68,180,29,1000.00,2,2),(68,180,68,1000.00,1,2),(68,180,78,1000.00,2,2),(69,178,4,2000.00,2,2),(69,178,29,2000.00,2,2),(69,178,68,2000.00,1,2),(69,178,78,2000.00,2,2),(70,179,4,1000.00,2,2),(70,179,29,1000.00,2,2),(70,179,68,1000.00,1,2),(70,179,78,1000.00,2,2),(71,179,4,100.00,2,2),(71,179,29,100.00,2,2),(71,179,68,100.00,1,2),(71,179,78,100.00,2,2),(72,191,4,5000.00,2,2),(72,191,29,5000.00,2,2),(72,191,68,5000.00,1,2),(72,191,78,5000.00,2,2),(73,191,4,5000.00,2,2),(73,191,29,5000.00,2,2),(73,191,68,5000.00,1,2),(73,191,78,5000.00,2,2),(74,191,4,50.00,2,2),(74,191,29,50.00,2,2),(74,191,68,50.00,1,2),(74,191,78,50.00,2,2),(75,191,68,50.00,1,1),(75,191,78,50.00,2,1),(76,191,4,1000.00,2,2),(76,191,29,1000.00,2,2),(76,191,68,1000.00,1,2),(76,191,78,1000.00,2,2),(77,182,4,500.00,2,2),(77,182,29,500.00,2,2),(77,182,68,500.00,1,2),(77,182,78,500.00,2,2),(78,182,68,300.00,1,1),(78,182,78,300.00,2,1),(79,191,68,900.00,1,1),(79,191,78,900.00,2,1),(80,198,68,900.00,2,1),(80,198,78,900.00,1,1),(81,191,68,1000.00,1,1),(81,191,78,1000.00,2,1),(82,182,68,500.00,1,1),(82,182,78,500.00,2,1),(83,191,4,1000.00,2,2),(83,191,29,1000.00,2,2),(83,191,68,1000.00,1,2),(83,191,78,1000.00,2,2),(84,191,4,1000.00,2,2),(84,191,29,1000.00,2,2),(84,191,68,1000.00,1,2),(84,191,78,1000.00,2,2),(85,179,4,700.00,2,2),(85,179,29,700.00,2,2),(85,179,68,700.00,1,2),(85,179,78,700.00,2,2),(86,191,4,1000.00,2,2),(86,191,29,1000.00,2,2),(86,191,68,1000.00,1,2),(86,191,78,1000.00,2,2),(87,179,4,700.00,2,2),(87,179,29,700.00,2,2),(87,179,68,700.00,1,2),(87,179,78,700.00,2,2),(88,191,4,1000.00,2,2),(88,191,29,1000.00,2,2),(88,191,68,1000.00,1,2),(88,191,78,1000.00,2,2),(89,179,4,700.00,2,2),(89,179,29,700.00,2,2),(89,179,68,700.00,1,2),(89,179,78,700.00,2,2),(90,191,68,300.00,1,1),(90,191,78,300.00,2,1),(91,191,4,1000.00,2,2),(91,191,29,1000.00,2,2),(91,191,68,1000.00,1,2),(91,191,78,1000.00,2,2),(92,179,4,700.00,2,2),(92,179,29,700.00,2,2),(92,179,68,700.00,1,2),(92,179,78,700.00,2,2),(93,191,4,1000.00,2,2),(93,191,29,1000.00,2,2),(93,191,68,1000.00,1,2),(93,191,78,1000.00,2,2),(94,182,4,500.00,2,2),(94,182,29,500.00,2,2),(94,182,68,500.00,1,2),(94,182,78,500.00,2,2),(95,179,4,700.00,2,2),(95,179,29,700.00,2,2),(95,179,68,700.00,1,2),(95,179,78,700.00,2,2),(96,191,4,1000.00,2,2),(96,191,29,1000.00,2,2),(96,191,68,1000.00,1,2),(96,191,78,1000.00,2,2),(97,179,4,600.00,2,2),(97,179,29,600.00,2,2),(97,179,68,600.00,1,2),(97,179,78,600.00,2,2),(98,179,4,400.00,2,2),(98,179,29,400.00,2,2),(98,179,68,400.00,1,2),(98,179,78,400.00,2,2),(99,179,4,200.00,2,2),(99,179,29,200.00,2,2),(99,179,68,200.00,1,2),(99,179,78,200.00,2,2),(100,191,4,200.00,2,2),(100,191,29,200.00,2,2),(100,191,68,200.00,1,2),(100,191,78,200.00,2,2),(101,191,4,1000.00,2,2),(101,191,29,1000.00,2,2),(101,191,68,1000.00,1,2),(101,191,78,1000.00,2,2),(102,182,4,500.00,2,2),(102,182,29,500.00,2,2),(102,182,68,500.00,1,2),(102,182,78,500.00,2,2),(103,179,68,700.00,1,1),(103,179,78,700.00,2,1),(104,191,68,1000.00,1,1),(104,191,78,1000.00,2,1),(105,182,68,500.00,1,1),(105,182,78,500.00,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,75,1,NULL,NULL,NULL,50.00,'D',1),(2,78,1,NULL,NULL,NULL,300.00,'D',1),(3,79,1,NULL,NULL,NULL,900.00,'D',1),(4,80,1,NULL,NULL,NULL,900.00,'C',1),(5,81,1,NULL,NULL,NULL,1000.00,'D',1),(6,82,1,NULL,NULL,NULL,500.00,'D',1),(7,90,1,NULL,NULL,NULL,300.00,'D',1),(8,103,1,NULL,NULL,NULL,700.00,'D',1),(9,104,1,NULL,NULL,NULL,1000.00,'D',1),(10,105,1,NULL,NULL,NULL,500.00,'D',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(5,5,'Prestação de serviços','S',0,1,1),(6,NULL,'Compra de Mercadorias para revenda','E',0,0,0),(7,NULL,'Prestação de Serviço','S',0,0,0),(8,NULL,'Venda de Mercadorias','S',1,1,1),(9,NULL,'Teste exclusão','E',1,1,1);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,97,9),(2,99,5),(2,100,6),(3,119,3),(3,120,4),(3,121,10),(4,122,7),(4,123,8),(5,98,9),(5,95,11),(5,96,12),(6,119,3),(8,93,1);
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
INSERT INTO `operacao_empresa` VALUES (1,1,1,0,0),(1,2,2,0,0),(2,1,1,1,0),(2,2,2,1,0),(3,1,1,1,0),(3,2,2,1,0),(4,1,1,1,0),(4,2,2,1,0),(5,1,1,1,0),(5,2,2,1,0),(6,1,NULL,1,0),(6,2,NULL,1,0),(7,1,NULL,1,0),(7,2,2,1,0),(8,1,NULL,1,0),(8,2,2,1,0),(9,1,NULL,0,1),(9,2,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato`
--

LOCK TABLES `parceiro_contrato` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato` DISABLE KEYS */;
INSERT INTO `parceiro_contrato` VALUES (2,1,14,'','Maximus - Atendimento próprio - Faturamento via Sommus - Recebe da Sommus - Comissão percentual único',2,1,2,1,0.0000,5.0000,'2017-01-01','2022-01-01',1,2,'',1,0),(3,1,15,'','W2 - Atendimento via Sommus - Faturamento próprio - Paga à Sommus - Percentual em produtos e serviços',1,1,1,2,0.0000,5.0000,'2017-01-01','2022-01-01',1,2,'',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_faixa`
--

LOCK TABLES `parceiro_contrato_faixa` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_faixa` DISABLE KEYS */;
INSERT INTO `parceiro_contrato_faixa` VALUES (6,2,1,0.00,2000.00,25.5000),(7,2,1,2001.00,4000.00,23.5000),(8,2,1,4001.00,6000.00,21.5000),(9,2,1,6001.00,10000.00,18.5000),(10,2,1,10001.00,50000.00,15.0000),(11,3,1,0.00,2000.00,25.5000),(12,3,1,2001.00,4000.00,23.5000),(13,3,1,4001.00,6000.00,21.5000),(14,3,1,6001.00,10000.00,18.5000),(15,3,1,10001.00,50000.00,15.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_produto`
--

LOCK TABLES `parceiro_contrato_produto` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_produto` DISABLE KEYS */;
INSERT INTO `parceiro_contrato_produto` VALUES (4,2,1,0,1,20.0000),(5,2,4,0,1,20.0000),(6,2,3,0,1,20.0000),(7,3,1,0,1,20.0000),(8,3,4,0,1,20.0000),(9,3,3,0,1,20.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_servico`
--

LOCK TABLES `parceiro_contrato_servico` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_servico` DISABLE KEYS */;
INSERT INTO `parceiro_contrato_servico` VALUES (7,2,1004,1,30.0000),(8,2,1003,1,30.0000),(9,2,1002,1,30.0000),(10,2,1001,1,30.0000),(11,2,901,1,30.0000),(12,2,2,1,30.0000),(13,3,1004,1,20.0000),(14,3,1003,1,20.0000),(15,3,1002,1,20.0000),(16,3,1001,1,20.0000),(17,3,901,1,20.0000),(18,3,2,1,20.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Sommus Automacao Comercial Ltda - Me','Sommus Sistemas',NULL,'','04717475000154','ISENTO','','',0,'','','','','0001-01-01',0,1,'0001-01-01 00:00:00'),(2,'J',0,'Geralda Aparecida de Miranda Silva 99553082653','TEMPERO CRISTALINA',NULL,'','24634181000176','0027467430027','','',0,'','','','','0001-01-01',0,2,'0001-01-01 00:00:00'),(3,'J',1,'João das Couve','João das Couve',NULL,'','99999999000191','Isento','','',9,'','','','','0001-01-01',0,0,'2022-10-04 16:38:17'),(4,'F',3,'João das Couve','','12345678909','AC1593852',NULL,'','','',9,'','','','','1995-01-01',0,0,'2022-10-04 16:38:18'),(5,'J',2,'Sommus Automação Comercial LTDA','Sommus Sistemas',NULL,'','89757601000157','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:18'),(6,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-10-04 16:38:18'),(7,'J',2,'teste','teste',NULL,'','88184259000180','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:20'),(8,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','',9,'','','','','1999-11-29',0,0,'2022-10-04 16:38:21'),(9,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,'2022-10-04 16:38:22'),(10,'F',0,'Jose da Silva','','33001998598','',NULL,'','','',0,'153153','','','','1999-11-29',0,0,'2022-10-04 16:38:22'),(11,'F',0,'Francisco','','01716124859','',NULL,'','','',0,'888888','','','','1999-12-25',0,0,'2022-10-04 16:38:23'),(12,'J',0,'Patrimonium Contabilidade','',NULL,'','47717436000160','','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:23'),(13,'J',0,'Aliber Máquinas LTDA ME','Aliber Sistemas',NULL,'','25940685000187','6996508370046','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:26'),(14,'J',0,'Maximus Informática','Maximus Informática',NULL,'','09285455000175','0010572290063','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:26'),(15,'F',0,'Wilson de Castro','W2','06981129620','13852332',NULL,'','','',0,'','','','','1992-10-04',0,0,'2022-10-04 16:38:26'),(16,'J',0,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:32'),(17,'J',1,'Barry Transports (Excluido)','The Flash',NULL,'','18494232000109','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-10-04 16:38:32'),(18,'F',0,'Joseph Climber','','09848920013','MG25153155',NULL,'','','',0,'','','','','1999-08-04',1,0,'2022-10-04 16:38:44'),(19,'F',0,'Trabalhador 01','','22280798042','MG559718592',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:41'),(20,'F',0,'Trabalhador 02','','73545802361','MG348088735',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:41'),(21,'F',0,'Trabalhador 03','','98713643690','MG946715343',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:41'),(22,'F',0,'Trabalhador 04','','38467924381','MG161893355',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:41'),(23,'F',0,'Trabalhador 05','','57717809524','MG789256165',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:41'),(24,'F',0,'Trabalhador 06','','45493042606','MG615132467',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(25,'F',0,'Trabalhador 07','','54280862540','MG256754638',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(26,'F',0,'Trabalhador 08','','83670934960','MG985144785',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(27,'F',0,'Trabalhador 09','','89805402487','MG643162661',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(28,'F',0,'Trabalhador 10','','12610528116','MG750491427',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(29,'F',0,'Trabalhador 11','','90498435148','MG912557885',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(30,'F',0,'Trabalhador 12','','46287283645','MG184027538',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:42'),(31,'F',0,'Trabalhador 13','','48233462977','MG899020265',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(32,'F',0,'Trabalhador 14','','26302018560','MG683527923',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(33,'F',0,'Trabalhador 15','','96831749909','MG374709530',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(34,'F',0,'Trabalhador 16','','58861686567','MG544303496',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(35,'F',0,'Trabalhador 17','','63985608920','MG321549841',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(36,'F',0,'Trabalhador 18','','90493872256','MG304046445',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:43'),(37,'F',0,'Trabalhador 19','','36231852563','MG868818364',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-10-04 16:38:44'),(38,'F',0,'Colaborador teste relação entre lançamentos 1','','86652485010','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,'2022-10-04 16:38:45'),(39,'F',0,'Colaborador teste relação entre lançamentos 2','','87902241083','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,'2022-10-04 16:38:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,1,2,'(037) 3261-9150',''),(2,2,2,2,'03732619150',''),(3,5,0,2,'(037) 3261-9150',''),(4,6,0,1,'(037) 2594-1157',''),(6,8,0,2,'(011) 4191-4433',''),(8,9,0,2,'(011) 4191-4433',''),(9,10,0,2,'(037) 3261-9150',''),(10,10,0,6,'(037) 3261-9150',''),(11,10,0,4,'sommus@sommus.com',''),(12,11,0,2,'(037) 3261-2003',''),(13,11,0,6,'(037) 3261-2003',''),(14,11,0,4,'desenvolvimento1@sommus.com',''),(18,12,0,2,'(037) 3261-9450',''),(19,12,0,6,'(037) 3261-2003',''),(20,12,0,4,'atendimento@patrimoniumcontabilidade.com.br',''),(22,14,0,2,'(32) 3531-5523',''),(23,15,0,2,'(37) 99197-3003',''),(24,13,0,2,'(32) 3531-5523',''),(26,16,0,4,'sommus@sommus.com',''),(28,19,0,2,'(011) 5482-5485',''),(29,20,0,2,'(011) 5482-5485',''),(30,21,0,2,'(011) 5482-5485',''),(31,22,0,2,'(011) 5482-5485',''),(32,23,0,2,'(011) 5482-5485',''),(33,24,0,2,'(011) 5482-5485',''),(34,25,0,2,'(011) 5482-5485',''),(35,26,0,2,'(011) 5482-5485',''),(36,27,0,2,'(011) 5482-5485',''),(37,28,0,2,'(011) 5482-5485',''),(38,29,0,2,'(011) 5482-5485',''),(39,30,0,2,'(011) 5482-5485',''),(40,31,0,2,'(011) 5482-5485',''),(41,32,0,2,'(011) 5482-5485',''),(42,33,0,2,'(011) 5482-5485',''),(43,34,0,2,'(011) 5482-5485',''),(44,35,0,2,'(011) 5482-5485',''),(45,36,0,2,'(011) 5482-5485',''),(46,37,0,2,'(011) 5482-5485',''),(47,18,0,2,'(011) 3458-8875','');
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
INSERT INTO `pessoa_empresa` VALUES (3,1,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(5,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(8,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(8,2,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,1,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,2,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(10,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,1,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(12,1,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(12,2,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(13,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(13,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(14,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(15,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(16,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(17,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(18,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(18,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,1,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35580000','Lagoa da Prata','MG','3137205','',1),(2,2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',0),(3,2,3,'Av. Brasil','328','Centro','2º Andar','35590000','Lagoa da Prata','MG','3137205','',1),(5,3,0,'Av. Brasil','555','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(6,5,0,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35580000','Lagoa da Prata','MG','','',1),(7,6,0,'Av. Brasil','555','Centro','Loja 1','35580000','Lagoa da Prata','MG','3137205','',1),(9,8,0,'Av. Chedid Jafet','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1),(11,9,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1),(12,10,0,'Av. Brasil','33','Centro','Loja 1','35590000','Lagoa da Prata','MG','3137205','',1),(13,11,0,'Av. Modesto Gomes','52','Centro','Casa','35590000','Lagoa da Prata','MG','3137205','',1),(15,12,0,'Praça Coronel Carlos Bernardes','15','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(17,14,0,'Rua da Flores','352','Centro','','39680000','Capelinha','MG','','',1),(18,15,0,'Av. Joaquim Gomes Pereira','774','Gomes','','35590000','Lagoa da Prata','MG','','',1),(19,13,0,'Av. Cristiano Rocas','52','Centro','','36500000','Ubá','MG','','',1),(21,16,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1),(23,19,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(24,20,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(25,21,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(26,22,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(27,23,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(28,24,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(29,25,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(30,26,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(31,27,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(32,28,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(33,29,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(34,30,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(35,31,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(36,32,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(37,33,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(38,34,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(39,35,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(40,36,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(41,37,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(42,18,0,'Rua Bahia','2015','Centro','Edifício JK','04551065','Rio de Janeiro','RJ','','',1);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,8,''),(3,NULL,8,''),(4,NULL,8,''),(5,NULL,2,''),(6,NULL,2,''),(7,NULL,2,''),(8,NULL,1,''),(9,NULL,5,''),(11,NULL,4,''),(12,NULL,6,''),(13,NULL,1,''),(13,NULL,9,''),(14,NULL,2,''),(14,NULL,9,''),(15,NULL,2,''),(15,NULL,9,''),(16,NULL,3,'filial XX'),(17,NULL,3,''),(18,NULL,7,''),(19,NULL,7,''),(20,NULL,7,''),(21,NULL,7,''),(22,NULL,7,''),(23,NULL,7,''),(24,NULL,7,''),(25,NULL,7,''),(26,NULL,7,''),(27,NULL,7,''),(28,NULL,7,''),(29,NULL,7,''),(30,NULL,7,''),(31,NULL,7,''),(32,NULL,7,''),(33,NULL,7,''),(34,NULL,7,''),(35,NULL,7,''),(36,NULL,7,''),(37,NULL,7,''),(38,NULL,7,''),(39,NULL,7,'');
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
INSERT INTO `pessoa_veiculo` VALUES (8,1),(8,2);
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-10-04 16:38:14'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-10-04 16:38:14'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-10-04 16:38:14'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-10-04 16:38:14');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,NULL,'SommusGestor','SommusGestor',0,NULL,'',1,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:30'),(2,NULL,'Treinamento Online','Treinamento Online',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:30'),(3,NULL,'SommusVendas (Mobile)','SommusVendas (Mobile)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:29'),(4,NULL,'SommusVendas (Desktop)','SommusVendas (Desktop)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:29'),(901,NULL,'Suporte técnico','Suporte técnico',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1001,NULL,'Outro serviço','Outro serviço',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1002,NULL,'Implantação','Implantação em loco',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1003,NULL,'Customização','Customização por hora',9,2,'',3,NULL,0,'','','','','0104',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1004,NULL,'Consultoria','Consultoria Fiscal',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1005,NULL,'Teste exclusão','Teste exclusão',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:25'),(1006,NULL,'Teste exclusão','',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-10-04 16:38:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_desconto`
--

LOCK TABLES `produto_desconto` WRITE;
/*!40000 ALTER TABLE `produto_desconto` DISABLE KEYS */;
INSERT INTO `produto_desconto` VALUES (1,1,1,1,5,10.0000),(2,1,1,1,10,20.0000),(3,1,1,1,35,40.0000),(4,1,1,2,15,30.0000),(5,1,1,2,40,50.0000),(6,1,2,2,15,30.0000),(7,1,2,2,40,50.0000);
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
INSERT INTO `produto_empresa` VALUES (1,1,0,1,0),(2,1,0,1,0),(3,1,0,1,0),(4,1,0,1,0),(901,1,0,1,0),(1001,1,0,1,0),(1001,2,0,1,0),(1002,1,0,1,0),(1002,2,0,1,0),(1003,1,0,1,0),(1003,2,0,1,0),(1004,1,0,1,0),(1004,2,0,1,0),(1005,1,0,0,1),(1005,2,0,0,1),(1006,1,0,0,1),(1006,2,0,0,1);
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
INSERT INTO `produto_fornecedor` VALUES (2,1,'10');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Cereais alterados','2022-10-04 16:38:30'),(2,'Enlatados','2022-10-04 16:38:24'),(3,'Serviços de Suporte','2022-10-04 16:38:24'),(4,'Higiene','2022-10-04 16:38:23');
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
INSERT INTO `produto_grupo_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
INSERT INTO `produto_preco` VALUES (1,2,0,NULL,1,0.0000,0.0000,0.0000,20.0000,0.0000,0.0000,0.0000),(2,901,0,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(3,1,0,NULL,1,0.0000,0.0000,0.0000,20.0000,0.0000,0.0000,0.0000),(4,1,1,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(5,1,2,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(6,1,3,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(7,1,4,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(8,1,5,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(9,1,6,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(10,1,7,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(11,1,8,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(12,1,9,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(13,1,10,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(14,1,11,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(15,3,0,NULL,1,0.0000,0.0000,0.0000,30.0000,0.0000,0.0000,0.0000),(16,4,0,NULL,1,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(17,1001,0,NULL,1,0.0000,0.0000,0.0000,0.7000,0.0000,0.0000,0.0000),(18,1002,0,NULL,1,0.0000,0.0000,0.0000,500.0000,0.0000,0.0000,0.0000),(19,1003,0,NULL,1,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(20,1004,0,NULL,1,0.0000,0.0000,0.0000,350.0000,0.0000,0.0000,0.0000),(21,1004,0,NULL,2,0.0000,0.0000,0.0000,350.0000,0.0000,0.0000,0.0000),(22,1003,0,NULL,2,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(23,1002,0,NULL,2,0.0000,0.0000,0.0000,500.0000,0.0000,0.0000,0.0000),(24,1001,0,NULL,2,0.0000,0.0000,0.0000,0.7000,0.0000,0.0000,0.0000);
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
INSERT INTO `produto_sped` VALUES (1,1006,'Teste exclusão','2022-10-04','0001-01-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
INSERT INTO `produto_unidade` VALUES (1,'Caixa','CX',0,'2022-10-04 16:38:24'),(2,'Pacote','PCT',0,'2022-10-04 16:38:24'),(3,'Teste','Test',0,'2022-10-04 16:38:24');
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
INSERT INTO `produto_unidade_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
INSERT INTO `regra_tributaria` VALUES (1,'Produtos Monofasicos','P',1,0),(2,'Serviços isentos','S',1,0),(3,'Produtos Tributados','P',1,0),(4,'Serviços Tributados','S',1,0),(5,'Grupo excluido','P',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(31,2,5,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',60,''),(32,3,6,2,'MG','Compra de Mercadorias Tributadas',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(33,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(34,4,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,'');
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
INSERT INTO `regra_tributaria_operacao_empresa` VALUES (1,1),(1,2),(2,1),(2,2),(4,1),(4,2),(5,1),(5,2),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2),(9,1),(9,2),(10,1),(10,2),(11,1),(11,2),(12,1),(12,2),(13,1),(13,2),(14,1),(14,2),(15,1),(15,2),(16,1),(16,2),(17,1),(17,2),(18,1),(18,2),(19,1),(19,2),(20,1),(20,2),(21,1),(21,2),(22,1),(22,2),(23,1),(23,2),(24,1),(24,2),(25,1),(25,2),(26,1),(26,2),(27,1),(27,2),(28,1),(28,2),(29,1),(29,2),(30,1),(30,2),(31,1),(31,2),(32,1),(32,2),(33,1),(33,2),(34,1),(34,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_meta`
--

LOCK TABLES `vendedor_meta` WRITE;
/*!40000 ALTER TABLE `vendedor_meta` DISABLE KEYS */;
INSERT INTO `vendedor_meta` VALUES (2,9,1,'201909',8290.30);
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
) ENGINE=InnoDB AUTO_INCREMENT=1098 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
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

-- Dump completed on 2022-10-04 16:51:37