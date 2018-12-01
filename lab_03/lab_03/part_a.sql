USE MangaDB
GO

-- 1
IF OBJECT_ID (N'dbo.fn_a_first', N'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_a_first;
GO

CREATE FUNCTION fn_a_first (@Val1 float, @Val2 float)
	RETURNS float
AS
BEGIN
	return (@Val1 + @Val2)/2.0;
END;
GO
-- 1 Test
SELECT
	dbo.fn_a_first(0, 0.5) AS 'A(0, 0.5)',
	dbo.fn_a_first(2.5, -11.1) AS 'S(2.5, -11.1)',
	dbo.fn_a_first(1,NULL) AS 'S(NULL)';
GO

-- 2 
IF OBJECT_ID (N'dbo.fn_a_second', N'IF') IS NOT NULL
    DROP FUNCTION dbo.fn_a_second;
GO
CREATE FUNCTION fn_a_second()
	RETURNS table
AS
	RETURN
	(
		SELECT Manga.[Name] AS 'Manga name',  Manga.PageNumbers AS 'Pages', 
		Autors.[Name] AS 'Autor name', Autors.Surname AS 'Autor surname'
		FROM 
			((Manga JOIN AutorsMangaMatch ON Manga.MangaID = AutorsMangaMatch.MangaID)
					JOIN Autors ON AutorsMangaMatch.AutorID = Autors.AutorID))
-- 2 Test
GO
SELECT top 50 * from dbo.fn_a_second()
GO

-- 3
IF OBJECT_ID (N'dbo.fn_a_third', N'TF') IS NOT NULL
    DROP FUNCTION dbo.fn_a_third;
GO
CREATE FUNCTION fn_a_third(@Country nvarchar(15))
	RETURNS @manga TABLE (
						  [Name] nvarchar(100),
						  [URL] nvarchar(50)
						  )
AS
BEGIN
	WITH T([Name], [URL], Country) AS(
		SELECT Manga.[Name], [URL], Country
		FROM (Manga JOIN [Views] ON Manga.MangaID = [Views].MangaID) JOIN
			  Resources ON Resources.ResourceID = [Views].ResourceID)
	INSERT INTO @manga
		SELECT [Name], [URL] FROM T
		WHERE T.Country = @Country
	RETURN		
END
-- 3 Test
GO
SELECT * from dbo.fn_a_third('None')
GO

-- 4
IF OBJECT_ID (N'dbo.fn_a_fourth', N'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_a_fourth;
GO
CREATE FUNCTION fn_a_fourth (@N integer)
	RETURNS INT
AS
BEGIN
	IF @N = 2 RETURN 4
	IF @N = 1 RETURN 0
	IF @N = 0 RETURN -1
	IF @N < 0 RETURN NULL
	
	DECLARE @A1 int, @A2 int, @A3 int
	SET @A3 = 7
	SET @A2 = -1
	SET @A1 = 3
	DECLARE @XN_1 int, @XN_2 int, @XN_3 int
	SET @XN_1 = dbo.fn_a_fourth(@N-1)
	SET @XN_2 = dbo.fn_a_fourth(@N-2)
	SET @XN_3 = dbo.fn_a_fourth(@N-3)
	
	RETURN @A1*@XN_1 + @A2*@XN_2 + @A3*@XN_3
END;
GO
-- 4 Test
SELECT
	dbo.fn_a_fourth(5) AS 'Rec(5)',
	dbo.fn_a_fourth(3) AS 'Rec(3)',
	dbo.fn_a_fourth(2) AS 'Rec(2)',
	dbo.fn_a_fourth(0) AS 'Rec(0)',
	dbo.fn_a_fourth(-1) AS 'Rec(-1)'
GO