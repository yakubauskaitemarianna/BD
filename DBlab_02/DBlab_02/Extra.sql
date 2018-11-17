USE MangaDB
GO 


CREATE TABLE Table1
(
	Table1ID int NOT NULL,
	var1 nvarchar(1) NOT NULL,
	valid_from_dttm date NOT NULL,
	valid_to_dttm date NOT NULL
)
GO

CREATE TABLE Table2
(
	Table2ID int NOT NULL,
	var2 nvarchar(1) NOT NULL,
	valid_from_dttm date NOT NULL,
	valid_to_dttm date NOT NULL
)
GO

INSERT INTO Table1 
VALUES(1, 'A', '2018-09-01', '2018-09-15'),
(1, 'B', '2018-09-16', '5999-12-31')

INSERT INTO Table2
VALUES(1, 'A', '2018-09-01', '2018-09-18'),
(1, 'B', '2018-09-19', '5999-12-31')

SELECT Table1ID AS TableID, var1, var2, 
CASE
	WHEN Table1.valid_from_dttm > Table2.valid_from_dttm THEN Table1.valid_from_dttm
	ELSE Table2.valid_from_dttm
END AS ValidFrom,
CASE
	WHEN Table1.valid_to_dttm < Table2.valid_to_dttm THEN Table1.valid_to_dttm
	ELSE Table2.valid_to_dttm
END AS ValidTo
FROM Table1, Table2
WHERE Table1.valid_from_dttm <= Table2.valid_to_dttm AND Table2.valid_from_dttm <= Table1.valid_to_dttm

