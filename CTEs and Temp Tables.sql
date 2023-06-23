/* CTEs - Common Table Expression - acts very much like a subquery*/

WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
, AVG(Salary) OVER (PARTITION BY Salary) AS AVGSalary
FROM SQLTutorial.dbo.EmployeeDemographics AS emp
JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON emp.EmployeeID = Sal.EmployeeID
WHERE Salary > '45000'
)

SELECT * 
FROM CTE_Employee

/*
You can only run a CTE table by running the entire query, it will not work if you just do the select statement because the table is not saved in a database
Also you have to run the select statement right after the query for it work

Temp Tables
 only work if the temp tables are in session or query window specific. If you close your current session the table will not be there as you expect a regular table to be there

 */
 
 CREATE TABLE #temp_Employee(
 EmployeeID int,
 JobTitle varchar(100),
 Salary Int
 )

 SELECT *
 FROM #temp_Employee

 INSERT INTO #temp_Employee VALUES (
 '1001', 'HR', '45000'
 )

 INSERT INTO #temp_Employee 
 SELECT *
 FROM SQLTutorial..EmployeeSalary

 /*Example 2*/
 DROP TABLE IF EXISTS #temp_Employee2
 CREATE TABLE #temp_Employee2 (
 Jobtitle varchar(50),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )

 INSERT INTO #temp_Employee2
 SELECT JobTitle, COUNT(JobTitle), AVG(age), AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics AS emp
JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

 SELECT *
 FROM #temp_Employee2