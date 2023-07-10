-- date functions

select getdate()

select sysdatetime()

-- date diff
select datediff(year, '7/1/1927', '5/14/1929')

select datediff(mm, '7/19/1990', '6/14/1992') -- can use MONTH or MM

select datediff(hour, '12/3/1983', '12/31/1995')

select datediff(second, '12/31/1995 19:30:00', '1/1/1996 1:00:00')

-- date add
select dateadd(day, 30, '4/12/99')

select dateadd(day, 30, getdate())

select dateadd(wk, -3, '11/27/1995') -- can also use week

-- practice problems
select datepart(month, '6/12/2001'), -- these do the same thing
	month('6/12/2011')


select datepart(year, '11/20/1992'), 
	year('11/20/1992')

select dateadd(day, -74, getdate())

select getdate(), sysdatetime(), getutcdate()

select datediff(day, '4/17/1996', '9/4/2001')

select datediff(month, '12/25/1993', dateadd(day, -2719, getdate()))
