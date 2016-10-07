/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
SET NOCOUNT ON
GO

--Create sample table
IF(SELECT OBJECT_ID('od')) IS NOT NULL
  DROP TABLE od
GO
CREATE TABLE dbo.od (
  OrderID int NOT NULL ,
  ProductID int NOT NULL ,
  UnitPrice money NOT NULL ,
  Quantity smallint NOT NULL ,
  Discount real NOT NULL 
)

--Populate data in sample table
DECLARE @count INT
SET @count = 1
WHILE @count <= 152
BEGIN
  INSERT INTO od SELECT * FROM [Order Details]
  SET @count = @count + 1
END
GO

--Index for "Analyze Join Effectiveness" section
CREATE  CLUSTERED  INDEX OrderID ON dbo.od(OrderID)
GO

SET NOCOUNT OFF
GO
