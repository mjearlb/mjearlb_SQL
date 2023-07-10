select FirstName, LastName
from Sales.vIndividualCustomer
order by 2 desc -- orders by last name

select FirstName, LastName as [last]
from Sales.vIndividualCustomer
order by [last] desc -- orders by last name

select FirstName, LastName as ln
from Sales.vIndividualCustomer
order by ln desc -- orders by last name

select FirstName, LastName as [last]
from Sales.vIndividualCustomer
where [last] = 'Zimmerman' -- will not work as SQL has not yet processed the alias
order by [last] desc -- orders by last name

select FirstName, LastName
from Sales.vIndividualCustomer
order by LastName asc, FirstName desc

select FirstName, LastName, SalesQuota as [sales quota]
from Sales.vSalesPerson
where SalesQuota >= 250
order by [sales quota] desc, 2 desc

-- from practice problems
select FirstName, LastName, JobTitle
from HumanResources.vEmployeeDepartment
order by FirstName asc, LastName desc

select FirstName, LastName, CountryRegionName
from Sales.vIndividualCustomer
where CountryRegionName in('United States', 'France')
order by 3

select Name, AnnualSales, YearOpened, SquareFeet as [Store Size], NumberEmployees as [Total Employees]
from Sales.vStoreWithDemographics
where AnnualSales > 1000000 and NumberEmployees >= 45
order by [Store Size] desc, [Total Employees] desc