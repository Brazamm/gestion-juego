import mysql.connector

# Configuración de la conexión a MySQL
def obtener_conexion():
    return mysql.connector.connect(
        user="root",
        password="12345",
        host="localhost",
        database="juego",
        auth_plugin="mysql_native_password"
    )




def InsertarTablaDinamica(nombreTabla, valores):
    mydb = obtener_conexion()
    cursor = mydb.cursor()
    cursor.callproc("InsertarTablaDinamica", (nombreTabla, valores,))
    for result in cursor.stored_results():
        print(result.fetchall())
    mydb.commit()
    mydb.close()

def InsertarDatos():
    nombreTabla = input("Ingrese el nombre de la tabla: ")
    ejemplo = "valor1", "valor2"
    print(f"Usa commillas para separar los valores, ejemplo: {ejemplo} no es necesario usar ()")
    valores = input("Ingrese los valores: ")
    InsertarTablaDinamica(nombreTabla, valores)
    


def MostrarTabla(nombreTabla):
        mydb = obtener_conexion()
        cursor = mydb.cursor()
        cursor.callproc("MostrarTabla", (nombreTabla,))
        for result in cursor.stored_results():
            for fila in result.fetchall():
                print(fila)
        mydb.close()


def datosMostrarTabla():
    nombreTabla = input("Ingrese el registro a consultar: ")
    MostrarTabla(nombreTabla)


def ActualizarDatoDinamico(nombreTabla, columnasYValores, condicion):
    mydb = obtener_conexion()
    cursor = mydb.cursor()
    cursor.callproc("ActualizarDatoDinamico", (nombreTabla, columnasYValores, condicion,))
    for result in cursor.stored_results():
        print(result.fetchall())
    mydb.commit()
    mydb.close()

def ActualizarDatos():
    nombreTabla = input("Ingrese el nombre de la tabla: ")
    ColumnaId = input("ingrese el nombre columna de Id:")
    Id = input("ingrese el Id:")
    condicion = f"`{ColumnaId}` = {Id}" 
    nombreColumna = input("nombre de la columna: ")
    nuevoDato = input("Nuevo dato: ")
    if nuevoDato.isdigit(): 
        columnasYValores = f"`{nombreColumna}` = {nuevoDato}"
    else:  
        columnasYValores = f"`{nombreColumna}` = '{nuevoDato}'"
    ActualizarDatoDinamico(nombreTabla, columnasYValores, condicion)

def EliminarDato(nombreTabla, condicion):
    mydb = obtener_conexion()
    cursor = mydb.cursor()
    cursor.callproc("EliminarDatos", (nombreTabla, condicion,))
    for result in cursor.stored_results():
        print(result.fetchall())
    mydb.commit()
    mydb.close()

def Eliminar():
            nombreTabla = input("Ingrese el nombre de la tabla: ")
            ColumnaId = input("ingrese el nombre columna de Id:")
            Id = input("ingrese el Id:")
            condicion = f"'`{ColumnaId}` = `{Id}'"
            if Id:
                condicion = f"`{ColumnaId}` = {Id}" 
            else:
                condicion = f"`{ColumnaId}` IS NULL"  

            EliminarDato(nombreTabla, condicion)


def mostrar_submenu():
    print("--------------------------------------------------------EJEMPLOS--------------------------------------------------------")
    print("| 1) conexiones : id_conexion, id_ubicacion_origen, id_ubicacion_destino, costo                                        |")
    print("| 2) equipos: id_equipo, nombre_equipo, estadisticas| ejemplo: {empates: 3, derrotas: 5, victorias: 15}                |")
    print("| 3) historialpartidas: id_historial, id_partida, detalles | ejemplo : {evento: Empate inesperado en la Ciudad Azalea.}|")
    print("| 4) inventarios: id_inventario, id_usuario                                                                            |")
    print("| 5) items: id_item, nombre_item, descripcion, id_inventario                                                           |")
    print("| 6) mundos: id_mundo, nombre_mundo, descripcion                                                                       |")
    print("| 7) ranking: id_ranking, id_usuario, puntuacion_global                                                                |")
    print("| 8) items: id_item, nombre_item, descripcion, ubicaciones: id_ubicacion, nombre_ubicacion, id_mundo                   |")
    print("| 9) usuarios: id_usuario, nombre_usuario, nivel, puntuacion, id_equipo                                                |")
    print("------------------------------------------------------------------------------------------------------------------------")
def mostrar_menu():
    print("----------MENÚ-----------")
    print("| 1) ejemplo datos      |")
    print("| 2) Ingresar datos     |")
    print("| 3) Ver datos          |")
    print("| 4) Actualizar datos   |")
    print("| 5) Eliminar datos     |")
    print("| 6) Salir              |")
    print("-------------------------")

def menu():
    while True:
        mostrar_menu()
        opcion = input("| Ingrese su opción: ")

        if opcion == "1":
            mostrar_submenu()
                    

        elif opcion == "2":
            InsertarDatos()
            
        elif opcion == "3":
            datosMostrarTabla()
        
        elif opcion == "4":
            ActualizarDatos()

        elif opcion == "5":
            Eliminar()

        elif opcion == "6":
            print("Saliendo del programa...")
            break

        else:
            print("Opción inválida, intente nuevamente.")

if __name__ == "__main__":
    menu()
