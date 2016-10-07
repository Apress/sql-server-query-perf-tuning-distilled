/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('StoredProcedure1')) IS NOT NULL
  DROP PROC StoredProcedure1
GO
CREATE PROC StoredProcedure1
AS
  PRINT 'Done!'
GO

EXEC StoredProcedure1
