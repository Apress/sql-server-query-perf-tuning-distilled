/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT * FROM [Order Details] od JOIN Orders o
  ON od.Orderid = o.Orderid
  WHERE o.ShipCountry = 'Spain'
