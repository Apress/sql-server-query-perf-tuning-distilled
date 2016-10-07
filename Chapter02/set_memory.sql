/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE master
EXEC sp_configure 'show advanced option', '1'
RECONFIGURE
exec sp_configure 'min server memory (MB)', 100
exec sp_configure 'max server memory (MB)', 200
RECONFIGURE WITH OVERRIDE
