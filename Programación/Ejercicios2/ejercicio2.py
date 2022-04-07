'''
Escribir una función que tome un carácter y devuelva True si es una vocal, de lo contrario
devuelve False. 
'''
def cadenavocal(cadena):
    for letra in cadena:
        if letra.lower() in "aeiou":
            return "Es vocal"

vocal = input("Ingrese una vocal:\n")
print(cadenavocal("a"))
