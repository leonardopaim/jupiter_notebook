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
INSERT INTO `caixa` VALUES (1,3,2,'2024-01-12 11:16:03',1,'2024-01-13 11:16:03',1,2,10.00,15.00);
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
  `nome` varchar(100) NOT NULL DEFAULT '',
  `descricao` varchar(500) NOT NULL DEFAULT '',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `categoria_grupo_id` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `uk_categoria_1` (`codigo_interno`),
  KEY `k_categoria_1` (`categoria_grupo_id`),
  CONSTRAINT `fk_categoria_1` FOREIGN KEY (`categoria_grupo_id`) REFERENCES `categoria_grupo` (`categoria_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,1,'13º salário','','D',3,0),(2,2,'Adiantamento de salário','','D',3,0),(3,3,'Adiantamento do 13º salário','','D',3,0),(4,4,'Adicional noturno, insalubridade e periculosidade','','D',3,0),(5,5,'Água/esgoto','','D',2,0),(6,6,'Aluguel de imóvel','','D',2,0),(7,7,'Assistência técnica em informática','','D',2,0),(8,8,'Comissões sobre vendas (folha de pagamento)','','D',2,0),(9,9,'Compra de ativo imobilizado','','D',6,0),(10,10,'Compra de marca ou patente','','D',6,0),(11,11,'Compra de matéria-prima a prazo','','D',21,0),(12,12,'Compra de matéria-prima a vista','','D',21,0),(13,13,'Compra de material de escritório','','D',2,0),(14,14,'Compra de mercadorias a prazo para revenda','','D',21,0),(15,15,'Compra de mercadorias a vista para revenda','','D',9,0),(16,16,'Compra de produtos para uso/consumo','','D',2,0),(17,17,'Conserto de veículo','','D',4,0),(18,18,'Contribuição sindical','','D',3,0),(19,19,'Curso de especialização para equipe','','D',2,0),(20,20,'Descanso semanal remunerado (DSR)','','D',3,0),(21,21,'Desconto de contribuição sindical de funcionário','','C',3,0),(22,22,'Desconto de faltas de funcionários','','C',3,0),(23,23,'Desconto de INSS de funcionários','','C',3,0),(24,24,'Desconto de plano de saúde de funcionário','','C',3,0),(25,25,'Desconto de vale alimentação de funcionários','','C',3,0),(26,26,'Desconto de vale transporte de funcionários','','C',3,0),(27,27,'Devolução de cheque emitido','','D',1,0),(28,28,'Devolução de cheque pré-datado recebido','','D',1,0),(29,29,'Devolução de compra de mercadoria para revenda a prazo','','C',21,0),(30,30,'Devolução de compra de mercadoria para revenda a vista','','C',21,0),(31,31,'Devolução de venda a prazo','','D',22,0),(32,32,'Devolução de venda a vista','','D',22,0),(33,33,'Empréstimo bancário a pagar','','D',13,0),(34,34,'Encargos sociais (INSS)','','D',3,0),(35,35,'Energia elétrica','','D',2,0),(36,36,'Férias de funcionários','','D',3,0),(37,37,'Fretes e carretos','','D',2,0),(38,38,'Horas-extras de funcionários','','D',3,0),(39,39,'Impostos estaduais','','D',16,0),(40,40,'Impostos federais','','D',16,0),(41,41,'Impostos municipais','','D',16,0),(42,42,'Impostos trabalhistas','','D',16,0),(43,43,'Investimento em aplicação financeira','','D',6,0),(44,44,'IRRF a recolher','','C',3,0),(45,45,'Juros de cartão de crédito/débito','','D',13,0),(46,46,'Licença para uso de software','','D',2,0),(47,47,'Manutenção predial','','D',2,0),(48,48,'Mão-de-obra terceirizada para manutenção predial','','D',2,0),(49,49,'Material de limpeza','','D',2,0),(50,50,'Mensalidade de associação comercial','','D',2,0),(51,51,'Multa fiscal','','D',16,0),(52,52,'Pagamento de contribuição sindical','','D',3,0),(53,53,'Pagamento de horas-extras a funcionário','','D',3,0),(54,54,'Pagamento de INSS de funcionários','','D',3,0),(55,55,'Pagamento de salário de sócio','','D',8,0),(56,56,'Pagamento de vale alimentação','','D',3,0),(57,57,'Pagamento de vale transporte','','D',3,0),(58,58,'Pagamento do IRRF retido','','D',3,0),(59,59,'Prestação de serviços a prazo','','C',14,0),(60,60,'Prestação de serviços a vista','','C',23,0),(61,61,'Processo de produção concluído','','D',1,0),(62,62,'Processo de produção iniciado','','D',1,0),(63,63,'Recebimento de cheque devolvido','','C',22,0),(64,64,'Recebimento de prestação de serviços a prazo','','C',23,0),(65,65,'Recebimento de valores de cartões','','C',22,0),(66,66,'Recebimento de venda de mercadoria a prazo','','C',1,0),(67,67,'Recurso recebido por empréstimo','','C',20,0),(68,68,'Resgate de aplicação financeira','','C',17,0),(69,69,'Retirada de lucro por sócios','','D',15,0),(70,70,'Salário de sócios','','D',15,0),(71,71,'Salário família','','D',3,0),(72,72,'Salários e ordenados','','D',3,0),(73,73,'Sangria de caixa','','D',20,0),(74,74,'Seguro de funcionários','','D',3,0),(75,75,'Seguro predial','','D',2,0),(76,76,'Serviço de manutenção em equipamento','','D',2,0),(77,77,'Serviço de provedor de internet','','D',2,0),(78,78,'Serviço de telefonia','','D',2,0),(79,79,'Serviços de marketing','','D',2,0),(80,80,'Suprimento de caixa','','C',20,0),(81,81,'Tarifa bancária','','D',13,0),(82,82,'Tarifa de cobrança bancária','','D',13,0),(83,83,'Taxa de condomínio','','D',2,0),(84,84,'Taxas de correspondência','','D',2,0),(85,85,'Venda de mercadoria a prazo','','C',22,0),(86,86,'Venda de mercadoria a vista','','C',22,0),(87,87,'Venda de produção própria','','C',6,0),(88,88,'Viagem a trabalho','','D',12,0),(89,89,'Pagamento de compra a prazo','','D',21,0),(90,NULL,'Devolução de compra à prazo','','C',21,2),(91,NULL,'(Teste Movimento) - Vendas a Vista','','C',1,2),(92,NULL,'(Teste Movimento) - Vendas a Prazo','','C',1,2),(93,NULL,'(Teste Movimento) - Recebimento de vendas a prazo','','C',1,2);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `categoria_centro_resultado` VALUES (91,4,3,100.0000),(92,4,3,100.0000),(93,4,3,100.0000);
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
INSERT INTO `categoria_conta_contabil` VALUES (1,5,3,100.0000,1),(1,40,1,100.0000,1),(1,40,4,100.0000,2),(1,145,1,100.0000,2),(1,160,1,100.0000,1),(2,4,3,100.0000,2),(2,40,1,100.0000,2),(3,4,3,100.0000,2),(3,40,1,100.0000,2),(4,4,3,100.0000,1),(4,40,1,100.0000,1),(4,40,4,100.0000,2),(4,156,1,100.0000,2),(4,170,1,100.0000,1),(5,5,3,100.0000,1),(5,37,1,100.0000,1),(5,37,4,100.0000,2),(5,95,1,100.0000,2),(5,120,1,100.0000,1),(6,5,3,100.0000,1),(6,37,1,100.0000,1),(6,37,4,100.0000,2),(6,93,1,100.0000,2),(6,118,1,100.0000,1),(7,5,3,100.0000,1),(7,37,1,100.0000,1),(7,37,4,100.0000,2),(7,110,1,100.0000,2),(7,135,1,100.0000,1),(8,5,3,100.0000,1),(8,40,1,100.0000,1),(8,40,4,100.0000,2),(8,153,1,100.0000,2),(8,167,1,100.0000,1),(9,5,3,100.0000,1),(9,23,2,100.0000,2),(9,37,1,100.0000,1),(9,37,4,100.0000,2),(9,194,1,100.0000,1),(10,5,3,100.0000,1),(10,193,1,100.0000,1),(10,196,1,100.0000,1),(11,5,3,100.0000,1),(11,13,2,100.0000,2),(11,37,1,100.0000,1),(11,37,4,100.0000,2),(11,84,1,100.0000,1),(12,4,3,100.0000,1),(12,12,2,100.0000,1),(12,84,1,100.0000,1),(13,5,3,100.0000,1),(13,37,1,100.0000,1),(13,37,4,100.0000,2),(13,98,1,100.0000,2),(13,123,1,100.0000,1),(14,12,2,100.0000,2),(14,37,4,100.0000,2),(15,4,3,100.0000,1),(15,12,2,100.0000,1),(15,83,1,100.0000,1),(16,5,3,100.0000,1),(16,37,1,100.0000,1),(16,37,4,100.0000,2),(16,98,1,100.0000,2),(16,123,1,100.0000,1),(17,5,3,100.0000,1),(17,37,1,100.0000,1),(17,37,4,100.0000,2),(17,108,1,100.0000,2),(17,133,1,100.0000,1),(18,4,3,100.0000,1),(18,46,1,100.0000,1),(18,46,4,100.0000,2),(18,173,1,100.0000,2),(18,174,1,100.0000,1),(19,5,3,100.0000,1),(19,37,1,100.0000,1),(19,37,4,100.0000,2),(19,105,1,100.0000,2),(19,130,1,100.0000,1),(20,4,3,100.0000,1),(20,40,1,100.0000,1),(20,40,4,100.0000,2),(20,155,1,100.0000,2),(20,169,1,100.0000,1),(21,40,1,100.0000,2),(21,46,4,100.0000,2),(22,40,1,100.0000,2),(22,144,4,100.0000,2),(23,40,1,100.0000,2),(23,46,4,100.0000,2),(24,5,2,100.0000,1),(24,40,1,100.0000,2),(24,40,4,100.0000,1),(24,152,4,100.0000,2),(25,40,1,100.0000,2),(25,144,4,100.0000,2),(26,40,1,100.0000,2),(26,144,4,100.0000,2),(27,38,1,100.0000,1),(27,39,4,100.0000,1),(28,7,3,100.0000,1),(28,8,2,100.0000,1),(29,12,3,100.0000,2),(29,37,1,100.0000,2),(30,5,2,100.0000,1),(30,12,3,100.0000,1),(30,83,4,100.0000,1),(31,10,3,100.0000,2),(31,12,2,100.0000,2),(31,59,1,100.0000,2),(31,80,4,100.0000,2),(32,5,3,100.0000,1),(32,12,2,100.0000,1),(32,59,1,100.0000,1),(32,61,1,100.0000,1),(32,80,4,100.0000,1),(33,5,3,100.0000,1),(33,43,1,100.0000,1),(33,43,4,100.0000,2),(33,180,1,100.0000,2),(33,186,1,100.0000,1),(34,5,3,100.0000,1),(34,46,1,100.0000,1),(34,46,4,100.0000,2),(34,146,1,100.0000,2),(34,161,1,100.0000,1),(35,5,3,100.0000,1),(35,37,1,100.0000,1),(35,37,4,100.0000,2),(35,94,1,100.0000,2),(35,119,1,100.0000,1),(36,5,3,100.0000,1),(36,46,1,100.0000,1),(36,46,4,100.0000,2),(36,147,1,100.0000,2),(36,162,1,100.0000,1),(37,5,3,100.0000,1),(37,37,1,100.0000,1),(37,37,4,100.0000,2),(37,97,1,100.0000,2),(37,122,1,100.0000,1),(38,5,3,100.0000,1),(38,37,1,100.0000,1),(38,37,4,100.0000,2),(38,151,1,100.0000,2),(38,166,1,100.0000,1),(39,5,3,100.0000,1),(39,45,1,100.0000,1),(39,45,4,100.0000,2),(39,100,1,100.0000,2),(39,125,1,100.0000,1),(40,5,3,100.0000,1),(40,45,1,100.0000,1),(40,45,4,100.0000,2),(40,100,1,100.0000,2),(40,125,1,100.0000,1),(41,5,3,100.0000,1),(41,45,1,100.0000,1),(41,45,4,100.0000,2),(41,100,1,100.0000,2),(41,125,1,100.0000,1),(42,5,3,100.0000,1),(42,45,1,100.0000,1),(42,45,4,100.0000,2),(42,146,1,100.0000,2),(42,161,1,100.0000,1),(43,5,3,100.0000,1),(43,33,2,100.0000,1),(43,195,1,100.0000,1),(44,40,2,100.0000,2),(44,42,4,100.0000,2),(45,5,3,100.0000,1),(45,41,1,100.0000,1),(45,41,4,100.0000,2),(45,181,1,100.0000,2),(45,187,1,100.0000,1),(46,5,3,100.0000,1),(46,37,1,100.0000,1),(46,37,4,100.0000,2),(46,115,1,100.0000,2),(46,140,1,100.0000,1),(47,5,3,100.0000,1),(47,37,1,100.0000,1),(47,37,4,100.0000,2),(47,109,1,100.0000,2),(47,134,1,100.0000,1),(48,5,3,100.0000,1),(48,37,1,100.0000,1),(48,37,4,100.0000,2),(48,101,1,100.0000,2),(48,126,1,100.0000,1),(49,4,3,100.0000,1),(49,37,1,100.0000,1),(49,37,4,100.0000,2),(49,117,1,100.0000,2),(49,142,1,100.0000,1),(50,5,3,100.0000,1),(50,37,1,100.0000,1),(50,37,4,100.0000,2),(50,107,1,100.0000,2),(50,132,1,100.0000,1),(51,5,3,100.0000,1),(51,37,1,100.0000,1),(51,37,4,100.0000,2),(51,102,1,100.0000,2),(51,127,1,100.0000,1),(52,4,3,100.0000,1),(52,46,1,100.0000,1),(52,174,1,100.0000,1),(53,5,3,100.0000,1),(53,151,1,100.0000,1),(53,166,1,100.0000,1),(54,4,3,100.0000,1),(54,46,1,100.0000,1),(54,161,1,100.0000,1),(55,5,3,100.0000,1),(55,148,1,100.0000,1),(55,163,1,100.0000,1),(56,4,3,100.0000,1),(56,37,1,100.0000,1),(56,37,4,100.0000,2),(56,154,1,100.0000,2),(56,168,1,100.0000,1),(57,4,3,100.0000,1),(57,37,1,100.0000,1),(57,37,4,100.0000,2),(57,158,1,100.0000,2),(57,172,1,100.0000,1),(58,4,3,100.0000,1),(58,42,1,100.0000,1),(58,125,1,100.0000,1),(59,10,2,100.0000,2),(59,60,4,100.0000,2),(60,4,2,100.0000,1),(60,60,4,100.0000,1),(60,62,4,100.0000,1),(61,12,2,100.0000,1),(61,15,3,100.0000,1),(62,13,3,100.0000,1),(62,15,2,100.0000,1),(63,5,2,100.0000,1),(63,8,3,100.0000,1),(64,4,2,100.0000,1),(64,10,3,100.0000,1),(64,65,4,100.0000,1),(65,5,2,100.0000,1),(65,6,3,100.0000,1),(66,4,2,100.0000,1),(66,10,3,100.0000,1),(66,64,4,100.0000,1),(67,5,2,100.0000,1),(67,43,4,100.0000,1),(68,5,2,100.0000,1),(68,33,3,100.0000,1),(69,4,3,100.0000,1),(69,54,1,100.0000,2),(69,55,1,100.0000,1),(69,55,4,100.0000,2),(69,216,1,100.0000,1),(70,4,3,100.0000,1),(70,40,1,100.0000,1),(70,40,4,100.0000,2),(70,148,1,100.0000,2),(70,163,1,100.0000,1),(71,4,3,100.0000,1),(71,40,1,100.0000,1),(71,40,4,100.0000,2),(71,157,1,100.0000,2),(71,171,1,100.0000,1),(72,5,3,100.0000,1),(72,40,1,100.0000,1),(72,40,4,100.0000,2),(72,144,1,100.0000,2),(72,159,1,100.0000,1),(73,4,3,100.0000,1),(73,5,2,100.0000,1),(74,5,3,100.0000,1),(74,37,1,100.0000,1),(74,37,4,100.0000,2),(74,149,1,100.0000,2),(74,164,1,100.0000,1),(75,5,3,100.0000,1),(75,37,1,100.0000,1),(75,37,4,100.0000,2),(75,114,1,100.0000,2),(75,139,1,100.0000,1),(76,5,3,100.0000,1),(76,37,1,100.0000,1),(76,37,4,100.0000,2),(76,116,1,100.0000,2),(76,141,1,100.0000,1),(77,5,3,100.0000,1),(77,37,1,100.0000,1),(77,37,4,100.0000,2),(77,111,1,100.0000,2),(77,136,1,100.0000,1),(78,5,3,100.0000,1),(78,37,1,100.0000,1),(78,37,4,100.0000,2),(78,99,1,100.0000,2),(78,124,1,100.0000,1),(79,5,3,100.0000,1),(79,37,1,100.0000,1),(79,37,4,100.0000,2),(79,112,1,100.0000,2),(79,137,1,100.0000,1),(80,4,2,100.0000,1),(80,5,3,100.0000,1),(81,5,3,100.0000,1),(81,37,1,100.0000,1),(81,37,4,100.0000,2),(81,179,1,100.0000,2),(81,182,1,100.0000,1),(82,5,3,100.0000,1),(82,37,1,100.0000,1),(82,37,4,100.0000,2),(82,176,1,100.0000,2),(82,183,1,100.0000,1),(83,4,3,100.0000,1),(83,37,1,100.0000,1),(83,37,4,100.0000,2),(83,93,1,100.0000,2),(83,118,1,100.0000,1),(84,5,3,100.0000,1),(84,37,1,100.0000,1),(84,37,4,100.0000,2),(84,96,1,100.0000,2),(84,121,1,100.0000,1),(85,10,2,100.0000,2),(85,12,3,100.0000,2),(85,59,4,100.0000,2),(85,80,1,100.0000,2),(86,4,2,100.0000,1),(86,12,3,100.0000,1),(86,59,4,100.0000,1),(86,61,4,100.0000,1),(86,80,1,100.0000,1),(87,4,2,100.0000,1),(87,12,3,100.0000,1),(87,60,4,100.0000,1),(87,80,1,100.0000,1),(88,5,3,100.0000,1),(88,37,1,100.0000,1),(88,37,4,100.0000,2),(88,106,1,100.0000,2),(88,131,1,100.0000,1),(89,5,3,100.0000,1),(89,37,1,100.0000,1),(89,83,1,100.0000,1),(90,5,2,100.0000,1),(90,13,3,100.0000,1),(91,4,2,100.0000,1),(91,12,3,100.0000,1),(91,60,4,100.0000,1),(91,75,1,100.0000,1),(92,10,2,100.0000,1),(92,12,3,100.0000,1),(92,60,4,100.0000,1),(92,75,1,100.0000,1),(93,4,2,100.0000,1),(93,10,3,100.0000,1);
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
INSERT INTO `categoria_empresa` VALUES (1,3,NULL,'',1,0),(2,3,NULL,'',1,0),(3,3,NULL,'',1,0),(4,3,NULL,'',1,0),(5,3,NULL,'',1,0),(6,3,NULL,'',1,0),(7,3,NULL,'',1,0),(8,3,NULL,'',1,0),(9,3,NULL,'',1,0),(10,3,NULL,'',1,0),(11,3,NULL,'',1,0),(12,3,NULL,'',1,0),(13,3,NULL,'',1,0),(14,3,NULL,'',1,0),(15,3,NULL,'',1,0),(16,3,NULL,'',1,0),(17,3,NULL,'',1,0),(18,3,NULL,'',1,0),(19,3,NULL,'',1,0),(20,3,NULL,'',1,0),(21,3,NULL,'',1,0),(22,3,NULL,'',1,0),(23,3,NULL,'',1,0),(24,3,NULL,'',1,0),(25,3,NULL,'',1,0),(26,3,NULL,'',1,0),(27,3,NULL,'',1,0),(28,3,NULL,'',1,0),(29,3,NULL,'',1,0),(30,3,NULL,'',1,0),(31,3,NULL,'',1,0),(32,3,NULL,'',1,0),(33,3,NULL,'',1,0),(34,3,NULL,'',1,0),(35,3,NULL,'',1,0),(36,3,NULL,'',1,0),(37,3,NULL,'',1,0),(38,3,NULL,'',1,0),(39,3,NULL,'',1,0),(40,3,NULL,'',1,0),(41,3,NULL,'',1,0),(42,3,NULL,'',1,0),(43,3,NULL,'',1,0),(44,3,NULL,'',1,0),(45,3,NULL,'',1,0),(46,3,NULL,'',1,0),(47,3,NULL,'',1,0),(48,3,NULL,'',1,0),(49,3,NULL,'',1,0),(50,3,NULL,'',1,0),(51,3,NULL,'',1,0),(52,3,NULL,'',1,0),(53,3,NULL,'',1,0),(54,3,NULL,'',1,0),(55,3,NULL,'',1,0),(56,3,NULL,'',1,0),(57,3,NULL,'',1,0),(58,3,NULL,'',1,0),(59,3,NULL,'',1,0),(60,3,NULL,'',1,0),(61,3,NULL,'',1,0),(62,3,NULL,'',1,0),(63,3,NULL,'',1,0),(64,3,NULL,'',1,0),(65,3,NULL,'',1,0),(66,3,NULL,'',1,0),(67,3,NULL,'',1,0),(68,3,NULL,'',1,0),(69,3,NULL,'',1,0),(70,3,NULL,'',1,0),(71,3,NULL,'',1,0),(72,3,NULL,'',1,0),(73,3,NULL,'',1,0),(74,3,NULL,'',1,0),(75,3,NULL,'',1,0),(76,3,NULL,'',1,0),(77,3,NULL,'',1,0),(78,3,NULL,'',1,0),(79,3,NULL,'',1,0),(80,3,NULL,'',1,0),(81,3,NULL,'',1,0),(82,3,NULL,'',1,0),(83,3,NULL,'',1,0),(84,3,NULL,'',1,0),(85,3,NULL,'',1,0),(86,3,NULL,'',1,0),(87,3,NULL,'',1,0),(88,3,NULL,'',1,0),(89,3,NULL,'',1,0),(90,3,NULL,'',1,0),(91,3,NULL,'',1,0),(92,3,NULL,'',1,0),(93,3,NULL,'',1,0);
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
  `nome` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoria_grupo_id`),
  UNIQUE KEY `uk_categoria_grupo_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo`
--

