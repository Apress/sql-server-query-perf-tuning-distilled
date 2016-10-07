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
CREATE TABLE t1(c1 INT NOT NULL, c2 INT, c3 INT, c4 CHAR(200))
ALTER TABLE t1 ADD CONSTRAINT pkcl PRIMARY KEY CLUSTERED(c1)
CREATE NONCLUSTERED INDEX incl_c2 ON t1(c2)
CREATE NONCLUSTERED INDEX incl_c3 ON t1(c3)
DECLARE @n INT
SET @n = 1
WHILE @n < 21
BEGIN
  INSERT INTO t1 VALUES(@n, @n, @n, 'a')
  INSERT INTO t1 VALUES(41-@n, 41-@n, 41-@n, 'a')
  SET @n = @n + 1
END

SET NOCOUNT OFF
GO
