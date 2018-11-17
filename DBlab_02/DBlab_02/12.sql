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

SELECT * 
FROM Resources JOIN 
(
	SELECT ResourceID, MangaID
	FROM [Views] 
	WHERE [Views].[Date] > '10/10/2016'
) AS SQQ
ON Resources.ResourceID = SQQ.ResourceID
