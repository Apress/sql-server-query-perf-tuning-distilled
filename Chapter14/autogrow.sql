/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

ALTER DATABASE [tempdb] MODIFY FILE
( NAME = N'tempdev' --tempdb database-file name
  , MAXSIZE = UNLIMITED
  , FILEGROWTH = 10%
)
ALTER DATABASE [tempdb] MODIFY FILE
( NAME = N'templog' --tempdb log-file name
  , MAXSIZE = UNLIMITED
  , FILEGROWTH = 10%
)
GO
