/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET SHOWPLAN_ALL ON
GO
SELECT c1, c2, c3 FROM t1 WHERE c1 = 11
GO
SET SHOWPLAN_ALL OFF
GO
