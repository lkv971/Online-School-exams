USE SchoolDB
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