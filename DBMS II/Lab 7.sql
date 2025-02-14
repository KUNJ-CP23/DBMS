-----------------------------Lab-7 Exception Handling----------------------------------------- 

--From the above given tables perform the following queries: 

--------------------------Part – A -------------------------------

-- Create the Customers table 
CREATE TABLE Customers ( 
Customer_id INT PRIMARY KEY,                 
Customer_Name VARCHAR(250) NOT NULL,         
Email VARCHAR(50) UNIQUE                     
); 
-- Create the Orders table 
CREATE TABLE Orders ( 
Order_id INT PRIMARY KEY,                    
Customer_id INT,                             
Order_date DATE NOT NULL,                    
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
); 

--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
BEGIN TRY 
	DECLARE @N1 INT = 10, @N2 INT = 0, @ANS INT
	SET @ANS = @N1/@N2
	PRINT @ANS
END TRY
BEGIN CATCH 
	PRINT 'Error occurs that is - Divide by zero error.'
END CATCH

--2. Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
	DECLARE @STR VARCHAR(50) = 'KUNJ'
	DECLARE @I INT
	SET @I = CAST(@STR AS INT)
END TRY
BEGIN CATCH
	--PRINT ERROR_MESSAGE()  Or
	PRINT 'Error : Unable to convert string into integer'
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result. 
CREATE OR ALTER PROC PR_CALCULATE_SUMWITHERRORHANDLING
@N1 VARCHAR(50),
@N2 VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		DECLARE @NUM1 INT, @NUM2 INT
		DECLARE @ANS INT
		SET @NUM1 = CAST(@N1 AS INT)
		SET @NUM2 = CAST(@N2 AS INT)

		SET @ANS = @NUM1 + @NUM2
	END TRY
	BEGIN CATCH
		PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
		PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
		PRINT 'SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
		PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
		PRINT 'LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_CALCULATE_SUMWITHERRORHANDLING 10,'KUNJ'

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state.

--insert the same record twice and error will be generated
BEGIN TRY
	INSERT INTO Customers(Customer_Id, Customer_Name, Email)
	VALUES (1,'KUNJ RAMOLIYA','KUNJ@GMAIL.COM');
END TRY
BEGIN CATCH
	PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
	PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
	PRINT 'SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
	PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
	PRINT 'LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50))
END CATCH

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
--Error like no Customer_id is available in database.
CREATE OR ALTER PROC PR_CID_ERRORHANDLING
@CID INT
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM CUSTOMERS WHERE Customer_id = @CID)
			BEGIN
				THROW 50001, 'No customer id is available in database' , 1;
			END
		ELSE
			BEGIN
				PRINT 'CUSTOMER ID EXISTS'
			END
	END TRY
	BEGIN CATCH
		PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
		PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
		--PRINT 'SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
		PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
		--PRINT 'LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_CID_ERRORHANDLING 4

------------------------------Part – B---------------------------- 

--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error 
--message. 
BEGIN TRY
	INSERT INTO Orders(Order_id,Customer_Id, Order_date)
	VALUES (1,3,'2022-01-23');
END TRY
BEGIN CATCH
	PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
	PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
	PRINT 'SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
	PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
	PRINT 'LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50))
END CATCH

--7. Throw custom exception that throws error if the data is invalid.
CREATE OR ALTER PROC PR_CUSTOM_ERRORHANDLING
@CID INT
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM CUSTOMERS WHERE Customer_id = @CID)
			BEGIN
				THROW 50001, 'MY HANDMADE ERROR' , 1;
			END
		ELSE
			BEGIN
				PRINT 'NO ERROR'
			END
	END TRY
	BEGIN CATCH
		PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
		PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
		PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_CUSTOM_ERRORHANDLING 5

--8. Create a Procedure to Update Customer’s Email with Error Handling (WRONG QUES)
CREATE OR ALTER PROC PR_UPDATEEMAIL_ERRORHANDLING
@CID INT,
@EMAILL VARCHAR(50)
AS
BEGIN
	BEGIN TRY
		UPDATE Customers
		SET Email = @EMAILL
		WHERE Customer_id = @CID
	END TRY
	BEGIN CATCH
		PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
		PRINT 'NUMBER : ' + CAST(ERROR_NUMBER() AS VARCHAR(50))
		PRINT 'SEVERITY : ' + CAST(ERROR_SEVERITY() AS VARCHAR(50))
		PRINT 'STATE : ' + CAST(ERROR_STATE() AS VARCHAR(50))
		PRINT 'LINE : ' + CAST(ERROR_LINE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_UPDATEEMAIL_ERRORHANDLING 6,'KUNJ@GMAIL.COM'

-------------------------------Part – C---------------------------  


--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another 
--one”.
CREATE OR ALTER PROC PR_CUSTOMERID_ERRORHANDLING
@CID INT
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CUSTOMERS WHERE Customer_id = @CID)
			BEGIN
				THROW 50003, 'The Customer_id is already taken. Try another one' , 1;
			END
		ELSE
			BEGIN
				PRINT 'NO ERROR'
			END
	END TRY
	BEGIN CATCH
		PRINT 'MESSAGE : ' + CAST(ERROR_MESSAGE() AS VARCHAR(50))
	END CATCH
END

EXEC PR_CUSTOMERID_ERRORHANDLING 1

--10. Handle Duplicate Email Insertion in Customers Table. 
CREATE OR ALTER PROC PR_DUPE_EMAIL_ERRORHANDLING
@EMAILL VARCHAR(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM CUSTOMERS WHERE Email = @EMAILL)
		BEGIN
			THROW 50004, 'Email already exits' , 1;
		END
	ELSE
		BEGIN
			PRINT 'NO ERROR'
		END
END

EXEC PR_DUPE_EMAIL_ERRORHANDLING 'KUNJ@GMAIL.COM'