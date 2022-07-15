-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbparcial1barcoexequiel
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ClienteID` int(11) NOT NULL AUTO_INCREMENT,
  `ClienteDNI` int(10) NOT NULL,
  `ClienteNom` varchar(50) DEFAULT NULL,
  `ClienteCorreo` varchar(60) NOT NULL,
  `ClienteEnable` int(11) DEFAULT 1,
  PRIMARY KEY (`ClienteID`),
  UNIQUE KEY `ClienteDNI` (`ClienteDNI`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,400000001,'Sol Luna','solluna@gmail.com',1),(2,42698355,'Exequiel Barco','exequielbarco@gmail.com',1),(3,400000002,'Esteban Trejo','estebantrejo@gmail.com',1),(4,400000003,'Hernan Peinetti','hernanpeinetti@gmail.com',1),(5,400000004,'Jose Adamo','joseadamo@gmail.com',1),(6,400000005,'Sergio Carabajal','sergiocarabajal@gmail.com',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logtransaciones`
--

DROP TABLE IF EXISTS `logtransaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logtransaciones` (
  `LogId` int(11) NOT NULL AUTO_INCREMENT,
  `LogCodigo` int(11) DEFAULT NULL,
  `LogDescripcion` varchar(45) DEFAULT NULL,
  `LogFecha` timestamp NULL DEFAULT NULL,
  `LogUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logtransaciones`
--

LOCK TABLES `logtransaciones` WRITE;
/*!40000 ALTER TABLE `logtransaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `logtransaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `PedId` int(11) NOT NULL AUTO_INCREMENT,
  `ProdID` int(11) NOT NULL,
  `PedFecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PedCantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`PedId`),
  KEY `ProdID` (`ProdID`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ProdID`) REFERENCES `producto` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `ProdID` int(11) NOT NULL AUTO_INCREMENT,
  `ProdDesc` varchar(30) NOT NULL,
  `ProdMarca` varchar(30) NOT NULL,
  `ProdModelo` varchar(30) NOT NULL,
  `ProdPrecio` int(11) NOT NULL,
  `ProdPrecioVenta` int(11) NOT NULL,
  `ProdStock` int(11) NOT NULL,
  `ProvID` int(11) NOT NULL,
  `ProdPtoReposicion` int(11) DEFAULT NULL,
  `rubroId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProdID`),
  KEY `ProvID` (`ProvID`),
  KEY `rubro_ibfk_1_idx` (`rubroId`),
  KEY `index_Producto` (`ProdID`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ProvID`) REFERENCES `proveedor` (`ProvID`),
  CONSTRAINT `rubro_ibfk_1` FOREIGN KEY (`rubroId`) REFERENCES `rubro` (`rubroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Heladera','Gafa','22',54000,69500,21,242424241,15,1),(2,'Lavarropa','Philips','XL',12500,19800,11,242424241,15,2),(3,'Microondas','Likon','Li20d-s20',12000,17999,10,242424241,10,3),(4,'Freezer Vertical','Siam','Fsi-cv90',40000,45000,7,242424242,5,1),(5,'Pava Electrica','OSR','7156',1000,2000,7,242424242,10,4),(6,'Secaropa','Revion','5230',4000,5050,7,242424242,10,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tr_ModificacionPrecio after update on Producto for each row
begin 
if new.prodprecioventa < old.prodprecioventa then 
INSERT INTO LogTransaciones 
(logCodigo, logdescripcion, logfecha, logusuario)  
values 
(new.ProdID, old.ProdDesc, now(),current_user());
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `ProvID` int(11) NOT NULL,
  `ProvNombre` varchar(50) NOT NULL,
  `ProvDireccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ProvID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (242424241,'Semic','Calle 123'),(242424242,'ELIT S.A','Calle 222');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubro` (
  `rubroId` int(11) NOT NULL AUTO_INCREMENT,
  `rubroDescripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`rubroId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
INSERT INTO `rubro` VALUES (1,'Heladeras'),(2,'Lavarropas'),(3,'Cocinas'),(4,'Pequenios Electrodomesticos');
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `VendedorID` int(11) NOT NULL AUTO_INCREMENT,
  `VendedorNombre` varchar(60) NOT NULL,
  PRIMARY KEY (`VendedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Martin Claramonte'),(2,'Valentin Mema');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `VentaID` int(11) NOT NULL AUTO_INCREMENT,
  `VentaFecha` datetime DEFAULT NULL,
  `VendedorID` int(11) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  PRIMARY KEY (`VentaID`),
  KEY `VendedorID` (`VendedorID`),
  KEY `ClienteID` (`ClienteID`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`VendedorID`) REFERENCES `vendedor` (`VendedorID`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ClienteID`) REFERENCES `cliente` (`ClienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2022-02-25 14:10:55',1,1),(2,'2022-02-26 14:15:30',2,2),(3,'2022-02-27 14:18:30',2,3),(4,'2022-02-28 12:10:55',1,4),(5,'2022-03-01 16:10:55',1,5),(6,'2022-03-01 18:10:55',1,6),(7,'2022-02-02 11:10:55',1,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventadetalle`
--

DROP TABLE IF EXISTS `ventadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventadetalle` (
  `VentaDetID` int(11) NOT NULL AUTO_INCREMENT,
  `VentaID` int(11) NOT NULL,
  `ProdID` int(11) NOT NULL,
  `VentaDetCantidad` int(11) NOT NULL,
  `VentaDetPrecio` int(11) NOT NULL,
  `VentaDetSubTotal` int(11) NOT NULL,
  PRIMARY KEY (`VentaDetID`),
  KEY `VentaID` (`VentaID`),
  KEY `ProdID` (`ProdID`),
  CONSTRAINT `ventadetalle_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `venta` (`VentaID`),
  CONSTRAINT `ventadetalle_ibfk_2` FOREIGN KEY (`ProdID`) REFERENCES `producto` (`ProdID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventadetalle`
--

LOCK TABLES `ventadetalle` WRITE;
/*!40000 ALTER TABLE `ventadetalle` DISABLE KEYS */;
INSERT INTO `ventadetalle` VALUES (1,1,1,1,69500,69500),(2,1,2,2,19800,39600),(3,2,3,1,17999,17999),(4,3,4,1,45000,45000),(5,4,5,2,2000,4000),(6,4,6,1,5050,5050),(7,5,5,2,2000,4000),(8,6,4,1,45000,45000),(9,7,5,2,2000,4000);
/*!40000 ALTER TABLE `ventadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vtotalproductosporrubro1`
--

DROP TABLE IF EXISTS `vtotalproductosporrubro1`;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtotalproductosporrubro1` (
  `Producto ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Rubro` tinyint NOT NULL,
  `Stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtotalproductosporrubro2`
--

DROP TABLE IF EXISTS `vtotalproductosporrubro2`;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtotalproductosporrubro2` (
  `ID Rubro` tinyint NOT NULL,
  `Rubro` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtotalproductosporrubro3`
--

DROP TABLE IF EXISTS `vtotalproductosporrubro3`;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtotalproductosporrubro3` (
  `Producto ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Rubro` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vtotalproductosporrubro1`
--

/*!50001 DROP TABLE IF EXISTS `vtotalproductosporrubro1`*/;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vtotalproductosporrubro1` AS select `producto`.`ProdID` AS `Producto ID`,`producto`.`ProdDesc` AS `Producto`,`rubro`.`rubroDescripcion` AS `Rubro`,`producto`.`ProdStock` AS `Stock` from (`producto` join `rubro`) where `producto`.`rubroId` = `rubro`.`rubroId` group by `rubro`.`rubroId` order by `producto`.`ProdStock` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtotalproductosporrubro2`
--

/*!50001 DROP TABLE IF EXISTS `vtotalproductosporrubro2`*/;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vtotalproductosporrubro2` AS select `rubro`.`rubroId` AS `ID Rubro`,`rubro`.`rubroDescripcion` AS `Rubro`,sum(`ventadetalle`.`VentaDetCantidad`) AS `Cantidad` from ((`ventadetalle` join `producto` on(`ventadetalle`.`ProdID` = `producto`.`ProdID`)) join `rubro` on(`rubro`.`rubroId` = `producto`.`rubroId`)) group by `ventadetalle`.`ProdID` order by sum(`ventadetalle`.`VentaDetCantidad`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtotalproductosporrubro3`
--

/*!50001 DROP TABLE IF EXISTS `vtotalproductosporrubro3`*/;
/*!50001 DROP VIEW IF EXISTS `vtotalproductosporrubro3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vtotalproductosporrubro3` AS select `producto`.`ProdID` AS `Producto ID`,`producto`.`ProdDesc` AS `Producto`,`rubro`.`rubroDescripcion` AS `Rubro`,sum(`ventadetalle`.`VentaDetCantidad`) AS `cantidad` from (((`ventadetalle` join `producto` on(`ventadetalle`.`ProdID` = `producto`.`ProdID`)) join `venta` on(`venta`.`VentaID` = `ventadetalle`.`VentaID`)) join `rubro` on(`rubro`.`rubroId` = `producto`.`rubroId`)) group by `ventadetalle`.`ProdID` order by sum(`ventadetalle`.`VentaDetCantidad`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 12:23:48
