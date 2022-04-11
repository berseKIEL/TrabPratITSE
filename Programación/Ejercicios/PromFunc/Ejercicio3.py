'''
Escribir una función que recorra una cadena y retorne las posiciones dónde encuentre
la letra e.
'''
def posicionesE(cadena):
    contador = 0
    for letraE in cadena:
        if letraE.lower() in "e":
            contador+= 1
    return contador


VariableString = input("Ingrese una cadena: \n")
print(posicionesE(VariableString))
