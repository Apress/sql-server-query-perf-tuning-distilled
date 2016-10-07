/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Add user u1
IF(SELECT USER_ID('u1')) IS NOT NULL
BEGIN
  EXEC sp_dropuser 'u1'
  EXEC sp_droplogin 'u1'
END
EXEC sp_addlogin 'u1', '', 'Northwind' --Create login u1
USE Northwind
EXEC sp_adduser 'u1', 'u1' --Add login u1 as user u1 to
                           --Northwind database
GRANT SELECT ON t1 TO u1 --Grant SELECT permission on table
                         --t1 to user u1
GO

--Add user u2
IF(SELECT USER_ID('u2')) IS NOT NULL
BEGIN
  EXEC sp_dropuser 'u2'
  EXEC sp_droplogin 'u2'
END
EXEC sp_addlogin 'u2', '', 'Northwind' --Create login u2
USE Northwind
EXEC sp_adduser 'u2', 'u2' --Add login u2 as user u2 to
                           --Northwind database
GRANT SELECT ON t1 TO u2 --Grant SELECT permission on table
                         --t1 to user u2
GO
