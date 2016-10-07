/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

IF(SELECT OBJECT_ID('MyEmployees')) IS NOT NULL
  DROP TABLE MyEmployees
GO
CREATE TABLE MyEmployees(EmployeeID INT, GroupID INT, Salary MONEY)
CREATE CLUSTERED INDEX i1 ON MyEmployees(GroupID)
INSERT INTO MyEmployees VALUES(1, 10, 1000) --Employee 1 in group 10
INSERT INTO MyEmployees VALUES(2, 10, 1000) --Employee 2 in group 10
--Employee 3 & 4 in different groups
INSERT INTO MyEmployees VALUES(3, 20, 1000)
INSERT INTO MyEmployees VALUES(4, 9, 1000)
