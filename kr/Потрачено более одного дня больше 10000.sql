	SELECT
    Clients.ClientCode,
    Surname_CL,
    NAME_CL,
    SUM(VisaCost + TransportCost + DailyStayCost) AS TotalSpent
FROM
    Clients
JOIN
    Trips ON Clients.ClientCode = Trips.ClientCode
JOIN
    Routes ON Trips.TripCode = Routes.TripCode
GROUP BY
    Clients.ClientCode, Surname_CL, NAME_CL
HAVING
    SUM(VisaCost + TransportCost + DailyStayCost) > 10000; -- Adjust the threshold as needed
