CREATE TABLE STUDENT
(
ID_STUD INT PRIMARY KEY , --��� ��������� � ��
SURNAME_STUD VARCHAR(20),-- �������
NAME_STUD VARCHAR(20), -- ���
OTCH_STUD VARCHAR  (20), --��������
ORG VARCHAR(20), -- �������� ���������� 
CONT VARCHAR(30), -- ���������� ������ 
CTY VARCHAR(20), -- ����� ����������
COUNTRY VARCHAR(20), -- ������ ����������
DISCNT INT, -- ������ ������ �� ��������
SX CHAR -- ��� "�" ��� "�"
);
CREATE TABLE TEACHER(
ID_TCH INT PRIMARY KEY, -- ��� �������������
SURNAMETCH VARCHAR(20), -- �������
NAMETCH CHAR(18), --��� 
OTCHTCH VARCHAR(20), -- ��������
CONTTCH VARCHAR(20), -- ���������� ������
SAL INT, -- ��������� 1 ���� ������
DOL VARCHAR(50), -- ������� 
SX_TC CHAR, -- ��� "�" ��� "�" 
);
CREATE TABLE COURSE
(ID_CRS INT PRIMARY KEY NOT NULL, -- ��������������� ����� 
TITLE VARCHAR(50), --�������� �����
DEFCRS VARCHAR(256), -- ������� ���������� ����� 
COST INT, -- ��������� ����� 
ID_TCH INT FOREIGN KEY REFERENCES TEACHER (ID_TCH) ON DELETE CASCADE, -- ��� �������������
HUR INT , -- ���������� �����, �� ����� 16 ����� 
TYPCRS VARCHAR(20), -- ��� �����
);

CREATE TABLE CONTRACTY
(ID_CONT INT PRIMARY KEY NOT NULL, -- ����� ����������
ID_STUD INT FOREIGN KEY REFERENCES STUDENT (ID_STUD) ON DELETE CASCADE, -- ��� ��������� � ��
DTE DATETIME, -- ���� ���������� 
ID_CRS INT FOREIGN KEY REFERENCES COURSE (ID_CRS) ON DELETE CASCADE, -- �������������� �����
);

