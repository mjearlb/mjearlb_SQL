-- Common Table Expressions

-- don't want functions in our WHERE or GROUP BY clauses, causes slow performance
select OrderYear, count(*) as SalesCount
from (
	select year(OrderDate) as OrderYear, SalesOrderID
	from Sales.SalesOrderHeader
	) SalesDetails
where OrderYear = '2012'
group by OrderYear
GO


---------------- SAME THING BELOW ----------------

with SalesDetails 
as (
	select year(OrderDate) as OrderYear, 
	SalesOrderID
	from Sales.SalesOrderHeader
	)

select OrderYear, count(*) as SalesCount
from SalesDetails
where OrderYear = '2012'
group by OrderYear

---------------------------- EXAMPLE FROM PREVIOUS SECTION

select * 
from (
	select 
		BusinessEntityID, 
		NationalIDNumber, 
		year(BirthDate) as BirthYear, 
		year(HireDate) as HireYear
	from HumanResources.Employee
	) as HR_Emp
where HireYear >= 2010
go

-- RECREATE USING CTE's

with HR_Emp
as (
	select 
		BusinessEntityID, 
		NationalIDNumber, 
		year(BirthDate) as BirthYear, 
		year(HireDate) as HireYear
	from HumanResources.Employee
	)

select * 
from HR_Emp
where HireYear >= 2010


-- Want to return for each year
-- totalsales in that year and totals sales from prior year

select 
	SalesCurrentYear.SalesYear, 
	SalesCurrentYear.TotalSales as AnnualSales,
	SalesPriorYear.TotalSales as PriorYearSales
from (
	select 
		year(OrderDate) as SalesYear, 
		sum(TotalDue) as TotalSales
		from Sales.SalesOrderHeader
		group by year(OrderDate)
	) as SalesCurrentYear
left outer join (
	select 
		year(OrderDate) as SalesYear, 
		sum(TotalDue) as TotalSales
		from Sales.SalesOrderHeader
		group by year(OrderDate)
	) as SalesPriorYear
on SalesCurrentYear.SalesYear - 1 = SalesPriorYear.SalesYear
ORDER BY 1
go

-- do it again using CTE's
with SalesByYear 
as (
	select 
		year(OrderDate) as SalesYear, 
		sum(TotalDue) as TotalSales
		from Sales.SalesOrderHeader
		group by year(OrderDate)
	)

select 
	CurrentYearSales.SalesYear,
	CurrentYearSales.TotalSales as AnnualSales, 
	PriorYearSales.TotalSales as PriorYearSales
from SalesByYear CurrentYearSales
left outer join SalesByYear as PriorYearSales
on CurrentYearSales.SalesYear - 1 = PriorYearSales.SalesYear
order by 1

-- the CTE was slightly better! Was able to reference it twice and write it once
-- CTE's can also reference or neswt within themselves

with S1
as (
	select 
		year(OrderDate) as SalesYear, 
		SalesOrderID, 
		TotalDue
	from Sales.SalesOrderHeader
), 
S2 as (
	select
		SalesYear, 
		count(SalesOrderID) as SalesCount, 
		sum(TotalDue) as AnnualSales
	from S1
	group by SalesYear
)

select 
	SalesYear, 
	SalesCount, 
	AnnualSales
from S2 
where SalesCount > 4000
order by 1

-- PRACTICE PROBLEMS

-- 1
WITH Sales
AS (
SELECT YEAR(OrderDate) as OrderYear, TotalDue -- fails without the named year(orderdate)
FROM Sales.SalesOrderHeader
)
SELECT *
FROM Sales
go 

-- 2
with Hires 
as (
	select 
		year(hiredate) as HireYear, 
		BusinessEntityID
	from HumanResources.Employee
), HiresByYear as (
	select 
		HireYear, 
		count(*) as HireCount
	from Hires
	group by HireYear
)

select 
	CurrentYear.HireYear as CurrentYear,
	CurrentYear.HireCount as EmployeesHiredThisYear, 
	PriorYear.HireCount as EmployeesHiredLastYear
from HiresByYear CurrentYear
inner join HiresByYear PriorYear
on CurrentYear.HireYear = PriorYear.HireYear + 1
go

-- 3
with Products
as (
	select 
		year(SellStartDate) as SoldInYear, 
		Name
	from Production.Product
), ProductsByYear as (
	select 
		SoldInYear, 
		count (*) ProductsSold
	from Products
	group by SoldInYear
)

select * 
from ProductsByYear

-- 4
with SalesForYear
as (
	select 
		month(OrderDate) as OrderMonth, 
		count(*) as NumberOfOrders, 
		sum(TotalDue) as MonthlyRevenue
	from Sales.SalesOrderHeader
	where year(OrderDate) = '2012'
	group by month(OrderDate)
)

select 
	OrderMonth, 
	MonthlyRevenue
from SalesForYear
order by 1 asc
go

-- 4 done differently bc instructions were ambiguous
with SalesForYear
as (
	select month(OrderDate) as OrderMonth, TotalDue
	from Sales.SalesOrderHeader
	where year(OrderDate) = '2012'
)

select 
	OrderMonth, 
	sum(totalDue) as Total
from SalesForYear
group by OrderMonth
order by 1 asc
