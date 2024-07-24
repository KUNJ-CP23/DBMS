--LAB 7

CREATE TABLE EMP(
EID INT,
ENAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
JOININGDATE DATE,
CITY VARCHAR (25) 
);
truncate table emp;

INSERT INTO EMP(EID, ENAME, DEPARTMENT, SALARY, JOININGDATE , CITY)
VALUES 
(101,'RAHUL','ADMIN', 56000,'1990-01-01','RAJKOT'),
(102,'HARDIK','IT',18000,'1990-09-25','AHMEDABAD'),
(103,'BHAVIN','HR',25000,'1991-05-14','BARODA'),
(104,'BHOOMI','ADMIN',39000,'1991-02-08','RAJKOT'),
(105,'ROHIT','IT',17000,'1990-07-23','JAMNAGAR'),
(106,'PRIYA','IT',9000,'1990-10-18','AHMEDABAD'),
(107,'BHOOMI','HR',34000,'1991-12-25','RAJKOT');

SELECT * FROM EMP;

--PART A
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY 
FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 
SELECT SUM(SALARY) AS TOTAL_SAL,
AVG(SALARY) AS AVERAGE_SAL
FROM EMP;

--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS TOTAL_EMP FROM EMP;

--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS MAX_FROM_RAJKOT
FROM EMP 
WHERE CITY='RAJKOT';

--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAX_FROM_IT
FROM EMP 
WHERE DEPARTMENT='IT';

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(EID) AS TOTAL_AFTER_8FEB
FROM EMP
WHERE JOININGDATE>'1991-02-08';

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS AVG_FROM_ADMIN
FROM EMP
WHERE DEPARTMENT='ADMIN';

--8. Display total salary of HR department.
SELECT COUNT(SALARY) AS TOATAL_FROM_HR
FROM EMP
WHERE DEPARTMENT='HR';

--9. Count total number of cities of employee without duplication. 
SELECT COUNT(DISTINCT CITY) 
FROM EMP;

--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) 
FROM EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS MIN_FROM_AMD
FROM EMP
WHERE CITY='AHMEDABAD';

--12. Find city wise highest salary. 
SELECT MAX(SALARY) AS MAX_SALARY,
CITY AS CITY_NAME
FROM EMP
GROUP BY CITY;

--13. Find department wise lowest salary. 
SELECT MIN(SALARY) AS MIN_SALARY,
DEPARTMENT AS DPMT
FROM EMP 
GROUP BY DEPARTMENT;

--14. Display city with the total number of employees belonging to each city.
SELECT COUNT(EID) AS TOTAL,
CITY AS CITY_NAME
FROM EMP
GROUP BY CITY;

--15. Give total salary of each department of EMP table.
SELECT COUNT(SALARY) AS TOTAL_SALARY,
DEPARTMENT AS DPMT
FROM EMP 
GROUP BY DEPARTMENT;

--16. Give average salary of each department of EMP table without displaying the respective department 
--name. 
SELECT AVG(SALARY) AS AVERAGE_SALARY
FROM EMP 
GROUP BY DEPARTMENT;

--Part – B: 

--1. Count the number of employees living in Rajkot. 
SELECT COUNT(EID) AS TOTAL
FROM EMP
WHERE CITY='RAJKOT';

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT (MAX(SALARY)-MIN(SALARY)) AS DIFF
FROM EMP;

--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(EID) AS TOTAL_EMPS
FROM EMP 
WHERE JOININGDATE<'1991-01-01';

--Part – C: 
--1. Count the number of employees living in Rajkot or Baroda. 
SELECT COUNT(EID) AS TOTAL
FROM EMP
WHERE CITY='RAJKOT' OR CITY='BARODA';

--OR ELSE

SELECT COUNT(EID) AS TOTAL
FROM EMP
WHERE CITY IN ('RAJKOT','BARODA');

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(EID) AS TOTAL
FROM EMP 
WHERE JOININGDATE<'1991-01-01' AND DEPARTMENT='IT';

--3. Find the Joining Date wise Total Salaries.
SELECT SUM(DISTINCT SALARY), JOININGDATE
FROM EMP
GROUP BY JOININGDATE;

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(SALARY) AS MAX_SAL,CITY,DEPARTMENT
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY; 

--EXTRA QUERY
--FIND OUT DEPARTMENT WISE HIGHEST PAID EMPLOYEE NAME

SELECT 
	DEPARTMENT,
	ENAME AS HIGHEST_PAID_EMP,
	SALARY AS HIGHEST_SALARY
FROM 
	EMP
WHERE 
 SALARY IN(
		SELECT 
			MAX(SALARY)
			FROM EMP
			GROUP BY DEPARTMENT
		);

		SELECT * FROM EMP;

