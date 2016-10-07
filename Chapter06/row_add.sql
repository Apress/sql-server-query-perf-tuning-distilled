/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

DECLARE @n INT
SET @n = 2
WHILE @n <= 1000
BEGIN
  INSERT INTO t1 VALUES(@n, @n)
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
