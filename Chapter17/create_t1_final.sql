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


--Prerequisite: Re-create the original table with the index
SET NOCOUNT ON
DECLARE @Start DATETIME
SET @Start = GETDATE()

DECLARE @Count INT, @CountOut INT
SET @CountOut = 1
WHILE @CountOut <= 4
BEGIN
  SET @Count = 1
  BEGIN TRANSACTION
    WHILE @Count <= 64000
    BEGIN
      INSERT INTO t1 VALUES(@Count%256)
      SET @Count = @Count + 1
    END
  COMMIT
  SET @CountOut = @CountOut + 1
END

SELECT DATEDIFF(s, @Start, GETDATE()) AS ExecutionTime
SET NOCOUNT OFF
