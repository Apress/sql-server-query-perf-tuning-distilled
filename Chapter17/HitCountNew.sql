/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('spHitCount_New')) IS NOT NULL
  DROP PROC spHitCount_New
GO
CREATE PROC spHitCount_New
AS
SET NOCOUNT ON
SET ROWCOUNT 1 --Allow user to increment only 1 row
--Increment the first free hit count entry
UPDATE HitCountTable SET HitCount = HitCount + 1
  FROM HitCountTable WITH(READPAST)
--If all hit count entries are locked, add a new entry
IF @@ROWCOUNT = 0
  INSERT INTO HitCountTable (HitCount) VALUES(1)
SET ROWCOUNT 0 --Reset the ROWCOUNT limitation
SET NOCOUNT OFF
GO
