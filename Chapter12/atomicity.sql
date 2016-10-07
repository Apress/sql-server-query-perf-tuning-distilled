/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1 (c1 INT CONSTRAINT chk_c1 CHECK(c1 = 1))
GO

--All ProductIDs are added into t1 as a logical unit of work
INSERT INTO t1
  SELECT ProductID FROM Northwind..Products
GO
SELECT * FROM t1 --Returns 0 rows
