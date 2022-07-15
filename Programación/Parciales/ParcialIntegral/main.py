from tabulate import tabulate

opcionesMenu = ['1- Asignar puntos', '2- Mostrar Puntos', '3- Listar tabla de posiciones','4- Salir']
equipos = ['Star team','Lions','Yupanqui','Atlanta','Python Team', 'Java Team']

puntajes = [
    {
        "Equipo":"",
        "Ganados":0,
        "Perdidos":0,
        "Empatados":0,
        "Total_puntos":0
    }
    ]
listaEquiposFinal=[]

def ingresarOpcion():
    while True:
        try:
            opcion = int(input(''))
            if opcion >= 0:
                return opcion
            else:
                print('Opcion incorrecta')
        except:
            print('Ingrese numeros validos.')
            print('Ingrese una Opcion:')
    
def ingresarString():
    while True:
        string = input('')
        if string == '':
            print('El nombre del equipo no puede estar vacio')
        else:
            return string

def calcularPuntos():
    ptsGanados = puntajes[0]['Ganados'] * 3
    ptsEmpate = puntajes[0]['Empatados'] * 1
    calculo = ptsGanados + ptsEmpate
    return calculo

def generarReporte(Equipo, Ganados, Empatados, Perdidos, Puntos):
    with open('reporte.txt', 'a', encoding='utf-8') as g:
        g.write(str(Equipo) + " - " + str(Ganados) + " - " + str(Empatados) + " - " + str(Perdidos) + " - " + str(Puntos)+"\n")

def main():
    nombre_usuario = "Jose Adamo"
    while True:
        print(f'Bienvenido, {nombre_usuario}')
        for i in range(0,len(opcionesMenu)):
            print(opcionesMenu[i])
        print('Ingrese una Opcion:')
        opcion = ingresarOpcion()
        if opcion == 1:
            if listaEquiposFinal:
                print('Ya has registrado equipos.\n')
            else:
                print('Ingresaste Registrar Resultados (Asignar Puntos)\n')
                for i in range(0,len(equipos)):
                    print(f'Equipo: {equipos[i]}')
                    print("Ingrese el total de partidos ganados:")
                    totalPartGanados = ingresarOpcion()
                    print("\nIngrese el total de partidos perdidos:")
                    totalPartPerdidos = ingresarOpcion()
                    print("\nIngrese el total de partidos empatados:")
                    totalPartEmpatados = ingresarOpcion()
                    puntajes[0]['Equipo'] = equipos[i]
                    puntajes[0]['Ganados'] = totalPartGanados
                    puntajes[0]['Perdidos'] = totalPartPerdidos
                    puntajes[0]['Empatados'] = totalPartEmpatados
                    puntajes[0]['Total_puntos'] = calcularPuntos()
                    listaEquiposFinal.append(puntajes[0].copy())
                    print('Equipo agregado satisfactoriamente\n')
                print('\n---Todos los equipos fueron agregados satisfactoriamente---\n')
                
        elif opcion == 2:
            if listaEquiposFinal:
                print('\n---Lista de Equipos---')
                for equipo in equipos:
                    print(equipo)
                    
                print('Ingresa el nombre del equipo:')
                
                equipo = ingresarString().lower()
                while equipo == "":
                    for i in range(0,len(listaEquiposFinal)):
                        if equipo in listaEquiposFinal[i].values():
                            equipo = equipo
                    else:
                        equipo = ""
                        print('Ese equipo no esta dentro de la lista de equipos')                
                
                print("\n")
                for i in range(0,len(listaEquiposFinal)):
                    for v in listaEquiposFinal[i].values():
                        if v.lower() == equipo:
                            print("---Equipo---")
                            print('Equipo: '+str(v))
                            for k, v in listaEquiposFinal[i].items():
                                if k not in ('Equipo'):
                                    print(k.capitalize()+': '+str(v))
                        break
                print("\n")
            else:
                print('\n---Todavía no se ha registrado puntos.---\n')

        elif opcion == 3:
            if listaEquiposFinal:
                print('Ingresaste mostrar la Tabla de Posiciones')
                print(tabulate(listaEquiposFinal,headers='keys', tablefmt='grid')+"\n")
                infoEquipo = []
                Equipo= ""
                Ganados = 0
                Empatados = 0
                Perdidos = 0
                Puntos = 0
                for i in range(0,len(listaEquiposFinal)):
                    for v in listaEquiposFinal[i].values():
                        infoEquipo.append(v)
                    Equipo = infoEquipo[0]
                    Ganados = infoEquipo[1]
                    Empatados = infoEquipo[2]
                    Perdidos = infoEquipo[3]
                    Puntos = infoEquipo[4]
                    infoEquipo.clear()
                    
                    generarReporte(Equipo, Ganados, Empatados, Perdidos, Puntos)
            else:
                print('\n---Todavía no se ha registrado puntos.---\n')
        elif opcion == 4:
            break
        else:
            print("\n--INGRESA UNA OPCION VALIDA--\n")
        
main()