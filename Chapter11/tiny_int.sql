/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DECLARE @tinyint TINYINT
SET @tinyint = 10
SELECT * FROM Products WHERE SupplierID = @tinyint
