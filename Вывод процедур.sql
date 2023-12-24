EXEC SpisokPrepodovatelei;
EXEC SpisokSlNaK;

DECLARE @StudentID INT = 10 ; -- Здесь укажите код слушателя
DECLARE @TotalAmount MONEY;
EXEC SumContr @StudentID, @TotalAmount OUTPUT;
SELECT @TotalAmount AS TotalContractAmount;

EXEC SpisokSlOrg;