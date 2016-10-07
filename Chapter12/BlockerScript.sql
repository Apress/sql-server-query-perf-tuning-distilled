/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

--Collect blocking information for 10 minutes
SET XACT_ABORT ON
DECLARE @MonitoringPeriod TINYINT
SET @MonitoringPeriod = 10 --Minutes

/********************************************************************************/
/* Start SQL tracing                                                            */
/********************************************************************************/

-- Create a Queue
declare @rc int
declare @TraceID int
declare @maxfilesize bigint
set @maxfilesize = 500

DECLARE @TRACE_FILE_ROLLOVER INT
DECLARE @BlockingTrace NCHAR(35)
SET @TRACE_FILE_ROLLOVER = 2
SET @BlockingTrace = N'BlockingTrace' + CONVERT(NCHAR(32),GETDATE(),120)
SET @BlockingTrace = N'C:\' + REPLACE(@BlockingTrace,N':',N'_') 
exec @rc = sp_trace_create @TraceID output,
  @TRACE_FILE_ROLLOVER, @BlockingTrace, @maxfilesize, NULL 
if (@rc != 0) goto error

-- Set the events
declare @on bit
set @on = 1
exec sp_trace_setevent @TraceID, 10, 1, @on --RPC:Completed, TextData
exec sp_trace_setevent @TraceID, 10, 2, @on --RPC:Completed, BinaryData
exec sp_trace_setevent @TraceID, 10, 3, @on --RPC:Completed, DatabaseID
exec sp_trace_setevent @TraceID, 10, 4, @on --RPC:Completed, TransactionID
exec sp_trace_setevent @TraceID, 10, 12, @on --RPC:Completed, SPID
exec sp_trace_setevent @TraceID, 10, 13, @on --RPC:Completed, Duration
exec sp_trace_setevent @TraceID, 10, 14, @on --RPC:Completed, StartTime
exec sp_trace_setevent @TraceID, 10, 15, @on --RPC:Completed, EndTime
exec sp_trace_setevent @TraceID, 10, 16, @on --RPC:Completed, Reads
exec sp_trace_setevent @TraceID, 10, 17, @on --RPC:Completed, Writes
exec sp_trace_setevent @TraceID, 10, 18, @on --RPC:Completed, CPU
exec sp_trace_setevent @TraceID, 10, 21, @on --RPC:Completed, EventSubClass
exec sp_trace_setevent @TraceID, 10, 25, @on --RPC:Completed, IntegerData
exec sp_trace_setevent @TraceID, 10, 31, @on --RPC:Completed, Error
exec sp_trace_setevent @TraceID, 12, 1, @on --SQL:BatchCompleted, TextData
exec sp_trace_setevent @TraceID, 12, 2, @on --SQL:BatchCompleted, BinaryData
exec sp_trace_setevent @TraceID, 12, 3, @on --SQL:BatchCompleted, DatabaseID
exec sp_trace_setevent @TraceID, 12, 4, @on --SQL:BatchCompleted, TransactionID
exec sp_trace_setevent @TraceID, 12, 12, @on --SQL:BatchCompleted, SPID
exec sp_trace_setevent @TraceID, 12, 13, @on --SQL:BatchCompleted, Duration
exec sp_trace_setevent @TraceID, 12, 14, @on --SQL:BatchCompleted, StartTime
exec sp_trace_setevent @TraceID, 12, 15, @on --SQL:BatchCompleted, EndTime
exec sp_trace_setevent @TraceID, 12, 16, @on --SQL:BatchCompleted, Reads
exec sp_trace_setevent @TraceID, 12, 17, @on --SQL:BatchCompleted, Writes
exec sp_trace_setevent @TraceID, 12, 18, @on --SQL:BatchCompleted, CPU
exec sp_trace_setevent @TraceID, 12, 21, @on --SQL:BatchCompleted, EventSubClass
exec sp_trace_setevent @TraceID, 12, 25, @on --SQL:BatchCompleted, IntegerData
exec sp_trace_setevent @TraceID, 12, 31, @on --SQL:BatchCompleted, Error
exec sp_trace_setevent @TraceID, 14, 1, @on --Login, TextData
exec sp_trace_setevent @TraceID, 14, 2, @on --Login, BinaryData
exec sp_trace_setevent @TraceID, 14, 3, @on --Login, DatabaseID
exec sp_trace_setevent @TraceID, 14, 4, @on --Login, TransactionID
exec sp_trace_setevent @TraceID, 14, 12, @on --Login, SPID
exec sp_trace_setevent @TraceID, 14, 13, @on --Login, Duration
exec sp_trace_setevent @TraceID, 14, 14, @on --Login, StartTime
exec sp_trace_setevent @TraceID, 14, 15, @on --Login, EndTime
exec sp_trace_setevent @TraceID, 14, 16, @on --Login, Reads
exec sp_trace_setevent @TraceID, 14, 17, @on --Login, Writes
exec sp_trace_setevent @TraceID, 14, 18, @on --Login, CPU
exec sp_trace_setevent @TraceID, 14, 21, @on --Login, EventSubClass
exec sp_trace_setevent @TraceID, 14, 25, @on --Login, IntegerData
exec sp_trace_setevent @TraceID, 14, 31, @on --Login, Error
exec sp_trace_setevent @TraceID, 15, 1, @on --Logout, TextData
exec sp_trace_setevent @TraceID, 15, 2, @on --Logout, BinaryData
exec sp_trace_setevent @TraceID, 15, 3, @on --Logout, DatabaseID
exec sp_trace_setevent @TraceID, 15, 4, @on --Logout, TransactionID
exec sp_trace_setevent @TraceID, 15, 12, @on --Logout, SPID
exec sp_trace_setevent @TraceID, 15, 13, @on --Logout, Duration
exec sp_trace_setevent @TraceID, 15, 14, @on --Logout, StartTime
exec sp_trace_setevent @TraceID, 15, 15, @on --Logout, EndTime
exec sp_trace_setevent @TraceID, 15, 16, @on --Logout, Reads
exec sp_trace_setevent @TraceID, 15, 17, @on --Logout, Writes
exec sp_trace_setevent @TraceID, 15, 18, @on --Logout, CPU
exec sp_trace_setevent @TraceID, 15, 21, @on --Logout, EventSubClass
exec sp_trace_setevent @TraceID, 15, 25, @on --Logout, IntegerData
exec sp_trace_setevent @TraceID, 15, 31, @on --Logout, Error
exec sp_trace_setevent @TraceID, 16, 1, @on --Attention, TextData
exec sp_trace_setevent @TraceID, 16, 2, @on --Attention, BinaryData
exec sp_trace_setevent @TraceID, 16, 3, @on --Attention, DatabaseID
exec sp_trace_setevent @TraceID, 16, 4, @on --Attention, TransactionID
exec sp_trace_setevent @TraceID, 16, 12, @on --Attention, SPID
exec sp_trace_setevent @TraceID, 16, 13, @on --Attention, Duration
exec sp_trace_setevent @TraceID, 16, 14, @on --Attention, StartTime
exec sp_trace_setevent @TraceID, 16, 15, @on --Attention, EndTime
exec sp_trace_setevent @TraceID, 16, 16, @on --Attention, Reads
exec sp_trace_setevent @TraceID, 16, 17, @on --Attention, Writes
exec sp_trace_setevent @TraceID, 16, 18, @on --Attention, CPU
exec sp_trace_setevent @TraceID, 16, 21, @on --Attention, EventSubClass
exec sp_trace_setevent @TraceID, 16, 25, @on --Attention, IntegerData
exec sp_trace_setevent @TraceID, 16, 31, @on --Attention, Error
exec sp_trace_setevent @TraceID, 25, 1, @on --Lock:Deadlock, TextData
exec sp_trace_setevent @TraceID, 25, 2, @on --Lock:Deadlock, BinaryData
exec sp_trace_setevent @TraceID, 25, 3, @on --Lock:Deadlock, DatabaseID
exec sp_trace_setevent @TraceID, 25, 4, @on --Lock:Deadlock, TransactionID
exec sp_trace_setevent @TraceID, 25, 12, @on --Lock:Deadlock, SPID
exec sp_trace_setevent @TraceID, 25, 13, @on --Lock:Deadlock, Duration
exec sp_trace_setevent @TraceID, 25, 14, @on --Lock:Deadlock, StartTime
exec sp_trace_setevent @TraceID, 25, 15, @on --Lock:Deadlock, EndTime
exec sp_trace_setevent @TraceID, 25, 16, @on --Lock:Deadlock, Reads
exec sp_trace_setevent @TraceID, 25, 17, @on --Lock:Deadlock, Writes
exec sp_trace_setevent @TraceID, 25, 18, @on --Lock:Deadlock, CPU
exec sp_trace_setevent @TraceID, 25, 21, @on --Lock:Deadlock, EventSubClass
exec sp_trace_setevent @TraceID, 25, 25, @on --Lock:Deadlock, IntegerData
exec sp_trace_setevent @TraceID, 25, 31, @on --Lock:Deadlock, Error
exec sp_trace_setevent @TraceID, 27, 1, @on --Lock:Timeout, TextData
exec sp_trace_setevent @TraceID, 27, 2, @on --Lock:Timeout, BinaryData
exec sp_trace_setevent @TraceID, 27, 3, @on --Lock:Timeout, DatabaseID
exec sp_trace_setevent @TraceID, 27, 4, @on --Lock:Timeout, TransactionID
exec sp_trace_setevent @TraceID, 27, 12, @on --Lock:Timeout, SPID
exec sp_trace_setevent @TraceID, 27, 13, @on --Lock:Timeout, Duration
exec sp_trace_setevent @TraceID, 27, 14, @on --Lock:Timeout, StartTime
exec sp_trace_setevent @TraceID, 27, 15, @on --Lock:Timeout, EndTime
exec sp_trace_setevent @TraceID, 27, 16, @on --Lock:Timeout, Reads
exec sp_trace_setevent @TraceID, 27, 17, @on --Lock:Timeout, Writes
exec sp_trace_setevent @TraceID, 27, 18, @on --Lock:Timeout, CPU
exec sp_trace_setevent @TraceID, 27, 21, @on --Lock:Timeout, EventSubClass
exec sp_trace_setevent @TraceID, 27, 25, @on --Lock:Timeout, IntegerData
exec sp_trace_setevent @TraceID, 27, 31, @on --Lock:Timeout, Error
exec sp_trace_setevent @TraceID, 33, 1, @on --Exception, TextData
exec sp_trace_setevent @TraceID, 33, 2, @on --Exception, BinaryData
exec sp_trace_setevent @TraceID, 33, 3, @on --Exception, DatabaseID
exec sp_trace_setevent @TraceID, 33, 4, @on --Exception, TransactionID
exec sp_trace_setevent @TraceID, 33, 12, @on --Exception, SPID
exec sp_trace_setevent @TraceID, 33, 13, @on --Exception, Duration
exec sp_trace_setevent @TraceID, 33, 14, @on --Exception, StartTime
exec sp_trace_setevent @TraceID, 33, 15, @on --Exception, EndTime
exec sp_trace_setevent @TraceID, 33, 16, @on --Exception, Reads
exec sp_trace_setevent @TraceID, 33, 17, @on --Exception, Writes
exec sp_trace_setevent @TraceID, 33, 18, @on --Exception, CPU
exec sp_trace_setevent @TraceID, 33, 21, @on --Exception, EventSubClass
exec sp_trace_setevent @TraceID, 33, 25, @on --Exception, IntegerData
exec sp_trace_setevent @TraceID, 33, 31, @on --Exception, Error
exec sp_trace_setevent @TraceID, 37, 1, @on --SP:Recompile, TextData
exec sp_trace_setevent @TraceID, 37, 2, @on --SP:Recompile, BinaryData
exec sp_trace_setevent @TraceID, 37, 3, @on --SP:Recompile, DatabaseID
exec sp_trace_setevent @TraceID, 37, 4, @on --SP:Recompile, TransactionID
exec sp_trace_setevent @TraceID, 37, 12, @on --SP:Recompile, SPID
exec sp_trace_setevent @TraceID, 37, 13, @on --SP:Recompile, Duration
exec sp_trace_setevent @TraceID, 37, 14, @on --SP:Recompile, StartTime
exec sp_trace_setevent @TraceID, 37, 15, @on --SP:Recompile, EndTime
exec sp_trace_setevent @TraceID, 37, 16, @on --SP:Recompile, Reads
exec sp_trace_setevent @TraceID, 37, 17, @on --SP:Recompile, Writes
exec sp_trace_setevent @TraceID, 37, 18, @on --SP:Recompile, CPU
exec sp_trace_setevent @TraceID, 37, 21, @on --SP:Recompile, EventSubClass
exec sp_trace_setevent @TraceID, 37, 25, @on --SP:Recompile, IntegerData
exec sp_trace_setevent @TraceID, 37, 31, @on --SP:Recompile, Error
exec sp_trace_setevent @TraceID, 41, 1, @on --SQL:StmtCompleted, TextData
exec sp_trace_setevent @TraceID, 41, 2, @on --SQL:StmtCompleted, BinaryData
exec sp_trace_setevent @TraceID, 41, 3, @on --SQL:StmtCompleted, DatabaseID
exec sp_trace_setevent @TraceID, 41, 4, @on --SQL:StmtCompleted, TransactionID
exec sp_trace_setevent @TraceID, 41, 12, @on --SQL:StmtCompleted, SPID
exec sp_trace_setevent @TraceID, 41, 13, @on --SQL:StmtCompleted, Duration
exec sp_trace_setevent @TraceID, 41, 14, @on --SQL:StmtCompleted, StartTime
exec sp_trace_setevent @TraceID, 41, 15, @on --SQL:StmtCompleted, EndTime
exec sp_trace_setevent @TraceID, 41, 16, @on --SQL:StmtCompleted, Reads
exec sp_trace_setevent @TraceID, 41, 17, @on --SQL:StmtCompleted, Writes
exec sp_trace_setevent @TraceID, 41, 18, @on --SQL:StmtCompleted, CPU
exec sp_trace_setevent @TraceID, 41, 21, @on --SQL:StmtCompleted, EventSubClass
exec sp_trace_setevent @TraceID, 41, 25, @on --SQL:StmtCompleted, IntegerData
exec sp_trace_setevent @TraceID, 41, 31, @on --SQL:StmtCompleted, Error
exec sp_trace_setevent @TraceID, 43, 1, @on --SP:Completed, TextData
exec sp_trace_setevent @TraceID, 43, 2, @on --SP:Completed, BinaryData
exec sp_trace_setevent @TraceID, 43, 3, @on --SP:Completed, DatabaseID
exec sp_trace_setevent @TraceID, 43, 4, @on --SP:Completed, TransactionID
exec sp_trace_setevent @TraceID, 43, 12, @on --SP:Completed, SPID
exec sp_trace_setevent @TraceID, 43, 13, @on --SP:Completed, Duration
exec sp_trace_setevent @TraceID, 43, 14, @on --SP:Completed, StartTime
exec sp_trace_setevent @TraceID, 43, 15, @on --SP:Completed, EndTime
exec sp_trace_setevent @TraceID, 43, 16, @on --SP:Completed, Reads
exec sp_trace_setevent @TraceID, 43, 17, @on --SP:Completed, Writes
exec sp_trace_setevent @TraceID, 43, 18, @on --SP:Completed, CPU
exec sp_trace_setevent @TraceID, 43, 21, @on --SP:Completed, EventSubClass
exec sp_trace_setevent @TraceID, 43, 25, @on --SP:Completed, IntegerData
exec sp_trace_setevent @TraceID, 43, 31, @on --SP:Completed, Error
exec sp_trace_setevent @TraceID, 45, 1, @on --SP:StmtCompleted, TextData
exec sp_trace_setevent @TraceID, 45, 2, @on --SP:StmtCompleted, BinaryData
exec sp_trace_setevent @TraceID, 45, 3, @on --SP:StmtCompleted, DatabaseID
exec sp_trace_setevent @TraceID, 45, 4, @on --SP:StmtCompleted, TransactionID
exec sp_trace_setevent @TraceID, 45, 12, @on --SP:StmtCompleted, SPID
exec sp_trace_setevent @TraceID, 45, 13, @on --SP:StmtCompleted, Duration
exec sp_trace_setevent @TraceID, 45, 14, @on --SP:StmtCompleted, StartTime
exec sp_trace_setevent @TraceID, 45, 15, @on --SP:StmtCompleted, EndTime
exec sp_trace_setevent @TraceID, 45, 16, @on --SP:StmtCompleted, Reads
exec sp_trace_setevent @TraceID, 45, 17, @on --SP:StmtCompleted, Writes
exec sp_trace_setevent @TraceID, 45, 18, @on --SP:StmtCompleted, CPU
exec sp_trace_setevent @TraceID, 45, 21, @on --SP:StmtCompleted, EventSubClass
exec sp_trace_setevent @TraceID, 45, 25, @on --SP:StmtCompleted, IntegerData
exec sp_trace_setevent @TraceID, 45, 31, @on --SP:StmtCompleted, Error
exec sp_trace_setevent @TraceID, 50, 1, @on --SQL Transaction, TextData
exec sp_trace_setevent @TraceID, 50, 2, @on --SQL Transaction, BinaryData
exec sp_trace_setevent @TraceID, 50, 3, @on --SQL Transaction, DatabaseID
exec sp_trace_setevent @TraceID, 50, 4, @on --SQL Transaction, TransactionID
exec sp_trace_setevent @TraceID, 50, 12, @on --SQL Transaction, SPID
exec sp_trace_setevent @TraceID, 50, 13, @on --SQL Transaction, Duration
exec sp_trace_setevent @TraceID, 50, 14, @on --SQL Transaction, StartTime
exec sp_trace_setevent @TraceID, 50, 15, @on --SQL Transaction, EndTime
exec sp_trace_setevent @TraceID, 50, 16, @on --SQL Transaction, Reads
exec sp_trace_setevent @TraceID, 50, 17, @on --SQL Transaction, Writes
exec sp_trace_setevent @TraceID, 50, 18, @on --SQL Transaction, CPU
exec sp_trace_setevent @TraceID, 50, 21, @on --SQL Transaction, EventSubClass
exec sp_trace_setevent @TraceID, 50, 25, @on --SQL Transaction, IntegerData
exec sp_trace_setevent @TraceID, 50, 31, @on --SQL Transaction, Error
exec sp_trace_setevent @TraceID, 55, 1, @on --Hash Warning, TextData
exec sp_trace_setevent @TraceID, 55, 2, @on --Hash Warning, BinaryData
exec sp_trace_setevent @TraceID, 55, 3, @on --Hash Warning, DatabaseID
exec sp_trace_setevent @TraceID, 55, 4, @on --Hash Warning, TransactionID
exec sp_trace_setevent @TraceID, 55, 12, @on --Hash Warning, SPID
exec sp_trace_setevent @TraceID, 55, 13, @on --Hash Warning, Duration
exec sp_trace_setevent @TraceID, 55, 14, @on --Hash Warning, StartTime
exec sp_trace_setevent @TraceID, 55, 15, @on --Hash Warning, EndTime
exec sp_trace_setevent @TraceID, 55, 16, @on --Hash Warning, Reads
exec sp_trace_setevent @TraceID, 55, 17, @on --Hash Warning, Writes
exec sp_trace_setevent @TraceID, 55, 18, @on --Hash Warning, CPU
exec sp_trace_setevent @TraceID, 55, 21, @on --Hash Warning, EventSubClass
exec sp_trace_setevent @TraceID, 55, 25, @on --Hash Warning, IntegerData
exec sp_trace_setevent @TraceID, 55, 31, @on --Hash Warning, Error
exec sp_trace_setevent @TraceID, 59, 1, @on --Lock:Deadlock Chain, TextData
exec sp_trace_setevent @TraceID, 59, 2, @on --Lock:Deadlock Chain, BinaryData
exec sp_trace_setevent @TraceID, 59, 3, @on --Lock:Deadlock Chain, DatabaseID
exec sp_trace_setevent @TraceID, 59, 4, @on --Lock:Deadlock Chain, TransactionID
exec sp_trace_setevent @TraceID, 59, 12, @on --Lock:Deadlock Chain, SPID
exec sp_trace_setevent @TraceID, 59, 13, @on --Lock:Deadlock Chain, Duration
exec sp_trace_setevent @TraceID, 59, 14, @on --Lock:Deadlock Chain, StartTime
exec sp_trace_setevent @TraceID, 59, 15, @on --Lock:Deadlock Chain, EndTime
exec sp_trace_setevent @TraceID, 59, 16, @on --Lock:Deadlock Chain, Reads
exec sp_trace_setevent @TraceID, 59, 17, @on --Lock:Deadlock Chain, Writes
exec sp_trace_setevent @TraceID, 59, 18, @on --Lock:Deadlock Chain, CPU
exec sp_trace_setevent @TraceID, 59, 21, @on --Lock:Deadlock Chain, EventSubClass
exec sp_trace_setevent @TraceID, 59, 25, @on --Lock:Deadlock Chain, IntegerData
exec sp_trace_setevent @TraceID, 59, 31, @on --Lock:Deadlock Chain, Error
exec sp_trace_setevent @TraceID, 67, 1, @on --Execution Warnings, TextData
exec sp_trace_setevent @TraceID, 67, 2, @on --Execution Warnings, BinaryData
exec sp_trace_setevent @TraceID, 67, 3, @on --Execution Warnings, DatabaseID
exec sp_trace_setevent @TraceID, 67, 4, @on --Execution Warnings, TransactionID
exec sp_trace_setevent @TraceID, 67, 12, @on --Execution Warnings, SPID
exec sp_trace_setevent @TraceID, 67, 13, @on --Execution Warnings, Duration
exec sp_trace_setevent @TraceID, 67, 14, @on --Execution Warnings, StartTime
exec sp_trace_setevent @TraceID, 67, 15, @on --Execution Warnings, EndTime
exec sp_trace_setevent @TraceID, 67, 16, @on --Execution Warnings, Reads
exec sp_trace_setevent @TraceID, 67, 17, @on --Execution Warnings, Writes
exec sp_trace_setevent @TraceID, 67, 18, @on --Execution Warnings, CPU
exec sp_trace_setevent @TraceID, 67, 21, @on --Execution Warnings, EventSubClass
exec sp_trace_setevent @TraceID, 67, 25, @on --Execution Warnings, IntegerData
exec sp_trace_setevent @TraceID, 67, 31, @on --Execution Warnings, Error
exec sp_trace_setevent @TraceID, 69, 1, @on --Sort Warnings, TextData
exec sp_trace_setevent @TraceID, 69, 2, @on --Sort Warnings, BinaryData
exec sp_trace_setevent @TraceID, 69, 3, @on --Sort Warnings, DatabaseID
exec sp_trace_setevent @TraceID, 69, 4, @on --Sort Warnings, TransactionID
exec sp_trace_setevent @TraceID, 69, 12, @on --Sort Warnings, SPID
exec sp_trace_setevent @TraceID, 69, 13, @on --Sort Warnings, Duration
exec sp_trace_setevent @TraceID, 69, 14, @on --Sort Warnings, StartTime
exec sp_trace_setevent @TraceID, 69, 15, @on --Sort Warnings, EndTime
exec sp_trace_setevent @TraceID, 69, 16, @on --Sort Warnings, Reads
exec sp_trace_setevent @TraceID, 69, 17, @on --Sort Warnings, Writes
exec sp_trace_setevent @TraceID, 69, 18, @on --Sort Warnings, CPU
exec sp_trace_setevent @TraceID, 69, 21, @on --Sort Warnings, EventSubClass
exec sp_trace_setevent @TraceID, 69, 25, @on --Sort Warnings, IntegerData
exec sp_trace_setevent @TraceID, 69, 31, @on --Sort Warnings, Error
exec sp_trace_setevent @TraceID, 76, 1, @on --CursorImplicitConversion, TextData
exec sp_trace_setevent @TraceID, 76, 2, @on --CursorImplicitConversion, BinaryData
exec sp_trace_setevent @TraceID, 76, 3, @on --CursorImplicitConversion, DatabaseID
exec sp_trace_setevent @TraceID, 76, 4, @on --CursorImplicitConversion
                                            -- , TransactionID
