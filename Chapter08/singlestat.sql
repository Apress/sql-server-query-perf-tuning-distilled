/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET STATISTICS IO ON
GO
SELECT * FROM t1 WHERE c1 = 10 --Read 1 row
GO
SET STATISTICS IO OFF
GO