LOCK TABLES `categoria_grupo` WRITE;
/*!40000 ALTER TABLE `categoria_grupo` DISABLE KEYS */;
INSERT INTO `categoria_grupo` VALUES (1,1,'Processo de produção'),(2,2,'Despesas com manutenção'),(3,3,'Despesas com folha de pagamento'),(4,4,'Despesas com veículos e viagens'),(5,5,'Despesas com parcerias'),(6,6,'Investimentos'),(7,7,'Receitas provindas de terceiros'),(8,8,'Despesas de terceiros'),(9,9,'Despesas diversas'),(10,10,'Receitas não operacionais de parcerias'),(11,11,'Investimentos em especialização'),(12,12,'Despesas eventuais'),(13,13,'Despesas financeiras'),(14,14,'Receitas com serviços'),(15,15,'Despesas com salários e retiradas de sócios'),(16,16,'Despesas com impostos'),(17,17,'Receitas não operacionais diversas'),(18,18,'Despesas de terceiros'),(19,19,'Distribuição de lucros'),(20,20,'Transferências de fundos'),(21,21,'Custos'),(22,22,'Receitas com vendas'),(23,23,'Receitas com prestação de serviços');
/*!40000 ALTER TABLE `categoria_grupo` ENABLE KEYS */;
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
INSERT INTO `cliente_contrato` VALUES (1,3,2,NULL,4,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,2,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_credito`
--

LOCK TABLES `cliente_credito` WRITE;
/*!40000 ALTER TABLE `cliente_credito` DISABLE KEYS */;
INSERT INTO `cliente_credito` VALUES (1,4,3,NULL,1,NULL,NULL,NULL,'2024-01-12 11:15:18',10.50,'C');
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
    if new.credito_debito not in ('c','d') then
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
    if new.credito_debito not in ('c','d') then
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,3,105522,6,3,9,NULL,'2024-01-12',1,0,300.00,300.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,3,NULL),(2,3,129589,6,3,9,NULL,'2024-01-12',2,2,100.00,100.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,4,NULL),(3,3,19985761,6,3,9,NULL,'2024-01-12',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,5,NULL),(4,3,19985762,6,3,9,NULL,'2024-01-12',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,6,NULL),(5,3,19985763,6,3,9,NULL,'2024-01-12',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,7,NULL),(6,3,19985764,6,3,9,NULL,'2024-01-12',1,0,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,8,NULL),(7,3,129581,6,3,9,NULL,'2024-01-12',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,9,NULL),(8,3,129582,6,3,9,NULL,'2024-01-12',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,10,NULL),(9,3,129583,6,3,9,NULL,'2024-01-12',2,2,500.00,500.00,0.00,0.00,0.00,0.00,0.00,1,'',0,1,11,NULL),(10,3,129584,6,3,9,NULL,'2024-01-12',2,2,700.00,700.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,12,NULL),(11,3,129585,6,3,9,NULL,'2024-01-12',1,0,70.00,70.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(12,3,129586,6,3,9,NULL,'2024-01-12',1,0,80.00,80.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(13,3,129587,6,3,9,NULL,'2024-01-12',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',1,0,NULL,NULL),(14,3,13250,6,3,9,NULL,'2024-01-12',1,0,90.00,90.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0,NULL,1),(15,3,19985763,6,3,9,NULL,'2024-01-12',1,0,1000.00,1008.00,0.00,0.00,0.00,0.00,8.00,1,'',0,0,19,NULL);
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
INSERT INTO `compra_pendente` VALUES (2,3,6,'31190249051659000166550000001391461077451590',7745159,3,9,NULL,'2024-01-12','2024-01-12',1,'55',1,0,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'',''),(16,3,6,'31160704731855000143550010007485481189117075',105522,3,9,NULL,'2024-01-12','2024-01-12',1,'55',1,0,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'',1,'','');
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
INSERT INTO `compra_pendente_item` VALUES (4,2,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',100.00,18.0000,18.00,0.00,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,1),(21,16,1,1,NULL,1102,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',100.00,18.0000,18.00,0.00,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,1);
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
  `dre_resultado_caixa_conta_contabil_id` int(11) DEFAULT NULL,
  `dre_resultado_competencia_conta_contabil_id` int(11) DEFAULT NULL,
  `balanco_resultado_conta_contabil_id` int(11) DEFAULT NULL,
  `movimento_conta_contabil` int(1) NOT NULL DEFAULT '0',
  `orcamento_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `pedido_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `venda_operacao_id` int(11) DEFAULT NULL,
  `venda_sem_estoque` int(1) NOT NULL DEFAULT '0',
  `nfce_csc_token` varchar(50) NOT NULL DEFAULT '',
  `nfce_csc_id` varchar(20) NOT NULL DEFAULT '',
  `ordem_servico_modelo` int(1) NOT NULL DEFAULT '0',
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
  KEY `k_configuracao_6` (`dre_resultado_caixa_conta_contabil_id`),
  KEY `k_configuracao_7` (`dre_resultado_competencia_conta_contabil_id`),
  KEY `k_configuracao_8` (`balanco_resultado_conta_contabil_id`),
  KEY `k_configuracao_9` (`venda_operacao_id`),
  KEY `k_configuracao_10` (`inventario_conta_contabil_id`),
  KEY `k_configuracao_11` (`pdv_venda_operacao_id`),
  KEY `k_configuracao_12` (`pdv_sangria_categoria_id`),
  KEY `k_configuracao_13` (`pdv_suprimento_categoria_id`),
  CONSTRAINT `fk_configuracao_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_configuracao_10` FOREIGN KEY (`inventario_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_11` FOREIGN KEY (`pdv_venda_operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_configuracao_12` FOREIGN KEY (`pdv_sangria_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_13` FOREIGN KEY (`pdv_suprimento_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_2` FOREIGN KEY (`cliente_contrato_conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_configuracao_3` FOREIGN KEY (`cliente_contrato_categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `fk_configuracao_4` FOREIGN KEY (`importacao_retorno_forma_pagamento_id`) REFERENCES `forma_pagamento` (`forma_pagamento_id`),
  CONSTRAINT `fk_configuracao_5` FOREIGN KEY (`faturamento_operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_configuracao_6` FOREIGN KEY (`dre_resultado_caixa_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_7` FOREIGN KEY (`dre_resultado_competencia_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_8` FOREIGN KEY (`balanco_resultado_conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`),
  CONSTRAINT `fk_configuracao_9` FOREIGN KEY (`venda_operacao_id`) REFERENCES `operacao` (`operacao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao`
--

LOCK TABLES `configuracao` WRITE;
/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
INSERT INTO `configuracao` VALUES (2,0,6,0,'Empresas/2/NFe/Certificados/GERALDA_APARECIDA_DE_MIRANDA_SILVA_99553082653_-_senha_CREDITAR2023_14-09-2023.pfx','c+cuA60lCxIpR0IjvYkFbg==',0.00,NULL,NULL,NULL,0.0000,0,0,0.0000,0,0,0,0.0000,0,0,NULL,0,0,NULL,NULL,NULL,1,0,0,1,3,'','',0,NULL,0,0,0,'',NULL,NULL,NULL,0,0,0,0,0,0,0,0,0),(3,1,6,0,'','',1045.00,1,59,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,5,0,0,218,215,54,3,0,0,8,0,'0123456789','1',3,NULL,0,0,0,'',NULL,NULL,NULL,1,1,1,1,1,1,1,1,1);
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
INSERT INTO `conta` VALUES (1,3,1,0,'Caixa interno',1,-290.00,0.00,'2024-01-11','','','',NULL,1,0),(2,3,NULL,0,'Caixa',1,203190.02,0.00,'2024-01-11','','','',NULL,1,0),(6,3,NULL,0,'Pdv Teste',1,0.00,0.00,'2024-01-12','','','',NULL,0,0),(7,3,NULL,0,'Pdv Teste',1,5.00,0.00,'2024-01-12','','','',NULL,1,0),(8,2,1,0,'Caixa interno',1,230.00,0.00,'2023-07-24','','','',NULL,1,0);
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
  `credora_devedora` char(1) NOT NULL DEFAULT '',
  `codigo_natureza` int(1) NOT NULL DEFAULT '0',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  `conta_dre_regime_caixa` tinyint(1) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `conta_corrente` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_contabil_id`),
  UNIQUE KEY `uk_conta_contabil_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contabil`
--

LOCK TABLES `conta_contabil` WRITE;
/*!40000 ALTER TABLE `conta_contabil` DISABLE KEYS */;
INSERT INTO `conta_contabil` VALUES (1,1,'1',1,'','ATIVO','D',1,'S',1,0,9,0),(2,2,'1.1',2,'','CIRCULANTE','D',1,'S',2,0,9,0),(3,3,'1.1.1',3,'','Disponível','D',1,'S',3,0,9,0),(4,4,'1.1.1.001',4,'','Caixa','D',1,'A',4,0,9,0),(5,5,'1.1.1.002',5,'','Bancos','D',1,'A',4,0,9,0),(6,6,'1.1.1.003',6,'','Cartões de crédito e débito a receber','D',1,'A',4,0,9,0),(7,7,'1.1.1.004',7,'','Cheques a receber','D',1,'A',4,0,9,0),(8,8,'1.1.1.005',8,'','Cheques a receber devolvidos','D',1,'A',4,0,9,0),(9,9,'1.1.2',9,'','Clientes','D',1,'S',3,0,9,0),(10,10,'1.1.2.001',10,'','Duplicatas a receber','D',1,'A',4,0,9,0),(11,11,'1.1.3',11,'','Estoques','D',1,'S',3,0,9,0),(12,12,'1.1.3.001',12,'','Estoque de mercadorias ou produtos','D',1,'A',4,0,9,0),(13,13,'1.1.3.002',13,'','Estoque de matéria-prima','D',1,'A',4,0,9,0),(14,14,'1.1.3.003',14,'','Estoque de materiais de consumo','D',1,'A',4,0,9,0),(15,15,'1.1.3.004',15,'','Estoque de produtos em elaboração','D',1,'A',4,0,9,0),(16,16,'1.1.4',16,'','Outras contas a receber','D',1,'S',3,0,9,0),(17,17,'1.1.4.001',17,'','ICMS a recuperar','D',1,'A',4,0,9,0),(18,18,'1.1.4.002',18,'','PIS/COFINS a recuperar','D',1,'A',4,0,9,0),(19,19,'1.1.4.003',19,'','IPI a recuperar','D',1,'A',4,0,9,0),(20,20,'1.1.4.004',20,'','IRPJ a recuperar','D',1,'A',4,0,9,0),(21,21,'1.2',21,'','NÃO CIRCULANTE','D',1,'S',2,0,9,0),(22,22,'1.2.1',22,'','Imobilizado','D',1,'S',3,0,9,0),(23,23,'1.2.1.001',23,'','Imobilizado','D',1,'A',4,0,9,0),(24,24,'1.2.1.002',24,'','Imóveis','D',1,'A',4,0,9,0),(25,25,'1.2.1.003',25,'','Instalações','D',1,'A',4,0,9,0),(26,26,'1.2.1.004',26,'','Máquinas e equipamentos','D',1,'A',4,0,9,0),(27,27,'1.2.1.005',27,'','Móveis e utensílios','D',1,'A',4,0,9,0),(28,28,'1.2.1.006',28,'','Veículos','D',1,'A',4,0,9,0),(29,29,'1.2.1.007',29,'','(-) Depreciação acumulada','D',1,'A',4,0,9,0),(30,30,'1.2.2',30,'','Intangível','D',1,'S',3,0,9,0),(31,31,'1.2.2.001',31,'','Marcas e patentes','D',1,'A',4,0,9,0),(32,32,'1.2.3',32,'','Investimentos financeiros','D',1,'S',3,0,9,0),(33,33,'1.2.3.001',33,'','Aplicações financeiras','D',1,'A',4,0,9,0),(34,34,'2',34,'','PASSIVO','C',2,'S',1,0,9,0),(35,35,'2.1',35,'','CIRCULANTE','C',2,'S',2,0,9,0),(36,36,'2.1.1',36,'','Obrigações','C',2,'S',3,0,9,0),(37,37,'2.1.1.001',37,'','Fornecedores','C',2,'A',4,0,9,0),(38,38,'2.1.1.002',38,'','Cheques emitidos a compensar','C',2,'A',4,0,9,0),(39,39,'2.1.1.003',39,'','Cheques emitidos devolvidos','C',2,'A',4,0,9,0),(40,40,'2.1.1.004',40,'','Salários a pagar','C',2,'A',4,0,9,0),(41,41,'2.1.1.005',41,'','Juros a pagar','C',2,'A',4,0,9,0),(42,42,'2.1.1.006',42,'','IRRF a recolher','C',2,'A',4,0,9,0),(43,43,'2.1.1.007',43,'','Empréstimos a pagar','C',2,'A',4,0,9,0),(44,44,'2.1.1.008',44,'','Outras obrigações','C',2,'A',4,0,9,0),(45,45,'2.1.1.009',45,'','Impostos a pagar','C',2,'A',4,0,9,0),(46,46,'2.1.1.010',46,'','Obrigações da folha de pagamento','C',2,'A',4,0,9,0),(47,47,'2.3',47,'','PATRIMÔNIO LÍQUIDO','D',3,'S',2,0,9,0),(48,48,'2.3.1',48,'','Capital','D',3,'S',3,0,9,0),(49,49,'2.3.1.001',49,'','Capital','D',3,'A',4,0,9,0),(50,50,'2.3.1.002',50,'','(-) Capital a realizar','D',3,'A',4,0,9,0),(51,51,'2.3.2',51,'','Reservas de lucros','D',3,'S',3,0,9,0),(52,52,'2.3.2.001',52,'','Reserva legal','D',3,'A',4,0,9,0),(53,53,'2.3.3',53,'','Lucros ou prejuízos acumulados','D',3,'S',3,0,9,0),(54,54,'2.3.3.001',54,'','Lucros/prejuízos acumulados','C',3,'A',4,0,9,0),(55,55,'2.3.3.002',55,'','Lucro a distribuir','D',3,'A',4,0,9,0),(56,56,'3',56,'','RECEITAS','C',4,'S',1,0,9,0),(57,57,'3.1',57,'','RECEITAS OPERACIONAIS','C',4,'S',2,0,1,0),(58,58,'3.1.1',58,'','Receitas de vendas','C',4,'S',3,0,9,0),(59,59,'3.1.1.001',59,'','Venda de mercadorias','C',4,'A',4,0,9,0),(60,60,'3.1.1.002',60,'','Prestação de serviços','C',4,'A',4,0,9,0),(61,61,'3.1.1.003',61,'','Vendas de mercadorias a vista','C',4,'A',4,1,9,0),(62,62,'3.1.1.004',62,'','Prestação de serviços a vista','C',4,'A',4,1,9,0),(63,63,'3.1.2',63,'','Receitas com recebimentos','C',4,'S',3,1,9,0),(64,64,'3.1.2.001',64,'','Vendas de mercadorias a prazo','C',4,'A',4,1,9,0),(65,65,'3.1.2.002',65,'','Prestação de serviços a prazo','C',4,'A',4,1,9,0),(66,66,'4',66,'','DEDUÇÕES DA RECEITA','D',4,'S',1,0,2,0),(67,67,'4.1',67,'','DEVOLUÇÕES','D',4,'S',2,0,9,0),(68,68,'4.1.1',68,'','Devoluções de vendas','D',4,'S',3,0,9,0),(69,69,'4.1.1.001',69,'','(-) Devoluções de vendas','D',4,'A',4,0,9,0),(70,70,'4.1.1.002',70,'','(-) Devoluções de vendas do exercício anterior','D',4,'A',4,0,9,0),(71,71,'4.2',71,'','IMPOSTOS SOBRE AS VENDAS','D',4,'S',2,0,9,0),(72,72,'4.2.1',72,'','IMPOSTOS','D',4,'S',3,0,9,0),(73,73,'4.2.1.001',73,'','(-) ICMS','D',4,'A',4,0,9,0),(74,74,'4.2.1.002',74,'','(-) PIS/COFINS','D',4,'A',4,0,9,0),(75,75,'4.2.1.003',75,'','(-) IPI','D',4,'A',4,0,9,0),(76,76,'4.2.1.004',76,'','(-) ISSQN','D',4,'A',4,0,9,0),(77,77,'5',77,'','CUSTOS','D',4,'S',1,0,3,0),(78,78,'5.1',78,'','CUSTOS OPERACIONAIS','D',4,'S',2,0,9,0),(79,79,'5.1.1',79,'','Custo das vendas e prestações de serviços','D',4,'S',3,0,9,0),(80,80,'5.1.1.001',80,'','(-) Custo da Mercadoria Vendida','D',4,'A',4,0,9,0),(81,81,'5.1.1.002',81,'','(-) Custo da Prestação de Serviços','D',4,'A',4,0,9,0),(82,82,'5.1.2',82,'','Compras de mercadorias','D',4,'S',3,1,9,0),(83,83,'5.1.2.001',83,'','Compra de mercadorias para revenda','D',4,'A',4,1,9,0),(84,84,'5.1.2.002',84,'','Compras de matéria-prima ','D',9,'A',4,1,9,0),(85,85,'6',85,'','DESPESAS','D',4,'S',1,0,9,0),(86,86,'6.1',86,'','DESPESAS OPERACIONAIS','D',4,'S',2,0,4,0),(87,87,'6.1.1',87,'','Despesas com vendas','D',4,'S',3,0,9,0),(88,88,'6.1.1.001',88,'','Comissões sobre vendas','D',4,'A',4,0,9,0),(89,89,'6.1.1.002',89,'','Vendas de mercadorias','D',4,'A',4,1,9,0),(90,90,'6.1.1.003',90,'','Vendas de produtos','D',4,'A',4,1,9,0),(91,91,'6.1.1.004',91,'','Prestação de serviços','D',4,'A',4,1,9,0),(92,92,'6.1.2',92,'','Despesas administrativas','D',4,'S',3,0,9,0),(93,93,'6.1.2.001',93,'','Aluguel e correlacionados','D',4,'A',4,0,9,0),(94,94,'6.1.2.002',94,'','Energia elétrica','D',4,'A',4,0,9,0),(95,95,'6.1.2.003',95,'','Água/esgoto','D',4,'A',4,0,9,0),(96,96,'6.1.2.004',96,'','Correios','D',4,'A',4,0,9,0),(97,97,'6.1.2.005',97,'','Fretes','D',4,'A',4,0,9,0),(98,98,'6.1.2.006',98,'','Material de expediente','D',4,'A',4,0,9,0),(99,99,'6.1.2.007',99,'','Comunicações','D',4,'A',4,0,9,0),(100,100,'6.1.2.008',100,'','Impostos e taxas','D',4,'A',4,0,9,0),(101,101,'6.1.2.009',101,'','Serviços de terceiros','D',4,'A',4,0,9,0),(102,102,'6.1.2.010',102,'','Multas fiscais','D',4,'A',4,0,9,0),(103,103,'6.1.2.011',103,'','Honorários da diretoria','D',4,'A',4,0,9,0),(104,104,'6.1.2.012',104,'','Honorários contábeis/advocatícios','D',4,'A',4,0,9,0),(105,105,'6.1.2.013',105,'','Cursos e treinamentos','D',4,'A',4,0,9,0),(106,106,'6.1.2.014',106,'','Viagens','D',4,'A',4,0,9,0),(107,107,'6.1.2.015',107,'','Entidades de classe','D',4,'A',4,0,9,0),(108,108,'6.1.2.016',108,'','Manutenção de veículos','D',4,'A',4,0,9,0),(109,109,'6.1.2.017',109,'','Manutenção predial','D',4,'A',4,0,9,0),(110,110,'6.1.2.018',110,'','Manutenção de software/hardware','D',4,'A',4,0,9,0),(111,111,'6.1.2.019',111,'','Provedor de internet','D',4,'A',4,0,9,0),(112,112,'6.1.2.020',112,'','Marketing/publicidade','D',4,'A',4,0,9,0),(113,113,'6.1.2.021',113,'','Alimentação','D',4,'A',4,0,9,0),(114,114,'6.1.2.022',114,'','Seguros da empresa','D',4,'A',4,0,9,0),(115,115,'6.1.2.023',115,'','Taxas e licenciamentos','D',4,'A',4,0,9,0),(116,116,'6.1.2.024',116,'','Manutenção em máquinas e equipamentos','D',4,'A',4,0,9,0),(117,117,'6.1.2.025',117,'','Material de limpeza','D',4,'A',4,0,9,0),(118,118,'6.1.2.026',118,'','Aluguel e correlacionados','D',4,'A',4,1,9,0),(119,119,'6.1.2.027',119,'','Energia Elétrica','D',4,'A',4,1,9,0),(120,120,'6.1.2.028',120,'','Água/Esgoto','D',4,'A',4,1,9,0),(121,121,'6.1.2.029',121,'','Correios','D',4,'A',4,1,9,0),(122,122,'6.1.2.030',122,'','Fretes','D',4,'A',4,1,9,0),(123,123,'6.1.2.031',123,'','Material de expediente','D',4,'A',4,1,9,0),(124,124,'6.1.2.032',124,'','Comunicações','D',4,'A',4,1,9,0),(125,125,'6.1.2.033',125,'','Impostos e taxas','D',4,'A',4,1,9,0),(126,126,'6.1.2.034',126,'','Serviços de terceiros','D',4,'A',4,1,9,0),(127,127,'6.1.2.035',127,'','Multas fiscais','D',4,'A',4,1,9,0),(128,128,'6.1.2.036',128,'','Honorários da diretoria','D',4,'A',4,1,9,0),(129,129,'6.1.2.037',129,'','Honorários contábeis/advocatícios','D',4,'A',4,1,9,0),(130,130,'6.1.2.038',130,'','Cursos e treinamentos','D',4,'A',4,1,9,0),(131,131,'6.1.2.039',131,'','Viagens','D',4,'A',4,1,9,0),(132,132,'6.1.2.040',132,'','Entidades de classe','D',4,'A',4,1,9,0),(133,133,'6.1.2.041',133,'','Manutenção de veículos','D',4,'A',4,1,9,0),(134,134,'6.1.2.042',134,'','Manutenção predial','D',4,'A',4,1,9,0),(135,135,'6.1.2.043',135,'','Manutenção de software/hardware','D',4,'A',4,1,9,0),(136,136,'6.1.2.044',136,'','Provedor de internet','D',4,'A',4,1,9,0),(137,137,'6.1.2.045',137,'','Marketing/Publicidade','D',4,'A',4,1,9,0),(138,138,'6.1.2.046',138,'','Alimentação','D',4,'A',4,1,9,0),(139,139,'6.1.2.047',139,'','Seguros da empresa','D',4,'A',4,1,9,0),(140,140,'6.1.2.048',140,'','Taxas e licenciamentos','D',4,'A',4,1,9,0),(141,141,'6.1.2.049',141,'','Manutenção em máquinas e equipamentos','D',4,'A',4,1,9,0),(142,142,'6.1.2.050',142,'','Material de limpeza','D',4,'A',4,1,9,0),(143,143,'6.1.3',143,'','Despesas com pessoal','D',4,'S',3,0,9,0),(144,144,'6.1.3.001',144,'','Salários','D',4,'A',4,0,9,0),(145,145,'6.1.3.002',145,'','13º Salários','D',4,'A',4,0,9,0),(146,146,'6.1.3.003',146,'','Encargos sociais (INSS)','D',4,'A',4,0,9,0),(147,147,'6.1.3.004',147,'','Férias','D',4,'A',4,0,9,0),(148,148,'6.1.3.005',148,'','Salários dos sócios','D',4,'A',4,0,9,0),(149,149,'6.1.3.006',149,'','Seguro dos funcionários','D',4,'A',4,0,9,0),(150,150,'6.1.3.007',150,'','Uniformes','D',4,'A',4,0,9,0),(151,151,'6.1.3.008',151,'','Horas-extras de funcionários','D',4,'A',4,0,9,0),(152,152,'6.1.3.009',152,'','Plano de saúde de funcionários','D',4,'A',4,0,9,0),(153,153,'6.1.3.010',153,'','Comissões','D',4,'A',4,0,9,0),(154,154,'6.1.3.011',154,'','Vale alimentação','D',4,'A',4,0,9,0),(155,155,'6.1.3.012',155,'','Descanso semanal remunerado','D',4,'A',4,0,9,0),(156,156,'6.1.3.013',156,'','Adicional noturno, insalubridade e periculosidade','D',4,'A',4,0,9,0),(157,157,'6.1.3.014',157,'','Salário família','D',4,'A',4,0,9,0),(158,158,'6.1.3.015',158,'','Vale transporte','D',4,'A',4,0,9,0),(159,159,'6.1.3.016',159,'','Salário ','D',4,'A',4,1,9,0),(160,160,'6.1.3.017',160,'','13º Salários','D',4,'A',4,1,9,0),(161,161,'6.1.3.018',161,'','Encargos sociais (INSS)','D',4,'A',4,1,9,0),(162,162,'6.1.3.019',162,'','Férias','D',4,'A',4,1,9,0),(163,163,'6.1.3.020',163,'','Salários dos sócios','D',4,'A',4,1,9,0),(164,164,'6.1.3.021',164,'','Seguro dos funcionários','D',4,'A',4,1,9,0),(165,165,'6.1.3.022',165,'','Uniformes','D',4,'A',4,1,9,0),(166,166,'6.1.3.023',166,'','Horas-extras de funcionários','D',4,'A',4,1,9,0),(167,167,'6.1.3.024',167,'','Comissões sobre vendas','D',4,'A',4,1,9,0),(168,168,'6.1.3.025',168,'','Vale alimentação','D',4,'A',4,1,9,0),(169,169,'6.1.3.026',169,'','Descanso semanal remunerado','D',4,'A',4,1,9,0),(170,170,'6.1.3.027',170,'','Adicional noturno, insalubridade e periculosidade','D',4,'A',4,1,9,0),(171,171,'6.1.3.028',171,'','Salário família','D',4,'A',4,1,9,0),(172,172,'6.1.3.029',172,'','Vale transporte','D',4,'A',4,1,9,0),(173,173,'6.1.3.030',173,'','Contribuição sindical','D',4,'A',4,0,9,0),(174,174,'6.1.3.031',174,'','Contribuição sindical','D',4,'A',4,1,9,0),(175,175,'6.1.4',175,'','Despesas financeiras','D',4,'S',3,0,9,0),(176,176,'6.1.4.001',176,'','Despesas bancárias','D',4,'A',4,0,9,0),(177,177,'6.1.4.002',177,'','Juros passivos','D',4,'A',4,0,9,0),(178,178,'6.1.4.003',178,'','Descontos concedidos','D',4,'A',4,0,9,0),(179,179,'6.1.4.004',179,'','Tarifas bancárias','D',4,'A',4,0,9,0),(180,180,'6.1.4.005',180,'','Empréstimos e financiamentos','D',4,'A',4,0,9,0),(181,181,'6.1.4.006',181,'','Juros e taxas passivos de cartão de crédito/débito','D',4,'A',4,0,9,0),(182,182,'6.1.4.007',182,'','Taxas e impostos bancários','D',4,'A',4,1,9,0),(183,183,'6.1.4.008',183,'','Taxas de cobrança bancária','D',4,'A',4,1,9,0),(184,184,'6.1.4.009',184,'','Juros pagos','D',4,'A',4,1,9,0),(185,185,'6.1.4.010',185,'','Descontos concedidos','D',4,'A',4,1,9,0),(186,186,'6.1.4.011',186,'','Empréstimos e financiamentos','D',4,'A',4,1,9,0),(187,187,'6.1.4.012',187,'','Juros e taxas de cartão de crédito','D',4,'A',4,1,9,0),(188,188,'6.1.5',188,'','Outras despesas operacionais','D',4,'S',3,0,9,0),(189,189,'6.1.5.001',189,'','Despesas eventuais','D',4,'A',4,0,9,0),(190,190,'6.1.6',190,'','Investimentos','D',4,'S',3,0,9,0),(191,191,'6.1.6.001',191,'','Compra de imobilizado','D',4,'A',4,0,9,0),(192,192,'6.1.6.002',192,'','Investimento em aplicação financeira','D',4,'A',4,0,9,0),(193,193,'6.1.6.003',193,'','Compra de marca ou patente','D',4,'A',4,0,9,0),(194,194,'6.1.6.004',194,'','Compra de imobilizado','D',4,'A',4,1,9,0),(195,195,'6.1.6.005',195,'','Aplicação financeira','D',4,'A',4,1,9,0),(196,196,'6.1.6.006',196,'','Compra de marca ou patente','D',4,'A',4,1,9,0),(197,197,'7',197,'','RECEITAS E DESPESAS NÃO OPERACIONAIS','C',4,'S',1,0,9,0),(198,198,'7.1',198,'','DESPESAS NÃO OPERACIONAIS','D',4,'S',2,0,6,0),(199,199,'7.1.1',199,'','Despesas não operacionais','D',4,'S',3,0,9,0),(200,200,'7.1.1.001',200,'','Outras despesas não operacionais','D',4,'A',4,0,9,0),(201,201,'7.2',201,'','RECEITAS NÃO OPERACIONAIS','C',4,'S',2,0,5,0),(202,202,'7.2.1',202,'','Receitas financeiras','C',4,'S',3,0,9,0),(203,203,'7.2.1.001',203,'','Rendimentos de aplicações financeiras','C',4,'A',4,0,9,0),(204,204,'7.2.1.002',204,'','Descontos obtidos','C',4,'A',4,0,9,0),(205,205,'7.2.1.003',205,'','Juros ativos','C',4,'A',4,0,9,0),(206,206,'7.2.1.004',206,'','Juros recebidos','C',4,'A',4,1,9,0),(207,207,'7.2.1.005',207,'','Descontos recebidos','C',4,'A',4,1,9,0),(208,208,'7.2.2',208,'','Outras receitas não operacionais','C',4,'S',3,0,9,0),(209,209,'7.2.2.001',209,'','Receitas eventuais','C',4,'A',4,0,9,0),(210,210,'7.2.2.002',210,'','Vendas de imobilizado','C',4,'A',4,1,9,0),(211,211,'8',211,'','CONTAS DE APURAÇÃO DE RESULTADOS','C',4,'S',1,0,9,0),(212,212,'8.1',212,'','APURAÇÃO DE RESULTADO','D',4,'S',2,0,9,0),(213,213,'8.1.1',213,'','Apuração de resultado','D',4,'S',3,0,9,0),(214,214,'8.1.1.001',214,'','(-) Retirada de lucro pelo proprietário','D',4,'A',4,0,9,0),(215,215,'8.1.1.002',215,'','Apuração do resultado do exercício','D',4,'A',4,0,9,0),(216,216,'8.1.1.003',216,'','Retiradas dos sócios','C',4,'A',4,1,9,0),(217,217,'8.1.1.004',217,'','IR e CSLL','C',4,'A',4,1,7,0),(218,218,'8.1.1.005',218,'','Lucro/Prejuízo apurado no exercício','C',4,'A',4,1,9,0);
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
    if new.credora_devedora not in ('c','d') then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.credora_devedora';
    end if;
    if new.codigo_natureza not in (1,2,3,4,5,9) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_natureza';
    end if;
    if new.analitica_sintetica not in ('a','s') then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
    end if;
    if new.nivel <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
    end if;
    if new.conta_dre_regime_caixa not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.conta_dre_regime_caixa';
    end if;
    if new.conta_corrente not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.conta_corrente';
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
    if new.credora_devedora not in ('c','d') then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.credora_devedora';
    end if;
    if new.codigo_natureza not in (1,2,3,4,5,9) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.codigo_natureza';
    end if;
    if new.analitica_sintetica not in ('a','s') then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.analitica_sintetica';
    end if;
    if new.nivel <= 0 then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.nivel';
    end if;
    if new.conta_dre_regime_caixa not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.conta_dre_regime_caixa';
    end if;
    if new.conta_corrente not in (0,1) then
        signal sqlstate '45000' set message_text = 'invalid value: conta_contabil.conta_corrente';
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
INSERT INTO `conta_contabil_empresa` VALUES (1,3,'',1,0),(2,3,'',1,0),(3,3,'',1,0),(4,3,'',1,0),(5,3,'',1,0),(6,3,'',1,0),(7,3,'',1,0),(8,3,'',1,0),(9,3,'',1,0),(10,3,'',1,0),(11,3,'',1,0),(12,2,'',1,0),(12,3,'',1,0),(13,3,'',1,0),(14,3,'',1,0),(15,3,'',1,0),(16,3,'',1,0),(17,3,'',1,0),(18,3,'',1,0),(19,3,'',1,0),(20,3,'',1,0),(21,3,'',1,0),(22,3,'',1,0),(23,3,'',1,0),(24,3,'',1,0),(25,3,'',1,0),(26,3,'',1,0),(27,3,'',1,0),(28,3,'',1,0),(29,3,'',1,0),(30,3,'',1,0),(31,3,'',1,0),(32,3,'',1,0),(33,3,'',1,0),(34,3,'',1,0),(35,3,'',1,0),(36,3,'',1,0),(37,3,'',1,0),(38,3,'',1,0),(39,3,'',1,0),(40,3,'',1,0),(41,3,'',1,0),(42,3,'',1,0),(43,3,'',1,0),(44,3,'',1,0),(45,3,'',1,0),(46,3,'',1,0),(47,3,'',1,0),(48,3,'',1,0),(49,3,'',1,0),(50,3,'',1,0),(51,3,'',1,0),(52,3,'',1,0),(53,3,'',1,0),(54,3,'',1,0),(55,3,'',1,0),(56,3,'',1,0),(57,3,'',1,0),(58,3,'',1,0),(59,3,'',1,0),(60,3,'',1,0),(61,3,'',1,0),(62,3,'',1,0),(63,3,'',1,0),(64,3,'',1,0),(65,3,'',1,0),(66,3,'',1,0),(67,3,'',1,0),(68,3,'',1,0),(69,3,'',1,0),(70,3,'',1,0),(71,3,'',1,0),(72,3,'',1,0),(73,3,'',1,0),(74,3,'',1,0),(75,3,'',1,0),(76,3,'',1,0),(77,3,'',1,0),(78,3,'',1,0),(79,3,'',1,0),(80,3,'',1,0),(81,3,'',1,0),(82,3,'',1,0),(83,3,'',1,0),(84,3,'',1,0),(85,3,'',1,0),(86,3,'',1,0),(87,3,'',1,0),(88,3,'',1,0),(89,3,'',1,0),(90,3,'',1,0),(91,3,'',1,0),(92,3,'',1,0),(93,3,'',1,0),(94,3,'',1,0),(95,3,'',1,0),(96,3,'',1,0),(97,3,'',1,0),(98,3,'',1,0),(99,3,'',1,0),(100,3,'',1,0),(101,3,'',1,0),(102,3,'',1,0),(103,3,'',1,0),(104,3,'',1,0),(105,3,'',1,0),(106,3,'',1,0),(107,3,'',1,0),(108,3,'',1,0),(109,3,'',1,0),(110,3,'',1,0),(111,3,'',1,0),(112,3,'',1,0),(113,3,'',1,0),(114,3,'',1,0),(115,3,'',1,0),(116,3,'',1,0),(117,3,'',1,0),(118,3,'',1,0),(119,3,'',1,0),(120,3,'',1,0),(121,3,'',1,0),(122,3,'',1,0),(123,3,'',1,0),(124,3,'',1,0),(125,3,'',1,0),(126,3,'',1,0),(127,3,'',1,0),(128,3,'',1,0),(129,3,'',1,0),(130,3,'',1,0),(131,3,'',1,0),(132,3,'',1,0),(133,3,'',1,0),(134,3,'',1,0),(135,3,'',1,0),(136,3,'',1,0),(137,3,'',1,0),(138,3,'',1,0),(139,3,'',1,0),(140,3,'',1,0),(141,3,'',1,0),(142,3,'',1,0),(143,3,'',1,0),(144,3,'',1,0),(145,3,'',1,0),(146,3,'',1,0),(147,3,'',1,0),(148,3,'',1,0),(149,3,'',1,0),(150,3,'',1,0),(151,3,'',1,0),(152,3,'',1,0),(153,3,'',1,0),(154,3,'',1,0),(155,3,'',1,0),(156,3,'',1,0),(157,3,'',1,0),(158,3,'',1,0),(159,3,'',1,0),(160,3,'',1,0),(161,3,'',1,0),(162,3,'',1,0),(163,3,'',1,0),(164,3,'',1,0),(165,3,'',1,0),(166,3,'',1,0),(167,3,'',1,0),(168,3,'',1,0),(169,3,'',1,0),(170,3,'',1,0),(171,3,'',1,0),(172,3,'',1,0),(173,3,'',1,0),(174,3,'',1,0),(175,3,'',1,0),(176,3,'',1,0),(177,3,'',1,0),(178,3,'',1,0),(179,3,'',1,0),(180,3,'',1,0),(181,3,'',1,0),(182,3,'',1,0),(183,3,'',1,0),(184,3,'',1,0),(185,3,'',1,0),(186,3,'',1,0),(187,3,'',1,0),(188,3,'',1,0),(189,3,'',1,0),(190,3,'',1,0),(191,3,'',1,0),(192,3,'',1,0),(193,3,'',1,0),(194,3,'',1,0),(195,3,'',1,0),(196,3,'',1,0),(197,3,'',1,0),(198,3,'',1,0),(199,3,'',1,0),(200,3,'',1,0),(201,3,'',1,0),(202,3,'',1,0),(203,3,'',1,0),(204,3,'',1,0),(205,3,'',1,0),(206,3,'',1,0),(207,3,'',1,0),(208,3,'',1,0),(209,3,'',1,0),(210,3,'',1,0),(211,3,'',1,0),(212,3,'',1,0),(213,3,'',1,0),(214,3,'',1,0),(215,3,'',1,0),(216,3,'',1,0),(217,3,'',1,0),(218,3,'',1,0);
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
INSERT INTO `conta_contabil_saldo` VALUES (1,3,'202401',-10.00,2),(3,3,'202401',-10.00,2),(4,2,'202401',230.00,1),(4,3,'202101',6.30,1),(4,3,'202401',203095.82,1),(5,3,'202401',-200.00,1),(10,3,'202101',6.30,2),(10,3,'202401',-30.00,1),(10,3,'202401',141.74,2),(12,2,'202401',-230.00,1),(12,3,'202101',-6.30,1),(12,3,'202101',-6.30,2),(12,3,'202401',-203086.82,1),(12,3,'202401',658.26,2),(37,3,'202401',-200.00,1),(37,3,'202401',800.00,2),(38,3,'202401',-10.50,2),(59,2,'202401',230.00,1),(59,3,'202101',6.30,1),(59,3,'202101',6.30,2),(59,3,'202401',203160.02,1),(59,3,'202401',135.44,2),(60,3,'202401',-10.50,2),(61,2,'202401',230.00,1),(80,2,'202401',-230.00,1),(80,3,'202101',-6.30,1),(80,3,'202101',-6.30,2),(80,3,'202401',-203160.02,1),(80,3,'202401',-135.44,2),(83,3,'202401',-290.00,1);
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
INSERT INTO `conta_saldo` VALUES (1,'2024-01-11',0.00),(1,'2024-01-12',-290.00),(2,'2021-01-01',12.60),(2,'2024-01-11',0.00),(2,'2024-01-12',203190.02),(7,'2024-01-12',5.00),(8,'2023-07-24',0.00),(8,'2024-01-15',230.00);
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
INSERT INTO `cte` VALUES (1,3,15,1353,2,1,'2024-01-12 11:16:01','2024-01-12 11:16:01',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31240121148618000173570010000000151000000157','','','','','','',NULL,0,0,0),(2,3,15,1353,2,1,'2024-01-11 11:16:01','2024-01-12 11:16:01',0,1,0,1,'3106200','Belo Horizonte','MG','3135308','Japaraíba','MG',0,NULL,NULL,NULL,NULL,6,1000.00,0.00,'90',0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,'','','',0.00,0.00,'31240121148618000173570010000000151000000157','','','','','','',NULL,0,0,0);
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
INSERT INTO `devolucao_compra` VALUES (1,3,9,'2024-01-12 11:15:18',4,3,NULL,500.00,500.00,0.00,0.00,0.00,0.00,0.00,0,1,NULL,NULL,2);
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
INSERT INTO `devolucao_venda` VALUES (1,3,11,'2024-01-12 11:15:17',11,NULL,10.50,10.50,0.00,0.00,0.00,0.00,1,1,NULL,2);
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
INSERT INTO `empresa` VALUES (2,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA - NFE','24634181000176','0027467430027','','2023-07-25','','',0,1,0),(3,'Posto Liberdade ME','Posto Liberdade','87976874000167','0027467430027','','2024-01-12','Empresas/3/Logo/eccbc87e4b5ce2fe28308fd9f2a7baf3','',0,1,0);
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
INSERT INTO `empresa_contato` VALUES (2,2,2,'03732619150',''),(3,3,2,'(37) 9 9865-3157',''),(24,3,3,'037999887766',''),(25,2,1,'03732619150','teste');
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
INSERT INTO `empresa_endereco` VALUES (2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',1),(3,2,'Av. Brasil','328','Centro','2º Andar','35590000','Manaus','AM','1302603','',0),(4,3,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2024-01-12 11:12:52'),(2,'Loja','Estoque disponível em loja','','','','','','','','','2023-07-25 20:59:54');
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
INSERT INTO `estoque_empresa` VALUES (1,3,0,1,0),(2,2,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES (1,3,1,19,1),(2,3,1,19,4),(3,2,1,43,4),(4,2,1,19,4),(5,2,1,14,4),(6,2,1,67,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_pagamento_evento`
--

LOCK TABLES `folha_pagamento_evento` WRITE;
/*!40000 ALTER TABLE `folha_pagamento_evento` DISABLE KEYS */;
INSERT INTO `folha_pagamento_evento` VALUES (1,1,'Salário','V',72,100.0000),(2,2,'Adiantamento de salário','D',2,0.0000),(3,3,'13º salário','V',1,100.0000),(4,4,'Adiantamento do 13º salário','V',3,0.0000),(5,5,'Pagamento de férias','V',36,100.0000),(6,6,'1/3 das férias','V',36,33.3333),(7,7,'Hora extra 50%','V',38,150.0000),(8,8,'Hora extra 100%','V',38,200.0000),(9,9,'Desconto de faltas','D',22,0.0000),(10,10,'Comissão','V',8,0.0000),(11,11,'Plano de saúde ','D',24,0.0000),(12,12,'Vale Alimentação','V',25,100.0000),(13,13,'Descanso semanal remunerado (DSR)','V',20,0.0000),(14,14,'Adicional noturno, insalubridade e periculosidade','V',4,0.0000),(15,15,'Salário família','V',71,0.0000),(16,16,'IRRF  a recolher','D',44,0.0000),(17,17,'Vale transporte','D',26,0.0000),(18,18,'INSS','D',23,0.0000),(19,19,'Contribuição sindical','D',21,0.0000);
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
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0),(10,3,1,0),(11,3,1,0),(12,3,1,0),(13,3,1,0),(14,3,1,0),(15,3,1,0),(16,3,1,0),(17,3,1,0),(18,3,1,0),(19,3,1,0);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`forma_pagamento_id`),
  UNIQUE KEY `uk_forma_pagamento_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2024-01-12 11:13:17'),(2,2,'Cheque',1,2,2,1,0,1,'2024-01-12 11:13:17'),(3,3,'Cartão',1,3,3,0,0,0,'2024-01-12 11:13:17'),(4,4,'Crediário',2,4,99,0,0,0,'2024-01-12 11:13:17'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2024-01-12 11:13:17'),(6,6,'PIX',1,6,17,0,0,1,'2024-01-12 11:13:17'),(7,NULL,'Dinheiro',1,1,0,0,0,1,'2024-01-12 11:13:04'),(8,NULL,'Outros',9,99,0,0,0,0,'2024-01-12 11:13:17'),(9,NULL,'Cheque',9,2,0,0,0,1,'2024-01-12 11:13:04'),(10,NULL,'Cartão',9,3,0,0,0,1,'2024-01-12 11:13:04'),(11,NULL,'Crediário',2,4,0,0,0,1,'2024-01-12 11:13:04'),(12,NULL,'PIX',1,6,0,0,0,1,'2024-01-12 11:13:04'),(13,NULL,'Pix',1,1,17,0,0,1,'2024-01-15 20:07:38');
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
INSERT INTO `forma_pagamento_empresa` VALUES (1,2,1,0),(1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,1,0),(6,3,1,0),(7,3,0,0),(8,3,1,0),(9,3,0,0),(10,3,0,0),(11,3,0,0),(12,3,0,0),(13,2,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,'2024-01-12 11:12:27',1,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(2,NULL,'2024-01-12 11:12:27',1,63,1,'{\"ID\":\"1\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 9 9865-3157\",\"[identificacao]\":\"(37) 9 9865-3157\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(3,NULL,'2024-01-12 11:12:27',1,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. A\",\"[identificacao]\":\"Av. A\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade\",\"[identificacao]\":\"Posto Liberdade\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(4,NULL,'2024-01-12 11:12:36',2,20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}',0,0,''),(5,NULL,'2024-01-12 11:12:36',1,63,2,'{\"ID\":\"2\",\"Tipo\":\"Telefone Celular\",\"Contato\":\"037999887766\",\"[identificacao]\":\"037999887766\",\"Observação\":\"\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(6,NULL,'2024-01-12 11:12:36',2,44,1,'{\"ID\":\"1\",\"Logradouro\":\"Av. Almirante Tamandaré\",\"[identificacao]\":\"Av. Almirante Tamandaré\",\"Número\":\"5742\",\"Bairro\":\"Centro\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,1,'{\"ID\":\"1\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Posto Liberdade ME\",\"[identificacao]\":\"Posto Liberdade ME\",\"Nome Fantasia\":\"Posto Liberdade\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"87.976.874/0001-67\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"Cartão de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(7,NULL,'2024-01-12 11:12:39',1,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"0\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"0\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"0\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"0\",\"Movimento da conta contábil\":\"Não solicita\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"0\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(8,NULL,'2024-01-12 11:12:39',1,8,1,'{\"ID\":\"1\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(9,NULL,'2024-01-12 11:12:39',1,8,2,'{\"ID\":\"2\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(10,NULL,'2024-01-12 11:12:39',1,8,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(11,NULL,'2024-01-12 11:12:39',1,8,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(12,NULL,'2024-01-12 11:12:39',1,8,5,'{\"ID\":\"5\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(13,NULL,'2024-01-12 11:12:39',1,8,6,'{\"ID\":\"6\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(14,NULL,'2024-01-12 11:12:39',1,8,7,'{\"ID\":\"7\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(15,NULL,'2024-01-12 11:12:39',1,8,8,'{\"ID\":\"8\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(16,NULL,'2024-01-12 11:12:39',1,8,9,'{\"ID\":\"9\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(17,NULL,'2024-01-12 11:12:39',1,8,10,'{\"ID\":\"10\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(18,NULL,'2024-01-12 11:12:39',1,8,11,'{\"ID\":\"11\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(19,NULL,'2024-01-12 11:12:39',1,8,12,'{\"ID\":\"12\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(20,NULL,'2024-01-12 11:12:39',1,8,13,'{\"ID\":\"13\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(21,NULL,'2024-01-12 11:12:39',1,8,14,'{\"ID\":\"14\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(22,NULL,'2024-01-12 11:12:39',1,8,15,'{\"ID\":\"15\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(23,NULL,'2024-01-12 11:12:39',1,8,16,'{\"ID\":\"16\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(24,NULL,'2024-01-12 11:12:39',1,8,17,'{\"ID\":\"17\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(25,NULL,'2024-01-12 11:12:39',1,8,18,'{\"ID\":\"18\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(26,NULL,'2024-01-12 11:12:39',1,8,19,'{\"ID\":\"19\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(27,NULL,'2024-01-12 11:12:39',1,8,20,'{\"ID\":\"20\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(28,NULL,'2024-01-12 11:12:39',1,8,21,'{\"ID\":\"21\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(29,NULL,'2024-01-12 11:12:39',1,8,22,'{\"ID\":\"22\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(30,NULL,'2024-01-12 11:12:39',1,8,23,'{\"ID\":\"23\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(31,NULL,'2024-01-12 11:12:39',1,8,24,'{\"ID\":\"24\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(32,NULL,'2024-01-12 11:12:39',1,8,25,'{\"ID\":\"25\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(33,NULL,'2024-01-12 11:12:39',1,8,26,'{\"ID\":\"26\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(34,NULL,'2024-01-12 11:12:39',1,8,27,'{\"ID\":\"27\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(35,NULL,'2024-01-12 11:12:39',1,8,28,'{\"ID\":\"28\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(36,NULL,'2024-01-12 11:12:39',1,8,29,'{\"ID\":\"29\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(37,NULL,'2024-01-12 11:12:39',1,8,30,'{\"ID\":\"30\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(38,NULL,'2024-01-12 11:12:39',1,8,31,'{\"ID\":\"31\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(39,NULL,'2024-01-12 11:12:39',1,8,32,'{\"ID\":\"32\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(40,NULL,'2024-01-12 11:12:39',1,8,33,'{\"ID\":\"33\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(41,NULL,'2024-01-12 11:12:39',1,8,34,'{\"ID\":\"34\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(42,NULL,'2024-01-12 11:12:39',1,8,35,'{\"ID\":\"35\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(43,NULL,'2024-01-12 11:12:39',1,8,36,'{\"ID\":\"36\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(44,NULL,'2024-01-12 11:12:39',1,8,37,'{\"ID\":\"37\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(45,NULL,'2024-01-12 11:12:39',1,8,38,'{\"ID\":\"38\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(46,NULL,'2024-01-12 11:12:39',1,8,39,'{\"ID\":\"39\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(47,NULL,'2024-01-12 11:12:39',1,8,40,'{\"ID\":\"40\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(48,NULL,'2024-01-12 11:12:39',1,8,41,'{\"ID\":\"41\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(49,NULL,'2024-01-12 11:12:39',1,8,42,'{\"ID\":\"42\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(50,NULL,'2024-01-12 11:12:39',1,8,43,'{\"ID\":\"43\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(51,NULL,'2024-01-12 11:12:39',1,8,44,'{\"ID\":\"44\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(52,NULL,'2024-01-12 11:12:39',1,8,45,'{\"ID\":\"45\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(53,NULL,'2024-01-12 11:12:39',1,8,46,'{\"ID\":\"46\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(54,NULL,'2024-01-12 11:12:39',1,8,47,'{\"ID\":\"47\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(55,NULL,'2024-01-12 11:12:39',1,8,48,'{\"ID\":\"48\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(56,NULL,'2024-01-12 11:12:39',1,8,49,'{\"ID\":\"49\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(57,NULL,'2024-01-12 11:12:39',1,8,50,'{\"ID\":\"50\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(58,NULL,'2024-01-12 11:12:39',1,8,51,'{\"ID\":\"51\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(59,NULL,'2024-01-12 11:12:39',1,8,52,'{\"ID\":\"52\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(60,NULL,'2024-01-12 11:12:39',1,8,53,'{\"ID\":\"53\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(61,NULL,'2024-01-12 11:12:39',1,8,54,'{\"ID\":\"54\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(62,NULL,'2024-01-12 11:12:39',1,8,55,'{\"ID\":\"55\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(63,NULL,'2024-01-12 11:12:39',1,8,56,'{\"ID\":\"56\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(64,NULL,'2024-01-12 11:12:39',1,8,57,'{\"ID\":\"57\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(65,NULL,'2024-01-12 11:12:39',1,8,58,'{\"ID\":\"58\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(66,NULL,'2024-01-12 11:12:39',1,8,59,'{\"ID\":\"59\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(67,NULL,'2024-01-12 11:12:39',1,8,60,'{\"ID\":\"60\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(68,NULL,'2024-01-12 11:12:39',1,8,61,'{\"ID\":\"61\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(69,NULL,'2024-01-12 11:12:39',1,8,62,'{\"ID\":\"62\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(70,NULL,'2024-01-12 11:12:39',1,8,63,'{\"ID\":\"63\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(71,NULL,'2024-01-12 11:12:39',1,8,64,'{\"ID\":\"64\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(72,NULL,'2024-01-12 11:12:39',1,8,65,'{\"ID\":\"65\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(73,NULL,'2024-01-12 11:12:39',1,8,66,'{\"ID\":\"66\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(74,NULL,'2024-01-12 11:12:39',1,8,67,'{\"ID\":\"67\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(75,NULL,'2024-01-12 11:12:39',1,8,68,'{\"ID\":\"68\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(76,NULL,'2024-01-12 11:12:39',1,8,69,'{\"ID\":\"69\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(77,NULL,'2024-01-12 11:12:39',1,8,70,'{\"ID\":\"70\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(78,NULL,'2024-01-12 11:12:39',1,8,71,'{\"ID\":\"71\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(79,NULL,'2024-01-12 11:12:39',1,8,72,'{\"ID\":\"72\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(80,NULL,'2024-01-12 11:12:39',1,8,73,'{\"ID\":\"73\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(81,NULL,'2024-01-12 11:12:39',1,8,74,'{\"ID\":\"74\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(82,NULL,'2024-01-12 11:12:39',1,8,75,'{\"ID\":\"75\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(83,NULL,'2024-01-12 11:12:39',1,8,76,'{\"ID\":\"76\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(84,NULL,'2024-01-12 11:12:39',1,8,77,'{\"ID\":\"77\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(85,NULL,'2024-01-12 11:12:39',1,8,78,'{\"ID\":\"78\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(86,NULL,'2024-01-12 11:12:39',1,8,79,'{\"ID\":\"79\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(87,NULL,'2024-01-12 11:12:39',1,8,80,'{\"ID\":\"80\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(88,NULL,'2024-01-12 11:12:39',1,8,81,'{\"ID\":\"81\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(89,NULL,'2024-01-12 11:12:39',1,8,82,'{\"ID\":\"82\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(90,NULL,'2024-01-12 11:12:39',1,8,83,'{\"ID\":\"83\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(91,NULL,'2024-01-12 11:12:39',1,8,84,'{\"ID\":\"84\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(92,NULL,'2024-01-12 11:12:39',1,8,85,'{\"ID\":\"85\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(93,NULL,'2024-01-12 11:12:39',1,8,86,'{\"ID\":\"86\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(94,NULL,'2024-01-12 11:12:39',1,8,87,'{\"ID\":\"87\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(95,NULL,'2024-01-12 11:12:39',1,8,88,'{\"ID\":\"88\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(96,NULL,'2024-01-12 11:12:39',1,8,89,'{\"ID\":\"89\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Descrição\":\"\",\"Tipo\":\"0\",\"Grupo\":0,\"Ativo\":\"Não\",\"Status\":\"None\",\"EmpresaEspecificaId\":3}',0,0,''),(97,NULL,'2024-01-12 11:12:39',1,7,1,'{\"ID\":\"1\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"11/01/2024\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(98,1,'2024-01-12 11:12:39',1,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(99,1,'2024-01-12 11:12:39',1,2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(100,1,'2024-01-12 11:12:39',1,3,1,'{\"ID\":\"1\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(101,1,'2024-01-12 11:12:39',1,3,2,'{\"ID\":\"2\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(102,1,'2024-01-12 11:12:39',1,3,3,'{\"ID\":\"3\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(103,1,'2024-01-12 11:12:39',1,3,4,'{\"ID\":\"4\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"BA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(104,1,'2024-01-12 11:12:39',1,3,5,'{\"ID\":\"5\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"AL\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(105,1,'2024-01-12 11:12:40',1,3,6,'{\"ID\":\"6\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"CE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(106,1,'2024-01-12 11:12:40',1,3,7,'{\"ID\":\"7\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"DF\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(107,1,'2024-01-12 11:12:40',1,3,8,'{\"ID\":\"8\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"ES\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(108,1,'2024-01-12 11:12:40',1,3,9,'{\"ID\":\"9\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"GO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(109,1,'2024-01-12 11:12:40',1,3,10,'{\"ID\":\"10\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(110,1,'2024-01-12 11:12:40',1,3,11,'{\"ID\":\"11\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(111,1,'2024-01-12 11:12:40',1,3,12,'{\"ID\":\"12\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(112,1,'2024-01-12 11:12:40',1,3,13,'{\"ID\":\"13\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"MT\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(113,1,'2024-01-12 11:12:40',1,3,14,'{\"ID\":\"14\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PA\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(114,1,'2024-01-12 11:12:40',1,3,15,'{\"ID\":\"15\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PB\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(115,1,'2024-01-12 11:12:40',1,3,16,'{\"ID\":\"16\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(116,1,'2024-01-12 11:12:40',1,3,17,'{\"ID\":\"17\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PI\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(117,1,'2024-01-12 11:12:40',1,3,18,'{\"ID\":\"18\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"PR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(118,1,'2024-01-12 11:12:40',1,3,19,'{\"ID\":\"19\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RJ\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(119,1,'2024-01-12 11:12:40',1,3,20,'{\"ID\":\"20\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RN\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(120,1,'2024-01-12 11:12:40',1,3,21,'{\"ID\":\"21\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(121,1,'2024-01-12 11:12:40',1,3,22,'{\"ID\":\"22\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RR\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(122,1,'2024-01-12 11:12:40',1,3,23,'{\"ID\":\"23\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"RS\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(123,1,'2024-01-12 11:12:40',1,3,24,'{\"ID\":\"24\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SC\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(124,1,'2024-01-12 11:12:40',1,3,25,'{\"ID\":\"25\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SE\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(125,1,'2024-01-12 11:12:40',1,3,26,'{\"ID\":\"26\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"SP\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(126,1,'2024-01-12 11:12:40',1,3,27,'{\"ID\":\"27\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":1,\"UF\":\"TO\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"6403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(127,1,'2024-01-12 11:12:40',1,3,28,'{\"ID\":\"28\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":2,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"98\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(128,1,'2024-01-12 11:12:40',1,3,29,'{\"ID\":\"29\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":3,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"1403\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"71\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"49\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(129,1,'2024-01-12 11:12:40',1,3,30,'{\"ID\":\"30\",\"Nome\":\"ICMS recolhido anteriormente por ST\",\"[identificacao]\":\"ICMS recolhido anteriormente por ST\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5411\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"99\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Sim\"}'),(130,1,'2024-01-12 11:12:40',1,3,31,'{\"ID\":\"31\",\"Nome\":\"Isentos\",\"[identificacao]\":\"Isentos\",\"Operação\":5,\"UF\":\"\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Isenta de ISS\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"Isenção\",\"Natureza da Operação do serviço\":\"Sem Dedução\",\"Alíquota ISS\":\"1,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"07\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":60,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,2,'{\"ID\":\"2\",\"Nome\":\"Serviços isentos\",\"[identificacao]\":\"Serviços isentos\",\"Tipo\":\"Serviço\",\"Ativo\":\"Sim\"}'),(131,NULL,'2024-01-12 11:12:40',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"59\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"54\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"215\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"218\",\"Movimento da conta contábil\":\"Não solicita\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(132,1,'2024-01-12 11:12:41',1,20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(133,1,'2024-01-12 11:12:41',1,44,2,'{\"ID\":\"2\",\"Logradouro\":\"Av. Benedito\",\"[identificacao]\":\"Av. Benedito\",\"Número\":\"S\",\"Bairro\":\"Mangabeiras\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,2,'{\"ID\":\"2\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(134,1,'2024-01-12 11:12:42',1,9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(135,1,'2024-01-12 11:12:42',1,63,3,'{\"ID\":\"3\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"(037) 2594-1157\",\"[identificacao]\":\"(037) 2594-1157\",\"Observação\":\"\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(136,1,'2024-01-12 11:12:42',1,44,3,'{\"ID\":\"3\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"555\",\"Bairro\":\"Centro\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',9,3,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"3\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(137,1,'2024-01-12 11:12:44',1,27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(138,1,'2024-01-12 11:12:44',1,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(139,1,'2024-01-12 11:12:44',1,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(140,1,'2024-01-12 11:12:44',1,33,1,'{\"ID\":\"1\",\"Ano de fabricação\":\"2011\",\"Ano do modelo\":\"2012\",\"Tipo de combustível\":\"Gasolina\",\"Placa\":\"ABC0153\",\"[identificacao]\":\"ABC0153\",\"Descrição\":\"Carro da empresa\",\"Marca\":\"Volkswagen\",\"Modelo\":\"Gol G5 1.0\",\"Cor\":\"Prata\",\"Renavam\":\"00535581587335\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(141,1,'2024-01-12 11:12:44',1,33,2,'{\"ID\":\"2\",\"Ano de fabricação\":\"2015\",\"Ano do modelo\":\"2016\",\"Tipo de combustível\":\"Alcool\",\"Placa\":\"QWE8237\",\"[identificacao]\":\"QWE8237\",\"Descrição\":\"Carro de passeio\",\"Marca\":\"Fiat\",\"Modelo\":\"Palho 1.0\",\"Cor\":\"Branco\",\"Renavam\":\"8234729840373\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(142,1,'2024-01-12 11:12:44',3,63,4,'{\"ID\":\"4\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(143,1,'2024-01-12 11:12:44',1,63,5,'{\"ID\":\"5\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(144,1,'2024-01-12 11:12:44',3,44,4,'{\"ID\":\"4\",\"Logradouro\":\"Av. ABC\",\"[identificacao]\":\"Av. ABC\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(145,1,'2024-01-12 11:12:44',1,44,5,'{\"ID\":\"5\",\"Logradouro\":\"Av. Chedid Jafet\",\"[identificacao]\":\"Av. Chedid Jafet\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,4,'{\"ID\":\"4\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(146,1,'2024-01-12 11:12:45',1,32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(147,1,'2024-01-12 11:12:45',1,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(148,1,'2024-01-12 11:12:45',1,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(149,1,'2024-01-12 11:12:45',1,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"10,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(150,1,'2024-01-12 11:12:45',2,32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(151,1,'2024-01-12 11:12:45',3,63,6,'{\"ID\":\"6\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-9999\",\"[identificacao]\":\"(011) 4191-9999\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(152,1,'2024-01-12 11:12:45',1,63,7,'{\"ID\":\"7\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(011) 4191-4433\",\"[identificacao]\":\"(011) 4191-4433\",\"Observação\":\"\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(153,1,'2024-01-12 11:12:45',3,44,6,'{\"ID\":\"6\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(154,1,'2024-01-12 11:12:45',1,44,7,'{\"ID\":\"7\",\"Logradouro\":\"Av. Romário\",\"[identificacao]\":\"Av. Romário\",\"Número\":\"200\",\"Bairro\":\"Vila Olimpia\",\"Complemento\":\"Edifício JK\",\"Cidade\":\"Rio de Janeiro\",\"Código do município\":\"\",\"CEP\":\"04.551-065\",\"UF\":\"RJ\",\"Observação\":\"\",\"Principal\":\"Sim\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(155,1,'2024-01-12 11:12:45',3,76,1,'{\"ID\":\"1\",\"Mês\":\"Maio/2019\",\"[identificacao]\":\"Maio/2019\",\"Valor\":\"52900,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(156,1,'2024-01-12 11:12:45',1,76,2,'{\"ID\":\"2\",\"Mês\":\"Setembro/2019\",\"[identificacao]\":\"Setembro/2019\",\"Valor\":\"8290,30\"}',32,5,'{\"Comissão\":\"0,00\",\"ID\":\"5\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"29/11/1999\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(157,1,'2024-01-12 11:12:46',1,11,1,'{\"ID\":\"1\",\"Nome\":\"Geral\",\"[identificacao]\":\"Geral\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(158,1,'2024-01-12 11:12:46',1,2,3,'{\"ID\":\"3\",\"Nome\":\"Produtos Tributados\",\"[identificacao]\":\"Produtos Tributados\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(159,1,'2024-01-12 11:12:46',1,2,4,'{\"ID\":\"4\",\"Nome\":\"Serviços Tributados\",\"[identificacao]\":\"Serviços Tributados\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(160,1,'2024-01-12 11:12:46',1,10,1,'{\"ID\":\"1\",\"Símbolo\":\"UN\",\"[identificacao]\":\"UN\",\"Nome\":\"Unidade\",\"Fraciona\":\"Não\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(161,1,'2024-01-12 11:12:49',1,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(162,1,'2024-01-12 11:12:50',1,14,1,'{\"ID\":\"1\",\"Grade\":\"GRD 2\",\"[identificacao]\":\"GRD 2\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(163,1,'2024-01-12 11:12:50',1,12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(164,1,'2024-01-12 11:12:50',1,13,1,'{\"ID\":\"1\",\"Lote\":\"LT 1\",\"[identificacao]\":\"LT 1\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(165,1,'2024-01-12 11:12:50',1,13,2,'{\"ID\":\"2\",\"Lote\":\"LT354RA48\",\"[identificacao]\":\"LT354RA48\",\"Validade\":\"\",\"Ativo\":\"Sim\"}',12,2,'{\"ID\":\"2\",\"Nome\":\"Café\",\"[identificacao]\":\"Café\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891040105427\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(166,1,'2024-01-12 11:12:50',1,12,3,'{\"ID\":\"3\",\"Nome\":\"Macarrão Sta Amália\",\"[identificacao]\":\"Macarrão Sta Amália\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(167,1,'2024-01-12 11:12:50',1,12,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Tipo\":\"Serviços\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"\",\"Código CEST\":\"\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(168,1,'2024-01-12 11:12:50',1,12,5,'{\"ID\":\"5\",\"Nome\":\"Coca-Cola 2L\",\"[identificacao]\":\"Coca-Cola 2L\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(169,1,'2024-01-12 11:12:50',1,12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(170,1,'2024-01-12 11:12:50',1,14,2,'{\"ID\":\"2\",\"Grade\":\"Grade teste\",\"[identificacao]\":\"Grade teste\",\"Códigos de barras\":\"\",\"Ativo\":\"Não\"}',12,6,'{\"ID\":\"6\",\"Nome\":\"Produto teste\",\"[identificacao]\":\"Produto teste\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(171,1,'2024-01-12 11:12:50',1,12,7,'{\"ID\":\"7\",\"Nome\":\"Feijão Carioca\",\"[identificacao]\":\"Feijão Carioca\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7896422505390\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":0,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(172,1,'2024-01-12 11:12:50',2,12,3,'{\"ID\":\"3\",\"Nome\":\"Fósforo\",\"[identificacao]\":\"Fósforo\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":1,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(173,1,'2024-01-12 11:12:50',2,12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(174,1,'2024-01-12 11:12:50',2,14,1,'{\"ID\":\"1\",\"Grade\":\"P\",\"[identificacao]\":\"P\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(175,1,'2024-01-12 11:12:50',1,14,3,'{\"ID\":\"3\",\"Grade\":\"M\",\"[identificacao]\":\"M\",\"Códigos de barras\":\"\",\"Ativo\":\"Sim\"}',12,1,'{\"ID\":\"1\",\"Nome\":\"Arroz Codil Tipo 1\",\"[identificacao]\":\"Arroz Codil Tipo 1\",\"Descrição\":\"\",\"Tipo\":\"Mercadoria para revenda\",\"Referência\":\"\",\"Quantidade por embalagem\":\"0\",\"Vida útil\":\"0\",\"Número parcelas CIAP\":\"0\",\"Função do bem/componente\":\"\",\"Código NCM\":\"10064000\",\"Código CEST\":\"0199900\",\"Código ANP\":\"\",\"CODIF\":\"\",\"Códigos de barras\":\"7891098000163\",\"Grupo\":1,\"Unidade\":1,\"Grupo regra tributária\":3,\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(176,1,'2024-01-12 11:12:53',1,42,1,'{\"ID\":\"1\",\"Nome\":\"Departamento Desenvolvimento - Orçamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(177,1,'2024-01-12 11:12:53',1,42,2,'{\"ID\":\"2\",\"Nome\":\"Departamento Desenvolvimento - Faturamento\",\"[identificacao]\":\"Departamento Desenvolvimento - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(178,1,'2024-01-12 11:12:53',1,42,3,'{\"ID\":\"3\",\"Nome\":\"Departamento Administrativo - Orçamento\",\"[identificacao]\":\"Departamento Administrativo - Orçamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(179,1,'2024-01-12 11:12:53',1,42,4,'{\"ID\":\"4\",\"Nome\":\"Departamento Administrativo - Faturamento\",\"[identificacao]\":\"Departamento Administrativo - Faturamento\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(180,1,'2024-01-12 11:12:53',1,42,5,'{\"ID\":\"5\",\"Nome\":\"Teste exclusão\",\"[identificacao]\":\"Teste exclusão\",\"Ativo\":\"Sim\",\"ListaEmpresasId\":[]}',0,0,''),(181,1,'2024-01-12 11:12:59',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"59\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"54\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"215\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"218\",\"Movimento da conta contábil\":\"Solicita\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(182,1,'2024-01-12 11:12:59',1,8,90,'{\"ID\":\"90\",\"Nome\":\"Devolução de compra à prazo\",\"[identificacao]\":\"Devolução de compra à prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":21,\"Ativo\":\"Sim\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}',0,0,''),(183,1,'2024-01-12 11:12:59',1,4,200000005,'{\"ID\":\"200000005\",\"Conta contábil\":5,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,90,'{\"ID\":\"90\",\"Nome\":\"Devolução de compra à prazo\",\"[identificacao]\":\"Devolução de compra à prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":21,\"Ativo\":\"Sim\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(184,1,'2024-01-12 11:12:59',1,4,300000013,'{\"ID\":\"300000013\",\"Conta contábil\":13,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,90,'{\"ID\":\"90\",\"Nome\":\"Devolução de compra à prazo\",\"[identificacao]\":\"Devolução de compra à prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":21,\"Ativo\":\"Sim\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(185,1,'2024-01-12 11:13:01',1,7,2,'{\"ID\":\"2\",\"Nome\":\"Caixa\",\"[identificacao]\":\"Caixa\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"11/01/2024 11:13:00\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(186,1,'2024-01-12 11:13:01',1,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias\",\"[identificacao]\":\"Compra de Mercadorias\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(187,1,'2024-01-12 11:13:01',1,1,7,'{\"ID\":\"7\",\"Nome\":\"Prestação de Serviço\",\"[identificacao]\":\"Prestação de Serviço\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(188,1,'2024-01-12 11:13:01',1,1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(189,1,'2024-01-12 11:13:01',1,8,86,'{\"ID\":86,\"Tipo\":\"Venda à vista de produtos\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(190,1,'2024-01-12 11:13:01',1,8,85,'{\"ID\":85,\"Tipo\":\"Venda à prazo de produtos\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(191,1,'2024-01-12 11:13:01',1,8,66,'{\"ID\":66,\"Tipo\":\"Recebimento de venda à prazo\"}',1,8,'{\"ID\":\"8\",\"Nome\":\"Venda de Mercadorias\",\"[identificacao]\":\"Venda de Mercadorias\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(192,1,'2024-01-12 11:13:01',1,1,9,'{\"ID\":\"9\",\"Nome\":\"NFe de entrada\",\"[identificacao]\":\"NFe de entrada\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(193,1,'2024-01-12 11:13:01',1,1,10,'{\"ID\":\"10\",\"Nome\":\"NFe de saída\",\"[identificacao]\":\"NFe de saída\",\"Entrada ou Saída\":\"Saída\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(194,1,'2024-01-12 11:13:02',1,3,32,'{\"ID\":\"32\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":6,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(195,1,'2024-01-12 11:13:02',1,3,33,'{\"ID\":\"33\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(196,1,'2024-01-12 11:13:02',1,3,34,'{\"ID\":\"34\",\"Nome\":\"Venda\",\"[identificacao]\":\"Venda\",\"Operação\":8,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(197,1,'2024-01-12 11:13:02',1,3,35,'{\"ID\":\"35\",\"Nome\":\"Compra Tributada\",\"[identificacao]\":\"Compra Tributada\",\"Operação\":4,\"UF\":\"MG\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"1102\"},\"CST de ICMS\":{\"Código\":\"00\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"100,00\",\"Alíquota de ICMS\":\"18,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Sim\",\"Soma seguro a BC ICMS\":\"Sim\",\"Soma frete a BC ICMS\":\"Sim\",\"Deduz desconto a BC ICMS\":\"Sim\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Sim\",\"Soma outraas despesas a BC ICMS ST\":\"Sim\",\"Soma seguro a BC ICMS ST\":\"Sim\",\"Soma frete a BC ICMS ST\":\"Sim\",\"Deduz desconto a BC ICMS ST\":\"Sim\",\"Calcula MVA ajustado\":\"Sim\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"50\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Sim\",\"Soma seguro a BC PIS/COFINS\":\"Sim\",\"Soma frete a BC PIS/COFINS\":\"Sim\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"03\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Sim\",\"Soma seguro a BC IPI\":\"Sim\",\"Soma frete a BC IPI\":\"Sim\",\"Deduz desconto a BC IPI\":\"Sim\",\"Código de crédito PIS/COFINS\":{\"Código\":\"101\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"1\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(198,1,'2024-01-12 11:13:02',1,3,36,'{\"ID\":\"36\",\"Nome\":\"NFe de Saída\",\"[identificacao]\":\"NFe de Saída\",\"Operação\":10,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5405\"},\"CST de ICMS\":{\"Código\":\"500\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"49\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":4,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,3,'{\"ID\":\"3\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(199,1,'2024-01-12 11:13:02',1,3,37,'{\"ID\":\"37\",\"Nome\":\"Prestação de Serviço Tributada\",\"[identificacao]\":\"Prestação de Serviço Tributada\",\"Operação\":7,\"UF\":\"\",\"Regime tributário\":\"Lucro Real\",\"CFOP\":{\"Código\":\"0\"},\"CST de ICMS\":{\"Código\":\"\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"Tributável dentro do município\",\"Natureza da tributação de serviço\":\"Simples Nacional\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"3,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"6209100\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"01\"},\"Alíquota PIS\":\"1,65\",\"Alíquota COFINS\":\"7,60\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Sim\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":null,\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"1\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[3]}',2,4,'{\"ID\":\"4\",\"Nome\":\"\",\"[identificacao]\":\"\",\"Tipo\":\"Serviço\",\"Ativo\":\"Não\"}'),(200,1,'2024-01-12 11:13:02',1,8,15,'{\"ID\":15,\"Tipo\":\"Compra à vista\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(201,1,'2024-01-12 11:13:02',1,8,14,'{\"ID\":14,\"Tipo\":\"Compra à prazo\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(202,1,'2024-01-12 11:13:02',1,8,89,'{\"ID\":89,\"Tipo\":\"Pagamento de compra à prazo\"}',1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(203,1,'2024-01-12 11:13:02',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(204,1,'2024-01-12 11:13:04',1,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro 1\",\"[identificacao]\":\"Dinheiro 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(205,1,'2024-01-12 11:13:04',2,22,7,'{\"ID\":\"7\",\"Nome\":\"Dinheiro\",\"[identificacao]\":\"Dinheiro\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(206,1,'2024-01-12 11:13:04',1,22,8,'{\"ID\":\"8\",\"Nome\":\"Outros\",\"[identificacao]\":\"Outros\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Outros\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Não\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(207,1,'2024-01-12 11:13:04',1,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque 1\",\"[identificacao]\":\"Cheque 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(208,1,'2024-01-12 11:13:04',2,22,9,'{\"ID\":\"9\",\"Nome\":\"Cheque\",\"[identificacao]\":\"Cheque\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cheque\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(209,1,'2024-01-12 11:13:04',1,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão 1\",\"[identificacao]\":\"Cartão 1\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(210,1,'2024-01-12 11:13:04',2,22,10,'{\"ID\":\"10\",\"Nome\":\"Cartão\",\"[identificacao]\":\"Cartão\",\"Tipo de pagamento\":\"Outros\",\"Grupo de pagamento\":\"Cartão\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(211,1,'2024-01-12 11:13:04',1,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário 1\",\"[identificacao]\":\"Crediário 1\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(212,1,'2024-01-12 11:13:04',2,22,11,'{\"ID\":\"11\",\"Nome\":\"Crediário\",\"[identificacao]\":\"Crediário\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(213,1,'2024-01-12 11:13:04',1,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX 1\",\"[identificacao]\":\"PIX 1\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(214,1,'2024-01-12 11:13:04',2,22,12,'{\"ID\":\"12\",\"Nome\":\"PIX\",\"[identificacao]\":\"PIX\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"PIX\",\"Forma de pagamento na NFe/NFCe\":\"0\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(215,1,'2024-01-12 11:13:18',1,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"555\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:13:17\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(216,1,'2024-01-12 11:13:19',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:13:18\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(217,1,'2024-01-12 11:13:19',1,112,2,'{\"ID\":\"2\",\"Série\":\"1\",\"Número\":\"4123\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:13:18\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(218,1,'2024-01-12 11:13:19',2,112,1,'{\"ID\":\"1\",\"Série\":\"1\",\"Número\":\"888\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:13:18\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(219,1,'2024-01-12 11:13:30',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(220,1,'2024-01-12 11:13:31',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(221,1,'2024-01-12 11:13:32',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(222,1,'2024-01-12 11:13:33',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(223,1,'2024-01-12 11:13:36',1,35,1,'{\"ID\":\"1\",\"Conta\":1,\"Data pagamento\":\"12/01/2024 11:13:35\",\"Valor\":\"200,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"200,00\",\"[identificacao]\":\"200,00\",\"EmpresaEspecificaId\":3}',0,0,''),(224,1,'2024-01-12 11:13:37',1,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista 2\",\"[identificacao]\":\"À vista 2\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(225,1,'2024-01-12 11:13:37',2,23,5,'{\"ID\":\"5\",\"Nome\":\"À vista\",\"[identificacao]\":\"À vista\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Nenhum\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(226,1,'2024-01-12 11:13:37',1,23,6,'{\"ID\":\"6\",\"Nome\":\"À prazo 30/60/90\",\"[identificacao]\":\"À prazo 30/60/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"30 / 60 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(227,1,'2024-01-12 11:13:37',1,23,7,'{\"ID\":\"7\",\"Nome\":\"À prazo 20 dias\",\"[identificacao]\":\"À prazo 20 dias\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Dinheiro\",\"Tipo de parcelamento\":\"Vencimento no próximo dia ...\",\"Vencimento\":\"20\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(228,1,'2024-01-12 11:13:37',1,23,8,'{\"ID\":\"8\",\"Nome\":\"À prazo Entrada/30/45/60/75/90\",\"[identificacao]\":\"À prazo Entrada/30/45/60/75/90\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Parcelas fixas\",\"Vencimento\":\"0\",\"Ativo\":\"Não\",\"Parcelamento\":\"0 / 30 / 45 / 60 / 75 / 90\",\"EmpresaEspecificaId\":3}',0,0,''),(229,1,'2024-01-12 11:13:37',1,23,9,'{\"ID\":\"9\",\"Nome\":\"Vencimento dia 10 do próximo mês\",\"[identificacao]\":\"Vencimento dia 10 do próximo mês\",\"Tipo de pagamento\":\"À Prazo\",\"Grupo de pagamento\":\"Crediário\",\"Tipo de parcelamento\":\"Vencimento no dia ... do próximo mês\",\"Vencimento\":\"10\",\"Ativo\":\"Não\",\"Parcelamento\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(230,1,'2024-01-12 11:14:16',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"59\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"54\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"215\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"218\",\"Movimento da conta contábil\":\"Solicita\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o orçamento\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer o pedido\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(231,1,'2024-01-12 11:14:40',1,8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}',0,0,''),(232,1,'2024-01-12 11:14:40',1,4,200000004,'{\"ID\":\"200000004\",\"Conta contábil\":4,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(233,1,'2024-01-12 11:14:40',1,4,300000012,'{\"ID\":\"300000012\",\"Conta contábil\":12,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(234,1,'2024-01-12 11:14:40',1,4,400000060,'{\"ID\":\"400000060\",\"Conta contábil\":60,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(235,1,'2024-01-12 11:14:40',1,4,100000075,'{\"ID\":\"100000075\",\"Conta contábil\":75,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(236,1,'2024-01-12 11:14:40',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,91,'{\"ID\":\"91\",\"Nome\":\"(Teste Movimento) - Vendas a Vista\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Vista\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\"}'),(237,1,'2024-01-12 11:14:40',1,8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}',0,0,''),(238,1,'2024-01-12 11:14:40',1,4,200000010,'{\"ID\":\"200000010\",\"Conta contábil\":10,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(239,1,'2024-01-12 11:14:40',1,4,300000012,'{\"ID\":\"300000012\",\"Conta contábil\":12,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(240,1,'2024-01-12 11:14:40',1,4,400000060,'{\"ID\":\"400000060\",\"Conta contábil\":60,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(241,1,'2024-01-12 11:14:40',1,4,100000075,'{\"ID\":\"100000075\",\"Conta contábil\":75,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(242,1,'2024-01-12 11:14:40',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,92,'{\"ID\":\"92\",\"Nome\":\"(Teste Movimento) - Vendas a Prazo\",\"[identificacao]\":\"(Teste Movimento) - Vendas a Prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\"}'),(243,1,'2024-01-12 11:14:40',1,8,93,'{\"ID\":\"93\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}',0,0,''),(244,1,'2024-01-12 11:14:40',1,4,200000004,'{\"ID\":\"200000004\",\"Conta contábil\":4,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,93,'{\"ID\":\"93\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(245,1,'2024-01-12 11:14:40',1,4,300000010,'{\"ID\":\"300000010\",\"Conta contábil\":10,\"Regime de apuração\":\"Caixa\",\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\"}',8,93,'{\"ID\":\"93\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\",\"EmpresaEspecificaId\":3}'),(246,1,'2024-01-12 11:14:40',1,42,4,'{\"ID\":4,\"Percentual\":\"100,00\",\"EmpresaEspecificaId\":3}',8,93,'{\"ID\":\"93\",\"Nome\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"[identificacao]\":\"(Teste Movimento) - Recebimento de vendas a prazo\",\"Descrição\":\"\",\"Tipo\":\"Crédito\",\"Grupo\":1,\"Ativo\":\"Não\",\"Status\":\"Concluido\"}'),(247,1,'2024-01-12 11:14:40',2,91,3,'{\"ID\":\"3\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"1\",\"Código de Segurança do Contribuinte\":\"0123456789\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"1045,00\",\"Conta padrão\":\"1\",\"Categoria padrão\":\"59\",\"Operação padrão\":\"5\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"1\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"54\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"215\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"218\",\"Movimento da conta contábil\":\"Solicita\",\"Fase inicial pipeline\":\"4\",\"Período pipeline\":\"2\",\"Multiplicador pipeline\":\"5,00\",\"Dias de reserva da conta\":\"30\",\"Temperatura inicial pipeline\":\"40\",\"Operação de venda\":\"8\",\"Modelo de ordem de serviço\":\"3\",\"Filtro de clientes do ServiceDesk\":\"Somente clientes da empresa\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"0\",\"O CPF do Cliente é obrigatório\":\"Sim\",\"O CNPJ do Cliente é obrigatório\":\"Sim\",\"O RG do Cliente é obrigatório\":\"Sim\",\"O IE do Cliente é obrigatório\":\"Sim\",\"O CPF do Fornecedor é obrigatório\":\"Sim\",\"O CNPJ do Fornecedor é obrigatório\":\"Sim\",\"O RG do Fornecedor é obrigatório\":\"Sim\",\"O IE do Fornecedor é obrigatório\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(248,1,'2024-01-12 11:14:46',1,108,21,'{\"ID\":\"21\",\"Tipo de movimento\":\"Perdas\",\"[identificacao]\":\"Perdas\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"12/01/2024\",\"Quantidade\":\"15,00\",\"Observação\":\"Vencimento do produto\",\"EmpresaEspecificaId\":3}',0,0,''),(249,1,'2024-01-12 11:14:46',1,108,22,'{\"ID\":\"22\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"12/01/2024\",\"Quantidade\":\"25,00\",\"Observação\":\"Recontagem de estoqueo\",\"EmpresaEspecificaId\":3}',0,0,''),(250,1,'2024-01-12 11:14:46',1,108,23,'{\"ID\":\"23\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Arroz Codil Tipo 1\",\"Grade\":\"P\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"23/12/2023\",\"Quantidade\":\"58,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(251,1,'2024-01-12 11:14:46',1,108,24,'{\"ID\":\"24\",\"Tipo de movimento\":\"Sobras\",\"[identificacao]\":\"Sobras\",\"Produto\":\"Fósforo\",\"Grade\":\"\",\"Lote\":\"\",\"Local do estoque\":\"Loja\",\"Data\":\"23/12/2023\",\"Quantidade\":\"40,00\",\"Observação\":\"Balanço\",\"EmpresaEspecificaId\":3}',0,0,''),(252,1,'2024-01-12 11:14:49',1,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"12/01/2024 11:14:49\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(253,1,'2024-01-12 11:14:51',2,106,1,'{\"ID\":\"1\",\"Data de entrada\":\"12/01/2024 11:14:49\",\"Data de saída\":\"12/01/2024 11:14:51\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(254,1,'2024-01-12 11:14:53',1,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"12/01/2024 11:14:53\",\"Data de saída\":\"\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(255,1,'2024-01-12 11:14:55',2,107,1,'{\"ID\":\"1\",\"Data de entrada\":\"12/01/2024 11:14:53\",\"Data de saída\":\"12/01/2024 11:14:55\",\"Justificativa\":\"teste modo de contingencia\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(256,1,'2024-01-12 11:15:03',1,24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(257,1,'2024-01-12 11:15:03',1,63,8,'{\"ID\":\"8\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"(37) 3261-9150\",\"[identificacao]\":\"(37) 3261-9150\",\"Observação\":\"\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(258,1,'2024-01-12 11:15:03',1,44,8,'{\"ID\":\"8\",\"Logradouro\":\"Avenida 1\",\"[identificacao]\":\"Avenida 1\",\"Número\":\"1\",\"Bairro\":\"Centro\",\"Complemento\":\"S.T.A.R. Labs\",\"Cidade\":\"Central City\",\"Código do município\":\"3104205\",\"CEP\":\"35.580-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',24,6,'{\"ID\":\"6\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Simples Nacional\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}'),(259,1,'2024-01-12 11:15:03',1,112,13,'{\"ID\":\"13\",\"Série\":\"1\",\"Número\":\"577\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:15:03\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(260,1,'2024-01-12 11:15:11',1,32,7,'{\"Comissão\":\"0,00\",\"ID\":\"7\",\"Tipo pessoa\":\"0\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"12/01/2004\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(261,NULL,'2024-01-12 11:15:11',1,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"118,00\",\"Preço médio de custo\":\"39,56\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(262,NULL,'2024-01-12 11:15:11',1,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(263,NULL,'2024-01-12 11:15:11',1,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,0001\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(264,NULL,'2024-01-12 11:15:11',1,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(265,NULL,'2024-01-12 11:15:11',1,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(266,NULL,'2024-01-12 11:15:11',1,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(267,1,'2024-01-12 11:15:11',3,114,5,'{\"ID\":\"5\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(268,1,'2024-01-12 11:15:11',1,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"5,00\",\"Preço médio de custo\":\"10,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(269,1,'2024-01-12 11:15:11',2,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(270,1,'2024-01-12 11:15:12',3,114,1,'{\"ID\":\"1\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"118,00\",\"Preço médio de custo\":\"39,56\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(271,1,'2024-01-12 11:15:12',3,114,2,'{\"ID\":\"2\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(272,1,'2024-01-12 11:15:12',3,114,4,'{\"ID\":\"4\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"20,00\",\"Preço médio de custo\":\"5,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(273,1,'2024-01-12 11:15:12',3,114,6,'{\"ID\":\"6\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(274,1,'2024-01-12 11:15:12',3,114,3,'{\"ID\":\"3\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"25,00\",\"Preço médio de custo\":\"2,0001\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(275,1,'2024-01-12 11:15:12',3,114,7,'{\"ID\":\"7\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"150,00\",\"Preço médio de custo\":\"25,80\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(276,1,'2024-01-12 11:15:12',1,114,8,'{\"ID\":\"8\",\"Código do produto\":\"1\",\"Nome do produto\":\"Arroz Codil Tipo 1\",\"Quantidade\":\"58,00\",\"Preço médio de custo\":\"39,56\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(277,1,'2024-01-12 11:15:12',1,114,9,'{\"ID\":\"9\",\"Código do produto\":\"2\",\"Nome do produto\":\"Café\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,80\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(278,1,'2024-01-12 11:15:12',1,114,10,'{\"ID\":\"10\",\"Código do produto\":\"3\",\"Nome do produto\":\"Fósforo\",\"Quantidade\":\"40,00\",\"Preço médio de custo\":\"2,0001\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(279,1,'2024-01-12 11:15:12',1,114,11,'{\"ID\":\"11\",\"Código do produto\":\"5\",\"Nome do produto\":\"Coca-Cola 2L\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"5,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(280,1,'2024-01-12 11:15:12',1,114,12,'{\"ID\":\"12\",\"Código do produto\":\"6\",\"Nome do produto\":\"Produto teste\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"0,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(281,1,'2024-01-12 11:15:12',1,114,13,'{\"ID\":\"13\",\"Código do produto\":\"7\",\"Nome do produto\":\"Feijão Carioca\",\"Quantidade\":\"0,00\",\"Preço médio de custo\":\"8,00\"}',113,202312,'{\"ID\":\"202312\",\"Competência\":\"Dezembro/2023\",\"[identificacao]\":\"Dezembro/2023\",\"EmpresaEspecificaId\":3}'),(282,1,'2024-01-12 11:15:12',1,112,14,'{\"ID\":\"14\",\"Série\":\"1\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":10,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:15:11\",\"Destinatário\":3,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(283,1,'2024-01-12 11:15:17',1,1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(284,1,'2024-01-12 11:15:17',1,8,11,'{\"ID\":11,\"Tipo\":\"Devolução de venda à vista\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(285,1,'2024-01-12 11:15:17',1,8,9,'{\"ID\":9,\"Tipo\":\"Devolução de venda à prazo\"}',1,11,'{\"ID\":\"11\",\"Nome\":\"Devolução de Venda\",\"[identificacao]\":\"Devolução de Venda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Sim\",\"Movimenta o financeiro\":\"Sim\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}'),(286,1,'2024-01-12 11:15:19',1,9,8,'{\"Tipo pessoa\":\"Pessoa Jurídica\",\"ID\":\"8\",\"Regime tributário\":\"Lucro Real\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(287,1,'2024-01-12 11:15:19',1,16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(288,1,'2024-01-12 11:15:19',1,8,11,'{\"ID\":11}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(289,1,'2024-01-12 11:15:19',1,4,20,'{\"ID\":20,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Caixa\"}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(290,1,'2024-01-12 11:15:19',1,4,30,'{\"ID\":30,\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Caixa\"}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(291,1,'2024-01-12 11:15:19',1,4,1,'{\"ID\":1,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Competência\"}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(292,1,'2024-01-12 11:15:19',1,4,3,'{\"ID\":3,\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Competência\"}',16,7,'{\"ID\":\"7\",\"Fornecedor\":3,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(293,1,'2024-01-12 11:15:19',1,16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(294,1,'2024-01-12 11:15:20',1,8,11,'{\"ID\":11}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(295,1,'2024-01-12 11:15:20',1,4,20,'{\"ID\":20,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Caixa\"}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(296,1,'2024-01-12 11:15:20',1,4,30,'{\"ID\":30,\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Caixa\"}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(297,1,'2024-01-12 11:15:20',1,4,1,'{\"ID\":1,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Competência\"}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(298,1,'2024-01-12 11:15:20',1,4,3,'{\"ID\":3,\"Operação\":\"Débito/Subtrai no saldo\",\"Crédito/Débito\":\"\",\"Percentual\":\"100,00\",\"Regime\":\"Competência\"}',16,8,'{\"ID\":\"8\",\"Fornecedor\":7,\"Conta\":1,\"Documento\":\"0000000007\",\"[identificacao]\":\"0000000007\",\"Emissão\":\"12/01/2024 11:15:19\",\"Vencimento\":\"12/02/2024 11:15:19\",\"Pagamento\":\"\",\"Valor\":\"5,00\",\"Desconto\":\"0,00\",\"Acréscimo\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor líquido\":\"5,00\",\"Valor em aberto\":\"5,00\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(299,1,'2024-01-12 11:15:31',1,27,9,'{\"ID\":\"9\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(300,1,'2024-01-12 11:15:32',2,27,1,'{\"ID\":\"1\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"0\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(301,1,'2024-01-12 11:15:33',1,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(302,1,'2024-01-12 11:15:33',2,29,8,'{\"ID\":\"8\",\"Nome\":\"Manutenção de computadores\",\"[identificacao]\":\"Manutenção de computadores\",\"Descrição\":\"Manutenção de computadores\",\"Grupo\":0,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"0,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(303,1,'2024-01-12 11:15:33',2,29,4,'{\"ID\":\"4\",\"Nome\":\"Troca de óleo\",\"[identificacao]\":\"Troca de óleo\",\"Descrição\":\"Troca de óleo\",\"Grupo\":1,\"Regra tributária\":0,\"Código do serviço (ENotas)\":\"0\",\"Código do serviço\":\"\",\"Valor\":\"80,00\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(304,1,'2024-01-12 11:15:33',1,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":1,\"Data início\":\"12/01/2023 11:15:33\",\"Data término\":\"12/01/2026 11:15:33\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IGPM\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(305,1,'2024-01-12 11:15:35',2,28,1,'{\"ID\":\"1\",\"Cliente\":2,\"Parceiro\":0,\"Serviço\":4,\"SLA\":0,\"Conta\":1,\"Categoria\":1,\"Data início\":\"12/01/2023\",\"Data término\":\"12/01/2026\",\"Dia do vencimento\":\"15\",\"Valor\":\"50,00\",\"Percentual\":\"0,00\",\"Percentual do parceiro\":\"0,00\",\"Índice de reajuste\":\"IGPM\",\"Documento fiscal\":\"Nota fiscal\",\"Tipo de faturamento\":\"Não antecipado\",\"Cálculo do faturamento\":\"Integral mensal\",\"Periodicidade do faturamento\":\"Mensal\",\"Observação\":\"Teste gerado em ClienteContratoApplicationTest\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(306,1,'2024-01-12 11:15:35',1,37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024 11:15:34\",\"Vencimento\":\"17/01/2024 11:15:34\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(307,1,'2024-01-12 11:15:35',1,8,66,'{\"ID\":66}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024 11:15:34\",\"Vencimento\":\"17/01/2024 11:15:34\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(308,1,'2024-01-12 11:15:35',1,4,4,'{\"ID\":4,\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"Débito\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024 11:15:34\",\"Vencimento\":\"17/01/2024 11:15:34\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(309,1,'2024-01-12 11:15:35',1,4,10,'{\"ID\":10,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"Crédito\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024 11:15:34\",\"Vencimento\":\"17/01/2024 11:15:34\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(310,1,'2024-01-12 11:15:35',1,4,64,'{\"ID\":64,\"Operação\":\"Crédito/Soma no saldo\",\"Crédito/Débito\":\"Crédito\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024 11:15:34\",\"Vencimento\":\"17/01/2024 11:15:34\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(311,1,'2024-01-12 11:15:37',2,37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}',0,0,''),(312,1,'2024-01-12 11:15:37',3,4,4,'{\"ID\":4,\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(313,1,'2024-01-12 11:15:37',3,4,10,'{\"ID\":10,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(314,1,'2024-01-12 11:15:37',3,4,64,'{\"ID\":64,\"Operação\":\"Crédito/Soma no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(315,1,'2024-01-12 11:15:37',3,8,66,'{\"ID\":66}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(316,1,'2024-01-12 11:15:37',1,8,66,'{\"ID\":66}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(317,1,'2024-01-12 11:15:37',1,4,4,'{\"ID\":4,\"Operação\":\"Débito/Soma no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(318,1,'2024-01-12 11:15:37',1,4,10,'{\"ID\":10,\"Operação\":\"Crédito/Subtrai no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(319,1,'2024-01-12 11:15:37',1,4,64,'{\"ID\":64,\"Operação\":\"Crédito/Soma no saldo\",\"Crédito/Débito\":\"0\",\"Regime\":\"Caixa\",\"Percentual\":\"100,00\"}',37,4,'{\"ID\":\"4\",\"Cliente\":8,\"Conta\":1,\"Documento\":\"Teste api\",\"[identificacao]\":\"Teste api\",\"Emissão\":\"12/01/2024\",\"Vencimento\":\"17/01/2024\",\"Pagamento\":\"\",\"Valor\":\"170,50\",\"Desconto\":\"5,00\",\"Acréscimo\":\"5,00\",\"Juros\":\"0,00\",\"Valor pago\":\"0,00\",\"Valor em aberto\":\"170,50\",\"Observação\":\"\",\"EmpresaEspecificaId\":3}'),(320,1,'2024-01-12 11:16:04',1,112,15,'{\"ID\":\"15\",\"Série\":\"1\",\"Número\":\"221\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e de ajuste\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"13/01/2024 11:16:03\",\"Destinatário\":2,\"Modalidade do frete\":\"Contratação do Frete por conta do Remetente\",\"Transportador\":0,\"Pagamento\":\"0\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(321,1,'2024-01-12 11:16:06',1,112,16,'{\"ID\":\"16\",\"Série\":\"1\",\"Número\":\"8249\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"12/01/2024 11:16:05\",\"Data e hora de saída\":\"12/01/2024 11:16:05\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(322,1,'2024-01-12 11:16:06',1,112,17,'{\"ID\":\"17\",\"Série\":\"1\",\"Número\":\"8773\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"12/01/2024 11:16:05\",\"Data e hora de saída\":\"12/01/2024 11:16:05\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(323,1,'2024-01-12 11:16:06',1,112,18,'{\"ID\":\"18\",\"Série\":\"1\",\"Número\":\"9296\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"12/01/2024 11:16:05\",\"Data e hora de saída\":\"12/01/2024 11:16:05\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"100,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"100,00\",\"Valor de ICMS\":\"18,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"100,00\",\"Valor do PIS\":\"1,65\",\"Valor do COFINS\":\"7,60\",\"Valor total liquido\":\"100,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(324,1,'2024-01-12 11:16:06',2,112,18,'{\"ID\":\"18\",\"Série\":\"1\",\"Número\":\"9296\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Entrada\",\"Tipo de emitente\":\"Terceiros\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":9,\"Data e hora de emissão\":\"12/01/2024 11:16:06\",\"Data e hora de saída\":\"12/01/2024 11:16:06\",\"Destinatário\":2,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(325,1,'2024-01-12 11:16:07',2,1,6,'{\"ID\":\"6\",\"Nome\":\"Compra de Mercadorias para revenda\",\"[identificacao]\":\"Compra de Mercadorias para revenda\",\"Entrada ou Saída\":\"Entrada\",\"Movimento o estoque\":\"Não\",\"Movimenta o financeiro\":\"Não\",\"Atualiza preços\":\"Sim\",\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(326,1,'2024-01-12 11:32:14',2,7,2,'{\"ID\":\"2\",\"Nome\":\"Caixa\",\"[identificacao]\":\"Caixa\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"11/01/2024\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(327,1,'2024-01-12 11:32:14',2,7,7,'{\"ID\":\"7\",\"Nome\":\"Pdv Teste\",\"[identificacao]\":\"Pdv Teste\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"12/01/2024\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":3}',0,0,''),(328,1,'2024-01-12 16:11:31',1,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(329,1,'2024-01-12 16:12:13',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(330,1,'2024-01-12 16:37:17',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(331,1,'2024-01-12 16:54:20',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(332,1,'2024-01-12 17:13:19',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(333,1,'2024-01-12 17:13:48',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(334,1,'2024-01-12 17:53:38',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(335,1,'2024-01-12 17:57:38',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(336,1,'2024-01-12 17:59:14',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(337,1,'2024-01-12 17:59:55',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(338,1,'2024-01-12 18:02:16',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(339,1,'2024-01-12 18:02:56',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(340,1,'2024-01-12 18:03:29',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(341,1,'2024-01-12 18:03:46',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(342,1,'2024-01-12 18:09:47',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(343,1,'2024-01-12 18:11:29',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(344,1,'2024-01-12 18:11:39',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(345,1,'2024-01-12 18:11:46',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(346,1,'2024-01-12 18:27:52',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(347,1,'2024-01-12 18:28:04',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(348,1,'2024-01-12 18:28:20',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(349,1,'2024-01-12 18:36:08',1,9,11,'{\"Tipo pessoa\":\"Pessoa Física\",\"ID\":\"11\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"22/06/1963\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(350,1,'2024-01-15 11:38:50',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(351,1,'2024-01-15 11:39:23',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(352,1,'2024-01-15 11:41:23',2,27,10,'{\"ID\":\"10\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"23/03/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":3}',0,0,''),(353,NULL,'2024-01-15 11:46:24',1,20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(354,NULL,'2024-01-15 11:46:24',1,63,10,'{\"ID\":\"10\",\"Tipo\":\"Telefone Comercial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(355,NULL,'2024-01-15 11:46:24',1,63,11,'{\"ID\":\"11\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(356,NULL,'2024-01-15 11:46:24',1,44,10,'{\"ID\":\"10\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Dr. Luciano\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Não\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(357,NULL,'2024-01-15 11:46:24',1,44,11,'{\"ID\":\"11\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"328\",\"Bairro\":\"Centro\",\"Complemento\":\"2º Andar\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(358,NULL,'2024-01-15 11:46:25',2,7,8,'{\"ID\":\"8\",\"Nome\":\"Caixa interno\",\"[identificacao]\":\"Caixa interno\",\"Tipo de conta\":\"Caixa\",\"Saldo inicial\":\"0,00\",\"Data saldo inicial\":\"24/07/2023\",\"Conta bancária\":{\"Instituição financeira\":{\"Banco\":\"\"},\"Agência\":\"\",\"Conta\":\"\",\"Operação\":\"\"},\"Conta contábil\":0,\"Ativo\":\"Sim\",\"EmpresaEspecificaId\":2}',0,0,''),(359,1,'2024-01-15 11:47:05',3,91,2,'{\"ID\":\"2\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"0\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"0\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"0\",\"Movimento da conta contábil\":\"Não solicita\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(360,1,'2024-01-15 11:47:37',2,91,2,'{\"ID\":\"2\",\"Regime tributário\":\"Simples Nacional\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"Empresas/2/NFe/Certificados/GERALDA_APARECIDA_DE_MIRANDA_SILVA_99553082653_-_senha_CREDITAR2023_14-09-2023.pfx\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"c+cuA60lCxIpR0IjvYkFbg==\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"0\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"0\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"0\",\"Movimento da conta contábil\":\"Não solicita\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(361,1,'2024-01-15 11:54:09',2,3,40,'{\"ID\":\"40\",\"Nome\":\"ST em Minas Gerais\",\"[identificacao]\":\"ST em Minas Gerais\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5403\"},\"CST de ICMS\":{\"Código\":\"90\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"99\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":\"999\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(362,1,'2024-01-15 11:54:12',2,2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(363,1,'2024-01-15 14:38:03',2,63,9,'{\"ID\":\"9\",\"Tipo\":\"E-mail\",\"Contato\":\"victor_theo_dasilva@virage.com.br\",\"[identificacao]\":\"victor_theo_dasilva@virage.com.br\",\"Observação\":\"\"}',27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(364,1,'2024-01-15 14:38:03',2,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Rua Durval de Barros\",\"[identificacao]\":\"Rua Durval de Barros\",\"Número\":\"465\",\"Bairro\":\"Conjunto Taquaril\",\"Complemento\":\"\",\"Cidade\":\"Belo Horizonte\",\"Código do município\":\"3106200\",\"CEP\":\"30.290-250\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(365,1,'2024-01-15 14:38:03',2,27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(366,1,'2024-01-15 15:11:11',2,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Rua Durval de Barros\",\"[identificacao]\":\"Rua Durval de Barros\",\"Número\":\"465\",\"Bairro\":\"Conjunto Taquaril\",\"Complemento\":\"\",\"Cidade\":\"Manaus\",\"Código do município\":\"1302603\",\"CEP\":\"30.290-250\",\"UF\":\"AM\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(367,1,'2024-01-15 15:12:38',1,3,41,'{\"ID\":\"41\",\"Nome\":\"ST no Amazonas\",\"[identificacao]\":\"ST no Amazonas\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5403\"},\"CST de ICMS\":{\"Código\":\"90\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"99\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":\"999\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":0,\"Observação\":\"\",\"ListaEmpresasId\":[2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(368,1,'2024-01-15 15:16:36',2,3,41,'{\"ID\":\"41\",\"Nome\":\"ST no Amazonas\",\"[identificacao]\":\"ST no Amazonas\",\"Operação\":1,\"UF\":\"AM\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5403\"},\"CST de ICMS\":{\"Código\":\"90\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"99\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":\"999\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(369,NULL,'2024-01-15 15:57:49',2,20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA - NFE\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}',0,0,''),(370,NULL,'2024-01-15 15:57:49',3,63,11,'{\"ID\":\"11\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA - NFE\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(371,NULL,'2024-01-15 15:57:49',1,63,12,'{\"ID\":\"12\",\"Tipo\":\"Telefone Residencial\",\"Contato\":\"03732619150\",\"[identificacao]\":\"03732619150\",\"Observação\":\"\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA - NFE\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(372,NULL,'2024-01-15 15:57:49',2,44,10,'{\"ID\":\"10\",\"Logradouro\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"[identificacao]\":\"Av. Dr. Antônio Luciano Pereira Filho\",\"Número\":\"485\",\"Bairro\":\"Coronel Dr. Luciano\",\"Complemento\":\"Loja 1\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA - NFE\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(373,NULL,'2024-01-15 15:57:49',2,44,11,'{\"ID\":\"11\",\"Logradouro\":\"Av. Brasil\",\"[identificacao]\":\"Av. Brasil\",\"Número\":\"328\",\"Bairro\":\"Centro\",\"Complemento\":\"2º Andar\",\"Cidade\":\"Manaus\",\"Código do município\":\"1302603\",\"CEP\":\"35.590-000\",\"UF\":\"AM\",\"Observação\":\"\",\"Principal\":\"Não\"}',20,14,'{\"ID\":\"14\",\"Tipo\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Nome/Razão Social\":\"Geralda Aparecida de Miranda Silva\",\"[identificacao]\":\"Geralda Aparecida de Miranda Silva\",\"Nome Fantasia\":\"TEMPERO CRISTALINA - NFE\",\"CPF\":\"\",\"Identidade\":\"\",\"Contribuinte\":\"0\",\"CNPJ\":\"24.634.181/0001-76\",\"Data de nascimento\":\"\",\"Inscrição estadual\":\"0027467430027\",\"Inscrição municipal\":\"\",\"IE de produtor rural\":\"\",\"Observação\":\"\",\"Ativo\":\"Não\",\"Excluido\":\"Não\"}'),(374,1,'2024-01-15 16:04:46',2,44,9,'{\"ID\":\"9\",\"Logradouro\":\"Rua Durval de Barros\",\"[identificacao]\":\"Rua Durval de Barros\",\"Número\":\"465\",\"Bairro\":\"Conjunto Taquaril\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"30.290-250\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(375,1,'2024-01-15 16:13:58',2,91,2,'{\"ID\":\"2\",\"Regime tributário\":\"Não Especificado\",\"Regime tributário especial\":\"Microempresário e Empresa de Pequeno Porte (ME EPP)\",\"Incentivo fiscal\":\"Não\",\"NFSe - Numeração lote\":\"0\",\"NFSe - Gateway\":\"0\",\"Certificado A1\":\"Empresas/2/NFe/Certificados/GERALDA_APARECIDA_DE_MIRANDA_SILVA_99553082653_-_senha_CREDITAR2023_14-09-2023.pfx\",\"Link Certificado A1\":\"\",\"[password]Senha do certificado\":\"c+cuA60lCxIpR0IjvYkFbg==\",\"Identificador do CSC\":\"\",\"Código de Segurança do Contribuinte\":\"\",\"Conta contábil do Inventário\":\"0\",\"Nome do responsável pelo Sintegra\":\"\",\"Valor salário mínimo\":\"0,00\",\"Conta padrão\":\"0\",\"Categoria padrão\":\"0\",\"Operação padrão\":\"0\",\"Faturamento - Serie da NFSe\":\"0\",\"Forma de pagamento padrão (Import. Retorno)\":\"0\",\"Juros diários %\":\"0,00\",\"Dias carência de juros\":\"0\",\"Cálculo de juros\":\"0\",\"Multa %\":\"0,00\",\"Dias carência da multa\":\"0\",\"Conta contábil de resultado - Balanço Patrimonial\":\"0\",\"Conta contábil de resultado - DRE (Regime de Competência)\":\"0\",\"Conta contábil de resultado - DRE (Regime de Caixa)\":\"0\",\"Movimento da conta contábil\":\"Não solicita\",\"Fase inicial pipeline\":\"0\",\"Período pipeline\":\"0\",\"Multiplicador pipeline\":\"0,00\",\"Dias de reserva da conta\":\"0\",\"Temperatura inicial pipeline\":\"0\",\"Operação de venda\":\"1\",\"Modelo de ordem de serviço\":\"0\",\"Filtro de clientes do ServiceDesk\":\"0\",\"Ação quando o produto do orçamento não possuir estoque suficiente\":\"0\",\"Ação quando o produto do pedido não possuir estoque suficiente\":\"0\",\"Ação quando o produto da venda não possuir estoque suficiente\":\"Não informa que não tem estoque e permite fazer a venda\",\"O CPF do Cliente é obrigatório\":\"Não\",\"O CNPJ do Cliente é obrigatório\":\"Não\",\"O RG do Cliente é obrigatório\":\"Não\",\"O IE do Cliente é obrigatório\":\"Não\",\"O CPF do Fornecedor é obrigatório\":\"Não\",\"O CNPJ do Fornecedor é obrigatório\":\"Não\",\"O RG do Fornecedor é obrigatório\":\"Não\",\"O IE do Fornecedor é obrigatório\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(376,1,'2024-01-15 17:44:27',2,27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(377,1,'2024-01-15 19:24:36',2,27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Não Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(378,1,'2024-01-15 19:25:50',2,3,40,'{\"ID\":\"40\",\"Nome\":\"ST em Minas Gerais\",\"[identificacao]\":\"ST em Minas Gerais\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5403\"},\"CST de ICMS\":{\"Código\":\"60\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"99\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":\"999\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(379,1,'2024-01-15 19:26:31',2,3,40,'{\"ID\":\"40\",\"Nome\":\"ST em Minas Gerais\",\"[identificacao]\":\"ST em Minas Gerais\",\"Operação\":1,\"UF\":\"MG\",\"Regime tributário\":\"Não Especificado\",\"CFOP\":{\"Código\":\"5403\"},\"CST de ICMS\":{\"Código\":\"40\",\"Situação tributária\":\"Tributado\",\"CSOSN\":\"Não\"},\"Percentual de BC de ICMS\":\"0,00\",\"Alíquota de ICMS\":\"0,00\",\"Alíquota de Crédito de ICMS-SN\":\"0,00\",\"Modalidade de BC de ICMS\":\"Margem de Valor Agregado\",\"Percentual do ICMS diferido\":\"0,00\",\"Soma outras despesas a BC ICMS\":\"Não\",\"Soma seguro a BC ICMS\":\"Não\",\"Soma frete a BC ICMS\":\"Não\",\"Deduz desconto a BC ICMS\":\"Não\",\"MVA ICMS ST\":\"0,00\",\"Percentual de BC ICMS ST\":\"0,00\",\"Alíquota ICMS ST\":\"0,00\",\"Alíquota interestadual ICMS\":\"0,00\",\"Alíquota ICMS Destino\":\"0,00\",\"Modalidade BC ICMS ST\":\"Preço Tabelado Máximo Sugerido\",\"Soma IPI a BC ICMS ST\":\"Não\",\"Soma outraas despesas a BC ICMS ST\":\"Não\",\"Soma seguro a BC ICMS ST\":\"Não\",\"Soma frete a BC ICMS ST\":\"Não\",\"Deduz desconto a BC ICMS ST\":\"Não\",\"Calcula MVA ajustado\":\"Não\",\"Tipo de tributação de serviço\":\"0\",\"Natureza da tributação de serviço\":\"0\",\"Exigibilidade do ISS\":\"0\",\"Natureza da Operação do serviço\":\"0\",\"Alíquota ISS\":\"0,00\",\"ISS retido\":\"Não\",\"Código CNAE\":\"\",\"Código Beneficio Fiscal\":\"\",\"Código tributação do município\":\"\",\"CST de PIS/COFINS\":{\"Código\":\"99\"},\"Alíquota PIS\":\"0,00\",\"Alíquota COFINS\":\"0,00\",\"Soma outras despesas a BC PIS/COFINS\":\"Não\",\"Soma seguro a BC PIS/COFINS\":\"Não\",\"Soma frete a BC PIS/COFINS\":\"Não\",\"Deduz desconto a BC PIS/COFINS\":\"Não\",\"CST IPI\":{\"Código\":\"\"},\"Alíquota IPI\":\"0,00\",\"Enquadramento do IPI\":\"999\",\"Soma outras despesas a BC IPI\":\"Não\",\"Soma seguro a BC IPI\":\"Não\",\"Soma frete a BC IPI\":\"Não\",\"Deduz desconto a BC IPI\":\"Não\",\"Código de crédito PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da BC de crédito de PIS/COFINS\":{\"Código\":\"0\"},\"Código de contribuíção de PIS/COFINS\":{\"Código\":\"0\"},\"Natureza da receita de PIS/COFINS\":\"\",\"FCP Percentual do ICMS\":\"0,00\",\"FCP Percentual do ICMS ST\":\"0,00\",\"FCP Percentual do ICMS ST Retido\":\"0,00\",\"FCP Alíquota do ICMS ST Retido\":\"0,00\",\"Conta contábil\":12,\"Observação\":\"\",\"ListaEmpresasId\":[2]}',2,1,'{\"ID\":\"1\",\"Nome\":\"Substituição tributária\",\"[identificacao]\":\"Substituição tributária\",\"Tipo\":\"Produto\",\"Ativo\":\"Não\"}'),(380,1,'2024-01-15 20:04:26',1,22,13,'{\"ID\":\"13\",\"Nome\":\"Pix\",\"[identificacao]\":\"Pix\",\"Tipo de pagamento\":\"À Vista\",\"Grupo de pagamento\":\"Dinheiro\",\"Forma de pagamento na NFe/NFCe\":\"Pagamento Instantâneo (PIX)\",\"Abre gaveta\":\"Não\",\"TEF\":\"Não\",\"Movimenta saldo\":\"Sim\",\"Ativo\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(381,1,'2024-01-15 20:55:52',1,27,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(382,1,'2024-01-15 20:58:08',1,44,12,'{\"ID\":\"12\",\"Logradouro\":\"Rua Anicauera\",\"[identificacao]\":\"Rua Anicauera\",\"Número\":\"247\",\"Bairro\":\"Eldorado\",\"Complemento\":\"\",\"Cidade\":\"Diadema\",\"Código do município\":\"3513801\",\"CEP\":\"04.325-001\",\"UF\":\"SP\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(383,1,'2024-01-15 20:58:52',2,44,12,'{\"ID\":\"12\",\"Logradouro\":\"Rua Anicauera\",\"[identificacao]\":\"Rua Anicauera\",\"Número\":\"247\",\"Bairro\":\"Eldorado\",\"Complemento\":\"\",\"Cidade\":\"Lagoa da Prata\",\"Código do município\":\"3137205\",\"CEP\":\"35.590-000\",\"UF\":\"MG\",\"Observação\":\"\",\"Principal\":\"Sim\"}',27,15,'{\"ID\":\"15\",\"Tipo pessoa\":\"Pessoa Jurídica\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"\",\"Contribuinte\":\"Contribuinte\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}'),(384,1,'2024-01-15 21:06:51',1,112,27,'{\"ID\":\"27\",\"Série\":\"0\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"15/01/2024\",\"Destinatário\":15,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(385,1,'2024-01-15 21:07:33',2,112,27,'{\"ID\":\"27\",\"Série\":\"0\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"15/01/2024\",\"Destinatário\":15,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"10,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"10,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(386,1,'2024-01-15 21:08:25',2,112,27,'{\"ID\":\"27\",\"Série\":\"15\",\"Número\":\"12712\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":15,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"10,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"10,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(387,1,'2024-01-15 21:08:58',2,112,27,'{\"ID\":\"27\",\"Série\":\"15\",\"Número\":\"12712\",\"Protocolo\":\"\",\"Recibo\":\"310000084496836\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":15,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"10,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"10,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(388,1,'2024-01-15 21:09:07',1,112,27,'{\"ID\":\"27\",\"Série\":\"15\",\"Número\":\"12712\",\"Protocolo\":\"131240148590961\",\"Recibo\":\"310000084496983\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"15/01/2024 21:09:05\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":15,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"10,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"10,00\",\"Observações\":\"\",\"Observações do fisco\":\"    \",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(389,1,'2024-01-15 21:09:35',1,112,28,'{\"ID\":\"28\",\"Série\":\"0\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"15/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"0,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"0,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(390,1,'2024-01-15 21:10:02',2,112,28,'{\"ID\":\"28\",\"Série\":\"0\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"15/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"50,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"50,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(391,1,'2024-01-15 21:10:09',2,112,28,'{\"ID\":\"28\",\"Série\":\"0\",\"Número\":\"0\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Normal\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"50,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"50,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(392,1,'2024-01-15 21:10:46',2,112,28,'{\"ID\":\"28\",\"Série\":\"15\",\"Número\":\"12713\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Consumidor final\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"15/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"50,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"50,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(393,1,'2024-01-15 21:11:01',2,112,28,'{\"ID\":\"28\",\"Série\":\"15\",\"Número\":\"12713\",\"Protocolo\":\"\",\"Recibo\":\"\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Consumidor final\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"50,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"50,00\",\"Observações\":\"\",\"Observações do fisco\":\"\",\"Emitida\":\"Não\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(394,1,'2024-01-15 21:11:20',2,27,12,'{\"ID\":\"12\",\"Tipo pessoa\":\"Pessoa Física\",\"Regime tributário\":\"Não Especificado\",\"Data de nascimento\":\"10/05/1988\",\"Contribuinte\":\"Isento\",\"Ativo\":\"Sim\",\"Excluido\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,''),(395,1,'2024-01-15 21:12:57',1,112,28,'{\"ID\":\"28\",\"Série\":\"15\",\"Número\":\"12713\",\"Protocolo\":\"131240148591114\",\"Recibo\":\"310000084496845\",\"Entrada/Saída\":\"Saída\",\"Tipo de emitente\":\"Emissão Própria\",\"Finalidade\":\"NF-e normal\",\"Indicador consumidor final\":\"Consumidor final\",\"Presença do comprador\":\"Não se aplica\",\"Operação\":13,\"Data e hora de emissão\":\"15/01/2024 21:12:55\",\"Data e hora de saída\":\"16/01/2024\",\"Destinatário\":12,\"Modalidade do frete\":\"Sem Ocorrência de Transporte\",\"Transportador\":0,\"Pagamento\":\"À Vista\",\"Valor total bruto\":\"50,00\",\"Valor de outras despesas\":\"0,00\",\"Valor do frete\":\"0,00\",\"Valor do seguro\":\"0,00\",\"Valor do desconto\":\"0,00\",\"Base de cálculo de ICMS\":\"0,00\",\"Valor de ICMS\":\"0,00\",\"Valor do diferimento de ICMS\":\"0,00\",\"Base de cálculo de ICMS ST\":\"0,00\",\"Valor de ICMS ST\":\"0,00\",\"Base de cálculo de IPI\":\"0,00\",\"Valor de IPI\":\"0,00\",\"Base de cálculo de Pis/Cofins\":\"0,00\",\"Valor do PIS\":\"0,00\",\"Valor do COFINS\":\"0,00\",\"Valor total liquido\":\"50,00\",\"Observações\":\"\",\"Observações do fisco\":\"        \",\"Emitida\":\"Sim\",\"Cancelada\":\"Não\",\"Denegada\":\"Não\",\"Excluído\":\"Não\",\"EmpresaEspecificaId\":2}',0,0,'');
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
INSERT INTO `log_empresa` VALUES (1,3),(2,3),(3,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(46,3),(47,3),(48,3),(49,3),(50,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(57,3),(58,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(67,3),(68,3),(69,3),(70,3),(71,3),(72,3),(73,3),(74,3),(75,3),(76,3),(77,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(84,3),(85,3),(86,3),(87,3),(88,3),(89,3),(90,3),(91,3),(92,3),(93,3),(94,3),(95,3),(96,3),(97,3),(98,3),(99,3),(100,3),(101,3),(102,3),(103,3),(104,3),(105,3),(106,3),(107,3),(108,3),(109,3),(110,3),(111,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(122,3),(123,3),(124,3),(125,3),(126,3),(127,3),(128,3),(129,3),(130,3),(131,3),(132,3),(133,3),(134,3),(135,3),(136,3),(137,3),(138,3),(139,3),(140,3),(141,3),(142,3),(143,3),(144,3),(145,3),(146,3),(147,3),(148,3),(149,3),(150,3),(151,3),(152,3),(153,3),(154,3),(155,3),(156,3),(157,3),(158,3),(159,3),(160,3),(161,3),(162,3),(163,3),(164,3),(165,3),(166,3),(167,3),(168,3),(169,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(181,3),(182,3),(183,3),(184,3),(185,3),(186,3),(187,3),(188,3),(189,3),(190,3),(191,3),(192,3),(193,3),(194,3),(195,3),(196,3),(197,3),(198,3),(199,3),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(223,3),(224,3),(225,3),(226,3),(227,3),(228,3),(229,3),(230,3),(231,3),(232,3),(233,3),(234,3),(235,3),(236,3),(237,3),(238,3),(239,3),(240,3),(241,3),(242,3),(243,3),(244,3),(245,3),(246,3),(247,3),(248,3),(249,3),(250,3),(251,3),(252,3),(253,3),(254,3),(255,3),(256,3),(257,3),(258,3),(259,3),(260,3),(261,3),(262,3),(263,3),(264,3),(265,3),(266,3),(267,3),(268,3),(269,3),(270,3),(271,3),(272,3),(273,3),(274,3),(275,3),(276,3),(277,3),(278,3),(279,3),(280,3),(281,3),(282,3),(283,3),(284,3),(285,3),(286,3),(287,3),(288,3),(289,3),(290,3),(291,3),(292,3),(293,3),(294,3),(295,3),(296,3),(297,3),(298,3),(299,3),(300,3),(301,3),(302,3),(303,3),(304,3),(305,3),(306,3),(307,3),(308,3),(309,3),(310,3),(311,3),(312,3),(313,3),(314,3),(315,3),(316,3),(317,3),(318,3),(319,3),(320,3),(321,3),(322,3),(323,3),(324,3),(325,3),(326,3),(327,3),(328,3),(329,3),(330,3),(331,3),(332,3),(333,3),(334,3),(335,3),(336,3),(337,3),(338,3),(339,3),(340,3),(341,3),(342,3),(343,3),(344,3),(345,3),(346,3),(347,3),(348,3),(349,3),(350,3),(351,3),(352,3),(353,2),(354,2),(355,2),(356,2),(357,2),(358,2),(359,2),(360,2),(361,2),(362,2),(363,2),(364,2),(365,2),(366,2),(367,2),(368,2),(374,2),(375,2),(376,2),(377,2),(378,2),(379,2),(380,2),(381,2),(382,2),(383,2),(384,2),(385,2),(386,2),(387,2),(388,2),(389,2),(390,2),(391,2),(392,2),(393,2),(394,2),(395,2);
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
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credito_debito` char(1) NOT NULL DEFAULT '',
  `regime` int(1) NOT NULL DEFAULT '0',
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
  CONSTRAINT `fk_movimento_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_movimento_10` FOREIGN KEY (`pagar_id`) REFERENCES `pagar` (`pagar_id`),
  CONSTRAINT `fk_movimento_11` FOREIGN KEY (`receber_id`) REFERENCES `receber` (`receber_id`),
  CONSTRAINT `fk_movimento_12` FOREIGN KEY (`devolucao_compra_id`) REFERENCES `devolucao_compra` (`devolucao_compra_id`),
  CONSTRAINT `fk_movimento_13` FOREIGN KEY (`devolucao_venda_id`) REFERENCES `devolucao_venda` (`devolucao_venda_id`),
  CONSTRAINT `fk_movimento_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`),
  CONSTRAINT `fk_movimento_3` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`caixa_id`),
  CONSTRAINT `fk_movimento_4` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_movimento_5` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`venda_id`),
  CONSTRAINT `fk_movimento_6` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`pagamento_id`),
  CONSTRAINT `fk_movimento_7` FOREIGN KEY (`recebimento_id`) REFERENCES `recebimento` (`recebimento_id`),
  CONSTRAINT `fk_movimento_8` FOREIGN KEY (`folha_pagamento_lancamento_id`) REFERENCES `folha_pagamento_lancamento` (`folha_pagamento_lancamento_id`),
  CONSTRAINT `fk_movimento_9` FOREIGN KEY (`transferencia_id`) REFERENCES `movimento` (`movimento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2024-01-12 11:13:29','2024-01-12 11:13:29',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'D',1,0,1),(2,3,1,NULL,'Conclusão da compra 105522 do fornecedor Femsa LTDA','2024-01-12 11:13:30','2024-01-12 11:13:29',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100.00,'D',2,0,0),(3,3,1,NULL,'Conclusão da compra 19985763 do fornecedor Femsa LTDA','2024-01-12 11:13:31','2024-01-12 11:13:31',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',1,0,1),(4,3,1,NULL,'Conclusão da compra 19985764 do fornecedor Femsa LTDA','2024-01-12 11:13:32','2024-01-12 11:13:31',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',1,0,1),(5,3,1,NULL,'Conclusão da compra 129583 do fornecedor Femsa LTDA','2024-01-12 11:13:33','2024-01-12 11:13:33',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,0),(6,3,1,NULL,'Conclusão da compra 129584 do fornecedor Femsa LTDA','2024-01-12 11:13:34','2024-01-12 11:13:33',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,0),(7,3,1,NULL,'Conclusão da compra 129585 do fornecedor Femsa LTDA','2024-01-12 11:13:34','2024-01-12 11:13:34',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,'D',1,0,1),(8,3,1,NULL,'Conclusão da compra 129586 do fornecedor Femsa LTDA','2024-01-12 11:13:34','2024-01-12 11:13:34',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',1,0,1),(9,3,1,NULL,'Conclusão da compra 129587 do fornecedor Femsa LTDA','2024-01-12 11:13:35','2024-01-12 11:13:34',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',1,0,1),(10,3,1,NULL,'Conclusão da compra 13250 do fornecedor Femsa LTDA','2024-01-12 11:13:35','2024-01-12 11:13:35',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90.00,'D',1,0,0),(11,3,1,NULL,'Pagamento: 10 - Femsa LTDA','2024-01-12 11:13:35','2024-01-12 11:13:35',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'D',1,0,0),(12,3,2,NULL,'Conclusão da venda 11 para consumidor final','2024-01-12 11:14:49','2024-01-12 11:14:49',NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105.00,'C',1,0,0),(13,3,2,NULL,'Conclusão da venda 12  para o cliente Jeff Bezos','2024-01-12 11:14:49','2024-01-12 11:14:49',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200000.01,'C',1,0,0),(14,3,2,NULL,'Conclusão da venda 13 para consumidor final','2024-01-12 11:14:49','2024-01-12 11:14:49',NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',1,0,0),(15,3,2,NULL,'Conclusão da venda 14 para consumidor final','2024-01-12 11:14:49','2024-01-12 11:14:49',NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.01,'C',1,0,0),(16,3,2,NULL,'Conclusão da venda 16  para o cliente Jeff Bezos','2024-01-12 11:14:57','2024-01-12 11:14:57',NULL,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135.44,'C',3,0,0),(17,3,2,NULL,'Conclusão da venda 17 para consumidor final','2024-01-12 11:14:57','2024-01-12 11:14:57',NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(18,3,2,NULL,'Conclusão da venda 18 para consumidor final','2024-01-12 11:14:57','2024-01-12 11:14:57',NULL,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',1,0,0),(19,3,2,NULL,'Devolução da venda 11 para consumidor final','2024-01-12 11:15:18','2024-01-12 11:15:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,10.50,'D',1,0,0),(20,3,1,NULL,'Devolução da compra 129583 do fornecedor ','2024-01-12 11:15:18','2024-01-12 11:15:18',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500.00,'C',1,0,0),(21,3,1,NULL,'Documento à pagar: 0000000007','2024-01-12 11:15:19','2024-01-12 11:15:19',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,5.00,'D',2,0,0),(22,3,1,NULL,'Documento à pagar: 0000000007','2024-01-12 11:15:19','2024-01-12 11:15:19',NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,5.00,'D',2,0,0),(23,3,7,1,'Sangria','2024-01-12 11:16:03','2024-01-12 11:16:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.00,'D',1,0,0),(24,3,7,1,'Suprimento','2024-01-12 11:16:03','2024-01-12 11:16:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8.00,'C',1,0,0),(25,3,2,NULL,'Conclusão da venda 19 para consumidor final','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',1,0,0),(26,3,2,NULL,'Conclusão da venda 20  para o cliente Jeff Bezos','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6.30,'C',3,0,0),(27,2,8,NULL,'Conclusão da venda 21  para o cliente Victor Theo Cláudio da Silva','2024-01-15 11:51:14','2024-01-15 11:51:14',NULL,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(28,2,8,NULL,'Conclusão da venda 22  para o cliente Victor Theo Cláudio da Silva','2024-01-15 15:59:06','2024-01-15 15:59:06',NULL,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',1,0,0),(29,2,8,NULL,'Conclusão da venda 23  para o cliente Victor Theo Cláudio da Silva','2024-01-15 16:21:11','2024-01-15 16:21:11',NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'C',1,0,0),(30,2,8,NULL,'Conclusão da venda 24  para o cliente Victor Theo Cláudio da Silva','2024-01-15 17:44:49','2024-01-15 17:44:49',NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(31,2,8,NULL,'Conclusão da venda 25  para o cliente Victor Theo Cláudio da Silva','2024-01-15 20:05:46','2024-01-15 20:05:46',NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20.00,'C',1,0,0),(32,2,8,NULL,'Conclusão da venda 26  para o cliente Victor Theo Cláudio da Silva','2024-01-15 20:10:06','2024-01-15 20:10:06',NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'C',1,0,0),(33,2,8,NULL,'Conclusão da venda 27  para o cliente Nicolas e Sophia Empreendimentos ME','2024-01-15 20:56:40','2024-01-15 20:56:40',NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.00,'C',1,0,1),(34,2,8,NULL,'Conclusão da venda 28  para o cliente Victor Theo Cláudio da Silva','2024-01-15 21:15:06','2024-01-15 21:15:06',NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30.00,'C',1,0,0);
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
INSERT INTO `movimento_categoria` VALUES (1,15,NULL,'',300.00),(2,14,NULL,'',100.00),(3,15,NULL,'',500.00),(4,15,NULL,'',500.00),(5,14,NULL,'',500.00),(6,14,NULL,'',700.00),(7,15,NULL,'',70.00),(8,15,NULL,'',80.00),(9,15,NULL,'',90.00),(10,15,NULL,'',90.00),(11,89,NULL,'',200.00),(12,86,NULL,'',105.00),(13,86,NULL,'',200000.01),(14,86,NULL,'',30.00),(15,86,NULL,'',3000.01),(16,85,NULL,'',135.44),(17,86,NULL,'',10.00),(18,86,NULL,'',15.00),(19,11,NULL,'',10.50),(20,29,NULL,'',500.00),(21,11,NULL,'',5.00),(22,11,NULL,'',5.00),(25,86,NULL,'',6.30),(26,85,NULL,'',6.30),(27,86,NULL,'',10.00),(28,86,NULL,'',30.00),(29,86,NULL,'',50.00),(30,86,NULL,'',10.00),(31,86,NULL,'',20.00),(32,86,NULL,'',80.00),(33,86,NULL,'',70.00),(34,86,NULL,'',30.00);
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
  `operacao` int(1) NOT NULL DEFAULT '0',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  `regime` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movimento_id`,`categoria_id`,`conta_contabil_id`,`operacao`),
  KEY `k_movimento_conta_contabil_1` (`movimento_id`),
  KEY `k_movimento_conta_contabil_2` (`categoria_id`),
  KEY `k_movimento_conta_contabil_3` (`conta_contabil_id`),
  KEY `k_movimento_conta_contabil_4` (`movimento_id`,`categoria_id`),
  CONSTRAINT `fk_movimento_conta_contabil_1` FOREIGN KEY (`movimento_id`) REFERENCES `movimento` (`movimento_id`),
  CONSTRAINT `fk_movimento_conta_contabil_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_conta_contabil`
--

LOCK TABLES `movimento_conta_contabil` WRITE;
/*!40000 ALTER TABLE `movimento_conta_contabil` DISABLE KEYS */;
INSERT INTO `movimento_conta_contabil` VALUES (1,15,4,3,300.00,1),(1,15,12,2,300.00,1),(1,15,83,1,300.00,1),(2,14,12,2,100.00,2),(2,14,37,4,100.00,2),(3,15,4,3,500.00,1),(3,15,12,2,500.00,1),(3,15,83,1,500.00,1),(4,15,4,3,500.00,1),(4,15,12,2,500.00,1),(4,15,83,1,500.00,1),(5,14,12,2,500.00,2),(5,14,37,4,500.00,2),(6,14,12,2,700.00,2),(6,14,37,4,700.00,2),(7,15,4,3,70.00,1),(7,15,12,2,70.00,1),(7,15,83,1,70.00,1),(8,15,4,3,80.00,1),(8,15,12,2,80.00,1),(8,15,83,1,80.00,1),(9,15,4,3,90.00,1),(9,15,12,2,90.00,1),(9,15,83,1,90.00,1),(10,15,4,3,90.00,1),(10,15,12,2,90.00,1),(10,15,83,1,90.00,1),(11,89,5,3,200.00,1),(11,89,37,1,200.00,1),(11,89,83,1,200.00,1),(12,86,4,2,105.00,1),(12,86,12,3,105.00,1),(12,86,59,4,105.00,1),(12,86,80,1,105.00,1),(13,86,4,2,200000.01,1),(13,86,12,3,200000.01,1),(13,86,59,4,200000.01,1),(13,86,80,1,200000.01,1),(14,86,4,2,30.00,1),(14,86,12,3,30.00,1),(14,86,59,4,30.00,1),(14,86,80,1,30.00,1),(15,86,4,2,3000.01,1),(15,86,12,3,3000.01,1),(15,86,59,4,3000.01,1),(15,86,80,1,3000.01,1),(16,85,4,2,30.00,1),(16,85,10,2,135.44,2),(16,85,10,3,30.00,1),(16,85,12,3,135.44,2),(16,85,59,4,135.44,2),(16,85,80,1,135.44,2),(17,86,4,2,10.00,1),(17,86,12,3,10.00,1),(17,86,59,4,10.00,1),(17,86,80,1,10.00,1),(18,86,4,2,15.00,1),(18,86,12,3,15.00,1),(18,86,59,4,15.00,1),(18,86,80,1,15.00,1),(19,11,4,3,10.50,1),(19,11,12,1,10.50,1),(19,11,38,1,10.50,2),(19,11,60,3,10.50,2),(20,29,12,3,500.00,2),(20,29,37,1,500.00,2),(21,11,1,3,5.00,2),(21,11,3,1,5.00,2),(22,11,1,3,5.00,2),(22,11,3,1,5.00,2),(25,86,4,2,6.30,1),(25,86,12,3,6.30,1),(25,86,59,4,6.30,1),(25,86,80,1,6.30,1),(26,85,10,2,6.30,2),(26,85,12,3,6.30,2),(26,85,59,4,6.30,2),(26,85,80,1,6.30,2),(27,86,4,2,10.00,1),(27,86,12,3,10.00,1),(27,86,59,4,10.00,1),(27,86,61,4,10.00,1),(27,86,80,1,10.00,1),(28,86,4,2,30.00,1),(28,86,12,3,30.00,1),(28,86,59,4,30.00,1),(28,86,61,4,30.00,1),(28,86,80,1,30.00,1),(29,86,4,2,50.00,1),(29,86,12,3,50.00,1),(29,86,59,4,50.00,1),(29,86,61,4,50.00,1),(29,86,80,1,50.00,1),(30,86,4,2,10.00,1),(30,86,12,3,10.00,1),(30,86,59,4,10.00,1),(30,86,61,4,10.00,1),(30,86,80,1,10.00,1),(31,86,4,2,20.00,1),(31,86,12,3,20.00,1),(31,86,59,4,20.00,1),(31,86,61,4,20.00,1),(31,86,80,1,20.00,1),(32,86,4,2,80.00,1),(32,86,12,3,80.00,1),(32,86,59,4,80.00,1),(32,86,61,4,80.00,1),(32,86,80,1,80.00,1),(33,86,4,2,70.00,1),(33,86,12,3,70.00,1),(33,86,59,4,70.00,1),(33,86,61,4,70.00,1),(33,86,80,1,70.00,1),(34,86,4,2,30.00,1),(34,86,12,3,30.00,1),(34,86,59,4,30.00,1),(34,86,61,4,30.00,1),(34,86,80,1,30.00,1);
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
INSERT INTO `movimento_forma_pagamento` VALUES (1,1,1,NULL,NULL,NULL,300.00,'D',1),(2,3,8,NULL,NULL,NULL,500.00,'D',0),(3,4,1,NULL,NULL,NULL,500.00,'D',1),(4,7,1,NULL,NULL,NULL,70.00,'D',1),(5,8,1,NULL,NULL,NULL,80.00,'D',1),(6,9,1,NULL,NULL,NULL,90.00,'D',1),(7,10,1,NULL,NULL,NULL,90.00,'D',1),(8,11,1,NULL,NULL,NULL,200.00,'D',1),(9,12,1,NULL,NULL,NULL,105.00,'C',1),(10,13,1,NULL,NULL,NULL,200000.01,'C',1),(11,14,1,NULL,NULL,NULL,50.00,'C',1),(12,14,1,NULL,NULL,NULL,20.00,'D',1),(13,15,1,NULL,NULL,NULL,3000.01,'C',1),(14,16,1,NULL,NULL,NULL,30.00,'C',1),(15,16,4,NULL,NULL,NULL,105.44,'C',0),(16,17,1,NULL,NULL,NULL,10.00,'C',1),(17,18,1,NULL,NULL,NULL,15.00,'C',1),(18,23,1,NULL,NULL,NULL,3.00,'D',1),(19,24,1,NULL,NULL,NULL,8.00,'C',1),(20,25,1,NULL,NULL,NULL,6.30,'C',1),(21,26,4,NULL,NULL,NULL,6.30,'C',1),(22,27,1,NULL,NULL,NULL,10.00,'C',1),(23,28,1,NULL,NULL,NULL,30.00,'C',1),(24,29,1,NULL,NULL,NULL,50.00,'C',1),(25,30,1,NULL,NULL,NULL,10.00,'C',1),(26,31,1,NULL,NULL,NULL,20.00,'C',1),(27,32,1,NULL,NULL,NULL,80.00,'C',1),(28,33,1,NULL,NULL,NULL,70.00,'C',1),(29,34,1,NULL,NULL,NULL,30.00,'C',1);
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
INSERT INTO `movimento_operacao` VALUES (1,1,1,1),(2,1,1,1),(3,0,1,1),(4,0,1,1),(5,1,1,1),(6,1,1,1),(7,1,1,1),(8,1,1,1),(9,1,1,1),(10,1,1,1),(12,1,1,1),(13,1,1,1),(14,1,1,1),(15,1,1,1),(16,1,1,1),(17,1,1,1),(18,1,1,1),(19,1,1,1),(20,1,1,1),(25,1,1,1),(26,1,1,1),(27,1,1,1),(28,1,1,1),(29,1,1,1),(30,1,1,1),(31,1,1,1),(32,1,1,1),(33,1,1,1),(34,1,1,1);
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
INSERT INTO `nf` VALUES (1,3,13250,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,3,9,NULL,1,90.00,90.00,0.00,0.00,0.00,0.00,90.00,16.20,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'',0,0);
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
  `aliquota_icms_destino` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
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
INSERT INTO `nf_item` VALUES (1,1,1,1,NULL,1102,1,10.0000,9.0000,90.00,90.00,0.00,0.00,0.00,0.00,'00',90.00,18.0000,0.0000,0.0000,16.20,0.00,0.0000,0.00,'00',0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,1,0);
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
INSERT INTO `nfce` VALUES (1,3,NULL,3551,1,'31231287976874000167650010000035511000035510','','','2023-12-05 00:00:00','2023-12-05 00:00:00',1,200.00,200.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,1,'','','0001-01-01 00:00:00','',1,'','','',1,0,0,0);
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
INSERT INTO `nfce_contingencia` VALUES (1,3,'2024-01-12 11:14:49','2024-01-12 11:14:51','teste modo de contingencia',0);
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
  `destinatario_emitente_endereco_id` int(11) DEFAULT NULL,
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
  `base_calculo_credito_icms_sn` decimal(15,2) NOT NULL DEFAULT '0.00',
  `valor_credito_icms_sn` decimal(15,2) NOT NULL DEFAULT '0.00',
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
  KEY `k_nfe_4` (`destinatario_emitente_endereco_id`),
  KEY `k_nfe_5` (`transportador_id`),
  KEY `k_nfe_6` (`estoque_id`),
  CONSTRAINT `fk_nfe_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_nfe_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_nfe_3` FOREIGN KEY (`destinatario_emitente_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nfe_4` FOREIGN KEY (`destinatario_emitente_endereco_id`) REFERENCES `pessoa_endereco` (`pessoa_endereco_id`),
  CONSTRAINT `fk_nfe_5` FOREIGN KEY (`transportador_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_nfe_6` FOREIGN KEY (`estoque_id`) REFERENCES `estoque` (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe`
--

LOCK TABLES `nfe` WRITE;
/*!40000 ALTER TABLE `nfe` DISABLE KEYS */;
INSERT INTO `nfe` VALUES (1,3,888,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2024-01-13 11:13:18',1,0,2,2,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(2,3,4123,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2024-01-13 11:13:19',1,0,2,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,1),(3,3,105522,'E',1,'31160704731855000143550010007485481189117075','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,300.00,300.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(4,3,129589,'E',1,'35170556639107000139550010001295891214189392','','',0,0,6,'2024-01-10 00:00:00','2024-01-12 00:00:00',5,1,3,NULL,9,NULL,2,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(5,3,19985761,'E',1,'31190824634181000176550240000051671667165118','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(6,3,19985762,'E',1,'31190724634181000176550740000000091895382522','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(7,3,19985763,'E',1,'31190624634181000176550240000051471672414309','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(8,3,19985764,'E',1,'31190624634181000176550240000051461229102452','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(9,3,129581,'E',1,'31190624634181000176550240000051451431684303','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(10,3,129582,'E',1,'31190624634181000176550240000051441127964116','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,1),(11,3,129583,'E',1,'31190524634181000176550240000051431383098847','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,2,500.00,500.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(12,3,129584,'E',1,'31190524634181000176550240000051421383098840','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,2,700.00,700.00,0.00,0.00,0.00,0.00,300.00,54.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',1,0,0,0),(13,3,577,'E',1,'','','',0,0,9,'0001-01-01 00:00:00','2024-01-13 11:15:03',1,0,2,2,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(14,3,0,'S',1,'','','',0,0,10,'0001-01-01 00:00:00','2024-01-13 11:15:12',1,0,3,3,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',1,'','',0,0,0,0),(15,3,221,'E',3,'','','',0,0,9,'0001-01-01 00:00:00','2024-01-13 11:16:04',1,0,2,2,0,NULL,0,100.00,100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',0,0,0,0),(16,3,8249,'E',1,'31200620319623000139550010000584391752772151','','',0,0,9,'2024-01-12 11:16:05','2024-01-12 11:16:05',1,1,2,NULL,9,NULL,1,100.00,100.00,0.00,0.00,0.00,0.00,100.00,18.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,1.65,7.60,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(17,3,8773,'E',1,'31200829826502000158550010000198201919116443','','',0,0,9,'2024-01-12 11:16:06','2024-01-12 11:16:06',1,1,2,NULL,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(18,3,9296,'E',1,'31200906249102000121550020002381841003458376','','',0,0,9,'2024-01-12 11:16:06','2024-01-12 11:16:06',1,1,2,NULL,9,NULL,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',NULL,'','',1,0,0,0),(19,3,19985763,'E',1,'31240121148618000174550010045642481045642481','','',0,0,6,'2024-01-12 00:00:00','2024-01-12 00:00:00',1,1,3,NULL,9,NULL,1,1000.00,1008.00,0.00,0.00,0.00,0.00,200.00,36.00,0.00,2.00,3.00,2.00,3.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,2.00,2.00,0.00,0.00,'','',1,'','',1,0,0,0),(20,2,12705,'S',1,'13240124634181000176550150000127051972862486','','310000084495346',1,0,1,'0001-01-01 00:00:00','2024-01-15 16:00:00',15,0,12,NULL,9,NULL,1,10.00,10.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','',2,'','DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL. NAO GERA DIREITO A CREDITO FISCAL DE IPI E ICMS.',0,0,0,0),(21,2,12706,'S',1,'31240124634181000176550150000127061694520375','131240148590140','310000084495364',1,0,1,'2024-01-15 16:15:04','2024-01-16 16:14:46',15,0,12,NULL,9,NULL,1,30.00,30.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127061694520375.xml','',2,'','DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL. NAO GERA DIREITO A CREDITO FISCAL DE IPI E ICMS.',1,0,0,0),(22,2,12707,'S',1,'31240124634181000176550150000127071275679666','131240148590690','310000084496548',1,0,1,'2024-01-15 17:43:27','2024-01-15 17:45:16',15,0,12,NULL,9,NULL,1,50.00,50.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127071275679666.xml','',2,'','',1,0,0,0),(23,2,12708,'S',1,'31240124634181000176550150000127081575820051','131240148590891','310000084496279',1,0,1,'2024-01-15 19:26:37','2024-01-15 19:28:35',15,0,12,NULL,9,NULL,1,10.00,10.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127081575820051.xml','',2,'','',1,0,0,0),(24,2,12709,'S',1,'31240124634181000176550150000127091629618767','131240148590897','310000084496299',1,0,1,'2024-01-15 20:07:46','2024-01-15 20:09:43',15,0,12,NULL,9,NULL,1,20.00,20.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127091629618767.xml','',2,'','',1,0,0,0),(25,2,12710,'S',1,'31240124634181000176550150000127101789853501','131240148591088','310000084496802',1,0,1,'2024-01-15 20:50:59','2024-01-15 20:52:55',15,0,12,NULL,9,NULL,1,80.00,80.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127101789853501.xml','Empresas/2/NFe/xml/31240124634181000176550150000127101789853501-110111-procEventoNFe.xml',2,'','',1,1,0,0),(26,2,12711,'S',1,'31240124634181000176550150000127111249676615','131240148591106','310000084496975',1,0,1,'2024-01-15 21:04:21','2024-01-15 21:06:19',15,0,15,NULL,9,NULL,1,70.00,70.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127111249676615.xml','Empresas/2/NFe/xml/31240124634181000176550150000127111249676615-110111-procEventoNFe.xml',2,'','',1,1,0,0),(27,2,12712,'S',1,'31240124634181000176550150000127121756979454','131240148590961','310000084496983',0,0,13,'2024-01-15 21:09:05','2024-01-16 00:00:00',15,0,15,12,9,NULL,1,10.00,10.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127121756979454.xml','',2,'','    ',1,0,0,0),(28,2,12713,'S',1,'31240124634181000176550150000127131042778910','131240148591114','310000084496845',1,0,13,'2024-01-15 21:12:55','2024-01-16 00:00:00',15,0,12,9,9,NULL,1,50.00,50.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'Empresas/2/NFe/xml/Nfe31240124634181000176550150000127131042778910.xml','',2,'','        ',1,0,0,0);
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
INSERT INTO `nfe_contingencia` VALUES (1,3,'2024-01-12 11:14:53','2024-01-12 11:14:55','teste modo de contingencia',0);
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
  `aliquota_icms_destino` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `percentual_diferimento_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_diferimento_icms` decimal(15,2) NOT NULL DEFAULT '0.00',
  `modalidade_bc_icms_st` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `base_calculo_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_icms_st` decimal(15,2) NOT NULL DEFAULT '0.00',
  `mva_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `codigo_enquadramento_ipi` char(3) NOT NULL DEFAULT '',
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
  `base_calculo_credito_icms_sn` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aliquota_credito_icms_sn` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `valor_credito_icms_sn` decimal(15,2) NOT NULL DEFAULT '0.00',
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfe_item`
--

LOCK TABLES `nfe_item` WRITE;
/*!40000 ALTER TABLE `nfe_item` DISABLE KEYS */;
INSERT INTO `nfe_item` VALUES (1,1,1,2,NULL,1102,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'03','',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,1),(2,2,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'02','',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(3,3,3,NULL,NULL,1102,1,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(4,3,5,NULL,NULL,1102,2,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(5,3,3,1,NULL,1102,3,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(6,4,1,1,NULL,1101,1,10.0000,10.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',2,0),(7,5,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(8,6,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(9,7,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(10,8,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(11,9,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(12,10,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(13,11,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(14,12,1,1,NULL,1102,1,10.0000,50.0000,500.00,500.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(15,12,3,NULL,NULL,1102,2,50.0000,2.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(16,12,5,NULL,NULL,1102,3,20.0000,5.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'00','',0.00,0.0000,0.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',1,0),(17,13,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'02','',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(18,16,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'02','',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,0),(19,18,3,NULL,NULL,1403,1,1.0000,100.0000,100.00,100.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'02','',0.00,0.0000,0.00,0.00,0.0000,0.00,'50',100.00,1.6500,7.6000,1.65,7.60,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,101,1,0,'',1,1),(20,19,1,1,NULL,1102,1,10.0000,50.0000,500.00,503.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,1.00,0.0000,1.00,0.0000,'00','',1.00,0.0000,1.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,1.00,0.0000,1.00,0.00,0.0000,0.00,0,0,0,'',1,0),(21,19,1,1,NULL,1102,2,10.0000,50.0000,500.00,505.00,0.00,0.00,0.00,0.00,'00',0,0.0000,100.00,18.0000,0.0000,0.0000,18.00,0.0000,0.00,0,0.0000,1.00,0.0000,2.00,0.0000,'00','',1.00,0.0000,2.00,0.00,0.0000,0.00,'71',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,1.00,0.0000,1.00,0.00,0.0000,0.00,0,0,0,'',1,0),(22,20,9,NULL,NULL,5403,1,1.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,'90',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(23,21,9,NULL,NULL,5403,1,3.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,'90',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(24,22,9,NULL,NULL,5403,1,5.0000,10.0000,50.00,50.00,0.00,0.00,0.00,0.00,'90',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(25,23,9,NULL,NULL,5403,1,1.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,'40',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(26,24,9,NULL,NULL,5403,1,2.0000,10.0000,20.00,20.00,0.00,0.00,0.00,0.00,'40',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(27,25,9,NULL,NULL,5403,1,8.0000,10.0000,80.00,80.00,0.00,0.00,0.00,0.00,'40',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(28,26,9,NULL,NULL,5403,1,7.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,'40',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(29,27,9,NULL,NULL,5403,1,1.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,'90',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0),(30,28,9,NULL,NULL,5403,1,5.0000,10.0000,50.00,50.00,0.00,0.00,0.00,0.00,'90',0,0.0000,0.00,0.0000,0.0000,0.0000,0.00,0.0000,0.00,0,0.0000,0.00,0.0000,0.00,0.0000,'','999',0.00,0.0000,0.00,0.00,0.0000,0.00,'99',0.00,0.0000,0.0000,0.00,0.00,0.0000,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0.00,0.0000,0.00,0,0,0,'',12,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeracao`
--

LOCK TABLES `numeracao` WRITE;
/*!40000 ALTER TABLE `numeracao` DISABLE KEYS */;
INSERT INTO `numeracao` VALUES (1,3,1,4,NULL,20),(2,3,1,5,NULL,1),(3,3,1,55,NULL,11),(4,2,1,15,NULL,12714);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (1,1,'Venda','S',1,1,1),(2,2,'Devolução de venda','E',1,1,1),(3,3,'Compra','E',1,1,1),(4,4,'Devolução de compra','S',1,1,1),(5,5,'Prestação de serviços','S',0,1,1),(6,NULL,'Compra de Mercadorias para revenda','E',0,0,1),(7,NULL,'Prestação de Serviço','S',0,0,0),(8,NULL,'Venda de Mercadorias','S',1,1,1),(9,NULL,'NFe de entrada','E',1,0,1),(10,NULL,'NFe de saída','S',1,0,1),(11,NULL,'Devolução de Venda','E',1,1,1),(12,NULL,'NFe de saída 2','S',1,0,1),(13,NULL,'NFe de saída','S',1,0,1);
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
  `operacao` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operacao_id`,`categoria_id`),
  UNIQUE KEY `uk_operacao_categoria_1` (`operacao_id`,`operacao`),
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
INSERT INTO `operacao_categoria` VALUES (1,86,1),(1,85,2),(1,66,9),(2,32,5),(2,31,6),(3,15,3),(3,14,4),(3,89,10),(4,30,7),(4,29,8),(5,64,9),(5,60,11),(5,59,12),(6,15,3),(6,14,4),(6,89,10),(8,86,1),(8,85,2),(8,66,9),(11,11,5),(11,9,6);
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
INSERT INTO `operacao_conta_contabil` VALUES (1,66,4,2,100.0000,1,0),(1,66,10,3,100.0000,1,0),(1,85,4,2,100.0000,1,0),(1,85,10,2,100.0000,2,0),(1,85,10,3,100.0000,1,0),(1,85,12,3,100.0000,2,1),(1,85,59,4,100.0000,2,0),(1,85,80,1,100.0000,2,1),(1,86,4,2,100.0000,1,0),(1,86,12,3,100.0000,1,1),(1,86,59,4,100.0000,1,0),(1,86,61,4,100.0000,1,0),(1,86,80,1,100.0000,1,1),(2,31,10,3,100.0000,2,0),(2,31,12,2,100.0000,2,1),(2,31,59,1,100.0000,2,0),(2,31,80,4,100.0000,2,1),(2,32,5,3,100.0000,1,0),(2,32,12,2,100.0000,1,1),(2,32,59,1,100.0000,1,0),(2,32,80,4,100.0000,1,1),(3,14,5,3,100.0000,1,0),(3,14,12,2,100.0000,2,1),(3,14,37,1,100.0000,1,0),(3,14,37,4,100.0000,2,0),(3,14,83,1,100.0000,1,1),(3,15,4,3,100.0000,1,0),(3,15,12,2,100.0000,1,0),(3,15,83,1,100.0000,1,0),(3,89,5,3,100.0000,1,0),(3,89,37,1,100.0000,1,0),(3,89,83,1,100.0000,1,0),(4,29,12,3,100.0000,2,0),(4,29,37,1,100.0000,2,0),(4,30,5,2,100.0000,1,0),(4,30,12,3,100.0000,1,0),(4,30,83,4,100.0000,1,0),(5,59,4,2,100.0000,1,0),(5,59,10,2,100.0000,2,0),(5,59,10,3,100.0000,1,0),(5,59,60,4,100.0000,2,0),(5,60,4,2,100.0000,1,0),(5,60,60,4,100.0000,1,0),(5,60,62,4,100.0000,1,0),(5,64,4,2,100.0000,1,0),(5,64,10,3,100.0000,1,0),(5,64,65,4,100.0000,1,0),(8,66,4,2,100.0000,1,0),(8,66,10,3,100.0000,1,0),(8,85,4,2,100.0000,1,0),(8,85,10,2,100.0000,2,0),(8,85,10,3,100.0000,1,0),(8,85,12,3,100.0000,2,0),(8,85,59,4,100.0000,2,0),(8,85,80,1,100.0000,2,0),(8,86,4,2,100.0000,1,0),(8,86,12,3,100.0000,1,0),(8,86,59,4,100.0000,1,0),(8,86,80,1,100.0000,1,0),(11,9,4,3,100.0000,1,0),(11,9,12,1,100.0000,1,0),(11,9,38,1,100.0000,2,0),(11,9,60,3,100.0000,2,0),(11,11,4,3,100.0000,1,0),(11,11,12,1,100.0000,1,0),(11,11,38,1,100.0000,2,0),(11,11,60,3,100.0000,2,0);
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
INSERT INTO `operacao_empresa` VALUES (1,2,8,1,0),(1,3,1,1,0),(2,3,1,1,0),(3,3,1,1,0),(4,3,1,1,0),(5,3,1,1,0),(6,3,NULL,1,0),(7,3,2,1,0),(8,3,2,1,0),(9,3,2,1,0),(10,3,2,1,0),(11,3,1,1,0),(13,2,8,1,0);
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
INSERT INTO `pagamento` VALUES (1,1,'2024-01-12',200.00,0.00,0.00,200.00,0);
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
INSERT INTO `pagamento_pagar_categoria` VALUES (1,89,200.00);
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
  KEY `k_pagar_4` (`conta_id`),
  CONSTRAINT `fk_pagar_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_pagar_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_pagar_3` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `fk_pagar_4` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`conta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,3,3,2,1,'1','2024-01-12','2024-01-22','0001-01-01',30.00,0.00,0.00,0.00,'',0,0),(2,NULL,3,3,2,1,'2','2024-01-12','2024-02-11','0001-01-01',70.00,0.00,0.00,0.00,'',0,0),(3,NULL,3,3,9,1,'10','2024-01-12','2024-01-22','2024-01-12',200.00,0.00,0.00,200.00,'',0,0),(4,NULL,3,3,9,1,'20','2024-01-12','2024-02-11','0001-01-01',300.00,0.00,0.00,0.00,'',0,1),(5,NULL,3,3,10,1,'10','2024-01-12','2024-01-22','0001-01-01',250.00,0.00,0.00,0.00,'',0,0),(6,NULL,3,3,10,1,'20','2024-01-12','2024-02-11','0001-01-01',450.00,0.00,0.00,0.00,'',0,0),(7,NULL,3,3,NULL,1,'0000000007','2024-01-12','2024-02-12','0001-01-01',5.00,0.00,0.00,0.00,'',0,0),(8,NULL,3,7,NULL,1,'0000000007','2024-01-12','2024-02-12','0001-01-01',5.00,0.00,0.00,0.00,'',0,0);
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
INSERT INTO `pagar_categoria` VALUES (1,89,100.0000),(2,89,100.0000),(3,89,100.0000),(4,89,100.0000),(5,89,100.0000),(6,89,100.0000),(7,11,100.0000),(8,11,100.0000);
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
INSERT INTO `pagar_conta_contabil` VALUES (1,89,5,3,100.0000,1),(1,89,37,1,100.0000,1),(1,89,83,1,100.0000,1),(2,89,5,3,100.0000,1),(2,89,37,1,100.0000,1),(2,89,83,1,100.0000,1),(3,89,5,3,100.0000,1),(3,89,37,1,100.0000,1),(3,89,83,1,100.0000,1),(4,89,5,3,100.0000,1),(4,89,37,1,100.0000,1),(4,89,83,1,100.0000,1),(5,89,5,3,100.0000,1),(5,89,37,1,100.0000,1),(5,89,83,1,100.0000,1),(6,89,5,3,100.0000,1),(6,89,37,1,100.0000,1),(6,89,83,1,100.0000,1),(7,11,1,3,100.0000,2),(7,11,3,1,100.0000,2),(7,11,20,3,100.0000,1),(7,11,30,1,100.0000,1),(8,11,1,3,100.0000,2),(8,11,3,1,100.0000,2),(8,11,20,3,100.0000,1),(8,11,30,1,100.0000,1);
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
  `contabilidade_id` int(11) DEFAULT NULL,
  `segmento_id` int(11) DEFAULT NULL,
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pessoa_id`),
  UNIQUE KEY `uk_pessoa_1` (`cpf`),
  UNIQUE KEY `uk_pessoa_2` (`cnpj`),
  KEY `k_pessoa_1` (`usuario_id`),
  KEY `k_pessoa_2` (`empresa_id`),
  KEY `k_pessoa_3` (`contabilidade_id`),
  KEY `k_pessoa_4` (`segmento_id`),
  CONSTRAINT `fk_pessoa_3` FOREIGN KEY (`contabilidade_id`) REFERENCES `pessoa` (`pessoa_id`),
  CONSTRAINT `fk_pessoa_4` FOREIGN KEY (`segmento_id`) REFERENCES `segmento` (`segmento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,NULL,NULL,'2024-01-12 11:12:36'),(2,'J',1,'João','João',NULL,'','16629339000191','ISENTO','','',9,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:41'),(3,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:42'),(4,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','CPR15725',9,'','','','','1999-11-29',0,0,NULL,NULL,'2024-01-12 11:15:32'),(5,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,NULL,NULL,'2024-01-12 11:12:46'),(6,'J',1,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:15:03'),(7,'F',0,'Vendedor excluído','','37077148610','1348213',NULL,'','','',0,'','','','','2004-01-12',0,0,NULL,NULL,'2024-01-12 11:15:11'),(8,'J',2,'Leonardo e Breno Comercio de Bebidas Ltda','Leonardo e Breno Comercio de Bebidas Ltda',NULL,'','18206937000183','ISENTO','','',9,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:15:19'),(9,'F',0,'Eliane Bianca Freitas','','80577321560','MG123',NULL,'','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:15:32'),(10,'F',0,'Leonardo Paim','','08945693688','14245460',NULL,'','','',9,'','','','','1988-03-23',0,0,NULL,NULL,'2024-01-15 11:41:23'),(11,'F',0,'Mangelita Ferreira','','03133287656','1234567',NULL,'','','123456',9,'','','','','1963-06-22',0,0,NULL,NULL,'2024-01-12 18:36:45'),(12,'F',0,'Victor Theo Cláudio da Silva','','64421673641','50.544.805-1',NULL,'','','Isento',2,'','','','','1988-05-10',0,0,NULL,NULL,'2024-01-15 21:11:20'),(13,'F',0,'Ana Maria Silva Caetano','','22050592035','MG15487',NULL,'','','',0,'','','','','1987-03-21',0,0,NULL,NULL,'2023-07-26 08:28:46'),(14,'J',0,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA - NFE',NULL,'','24634181000176','0027467430027','','',0,'','','','','0001-01-01',0,2,NULL,NULL,'2024-01-15 15:57:49'),(15,'J',0,'Nicolas e Sophia Empreendimentos ME','Creative Smart',NULL,'','30223303000134','31741110025','','',1,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-15 21:04:05');
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
INSERT INTO `pessoa_contato` VALUES (1,1,3,2,'(37) 9 9865-3157',''),(2,1,24,3,'037999887766',''),(3,3,0,1,'(037) 2594-1157',''),(5,4,0,2,'(011) 4191-4433',''),(7,5,0,2,'(011) 4191-4433',''),(8,6,0,2,'(37) 3261-9150',''),(9,12,0,4,'victor_theo_dasilva@virage.com.br',''),(10,14,2,2,'03732619150',''),(12,14,25,1,'03732619150','');
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
INSERT INTO `pessoa_empresa` VALUES (2,3,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(5,3,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,3,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,3,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,1),(8,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(10,3,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(11,3,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(12,2,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(13,2,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(15,2,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pessoa_endereco_id`),
  KEY `k_pessoa_endereco_1` (`pessoa_id`),
  KEY `k_pessoa_endereco_2` (`empresa_endereco_id`),
  CONSTRAINT `fk_pessoa_endereco_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,4,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1,0),(2,2,0,'Av. Benedito','S','Mangabeiras','','35590000','Lagoa da Prata','MG','3137205','',1,0),(3,3,0,'Av. Brasil','555','Centro','Loja 1','35580000','Lagoa da Prata','MG','3137205','',1,0),(4,4,0,'Av. ABC','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1,1),(5,4,0,'Av. Chedid Jafet','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1,0),(6,5,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,1),(7,5,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,0),(8,6,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1,0),(9,12,0,'Rua Durval de Barros','465','Conjunto Taquaril','','30290250','Lagoa da Prata','MG','3137205','',1,0),(10,14,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',1,0),(11,14,3,'Av. Brasil','328','Centro','2º Andar','35590000','Manaus','AM','1302603','',0,0),(12,15,0,'Rua Anicauera','247','Eldorado','','35590000','Lagoa da Prata','MG','3137205','',1,0);
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
INSERT INTO `pessoa_tipo` VALUES (1,NULL,8,''),(2,NULL,8,''),(3,NULL,2,''),(4,NULL,1,''),(5,NULL,5,''),(6,NULL,3,''),(7,NULL,5,''),(8,NULL,2,''),(9,NULL,1,''),(10,NULL,1,''),(11,NULL,2,''),(12,NULL,1,''),(13,NULL,5,''),(14,NULL,8,''),(15,NULL,1,'');
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`plano_pagamento_id`),
  UNIQUE KEY `uk_plano_pagamento_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento`
--

LOCK TABLES `plano_pagamento` WRITE;
/*!40000 ALTER TABLE `plano_pagamento` DISABLE KEYS */;
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2024-01-12 11:13:38'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(5,NULL,'À vista',1,1,0,0,0,'2024-01-12 11:13:37'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2024-01-12 11:13:37'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2024-01-12 11:13:37'),(8,NULL,'À prazo Entrada/30/45/60/75/90',2,4,1,0,0,'2024-01-12 11:13:37'),(9,NULL,'Vencimento dia 10 do próximo mês',2,4,4,10,0,'2024-01-12 11:13:38');
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
INSERT INTO `plano_pagamento_empresa` VALUES (1,2,1,0),(1,3,1,0),(2,3,1,0),(3,3,1,0),(4,3,1,0),(5,3,0,0),(6,3,1,0),(7,3,1,0),(8,3,1,0),(9,3,1,0);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_id`),
  KEY `k_produto_1` (`regra_tributaria_id`),
  KEY `k_produto_2` (`produto_grupo_id`),
  KEY `k_produto_3` (`produto_unidade_id`),
  CONSTRAINT `fk_produto_1` FOREIGN KEY (`regra_tributaria_id`) REFERENCES `regra_tributaria` (`regra_tributaria_id`),
  CONSTRAINT `fk_produto_2` FOREIGN KEY (`produto_grupo_id`) REFERENCES `produto_grupo` (`produto_grupo_id`),
  CONSTRAINT `fk_produto_3` FOREIGN KEY (`produto_unidade_id`) REFERENCES `produto_unidade` (`produto_unidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,NULL,'Arroz Codil Tipo 1','',0,3,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2024-01-12 11:16:07'),(2,NULL,'Café','',0,NULL,'',1,1,0,'10064000','','','','',0,0,'',0,'',0,'2024-01-12 11:12:51'),(3,NULL,'Fósforo','',0,1,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2024-01-12 11:14:57'),(4,NULL,'Troca de óleo','Troca de óleo',9,NULL,'',1,1,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:15:33'),(5,NULL,'Coca-Cola 2L','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2024-01-12 11:13:34'),(6,NULL,'Produto teste','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2024-01-12 11:12:51'),(7,NULL,'Feijão Carioca','',0,NULL,'',1,1,0,'10064000','0199900','','','',0,0,'',0,'',0,'2024-01-12 11:13:35'),(8,NULL,'Manutenção de computadores','Manutenção de computadores',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:15:33'),(9,NULL,'Garrafa térmica cromada Sommus - 800 ml','Garrafa térmica Sommus cromada e com logo escrita em preto.',0,1,'',2,2,0,'85163100','','','','',0,0,'',0,'',0,'2024-01-15 21:15:06');
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
INSERT INTO `produto_empresa` VALUES (1,3,0,1,0),(2,3,0,1,0),(3,3,0,1,0),(4,3,0,1,0),(5,3,0,1,0),(6,3,0,1,0),(7,3,0,1,0),(8,3,0,1,0),(9,2,0,1,0);
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
INSERT INTO `produto_estoque` VALUES (1,3,NULL,NULL,3,1,'',26.0000,50.0000,64.0000),(2,5,NULL,NULL,3,1,'',20.0000,20.0000,0.0000),(3,3,1,NULL,3,1,'',0.0000,0.0000,0.0000),(4,1,1,NULL,3,1,'',108.0000,50.0000,10.0000),(5,7,NULL,NULL,3,1,'',-2.0000,0.0000,2.0000),(6,9,NULL,NULL,2,2,'',-29.0000,0.0000,29.0000);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Geral','2024-01-12 11:12:51'),(2,'Geral','2023-07-01 00:00:00');
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
INSERT INTO `produto_grupo_empresa` VALUES (1,3,1,0),(2,2,1,0);
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
INSERT INTO `produto_inventario` VALUES (8,3,1,'202312',58.0000,39.5600),(9,3,2,'202312',0.0000,5.8000),(10,3,3,'202312',40.0000,2.0001),(11,3,5,'202312',0.0000,5.0000),(12,3,6,'202312',0.0000,0.0000),(13,3,7,'202312',0.0000,8.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_movimento`
--

LOCK TABLES `produto_movimento` WRITE;
/*!40000 ALTER TABLE `produto_movimento` DISABLE KEYS */;
INSERT INTO `produto_movimento` VALUES (1,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:29','2024-01-12 00:00:00','E',50.0000,''),(2,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:29','2024-01-12 00:00:00','E',20.0000,''),(3,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:29','2024-01-12 00:00:00','E',10.0000,''),(4,1,1,NULL,3,1,2,NULL,NULL,NULL,NULL,'2024-01-12 11:13:30','2024-01-12 00:00:00','E',10.0000,''),(5,1,1,NULL,3,1,7,NULL,NULL,NULL,NULL,'2024-01-12 11:13:32','2024-01-12 00:00:00','E',10.0000,''),(6,1,1,NULL,3,1,8,NULL,NULL,NULL,NULL,'2024-01-12 11:13:33','2024-01-12 00:00:00','E',10.0000,''),(7,1,1,NULL,3,1,9,NULL,NULL,NULL,NULL,'2024-01-12 11:13:33','2024-01-12 00:00:00','E',10.0000,''),(8,1,1,NULL,3,1,10,NULL,NULL,NULL,NULL,'2024-01-12 11:13:34','2024-01-12 00:00:00','E',10.0000,''),(9,3,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2024-01-12 11:13:34','2024-01-12 00:00:00','E',50.0000,''),(10,5,NULL,NULL,3,1,10,NULL,NULL,NULL,NULL,'2024-01-12 11:13:34','2024-01-12 00:00:00','E',20.0000,''),(11,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2024-01-12 11:13:34','2024-01-12 00:00:00','E',10.0000,''),(12,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2024-01-12 11:13:34','2024-01-12 00:00:00','E',10.0000,''),(13,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','E',10.0000,''),(14,1,1,NULL,3,1,14,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','E',10.0000,''),(15,3,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','S',50.0000,''),(16,5,NULL,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','S',20.0000,''),(17,3,1,NULL,3,1,1,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','S',10.0000,''),(18,7,NULL,NULL,3,1,11,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','S',10.0000,''),(19,7,NULL,NULL,3,1,13,NULL,NULL,NULL,NULL,'2024-01-12 11:13:35','2024-01-12 00:00:00','S',10.0000,''),(20,7,NULL,NULL,3,1,12,NULL,NULL,NULL,NULL,'2024-01-12 11:13:36','2024-01-12 00:00:00','S',10.0000,''),(21,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:45','2024-01-12 11:14:45','S',15.0000,'Vencimento do produto'),(22,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:46','2024-01-12 11:14:45','E',25.0000,'Recontagem de estoqueo'),(23,1,1,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:46','2023-12-23 11:14:45','E',58.0000,'Balanço'),(24,3,NULL,NULL,3,1,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:46','2023-12-23 11:14:45','E',40.0000,'Balanço'),(25,3,NULL,NULL,3,1,NULL,11,NULL,NULL,NULL,'2024-01-12 11:14:49','2024-01-12 11:14:49','S',10.0000,''),(26,3,NULL,NULL,3,1,NULL,12,NULL,NULL,NULL,'2024-01-12 11:14:49','2024-01-12 11:14:49','S',1.0000,''),(27,3,NULL,NULL,3,1,NULL,13,NULL,NULL,NULL,'2024-01-12 11:14:49','2024-01-12 11:14:49','S',3.0000,''),(28,3,NULL,NULL,3,1,NULL,14,NULL,NULL,NULL,'2024-01-12 11:14:49','2024-01-12 11:14:49','S',1.0000,''),(29,1,1,NULL,3,1,NULL,16,NULL,NULL,NULL,'2024-01-12 11:14:57','2024-01-12 11:14:57','S',6.0000,''),(30,3,NULL,NULL,3,1,NULL,16,NULL,NULL,NULL,'2024-01-12 11:14:57','2024-01-12 11:14:57','S',50.0000,''),(31,1,1,NULL,3,1,NULL,17,NULL,NULL,NULL,'2024-01-12 11:14:57','2024-01-12 11:14:57','S',1.0000,''),(32,1,1,NULL,3,1,NULL,18,NULL,NULL,NULL,'2024-01-12 11:14:57','2024-01-12 11:14:57','S',3.0000,''),(33,3,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,'2024-01-12 11:15:18','2024-01-12 11:15:18','E',1.0000,''),(34,1,1,NULL,3,1,NULL,NULL,1,NULL,NULL,'2024-01-12 11:15:18','2024-01-12 11:15:18','S',10.0000,''),(35,7,NULL,NULL,3,1,NULL,19,NULL,NULL,NULL,'2024-01-12 11:16:05','2024-01-12 11:16:05','S',1.0000,''),(36,7,NULL,NULL,3,1,NULL,20,NULL,NULL,NULL,'2024-01-12 11:16:05','2024-01-12 11:16:05','S',1.0000,''),(37,9,NULL,NULL,2,2,NULL,21,NULL,NULL,NULL,'2024-01-15 11:51:14','2024-01-15 11:51:14','S',1.0000,''),(38,9,NULL,NULL,2,2,NULL,22,NULL,NULL,NULL,'2024-01-15 15:59:06','2024-01-15 15:59:06','S',3.0000,''),(39,9,NULL,NULL,2,2,NULL,23,NULL,NULL,NULL,'2024-01-15 16:21:11','2024-01-15 16:21:11','S',5.0000,''),(40,9,NULL,NULL,2,2,NULL,24,NULL,NULL,NULL,'2024-01-15 17:44:49','2024-01-15 17:44:49','S',1.0000,''),(41,9,NULL,NULL,2,2,NULL,25,NULL,NULL,NULL,'2024-01-15 20:05:46','2024-01-15 20:05:46','S',2.0000,''),(42,9,NULL,NULL,2,2,NULL,26,NULL,NULL,NULL,'2024-01-15 20:10:06','2024-01-15 20:10:06','S',8.0000,''),(43,9,NULL,NULL,2,2,NULL,27,NULL,NULL,NULL,'2024-01-15 20:56:40','2024-01-15 20:56:40','S',7.0000,''),(44,9,NULL,NULL,2,2,NULL,NULL,NULL,NULL,27,'2024-01-15 21:09:07','2024-01-15 21:09:07','S',1.0000,''),(45,9,NULL,NULL,2,2,NULL,NULL,NULL,NULL,28,'2024-01-15 21:12:57','2024-01-15 21:12:57','S',5.0000,''),(46,9,NULL,NULL,2,2,NULL,28,NULL,NULL,NULL,'2024-01-15 21:15:06','2024-01-15 21:15:06','S',3.0000,''),(47,9,NULL,NULL,2,2,NULL,27,NULL,NULL,NULL,'2024-01-15 21:16:34','2024-01-15 21:16:34','E',7.0000,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_preco`
--

LOCK TABLES `produto_preco` WRITE;
/*!40000 ALTER TABLE `produto_preco` DISABLE KEYS */;
INSERT INTO `produto_preco` VALUES (1,1,0,NULL,3,50.0000,42.7500,50.0000,7.9000,6.0940,5.0000,0.0000),(2,1,0,1,3,50.0000,41.8854,50.0000,7.9000,6.0940,5.0000,0.0000),(3,2,0,NULL,3,5.8000,0.0000,0.0000,7.3000,0.0000,0.0000,0.0000),(4,3,0,NULL,3,2.0000,2.0001,0.0000,0.4900,3126.6849,1.9900,0.0000),(5,4,0,NULL,3,0.0000,0.0000,0.0000,80.0000,0.0000,0.0000,0.0000),(6,5,0,NULL,3,5.0000,5.0000,5.0000,5.5000,0.0000,0.0000,0.0000),(7,6,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(8,6,0,2,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(9,7,0,NULL,3,8.0000,0.0000,0.0000,6.3000,6.3000,6.3000,0.0000),(10,1,0,3,3,5.5000,0.0000,0.0000,7.9000,0.0000,0.0000,0.0000),(11,8,0,NULL,3,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(12,9,0,NULL,2,10.0000,0.0000,0.0000,10.0000,10.0000,10.0000,0.0000);
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
INSERT INTO `produto_sped` VALUES (1,1,'Arroz Codil Tipo 1','2024-01-12','0001-01-01'),(2,2,'Café','2024-01-12','0001-01-01'),(3,3,'Macarrão Sta Amália','2024-01-12','2024-01-11'),(4,4,'Troca de óleo','2024-01-12','0001-01-01'),(5,5,'Coca-Cola 2L','2024-01-12','0001-01-01'),(6,6,'Produto teste','2024-01-12','0001-01-01'),(7,7,'Feijão Carioca','2024-01-12','0001-01-01'),(8,3,'Fósforo','2024-01-12','0001-01-01');
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_unidade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
INSERT INTO `produto_unidade` VALUES (1,'Unidade','UN',0,'2024-01-12 11:12:51'),(2,'Unidade','UND',0,'2023-07-01 00:00:00');
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
INSERT INTO `produto_unidade_empresa` VALUES (1,3,1,0),(2,2,1,0);
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
INSERT INTO `receber` VALUES (1,NULL,3,4,NULL,16,2,'0000000001-1/3','2024-01-12','2024-02-11','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(2,NULL,3,4,NULL,16,2,'0000000001-2/3','2024-01-12','2024-03-12','0001-01-01',35.15,0.00,0.00,0.00,0.0000,'',0,0,0),(3,NULL,3,4,NULL,16,2,'0000000001-3/3','2024-01-12','2024-04-11','0001-01-01',35.14,0.00,0.00,0.00,0.0000,'',0,0,0),(4,NULL,3,8,NULL,NULL,1,'Teste api','2024-01-12','2024-01-17','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0),(5,NULL,3,4,NULL,20,2,'0000000005-1/1','2021-01-01','2021-02-01','0001-01-01',6.30,0.00,0.00,0.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,66,100.0000),(2,66,100.0000),(3,66,100.0000),(4,66,100.0000),(5,66,100.0000);
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
INSERT INTO `receber_conta_contabil` VALUES (1,66,4,2,100.0000,1),(1,66,10,3,100.0000,1),(2,66,4,2,100.0000,1),(2,66,10,3,100.0000,1),(3,66,4,2,100.0000,1),(3,66,10,3,100.0000,1),(4,66,4,2,100.0000,1),(4,66,10,3,100.0000,1),(4,66,64,4,100.0000,1),(5,66,4,2,100.0000,1),(5,66,10,3,100.0000,1);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regra_tributaria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
INSERT INTO `regra_tributaria` VALUES (1,'Substituição tributária','P',1,0,'2024-01-12 11:12:39'),(2,'Serviços isentos','S',1,0,'2024-01-12 11:12:39'),(3,'Produtos Tributados','P',1,0,'2024-01-12 11:12:46'),(4,'Serviços Tributados','S',1,0,'2024-01-12 11:12:46');
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
  `aliquota_icms_destino` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_interestadual` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `percentual_diferimento_icms` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_icms` tinyint(1) NOT NULL DEFAULT '0',
  `modalidade_bc_icms_st` int(1) NOT NULL DEFAULT '0',
  `percentual_bc_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `aliquota_credito_icms_sn` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `deduz_desconto_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_frete_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_seguro_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_out_desp_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `soma_ipi_bc_icms_st` tinyint(1) NOT NULL DEFAULT '0',
  `mva_icms_st` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cst_ipi` char(3) NOT NULL DEFAULT '',
  `codigo_enquadramento_ipi` char(3) NOT NULL DEFAULT '',
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
  `codigo_beneficio_fiscal` char(8) NOT NULL DEFAULT '',
  `conta_contabil_id` int(11) DEFAULT NULL,
  `observacao` text NOT NULL,
  PRIMARY KEY (`regra_tributaria_operacao_id`),
  KEY `k_regra_tributaria_operacao_1` (`regra_tributaria_id`),
  KEY `k_regra_tributaria_operacao_2` (`operacao_id`),
  KEY `k_regra_tributaria_operacao_3` (`conta_contabil_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_1` FOREIGN KEY (`regra_tributaria_id`) REFERENCES `regra_tributaria` (`regra_tributaria_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_2` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`operacao_id`),
  CONSTRAINT `fk_regra_tributaria_operacao_3` FOREIGN KEY (`conta_contabil_id`) REFERENCES `conta_contabil` (`conta_contabil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(3,1,1,0,'AP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(31,2,5,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',60,''),(32,3,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,0.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03','',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'','',NULL,''),(33,3,8,0,'MG','Venda',5405,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',4,''),(34,3,8,0,'AM','Venda',5405,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',4,''),(35,3,4,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,0.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03','',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'','',12,''),(36,3,10,0,'MG','NFe de Saída',5405,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','49',0.0000,0.0000,0,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'','',4,''),(37,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'','',NULL,''),(38,1,13,0,'MG','ST em Minas Gerais',5403,'102',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','999',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','99',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(39,1,13,0,'SP','ST em São Paulo',6403,'102',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','999',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','99',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(40,1,1,0,'MG','ST em Minas Gerais',5403,'40',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','999',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','99',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(41,1,1,0,'AM','ST no Amazonas',5403,'90',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','999',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','99',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,'');
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
INSERT INTO `regra_tributaria_operacao_empresa` VALUES (1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,2),(39,2),(40,2),(41,2);
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
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salario` (
  `salario_id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` char(6) NOT NULL DEFAULT '',
  `valor` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`salario_id`),
  UNIQUE KEY `uk_salario_1` (`mes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento`
--

DROP TABLE IF EXISTS `segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmento` (
  `segmento_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`segmento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento`
--

LOCK TABLES `segmento` WRITE;
/*!40000 ALTER TABLE `segmento` DISABLE KEYS */;
/*!40000 ALTER TABLE `segmento` ENABLE KEYS */;
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
INSERT INTO `service_empresa` VALUES (1,2,2,3,'2024-01-15 11:46:25'),(1,3,2,1,'2024-01-12 11:32:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sped_credito_pis_cofins`
--

LOCK TABLES `sped_credito_pis_cofins` WRITE;
/*!40000 ALTER TABLE `sped_credito_pis_cofins` DISABLE KEYS */;
INSERT INTO `sped_credito_pis_cofins` VALUES (1,3,'122023','122023',101,165.00,760.00,65.00,260.00),(2,3,'112023','112023',101,165.00,760.00,65.00,260.00);
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
  `validade` date NOT NULL DEFAULT '0001-01-01',
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,3,'2024-01-12 11:14:42',8,NULL,1,1,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:44'),(2,3,'2024-01-12 11:14:42',8,4,1,1,100.00,90.00,0.00,10.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Floriano Peixoto',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:44'),(3,3,'2024-01-12 11:14:42',8,4,1,1,70.00,50.00,0.00,20.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(4,3,'2024-01-12 11:14:42',8,4,1,1,15.07,15.00,0.00,0.07,0.00,0.00,0.0000,0.0000,NULL,0.00,'Eliane Bruna Ester das Neves',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(5,3,'2024-01-12 11:14:42',8,4,1,1,70.00,90.00,0.00,0.00,0.00,20.00,0.0000,0.0000,NULL,0.00,'Rodrigo Luiz Marcos Teixeira',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(6,3,'2024-01-12 11:14:43',8,4,4,2,100.00,100.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(7,3,'2024-01-12 11:14:43',8,NULL,1,1,120.00,120.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(8,3,'2024-01-12 11:14:43',8,4,1,1,300.00,300.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(9,3,'2024-01-12 11:14:43',8,NULL,1,1,80.00,80.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',3,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:42'),(10,3,'2024-01-12 11:14:43',8,NULL,1,1,250.00,249.00,0.00,1.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:57'),(11,3,'2024-01-12 11:14:49',8,NULL,1,1,105.00,105.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:48'),(12,3,'2024-01-12 11:14:49',8,4,1,1,200000.01,200000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:48'),(13,3,'2024-01-12 11:14:49',8,NULL,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:49'),(14,3,'2024-01-12 11:14:49',8,NULL,1,1,3000.01,3000.01,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,1,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:49'),(15,3,'2024-01-12 11:14:56',8,NULL,1,1,6.30,7.00,0.00,0.00,0.70,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',2,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:57'),(16,3,'2024-01-12 11:14:56',8,4,4,2,135.44,135.44,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:56'),(17,3,'2024-01-12 11:14:57',8,NULL,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:56'),(18,3,'2024-01-12 11:14:57',8,NULL,1,1,15.00,15.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:14:57'),(19,3,'2021-01-01 00:00:00',8,NULL,1,1,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:16:05'),(20,3,'2021-01-01 00:00:00',8,4,4,2,6.30,6.30,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,5,1,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-12 11:16:05'),(21,2,'2024-01-15 11:51:01',1,12,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,20,NULL,NULL,NULL,NULL,NULL,'2024-01-15 15:58:10'),(22,2,'2024-01-15 15:58:52',1,12,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,21,NULL,NULL,NULL,NULL,NULL,'2024-01-15 16:14:50'),(23,2,'2024-01-15 16:20:56',1,12,1,1,50.00,50.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,22,NULL,NULL,NULL,NULL,NULL,'2024-01-15 17:43:22'),(24,2,'2024-01-15 17:44:37',1,12,1,1,10.00,10.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,23,NULL,NULL,NULL,NULL,NULL,'2024-01-15 19:26:36'),(25,2,'2024-01-15 19:49:35',1,12,1,1,20.00,20.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,24,NULL,NULL,NULL,NULL,NULL,'2024-01-15 20:07:45'),(26,2,'2024-01-15 20:08:33',1,12,1,1,80.00,80.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,25,NULL,NULL,NULL,NULL,NULL,'2024-01-15 20:50:57'),(27,2,'2024-01-15 20:56:08',1,15,1,1,70.00,70.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,1,0,NULL,26,NULL,NULL,NULL,NULL,NULL,'2024-01-15 21:16:33'),(28,2,'2024-01-15 21:14:51',1,12,1,1,30.00,30.00,0.00,0.00,0.00,0.00,0.0000,0.0000,NULL,0.00,'',1,13,2,'0001-01-01',4,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-15 21:15:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_item`
--

LOCK TABLES `venda_item` WRITE;
/*!40000 ALTER TABLE `venda_item` DISABLE KEYS */;
INSERT INTO `venda_item` VALUES (1,1,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,1,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(3,2,1,1,NULL,'',1,2.0000,9.0000,100.0000,200.00,200.00,0.00,0.00,0.00,0.00,0,5,NULL,1,NULL,NULL,NULL,NULL,NULL),(4,2,3,NULL,NULL,'',1,1.0000,2.0000,100.0000,100.00,90.00,0.00,10.00,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(5,3,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(6,3,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,7.15,0.00,2.85,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(7,3,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(8,3,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(9,3,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(10,3,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(11,3,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,7.14,0.00,2.86,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(12,4,3,NULL,NULL,'',1,1.0000,2.0000,1.0700,1.07,1.06,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(13,4,1,1,NULL,'',2,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(14,4,1,1,NULL,'',3,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(15,4,1,1,NULL,'',4,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(16,4,1,1,NULL,'',5,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(17,4,1,1,NULL,'',6,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(18,4,1,1,NULL,'',7,1.0000,9.0000,1.0000,1.00,0.99,0.00,0.01,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(19,4,1,1,NULL,'',8,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(20,4,1,1,NULL,'',9,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(21,4,1,1,NULL,'',10,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(22,4,1,1,NULL,'',11,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(23,4,1,1,NULL,'',12,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(24,4,1,1,NULL,'',13,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(25,4,1,1,NULL,'',14,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(26,4,1,1,NULL,'',15,1.0000,9.0000,1.0000,1.00,1.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(27,5,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(28,5,1,1,NULL,'',2,1.0000,9.0000,10.0000,10.00,12.85,0.00,0.00,0.00,2.85,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(29,5,1,1,NULL,'',3,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(30,5,1,1,NULL,'',4,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(31,5,1,1,NULL,'',5,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(32,5,1,1,NULL,'',6,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(33,5,1,1,NULL,'',7,1.0000,9.0000,10.0000,10.00,12.86,0.00,0.00,0.00,2.86,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(34,6,1,1,NULL,'',1,3.0000,9.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(35,6,3,NULL,NULL,'',2,7.0000,2.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(36,7,3,NULL,NULL,'',1,12.0000,2.0000,10.0000,120.00,120.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(37,8,3,NULL,NULL,'',1,30.0000,2.0000,10.0000,300.00,300.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(38,9,5,NULL,NULL,'',1,1.0000,5.0000,80.0000,80.00,80.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(39,10,1,1,NULL,'',1,1.0000,9.0000,100.0000,100.00,99.60,0.00,0.40,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(40,10,3,NULL,NULL,'',2,1.0000,2.0000,150.0000,150.00,149.40,0.00,0.60,0.00,0.00,0,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(41,11,3,NULL,NULL,'',1,10.0000,2.0000,10.5000,105.00,105.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(42,12,3,NULL,NULL,'',1,1.0000,2.0000,200000.0100,200000.01,200000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(43,13,3,NULL,NULL,'',1,3.0000,2.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(44,14,3,NULL,NULL,'',1,1.0000,2.0000,3000.0100,3000.01,3000.01,0.00,0.00,0.00,0.00,1,1,NULL,0,NULL,NULL,NULL,NULL,NULL),(45,15,5,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,7.00,0.00,0.00,0.70,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(46,16,1,1,NULL,'',1,6.0000,9.0000,5.9900,35.94,35.94,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(47,16,3,NULL,NULL,'',2,50.0000,2.0000,1.9900,99.50,99.50,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(48,17,1,1,NULL,'',1,1.0000,9.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(49,18,1,1,NULL,'',1,3.0000,9.0000,5.0000,15.00,15.00,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(50,19,7,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,6.30,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(51,20,7,NULL,NULL,'',1,1.0000,5.0000,6.3000,6.30,6.30,0.00,0.00,0.00,0.00,1,5,NULL,0,NULL,NULL,NULL,NULL,NULL),(52,21,9,NULL,NULL,'',1,1.0000,10.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,0,13,NULL,0,22,NULL,NULL,NULL,NULL),(53,22,9,NULL,NULL,'',1,3.0000,10.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,0,13,NULL,0,23,NULL,NULL,NULL,NULL),(54,23,9,NULL,NULL,'',1,5.0000,10.0000,10.0000,50.00,50.00,0.00,0.00,0.00,0.00,0,13,NULL,0,24,NULL,NULL,NULL,NULL),(55,24,9,NULL,NULL,'',1,1.0000,10.0000,10.0000,10.00,10.00,0.00,0.00,0.00,0.00,0,13,NULL,0,25,NULL,NULL,NULL,NULL),(56,25,9,NULL,NULL,'',1,2.0000,10.0000,10.0000,20.00,20.00,0.00,0.00,0.00,0.00,0,13,NULL,0,26,NULL,NULL,NULL,NULL),(57,26,9,NULL,NULL,'',1,8.0000,10.0000,10.0000,80.00,80.00,0.00,0.00,0.00,0.00,0,13,NULL,0,27,NULL,NULL,NULL,NULL),(58,27,9,NULL,NULL,'',1,7.0000,10.0000,10.0000,70.00,70.00,0.00,0.00,0.00,0.00,0,13,NULL,0,28,NULL,NULL,NULL,NULL),(59,28,9,NULL,NULL,'',1,3.0000,10.0000,10.0000,30.00,30.00,0.00,0.00,0.00,0.00,0,13,NULL,0,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20230830.185603.069','2024-01-12 11:12:27','0c87b43f21a46d1e1a66b9c627936612'),(2,1,'1.0.23.114','2024-01-12 11:31:59','9fd224e666648375f5a4db19d6550c47');
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

-- Dump completed on 2024-01-15 21:58:14
