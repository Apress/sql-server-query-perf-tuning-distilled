/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

DECLARE @Fund MONEY, @Bonus MONEY, @NumberOfEmployees INT
SET @Fund = 100
BEGIN TRAN PayBonus
  SELECT @NumberOfEmployees = COUNT(*)
    FROM MyEmployees WHERE GroupID = 10
  /*Allow transaction 2 to execute*/ WAITFOR DELAY '00:00:10'
  IF @NumberOfEmployees > 0
  BEGIN
    SET @Bonus = @Fund / @NumberOfEmployees
    UPDATE MyEmployees
      SET Salary = Salary + @Bonus
      WHERE GroupID = 10
    PRINT 'Fund balance =
          ' + CAST((@Fund-(@@ROWCOUNT*@Bonus))
          AS VARCHAR(6)) + ' $'
  END
COMMIT
GO
