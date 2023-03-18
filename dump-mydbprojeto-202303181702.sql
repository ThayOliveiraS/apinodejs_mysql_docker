-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydbprojeto
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idendereco` int NOT NULL AUTO_INCREMENT,
  `idtiposdelogradouros` int NOT NULL,
  `logradouro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bairro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`idendereco`),
  KEY `endereco_FK` (`idtiposdelogradouros`),
  CONSTRAINT `endereco_FK` FOREIGN KEY (`idtiposdelogradouros`) REFERENCES `tiposdelogradouros` (`idtiposdelogradouros`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,1,'Paulo Guedes','Jardins','São Paulo','SP'),(2,1,'Rio Branco','Jardins','São Paulo','SP'),(3,2,'Paraiso','Paulista','São Paulo','SP'),(4,3,'Aguia Pousou','Ribeirão','São Bernardo do Campo','SP'),(5,1,'Brasil','Pardal','Paraná','PR'),(6,2,'João de Barro','Bom Jesus','Salvador','BA');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `idpessoas` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idtiposdeclientes` int NOT NULL,
  `cep` varchar(100) NOT NULL,
  `idendereco` int NOT NULL,
  `numero` varchar(100) NOT NULL,
  `complemento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idpessoas`),
  KEY `pessoas_FK` (`idtiposdeclientes`),
  KEY `pessoas_FK_1` (`idendereco`),
  CONSTRAINT `pessoas_FK` FOREIGN KEY (`idtiposdeclientes`) REFERENCES `tiposdeclientes` (`idtiposdeclientes`),
  CONSTRAINT `pessoas_FK_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'Ana Maria da Silva','+55 11 94521-5002','mariazinhaa_@gmail.com',1,'',1,'',''),(2,'Luiz Carlos Abreu','+55 32 98712-6397','carlinhosabreeu@gmail.com',2,'',1,'',''),(3,'Paulo Henrique de Souza','+ 55 44 97132-5310','hpsouzaa@yahoo.com.br',3,'',1,'',''),(4,'Katia Almeida','+55119745136514','almeida_k@bol.com.br',2,'08325-100',2,'325','Apto 45'),(5,'Thiago Alves','+5511974513694','thiagooal@gmail.com',1,'01785-610',3,'152',' '),(6,'Alfredo Polinesio','+5511989713201','afpolinesio1@gmail.com',3,'21078-025',4,'21','sala 4'),(7,'Alice Antunes','+552297134-0281','aantunes@hotmail.com',2,'91235-132',2,'524',''),(8,'Antonio Nunes','+554497413-0391','nunesan@gmail.com',2,'03912-312',5,'798','Bloco 9 Apto 31'),(9,'Brenda Oliveira','+55 71 94531-8930','brendinhaoliv@outlook.com',3,'58312-012',6,'013','Sala 2');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdeclientes`
--

DROP TABLE IF EXISTS `tiposdeclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdeclientes` (
  `idtiposdeclientes` int NOT NULL AUTO_INCREMENT,
  `tipos` varchar(100) NOT NULL,
  PRIMARY KEY (`idtiposdeclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdeclientes`
--

LOCK TABLES `tiposdeclientes` WRITE;
/*!40000 ALTER TABLE `tiposdeclientes` DISABLE KEYS */;
INSERT INTO `tiposdeclientes` VALUES (1,'Preferencial'),(2,'Padrão'),(3,'Empresarial');
/*!40000 ALTER TABLE `tiposdeclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdelogradouros`
--

DROP TABLE IF EXISTS `tiposdelogradouros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdelogradouros` (
  `idtiposdelogradouros` int NOT NULL AUTO_INCREMENT,
  `tipos` varchar(100) NOT NULL,
  PRIMARY KEY (`idtiposdelogradouros`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdelogradouros`
--

LOCK TABLES `tiposdelogradouros` WRITE;
/*!40000 ALTER TABLE `tiposdelogradouros` DISABLE KEYS */;
INSERT INTO `tiposdelogradouros` VALUES (1,'Avenida'),(2,'Rua'),(3,'Alameda');
/*!40000 ALTER TABLE `tiposdelogradouros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydbprojeto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 17:02:51
