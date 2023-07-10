-- data casting (conversion and casting)

select getdate() as Date, cast(getdate() as date) as CastedDate
-- these are the same basically
select getdate() as Date, convert(date, getdate()) as ConvertedDate

select top 100 cast(FirstName as char) -- can't convert string to int for ex
from Person.Person

-- PRACTICE PROBLEMS
select cast(FirstName as varchar)
from Person.Person

select 
	11/4, 
	cast(11 as float) / cast(4 as float),
	11.0/4.0

select cast(FirstName as varchar(3))
from Person.Person

select 
	cast(Size as int)
from Production.Product 
-- does not work as Size may not be in numbers, might be S, M, or L

select 
	cast(Size as int)
from Production.Product
where isnumeric(Size) = 1
