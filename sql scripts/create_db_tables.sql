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

CREATE TABLE MarksAudit (
MarkAuditID INT IDENTITY(1,1) PRIMARY KEY,
MarkID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
StudentID INT,
SubjectID INT,
TeacherID INT,
OldExamMark INT,
NewExamMark INT,
OldExamDate DATE,
NewExamDate DATE
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

CREATE TABLE TeachersAudit (
TeachersAuditID INT IDENTITY(1,1) PRIMARY KEY,
TeacherID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldFirstName VARCHAR(20),
NewFirstName VARCHAR(20),
OldLastName VARCHAR(20),
NewLastName VARCHAR(20),
OldDateOfBirth DATE,
NewDateOfBirth DATE,
OldEmail VARCHAR(50),
NewEmail VARCHAR(50),
OldCity VARCHAR(50),
NewCity VARCHAR(50),
OldCountry VARCHAR(50),
NewCountry VARCHAR(50)
)
;
GO

CREATE TABLE StudentAudit (
StudentAuditID INT IDENTITY(1,1) PRIMARY KEY,
StudentID INT,
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldFirstName VARCHAR(20),
NewFirstName VARCHAR(20),
OldLastName VARCHAR(20),
NewLastName VARCHAR(20),
OldDateOfBirth DATE,
NewDateOfBirth DATE,
OldEmail VARCHAR(50),
NewEmail VARCHAR(50),
OldCity VARCHAR(50),
NewCity VARCHAR(50),
OldCountry VARCHAR(50),
NewCountry VARCHAR(50)
)
;
GO