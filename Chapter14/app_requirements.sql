/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO

IF(SELECT OBJECT_ID('spTotalLoss_CursorBased')) IS NOT NULL
  DROP PROC spTotalLoss_CursorBased
GO
CREATE PROC spTotalLoss_CursorBased
AS
--Declare a T-SQL cursor with default settings, i.e. fast
--forward-only to retrieve products that have been discarded
DECLARE DiscardedProducts CURSOR FOR
  SELECT UnitsInStock, UnitPrice
  FROM Products
  WHERE Discontinued = 1

--Open the cursor to process one product at a time
OPEN DiscardedProducts

DECLARE @MoneyLostPerProduct MONEY, @TotalLoss MONEY
SET @MoneyLostPerProduct = 0
SET @TotalLoss = 0

--Calculate money lost per product by processing one product
--at a time
DECLARE @UnitsInStock SMALLINT, @UnitPrice MONEY
FETCH NEXT FROM DiscardedProducts INTO @UnitsInStock, @UnitPrice
WHILE @@FETCH_STATUS = 0
BEGIN
  SET @MoneyLostPerProduct = @UnitsInStock * @UnitPrice
  --Calculate total loss
  SET @TotalLoss = @TotalLoss + @MoneyLostPerProduct
  FETCH NEXT FROM DiscardedProducts INTO @UnitsInStock, @UnitPrice
END

--Determine status
IF(@TotalLoss > 5000)
  SELECT 'We are bankrupt!' AS Status
ELSE
  SELECT 'We are safe!' AS Status

--Close the cursor and release all resources assigned to the cursor
CLOSE DiscardedProducts
DEALLOCATE DiscardedProducts
GO
