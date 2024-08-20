USE SchoolDB
;
GO

CREATE TRIGGER TrgAfterInstertMarks
ON Marks
AFTER INSERT
AS 
BEGIN
INSERT INTO MarksAudit (
MarkID,
ChangeType,
ChangeDate,
StudentID,
SubjectID,
TeacherID,
NewExamMark,
NewExamDate
)
SELECT 
i.MarkID,
'INSERT',
GETDATE(),
i.StudentID,
i.SubjectID,
i.TeacherID,
i.ExamMark,
i.ExamDate
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgAfterDeleteMarks
ON Marks
AFTER DELETE
AS 
BEGIN
INSERT INTO MarksAudit (
MarkID,
ChangeType,
ChangeDate,
StudentID,
SubjectID,
TeacherID,
OldExamMark,
OldExamDate
)
SELECT 
d.MarkID,
'DELETE',
GETDATE(),
d.StudentID,
d.SubjectID,
d.TeacherID,
d.ExamMark,
d.ExamDate
FROM deleted d
;
END
;
GO

CREATE TRIGGER TrgAfterUpdateMarks
ON Marks
AFTER UPDATE
AS 
BEGIN
INSERT INTO MarksAudit (
MarkID,
ChangeType,
ChangeDate,
StudentID,
SubjectID,
TeacherID,
OldExamMark,
NewExamMark,
OldExamDate,
NewExamDate
)
SELECT 
d.MarkID,
'UPDATE',
GETDATE(),
d.StudentID,
d.SubjectID,
d.TeacherID,
d.ExamMark,
i.ExamMark,
d.ExamDate,
i.ExamDate
FROM deleted d 
INNER JOIN inserted i
ON d.MarkID = i.MarkID
;
END
;
GO


CREATE TRIGGER TrgAfterInsertStudent
ON Students
AFTER INSERT
AS
BEGIN
INSERT INTO StudentAudit (
StudentID,
ChangeType,
ChangeDate,
NewFirstName,
NewLastName,
NewDateOfBirth,
NewEmail,
NewCity,
NewCountry
)
SELECT 
i.StudentID,
'INSERT',
GETDATE(),
i.FirstName,
i.LastName,
i.DateOfBirth,
i.Email,
i.City,
i.Country
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgAfterDeleteStudent
ON Students
AFTER DELETE
AS
BEGIN
INSERT INTO StudentAudit (
StudentID,
ChangeType,
ChangeDate,
OldFirstName,
OldLastName,
OldDateOfBirth,
OldEmail,
OldCity,
OldCountry
)
SELECT 
d.StudentID,
'DELETE',
GETDATE(),
d.FirstName,
d.LastName,
d.DateOfBirth,
d.Email,
d.City,
d.Country
FROM deleted d
;
END
;
GO

CREATE TRIGGER AfterUpdateStudent
ON Students
AFTER UPDATE
AS 
BEGIN 
INSERT INTO StudentAudit (
StudentID,
ChangeType,
ChangeDate,
OldFirstName,
NewFirstName,
OldLastName,
NewLastName,
OldDateOfBirth,
NewDateOfBirth,
OldEmail,
NewEmail,
OldCity,
NewCity,
OldCountry,
NewCountry
)
SELECT
d.StudentID,
'UPDATE',
GETDATE(),
d.LastName,
i.LastName,
d.FirstName,
i.FirstName,
d.DateOfBirth,
i.DateOfBirth,
d.Email,
i.Email,
d.City,
i.City,
d.Country,
i.Country
FROM deleted d
INNER JOIN inserted i
ON d.StudentID =i.StudentID
;
END
;
GO

CREATE TRIGGER TrgAfterInsertTeacher
ON Teachers
AFTER INSERT
AS
BEGIN
INSERT INTO TeachersAudit (
TeacherID,
ChangeType,
ChangeDate,
NewFirstName,
NewLastName,
NewDateOfBirth,
NewEmail,
NewCity,
NewCountry
)
SELECT 
i.TeacherID,
'INSERT',
GETDATE(),
i.FirstName,
i.LastName,
i.DateOfBirth,
i.Email,
i.City,
i.Country
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgAfterDeleteTeacher
ON Teachers
AFTER DELETE
AS
BEGIN
INSERT INTO TeachersAudit (
TeacherID,
ChangeType,
ChangeDate,
OldFirstName,
OldLastName,
OldDateOfBirth,
OldEmail,
OldCity,
OldCountry
)
SELECT 
d.TeacherID,
'DELETE',
GETDATE(),
d.FirstName,
d.LastName,
d.DateOfBirth,
d.Email,
d.City,
d.Country
FROM deleted d
;
END
;
GO

CREATE TRIGGER AfterUpdateTeacher
ON Teachers
AFTER UPDATE
AS 
BEGIN 
INSERT INTO TeachersAudit (
TeacherID,
ChangeType,
ChangeDate,
OldFirstName,
NewFirstName,
OldLastName,
NewLastName,
OldDateOfBirth,
NewDateOfBirth,
OldEmail,
NewEmail,
OldCity,
NewCity,
OldCountry,
NewCountry
)
SELECT
d.TeacherID,
'UPDATE',
GETDATE(),
d.LastName,
i.LastName,
d.FirstName,
i.FirstName,
d.DateOfBirth,
i.DateOfBirth,
d.Email,
i.Email,
d.City,
i.City,
d.Country,
i.Country
FROM deleted d
INNER JOIN inserted i
ON d.TeacherID = i.TeacherID
;
END
;
GO


CREATE TRIGGER TrgAfterInsertSubject
ON Subjects
AFTER INSERT 
AS 
BEGIN
INSERT INTO SubjectAudit (
SubjectID,
ChangeType,
ChangeDate,
NewSubject
)
SELECT i.SubjectID,
'INSERT',
GETDATE(),
i.Subject
FROM inserted i
;
END
;
GO

CREATE TRIGGER TrgAfterDeleteSubject
ON Subjects
AFTER DELETE
AS
BEGIN 
INSERT INTO SubjectAudit (
SubjectID,
ChangeType,
ChangeDate,
OldSubject
)
SELECT d.SubjectID,
'DELETE',
GETDATE(),
d.Subject
FROM deleted d
;
END;
GO

CREATE TRIGGER TrgAfterUpdateSubject
ON Subjects
AFTER UPDATE
AS
BEGIN 
INSERT INTO SubjectAudit (
SubjectID,
ChangeType,
ChangeDate,
OldSubject,
NewSubject
)
SELECT d.SubjectID,
'UPDATE',
GETDATE(),
d.Subject,
i.Subject
FROM deleted d
INNER JOIN inserted i
ON d.SubjectID = i.SubjectID
;
END;
GO