-- Create the database
CREATE DATABASE pract3;

-- Use the database
USE pract3;

-- Create the employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Create the departments table
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Insert sample data into departments
INSERT INTO departments (id, department_name) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Finance');

-- Insert sample data into employees
INSERT INTO employees (id, name, department_id, salary) VALUES
(1, 'John Doe', 1, 50000),
(2, 'Jane Smith', 2, 60000),
(3, 'Jim Brown', 3, 70000),
(4, 'Jake White', 4, 80000),
(5, 'Jill Green', 2, 55000);
-- SQL Queries for Join, Subquery and View.

-- 1. Inner Join
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;

-- 2. Left Join
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id;

-- 3. Right Join
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.id;

-- 4. Full Outer Join
SELECT employees.name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.id;

-- 5. Subquery in SELECT
SELECT name, (SELECT department_name FROM departments WHERE id = employees.department_id) AS department_name
FROM employees;

-- 6. Subquery in WHERE
SELECT name
FROM employees
WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Sales');

-- 7. Subquery in FROM
SELECT avg_salary
FROM (SELECT AVG(salary) AS avg_salary FROM employees) AS avg_salaries;

-- 8. View Creation
CREATE VIEW employee_department AS
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;

-- 9. Using View
SELECT * FROM employee_department;

-- 10. View with Subquery
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
