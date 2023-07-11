use `DemoDB`; 

drop table `Course`; 
create table `Course` (
	`id` int unique auto_increment, 
    `name` varchar(100) -- instead of char(100), won't make it 100 char's for everyone, just sets a max
); 

insert into `Course`(`name`) values('A');
insert into `Course`(`name`) values('B');

alter table `Course` auto_increment = 100; 

insert into `Course`(`name`) values('C');
insert into `Course`(`name`) values('D');

select * from Course; 

drop table Person; 
create table `Person` (
   `name`  char(50),
   `address` char(200),
   `dob` date,
   `salary`	NUMERIC(10,2),
   `ownsAHouse` bit default 0
);
 
insert into `Person` values('Supa Mike','123 Street St','1986-01-21', 50000, 1);
insert into `Person` values('Nathan','675 Fly Ave','2002-02-21', 45000, 1);
insert into `Person` values('Claire','555 Bluey Way','2001-11-21', 39500, 0);
insert into `Person` values('Brad','467 Bluey Way','1982-04-21', 50000, 1);
insert into `Person` values('King Chuck','35 Marigold Way','1951-03-02', 1000000, 1);
insert into `Person` values('Badminton Guy','77 Badminton Ave', '1999-08-14', 0, 0);
insert into `Person` values('Madison', '122 Wanderers Way', '2001-08-22', 60000, 0); 
insert into `Person` values('Milo', '421 West Hancock Ave', '2000-09-12', 20500, 0); 
insert into Person values('Andrew', '130 Magnolia St', '2000-01-09', 35000, 0);
insert into Person values('Andrew', 'Savannah St', '2000-06-09', 70000, 0);

select * from Person
order by name, dob desc; 