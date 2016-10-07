/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DROP TABLE od
SELECT * INTO od FROM [Order Details]
CREATE CLUSTERED INDEX ProdID ON od(ProductID)
DROP TABLE Prod
SELECT * INTO Prod FROM Products
CREATE NONCLUSTERED INDEX SuppID ON Prod(SupplierID)
