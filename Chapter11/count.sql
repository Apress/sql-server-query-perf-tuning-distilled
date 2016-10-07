/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DECLARE @n INT
SELECT @n = COUNT(*) FROM [Order Details] WHERE Quantity = 1
IF @n > 0
  PRINT 'Record Exists'
