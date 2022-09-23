-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: oficinamecanica
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `idCarro` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`idCarro`),
  UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  KEY `IdCliente_idx` (`IdCliente`),
  CONSTRAINT `IdCliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,'QSE-1234','LOGAN','RENAULT',3),(2,'QWW-5685','GOL','WOLKS',4);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CPF` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'Maria','1111111111111111111'),(4,'Leo','222222222222222');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'TROCA PNEUS'),(2,'TROCA OLEO');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Endereco` varchar(45) NOT NULL,
  `Especialidade` varchar(45) NOT NULL,
  `IdEquipe` int NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  KEY `IdEquipe_idx` (`IdEquipe`),
  CONSTRAINT `IdEq` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'THAMY','COSMOS','MECANICO',1),(2,'TAY','SANTA CRUZ','MECANICO',2),(3,'LARI','BANGU','MECANICO',1),(4,'MIGUEL','MARGARIDA','MECANICO',2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico` (
  `idOrdem_Servico` int NOT NULL AUTO_INCREMENT,
  `DataEmissao` datetime NOT NULL,
  `DataConclusao` datetime NOT NULL,
  `Status` enum('Aguardando','Aprovado','Reprovada') NOT NULL DEFAULT 'Aguardando',
  `IdCarro` int NOT NULL,
  `IdEquipe` int DEFAULT NULL,
  PRIMARY KEY (`idOrdem_Servico`),
  KEY `IdCarro_idx` (`IdCarro`),
  KEY `IdEquipe_idx` (`IdEquipe`),
  CONSTRAINT `IdCarro` FOREIGN KEY (`IdCarro`) REFERENCES `carro` (`idCarro`),
  CONSTRAINT `IdEquipe` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (2,'2022-09-23 00:00:00','2022-09-25 00:00:00','Aguardando',1,1),(3,'2022-09-23 00:00:00','2022-09-25 00:00:00','Aguardando',2,2);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `idPecas` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`idPecas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (1,'Pneu',90),(2,'Oleo',25);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecasutilizadas`
--

DROP TABLE IF EXISTS `pecasutilizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecasutilizadas` (
  `idPecasUtilizadas` int NOT NULL AUTO_INCREMENT,
  `Qtd` varchar(45) NOT NULL DEFAULT '1',
  `IdPecas` int DEFAULT NULL,
  `IdOS` int DEFAULT NULL,
  PRIMARY KEY (`idPecasUtilizadas`),
  KEY `IdPecas_idx` (`IdPecas`),
  KEY `IdOS_idx` (`IdOS`),
  CONSTRAINT `IdOS` FOREIGN KEY (`IdOS`) REFERENCES `ordem_servico` (`idOrdem_Servico`),
  CONSTRAINT `IdPecas` FOREIGN KEY (`IdPecas`) REFERENCES `pecas` (`idPecas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecasutilizadas`
--

LOCK TABLES `pecasutilizadas` WRITE;
/*!40000 ALTER TABLE `pecasutilizadas` DISABLE KEYS */;
INSERT INTO `pecasutilizadas` VALUES (3,'4',1,2),(4,'2',2,3);
/*!40000 ALTER TABLE `pecasutilizadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicorealizado`
--

DROP TABLE IF EXISTS `servicorealizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicorealizado` (
  `idServicoRealizado` int NOT NULL AUTO_INCREMENT,
  `IdServico` int NOT NULL,
  `IdOS` int NOT NULL,
  PRIMARY KEY (`idServicoRealizado`),
  KEY `IdServico_idx` (`IdServico`),
  KEY `IdOSs_idx` (`IdOS`),
  CONSTRAINT `IdOSs` FOREIGN KEY (`IdOS`) REFERENCES `servicos` (`idServicos`),
  CONSTRAINT `IdServico` FOREIGN KEY (`IdServico`) REFERENCES `servicos` (`idServicos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicorealizado`
--

LOCK TABLES `servicorealizado` WRITE;
/*!40000 ALTER TABLE `servicorealizado` DISABLE KEYS */;
INSERT INTO `servicorealizado` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `servicorealizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `idServicos` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`idServicos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'Troca Pneu',100),(2,'Troca Oleo',50);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-23  1:05:36