exec sp_trace_setevent @TraceID, 76, 12, @on --CursorImplicitConversion, SPID
exec sp_trace_setevent @TraceID, 76, 13, @on --CursorImplicitConversion, Duration
exec sp_trace_setevent @TraceID, 76, 14, @on --CursorImplicitConversion, StartTime
exec sp_trace_setevent @TraceID, 76, 15, @on --CursorImplicitConversion, EndTime
exec sp_trace_setevent @TraceID, 76, 16, @on --CursorImplicitConversion, Reads
exec sp_trace_setevent @TraceID, 76, 17, @on --CursorImplicitConversion, Writes
exec sp_trace_setevent @TraceID, 76, 18, @on --CursorImplicitConversion, CPU
exec sp_trace_setevent @TraceID, 76, 21, @on --CursorImplicitConversion, EventSubClass
exec sp_trace_setevent @TraceID, 76, 25, @on --CursorImplicitConversion
                                             -- , IntegerData
exec sp_trace_setevent @TraceID, 76, 31, @on --CursorImplicitConversion, Error
exec sp_trace_setevent @TraceID, 79, 1, @on --Missing Column Statistics, TextData
exec sp_trace_setevent @TraceID, 79, 2, @on --Missing Column Statistics, BinaryData
exec sp_trace_setevent @TraceID, 79, 3, @on --Missing Column Statistics, DatabaseID
exec sp_trace_setevent @TraceID, 79, 4, @on --Missing Column Statistics, TransactionID
exec sp_trace_setevent @TraceID, 79, 12, @on --Missing Column Statistics, SPID
exec sp_trace_setevent @TraceID, 79, 13, @on --Missing Column Statistics, Duration
exec sp_trace_setevent @TraceID, 79, 14, @on --Missing Column Statistics, StartTime
exec sp_trace_setevent @TraceID, 79, 15, @on --Missing Column Statistics, EndTime
exec sp_trace_setevent @TraceID, 79, 16, @on --Missing Column Statistics, Reads
exec sp_trace_setevent @TraceID, 79, 17, @on --Missing Column Statistics, Writes
exec sp_trace_setevent @TraceID, 79, 18, @on --Missing Column Statistics, CPU
exec sp_trace_setevent @TraceID, 79, 21, @on --Missing Column Statistics, EventSubClass
exec sp_trace_setevent @TraceID, 79, 25, @on --Missing Column Statistics
                                             --, IntegerData
