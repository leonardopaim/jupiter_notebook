-- MySQL dump 10.13  Distrib 5.7.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sommusgestor_1
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,1,'13º salário','','D',3,0),(2,2,'Adiantamento de salário','','D',3,0),(3,3,'Adiantamento do 13º salário','','D',3,0),(4,4,'Adicional noturno, insalubridade e periculosidade','','D',3,0),(5,5,'Água/esgoto','','D',2,0),(6,6,'Aluguel de imóvel','','D',2,0),(7,7,'Assistência técnica em informática','','D',2,0),(8,8,'Comissões sobre vendas (folha de pagamento)','','D',2,0),(9,9,'Compra de ativo imobilizado','','D',6,0),(10,10,'Compra de marca ou patente','','D',6,0),(11,11,'Compra de matéria-prima a prazo','','D',21,0),(12,12,'Compra de matéria-prima a vista','','D',21,0),(13,13,'Compra de material de escritório','','D',2,0),(14,14,'Compra de mercadorias a prazo para revenda','','D',21,0),(15,15,'Compra de mercadorias a vista para revenda','','D',9,0),(16,16,'Compra de produtos para uso/consumo','','D',2,0),(17,17,'Conserto de veículo','','D',4,0),(18,18,'Contribuição sindical','','D',3,0),(19,19,'Curso de especialização para equipe','','D',2,0),(20,20,'Descanso semanal remunerado (DSR)','','D',3,0),(21,21,'Desconto de contribuição sindical de funcionário','','C',3,0),(22,22,'Desconto de faltas de funcionários','','C',3,0),(23,23,'Desconto de INSS de funcionários','','C',3,0),(24,24,'Desconto de plano de saúde de funcionário','','C',3,0),(25,25,'Desconto de vale alimentação de funcionários','','C',3,0),(26,26,'Desconto de vale transporte de funcionários','','C',3,0),(27,27,'Devolução de cheque emitido','','D',1,0),(28,28,'Devolução de cheque pré-datado recebido','','D',1,0),(29,29,'Devolução de compra de mercadoria para revenda a prazo','','C',21,0),(30,30,'Devolução de compra de mercadoria para revenda a vista','','C',21,0),(31,31,'Devolução de venda a prazo','','D',22,0),(32,32,'Devolução de venda a vista','','D',22,0),(33,33,'Empréstimo bancário a pagar','','D',13,0),(34,34,'Encargos sociais (INSS)','','D',3,0),(35,35,'Energia elétrica','','D',2,0),(36,36,'Férias de funcionários','','D',3,0),(37,37,'Fretes e carretos','','D',2,0),(38,38,'Horas-extras de funcionários','','D',3,0),(39,39,'Impostos estaduais','','D',16,0),(40,40,'Impostos federais','','D',16,0),(41,41,'Impostos municipais','','D',16,0),(42,42,'Impostos trabalhistas','','D',16,0),(43,43,'Investimento em aplicação financeira','','D',6,0),(44,44,'IRRF a recolher','','C',3,0),(45,45,'Juros de cartão de crédito/débito','','D',13,0),(46,46,'Licença para uso de software','','D',2,0),(47,47,'Manutenção predial','','D',2,0),(48,48,'Mão-de-obra terceirizada para manutenção predial','','D',2,0),(49,49,'Material de limpeza','','D',2,0),(50,50,'Mensalidade de associação comercial','','D',2,0),(51,51,'Multa fiscal','','D',16,0),(52,52,'Pagamento de contribuição sindical','','D',3,0),(53,53,'Pagamento de horas-extras a funcionário','','D',3,0),(54,54,'Pagamento de INSS de funcionários','','D',3,0),(55,55,'Pagamento de salário de sócio','','D',8,0),(56,56,'Pagamento de vale alimentação','','D',3,0),(57,57,'Pagamento de vale transporte','','D',3,0),(58,58,'Pagamento do IRRF retido','','D',3,0),(59,59,'Prestação de serviços a prazo','','C',14,0),(60,60,'Prestação de serviços a vista','','C',23,0),(61,61,'Processo de produção concluído','','D',1,0),(62,62,'Processo de produção iniciado','','D',1,0),(63,63,'Recebimento de cheque devolvido','','C',22,0),(64,64,'Recebimento de prestação de serviços a prazo','','C',23,0),(65,65,'Recebimento de valores de cartões','','C',22,0),(66,66,'Recebimento de venda de mercadoria a prazo','','C',1,0),(67,67,'Recurso recebido por empréstimo','','C',20,0),(68,68,'Resgate de aplicação financeira','','C',17,0),(69,69,'Retirada de lucro por sócios','','D',15,0),(70,70,'Salário de sócios','','D',15,0),(71,71,'Salário família','','D',3,0),(72,72,'Salários e ordenados','','D',3,0),(73,73,'Sangria de caixa','','D',20,0),(74,74,'Seguro de funcionários','','D',3,0),(75,75,'Seguro predial','','D',2,0),(76,76,'Serviço de manutenção em equipamento','','D',2,0),(77,77,'Serviço de provedor de internet','','D',2,0),(78,78,'Serviço de telefonia','','D',2,0),(79,79,'Serviços de marketing','','D',2,0),(80,80,'Suprimento de caixa','','C',20,0),(81,81,'Tarifa bancária','','D',13,0),(82,82,'Tarifa de cobrança bancária','','D',13,0),(83,83,'Taxa de condomínio','','D',2,0),(84,84,'Taxas de correspondência','','D',2,0),(85,85,'Venda de mercadoria a prazo','','C',22,0),(86,86,'Venda de mercadoria a vista','','C',22,0),(87,87,'Venda de produção própria','','C',6,0),(88,88,'Viagem a trabalho','','D',12,0),(89,89,'Pagamento de compra a prazo','','D',21,0),(90,NULL,'Recebimento','','C',1,2),(91,NULL,'Recebimento cartão','','C',1,0),(92,NULL,'Categoria excluída','','C',1,2),(93,NULL,'Categoria com conta contábil','','C',1,2),(94,NULL,'Categoria sem conta contábil (D)','','D',1,2),(95,NULL,'teste validação contas contábeis','','C',1,0);
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
INSERT INTO `categoria_conta_contabil` VALUES (1,5,3,100.0000,1),(1,40,1,100.0000,1),(1,40,4,100.0000,2),(1,145,1,100.0000,2),(1,160,1,100.0000,1),(2,4,3,100.0000,2),(2,40,1,100.0000,2),(3,4,3,100.0000,2),(3,40,1,100.0000,2),(4,4,3,100.0000,1),(4,40,1,100.0000,1),(4,40,4,100.0000,2),(4,156,1,100.0000,2),(4,170,1,100.0000,1),(5,5,3,100.0000,1),(5,37,1,100.0000,1),(5,37,4,100.0000,2),(5,95,1,100.0000,2),(5,120,1,100.0000,1),(6,5,3,100.0000,1),(6,37,1,100.0000,1),(6,37,4,100.0000,2),(6,93,1,100.0000,2),(6,118,1,100.0000,1),(7,5,3,100.0000,1),(7,37,1,100.0000,1),(7,37,4,100.0000,2),(7,110,1,100.0000,2),(7,135,1,100.0000,1),(8,5,3,100.0000,1),(8,40,1,100.0000,1),(8,40,4,100.0000,2),(8,153,1,100.0000,2),(8,167,1,100.0000,1),(9,5,3,100.0000,1),(9,23,2,100.0000,2),(9,37,1,100.0000,1),(9,37,4,100.0000,2),(9,194,1,100.0000,1),(10,5,3,100.0000,1),(10,193,1,100.0000,1),(10,196,1,100.0000,1),(11,5,3,100.0000,1),(11,13,2,100.0000,2),(11,37,1,100.0000,1),(11,37,4,100.0000,2),(11,84,1,100.0000,1),(12,4,3,100.0000,1),(12,12,2,100.0000,1),(12,84,1,100.0000,1),(13,5,3,100.0000,1),(13,37,1,100.0000,1),(13,37,4,100.0000,2),(13,98,1,100.0000,2),(13,123,1,100.0000,1),(14,12,2,100.0000,2),(14,37,4,100.0000,2),(15,4,3,100.0000,1),(15,12,2,100.0000,1),(15,83,1,100.0000,1),(16,5,3,100.0000,1),(16,37,1,100.0000,1),(16,37,4,100.0000,2),(16,98,1,100.0000,2),(16,123,1,100.0000,1),(17,5,3,100.0000,1),(17,37,1,100.0000,1),(17,37,4,100.0000,2),(17,108,1,100.0000,2),(17,133,1,100.0000,1),(18,4,3,100.0000,1),(18,46,1,100.0000,1),(18,46,4,100.0000,2),(18,173,1,100.0000,2),(18,174,1,100.0000,1),(19,5,3,100.0000,1),(19,37,1,100.0000,1),(19,37,4,100.0000,2),(19,105,1,100.0000,2),(19,130,1,100.0000,1),(20,4,3,100.0000,1),(20,40,1,100.0000,1),(20,40,4,100.0000,2),(20,155,1,100.0000,2),(20,169,1,100.0000,1),(21,40,1,100.0000,2),(21,46,4,100.0000,2),(22,40,1,100.0000,2),(22,144,4,100.0000,2),(23,40,1,100.0000,2),(23,46,4,100.0000,2),(24,5,2,100.0000,1),(24,40,1,100.0000,2),(24,40,4,100.0000,1),(24,152,4,100.0000,2),(25,40,1,100.0000,2),(25,144,4,100.0000,2),(26,40,1,100.0000,2),(26,144,4,100.0000,2),(27,38,1,100.0000,1),(27,39,4,100.0000,1),(28,7,3,100.0000,1),(28,8,2,100.0000,1),(29,12,3,100.0000,2),(29,37,1,100.0000,2),(30,5,2,100.0000,1),(30,12,3,100.0000,1),(30,83,4,100.0000,1),(31,10,3,100.0000,2),(31,12,2,100.0000,2),(31,59,1,100.0000,2),(31,80,4,100.0000,2),(32,5,3,100.0000,1),(32,12,2,100.0000,1),(32,59,1,100.0000,1),(32,61,1,100.0000,1),(32,80,4,100.0000,1),(33,5,3,100.0000,1),(33,43,1,100.0000,1),(33,43,4,100.0000,2),(33,180,1,100.0000,2),(33,186,1,100.0000,1),(34,5,3,100.0000,1),(34,46,1,100.0000,1),(34,46,4,100.0000,2),(34,146,1,100.0000,2),(34,161,1,100.0000,1),(35,5,3,100.0000,1),(35,37,1,100.0000,1),(35,37,4,100.0000,2),(35,94,1,100.0000,2),(35,119,1,100.0000,1),(36,5,3,100.0000,1),(36,46,1,100.0000,1),(36,46,4,100.0000,2),(36,147,1,100.0000,2),(36,162,1,100.0000,1),(37,5,3,100.0000,1),(37,37,1,100.0000,1),(37,37,4,100.0000,2),(37,97,1,100.0000,2),(37,122,1,100.0000,1),(38,5,3,100.0000,1),(38,37,1,100.0000,1),(38,37,4,100.0000,2),(38,151,1,100.0000,2),(38,166,1,100.0000,1),(39,5,3,100.0000,1),(39,45,1,100.0000,1),(39,45,4,100.0000,2),(39,100,1,100.0000,2),(39,125,1,100.0000,1),(40,5,3,100.0000,1),(40,45,1,100.0000,1),(40,45,4,100.0000,2),(40,100,1,100.0000,2),(40,125,1,100.0000,1),(41,5,3,100.0000,1),(41,45,1,100.0000,1),(41,45,4,100.0000,2),(41,100,1,100.0000,2),(41,125,1,100.0000,1),(42,5,3,100.0000,1),(42,45,1,100.0000,1),(42,45,4,100.0000,2),(42,146,1,100.0000,2),(42,161,1,100.0000,1),(43,5,3,100.0000,1),(43,33,2,100.0000,1),(43,195,1,100.0000,1),(44,40,2,100.0000,2),(44,42,4,100.0000,2),(45,5,3,100.0000,1),(45,41,1,100.0000,1),(45,41,4,100.0000,2),(45,181,1,100.0000,2),(45,187,1,100.0000,1),(46,5,3,100.0000,1),(46,37,1,100.0000,1),(46,37,4,100.0000,2),(46,115,1,100.0000,2),(46,140,1,100.0000,1),(47,5,3,100.0000,1),(47,37,1,100.0000,1),(47,37,4,100.0000,2),(47,109,1,100.0000,2),(47,134,1,100.0000,1),(48,5,3,100.0000,1),(48,37,1,100.0000,1),(48,37,4,100.0000,2),(48,101,1,100.0000,2),(48,126,1,100.0000,1),(49,4,3,100.0000,1),(49,37,1,100.0000,1),(49,37,4,100.0000,2),(49,117,1,100.0000,2),(49,142,1,100.0000,1),(50,5,3,100.0000,1),(50,37,1,100.0000,1),(50,37,4,100.0000,2),(50,107,1,100.0000,2),(50,132,1,100.0000,1),(51,5,3,100.0000,1),(51,37,1,100.0000,1),(51,37,4,100.0000,2),(51,102,1,100.0000,2),(51,127,1,100.0000,1),(52,4,3,100.0000,1),(52,46,1,100.0000,1),(52,174,1,100.0000,1),(53,5,3,100.0000,1),(53,151,1,100.0000,1),(53,166,1,100.0000,1),(54,4,3,100.0000,1),(54,46,1,100.0000,1),(54,161,1,100.0000,1),(55,5,3,100.0000,1),(55,148,1,100.0000,1),(55,163,1,100.0000,1),(56,4,3,100.0000,1),(56,37,1,100.0000,1),(56,37,4,100.0000,2),(56,154,1,100.0000,2),(56,168,1,100.0000,1),(57,4,3,100.0000,1),(57,37,1,100.0000,1),(57,37,4,100.0000,2),(57,158,1,100.0000,2),(57,172,1,100.0000,1),(58,4,3,100.0000,1),(58,42,1,100.0000,1),(58,125,1,100.0000,1),(59,10,2,100.0000,2),(59,60,4,100.0000,2),(60,4,2,100.0000,1),(60,60,4,100.0000,1),(60,62,4,100.0000,1),(61,12,2,100.0000,1),(61,15,3,100.0000,1),(62,13,3,100.0000,1),(62,15,2,100.0000,1),(63,5,2,100.0000,1),(63,8,3,100.0000,1),(64,4,2,100.0000,1),(64,10,3,100.0000,1),(64,65,4,100.0000,1),(65,5,2,100.0000,1),(65,6,3,100.0000,1),(66,4,2,100.0000,1),(66,10,3,100.0000,1),(66,64,4,100.0000,1),(67,5,2,100.0000,1),(67,43,4,100.0000,1),(68,5,2,100.0000,1),(68,33,3,100.0000,1),(69,4,3,100.0000,1),(69,54,1,100.0000,2),(69,55,1,100.0000,1),(69,55,4,100.0000,2),(69,216,1,100.0000,1),(70,4,3,100.0000,1),(70,40,1,100.0000,1),(70,40,4,100.0000,2),(70,148,1,100.0000,2),(70,163,1,100.0000,1),(71,4,3,100.0000,1),(71,40,1,100.0000,1),(71,40,4,100.0000,2),(71,157,1,100.0000,2),(71,171,1,100.0000,1),(72,5,3,100.0000,1),(72,40,1,100.0000,1),(72,40,4,100.0000,2),(72,144,1,100.0000,2),(72,159,1,100.0000,1),(73,4,3,100.0000,1),(73,5,2,100.0000,1),(74,5,3,100.0000,1),(74,37,1,100.0000,1),(74,37,4,100.0000,2),(74,149,1,100.0000,2),(74,164,1,100.0000,1),(75,5,3,100.0000,1),(75,37,1,100.0000,1),(75,37,4,100.0000,2),(75,114,1,100.0000,2),(75,139,1,100.0000,1),(76,5,3,100.0000,1),(76,37,1,100.0000,1),(76,37,4,100.0000,2),(76,116,1,100.0000,2),(76,141,1,100.0000,1),(77,5,3,100.0000,1),(77,37,1,100.0000,1),(77,37,4,100.0000,2),(77,111,1,100.0000,2),(77,136,1,100.0000,1),(78,5,3,100.0000,1),(78,37,1,100.0000,1),(78,37,4,100.0000,2),(78,99,1,100.0000,2),(78,124,1,100.0000,1),(79,5,3,100.0000,1),(79,37,1,100.0000,1),(79,37,4,100.0000,2),(79,112,1,100.0000,2),(79,137,1,100.0000,1),(80,4,2,100.0000,1),(80,5,3,100.0000,1),(81,5,3,100.0000,1),(81,37,1,100.0000,1),(81,37,4,100.0000,2),(81,179,1,100.0000,2),(81,182,1,100.0000,1),(82,5,3,100.0000,1),(82,37,1,100.0000,1),(82,37,4,100.0000,2),(82,176,1,100.0000,2),(82,183,1,100.0000,1),(83,4,3,100.0000,1),(83,37,1,100.0000,1),(83,37,4,100.0000,2),(83,93,1,100.0000,2),(83,118,1,100.0000,1),(84,5,3,100.0000,1),(84,37,1,100.0000,1),(84,37,4,100.0000,2),(84,96,1,100.0000,2),(84,121,1,100.0000,1),(85,10,2,100.0000,2),(85,12,3,100.0000,2),(85,59,4,100.0000,2),(85,80,1,100.0000,2),(86,4,2,100.0000,1),(86,12,3,100.0000,1),(86,59,4,100.0000,1),(86,61,4,100.0000,1),(86,80,1,100.0000,1),(87,4,2,100.0000,1),(87,12,3,100.0000,1),(87,60,4,100.0000,1),(87,80,1,100.0000,1),(88,5,3,100.0000,1),(88,37,1,100.0000,1),(88,37,4,100.0000,2),(88,106,1,100.0000,2),(88,131,1,100.0000,1),(89,5,3,100.0000,1),(89,37,1,100.0000,1),(89,83,1,100.0000,1),(90,1,2,100.0000,1),(90,1,4,100.0000,1),(91,4,3,100.0000,1),(91,4,4,50.0000,1),(91,5,2,50.0000,1),(91,12,2,100.0000,1),(91,12,3,50.0000,1),(91,14,1,50.0000,1),(92,4,4,100.0000,1),(92,12,2,100.0000,1),(93,4,4,100.0000,1),(93,5,3,100.0000,2),(93,12,2,100.0000,1),(93,14,1,100.0000,2),(94,5,3,30.0000,2),(94,5,4,30.0000,1),(94,10,3,33.0000,2),(94,10,4,33.0000,1),(94,12,3,37.0000,2),(94,12,4,37.0000,1),(94,20,1,75.0000,2),(94,20,2,75.0000,1),(94,23,1,25.0000,2),(94,23,2,25.0000,1),(95,5,4,100.0000,1),(95,14,2,100.0000,1);
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
INSERT INTO `categoria_empresa` VALUES (1,1,NULL,'',1,0),(2,1,NULL,'',1,0),(3,1,NULL,'',1,0),(4,1,NULL,'',1,0),(5,1,NULL,'',1,0),(6,1,NULL,'',1,0),(7,1,NULL,'',1,0),(8,1,NULL,'',1,0),(9,1,NULL,'',1,0),(10,1,NULL,'',1,0),(11,1,NULL,'',1,0),(12,1,NULL,'',1,0),(13,1,NULL,'',1,0),(14,1,NULL,'',1,0),(15,1,NULL,'',1,0),(16,1,NULL,'',1,0),(17,1,NULL,'',1,0),(18,1,NULL,'',1,0),(19,1,NULL,'',1,0),(20,1,NULL,'',1,0),(21,1,NULL,'',1,0),(22,1,NULL,'',1,0),(23,1,NULL,'',1,0),(24,1,NULL,'',1,0),(25,1,NULL,'',1,0),(26,1,NULL,'',1,0),(27,1,NULL,'',1,0),(28,1,NULL,'',1,0),(29,1,NULL,'',1,0),(30,1,NULL,'',1,0),(31,1,NULL,'',1,0),(32,1,NULL,'',1,0),(33,1,NULL,'',1,0),(34,1,NULL,'',1,0),(35,1,NULL,'',1,0),(36,1,NULL,'',1,0),(37,1,NULL,'',1,0),(38,1,NULL,'',1,0),(39,1,NULL,'',1,0),(40,1,NULL,'',1,0),(41,1,NULL,'',1,0),(42,1,NULL,'',1,0),(43,1,NULL,'',1,0),(44,1,NULL,'',1,0),(45,1,NULL,'',1,0),(46,1,NULL,'',1,0),(47,1,NULL,'',1,0),(48,1,NULL,'',1,0),(49,1,NULL,'',1,0),(50,1,NULL,'',1,0),(51,1,NULL,'',1,0),(52,1,NULL,'',1,0),(53,1,NULL,'',1,0),(54,1,NULL,'',1,0),(55,1,NULL,'',1,0),(56,1,NULL,'',1,0),(57,1,NULL,'',1,0),(58,1,NULL,'',1,0),(59,1,NULL,'',1,0),(60,1,NULL,'',1,0),(61,1,NULL,'',1,0),(62,1,NULL,'',1,0),(63,1,NULL,'',1,0),(64,1,NULL,'',1,0),(65,1,NULL,'',1,0),(66,1,NULL,'',1,0),(67,1,NULL,'',1,0),(68,1,NULL,'',1,0),(69,1,NULL,'',1,0),(70,1,NULL,'',1,0),(71,1,NULL,'',1,0),(72,1,NULL,'',1,0),(73,1,NULL,'',1,0),(74,1,NULL,'',1,0),(75,1,NULL,'',1,0),(76,1,NULL,'',1,0),(77,1,NULL,'',1,0),(78,1,NULL,'',1,0),(79,1,NULL,'',1,0),(80,1,NULL,'',1,0),(81,1,NULL,'',1,0),(82,1,NULL,'',1,0),(83,1,NULL,'',1,0),(84,1,NULL,'',1,0),(85,1,NULL,'',1,0),(86,1,NULL,'',1,0),(87,1,NULL,'',1,0),(88,1,NULL,'',1,0),(89,1,NULL,'',1,0),(91,1,NULL,'',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_grupo`
--

LOCK TABLES `categoria_grupo` WRITE;
/*!40000 ALTER TABLE `categoria_grupo` DISABLE KEYS */;
INSERT INTO `categoria_grupo` VALUES (1,1,'Processo de produção'),(2,2,'Despesas com manutenção'),(3,3,'Despesas com folha de pagamento'),(4,4,'Despesas com veículos e viagens'),(5,5,'Despesas com parcerias'),(6,6,'Investimentos'),(7,7,'Receitas provindas de terceiros'),(8,8,'Despesas de terceiros'),(9,9,'Despesas diversas'),(10,10,'Receitas não operacionais de parcerias'),(11,11,'Investimentos em especialização'),(12,12,'Despesas eventuais'),(13,13,'Despesas financeiras'),(14,14,'Receitas com serviços'),(15,15,'Despesas com salários e retiradas de sócios'),(16,16,'Despesas com impostos'),(17,17,'Receitas não operacionais diversas'),(18,18,'Despesas de terceiros'),(19,19,'Distribuição de lucros'),(20,20,'Transferências de fundos'),(21,21,'Custos'),(22,22,'Receitas com vendas'),(23,23,'Receitas com prestação de serviços'),(24,NULL,'Teste');
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
INSERT INTO `categoria_grupo_empresa` VALUES (1,1,1,0),(2,1,1,0),(3,1,1,0),(4,1,1,0),(5,1,1,0),(6,1,1,0),(7,1,1,0),(8,1,1,0),(9,1,1,0),(10,1,1,0),(11,1,1,0),(12,1,1,0),(13,1,1,0),(14,1,1,0),(15,1,1,0),(16,1,1,0),(17,1,1,0),(18,1,1,0),(19,1,1,0),(20,1,1,0),(21,1,1,0),(22,1,1,0),(23,1,1,0),(24,1,1,0);
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
INSERT INTO `centro_resultado_empresa` VALUES (1,1),(2,1),(3,1),(4,1);
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
INSERT INTO `cliente_contrato` VALUES (1,1,40,3,1004,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,0.00,15.0000,0.0000,1,2,2,1,1,2,2,1,1,1,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(2,1,2,NULL,1004,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,50.00,0.0000,5.0000,2,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',0,0),(3,1,2,NULL,1002,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,640.00,0.0000,5.0000,2,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(4,1,2,NULL,1003,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,0.00,10.0000,0.0000,1,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(5,1,6,2,1002,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,0.00,75.0000,0.0000,1,2,2,1,1,2,2,1,1,1,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(6,1,6,2,1004,NULL,1,1,NULL,'2023-01-12','2026-01-12','0001-01-01','0001-01-01',15,0.00,35.0000,0.0000,1,2,2,1,1,2,1,1,1,1,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(7,1,4,NULL,1002,NULL,1,1,NULL,'2022-12-12','2026-01-12','0001-01-01','0001-01-01',15,675.00,0.0000,5.0000,3,2,2,1,1,2,0,0,0,0,0.0000,'Teste gerado em ClienteContratoApplicationTest',1,0),(8,1,49,NULL,901,1,2,5,NULL,'2024-01-12','2026-01-12','0001-01-01','0001-01-01',15,150.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'Cliente satisfeito com o atendimento',1,0),(9,1,4,NULL,901,1,2,5,NULL,'2024-01-12','2026-01-12','0001-01-01','0001-01-01',15,50.00,0.0000,0.0000,2,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(10,1,4,NULL,2,NULL,2,5,NULL,'2024-01-12','2026-01-12','0001-01-01','0001-01-01',15,90.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(11,1,8,NULL,2,NULL,2,5,NULL,'2024-01-12','2026-01-12','0001-01-01','0001-01-01',15,160.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(12,1,49,NULL,2,NULL,2,5,NULL,'2024-01-12','0001-01-01','0001-01-01','0001-01-01',15,230.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',1,0),(13,1,10,NULL,2,NULL,2,5,NULL,'2024-01-12','2026-01-12','0001-01-01','0001-01-01',15,90.00,0.0000,0.0000,1,2,1,1,0,1,0,0,0,0,0.0000,'',0,1);
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
INSERT INTO `cliente_contrato_atividade` VALUES (1,1,NULL,1,'2024-01-12 11:14:17',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(2,1,NULL,1,'2024-01-12 11:14:17',3,'',0.00,15.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(3,3,NULL,1,'2024-01-12 11:14:17',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(4,3,NULL,1,'2024-01-12 11:14:17',3,'',640.00,0.0000,5.0000,'0001-01-01','0001-01-01',0,0,NULL),(5,4,NULL,1,'2024-01-12 11:14:18',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(6,4,NULL,1,'2024-01-12 11:14:18',3,'',0.00,10.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(7,5,NULL,1,'2024-01-12 11:14:18',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(8,5,NULL,1,'2024-01-12 11:14:18',3,'',0.00,75.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(9,6,NULL,1,'2024-01-12 11:14:18',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(10,6,NULL,1,'2024-01-12 11:14:18',3,'',0.00,35.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(11,7,NULL,1,'2024-01-12 11:14:18',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(12,7,NULL,1,'2024-01-12 11:14:18',3,'',675.00,0.0000,5.0000,'0001-01-01','0001-01-01',0,0,NULL),(13,8,1,1,'2024-01-12 11:14:19',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(14,12,2,1,'2024-01-12 11:14:20',1,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,0,NULL),(15,8,1,1,'2024-01-12 11:14:21',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',5,0,NULL),(16,8,1,1,'2024-01-12 11:14:21',9,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(17,8,1,1,'2024-01-12 11:14:22',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',6,0,NULL),(18,8,1,1,'2024-01-12 11:14:22',7,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',7,0,NULL),(19,8,1,1,'2024-01-12 11:14:22',9,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(20,8,1,1,'2024-01-12 11:14:22',8,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',6,0,NULL),(21,8,1,1,'2024-01-12 11:14:22',8,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',7,0,NULL),(22,8,1,1,'2024-01-12 11:14:22',10,'',0.00,0.0000,0.0000,'0001-01-01','0001-01-01',0,2,NULL),(23,5,NULL,1,'2024-01-12 11:14:23',4,'Carência solicidata pelo cliente.',0.00,0.0000,0.0000,'2024-01-01','2024-01-31',0,0,NULL),(24,8,1,1,'2024-01-12 11:14:23',4,'Carência promocional.',0.00,0.0000,0.0000,'2024-01-12','2024-01-22',0,0,NULL),(25,5,NULL,1,'2024-01-12 11:14:23',5,'Cliente pediu mais prazo pra pagar.',0.00,0.0000,0.0000,'2024-01-01','2024-02-29',0,0,NULL),(26,8,1,1,'2024-01-12 11:14:23',5,'Cliente pediu mais tempo pra pagar.',0.00,0.0000,0.0000,'2024-01-12','2024-02-01',0,0,NULL),(27,5,NULL,1,'2024-01-12 11:14:23',6,'Carência cancelada por decisão da equipe comercial',0.00,0.0000,0.0000,'2024-01-01','2024-02-29',0,0,NULL);
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
INSERT INTO `cliente_contrato_carencia` VALUES (2,8,'2024-01-12','2024-02-01');
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
INSERT INTO `cliente_contrato_motivo_cancelamento_empresa` VALUES (1,1,0,1,0),(2,1,1,1,0),(3,1,0,1,0),(4,1,0,0,1);
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
INSERT INTO `colaborador_cargo_empresa` VALUES (1,1,1,0),(2,1,1,0),(3,1,1,0),(4,1,1,0),(5,1,1,0),(6,1,1,0),(7,1,1,0),(8,1,1,0),(9,1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso`
--

LOCK TABLES `compromisso` WRITE;
/*!40000 ALTER TABLE `compromisso` DISABLE KEYS */;
INSERT INTO `compromisso` VALUES (1,0,'','0001-01-01 00:00:00','0001-01-01 00:00:00',0,NULL,0),(2,0,'','0001-01-01 00:00:00','0001-01-01 00:00:00',0,NULL,0),(3,1,'Feedback Joseph Climber','2021-01-01 02:01:01','2021-01-01 03:01:01',0,NULL,0),(4,1,'Reunião com a equipe de Desenvolvimento','2021-01-01 04:01:01','2021-01-01 05:01:01',0,NULL,0),(5,1,'Reunião com a equipe de Treinamento','2021-01-01 05:01:01','2021-01-01 06:01:01',0,NULL,0),(6,1,'Reunião com a equipe Comercial','2021-01-01 06:01:01','2021-01-01 07:01:01',0,NULL,0),(7,1,'Reunião com a equipe de Suporte','2021-01-01 07:01:01','2021-01-01 08:01:01',0,NULL,0),(8,1,'Devolutiva do Feedback Joseph Climber','2021-01-03 02:01:01','2021-01-03 03:01:01',0,NULL,0),(9,1,'Visita ao cliente VAP','2020-12-31 02:01:01','2020-12-31 03:01:01',1,NULL,0),(10,1,'Prospecção','2020-12-31 01:01:01','2020-12-31 04:01:01',1,NULL,0),(11,1,'Oferecer SommusBackup à Original Fit LTDA','2020-12-30 01:01:01','2020-12-30 01:31:01',1,NULL,0),(12,1,'Feedback Joseph Climber (excluido)','2021-01-06 01:01:01','2021-01-06 03:01:01',0,NULL,0),(13,1,'Feedback Joseph Climber','2021-01-01 02:01:01','2021-01-01 03:01:01',0,NULL,0),(14,1,'Reunião com a equipe de Desenvolvimento','2021-01-01 04:01:01','2021-01-01 05:01:01',0,NULL,0),(15,1,'Reunião com a equipe de Treinamento','2021-01-01 05:01:01','2021-01-01 06:01:01',0,NULL,0),(16,1,'Reunião com a equipe Comercial','2021-01-01 06:01:01','2021-01-01 07:01:01',0,NULL,0),(17,1,'Reunião com a equipe de Suporte','2021-01-01 07:01:01','2021-01-01 08:01:01',0,NULL,0),(18,1,'Devolutiva do Feedback Joseph Climber','2021-01-03 02:01:01','2021-01-03 03:01:01',0,NULL,0),(19,1,'Visita ao cliente VAP','2020-12-31 02:01:01','2020-12-31 03:01:01',1,NULL,0),(20,1,'Prospecção','2020-12-31 01:01:01','2020-12-31 04:01:01',1,NULL,0),(21,1,'Oferecer SommusBackup à Original Fit','2020-12-30 01:01:01','2020-12-30 01:31:01',0,NULL,0);
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
INSERT INTO `configuracao` VALUES (1,1,6,0,'','',980.00,2,5,1,0.0000,0,0,0.0000,0,30,2,5.0000,4,40,NULL,0,0,218,215,54,1,3,3,1,3,'','',3,NULL,0,0,0,'',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0);
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
INSERT INTO `conta` VALUES (1,1,1,0,'Caixa interno',1,-3040.00,0.00,'2024-01-11','','','',NULL,1,0),(2,2,1,0,'Caixa interno',1,-1373.62,0.00,'2024-01-11','','','',NULL,1,0),(3,2,NULL,756,'Sicoob',3,900.00,0.00,'2024-01-11','4113','2220-0','001',NULL,1,0),(4,2,NULL,0,'Caixa',1,0.00,0.00,'2024-01-11','','','',NULL,1,0),(5,2,NULL,0,'Cofre',2,0.00,0.00,'2024-01-11','','','',NULL,1,0),(6,1,NULL,0,'Conta Sommus',3,0.00,0.00,'2024-01-11','','','',NULL,1,0),(7,2,NULL,0,'Conta exclusão',3,0.00,0.00,'2024-01-11','','','',NULL,0,1),(8,2,NULL,1,'Conta para validação de saldo',3,0.00,0.00,'2024-01-11','0001','0001-0','001',NULL,1,0);
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
  `credora_devedora` char(1) NOT NULL DEFAULT '',
  `codigo_natureza` int(1) NOT NULL DEFAULT '0',
  `analitica_sintetica` char(1) NOT NULL DEFAULT '',
  `nivel` int(2) NOT NULL DEFAULT '0',
  `conta_dre_regime_caixa` tinyint(1) NOT NULL DEFAULT '0',
  `tipo` int(2) NOT NULL DEFAULT '0',
  `conta_corrente` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`conta_contabil_id`),
  UNIQUE KEY `uk_conta_contabil_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_contabil`
