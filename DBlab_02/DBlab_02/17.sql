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


INSERT [Views] (ResourceID, MangaID, Mark, Comment, [Date])
(
	SELECT ResourceID, MangaID, Mark, Comment, [Date]
	FROM [Views]
	WHERE Mark < '5'
)
go