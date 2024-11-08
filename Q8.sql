CREATE TABLE Borrower (
	Rollno INT(4),
	Name VARCHAR(20),
	DateofIssue DATE,
	NameofBook VARCHAR(30),
	Status VARCHAR(10)
 );

INSERT INTO Borrower VALUES
 (41, 'Abhisek', '2022-09-19', 'Operating System', 'I'),
 (05, 'Karan', '2022-07-24', 'Object Oriented Programming', 'I'),
 (23, 'Baliram', '2022-06-12', 'Microprocessor', 'I'),
 (48, 'Mayur', '2022-04-19', 'Mechanics', 'I'),
 (47, 'Sanket', '2022-05-20', 'DS', 'I'),
 (25, 'Vishwa', '2022-06-21', 'DELD', 'I');

CREATE TABLE Fine (
	Rollno INT(4),
	Date DATE,
	Amount INT(10)
 );

DELIMITER //
CREATE PROCEDURE calc_Fine(IN r INT, IN b VARCHAR(30))
BEGIN
	DECLARE doi DATE;
	DECLARE diff INT;
SELECT DateofIssue INTO doi
	FROM Borrower
	WHERE Rollno = r AND NameofBook = b;
SELECT DATEDIFF(CURDATE(), doi) INTO diff;

 IF diff >= 15 AND diff <= 30 THEN
	INSERT INTO Fine VALUES(r, CURDATE(), diff * 5);
	END IF;
 IF diff > 30 THEN
	INSERT INTO Fine VALUES(r, CURDATE(), diff * 50);
	END IF;
END //

CREATE PROCEDURE submit(IN r INT)
BEGIN
	UPDATE Borrower SET Status = 'R' WHERE Rollno = r;
	DELETE FROM Fine WHERE Rollno = r;
END //
DELIMITER ;

CALL calc_Fine(41, 'Operating System');
SELECT * FROM Fine;
CALL submit(41);
SELECT * FROM Fine;
SELECT * FROM Borrower;