exec sp_trace_setevent @TraceID, 79, 31, @on --Missing Column Statistics, Error
exec sp_trace_setevent @TraceID, 80, 1, @on --Missing Join Predicate, TextData
exec sp_trace_setevent @TraceID, 80, 2, @on --Missing Join Predicate, BinaryData
exec sp_trace_setevent @TraceID, 80, 3, @on --Missing Join Predicate, DatabaseID
exec sp_trace_setevent @TraceID, 80, 4, @on --Missing Join Predicate, TransactionID
exec sp_trace_setevent @TraceID, 80, 12, @on --Missing Join Predicate, SPID
exec sp_trace_setevent @TraceID, 80, 13, @on --Missing Join Predicate, Duration
exec sp_trace_setevent @TraceID, 80, 14, @on --Missing Join Predicate, StartTime
exec sp_trace_setevent @TraceID, 80, 15, @on --Missing Join Predicate, EndTime
exec sp_trace_setevent @TraceID, 80, 16, @on --Missing Join Predicate, Reads
exec sp_trace_setevent @TraceID, 80, 17, @on --Missing Join Predicate, Writes
exec sp_trace_setevent @TraceID, 80, 18, @on --Missing Join Predicate, CPU
exec sp_trace_setevent @TraceID, 80, 21, @on --Missing Join Predicate
                                             --, EventSubClass
