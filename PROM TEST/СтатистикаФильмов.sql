CREATE PROCEDURE GetFilmStatistics
AS 
BEGIN
   -- ������ ��� ��������� ���������� �� �������
   SELECT KAT_FILM, COUNT(*) as TotalCount
   FROM FILM
   GROUP BY KAT_FILM
   ORDER BY TotalCount DESC;
END;