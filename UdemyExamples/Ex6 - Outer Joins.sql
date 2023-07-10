-- outer joins: see all information from 1 or more
-- tables, even if they do not fit criteria

-- left outer join
select p.Name, p.ProductNumber, ps.Name as [Product Subcategory Name]
from Production.Product p
left outer join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID

-- right outer join
select p.Name, p.ProductNumber, ps.Name as [Product Subcategory Name]
from Production.ProductSubcategory ps
right outer join Production.Product p
on p.ProductSubcategoryID = ps.ProductSubcategoryID

-- they have the same output!

-- multiple left outer joins
select 
	p.FirstName, p.LastName,
	soh.SalesOrderNumber, soh.TotalDue as SalesAmount,
	t.Name as Territory
from Sales.SalesOrderHeader soh
left outer join Sales.SalesPerson sp
on sp.BusinessEntityID = soh.SalesPersonID -- why join these? check fk's in left bar under SOH
left outer join HumanResources.Employee e
on e.BusinessEntityID = sp.BusinessEntityID
left outer join Person.Person p
on e.BusinessEntityID = p.BusinessEntityID
left outer join Sales.SalesTerritory t
on t.TerritoryID = soh.TerritoryID
where t.Name = 'Northwest'
order by 4 desc

select top 100 * from Sales.SalesTerritory -- can join with Sales.SalesOrderHeader, let's go back and add it to prev table!


-- practice problems

select 
	sp.BusinessEntityID, sp.SalesYTD, 
	st.Name as [Territory Name]
from Sales.SalesPerson sp
left outer join Sales.SalesTerritory st
on sp.TerritoryID = st.TerritoryID
left outer join Person.Person p
on p.BusinessEntityID = sp.BusinessEntityID
where st.Name in ('northwest', 'central')

select 
	p.Name as [Product Name], p.ListPrice,
	ps.Name as [Product Subcategory Name], 
	pc.Name as [Product Category Name]
from Production.Product p
left outer join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
left outer join Production.ProductCategory pc
on pc.ProductCategoryID = ps.ProductCategoryID
order by [Product Category Name] desc, 
	[Product Subcategory Name] asc