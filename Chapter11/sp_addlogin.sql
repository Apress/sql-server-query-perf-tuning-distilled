/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
CREATE PROC [sp_addlogin]
@param1 CHAR(10)
AS
  PRINT '@param1 = ' + @param1
GO

EXEC Northwind.dbo.[sp_addlogin] 'Northwind'
