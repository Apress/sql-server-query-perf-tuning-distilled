/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT SUM(LENGTH) AS [ROW-SIZE]
FROM syscolumns
WHERE id = OBJECT_ID('Orders')
