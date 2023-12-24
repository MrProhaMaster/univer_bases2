SELECT
    Clients.ClientCode,
    Surname_CL,
    NAME_CL,
    DestinationCountry,
    Treatment,
    Excursions
FROM
    Clients
JOIN
    Trips ON Clients.ClientCode = Trips.ClientCode
JOIN
    Routes ON Trips.TripCode = Routes.TripCode
WHERE
    Treatment = 'Да' AND Excursions = 'Да';



