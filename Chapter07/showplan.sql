/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET SHOWPLAN_ALL ON
GO
SELECT * FROM t1 WHERE t1.c2 = 1
GO
SET SHOWPLAN_ALL OFF
GO
