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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato`
--

LOCK TABLES `cliente_contrato` WRITE;
/*!40000 ALTER TABLE `cliente_contrato` DISABLE KEYS */;
INSERT INTO `cliente_contrato` VALUES (1,1,40,3,1004,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,0.00,15.0000,0.0000,1,2,2,1,1,2,2,1,1,1,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(2,1,2,NULL,1004,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,2,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0),(3,1,2,NULL,1002,NULL,1,119,NULL,'2021-11-23','2024-11-23','2022-11-25','0001-01-01',15,680.06,0.0000,5.0000,2,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(4,1,2,NULL,1003,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,0.00,10.0000,0.0000,1,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(5,1,6,2,1002,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,0.00,75.0000,0.0000,1,2,2,1,1,2,2,1,1,1,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(6,1,6,NULL,1004,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,0.00,35.0000,0.0000,1,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(7,1,4,NULL,1002,NULL,1,119,NULL,'2021-10-23','2024-11-23','2022-11-25','0001-01-01',15,695.18,0.0000,5.0000,3,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(8,1,49,NULL,901,1,2,104,NULL,'2022-11-23','2024-11-23','0001-01-01','0001-01-01',15,150.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'Cliente satisfeito com o atendimento',1,0),(9,1,4,NULL,901,1,2,104,NULL,'2022-11-23','2024-11-23','0001-01-01','0001-01-01',15,50.00,0.0000,0.0000,2,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(10,1,4,NULL,2,NULL,2,104,NULL,'2022-11-23','2024-11-23','0001-01-01','0001-01-01',15,90.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(11,1,8,NULL,2,NULL,2,104,NULL,'2022-11-23','2024-11-23','0001-01-01','0001-01-01',15,160.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(12,1,49,NULL,2,NULL,2,104,NULL,'2022-11-23','0001-01-01','0001-01-01','0001-01-01',15,230.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(13,1,10,NULL,2,NULL,2,104,NULL,'2022-11-23','2024-11-23','0001-01-01','0001-01-01',15,90.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_atividade`
--

LOCK TABLES `cliente_contrato_atividade` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_atividade` DISABLE KEYS */;
INSERT INTO `cliente_contrato_atividade` VALUES (1,1,NULL,1,'2022-11-23 10:20:44',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(2,1,NULL,1,'2022-11-23 10:20:44',3,'',0.00,15.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(3,3,NULL,1,'2022-11-23 10:20:45',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(4,3,NULL,1,'2022-11-23 10:20:45',3,'',640.00,0.0000,5.0000,'0001-01-01','0001-01-01',0,0,NULL),(5,4,NULL,1,'2022-11-23 10:20:45',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(6,4,NULL,1,'2022-11-23 10:20:45',3,'',0.00,10.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(7,5,NULL,1,'2022-11-23 10:20:45',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(8,5,NULL,1,'2022-11-23 10:20:45',3,'',0.00,75.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(9,6,NULL,1,'2022-11-23 10:20:45',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(10,6,NULL,1,'2022-11-23 10:20:45',3,'',0.00,35.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(11,7,NULL,1,'2022-11-23 10:20:45',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(12,7,NULL,1,'2022-11-23 10:20:45',3,'',675.00,0.0000,5.0000,'0001-01-01','0001-01-01',0,0,NULL),(13,8,1,1,'2022-11-23 10:20:46',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(14,12,2,1,'2022-11-23 10:20:47',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(15,8,1,1,'2022-11-23 10:20:47',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',5,0,NULL),(16,8,1,1,'2022-11-23 10:20:47',9,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(17,8,1,1,'2022-11-23 10:20:47',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',6,0,NULL),(18,8,1,1,'2022-11-23 10:20:47',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',7,0,NULL),(19,8,1,1,'2022-11-23 10:20:47',9,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(20,8,1,1,'2022-11-23 10:20:48',8,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',6,0,NULL),(21,8,1,1,'2022-11-23 10:20:48',8,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',7,0,NULL),(22,8,1,1,'2022-11-23 10:20:48',10,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(23,5,NULL,1,'2022-11-23 10:20:48',4,'Carência solicidata pelo cliente.',0.00,0.0000,0.0000,'2022-11-01','2022-11-30',0,0,NULL),(24,8,1,1,'2022-11-23 10:20:48',4,'Carência promocional.',0.00,0.0000,0.0000,'2022-11-23','2022-12-03',0,0,NULL),(25,5,NULL,1,'2022-11-23 10:20:48',5,'Cliente pediu mais prazo pra pagar.',0.00,0.0000,0.0000,'2022-11-01','2022-12-31',0,0,NULL),(26,8,1,1,'2022-11-23 10:20:48',5,'Cliente pediu mais tempo pra pagar.',0.00,0.0000,0.0000,'2022-11-23','2022-12-13',0,0,NULL),(27,5,NULL,1,'2022-11-23 10:20:48',6,'Carência cancelada por decisão da equipe comercial',0.00,0.0000,0.0000,'2022-11-01','2022-12-31',0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_contrato_carencia`
--

LOCK TABLES `cliente_contrato_carencia` WRITE;
/*!40000 ALTER TABLE `cliente_contrato_carencia` DISABLE KEYS */;
INSERT INTO `cliente_contrato_carencia` VALUES (2,8,'2022-11-23','2022-12-13');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_contrato`
--

LOCK TABLES `colaborador_contrato` WRITE;
/*!40000 ALTER TABLE `colaborador_contrato` DISABLE KEYS */;
INSERT INTO `colaborador_contrato` VALUES (1,2,18,1,2,'2022-11-23','0001-01-01','',2000.00),(2,2,19,NULL,4,'2022-11-23','0001-01-01','',3000.00),(3,2,20,NULL,4,'2022-11-23','0001-01-01','',3000.00),(4,2,21,NULL,3,'2022-11-23','0001-01-01','',2400.00),(5,2,22,NULL,4,'2022-11-23','0001-01-01','',3000.00),(6,2,23,NULL,4,'2022-11-23','0001-01-01','',3000.00),(7,2,24,NULL,4,'2022-11-23','0001-01-01','',3000.00),(8,2,25,NULL,3,'2022-11-23','0001-01-01','',2400.00),(9,2,26,NULL,4,'2022-11-23','0001-01-01','',3000.00),(10,2,27,NULL,3,'2022-11-23','0001-01-01','',2400.00),(11,2,28,NULL,3,'2022-11-23','0001-01-01','',2400.00),(12,2,29,NULL,4,'2022-11-23','0001-01-01','',3000.00),(13,2,30,NULL,4,'2022-11-23','0001-01-01','',3000.00),(14,2,31,NULL,4,'2022-11-23','0001-01-01','',3000.00),(15,2,32,NULL,3,'2022-11-23','0001-01-01','',2400.00),(16,2,33,NULL,4,'2022-11-23','0001-01-01','',3000.00),(17,2,34,NULL,3,'2022-11-23','0001-01-01','',2400.00),(18,2,35,NULL,3,'2022-11-23','0001-01-01','',2400.00),(19,2,36,NULL,4,'2022-11-23','0001-01-01','',3000.00),(20,2,37,NULL,3,'2022-11-23','0001-01-01','',2400.00),(21,2,38,NULL,5,'2022-11-23','0001-01-01','',900.00),(22,2,39,NULL,5,'2022-11-23','0001-01-01','',900.00),(23,2,50,NULL,1,'2022-11-23','0001-01-01','',900.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso`
--

