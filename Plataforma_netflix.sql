CREATE DATABASE  IF NOT EXISTS `bd_netflix` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_netflix`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_netflix
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `cpf` varchar(20) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `dt_nsc` date DEFAULT NULL,
  `loc_nsc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES ('23367898632','Vin Disel','1980-06-05','Alabama'),('78526799900','Bruna Marquezine','1999-03-27','Brasil'),('99999999900','Roberto Carlos','1800-12-10','Brasil');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_video`
--

DROP TABLE IF EXISTS `artista_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_video` (
  `v_id` int(11) NOT NULL,
  `a_cpf` varchar(20) NOT NULL,
  PRIMARY KEY (`v_id`,`a_cpf`),
  KEY `a_cpf` (`a_cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_video`
--

LOCK TABLES `artista_video` WRITE;
/*!40000 ALTER TABLE `artista_video` DISABLE KEYS */;
INSERT INTO `artista_video` VALUES (1,'23367898632'),(2,'78526799900'),(3,'99999999900');
/*!40000 ALTER TABLE `artista_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao` (
  `u_cpf` varchar(20) DEFAULT NULL,
  `numero` varchar(15) NOT NULL,
  `cv` int(11) DEFAULT NULL,
  `bandeira` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `u_cpf` (`u_cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
INSERT INTO `cartao` VALUES ('12345678912','567777876',433,'master'),('98765432198','990066677',999,'BB'),('34567890232','617362781783',9868,'master');
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodio`
--

DROP TABLE IF EXISTS `episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temp` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `prox` int(11) DEFAULT NULL,
  `v_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prox` (`prox`),
  KEY `v_id` (`v_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodio`
--

LOCK TABLES `episodio` WRITE;
/*!40000 ALTER TABLE `episodio` DISABLE KEYS */;
INSERT INTO `episodio` VALUES (1,1,2,2,4,1),(2,1,2,NULL,5,1);
/*!40000 ALTER TABLE `episodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(20) DEFAULT NULL,
  `descricao` text,
  `v_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `v_id` (`v_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'comedia','um filme sobre 4 amigas que viajam para paris e bla bla bla',3),(2,'romance','um filme sobre um casal que se encontra em paris depois de muitos anos',1),(3,'terror','Tinha uma casa, e advinha? ela era assombrada por fantasmas',2);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_cpf` varchar(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `data_pg` date DEFAULT NULL,
  `mes_ref` varchar(10) DEFAULT NULL,
  `ano_ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_cpf` (`u_cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'12345678912',30.99,'2022-06-05','junho',2022),(2,'12345678912',30.99,'2022-05-05','maio',2022),(3,'12345678912',30.99,'2022-04-05','abril',2022),(4,'98765432198',30.99,'2022-01-15','janeiro',2022),(5,'98765432198',30.99,'2022-02-05','fevereiro',2022),(6,'98765432198',30.99,'2022-03-05','março',2022),(7,'34567890232',25.99,'2021-11-07','novembro',2021),(8,'34567890232',25.99,'2021-12-07','dezembro',2021),(9,'34567890232',27.99,'2022-01-08','janeiro',2022);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(20) DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES (1,'suspense','A doença','Quando uma grande doença ataca uma cidadezinha do interior o que será dos moradores?'),(2,'drama','A viagem no tempo','Uma mulher viaja no tempo e descobre um segredo terrivel');
/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` varchar(20) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `senha` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('12345678912','Elisa Gabriela','elisinha@gmail.com','@12345'),('98765432198','Taylor Swift','TS@gmail.com','19891213'),('34567890232','Lady Gaga','ladygaga@gmail.com','romance@');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_video`
--

DROP TABLE IF EXISTS `usuario_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_video` (
  `u_cpf` varchar(20) NOT NULL,
  `v_id` int(11) NOT NULL,
  `nota` float DEFAULT NULL,
  PRIMARY KEY (`u_cpf`,`v_id`),
  KEY `v_id` (`v_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_video`
--

LOCK TABLES `usuario_video` WRITE;
/*!40000 ALTER TABLE `usuario_video` DISABLE KEYS */;
INSERT INTO `usuario_video` VALUES ('12345678912',1,4.4),('98765432198',2,5),('34567890232',3,3);
/*!40000 ALTER TABLE `usuario_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cont` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'um grande amor','02:30:10',2010,NULL),(2,'casa assombrada','01:30:12',2020,NULL),(3,'uma viagemlouca','01:45:36',2014,NULL),(4,'descobertas','00:30:12',2021,NULL),(5,'lugares','00:45:18',2021,NULL);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-22 14:52:40
