/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT Prod.ProductID, od.OrderID, od.UnitPrice, od.Quantity
  FROM Prod, od
  WHERE Prod.ProductID = od.ProductID AND od.OrderID = 10300
