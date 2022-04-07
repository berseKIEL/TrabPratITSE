# Ingreso de Nombre
def ingresoNombre():
    while True:
        nombre = input('-------\nIngresa el nombre del Alumno: ')
        if nombre == "":
            print("El nombre no puede estar vacio")
        else:
            return nombre


# Ingreso de apellido
def ingresoApellido():
    while True:
        apellido = input('-------\nIngresa el apellido del Alumno: ')
        if apellido == "":
            print("El apellido no puede estar vacio\n-------")
        else:
            return apellido


# Ingreso de Condicion
def ingresoCondicion():
    condicionfinal = ''
    while True:
        try:
            Condicion = int(input('''-------\nIngresa la Condición del Alumno
1- Aprobado
2- Desaprobado
Valor:\n'''))
            if Condicion == 1:
                condicionfinal = 'S'
                return condicionfinal
            elif Condicion == 2:
                condicionfinal = 'H'
                return condicionfinal
            else:
                print("Ingresa valores entre 1 al 2")
        except:
            print("Ingresa valores númericos")


# Ingreso de DNI
def ingresoDNI():
    while True:
        try:
            dni = int(input('''-------\nIngresa el DNI del Alumno
Tiene que ser entre 20.000.000
Hasta 50.000.000
Valor: '''))
            if 20000000 <= dni <= 50000000:
                return dni
            else:
                print("Ingresa valores entre 20.000.000 al 50.000.000")
        except:
            print("Ingresa valores númericos")
