USE master;
GO

CREATE DATABASE academic_settings;
GO

USE academic_settings;
GO

--
-- Table structure for table "instructors"
--

CREATE TABLE Instructors (
  InstructorID varchar(20) NOT NULL,
  IFirstName varchar(20) NOT NULL,
  ILastName varchar(20) NOT NULL,
  IEmail varchar(25) NOT NULL,
  IsAdviser tinyint NOT NULL,
  PRIMARY KEY (InstructorID)
);

CREATE TABLE Classes (
  ClassID varchar(20) NOT NULL,
  InstructorID varchar(20) NOT NULL,
  ClassName varchar(20) NOT NULL,
  AttendanceType varchar(20) NOT NULL,
  PRIMARY KEY (ClassID)
);

--
-- Table structure for table "major"
--

CREATE TABLE Majors (
  MajorID varchar(20) NOT NULL,
  MajorName varchar(20) NOT NULL,
  TotalCredits int NOT NULL,
  EstimatedCompletion varchar(20) NOT NULL,
  LaptopRequired tinyint NOT NULL,
  PRIMARY KEY (MajorID)
);

--
-- Table structure for table "students"
--

CREATE TABLE Students (
  StudentID varchar(20) NOT NULL,
  MajorID varchar(20) NOT NULL,
  SFirstName varchar(20) NOT NULL,
  SLastName varchar(20) NOT NULL,
  GPA float NOT NULL,
  GradYear date NOT NULL,
  PRIMARY KEY (StudentID),
  FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
);

--
-- Table structure for table "studentclasses"
--

CREATE TABLE StudentClasses (
  StudentID varchar(20) NOT NULL,
  ClassID varchar(20) NOT NULL,
);

--
-- Table structure for table "majorclasses"
--

CREATE TABLE MajorsClasses (
  MajorID varchar(20) NOT NULL,
  ClassID varchar(20) NOT NULL,
);

--
-- Dumping data for table "classes"
--

INSERT INTO Classes (ClassID, InstructorID, ClassName, AttendanceType) VALUES
('C001', 'I002', 'Programming', 'Online'),
('C002', 'I003', 'Math', 'InClass'),
('C003', 'I001', 'English', 'InClass');

-- --------------------------------------------------------

--
-- Dumping data for table "instructors"
--

INSERT INTO Instructors ("InstructorID", "IFirstName", "ILastName", "IEmail", "IsAdviser") VALUES
('I001', 'John', 'Blue', 'JohnB@yahoo.com', 1),
('I002', 'Tim', 'Crow', 'TimC@yahoo.com', 1),
('I003', 'Joe', 'Harpy', 'JoeH@yahoo.com', 1);

-- --------------------------------------------------------

--
-- Dumping data for table "major"
--

INSERT INTO Majors ("MajorID", "MajorName", "TotalCredits", "EstimatedCompletion", "LaptopRequired") VALUES
('M001', 'ProgrammingDegree', 45, '2Years', 1),
('M002', 'MathDegree', 35, '1Year', 0),
('M003', 'EnglishDegree', 30, '1Year', 1);

-- --------------------------------------------------------

--
-- Dumping data for table "majorclasses"
--

INSERT INTO MajorsClasses ("MajorID", "ClassID") VALUES
('M001', 'C001'),
('M002', 'C002'),
('M003', 'C003');

-- --------------------------------------------------------

--
-- Dumping data for table "studentclasses"
--

INSERT INTO StudentClasses ("StudentID", "ClassID") VALUES
('S002', 'C001'),
('S004', 'C001'),
('S001', 'C002'),
('S003', 'C002'),
('S005', 'C003');

-- --------------------------------------------------------

--
-- Dumping data for table "students"
--

INSERT INTO Students ("StudentID", "MajorID", "SFirstName", "SLastName", "GPA", "GradYear") VALUES
('S001', 'M002', 'Katie', 'Brown', 3.2, '2023-05-10'),
('S002', 'M001', 'Nannie', 'Moore', 2.7, '2023-05-10'),
('S003', 'M002', 'Ayah', 'Morris', 2.6, '2023-05-10'),
('S004', 'M001', 'Aleksander', 'Rivas', 2.8, '2023-12-08'),
('S005', 'M003', 'Damian', 'Graves', 3.0, '2023-12-08');