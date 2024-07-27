USE SchoolDB
;
GO

CREATE VIEW StudentCountPerCountry 
AS
SELECT Country,
COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Country
;
GO

CREATE VIEW StudentAverageMarkPerCountry
AS
SELECT s.Country,
AVG(m.ExamMark) AS AverageMark
FROM Students s
INNER JOIN Marks m
ON s.StudentID = m.StudentID
GROUP BY s.Country
;
GO

CREATE VIEW StudentAverageMarkPerSubject
AS
SELECT su.Subject, 
AVG(m.ExamMark) AS AverageMark
FROM Subjects su
INNER JOIN Marks m
ON su.SubjectID = m.SubjectID
GROUP BY Subject
;
GO

CREATE VIEW TeacherSubjectsMarks
AS 
SELECT t.LastName,
t.FirstName,
su.Subject,
AVG(m.ExamMark) AS AverageMark
FROM Teachers t
INNER JOIN Marks m ON t.TeacherID = m.TeacherID
INNER JOIN Subjects su ON su.SubjectID = m.SubjectID
GROUP BY t.LastName, t.FirstName, su.Subject
;
GO

CREATE VIEW StudentsDistinctions
AS
SELECT s.LastName,
s.FirstName,
AVG(m.ExamMark) AS AverageMark,
CASE
	WHEN AVG(m.ExamMark) BETWEEN 90 AND 100 THEN 'Very Good'
	WHEN AVG(m.ExamMark) BETWEEN 80 AND 89 THEN 'Good'
	WHEN AVG(m.ExamMark) BETWEEN 75 AND 79 THEN 'Fairly Good'
	WHEN AVG(m.ExamMark) BETWEEN 70 AND 74 THEN 'Passed'
	ELSE 'Failed'
END AS Distinction
FROM Students s
INNER JOIN Marks m
ON s.StudentID = m.StudentID
GROUP BY s.LastName, s.FirstName
;
GO

CREATE VIEW AverageMarkPerAcademicField
AS
SELECT su.AcademicField,
AVG(m.ExamMark) AS AverageMark
FROM Subjects su
INNER JOIN Marks m
ON su.SubjectID = m.SubjectID
GROUP BY su.AcademicField
;
GO

EXEC sp_rename 'AverageMarkPerAcademicField',
'StudentAverageMarkPerAcademicField'
;
GO

EXEC sp_rename 'StudentsDistinctions',
'StudentExamDistinction'
;
GO

CREATE VIEW StudentAverageAge
AS
SELECT AVG(DATEDIFF(YEAR, DateOfBirth, GETDATE())) AS AverageAge
FROM Students
;
GO

CREATE VIEW TeacherAverageAge
AS
SELECT AVG(DATEDIFF(YEAR, DateOfBirth, GETDATE())) AS AverageAge
FROM Teachers
;
GO

CREATE VIEW ExamAverageAndRankPerStudent
AS
SELECT s.LastName,
s.FirstName,
AVG(m.ExamMark) AS AverageMark,
RANK() OVER (ORDER BY AVG(m.ExamMark) DESC) AS Rank
FROM Students s
INNER JOIN Marks m
ON s.StudentID = m.StudentID
GROUP BY s.LastName, s.FirstName
;
GO
