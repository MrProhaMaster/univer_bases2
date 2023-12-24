--2.5.  ��������� ������ ������, �� ������� ��������� ���������� �� �������� �����������. 
--������ ������ ��������� ��� ���������, ���������� ������, �������� �����, ��� �����, ���������� �����. 
--������ ������������� �� �������� ����� � ��� ���������.
CREATE PROCEDURE SpisokSlOrg AS
BEGIN
SELECT  SURNAME_STUD AS '������� ��������', NAME_STUD AS '��� ��������', OTCH_STUD AS '�������� ��������',  CONT AS '���������� ������', COURSE.TYPCRS AS '��� �����', COURSE.HUR AS '���������� �����'
FROM STUDENT
INNER JOIN CONTRACTY ON CONTRACTY.ID_STUD = STUDENT.ID_STUD
INNER JOIN COURSE ON COURSE.ID_CRS = CONTRACTY.ID_CRS
WHERE ORG like '%��%'
ORDER BY COURSE.TITLE, SURNAME_STUD, NAME_STUD, OTCH_STUD
END;