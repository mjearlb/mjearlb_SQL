use DemoDb; 

drop table Dept; 
drop table Employee;
CREATE TABLE `Dept`(
    `DeptID` INT PRIMARY KEY,
    `Name` VARCHAR(50)
); 
 
CREATE TABLE `Employee`(
    `EmpID` INT PRIMARY KEY,
    `Name` VARCHAR(50),
    `DeptID` INT REFERENCES Dept
); 
 
-- Sample records
-- Department Records
 
INSERT INTO `Dept`
VALUES(101, 'Inventory');
INSERT INTO `Dept`
VALUES(102, 'Sales');
 
-- Employee Records
	
INSERT INTO `Employee`
VALUES(1, 'A', 101);
INSERT INTO `Employee`
VALUES(2, 'B', 102);
INSERT INTO `Employee`
VALUES(3, 'C', NULL);

-- Individual table queries.
SELECT * FROM `Dept`;
SELECT * FROM `Employee`;
	
-- Cartesian product (cross join)
SELECT * FROM `Employee`,`Dept`;
 
-- Cross Join to pick only those records whose DeptID matches.
SELECT * FROM `Employee`, `Dept`
WHERE `Employee`.`DeptID` = `Dept`.`DeptID`;
 
	
-- Query with alias
SELECT * FROM Employee as e, Dept as d
WHERE e.DeptID = d.DeptID;
 
-- Same is achieved through INNER JOIN
SELECT * FROM `Employee` as e
INNER JOIN `Dept` as d ON (e.`DeptID` = d.`DeptID`);