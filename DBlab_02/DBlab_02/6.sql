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

SELECT [Name], Mark
FROM [Views] JOIN Manga
ON [Views].MangaID = Manga.MangaID
WHERE Mark > ALL
(
	SELECT Mark
	FROM [Views]
	WHERE Mark < '50'
)
