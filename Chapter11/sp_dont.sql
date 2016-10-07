/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
IF(SELECT OBJECT_ID('sp_p1')) IS NOT NULL
  DROP PROC [sp_p1]
GO
CREATE PROC [sp_p1]
AS
  PRINT 'Done!'
GO

EXEC Northwind.dbo.[sp_p1] --Add plan of sp_p1 to procedure cache
EXEC Northwind.dbo.[sp_p1] --Use the above cached plan of sp_p1
