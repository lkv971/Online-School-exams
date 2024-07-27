CREATE DATABASE SchoolDB
;
GO

USE SchoolDB
;
GO

CREATE TABLE Marks (
MarkID INT PRIMARY KEY,
StudentID INT,
SubjectID INT,
TeacherID INT,
MarkObtained INT,
ExamDate DATE
)
;
GO

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
DateOfBirth DATE,
Address VARCHAR(50),
Email VARCHAR(50)
)
;
GO

CREATE TABLE Subjects (
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(20)
)
;
GO

CREATE TABLE Teachers (
TeacherID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
DateOfBirth DATE,
Address VARCHAR(50),
Email VARCHAR(50)
)
;
GO

CREATE TABLE SubjectAudit (
AuditID INT PRIMARY KEY,
SubjectID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldSubject VARCHAR(50),
NewSubject VARCHAR(50)
)
;
GO

