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
CREATE TABLE p1_t1(c1 INT) --Ensure table doesn't exist
SELECT * FROM p1_t1 --Causes recompilation
DROP TABLE p1_t1
GO

EXEC p1 --First execution
EXEC p1 --Second execution
