CREATE DATABASE Shopping_Cart

go
alter procedure sp_InsertCustomers(
@CustomerId BIGINT  output ,--PRIMARY KEY IDENTITY(1001,1),
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Address1 VARCHAR(200),
@ZipCode varchar(5),
@City VARCHAR(50),
@State VARCHAR(50))
As
Begin
set nocount on
insert into Customers (
FirstName,
LastName,
Address1,
ZipCode,
City,
State)
values(
@FirstName,
@LastName,
@Address1,
@ZipCode,
@City,
@State)
RETURN SCOPE_IDENTITY()
end
go

EXECUTE sp_InsertCustomers 1009,'aakash','chetty','bargur','1212','chennai','tamilnadu'

go
create procedure sp_UpdateEmployee(
@CustomerId bigint,
@FirstName varchar(50),
@LastName varchar(50),
@Address1 varchar(50),
@ZipCode varchar(5),
@City varchar(50),
@State varchar(50))
as
begin
update Customers set FirstName = @FirstName,LastName = @LastName,Address1 = @Address1,ZipCode = @ZipCode,City = @City,State = @State
where CustomerId = @CustomerId
end
go

exec sp_UpdateEmployee 1012,'hello','world','123','456','aaa','bbb'

go
create procedure sp_deleteCustomers
@CustomerId bigint
as
begin
delete from Customers where CustomerId = @CustomerId
end
go
exec sp_deleteCustomers 1016








select * from Customers


CREATE Table Customers(
CustomerId BIGINT  NOT NULL PRIMARY KEY  IDENTITY(1001,1),
FirstName VARCHAR(50)NOT NULL,
LastName VARCHAR(50)NOT NULL,
Address1 VARCHAR(200)NULL,
ZipCode varchar(5)NULL,
City VARCHAR(50)NULL,
State VARCHAR(50)NULL)

INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('John','Smith','No-45 Peter road',1111, 'Denver','Colorado')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Paul','O''Brien','No-122 Nehru street ',2222,'Denver','Colorado')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Sam','Vel','No-32 Balaji street',3333,'Denver','Colorado')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Thulasi','Krishnan','No-32 St Mary road',4444,'Denver','Colorado')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Oliver','Charlotte','No-56 St Peter road',5555,'Denver','Colorado')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('James','Smith','No-66 John Street',6666,'California','Sacramento')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Robert','Willam','No-77 Willams Street',7777,'Hawaii','Honolulu')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('David','White','No-66 Anna street',8888,'Texas','Austin')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Joseph','Clark','No-56 Gandhi street',9999,'Ohio','Columbus')
INSERT INTO Customers(FirstName,LastName,Address1,ZipCode,City,State) VALUES('Peter','Joe','North Main raod',1100,' Florida','Tallahassee')

SELECT * FROM Customers
SELECT FirstName,LastName from Customers

Create Table Orders(
OrderId BIGINT NOT NULL PRIMARY KEY IDENTITY(10001,1),
OrderDate DATETIME NOT NULL,
CustomerId BIGINT NOT NULL FOREIGN KEY REFERENCES Customers (CustomerId))

INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-14 12:45:22',1001)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-15 02:02:34',1002)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-15 02:02:34',1003)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-15 04:24:37',1004)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-16 05:25:44',1005)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-16 09:45:33',1006)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-16 09:45:34',1007)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-16 09:45:33',1008)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-17 11:34:54',1009)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-17 04:23:56',1004)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-18 09:22:54',1006)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-18 07:23:34',1008)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-18 09:32:44',1003)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-19 08:42:54',1006)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-19 04:22:24',1008)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-21 06:42:24',1009)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-21 04:52:14',1007)
INSERT INTO Orders(OrderDate,CustomerId) VALUES('2022-11-21 07:32:54',1004)

SELECT * FROM Orders

Create Table OrderDetails(
OrderDetailsId BIGINT NOT NULL PRIMARY KEY IDENTITY(100001,1),
ProductName VARCHAR(50) NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL NOT NULL,
OrderId BIGINT NOT NULL FOREIGN KEY REFERENCES Orders (OrderId))

  INSERT INTO OrderDetails(ProductName,Quantity,Price, OrderId) VALUES('Hard Disk',2,3000,10001)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('KeyBoard and Monitor',1,2500,10002)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',2,5000,10003)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',5,4500,10004)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Mouse',6,6000,10005)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',4,6000,10006)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Keyboard',5,7500,10007)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('KeyBoard and Monitor',3,7500,10008)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',1,1500,10009)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Laptop',1,60000,10003)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Keyboard',2,5000,10005)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Printer',1,10000,10007)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',3,7500,10002)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Motherbox',3,6000,10005)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Controller',4,2000,10008)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Router',1,2000,10009)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Keyboard',2,5000,10001)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',3,4500,10003)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',4,6000,10005)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',3,7500,10004)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',2,3000,10007)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',3,4500,10008)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',3,7500,10002)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',3,7500,10006)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',3,7500,10004)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Hard Disk',3,7500,10002)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Monitor',3,7500,10007)
  INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('Router',3,7500,10009)

delete  FROM OrderDetails where OrderId = 10010
DELETE FROM Orders where CustomerId = 1010

SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM OrderDetails where OrderId = 10010

-- DML Query - Find the date on which maximum number of orders created

