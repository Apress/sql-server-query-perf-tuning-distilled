/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DROP TABLE od
SELECT * INTO od FROM [Order Details]
DROP TABLE Prod
SELECT * INTO Prod FROM Products
CREATE CLUSTERED INDEX ProdID ON Prod(ProductID)
