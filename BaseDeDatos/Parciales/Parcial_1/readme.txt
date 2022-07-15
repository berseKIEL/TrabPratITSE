ITSE - TECNICATURA SUPERIOR EN  PROGRAMACIÓN
Base de Datos II
Parcial I - Práctica - 24/05/22
Apellido y Nombre: Barco, Exequiel


Nota: descargar e importar la base de datos dbPar1.sql desde la plataforma.  (Crear la db antes de importar)
Debajo de cada item escriba o pegue solo la sentencia ejecutada para resolver dicho item.


1) Crear la vista vTotalProductosPorRubro con los siguientes campos: NomRubro, Cantidad.  Ordenada por cantidad descendente.
(10 puntos)
Respuestas:
Primera Forma:
(Ordenada por productoStock)
CREATE VIEW vTotalProductosPorRubro1 AS 
SELECT
Producto.ProdID as 'Producto ID',
Producto.ProdDesc as 'Producto',
Rubro.rubroDescripcion as 'Rubro',
Producto.prodStock as 'Stock'
From Producto, Rubro
WHERE  Producto.RubroID = Rubro.RubroID
GROUP BY Rubro.RubroID
Order BY prodStock DESC;

Segunda Forma:
(Ordenada por cantidad vendida en ventadetalle)
CREATE VIEW vTotalProductosPorRubro2 AS
SELECT
rubro.rubroid as 'ID Rubro',
rubro.rubroDescripcion 'Rubro',
SUM(VentaDetCantidad) AS Cantidad
FROM ventadetalle
inner join producto on ventadetalle.ProdID=Producto.ProdID
INNER JOIN rubro on rubro.rubroID=producto.rubroID
group by ventadetalle.ProdID
ORDER BY Cantidad DESC;

Tercera Forma:
(Ordenada por cantidad vendida en ventadetalle, ademas de mostrar el producto más vendido)
create view vTotalProductosPorRubro3 as
select
producto.prodid as 'Producto ID',
producto.proddesc as 'Producto',
rubro.rubrodescripcion as 'Rubro',
sum(ventadetalle.VentaDetCantidad) as cantidad
from ventadetalle
inner join producto on ventadetalle.prodid = producto.prodid
inner join venta on venta.ventaid = ventadetalle.ventaid
inner join rubro on rubro.rubroid = producto.rubroid
group by ventadetalle.prodid
order by cantidad desc ;



2) Varias consultas que se realizan para obtener la estadística de los productos más vendidos por periodo de tiempo experimentan una demora significativa.
Plantee una solución al respecto indicando las sentencias que ejecutaría.
(10 puntos)
Respuesta:
La creación de un Index en el id del producto ayudaría a que la consulta se mas rapida, permitiendo que se ejecute mas rapida la consulta que se realiza por periodo de tiempo.

En este caso se crearía el index:
CREATE INDEX index_Producto ON producto(ProdID ASC);
SHOW INDEX FROM producto;


3) Crear un Trigger  “tr_ModificacionPrecio”  que agregue un registro en LogTransaciones cuando se modifique el precio de un producto por un valor menor al existente.
(código, descripción, fecha, usuario) en descripción “valor anterior: nnnn”
(10 puntos)
delimiter //
create trigger tr_ModificacionPrecio after update on Producto for each row
begin 
if new.prodprecioventa < old.prodprecioventa then 
INSERT INTO LogTransaciones 
(logCodigo, logdescripcion, logfecha, logusuario)  
values 
(new.ProdID, old.ProdDesc, now(),current_user());
end if;
end //
delimiter ;


4) Crear un SP  “sp_ModifCantProd”  que permita modificar la cantidad vendida de un producto en una factura, y actualice el stock. 
(20 puntos)
DELIMITER //
create procedure sp_ModifCantProd
(in pIDVenta int,
in pProdID int,
in pCantidad int)
BEGIN 
update ventadetalle set VentaDetCantidad = pCantidad where ProdID = pProdID;
update producto set prodStock = prodstock - pCantidad where ProdID = pProdID;
END //
delimiter ; 


5) Crear el usuario PasanteAbril (clave “PasanteAbril” ) y asignarle permisos de consulta sobre los campos Id, nombre y stock de la tabla Producto.
(10 puntos)
create user 'PasanteAbril'@'localhost' IDENTIFIED BY 'PasanteAbril';

GRANT SELECT (prodid,proddesc,prodstock) on DBParcial1BarcoExequiel.producto to 'PasanteAbril'@'localhost';


Exportar y subir a la plataforma la DB con el nombre DBParcial1<ApellidoNombre>.sql 
Ejemplo: DBParcial1BarcoExequiel.sql