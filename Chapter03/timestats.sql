/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET STATISTICS TIME ON
GO
SELECT TOP 1000 p.*
FROM [Products] p, [od] od
WHERE p.ProductID = od.ProductID
GO
SET STATISTICS TIME OFF
GO
