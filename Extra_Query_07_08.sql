--EXTRA QUERY, 07/08/2024

--Perform on Table "EMP"
CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50)
);

INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot');

SELECT * FROM EMP;

--1.Calculate the average salary of employees hired after 1st January, 1991. Label the column as Average_Salary_After_1991.
SELECT AVG(SALARY) AS Average_Salary_After_1991 
FROM EMP
WHERE JoiningDate>'1991-01-01';
       
--2.Find the total number of employees in each department.
SELECT Department,COUNT(Department) AS COUNT_DEPT
FROM EMP
GROUP BY Department;

--3.Display the total salary of employees in each city in descending order.
SELECT SUM(Salary) AS TOTAL, CITY
FROM EMP
GROUP BY CITY
ORDER BY CITY DESC;

--4.Find the total number of employees in each city.
SELECT CITY,COUNT(EID) AS TOTAL
FROM EMP
GROUP BY CITY;

--5.Find the highest salary among all employees.
SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP;

--6.Retrieve the maximum salary from the IT department.
SELECT MAX(SALARY) AS MAX_SAL
FROM EMP
WHERE DEPARTMENT='IT';

--7.Count the total number of distinct cities where employees reside.
SELECT COUNT(DISTINCT CITY) AS TOTAL
FROM EMP;

--8.Calculate the total salary of each department.
SELECT SUM(SALARY) AS TOTAL_SAL,DEPARTMENT
FROM EMP
GROUP BY DEPARTMENT;

--9.Find the minimum salary of an employee residing in Ahmedabad.


   
--10.List the departments with total salaries exceeding 50000 and located in Rajkot.
   
--11.List the departments with total salaries exceeding 35000 and sort the list by total salary.
    
--12.List departments with more than two employees.

--13.Show departments where the average salary is above 25000.
    
--14.Retrieve cities with employees hired before 1st January 1991.

--15.Find departments with a total salary between 50000 and 100000.
