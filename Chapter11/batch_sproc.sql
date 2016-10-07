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
@id INT
AS
SELECT od.* --Retrieve all rows from [Order Details]
  FROM [Order Details] od, Orders o
  WHERE od.OrderID = o.OrderID
    AND o.OrderID >= @id --@id=1
GO

EXEC p1 1 --@id=1
