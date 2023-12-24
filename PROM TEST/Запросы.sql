CREATE PROCEDURE GetFilmByCategory 
@category VARCHAR(30)
AS
BEGIN
    SELECT *
    FROM FILM
    WHERE KAT_FILM = @category;
END;

