/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

BEGIN TRANSACTION
  DROP INDEX t1.incl_c2
  CREATE NONCLUSTERED INDEX incl_c2 ON t1(c2)
--COMMIT --Intentionally commented to keep the transaction open
