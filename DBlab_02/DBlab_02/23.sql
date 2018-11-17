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

-- ???????? ???????.
CREATE TABLE dbo.ResourceTree
(
ResourceID int NOT NULL,
[Name] nvarchar(30) NOT NULL,
[URL] nvarchar(90) NOT NULL,
ParentID int
) ;
GO


INSERT ResourceTree (ResourceID, [Name], [URL], ParentID) VALUES
(1, 'google', 'http://google.com', NULL),
(2, 'googleDocs', 'http://docs.google.com', 1),
(3, 'googlePresentations', 'http://present.google.com', 1),
(4, 'googleDocsExtdViewer', 'http://ext.docs.google.com', 2),
(5, 'DocsReader', 'http://docs.reader.com', 4)
GO

WITH Modul
AS
(
	SELECT ResourceID, [Name], [URL], ParentID
	FROM ResourceTree
	WHERE ParentID IS NULL

	UNION ALL

	SELECT ResourceTree.ResourceID, ResourceTree.[Name], ResourceTree.[URL], ResourceTree.ParentID
	FROM ResourceTree JOIN Modul ON ResourceTree.ParentID = Modul.ResourceID
)

SELECT ResourceID, [Name],[URL], ParentID
FROM ResourceTree