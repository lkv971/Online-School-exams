USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 8/3/2024 9:47:50 PM ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDB', N'ON'
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SchoolDB]
GO
/****** Object:  User [leeroy]    Script Date: 8/3/2024 9:47:50 PM ******/
CREATE USER [leeroy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentCountPerCountry]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentCountPerCountry] 
AS
SELECT Country,
COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Country
;
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarkID] [int] NOT NULL,
	[StudentID] [int] NULL,
	[SubjectID] [int] NULL,
	[TeacherID] [int] NULL,
	[ExamDate] [date] NULL,
	[ExamMark] [int] NULL,
	[ExamLetterMark] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentAverageMarkPerCountry]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAverageMarkPerCountry]
AS
SELECT s.Country,
AVG(m.ExamMark) AS AverageMark
FROM Students s
INNER JOIN Marks m
ON s.StudentID = m.StudentID
GROUP BY s.Country
;
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL,
	[Subject] [varchar](20) NULL,
	[AcademicField] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentAverageMarkPerSubject]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAverageMarkPerSubject]
AS
SELECT su.Subject, 
AVG(m.ExamMark) AS AverageMark
FROM Subjects su
INNER JOIN Marks m
ON su.SubjectID = m.SubjectID
GROUP BY Subject
;
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TeacherSubjectsMarks]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeacherSubjectsMarks]
AS 
SELECT t.TeacherID, t.LastName,
t.FirstName,
su.Subject,
AVG(m.ExamMark) AS AverageMark
FROM Teachers t
INNER JOIN Marks m ON t.TeacherID = m.TeacherID
INNER JOIN Subjects su ON su.SubjectID = m.SubjectID
GROUP BY t.TeacherID, t.LastName, t.FirstName, su.Subject
;
GO
/****** Object:  View [dbo].[StudentAverageMarkPerAcademicField]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAverageMarkPerAcademicField]
AS
SELECT su.AcademicField,
AVG(m.ExamMark) AS AverageMark
FROM Subjects su
INNER JOIN Marks m
ON su.SubjectID = m.SubjectID
GROUP BY su.AcademicField
;
GO
/****** Object:  View [dbo].[StudentsDistinctions]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentsDistinctions]
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
/****** Object:  View [dbo].[ExamAverageAndRankPerStudent]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExamAverageAndRankPerStudent]
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
/****** Object:  UserDefinedFunction [dbo].[GetStudentInfo]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetStudentInfo] (@StudentID INT)
RETURNS TABLE
AS
RETURN
(
SELECT * FROM Students
WHERE StudentID = @StudentID
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetTeacherInfo]    Script Date: 8/3/2024 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTeacherInfo] (@TeacherID INT)
RETURNS TABLE
AS
RETURN
(
SELECT * FROM Teachers
WHERE TeacherID = @TeacherID
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetStudentAdditionalInfo]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetStudentAdditionalInfo] (@StudentID INT)
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
/****** Object:  UserDefinedFunction [dbo].[GetStudentMarksPerSubject]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetStudentMarksPerSubject] (@StudentID INT)
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
/****** Object:  UserDefinedFunction [dbo].[GetStudentExamMarkAverage]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetStudentExamMarkAverage] (@StudentID INT)
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
/****** Object:  UserDefinedFunction [dbo].[GetStudentExamRankAndDistinction]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetStudentExamRankAndDistinction] (@LastName VARCHAR(30))
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
/****** Object:  UserDefinedFunction [dbo].[GetTeacherAdditionalInfo]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTeacherAdditionalInfo] (@LastName VARCHAR(30))
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
/****** Object:  Table [dbo].[MarksAudit]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarksAudit](
	[MarkAuditID] [int] IDENTITY(1,1) NOT NULL,
	[MarkID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[StudentID] [int] NULL,
	[SubjectID] [int] NULL,
	[TeacherID] [int] NULL,
	[OldExamMark] [int] NULL,
	[NewExamMark] [int] NULL,
	[OldExamDate] [date] NULL,
	[NewExamDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAudit]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAudit](
	[StudentAuditID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[OldFirstName] [varchar](20) NULL,
	[NewFirstName] [varchar](20) NULL,
	[OldLastName] [varchar](20) NULL,
	[NewLastName] [varchar](20) NULL,
	[OldDateOfBirth] [date] NULL,
	[NewDateOfBirth] [date] NULL,
	[OldEmail] [varchar](50) NULL,
	[NewEmail] [varchar](50) NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldCountry] [varchar](50) NULL,
	[NewCountry] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectAudit]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectAudit](
	[AuditID] [int] NOT NULL,
	[SubjectID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[OldSubject] [varchar](50) NULL,
	[NewSubject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersAudit]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersAudit](
	[TeachersAuditID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [datetime] NULL,
	[OldFirstName] [varchar](20) NULL,
	[NewFirstName] [varchar](20) NULL,
	[OldLastName] [varchar](20) NULL,
	[NewLastName] [varchar](20) NULL,
	[OldDateOfBirth] [date] NULL,
	[NewDateOfBirth] [date] NULL,
	[OldEmail] [varchar](50) NULL,
	[NewEmail] [varchar](50) NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldCountry] [varchar](50) NULL,
	[NewCountry] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeachersAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [fk_Marks_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [fk_Marks_Students]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [fk_Marks_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [fk_Marks_Subjects]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [fk_Marks_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [fk_Marks_Teachers]
GO
/****** Object:  StoredProcedure [dbo].[InsertMarks]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMarks]
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
/****** Object:  StoredProcedure [dbo].[InsertStudents]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudents]
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
/****** Object:  StoredProcedure [dbo].[InsertSubjects]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSubjects]
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
/****** Object:  StoredProcedure [dbo].[InsertTeachers]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTeachers]
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
/****** Object:  StoredProcedure [dbo].[RemoveMarks]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveMarks]
@MarkID INT
AS
BEGIN
DELETE FROM Marks
WHERE MarkID = @MarkID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveStudents]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveStudents]
@StudentID INT
AS
BEGIN
DELETE FROM Students
WHERE StudentID = @StudentID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveSubjects]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveSubjects]
@SubjectID INT
AS
BEGIN
DELETE FROM Subjects
WHERE SubjectID = @SubjectID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveTeachers]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveTeachers]
@TeacherID INT
AS
BEGIN
DELETE FROM Teachers
WHERE TeacherID = @TeacherID
END
;
GO
/****** Object:  StoredProcedure [dbo].[UpdateMarks]    Script Date: 8/3/2024 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMarks]
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
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO
