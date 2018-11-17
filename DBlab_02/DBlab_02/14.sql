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

SELECT [Views].[Date], COUNT(Comment) AS CommentCount
FROM [Views]
GROUP BY [Views].[Date] 