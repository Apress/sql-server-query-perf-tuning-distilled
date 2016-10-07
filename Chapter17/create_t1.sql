/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 TINYINT)
CREATE CLUSTERED INDEX i1 ON t1(c1)


--Insert the 256,000 rows into the destination table as follows:

SET NOCOUNT ON
DECLARE @Start DATETIME
SET @Start = GETDATE()

--Insert 256000 rows
DECLARE @Count INT
SET @Count = 1
WHILE @Count <= 256000
BEGIN
  INSERT INTO t1 VALUES(@Count%256)
  SET @Count = @Count + 1
END

SELECT DATEDIFF(s, @Start, GETDATE()) AS ExecutionTime
SET NOCOUNT OFF
