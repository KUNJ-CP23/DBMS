
-------------------------------LAB 13-------------------------------

--Advanced level Joins --

--github.com/AbhayViradiya04/SQLQuery

CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

SELECT * FROM CITY;
SELECT * FROM Village;

--1. Display all the villages of Rajkot city.
SELECT V.*
FROM CITY C
LEFT OUTER JOIN VILLAGE V
ON C.CITYID = V.CITYID
WHERE C.NAME = 'RAJKOT';

--2. Display city along with their villages & pin code.
SELECT C.NAME AS CITYNAME, C.PINCODE, V.NAME AS VILLAGE_NAME
FROM CITY C
JOIN VILLAGE V
ON C.CITYID = V.CITYID;

--3. Display the city having more than one village.
SELECT C.NAME AS CITYNAME, COUNT(V.NAME) AS TOTAL_VILLAGES
FROM CITY C
JOIN VILLAGE V
ON C.CITYID = V.CITYID
GROUP BY C.NAME
HAVING COUNT(V.NAME) > 1;

--4. Display the city having no village. 
SELECT C.NAME AS CITYNAME
FROM CITY C
LEFT OUTER JOIN VILLAGE V
ON C.CITYID = V.CITYID
GROUP BY C.NAME
HAVING COUNT(V.VID) = 0;

--5. Count the total number of villages in each city.
SELECT C.NAME AS CITYNAME, COUNT(V.NAME) AS TOTAL_VILLAGES
FROM CITY C
JOIN VILLAGE V
ON C.CITYID = V.CITYID
GROUP BY C.NAME;

--6. Count the number of cities having more than one village. 
SELECT COUNT(C.CITYID) 
FROM CITY C
WHERE C.CITYID LIKE ( SELECT COUNT(V.NAME)
					  FROM CITY C
					  JOIN VILLAGE V
					  ON C.CITYID = V.CITYID);


SELECT COUNT(C.CITYID) AS TOTAL_CITY, C.NAME
FROM CITY C
LEFT OUTER JOIN VILLAGE V
ON C.CITYID = V.CITYID
GROUP BY C.NAME
HAVING COUNT(V.CITYID) > 1;

--CORRECT Solution 1
SELECT 
	COUNT(*) AS CountCityWithNoVillage
FROM (
		SELECT C.NAME, COUNT(V.VID) AS TOTAL
		FROM CITY C
		JOIN VILLAGE V
		ON C.CITYID = V.CITYID
		GROUP BY C.NAME
	 ) AS CITY_COUNT
WHERE TOTAL > 1;


--CORRECT Solution 2
SELECT 
	COUNT(*) AS CountCityWithNoVillage
FROM (
		SELECT C.CITYID
		FROM CITY C
		JOIN VILLAGE V
		ON C.CITYID = V.CITYID
		GROUP BY C.CITYID
		HAVING COUNT(V.VID) > 1
	 ) AS CITYCOUNT;

SELECT * FROM STU_MASTER;

INSERT INTO STU_MASTER VALUES (110,'KUNJ',DEFAULT,9,0);

--Create below table with following constraints 
--1. Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.
--4. Try to update SPI of Raju from 8.80 to 12. 
--5. Try to update Bklog of Neha from 0 to -1.
