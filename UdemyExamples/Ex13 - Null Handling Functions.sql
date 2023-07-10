-- null handling functions

-- coalesce --> finds NULL's and replaces it with whatever you want
select top 100 
	FirstName, coalesce(MiddleName, '') as MiddleName, LastName
from Person.Person

-- null if
select BillToAddressID, ShipToAddressID,
	nullif(BillToAddressID, ShipToAddressID)
from Sales.SalesOrderHeader

-- both!
select BillToAddressID, ShipToAddressID,
	coalesce(nullif(BillToAddressID, ShipToAddressID), '1')
from Sales.SalesOrderHeader

-- PRACTICE PROBLEMS
select 
	coalesce(Title, 'No Title Listed'), 
	FirstName, 
	coalesce(MiddleName, 'No Middle Name Listed'), 
	LastName
from Person.Person

-- 2 ways to concatonate strings
-- coalesce a concatonated string works (for finding if one part is null!)
select 
	coalesce(firstname + ' ' + MiddleName + ' ' + lastname, CONCAT(FirstName, ' ', lastname))
from Person.Person

select 
	nullif(MakeFlag, finishedgoodsflag)
from Production.Product
