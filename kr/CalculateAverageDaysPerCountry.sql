CREATE PROCEDURE CalculateAverageDaysPerCountry
AS
BEGIN
    SELECT
        DestinationCountry,
        AVG(NumberOfDays) AS AverageDays
    FROM
        Routes
    GROUP BY
        DestinationCountry;
END;
