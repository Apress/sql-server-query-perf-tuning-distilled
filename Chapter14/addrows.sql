/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

USE Northwind

--Add 98 rows to the test table
DECLARE @n INT
SET @n = 3
WHILE @n <= 100
BEGIN
  INSERT INTO t1 VALUES(@n, @n)
  SET @n = @n + 1
END
GO

SET NOCOUNT OFF
GO
