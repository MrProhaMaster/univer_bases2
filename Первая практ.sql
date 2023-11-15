CREATE TABLE STUDENT
(
ID_STUD INT PRIMARY KEY , --Код слушателя в БД
SURNAME_STUD VARCHAR(20),-- Фамилия
NAME_STUD VARCHAR(20), -- Имя
OTCH_STUD VARCHAR  (20), --Отчество
ORG VARCHAR(20), -- Название органиации 
CONT VARCHAR(30), -- Контактные данные 
CTY VARCHAR(20), -- Город проживания
COUNTRY VARCHAR(20), -- Страна проживания
DISCNT INT, -- Размер скидки на обучение
SX CHAR -- Пол "М" или "Ж"
);
CREATE TABLE TEACHER(
ID_TCH INT PRIMARY KEY, -- Код преподавателя
SURNAMETCH VARCHAR(20), -- Фамилия
NAMETCH CHAR(18), --Имя 
OTCHTCH VARCHAR(20), -- Отчество
CONTTCH VARCHAR(20), -- Контактные данные
SAL INT, -- Стоимость 1 часа работы
DOL VARCHAR(50), -- Степень 
SX_TC CHAR, -- Пол "М" или "Ж" 
);
CREATE TABLE COURSE
(ID_CRS INT PRIMARY KEY NOT NULL, -- Инднентификатор курса 
TITLE VARCHAR(50), --Название курса
DEFCRS VARCHAR(256), -- Краткое содержание курса 
COST INT, -- Стоимость курса 
ID_TCH INT FOREIGN KEY REFERENCES TEACHER (ID_TCH) ON DELETE CASCADE, -- Код преподавателя
HUR INT , -- Количество часов, не менее 16 часов 
TYPCRS VARCHAR(20), -- Тип курса
);

CREATE TABLE CONTRACTY
(ID_CONT INT PRIMARY KEY NOT NULL, -- Номер контраката
ID_STUD INT FOREIGN KEY REFERENCES STUDENT (ID_STUD) ON DELETE CASCADE, -- Код слушателя в БД
DTE DATETIME, -- Дата заключения 
ID_CRS INT FOREIGN KEY REFERENCES COURSE (ID_CRS) ON DELETE CASCADE, -- Индентификатор курса
);

