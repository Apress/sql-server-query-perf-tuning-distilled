/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

ALTER DATABASE Northwind
ADD FILEGROUP Indexes
GO
ALTER DATABASE Northwind
ADD FILE(
  NAME = Northwind2,
  FILENAME = 'C:\Northwind2_idx.ndf',
  SIZE = 1MB,
  FILEGROWTH = 10%
)
TO FILEGROUP Indexes
