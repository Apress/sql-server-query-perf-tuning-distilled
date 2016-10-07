/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 VARCHAR(10))
INSERT INTO t1 (c1, c2) VALUES(1, '1')
INSERT INTO t1 (c1, c2) VALUES(1, '2')

--Associate a SELECT statement to a cursor and define the
--cursor's characteristics
DECLARE cursor_t1 CURSOR /*<cursor characteristics>*/ FOR
  SELECT * FROM t1 WHERE c1 = 1
--Open the cursor to access the result set returned by the
--SELECT statement
OPEN cursor_t1
--Retrieve one row at a time from the result set returned by
--the SELECT statement
DECLARE @c1 INT, @c2 VARCHAR(10)
FETCH NEXT FROM cursor_t1 INTO @c1, @c2
WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT 'c2 = ' + @c2
  --Optionally, modify the row through the cursor
  UPDATE t1
    SET c2 = c2 + '1'
    WHERE CURRENT OF cursor_t1
  FETCH NEXT FROM cursor_t1 INTO @c1, @c2
END
--Close the cursor and release all resources assigned to the
--cursor
CLOSE cursor_t1
DEALLOCATE cursor_t1
