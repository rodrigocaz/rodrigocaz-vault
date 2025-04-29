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
    condiciones_climaticas Nvarchar(120),
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

INSERT INTO piloto (nombre, apellido, fecha_nacimiento, nacionalidad, experiencia_años, altura, peso, agresividad, consistencia) VALUES
('Lewis', 'Hamilton', '1985-01-07', 'Británico', 15, 1.74, 73, 8, 9),
('Sebastian', 'Vettel', '1987-07-03', 'Alemán', 14, 1.75, 62, 7, 8),
('Fernando', 'Alonso', '1981-07-29', 'Español', 20, 1.71, 68, 9, 8),
('Max', 'Verstappen', '1997-09-30', 'Neerlandés', 8, 1.80, 70, 10, 9),
('Charles', 'Leclerc', '1997-10-16', 'Monegasco', 6, 1.80, 70, 8, 9),
('Valtteri', 'Bottas', '1989-08-28', 'Finlandés', 10, 1.83, 73, 7, 8),
('Sergio', 'Pérez', '1990-01-26', 'Mexicano', 12, 1.75, 70, 8, 7),
('Lando', 'Norris', '1999-11-13', 'Británico', 5, 1.70, 68, 8, 8),
('Carlos', 'Sainz Jr.', '1994-09-01', 'Español', 7, 1.75, 70, 8, 8),
('Daniel', 'Ricciardo', '1989-07-01', 'Australiano', 12, 1.80, 70, 9, 8),
('Kimi', 'Raikkonen', '1979-10-17', 'Finlandés', 19, 1.75, 70, 7, 8),
('Lance', 'Stroll', '1998-10-29', 'Canadiense', 5, 1.80, 70, 8, 7),
('Nicholas', 'Latifi', '1995-06-29', 'Canadiense', 3, 1.80, 70, 7, 6),
('Robert', 'Kubica', '1984-12-07', 'Polaco', 14, 1.75, 68, 8, 7),
('Mick', 'Schumacher', '1999-03-22', 'Alemán', 3, 1.80, 70, 8, 8),
('George', 'Russell', '1998-02-15', 'Británico', 5, 1.85, 70, 8, 9),
('Esteban', 'Ocon', '1996-09-17', 'Francés', 6, 1.80, 70, 8, 8),
('Pierre', 'Gasly', '1996-02-07', 'Francés', 6, 1.80, 70, 8, 8),
('Yuki', 'Tsunoda', '2000-05-11', 'Japonés', 3, 1.60, 60, 7, 7),
('Nicholas', 'Latifi', '1995-06-29', 'Canadiense', 3, 1.80, 70, 7, 6),
('Robert', 'Kubica', '1984-12-07', 'Polaco', 14, 1.75, 68, 8, 7);

INSERT INTO escuderia (nombre, nacionalidad, año_fundacion, presupuesto_anual, director_tecnico) VALUES
('Mercedes', 'Alemán', 2010, 500000000, 'James Allison'),
('Ferrari', 'Italiano', 1929, 400000000, 'Mattia Binotto'),
('Red Bull Racing', 'Austríaco', 2005, 450000000, 'Christian Horner'),
('McLaren', 'Británico', 1963, 300000000, 'Andreas Seidl'),
('Alpine', 'Francés', 2021, 250000000, 'Laurent Rossi'),
('Aston Martin', 'Británico', 2004, 200000000, 'Mike Krack'),
('AlphaTauri', 'Italiano', 2006, 150000000, 'Franz Tost'),
('Haas F1 Team', 'Americano', 2014, 100000000, 'Guenther Steiner'),
('Alfa Romeo Racing', 'Suizo', 2013, 120000000, 'Frederic Vasseur'),
('Williams Racing', 'Británico', 1977, 80000000, 'Jost Capito');

INSERT INTO componente (escuderia_id, temporada, tipo, eficiencia, fiabilidad) VALUES
(1, 2023, 'Motor', 95, 90),
(1, 2023, 'Chasis', 90, 85),
(2, 2023, 'Motor', 92, 88),
(2, 2023, 'Chasis', 88, 84),
(3, 2023, 'Motor', 93, 89),
(3, 2023, 'Chasis', 89, 87),
(4, 2023, 'Motor', 91, 86),
(4, 2023, 'Chasis', 87, 83),
(5, 2023, 'Motor', 90, 85),
(5, 2023, 'Chasis', 86, 82),
(6, 2023, 'Motor', 89, 84),
(6, 2023, 'Chasis', 85, 81),
(7, 2023, 'Motor', 88, 83),
(7, 2023, 'Chasis', 84, 80),
(8, 2023, 'Motor', 87, 82),
(8, 2023, 'Chasis', 83, 79),
(9, 2023, 'Motor', 86, 81),
(9, 2023, 'Chasis', 82, 78),
(10, 2023, 'Motor', 85, 80),
(10, 2023, 'Chasis', 81, 77);

