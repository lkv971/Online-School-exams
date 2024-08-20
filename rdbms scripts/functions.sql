USE SchoolDB
;
GO

CREATE FUNCTION GetStudentMarksPerSubject (@StudentID INT)
RETURNS TABLE
AS
RETURN
(
SELECT s.StudentID,
s.LastName,
s.FirstName,
su.Subject,
m.ExamMark
FROM Students s
INNER JOIN Marks m ON s.StudentID = m.StudentID
INNER JOIN Subjects su ON m.SubjectID = su.SubjectID
WHERE s.StudentID = @StudentID
)
;
GO

CREATE FUNCTION GetStudentExamMarkAverage (@StudentID INT)
RETURNS TABLE
AS
RETURN 
(
SELECT s.StudentID,
s.LastName,
s.FirstName,
AVG(m.ExamMark) AS AverageExamMark
FROM Students s
INNER JOIN Marks m
ON s.StudentID = m.StudentID
WHERE s.StudentID = @StudentID
GROUP BY s.StudentID, s.LastName, s.FirstName
)
;
GO

CREATE FUNCTION GetStudentInfo (@StudentID INT)
RETURNS TABLE
AS
RETURN
(
SELECT * FROM Students
WHERE StudentID = @StudentID
)
;
GO

CREATE FUNCTION GetStudentExamRankAndDistinction (@LastName VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
SELECT d.LastName,
d.FirstName,
d.AverageMark,
d.Distinction,
ar.Rank 
FROM StudentsDistinctions d
INNER JOIN ExamAverageAndRankPerStudent ar
ON d.LastName = ar.LastName
WHERE d.LastName = @LastName
)
;
GO

CREATE FUNCTION GetStudentAdditionalInfo (@StudentID INT)
RETURNS TABLE 
AS 
RETURN
(
SELECT LastName,
FirstName,
YEAR(GETDATE()) - YEAR(DateOfBirth) AS Age
FROM Students
WHERE StudentID = @StudentID
)
;
GO


CREATE FUNCTION GetTeacherInfo (@TeacherID INT)
RETURNS TABLE
AS
RETURN
(
SELECT * FROM Teachers
WHERE TeacherID = @TeacherID
)
;
GO

CREATE FUNCTION GetTeacherAdditionalInfo (@LastName VARCHAR(30))
RETURNS TABLE 
AS 
RETURN
(
SELECT tsm.LastName,
tsm.FirstName,
YEAR(GETDATE()) - YEAR(t.DateOfBirth) AS Age,
tsm.Subject,
su.AcademicField AS Department
FROM TeacherSubjectsMarks tsm
INNER JOIN Teachers t ON tsm.LastName = t.LastName
INNER JOIN Subjects su ON su.Subject = tsm.Subject
WHERE tsm.LastName = @LastName
)
;
GO

