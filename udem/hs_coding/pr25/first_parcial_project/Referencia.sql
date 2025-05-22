-- Tabla de Películas
CREATE TABLE Peliculas (
    ID_Pelicula INT PRIMARY KEY,
    Titulo VARCHAR(255), 
    Fecha_Estreno DATE,
    Duracion INT,
    Sinopsis TEXT,
    Calificacion FLOAT,
    ID_Genero INT
);
-- Varchar sirve para poner un limite de caracteres

-- Tabla de Actores
CREATE TABLE Actores (
    ID_Actor INT PRIMARY KEY,
    Nombre_Actor VARCHAR(255),
    Fecha_Nacimiento DATE,
    Nacionalidad VARCHAR(100)
);

-- Tabla de Directores
CREATE TABLE Directores (
    ID_Director INT PRIMARY KEY,
    Nombre_Director VARCHAR(255),
    Fecha_Nacimiento DATE,
    Nacionalidad VARCHAR(100)
);

-- Tabla de Géneros
CREATE TABLE Generos (
    ID_Genero INT PRIMARY KEY,
    Nombre_Genero VARCHAR(100)
);

-- Tabla de relación Película_Actor
CREATE TABLE Pelicula_Actor (
    ID_Pelicula INT,
    ID_Actor INT,
    FOREIGN KEY (ID_Pelicula) REFERENCES Peliculas(ID_Pelicula),
    FOREIGN KEY (ID_Actor) REFERENCES Actores(ID_Actor)
);

-- Tabla de relación Película_Director
CREATE TABLE Pelicula_Director (
    ID_Pelicula INT,
    ID_Director INT,
    FOREIGN KEY (ID_Pelicula) REFERENCES Peliculas(ID_Pelicula),
    FOREIGN KEY (ID_Director) REFERENCES Directores(ID_Director)
);

-- Tabla de relación Película_Género
CREATE TABLE Pelicula_Genero (
    ID_Pelicula INT,
    ID_Genero INT,
    FOREIGN KEY (ID_Pelicula) REFERENCES Peliculas(ID_Pelicula),
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero)
);



