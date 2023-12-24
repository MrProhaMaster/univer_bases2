
--2.1.  Составить список слушателей заданного курса. Список включает ФИО слушателя, его контактные данные, название курса, его тип. 
--Список отсортировать по фамилии слушателя.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, COURSE.TITLE, COURSE.TYPCRS
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE COURSE.TITLE like '%Разработка веб-сайтов%'
ORDER BY SURNAME_STUD

--2.2.  Составить список слушателей курсов, стоимость которых менее 1500 руб. и с которые имеют тип «начальный».
--Список отсортировать по названию курсов и фамилии слушателя.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , COURSE.TITLE
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE COST <1500 and TYPCRS like 'Начальный'
ORDER BY TITLE, SURNAME_STUD

--2.3.  Составить список контрактов для слушателей, фамилия которых начинается на букву К. 
--Список должен содержать ФИО слушателя, название курсов, на которые он заключал контракт, стоимость каждого курса. 
--Список отсортировать по стоимости курса.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , COURSE.TITLE, COURSE.COST
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE 'К%'
ORDER BY COST

--2.4.  Составить список слушателей, с которыми занимается заданный преподаватель.
--В результирующий список включить название курса, количество часов, тип курса, ФИО слушателя, его контактные данные. 
--Список отсортировать по названию курса и ФИО слушателя.

SELECT COURSE.TITLE,COURSE.HUR,COURSE.TYPCRS, SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT
FROM TEACHER
INNER JOIN COURSE ON COURSE.ID_TCH = TEACHER.ID_TCH
INNER JOIN CONTRACTY ON COURSE.ID_CRS= CONTRACTY.ID_CRS
INNER JOIN STUDENT ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
WHERE SURNAMETCH like '%Макарова%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD

--2.5.  Составить список курсов, на которых обучались слушателей из заданной организации. 
--Список должен содержать ФИО слушателя, контактные данные, название курса, тип курса, количество часов. 
--Список отсортировать по названию курса и ФИО слушателя.

SELECT  SURNAME_STUD, NAME_STUD, OTCH_STUD,  CONT, COURSE.TYPCRS, COURSE.HUR
FROM STUDENT
INNER JOIN CONTRACTY ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE ORG like '%ТУ%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD

--2.6.  Составить список слушателей с фамилиями, начинающимися на букву К, которые обучались на курсах, имеющих тип «начальный».
--Список должен содержать ФИО слушателя, контактные данные, название организации, название курса, его стоимость. 
--Список отсортировать по названию организации и ФИО слушателя.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD ,ORG, COURSE.TITLE, COURSE.COST
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE 'Н%' AND TYPCRS like '%Начальный%'
ORDER BY ORG, SURNAME_STUD, NAME_STUD, OTCH_STUD 

--2.7.  Составить список курсов, на которые отведено максимальное количество часов.
--Список должен содержать  название, тип, стоимость, количество часов. 
--Список отсортировать по названию курса.

SELECT TITLE, TYPCRS, COST, HUR
FROM COURSE
WHERE HUR = (SELECT MAX(HUR) FROM COURSE)
ORDER BY TITLE 

--2.8.  Составить список курсов, стоимость которых выше средней. 
--Список должен содержать название курса, тип, стоимость и количество часов.
SELECT TITLE, TYPCRS, COST,HUR
FROM COURSE 
WHERE COST> (SELECT AVG (COST) FROM COURSE)

--2.9.  Составить список слушателей, которые имеют максимальную скидку на обучение. 
--Список должен содержать ФИО слушателя, контактные данные, название организации.
--Список отсортировать по фамилии.
SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, ORG
FROM STUDENT
WHERE DISCNT = (SELECT MAX(DISCNT) FROM STUDENT)
ORDER BY SURNAME_STUD


--2.10.  Составить список преподавателей, у которых стоимость часа работы выше средней. 
--Список должен содержать ФИО преподавателя, контактные данные, степень. 
--Список отсортировать по фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL
FROM TEACHER
WHERE SAL > (SELECT AVG(SAL) FROM TEACHER)
ORDER BY SURNAMETCH

--2.11.  Составить список слушателей, которые обучаются на курсах с максимальной стоимостью. 
--Список должен содержать ФИО слушателя, контактные данные, название курса, его стоимость. 
--Список отсортировать по названию курса и ФИО слушателя.
SELECT STUDENT.SURNAME_STUD, STUDENT.NAME_STUD, STUDENT.OTCH_STUD, STUDENT.CONT, COURSE.TITLE, COURSE.COST
FROM STUDENT 
INNER JOIN CONTRACTY ON STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE COURSE.COST = (SELECT MAX(COST) FROM COURSE)
ORDER BY COURSE. TITLE ,STUDENT.SURNAME_STUD, STUDENT.NAME_STUD, STUDENT.OTCH_STUD

--2.12.  Составить список преподавателей, которые проводят занятия на курсах, в названии которых есть слово «SQL».
--Список должен содержать ФИО преподавателя, название курса, его тип и продолжительность. Данные отсортировать по ФИО преподавателя.
SELECT SURNAMETCH, NAMETCH, OTCHTCH, COURSE.TITLE, COURSE.TYPCRS, COURSE.HUR
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE TITLE LIKE '%SQL%'
ORDER BY SURNAMETCH, NAMETCH, OTCHTCH

--2.13.  Составить список преподавателей, имеющих степень и преподающих на курсах, длительность которых более 36 часов. 
--Список должен содержать ФИО преподавателя, контактные данные, степень, название курса и его стоимость. 
--Список отсортировать по фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, COURSE.TITLE, COURSE.COST
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE TEACHER.DOL is not null AND (COURSE.HUR > 36 ) 
ORDER BY SURNAMETCH

--2.14.  Составить список преподавателей мужского пола, имеющих степень, стоимость часа работы которых меньше средней стоимости часа. 
--Список должен содержать ФИО преподавателя, контактные данные, степень, стоимость часа работы. 
--Список отсортировать по степени и фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL
FROM TEACHER
WHERE DOL IS NOT NULL AND (SAL < (SELECT AVG(SAL) FROM TEACHER))
ORDER BY DOL, SURNAMETCH

--2.15.  Составить список преподавателей, имеющих степень и стоимость часа более 3000 руб., которые ведут занятия на курсах, имеющих тип «начальный». 
--Список должен содержать ФИО преподавателя, контактные данные, стоимость часа работы, название курса и его стоимость. 
--Список отсортировать по степени и стоимости часа.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL, COURSE.TITLE, COURSE.COST
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE  DOL IS NOT NULL and SAL> 1000 AND COURSE.TYPCRS like '%Начальный%'
ORDER BY DOL, SAL