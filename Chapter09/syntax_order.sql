/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT * FROM [Order Details] od, Orders o
  WHERE od.OrderID = o.OrderID AND o.CustomerID = 'QUICK'

SELECT * FROM Orders o, [Order Details] od
  WHERE o.CustomerID = 'QUICK' AND o.OrderID = od.OrderID
