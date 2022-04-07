'''
Escribir una funcion sumar_lista() y una función multiplicar_lista() que sumen y
multipliquen respectivamente todos los números de una lista. Por ejemplo:
sumar_lista([10,20,30,40]) debería devolver 100 y multiplicar_lista([10,20,30,40])
debería devolver 240000. 
'''

def sumar_lista(lista):
    suma = 0
    for numero in lista:
        suma += numero
    return suma


def mult_lista(lista):
    suma = 1
    for numero in lista:
        suma = suma * numero
    return suma

print(sumar_lista([10,20,30,40]))
print(mult_lista([10,20,30,40]))

