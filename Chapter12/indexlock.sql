/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

BEGIN TRAN LockBehavior
  UPDATE t1 WITH(REPEATABLEREAD) --Hold all acquired locks
    SET c2 = GETDATE()
    WHERE c1 = 1
  --Observe lock behavior using sp_lock from another connection
  WAITFOR DELAY '00:00:10'
COMMIT
