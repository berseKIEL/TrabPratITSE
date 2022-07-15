import pymysql


class Database():
    def __init__(self):
        self.conexion = pymysql.connect(
            host="localhost",
            port=3308,
            user="root",
            password="root",
            database="cafemoka"
        )

    def abrir_conexion(self):
        return self.conexion.cursor()

    def cerrar_conexion(self):
        return self.conexion.close()

    def realizar_commit(self):
        return self.conexion.commit()
    
    def realizar_rollback(self):
        return self.conexion.rollback()