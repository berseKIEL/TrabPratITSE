'''
Escribir un programa que solicite al usuario una letra y, si es una vocal, muestre el
mensaje “El carácter ingresado es una vocal”, caso contrario muestre el mensaje “El carácter
ingresado no es una vocal”. Se debe evaluar que se haya ingresado un solo carácter, caso
contrario solicitar que ingrese un nuevo dato.
'''
def pedirUnCaracter():
    caracter=''
    print("Si ingresa una cadena entera, se tomará la primera letra")
    caracter = (input('Ingrese una letra:\n'))[0]
    return caracter

def comprobarVocal(cadena):
    for letra in cadena:
        if letra.lower() in "aeiou":
            return "El carácter ingresado es una vocal"
        else:
            return "El caracter ingresado no es una vocal"
            
Caracter = pedirUnCaracter()
print(comprobarVocal(Caracter))
