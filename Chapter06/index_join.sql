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
CREATE TABLE t1(c1 INT, c2 INT, c3 INT, c4 CHAR(500), c5 CHAR(500))
CREATE CLUSTERED INDEX icl ON t1(c3)
CREATE NONCLUSTERED INDEX incl1 ON t1(c1)

--Add 1000 rows to the test table
DECLARE @n INT
SET @n = 1
WHILE @n <= 1000
BEGIN
  INSERT INTO t1 VALUES(@n, @n, @n, 'C4', 'C5')
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
