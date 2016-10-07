/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO

--Fragmentation of Orders table
DBCC SHOWCONTIG(Orders)

--Fragmentation of Products table
DBCC SHOWCONTIG(Products)

--Fragmentation of od table
DBCC SHOWCONTIG(od)
