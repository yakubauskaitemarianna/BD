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

INSERT Resources([URL], [Name], Country)
VALUES ('https:\manga_110.io', 'manga_110', 'Japan')
