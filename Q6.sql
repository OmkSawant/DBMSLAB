-- Doctor Table
CREATE TABLE Doctor (
    Doctor_no INT PRIMARY KEY,
    Doctor_name VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50)
);

-- Hospital Table
CREATE TABLE Hospital (
    Hospital_no INT PRIMARY KEY,
    Name VARCHAR(100),
    Street VARCHAR(100),
    City VARCHAR(50)
);

-- Doc_Hosp Table
CREATE TABLE Doc_Hosp (
    Doctor_no INT,
    Hospital_no INT,
    Date DATE,
    FOREIGN KEY (Doctor_no) REFERENCES Doctor(Doctor_no),
    FOREIGN KEY (Hospital_no) REFERENCES Hospital(Hospital_no)
);

-- Sample data for Doctor table
INSERT INTO Doctor (Doctor_no, Doctor_name, Address, City) VALUES
(1, 'Dr. Joshi', '123 Street A', 'Pune'),
(2, 'Dr. Sharma', '456 Street B', 'Mumbai'),
(3, 'Dr. Kapoor', '789 Street C', 'Pune');

-- Sample data for Hospital table
INSERT INTO Hospital (Hospital_no, Name, Street, City) VALUES
(101, 'Shree Clinic', 'Main St', 'Pune'),
(102, 'City Hospital', 'Central Ave', 'Mumbai'),
(103, 'Health Care Center', 'Market Rd', 'Pune');

-- Sample data for Doc_Hosp table
INSERT INTO Doc_Hosp (Doctor_no, Hospital_no, Date) VALUES
(1, 101, '2023-03-01'),
(1, 103, '2023-03-05'),
(2, 102, '2023-03-01'),
(3, 101, '2023-03-02'),
(1, 101, '2023-03-01'); -- Example of a visit for Dr. Joshi at Shree Clinic


--Queries
SELECT d.Doctor_no, d.Doctor_name, d.Address, d.City, h.Name AS Hospital_Name
FROM Doc_Hosp dh
JOIN Doctor d ON dh.Doctor_no = d.Doctor_no
JOIN Hospital h ON dh.Hospital_no = h.Hospital_no;

SELECT DISTINCT d.Doctor_no, d.Doctor_name, d.City
FROM Doc_Hosp dh
JOIN Doctor d ON dh.Doctor_no = d.Doctor_no
JOIN Hospital h ON dh.Hospital_no = h.Hospital_no
WHERE d.City = h.City;

SELECT h.Name AS Hospital_Name
FROM Doc_Hosp dh
JOIN Doctor d ON dh.Doctor_no = d.Doctor_no
JOIN Hospital h ON dh.Hospital_no = h.Hospital_no
WHERE d.Doctor_name = 'Dr. Joshi';

SELECT COUNT(DISTINCT dh.Doctor_no) AS Doctor_Count
FROM Doc_Hosp dh
JOIN Hospital h ON dh.Hospital_no = h.Hospital_no
WHERE h.Name = 'Shree Clinic' AND dh.Date = '2023-03-01';

SELECT COUNT(*) AS Visit_Count
FROM Doc_Hosp dh
JOIN Doctor d ON dh.Doctor_no = d.Doctor_no
JOIN Hospital h ON dh.Hospital_no = h.Hospital_no
WHERE d.Doctor_name = 'Dr. Joshi' AND h.Name = 'Shree Clinic';
