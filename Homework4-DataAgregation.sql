--problem 1
SELECT  COUNT(*) AS Count
FROM Gringotts.dbo.WizzardDeposits

--problem 2
SELECT  MAX(MagicWandSize) AS LongestMagicWand
FROM Gringotts.dbo.WizzardDeposits

--problem 3
SELECT DepositGroup, MAX(MagicWandSize) AS LongestMagicWand
FROM Gringotts.dbo.WizzardDeposits
GROUP BY DepositGroup

--PROBLEM 5
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM Gringotts.dbo.WizzardDeposits
GROUP BY DepositGroup

--problem 6
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM Gringotts.dbo.WizzardDeposits
WHERE MagicWandCreator='Ollivander family'
GROUP BY DepositGroup

--problem7
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM Gringotts.dbo.WizzardDeposits
WHERE MagicWandCreator='Ollivander family' AND DepositAmount<=150000
GROUP BY DepositGroup
ORDER BY TotalSum DESC

--problem8
SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS MinDepositCharge
FROM Gringotts.dbo.WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup







