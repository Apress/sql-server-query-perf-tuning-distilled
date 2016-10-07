/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT * FROM [Order Details] d, Orders o
  WHERE d.OrderID=o.OrderID AND d.ProductID=1
