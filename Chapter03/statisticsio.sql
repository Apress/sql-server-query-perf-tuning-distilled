/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET STATISTICS IO ON
GO
SELECT p.*
FROM [Products] p, [od] od
WHERE p.ProductID = od.ProductID
GO
SET STATISTICS IO OFF
GO
