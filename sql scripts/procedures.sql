USE SchoolDB
;
GO

CREATE PROCEDURE InsertMarks
@StudentID INT,
@SubjectID INT,
@TeacherID INT,
@ExamDate DATE,
@ExamMark INT,
@ExamLetterMark CHAR(2)
AS
BEGIN
INSERT INTO Marks (
StudentID,
SubjectID,
TeacherID,
ExamDate,
ExamMark,
ExamLetterMark
)
VALUES (
@StudentID,
@SubjectID,
@TeacherID,
@ExamDate,
@ExamMark,
@ExamLetterMark
)
SELECT SCOPE_IDENTITY() AS NewMarks
END
;
GO

CREATE PROCEDURE RemoveMarks
@MarkID INT
AS
BEGIN
DELETE FROM Marks
WHERE MarkID = @MarkID
END
;
GO

CREATE PROCEDURE UpdateMarks
@MarkID INT,
@ExamMark INT
AS
BEGIN
UPDATE Marks
SET ExamMark = @ExamMark
WHERE MarkID = @MarkID
END
;
GO

CREATE PROCEDURE InsertStudents
@LastName VARCHAR(30),
@FirstName VARCHAR(30),
@DateOfBirth DATE,
@Email VARCHAR(50),
@City VARCHAR(30),
@Country VARCHAR(30)
AS
BEGIN
INSERT INTO Students (
LastName,
FirstName,
DateOfBirth,
Email,
City,
Country
)
VALUES (
@LastName,
@FirstName,
@DateOfBirth,
@Email,
@City,
@Country
)
SELECT SCOPE_IDENTITY() AS NewStudent
END
;
GO

CREATE PROCEDURE RemoveStudents
@StudentID INT
AS
BEGIN
DELETE FROM Students
WHERE StudentID = @StudentID
END
;
GO

CREATE PROCEDURE InsertTeachers
@LastName VARCHAR(30),
@FirstName VARCHAR(30),
@DateOfBirth DATE,
@Email VARCHAR(50),
@City VARCHAR(30),
@Country VARCHAR(30)
AS
BEGIN
INSERT INTO Teachers (
LastName,
FirstName,
DateOfBirth,
Email,
City,
Country
)
VALUES (
@LastName,
@FirstName,
@DateOfBirth,
@Email,
@City,
@Country
)
SELECT SCOPE_IDENTITY() AS NewTeacher
END
;
GO

CREATE PROCEDURE RemoveTeachers
@TeacherID INT
AS
BEGIN
DELETE FROM Teachers
WHERE TeacherID = @TeacherID
END
;
GO

CREATE PROCEDURE InsertSubjects
@Subject VARCHAR(40)
AS 
BEGIN 
INSERT INTO Subjects (
Subject
)
VALUES (
@Subject
)
SELECT SCOPE_IDENTITY() AS NewSubject
END
;
GO

CREATE PROCEDURE RemoveSubjects
@SubjectID INT
AS
BEGIN
DELETE FROM Subjects
WHERE SubjectID = @SubjectID
END
;
GO



