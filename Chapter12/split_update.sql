/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

BEGIN TRAN
  --1. Read data to be modified using (S)lock instead of (U)lock.
  -- Retain the (S)lock using REPEATABLEREAD locking hint,
  -- since the original (U)lock is retained until the conversion
  -- to (X) lock.
  SELECT * FROM t1 WITH(REPEATABLEREAD) WHERE c1 = 1

  --Allow another equivalent update action to start concurrently
  WAITFOR DELAY '00:00:10'

  --2. Modify the data by acquiring (X)lock
  UPDATE t1 WITH(XLOCK) SET c2 = GETDATE() WHERE c1 = 1
COMMIT
