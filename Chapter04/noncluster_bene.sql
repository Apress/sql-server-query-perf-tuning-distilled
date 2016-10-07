/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT, c3 CHAR(250))
DECLARE @n INT
SET @n = 1
WHILE @n <= 10000
BEGIN
  INSERT INTO t1 VALUES(@n, @n, @n)
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
