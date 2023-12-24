
--2.14.  Составить список преподавателей мужского пола, имеющих степень, стоимость часа работы которых меньше средней стоимости часа. 
--Список должен содержать ФИО преподавателя, контактные данные, степень, стоимость часа работы. 
--Список отсортировать по степени и фамилии преподавателя.

CREATE PROCEDURE SpisokPrepodovatelei AS
BEGIN
SELECT SURNAMETCH AS "Фамилия преподавателя", NAMETCH  AS "Имя преподователя", OTCHTCH AS "Отчество преподавателя", CONTTCH "Контактные данные",DOL AS "Степень", SAL AS "Зарплата в час"
FROM TEACHER
WHERE DOL IS NOT NULL AND (SAL < (SELECT AVG(SAL) FROM TEACHER))
ORDER BY DOL, SURNAMETCH
END;