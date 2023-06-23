/* String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50),
FirstName varchar (50),
LastName varchar (50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

/*Using Trim, LTRIM, RTRIM
*/

Select *
From EmployeeErrors

SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

--Using Replace
SELECT LastName, REPLACE(Lastname, ' - Fired','') AS LastNameFixed
FROM EmployeeErrors


--Using Substring

Select SUBSTRING(FirstName,1,3) 
From EmployeeErrors

Select err.FirstName, dem.FirstName,SUBSTRING(err.FirstName,1,3) serrFirstName, SUBSTRING(dem.FirstName,1,3) sdemfirstname
From EmployeeErrors err
JOIN SQLTutorial..EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


--Using Upper or Lower 

Select FirstName, LOWER(FirstName), UPPER(FirstName)
From EmployeeErrors