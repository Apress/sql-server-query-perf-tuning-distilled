/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SELECT ProductName,
       od.ProductID,
       AVG(od.UnitPrice*(1.00-Discount)) AS AvgPrice,
       SUM(od.Quantity) AS Units
FROM Northwind.dbo.[Order Details] od, Northwind.dbo.Products p
WHERE od.ProductID = p.ProductID
  AND p.ProductName LIKE '%Tofu%'
GROUP BY ProductName, od.ProductID
GO