-- Inserciones en la tabla Peliculas
INSERT INTO Peliculas (ID_Pelicula, Titulo, Fecha_Estreno, Duracion, Sinopsis, Calificacion, ID_Genero) VALUES
(1, 'The Shawshank Redemption', '1994-09-23', 142, 'A man is imprisoned for a crime he did not commit and finds redemption.', 9.3, 1),
(2, 'The Godfather', '1972-03-24', 175, 'The aging patriarch of an organized crime dynasty transfers control to his son.', 9.2, 2),
(3, 'The Dark Knight', '2008-07-18', 152, 'Batman faces the Joker, who brings chaos to Gotham City.', 9.0, 3),
(4, 'Pulp Fiction', '1994-10-14', 154, 'The lives of two hitmen, a boxer, and a gangster intertwine.', 8.9, 2),
(5, 'Forrest Gump', '1994-07-06', 142, 'A slow-witted man witnesses key moments of American history.', 8.8, 4),
(6, 'Inception', '2010-07-16', 148, 'A thief who steals corporate secrets through dream-sharing technology.', 8.8, 3),
(7, 'Fight Club', '1999-10-15', 139, 'An insomniac and a soap salesman form an underground fight club.', 8.8, 5),
(8, 'The Matrix', '1999-03-31', 136, 'A hacker discovers reality is a simulated world controlled by machines.', 8.7, 3),
(9, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 178, 'A young hobbit embarks on a quest to destroy an evil ring.', 8.8, 6),
(10, 'The Lord of the Rings: The Return of the King', '2003-12-17', 201, 'The final battle for Middle-earth begins.', 9.0, 6),
(11, 'Gladiator', '2000-05-05', 155, 'A betrayed Roman general seeks revenge.', 8.5, 2),
(12, 'Interstellar', '2014-11-07', 169, 'A team of astronauts travels through a wormhole to save humanity.', 8.6, 3),
(13, 'Titanic', '1997-12-19', 195, 'A love story unfolds on the ill-fated Titanic.', 7.8, 7),
(14, 'Avatar', '2009-12-18', 162, 'A marine on an alien planet must choose sides in a conflict.', 7.8, 3),
(15, 'Schindler’s List', '1993-12-15', 195, 'A German businessman saves Jewish refugees during WWII.', 9.0, 8),
(16, 'Saving Private Ryan', '1998-07-24', 169, 'A squad is sent to rescue a soldier during WWII.', 8.6, 8),
(17, 'The Green Mile', '1999-12-10', 189, 'A prison guard witnesses miracles on death row.', 8.6, 4),
(18, 'The Silence of the Lambs', '1991-02-14', 118, 'A young FBI agent seeks help from a cannibalistic serial killer.', 8.6, 5),
(19, 'Se7en', '1995-09-22', 127, 'Two detectives hunt a serial killer using the seven deadly sins as a theme.', 8.6, 5),
(20, 'Goodfellas', '1990-09-19', 146, 'A young man works his way up the ranks of a mob.', 8.7, 2),
(21, 'Braveheart', '1995-05-24', 178, 'William Wallace leads the Scots in a fight for freedom.', 8.4, 2),
(22, 'The Lion King', '1994-06-24', 88, 'A lion prince flees his kingdom after his father is killed.', 8.5, 9),
(23, 'Toy Story', '1995-11-22', 81, 'Toys come to life and deal with change when a new toy arrives.', 8.3, 9),
(24, 'The Incredibles', '2004-11-05', 115, 'A family of superheroes is forced to live in hiding.', 8.0, 9),
(25, 'Finding Nemo', '2003-05-30', 100, 'A clownfish searches for his lost son.', 8.2, 9),
(26, 'Up', '2009-05-29', 96, 'An elderly man and a boy embark on an adventure in a flying house.', 8.2, 9),
(27, 'The Departed', '2006-10-06', 151, 'An undercover cop and a mole try to identify each other.', 8.5, 2),
(28, 'Joker', '2019-10-04', 122, 'A mentally troubled man transforms into a criminal mastermind.', 8.4, 5),
(29, 'Avengers: Endgame', '2019-04-26', 181, 'The Avengers assemble to reverse the damage caused by Thanos.', 8.4, 3),
(30, 'Black Panther', '2018-02-16', 134, 'T’Challa returns home to Wakanda to take his rightful place as king.', 7.3, 3),
(31, 'Spider-Man: No Way Home', '2021-12-17', 148, 'Peter Parker seeks help to restore his secret identity.', 8.3, 3),
(32, 'Harry Potter and the Philosopher''s Stone', '2001-11-16', 152, 'A young wizard discovers his magical heritage.', 7.6, 6),
(33, 'The Hunger Games', '2012-03-23', 142, 'A girl must survive a deadly televised competition.', 7.2, 7),
(34, 'Django Unchained', '2012-12-25', 165, 'A freed slave teams up with a bounty hunter to rescue his wife.', 8.4, 2),
(35, 'La La Land', '2016-12-09', 128, 'A jazz musician and an actress fall in love while pursuing dreams.', 8.0, 7),
(36, 'A Star Is Born', '2018-10-05', 136, 'A musician helps a young singer find fame.', 7.6, 7),
(37, 'Frozen', '2013-11-27', 102, 'A princess sets off to find her estranged sister.', 7.4, 9),
(38, 'Moana', '2016-11-23', 107, 'A young girl sets sail to save her people.', 7.6, 9),
(39, 'Coco', '2017-11-22', 105, 'A boy travels to the Land of the Dead to meet his ancestors.', 8.4, 9),
(40, 'The Little Mermaid', '1989-11-17', 83, 'A mermaid dreams of becoming human.', 7.6, 9);

