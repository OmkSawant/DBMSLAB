CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE,
    position VARCHAR(50)
);

INSERT INTO Employee (employee_id, first_name, last_name, department, salary, hire_date, position)
VALUES 
    (1, 'John', 'Doe', 'IT', 60000, '2021-05-15', 'Software Engineer'),
    (2, 'Jane', 'Smith', 'HR', 55000, '2020-03-10', 'HR Specialist'),
    (3, 'Alex', 'Johnson', 'IT', 70000, '2019-09-22', 'DevOps Engineer'),
    (4, 'Emily', 'Davis', 'Finance', 80000, '2021-02-18', 'Analyst'),
    (5, 'David', 'Duck', 'IT', 40000, '2020-06-05', 'Software Engineer'),
    (6, 'Don', 'Dev', 'Finance', 90000, '2019-08-03', 'Developer');

SELECT * FROM Employee;

SELECT * FROM Employee WHERE department = 'IT';

SELECT department, COUNT(*) AS num_employees
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT * FROM Employee WHERE hire_date > '2021-02-01';

UPDATE Employee
SET salary = salary + 5000
WHERE department = 'IT';

SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

SELECT department, COUNT(*) AS num_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

--Highest
SELECT * FROM Employee
ORDER BY salary DESC
LIMIT 1;
--Lowest
SELECT * FROM Employee
ORDER BY salary ASC
LIMIT 1;

DELETE FROM Employee WHERE last_name = 'Dev';

