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
CREATE TABLE t1(c1 INT, c2 DATETIME, c3 CHAR(40))
CREATE INDEX i1 ON t1(c2)
DECLARE @c2 DATETIME
SET @c2 = '2000-01-01 08:00:00'
WHILE DATEPART(YEAR, @c2) < '2003'
BEGIN
  INSERT INTO t1 VALUES(1, @c2, 'c3')
  SELECT @c2 = DATEADD(DAY, 1, @c2)
END

SET NOCOUNT OFF
GO
