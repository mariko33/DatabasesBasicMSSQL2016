
--Section 1: Data Definition

CREATE TABLE Towns (
	TownID INT,
	TownName VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY(TownID)
)

CREATE TABLE Airports (
	AirportID INT,
	AirportName VARCHAR(50) NOT NULL,
	TownID INT NOT NULL,
	CONSTRAINT PK_Airports PRIMARY KEY(AirportID),
	CONSTRAINT FK_Airports_Towns FOREIGN KEY(TownID) REFERENCES Towns(TownID)
)

CREATE TABLE Airlines (
	AirlineID INT,
	AirlineName VARCHAR(30) NOT NULL,
	Nationality VARCHAR(30) NOT NULL,
	Rating INT DEFAULT(0),
	CONSTRAINT PK_Airlines PRIMARY KEY(AirlineID)
)

CREATE TABLE Customers (
	CustomerID INT,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Gender VARCHAR(1) NOT NULL CHECK (Gender='M' OR Gender='F'),
	HomeTownID INT NOT NULL,
	CONSTRAINT PK_Customers PRIMARY KEY(CustomerID),
	CONSTRAINT FK_Customers_Towns FOREIGN KEY(HomeTownID) REFERENCES Towns(TownID)
)

INSERT INTO Towns(TownID, TownName)
VALUES
(1, 'Sofia'),
(2, 'Moscow'),
(3, 'Los Angeles'),
(4, 'Athene'),
(5, 'New York')

INSERT INTO Airports(AirportID, AirportName, TownID)
VALUES
(1, 'Sofia International Airport', 1),
(2, 'New York Airport', 5),
(3, 'Royals Airport', 1),
(4, 'Moscow Central Airport', 2)

INSERT INTO Airlines(AirlineID, AirlineName, Nationality, Rating)
VALUES
(1, 'Royal Airline', 'Bulgarian', 200),
(2, 'Russia Airlines', 'Russian', 150),
(3, 'USA Airlines', 'American', 100),
(4, 'Dubai Airlines', 'Arabian', 149),
(5, 'South African Airlines', 'African', 50),
(6, 'Sofia Air', 'Bulgarian', 199),
(7, 'Bad Airlines', 'Bad', 10)

INSERT INTO Customers(CustomerID, FirstName, LastName, DateOfBirth, Gender, HomeTownID)
VALUES
(1, 'Cassidy', 'Isacc', '19971020', 'F', 1),
(2, 'Jonathan', 'Half', '19830322', 'M', 2),
(3, 'Zack', 'Cody', '19890808', 'M', 4),
(4, 'Joseph', 'Priboi', '19500101', 'M', 5),
(5, 'Ivy', 'Indigo', '19931231', 'F', 1)


--task 1.1 Data Insertion
CREATE TABLE Flights(
FlightID INT NOT NULL PRIMARY KEY,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
[Status] VARCHAR(9) NOT NULL CHECK ([Status]='Departing' OR [Status]='Delayed' OR [Status]='Arrived' OR [Status]='Cancelled'),
OriginAirportID INT NOT NULL,
DestinationAirportID INT NOT NULL,
AirlineID INT NOT NULL
CONSTRAINT FK_Flights_Airports_OriginAirportId FOREIGN KEY(OriginAirportID) REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airports_DestinationAirportID FOREIGN KEY(DestinationAirportID) REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airlines FOREIGN KEY(AirlineID) REFERENCES Airlines(AirlineID) 
)


CREATE TABLE Tickets(
TicketID INT NOT NULL PRIMARY KEY,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6) NOT NULL CHECK (Class='First'OR Class='Second' OR Class='Third'),
Seat VARCHAR(5) NOT NULL,
CustomerID INT NOT NULL,
FlightID INT NOT NULL,
CONSTRAINT FK_Tickets_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
CONSTRAINT FK_Tickets_Flights FOREIGN kEY (FlightID) REFERENCES Flights(FlightID) 
)