-- Inserciones en la tabla Actores
INSERT INTO Actores (ID_Actor, Nombre_Actor, Fecha_Nacimiento, Nacionalidad) VALUES
(1, 'Morgan Freeman', '1937-06-01', 'Estadounidense'),
(2, 'Marlon Brando', '1924-04-03', 'Estadounidense'),
(3, 'Christian Bale', '1974-01-30', 'Británico'),
(4, 'Leonardo DiCaprio', '1974-11-11', 'Estadounidense'),
(5, 'Tom Hanks', '1956-07-09', 'Estadounidense'),
(6, 'Keanu Reeves', '1964-09-02', 'Canadiense'),
(7, 'Robert Downey Jr.', '1965-04-04', 'Estadounidense'),
(8, 'Harrison Ford', '1942-07-13', 'Estadounidense'),
(9, 'Emma Watson', '1990-04-15', 'Británica'),
(10, 'Scarlett Johansson', '1984-11-22', 'Estadounidense'),
(11, 'Brad Pitt', '1963-12-18', 'Estadounidense'),
(12, 'Johnny Depp', '1963-06-09', 'Estadounidense'),
(13, 'Will Smith', '1968-09-25', 'Estadounidense'),
(14, 'Jodie Foster', '1962-11-19', 'Estadounidense'),
(15, 'Samuel L. Jackson', '1948-12-21', 'Estadounidense'),
(16, 'Julia Roberts', '1967-10-28', 'Estadounidense'),
(17, 'Natalie Portman', '1981-06-09', 'Estadounidense'),
(18, 'Mark Ruffalo', '1967-11-22', 'Estadounidense'),
(19, 'Tom Hardy', '1977-09-15', 'Británico'),
(20, 'Emma Stone', '1988-11-06', 'Estadounidense');


-- Inserciones en la tabla Directores
INSERT INTO Directores (ID_Director, Nombre_Director, Fecha_Nacimiento, Nacionalidad) VALUES
(1, 'Steven Spielberg', '1946-12-18', 'Estadounidense'),
(2, 'Christopher Nolan', '1970-07-30', 'Británico'),
(3, 'Quentin Tarantino', '1963-03-27', 'Estadounidense'),
(4, 'Peter Jackson', '1961-10-31', 'Neozelandés'),
(5, 'James Cameron', '1954-08-16', 'Canadiense'),
(6, 'Ridley Scott', '1937-11-30', 'Británico'),
(7, 'Martin Scorsese', '1942-11-17', 'Estadounidense'),
(8, 'Francis Ford Coppola', '1939-04-07', 'Estadounidense'),
(9, 'George Lucas', '1944-05-14', 'Estadounidense'),
(10, 'Tim Burton', '1958-08-25', 'Estadounidense'),
(11, 'J.J. Abrams', '1966-06-27', 'Estadounidense'),
(12, 'David Fincher', '1962-08-28', 'Estadounidense'),
(13, 'Robert Zemeckis', '1952-05-14', 'Estadounidense'),
(14, 'Guy Ritchie', '1968-09-10', 'Británico'),
(15, 'Jon Favreau', '1966-10-19', 'Estadounidense'),
(16, 'Woody Allen', '1935-12-01', 'Estadounidense');


-- Inserciones en la tabla Géneros
INSERT INTO Generos (ID_Genero, Nombre_Genero) VALUES
(1, 'Drama'),
(2, 'Crimen'),
(3, 'Acción'),
(4, 'Comedia'),
(5, 'Suspenso'),
(6, 'Fantasía'),
(7, 'Romance'),
(8, 'Bélico'),
(9, 'Animación'),
(10, 'Aventura'),
(11, 'Ciencia Ficción'),
(12, 'Terror');


