/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT d.* FROM Orders o, [Order Details] d
  WHERE o.OrderID = d.OrderID
    AND o.OrderID >= 11077 --Last OrderID value
SELECT d.* FROM Orders o, [Order Details] d
  WHERE o.OrderID = d.OrderID
    AND o.OrderID >= 1 --First OrderID value
