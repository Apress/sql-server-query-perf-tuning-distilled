/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

CREATE TABLE t1(c1 INT)
INSERT INTO t1 VALUES(1)
SELECT 'Before Error', c1 FROM t1
SELECT 'Error',c1 FROM No_t1 --Error: Table doesn't exist
SELECT 'After Error', c1 FROM t1
GO