SELECT 
	Orderdate ,
	COUNT(OrderId) AS Maximum_Orders
FROM
	Orders
GROUP BY
	OrderDate
ORDER BY
	Maximum_Orders DESC  

SELECT 
	CONVERT(DATE,OrderDate),
	COUNT(OrderId) AS Maximum_Orders
FROM 
	Orders 
GROUP BY
	CONVERT(DATE,OrderDate)
ORDER BY
	Maximum_Orders DESC 


/*	Stored Procedure - Get First Name and Last Name of all Customers who has ordered at least one product
•	We need to list the customer First Name and Last Name of customers who  has ordered at least one product.*/
GO
CREATE PROCEDURE SelectAllCustomers 
As
SELECT  DISTINCT c.FirstName ,c.LastName FROM Customers AS c JOIN Orders o ON c.CustomerId = o.CustomerId

EXECUTE SelectAllCustomers

/* DML Query - Find the customer first name and last name who ordered product named Hard Disk
	Get the customer first name and last name who ordered product named Hard Disk */

SELECT 
	c.FirstName,
	c.LastName
FROM 
	Customers AS c 
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON o.OrderId = od.OrderId
WHERE 
	od.ProductName = 'Hard Disk'

--	DML Query - Find customer first name and last name who ordered for maximum of total price column

SELECT 
	c.FirstName,
	c.LastName,
	SUM(od.Price) AS Total_Price
FROM 
	OrderDetails od 
	JOIN Orders o ON od.OrderId = o.OrderId 
	JOIN Customers c ON o.CustomerId = c.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName 
ORDER BY 
	Total_Price DESC

SELECT 
	TOP 1 c.FirstName,
	c.LastName,
	SUM(Price) AS Amount 
FROM 
	Customers c 
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON od.OrderId = o.OrderId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	Amount DESC

/*	DML Query - Find Customers who has not ordered Hard Disk
	DML Query - Find Customers who never ordered a Hard Disk. Find the customer who has not ordered a hard disk in all of the orders.*/

SELECT 
	C.FirstName,
	C.LastName 
FROM
	Customers c 
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON od.OrderId = o.OrderId
WHERE
	ProductName != 'Hard Disk'

--	DML Query - Find First name and  Last name of the customers  who ordered monitor along with keyboard in the same order

SELECT
	c.FirstName,
	c.LastName
FROM 
	Customers c 
	JOIN Orders o ON c.CustomerId = o.CustomerId 
	JOIN OrderDetails AS k
	ON o.OrderId = k.OrderId AND k.ProductName = 'Keyboard'
	JOIN OrderDetails AS m 
	ON o.OrderId = m.OrderId AND m.ProductName = 'Monitor'

 SELECT * FROM OrderDetails WHERE  ProductName = 'Monitor'
SELECT * FROM OrderDetails WHERE  ProductName = 'Keyboard'


select A.OrderId from
(SELECT * FROM OrderDetails WHERE  ProductName = 'Monitor') A
inner join (SELECT * FROM OrderDetails WHERE  ProductName = 'Keyboard') B
on A.OrderId =B.OrderId

/*	DML Query - List the Customers personal information along with sum of total price of all their orders
	DML Query - List the customers personal information such as first name, last name city and state along with sum of total price of all their orders */

SELECT 
	c.FirstName,
	c.LastName,
	c.City,
	c.State,
	SUM(Price)AS TotalPrice
FROM 
	Customers c  
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName,
	c.City,
	c.State
ORDER BY 
	TotalPrice DESC

/* 12.	DML Query - Find the customer First Name and Last Name who lives in the  State of CO or Colorado
	DML Query - Find Customer First Name and Last who lives in the State of  CO or Colorado */

SELECT DISTINCT c.FirstName,c.LastName,c.State FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
WHERE c.State = 'Colorado'

SELECT
	*
FROM
	Customers
WHERE
	State = 'Colorado'

/* 13.	DML Query - Find the customer who lives in the city of Denver
	Find the Customer Id, First Name, Last Name, Address 1, Zip, City, State who lives in the city named "Denver" */

SELECT  DISTINCT c.CustomerId,c.FirstName,c.LastName,c.Address1,c.ZipCode,c.City,c.State FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
WHERE c.City = 'Denver'

SELECT  DISTINCT * FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
WHERE c.City = 'Denver'

SELECT
	*
FROM
	Customers
WHERE 
	City = 'Denver'

/* 14.	DML Query - Find the Customer who is called by his/her first name O'Brien (apostrophe)
	Find the CustomerId, FirstName, LastName, Address1, Zip, City, and State who is called by his/her first name O'Brien (apostrophe) */

SELECT * FROM Customers WHERE LastName = 'O''Brien'

SELECT 
	* 
FROM
	Customers 
WHERE
	LastName LIKE '%O''Brien%'

/* 15.	DML Query - List all the customers by ascending order of CustomerID
o	DML Query - List all the customers in the company by ascending order of CustomerID
o	The expected result columns are customer id, first name, last name, city, state and zip code */

SELECT
	CustomerId,
	FirstName,
	LastName,
	City,
	State,
	ZipCode
FROM 
	Customers 
ORDER BY
	CustomerId

SELECT 
	* 
FROM
	Customers 
ORDER BY
	CustomerId
 
 /* 16.	DML Query - List all the customers by ascending order of First Name and descending order of Last Name
o	DML Query - List all the customers by ascending order of First Name and descending order of the Last Name */

