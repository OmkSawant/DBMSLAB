-- Step 1: Create the Tables

CREATE TABLE s1 (
    roll INT PRIMARY KEY,
    name VARCHAR(50),
    sub1 INT,
    sub2 INT,
    percentage DECIMAL(5,2) -- For storing calculated percentage
);

CREATE TABLE s2 (
    roll INT,
    name VARCHAR(50)
);

-- Step 2: Insert Initial Data into s1 (for Testing)

INSERT INTO s1 (roll, name, sub1, sub2) VALUES
(1, 'Alice', 80, 90),
(2, 'Bob', 70, 85);

-- Step 3: Set up Triggers

-- Setting up delimiter
DELIMITER $

-- Trigger t1: After Insert on s1, insert roll and name into s2
CREATE TRIGGER t1 AFTER INSERT ON s1 
FOR EACH ROW
BEGIN
    INSERT INTO s2 VALUES (NEW.roll, NEW.name);
END;
$

-- Trigger t2: After Update on s1, insert new roll and old name into s2
CREATE TRIGGER t2 AFTER UPDATE ON s1 
FOR EACH ROW
BEGIN
    INSERT INTO s2 VALUES (NEW.roll, OLD.name);
END;
$

-- Trigger t3: After Delete on s1, insert old roll and old name into s2
CREATE TRIGGER t3 AFTER DELETE ON s1 
FOR EACH ROW
BEGIN
    INSERT INTO s2 VALUES (OLD.roll, OLD.name);
END;
$

-- Trigger t4: Before Insert on s1, calculate percentage
CREATE TRIGGER t4 BEFORE INSERT ON s1 
FOR EACH ROW
BEGIN
    SET NEW.percentage = ((NEW.sub1 + NEW.sub2) * 100) / 200;
END;
$

-- Trigger t5: Before Insert on s1, check and modify roll number
CREATE TRIGGER t5 BEFORE INSERT ON s1 
FOR EACH ROW
BEGIN
    IF NEW.roll = 11 THEN 
        SET NEW.roll = 1;
    END IF;
    INSERT INTO s2 VALUES (NEW.roll, NEW.name);
END;
$

-- Trigger p2: Before Update on s1, set roll to 49 if roll < 50
CREATE TRIGGER p2 BEFORE UPDATE ON s1 
FOR EACH ROW
BEGIN
    IF NEW.roll < 50 THEN
        SET NEW.roll = 49;
    END IF;
END;
$

-- Reset delimiter to default
DELIMITER ;

-- Step 4: Testing the Triggers

-- Inserting a new row (Trigger t1 and t4 should activate)
INSERT INTO s1 (roll, name, sub1, sub2) VALUES (11, 'Charlie', 78, 92);

-- Updating a row (Trigger t2 and p2 should activate)
UPDATE s1 SET roll = 30, name = 'Alice Updated' WHERE roll = 1;

-- Deleting a row (Trigger t3 should activate)
DELETE FROM s1 WHERE roll = 2;

-- Step 5: Verify Results

-- Check contents of s1
SELECT * FROM s1;

-- Check contents of s2
SELECT * FROM s2;
