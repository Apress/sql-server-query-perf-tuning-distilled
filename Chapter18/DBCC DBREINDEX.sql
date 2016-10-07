/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Bring all databases to minimal-fragmentation for DBCC INDEXDEFRAG
SET NOCOUNT ON

--Create a temporary table to hold all table names in a database
IF(SELECT OBJECT_ID('tempdb..#Tables')) IS NOT NULL
  DROP TABLE #Tables
GO
CREATE TABLE #Tables(
  TableName sysname,
  UserName sysname,
  TableID INT PRIMARY KEY
)

--Process all databases
DECLARE @DBName sysname, @DBObjectName sysname,
        @UserName sysname, @TableID INT
DECLARE DBNames CURSOR
  FOR SELECT name FROM master.dbo.sysdatabases WITH(NOLOCK)
        WHERE DATABASEPROPERTYEX(name,'Status') = 'ONLINE'
          AND name NOT IN ('tempdb', 'model') --Database exclusion list
OPEN DBNames
FETCH NEXT FROM DBNames INTO @DBName
WHILE @@FETCH_STATUS = 0
BEGIN
  --Identify all user tables in the database
  PRINT CHAR(10) + 'Database: ' + @DBName
  INSERT INTO #Tables
    EXEC('USE ' + @DBName + ' SELECT name, USER_NAME(uid), id
                                FROM sysobjects WITH(NOLOCK)
                                WHERE xtype = ''U'' ORDER BY id')

  --Process all the user tables in the database
  SET @TableID = 0
  SELECT TOP 1 @DBObjectName = TableName, @UserName = UserName,
               @TableID=TableID
    FROM #Tables WHERE TableID > @TableID
  WHILE @@ROWCOUNT = 1
  BEGIN
    --Defragment the user table and all its indexes
    PRINT 'Executing DBCC DBREINDEX(''' + @DBName + '.' + @UserName +
      '.' + @DBObjectName + ''') ...'
    EXEC('DBCC DBREINDEX(''' + @DBName + '.' + @UserName +
      '.' + @DBObjectName + ''')')

  SELECT TOP 1 @DBObjectName = TableName, @UserName = UserName,
               @TableID=TableID
    FROM #Tables WHERE TableID > @TableID
  END

  --Process the next database
  TRUNCATE TABLE #Tables
  FETCH NEXT FROM DBNames INTO @DBName
END
CLOSE DBNames
DEALLOCATE DBNames

SET NOCOUNT OFF
GO
