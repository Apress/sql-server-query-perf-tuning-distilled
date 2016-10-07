/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('p1')) IS NOT NULL
  DROP PROC p1
GO
CREATE PROC p1
AS
CREATE TABLE #t1(c1 INT, c2 INT)
CREATE CLUSTERED INDEX i1 ON #t1(c1)
CREATE TABLE #t2(c1 INT)
--All DML statements below the DDL statements
SELECT * FROM #t1 --1st
SELECT * FROM #t1 --2nd
SELECT * FROM #t2 --3rd
GO

EXEC p1 --First execution
EXEC p1 --Second execution
