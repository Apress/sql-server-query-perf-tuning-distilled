/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

BEGIN TRAN --Start: Logical unit of work
  --First:
  INSERT INTO t1 SELECT ProductID FROM Northwind..Products
  IF @@ERROR <> 0
  BEGIN
    ROLLBACK --Optional, since there is nothing to undo
    RETURN --Prevent any further execution
  END
  --Second:
  INSERT INTO t1 VALUES(1)
  IF @@ERROR <> 0
  BEGIN
    ROLLBACK --Roll back the effect of first INSERT
    RETURN --Prevent any further execution
  END
COMMIT --End: Logical unit of work
GO
