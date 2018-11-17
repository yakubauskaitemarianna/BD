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

WITH AutorsManga 
AS
(
	SELECT AutorID, AutorsMangaMatch.MangaID,
	ROW_NUMBER() OVER(PARTITION BY AutorID ORDER BY (SELECT NULL)) AS UniqueViewID
	FROM [Views] JOIN AutorsMangaMatch ON [Views].MangaID = AutorsMangaMatch.MangaID 
	
)
SELECT * FROM AutorsManga
WHERE UniqueViewID = 1
