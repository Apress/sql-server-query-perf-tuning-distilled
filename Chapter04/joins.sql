/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
SELECT * INTO t1 FROM Northwind.dbo.Orders
CREATE CLUSTERED INDEX icl ON t1(OrderID)
CREATE NONCLUSTERED INDEX CustID ON t1(CustomerID)
CREATE NONCLUSTERED INDEX ODate ON t1(OrderDate)
