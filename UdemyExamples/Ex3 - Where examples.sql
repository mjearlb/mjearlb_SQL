-- where [column] in (list)
select * 
from HumanResources.vEmployee
where (FirstName in ('chris', 'steve', 'michael', 'thomas'))

-- where [column] between value1 and value2
select * 
from Sales.vStoreWithDemographics
where AnnualSales between 1000000 and 2000000

-- wildcard character (anynumber of char's after)
select * 
from HumanResources.vEmployee
where FirstName like 'Mi%'
-- _ means single character after
select * 
from HumanResources.vEmployee
where FirstName like 'Mi_'
-- names that end in s
select * 
from HumanResources.vEmployee
where FirstName like '%s'
-- names containing h
select * 
from HumanResources.vEmployee
where FirstName like '%h%'

-- searching for Don or Dan
select * 
from HumanResources.vEmployee
where FirstName like 'D[a,o]n'
-- searching for ranges of letters
select * 
from HumanResources.vEmployee
where FirstName like 'D[a-f,r-z]n'
-- searching for names that start with D, second letter is NOT a-f, and 3rd letter is n
select * 
from HumanResources.vEmployee
where FirstName like 'D[^a-f]n'

-- how to filter NULL values
select * 
from Person.Person
where MiddleName is null

select * 
from Person.Person
where MiddleName is not null

select * 
from HumanResources.vEmployee
where MiddleName is not null and PhoneNumberType = 'Cell'