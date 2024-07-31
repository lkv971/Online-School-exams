USE SchoolDB
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
NewCity
)
SELECT 
i.StudentID,
'INSERT',
GETDATE(),
i.FirstName,
i.LastName,
i.DateOfBirth,
i.Email,
i.City
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
OldCity
)
SELECT 
d.StudentID,
'DELETE',
GETDATE(),
d.FirstName,
d.LastName,
d.DateOfBirth,
d.Email,
d.City
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
NewCity
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
i.City
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
NewCity
)
SELECT 
i.TeacherID,
'INSERT',
GETDATE(),
i.FirstName,
i.LastName,
i.DateOfBirth,
i.Email,
i.City
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
OldCity
)
SELECT 
d.TeacherID,
'DELETE',
GETDATE(),
d.FirstName,
d.LastName,
d.DateOfBirth,
d.Email,
d.City
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
NewCity
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
i.City
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