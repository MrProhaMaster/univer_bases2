CREATE PROCEDURE CalculateTotalRevenue
AS
BEGIN
    SELECT SUM(VisaCost + TransportCost + DailyStayCost) AS 'Общая стоимсоть'
    FROM Trips;
END;
