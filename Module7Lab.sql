--Module 7 Lab SQL Queries
--Step 4
-- Shippers table.
SELECT * FROM Shippers;

-- Customers table. 
SELECT ContactName, Country, Phone FROM Customers
ORDER BY Country, ContactName LIMIT 5;

-- Orders table.
SELECT CustomerID, OrderDate, ShipCity FROM Orders
WHERE CustomerID = 'ALFKI';

-- Joined CompanyName and Orders on CustomerID for Quick-Stop.
SELECT c.CompanyName, o.OrderDate FROM Customers AS c
JOIN Orders as o ON c.CustomerID = o.CustomerID
WHERE c.CompanyName = 'QUICK-Stop' LIMIT 5;

-- Adds a row to Customers table. 
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country)
VALUES ('ALICE', 'Alice Johnson', 'Wonderful Widgets', 'USA');

-- Checks the new record
SELECT * FROM Customers WHERE CustomerID = 'ALICE';

-- Updates ALFKI row in Customers table. 
UPDATE Customers SET ContactName = 'Maria Anders' 
WHERE CustomerID = 'ALFKI';

-- Checks the new record.
SELECT CustomerID, ContactName from Customers 
WHERE CustomerID = 'ALFKI';

-- Removes a record from the Customers table
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country)
VALUES ('TEMP1', 'Tom Temp', 'Temporary Traders', 'USA');

--Checks the new temp record
SELECT * FROM Customers WHERE CustomerID = 'TEMP1';

-- Deletes the new Temporary customer.
DELETE FROM Customers WHERE CustomerID = 'TEMP1';

-- Checks the new temp record was deleted. 
SELECT * FROM Customers WHERE CustomerID = 'TEMP1';