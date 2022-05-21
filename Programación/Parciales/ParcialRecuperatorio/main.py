def mostrarEncargados(lista):
    for i in range(len(lista)):
        print(str(i+1) + "- " + lista[i])
    print(str(0) + "- " + "Cerrar Sesion")


def elegirEncargado(lista):
    print("---Seleccion de perfiles---")
    mostrarEncargados(lista)
    while True:
        numero = int(input("Eleccion: "))
        encargado = ""
        if numero == 1:
            encargado = lista[0]
            return encargado
        if numero == 2:
            encargado = lista[1]
            return encargado
        if numero == 0:
            return encargado
        else:
            print("---Ingrese una opcion valida---")


def mostrarOpcMenu(opcionesMenu):
    for elem in opcionesMenu:
        print(elem, end="\n")


def bienvenida(encargado):
    print("----")
    print(f'Café "Moka" te da la bienvenida, {encargado}')
    print("Esperemos que tengas una excelente jornada!!")
    print("----")


def seleccionarOpcion():
    while True:
        opcion = int(input("Ingrese una opcion: "))
        if opcion == 1 or opcion == 2 or opcion == 3:
            return opcion
        else:
            print("Error: Opcion invalida")


def pedirNombreCliente():
    while True:
        nombre = input("Ingrese el nombre del cliente: ")
        if nombre != "":
            return nombre


def listarCombos(diccionario):
    print("---Combos---")
    for k, v in diccionario.items():
        print(k + ":" + " Precio:" + str(v))


def ingreseCantidad():
    while True:
        cantidad = int(input("Ingrese la cantidad del Combo: "))
        if cantidad >= 0:
            return cantidad
        else:
            print("Error: Opcion invalida")


def comboElegidos(diccionario):
    listCombos = {'Cant_x_Combo': [],
                  'Total Pedido': 0
                  }
    listarCombos(diccionario)

    # Combo 1
    print("---Combo 1---")
    comboCant = ingreseCantidad()
    listCombos['Cant_x_Combo'] += [comboCant]
    listCombos['Total Pedido'] += diccionario.get('Combo1') * comboCant
    print("Precio Acumulado :" + str(listCombos['Total Pedido']))

    # Combo 2
    print("---Combo 2---")
    comboCant = ingreseCantidad()
    listCombos['Cant_x_Combo'] += [comboCant]
    listCombos['Total Pedido'] += diccionario.get('Combo2') * comboCant
    print("Precio Acumulado :" + str(listCombos['Total Pedido']))

    # Combo 3
    print("---Combo 3---")
    comboCant = ingreseCantidad()
    listCombos['Cant_x_Combo'] += [comboCant]
    listCombos['Total Pedido'] += diccionario.get('Combo3') * comboCant
    print("Precio Acumulado :" + str(listCombos['Total Pedido']))

    return listCombos


def ingresoAbonoCliente():
    while True:
        dineroCliente = int(
            input("Ingrese la cantidad con la que abona el cliente: "))
        if dineroCliente > 1:
            return dineroCliente
        else:
            print("Tiene que ingresar mayor a 0")


def comprobacionAbonoCombo(combo):
    vuelto = 0
    pedidoCombo = combo['Total Pedido']
    while True:
        dinero = ingresoAbonoCliente()
        if dinero >= pedidoCombo:
            vuelto = dinero - pedidoCombo
        if vuelto == 0:
            print("Se ha pagado justo")
        else:
            print("El dinero es insuficiente para pagar a los combos")
        return vuelto


def registrarVenta(encargado, cliente, cant_x_combo, total_pedido):
    with open('ventas.txt', 'a', encoding="utf8") as v:
        v.write("Encargado: " + encargado + ", " +
                "Cliente: " + cliente + ", " +
                "Cantidad por Combo: " + cant_x_combo + ", " +
                "Total del Pedido: " + total_pedido + "\n"
                )


def registrarRegistroVenta(encargado, total_vendido):
    with open('registro_venta.txt', 'a', encoding="utf8") as rv:
        rv.write("Encargado: " + encargado + ", " +
                 "Total vendido: " + "$" + total_vendido + "\n" +
                 "*******************************************" + "\n")


def finalSesion(totalVendido):
    print(
        f"Espero que hayas tenido una jornada gratificante!!, el total de ventas de tu turno es: {totalVendido}")


opcionesMenu = ['1- Nuevo pedido',
                '2- Cerrar Caja',
                '3- Salir']

encargados = ["Juan Ignacio", "Martina"]


preciosCombos = {'Combo1': 350,
                 'Combo2': 400,
                 'Combo3': 250, }


def menu():
    # Realize un bucle hasta que la opcion sea igual a Salir
    while True:
        encargado = elegirEncargado(encargados)
        if encargado == "":
            print("Usted ha cerrado la sesión.")
            break
        bienvenida(encargado)
        finEncargado = False
        total_vendido_encargado = 0
        while finEncargado != True:
            # Da la bienvenida con determinado empleado
            # Muestra el menu de opciones
            mostrarOpcMenu(opcionesMenu)
            # Pide una opcion
            opcion = seleccionarOpcion()
            # Si la opcion es 1:
            total_vendido_encargado = total_vendido_encargado
            if opcion == 1:
                # Pide el nombre del cliente
                nombre_cliente = pedirNombreCliente()
                # Crear un diccionario que contenga todos los combos y sus precios
                listCombos = comboElegidos(preciosCombos)
                # Devuelve el Vuelto
                vuelto = comprobacionAbonoCombo(listCombos)
                print(f"El vuelto es : {vuelto}")
                print("----")
                # Se registra la venta
                total_vendido_encargado += listCombos['Total Pedido']
                registrarVenta(encargado, nombre_cliente,
                               '.'.join(map(str, listCombos['Cant_x_Combo'])), str(listCombos['Total Pedido']))
            elif opcion == 2:
                registrarRegistroVenta(encargado, str(total_vendido_encargado))
            elif opcion == 3:
                finalSesion(total_vendido_encargado)
                finEncargado = True


menu()
