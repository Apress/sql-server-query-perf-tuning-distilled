/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Increment HitCount for 180 seconds
DECLARE @start DATETIME
SELECT @start = GETDATE()
WHILE DATEDIFF(ms, @start, GETDATE()) < 180000
BEGIN
  EXEC spHitCount_Original
END
--Stop the virtual user
WAITFOR DELAY '01:00:00'
