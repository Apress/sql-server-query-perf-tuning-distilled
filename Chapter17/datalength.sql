/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT AVG(DATALENGTH(OrderID) + DATALENGTH(CustomerID)
           + DATALENGTH(EmployeeID) + DATALENGTH(OrderDate)
           + DATALENGTH(RequiredDate) + DATALENGTH(ShippedDate)
           + DATALENGTH(ShipVia) + DATALENGTH(Freight)
           + DATALENGTH(ShipName) + DATALENGTH(ShipAddress)
           + DATALENGTH(ShipCity) + DATALENGTH(ShipRegion)
           + DATALENGTH(ShipPostalCode) + DATALENGTH(ShipCountry)
          ) AS [ROW-SIZE]
FROM Orders
