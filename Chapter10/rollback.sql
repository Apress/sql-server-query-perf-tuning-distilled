/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

DECLARE @t1 TABLE(c1 INT)
INSERT INTO @t1 VALUES(1)
BEGIN TRAN
  INSERT INTO @t1 VALUES(2)
ROLLBACK
SELECT * FROM @t1 --Returns 2 rows
