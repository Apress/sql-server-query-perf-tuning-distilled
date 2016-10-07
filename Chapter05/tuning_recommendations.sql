/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE [Northwind]
go

SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
go

DECLARE @bErrors as bit

BEGIN TRANSACTION
SET @bErrors = 0

CREATE CLUSTERED INDEX [emp1] ON [dbo].[emp] ([name] ASC )
IF( @@error <> 0 ) SET @bErrors = 1

CREATE NONCLUSTERED INDEX [emp2] ON [dbo].[emp] ([empID] ASC )
IF( @@error <> 0 ) SET @bErrors = 1

IF( @bErrors = 0 )
  COMMIT TRANSACTION
ELSE
  ROLLBACK TRANSACTION
