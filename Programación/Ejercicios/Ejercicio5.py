'''
Una librería tiene dos libros de gran venta: libro1 y libro2. Suele hacer venta por correo
y la empresa de logística les cobra por peso de cada paquete así que deben calcular el
peso de ambos libros que saldrán en cada paquete a demanda. Cada libro1 pesa 250 g
y cada libro2 300 g. Escribir un programa que lea la cantidad del libro1 y libro2 vendidos
en el último pedido y calcule el peso total del paquete que será enviado.
'''
print('Ejecicio 5')
libro1 = {
"nombre": "Ejemplo 1",
"peso": 250,
"cantvend" : 0
}
libro2 = {
'nombre' : 'Ejemplo 2',
'peso' : 300,
'cantvend' : 0
}
cantvendidal1= int(input('Ingrese cuantas veces se vendio el libro 1:\n'))
cantvendidal2= int(input('Ingrese cuantas veces se vendio el libro 2:\n'))
for key, value in libro1.items():
	if key == 'cantvend':
		libro1[key] = cantvendidal1
		
for key, value in libro2.items():
	if key == 'cantvend':
		libro2[key] = cantvendidal2

libronom1= libro1.get('nombre')

libronom2= libro2.get('nombre')

cantvendtotall1 = libro1.get('cantvend')
cantvendtotall2 = libro2.get('cantvend')

pesol1 = libro1.get("peso")
pesol2 = libro2.get("peso")

pesototal = ((pesol1 * cantvendtotall1)/1000) + ((pesol2 * cantvendtotall2)/1000)

print(f'En el ultimo paquete se vendio {cantvendtotall1} veces el libro {libronom1} y se vendio {cantvendtotall2} el libro {libronom2}')
print(f'El peso total del paquete es de {pesototal} kg')
