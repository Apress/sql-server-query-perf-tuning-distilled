/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
--Create a test table
IF(SELECT OBJECT_ID('od')) IS NOT NULL
  DROP TABLE od
GO
SELECT * INTO od FROM [Order Details]
CREATE CLUSTERED INDEX i1 ON od(OrderID, ProductID)
ALTER TABLE od ADD Filler CHAR(50)
GO
UPDATE od SET Filler = '-1'
GO

--Create a test view
IF(SELECT OBJECT_ID('v1')) IS NOT NULL
  DROP view v1
GO
CREATE VIEW v1
AS
SELECT o.OrderID, od.ProductID, od.Quantity, od.UnitPrice
  FROM od, Orders o
  WHERE od.OrderID = o.OrderID
GO
