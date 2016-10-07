/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

IF(SELECT OBJECT_ID('p1')) IS NOT NULL
  DROP PROC p1
GO
CREATE PROC p1
@ProductID INT
AS
  SELECT * FROM [Order Details] d, Orders o
  WHERE d.OrderID = o.OrderID
    AND d.ProductID = @ProductID
GO
