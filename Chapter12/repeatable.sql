/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('MyProducts')) IS NOT NULL
  DROP TABLE MyProducts
GO
CREATE TABLE MyProducts(ProductID INT, Price MONEY)
INSERT INTO MyProducts VALUES(1, 15.0)
