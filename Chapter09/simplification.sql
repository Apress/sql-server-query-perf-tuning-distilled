/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
SELECT * FROM [Order Details] od, Orders o
  WHERE od.OrderID = o.OrderID AND od.OrderID = 11077
