from ingresoDatos import *

# Ingreso de los datos Nombre, Apellido, Condicion hacia un diccionario Info
def ingresoDatosAlumno(nombre, apellido, condicion):
    ingresoDatosAlumno = {
        'Nombre': nombre,
        'Apellido': apellido,
        'Condicion': condicion
    }
    return ingresoDatosAlumno


# Ingreso del diccionario INfo hacia el DNI de un Alumno
def ingresoAlumno(DNI, ingresoDatosAlumnoS, diccionarioOriginal):
    diccionarioOriginal[DNI] = {ingresoDatosAlumnoS}
