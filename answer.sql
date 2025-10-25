-- Create the database
CREATE DATABASE IF NOT EXISTS student_records_db;
USE student_records_db;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS CourseAssignments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;

-- Create Students table
CREATE TABLE Students (
    student_id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female') NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id)
);

-- Create Instructors table
CREATE TABLE Instructors (
    instructor_id INT(11) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    PRIMARY KEY (instructor_id)
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT(11) NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    credits INT(11) NOT NULL,
    PRIMARY KEY (course_id)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT(11) NOT NULL AUTO_INCREMENT,
    student_id INT(11) NOT NULL,
    course_id INT(11) NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(2),
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create CourseAssignments table
CREATE TABLE CourseAssignments (
    assignment_id INT(11) NOT NULL AUTO_INCREMENT,
    instructor_id INT(11) NOT NULL,
    course_id INT(11) NOT NULL,
    semester VARCHAR(10),
    year YEAR(4),
    PRIMARY KEY (assignment_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert sample data into Students
INSERT INTO Students (first_name, last_name, gender, date_of_birth, email, phone_number, enrollment_date) VALUES
('Alice', 'Otieno', 'Female', '2002-03-12', 'alice.otieno@example.com', '0712345678', '2024-09-01'),
('Brian', 'Mwangi', 'Male', '2001-07-25', 'brian.mwangi@example.com', '0723456789', '2024-09-01'),
('Cynthia', 'Kiptoo', 'Female', '2003-01-19', 'cynthia.kiptoo@example.com', '0734567890', '2024-09-01');

-- Insert sample data into Instructors
INSERT INTO Instructors (first_name, last_name, email, phone_number) VALUES
('David', 'Mutua', 'david.mutua@example.com', '0701111222'),
('Eunice', 'Kamau', 'eunice.kamau@example.com', '0703333444');

-- Insert sample data into Courses
INSERT INTO Courses (course_name, course_code, credits) VALUES
('Database Systems', 'CS101', 3),
('Web Development', 'CS102', 4),
('Data Structures', 'CS103', 3);

-- Insert sample data into CourseAssignments
INSERT INTO CourseAssignments (instructor_id, course_id, semester, year) VALUES
(1, 1, 'Fall', 2024),
(2, 2, 'Fall', 2024),
(1, 3, 'Spring', 2025);

-- Insert sample data into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2024-09-01', 'A'),
(2, 2, '2024-09-02', 'B'),
(3, 3, '2024-09-03', 'A'),
(1, 2, '2024-09-04', 'B');