-- Inserciones en la tabla Película_Actor
INSERT INTO Pelicula_Actor (ID_Pelicula, ID_Actor) VALUES
(1, 1), (1, 5), -- The Shawshank Redemption: Morgan Freeman, Tom Hanks;
(2, 2), (2, 11), -- The Godfather: Marlon Brando, Al Pacino
(3, 3), (3, 12), -- The Dark Knight: Christian Bale, Heath Ledger
(4, 4), (4, 10), -- Pulp Fiction: Uma Thurman, John Travolta
(5, 5), (5, 9), -- Forrest Gump: Tom Hanks, Robin Wright
(6, 4), (6, 15), -- Inception: Leonardo DiCaprio, Joseph Gordon-Levitt
(7, 6), (7, 18), -- Fight Club: Edward Norton, Brad Pitt
(8, 6), (8, 13), -- The Matrix: Keanu Reeves, Laurence Fishburne
(9, 14), (9, 16), -- The Fellowship of the Ring: Elijah Wood, Ian McKellen
(10, 17), (10, 19), -- The Return of the King: Orlando Bloom, Viggo Mortensen
(11, 20), (11, 1), -- Gladiator: Russell Crowe, Joaquin Phoenix
(12, 2), (12, 13), -- Interstellar: Matthew McConaughey, Anne Hathaway
(13, 9), (13, 1), -- Titanic: Leonardo DiCaprio, Kate Winslet
(14, 10), (14, 5), -- Avatar: Sam Worthington, Zoe Saldana
(15, 8), (15, 18), -- Schindler’s List: Liam Neeson, Ben Kingsley
(16, 7), (16, 15), -- Saving Private Ryan: Tom Hanks, Matt Damon
(17, 9), (17, 18), -- The Green Mile: Tom Hanks, Michael Clarke Duncan
(18, 13), (18, 2), -- The Silence of the Lambs: Jodie Foster, Anthony Hopkins
(19, 7), (19, 8), -- Se7en: Brad Pitt, Morgan Freeman
(20, 13), (20, 10), -- Goodfellas: Robert De Niro, Ray Liotta
(21, 4), (21, 3), -- Braveheart: Mel Gibson, Sophie Marceau
(22, 20), (22, 9), -- The Lion King: Matthew Broderick, Jeremy Irons
(23, 1), (23, 17), -- Toy Story: Tom Hanks, Tim Allen
(24, 15), (24, 10), -- The Incredibles: Craig T. Nelson, Holly Hunter
(25, 9), (25, 7), -- Finding Nemo: Ellen DeGeneres, Albert Brooks
(26, 16), (26, 5), -- Up: Ed Asner, Christopher Plummer
(27, 17), (27, 5), -- The Departed: Leonardo DiCaprio, Matt Damon
(28, 14), (28, 2), -- Joker: Joaquin Phoenix, Robert De Niro
(29, 20), (29, 13), -- Avengers: Endgame: Robert Downey Jr., Chris Hemsworth
(30, 19), (30, 8), -- Black Panther: Chadwick Boseman, Michael B. Jordan
(31, 20), (31, 13), -- Spider-Man: No Way Home: Tom Holland, Benedict Cumberbatch
(32, 9), (32, 16), -- Harry Potter: Daniel Radcliffe, Rupert Grint
(33, 5), (33, 6), -- The Hunger Games: Jennifer Lawrence, Liam Hemsworth
(34, 7), (34, 10), -- Django Unchained: Jamie Foxx, Christoph Waltz
(35, 9), (35, 13), -- La La Land: Ryan Gosling, Emma Stone
(36, 12), (36, 13), -- A Star Is Born: Bradley Cooper, Lady Gaga
(37, 1), (37, 9), -- Frozen: Kristen Bell, Idina Menzel
(38, 9), (38, 7), -- Moana: Auli'i Cravalho, Dwayne Johnson
(39, 10), (39, 18), -- Coco: Anthony Gonzalez, Gael García Bernal
(40, 7), (40, 16); -- The Little Mermaid: Jodi Benson, Samuel E. Wright


