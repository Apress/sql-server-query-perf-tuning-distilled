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
CREATE TABLE t1(c1 INT)
CREATE NONCLUSTERED INDEX i1 ON t1(c1)
DECLARE @n INT
SET @n = 1
WHILE @n <= 500
BEGIN
  INSERT INTO t1 VALUES(@n)
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
