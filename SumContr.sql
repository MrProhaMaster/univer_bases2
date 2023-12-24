--����������� �������� ��������� � ������� � ��������
--����������� ��� ����������� ����� ����� ���������� ��������� ���������

CREATE PROCEDURE SumContr 
    @StudentID INT,
    @TotalAmount MONEY OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @TotalAmount = SUM(COST)
    FROM CONTRACTY AS C
    INNER JOIN COURSE AS CR ON C.ID_CRS = CR.ID_CRS
    WHERE C.ID_STUD = @StudentID;

    -- ���� ����� ����� ����� NULL, ������������� �������� 0
    IF (@TotalAmount IS NULL)
        SET @TotalAmount = 0;
END

