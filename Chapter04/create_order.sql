/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT IDENTITY, c3 CHAR(50))
CREATE INDEX i1 ON t1(c1, c2)
DECLARE @n INT
SET @n = 1
WHILE @n <= 15
  BEGIN
  INSERT INTO t1 (c1, c3) VALUES(@n, 'c3')
  SET @n = @n + 1
END
