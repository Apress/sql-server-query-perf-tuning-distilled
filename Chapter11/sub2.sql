/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT od.* --Correlated subquery
FROM [Order Details] od
WHERE EXISTS (SELECT p.ProductID FROM Products p
              WHERE p.SupplierID = 10
                AND p.ProductID = od.ProductID)

SELECT od.*
FROM [Order Details] od, (SELECT ProductID FROM Products
                          WHERE SupplierID = 10) p
WHERE od.ProductID = p.ProductID
