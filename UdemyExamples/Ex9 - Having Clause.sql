-- HAVING examples

-- differences between HAVING and WHERE: 
	-- WHERE: filters rows of data based on column data
	-- HAVING: filters out groups based on aggregate function values

select 
	st.Name as [Territory Name], 
	sum(TotalDue) as [Total Sales - 2012] 
from Sales.SalesOrderHeader soh
inner join Sales.SalesTerritory st
on st.TerritoryID = soh.TerritoryID
where OrderDate between '1/1/2012' and '12/31/2012'
group by st.Name -- how to only return those with over $4,000,000 in sales?
having sum(TotalDue) > 4000000
order by 1

-- want to return only products subcategories with at least 15 products in the subcategory
select 
	ps.Name as [Product Subcategory], 
	count(*) as [Product Count] 
from Production.Product p
inner join Production.ProductSubcategory ps
on ps.ProductSubcategoryID = p.ProductSubcategoryID
group by ps.Name
having count(*) >= 15
order by 1

-- will NEVER do sum(*) or count(*) in the WHERE clause, only in the HAVING clause

select 
	Department as [Dpt Name], 
	count(*) as [Employee Count] 
from HumanResources.vEmployeeDepartment
group by Department
having count(*) in (6, 10) -- OR between 6 and 10

-- want emp's who sold more than $2M
select 
	SalesPersonID,
	sum(TotalDue) as [Total Sales Amount], 
	count(*) as [Total Sales Count] 
from Sales.SalesOrderHeader
where OrderDate between '1/1/2012' and '12/31/2012'
	and SalesPersonID is not null
group by SalesPersonID
having sum(TotalDue) >= 2000000
	and count(*) >= 75
order by [Total Sales Amount] desc


-- practice problems
select 
	TerritoryID as Territory, 
	sum(TotalDue) as TotalSales
from Sales.SalesOrderHeader
group by TerritoryID
having sum(TotalDue) > 10000000


select 
	st.Name as Territory, 
	sum(TotalDue) as TotalSales
from Sales.SalesOrderHeader soh
inner join Sales.SalesTerritory st
on st.TerritoryID = soh.TerritoryID
group by st.name
having sum(TotalDue) > 10000000

select 
	Color, 
	count(*) as NumProds
from Production.Product
where Color is not null
group by Color
having Color in ('red', 'black') and count(*) > 20 -- the 20 doesn't really matter bc they all are more than 20 anyways

select 
	p.Name as [Product Name], 
	count(*) as NumberOrdered
from Sales.SalesOrderHeader soh
inner join Sales.SalesOrderDetail sod
on sod.SalesOrderID = soh.SalesOrderID
inner join Production.Product p
on p.ProductID = sod.ProductID
where soh.OrderDate between '1/1/2011' and '12/31/2012'
group by p.Name
having count(*) >= 200

select 
	p.FirstName, 
	p.LastName, 
	count(*) as TotalOrders
from Sales.SalesOrderHeader soh
inner join Sales.Customer c
on c.CustomerID = soh.CustomerID
inner join Person.Person p
on p.BusinessEntityID = c.PersonID
where soh.OrderDate between '1/1/2011' and '12/31/2012'
group by p.FirstName, p.LastName
having count(*) >= 6
order by count(*) desc
