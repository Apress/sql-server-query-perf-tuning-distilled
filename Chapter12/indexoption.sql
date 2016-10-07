/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Avoid KEY lock on the index rows
EXEC sp_indexoption 't1.i1', ALLOWROWLOCKS, FALSE
--Avoid PAG lock on index pages
EXEC sp_indexoption 't1.i1', ALLOWPAGELOCKS, FALSE
BEGIN TRAN LockBehavior
  UPDATE t1 WITH(REPEATABLEREAD)
    SET c2 = GETDATE()
    WHERE c1 = 1
  --Observe lock behavior using sp_lock from another connection
  WAITFOR DELAY '00:00:10'
COMMIT
EXEC sp_indexoption 't1.i1', ALLOWROWLOCKS, TRUE
EXEC sp_indexoption 't1.i1', ALLOWPAGELOCKS, TRUE
