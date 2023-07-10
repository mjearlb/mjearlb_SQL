-- Query a view instead of a table
select * 
from HumanResources.vEmployee
-- the same table (not view): completely different
select * 
from HumanResources.Employee


-- specifying a particular col(s) from a view
select FirstName, LastName, EmailAddress, PhoneNumber
from Sales.vIndividualCustomer

--practice problems
select top 20 percent NationalIDNumber as "SSN", JobTitle as "Job Title", BirthDate
from HumanResources.Employee

select top 50 percent Name as "Product Name"
from Production.vProductAndDescription