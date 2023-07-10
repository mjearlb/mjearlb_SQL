SELECT P.Name, P.ProductNumber, PS.Name AS ProductSubCategoryName
FROM Production.Product P
INNER JOIN Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID


-- inner join = intersection
select p.Name, p.ProductNumber, ps.Name as [Product Subcategory Name]
from Production.Product p
inner join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID

select 
	ps.Name as [Product Subcategory Name],
	pc.Name as [Prodcut Category Name]
from Production.ProductSubcategory ps
inner join Production.ProductSubcategory pc
on ps.ProductCategoryID = pc.ProductCategoryID

-- multiple inner joins
select p.FirstName, p.LastName, ea.EmailAddress, pp.PhoneNumber
from Person.Person p
inner join Person.EmailAddress ea
on p.BusinessEntityID = ea.BusinessEntityID
inner join Person.PersonPhone pp
on pp.BusinessEntityID = p.BusinessEntityID


-- practice problems
select p.FirstName, p.LastName, pw.PasswordHash, ea.EmailAddress
from Person.Person p
inner join Person.Password pw
on p.BusinessEntityID = pw.BusinessEntityID
inner join Person.EmailAddress ea
on p.BusinessEntityID = ea.BusinessEntityID

select e.BusinessEntityID, e.NationalIDNumber, e.JobTitle, 
	edh.DepartmentID, edh.StartDate, edh.EndDate
from HumanResources.Employee e
inner join HumanResources.EmployeeDepartmentHistory edh
on e.BusinessEntityID = edh.BusinessEntityID