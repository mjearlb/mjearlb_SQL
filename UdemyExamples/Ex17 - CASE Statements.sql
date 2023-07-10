-- CASE statements

select ProductID, ListPrice
from Production.Product
where ListPrice <> 0

-- let's consider $100+ to be expensive
select 
	ProductID, ListPrice,
	case
		when ListPrice > 100 then 'Expensive Product'
		else 'Inexpensive Product' -- or do: when ListPrice <= 100 then...
	end as PriceClass
from Production.Product
where ListPrice <> 0


with CustomerAges 
as (
	select 
		p.FirstName, 
		p.LastName, 
			floor(datediff(day, pd.BirthDate, getdate())/365.25) as Age
	from Sales.vPersonDemographics pd
	inner join Person.Person p
	on p.BusinessEntityID = pd.BusinessEntityID
), 
CustomerAgeRanges as (
	select *,
		case 
			when Age is null then 'Unknown Age'
			when Age between 0 and 17 then 'Under 18'
			when Age between 18 and 24 then '18 to 24'
			when Age between 25 and 34 then '25 to 34'
			when Age between 35 and 49 then '35 to 49'
			when Age between 50 and 64 then '50 to 64'
			else 'Over 65'
		end as AgeRange
	from CustomerAges
)

select AgeRange, count (*) as CustomerCount
from CustomerAgeRanges
group by AgeRange
order by 1
-- we don't do the grouping within the CTE as that would make us write the entire AgeRange table multiple times


-- how to convert values into other values (easily fix data quality issues)
select 
	pd.BusinessEntityID, 
	p.FirstName, 
	p.LastName, 
	case	
		when pd.Gender = 'M' then 'Male'
		when pd.Gender = 'F' then 'Female'
		else 'No Gender Specified'
	end as GenderValue
from Sales.vPersonDemographics pd
inner join Person.Person p
on p.BusinessEntityID = pd.BusinessEntityID


select
	MiddleName, 
	coalesce(MiddleName, ' ') as CoalescedMiddleName, 
	case	
		when MiddleName is null then ' '
		else MiddleName
	end as CasedMiddleName
from Person.Person
go

-- Have to add custom ordering
with CustomerSales
as (
	select 
		p.BusinessEntityID, 
		sum(soh.TotalDue) as TotalSalesAmount
	from Sales.SalesOrderHeader soh
	inner join Sales.Customer sc
	on sc.CustomerID = soh.CustomerID
	inner join Person.Person p 
	on p.BusinessEntityID = sc.PersonID
	group by p.BusinessEntityID
), 
CustomerSalesRange as (
	select 
		p.FirstName + ' ' + p.LastName as CustomerName, 
		case	
			when cs.TotalSalesAmount between 0 and 149.99 then 'Under $150'
			when cs.TotalSalesAmount between 150 and 499.99 then '$150 - $499.99'
			when cs.TotalSalesAmount between 500 and 999.99 then '$500 - $999.99'
			when cs.TotalSalesAmount between 1000 and 4999.99 then '$1000 - $4999.99'
			when cs.TotalSalesAmount between 5000 and 14999.99 then '$5000 - $14999.99'
			else 'Over $15,000'
		end as SalesRange
	from CustomerSales cs 
	inner join Person.Person p
	on p.BusinessEntityID = cs.BusinessEntityID
)

select SalesRange, count(*) as [Customers in Range]
from CustomerSalesRange
group by SalesRange
order by 
	case
		when SalesRange = 'Under $150' then 1
		when SalesRange = '$150 - $499.99' then 2
		when SalesRange = '$500 - $999.99' then 3
		when SalesRange = '$1000 - $4999.99' then 4
		when SalesRange = '$5000 - $14999.99' then 5
		else 6
	end
go

-- PRACTICE PROBLEMS 
select
	FirstName, 
	LastName, 
	case	
		when EmailPromotion = 0 then 'Big Promotion'
		when EmailPromotion = 1 then 'Cool Promotion'
		else 'Sad Meaningless Promotion'
	end as PromoName
from Person.Person
go 


select FirstName, 
	case 
		when len(FirstName) >= 10 then 'Long Name' 
		when len(FirstName) < 10 then 'Short Name' 
		else 'Error'
	end as NameLength
from Person.Person
go

with SalesRanges
as (
	select 
		case
			when TotalDue between 0 and 149.99 
				then '$0 - $149.99'
			when TotalDue between 150 and 499.99 
				then '$150 – $499.99'
			when TotalDue between 500 and 4999.99 
				then '$500 to $4,999.99' 
			when TotalDue between 5000 and 24999.99 
				then '$5,000 - $24,999.99'
			else 'More than $25,000.00'
		end as SalesPriceRange, 
		SalesOrderID
	from Sales.SalesOrderHeader
	where SalesPersonID is not null
)

select 
	COUNT(*), 
	SalesPriceRange
from SalesRanges
group by SalesPriceRange
order by 
	case 
		when SalesPriceRange = '$0 - $149.99' then 1
		when SalesPriceRange = '$150 – $499.99' then 2
		when SalesPriceRange = '$500 to $4,999.99' then 3
		when SalesPriceRange = '$5,000 - $24,999.99' then 4
		else 5
	end 
go

select 
	coalesce(Color, 'No Color') as [Coalesce], 
	case 
		when Color is null then 'No Color'
		else Color
	end as [Case]
from Production.Product
