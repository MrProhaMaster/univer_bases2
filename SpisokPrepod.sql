
--2.14.  ��������� ������ �������������� �������� ����, ������� �������, ��������� ���� ������ ������� ������ ������� ��������� ����. 
--������ ������ ��������� ��� �������������, ���������� ������, �������, ��������� ���� ������. 
--������ ������������� �� ������� � ������� �������������.

CREATE PROCEDURE SpisokPrepodovatelei AS
BEGIN
SELECT SURNAMETCH AS "������� �������������", NAMETCH  AS "��� �������������", OTCHTCH AS "�������� �������������", CONTTCH "���������� ������",DOL AS "�������", SAL AS "�������� � ���"
FROM TEACHER
WHERE DOL IS NOT NULL AND (SAL < (SELECT AVG(SAL) FROM TEACHER))
ORDER BY DOL, SURNAMETCH
END;