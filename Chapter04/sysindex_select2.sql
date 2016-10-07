/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SELECT Name=name
  ,CASE indid
     WHEN 0 THEN 'Table'
     WHEN 1 THEN 'Clustered'
     ELSE 'Nonclustered'
   END AS Type
  ,Pages=dpages, Rows=rowcnt
FROM sysindexes
WHERE id = OBJECT_ID('t1')
