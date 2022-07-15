from database.database import Database
from pymysql import Error as pyError
db = Database()
cur = db.abrir_conexion()

class Producto():
    def __init__(self, idproducto=None, descripcion=None, categoria=None, stock=None, precio_venta = None):
        self.idproducto=idproducto
        self.descripcion=descripcion
        self.categoria=categoria
        self.stock=stock
        self.precio_venta=precio_venta


    def agregarProducto(self, producto):
        try:
            cur.execute('INSERT INTO productos(descripcion, categoria, stock, precio_venta) VALUES ( %s, %s, %s, %s)',
                        (producto.descripcion, producto.categoria, producto.stock, producto.precio_venta))
            db.conexion.commit()
            print("Producto agregado satisfactoriamente\n---")
        except pyError as e:
            print(f"Error a la hora de insertar un producto: {e}")
    

    def filtrarProductoID(self, id):
        try:
            cur.execute(
                'SELECT descripcion, categoria, stock, precio_venta from productos where idproducto= %s', (id))
            datos = cur.fetchall()
            return datos
        except pyError as e:
            print(f"Error a la hora de filtrar un producto: {e}")
        

    def filtrarProductoCat(self, categoria):
        try:
            cur.execute(
                'SELECT idproducto, descripcion, stock, precio_venta from productos where categoria= %s', (categoria))
            datos = cur.fetchall()
            return datos
        except pyError as e:
            print(f"Error a la hora de filtrar un producto: {e}")
    

    def modificarProducto(self,precionuevo,id):
        try:
            cur.execute(
                'UPDATE productos SET precio_venta = %s WHERE idproducto = %s', (precionuevo, id))
            db.conexion.commit()
            return print("Registro modificado satisfactoriamente")
        except pyError as e:
            print(f"Error a la hora de modificar un producto: {e}")
    

    def filtrarTodosProductos(self):
        try:
            cur.execute("SELECT idproducto, descripcion, categoria, stock, precio_venta from productos")
            producto = cur.fetchall()
            return producto
        except pyError as e:
            print(f"Error a la hora de filtrar todos los productos:{e}")
    
    def filtrarCategorias(self):
        try:
            cur.execute('SELECT DISTINCT categoria from productos')
            categorias = cur.fetchall()
            return categorias
        except pyError as e:
            print(f"Error a la hora de filtrar las categorias: {e}")

    def cerrarDB(self):
        db.cerrar_conexion()