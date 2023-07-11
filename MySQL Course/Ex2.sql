USE DemoDB; 

SELECT * FROM Employee; 
SELECT FirstName, LastName FROM Employee;
SELECT FirstName, LastName, Salary FROM Employee;
SELECT CONCAT(FirstName , CONCAT(' ', LastName)) AS 'Name' , Salary FROM Employee; 
SELECT DISTINCT Salary FROM Employee; 