/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
SELECT * FROM [Order Details] od
  WHERE od.OrderID BETWEEN 10200 AND 10250
