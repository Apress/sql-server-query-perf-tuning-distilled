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
CREATE TABLE t1(c1 INT, c2 INT IDENTITY)
INSERT INTO t1 (c1) VALUES(1)
DECLARE @n INT
SET @n = 0
WHILE @n < 10000
BEGIN
  INSERT INTO t1 (c1) VALUES(2)
  SET @n = @n + 1
END
GO
CREATE NONCLUSTERED INDEX i1 ON t1(c1)

SET NOCOUNT OFF
GO
