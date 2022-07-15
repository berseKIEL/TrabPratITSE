from database.products import Producto
model = Producto()

def recorrerOpciones(lista):
    for i in range(0, len(lista)):
        print(str(i+1)+"- "+lista[i])
    return

def ingresoOpciones(lista):
    while True:
        try:
            recorrerOpciones(lista)
            Opcion = int(input("Seleccione una Opcion:"))
            if Opcion == 1 or Opcion == 2 or Opcion == 3 or Opcion == 4 or Opcion == 5 or Opcion == 6:
                return Opcion
            else:
                print("Ingresa valores entre 1 al 6.")
        except:
            print("Ingresa valores númericos!!\n")

def ingresoProductoID():
    while True:
        try:
            numero = int(input("-------\nIngresa el ID del Producto:"))
            if numero > 0:
                return numero
            else:
                print("Ingresa valores positivos")
        except:
            print("Ingresa valores númericos")

def ingresoProductoDescripcion():
    while True:
        nombre = input('-------\nIngresa el nombre del producto: ')
        if nombre == "":
            print("El nombre no puede estar vacio")
        else:
            return nombre

def ingresoProductoCategoria():
    while True:
        nombre = input('-------\nIngresa el nombre de la categoria:')
        if nombre == "":
            print("El nombre no puede estar vacio")
        else:
            return nombre

def ingresoProductoStock():
    while True:
        try:
            numero = int(input("-------\nIngresa el Stock del Producto:"))
            if numero > 0:
                return numero
            else:
                print("Ingresa valores positivos")
        except:
            print("Ingresa valores númericos")

def ingresoProductoPrecio():
    while True:
        try:
            numero = int(input("-------\nIngresa el precio de venta del Producto:"))
            if numero > 0:
                return numero
            else:
                print("Ingresa valores positivos")
        except:
            print("Ingresa valores númericos")


Opciones = ["Nuevo Producto","Buscar Producto por Identificador","Buscar Producto por Categoria", "Actualizar Producto (Precio)","Listar Productos Disponibles","Salir"]

def main():
    while True:
        print("Bienvenido al menu de opciones de la ferreteria Barco")
        opcion = ingresoOpciones(Opciones)
        if opcion == 1:
            print("\n---Seleccionaste Nuevo Producto")
            desc = ingresoProductoDescripcion()
            categorias = model.filtrarCategorias()
            listacategorias = []
            if categorias:
                for row in categorias:
                    print("Categoria: "+"- "+str(row[0]))
                    listacategorias.append(row[0])
            else:
                print("Hubo un error a la hora de mostrar las categorias cargadas en el sistema")
                break
            validacion = True
            print(listacategorias)
            while validacion:
                categoria = ingresoProductoCategoria()
                if categoria in listacategorias:
                    stock = ingresoProductoStock()
                    precio = ingresoProductoPrecio()
                    print("---")
                    producto = Producto(descripcion=desc, categoria=categoria, stock=stock, precio_venta=precio)
                    model.agregarProducto(producto)
                    validacion = False
                else:
                    print("------\nIngrese una categoria valida. (Categoria no Valida)")                       
            
        elif opcion == 2:
            print("\n---Seleccionaste Filtrar Producto por ID")
            idprod = ingresoProductoID()
            datosProd = model.filtrarProductoID(idprod)
            if datosProd:
                print("----")
                for row in datosProd:
                    print("Producto: "+"- "+str(row[0]))
                    print("Categoria: "+"- "+str(row[1]))
                    print("Stock: "+"- "+str(row[2]))
                    print("Precio Venta: "+"- "+str(row[3]))
            else:
                print("Hubo un error a la hora de mostrar los productos")
            print("----\n")
        elif opcion == 3:
            print("\n---Seleccionaste Filtrar Producto por Categoria")
            categorias = model.filtrarCategorias()
            if categorias:
                for row in categorias:
                    print("Categoria: "+"- "+str(row[0]))
            else:
                print("Hubo un error a la hora de mostrar las categorias cargadas en el sistema")
                break
            categoria = ingresoProductoCategoria()
            datosProd = model.filtrarProductoCat(categoria)
            if datosProd:
                print("----\n")
                for row in datosProd:
                    print("ID del Producto: "+"- "+str(row[0]))
                    print("Producto: "+"- "+str(row[1]))
                    print("Stock: "+"- "+str(row[2]))
                    print("Precio Venta: "+"- "+str(row[3]))
                    print("---\n")
            else:
                print("Hubo un error a la hora de mostrar los productos")
            print("----\n")
        elif opcion == 4:
            print("\n---Seleccionaste Actualizar Producto")
            print("Para poder actualizar un producto deberás ingresar la ID del mismo")
            idprod = ingresoProductoID()
            datosProd = model.filtrarProductoID(idprod)
            if datosProd:
                print("----")
                print("Precio Anterior: "+"- "+str(datosProd[0][3]))
                print("----")
                print("Ingrese un nuevo Precio")
                precioNuevo = ingresoProductoPrecio()
                nuevoPrecio = model.modificarProducto(precioNuevo, idprod)
                print("----")
            else:
                print("Hubo un error a la hora de mostrar los productos")
        elif opcion == 5:
            print("\n---Seleccionaste Filtrar Todos los Productos")
            datosProds = model.filtrarTodosProductos()
            if datosProds:
                print("----\n")
                for row in datosProds:
                    print("ID del Producto: "+"- "+str(row[0]))
                    print("Producto: "+"- "+str(row[1]))
                    print("Categoria: "+"- "+str(row[2]))
                    print("Stock: "+"- "+str(row[3]))
                    print("Precio de Venta: "+"- "+str(row[4]))
                    print("---\n")
            else:
                print("Hubo un error a la hora de mostrar los productos")
        elif opcion == 6:
            print("Gracias por utilizar el programa de la ferreteria Barco")
            model.cerrarDB()
            break
        else:
            print("-------\nLa opción debe ser entre 1 al 6")

main()