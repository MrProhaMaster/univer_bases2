CREATE PROCEDURE CalculateTotalRevenue
AS
BEGIN
    SELECT SUM(VisaCost + TransportCost + DailyStayCost) AS '����� ���������'
    FROM Trips;
END;
