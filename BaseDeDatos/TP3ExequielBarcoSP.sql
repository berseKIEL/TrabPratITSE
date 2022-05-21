CREATE DATABASE  IF NOT EXISTS `dbventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbventas`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbventas
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `ClienteNom` varchar(50) DEFAULT NULL,
  `ClienteEnable` int DEFAULT (1),
  `ClienteCorreo` varchar(60) NOT NULL,
  `ClienteDNI` varchar(9) NOT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE KEY `ClienteDNI` (`ClienteDNI`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Sol Luna',1,'solluna@gmail.com','400000001'),(2,'Exequiel Barco',1,'exequielbarco@gmail.com','42698355'),(3,'Esteban Trejo',1,'estebantrejo@gmail.com','400000002'),(4,'Hernan Peinetti',1,'hernanpeinetti@gmail.com','400000003'),(5,'Jose Adamo',1,'joseadamo@gmail.com','400000004'),(6,'Sergio Carabajal',1,'sergiocarabajal@gmail.com','400000005'),(8,'Barco Exequiel',1,'BarcoExequiel@gmail.com','411111111'),(10,'ActualizacionCliente',1,'ActualizacionCliente@gmail','40000017'),(11,'ClienteNuevo',1,'ClienteNuevo@gmail.com','40000020');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientesdelmes`
--

DROP TABLE IF EXISTS `clientesdelmes`;
/*!50001 DROP VIEW IF EXISTS `clientesdelmes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientesdelmes` AS SELECT 
 1 AS `DNI`,
 1 AS `Cliente`,
 1 AS `Correo`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `VentaID` int NOT NULL,
  `ProdID` int NOT NULL,
  `ProdCantidad` int NOT NULL,
  `ProdPrecioVenta` int NOT NULL,
  `VentaSubTotal` int NOT NULL,
  KEY `VentaID` (`VentaID`),
  KEY `ProdID` (`ProdID`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `venta` (`VentaID`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`ProdID`) REFERENCES `producto` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,1,69500,69500),(1,2,2,19800,39600),(2,3,1,17999,17999),(3,4,1,45000,45000),(4,5,2,2000,4000),(5,6,1,5050,5050),(6,5,2,2000,4000),(7,4,1,45000,45000),(8,3,1,17999,17999);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ProdID` int NOT NULL AUTO_INCREMENT,
  `ProdDesc` varchar(30) NOT NULL,
  `ProdMarca` varchar(30) NOT NULL,
  `ProdModelo` varchar(30) NOT NULL,
  `ProdPrecio` int NOT NULL,
  `ProdPrecioVenta` int NOT NULL,
  `ProdStock` int NOT NULL,
  PRIMARY KEY (`ProdID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Heladera','Gafa','22',54000,69500,10),(2,'Licuadora','Philips','XL',12500,19800,10),(3,'Microondas','Likon','Li20d-s20',12000,17999,10),(4,'Freezer Vertical','Siam','Fsi-cv90',40000,45000,10),(5,'Pava Electrica','OSR','7156',1000,2000,10),(6,'Secador','Revion','5230',4000,5050,13);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `VendedorID` int NOT NULL AUTO_INCREMENT,
  `VendedorNom` varchar(60) NOT NULL,
  PRIMARY KEY (`VendedorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `VentaID` int NOT NULL AUTO_INCREMENT,
  `VentaFecha` datetime DEFAULT NULL,
  `VendedorID` int NOT NULL,
  `ClienteID` int NOT NULL,
  PRIMARY KEY (`VentaID`),
  KEY `VendedorID` (`VendedorID`),
  KEY `ClienteID` (`ClienteID`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`VendedorID`) REFERENCES `vendedor` (`VendedorID`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ClienteID`) REFERENCES `cliente` (`ClienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2022-02-25 14:10:55',1,1),(2,'2022-02-26 14:15:30',2,2),(3,'2022-02-27 14:18:30',2,3),(4,'2022-02-28 12:10:55',1,4),(5,'2022-03-01 16:10:55',1,5),(6,'2022-03-01 18:10:55',1,6),(7,'2022-02-02 11:10:55',1,4),(8,'2022-02-03 08:10:55',2,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventamensual`
--

DROP TABLE IF EXISTS `ventamensual`;
/*!50001 DROP VIEW IF EXISTS `ventamensual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventamensual` AS SELECT 
 1 AS `CodigoVenta`,
 1 AS `Producto`,
 1 AS `Codigo de Producto`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventamensualmayor`
--

DROP TABLE IF EXISTS `ventamensualmayor`;
/*!50001 DROP VIEW IF EXISTS `ventamensualmayor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventamensualmayor` AS SELECT 
 1 AS `CodigoVenta`,
 1 AS `Producto`,
 1 AS `Codigo de Producto`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'dbventas'
--
/*!50003 DROP PROCEDURE IF EXISTS `BajaFacturaDeCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BajaFacturaDeCliente`(
in vVentaID int)
BEGIN

DELETE
FROM DetalleVenta
Where VentaID = vVentaID;

DELETE 
FROM Venta 
WHERE 
VentaID = vVentaID; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BajaFacturaDeCliente2Cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BajaFacturaDeCliente2Cursor`(in vVentaID INT)
BEGIN
DECLARE finCursor INT DEFAULT FALSE;
DECLARE IDVenta, IDProd, cantProd INT;

DECLARE Cursor1 CURSOR FOR SELECT VentaID, ProdID, ProdCantidad FROM
DetalleVenta WHERE VentaID = vVentaID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finCursor = TRUE;
OPEN Cursor1;
FETCH Cursor1 INTO IDVenta, IDProd, cantProd;

WHILE finCursor = FALSE DO
UPDATE Producto SET ProdStock = ProdStock + cantProd  WHERE ProdID = IDProd;
FETCH Cursor1 INTO IDVenta, IDProd, cantProd;
END WHILE;
DELETE FROM DetalleVenta WHERE VentaID = vVentaID;
DELETE FROM Venta WHERE VentaID = vVentaID;
CLOSE Cursor1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteActualizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteActualizacion`(
in parametro int,
in vClienteNom varchar(50),
in vClienteCorreo varchar(50),
in vClienteDNI varchar(9))
BEGIN

IF parametro = 1 THEN
call ClienteAlta(vClienteNom, vClienteCorreo, vClienteDNI);
END IF;

IF parametro = 2 THEN
call ClienteBaja(vClienteDNI);
END IF;

IF parametro = 3 THEN
call ClienteModif(vClienteNom, vClienteCorreo, vClienteDNI);
END IF;

IF parametro = 4 THEN
call ClienteConsulta(vClienteDNI);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteAlta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteAlta`(
in vClienteNom varchar(50),
in vClienteCorreo varchar(50),
in vClienteDNI varchar(9))
BEGIN
INSERT INTO
Cliente (ClienteNom, ClienteCorreo,ClienteDNI)
VALUES (vClienteNom, vClienteCorreo, vClienteDNI); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteBaja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteBaja`(
in vDNI varchar(9))
BEGIN
DELETE FROM
Cliente
WHERE ClienteDNI = vDNI; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteCantFacturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteCantFacturas`(
in vClienteDNI varchar(9))
BEGIN 
SELECT 
Cliente.ClienteDNI AS DNI,
Cliente.ClienteNom as Cliente,
Cliente.ClienteCorreo AS Correo,
count(VentaID) AS Facturas
FROM Venta
INNER JOIN Cliente ON Venta.ClienteID = cliente.ClienteId
WHERE Cliente.ClienteDNI = vClienteDNI;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteConsulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteConsulta`(
in vClienteDNI varchar(9))
BEGIN
SELECT
ClienteNom AS Cliente,
ClienteCorreo as Correo,
ClienteDNI as DNI
FROM cliente
WHERE ClienteDNI = vClienteDNI;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteInsertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteInsertar`(
in vClienteNom varchar(50),
in vClienteCorreo varchar(50),
in vClienteDNI varchar(9))
BEGIN
INSERT INTO
cliente (ClienteNom,ClienteCorreo,ClienteDNI)
VALUES (vClienteNom,vClienteCorreo,vClienteDNI); 
SELECT ClienteID AS ID FROM dbventas.cliente where ClienteDNI = vClienteDNI; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ClienteModif` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClienteModif`(
in vClienteNom varchar(50),
in vClienteCorreo varchar(50),
in vClienteDNI varchar(9))
BEGIN
UPDATE cliente
SET
ClienteNom = vClienteNom,
ClienteCorreo = vClienteCorreo,
ClienteDNI = vClienteDNI
WHERE ClienteDNI = vClienteDNI; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaProducto`(
in Filtro VARCHAR(30))
BEGIN
declare NombreSimilar varchar(30);
set NombreSimilar = Filtro;
SELECT ProdDesc AS Producto,
ProdStock as Stock
FROM Producto
WHERE ProdDesc LIKE NombreSimilar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientesdelmes`
--

/*!50001 DROP VIEW IF EXISTS `clientesdelmes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientesdelmes` AS select `cliente`.`ClienteDNI` AS `DNI`,`cliente`.`ClienteNom` AS `Cliente`,`cliente`.`ClienteCorreo` AS `Correo`,(select sum(`detalleventa`.`VentaSubTotal`)) AS `Total` from ((`venta` join `cliente` on((`venta`.`ClienteID` = `cliente`.`ClienteID`))) join `detalleventa` on((`detalleventa`.`VentaID` = `venta`.`VentaID`))) group by `Cliente` order by `Total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventamensual`
--

/*!50001 DROP VIEW IF EXISTS `ventamensual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventamensual` AS select `venta`.`VentaID` AS `CodigoVenta`,`producto`.`ProdDesc` AS `Producto`,`detalleventa`.`ProdID` AS `Codigo de Producto`,`detalleventa`.`ProdCantidad` AS `Cantidad` from ((`detalleventa` join `producto` on((`detalleventa`.`ProdID` = `producto`.`ProdID`))) join `venta` on((`detalleventa`.`VentaID` = `venta`.`VentaID`))) where (`venta`.`VentaFecha` between '2022/02/01' and '2022/03/01') order by `producto`.`ProdDesc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventamensualmayor`
--

/*!50001 DROP VIEW IF EXISTS `ventamensualmayor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventamensualmayor` AS select `venta`.`VentaID` AS `CodigoVenta`,`producto`.`ProdDesc` AS `Producto`,`detalleventa`.`ProdID` AS `Codigo de Producto`,`detalleventa`.`ProdCantidad` AS `Cantidad` from ((`detalleventa` join `producto` on((`detalleventa`.`ProdID` = `producto`.`ProdID`))) join `venta` on((`detalleventa`.`VentaID` = `venta`.`VentaID`))) where (`venta`.`VentaFecha` between '2022/02/01' and '2022/03/01') order by `detalleventa`.`ProdCantidad` desc */;
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

-- Dump completed on 2022-05-03 23:09:46