--task1-DataInsertion   
INSERT INTO Flights(FlightID, DepartureTime, ArrivalTime, Status,OriginAirportID,DestinationAirportID,AirlineID)
VALUES (1, '2016-10-13 06:00 AM', '2016-10-13 10:00 AM','Delayed', 1,4,1),
	   (2,'2016-10-12 12:00 PM','2016-10-12 12:01 PM','Departing',1,1,2),
	   (3, '2016-10-14 03:00 PM','2016-10-20 04:00 AM','Delayed',4,2,4),
	   (4, '2016-10-12 01:24 PM','2016-10-12 4:31 PM','Departing',3,1,3),
	   (5,'2016-10-12 08:11 AM','2016-10-12 11:22 PM','Departing',4,1,1),
	   (6,'1995-06-21 12:30 PM','1995-06-22 08:30 PM','Arrived',2,3,5),
	   (7,'2016-10-12 11:34 PM','2016-10-13 03:00 AM','Departing',2,4,2),
	   (8,'2016-11-11 01:00 PM','2016-11-12 10:00 PM','Delayed',4,3,1),
	   (9,'2015-10-01 12:00 PM','2015-12-01 01:00 AM','Arrived',1,2,1),
	   (10,'2016-10-12 07:30 PM','2016-10-13 12:30 PM','Departing',2,1,7)	
	   
INSERT INTO  Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
VALUES (1, 3000.00,	'First', '233-A',3, 8),
	   (2, 1799.90,	'Second', '123-D', 1, 1),
	   (3, 1200.50,	'Second', '12-Z', 2, 5),
	   (4, 410.68, 'Third',	'45-Q',	2,	8),
	   (5, 560.00,	'Third', '201-R', 4, 6),
	   (6, 2100.00,	'Second', '13-T', 1, 9),
	   (7, 5500.00,	'First', '98-O', 2,	7)


--task 2--UpdateArriveFlights
UPDATE Flights
SET AirlineID=1
WHERE Status='Arrived'

--task 3--Update tikets
UPDATE Tickets
SET Price=Price*1.5
WHERE TicketID =(SELECT TOP 1 t.TicketID
FROM Tickets t
JOIN Flights f ON t.FlightID=f.FlightID
JOIN Airlines a ON f.AirlineID=a.AirlineID
ORDER BY a.Rating DESC
)

