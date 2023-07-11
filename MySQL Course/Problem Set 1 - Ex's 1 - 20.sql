USE `DemoDB`;
 
 drop table Student; 
 drop table Grade; 
CREATE TABLE `Student`(
  `id`    INT PRIMARY KEY AUTO_INCREMENT,
  `name`  VARCHAR(10) NOT NULL,
  `score` INT NOT NULL);
   
   
CREATE TABLE `Grade`(
    `start`  INT NOT NULL,
    `end`    INT NOT NULL,
    `grade`  CHAR(1)
);
   
insert into `Student`(`name`, `score`) values('student1', 72); 
insert into `Student`(`name`, `score`) values('student2', 61); 
insert into `Student`(`name`, `score`) values('student3', 92); 
insert into `Student`(`name`, `score`) values('student4', 67); 
insert into `Student`(`name`, `score`) values('student5', 24); 
 
-- start and end inclusive for grade.
insert into `Grade` values(40, 60, 'D');
insert into `Grade` values(61, 70, 'C');
insert into `Grade` values(71, 80, 'B');
insert into `Grade` values(81, 100, 'A');

select * from Student; 
select * from Grade; 

-- all student info and their grades
select s.*, g.grade from Student as s
inner join Grade as g on (s.score < g.end and s.score > g.start); 
-- all students with C's
select s.name, s.score from Student as s 
inner join Grade as g on (s.score < g.end and s.score > g.start and g.grade = 'C'); 
-- students who did not recieve a grade
select s.name from Student as s
where (s.score <= 40); 
-- Ave, Min, & Max of students' scores
select avg(score) as Average, min(score) as Minimum, max(score) as Maximum from Student; 