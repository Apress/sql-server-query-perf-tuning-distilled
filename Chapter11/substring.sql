/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind

SELECT * FROM Orders --Get orders booked by specific customers
WHERE SUBSTRING(ShipPostalCode,1,1) = 'V'
