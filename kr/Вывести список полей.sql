DECLARE @ClientCode INT;
SET @ClientCode =2 --������� ��� ������� �����

-- ������ 1: ������� ���� ��� ��������� ���� �������
SELECT *
FROM Clients
WHERE ClientCode = @ClientCode;

-- ������ 2: ������� ���� ��� ��������� ���� �������
DECLARE @TripCode INT;
SET @TripCode =101 -- ������� ��� ������� �����


SELECT *
FROM Trips
WHERE TripCode = @TripCode;

-- ������ 3: ������� ���� ��� ��������� ���� ��������
DECLARE @RouteCode INT;
SET @RouteCode =201 -- ������� ��� �������� �����


SELECT *
FROM Routes
WHERE RouteCode = @RouteCode;


