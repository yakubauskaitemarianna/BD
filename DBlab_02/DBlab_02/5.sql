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

SELECT MangaID, [Name]
FROM Manga
WHERE EXISTS
(
	SELECT Manga.MangaID
	FROM Manga LEFT OUTER JOIN [Views]
	ON Manga.MangaID = [Views].MangaID
	WHERE [Views].Comment IS NULL
)
