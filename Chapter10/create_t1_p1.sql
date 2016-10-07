/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT, c3 INT)
INSERT INTO t1 VALUES(11, 12, 13) 283
CREATE NONCLUSTERED INDEX i1 ON t1(c1)
GO

IF(SELECT OBJECT_ID('p1')) IS NOT NULL
  DROP PROC p1
GO
CREATE PROC p1
AS
  SELECT c1, c2 FROM t1 WHERE c1 = 11
GO
