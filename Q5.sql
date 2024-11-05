-- Employee Table
CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    name VARCHAR(50),
    skill VARCHAR(50),
    pay_rate INT
);

-- Position Table
CREATE TABLE Position (
    posting_no INT PRIMARY KEY,
    skill VARCHAR(50)
);

-- Duty-allocation Table
CREATE TABLE Duty_allocation (
    posting_no INT,
    emp_no INT,
    day DATE,
    shift VARCHAR(50),
    FOREIGN KEY (posting_no) REFERENCES Position(posting_no),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

-- Sample data for Employee table
INSERT INTO Employee (emp_no, name, skill, pay_rate) VALUES 
(101, 'Bhushan', 'Programming', 300),
(102, 'AHIRE', 'Management', 200),
(103, 'John', 'Design', 250),
(1001, 'Alice', 'Programming', 150);

-- Sample data for Position table
INSERT INTO Position (posting_no, skill) VALUES 
(1, 'Programming'),
(2, 'Management');

-- Sample data for Duty_allocation table
INSERT INTO Duty_allocation (posting_no, emp_no, day, shift) VALUES 
(1, 101, '2003-04-01', 'Morning'),
(1, 101, '2003-04-02', 'Evening'),
(2, 102, '2003-04-01', 'Night'),
(1, 103, '2003-04-01', 'Morning');

--Queries
SELECT * FROM Duty_allocation 
WHERE emp_no = 101 
  AND MONTH(day) = 4 
  AND YEAR(day) = 2003;

SELECT da.day, da.shift 
FROM Duty_allocation da
JOIN Employee e ON da.emp_no = e.emp_no
WHERE e.name = 'Bhushan';

SELECT e1.name, e1.pay_rate
FROM Employee e1
WHERE e1.pay_rate >= (SELECT pay_rate FROM Employee WHERE name = 'AHIRE');

SELECT e1.name, e1.pay_rate
FROM Employee e1
WHERE e1.emp_no < 1000 
  AND e1.pay_rate > (SELECT MIN(e2.pay_rate) 
                     FROM Employee e2 
                     WHERE e2.emp_no >= 1000);

SELECT name, pay_rate 
FROM Employee 
WHERE pay_rate = (SELECT MIN(pay_rate) FROM Employee);
