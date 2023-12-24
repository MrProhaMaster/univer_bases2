CREATE PROCEDURE FindMostExpensiveClientTrip
AS
BEGIN
    SELECT TOP 3
        Clients.ClientCode,
        Surname_CL,
        NAME_CL,
        Trips.TripCode,
        Routes.DestinationCountry,
        (Trips.VisaCost + Trips.TransportCost + Trips.DailyStayCost) AS TotalCost
    FROM
        Clients
    JOIN
        Trips ON Clients.ClientCode = Trips.ClientCode
    JOIN
        Routes ON Trips.TripCode = Routes.TripCode
    ORDER BY
        TotalCost DESC;
END;
