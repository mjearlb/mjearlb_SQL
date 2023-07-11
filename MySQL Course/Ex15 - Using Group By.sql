use DemoDb; 
drop table Student; 

CREATE TABLE `Student` (
    `StudentID` INT PRIMARY KEY AUTO_INCREMENT,
    `Name`      VARCHAR(50),
    `Course`    VARCHAR(10),
    `Score`     NUMERIC(5,2)
); 
 
-- Sample Data
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('Alfred', 'CS', 80);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('Nathan', 'CS', 60);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('Tom', 'IT', 70);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('Claire', 'IT', 85);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('Abby', 'ECE', 88);
 
-- Basic Query
 
SELECT * FROM `Student`;
 
-- Get total score here SUM operates on entire table i.e. all scores are added.
 
SELECT SUM(`Score`) AS `Total Score` FROM `Student`;
 
-- But when used with GROUP BY these operations are applied 
-- for each group(all equal values for selected attributes e.g. Course here
-- will form a group).
-- Displays the Total Score, Average Score, Minimum, Maximum score for each Course.
 
SELECT
    `Course`,
    SUM(`Score`) AS `Total Score`,
    AVG(`Score`) AS `Average`,
    MIN(`Score`) AS `Minimum`,
    MAX(`Score`) AS `Maximum`
FROM `Student`
GROUP BY `Course`;
 
 
-- Below query is invalid, as non group by column Name is used in the display 
-- column list. 
 
SELECT
    `Name`,
    `Course`,
    SUM(`Score`) AS `Total Score`
FROM `Student`
GROUP BY `Course`;