use `DemoDB`; 
drop table Person; 
create table `Person` (
   `name`  char(50),
   `address` char(200),
   `dob` date,
   `ownAHouse` bit default 0
);
 
insert into `Person` values('Supa Mike','123 Street St','1986-01-21', 1);
insert into `Person` values('Nathan','675 Fly Ave','2002-02-21', 1);
insert into `Person` values('Claire','555 Arizona Way','2001-11-21', 0);
insert into `Person` values('Brad','467 Arizona Way','1982-04-21', 1);
insert into `Person` values('King Chuck','601 Arizona Way','1951-03-02', 1);
insert into `Person`(`name`, `address`) values('Badminton Guy','77 Badminton Ave');
insert into `Person` values('Madison', '122 Wanderers Way', '2001-08-22', 0); 
insert into `Person` values('Milo', '421 West Hancock Ave', '2000-09-12', 0); 

select * from Person
order by `dob` desc; 

set SQL_SAFE_UPDATES = 0; 

update Person set ownAHouse = 1; 

update Person set address = '35 Marigold Dr'
where name = 'King Chuck'; 

update Person set dob = '1999-08-14'
where dob is null; -- must use is NOT = for null!!

delete from Person 
where name = 'Brad'; 

truncate table Person; -- not same as delete

select * from Person; 