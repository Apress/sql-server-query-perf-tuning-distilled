SQL Server Query Performance Tuning Distilled, Second Edition
ISBN 1590594215
Author Sajal Dam


Test Database:
=============
The examples in this book mostly use the Northwind database. Therefore, make sure that your version of the Northwind database has not been heavily modified, so that you get the same results. If required, you can reinstall your Northwind database by following these steps:
1. At the command prompt, change to the directory <Directory of SQL Server installation>\Install. For example, the default directory of the SQL Server installation is C:\Program Files\Microsoft SQL Server\MSSQL.
2. Use the osql utility to run the instnwnd.sql script:
osql -E /S<servername> /iinstnwnd.sql /oinstnwnd.rpt
3. Check instnwnd.rpt for reported errors.
