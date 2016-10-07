/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DECLARE @int INT, @float FLOAT
SET @int = 10
SET @float = 10
SELECT * FROM Products WHERE SupplierID = @int --INT data type
SELECT * FROM Products WHERE SupplierID = @float --FLOAT data type
