ALTER TABLE COURSE
ADD CONSTRAINT CHK_DOC
CHECK (Doc IN ('удостоверение', 'диплом', 'сертификат', 'справка'));


