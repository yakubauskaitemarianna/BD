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
FROM Manga
WHERE Manga.MangaID IN
						(SELECT MangaID 
						FROM AutorsMangaMatch
						WHERE AutorID IN
										(SELECT AutorID
										FROM Autors
										WHERE Country = 'Japan')
					    )