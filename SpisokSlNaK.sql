--2.3.  Составить список контрактов для слушателей, фамилия которых начинается на букву К. 
--Список должен содержать ФИО слушателя, название курсов, на которые он заключал контракт, стоимость каждого курса. 
--Список отсортировать по стоимости курса.
CREATE PROCEDURE SpisokSlNaK AS
BEGIN
SELECT SURNAME_STUD 'Фамилия студента', NAME_STUD 'Имя студента', OTCH_STUD 'Отчество студента', COURSE.TITLE 'Название курса', COURSE.COST 'Стоимость курса'
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE 'К%'
ORDER BY COST
END;