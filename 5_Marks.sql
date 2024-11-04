CREATE DATABASE pract5;

USE pract5;

CREATE TABLE IF NOT EXISTS Stud_Marks (
    name VARCHAR(255),
    total_marks INT
);

CREATE TABLE IF NOT EXISTS Result (
    Roll INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Class VARCHAR(50)
);

INSERT INTO Stud_Marks (name, total_marks) VALUES
    ('Om', 1450),
    ('Manav', 950),
    ('Kartik', 875),
    ('Aryaan', 800);

--The proc_Grade procedure will categorize students based on their marks.
DELIMITER //

CREATE PROCEDURE proc_Grade (
    IN student_name VARCHAR(255),
    IN total_marks INT
)
BEGIN
    DECLARE grade_class VARCHAR(50);

    -- Determine grade category based on total marks
    IF total_marks BETWEEN 990 AND 1500 THEN
        SET grade_class = 'Distinction';
    ELSEIF total_marks BETWEEN 900 AND 989 THEN
        SET grade_class = 'First Class';
    ELSEIF total_marks BETWEEN 825 AND 899 THEN
        SET grade_class = 'Higher Second Class';
    ELSE
        SET grade_class = 'No Category';
    END IF;

    -- Insert result into Result table
    INSERT INTO Result (Name, Class) VALUES (student_name, grade_class);
END //

DELIMITER ;

--The following SQL block fetches each student's data from Stud_Marks, calls proc_Grade to categorize them, and stores the result in Result.
DELIMITER //

CREATE PROCEDURE categorize_students()
BEGIN
    DECLARE student_name VARCHAR(255);
    DECLARE total_marks INT;
    DECLARE done INT DEFAULT 0;
    DECLARE stud_cursor CURSOR FOR SELECT name, total_marks FROM Stud_Marks;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open cursor to process each student
    OPEN stud_cursor;
    read_loop: LOOP
        FETCH stud_cursor INTO student_name, total_marks;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Call the procedure with the student's data
        CALL proc_Grade(student_name, total_marks);
    END LOOP;

    -- Close cursor
    CLOSE stud_cursor;
END //

DELIMITER ;

CALL categorize_students();

SELECT * FROM Result;
