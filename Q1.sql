CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade CHAR(1),
    major VARCHAR(50)
);

INSERT INTO Student (student_id, first_name, last_name, age, grade, major) VALUES
(1, 'John', 'Doe', 20, 'A', 'Computer Science'),
(2, 'Jane', 'Smith', 21, 'B', 'Mathematics'),
(3, 'Alex', 'Johnson', 22, 'A', 'Physics'),
(4, 'Emily', 'Davis', 23, 'C', 'Biology'),
(5, 'David', 'Duck', 21, 'B', 'Mathematics'),
(6, 'Don', 'Dev', 22, 'A', 'Mathematics');


SELECT * FROM Student;

UPDATE Student
SET first_name = 'Jenne'
WHERE first_name = 'Jane' AND last_name = 'Smith';

SELECT * FROM Student
WHERE grade = 'A';

SELECT major, COUNT(*) AS student_count
FROM Student
GROUP BY major;

SELECT * FROM Student
ORDER BY age ASC;

SELECT * FROM Student
ORDER BY age DESC
LIMIT 1;

UPDATE Student
SET major = 'New Major'  -- Replace 'New Major' with the desired major
WHERE student_id = 2;

DELETE FROM Student
WHERE student_id = 6;

SELECT major, COUNT(*) AS student_count
FROM Student
WHERE grade = 'A'
GROUP BY major;

SELECT grade, COUNT(*) AS student_count
FROM Student
GROUP BY grade
HAVING COUNT(*) > 2;
