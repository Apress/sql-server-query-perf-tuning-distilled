/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

BEGIN TRAN --Start: Logical unit of work
  --First:
  INSERT INTO t1
    SELECT ProductID FROM Northwind..Products
  --Second:
  INSERT INTO t1 VALUES(1)
COMMIT --End: Logical unit of work
GO