-- Inserciones en la tabla Película_Director
INSERT INTO Pelicula_Director (ID_Pelicula, ID_Director) VALUES
(1, 1), -- The Shawshank Redemption: Steven Spielberg
(2, 8), -- The Godfather: Francis Ford Coppola
(3, 2), -- The Dark Knight: Christopher Nolan
(4, 3), -- Pulp Fiction: Quentin Tarantino
(5, 6), -- Forrest Gump: Robert Zemeckis
(6, 2), -- Inception: Christopher Nolan
(7, 2), -- Fight Club: David Fincher
(8, 6), -- The Matrix: Andy Wachowski, Lana Wachowski
(9, 4), -- The Fellowship of the Ring: Peter Jackson
(10, 4), -- The Return of the King: Peter Jackson
(11, 7), -- Gladiator: Ridley Scott
(12, 5), -- Interstellar: Christopher Nolan
(13, 5), -- Titanic: James Cameron
(14, 5), -- Avatar: James Cameron
(15, 7), -- Schindler’s List: Steven Spielberg
(16, 7), -- Saving Private Ryan: Steven Spielberg
(17, 7), -- The Green Mile: Frank Darabont
(18, 12), -- The Silence of the Lambs: Jonathan Demme
(19, 3), -- Se7en: David Fincher
(20, 7), -- Goodfellas: Martin Scorsese
(21, 4), -- Braveheart: Mel Gibson
(22, 10), -- The Lion King: Roger Allers, Rob Minkoff
(23, 9), -- Toy Story: John Lasseter
(24, 9), -- The Incredibles: Brad Bird
(25, 9), -- Finding Nemo: Andrew Stanton
(26, 9), -- Up: Pete Docter
(27, 7), -- The Departed: Martin Scorsese
(28, 10), -- Joker: Todd Phillips
(29, 13), -- Avengers: Endgame: Anthony Russo, Joe Russo
(30, 13), -- Black Panther: Ryan Coogler
(31, 13), -- Spider-Man: No Way Home: Jon Watts
(32, 9), -- Harry Potter: Chris Columbus
(33, 7), -- The Hunger Games: Gary Ross
(34, 12), -- Django Unchained: Quentin Tarantino
(35, 7), -- La La Land: Damien Chazelle
(36, 5), -- A Star Is Born: Bradley Cooper
(37, 9), -- Frozen: Chris Buck, Jennifer Lee
(38, 9), -- Moana: John Musker, Ron Clements
(39, 9), -- Coco: Lee Unkrich, Adrian Molina
(40, 9); -- The Little Mermaid: Ron Clements, John Musker


-- Inserciones en la tabla Película_Género
INSERT INTO Pelicula_Genero (ID_Pelicula, ID_Genero) VALUES
(1, 1), (1, 2), -- The Shawshank Redemption: Drama, Crimen
(2, 1), (2, 2), -- The Godfather: Drama, Crimen
(3, 3), -- The Dark Knight: Acción
(4, 2), (4, 3), -- Pulp Fiction: Crimen, Acción
(5, 1), (5, 7), -- Forrest Gump: Drama, Romance
(6, 11), (6, 3), -- Inception: Ciencia Ficción, Acción
(7, 2), (7, 5), -- Fight Club: Crimen, Suspenso
(8, 3), (8, 2), -- The Matrix: Acción, Ciencia Ficción
(9, 6), -- The Fellowship of the Ring: Fantasía
(10, 6), -- The Return of the King: Fantasía
(11, 8), -- Gladiator: Bélico
(12, 11), -- Interstellar: Ciencia Ficción
(13, 7), (13, 1), -- Titanic: Romance, Drama
(14, 3), (14, 11), -- Avatar: Acción, Ciencia Ficción
(15, 1), (15, 8), -- Schindler’s List: Drama, Bélico
(16, 8), -- Saving Private Ryan: Bélico
(17, 1), -- The Green Mile: Drama
(18, 5), (18, 12), -- The Silence of the Lambs: Suspenso, Terror
(19, 5), (19, 2), -- Se7en: Suspenso, Crimen
(20, 1), -- Goodfellas: Drama
(21, 8), -- Braveheart: Bélico
(22, 9), -- The Lion King: Animación
(23, 9), -- Toy Story: Animación
(24, 9), -- The Incredibles: Animación
(25, 9), -- Finding Nemo: Animación
(26, 9), -- Up: Animación
(27, 1), -- The Departed: Drama
(28, 5), -- Joker: Drama
(29, 3), (29, 11), -- Avengers: Endgame: Acción, Ciencia Ficción
(30, 3), -- Black Panther: Acción
(31, 3), -- Spider-Man: No Way Home: Acción
(32, 9), -- Harry Potter: Animación
(33, 9), -- The Hunger Games: Animación
(34, 3), -- Django Unchained: Acción
(35, 4), -- La La Land: Comedia
(36, 7), -- A Star Is Born: Drama
(37, 9), -- Frozen: Animación
(38, 9), -- Moana: Animación
(39, 9), -- Coco: Animación
(40, 9); -- The Little Mermaid: Animación
