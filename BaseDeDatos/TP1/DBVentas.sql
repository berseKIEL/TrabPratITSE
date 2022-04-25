/* CREACION DE LA BASE DE DATOS*/
CREATE DATABASE DBventas;
USE DBventas;

/*Creación de la tabla Producto*/
CREATE TABLE Producto
(ProdID INT NOT NULL AUTO_INCREMENT,
ProdDesc VARCHAR(30) NOT NULL,
ProdMarca VARCHAR(30) NOT NULL,
ProdModelo VARCHAR(30) NOT NULL,
ProdPrecio INT NOT NULL,
ProdPrecioVenta INT NOT NULL,
ProdStock INT NOT NULL,
PRIMARY KEY (ProdID));

/*Creación de la tabla Vendedor*/
CREATE TABLE Vendedor
(VendedorID INT NOT NULL AUTO_INCREMENT,
VendedorNom VARCHAR(60) NOT NULL,
PRIMARY KEY (VendedorID));

/*Creación de la tabla Cliente*/
CREATE TABLE Cliente
(ClienteID INT NOT NULL AUTO_INCREMENT,
ClienteNom VARCHAR(50),
ClienteEnable INT DEFAULT(1),
ClienteCorreo VARCHAR(60) NOT NULL,
ClienteDNI VARCHAR(9) NOT NULL UNIQUE, 
PRIMARY KEY (ClienteID));

/*Creación de la tabla Venta*/
CREATE TABLE Venta
(VentaID INT NOT NULL AUTO_INCREMENT,
VentaFecha DATETIME,
VendedorID INT NOT NULL,
ClienteID INT NOT NULL,
PRIMARY KEY (VentaID),
FOREIGN KEY (VendedorID) REFERENCES Vendedor (VendedorID),
FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID));

/*Creación de la tabla DetalleVenta*/

CREATE TABLE DetalleVenta
(VentaID INT NOT NULL,
ProdID INT NOT NULL,
ProdCantidad INT NOT NULL,
ProdPrecioVenta INT NOT NULL,
VentaSubTotal INT NOT NULL,
FOREIGN KEY (VentaID) REFERENCES Venta (VentaID),
FOREIGN KEY (ProdID) REFERENCES Producto (ProdID));

/* Carga en la tabla producto*/
INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Heladera','Gafa','22',54000,69500,10);

INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Licuadora','Philips','XL',12500,19800,10);

INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Microondas','Likon','Li20d-s20',12000,17999,10);

INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Freezer Vertical','Siam','Fsi-cv90',40000,45000,10);

INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Pava Electrica','OSR','7156',1000,2000,10);

INSERT INTO Producto
(ProdDesc,ProdMarca,ProdModelo,ProdPrecio,ProdPrecioVenta,ProdStock)
VALUES ('Secador','Revion','5230',4000,5050,10);


/* Carga en la tabla Cliente*/
INSERT INTO Cliente
(ClienteNom,ClienteCorreo,ClienteDNI)
VALUES ('Sol Luna','solluna@gmail.com',400000001);

INSERT INTO Cliente
(ClienteNom,ClienteCorreo,ClienteDNI)
VALUES ('Exequiel Barco','exequielbarco@gmail.com',42698355);

INSERT INTO Cliente
(ClienteNom,ClienteCorreo,ClienteDNI) 
VALUES ('Esteban Trejo','estebantrejo@gmail.com',400000002);

INSERT INTO Cliente
(ClienteNom,ClienteCorreo,ClienteDNI) 
VALUES ('Hernan Peinetti','hernanpeinetti@gmail.com',400000003);

INSERT INTO Cliente 
(ClienteNom,ClienteCorreo,ClienteDNI)
VALUES ('Jose Adamo','joseadamo@gmail.com',400000004);

INSERT INTO Cliente 
(ClienteNom,ClienteCorreo,ClienteDNI) 
VALUES ('Sergio Carabajal','sergiocarabajal@gmail.com',400000005);

/* Carga en la tabla Vendedor*/
INSERT INTO Vendedor (VendedorNom) VALUES ('Martin Claramonte');
INSERT INTO Vendedor (VendedorNom) VALUES ('Valentin Mema');

/* Carga en la tabla Venta*/
/* Se registra que el empleado 1 (Martin Claramonte) vendio al Cliente 1(Sol Luna)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-25 14:10:55',1,1);

/* Se registra que el empleado 2 (Valentin Mema) vendio al Cliente 2(Exequiel Barco)*/
INSERT INTO Venta 
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-26 14:15:30',2,2);

/* Se registra que el empleado 2 (Valentin Mema) vendio al Cliente 3 (Esteban Trejo)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-27 14:18:30',2,3);

/* Se registra que el empleado 1 (Martin Claramonte) vendio al Cliente 1(Hernan Peinetti)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-28 12:10:55',1,4);

/* Se registra que el empleado 1 (Martin Claramonte) vendio al Cliente 1(Jose Adamo)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-03-01 16:10:55',1,5);

/* Se registra que el empleado 1 (Martin Claramonte) vendio al Cliente 1(Sergio Carabajal)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-03-01 18:10:55',1,6);

/* Se registra que el empleado 1 (Martin Claramonte) vendio al Cliente 1(Hernan Peinetti)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-02 11:10:55',1,4);

/* Se registra que el empleado 2 (Valentin Mema) vendio al Cliente 1(Exequiel Barco)*/
INSERT INTO Venta
(VentaFecha,VendedorID,ClienteID)
VALUES ('2022-02-03 08:10:55',2,2); 
 
/* Carga en la tabla DetalleVenta*/
/* Se registra que en la venta 1 se vendio el producto 1 (heladera gafa 22) con un precio de 69500*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (1,1,1,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 1),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 1 se vendio dos veces el producto 2 (licuadora philips xl) al precio de 39600*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (1,2,2,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 2),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 2 se vendio el producto 3 al precio de 17999*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (2,3,1,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 3),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 3 se vendio el producto 4 al precio de 45000*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (3,4,1, (SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 4),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 4 se vendio el producto 5 al precio de 4000*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (4,5,2, (SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 5),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 5 se vendio el producto 6 al precio de 5050*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (5,6,1,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 6),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 6 se vendio el producto 5 al precio de 4000*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal)
VALUES (6,5,2, (SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 5),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 7 se vendio el producto 4 al precio de 45000*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal) 
VALUES (7,4,1,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 4),ProdPrecioVenta * ProdCantidad);

/* Se registra que en la venta 8 se vendio el producto 3 al precio de 17999*/
INSERT INTO DetalleVenta
(VentaID,ProdID,ProdCantidad,ProdPrecioVenta,VentaSubTotal) 
VALUES (8,3,1,(SELECT ProdPrecioVenta FROM Producto WHERE ProdID = 3),ProdPrecioVenta * ProdCantidad);
