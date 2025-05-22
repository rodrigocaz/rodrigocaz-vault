import sqlite3
import pandas as pd

conn = sqlite3.connect('mi_base_de_datos.db')

cargas = [
    ('piloto.csv', 'piloto'),
    ('escuderia.csv', 'escuderia'),
    ('componente.csv', 'componente'),
    ('circuito.csv', 'circuito'),
    ('carrera.csv', 'carrera'),
    ('resultado.csv', 'resultado'),
    ('vuelta_rapida.csv', 'vuelta_rapida'),
    ('clasificacion.csv', 'clasificacion'),
    ('piloto_escuderia.csv', 'piloto_escuderia'),
]

for archivo, tabla in cargas:
    df = pd.read_csv(archivo)
    df.to_sql(tabla, conn, if_exists='append', index=False)
    print(f'Cargados {len(df)} registros en {tabla}')

conn.close()