import matplotlib.pyplot as plt

n = int(input("Inserta el numero de pacientes: "))  # Variable numerica entera que señala el numero de pacientes
acumulador = 0
emergency = 0
consultation = 0
values = []

for i in range(1, n + 1):  # Loop para procesar cada paciente
    conti = input(f"Inserta si el paciente {i} desea continuar con su cita (si o no): ").strip().lower()
    if conti == "no":
        value = f"El paciente {i} no deseo continuar con su cita"
        values.append(value)  # Asegurarse de agregar el mensaje al listado
        continue

    tipo = input(f"Inserta el tipo de cita y/o si es urgencia del paciente {i} (emergencia o consulta): ").strip().lower()
    if tipo == "emergencia":
        emergency += 1
    elif tipo == "consulta":
        consultation += 1
    else:
        print(f"Tipo de cita no encontrado, vuelva a intentar")
        break

for i in range(1, n + 1):  # Loop para procesar detalles de cada paciente
    tipo = input(f"Inserta el tipo de cita del paciente {i} (emergencia o consulta): ").strip().lower()
    if tipo == "emergencia":
        name = input(f"Inserta el nombre del paciente {i}: ")
        padecimiento = input(f"Inserta el padecimiento del paciente {i}: ")
        nivel = int(input(f"Inserta el nivel de seriedad del paciente {i}, siendo 1 el mas severo y 2 el menos severo: "))
        precio = 8000
        tiempo = input(f"Inserta el tiempo de duracion de la consulta del paciente {i} (en minutos): ")
        if nivel == 1:
            doctor = input(f"Inserta el nombre del doctor que atendio al paciente numero {i}: ")
        elif nivel == 2:
            precio = precio - precio * 0.2
            doctor = input(f"Inserta el nombre del doctor que atendio al paciente numero {i}: ")

        value = f"El paciente {i} tiene nombre de: {name}\n" \
                f"Este padece de: {padecimiento}\n" \
                f"Emergencia de nivel: {nivel}\n" \
                f"El paciente tuvo cita con el doctor: {doctor}\n" \
                f"La cita duro un total de: {tiempo} minutos"
    elif tipo == "consulta":
        name = input(f"Inserta el nombre del paciente {i}: ")
        padecimiento = input(f"Inserta el padecimiento del paciente {i}: ")
        nivel = int(input(f"Inserta el nivel de seriedad del paciente {i}, siendo 1 el mas severo y 2 el menos severo: "))
        doctor = input(f"Inserta el nombre del doctor que atendio al paciente numero {i}: ")
        tiempo = int(input(f"Inserta el tiempo de duracion de la consulta del paciente {i} (en minutos): "))
        precio = 5000
        if tiempo < 40:
            precio = precio - precio * 0.4
        value = f"El paciente {i} tiene nombre de: {name}\n" \
                f"Este padece de: {padecimiento}\n" \
                f"Consulta de nivel: {nivel}\n" \
                f"El paciente tuvo cita con el doctor: {doctor}\n" \
                f"La cita duro un total de: {tiempo} minutos"
    else:
        print(f"Tipo de cita no encontrado, vuelva a intentar")
        break

    acumulador += precio
    values.append(value)

if acumulador > 4000:
    acumulador = acumulador - acumulador * 0.5

print(f"Enfermeria Roel")
print(f"--------------------------------------------------------------------------------------------------------")
for value in values:
    print(value)
    print(f"--------------------------------------------------------------------------------------------------------")
print(f"Total: {acumulador} pesos")
print(f"Una voz para liderar, una vision para el futuro para la atencion de la salud")

x = ['Emergencia', 'Consulta']
y = [emergency, consultation]
plt.bar(x, y)
plt.xlabel('Tipo de cita')
plt.ylabel('Numero de pacientes')
plt.title("Numero de pacientes por el tipo de cita")
plt.show()