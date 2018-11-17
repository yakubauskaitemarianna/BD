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

SELECT DISTINCT MangaID, [Name], PublishDate,
CASE YEAR(PublishDate)
	WHEN YEAR(Getdate()) THEN 'This Year'
	WHEN YEAR(GetDate()) - 1 THEN 'Last Year'
	ELSE CAST(DATEDIFF(year, PublishDate, GetDate()) AS varchar(5)) + '  years ago'
	END AS 'When'
FROM Manga 
