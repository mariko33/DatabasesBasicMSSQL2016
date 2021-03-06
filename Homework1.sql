/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[Name]
      ,[Picture]
      ,[Height]
      ,[Weight]
      ,[Gender]
      ,[Birthday]
      ,[Biograhy]
  FROM [Minions].[dbo].[People]

  --problem8
  --CREATE TABLE Users
  --(Id DECIMAL NOT NULL PRIMARY KEY CHECK(Id<POWER(2,62)) IDENTITY,
  --Username VARCHAR(30) NOT NULL UNIQUE,
  --Password VARCHAR(26) NOT NULL,
  --ProfilePicture VARBINARY,
  --LastLongTime DATETIME,
  --isDeleted BIT CHECK(isDeleted='true' OR isDeleted='false')
  --)

   CREATE TABLE Users
  (Id DECIMAL NOT NULL PRIMARY KEY  IDENTITY,
  Username VARCHAR(30) NOT NULL UNIQUE,
  Password VARCHAR(26) NOT NULL,
  ProfilePicture VARBINARY,
  LastLongTime DATETIME,
  isDeleted BIT CHECK(isDeleted='true' OR isDeleted='false')
  )



  INSERT INTO [dbo].[Users] (Username, Password, LastLongTime, isDeleted )
  VALUES ('MihailPetrov', '12345', '20160901','false'),
         ('MayaDimitrova','12345', '20160902','false'),
		 ('KirilAsenov', '12345','20160903','true')

		 -------------------------------------------------------------
--PROBLEM 9 Drop Primary key 

ALTER TABLE [dbo].[Users]
DROP CONSTRAINT [PK__Users__3214EC07FAE7BDB0]

ALTER TABLE [dbo].[Users]
ADD CONSTRAINT pk_IdName PRIMARY KEY(Id,Username)

-------------------------------------------------

--Prblem 10 Add check constarint
ALTER TABLE [dbo].[Users]
ADD CHECK (DATALENGTH(Password)>4)

INSERT INTO [dbo].Users (Username,Password)
VALUES('Mis','12345')
-----------------------------------

--Problem 11 Set Default value of a Field
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT DF_lastLong DEFAULT (GETDATE()) FOR LastLongTime

-------------------------------------------------------
--Problem 12 Set Unique Field
ALTER TABLE [dbo].[Users]
DROP CONSTRAINT  [pk_IdName]

ALTER TABLE [dbo].[Users]
ADD CONSTRAINT PK_Id PRIMARY KEY (Id)

ALTER TABLE [dbo].[Users]
ADD UNIQUE (Username)

ALTER TABLE [dbo].[Users]
ADD CHECK (DATALENGTH(Username)>2) 

-----------------------------------
--Problem 13
CREATE DATABASE Movies

USE Movies
CREATE TABLE Directors
(Id INT NOT NULL PRIMARY KEY IDENTITY,
DirectorName VARCHAR(50) NOT NULL,
Notes VARCHAR(50)
)

CREATE TABLE Genres
(Id INT NOT NULL PRIMARY KEY IDENTITY,
GenreName VARCHAR(50) NOT NULL,
Notes VARCHAR(50)
)

CREATE TABLE Categories
(Id INT NOT NULL PRIMARY KEY IDENTITY,
CategoryName VARCHAR(50) NOT NULL,
Notes VARCHAR(50)
)

CREATE TABLE Movies
(Id INT NOT NULL PRIMARY KEY IDENTITY,
Title VARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear DATE NOT NULL,
Length INT,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating INT,
Notes VARCHAR(50)
)

INSERT INTO Directors
VALUES ()


INSERT INTO Genre
VALUES ('Adventure','Adventure Films are exciting stories, with new experiences or exotic locales'),
	('Comedy','Comedy Films are make em laugh films designed to elicit laughter from the audience'),
	('Drama', 'Drama Films are serious presentations or stories with settings or life situations that portray realistic characters in conflict with either themselves, others, or forces of nature.' ),
	('Crime'),
	('Historical')

INSERT INTO Categories
VALUES ()
--------------------------------
--Problem 14
CREATE DATABASE CarRental

CREATE TABLE Categories
(Id INT NOT NULL PRIMARY KEY IDENTITY,
Category VARCHAR(50) NOT NULL,
DalyRate DECIMAL NOT NULL,
WiklyRate DECIMAL NOT NULL,
MountlyRate DECIMAL NOT NULL,
WeekendRate DECIMAL NOT NULL
)
---------------------------------------------
--Problem 16 Create SoftUni Database

CREATE DATABASE SoftUni
USE SoftUni
CREATE TABLE Towns
(Id INT NOT NULL PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

CREATE TABLE Addresses
(Id INT NOT NULL PRIMARY KEY IDENTITY,
AddressText VARCHAR(50) NOT NULL,
TownId INT NOT NULL FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments
(Id INT NOT NULL PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

CREATE TABLE Employees
(Id INT NOT NULL PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
MiddleName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
JobTitle VARCHAR(50) NOT NULL,
DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments(Id),
HireDate DATETIME,
Salary DECIMAL,
AddressId INT NOT NULL FOREIGN KEY REFERENCES Addresses(Id) 
)
------------------------------------------------
--Problem 18
INSERT INTO SoftUni.dbo.Towns
VALUES('Sofia'),
	('Plovdiv'),
	('Varna'),
	('Burgas')


INSERT INTO SoftUni.dbo.Departments (Name)
VALUES ('Engineering'),
	   (' Sales'),
	   ('Marketing'),
	   ('Software Development'),
	   ('Quality Assurance')	

INSERT INTO SoftUni.dbo.Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '20130201', 3500.00, 1),
	  ('Petar', 'Petrov', 'Petrov',	'Senior Engineer',	1,	'20040302',	4000.00, 2),
	  ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '20160828', 525.25, 3),
	  ('Georgi', 'Teziev', 'Ivanov',	'CEO',	2, '20071209', 3000.00, 1),
	  ('Peter', 'Pan', 'Pan',	'Intern',	3,	'20160828', 599.88, 2) 


SELECT * FROM [SoftUni].[dbo].Addresses

SELECT [Name] FROM Towns
ORDER BY Name

SELECT [Name] FROM Departments
ORDER BY Name

SELECT [FirstName], [LastName], [JobTitle], [Salary] FROM Employees
ORDER BY Salary DESC




