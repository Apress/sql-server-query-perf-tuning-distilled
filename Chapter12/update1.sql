/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

BEGIN TRANSACTION Tx1
  UPDATE t1 SET c2 = GETDATE() WHERE c1 = 1
  EXEC sp_lock --Lock status after second step of UPDATE
COMMIT
