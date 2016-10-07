/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Table to store hit count value
IF(SELECT OBJECT_ID('HitCountTable')) IS NOT NULL
  DROP TABLE HitCountTable
GO
CREATE TABLE HitCountTable(HitCount INT)
INSERT INTO HitCountTable VALUES(0)
GO

--Stored procedure to increment hit count value
IF(SELECT OBJECT_ID('spHitCount_Original')) IS NOT NULL
  DROP PROC spHitCount_Original
GO
CREATE PROC spHitCount_Original
AS
SET NOCOUNT ON
UPDATE HitCountTable SET HitCount = HitCount + 1
SET NOCOUNT OFF
GO
