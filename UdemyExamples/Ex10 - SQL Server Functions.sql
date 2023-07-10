-- Section 8: Using SQL Server Functions
-- this is getting to the intermediate SQL stuff

-- left ftn (string ftn)
select 'Nalgene', left('Nalgene', 4)

select left(LastName, 5), LastName
from Person.Person

-- right ftn (string ftn) 
select right(LastName, 5) as [Last 5 Char's of LastName], LastName
from Person.Person

-- substring (string ftn)
select 'Bingus Tillythwomper III', substring('Bingus Tillythwomper III', 2, 4)

select top 100 
	FirstName, 
	substring(FirstName, 3, 5)
from Person.Person

-- charindex ftn: searches for a string of text within another string of text
select charindex('i', 'Bingus Tillythwomper III') -- note that it only found the first one
-- starts its search at the third character (inclusive) 
select charindex('i', 'Bingus Tillythwomper III', 3) 

-- ltrim and rtrim
select ltrim('    this is a test'), rtrim('this is a test     ')

-- upper and lower
select 'mIlo BAuMan', upper('mIlo BAuMan'), lower('mIlo BAuMan')

-- len
select top 100 LastName, len(LastName)
from Person.Person

select '1234567890', replace('1234567890', '3', 'T')

-- nested functions
select '           T-SQL class', 
	len('           T-SQL class'), 
	len(ltrim('           T-SQL class'))