-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 06:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `user_name`, `password`) VALUES
(1, 'keshan', 'keshan123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_details`
--

CREATE TABLE `appointment_details` (
  `appointment_id` int(11) NOT NULL,
  `patient_nic` varchar(10) NOT NULL,
  `doc_speciality` varchar(45) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `appointment_date` varchar(20) NOT NULL,
  `appointment_time` varchar(10) NOT NULL,
  `appointment_hospital` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_details`
--

INSERT INTO `appointment_details` (`appointment_id`, `patient_nic`, `doc_speciality`, `doc_name`, `appointment_date`, `appointment_time`, `appointment_hospital`) VALUES
(1, '123', 'wer', 'wer', '3', '2', 'kegalle'),
(2, '123', 'wer', 'wer', '2020-30-11 04:30:21', '', '23'),
(3, '1234', 'qwer', 'esrg', '2020-34-11 04:34:28', '', 'dfg'),
(4, '123', 'wer', 'wer', '2020-37-11 04:37:22', '', '23'),
(5, '123', 'wer', '123', '2020-07-11 05:07:59', '', '23'),
(6, '1234', 'qwe', '234', '2020-24-11 05:24:34', '', '234'),
(10, '1234', '122', 'we', '', '', 'kegalle'),
(13, '7777777', 'wer', 'wer', '2020-49-13 06:49:29', '', '23'),
(19, '9876543', 'helloooooo', 'keshan', '', '', 'kegallle'),
(20, '100', 'rxccc', 'vidula', '', '', 'heyy');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_details`
--

CREATE TABLE `doctor_details` (
  `doc_id` int(10) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `doc_nic` varchar(20) NOT NULL,
  `doc_email` varchar(45) NOT NULL,
  `doc_password` varchar(45) NOT NULL,
  `doc_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_details`
--

INSERT INTO `doctor_details` (`doc_id`, `doc_name`, `doc_nic`, `doc_email`, `doc_password`, `doc_date`) VALUES
(2, 'admin', 'eee', '123', 'keshanweragoda1@gmail.com', '2020-53-11 12:53:18'),
(4, 'admin', 'eee', '12', 'keshanweragoda1@gmail.com', '2020-06-12 12:06:31'),
(5, '', '', '', '', '2020-35-12 02:35:52'),
(12, 'vid', '9798', 'item', 'kesh', '2020-28-15 11:28:42'),
(13, 'vidumantha2', '9798', 'hello', 'kesh@', '2020-11-16 01:11:19'),
(14, 'lllllllllllllllllllllll', '111111111111111', '1234', 'samantha@gmail', '2020-31-18 05:31:42'),
(15, 'doc isuru', '8989', '123', 'isuru@gmail', '2020-51-19 12:51:50'),
(16, 'heyyyy', '99999', '12345', 'hey@gmail', '2020-54-19 04:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_portal`
--

CREATE TABLE `doctor_portal` (
  `session_id` int(11) NOT NULL,
  `doc_nic` varchar(20) NOT NULL,
  `doc_specialization` varchar(45) NOT NULL,
  `doc_hospital` varchar(45) NOT NULL,
  `room_no` int(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `time2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_portal`
--

INSERT INTO `doctor_portal` (`session_id`, `doc_nic`, `doc_specialization`, `doc_hospital`, `room_no`, `date`, `time`, `time2`) VALUES
(1, '', 'wert', 'Nawaloka', 101, 'on', '14:00', '16:00'),
(3, '788999', 'ghj', 'Asiri', 303, 'Wednesday', '', ''),
(4, '19971214', 'asdf', 'nawaloka', 302, '09-03-1293', '1234', '4321');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hos_id` int(10) NOT NULL,
  `hos_name` varchar(45) NOT NULL,
  `hos_license` int(20) NOT NULL,
  `hos_telephone` int(10) NOT NULL,
  `hos_emergancy` int(10) NOT NULL,
  `hos_facilities` varchar(100) NOT NULL,
  `hos_rooms` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hos_id`, `hos_name`, `hos_license`, `hos_telephone`, `hos_emergancy`, `hos_facilities`, `hos_rooms`) VALUES
(38, 'zbc', 678, 76542221, 42, 'wifi', 21),
(41, 'Asriri', 345, 765432001, 12, 'farmacy', 35);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_details`
--

CREATE TABLE `hospital_details` (
  `hos_id` int(11) NOT NULL,
  `hos_name` varchar(45) NOT NULL,
  `hos_nic` varchar(10) NOT NULL,
  `hos_email` varchar(20) NOT NULL,
  `hos_password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_details`
--

INSERT INTO `hospital_details` (`hos_id`, `hos_name`, `hos_nic`, `hos_email`, `hos_password`) VALUES
(1, 'admin', 'eee', 'www', '123'),
(2, 'admin', 'eee', 'www', '123'),
(3, ' admin', '234', '123', '123'),
(4, ' admin', '234', '123', '123'),
(5, 'admin', '123', 'www', '123'),
(6, '', '', '', ''),
(46, 'samantha', '111111', 'samantha@gmail', '333'),
(47, 'samantha', '111111', 'samantha@gmail', '333');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(45) NOT NULL,
  `patient_nic` varchar(10) NOT NULL,
  `patient_email` varchar(45) NOT NULL,
  `patient_pwd` varchar(45) NOT NULL,
  `patient_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`patient_id`, `patient_name`, `patient_nic`, `patient_email`, `patient_pwd`, `patient_date`) VALUES
(1, 'admin', 'eee', 'keshanweragoda1@gmail.com', '112', '2020-09-10'),
(2, 'admin', 'eee', 'keshanweragoda1@gmail.com', '112', '2020-11-10'),
(4, 'admin', '234', 'kani@', '123', '2020-50-11 12:50:59'),
(5, 'admin', '234', 'kani@', '123', '2020-51-11 12:51:50'),
(7, 'ajith', 'weragoda', 'ajith@', '1234', '2020-46-11 01:46:25'),
(9, ' admin', '234', 'keshanweragoda1@gmail.com', '222', '2020-51-11 01:51:24'),
(10, '', '', '', '', '2020-56-11 01:56:12'),
(12, 'vid', '123456', 'item', 'kesh', '2020-21-12 02:21:08'),
(13, 'admin', '1234', '123@gmail', 'hey', '2020-53-12 06:53:56'),
(17, '', 'weragoda', '', '', '2020-50-12 07:50:16'),
(19, '', 'weragoda', 'vidula@qwe', '', '2020-51-12 07:51:39'),
(23, 'udesh', '9898', 'udesh@gmail', 'udesh', '2020-35-14 01:35:48'),
(24, 'vidu', '9798', 'kesh@', 'hello', '2020-29-15 11:29:27'),
(25, 'vidumantha2', '9798', 'kesh@', 'hello', '2020-11-16 01:11:48'),
(26, 'samantha', '6464', 'samantha@', '1234', '2020-26-18 05:26:37'),
(27, 'lllllllllllllllllllllll', '6464', 'samantha@gmail', '1111', '2020-32-18 05:32:41'),
(28, 'lllllllllllllllllllllll', '6464', 'samantha@gmail', '1111', '2020-35-18 05:35:36'),
(29, 'udesh bandra', '5656', 'udesh@gmail.com', '1234', '2020-35-19 05:35:56'),
(30, 'keshan', '9797', 'keshn@', '123', '2020-54-19 08:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(20) NOT NULL,
  `invoiceNumber` int(20) NOT NULL,
  `amount` int(20) NOT NULL,
  `payment_nic` varchar(20) NOT NULL,
  `cardnumber` int(20) NOT NULL,
  `cardname` varchar(20) NOT NULL,
  `expdate` varchar(20) NOT NULL,
  `cvv` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `appointment_details`
--
ALTER TABLE `appointment_details`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `doctor_details`
--
ALTER TABLE `doctor_details`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `doctor_portal`
--
ALTER TABLE `doctor_portal`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hos_id`);

--
-- Indexes for table `hospital_details`
--
ALTER TABLE `hospital_details`
  ADD PRIMARY KEY (`hos_id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_details`
--
ALTER TABLE `appointment_details`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor_details`
--
ALTER TABLE `doctor_details`
  MODIFY `doc_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `doctor_portal`
--
ALTER TABLE `doctor_portal`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hos_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `hospital_details`
--
ALTER TABLE `hospital_details`
  MODIFY `hos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
