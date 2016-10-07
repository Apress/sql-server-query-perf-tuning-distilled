/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Create a small table with one row and an index
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 CHAR(50))
INSERT INTO t1 VALUES(1, '2')
CREATE NONCLUSTERED INDEX i1 ON t1(c1)

--Create a stored procedure referencing the above table
IF(SELECT OBJECT_ID('p1')) IS NOT NULL
  DROP PROC p1
GO
CREATE PROC p1
AS
SELECT * FROM t1 WHERE c1 = 1
GO

--First execution of stored procedure with 1 row in the table
SET STATISTICS PROFILE ON
GO
EXEC p1 --First execution
GO
SET STATISTICS PROFILE OFF
GO

--Add many rows to the table to cause statistics change
SET NOCOUNT ON
DECLARE @n INT
SET @n = 1
WHILE @n <= 1000
BEGIN
  INSERT INTO t1 VALUES(1, @n)
  SET @n = @n + 1
END
GO

--Re-execute the stored procedure with the change in statistics
SET STATISTICS PROFILE ON
GO
EXEC p1 --With change in data distribution
GO
SET STATISTICS PROFILE OFF
GO
