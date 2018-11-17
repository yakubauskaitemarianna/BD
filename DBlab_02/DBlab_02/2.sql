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


SELECT DISTINCT AutorID, Bithday
FROM Autors
WHERE Bithday BETWEEN '4/30/1900' and '3/18/1937'

