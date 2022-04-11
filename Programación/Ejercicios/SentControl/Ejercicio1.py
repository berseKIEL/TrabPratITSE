'''
Crear un programa que permita al usuario elegir entre diferentes grupos. Las
posibilidades son: Grupo A identificador por el color rojo, Grupo B representado por el color
verde, Grupo C identificado por el color azul. Según el Grupo elegido (A, B o C) se le debe mostrar
el mensaje “Usted ha elegido el Grupo [nombre del grupo] representado por el color [color del
grupo]”. Si el usuario ingresa una opción que no corresponde a ninguno grupo disponible, indicar
“No existe la opción ingresada”
'''

GrupoA = {
    'Nombre' : 'Grupo A',
    'Color' : 'Rojo'
}

GrupoB = {
    'Nombre' : 'Grupo B',
    'Color' : 'Verde'
}

GrupoC = {
    'Nombre' : 'Grupo C',
    'Color' : 'Azul'
}

def pedirNumeroEntero():
    correcto=False
    num=0
    while(not correcto):
        try:
            num = int(input(f'''Ingrese el grupo al cual le gustaria pertenecer
1-{GrupoA['Nombre']} Color: {GrupoA['Color']}
2-{GrupoB['Nombre']} Color: {GrupoB['Color']}
3-{GrupoC['Nombre']} Color: {GrupoC['Color']}
Valor:\n'''))
            correcto=True
        except ValueError:
            print('----Error, introduce un numero entero----\n')
    return num

exit = False
opcion = 0

while not exit:
    opcion = pedirNumeroEntero()
    if opcion == 1:
        print(f"1. Usted ha elegido el {GrupoA['Nombre']} representado por el color {GrupoA['Color']}")
        exit = True
    elif opcion == 2:
        print(f"1. Usted ha elegido el {GrupoB['Nombre']} representado por el color {GrupoB['Color']}")
        exit = True
    elif opcion == 3:
        print(f"1. Usted ha elegido el {GrupoC['Nombre']} representado por el color {GrupoC['Color']}")
        exit = True
    else:
        print ("----No existe la opción ingresada----")

