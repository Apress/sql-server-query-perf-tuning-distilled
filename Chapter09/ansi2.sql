/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET ANSI_NULLS OFF --Modify environment setting
GO
EXECUTE sp_executesql
  N'SELECT * FROM t1 WHERE c1=@1', N'@1 INT', @1=1
