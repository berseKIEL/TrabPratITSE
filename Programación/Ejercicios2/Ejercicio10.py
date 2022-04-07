'''
Escribir una función que reciba una muestra de números en una lista y devuelva su
media.
'''
def funcionmedia(lista):
    sumatoria = 0
    c = 0
    for i in lista:
        sumatoria += i
        c += 1
    listafinal = int((sumatoria / c))
    return listafinal

  
listanum = [1,4,6,7,2]
print(listanum)
print(funcionmedia(listanum))
    
