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

SELECT ResourceID, AVG(Mark) as MarkAVG
FROM [Views]
GROUP BY ResourceID
