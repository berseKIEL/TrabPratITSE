'''
Una empresa del medio requiere que se escriba el código de una función que aplique los descuentos, que varían según el producto.
A modo ejemplo, Ud. Cuenta con las siguientes listas de productos:
Producto1=[‘Producto_1’, 250, 5]
Producto2=[‘Producto_2’, 300, 7]
Producto3=[‘Producto_1’, 750, 10]
De las cuales se advierte que el primer elemento es el nombre del producto,
el segundo elemento el precio expresado en pesos y el último el porcentaje
que se debe aplicar al descuento expresado en %.
Escriba una función principal que solicite al usuario la cantidad de cada producto, y otra función que aplique el descuento al precio total.
Imprima en pantalla los resultados obtenidos.
Comparta el enlace de la resolución o en su defecto adjunte el archivo py, perfectamente nombrado como Desafío 1_"Nombre completo del estudiante"
'''


''' Este ejercicio fue hecho con la implementación de "MultiListas", donde se recorren listas y se las itera
    cumpliendo los precios bases y cantidades junto con el descuento
'''
def cantidadprod(a, b, c):
    listacantidad = []
    listacantidad.append(a)
    listacantidad.append(b)
    listacantidad.append(c)    
    return listacantidad


def descuentopreciototal(lista, cantidad):
    listadescuento = []
    for i in range(0,len(lista)):
        descuentoparcial = 0
        precio = lista[i][1]
        descuento = lista[i][2]
        descuentoparcial = float((precio*cantidad[i])-((precio*cantidad[i]*descuento/100)))
        listadescuento.append(descuentoparcial)
    return listadescuento


def main():
    Producto1=['Producto_1', 250, 5]

    Producto2=['Producto_2', 300, 7]

    Producto3=['Producto_1', 750, 10]

    ListaDeProductos=[Producto1, Producto2, Producto3]

    a = int(input("Ingrese la cantidad del producto 1:\n"))
    b = int(input("Ingrese la cantidad del producto 2:\n"))
    c = int(input("Ingrese la cantidad del producto 3:\n"))
    
    listacant = cantidadprod(a, b, c)

    #print(ListaDeProductos, listacant)

    listadescuento = descuentopreciototal(ListaDeProductos, listacant)

    for i in range(0,len(listadescuento)):
        print("----")
        print(f"El producto {i+1} posee el precio base de: {ListaDeProductos[i][1]}")
        print(f"El producto se compro {listacant[i]} veces, con el precio total de {(ListaDeProductos[i][1]*listacant[i])}")
        print(f"El descuento seria de: {listadescuento[i]}")
        print("----")

main()
