DECLARE @ClientCode INT;
SET @ClientCode =2 --укажите код клиента здесь

-- Задача 1: Вывести поля для заданного кода клиента
SELECT *
FROM Clients
WHERE ClientCode = @ClientCode;

-- Задача 2: Вывести поля для заданного кода поездки
DECLARE @TripCode INT;
SET @TripCode =101 -- укажите код поездки здесь


SELECT *
FROM Trips
WHERE TripCode = @TripCode;

-- Задача 3: Вывести поля для заданного кода маршрута
DECLARE @RouteCode INT;
SET @RouteCode =201 -- укажите код маршрута здесь


SELECT *
FROM Routes
WHERE RouteCode = @RouteCode;