INSERT INTO circuito (nombre, ubicacion, longitud_km, curvas, tipo_circuito, record_vuelta, altitud, aspereza) VALUES
('Circuito de Mónaco', 'Mónaco', 3.337, 19, 'Urbano', 1.14, 0, 5),
('Circuito de Silverstone', 'Reino Unido', 5.891, 18, 'Tradicional', 1.27, 0, 3),
('Circuito de Monza', 'Italia', 5.793, 11, 'Tradicional', 1.21, 0, 2),
('Circuito de Suzuka', 'Japón', 5.807, 18, 'Tradicional', 1.30, 0, 4),
('Circuito de Spa-Francorchamps', 'Bélgica', 7.004, 20, 'Tradicional', 1.41, 0, 3),
('Circuito de Interlagos', 'Brasil', 4.309, 15, 'Tradicional', 1.12, 0, 4),
('Circuito de Austin', 'Estados Unidos', 5.513, 20, 'Tradicional', 1.36, 0, 3),
('Circuito de Baku', 'Azerbaiyán', 6.003, 20, 'Urbano', 1.40, -28, 5),
('Circuito de Zandvoort', 'Países Bajos', 4.259, 14, 'Tradicional', 1.30, -2, 3),
('Circuito de Barcelona-Cataluña', 'España', 4.655, 16, 'Tradicional', 1.21, 0, 3),
('Circuito de Yas Marina', 'Emiratos Árabes Unidos', 5.554, 21, 'Urbano', 1.39, 0, 4),
('Circuito de Montreal', 'Canadá', 4.361, 14, 'Urbano', 1.13, 0, 3),
('Circuito de Hungaroring', 'Hungría', 4.381, 14, 'Tradicional', 1.18, 0, 3),
('Circuito de Sochi', 'Rusia', 5.848, 18, 'Urbano', 1.38, -2, 4),
('Circuito de Portimão', 'Portugal', 4.692, 15, 'Tradicional', 1.20, -2, 3),
('Circuito de Jeddah', 'Arabia Saudita', 6.174, 27, 'Urbano', 1.30, -10, 5),
('Circuito de Miami', 'Estados Unidos', 5.412, 19, 'Urbano', 1.35, 0, 4),
('Circuito de Las Vegas', 'Estados Unidos', 6.120, 17, 'Urbano', 1.40, 0, 5),
('Circuito de Imola', 'Italia', 4.909, 63, 'Tradicional', 1.20, 0, 3),
('Circuito de Zeltweg', 'Austria', 4.318, 10, 'Tradicional', 1.25, -2, 3),
('Circuito de Hockenheim', 'Alemania', 4.574, 17, 'Tradicional', 1.20, 0, 3),
('Circuito de Nürburgring', 'Alemania', 5.148, 15, 'Tradicional', 1.30, 0, 4),
('Circuito de Estambul', 'Turquía', 5.338, 14, 'Tradicional', 1.25, -2, 3),
('Circuito de Silverstone', 'Reino Unido', 5.891, 18, 'Tradicional', 1.27, 0, 3),
('Circuito de Sakhir', 'Bahréin', 5.412, 15, 'Tradicional', 1.30, 0, 4);

INSERT INTO carrera (circuito_id, temporada, fecha, condiciones_climaticas, temperatura_ambiente, temperatura_pista, humedad) VALUES
(1, 2023, '2023-05-28', 'Soleado', 25.0, 30.0, 40),
(2, 2023, '2023-07-09', 'Lluvioso', 20.0, 22.0, 80),
(3, 2023, '2023-09-03', 'Soleado', 30.0, 32.0, 35),
(4, 2023, '2023-10-08', 'Nublado', 22.0, 24.0, 60),
(5, 2023, '2023-11-26', 'Soleado', 28.0, 29.0, 50),
(6, 2023, '2023-04-16', 'Lluvioso', 18.0, 20.0, 75),
(7, 2023, '2023-06-11', 'Soleado', 27.0, 28.0, 45),
(8, 2023, '2023-08-27', 'Nublado', 24.0, 26.0, 55),
(9, 2023, '2023-12-10', 'Soleado', 29.0, 31.0, 40),
(10, 2023, '2023-03-19', 'Lluvioso', 21.0, 23.0, 70),
(11, 2023, '2023-05-14', 'Soleado', 26.0, 27.0, 50),
(12, 2023, '2023-07-30', 'Nublado', 23.0, 25.0, 60),
(13, 2023, '2023-09-17', 'Soleado', 28.0, 29.0, 45),
(14, 2023, '2023-10-22', 'Lluvioso', 19.0, 21.0, 80),
(15, 2023, '2023-11-12', 'Soleado', 30.0, 31.0, 35),
(16, 2023, '2023-04-02', 'Nublado', 22.0, 24.0, 65),
(17, 2023, '2023-06-25', 'Soleado', 27.0, 28.0, 50),
(18, 2023, '2023-08-20', 'Lluvioso', 20.0, 22.0, 75),
(19, 2023, '2023-12-03', 'Soleado', 29.0, 30.0, 40),
(20, 2023, '2023-03-12', 'Nublado', 24.0, 26.0, 55),
(21, 2023, '2023-05-07', 'Soleado', 25.0, 27.0, 45),
(22, 2023, '2023-07-16', 'Lluvioso', 18.0, 20.0, 80),
(23, 2023, '2023-09-24', 'Soleado', 30.0, 31.0, 35),
(24, 2023, '2023-10-29', 'Nublado', 22.0, 23.0, 60);





    