-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sisgeradv
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `idProcesso` int(11) DEFAULT NULL,
  `idCpf` int(11) DEFAULT NULL,
  `idCnpj` int(11) DEFAULT NULL,
  `idEndereco` int(11) DEFAULT NULL,
  `idContato` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_clientes_processos` (`idProcesso`),
  KEY `FK_clientes_pessoafisica` (`idCpf`),
  KEY `FK_clientes_pessoajuridica` (`idCnpj`),
  KEY `FK_clientes_endereco` (`idEndereco`),
  KEY `FK_clientes_contato` (`idContato`),
  CONSTRAINT `FK_clientes_contato` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idContato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_pessoafisica` FOREIGN KEY (`idCpf`) REFERENCES `pessoafisica` (`idCpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_pessoajuridica` FOREIGN KEY (`idCnpj`) REFERENCES `pessoajuridica` (`idCnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_clientes_processos` FOREIGN KEY (`idProcesso`) REFERENCES `processos` (`idProcesso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contato` (
  `idContato` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `numEndereco` varchar(10) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `uf` tinyint(4) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeiro`
--

DROP TABLE IF EXISTS `financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeiro` (
  `idFinanceiro` int(11) NOT NULL AUTO_INCREMENT,
  `receita` int(11) DEFAULT NULL,
  `despesa` int(11) DEFAULT NULL,
  `balanço` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFinanceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeiro`
--

LOCK TABLES `financeiro` WRITE;
/*!40000 ALTER TABLE `financeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgaos`
--

DROP TABLE IF EXISTS `orgaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgaos` (
  `idOrgao` int(11) NOT NULL AUTO_INCREMENT,
  `nomeOrgao` varchar(50) NOT NULL,
  `numOrgao` int(10) NOT NULL,
  `vara` varchar(30) NOT NULL DEFAULT '',
  `turma` varchar(20) NOT NULL DEFAULT '',
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idOrgao`),
  KEY `FK_orgaos_endereco` (`idEndereco`),
  CONSTRAINT `FK_orgaos_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgaos`
--

LOCK TABLES `orgaos` WRITE;
/*!40000 ALTER TABLE `orgaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoafisica` (
  `idCpf` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(50) NOT NULL,
  `sexo` tinyint(4) NOT NULL,
  `numCtps` varchar(50) NOT NULL,
  `serieCtps` varchar(50) NOT NULL,
  `tratamento` tinyint(4) NOT NULL,
  `estadoCivil` tinyint(4) NOT NULL,
  `nacionalidade` varchar(50) NOT NULL,
  `profissao` varchar(50) NOT NULL,
  `codMatricula` varchar(50) NOT NULL,
  `dtNascimento` date NOT NULL,
  `tituloEleitor` varchar(50) NOT NULL,
  `idtCivil` varchar(50) NOT NULL,
  `orgExpeditor` varchar(50) NOT NULL,
  `dtExpedicao` date NOT NULL,
  PRIMARY KEY (`idCpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoajuridica` (
  `idCnpj` int(11) NOT NULL,
  `numCnpj` varchar(50) DEFAULT NULL,
  `inscMunicipal` varchar(50) DEFAULT NULL,
  `inscEstadual` varchar(50) DEFAULT NULL,
  `codCnpj` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processos`
--

DROP TABLE IF EXISTS `processos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processos` (
  `idProcesso` int(11) NOT NULL AUTO_INCREMENT,
  `pasta` varchar(50) DEFAULT NULL,
  `numInicia` int(30) DEFAULT NULL,
  `numPrincipal` int(30) DEFAULT NULL,
  `parteContraria` varchar(100) DEFAULT NULL,
  `numProcesso` int(30) DEFAULT NULL,
  `ultAndamento` date DEFAULT NULL,
  `compPendente` text,
  `instInicial` varchar(50) DEFAULT NULL,
  `dtDistribuicao` date DEFAULT NULL,
  `fase` varchar(50) DEFAULT NULL,
  `acao` tinyint(4) DEFAULT NULL,
  `natureza` tinyint(4) DEFAULT NULL,
  `rito` tinyint(4) DEFAULT NULL,
  `posicaoCliente` tinyint(4) DEFAULT NULL,
  `advContrario` varchar(100) DEFAULT NULL,
  `titulo` text,
  `idOrgao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProcesso`),
  KEY `FK_processos_orgaos` (`idOrgao`),
  CONSTRAINT `FK_processos_orgaos` FOREIGN KEY (`idOrgao`) REFERENCES `orgaos` (`idOrgao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processos`
--

LOCK TABLES `processos` WRITE;
/*!40000 ALTER TABLE `processos` DISABLE KEYS */;
/*!40000 ALTER TABLE `processos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `sobrenome` varchar(60) DEFAULT NULL,
  `idCpf` int(11) DEFAULT NULL,
  `idCnpj` int(11) DEFAULT NULL,
  `idEndereco` int(11) DEFAULT NULL,
  `idContato` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_usuarios_pessoafisica` (`idCpf`),
  KEY `FK_usuarios_pessoajuridica` (`idCnpj`),
  KEY `FK_usuarios_contato` (`idContato`),
  KEY `FK_usuarios_endereco` (`idEndereco`),
  CONSTRAINT `FK_usuarios_contato` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idContato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_pessoafisica` FOREIGN KEY (`idCpf`) REFERENCES `pessoafisica` (`idCpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuarios_pessoajuridica` FOREIGN KEY (`idCnpj`) REFERENCES `pessoajuridica` (`idCnpj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 15:33:32
