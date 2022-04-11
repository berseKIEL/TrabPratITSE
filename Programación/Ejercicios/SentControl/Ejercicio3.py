'''Una empresa del medio realiza una evaluación de sus empleados, para calcular el
monto del bono anual.
Esta evaluación incluye aspecto como: puntualidad, cuidado de su espacio de trabajo y de los
materiales otorgados, actualización y capacitación continua.
La cantidad de dinero conseguida en cada nivel es de $25000 de base, y este valor se multiplica
por un valor índice, según la escala de puntuación obtenida.
Se pide que escriba el código de un programa que evalúe la entrada proporcionada por teclado
del personal de RRHH, calcule el monto del bono y lo muestre por pantalla junto con el nivel de
rendimiento. 
'''
print("Puntajes\nEntre 0 y 3, Nivel bajo \nEntre 4 y 6, Nivel Admisible \nEntre 7 y 10, Nivel Exelente")
EntradaPersonal = int(input('Ingrese el puntaje:\n'))
CantDineroBase = 25000
EntradaPersonal > 0
0 < EntradaPersonal
if EntradaPersonal >= 0 and EntradaPersonal <= 3:
    print("Monto del Bono: "+str(CantDineroBase*1))
    print("Nivel: Bajo")
if EntradaPersonal >= 4 and EntradaPersonal <= 6:
    print("Monto del Bono: "+str(CantDineroBase*1.5))
    print("Nivel: Admisible")
if EntradaPersonal >= 7 and EntradaPersonal <=10:
    print("Monto del Bono: "+str(CantDineroBase*2))
    print("Nivel: ¡Excelente!")
