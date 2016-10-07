/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

SET NOCOUNT ON
GO

IF(SELECT OBJECT_ID('emp')) IS NOT NULL
  DROP TABLE emp
GO
CREATE TABLE emp (
  empID INT IDENTITY,
  address CHAR(300),
  [name] CHAR(4)
)

--Load the table with 10,000 rows of test data:
DECLARE @counter INT
SET @counter = 1
WHILE (@counter <= 2000)
BEGIN
  INSERT emp(address, [name]) VALUES('Charlotte, NC', 'Andy')
  INSERT emp(address, [name]) VALUES('Charlotte, NC', 'Dave')
  INSERT emp(address, [name]) VALUES('Charlotte, NC', 'John')
  INSERT emp(address, [name]) VALUES('Charlotte, NC', 'Kate')
  INSERT emp(address, [name]) VALUES('Charlotte, NC', 'Pete')
  SET @counter = @counter + 1
END

SET NOCOUNT OFF
GO