SELECT
	* 
FROM 
	Customers 
ORDER BY
	FirstName,
	LastName DESC

/* 17.	DML Query - Find how many number of customers exists 
o	DML Query - Find how many number of customers exists */

SELECT
	COUNT(CustomerId) AS TOTAL_CUSTOMERS 
FROM 
	Customers
GROUP BY
	CustomerId

SELECT
	COUNT(*) AS Total_Customers
FROM 
	Customers

--18.	DML Query - Find how many number of customers lives in the state of Colorado or CO

SELECT 
	COUNT(*) AS Total_Customers
FROM
	Customers
WHERE 
	State = 'Colorado' 

--19.	DML Query - UPDATE - Update the address1 field of the customer by First Name and Last Name

UPDATE
	Customers
SET 
	Address1 = 'No 10 Big Street'
WHERE
	FirstName = 'John' AND LastName = 'Smith'

SELECT
	*
FROM
	Customers

/*21.	DML Query - Find the sum of the amount of all orders placed by each customer
	DML Query - Find the sum of the amount of all orders placed by each customer. For each customer, find the total amount of orders that they have placed.*/

SELECT
	c.FirstName,
	c.LastName,
	SUM(Price)AS TotalPrice,
	COUNT(od.OrderId) AS COUNT
FROM 
	Customers c  
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY  
	COUNT DESC

/* 22.	DML Query - Find the top most customer who ordered for the maximum amount in all orders
o	Find the top most customer who has placed the orders for the maximum sum of the amount in all orders */

SELECT
TOP 1 
	c.FirstName,
	c.LastName,
	SUM(Price) AS Amount
FROM 
	Customers c 
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON od.OrderId = o.OrderId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	Amount DESC

--24.	DML Query - Day-wise revenue report - Find the sum of the amount of ALL orders by EVERY/EACH day

SELECT 
	CONVERT(DATE, o.OrderDate) AS DATE,
	SUM(Price) AS Amount ,
	COUNT(od.OrderId) AS No_Count 
FROM
	Orders o 
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY 
	CONVERT(DATE,o.OrderDate)

--25.	DML Query - Find the very latest order that has been placed

SELECT
TOP 1 
	*
FROM 
	Orders o 
	JOIN OrderDetails od ON o.OrderId = od.OrderId
ORDER BY
	o.OrderId DESC

--26.	DML Query - Find the sum of the amount of EACH order which has product name keyboard in it

SELECT
	SUM(Price) AS Amount,
	od.ProductName 
FROM 
	Orders o
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	od.ProductName  
HAVING 
	ProductName = 'Keyboard'

SELECT
	OrderId,
	ProductName,
	SUM(Price) AS Amount
FROM 
	OrderDetails
GROUP BY
	OrderId,
	ProductName
HAVING 
	ProductName = 'Keyboard'

/*27.	DML Query - Find the order which has more than one product ordered in it
OUTPUT COLUMNS
•	OrderId
•	Product Name
Note: Avoid duplicate rows */
SELECT
	orderId,
	COUNT(ProductName) AS Product 
FROM 
	OrderDetails
GROUP BY
	OrderId
HAVING 
	COUNT(*)>1

SELECT 
	o.OrderId,
	COUNT(ProductName)AS Product
FROM 
	Orders o 
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	o.OrderId
HAVING
	COUNT(*)>1

-- 28 Find the each order and its sum of ordered amount

SELECT 
	orderId,
	SUM(Price) AS Order_Amount
FROM 
	OrderDetails
GROUP BY 
	OrderId

-- 29.	DML Query - CTE QUERY - Find the most ordered product USE CTE QUERY.
GO
WITH CTE AS
(SELECT
TOP 1
	ProductName,
	COUNT(ProductName) AS TotalCount
FROM
	OrderDetails
GROUP BY
	ProductName
ORDER BY 
	TotalCount DESC)
			
SELECT 
	*
FROM
	CTE
-- It is temporary because its result cannot be stored anywhere and will be lost as soon as a query's execution is completed. 
--30.	DML Query - List all order by date using descending order

SELECT
	CONVERT(DATE,OrderDate) AS DATE,
	OrderId,
	CustomerId
FROM 
	Orders
GROUP BY
	OrderId,
	CustomerId,
	OrderDate
ORDER BY 
	OrderDate DESC

--31.	Find out the latest order that has been placed

SELECT
TOP 1
	*
FROM 
	Orders
ORDER BY
	OrderId DESC

--32.	Select the orders which has more than 1 product

SELECT
	OrderId,
	COUNT(ProductName) AS Product 
FROM 
	OrderDetails
GROUP BY 
	OrderId
HAVING
	COUNT(ProductName)>1

--33.	Find out the total price of each order by order id

SELECT
	OrderId,
	SUM(Price) AS Total_Price
FROM 
	OrderDetails
GROUP BY
	OrderId

--34.	Find the product name that has been ordered most times

SELECT
	ProductName,
	COUNT(*) AS Count
FROM 
	OrderDetails
GROUP BY 
	ProductName
ORDER BY
	COUNT(*)DESC

--35.	Find the product name that been ordered least times

SELECT
	ProductName,
	COUNT(*) AS COUNT
FROM 
	OrderDetails
GROUP BY 
	ProductName
ORDER BY
	COUNT

