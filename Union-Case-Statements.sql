/*Union, Union All*/

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

Insert into SQLTutorial.dbo.EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

CREATE TABLE SQLtutorial.dbo.WareHouseEmployeeDemographics
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics


INSERT INTO SQLTutorial.dbo.WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = 
	WareHouseEmployeeDemographics.EmployeeID


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics

/*This Will keep the duplicate data, if you use union all*/
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

/* This would not work because the columns are not the same, you should only use union if the columns have the same data*/
SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID,JobTitle,Salary
FROM SQLTutorial.dbo.EmployeeSalary

/* Case Statements below*/

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'OLD'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age DESC

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN Jobtitle = 'Salesman' THEN Salary *1.10
	WHEN Jobtitle = 'Accountant' THEN Salary *1.05
	ELSE Salary *1.03
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID