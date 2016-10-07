/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('p1')) IS NOT NULL
  DROP PROC p1
GO
CREATE PROC p1
AS
SELECT 'a' + null + 'b' --1st
SET CONCAT_NULL_YIELDS_NULL OFF
SELECT 'a' + null + 'b' --2nd
SET ANSI_NULLS OFF
SELECT 'a' + null + 'b' --3rd
GO

EXEC p1 --First execution
EXEC p1 --Second execution
