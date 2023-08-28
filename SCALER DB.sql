-- Create database 
CREATE DATABASE Scaler;
USE Scaler;

-- Table to store information about courses offered by Scaler
CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Category VARCHAR(50),
    DurationInMonths INT,
    Fee DECIMAL(10, 2)
);
-- Insert sample course data
INSERT INTO Courses(CourseID, CourseName, Category, DurationInMonths, Fee)
VALUES
    (1, 'Data Science Fundamentals', 'Data Science', 6, 150000.00),
    (2, 'Machine Learning Basics', 'Data Science', 4, 120000.00),
    (3, 'Advanced Python Programming', 'Programming', 3, 180000.00),
    (4, 'Big Data Analytics', 'Data Science', 5, 280000.00),
    (5, 'Introduction to Statistics', 'Mathematics', 2, 160000.00);

-- Table to store information about students enrolled in courses
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Age INT,
    CollegeName VARCHAR(100),
    EmploymentStatus VARCHAR(50)
);
-- Insert sample student data
INSERT INTO Students (StudentID, FirstName, LastName, Email, Age, CollegeName, EmploymentStatus)
VALUES
    (1, 'Rajesh', 'Kumar', 'rajesh@example.com', 22, 'ABC College', 'Student'),
    (2, 'Priya', 'Sharma', 'priya@example.com', 25, 'XYZ University', 'Working Professional'),
    (3, 'Amit', 'Verma', 'amit@example.com', 23, 'DEF Institute', 'Student'),
    (4, 'Sneha', 'Patil', 'sneha@example.com', 28, 'PQR College', 'Working Professional'),
    (5, 'Anil', 'Gupta', 'anil@example.com', 21, 'MNO University', 'Student'),
    (6, 'Kavita', 'Choudhury', 'kavita@example.com', 24, 'LMN College', 'Student'),
    (7, 'Rahul', 'Sharma', 'rahul@example.com', 22, 'DEF Institute', 'Student'),
    (8, 'Suman', 'Rai', 'suman@example.com', 27, 'QRS University', 'Working Professional'),
    (9, 'Deepak', 'Goyal', 'deepak@example.com', 23, 'ABC College', 'Student'),
    (10, 'Megha', 'Das', 'megha@example.com', 29, 'TUV Institute', 'Working Professional'),
    (11, 'Vivek', 'Sinha', 'vivek@example.com', 26, 'XYZ University', 'Working Professional'),
    (12, 'Nisha', 'Verma', 'nisha@example.com', 20, 'ABC College', 'Student'),
    (13, 'Anu', 'Thakur', 'anu@example.com', 24, 'PQR College', 'Student'),
    (14, 'Ramesh', 'Kumar', 'ramesh@example.com', 25, 'QRS University', 'Working Professional'),
    (15, 'Smita', 'Mehta', 'smita@example.com', 21, 'LMN College', 'Student');

-- Table to store information about student enrollment in specific courses
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- Insert sample enrollment data
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, 1, '2022-05-10'),
    (2, 2, 2, '2021-08-15'),
    (3, 3, 1, '2023-01-20'),
    (4, 4, 3, '2020-11-05'),
    (5, 5, 4, '2022-09-30'),
    (6, 6, 2, '2021-06-10'),
    (7, 7, 1, '2022-07-15'),
    (8, 8, 3, '2022-11-20'),
    (9, 9, 4, '2021-03-12'),
    (10, 10, 2, '2022-10-18'),
    (11, 11, 4, '2023-02-25'),
    (12, 12, 1, '2020-09-05'),
    (13, 13, 3, '2022-04-30'),
    (14, 14, 5, '2021-11-10'),
    (15, 15, 2, '2023-07-01');

-- Table to store information about instructors teaching courses
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ExpertiseArea VARCHAR(100),
    ExperienceInYears INT
);
-- Insert sample instructor data
INSERT INTO Instructors (InstructorID, FirstName, LastName, ExpertiseArea, ExperienceInYears)
VALUES
    (1, 'Asha', 'Bose', 'Machine Learning', 5),
    (2, 'Vikram', 'Rao', 'Data Visualization', 8),
    (3, 'Neha', 'Sharma', 'Statistics', 6),
    (4, 'Rajat', 'Mukherjee', 'Big Data Technologies', 10),
    (5, 'Anjali', 'Chopra', 'Programming', 7);
    
-- Table to store information about instructor assignments to courses
CREATE TABLE CourseInstructors (
    CourseInstructorID INT PRIMARY KEY,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);
-- Insert sample course-instructor assignments
INSERT INTO CourseInstructors (CourseInstructorID, CourseID, InstructorID)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 1, 3),
    (4, 4, 4),
    (5, 3, 5);

-- Table to store information about sales transactions
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    EnrollmentID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);
-- Insert sample sales data
INSERT INTO Sales (SaleID, EnrollmentID, SaleDate, Amount)
VALUES
    (1, 1, '2022-05-15', 150000.00),
    (2, 2, '2021-08-20', 120000.00),
    (3, 3, '2023-01-25', 150000.00),
    (4, 4, '2020-11-10', 180000.00),
    (5, 5, '2022-10-05', 180000.00),
    (6, 6, '2021-06-15', 120000.00),
    (7, 7, '2022-08-01', 150000.00),
    (8, 8, '2022-12-05', 280000.00),
    (9, 9, '2021-03-20', 180000.00),
    (10, 10, '2022-10-25', 120000.00),
    (11, 11, '2023-03-05', 180000.00),
    (12, 12, '2020-09-10', 160000.00),
    (13, 13, '2022-05-01', 280000.00),
    (14, 14, '2021-11-15', 160000.00),
    (15, 15, '2023-07-10', 120000.00);