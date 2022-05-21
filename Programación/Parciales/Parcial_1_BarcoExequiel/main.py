#Funciones
#Sirve para ingresar la respuesta y validar si esta vacia o no
def ingresoRespuesta():
    while True:
        respuesta = input("Indique S/N: ")
        if respuesta == "":
            print("La respuesta no puede estar vacia")
        else:
            return respuesta


#Sirve para ingresar la ubicación y validar si esta vacia o no
def ingresoUbicacion():
    while True:
        ubicacion = input("Indique la Ubicación: ")
        if ubicacion == "":
            print("La ubicación no puede esta vacia")
        else:
            return ubicacion

#Busca desde un diccionario, la primera ambulancia que esta disponible
def busquedaPrimerAmbuDisponible(Diccionario):
    ambuDisponibles = ([k for k,v in Diccionario.items() if v==1])
    primerDisponible = ambuDisponibles[0]
    return primerDisponible

#Busca de un archivo txt los nombre de los paramedicos y los acomoda en una lista
def busquedaParamedicos(lista):
    try:
        with open('paramedicos.txt', 'r', encoding="utf8") as f:
            lineas = f.readlines()
            for line in lineas:
                x = line.strip().split(":")
                lista.append(x[1])
    except FileNotFoundError:
        print("No se ha encontrado el archivo")

#Genera un reporte append en un archivo txt
def generarReporte(nombre_asistente, respuesta, ubicacion, disponible, paramedicoAsignado):
    try:
        with open('reporte_actividad.txt', 'a', encoding="utf8") as r:
            r.write(nombre_asistente + " - " + respuesta + " - " + ubicacion + " - " + str(disponible) + " - " + paramedicoAsignado + "\n")
    except FileNotFoundError:
        print("No se ha encontrado el archivo")


#Listas
emergencias=['Accidente de tránsito', 'Ataque cardíaco', 'ACV', 'Fractura expuesta', 'Quemadura de 3er grado']
ambulancias= {
    1:0,
    2:1,
    3:0,
    4:0,
    5:1,
    6:1,
    7:1,
    8:0,
    9:1,
    10:0,
}
listParamedicos= []
#Main que se ejecuta
def main():
    ciclo = 0
    while ciclo < 5:
        nombre_asistente = "Exequiel Barco"
        print(f"Ud. se comunicio con el 911, mi nombre es {nombre_asistente}")
        print("¿Su emergencia se encuentra dentro de alguna de estas situaciones?")
        for i in range(0,len(emergencias)):
            print(str(i+1)+"-"+emergencias[i])
        print("Respuesta:")
        respuesta = ingresoRespuesta()
        print("----")
        if respuesta == "S":
            ubicacion = ingresoUbicacion()
            disponible = busquedaPrimerAmbuDisponible(ambulancias)
            busquedaParamedicos(listParamedicos)
            paramedicoAsignado = ""
            for i in range(len(listParamedicos)):
                if i == disponible-1:
                    paramedicoAsignado=listParamedicos[i]
            print("---")
            print(f"En minutos llegará la unidad N°: {disponible}")
            print(f"Y será atendida por el paramedico: {paramedicoAsignado}") 
            print(f"A la siguiente ubicación: {ubicacion}.")
            ambulancias[disponible]= 0
        if respuesta == "N":
            ubicacion = ingresoUbicacion()
            disponible = 0
            paramedicoAsignado = "N/N"
            print("Por favor, mantenga la calma, un asistente lo guiará")
        generarReporte(nombre_asistente, respuesta, ubicacion, disponible, paramedicoAsignado)
        ciclo+=1
        print("---")
        
main()