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

BULK INSERT Autors
FROM 'C:\Users\Rin\Desktop\New folder\DBlab_02\DBlab_02\autorData.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

BULK INSERT Manga
FROM 'C:\Users\Rin\Desktop\New folder\DBlab_02\DBlab_02\mangaData.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

BULK INSERT Resources
FROM 'C:\Users\Rin\Desktop\New folder\DBlab_02\DBlab_02\resourceData.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

BULK INSERT AutorsMangaMatch
FROM 'C:\Users\Rin\Desktop\New folder\DBlab_02\DBlab_02\matchData.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

BULK INSERT [Views]
FROM 'C:\Users\Rin\Desktop\New folder\DBlab_02\DBlab_02\viewData.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO