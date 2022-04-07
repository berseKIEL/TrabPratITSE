'''
Definir una función cadena_inversa() que calcule la inversión de una cadena. Por
ejemplo la cadena "cadena ejemplo" debería devolver la cadena "olpmeje anedac" .
Nota: considere en devolver la cadena resultado en una lista
'''
def cadena_inversa(cadena):
    cadenainvert = ""
    for letra in cadena:
        cadenainvert = letra + cadenainvert
    return cadenainvert

CadenaString = input("Ingrese una cadena:\n")
print(cadena_inversa((CadenaString)))
