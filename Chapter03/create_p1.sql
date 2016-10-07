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
  CREATE TABLE #t1(c1 INTEGER)
  INSERT INTO #t1 SELECT ProductID FROM Products
  SELECT * FROM #t1
GO
