/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('od')) IS NOT NULL
  DROP TABLE od
GO
SELECT * INTO od FROM Northwind.dbo.[Order Details]
