/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

DECLARE @n INT
SET @n = 1
WHILE @n <= 10000
BEGIN
  INSERT INTO t1 (c1) VALUES(2)
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
