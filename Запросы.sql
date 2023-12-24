
--3.4.	Составить список названий курсов с указанием их стоимости, в названии которых есть слово ‘SQL’. В результирующий список включить название курса, количество часов, тип курса, его стоимость. 
--Список отсортировать по стоимости.
SELECT TITLE, HUR, TYPCRS, COST
FROM COURSE
WHERE TITLE LIKE '%SQL%'
ORDER BY COST
-- 3.1.	Составить список названий курсов с указанием их стоимости, которые имеют тип «начальный».
SELECT TITLE, COST
FROM COURSE
WHERE TYPCRS LIKE '%Начальный%'
-- 3.2.	Составить список названий курсов, у которых стоимость менее 1500 руб. и с которые имеют тип «начальный». 
--Список отсортировать по названию курсов.
SELECT TITLE
FROM COURSE
WHERE (COST < 1500 AND TYPCRS like '%Начальный%')
ORDER BY TITLE

--3.3.	Составить список названий курсов, у которых стоимость более1500 руб. и с которые имеют тип, отличный от «начальный».

SELECT TITLE
FROM COURSE
WHERE (COST > 1500 AND(NOT TYPCRS like '%Начальный%'))

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, DISCNT
FROM STUDENT 
WHERE ORG like '%ТУ%'


--3.6.	Составить список слушателей с фамилиями, начинающимися на букву К. Список должен содержать ФИО слушателя, контактные данные, название организации. 
--Список отсортировать по названию организации.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  SURNAME_STUD like 'К%'
ORDER BY ORG

--3.7.	Составить список слушателей-женщин с именем, начинающимися на букву А. Список должен содержать ФИО слушателя, контактные данные, название организации. 
--Список отсортировать по названию организации.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  NAME_STUD like 'А%' AND SX LIKE '%Ж%'
ORDER BY ORG

--3.8.	Составить список слушателей заданной организации только женского пола и с именами, не заканчивающимися на букву «я» или «ь».

SELECT SURNAME_STUD,NAME_STUD, OTCH_STUD
FROM STUDENT
WHERE ORG like '%КГТА%' AND SX like '%Ж%' and (NOT( NAME_STUD like '%я' or NAME_STUD like '%ь'))

--3.9.	Составить список слушателей, которые имеют скидку на обучение в диапазоне от 3 до 1. Список должен содержать ФИО слушателя, контактные данные, название организации. 
--Список отсортировать по фамилии слушателя.

SELECT SURNAME_STUD,NAME_STUD, OTCH_STUD, CONT, ORG
FROM STUDENT
WHERE DISCNT between 1 and 3 
ORDER BY SURNAME_STUD

--3.10.	Составить список преподавателей, у которых стоимость часа работы лежит в диапазоне от 600 руб. до 900 руб. Список должен содержать ФИО преподавателя, контактные данные, степень. 
--Список отсортировать по фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL
FROM TEACHER
WHERE SAL >= 600 and SAL <=900
ORDER BY SURNAMETCH, NAMETCH, OTCHTCH

--3.11.	Составить список преподавателей, не имеющих степени и	 имеющих стоимость часа более 1000 руб. Список должен содержать ФИО преподавателя, контактные данные, стоимость часа работы. 
--Список отсортировать по стоимости часа.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL
FROM TEACHER
WHERE SAL>1000 and DOL is null
ORDER BY SAL

--3.12.	Составить список преподавателей только женского пола и с фамилиями, начинающимися на букву Б или В.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH
FROM TEACHER
WHERE SX_TC like'%Ж%' AND(SURNAMETCH like 'Б%' or SURNAMETCH like 'В%')

--3.13.	Составить список преподавателей, имеющих степень и со стоимостью часа менее 900 руб. Список должен содержать ФИО преподавателя, контактные данные, стоимость часа работы, степень. 
--Список отсортировать по фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL ,DOL
FROM TEACHER
WHERE SAL<900 and DOL is not null
ORDER BY SURNAMETCH

--3.14.	Составить список преподавателей мужского пола, не имеющих степени, имя которых начинается на букву С. Список должен содержать ФИО преподавателя, контактные данные, степень, стоимость часа работы. 
-- Список отсортировать по степени и фамилии преподавателя.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL
FROM TEACHER 
WHERE (DOL is NULL) and NAMETCH like 'С%'
ORDER BY DOL, SURNAMETCH

-- 3.15.	Составить список преподавателей, имеющих степень, фамилия которых начинается на букву М и имеющих стоимость часа более 1000 руб. Список должен содержать ФИО преподавателя, контактные данные, стоимость часа работы. Список отсортировать  по степени и стоимости часа.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL, SAL
FROM TEACHER
WHERE SAL >= 1000 and DOL is not NULL and SURNAMETCH like 'М%'
ORDER BY DOL, SAL

