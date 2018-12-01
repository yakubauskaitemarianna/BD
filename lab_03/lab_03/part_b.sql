USE MangaDB
GO

-- 1
IF OBJECT_ID ( 'dbo.sp_b_first', 'P' ) IS NOT NULL 
    DROP PROCEDURE dbo.sp_b_first;
GO
CREATE PROCEDURE dbo.sp_b_first @PublishDate date
AS 
BEGIN
	SELECT *
	FROM Manga
	WHERE Manga.PublishDate = @PublishDate
END
GO
-- 1 Test
EXEC dbo.sp_b_first '1937-06-25'
GO

-- 2
IF OBJECT_ID ( 'dbo.sp_b_second', 'P' ) IS NOT NULL 
    DROP PROCEDURE dbo.sp_b_second;
GO
CREATE PROCEDURE dbo.sp_b_second @N int
AS
	IF (@N = 1) or (@N = 2)
	    RETURN 1;

	DECLARE @N_p1 int, @N_p2 int;
	SET @N_p1 = @N - 1;
	EXEC @N_p1 = dbo.sp_b_second @N_p1;
	
	SET @N_p2 = @N - 2;
	EXEC @N_p2 = dbo.sp_b_second @N_p2;

	RETURN (@N_p1 + @N_p2);
GO
-- 2 Test
DECLARE @fib1 int, @fib2 int, @fib3 int
EXEC @fib1 = dbo.sp_b_second 1
EXEC @fib2 = dbo.sp_b_second 3
EXEC @fib3 = dbo.sp_b_second 17
SELECT @fib1 AS 'F(1)',
	@fib2 AS 'F(3)',
	@fib3 AS 'F(17)'
GO

-- 3
IF OBJECT_ID ( 'dbo.sp_b_third', 'P' ) IS NOT NULL 
    DROP PROCEDURE dbo.sp_b_third;
GO
CREATE PROCEDURE dbo.sp_b_third
AS
BEGIN
	DECLARE
		@Name char(20),
		@URL char(20)
	DECLARE Cur CURSOR LOCAL
	FOR
		SELECT [Name], [URL]
		FROM Resources
	OPEN Cur
	FETCH NEXT FROM Cur INTO @Name, @URL
	DECLARE @num int
	SELECT @num = 0
	WHILE (@@FETCH_STATUS = 0) AND (@num < 10)
	BEGIN
		SELECT @num = @num + 1;
		BEGIN 
			print @Name + 'AT' + @URL
	END
	FETCH NEXT FROM Cur INTO @Name, @URL
	END
	CLOSE Cur;
	DEALLOCATE Cur;
END;
GO
-- 3 Test
EXEC dbo.sp_b_third
GO

-- 4
IF OBJECT_ID ( 'dbo.sp_b_fourth', 'P' ) IS NOT NULL 
    DROP PROCEDURE dbo.sp_b_fourth;
GO
-- 4 Test
CREATE PROCEDURE dbo.sp_b_fourth
AS
BEGIN
	CREATE TABLE #Modules(Name varchar(50), Type varchar(4))
	DECLARE @name varchar(50), @type varchar(4)
	DECLARE Cur CURSOR LOCAL
	FOR
		SELECT
			name, type
		FROM
			sysobjects		
	OPEN Cur
	FETCH NEXT FROM Cur INTO @name, @type
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@type = 'FN') or (@type = 'IF') or (@type = 'TF') or (@type = 'P')
		BEGIN
			INSERT INTO #Modules VALUES (@name, @type)
		END
		FETCH NEXT FROM Cur INTO @name, @type
	END
	CLOSE Cur;
	DEALLOCATE Cur;
	SELECT * FROM #Modules
	DROP TABLE #Modules
END;
GO
EXEC dbo.sp_b_fourth
GO