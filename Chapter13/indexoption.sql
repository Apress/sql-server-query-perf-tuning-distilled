/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Avoid KEY lock on the index row
EXEC sp_indexoption 't1.i_c1', ALLOWROWLOCKS, FALSE
--Avoid PAG lock on index page
EXEC sp_indexoption 't1.i_c1', ALLOWPAGELOCKS, FALSE
UPDATE t1
  SET t1.Data = 'a'
  WHERE t1.c1 = 11
EXEC sp_indexoption 't1.i_c1', ALLOWROWLOCKS, TRUE
EXEC sp_indexoption 't1.i_c1', ALLOWPAGELOCKS, TRUE
