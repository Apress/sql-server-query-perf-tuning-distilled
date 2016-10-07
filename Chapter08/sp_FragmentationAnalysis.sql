/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('sp_FragmentationAnalysis')) IS NOT NULL
  DROP PROC sp_FragmentationAnalysis
GO
CREATE PROC sp_FragmentationAnalysis
AS

SET NOCOUNT ON

--Create temporary table to hold DBCC SHOWCONTIG output
CREATE TABLE #FragmentationResult(
  ObjectName VARCHAR(255), ObjectId INT, IndexName VARCHAR(255),
  IndexId INT, [Level] INT, Pages INT, [Rows] INT,
  MinimumRecordSize INT, MaximumRecordSize INT,
  AverageRecordSize FLOAT, ForwardedRecords INT, Extents INT,
  ExtentSwitches INT, AverageFreeBytes FLOAT,
  AveragePageDensity FLOAT, ScanDensity FLOAT, BestCount INT,
  ActualCount INT, LogicalFragmentation FLOAT,
  ExtentFragmentation FLOAT
)

--Create temporary table to hold tables/indexes that require
-- defragmentation
CREATE TABLE #Defragmentation(
  [id] INT IDENTITY,
  ObjectName VARCHAR(255),
  IndexName VARCHAR(255),
  ScanDensity FLOAT
)

--Identify all user tables in the current database to analyze
-- fragmentation
SELECT [id], [name] INTO #UserTables
  FROM sysobjects
  WHERE type = 'U'
  ORDER BY [id]

--Determine fragmentation of every user table/index
DECLARE @id INT, @name VARCHAR(255), @TableCnt INT
SET @id = 0
SELECT @TableCnt = COUNT(*) FROM #UserTables
WHILE @TableCnt > 0
BEGIN
  SELECT TOP 1 @id=[id], @name=[name]
    FROM #UserTables
    WHERE [id] > @id
  INSERT INTO #FragmentationResult
    EXEC('DBCC SHOWCONTIG([' + @name + '])
      WITH ALL_INDEXES, TABLERESULTS')
  SET @TableCnt = @TableCnt - 1
END

--Determine user tables/indexes that require defragmentation
INSERT INTO #Defragmentation
SELECT ObjectName, IndexName, ScanDensity
  FROM #FragmentationResult
  WHERE ScanDensity < 40 --Scan Density is low
    AND LogicalFragmentation > 10 --Logical Scan Fragmentation is high
    AND PAGES > 8 --Not a very small table
DROP TABLE #FragmentationResult

--Defragment tables/indexes with high fragmentation
DECLARE @oname VARCHAR(255), @iname VARCHAR(255), @sdensity FLOAT
SET @id = 0
SELECT @TableCnt = COUNT(*) FROM #Defragmentation
WHILE @TableCnt > 0
BEGIN
  SELECT TOP 1 @id=[id]
       , @oname = ObjectName
       , @iname = IndexName
       , @sdensity = ScanDensity
    FROM #Defragmentation
    WHERE [id] > @id
  PRINT '** De-fragmentation #' + CAST(@id AS VARCHAR(15))+ ' **'
  PRINT 'DBCC DBREINDEX on [' + @oname + '].[' + @iname
    + '] with ScanDensity = ' + CAST(@sdensity AS VARCHAR(15)) + '%'
  DBCC DBREINDEX(@oname, @iname)
  SET @TableCnt = @TableCnt - 1
END

--Release resources
DROP TABLE #UserTables
DROP TABLE #Defragmentation

SET NOCOUNT OFF
GO
