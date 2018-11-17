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

SELECT Manga.[Name], Manga.MangaID
FROM Manga JOIN [Views] ON Manga.MangaID = [Views].MangaID
WHERE [Views].Mark > 
(
	SELECT AVG([Views].Mark)
	FROM [Views]
)