'''
Definir una función obtener_max() que tome como argumento dos números y devuelva
el mayor de ellos. Modifique la función para recibir tres argumentos, llamada
obtener_max_tres() que retorna el mayor de ellos.
'''
def obtener_max(num1, num2):
    if (num1>num2):
        return num1
    else: return num2


def obtener_max_tres(num1, num2, num3):
    if num1>num2 and num1>num3:
        return num1
    elif num2>num1 and num2>num3:
        return num2
    else:
        return num3


print(obtener_max(4,7))
print(obtener_max_tres(4,7,9))
