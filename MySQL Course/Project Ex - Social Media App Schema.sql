-- create schema SocialDB default character set 'utf8'; 

use SocialDB; 

-- USER TABLE
drop table PostComment; 
drop table PostLike; 
drop table Post; 
drop table UserConnection; 
drop table UserProfileExt; 
drop table UserProfile; 
create table UserProfile(
	UserProfileID		integer primary key auto_increment, 
    UserName	varchar(20) unique not null,
    Password	varchar(20) not null, 
    Email		varchar(50) unique not null, 
    FirstName	varchar(20) not null, 
    MiddleName	varchar(20), 
    LastName	varchar(20) not null, 
    CreatedDDTM	datetime not null default now(), 
    UpdatedDTTM	datetime, 
    IsDeleted	bit not null default 0
); 

insert into UserProfile(UserName, Password, Email, FirstName, LastName)
values('amappes', 'stashTheGumbo', 'amappes@gmail.com', 'Andrew', 'Mappes');
insert into UserProfile(UserName, Password, Email, FirstName, LastName)
values('mjearlb', 'golgiApparatus', 'mjearlb@gmail.com', 'Milo', 'Bauman');
insert into UserProfile(UserName, Password, Email, FirstName, LastName)
values('mleel', 'henryDog', 'mleel@gmail.com', 'Madison', 'Livingston');
insert into UserProfile(UserName, Password, Email, FirstName, LastName)
values('nastro', 'hatsAreCool', 'nastro@gmail.com', 'Nathan', 'Castro');
insert into UserProfile(UserName, Password, Email, FirstName, LastName)
values('jliv', 'hermesCat', 'jammieliv@gmail.com', 'Jamieson', 'Livingston');

-- UserProfileExt <--- 1 to 1 -----> UserProfile
create table UserProfileExt (
	UserProfileExtID	integer primary key auto_increment, 
    UserProfileID		integer not null, 
    ProfileImage		varchar(100),	-- BLOB = binary large object. can be used for images, but is impractical, so we'll store the link
    Phone				varchar(14), 
    Website				varchar(100), 
    HeadLine			varchar(256), 
    Country				varchar(50), 
    Summary				text,		-- tinytext:255, text: 64k, mediumText: 16mb, longtext: 4gb
    constraint fk_userProfileID foreign key(UserProfileID) references UserProfile(UserProfileID)
); 

insert into UserProfileExt(UserProfileID, ProfileImage, Phone)
values(1, '/storage/1/image.jpg', '(706) 555-0087');

select * from UserProfileExt; 
select * from UserProfile; 
-- only the ones with Ext
select * from UserProfile as u
inner join UserProfileExt as upe on (u.UserProfileID = upe.UserProfileID); 
-- all UP's
select * from UserProfile as u
left join UserProfileExt as upe on (u.UserProfileID = upe.UserProfileID); 

-- User Connections
-- many users get connected to many users
-- many users can follow many users
create table UserConnection (
	UserOne			integer not null, 
    UserTwo			integer not null,
    IsConnection	bit not null, 
    IsFollower		bit not null, 
    ConnectedDTTM	datetime not null default now(), 
    constraint 	fk_userOne_userProfileID foreign key(UserOne) references UserProfile(UserProfileID),
    constraint 	fk_userTwo_userProfileID foreign key(UserTwo) references UserProfile(UserProfileID)
); 

-- a connected with b
-- (a,b) and (b,a)
insert into UserConnection values(1, 2, 1, 0, now()); 
insert into UserConnection values(2, 1, 1, 0, now());

-- (a,c) and (c,a)
insert into UserConnection values(1, 3, 1, 0, now()); 
insert into UserConnection values(3, 1, 1, 0, now());

-- (a,d) d follows a
insert into UserConnection values(1, 4, 0, 1, now());

select * from UserConnection;

-- get connections of a using subqueries
select UserName from UserProfile 
where UserProfileID in (
	select UserTwo from UserConnection
	where UserOne = (
		select UserProfileID from UserProfile
		where UserName = 'amappes')
	and IsConnection = 1 
); 

-- using joins
select UserName from UserProfile as u
inner join UserConnection as uc 
on (u.UserProfileID = uc.UserTwo 
	and uc.UserOne = 1 
	and uc.IsConnection = 1
);

-- retrieve all followers of 'amappes' (includes connections and only followers)
select UserName from UserProfile as u
where UserProfileID in (
	select UserTwo from UserConnection
    where UserOne = (
		select UserProfileID from UserProfile
		where UserName = 'amappes')
	and IsFollower = 1
); 

-- user posts
-- one user, many posts
create table Post (
	PostID		integer primary key auto_increment, 
    Title		varchar(200) not null, 
    Content 	text not null, 
    PostedBy	integer not null, 
	PostedDDTM 	datetime not null default now(),
    constraint fk_postby foreign key(PostedBy) references UserProfile(UserProfileID)
); 

insert into Post(Title, Content, PostedBy)
values('Phish','Gee, I sure do love this band!', 1); 

select * from Post; 

-- one post can have many likes, so it must be a new table
create table PostLike (
	PostLikeID integer primary key auto_increment, 
    PostID		integer not null, 
    LikedBy 	integer not null,
    ActionDTTM	datetime not null default now(), 
    constraint fk_postid foreign key(PostID) references Post(PostID),
    constraint fk_likedby foreign key(LikedBy) references UserProfile(UserProfileID),
    constraint unq_postid_likedby unique(PostID, LikedBy)
); 

insert into PostLike(PostID, LikedBy)
values(1, 2); 
insert into PostLike(PostID, LikedBy)
values(1, 3); 

select * from PostLike; 

-- post comment
-- post can have many comments and each comment can have many replies
create table PostComment (
	PostCommentID		integer primary key auto_increment, 
    PostID				integer not null, 
    CommentForCommentID	integer,
    CommentText			text not null, 
    CommentedBy			integer not null, 
    CommentedDTTM		datetime not null default now(), 
    constraint fk_postid_postcomment foreign key(PostID) references Post(PostID),
    constraint fk_commentedby foreign key(CommentedBy) references UserProfile(UserProfileID), 
    constraint fk_comment_for_comment foreign key(CommentForCommentID) references PostComment(PostCommentID)
); 

insert into PostComment(PostID, CommentText, CommentedBy)
values(1, 'i agree, good post', 2); 
insert into PostComment(PostID, CommentText, CommentedBy)
values(1, 'yeah they are', 3); 

select * from PostComment; 

-- retrieve the posts posted by 'amappes'
select * from Post
where PostedBy = (
	select UserProfileID from UserProfile
    where UserName = 'amappes'
    );
    
    -- retrieve number of likes for that post
select count(*) from PostLike 
where PostID = 1; 