-- 36.	Find out the total price of all orders by customer id

SELECT 
	c.CustomerId,
	SUM(Price) AS Total_Price 
FROM 
	Customers c
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON o.OrderId =od.OrderId
GROUP BY
	c.CustomerId

--37.	Find out the customer who ordered for large sum of money

SELECT 
TOP 1
	c.CustomerId,
	SUM(Price) AS Amount
FROM 
	Customers c 
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON od.OrderId = o.OrderId
GROUP BY
	c.CustomerId
ORDER BY
	Amount DESC

--38.	Find on which day the largest number of quantity of products ordered and list down top 5 products in descending order

SELECT 
	CONVERT(DATE,OrderDate) AS DATE,
	Quantity,ProductName
FROM 
	Orders o
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	OrderDate,
	Quantity,
	ProductName
ORDER BY 
	Quantity DESC

SELECT 
TOP 5 
	FORMAT (orderDate , 'dddd, MMMM, yyyy') AS DAY,
	ProductName,
	Quantity
FROM 
	Orders o
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY
	OrderDate,
	Quantity,
	ProductName
ORDER BY
	Quantity DESC

--39.	Find the First name , Last name and amount second top most customer who has order large sum of amounts--pagination performance faster

SELECT 
	c.FirstName,
	c.LastName,
	SUM(Price) AS Amount 
FROM 
	Customers c
	JOIN Orders o ON c.CustomerId = o.CustomerId
	JOIN OrderDetails od ON o.OrderId = od.OrderId
GROUP BY 
	c.FirstName,
	c.LastName
ORDER BY
	Amount DESC
	OFFSET 1 ROWS
FETCH NEXT
	1
ROWS
	ONLY




----------------------------------------------------------          ---------------------------------------------------------------------------------
                                                         -- PHASE-2-- 
----------------------------------------------------------          ---------------------------------------------------------------------------------
1.	Format the following query as per the coding standards defined above

SELECT
	*
FROM 
	Patient 
ORDER BY
	PatientId

SELECT
	E.Id,
	E.Code,
	E.FirstName,
	E.LastName,
	L.Code,
	L.Descr 
FROM 
	Employees E INNER JOIN Location L ON E.LocationId = L.Id;


SELECT 
	Employee.Id,
	Employee.FirstName,
	Employee.LastName,
	SUM(DATEDIFF("second", call.start_time, call.end_time)) AS call_duration_sum 
FROM
	call INNER JOIN employee ON call.employee_id = employee.id
GROUP BY 
	employee.id, 
	employee.first_name,
	employee.last_name 
ORDER BY
	employee.Id ASC;

SELECT
	employee.id,
	employee.first_name,
	employee.last_name,
	call.start_time,
	call.end_time,
	DATEDIFF("second", call.start_time, call.end_time) AS call_duration,duration_sum.call_duration_sum,
	CAST( CAST(DATEDIFF("second", call.start_time, call.end_time) AS decimal(7,2)) / CAST(duration_sum.call_duration_sum AS decimal(7,2)) AS decimal(4,4)) AS call_percentage 
	FROM 
		call INNER JOIN employee ON call.employee_id = employee.id INNNER JOIN (SELECT employee.id,SUM(DATEDIFF("second", call.start_time, call.end_time)) AS call_duration_sum
	FROM 
		call INNER JOIN employee ON call.employee_id = employee.id
	GROUP BY 
		employee.id) AS duration_sum ON employee.id = duration_sum.id 
	ORDER BY
		employee.id ASC,call.start_time ASC;

SELECT
	[empid],
	[firstname] + ' ' +[lastname] AS Name ,
	[education],
	[occupation],
	[yearlyincome],
	[sales]  
FROM 
	[employees 2015]  
WHERE
	yearlyincome >= 70000 UNION SELECT [empid],[firstname] + ' ' +[lastname] as Name,
	[education],
	[occupation],
	[yearlyincome], 
	[sales]  
FROM
	[employees 2016]  
WHERE
	yearlyincome < 70000 
ORDER BY
	yearlyincome DESC

CREATE TABLE TblCustomers(
CustomerId BIGINT NOT NULL  PRIMARY KEY IDENTITY(1000,1),
FirstName VARCHAR(50)NOT NULL,
LastName VARCHAR(50)NOT NULL,
Address1 VARCHAR(200),
ZipCode VARCHAR(5),
City VARCHAR(50),
State VARCHAR(50));


-----------------------------------------  PASE-3    ----------------------------------------------------------


CREATE TABLE CustomerInfo(
CustomerID  BIGINT IDENTITY(1001,1)PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Date_of_Birth DATETIME,
Gender BIT NOT NULL,    
Email  VARCHAR(100),
Phone_Number BIGINT)

SELECT * FROM CustomerInfo

INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('John','Smith', '2002-06-17 12:45:22',1 ,'johnsmith12@gmail.com',9500554093)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Paul','O''Brien','2001-02-09 09:45:34',1,'paulbrien@gmail.com',9876543210)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Sam','Vel','1999-07-08 11:34:54',1,'samvel@gmail.com',8765432109)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Peter','Joe','1996-02-19 09:22:54',1,'peterjoe@gmail.com',6543210987)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Thulasi','Krishnan','1997-06-23 05:42:34',1,'thulasikrishna12@gmail.com',6213478035)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Oliver','Charlotte','1998-01-24 07:32:54',1,'oliverchatlte@gmail.com',9807654312)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('James','Smith','1980-09-14 06:42:24',1,'jamessmith134@gmail.com',9856821785)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Ruby','Willam','2003-05-21 07:23:34',0,'robertwillam131@gmail.com',9812345674)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('David','White','2000-09-13 04:24:37',1,'davidwhite14@gmail.com',9357281225)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('Joseph','Clark','2001-05-15 12:23:44',1,'josephclark@gmailcom',8003581680)
INSERT INTO CustomerInfo (FirstName,LastName,Date_of_Birth,Gender,Email,Phone_Number) VALUES ('JENNY','Clark','2002-06-17 08:42:54',0,'davidclark165@gamil.com',6583911338)


CREATE TABLE CustomerAddress(
            CustomerID BIGINT FOREIGN KEY REFERENCES CustomerInfo(CustomerID),
            Address1 VARCHAR (100) NOT NULL,
            Address2 VARCHAR (100) NOT NULL,
            State VARCHAR (50),
            City VARCHAR (50),
            ZipCode VARCHAR(5))
          
exec sp_rename 'Customers1', 'CustomerInfo'
select * from CustomerInfo

INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Acorn Street','No-45 Peter road', 'Denver','Colorado',60719,1001)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Albert Cuypstraat street','No-122 GanEdhi street ','Denver','Colorado',60709,1002)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Amber Road street','No-32 Bharathi street','Denver','Colorado',60709,1003)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Appian Way ','North Main raod',' Florida','Tallahassee',60215,1004)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Atlanterhavsveien street ','No-56 St Peter road','Denver','Colorado',60709,1005)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Aviles Street','No-66 John Street','California','Sacramento',60815,1006)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Beale Street','No-66 John Street','California','Sacramento',60805,1007)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Bleeker Street','No-77 Willams Street','Hawaii','Honolulu',60503,1008)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Blue Ridge Parkway','No-66 Johnson street','Texas','Austin',60149,1009)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Boston Post Road','No-56 Garthik street','Ohio','Columbus',60215,1010)
INSERT INTO CustomerAddress (Address1,Address2,State,City,ZipCode,CustomerID) VALUES ('Calle Estafeta street','No-65 kathik street','Texas','Austin',60505,1011)

SELECT
	* 
FROM 
	CustomerAddress

SELECT
	DATEDIFF(YY,Date_of_Birth,GETDATE()) AS  Age
FROM 
	CustomerInfo
GO
CREATE FUNCTION AgeInfo(
	@Date_of_Birth DATETIME)
RETURNS INT 
AS
BEGIN
DECLARE
	@Age INT;
SELECT
	@Age =DATEDIFF(YY,@Date_of_Birth,
	GETDATE()) 
RETURN 
	@Age;
END
GO
SELECT 
	[dbo].[AgeInfo]('1998-04-11')

GO
CREATE VIEW   CustomerDetails 
AS 
SELECT
	FirstName,
    LastName ,
    Date_of_Birth ,
CASE 
WHEN  Gender = 1  THEN 'male '
WHEN  Gender = 0  THEN 'female' 
ELSE NULL
END
	Gender,
    Email,
    Phone_Number,
     [dbo].[AgeInfo](Date_of_Birth) as Age 
FROM 
	CustomerInfo   
 GO

 --ALTER TABLE Customers1  Rename To CustomerInfo ;   
 
  SELECT * FROM CustomerDetails

--5.	DML Query - Find the Customers who never ordered a product named Hard Disk using LEFT OUTER JOIN. The query should not use subquery.

SELECT 
	C.FirstName,
	C.LastName,
	od.ProductName,
	od.OrderId
FROM
	Customers C 
	LEFT OUTER JOIN Orders O ON C.CustomerId = O.CustomerId 
	LEFT OUTER JOIN OrderDetails OD ON O.OrderId = OD.OrderId and ProductName != 'Hard Disk'
WHERE 
	od.OrderId  is not null

select * from OrderDetails where OrderId = 10007

select 
distinct
	o.OrderId,
	od.ProductName 
from 
	Orders o
	left outer join OrderDetails od on o. OrderId = od.OrderId 
where 
	od.ProductName != 'Hard Disk'
--group by o.OrderId

SELECT C.CustomerID , C.FirstName,C.LastName 
    FROM Customers C 
    WHERE NOT EXISTS(SELECT O.CustomerID FROM Orders O 
                    JOIN OrderDetails OD 
                    ON O.OrderID =OD.OrderID
                    WHERE c. CustomerID =O.CustomerID  and ProductName ='Hard disk')
					
					--select * from OrderDetails where OrderDetailsId = 100010
--select * from OrderDetails where OrderDetailsId = 100023


--6.	DML Query - Get the customers First Name, Last Name and the date on which they ordered the Mouse first time

SELECT
TOP 1
	FirstName,
	LastName,
	MIN(CONVERT(DATE,OrderDate)) AS DATE
FROM 
	Customers C
	JOIN Orders O on c.CustomerId = O.CustomerId
	JOIN OrderDetails od on O.OrderId = OD.OrderId
WHERE
	ProductName = 'Mouse'
GROUP BY 
	FirstName,
	LastName,
	OrderDate
ORDER BY
	MIN(OrderDate)

--7.	Stored Procedure - Create a stored procedure to create a customer
--INSERTING DATA IN SINGLE PROCEDURE FOR BOTH TABLES

