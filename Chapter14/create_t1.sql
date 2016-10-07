/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 CHAR(996))
CREATE CLUSTERED INDEX i1 ON t1(c1)
INSERT INTO t1 VALUES(1,'1')
INSERT INTO t1 VALUES(2,'2')
GO
