/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 CHAR(50))
CREATE NONCLUSTERED INDEX incl ON t1(c1)
INSERT INTO t1 VALUES(1, '1')
