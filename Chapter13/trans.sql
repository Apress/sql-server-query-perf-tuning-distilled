/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

BEGIN TRAN IsolationIncreaseDoNotWork
  SELECT * FROM t1
    WHERE t1.c1 = 11
  /*Allow concurrent transactions*/ WAITFOR DELAY '00:00:10'
  UPDATE t1
    SET t1.Data = 'a'
    WHERE t1.c1 = 11
COMMIT
