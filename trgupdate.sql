 CREATE TRIGGER trgUpdateRelatedRecords
 ON Teacher
 AFTER UPDATE
   AS
  BEGIN
     DECLARE @OLDIDTCH INT, @NEWIDTCH INT;
	 SELECT @OLDIDTCH = ID_TCH FROM deleted;
	 SELECT @NEWIDTCH = ID_TCH FROM inserted;

	 UPDATE COURSE
	 SET ID_TCH =@NEWIDTCH
	 WHERE ID_TCH = @OLDIDTCH;

	 UPDATE TEACHER
	 SET ID_TCH = @NEWIDTCH
	 WHERE ID_TCH =@OLDIDTCH;
  END;