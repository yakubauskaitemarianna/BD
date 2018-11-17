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

SELECT [Name],
	CASE 
		WHEN Mark < 30 THEN 'Bad'
		WHEN Mark < 60 THEN 'Usual'
		WHEN Mark < 100 THEN 'Good'
		ELSE 'Undefined'
	END AS Mark
FROM Manga JOIN [Views] ON Manga.MangaID = [Views].MangaID
