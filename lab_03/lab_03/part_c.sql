USE MangaDB
GO

CREATE RULE rule_Name
AS
	@name IN ('between', 'required', 'number', 'other')
GO
EXEC sp_bindrule 'rule_Name', 'dbo.Manga.[Name]'
GO


-- AFTER
IF OBJECT_ID ('dbo.tr_c_first', 'TR') IS NOT NULL
	DROP TRIGGER dbo.tr_c_first;
GO
CREATE TRIGGER dbo.tr_c_first
ON Manga
AFTER INSERT, UPDATE
AS
BEGIN
	SELECT DISTINCT
		[Name] as 'Name', 
		PublishDate as 'Date', 
		PageNumbers as 'Pages'
	FROM Manga
END
GO

EXEC sp_unbindrule 'dbo.Manga.[Name]'
	UPDATE Manga
	SET [Name] = ''
	WHERE [Name] = 'between'
	GO
EXEC sp_bindrule rule_Name, 'dbo.Manga.[Name]'


-- INSTEAD OF
IF OBJECT_ID ('dbo.tr_c_second', 'TR') IS NOT NULL
	DROP TRIGGER dbo.tr_c_second;
GO
CREATE TRIGGER dbo.tr_c_second
ON Manga
INSTEAD OF DELETE
AS
BEGIN
	RAISERROR ('Deletion of mangas is not available!',0,0)
END
GO

DELETE FROM Manga WHERE PageNumbers < 99
SELECT * FROM Manga WHERE PageNumbers < 99

-- DDL Trigger for adding new data bases
USE MASTER
GO
CREATE TRIGGER DDLTriggerToBlockDatabaseDDL
ON ALL SERVER
FOR DDL_DATABASE_EVENTS
AS
BEGIN
 PRINT 'Disable trigger DDLTriggerToBlockDatabaseDDL to create, alter or drop database'
 ROLLBACK
END

CREATE DATABASE TestDB
DROP DATABASE TestDemoDB

DROP TRIGGER DDLTriggerToBlockDatabaseDDL ON ALL SERVER

SELECT * FROM SYS.TRIGGER_EVENT_TYPES
WHERE parent_type = 10004 or type = 10004