/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Transaction from the first connection, which is executed first:
BEGIN TRAN Tx1
  UPDATE t1
    SET t1.Data = 'a'
    WHERE t1.c1 = 11
  /*Allow concurrent transactions*/ WAITFOR DELAY '00:00:10'
  DELETE t1
    WHERE t1.c1 = 11
COMMIT
GO

--Transaction from the second connection, which is executed within 10 seconds of
-- the execution of Tx1:
BEGIN TRAN Tx2
  SELECT c1, c2 FROM t1
    WHERE t1.c1 = 11
COMMIT
