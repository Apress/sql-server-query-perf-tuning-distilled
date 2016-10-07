/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 CHAR(999))
DECLARE @n INT
SET @n = 1
WHILE @n <= 24
BEGIN
  INSERT INTO t1 VALUES(@n*100, 'a')
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
