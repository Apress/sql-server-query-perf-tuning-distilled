/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

IF(SELECT OBJECT_ID('Queue')) IS NOT NULL
  DROP TABLE Queue
GO
CREATE TABLE Queue([id] INT IDENTITY, Data CHAR(10), Status INT)
CREATE CLUSTERED INDEX i1 ON Queue([id])
GO

--Add 1000 rows to the queue for processing
DECLARE @Count INT
SET @Count = 1
WHILE @Count <= 1000
BEGIN
  INSERT INTO Queue (Data, Status) VALUES('', 0)
  SET @Count = @Count + 1
END

SET NOCOUNT OFF
GO
