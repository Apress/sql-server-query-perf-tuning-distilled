/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Create test table 1
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c_tinyint TINYINT, c_int INT, c_bigint BIGINT)
CREATE INDEX i_int ON t1(c_int)
INSERT INTO t1 VALUES(1, 1, 1)
GO
--Create test table 2
IF(SELECT OBJECT_ID('t2')) IS NOT NULL
  DROP TABLE t2
GO
CREATE TABLE t2(c_tinyint TINYINT, c_int INT, c_bigint BIGINT)
CREATE INDEX i_tinyint ON t2(c_tinyint)
CREATE INDEX i_bigint ON t2(c_bigint)
INSERT INTO t2 VALUES(1, 1, 1)
