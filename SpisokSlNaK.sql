--2.3.  ��������� ������ ���������� ��� ����������, ������� ������� ���������� �� ����� �. 
--������ ������ ��������� ��� ���������, �������� ������, �� ������� �� �������� ��������, ��������� ������� �����. 
--������ ������������� �� ��������� �����.
CREATE PROCEDURE SpisokSlNaK AS
BEGIN
SELECT SURNAME_STUD '������� ��������', NAME_STUD '��� ��������', OTCH_STUD '�������� ��������', COURSE.TITLE '�������� �����', COURSE.COST '��������� �����'
FROM STUDENT
INNER JOIN CONTRACTY  ON  STUDENT.ID_STUD = CONTRACTY.ID_STUD
INNER JOIN COURSE ON CONTRACTY.ID_CRS = COURSE.ID_CRS 
WHERE SURNAME_STUD LIKE '�%'
ORDER BY COST
END;