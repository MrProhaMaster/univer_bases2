SELECT
    Clients.ClientCode,
    Surname_CL,
    NAME_CL,
    Trips.TripCode,
    Routes.DestinationCountry,
    Trips.StartDate,
    Trips.NumberOfDays,
    Trips.VisaCost,
    Trips.TransportCost,
    Trips.DailyStayCost,
    (Trips.VisaCost + Trips.TransportCost + Trips.DailyStayCost) AS TotalCost
FROM
    Clients
JOIN
    Trips ON Clients.ClientCode = Trips.ClientCode
JOIN
    Routes ON Trips.TripCode = Routes.TripCode;
