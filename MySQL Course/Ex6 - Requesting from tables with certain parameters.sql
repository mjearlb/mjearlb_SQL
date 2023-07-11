use `DemoDB`; 
drop table Person; 
create table `Person` (
   `name`  char(50),
   `address` char(200),
   `dob` date,
   `ownAHouse` bit default 0
);
 
insert into `Person` values('Mike','123 Street St','1980-01-21', 1);
insert into `Person` values('Nathan','675 Fly Ave','2001-02-21', 1);
insert into `Person` values('Claire','555 Arizona Way','2001-03-21', 0);
insert into `Person` values('Brad','467 Arizona Way','1981-04-21', 1);
insert into `Person` values('King Chuck','601 Arizona Way','1951-03-02', 1);
insert into `Person`(`name`, `address`) values('Badminton Guy','77 Badminton Ave');
 
 select * from Person; 
 
 select * from Person
 where name = 'Nathan';
 
 select * from Person
 where name like 'B%'; -- any number of characters
 
 select * from Person
 where name like 'A_'; -- One more character only
 
 select * from Person 
 where name like '_a%'; -- has one charcter before, anything after
 
 select * from Person
 where address = '675 Fly Ave' or address = '555 Arizona Way';
 
 select * from person 
 where address in ('467 Arizona Way', '555 Arizona Way');
 
select * from person 
 where address not in ('467 Arizona Way', '601 Arizona Way');
 
 select * from Person 
 where dob between '1980-01-21' and '2001-03-21'; 
 
 select * from Person 
 where ownAHouse = 1 and Month(dob) = 3; -- born in march and owns house