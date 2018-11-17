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

SELECT MangaID, Comment
FROM [Views]
WHERE MangaID IN
(
	SELECT MangaID
	FROM Manga
	WHERE [Name] = 'words'
)
