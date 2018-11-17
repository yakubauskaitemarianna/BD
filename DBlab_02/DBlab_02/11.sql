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
INTO #ColorManga
FROM Manga
WHERE  Colorization = 1
--DROP TABLE #ColorManga

SELECT *
FROM #ColorManga