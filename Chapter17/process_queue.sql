/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Process a row from the queue
IF(SELECT OBJECT_ID('spProcessQueue')) IS NOT NULL
  DROP PROC spProcessQueue
GO
CREATE PROC spProcessQueue
AS
SET NOCOUNT ON
DECLARE @id INT
--Identify an unprocessed row
SELECT TOP 1 @id = [id] FROM Queue
  WHERE Status = 0
--Simulate processing time for the row
WAITFOR DELAY '00:00:30'
--Update the status of the row
UPDATE Queue
  SET Data = 'Modified', Status = 1
  WHERE [id] = @id AND Status = 0
SET NOCOUNT OFF
GO