exec sp_trace_setevent @TraceID, 80, 25, @on --Missing Join Predicate, IntegerData
exec sp_trace_setevent @TraceID, 80, 31, @on --Missing Join Predicate, Error

-- Set the Filters
declare @intfilter int
declare @bigintfilter bigint

exec sp_trace_setfilter @TraceID, 10, 0, 7, N'SQL Profiler'
set @intfilter = @@SPID --Exclude its own SPID
exec sp_trace_setfilter @TraceID, 12, 0, 1, @intfilter

-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1

-- Display name of the trace file and trace id for future references
Print 'Trace file = ''' + @BlockingTrace + '.trc'''
Print 'TraceID = ' + CAST(@TraceID AS VARCHAR(3)) + CHAR(10)
goto finish

error: 
select ErrorCode=@rc

finish: 

/********************************************************************************/
/* Collect blocker script output                                                */
/********************************************************************************/
DECLARE @StartTime DATETIME
SET @StartTime = GETDATE()
WHILE DATEDIFF(mi, @StartTime, GETDATE()) <= @MonitoringPeriod
BEGIN
   EXEC master.dbo.sp_blocker_pss80 @fast=1
   WAITFOR DELAY '00:00:15'
END

/********************************************************************************/
/* Stop SQL tracing                                                             */
/*                                                                              */
/* NOTE: If you stop the trace manually, then you must explicitly run the       */
/*       following two sp_trace_setstatus statements by replacing @TraceID with */
/*       the value of the column traceid in the output of the statement below:  */
/*         SELECT * FROM ::fn_trace_getinfo(default)                            */
/********************************************************************************/
EXEC sp_trace_setstatus @TraceID, 0
EXEC sp_trace_setstatus @TraceID, 2


SET XACT_ABORT OFF
GO
