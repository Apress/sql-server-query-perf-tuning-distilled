/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--1. Detach the user database as follows (file_move.sql in the code download):
USE master
GO
sp_detach_db 'northwind'
GO

--2. Copy the data file Northwind_idx.ndf to a folder F:\Data\ on the new disk
--   subsystem.

--3. Reattach the user database by referring files at appropriate locations as
--   shown here:
USE master
GO
sp_attach_db 'northwind'
  ,'D:\Data\Northwind_Data.mdf'
  ,'F:\Data\Northwind_idx.ndf'
  ,'E:\Log\Northwind_Log.ldf'
GO

--4. To verify the files belonging to a database, execute the following commands:
USE northwind
GO
sp_helpfile
GO
