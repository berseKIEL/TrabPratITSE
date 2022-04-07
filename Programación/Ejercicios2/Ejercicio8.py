'''
Definir una función generar_n_caracteres() que tome un entero n y devuelva el caracter
multiplicado por n. Por ejemplo: generar_n_caracteres(5, "x") debería devolver "xxxxx". 
'''
#Forma 1
def generar_n_numeros(numero, letra):
    resultado = "" 
    for i in range(numero):
        resultado = resultado+letra   
    return resultado   

  
entero1 = int(input("Ingrese un numero entero: \n"))
caracter1 = input("Ingrese un caracter: \n")

print(generar_n_numeros(entero1, caracter1))

#Forma 2
def generar_n_numerov2(numero, letra):
    repetir = letra * numero
    return repetir

  
entero1 = int(input("Ingrese un numero entero: \n"))
caracter1 = input("Ingrese un caracter: \n")
print(generar_n_numerov2(entero1, caracter1))
    
