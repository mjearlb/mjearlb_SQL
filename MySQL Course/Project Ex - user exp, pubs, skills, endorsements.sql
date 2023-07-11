-- create schema WorkDB default character set 'utf8';
use WorkDB; 

drop table SkillEndorsement; 
drop table Skill; 
drop table Publication; 
drop table Experience; 
create table Experience (
	UserProfileID	integer primary key auto_increment, 
    EmpName			varchar(50) not null,
    CompanyName		varchar(20) not null,
    StartDate		date not null, 
    EndDate			date, 
    JobTitle		varchar(20) not null, 
    JobDesc			text not null
); 

create table Publication (
	UserProfileID	integer not null, 
    PublicationID	integer primary key auto_increment, 
    Url				varchar(100), 
    PublishedDate	date, 
    Title			varchar(50), 
    PubDesc			text, 
    constraint 		fk_userprofileid_pub foreign key(UserProfileID) references Experience(UserProfileID)
);

create table Skill (
	SkillID			integer primary key auto_increment, 
	UserProfileID	integer not null, 
    SkillName		varchar(20) not null, 
    constraint 		fk_userprofileid_skill foreign key(UserProfileID) references Experience(UserProfileID)
); 
create table SkillEndorsement (
	SkillID			integer, 
    EndorsedBy 		varchar(50), 
    constraint		fk_skillid foreign key(SkillID) references Skill(SkillID)
); 

-- Andrew Mappes
insert into Experience(EmpName, CompanyName, StartDate, JobTitle, JobDesc)
values('Andrew Mappes', 'InGen', curdate(), 'Dino-Sitter', 'Watches the smaller baby dinosaurs'); 
insert into Publication(UserProfileID, Url, PublishedDate, Title, PubDesc)
values(1, 'www.ingen.com/amappes/0/publications/pg1/How-To-Feed-A-Velociraptor', curdate(), 'How to Feed a Velociraptor', 'Describes feeding methods for baby velociraptors.'); 
insert into Skill(UserProfileID, SkillName)
values(1, 'Dinosaur Infant Care'); 
insert into Skill(UserProfileID, SkillName)
values(1, 'Music');
insert into SkillEndorsement(SkillID, EndorsedBy)
values(1, 'John Hammond'); 
insert into SkillEndorsement(SkillID, EndorsedBy)
values(2, 'Milo Bauman'); 

-- Nathan Castro
insert into Experience(EmpName, CompanyName, StartDate, JobTitle, JobDesc)
values('Nathan Castro', 'Pan-Am', curdate(), 'Pilot', 'Flies airplanes'); 
insert into Publication(UserProfileID, Url, PublishedDate, Title, PubDesc)
values(2, 'www.panam.com/nastro/0/publications/pg1/How-To-Fly-A-Plane', curdate(), 'How to Fly a Plane', 'Describes how to fly a plane.'); 
insert into Skill(UserProfileID, SkillName)
values(2, 'Flying Planes'); 
insert into SkillEndorsement(SkillID, EndorsedBy)
values(3, 'Amelia Earhart'); 
insert into SkillEndorsement(SkillID, EndorsedBy)
values(3, 'Jeff Mangum'); 

select * from Experience; 
select * from Publication; 
select * from Skill; 
select * from SkillEndorsement; 

select e.EmpName as Name, count(s.SkillName) as Skills, count(se.EndorsedBy) as Endorsements, count(p.PublicationID) as Publications from Experience as e
inner join Skill as s 
	on (s.UserProfileID = e.UserProfileID)
inner join SkillEndorsement as se
	on (s.SkillID = se.SkillID
    and s.UserProfileID = e.UserProfileID)
inner join Publication as p
	on (e.UserProfileID = p.UserProfileID)
    group by e.UserProfileID
;

select s.SkillName, e.EmpName from Skill as s
inner join Experience as e
	on (s.UserProfileID = e.UserProfileID); 