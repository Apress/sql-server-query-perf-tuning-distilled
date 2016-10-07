/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SELECT empID, [name], address FROM emp WHERE [name] = 'Andy'
GO
SELECT empID, [name], address FROM emp WHERE empID = 10000
