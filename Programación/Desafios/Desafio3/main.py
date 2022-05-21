#Definición de Textos de la carpeta
Empleados = 'empleados.txt'
HorasTrabajadas = 'horas_trabajadas_c1.txt'
PagoQuincena = 'pago_quincena_c1.txt'

#Creación
listEmpleados=[]
listEmpleadosc1=[]
horastrab=[]
#Creación de la función de Calculo de Pago
def calculoPago(horas):
    Pago = horas * 1250
    return Pago
try:
    with open(Empleados, 'r') as fEmp, open (HorasTrabajadas,'r') as fHsTrab,open (PagoQuincena,'w') as fPago:
        #En la creación de las Listas Creo una lista Unica llamada listEmpleados donde contiene
        #Todos los empleados con: ID, Nombre, Cuadrilla y HorasTrabajadas.
        #En este procedimiento voy agregando las cosas en las Listas
        lineasfEmp = fEmp.readlines()
        for line in lineasfEmp:
            x = line.strip().split(", ")
            listEmpleados.append(x)
        for line in fHsTrab:
            x=line.strip().split(", ")
            horastrab.append(x[1].replace("\n", ""))
            horastrab= [int(i) for i in horastrab]
        for i in range(len(listEmpleados)):
            listEmpleados[i].append(horastrab[i])
        #Al final quedaria algo como:
        #['0001', ' Exequiel Barco', ' c1', 42]
        
        #Agrego los empleados que pertenezca a la cuadrilla c1
        for i in range(len(listEmpleados)):
            if listEmpleados[i][2] == 'c1':
                listEmpleadosc1.append(listEmpleados[i])
        #Agrego las horas de los empleados que pertenezacan a la cuadrillan c1
        for i in range(len(listEmpleadosc1)):
            HsTrab = listEmpleadosc1[i][3]
            Sueldo = calculoPago(HsTrab)
            listEmpleadosc1[i].append(Sueldo)
        #Agrego al archivo pago_quincena_c1.txt la información obtenida
        for i in range(len(listEmpleadosc1)):
            fPago.write("Nombre del Empleado: "+listEmpleadosc1[i][1]+"\n")
            fPago.write("Horas Trabajadas: "+str(listEmpleadosc1[i][3])+"\n")
            fPago.write("Liquidacion Total: "+str(listEmpleadosc1[i][4])+"\n"+"\n")
except FileNotFoundError:
    print("Se ha detectado un error")
    print("Alguno de los archivos txt no existe.")