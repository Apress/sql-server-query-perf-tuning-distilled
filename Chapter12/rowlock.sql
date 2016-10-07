/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1 (c1 INT)
INSERT INTO t1 VALUES(1)
GO

BEGIN TRAN
  DELETE t1 WHERE c1 = 1
  EXEC sp_lock --Display locks held by the DELETE statement
ROLLBACK
