/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
IF(SELECT OBJECT_ID('IndexedView')) IS NOT NULL
  DROP VIEW IndexedView
GO
CREATE VIEW IndexedView WITH SCHEMABINDING
AS
  SELECT ProductID,
         SUM(UnitPrice*(1.00-Discount)) AS Price,
         COUNT_BIG(*) AS [Count],
         SUM(Quantity) AS Units
  FROM dbo.[Order Details]
  GROUP BY ProductID
GO
CREATE UNIQUE CLUSTERED INDEX iv ON IndexedView(ProductID)
