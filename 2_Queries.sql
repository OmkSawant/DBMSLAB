CREATE DATABASE pract2;

USE pract2;

CREATE TABLE Department (
  DeptId INT NOT NULL AUTO_INCREMENT,
  DeptName VARCHAR(45),
  PRIMARY KEY (DeptId)
);

CREATE TABLE Employee (
  EmpId INT NOT NULL AUTO_INCREMENT,
  DeptId INT,
  EmpName VARCHAR(45),
  EmpSalary INT,
  EmpDesignation VARCHAR(45),
  PRIMARY KEY (EmpId),
  FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

SHOW TABLES;

INSERT INTO Department (DeptName) VALUES 
('HR'),
('IT'),
('Finance'),
('Marketing');

INSERT INTO Employee (DeptId, EmpName, EmpSalary, EmpDesignation) VALUES 
(1, 'John Doe', 50000, 'HR Manager'),
(2, 'Jane Doe', 60000, 'Software Developer'),
(3, 'Alice', 70000, 'Finance Manager'),
(4, 'Bob', 80000, 'Marketing Manager');


CREATE INDEX EmpNameIndex ON Employee(EmpName);

CREATE VIEW EmployeeView AS SELECT EmpName, EmpSalary FROM Employee;

-- DML QUERIES

-- 1. Select all employees
SELECT * FROM Employee;

-- 2. Select all departments
SELECT * FROM Department;

-- 3. Select employees with salary greater than 60000
SELECT EmpName, EmpSalary FROM Employee WHERE EmpSalary > 60000;

-- 4. Update salary of 'John Doe' to 55000
UPDATE Employee SET EmpSalary = 55000 WHERE EmpName = 'John Doe';

-- 5. Delete employee 'Bob'
DELETE FROM Employee WHERE EmpName = 'Bob';

-- 6. Insert a new employee
INSERT INTO Employee (DeptId, EmpName, EmpSalary, EmpDesignation) VALUES (2, 'Charlie', 65000, 'System Analyst');

-- 7. Select employees from 'IT' department
SELECT EmpName, EmpDesignation FROM Employee WHERE DeptId = (SELECT DeptId FROM Department WHERE DeptName = 'IT');

-- 8. Increase salary of all employees by 10%
UPDATE Employee SET EmpSalary = EmpSalary * 1.10;

-- 9. Select employees and their department names
SELECT E.EmpName, D.DeptName FROM Employee E JOIN Department D ON E.DeptId = D.DeptId;

-- 10. Select the highest salary in the company
SELECT MAX(EmpSalary) AS HighestSalary FROM Employee;
