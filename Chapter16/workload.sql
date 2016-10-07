/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO

SELECT p.SupplierID, SUM(p.UnitsInStock), SUM(p.UnitsOnOrder)
  FROM Products p
  WHERE p.SupplierID < 2
  GROUP BY p.SupplierID
GO
SELECT *
  FROM Orders o
  WHERE o.OrderID = 11070
GO
SELECT v1.OrderID, v1.ProductID, v1.Quantity, v1.UnitPrice
  FROM Products p, v1
  WHERE p.ProductID = v1.ProductID AND v1.UnitPrice < 3
  ORDER BY v1.UnitPrice
GO
SELECT od.OrderID, od.ProductID
  FROM od
  WHERE od.ProductID < 3
GO
SELECT od.OrderID, od.ProductID
  FROM od
  WHERE od.OrderID > 11000
  ORDER BY od.OrderID
GO
