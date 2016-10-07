/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Parent stored procedure
IF(SELECT OBJECT_ID('pParent')) IS NOT NULL
  DROP PROC pParent
GO
CREATE PROC pParent
AS
CREATE TABLE #t1(c1 INT)
EXEC pChild
GO

--Child stored procedure
IF(SELECT OBJECT_ID('pChild')) IS NOT NULL
  DROP PROC pChild
GO
CREATE PROC pChild
AS
SELECT * FROM #t1 --Causes recompilation
GO

--Execute parent stored procedure multiple times
EXEC pParent --1st execution
EXEC pParent --2nd execution
EXEC pParent --3rd execution
