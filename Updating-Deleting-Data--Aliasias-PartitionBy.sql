/* Having clause*/

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)


/*Updating/Deleting Data */

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
ORDER BY EmployeeID

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1002


/* Aliasing */

SELECT FirstName + ' '+LastName AS Fullname
FROM SQLTutorial.dbo.EmployeeDemographics


SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
LEFT JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics AS Ware
	On Demo.EmployeeID = Ware.EmployeeID


/*Partition By* - often compared to the Group by Statement.
However, group by statement actually reduces the number of rows whereas the partition statement does not */


SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT * 
FROM SQLTutorial.dbo.EmployeeSalary

SELECT FirstName, LastName, Gender, Salary,
	COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
LEFT JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
LEFT JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary