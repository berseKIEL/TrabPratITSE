import pymysql


class Database():
    def __init__(self):
        self.conexion = pymysql.connect(
            user="root",
            password="root",
            host="localhost",
            port=3306,
            database="ferreteria"
        )

    def abrir_conexion(self):
        return self.conexion.cursor()

    def cerrar_conexion(self):
        return self.conexion.close()
        
