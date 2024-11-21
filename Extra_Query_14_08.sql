-----> 	Table-1 : Customers_DUPE
--	Columns Name : CustomerID, CustomerName , ContactNumber , Email , Address , DateOfBirth
CREATE TABLE CUSTOMERS_DUPE(
CUSTOMERID INT,
CUSTOMERNAME VARCHAR(20),
CONTACTNUMBER INT,
EMAIL VARCHAR(20),
ADDRESS VARCHAR(50),
DATEOFBIRTH DATE
);

-----> 	Table-2 : Oredrs
--	Column Name : OrderID , CustomerID ,OrderDate , Amount , OrderStatus , ShippingAddress , PaymentMethod
CREATE TABLE ORDERS(
ORDERID INT,
CUSTOMERID INT,
ORDERDATE DATE,
AMOUNT DECIMAL(5,2),
ORDERSTATUS VARCHAR(20),
SHIPPINGADDRESS VARCHAR(50)
);

--Queries : 

--1.  List all orders with customer details.

--2.  List all customers and their orders, including customers with no orders.

--3.  List all orders and their customer details, including orders with no customer (if any).

--4.  List all customers and orders, showing all records from both tables.

--5.  List every combination of customers and orders.

--6.  List orders with customers where the order amount is greater than 100 and the customer’s contact number starts with '123'.

--7.  Count the number of orders for each customer, including customers with no orders.

--8.  Find the total amount of orders for each customer, including orders with no customer.

--9.  Show the total amount of orders and number of orders per customer and orders without customers.

--10. List orders and customers, sorted by order amount descending.

--11. List customers who have made orders in 2023, including those who haven’t ordered in 2023.

--12. List orders placed by customers with email addresses containing 'example.com'.

--13. List orders and customer details where the order date is in the last 30 days.

--14. List customers and their orders, including those without orders, where the shipping address contains 'Street'.

--15. List orders and customer details where the payment method is 'Credit Card'.

--16. List all customers and orders, including those without orders or customers, where the customer's join date is before '2023-01-01'.

--17. List orders and customer details where the amount is greater than 200 and the shipping address contains 'Avenue'.

--18. List customers and their orders, including customers with no orders, whose join date is in 2023.

--19. List orders and customer details where the customer's contact number starts with '456'.

--20.  List orders where the amount is greater than any other order placed by the same customer.

--21.List customers who placed orders on the same date as other customers.


--1.  List all orders with customer details.
--SELECT * 
--FROM CUSTOMERS C
--INNER JOIN ORDERS O
--ON C.CUSTOMERID = O.CUSTOMERID;

--2.  List all customers and their orders, including customers with no orders.
--SELECT C.CUSTOMERNAME, O.ORDERID
--FROM CUSTOMERS C
--INNER JOIN ORDERS O
--ON C.CUSTOMERID = O.CUSTOMERID;

--3.  List all orders and their customer details, including orders with no customer (if any).
--SELECT *
--FROM CUSTOMERS C
--RIGHT OUTER JOIN ORDERS O
--ON C.CUSTOMERID = O.CUSTOMERID;