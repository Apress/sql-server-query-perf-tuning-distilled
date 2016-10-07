/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SELECT COUNT(*) AS TotalExecutions, EventClass, TextData
 ,SUM(Duration) AS Duration_Total
 ,SUM(CPU) AS CPU_Total
 ,SUM(Reads) AS Reads_Total
 ,SUM(Writes) AS Writes_Total
FROM Trace_Table
GROUP BY EventClass, TextData
ORDER BY Reads_Total DESC
