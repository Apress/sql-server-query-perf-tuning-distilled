/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

--Create first table with 10001 rows
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(t1_c1 INT IDENTITY, t1_c2 INT)
INSERT INTO t1 (t1_c2) VALUES(1)
DECLARE @n INT
SET @n = 0
WHILE @n < 10000
BEGIN
  INSERT INTO t1 (t1_c2) VALUES(2)
  SET @n = @n + 1
END
GO
CREATE CLUSTERED INDEX i1 ON t1(t1_c1)

--Create second table with 10001 rows,
-- but opposite data distribution
IF(SELECT OBJECT_ID('t2')) IS NOT NULL
  DROP TABLE t2
GO
CREATE TABLE t2(t2_c1 INT IDENTITY, t2_c2 INT)
INSERT INTO t2 (t2_c2) VALUES(2)
DECLARE @n INT
SET @n = 0
WHILE @n < 10000
BEGIN
  INSERT INTO t2 (t2_c2) VALUES(1)
  SET @n = @n + 1
END
GO
CREATE CLUSTERED INDEX i1 ON t2(t2_c1)

SET NOCOUNT OFF
GO
