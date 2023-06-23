/* Stores Procedures
*/

CREATE PROCEDURE Test
AS
SELECT *
FROM EmployeeDemographics

EXEC Test

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_Employee (
 Jobtitle varchar(100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )
 INSERT INTO #temp_Employee
 SELECT JobTitle, COUNT(JobTitle), AVG(age), AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics AS emp
JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee

EXEC Temp_Employee @jobtitle = 'Salesman'