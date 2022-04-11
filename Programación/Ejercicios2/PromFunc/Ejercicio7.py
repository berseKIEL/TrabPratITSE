'''
Definir una función busqueda() que tome dos listas y devuelva los elementos de la
primera lista que se repitan en la segunda, indicando el elemento en común y la posición
en la que se encuentra. 
'''
def busqueda(l1, l2):
    listafinal = []
    for ele1 in l1:
        if (ele1 not in listafinal) and (ele1 in l2):
            listafinal.append(ele1)
    return listafinal
    
    
listaA = ["a", "b", "c", "d"]

listaB = ["d", "e", "f", "g"]

print((busqueda(listaA, listaB)))