GO
  ALTER PROCEDURE CreateCustomer
		@FirstName VARCHAR(100),
         @LastName VARCHAR(100) ,
        @Address1 VARCHAR(100),
		@Address2 VARCHAR(100),
        @City VARCHAR(50),
         @State VARCHAR(50),
         @ZipCode VARCHAR(5),
         @Gender BIT,
         @Date_of_Birth DATETIME,
         @Email VARCHAR(50),
         @Phone_Number BIGINT   
AS
INSERT INTO CustomerInfo(
		FirstName,
         LastName,
         Gender, 
         Date_of_Birth,
         Email,
         Phone_Number )  
 VALUES (
		@FirstName,
		@LastName,
		@Gender,
		@Date_of_Birth,
		@Email,
		@Phone_Number
 )
 DECLARE @CustomerId BIGINT 
 SET @CustomerId = (SELECT TOP 1 CustomerID FROM CustomerInfo ORDER BY CustomerID DESC)
 INSERT INTO CustomerAddress(
			CustomerID,
            Address1,
            Address2 ,
            State,
            City,
            ZipCode)
VALUES (
		@CustomerId,
	     @Address1,
		 @Address2,
		 @State,
		 @City,
		 @ZipCode
		 )
go
		
	EXECUTE CreateCustomer 
	'aakash','chetty','add1','add2','chennai','triplicane',98987,1,'1998-04-11','aakashchetty54@gmail',1212121212
go
        select * from CustomerAddress
		select * from CustomerInfo

--InLine Table Functions
GO
CREATE FUNCTION CustomersByGender(@Gender BIT)
RETURNS Table
AS
RETURN (SELECT CustomerId,FirstName,Gender FROM Customers where Gender = @Gender)
GO

SELECT * FROM [dbo].[CustomersByGender] (0)

--INLINE BY JOINS

SELECT C.FirstName,C.Gender,CA.City FROM [dbo].[CustomersByGender](1) C
JOIN CustomerAddress CA ON C.CustomerID = CA.CustomerID







    
 
 
 ------------------------------------------ PHASE - 4 -----------------------------------------------------------
 
 CREATE TABLE Products(
 ProductId BIGINT NOT NULL PRIMARY KEY IDENTITY(101,1),
 ProductName VARCHAR(50) NOT NULL,
 ProductCategoryName VARCHAR(50))

 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('Hard Disk','Computer Peripherals')
 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('KeyBoard','Computer Peripherals')
 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('Monitor','Computer Peripherals')
 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('i3 processor','Computer Processors')
 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('i5 processor','Computer Processors')
 INSERT INTO Products (ProductName,ProductCategoryName ) VALUES ('i7 processor','Computer Processors')
 
 SELECT * FROM Products P
 SELECT * FROM  OrderDetails

INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i3 processor',1,60000,10003)
INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i5 processor',1,60000,10005)
INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i7 processor',1,60000,10008)
INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i3 processor',1,60000,10003)
INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i5 processor',1,60000,10005)
INSERT INTO OrderDetails(ProductName,Quantity,Price,OrderId) VALUES('i7 processor',1,60000,10008)
 
 ALTER TABLE
	OrderDetails 
 ADD 
	ProductID BIGINT FOREIGN KEY REFERENCES Products(ProductID) NULL 
 
 --BULK UPDATE
 UPDATE
	OrderDetails 
SET 
	ProductId = P.ProductId 
 FROM
	OrderDetails OD 
	INNER JOIN Products P ON OD.ProductName = P.ProductName 

 UPDATE OrderDetails SET ProductName = 'KeyBoard' WHERE ProductName ='KeyBoard and Monitor'
 UPDATE OrderDetails SET ProductName = 'Monitor' WHERE ProductName ='Router' 
 UPDATE OrderDetails SET ProductName = 'i3 Processor' WHERE ProductName ='Controller' 
 UPDATE OrderDetails SET ProductName = 'i5 Processor' WHERE ProductName ='Mouse' 
 UPDATE OrderDetails SET ProductName = 'Monitor' WHERE ProductName ='Laptop' 
 UPDATE OrderDetails SET ProductName = 'i7 Processor' WHERE ProductName ='Printer' 
 UPDATE OrderDetails SET ProductName = 'Monitor' WHERE ProductName ='MotherBox' 

 --	Alter the column productid as not-null column

 ALTER TABLE OrderDetails 
 ALTER COLUMN ProductID BIGINT NOT NULL

 select * from Customers

/* ----- REFFERENCES
ALTER TABLE 
	Customers
ADD 
	Created_By_User1 VARCHAR(50),
    Created_Date1 DATETIME default getdate(),
    Modified_Date1 DATETIME,
    Modified_By1 VARCHAR(50);

	
	alter table  Customers drop column  Created_By_User1,Modified_Date1


	--we cant alter more than one column
ALTER TABLE 
	Customers
alter column
	--Created_By_User VARCHAR(50)not null,
    Created_Date DATETIME not null
	*/
    

UPDATE
	Products
set 
	Created_By_User ='Aakash',
	Created_Date = GETDATE()-1,
	Modified_By ='Robin',
	Modified_Date = GETDATE()

select * from Customers
select * from CustomerAddress
select * from CustomerInfo
select * from OrderDetails
select * from Orders
select * from Products

