--Implement SQL Joins  
--Part – A: 

CREATE TABLE STU_INFO(
RNO INT,
NAME VARCHAR(30),
BRANCH VARCHAR(10)
);
SELECT * FROM STU_INFO;

CREATE TABLE RESULT(
RNO INT,
SPI DECIMAL(2,1),
);
SELECT * FROM RESULT;

--1. Combine information from student and result table using cross join or Cartesian product.
SELECT *
FROM STU_INFO
CROSS JOIN RESULT;

--2. Perform inner join on Student and Result tables. 
SELECT *
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO;

--3. Perform the left outer join on Student and Result tables. 
SELECT *
FROM STU_INFO S
LEFT JOIN RESULT R
ON S.RNO = R.RNO;

--4. Perform the right outer join on Student and Result tables.
SELECT *
FROM STU_INFO S
RIGHT JOIN RESULT R
ON S.RNO = R.RNO;

--5. Perform the full outer join on Student and Result tables.
SELECT *
FROM STU_INFO S
FULL JOIN RESULT R
ON S.RNO = R.RNO;

--6. Display Rno, Name, Branch and SPI of all students.
SELECT S.RNO, S.NAME, S.BRANCH, R.RNO
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT S.RNO, S.NAME, S.BRANCH, R.RNO
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
WHERE BRANCH = 'CE';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT S.RNO, S.NAME, S.BRANCH, R.RNO
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
WHERE BRANCH <> 'EC';

--9. Display average result of each branch. 
SELECT AVG(R.SPI) AS AVERAGE, S.BRANCH
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
GROUP BY S.BRANCH;

--10. Display average result of CE and ME branch.
SELECT AVG(R.SPI) AS AVERAGE, S.BRANCH
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
WHERE S.BRANCH IN ('CE','ME')
GROUP BY S.BRANCH;

--Part – B: 

--1. Display average result of each branch and sort them in ascending order by SPI. 
SELECT AVG(R.SPI) AS AVERAGE, S.BRANCH
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY S.BRANCH;

--2. Display highest SPI from each branch and sort them in descending order.
SELECT MAX(R.SPI) AS HIGHEST, S.BRANCH
FROM STU_INFO S
INNER JOIN RESULT R
ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY S.BRANCH DESC;

--SORTING/ORDERBY AGG PAR NO LAGE

--Part – C: 

CREATE TABLE EMPLOYEE_MASTER(
EMPLOYEENO VARCHAR(10),
NAME VARCHAR(30),
MANAGERNO VARCHAR(10)
);
SELECT * FROM EMPLOYEE_MASTER;

--1. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E1.NAME AS EMPLOYEE , E2.NAME AS MANAGER
FROM EMPLOYEE_MASTER E1
INNER JOIN EMPLOYEE_MASTER E2
ON E1.MANAGERNO = E2.EMPLOYEENO;
