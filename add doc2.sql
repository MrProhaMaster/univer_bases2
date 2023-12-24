ALTER TABLE COURSE
ADD Doc VARCHAR (20) CHECK (Doc IN ('удостоверение', 'диплом', 'cертификат', 'справка'));