EXEC SpisokPrepodovatelei;
EXEC SpisokSlNaK;

DECLARE @StudentID INT = 10 ; -- ����� ������� ��� ���������
DECLARE @TotalAmount MONEY;
EXEC SumContr @StudentID, @TotalAmount OUTPUT;
SELECT @TotalAmount AS TotalContractAmount;

EXEC SpisokSlOrg;