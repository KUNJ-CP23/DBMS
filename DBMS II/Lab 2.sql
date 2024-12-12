--LAB-2 (Stored Procedure)

-- Create Department Table 

CREATE TABLE Department ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE 
); 

-- Create Designation Table 

CREATE TABLE Designation ( 
DesignationID INT PRIMARY KEY, 
DesignationName VARCHAR(100) NOT NULL UNIQUE 
); 

-- Create Person Table 

CREATE TABLE Person ( 
PersonID INT PRIMARY KEY IDENTITY(101,1), 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8, 2) NOT NULL, 
JoiningDate DATETIME NOT NULL, 
DepartmentID INT NULL, 
DesignationID INT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID) 
); 

--------------------------Part – A-------------------------- 

--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.

------------------DEPARTMENT---------------

--INSERT
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
@DEPTID INT,
@DEPTNAME VARCHAR(100)
AS 
	BEGIN 
		INSERT INTO Department (DepartmentID, DepartmentName)
		VALUES (@DEPTID, @DEPTNAME)
	END

EXEC PR_DEPARTMENT_INSERT 1,'ADMIN'
EXEC PR_DEPARTMENT_INSERT 2,'IT'
EXEC PR_DEPARTMENT_INSERT 3,'HR'
EXEC PR_DEPARTMENT_INSERT 4,'ACCOUNT'

SELECT * FROM Department

--UPDATE 

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_UPDATE
@DeptID INT,
@DeptName VARCHAR(100)
AS
	BEGIN
		UPDATE DEPARTMENT
		SET DepartmentName = @DeptName
		WHERE DepartmentID = @DeptID
	END

--DELETE

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DELETE
@DeptID INT
AS
	BEGIN
		DELETE FROM DEPARTMENT
		WHERE DepartmentID = @DeptID
	END

------------------DESIGNATION-----------------

--INSERT
CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT
@DESID INT,
@DESNAME VARCHAR(100)
AS 
	BEGIN 
		INSERT INTO Designation(DesignationID, DesignationName)
		VALUES (@DESID, @DESNAME)
	END

EXEC PR_DESIGNATION_INSERT 11,'JOBBER'
EXEC PR_DESIGNATION_INSERT 12,'WELDER'
EXEC PR_DESIGNATION_INSERT 13,'CLERK'
EXEC PR_DESIGNATION_INSERT 14,'MANAGER'
EXEC PR_DESIGNATION_INSERT 15,'CEO'

SELECT * FROM Designation

--UPDATE

CREATE OR ALTER PROCEDURE PR_DESIGNATION_UPDATE
@DesID INT,
@DesName VARCHAR(100)
AS
	BEGIN
		UPDATE DESIGNATION
		SET DesignationName = @DesName
		WHERE DesignationID = @DesID
	END

--DELETE

CREATE OR ALTER PROCEDURE PR_DESIGNATION_DELETE
@DesID INT
AS
	BEGIN
		DELETE FROM DESIGNATION
		WHERE DesignationID = @DesID
	END

-------------------------PERSON-----------------------

--INSERT
CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
@FNAME VARCHAR(100),
@LNAME VARCHAR(100),
@SALARY DECIMAL(8,2),
@JDATE DATETIME,
@DEPTID INT,
@DESID INT
AS 
	BEGIN 
		INSERT INTO Person(FirstName, LastName, Salary,JoiningDate,DepartmentID,DesignationID)
		VALUES (@FNAME, @LNAME,@SALARY,@JDATE, @DEPTID, @DESID)
	END
 
EXEC PR_PERSON_INSERT 'Rahul','Anshu',56000,'1990-01-01',1,12
EXEC PR_PERSON_INSERT 'Hardik','Hinsu',18000,'1990-09-025',2,11
EXEC PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
EXEC PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13
EXEC PR_PERSON_INSERT 'Rohit','Rajgor',17000,'1990-07-23',2,15
EXEC PR_PERSON_INSERT 'Priya','Mehta',25000,'1990-10-18',2,NULL
EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15 

SELECT * FROM PERSON

--UPDATE 

CREATE OR ALTER PROCEDURE PR_PERSON_UPDATE
@PerID INT,
@FName VARCHAR(100),
@LName VARCHAR(100)
AS
	BEGIN
		UPDATE PERSON
		SET FirstName = @FName , LastName = @LName
		WHERE PersonID = @PerID
	END

--DELETE
CREATE OR ALTER PROCEDURE PR_PERSON_DELETE
@PerID INT
AS
	BEGIN
		DELETE FROM PERSON
		WHERE PersonID = @PerID
	END

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 

--DEPARTMENT_SELECTBY_PK
CREATE OR ALTER PROC PR_DEPARTMENT_SELECTBY_PK
@DeptId INT
AS 
	BEGIN 
		SELECT * FROM DEPARTMENT
		WHERE DepartmentID = @DeptId
	END

EXEC PR_DEPARTMENT_SELECTBY_PK 1

-- DESIGNATION_SELECTBY_PRIMARYKEY
CREATE OR ALTER PROCEDURE PR_DESIGNATION_SELECTBY_PK
@DesID INT
AS
	BEGIN
		SELECT * FROM DESIGNATION
		WHERE DesignationID = @DesID
	END

