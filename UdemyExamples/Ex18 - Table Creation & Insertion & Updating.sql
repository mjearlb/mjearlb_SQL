-- Creating a Table, Inserting to a Table, and Updating Tables

-- table creation
create table TestTable( -- will default to dbo.[table name]
	Col_A varchar(100), 
	Col_B int, 
	Col_C datetime, 
	Col_D varchar(10)
)

-- table insertion
insert into TestTable(Col_A, Col_B, Col_C, Col_D) -- only need to add ([col], ...)'s if not adding to all col's
values('test string', 00123450, getdate(), 'test strin'), 
	('test string 2', 2, dateadd(day, -10100, getdate()), 'string tes')

insert into TestTable
select 
	FirstName + ' ' + LastName, 
	BusinessEntityID, 
	datediff(day, BusinessEntityID * 100, getdate()), 
	PhoneNumberType
from HumanResources.vEmployee

-- table updating
update TestTable
	set Col_B = 123450
		where Col_A = 'test string' -- without this, it would update every row

select 
	Col_A as PatientName, 
	Col_B as PatientID, 
	Col_C as DateOfBirth, 
	Col_D as PhoneType
from TestTable
-- order by Col_C asc
drop table TestTable
