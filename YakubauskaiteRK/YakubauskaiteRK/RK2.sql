-- 14%3 + 1 = 3
-- var3

USE master
GO

IF NOT EXISTS(
SELECT name
FROM sys.databases
WHERE name = 'RK2'
)
CREATE DATABASE RK2
GO

USE RK2
GO

IF (OBJECT_ID('Tutors', 'U') IS NULL)
CREATE TABLE Tutors
(
	TutrorsID int IDENTITY(1, 1),
	[Name] text NOT NULL,
	Degree text NOT NULL,
	Post text NOT NULL,
	KafedraID int
)
GO

IF (OBJECT_ID('Task', 'U') IS NULL)
CREATE TABLE Task
(
	TaskID int IDENTITY(1, 1),
	[Name] text NOT NULL,
	[Time] int NOT NULL,
	Semestr int NOT NULL,
	Rating int NOT NULL
)
GO

IF (OBJECT_ID('Kafedra', 'U') IS NULL)
CREATE TABLE Kafedra
(
	KafedraID int IDENTITY(1, 1),
	[Name] text NOT NULL,
	[Description] text NOT NULL
)
GO

IF (OBJECT_ID('TutorsTask', 'U') IS NULL)
CREATE TABLE TutorsTask
(
	TutrorsID int,
	TaskID int
)

ALTER TABLE Tutors 
ADD CONSTRAINT  TutorsPK PRIMARY KEY (TutrorsID)
GO

ALTER TABLE Kafedra 
ADD CONSTRAINT KafedraPK PRIMARY KEY (KafedraID)
GO

ALTER TABLE Task 
ADD CONSTRAINT TaskPK PRIMARY KEY (TaskID)
GO

ALTER TABLE TutorsTask ADD
CONSTRAINT TutorsFK0 FOREIGN KEY (TutrorsID)
REFERENCES Tutors(TutrorsID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE TutorsTask ADD
CONSTRAINT TutorsFK1 FOREIGN KEY (TaskID)
REFERENCES Task(TaskID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE Tutors ADD
CONSTRAINT TutorsFK FOREIGN KEY (KafedraID)
REFERENCES Kafedra(KafedraID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--- 
CREATE PROCEDURE test(@db varchar(100), @tbl varchar(100)) AS
BEGIN
	SELECT * 
	FROM sys.indexes as i
	WHERE i.object_id = OBJECT_ID(@tbl);  
END;
GO

EXEC test 'RK2', 'Tutors';
GO

DROP PROCEDURE test;
GO

-- INSERT TABLE
BULK INSERT Tutors
FROM 'C:\Users\Rin\Desktop\YakubauskaiteRK\YakubauskaiteRK\Tutors.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

-- INERT PATH TO DATAFILES

SELECT * FROM Tutors

BULK INSERT TutorsTask
FROM 'C:\Users\Rin\Desktop\YakubauskaiteRK\YakubauskaiteRK\TutorsTask.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

SELECT * FROM TutorsTask

BULK INSERT Task
FROM 'C:\Users\Rin\Desktop\YakubauskaiteRK\YakubauskaiteRK\Task.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

SELECT * FROM Task

BULK INSERT Kafedra
FROM 'C:\Users\Rin\Desktop\YakubauskaiteRK\YakubauskaiteRK\Kafedra.txt' 
WITH (DATAFILETYPE = 'char', FIRSTROW = 1, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO

SELECT * FROM Kafedra

-- OR RUN IT
INSERT Tutors([Name], Degree, Post, KafedraID)
VALUES 
('Pasha Olegovich', 'Phd', 'Meneger', 4),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 3),
('Pasha1', 'Phd1', 'Meneger', 1),
('Olegovich1', 'Phd1', 'Meneger', 2),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 5),
('Masha Olegovich1', 'Phd1', 'Meneger', 6),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 7),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 8),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 9),
('Pasha1 Olegovich1', 'Phd1', 'Meneger', 10)

INSERT TutorsTask(TutrorsID, TaskID)
VALUES 
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10)

INSERT Task([Name], [Time], Semestr, Rating)
VALUES 
('sadasd', 1, 2, 4),
('asdasda', 1,2,34),
('asdasda', 1,2,35),
('asdasda', 1,21,4),
('asdasda', 1,21,314),
('asdasda', 1,32,334),
('sdasdsa', 1,12,343),
('asdasda', 1,24,54),
('asdasda', 1,22,74),
('asdasda', 1,22,84)

INSERT Kafedra([Name], [Description])
VALUES
('asdasd', 'asdasdsa'),
('aasdas', 'asdasdas'),
('2qeqwe', 'asdaseqwe'),
('dfsdfsd','3234324'),
('asdaswqeqw','sdfsdf'),
('qweqwe', 'dewwer4'),
('eqrq','erq34tert'),
('werewr', 'sdfsdf'),
('sdfsdf', 'adafafa'),
('asdasd', 'asdawewrrtr')

-- create new non-permament local table from SELECT res grSELECT Tutors.TutrorsID, Tutors.Post, Task.[Name], Task.[Time]INTO PostTaskTimeFROM (Tutors JOIN TutorsTask ON Tutors.TutrorsID = TutorsTask.TutrorsID) JOIN Task ON TutorsTask.TaskID = Task.TaskIDSELECT * FROM PostTaskTime

-- SELECT agr func v stolbc
SELECT AVG(AvgTime) AS 'AvgSUMTime'
FROM (SELECT Tutors.TutrorsID, SUM(Task.[Time]) AS AvgTime
FROM (Tutors JOIN TutorsTask ON Tutors.TutrorsID = TutorsTask.TutrorsID) JOIN Task ON TutorsTask.TaskID = Task.TaskID
GROUP BY Tutors.TutrorsID) AS AvgTutorTime


-- predicat cravnenia s kvantorom
SELECT Task.[Name] AS 'TaskName', Task.Rating, Task.[Time], Tutors.[Name] AS 'TutorName'
FROM (Task JOIN TutorsTask ON Task.TaskID = TutorsTask.TaskID) JOIN Tutors ON TutorsTask.TutrorsID = Tutors.TutrorsID
WHERE Task.[Rating] > 2
    AND EXISTS(SELECT *
      FROM Task T1
      WHERE Task.[Rating] = T1.[Rating]
        AND Task.[Time] > T1.[Time])