EXEC PR_DESIGNATION_SELECTBY_PK 11

-- PERSON_SELECTBY_PRIMARYKEY
CREATE OR ALTER PROCEDURE PR_PERSON_SELECTBY_PK
@PerID INT
AS
	BEGIN
		SELECT * FROM PERSON
		WHERE PersonID = @PerID
	END

EXEC PR_PERSON_SELECTBY_PK 101

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list) 

-- DEPARTMENT_SELECTALL
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_SELECTALL
AS
BEGIN
	SELECT * FROM DEPARTMENT
END

EXEC PR_DEPARTMENT_SELECTALL

-- DESIGNATION_SELECTALL
CREATE OR ALTER PROCEDURE PR_DESIGNATION_SELECTALL
AS
BEGIN
	SELECT * FROM DESIGNATION
END

EXEC PR_DESIGNATION_SELECTALL

--PERSON_SELECTALL
CREATE OR ALTER PROCEDURE PR_PERSON_SELECTALL
AS
BEGIN
	SELECT P.PersonID , P.FirstName , P.LastName , P.Salary , P.JoiningDate , 
		   D.DepartmentName , DE.DesignationName
	FROM PERSON P
	JOIN Department D 
	ON P.DepartmentID = D.DepartmentID
	JOIN DESIGNATION DE
	ON P.DesignationID = DE.DesignationID
END

EXEC PR_PERSON_SELECTALL

--4. Create a Procedure that shows details of the first 3 persons. 
CREATE OR ALTER PROCEDURE PR_PERSON_TOP3
AS
BEGIN
	SELECT TOP 3 * 
	FROM PERSON
END

EXEC PR_PERSON_TOP3


-------------------------------Part – B-------------------------------- 

--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department. 
CREATE OR ALTER PROCEDURE PR_PD_DETAIL
@DEPTNAME VARCHAR(100)
AS
BEGIN
	SELECT P.FirstName , D.DepartmentName
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID
	WHERE D.DepartmentName = @DeptName
END

EXEC PR_PD_DETAIL 'HR'

--6. Create Procedure that takes department name & designation name as input and returns a table with 
--worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_DEPD_DETAIL
@DEPTNAME VARCHAR(100),
@DESNAME VARCHAR(100)
AS
BEGIN
	SELECT P.Salary , P.JoiningDate , D.DepartmentName
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID
	JOIN DESIGNATION DE
	ON P.DesignationID = DE.DesignationID
	WHERE D.DepartmentName = @DeptName 
	AND DE.DesignationName = @DesName
END

EXEC PR_DEPD_DETAIL 'ADMIN','CLERK'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the 
--worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_PERSON_DETAIL
@FName VARCHAR(100)
AS
BEGIN
	SELECT P.* , D.DepartmentName , DE.DesignationName
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID
	JOIN DESIGNATION DE
	ON P.DesignationID = DE.DesignationID
	WHERE P.FirstName = @FName 
END

EXEC PR_PERSON_DETAIL 'ROHIT'

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_PERSON_AGGREGATION
AS
BEGIN
	SELECT  D.DepartmentName , MAX(P.Salary) AS Max_Salary ,  
		    MIN(P.Salary) AS Min_Salary , SUM(P.Salary) AS Total_Salary
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName
END

EXEC PR_PERSON_AGGREGATION

--9. Create Procedure which displays designation wise average & total salaries. 
CREATE OR ALTER PROCEDURE PR_PDES_AGGREGATION
AS
BEGIN
	SELECT  D.DesignationName , AVG(P.Salary) AS Avg_Salary ,SUM(P.Salary) AS Total_Salary
	FROM PERSON P
	JOIN Designation D
	ON P.DesignationID = D.DesignationID
	GROUP BY D.DesignationName
END

EXEC PR_PDES_AGGREGATION

-------------------------------Part – C-------------------------------- 

--10. Create Procedure that Accepts Department Name and Returns Person Count. 
CREATE OR ALTER PROCEDURE PR_DP_COUNT
@DeptName VARCHAR(100)
AS
BEGIN 
	SELECT D.DepartmentName , COUNT(P.PersonID) AS Count_Person
	FROM PERSON P 
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID
	WHERE D.DepartmentName = @DeptName
	GROUP BY D.DepartmentName
END

EXEC PR_DP_COUNT 'IT'

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than 
--input salary value along with their department and designation details.
CREATE PROCEDURE GetWorkersAboveSalary(IN input_salary DECIMAL(10, 2))
BEGIN
    SELECT P.Person_name, P.Salary, D.Department_name, P.Designation
    FROM Person P
    JOIN Department D
      ON P.Department_id = D.Department_id
    WHERE P.Salary > input_salary;
END
--12. Create a procedure to find the department(s) with the highest total salary among all departments. 


--13. Create a procedure that takes a designation name as input and returns a list of all workers under that 
--designation who joined within the last 10 years, along with their department. 


--14. Create a procedure to list the number of workers in each department who do not have a designation 
--assigned. 


--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 
--12000. 