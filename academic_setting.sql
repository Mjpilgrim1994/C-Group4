-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2023 at 07:42 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic_setting`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `InstructorsID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ClassName` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `AttendanceType` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `InstructorsID`, `ClassName`, `AttendanceType`) VALUES
('C001', 'I002', 'Programming', 'Online'),
('C002', 'I003', 'Math', 'InClass'),
('C003', 'I001', 'English', 'InClass');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `InstructorsID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `IFirstName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ILastName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IEmail` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `IsAdviser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`InstructorsID`, `IFirstName`, `ILastName`, `IEmail`, `IsAdviser`) VALUES
('I001', 'John', 'Blue', 'JohnB@yahoo.com', 1),
('I002', 'Tim', 'Crow', 'TimC@yahoo.com', 1),
('I003', 'Joe', 'Harpy', 'JoeH@yahoo.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `MajorID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MajorName` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `TotalCredits` int NOT NULL,
  `EstimatedCompletion` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `LaptopRequired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`MajorID`, `MajorName`, `TotalCredits`, `EstimatedCompletion`, `LaptopRequired`) VALUES
('M001', 'ProgrammingDegree', 45, '2Years', 1),
('M002', 'MathDegree', 35, '1Year', 0),
('M003', 'EnglishDegree', 30, '1Year', 1);

-- --------------------------------------------------------

--
-- Table structure for table `majorclasses`
--

CREATE TABLE `majorclasses` (
  `MajorID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ClassID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `majorclasses`
--

INSERT INTO `majorclasses` (`MajorID`, `ClassID`) VALUES
('M001', 'C001'),
('M002', 'C002'),
('M003', 'C003');

-- --------------------------------------------------------

--
-- Table structure for table `studentclasses`
--

CREATE TABLE `studentclasses` (
  `StudentID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `ClassID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentclasses`
--

INSERT INTO `studentclasses` (`StudentID`, `ClassID`) VALUES
('S002', 'C001'),
('S004', 'C001'),
('S001', 'C002'),
('S003', 'C002'),
('S005', 'C003');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `MajorID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SFirstName` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `SLastName` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `GPA` float(10,1) NOT NULL,
  `GradYear` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `MajorID`, `SFirstName`, `SLastName`, `GPA`, `GradYear`) VALUES
('S001', 'M002', 'Katie', 'Brown', 3.2, '2023-05-10'),
('S002', 'M001', 'Nannie', 'Moore', 2.7, '2023-05-10'),
('S003', 'M002', 'Ayah', 'Morris', 2.6, '2023-05-10'),
('S004', 'M001', 'Aleksander', 'Rivas', 2.8, '2023-12-08'),
('S005', 'M003', 'Damian', 'Graves', 3.0, '2023-12-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `FK` (`InstructorsID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`InstructorsID`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`MajorID`);

--
-- Indexes for table `majorclasses`
--
ALTER TABLE `majorclasses`
  ADD KEY `MajorClasses_MajorFK` (`MajorID`),
  ADD KEY `MajorClasses_ClassFK` (`ClassID`);

--
-- Indexes for table `studentclasses`
--
ALTER TABLE `studentclasses`
  ADD KEY `StudentFK` (`StudentID`),
  ADD KEY `ClassFK` (`ClassID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `Student_MajorFK` (`MajorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `FK` FOREIGN KEY (`InstructorsID`) REFERENCES `instructors` (`InstructorsID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `majorclasses`
--
ALTER TABLE `majorclasses`
  ADD CONSTRAINT `MajorClasses_ClassFK` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `MajorClasses_MajorFK` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `studentclasses`
--
ALTER TABLE `studentclasses`
  ADD CONSTRAINT `ClassFK` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `StudentFK` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `Student_MajorFK` FOREIGN KEY (`MajorID`) REFERENCES `major` (`MajorID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
