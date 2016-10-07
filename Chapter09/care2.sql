/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

EXEC sp_executesql
  N'SELECT d.* FROM Orders o, [Order Details] d
    WHERE o.OrderID = d.OrderID AND o.OrderID >= @1'
  , N'@1 INT'
  , @1=11077 --Last OrderID value
