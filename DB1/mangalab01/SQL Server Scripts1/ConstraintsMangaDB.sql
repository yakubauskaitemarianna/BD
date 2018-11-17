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

ALTER TABLE Autors 
ADD CONSTRAINT MangaDB_Autors_primarykey PRIMARY KEY (AutorID)
GO

ALTER TABLE Manga ADD
CONSTRAINT MangaDB_Manga_primarykey PRIMARY KEY (MangaID),
CONSTRAINT MangaDB_Manga_defaultdate DEFAULT (getdate()) FOR PublishDate
GO 

ALTER TABLE Resources ADD
CONSTRAINT MangaDB_Resources_primarykey PRIMARY KEY (ResourceID),
CONSTRAINT MangaDB_URL_unique UNIQUE ([URL]), 
CONSTRAINT MangaDB_name_unique UNIQUE ([Name])
GO 

ALTER TABLE [Views] ADD 
CONSTRAINT MangaDB_Views_marklimit CHECK (Mark BETWEEN 0 AND 5),
CONSTRAINT MangaDB_Views_commentslimit CHECK (LEN(Comment) <= 128)
GO

ALTER TABLE [Views] ADD 
CONSTRAINT MangaDB_Views_MangaID_foreign_key FOREIGN KEY (MangaID)
REFERENCES Manga(MangaID)
ON UPDATE CASCADE 
ON DELETE CASCADE
GO

ALTER TABLE [Views] ADD 
CONSTRAINT MangaDB_Views_ResourcesID_foreign_key FOREIGN KEY (ResourceID)
REFERENCES Resources(ResourceID)
ON UPDATE CASCADE 
ON DELETE CASCADE
GO

ALTER TABLE AutorsMangaMatch ADD
CONSTRAINT MangaDB_AutorsMangaMatch_MangaID_foreign_key FOREIGN KEY (MangaID)
REFERENCES Manga(MangaID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE AutorsMangaMatch ADD
CONSTRAINT MangaDB_AutorsMangaMatch_AutorsID_foreign_key FOREIGN KEY (AutorID)
REFERENCES Autors(AutorID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO



