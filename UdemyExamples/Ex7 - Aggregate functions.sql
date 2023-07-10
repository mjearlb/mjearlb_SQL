-- aggregate functions

select totaldue
from sales.SalesOrderHeader
order by 1 desc

-- count
select count(SalesPersonID)
from Sales.SalesOrderHeader
-- same as above
select count(*)
from Sales.SalesOrderHeader
where SalesPersonID is not null

select count(distinct firstname)
from Person.Person

select avg(totaldue)
from Sales.SalesOrderHeader

select sum(totaldue)
from Sales.SalesOrderHeader

select sum(TotalDue)
from Sales.SalesOrderHeader
where OrderDate between '1/1/2013' and '12/31/2013'

select max(FirstName)
from Person.Person


-- practice problems
select count(*)
from Person.Person

select count(*)
from Person.Person
where MiddleName is not null

select avg(StandardCost)
from Production.Product
where StandardCost > 0

select avg(Freight)
from Sales.SalesOrderHeader
where TerritoryID = 4

select max(ListPrice)
from Production.Product

select sum((p.ListPrice * i.Quantity))
from Production.Product as p
inner join Production.ProductInventory as i
on p.ProductID = i.ProductID
where p.ListPrice > 0
