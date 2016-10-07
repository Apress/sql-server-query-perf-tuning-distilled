/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SELECT name AS IndexName
     , indid AS IndexID
     , OBJECT_NAME(id) AS TableName
FROM sysindexes
WHERE id = OBJECT_ID('t1')
  AND name = 'incl'
