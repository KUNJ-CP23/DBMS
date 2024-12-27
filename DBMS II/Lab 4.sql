--Lab-4 UDF 

--Note: for Table valued function use tables of Lab-2 

------------------------------------Part – A------------------------------------------

--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_PRINTHELLO()
RETURNS VARCHAR(50)
AS
BEGIN 
	RETURN 'HELLO WORLD From K !'
END;

SELECT dbo.FN_PRINTHELLO();


--2. Write a function which returns addition of two numbers. 
CREATE OR ALTER FUNCTION FN_ADDTWONUM(
	@N1 INT,
	@N2 INT
)
RETURNS INT 
AS 
BEGIN 
	DECLARE @SUM INT
	SET @SUM = @N1 + @N2
	RETURN @SUM
END;

SELECT dbo.FN_ADDTWONUM(6,9);

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODDEVEN(
@N INT 
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50)
	IF @N%2 = 0
		SET @MSG = 'EVEN'
	ELSE
		SET @MSG = 'ODD'

	RETURN @MSG
END

SELECT dbo.FN_ODDEVEN(23)

--OR

CREATE OR ALTER FUNCTION FN_ODDEVEN2(
@N INT 
)
RETURNS VARCHAR(50)
AS
BEGIN
	IF @N%2 = 0
		RETURN 'EVEN'
	RETURN'ODD'
END

SELECT dbo.FN_ODDEVEN2(23)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_PERSON_STARTSWITHB()
RETURNS TABLE
AS
	RETURN ( SELECT *
			 FROM PERSON
			 WHERE FirstName LIKE 'B%' )

SELECT * FROM dbo.FN_PERSON_STARTSWITHB()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_UNIQUE_FNAME()
RETURNS TABLE
AS
	RETURN ( SELECT DISTINCT FirstName
			 FROM PERSON )

SELECT * FROM dbo.FN_UNIQUE_FNAME()

--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_PRINT_N(
@N INT 
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @ANS VARCHAR(100), @I INT
	SET @ANS = ''
	SET @I = 1

	WHILE(@I <= @N )
	BEGIN 
		SET @ANS = @ANS + CAST(@I AS VARCHAR(100)) + ' '
		SET @I = @I +1
	END
	RETURN @ANS
END

SELECT dbo.FN_PRINT_N(10) AS N_NUMBERS

--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_N_FACTORIAL(
@N INT 
)
RETURNS INT
AS
BEGIN
	DECLARE @ANS INT, @I INT
	SET @ANS = 1
	SET @I = 1

	WHILE(@I <= @N )
	BEGIN 
		SET @ANS = @ANS * @I
		SET @I += 1
	END
	RETURN @ANS
END

SELECT dbo.FN_N_FACTORIAL(5) AS N_FACTORIAL

------------------------------------Part – B ----------------------------------------

--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 
CREATE OR ALTER FUNCTION FN_COMPARE_2_NUM(
@N1 INT,
@N2 INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN CASE
		WHEN @N1>@N2 THEN CAST(@N1 AS VARCHAR(50))+ ' is Greater'
		WHEN @N2>@N1 THEN CAST(@N2 AS VARCHAR(50))+ ' is Greater'
		ELSE 'BOTH ARE EQUAL'
	END
END

SELECT dbo.FN_COMPARE_2_NUM(5,7)

--9. Write a function to print the sum of even numbers between 1 to 20. 
CREATE OR ALTER FUNCTION FN_EVEN_SUM_20()
RETURNS INT
AS
BEGIN
	DECLARE @ANS INT, @I INT
	SET @ANS = 0
	SET @I = 1

	WHILE(@I <= 20 )
	BEGIN
		IF(@I%2=0)
			BEGIN 
				SET @ANS += @I
			END
		SET @I += 1
	END
	RETURN @ANS
END

SELECT dbo.FN_EVEN_SUM_20() AS EVEN_SUM_TILL_20

--10. Write a function that checks if a given string is a palindrome 
CREATE OR ALTER FUNCTION FN_PALINDROME(
@S VARCHAR(20)
)
RETURNS VARCHAR(20)
AS 
BEGIN
	DECLARE @ORG VARCHAR(20)
	SET @ORG = @S
	SET @S = REVERSE(@S)
	IF @S = @ORG
		RETURN 'PALINDROME'
	RETURN 'NOT PALINDROME'
END

SELECT dbo.FN_PALINDROME('1221')

--OR

CREATE OR ALTER FUNCTION FN_PALINDROME_NUM(
@N INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @MSG VARCHAR(100) = ''
    DECLARE @R INT  
    DECLARE @OG INT = @N
    DECLARE @ANS INT = 0

    WHILE @N > 0
    BEGIN
        SET @R = @N % 10
        SET @ANS = @ANS * 10 + @R
        SET @N = @N / 10
    END

    IF @OG = @ANS
        SET @MSG = CAST(@OG AS VARCHAR) + ' is Palindrome !!'
    ELSE 
        SET @MSG = CAST(@OG AS VARCHAR) + ' is not Palindrome !!'

    RETURN @MSG
END

SELECT dbo.FN_PALINDROME(12321)
------------------------------------Part – C------------------------------------------

--11. Write a function to check whether a given number is prime or not. 
CREATE OR ALTER FUNCTION FN_PRIME(
@N INT
)
RETURNS VARCHAR(50)
AS 
BEGIN
	DECLARE @MSG VARCHAR(50) = ''
	DECLARE @I INT = 1
	DECLARE @COUNT INT = 0
	
	WHILE @I <= @N
	BEGIN
		IF @N%@I = 0
		BEGIN
			SET @COUNT = @COUNT + 1
		END
		SET @I = @I + 1
	END

	IF @COUNT>2
		SET @MSG = CAST(@N AS VARCHAR)+' is not Prime'
	ELSE
		SET @MSG = CAST(@N AS VARCHAR)+' is Prime'

	RETURN @MSG
END

SELECT dbo.FN_PRIME(7)


--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 
CREATE OR ALTER FUNCTION FN_DATEDIFF_DAYS(
@SDATE DATE,
@EDATE DATE
)
RETURNS INT
AS 
BEGIN
	RETURN DATEDIFF(DAY,@SDATE,@EDATE)
END

SELECT dbo.FN_DATEDIFF_DAYS('2005-01-23',GETDATE())

--13. Write a function which accepts two parameters year & month in integer and returns total days each year. 
CREATE OR ALTER FUNCTION FN_TotalDaysInMonth(
@YEAR INT,
@MONTH INT
)
RETURNS INT 
AS 
BEGIN
	DECLARE @ANS VARCHAR(100), @DATE DATE, @DAY INT

	SET @ANS = CAST(@YEAR AS VARCHAR)+'-'+ CAST(@MONTH AS VARCHAR)+'-1'
	SET @DATE = CAST(@ANS AS DATE)

	RETURN DAY(EOMONTH(@DATE))
END;

SELECT	dbo.FN_TotalDaysInMonth(2024,12)

--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
CREATE OR ALTER FUNCTION FN_PERSON_DID(
@DID INT
)
RETURNS TABLE
AS
	RETURN ( SELECT *
			 FROM PERSON
			 WHERE DepartmentID = @DID )
			 
SELECT * FROM dbo.FN_PERSON_DID(1)

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
CREATE OR ALTER FUNCTION FN_PERSON_JDATE()
RETURNS TABLE
AS
	RETURN ( SELECT * 
			 FROM PERSON
			 WHERE JoiningDate > '1991-01-01' )

SELECT * FROM dbo.FN_PERSON_JDATE()