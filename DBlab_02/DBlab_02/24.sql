USE master
GO

IF NOT EXISTS (
SELECT name
FROM sys.databases
WHERE name = 'MangaDB'
)
RETURN 
GO

USE MangaDB
GO

SELECT AVG(Mark) OVER(PARTITION BY [Date]) AS AVGMark, [Date]
FROM [Views]
