--problem 1
SELECT FirstName, LastName
FROM SoftUni.dbo.Employees
WHERE SUBSTRING(FirstName, 1,2)='SA'

--problem 2
SELECT FirstName, LastName
FROM SoftUni.dbo.Employees
WHERE CHARINDEX('EI', LastName)<>0
--problem 3
SELECT FirstName 
FROM SoftUni.dbo.Employees
WHERE DepartmentID IN (3,10)
AND HireDate BETWEEN '19950101' AND '20051231'

--problem 4
SELECT FirstName, LastName
FROM SoftUni.dbo.Employees
WHERE CHARINDEX('engineer', [JobTitle])=0

--problem 8
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
FROM SoftUni.dbo.Employees
WHERE YEAR(HireDate)>2000

--problem 9
SELECT FirstName, LastName
FROM SoftUni.dbo.Employees
WHERE LEN(LastName)=5

--problem 10
SELECT CountryName, IsoCode
FROM Geography.dbo.Countries
WHERE LEN(CountryName)-LEN(REPLACE(CountryName,'A',''))>2

--problem 11
SELECT PeakName, RiverName
FROM Geography.dbo.Peaks

--problem 12
SELECT TOP 50 [Name], FORMAT(Start,'yyyy-MM-dd') AS NewDate
FROM Diablo.dbo.Games
WHERE YEAR(Start) IN (2011, 2012) 
ORDER BY Start, Name

--problem 13
SELECT Username, REPLACE(Email,'@','') as [EmailProvider]
FROM Diablo.dbo.Users 
ORDER BY [EmailProvider], Username

--problem 14
SELECT Username, IpAddress
FROM Diablo.dbo.Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username ASC

--problem 16































SELECT  * FROM SoftUni.dbo.Employees