-- group by

select [col1], [col2]
from [table]
where {filtering criteria}
group by [col name], [col name]

order by [col1]

select SalesPersonID, TotalDue
from Sales.SalesOrderHeader

select SalesPersonID, sum(TotalDue) as [Total Sales]
from Sales.SalesOrderHeader
group by SalesPersonID


select 
	ProductID, 
	sum(quantity) as [total in stock],
	count(*) as [total locations]
from Production.ProductInventory
group by ProductID

-- total sales per person by region
select TerritoryID, SalesPersonID, sum(TotalDue) as [total sales]
from Sales.SalesOrderHeader
where OrderDate between '1/1/2013' and '12/31/2013'
group by TerritoryID, SalesPersonID
order by 1, 2

-- it's okay, but lets do territory and person names instead of id's:
select 
	st.Name as [Territory Name], 
	p.FirstName + ' ' + p.LastName as [Name], 
	sum(TotalDue) as [Total Sales]
from Sales.SalesOrderHeader soh
inner join Sales.SalesPerson sp
on sp.BusinessEntityID = soh.SalesPersonID
inner join Person.Person p
on p.BusinessEntityID = sp.BusinessEntityID
inner join Sales.SalesTerritory st
on st.TerritoryID = soh.TerritoryID
where OrderDate between '1/1/2013' and '12/31/2013'
group by st.Name, p.FirstName + ' ' +  p.LastName
order by 1, 2



-- practice problems
select 
	PersonType,
	count(*) as [Person Count] 
from Person.Person
group by PersonType

select 
	Color,
	count(*) as [Total Products]
from Production.Product
where color in ('red', 'black')
group by Color

select 
	TerritoryID,
	count(*) as [Total Sales] 
from Sales.SalesOrderHeader
where OrderDate between '7/1/2012' and '12/31/2013'
group by TerritoryID
order by TerritoryID desc

select 
	st.Name as [Territory Name],
	count(*) as [Total Sales] 
from Sales.SalesOrderHeader soh
inner join Sales.SalesTerritory st
on st.TerritoryID = soh.TerritoryID
where soh.OrderDate between '7/1/2012' and '12/31/2013'
group by st.Name
order by st.Name desc
