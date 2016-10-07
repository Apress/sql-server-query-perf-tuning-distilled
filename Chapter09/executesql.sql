/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

EXEC sp_executesql
N'SELECT * FROM [Order Details] d, Orders o
WHERE d.OrderID=o.OrderID AND d.ProductID=@1'
, N'@1 INT' --Definition of all parameters
, @1=1 --Assignment to all parameters