ALTER TABLE 
	Customers
ADD 
	Created_By_User VARCHAR(50),
    Created_Date DATETIME,
    Modified_Date DATETIME ,
    Modified_By VARCHAR(50);

ALTER TABLE 
	CustomerAddress
ADD 
	Created_By_User VARCHAR(50),
    Created_Date DATETIME,
    Modified_Date DATETIME ,
    Modified_By VARCHAR(50);

ALTER TABLE 
	OrderDetails
ADD 
	Created_By_User VARCHAR(50),
    Created_Date DATETIME,
    Modified_Date DATETIME ,
    Modified_By VARCHAR(50);

ALTER TABLE 
	Orders
ADD 
	Created_By_User VARCHAR(50),
    Created_Date DATETIME,
    Modified_Date DATETIME ,
    Modified_By VARCHAR(50);
 
ALTER TABLE 
	Products
ADD 
	Created_By_User VARCHAR(50),
    Created_Date DATETIME,
    Modified_Date DATETIME ,
    Modified_By VARCHAR(50);

	select * from Customers
	select * from CustomerInfo
	select * from Orders
	select * from CustomerAddress
	select * from OrderDetails
	select * from Products


	--------------------------------- PHASE - 6  -------------------------------------------------------------

	USE [Shopping_Cart]
GO
IF OBJECT_ID('Customers', 'U') IS NOT NULL
BEGIN
PRINT 'Table exists.'
END
ELSE
BEGIN
PRINT 'Table does not exist.'
END



IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA .TABLES  WHERE TABLE_NAME  = 'Customers')
BEGIN 
CREATE TABLE Customers(
    CustomerID  BIGINT    IDENTITY(1001,1)PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(500),
    ZipCode VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)    
)    
PRINT 'Table Customers Successfully Created'
END
ELSE
BEGIN
PRINT 'Table Customers Already Exists'
END



IF  EXISTS (select * from sys.VIEWS where  Name = 'CustomerDetails'  and type = 'V')
DROP VIEW CustomerDetails
/*BEGIN
PRINT 'VIEW ALREADY EXISTS'
END
ELSE 
BEGIN
PRINT 'VIEW CREATED'
END
*/



--go
--CREATE VIEW [CustomerDetails] 
--AS 
--SELECT
--	FirstName,
--    LastName ,
--    Date_of_Birth ,
--CASE 
--WHEN  Gender = 1  THEN 'male '
--WHEN  Gender = 0  THEN 'female' 
--ELSE NULL
--END
--	Gender,
--    Email,
--    Phone_Number,
--     [dbo].[AgeInfo](Date_of_Birth) as Age 
--FROM 
--	CustomerInfo 
--GO
--PRINT 'View CustomerDetails Created Sucessfully '

--PRINT 'View CustomerDetails Already Exists'

--GO

IF OBJECT_ID('CustomerDetails', 'V') IS NOT NULL

    DROP VIEW CustomerDetails
GO
	CREATE VIEW [CustomerDetails] 
	AS 
	SELECT
		FirstName,
		LastName ,
		Date_of_Birth ,
	CASE 
	WHEN  Gender = 1  THEN 'male '
	WHEN  Gender = 0  THEN 'female' 
	ELSE NULL
	END
		Gender,
		Email,
		Phone_Number,
		 [dbo].[AgeInfo](Date_of_Birth) as Age 
	FROM 
		CustomerInfo
GO
 
SELECT * FROM [CustomerDetails]

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'CUSTOMERSINFO')
DROP PROCEDURE CUSTOMERSINFO
GO
  CREATE PROCEDURE CUSTOMERSINFO
  AS
  SELECT firstname,
         lastname,
         address1,
         city,
         state,
         zipcode,
         CASE 
         WHEN  Gender = 1  THEN 'male '
         WHEN  Gender = 0  THEN 'female' 
         ELSE NULL
         END    
         date_of_birth,
         email,
         phone_number    
         from CustomerInfo 
         JOIN CustomerAddress 
         ON CustomerInfo.CustomerID =CustomerAddress.CustomerID 
GO

EXECUTE [dbo].[CUSTOMERSINFO]


IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[dbo].[CustomersByGender]')
                  AND type IN ( N'FN', N'IF', N'TF', N'FS', N'FT' ))
 select 'function exists 1'





IF   EXISTS (SELECT * 
           FROM sys.foreign_keys 
           WHERE object_id = OBJECT_ID(N'CustomerID') 
             AND parent_object_id = OBJECT_ID(N'Orders'))
 CREATE TABLE Orders(
 OrderID BIGINT IDENTITY (10001,1)PRIMARY KEY,
 OrderDate DATETIME,
 CustomerID BIGINT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
 )

 
SELECT
	o.OrderId,
	o.OrderDate
FROM 
	Orders  as O
WHERE 
	NOT EXISTS(SELECT
					O.OrderId 
		       FROM
					Orders 
                    JOIN OrderDetails OD  ON	O.OrderID =OD.OrderID
               WHERE 
					o.OrderId = od.OrderId and  ProductName ='Monitor')

select * from Orders o inner join OrderDetails od on o.OrderId = od.OrderId where od.ProductName = 'Monitor'
select * from Orders
select * from OrderDetails
select * from Products

select
	o.OrderId,
	o.OrderDate,
	od.ProductName
from
	Orders o
	inner join OrderDetails od on o.OrderId = od.OrderId
