USE master 
GO 

IF NOT EXISTS (
SELECT name
FROM sys.databases
WHERE name = 'MangaDB'
)
CREATE DATABASE MangaDB
GO

USE MangaDB
GO

IF (OBJECT_ID ('Autors', 'U') IS NULL)
CREATE TABLE Autors 
(
	AutorID int IDENTITY(1, 1),
	[Name] nvarchar(16) NOT NULL,
	Surname nvarchar(25) NOT NULL,
	Country nvarchar(15) NOT NULL,
	Bithday date NOT NULL
)
GO

IF (OBJECT_ID ('Manga', 'U') IS NULL)
CREATE TABLE Manga
(
	MangaID int IDENTITY(1, 1),
	[Name] nvarchar(100) NOT NULL,
	PublishDate date NOT NULL,
	PageNumbers int NOT NULL,
	Colorization int NOT NULL
)
GO

IF (OBJECT_ID ('Resources', 'U') IS NULL)
CREATE TABLE Resources
(
	ResourceID int IDENTITY(1,1),
	[URL] nvarchar(50),
	[Name] nvarchar(25),
	Country nvarchar(20)
)
GO

IF (OBJECT_ID ('AutorsMangaMatch', 'U') IS NULL)
CREATE TABLE AutorsMangaMatch
(
	AutorID int,
	MangaID int
)
GO

IF (OBJECT_ID ('Views', 'U') IS NULL)
CREATE TABLE [Views]
(
	ResourceID int,
	MangaID int,
	Mark int,
	Comment nvarchar(128),
	[Date] date
)
GO
