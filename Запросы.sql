
--3.4.	��������� ������ �������� ������ � ��������� �� ���������, � �������� ������� ���� ����� �SQL�. � �������������� ������ �������� �������� �����, ���������� �����, ��� �����, ��� ���������. 
--������ ������������� �� ���������.
SELECT TITLE, HUR, TYPCRS, COST
FROM COURSE
WHERE TITLE LIKE '%SQL%'
ORDER BY COST
-- 3.1.	��������� ������ �������� ������ � ��������� �� ���������, ������� ����� ��� ����������.
SELECT TITLE, COST
FROM COURSE
WHERE TYPCRS LIKE '%���������%'
-- 3.2.	��������� ������ �������� ������, � ������� ��������� ����� 1500 ���. � � ������� ����� ��� ����������. 
--������ ������������� �� �������� ������.
SELECT TITLE
FROM COURSE
WHERE (COST < 1500 AND TYPCRS like '%���������%')
ORDER BY TITLE

--3.3.	��������� ������ �������� ������, � ������� ��������� �����1500 ���. � � ������� ����� ���, �������� �� ����������.

SELECT TITLE
FROM COURSE
WHERE (COST > 1500 AND(NOT TYPCRS like '%���������%'))

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD, CONT, DISCNT
FROM STUDENT 
WHERE ORG like '%��%'


--3.6.	��������� ������ ���������� � ���������, ������������� �� ����� �. ������ ������ ��������� ��� ���������, ���������� ������, �������� �����������. 
--������ ������������� �� �������� �����������.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  SURNAME_STUD like '�%'
ORDER BY ORG

--3.7.	��������� ������ ����������-������ � ������, ������������� �� ����� �. ������ ������ ��������� ��� ���������, ���������� ������, �������� �����������. 
--������ ������������� �� �������� �����������.

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  NAME_STUD like '�%' AND SX LIKE '%�%'
ORDER BY ORG

--3.8.	��������� ������ ���������� �������� ����������� ������ �������� ���� � � �������, �� ���������������� �� ����� ��� ��� ���.

SELECT SURNAME_STUD,NAME_STUD, OTCH_STUD
FROM STUDENT
WHERE ORG like '%����%' AND SX like '%�%' and (NOT( NAME_STUD like '%�' or NAME_STUD like '%�'))

--3.9.	��������� ������ ����������, ������� ����� ������ �� �������� � ��������� �� 3 �� 1. ������ ������ ��������� ��� ���������, ���������� ������, �������� �����������. 
--������ ������������� �� ������� ���������.

SELECT SURNAME_STUD,NAME_STUD, OTCH_STUD, CONT, ORG
FROM STUDENT
WHERE DISCNT between 1 and 3 
ORDER BY SURNAME_STUD

--3.10.	��������� ������ ��������������, � ������� ��������� ���� ������ ����� � ��������� �� 600 ���. �� 900 ���. ������ ������ ��������� ��� �������������, ���������� ������, �������. 
--������ ������������� �� ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL
FROM TEACHER
WHERE SAL >= 600 and SAL <=900
ORDER BY SURNAMETCH, NAMETCH, OTCHTCH

--3.11.	��������� ������ ��������������, �� ������� ������� �	 ������� ��������� ���� ����� 1000 ���. ������ ������ ��������� ��� �������������, ���������� ������, ��������� ���� ������. 
--������ ������������� �� ��������� ����.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL
FROM TEACHER
WHERE SAL>1000 and DOL is null
ORDER BY SAL

--3.12.	��������� ������ �������������� ������ �������� ���� � � ���������, ������������� �� ����� � ��� �.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH
FROM TEACHER
WHERE SX_TC like'%�%' AND(SURNAMETCH like '�%' or SURNAMETCH like '�%')

--3.13.	��������� ������ ��������������, ������� ������� � �� ���������� ���� ����� 900 ���. ������ ������ ��������� ��� �������������, ���������� ������, ��������� ���� ������, �������. 
--������ ������������� �� ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL ,DOL
FROM TEACHER
WHERE SAL<900 and DOL is not null
ORDER BY SURNAMETCH

--3.14.	��������� ������ �������������� �������� ����, �� ������� �������, ��� ������� ���������� �� ����� �. ������ ������ ��������� ��� �������������, ���������� ������, �������, ��������� ���� ������. 
-- ������ ������������� �� ������� � ������� �������������.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH,DOL, SAL
FROM TEACHER 
WHERE (DOL is NULL) and NAMETCH like '�%'
ORDER BY DOL, SURNAMETCH

-- 3.15.	��������� ������ ��������������, ������� �������, ������� ������� ���������� �� ����� � � ������� ��������� ���� ����� 1000 ���. ������ ������ ��������� ��� �������������, ���������� ������, ��������� ���� ������. ������ �������������  �� ������� � ��������� ����.

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL, SAL
FROM TEACHER
WHERE SAL >= 1000 and DOL is not NULL and SURNAMETCH like '�%'
ORDER BY DOL, SAL

