/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Process queue for 180 seconds
DECLARE @start DATETIME
SELECT @start = GETDATE()
WHILE DATEDIFF(ms, @start, GETDATE()) < 180000
BEGIN
  EXEC spProcessQueue
END
--Stop the virtual user
WAITFOR DELAY '01:00:00'
