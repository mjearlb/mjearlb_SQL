use DemoDB;

-- foreign keys. for connecting tables together 
-- when it would be impractical to store them in one

-- Create  
 drop table Employee;
 drop table Dept; 
CREATE TABLE `Dept` (
    `DeptID`   INT PRIMARY KEY,
    `Name`     VARCHAR(50),
    `Location` VARCHAR(50)
); 
 
CREATE TABLE `Employee`(
    `EmpID` 	INT PRIMARY KEY,
    `FirstName` VARCHAR(50),
    `LastName`  VARCHAR(50),
    `DeptID` 	INT, -- INT REFERENCES Dept(DeptID),
    `Salary` 	NUMERIC(10,2),
     CONSTRAINT fk_DeptID FOREIGN KEY(`DeptID`) REFERENCES `Dept`(`DeptId`)
); 
 
 
-- Sample Department Records
 
INSERT INTO `Dept`
VALUES(101, 'Inventory', 'Loc1');
 
INSERT INTO `Dept`
VALUES(102, 'Sales', 'Loc2');
 
-- Sample Employee Records
	
INSERT INTO `Employee`
VALUES(1, 'Nathan','Kung', 101, 11000); -- DeptID MUST be valid bc it is foreign key
 
INSERT INTO `Employee`
VALUES(2, 'Claire','Catapult', 102, 12000); 
 
-- NULL value for DeptID is allowed in Employee table
-- because foreign key allows NULL values.
-- If there is a need to restrict NULL values then you 
-- can apply NOT NULL constraint for DeptID column in Employee. 
 
INSERT INTO `Employee`
VALUES(3, 'Supa','Mike', NULL, 21000);
 
INSERT INTO `Employee`
VALUES(4, 'Brad','Barnes', 102, 22000);
 
-- Below insert will fail because 103 is not an existing DeptID
-- in Dept table.
 
INSERT INTO `Employee`
VALUES(5, 'Chad','Stables', 102, 22000); -- changed from 4, ..., 103
 
-- Select
 
SELECT * FROM `Dept`;
SELECT * FROM `Employee`;
 
 
-- While dropping tables or deleting records, we first need to 
-- delete the referencing entries before deleting the referred entries.
-- Hence first Employee then Dept.
 
DROP TABLE `Employee`;
DROP TABLE `Dept`;