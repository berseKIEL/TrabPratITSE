'''
Una reconocida pastelería de la ciudad, dispone de una aplicación de pedido desde la
mesa. Este servicio genera una comanda a la cocina, según las opciones elegidas por el cliente.
En esta oportunidad se pide se centre solo en el pedido de dos tipos de desayunos, Ligth y
Power a sus clientes. Cada tipo de desayuno contienen lo siguientes ingredientes, además de
las infusiones y jugo natural, común en ambos.

Ingredientes ligth: queso untable, yogurt c/cereales, pan integral, bowl de frutas.
Ingredientes power: frutos secos, fetas de jamón, fetas de queso, pan de campo.

Escribir un programa que pregunte al usuario que tipo de desayuno prefiere, y en función de su
respuesta le muestre un menú con los ingredientes disponibles para que elija. Solo se puede
elegir dos ingredientes, además. Al final se debe mostrar por pantalla el tipo de desayuno que
eligió y todos los demás ingredientes seleccionados
'''


opcion1 = int(input('''Ingrese el tipo de desayuno
Tipo 1: Ingredientes Light
Tipo 2: Ingredientes Power
Valor:
'''))
listopciones = []
if (opcion1==2):
    cadena = ("\nHaz seleccionado Ingredientes Power")
    print(cadena)
    cant = 0
    cadenita = ""
    while (cant <= 1):
        if (cant==1):
            print("---Ingrese otro ingrediente---")
        opcion2 = int(input('''Ingredientes
1.Frutos secos
2.Fetas de jamón
3.Fetas de queso
4.Pan de campo
Seleccione 2 ingredientes            
Valor:\n'''))
        if (opcion2==1):
            cadenita = "Frutos secos"
        elif (opcion2==2):
            cadenita = "Fetas de jamón"
        elif (opcion2==3):
            cadenita = "Fetas de queso"
        else:
            cadenita = "Pan de campo"
        listopciones.append(cadenita)
        cant+=1
else:
    cadena = ("\nHaz seleccionado Ingredientes Light")
    print(cadena)
    cant = 0
    cadenita = ""
    while (cant <= 1):
        if (cant==1):
            print("---Ingrese otro ingrediente---")
        opcion2 = int(input('''Ingredientes
1.Queso untable
2.Yogurt c/cereales
3.Pan integral
4.Bowl de frutas
Seleccione 2 ingredientes            
Valor:\n'''))
        if (opcion2==1):
            cadenita = "Queso Untable"
        elif (opcion2==2):
            cadenita = "Yogurt c/cereales"
        elif (opcion2==3):
            cadenita = "Pan integral"
        else:
            cadenita = "Bowl de frutas"
        listopciones.append(cadenita)
        cant+=1
        
print(cadena)
print("Tus ingredientes son:")
for i in listopciones:
    print(i)
