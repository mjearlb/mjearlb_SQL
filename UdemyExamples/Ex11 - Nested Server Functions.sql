-- nested functions in SQL

select '    sample text', 
	len(ltrim('    sample text'))

-- good ex
select 
	[Name], 
	substring([Name], 3, 7) as Step1, 
	upper(substring([Name], 3, 7)) as Step2,
	replace(upper(substring([Name], 3, 7)), 'E', '_') as Step3
from Production.Product

-- practice problems
select 'this is a basic string', left('this is a basic string', 6)

select 'this is another basic string', right('this is another basic string', 6)

select charindex('e', Name)
from Production.Product

-- (String, start point, num char's)
select substring(Name, 3, 4)
from Sales.SalesTerritory

select left(right('this is a slightly longer string', 8), 4)

select left(FirstName, charindex('e', FirstName))
from Person.Person
where charindex('e', FirstName) <> 0 -- could do = 4 to only return those which have four letters including the 'e'
