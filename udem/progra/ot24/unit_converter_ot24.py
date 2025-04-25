from tkinter import *  # Importamos la librería completa de tkinter

def resultado_new_root(resultado):
    new_root = Toplevel(root)  # Creamos una nueva ventana
    new_root.title("Resultado")  # Título de la nueva ventana
    new_root.geometry("300x200")  # Tamaño de la nueva ventana
    new_root.configure(bg="black")  # Fondo de la nueva ventana
    Label(new_root, text=resultado, font=label_font, bg="black").pack(pady=20)  # Mostrar resultado

# Definimos funciones de conversion
def mts_to_km():
    result = float(entry.get())  # Convertimos el input a float y .get toma el input del usuario para poder procesarlo
    kilometros = (result / 1000)
    resultado_new_root(f"{kilometros} kilómetros")  # Mostramos el resultado

def km_to_mts():
    result = float(entry.get())
    metros = result * 1000
    resultado_new_root(f"{metros} metros")

def ft_to_mts():
    result = float(entry.get())
    metros1 = result / 3.281
    resultado_new_root(f"{metros1} metros")

def in_to_cm():
    result = float(entry.get())
    centimetros = result * 2.54
    resultado_new_root(f"{centimetros} centímetros")

def cs_to_fh():
    result = float(entry.get())
    fahrenheit = (9 / 5) * result + 32
    resultado_new_root(f"{fahrenheit} fahrenheit")

def lbs_to_kg():
    result = float(entry.get())
    kilogramos = result / 2.205
    resultado_new_root(f"{kilogramos} kilogramos")

# Función que selecciona la operación según el valor del menú desplegable
def seleccionar_conversion():
    conversion = opciones.get()
    if conversion == "Metros a kilómetros":
        mts_to_km()
    elif conversion == "Kilómetros a metros":
        km_to_mts()
    elif conversion == "Pies a metros":
        ft_to_mts()
    elif conversion == "Pulgadas a centímetros":
        in_to_cm()
    elif conversion == "Celsius a Fahrenheit":
        cs_to_fh()
    elif conversion == "Libras a kilogramos":
        lbs_to_kg()

root = Tk()  # Creamos la ventana/pop-up
root.title("Conversión de unidades")  # Título de la ventana
root.geometry("400x300")  # Resolución de la ventana
root.configure(bg="black")  # Color de fondo

label_font = ("Verdana", 10, "bold")  # Letra para los títulos
entry_font = ("Verdana", 12)  # Letra para el input del usuario
button_font = ("Verdana", 10, "bold")  # Letra para los botones

Label(root, text="Conversiones", font=label_font, bg="black").pack(pady=5)  # Texto de título, dentro de la ventana

entry = Entry(root, font=entry_font)  # Input del usuario
entry.pack(pady=5)  # Espacio entre el input y el menú desplegable

# Menú desplegable de conversiones
opciones = StringVar(root)
opciones.set("Selecciona una conversión")  # Valor inicial

menu_conversiones = OptionMenu(root, opciones, "Metros a kilómetros", "Kilómetros a metros", 
                               "Pies a metros", "Pulgadas a centímetros", "Celsius a Fahrenheit", 
                               "Libras a kilogramos")
menu_conversiones.pack(pady=5)

# Botón para ejecutar la conversión seleccionada
Button(root, text="Convertir", font=button_font, command=seleccionar_conversion, bg="white").pack(pady=5)

root.mainloop()  # Comando para que la ventana se mantenga abierta y no se cierre de inmediato