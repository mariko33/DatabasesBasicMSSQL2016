--problem 2
SELECT * FROM [SoftUni].[dbo].[Departments]

--problem 3
SELECT [Name] FROM SoftUni.dbo.Departments

--problem 4
SELECT FirstName, LastName, Salary
FROM SoftUni.dbo.Employees

--problem 5

SELECT FirstName, MiddleName, LastName
FROM SoftUni.dbo.Employees

--problem 6

SELECT CONCAT(FirstName,'.',LastName,'@','softuni.bg') AS [Full Email Address]
FROM SoftUni.dbo.Employees

--problem 7

SELECT DISTINCT Salary
FROM SoftUni.dbo.Employees

--problem 8
SELECT *
FROM SoftUni.dbo.Employees
WHERE [JobTitle]='Sales Representative'

--problem 9
SELECT FirstName, LastName, JobTitle
FROM SoftUni.dbo.Employees
WHERE Salary BETWEEN 20000 AND 30000

--problem 10
SELECT (FirstName+' '+MiddleName+' '+LastName) AS [Full Name] 
FROM SoftUni.dbo.Employees
WHERE Salary=25000
	OR Salary=14000
	OR Salary=12500
	OR Salary=23600

--problem 11

SELECT FirstName,LastName 
FROM SoftUni.dbo.Employees
WHERE ManagerID IS NULL

SELECT FirstName, LastName, Salary
FROM SoftUni.dbo.Employees
WHERE Salary>50000
ORDER BY Salary DESC

--problem 15
SELECT *
FROM SoftUni.dbo.Employees
ORDER BY Salary DESC,
FirstName ASC,
LastName DESC,
MiddleName ASC

--problem 16
CREATE VIEW  [V_EmployeesSalaries] 
AS 
SELECT FirstName, LastName, Salary
FROM SoftUni.dbo.Employees

--problem 17

CREATE VIEW V_EmployeeNameJobTitle AS
SELECT CONCAT(FirstName,' ', MiddleName,' ', LastName) AS [Full Name],JobTitle
FROM SoftUni.dbo.Employees

SELECT * FROM V_EmployeeNameJobTitle

DROP VIEW V_EmployeeNameJobTitle

--problem 18
SELECT DISTINCT JobTitle
FROM SoftUni.dbo.Employees

--problem 19
SELECT  TOP 10 *
FROM SoftUni.dbo.Projects
ORDER BY StartDate ASC,
[Name]

--problem 20

SELECT TOP 7 FirstName, LastName, HireDate
FROM SoftUni.dbo.Employees
ORDER BY HireDate DESC

--problem 21
UPDATE SoftUni.dbo.Employees
SET Salary*=1.12
WHERE DepartmentId IN (1, 2, 4, 11)
SELECT Salary
FROM SoftUni.dbo.Employees

SELECT * FROM SoftUni.dbo.Employees

SELECT TOP 30 CountryName, [Population]
FROM Geography.dbo.Countries
ORDER BY Population] DESC, CountryName ASC

SELECT *
FROM Geography.dbo.Countries

SELECT TOP 30 CountryName, Population 
FROM  Geography.dbo.Countries
WHERE ContinentCode='EU'
ORDER BY Population DESC, CountryName

--problem 24
SELECT CountryName, CountryCode,
CASE 
WHEN CurrencyCode='EUR' THEN 'Euro'
ELSE 'Not Euro'
END AS 'Currency'
FROM Geography.dbo.Countries
ORDER BY CountryName ASC

















SELECT * FROM SoftUni.dbo.Departments










