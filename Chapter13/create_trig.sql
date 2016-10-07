/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT, Data CHAR(1), Modifier CHAR(10))
CREATE INDEX i_c1 ON t1(c1)
INSERT INTO t1 VALUES(11, 12, '', '')
GO

--Create an update trigger to update the row again with user_name
CREATE TRIGGER trig1 ON t1
FOR UPDATE
AS
BEGIN
  /*Allow another UPDATE concurrently*/ WAITFOR DELAY '00:00:10'
  UPDATE t1
    SET t1.Modifier = USER_NAME()
    FROM t1, inserted
    WHERE t1.c1 = inserted.c1
END
