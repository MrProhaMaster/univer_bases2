CREATE PROCEDURE GetStudentsByTeacher
    @TeacherID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CourseTitle VARCHAR(50);
    DECLARE @CourseHours INT;
    DECLARE @CourseType VARCHAR(20);
    DECLARE @StudentSurname VARCHAR(20);
    DECLARE @StudentName VARCHAR(20);
    DECLARE @StudentContact VARCHAR(30);

    DECLARE StudentCursor CURSOR FOR
    SELECT CR.TITLE, CR.HUR, CR.TYPCRS, S.SURNAME_STUD, S.NAME_STUD, S.CONT
    FROM COURSE AS CR
    INNER JOIN CONTRACTY AS C ON CR.ID_CRS = C.ID_CRS
    INNER JOIN STUDENT AS S ON C.ID_STUD = S.ID_STUD
    WHERE CR.ID_TCH = @TeacherID
    ORDER BY CR.TITLE, S.SURNAME_STUD;

    OPEN StudentCursor;

    FETCH NEXT FROM StudentCursor INTO @CourseTitle, @CourseHours, @CourseType, @StudentSurname, @StudentName, @StudentContact;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Course: ' + @CourseTitle;
        PRINT 'Hours: ' + CAST(@CourseHours AS VARCHAR(10));
        PRINT 'Course Type: ' + @CourseType;
        PRINT 'Student: ' + @StudentSurname + ' ' + @StudentName;
        PRINT 'Contact: ' + @StudentContact;
        PRINT '-----------------------------';

        FETCH NEXT FROM StudentCursor INTO @CourseTitle, @CourseHours, @CourseType, @StudentSurname, @StudentName, @StudentContact;
    END

    CLOSE StudentCursor;
    DEALLOCATE StudentCursor;
END