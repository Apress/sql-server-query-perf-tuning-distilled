/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 TINYINT)
GO

--Insert 10000 rows
DECLARE @Count INT
SET @Count = 1
WHILE @Count <= 10000
BEGIN
  INSERT INTO t1 VALUES(@Count%256)
  SET @Count = @Count + 1
END

SET NOCOUNT OFF
GO
