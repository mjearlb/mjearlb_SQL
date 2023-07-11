USE DemoDB; 

CREATE TABLE UserProfile(
	ProfileID	INT, 
    FirstName	VARCHAR(50), 
    LastName	VARCHAR(50), 
    email		VARCHAR(50)
); 

CREATE TABLE Contact(
	ContactID	INT, 
	FirstName	VARCHAR(50), 
    LastName	VARCHAR(50), 
    email		VARCHAR(50)
); 

INSERT INTO UserProfile VALUES(1, 'Page', 'McConnell', 'pianoman64@hotmail.com'); 
INSERT INTO UserProfile VALUES(2, 'Trey', 'Anastasio', 'lordofthestrings@gmail.com'); 
INSERT INTO UserProfile VALUES(3, 'Jon', 'Fishman', 'octopusman@gmail.com');

SELECT * FROM UserProfile; 

SELECT * FROM Contact; 

INSERT INTO Contact
SELECT * FROM UserProfile; 