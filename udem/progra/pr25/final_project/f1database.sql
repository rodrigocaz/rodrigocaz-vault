-- Problemática:

--La gestión y análisis del rendimiento en la Fórmula 1 es compleja debido a la gran cantidad de variables que influyen 
--en el desempeño de los pilotos, escuderías y vehículos en distintas condiciones. 
--Antes, esta información se encontraba dispersa en registros no integrados, dificultando la evaluación de desempeño, la predicción de resultados y 
--la toma de decisiones estratégicas.


--Justificación para crear la base de datos:

--Se creó esta base de datos para centralizar y estructurar toda la información relevante de la Fórmula 1, permitiendo:
	-- •	Llevar un historial completo de pilotos y escuderías.
	-- •	Evaluar el impacto de componentes técnicos (como eficiencia y fiabilidad) en el rendimiento.
	-- •	Analizar resultados de carreras considerando factores como clima, neumáticos y estrategias.
	-- •	Comparar circuitos en cuanto a complejidad, altitud, tipo de pista, etc.
	-- •	Realizar estudios de rendimiento por temporada, clima o características de circuito.


CREATE TABLE piloto (
    piloto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre Nvachar(120),
    apellido Nvarchar(120),
    fecha_nacimiento Date,
    nacionalidad Nvarchar(120),
    experiencia_años INTEGER,
    altura REAL,
    peso REAL,
    agresividad INTEGER,
    consistencia INTEGER
);

CREATE TABLE escuderia (
    escuderia_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre Nvarchar(120),
    nacionalidad Nvarchar(120),
    año_fundacion INTEGER,
    presupuesto_anual REAL,
    director_tecnico Nvarchar(120)
);

CREATE TABLE componente (
    componente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    escuderia_id INTEGER,
    temporada INTEGER,
    tipo Nvarchar(120),
    eficiencia INTEGER,
    fiabilidad INTEGER,
    FOREIGN KEY (escuderia_id) REFERENCES escuderia(escuderia_id)
);

CREATE TABLE resultado (
    resultado_id INTEGER PRIMARY KEY AUTOINCREMENT,
    carrera_id INTEGER,
    piloto_id INTEGER,
    escuderia_id INTEGER,
    posicion_salida INTEGER,
    posicion_final INTEGER,
    puntos_obtenidos INTEGER,
    vueltas_completadas INTEGER,
    mejor_vuelta REAL,
    tipo_neumaticos Nvarchar(120),
    numero_paradas INTEGER,
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id),
    FOREIGN KEY (piloto_id) REFERENCES piloto(piloto_id),
    FOREIGN KEY (escuderia_id) REFERENCES escuderia(escuderia_id)
);

CREATE TABLE circuito (
    circuito_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre Nvarchar(120),
    ubicacion Nvarchar(120),
    longitud_km REAL,
    curvas INTEGER,
    tipo_circuito Nvarchar(120),
    record_vuelta REAL,
    altitud INTEGER,
    aspereza INTEGER
);

CREATE TABLE carrera (
    carrera_id INTEGER PRIMARY KEY AUTOINCREMENT,
    circuito_id INTEGER,
    temporada INTEGER,
    fecha Date,
    condiciones_climaticas INTEGER, -- 0: Soleado, 1: Lluvioso
    temperatura_ambiente REAL,
    temperatura_pista REAL,
    humedad INTEGER,
    FOREIGN KEY (circuito_id) REFERENCES circuito(circuito_id)
);

CREATE TABLE vuelta_rapida (
    vuelta_id INTEGER PRIMARY KEY AUTOINCREMENT,
    resultado_id INTEGER,
    numero_vuelta INTEGER,
    tiempo_vuelta REAL,
    posicion_en_vuelta INTEGER,
    diferencia_con_lider REAL,
    FOREIGN KEY (resultado_id) REFERENCES resultado(resultado_id)
);

CREATE TABLE clasificacion (
    clasificacion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    carrera_id INTEGER,
    piloto_id INTEGER,
    tiempo_q1 REAL,
    tiempo_q2 REAL,
    tiempo_q3 REAL,
    posicion_final INTEGER,
    FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id),
    FOREIGN KEY (piloto_id) REFERENCES piloto(piloto_id)
);

CREATE TABLE piloto_escuderia (
    piloto_id INTEGER,
    escuderia_id INTEGER,
    fecha_inicio Date,
    fecha_fin Date,
    FOREIGN KEY (piloto_id) REFERENCES piloto(piloto_id),
    FOREIGN KEY (escuderia_id) REFERENCES escuderia(escuderia_id)
);
