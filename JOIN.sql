
--2.1.  ��������� ������ ���������� ��������� �����. ������ �������� ��� ���������, ��� ���������� ������, �������� �����, ��� ���. 
--������ ������������� �� ������� ���������.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, COURSE.TITLE, COURSE.TYPCRS
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE COURSE.TITLE like '%���������� ���-������%'
ORDER BY SURNAME_STUD

--2.2.  ��������� ������ ���������� ������, ��������� ������� ����� 1500 ���. � � ������� ����� ��� ����������.
--������ ������������� �� �������� ������ � ������� ���������.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , COURSE.TITLE
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE COST <1500 and TYPCRS like '���������'
ORDER BY TITLE, SURNAME_STUD

--2.3.  ��������� ������ ���������� ��� ����������, ������� ������� ���������� �� ����� �. 
--������ ������ ��������� ��� ���������, �������� ������, �� ������� �� �������� ��������, ��������� ������� �����. 
--������ ������������� �� ��������� �����.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , COURSE.TITLE, COURSE.COST
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE '�%'
ORDER BY COST

--2.4.  ��������� ������ ����������, � �������� ���������� �������� �������������.
--� �������������� ������ �������� �������� �����, ���������� �����, ��� �����, ��� ���������, ��� ���������� ������. 
--������ ������������� �� �������� ����� � ��� ���������.

SELECT COURSE.TITLE,COURSE.HUR,COURSE.TYPCRS, SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT
FROM TEACHER
INNER JOIN COURSE ON COURSE.ID_TCH = TEACHER.ID_TCH
INNER JOIN CONTRACTY ON COURSE.ID_CRS= CONTRACTY.ID_CRS
INNER JOIN STUDENT ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
WHERE SURNAMETCH like '%��������%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD

--2.5.  ��������� ������ ������, �� ������� ��������� ���������� �� �������� �����������. 
--������ ������ ��������� ��� ���������, ���������� ������, �������� �����, ��� �����, ���������� �����. 
--������ ������������� �� �������� ����� � ��� ���������.

SELECT  SURNAME_STUD, NAME_STUD, OTCH_STUD,  CONT, COURSE.TYPCRS, COURSE.HUR
FROM STUDENT
INNER JOIN CONTRACTY ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE ORG like '%��%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD

--2.6.  ��������� ������ ���������� � ���������, ������������� �� ����� �, ������� ��������� �� ������, ������� ��� ����������.
--������ ������ ��������� ��� ���������, ���������� ������, �������� �����������, �������� �����, ��� ���������. 
--������ ������������� �� �������� ����������� � ��� ���������.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD ,ORG, COURSE.TITLE, COURSE.COST
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE '�%' AND TYPCRS like '%���������%'
ORDER BY ORG, SURNAME_STUD, NAME_STUD, OTCH_STUD 

--2.7.  ��������� ������ ������, �� ������� �������� ������������ ���������� �����.
--������ ������ ���������  ��������, ���, ���������, ���������� �����. 
--������ ������������� �� �������� �����.

SELECT TITLE, TYPCRS, COST, HUR
FROM COURSE
WHERE HUR = (SELECT MAX(HUR) FROM COURSE)
ORDER BY TITLE 

--2.8.  ��������� ������ ������, ��������� ������� ���� �������. 
--������ ������ ��������� �������� �����, ���, ��������� � ���������� �����.
SELECT TITLE, TYPCRS, COST,HUR
FROM COURSE 
WHERE COST> (SELECT AVG (COST) FROM COURSE)

--2.9.  ��������� ������ ����������, ������� ����� ������������ ������ �� ��������. 
--������ ������ ��������� ��� ���������, ���������� ������, �������� �����������.
--������ ������������� �� �������.
SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, ORG
FROM STUDENT
WHERE DISCNT = (SELECT MAX(DISCNT) FROM STUDENT)
ORDER BY SURNAME_STUD


--2.10.  ��������� ������ ��������������, � ������� ��������� ���� ������ ���� �������. 
--������ ������ ��������� ��� �������������, ���������� ������, �������. 
--������ ������������� �� ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL
FROM TEACHER
WHERE SAL > (SELECT AVG(SAL) FROM TEACHER)
ORDER BY SURNAMETCH

--2.11.  ��������� ������ ����������, ������� ��������� �� ������ � ������������ ����������. 
--������ ������ ��������� ��� ���������, ���������� ������, �������� �����, ��� ���������. 
--������ ������������� �� �������� ����� � ��� ���������.
SELECT STUDENT.SURNAME_STUD, STUDENT.NAME_STUD, STUDENT.OTCH_STUD, STUDENT.CONT, COURSE.TITLE, COURSE.COST
FROM STUDENT 
INNER JOIN CONTRACTY ON STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE COURSE.COST = (SELECT MAX(COST) FROM COURSE)
ORDER BY COURSE. TITLE ,STUDENT.SURNAME_STUD, STUDENT.NAME_STUD, STUDENT.OTCH_STUD

--2.12.  ��������� ������ ��������������, ������� �������� ������� �� ������, � �������� ������� ���� ����� �SQL�.
--������ ������ ��������� ��� �������������, �������� �����, ��� ��� � �����������������. ������ ������������� �� ��� �������������.
SELECT SURNAMETCH, NAMETCH, OTCHTCH, COURSE.TITLE, COURSE.TYPCRS, COURSE.HUR
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE TITLE LIKE '%SQL%'
ORDER BY SURNAMETCH, NAMETCH, OTCHTCH

--2.13.  ��������� ������ ��������������, ������� ������� � ����������� �� ������, ������������ ������� ����� 36 �����. 
--������ ������ ��������� ��� �������������, ���������� ������, �������, �������� ����� � ��� ���������. 
--������ ������������� �� ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, COURSE.TITLE, COURSE.COST
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE TEACHER.DOL is not null AND (COURSE.HUR > 36 ) 
ORDER BY SURNAMETCH

--2.14.  ��������� ������ �������������� �������� ����, ������� �������, ��������� ���� ������ ������� ������ ������� ��������� ����. 
--������ ������ ��������� ��� �������������, ���������� ������, �������, ��������� ���� ������. 
--������ ������������� �� ������� � ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL
FROM TEACHER
WHERE DOL IS NOT NULL AND (SAL < (SELECT AVG(SAL) FROM TEACHER))
ORDER BY DOL, SURNAMETCH

--2.15.  ��������� ������ ��������������, ������� ������� � ��������� ���� ����� 3000 ���., ������� ����� ������� �� ������, ������� ��� ����������. 
--������ ������ ��������� ��� �������������, ���������� ������, ��������� ���� ������, �������� ����� � ��� ���������. 
--������ ������������� �� ������� � ��������� ����.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL, COURSE.TITLE, COURSE.COST
FROM TEACHER
INNER JOIN COURSE ON TEACHER.ID_TCH = COURSE.ID_TCH
WHERE  DOL IS NOT NULL and SAL> 1000 AND COURSE.TYPCRS like '%���������%'
ORDER BY DOL, SAL