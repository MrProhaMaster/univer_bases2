SELECT *
FROM COURSE
WHERE TITLE LIKE '%SQL%'
ORDER BY COST

SELECT TITLE, COST
FROM COURSE
WHERE TYPCRS LIKE '%���������%'

SELECT TITLE
FROM COURSE
WHERE (COST < 1500 AND TYPCRS like '%���������%')

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, DISCNT
FROM STUDENT
WHERE ORG like '%����%'

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  SURNAME_STUD like '�%'
ORDER BY ORG

SELECT SURNAME_STUD, NAME_STUD, OTCH_STUD , CONT, ORG
FROM STUDENT
WHERE  NAME_STUD like '�%' AND SX LIKE '%�%'
ORDER BY ORG

SELECT SURNAME_STUD,NAME_STUD, OTCH_STUD
FROM STUDENT
WHERE ORG like '%����%' AND SX like '%�%' and (NOT( NAME_STUD like '%�' or NAME_STUD like '%�'))

SELECT SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, DOL
FROM TEACHER
WHERE SAL >= 600 and SAL <=900
ORDER BY SURNAMETCH, NAMETCH, OTCHTCH