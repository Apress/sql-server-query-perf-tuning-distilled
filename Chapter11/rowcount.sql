/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('Hotel')) IS NOT NULL
  DROP TABLE Hotel
GO
CREATE TABLE Hotel(RoomID INT IDENTITY, RoomNumber INT, Location CHAR(100))
DECLARE @n INT
SET @n = 1
WHILE @n <= 5000
BEGIN
  INSERT INTO Hotel (RoomNumber, Location) VALUES(@n,'1st Floor')
  SET @n = @n + 1
END
CREATE INDEX i_RoomID ON Hotel(RoomID)
