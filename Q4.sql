CREATE TABLE Employee (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    Address VARCHAR(50),
    Salary INT,
    Commission INT
);

INSERT INTO Employee (Eid, Ename, Address, Salary, Commission)
VALUES 
    (1, 'Amita', 'Pune', 35000, 5000),
    (2, 'Neha', 'Pune', 25000, NULL),
    (3, 'Sagar', 'Nasik', 28000, 2000),
    (4, 'Sneha', 'Mumbai', 19000, NULL),
    (5, 'Shubham', 'Mumbai', 25000, 3000);

CREATE TABLE Location (
    PrNo INT PRIMARY KEY,
    Addr VARCHAR(50)
);

INSERT INTO Location (PrNo, Addr)
VALUES 
    (10, 'Mumbai'),
    (20, 'Pune'),
    (30, 'Jalgaon');

--Queries
SELECT * FROM Employee WHERE Address = 'Mumbai';

SELECT * FROM Employee 
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

SELECT * FROM Employee ORDER BY Salary DESC;

SELECT Ename FROM Employee WHERE Address NOT IN ('Nasik', 'Pune');

SELECT * FROM Employee WHERE Ename LIKE '%R';

SELECT Address, COUNT(*) AS StaffCount
FROM Employee
GROUP BY Address
HAVING COUNT(*) >= 2;

SELECT Address, MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY Address;

SELECT Address, MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY Address
HAVING MAX(Salary) > 19000;

SELECT COUNT(*) AS StaffCount
FROM Employee
WHERE Address = 'Mumbai';

DELETE FROM Employee WHERE Salary > 30000;
