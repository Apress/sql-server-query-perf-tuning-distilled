/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

--Create parent table
IF(SELECT OBJECT_ID('Prod')) IS NOT NULL
DROP TABLE Prod
GO
SELECT * INTO Prod FROM Products
ALTER TABLE Prod
  ADD CONSTRAINT pk_ProdID PRIMARY KEY (ProductID)

--Create child table
IF(SELECT OBJECT_ID('od')) IS NOT NULL
  DROP TABLE od
GO
SELECT * INTO od FROM [Order Details]
ALTER TABLE od
  ADD CONSTRAINT pk_OrdID_ProdID PRIMARY KEY (OrderID,ProductID)
