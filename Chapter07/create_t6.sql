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
CREATE TABLE t1(c1 INT, c2 INT, c3 CHAR(50))
INSERT INTO t1 VALUES(51, 1, 'c3')
INSERT INTO t1 VALUES(52, 1, 'c3')
CREATE NONCLUSTERED INDEX i1 ON t1(c1, c2)
DECLARE @n INT
SET @n = 0
WHILE @n < 10000
BEGIN
  INSERT INTO t1 VALUES(@n%50, @n, 'c3')
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
