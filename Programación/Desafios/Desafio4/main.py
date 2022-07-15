from database.conectiondb import *
from pymysql import Error as pyError

from tabulate import tabulate

db = Database()
cur = db.abrir_conexion()
cur2 = db.abrir_conexion()


def mostrarEmpleados():
    try:
        cur.execute("SELECT idempleados, nombreempleado from empleados")
        empleados = cur.fetchall()
        return empleados
    except pyError as e:
        print(f"Error a la hora de filtrar todos los alumnos:{e}")


def activarEmpleado(id):
    try:
        cur.execute(
            "UPDATE empleados set activo = 1 where idempleados= %s", (id))
        db.conexion.commit()
        return None
    except pyError as e:
        print(f"Error a la hora de activar un empleado: {e}")


def desactivarEmpleado(id):
    try:
        cur.execute(
            "UPDATE empleados set activo = 0 where idempleados= %s", (id))
        db.conexion.commit()
        return None
    except pyError as e:
        print(f"Error a la hora de activar un empleado: {e}")


def elegirEncargado():
    print("---Seleccion de perfiles---")
    while True:
        empleados = mostrarEmpleados()
        if empleados:
            # Mostrar todos los empleados
            i = 1
            print("Empleados:")
            for row in empleados:
                print(str(row[0])+"- "+str(row[1]))
            # Seleccion de empleado
            numero = int(input("Eleccion: "))
            encargado = ""

            # Pregunto si el numero esta en la lista de empleados
            if numero > 0 and numero <= len(empleados):
                activarEmpleado(numero)
                return bienvenida(empleados[numero-1][1]), numero
            else:
                print("Opcion invalida.\n")

        else:
            print("No hay empleados cargados en la base de datos")
            break


def bienvenida(encargado):
    print("----")
    print(f'Café "Moka" te da la bienvenida, {encargado}')
    print("Esperemos que tengas una excelente jornada!!")
    print("----")


def listarCombos():
    try:
        cur.execute("SELECT desccombo, preciocombo from combos")
        combos = cur.fetchall()
        return combos
    except pyError as e:
        print(f"Error a la hora de filtrar todos los Combos:{e}")


def ingreseCantidad():
    while True:
        cantidad = int(input("Ingrese la cantidad del Combo: "))
        if cantidad >= 0:
            return cantidad
        else:
            print("Error: Opcion invalida")


def comboElegidos():
    row = listarCombos()

    idcombo = 1
    totalcuenta = 0

    for column in row:
        print(column)
        print(tabulate(
            {"Descripcion Combo": [column[0]],
            "Precio": [str(column[1])]}
            ,headers="keys",tablefmt='pretty'))
        precio = column[1]
        cantidad = ingreseCantidad()
        totalcombo = precio * cantidad
        totalcuenta = totalcuenta + totalcombo

        cur2.execute(
            'SELECT idventas FROM ventas order by idEmpleado DESC LIMIT 1')
        idventa = cur2.fetchone()
        idventa = idventa[0]

        consulta = (
            'INSERT INTO pedidos (idventa, idcombo, cantcombo, totalcombo) VALUES (%s,%s,%s,%s)')
        cur2.execute(consulta, (idventa, idcombo, cantidad, totalcombo))
        idcombo += 1

    return totalcuenta, idventa


def getTotalCuenta(idventa):
    consulta = ('select sum(totalcombo) from pedidos where idventa = %s')
    cur.execute(consulta, (idventa))
    row = cur.fetchone()
    return row


def generarVuelto():
    totalPagar = comboElegidos()
    totalapagar = totalPagar[0]
    idventa = totalPagar[1]

    if totalapagar == 0:
        print('¡¡Debes pedir combos!!')
        exit()

    while True:
        print(f'Su total a pagar es: {totalapagar}')
        pago = float(input('Indique la Cantidad a abonar: '))
        if pago > totalapagar:
            break
        else:
            print('¡¡EL PAGO ES INSUFICIENTE!!')

    while True:
        print('¿Confirma el pago? S/N: ')
        confirmacion = input('')
        if confirmacion == 'S':
            vuelto = pago - totalapagar
            db.realizar_commit()
            print(f'Su vuelto es: {vuelto}')
            print('¡¡¡Gracias por su Compra!!!')
            break

        if confirmacion == 'N':
            print('Compra Cancelada correctamente.')
            db.realizar_rollback()
    return idventa


def finalSesion(idventa):
    totalVendido = getTotalCuenta(idventa)[0]
    print(
        f"Espero que hayas tenido una jornada gratificante!!, el total de ventas de tu turno es: {totalVendido}")
    return totalVendido


def mostrarOpcMenu(opcionesMenu):
    for elem in opcionesMenu:
        print(elem, end="\n")


def seleccionarOpcion():
    while True:
        opcion = int(input("Ingrese una opcion: "))
        if opcion > 0:
            return opcion
        else:
            print("Error: Opcion invalida")


opcionesMenu = ['1- Nuevo pedido',
                '2- Cerrar Caja']


def menu():
    total = 0
    idventa = 0
    # Realize un bucle hasta que la opcion sea igual a Salir
    
    while True:
        encargado = elegirEncargado()
        finEncargado = False
        consulta = ('INSERT INTO ventas (idempleado) VALUES (%s)')
        cur.execute(consulta, (encargado[1]))
        while finEncargado != True:
            # Da la bienvenida con determinado empleado
            # Muestra el menu de opciones
            mostrarOpcMenu(opcionesMenu)
            # Pide una opcion
            opcion = seleccionarOpcion()
            if opcion == 1:
                idventa = generarVuelto()
            elif opcion == 2:
                if idventa != 0:                    
                    finalSesion(idventa)
                    desactivarEmpleado(encargado[1])
                    finEncargado = True
                else:
                    print('No ha realizado ninguna venta.')
                    break
            else:
                print('\nIngrese una opcion valida.\n')
        break


menu()
