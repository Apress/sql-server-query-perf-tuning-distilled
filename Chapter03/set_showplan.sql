/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
SET SHOWPLAN_TEXT ON
GO
SELECT DISTINCT p.ProductID, p.ProductName, p.UnitPrice
  ,od.Quantity, p.UnitsInStock
FROM [Products] p, [od] od
WHERE p.ProductID = od.ProductID
  AND od.Quantity = (SELECT Min(odSub.Quantity) FROM [od] odSub)
ORDER BY p.ProductID
GO
SET SHOWPLAN_TEXT OFF
GO
