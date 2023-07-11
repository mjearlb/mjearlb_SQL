use `DemoDB`; 
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

update Person set salary = salary * 1.05;

select * from Person; 

drop table Person; 
create table `Person` (
   `name`  char(50) unique,
   `address` char(200) unique not null,
   `dob` date not null -- will not allow null dob values
); 

-- insert into Person values('Nathan', '675 Fly Ave', null); -- will not work, has null dob
insert into Person values('Nathan','675 Fly Ave','2002-02-21'); 
-- insert into `Person`(name, address) values('Claire','555 Bluey Way'); -- also will not work since dob would be null
-- insert into Person values('Nathan','675 Fly Ave','2002-02-21'); -- will not work as we already have a nathan
insert into Person values(null,'45 Gravel Dr','2002-02-21'); -- addr must unique AND not null. dob may be duplicate, and name may be null

select * from Person; 