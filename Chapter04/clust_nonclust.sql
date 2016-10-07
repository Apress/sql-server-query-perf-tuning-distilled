/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT)
DECLARE @n INT
SET @n = 1
WHILE @n <= 20
BEGIN
  INSERT INTO t1 VALUES(@n, @n+1)
  SET @n = @n + 1
END
CREATE CLUSTERED INDEX icl ON t1(c2)
CREATE NONCLUSTERED INDEX incl ON t1(c1)
