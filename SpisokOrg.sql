--2.5.  Составить список курсов, на которых обучались слушателей из заданной организации. 
--Список должен содержать ФИО слушателя, контактные данные, название курса, тип курса, количество часов. 
--Список отсортировать по названию курса и ФИО слушателя.
CREATE PROCEDURE SpisokSlOrg AS
BEGIN
SELECT  SURNAME_STUD AS 'Фамилия студента', NAME_STUD AS 'Имя студента', OTCH_STUD AS 'Отчество студента',  CONT AS 'Контактные данные', COURSE.TYPCRS AS 'Тип курса', COURSE.HUR AS 'Количество часов'
FROM STUDENT
INNER JOIN CONTRACTY ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE ORG like '%ТУ%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD
END;