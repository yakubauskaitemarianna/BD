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

WITH Search AS (
SELECT Manga.[Name], Manga.MangaID
FROM Manga
WHERE Manga.PageNumbers > 100
)

SELECT *
FROM Search