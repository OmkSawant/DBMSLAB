CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT
);

-- Insert data into Student table
INSERT INTO Student (StudentID, StudentName, CourseID) VALUES 
(1, 'Amita', 101),
(2, 'Neha', 102),
(3, 'Sagar', 103),
(4, 'Sneha', 106),
(5, 'Shubham', 105);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Insert data into Course table
INSERT INTO Course (CourseID, CourseName) VALUES 
(101, 'Physics'),
(102, 'Chemistry'),
(104, 'Biology');

-- JOIN Queries
SELECT Student.StudentID, Student.StudentName, Student.CourseID, Course.CourseName
FROM Student
INNER JOIN Course ON Student.CourseID = Course.CourseID;

SELECT Student.StudentID, Student.StudentName, Student.CourseID, Course.CourseName
FROM Student
LEFT JOIN Course ON Student.CourseID = Course.CourseID;

SELECT Student.StudentID, Student.StudentName, Student.CourseID, Course.CourseName
FROM Student
RIGHT JOIN Course ON Student.CourseID = Course.CourseID;

SELECT Student.StudentID, Student.StudentName, Student.CourseID, Course.CourseName
FROM Student
FULL OUTER JOIN Course ON Student.CourseID = Course.CourseID;

-- Creating Views
--View for Students with Course Names
CREATE VIEW StudentCourses AS
SELECT Student.StudentID, Student.StudentName, Course.CourseName
FROM Student
INNER JOIN Course ON Student.CourseID = Course.CourseID;

--View for All Students (with or without Courses)
CREATE VIEW AllStudentsWithCourses AS
SELECT Student.StudentID, Student.StudentName, Course.CourseName
FROM Student
LEFT JOIN Course ON Student.CourseID = Course.CourseID;

--View for All Courses (with or without Students)
CREATE VIEW AllCoursesWithStudents AS
SELECT Course.CourseID, Course.CourseName, Student.StudentName
FROM Course
LEFT JOIN Student ON Student.CourseID = Course.CourseID;

SELECT * FROM ViewName;
