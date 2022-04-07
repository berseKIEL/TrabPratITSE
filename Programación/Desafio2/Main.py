# Import de Ingreso de datos
from ingresoAlumnos import *
from modificacionAlumnos import *

#Sistema

Alumnos = {}

while True: 
    print("\n-------")
    print("1. Añadir/modificar")
    print("2. Eliminar")
    print("3. Mostrar")
    print("4. Listar todo")
    print("5. Listar regulares")
    print("6. Salir\n-------")
    opcion = int(input("Opcion:\n"))
    if opcion == 1:
        agregarAlumno(Alumnos)
    elif opcion == 2:
        eliminarAlumno(Alumnos)
    elif opcion == 3:
        filtrarAlumno(Alumnos)
    elif opcion == 4:   
        devolverAlumnoAll(Alumnos)
    elif opcion == 5:
        devolverAlumnoRegular(Alumnos)
    elif opcion == 6:
        break
    else:
        print("-------\nLa opción debe ser entre 1 al 6")
        
