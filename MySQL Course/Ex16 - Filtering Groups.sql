use DemoDB; 

drop table Student; 
CREATE TABLE `Student` (
    `StudentID` INT PRIMARY KEY AUTO_INCREMENT,
    `Name`      VARCHAR(50),
    `Course`    VARCHAR(10),
    `Score`     NUMERIC(5,2)
); 

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

select avg(Score) as Average from Student
group by Course
having avg(Score) > 75;  -- all class averages over 75

select Course from Student
group by Course
having Count(*) >= 2; -- all courses for which there are at least 2 students