/* CREACION DE LA BASE DE DATOS*/
CREATE DATABASE DBventas;
USE DBventas;


/* Modificaciones */
/*Realizar el cambio del precio de venta del producto código 5, aumentando un 10% */
UPDATE Producto
SET ProdPrecioVenta = ProdPrecioVenta * 1.10
WHERE ProdID = 5;
/*Aumentar el precio de todas las Heladeras un 5% */
UPDATE Producto
SET ProdPrecioVenta = ProdPrecioVenta * 1.05
WHERE ProdDesc
LIKE '%Heladera%';

/* Listados */
/* Listar todos los clientes activos ordenados por nombre. */
SELECT ClienteDNI, ClienteNom
FROM cliente
WHERE ClienteEnable= 1
ORDER BY ClienteNom ASC;

/*Listar todos los productos ordenados por nombre indicando
precio de compra, precio de venta y stock.*/
SELECT ProdDesc as 'Nombre de Producto' , ProdPrecio as 'Precio de Compra', ProdPrecioVenta as 'Precio de Venta', ProdStock as 'Stock del producto'
From Producto
Order BY ProdDesc;

/* Listar el comprobante de venta (factura) cuyo código es 10. */
SELECT Cliente.ClienteNom as 'Cliente:',
Cliente.ClienteDNI as 'DNI:',
Producto.ProdDesc as 'Producto:',
DetalleVenta.ProdCantidad as 'Cantidad',
DetalleVenta.ProdPrecioVenta as 'Precio de Venta individual:',
DetalleVenta.VentaSubTotal as 'Subtotal:',
Vendedor.VendedorNom as 'Vendedor:'
FROM DetalleVenta
INNER JOIN Venta ON Venta.VentaID = DetalleVenta.VentaID
INNER JOIN Producto On Producto.ProdID = detalleventa.ProdID
INNER JOIN Cliente ON Venta.ClienteID = Cliente.ClienteID 
INNER JOIN Vendedor ON Venta.VendedorID = Vendedor.VendedorID
WHERE Venta.VentaID = 8;

/* Bajas
Comento las lineas debido a que sino lanzaria los errores al ejecutar el archivo */

/*Intentar la baja de un cliente, por ejemplo “Luna Sol”
DELETE FROM Cliente
WHERE ClienteNom = 'Sol Luna';

 Resultado:
 Error de SQL (1451): Cannot delete or update a parent row: a foreign key constraint fails (`dbventas`.`venta`, CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`ClienteID`) REFERENCES `cliente` (`ClienteID`))
/*


/* Intentar la baja del producto “Heladera Gafa 22”.
DELETE FROM producto
WHERE ProdDesc = 'Heladera'
AND ProdMarca = 'Gafa';

 Resultado:
 Error de SQL (1451): Cannot delete or update a parent row: a foreign key constraint fails (`dbventas`.`detalleventa`, CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`ProdID`) REFERENCES `producto` (`ProdID`))
*/

/*Baja de la factura código 10. 
DELETE FROM Venta
WHERE VentaID = 8;

 Resultado:
 /* Error de SQL (1451): Cannot delete or update a parent row: a foreign key constraint fails (`dbventas`.`detalleventa`, CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `venta` (`VentaID`)) 

Para lograr borrar la factura del codigo 10 primero se debe:
DELETE FROM DetalleVenta
Where VentadID = 8;
Debido a que utiliza como clave foranea a la VENTAID
*/

 
/* Vistas */

/*Crear la vista “VentaMensual” que muestre el código, nombre y cantidad vendida de un mes y año determinado ordenado por nombre de producto.*/
CREATE VIEW VentaMensual AS
SELECT Venta.VentaID as CodigoVenta,
Producto.ProdDesc as Producto,
DetalleVenta.ProdID as 'Codigo de Producto',
DetalleVenta.ProdCantidad as Cantidad
FROM DetalleVenta
INNER JOIN producto ON detalleventa.prodid = producto.prodid
INNER JOIN Venta on detalleventa.ventaid = venta.ventaid
WHERE venta.ventafecha BETWEEN '2022/02/01' and '2022/03/01' 
ORDER BY Producto.ProdDesc;

SELECT * FROM VentaMensual;

/* Crear la vista “VentaMensualMayor” que muestre el código, nombre y cantidad vendida de un mes y año determinado ordenado por cantidad vendida, (primero la mayor cantidad).*/
CREATE VIEW VentaMensualMayor AS
SELECT Venta.VentaID as CodigoVenta,
Producto.ProdDesc as Producto,
DetalleVenta.ProdID as 'Codigo de Producto',
DetalleVenta.ProdCantidad as Cantidad
FROM DetalleVenta
INNER JOIN producto ON detalleventa.prodid = producto.prodid
INNER JOIN Venta on detalleventa.ventaid = venta.ventaid
WHERE venta.ventafecha BETWEEN '2022/02/01' and '2022/03/01' 
ORDER BY Cantidad DESC;

SELECT * FROM VentaMensualMayor;

/*Crear la vista “ClientesDelMes” que muestre los 10 primeros clientes que mayor compra en pesos realizaron. Mostrar Documento, nombre, correo, monto. (ordenado por monto)*/
CREATE VIEW ClientesDelMes AS
SELECT Cliente.ClienteDNI as DNI,
Cliente.ClienteNom as Cliente,
Cliente.ClienteCorreo as Correo,
(SELECT SUM(DetalleVenta.VentaSubTotal)) AS Total
FROM Venta
INNER JOIN Cliente ON Venta.ClienteID = Cliente.ClienteID
Inner JOIN DetalleVenta ON DetalleVenta.VentaID = Venta.VentaID
GROUP BY Cliente
ORDER BY TOTAL desc;

SELECT * FROM ClientesDelMes;