--

LOCK TABLES `conta_contabil` WRITE;
/*!40000 ALTER TABLE `conta_contabil` DISABLE KEYS */;
INSERT INTO `conta_contabil` VALUES (1,1,'1',1,'','ATIVO','D',1,'S',1,0,9,0),(2,2,'1.1',2,'','CIRCULANTE','D',1,'S',2,0,9,0),(3,3,'1.1.1',3,'','Disponível','D',1,'S',3,0,9,0),(4,4,'1.1.1.001',4,'','Caixa','D',1,'A',4,0,9,0),(5,5,'1.1.1.002',5,'','Bancos','D',1,'A',4,0,9,0),(6,6,'1.1.1.003',6,'','Cartões de crédito e débito a receber','D',1,'A',4,0,9,0),(7,7,'1.1.1.004',7,'','Cheques a receber','D',1,'A',4,0,9,0),(8,8,'1.1.1.005',8,'','Cheques a receber devolvidos','D',1,'A',4,0,9,0),(9,9,'1.1.2',9,'','Clientes','D',1,'S',3,0,9,0),(10,10,'1.1.2.001',10,'','Duplicatas a receber','D',1,'A',4,0,9,0),(11,11,'1.1.3',11,'','Estoques','D',1,'S',3,0,9,0),(12,12,'1.1.3.001',12,'','Estoque de mercadorias ou produtos','D',1,'A',4,0,9,0),(13,13,'1.1.3.002',13,'','Estoque de matéria-prima','D',1,'A',4,0,9,0),(14,14,'1.1.3.003',14,'','Estoque de materiais de consumo','D',1,'A',4,0,9,0),(15,15,'1.1.3.004',15,'','Estoque de produtos em elaboração','D',1,'A',4,0,9,0),(16,16,'1.1.4',16,'','Outras contas a receber','D',1,'S',3,0,9,0),(17,17,'1.1.4.001',17,'','ICMS a recuperar','D',1,'A',4,0,9,0),(18,18,'1.1.4.002',18,'','PIS/COFINS a recuperar','D',1,'A',4,0,9,0),(19,19,'1.1.4.003',19,'','IPI a recuperar','D',1,'A',4,0,9,0),(20,20,'1.1.4.004',20,'','IRPJ a recuperar','D',1,'A',4,0,9,0),(21,21,'1.2',21,'','NÃO CIRCULANTE','D',1,'S',2,0,9,0),(22,22,'1.2.1',22,'','Imobilizado','D',1,'S',3,0,9,0),(23,23,'1.2.1.001',23,'','Imobilizado','D',1,'A',4,0,9,0),(24,24,'1.2.1.002',24,'','Imóveis','D',1,'A',4,0,9,0),(25,25,'1.2.1.003',25,'','Instalações','D',1,'A',4,0,9,0),(26,26,'1.2.1.004',26,'','Máquinas e equipamentos','D',1,'A',4,0,9,0),(27,27,'1.2.1.005',27,'','Móveis e utensílios','D',1,'A',4,0,9,0),(28,28,'1.2.1.006',28,'','Veículos','D',1,'A',4,0,9,0),(29,29,'1.2.1.007',29,'','(-) Depreciação acumulada','D',1,'A',4,0,9,0),(30,30,'1.2.2',30,'','Intangível','D',1,'S',3,0,9,0),(31,31,'1.2.2.001',31,'','Marcas e patentes','D',1,'A',4,0,9,0),(32,32,'1.2.3',32,'','Investimentos financeiros','D',1,'S',3,0,9,0),(33,33,'1.2.3.001',33,'','Aplicações financeiras','D',1,'A',4,0,9,0),(34,34,'2',34,'','PASSIVO','C',2,'S',1,0,9,0),(35,35,'2.1',35,'','CIRCULANTE','C',2,'S',2,0,9,0),(36,36,'2.1.1',36,'','Obrigações','C',2,'S',3,0,9,0),(37,37,'2.1.1.001',37,'','Fornecedores','C',2,'A',4,0,9,0),(38,38,'2.1.1.002',38,'','Cheques emitidos a compensar','C',2,'A',4,0,9,0),(39,39,'2.1.1.003',39,'','Cheques emitidos devolvidos','C',2,'A',4,0,9,0),(40,40,'2.1.1.004',40,'','Salários a pagar','C',2,'A',4,0,9,0),(41,41,'2.1.1.005',41,'','Juros a pagar','C',2,'A',4,0,9,0),(42,42,'2.1.1.006',42,'','IRRF a recolher','C',2,'A',4,0,9,0),(43,43,'2.1.1.007',43,'','Empréstimos a pagar','C',2,'A',4,0,9,0),(44,44,'2.1.1.008',44,'','Outras obrigações','C',2,'A',4,0,9,0),(45,45,'2.1.1.009',45,'','Impostos a pagar','C',2,'A',4,0,9,0),(46,46,'2.1.1.010',46,'','Obrigações da folha de pagamento','C',2,'A',4,0,9,0),(47,47,'2.3',47,'','PATRIMÔNIO LÍQUIDO','D',3,'S',2,0,9,0),(48,48,'2.3.1',48,'','Capital','D',3,'S',3,0,9,0),(49,49,'2.3.1.001',49,'','Capital','D',3,'A',4,0,9,0),(50,50,'2.3.1.002',50,'','(-) Capital a realizar','D',3,'A',4,0,9,0),(51,51,'2.3.2',51,'','Reservas de lucros','D',3,'S',3,0,9,0),(52,52,'2.3.2.001',52,'','Reserva legal','D',3,'A',4,0,9,0),(53,53,'2.3.3',53,'','Lucros ou prejuízos acumulados','D',3,'S',3,0,9,0),(54,54,'2.3.3.001',54,'','Lucros/prejuízos acumulados','C',3,'A',4,0,9,0),(55,55,'2.3.3.002',55,'','Lucro a distribuir','D',3,'A',4,0,9,0),(56,56,'3',56,'','RECEITAS','C',4,'S',1,0,9,0),(57,57,'3.1',57,'','RECEITAS OPERACIONAIS','C',4,'S',2,0,1,0),(58,58,'3.1.1',58,'','Receitas de vendas','C',4,'S',3,0,9,0),(59,59,'3.1.1.001',59,'','Venda de mercadorias','C',4,'A',4,0,9,0),(60,60,'3.1.1.002',60,'','Prestação de serviços','C',4,'A',4,0,9,0),(61,61,'3.1.1.003',61,'','Vendas de mercadorias a vista','C',4,'A',4,1,9,0),(62,62,'3.1.1.004',62,'','Prestação de serviços a vista','C',4,'A',4,1,9,0),(63,63,'3.1.2',63,'','Receitas com recebimentos','C',4,'S',3,1,9,0),(64,64,'3.1.2.001',64,'','Vendas de mercadorias a prazo','C',4,'A',4,1,9,0),(65,65,'3.1.2.002',65,'','Prestação de serviços a prazo','C',4,'A',4,1,9,0),(66,66,'4',66,'','DEDUÇÕES DA RECEITA','D',4,'S',1,0,2,0),(67,67,'4.1',67,'','DEVOLUÇÕES','D',4,'S',2,0,9,0),(68,68,'4.1.1',68,'','Devoluções de vendas','D',4,'S',3,0,9,0),(69,69,'4.1.1.001',69,'','(-) Devoluções de vendas','D',4,'A',4,0,9,0),(70,70,'4.1.1.002',70,'','(-) Devoluções de vendas do exercício anterior','D',4,'A',4,0,9,0),(71,71,'4.2',71,'','IMPOSTOS SOBRE AS VENDAS','D',4,'S',2,0,9,0),(72,72,'4.2.1',72,'','IMPOSTOS','D',4,'S',3,0,9,0),(73,73,'4.2.1.001',73,'','(-) ICMS','D',4,'A',4,0,9,0),(74,74,'4.2.1.002',74,'','(-) PIS/COFINS','D',4,'A',4,0,9,0),(75,75,'4.2.1.003',75,'','(-) IPI','D',4,'A',4,0,9,0),(76,76,'4.2.1.004',76,'','(-) ISSQN','D',4,'A',4,0,9,0),(77,77,'5',77,'','CUSTOS','D',4,'S',1,0,3,0),(78,78,'5.1',78,'','CUSTOS OPERACIONAIS','D',4,'S',2,0,9,0),(79,79,'5.1.1',79,'','Custo das vendas e prestações de serviços','D',4,'S',3,0,9,0),(80,80,'5.1.1.001',80,'','(-) Custo da Mercadoria Vendida','D',4,'A',4,0,9,0),(81,81,'5.1.1.002',81,'','(-) Custo da Prestação de Serviços','D',4,'A',4,0,9,0),(82,82,'5.1.2',82,'','Compras de mercadorias','D',4,'S',3,1,9,0),(83,83,'5.1.2.001',83,'','Compra de mercadorias para revenda','D',4,'A',4,1,9,0),(84,84,'5.1.2.002',84,'','Compras de matéria-prima ','D',9,'A',4,1,9,0),(85,85,'6',85,'','DESPESAS','D',4,'S',1,0,9,0),(86,86,'6.1',86,'','DESPESAS OPERACIONAIS','D',4,'S',2,0,4,0),(87,87,'6.1.1',87,'','Despesas com vendas','D',4,'S',3,0,9,0),(88,88,'6.1.1.001',88,'','Comissões sobre vendas','D',4,'A',4,0,9,0),(89,89,'6.1.1.002',89,'','Vendas de mercadorias','D',4,'A',4,1,9,0),(90,90,'6.1.1.003',90,'','Vendas de produtos','D',4,'A',4,1,9,0),(91,91,'6.1.1.004',91,'','Prestação de serviços','D',4,'A',4,1,9,0),(92,92,'6.1.2',92,'','Despesas administrativas','D',4,'S',3,0,9,0),(93,93,'6.1.2.001',93,'','Aluguel e correlacionados','D',4,'A',4,0,9,0),(94,94,'6.1.2.002',94,'','Energia elétrica','D',4,'A',4,0,9,0),(95,95,'6.1.2.003',95,'','Água/esgoto','D',4,'A',4,0,9,0),(96,96,'6.1.2.004',96,'','Correios','D',4,'A',4,0,9,0),(97,97,'6.1.2.005',97,'','Fretes','D',4,'A',4,0,9,0),(98,98,'6.1.2.006',98,'','Material de expediente','D',4,'A',4,0,9,0),(99,99,'6.1.2.007',99,'','Comunicações','D',4,'A',4,0,9,0),(100,100,'6.1.2.008',100,'','Impostos e taxas','D',4,'A',4,0,9,0),(101,101,'6.1.2.009',101,'','Serviços de terceiros','D',4,'A',4,0,9,0),(102,102,'6.1.2.010',102,'','Multas fiscais','D',4,'A',4,0,9,0),(103,103,'6.1.2.011',103,'','Honorários da diretoria','D',4,'A',4,0,9,0),(104,104,'6.1.2.012',104,'','Honorários contábeis/advocatícios','D',4,'A',4,0,9,0),(105,105,'6.1.2.013',105,'','Cursos e treinamentos','D',4,'A',4,0,9,0),(106,106,'6.1.2.014',106,'','Viagens','D',4,'A',4,0,9,0),(107,107,'6.1.2.015',107,'','Entidades de classe','D',4,'A',4,0,9,0),(108,108,'6.1.2.016',108,'','Manutenção de veículos','D',4,'A',4,0,9,0),(109,109,'6.1.2.017',109,'','Manutenção predial','D',4,'A',4,0,9,0),(110,110,'6.1.2.018',110,'','Manutenção de software/hardware','D',4,'A',4,0,9,0),(111,111,'6.1.2.019',111,'','Provedor de internet','D',4,'A',4,0,9,0),(112,112,'6.1.2.020',112,'','Marketing/publicidade','D',4,'A',4,0,9,0),(113,113,'6.1.2.021',113,'','Alimentação','D',4,'A',4,0,9,0),(114,114,'6.1.2.022',114,'','Seguros da empresa','D',4,'A',4,0,9,0),(115,115,'6.1.2.023',115,'','Taxas e licenciamentos','D',4,'A',4,0,9,0),(116,116,'6.1.2.024',116,'','Manutenção em máquinas e equipamentos','D',4,'A',4,0,9,0),(117,117,'6.1.2.025',117,'','Material de limpeza','D',4,'A',4,0,9,0),(118,118,'6.1.2.026',118,'','Aluguel e correlacionados','D',4,'A',4,1,9,0),(119,119,'6.1.2.027',119,'','Energia Elétrica','D',4,'A',4,1,9,0),(120,120,'6.1.2.028',120,'','Água/Esgoto','D',4,'A',4,1,9,0),(121,121,'6.1.2.029',121,'','Correios','D',4,'A',4,1,9,0),(122,122,'6.1.2.030',122,'','Fretes','D',4,'A',4,1,9,0),(123,123,'6.1.2.031',123,'','Material de expediente','D',4,'A',4,1,9,0),(124,124,'6.1.2.032',124,'','Comunicações','D',4,'A',4,1,9,0),(125,125,'6.1.2.033',125,'','Impostos e taxas','D',4,'A',4,1,9,0),(126,126,'6.1.2.034',126,'','Serviços de terceiros','D',4,'A',4,1,9,0),(127,127,'6.1.2.035',127,'','Multas fiscais','D',4,'A',4,1,9,0),(128,128,'6.1.2.036',128,'','Honorários da diretoria','D',4,'A',4,1,9,0),(129,129,'6.1.2.037',129,'','Honorários contábeis/advocatícios','D',4,'A',4,1,9,0),(130,130,'6.1.2.038',130,'','Cursos e treinamentos','D',4,'A',4,1,9,0),(131,131,'6.1.2.039',131,'','Viagens','D',4,'A',4,1,9,0),(132,132,'6.1.2.040',132,'','Entidades de classe','D',4,'A',4,1,9,0),(133,133,'6.1.2.041',133,'','Manutenção de veículos','D',4,'A',4,1,9,0),(134,134,'6.1.2.042',134,'','Manutenção predial','D',4,'A',4,1,9,0),(135,135,'6.1.2.043',135,'','Manutenção de software/hardware','D',4,'A',4,1,9,0),(136,136,'6.1.2.044',136,'','Provedor de internet','D',4,'A',4,1,9,0),(137,137,'6.1.2.045',137,'','Marketing/Publicidade','D',4,'A',4,1,9,0),(138,138,'6.1.2.046',138,'','Alimentação','D',4,'A',4,1,9,0),(139,139,'6.1.2.047',139,'','Seguros da empresa','D',4,'A',4,1,9,0),(140,140,'6.1.2.048',140,'','Taxas e licenciamentos','D',4,'A',4,1,9,0),(141,141,'6.1.2.049',141,'','Manutenção em máquinas e equipamentos','D',4,'A',4,1,9,0),(142,142,'6.1.2.050',142,'','Material de limpeza','D',4,'A',4,1,9,0),(143,143,'6.1.3',143,'','Despesas com pessoal','D',4,'S',3,0,9,0),(144,144,'6.1.3.001',144,'','Salários','D',4,'A',4,0,9,0),(145,145,'6.1.3.002',145,'','13º Salários','D',4,'A',4,0,9,0),(146,146,'6.1.3.003',146,'','Encargos sociais (INSS)','D',4,'A',4,0,9,0),(147,147,'6.1.3.004',147,'','Férias','D',4,'A',4,0,9,0),(148,148,'6.1.3.005',148,'','Salários dos sócios','D',4,'A',4,0,9,0),(149,149,'6.1.3.006',149,'','Seguro dos funcionários','D',4,'A',4,0,9,0),(150,150,'6.1.3.007',150,'','Uniformes','D',4,'A',4,0,9,0),(151,151,'6.1.3.008',151,'','Horas-extras de funcionários','D',4,'A',4,0,9,0),(152,152,'6.1.3.009',152,'','Plano de saúde de funcionários','D',4,'A',4,0,9,0),(153,153,'6.1.3.010',153,'','Comissões','D',4,'A',4,0,9,0),(154,154,'6.1.3.011',154,'','Vale alimentação','D',4,'A',4,0,9,0),(155,155,'6.1.3.012',155,'','Descanso semanal remunerado','D',4,'A',4,0,9,0),(156,156,'6.1.3.013',156,'','Adicional noturno, insalubridade e periculosidade','D',4,'A',4,0,9,0),(157,157,'6.1.3.014',157,'','Salário família','D',4,'A',4,0,9,0),(158,158,'6.1.3.015',158,'','Vale transporte','D',4,'A',4,0,9,0),(159,159,'6.1.3.016',159,'','Salário ','D',4,'A',4,1,9,0),(160,160,'6.1.3.017',160,'','13º Salários','D',4,'A',4,1,9,0),(161,161,'6.1.3.018',161,'','Encargos sociais (INSS)','D',4,'A',4,1,9,0),(162,162,'6.1.3.019',162,'','Férias','D',4,'A',4,1,9,0),(163,163,'6.1.3.020',163,'','Salários dos sócios','D',4,'A',4,1,9,0),(164,164,'6.1.3.021',164,'','Seguro dos funcionários','D',4,'A',4,1,9,0),(165,165,'6.1.3.022',165,'','Uniformes','D',4,'A',4,1,9,0),(166,166,'6.1.3.023',166,'','Horas-extras de funcionários','D',4,'A',4,1,9,0),(167,167,'6.1.3.024',167,'','Comissões sobre vendas','D',4,'A',4,1,9,0),(168,168,'6.1.3.025',168,'','Vale alimentação','D',4,'A',4,1,9,0),(169,169,'6.1.3.026',169,'','Descanso semanal remunerado','D',4,'A',4,1,9,0),(170,170,'6.1.3.027',170,'','Adicional noturno, insalubridade e periculosidade','D',4,'A',4,1,9,0),(171,171,'6.1.3.028',171,'','Salário família','D',4,'A',4,1,9,0),(172,172,'6.1.3.029',172,'','Vale transporte','D',4,'A',4,1,9,0),(173,173,'6.1.3.030',173,'','Contribuição sindical','D',4,'A',4,0,9,0),(174,174,'6.1.3.031',174,'','Contribuição sindical','D',4,'A',4,1,9,0),(175,175,'6.1.4',175,'','Despesas financeiras','D',4,'S',3,0,9,0),(176,176,'6.1.4.001',176,'','Despesas bancárias','D',4,'A',4,0,9,0),(177,177,'6.1.4.002',177,'','Juros passivos','D',4,'A',4,0,9,0),(178,178,'6.1.4.003',178,'','Descontos concedidos','D',4,'A',4,0,9,0),(179,179,'6.1.4.004',179,'','Tarifas bancárias','D',4,'A',4,0,9,0),(180,180,'6.1.4.005',180,'','Empréstimos e financiamentos','D',4,'A',4,0,9,0),(181,181,'6.1.4.006',181,'','Juros e taxas passivos de cartão de crédito/débito','D',4,'A',4,0,9,0),(182,182,'6.1.4.007',182,'','Taxas e impostos bancários','D',4,'A',4,1,9,0),(183,183,'6.1.4.008',183,'','Taxas de cobrança bancária','D',4,'A',4,1,9,0),(184,184,'6.1.4.009',184,'','Juros pagos','D',4,'A',4,1,9,0),(185,185,'6.1.4.010',185,'','Descontos concedidos','D',4,'A',4,1,9,0),(186,186,'6.1.4.011',186,'','Empréstimos e financiamentos','D',4,'A',4,1,9,0),(187,187,'6.1.4.012',187,'','Juros e taxas de cartão de crédito','D',4,'A',4,1,9,0),(188,188,'6.1.5',188,'','Outras despesas operacionais','D',4,'S',3,0,9,0),(189,189,'6.1.5.001',189,'','Despesas eventuais','D',4,'A',4,0,9,0),(190,190,'6.1.6',190,'','Investimentos','D',4,'S',3,0,9,0),(191,191,'6.1.6.001',191,'','Compra de imobilizado','D',4,'A',4,0,9,0),(192,192,'6.1.6.002',192,'','Investimento em aplicação financeira','D',4,'A',4,0,9,0),(193,193,'6.1.6.003',193,'','Compra de marca ou patente','D',4,'A',4,0,9,0),(194,194,'6.1.6.004',194,'','Compra de imobilizado','D',4,'A',4,1,9,0),(195,195,'6.1.6.005',195,'','Aplicação financeira','D',4,'A',4,1,9,0),(196,196,'6.1.6.006',196,'','Compra de marca ou patente','D',4,'A',4,1,9,0),(197,197,'7',197,'','RECEITAS E DESPESAS NÃO OPERACIONAIS','C',4,'S',1,0,9,0),(198,198,'7.1',198,'','DESPESAS NÃO OPERACIONAIS','D',4,'S',2,0,6,0),(199,199,'7.1.1',199,'','Despesas não operacionais','D',4,'S',3,0,9,0),(200,200,'7.1.1.001',200,'','Outras despesas não operacionais','D',4,'A',4,0,9,0),(201,201,'7.2',201,'','RECEITAS NÃO OPERACIONAIS','C',4,'S',2,0,5,0),(202,202,'7.2.1',202,'','Receitas financeiras','C',4,'S',3,0,9,0),(203,203,'7.2.1.001',203,'','Rendimentos de aplicações financeiras','C',4,'A',4,0,9,0),(204,204,'7.2.1.002',204,'','Descontos obtidos','C',4,'A',4,0,9,0),(205,205,'7.2.1.003',205,'','Juros ativos','C',4,'A',4,0,9,0),(206,206,'7.2.1.004',206,'','Juros recebidos','C',4,'A',4,1,9,0),(207,207,'7.2.1.005',207,'','Descontos recebidos','C',4,'A',4,1,9,0),(208,208,'7.2.2',208,'','Outras receitas não operacionais','C',4,'S',3,0,9,0),(209,209,'7.2.2.001',209,'','Receitas eventuais','C',4,'A',4,0,9,0),(210,210,'7.2.2.002',210,'','Vendas de imobilizado','C',4,'A',4,1,9,0),(211,211,'8',211,'','CONTAS DE APURAÇÃO DE RESULTADOS','C',4,'S',1,0,9,0),(212,212,'8.1',212,'','APURAÇÃO DE RESULTADO','D',4,'S',2,0,9,0),(213,213,'8.1.1',213,'','Apuração de resultado','D',4,'S',3,0,9,0),(214,214,'8.1.1.001',214,'','(-) Retirada de lucro pelo proprietário','D',4,'A',4,0,9,0),(215,215,'8.1.1.002',215,'','Apuração do resultado do exercício','D',4,'A',4,0,9,0),(216,216,'8.1.1.003',216,'','Retiradas dos sócios','C',4,'A',4,1,9,0),(217,217,'8.1.1.004',217,'','IR e CSLL','C',4,'A',4,1,7,0),(218,218,'8.1.1.005',218,'','Lucro/Prejuízo apurado no exercício','C',4,'A',4,1,9,0),(219,NULL,'1001',1001,'','Ativo','D',1,'S',1,0,1,0),(220,NULL,'1002',1002,'','Passivo','C',2,'S',1,0,2,0),(221,NULL,'1003',1003,'','Passivo','C',2,'S',1,0,3,0);
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
INSERT INTO `conta_contabil_empresa` VALUES (1,1,'',1,0),(1,2,'',1,0),(2,1,'',1,0),(2,2,'',1,0),(3,1,'',1,0),(3,2,'',1,0),(4,1,'',1,0),(4,2,'220266150',1,0),(5,1,'',1,0),(5,2,'639422187',1,0),(6,1,'',1,0),(6,2,'1409950115',1,0),(7,1,'',1,0),(7,2,'32994396',1,0),(8,1,'',1,0),(8,2,'1829106152',1,0),(9,1,'',1,0),(9,2,'',1,0),(10,1,'',1,0),(10,2,'452150433',1,0),(11,1,'',1,0),(11,2,'',1,0),(12,1,'',1,0),(12,2,'100778542',1,0),(13,1,'',1,0),(13,2,'871306470',1,0),(14,1,'',1,0),(14,2,'1641834398',1,0),(15,1,'',1,0),(15,2,'1290462507',1,0),(16,1,'',1,0),(16,2,'',1,0),(17,1,'',1,0),(17,2,'2060990435',1,0),(18,1,'',1,0),(18,2,'684034716',1,0),(19,1,'',1,0),(19,2,'332662825',1,0),(20,1,'',1,0),(20,2,'1103190753',1,0),(21,1,'',1,0),(21,2,'',1,0),(22,1,'',1,0),(22,2,'',1,0),(23,1,'',1,0),(23,2,'751818862',1,0),(24,1,'',1,0),(24,2,'1522346790',1,0),(25,1,'',1,0),(25,2,'145391071',1,0),(26,1,'',1,0),(26,2,'1941502827',1,0),(27,1,'',1,0),(27,2,'564547108',1,0),(28,1,'',1,0),(28,2,'1335075036',1,0),(29,1,'',1,0),(29,2,'983703145',1,0),(30,1,'',1,0),(30,2,'',1,0),(31,1,'',1,0),(31,2,'1754231073',1,0),(32,1,'',1,0),(32,2,'',1,0),(33,1,'',1,0),(33,2,'1402859182',1,0),(34,1,'',1,0),(34,2,'',1,0),(35,1,'',1,0),(35,2,'',1,0),(36,1,'',1,0),(36,2,'',1,0),(37,1,'',1,0),(37,2,'25903463',1,0),(38,1,'',1,0),(38,2,'796431391',1,0),(39,1,'',1,0),(39,2,'445059500',1,0),(40,1,'',1,0),(40,2,'1215587428',1,0),(41,1,'',1,0),(41,2,'1986115356',1,0),(42,1,'',1,0),(42,2,'1634743465',1,0),(43,1,'',1,0),(43,2,'257787746',1,0),(44,1,'',1,0),(44,2,'2053899502',1,0),(45,1,'',1,0),(45,2,'676943783',1,0),(46,1,'',1,0),(46,2,'1447471711',1,0),(47,1,'',1,0),(47,2,'',1,0),(48,1,'',1,0),(48,2,'',1,0),(49,1,'',1,0),(49,2,'1096099820',1,0),(50,1,'',1,0),(50,2,'1866627748',1,0),(51,1,'',1,0),(51,2,'',1,0),(52,1,'',1,0),(52,2,'489672029',1,0),(53,1,'',1,0),(53,2,'',1,0),(54,1,'',1,0),(54,2,'138300138',1,0),(55,1,'',1,0),(55,2,'908828066',1,0),(56,1,'',1,0),(56,2,'',1,0),(57,1,'',1,0),(57,2,'',1,0),(58,1,'',1,0),(58,2,'',1,0),(59,1,'',1,0),(59,2,'557456175',1,0),(60,1,'',1,0),(60,2,'1327984103',1,0),(61,1,'',1,0),(61,2,'2098512031',1,0),(62,1,'',1,0),(62,2,'1747140140',1,0),(63,1,'',1,0),(63,2,'',1,0),(64,1,'',1,0),(64,2,'370184421',1,0),(65,1,'',1,0),(65,2,'1140712349',1,0),(66,1,'',1,0),(66,2,'',1,0),(67,1,'',1,0),(67,2,'',1,0),(68,1,'',1,0),(68,2,'',1,0),(69,1,'',1,0),(69,2,'789340458',1,0),(70,1,'',1,0),(70,2,'1559868386',1,0),(71,1,'',1,0),(71,2,'',1,0),(72,1,'',1,0),(72,2,'',1,0),(73,1,'',1,0),(73,2,'1208496495',1,0),(74,1,'',1,0),(74,2,'1979024423',1,0),(75,1,'',1,0),(75,2,'602068704',1,0),(76,1,'',1,0),(76,2,'250696813',1,0),(77,1,'',1,0),(77,2,'',1,0),(78,1,'',1,0),(78,2,'',1,0),(79,1,'',1,0),(79,2,'',1,0),(80,1,'',1,0),(80,2,'1021224741',1,0),(81,1,'',1,0),(81,2,'1791752669',1,0),(82,1,'',1,0),(82,2,'',1,0),(83,1,'',1,0),(83,2,'1440380778',1,0),(84,1,'',1,0),(84,2,'63425059',1,0),(85,1,'',1,0),(85,2,'',1,0),(86,1,'',1,0),(86,2,'',1,0),(87,1,'',1,0),(87,2,'',1,0),(88,1,'',1,0),(88,2,'1859536815',1,0),(89,1,'',1,0),(89,2,'482581096',1,0),(90,1,'',1,0),(90,2,'1253109024',1,0),(91,1,'',1,0),(91,2,'901737133',1,0),(92,1,'',1,0),(92,2,'',1,0),(93,1,'',1,0),(93,2,'1672265061',1,0),(94,1,'',1,0),(94,2,'295309342',1,0),(95,1,'',1,0),(95,2,'2091421098',1,0),(96,1,'',1,0),(96,2,'714465379',1,0),(97,1,'',1,0),(97,2,'363093488',1,0),(98,1,'',1,0),(98,2,'1133621416',1,0),(99,1,'',1,0),(99,2,'1904149344',1,0),(100,1,'',1,0),(100,2,'1552777453',1,0),(101,1,'',1,0),(101,2,'175821734',1,0),(102,1,'',1,0),(102,2,'946349662',1,0),(103,1,'',1,0),(103,2,'594977771',1,0),(104,1,'',1,0),(104,2,'1365505699',1,0),(105,1,'',1,0),(105,2,'1014133808',1,0),(106,1,'',1,0),(106,2,'1784661736',1,0),(107,1,'',1,0),(107,2,'407706017',1,0),(108,1,'',1,0),(108,2,'56334126',1,0),(109,1,'',1,0),(109,2,'826862054',1,0),(110,1,'',1,0),(110,2,'1597389982',1,0),(111,1,'',1,0),(111,2,'1246018091',1,0),(112,1,'',1,0),(112,2,'2016546019',1,0),(113,1,'',1,0),(113,2,'1665174128',1,0),(114,1,'',1,0),(114,2,'288218409',1,0),(115,1,'',1,0),(115,2,'1058746337',1,0),(116,1,'',1,0),(116,2,'1477902374',1,0),(117,1,'',1,0),(117,2,'100946655',1,0),(118,1,'',1,0),(118,2,'1897058411',1,0),(119,1,'',1,0),(119,2,'520102692',1,0),(120,1,'',1,0),(120,2,'168730801',1,0),(121,1,'',1,0),(121,2,'939258729',1,0),(122,1,'',1,0),(122,2,'1709786657',1,0),(123,1,'',1,0),(123,2,'1358414766',1,0),(124,1,'',1,0),(124,2,'2128942694',1,0),(125,1,'',1,0),(125,2,'751986975',1,0),(126,1,'',1,0),(126,2,'400615084',1,0),(127,1,'',1,0),(127,2,'1171143012',1,0),(128,1,'',1,0),(128,2,'819771121',1,0),(129,1,'',1,0),(129,2,'1590299049',1,0),(130,1,'',1,0),(130,2,'213343330',1,0),(131,1,'',1,0),(131,2,'2009455086',1,0),(132,1,'',1,0),(132,2,'632499367',1,0),(133,1,'',1,0),(133,2,'1403027295',1,0),(134,1,'',1,0),(134,2,'1051655404',1,0),(135,1,'',1,0),(135,2,'1822183332',1,0),(136,1,'',1,0),(136,2,'1470811441',1,0),(137,1,'',1,0),(137,2,'93855722',1,0),(138,1,'',1,0),(138,2,'864383650',1,0),(139,1,'',1,0),(139,2,'513011759',1,0),(140,1,'',1,0),(140,2,'1283539687',1,0),(141,1,'',1,0),(141,2,'2054067615',1,0),(142,1,'',1,0),(142,2,'1702695724',1,0),(143,1,'',1,0),(143,2,'',1,0),(144,1,'',1,0),(144,2,'325740005',1,0),(145,1,'',1,0),(145,2,'2121851761',1,0),(146,1,'',1,0),(146,2,'744896042',1,0),(147,1,'',1,0),(147,2,'1515423970',1,0),(148,1,'',1,0),(148,2,'1164052079',1,0),(149,1,'',1,0),(149,2,'1934580007',1,0),(150,1,'',1,0),(150,2,'557624288',1,0),(151,1,'',1,0),(151,2,'206252397',1,0),(152,1,'',1,0),(152,2,'976780325',1,0),(153,1,'',1,0),(153,2,'625408434',1,0),(154,1,'',1,0),(154,2,'1395936362',1,0),(155,1,'',1,0),(155,2,'18980643',1,0),(156,1,'',1,0),(156,2,'1815092399',1,0),(157,1,'',1,0),(157,2,'438136680',1,0),(158,1,'',1,0),(158,2,'1208664608',1,0),(159,1,'',1,0),(159,2,'857292717',1,0),(160,1,'',1,0),(160,2,'1627820645',1,0),(161,1,'',1,0),(161,2,'1276448754',1,0),(162,1,'',1,0),(162,2,'2046976682',1,0),(163,1,'',1,0),(163,2,'670020963',1,0),(164,1,'',1,0),(164,2,'318649072',1,0),(165,1,'',1,0),(165,2,'1089177000',1,0),(166,1,'',1,0),(166,2,'1859704928',1,0),(167,1,'',1,0),(167,2,'1508333037',1,0),(168,1,'',1,0),(168,2,'131377318',1,0),(169,1,'',1,0),(169,2,'1927489074',1,0),(170,1,'',1,0),(170,2,'550533355',1,0),(171,1,'',1,0),(171,2,'1321061283',1,0),(172,1,'',1,0),(172,2,'969689392',1,0),(173,1,'',1,0),(173,2,'1740217320',1,0),(174,1,'',1,0),(174,2,'363261601',1,0),(175,1,'',1,0),(175,2,'',1,0),(176,1,'',1,0),(176,2,'11889710',1,0),(177,1,'',1,0),(177,2,'782417638',1,0),(178,1,'',1,0),(178,2,'431045747',1,0),(179,1,'',1,0),(179,2,'1201573675',1,0),(180,1,'',1,0),(180,2,'1972101603',1,0),(181,1,'',1,0),(181,2,'1620729712',1,0),(182,1,'',1,0),(182,2,'243773993',1,0),(183,1,'',1,0),(183,2,'1014301921',1,0),(184,1,'',1,0),(184,2,'662930030',1,0),(185,1,'',1,0),(185,2,'1433457958',1,0),(186,1,'',1,0),(186,2,'1082086067',1,0),(187,1,'',1,0),(187,2,'1852613995',1,0),(188,1,'',1,0),(188,2,'',1,0),(189,1,'',1,0),(189,2,'475658276',1,0),(190,1,'',1,0),(190,2,'',1,0),(191,1,'',1,0),(191,2,'124286385',1,0),(192,1,'',1,0),(192,2,'894814313',1,0),(193,1,'',1,0),(193,2,'1665342241',1,0),(194,1,'',1,0),(194,2,'1313970350',1,0),(195,1,'',1,0),(195,2,'2084498278',1,0),(196,1,'',1,0),(196,2,'1733126387',1,0),(197,1,'',1,0),(197,2,'',1,0),(198,1,'',1,0),(198,2,'',1,0),(199,1,'',1,0),(199,2,'',1,0),(200,1,'',1,0),(200,2,'356170668',1,0),(201,1,'',1,0),(201,2,'',1,0),(202,1,'',1,0),(202,2,'',1,0),(203,1,'',1,0),(203,2,'1126698596',1,0),(204,1,'',1,0),(204,2,'775326705',1,0),(205,1,'',1,0),(205,2,'1545854633',1,0),(206,1,'',1,0),(206,2,'168898914',1,0),(207,1,'',1,0),(207,2,'1965010670',1,0),(208,1,'',1,0),(208,2,'',1,0),(209,1,'',1,0),(209,2,'588054951',1,0),(210,1,'',1,0),(210,2,'236683060',1,0),(211,1,'',1,0),(211,2,'',1,0),(212,1,'',1,0),(212,2,'',1,0),(213,1,'',1,0),(213,2,'',1,0),(214,1,'',1,0),(214,2,'1007210988',1,0),(215,1,'',1,0),(215,2,'1777738916',1,0),(216,1,'',1,0),(216,2,'1426367025',1,0),(217,1,'',1,0),(217,2,'49411306',1,0),(218,1,'',1,0),(218,2,'819939234',1,0),(219,2,'',1,0),(220,2,'',1,0),(221,2,'',0,1);
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
INSERT INTO `conta_contabil_saldo` VALUES (1,2,'202401',345.00,1),(1,2,'202401',-170.50,2),(2,2,'202401',-345.00,1),(2,2,'202401',0.00,2),(3,2,'202401',-170.50,2),(4,2,'202312',-700.00,2),(4,2,'202401',34.00,1),(4,2,'202401',-566.78,2),(4,2,'202402',34.00,1),(4,2,'202402',-566.78,2),(4,2,'202403',34.00,1),(4,2,'202403',-566.78,2),(4,2,'202404',34.00,1),(4,2,'202404',-566.78,2),(4,2,'202405',34.00,1),(4,2,'202405',-566.78,2),(4,2,'202406',34.00,1),(4,2,'202406',-566.78,2),(4,2,'202407',34.00,1),(4,2,'202407',-566.78,2),(4,2,'202408',34.00,1),(4,2,'202408',-566.78,2),(4,2,'202409',34.00,1),(4,2,'202409',-566.78,2),(4,2,'202410',34.00,1),(4,2,'202410',-566.78,2),(4,2,'202411',34.00,1),(4,2,'202411',-1566.78,2),(4,2,'202412',34.00,1),(4,2,'202412',-2566.78,2),(5,2,'202401',-3316.00,1),(5,2,'202401',85.80,2),(5,2,'202402',-3316.00,1),(5,2,'202402',-661.09,2),(5,2,'202403',-3316.00,1),(5,2,'202403',-661.09,2),(5,2,'202404',-3316.00,1),(5,2,'202404',-661.09,2),(5,2,'202405',-3316.00,1),(5,2,'202405',-661.09,2),(5,2,'202406',-3316.00,1),(5,2,'202406',-661.09,2),(5,2,'202407',-3316.00,1),(5,2,'202407',-661.09,2),(5,2,'202408',-3316.00,1),(5,2,'202408',-661.09,2),(5,2,'202409',-3316.00,1),(5,2,'202409',-661.09,2),(5,2,'202410',-3316.00,1),(5,2,'202410',-661.09,2),(5,2,'202411',-3316.00,1),(5,2,'202411',-661.09,2),(5,2,'202412',-3316.00,1),(5,2,'202412',-661.09,2),(10,2,'202401',-127.01,2),(10,2,'202402',-371.09,2),(10,2,'202403',-371.09,2),(10,2,'202404',-371.09,2),(10,2,'202405',-371.09,2),(10,2,'202406',-371.09,2),(10,2,'202407',-371.09,2),(10,2,'202408',-371.09,2),(10,2,'202409',-371.09,2),(10,2,'202410',-371.09,2),(10,2,'202411',-371.09,2),(10,2,'202412',-371.09,2),(12,2,'202401',0.00,1),(12,2,'202401',442.09,2),(12,2,'202402',168.42,2),(12,2,'202403',168.42,2),(12,2,'202404',168.42,2),(12,2,'202405',168.42,2),(12,2,'202406',168.42,2),(12,2,'202407',168.42,2),(12,2,'202408',168.42,2),(12,2,'202409',168.42,2),(12,2,'202410',168.42,2),(12,2,'202411',168.42,2),(12,2,'202412',168.42,2),(14,2,'202402',-525.00,2),(14,2,'202403',-525.00,2),(14,2,'202404',-525.00,2),(14,2,'202405',-525.00,2),(14,2,'202406',-525.00,2),(14,2,'202407',-525.00,2),(14,2,'202408',-525.00,2),(14,2,'202409',-525.00,2),(14,2,'202410',-525.00,2),(14,2,'202411',-525.00,2),(14,2,'202412',-525.00,2),(20,2,'202401',0.00,1),(20,2,'202401',0.00,2),(20,2,'202402',-554.73,2),(20,2,'202403',-554.73,2),(20,2,'202404',-554.73,2),(20,2,'202405',-554.73,2),(20,2,'202406',-554.73,2),(20,2,'202407',-554.73,2),(20,2,'202408',-554.73,2),(20,2,'202409',-554.73,2),(20,2,'202410',-554.73,2),(20,2,'202411',-554.73,2),(20,2,'202412',-554.73,2),(23,2,'202402',-184.91,2),(23,2,'202403',-184.91,2),(23,2,'202404',-184.91,2),(23,2,'202405',-184.91,2),(23,2,'202406',-184.91,2),(23,2,'202407',-184.91,2),(23,2,'202408',-184.91,2),(23,2,'202409',-184.91,2),(23,2,'202410',-184.91,2),(23,2,'202411',-184.91,2),(23,2,'202412',-184.91,2),(30,2,'202401',0.00,1),(30,2,'202401',0.00,2),(37,2,'202401',0.00,2),(38,2,'202401',16.00,1),(38,2,'202402',16.00,1),(38,2,'202403',16.00,1),(38,2,'202404',16.00,1),(38,2,'202405',16.00,1),(38,2,'202406',16.00,1),(38,2,'202407',16.00,1),(38,2,'202408',16.00,1),(38,2,'202409',16.00,1),(38,2,'202410',16.00,1),(38,2,'202411',16.00,1),(38,2,'202412',16.00,1),(40,2,'202312',55110.00,2),(40,2,'202401',-3350.00,1),(40,2,'202401',55110.00,2),(40,2,'202402',-3350.00,1),(40,2,'202402',55660.00,2),(40,2,'202403',-3350.00,1),(40,2,'202403',55660.00,2),(40,2,'202404',-3350.00,1),(40,2,'202404',55660.00,2),(40,2,'202405',-3350.00,1),(40,2,'202405',55660.00,2),(40,2,'202406',-3350.00,1),(40,2,'202406',55660.00,2),(40,2,'202407',-3350.00,1),(40,2,'202407',55660.00,2),(40,2,'202408',-3350.00,1),(40,2,'202408',55660.00,2),(40,2,'202409',-3350.00,1),(40,2,'202409',55660.00,2),(40,2,'202410',-3350.00,1),(40,2,'202410',55660.00,2),(40,2,'202411',-3350.00,1),(40,2,'202411',54660.00,2),(40,2,'202412',-3350.00,1),(40,2,'202412',55660.00,2),(88,2,'202401',16.00,1),(144,2,'202312',-56000.00,2),(144,2,'202402',-550.00,2),(145,2,'202412',-2000.00,2),(152,2,'202312',1490.00,2),(153,2,'202312',-1300.00,2),(159,2,'202401',-2950.00,1),(167,2,'202401',-1300.00,1);
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
INSERT INTO `conta_saldo` VALUES (1,'2024-01-11',0.00),(1,'2024-01-12',-3040.00),(2,'2024-01-11',0.00),(2,'2024-01-12',-1373.62),(3,'2024-01-11',0.00),(3,'2024-01-12',900.00),(4,'2024-01-11',0.00),(5,'2024-01-11',0.00),(6,'2024-01-11',0.00),(7,'2024-01-11',0.00),(8,'2024-01-11',0.00);
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
INSERT INTO `empresa` VALUES (1,'Sommus Automação Comercial LTDA','Sommus Sistemas','04717475000154','ISENTO','5956','2024-01-12','Empresas/1/Logo/c4ca4238a0b923820dcc509a6f75849b','',0,1,0),(2,'Geralda Aparecida de Miranda Silva','TEMPERO CRISTALINA','24634181000176','0027467430027','','2024-01-12','Empresas/2/Logo/c81e728d9d4c2f636f067f89cc14862c','',0,1,0);
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
INSERT INTO `empresa_contato` VALUES (1,1,2,'(037) 3261-9150',''),(2,2,2,'03732619150',''),(27,2,1,'03732619150','teste');
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Loja','Loja do Centro','Av. Brasil','999','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2024-01-12 11:12:52'),(2,'Deposito','Deposito do Centro','Av. Brasil','995','Centro','Loja','35590000','Lagoa da Prata','MG','3137205','2024-01-12 11:12:52'),(3,'Teste exclusão','','','','','','','','','','2024-01-12 11:12:52');
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
INSERT INTO `folha_pagamento` VALUES (1,2,'202312',1,2),(2,2,'202402',1,1),(3,2,'202411',2,2),(4,2,'202412',3,2);
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
INSERT INTO `folha_pagamento_evento` VALUES (1,1,'Salário','V',72,100.0000),(2,2,'Adiantamento de salário','D',2,0.0000),(3,3,'13º salário','V',1,100.0000),(4,4,'Adiantamento do 13º salário','V',3,0.0000),(5,5,'Pagamento de férias','V',36,100.0000),(6,6,'1/3 das férias','V',36,33.3333),(7,7,'Hora extra 50%','V',38,150.0000),(8,8,'Hora extra 100%','V',38,200.0000),(9,9,'Desconto de faltas','D',22,0.0000),(10,10,'Comissão','V',8,0.0000),(11,11,'Plano de saúde ','D',24,0.0000),(12,12,'Vale Alimentação','V',25,100.0000),(13,13,'Descanso semanal remunerado (DSR)','V',20,0.0000),(14,14,'Adicional noturno, insalubridade e periculosidade','V',4,0.0000),(15,15,'Salário família','V',71,0.0000),(16,16,'IRRF  a recolher','D',44,0.0000),(17,17,'Vale transporte','D',26,0.0000),(18,18,'INSS','D',23,0.0000),(19,19,'Contribuição sindical','D',21,0.0000),(20,NULL,'Desconto INSS','D',11,0.0000),(21,NULL,'Contribuição AMAVI (excluído)','V',11,0.0000);
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
INSERT INTO `folha_pagamento_evento_empresa` VALUES (1,1,1,0),(1,2,1,0),(2,1,1,0),(2,2,1,0),(3,1,1,0),(3,2,1,0),(4,1,1,0),(4,2,1,0),(5,1,1,0),(5,2,1,0),(6,1,1,0),(6,2,1,0),(7,1,1,0),(7,2,1,0),(8,1,1,0),(8,2,1,0),(9,1,1,0),(9,2,1,0),(10,1,1,0),(10,2,1,0),(11,1,1,0),(11,2,1,0),(12,1,1,0),(12,2,1,0),(13,1,1,0),(13,2,1,0),(14,1,1,0),(14,2,1,0),(15,1,1,0),(15,2,1,0),(16,1,1,0),(16,2,1,0),(17,1,1,0),(17,2,1,0),(18,1,1,0),(18,2,1,0),(19,1,1,0),(19,2,1,0),(20,1,1,0),(20,2,1,0),(21,1,0,1);
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
INSERT INTO `folha_pagamento_lancamento` VALUES (1,1,38,10,2,1,1,8,'Comissão','2024-01-12','0001-01-01','2024-01-12',300.00,'V',NULL,1,1,0),(2,1,38,1,2,1,1,72,'Salário','2024-01-12','0001-01-01','2024-01-12',900.00,'V',NULL,1,1,0),(3,1,38,11,3,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','2024-01-12',900.00,'D',2,1,1,0),(4,1,18,1,1,1,1,72,'Salário Banco do Brasil (alterado)','2024-01-12','0001-01-01','0001-01-01',1120.00,'V',NULL,1,0,0),(5,1,18,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',880.00,'V',NULL,1,0,0),(6,1,18,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',20.00,'D',4,1,0,0),(7,1,19,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(8,1,19,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(9,1,19,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',7,1,0,0),(10,1,20,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(11,1,20,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(12,1,20,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',10,1,0,0),(13,1,21,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(14,1,21,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(15,1,21,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',13,1,0,0),(16,1,22,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(17,1,22,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(18,1,22,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',16,1,0,0),(19,1,23,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(20,1,23,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(21,1,23,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',19,1,0,0),(22,1,24,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(23,1,24,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(24,1,24,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',22,1,0,0),(25,1,25,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(26,1,25,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(27,1,25,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',25,1,0,0),(28,1,26,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(29,1,26,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(30,1,26,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',28,1,0,0),(31,1,27,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(32,1,27,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(33,1,27,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',31,1,0,0),(34,1,28,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(35,1,28,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(36,1,28,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',34,1,0,0),(37,1,29,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(38,1,29,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(39,1,29,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',37,1,0,0),(40,1,30,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(41,1,30,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(42,1,30,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',40,1,0,0),(43,1,31,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(44,1,31,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(45,1,31,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',43,1,0,0),(46,1,32,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(47,1,32,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(48,1,32,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',46,1,0,0),(49,1,33,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(50,1,33,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(51,1,33,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',49,1,0,0),(52,1,34,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1680.00,'V',NULL,1,0,0),(53,1,34,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1320.00,'V',NULL,1,0,0),(54,1,34,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',52,1,0,0),(55,1,35,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(56,1,35,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(57,1,35,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',55,1,0,0),(58,1,36,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(59,1,36,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(60,1,36,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',58,1,0,0),(61,1,37,1,1,1,1,72,'Salário Banco do Brasil','2024-01-12','0001-01-01','0001-01-01',1344.00,'V',NULL,1,0,0),(62,1,37,1,2,1,1,72,'Salário LagoaCred','2024-01-12','0001-01-01','0001-01-01',1056.00,'V',NULL,1,0,0),(63,1,37,11,1,1,1,24,'Desconto INSS','2024-01-12','0001-01-01','0001-01-01',30.00,'D',61,1,0,0),(64,1,18,1,1,1,NULL,72,'Salário teste','2024-01-12','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(65,2,18,1,1,1,NULL,72,'Salário teste 2','2024-01-12','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,0),(66,1,18,2,1,1,1,2,'Adiantamento de salário teste 1 (alterado)','2024-01-12','0001-01-01','0001-01-01',100.00,'D',64,0,0,0),(67,2,18,2,1,1,1,2,'Adiantamento de salário teste 2','2024-01-12','0001-01-01','0001-01-01',40.00,'D',NULL,0,0,1),(68,3,18,4,1,1,1,3,'Adiantamento do 13º salário','2024-01-12','0001-01-01','0001-01-01',1000.00,'V',65,0,0,0),(69,4,18,3,1,1,1,1,'13º salário','2024-01-12','0001-01-01','0001-01-01',2000.00,'V',NULL,0,0,0),(70,4,18,2,1,1,1,2,'Adiantamento do 13º salário','2024-01-12','0001-01-01','0001-01-01',1000.00,'D',69,0,0,0),(71,2,18,1,1,1,1,72,'ZZSalário pago (excluído)','2024-01-12','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(72,2,18,1,1,1,1,72,'ZZSalário (excluído)','2024-01-12','0001-01-01','0001-01-01',5000.00,'V',NULL,0,0,1),(73,2,18,1,1,1,1,72,'ZZAditantamento Salário pago (excluído)','2024-01-12','0001-01-01','2024-01-12',50.00,'V',72,0,1,0),(74,1,38,1,1,1,1,72,'Salário CEF 7','2024-01-12','2024-02-12','2024-01-12',1000.00,'V',NULL,0,1,0),(75,1,38,10,1,1,NULL,8,'Comissão 7','2024-01-12','0001-01-01','2024-01-12',500.00,'V',NULL,0,1,0),(76,1,38,1,1,1,1,72,'Salário CEF 1','2024-01-12','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(77,1,38,1,1,1,1,72,'Salário CEF 2','2024-01-12','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(78,1,38,2,1,1,1,2,'Vale - 2','2024-01-12','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(79,1,38,1,1,1,1,72,'Salário CEF 3','2024-01-12','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(80,1,38,2,1,1,1,2,'Vale 3','2024-01-12','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(81,1,38,1,1,1,1,72,'Salário CEF 4','2024-01-12','0001-01-01','0001-01-01',1000.00,'V',NULL,0,0,1),(82,1,38,2,1,1,1,2,'Vale - 4','2024-01-12','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(83,1,38,1,1,1,1,72,'Salário CEF 5','2024-01-12','2024-02-12','0001-01-01',1000.00,'V',NULL,0,0,1),(84,1,38,2,1,1,1,2,'Vale - 5','2024-01-12','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(85,1,38,1,1,1,1,72,'Salário CEF 6','2024-01-12','2024-02-12','0001-01-01',1000.00,'V',NULL,0,0,1),(86,1,38,10,1,1,NULL,8,'Comissão 6','2024-01-12','0001-01-01','0001-01-01',500.00,'V',NULL,0,0,1),(87,1,38,2,1,1,1,2,'Vale - 6','2024-01-12','0001-01-01','0001-01-01',700.00,'D',NULL,0,0,1),(88,1,39,1,1,1,1,72,'Salário CEF','2024-01-12','0001-01-01','0001-01-01',800.00,'V',NULL,0,0,0),(89,1,39,2,1,1,1,2,'Vale','2024-01-12','0001-01-01','0001-01-01',600.00,'D',NULL,0,0,1),(90,1,39,2,1,1,1,2,'Vale 2','2024-01-12','0001-01-01','0001-01-01',400.00,'D',88,0,0,0),(91,1,39,2,1,1,1,2,'Vale 2','2024-01-12','0001-01-01','0001-01-01',200.00,'D',88,0,0,0),(92,1,38,1,1,1,1,72,'Salário CEF 7','2024-01-12','2024-02-12','2024-01-12',1000.00,'V',NULL,0,1,0),(93,1,38,10,1,1,NULL,8,'Comissão 7','2024-01-12','0001-01-01','2024-01-12',500.00,'V',NULL,0,1,0);
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
INSERT INTO `folha_pagamento_lancamento_conta_contabil` VALUES (1,5,3,100.0000,1),(1,40,1,100.0000,1),(1,40,4,100.0000,2),(1,153,1,100.0000,2),(1,167,1,100.0000,1),(2,5,3,100.0000,1),(2,40,1,100.0000,1),(2,40,4,100.0000,2),(2,144,1,100.0000,2),(2,159,1,100.0000,1),(3,5,2,100.0000,1),(3,40,1,100.0000,2),(3,40,4,100.0000,1),(3,152,4,100.0000,2),(4,5,3,100.0000,1),(4,40,1,100.0000,1),(4,40,4,100.0000,2),(4,144,1,100.0000,2),(4,159,1,100.0000,1),(5,5,3,100.0000,1),(5,40,1,100.0000,1),(5,40,4,100.0000,2),(5,144,1,100.0000,2),(5,159,1,100.0000,1),(6,5,2,100.0000,1),(6,40,1,100.0000,2),(6,40,4,100.0000,1),(6,152,4,100.0000,2),(7,5,3,100.0000,1),(7,40,1,100.0000,1),(7,40,4,100.0000,2),(7,144,1,100.0000,2),(7,159,1,100.0000,1),(8,5,3,100.0000,1),(8,40,1,100.0000,1),(8,40,4,100.0000,2),(8,144,1,100.0000,2),(8,159,1,100.0000,1),(9,5,2,100.0000,1),(9,40,1,100.0000,2),(9,40,4,100.0000,1),(9,152,4,100.0000,2),(10,5,3,100.0000,1),(10,40,1,100.0000,1),(10,40,4,100.0000,2),(10,144,1,100.0000,2),(10,159,1,100.0000,1),(11,5,3,100.0000,1),(11,40,1,100.0000,1),(11,40,4,100.0000,2),(11,144,1,100.0000,2),(11,159,1,100.0000,1),(12,5,2,100.0000,1),(12,40,1,100.0000,2),(12,40,4,100.0000,1),(12,152,4,100.0000,2),(13,5,3,100.0000,1),(13,40,1,100.0000,1),(13,40,4,100.0000,2),(13,144,1,100.0000,2),(13,159,1,100.0000,1),(14,5,3,100.0000,1),(14,40,1,100.0000,1),(14,40,4,100.0000,2),(14,144,1,100.0000,2),(14,159,1,100.0000,1),(15,5,2,100.0000,1),(15,40,1,100.0000,2),(15,40,4,100.0000,1),(15,152,4,100.0000,2),(16,5,3,100.0000,1),(16,40,1,100.0000,1),(16,40,4,100.0000,2),(16,144,1,100.0000,2),(16,159,1,100.0000,1),(17,5,3,100.0000,1),(17,40,1,100.0000,1),(17,40,4,100.0000,2),(17,144,1,100.0000,2),(17,159,1,100.0000,1),(18,5,2,100.0000,1),(18,40,1,100.0000,2),(18,40,4,100.0000,1),(18,152,4,100.0000,2),(19,5,3,100.0000,1),(19,40,1,100.0000,1),(19,40,4,100.0000,2),(19,144,1,100.0000,2),(19,159,1,100.0000,1),(20,5,3,100.0000,1),(20,40,1,100.0000,1),(20,40,4,100.0000,2),(20,144,1,100.0000,2),(20,159,1,100.0000,1),(21,5,2,100.0000,1),(21,40,1,100.0000,2),(21,40,4,100.0000,1),(21,152,4,100.0000,2),(22,5,3,100.0000,1),(22,40,1,100.0000,1),(22,40,4,100.0000,2),(22,144,1,100.0000,2),(22,159,1,100.0000,1),(23,5,3,100.0000,1),(23,40,1,100.0000,1),(23,40,4,100.0000,2),(23,144,1,100.0000,2),(23,159,1,100.0000,1),(24,5,2,100.0000,1),(24,40,1,100.0000,2),(24,40,4,100.0000,1),(24,152,4,100.0000,2),(25,5,3,100.0000,1),(25,40,1,100.0000,1),(25,40,4,100.0000,2),(25,144,1,100.0000,2),(25,159,1,100.0000,1),(26,5,3,100.0000,1),(26,40,1,100.0000,1),(26,40,4,100.0000,2),(26,144,1,100.0000,2),(26,159,1,100.0000,1),(27,5,2,100.0000,1),(27,40,1,100.0000,2),(27,40,4,100.0000,1),(27,152,4,100.0000,2),(28,5,3,100.0000,1),(28,40,1,100.0000,1),(28,40,4,100.0000,2),(28,144,1,100.0000,2),(28,159,1,100.0000,1),(29,5,3,100.0000,1),(29,40,1,100.0000,1),(29,40,4,100.0000,2),(29,144,1,100.0000,2),(29,159,1,100.0000,1),(30,5,2,100.0000,1),(30,40,1,100.0000,2),(30,40,4,100.0000,1),(30,152,4,100.0000,2),(31,5,3,100.0000,1),(31,40,1,100.0000,1),(31,40,4,100.0000,2),(31,144,1,100.0000,2),(31,159,1,100.0000,1),(32,5,3,100.0000,1),(32,40,1,100.0000,1),(32,40,4,100.0000,2),(32,144,1,100.0000,2),(32,159,1,100.0000,1),(33,5,2,100.0000,1),(33,40,1,100.0000,2),(33,40,4,100.0000,1),(33,152,4,100.0000,2),(34,5,3,100.0000,1),(34,40,1,100.0000,1),(34,40,4,100.0000,2),(34,144,1,100.0000,2),(34,159,1,100.0000,1),(35,5,3,100.0000,1),(35,40,1,100.0000,1),(35,40,4,100.0000,2),(35,144,1,100.0000,2),(35,159,1,100.0000,1),(36,5,2,100.0000,1),(36,40,1,100.0000,2),(36,40,4,100.0000,1),(36,152,4,100.0000,2),(37,5,3,100.0000,1),(37,40,1,100.0000,1),(37,40,4,100.0000,2),(37,144,1,100.0000,2),(37,159,1,100.0000,1),(38,5,3,100.0000,1),(38,40,1,100.0000,1),(38,40,4,100.0000,2),(38,144,1,100.0000,2),(38,159,1,100.0000,1),(39,5,2,100.0000,1),(39,40,1,100.0000,2),(39,40,4,100.0000,1),(39,152,4,100.0000,2),(40,5,3,100.0000,1),(40,40,1,100.0000,1),(40,40,4,100.0000,2),(40,144,1,100.0000,2),(40,159,1,100.0000,1),(41,5,3,100.0000,1),(41,40,1,100.0000,1),(41,40,4,100.0000,2),(41,144,1,100.0000,2),(41,159,1,100.0000,1),(42,5,2,100.0000,1),(42,40,1,100.0000,2),(42,40,4,100.0000,1),(42,152,4,100.0000,2),(43,5,3,100.0000,1),(43,40,1,100.0000,1),(43,40,4,100.0000,2),(43,144,1,100.0000,2),(43,159,1,100.0000,1),(44,5,3,100.0000,1),(44,40,1,100.0000,1),(44,40,4,100.0000,2),(44,144,1,100.0000,2),(44,159,1,100.0000,1),(45,5,2,100.0000,1),(45,40,1,100.0000,2),(45,40,4,100.0000,1),(45,152,4,100.0000,2),(46,5,3,100.0000,1),(46,40,1,100.0000,1),(46,40,4,100.0000,2),(46,144,1,100.0000,2),(46,159,1,100.0000,1),(47,5,3,100.0000,1),(47,40,1,100.0000,1),(47,40,4,100.0000,2),(47,144,1,100.0000,2),(47,159,1,100.0000,1),(48,5,2,100.0000,1),(48,40,1,100.0000,2),(48,40,4,100.0000,1),(48,152,4,100.0000,2),(49,5,3,100.0000,1),(49,40,1,100.0000,1),(49,40,4,100.0000,2),(49,144,1,100.0000,2),(49,159,1,100.0000,1),(50,5,3,100.0000,1),(50,40,1,100.0000,1),(50,40,4,100.0000,2),(50,144,1,100.0000,2),(50,159,1,100.0000,1),(51,5,2,100.0000,1),(51,40,1,100.0000,2),(51,40,4,100.0000,1),(51,152,4,100.0000,2),(52,5,3,100.0000,1),(52,40,1,100.0000,1),(52,40,4,100.0000,2),(52,144,1,100.0000,2),(52,159,1,100.0000,1),(53,5,3,100.0000,1),(53,40,1,100.0000,1),(53,40,4,100.0000,2),(53,144,1,100.0000,2),(53,159,1,100.0000,1),(54,5,2,100.0000,1),(54,40,1,100.0000,2),(54,40,4,100.0000,1),(54,152,4,100.0000,2),(55,5,3,100.0000,1),(55,40,1,100.0000,1),(55,40,4,100.0000,2),(55,144,1,100.0000,2),(55,159,1,100.0000,1),(56,5,3,100.0000,1),(56,40,1,100.0000,1),(56,40,4,100.0000,2),(56,144,1,100.0000,2),(56,159,1,100.0000,1),(57,5,2,100.0000,1),(57,40,1,100.0000,2),(57,40,4,100.0000,1),(57,152,4,100.0000,2),(58,5,3,100.0000,1),(58,40,1,100.0000,1),(58,40,4,100.0000,2),(58,144,1,100.0000,2),(58,159,1,100.0000,1),(59,5,3,100.0000,1),(59,40,1,100.0000,1),(59,40,4,100.0000,2),(59,144,1,100.0000,2),(59,159,1,100.0000,1),(60,5,2,100.0000,1),(60,40,1,100.0000,2),(60,40,4,100.0000,1),(60,152,4,100.0000,2),(61,5,3,100.0000,1),(61,40,1,100.0000,1),(61,40,4,100.0000,2),(61,144,1,100.0000,2),(61,159,1,100.0000,1),(62,5,3,100.0000,1),(62,40,1,100.0000,1),(62,40,4,100.0000,2),(62,144,1,100.0000,2),(62,159,1,100.0000,1),(63,5,2,100.0000,1),(63,40,1,100.0000,2),(63,40,4,100.0000,1),(63,152,4,100.0000,2),(64,5,3,100.0000,1),(64,40,1,100.0000,1),(64,40,4,100.0000,2),(64,144,1,100.0000,2),(64,159,1,100.0000,1),(65,5,3,100.0000,1),(65,40,1,100.0000,1),(65,40,4,100.0000,2),(65,144,1,100.0000,2),(65,159,1,100.0000,1),(66,4,3,100.0000,2),(66,40,1,100.0000,2),(68,4,3,100.0000,2),(68,40,1,100.0000,2),(69,5,3,100.0000,1),(69,40,1,100.0000,1),(69,40,4,100.0000,2),(69,145,1,100.0000,2),(69,160,1,100.0000,1),(70,4,3,100.0000,2),(70,40,1,100.0000,2),(73,5,3,100.0000,1),(73,40,1,100.0000,1),(73,40,4,100.0000,2),(73,144,1,100.0000,2),(73,159,1,100.0000,1),(74,5,3,100.0000,1),(74,40,1,100.0000,1),(74,40,4,100.0000,2),(74,144,1,100.0000,2),(74,159,1,100.0000,1),(75,5,3,100.0000,1),(75,40,1,100.0000,1),(75,40,4,100.0000,2),(75,153,1,100.0000,2),(75,167,1,100.0000,1),(88,5,3,100.0000,1),(88,40,1,100.0000,1),(88,40,4,100.0000,2),(88,144,1,100.0000,2),(88,159,1,100.0000,1),(90,4,3,100.0000,2),(90,40,1,100.0000,2),(91,4,3,100.0000,2),(91,40,1,100.0000,2),(92,5,3,100.0000,1),(92,40,1,100.0000,1),(92,40,4,100.0000,2),(92,144,1,100.0000,2),(92,159,1,100.0000,1),(93,5,3,100.0000,1),(93,40,1,100.0000,1),(93,40,4,100.0000,2),(93,153,1,100.0000,2),(93,167,1,100.0000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,1,'Dinheiro',1,1,1,1,0,1,'2024-01-12 11:13:16'),(2,2,'Cheque',1,2,2,1,0,1,'2024-01-12 11:13:16'),(3,3,'Cartão',1,3,3,0,0,0,'2024-01-12 11:13:16'),(4,4,'Crediário',2,4,99,0,0,0,'2024-01-12 11:13:16'),(5,5,'Nota de crédito',1,5,99,0,0,1,'2024-01-12 11:13:16'),(6,6,'PIX',1,6,17,0,0,1,'2024-01-12 11:13:17'),(7,NULL,'Dinheiro (Alterado)',1,1,0,0,0,1,'2024-01-12 11:13:16'),(8,NULL,'Outros',9,99,0,0,0,0,'2024-01-12 11:13:17'),(9,NULL,'Cheque',9,2,0,0,0,1,'2024-01-12 11:13:04'),(10,NULL,'Cartão',9,3,0,0,0,1,'2024-01-12 11:13:04'),(11,NULL,'Teste exclusão',1,1,0,0,0,0,'2024-01-12 11:13:17');
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
INSERT INTO `igpm` VALUES ('012024',0.4000),('022023',0.7000),('032023',1.5200),('042023',0.8900),('052023',-0.4900),('062023',-1.0800),('072023',0.0100),('082023',0.8800),('092023',1.2600),('102023',0.9200),('112023',0.4500),('122023',0.8000);
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
INSERT INTO `ipca` VALUES ('012024',0.1900),('022023',-0.0900),('032023',0.4800),('042023',0.4500),('052023',-0.2100),('062023',0.1500),('072023',0.3200),('082023',0.4300),('092023',0.7500),('102023',0.5700),('112023',0.1300),('122023',0.0100);
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
) ENGINE=InnoDB AUTO_INCREMENT=1468 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
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
INSERT INTO `log_empresa` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2),(12,2),(13,2),(14,2),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(108,2),(109,1),(109,2),(110,1),(110,2),(111,1),(111,2),(112,1),(112,2),(113,1),(113,2),(114,1),(114,2),(115,1),(115,2),(116,1),(116,2),(117,1),(117,2),(118,1),(118,2),(119,1),(119,2),(120,1),(120,2),(121,1),(121,2),(122,1),(122,2),(123,1),(123,2),(124,1),(124,2),(125,1),(125,2),(126,1),(126,2),(127,1),(127,2),(128,1),(128,2),(129,1),(129,2),(130,1),(130,2),(131,1),(131,2),(132,1),(132,2),(133,1),(133,2),(134,1),(134,2),(135,1),(135,2),(136,1),(136,2),(137,1),(137,2),(138,1),(138,2),(139,1),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,2),(181,2),(182,2),(183,2),(184,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(220,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,2),(239,2),(240,2),(241,2),(242,2),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,2),(272,2),(273,2),(274,2),(275,2),(276,1),(276,2),(277,1),(277,2),(278,1),(278,2),(279,1),(279,2),(280,1),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,1),(286,2),(287,1),(287,2),(288,1),(288,2),(289,1),(289,2),(290,1),(290,2),(291,1),(291,2),(292,1),(292,2),(293,1),(293,2),(294,1),(294,2),(295,2),(296,2),(297,2),(298,1),(299,1),(300,1),(301,1),(302,1),(303,1),(304,1),(305,1),(306,1),(307,1),(308,1),(309,1),(310,1),(311,1),(312,1),(313,1),(314,1),(315,2),(316,1),(317,1),(318,1),(319,1),(320,1),(321,1),(322,1),(323,1),(324,1),(325,1),(326,1),(327,1),(328,1),(329,1),(330,1),(331,1),(332,1),(333,1),(334,1),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,1),(346,1),(347,1),(348,1),(349,1),(350,1),(351,1),(352,1),(353,1),(354,1),(355,1),(356,1),(357,1),(358,1),(359,1),(360,1),(361,1),(362,1),(363,1),(364,1),(365,1),(366,1),(367,1),(368,1),(369,1),(370,1),(371,2),(372,1),(373,1),(374,1),(375,1),(376,1),(377,1),(378,1),(379,1),(380,1),(391,1),(393,1),(394,1),(395,1),(396,1),(397,1),(398,1),(399,1),(400,1),(401,1),(402,2),(403,2),(404,2),(405,1),(406,2),(407,2),(408,2),(409,2),(410,2),(411,2),(412,2),(413,2),(414,2),(415,2),(416,2),(417,2),(418,2),(419,2),(420,2),(421,2),(422,2),(423,2),(424,2),(425,2),(426,2),(427,2),(428,2),(429,2),(430,2),(431,2),(432,2),(433,2),(434,2),(435,2),(436,2),(437,2),(438,2),(439,2),(440,2),(441,2),(442,2),(443,2),(444,2),(445,2),(446,2),(447,2),(448,2),(449,2),(450,2),(451,2),(452,2),(453,2),(454,2),(455,2),(456,2),(457,2),(458,2),(459,2),(460,2),(461,2),(462,2),(463,2),(464,2),(465,2),(466,2),(467,2),(468,2),(469,2),(470,2),(471,2),(472,2),(473,2),(474,2),(475,2),(476,2),(477,2),(478,2),(479,2),(480,2),(481,2),(482,2),(483,2),(484,2),(485,2),(486,2),(487,2),(488,2),(489,2),(490,2),(491,2),(492,2),(493,2),(494,2),(495,2),(496,2),(497,2),(498,2),(499,2),(500,2),(501,2),(502,2),(503,2),(504,2),(505,2),(506,2),(507,2),(508,2),(509,2),(510,2),(511,2),(512,2),(513,2),(514,2),(515,2),(516,2),(517,2),(518,2),(519,2),(520,2),(521,2),(522,2),(523,2),(524,2),(525,2),(526,2),(527,2),(528,2),(529,2),(530,2),(531,2),(532,2),(533,2),(534,2),(535,2),(536,2),(537,2),(538,2),(539,2),(540,2),(541,2),(542,2),(543,2),(544,2),(545,2),(546,2),(547,2),(548,2),(549,2),(550,2),(551,2),(552,2),(553,2),(554,2),(555,2),(556,2),(557,2),(558,2),(559,2),(560,2),(561,2),(562,2),(563,2),(564,2),(565,2),(566,2),(567,2),(568,2),(569,2),(570,2),(571,2),(572,2),(573,2),(574,2),(575,2),(576,2),(577,2),(578,2),(579,2),(580,2),(581,2),(582,2),(583,1),(584,1),(585,2),(586,2),(587,2),(588,2),(589,2),(590,2),(591,2),(592,2),(593,2),(594,2),(595,2),(596,2),(597,2),(598,2),(599,2),(600,2),(601,2),(602,2),(603,2),(604,2),(605,2),(606,2),(607,2),(608,2),(609,2),(610,1),(611,1),(612,2),(613,2),(614,2),(615,2),(616,2),(617,2),(618,2),(619,2),(620,1),(620,2),(621,1),(621,2),(622,2),(623,2),(624,2),(625,1),(625,2),(626,1),(626,2),(627,1),(627,2),(628,1),(629,1),(630,1),(631,1),(632,1),(633,1),(634,1),(635,1),(636,1),(637,1),(638,1),(638,2),(639,2),(640,2),(641,2),(642,2),(643,1),(644,2),(645,1),(646,1),(647,1),(648,1),(649,1),(650,1),(651,2),(652,2),(653,1),(654,1),(655,1),(656,2),(657,2),(658,2),(659,2),(660,1),(661,1),(662,1),(663,2),(664,2),(665,2),(666,2),(667,1),(668,1),(669,1),(670,2),(671,2),(672,2),(673,2),(674,1),(675,1),(676,1),(677,2),(678,2),(679,2),(680,2),(681,1),(682,1),(683,1),(684,2),(685,2),(686,2),(687,2),(688,1),(689,1),(690,1),(691,2),(692,2),(693,2),(694,2),(695,1),(696,1),(697,1),(698,2),(699,2),(700,2),(701,2),(702,1),(703,1),(704,1),(705,2),(706,2),(707,2),(708,2),(709,1),(710,1),(711,1),(712,2),(713,2),(714,2),(715,2),(716,1),(717,1),(718,1),(719,2),(720,2),(721,2),(722,2),(723,1),(724,1),(725,1),(726,2),(727,2),(728,2),(729,2),(730,1),(731,1),(732,1),(733,2),(734,2),(735,2),(736,2),(737,1),(738,1),(739,1),(740,2),(741,2),(742,2),(743,2),(744,1),(745,1),(746,1),(747,2),(748,2),(749,2),(750,2),(751,1),(752,1),(753,1),(754,2),(755,2),(756,2),(757,2),(758,1),(759,1),(760,1),(761,2),(762,2),(763,2),(764,2),(765,1),(766,1),(767,1),(768,2),(769,2),(770,2),(771,2),(772,1),(773,1),(774,1),(775,2),(776,2),(777,2),(778,2),(779,1),(780,1),(781,1),(782,2),(783,2),(784,2),(785,2),(786,1),(787,1),(788,1),(789,1),(790,2),(791,2),(792,2),(793,2),(794,2),(795,1),(796,1),(797,2),(798,1),(799,2),(800,2),(801,2),(802,2),(803,2),(804,2),(805,2),(806,2),(807,2),(808,2),(809,2),(810,2),(811,2),(812,2),(813,2),(814,2),(815,2),(816,2),(817,2),(818,2),(819,2),(820,2),(821,2),(822,2),(823,2),(824,2),(825,2),(826,2),(827,2),(828,2),(829,2),(830,2),(831,2),(832,2),(833,2),(834,2),(835,2),(836,2),(837,2),(838,2),(839,2),(840,2),(841,2),(842,2),(843,2),(844,2),(845,2),(846,2),(847,2),(848,2),(849,2),(850,2),(851,2),(852,2),(853,2),(854,2),(855,2),(856,2),(857,2),(858,2),(859,2),(860,2),(861,2),(862,2),(863,2),(864,2),(865,2),(866,2),(867,2),(868,2),(869,2),(870,2),(871,2),(872,2),(873,2),(874,2),(875,2),(876,2),(877,2),(878,2),(879,2),(880,2),(881,2),(882,2),(883,2),(884,2),(885,2),(886,2),(887,2),(888,2),(889,2),(890,2),(891,2),(892,2),(893,2),(894,2),(895,2),(896,2),(897,2),(898,2),(899,2),(900,2),(901,2),(902,2),(903,2),(904,2),(905,2),(906,2),(907,2),(908,2),(909,2),(910,2),(911,2),(912,2),(913,2),(914,2),(915,2),(916,2),(917,2),(918,2),(919,2),(920,2),(921,2),(922,2),(923,2),(924,2),(925,2),(926,2),(927,2),(928,2),(929,2),(930,2),(931,2),(932,2),(933,2),(934,1),(935,2),(936,2),(937,2),(938,2),(939,2),(940,1),(941,1),(942,1),(943,2),(944,2),(945,2),(946,2),(947,2),(948,2),(949,2),(950,2),(951,2),(952,2),(953,2),(954,2),(955,2),(956,2),(957,2),(958,2),(959,2),(960,2),(961,2),(962,2),(963,2),(964,2),(965,2),(966,2),(967,2),(968,2),(969,2),(970,2),(971,2),(972,2),(973,2),(974,2),(975,2),(976,2),(977,2),(978,2),(979,2),(980,2),(981,2),(982,2),(983,2),(984,2),(985,2),(986,2),(987,2),(988,2),(989,2),(990,2),(991,2),(992,2),(993,2),(994,2),(995,2),(996,2),(997,2),(998,2),(999,2),(1000,2),(1001,2),(1002,2),(1003,2),(1004,2),(1005,2),(1006,2),(1007,2),(1008,2),(1009,2),(1010,2),(1011,2),(1012,2),(1013,2),(1014,2),(1015,2),(1016,2),(1017,2),(1018,2),(1019,2),(1020,2),(1021,2),(1022,2),(1023,2),(1024,2),(1025,2),(1026,2),(1027,2),(1028,2),(1029,2),(1030,2),(1031,2),(1032,2),(1033,2),(1034,2),(1035,2),(1036,2),(1037,2),(1038,2),(1039,2),(1040,2),(1041,2),(1042,2),(1043,2),(1047,2),(1048,2),(1049,2),(1050,2),(1051,2),(1052,2),(1053,2),(1054,2),(1055,2),(1056,2),(1057,2),(1058,2),(1059,2),(1060,2),(1061,2),(1062,2),(1063,2),(1064,2),(1065,2),(1066,2),(1067,2),(1068,2),(1069,2),(1070,2),(1071,2),(1072,2),(1073,2),(1074,2),(1075,2),(1076,2),(1077,2),(1078,2),(1079,2),(1080,2),(1081,2),(1082,2),(1083,2),(1084,2),(1085,2),(1086,2),(1087,2),(1088,2),(1089,2),(1090,2),(1091,2),(1092,2),(1093,2),(1094,2),(1095,1),(1096,1),(1097,1),(1098,1),(1099,1),(1100,1),(1101,1),(1102,1),(1103,1),(1104,1),(1105,1),(1106,1),(1107,1),(1108,1),(1109,1),(1110,1),(1111,1),(1112,1),(1113,1),(1114,1),(1115,1),(1116,1),(1117,1),(1118,1),(1119,1),(1120,1),(1121,1),(1122,1),(1123,1),(1124,1),(1125,1),(1126,1),(1127,1),(1128,1),(1129,1),(1130,2),(1131,2),(1132,2),(1133,2),(1134,2),(1135,2),(1136,2),(1137,2),(1138,2),(1139,1),(1140,2),(1141,1),(1142,2),(1143,2),(1144,2),(1145,2),(1146,2),(1147,2),(1148,2),(1149,2),(1150,2),(1151,2),(1152,2),(1153,2),(1154,2),(1155,2),(1156,2),(1157,2),(1158,2),(1159,2),(1160,2),(1161,2),(1162,2),(1163,2),(1164,2),(1165,2),(1166,2),(1167,2),(1168,2),(1169,2),(1170,2),(1171,2),(1172,2),(1173,2),(1174,2),(1175,2),(1176,2),(1177,2),(1178,2),(1179,2),(1180,2),(1181,2),(1182,2),(1183,2),(1184,2),(1185,2),(1186,2),(1187,2),(1188,2),(1189,2),(1190,2),(1191,2),(1192,2),(1193,2),(1194,2),(1195,2),(1196,2),(1197,2),(1198,2),(1199,2),(1200,2),(1201,2),(1202,2),(1203,2),(1204,2),(1205,2),(1206,2),(1207,2),(1208,2),(1209,2),(1210,2),(1211,2),(1212,2),(1213,2),(1214,2),(1215,2),(1216,2),(1217,2),(1218,2),(1219,2),(1220,2),(1221,2),(1222,2),(1223,2),(1224,2),(1225,2),(1226,2),(1227,2),(1228,2),(1229,2),(1230,2),(1231,2),(1232,2),(1233,2),(1234,2),(1235,2),(1236,2),(1237,2),(1238,2),(1239,2),(1240,2),(1241,2),(1242,2),(1243,2),(1244,2),(1245,2),(1246,2),(1247,2),(1248,2),(1249,2),(1250,2),(1251,2),(1252,2),(1253,2),(1254,2),(1255,2),(1256,2),(1257,1),(1258,2),(1259,2),(1260,2),(1261,2),(1262,2),(1263,2),(1264,2),(1265,2),(1266,2),(1267,2),(1268,2),(1269,2),(1270,2),(1271,2),(1272,2),(1273,1),(1274,1),(1275,1),(1276,1),(1277,1),(1278,2),(1279,1),(1280,1),(1281,1),(1282,1),(1283,1),(1284,1),(1285,1),(1286,2),(1287,1),(1288,1),(1289,1),(1290,1),(1291,1),(1292,2),(1293,1),(1294,1),(1295,1),(1296,1),(1297,1),(1298,1),(1299,1),(1300,1),(1301,1),(1302,1),(1303,1),(1304,1),(1305,1),(1306,1),(1307,2),(1308,2),(1310,1),(1311,1),(1312,1),(1313,1),(1314,1),(1315,1),(1316,1),(1317,1),(1318,1),(1319,1),(1320,1),(1321,1),(1322,1),(1323,1),(1324,1),(1325,1),(1326,1),(1327,1),(1328,1),(1329,1),(1330,1),(1331,1),(1332,1),(1333,1),(1334,1),(1335,1),(1336,1),(1337,1),(1338,1),(1339,1),(1340,1),(1341,1),(1342,1),(1343,1),(1344,1),(1345,1),(1346,1),(1347,1),(1348,1),(1349,1),(1350,1),(1351,1),(1352,1),(1353,1),(1354,1),(1355,1),(1356,1),(1357,1),(1358,1),(1359,1),(1360,1),(1361,1),(1362,1),(1363,1),(1364,1),(1365,1),(1366,1),(1367,1),(1368,2),(1369,1),(1370,1),(1371,1),(1372,1),(1373,1),(1374,2),(1375,2),(1376,2),(1377,2),(1378,1),(1379,1),(1380,1),(1381,1),(1382,1),(1383,1),(1384,1),(1385,1),(1386,1),(1387,2),(1388,2),(1389,2),(1390,2),(1391,2),(1392,2),(1393,2),(1394,2),(1395,2),(1396,2),(1397,2),(1398,2),(1399,2),(1400,2),(1401,2),(1402,2),(1403,2),(1404,2),(1405,2),(1406,2),(1407,2),(1408,2),(1409,2),(1410,2),(1411,2),(1412,2),(1413,2),(1414,2),(1415,2),(1416,2),(1417,2),(1418,2),(1419,2),(1420,2),(1421,2),(1422,2),(1423,2),(1424,2),(1425,2),(1426,2),(1427,2),(1428,2),(1429,2),(1430,2),(1431,2),(1432,2),(1433,2),(1434,2),(1435,2),(1436,2),(1437,2),(1438,2),(1439,2),(1440,2),(1441,2),(1442,2),(1443,2),(1444,2),(1445,2),(1446,2),(1447,2),(1448,2),(1449,2),(1450,2),(1451,2),(1452,2),(1453,2),(1454,2),(1455,1),(1456,1),(1457,1),(1458,1),(1459,1),(1460,1),(1461,1),(1462,2),(1463,2),(1464,2),(1465,2),(1466,2),(1467,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,300.00,'D',2,0,0),(2,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,900.00,'D',2,0,0),(3,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,900.00,'C',2,0,0),(4,2,1,NULL,'Salário Banco do Brasil (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,1120.00,'D',2,0,0),(5,2,2,NULL,'Salário LagoaCred (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,880.00,'D',2,0,0),(6,2,1,NULL,'Desconto INSS (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,20.00,'C',2,0,0),(7,2,1,NULL,'Salário Banco do Brasil (Trabalhador 01, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(8,2,2,NULL,'Salário LagoaCred (Trabalhador 01, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(9,2,1,NULL,'Desconto INSS (Trabalhador 01, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:10','2023-12-31 11:13:10',NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(10,2,1,NULL,'Salário Banco do Brasil (Trabalhador 02, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(11,2,2,NULL,'Salário LagoaCred (Trabalhador 02, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(12,2,1,NULL,'Desconto INSS (Trabalhador 02, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(13,2,1,NULL,'Salário Banco do Brasil (Trabalhador 03, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(14,2,2,NULL,'Salário LagoaCred (Trabalhador 03, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(15,2,1,NULL,'Desconto INSS (Trabalhador 03, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(16,2,1,NULL,'Salário Banco do Brasil (Trabalhador 04, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(17,2,2,NULL,'Salário LagoaCred (Trabalhador 04, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(18,2,1,NULL,'Desconto INSS (Trabalhador 04, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(19,2,1,NULL,'Salário Banco do Brasil (Trabalhador 05, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(20,2,2,NULL,'Salário LagoaCred (Trabalhador 05, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(21,2,1,NULL,'Desconto INSS (Trabalhador 05, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(22,2,1,NULL,'Salário Banco do Brasil (Trabalhador 06, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(23,2,2,NULL,'Salário LagoaCred (Trabalhador 06, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(24,2,1,NULL,'Desconto INSS (Trabalhador 06, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(25,2,1,NULL,'Salário Banco do Brasil (Trabalhador 07, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(26,2,2,NULL,'Salário LagoaCred (Trabalhador 07, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(27,2,1,NULL,'Desconto INSS (Trabalhador 07, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(28,2,1,NULL,'Salário Banco do Brasil (Trabalhador 08, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(29,2,2,NULL,'Salário LagoaCred (Trabalhador 08, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(30,2,1,NULL,'Desconto INSS (Trabalhador 08, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(31,2,1,NULL,'Salário Banco do Brasil (Trabalhador 09, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(32,2,2,NULL,'Salário LagoaCred (Trabalhador 09, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(33,2,1,NULL,'Desconto INSS (Trabalhador 09, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(34,2,1,NULL,'Salário Banco do Brasil (Trabalhador 10, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(35,2,2,NULL,'Salário LagoaCred (Trabalhador 10, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(36,2,1,NULL,'Desconto INSS (Trabalhador 10, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(37,2,1,NULL,'Salário Banco do Brasil (Trabalhador 11, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(38,2,2,NULL,'Salário LagoaCred (Trabalhador 11, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(39,2,1,NULL,'Desconto INSS (Trabalhador 11, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(40,2,1,NULL,'Salário Banco do Brasil (Trabalhador 12, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(41,2,2,NULL,'Salário LagoaCred (Trabalhador 12, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(42,2,1,NULL,'Desconto INSS (Trabalhador 12, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(43,2,1,NULL,'Salário Banco do Brasil (Trabalhador 13, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(44,2,2,NULL,'Salário LagoaCred (Trabalhador 13, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(45,2,1,NULL,'Desconto INSS (Trabalhador 13, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(46,2,1,NULL,'Salário Banco do Brasil (Trabalhador 14, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(47,2,2,NULL,'Salário LagoaCred (Trabalhador 14, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(48,2,1,NULL,'Desconto INSS (Trabalhador 14, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(49,2,1,NULL,'Salário Banco do Brasil (Trabalhador 15, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,49,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(50,2,2,NULL,'Salário LagoaCred (Trabalhador 15, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(51,2,1,NULL,'Desconto INSS (Trabalhador 15, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,51,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(52,2,1,NULL,'Salário Banco do Brasil (Trabalhador 16, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,NULL,NULL,1680.00,'D',2,0,0),(53,2,2,NULL,'Salário LagoaCred (Trabalhador 16, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,NULL,NULL,1320.00,'D',2,0,0),(54,2,1,NULL,'Desconto INSS (Trabalhador 16, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(55,2,1,NULL,'Salário Banco do Brasil (Trabalhador 17, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(56,2,2,NULL,'Salário LagoaCred (Trabalhador 17, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(57,2,1,NULL,'Desconto INSS (Trabalhador 17, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(58,2,1,NULL,'Salário Banco do Brasil (Trabalhador 18, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,58,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(59,2,2,NULL,'Salário LagoaCred (Trabalhador 18, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(60,2,1,NULL,'Desconto INSS (Trabalhador 18, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(61,2,1,NULL,'Salário Banco do Brasil (Trabalhador 19, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,1344.00,'D',2,0,0),(62,2,2,NULL,'Salário LagoaCred (Trabalhador 19, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,NULL,NULL,1056.00,'D',2,0,0),(63,2,1,NULL,'Desconto INSS (Trabalhador 19, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:11','2023-12-31 11:13:11',NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,NULL,NULL,30.00,'C',2,0,0),(64,2,1,NULL,'Salário teste (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,0),(65,2,1,NULL,'Salário teste 2 (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-02-29 11:13:12','2024-02-29 11:13:12',NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,0),(66,2,1,NULL,'Adiantamento de salário teste 1 (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,200.00,'D',2,0,1),(67,2,1,NULL,'Adiantamento de salário teste 2 (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-02-29 11:13:12','2024-02-29 11:13:12',NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,NULL,40.00,'D',2,0,1),(68,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Novembro/2024)','2024-11-30 11:13:12','2024-11-30 11:13:12',NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,0),(69,2,1,NULL,'13º salário (Joseph Climber, Folha de pagamento: Dezembro/2024)','2024-12-31 11:13:12','2024-12-31 11:13:12',NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,NULL,NULL,2000.00,'D',2,0,0),(70,2,1,NULL,'Adiantamento do 13º salário (Joseph Climber, Folha de pagamento: Dezembro/2024)','2024-12-31 11:13:12','2024-12-31 11:13:12',NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,0),(71,2,1,NULL,'Adiantamento de salário teste 1 (alterado) (Joseph Climber, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,NULL,NULL,100.00,'D',2,0,0),(72,2,1,NULL,'ZZSalário pago (excluído) (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-02-29 11:13:12','2024-02-29 11:13:12',NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,NULL,NULL,5000.00,'D',2,0,1),(73,2,1,NULL,'ZZSalário (excluído) (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-02-29 11:13:12','2024-02-29 11:13:12',NULL,NULL,NULL,NULL,72,NULL,NULL,NULL,NULL,NULL,5000.00,'D',2,0,1),(74,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-02-29 11:13:12','2024-02-29 11:13:12',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,50.00,'D',2,0,0),(75,2,1,NULL,'ZZAditantamento Salário pago (excluído) (Joseph Climber, Folha de pagamento: Fevereiro/2024)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,NULL,NULL,50.00,'D',1,0,0),(76,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,0),(77,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,0),(78,2,2,NULL,'Comissão (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,300.00,'D',1,0,0),(79,2,2,NULL,'Salário (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,900.00,'D',1,0,0),(80,2,3,NULL,'Desconto INSS (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,900.00,'C',1,0,0),(81,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,1000.00,'D',1,0,0),(82,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:12','2024-01-12 11:13:12',NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,500.00,'D',1,0,0),(83,2,1,NULL,'Salário CEF 1 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:12','2023-12-31 11:13:12',NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(84,2,1,NULL,'Salário CEF 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,77,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(85,2,1,NULL,'Vale - 2 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,1),(86,2,1,NULL,'Salário CEF 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,79,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(87,2,1,NULL,'Vale 3 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,1),(88,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(89,2,1,NULL,'Vale - 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,1),(90,2,1,NULL,'Salário CEF 4 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:13','2024-01-12 11:13:13',NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,NULL,NULL,300.00,'D',1,0,1),(91,2,1,NULL,'Salário CEF 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(92,2,1,NULL,'Vale - 5 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,1),(93,2,1,NULL,'Salário CEF 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(94,2,1,NULL,'Comissão 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,1),(95,2,1,NULL,'Vale - 6 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,NULL,NULL,700.00,'D',2,0,1),(96,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,1),(97,2,1,NULL,'Vale (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,600.00,'D',2,0,1),(98,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,NULL,400.00,'D',2,0,0),(99,2,1,NULL,'Vale 2 (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,NULL,NULL,200.00,'D',2,0,0),(100,2,1,NULL,'Salário CEF (Colaborador teste relação entre lançamentos 2, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,NULL,NULL,200.00,'D',2,0,0),(101,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,1000.00,'D',2,0,0),(102,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2023-12-31 11:13:13','2023-12-31 11:13:13',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,500.00,'D',2,0,0),(103,2,1,NULL,'Salário CEF 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:13','2024-01-12 11:13:13',NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,1000.00,'D',1,0,0),(104,2,1,NULL,'Comissão 7 (Colaborador teste relação entre lançamentos 1, Folha de pagamento: Dezembro/2023)','2024-01-12 11:13:13','2024-01-12 11:13:13',NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,500.00,'D',1,0,0),(105,2,1,NULL,'Documento à pagar: 0000000001','2024-01-12 11:13:39','2024-01-12 11:13:39',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,180.00,'D',2,0,1),(106,2,1,NULL,'Documento à pagar: 0000000002','2024-01-12 11:13:39','2024-01-12 11:13:39',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,181.25,'D',2,0,1),(107,2,1,NULL,'Documento à pagar: 0000000003','2024-01-12 11:13:39','2024-01-12 11:13:39',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,170.50,'D',2,0,0),(108,2,1,NULL,'Documento à pagar: 1ab','2024-01-12 11:13:40','2024-01-12 11:13:40',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,170.50,'D',2,0,0),(109,2,2,NULL,'Pagamento: 1ab - Femsa LTDA','2024-01-12 11:13:40','2024-01-12 11:13:40',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,170.25,'D',1,0,1),(110,2,2,NULL,'Pagamento: 0000000003 - Femsa LTDA','2024-01-12 11:13:40','2024-01-12 11:13:40',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80.00,'D',1,0,1),(111,2,1,NULL,'Documento à receber: 0000000001','2024-01-12 11:13:42','2024-01-12 11:13:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,180.00,'C',2,0,1),(112,2,1,NULL,'Documento à receber: 0000000002','2024-01-12 11:13:42','2024-01-12 11:13:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,181.25,'C',2,0,0),(113,2,1,NULL,'Documento à receber: 0000000003','2024-01-12 11:13:43','2024-01-12 11:13:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,170.50,'C',2,0,1),(114,2,1,NULL,'Documento à receber: 1ab','2024-01-12 11:13:44','2024-01-12 11:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,170.50,'C',2,0,0),(115,2,2,NULL,'Recebimento: 1ab - Jeff Bezos','2024-01-12 11:13:45','2024-01-12 11:13:45',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,170.25,'C',1,0,1),(116,2,2,NULL,'Recebimento: 0000000002 - Jeff Bezos','2024-01-12 11:13:45','2024-01-12 11:13:45',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,25.00,'C',1,0,1),(117,2,2,NULL,'Recebimento: 0000000002 - Jeff Bezos','2024-01-12 11:13:45','2024-01-12 11:13:45',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,37.32,'C',1,0,0),(118,2,2,NULL,'Despesas viagem','2024-01-12 11:14:28','2024-01-12 11:14:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',1,0,0),(119,2,2,NULL,'Movimento editável com alteração','2024-01-12 11:14:28','2024-01-12 11:14:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',1,0,0),(120,2,2,NULL,'Deposito bancário não identificado','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,1,0),(121,2,2,NULL,'Deposito bancário não identificado','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,1,0),(122,2,2,NULL,'Deposito bancário não identificado','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17.98,'D',1,1,0),(123,2,1,NULL,'Documento à pagar: 0000000004','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,190.67,'D',2,0,0),(124,2,1,NULL,'Documento à pagar: 0000000005','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,70.17,'D',2,0,0),(125,2,1,NULL,'Pagamento: 0000000004 - Femsa LTDA e outros pagamentos...','2024-01-12 11:14:29','2024-01-12 11:14:29',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,270.17,'D',1,0,1),(126,2,1,NULL,'Pagamento: 0000000005 - Femsa LTDA','2024-01-12 11:14:30','2024-01-12 11:14:29',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70.17,'D',1,0,1),(127,2,1,NULL,'Documento à receber: 0000000004','2024-01-12 11:14:30','2024-01-12 11:14:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,108.26,'C',2,0,0),(128,2,1,NULL,'Documento à receber: 0000000005','2024-01-12 11:14:30','2024-01-12 11:14:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,200.00,'C',2,0,0),(129,2,1,NULL,'Recebimento: 0000000004 - Jeff Bezos e outros recebimentos...','2024-01-12 11:14:30','2024-01-12 11:14:30',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,300.00,'C',1,0,1),(130,2,1,NULL,'Recebimento: 0000000005 - Jeff Bezos','2024-01-12 11:14:30','2024-01-12 00:00:00',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,200.00,'C',1,0,1),(131,2,1,NULL,'Documento à pagar: 0000000006','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,255.00,'D',2,0,0),(132,2,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',1,0,0),(133,2,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,120.00,'D',1,0,0),(134,2,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'D',1,0,0),(135,2,1,NULL,'Pagamento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'D',1,0,0),(136,2,1,NULL,'Documento à pagar: 0000000007','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,100.00,'D',2,0,0),(137,2,1,NULL,'Pagamento: 0000000007 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,115.00,'D',1,0,0),(138,2,1,NULL,'Documento à receber: 0000000006','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,255.00,'C',2,0,0),(139,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'C',1,0,0),(140,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,120.00,'C',1,0,0),(141,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,50.00,'C',1,0,0),(142,2,1,NULL,'Recebimento: 0000000006 - Jeff Bezos','2024-01-12 11:14:33','2024-01-12 11:14:33',NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(143,2,1,NULL,'Documento à receber: 0000000007','2024-01-12 11:14:34','2024-01-12 11:14:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,100.00,'C',2,0,0),(144,2,1,NULL,'Recebimento: 0000000007 - Jeff Bezos','2024-01-12 11:14:34','2024-01-12 11:14:34',NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,115.00,'C',1,0,0),(145,2,2,NULL,'Movimento sem conta contábil (C)','2024-01-12 11:14:34','2024-01-12 11:14:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',1,0,0),(146,2,2,NULL,'Movimento sem conta contábil (C)','2024-01-12 11:14:34','2024-01-12 11:14:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15.00,'C',1,0,0),(147,2,2,NULL,'Movimento sem conta contábil (C)','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23.00,'C',1,0,0),(148,2,2,NULL,'Movimento sem conta contábil (C)','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23.00,'C',1,0,0),(149,2,2,NULL,'Movimento sem conta contábil (C)','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23.00,'C',1,0,0),(150,2,2,NULL,'Movimento sem conta contábil (D)','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,118.00,'D',1,0,0),(151,2,2,NULL,'Movimento sem conta contábil (D)','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,118.00,'D',1,0,0),(152,2,1,NULL,'Documento à receber: 0000000008','2024-02-12 11:14:35','2024-02-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,410.00,'C',2,0,0),(153,2,1,NULL,'Documento à receber: 0000000009','2024-02-12 11:14:35','2024-02-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,115.00,'C',2,0,0),(154,2,1,NULL,'Documento à pagar: 0000000008','2024-02-12 11:14:35','2024-02-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,651.00,'D',2,0,0),(155,2,1,NULL,'Documento à pagar: 0000000009','2024-02-12 11:14:35','2024-02-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,88.64,'D',2,0,0),(156,2,2,NULL,'teste validação das contas contábeis','2024-01-12 11:14:35','2024-01-12 11:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(157,2,2,NULL,'Transferência entre Caixa interno e Caixa interno','2024-01-12 11:14:28','2024-01-12 11:14:28',NULL,NULL,NULL,NULL,NULL,158,NULL,NULL,NULL,NULL,10.00,'D',1,0,0),(158,2,1,NULL,'Transferência entre Caixa interno e Caixa interno','2024-01-12 11:14:28','2024-01-12 11:14:28',NULL,NULL,NULL,NULL,NULL,157,NULL,NULL,NULL,NULL,10.00,'C',1,0,0),(159,2,1,NULL,'Documento à receber: 0000000010','2024-01-12 11:15:17','2024-01-12 11:15:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,33.00,'C',2,0,0),(160,2,1,NULL,'Documento à pagar: 0000000010','2024-01-12 11:15:17','2024-01-12 11:15:17',NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,33.00,'D',2,0,0);
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
INSERT INTO `movimento_categoria` VALUES (1,8,NULL,'',300.00),(2,72,NULL,'',900.00),(3,24,NULL,'',900.00),(4,72,NULL,'',1120.00),(5,72,NULL,'',880.00),(6,24,NULL,'',20.00),(7,72,NULL,'',1344.00),(8,72,NULL,'',1056.00),(9,24,NULL,'',30.00),(10,72,NULL,'',1680.00),(11,72,NULL,'',1320.00),(12,24,NULL,'',30.00),(13,72,NULL,'',1344.00),(14,72,NULL,'',1056.00),(15,24,NULL,'',30.00),(16,72,NULL,'',1680.00),(17,72,NULL,'',1320.00),(18,24,NULL,'',30.00),(19,72,NULL,'',1680.00),(20,72,NULL,'',1320.00),(21,24,NULL,'',30.00),(22,72,NULL,'',1344.00),(23,72,NULL,'',1056.00),(24,24,NULL,'',30.00),(25,72,NULL,'',1344.00),(26,72,NULL,'',1056.00),(27,24,NULL,'',30.00),(28,72,NULL,'',1680.00),(29,72,NULL,'',1320.00),(30,24,NULL,'',30.00),(31,72,NULL,'',1344.00),(32,72,NULL,'',1056.00),(33,24,NULL,'',30.00),(34,72,NULL,'',1344.00),(35,72,NULL,'',1056.00),(36,24,NULL,'',30.00),(37,72,NULL,'',1344.00),(38,72,NULL,'',1056.00),(39,24,NULL,'',30.00),(40,72,NULL,'',1680.00),(41,72,NULL,'',1320.00),(42,24,NULL,'',30.00),(43,72,NULL,'',1680.00),(44,72,NULL,'',1320.00),(45,24,NULL,'',30.00),(46,72,NULL,'',1680.00),(47,72,NULL,'',1320.00),(48,24,NULL,'',30.00),(49,72,NULL,'',1344.00),(50,72,NULL,'',1056.00),(51,24,NULL,'',30.00),(52,72,NULL,'',1680.00),(53,72,NULL,'',1320.00),(54,24,NULL,'',30.00),(55,72,NULL,'',1344.00),(56,72,NULL,'',1056.00),(57,24,NULL,'',30.00),(58,72,NULL,'',1344.00),(59,72,NULL,'',1056.00),(60,24,NULL,'',30.00),(61,72,NULL,'',1344.00),(62,72,NULL,'',1056.00),(63,24,NULL,'',30.00),(64,72,NULL,'',500.00),(65,72,NULL,'',500.00),(66,2,NULL,'',200.00),(67,2,NULL,'',40.00),(68,3,NULL,'',1000.00),(69,1,NULL,'',2000.00),(70,2,NULL,'',1000.00),(71,2,NULL,'',100.00),(72,72,NULL,'',5000.00),(73,72,NULL,'',5000.00),(74,72,NULL,'',50.00),(75,72,NULL,'',50.00),(76,72,NULL,'',1000.00),(77,8,NULL,'',500.00),(78,8,NULL,'',300.00),(79,72,NULL,'',900.00),(80,24,NULL,'',900.00),(81,72,NULL,'',1000.00),(82,8,NULL,'',500.00),(83,72,NULL,'',1000.00),(84,72,NULL,'',1000.00),(85,2,NULL,'',700.00),(86,72,NULL,'',1000.00),(87,2,NULL,'',700.00),(88,72,NULL,'',1000.00),(89,2,NULL,'',700.00),(90,72,NULL,'',300.00),(91,72,NULL,'',1000.00),(92,2,NULL,'',700.00),(93,72,NULL,'',1000.00),(94,8,NULL,'',500.00),(95,2,NULL,'',700.00),(96,72,NULL,'',1000.00),(97,2,NULL,'',600.00),(98,2,NULL,'',400.00),(99,2,NULL,'',200.00),(100,72,NULL,'',200.00),(101,72,NULL,'',1000.00),(102,8,NULL,'',500.00),(103,72,NULL,'',1000.00),(104,8,NULL,'',500.00),(105,11,NULL,'',180.00),(106,11,NULL,'',181.25),(107,11,NULL,'',170.50),(108,2,NULL,'',170.50),(109,2,NULL,'',170.25),(110,11,NULL,'',80.00),(111,66,NULL,'',180.00),(112,66,NULL,'',181.25),(113,66,NULL,'',170.50),(114,66,NULL,'',170.50),(115,66,NULL,'',170.25),(116,66,NULL,'',25.00),(117,66,NULL,'',37.32),(118,19,NULL,'',6.00),(118,50,NULL,'',4.00),(119,19,NULL,'',6.00),(119,50,NULL,'',4.00),(123,11,NULL,'',190.67),(124,11,NULL,'',70.17),(125,11,NULL,'',270.17),(126,11,NULL,'',70.17),(127,66,NULL,'',108.26),(128,66,NULL,'',200.00),(129,66,NULL,'',300.00),(130,66,NULL,'',200.00),(131,16,NULL,'',255.00),(132,16,NULL,'',50.00),(133,16,NULL,'',120.00),(134,16,NULL,'',50.00),(135,16,NULL,'',10.00),(136,16,NULL,'',100.00),(137,16,NULL,'',115.00),(138,66,NULL,'',255.00),(139,66,NULL,'',50.00),(140,66,NULL,'',120.00),(141,66,NULL,'',50.00),(142,66,NULL,'',10.00),(143,66,NULL,'',100.00),(144,66,NULL,'',115.00),(145,93,NULL,'',15.00),(146,93,NULL,'',15.00),(147,93,NULL,'',23.00),(148,93,NULL,'',23.00),(149,93,NULL,'',23.00),(150,94,NULL,'',118.00),(151,94,NULL,'',118.00),(152,93,NULL,'',410.00),(153,93,NULL,'',115.00),(154,94,NULL,'',651.00),(155,94,NULL,'',88.64),(156,95,NULL,'',10.00),(159,66,NULL,'',33.00),(160,1,NULL,'',33.00);
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
INSERT INTO `movimento_centro_resultado` VALUES (1,1,300.00),(2,1,900.00),(3,1,900.00),(4,1,1120.00),(5,1,880.00),(6,1,20.00),(7,1,1344.00),(8,1,1056.00),(9,1,30.00),(10,1,1680.00),(11,1,1320.00),(12,1,30.00),(13,1,1344.00),(14,1,1056.00),(15,1,30.00),(16,1,1680.00),(17,1,1320.00),(18,1,30.00),(19,1,1680.00),(20,1,1320.00),(21,1,30.00),(22,1,1344.00),(23,1,1056.00),(24,1,30.00),(25,1,1344.00),(26,1,1056.00),(27,1,30.00),(28,1,1680.00),(29,1,1320.00),(30,1,30.00),(31,1,1344.00),(32,1,1056.00),(33,1,30.00),(34,1,1344.00),(35,1,1056.00),(36,1,30.00),(37,1,1344.00),(38,1,1056.00),(39,1,30.00),(40,1,1680.00),(41,1,1320.00),(42,1,30.00),(43,1,1680.00),(44,1,1320.00),(45,1,30.00),(46,1,1680.00),(47,1,1320.00),(48,1,30.00),(49,1,1344.00),(50,1,1056.00),(51,1,30.00),(52,1,1680.00),(53,1,1320.00),(54,1,30.00),(55,1,1344.00),(56,1,1056.00),(57,1,30.00),(58,1,1344.00),(59,1,1056.00),(60,1,30.00),(61,1,1344.00),(62,1,1056.00),(63,1,30.00),(66,1,200.00),(67,1,40.00),(68,1,1000.00),(69,1,2000.00),(70,1,1000.00),(71,1,100.00),(72,1,5000.00),(73,1,5000.00),(74,1,50.00),(75,1,50.00),(76,1,1000.00),(78,1,300.00),(79,1,900.00),(80,1,900.00),(81,1,1000.00),(83,1,1000.00),(84,1,1000.00),(85,1,700.00),(86,1,1000.00),(87,1,700.00),(88,1,1000.00),(89,1,700.00),(90,1,300.00),(91,1,1000.00),(92,1,700.00),(93,1,1000.00),(95,1,700.00),(96,1,1000.00),(97,1,600.00),(98,1,400.00),(99,1,200.00),(100,1,200.00),(101,1,1000.00),(103,1,1000.00),(118,1,7.00),(118,2,3.00),(119,1,7.00),(119,2,3.00),(123,2,114.40),(123,4,76.27),(124,2,49.12),(124,4,21.05),(125,2,169.12),(125,4,101.05),(126,2,49.12),(126,4,21.05),(127,3,54.13),(127,4,54.13),(128,1,200.00),(129,1,200.00),(129,3,50.00),(129,4,50.00),(130,1,200.00),(156,1,10.00);
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
INSERT INTO `movimento_conta_contabil` VALUES (1,8,40,4,300.00,2),(1,8,153,1,300.00,2),(2,72,40,4,900.00,2),(2,72,144,1,900.00,2),(3,24,40,1,900.00,2),(3,24,152,4,900.00,2),(4,72,40,4,1120.00,2),(4,72,144,1,1120.00,2),(5,72,40,4,880.00,2),(5,72,144,1,880.00,2),(6,24,40,1,20.00,2),(6,24,152,4,20.00,2),(7,72,40,4,1344.00,2),(7,72,144,1,1344.00,2),(8,72,40,4,1056.00,2),(8,72,144,1,1056.00,2),(9,24,40,1,30.00,2),(9,24,152,4,30.00,2),(10,72,40,4,1680.00,2),(10,72,144,1,1680.00,2),(11,72,40,4,1320.00,2),(11,72,144,1,1320.00,2),(12,24,40,1,30.00,2),(12,24,152,4,30.00,2),(13,72,40,4,1344.00,2),(13,72,144,1,1344.00,2),(14,72,40,4,1056.00,2),(14,72,144,1,1056.00,2),(15,24,40,1,30.00,2),(15,24,152,4,30.00,2),(16,72,40,4,1680.00,2),(16,72,144,1,1680.00,2),(17,72,40,4,1320.00,2),(17,72,144,1,1320.00,2),(18,24,40,1,30.00,2),(18,24,152,4,30.00,2),(19,72,40,4,1680.00,2),(19,72,144,1,1680.00,2),(20,72,40,4,1320.00,2),(20,72,144,1,1320.00,2),(21,24,40,1,30.00,2),(21,24,152,4,30.00,2),(22,72,40,4,1344.00,2),(22,72,144,1,1344.00,2),(23,72,40,4,1056.00,2),(23,72,144,1,1056.00,2),(24,24,40,1,30.00,2),(24,24,152,4,30.00,2),(25,72,40,4,1344.00,2),(25,72,144,1,1344.00,2),(26,72,40,4,1056.00,2),(26,72,144,1,1056.00,2),(27,24,40,1,30.00,2),(27,24,152,4,30.00,2),(28,72,40,4,1680.00,2),(28,72,144,1,1680.00,2),(29,72,40,4,1320.00,2),(29,72,144,1,1320.00,2),(30,24,40,1,30.00,2),(30,24,152,4,30.00,2),(31,72,40,4,1344.00,2),(31,72,144,1,1344.00,2),(32,72,40,4,1056.00,2),(32,72,144,1,1056.00,2),(33,24,40,1,30.00,2),(33,24,152,4,30.00,2),(34,72,40,4,1344.00,2),(34,72,144,1,1344.00,2),(35,72,40,4,1056.00,2),(35,72,144,1,1056.00,2),(36,24,40,1,30.00,2),(36,24,152,4,30.00,2),(37,72,40,4,1344.00,2),(37,72,144,1,1344.00,2),(38,72,40,4,1056.00,2),(38,72,144,1,1056.00,2),(39,24,40,1,30.00,2),(39,24,152,4,30.00,2),(40,72,40,4,1680.00,2),(40,72,144,1,1680.00,2),(41,72,40,4,1320.00,2),(41,72,144,1,1320.00,2),(42,24,40,1,30.00,2),(42,24,152,4,30.00,2),(43,72,40,4,1680.00,2),(43,72,144,1,1680.00,2),(44,72,40,4,1320.00,2),(44,72,144,1,1320.00,2),(45,24,40,1,30.00,2),(45,24,152,4,30.00,2),(46,72,40,4,1680.00,2),(46,72,144,1,1680.00,2),(47,72,40,4,1320.00,2),(47,72,144,1,1320.00,2),(48,24,40,1,30.00,2),(48,24,152,4,30.00,2),(49,72,40,4,1344.00,2),(49,72,144,1,1344.00,2),(50,72,40,4,1056.00,2),(50,72,144,1,1056.00,2),(51,24,40,1,30.00,2),(51,24,152,4,30.00,2),(52,72,40,4,1680.00,2),(52,72,144,1,1680.00,2),(53,72,40,4,1320.00,2),(53,72,144,1,1320.00,2),(54,24,40,1,30.00,2),(54,24,152,4,30.00,2),(55,72,40,4,1344.00,2),(55,72,144,1,1344.00,2),(56,72,40,4,1056.00,2),(56,72,144,1,1056.00,2),(57,24,40,1,30.00,2),(57,24,152,4,30.00,2),(58,72,40,4,1344.00,2),(58,72,144,1,1344.00,2),(59,72,40,4,1056.00,2),(59,72,144,1,1056.00,2),(60,24,40,1,30.00,2),(60,24,152,4,30.00,2),(61,72,40,4,1344.00,2),(61,72,144,1,1344.00,2),(62,72,40,4,1056.00,2),(62,72,144,1,1056.00,2),(63,24,40,1,30.00,2),(63,24,152,4,30.00,2),(64,72,40,4,500.00,2),(64,72,144,1,500.00,2),(65,72,40,4,500.00,2),(65,72,144,1,500.00,2),(66,2,4,3,200.00,2),(66,2,40,1,200.00,2),(67,2,4,3,40.00,2),(67,2,40,1,40.00,2),(68,3,4,3,1000.00,2),(68,3,40,1,1000.00,2),(69,1,40,4,2000.00,2),(69,1,145,1,2000.00,2),(70,2,4,3,1000.00,2),(70,2,40,1,1000.00,2),(71,2,4,3,100.00,2),(71,2,40,1,100.00,2),(72,72,40,4,5000.00,2),(72,72,144,1,5000.00,2),(73,72,40,4,5000.00,2),(73,72,144,1,5000.00,2),(74,72,40,4,50.00,2),(74,72,144,1,50.00,2),(75,72,5,3,50.00,1),(75,72,40,1,50.00,1),(75,72,159,1,50.00,1),(76,72,40,4,1000.00,2),(76,72,144,1,1000.00,2),(77,8,40,4,500.00,2),(77,8,153,1,500.00,2),(78,8,5,3,300.00,1),(78,8,40,1,300.00,1),(78,8,167,1,300.00,1),(79,72,5,3,900.00,1),(79,72,40,1,900.00,1),(79,72,159,1,900.00,1),(80,24,5,2,900.00,1),(80,24,40,4,900.00,1),(81,72,5,3,1000.00,1),(81,72,40,1,1000.00,1),(81,72,159,1,1000.00,1),(82,8,5,3,500.00,1),(82,8,40,1,500.00,1),(82,8,167,1,500.00,1),(83,72,40,4,1000.00,2),(83,72,144,1,1000.00,2),(84,72,40,4,1000.00,2),(84,72,144,1,1000.00,2),(85,2,4,3,700.00,2),(85,2,40,1,700.00,2),(86,72,40,4,1000.00,2),(86,72,144,1,1000.00,2),(87,2,4,3,700.00,2),(87,2,40,1,700.00,2),(88,72,40,4,1000.00,2),(88,72,144,1,1000.00,2),(89,2,4,3,700.00,2),(89,2,40,1,700.00,2),(90,72,5,3,300.00,1),(90,72,40,1,300.00,1),(90,72,159,1,300.00,1),(91,72,40,4,1000.00,2),(91,72,144,1,1000.00,2),(92,2,4,3,700.00,2),(92,2,40,1,700.00,2),(93,72,40,4,1000.00,2),(93,72,144,1,1000.00,2),(94,8,40,4,500.00,2),(94,8,153,1,500.00,2),(95,2,4,3,700.00,2),(95,2,40,1,700.00,2),(96,72,40,4,1000.00,2),(96,72,144,1,1000.00,2),(97,2,4,3,600.00,2),(97,2,40,1,600.00,2),(98,2,4,3,400.00,2),(98,2,40,1,400.00,2),(99,2,4,3,200.00,2),(99,2,40,1,200.00,2),(100,72,40,4,200.00,2),(100,72,144,1,200.00,2),(101,72,40,4,1000.00,2),(101,72,144,1,1000.00,2),(102,8,40,4,500.00,2),(102,8,153,1,500.00,2),(103,72,5,3,1000.00,1),(103,72,40,1,1000.00,1),(103,72,159,1,1000.00,1),(104,8,5,3,500.00,1),(104,8,40,1,500.00,1),(104,8,167,1,500.00,1),(105,11,2,4,180.00,2),(105,11,3,2,72.00,2),(105,11,4,2,108.00,2),(106,11,10,3,181.25,2),(106,11,12,1,181.25,2),(107,11,1,3,170.50,2),(107,11,3,1,170.50,2),(108,2,1,3,170.50,2),(108,2,2,1,170.50,2),(109,2,1,4,170.25,1),(109,2,2,2,170.25,1),(110,11,20,3,80.00,1),(110,11,30,1,80.00,1),(111,66,1,4,90.00,2),(111,66,2,3,90.00,2),(111,66,3,2,90.00,2),(111,66,4,1,90.00,2),(112,66,10,4,181.25,2),(112,66,12,2,181.25,2),(113,66,20,3,170.50,2),(113,66,30,1,170.50,2),(114,66,1,4,170.50,2),(114,66,2,2,170.50,2),(118,19,38,4,6.00,1),(118,19,88,2,6.00,1),(118,50,4,4,4.00,1),(118,50,5,2,4.00,1),(119,19,38,4,10.00,1),(119,19,88,2,10.00,1),(119,50,4,4,20.00,1),(119,50,5,2,20.00,1),(123,11,4,3,104.87,2),(123,11,5,4,85.80,2),(123,11,12,2,190.67,2),(124,11,4,1,70.17,2),(124,11,12,4,70.17,2),(125,11,1,3,200.00,1),(125,11,2,1,200.00,1),(125,11,4,3,70.17,1),(125,11,12,2,70.17,1),(126,11,4,3,70.17,1),(126,11,12,2,70.17,1),(127,66,4,2,108.26,2),(127,66,10,3,108.26,2),(128,66,4,2,200.00,2),(128,66,10,3,200.00,2),(131,16,1,1,255.00,2),(131,16,2,4,255.00,2),(132,16,1,2,50.00,1),(132,16,2,3,50.00,1),(133,16,1,2,120.00,1),(133,16,2,3,120.00,1),(134,16,1,2,50.00,1),(134,16,2,3,50.00,1),(135,16,1,2,10.00,1),(135,16,2,3,10.00,1),(136,16,1,1,100.00,2),(136,16,2,4,100.00,2),(137,16,1,2,115.00,1),(137,16,2,3,115.00,1),(138,66,1,2,255.00,2),(138,66,2,3,255.00,2),(143,66,1,2,100.00,2),(143,66,2,3,100.00,2),(145,93,4,4,15.00,0),(145,93,5,3,15.00,0),(145,93,12,2,15.00,0),(145,93,14,1,15.00,0),(146,93,4,4,15.00,0),(146,93,5,3,15.00,0),(146,93,12,2,15.00,0),(146,93,14,1,15.00,0),(147,93,4,4,23.00,0),(147,93,5,3,23.00,0),(147,93,12,2,23.00,0),(147,93,14,1,23.00,0),(148,93,4,4,23.00,0),(148,93,5,3,23.00,0),(148,93,12,2,23.00,0),(148,93,14,1,23.00,0),(149,93,4,4,23.00,0),(149,93,5,3,23.00,0),(149,93,12,2,23.00,0),(149,93,14,1,23.00,0),(150,94,5,3,35.40,0),(150,94,5,4,35.40,0),(150,94,10,3,38.94,0),(150,94,10,4,38.94,0),(150,94,12,3,43.66,0),(150,94,12,4,43.66,0),(150,94,20,1,88.50,0),(150,94,20,2,88.50,0),(150,94,23,1,29.50,0),(150,94,23,2,29.50,0),(151,94,5,3,35.40,0),(151,94,5,4,35.40,0),(151,94,10,3,38.94,0),(151,94,10,4,38.94,0),(151,94,12,3,43.66,0),(151,94,12,4,43.66,0),(151,94,20,1,88.50,0),(151,94,20,2,88.50,0),(151,94,23,1,29.50,0),(151,94,23,2,29.50,0),(152,93,5,3,410.00,2),(152,93,14,1,410.00,2),(153,93,5,3,115.00,2),(153,93,14,1,115.00,2),(154,94,5,3,195.30,2),(154,94,10,3,214.83,2),(154,94,12,3,240.87,2),(154,94,20,1,488.25,2),(154,94,23,1,162.75,2),(155,94,5,3,26.59,2),(155,94,10,3,29.25,2),(155,94,12,3,32.80,2),(155,94,20,1,66.48,2),(155,94,23,1,22.16,2),(156,95,4,4,10.00,1),(156,95,5,2,10.00,1),(159,66,5,2,33.00,2),(159,66,37,4,33.00,2),(160,1,5,3,33.00,2),(160,1,37,1,33.00,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_forma_pagamento`
--

LOCK TABLES `movimento_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `movimento_forma_pagamento` DISABLE KEYS */;
INSERT INTO `movimento_forma_pagamento` VALUES (1,75,1,NULL,NULL,NULL,50.00,'D',1),(2,78,1,NULL,NULL,NULL,300.00,'D',1),(3,79,1,NULL,NULL,NULL,900.00,'D',1),(4,80,1,NULL,NULL,NULL,900.00,'C',1),(5,81,1,NULL,NULL,NULL,1000.00,'D',1),(6,82,1,NULL,NULL,NULL,500.00,'D',1),(7,90,1,NULL,NULL,NULL,300.00,'D',1),(8,103,1,NULL,NULL,NULL,1000.00,'D',1),(9,104,1,NULL,NULL,NULL,500.00,'D',1),(10,109,1,NULL,NULL,NULL,85.00,'D',1),(11,109,3,NULL,NULL,NULL,51.15,'D',0),(12,109,4,NULL,NULL,NULL,34.10,'D',0),(13,110,1,NULL,NULL,NULL,80.00,'D',1),(14,115,1,NULL,NULL,NULL,85.00,'C',1),(15,115,3,NULL,NULL,NULL,51.15,'C',0),(16,115,4,NULL,NULL,NULL,34.10,'C',0),(17,116,1,NULL,NULL,NULL,25.00,'C',1),(18,117,1,NULL,NULL,NULL,37.32,'C',1),(19,118,1,NULL,NULL,NULL,10.00,'D',1),(20,119,1,NULL,NULL,NULL,10.00,'D',1),(21,120,1,NULL,NULL,NULL,17.98,'D',1),(22,121,1,NULL,NULL,NULL,17.98,'D',1),(23,122,1,NULL,NULL,NULL,17.98,'D',1),(24,125,1,NULL,NULL,NULL,270.17,'D',1),(25,126,1,NULL,NULL,NULL,70.17,'D',1),(26,129,1,NULL,NULL,NULL,300.00,'C',1),(27,130,1,NULL,NULL,NULL,200.00,'C',1),(28,132,1,NULL,NULL,NULL,50.00,'D',1),(29,133,1,NULL,NULL,NULL,120.00,'D',1),(30,134,1,NULL,NULL,NULL,50.00,'D',1),(31,135,1,NULL,NULL,NULL,10.00,'D',1),(32,137,1,NULL,NULL,NULL,115.00,'D',1),(33,139,1,NULL,NULL,NULL,50.00,'C',1),(34,140,1,NULL,NULL,NULL,120.00,'C',1),(35,141,1,NULL,NULL,NULL,50.00,'C',1),(36,142,1,NULL,NULL,NULL,10.00,'C',1),(37,144,1,NULL,NULL,NULL,115.00,'C',1),(38,145,1,NULL,NULL,NULL,15.00,'C',1),(39,146,1,NULL,NULL,NULL,15.00,'C',1),(40,147,1,NULL,NULL,NULL,23.00,'C',1),(41,148,1,NULL,NULL,NULL,23.00,'C',1),(42,149,1,NULL,NULL,NULL,23.00,'C',1),(43,150,1,NULL,NULL,NULL,118.00,'D',1),(44,151,1,NULL,NULL,NULL,118.00,'D',1),(45,156,1,NULL,NULL,NULL,10.00,'C',1),(46,157,1,NULL,NULL,NULL,10.00,'D',1),(47,158,1,NULL,NULL,NULL,10.00,'C',1);
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
INSERT INTO `nfse` VALUES (1,1,0,37,1,'',2,'2024-01-12','2024-01-11',1,6,2,343.00,343.00,0.00,343.00,10.29,0.00,0.00,0.00,'','','',0,'','','',0,0),(2,1,0,37,1,'',2,'2024-01-12','2024-01-12',1,6,2,343.00,343.00,0.00,343.00,10.29,0.00,0.00,0.00,'','','',0,'','','',0,1),(3,1,0,37,1,'',2,'2024-01-12','2024-01-12',1,6,2,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','','',0,'','','',0,0);
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
INSERT INTO `odf` VALUES (1,1,1,'2024-01-12','2024-01-12','1','6',0,6,2,343.00,10.00,0.00,1203,'90',0.00,0.0000,0.00,'50',343.00,1.6500,7.6000,5.66,26.07,101,4,1,1,1,1,1,0,''),(2,1,1,'2024-01-12','2024-01-11','1','6',0,6,2,343.00,10.00,0.00,1203,'90',0.00,0.0000,0.00,'50',343.00,1.6500,7.6000,5.66,26.07,101,4,1,1,1,1,1,0,'');
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
INSERT INTO `operacao_categoria` VALUES (1,86,1),(1,85,2),(1,66,9),(2,32,5),(2,31,6),(3,15,3),(3,14,4),(3,89,10),(4,30,7),(4,29,8),(5,64,9),(5,60,11),(5,59,12),(6,59,1),(8,86,1);
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
INSERT INTO `operacao_conta_contabil` VALUES (1,66,4,2,100.0000,1,0),(1,66,10,3,100.0000,1,0),(1,85,4,2,100.0000,1,0),(1,85,10,2,100.0000,2,0),(1,85,10,3,100.0000,1,0),(1,85,12,3,100.0000,2,1),(1,85,59,4,100.0000,2,0),(1,85,80,1,100.0000,2,1),(1,86,4,2,100.0000,1,0),(1,86,12,3,100.0000,1,1),(1,86,59,4,100.0000,1,0),(1,86,61,4,100.0000,1,0),(1,86,80,1,100.0000,1,1),(2,31,10,3,100.0000,2,0),(2,31,12,2,100.0000,2,1),(2,31,59,1,100.0000,2,0),(2,31,80,4,100.0000,2,1),(2,32,5,3,100.0000,1,0),(2,32,12,2,100.0000,1,1),(2,32,59,1,100.0000,1,0),(2,32,80,4,100.0000,1,1),(3,14,5,3,100.0000,1,0),(3,14,12,2,100.0000,2,1),(3,14,37,1,100.0000,1,0),(3,14,37,4,100.0000,2,0),(3,14,83,1,100.0000,1,1),(3,15,4,3,100.0000,1,0),(3,15,12,2,100.0000,1,0),(3,15,83,1,100.0000,1,0),(3,89,5,3,100.0000,1,0),(3,89,37,1,100.0000,1,0),(3,89,83,1,100.0000,1,0),(4,29,12,3,100.0000,2,0),(4,29,37,1,100.0000,2,0),(4,30,5,2,100.0000,1,0),(4,30,12,3,100.0000,1,0),(4,30,83,4,100.0000,1,0),(5,59,4,2,100.0000,1,0),(5,59,10,2,100.0000,2,0),(5,59,10,3,100.0000,1,0),(5,59,60,4,100.0000,2,0),(5,60,4,2,100.0000,1,0),(5,60,60,4,100.0000,1,0),(5,60,62,4,100.0000,1,0),(5,64,4,2,100.0000,1,0),(5,64,10,3,100.0000,1,0),(5,64,65,4,100.0000,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oportunidade`
--

LOCK TABLES `oportunidade` WRITE;
/*!40000 ALTER TABLE `oportunidade` DISABLE KEYS */;
INSERT INTO `oportunidade` VALUES (1,2,45,42,9,1,1,3,1,NULL,1,'Oportuniade cadastrada',150.00,150.00,150.00,15,2550.00,'2024-01-12','2024-02-12','0001-01-01',3,1,'Uma observação plausível de altíssima escala',0),(2,2,NULL,42,9,NULL,1,3,1,NULL,NULL,'Outra otima descrição!',150.00,150.00,150.00,15,2550.00,'2024-01-12','2024-01-22','0001-01-01',0,0,'',1);
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
INSERT INTO `ordem_servico_atividade` VALUES (1,1,1,'2024-01-12 11:15:31',1,NULL,0,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','','Ordem de serviço CRUD'),(2,1,1,'2024-01-12 11:15:31',3,NULL,6,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,'','','');
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
INSERT INTO `pagamento` VALUES (1,2,'2024-01-12',170.50,0.00,0.00,170.25,1),(2,2,'2024-01-12',180.00,0.00,10.00,80.00,1),(3,1,'2024-01-12',260.84,0.00,9.33,270.17,1),(4,1,'2024-01-12',255.00,0.00,0.00,50.00,0),(5,1,'2024-01-12',205.00,0.00,15.00,120.00,0),(6,1,'2024-01-12',100.00,15.00,0.00,50.00,0),(7,1,'2024-01-12',35.00,0.00,0.00,10.00,0),(8,1,'2024-01-12',100.00,0.00,15.00,115.00,0);
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
INSERT INTO `pagamento_cancelado` VALUES (1,1,'2024-01-12'),(2,2,'2024-01-12'),(3,3,'2024-01-12'),(4,3,'2024-01-12');
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
INSERT INTO `pagamento_pagar_categoria` VALUES (1,2,170.25),(2,11,80.00),(3,11,200.00),(4,11,70.17),(5,16,50.00),(6,16,120.00),(7,16,50.00),(8,16,10.00),(9,16,115.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagar`
--

LOCK TABLES `pagar` WRITE;
/*!40000 ALTER TABLE `pagar` DISABLE KEYS */;
INSERT INTO `pagar` VALUES (1,NULL,2,6,NULL,2,'1ab','2024-01-12','2024-01-17','0001-01-01',170.50,0.00,0.00,0.00,'',0,0),(2,NULL,2,6,NULL,1,'0000000002','2024-01-12','2024-02-12','0001-01-01',181.25,0.00,0.00,0.00,'',0,1),(3,NULL,2,6,NULL,2,'0000000003','2024-01-12','2024-02-12','0001-01-01',170.50,0.00,0.00,0.00,'',0,0),(4,NULL,2,6,NULL,1,'0000000004','2024-01-12','2024-02-11','0001-01-01',190.67,0.00,0.00,0.00,'',0,0),(5,NULL,2,6,NULL,1,'0000000005','2024-01-12','2024-02-11','0001-01-01',70.17,0.00,0.00,0.00,'',0,0),(6,NULL,2,8,NULL,1,'0000000006','2024-01-12','2024-02-12','0001-01-01',255.00,15.00,15.00,230.00,'',0,0),(7,NULL,2,8,NULL,1,'0000000007','2024-01-12','2024-02-12','2024-01-12',100.00,0.00,15.00,115.00,'',0,0),(8,NULL,2,6,NULL,1,'0000000008','2024-01-12','2024-02-12','0001-01-01',651.00,0.00,0.00,0.00,'',0,0),(9,NULL,2,6,NULL,1,'0000000009','2024-01-12','2024-02-12','0001-01-01',88.64,0.00,0.00,0.00,'',0,0),(10,NULL,2,6,NULL,1,'0000000010','2024-01-12','2024-02-12','0001-01-01',33.00,0.00,0.00,0.00,'',0,0);
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
INSERT INTO `pagar_categoria` VALUES (1,2,100.0000),(3,11,100.0000),(4,11,100.0000),(5,11,100.0000),(6,16,100.0000),(7,16,100.0000),(8,94,100.0000),(9,94,100.0000),(10,1,100.0000);
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
INSERT INTO `pagar_conta_contabil` VALUES (1,2,1,3,100.0000,2),(1,2,1,4,100.0000,1),(1,2,2,1,100.0000,2),(1,2,2,2,100.0000,1),(3,11,1,3,100.0000,2),(3,11,3,1,100.0000,2),(3,11,20,3,100.0000,1),(3,11,30,1,100.0000,1),(4,11,1,3,100.0000,1),(4,11,2,1,100.0000,1),(4,11,4,3,55.0000,2),(4,11,5,4,45.0000,2),(4,11,12,2,100.0000,2),(5,11,4,1,100.0000,2),(5,11,4,3,100.0000,1),(5,11,12,2,100.0000,1),(5,11,12,4,100.0000,2),(6,16,1,1,100.0000,2),(6,16,1,2,100.0000,1),(6,16,2,3,100.0000,1),(6,16,2,4,100.0000,2),(7,16,1,1,100.0000,2),(7,16,1,2,100.0000,1),(7,16,2,3,100.0000,1),(7,16,2,4,100.0000,2),(8,94,5,3,30.0000,2),(8,94,5,4,30.0000,1),(8,94,10,3,33.0000,2),(8,94,10,4,33.0000,1),(8,94,12,3,37.0000,2),(8,94,12,4,37.0000,1),(8,94,20,1,75.0000,2),(8,94,20,2,75.0000,1),(8,94,23,1,25.0000,2),(8,94,23,2,25.0000,1),(9,94,5,3,30.0000,2),(9,94,5,4,30.0000,1),(9,94,10,3,33.0000,2),(9,94,10,4,33.0000,1),(9,94,12,3,37.0000,2),(9,94,12,4,37.0000,1),(9,94,20,1,75.0000,2),(9,94,20,2,75.0000,1),(9,94,23,1,25.0000,2),(9,94,23,2,25.0000,1),(10,1,5,2,100.0000,1),(10,1,5,3,100.0000,2),(10,1,37,1,100.0000,2),(10,1,37,4,100.0000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_contrato_faixa`
--

LOCK TABLES `parceiro_contrato_faixa` WRITE;
/*!40000 ALTER TABLE `parceiro_contrato_faixa` DISABLE KEYS */;
INSERT INTO `parceiro_contrato_faixa` VALUES (1,3,1,0.00,2000.00,25.5000),(2,3,1,2001.00,4000.00,23.5000),(3,3,1,4001.00,6000.00,21.5000),(4,3,1,6001.00,10000.00,18.5000),(5,3,1,10001.00,50000.00,15.0000);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'J',0,'Sommus Automacao Comercial Ltda - Me','Sommus Sistemas',NULL,'','04717475000154','ISENTO','','',0,'','','','','0001-01-01',0,1,NULL,NULL,'2024-01-12 11:15:32'),(2,'J',0,'Geralda Aparecida de Miranda Silva 99553082653','TEMPERO CRISTALINA',NULL,'','24634181000176','0027467430027','','',0,'','','','','0001-01-01',0,2,NULL,NULL,'2024-01-12 11:12:18'),(3,'J',1,'João das Couve','João das Couve',NULL,'','99999999000191','Isento','','',9,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:42'),(4,'F',3,'João das Couve','','12345678909','AC1593852',NULL,'','','',9,'','','','','1995-01-01',0,0,NULL,NULL,'2024-01-12 11:12:42'),(5,'J',2,'Sommus Automação Comercial LTDA','Sommus Sistemas',NULL,'','89757601000157','ISENTO','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:42'),(6,'J',2,'Femsa LTDA','Femsa',NULL,'','82436013000172','ISENTO','','',9,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:42'),(7,'J',2,'teste','teste',NULL,'','88184259000180','ISENTO','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:44'),(8,'F',1,'Jeff Bezos','','30348750374','MG351351854',NULL,'','','',9,'','','','','1999-11-29',0,0,NULL,NULL,'2024-01-12 11:15:32'),(9,'F',0,'Walter White','','44865551042','MG25488204',NULL,'','','',0,'','','','','1999-11-29',1,0,NULL,NULL,'2024-01-12 11:12:46'),(10,'F',0,'Jose da Silva','','33001998598','',NULL,'','','',0,'153153','','','','1999-11-29',0,0,NULL,NULL,'2024-01-12 11:12:46'),(11,'F',0,'Francisco','','01716124859','',NULL,'','','',0,'888888','','','','1999-12-25',0,0,NULL,NULL,'2024-01-12 11:12:46'),(12,'J',0,'Patrimonium Contabilidade','',NULL,'','47717436000160','','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:46'),(13,'J',0,'Aliber Máquinas LTDA ME','Aliber Sistemas',NULL,'','25940685000187','6996508370046','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:15:31'),(14,'J',0,'Maximus Informática','Maximus Informática',NULL,'','09285455000175','0010572290063','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:49'),(15,'F',0,'Wilson de Castro','W2','06981129620','13852332',NULL,'','','',0,'','','','','1994-01-12',0,0,NULL,NULL,'2024-01-12 11:12:49'),(16,'J',0,'Barry Transports','The Flash',NULL,'','21148618000173','ISENTO','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:53'),(17,'J',1,'Barry Transports (Excluido)','The Flash',NULL,'','18494232000109','ISENTO','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:12:54'),(18,'F',0,'Joseph Climber','','09848920013','MG25153155',NULL,'','','',0,'','','','','1999-08-04',1,0,NULL,NULL,'2024-01-12 11:13:08'),(19,'F',0,'Trabalhador 01','','82154938825','MG687398099',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(20,'F',0,'Trabalhador 02','','33003050125','MG637740261',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(21,'F',0,'Trabalhador 03','','93196734030','MG820411286',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(22,'F',0,'Trabalhador 04','','32644463670','MG888710247',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(23,'F',0,'Trabalhador 05','','47941367734','MG431241894',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(24,'F',0,'Trabalhador 06','','96110627968','MG892860417',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(25,'F',0,'Trabalhador 07','','96371452495','MG741209793',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(26,'F',0,'Trabalhador 08','','99898267496','MG525523136',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(27,'F',0,'Trabalhador 09','','94843941085','MG643857021',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:06'),(28,'F',0,'Trabalhador 10','','51366294440','MG122600970',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(29,'F',0,'Trabalhador 11','','75142166183','MG776260259',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(30,'F',0,'Trabalhador 12','','94783981485','MG927209074',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(31,'F',0,'Trabalhador 13','','36406023749','MG839353307',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(32,'F',0,'Trabalhador 14','','40725317078','MG404636531',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(33,'F',0,'Trabalhador 15','','46406924550','MG690847252',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(34,'F',0,'Trabalhador 16','','59619747313','MG297592268',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(35,'F',0,'Trabalhador 17','','63954749793','MG870823206',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(36,'F',0,'Trabalhador 18','','70566927888','MG133678680',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:07'),(37,'F',0,'Trabalhador 19','','33639158105','MG233924802',NULL,'','','',0,'','','','','2000-05-10',0,0,NULL,NULL,'2024-01-12 11:13:08'),(38,'F',0,'Colaborador teste relação entre lançamentos 1','','86652485010','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,NULL,NULL,'2024-01-12 11:13:09'),(39,'F',0,'Colaborador teste relação entre lançamentos 2','','87902241083','KS90234203',NULL,'','','',0,'','','','','1995-11-01',1,0,NULL,NULL,'2024-01-12 11:13:08'),(40,'F',0,'Nelson Guilherme Drumond (Editado)','',NULL,'',NULL,'','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:13:51'),(41,'J',0,'Nelson Guilherme Drumond (a excluir)','',NULL,'',NULL,'','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:13:51'),(42,'F',0,'Jorge Levi Nathan Figueiredo (Editado)','','00172392578','180521159',NULL,'','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:13:52'),(43,'J',0,'Empresa Conta LTDA','',NULL,'','53955527000136','1315634564','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:13:52'),(44,'J',0,'Empresa Conta LTDA (a excluir)','',NULL,'',NULL,'1315634564','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:13:52'),(45,'F',0,'Stella Alícia Priscila Lopes (editado)','','30024386502','225554203',NULL,'','','',0,'','','','','1999-11-29',0,0,NULL,NULL,'2024-01-12 11:13:54'),(46,'F',0,'Pessoa CRM (a excluír)','','17143555002','234523452',NULL,'','','',0,'','','','','1999-11-29',0,0,NULL,NULL,'2024-01-12 11:13:54'),(47,'J',0,'Vap Minas Supermercado LTDA','Vap Minas',NULL,'','25623570000169','','','',0,'','','','','0001-01-01',0,8,NULL,NULL,'2024-01-12 11:15:32'),(48,'J',0,'Posto Liberdade ME','Posto Liberdade',NULL,'','87976874000167','0027467430027','','',0,'','','','','0001-01-01',0,3,NULL,NULL,'2024-01-12 11:15:32'),(49,'J',0,'Stacao Moda Com.Art.Vest.LTDA-BD L1','Stação Modas (Bom Despacho)',NULL,'','01339768000157','MG321457011','','',0,'','','','','0001-01-01',0,6,NULL,NULL,'2024-01-12 11:15:32'),(50,'F',0,'Colaborador validador saldo','','26428107040','AC1593852',NULL,'','','',0,'','','','','1995-11-01',1,0,NULL,NULL,'2024-01-12 11:14:29'),(51,'F',0,'Sabrina Nicole Rita Araújo CRUD-Servicedesk * alterado','','46227541265','248198932',NULL,'','','',0,'','','','','1972-07-03',0,0,NULL,NULL,'2024-01-12 11:15:25'),(52,'F',0,'Isabelle Sônia Andrea Almada CRUD-Servicedesk * alterado','','81860161200','114559119',NULL,'','','',0,'','','','','0001-01-01',0,0,NULL,NULL,'2024-01-12 11:15:32'),(53,'F',0,'Henry Diogo Teixeira CRUD-Servicedesk','','80986878723','494141724',NULL,'','','',0,'','','','','1976-11-15',0,0,NULL,NULL,'2024-01-12 11:15:26'),(54,'F',0,'Benedito Enrico Moraes CRUD-Servicedesk','','29700796906','227504628',NULL,'','','',0,'','','','','1981-03-09',0,0,NULL,NULL,'2024-01-12 11:15:26'),(55,'F',0,'Lúcia Emily Assunção CRUD-Servicedesk','','41008421715','204439127',NULL,'','','',0,'','','','','1999-03-07',0,0,NULL,NULL,'2024-01-12 11:15:27'),(56,'F',0,'Ester Stefany Moura CRUD-Servicedesk','','93173691547','252692135',NULL,'','','',0,'','','','','1963-10-14',0,0,NULL,NULL,'2024-01-12 11:15:27');
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
INSERT INTO `pessoa_contato` VALUES (1,1,1,2,'(037) 3261-9150',''),(2,2,2,2,'03732619150',''),(3,5,0,2,'(037) 3261-9150',''),(4,6,0,1,'(037) 2594-1157',''),(6,8,0,2,'(011) 4191-4433',''),(8,9,0,2,'(011) 4191-4433',''),(9,10,0,2,'(037) 3261-9150',''),(10,10,0,6,'(037) 3261-9150',''),(11,10,0,4,'sommus@sommus.com',''),(12,11,0,2,'(037) 3261-2003',''),(13,11,0,6,'(037) 3261-2003',''),(14,11,0,4,'desenvolvimento1@sommus.com',''),(18,12,0,2,'(037) 3261-9450',''),(19,12,0,6,'(037) 3261-2003',''),(20,12,0,4,'atendimento@patrimoniumcontabilidade.com.br',''),(22,14,0,2,'(032) 3531-5523',''),(23,15,0,2,'(037) 99197-3003',''),(24,13,0,2,'(032) 3531-5523',''),(26,16,0,4,'sommus@sommus.com',''),(28,19,0,2,'(011) 5482-5485',''),(29,20,0,2,'(011) 5482-5485',''),(30,21,0,2,'(011) 5482-5485',''),(31,22,0,2,'(011) 5482-5485',''),(32,23,0,2,'(011) 5482-5485',''),(33,24,0,2,'(011) 5482-5485',''),(34,25,0,2,'(011) 5482-5485',''),(35,26,0,2,'(011) 5482-5485',''),(36,27,0,2,'(011) 5482-5485',''),(37,28,0,2,'(011) 5482-5485',''),(38,29,0,2,'(011) 5482-5485',''),(39,30,0,2,'(011) 5482-5485',''),(40,31,0,2,'(011) 5482-5485',''),(41,32,0,2,'(011) 5482-5485',''),(42,33,0,2,'(011) 5482-5485',''),(43,34,0,2,'(011) 5482-5485',''),(44,35,0,2,'(011) 5482-5485',''),(45,36,0,2,'(011) 5482-5485',''),(46,37,0,2,'(011) 5482-5485',''),(47,18,0,2,'(011) 3458-8875',''),(48,41,0,3,'91994103377',''),(49,42,0,3,'62993503717',''),(50,45,0,3,'88991538296',''),(51,47,15,2,'3735214301',''),(52,47,16,4,'vap4@grupovap.com.br',''),(53,48,3,2,'(37) 9 9865-3157',''),(54,48,24,3,'037999887766',''),(55,49,9,2,'3735224796',''),(56,49,10,2,'3735224796',''),(57,49,11,4,'stacaomodas@hotmail.com','');
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
INSERT INTO `pessoa_empresa` VALUES (3,1,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(3,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(4,2,8,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(5,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(6,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(7,1,2,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(8,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(8,2,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,1,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(9,2,5,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(10,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,1,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(11,2,4,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(12,1,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(12,2,6,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,0),(13,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(13,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(14,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(15,1,9,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(16,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(17,1,3,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(18,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(18,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(19,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(20,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(21,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(22,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(23,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(24,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(25,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(26,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(27,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(28,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(29,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(30,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(31,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(32,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(33,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(34,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(35,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(36,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(37,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(38,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(39,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(40,1,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(40,2,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(41,2,12,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(42,1,10,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(42,2,10,0,0.00,0.00,0,0.00,9,'2024-01-31',1,0),(43,1,10,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(43,2,10,0,0.00,0.00,0,0.00,9,'2024-01-31',1,0),(44,2,10,0,0.00,0.00,0,0.00,9,'2024-01-31',0,1),(45,1,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(45,2,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(46,2,11,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(47,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(48,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(49,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(50,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(50,2,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(51,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',0,1),(52,1,1,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(53,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(54,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(55,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0),(56,1,7,0,0.00,0.00,0,0.00,NULL,'0001-01-01',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_endereco`
--

LOCK TABLES `pessoa_endereco` WRITE;
/*!40000 ALTER TABLE `pessoa_endereco` DISABLE KEYS */;
INSERT INTO `pessoa_endereco` VALUES (1,1,1,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Luciano','','35580000','Lagoa da Prata','MG','3137205','',1,0),(2,2,2,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35590000','Lagoa da Prata','MG','3137205','',0,0),(3,2,3,'Av. Brasil','328','Centro','2º Andar','35590000','Lagoa da Prata','MG','3137205','',1,0),(4,3,0,'Av. Benedito','S','Mangabeiras','','35590000','Lagoa da Prata','MG','3137205','',1,1),(5,3,0,'Av. Brasil','555','Centro','','35590000','Lagoa da Prata','MG','3137205','',1,0),(6,5,0,'Av. Dr. Antônio Luciano Pereira Filho','485','Coronel Dr. Luciano','Loja 1','35580000','Lagoa da Prata','MG','','',1,0),(7,6,0,'Av. Brasil','555','Centro','Loja 1','35580000','Lagoa da Prata','MG','3137205','',1,0),(8,8,0,'Av. ABC','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1,1),(9,8,0,'Av. Chedid Jafet','200','Vila Olimpia','Edifício JK','35590000','Lagoa da Prata','MG','3137205','',1,0),(10,9,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,1),(11,9,0,'Av. Romário','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,0),(12,10,0,'Av. Brasil','33','Centro','Loja 1','35590000','Lagoa da Prata','MG','3137205','',1,0),(13,11,0,'Av. Modesto Gomes','52','Centro','Casa','35590000','Lagoa da Prata','MG','3137205','',1,0),(14,12,0,'Pç Coronel Carlos Bernardes','15','Centro','','35590000','Lagoa da Prata','MG','3137205','',1,1),(15,12,0,'Praça Coronel Carlos Bernardes','15','Centro','','35590000','Lagoa da Prata','MG','3137205','',1,0),(16,13,0,'Av. Cristiano Rocas','52','Centro','','36500000','Ubá','MG','','',1,1),(17,14,0,'Rua das Flores','352','Centro','','39680000','Capelinha','MG','','',1,0),(18,15,0,'Av. Joaquim Gomes Pereira','774','Gomes','','35590000','Lagoa da Prata','MG','','',1,0),(19,13,0,'Av. Cristiano Rocas','52','Centro','','36500000','Ubá','MG','','',1,0),(20,16,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1,1),(21,16,0,'Avenida 1','1','Centro','S.T.A.R. Labs','35580000','Central City','MG','3104205','',1,0),(22,18,0,'Av. Brasil','200','Vila Olimpia','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,1),(23,19,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(24,20,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(25,21,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(26,22,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(27,23,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(28,24,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(29,25,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(30,26,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(31,27,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(32,28,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(33,29,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(34,30,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(35,31,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(36,32,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(37,33,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(38,34,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(39,35,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(40,36,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(41,37,0,'Rua Goiás','2645','Centro','','04551065','Rio de Janeiro','RJ','','',1,0),(42,18,0,'Rua Bahia','2015','Centro','Edifício JK','04551065','Rio de Janeiro','RJ','','',1,0),(43,41,0,'Vila Vieira','710','Marco','','66093360','Belém','PA','','',1,0),(44,42,0,'Avenida Ribeirão Preto','739','Jardim Novo Mundo','','74715430','Goiânia','GO','','',1,0),(45,45,0,'Rua Napoleão de Holanda Montenegro','840','Campo Novo','','63905405','Quixadá','CE','','',1,0),(46,47,9,'FAUSTINO TEIXEIRA','220','Centro','','35600000','Bom Despacho','MG','3171303','',1,0),(47,48,4,'Av. Almirante Tamandaré','5742','Centro','','35580000','Lagoa da Prata','MG','3137205','',1,0),(48,49,7,'Rua das Antilhas','300','Dom Joaquim','','35600000','Bom Despacho','MG','3107406','',1,0);
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`plano_pagamento_id`),
  UNIQUE KEY `uk_plano_pagamento_1` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_pagamento`
--

LOCK TABLES `plano_pagamento` WRITE;
/*!40000 ALTER TABLE `plano_pagamento` DISABLE KEYS */;
INSERT INTO `plano_pagamento` VALUES (1,1,'A Vista',1,1,0,0,0,'2024-01-12 11:13:37'),(2,2,'A Prazo - 30 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(3,3,'A Prazo - 30/60 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(4,4,'A Prazo - 30/60/90 dias',2,4,1,0,0,'2024-01-12 11:13:37'),(5,NULL,'À vista',1,1,0,0,0,'2024-01-12 11:13:37'),(6,NULL,'À prazo 30/60/90',2,1,1,0,0,'2024-01-12 11:13:37'),(7,NULL,'À prazo 20 dias',2,1,3,20,0,'2024-01-12 11:13:37'),(8,NULL,'Teste exclusão',1,1,0,0,0,'2024-01-12 11:13:38');
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `produto` VALUES (1,NULL,'SommusGestor','SommusGestor',0,NULL,'',1,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:12:52'),(2,NULL,'Treinamento Online','Treinamento Online',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:15:33'),(3,NULL,'SommusVendas (Mobile)','SommusVendas (Mobile)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:12:51'),(4,NULL,'SommusVendas (Desktop)','SommusVendas (Desktop)',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:12:51'),(901,NULL,'Suporte técnico','Suporte técnico',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:15:33'),(1001,NULL,'Outro serviço','Outro serviço',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2024-01-12 11:15:33'),(1002,NULL,'Implantação','Implantação em loco',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2024-01-12 11:15:33'),(1003,NULL,'Customização','Customização por hora',9,2,'',3,NULL,0,'','','','','0104',0,0,'',0,'',0,'2024-01-12 11:15:33'),(1004,NULL,'Consultoria','Consultoria Fiscal',9,2,'',3,NULL,0,'','','','','0107',0,0,'',0,'',0,'2024-01-12 11:15:33'),(1005,NULL,'Teste exclusão','Teste exclusão',9,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:12:48'),(1006,NULL,'Teste exclusão','',0,NULL,'',NULL,NULL,0,'','','','','',0,0,'',0,'',0,'2024-01-12 11:12:51');
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
  `atualizado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_grupo`
--

LOCK TABLES `produto_grupo` WRITE;
/*!40000 ALTER TABLE `produto_grupo` DISABLE KEYS */;
INSERT INTO `produto_grupo` VALUES (1,'Cereais alterados','2024-01-12 11:12:52'),(2,'Enlatados','2024-01-12 11:12:47'),(3,'Serviços de Suporte','2024-01-12 11:12:47'),(4,'Higiene','2024-01-12 11:12:46');
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
INSERT INTO `produto_inventario` VALUES (1,1,1006,'202312',0.0000,0.0000),(2,2,1006,'202312',0.0000,0.0000);
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
INSERT INTO `produto_preco` VALUES (1,2,0,NULL,1,0.0000,0.0000,0.0000,20.0000,0.0000,0.0000,0.0000),(2,901,0,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(3,1,0,NULL,1,0.0000,0.0000,0.0000,20.0000,0.0000,0.0000,0.0000),(4,1,1,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(5,1,2,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(6,1,3,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(7,1,4,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(8,1,5,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(9,1,6,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(10,1,7,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(11,1,8,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(12,1,9,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(13,1,10,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(14,1,11,NULL,1,0.0000,0.0000,0.0000,10.0000,0.0000,0.0000,0.0000),(15,3,0,NULL,1,0.0000,0.0000,0.0000,30.0000,0.0000,0.0000,0.0000),(16,4,0,NULL,1,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(17,1001,0,NULL,1,0.0000,0.0000,0.0000,0.7000,0.0000,0.0000,0.0000),(18,1002,0,NULL,1,0.0000,0.0000,0.0000,500.0000,0.0000,0.0000,0.0000),(19,1003,0,NULL,1,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(20,1004,0,NULL,1,0.0000,0.0000,0.0000,350.0000,0.0000,0.0000,0.0000),(21,1004,0,NULL,2,0.0000,0.0000,0.0000,350.0000,0.0000,0.0000,0.0000),(22,1003,0,NULL,2,0.0000,0.0000,0.0000,50.0000,0.0000,0.0000,0.0000),(23,1002,0,NULL,2,0.0000,0.0000,0.0000,500.0000,0.0000,0.0000,0.0000),(24,1001,0,NULL,2,0.0000,0.0000,0.0000,0.7000,0.0000,0.0000,0.0000),(27,1006,0,NULL,2,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000),(28,1006,0,NULL,1,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000);
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
INSERT INTO `produto_sped` VALUES (1,1006,'Teste exclusão','2024-01-12','0001-01-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_unidade`
--

LOCK TABLES `produto_unidade` WRITE;
/*!40000 ALTER TABLE `produto_unidade` DISABLE KEYS */;
INSERT INTO `produto_unidade` VALUES (1,'Caixa','CX',0,'2024-01-12 11:12:47'),(2,'Pacote','PCT',0,'2024-01-12 11:12:47'),(3,'Teste','Test',0,'2024-01-12 11:12:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receber`
--

LOCK TABLES `receber` WRITE;
/*!40000 ALTER TABLE `receber` DISABLE KEYS */;
INSERT INTO `receber` VALUES (1,NULL,2,8,NULL,NULL,2,'1ab','2024-01-12','2024-01-17','0001-01-01',170.50,5.00,5.00,0.00,0.0000,'',0,0,0),(2,NULL,2,8,NULL,NULL,2,'0000000002','2024-01-12','2024-02-12','0001-01-01',181.25,12.68,0.00,37.32,0.0000,'',0,0,0),(3,NULL,2,8,NULL,NULL,1,'0000000003','2024-01-12','2024-02-12','0001-01-01',170.50,0.00,0.00,0.00,0.0000,'',0,0,1),(4,NULL,2,8,NULL,NULL,1,'0000000004','2024-01-12','2024-02-11','0001-01-01',108.26,0.00,0.00,0.00,0.0000,'',0,0,0),(5,NULL,2,8,NULL,NULL,1,'0000000005','2024-01-12','2024-02-11','0001-01-01',200.00,0.00,0.00,0.00,0.0000,'',0,0,0),(6,NULL,2,8,NULL,NULL,1,'0000000006','2024-01-12','2024-02-12','0001-01-01',255.00,15.00,15.00,230.00,0.0000,'',0,0,0),(7,NULL,2,8,NULL,NULL,1,'0000000007','2024-01-12','2024-02-12','2024-01-12',100.00,0.00,15.00,115.00,0.0000,'',0,0,0),(8,NULL,2,8,NULL,NULL,1,'0000000008','2024-01-12','2024-02-12','0001-01-01',410.00,0.00,0.00,0.00,0.0000,'',0,0,0),(9,NULL,2,8,NULL,NULL,1,'0000000009','2024-01-12','2024-02-12','0001-01-01',115.00,0.00,0.00,0.00,0.0000,'',0,0,0),(10,NULL,2,8,NULL,NULL,1,'0000000010','2024-01-12','2024-02-12','0001-01-01',33.00,0.00,0.00,0.00,0.0000,'',0,0,0);
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
INSERT INTO `receber_categoria` VALUES (1,66,100.0000),(2,66,100.0000),(4,66,100.0000),(5,66,100.0000),(6,66,100.0000),(7,66,100.0000),(8,93,100.0000),(9,93,100.0000),(10,66,100.0000);
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
INSERT INTO `receber_conta_contabil` VALUES (1,66,1,4,100.0000,2),(1,66,2,2,100.0000,2),(2,66,10,4,100.0000,2),(2,66,12,2,100.0000,2),(4,66,4,2,100.0000,2),(4,66,10,3,100.0000,2),(5,66,4,2,100.0000,2),(5,66,10,3,100.0000,2),(6,66,1,2,100.0000,2),(6,66,2,3,100.0000,2),(7,66,1,2,100.0000,2),(7,66,2,3,100.0000,2),(8,93,4,4,100.0000,1),(8,93,5,3,100.0000,2),(8,93,12,2,100.0000,1),(8,93,14,1,100.0000,2),(9,93,4,4,100.0000,1),(9,93,5,3,100.0000,2),(9,93,12,2,100.0000,1),(9,93,14,1,100.0000,2),(10,66,5,2,100.0000,2),(10,66,5,3,100.0000,1),(10,66,6,2,100.0000,1),(10,66,37,4,100.0000,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
INSERT INTO `recebimento` VALUES (1,2,'2024-01-12',170.50,0.00,0.00,170.25,1),(2,2,'2024-01-12',181.25,0.00,5.00,25.00,1),(3,2,'2024-01-12',181.25,12.68,0.00,37.32,0),(4,1,'2024-01-12',308.26,8.26,0.00,300.00,1),(5,1,'2024-01-12',255.00,0.00,0.00,50.00,0),(6,1,'2024-01-12',205.00,0.00,15.00,120.00,0),(7,1,'2024-01-12',100.00,15.00,0.00,50.00,0),(8,1,'2024-01-12',35.00,0.00,0.00,10.00,0),(9,1,'2024-01-12',100.00,0.00,15.00,115.00,0);
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
INSERT INTO `recebimento_cancelado` VALUES (1,1,'2024-01-12'),(2,2,'2024-01-12'),(3,4,'2024-01-12'),(4,4,'2024-01-12');
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
INSERT INTO `recebimento_informado` VALUES (1,0,'2024-01-12 11:16:05','2024-01-12');
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
INSERT INTO `recebimento_receber_categoria` VALUES (1,66,170.25),(2,66,25.00),(3,66,37.32),(4,66,100.00),(5,66,200.00),(6,66,50.00),(7,66,120.00),(8,66,50.00),(9,66,10.00),(10,66,115.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria`
--

LOCK TABLES `regra_tributaria` WRITE;
/*!40000 ALTER TABLE `regra_tributaria` DISABLE KEYS */;
INSERT INTO `regra_tributaria` VALUES (1,'Produtos Monofasicos','P',1,0,'2024-01-12 11:12:46'),(2,'Serviços isentos','S',1,0,'2024-01-12 11:12:37'),(3,'Produtos Tributados','P',1,0,'2024-01-12 11:12:46'),(4,'Serviços Tributados','S',1,0,'2024-01-12 11:12:46'),(5,'Grupo excluido','P',0,1,'2024-01-12 11:12:46'),(6,'Substituição Tributárias','P',1,0,'2024-01-15 11:42:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regra_tributaria_operacao`
--

LOCK TABLES `regra_tributaria_operacao` WRITE;
/*!40000 ALTER TABLE `regra_tributaria_operacao` DISABLE KEYS */;
INSERT INTO `regra_tributaria_operacao` VALUES (1,1,1,0,'AC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(2,1,1,0,'AM','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(4,1,1,0,'BA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(5,1,1,0,'AL','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(6,1,1,0,'CE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(7,1,1,0,'DF','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(8,1,1,0,'ES','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(9,1,1,0,'GO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(10,1,1,0,'MA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(11,1,1,0,'MG','ICMS recolhido anteriormente por ST',5405,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(12,1,1,0,'MS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(13,1,1,0,'MT','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(14,1,1,0,'PA','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(15,1,1,0,'PB','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(16,1,1,0,'PE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(17,1,1,0,'PI','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(18,1,1,0,'PR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(19,1,1,0,'RJ','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(20,1,1,0,'RN','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(21,1,1,0,'RO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(22,1,1,0,'RR','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(23,1,1,0,'RS','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(24,1,1,0,'SC','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(25,1,1,0,'SE','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(26,1,1,0,'SP','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(27,1,1,0,'TO','ICMS recolhido anteriormente por ST',6403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(28,1,2,0,'MG','ICMS recolhido anteriormente por ST',1411,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','98',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(29,1,3,0,'MG','ICMS recolhido anteriormente por ST',1403,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'49','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','71',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(30,1,4,0,'MG','ICMS recolhido anteriormente por ST',5411,'500',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'99','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',12,''),(31,2,5,0,'','Isentos',0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,1,1,1.0000,0,3,1,'6209100','07',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',60,''),(32,3,6,2,'MG','Compra de Mercadorias Tributadas',1102,'00',0,100.0000,18.0000,0.0000,0.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03','',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'','',NULL,''),(33,4,7,2,'','Prestação de Serviço Tributada',0,'',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,6,1,3.0000,0,0,0,'6209100','01',1.6500,7.6000,1,0,0,0,0,0,1,'',0,0.0000,0.0000,0.0000,0.0000,'','',NULL,''),(34,4,6,2,'MG','Compra Tributada',1102,'00',0,100.0000,18.0000,0.0000,0.0000,0.0000,1,1,1,1,0,0.0000,0.0000,0.0000,1,1,1,1,1,0.0000,'03','',0.0000,1,1,1,1,0,0,0.0000,0,0,0,'','50',1.6500,7.6000,1,1,1,1,101,1,0,'',1,0.0000,0.0000,0.0000,0.0000,'','',NULL,''),(35,6,8,0,'MG','Venda com ST',5403,'90',0,0.0000,0.0000,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,0.0000,0.0000,0,0,0,0,0,0.0000,'','',0.0000,0,0,0,0,0,0,0.0000,0,0,0,'','99',0.0000,0.0000,0,0,0,0,0,0,0,'',0,0.0000,0.0000,0.0000,0.0000,'','',NULL,'');
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
INSERT INTO `regra_tributaria_operacao_empresa` VALUES (1,1),(1,2),(2,1),(2,2),(4,1),(4,2),(5,1),(5,2),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2),(9,1),(9,2),(10,1),(10,2),(11,1),(11,2),(12,1),(12,2),(13,1),(13,2),(14,1),(14,2),(15,1),(15,2),(16,1),(16,2),(17,1),(17,2),(18,1),(18,2),(19,1),(19,2),(20,1),(20,2),(21,1),(21,2),(22,1),(22,2),(23,1),(23,2),(24,1),(24,2),(25,1),(25,2),(26,1),(26,2),(27,1),(27,2),(28,1),(28,2),(29,1),(29,2),(30,1),(30,2),(31,1),(31,2),(32,1),(32,2),(33,1),(33,2),(34,1),(34,2),(35,2);
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
INSERT INTO `service_empresa` VALUES (1,2,2,2,'2024-01-15 11:41:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao`
--

LOCK TABLES `solicitacao` WRITE;
/*!40000 ALTER TABLE `solicitacao` DISABLE KEYS */;
INSERT INTO `solicitacao` VALUES (1,1,'2024-01-12 11:15:28','Solicitação CRUD',NULL,2,1,NULL,2,NULL,NULL,1,901,NULL,2,2,2,NULL,6,0,0,1,'2024-01-13 01:15:29',0,0),(2,1,'2024-01-12 11:16:06','Solicitação CRUD',NULL,2,1,NULL,3,NULL,NULL,1,901,NULL,2,2,2,NULL,1,0,0,1,'2024-01-13 01:16:06',0,0),(3,1,'2024-01-12 11:16:08','Solicitação CRUD',NULL,2,1,NULL,3,NULL,NULL,1,901,NULL,2,2,2,NULL,1,0,0,1,'2024-01-13 01:16:09',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_atividade`
--

LOCK TABLES `solicitacao_atividade` WRITE;
/*!40000 ALTER TABLE `solicitacao_atividade` DISABLE KEYS */;
INSERT INTO `solicitacao_atividade` VALUES (1,1,1,'2024-01-12 11:15:29',1,NULL,NULL,NULL,0,NULL,NULL,0,0,0,'0001-01-01 00:00:00',0,NULL,0,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,NULL,NULL,NULL),(2,1,1,'2024-01-12 11:15:30',3,NULL,NULL,NULL,6,NULL,NULL,0,0,0,'0001-01-01 00:00:00',0,NULL,0,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,NULL,NULL,NULL),(3,2,1,'2024-01-12 11:16:07',1,NULL,NULL,NULL,0,NULL,NULL,0,0,0,'0001-01-01 00:00:00',0,NULL,0,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,NULL,NULL,NULL),(4,3,1,'2024-01-12 11:16:09',1,NULL,NULL,NULL,0,NULL,NULL,0,0,0,'0001-01-01 00:00:00',0,NULL,0,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_comentario`
--

LOCK TABLES `solicitacao_comentario` WRITE;
/*!40000 ALTER TABLE `solicitacao_comentario` DISABLE KEYS */;
INSERT INTO `solicitacao_comentario` VALUES (1,1,1,'2024-01-12 11:15:30','Cancelamento da solicitação de CRUD',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_lista`
--

LOCK TABLES `solicitacao_lista` WRITE;
/*!40000 ALTER TABLE `solicitacao_lista` DISABLE KEYS */;
INSERT INTO `solicitacao_lista` VALUES (1,1,1,'2024-01-12 11:15:24','Lista de solicitações CRUD * alterado',1),(2,1,1,'2024-01-12 11:16:07','Lista de solicitações CRUD',0),(3,1,1,'2024-01-12 11:16:07','Lista de solicitações CRUD',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,2,'20230830.185603.069','2024-01-12 11:12:02','7e54743eb7d4c2060ed4f0022c31f375'),(2,1,'1.0.23.114','2024-01-15 11:41:30','daa6c87f182fce4d7b41d8dac29ea528');
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