USE master;
GO

CREATE DATABASE academic_settings;
GO

USE academic_settings;
GO

CREATE TABLE classes (
  ClassID varchar(10),
  InstructorsID varchar(20),
  ClassName varchar(20),
  AttendanceType varchar(20)
);

--
-- Dumping data for table "classes"
--

INSERT INTO "classes" (ClassID, InstructorsID, ClassName, AttendanceType) VALUES
('C001', 'I002', 'Programming', 'Online'),
('C002', 'I003', 'Math', 'InClass'),
('C003', 'I001', 'English', 'InClass');

-- --------------------------------------------------------

--
-- Table structure for table "instructors"
--

CREATE TABLE instructors (
  InstructorsID varchar(20),
  IFirstName varchar(20),
  ILastName varchar(20),
  IEmail varchar(25),
  IsAdviser tinyint NOT NULL
);

--
-- Dumping data for table "instructors"
--

INSERT INTO instructors ("InstructorsID", "IFirstName", "ILastName", "IEmail", "IsAdviser") VALUES
('I001', 'John', 'Blue', 'JohnB@yahoo.com', 1),
('I002', 'Tim', 'Crow', 'TimC@yahoo.com', 1),
('I003', 'Joe', 'Harpy', 'JoeH@yahoo.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table "major"
--

CREATE TABLE major (
  MajorID varchar(20),
  MajorName varchar(20),
  TotalCredits int NOT NULL,
  EstimatedCompletion varchar(20),
  LaptopRequired tinyint NOT NULL
);

--
-- Dumping data for table "major"
--

INSERT INTO major ("MajorID", "MajorName", "TotalCredits", "EstimatedCompletion", "LaptopRequired") VALUES
('M001', 'ProgrammingDegree', 45, '2Years', 1),
('M002', 'MathDegree', 35, '1Year', 0),
('M003', 'EnglishDegree', 30, '1Year', 1);

-- --------------------------------------------------------

--
-- Table structure for table "majorclasses"
--

CREATE TABLE majorclasses (
  MajorID varchar(20),
  ClassID varchar(20)
);

--
-- Dumping data for table "majorclasses"
--

INSERT INTO majorclasses ("MajorID", "ClassID") VALUES
('M001', 'C001'),
('M002', 'C002'),
('M003', 'C003');

-- --------------------------------------------------------

--
-- Table structure for table "studentclasses"
--

CREATE TABLE studentclasses (
  StudentID varchar(20),
  ClassID varchar(20)
);

--
-- Dumping data for table "studentclasses"
--

INSERT INTO studentclasses ("StudentID", "ClassID") VALUES
('S002', 'C001'),
('S004', 'C001'),
('S001', 'C002'),
('S003', 'C002'),
('S005', 'C003');

-- --------------------------------------------------------

--
-- Table structure for table "students"
--

CREATE TABLE students (
  StudentID varchar(20),
  MajorID varchar(20),
  SFirstName varchar(20),
  SLastName varchar(20),
  GPA float,
  GradYear date NOT NULL
);

--
-- Dumping data for table "students"
--

INSERT INTO students ("StudentID", "MajorID", "SFirstName", "SLastName", "GPA", "GradYear") VALUES
('S001', 'M002', 'Katie', 'Brown', 3.2, '2023-05-10'),
('S002', 'M001', 'Nannie', 'Moore', 2.7, '2023-05-10'),
('S003', 'M002', 'Ayah', 'Morris', 2.6, '2023-05-10'),
('S004', 'M001', 'Aleksander', 'Rivas', 2.8, '2023-12-08'),
('S005', 'M003', 'Damian', 'Graves', 3.0, '2023-12-08');