--task 4-Table Creation
CREATE TABLE CustomerReviews(
ReviewID INT NOT NULL PRIMARY KEY,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade INT NOT NULL CHECK (ReviewGrade>=0 AND ReviewGrade<=10 ),
AirlineID INT NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT FK_CustomerReviews_Airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
CONSTRAINT FK_CustomerReviews_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE CustomerBankAccounts(
AccountID INT NOT NULL PRIMARY KEY,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL(10,2) NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT FK_CustomerBankAccounts_Customers FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

--task 5 --Fill the new tables with data
INSERT INTO CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
VALUES (1,	'Me is very happy. Me likey this airline. Me good.',10,	1, 1),
	   (2,	'Ja, Ja, Ja… Ja, Gut, Gut, Ja Gut! Sehr Gut!',	10,	1,	4),
	   (3,	'Meh…',	5,	4,	3),
	   (4,	'Well I’ve seen better, but I’ve certainly seen a lot worse…',	7,	3,	5)

INSERT INTO CustomerBankAccounts (AccountID,AccountNumber,Balance,CustomerID)
VALUES (1,	'123456790', 2569.23, 1),
	   (2,	'18ABC23672', 14004568.23,2),
	   (3,	'F0RG0100N3', 19345.20,	5)

-----------------------------------------------------SECTION 3--------------------------------------
--task 1 Extract all ticets
SELECT TicketID,Price,Class,Seat
FROM Tickets
ORDER BY TicketID ASC

--Task 2 Extract All Customers 
SELECT CustomerID,(FirstName+' '+LastName) AS FullName, Gender
FROM Customers
ORDER BY FullName ASC, CustomerID ASC

--Task 3 Extract Delayed Flights 
SELECT FlightID, DepartureTime, ArrivalTime
FROM Flights 
WHERE Status='Delayed'
ORDER BY FlightID ASC

--Task 4 - Extract Top 5 Most Highly Rated Airlines which have any Flights 

SELECT DISTINCT TOP 5  f.AirlineID,a.AirlineName, a.Nationality, a.Rating
FROM Airlines a
RIGHT JOIN Flights f ON f.AirlineID=a.AirlineID
ORDER BY a.Rating DESC, f.AirlineID ASC

--Task 5 Extract all Tickets with price below 5000, for First Class
SELECT t.TicketID,a.AirportName AS Destination, (c.FirstName+' '+c.LastName) AS CustomerName
FROM Tickets t
JOIN Customers c ON c.CustomerID=t.CustomerID
JOIN Flights f ON t.FlightID=f.FlightID
JOIN Airports a ON f.DestinationAirportID=a.AirportID
ORDER BY t.TicketID ASC

--Task 6 Extract all Customers which are departing from their Home Town
SELECT c.CustomerID, (c.FirstName+' '+c.LastName) AS [FullName], t.TownName AS [HomeTown]
FROM Customers c
JOIN Towns t ON c.HomeTownID=t.TownID
WHERE t.TownName IN (SELECT tt.TownName
				 FROM Flights f
				 JOIN Airports a ON f.OriginAirportID=a.AirportID
				 JOIN Towns tt ON a.TownID=tt.TownID)
ORDER BY c.CustomerID ASC

--Task 7 Extract all Customers which will fly

SELECT CustomerID, (FirstName+' '+LastName)AS FullName, DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS Age
FROM Customers
WHERE (SELECT COUNT(t.TicketID)
FROM Customers c
JOIN Tickets t ON t.CustomerID=c.CustomerID
JOIN Flights f ON f.FlightID=t.FlightID
WHERE f.[Status]='Departing')=2 AND DATEDIFF(YEAR, DateOfBirth, GETDATE())>0
ORDER BY Age ASC,CustomerID ASC



--task 8 Extract Top 3 Customers which have Delayed Flights
SELECT TOP 3 c.CustomerID, (c.FirstName+' '+c.LastName) AS FullName, t.Price AS TicketPrice, a.AirportName AS Destination
FROM Customers c
JOIN Tickets t ON t.CustomerID=c.CustomerID
JOIN Flights f ON t.FlightID=f.FlightID
JOIN Airports a ON f.DestinationAirportID=a.AirportID
WHERE f.Status='Delayed'
ORDER BY t.Price DESC, c.CustomerID ASC

--task 9 Extract the Last 5 Flights, which are departing
SELECT TOP 5 f.FlightID, f.DepartureTime AS DepartureTime, f.ArrivalTime AS ArrivelTime, a2.AirportName AS Origin, a1.AirportName AS Destination
FROM Flights f
JOIN Airports a1 ON a1.AirportID=f.DestinationAirportID
JOIN Airports a2 ON a2.AirportID=f.OriginAirportID
WHERE f.Status='Departing'
ORDER BY DepartureTime ASC, FlightID ASC

--task 10 Extract all Customers below 21 years, which have already flew at least once
SELECT c.CustomerID, (c.FirstName+' '+c.LastName) AS FullName, DATEDIFF(YEAR, c.DateOfBirth, GETDATE()) AS Age
FROM Customers c
JOIN Tickets t ON c.CustomerID=t.CustomerID
JOIN Flights f ON t.FlightID=f.FlightID
WHERE DATEDIFF(YEAR, c.DateOfBirth, GETDATE())<21 AND DATEDIFF(YEAR, c.DateOfBirth, GETDATE())>0 AND f.[Status]='Arrived'
ORDER BY Age DESC, c.CustomerID ASC

--task 11 Extract all Airports and the Count of People departing from them
SELECT a.AirportID, a.AirportName, COUNT(t.CustomerID) AS Passengers
FROM Airports a
JOIN Flights f ON f.OriginAirportID=a.AirportID
JOIN Tickets t ON t.FlightID=f.FlightID
WHERE f.Status='Departing'
GROUP BY a.AirportID, a.AirportName
ORDER BY a.AirportID ASC

-------------------------------------------Section 4 -------------------------------------

--task 1 Review Registering Procedure

CREATE PROCEDURE usp_SubmitReview (@CustomerID INT, @ReviewContent VARCHAR(255), @ReviewGrade INT, @AirlineName VARCHAR(30))
AS
BEGIN
DECLARE @AirlineId INT
SET @AirlineId=(SELECT AirlineID
					FROM Airlines
					WHERE AirlineName=@AirlineName
					)
DECLARE @ReviewId INT
SET @ReviewId=(SELECT TOP 1 ReviewID
			  FROM CustomerReviews
			  ORDER BY ReviewID DESC)+1
INSERT INTO CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
VALUES(@ReviewId,@ReviewContent,@ReviewGrade,@AirlineId,@CustomerID)

IF(@AirlineId IS NULL)
BEGIN
	RAISERROR('Airline does not exist',16,1)
	ROLLBACK
END
ELSE
BEGIN
COMMIT
END

END



 


























































































	   
	   















	    























