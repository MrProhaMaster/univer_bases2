CREATE PROCEDURE GetFilmStatistics
AS 
BEGIN
   -- «апрос дл€ получени€ статистики по фильмам
   SELECT KAT_FILM, COUNT(*) as TotalCount
   FROM FILM
   GROUP BY KAT_FILM
   ORDER BY TotalCount DESC;
END;