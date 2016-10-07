/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET STATISTICS IO ON
GO
SELECT * FROM t1 WHERE c1 BETWEEN 21 AND 25 --Reads 5 rows
SELECT * FROM t1 WHERE c1 BETWEEN 1 AND 40 --Reads all rows
GO
SET STATISTICS IO OFF
GO
