
   ALTER TABLE Contract
   ADD CONSTRAINT FK_Contract_Course
   FOREIGN KEY (Id_CRS)
   REFERENCES Course (ID_CRS)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION;



 
   DELETE FROM Course
   WHERE ID_CRS IN (SELECT ID_CRS=1 FROM CONTRACTY);







  CREATE TRIGGER trgUpdateRelatedRecords ON Teacher AFTER UPDATE
   AS
  BEGIN
     IF UPDATE(ID_TCH)
     BEGIN
       UPDATE CONTRACTY
       SET ID_CRS = inserted.ID_TCH
       FROM COURSE
      INNER JOIN inserted ON COURSE.ID_TCH = deleted.ID_TCH;
   
       UPDATE TEACHER
       SET ID_TCH = inserted.ID_TCH
       FROM TEACHER
       INNER JOIN inserted ON TEACHER.ID_TCH = deleted.ID_TCH;
     END
  END;



   UPDATE TEACHER
   SET ID_TCH = 12345
   WHERE ID_TCH = 67890;



   CREATE TRIGGER trg_UpdateDiscount
   ON Contracty
   AFTER INSERT, UPDATE, DELETE
   AS
   BEGIN
     DECLARE @TotalCost INT;
   
     SELECT @TotalCost = SUM(COST)
     FROM Contracty
     WHERE ID_STUD = inserted.ID_STUD;
   
     DECLARE @Discount INT;
   
     IF @TotalCost BETWEEN 50000 AND 70000
       SET @Discount = 5;
     ELSE IF @TotalCost BETWEEN 70000 AND 80000
       SET @Discount = 6;
     ELSE IF @TotalCost BETWEEN 80000 AND 100000
       SET @Discount = 10;
     ELSE IF @TotalCost > 100000
       SET @Discount = 15;
     ELSE
       SET @Discount = 0;
   
     UPDATE Student
     SET DISCNT = @Discount
     WHERE ID_STUD = inserted.ID_STUD;
   END;
 GO

   INSERT INTO Contracty (ID_CONT, ID_STUD, DTE, ID_CRS)
   VALUES (16, 15, GETDATE(), 456);