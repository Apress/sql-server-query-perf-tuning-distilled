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
SELECT * FROM #t1 --Needs 1st recompilation
CREATE CLUSTERED INDEX i1 ON #t1(c1)
SELECT * FROM #t1 --Needs 2nd recompilation
CREATE TABLE #t2(c1 INT)
SELECT * FROM #t2 --Needs 3rd recompilation
GO

EXEC p1 --First execution
