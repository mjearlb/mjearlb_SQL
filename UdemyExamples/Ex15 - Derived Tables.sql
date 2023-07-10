-- using derived tables

select * 
from (
	select BusinessEntityID, FirstName, LastName
	from Person.Person
	) as personName

-- this contains redundancy in evaluating the year function. 
select year(OrderDate) as OrderYear, count(*) as SalesCount
from Sales.SalesOrderHeader
where year(OrderDate) = '2012'
group by year(OrderDate)

-- we dont want to evaluate the year so much, this is faster
select OrderYear, count(*) as SalesCount
from (
	select year(OrderDate) as OrderYear, SalesOrderID
	from Sales.SalesOrderHeader
	) as SalesDetails
where OrderYear = 2012 -- don't need the apostrophes
group by OrderYear

select *
from (
	select 
		BusinessEntityID, 
		NationalIDNumber,
		year(BirthDate) as BirthYear, 
		year(HireDate) as HireDate
	from HumanResources.Employee
	) as HR_Employee
where BirthYear < 1960 and HireDate < 2010

select *
from (
	select 
		BusinessEntityID,
		NationalIDNumber, 
		BirthYear, 
		year(HireDate) as HireYear
	from (
		select 
			BusinessEntityID, 
			NationalIDNumber, 
			year(BirthDate) as BirthYear, 
			HireDate
		from HumanResources.Employee
		) as InnerNested
	where BirthYear < 1966
	) as OuterNested
where HireYear > 2009


-- for each year that we had sales
-- find total sales revenue generated and number of employees hired
select 
	Sales_by_Year.SalesYear, 
	Sales_by_Year.TotalRevenue, 
	coalesce(Hires_by_Year.NewHireCount, 0) as NewHireCount
from (
	select 
		SalesYear, 
		sum(TotalDue) as TotalRevenue
	from (
		select 
			year(OrderDate) as SalesYear, 
			TotalDue
		from Sales.SalesOrderHeader
		) as SalesDetails
	group by SalesYear
	) as Sales_by_Year
left outer join (
	select 
		HireYear, 
		count(BusinessEntityID) as NewHireCount
	from (
		select 
			year(HireDate) as HireYear, 
			BusinessEntityID
		from HumanResources.Employee
		) as EmployeeDetails
	group by HireYear
	) as Hires_by_Year
on Hires_by_Year.HireYear = Sales_by_Year.SalesYear
order by 1

-- PRACTICE PROBLEMS

SELECT *
FROM (
	SELECT 
		P.BusinessEntityID, 
		P.FirstName, 
		P.LastName, 
		YEAR(E.HireDate) as HireYear -- fails without a name
	FROM HumanResources.Employee E
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = E.BusinessEntityID
	) AS EmployeeDetails

SELECT *
FROM (
	SELECT TOP 100 
		P.BusinessEntityID, 
		P.FirstName, 
		P.LastName
	FROM HumanResources.Employee E
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = E.BusinessEntityID
	ORDER BY 1 -- allowed to do order by within only becasue we requested top 100
) AS EmployeeDetails

-- all employees born before 1968 hired after 2012
select * 
from (
	select 
		BusinessEntityID, 
		year(HireDate) as HireYear, 
		year(BirthDate) as BirthYear
	from HumanResources.Employee
	) as EmployeeData
where HireYear >= 2012 and BirthYear <= 1968

-- all sales from 2011 and 2012
select 
	OrderYear, 
	sum(TotalDue)
from (
	select  
		year(OrderDate) as OrderYear, 
		*
	from Sales.SalesOrderHeader
	) as SalesInfo
group by OrderYear
having OrderYear in (2011, 2012) -- could also have done this as a WHERE clause before the GROUP BY 