-- SQLite
CREATE TABLE CustomerComments (
   CommetId INTEGER PRIMARY KEY AUTOINCREMENT,
   CustomerId INTEGER,
   CommentText TEXT,
   CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
   );

   INSERT INTO CustomerComments (CustomerId, CommentText)
   VALUES
       (1, 'Muy buenos artistas me enseñaron a escuchar todo tipo de musica.'),
       (2, 'Gracias por orden que tuvieron a la hora de hacer el database.'),
       (3, 'Les falto artistas famos que a mi me gusta me hubiera gusto ver a Luis Miguel.'),
       (4, 'Me gusto el echo de que el audio se puede descargar en varios tipos de archivo.'),
       (5, 'Hay albumes demasiado buenos la verdad me gusto esta compra.')

    UPDATE CustomerComments 
    SET CommentText = 'El servicio fue excelente, pero me gustaría más opciones de pago'
    WHERE CustomerId = 1;
    
    INSERT INTO CustomerComments (CustomerId, CommentText)
    VALUES
        (6, 'Todo bien, pero el empaque llegó un poco dañado.')

    DELETE FROM CustomerComments
    WHERE CustomerId = 4;

    SELECT COUNT(*) AS TotalCustomerComments FROM Customercomments 

    SELECT * FROM CustomerComments
    WHERE CommentText = 'servico' ; 

    SELECT Country, COUNT(*) AS TotalClients
    FROM Customers
    GROUP BY Country
    ORDER BY TotalClients DESC;

    SELECT CustomerId, COUNT(*) AS NumFacturas
    FROM Invoices
    GROUP BY CustomerId
    ORDER BY NumFacturas DESC;

    SELECT CustomerId, SUM(Total) AS DineroTotal
    FROM Invoices
    GROUP BY CustomerId
    ORDER BY DineroTotal DESC;

    SELECT AlbumId, COUNT(*) AS NumCanciones
    FROM Tracks
    GROUP BY AlbumId
    ORDER BY NumCanciones DESC;

    SELECT Customers.FirstName, Customers.LastName
    FROM Customers
    LEFT JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
    WHERE Invoices.Total IS NULL;

    SELECT Tracks.Name AS SongName, Albums.Title AS NameAlbum
    FROM Tracks
    INNER JOIN Albums ON Tracks.AlbumId = Albums.AlbumId;

    SELECT Invoices.InvoiceId, Invoices.Total, Customers.Country
    FROM invoices
    LEFT JOIN Customers ON Invoices.CustomerId = Customers.CustomerId;

    SELECT Genres.Name AS SongGenre, COUNT(Tracks.TrackId) AS NumTracks
    FROM Tracks
    INNER JOIN Genres ON Tracks.GenreId = Genres.GenreId
    GROUP BY Genres.Name; 

    SELECT media_types.Name AS MediaType, COUNT(Tracks.TrackId) AS NumTracks
    FROM Tracks
    INNER JOIN media_types ON Tracks.MediaTypeId = media_types.MediaTypeId
    GROUP BY media_types.Name;

   