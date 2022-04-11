'''
Escribir una función que reciba otra función y una lista, y devuelva otra lista con el
resultado de aplicar la función dada a cada uno de los elementos de la lista. La función
dada debe calcular el cuadrado de un número.
'''
#Forma 1
def funcionenfuncion(funcion, lista):
    listafinal = []
    for i in lista:
        listafinal.append(funcion(i))
    return listafinal

def funcioncuadrado(n):
    return n * n

#Forma 2
'''
def funcioncuadrado(lista):
    listafinal = []
    for i in range(0,len(lista)):
        lista[i] = pow(lista[i], 2)
        listafinal.append(lista[i])
    return listafinal
'''

lista1 = [2, 4, 8, 10]

print(funcionenfuncion(funcioncuadrado, lista1))
