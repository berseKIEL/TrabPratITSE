'''
Una cadena hotelera que ofrece la reserva online de sus habitaciones, requiere una
función que muestre al huésped el monto total de la reserva. 
Simple $ 18350
Doble $ 27000
Suite $38000

Sevicio           Costo             Combo
Spa                 -               $2500

Alquiler
de             $1000 / día     $ 5000 / semana
vehículo              

Office        $1000 / 6 hs              -

Se debe solicitar al usuario el ingreso del tipo de habitación, cuántos días de reserva y el/los
servicios adicionales que requiera y la cantidad de los mismos, calcular el total y mostrar en
pantalla el costo total de la reserva.
'''

def montoTotalReserva(tipoHab, diasRerv, servAdic, cantServ=None):
    Total = 0
    if (tipoHab==1):
        Total+= 18350 * diasRerv
    elif (tipoHab==2):
        Total+= 27000 * diasRerv
    elif(tipoHab==3):
        Total+=38000 * diasRerv
    
    if(servAdic==1):
        Total+= 2500
    
    if(servAdic==2):
        if(cantServ==1):
            Total+= 1000
        if(cantServ==2):
            Total+= 5000
    
    if(servAdic==3):
        Total+= 1000

    return Total


def main():
    print("Hotel Trivago")
    habi = int(input('''Ingrese el tipo de habitación que quieres reservar
1- Simple: $18350
2- Doble: $27000
3- Suite: $38000
'''))
    dias = int(input("Ingerse la cantidad de días de la reserva:\n"))
    serv = int(input('''Ingrese los servicios adicionales
1- Spa: Combo por $2500
2- Alquiler de Vehiculo: $1000 por día, $5000 por semana
3- Office: $1000 por 6 horas
Valor:
'''))
    if (serv==2):
        cantserv=int(input('''Seleccionaste Alquiler de Vehiculo
Elige entre:
1: $1000 por dia
2: $5000 por semana
Valor:'''))
        print(montoTotalReserva(habi, dias, serv, cantserv))
    else:
        print(montoTotalReserva(habi, dias, serv))
        
        
main()
    
