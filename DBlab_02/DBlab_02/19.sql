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


UPDATE [Views]
SET Mark = 
(
	SELECT MIN(Mark)
	FROM [Views]
	WHERE MangaID BETWEEN '1' AND '100'
)
WHERE MangaID = 4
