USE SchoolDB
;
GO

BULK INSERT Marks
FROM "C:\Users\ACER\Documents\GitHub\School\raw data\Marks.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Students
FROM "C:\Users\ACER\Documents\GitHub\School\raw data\Students.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Subjects 
FROM "C:\Users\ACER\Documents\GitHub\School\raw data\Subjects.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Teachers 
FROM "C:\Users\ACER\Documents\GitHub\School\raw data\Teachers.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO