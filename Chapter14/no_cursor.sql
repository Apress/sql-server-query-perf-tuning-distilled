/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

IF(SELECT OBJECT_ID('spTotalLoss')) IS NOT NULL
  DROP PROC spTotalLoss
GO
CREATE PROC spTotalLoss
AS
SELECT
  CASE --Determine status based on below computation
    WHEN SUM(MoneyLostPerProduct) > 5000 THEN 'We are bankrupt!'
    ELSE 'We are safe!'
  END AS Status
FROM (--Calculate total money lost for all discarded products
      SELECT SUM(UnitsInStock*UnitPrice) AS MoneyLostPerProduct
      FROM Products
      WHERE Discontinued = 1
      GROUP BY ProductID) DiscardedProducts
GO
