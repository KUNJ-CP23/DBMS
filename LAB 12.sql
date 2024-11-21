----------LAB 12---------
--Implement Complex Joins

--Part – A: 


SELECT * FROM PERSON;

SELECT * FROM DEPT;

--1. Find all persons with their department name & code.
SELECT P.PERSONNAME, D.DEPARTMENTNAME, D.DEPARTMENTCODE  
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID;

--2. Find the person's name whose department is in C-Block.
SELECT P.PERSONNAME, D.LOCATION  
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.LOCATION = 'C-BLOCK';

--3. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT P.PERSONNAME, P.SALARY, D.DEPARTMENTNAME 
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE P.CITY = 'JAMNAGAR';

--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT P.PERSONNAME, P.SALARY, D.DEPARTMENTNAME 
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE P.CITY <> 'RAJKOT';

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001. 
SELECT P.PERSONNAME
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE P.JOININGDATE > '2001-08-01' AND D.DEPARTMENTNAME = 'CIVIL';

--6. Find details of all persons who belong to the computer department.
SELECT P.*, D.DEPARTMENTNAME 
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTNAME = 'COMPUTER';

--7. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT P.PERSONNAME, D.DEPARTMENTNAME 
FROM PERSON P
LEFT OUTER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE DATEDIFF(DAY, P.JOININGDATE, GETDATE()) > 365;

--8. Find department wise person counts. 
SELECT D.DEPARTMENTNAME, COUNT(P.PERSONNAME) AS COUNTED
FROM PERSON P
INNER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME;

--9. Give department wise maximum & minimum salary with department name.
SELECT D.DEPARTMENTNAME, MAX(P.SALARY) AS MAX_SALARY, MIN(P.SALARY) AS MIN_SALARY
FROM PERSON P
INNER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME;

--10. Find city wise total, average, maximum and minimum salary.
SELECT P.CITY, SUM(P.SALARY) AS TOTAL,MAX(P.SALARY) AS MAX_SALARY, MIN(P.SALARY) AS MIN_SALARY, ROUND(AVG(SALARY),2) AS AVERAGE
FROM PERSON P
INNER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY P.CITY;

--11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT P.CITY,  CAST(AVG(P.SALARY) AS DECIMAL(7,2)) AS AVERAGE
FROM PERSON P
INNER JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY P.CITY;

SELECT * FROM STU_MASTER;

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)
SELECT P.PersonName + '  lives  In  ' + P.City + '  and  works  in  ' + D.DepartmentName + '  Department. ' FROM PERSON P
JOIN DEPT D
ON D.DepartmentID = P.DepartmentID


----------PART-B(COMPLEX JOINS)----------


--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
SELECT CONCAT(P.PersonName, '  earns  ', P.Salary, '  from  ', D.DepartmentName, '  department.  ') 
FROM PERSON P
JOIN DEPT D
ON D.DepartmentID = P.DepartmentID;

--2. Find city & department wise total, average & maximum salaries.
SELECT  P.City, D.DepartmentName, SUM(P.SALARY) AS TOTAL_SAL, AVG(P.SALARY) AS AVG_SAL, MAX(P.SALARY) AS MAX_SAL 
FROM PERSON P
JOIN DEPT D
ON D.DepartmentID = P.DepartmentID
GROUP BY P.City, D.DepartmentName;

--3. Find all persons who do not belong to any department.
SELECT P.PERSONNAME FROM PERSON P
LEFT JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTID IS NULL;

--4. Find all departments whose total salary is exceeding 100000.
SELECT D.DEPARTMENTNAME, SUM(P.SALARY)
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
HAVING SUM(P.SALARY) > 100000;

----------PART-C(COMPLEX JOINS)----------

--1. List all departments who have no person.
SELECT D.DEPARTMENTNAME 
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID= D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
HAVING COUNT(P.PERSONID)=0;

--2. List out department names in which more than two persons are working.
SELECT D.DEPARTMENTNAME 
FROM PERSON P
JOIN DEPT D
ON P.DEPARTMENTID= D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
HAVING COUNT(P.PERSONID) >2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE  PERSON
SET PERSON.SALARY = PERSON.SALARY + (SALARY)*0.1
FROM PERSON
JOIN DEPT
ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME = 'COMPUTER'

--OR

UPDATE  PERSON
SET SALARY = SALARY + (SALARY)*0.1
WHERE DEPARTMENTID IN(SELECT DEPARTMENTID FROM DEPT WHERE DEPARTMENTNAME='COMPUTER')