LOCK TABLES `compromisso` WRITE;
/*!40000 ALTER TABLE `compromisso` DISABLE KEYS */;
INSERT INTO `compromisso` VALUES (1,0,'','0001-01-01 00:00:00','0001-01-01 00:00:00',0,NULL,0),(2,0,'','0001-01-01 00:00:00','0001-01-01 00:00:00',0,NULL,0),(3,1,'Feedback Joseph Climber','2021-01-01 02:01:01','2021-01-01 03:01:01',0,NULL,0),(4,1,'Reunião com a equipe de Desenvolvimento','2021-01-01 04:01:01','2021-01-01 05:01:01',0,NULL,0),(5,1,'Reunião com a equipe de Treinamento','2021-01-01 05:01:01','2021-01-01 06:01:01',0,NULL,0),(6,1,'Reunião com a equipe Comercial','2021-01-01 06:01:01','2021-01-01 07:01:01',0,NULL,0),(7,1,'Reunião com a equipe de Suporte','2021-01-01 07:01:01','2021-01-01 08:01:01',0,NULL,0),(8,1,'Devolutiva do Feedback Joseph Climber','2021-01-03 02:01:01','2021-01-03 03:01:01',0,NULL,0),(9,1,'Visita ao cliente VAP','2020-12-31 02:01:01','2020-12-31 03:01:01',1,NULL,0),(10,1,'Prospecção','2020-12-31 01:01:01','2020-12-31 04:01:01',1,NULL,0),(11,1,'Oferecer SommusBackup à Original Fit LTDA','2020-12-30 01:01:01','2020-12-30 01:31:01',1,NULL,0),(12,1,'Feedback Joseph Climber (excluido)','2021-01-06 01:01:01','2021-01-06 03:01:01',0,NULL,0);
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
INSERT INTO `configuracao` VALUES (1,1,6,0,'','',980.00,2,104,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,NULL,0,0,3,3,1,3,'','',3,NULL,NULL,0,0,0,'',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0),(2,1,0,0,'','0RgbeJakItH1yf3PMKx30Q==',100.00,1,104,NULL,0.0000,0,0,0.0000,0,0,0,0.0000,0,0,NULL,0,0,0,0,8,0,'','',0,NULL,NULL,1,1,1,'',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,1,1,0,'Caixa interno',1,-345.00,0.00,'2022-11-22','','','',NULL,1,0),(2,2,1,0,'Caixa interno',1,-1520.56,0.00,'2022-11-22','','','',NULL,1,0),(3,2,NULL,756,'Sicoob',3,900.00,0.00,'2022-11-22','4113','2220-0','001',NULL,1,0),(4,2,NULL,0,'Caixa',1,0.00,0.00,'2022-11-22','','','',NULL,1,0),(5,2,NULL,0,'Cofre',2,0.00,0.00,'2022-11-22','','','',NULL,1,0),(6,1,NULL,0,'Conta Sommus',3,0.00,0.00,'2022-11-22','','','',NULL,1,0),(7,2,NULL,0,'Conta exclusão',3,0.00,0.00,'2022-11-22','','','',NULL,0,1),(8,2,NULL,1,'Conta para validação de saldo',3,0.00,0.00,'2022-11-22','0001','0001-0','001',NULL,1,0);
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
INSERT INTO `conta_boleto` VALUES (3,'1','01',1,1,2,1,2,'NÃO RECEBER BOLETO - APENAS DE TESTES','TESTE DE BOLETO SOMMUS GESTOR - BOLETO SEM VALOR','700',0,0,'4235','','',2,0,0.2000,30,2.0000,0),(6,'','',1,1,2,1,2,'PAGÁVEL EM QUALQUER BANCO ATÉ A DATA DE VENCIMENTO.','','',0,0,'','','',2,0,0.0000,0,0.0000,0),(8,'','',1,1,2,1,2,'PAGÁVEL EM QUALQUER BANCO ATÉ A DATA DE VENCIMENTO.','','',0,0,'','','',2,0,0.0000,0,0.0000,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (4,1,'202211',345.00,2),(4,2,'202210',-60010.00,2),(4,2,'202211',-495.25,1),(4,2,'202211',-54429.97,2),(4,2,'202212',-58177.96,2),(7,2,'202211',144.75,1),(7,2,'202211',487.94,2),(21,1,'202211',-361.25,1),(21,1,'202211',712.25,2),(21,2,'202211',-259.58,2),(29,1,'202211',361.25,1),(29,1,'202211',-1402.25,2),(29,2,'202210',-60010.00,2),(29,2,'202211',-495.25,1),(29,2,'202211',-55731.65,2),(29,2,'202212',-57960.00,2),(30,2,'202211',-350.50,1),(30,2,'202211',1365.51,2),(49,1,'202211',345.00,1),(49,1,'202211',345.00,2),(49,2,'202211',520.42,1),(49,2,'202211',520.42,2),(50,2,'202211',-112.93,1),(50,2,'202211',877.57,2),(51,2,'202211',31.82,1),(51,2,'202211',1365.51,2),(63,1,'202211',-361.25,1),(63,1,'202211',702.25,2),(63,2,'202211',540.42,1),(63,2,'202211',280.84,2),(65,2,'202211',197.96,1),(65,2,'202211',197.96,2),(66,1,'202211',345.00,1),(66,1,'202211',355.00,2),(68,2,'202210',60010.00,2),(68,2,'202211',4350.00,1),(68,2,'202211',55610.00,2),(68,2,'202212',57960.00,2),(71,2,'202211',-112.93,1),(71,2,'202211',877.57,2),(72,1,'202211',345.00,1),(72,1,'202211',345.00,2),(72,2,'202211',520.42,1),(72,2,'202211',520.42,2),(78,1,'202211',706.25,1),(78,1,'202211',-1402.25,2),(78,2,'202210',-60010.00,2),(78,2,'202211',-4510.97,1),(78,2,'202211',-54366.14,2),(78,2,'202212',-57960.00,2);
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
INSERT INTO `conta_saldo` VALUES (1,'2022-11-22',0.00),(1,'2022-11-23',-345.00),(2,'2022-11-23',-1520.56),(3,'2022-11-22',0.00),(3,'2022-11-23',900.00),(4,'2022-11-22',0.00),(5,'2022-11-22',0.00),(6,'2022-11-22',0.00),(7,'2022-11-22',0.00),(8,'2022-11-22',0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,1,'Departamento CRUD * alterado',53,0,1),(2,1,'Departamento CRUD',53,0,1),(3,1,'Departamento CRUD',53,1,0);
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
INSERT INTO `departamento_colaborador` VALUES (3,53,0),(3,54,0),(3,55,0),(3,56,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominio`
--

LOCK TABLES `dominio` WRITE;
/*!40000 ALTER TABLE `dominio` DISABLE KEYS */;
INSERT INTO `dominio` VALUES (1,NULL,NULL,3,'FinanceNfseDominioTest',1,'DOMINIO;NFse;1'),(2,NULL,NULL,2,'NfseDominioTest',1,'DOMINIO;NFse;2'),(3,NULL,NULL,1,'VendaNfseDominioTest',1,'DOMINIO;NFse;3');
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
INSERT INTO `empresa` VALUES (1,'Sommus Automação Comercial LTDA','Sommus Sistemas','04717475000154','ISENTO','5956','2022-11-23','Empresas/1/Logo/c4ca4238a0b923820dcc509a6f75849b','',0,1,0),(2,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA','24634181000176','0027467430027','','2022-11-23','Empresas/2/Logo/c81e728d9d4c2f636f067f89cc14862c','',0,1,0);
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
INSERT INTO `empresa_contato` VALUES (1,1,2,'(037) 3261-9150',''),(2,2,2,'03732619150',''),(25,2,1,'03732619150','teste');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,1,'Equipe CRUD * alterado',53,NULL,0,1);
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
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-11-23 10:19:26'),(2,'Deposito','Deposito do Centro','Av. Brasil','995','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-11-23 10:19:26'),(3,'Teste exclusão','','','','','','','','','','2022-11-23 10:19:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriado`
--

LOCK TABLES `feriado` WRITE;
/*!40000 ALTER TABLE `feriado` DISABLE KEYS */;
INSERT INTO `feriado` VALUES (2,'2020-01-01','Confraternização Universal',1,'',''),(3,'2020-04-10','Paixão de Cristo',1,'',''),(4,'2020-04-21','Tiradentes',1,'',''),(5,'2020-05-01','Dia Mundial do Trabalho',1,'',''),(6,'2020-09-07','Independência do Brasil',1,'',''),(7,'2020-10-12','Nossa Senhora Aparecida',1,'',''),(8,'2020-11-02','Finados',1,'',''),(9,'2020-11-15','Proclamação da República',1,'',''),(10,'2020-12-25','Natal',1,'','');
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
INSERT INTO `folha_pagamento` VALUES (1,2,'202210',1,2),(2,2,'202212',1,1),(3,2,'202211',2,2),(4,2,'202212',3,2);
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
INSERT INTO `folha_pagamento_lancamento` VALUES (1,1,38,10,2,1,1,182,'Comissão','2022-11-23','0001-01-01','2022-11-23',300.00,'V',NULL,1,1,0),(2,1,38,1,2,1,1,191,'Salário','2022-11-23','0001-01-01','2022-11-23',900.00,'V',NULL,1,1,0),(3,1,38,18,3,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','2022-11-23',900.00,'D',2,1,1,0),(4,1,18,1,1,1,1,191,'Salário Banco do Brasil (alterado)','2022-11-23','0001-01-01','0001-01-01',1120.00,'V',NULL,1,0,0),(5,1,18,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',880.00,'V',NULL,1,0,0),(6,1,18,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',20.00,'D',4,1,0,0),(7,1,19,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(8,1,19,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(9,1,19,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',7,1,0,0),(10,1,20,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(11,1,20,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(12,1,20,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',10,1,0,0),(13,1,21,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(14,1,21,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(15,1,21,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',13,1,0,0),(16,1,22,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(17,1,22,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(18,1,22,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',16,1,0,0),(19,1,23,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(20,1,23,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(21,1,23,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',19,1,0,0),(22,1,24,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(23,1,24,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(24,1,24,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',22,1,0,0),(25,1,25,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(26,1,25,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(27,1,25,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',25,1,0,0),(28,1,26,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(29,1,26,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(30,1,26,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',28,1,0,0),(31,1,27,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(32,1,27,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(33,1,27,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',31,1,0,0),(34,1,28,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(35,1,28,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(36,1,28,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',34,1,0,0),(37,1,29,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(38,1,29,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(39,1,29,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',37,1,0,0),(40,1,30,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(41,1,30,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(42,1,30,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',40,1,0,0),(43,1,31,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(44,1,31,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(45,1,31,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',43,1,0,0),(46,1,32,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(47,1,32,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(48,1,32,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',46,1,0,0),(49,1,33,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(50,1,33,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(51,1,33,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',49,1,0,0),(52,1,34,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(53,1,34,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(54,1,34,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',52,1,0,0),(55,1,35,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(56,1,35,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(57,1,35,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',55,1,0,0),(58,1,36,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(59,1,36,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(60,1,36,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',58,1,0,0),(61,1,37,1,1,1,1,191,'Salário Banco do Brasil','2022-11-23','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(62,1,37,1,2,1,1,191,'Salário LagoaCred','2022-11-23','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(63,1,37,18,1,1,1,198,'Desconto INSS','2022-11-23','0001-01-01','0001-01-01',30.00,'D',61,1,0,0),(64,1,18,1,1,1,NULL,191,'Salário teste','2022-11-23','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(65,2,18,1,1,1,NULL,191,'Salário teste 2','2022-11-23','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(66,1,18,2,1,1,1,179,'Adiantamento de salário teste 1 (alterado)','2022-11-23','0001-01-01','0001-01-01',100.00,'D',64,0,0,0),(67,2,18,2,1,1,1,179,'Adiantamento de salário teste 2','2022-11-23','0001-01-01','0001-01-01',40.00,'D',NULL,0,0,1),(68,3,18,4,1,1,1,180,'Adiantamento do 13º salário','2022-11-23','0001-01-01','0001-01-01',1000.00,'V',65,0,0,0),(69,4,18,3,1,1,1,178,'13º salário','2022-11-23','0001-01-01','0001-01-01',2000.00,'V',NULL,0,0,0),(70,4,18,2,1,1,1,179,'Adiantamento do 13º salário','2022-11-23','0001-01-01','0001-01-01',1000.00,'D',69,0,0,0),(71,2,18,1,1,1,1,191,'ZZSalário pago (excluído)','2022-11-23','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(72,2,18,1,1,1,1,191,'ZZSalário (excluído)','2022-11-23','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(73,2,18,1,1,1,1,191,'ZZAditantamento Salário pago (excluído)','2022-11-23','0001-01-01','2022-11-23',50.00,'V',72,0,1,0),(74,1,38,1,1,1,1,191,'Salário CEF 7','2022-11-23','2022-12-23','2022-11-23',1000.00,'V',NULL,0,1,0),(75,1,38,10,1,1,NULL,182,'Comissão 7','2022-11-23','0001-01-01','2022-11-23',500.00,'V',NULL,0,1,0),(76,1,38,1,1,1,1,191,'Salário CEF 1','2022-11-23','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(77,1,38,1,1,1,1,191,'Salário CEF 2','2022-11-23','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(78,1,38,2,1,1,1,179,'Vale - 2','2022-11-23','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(79,1,38,1,1,1,1,191,'Salário CEF 3','2022-11-23','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(80,1,38,2,1,1,1,179,'Vale 3','2022-11-23','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(81,1,38,1,1,1,1,191,'Salário CEF 4','2022-11-23','0001-01-01','2022-11-23',1000.00,'V',NULL,0,1,0),(82,1,38,2,1,1,1,179,'Vale - 4','2022-11-23','0001-01-01','2022-11-23',700.00,'D',81,0,1,0),(83,1,38,1,1,1,1,191,'Salário CEF 5','2022-11-23','2022-12-23','0001-01-01',1000.00,'V',NULL,0,0,1),(84,1,38,2,1,1,1,179,'Vale - 5','2022-11-23','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(85,1,38,1,1,1,1,191,'Salário CEF 6','2022-11-23','2022-12-23','0001-01-01',1000.00,'V',NULL,0,0,1),(86,1,38,10,1,1,NULL,182,'Comissão 6','2022-11-23','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,1),(87,1,38,2,1,1,1,179,'Vale - 6','2022-11-23','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(88,1,39,1,1,1,1,191,'Salário CEF','2022-11-23','0001-01-01','0001-01-01',800.00,'V',NULL,0,0,0),(89,1,39,2,1,1,1,179,'Vale','2022-11-23','0001-01-01','0001-01-01',600.00,'D',NULL,0,0,1),(90,1,39,2,1,1,1,179,'Vale 2','2022-11-23','0001-01-01','0001-01-01',400.00,'D',88,0,0,0),(91,1,39,2,1,1,1,179,'Vale 2','2022-11-23','0001-01-01','0001-01-01',200.00,'D',88,0,0,0),(92,1,38,1,1,1,1,191,'Salário CEF 7','2022-11-23','2022-12-23','2022-11-23',1000.00,'V',NULL,0,1,0),(93,1,38,10,1,1,NULL,182,'Comissão 7','2022-11-23','0001-01-01','2022-11-23',500.00,'V',NULL,0,1,0);
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
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-11-23 10:19:45'),(2,2,'Cheque',1,2,2,1,0,1,'2022-11-23 10:19:45'),(3,3,'Cartão',1,3,3,0,0,0,'2022-11-23 10:19:45'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-11-23 10:19:45'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-11-23 10:19:45'),(6,6,'PIX',1,6,17,0,0,1,'2022-11-23 10:19:45'),(7,NULL,'Dinheiro (Alterado)',1,1,0,0,0,1,'2022-11-23 10:19:45'),(8,NULL,'Outros',9,99,0,0,0,0,'2022-11-23 10:19:45'),(9,NULL,'Cheque',9,2,0,0,0,1,'2022-11-23 10:19:33'),(10,NULL,'Cartão',9,3,0,0,0,1,'2022-11-23 10:19:33'),(11,NULL,'Teste exclusão',1,1,0,0,0,0,'2022-11-23 10:19:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_especial`
--

LOCK TABLES `horario_especial` WRITE;
/*!40000 ALTER TABLE `horario_especial` DISABLE KEYS */;
INSERT INTO `horario_especial` VALUES (2,'2020-02-26','Quarta-feira de cinzas','00:00:00','00:00:00','12:00:00','18:00:00'),(3,'2020-12-25','Véspera de Natal','08:00:00','11:30:00','00:00:00','00:00:00'),(4,'2020-12-31','Véspera de Ano Novo','08:00:00','11:30:00','00:00:00','00:00:00');
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
INSERT INTO `horario_especial_empresa` VALUES (2,1),(3,1),(4,1);
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
INSERT INTO `igpm` VALUES ('012022',1.5200),('022022',0.8900),('032022',-0.4900),('042022',-1.0800),('052022',0.0100),('062022',0.8800),('072022',1.2600),('082022',0.9200),('092022',0.4500),('102022',0.8000),('112022',0.4000),('122021',0.7000);
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
INSERT INTO `ipca` VALUES ('012022',0.4800),('022022',0.4500),('032022',-0.2100),('042022',0.1500),('052022',0.3200),('062022',0.4300),('072022',0.7500),('082022',0.5700),('092022',0.1300),('102022',0.0100),('112022',0.1900),('122021',-0.0900);
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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(2,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'D',0,0),(3,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'C',0,0),(4,2,1,NULL,'Salário Banco do Brasil (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,1120.00,'D',0,0),(5,2,2,NULL,'Salário LagoaCred (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,880.00,'D',0,0),(6,2,1,NULL,'Desconto INSS (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,20.00,'C',0,0),(7,2,1,NULL,'Salário Banco do Brasil (Trabalhador 01, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(8,2,2,NULL,'Salário LagoaCred (Trabalhador 01, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(9,2,1,NULL,'Desconto INSS (Trabalhador 01, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(10,2,1,NULL,'Salário Banco do Brasil (Trabalhador 02, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(11,2,2,NULL,'Salário LagoaCred (Trabalhador 02, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(12,2,1,NULL,'Desconto INSS (Trabalhador 02, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(13,2,1,NULL,'Salário Banco do Brasil (Trabalhador 03, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(14,2,2,NULL,'Salário LagoaCred (Trabalhador 03, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(15,2,1,NULL,'Desconto INSS (Trabalhador 03, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(16,2,1,NULL,'Salário Banco do Brasil (Trabalhador 04, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(17,2,2,NULL,'Salário LagoaCred (Trabalhador 04, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(18,2,1,NULL,'Desconto INSS (Trabalhador 04, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(19,2,1,NULL,'Salário Banco do Brasil (Trabalhador 05, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(20,2,2,NULL,'Salário LagoaCred (Trabalhador 05, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(21,2,1,NULL,'Desconto INSS (Trabalhador 05, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:39','2022-10-31 10:19:39',NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(22,2,1,NULL,'Salário Banco do Brasil (Trabalhador 06, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(23,2,2,NULL,'Salário LagoaCred (Trabalhador 06, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(24,2,1,NULL,'Desconto INSS (Trabalhador 06, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(25,2,1,NULL,'Salário Banco do Brasil (Trabalhador 07, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(26,2,2,NULL,'Salário LagoaCred (Trabalhador 07, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(27,2,1,NULL,'Desconto INSS (Trabalhador 07, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(28,2,1,NULL,'Salário Banco do Brasil (Trabalhador 08, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(29,2,2,NULL,'Salário LagoaCred (Trabalhador 08, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(30,2,1,NULL,'Desconto INSS (Trabalhador 08, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(31,2,1,NULL,'Salário Banco do Brasil (Trabalhador 09, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(32,2,2,NULL,'Salário LagoaCred (Trabalhador 09, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(33,2,1,NULL,'Desconto INSS (Trabalhador 09, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(34,2,1,NULL,'Salário Banco do Brasil (Trabalhador 10, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(35,2,2,NULL,'Salário LagoaCred (Trabalhador 10, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(36,2,1,NULL,'Desconto INSS (Trabalhador 10, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(37,2,1,NULL,'Salário Banco do Brasil (Trabalhador 11, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(38,2,2,NULL,'Salário LagoaCred (Trabalhador 11, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(39,2,1,NULL,'Desconto INSS (Trabalhador 11, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(40,2,1,NULL,'Salário Banco do Brasil (Trabalhador 12, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(41,2,2,NULL,'Salário LagoaCred (Trabalhador 12, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(42,2,1,NULL,'Desconto INSS (Trabalhador 12, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(43,2,1,NULL,'Salário Banco do Brasil (Trabalhador 13, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(44,2,2,NULL,'Salário LagoaCred (Trabalhador 13, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(45,2,1,NULL,'Desconto INSS (Trabalhador 13, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(46,2,1,NULL,'Salário Banco do Brasil (Trabalhador 14, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(47,2,2,NULL,'Salário LagoaCred (Trabalhador 14, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(48,2,1,NULL,'Desconto INSS (Trabalhador 14, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(49,2,1,NULL,'Salário Banco do Brasil (Trabalhador 15, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(50,2,2,NULL,'Salário LagoaCred (Trabalhador 15, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(51,2,1,NULL,'Desconto INSS (Trabalhador 15, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(52,2,1,NULL,'Salário Banco do Brasil (Trabalhador 16, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(53,2,2,NULL,'Salário LagoaCred (Trabalhador 16, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(54,2,1,NULL,'Desconto INSS (Trabalhador 16, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(55,2,1,NULL,'Salário Banco do Brasil (Trabalhador 17, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(56,2,2,NULL,'Salário LagoaCred (Trabalhador 17, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(57,2,1,NULL,'Desconto INSS (Trabalhador 17, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(58,2,1,NULL,'Salário Banco do Brasil (Trabalhador 18, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,1680.00,'D',0,0),(59,2,2,NULL,'Salário LagoaCred (Trabalhador 18, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,1320.00,'D',0,0),(60,2,1,NULL,'Desconto INSS (Trabalhador 18, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(61,2,1,NULL,'Salário Banco do Brasil (Trabalhador 19, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,1344.00,'D',0,0),(62,2,2,NULL,'Salário LagoaCred (Trabalhador 19, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,'D',0,0),(63,2,1,NULL,'Desconto INSS (Trabalhador 19, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:40','2022-10-31 10:19:40',NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(64,2,1,NULL,'Salário teste (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(65,2,1,NULL,'Salário teste 2 (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(66,2,1,NULL,'Adiantamento de salário teste 1 (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,1),(67,2,1,NULL,'Adiantamento de salário teste 2 (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,NULL,NULL,40.00,'D',0,1),(68,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Novembro/2022)','2022-11-30 10:19:41','2022-11-30 10:19:41',NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(69,2,1,NULL,'13º salário (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,'D',0,0),(70,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(71,2,1,NULL,'Adiantamento de salário teste 1 (alterado) (Joseph Climber, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(72,2,1,NULL,'ZZSalário pago (excluído) (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,NULL,5000.00,'D',0,1),(73,2,1,NULL,'ZZSalário (excluído) (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,NULL,NULL,5000.00,'D',0,1),(74,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-12-31 10:19:41','2022-12-31 10:19:41',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(75,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Dezembro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(76,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(77,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(78,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(79,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'D',0,0),(80,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,900.00,'C',0,0),(81,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(82,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:41','2022-11-23 10:19:41',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(83,2,1,NULL,'Salário CEF 1 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:41','2022-10-31 10:19:41',NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(84,2,1,NULL,'Salário CEF 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,77,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(85,2,1,NULL,'Vale - 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(86,2,1,NULL,'Salário CEF 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,79,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(87,2,1,NULL,'Vale 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(88,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(89,2,1,NULL,'Vale - 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(90,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:42','2022-11-23 10:19:42',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,0),(91,2,1,NULL,'Salário CEF 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(92,2,1,NULL,'Vale - 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(93,2,1,NULL,'Salário CEF 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(94,2,1,NULL,'Comissão 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(95,2,1,NULL,'Vale - 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,1),(96,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,1),(97,2,1,NULL,'Vale (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,600.00,'D',0,1),(98,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,NULL,NULL,400.00,'D',0,0),(99,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(100,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(101,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(102,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-10-31 10:19:42','2022-10-31 10:19:42',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(103,2,1,NULL,'Vale - 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:42','2022-11-23 10:19:42',NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(104,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:42','2022-11-23 10:19:42',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,1000.00,'D',0,0),(105,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Outubro/2022)','2022-11-23 10:19:42','2022-11-23 10:19:42',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(106,1,1,NULL,'Documento à pagar: 0000000001','2022-11-23 10:20:06','2022-11-23 10:20:06',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,180.00,'D',0,1),(107,1,1,NULL,'Documento à pagar: 0000000002','2022-11-23 10:20:06','2022-11-23 10:20:06',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,181.25,'D',0,1),(108,1,1,NULL,'Documento à pagar: 0000000003','2022-11-23 10:20:06','2022-11-23 10:20:06',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,170.50,'D',0,0),(109,1,1,NULL,'Documento à pagar: 1ab','2022-11-23 10:20:06','2022-11-23 10:20:06',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,170.50,'D',0,0),(110,2,2,NULL,'Pagamento: 1ab - Femsa LTDA','2022-11-23 10:20:07','2022-11-23 10:20:07',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,170.25,'D',0,1),(111,2,2,NULL,'Pagamento: 0000000003 - Femsa LTDA','2022-11-23 10:20:07','2022-11-23 10:20:07',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',0,1),(112,2,1,NULL,'Documento à receber: 0000000001','2022-11-23 10:20:08','2022-11-23 10:20:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,180.00,'C',0,1),(113,2,1,NULL,'Documento à receber: 0000000002','2022-11-23 10:20:08','2022-11-23 10:20:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,181.25,'C',0,0),(114,2,1,NULL,'Documento à receber: 0000000003','2022-11-23 10:20:08','2022-11-23 10:20:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,170.50,'C',0,1),(115,2,1,NULL,'Documento à receber: 1ab','2022-11-23 10:20:08','2022-11-23 10:20:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,170.50,'C',0,0),(116,2,2,NULL,'Recebimento: 1ab - Jeff Bezos','2022-11-23 10:20:09','2022-11-23 10:20:09',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,170.25,'C',0,1),(117,2,2,NULL,'Recebimento: 0000000002 - Jeff Bezos','2022-11-23 10:20:09','2022-11-23 10:20:09',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25.00,'C',0,1),(118,2,2,NULL,'Recebimento: 0000000002 - Jeff Bezos','2022-11-23 10:20:09','2022-11-23 10:20:09',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37.32,'C',0,0),(119,2,2,NULL,'Despesas viagem','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',0,0),(120,2,2,NULL,'Despesas viagem','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',0,0),(121,2,2,NULL,'Deposito bancário não identificado','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,111.98,'D',0,0),(122,2,2,NULL,'Movimento editável com alteração','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,85.98,'D',0,0),(123,2,2,NULL,'Deposito bancário não identificado','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,0),(124,2,2,NULL,'Deposito bancário não identificado','2022-11-23 10:19:54','2022-11-23 10:19:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,0),(125,2,2,NULL,'Deposito bancário não identificado','2022-11-23 10:19:54','2022-11-23 10:19:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,0),(126,2,1,NULL,'Documento à pagar: 0000000004','2022-11-23 10:20:54','2022-11-23 10:20:54',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,190.67,'D',0,0),(127,2,1,NULL,'Documento à pagar: 0000000005','2022-11-23 10:20:54','2022-11-23 10:20:54',NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,70.17,'D',0,0),(128,2,1,NULL,'Pagamento: 0000000004 - Femsa LTDA e outros pagamentos...','2022-11-23 10:20:54','2022-11-23 10:20:54',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,270.17,'D',0,1),(129,2,1,NULL,'Pagamento: 0000000005 - Femsa LTDA','2022-11-23 10:20:55','2022-11-23 10:20:54',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.17,'D',0,1),(130,2,1,NULL,'Documento à receber: 0000000004','2022-11-23 10:20:55','2022-11-23 10:20:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,108.26,'C',0,0),(131,2,1,NULL,'Documento à receber: 0000000005','2022-11-23 10:20:55','2022-11-23 10:20:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,200.00,'C',0,0),(132,2,1,NULL,'Recebimento: 0000000004 - Jeff Bezos e outros recebimentos...','2022-11-23 10:20:55','2022-11-23 10:20:55',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'C',0,1),(133,2,1,NULL,'Recebimento: 0000000005 - Jeff Bezos','2022-11-23 10:20:55','2022-11-23 00:00:00',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'C',0,1),(134,1,1,NULL,'Documento à pagar: 0000000006','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,255.00,'D',0,0),(135,1,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(136,1,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,120.00,'D',0,0),(137,1,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',0,0),(138,1,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',0,0),(139,1,1,NULL,'Documento à pagar: 0000000007','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,100.00,'D',0,0),(140,1,1,NULL,'Pagamento: 0000000007 - Jeff Bezos','2022-11-23 10:20:56','2022-11-23 10:20:56',NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115.00,'D',0,0),(141,2,1,NULL,'Documento à receber: 0000000006','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,255.00,'C',0,0),(142,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'C',0,0),(143,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,120.00,'C',0,0),(144,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'C',0,0),(145,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',0,0),(146,2,1,NULL,'Documento à receber: 0000000007','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,100.00,'C',0,0),(147,2,1,NULL,'Recebimento: 0000000007 - Jeff Bezos','2022-11-23 10:20:57','2022-11-23 10:20:57',NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115.00,'C',0,0),(148,2,2,NULL,'Transferência entre Caixa interno e Caixa interno','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,149,NULL,NULL,NULL,NULL,NULL,85.98,'D',0,0),(149,2,1,NULL,'Transferência entre Caixa interno e Caixa interno','2022-11-23 10:19:53','2022-11-23 10:19:53',NULL,NULL,NULL,NULL,NULL,148,NULL,NULL,NULL,NULL,NULL,85.98,'C',0,0);
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
INSERT INTO `movimento_categoria` VALUES (1,182,NULL,'',300.00),(2,191,NULL,'',900.00),(3,198,NULL,'',900.00),(4,191,NULL,'',1120.00),(5,191,NULL,'',880.00),(6,198,NULL,'',20.00),(7,191,NULL,'',1680.00),(8,191,NULL,'',1320.00),(9,198,NULL,'',30.00),(10,191,NULL,'',1680.00),(11,191,NULL,'',1320.00),(12,198,NULL,'',30.00),(13,191,NULL,'',1344.00),(14,191,NULL,'',1056.00),(15,198,NULL,'',30.00),(16,191,NULL,'',1680.00),(17,191,NULL,'',1320.00),(18,198,NULL,'',30.00),(19,191,NULL,'',1680.00),(20,191,NULL,'',1320.00),(21,198,NULL,'',30.00),(22,191,NULL,'',1680.00),(23,191,NULL,'',1320.00),(24,198,NULL,'',30.00),(25,191,NULL,'',1344.00),(26,191,NULL,'',1056.00),(27,198,NULL,'',30.00),(28,191,NULL,'',1680.00),(29,191,NULL,'',1320.00),(30,198,NULL,'',30.00),(31,191,NULL,'',1344.00),(32,191,NULL,'',1056.00),(33,198,NULL,'',30.00),(34,191,NULL,'',1344.00),(35,191,NULL,'',1056.00),(36,198,NULL,'',30.00),(37,191,NULL,'',1680.00),(38,191,NULL,'',1320.00),(39,198,NULL,'',30.00),(40,191,NULL,'',1680.00),(41,191,NULL,'',1320.00),(42,198,NULL,'',30.00),(43,191,NULL,'',1680.00),(44,191,NULL,'',1320.00),(45,198,NULL,'',30.00),(46,191,NULL,'',1344.00),(47,191,NULL,'',1056.00),(48,198,NULL,'',30.00),(49,191,NULL,'',1680.00),(50,191,NULL,'',1320.00),(51,198,NULL,'',30.00),(52,191,NULL,'',1344.00),(53,191,NULL,'',1056.00),(54,198,NULL,'',30.00),(55,191,NULL,'',1344.00),(56,191,NULL,'',1056.00),(57,198,NULL,'',30.00),(58,191,NULL,'',1680.00),(59,191,NULL,'',1320.00),(60,198,NULL,'',30.00),(61,191,NULL,'',1344.00),(62,191,NULL,'',1056.00),(63,198,NULL,'',30.00),(64,191,NULL,'',500.00),(65,191,NULL,'',500.00),(66,179,NULL,'',200.00),(67,179,NULL,'',40.00),(68,180,NULL,'',1000.00),(69,178,NULL,'',2000.00),(70,179,NULL,'',1000.00),(71,179,NULL,'',100.00),(72,191,NULL,'',5000.00),(73,191,NULL,'',5000.00),(74,191,NULL,'',50.00),(75,191,NULL,'',50.00),(76,191,NULL,'',1000.00),(77,182,NULL,'',500.00),(78,182,NULL,'',300.00),(79,191,NULL,'',900.00),(80,198,NULL,'',900.00),(81,191,NULL,'',1000.00),(82,182,NULL,'',500.00),(83,191,NULL,'',1000.00),(84,191,NULL,'',1000.00),(85,179,NULL,'',700.00),(86,191,NULL,'',1000.00),(87,179,NULL,'',700.00),(88,191,NULL,'',1000.00),(89,179,NULL,'',700.00),(90,191,NULL,'',300.00),(91,191,NULL,'',1000.00),(92,179,NULL,'',700.00),(93,191,NULL,'',1000.00),(94,182,NULL,'',500.00),(95,179,NULL,'',700.00),(96,191,NULL,'',1000.00),(97,179,NULL,'',600.00),(98,179,NULL,'',400.00),(99,179,NULL,'',200.00),(100,191,NULL,'',200.00),(101,191,NULL,'',1000.00),(102,182,NULL,'',500.00),(103,179,NULL,'',700.00),(104,191,NULL,'',1000.00),(105,182,NULL,'',500.00),(106,141,NULL,'',180.00),(107,141,NULL,'',181.25),(108,141,NULL,'',170.50),(109,141,NULL,'',170.50),(110,141,NULL,'',170.25),(111,141,NULL,'',80.00),(112,225,NULL,'',180.00),(113,225,NULL,'',181.25),(114,225,NULL,'',170.50),(115,225,NULL,'',170.50),(116,225,NULL,'',170.25),(117,225,NULL,'',25.00),(118,225,NULL,'',37.32),(119,136,NULL,'',10.00),(120,136,NULL,'',6.00),(120,143,NULL,'',4.00),(121,162,NULL,'',111.98),(122,162,NULL,'',85.98),(126,126,NULL,'',190.67),(127,127,NULL,'',70.17),(128,126,NULL,'',200.00),(128,127,NULL,'',70.17),(129,127,NULL,'',70.17),(130,225,NULL,'',108.26),(131,225,NULL,'',200.00),(132,225,NULL,'',300.00),(133,225,NULL,'',200.00),(134,166,NULL,'',255.00),(135,166,NULL,'',50.00),(136,166,NULL,'',120.00),(137,166,NULL,'',50.00),(138,166,NULL,'',10.00),(139,166,NULL,'',100.00),(140,166,NULL,'',115.00),(141,225,NULL,'',255.00),(142,225,NULL,'',50.00),(143,225,NULL,'',120.00),(144,225,NULL,'',50.00),(145,225,NULL,'',10.00),(146,225,NULL,'',100.00),(147,225,NULL,'',115.00);
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
INSERT INTO `movimento_centro_resultado` VALUES (1,1,300.00),(2,1,900.00),(3,1,900.00),(4,1,1120.00),(5,1,880.00),(6,1,20.00),(7,1,1680.00),(8,1,1320.00),(9,1,30.00),(10,1,1680.00),(11,1,1320.00),(12,1,30.00),(13,1,1344.00),(14,1,1056.00),(15,1,30.00),(16,1,1680.00),(17,1,1320.00),(18,1,30.00),(19,1,1680.00),(20,1,1320.00),(21,1,30.00),(22,1,1680.00),(23,1,1320.00),(24,1,30.00),(25,1,1344.00),(26,1,1056.00),(27,1,30.00),(28,1,1680.00),(29,1,1320.00),(30,1,30.00),(31,1,1344.00),(32,1,1056.00),(33,1,30.00),(34,1,1344.00),(35,1,1056.00),(36,1,30.00),(37,1,1680.00),(38,1,1320.00),(39,1,30.00),(40,1,1680.00),(41,1,1320.00),(42,1,30.00),(43,1,1680.00),(44,1,1320.00),(45,1,30.00),(46,1,1344.00),(47,1,1056.00),(48,1,30.00),(49,1,1680.00),(50,1,1320.00),(51,1,30.00),(52,1,1344.00),(53,1,1056.00),(54,1,30.00),(55,1,1344.00),(56,1,1056.00),(57,1,30.00),(58,1,1680.00),(59,1,1320.00),(60,1,30.00),(61,1,1344.00),(62,1,1056.00),(63,1,30.00),(66,1,200.00),(67,1,40.00),(68,1,1000.00),(69,1,2000.00),(70,1,1000.00),(71,1,100.00),(72,1,5000.00),(73,1,5000.00),(74,1,50.00),(75,1,50.00),(76,1,1000.00),(78,1,300.00),(79,1,900.00),(80,1,900.00),(81,1,1000.00),(83,1,1000.00),(84,1,1000.00),(85,1,700.00),(86,1,1000.00),(87,1,700.00),(88,1,1000.00),(89,1,700.00),(90,1,300.00),(91,1,1000.00),(92,1,700.00),(93,1,1000.00),(95,1,700.00),(96,1,1000.00),(97,1,600.00),(98,1,400.00),(99,1,200.00),(100,1,200.00),(101,1,1000.00),(103,1,700.00),(104,1,1000.00),(119,1,7.00),(119,2,3.00),(120,1,7.00),(120,2,3.00),(121,1,111.98),(122,1,85.98),(126,2,114.40),(126,4,76.27),(127,2,49.12),(127,4,21.05),(128,2,169.12),(128,4,101.05),(129,2,49.12),(129,4,21.05),(130,3,54.13),(130,4,54.13),(131,1,200.00),(132,1,200.00),(132,3,50.00),(132,4,50.00),(133,1,200.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,182,4,300.00,2,2),(1,182,29,300.00,2,2),(1,182,68,300.00,1,2),(1,182,78,300.00,2,2),(2,191,4,900.00,2,2),(2,191,29,900.00,2,2),(2,191,68,900.00,1,2),(2,191,78,900.00,2,2),(3,198,4,900.00,1,2),(3,198,29,900.00,1,2),(3,198,68,900.00,2,2),(3,198,78,900.00,1,2),(4,191,4,1120.00,2,2),(4,191,29,1120.00,2,2),(4,191,68,1120.00,1,2),(4,191,78,1120.00,2,2),(5,191,4,880.00,2,2),(5,191,29,880.00,2,2),(5,191,68,880.00,1,2),(5,191,78,880.00,2,2),(6,198,4,20.00,1,2),(6,198,29,20.00,1,2),(6,198,68,20.00,2,2),(6,198,78,20.00,1,2),(7,191,4,1680.00,2,2),(7,191,29,1680.00,2,2),(7,191,68,1680.00,1,2),(7,191,78,1680.00,2,2),(8,191,4,1320.00,2,2),(8,191,29,1320.00,2,2),(8,191,68,1320.00,1,2),(8,191,78,1320.00,2,2),(9,198,4,30.00,1,2),(9,198,29,30.00,1,2),(9,198,68,30.00,2,2),(9,198,78,30.00,1,2),(10,191,4,1680.00,2,2),(10,191,29,1680.00,2,2),(10,191,68,1680.00,1,2),(10,191,78,1680.00,2,2),(11,191,4,1320.00,2,2),(11,191,29,1320.00,2,2),(11,191,68,1320.00,1,2),(11,191,78,1320.00,2,2),(12,198,4,30.00,1,2),(12,198,29,30.00,1,2),(12,198,68,30.00,2,2),(12,198,78,30.00,1,2),(13,191,4,1344.00,2,2),(13,191,29,1344.00,2,2),(13,191,68,1344.00,1,2),(13,191,78,1344.00,2,2),(14,191,4,1056.00,2,2),(14,191,29,1056.00,2,2),(14,191,68,1056.00,1,2),(14,191,78,1056.00,2,2),(15,198,4,30.00,1,2),(15,198,29,30.00,1,2),(15,198,68,30.00,2,2),(15,198,78,30.00,1,2),(16,191,4,1680.00,2,2),(16,191,29,1680.00,2,2),(16,191,68,1680.00,1,2),(16,191,78,1680.00,2,2),(17,191,4,1320.00,2,2),(17,191,29,1320.00,2,2),(17,191,68,1320.00,1,2),(17,191,78,1320.00,2,2),(18,198,4,30.00,1,2),(18,198,29,30.00,1,2),(18,198,68,30.00,2,2),(18,198,78,30.00,1,2),(19,191,4,1680.00,2,2),(19,191,29,1680.00,2,2),(19,191,68,1680.00,1,2),(19,191,78,1680.00,2,2),(20,191,4,1320.00,2,2),(20,191,29,1320.00,2,2),(20,191,68,1320.00,1,2),(20,191,78,1320.00,2,2),(21,198,4,30.00,1,2),(21,198,29,30.00,1,2),(21,198,68,30.00,2,2),(21,198,78,30.00,1,2),(22,191,4,1680.00,2,2),(22,191,29,1680.00,2,2),(22,191,68,1680.00,1,2),(22,191,78,1680.00,2,2),(23,191,4,1320.00,2,2),(23,191,29,1320.00,2,2),(23,191,68,1320.00,1,2),(23,191,78,1320.00,2,2),(24,198,4,30.00,1,2),(24,198,29,30.00,1,2),(24,198,68,30.00,2,2),(24,198,78,30.00,1,2),(25,191,4,1344.00,2,2),(25,191,29,1344.00,2,2),(25,191,68,1344.00,1,2),(25,191,78,1344.00,2,2),(26,191,4,1056.00,2,2),(26,191,29,1056.00,2,2),(26,191,68,1056.00,1,2),(26,191,78,1056.00,2,2),(27,198,4,30.00,1,2),(27,198,29,30.00,1,2),(27,198,68,30.00,2,2),(27,198,78,30.00,1,2),(28,191,4,1680.00,2,2),(28,191,29,1680.00,2,2),(28,191,68,1680.00,1,2),(28,191,78,1680.00,2,2),(29,191,4,1320.00,2,2),(29,191,29,1320.00,2,2),(29,191,68,1320.00,1,2),(29,191,78,1320.00,2,2),(30,198,4,30.00,1,2),(30,198,29,30.00,1,2),(30,198,68,30.00,2,2),(30,198,78,30.00,1,2),(31,191,4,1344.00,2,2),(31,191,29,1344.00,2,2),(31,191,68,1344.00,1,2),(31,191,78,1344.00,2,2),(32,191,4,1056.00,2,2),(32,191,29,1056.00,2,2),(32,191,68,1056.00,1,2),(32,191,78,1056.00,2,2),(33,198,4,30.00,1,2),(33,198,29,30.00,1,2),(33,198,68,30.00,2,2),(33,198,78,30.00,1,2),(34,191,4,1344.00,2,2),(34,191,29,1344.00,2,2),(34,191,68,1344.00,1,2),(34,191,78,1344.00,2,2),(35,191,4,1056.00,2,2),(35,191,29,1056.00,2,2),(35,191,68,1056.00,1,2),(35,191,78,1056.00,2,2),(36,198,4,30.00,1,2),(36,198,29,30.00,1,2),(36,198,68,30.00,2,2),(36,198,78,30.00,1,2),(37,191,4,1680.00,2,2),(37,191,29,1680.00,2,2),(37,191,68,1680.00,1,2),(37,191,78,1680.00,2,2),(38,191,4,1320.00,2,2),(38,191,29,1320.00,2,2),(38,191,68,1320.00,1,2),(38,191,78,1320.00,2,2),(39,198,4,30.00,1,2),(39,198,29,30.00,1,2),(39,198,68,30.00,2,2),(39,198,78,30.00,1,2),(40,191,4,1680.00,2,2),(40,191,29,1680.00,2,2),(40,191,68,1680.00,1,2),(40,191,78,1680.00,2,2),(41,191,4,1320.00,2,2),(41,191,29,1320.00,2,2),(41,191,68,1320.00,1,2),(41,191,78,1320.00,2,2),(42,198,4,30.00,1,2),(42,198,29,30.00,1,2),(42,198,68,30.00,2,2),(42,198,78,30.00,1,2),(43,191,4,1680.00,2,2),(43,191,29,1680.00,2,2),(43,191,68,1680.00,1,2),(43,191,78,1680.00,2,2),(44,191,4,1320.00,2,2),(44,191,29,1320.00,2,2),(44,191,68,1320.00,1,2),(44,191,78,1320.00,2,2),(45,198,4,30.00,1,2),(45,198,29,30.00,1,2),(45,198,68,30.00,2,2),(45,198,78,30.00,1,2),(46,191,4,1344.00,2,2),(46,191,29,1344.00,2,2),(46,191,68,1344.00,1,2),(46,191,78,1344.00,2,2),(47,191,4,1056.00,2,2),(47,191,29,1056.00,2,2),(47,191,68,1056.00,1,2),(47,191,78,1056.00,2,2),(48,198,4,30.00,1,2),(48,198,29,30.00,1,2),(48,198,68,30.00,2,2),(48,198,78,30.00,1,2),(49,191,4,1680.00,2,2),(49,191,29,1680.00,2,2),(49,191,68,1680.00,1,2),(49,191,78,1680.00,2,2),(50,191,4,1320.00,2,2),(50,191,29,1320.00,2,2),(50,191,68,1320.00,1,2),(50,191,78,1320.00,2,2),(51,198,4,30.00,1,2),(51,198,29,30.00,1,2),(51,198,68,30.00,2,2),(51,198,78,30.00,1,2),(52,191,4,1344.00,2,2),(52,191,29,1344.00,2,2),(52,191,68,1344.00,1,2),(52,191,78,1344.00,2,2),(53,191,4,1056.00,2,2),(53,191,29,1056.00,2,2),(53,191,68,1056.00,1,2),(53,191,78,1056.00,2,2),(54,198,4,30.00,1,2),(54,198,29,30.00,1,2),(54,198,68,30.00,2,2),(54,198,78,30.00,1,2),(55,191,4,1344.00,2,2),(55,191,29,1344.00,2,2),(55,191,68,1344.00,1,2),(55,191,78,1344.00,2,2),(56,191,4,1056.00,2,2),(56,191,29,1056.00,2,2),(56,191,68,1056.00,1,2),(56,191,78,1056.00,2,2),(57,198,4,30.00,1,2),(57,198,29,30.00,1,2),(57,198,68,30.00,2,2),(57,198,78,30.00,1,2),(58,191,4,1680.00,2,2),(58,191,29,1680.00,2,2),(58,191,68,1680.00,1,2),(58,191,78,1680.00,2,2),(59,191,4,1320.00,2,2),(59,191,29,1320.00,2,2),(59,191,68,1320.00,1,2),(59,191,78,1320.00,2,2),(60,198,4,30.00,1,2),(60,198,29,30.00,1,2),(60,198,68,30.00,2,2),(60,198,78,30.00,1,2),(61,191,4,1344.00,2,2),(61,191,29,1344.00,2,2),(61,191,68,1344.00,1,2),(61,191,78,1344.00,2,2),(62,191,4,1056.00,2,2),(62,191,29,1056.00,2,2),(62,191,68,1056.00,1,2),(62,191,78,1056.00,2,2),(63,198,4,30.00,1,2),(63,198,29,30.00,1,2),(63,198,68,30.00,2,2),(63,198,78,30.00,1,2),(64,191,4,500.00,2,2),(64,191,29,500.00,2,2),(64,191,68,500.00,1,2),(64,191,78,500.00,2,2),(65,191,4,500.00,2,2),(65,191,29,500.00,2,2),(65,191,68,500.00,1,2),(65,191,78,500.00,2,2),(66,179,4,200.00,2,2),(66,179,29,200.00,2,2),(66,179,68,200.00,1,2),(66,179,78,200.00,2,2),(67,179,4,40.00,2,2),(67,179,29,40.00,2,2),(67,179,68,40.00,1,2),(67,179,78,40.00,2,2),(68,180,4,1000.00,2,2),(68,180,29,1000.00,2,2),(68,180,68,1000.00,1,2),(68,180,78,1000.00,2,2),(69,178,4,2000.00,2,2),(69,178,29,2000.00,2,2),(69,178,68,2000.00,1,2),(69,178,78,2000.00,2,2),(70,179,4,1000.00,2,2),(70,179,29,1000.00,2,2),(70,179,68,1000.00,1,2),(70,179,78,1000.00,2,2),(71,179,4,100.00,2,2),(71,179,29,100.00,2,2),(71,179,68,100.00,1,2),(71,179,78,100.00,2,2),(72,191,4,5000.00,2,2),(72,191,29,5000.00,2,2),(72,191,68,5000.00,1,2),(72,191,78,5000.00,2,2),(73,191,4,5000.00,2,2),(73,191,29,5000.00,2,2),(73,191,68,5000.00,1,2),(73,191,78,5000.00,2,2),(74,191,4,50.00,2,2),(74,191,29,50.00,2,2),(74,191,68,50.00,1,2),(74,191,78,50.00,2,2),(75,191,68,50.00,1,1),(75,191,78,50.00,2,1),(76,191,4,1000.00,2,2),(76,191,29,1000.00,2,2),(76,191,68,1000.00,1,2),(76,191,78,1000.00,2,2),(77,182,4,500.00,2,2),(77,182,29,500.00,2,2),(77,182,68,500.00,1,2),(77,182,78,500.00,2,2),(78,182,68,300.00,1,1),(78,182,78,300.00,2,1),(79,191,68,900.00,1,1),(79,191,78,900.00,2,1),(80,198,68,900.00,2,1),(80,198,78,900.00,1,1),(81,191,68,1000.00,1,1),(81,191,78,1000.00,2,1),(82,182,68,500.00,1,1),(82,182,78,500.00,2,1),(83,191,4,1000.00,2,2),(83,191,29,1000.00,2,2),(83,191,68,1000.00,1,2),(83,191,78,1000.00,2,2),(84,191,4,1000.00,2,2),(84,191,29,1000.00,2,2),(84,191,68,1000.00,1,2),(84,191,78,1000.00,2,2),(85,179,4,700.00,2,2),(85,179,29,700.00,2,2),(85,179,68,700.00,1,2),(85,179,78,700.00,2,2),(86,191,4,1000.00,2,2),(86,191,29,1000.00,2,2),(86,191,68,1000.00,1,2),(86,191,78,1000.00,2,2),(87,179,4,700.00,2,2),(87,179,29,700.00,2,2),(87,179,68,700.00,1,2),(87,179,78,700.00,2,2),(88,191,4,1000.00,2,2),(88,191,29,1000.00,2,2),(88,191,68,1000.00,1,2),(88,191,78,1000.00,2,2),(89,179,4,700.00,2,2),(89,179,29,700.00,2,2),(89,179,68,700.00,1,2),(89,179,78,700.00,2,2),(90,191,68,300.00,1,1),(90,191,78,300.00,2,1),(91,191,4,1000.00,2,2),(91,191,29,1000.00,2,2),(91,191,68,1000.00,1,2),(91,191,78,1000.00,2,2),(92,179,4,700.00,2,2),(92,179,29,700.00,2,2),(92,179,68,700.00,1,2),(92,179,78,700.00,2,2),(93,191,4,1000.00,2,2),(93,191,29,1000.00,2,2),(93,191,68,1000.00,1,2),(93,191,78,1000.00,2,2),(94,182,4,500.00,2,2),(94,182,29,500.00,2,2),(94,182,68,500.00,1,2),(94,182,78,500.00,2,2),(95,179,4,700.00,2,2),(95,179,29,700.00,2,2),(95,179,68,700.00,1,2),(95,179,78,700.00,2,2),(96,191,4,1000.00,2,2),(96,191,29,1000.00,2,2),(96,191,68,1000.00,1,2),(96,191,78,1000.00,2,2),(97,179,4,600.00,2,2),(97,179,29,600.00,2,2),(97,179,68,600.00,1,2),(97,179,78,600.00,2,2),(98,179,4,400.00,2,2),(98,179,29,400.00,2,2),(98,179,68,400.00,1,2),(98,179,78,400.00,2,2),(99,179,4,200.00,2,2),(99,179,29,200.00,2,2),(99,179,68,200.00,1,2),(99,179,78,200.00,2,2),(100,191,4,200.00,2,2),(100,191,29,200.00,2,2),(100,191,68,200.00,1,2),(100,191,78,200.00,2,2),(101,191,4,1000.00,2,2),(101,191,29,1000.00,2,2),(101,191,68,1000.00,1,2),(101,191,78,1000.00,2,2),(102,182,4,500.00,2,2),(102,182,29,500.00,2,2),(102,182,68,500.00,1,2),(102,182,78,500.00,2,2),(103,179,68,700.00,1,1),(103,179,78,700.00,2,1),(104,191,68,1000.00,1,1),(104,191,78,1000.00,2,1),(105,182,68,500.00,1,1),(105,182,78,500.00,2,1),(106,141,21,180.00,1,2),(106,141,29,180.00,2,2),(106,141,63,180.00,1,2),(106,141,78,180.00,2,2),(107,141,21,181.25,1,2),(107,141,29,181.25,2,2),(107,141,63,181.25,1,2),(107,141,78,181.25,2,2),(108,141,21,170.50,1,2),(108,141,29,170.50,2,2),(108,141,63,170.50,1,2),(108,141,78,170.50,2,2),(109,141,21,170.50,1,2),(109,141,29,170.50,2,2),(109,141,63,170.50,1,2),(109,141,78,170.50,2,2),(110,141,4,170.25,1,2),(110,141,21,170.25,2,2),(110,141,29,170.25,2,2),(110,141,49,170.25,1,1),(110,141,49,170.25,1,2),(110,141,63,170.25,1,1),(110,141,72,170.25,1,1),(110,141,72,170.25,1,2),(110,141,78,170.25,1,1),(110,141,78,170.25,2,2),(111,141,4,80.00,1,2),(111,141,21,80.00,2,2),(111,141,29,80.00,2,2),(111,141,49,80.00,1,1),(111,141,49,80.00,1,2),(111,141,63,80.00,1,1),(111,141,72,80.00,1,1),(111,141,72,80.00,1,2),(111,141,78,80.00,1,1),(111,141,78,80.00,2,2),(112,225,7,180.00,1,2),(112,225,30,180.00,1,2),(112,225,51,180.00,1,2),(112,225,78,180.00,1,2),(113,225,7,181.25,1,2),(113,225,30,181.25,1,2),(113,225,51,181.25,1,2),(113,225,78,181.25,1,2),(114,225,7,170.50,1,2),(114,225,30,170.50,1,2),(114,225,51,170.50,1,2),(114,225,78,170.50,1,2),(115,225,7,170.50,1,2),(115,225,30,170.50,1,2),(115,225,51,170.50,1,2),(115,225,78,170.50,1,2),(116,225,4,170.25,1,1),(116,225,7,170.25,2,1),(116,225,29,170.25,1,1),(116,225,50,340.50,1,1),(116,225,51,170.25,1,1),(116,225,71,340.50,1,1),(116,225,78,340.50,1,1),(117,225,4,25.00,1,1),(117,225,7,25.00,2,1),(117,225,29,25.00,1,1),(117,225,50,50.00,1,1),(117,225,51,25.00,1,1),(117,225,71,50.00,1,1),(117,225,78,50.00,1,1),(118,225,4,37.32,1,1),(118,225,7,37.32,2,1),(118,225,29,37.32,1,1),(118,225,50,74.64,1,1),(118,225,51,37.32,1,1),(118,225,71,74.64,1,1),(118,225,78,74.64,1,1),(119,136,4,10.00,2,2),(119,136,29,10.00,2,2),(119,136,63,10.00,1,1),(119,136,63,10.00,1,2),(119,136,78,10.00,2,1),(119,136,78,10.00,2,2),(120,136,4,6.00,2,2),(120,136,29,6.00,2,2),(120,136,63,6.00,1,1),(120,136,63,6.00,1,2),(120,136,78,6.00,2,1),(120,136,78,6.00,2,2),(120,143,4,4.00,2,2),(120,143,29,4.00,2,2),(120,143,63,4.00,1,1),(120,143,63,4.00,1,2),(120,143,78,4.00,2,1),(120,143,78,4.00,2,2),(121,162,4,111.98,2,2),(121,162,29,111.98,2,2),(121,162,65,111.98,1,1),(121,162,65,111.98,1,2),(121,162,78,111.98,2,1),(121,162,78,111.98,2,2),(122,162,4,85.98,2,2),(122,162,29,85.98,2,2),(122,162,65,85.98,1,1),(122,162,65,85.98,1,2),(122,162,78,85.98,2,1),(122,162,78,85.98,2,2),(126,126,21,190.67,1,2),(126,126,29,190.67,2,2),(126,126,63,190.67,1,2),(126,126,78,190.67,2,2),(127,127,21,70.17,1,2),(127,127,29,70.17,2,2),(127,127,63,70.17,1,2),(127,127,78,70.17,2,2),(128,126,4,200.00,1,2),(128,126,21,200.00,2,2),(128,126,29,200.00,2,2),(128,126,49,200.00,1,1),(128,126,49,200.00,1,2),(128,126,63,200.00,1,1),(128,126,72,200.00,1,1),(128,126,72,200.00,1,2),(128,126,78,200.00,1,1),(128,126,78,200.00,2,2),(128,127,4,70.17,1,2),(128,127,21,70.17,2,2),(128,127,29,70.17,2,2),(128,127,49,70.17,1,1),(128,127,49,70.17,1,2),(128,127,63,70.17,1,1),(128,127,72,70.17,1,1),(128,127,72,70.17,1,2),(128,127,78,70.17,1,1),(128,127,78,70.17,2,2),(130,225,7,108.26,1,2),(130,225,30,108.26,1,2),(130,225,51,108.26,1,2),(130,225,78,108.26,1,2),(131,225,7,200.00,1,2),(131,225,30,200.00,1,2),(131,225,51,200.00,1,2),(131,225,78,200.00,1,2),(132,225,4,300.00,1,1),(132,225,7,300.00,2,1),(132,225,29,300.00,1,1),(132,225,50,600.00,1,1),(132,225,51,300.00,1,1),(132,225,71,600.00,1,1),(132,225,78,600.00,1,1),(134,166,21,255.00,1,2),(134,166,29,255.00,2,2),(134,166,66,255.00,1,2),(134,166,78,255.00,2,2),(135,166,4,50.00,1,2),(135,166,21,50.00,2,2),(135,166,29,50.00,2,2),(135,166,49,50.00,1,1),(135,166,49,50.00,1,2),(135,166,66,50.00,1,1),(135,166,72,50.00,1,1),(135,166,72,50.00,1,2),(135,166,78,50.00,1,1),(135,166,78,50.00,2,2),(136,166,4,120.00,1,2),(136,166,21,120.00,2,2),(136,166,29,120.00,2,2),(136,166,49,120.00,1,1),(136,166,49,120.00,1,2),(136,166,66,120.00,1,1),(136,166,72,120.00,1,1),(136,166,72,120.00,1,2),(136,166,78,120.00,1,1),(136,166,78,120.00,2,2),(137,166,4,50.00,1,2),(137,166,21,50.00,2,2),(137,166,29,50.00,2,2),(137,166,49,50.00,1,1),(137,166,49,50.00,1,2),(137,166,66,50.00,1,1),(137,166,72,50.00,1,1),(137,166,72,50.00,1,2),(137,166,78,50.00,1,1),(137,166,78,50.00,2,2),(138,166,4,10.00,1,2),(138,166,21,10.00,2,2),(138,166,29,10.00,2,2),(138,166,49,10.00,1,1),(138,166,49,10.00,1,2),(138,166,66,10.00,1,1),(138,166,72,10.00,1,1),(138,166,72,10.00,1,2),(138,166,78,10.00,1,1),(138,166,78,10.00,2,2),(139,166,21,100.00,1,2),(139,166,29,100.00,2,2),(139,166,66,100.00,1,2),(139,166,78,100.00,2,2),(140,166,4,115.00,1,2),(140,166,21,115.00,2,2),(140,166,29,115.00,2,2),(140,166,49,115.00,1,1),(140,166,49,115.00,1,2),(140,166,66,115.00,1,1),(140,166,72,115.00,1,1),(140,166,72,115.00,1,2),(140,166,78,115.00,1,1),(140,166,78,115.00,2,2),(141,225,7,255.00,1,2),(141,225,30,255.00,1,2),(141,225,51,255.00,1,2),(141,225,78,255.00,1,2),(142,225,4,50.00,1,1),(142,225,7,50.00,2,1),(142,225,29,50.00,1,1),(142,225,50,100.00,1,1),(142,225,51,50.00,1,1),(142,225,71,100.00,1,1),(142,225,78,100.00,1,1),(143,225,4,120.00,1,1),(143,225,7,120.00,2,1),(143,225,29,120.00,1,1),(143,225,50,240.00,1,1),(143,225,51,120.00,1,1),(143,225,71,240.00,1,1),(143,225,78,240.00,1,1),(144,225,4,50.00,1,1),(144,225,7,50.00,2,1),(144,225,29,50.00,1,1),(144,225,50,100.00,1,1),(144,225,51,50.00,1,1),(144,225,71,100.00,1,1),(144,225,78,100.00,1,1),(145,225,4,10.00,1,1),(145,225,7,10.00,2,1),(145,225,29,10.00,1,1),(145,225,50,20.00,1,1),(145,225,51,10.00,1,1),(145,225,71,20.00,1,1),(145,225,78,20.00,1,1),(146,225,7,100.00,1,2),(146,225,30,100.00,1,2),(146,225,51,100.00,1,2),(146,225,78,100.00,1,2),(147,225,4,115.00,1,1),(147,225,7,115.00,2,1),(147,225,29,115.00,1,1),(147,225,50,230.00,1,1),(147,225,51,115.00,1,1),(147,225,71,230.00,1,1),(147,225,78,230.00,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,75,1,NULL,NULL,NULL,50.00,'D',1),(2,78,1,NULL,NULL,NULL,300.00,'D',1),(3,79,1,NULL,NULL,NULL,900.00,'D',1),(4,80,1,NULL,NULL,NULL,900.00,'C',1),(5,81,1,NULL,NULL,NULL,1000.00,'D',1),(6,82,1,NULL,NULL,NULL,500.00,'D',1),(7,90,1,NULL,NULL,NULL,300.00,'D',1),(8,103,1,NULL,NULL,NULL,700.00,'D',1),(9,104,1,NULL,NULL,NULL,1000.00,'D',1),(10,105,1,NULL,NULL,NULL,500.00,'D',1),(11,110,1,NULL,NULL,NULL,85.00,'D',1),(12,110,3,NULL,NULL,NULL,51.15,'D',0),(13,110,4,NULL,NULL,NULL,34.10,'D',0),(14,111,1,NULL,NULL,NULL,80.00,'D',1),(15,116,1,NULL,NULL,NULL,85.00,'C',1),(16,116,3,NULL,NULL,NULL,51.15,'C',0),(17,116,4,NULL,NULL,NULL,34.10,'C',0),(18,117,1,NULL,NULL,NULL,25.00,'C',1),(19,118,1,NULL,NULL,NULL,37.32,'C',1),(20,119,1,NULL,NULL,NULL,10.00,'D',1),(21,120,1,NULL,NULL,NULL,10.00,'D',1),(22,121,1,NULL,NULL,NULL,111.98,'D',1),(23,122,1,NULL,NULL,NULL,85.98,'D',1),(24,123,1,NULL,NULL,NULL,17.98,'D',1),(25,124,1,NULL,NULL,NULL,17.98,'D',1),(26,125,1,NULL,NULL,NULL,17.98,'D',1),(27,128,1,NULL,NULL,NULL,270.17,'D',1),(28,129,1,NULL,NULL,NULL,70.17,'D',1),(29,132,1,NULL,NULL,NULL,300.00,'C',1),(30,133,1,NULL,NULL,NULL,200.00,'C',1),(31,135,1,NULL,NULL,NULL,50.00,'D',1),(32,136,1,NULL,NULL,NULL,120.00,'D',1),(33,137,1,NULL,NULL,NULL,50.00,'D',1),(34,138,1,NULL,NULL,NULL,10.00,'D',1),(35,140,1,NULL,NULL,NULL,115.00,'D',1),(36,142,1,NULL,NULL,NULL,50.00,'C',1),(37,143,1,NULL,NULL,NULL,120.00,'C',1),(38,144,1,NULL,NULL,NULL,50.00,'C',1),(39,145,1,NULL,NULL,NULL,10.00,'C',1),(40,147,1,NULL,NULL,NULL,115.00,'C',1),(41,148,1,NULL,NULL,NULL,85.98,'D',1),(42,149,1,NULL,NULL,NULL,85.98,'C',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfse`
--

LOCK TABLES `nfse` WRITE;
/*!40000 ALTER TABLE `nfse` DISABLE KEYS */;
INSERT INTO `nfse` VALUES (1,1,0,37,1,'',2,'2022-11-23','2022-11-22',1,6,2,343.00,343.00,0.00,343.00,10.29,0.00,0.00,0.00,'','','',0,'','','',0,0),(2,1,0,37,1,'',2,'2022-11-23','2022-11-23',1,6,2,343.00,343.00,0.00,343.00,10.29,0.00,0.00,0.00,'','','',0,'','','',0,1),(3,1,0,37,1,'',2,'2022-11-23','2022-11-23',1,6,2,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','','',0,'','','',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfse_item`
--

LOCK TABLES `nfse_item` WRITE;
/*!40000 ALTER TABLE `nfse_item` DISABLE KEYS */;
INSERT INTO `nfse_item` VALUES (1,1,1004,'Prestação de Serviço',1,343.00,343.0000,0.00,343.00,3.0000,10.29,6,1,0,0,0,'6209100','07',0.00,0.0000,0.0000,0.00,0.00,0,'1','',60,0),(2,2,1004,'Prestação de Serviço',1,343.00,343.0000,0.00,343.00,3.0000,10.29,6,1,0,0,0,'6209100','07',0.00,0.0000,0.0000,0.00,0.00,0,'1','',60,0),(3,3,1004,'Prestação de Serviço',1,343.00,343.0000,0.00,343.00,3.0000,10.29,6,1,0,0,0,'6209100','07',0.00,0.0000,0.0000,0.00,0.00,0,'1','',60,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odf`
--

LOCK TABLES `odf` WRITE;
/*!40000 ALTER TABLE `odf` DISABLE KEYS */;
INSERT INTO `odf` VALUES (1,1,1,'2022-11-23','2022-11-23','1','6',0,6,2,343.00,10.00,0.00,1203,'90',0.00,0.0000,0.00,'50',343.00,1.6500,7.6000,5.66,26.07,101,4,56,1,1,1,1,0,''),(2,1,1,'2022-11-23','2022-11-22','1','6',0,6,2,343.00,10.00,0.00,1203,'90',0.00,0.0000,0.00,'50',343.00,1.6500,7.6000,5.66,26.07,101,4,56,1,1,1,1,0,'');
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
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(6,NULL,'Compra de Mercadorias para revenda','E',0,0,0),(7,NULL,'Prestação de Serviço','S',0,0,0),(8,NULL,'Venda de Mercadorias','S',1,1,1),(9,NULL,'Teste exclusão','E',1,1,1);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,95,3),(1,96,4),(1,97,5),(1,98,6),(2,99,7),(2,100,8),(2,101,9),(2,102,10),(3,119,11),(3,120,12),(3,121,13),(4,122,14),(4,123,15),(6,119,11),(8,93,1);
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
INSERT INTO `operacao_empresa` VALUES (1,1,1,0,0),(1,2,2,0,0),(2,1,1,1,0),(2,2,2,1,0),(3,1,1,1,0),(3,2,2,1,0),(4,1,1,1,0),(4,2,2,1,0),(6,1,NULL,1,0),(6,2,NULL,1,0),(7,1,NULL,1,0),(7,2,2,1,0),(8,1,NULL,1,0),(8,2,2,1,0),(9,1,NULL,0,1),(9,2,2,0,1);
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
INSERT INTO `oportunidade` VALUES (1,2,45,42,9,1,1,3,1,NULL,1,'Oportuniade cadastrada',150.00,150.00,150.00,15,2550.00,'2022-11-23','2022-12-23','0001-01-01',3,1,'Uma observação plausível de altíssima escala',0),(2,2,NULL,42,9,NULL,1,3,1,NULL,NULL,'Outra otima descrição!',150.00,150.00,150.00,15,2550.00,'2022-11-23','2022-12-03','0001-01-01',0,0,'',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_motivo`
--

LOCK TABLES `oportunidade_motivo` WRITE;
/*!40000 ALTER TABLE `oportunidade_motivo` DISABLE KEYS */;
INSERT INTO `oportunidade_motivo` VALUES (1,'Aquele motivo legal...','Pois é...',1),(2,'Aquele motivo TOP!','Pois é tb...',1),(3,'Motivo CRM (a excluir)','Teste',2),(4,'Teste motivo conclusão','Descrição teste...',1);
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
INSERT INTO `oportunidade_motivo_empresa` VALUES (1,2,1,0),(2,2,1,0),(3,2,1,0),(4,1,0,1),(4,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_origem`
--

LOCK TABLES `oportunidade_origem` WRITE;
/*!40000 ALTER TABLE `oportunidade_origem` DISABLE KEYS */;
INSERT INTO `oportunidade_origem` VALUES (1,'Origem do telefone','Pois é...'),(2,'Origem da rua (a excluír)','Pois é...'),(3,'Teste origem oportunidade','Descrição teste...');
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
INSERT INTO `oportunidade_origem_empresa` VALUES (1,2,1,0),(2,2,1,0),(3,1,0,1),(3,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_solucao`
--

LOCK TABLES `oportunidade_solucao` WRITE;
/*!40000 ALTER TABLE `oportunidade_solucao` DISABLE KEYS */;
INSERT INTO `oportunidade_solucao` VALUES (1,'Sistema para gestão de cobranças','Sistema para realizar a gestão de feijão por parte da credora a seus clientes.'),(2,'Solução CRM (a excluir)','Teste de solução.');
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
INSERT INTO `oportunidade_solucao_empresa` VALUES (1,2,1,0),(2,2,1,0);
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
INSERT INTO `oportunidade_tarefa` VALUES (1,1),(1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade_tipo`
--

LOCK TABLES `oportunidade_tipo` WRITE;
/*!40000 ALTER TABLE `oportunidade_tipo` DISABLE KEYS */;
INSERT INTO `oportunidade_tipo` VALUES (1,'O outro aquele','SIM! Esse msm'),(2,'Esse (a excluír)','SIM! Esse msm'),(3,'Teste tipo oportunidade','Descrição teste...');
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
INSERT INTO `oportunidade_tipo_empresa` VALUES (1,2,1,0),(2,2,1,0),(3,1,0,1),(3,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (1,1,13,38,'2020-07-10 08:00:00','2020-07-10 18:00:00','0001-01-01 00:00:00',NULL,0.00,'','','','','','','Ordem de serviço CRUD','',6);
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
INSERT INTO `ordem_servico_atividade` VALUES (1,1,1,'2022-11-23 10:21:47',1,NULL,0,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','','Ordem de serviço CRUD'),(2,1,1,'2022-11-23 10:21:47',3,NULL,6,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,2,'2022-11-23',170.50,0.00,0.00,170.25,1),(2,2,'2022-11-23',180.00,0.00,10.00,80.00,1),(3,1,'2022-11-23',260.84,0.00,9.33,270.17,1),(4,1,'2022-11-23',255.00,0.00,0.00,50.00,0),(5,1,'2022-11-23',205.00,0.00,15.00,120.00,0),(6,1,'2022-11-23',100.00,15.00,0.00,50.00,0),(7,1,'2022-11-23',35.00,0.00,0.00,10.00,0),(8,1,'2022-11-23',100.00,0.00,15.00,115.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_cancelado`
--

LOCK TABLES `pagamento_cancelado` WRITE;
/*!40000 ALTER TABLE `pagamento_cancelado` DISABLE KEYS */;
INSERT INTO `pagamento_cancelado` VALUES (1,1,'2022-11-23'),(2,2,'2022-11-23'),(3,3,'2022-11-23'),(4,3,'2022-11-23');
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
INSERT INTO `pagamento_cancelado_pagar` VALUES (1,1,1),(2,2,3),(3,3,4),(4,3,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_pagar`
--

LOCK TABLES `pagamento_pagar` WRITE;
/*!40000 ALTER TABLE `pagamento_pagar` DISABLE KEYS */;
INSERT INTO `pagamento_pagar` VALUES (1,1,1,170.50,0.00,0.00,170.25,1),(2,2,3,180.00,0.00,10.00,80.00,1),(3,3,4,190.67,0.00,9.33,200.00,1),(4,3,5,70.17,0.00,0.00,70.17,1),(5,4,6,255.00,0.00,0.00,50.00,0),(6,5,6,205.00,0.00,15.00,120.00,0),(7,6,6,100.00,15.00,0.00,50.00,0),(8,7,6,35.00,0.00,0.00,10.00,0),(9,8,7,100.00,0.00,15.00,115.00,0);
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
INSERT INTO `pagamento_pagar_categoria` VALUES (1,141,170.25),(2,141,80.00),(3,126,200.00),(4,127,70.17),(5,166,50.00),(6,166,120.00),(7,166,50.00),(8,166,10.00),(9,166,115.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,2,6,NULL,NULL,2,'1ab','2022-11-23','2022-11-28','0001-01-01',170.50,0.00,0.00,0.00,'',0,0),(2,NULL,2,6,NULL,NULL,1,'0000000002','2022-11-23','2022-12-23','0001-01-01',181.25,0.00,0.00,0.00,'',0,1),(3,NULL,2,6,NULL,NULL,2,'0000000003','2022-11-23','2022-12-23','0001-01-01',170.50,0.00,0.00,0.00,'',0,0),(4,NULL,2,6,NULL,NULL,1,'0000000004','2022-11-23','2022-12-23','0001-01-01',190.67,0.00,0.00,0.00,'',0,0),(5,NULL,2,6,NULL,NULL,1,'0000000005','2022-11-23','2022-12-23','0001-01-01',70.17,0.00,0.00,0.00,'',0,0),(6,NULL,2,8,NULL,NULL,1,'0000000006','2022-11-23','2022-12-23','0001-01-01',255.00,15.00,15.00,230.00,'',0,0),(7,NULL,2,8,NULL,NULL,1,'0000000007','2022-11-23','2022-12-23','2022-11-23',100.00,0.00,15.00,115.00,'',0,0);
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
INSERT INTO `pagar_categoria` VALUES (1,141,100.0000),(3,141,100.0000),(4,126,100.0000),(5,127,100.0000),(6,166,100.0000),(7,166,100.0000);
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
INSERT INTO `pagar_centro_resultado` VALUES (4,2,60.0000),(4,4,40.0000),(5,2,70.0000),(5,4,30.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Sommus Automacao Comercial Ltda - Me','Sommus Sistemas',NULL,'','04717475000154','ISENTO','','',0,'','','','','0001-01-01',0,1,'2022-11-23 10:21:48'),(2,'J',0,'Geralda Aparecida de Miranda Silva 99553082653','TEMPERO CRISTALINA',NULL,'','24634181000176','0027467430027','','',0,'','','','','0001-01-01',0,2,'0001-01-01 00:00:00'),(3,'J',1,'João das Couve','João das Couve',NULL,'','99999999000191','Isento','','',9,'','','','','0001-01-01',0,0,'2022-11-23 10:19:16'),(4,'F',3,'João das Couve','','12345678909','AC1593852',NULL,'','','',9,'','','','','1995-01-01',0,0,'2022-11-23 10:19:16'),(5,'J',2,'Sommus Automação Comercial LTDA','Sommus Sistemas',NULL,'','89757601000157','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:16'),(6,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-11-23 10:19:16'),(7,'J',2,'teste','teste',NULL,'','88184259000180','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:18'),(8,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','',9,'','','','','1999-11-29',0,0,'2022-11-23 10:21:49'),(9,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,'2022-11-23 10:19:20'),(10,'F',0,'Jose da Silva','','33001998598','',NULL,'','','',0,'153153','','','','1999-11-29',0,0,'2022-11-23 10:19:20'),(11,'F',0,'Francisco','','01716124859','',NULL,'','','',0,'888888','','','','1999-12-25',0,0,'2022-11-23 10:19:20'),(12,'J',0,'Patrimonium Contabilidade','',NULL,'','47717436000160','','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:20'),(13,'J',0,'Aliber Máquinas LTDA ME','Aliber Sistemas',NULL,'','25940685000187','6996508370046','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:21:48'),(14,'J',0,'Maximus Informática','Maximus Informática',NULL,'','09285455000175','0010572290063','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:23'),(15,'F',0,'Wilson de Castro','W2','06981129620','13852332',NULL,'','','',0,'','','','','1992-11-23',0,0,'2022-11-23 10:19:23'),(16,'J',0,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:27'),(17,'J',1,'Barry Transports (Excluido)','The Flash',NULL,'','18494232000109','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:19:27'),(18,'F',0,'Joseph Climber','','09848920013','MG25153155',NULL,'','','',0,'','','','','1999-08-04',1,0,'2022-11-23 10:19:37'),(19,'F',0,'Trabalhador 01','','72473829373','MG339132318',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(20,'F',0,'Trabalhador 02','','20960033777','MG182464304',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(21,'F',0,'Trabalhador 03','','57068792650','MG149911502',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(22,'F',0,'Trabalhador 04','','37760222998','MG905794425',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(23,'F',0,'Trabalhador 05','','57131740268','MG819766045',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(24,'F',0,'Trabalhador 06','','10554786982','MG643839341',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(25,'F',0,'Trabalhador 07','','78939346114','MG939480052',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(26,'F',0,'Trabalhador 08','','76648857102','MG943686434',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:35'),(27,'F',0,'Trabalhador 09','','18036277948','MG604819595',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(28,'F',0,'Trabalhador 10','','37468910510','MG851092058',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(29,'F',0,'Trabalhador 11','','52972838920','MG487656086',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(30,'F',0,'Trabalhador 12','','67983197420','MG755929995',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(31,'F',0,'Trabalhador 13','','55617873903','MG951197804',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(32,'F',0,'Trabalhador 14','','14177930660','MG847924767',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(33,'F',0,'Trabalhador 15','','93181390631','MG252358835',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(34,'F',0,'Trabalhador 16','','81374989312','MG172499429',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(35,'F',0,'Trabalhador 17','','64040480198','MG421843685',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:36'),(36,'F',0,'Trabalhador 18','','22597320464','MG912138026',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:37'),(37,'F',0,'Trabalhador 19','','52398372871','MG877586421',NULL,'','','',0,'','','','','2000-05-10',0,0,'2022-11-23 10:19:37'),(38,'F',0,'Colaborador teste relação entre lançamentos 1','','86652485010','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,'2022-11-23 10:19:38'),(39,'F',0,'Colaborador teste relação entre lançamentos 2','','87902241083','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,'2022-11-23 10:19:37'),(40,'F',0,'Nelson Guilherme Drumond (Editado)','',NULL,'',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:20:15'),(41,'J',0,'Nelson Guilherme Drumond (a excluir)','',NULL,'',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:20:15'),(42,'F',0,'Jorge Levi Nathan Figueiredo (Editado)','','00172392578','180521159',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:20:16'),(43,'J',0,'Empresa Conta LTDA','',NULL,'','53955527000136','1315634564','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:20:15'),(44,'J',0,'Empresa Conta LTDA (a excluir)','',NULL,'',NULL,'1315634564','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:20:15'),(45,'F',0,'Stella Alícia Priscila Lopes (editado)','','30024386502','225554203',NULL,'','','',0,'','','','','1999-11-29',0,0,'2022-11-23 10:20:17'),(46,'F',0,'Pessoa CRM (a excluír)','','17143555002','234523452',NULL,'','','',0,'','','','','1999-11-29',0,0,'2022-11-23 10:20:18'),(47,'J',0,'Vap Minas Supermercado LTDA','Vap Minas',NULL,'','25623570000169','','','',0,'','','','','0001-01-01',0,8,'2022-11-23 10:21:48'),(48,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,'2022-11-23 10:21:48'),(49,'J',0,'Stacao Moda Com.Art.Vest.LTDA-BD L1','Stação Modas (Bom Despacho)',NULL,'','01339768000157','MG321457011','','',0,'','','','','0001-01-01',0,6,'2022-11-23 10:21:48'),(50,'F',0,'Colaborador validador saldo','','26428107040','AC1593852',NULL,'','','',0,'','','','','1995-11-01',1,0,'2022-11-23 10:20:54'),(51,'F',0,'Sabrina Nicole Rita Araújo CRUD-Servicedesk * alterado','','46227541265','248198932',NULL,'','','',0,'','','','','1972-07-03',0,0,'2022-11-23 10:21:41'),(52,'F',0,'Isabelle Sônia Andrea Almada CRUD-Servicedesk * alterado','','81860161200','114559119',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:21:48'),(53,'F',0,'Henry Diogo Teixeira CRUD-Servicedesk','','80986878723','494141724',NULL,'','','',0,'','','','','1976-11-15',0,0,'2022-11-23 10:21:42'),(54,'F',0,'Benedito Enrico Moraes CRUD-Servicedesk','','29700796906','227504628',NULL,'','','',0,'','','','','1981-03-09',0,0,'2022-11-23 10:21:43'),(55,'F',0,'Lúcia Emily Assunção CRUD-Servicedesk','','41008421715','204439127',NULL,'','','',0,'','','','','1999-03-07',0,0,'2022-11-23 10:21:43'),(56,'F',0,'Ester Stefany Moura CRUD-Servicedesk','','93173691547','252692135',NULL,'','','',0,'','','','','1963-10-14',0,0,'2022-11-23 10:21:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_contato`
--

LOCK TABLES `pessoa_contato` WRITE;
/*!40000 ALTER TABLE `pessoa_contato` DISABLE KEYS */;
INSERT INTO `pessoa_contato` VALUES (1,1,1,2,'(037) 3261-9150',''),(2,2,2,2,'03732619150',''),(3,5,0,2,'(037) 3261-9150',''),(4,6,0,1,'(037) 2594-1157',''),(6,8,0,2,'(011) 4191-4433',''),(8,9,0,2,'(011) 4191-4433',''),(9,10,0,2,'(037) 3261-9150',''),(10,10,0,6,'(037) 3261-9150',''),(11,10,0,4,'sommus@sommus.com',''),(12,11,0,2,'(037) 3261-2003',''),(13,11,0,6,'(037) 3261-2003',''),(14,11,0,4,'desenvolvimento1@sommus.com',''),(18,12,0,2,'(037) 3261-9450',''),(19,12,0,6,'(037) 3261-2003',''),(20,12,0,4,'atendimento@patrimoniumcontabilidade.com.br',''),(22,14,0,2,'(32) 3531-5523',''),(23,15,0,2,'(37) 99197-3003',''),(24,13,0,2,'(32) 3531-5523',''),(26,16,0,4,'sommus@sommus.com',''),(28,19,0,2,'(011) 5482-5485',''),(29,20,0,2,'(011) 5482-5485',''),(30,21,0,2,'(011) 5482-5485',''),(31,22,0,2,'(011) 5482-5485',''),(32,23,0,2,'(011) 5482-5485',''),(33,24,0,2,'(011) 5482-5485',''),(34,25,0,2,'(011) 5482-5485',''),(35,26,0,2,'(011) 5482-5485',''),(36,27,0,2,'(011) 5482-5485',''),(37,28,0,2,'(011) 5482-5485',''),(38,29,0,2,'(011) 5482-5485',''),(39,30,0,2,'(011) 5482-5485',''),(40,31,0,2,'(011) 5482-5485',''),(41,32,0,2,'(011) 5482-5485',''),(42,33,0,2,'(011) 5482-5485',''),(43,34,0,2,'(011) 5482-5485',''),(44,35,0,2,'(011) 5482-5485',''),(45,36,0,2,'(011) 5482-5485',''),(46,37,0,2,'(011) 5482-5485',''),(47,18,0,2,'(011) 3458-8875',''),(48,41,0,3,'91994103377',''),(49,42,0,3,'62993503717',''),(50,45,0,3,'88991538296',''),(51,47,15,2,'3735214301',''),(52,47,16,4,'vap4@grupovap.com.br',''),(53,48,3,2,'037998653157',''),(54,48,24,3,'037999887766',''),(55,49,9,2,'3735224796',''),(56,49,10,2,'3735224796',''),(57,49,11,4,'stacaomodas@hotmail.com','');
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
INSERT INTO `pessoa_empresa` VALUES (3,1,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(5,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(8,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(8,2,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,1,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,2,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(10,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,1,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(12,1,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(12,2,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(13,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(13,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(14,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(15,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(16,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(17,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(18,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(18,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(40,1,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(40,2,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(41,2,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(42,1,10,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(42,2,10,0,0.00,0.00,0,0.00,9,'2022-11-30',1,0),(43,1,10,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(43,2,10,0,0.00,0.00,0,0.00,9,'2022-11-30',1,0),(44,2,10,0,0.00,0.00,0,0.00,9,'2022-11-30',0,1),(45,1,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(45,2,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(46,2,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(47,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(48,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(49,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(50,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(50,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(51,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(52,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(53,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(54,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(55,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(56,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,1,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35580000','Lagoa da Prata','MG','3137205','',1),(2,2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',0),(3,2,3,'Av. Brasil','328','Centro','2º Andar','35590000','Lagoa da Prata','MG','3137205','',1),(5,3,0,'Av. Brasil','555','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(6,5,0,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35580000','Lagoa da Prata','MG','','',1),(7,6,0,'Av. Brasil','555','Centro','Loja 1','35580000','Lagoa da Prata','MG','3137205','',1),(9,8,0,'Av. Chedid Jafet','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1),(11,9,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1),(12,10,0,'Av. Brasil','33','Centro','Loja 1','35590000','Lagoa da Prata','MG','3137205','',1),(13,11,0,'Av. Modesto Gomes','52','Centro','Casa','35590000','Lagoa da Prata','MG','3137205','',1),(15,12,0,'Praça Coronel Carlos Bernardes','15','Centro','','35590000','Lagoa da Prata','MG','3137205','',1),(17,14,0,'Rua da Flores','352','Centro','','39680000','Capelinha','MG','','',1),(18,15,0,'Av. Joaquim Gomes Pereira','774','Gomes','','35590000','Lagoa da Prata','MG','','',1),(19,13,0,'Av. Cristiano Rocas','52','Centro','','36500000','Ubá','MG','','',1),(21,16,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1),(23,19,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(24,20,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(25,21,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(26,22,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(27,23,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(28,24,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(29,25,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(30,26,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(31,27,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(32,28,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(33,29,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(34,30,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(35,31,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(36,32,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(37,33,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(38,34,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(39,35,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(40,36,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(41,37,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1),(42,18,0,'Rua Bahia','2015','Centro','Edifício JK','04551065','Rio de Janeiro','RJ','','',1),(43,41,0,'Vila Vieira','710','Marco','','66093360','Belém','PA','','',1),(44,42,0,'Avenida Ribeirão Preto','739','Jardim Novo Mundo','','74715430','Goiânia','GO','','',1),(45,45,0,'Rua Napoleão de Holanda Montenegro','840','Campo Novo','','63905405','Quixadá','CE','','',1),(46,47,9,'FAUSTINO TEIXEIRA','220','Centro','','35600000','Bom Despacho','MG','3171303','',1),(47,48,4,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1),(48,49,7,'Rua das Antilhas','300','Dom Joaquim','','35600000','Bom Despacho','MG','3107406','',1);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,8,''),(3,NULL,8,''),(4,NULL,8,''),(5,NULL,2,''),(6,NULL,2,''),(7,NULL,2,''),(8,NULL,1,''),(9,NULL,5,''),(11,NULL,4,''),(12,NULL,6,''),(13,NULL,1,''),(13,NULL,9,''),(14,NULL,2,''),(14,NULL,9,''),(15,NULL,2,''),(15,NULL,9,''),(16,NULL,3,'filial XX'),(17,NULL,3,''),(18,NULL,7,''),(19,NULL,7,''),(20,NULL,7,''),(21,NULL,7,''),(22,NULL,7,''),(23,NULL,7,''),(24,NULL,7,''),(25,NULL,7,''),(26,NULL,7,''),(27,NULL,7,''),(28,NULL,7,''),(29,NULL,7,''),(30,NULL,7,''),(31,NULL,7,''),(32,NULL,7,''),(33,NULL,7,''),(34,NULL,7,''),(35,NULL,7,''),(36,NULL,7,''),(37,NULL,7,''),(38,NULL,7,''),(39,NULL,7,''),(40,NULL,12,'ESSA É A OBSERVAÇÃO... SUPER INTERESSANTE! OLHA QUE LEGAL'),(42,NULL,10,''),(43,NULL,10,''),(44,NULL,10,''),(45,NULL,11,''),(47,NULL,1,''),(48,NULL,1,''),(49,NULL,1,''),(50,NULL,7,''),(51,NULL,7,''),(52,NULL,1,''),(53,NULL,7,''),(54,NULL,7,''),(55,NULL,7,''),(56,NULL,7,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento`
--

LOCK TABLES `plano_pagamento` WRITE;
/*!40000 ALTER TABLE `plano_pagamento` DISABLE KEYS */;
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-11-23 10:20:06'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-11-23 10:20:05'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-11-23 10:20:05'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-11-23 10:20:06'),(5,NULL,'À vista',1,1,0,0,0,'2022-11-23 10:20:05'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2022-11-23 10:20:06'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2022-11-23 10:20:06'),(8,NULL,'Teste exclusão',1,1,0,0,0,'2022-11-23 10:20:06');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,0,0),(2,2,0,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,2,0,0),(6,1,1,0),(6,2,1,0),(7,1,1,0),(7,2,1,0),(8,1,0,1),(8,2,0,1);
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
INSERT INTO `plano_pagamento_prazo` VALUES (2,30),(3,30),(3,60),(4,30),(4,60),(4,90),(6,30),(6,60),(6,90);
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
INSERT INTO `produto` VALUES (1,NULL,'SommusGestor','SommusGestor',0,NULL,'',1,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:19:26'),(2,NULL,'Treinamento Online','Treinamento Online',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:21:49'),(3,NULL,'SommusVendas (Mobile)','SommusVendas (Mobile)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(4,NULL,'SommusVendas (Desktop)','SommusVendas (Desktop)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(901,NULL,'Suporte técnico','Suporte técnico',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:21:49'),(1001,NULL,'Outro serviço','Outro serviço',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-11-23 10:21:50'),(1002,NULL,'Implantação','Implantação em loco',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-11-23 10:21:50'),(1003,NULL,'Customização','Customização por hora',9,2,'',3,NULL,0,'','','','','0104',0,0,'',0,'',0,'2022-11-23 10:21:50'),(1004,NULL,'Consultoria','Consultoria Fiscal',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2022-11-23 10:21:49'),(1005,NULL,'Teste exclusão','Teste exclusão',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:19:22'),(1006,NULL,'Teste exclusão','',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:19:25');
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
INSERT INTO `produto_grupo` VALUES (1,'Cereais alterados','2022-11-23 10:19:26'),(2,'Enlatados','2022-11-23 10:19:21'),(3,'Serviços de Suporte','2022-11-23 10:19:21'),(4,'Higiene','2022-11-23 10:19:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_inventario`
--

LOCK TABLES `produto_inventario` WRITE;
/*!40000 ALTER TABLE `produto_inventario` DISABLE KEYS */;
INSERT INTO `produto_inventario` VALUES (1,1,1006,'202210',0.0000,0.0000),(2,2,1006,'202210',0.0000,0.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
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
INSERT INTO `produto_sped` VALUES (1,1006,'Teste exclusão','2022-11-23','0001-01-01');
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
INSERT INTO `produto_unidade` VALUES (1,'Caixa','CX',0,'2022-11-23 10:19:21'),(2,'Pacote','PCT',0,'2022-11-23 10:19:21'),(3,'Teste','Test',0,'2022-11-23 10:19:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,2,8,NULL,NULL,2,'1ab','2022-11-23','2022-11-28','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0),(2,NULL,2,8,NULL,NULL,2,'0000000002','2022-11-23','2022-12-23','0001-01-01',181.25,12.68,0.00,37.32,0.0000,'',0,0,0),(3,NULL,2,8,NULL,NULL,1,'0000000003','2022-11-23','2022-12-23','0001-01-01',170.50,0.00,0.00,0.00,0.0000,'',0,0,1),(4,NULL,2,8,NULL,NULL,1,'0000000004','2022-11-23','2022-12-23','0001-01-01',108.26,0.00,0.00,0.00,0.0000,'',0,0,0),(5,NULL,2,8,NULL,NULL,1,'0000000005','2022-11-23','2022-12-23','0001-01-01',200.00,0.00,0.00,0.00,0.0000,'',0,0,0),(6,NULL,2,8,NULL,NULL,1,'0000000006','2022-11-23','2022-12-23','0001-01-01',255.00,15.00,15.00,230.00,0.0000,'',0,0,0),(7,NULL,2,8,NULL,NULL,1,'0000000007','2022-11-23','2022-12-23','2022-11-23',100.00,0.00,15.00,115.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,225,100.0000),(2,225,100.0000),(4,225,100.0000),(5,225,100.0000),(6,225,100.0000),(7,225,100.0000);
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
INSERT INTO `receber_centro_resultado` VALUES (4,3,50.0000),(4,4,50.0000),(5,1,100.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
INSERT INTO `recebimento` VALUES (1,2,'2022-11-23',170.50,0.00,0.00,170.25,1),(2,2,'2022-11-23',181.25,0.00,5.00,25.00,1),(3,2,'2022-11-23',181.25,12.68,0.00,37.32,0),(4,1,'2022-11-23',308.26,8.26,0.00,300.00,1),(5,1,'2022-11-23',255.00,0.00,0.00,50.00,0),(6,1,'2022-11-23',205.00,0.00,15.00,120.00,0),(7,1,'2022-11-23',100.00,15.00,0.00,50.00,0),(8,1,'2022-11-23',35.00,0.00,0.00,10.00,0),(9,1,'2022-11-23',100.00,0.00,15.00,115.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_cancelado`
--

LOCK TABLES `recebimento_cancelado` WRITE;
/*!40000 ALTER TABLE `recebimento_cancelado` DISABLE KEYS */;
INSERT INTO `recebimento_cancelado` VALUES (1,1,'2022-11-23'),(2,2,'2022-11-23'),(3,4,'2022-11-23'),(4,4,'2022-11-23');
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
INSERT INTO `recebimento_cancelado_receber` VALUES (1,1,1),(2,2,2),(3,4,4),(4,4,5);
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
INSERT INTO `recebimento_informado` VALUES (1,0,'2022-11-23 10:22:20','2022-11-23');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento_receber`
--

LOCK TABLES `recebimento_receber` WRITE;
/*!40000 ALTER TABLE `recebimento_receber` DISABLE KEYS */;
INSERT INTO `recebimento_receber` VALUES (1,1,1,170.50,0.00,0.00,170.25,1),(2,2,2,181.25,0.00,5.00,25.00,1),(3,3,2,181.25,12.68,0.00,37.32,0),(4,4,4,108.26,8.26,0.00,100.00,1),(5,4,5,200.00,0.00,0.00,200.00,1),(6,5,6,255.00,0.00,0.00,50.00,0),(7,6,6,205.00,0.00,15.00,120.00,0),(8,7,6,100.00,15.00,0.00,50.00,0),(9,8,6,35.00,0.00,0.00,10.00,0),(10,9,7,100.00,0.00,15.00,115.00,0);
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
INSERT INTO `recebimento_receber_categoria` VALUES (1,225,170.25),(2,225,25.00),(3,225,37.32),(4,225,100.00),(5,225,200.00),(6,225,50.00),(7,225,120.00),(8,225,50.00),(9,225,10.00),(10,225,115.00);
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
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',12,''),(31,2,1,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'',60,''),(32,3,6,2,'MG','Compra de Mercadorias Tributadas',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(33,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'',NULL,''),(34,4,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio`
--

LOCK TABLES `relatorio` WRITE;
/*!40000 ALTER TABLE `relatorio` DISABLE KEYS */;
INSERT INTO `relatorio` VALUES (1,'Relatorio 1',1,'SG1',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_campo`
--

LOCK TABLES `relatorio_campo` WRITE;
/*!40000 ALTER TABLE `relatorio_campo` DISABLE KEYS */;
INSERT INTO `relatorio_campo` VALUES (1,1,'SG1.1',1,'',0,0,0),(2,1,'SG1.2',2,'',0,0,0),(4,1,'SG1.4',3,'',0,0,0),(5,1,'SG2.1',6,'',0,0,0),(6,1,'SG2.2',7,'',0,0,0),(7,1,'SG3.1',5,'',0,1,0),(8,1,'SG3.2',4,'',0,0,0),(9,1,'SG1.5',0,'',0,0,0),(10,1,'SG3.3',8,'',0,0,0);
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
INSERT INTO `relatorio_empresa` VALUES (1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_parametro`
--

LOCK TABLES `relatorio_parametro` WRITE;
/*!40000 ALTER TABLE `relatorio_parametro` DISABLE KEYS */;
INSERT INTO `relatorio_parametro` VALUES (1,1,1,'SG1.1',0,1,1,'');
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
INSERT INTO `relatorio_usuario` VALUES (1,1,1);
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
INSERT INTO `service_empresa` VALUES (1,1,1123,1,'2022-11-25 11:45:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
INSERT INTO `sla` VALUES (1,1,'Sla CRUD * alterado',85.0000,1,1,144000,108000,72000,36000,0,0,1),(2,1,'Solução de 85% dos incidentes em até 08 horas',85.0000,1,1,600,1200,1800,2400,1,1,0);
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
INSERT INTO `sla_nivel` VALUES (2,1,3600,7200,10800,14400),(2,2,7200,14400,21600,28800);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_categoria`
--

LOCK TABLES `solicitacao_categoria` WRITE;
/*!40000 ALTER TABLE `solicitacao_categoria` DISABLE KEYS */;
INSERT INTO `solicitacao_categoria` VALUES (1,'Categoria de solicitação CRUD * alterada'),(2,'Emissão de NFe'),(3,'Relatórios'),(4,'Contas a receber'),(5,'Vendas'),(6,'Compras'),(7,'Teste exclusão categoria');
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
INSERT INTO `solicitacao_categoria_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,1,0),(5,2,1,0),(6,1,1,0),(6,2,1,0),(7,1,0,1),(7,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_lista`
--

LOCK TABLES `solicitacao_lista` WRITE;
/*!40000 ALTER TABLE `solicitacao_lista` DISABLE KEYS */;
INSERT INTO `solicitacao_lista` VALUES (1,1,1,'2022-11-23 10:21:40','Lista de solicitações CRUD * alterado',1),(2,1,1,'2022-11-23 10:22:22','Lista de solicitações CRUD',0),(3,1,1,'2022-11-23 10:22:22','Lista de solicitações CRUD',0);
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
INSERT INTO `solicitacao_lista_item` VALUES (2,3,1),(3,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_origem`
--

LOCK TABLES `solicitacao_origem` WRITE;
/*!40000 ALTER TABLE `solicitacao_origem` DISABLE KEYS */;
INSERT INTO `solicitacao_origem` VALUES (1,'Origem de solicitação CRUD * alterada'),(2,'Telefone'),(3,'Skype'),(4,'WhatsApp'),(5,'Teste exclusão origem');
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
INSERT INTO `solicitacao_origem_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,0,1),(5,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_tipo`
--

LOCK TABLES `solicitacao_tipo` WRITE;
/*!40000 ALTER TABLE `solicitacao_tipo` DISABLE KEYS */;
INSERT INTO `solicitacao_tipo` VALUES (1,'Tipo de solicitação CRUD * alterado',1,1),(2,'Bug',1,1),(3,'Alteração',2,0),(4,'Dúvida',3,0),(5,'Teste exclusão',1,0);
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
INSERT INTO `solicitacao_tipo_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,0,1),(5,2,0,1);
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
INSERT INTO `sommusdash_usuario` VALUES (1,'SommusGestor','1c1394a566f41533bc1a75293f3c5b6b','','sommusgestor@sommusgestor.com'),(2,'Sommus Sistemas 2','ade83f69353b6232a1294afd123dc5cc','','sommus2@sommus.com'),(3,'Usuário Selenium','8e00596ad8de2213ff8f8d8478d5362c','','usuario@selenium.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (1,2,1,'Ligar para o cliente','0001-01-01 00:00:00','0001-01-01 00:00:00','0001-01-01 00:00:00',1,0.0000,1,0),(2,2,1,'Ligar para obter uma resposta do cliente sobre a negociação do sistema','0001-01-01 00:00:00','0001-01-01 00:00:00','0001-01-01 00:00:00',1,0.0000,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2022-11-23 10:18:31','1cb1845a62778c223fc63b50c1e0fb8c'),(2,2,'20221114.182125.297','2022-11-23 10:18:31','c94161b1693f549e64718d8a547d5b31'),(3,2,'20220927.231853.021-financas','2022-11-23 10:18:32','020e7be5e2574dd2235b54232a55d09b'),(4,2,'20220927.231856.052-financas','2022-11-23 10:18:32','3fdb65881ea84fbb298423e3e5e9a30a'),(5,2,'20220927.231859.082-financas','2022-11-23 10:18:32','89f734ba93c0f5c45f44d8c129208903'),(6,2,'20220927.231902.116-financas','2022-11-23 10:18:32','d6174dbef16107e967960ab8291b4fa8'),(7,2,'20220927.231905.158-financas','2022-11-23 10:18:32','612488e8c52a3a753aece28818155e9b'),(8,2,'20220927.231908.190-financas','2022-11-23 10:18:32','f15a8f734e95265bb96bc1de386a96c6'),(9,2,'20220927.231911.215-financas','2022-11-23 10:18:32','f650778ecc8b51f5bcefb91f325347de'),(10,2,'20220927.231914.237-financas','2022-11-23 10:18:32','ba764cd5961f2625635a5b738918ce28'),(11,2,'20220927.231917.275-financas','2022-11-23 10:18:32','ecd0711fa2cd97ebf50fce3859651f9b'),(12,2,'20220927.231920.311-financas','2022-11-23 10:18:32','d5b65b569012466ca3e1061199ba5914'),(13,2,'20220927.231923.342-financas','2022-11-23 10:18:32','9a3047d6006a4d452754a3664dd613da'),(14,2,'20220927.231926.383-financas','2022-11-23 10:18:32','424b72fc94ec9db102e5f0d4de2858a4'),(15,2,'20220927.231929.422-financas','2022-11-23 10:18:32','e4739b661583009cba6caa83b2e8d130'),(16,2,'20220927.231932.449-financas','2022-11-23 10:18:32','296dfb0f93eda1d0a8c5f8af5ebed177'),(17,2,'20220927.231935.475-financas','2022-11-23 10:18:32','756abe2996dccc9d11ffd429b9e2a8e9'),(18,2,'20220927.231938.503-financas','2022-11-23 10:18:32','73a317cde0be5228f6a2496efa058689'),(19,2,'20220927.231941.539-financas','2022-11-23 10:18:32','1fe02c4eb66f2866a345501b36cd01a1'),(20,2,'20220927.231944.560-financas','2022-11-23 10:18:32','f8dba41566e1472254ee7d964ff50da4'),(21,2,'20220927.231947.591-financas','2022-11-23 10:18:32','ed73354b77f863969cea683a78084120'),(22,2,'20220927.231950.619-financas','2022-11-23 10:18:32','a4e705aa3fb768d2a776a7f685c982e6'),(23,2,'20220927.231953.643-financas','2022-11-23 10:18:32','103cfe4ff1ead36d7f435fbf26a20dfb'),(24,2,'20220927.231956.678-financas','2022-11-23 10:18:32','bffe30fba8819877186a750101505384'),(25,2,'20220927.231959.720-financas','2022-11-23 10:18:32','27dcd0d04144936992ca794d5ec9d57f'),(26,2,'20220927.232002.752-financas','2022-11-23 10:18:32','0e453f59a4f7de4b3f7c8d94c0c92986'),(27,2,'20220927.232005.779-financas','2022-11-23 10:18:32','bbd0b91f573581f34ecdc63848772e16'),(28,2,'20220927.232008.813-financas','2022-11-23 10:18:32','6057c4cf9c49b89186c43b7d9409e017'),(29,2,'20220927.232011.839-financas','2022-11-23 10:18:32','c40b53b0f60f60d15acccfed029e65dc'),(30,2,'20220927.232014.867-financas','2022-11-23 10:18:32','168992e02757014b1b978efb0e20f1d1'),(31,2,'20220927.232017.894-financas','2022-11-23 10:18:32','803f9637ce6d313c72f1378256a2ce9e'),(32,2,'20220927.232020.927-financas','2022-11-23 10:18:32','839af5b5e4aaca5f2b31a1acdae72bdd'),(33,2,'20220927.232023.968-financas','2022-11-23 10:18:32','a6cb5d28e52b943f83a7d178d1e69986'),(34,2,'20220927.232026.997-financas','2022-11-23 10:18:32','e38e672a1b435d183775cb04c780386e'),(35,2,'20220927.232030.018-financas','2022-11-23 10:18:32','0b7b0b8275deb7ac2583f65be342e9c2'),(36,2,'20220927.232033.051-financas','2022-11-23 10:18:32','7bc310052575d98001f7faf3d2226567'),(37,2,'20220927.232036.093-financas','2022-11-23 10:18:32','796e30efd7c000d128a4ffd9f2432f7d'),(38,2,'20220927.232039.127-financas','2022-11-23 10:18:32','ac0291e2f2f363cbec82f3dbe58cc7cc'),(39,2,'20220927.232042.162-financas','2022-11-23 10:18:32','30ba8e32852e915af05876d4fbe1a9f7'),(40,2,'20220927.232045.187-financas','2022-11-23 10:18:32','665385f849df6edb141e7489b9b7b403'),(41,2,'20220927.232048.220-financas','2022-11-23 10:18:32','4f03136ba963604e3c95110e6f6dd870'),(42,2,'20220927.232051.257-financas','2022-11-23 10:18:32','5a2271175b2f4ab1b4af945f98130b9c'),(43,2,'20220927.232054.286-financas','2022-11-23 10:18:32','4e273807920627f10c812c33e5daf999'),(44,2,'20220927.232057.328-financas','2022-11-23 10:18:32','aba893836cfa0af640523f36dde81a0d'),(45,2,'20220927.232100.367-financas','2022-11-23 10:18:32','653d096e04adcc21a803ab0ac5ff2795'),(46,2,'20220927.232103.395-financas','2022-11-23 10:18:32','1371b16ce59fe0eb86d381c51720556e'),(47,2,'20220927.232106.423-financas','2022-11-23 10:18:32','28ea12afbd16b2a371ec69dce090db07'),(48,2,'20220927.232109.456-financas','2022-11-23 10:18:32','ac94e33109e2c98c8eb2f44e4872ec6d'),(49,2,'20220927.232112.491-financas','2022-11-23 10:18:32','a3a72721800fd94a935894685271edbc'),(50,2,'20220927.232115.513-financas','2022-11-23 10:18:32','58ee208bfdc000681a132c77f38949ec'),(51,2,'20220927.232118.547-financas','2022-11-23 10:18:32','27b18a1f6566bd4bdd00f238f9c13a2d'),(52,2,'20220927.232121.575-financas','2022-11-23 10:18:32','727d361c23caeb121118558a44f24985'),(53,2,'20220927.232124.607-financas','2022-11-23 10:18:32','ef02a35222bbdc99eca8feebb122980a'),(54,2,'20220927.232127.635-financas','2022-11-23 10:18:32','55c09b201914d7de34115922d12d2d3e'),(55,2,'20220927.232130.676-financas','2022-11-23 10:18:32','583c31d7b050d3bb3a18ad9af0b353ef'),(56,2,'20220927.232133.705-financas','2022-11-23 10:18:32','5d0520621c1146610cfbae1917646332'),(57,2,'20220927.232136.737-financas','2022-11-23 10:18:32','f43c56a1fd096188ecf49856c1581226'),(58,2,'20220927.232139.771-financas','2022-11-23 10:18:32','3c5e171d71e0f255347eab69c28d1d5d'),(59,2,'20220927.232142.802-financas','2022-11-23 10:18:32','44d0ff24dd9116d6b6f008a22289b957'),(60,2,'20220927.232145.829-financas','2022-11-23 10:18:32','08fc1f81a942160134252b714754fc18'),(61,2,'20220927.232148.858-financas','2022-11-23 10:18:32','17e7c526fee39591457bc98242d8b54c'),(62,2,'20220927.232151.889-financas','2022-11-23 10:18:32','71327a50e22af55aeaf14745afc223bd'),(63,2,'20220927.232154.913-financas','2022-11-23 10:18:32','02a73caa7d688bc1c63a41661bea3746'),(64,2,'20220927.232157.949-financas','2022-11-23 10:18:32','948188f5daf22f790efc6936b9b74998'),(65,2,'20220927.232200.972-financas','2022-11-23 10:18:32','a5cd7f247d602c177f9f59bcee32f700'),(66,2,'20220927.232204.006-financas','2022-11-23 10:18:32','e56a33a0e9610a4b0453904b25b8f8af'),(67,2,'20220927.232207.039-financas','2022-11-23 10:18:32','3346269ede6acfa7865cc1cb0064fdb6'),(68,2,'20220927.232210.064-financas','2022-11-23 10:18:32','3dcde7fd390f966471abf29017a0b15e'),(69,2,'20220927.232213.090-financas','2022-11-23 10:18:32','ece714a398a7b08ee3c30be7aa8a8ac8'),(70,2,'20220927.232216.129-financas','2022-11-23 10:18:32','fb0ca8ce2342704b0f71b8b6d9d42134'),(71,2,'20220927.232219.167-financas','2022-11-23 10:18:32','1ef34b62bd6349f9034e65a8e6b7b87b'),(72,2,'20220927.232222.193-financas','2022-11-23 10:18:32','e776fc9e313314511dcdcb8c83cad9d7'),(73,2,'20220927.232225.219-financas','2022-11-23 10:18:32','1c2e3697135c8eba01c442c9cf85e46b'),(74,2,'20220927.232228.256-financas','2022-11-23 10:18:32','26d2165ed849b0ec27f4fc8845adf7ac'),(75,2,'20220927.232231.283-financas','2022-11-23 10:18:32','1c01342bb3fe49acd1f7c9836d3e306b'),(76,2,'20220927.232234.314-financas','2022-11-23 10:18:32','06ae7cb33c2f9a694d0eb9c19c9ed810'),(77,2,'20220927.232237.348-financas','2022-11-23 10:18:32','637e826e968efc236e2eab24598712c5'),(78,2,'20220927.232240.374-financas','2022-11-23 10:18:32','e3cce1ee6f2175ffaca60795a0ff6e95'),(79,2,'20220927.232243.406-financas','2022-11-23 10:18:32','089b57e856e50dd87b1cb9b40578b43f'),(80,2,'20220927.232246.448-financas','2022-11-23 10:18:32','77220d8848dbe655c306557a62293636'),(81,2,'20220927.232249.485-financas','2022-11-23 10:18:32','938982a817af4b10ebdbe3f33bbefc62'),(82,2,'20220927.232252.522-financas','2022-11-23 10:18:32','e7cd7f831384b6531515979570d298fc'),(83,2,'20220927.232255.558-financas','2022-11-23 10:18:32','b3394472825c42eeb5f85b086af3d706'),(84,2,'20220927.232258.583-financas','2022-11-23 10:18:32','2e73cc358e5e1b42d08db248b19cb388'),(85,2,'20220927.232301.622-financas','2022-11-23 10:18:32','2f6f7e481f514a62104030095096ea88'),(86,2,'20220927.232304.657-financas','2022-11-23 10:18:32','473e73a47b36978379095ab13f4525d6'),(87,2,'20220927.232307.681-financas','2022-11-23 10:18:32','4ff8583b2ef19e8a2fb0903cea2ffec5'),(88,2,'20220927.232310.703-financas','2022-11-23 10:18:32','d56bb407c6b21ad6b7ce2cfd61047ab1'),(89,2,'20220927.232313.739-financas','2022-11-23 10:18:32','21d6ba4ccc48adfbf0f08c6c21a1fe2c'),(90,2,'20220927.232316.772-financas','2022-11-23 10:18:32','f33cad7dd3274121a00792aab235998c'),(91,2,'20220927.232319.805-financas','2022-11-23 10:18:32','9637ff4797690743d61f24eccbd8085b'),(92,2,'20220927.232322.838-financas','2022-11-23 10:18:32','c66d272ffec8c3a2d6348777dbd39019'),(93,2,'20220927.232325.873-financas','2022-11-23 10:18:32','429d305e3207b715984af14e14941a0e'),(94,2,'20220927.232328.902-financas','2022-11-23 10:18:32','9b26c0ab1e81af87456c7cb4ddb5c30d'),(95,2,'20220927.232331.926-financas','2022-11-23 10:18:32','75afac6ca3e5c8dfb153122736167f9d'),(96,2,'20220927.232334.967-financas','2022-11-23 10:18:32','eac5b7e1c278e40123bd4ac4f6768c56'),(97,2,'20220927.232338.003-financas','2022-11-23 10:18:32','cd9f1cc8488c41846b454c4dc0ef3418'),(98,2,'20220927.232341.029-financas','2022-11-23 10:18:32','e9ac9d7d32834ac4e1d8def94edb29f9'),(99,2,'20220927.232344.066-financas','2022-11-23 10:18:32','74df74edb434cc8364cd5472e1b22565'),(100,2,'20220927.232347.103-financas','2022-11-23 10:18:32','e389b3d060607a06da6a97854ab5f085'),(101,2,'20220927.232350.132-financas','2022-11-23 10:18:32','91de2882a7c0d6d4f65b33e6899bb652'),(102,2,'20220927.232353.175-financas','2022-11-23 10:18:32','e978842cd60848b73bb1350a3b93fdfc'),(103,2,'20220927.232356.206-financas','2022-11-23 10:18:32','14e0bdc019080a52eb6d7eb264020797'),(104,2,'20220927.232359.244-financas','2022-11-23 10:18:32','a1755eba15f285ad1980162c1d5f5b20'),(105,2,'20220927.232402.269-financas','2022-11-23 10:18:32','ee782cfb277f6a01d7033d943f29cf1d'),(106,2,'20220927.232405.304-financas','2022-11-23 10:18:32','4896ead92dea4d3e72a8ad6be79db247'),(107,2,'20220927.232408.343-financas','2022-11-23 10:18:32','239790d17a0680452d385722af7bdd10'),(108,2,'20220927.232411.376-financas','2022-11-23 10:18:32','f40cb305586270487984ff6fc5121755'),(109,2,'20220927.232414.410-financas','2022-11-23 10:18:32','cfb3207fda2aa97c88fa6e87070920c7'),(110,2,'20220927.232417.444-financas','2022-11-23 10:18:32','32004b98b878ed6cd58ad7478914633a'),(111,2,'20220927.232420.471-financas','2022-11-23 10:18:32','bc15fa765e24aa32bce07d9afbe50428'),(112,2,'20220927.232423.505-financas','2022-11-23 10:18:32','1115c435cde7bea7c05d9eb2c059504b'),(113,2,'20220927.232426.546-financas','2022-11-23 10:18:32','7d810b72d0510fa4bb90680ef978767e'),(114,2,'20220927.232429.583-financas','2022-11-23 10:18:32','0bc57d41edf8409f5c3a58c3f3026a28'),(115,2,'20220927.232432.614-financas','2022-11-23 10:18:32','baa235c9e2873f854924eb5f1459ed30'),(116,2,'20220927.232435.654-financas','2022-11-23 10:18:32','0470b38d3c375572e59b5474c2992ebd'),(117,2,'20220927.232438.684-financas','2022-11-23 10:18:32','c9521e7a903105b7e7b913af53da37b0'),(118,2,'20220927.232441.715-financas','2022-11-23 10:18:32','bfd7eb77b1a56adacecba9640a0183be'),(119,2,'20220927.232444.751-financas','2022-11-23 10:18:32','acb509aa2c14e20c6c43a793b7d32847'),(120,2,'20220927.232447.784-financas','2022-11-23 10:18:32','3fcf38f2f05484523efa46d1288bdea0'),(121,2,'20220927.232450.819-financas','2022-11-23 10:18:32','10dd3145021037f6cfbf689c818f5f4b'),(122,2,'20220927.232453.859-financas','2022-11-23 10:18:32','bbe51658dde35ff72741586d33b7cee5'),(123,2,'20220927.232456.892-financas','2022-11-23 10:18:32','ffede728a42951eb1aaa1e6ababbbe39'),(124,2,'20220927.232459.921-financas','2022-11-23 10:18:32','ceccb198aea768896a7a55865c5fbc43'),(125,2,'20220927.232502.953-financas','2022-11-23 10:18:32','1447e0f671e1115023d6178e2407b50a'),(126,2,'20220927.232505.981-financas','2022-11-23 10:18:32','af1fa162ac05a72e91171cb9645cce88'),(127,2,'20220927.232509.010-financas','2022-11-23 10:18:32','346b6ec78b8e78d8ab8e85b65d0868b8'),(128,2,'20220927.232512.043-financas','2022-11-23 10:18:32','3b757668dcefc661004b63ad32caa54a'),(129,2,'20220927.232515.073-financas','2022-11-23 10:18:32','4cc9a8ccd4306cf844e2526b6ec6068b'),(130,2,'20220927.232518.111-financas','2022-11-23 10:18:32','36f85fcd2a5049a7c0d1c0d09d764578'),(131,2,'20220927.232521.154-financas','2022-11-23 10:18:32','3bd57647fb1e2d8815b292c4ad89ca79'),(132,2,'20220927.232524.192-financas','2022-11-23 10:18:32','c629159fbf162f20b37bed64c77a5aab'),(133,2,'20220927.232527.226-financas','2022-11-23 10:18:32','ce09ef644d496b96f474d26a7d3aa557'),(134,2,'20220927.232530.257-financas','2022-11-23 10:18:32','d4c915d94c278c91a980a5e9ac0cf89e'),(135,2,'20220927.232533.279-financas','2022-11-23 10:18:32','76c9195c75c3ec5c4ce38770216f435b'),(136,2,'20220927.232536.304-financas','2022-11-23 10:18:32','6895011c49bc38c32b66ee674e56d606'),(137,2,'20220927.232539.334-financas','2022-11-23 10:18:32','1f661b50a523fec53f0b82a6f78de514'),(138,2,'20220927.232542.376-financas','2022-11-23 10:18:32','41234c1a13ffad8816ace699f27b57b5'),(139,2,'20220927.232545.411-financas','2022-11-23 10:18:32','af1b6158a3d6c2c5f28b3b971caff047'),(140,2,'20220927.232548.441-financas','2022-11-23 10:18:32','4e1ed8e1860a964368b526cf72410dd0'),(141,2,'20220927.232551.469-financas','2022-11-23 10:18:32','627e6fad3bd7626d3ce841df9d6a53f5'),(142,2,'20220927.232554.498-financas','2022-11-23 10:18:32','714bfa5f33654dfe4538b4ce6fb36807'),(143,2,'20220927.232557.529-financas','2022-11-23 10:18:32','2876986d7c71e791066334cb58aaec27'),(144,2,'20220927.232600.560-financas','2022-11-23 10:18:32','4bec6ffb71c8a2f0d0590ed82eb43b68'),(145,2,'20220927.232603.602-financas','2022-11-23 10:18:32','7d1c69be129944fea182229e3b51dee5'),(146,2,'20220927.232606.641-financas','2022-11-23 10:18:32','1fa0f73a27cf1b3849d316deadfe3079'),(147,2,'20220927.232609.672-financas','2022-11-23 10:18:32','058f6de8801eeeba3ff4ccc0d679de32'),(148,2,'20220927.232612.696-financas','2022-11-23 10:18:32','d65b6abe3557ace76035c565322dab13'),(149,2,'20220927.232615.725-financas','2022-11-23 10:18:32','1de85f94d5884927799f6725e58ce63d'),(150,2,'20220927.232618.759-financas','2022-11-23 10:18:32','448c9a9e13ac7f14a60ba126636ce3ef'),(151,2,'20220927.232621.791-financas','2022-11-23 10:18:32','f628d85a87ab703a5e255082d54a1e36'),(152,2,'20220927.232624.818-financas','2022-11-23 10:18:32','d8c72ebe6f28686c1f7d931679845580'),(153,2,'20220927.232627.854-financas','2022-11-23 10:18:32','87479b3595c7efdf636941a597951e86'),(154,2,'20220927.232630.891-financas','2022-11-23 10:18:32','820685141ed0d4c459b49e84c67a3f54'),(155,2,'20220927.232633.913-financas','2022-11-23 10:18:32','8bab5f1a228745bd5dd30f3873aade5d'),(156,2,'20220927.232636.944-financas','2022-11-23 10:18:32','a2e86fcefd7b20b027bbf47ae22a2aaa'),(157,2,'20220927.232639.974-financas','2022-11-23 10:18:32','b77817fdb6e556f0fab119ce97bccd57'),(158,2,'20220927.232643.008-financas','2022-11-23 10:18:32','84e73209a8e411b903e26eb9ef022976'),(159,2,'20220927.232646.039-financas','2022-11-23 10:18:32','9d94d89f5b05286b5432c3e1801b19e7'),(160,2,'20220927.232649.072-financas','2022-11-23 10:18:32','41c8d0c590da97d4148900f13e757e28'),(161,2,'20220927.232652.103-financas','2022-11-23 10:18:32','ac124b2b561b88b38cd21f0a93bdf2e0'),(162,2,'20220927.232655.134-financas','2022-11-23 10:18:32','3dd53df8a45f6710e48688e364d617dc'),(163,2,'20220927.232658.169-financas','2022-11-23 10:18:32','926e575d69272684edd9bb9125c77c7f'),(164,2,'20220927.232701.204-financas','2022-11-23 10:18:32','08da0f4a34d9bc40595981b8b6c756a1'),(165,2,'20220927.232704.237-financas','2022-11-23 10:18:32','26ca8ce3d0bb4980088fa7346c08370e'),(166,2,'20220927.232707.265-financas','2022-11-23 10:18:32','2f901421ad028c2cf0c60a38d942b10e'),(167,2,'20220927.232710.291-financas','2022-11-23 10:18:32','4262fd89284019ac830356ecae74d5c2'),(168,2,'20220927.232713.319-financas','2022-11-23 10:18:32','ea584c078d4fe18db958fa53c7069995'),(169,2,'20220927.232716.345-financas','2022-11-23 10:18:32','c80f315812f472a5be20b132f505e13c'),(170,2,'20220927.232719.376-financas','2022-11-23 10:18:32','7ed4702f870f5c0fa9eac5de0b0caad7'),(171,2,'20220927.232722.413-financas','2022-11-23 10:18:32','3e034491d410cd3bf09dd2cf98448ba7'),(172,2,'20220927.232725.451-financas','2022-11-23 10:18:32','3c8ba06c0b54a92ef9a154feb247ad66'),(173,2,'20220927.232728.475-financas','2022-11-23 10:18:32','ff768b658497aa00d33560a5c4ecff8e'),(174,2,'20220927.232731.509-financas','2022-11-23 10:18:32','9b7450909360c79dd8ba5e9c3e7623e9'),(175,2,'20220927.232734.538-financas','2022-11-23 10:18:32','abe3569eb57e4a889960af72d1321665'),(176,2,'20220927.232737.569-financas','2022-11-23 10:18:32','30384f848da645edbf03e426c1f559cd'),(177,2,'20220927.232740.596-financas','2022-11-23 10:18:32','628b474ce4a932f51ca8355e868974a6'),(178,2,'20220927.232743.629-financas','2022-11-23 10:18:32','a098cc774fe2f73892cadd60574dce3f'),(179,2,'20220927.232746.669-financas','2022-11-23 10:18:32','f8e68f9aa55ef2cf4ebae220c169bd6c'),(180,2,'20220927.232749.707-financas','2022-11-23 10:18:32','be41d1804ee694e0373dc4a276052626'),(181,2,'20220927.232752.736-financas','2022-11-23 10:18:32','e7c9ba71bf6b5effe103bf93788d7a6d'),(182,2,'20220927.232755.766-financas','2022-11-23 10:18:32','c9ddf65829ea65ccead5cb019cd6702d'),(183,2,'20220927.232758.799-financas','2022-11-23 10:18:32','fa7c850764aab43cde50404f3c997d43'),(184,2,'20220927.232801.839-financas','2022-11-23 10:18:32','e96fe11f906f548de34e953588ea8e52'),(185,2,'20220927.232804.868-financas','2022-11-23 10:18:32','2d156664652e7317ab8dc6b321f04cf5'),(186,2,'20220927.232807.904-financas','2022-11-23 10:18:32','c117ed96c5f8c9d690f26ac55cb91cd6'),(187,2,'20220927.232810.940-financas','2022-11-23 10:18:32','1abf843477daf3e27cbc7538e8eb11fc'),(188,2,'20220927.232813.974-financas','2022-11-23 10:18:32','e979c6c819fc78a0c627190b8644add1'),(189,2,'20220927.232817.010-financas','2022-11-23 10:18:32','fb0b093630e3ac99fc86f68d0eaee8c2'),(190,2,'20220927.232820.040-financas','2022-11-23 10:18:32','9ea1723128e9646afcde0a0fb10234f7'),(191,2,'20220927.232823.062-financas','2022-11-23 10:18:32','044684faae04b3d4decaea71dcae0b41'),(192,2,'20220927.232826.092-financas','2022-11-23 10:18:32','fad2540f37131e2fefc237d93cd04913'),(193,2,'20220927.232829.122-financas','2022-11-23 10:18:32','80fa1297815d25bf6ad0f75a41c8c377'),(194,2,'20220927.232832.143-financas','2022-11-23 10:18:32','01c50d031d0ce7428a28c1d15ef71469'),(195,2,'20220927.232835.174-financas','2022-11-23 10:18:32','2815ae96250e0dd31b7536617200ee97'),(196,2,'20220927.232838.193-financas','2022-11-23 10:18:32','1be58ab38b849bacafdab672ae6b1edf'),(197,2,'20220927.232841.224-financas','2022-11-23 10:18:32','27f1b6b0aa27710f601e195d6d6d1d52'),(198,2,'20220927.232844.252-financas','2022-11-23 10:18:32','e37083497e4ea24d5848f9eb63d5b1a4'),(199,2,'20220927.232847.290-financas','2022-11-23 10:18:32','f367d5a202062ca125a35f4d5d07db51'),(200,2,'20220927.232850.325-financas','2022-11-23 10:18:32','7cd744c1d513b7922a2777b6a544bd01'),(201,2,'20220927.232853.357-financas','2022-11-23 10:18:32','2a7cd42776bc237e0e6e81a9712f2a0e'),(202,2,'20220927.232856.391-financas','2022-11-23 10:18:32','6cb6845334a63db162b45a06ce56db6c'),(203,2,'20220927.232859.421-financas','2022-11-23 10:18:32','8f1916f9bada61240d305037804ca132'),(204,2,'20220927.232902.454-financas','2022-11-23 10:18:32','cf7993d55ec6165bdd87eea28a197ca4'),(205,2,'20220927.232905.477-financas','2022-11-23 10:18:32','efdab804249136a3247d0bd9b8c9bb7c'),(206,2,'20220927.232908.500-financas','2022-11-23 10:18:32','1539f7e95f6d3e6a69097741d1a2cc96'),(207,2,'20220927.232911.522-financas','2022-11-23 10:18:32','caf34a441749b5bd893176adeb4af8a9'),(208,2,'20220927.232914.565-financas','2022-11-23 10:18:32','6dd1ba8850c6f9624f3eaf25daf2fc39'),(209,2,'20220927.232917.598-financas','2022-11-23 10:18:32','25158c0f5b76ff3933f270601bf97458'),(210,2,'20220927.232920.621-financas','2022-11-23 10:18:32','a94fba374d73808ea50b304a763a437e'),(211,2,'20220927.232923.657-financas','2022-11-23 10:18:32','03d81a40392b4b63ced42536bed6e6a1'),(212,2,'20220927.232926.695-financas','2022-11-23 10:18:32','aa49c5ea5f4ee01baee0b20d7dd8a856'),(213,2,'20220927.232929.719-financas','2022-11-23 10:18:32','53a1fb79bccde7acf7b0f79db8331087'),(214,2,'20220927.232932.746-financas','2022-11-23 10:18:32','1480dafeac24339603d32bcf0a545d14'),(215,2,'20220927.232935.782-financas','2022-11-23 10:18:32','d6f6124d5790386a3f5c24f2f9253408'),(216,2,'20220927.232938.815-financas','2022-11-23 10:18:32','786d9c0d8dddd5ae112a3eef8d5159db'),(217,2,'20220927.232941.849-financas','2022-11-23 10:18:32','2b9411143423b173d5a61a60c9bfb375'),(218,2,'20220927.232944.888-financas','2022-11-23 10:18:32','b37d14c6590ae7b2cfbe69c5b81142d8'),(219,2,'20220927.232947.917-financas','2022-11-23 10:18:32','402381a8a4e153f82008acf77b35e252'),(220,2,'20220927.232950.951-financas','2022-11-23 10:18:32','2d23a36cf8e8bcce9b3559b4a29170e8'),(221,2,'20220927.232953.974-financas','2022-11-23 10:18:32','35474edfc7206e15c004aa31fd6a7d5a'),(222,2,'20220927.232957.014-financas','2022-11-23 10:18:32','ffbe91bc9a11d8688fe69f7c2cc7e5e9'),(223,2,'20220927.233000.051-financas','2022-11-23 10:18:32','63722586948b991bcc64c65e32cf7ba8'),(224,2,'20220927.233003.079-financas','2022-11-23 10:18:32','613717bbac5798bcd13989ceb1b06098'),(225,2,'20220927.233006.103-financas','2022-11-23 10:18:32','4f3feb00f49a5ff59b20555078341e27'),(226,2,'20220927.233009.138-financas','2022-11-23 10:18:32','849ebd1353330140d0a10d452e8974a2'),(227,2,'20220927.233012.173-financas','2022-11-23 10:18:32','5fe7ab88c1f6a0e9885383ef041dd00b'),(228,2,'20220927.233015.214-financas','2022-11-23 10:18:32','874a3d3bc75c079c296c54b6e3e56130'),(229,2,'20220927.233018.251-financas','2022-11-23 10:18:32','af0fc8986d0a8f5701c0dc5a0095a35a'),(230,2,'20220927.233021.285-financas','2022-11-23 10:18:32','b445366e7684093163922c6429f8bbba'),(231,2,'20220927.233024.319-financas','2022-11-23 10:18:32','3c95e3c4b5111cb426954802efb4e752'),(232,2,'20220927.233027.356-financas','2022-11-23 10:18:32','6854d8175ada58331695607da71dc3fd'),(233,2,'20220927.233030.384-financas','2022-11-23 10:18:32','2265efac5cf13a249ae1169dc32e159b'),(234,2,'20220927.233033.418-financas','2022-11-23 10:18:32','87754f89482b802b30330e9a05ed0377'),(235,2,'20220927.233036.448-financas','2022-11-23 10:18:32','f1d0b506e494ef9864e26dde1b463f84'),(236,2,'20220927.233039.475-financas','2022-11-23 10:18:32','e01e2a76d4ce4a30951939757ddaeedb'),(237,2,'20220927.233042.508-financas','2022-11-23 10:18:32','03e2556bfbb52f0a5b76b5395234dd3f'),(238,2,'20220927.233045.537-financas','2022-11-23 10:18:32','4bf49a3b26ca70177054a32c43dda356'),(239,2,'20220927.233048.574-financas','2022-11-23 10:18:32','6fc5a88d68b988b72ee3405f7332ecfd'),(240,2,'20220927.233051.607-financas','2022-11-23 10:18:32','1d606091c0e65685bcb49685ad695b62'),(241,2,'20220927.233054.633-financas','2022-11-23 10:18:32','0ccf9a6e51711a56342dae2c811acc65'),(242,2,'20220927.233057.670-financas','2022-11-23 10:18:32','be9f6f43b39663737534ba9fe26b19df'),(243,2,'20220927.233100.705-financas','2022-11-23 10:18:32','8c69f892420f9bc72965e2a26ae8cce4'),(244,2,'20220927.233103.739-financas','2022-11-23 10:18:32','7984dbe620d54d5814c0cf72202f28a8'),(245,2,'20220927.233106.773-financas','2022-11-23 10:18:32','e5107a005a935cbf55e068acf24ee2cd'),(246,2,'20220927.233109.798-financas','2022-11-23 10:18:32','bebd60218cedd1bf1ce3ad686e23d2e3'),(247,2,'20220927.233112.826-financas','2022-11-23 10:18:32','d75feaeef7b6cdccc52df2df65bf9c27'),(248,2,'20220927.233115.869-financas','2022-11-23 10:18:32','ddf81a39589a076823b70addd0ede221'),(249,2,'20220927.233118.907-financas','2022-11-23 10:18:32','ee7599eec17490bc803b4cd3b85f0d77'),(250,2,'20220927.233121.950-financas','2022-11-23 10:18:32','4ce184b0c82826cce942738e7512ead3'),(251,2,'20220927.233124.971-financas','2022-11-23 10:18:32','e9cb6eab847e0d99a58f153dbb0dfe40'),(252,2,'20220927.233127.996-financas','2022-11-23 10:18:32','545a5a0ae66709e4acf97a66ad7c76d9'),(253,2,'20220927.233131.020-financas','2022-11-23 10:18:32','d5af423f629a903fb8637cc9cdb995f2'),(254,2,'20220927.233134.048-financas','2022-11-23 10:18:32','40fe1fbd9ad08f4cac2b5d3dae0a82d0'),(255,2,'20220927.233137.082-financas','2022-11-23 10:18:32','20027f5012a1d17e02d5492ab681d8f0'),(256,2,'20220927.233140.114-financas','2022-11-23 10:18:32','b2294e112060aeb8159eaec8ce7e7323'),(257,2,'20220927.233143.138-financas','2022-11-23 10:18:32','ead436d10b8a68ccca19352ce4a55de8'),(258,2,'20220927.233146.165-financas','2022-11-23 10:18:32','fa049f514fcefffe07587d92988d9aca'),(259,2,'20220927.233149.197-financas','2022-11-23 10:18:32','e4ac186ecb37e61bb97b5a1ec33ffb1f'),(260,2,'20220927.233152.220-financas','2022-11-23 10:18:32','c202316f4da7c1f9b143f516670ea9b7'),(261,2,'20220927.233155.254-financas','2022-11-23 10:18:32','2e53017a7536f8c2eb7ece544875621e'),(262,2,'20220927.233158.293-financas','2022-11-23 10:18:32','7480dbb207888ea5969fd67e1667a559'),(263,2,'20220927.233201.333-financas','2022-11-23 10:18:32','949f08c298a5f133b2b152135fa8c7ea'),(264,2,'20220927.233204.354-financas','2022-11-23 10:18:32','dc23a8102a0d7d21e1e350537e734361'),(265,2,'20220927.233207.389-financas','2022-11-23 10:18:32','a8c169144e261aa1e6e766c7e4390eb5'),(266,2,'20220927.233210.421-financas','2022-11-23 10:18:32','4af8f66ba03b4e32012b25eeadfd8ce7'),(267,2,'20220927.233213.451-financas','2022-11-23 10:18:32','5bccb9db37a766acffe471c49b02d2a1'),(268,2,'20220927.233216.484-financas','2022-11-23 10:18:32','5733940701f590e4cacf449fe48a6b51'),(269,2,'20220927.233219.516-financas','2022-11-23 10:18:32','1de047afd335f03a2e4bf13c75312133'),(270,2,'20220927.233222.552-financas','2022-11-23 10:18:32','5a36125c67c95953596e85c3d94ec1c9'),(271,2,'20220927.233225.592-financas','2022-11-23 10:18:32','85ac0510ff9eaa3e390a4e4275d25ffe'),(272,2,'20220927.233228.620-financas','2022-11-23 10:18:32','23875f8a9e77108153d6efefa1f8d7a7'),(273,2,'20220927.233231.649-financas','2022-11-23 10:18:32','bd2b84855b2c4c6f47a12977f9353e65'),(274,2,'20220927.233234.669-financas','2022-11-23 10:18:32','fb155fa4c994c797fe4f5998c0a0a821'),(275,2,'20220927.233237.700-financas','2022-11-23 10:18:32','d9120db384b0747c59cf9fac5cd0c66e'),(276,2,'20220927.233240.741-financas','2022-11-23 10:18:32','16707b206f9f7e475c5c9774ce14a33f'),(277,2,'20220927.233243.772-financas','2022-11-23 10:18:32','982c879edaaaf31b3b8cb1be77498e43'),(278,2,'20220927.233246.800-financas','2022-11-23 10:18:32','00c612f0d27d2434dacdaf33b2c3623f'),(279,2,'20220927.233249.833-financas','2022-11-23 10:18:32','a4ed359b83169388fbccd9b53b1c8517'),(280,2,'20220927.233252.865-financas','2022-11-23 10:18:32','8e2b098f4d0b399041b84d64947c866f'),(281,2,'20220927.233255.902-financas','2022-11-23 10:18:32','e05a4fb7434553067ec1f555e9d4e8c7'),(282,2,'20220927.233258.928-financas','2022-11-23 10:18:32','e5b96e1d6dae8578f59e90932d23870b'),(283,2,'20220927.233301.965-financas','2022-11-23 10:18:32','027692cf30ad60e8d63ce82346c3d1aa'),(284,2,'20220927.233304.995-financas','2022-11-23 10:18:32','e91eac0cdd1ccc4c69eba5964b185a58'),(285,2,'20220927.233308.032-financas','2022-11-23 10:18:32','4225bd17a41957a821149f31f72939b1'),(286,2,'20220927.233311.065-financas','2022-11-23 10:18:32','550ca4b9fa7b47710fe0fad6c5daec6c'),(287,2,'20220927.233314.087-financas','2022-11-23 10:18:32','7aaac3ae6b96af189d30fe717dc8066b'),(288,2,'20220927.233317.123-financas','2022-11-23 10:18:32','5c23ac480eb532932656fe98024d4c66'),(289,2,'20220927.233320.152-financas','2022-11-23 10:18:32','105c3017eeab1933bff0b4dafa01da97'),(290,2,'20220927.233323.176-financas','2022-11-23 10:18:32','b805d5ab315ec052f1fe1afa5486a119'),(291,2,'20220927.233326.216-financas','2022-11-23 10:18:32','b79863c2230c970888f0284ff149ac5e'),(292,2,'20220927.233329.250-financas','2022-11-23 10:18:32','cd49fae9b73acce1bbb6eafa070f192e'),(293,2,'20220927.233332.286-financas','2022-11-23 10:18:32','6803ac7846f6f12d0f4f1629086a4076'),(294,2,'20220927.233335.309-financas','2022-11-23 10:18:32','dd1097efe20a73e0a281586e27f8793d'),(295,2,'20220927.233338.333-financas','2022-11-23 10:18:32','37d924df3ce9b9083d93a592fa8baecb'),(296,2,'20220927.233341.370-financas','2022-11-23 10:18:32','aafe9b537cf6820d9ca81b21114d3063'),(297,2,'20220927.233344.403-financas','2022-11-23 10:18:32','b7b54dbd2f682d93f14f0f2fcc35b10a'),(298,2,'20220927.233347.437-financas','2022-11-23 10:18:32','a509ef9eb09ddcc31d5eeb208c53d0d5'),(299,2,'20220927.233350.473-financas','2022-11-23 10:18:32','29f498aafbad30bd3fc082100f105fd3'),(300,2,'20220927.233353.505-financas','2022-11-23 10:18:32','45bff2a4fbe3825a9914f7e73ba3c8c0'),(301,2,'20220927.233356.539-financas','2022-11-23 10:18:32','d883aa8f99ca4598d89b552bb388a7c4'),(302,2,'20220927.233359.570-financas','2022-11-23 10:18:32','17c88f13da0d410b99291da41e915386'),(303,2,'20220927.233402.594-financas','2022-11-23 10:18:32','db0fdb32656ef86c8738e5636eebe921'),(304,2,'20220927.233405.621-financas','2022-11-23 10:18:32','6b433161faf237b129c13befd2472800'),(305,2,'20220927.233408.650-financas','2022-11-23 10:18:32','bb2101b56c910890b66241b2bc6f6fcb'),(306,2,'20220927.233411.675-financas','2022-11-23 10:18:32','422158c6505955cda727da085cfab96d'),(307,2,'20220927.233414.710-financas','2022-11-23 10:18:32','f42b914483082b66e052875ed9343e32'),(308,2,'20220927.233417.737-financas','2022-11-23 10:18:32','bfa31df2edd83ee05823aaedd458de11'),(309,2,'20220927.233420.764-financas','2022-11-23 10:18:32','75d0fce96a15484d8f2c718a54bf21d6'),(310,2,'20220927.233423.788-financas','2022-11-23 10:18:32','ef76c3e47a1bfecd5afd39cf035a1850'),(311,2,'20220927.233426.817-financas','2022-11-23 10:18:32','bd654f0c04dedbf05c481c3497a670f1'),(312,2,'20220927.233429.843-financas','2022-11-23 10:18:32','259eadbf52a4dd680e0324e7eff9e65c'),(313,2,'20220927.233432.871-financas','2022-11-23 10:18:32','6f84ef3be852587929ecadaebc9e8c61'),(314,2,'20220927.233435.901-financas','2022-11-23 10:18:32','ed2fcc972474cb4721653c5671ef3d37'),(315,2,'20220927.233438.928-financas','2022-11-23 10:18:32','fe4becfff39eb31592eb5b79854894f8'),(316,2,'20220927.233441.956-financas','2022-11-23 10:18:32','e0042a17e6177206a72c88231087c294'),(317,2,'20220927.233444.994-financas','2022-11-23 10:18:32','f740362f0db23b4843ab70d793e8c350'),(318,2,'20220927.233448.030-financas','2022-11-23 10:18:32','a43e01d9386d69195b861d420dcf1906'),(319,2,'20220927.233451.058-financas','2022-11-23 10:18:32','053f1a60f93b8412a0219dd452cea5a4'),(320,2,'20220927.233454.093-financas','2022-11-23 10:18:32','6f8c9f52fea45f522cdbfb2e532d8fc9'),(321,2,'20220927.233457.121-financas','2022-11-23 10:18:32','019216f8cece0d72d7f9397b11cc17d1'),(322,2,'20220927.233500.160-financas','2022-11-23 10:18:32','7be8e780c7c04f1ea4abaeec63cda173'),(323,2,'20220927.233503.188-financas','2022-11-23 10:18:32','5c178bff1ca978fa00d42659075c82ff'),(324,2,'20220927.233506.220-financas','2022-11-23 10:18:32','e6074fdd039f6b3948d87b57241000bf'),(325,2,'20220927.233509.252-financas','2022-11-23 10:18:32','c2d6444c7111fff8c5b4d0ac0a4c84d7'),(326,2,'20220927.233512.279-financas','2022-11-23 10:18:32','14e5555155e5e67f44b144988303cb43'),(327,2,'20220927.233515.317-financas','2022-11-23 10:18:32','53f24bdd055afe7234e40a09d2e0b0e5'),(328,2,'20220927.233518.346-financas','2022-11-23 10:18:32','e88293dde5c7db2d2e739125cd5677b2'),(329,2,'20220927.233521.383-financas','2022-11-23 10:18:32','b38c0af339eec4b0b933da65649c190f'),(330,2,'20220927.233524.416-financas','2022-11-23 10:18:32','5496c79176dc63abc9d272137a976813'),(331,2,'20220927.233527.451-financas','2022-11-23 10:18:32','261abc255d1d048ea506421e984a90b8'),(332,2,'20220927.233530.482-financas','2022-11-23 10:18:32','66bf254ee1cd26bbba924f28a4565ddf'),(333,2,'20220927.233533.508-financas','2022-11-23 10:18:32','298e55afd7325863bdcd0dff924d1bae'),(334,2,'20220927.233536.538-financas','2022-11-23 10:18:32','31771fda815f4875f9ed7f838269cd37'),(335,2,'20220927.233539.570-financas','2022-11-23 10:18:32','64ce18b83fdc521166c2e3e4f172b051'),(336,2,'20220927.233542.602-financas','2022-11-23 10:18:32','369aedee1fca3e5f28f7e09141c186f5'),(337,2,'20220927.233545.635-financas','2022-11-23 10:18:32','4ae295394199094f630e37c7edc0dcc2'),(338,2,'20220927.233548.663-financas','2022-11-23 10:18:32','04a283cc02e62afa3dc37d76aad08c3d'),(339,2,'20220927.233551.702-financas','2022-11-23 10:18:32','311ddce243fdebfb5f62a1f6a70d3c25'),(340,2,'20220927.233554.731-financas','2022-11-23 10:18:32','b30931d107f8d86da23fcd6abae17d98'),(341,2,'20220927.233557.763-financas','2022-11-23 10:18:32','7d7a6ca532d5af715222ab35f2a23ddb'),(342,2,'20220927.233600.787-financas','2022-11-23 10:18:32','33f80bc185756d91fd4f183379452bc9'),(343,2,'20220927.233603.828-financas','2022-11-23 10:18:32','66527e36d189e55950db0b02c296e0aa'),(344,2,'20220927.233606.856-financas','2022-11-23 10:18:32','dee02a6bdd9ce4e0e586dd6be4d27adb'),(345,2,'20220927.233609.882-financas','2022-11-23 10:18:32','062db15a4ff2498513610cc65c73169a'),(346,2,'20220927.233612.916-financas','2022-11-23 10:18:32','9b19e6d12c484837a436ac7bb2c485dd'),(347,2,'20220927.233615.956-financas','2022-11-23 10:18:32','f1e1b21d9851cbd55c7f82719fbbdfe8'),(348,2,'20220927.233618.986-financas','2022-11-23 10:18:32','1d6a1209e82e3205dbbd3ee486cf6e59'),(349,2,'20220927.233622.014-financas','2022-11-23 10:18:32','923fd0ecd6914328aa30d2601ca4754d'),(350,2,'20220927.233625.042-financas','2022-11-23 10:18:32','fc5dff59cdbba7569b46e0f4adf17aa4'),(351,2,'20220927.233628.079-financas','2022-11-23 10:18:32','2e5f76a918cf5c4bb237f1b83bcdcde0'),(352,2,'20220927.233631.113-financas','2022-11-23 10:18:32','1b0831f31eb92cbacea4886d9aa93986'),(353,2,'20220927.233634.148-financas','2022-11-23 10:18:32','bcf6d9b82dea6831316884bef7d2c001'),(354,2,'20220927.233637.174-financas','2022-11-23 10:18:32','2f4a0aa6956c4f9e60c40442eaa6be71'),(355,2,'20220927.233640.203-financas','2022-11-23 10:18:32','78f6ddf95381aa6e45174a2d1af3f971'),(356,2,'20220927.233643.239-financas','2022-11-23 10:18:32','9ded9b0ecd1ee881b56b64fcd65e1edb'),(357,2,'20220927.233646.274-financas','2022-11-23 10:18:32','5e7b65526a05f68a5658b41db16d43f3'),(358,2,'20220927.233649.314-financas','2022-11-23 10:18:32','80aee5c43fb8ca55719178ca234b3799'),(359,2,'20220927.233652.341-financas','2022-11-23 10:18:32','e3adf9a91f550da620699c8630de5a69'),(360,2,'20220927.233655.369-financas','2022-11-23 10:18:32','7188e06d7c79265169f4ebd966beb21b'),(361,2,'20220927.233658.406-financas','2022-11-23 10:18:32','223eb17b532afffe6a595e90f4092a3f'),(362,2,'20220927.233701.434-financas','2022-11-23 10:18:32','d75d89e24b860f76ff7792d5982597ed'),(363,2,'20220927.233704.470-financas','2022-11-23 10:18:32','4c5b48e3834525ed9f1ae69649043637'),(364,2,'20220927.233707.503-financas','2022-11-23 10:18:32','99a5657eeeef9b0b266872d293b2ac47'),(365,2,'20220927.233710.545-financas','2022-11-23 10:18:32','3e41864e5bd2d88ad7c439b9abd3e59f'),(366,2,'20220927.233713.585-financas','2022-11-23 10:18:32','64b3b08cc0a1a93b4657b48b801d626a'),(367,2,'20220927.233716.615-financas','2022-11-23 10:18:32','dfd6291ddef40641eb700501875cac95'),(368,2,'20220927.233719.646-financas','2022-11-23 10:18:32','8ef8f48cff21e2dcba10c7f5cb5d27c2'),(369,2,'20220927.233722.675-financas','2022-11-23 10:18:32','80bfb9989e527c299659954876c6801b'),(370,2,'20220927.233725.702-financas','2022-11-23 10:18:32','7fe102a4e1a83e182bc4f0469481fa49'),(371,2,'20220927.233728.733-financas','2022-11-23 10:18:32','d9e683d0dd967731ee00c6f8799c7859'),(372,2,'20220927.233731.770-financas','2022-11-23 10:18:32','c3c185bc99c5ad72272b4058e4fbd87b'),(373,2,'20220927.233734.803-financas','2022-11-23 10:18:32','63f79d3c4294310a804e1a686d44f28d'),(374,2,'20220927.233737.839-financas','2022-11-23 10:18:32','708eacc2bb8c7daa472b81accc7a3a66'),(375,2,'20220927.233740.871-financas','2022-11-23 10:18:32','d5e672724501e910f82a452fb424617d'),(376,2,'20220927.233743.907-financas','2022-11-23 10:18:32','88756779dc20b4cd4cbb4f5294fbd9db'),(377,2,'20220927.233746.934-financas','2022-11-23 10:18:32','15fb91af1d3643584e282f308154986d'),(378,2,'20220927.233749.963-financas','2022-11-23 10:18:32','539bcab9431f7cf78f5c24eead10b50c'),(379,2,'20220927.233753.003-financas','2022-11-23 10:18:32','69e8a0514b0a451f8e45a36bdec57e69'),(380,2,'20220927.233756.033-financas','2022-11-23 10:18:32','bfdd029f78cf9d57558db70ad65b1b7c'),(381,2,'20220927.233759.067-financas','2022-11-23 10:18:32','71f64a1bac4c188ebed0b9d6df3ebfd3'),(382,2,'20220927.233802.099-financas','2022-11-23 10:18:32','b7596414123a9b4f1429dc900e2fa2eb'),(383,2,'20220927.233805.139-financas','2022-11-23 10:18:32','b3e01496e331608bbc5e5b3aafe8f8bf'),(384,2,'20220927.233808.164-financas','2022-11-23 10:18:32','ef496a8c603b5b06c15d951a950b99c7'),(385,2,'20220927.233811.192-financas','2022-11-23 10:18:32','83b23d9b6abcc89b1dda7a3ff88958a9'),(386,2,'20220927.233814.222-financas','2022-11-23 10:18:32','ca88e68c53722569f604ef1d10ed8492'),(387,2,'20220927.233817.252-financas','2022-11-23 10:18:32','712f4486e135e0fbdf03df433a6da3e0'),(388,2,'20220927.233820.280-financas','2022-11-23 10:18:32','948e7367a9f90302bea7ba60007b43ad'),(389,2,'20220927.233823.308-financas','2022-11-23 10:18:32','6ad6a19ac9fb6c099b65d869a75ed5b3'),(390,2,'20220927.233826.348-financas','2022-11-23 10:18:32','8524ce8ec09546b338dd683292f38c71'),(391,2,'20220927.233829.388-financas','2022-11-23 10:18:32','6bb205e86d2e5c22ca87079de540b640'),(392,2,'20220927.233832.426-financas','2022-11-23 10:18:32','1db6fab66ba9fd693fe932a6d4268dd6'),(393,2,'20220927.233835.452-financas','2022-11-23 10:18:32','08d81c39a407492fe18555ce168e80fc'),(394,2,'20220927.233838.483-financas','2022-11-23 10:18:32','8ee2b20969745e82e0a93873bf94408b'),(395,2,'20220927.233841.510-financas','2022-11-23 10:18:32','4538087f6f2d65209af708465805b961'),(396,2,'20220927.233844.540-financas','2022-11-23 10:18:32','892ae31da71959712baf0b58060ebfb9'),(397,2,'20220927.233847.567-financas','2022-11-23 10:18:32','6519837ae2b8f44d38533a6562a006d2'),(398,2,'20220927.233850.604-financas','2022-11-23 10:18:33','19ab481ad4dc7d48a64e8132784c0294'),(399,2,'20220927.233853.626-financas','2022-11-23 10:18:33','0a677a2bbcc6325d6c454a2e68869008'),(400,2,'20220927.233856.660-financas','2022-11-23 10:18:33','dc6b37cef07e7eaf27137e7032c5b50f'),(401,2,'20220927.233859.698-financas','2022-11-23 10:18:33','99541fa0db3584a0ec3ead5b9da5890b'),(402,2,'20220927.233902.727-financas','2022-11-23 10:18:33','d4f6c0321cc9c630b64ae1963044ad1b'),(403,2,'20220927.233905.755-financas','2022-11-23 10:18:33','faf675cb6d84dbd6d26fe09ab1fbceed'),(404,2,'20220927.233908.783-financas','2022-11-23 10:18:33','0da56636cefd82e4e7d1ff5c6370573e'),(405,2,'20220927.233911.822-financas','2022-11-23 10:18:33','6843ece82bc727e4eb25596492cc3df7'),(406,2,'20220927.233914.848-financas','2022-11-23 10:18:33','1c9b67a60aa35874c4022c4797f46b16'),(407,2,'20220927.233917.883-financas','2022-11-23 10:18:33','86decedd483c98c43ea958a9993957a7'),(408,2,'20220927.233920.911-financas','2022-11-23 10:18:33','ac22685664a8c9ca89e795078df7432a'),(409,2,'20220927.233923.943-financas','2022-11-23 10:18:33','d6d49b496ba918ea4bd2a638905e1bed'),(410,2,'20220927.233926.980-financas','2022-11-23 10:18:33','60a77a557ca4e27612544643fd3b10ac'),(411,2,'20220927.233930.002-financas','2022-11-23 10:18:33','6cc022118edee6cfe677daeb616a96d7'),(412,2,'20220927.233933.033-financas','2022-11-23 10:18:33','e078e50bc5244bcbcccce5590f4c91d3'),(413,2,'20220927.233936.059-financas','2022-11-23 10:18:33','ce5f9e1a186aa4559a70cd6852ac3846'),(414,2,'20220927.233939.083-financas','2022-11-23 10:18:33','24e65f688876a17b174f2af8d34c42bb'),(415,2,'20220927.233942.114-financas','2022-11-23 10:18:33','658d7c1b36b84cea89c15c9cf0a2a621'),(416,2,'20220927.233945.146-financas','2022-11-23 10:18:33','0359f65e799c14c6a5b8f6247c8ee043'),(417,2,'20220927.233948.182-financas','2022-11-23 10:18:33','37363d9564d2734e0a73304fad6f96be'),(418,2,'20220927.233951.214-financas','2022-11-23 10:18:33','a031632409db411d8c3bfe52ca7d5add'),(419,2,'20220927.233954.246-financas','2022-11-23 10:18:33','25e438b2c5cf3c194ed79a3b390ace02'),(420,2,'20220927.233957.277-financas','2022-11-23 10:18:33','ce916e9db101c5bd4c64a619059a98ac'),(421,2,'20220927.234000.314-financas','2022-11-23 10:18:33','c282dcda02ce4be291b566657fe15401'),(422,2,'20220927.234003.355-financas','2022-11-23 10:18:33','938d8aa78ee3650604e39fad8ac278f1'),(423,2,'20220927.234006.387-financas','2022-11-23 10:18:33','a1398206791c807500f2becb54c276f1'),(424,2,'20220927.234009.422-financas','2022-11-23 10:18:33','cfd6f40e29c7822831366f89f8d803b6'),(425,2,'20220927.234012.459-financas','2022-11-23 10:18:33','2fe042be3c6496017f9e297b5179f368'),(426,2,'20220927.234015.492-financas','2022-11-23 10:18:33','8c094f3fc5588e984d6b72631316aa8d'),(427,2,'20220927.234018.526-financas','2022-11-23 10:18:33','c206a4988463db0642784dd17dec6aef'),(428,2,'20220927.234021.564-financas','2022-11-23 10:18:33','91bd446635ac2ec1d1eb6c9ad247f0e1'),(429,2,'20220927.234024.597-financas','2022-11-23 10:18:33','c767ea4d4ac518d2570324baac548419'),(430,2,'20220927.234027.624-financas','2022-11-23 10:18:33','f6044c833cdccacad99f7ef2e84ca7f4'),(431,2,'20220927.234030.652-financas','2022-11-23 10:18:33','1e69ba90946c2a3f331b819fd2fa8839'),(432,2,'20220927.234033.680-financas','2022-11-23 10:18:33','416077f081a924c00a1b12ad7a9f5baf'),(433,2,'20220927.234036.716-financas','2022-11-23 10:18:33','084b27a2554c86544b2f6cf183d9bf23'),(434,2,'20220927.234039.750-financas','2022-11-23 10:18:33','6e4594d2e38683da63c56dd98317c76a'),(435,2,'20220927.234042.783-financas','2022-11-23 10:18:33','6c199a304415495da0afa9597973b9bb'),(436,2,'20220927.234045.824-financas','2022-11-23 10:18:33','0a570d1e238ee3324c0e7492e6eae237'),(437,2,'20220927.234048.861-financas','2022-11-23 10:18:33','4c8442ba9737314189faf914c4eab238'),(438,2,'20220927.234051.896-financas','2022-11-23 10:18:33','d021cacfc472c6da91d533b9de5dfa40'),(439,2,'20220927.234054.919-financas','2022-11-23 10:18:33','b03ca0ccb5924e8a2538ec96e610401d'),(440,2,'20220927.234057.948-financas','2022-11-23 10:18:33','227af6dd7d008a40588571e358448f43'),(441,2,'20220927.234100.982-financas','2022-11-23 10:18:33','4dfc4b1200bd884a8d5da84edd9a134b'),(442,2,'20220927.234104.009-financas','2022-11-23 10:18:33','a50e4f9b28d31e298ca84b211a5d861d'),(443,2,'20220927.234107.042-financas','2022-11-23 10:18:33','8410307164fe5d27c0da16bc6b771243'),(444,2,'20220927.234110.074-financas','2022-11-23 10:18:33','996fc1b5427886d4991effd8fae80128'),(445,2,'20220927.234113.111-financas','2022-11-23 10:18:33','adfff5f957c909500e24e0c132460858'),(446,2,'20220927.234116.143-financas','2022-11-23 10:18:33','acd3db87bbc243477d6eaabf918f86da'),(447,2,'20220927.234119.177-financas','2022-11-23 10:18:33','f550c6ac4b44e34ff78c7d41458a626e'),(448,2,'20220927.234122.223-financas','2022-11-23 10:18:33','4106f0677a57e682525da219549dc956'),(449,2,'20220927.234125.250-financas','2022-11-23 10:18:33','bc5f6a845f61b7f9398f21854b888da3'),(450,2,'20220927.234128.279-financas','2022-11-23 10:18:33','8270542e3e34f96d0579e38a62c5fb88'),(451,2,'20220927.234131.309-financas','2022-11-23 10:18:33','0e47ce801701c5af70fdfe2e7660bc63'),(452,2,'20220927.234134.344-financas','2022-11-23 10:18:33','a9bb5eb520a31716047598d7679d3c97'),(453,2,'20220927.234137.383-financas','2022-11-23 10:18:33','51cc1d9d02d2b59145aa897359d9f0b3'),(454,2,'20220927.234140.415-financas','2022-11-23 10:18:33','4f70e202d8986508c45de9b6d38ea5e7'),(455,2,'20220927.234143.438-financas','2022-11-23 10:18:33','9c936a92cea18cf9c4da2ed32d4bc784'),(456,2,'20220927.234146.463-financas','2022-11-23 10:18:33','2a974c4cee20fcaea11eeffe58bdf50b'),(457,2,'20220927.234149.499-financas','2022-11-23 10:18:33','28e8d59475984cac94717cc04bee1d14'),(458,2,'20220927.234152.529-financas','2022-11-23 10:18:33','211ded62f618831f64ca7423fcc6bc8b'),(459,2,'20220927.234155.560-financas','2022-11-23 10:18:33','e8e015954b59c3a79cc706759e57f9b5'),(460,2,'20220927.234158.602-financas','2022-11-23 10:18:33','3993179b176aaa18df4d9a0d88bd9463'),(461,2,'20220927.234201.632-financas','2022-11-23 10:18:33','8ec7301141bc35e994b2bfdce67beb3e'),(462,2,'20220927.234204.659-financas','2022-11-23 10:18:33','11249fc23855d66f3bdd125d26712730'),(463,2,'20220927.234207.685-financas','2022-11-23 10:18:33','90d93c5149556eb8280550d4c374b37b'),(464,2,'20220927.234210.720-financas','2022-11-23 10:18:33','5cac9c438c971adf49e1999c61e730f1'),(465,2,'20220927.234213.750-financas','2022-11-23 10:18:33','e7ec622442830266aa5ca35094a2d59c'),(466,2,'20220927.234216.790-financas','2022-11-23 10:18:33','77e067a41a1ebcf9de43f0c3ebf08afe'),(467,2,'20220927.234219.817-financas','2022-11-23 10:18:33','f419d3a1e2ff9ab821a35a084fd81a73'),(468,2,'20220927.234222.846-financas','2022-11-23 10:18:33','f833557ca3a01f84fbc75a0051f3bd1e'),(469,2,'20220927.234225.877-financas','2022-11-23 10:18:33','aaefd6bf9140fd8ab646a355c75ce813'),(470,2,'20220927.234228.905-financas','2022-11-23 10:18:33','0566c18946a371ecea97840a2ea56e90'),(471,2,'20220927.234231.935-financas','2022-11-23 10:18:33','912c2654edd95e23b82c360c6184e9be'),(472,2,'20220927.234234.973-financas','2022-11-23 10:18:33','131a0f10c2a28a09bf0848b508983847'),(473,2,'20220927.234237.995-financas','2022-11-23 10:18:33','15faadb4aeac7d014e12cedf8e2dbae1'),(474,2,'20220927.234241.022-financas','2022-11-23 10:18:33','18dd3b60d0ce2aad9341b6a9aaa937d4'),(475,2,'20220927.234244.049-financas','2022-11-23 10:18:33','b975f7aa79bf42ec2fca3637befde695'),(476,2,'20220927.234247.072-financas','2022-11-23 10:18:33','65e3606685aea348c38fde479a80f852'),(477,2,'20220927.234250.102-financas','2022-11-23 10:18:33','41b80d8f9bbc85f0f5ca342316278089'),(478,2,'20220927.234253.132-financas','2022-11-23 10:18:33','59835f7eea644d92250156257efa6665'),(479,2,'20220927.234256.154-financas','2022-11-23 10:18:33','feff32d931ce2cdc429bd3ee53e4153a'),(480,2,'20220927.234259.185-financas','2022-11-23 10:18:33','6cb54d46e6601ff517de45fbc88b54a5'),(481,2,'20220927.234302.226-financas','2022-11-23 10:18:33','d34823b0167bc07f4a5632d993e7c64f'),(482,2,'20220927.234305.266-financas','2022-11-23 10:18:33','dc43446295ce5f6cd493a5b89a30b356'),(483,2,'20220927.234308.285-financas','2022-11-23 10:18:33','9273bc7a5d2461b5e3380aa7ad6529dd'),(484,2,'20220927.234311.309-financas','2022-11-23 10:18:33','013fdfad18a340a075dca0bea8f93141'),(485,2,'20220927.234314.346-financas','2022-11-23 10:18:33','12a9ad463c11382a7c3e97083961a663'),(486,2,'20220927.234317.371-financas','2022-11-23 10:18:33','bb3843c44375ef1c122f927f1fb97cc0'),(487,2,'20220927.234320.407-financas','2022-11-23 10:18:33','0883db3e00724e6edf3de7af8ecfe228'),(488,2,'20220927.234323.442-financas','2022-11-23 10:18:33','abac8e702ad47ee95874e370bb5e08d2'),(489,2,'20220927.234326.470-financas','2022-11-23 10:18:33','e3de165c5fd6f0b12786062c0fe427fd'),(490,2,'20220927.234329.500-financas','2022-11-23 10:18:33','ba950131dcac492ea3f0cfbc5d9f0fa0'),(491,2,'20220927.234332.536-financas','2022-11-23 10:18:33','979970f9c6b2ab048ea614ab5e429463'),(492,2,'20220927.234335.565-financas','2022-11-23 10:18:33','36df9eea0ab46544e6a8a941f07b8c74'),(493,2,'20220927.234338.589-financas','2022-11-23 10:18:33','300adbb3ee6b0dd08233e36f5eb9d079'),(494,2,'20220927.234341.613-financas','2022-11-23 10:18:33','fa5e00dc58e847e62343a266ca223aba'),(495,2,'20220927.234344.648-financas','2022-11-23 10:18:33','3aa0eb1f54baeb6eeef4fdeafccc3571'),(496,2,'20220927.234347.686-financas','2022-11-23 10:18:33','9ca4dcd42bac27ff3fafab3b98bac434'),(497,2,'20220927.234350.718-financas','2022-11-23 10:18:33','8c6859e5d6b6a980a16f2e46d0c8b7e4'),(498,2,'20220927.234353.754-financas','2022-11-23 10:18:33','d931b3cbad428d5470cf99676cd2dbe5'),(499,2,'20220927.234356.786-financas','2022-11-23 10:18:33','49faa0467baf03bf9f0374b29b2ff1de'),(500,2,'20220927.234359.815-financas','2022-11-23 10:18:33','8c6531298a1718a0a9f63a1f2d25d2a7'),(501,2,'20220927.234402.850-financas','2022-11-23 10:18:33','83d66073fbc9d60c142ab0a1fac9839f'),(502,2,'20220927.234405.879-financas','2022-11-23 10:18:33','2f5d8223dc7d046a4e47578f4779475b'),(503,2,'20220927.234408.909-financas','2022-11-23 10:18:33','b06b7d4ae9a5e80d66c59be8552fa640'),(504,2,'20220927.234411.945-financas','2022-11-23 10:18:33','fb5c30372bfe93e2c06ea63c3db1a4fb'),(505,2,'20220927.234414.973-financas','2022-11-23 10:18:33','e0c32105083c2ee2a00d889e9d22d226'),(506,2,'20220927.234418.005-financas','2022-11-23 10:18:33','c148b25fc028ad60e6589d475d16fc6d'),(507,2,'20220927.234421.033-financas','2022-11-23 10:18:33','b4b233bbde67935071d0b6e05d92a03f'),(508,2,'20220927.234424.053-financas','2022-11-23 10:18:33','f61e2adecaa65bb32f694f977120215d'),(509,2,'20220927.234427.086-financas','2022-11-23 10:18:33','76571f178eed28d072384b68479bfec9'),(510,2,'20220927.234430.124-financas','2022-11-23 10:18:33','e55a42ae7e3abc9b967a383b6ce96e7d'),(511,2,'20220927.234433.150-financas','2022-11-23 10:18:33','0ad7bfd6e9c06a69bdedaef767f290ab'),(512,2,'20220927.234436.187-financas','2022-11-23 10:18:33','961440051e30cfb3b3e107af7644b07d'),(513,2,'20220927.234439.218-financas','2022-11-23 10:18:33','7f25518517cebc1aaf3988bdf2b3aadd'),(514,2,'20220927.234442.242-financas','2022-11-23 10:18:33','aa15a202657e1da37e35b4a727346e3d'),(515,2,'20220927.234445.280-financas','2022-11-23 10:18:33','f8d6a6d4ce70136d7afa0a200c27fe32'),(516,2,'20220927.234448.302-financas','2022-11-23 10:18:33','bdada01304c09bee8b4227fe581f6e5b'),(517,2,'20220927.234451.337-financas','2022-11-23 10:18:33','90f2a64cc1b14354256aa7af3d289773'),(518,2,'20220927.234454.363-financas','2022-11-23 10:18:33','28ceea0f9f2769b4e0e59fdfee695452'),(519,2,'20220927.234457.399-financas','2022-11-23 10:18:33','de45a80476eba390a9907f01f8ad25e1'),(520,2,'20220927.234500.428-financas','2022-11-23 10:18:33','fdfe62d8e66c9b8f8066adf8d2f69b5a'),(521,2,'20220927.234503.466-financas','2022-11-23 10:18:33','13e048746f0de3ee8109a1cecb0eb7e2'),(522,2,'20220927.234506.492-financas','2022-11-23 10:18:33','33e15c6f8ffdd5f65ea73a7a238ca0b5'),(523,2,'20220927.234509.515-financas','2022-11-23 10:18:33','06458b20839cb950345526a0f9825637'),(524,2,'20220927.234512.544-financas','2022-11-23 10:18:33','e74a9d95370806a824c3d99fa9824b48'),(525,2,'20220927.234515.573-financas','2022-11-23 10:18:33','10e74f603c493e7c327c5bdbe0def5cb'),(526,2,'20220927.234518.607-financas','2022-11-23 10:18:33','c131903e1ce49a531397c39660dcdc3f'),(527,2,'20220927.234521.650-financas','2022-11-23 10:18:33','0f163d7d2391dde7a7a22334f0dcc984'),(528,2,'20220927.234524.691-financas','2022-11-23 10:18:33','d3a7457b0f76c3ce9e084a04f1538f55'),(529,2,'20220927.234527.727-financas','2022-11-23 10:18:33','b2e45f3c81b055fc5e3e22fcf3ef845c'),(530,2,'20220927.234530.755-financas','2022-11-23 10:18:33','a0886e691ba26544fa55249942b0b0be'),(531,2,'20220927.234533.783-financas','2022-11-23 10:18:33','c6adb511fac9b2535845e4ea5c9fad28'),(532,2,'20220927.234536.811-financas','2022-11-23 10:18:33','79c111e8a63e3aee0037d2a3d21f152d'),(533,2,'20220927.234539.840-financas','2022-11-23 10:18:33','dc5a2cc59f6f7031f08dd431836314b8'),(534,2,'20220927.234542.875-financas','2022-11-23 10:18:33','520b536412e0315dbc4aede78aca57c2'),(535,2,'20220927.234545.915-financas','2022-11-23 10:18:33','a0feb0acd0e425a1d6056f158d640e9c'),(536,2,'20220927.234548.943-financas','2022-11-23 10:18:33','b327b790c0d217a58b49de271292e2f4'),(537,2,'20220927.234551.965-financas','2022-11-23 10:18:33','317a02ebcbb333815d271a472c56301b'),(538,2,'20220927.234554.999-financas','2022-11-23 10:18:33','4f4e4e6327e5987f10b952ed26dc9003'),(539,2,'20220927.234558.033-financas','2022-11-23 10:18:33','3a8e1f1cbe36cd11b39e1a35473286f6'),(540,2,'20220927.234601.061-financas','2022-11-23 10:18:33','45c683dac6385b6cd57f0755ce0a4790'),(541,2,'20220927.234604.087-financas','2022-11-23 10:18:33','4602d6d45b6e3217622abfd8244fff5b'),(542,2,'20220927.234607.113-financas','2022-11-23 10:18:33','001601195ee5e1c6e12c75d013756cf2'),(543,2,'20220927.234610.142-financas','2022-11-23 10:18:33','fb7f27d4cc1cfc5163a3def163b2fc9b'),(544,2,'20220927.234613.167-financas','2022-11-23 10:18:33','2c8af944ee95ce5f0410d5f12ec1e97f'),(545,2,'20220927.234616.199-financas','2022-11-23 10:18:33','006d57b34ae07eb8bdf3fa90b0f94235'),(546,2,'20220927.234619.225-financas','2022-11-23 10:18:33','4a39c6ede0ca76f10c8bf24f8e58e768'),(547,2,'20220927.234622.260-financas','2022-11-23 10:18:33','0a26ea3796d9ca8663d854f9b6816b2b'),(548,2,'20220927.234625.281-financas','2022-11-23 10:18:33','a54f2cdd03b0652e37c1256659576eed'),(549,2,'20220927.234628.310-financas','2022-11-23 10:18:33','845cbfe68ee7a72d65a45925fb2c3288'),(550,2,'20220927.234631.345-financas','2022-11-23 10:18:33','9ad418da70bc073371e32f1ada737872'),(551,2,'20220927.234634.367-financas','2022-11-23 10:18:33','2b7cf604bd97ab7ed22fa9ad209bb051'),(552,2,'20220927.234637.395-financas','2022-11-23 10:18:33','cebfa6f6fd835fe276bf858114fa521f'),(553,2,'20220927.234640.433-financas','2022-11-23 10:18:33','b62726d645498781e83ea3131ea25b3e'),(554,2,'20220927.234643.466-financas','2022-11-23 10:18:33','485e5f256a88331787e808a64c79a636'),(555,2,'20220927.234646.499-financas','2022-11-23 10:18:33','f368e2c14e7c6c9b48e10b2d62b1543d'),(556,2,'20220927.234649.531-financas','2022-11-23 10:18:33','3bd81c6e48fbf756f37a9f2d76c7bbb0'),(557,2,'20220927.234652.558-financas','2022-11-23 10:18:33','977973992b7711d5ffe4763d0e1c369f'),(558,2,'20220927.234655.593-financas','2022-11-23 10:18:33','3e4f1090301ba68cd6e9ecc5e00e2a9d'),(559,2,'20220927.234658.628-financas','2022-11-23 10:18:33','ca776ad6cb8d318ad11d782c3f6ce963'),(560,2,'20220927.234701.655-financas','2022-11-23 10:18:33','d080c0506bd0eb210b7b0c35cbb01434'),(561,2,'20220927.234704.694-financas','2022-11-23 10:18:33','c597b77f9f0b7aaca2b7f2e8a0e4500d'),(562,2,'20220927.234707.731-financas','2022-11-23 10:18:33','016d4642719e0b47c215c4e4ef913730'),(563,2,'20220927.234710.762-financas','2022-11-23 10:18:33','8b47dea7d7a21c8e3c2512b33c1900a2'),(564,2,'20220927.234713.798-financas','2022-11-23 10:18:33','8f13e3691a228bd34bad97f9a389afc4'),(565,2,'20220927.234716.828-financas','2022-11-23 10:18:33','2dd75b1d6468d0a1b49f76c9cfb57f1f'),(566,2,'20220927.234719.859-financas','2022-11-23 10:18:33','989229c7c2766a4b4c0adae3d3b921e0'),(567,2,'20220927.234722.892-financas','2022-11-23 10:18:33','9448786f049b19b80241c334a193a055'),(568,2,'20220927.234725.924-financas','2022-11-23 10:18:33','4dbd96c0d05aae7e8ee69dc8e748d998'),(569,2,'20220927.234728.952-financas','2022-11-23 10:18:33','16f097f471ac747cc778047babb968c0'),(570,2,'20220927.234731.973-financas','2022-11-23 10:18:33','6ca3ddd7ac4dc50d472935f06a864355'),(571,2,'20220927.234735.011-financas','2022-11-23 10:18:33','8f133698b221875af81608ed2bb51b79'),(572,2,'20220927.234738.038-financas','2022-11-23 10:18:33','c6df1bb0c7022552796cc70592ac638f'),(573,2,'20220927.234741.072-financas','2022-11-23 10:18:33','902c4c02cd3c719b5525cdfe32074510'),(574,2,'20220927.234744.110-financas','2022-11-23 10:18:33','31f94487427c5afd35eca10ceaa73d7c'),(575,2,'20220927.234747.131-financas','2022-11-23 10:18:33','3f3d77eed98425995a1e1f3511d0ff69'),(576,2,'20220927.234750.167-financas','2022-11-23 10:18:33','6b285eb57a82ae9a122362d052065761'),(577,2,'20220927.234753.206-financas','2022-11-23 10:18:33','79e89d8f9b25a78e2439019c613b5bf6'),(578,2,'20220927.234756.227-financas','2022-11-23 10:18:33','aeb1d7151baa223e14f2e99e312456bc'),(579,2,'20220927.234759.250-financas','2022-11-23 10:18:33','67061554a92f5640461bd1475908de92'),(580,2,'20220927.234802.280-financas','2022-11-23 10:18:33','5ee860f57876d68c15bd0da490ec08c4'),(581,2,'20220927.234805.310-financas','2022-11-23 10:18:33','ddeb07beb5d1f0460bb0abf66034e519'),(582,2,'20220927.234808.348-financas','2022-11-23 10:18:33','4075df791a1a91f0ffbc327e595a3ac3'),(583,2,'20220927.234811.383-financas','2022-11-23 10:18:33','aabb659a90ad71fc4818e71cf93a67fb'),(584,2,'20220927.234814.409-financas','2022-11-23 10:18:33','f424b0ceb743309c60191d9424a77098'),(585,2,'20220927.234817.434-financas','2022-11-23 10:18:33','3f5c657f46734047a332d88b615b8001'),(586,2,'20220927.234820.463-financas','2022-11-23 10:18:33','c69fba18114656c6ed9383160764b72b'),(587,2,'20220927.234823.502-financas','2022-11-23 10:18:33','16c7b83d19e60e2db04ccbab0d55b753'),(588,2,'20220927.234826.538-financas','2022-11-23 10:18:33','8f45981f377c3bb73d85d1b95f03dd49'),(589,2,'20220927.234829.575-financas','2022-11-23 10:18:33','4fee0135e3fe98eeddc076edde90e297'),(590,2,'20220927.234832.602-financas','2022-11-23 10:18:33','0e6aef28dbe98906f8455615189eabb5'),(591,2,'20220927.234835.630-financas','2022-11-23 10:18:33','a7972aeb4f4c71a31f730fd678e4f550'),(592,2,'20220927.234838.660-financas','2022-11-23 10:18:33','0352b7fc27f44934dec410b9039e670a'),(593,2,'20220927.234841.690-financas','2022-11-23 10:18:33','c80684e599766912a0d199263cbd0e5b'),(594,2,'20220927.234844.722-financas','2022-11-23 10:18:33','13e831b0130026b5ed12845b2eade266'),(595,2,'20220927.234847.754-financas','2022-11-23 10:18:33','403b07e86dee4f7f7623418243cd4deb'),(596,2,'20220927.234850.785-financas','2022-11-23 10:18:33','a0a6a9ac327315253f588a65746668ba'),(597,2,'20220927.234853.816-financas','2022-11-23 10:18:33','d4c456519f9b8a5e267534f89fcd1170'),(598,2,'20220927.234856.851-financas','2022-11-23 10:18:33','a77044ae3fd36800c3d71e1729773a67'),(599,2,'20220927.234859.884-financas','2022-11-23 10:18:33','57b98366482009697db77d0003611ae7'),(600,2,'20220927.234902.915-financas','2022-11-23 10:18:33','a0303ad0266cf0bb4cc6a9025e3bb9f9'),(601,2,'20220927.234905.942-financas','2022-11-23 10:18:33','3300ab6de94948a2f960603cfd379af7'),(602,2,'20220927.234908.972-financas','2022-11-23 10:18:33','9e74f4d38bc8cca5763624db427737c4'),(603,2,'20220927.234912.012-financas','2022-11-23 10:18:33','d47c9ae37aceff03c30394e1b5923eb9'),(604,2,'20220927.234915.041-financas','2022-11-23 10:18:33','104cd6adb1f37b664aab6d2f3603ce18'),(605,2,'20220927.234918.072-financas','2022-11-23 10:18:33','06058906da604d37c2254c1792c8429c'),(606,2,'20220927.234921.102-financas','2022-11-23 10:18:33','a4a4e3341c49dcc4ee208a735075d616'),(607,2,'20220927.234924.137-financas','2022-11-23 10:18:33','e114b4f7a810bfe52f7e4847bf001bf4'),(608,2,'20220927.234927.161-financas','2022-11-23 10:18:33','995a5063c57e03005d975a1c8ca68a55'),(609,2,'20220927.234930.194-financas','2022-11-23 10:18:33','24d65acc541907b440cc86237b024a54'),(610,2,'20220927.234933.230-financas','2022-11-23 10:18:33','548e176f1c5fc6a24f7a59f00ad4c42f'),(611,2,'20220927.234936.271-financas','2022-11-23 10:18:33','c134fe14e54bb3c39684189d58fed8ce'),(612,2,'20220927.234939.304-financas','2022-11-23 10:18:33','3286e4d9b675955074b4945656a64b82'),(613,2,'20220927.234942.345-financas','2022-11-23 10:18:33','97033685af726abe37e9de357c102857'),(614,2,'20220927.234945.373-financas','2022-11-23 10:18:33','22d38c0423b86a27f26ff2dafa931749'),(615,2,'20220927.234948.402-financas','2022-11-23 10:18:33','42b92d1c8692a5ac3a8164756e6b25ce'),(616,2,'20220927.234951.434-financas','2022-11-23 10:18:33','ee0615eb80398bf5e8c10b20c9c07bbb'),(617,2,'20220927.234954.459-financas','2022-11-23 10:18:33','17acb198f7b590daa0301bc1cab3db64'),(618,2,'20220927.234957.495-financas','2022-11-23 10:18:33','27488a86cb701e07eeb6c263d8d263d5'),(619,2,'20220927.235000.524-financas','2022-11-23 10:18:33','0d17aa999c84434c79eed302a493a6ad'),(620,2,'20220927.235003.563-financas','2022-11-23 10:18:33','b1a01f6205e233dd1a7eeae13c11b384'),(621,2,'20220927.235006.601-financas','2022-11-23 10:18:33','bd5685ec79b896df682a5bf2b3c49512'),(622,2,'20220927.235009.641-financas','2022-11-23 10:18:33','4b2bfa4ea8e8803e8c86f779a8f1feb4'),(623,2,'20220927.235012.672-financas','2022-11-23 10:18:33','66a3ed5a2486ad0bc56a0d15f8377c7e'),(624,2,'20220927.235015.708-financas','2022-11-23 10:18:33','a6cd030f7eb92067326f70d73a11b701'),(625,2,'20220927.235018.735-financas','2022-11-23 10:18:33','711b6cc01f51451221d34dae062a1f80'),(626,2,'20220927.235021.757-financas','2022-11-23 10:18:33','ce627dd02a9739633e392c4a27bd69c4'),(627,2,'20220927.235024.793-financas','2022-11-23 10:18:33','d5c63b78d138153bc1d2a895c16c4aa8'),(628,2,'20220927.235027.823-financas','2022-11-23 10:18:33','269e5fb675366eac1a4da729c31684e9'),(629,2,'20220927.235030.846-financas','2022-11-23 10:18:33','966877fb0e8c9e4029bb88a5e9accddd'),(630,2,'20220927.235033.878-financas','2022-11-23 10:18:33','8dceac1f0b65e4f5f3833bb99dd21e0a'),(631,2,'20220927.235036.915-financas','2022-11-23 10:18:33','26146d604dc09bedf4a0c724776cd815'),(632,2,'20220927.235039.947-financas','2022-11-23 10:18:33','614e6ca138502714b9f9ce1e0508da44'),(633,2,'20220927.235042.973-financas','2022-11-23 10:18:33','7d5edaea47764b6d59c2603b59127261'),(634,2,'20220927.235046.013-financas','2022-11-23 10:18:33','271273ecd7e2aed8b76de489ef6931f0'),(635,2,'20220927.235049.050-financas','2022-11-23 10:18:33','39256316d976d81acc2c0c8336948f02'),(636,2,'20220927.235052.078-financas','2022-11-23 10:18:33','b9935588cf609ec87d7cd9da343005a4'),(637,2,'20220927.235055.115-financas','2022-11-23 10:18:33','dd75aa74c82a21e8628634658acdb528'),(638,2,'20220927.235058.144-financas','2022-11-23 10:18:33','351abe0050678da00e904eea1c49edef'),(639,2,'20220927.235101.172-financas','2022-11-23 10:18:33','bf9a7d2f047f82f010d1d97ab16612a8'),(640,2,'20220927.235104.194-financas','2022-11-23 10:18:33','c95b951a8f2d0b7c79a94e0b1a22ef84'),(641,2,'20220927.235107.216-financas','2022-11-23 10:18:33','cb722b08491126345194fcaa465bff80'),(642,2,'20220927.235110.249-financas','2022-11-23 10:18:33','85d0fbdc97f24f6104a583bac6840ff8'),(643,2,'20220927.235113.276-financas','2022-11-23 10:18:33','e48291c6c6f1070116f9301a95d2c60d'),(644,2,'20220927.235116.302-financas','2022-11-23 10:18:33','7b380530e99d0e01d39c6a253455ccd2'),(645,2,'20220927.235119.328-financas','2022-11-23 10:18:33','c91fa179b20616b514e0e6439263fd00'),(646,2,'20220927.235122.351-financas','2022-11-23 10:18:33','10aeb696bba2842b024f1118195ce581'),(647,2,'20220927.235125.386-financas','2022-11-23 10:18:33','90f3cbf6eabb350319f489eff763832c'),(648,2,'20220927.235128.420-financas','2022-11-23 10:18:33','60c14b36871d3164a4916fafbcb72c55'),(649,2,'20220927.235131.460-financas','2022-11-23 10:18:33','4cbb21c62333617cdb1ca90025d83d5b'),(650,2,'20220927.235134.496-financas','2022-11-23 10:18:33','bba7395308e1b3d0cb7084e7318e18bf'),(651,2,'20220927.235137.532-financas','2022-11-23 10:18:33','34e8fbaed3ce96704c3945abe11197f6'),(652,2,'20220927.235140.567-financas','2022-11-23 10:18:33','bacdaa5b3448acd12d9f380d921077d8'),(653,2,'20220927.235143.592-financas','2022-11-23 10:18:33','3618bb849cd2a89b06d38f8a070a36b7'),(654,2,'20220927.235146.623-financas','2022-11-23 10:18:33','3091ae2fddc5b84419b2df6fa8a3b17c'),(655,2,'20220927.235149.654-financas','2022-11-23 10:18:33','30aa8e6bb413fc5ac1ef1cde05da4bd0'),(656,2,'20220927.235152.687-financas','2022-11-23 10:18:33','900cec729cce9badf5fb32c8ef23040d'),(657,2,'20220927.235155.719-financas','2022-11-23 10:18:33','05d5ee635b0a793e8d0a799e70b10d8e'),(658,2,'20220927.235158.761-financas','2022-11-23 10:18:33','e2812e185fb13cc622adb5bbe899c2d7'),(659,2,'20220927.235201.793-financas','2022-11-23 10:18:33','afaed928fe6e3d8e7e527643d9afc5ea'),(660,2,'20220927.235204.821-financas','2022-11-23 10:18:33','de409241589d73ff0489298c192c60c5'),(661,2,'20220927.235207.849-financas','2022-11-23 10:18:33','c513fb7b2be20f296e4bcc9f51be713c'),(662,2,'20220927.235210.873-financas','2022-11-23 10:18:33','416e9bc51bbf2ade9cee0f9a71b36709'),(663,2,'20220927.235213.904-financas','2022-11-23 10:18:33','6ee069ad551afe6dced1124ca6d3c7c5'),(664,2,'20220927.235216.930-financas','2022-11-23 10:18:33','77eb112b5972ad52f71f3ea1061b6d9d'),(665,2,'20220927.235219.962-financas','2022-11-23 10:18:33','76066c1a065b9e28e573c91060a789e5'),(666,2,'20220927.235223.000-financas','2022-11-23 10:18:33','3a7ca8f1c6f5bda112b614f7fbc04ad8'),(667,2,'20220927.235226.039-financas','2022-11-23 10:18:33','c6eb0bea276aa1508d4019a249d10d76'),(668,2,'20220927.235229.077-financas','2022-11-23 10:18:33','f13f9a7e4c0339f6666ca6bd20712ccb'),(669,2,'20220927.235232.112-financas','2022-11-23 10:18:33','b4aec92fc7a935541ea28a4ecc99198d'),(670,2,'20220927.235235.148-financas','2022-11-23 10:18:33','35b89124f61a89c452aae56dd5df4109'),(671,2,'20220927.235238.169-financas','2022-11-23 10:18:33','3087d9062716226ee073e52a1b993d29'),(672,2,'20220927.235241.201-financas','2022-11-23 10:18:33','d6bf1f424131e12ddc30aea9c2dfef7f'),(673,2,'20220927.235244.238-financas','2022-11-23 10:18:33','b2ee95415150932cdc653e3f380e93ba'),(674,2,'20220927.235247.273-financas','2022-11-23 10:18:33','8241b6dddabe34a5281d187f06efe014'),(675,2,'20220927.235250.314-financas','2022-11-23 10:18:33','05105c6de0df1fd9977963e61001d5ec'),(676,2,'20220927.235253.354-financas','2022-11-23 10:18:33','2da38ce668dc5ccac82e53e5d1b74c06'),(677,2,'20220927.235256.392-financas','2022-11-23 10:18:33','e81db819620318da07168a58f1beed7f'),(678,2,'20220927.235259.428-financas','2022-11-23 10:18:33','b49fbfd1cb00f57c1fecbd88954c0969'),(679,2,'20220927.235302.466-financas','2022-11-23 10:18:33','1b6982766f206a1af12bde8f9e054a52'),(680,2,'20220927.235305.497-financas','2022-11-23 10:18:33','e263dc6b84fd968b879a548c13e092c6'),(681,2,'20220927.235308.533-financas','2022-11-23 10:18:33','3fab5121965350183e3932079f202482'),(682,2,'20220927.235311.562-financas','2022-11-23 10:18:33','d8d5539d2c5601d2e21b10507589dab7'),(683,2,'20220927.235314.587-financas','2022-11-23 10:18:33','58fe6f95b226330e0d605c19035c4f39'),(684,2,'20220927.235317.617-financas','2022-11-23 10:18:33','0e00612e0d2576774fba853442a5eaad'),(685,2,'20220927.235320.649-financas','2022-11-23 10:18:33','5055bd5f0a0d9635f408e865b585dc0e'),(686,2,'20220927.235323.682-financas','2022-11-23 10:18:33','48e0fd6901c1bbda3ee09f68271ae44c'),(687,2,'20220927.235326.705-financas','2022-11-23 10:18:33','57d0788934dee0e4bc94778bc44f94b6'),(688,2,'20220927.235329.737-financas','2022-11-23 10:18:33','d978e8d1d1886ada2bdf8130a2159fdd'),(689,2,'20220927.235332.770-financas','2022-11-23 10:18:33','51c91372e37b0d049c2781cd3006ea89'),(690,2,'20220927.235335.808-financas','2022-11-23 10:18:33','73c7ce277fcdd810018c5923bba33ea4'),(691,2,'20220927.235338.835-financas','2022-11-23 10:18:33','e4cdd7c174b4edeed95a9c1d1159c060'),(692,2,'20220927.235341.861-financas','2022-11-23 10:18:33','66fc9fd52ad075a3c999c5ea62639161'),(693,2,'20220927.235344.896-financas','2022-11-23 10:18:33','bf0d1dc58def230ed4f74b2d4764fd16'),(694,2,'20220927.235347.928-financas','2022-11-23 10:18:33','000406ca3ae27342805250fd152191a3'),(695,2,'20220927.235350.958-financas','2022-11-23 10:18:33','734dbb734602d534472913c2d4cc7244'),(696,2,'20220927.235353.995-financas','2022-11-23 10:18:33','c95605324031f0980a046a6f968ada10'),(697,2,'20220927.235357.023-financas','2022-11-23 10:18:33','c17de55efc5202641bad1d70a74a0d87'),(698,2,'20220927.235400.059-financas','2022-11-23 10:18:33','f744404578585fef8d2121a14aea45e9'),(699,2,'20220927.235403.084-financas','2022-11-23 10:18:33','fad0335feb6c41baee71b1cf18a96e56'),(700,2,'20220927.235406.119-financas','2022-11-23 10:18:33','c480d24cf2ffe06342fe420baf4b0a1f'),(701,2,'20220927.235409.151-financas','2022-11-23 10:18:33','86158b236fe1e19bf6502d65a8749221'),(702,2,'20220927.235412.174-financas','2022-11-23 10:18:33','891c806403bb1e98b99710fa4e4ce7f6'),(703,2,'20220927.235415.207-financas','2022-11-23 10:18:33','0cf095e653e179a606b8ddae85d6be53'),(704,2,'20220927.235418.237-financas','2022-11-23 10:18:33','01865e17bc8cd8ea3f9b5c7ce8b97fcf'),(705,2,'20220927.235421.275-financas','2022-11-23 10:18:33','dd64f3dd7b2e0d562d30044c49f1a253'),(706,2,'20220927.235424.300-financas','2022-11-23 10:18:33','310957c2731db2bc78ea441b38b63dc9'),(707,2,'20220927.235427.335-financas','2022-11-23 10:18:33','455fc53f27f60116eed28bb04e42623a'),(708,2,'20220927.235430.368-financas','2022-11-23 10:18:33','cce17f4eab56530a15313ed91913ec4f'),(709,2,'20220927.235433.407-financas','2022-11-23 10:18:33','418887a384855e346b9a2bb1dcd39f57'),(710,2,'20220927.235436.447-financas','2022-11-23 10:18:33','4076a9010c0ffd5d78a8fba4a3ca1a68'),(711,2,'20220927.235439.474-financas','2022-11-23 10:18:33','52f5c0cf1c16ce33e16cfac6a128bb5d'),(712,2,'20220927.235442.510-financas','2022-11-23 10:18:33','bf45037da5b8f4828df4acfa7755e981'),(713,2,'20220927.235445.534-financas','2022-11-23 10:18:33','3f2465d0995f9e5b0567e6a9fc6936a5'),(714,2,'20220927.235448.567-financas','2022-11-23 10:18:33','8d08f0cfbd6456eab15b427c37730bd2'),(715,2,'20220927.235451.600-financas','2022-11-23 10:18:33','2f28dde97b9fcf819fc8be507cf6b99d'),(716,2,'20220927.235454.638-financas','2022-11-23 10:18:33','969229886b3d9ce2268359b1be35a977'),(717,2,'20220927.235457.667-financas','2022-11-23 10:18:33','48e31825ac5d199c7747879ab4945fba'),(718,2,'20220927.235500.697-financas','2022-11-23 10:18:33','d0d7ffd6db7bf795eb44d20ee697fdf4'),(719,2,'20220927.235503.731-financas','2022-11-23 10:18:33','9fd7c84e7b659d310063e18edcf32414'),(720,2,'20220927.235506.752-financas','2022-11-23 10:18:33','b64867bf46db9c5ed7ebff5e6b78593f'),(721,2,'20220927.235509.782-financas','2022-11-23 10:18:33','4eb780b464d8616127699778fcf81dd4'),(722,2,'20220927.235512.810-financas','2022-11-23 10:18:33','23514850df3c7382bf6af9bb3ecff7a4'),(723,2,'20220927.235515.845-financas','2022-11-23 10:18:33','da1f7bf7ac56e66c2a941e6f9642ce10'),(724,2,'20220927.235518.879-financas','2022-11-23 10:18:33','9f09a4561b0b444b2535aa40526c1640'),(725,2,'20220927.235521.906-financas','2022-11-23 10:18:33','7d1334f87cb2209b9ae3d1e74959ac28'),(726,2,'20220927.235524.939-financas','2022-11-23 10:18:33','f773af55b129ae10cce6560d0554f340'),(727,2,'20220927.235527.970-financas','2022-11-23 10:18:33','145beab0cfe04b168a56ffc4142dce56'),(728,2,'20220927.235531.000-financas','2022-11-23 10:18:33','e5e27f358724c4f9c3ca15cecda7cb9a'),(729,2,'20220927.235534.023-financas','2022-11-23 10:18:33','3e4046451a3ff8300d9458c1c4538fad'),(730,2,'20220927.235537.052-financas','2022-11-23 10:18:33','07d9324961061a6edbc7c14032867ffc'),(731,2,'20220927.235540.086-financas','2022-11-23 10:18:33','5ef26e4f1f661e5ffcac4838e3f94b08'),(732,2,'20220927.235543.124-financas','2022-11-23 10:18:33','fa6cf8b44924d755a8ad282c33b74862'),(733,2,'20220927.235546.152-financas','2022-11-23 10:18:33','0e4e5764cef7297eac9e03ced147e3a3'),(734,2,'20220927.235549.180-financas','2022-11-23 10:18:33','b3539514949893521563e11524c2d9de'),(735,2,'20220927.235552.219-financas','2022-11-23 10:18:33','cf5117e1ed7a6c755a9b244fff9290b1'),(736,2,'20220927.235555.246-financas','2022-11-23 10:18:33','feb558041dc6a2c8ca68084eea1b2cc9'),(737,2,'20220927.235558.272-financas','2022-11-23 10:18:33','10c50a24afc28a6454607d4388a6fb78'),(738,2,'20220927.235601.302-financas','2022-11-23 10:18:33','5e84d5716b7fc1d780a8f1aa83b655a2'),(739,2,'20220927.235604.335-financas','2022-11-23 10:18:33','069505260036a4b671c19f3770575a30'),(740,2,'20220927.235607.359-financas','2022-11-23 10:18:33','e27fe8f765f0cdb599ac229a1210e8e1'),(741,2,'20220927.235610.382-financas','2022-11-23 10:18:33','408f8ea49124e8be47556434acd5fda6'),(742,2,'20220927.235613.417-financas','2022-11-23 10:18:33','2f6360c48950143338da40e790799200'),(743,2,'20220927.235616.438-financas','2022-11-23 10:18:33','54369e0c7fe3d8057703821a83ae1cec'),(744,2,'20220927.235619.469-financas','2022-11-23 10:18:33','3ceb8a307282784007af8eda6849557d'),(745,2,'20220927.235622.494-financas','2022-11-23 10:18:33','d7d27b7bf53a95d0189e7ca8c10bfb32'),(746,2,'20220927.235625.524-financas','2022-11-23 10:18:33','04b79d2503f146fe0c37465a23e999f9'),(747,2,'20220927.235628.559-financas','2022-11-23 10:18:33','0c292a3a08fd399f87ba9f51b6e8f7ef'),(748,2,'20220927.235631.600-financas','2022-11-23 10:18:33','78a8d115d67a3ff4efaa72cb93608797'),(749,2,'20220927.235634.627-financas','2022-11-23 10:18:33','d17eb2a6f87df6376b5c320b0428eb81'),(750,2,'20220927.235637.664-financas','2022-11-23 10:18:33','a3db212719911d879dd738d522430ae4'),(751,2,'20220927.235640.695-financas','2022-11-23 10:18:33','fa31b2bbecaca40d3f12f6215433a40c'),(752,2,'20220927.235643.725-financas','2022-11-23 10:18:33','503975ed366f4e0deac7b49b6139a58b'),(753,2,'20220927.235646.750-financas','2022-11-23 10:18:33','b3a6cb1022191569e646ad39651d5581'),(754,2,'20220927.235649.785-financas','2022-11-23 10:18:33','524cfcdc34628ae3f3c896c6fe5602b9'),(755,2,'20220927.235652.818-financas','2022-11-23 10:18:33','8087c3a1d5d5e2086f4a1629509f3041'),(756,2,'20220927.235655.851-financas','2022-11-23 10:18:33','01a827a1dded8eb89d22f8bd1b05d768'),(757,2,'20220927.235658.889-financas','2022-11-23 10:18:33','07e5bbab0a259b26e5ee09a25428132a'),(758,2,'20220927.235701.929-financas','2022-11-23 10:18:33','66a8059859343296b6413392e200a56d'),(759,2,'20220927.235704.953-financas','2022-11-23 10:18:33','8889d39279648c7d5368bb75c60109c9'),(760,2,'20220927.235707.975-financas','2022-11-23 10:18:33','68d166811801336b0be31a29ddc7caf1'),(761,2,'20220927.235711.002-financas','2022-11-23 10:18:33','5784ee7863c25ff3e2621216aff30d10'),(762,2,'20220927.235714.052-financas','2022-11-23 10:18:33','86036da3b2b921b27156f25e041cbe98'),(763,2,'20220927.235717.084-financas','2022-11-23 10:18:33','cd4ed06776645b6339a217169e72697a'),(764,2,'20220927.235720.105-financas','2022-11-23 10:18:33','06d236f37afa02eadc96c43f2953c5df'),(765,2,'20220927.235723.141-financas','2022-11-23 10:18:33','d73c688104bb8a93cbf7f52a0db07479'),(766,2,'20220927.235726.169-financas','2022-11-23 10:18:33','4d2ca6a49c092b89974fb04336699734'),(767,2,'20220927.235729.202-financas','2022-11-23 10:18:33','c4b6af97cdf30fb9290ccda795c39976'),(768,2,'20220927.235732.236-financas','2022-11-23 10:18:33','f370c1d0ef239a0e47392c3a3a09e37d'),(769,2,'20220927.235735.268-financas','2022-11-23 10:18:33','952a0ab3b365ec991e79449c8469b59d'),(770,2,'20220927.235738.302-financas','2022-11-23 10:18:33','374f315276cd90b2514b91cfd84457a6'),(771,2,'20220927.235741.334-financas','2022-11-23 10:18:33','3385ae742ac7e30c172468eb643f88bb'),(772,2,'20220927.235744.369-financas','2022-11-23 10:18:33','a68f503d6273e27be861549bf869daa3'),(773,2,'20220927.235747.398-financas','2022-11-23 10:18:33','fb26b2d43878590ec6be08b1d046d525'),(774,2,'20220927.235750.435-financas','2022-11-23 10:18:33','7f75f41d7d8cc471ed1631170a69cbd2'),(775,2,'20220927.235753.476-financas','2022-11-23 10:18:33','adb2878c1f83e4063af04da635012cb0'),(776,2,'20220927.235756.506-financas','2022-11-23 10:18:33','df814c35ab1fcd7e90325e059cfdccc4'),(777,2,'20220927.235759.543-financas','2022-11-23 10:18:33','0dce260ae9cddeb9905cc1038acae555'),(778,2,'20220927.235802.580-financas','2022-11-23 10:18:33','733c18451990244a61fd59f6c52ac362'),(779,2,'20220927.235805.609-financas','2022-11-23 10:18:33','769a258ea367e8d9ad917443041d3ec2'),(780,2,'20220927.235808.641-financas','2022-11-23 10:18:33','fdf650b4fd10318923bf4633455b16d1'),(781,2,'20220927.235811.673-financas','2022-11-23 10:18:33','440c5395b5405a3f718218c5dcaf85cb'),(782,2,'20220927.235814.705-financas','2022-11-23 10:18:33','dceb396b03061e376bc38635d9ceac56'),(783,2,'20220927.235817.734-financas','2022-11-23 10:18:33','c26576cb87c739429781f997c5bed94b'),(784,2,'20220927.235820.769-financas','2022-11-23 10:18:33','91f886634e545bd401876f11eb007831'),(785,2,'20220927.235823.807-financas','2022-11-23 10:18:33','66d8d4877f57c144bfbb0ca36fefc3af'),(786,2,'20220927.235826.843-financas','2022-11-23 10:18:33','d2e7ff02c2734722c11dc0e4b1eaf470'),(787,2,'20220927.235829.876-financas','2022-11-23 10:18:33','9e5301fa72571c94caa8a6ddf644723d'),(788,2,'20220927.235832.900-financas','2022-11-23 10:18:33','83c80f1dca51e63787c467f088807bce'),(789,2,'20220927.235835.926-financas','2022-11-23 10:18:33','cb997579e8293e2e10a4fb7d38a27095'),(790,2,'20220927.235838.957-financas','2022-11-23 10:18:33','1b5bb4025850f0c931b386c10ad3b8a4'),(791,2,'20220927.235841.991-financas','2022-11-23 10:18:33','df3e0d2a1501c5a3ff10ebfd1f888e71'),(792,2,'20220927.235845.017-financas','2022-11-23 10:18:33','b75e60c4a19c4655c13274b25ab2636a'),(793,2,'20220927.235848.044-financas','2022-11-23 10:18:33','4aa8008cb1c7f57c476a6d389efe8c4f'),(794,2,'20220927.235851.083-financas','2022-11-23 10:18:33','35f32d2cef374bee843453eabe311eea'),(795,2,'20220927.235854.111-financas','2022-11-23 10:18:33','1b02ca2b44da7ad97d9f16b7df5c9e22'),(796,2,'20220927.235857.136-financas','2022-11-23 10:18:33','d1acdf8122f51abca5570ebbc22ad0b0'),(797,2,'20220927.235900.162-financas','2022-11-23 10:18:33','6f028eaf3912c555b039bdb7f31fc550'),(798,2,'20220927.235903.197-financas','2022-11-23 10:18:33','f71f73e0dd47186e8a584e5f6c38bdb9'),(799,2,'20220927.235906.224-financas','2022-11-23 10:18:33','9378ab332f2ca82ac5e4c61d5bbd9e29'),(800,2,'20220927.235909.255-financas','2022-11-23 10:18:33','f8953eb7de2480c52e57bfe0c5c57b4a'),(801,2,'20220927.235912.287-financas','2022-11-23 10:18:33','f84d2e0effb2109a7824cf5cbfa4205d'),(802,2,'20220927.235915.315-financas','2022-11-23 10:18:33','a20cab1b40e0e97453b5f8af895169a0'),(803,2,'20220927.235918.338-financas','2022-11-23 10:18:33','2d74f9ec858cf2cdf73da78d4c234c4b'),(804,2,'20220927.235921.371-financas','2022-11-23 10:18:33','6ee3d1b7f39a299c1570447013bbb2e2'),(805,2,'20220927.235924.407-financas','2022-11-23 10:18:33','4bb0850392b143a39eb5d4c67b4d2189'),(806,2,'20220927.235927.435-financas','2022-11-23 10:18:33','2f3612741d5b45c636d24048475b7ec2'),(807,2,'20220927.235930.460-financas','2022-11-23 10:18:33','cf4a5b6c42298ed4359efcca037822a4'),(808,2,'20220927.235933.488-financas','2022-11-23 10:18:33','0b5cb3aac19c030d91c7ad1fa792a9b6'),(809,2,'20220927.235936.518-financas','2022-11-23 10:18:33','c305db37dac64454ce5b819cdf026675'),(810,2,'20220927.235939.552-financas','2022-11-23 10:18:33','e8053444f453c3c5e6abc16d0c2072c1'),(811,2,'20220927.235942.589-financas','2022-11-23 10:18:33','25b367c3e8aa00d629a3a92df1e0c9cc'),(812,2,'20220927.235945.621-financas','2022-11-23 10:18:33','8095d654248452c24232adaa8e9301be'),(813,2,'20220927.235948.650-financas','2022-11-23 10:18:33','fd1e62fdd04a7fbc98deff384709c8c1'),(814,2,'20220927.235951.682-financas','2022-11-23 10:18:33','b4d89d0b7b3809787072901f5784bd59'),(815,2,'20220927.235954.711-financas','2022-11-23 10:18:33','91efaa38d2852f88c45866c24b3780f1'),(816,2,'20220927.235957.739-financas','2022-11-23 10:18:33','a61a362c0e6c40a5ffaf0cd09893037f'),(817,2,'20220928.000000.777-financas','2022-11-23 10:18:33','ac686cd6c0a1f0535ef994ad685560be'),(818,2,'20220928.000003.802-financas','2022-11-23 10:18:33','fd58cae9ad73112e04c8e05693136d67'),(819,2,'20220928.000006.822-financas','2022-11-23 10:18:33','7c9ad1c1de857a067b241a9f2125b71f'),(820,2,'20220928.000009.863-financas','2022-11-23 10:18:33','a3877c5fa67e71266b311427f8b9bd2f'),(821,2,'20220928.000012.903-financas','2022-11-23 10:18:33','c5ef04e78e63269f8526969a6d40eb35'),(822,2,'20220928.000015.943-financas','2022-11-23 10:18:33','ab13b03a7c876681c6188053ee3b11e3'),(823,2,'20220928.000018.981-financas','2022-11-23 10:18:33','2452b9ffdbaf22eb786a211ab58b4d52'),(824,2,'20220928.000022.009-financas','2022-11-23 10:18:33','404ae8bec16598da1eaa31d41d90322c'),(825,2,'20220928.000025.041-financas','2022-11-23 10:18:33','3c24fbbb67ca57b166d32bf7d0fbb7a3'),(826,2,'20220928.000028.081-financas','2022-11-23 10:18:33','abc2869ba4806de7046a13d5c64003b2'),(827,2,'20220928.000031.113-financas','2022-11-23 10:18:33','4dd46c3243a76efb9c649af606fa0cbf'),(828,2,'20220928.000034.142-financas','2022-11-23 10:18:33','e7d8401c3db1a681cd413983af417fb3'),(829,2,'20220928.000037.169-financas','2022-11-23 10:18:33','52c074172df43a3372e804b7b8234b20'),(830,2,'20220928.000040.202-financas','2022-11-23 10:18:33','729b9e2fe73d825c3d86061bf136ea75'),(831,2,'20220928.000043.228-financas','2022-11-23 10:18:33','b68b5041070d7a1724b60700e404a65e'),(832,2,'20220928.000046.263-financas','2022-11-23 10:18:33','5c827cc6e454c7a7c5135913386b9eb9'),(833,2,'20220928.000049.305-financas','2022-11-23 10:18:33','e5517761764508cb37bc0db69dcedb7a'),(834,2,'20220928.000052.334-financas','2022-11-23 10:18:33','f43f7c695c177dc2d3099624f91ac3fb'),(835,2,'20220928.000055.360-financas','2022-11-23 10:18:33','0495b92ed0875f6fbf70ba620f499b2e'),(836,2,'20220928.000058.393-financas','2022-11-23 10:18:33','cdbfe871b2b70b95ba1b61caf2d140d5'),(837,2,'20220928.000101.432-financas','2022-11-23 10:18:33','c6e565683426a82f89fcdede2c314fb1'),(838,2,'20220928.000104.459-financas','2022-11-23 10:18:33','d47539945655be21a7bbeb9dfd152d2d'),(839,2,'20220928.000107.487-financas','2022-11-23 10:18:33','7d0b2226b1ab5368aa79602e5d972e58'),(840,2,'20220928.000110.527-financas','2022-11-23 10:18:33','297773d6eb3a902a2a2dd443e14021c4'),(841,2,'20220928.000113.561-financas','2022-11-23 10:18:33','6293711e4585c16929074381eb79ff0c'),(842,2,'20220928.000116.585-financas','2022-11-23 10:18:33','8fb752abc0d677f45db79a76ff45cfe8'),(843,2,'20220928.000119.618-financas','2022-11-23 10:18:33','4c31c6def5c59d922868079bbcaa25a5'),(844,2,'20220928.000122.659-financas','2022-11-23 10:18:33','79f6873b995a78876c04a801be60e7b4'),(845,2,'20220928.000125.688-financas','2022-11-23 10:18:33','c38461ae2ed54f0d2fdd35e57ba44ed8'),(846,2,'20220928.000128.722-financas','2022-11-23 10:18:33','81ac705f144f3b59ac1f4b2520bedebd'),(847,2,'20220928.000131.753-financas','2022-11-23 10:18:33','8087d2feb5f0d17fe5ba0cc082ed9813'),(848,2,'20220928.000134.781-financas','2022-11-23 10:18:33','c07547394ad6ab40e30f32e8035d788b'),(849,2,'20220928.000137.820-financas','2022-11-23 10:18:33','6db19c6a32a322114ab17693d03bedad'),(850,2,'20220928.000140.842-financas','2022-11-23 10:18:33','bd0181348831ab7f7449ada8671cb82f'),(851,2,'20220928.000143.871-financas','2022-11-23 10:18:33','3c0e330a945230249bc6719886e36e63'),(852,2,'20220928.000146.906-financas','2022-11-23 10:18:33','4d962b2d228bf071cc675f00928fea79'),(853,2,'20220928.000149.934-financas','2022-11-23 10:18:33','5b017633c124762ea6c0d482ec13cc32'),(854,2,'20220928.000152.956-financas','2022-11-23 10:18:33','7cb32df05f6e68cf3e50393b2ed2bf47'),(855,2,'20220928.000155.994-financas','2022-11-23 10:18:33','520125e05588fb393bb0739f5371cc29'),(856,2,'20220928.000159.026-financas','2022-11-23 10:18:33','a9e913faca7b55529b546049daea64a5'),(857,2,'20220928.000202.058-financas','2022-11-23 10:18:33','7c7f1b7dacdf0f9414498b5e6572551b'),(858,2,'20220928.000205.078-financas','2022-11-23 10:18:33','8b036a30cedd2779bedded0d17607150'),(859,2,'20220928.000208.110-financas','2022-11-23 10:18:33','96f1689454e805cab19417f138c2e7de'),(860,2,'20220928.000211.138-financas','2022-11-23 10:18:33','e9d2d7ef87f8b72963de09b166b7a027'),(861,2,'20220928.000214.166-financas','2022-11-23 10:18:33','4888ebf66712b8458d06f8c36fb6cef5'),(862,2,'20220928.000217.206-financas','2022-11-23 10:18:33','20e4ffda9679818a75aaec55c2d2876f'),(863,2,'20220928.000220.226-financas','2022-11-23 10:18:33','11d19fc454046074f1a940926a2e2871'),(864,2,'20220928.000223.258-financas','2022-11-23 10:18:33','ab4cf4c2ad4cb630c39bcb611a94f5a7'),(865,2,'20220928.000226.295-financas','2022-11-23 10:18:33','16e8ee2093c0cc28672480a3e88fc277'),(866,2,'20220928.000229.320-financas','2022-11-23 10:18:33','3ce851aa074deb68660fff810c8d3220'),(867,2,'20220928.000232.351-financas','2022-11-23 10:18:33','d367281e81c44a769a9915299e763fe3'),(868,2,'20220928.000235.389-financas','2022-11-23 10:18:33','e825e8fb4f7ecd8da4ac50bac24bdfd2'),(869,2,'20220928.000238.415-financas','2022-11-23 10:18:33','0f5eec393648f4063609e03e596954d3'),(870,2,'20220928.000241.445-financas','2022-11-23 10:18:33','eb3bd89713cc44583b3e025a3d80cb64'),(871,2,'20220928.000244.477-financas','2022-11-23 10:18:33','158755c10c910e7f41542c0f8fadc4be'),(872,2,'20220928.000247.501-financas','2022-11-23 10:18:33','57e138934393ef1c49b4158ae1e14a2b'),(873,2,'20220928.000250.533-financas','2022-11-23 10:18:33','3dea2c409361ee16305ab6e9864b0fd5'),(874,2,'20220928.000253.562-financas','2022-11-23 10:18:33','22db1d7c838d52b8d784f701ede1a170'),(875,2,'20220928.000256.601-financas','2022-11-23 10:18:33','8146217f10d536d476c0337e0066029a'),(876,2,'20220928.000259.628-financas','2022-11-23 10:18:33','50464a413d5d6bef365cd5bc8b1eb0dc'),(877,2,'20220928.000302.658-financas','2022-11-23 10:18:33','67a36da0494e66c67cff188a67d7bbcf'),(878,2,'20220928.000305.684-financas','2022-11-23 10:18:33','4387778bff4caeef6d11637fcf46d442'),(879,2,'20220928.000308.714-financas','2022-11-23 10:18:33','1a045fb2e24f93c3222ed8e825805b91'),(880,2,'20220928.000311.741-financas','2022-11-23 10:18:33','e840d60e656a5c92812adcbc8e4d574d'),(881,2,'20220928.000314.771-financas','2022-11-23 10:18:33','aa598fc5e566ed7da86e5caefc1cc605'),(882,2,'20220928.000317.799-financas','2022-11-23 10:18:33','e9c363c237cacdb64a58266455e78987'),(883,2,'20220928.000320.836-financas','2022-11-23 10:18:33','c8ea035a768509c049bb25a8652280a6'),(884,2,'20220928.000323.866-financas','2022-11-23 10:18:33','24a0812b0c56d7eec325c8668105a557'),(885,2,'20220928.000326.888-financas','2022-11-23 10:18:33','356ceec944ec35feb1131efdc37005a0'),(886,2,'20220928.000329.925-financas','2022-11-23 10:18:33','f57e6cfb7add657983a017238e180bb3'),(887,2,'20220928.000332.967-financas','2022-11-23 10:18:33','deb6fcc35c48bb9156dd036f0e8453a3'),(888,2,'20220928.000335.991-financas','2022-11-23 10:18:33','27eca7189fefb6b718b260698bb07da7'),(889,2,'20220928.000339.022-financas','2022-11-23 10:18:33','df5aafdf214f02b324e1481c980e7b2b'),(890,2,'20220928.000342.050-financas','2022-11-23 10:18:33','ff67e7b0860859b7f2ec6e0132f3dcaa'),(891,2,'20220928.000345.072-financas','2022-11-23 10:18:33','ee720ac92da54c653847264726e435f8'),(892,2,'20220928.000348.111-financas','2022-11-23 10:18:33','f25d5256a1a011b4f71075f0e8457573'),(893,2,'20220928.000351.138-financas','2022-11-23 10:18:33','686d8de73f972c26145b0e0d9ff2293c'),(894,2,'20220928.000354.170-financas','2022-11-23 10:18:33','f62a229be463cd94c49d91c388e87aac'),(895,2,'20220928.000357.198-financas','2022-11-23 10:18:33','02671917fa44bfa54e673ea986b833ef'),(896,2,'20220928.000400.229-financas','2022-11-23 10:18:33','7ea218683169bc28a52273144448191a'),(897,2,'20220928.000403.254-financas','2022-11-23 10:18:33','db8b117ad9517ba2d53eb4b41151a72c'),(898,2,'20220928.000406.288-financas','2022-11-23 10:18:33','a7d266b23e5891b22a6ec77aa657c22c'),(899,2,'20220928.000409.316-financas','2022-11-23 10:18:33','bb567eba248024108f64b4285eef71b9'),(900,2,'20220928.000412.356-financas','2022-11-23 10:18:33','04e626d60d4f4ba744dc8eefbc3a6764'),(901,2,'20220928.000415.390-financas','2022-11-23 10:18:33','4204fb7e83ac479aa3565ee7e8495915'),(902,2,'20220928.000418.428-financas','2022-11-23 10:18:33','d6713ddbf632502c3722970952506ed4'),(903,2,'20220928.000421.451-financas','2022-11-23 10:18:33','6095abc4895a346f8ab4a0a1cf4f2384'),(904,2,'20220928.000424.491-financas','2022-11-23 10:18:33','aa7c5fe738b6415e6797f35d5ba1dbc4'),(905,2,'20220928.000427.532-financas','2022-11-23 10:18:33','2fe36dee234e7ac43b18c6fdb26fef6e'),(906,2,'20220928.000430.557-financas','2022-11-23 10:18:33','a5b45873eb76a16c109854899cfb6a15'),(907,2,'20220928.000433.586-financas','2022-11-23 10:18:33','1d2d187655b9d0f2c7aa18cad132f4c8'),(908,2,'20220928.000436.627-financas','2022-11-23 10:18:33','efbdf22bee31b85d76e91b1a22eedc7b'),(909,2,'20220928.000439.659-financas','2022-11-23 10:18:33','790c64d4038ae3185d7cf9af11ad9a8c'),(910,2,'20220928.000442.697-financas','2022-11-23 10:18:33','8226ace33d0964532aea45d9493df211'),(911,2,'20220928.000445.727-financas','2022-11-23 10:18:33','7f75334fd4341cae171f40a6e814fa9a'),(912,2,'20220928.000448.754-financas','2022-11-23 10:18:33','eda10907ebfa16cd71f98f77d0dca657'),(913,2,'20220928.000451.790-financas','2022-11-23 10:18:33','405f9167c5cc966fc031020ba3a8c36d'),(914,2,'20220928.000454.830-financas','2022-11-23 10:18:33','364554b7160fe8bcbc74d927872defc3'),(915,2,'20220928.000457.858-financas','2022-11-23 10:18:33','a746ada60401e0b241570d284a88955b'),(916,2,'20220928.000500.883-financas','2022-11-23 10:18:33','437b6a1933acfede360673a448551fac'),(917,2,'20220928.000503.923-financas','2022-11-23 10:18:33','b6f85af829b6e7c91e933cc3b897411c'),(918,2,'20220928.000506.955-financas','2022-11-23 10:18:33','6a027069e98a3f188d7ccbd8ff754436'),(919,2,'20220928.000509.991-financas','2022-11-23 10:18:33','bc2c298b01cddbf85fe4533225d16f27'),(920,2,'20220928.000513.015-financas','2022-11-23 10:18:33','57a7ec94a6446159225d2487703d8106'),(921,2,'20220928.000516.050-financas','2022-11-23 10:18:33','0e9bfdb12bf3bb0a8fd1b5482295bd0c'),(922,2,'20220928.000519.083-financas','2022-11-23 10:18:33','169a50cd325cac0feb5e2790da413d34'),(923,2,'20220928.000522.115-financas','2022-11-23 10:18:33','eb612e0e753f3585f61ecf030de996eb'),(924,2,'20220928.000525.156-financas','2022-11-23 10:18:33','408a9cbbaf4b84199c4e5099478986b3'),(925,2,'20220928.000528.187-financas','2022-11-23 10:18:33','d92dedeb20ce848dbbd3ea31f76672d5'),(926,2,'20220928.000531.223-financas','2022-11-23 10:18:33','76c1a541cbb5d21547b339588000b980'),(927,2,'20220928.000534.253-financas','2022-11-23 10:18:33','dd63aeb609e8808e6bc190fd95aea4fe'),(928,2,'20220928.000537.274-financas','2022-11-23 10:18:33','1998e772a6a2c36d883e0223ff3b49d0'),(929,2,'20220928.000540.310-financas','2022-11-23 10:18:33','1fe0ec73bbf9129e7a929ed5556138df'),(930,2,'20220928.000543.338-financas','2022-11-23 10:18:33','5deb901135c0ca8b15b3d8c2b79b4225'),(931,2,'20220928.000546.372-financas','2022-11-23 10:18:33','de210093c8a883a141baea907fe2865f'),(932,2,'20220928.000549.408-financas','2022-11-23 10:18:33','6e979591374e524b65c7b54600799d94'),(933,2,'20220928.000552.450-financas','2022-11-23 10:18:33','e7c2ba138897d1c97c5a9cff2030dfc1'),(934,2,'20220928.000555.478-financas','2022-11-23 10:18:33','f8646ea70341dbe44664088d229e9051'),(935,2,'20220928.000558.508-financas','2022-11-23 10:18:33','14e415e18b6591cf0d7bb5c6fd5cb45d'),(936,2,'20220928.000601.544-financas','2022-11-23 10:18:33','cf0a3eba76a055d77ac2d9901dd017a4'),(937,2,'20220928.000604.564-financas','2022-11-23 10:18:33','2801028dec4c07e492f722dcf98e4429'),(938,2,'20220928.000607.588-financas','2022-11-23 10:18:33','13d3478adae8f5a71c8249d34e7418c2'),(939,2,'20220928.000610.626-financas','2022-11-23 10:18:33','f5f42cdc87d7678e7952608a9f4505e3'),(940,2,'20220928.000613.667-financas','2022-11-23 10:18:33','ae924bc71014edd6bfde6783408b708c'),(941,2,'20220928.000616.703-financas','2022-11-23 10:18:33','a526bc408011b69ce94e4c1791e1dcfb'),(942,2,'20220928.000619.731-financas','2022-11-23 10:18:33','21d3a109161dec558cb27d993bc34f30'),(943,2,'20220928.000622.761-financas','2022-11-23 10:18:33','d76fde7c0e2ab9c17edd9e813355e4a9'),(944,2,'20220928.000625.789-financas','2022-11-23 10:18:33','d0bde966aa3bfb8567e2d6a2c1a7e5e2'),(945,2,'20220928.000628.819-financas','2022-11-23 10:18:33','20296689128739e66f443e7d9a411e71'),(946,2,'20220928.000631.844-financas','2022-11-23 10:18:33','f29898331d56e837ef1b75dbf63e6565'),(947,2,'20220928.000634.882-financas','2022-11-23 10:18:33','b209106ed9ec72eb6640b1f7ae23e5e3'),(948,2,'20220928.000637.921-financas','2022-11-23 10:18:33','caa8d0957ced051bcbe5ab25ac7c4ab9'),(949,2,'20220928.000640.954-financas','2022-11-23 10:18:33','975ffed167f5d1e55a776a93d16347da'),(950,2,'20220928.000643.980-financas','2022-11-23 10:18:33','7cdc5ad42e058bf5352fa45ad989face'),(951,2,'20220928.000647.008-financas','2022-11-23 10:18:33','ce03be7ce0245584660b92bc4088c5ca'),(952,2,'20220928.000650.050-financas','2022-11-23 10:18:33','d62f2bf00d4af8cc00bfdcd4f97b140d'),(953,2,'20220928.000653.076-financas','2022-11-23 10:18:33','7e962a34c52176efb73a589e5051fa13'),(954,2,'20220928.000656.104-financas','2022-11-23 10:18:33','9e2d2ae72d47216a28d10b82d7f2f1be'),(955,2,'20220928.000659.138-financas','2022-11-23 10:18:33','2b0cfdce3299911369c39647eeedf622'),(956,2,'20220928.000702.173-financas','2022-11-23 10:18:33','7844d308cb3560e989398e9e466576de'),(957,2,'20220928.000705.207-financas','2022-11-23 10:18:33','3e730fda9d4d92557964672b77b7a1af'),(958,2,'20220928.000708.236-financas','2022-11-23 10:18:33','c4bdda2ce336edfd2e495faa32d8df62'),(959,2,'20220928.000711.264-financas','2022-11-23 10:18:34','631b36b3d92d8961079d4f554e0fd45a'),(960,2,'20220928.000714.288-financas','2022-11-23 10:18:34','faeb376cfafc27ac1c7f3baf56ebd7dd'),(961,2,'20220928.000717.326-financas','2022-11-23 10:18:34','98690e547dc6e4848fb14c32b2f27acf'),(962,2,'20220928.000720.359-financas','2022-11-23 10:18:34','b728a3e86a324aa2bf36fd42c9f4a464'),(963,2,'20220928.000723.400-financas','2022-11-23 10:18:34','70d0d5c5335c3e08cbdc1671e4fd1c76'),(964,2,'20220928.000726.434-financas','2022-11-23 10:18:34','8466bd92296afe9c2d99d8298fc14548'),(965,2,'20220928.000729.468-financas','2022-11-23 10:18:34','adb24fe583bafe4c4f4b2c9ff5b5170d'),(966,2,'20220928.000732.501-financas','2022-11-23 10:18:34','a356fe201542a0083815483c8f3e600c'),(967,2,'20220928.000735.533-financas','2022-11-23 10:18:34','5fa01e5398da027365d24fd419721da6'),(968,2,'20220928.000738.567-financas','2022-11-23 10:18:34','e48d40cc883393b184e6032392d8c534'),(969,2,'20220928.000741.592-financas','2022-11-23 10:18:34','7d9c23c211f67cc05c82a64f1582c6de'),(970,2,'20220928.000744.622-financas','2022-11-23 10:18:34','eda26940741081269b056b9044163aff'),(971,2,'20220928.000747.645-financas','2022-11-23 10:18:34','56fae90d21aa8c2dd3b91b648998d701'),(972,2,'20220928.000750.686-financas','2022-11-23 10:18:34','715d9068cd4925726b1e6e7fad860089'),(973,2,'20220928.000753.718-financas','2022-11-23 10:18:34','f2862011b25865cfa7a75911c81ca54b'),(974,2,'20220928.000756.745-financas','2022-11-23 10:18:34','5e98d782077dc1f51780a6126627e84d'),(975,2,'20220928.000759.767-financas','2022-11-23 10:18:34','94525376535d9bada359a135bcbb5b01'),(976,2,'20220928.000802.796-financas','2022-11-23 10:18:34','1528b28f30b9de3a58173b4dc0dd7973'),(977,2,'20220928.000805.827-financas','2022-11-23 10:18:34','137155d1d09910657258dd62d0c55d4e'),(978,2,'20220928.000808.858-financas','2022-11-23 10:18:34','575cc911f5ec4471ebe354c1a26c8183'),(979,2,'20220928.000811.893-financas','2022-11-23 10:18:34','c04f8fc01972cf5611cd9cf188fd192c'),(980,2,'20220928.000814.920-financas','2022-11-23 10:18:34','36a9a0d8d3390f415a5f7ff3755f760f'),(981,2,'20220928.000817.950-financas','2022-11-23 10:18:34','3e512de211f489d993b112615471fe7b'),(982,2,'20220928.000820.970-financas','2022-11-23 10:18:34','fb5b19084086b19c41c8c02d13217f32'),(983,2,'20220928.000823.991-financas','2022-11-23 10:18:34','762ab46d41b1af00914d56e46ec18e4c'),(984,2,'20220928.000827.017-financas','2022-11-23 10:18:34','2bad00d87187fec520a67a464aa2f6f2'),(985,2,'20220928.000830.051-financas','2022-11-23 10:18:34','2642f4a289791fc60777f79f1a37ad37'),(986,2,'20220928.000833.075-financas','2022-11-23 10:18:34','b333d73c125b0af3f87d72c4be385dde'),(987,2,'20220928.000836.114-financas','2022-11-23 10:18:34','4d1f4bac7cf811a4c427464c035fda0d'),(988,2,'20220928.000839.133-financas','2022-11-23 10:18:34','690e23e5fcca5b2e85a5d3a206b30f12'),(989,2,'20220928.000842.159-financas','2022-11-23 10:18:34','eba22457367b13f310c1bfd44897eaf4'),(990,2,'20220928.000845.191-financas','2022-11-23 10:18:34','cf391d27136bdf2d18411f73ac833878'),(991,2,'20220928.000848.226-financas','2022-11-23 10:18:34','ac60d5d5df391a01119fb9aa8f06e533'),(992,2,'20220928.000851.258-financas','2022-11-23 10:18:34','5d0788edf86dc66bdee612b974e77232'),(993,2,'20220928.000854.278-financas','2022-11-23 10:18:34','ee6f4030aa08b254e5d9b2ff0042a5d6'),(994,2,'20220928.000857.314-financas','2022-11-23 10:18:34','c1af0c95304837f4f546b4303c465b4a'),(995,2,'20220928.000900.341-financas','2022-11-23 10:18:34','184f6c5aad6ff76486f5fc5bb76a6f63'),(996,2,'20220928.000903.379-financas','2022-11-23 10:18:34','9df8b8d17754ef5c47dc59dbad3cf0a1'),(997,2,'20220928.000906.405-financas','2022-11-23 10:18:34','41f862cf31c5918fe8459fd4aed09e91'),(998,2,'20220928.000909.435-financas','2022-11-23 10:18:34','24e66b4a52a156c122bb4e5fc5560240'),(999,2,'20220928.000912.472-financas','2022-11-23 10:18:34','37faf1b967167700dab885c9d6665a9a'),(1000,2,'20220928.000915.501-financas','2022-11-23 10:18:34','b969e6eff17faec4c960bf1b76a0dea5'),(1001,2,'20220928.000918.537-financas','2022-11-23 10:18:34','8813a9eeefd6aa82958001a8872ccdf2'),(1002,2,'20220928.000921.566-financas','2022-11-23 10:18:34','5d15a60e8f43a830f643b874da03f4db'),(1003,2,'20220928.000924.597-financas','2022-11-23 10:18:34','2f704dea42ff7b3df9c479397e41c661'),(1004,2,'20220928.000927.634-financas','2022-11-23 10:18:34','b6197bd3c7b9cc2541ed495bd247cb33'),(1005,2,'20220928.000930.662-financas','2022-11-23 10:18:34','703354943898c8d4e712fb2cb2f38fd4'),(1006,2,'20220928.000933.690-financas','2022-11-23 10:18:34','e4df53b0c10f2994aa0bdcdfaefb1c64'),(1007,2,'20220928.000936.726-financas','2022-11-23 10:18:34','cc870918859d81f1cb0675a0e6d55d5a'),(1008,2,'20220928.000939.759-financas','2022-11-23 10:18:34','a97b445dc3cd47d230bfd949d512a10a'),(1009,2,'20220928.000942.790-financas','2022-11-23 10:18:34','0f90c41c9bc863c016802b4548783855'),(1010,2,'20220928.000945.820-financas','2022-11-23 10:18:34','8df12b755c2fae6ec25d5eb946d945c0'),(1011,2,'20220928.000948.853-financas','2022-11-23 10:18:34','ed86d629229b9ac85954d37b9f5180b2'),(1012,2,'20220928.000951.893-financas','2022-11-23 10:18:34','4464202320783df783a4f9e9fbdbf150'),(1013,2,'20220928.000954.921-financas','2022-11-23 10:18:34','39c33602842be7979f7ed7db351dc699'),(1014,2,'20220928.000957.956-financas','2022-11-23 10:18:34','933f553efd8ffde9e69bca3139e5d498'),(1015,2,'20220928.001000.995-financas','2022-11-23 10:18:34','c3a1d5dbcfe29de6ba240138ac7bccc8'),(1016,2,'20220928.001004.029-financas','2022-11-23 10:18:34','664fd8dfc8cf1da8b59dae207fca2a63'),(1017,2,'20220928.001007.053-financas','2022-11-23 10:18:34','73978cd2c4c4efe2eaf8c333db424de2'),(1018,2,'20220928.001010.083-financas','2022-11-23 10:18:34','d03529bede5137cb5a9ea354b160dca5'),(1019,2,'20220928.001013.112-financas','2022-11-23 10:18:34','689237c96989801b91532d41c15c5c8b'),(1020,2,'20220928.001016.152-financas','2022-11-23 10:18:34','a47cbf3a9501b0045a64fc11cfae1680'),(1021,2,'20220928.001019.181-financas','2022-11-23 10:18:34','060e55dcefa2e70f1ebe08de5cf8bcb9'),(1022,2,'20220928.001022.212-financas','2022-11-23 10:18:34','e4b7b8ba7e82510f611f3951f257e0ed'),(1023,2,'20220928.001025.248-financas','2022-11-23 10:18:34','f65a4097ee602a14812a628078453a50'),(1024,2,'20220928.001028.277-financas','2022-11-23 10:18:34','e9bcd49efc0f70fdf51bd5678e387d8f'),(1025,2,'20220928.001031.307-financas','2022-11-23 10:18:34','af8f7b6973850e8447652ee238ecd182'),(1026,2,'20220928.001034.339-financas','2022-11-23 10:18:34','a02d7d2d5015bbfcd274627e3abd79f4'),(1027,2,'20220928.001037.359-financas','2022-11-23 10:18:34','0f497c04353eccc387f9e81e3779db12'),(1028,2,'20220928.001040.393-financas','2022-11-23 10:18:34','f5d003ec7cfc52e3f05c188ef7a39c35'),(1029,2,'20220928.001043.426-financas','2022-11-23 10:18:34','95b462b051fc211cfd6471d5591551b0'),(1030,2,'20220928.001046.452-financas','2022-11-23 10:18:34','1677ca1f7e93d5dbc142446e12c6b8f8'),(1031,2,'20220928.001049.483-financas','2022-11-23 10:18:34','db4c90cfbe39cd05f84a36f4a9bca3ef'),(1032,2,'20220928.001052.524-financas','2022-11-23 10:18:34','4ce7614f3d7e9d792e7645055a2db1a4'),(1033,2,'20220928.001055.558-financas','2022-11-23 10:18:34','d31766bb050da7a612fa293349ae40e9'),(1034,2,'20220928.001058.601-financas','2022-11-23 10:18:34','a861b4a06e914d7eb6ef0a69460b75f2'),(1035,2,'20220928.001101.633-financas','2022-11-23 10:18:34','67f34e247b88ae73b46c44e3cf4c13e6'),(1036,2,'20220928.001104.657-financas','2022-11-23 10:18:34','bf7b81cfa2ccfb3e599757dd0b1ad989'),(1037,2,'20220928.001107.695-financas','2022-11-23 10:18:34','5f1f11699da290f4d6115d1e845d6b90'),(1038,2,'20220928.001110.735-financas','2022-11-23 10:18:34','57190fbee76fb10b9fbdb4e7371f3ccc'),(1039,2,'20220928.001113.775-financas','2022-11-23 10:18:34','5ddb28c6dcf8e2ab8e21889afa25cf6e'),(1040,2,'20220928.001116.803-financas','2022-11-23 10:18:34','73e02bbb55b70741230304058ee8719e'),(1041,2,'20220928.001119.834-financas','2022-11-23 10:18:34','cdba2bfb3748c20e010553bba67a128c'),(1042,2,'20220928.001122.856-financas','2022-11-23 10:18:34','dd729ebab91f3149a64112c2118e077e'),(1043,2,'20220928.001125.889-financas','2022-11-23 10:18:34','3402bf08e69aefb76132d92b9b136e7f'),(1044,2,'20220928.001128.921-financas','2022-11-23 10:18:34','da84798b1847067a2bd1104b29847093'),(1045,2,'20220928.001131.962-financas','2022-11-23 10:18:34','2a39a781fe503cb5863e1dc24b68c342'),(1046,2,'20220928.001134.990-financas','2022-11-23 10:18:34','28fe89bca925629fb3b985a8b96093f4'),(1047,2,'20220928.001138.026-financas','2022-11-23 10:18:34','336ff4f253aa302271fdc2302478eb61'),(1048,2,'20220928.001141.052-financas','2022-11-23 10:18:34','9efb7ff62f26c6cc89e04332de685415'),(1049,2,'20220928.001144.081-financas','2022-11-23 10:18:34','0dd0eb741df6fbfc2f631210a453af16'),(1050,2,'20220928.001147.123-financas','2022-11-23 10:18:34','9669bdf2346b4fb67d848b8c1915ef59'),(1051,2,'20220928.001150.151-financas','2022-11-23 10:18:34','f80acfdbe92d747b68a3e6d62b891287'),(1052,2,'20220928.001153.173-financas','2022-11-23 10:18:34','a63243653fd39302873a150e2680b1c3'),(1053,2,'20220928.001156.206-financas','2022-11-23 10:18:34','e96751d12b2448beae0c6679d5f38b31'),(1054,2,'20220928.001159.245-financas','2022-11-23 10:18:34','51b096a9e21ac8da9317bab545987f50'),(1055,2,'20220928.001202.273-financas','2022-11-23 10:18:34','78ab103056f662d0b868db4bb7ab2511'),(1056,2,'20220928.001205.305-financas','2022-11-23 10:18:34','eba031116b30edb2332000ada7aaf79b'),(1057,2,'20220928.001208.339-financas','2022-11-23 10:18:34','3a99bbe24099cd69c351e73219041b64'),(1058,2,'20220928.001211.375-financas','2022-11-23 10:18:34','95fc2e975cb637ef69be2e8253535e7e'),(1059,2,'20220928.001214.407-financas','2022-11-23 10:18:34','ede2ed49720aa186c38793d7d60b8931'),(1060,2,'20220928.001217.433-financas','2022-11-23 10:18:34','fbbe031199c128ed51662aec5a26652a'),(1061,2,'20220928.001220.463-financas','2022-11-23 10:18:34','d76db9c10223ff82605dfd8a43b28747'),(1062,2,'20220928.001223.491-financas','2022-11-23 10:18:34','fd96fb5cacf44fdcafcc93e8017a9f6d'),(1063,2,'20220928.001226.518-financas','2022-11-23 10:18:34','10e0dc505d85bc838a29acce0e81a703'),(1064,2,'20220928.001229.546-financas','2022-11-23 10:18:34','d7b22e4e48be4969e3bd95660846d07a'),(1065,2,'20220928.001232.578-financas','2022-11-23 10:18:34','0daca06af07e7de790dd47fbcc32c3a7'),(1066,2,'20220928.001235.619-financas','2022-11-23 10:18:34','afd0e898d7f4cd4fb3c335eaff8cf6b3'),(1067,2,'20220928.001238.658-financas','2022-11-23 10:18:34','a2d2a993b0ef2b30773e3caa6795f44f'),(1068,2,'20220928.001241.691-financas','2022-11-23 10:18:34','97bdf4c91eaf15870912db62a754180b'),(1069,2,'20220928.001244.721-financas','2022-11-23 10:18:34','e80c6c34bad5e169f3ff8aaa16fb2baa'),(1070,2,'20220928.001247.753-financas','2022-11-23 10:18:34','7ec4690a0a84dfc6c1e735ebf50ff13e'),(1071,2,'20220928.001250.785-financas','2022-11-23 10:18:34','86c6c137e78e1a76f06bb59678606ebd'),(1072,2,'20220928.001253.812-financas','2022-11-23 10:18:34','94761d8f54b72fcac17ad26bc18d4f9d'),(1073,2,'20220928.001256.838-financas','2022-11-23 10:18:34','a880479cf451149883132c5faadfddf8'),(1074,2,'20220928.001259.867-financas','2022-11-23 10:18:34','6fb005dfd4c3983a2253f39573b70209'),(1075,2,'20220928.001302.909-financas','2022-11-23 10:18:34','477982f25b1a391c0ba8a2cb9770f264'),(1076,2,'20220928.001305.942-financas','2022-11-23 10:18:34','6fa4b9395e42228d3492e94a9e9b711b'),(1077,2,'20220928.001308.980-financas','2022-11-23 10:18:34','fb29fd7e5db42defea290571e91d7559'),(1078,2,'20220928.001312.010-financas','2022-11-23 10:18:34','06984113d536e06d4c1b5d5579b07047'),(1079,2,'20220928.001315.039-financas','2022-11-23 10:18:34','cf9d035ef6652550fd355c8debf9307e'),(1080,2,'20220928.001318.070-financas','2022-11-23 10:18:34','9e17f86cdc41a237b5953ed1e6f1ae80'),(1081,2,'20220928.001321.102-financas','2022-11-23 10:18:34','fb6622879ae87a7b495a40a59a58c35c'),(1082,2,'20220928.001324.136-financas','2022-11-23 10:18:34','bc001a27351e9527c80286523b7ff61d'),(1083,2,'20220928.001327.166-financas','2022-11-23 10:18:34','57c4dc3151c851e9dc64301033b0e276'),(1084,2,'20220928.001330.196-financas','2022-11-23 10:18:34','44ea2004b3d190995f24ac100a84fbb2'),(1085,2,'20220928.001333.225-financas','2022-11-23 10:18:34','2efe824ebeb4dbbd7ba4a0ee03f6387b'),(1086,2,'20220928.001336.250-financas','2022-11-23 10:18:34','49348cd4d79aff44eb05b408d17a97eb'),(1087,2,'20220928.001339.281-financas','2022-11-23 10:18:34','0ce4eb56dd7111e8a4a267a8b46bd32c'),(1088,2,'20220928.001342.306-financas','2022-11-23 10:18:34','f2267dc2c087bde78c2f938d3204d2ab'),(1089,2,'20220928.001345.336-financas','2022-11-23 10:18:34','5ee7dc3584f0fbf4788db4b71ac25cdd'),(1090,2,'20220928.001348.365-financas','2022-11-23 10:18:34','690a0b32e1ffcc7cd5d51cd79132ab24'),(1091,2,'20220928.001351.392-financas','2022-11-23 10:18:34','330fe419b27f1496cdaab8edfef59586'),(1092,2,'20220928.001354.423-financas','2022-11-23 10:18:34','d1716b16bb737856d2d91b1fd35c0a48'),(1093,2,'20220928.001357.454-financas','2022-11-23 10:18:34','368506e0e0edf68a266937026aeac7b3'),(1094,2,'20220928.001400.490-financas','2022-11-23 10:18:34','5a7243d32cf10910db4d7c7d1ca21341'),(1095,2,'20220928.001403.510-financas','2022-11-23 10:18:34','c07ff4a8d3b5778a923bc34e192bf22a'),(1096,2,'20220928.001406.543-financas','2022-11-23 10:18:34','42658af48fe033f67d2e60202c7db6ba'),(1097,2,'20220928.001409.571-financas','2022-11-23 10:18:34','438f6fee79a0c26bba4800f82616bf43'),(1098,2,'20220928.001412.597-financas','2022-11-23 10:18:34','f73ba9b8391116a74e1e0e0b0de7fb00'),(1099,2,'20221010.125555.282-financas','2022-11-23 10:18:34','547f82f8247a1b53677bf46a316d0628'),(1100,2,'20221109.220608.516-financas','2022-11-23 10:18:34','859b233f57e0da471aac5d7bd56cab10'),(1101,2,'20221109.220611.556-financas','2022-11-23 10:18:34','a1a2d52dbcc7a1d39324db230efe65fd'),(1102,2,'20221109.220614.587-financas','2022-11-23 10:18:34','c3e8031dd30d9a2686da97666f3715a3'),(1103,2,'20221109.220617.620-financas','2022-11-23 10:18:34','b1b8432df245d48aace473a9c34c02b3'),(1104,2,'20221109.220620.652-financas','2022-11-23 10:18:34','a4621f12bb6a8608c6f4644d5dc16651'),(1105,2,'20221109.220623.682-financas','2022-11-23 10:18:34','f792a9cd13d18358d4e686bb7cc80740'),(1106,2,'20221109.220626.717-financas','2022-11-23 10:18:34','a28ef4c8937b863b694d250aa2a07749'),(1107,2,'20221109.220629.751-financas','2022-11-23 10:18:34','34ea451a1978093ae42c50b153a24283'),(1108,2,'20221109.220632.783-financas','2022-11-23 10:18:34','60f1d8ee7b64122aa2d9f53875cb8e97'),(1109,2,'20221109.220635.812-financas','2022-11-23 10:18:34','a0b7123932d77e485b294320167620f3'),(1110,2,'20221109.220638.847-financas','2022-11-23 10:18:34','8def50b16f81865c1d7c23c356e69f43'),(1111,2,'20221109.220641.879-financas','2022-11-23 10:18:34','357813b430ce7eb6321ae3ce95514274'),(1112,2,'20221109.220644.908-financas','2022-11-23 10:18:34','f148c75ced5a6ffe4b8646350d02ded2'),(1113,2,'20221109.220647.939-financas','2022-11-23 10:18:34','9f088ce6c288f1a00c087d6d6241c42a'),(1114,2,'20221111.190830.275-financas','2022-11-23 10:18:34','aafb11c435160ec9e27569d4d935381c'),(1115,2,'20221111.191354.353-financas','2022-11-23 10:18:34','6b3bdd0d196ccb5f9f85777a3a57a1f6'),(1116,2,'20221117.190045.919-financas','2022-11-23 10:18:34','99f20611d22ec539aad781be4e26d525'),(1117,2,'20221117.190048.951-financas','2022-11-23 10:18:34','6468027ec2450cf968b6916e4901b255'),(1118,2,'20221117.190051.979-financas','2022-11-23 10:18:34','514c2b4719361be1823e8aa009bf9b96'),(1119,2,'20221117.190055.001-financas','2022-11-23 10:18:34','51ddbecebacbcfa76d9034710917ffa0'),(1120,2,'20221122.233150.252-financas','2022-11-23 10:18:34','156a4aa6aa02189845bf19916cc68c0c'),(1121,2,'20221122.233153.288-financas','2022-11-23 10:18:34','782d680f7159c51b1d04da6416f6c033'),(1122,2,'20221122.233156.331-financas','2022-11-23 10:18:34','2278100cf8192a1194132478151ca158'),(1123,1,'1.0.21.110','2022-11-25 11:45:30','730abd4007ed8d29ead025450a8dfa32');
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
