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

SELECT Manga.[Name]
FROM Manga JOIN AutorsMangaMatch ON Manga.MangaID = AutorsMangaMatch.MangaID 
		   JOIN Autors ON AutorsMangaMatch.AutorID = Autors.AutorID
WHERE Autors.Bithday > '11/3/1980'
GO