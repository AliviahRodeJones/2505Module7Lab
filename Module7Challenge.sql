-- Module 7 Coding Challenge
-- Task 1
SELECT CompanyName, Phone FROM Shippers;

-- Task 2
SELECT CompanyName, City, Country FROM customers 
ORDER BY City LIMIT 5;

-- Task 3
SELECT OrderID, OrderDate, ShipCity FROM Orders
WHERE CustomerID = 'ANATR';

-- Task 4
SELECT c.CompanyName, o.OrderDate FROM Customers AS c 
JOIN Orders AS o ON c.CustomerID = o.CustomerID 
WHERE c.CompanyName = 'Around the Horn' LIMIT 5;

-- Task 5
DELETE FROM Customers WHERE CustomerID = 'STUD1';
-- Deletes the row with the ID STUD1

INSERT INTO Customers (CustomerID, ContactName, Companyname, Country)
VALUES ('STUD1', 'Aliviah Rode-Jones', 'My Company', 'USA');
-- Inserts a new row into the customers table. 

SELECT * FROM Customers WHERE CustomerID = 'STUD1';
-- Tests the new row was inserted. 

-- Task 6
UPDATE Customers SET Phone = '555-0100'
WHERE CustomerID = 'STUD1';
-- Updates a row in the database with the STUD1 ID. 

SELECT CustomerID, ContactName, Phone FROM Customers 
WHERE CustomerID = 'STUD1';
-- Checks the data was updated correctly. 

-- Task 7
DELETE FROM Customers WHERE CustomerID = 'STUD1';
-- Deletes the 'STUD1' row.
SELECT * FROM Customers WHERE CustomerID = 'STUD1';
-- Checks that the 'STUD1' value was deleted.
