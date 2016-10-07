/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT, c3 INT)
CREATE NONCLUSTERED INDEX i1 ON t1(c1, c2)
