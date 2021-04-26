-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: agcollege
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'uziel','garcia');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `ventas_id_venta` int(11) NOT NULL,
  `productos_id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(7,2) DEFAULT NULL,
  `precio` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ventas_id_venta`,`productos_id_producto`),
  KEY `fk_ventas_has_productos_productos1_idx` (`productos_id_producto`),
  KEY `fk_ventas_has_productos_ventas_idx` (`ventas_id_venta`),
  CONSTRAINT `fk_ventas_has_productos_productos1` FOREIGN KEY (`productos_id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_has_productos_ventas` FOREIGN KEY (`ventas_id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (2,2,4000,13.00,0.00),(4,2,2,8000.00,4000.00),(7,2,2,4000.00,0.00),(15,2,2,4000.00,0.00),(15,3,1,9000.00,0.00),(16,2,2,4000.00,0.00),(16,3,1,9000.00,0.00),(17,2,2,4000.00,0.00),(17,3,1,9000.00,0.00),(18,2,2,4000.00,0.00),(18,3,1,9000.00,0.00),(19,2,2,4000.00,0.00),(19,3,1,9000.00,0.00),(20,2,2,4000.00,0.00),(20,3,1,9000.00,0.00),(21,2,2,4000.00,0.00),(21,3,1,9000.00,0.00),(28,2,2,4000.00,0.00),(28,3,1,9000.00,0.00),(29,2,2,4000.00,0.00),(29,3,1,9000.00,0.00),(37,2,2,8000.00,4000.00),(37,3,1,9000.00,9000.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger calcularSubtotal
before insert on detalle_venta
for each row 
begin 
	set new.subtotal = new.precio * new.cantidad;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'celular',4000.00),(3,'pantalla 4k',9000.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `total` decimal(45,0) DEFAULT NULL,
  `clientes_id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_clientes1_idx` (`clientes_id_cliente`),
  CONSTRAINT `fk_ventas_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2021-04-22 15:37:18',NULL,1),(2,'2021-04-23 00:30:34',NULL,1),(3,'0000-00-00 00:00:00',NULL,1),(4,'0000-00-00 00:00:00',NULL,1),(5,'0000-00-00 00:00:00',NULL,1),(6,'0000-00-00 00:00:00',NULL,1),(7,'0000-00-00 00:00:00',NULL,1),(8,'2021-04-23 21:54:54',NULL,1),(9,'2021-04-23 21:55:31',NULL,1),(10,'2021-04-23 21:55:38',NULL,1),(11,'2021-04-23 21:55:49',NULL,1),(12,'2021-04-23 21:56:02',NULL,1),(13,'2021-04-23 21:57:04',NULL,1),(14,'2021-04-23 21:58:07',NULL,1),(15,'2021-04-23 21:59:36',NULL,1),(16,'2021-04-23 22:02:30',NULL,1),(17,'2021-04-23 23:05:23',NULL,1),(18,'2021-04-23 23:07:44',NULL,1),(19,'2021-04-23 23:11:34',NULL,1),(20,'2021-04-23 23:11:42',NULL,1),(21,'2021-04-23 23:13:09',NULL,1),(22,'2021-04-23 23:13:14',NULL,1),(23,'2021-04-23 23:13:43',NULL,1),(24,'2021-04-23 23:14:30',NULL,1),(25,'2021-04-23 23:14:46',NULL,1),(26,'2021-04-23 23:16:30',NULL,1),(27,'2021-04-23 23:16:49',NULL,1),(28,'2021-04-23 23:17:11',NULL,1),(29,'2021-04-23 23:20:14',NULL,1),(30,'2021-04-25 20:46:19',NULL,1),(31,'2021-04-25 20:46:54',NULL,1),(32,'2021-04-25 20:47:54',NULL,1),(33,'2021-04-25 20:48:42',NULL,1),(34,'2021-04-25 20:49:10',NULL,1),(35,'2021-04-25 20:50:16',NULL,1),(36,'2021-04-25 20:50:27',NULL,1),(37,'2021-04-25 20:50:50',NULL,1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 12:09:17
