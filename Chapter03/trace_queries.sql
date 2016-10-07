/********************************************************************************/
/*                                                                              */
/* Copyright by Author Sajal Dam, ISBN 1590594215                               */
/*                                                                              */
/********************************************************************************/

USE Northwind
GO
select * from [Orders]
go
select * from [Products]
go
select * from [Order Details]
go
select * from [CustomerCustomerDemo]
go
select * from [CustomerDemographics]
go
select * from [Region]
go
select distinct p.productid, p.productname, p.unitprice, od.quantity, p.unitsinstock
  from products p, [od] od
  where p.productid = od.productid
  and od.quantity = (select min(odSub.quantity) from [od] odSub)
  order by p.productid
go
select * from [Territories]
go
select * from [EmployeeTerritories]
go
select * from [Employees]
go
select * from [Categories]
go
select * from [Customers]
go
select * from [Shippers]
go
select * from [Suppliers]
go
