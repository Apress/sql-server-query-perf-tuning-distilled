/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Transaction 1 from Connection 1
DECLARE @Price INT
BEGIN TRAN NormailizePrice
  SELECT @Price = Price FROM MyProducts
    WHERE ProductID = 1
  /*Allow transaction 2 to execute*/ WAITFOR DELAY '00:00:10'
  IF @Price > 10
    UPDATE MyProducts SET Price = Price - 10 WHERE ProductID = 1
COMMIT
GO

--Transaction 2 from Connection 2
BEGIN TRAN ApplyDiscount
  UPDATE MyProducts
    SET Price = Price * 0.6 --Discount = 40%
    WHERE Price > 10
COMMIT