where 
	od.ProductName = 'Keyboard'
order by 
	o.OrderDate


select
	o.OrderId,
	od.ProductName
from 
	Orders o
	inner join OrderDetails od on o.OrderId = od.OrderId
where
	od.ProductName = 'Hard Disk'
order by 
	o.OrderDate desc

SELECT
	o.OrderID,
	o.orderDate,
	p.ProductCategoryName,'Internal Procressor'as processor
FROM  
	OrderDetails od
    JOIN Products  p ON od.ProductID  =p.productID  
    JOIN Orders o  ON od.OrderID  =o.OrderID  
WHERE
	p.ProductCategoryName ='Computer processors'

   select * from CustomerInfo

go
CREATE PROCEDURE  SP_TRANSACTIONS(@Email VARCHAR(100),@CustomerID INT)
AS
BEGIN 
BEGIN TRY 
BEGIN TRANSACTION
UPDATE
	CustomerInfo
SET 
	Email=@Email   
WHERE
	CustomerID = @CustomerID
COMMIT TRANSACTION 
END TRY
BEGIN CATCH 
ROLLBACK TRANSACTION
END CATCH
END

execute SP_TRANSACTIONS AAKASHchetty54@gmail,1012


SELECT 
	CONVERT(datetime, 
	SWITCHOFFSET(CONVERT(DATETIMEOFFSET, Orderdate), 
	DATENAME(TZOFFSET, SYSDATETIMEOFFSET()))) 
AS 
	UTC_Date_Time
FROM 
	Orders



select * from CustomerInfo
select * from CustomerAddress
select * from OrderDetails
select * from Products

GO
CREATE PROCEDURE SP_PRODUCTSTABLE
@PRODUCTNAME VARCHAR(50)
AS
BEGIN
	SELECT * FROM Products WHERE 
	(ProductName = @PRODUCTNAME )
END
GO
EXECUTE SP_PRODUCTSTABLE 'KeyBoard'

GO

  DECLARE @SQL nvarchar(1000)    
    DECLARE @PRODUCTID varchar(50)
    SET @PRODUCTID = '102'
    SET @SQL = 'SELECT ProductID,PRODUCTNAME,ProductCategoryName FROM PRODUCTS where ProductID = '+ @PRODUCTID
    EXEC (@SQL)

	select * from Products

/*
GO
ALTER PROCEDURE SP_INSERTUPDATE
	
         @Address1 VARCHAR(100),
		 @Address2 VARCHAR(100),
         @State VARCHAR(50),
		 @City VARCHAR(50),
         @ZipCode VARCHAR(5),
		 @CustomerID bigint,
         @Created_By_User VARCHAR(50),
         @Modified_By VARCHAR(50)
AS
BEGIN
IF  EXISTS (SELECT * FROM CustomerAddress  WHERE CustomerID = @CustomerID)
UPDATE CustomerAddress
SET Address1 = @Address1,Address2 = @Address2,State = @State,City = @City,ZipCode = @ZipCode,
	 Modified_Date = getdate(),Modified_By = @Modified_By
WHERE CustomerID = @CustomerID
ELSE
INSERT INTO CustomerAddress(Address1,Address2,State,City,ZipCode,CustomerID,Created_By_User,Created_Date)
VALUES(@Address1,@Address2,@State,@City,@ZipCode,@CustomerID,@Created_By_User,Getdate())
END

exec dbo.SP_INSERTUPDATE
'add1','add2','triplicane','chennai',98987,1014,'Monish','Aakash'
 
 delete from CustomerAddress where Modified_By = 'Aakash'
 */

 GO
CREATE PROCEDURE [dbo].[SP_INSERTUPDATE]
	
@OrderDetailsId BIGINT,
@ProductName VARCHAR(50),
@Quantity INT ,
@Price DECIMAL ,
@OrderId BIGINT, 
@ProductId INT,
@Created_By_User VARCHAR(50),
@Modified_By VARCHAR(50)
AS
BEGIN
IF  EXISTS (SELECT * FROM OrderDetails  WHERE OrderDetailsId = @OrderDetailsId)
UPDATE
	OrderDetails
SET 
	ProductName = @ProductName,
	Quantity = @Quantity,
	Price = @Price,
	OrderId = @OrderId,
	ProductID = @ProductId,
	Modified_Date = getdate(),
	Modified_By = @Modified_By
WHERE 
	OrderDetailsId = @OrderDetailsId
ELSE
INSERT INTO OrderDetails
		(OrderDetailsId,
		ProductName,
		Quantity,
		Price,
		OrderId,
		ProductID,
		Created_By_User,
		Created_Date)
VALUES
		(@OrderDetailsId,
		@ProductName,
		@Quantity,
		@Price,
		@OrderId,
		@ProductId,
		@Created_By_User,
		Getdate())
END

EXECUTE [dbo].[SP_INSERTUPDATE] 100035,'i7Processor',1,'100',10008,106,'procedure','Aakash'


select * from OrderDetails where OrderId=10008

---TURN OFF IDENTITY
set  
identity_insert OrderDetails on

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'OrderDate'
          AND Object_ID = Object_ID(N'schemaName.Orders'))
BEGIN
   PRINT 'Column Exists'
END

select * from CustomerAddress
select * from CustomerInfo
select * from OrderDetails
select * from Orders
select * from Products

