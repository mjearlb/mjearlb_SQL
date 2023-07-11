use DemoDB;

drop table UserProfile;
create table UserProfile(
	userProfileID int primary key auto_increment, -- replace unique not null with primary key
	firstName varchar(50) not null, 
    lastName varchar(50) not null, 
    middleName varchar(50), 
    userName varchar(20) unique not null, 
    password varchar(20), 
    email  varchar(100) unique not null, 
    isActive bit not null default 1, 
    isLocked bit not null default 0, 
    createdDTTM datetime not null default now(), 
    lastModifiedDTTM datetime
); 

-- Keys -> which is primary key?
--    userProfileID - usually this is Primary (unique + not null) key. only one per table
--    userName
--    email

desc UserProfile;

-- select * from UserProfile; 