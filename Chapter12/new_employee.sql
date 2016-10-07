/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Transaction 2 from Connection 2
BEGIN TRAN NewEmployee
  INSERT INTO MyEmployees VALUES(5, 10, 1000)
COMMIT
