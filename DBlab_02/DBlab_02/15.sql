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

SELECT Country, COUNT(AutorID) AS Autors
FROM Autors
GROUP BY Country 
HAVING Count(AutorID) > '215'
