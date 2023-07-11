USE DemoDB; 

DROP TABLE Employee; 

CREATE TABLE Employee(
EMPID	INT,
FirstName	VARCHAR(50),
LastName 	VARCHAR(50), 
Salary	NUMERIC(20,2),
CreatedDTTM	DATETIME DEFAULT NOW()
); 
INSERT INTO Employee(EmpID, FirstName, LastName, Salary)
VALUES(1, 'Page', 'McConnell', 1000); 

INSERT INTO Employee
VALUES(2, 'Michael', 'Gordon', 1000, NOW()); 

INSERT INTO Employee(EmpID, FirstName, Salary)
VALUES(3, 'Fish', 1000); 

INSERT INTO Employee(EmpID, FirstName, LastName, Salary)
VALUES(4, 'Fee', NULL, 1000); 

SELECT * FROM Employee;