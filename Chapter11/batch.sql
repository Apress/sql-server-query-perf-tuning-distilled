/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

DECLARE @id INT
SET @id = 1
SELECT od.* --Retrieve all rows from [Order Details]
  FROM [Order Details] od, Orders o
  WHERE od.OrderID = o.OrderID
    AND o.OrderID >= @id --@id=1
