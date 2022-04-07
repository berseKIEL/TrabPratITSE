'''
A la función anterior modificarla para que cuando encuentre la letra ‘a’ la reemplace por
‘#’
'''
def cadena_inversa(cadena):
    cadenainvert = ""
    for letra in cadena:
        cadenainvert = letra + cadenainvert
    return cadenainvert


def remplazarconhash(cadena):
    aremplazar = "a"
    for letra in cadena:
        remplazo = cadena.replace(aremplazar, "#")
    return remplazo


StringCadena = input("Ingrese una cadena: ")
print(cadena_inversafacil(StringCadena))
