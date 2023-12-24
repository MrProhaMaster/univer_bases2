

-- Task 4: Modify the table descriptions to include integrity rules based on table 3 in Appendix I
-- These rules are already applied in the previous ALTER TABLE statements.
ALTER TABLE CONTRACTY
ADD CONSTRAINT CONTR_STD FOREIGN KEY (ID_STUD) REFERENCES STUDENT (ID_STUD); 

ALTER TABLE CONTRACTY
ADD CONSTRAINT CONTR_Crs FOREIGN KEY (ID_CRS) REFERENCES COURSE (ID_CRS); 

ALTER TABLE STUDENT
ADD CONSTRAINT DISCNT CHECK (DISCNT >=0 AND DISCNT <=100); 

ALTER TABLE STUDENT
ADD CONSTRAINT CHKSX CHECK (SX IN ('М', 'Ж')); 

ALTER TABLE TEACHER
ADD CONSTRAINT CHKSX_TEACH CHECK (SX_TC IN ('М', 'Ж')); 
-- Task 5: Check the defined rules using the INSERT statement
-- Insert example:
INSERT INTO STUDENT (ID_STUD, SURNAME_STUD,DISCNT, SX)
VALUES (16, 'Галов',10, 'М');

INSERT INTO STUDENT (ID_STUD, SURNAME_STUD, DISCNT, SX)
VALUES (16, 'Галов',101, 'Муж');

INSERT INTO TEACHER (ID_TCH, SURNAMETCH, SX_TC)
VALUES (16, 'Галова', 'Ж');

INSERT INTO TEACHER (ID_TCH, SURNAMETCH, SX_TC)
VALUES (16, 'Галова', 'Жен');

INSERT INTO COURSE(ID_CRS , TITLE, DOC)
VALUES (16, 'PowerPoint', 'справка');

INSERT INTO COURSE(ID_CRS , TITLE, DOC)
VALUES (16, 'PowerPoint', 'документ');


-- Task 6: Define integrity rule for the 'COURSE' table based on the given description
ALTER TABLE COURSE
ADD CONSTRAINT CHK_DOC_DURATION
CHECK (
    (HUR <= 36 AND Doc IN ('справка', 'сертификат')) OR
    (HUR BETWEEN 72 AND 126 AND Doc IN ('сертификат', 'удостоверение')) OR
    (HUR > 126 AND Doc IN ('удостоверение', 'диплом'))
);

-- Task 7: Check the defined rule using the UPDATE command for the 'HUR' field
-- Update example:
UPDATE COURSE
SET HUR = 80
WHERE ID_CRS = 1;

-- Task 8: Formulate your own integrity constraint for the 'TEACHER' table and define a rule for it
-- Example formulation: The salary (SAL) of a teacher must be a positive value.
ALTER TABLE TEACHER
ADD CONSTRAINT CHK_SAL_POSITIVE
CHECK (SAL >= 0);


-- Task 9: Check the defined integrity rule using the INSERT statement
-- Insert example:
INSERT INTO TEACHER (ID_TCH, SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL, DOL, SX_TC)
VALUES (16, 'Далов', 'Джон', 'Михайлович', '79038316677', 5000, 'Доцент', 'M');

INSERT INTO TEACHER (ID_TCH, SURNAMETCH, NAMETCH, OTCHTCH, CONTTCH, SAL, DOL, SX_TC)
VALUES (16, 'Далов', 'Джон', 'Михайлович', '79038316677', 0, 'Доцент', 'M');