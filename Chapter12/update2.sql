/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Execute from second connection
BEGIN TRANSACTION Tx2
  --Retain a (S) lock on the resource
  SELECT * FROM t1 WITH(REPEATABLEREAD) WHERE c1 = 1
  --Allow sp_lock to be executed before second step of
  -- UPDATE statement is executed by transaction Tx1
  WAITFOR DELAY '00:00:10'
COMMIT
