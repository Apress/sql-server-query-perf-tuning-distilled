/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO

CREATE TABLE t1(c1 INT, c2 CHAR(999), c3 VARCHAR(10))
INSERT INTO t1 VALUES(100, 'c2', '')
INSERT INTO t1 VALUES(200, 'c2', '')
INSERT INTO t1 VALUES(300, 'c2', '')
INSERT INTO t1 VALUES(400, 'c2', '')
INSERT INTO t1 VALUES(500, 'c2', '')
INSERT INTO t1 VALUES(600, 'c2', '')
INSERT INTO t1 VALUES(700, 'c2', '')
INSERT INTO t1 VALUES(800, 'c2', '')

CREATE CLUSTERED INDEX i1 ON t1(c1)
