USE SchoolDB
;
GO

ALTER TABLE Marks 
ADD CONSTRAINT fk_Marks_Students 
FOREIGN KEY (StudentID) 
REFERENCES Students(StudentID)
;
GO

ALTER TABLE Marks
ADD CONSTRAINT fk_Marks_Subjects
FOREIGN KEY (SubjectID)
REFERENCES Subjects(SubjectID)
;
GO

ALTER TABLE Marks
ADD CONSTRAINT fk_Marks_Teachers
FOREIGN KEY (TeacherID)
REFERENCES Teachers(TeacherID)
;
GO

ALTER TABLE Teachers
ADD City VARCHAR(20), Country VARCHAR(20)
;
GO

UPDATE Teachers 
SET 
	City = TRIM(SUBSTRING(Address, 1, CHARINDEX(',', Address) - 1)),
	Country = TRIM(SUBSTRING(Address, CHARINDEX(',', Address) + 1, LEN(Address) - CHARINDEX(',', Address)))
;
GO

ALTER TABLE Students
ADD City VARCHAR(20), Country VARCHAR(20)
;
GO

UPDATE Students 
SET 
	City = TRIM(SUBSTRING(Address, 1, CHARINDEX(',', Address) - 1)),
	Country = TRIM(SUBSTRING(Address, CHARINDEX(',', Address) + 1, LEN(Address) - CHARINDEX(',', Address)))
;
GO

ALTER TABLE Teachers
DROP COLUMN Address
;
GO

ALTER TABLE Students
DROP COLUMN Address
; 
GO

EXEC sp_rename 'Marks.MarkObtained',
'ExamMark',
'COLUMN'
;
GO

EXEC sp_rename 'Subjects.SubjectName',
'Subject',
'COLUMN'
;
GO

ALTER TABLE Subjects
ADD AcademicField VARCHAR(30)
;
GO

UPDATE Subjects
SET AcademicField = CASE
	WHEN Subject IN ('Science', 'Chemistry', 'Biology', 'Physics') THEN 'Sciences'
	WHEN Subject IN ('English', 'Swahili') THEN 'Languages'
	WHEN Subject IN ('History', 'Geography') THEN 'Social Sciences'
	WHEN Subject = 'Mathematics' THEN 'Mathematics'
	WHEN Subject = 'Computer Science' THEN 'Technology'
	ELSE 'Not Attributed'
END
;
GO


ALTER TABLE Marks
ADD ExamLetterMark VARCHAR(2)
;
GO

UPDATE Marks
SET ExamLetterMark = CASE
	WHEN ExamMark BETWEEN 90 AND 100 THEN 'A'
	WHEN ExamMark BETWEEN 80 AND 89 THEN 'B'
	WHEN ExamMark BETWEEN 70 AND 79 THEN 'C'
	ELSE 'F'
END
; 
GO
