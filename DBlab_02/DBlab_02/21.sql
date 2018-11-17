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

DELETE FROM Manga
WHERE MangaID IN 
(
	SELECT Manga.MangaID
	FROM Manga JOIN AutorsMangaMatch
	ON Manga.MangaID = AutorsMangaMatch.MangaID
	WHERE Manga.MangaID = 5
	AND
	AutorsMangaMatch.AutorID = 6
)

