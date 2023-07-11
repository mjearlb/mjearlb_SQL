use `DemoDB`;
 
-- Table 
 
create table `Person` (
   `name`  char(50),
   `address` char(200),
   `dob` date,
   `ownAHouse` bit default 0
);
 
-- Sample Records
 
insert into `Person` values('Mike','123 Street St','1980-01-21', 1);
insert into `Person` values('Nathan','675 Fly Ave','2001-02-21', 1);
insert into `Person` values('Claire','555 Arizona Way','2001-03-21', 0);
insert into `Person` values('Brad','467  Arizona Way','1981-04-21', 0);
insert into `Person`(`name`, `address`) values('Badminton Guy','77 Badminton Ave');
 
-- Displays the records from the Person table
-- There are not ordered, remember it is not even 
-- insertion order, database never guarantees insertion 
-- order.
 
select * from `Person`;
 
-- Order by DOB in descending order.
 
select * from `Person`
order by `dob` desc;
 
-- Order by DOB in ascending(default) order.
 
select * from `Person`
order by `dob`;
 
-- Order by ownAHouse, then for equal values of 
-- ownAHouse, order by DOB. 
-- Think about language dictionary, words are arranged 
-- using first alphabet and with in second alphabet and so on.
 
select * from `Person`
order by `ownAHouse`, `dob`;
 
-- Order by descending order of ownAHouse and ascending order or dob.
 
select * from `Person`
order by `ownAHouse` desc, `dob`;
 
-- Order by 4th display column 
-- [note - it depends on column list in the select command]
 
select * from `Person`
order by 4;
 
-- Order by 2nd display column i.e. dob.
 
select `address`, `dob` from `Person`
order by 2;