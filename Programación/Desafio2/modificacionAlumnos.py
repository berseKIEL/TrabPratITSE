from ingresoDatos import *
from ingresoAlumnos import *

# Con este agrega el estudiante, haciendo una compilación de todos los ingresos tanto de datos y Alumno
def agregarAlumno(Alumnos):
    DNI = ingresoDNI()
    if (DNI not in Alumnos):
        nombre = ingresoNombre().capitalize()
        apellido = ingresoApellido().capitalize()
        condicion = ingresoCondicion()
        Alumno_info = ingresoDatosAlumno(nombre, apellido, condicion)
        Alumnos[DNI] = Alumno_info
        print("-------\nEl estudiante fue agregado exitosamente")
        return True
    else:
        print("\n-----El alumno no existe")
        return False

#Elimina un usuario filtrandolo por su DNI
def eliminarAlumno(diccionario):
    DNI = ingresoDNI()
    if (DNI in diccionario):
        diccionario.pop(DNI)
        print("-------\nEl estudiante fue eliminado exitosamente")
        return False
    else:
        print("\n----El alumno no existe")
        return True
      
#Filtra a un alumno y devuelve sus datos
def filtrarAlumno(diccionario):
    dni = ingresoDNI()
    if (dni in diccionario):
        print("-----Alumnos-----\n")
        print('Nombre: '+ diccionario[dni].get('Nombre'))
        print('Apellido: '+ diccionario[dni].get('Apellido'))
        print('Condicion: '+ diccionario[dni].get('Condicion'))
        return True
    else:
        print("\n-----El alumno no existe")
        return False    

#Devuelve todos sus alumnos, ya se aprobados y desaprobados
def devolverAlumnoAll(diccionario):
    print("\n-----Todos los Alumnos-----")
    for k in diccionario.keys():
        print("---Alumno---")
        print("DNI: "+str(k))
        for a, c in diccionario[k].items():
            if a not in ('Condicion'):
                print(a+": "+c)
        Condicion = diccionario[k].get('Condicion')
        CondicionFinal = ""
        if Condicion=='S':
            CondicionFinal = "Aprobado"
        else:
            CondicionFinal = "Desaprobado"
        print('Condicion: '+ CondicionFinal+f'({Condicion})')

#Devuelve todos los alumnos que esten regular, es decir Condicion = S
def devolverAlumnoRegular(diccionario):
    print("\n-----Todos los Alumnos Regulares con Condicion S-----")
    for k in diccionario.keys():       
        for a in diccionario[k].values():
            if a == 'S':
                print("---Alumno---")
                print('DNI: '+str(k))
                for kk, v in diccionario[k].items():
                    if kk not in ('Condicion'):
                        print(kk+ ': '+ v)
