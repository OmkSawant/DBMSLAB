create table marks(
	roll_no int,
	name varchar(20),
	total_marks varchar(20)
);
create table result(
	roll_no int,
	name varchar(20),
	class varchar(20)
);

INSERT INTO marks (roll_no, name, total_marks) VALUES
(1, 'Abhishek', 1400),
(2, 'Karan', 980),
(3, 'Baliram', 880),
(4, 'Vishwa', 820),
(5, 'Amit', 740),
(6, 'Shrinath', 640);

DROP PROCEDURE IF EXISTS proc_result;
DROP FUNCTION IF EXISTS final_result;

delimiter //
create procedure proc_result(in marks int, out class char(20))
begin

IF (marks >= 990 AND marks < 1500) THEN
SET class = 'Distinction';


ELSEIF (marks >= 900 AND marks < 989) THEN
SET class = 'First Class';


ELSEIF (marks >= 825 AND marks < 899) THEN
SET class = 'Higher Second Class';

ELSE
SET class = 'Fail';

END IF;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION final_result(R1 INT)
RETURNS CHAR(20)
DETERMINISTIC

BEGIN
DECLARE fmarks INT;
DECLARE grade CHAR(20);

SELECT total_marks INTO fmarks FROM marks WHERE roll_no = R1;

CALL proc_result(fmarks, grade);

RETURN grade;
END //
DELIMITER ;

SELECT roll_no, name, final_result(roll_no) AS class FROM marks;
