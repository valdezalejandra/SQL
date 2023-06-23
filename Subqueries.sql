/* Subqueries (in the select, from, and Where Statement
*/

SELECT *
FROM EmployeeSalary


--Subquery in Select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

--How to do it with Partition By

SELECT EmployeeID, Salary, AVG(Salary) over() AS ALLAvgSalary
FROM EmployeeSalary

--Subquery in FROM

SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
	FROM EmployeeSalary) AS a


--Subquery in WHERE

SELECT EmployeeID, Jobtitle, Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE AGE > 30)
