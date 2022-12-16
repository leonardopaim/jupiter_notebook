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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,3,2,'2022-11-23 10:22:18',1,'2022-11-24 10:22:18',1,2,10.00,15.00);
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
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `uk_categoria_1` (`codigo_interno`),
  KEY `k_categoria_1` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (90,1,'1','RECEITAS',NULL,'','S',1),(91,2,'1.1','RECEITAS OPERACIONAIS',NULL,'','S',2),(92,3,'1.1.01','RECEITAS COM VENDAS',NULL,'','S',3),(93,4,'1.1.01.001','Vendas de produtos a vista',1,'C','A',4),(94,5,'1.1.01.002','Vendas de produtos a prazo',2,'C','A',4),(95,6,'1.1.01.003','Vendas de serviços a vista',3,'C','A',4),(96,7,'1.1.01.004','Vendas de serviços a prazo',4,'C','A',4),(97,8,'1.1.01.005','Recebimentos de vendas de produtos',5,'C','A',4),(98,9,'1.1.01.006','Recebimentos de vendas de serviços ',6,'C','A',4),(99,10,'1.1.01.007','(-) Devoluções de vendas de produtos a vista',7,'D','A',4),(100,11,'1.1.01.008','(-) Devoluções de vendas de produtos a prazo',8,'D','A',4),(101,12,'1.1.01.009','(-) Devoluções de vendas de serviços a vista',9,'D','A',4),(102,13,'1.1.01.010','(-) Devoluções de vendas de serviços a prazo',10,'D','A',4),(103,14,'1.1.02','RECEITAS COM RECORRÊNCIAS',NULL,'','S',3),(104,15,'1.1.02.001','Recorrência de serviços',11,'C','A',4),(105,16,'1.1.02.002','Recebimento de recorrência de serviços',12,'C','A',4),(106,17,'1.2','RECEITAS NÃO OPERACIONAIS',NULL,'','S',2),(107,18,'1.2.01','RECEITAS COM INTEGRALIZAÇÃO DE CAPITAL',NULL,'','S',3),(108,19,'1.2.02','RECEITAS COM VENDAS DE IMOBILIZADOS',NULL,'','S',3),(109,20,'1.2.02.001','Venda de veículos',14,'C','A',4),(110,21,'1.2.02.002','Venda de máquinas',14,'C','A',4),(111,22,'1.2.02.003','Venda de equipamentos',14,'C','A',4),(112,23,'1.2.02.004','Venda de móveis',14,'C','A',4),(113,24,'1.2.02.005','Venda de imóveis',14,'C','A',4),(114,25,'1.2.03','RECEITAS COM INVESTIMENTOS',NULL,'','S',3),(115,26,'1.2.04','RECEITAS COM REEMBOLSOS',NULL,'','S',3),(116,27,'1.2.05','OUTRAS RECEITAS',NULL,'','S',3),(117,28,'2','CUSTOS',NULL,'','S',1),(118,29,'2.1.01','CUSTOS COM FORNECEDORES',NULL,'','S',3),(119,30,'2.1.01.001','Compras de produtos a vista',18,'D','A',4),(120,31,'2.1.01.002','Compras de produtos a prazo',19,'D','A',4),(121,32,'2.1.01.003','Pagamentos de compras de produtos',20,'D','A',4),(122,33,'2.1.01.004','(-) Devoluções de compras de produtos a vista',21,'C','A',4),(123,34,'2.1.01.005','(-) Devoluções de compras de produtos a prazo',22,'C','A',4),(124,35,'3','DESPESAS',NULL,'','S',1),(125,36,'3.1.01','DESPESAS ADMINISTRATIVAS',NULL,'','S',3),(126,37,'3.1.01.001','Água e esgoto',23,'D','A',4),(127,38,'3.1.01.002','Aluguel de imóvel',23,'D','A',4),(128,39,'3.1.01.003','Assistência técnica',23,'D','A',4),(129,40,'3.1.01.004','Associações de classe',23,'D','A',4),(130,41,'3.1.01.005','Cartório',23,'D','A',4),(131,42,'3.1.01.006','Condomínio',23,'D','A',4),(132,43,'3.1.01.007','Confraternizações ',23,'D','A',4),(133,44,'3.1.01.008','Consultoria administrativa',23,'D','A',4),(134,45,'3.1.01.009','Contabilidade ',23,'D','A',4),(135,46,'3.1.01.010','Correios',23,'D','A',4),(136,47,'3.1.01.011','Despesas com viagens',23,'D','A',4),(137,48,'3.1.01.012','Doações',23,'D','A',4),(138,49,'3.1.01.013','Documentação de veiculos',23,'D','A',4),(139,50,'3.1.01.014','Domínios da internet',23,'D','A',4),(140,51,'3.1.01.015','Energia elétrica',23,'D','A',4),(141,52,'3.1.01.016','Fretes e carretos',23,'D','A',4),(142,53,'3.1.01.017','Licença para uso de software',23,'D','A',4),(143,54,'3.1.01.018','Manutenção de veículos',23,'D','A',4),(144,55,'3.1.01.019','Manutenção predial',23,'D','A',4),(145,56,'3.1.01.020','Materiais para consumo',23,'D','A',4),(146,57,'3.1.01.021','Materiais de escritório',23,'D','A',4),(147,58,'3.1.01.022','Materiais de limpeza',23,'D','A',4),(148,59,'3.1.01.023','Multas de trânsito',23,'D','A',4),(149,60,'3.1.01.024','Provedor de internet',23,'D','A',4),(150,61,'3.1.01.025','Seguros de veiculos ',23,'D','A',4),(151,62,'3.1.01.026','Seguros diversos ',23,'D','A',4),(152,63,'3.1.01.027','Supermercado',23,'D','A',4),(153,64,'3.1.01.028','Telefonia',23,'D','A',4),(154,65,'3.1.02','DESPESAS COMERCIAIS',NULL,'','S',3),(155,66,'3.1.02.001','Brindes ',24,'D','A',4),(156,67,'3.1.02.002','Comissões',24,'D','A',4),(157,68,'3.1.02.003','Feiras ',24,'D','A',4),(158,69,'3.1.02.004','Premiações',24,'D','A',4),(159,70,'3.1.03','DESPESAS FINANCEIRAS',NULL,'','S',3),(160,71,'3.1.03.001','Impostos financeiros ',25,'D','A',4),(161,72,'3.1.03.002','Pagamento de juros',25,'D','A',4),(162,73,'3.1.03.003','Tarifas bancárias',25,'D','A',4),(163,74,'3.1.03.004','Tarifas de cobrança',25,'D','A',4),(164,75,'3.1.04','DESPESAS TRIBUTÁRIAS',NULL,'','S',3),(165,76,'3.1.04.001','Impostos municipais',26,'D','A',4),(166,77,'3.1.04.002','Impostos estaduais',26,'D','A',4),(167,78,'3.1.04.003','Impostos federais',26,'D','A',4),(168,79,'3.1.05','DESPESAS COM MARKETING',NULL,'','S',3),(169,80,'3.1.05.001','Agência de marketing ',27,'D','A',4),(170,81,'3.1.05.002','Carro de som',27,'D','A',4),(171,82,'3.1.05.003','Impulsionamento ',27,'D','A',4),(172,83,'3.1.05.004','Jornais',27,'D','A',4),(173,84,'3.1.05.005','Materiais gráfico',27,'D','A',4),(174,85,'3.1.05.006','Patrocínios',27,'D','A',4),(175,86,'3.1.05.007','Rádio ',27,'D','A',4),(176,87,'3.1.05.008','Serviços diversos de marketing ',27,'D','A',4),(177,88,'3.1.06','DESPESAS COM COLABORADORES',NULL,'','S',3),(178,89,'3.1.06.001','13º salário',28,'D','A',4),(179,90,'3.1.06.002','Adiantamento de salário',28,'D','A',4),(180,91,'3.1.06.003','Adiantamento do 13º salário',28,'D','A',4),(181,92,'3.1.06.004','Adicional noturno, insalubridade e periculosidade',28,'D','A',4),(182,93,'3.1.06.005','Comissão',28,'D','A',4),(183,94,'3.1.06.006','Contribuição sindical',28,'D','A',4),(184,95,'3.1.06.007','Descanso semanal remunerado',28,'D','A',4),(185,96,'3.1.06.008','Férias',28,'D','A',4),(186,97,'3.1.06.009','FGTS',28,'D','A',4),(187,98,'3.1.06.010','Horas extras',28,'D','A',4),(188,99,'3.1.06.011','INSS',28,'D','A',4),(189,100,'3.1.06.012','IRRF',28,'D','A',4),(190,101,'3.1.06.013','Plano de saúde',28,'D','A',4),(191,102,'3.1.06.014','Salário',28,'D','A',4),(192,103,'3.1.06.015','Salário família',28,'D','A',4),(193,104,'3.1.06.016','Seguro',28,'D','A',4),(194,105,'3.1.06.017','Vale alimentação',28,'D','A',4),(195,106,'3.1.06.018','Vale transporte',28,'D','A',4),(196,107,'3.1.06.019','(-) Desconto de contribuição sindical',29,'C','A',4),(197,108,'3.1.06.020','(-) Desconto de faltas',29,'C','A',4),(198,109,'3.1.06.021','(-) Desconto de INSS',29,'C','A',4),(199,110,'3.1.06.022','(-) Desconto de IRRF',29,'C','A',4),(200,111,'3.1.06.023','(-) Desconto de plano de saúde',29,'C','A',4),(201,112,'3.1.06.024','(-) Desconto de vale alimentação',29,'C','A',4),(202,113,'3.1.06.025','(-) Desconto de vale transporte',29,'C','A',4),(203,114,'3.1.07','DESPESAS COM SÓCIOS',NULL,'','S',3),(204,115,'3.1.08','OUTRAS DESPESAS',NULL,'','S',3),(205,116,'4','INVESTIMENTOS',NULL,'','S',1),(206,117,'4.1.01','INVESTIMENTOS RENTÁVEIS',NULL,'','S',3),(207,118,'4.1.01.001','Títulos',32,'D','A',4),(208,119,'4.1.01.002','Ações',32,'D','A',4),(209,120,'4.1.02','INVESTIMENTOS EM IMOBILIZADO',NULL,'','S',3),(210,121,'4.1.02.001','Compra de veículos',33,'D','A',4),(211,122,'4.1.02.002','Compra de máquinas',33,'D','A',4),(212,123,'4.1.02.003','Compra de equipamentos',33,'D','A',4),(213,124,'4.1.02.004','Compra de móveis',33,'D','A',4),(214,125,'4.1.02.005','Compra de imóveis',33,'D','A',4),(215,126,'4.1.03','INVESTIMENTOS EM INTANGÍVEIS',NULL,'','S',3),(216,127,'4.1.03.001','Registro de marcas e patentes',34,'D','A',4),(217,128,'4.1.03.002','Pesquisa e desenvolvimento',34,'D','A',4),(218,129,'5','EMPRÉSTIMOS',NULL,'','S',1),(219,130,'5.1.01','TOMADAS DE EMPRÉSTIMOS',NULL,'','S',3),(220,131,'5.1.02','PAGAMENTOS DE EMPRESTIMOS',NULL,'','S',3),(221,132,'5.1.03','PAGAMENTOS DE JUROS DE EMPRESTIMOS',NULL,'','S',3),(222,133,'6','TERCEIROS',NULL,'','S',1),(223,134,'6.1.01','CRÉDITOS DE TERCEIROS',NULL,'','S',3),(224,135,'6.1.02','DÉBITOS DE TERCEIROS',NULL,'','S',3),(225,NULL,'6.1.01.001','Contas a receber',38,'C','A',4),(226,NULL,'2.1.01.006','Devolução de compra à prazo',22,'C','A',4),(227,NULL,'1.1.01.011','(Teste Movimento) - Vendas a Vista',1,'C','A',4),(228,NULL,'1.1.01.012','(Teste Movimento) - Vendas a Prazo',2,'C','A',4),(229,NULL,'1.1.01.013','(Teste Movimento) - Recebimento de vendas a prazo',5,'C','A',4),(230,NULL,'5.1.01.001','(Teste Empréstimo) - Tomada empréstimo',35,'C','A',4),(231,NULL,'5.1.02.001','(Teste Empréstimo) - Pagamento empréstimo',36,'D','A',4),(232,NULL,'5.1.03.001','(Teste Empréstimo) - Pagamento juros empréstimo',37,'D','A',4);
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
INSERT INTO `cliente_contrato` VALUES (1,3,2,NULL,4,NULL,1,119,NULL,'2021-11-23','2024-11-23','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,3,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0);
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
INSERT INTO `cliente_credito` VALUES (1,4,3,NULL,1,NULL,NULL,NULL,'2022-11-23 10:21:34',10.50,'C');
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
INSERT INTO `compra` VALUES (1,3,105522,6,3,9,NULL,'2022-11-23',1,0,300.00,300.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,3,NULL),(2,3,129589,6,3,9,NULL,'2022-11-23',2,2,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,4,NULL),(3,3,19985761,6,3,9,NULL,'2022-11-23',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,5,NULL),(4,3,19985762,6,3,9,NULL,'2022-11-23',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,6,NULL),(5,3,19985763,6,3,9,NULL,'2022-11-23',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,7,NULL),(6,3,19985764,6,3,9,NULL,'2022-11-23',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,8,NULL),(7,3,129581,6,3,9,NULL,'2022-11-23',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,9,NULL),(8,3,129582,6,3,9,NULL,'2022-11-23',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,10,NULL),(9,3,129583,6,3,9,NULL,'2022-11-23',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,1,11,NULL),(10,3,129584,6,3,9,NULL,'2022-11-23',2,2,700.00,700.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,12,NULL),(11,3,129585,6,3,9,NULL,'2022-11-23',1,0,70.00,70.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(12,3,129586,6,3,9,NULL,'2022-11-23',1,0,80.00,80.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(13,3,129587,6,3,9,NULL,'2022-11-23',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(14,3,13250,6,3,9,NULL,'2022-11-23',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,1),(15,3,19985763,6,3,9,NULL,'2022-11-23',1,0,1000.00,1008.00,0.00,0.00,0.00,0.00,8.00,1,'',0,0,19,NULL);
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
INSERT INTO `compra_pendente` VALUES (2,3,6,'31190249051659000166550000001391461077451590',7745159,3,9,NULL,'2022-11-23','2022-11-23',1,'55',1,0,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'',''),(16,3,6,'31160704731855000143550010007485481189117075',105522,3,9,NULL,'2022-11-23','2022-11-23',1,'55',1,0,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'','');
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
INSERT INTO `conta` VALUES (1,3,1,0,'Caixa interno',1,-340.00,0.00,'2022-11-22','','','',NULL,1,0),(2,3,NULL,0,'Caixa',1,203337.62,0.00,'2022-11-22','','','',NULL,1,0),(6,3,NULL,0,'Pdv Teste',1,0.00,0.00,'2022-11-23','','','',NULL,0,0),(7,3,NULL,0,'Pdv Teste',1,5.00,0.00,'2022-11-23','','','',NULL,1,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (4,3,'202101',6.30,2),(4,3,'202211',-74.00,1),(4,3,'202211',203333.52,2),(6,3,'202101',6.30,2),(6,3,'202211',135.44,2),(7,3,'202211',170.50,2),(9,3,'202101',-10.00,2),(9,3,'202211',1390.00,1),(9,3,'202211',-709.50,2),(18,3,'202211',1300.00,1),(18,3,'202211',-700.00,2),(19,3,'202211',21.00,1),(19,3,'202211',-21.00,2),(20,3,'202211',89.00,1),(20,3,'202211',-89.00,2),(21,3,'202211',5.00,1),(21,3,'202211',5.00,2),(29,3,'202101',12.60,2),(29,3,'202211',126.00,1),(29,3,'202211',202948.96,2),(30,3,'202211',170.50,2),(34,3,'202101',6.30,1),(34,3,'202101',12.60,2),(34,3,'202211',203160.02,1),(34,3,'202211',203295.46,2),(38,3,'202211',-10.50,1),(38,3,'202211',-10.50,2),(49,3,'202211',74.00,1),(49,3,'202211',326.00,2),(51,3,'202211',170.50,2),(56,3,'202101',10.00,2),(56,3,'202211',290.00,1),(56,3,'202211',209.50,2),(63,3,'202211',10.00,2),(65,3,'202211',-11.00,1),(65,3,'202211',11.00,2),(72,3,'202211',74.00,1),(72,3,'202211',326.00,2),(78,3,'202101',6.30,1),(78,3,'202101',12.60,2),(78,3,'202211',203385.52,1),(78,3,'202211',203119.46,2);
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
INSERT INTO `conta_saldo` VALUES (1,'2022-11-23',-340.00),(2,'2021-01-01',12.60),(2,'2022-11-22',12.60),(2,'2022-11-23',203337.62);
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
INSERT INTO `cte` VALUES (1,3,15,1353,2,1,'2022-11-23 10:22:16','2022-11-23 10:22:16',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31221121148618000173570010000000151000000156','','','','','','',NULL,0,0,0),(2,3,15,1353,2,1,'2022-11-22 10:22:16','2022-11-23 10:22:16',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31221121148618000173570010000000151000000156','','','','','','',NULL,0,0,0);
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
INSERT INTO `devolucao_compra` VALUES (1,3,9,'2022-11-23 10:21:35',4,3,NULL,500.00,500.00,0.00,0.00,0.00,0.00,0.00,0,1,NULL,NULL,2);
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
INSERT INTO `devolucao_venda` VALUES (1,3,11,'2022-11-23 10:21:34',11,NULL,10.50,10.50,0.00,0.00,0.00,0.00,1,1,NULL,2);
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
INSERT INTO `empresa` VALUES (3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2022-11-23','Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',0,1,0);
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
INSERT INTO `emprestimo` VALUES (1,2,3,'2022-11-23 10:22:31',100.00,5.00,11.00,110.00,5,5,'2022-11-24 10:22:31',1);
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
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2022-11-23 10:19:26');
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
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2022-11-23 10:19:45'),(2,2,'Cheque',1,2,2,1,0,1,'2022-11-23 10:19:45'),(3,3,'Cartão',1,3,3,0,0,0,'2022-11-23 10:19:45'),(4,4,'Crédiário',2,4,99,0,0,0,'2022-11-23 10:19:45'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2022-11-23 10:19:45'),(6,6,'PIX',1,6,17,0,0,1,'2022-11-23 10:19:45'),(7,NULL,'Dinheiro',1,1,0,0,0,1,'2022-11-23 10:19:33'),(8,NULL,'Outros',9,99,0,0,0,0,'2022-11-23 10:19:45'),(9,NULL,'Cheque',9,2,0,0,0,1,'2022-11-23 10:19:33'),(10,NULL,'Cartão',9,3,0,0,0,1,'2022-11-23 10:19:33'),(11,NULL,'Crediário',2,4,0,0,0,1,'2022-11-23 10:19:33'),(12,NULL,'PIX',1,6,0,0,0,1,'2022-11-23 10:19:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2022-11-23 10:19:58','2022-11-23 10:19:57',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',0,1),(2,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2022-11-23 10:19:58','2022-11-23 10:19:57',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',0,0),(3,3,1,NULL,'Conclusão da compra 19985763 do fornecedor Femsa LTDA','2022-11-23 10:19:59','2022-11-23 10:19:59',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(4,3,1,NULL,'Conclusão da compra 19985764 do fornecedor Femsa LTDA','2022-11-23 10:20:00','2022-11-23 10:19:59',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,1),(5,3,1,NULL,'Conclusão da compra 129583 do fornecedor Femsa LTDA','2022-11-23 10:20:01','2022-11-23 10:20:01',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',0,0),(6,3,1,NULL,'Conclusão da compra 129584 do fornecedor Femsa LTDA','2022-11-23 10:20:02','2022-11-23 10:20:01',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',0,0),(7,3,1,NULL,'Conclusão da compra 129585 do fornecedor Femsa LTDA','2022-11-23 10:20:02','2022-11-23 10:20:02',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,'D',0,1),(8,3,1,NULL,'Conclusão da compra 129586 do fornecedor Femsa LTDA','2022-11-23 10:20:03','2022-11-23 10:20:02',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',0,1),(9,3,1,NULL,'Conclusão da compra 129587 do fornecedor Femsa LTDA','2022-11-23 10:20:03','2022-11-23 10:20:02',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,1),(10,3,1,NULL,'Conclusão da compra 13250 do fornecedor Femsa LTDA','2022-11-23 10:20:03','2022-11-23 10:20:03',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',0,0),(11,3,1,NULL,'Pagamento: 10 - Femsa LTDA','2022-11-23 10:20:03','2022-11-23 10:20:03',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',0,0),(12,3,2,NULL,'Conclusão da venda 11 para consumidor final','2022-11-23 10:21:10','2022-11-23 10:21:10',NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105.00,'C',0,0),(13,3,2,NULL,'Conclusão da venda 12  para o cliente Jeff Bezos','2022-11-23 10:21:10','2022-11-23 10:21:10',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200000.01,'C',0,0),(14,3,2,NULL,'Conclusão da venda 13 para consumidor final','2022-11-23 10:21:10','2022-11-23 10:21:10',NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',0,0),(15,3,2,NULL,'Conclusão da venda 14 para consumidor final','2022-11-23 10:21:11','2022-11-23 10:21:11',NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.01,'C',0,0),(16,3,2,NULL,'Conclusão da venda 16  para o cliente Jeff Bezos','2022-11-23 10:21:19','2022-11-23 10:21:19',NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135.44,'C',0,0),(17,3,2,NULL,'Conclusão da venda 17 para consumidor final','2022-11-23 10:21:19','2022-11-23 10:21:19',NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',0,0),(18,3,2,NULL,'Conclusão da venda 18 para consumidor final','2022-11-23 10:21:19','2022-11-23 10:21:19',NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',0,0),(19,3,2,NULL,'Devolução da venda 11 para consumidor final','2022-11-23 10:21:34','2022-11-23 10:21:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,10.50,'D',0,0),(20,3,1,NULL,'Devolução da compra 129583 do fornecedor ','2022-11-23 10:21:35','2022-11-23 10:21:35',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'C',0,0),(21,3,1,NULL,'Documento à pagar: 0000000007','2022-11-23 10:21:35','2022-11-23 10:21:35',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,5.00,'D',0,0),(22,3,1,NULL,'Documento à pagar: 0000000007','2022-11-23 10:21:35','2022-11-23 10:21:35',NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,5.00,'D',0,0),(23,3,1,NULL,'Documento à receber: Teste api','2022-11-23 10:21:51','2022-11-23 10:21:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,170.50,'C',0,0),(24,3,7,1,'Sangria','2022-11-23 10:21:18','2022-11-23 10:21:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.00,'D',0,0),(25,3,7,1,'Suprimento','2022-11-23 10:21:18','2022-11-23 10:21:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8.00,'C',0,0),(26,3,2,NULL,'Conclusão da venda 19 para consumidor final','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',0,0),(27,3,2,NULL,'Conclusão da venda 20  para o cliente Jeff Bezos','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',0,0),(28,3,2,NULL,'Despesas do empréstimo: 1','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,5.00,'D',0,1),(29,3,2,NULL,'Tomada do empréstimo: 1','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,100.00,'C',0,1),(30,3,2,NULL,'Documento à pagar: 0000000009','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,11.00,'D',0,1),(31,3,2,NULL,'Documento à pagar: 0000000010','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,22.00,'D',0,1),(32,3,2,NULL,'Documento à pagar: 0000000011','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,22.00,'D',0,1),(33,3,2,NULL,'Documento à pagar: 0000000012','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,22.00,'D',0,1),(34,3,2,NULL,'Documento à pagar: 0000000013','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,22.00,'D',0,1),(35,3,2,NULL,'Documento à pagar: 0000000014','2022-11-23 10:22:31','2022-11-23 10:22:31',NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,22.00,'D',0,1);
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
INSERT INTO `movimento_categoria` VALUES (1,119,NULL,'',300.00),(2,120,NULL,'',100.00),(3,119,NULL,'',500.00),(4,119,NULL,'',500.00),(5,120,NULL,'',500.00),(6,120,NULL,'',700.00),(7,119,NULL,'',70.00),(8,119,NULL,'',80.00),(9,119,NULL,'',90.00),(10,119,NULL,'',90.00),(11,121,NULL,'',200.00),(12,93,NULL,'',105.00),(13,93,NULL,'',200000.01),(14,93,NULL,'',30.00),(15,93,NULL,'',3000.01),(16,94,NULL,'',135.44),(17,93,NULL,'',10.00),(18,93,NULL,'',15.00),(19,99,NULL,'',10.50),(20,123,NULL,'',500.00),(21,141,NULL,'',5.00),(22,141,NULL,'',5.00),(23,225,NULL,'',170.50),(26,93,NULL,'',6.30),(27,94,NULL,'',6.30),(28,161,NULL,'',5.00),(29,230,NULL,'',100.00),(30,232,NULL,'',11.00),(31,231,NULL,'',22.00),(32,231,NULL,'',22.00),(33,231,NULL,'',22.00),(34,231,NULL,'',22.00),(35,231,NULL,'',22.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,119,4,300.00,2,2),(1,119,9,300.00,1,2),(1,119,56,300.00,1,1),(1,119,78,300.00,2,1),(2,120,9,100.00,1,2),(2,120,18,100.00,1,2),(3,119,4,500.00,2,2),(3,119,9,500.00,1,2),(3,119,56,500.00,1,1),(3,119,78,500.00,2,1),(4,119,4,500.00,2,2),(4,119,9,500.00,1,2),(4,119,56,500.00,1,1),(4,119,78,500.00,2,1),(5,120,9,500.00,1,2),(5,120,18,500.00,1,2),(6,120,9,700.00,1,2),(6,120,18,700.00,1,2),(7,119,4,70.00,2,2),(7,119,9,70.00,1,2),(7,119,56,70.00,1,1),(7,119,78,70.00,2,1),(8,119,4,80.00,2,2),(8,119,9,80.00,1,2),(8,119,56,80.00,1,1),(8,119,78,80.00,2,1),(9,119,4,90.00,2,2),(9,119,9,90.00,1,2),(9,119,56,90.00,1,1),(9,119,78,90.00,2,1),(10,119,4,90.00,2,2),(10,119,9,90.00,1,2),(10,119,56,90.00,1,1),(10,119,78,90.00,2,1),(11,121,4,200.00,1,2),(11,121,18,200.00,2,2),(11,121,29,200.00,2,2),(11,121,49,200.00,1,1),(11,121,49,200.00,1,2),(11,121,56,200.00,1,1),(11,121,72,200.00,1,1),(11,121,72,200.00,1,2),(11,121,78,200.00,1,1),(11,121,78,200.00,2,2),(12,93,4,105.00,1,2),(12,93,9,20.00,2,2),(12,93,29,105.00,1,2),(12,93,34,105.00,1,1),(12,93,34,105.00,1,2),(12,93,56,20.00,1,2),(12,93,78,105.00,1,1),(12,93,78,105.00,1,2),(13,93,4,200000.01,1,2),(13,93,9,2.00,2,2),(13,93,29,200000.01,1,2),(13,93,34,200000.01,1,1),(13,93,34,200000.01,1,2),(13,93,56,2.00,1,2),(13,93,78,200000.01,1,1),(13,93,78,200000.01,1,2),(14,93,4,30.00,1,2),(14,93,9,6.00,2,2),(14,93,29,30.00,1,2),(14,93,34,30.00,1,1),(14,93,34,30.00,1,2),(14,93,56,6.00,1,2),(14,93,78,30.00,1,1),(14,93,78,30.00,1,2),(15,93,4,3000.01,1,2),(15,93,9,2.00,2,2),(15,93,29,3000.01,1,2),(15,93,34,3000.01,1,1),(15,93,34,3000.01,1,2),(15,93,56,2.00,1,2),(15,93,78,3000.01,1,1),(15,93,78,3000.01,1,2),(16,94,6,135.44,1,2),(16,94,9,154.00,2,2),(16,94,29,135.44,1,2),(16,94,34,135.44,1,2),(16,94,56,154.00,1,2),(16,94,78,135.44,1,2),(17,93,4,10.00,1,2),(17,93,9,9.00,2,2),(17,93,29,10.00,1,2),(17,93,34,10.00,1,1),(17,93,34,10.00,1,2),(17,93,56,9.00,1,2),(17,93,78,10.00,1,1),(17,93,78,10.00,1,2),(18,93,4,15.00,1,2),(18,93,9,27.00,2,2),(18,93,29,15.00,1,2),(18,93,34,15.00,1,1),(18,93,34,15.00,1,2),(18,93,56,27.00,1,2),(18,93,78,15.00,1,1),(18,93,78,15.00,1,2),(19,99,4,10.50,2,2),(19,99,9,10.50,1,2),(19,99,29,10.50,2,2),(19,99,38,10.50,2,1),(19,99,38,10.50,2,2),(19,99,56,10.50,2,2),(19,99,78,10.50,2,1),(19,99,78,10.50,2,2),(20,123,9,500.00,2,2),(20,123,18,500.00,2,2),(21,141,21,5.00,1,2),(21,141,29,5.00,2,2),(21,141,63,5.00,1,2),(21,141,78,5.00,2,2),(22,141,21,5.00,1,2),(22,141,29,5.00,2,2),(22,141,63,5.00,1,2),(22,141,78,5.00,2,2),(23,225,7,170.50,1,2),(23,225,30,170.50,1,2),(23,225,51,170.50,1,2),(23,225,78,170.50,1,2),(26,93,4,6.30,1,2),(26,93,9,5.00,2,2),(26,93,29,6.30,1,2),(26,93,34,6.30,1,1),(26,93,34,6.30,1,2),(26,93,56,5.00,1,2),(26,93,78,6.30,1,1),(26,93,78,6.30,1,2),(27,94,6,6.30,1,2),(27,94,9,5.00,2,2),(27,94,29,6.30,1,2),(27,94,34,6.30,1,2),(27,94,56,5.00,1,2),(27,94,78,6.30,1,2),(28,161,4,5.00,1,2),(28,161,21,5.00,2,2),(28,161,29,5.00,2,2),(28,161,49,5.00,1,1),(28,161,49,5.00,1,2),(28,161,65,5.00,1,1),(28,161,72,5.00,1,1),(28,161,72,5.00,1,2),(28,161,78,5.00,1,1),(28,161,78,5.00,2,2),(29,230,4,100.00,1,2),(29,230,19,100.00,1,2),(29,230,20,100.00,2,2),(30,232,4,11.00,2,2),(30,232,19,11.00,2,2),(30,232,20,11.00,1,2),(30,232,29,11.00,2,2),(30,232,49,11.00,1,2),(30,232,65,11.00,1,2),(30,232,72,11.00,1,2),(30,232,78,11.00,2,2),(31,231,4,22.00,2,2),(31,231,19,22.00,2,2),(31,231,29,22.00,2,2),(31,231,49,22.00,1,2),(31,231,72,22.00,1,2),(31,231,78,22.00,2,2),(32,231,4,22.00,2,2),(32,231,19,22.00,2,2),(32,231,29,22.00,2,2),(32,231,49,22.00,1,2),(32,231,72,22.00,1,2),(32,231,78,22.00,2,2),(33,231,4,22.00,2,2),(33,231,19,22.00,2,2),(33,231,29,22.00,2,2),(33,231,49,22.00,1,2),(33,231,72,22.00,1,2),(33,231,78,22.00,2,2),(34,231,4,22.00,2,2),(34,231,19,22.00,2,2),(34,231,29,22.00,2,2),(34,231,49,22.00,1,2),(34,231,72,22.00,1,2),(34,231,78,22.00,2,2),(35,231,4,22.00,2,2),(35,231,19,22.00,2,2),(35,231,29,22.00,2,2),(35,231,49,22.00,1,2),(35,231,72,22.00,1,2),(35,231,78,22.00,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,1,NULL,NULL,NULL,300.00,'D',1),(2,2,1,NULL,NULL,NULL,30.00,'D',1),(3,2,1,NULL,NULL,NULL,70.00,'D',1),(4,3,8,NULL,NULL,NULL,500.00,'D',0),(5,4,1,NULL,NULL,NULL,500.00,'D',1),(6,5,1,NULL,NULL,NULL,200.00,'D',1),(7,5,8,NULL,NULL,NULL,300.00,'D',0),(8,6,1,NULL,NULL,NULL,250.00,'D',1),(9,6,8,NULL,NULL,NULL,450.00,'D',0),(10,7,1,NULL,NULL,NULL,70.00,'D',1),(11,8,1,NULL,NULL,NULL,80.00,'D',1),(12,9,1,NULL,NULL,NULL,90.00,'D',1),(13,10,1,NULL,NULL,NULL,90.00,'D',1),(14,11,1,NULL,NULL,NULL,200.00,'D',1),(15,12,1,NULL,NULL,NULL,105.00,'C',1),(16,13,1,NULL,NULL,NULL,200000.01,'C',1),(17,14,1,NULL,NULL,NULL,50.00,'C',1),(18,14,1,NULL,NULL,NULL,20.00,'D',1),(19,15,1,NULL,NULL,NULL,3000.01,'C',1),(20,16,1,NULL,NULL,NULL,30.00,'C',1),(21,16,4,NULL,NULL,NULL,105.44,'C',0),(22,17,1,NULL,NULL,NULL,10.00,'C',1),(23,18,1,NULL,NULL,NULL,15.00,'C',1),(24,24,1,NULL,NULL,NULL,3.00,'D',1),(25,25,1,NULL,NULL,NULL,8.00,'C',1),(26,26,1,NULL,NULL,NULL,6.30,'C',1),(27,27,4,NULL,NULL,NULL,6.30,'C',1),(28,28,1,NULL,NULL,NULL,5.00,'D',1),(29,29,1,NULL,NULL,NULL,100.00,'C',1);
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
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,0,1,1),(4,0,1,1),(5,1,1,1),(6,1,1,1),(7,1,1,1),(8,1,1,1),(9,1,1,1),(10,1,1,1),(12,1,1,1),(13,1,1,1),(14,1,1,1),(15,1,1,1),(16,1,1,1),(17,1,1,1),(18,1,1,1),(19,1,1,1),(20,1,1,1),(26,1,1,1),(27,1,1,1);
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
INSERT INTO `nf` VALUES (1,3,13250,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,3,9,NULL,1,90.00,90.00,0.00,0.00,0.00,0.00,90.00,16.20,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0);
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
INSERT INTO `nfce` VALUES (1,3,NULL,3551,1,'31221087976874000167650010000035511000035510','','','2022-10-05 00:00:00','2022-10-05 00:00:00',1,200.00,200.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'','','0001-01-01 00:00:00','',1,'','','',1,0,0,0);
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
INSERT INTO `nfce_contingencia` VALUES (1,3,'2022-11-23 10:21:11','2022-11-23 10:21:13','teste modo de contingencia',0);
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
INSERT INTO `nfe` VALUES (1,3,888,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-11-24 10:19:47',1,0,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(2,3,4123,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-11-24 10:19:48',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,1),(3,3,105522,'E',1,'31160704731855000143550010007485481189117075','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,300.00,300.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(4,3,129589,'E',1,'35170556639107000139550010001295891214189392','','',0,0,6,'2022-11-21 00:00:00','2022-11-23 00:00:00',5,1,3,9,NULL,2,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(5,3,19985761,'E',1,'31190824634181000176550240000051671667165118','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(6,3,19985762,'E',1,'31190724634181000176550740000000091895382522','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(7,3,19985763,'E',1,'31190624634181000176550240000051471672414309','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(8,3,19985764,'E',1,'31190624634181000176550240000051461229102452','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(9,3,129581,'E',1,'31190624634181000176550240000051451431684303','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(10,3,129582,'E',1,'31190624634181000176550240000051441127964116','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(11,3,129583,'E',1,'31190524634181000176550240000051431383098847','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(12,3,129584,'E',1,'31190524634181000176550240000051421383098840','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,2,700.00,700.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(13,3,755,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2022-11-24 10:21:20',1,0,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(14,3,0,'S',1,'','','',0,0,10,'0001-01-01 00:00:00','2022-11-24 10:21:29',1,0,3,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(15,3,995,'E',3,'','','',0,0,9,'0001-01-01 00:00:00','2022-11-24 10:22:19',1,0,2,0,NULL,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',0,0,0,0),(16,3,4914,'E',1,'31200620319623000139550010000584391752772151','','',0,0,9,'2022-11-23 10:22:20','2022-11-23 10:22:20',1,1,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(17,3,9025,'E',1,'31200829826502000158550010000198201919116443','','',0,0,9,'2022-11-23 10:22:21','2022-11-23 10:22:21',1,1,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(18,3,9548,'E',1,'31200906249102000121550020002381841003458376','','',0,0,9,'2022-11-23 10:22:21','2022-11-23 10:22:21',1,1,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(19,3,19985763,'E',1,'31221121148618000174550010045642481045642480','','',0,0,6,'2022-11-23 00:00:00','2022-11-23 00:00:00',1,1,3,9,NULL,1,1000.00,1008.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,2.00,3.00,2.00,3.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2.00,2.00,0.00,0.00,'','',1,'','',1,0,0,0);
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
INSERT INTO `nfe_contingencia` VALUES (1,3,'2022-11-23 10:21:16','2022-11-23 10:21:18','teste modo de contingencia',0);
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
INSERT INTO `operacao_categoria` VALUES (1,93,1),(1,94,2),(1,95,3),(1,96,4),(1,97,5),(1,98,6),(2,99,7),(2,100,8),(2,101,9),(2,102,10),(3,119,11),(3,120,12),(3,121,13),(4,122,14),(4,123,15),(6,119,11),(6,120,12),(6,121,13),(8,93,1),(8,94,2),(8,97,5),(11,99,7),(11,100,8);
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
INSERT INTO `pagamento` VALUES (1,1,'2022-11-23',200.00,0.00,0.00,200.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,3,3,2,NULL,1,'1','2022-11-23','2022-12-03','0001-01-01',30.00,0.00,0.00,0.00,'',0,0),(2,NULL,3,3,2,NULL,1,'2','2022-11-23','2022-12-23','0001-01-01',70.00,0.00,0.00,0.00,'',0,0),(3,NULL,3,3,9,NULL,1,'10','2022-11-23','2022-12-03','2022-11-23',200.00,0.00,0.00,200.00,'',0,0),(4,NULL,3,3,9,NULL,1,'20','2022-11-23','2022-12-23','0001-01-01',300.00,0.00,0.00,0.00,'',0,1),(5,NULL,3,3,10,NULL,1,'10','2022-11-23','2022-12-03','0001-01-01',250.00,0.00,0.00,0.00,'',0,0),(6,NULL,3,3,10,NULL,1,'20','2022-11-23','2022-12-23','0001-01-01',450.00,0.00,0.00,0.00,'',0,0),(7,NULL,3,3,NULL,NULL,1,'0000000007','2022-11-23','2022-12-23','0001-01-01',5.00,0.00,0.00,0.00,'',0,0),(8,NULL,3,7,NULL,NULL,1,'0000000007','2022-11-23','2022-12-23','0001-01-01',5.00,0.00,0.00,0.00,'',0,0),(9,NULL,3,3,NULL,1,2,'0000000009','2022-11-23','2022-12-23','0001-01-01',11.00,0.00,0.00,0.00,'',0,1),(10,NULL,3,3,NULL,1,2,'0000000010','2022-11-23','2022-12-05','0001-01-01',22.00,0.00,0.00,0.00,'',0,1),(11,NULL,3,3,NULL,1,2,'0000000011','2022-11-23','2022-11-24','0001-01-01',22.00,0.00,0.00,0.00,'',0,1),(12,NULL,3,3,NULL,1,2,'0000000012','2022-11-23','2022-12-24','0001-01-01',22.00,0.00,0.00,0.00,'',0,1),(13,NULL,3,3,NULL,1,2,'0000000013','2022-11-23','2023-01-24','0001-01-01',22.00,0.00,0.00,0.00,'',0,1),(14,NULL,3,3,NULL,1,2,'0000000014','2022-11-23','2023-02-24','0001-01-01',22.00,0.00,0.00,0.00,'',0,1);
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
INSERT INTO `pessoa` VALUES (1,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,'0001-01-01 00:00:00'),(2,'J',1,'João','João',NULL,'','16629339000191','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-11-23 10:19:16'),(3,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-11-23 10:19:16'),(4,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','CPR15725',9,'','','','','1999-11-29',0,0,'2022-11-23 10:21:49'),(5,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,'2022-11-23 10:19:20'),(6,'J',1,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:21:20'),(7,'F',0,'Vendedor excluído','','37077148610','1348213',NULL,'','','',0,'','','','','2002-11-23',0,0,'2022-11-23 10:21:28'),(8,'J',2,'Leonardo e Breno Comercio de Bebidas Ltda','Leonardo e Breno Comercio de Bebidas Ltda',NULL,'','18206937000183','ISENTO','','',9,'','','','','0001-01-01',0,0,'2022-11-23 10:21:36'),(9,'F',0,'Eliane Bianca Freitas','','80577321560','MG123',NULL,'','','',0,'','','','','0001-01-01',0,0,'2022-11-23 10:21:49');
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
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2022-11-23 10:20:06'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2022-11-23 10:20:06'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2022-11-23 10:20:06'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2022-11-23 10:20:06'),(5,NULL,'À vista',1,1,0,0,0,'2022-11-23 10:20:05'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2022-11-23 10:20:06'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2022-11-23 10:20:06'),(8,NULL,'À prazo Entrada/30/45/60/75/90',2,4,1,0,0,'2022-11-23 10:20:06'),(9,NULL,'Vencimento dia 10 do próximo mês',2,4,4,10,0,'2022-11-23 10:20:06');
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
INSERT INTO `produto` VALUES (1,NULL,'Arroz Codil Tipo 1','',0,3,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(2,NULL,'Café','',0,NULL,'',1,1,0,'10064000','','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(3,NULL,'Fósforo','',0,1,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(4,NULL,'Troca de óleo','Troca de óleo',9,NULL,'',1,1,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:21:50'),(5,NULL,'Coca-Cola 2L','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(6,NULL,'Produto teste','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(7,NULL,'Feijão Carioca','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2022-11-23 10:19:25'),(8,NULL,'Manutenção de computadores','Manutenção de computadores',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2022-11-23 10:21:50');
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
INSERT INTO `produto_estoque` VALUES (1,3,NULL,NULL,3,1,'',26.0000,50.0000,64.0000),(2,5,NULL,NULL,3,1,'',20.0000,20.0000,0.0000),(3,3,1,NULL,3,1,'',0.0000,0.0000,0.0000),(4,1,1,NULL,3,1,'',108.0000,50.0000,10.0000),(5,7,NULL,NULL,3,1,'',-2.0000,0.0000,2.0000);
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
INSERT INTO `produto_grupo` VALUES (1,'Geral','2022-11-23 10:19:25');
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
INSERT INTO `produto_inventario` VALUES (8,3,1,'202210',0.0000,39.5600),(9,3,2,'202210',0.0000,5.8000),(10,3,3,'202210',0.0000,2.0001),(11,3,5,'202210',0.0000,5.0000),(12,3,6,'202210',0.0000,0.0000),(13,3,7,'202210',0.0000,8.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:19:58','2022-11-23 00:00:00','E',50.0000,''),(2,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:19:58','2022-11-23 00:00:00','E',20.0000,''),(3,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:19:58','2022-11-23 00:00:00','E',10.0000,''),(4,1,1,NULL,3,1,2,NULL,NULL,NULL,NULL,'2022-11-23 10:19:58','2022-11-23 00:00:00','E',10.0000,''),(5,1,1,NULL,3,1,7,NULL,NULL,NULL,NULL,'2022-11-23 10:20:00','2022-11-23 00:00:00','E',10.0000,''),(6,1,1,NULL,3,1,8,NULL,NULL,NULL,NULL,'2022-11-23 10:20:01','2022-11-23 00:00:00','E',10.0000,''),(7,1,1,NULL,3,1,9,NULL,NULL,NULL,NULL,'2022-11-23 10:20:01','2022-11-23 00:00:00','E',10.0000,''),(8,1,1,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-11-23 10:20:02','2022-11-23 00:00:00','E',10.0000,''),(9,3,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-11-23 10:20:02','2022-11-23 00:00:00','E',50.0000,''),(10,5,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2022-11-23 10:20:02','2022-11-23 00:00:00','E',20.0000,''),(11,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2022-11-23 10:20:02','2022-11-23 00:00:00','E',10.0000,''),(12,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2022-11-23 10:20:03','2022-11-23 00:00:00','E',10.0000,''),(13,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2022-11-23 10:20:03','2022-11-23 00:00:00','E',10.0000,''),(14,1,1,NULL,3,1,14,NULL,NULL,NULL,NULL,'2022-11-23 10:20:03','2022-11-23 00:00:00','E',10.0000,''),(15,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',50.0000,''),(16,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',20.0000,''),(17,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',10.0000,''),(18,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',10.0000,''),(19,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',10.0000,''),(20,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2022-11-23 10:20:04','2022-11-23 00:00:00','S',10.0000,''),(21,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:07','2022-11-23 10:21:07','S',15.0000,'Vencimento do produto'),(22,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:07','2022-11-23 10:21:07','E',25.0000,'Recontagem de estoqueo'),(23,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:07','2022-11-03 10:21:07','E',58.0000,'Balanço'),(24,3,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:08','2022-11-03 10:21:07','E',40.0000,'Balanço'),(25,3,NULL,NULL,3,1,NULL,11,NULL,NULL,NULL,'2022-11-23 10:21:10','2022-11-23 10:21:10','S',10.0000,''),(26,3,NULL,NULL,3,1,NULL,12,NULL,NULL,NULL,'2022-11-23 10:21:10','2022-11-23 10:21:10','S',1.0000,''),(27,3,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2022-11-23 10:21:10','2022-11-23 10:21:10','S',3.0000,''),(28,3,NULL,NULL,3,1,NULL,14,NULL,NULL,NULL,'2022-11-23 10:21:11','2022-11-23 10:21:11','S',1.0000,''),(29,1,1,NULL,3,1,NULL,16,NULL,NULL,NULL,'2022-11-23 10:21:19','2022-11-23 10:21:19','S',6.0000,''),(30,3,NULL,NULL,3,1,NULL,16,NULL,NULL,NULL,'2022-11-23 10:21:19','2022-11-23 10:21:19','S',50.0000,''),(31,1,1,NULL,3,1,NULL,17,NULL,NULL,NULL,'2022-11-23 10:21:19','2022-11-23 10:21:19','S',1.0000,''),(32,1,1,NULL,3,1,NULL,18,NULL,NULL,NULL,'2022-11-23 10:21:19','2022-11-23 10:21:19','S',3.0000,''),(33,3,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,'2022-11-23 10:21:34','2022-11-23 10:21:34','E',1.0000,''),(34,1,1,NULL,3,1,NULL,NULL,1,NULL,NULL,'2022-11-23 10:21:35','2022-11-23 10:21:35','S',10.0000,''),(35,7,NULL,NULL,3,1,NULL,19,NULL,NULL,NULL,'2022-11-23 10:22:20','2022-11-23 10:22:20','S',1.0000,''),(36,7,NULL,NULL,3,1,NULL,20,NULL,NULL,NULL,'2022-11-23 10:22:20','2022-11-23 10:22:20','S',1.0000,'');
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
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,3,50.0000,42.7500,50.0000,7.9000,6.0940,5.0000,0.0000),(2,1,0,1,3,50.0000,41.8854,50.0000,7.9000,6.0940,5.0000,0.0000),(3,2,0,NULL,3,5.8000,0.0000,0.0000,7.3000,0.0000,0.0000,0.0000),(4,3,0,NULL,3,2.0000,2.0001,0.0000,0.4900,3126.6849,1.9900,0.0000),(5,4,0,NULL,3,0.0000,0.0000,0.0000,80.0000,0.0000,0.0000,0.0000),(6,5,0,NULL,3,5.0000,5.0000,5.0000,5.5000,0.0000,0.0000,0.0000),(7,6,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(8,6,0,2,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(9,7,0,NULL,3,8.0000,0.0000,0.0000,6.3000,6.3000,6.3000,0.0000),(10,1,0,3,3,5.5000,0.0000,0.0000,7.9000,0.0000,0.0000,0.0000),(11,8,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000);
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
INSERT INTO `produto_sped` VALUES (1,1,'Arroz Codil Tipo 1','2022-11-23','0001-01-01'),(2,2,'Café','2022-11-23','0001-01-01'),(3,3,'Macarrão Sta Amália','2022-11-23','2022-11-22'),(4,4,'Troca de óleo','2022-11-23','0001-01-01'),(5,5,'Coca-Cola 2L','2022-11-23','0001-01-01'),(6,6,'Produto teste','2022-11-23','0001-01-01'),(7,7,'Feijão Carioca','2022-11-23','0001-01-01'),(8,3,'Fósforo','2022-11-23','0001-01-01');
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
INSERT INTO `produto_unidade` VALUES (1,'Unidade','UN',0,'2022-11-23 10:19:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,3,4,NULL,16,2,'0000000001','2022-11-23','2022-12-23','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(2,NULL,3,4,NULL,16,2,'0000000002','2022-11-23','2023-01-22','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(3,NULL,3,4,NULL,16,2,'0000000003','2022-11-23','2023-02-21','0001-01-01',35.14,0.00,0.00,0.00,0.0000,'',0,0,0),(4,NULL,3,8,NULL,NULL,1,'Teste api','2022-11-23','2022-11-28','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0),(5,NULL,3,4,NULL,20,2,'0000000005','2021-01-01','2021-02-01','0001-01-01',6.30,0.00,0.00,0.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,97,100.0000),(2,97,100.0000),(3,97,100.0000),(4,225,100.0000),(5,97,100.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sped_credito_pis_cofins`
--

LOCK TABLES `sped_credito_pis_cofins` WRITE;
/*!40000 ALTER TABLE `sped_credito_pis_cofins` DISABLE KEYS */;
INSERT INTO `sped_credito_pis_cofins` VALUES (1,3,'102022','102022',101,165.00,760.00,65.00,260.00),(2,3,'092022','092022',101,165.00,760.00,65.00,260.00);
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
INSERT INTO `venda` VALUES (1,3,'2022-11-23 10:21:04',8,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:06'),(2,3,'2022-11-23 10:21:04',8,4,1,1,100.00,90.00,0.00,10.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Floriano Peixoto',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:06'),(3,3,'2022-11-23 10:21:04',8,4,1,1,70.00,50.00,0.00,20.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(4,3,'2022-11-23 10:21:04',8,4,1,1,15.07,15.00,0.00,0.07,0.00,0.00,0.0000,0.0000,NULL,0.00,'Eliane Bruna Ester das Neves',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(5,3,'2022-11-23 10:21:04',8,4,1,1,70.00,90.00,0.00,0.00,0.00,20.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(6,3,'2022-11-23 10:21:05',8,4,4,2,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(7,3,'2022-11-23 10:21:05',8,NULL,1,1,120.00,120.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(8,3,'2022-11-23 10:21:05',8,4,1,1,300.00,300.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(9,3,'2022-11-23 10:21:05',8,NULL,1,1,80.00,80.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:04'),(10,3,'2022-11-23 10:21:05',8,NULL,1,1,250.00,249.00,0.00,1.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:19'),(11,3,'2022-11-23 10:21:10',8,NULL,1,1,105.00,105.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:10'),(12,3,'2022-11-23 10:21:10',8,4,1,1,200000.01,200000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:10'),(13,3,'2022-11-23 10:21:10',8,NULL,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:10'),(14,3,'2022-11-23 10:21:11',8,NULL,1,1,3000.01,3000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:10'),(15,3,'2022-11-23 10:21:18',8,NULL,1,1,6.30,7.00,0.00,0.00,0.70,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:19'),(16,3,'2022-11-23 10:21:19',8,4,4,2,135.44,135.44,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:19'),(17,3,'2022-11-23 10:21:19',8,NULL,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:19'),(18,3,'2022-11-23 10:21:19',8,NULL,1,1,15.00,15.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:21:19'),(19,3,'2021-01-01 00:00:00',8,NULL,1,1,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:22:20'),(20,3,'2021-01-01 00:00:00',8,4,4,2,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-23 10:22:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20221003.115500.121','2022-11-23 10:18:59','f7bedc16445f7ab01583410998765074'),(2,2,'20221114.182125.297','2022-11-23 10:18:59','8f6bde8e2b111939ccd324debc90c6dd'),(3,2,'20220927.231853.021-financas','2022-11-23 10:18:59','33a35750fea5e7ece0e481d91120853d'),(4,2,'20220927.231856.052-financas','2022-11-23 10:18:59','64f60051908d71e693048c017d896e94'),(5,2,'20220927.231859.082-financas','2022-11-23 10:18:59','8f9055238332220f6112ffc3b1f9e152'),(6,2,'20220927.231902.116-financas','2022-11-23 10:18:59','bd33a2bec6c3e32060698ef642b73c49'),(7,2,'20220927.231905.158-financas','2022-11-23 10:18:59','f2677580ff86ebb92893a8fd4680f401'),(8,2,'20220927.231908.190-financas','2022-11-23 10:18:59','09878d5a61624311efda7d05fdc154b0'),(9,2,'20220927.231911.215-financas','2022-11-23 10:18:59','07e14c274bf99498b737c8e365addd8e'),(10,2,'20220927.231914.237-financas','2022-11-23 10:18:59','f869242ab423c61c42eb32c2635dc0a9'),(11,2,'20220927.231917.275-financas','2022-11-23 10:18:59','a712e98ddfe81648c969ef1b377ab108'),(12,2,'20220927.231920.311-financas','2022-11-23 10:18:59','99936a4a87aa18c8d2b0d4d10dee8dd5'),(13,2,'20220927.231923.342-financas','2022-11-23 10:18:59','e0d7f1b10650e98c08b645905f019250'),(14,2,'20220927.231926.383-financas','2022-11-23 10:18:59','92cf3d658ab936cbfffea04652acf8db'),(15,2,'20220927.231929.422-financas','2022-11-23 10:18:59','ff7e02c7c30079172706762a68fa22b7'),(16,2,'20220927.231932.449-financas','2022-11-23 10:18:59','4a6a19ceeef57a9a60c2de09f6cf8910'),(17,2,'20220927.231935.475-financas','2022-11-23 10:18:59','0970c5c2a8b315ac3186ad5c31472ef0'),(18,2,'20220927.231938.503-financas','2022-11-23 10:18:59','f0d0cb296b87555a227a62ec63395517'),(19,2,'20220927.231941.539-financas','2022-11-23 10:18:59','bab4c9dd457a7ebe89ae912948ce65cf'),(20,2,'20220927.231944.560-financas','2022-11-23 10:18:59','96b87f73b0a1cb2fffbc0cb1d7ee94b8'),(21,2,'20220927.231947.591-financas','2022-11-23 10:18:59','3d0066f52e11ea0f91ad472a52aa6d14'),(22,2,'20220927.231950.619-financas','2022-11-23 10:18:59','b8aa4c0bfce8437ed8c4d19d8eb41ee0'),(23,2,'20220927.231953.643-financas','2022-11-23 10:18:59','d3e839274dec0b47c5a7c58672a2cb06'),(24,2,'20220927.231956.678-financas','2022-11-23 10:18:59','c3f6cfc49336e04884e1b0ecb747755f'),(25,2,'20220927.231959.720-financas','2022-11-23 10:18:59','d1fe22e9b1779c44ea4236700d66bd1c'),(26,2,'20220927.232002.752-financas','2022-11-23 10:18:59','61c602a8a3f7136e53a45608fef80429'),(27,2,'20220927.232005.779-financas','2022-11-23 10:18:59','49cfb86bd95fee74206500df13b5effc'),(28,2,'20220927.232008.813-financas','2022-11-23 10:18:59','8a4a171eba67f5e564505bd583bd3c60'),(29,2,'20220927.232011.839-financas','2022-11-23 10:18:59','72cd3c740518b778a81960648a122e39'),(30,2,'20220927.232014.867-financas','2022-11-23 10:18:59','209194618daa7062a2629d8df31544d2'),(31,2,'20220927.232017.894-financas','2022-11-23 10:18:59','a3ade3caf46b110888874901332c73ab'),(32,2,'20220927.232020.927-financas','2022-11-23 10:18:59','f04191cd1eba6627912a25e8978bc70a'),(33,2,'20220927.232023.968-financas','2022-11-23 10:18:59','ce0c7981ce16a263542ded957b26ae47'),(34,2,'20220927.232026.997-financas','2022-11-23 10:18:59','fa203bc2d66fc8a4e32b15ca9c4a95b6'),(35,2,'20220927.232030.018-financas','2022-11-23 10:18:59','c24f885023dc1f3d81eacedf8038b656'),(36,2,'20220927.232033.051-financas','2022-11-23 10:18:59','29e3f2d8791593d9c7701f22cd5dce4a'),(37,2,'20220927.232036.093-financas','2022-11-23 10:18:59','a338dba5c66d1e03d0da195ac4ee6a8e'),(38,2,'20220927.232039.127-financas','2022-11-23 10:18:59','83bab728ed344c5661a353fd0ab2c31b'),(39,2,'20220927.232042.162-financas','2022-11-23 10:18:59','1ff28f233743d174a2ad90f17ecdc820'),(40,2,'20220927.232045.187-financas','2022-11-23 10:18:59','f2f9f76a3ebc9d4b293422a7e6c959a3'),(41,2,'20220927.232048.220-financas','2022-11-23 10:18:59','9340bc3d567b90043590177a143b1898'),(42,2,'20220927.232051.257-financas','2022-11-23 10:18:59','8489dfbfc75f191393f402ce0fd34f3d'),(43,2,'20220927.232054.286-financas','2022-11-23 10:18:59','959f04c89f3e10c7417bdbd7cae3c899'),(44,2,'20220927.232057.328-financas','2022-11-23 10:18:59','0e3243f5dee497a0d7b94519dc8f5b31'),(45,2,'20220927.232100.367-financas','2022-11-23 10:18:59','0c7ec1b76f74bd86482f13dfe27d7813'),(46,2,'20220927.232103.395-financas','2022-11-23 10:18:59','09f22df732112a1d4268aff638dd50c6'),(47,2,'20220927.232106.423-financas','2022-11-23 10:18:59','a3012fa166a768d59e40a6c9eda0cb36'),(48,2,'20220927.232109.456-financas','2022-11-23 10:18:59','bec46c2664145d7b9da09f1609ba107d'),(49,2,'20220927.232112.491-financas','2022-11-23 10:18:59','fe3ec6441850e26203c11034d532b5ae'),(50,2,'20220927.232115.513-financas','2022-11-23 10:18:59','4537c3fcb3aba9a81475ea67cae559d8'),(51,2,'20220927.232118.547-financas','2022-11-23 10:18:59','bfcd35ec0aceadb07fd9fd36fedf1002'),(52,2,'20220927.232121.575-financas','2022-11-23 10:18:59','9867618e866d8814b1e83fcef1d6eed0'),(53,2,'20220927.232124.607-financas','2022-11-23 10:18:59','5e7a7189758d054af2db01a77a5aabb7'),(54,2,'20220927.232127.635-financas','2022-11-23 10:18:59','6cd2548671229ec9787360d26f6ce06d'),(55,2,'20220927.232130.676-financas','2022-11-23 10:18:59','33affa7724c0397d9cceefe85243f4a3'),(56,2,'20220927.232133.705-financas','2022-11-23 10:18:59','0f86ce05522133d66b21090fb663e36a'),(57,2,'20220927.232136.737-financas','2022-11-23 10:18:59','d11fbce1fee09170f709eed54c8dd614'),(58,2,'20220927.232139.771-financas','2022-11-23 10:18:59','6fe740cdc81d06e37ad9dfae26438c6e'),(59,2,'20220927.232142.802-financas','2022-11-23 10:18:59','66d9a93facb3447e964cba53a17081b2'),(60,2,'20220927.232145.829-financas','2022-11-23 10:18:59','d8c679d53443367962fc07ea88ae87fd'),(61,2,'20220927.232148.858-financas','2022-11-23 10:18:59','b874bcba13f25ee8adc29acce076929b'),(62,2,'20220927.232151.889-financas','2022-11-23 10:18:59','164fb00865a8acd41eedade510f1fb76'),(63,2,'20220927.232154.913-financas','2022-11-23 10:18:59','8d01ae6b605861871361607535b28bde'),(64,2,'20220927.232157.949-financas','2022-11-23 10:18:59','514be8acd92a7d9ee019aaf997ccbe5c'),(65,2,'20220927.232200.972-financas','2022-11-23 10:18:59','03a0616f10e5af2288f3e0304a03c975'),(66,2,'20220927.232204.006-financas','2022-11-23 10:18:59','665c7de43e5fd641dcc8e900e22f5a53'),(67,2,'20220927.232207.039-financas','2022-11-23 10:18:59','e0dcce0a055f104ec843e0bfd39d9658'),(68,2,'20220927.232210.064-financas','2022-11-23 10:18:59','1259718938f4a1cdd28bb0a91692b1db'),(69,2,'20220927.232213.090-financas','2022-11-23 10:18:59','4019e5a6924627b496f0566231f9b15d'),(70,2,'20220927.232216.129-financas','2022-11-23 10:18:59','9b238b9dc5eb1b027fd3a98276cf4d90'),(71,2,'20220927.232219.167-financas','2022-11-23 10:18:59','bedd841c56079203db551dec3697f493'),(72,2,'20220927.232222.193-financas','2022-11-23 10:18:59','938211ec75f53a703f604b5650a08696'),(73,2,'20220927.232225.219-financas','2022-11-23 10:18:59','f9ae715ad6db1268979f7d3b4a49926a'),(74,2,'20220927.232228.256-financas','2022-11-23 10:18:59','dc3212963238f59d58e25728123f5bfd'),(75,2,'20220927.232231.283-financas','2022-11-23 10:18:59','a9fa54641c0173a96a47a611a24dc5ea'),(76,2,'20220927.232234.314-financas','2022-11-23 10:18:59','b71b08adc31fa97da44d868b4dd8a184'),(77,2,'20220927.232237.348-financas','2022-11-23 10:18:59','6d4183a90498f368d82b3b454d511d6f'),(78,2,'20220927.232240.374-financas','2022-11-23 10:18:59','cac787579ead792d764960495444f01a'),(79,2,'20220927.232243.406-financas','2022-11-23 10:18:59','6bb1469054865b0e678bf02accaeb797'),(80,2,'20220927.232246.448-financas','2022-11-23 10:18:59','46baf0636fa1eea7327ed1d2e12712e7'),(81,2,'20220927.232249.485-financas','2022-11-23 10:18:59','82c7d64b4e16f3a609b56ce4c36d3fb4'),(82,2,'20220927.232252.522-financas','2022-11-23 10:18:59','3d0067e0ef6e3318472b6477f7995064'),(83,2,'20220927.232255.558-financas','2022-11-23 10:18:59','0087b1e51e7e3fd95458c2e47e9dfa27'),(84,2,'20220927.232258.583-financas','2022-11-23 10:18:59','1a4c4727175758e1ecb7d5e39218e00f'),(85,2,'20220927.232301.622-financas','2022-11-23 10:18:59','78707800e763e6f318410eddf04515d5'),(86,2,'20220927.232304.657-financas','2022-11-23 10:18:59','0044d3a3f22fb8c96a4fc15fb32b89c8'),(87,2,'20220927.232307.681-financas','2022-11-23 10:18:59','4a38a5cb1dd516547b23bd769f6feefc'),(88,2,'20220927.232310.703-financas','2022-11-23 10:18:59','3af91a3153679be11305b1498e2507ff'),(89,2,'20220927.232313.739-financas','2022-11-23 10:18:59','2101f1ec21437938819596c22aa0cd2f'),(90,2,'20220927.232316.772-financas','2022-11-23 10:18:59','c7af9adb01a395af2d0c2b628b9ed733'),(91,2,'20220927.232319.805-financas','2022-11-23 10:18:59','c2b037da9f24e034f2f1aa9960a119c2'),(92,2,'20220927.232322.838-financas','2022-11-23 10:18:59','54be5aa1a6ee559e779ee18cbe1c5320'),(93,2,'20220927.232325.873-financas','2022-11-23 10:18:59','7570b9f3d236612156deb20054bd1bd1'),(94,2,'20220927.232328.902-financas','2022-11-23 10:18:59','56ebf2c093edcb6a98a631e91b5cbdb1'),(95,2,'20220927.232331.926-financas','2022-11-23 10:18:59','a73972b6174afe4cd6d3c028489875cc'),(96,2,'20220927.232334.967-financas','2022-11-23 10:18:59','44e537ac6614792e7017efb113593d9c'),(97,2,'20220927.232338.003-financas','2022-11-23 10:18:59','bdf549ae0fe064ea76e178ed20276b6f'),(98,2,'20220927.232341.029-financas','2022-11-23 10:18:59','8c09272dafdfa348fa708bcf2db9d915'),(99,2,'20220927.232344.066-financas','2022-11-23 10:18:59','6d74e5465dfd62e0064055c00f513955'),(100,2,'20220927.232347.103-financas','2022-11-23 10:18:59','d941dd76fcac52d7e1a9910315aef465'),(101,2,'20220927.232350.132-financas','2022-11-23 10:18:59','56d2e5dfc6398d7ec29f7e472af67d8a'),(102,2,'20220927.232353.175-financas','2022-11-23 10:18:59','8f2b715cac754d80c08445819b918ea7'),(103,2,'20220927.232356.206-financas','2022-11-23 10:18:59','4f9628b9e0cb3e80e083a376262f8a07'),(104,2,'20220927.232359.244-financas','2022-11-23 10:18:59','e159c62702e682542744c8801a513cfe'),(105,2,'20220927.232402.269-financas','2022-11-23 10:18:59','6b6b46dcd10e4d023f1fad8c1a022193'),(106,2,'20220927.232405.304-financas','2022-11-23 10:18:59','e7fb9dc5761131c8585b6badb40f6840'),(107,2,'20220927.232408.343-financas','2022-11-23 10:18:59','b7df27bb7cbd9853be94289b9b87f92f'),(108,2,'20220927.232411.376-financas','2022-11-23 10:18:59','b28a8101843927d4a40904b733de1e4c'),(109,2,'20220927.232414.410-financas','2022-11-23 10:18:59','96763c1a49a929cb0f348e01c1e2c2af'),(110,2,'20220927.232417.444-financas','2022-11-23 10:18:59','da95cf577aa6dda807ba7c94006b3252'),(111,2,'20220927.232420.471-financas','2022-11-23 10:18:59','cac899def8084559e9bba16a29db2edb'),(112,2,'20220927.232423.505-financas','2022-11-23 10:18:59','9f66d393327ac05291603eaf0442318e'),(113,2,'20220927.232426.546-financas','2022-11-23 10:18:59','62dcf7f43abfbd54f9d3979f36ce8ba7'),(114,2,'20220927.232429.583-financas','2022-11-23 10:18:59','39a8cd8bf34829d32ea11fd3bb76d4b9'),(115,2,'20220927.232432.614-financas','2022-11-23 10:18:59','e23106a1f61fe5424082543e14a5262e'),(116,2,'20220927.232435.654-financas','2022-11-23 10:18:59','076ec23219133cc31dde2fd82cb64441'),(117,2,'20220927.232438.684-financas','2022-11-23 10:18:59','dc0c3b7951e97d61c60b77fb895b272e'),(118,2,'20220927.232441.715-financas','2022-11-23 10:18:59','eaa9311771b91545c0c694658622c780'),(119,2,'20220927.232444.751-financas','2022-11-23 10:18:59','56a91ac2260c619a2e2f6e1504e75d1d'),(120,2,'20220927.232447.784-financas','2022-11-23 10:18:59','ef41080f3982f46e48030535e3e2ffb1'),(121,2,'20220927.232450.819-financas','2022-11-23 10:18:59','536a26b6d077d0850eba0d1ebf549a44'),(122,2,'20220927.232453.859-financas','2022-11-23 10:18:59','1893d6bcbe7a4a10643bb80ea66360a1'),(123,2,'20220927.232456.892-financas','2022-11-23 10:18:59','2ba16350dad3ef17d532f20579c05595'),(124,2,'20220927.232459.921-financas','2022-11-23 10:18:59','518e7d1984379e4508e7932bb2b7a998'),(125,2,'20220927.232502.953-financas','2022-11-23 10:18:59','6ca032b05ceb9d70ef4b42ec04396c7b'),(126,2,'20220927.232505.981-financas','2022-11-23 10:18:59','162d653056be777d200cd653881a581d'),(127,2,'20220927.232509.010-financas','2022-11-23 10:18:59','ed650b4c2d32953b1b88ca29ca2b0639'),(128,2,'20220927.232512.043-financas','2022-11-23 10:18:59','da75d7c83d92b98117ba7290cdf17397'),(129,2,'20220927.232515.073-financas','2022-11-23 10:18:59','6307b443f54342ac8bee8b37a4332afd'),(130,2,'20220927.232518.111-financas','2022-11-23 10:18:59','ab09bdc2bc7617a404a4875204361620'),(131,2,'20220927.232521.154-financas','2022-11-23 10:18:59','fb381ebe81b742bdc2e0408e25dc7a94'),(132,2,'20220927.232524.192-financas','2022-11-23 10:18:59','3fd04dcdfb61a3d63effda0c577b7742'),(133,2,'20220927.232527.226-financas','2022-11-23 10:18:59','7fe3ddffec8081761fc7b1d64ad1ff30'),(134,2,'20220927.232530.257-financas','2022-11-23 10:18:59','9134e2884d29dd8dad2372706e4f5e81'),(135,2,'20220927.232533.279-financas','2022-11-23 10:18:59','85f70a02fa26710db4f52f3c4017130e'),(136,2,'20220927.232536.304-financas','2022-11-23 10:18:59','5319683a28cf224d12a620f961677aeb'),(137,2,'20220927.232539.334-financas','2022-11-23 10:18:59','c610c74d82faadda63b4a64201fb8be0'),(138,2,'20220927.232542.376-financas','2022-11-23 10:18:59','c2c38176bd1f7c3cb3ede0c5c3c293f2'),(139,2,'20220927.232545.411-financas','2022-11-23 10:18:59','ccf9d7afde650847049f848f2ef64fce'),(140,2,'20220927.232548.441-financas','2022-11-23 10:18:59','1d29444939e4e3583c95f77fdf88d686'),(141,2,'20220927.232551.469-financas','2022-11-23 10:18:59','1e4439b32b4a2392fe9fd870a4bef15c'),(142,2,'20220927.232554.498-financas','2022-11-23 10:18:59','9584ab95130af998b8373d9449905d2c'),(143,2,'20220927.232557.529-financas','2022-11-23 10:18:59','d709dc4880d67c7533be7e9d83a5d1ff'),(144,2,'20220927.232600.560-financas','2022-11-23 10:18:59','7e181e7b11a75631bfe25eeb17ead9de'),(145,2,'20220927.232603.602-financas','2022-11-23 10:18:59','88333e95e542665b0ca58fd29fe27761'),(146,2,'20220927.232606.641-financas','2022-11-23 10:18:59','c12e77786e42a6e3435ce3b1d5a11727'),(147,2,'20220927.232609.672-financas','2022-11-23 10:18:59','3ea387052b2eeafe1939f9957346e406'),(148,2,'20220927.232612.696-financas','2022-11-23 10:18:59','fd058867ee3156dfbd350cfc0742adfd'),(149,2,'20220927.232615.725-financas','2022-11-23 10:18:59','4b04fc9a2875bf68e3ac60619a33d24b'),(150,2,'20220927.232618.759-financas','2022-11-23 10:18:59','878141c74064045752939cfc82678c3b'),(151,2,'20220927.232621.791-financas','2022-11-23 10:18:59','a4b9cc32e6837a5d59c7e63afa26c583'),(152,2,'20220927.232624.818-financas','2022-11-23 10:18:59','2fe4d1aadb12e3c6c38cfa4d8f71b131'),(153,2,'20220927.232627.854-financas','2022-11-23 10:18:59','8e1e8b59de96c15527413ac10b4989cc'),(154,2,'20220927.232630.891-financas','2022-11-23 10:18:59','6042ea69bceda26f040bd86b65a8833f'),(155,2,'20220927.232633.913-financas','2022-11-23 10:18:59','e5f66d7688cdbcad13c49031c5827f84'),(156,2,'20220927.232636.944-financas','2022-11-23 10:18:59','6cb190d4039d3d42dba82581428a818c'),(157,2,'20220927.232639.974-financas','2022-11-23 10:18:59','788e4b58a2d1d9d4204286a8e92c6c47'),(158,2,'20220927.232643.008-financas','2022-11-23 10:18:59','81a3c98bed47492978d8ef5cb9e90462'),(159,2,'20220927.232646.039-financas','2022-11-23 10:18:59','ef85f35153e4fd00226b740015c8d7ad'),(160,2,'20220927.232649.072-financas','2022-11-23 10:18:59','541a989a4843ff681c80b63f013efd6c'),(161,2,'20220927.232652.103-financas','2022-11-23 10:18:59','4bed93063ba1f3d16ea9488e96ca9aa2'),(162,2,'20220927.232655.134-financas','2022-11-23 10:18:59','34b7487309c503505c060e54bff3a65b'),(163,2,'20220927.232658.169-financas','2022-11-23 10:18:59','d337ff6d315804a191cad345eebc366c'),(164,2,'20220927.232701.204-financas','2022-11-23 10:18:59','8c9a0c86d3e2c030a354b1dc6c8adea3'),(165,2,'20220927.232704.237-financas','2022-11-23 10:18:59','104e46cf4ea6d5467d2573cc791d7e7a'),(166,2,'20220927.232707.265-financas','2022-11-23 10:18:59','38c16841221ea70db32dd1ecc88b4c89'),(167,2,'20220927.232710.291-financas','2022-11-23 10:18:59','f019c55239776b172ebade3094cfceef'),(168,2,'20220927.232713.319-financas','2022-11-23 10:18:59','b840d2c77706be961139ebec731635ec'),(169,2,'20220927.232716.345-financas','2022-11-23 10:18:59','b840a72697843c14903a635ed092a289'),(170,2,'20220927.232719.376-financas','2022-11-23 10:18:59','8a2ec5524e3f6b8ab8be31772e047f78'),(171,2,'20220927.232722.413-financas','2022-11-23 10:18:59','33df3bc630501589fcd0e7e67dec3b20'),(172,2,'20220927.232725.451-financas','2022-11-23 10:18:59','eee7ff025d77a0e5a74f701061b02cbe'),(173,2,'20220927.232728.475-financas','2022-11-23 10:18:59','3bbd7d246488835aa19a91cf4a088a7a'),(174,2,'20220927.232731.509-financas','2022-11-23 10:18:59','a609d77cecbaccf8ab7b4aa9ba9afdf1'),(175,2,'20220927.232734.538-financas','2022-11-23 10:18:59','422393a3e5b7ae781faa3fd162a0dbe1'),(176,2,'20220927.232737.569-financas','2022-11-23 10:18:59','0a2ee3d2fde87121bd3433e635d119ad'),(177,2,'20220927.232740.596-financas','2022-11-23 10:18:59','9ea93093772a95a8c26e8c217dbf5cc4'),(178,2,'20220927.232743.629-financas','2022-11-23 10:18:59','2933941d29cc8bc475b78462ac80c3ff'),(179,2,'20220927.232746.669-financas','2022-11-23 10:18:59','b2b6a53064b6cca20f9a3fd06022cc7e'),(180,2,'20220927.232749.707-financas','2022-11-23 10:18:59','aa67d90de79ac91429d811d58e71f466'),(181,2,'20220927.232752.736-financas','2022-11-23 10:18:59','d528a83c871000e425417f4621751e59'),(182,2,'20220927.232755.766-financas','2022-11-23 10:18:59','d8fa296270f4df808c2217faa19d6dd6'),(183,2,'20220927.232758.799-financas','2022-11-23 10:18:59','b7f30247d4136bc2529c5069ad3b0f36'),(184,2,'20220927.232801.839-financas','2022-11-23 10:19:00','d42b7e7e27e5b6667020a88295b32c7c'),(185,2,'20220927.232804.868-financas','2022-11-23 10:19:00','ad4ee61828bda84f6bda84c667614049'),(186,2,'20220927.232807.904-financas','2022-11-23 10:19:00','c5614da31264175bbcce708f71980bd0'),(187,2,'20220927.232810.940-financas','2022-11-23 10:19:00','d87c29b467afe53b5644396a4d2f6b6c'),(188,2,'20220927.232813.974-financas','2022-11-23 10:19:00','99f1296ed7d3889ab902f02d1b41dbfe'),(189,2,'20220927.232817.010-financas','2022-11-23 10:19:00','0f1b40f56c9f3ed3f9d912d308ba0ed6'),(190,2,'20220927.232820.040-financas','2022-11-23 10:19:00','df208b219b9c7304be11aec4ffcce073'),(191,2,'20220927.232823.062-financas','2022-11-23 10:19:00','9446d2635acab93d1f77f5a61ac5c62d'),(192,2,'20220927.232826.092-financas','2022-11-23 10:19:00','0ebd0f8932ba138e984b5b8741a0b16b'),(193,2,'20220927.232829.122-financas','2022-11-23 10:19:00','c08f8d545a4e31532bddaf202925c1e2'),(194,2,'20220927.232832.143-financas','2022-11-23 10:19:00','0a7008520e7cb024ac1ace1688b8ea99'),(195,2,'20220927.232835.174-financas','2022-11-23 10:19:00','893943677fa467cc31781fa8d7f8ade9'),(196,2,'20220927.232838.193-financas','2022-11-23 10:19:00','a62d6565482e79d5d2fbc28ace7e3e10'),(197,2,'20220927.232841.224-financas','2022-11-23 10:19:00','bec339d16a21f574c0ed1d947133e737'),(198,2,'20220927.232844.252-financas','2022-11-23 10:19:00','4c50ed10391852935f2e8c11e3b555a9'),(199,2,'20220927.232847.290-financas','2022-11-23 10:19:00','bd760a851d45e064d57204720b0bf424'),(200,2,'20220927.232850.325-financas','2022-11-23 10:19:00','03fac3bf743317b0f26398eaf8e0317a'),(201,2,'20220927.232853.357-financas','2022-11-23 10:19:00','0f869842f41a4e898d5b6ca853630053'),(202,2,'20220927.232856.391-financas','2022-11-23 10:19:00','469def0dd127fdeae5fa1ad3fd0c8998'),(203,2,'20220927.232859.421-financas','2022-11-23 10:19:00','a0970641aa8fe5e203f0f140ad28bf21'),(204,2,'20220927.232902.454-financas','2022-11-23 10:19:00','d47b361ced15770d18f81dc67b5a9175'),(205,2,'20220927.232905.477-financas','2022-11-23 10:19:00','dc056780322ecb1ea9faaa6ff8c8a455'),(206,2,'20220927.232908.500-financas','2022-11-23 10:19:00','d9d97f89c21306b3732f2ad8f39c3da6'),(207,2,'20220927.232911.522-financas','2022-11-23 10:19:00','7a4015f99668214b02a392cbe0b2e75f'),(208,2,'20220927.232914.565-financas','2022-11-23 10:19:00','c45f5f9ff4877a7113bea1912d7d9eae'),(209,2,'20220927.232917.598-financas','2022-11-23 10:19:00','b6d47dc89e902b2ec93dd9c233249df4'),(210,2,'20220927.232920.621-financas','2022-11-23 10:19:00','39261fe7cfd2db527775da475eeb2787'),(211,2,'20220927.232923.657-financas','2022-11-23 10:19:00','56561d99d7722575033f625fd7fe466f'),(212,2,'20220927.232926.695-financas','2022-11-23 10:19:00','4182e20bf429084564c38d48b6dfe47e'),(213,2,'20220927.232929.719-financas','2022-11-23 10:19:00','d15d871f978122b9bb5be01a97eb90db'),(214,2,'20220927.232932.746-financas','2022-11-23 10:19:00','72632702a5b09d928deacfb7e4dc72e9'),(215,2,'20220927.232935.782-financas','2022-11-23 10:19:00','e89a9020e4827e032151e8a0da3d7191'),(216,2,'20220927.232938.815-financas','2022-11-23 10:19:00','29f1e7b90516bd3c923436443b31a8a9'),(217,2,'20220927.232941.849-financas','2022-11-23 10:19:00','8da891b9d27b314247a3fa19c2fc1d27'),(218,2,'20220927.232944.888-financas','2022-11-23 10:19:00','571930f287917e7a9f7d09f9fa9578bf'),(219,2,'20220927.232947.917-financas','2022-11-23 10:19:00','f914929a9991740f0e292317f6134b4e'),(220,2,'20220927.232950.951-financas','2022-11-23 10:19:00','15de202d03038f8f2f9227cae33c5275'),(221,2,'20220927.232953.974-financas','2022-11-23 10:19:00','92535238908034e36b1ae76c8d929808'),(222,2,'20220927.232957.014-financas','2022-11-23 10:19:00','e8a628de3209ecf26b11e5b9d50c7b62'),(223,2,'20220927.233000.051-financas','2022-11-23 10:19:00','9adfc816f9de8f05403e2bab94850dd9'),(224,2,'20220927.233003.079-financas','2022-11-23 10:19:00','57db1d54eeb0136a56205483590adde4'),(225,2,'20220927.233006.103-financas','2022-11-23 10:19:00','61b517d6ef6313973ba7f99d0cbd3eae'),(226,2,'20220927.233009.138-financas','2022-11-23 10:19:00','5b2974b01e0786ea53e927559cf22f17'),(227,2,'20220927.233012.173-financas','2022-11-23 10:19:00','b135bf5186adf6c06d9be8c2585e911d'),(228,2,'20220927.233015.214-financas','2022-11-23 10:19:00','4a62f759e30b9b71eddb5eb50ab823f8'),(229,2,'20220927.233018.251-financas','2022-11-23 10:19:00','d71b66e40420f39b377e2e971492dd24'),(230,2,'20220927.233021.285-financas','2022-11-23 10:19:00','3492c533f56e8b01e528a810e6bbc12d'),(231,2,'20220927.233024.319-financas','2022-11-23 10:19:00','036ad75021745965db2e7968b86fb8e9'),(232,2,'20220927.233027.356-financas','2022-11-23 10:19:00','af64a7b33b7a23488d33e6ce0deb747e'),(233,2,'20220927.233030.384-financas','2022-11-23 10:19:00','e47bc9508d938c2724be9a60a790ff8f'),(234,2,'20220927.233033.418-financas','2022-11-23 10:19:00','5855f48f885137bb83a66a8d3eb4478d'),(235,2,'20220927.233036.448-financas','2022-11-23 10:19:00','958867ceb52747f1d9e297c049a417dd'),(236,2,'20220927.233039.475-financas','2022-11-23 10:19:00','07c3b9a1111b4c4db241fe7ce323266d'),(237,2,'20220927.233042.508-financas','2022-11-23 10:19:00','e9b66fbaece612bcd7acc08ecb907e36'),(238,2,'20220927.233045.537-financas','2022-11-23 10:19:00','626be9f006dee4e880fccbde08d0c7c5'),(239,2,'20220927.233048.574-financas','2022-11-23 10:19:00','9aab552235d7a350cf244dd2f4b5b3f1'),(240,2,'20220927.233051.607-financas','2022-11-23 10:19:00','b1036b0897f9e94d3e996f7e783a3a48'),(241,2,'20220927.233054.633-financas','2022-11-23 10:19:00','ec0e6aa3fa8aed05e9f108cb84787b0e'),(242,2,'20220927.233057.670-financas','2022-11-23 10:19:00','8b420b0bf809a00346f240994008d2a5'),(243,2,'20220927.233100.705-financas','2022-11-23 10:19:00','522236cac92a6d5873a50c7b7c374d08'),(244,2,'20220927.233103.739-financas','2022-11-23 10:19:00','662f000d9ec518e3452e6a610db1a0c0'),(245,2,'20220927.233106.773-financas','2022-11-23 10:19:00','7af6ed58acae0d2b0504cc31cca1f434'),(246,2,'20220927.233109.798-financas','2022-11-23 10:19:00','d56ccb49636ba706bda98023293592a4'),(247,2,'20220927.233112.826-financas','2022-11-23 10:19:00','d92c88bf03ab2789e5f5016f1c969fa9'),(248,2,'20220927.233115.869-financas','2022-11-23 10:19:00','e28fd4f2bc61ee2e3d680262d950e1e7'),(249,2,'20220927.233118.907-financas','2022-11-23 10:19:00','d3301d2f8a95ae06e57bed564d1c9369'),(250,2,'20220927.233121.950-financas','2022-11-23 10:19:00','35ae28722fb8c9fac73dbdab8244bfd3'),(251,2,'20220927.233124.971-financas','2022-11-23 10:19:00','fa8288f498191936609b19c9299f641f'),(252,2,'20220927.233127.996-financas','2022-11-23 10:19:00','23ce2f0411bdc327c4f60941b5e1e7ca'),(253,2,'20220927.233131.020-financas','2022-11-23 10:19:00','e5e93e8dae39a6a95557d0974ccc1f62'),(254,2,'20220927.233134.048-financas','2022-11-23 10:19:00','935e953cfd20a7bdfd74d335ab87fb80'),(255,2,'20220927.233137.082-financas','2022-11-23 10:19:00','1f01aa2316979fb1f978a6ecad26b7d6'),(256,2,'20220927.233140.114-financas','2022-11-23 10:19:00','902aaedcbcb6970c410475695a602572'),(257,2,'20220927.233143.138-financas','2022-11-23 10:19:00','390e14979fc05c4072e4dd14caa79168'),(258,2,'20220927.233146.165-financas','2022-11-23 10:19:00','892a2ff9fb0d39b83181f9b189e5d7fd'),(259,2,'20220927.233149.197-financas','2022-11-23 10:19:00','7804d5a86e45d04e0953a55c2ef9c651'),(260,2,'20220927.233152.220-financas','2022-11-23 10:19:00','2e2afc92d977bb6a2084c8831fe3e029'),(261,2,'20220927.233155.254-financas','2022-11-23 10:19:00','1db4394ceafebedfbf0c8a8fd7728847'),(262,2,'20220927.233158.293-financas','2022-11-23 10:19:00','c1ff60b38b6442c797a92a990432feb0'),(263,2,'20220927.233201.333-financas','2022-11-23 10:19:00','efde90082d2c014ba0ace22e636117cb'),(264,2,'20220927.233204.354-financas','2022-11-23 10:19:00','66288c24213b14a80d4b40969e094ef3'),(265,2,'20220927.233207.389-financas','2022-11-23 10:19:00','8e7d8a8dfd1ca6b2ee92d5b19e2eec1b'),(266,2,'20220927.233210.421-financas','2022-11-23 10:19:00','ca88ebe619944f3f56c37a015ae6ba28'),(267,2,'20220927.233213.451-financas','2022-11-23 10:19:00','f93c545691e00ca10e5c2fc8263a1abd'),(268,2,'20220927.233216.484-financas','2022-11-23 10:19:00','81128d4d8dfe843e850fa4e5a259ecc8'),(269,2,'20220927.233219.516-financas','2022-11-23 10:19:00','981d1a9a1eb3bbd3163d87e8d1ecd0f1'),(270,2,'20220927.233222.552-financas','2022-11-23 10:19:00','f9544369f84c88ea83596dbd464cd1b5'),(271,2,'20220927.233225.592-financas','2022-11-23 10:19:00','c6923b83d0c864d4fdb13739852b97b1'),(272,2,'20220927.233228.620-financas','2022-11-23 10:19:00','3f35506c6d3b9cc7b6dc63b1d8607bd8'),(273,2,'20220927.233231.649-financas','2022-11-23 10:19:00','33d7b0900d3a6742866beb7812817da9'),(274,2,'20220927.233234.669-financas','2022-11-23 10:19:00','1ca6665e22751f015211982f96306f51'),(275,2,'20220927.233237.700-financas','2022-11-23 10:19:00','65fb6aff4513d438e25f5dbe3944ce85'),(276,2,'20220927.233240.741-financas','2022-11-23 10:19:00','2d457b01635e52505c697422ff3cc776'),(277,2,'20220927.233243.772-financas','2022-11-23 10:19:00','b1c851052046607958ce062cfc4a88ec'),(278,2,'20220927.233246.800-financas','2022-11-23 10:19:00','48986be5c054780344ffebc16558e16d'),(279,2,'20220927.233249.833-financas','2022-11-23 10:19:00','df5737622e9e8c7758db0e986142a7e8'),(280,2,'20220927.233252.865-financas','2022-11-23 10:19:00','c6dba2d824d0845d048245f368631c3a'),(281,2,'20220927.233255.902-financas','2022-11-23 10:19:00','6b5d6116e7ea48dae8d035b965bae90e'),(282,2,'20220927.233258.928-financas','2022-11-23 10:19:00','81abd00056f1a9690c1200d9448f10b3'),(283,2,'20220927.233301.965-financas','2022-11-23 10:19:00','f900b6e1448fe9455be9fe3ce05f2ec7'),(284,2,'20220927.233304.995-financas','2022-11-23 10:19:00','fe401c2ff8aa372b9ef564ad555ebcdf'),(285,2,'20220927.233308.032-financas','2022-11-23 10:19:00','37a839bb6d0853cb75f1dd7b77b53fb8'),(286,2,'20220927.233311.065-financas','2022-11-23 10:19:00','e79f37ae8fd6f74aaedfd4314083ffed'),(287,2,'20220927.233314.087-financas','2022-11-23 10:19:00','bdcf82a674ff5323edfd132742f436b9'),(288,2,'20220927.233317.123-financas','2022-11-23 10:19:00','1be55a57108ded65262ed56d0360af00'),(289,2,'20220927.233320.152-financas','2022-11-23 10:19:00','8c173884a998824a874b2442ee1065b9'),(290,2,'20220927.233323.176-financas','2022-11-23 10:19:00','f93b7a932ce76571a68002e11b71011d'),(291,2,'20220927.233326.216-financas','2022-11-23 10:19:00','959adec6945c60fd540d30787a45edb3'),(292,2,'20220927.233329.250-financas','2022-11-23 10:19:00','d5d81b5902720274fe8a3380a7122101'),(293,2,'20220927.233332.286-financas','2022-11-23 10:19:00','12e85250f8b34efe62a304cb913f5b5d'),(294,2,'20220927.233335.309-financas','2022-11-23 10:19:00','83767115dbe60849b32ac9df34815404'),(295,2,'20220927.233338.333-financas','2022-11-23 10:19:00','861d2fda633aea88b22cc3f27972a628'),(296,2,'20220927.233341.370-financas','2022-11-23 10:19:00','e42c5e66da7c13e64bcd551213bc1059'),(297,2,'20220927.233344.403-financas','2022-11-23 10:19:00','38355769a7a46c630f30d20bd51bbe28'),(298,2,'20220927.233347.437-financas','2022-11-23 10:19:00','53aaf48b26786c831c688a3ebcf09022'),(299,2,'20220927.233350.473-financas','2022-11-23 10:19:00','860bf3d28a95dad376f853997f3855b0'),(300,2,'20220927.233353.505-financas','2022-11-23 10:19:00','26afe21531bb4442a744018599707a3f'),(301,2,'20220927.233356.539-financas','2022-11-23 10:19:00','fef62077533aca56db4d8ab5ea60b102'),(302,2,'20220927.233359.570-financas','2022-11-23 10:19:00','0dc9e29df1f6893455d3b81959f750e7'),(303,2,'20220927.233402.594-financas','2022-11-23 10:19:00','0616e94a3a3eb61a2795ce1d35712ef8'),(304,2,'20220927.233405.621-financas','2022-11-23 10:19:00','bea1a976a1a58a3ca605d3b6c48e3a9a'),(305,2,'20220927.233408.650-financas','2022-11-23 10:19:00','e9386456e2a2c1a152a2a8e97cd1c1bd'),(306,2,'20220927.233411.675-financas','2022-11-23 10:19:00','6a8b2d0c9cf57d6f4cdea682c35333ef'),(307,2,'20220927.233414.710-financas','2022-11-23 10:19:00','7d2e2c054a732a693c95b5ef36500176'),(308,2,'20220927.233417.737-financas','2022-11-23 10:19:00','d8e0459c402332e464101738f1a4f131'),(309,2,'20220927.233420.764-financas','2022-11-23 10:19:00','322a97a22dcec302e3b2293b63e34cea'),(310,2,'20220927.233423.788-financas','2022-11-23 10:19:00','c7105e24e5486994d1c45c296aa2a710'),(311,2,'20220927.233426.817-financas','2022-11-23 10:19:00','44aca5e10da45689b9ebb270549c770d'),(312,2,'20220927.233429.843-financas','2022-11-23 10:19:00','936b2d7917765ca82560f081af583042'),(313,2,'20220927.233432.871-financas','2022-11-23 10:19:00','3ab5687a1af1e2af1d4d276d6b0b3b1c'),(314,2,'20220927.233435.901-financas','2022-11-23 10:19:00','d71951cc008b23a9e33bead9af8b8129'),(315,2,'20220927.233438.928-financas','2022-11-23 10:19:00','1aacd2545b2362848baf83e4ec5ae44d'),(316,2,'20220927.233441.956-financas','2022-11-23 10:19:00','348d44cf8f5e58f388d6090a6df65743'),(317,2,'20220927.233444.994-financas','2022-11-23 10:19:00','f4736939a446e73ccd200e7c04c5bdcc'),(318,2,'20220927.233448.030-financas','2022-11-23 10:19:00','905da3615f54a5cf8166eceeb21c3434'),(319,2,'20220927.233451.058-financas','2022-11-23 10:19:00','32bfe98de75c7125b80d95f56d8a2b8b'),(320,2,'20220927.233454.093-financas','2022-11-23 10:19:00','9c78deca3f53051800ff3ef18ae47244'),(321,2,'20220927.233457.121-financas','2022-11-23 10:19:00','6a01461398656ec49adedb5b60f5df7b'),(322,2,'20220927.233500.160-financas','2022-11-23 10:19:00','0ba424d4e2771c31f1c564de1a4cce06'),(323,2,'20220927.233503.188-financas','2022-11-23 10:19:00','b389f5df88fa167ca0015b5a42de5eed'),(324,2,'20220927.233506.220-financas','2022-11-23 10:19:00','9b3965dd1292f56dca6fbe670a843447'),(325,2,'20220927.233509.252-financas','2022-11-23 10:19:00','b3e1bd5d6c97cbe82efcb5b72b230f6e'),(326,2,'20220927.233512.279-financas','2022-11-23 10:19:00','72b1e33b7c90224f66b0919388bebd0d'),(327,2,'20220927.233515.317-financas','2022-11-23 10:19:00','040e9d1df8c3257804420ddc6ca899ef'),(328,2,'20220927.233518.346-financas','2022-11-23 10:19:00','9b1e8a969fb9cdf4b19b4343dd16680b'),(329,2,'20220927.233521.383-financas','2022-11-23 10:19:00','5195262501502555484732a7a5c48d99'),(330,2,'20220927.233524.416-financas','2022-11-23 10:19:00','5183c089b0bdb2787476eddd1bd74481'),(331,2,'20220927.233527.451-financas','2022-11-23 10:19:00','8bf934ca12cdcc58b55c4d2b52d1acd6'),(332,2,'20220927.233530.482-financas','2022-11-23 10:19:00','44f7ed13ab99212d2722369d9db5fa1d'),(333,2,'20220927.233533.508-financas','2022-11-23 10:19:00','2303114de9fed3139de6eec006d590d1'),(334,2,'20220927.233536.538-financas','2022-11-23 10:19:00','67e3e11111a98237b8f40672da3010d3'),(335,2,'20220927.233539.570-financas','2022-11-23 10:19:00','dd8fe3d8e5fa0ffd01b0a69b5e51fbda'),(336,2,'20220927.233542.602-financas','2022-11-23 10:19:00','49acb953e836ac1b36249a83a149153a'),(337,2,'20220927.233545.635-financas','2022-11-23 10:19:00','2d7e777c2933768af4ccef6bd7fa9cd4'),(338,2,'20220927.233548.663-financas','2022-11-23 10:19:00','003e8e14fe0f9bd87b9321c77f4eb897'),(339,2,'20220927.233551.702-financas','2022-11-23 10:19:00','44dc20a9b524020d46f986ec7781102e'),(340,2,'20220927.233554.731-financas','2022-11-23 10:19:00','a25f10b8dd2c4a67635df7a3e6314164'),(341,2,'20220927.233557.763-financas','2022-11-23 10:19:00','92ba8ab211a9b7d7f8115f22672b0eed'),(342,2,'20220927.233600.787-financas','2022-11-23 10:19:00','883ef95a6466404a82d78954ac34f2ea'),(343,2,'20220927.233603.828-financas','2022-11-23 10:19:00','24442956f19d7e4a0174708d064e7cb1'),(344,2,'20220927.233606.856-financas','2022-11-23 10:19:00','f694702980c0eb6714971cda4d52ff41'),(345,2,'20220927.233609.882-financas','2022-11-23 10:19:00','a54bf7753e39b472322e8e70dd69b289'),(346,2,'20220927.233612.916-financas','2022-11-23 10:19:00','05b72084cbab350d932abc33959a0cb0'),(347,2,'20220927.233615.956-financas','2022-11-23 10:19:00','471a533cf90155cc0489c8fd3e522b3e'),(348,2,'20220927.233618.986-financas','2022-11-23 10:19:00','88bc52188e76015df066fb312291cb90'),(349,2,'20220927.233622.014-financas','2022-11-23 10:19:00','f7fb50bb9484dfc56457c2df83a092bf'),(350,2,'20220927.233625.042-financas','2022-11-23 10:19:00','00cece57249427342e1d940eb9d6dce5'),(351,2,'20220927.233628.079-financas','2022-11-23 10:19:00','ebdf1f098bbdff7ee21d004b6268fe53'),(352,2,'20220927.233631.113-financas','2022-11-23 10:19:00','b2cc433bf779e13f0b097846dac09a8a'),(353,2,'20220927.233634.148-financas','2022-11-23 10:19:00','7878b7ef03a15a36cbf916369d8f0034'),(354,2,'20220927.233637.174-financas','2022-11-23 10:19:00','1516b96df87a39a30eeebe3e85124b51'),(355,2,'20220927.233640.203-financas','2022-11-23 10:19:00','ca603b44fedf51f32a75f50a558801a6'),(356,2,'20220927.233643.239-financas','2022-11-23 10:19:00','d97c0539833d579b78c3e512e7725984'),(357,2,'20220927.233646.274-financas','2022-11-23 10:19:00','4cb4745b37f4dc8f56793f7d23a44818'),(358,2,'20220927.233649.314-financas','2022-11-23 10:19:00','e366b999ffb9744523cfa5983ee0bcb8'),(359,2,'20220927.233652.341-financas','2022-11-23 10:19:00','e55fdd31a529ab76d6553cdb854a71be'),(360,2,'20220927.233655.369-financas','2022-11-23 10:19:00','da4c6620a44ec3ccbbfb1b8623a44fa6'),(361,2,'20220927.233658.406-financas','2022-11-23 10:19:00','21e69b4ecb89be99b400e23c53d6b510'),(362,2,'20220927.233701.434-financas','2022-11-23 10:19:00','5d30717e2dbbc8c93b85b92508948ca4'),(363,2,'20220927.233704.470-financas','2022-11-23 10:19:00','692621fb2a35b3a1ee5814f58f1d82fe'),(364,2,'20220927.233707.503-financas','2022-11-23 10:19:00','922ebc19a5ba65cdc67f843e7d73eaaa'),(365,2,'20220927.233710.545-financas','2022-11-23 10:19:00','0e5324719e958daedb3fd376a6485f1c'),(366,2,'20220927.233713.585-financas','2022-11-23 10:19:00','ee417e8111701bf26e57873fbbf77fe5'),(367,2,'20220927.233716.615-financas','2022-11-23 10:19:00','abe41e92697ac3df6dfd7f24605f5192'),(368,2,'20220927.233719.646-financas','2022-11-23 10:19:00','33e4a10eb4a9e2b77473fb59ea4305cf'),(369,2,'20220927.233722.675-financas','2022-11-23 10:19:00','91839fce2a7f9d76097fbe6c7becd7e4'),(370,2,'20220927.233725.702-financas','2022-11-23 10:19:00','bc48c701c3aa7d3a0ba1452319867491'),(371,2,'20220927.233728.733-financas','2022-11-23 10:19:00','06f499a85689d7911bb6b85cc8351a9e'),(372,2,'20220927.233731.770-financas','2022-11-23 10:19:00','9834bde51cb44fda8176f201e9c889f9'),(373,2,'20220927.233734.803-financas','2022-11-23 10:19:00','05f12b94ee65fe456c3401e6de8a0223'),(374,2,'20220927.233737.839-financas','2022-11-23 10:19:00','82618bf8622c1989f899c6dbcdf966d5'),(375,2,'20220927.233740.871-financas','2022-11-23 10:19:00','36eb7cd154fa23e583dd7a69a1775118'),(376,2,'20220927.233743.907-financas','2022-11-23 10:19:00','143ce4b36fae84ceade808b2818c8e37'),(377,2,'20220927.233746.934-financas','2022-11-23 10:19:00','c8e050f33fb73097246f551d0c58fc0a'),(378,2,'20220927.233749.963-financas','2022-11-23 10:19:00','85d147448e1751b700eb0c6da37917a3'),(379,2,'20220927.233753.003-financas','2022-11-23 10:19:00','308e995c5d50bc5be97cf3b97472a9fb'),(380,2,'20220927.233756.033-financas','2022-11-23 10:19:00','f0af2c7cf83e74aeba9c398f2b93496d'),(381,2,'20220927.233759.067-financas','2022-11-23 10:19:00','5b4437ba339154fe0f024dd2ae94e745'),(382,2,'20220927.233802.099-financas','2022-11-23 10:19:00','6ecd24754778309eb03b7c5766e66bea'),(383,2,'20220927.233805.139-financas','2022-11-23 10:19:00','c977b41c704fdd02f37d8f1f4bd5d871'),(384,2,'20220927.233808.164-financas','2022-11-23 10:19:00','4f326aedf084e144f70601f33133746e'),(385,2,'20220927.233811.192-financas','2022-11-23 10:19:00','324d2003c658081983c3bcc52855df4d'),(386,2,'20220927.233814.222-financas','2022-11-23 10:19:00','ed029a81c435596564c6873fa82cb6da'),(387,2,'20220927.233817.252-financas','2022-11-23 10:19:00','b0a5507e8fd11be63520477c0b8b9fb6'),(388,2,'20220927.233820.280-financas','2022-11-23 10:19:00','900c2eeb4d4f3a21e3b79e9e6b243d83'),(389,2,'20220927.233823.308-financas','2022-11-23 10:19:00','6adf0956beb9d9575a7019daac3fce89'),(390,2,'20220927.233826.348-financas','2022-11-23 10:19:00','e71c269b743ba911cbfa28ea3e55e2f3'),(391,2,'20220927.233829.388-financas','2022-11-23 10:19:00','2f64236743eec43d4c851270fae9f431'),(392,2,'20220927.233832.426-financas','2022-11-23 10:19:00','08d3563823574d71f8daa609d461c3c3'),(393,2,'20220927.233835.452-financas','2022-11-23 10:19:00','2db7aad15c261a73c96343cc45ca2889'),(394,2,'20220927.233838.483-financas','2022-11-23 10:19:00','38657c181ab45148309ad2998d8f8ad4'),(395,2,'20220927.233841.510-financas','2022-11-23 10:19:00','445016e3fd40633cd72432adeb3330ca'),(396,2,'20220927.233844.540-financas','2022-11-23 10:19:00','131a17ecdab7c6c4c0768d23043e7e0f'),(397,2,'20220927.233847.567-financas','2022-11-23 10:19:00','21daa92bd70a73116d35bb30329872b8'),(398,2,'20220927.233850.604-financas','2022-11-23 10:19:00','52d7f426026fc01c7613912f6f8cf9b5'),(399,2,'20220927.233853.626-financas','2022-11-23 10:19:00','687bd2b682426ccc53d80dcb3d4315a8'),(400,2,'20220927.233856.660-financas','2022-11-23 10:19:00','0a704706c97fa6f649cf11f8ab7c0614'),(401,2,'20220927.233859.698-financas','2022-11-23 10:19:00','3d0ee1d8eb9ce40a6963a3ffbfe107e1'),(402,2,'20220927.233902.727-financas','2022-11-23 10:19:00','f76a346113baf351677497f5c0193710'),(403,2,'20220927.233905.755-financas','2022-11-23 10:19:00','47912f0c3e9c4f1e226afe0c2e00a7c0'),(404,2,'20220927.233908.783-financas','2022-11-23 10:19:00','2f1230c5c3895f876ddd298ffd3996ab'),(405,2,'20220927.233911.822-financas','2022-11-23 10:19:00','e571f9367de7342101b08eea7384472f'),(406,2,'20220927.233914.848-financas','2022-11-23 10:19:00','b6bb9e4e845f87fb4a1e314e75254319'),(407,2,'20220927.233917.883-financas','2022-11-23 10:19:00','b299c6f9366ed3307310142c797f26f8'),(408,2,'20220927.233920.911-financas','2022-11-23 10:19:00','840ca2670bdac843b557852fe3c8d718'),(409,2,'20220927.233923.943-financas','2022-11-23 10:19:00','b50dc52a280506bdd0aa578ab2bdc1bb'),(410,2,'20220927.233926.980-financas','2022-11-23 10:19:00','83eddc26ffb1a25a4e8e91e59ccc3f67'),(411,2,'20220927.233930.002-financas','2022-11-23 10:19:00','7beb1b7cf4c601da398a2dccff99bf8b'),(412,2,'20220927.233933.033-financas','2022-11-23 10:19:00','eda5da2d6b1f3f9dd517e555b0d367ff'),(413,2,'20220927.233936.059-financas','2022-11-23 10:19:00','b9821bdbfc3ba474e1679a259ac7f991'),(414,2,'20220927.233939.083-financas','2022-11-23 10:19:00','9709b14bfd6c34aaec1d00572d45c541'),(415,2,'20220927.233942.114-financas','2022-11-23 10:19:00','e965bfd6388480b7b876366348d74e1e'),(416,2,'20220927.233945.146-financas','2022-11-23 10:19:00','172d9c277fd36d237782630b83bdcbec'),(417,2,'20220927.233948.182-financas','2022-11-23 10:19:00','6dfea0a71447fc9fc2b129baa822f064'),(418,2,'20220927.233951.214-financas','2022-11-23 10:19:00','d2f7bc81d15beeb25f7397a0db3daaeb'),(419,2,'20220927.233954.246-financas','2022-11-23 10:19:00','074738c31d4b9f8f8243b8df1e5d0db8'),(420,2,'20220927.233957.277-financas','2022-11-23 10:19:00','c130851e7b81d883df6e623ecb8a00ae'),(421,2,'20220927.234000.314-financas','2022-11-23 10:19:00','7afd1147ebe5324ffaf2d9dc82c80d0f'),(422,2,'20220927.234003.355-financas','2022-11-23 10:19:00','3a81319701362ab1f88cada842a32cb9'),(423,2,'20220927.234006.387-financas','2022-11-23 10:19:00','bf144cea1fdead3233644382d177876f'),(424,2,'20220927.234009.422-financas','2022-11-23 10:19:00','a088319c3cfe8f5f0237234ecdfb29e3'),(425,2,'20220927.234012.459-financas','2022-11-23 10:19:00','07470080b569217e9cdc2c2a6acc7875'),(426,2,'20220927.234015.492-financas','2022-11-23 10:19:00','edd024d9ea6d1ba86630ebaf8cbc955a'),(427,2,'20220927.234018.526-financas','2022-11-23 10:19:00','96d46556a3a43841cf94cb65da9953fd'),(428,2,'20220927.234021.564-financas','2022-11-23 10:19:00','e3db45cd7d71e2e78c114f3ed0d83c0e'),(429,2,'20220927.234024.597-financas','2022-11-23 10:19:00','191d753ebb7eeac7098ea5b1dde2e35c'),(430,2,'20220927.234027.624-financas','2022-11-23 10:19:00','9848e5bc78945deda2577599262134a1'),(431,2,'20220927.234030.652-financas','2022-11-23 10:19:00','04a5db525313e77bd56b02ff9092e2a3'),(432,2,'20220927.234033.680-financas','2022-11-23 10:19:00','acc73fe8c07c3c5c406b9a7216948d72'),(433,2,'20220927.234036.716-financas','2022-11-23 10:19:00','907ff73eb0642c3fa3c0afd2b79bfdcf'),(434,2,'20220927.234039.750-financas','2022-11-23 10:19:00','94501f2c68856b0240b744391ada0b3c'),(435,2,'20220927.234042.783-financas','2022-11-23 10:19:00','98d42133138d695e5f866657285962a0'),(436,2,'20220927.234045.824-financas','2022-11-23 10:19:00','8dcb4c08d4117f06a89afa3857a5971d'),(437,2,'20220927.234048.861-financas','2022-11-23 10:19:00','1f4319b9c4a24a582d410a262805a67c'),(438,2,'20220927.234051.896-financas','2022-11-23 10:19:00','dd2818bbd55823c630fd8194d043922e'),(439,2,'20220927.234054.919-financas','2022-11-23 10:19:00','2c160a6f6dee27d5e631344d8ecafaec'),(440,2,'20220927.234057.948-financas','2022-11-23 10:19:00','086d78d62517828cd122ed7b2dec5741'),(441,2,'20220927.234100.982-financas','2022-11-23 10:19:00','43ecca284cadf2054463f05822483d3a'),(442,2,'20220927.234104.009-financas','2022-11-23 10:19:00','04c18b5d5ecca219e0342b754f36f5f2'),(443,2,'20220927.234107.042-financas','2022-11-23 10:19:00','1cb329842ff87e38990faf6dbcddcc3f'),(444,2,'20220927.234110.074-financas','2022-11-23 10:19:00','30ef004b6d01ea76f03afa914310145c'),(445,2,'20220927.234113.111-financas','2022-11-23 10:19:00','571e6e5ad92fb956e8500507867b9f24'),(446,2,'20220927.234116.143-financas','2022-11-23 10:19:00','5642020cb333e9fcd00932a0c232b771'),(447,2,'20220927.234119.177-financas','2022-11-23 10:19:00','331f4b30edc3f977a19b339ee9601c82'),(448,2,'20220927.234122.223-financas','2022-11-23 10:19:00','9188ffcc17267f6f0056665f64fe9cb7'),(449,2,'20220927.234125.250-financas','2022-11-23 10:19:00','404d7bef1fcdfceb4fc85dcbf53b09f8'),(450,2,'20220927.234128.279-financas','2022-11-23 10:19:00','cd4f91546ba1a7fc334c1b64d63d3cb5'),(451,2,'20220927.234131.309-financas','2022-11-23 10:19:00','96b74c46f1ef77dc9dbccb68e8772323'),(452,2,'20220927.234134.344-financas','2022-11-23 10:19:00','c0e05d7fe468fc98e0ccea8b7ba71975'),(453,2,'20220927.234137.383-financas','2022-11-23 10:19:00','b74d48b99459602abff4c7a54363e316'),(454,2,'20220927.234140.415-financas','2022-11-23 10:19:00','dea8886c1e4058855f2d91df84d78136'),(455,2,'20220927.234143.438-financas','2022-11-23 10:19:00','a5570cdc28366ecf2a7190ac6041810e'),(456,2,'20220927.234146.463-financas','2022-11-23 10:19:00','9e8f1a35e54122ef7c45a063b01a02aa'),(457,2,'20220927.234149.499-financas','2022-11-23 10:19:00','33701a16a5340d1ff21a2d3587ea8cf6'),(458,2,'20220927.234152.529-financas','2022-11-23 10:19:00','32fd2b2010b0df700e15789b70b09051'),(459,2,'20220927.234155.560-financas','2022-11-23 10:19:00','31534fa20d409cc88c575a110116bb39'),(460,2,'20220927.234158.602-financas','2022-11-23 10:19:00','feeeb2c395b7dbf8345687f2db3b20ab'),(461,2,'20220927.234201.632-financas','2022-11-23 10:19:00','52d8f34ccdf315272a329faf8304e3d3'),(462,2,'20220927.234204.659-financas','2022-11-23 10:19:00','003c4b59265cc0773b33b3dd589d94cc'),(463,2,'20220927.234207.685-financas','2022-11-23 10:19:00','e5a2d00590872765da25947ac53667ab'),(464,2,'20220927.234210.720-financas','2022-11-23 10:19:00','55a7497199dec4e453b64e11e571438e'),(465,2,'20220927.234213.750-financas','2022-11-23 10:19:00','546a23fe3df56aa57356a7baffdc0229'),(466,2,'20220927.234216.790-financas','2022-11-23 10:19:00','eb5ff6600c508fdf7e26f15b0ab6f21f'),(467,2,'20220927.234219.817-financas','2022-11-23 10:19:00','47fed7c729f2165557ea93bb4c0bc35f'),(468,2,'20220927.234222.846-financas','2022-11-23 10:19:00','67b3439739637d369cf0247df2cd47a2'),(469,2,'20220927.234225.877-financas','2022-11-23 10:19:00','a8d2f0aab4267aeac2d44d14ab6ad86b'),(470,2,'20220927.234228.905-financas','2022-11-23 10:19:00','2c78f57c0f83dc4dc0c754c33fc356b0'),(471,2,'20220927.234231.935-financas','2022-11-23 10:19:00','07761a546713703985ce539dfa46f9ea'),(472,2,'20220927.234234.973-financas','2022-11-23 10:19:00','e139f3b97d3d13bc825f4cb153307f01'),(473,2,'20220927.234237.995-financas','2022-11-23 10:19:00','e7fd52a561cf84d9835921214bfc627a'),(474,2,'20220927.234241.022-financas','2022-11-23 10:19:00','ec69da2ca8189de672204ddff20931b3'),(475,2,'20220927.234244.049-financas','2022-11-23 10:19:00','04827d46e32f2d1acf5e26b98b788f5e'),(476,2,'20220927.234247.072-financas','2022-11-23 10:19:00','0694fbeaf55245d03092cc87ffc18a06'),(477,2,'20220927.234250.102-financas','2022-11-23 10:19:00','48691450ae06f007cf84c3eee66e147e'),(478,2,'20220927.234253.132-financas','2022-11-23 10:19:00','dd4a1be543640a662fc6173c5cf5d4b6'),(479,2,'20220927.234256.154-financas','2022-11-23 10:19:00','3895174d93ce5b4edb0666cdb531dbef'),(480,2,'20220927.234259.185-financas','2022-11-23 10:19:00','7597579037b6f514c89b93a56705db99'),(481,2,'20220927.234302.226-financas','2022-11-23 10:19:00','51edcd12bb678f6126dd246850ffb8a5'),(482,2,'20220927.234305.266-financas','2022-11-23 10:19:00','197c34d657487e32936da04d8da7661f'),(483,2,'20220927.234308.285-financas','2022-11-23 10:19:00','14f73ea1ebda7527092225d75577372d'),(484,2,'20220927.234311.309-financas','2022-11-23 10:19:00','2654743ef3331ba7ce75259ab5ad66da'),(485,2,'20220927.234314.346-financas','2022-11-23 10:19:00','0236a0261c5d1ec8d1dd15fcaae1ee49'),(486,2,'20220927.234317.371-financas','2022-11-23 10:19:00','5992a6cc5c96e02326cc27339dd65bc1'),(487,2,'20220927.234320.407-financas','2022-11-23 10:19:00','1d6288dd35f06c31bc8ec24af1789a67'),(488,2,'20220927.234323.442-financas','2022-11-23 10:19:00','45aef7d6e483051ead1b55a3dac07075'),(489,2,'20220927.234326.470-financas','2022-11-23 10:19:00','367515bb51416d8941dc9641f6d144b7'),(490,2,'20220927.234329.500-financas','2022-11-23 10:19:00','6f546d7f40bfe25897e495ed8416b991'),(491,2,'20220927.234332.536-financas','2022-11-23 10:19:00','6759c3bf644528081ce89b6ffd08c74e'),(492,2,'20220927.234335.565-financas','2022-11-23 10:19:00','0ddb6b9f1a0ec266781aa4748c401d1d'),(493,2,'20220927.234338.589-financas','2022-11-23 10:19:00','b823393289bc4199040076194545d198'),(494,2,'20220927.234341.613-financas','2022-11-23 10:19:00','ac5fc1d441889ee65b9fb7153d561cb0'),(495,2,'20220927.234344.648-financas','2022-11-23 10:19:00','9826fb64d8fa023e894bdac6f1016703'),(496,2,'20220927.234347.686-financas','2022-11-23 10:19:00','3c0a4aaf932d818427d469f2162f7ed6'),(497,2,'20220927.234350.718-financas','2022-11-23 10:19:00','68b87eaa1b8b57ea9b53eaabcbe6c8bd'),(498,2,'20220927.234353.754-financas','2022-11-23 10:19:00','a957f0fe7a9c483a93ba25de6c9fccc3'),(499,2,'20220927.234356.786-financas','2022-11-23 10:19:00','91cbd7ea566e59866ac9f0a2549d4f8d'),(500,2,'20220927.234359.815-financas','2022-11-23 10:19:00','de8af4a31272032b25f344917428c15a'),(501,2,'20220927.234402.850-financas','2022-11-23 10:19:00','356c540882eca0dc67ca2f78637faa04'),(502,2,'20220927.234405.879-financas','2022-11-23 10:19:00','9b1becae7dba8adc585575761d7a9ca8'),(503,2,'20220927.234408.909-financas','2022-11-23 10:19:00','cb9adea8566fd10dd99f83b249bec031'),(504,2,'20220927.234411.945-financas','2022-11-23 10:19:00','c5905f705a44ea4f63a623d2682089d2'),(505,2,'20220927.234414.973-financas','2022-11-23 10:19:00','be6ce73e7b50a4110fe6281209d41ce6'),(506,2,'20220927.234418.005-financas','2022-11-23 10:19:00','82ac9643d5bd2da304f26bb8da37e696'),(507,2,'20220927.234421.033-financas','2022-11-23 10:19:00','f321b758acf55f6c493d949cfe4cbb61'),(508,2,'20220927.234424.053-financas','2022-11-23 10:19:00','fb1936c989994363bb632a81c346b407'),(509,2,'20220927.234427.086-financas','2022-11-23 10:19:00','81533c732e52149a6baf136beb0d347e'),(510,2,'20220927.234430.124-financas','2022-11-23 10:19:00','67539cdca4ea0344a323a848d9e6bbfc'),(511,2,'20220927.234433.150-financas','2022-11-23 10:19:00','af5798bbb9d5125606af8a1a41b2839b'),(512,2,'20220927.234436.187-financas','2022-11-23 10:19:00','c3828fca26a296797312ffd8d0695f81'),(513,2,'20220927.234439.218-financas','2022-11-23 10:19:00','11d605151a8bf7de030bba89b680b730'),(514,2,'20220927.234442.242-financas','2022-11-23 10:19:00','83170181cdbf47301a720db6e85778de'),(515,2,'20220927.234445.280-financas','2022-11-23 10:19:00','8ac71afdc12a8aaea7730755c9bf6073'),(516,2,'20220927.234448.302-financas','2022-11-23 10:19:00','49bba96f6bdf291ba582f22977ef746e'),(517,2,'20220927.234451.337-financas','2022-11-23 10:19:00','12b42bbadad54fda6c882220b372ab5e'),(518,2,'20220927.234454.363-financas','2022-11-23 10:19:00','376d1e0512c8f19972d241130f71e2e2'),(519,2,'20220927.234457.399-financas','2022-11-23 10:19:00','68434277ccf98341ec5704f75edc3f22'),(520,2,'20220927.234500.428-financas','2022-11-23 10:19:00','ae7382d0b85e12e6b3dbf483f78c634c'),(521,2,'20220927.234503.466-financas','2022-11-23 10:19:00','9d144b05d94e08412ae31b9fe4d3eba9'),(522,2,'20220927.234506.492-financas','2022-11-23 10:19:00','620b9e958d2f39fc6bcedfc048ac9214'),(523,2,'20220927.234509.515-financas','2022-11-23 10:19:00','0f7e75ff2e914d1f156edd79b454e810'),(524,2,'20220927.234512.544-financas','2022-11-23 10:19:00','ef470b9e59f5f7c9963c43e2656a6c56'),(525,2,'20220927.234515.573-financas','2022-11-23 10:19:00','42eadabbd2063be4a92009d5ba85ab19'),(526,2,'20220927.234518.607-financas','2022-11-23 10:19:00','7dfc27e054157351abf2b8541cb06f8e'),(527,2,'20220927.234521.650-financas','2022-11-23 10:19:00','e629ab3ac6ce533a002889882dc2c061'),(528,2,'20220927.234524.691-financas','2022-11-23 10:19:00','c6835a044a31cdb09a6d8a91ff4f2e0c'),(529,2,'20220927.234527.727-financas','2022-11-23 10:19:00','4e0c47a5ef1baff99ed24eb49ee4d3dc'),(530,2,'20220927.234530.755-financas','2022-11-23 10:19:00','2d9e8e5ecf46b9b1fda14ccda5c8a1ce'),(531,2,'20220927.234533.783-financas','2022-11-23 10:19:00','b86adf890ba0dea051307eb784a51ab0'),(532,2,'20220927.234536.811-financas','2022-11-23 10:19:00','623556e95c19a93a05328d884c0b0adc'),(533,2,'20220927.234539.840-financas','2022-11-23 10:19:00','af72204e86aee8f27740c8317c23bae5'),(534,2,'20220927.234542.875-financas','2022-11-23 10:19:00','023ce9a4386a98385f0e64f86ea369fe'),(535,2,'20220927.234545.915-financas','2022-11-23 10:19:00','887dd4f19ab2c406466dcae73e1728b3'),(536,2,'20220927.234548.943-financas','2022-11-23 10:19:00','4b2e6586d94b6be608cbb720e4fdd836'),(537,2,'20220927.234551.965-financas','2022-11-23 10:19:00','365f8469e9ab3ab2c8bc60ab2acbfcfa'),(538,2,'20220927.234554.999-financas','2022-11-23 10:19:00','8cd95015789f9dd60bac0ffe86936ac5'),(539,2,'20220927.234558.033-financas','2022-11-23 10:19:00','b8123f2cd356cb9e75504cf90cc7976a'),(540,2,'20220927.234601.061-financas','2022-11-23 10:19:00','4d7f599b1adbb734fb9da244aa675c76'),(541,2,'20220927.234604.087-financas','2022-11-23 10:19:00','cd59ea1dc912c1d0e3365f3f8719ef8d'),(542,2,'20220927.234607.113-financas','2022-11-23 10:19:00','4c2689812b9c18b7c40ca6f38028213f'),(543,2,'20220927.234610.142-financas','2022-11-23 10:19:00','8bef2a879a50950327ac8baed2cfb65c'),(544,2,'20220927.234613.167-financas','2022-11-23 10:19:00','7e9f3ab0861b9c997c71741400c8a34a'),(545,2,'20220927.234616.199-financas','2022-11-23 10:19:00','9ad5f2d6201c6f0f6395905effe244a8'),(546,2,'20220927.234619.225-financas','2022-11-23 10:19:00','0b8c00bf8bd4021bcdd69201779037cf'),(547,2,'20220927.234622.260-financas','2022-11-23 10:19:00','92ea14fa193786a5e8124b77c87cf68b'),(548,2,'20220927.234625.281-financas','2022-11-23 10:19:00','92979aae0253e0b5741aa36f94ca9d6b'),(549,2,'20220927.234628.310-financas','2022-11-23 10:19:00','eea700096012c926c9ffd5e577283dfc'),(550,2,'20220927.234631.345-financas','2022-11-23 10:19:00','824b65fca0a2abc78de85c3804f0dd24'),(551,2,'20220927.234634.367-financas','2022-11-23 10:19:00','ad854169bfe3941b749ce8064d01db32'),(552,2,'20220927.234637.395-financas','2022-11-23 10:19:00','5b021777c8947f54f081b1a53afeba3a'),(553,2,'20220927.234640.433-financas','2022-11-23 10:19:00','416a0b13dc81ff58e13d3b69640f8933'),(554,2,'20220927.234643.466-financas','2022-11-23 10:19:00','6e92064e8fe49766f0463b5927d281ee'),(555,2,'20220927.234646.499-financas','2022-11-23 10:19:00','7c60d189d84466ce06e4a58fa30f76aa'),(556,2,'20220927.234649.531-financas','2022-11-23 10:19:00','c793407881e9a81f33a11fc0b931ac7b'),(557,2,'20220927.234652.558-financas','2022-11-23 10:19:00','2e1f51258f7bb8e41671fbefcd338d58'),(558,2,'20220927.234655.593-financas','2022-11-23 10:19:00','1353281fc5af6bac18383b37fd6e1bc0'),(559,2,'20220927.234658.628-financas','2022-11-23 10:19:00','df25e6363e143ced28c729114864b474'),(560,2,'20220927.234701.655-financas','2022-11-23 10:19:00','bff67c2fa06926faf12f8726297569cf'),(561,2,'20220927.234704.694-financas','2022-11-23 10:19:00','dab9a8935a7ade2a726bd1e5143db111'),(562,2,'20220927.234707.731-financas','2022-11-23 10:19:00','65e4af62102c1d607d7772d713f8d445'),(563,2,'20220927.234710.762-financas','2022-11-23 10:19:00','09f04dc5d1ec5c3e77405528d64eccde'),(564,2,'20220927.234713.798-financas','2022-11-23 10:19:00','cf1167a8014bb076c42d282b116f67d8'),(565,2,'20220927.234716.828-financas','2022-11-23 10:19:00','4e1d9752f2b63eb3a795ae9f9c1627ea'),(566,2,'20220927.234719.859-financas','2022-11-23 10:19:00','a70e6d1f2fc04fc4e798b8b621fd3f34'),(567,2,'20220927.234722.892-financas','2022-11-23 10:19:00','208aa2db4474ebc51aa526dd68a41190'),(568,2,'20220927.234725.924-financas','2022-11-23 10:19:00','702eed47da92615e699ef9e2872dbcce'),(569,2,'20220927.234728.952-financas','2022-11-23 10:19:00','021fb588efafc6add51fed32015a7244'),(570,2,'20220927.234731.973-financas','2022-11-23 10:19:00','74c61114530376fb3b24bebff4a40a6f'),(571,2,'20220927.234735.011-financas','2022-11-23 10:19:00','33c684d759dc5ef7d7a1e843c700f7f4'),(572,2,'20220927.234738.038-financas','2022-11-23 10:19:00','c264ad4cb6e276597e70b61aeb973483'),(573,2,'20220927.234741.072-financas','2022-11-23 10:19:00','c8cdcd8aeefbf35293f46eff23cc570b'),(574,2,'20220927.234744.110-financas','2022-11-23 10:19:00','76a37416bd81264a6161f07faf339d30'),(575,2,'20220927.234747.131-financas','2022-11-23 10:19:00','58630328a2f8ebbef0b8b7d5accc6dc7'),(576,2,'20220927.234750.167-financas','2022-11-23 10:19:00','8ef15bbb3f38c14f2797a5a32f9a1c39'),(577,2,'20220927.234753.206-financas','2022-11-23 10:19:00','87207d9d17fcacaefbecd4265a4348bd'),(578,2,'20220927.234756.227-financas','2022-11-23 10:19:00','43c65208d982402bca3153fb19ca398a'),(579,2,'20220927.234759.250-financas','2022-11-23 10:19:00','63c17ba80a0082370a87c176e029e335'),(580,2,'20220927.234802.280-financas','2022-11-23 10:19:00','36e3fb351ea59b3248f4ed50ea25d163'),(581,2,'20220927.234805.310-financas','2022-11-23 10:19:00','76595f8bcba0243b85f63895bc52e7fd'),(582,2,'20220927.234808.348-financas','2022-11-23 10:19:00','008c53a91a0f2a0330ed5fe283baa139'),(583,2,'20220927.234811.383-financas','2022-11-23 10:19:00','06ca11a427ac8bc1ab55c4e0096db2ea'),(584,2,'20220927.234814.409-financas','2022-11-23 10:19:00','06c2740aab872ddb4061226ab6b3db23'),(585,2,'20220927.234817.434-financas','2022-11-23 10:19:00','d89f1589b5b46bb18f53070af9732fa3'),(586,2,'20220927.234820.463-financas','2022-11-23 10:19:00','3249a6d03994912ddde082cd152795b9'),(587,2,'20220927.234823.502-financas','2022-11-23 10:19:00','35bb9d7c20846df0b7c558e546817f91'),(588,2,'20220927.234826.538-financas','2022-11-23 10:19:00','0e9273c10523d6a8046ad6beeee95e3f'),(589,2,'20220927.234829.575-financas','2022-11-23 10:19:00','75ed80c7b0fc8e22362ab670a8cc5459'),(590,2,'20220927.234832.602-financas','2022-11-23 10:19:00','0327fa65d25e554ed148adb7f4ab9acc'),(591,2,'20220927.234835.630-financas','2022-11-23 10:19:00','9aa685cfe66f03388b5fe010180a14a7'),(592,2,'20220927.234838.660-financas','2022-11-23 10:19:00','24659c41b575e5fe21897d288c495b11'),(593,2,'20220927.234841.690-financas','2022-11-23 10:19:00','dfbbf04fd41aac4efdff3f277eea1264'),(594,2,'20220927.234844.722-financas','2022-11-23 10:19:00','8a1c9d9aaee18103cc153b982fb6dec9'),(595,2,'20220927.234847.754-financas','2022-11-23 10:19:00','cc28e1f7f822389e8336d0e08982976e'),(596,2,'20220927.234850.785-financas','2022-11-23 10:19:00','637976ef25f3b9f69d18aed80559370a'),(597,2,'20220927.234853.816-financas','2022-11-23 10:19:00','ddb642cc31e81c593d74db70566e2474'),(598,2,'20220927.234856.851-financas','2022-11-23 10:19:00','385644c9aec7f95343f8793175f66763'),(599,2,'20220927.234859.884-financas','2022-11-23 10:19:00','e243948e541704310d2e053bf037aeae'),(600,2,'20220927.234902.915-financas','2022-11-23 10:19:00','24842ce90d4a0ad15725f87a0326f02f'),(601,2,'20220927.234905.942-financas','2022-11-23 10:19:00','cf77886e92026f7549e880fba1a34e3f'),(602,2,'20220927.234908.972-financas','2022-11-23 10:19:00','0a94701f712e2acf089021257b45f9a0'),(603,2,'20220927.234912.012-financas','2022-11-23 10:19:00','397033250b81fa8a682ffdf2707d0663'),(604,2,'20220927.234915.041-financas','2022-11-23 10:19:00','80d69f65482cd24abd6d115e49485e38'),(605,2,'20220927.234918.072-financas','2022-11-23 10:19:00','51814f3fc5c276d1f7237f9d9368e9b4'),(606,2,'20220927.234921.102-financas','2022-11-23 10:19:00','be81a0104e943af99e0a91b0f2582d6c'),(607,2,'20220927.234924.137-financas','2022-11-23 10:19:00','cda3b42a92d4545206f2b785175ca686'),(608,2,'20220927.234927.161-financas','2022-11-23 10:19:00','83dae3ee28ce3f166a18a64a5340d473'),(609,2,'20220927.234930.194-financas','2022-11-23 10:19:00','9f2e9ab65a3fe6598a9df0aef56b9937'),(610,2,'20220927.234933.230-financas','2022-11-23 10:19:00','52c14e5e8e31bebf5c5066b539cb7206'),(611,2,'20220927.234936.271-financas','2022-11-23 10:19:00','d90b35ad48b8e99f9b279c13ebc95e5c'),(612,2,'20220927.234939.304-financas','2022-11-23 10:19:00','2c0d38bbba034991f02622156f6c1690'),(613,2,'20220927.234942.345-financas','2022-11-23 10:19:00','65fdfdd1bc0b4d9be04a605c27254530'),(614,2,'20220927.234945.373-financas','2022-11-23 10:19:00','8d15393c4fdc355ec3537def58419d21'),(615,2,'20220927.234948.402-financas','2022-11-23 10:19:00','ead7b3553d5ca99b8cb0f95c20ffffe2'),(616,2,'20220927.234951.434-financas','2022-11-23 10:19:00','9c73eda23203fd74a8eec858cd2f4b75'),(617,2,'20220927.234954.459-financas','2022-11-23 10:19:00','c9d85774fd94eb5608277272c4cb1bc7'),(618,2,'20220927.234957.495-financas','2022-11-23 10:19:00','0351a9bd2951cf73040909f25500ea5f'),(619,2,'20220927.235000.524-financas','2022-11-23 10:19:00','c8f27f7ced9de75339c1283c69a9d17f'),(620,2,'20220927.235003.563-financas','2022-11-23 10:19:00','cdd30230b46fe140f14f1a5e6281121b'),(621,2,'20220927.235006.601-financas','2022-11-23 10:19:00','a2154e184d1bf8b512f68d4456ce40d2'),(622,2,'20220927.235009.641-financas','2022-11-23 10:19:00','bbecaf78a245cefbb3a94b9fa5b24ff2'),(623,2,'20220927.235012.672-financas','2022-11-23 10:19:00','0835bf01e5fa10dba8dff017c37337d5'),(624,2,'20220927.235015.708-financas','2022-11-23 10:19:00','573d3e47cee9eeb82bccfafa57d8447c'),(625,2,'20220927.235018.735-financas','2022-11-23 10:19:00','b6afdf1f77f7b891453914f2ed97f1cb'),(626,2,'20220927.235021.757-financas','2022-11-23 10:19:00','a4cef5b116a3607a9d3f4d8f056359b2'),(627,2,'20220927.235024.793-financas','2022-11-23 10:19:00','691c23456da2b18c5a8ec7ccdd649047'),(628,2,'20220927.235027.823-financas','2022-11-23 10:19:00','60d3f491e5b3ffe57d915880c084fc3c'),(629,2,'20220927.235030.846-financas','2022-11-23 10:19:00','485093c81ce1d09b3a380ff9b4ba4008'),(630,2,'20220927.235033.878-financas','2022-11-23 10:19:00','0e955e53504274b6400ea02d2332f7bb'),(631,2,'20220927.235036.915-financas','2022-11-23 10:19:00','6b9600beadb06ddff6f4772bbac8c22f'),(632,2,'20220927.235039.947-financas','2022-11-23 10:19:00','4fdc1bd7b292d9cebd4bad827ed73af6'),(633,2,'20220927.235042.973-financas','2022-11-23 10:19:00','a3758617727b1e7925ad9bc721066772'),(634,2,'20220927.235046.013-financas','2022-11-23 10:19:00','b4ce325feaedccd9419c5075a0cc4ec7'),(635,2,'20220927.235049.050-financas','2022-11-23 10:19:00','d72daffa44f08d012cd8499e760aea71'),(636,2,'20220927.235052.078-financas','2022-11-23 10:19:00','d9304fddc4d61b95eb3657adb4046b1b'),(637,2,'20220927.235055.115-financas','2022-11-23 10:19:00','95090180563da0c1bd795703467c58aa'),(638,2,'20220927.235058.144-financas','2022-11-23 10:19:00','cf9bf3fe80ee44b1d3d04e72d5ab4dc1'),(639,2,'20220927.235101.172-financas','2022-11-23 10:19:00','8a03565e0588562d00daef472553df4e'),(640,2,'20220927.235104.194-financas','2022-11-23 10:19:00','3a6e25c2b4ae0a265c0982778e92ec36'),(641,2,'20220927.235107.216-financas','2022-11-23 10:19:00','d9294665bc37d218df5ca90e3c19e754'),(642,2,'20220927.235110.249-financas','2022-11-23 10:19:00','e96ed76b807e3a4752a26449a8782b07'),(643,2,'20220927.235113.276-financas','2022-11-23 10:19:00','9d9f8e17fe27c60150959311d8090e36'),(644,2,'20220927.235116.302-financas','2022-11-23 10:19:00','e6e88aaf6969ee3fc8b834fedb1ad88b'),(645,2,'20220927.235119.328-financas','2022-11-23 10:19:00','aee1d53b1db16054d434d1cdab30adc8'),(646,2,'20220927.235122.351-financas','2022-11-23 10:19:00','e35989a17f8009dd3e9651427861a72b'),(647,2,'20220927.235125.386-financas','2022-11-23 10:19:00','96f7592285cdd69a974e024a35d894d1'),(648,2,'20220927.235128.420-financas','2022-11-23 10:19:00','93545d34f4fb637e9f25f0541a35a37b'),(649,2,'20220927.235131.460-financas','2022-11-23 10:19:00','b6b09002fe1e0ccd559ce2a767572d3c'),(650,2,'20220927.235134.496-financas','2022-11-23 10:19:00','b715b04bbaf04ef5bdb1c2cafabc39c5'),(651,2,'20220927.235137.532-financas','2022-11-23 10:19:00','7814e91491320727f982aa725241e490'),(652,2,'20220927.235140.567-financas','2022-11-23 10:19:00','f8a13a6f42c1c237fe1a8762b87fdb2a'),(653,2,'20220927.235143.592-financas','2022-11-23 10:19:00','daf9c8baef78b929441e3f0c0eed1fd1'),(654,2,'20220927.235146.623-financas','2022-11-23 10:19:00','d3b0d67e9d1b31f026e7b15fdfcfb770'),(655,2,'20220927.235149.654-financas','2022-11-23 10:19:00','4a3ab5fc2a31c0412c37b88620f77bde'),(656,2,'20220927.235152.687-financas','2022-11-23 10:19:00','7ac667a2c0b9b91a20ef0e0184d892c5'),(657,2,'20220927.235155.719-financas','2022-11-23 10:19:00','445ea863c4b6fdc3edeab9eaf8eae8c3'),(658,2,'20220927.235158.761-financas','2022-11-23 10:19:00','9a1a919e132e069d993cbb36c89019a6'),(659,2,'20220927.235201.793-financas','2022-11-23 10:19:00','ef2257b2bc21a3bf89c8267cfdfc0f29'),(660,2,'20220927.235204.821-financas','2022-11-23 10:19:00','432e93fe5bd0601d1b2fd1159268b4de'),(661,2,'20220927.235207.849-financas','2022-11-23 10:19:00','a49e1f78a3be10d144d72aad3c9e5d30'),(662,2,'20220927.235210.873-financas','2022-11-23 10:19:00','f41046f20c1527cb1af260da0550be68'),(663,2,'20220927.235213.904-financas','2022-11-23 10:19:00','cbf76c8fa681e4878c5f4f44e11440ea'),(664,2,'20220927.235216.930-financas','2022-11-23 10:19:00','17cd3abb7dfaa8149cb40eb3f24c42ea'),(665,2,'20220927.235219.962-financas','2022-11-23 10:19:00','27d1bc8830828675853c3432b3511f9e'),(666,2,'20220927.235223.000-financas','2022-11-23 10:19:00','d1314b1f135554b8079d42fd872d20e1'),(667,2,'20220927.235226.039-financas','2022-11-23 10:19:00','4b56fa5c96a7d187f284faddf8b73912'),(668,2,'20220927.235229.077-financas','2022-11-23 10:19:00','5167026c10a5e90825d53ac721a68fd5'),(669,2,'20220927.235232.112-financas','2022-11-23 10:19:00','4aece59ac492143bfc545470c1bc961e'),(670,2,'20220927.235235.148-financas','2022-11-23 10:19:00','7478a4eb17bf711baf869db9882e856e'),(671,2,'20220927.235238.169-financas','2022-11-23 10:19:00','eb8aa31fcc5e3a7bb2997b3be3dc373a'),(672,2,'20220927.235241.201-financas','2022-11-23 10:19:00','7048e5776af37ed41acef9923c29a1c7'),(673,2,'20220927.235244.238-financas','2022-11-23 10:19:00','5233946740507e1e56d305cfbd78f786'),(674,2,'20220927.235247.273-financas','2022-11-23 10:19:00','58f73bfe9e330283a786e498f61f3c1a'),(675,2,'20220927.235250.314-financas','2022-11-23 10:19:00','886753f0e7eb9502f274fe3b9fcbc681'),(676,2,'20220927.235253.354-financas','2022-11-23 10:19:00','aef33acbdc4c19684e0d17d2e9ec7bfb'),(677,2,'20220927.235256.392-financas','2022-11-23 10:19:00','6c12d9cce37fe9891f5c63d78a35ac36'),(678,2,'20220927.235259.428-financas','2022-11-23 10:19:00','44fa18483e326ba09074d5b80ae2b9e0'),(679,2,'20220927.235302.466-financas','2022-11-23 10:19:00','1e2a43ac0e960067e75abb6066619d32'),(680,2,'20220927.235305.497-financas','2022-11-23 10:19:00','f5d2eccf366b03980ddba3af2de527fb'),(681,2,'20220927.235308.533-financas','2022-11-23 10:19:00','bd12b56d1293aaa98cafa697d7610dc4'),(682,2,'20220927.235311.562-financas','2022-11-23 10:19:00','d46116d3b42c8a2812705efd1e73d57c'),(683,2,'20220927.235314.587-financas','2022-11-23 10:19:00','e7a1688ce25d20bd4b09a2c1569b3594'),(684,2,'20220927.235317.617-financas','2022-11-23 10:19:00','6348ea0fba926980b251226a4c4cfd07'),(685,2,'20220927.235320.649-financas','2022-11-23 10:19:00','89c2f17fba2a73c6aa2904586adb3f3d'),(686,2,'20220927.235323.682-financas','2022-11-23 10:19:00','e37f363a466f96ecdd32d4b97e9b0f97'),(687,2,'20220927.235326.705-financas','2022-11-23 10:19:00','226b53085404344608e9ba2876177c6f'),(688,2,'20220927.235329.737-financas','2022-11-23 10:19:00','aa348d45e05c1d151bf87a7430e4e1c1'),(689,2,'20220927.235332.770-financas','2022-11-23 10:19:00','01d0d64736fdee391114d06be83b6512'),(690,2,'20220927.235335.808-financas','2022-11-23 10:19:00','be166a55f74d24c1b0c198be27feb6d9'),(691,2,'20220927.235338.835-financas','2022-11-23 10:19:00','731732f0b11d2db75c0d23d32c80057b'),(692,2,'20220927.235341.861-financas','2022-11-23 10:19:00','817ada28d0e793ca468e56cb3cbcb48c'),(693,2,'20220927.235344.896-financas','2022-11-23 10:19:00','adb099800907af601f7bb49ee5524bfa'),(694,2,'20220927.235347.928-financas','2022-11-23 10:19:00','cb6ec9d014aeb84d1ee9b22c5830a2ff'),(695,2,'20220927.235350.958-financas','2022-11-23 10:19:00','d49412d560c672d27c299da61408014d'),(696,2,'20220927.235353.995-financas','2022-11-23 10:19:00','b478417610e608cb82df7eb56c2e72dd'),(697,2,'20220927.235357.023-financas','2022-11-23 10:19:00','577a4c46fc53b632deceddb15f57b1fc'),(698,2,'20220927.235400.059-financas','2022-11-23 10:19:00','a0a2fcd021ee356c2a942d27797eb5ae'),(699,2,'20220927.235403.084-financas','2022-11-23 10:19:00','dc5ed3a44061c605269ea9e11cd7d309'),(700,2,'20220927.235406.119-financas','2022-11-23 10:19:00','dc2f335fc6ea3b8802e9dd8981fed5d1'),(701,2,'20220927.235409.151-financas','2022-11-23 10:19:00','53620e235e03bd0f613427993af34030'),(702,2,'20220927.235412.174-financas','2022-11-23 10:19:00','0dfc5e8eedc68766afffc313bb440e2d'),(703,2,'20220927.235415.207-financas','2022-11-23 10:19:00','9177bc79170152f09796879159555930'),(704,2,'20220927.235418.237-financas','2022-11-23 10:19:00','6d4761f356b746f58de0cb8cf8768c48'),(705,2,'20220927.235421.275-financas','2022-11-23 10:19:00','1003ae7345c5b72e4af593e811971ddd'),(706,2,'20220927.235424.300-financas','2022-11-23 10:19:00','8dadc2dbd5f650e00a950d64646515d1'),(707,2,'20220927.235427.335-financas','2022-11-23 10:19:00','6fe8b90e8e4aa9ba1a333230a7ebda97'),(708,2,'20220927.235430.368-financas','2022-11-23 10:19:00','5f2e6a90d0cf635c077f1b73f4e3c632'),(709,2,'20220927.235433.407-financas','2022-11-23 10:19:00','5eb33f97751f5815532e15c7b19b1895'),(710,2,'20220927.235436.447-financas','2022-11-23 10:19:00','b30b3a243fbfed61fa0a2462e56151a0'),(711,2,'20220927.235439.474-financas','2022-11-23 10:19:00','e1cbdb7131d006187671d67b5b92a104'),(712,2,'20220927.235442.510-financas','2022-11-23 10:19:00','a43880d935175346dc5c1649f5fce567'),(713,2,'20220927.235445.534-financas','2022-11-23 10:19:00','c924ab899e638b046dc9fa5601a6e8c6'),(714,2,'20220927.235448.567-financas','2022-11-23 10:19:00','eb31568b999c5cecb234ef308add813d'),(715,2,'20220927.235451.600-financas','2022-11-23 10:19:00','49a573d01a9d3c31d5148ec871b270b0'),(716,2,'20220927.235454.638-financas','2022-11-23 10:19:00','e1dcb35dbf734d2735ebfec6cbc8d2d5'),(717,2,'20220927.235457.667-financas','2022-11-23 10:19:00','1ad10dbaf71c05b19b7f52c1989f7fe0'),(718,2,'20220927.235500.697-financas','2022-11-23 10:19:00','26fe490d3642eea2816ddebfa883ff40'),(719,2,'20220927.235503.731-financas','2022-11-23 10:19:00','d409b1bed91238efe4fcb9be92a95539'),(720,2,'20220927.235506.752-financas','2022-11-23 10:19:00','9c182ec708be3a65d6d4e39677a59aed'),(721,2,'20220927.235509.782-financas','2022-11-23 10:19:00','1f00a276b6429ea0ceb065f3b71c9e39'),(722,2,'20220927.235512.810-financas','2022-11-23 10:19:00','afda8cf9a99c4b11e9f5ced9cc1aef4b'),(723,2,'20220927.235515.845-financas','2022-11-23 10:19:00','84c53dee7e544a7d1a5b639e2a5ce5c3'),(724,2,'20220927.235518.879-financas','2022-11-23 10:19:00','a6d26f924bb2b7e56dc441ddc8a6ca0a'),(725,2,'20220927.235521.906-financas','2022-11-23 10:19:00','74c28e370424e3765c00cdbc5de483a1'),(726,2,'20220927.235524.939-financas','2022-11-23 10:19:00','09084503b2d5ab51e6b4996a6e21a6bf'),(727,2,'20220927.235527.970-financas','2022-11-23 10:19:00','c3facbe35726179857c465a4695b660f'),(728,2,'20220927.235531.000-financas','2022-11-23 10:19:00','b7a29143788f17374eff4b9d03d8bad6'),(729,2,'20220927.235534.023-financas','2022-11-23 10:19:00','e546a76a106ba86759c0df9d7050724d'),(730,2,'20220927.235537.052-financas','2022-11-23 10:19:00','12e8ba790e780760e5e61b12f5de4a04'),(731,2,'20220927.235540.086-financas','2022-11-23 10:19:00','e7854b79f7d1434087c2d47cd8020ed0'),(732,2,'20220927.235543.124-financas','2022-11-23 10:19:00','272102a9acecf4dea6dece34968b5d5a'),(733,2,'20220927.235546.152-financas','2022-11-23 10:19:00','167fe93b232b8b17abf1c62af2509c07'),(734,2,'20220927.235549.180-financas','2022-11-23 10:19:00','28c599624eb36881f292fffba92fa6b2'),(735,2,'20220927.235552.219-financas','2022-11-23 10:19:00','71338beed0e6b714d18b8fbd6cf7bf15'),(736,2,'20220927.235555.246-financas','2022-11-23 10:19:00','9c19b327e731c4b8b455b2354ec44a3b'),(737,2,'20220927.235558.272-financas','2022-11-23 10:19:00','6d2dc2c83015fda5ec911fb57687a210'),(738,2,'20220927.235601.302-financas','2022-11-23 10:19:00','d0d17964d35363044456754f88f3989e'),(739,2,'20220927.235604.335-financas','2022-11-23 10:19:00','5069171c8162d9fcad6b595f46f46e5f'),(740,2,'20220927.235607.359-financas','2022-11-23 10:19:00','71afa099da1acd0f332128807873c7e1'),(741,2,'20220927.235610.382-financas','2022-11-23 10:19:00','7b4fd7ec65b5a71992b6087c0ea16505'),(742,2,'20220927.235613.417-financas','2022-11-23 10:19:00','f98a0de9538b3e5d3204fdaa4266f9c1'),(743,2,'20220927.235616.438-financas','2022-11-23 10:19:00','e7bc97b46f8c34de737e32b2c72b9506'),(744,2,'20220927.235619.469-financas','2022-11-23 10:19:00','2b2154bf6fb0bb7eece5af08c8804144'),(745,2,'20220927.235622.494-financas','2022-11-23 10:19:00','662255bf3ffeb3e8e3fb745ea8387890'),(746,2,'20220927.235625.524-financas','2022-11-23 10:19:00','7dc0ea1721474f8f70e8200d1ab37154'),(747,2,'20220927.235628.559-financas','2022-11-23 10:19:00','f6a1bed373b8b90b53a9c785adc984a2'),(748,2,'20220927.235631.600-financas','2022-11-23 10:19:00','38961c81254505742283f9b79dbb3b97'),(749,2,'20220927.235634.627-financas','2022-11-23 10:19:00','2c55e794eb099b12571a121f84f3ae8d'),(750,2,'20220927.235637.664-financas','2022-11-23 10:19:00','98245b36b50489a95b340bb8e7f012b9'),(751,2,'20220927.235640.695-financas','2022-11-23 10:19:01','60db0cf1765a688f66c57bd7f8c6c69f'),(752,2,'20220927.235643.725-financas','2022-11-23 10:19:01','14a8a038fe2a8ed791dc2ca63ad8c13a'),(753,2,'20220927.235646.750-financas','2022-11-23 10:19:01','3ae1ce9698609cb6b43efb4e39c2e763'),(754,2,'20220927.235649.785-financas','2022-11-23 10:19:01','b938578a7b2778a17e2f5780433512c7'),(755,2,'20220927.235652.818-financas','2022-11-23 10:19:01','16fcc69af43024fec354c4bad555b2c3'),(756,2,'20220927.235655.851-financas','2022-11-23 10:19:01','a75f52ccfe8acc217261fef091528b21'),(757,2,'20220927.235658.889-financas','2022-11-23 10:19:01','4aea19fc9d5bfeb86e3d058c840c9f34'),(758,2,'20220927.235701.929-financas','2022-11-23 10:19:01','fc0fb61bbca437b4145ea81ea4e413b3'),(759,2,'20220927.235704.953-financas','2022-11-23 10:19:01','bd8c84001b2b06f7636718892f643430'),(760,2,'20220927.235707.975-financas','2022-11-23 10:19:01','8054518eee83cabd4c1cb59e00767471'),(761,2,'20220927.235711.002-financas','2022-11-23 10:19:01','318bebcf1889ac6e3448d75bd6c41339'),(762,2,'20220927.235714.052-financas','2022-11-23 10:19:01','6f7633445253a7c1fee226802fbccd37'),(763,2,'20220927.235717.084-financas','2022-11-23 10:19:01','140a52a1b0ee5d300cd1d9c4a3f47ae2'),(764,2,'20220927.235720.105-financas','2022-11-23 10:19:01','7a18fbcf279595d17cf7adc1c84dedc4'),(765,2,'20220927.235723.141-financas','2022-11-23 10:19:01','111f9d78736c5b50e4e5070dfcac7aa2'),(766,2,'20220927.235726.169-financas','2022-11-23 10:19:01','6574eff07b5f9bee4309215b2d6f7744'),(767,2,'20220927.235729.202-financas','2022-11-23 10:19:01','9fb6b0f7586f63cd77e07f8f871bcb07'),(768,2,'20220927.235732.236-financas','2022-11-23 10:19:01','03a740fc6692f052c37047c45c77f53b'),(769,2,'20220927.235735.268-financas','2022-11-23 10:19:01','72c5e8a587d514424fc6d39143678a78'),(770,2,'20220927.235738.302-financas','2022-11-23 10:19:01','36063d3858bc2be76129e3f59bc73056'),(771,2,'20220927.235741.334-financas','2022-11-23 10:19:01','6d7e6f74acbeea004367f83b380a3df0'),(772,2,'20220927.235744.369-financas','2022-11-23 10:19:01','eb5ca26fd4b4dcad4081c7d757595ce8'),(773,2,'20220927.235747.398-financas','2022-11-23 10:19:01','fe92a247053bca696e850217891614ed'),(774,2,'20220927.235750.435-financas','2022-11-23 10:19:01','b3f1ff39720f2bf9e5c327733659adcc'),(775,2,'20220927.235753.476-financas','2022-11-23 10:19:01','58929f5f0b1b1da9732f2c9e1f208555'),(776,2,'20220927.235756.506-financas','2022-11-23 10:19:01','21e1e180d2ed97eec20a78e708f0101d'),(777,2,'20220927.235759.543-financas','2022-11-23 10:19:01','8679df95005f7df0ca805a8be9e5eec5'),(778,2,'20220927.235802.580-financas','2022-11-23 10:19:01','38da3fd93ffda0df92de40917b7301b3'),(779,2,'20220927.235805.609-financas','2022-11-23 10:19:01','3ef3597f5303ad1f55cdf21b858bcb3d'),(780,2,'20220927.235808.641-financas','2022-11-23 10:19:01','b0ce1be810e4adca94a75535eca36127'),(781,2,'20220927.235811.673-financas','2022-11-23 10:19:01','a9b9ea53aa3242e81ad52f7049ce7dde'),(782,2,'20220927.235814.705-financas','2022-11-23 10:19:01','3de9f34a6802f3e522cd15ce5bbcf74e'),(783,2,'20220927.235817.734-financas','2022-11-23 10:19:01','cd3dacd5f3f9fe14a53f50631eebbfcd'),(784,2,'20220927.235820.769-financas','2022-11-23 10:19:01','071f4de339dfed306b110745afccd309'),(785,2,'20220927.235823.807-financas','2022-11-23 10:19:01','c6b017e450b73167c3fd3f20eb7c11b0'),(786,2,'20220927.235826.843-financas','2022-11-23 10:19:01','9315e0fbd880f5470463af6d84fc7cce'),(787,2,'20220927.235829.876-financas','2022-11-23 10:19:01','123fc11a3200085f51eb6271627aa7b2'),(788,2,'20220927.235832.900-financas','2022-11-23 10:19:01','94f16039fd9e2ea9662bd8a30a6dbea4'),(789,2,'20220927.235835.926-financas','2022-11-23 10:19:01','4a1bff7f80207db234c0bce104f60c5f'),(790,2,'20220927.235838.957-financas','2022-11-23 10:19:01','88086492691807e22ac7374684d29fa3'),(791,2,'20220927.235841.991-financas','2022-11-23 10:19:01','24220d248247605d417f06c456b7d735'),(792,2,'20220927.235845.017-financas','2022-11-23 10:19:01','ed51100729c2f30ffb5bdb8ced3cdc81'),(793,2,'20220927.235848.044-financas','2022-11-23 10:19:01','a62fb81e8a8ecb2a1f9b89bff516eb85'),(794,2,'20220927.235851.083-financas','2022-11-23 10:19:01','7604b760b3a1979e844709c81d54dbc1'),(795,2,'20220927.235854.111-financas','2022-11-23 10:19:01','dc2eeb425223cae7a9fd13543584991b'),(796,2,'20220927.235857.136-financas','2022-11-23 10:19:01','5ebb753c4e00b7cbf25563123e6b5de5'),(797,2,'20220927.235900.162-financas','2022-11-23 10:19:01','2b3a380f6582eb0a7947249dae2dcb80'),(798,2,'20220927.235903.197-financas','2022-11-23 10:19:01','5006e20f5dc6980df65a18f85f102850'),(799,2,'20220927.235906.224-financas','2022-11-23 10:19:01','600472de31a4b78118f28a9f4dbff4b7'),(800,2,'20220927.235909.255-financas','2022-11-23 10:19:01','07091d5ced9b95e20c3f48083cad5941'),(801,2,'20220927.235912.287-financas','2022-11-23 10:19:01','9cd440eba4cd800584bf1f390afd2120'),(802,2,'20220927.235915.315-financas','2022-11-23 10:19:01','32370a131a04c0605059acd493076a4d'),(803,2,'20220927.235918.338-financas','2022-11-23 10:19:01','4c702eeb4dd49d0aab7755060d98f03c'),(804,2,'20220927.235921.371-financas','2022-11-23 10:19:01','5c927721562ef2420f4ef55f530964bf'),(805,2,'20220927.235924.407-financas','2022-11-23 10:19:01','20392d5e0f229ace0361982acc9745d7'),(806,2,'20220927.235927.435-financas','2022-11-23 10:19:01','1fbfd6350e4e3f2366cc041bdc44ae65'),(807,2,'20220927.235930.460-financas','2022-11-23 10:19:01','8ec7f8b533fe005311567f46f5d47b68'),(808,2,'20220927.235933.488-financas','2022-11-23 10:19:01','0891744da9dc579452487fc8e1d525f6'),(809,2,'20220927.235936.518-financas','2022-11-23 10:19:01','d0f2c22db450bce95681f61fa5440d29'),(810,2,'20220927.235939.552-financas','2022-11-23 10:19:01','da889daf5eda1224ab5bc5f23cc89612'),(811,2,'20220927.235942.589-financas','2022-11-23 10:19:01','09efe0040cdec532d7513665b160cb66'),(812,2,'20220927.235945.621-financas','2022-11-23 10:19:01','30bee29bd6702f36d885115d40fae9af'),(813,2,'20220927.235948.650-financas','2022-11-23 10:19:01','9633f078bb62cd9e173b4e9e09f55edb'),(814,2,'20220927.235951.682-financas','2022-11-23 10:19:01','06453089f2e590cf882c786d7ab3f96a'),(815,2,'20220927.235954.711-financas','2022-11-23 10:19:01','e4b14d54b73a3ac188ee72e98912aa6b'),(816,2,'20220927.235957.739-financas','2022-11-23 10:19:01','1f310a5f577f87d4875e46a9204ac86c'),(817,2,'20220928.000000.777-financas','2022-11-23 10:19:01','6ab45e378062313a3edc9efef8971c72'),(818,2,'20220928.000003.802-financas','2022-11-23 10:19:01','983e3a23a4219297b7eaa9bdb38399db'),(819,2,'20220928.000006.822-financas','2022-11-23 10:19:01','91930f37fdcb9909ead7ca78725051c8'),(820,2,'20220928.000009.863-financas','2022-11-23 10:19:01','03fbf2c979c5189fd100f6560ddc76ed'),(821,2,'20220928.000012.903-financas','2022-11-23 10:19:01','7e3ee6263a509672841f45eb2cecc2bb'),(822,2,'20220928.000015.943-financas','2022-11-23 10:19:01','5a4171b5dab656f4ba028a376f244469'),(823,2,'20220928.000018.981-financas','2022-11-23 10:19:01','3af3aa98de8b0ccfff473484671bb214'),(824,2,'20220928.000022.009-financas','2022-11-23 10:19:01','63b28a3225d667d36b4d7f6a56c8b5e1'),(825,2,'20220928.000025.041-financas','2022-11-23 10:19:01','06408c7c9bb720833092c9208d2af146'),(826,2,'20220928.000028.081-financas','2022-11-23 10:19:01','cc995576e3d4c2f15a4c754ca9210b83'),(827,2,'20220928.000031.113-financas','2022-11-23 10:19:01','0f94e40b4bd5fad352b589d385ce6fae'),(828,2,'20220928.000034.142-financas','2022-11-23 10:19:01','520255218ea0f4c13b4f613b6d606df8'),(829,2,'20220928.000037.169-financas','2022-11-23 10:19:01','b77e357fa127ef40a0f849fd3d5d70dc'),(830,2,'20220928.000040.202-financas','2022-11-23 10:19:01','a536b490491d138af9092b3938560cb8'),(831,2,'20220928.000043.228-financas','2022-11-23 10:19:01','f3ca231c4dff97b52dbaf7eae4c32772'),(832,2,'20220928.000046.263-financas','2022-11-23 10:19:01','878c12da2c33e08dbc855ca0f7c4eab5'),(833,2,'20220928.000049.305-financas','2022-11-23 10:19:01','243e083c1b03d24f3e4e8a1db8a33a42'),(834,2,'20220928.000052.334-financas','2022-11-23 10:19:01','f188d1667781d3729729f44eda901dc5'),(835,2,'20220928.000055.360-financas','2022-11-23 10:19:01','3b215ae86fddc3f110a18ce8f509bc7d'),(836,2,'20220928.000058.393-financas','2022-11-23 10:19:01','747d5c71712f70e4184a5865715658d4'),(837,2,'20220928.000101.432-financas','2022-11-23 10:19:01','e71d6cf02ae60c6c06e838c76cc635e2'),(838,2,'20220928.000104.459-financas','2022-11-23 10:19:01','8d4fcf93073aad67050431d686dbea1e'),(839,2,'20220928.000107.487-financas','2022-11-23 10:19:01','62d3dff2f5ac3535df8d4787d968fb29'),(840,2,'20220928.000110.527-financas','2022-11-23 10:19:01','85db2cd501f1d7119782a5e90fa3a2c1'),(841,2,'20220928.000113.561-financas','2022-11-23 10:19:01','0f761884bda4dc543002a7242bab7da2'),(842,2,'20220928.000116.585-financas','2022-11-23 10:19:01','558cf8678ca1d37a2900571f416e614e'),(843,2,'20220928.000119.618-financas','2022-11-23 10:19:01','1d569ee08cf20d903435838266c22254'),(844,2,'20220928.000122.659-financas','2022-11-23 10:19:01','8ecc2593c1a1450188ce5e83fead8bdc'),(845,2,'20220928.000125.688-financas','2022-11-23 10:19:01','306dd1e7dc3e6192dd47a433a06d60c2'),(846,2,'20220928.000128.722-financas','2022-11-23 10:19:01','a3e8bb81d97a95d5b68a060d488f641e'),(847,2,'20220928.000131.753-financas','2022-11-23 10:19:01','0ce0d0c6e4a0ce963da0eed0f1836ac3'),(848,2,'20220928.000134.781-financas','2022-11-23 10:19:01','3c6e2f322b3e7077ddf3a848d5143754'),(849,2,'20220928.000137.820-financas','2022-11-23 10:19:01','db860c70b3071e1131228341e85e58e3'),(850,2,'20220928.000140.842-financas','2022-11-23 10:19:01','0597834794a428785376890b327aff02'),(851,2,'20220928.000143.871-financas','2022-11-23 10:19:01','3f6118bf2e62fa9c57c63660ab1606ba'),(852,2,'20220928.000146.906-financas','2022-11-23 10:19:01','374bf1c2b7f5fc914a29438aa5975ab4'),(853,2,'20220928.000149.934-financas','2022-11-23 10:19:01','23f0d19a096d4e3b2534a09f628bda97'),(854,2,'20220928.000152.956-financas','2022-11-23 10:19:01','59eb0918bf896fe654a8c60eb044829f'),(855,2,'20220928.000155.994-financas','2022-11-23 10:19:01','d1153a6f8e437875d3d1be5aa849f72a'),(856,2,'20220928.000159.026-financas','2022-11-23 10:19:01','d4ec5f383d9e45df27793823637f6137'),(857,2,'20220928.000202.058-financas','2022-11-23 10:19:01','f01fa89969e62d308bb9eb116340d131'),(858,2,'20220928.000205.078-financas','2022-11-23 10:19:01','9b2452e587d7a76ff128d6ba5a138252'),(859,2,'20220928.000208.110-financas','2022-11-23 10:19:01','2034e1e8730a3cadfa39f9d45c07e641'),(860,2,'20220928.000211.138-financas','2022-11-23 10:19:01','c01db9bf53d542d46f5ca55a7be05376'),(861,2,'20220928.000214.166-financas','2022-11-23 10:19:01','85e5cb637489544a3517310f185f4bbb'),(862,2,'20220928.000217.206-financas','2022-11-23 10:19:01','47b97555a1fba7a634c96d04618e2a13'),(863,2,'20220928.000220.226-financas','2022-11-23 10:19:01','05109a68f4dec22ed22c97cc1286d757'),(864,2,'20220928.000223.258-financas','2022-11-23 10:19:01','3bd98026bfb6e2aac79af9975273e40b'),(865,2,'20220928.000226.295-financas','2022-11-23 10:19:01','d3cc74117fba02721a53bfc45bdd0c83'),(866,2,'20220928.000229.320-financas','2022-11-23 10:19:01','d3a21f7270e17259214b0aaecebf5c31'),(867,2,'20220928.000232.351-financas','2022-11-23 10:19:01','314bab7176e8da648b242bbf464267c4'),(868,2,'20220928.000235.389-financas','2022-11-23 10:19:01','7d182562772ecbbf3c0e5634e7097afa'),(869,2,'20220928.000238.415-financas','2022-11-23 10:19:01','746b1617cce64198eb96846787b34275'),(870,2,'20220928.000241.445-financas','2022-11-23 10:19:01','22d4e5bcf4567d700118c1cba8f934f8'),(871,2,'20220928.000244.477-financas','2022-11-23 10:19:01','cdb66fec4a2982a6a1ea51ed800342dc'),(872,2,'20220928.000247.501-financas','2022-11-23 10:19:01','7809aa3980e73b1e1dbf2cb455a84233'),(873,2,'20220928.000250.533-financas','2022-11-23 10:19:01','5423cd3a4a3e834d5d5ed3598cb65569'),(874,2,'20220928.000253.562-financas','2022-11-23 10:19:01','018c84ff6ce029e810493ec5b3d056b5'),(875,2,'20220928.000256.601-financas','2022-11-23 10:19:01','2181f103801f82c791fbd9a139327209'),(876,2,'20220928.000259.628-financas','2022-11-23 10:19:01','e7c0525c188fc5a0088cb699d29fd22c'),(877,2,'20220928.000302.658-financas','2022-11-23 10:19:01','96322e4edf94bcccaeb5d12b9d0f6274'),(878,2,'20220928.000305.684-financas','2022-11-23 10:19:01','0811070be04e8142108fe964b47572f4'),(879,2,'20220928.000308.714-financas','2022-11-23 10:19:01','4ff0a174ba232cd3fbe25cf0def52bc9'),(880,2,'20220928.000311.741-financas','2022-11-23 10:19:01','3131f6b606277cca36078b3657e96e67'),(881,2,'20220928.000314.771-financas','2022-11-23 10:19:01','95009f65c07ddd507d32a07f09b38616'),(882,2,'20220928.000317.799-financas','2022-11-23 10:19:01','78eec4ebb3f5c6ab9c29bec155e0c37d'),(883,2,'20220928.000320.836-financas','2022-11-23 10:19:01','af9e2ab130860fa0b1164f0bd02d1a69'),(884,2,'20220928.000323.866-financas','2022-11-23 10:19:01','d1ffea554b0a164cd5b626684740d62b'),(885,2,'20220928.000326.888-financas','2022-11-23 10:19:01','67dc2a834c48b8e6fa3eb54c95be94c1'),(886,2,'20220928.000329.925-financas','2022-11-23 10:19:01','674b5874db94fc4bb55d08003de3d5b6'),(887,2,'20220928.000332.967-financas','2022-11-23 10:19:01','813a4909b3534563650504490179f76c'),(888,2,'20220928.000335.991-financas','2022-11-23 10:19:01','dc9b2f42e70a337b1c29f7934196c44d'),(889,2,'20220928.000339.022-financas','2022-11-23 10:19:01','f26bfdcb30f2e49889e22881e7d6304d'),(890,2,'20220928.000342.050-financas','2022-11-23 10:19:01','e8d5c90ebd6065e1adb40b78a0c7a78d'),(891,2,'20220928.000345.072-financas','2022-11-23 10:19:01','b8356199560ebb1eaf4a98e9c5a0b201'),(892,2,'20220928.000348.111-financas','2022-11-23 10:19:01','7e262e1d657caa361f4bf567c295a23f'),(893,2,'20220928.000351.138-financas','2022-11-23 10:19:01','896d3cadda4dba4cdf6e3c61322bd945'),(894,2,'20220928.000354.170-financas','2022-11-23 10:19:01','381dda671a18845d930cb2832ddbb94f'),(895,2,'20220928.000357.198-financas','2022-11-23 10:19:01','34c750779d0310cc81a4e827cb2e097f'),(896,2,'20220928.000400.229-financas','2022-11-23 10:19:01','8e0eecaa09ad6b7803daa12acf4873d1'),(897,2,'20220928.000403.254-financas','2022-11-23 10:19:01','9b05bf09ff1283ce2619a72d3cf61c1b'),(898,2,'20220928.000406.288-financas','2022-11-23 10:19:01','c1f71e4a524c1702c35fa8588acaac3c'),(899,2,'20220928.000409.316-financas','2022-11-23 10:19:01','86bcd318276c3131b9d35fe6f02c8504'),(900,2,'20220928.000412.356-financas','2022-11-23 10:19:01','cece48db26849918522f08b56f6d0075'),(901,2,'20220928.000415.390-financas','2022-11-23 10:19:01','44c3cf6ab55d0f64a1ccff143f015a96'),(902,2,'20220928.000418.428-financas','2022-11-23 10:19:01','e803c43cf79d56e2611ce8baee2a63a8'),(903,2,'20220928.000421.451-financas','2022-11-23 10:19:01','229b012830e2a7e5e546afbc5496ed9a'),(904,2,'20220928.000424.491-financas','2022-11-23 10:19:01','5d21f4aafc01579e62f7ab5a4f3f60ca'),(905,2,'20220928.000427.532-financas','2022-11-23 10:19:01','077a2430837f275bfbe3287784200652'),(906,2,'20220928.000430.557-financas','2022-11-23 10:19:01','b605b64268ebfb2ab8c80a07d918658c'),(907,2,'20220928.000433.586-financas','2022-11-23 10:19:01','93db27f3e8b656e4442732ffd95c178c'),(908,2,'20220928.000436.627-financas','2022-11-23 10:19:01','f0a99f5bf8bf6cd0d5de4b7f52d47bc1'),(909,2,'20220928.000439.659-financas','2022-11-23 10:19:01','ca516ad2277d8d9dd665762d1cff678d'),(910,2,'20220928.000442.697-financas','2022-11-23 10:19:01','dd5b03cba9fdf761043c7dce78460648'),(911,2,'20220928.000445.727-financas','2022-11-23 10:19:01','7c51b4ca024ba3305942254ab67fa4b7'),(912,2,'20220928.000448.754-financas','2022-11-23 10:19:01','c6b630d3c8b3ecf1b88c8c36bc526b53'),(913,2,'20220928.000451.790-financas','2022-11-23 10:19:01','d4a808cb1024957d52a24ebfa4358ce5'),(914,2,'20220928.000454.830-financas','2022-11-23 10:19:01','ced1d1706c0b355b9596aeaee334f5d7'),(915,2,'20220928.000457.858-financas','2022-11-23 10:19:01','74082396cd9756d97e110a8ab935f31a'),(916,2,'20220928.000500.883-financas','2022-11-23 10:19:01','fba0dbb0030d24acf6db8fc0069953a5'),(917,2,'20220928.000503.923-financas','2022-11-23 10:19:01','c8d12dac22f5b2e5ef3a3a96c09603ca'),(918,2,'20220928.000506.955-financas','2022-11-23 10:19:01','968654123ae5474d494fb63515a36530'),(919,2,'20220928.000509.991-financas','2022-11-23 10:19:01','1d8b676f25d1cc962a5d6a7a458a8376'),(920,2,'20220928.000513.015-financas','2022-11-23 10:19:01','7c125facffe43cbacefb1570ec9c7f35'),(921,2,'20220928.000516.050-financas','2022-11-23 10:19:01','fa2697792e9dd8473022d276a4e11ea8'),(922,2,'20220928.000519.083-financas','2022-11-23 10:19:01','47719e85eadb1dccd43f465323cc3002'),(923,2,'20220928.000522.115-financas','2022-11-23 10:19:01','b45d9fc4d4a561783bdd80ff70747eae'),(924,2,'20220928.000525.156-financas','2022-11-23 10:19:01','81d94334b234395e51e08c1d1e7713e6'),(925,2,'20220928.000528.187-financas','2022-11-23 10:19:01','afb820ca41fb0e0ba0466c39595e19a1'),(926,2,'20220928.000531.223-financas','2022-11-23 10:19:01','de8809571ba36eb9b846d26175ea412e'),(927,2,'20220928.000534.253-financas','2022-11-23 10:19:01','6daf95f515ce44a1b0395425cc6866af'),(928,2,'20220928.000537.274-financas','2022-11-23 10:19:01','b37b03a0fca5a140289627e79daaba5c'),(929,2,'20220928.000540.310-financas','2022-11-23 10:19:01','a75531ea82688951e5f8efe29c611cdb'),(930,2,'20220928.000543.338-financas','2022-11-23 10:19:01','b48e0fabe5cfcce12937b020c316e7d6'),(931,2,'20220928.000546.372-financas','2022-11-23 10:19:01','02e41addb89262db1810fbb3638f0717'),(932,2,'20220928.000549.408-financas','2022-11-23 10:19:01','3f88594dab0f0ebd6936507e29a24209'),(933,2,'20220928.000552.450-financas','2022-11-23 10:19:01','75dbc8ba29d89af8e05c831f5b38230d'),(934,2,'20220928.000555.478-financas','2022-11-23 10:19:01','73d9a37d42a43a929f5e83c115dcfb0e'),(935,2,'20220928.000558.508-financas','2022-11-23 10:19:01','b891caac3953456a0f06e15b8c405b00'),(936,2,'20220928.000601.544-financas','2022-11-23 10:19:01','0909de1a2ee84dd8e13a1e5fc3aad5e0'),(937,2,'20220928.000604.564-financas','2022-11-23 10:19:01','3b71c255596d961db5b0ea29c8ab0c32'),(938,2,'20220928.000607.588-financas','2022-11-23 10:19:01','11f6c8be13452ce12d224a514dead3e5'),(939,2,'20220928.000610.626-financas','2022-11-23 10:19:01','33811c9d487973c1f93de73090bbea9c'),(940,2,'20220928.000613.667-financas','2022-11-23 10:19:01','580ac5faad51c3a7ecc420e6e9e69845'),(941,2,'20220928.000616.703-financas','2022-11-23 10:19:01','181dc97083031100a3556f1ba25e4bdb'),(942,2,'20220928.000619.731-financas','2022-11-23 10:19:01','867f73f1f405cf45a6fd268db28c9fee'),(943,2,'20220928.000622.761-financas','2022-11-23 10:19:01','7a46a81298289fc833136505b8c58a6a'),(944,2,'20220928.000625.789-financas','2022-11-23 10:19:01','60b26fe20b8a2cce9c9d37da4a1a2a56'),(945,2,'20220928.000628.819-financas','2022-11-23 10:19:01','31c2dd7c394fcb1b6886a45e2c091e91'),(946,2,'20220928.000631.844-financas','2022-11-23 10:19:01','b82f4dba814e00e31cbf71345da77b60'),(947,2,'20220928.000634.882-financas','2022-11-23 10:19:01','6a2ed0bba05348c006706c851a89e678'),(948,2,'20220928.000637.921-financas','2022-11-23 10:19:01','6e7e0ef6eae529598d244446afc579b3'),(949,2,'20220928.000640.954-financas','2022-11-23 10:19:01','ce63c7c7f1abceb49ba5014886a83568'),(950,2,'20220928.000643.980-financas','2022-11-23 10:19:01','aa0717b84f92d5b77dcb4195a131a070'),(951,2,'20220928.000647.008-financas','2022-11-23 10:19:01','975d66ee061fb21a21f25f4016807f61'),(952,2,'20220928.000650.050-financas','2022-11-23 10:19:01','79064f56d774b59e41d8d531309b6a25'),(953,2,'20220928.000653.076-financas','2022-11-23 10:19:01','5f64f6a54a819157fee0e46d56ba13c1'),(954,2,'20220928.000656.104-financas','2022-11-23 10:19:01','f9f46cdd1cfd8d09c596a11c1abb9263'),(955,2,'20220928.000659.138-financas','2022-11-23 10:19:01','cf8f3c1fa959a3f7ef0e946460d3ee2d'),(956,2,'20220928.000702.173-financas','2022-11-23 10:19:01','a860bf6467eb37ea5115a1750c15d836'),(957,2,'20220928.000705.207-financas','2022-11-23 10:19:01','33bf6937cb6ca075cdd0bd41ee03e74c'),(958,2,'20220928.000708.236-financas','2022-11-23 10:19:01','3269a64df54a4f4d731e9f0034853554'),(959,2,'20220928.000711.264-financas','2022-11-23 10:19:01','ce1678c6ca11151a4405697f556c7049'),(960,2,'20220928.000714.288-financas','2022-11-23 10:19:01','2d8945240d2a7531828f525aa71e3eb1'),(961,2,'20220928.000717.326-financas','2022-11-23 10:19:01','baf0f085ba7441940d7be31c42dbc715'),(962,2,'20220928.000720.359-financas','2022-11-23 10:19:01','c150e610742decd2640bb51657aa42b0'),(963,2,'20220928.000723.400-financas','2022-11-23 10:19:01','c5d8de3cdc020a334384b58ee19405e2'),(964,2,'20220928.000726.434-financas','2022-11-23 10:19:01','89eb9b5ac41f2e9857616e7e0633ecbf'),(965,2,'20220928.000729.468-financas','2022-11-23 10:19:01','3ac82b5cb3271aad806dc0a1051ef8ec'),(966,2,'20220928.000732.501-financas','2022-11-23 10:19:01','5864e7a956353b15b1e43ef1614c1b88'),(967,2,'20220928.000735.533-financas','2022-11-23 10:19:01','646367d3e2228062c3ba4ea7699bc3e2'),(968,2,'20220928.000738.567-financas','2022-11-23 10:19:01','88ded0883fc9d0b502c1ccfad9dde22f'),(969,2,'20220928.000741.592-financas','2022-11-23 10:19:01','78d6b86b45da9d8072b001c0d926d547'),(970,2,'20220928.000744.622-financas','2022-11-23 10:19:01','925fcf6d6efa8fbf1b718b8e9492671e'),(971,2,'20220928.000747.645-financas','2022-11-23 10:19:01','ec1a61e4c104ba76f04cd13bd785e94c'),(972,2,'20220928.000750.686-financas','2022-11-23 10:19:01','d3d929bdabe4a0e5023c1c1be4226068'),(973,2,'20220928.000753.718-financas','2022-11-23 10:19:01','8239fa977619d19a1177548dc67d5f43'),(974,2,'20220928.000756.745-financas','2022-11-23 10:19:01','dfb1b7c1ccac63c8301ea6a1a62f84fa'),(975,2,'20220928.000759.767-financas','2022-11-23 10:19:01','7ddc396501e99e0a7042bdd71c1766b0'),(976,2,'20220928.000802.796-financas','2022-11-23 10:19:01','b89dfe67f73e6de46021ab963f3d2772'),(977,2,'20220928.000805.827-financas','2022-11-23 10:19:01','8befae02e21ae09662cca0cd7786d4ce'),(978,2,'20220928.000808.858-financas','2022-11-23 10:19:01','c1bce59697b6698b3800a7744eac52f9'),(979,2,'20220928.000811.893-financas','2022-11-23 10:19:01','f3dff05c2d1c382fc6fdd421d26ea155'),(980,2,'20220928.000814.920-financas','2022-11-23 10:19:01','1d12cfa3d5d312b2f6063b6b9af1a5b5'),(981,2,'20220928.000817.950-financas','2022-11-23 10:19:01','527ea29540db61edfcbf33a2f4d93dbb'),(982,2,'20220928.000820.970-financas','2022-11-23 10:19:01','f9d969b79a2faa54e71033f2528b4f72'),(983,2,'20220928.000823.991-financas','2022-11-23 10:19:01','2d4a6c8ca4f8203d1a3bb1f426d77e17'),(984,2,'20220928.000827.017-financas','2022-11-23 10:19:01','8c6e9dc4f91433404bcc50a226655e5f'),(985,2,'20220928.000830.051-financas','2022-11-23 10:19:01','c7fa30277d3344e5cb430a81daaef4cc'),(986,2,'20220928.000833.075-financas','2022-11-23 10:19:01','31e2bd368c18354134a403bf3e74e278'),(987,2,'20220928.000836.114-financas','2022-11-23 10:19:01','d385280bf5f9aa235b40e430e9fbd4dd'),(988,2,'20220928.000839.133-financas','2022-11-23 10:19:01','42265582aa0c727fc0726e4ca2962385'),(989,2,'20220928.000842.159-financas','2022-11-23 10:19:01','e3f091ba1fa3534216d1727a45d52e3a'),(990,2,'20220928.000845.191-financas','2022-11-23 10:19:01','1e97926995817a079b08a72a7e9cc49d'),(991,2,'20220928.000848.226-financas','2022-11-23 10:19:01','1fb64a95d2ff92bafd9d8cfdae64d4c8'),(992,2,'20220928.000851.258-financas','2022-11-23 10:19:01','cee0970febeafaa6cc87176e70a59435'),(993,2,'20220928.000854.278-financas','2022-11-23 10:19:01','bab9e7fac6821a151019416575477c69'),(994,2,'20220928.000857.314-financas','2022-11-23 10:19:01','cf60ae305b5c12fd1005a240054e3993'),(995,2,'20220928.000900.341-financas','2022-11-23 10:19:01','83899551d9b436c7db4da2cdbb01e6bf'),(996,2,'20220928.000903.379-financas','2022-11-23 10:19:01','822bcae9a35aef543913590daf8bf503'),(997,2,'20220928.000906.405-financas','2022-11-23 10:19:01','4bcd6cf59bb3ed2e8a14aeeb26518d99'),(998,2,'20220928.000909.435-financas','2022-11-23 10:19:01','3931ca725f7fc3aefec90e96643b3d0e'),(999,2,'20220928.000912.472-financas','2022-11-23 10:19:01','54a2c7e886a1fb16df8b44545784db9b'),(1000,2,'20220928.000915.501-financas','2022-11-23 10:19:01','2651db1fd4216a03e672e70b98a3d3d5'),(1001,2,'20220928.000918.537-financas','2022-11-23 10:19:01','b17e982164e3bef0adc2785d06ca166d'),(1002,2,'20220928.000921.566-financas','2022-11-23 10:19:01','f4c77fed6057010c6c9866dfbdbf54cb'),(1003,2,'20220928.000924.597-financas','2022-11-23 10:19:01','81e0a64e33e3d24e059fc63a1cd57f30'),(1004,2,'20220928.000927.634-financas','2022-11-23 10:19:01','b99cffd78fb9285363aa8865686fc641'),(1005,2,'20220928.000930.662-financas','2022-11-23 10:19:01','d951ff13b0627044b4fbc83db1146217'),(1006,2,'20220928.000933.690-financas','2022-11-23 10:19:01','a502d2e76395c7951cd673195a746248'),(1007,2,'20220928.000936.726-financas','2022-11-23 10:19:01','b367340b53ba96ab32bc3157007b541f'),(1008,2,'20220928.000939.759-financas','2022-11-23 10:19:01','d67c538aa593499bd87c9af8bdd8e331'),(1009,2,'20220928.000942.790-financas','2022-11-23 10:19:01','1d852050a9491bf56735c428de26a4ed'),(1010,2,'20220928.000945.820-financas','2022-11-23 10:19:01','e4b1999453dddf336980f2ff53556d8c'),(1011,2,'20220928.000948.853-financas','2022-11-23 10:19:01','35152e7712ad623d6432e5fe2fa3267a'),(1012,2,'20220928.000951.893-financas','2022-11-23 10:19:01','5681f7e25e3e9b8fc1c6b3757608fdb9'),(1013,2,'20220928.000954.921-financas','2022-11-23 10:19:01','557a580da44cbc2fc631587bdd565836'),(1014,2,'20220928.000957.956-financas','2022-11-23 10:19:01','2796d13328db93361ed2a77a4b46d4c2'),(1015,2,'20220928.001000.995-financas','2022-11-23 10:19:01','57730160bafc25ae4e8737978ad954ee'),(1016,2,'20220928.001004.029-financas','2022-11-23 10:19:01','670bf57ee634b0a87d2a332388ecd6f4'),(1017,2,'20220928.001007.053-financas','2022-11-23 10:19:01','29a9910baa241d5c71837328a152f7d5'),(1018,2,'20220928.001010.083-financas','2022-11-23 10:19:01','445cf8824cae8d16075b5dae742fd52e'),(1019,2,'20220928.001013.112-financas','2022-11-23 10:19:01','e4af2458b53f649ce5a188435003b498'),(1020,2,'20220928.001016.152-financas','2022-11-23 10:19:01','d6f26ae1db9b9412d8551b7224eba9d7'),(1021,2,'20220928.001019.181-financas','2022-11-23 10:19:01','9fbacbc12399231e0662a6544e10d87f'),(1022,2,'20220928.001022.212-financas','2022-11-23 10:19:01','0db74b4fee69984ea383e8d5e357b95d'),(1023,2,'20220928.001025.248-financas','2022-11-23 10:19:01','8cc1dc89d10a3aa68e158223b8343ef5'),(1024,2,'20220928.001028.277-financas','2022-11-23 10:19:01','4019148b73fd71ddba6dc22ad06d395f'),(1025,2,'20220928.001031.307-financas','2022-11-23 10:19:01','11b5fadae1aff7c537a32a82f04ba8d4'),(1026,2,'20220928.001034.339-financas','2022-11-23 10:19:01','e9843161b618530d60876031bc945f2d'),(1027,2,'20220928.001037.359-financas','2022-11-23 10:19:01','4e73143ff5cafc53d9ad05c1485d57d5'),(1028,2,'20220928.001040.393-financas','2022-11-23 10:19:01','1989ad3f6b8c7c010a649eb9e732ff17'),(1029,2,'20220928.001043.426-financas','2022-11-23 10:19:01','4fb93a9d302cbc35561c40701f26288f'),(1030,2,'20220928.001046.452-financas','2022-11-23 10:19:01','51abcc904cb961f5179f07c709bab5a7'),(1031,2,'20220928.001049.483-financas','2022-11-23 10:19:01','b3715bb575e927a3b0447c956043cb94'),(1032,2,'20220928.001052.524-financas','2022-11-23 10:19:01','a9919b2f33ff405d097184978f932817'),(1033,2,'20220928.001055.558-financas','2022-11-23 10:19:01','7c1c73907b291802372e7c677eab9bbf'),(1034,2,'20220928.001058.601-financas','2022-11-23 10:19:01','acdac6d695ef301fd17df69f1c20018f'),(1035,2,'20220928.001101.633-financas','2022-11-23 10:19:01','abc07521710ed3edbc498db305103f26'),(1036,2,'20220928.001104.657-financas','2022-11-23 10:19:01','0f1df1338eafdd0eb1ccd8a9f2a7df83'),(1037,2,'20220928.001107.695-financas','2022-11-23 10:19:01','072dcf9b9ce9e2b2e18904c4648a85b6'),(1038,2,'20220928.001110.735-financas','2022-11-23 10:19:01','bbf5297a585601bf67b87f446256e90f'),(1039,2,'20220928.001113.775-financas','2022-11-23 10:19:01','b37fb767699ca978e10fce2f8b769895'),(1040,2,'20220928.001116.803-financas','2022-11-23 10:19:01','1e94d11647e5db075d00c6afd7029d01'),(1041,2,'20220928.001119.834-financas','2022-11-23 10:19:01','1cecc9f1d67417ec5d46b38cc9d5e454'),(1042,2,'20220928.001122.856-financas','2022-11-23 10:19:01','64c8e04097f493dab37b1d0b1335cb29'),(1043,2,'20220928.001125.889-financas','2022-11-23 10:19:01','d529b03dd599a30b42769dc1f9824047'),(1044,2,'20220928.001128.921-financas','2022-11-23 10:19:01','c26774c257060a747ce59f3d68a8f6c9'),(1045,2,'20220928.001131.962-financas','2022-11-23 10:19:01','7f5d60aa9cc594a10cae199f5a88eaa3'),(1046,2,'20220928.001134.990-financas','2022-11-23 10:19:01','b2459e1725ad7d9354981c81fbe93714'),(1047,2,'20220928.001138.026-financas','2022-11-23 10:19:01','4e84c2cd1ce31df4e174722289445c75'),(1048,2,'20220928.001141.052-financas','2022-11-23 10:19:01','b8a7541e1341d3a0a236fdf37263c6a6'),(1049,2,'20220928.001144.081-financas','2022-11-23 10:19:01','7e2b6066b2bccaf76f9bbc766f9f13b7'),(1050,2,'20220928.001147.123-financas','2022-11-23 10:19:01','3cae9b0692e2ae8bbbbe172bac26490a'),(1051,2,'20220928.001150.151-financas','2022-11-23 10:19:01','539b26a4ae9f141dfc76cb7a94c1d6f6'),(1052,2,'20220928.001153.173-financas','2022-11-23 10:19:01','9e1e049b2c344c8936e14e3020e28284'),(1053,2,'20220928.001156.206-financas','2022-11-23 10:19:01','7565f24a3eed6f7eb819a8096f933944'),(1054,2,'20220928.001159.245-financas','2022-11-23 10:19:01','2795c47cd77a72f4c22b535c69d2341c'),(1055,2,'20220928.001202.273-financas','2022-11-23 10:19:01','198df901ccdce67c8fb6adc11a3b28de'),(1056,2,'20220928.001205.305-financas','2022-11-23 10:19:01','aef43f22a29954d92f3204bba6ecbc59'),(1057,2,'20220928.001208.339-financas','2022-11-23 10:19:01','dd6223f361abf3f944eebe4548ed10fe'),(1058,2,'20220928.001211.375-financas','2022-11-23 10:19:01','3956146f4d8a837c1ff3965e151b37c5'),(1059,2,'20220928.001214.407-financas','2022-11-23 10:19:01','78c750bb657e835f14aa08e8bb5a3b7b'),(1060,2,'20220928.001217.433-financas','2022-11-23 10:19:01','e3dda826fc22cb7e4ed432008b1f07ff'),(1061,2,'20220928.001220.463-financas','2022-11-23 10:19:01','2922b3523081fede086e502b01c1aa67'),(1062,2,'20220928.001223.491-financas','2022-11-23 10:19:01','37bfe98fd2ad36c749d1f1d2e383d331'),(1063,2,'20220928.001226.518-financas','2022-11-23 10:19:01','7209b0ff97058a9b0a102d962f8cf788'),(1064,2,'20220928.001229.546-financas','2022-11-23 10:19:01','8340e7fa5258321f86cb927ce0f24ab1'),(1065,2,'20220928.001232.578-financas','2022-11-23 10:19:01','52955ed79d70aa54c9f693f2735217ed'),(1066,2,'20220928.001235.619-financas','2022-11-23 10:19:01','1d46dddc5de92cb351f39541f582412a'),(1067,2,'20220928.001238.658-financas','2022-11-23 10:19:01','7c81455904934cf69902ede9ca8bdd12'),(1068,2,'20220928.001241.691-financas','2022-11-23 10:19:01','dc96e92f68fd714d38ee310219cb8683'),(1069,2,'20220928.001244.721-financas','2022-11-23 10:19:01','5be9e214b8d40953230fa8f992485a62'),(1070,2,'20220928.001247.753-financas','2022-11-23 10:19:01','a0dbc5c15c7995a3e4e9a15366960b17'),(1071,2,'20220928.001250.785-financas','2022-11-23 10:19:01','9302506501b8754e27865dfef69789fd'),(1072,2,'20220928.001253.812-financas','2022-11-23 10:19:01','db3aa873f6cec6c166eb1e140f4b65da'),(1073,2,'20220928.001256.838-financas','2022-11-23 10:19:01','e95c4f5018f0d23e3d1f3c5d71381933'),(1074,2,'20220928.001259.867-financas','2022-11-23 10:19:01','706c4ebd55e969a2319aaf791eb006eb'),(1075,2,'20220928.001302.909-financas','2022-11-23 10:19:01','8037cd00b1aaa29ae6257eca8aabc274'),(1076,2,'20220928.001305.942-financas','2022-11-23 10:19:01','55c5a5145c9fc4fc3f570307083f7c70'),(1077,2,'20220928.001308.980-financas','2022-11-23 10:19:01','94a3b617393d4391017a7e123ebb01ba'),(1078,2,'20220928.001312.010-financas','2022-11-23 10:19:01','c428963fce0bea0068263b5b14d33043'),(1079,2,'20220928.001315.039-financas','2022-11-23 10:19:01','5b383bca0f78b3cd277c2a4d0f87cbae'),(1080,2,'20220928.001318.070-financas','2022-11-23 10:19:01','9b3d131488e06ca2329415ef6163da56'),(1081,2,'20220928.001321.102-financas','2022-11-23 10:19:01','74a4779fa96b7ce0c295ba9b50a22377'),(1082,2,'20220928.001324.136-financas','2022-11-23 10:19:01','e49f035bcd79f4ef2dcf9c2a6c9cebda'),(1083,2,'20220928.001327.166-financas','2022-11-23 10:19:01','d8e5db100c24a960e8ddee4cc6a2eba4'),(1084,2,'20220928.001330.196-financas','2022-11-23 10:19:01','9d1387d712d10532cd1b2119cd82edd5'),(1085,2,'20220928.001333.225-financas','2022-11-23 10:19:01','8d67be431d91753a9dad8905623a74ce'),(1086,2,'20220928.001336.250-financas','2022-11-23 10:19:01','690dafeab3ad1f5cbb2bcdc6f32d4596'),(1087,2,'20220928.001339.281-financas','2022-11-23 10:19:01','5a3b2fd99f13099e19ccbc058c846b3e'),(1088,2,'20220928.001342.306-financas','2022-11-23 10:19:01','3f6bf287658ebfc4548b9064bc4416bb'),(1089,2,'20220928.001345.336-financas','2022-11-23 10:19:01','b340d994f00776a288a94d969d59147a'),(1090,2,'20220928.001348.365-financas','2022-11-23 10:19:01','55bfb51fa9b62b6379b079988a327602'),(1091,2,'20220928.001351.392-financas','2022-11-23 10:19:01','29c127600e7e3de520a95ee6c6433450'),(1092,2,'20220928.001354.423-financas','2022-11-23 10:19:01','2f9633daec69b955c8b056856ed650ef'),(1093,2,'20220928.001357.454-financas','2022-11-23 10:19:01','fa2e8819b6147bb7deed14a0de17bfc6'),(1094,2,'20220928.001400.490-financas','2022-11-23 10:19:01','b7d302f32bb46040526984a9b1f7d081'),(1095,2,'20220928.001403.510-financas','2022-11-23 10:19:02','fe8d7a473cff6c75046f598c8cad1dd9'),(1096,2,'20220928.001406.543-financas','2022-11-23 10:19:02','18ba932c21f66903df3fc2ca10bc7c22'),(1097,2,'20220928.001409.571-financas','2022-11-23 10:19:02','737a38bd0f5e523d0c3815aaa7c6a2a5'),(1098,2,'20220928.001412.597-financas','2022-11-23 10:19:02','43a35f4eb89f7774fe01cec6e05063d5'),(1099,2,'20221010.125555.282-financas','2022-11-23 10:19:02','7748d18edfd17c5f982e66337e5eaed1'),(1100,2,'20221109.220608.516-financas','2022-11-23 10:19:02','fa74c0a59002ec0fc46af2b69db398c5'),(1101,2,'20221109.220611.556-financas','2022-11-23 10:19:02','1318f4f2b4e18a7e540e941ef12e6a11'),(1102,2,'20221109.220614.587-financas','2022-11-23 10:19:02','4988dd85f837c1c46b5fd331e0ee370d'),(1103,2,'20221109.220617.620-financas','2022-11-23 10:19:02','b2b9c1a797f3391aaaf468ed9e1b00a9'),(1104,2,'20221109.220620.652-financas','2022-11-23 10:19:02','02cbfbe4d1add14ce05887265d1a1ff2'),(1105,2,'20221109.220623.682-financas','2022-11-23 10:19:02','5febabdf89497c20c4f9370aea589fcb'),(1106,2,'20221109.220626.717-financas','2022-11-23 10:19:02','73f28e00cbc4c4e70d2c53516dc74327'),(1107,2,'20221109.220629.751-financas','2022-11-23 10:19:02','271999d05fd654b8eae078d5bb0aab82'),(1108,2,'20221109.220632.783-financas','2022-11-23 10:19:02','fdf1fba79fe8e1cc980baf6f5cbf3281'),(1109,2,'20221109.220635.812-financas','2022-11-23 10:19:02','581de4d4bb7032c235ceed84c5efe3d5'),(1110,2,'20221109.220638.847-financas','2022-11-23 10:19:02','2a34e9dff8617efe543c03d0003c5044'),(1111,2,'20221109.220641.879-financas','2022-11-23 10:19:02','5135a1fa66acd5f0c0cc6e7cf60473be'),(1112,2,'20221109.220644.908-financas','2022-11-23 10:19:02','da12035aa49a80e2de963a0067ea883c'),(1113,2,'20221109.220647.939-financas','2022-11-23 10:19:02','703d5d6f0e6b7e2cefaa730f21305383'),(1114,2,'20221111.190830.275-financas','2022-11-23 10:19:02','8a6b2a141717ed742619b57b4525841f'),(1115,2,'20221111.191354.353-financas','2022-11-23 10:19:02','d90dc21bb69a2febb387e68f884ddcfd'),(1116,2,'20221117.190045.919-financas','2022-11-23 10:19:02','b9b7fcb2c0bbc10390689ce9a1db3289'),(1117,2,'20221117.190048.951-financas','2022-11-23 10:19:02','3fef66de91325dbc62092a4a7b7af15c'),(1118,2,'20221117.190051.979-financas','2022-11-23 10:19:02','4071affe8c92c2b95b0559d4f6d29396'),(1119,2,'20221117.190055.001-financas','2022-11-23 10:19:02','a5be26d6938b2d88f90c340981314b65'),(1120,2,'20221122.233150.252-financas','2022-11-23 10:19:02','5e13719effe65fff4050479e5e523b68'),(1121,2,'20221122.233153.288-financas','2022-11-23 10:19:02','b5d1c658fac364cb3b0eab0beb32218a'),(1122,2,'20221122.233156.331-financas','2022-11-23 10:19:02','370b394fb35de2b5c542054d9c5b0369');
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
