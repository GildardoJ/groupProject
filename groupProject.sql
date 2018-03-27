-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2018 at 10:56 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `groupProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `bankName` varchar(20) NOT NULL,
  `bankId` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bankName`, `bankId`) VALUES
('Wells Fargo', 1),
('Chase', 2),
('Union Bank', 3),
('Bank of America', 4),
('Jupiter Bank', 5),
('Bank of the North', 6);

-- --------------------------------------------------------

--
-- Table structure for table `BankManager`
--

CREATE TABLE IF NOT EXISTS `BankManager` (
  `BankerId` smallint(6) NOT NULL,
  `ManagerFirstName` varchar(15) NOT NULL,
  `ManagerLastName` varchar(20) NOT NULL,
  `bankId` int(5) NOT NULL,
  PRIMARY KEY (`BankerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BankManager`
--

INSERT INTO `BankManager` (`BankerId`, `ManagerFirstName`, `ManagerLastName`, `bankId`) VALUES
(12, 'Jimmy', 'Chu', 1),
(3942, 'Solomon', 'Mont', 2),
(4343, 'Kenneth', 'Cole', 3),
(4960, 'Margaret', 'Thatcher', 4),
(7677, 'Evelyn', 'Tan', 5),
(9432, 'John', 'Haverford', 6);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE IF NOT EXISTS `checkout` (
  `checkoutId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `deviceId` varchar(5) NOT NULL,
  `checkoutDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `returnDate` date DEFAULT NULL,
  `checkoutBy` smallint(6) NOT NULL,
  `checkinBy` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`checkoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `departmentId` float NOT NULL,
  `deptName` varchar(50) NOT NULL,
  `bankType` int(11) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `deptName`, `bankType`) VALUES
(1, 'Checking', 1),
(2, 'Car Loans', 2),
(3, 'Mortgage', 3),
(4, 'Student Loans', 4),
(5, 'Appliance Loans', 5),
(6, 'Savings', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `accountType` varchar(10) NOT NULL,
  `departmentId` int(20) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `email`, `phone`, `accountType`, `departmentId`) VALUES
(10, 'Michael', 'Cwener', 'mcwener@gmail.com', '(123)-123-1234', 'Checking', 6),
(11, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '9764978123', 'Savings', 6),
(12, 'Brandon', 'Ginn', 'some@email.com', '(999) 888-7777', 'Checking', 6),
(13, 'Bernie', 'Sanders', 'OurLordAndSavior@gmail.com', '(831) 555-5555', 'Savings', 6),
(14, 'Ryan', 'LeBon', 'rian@csuhotmail.com', '831-453-3231', 'Checking', 6),
(15, 'Bob', 'Stuart', 'BS@comcast.net', '(555) 789-6352', 'Savings', 6),
(16, 'Yang', 'Jing', 'myemail@google.com', '3333333333', 'Savings', 5),
(17, 'Lin', 'Hao', 'lin@gmail.com', '1370247394', 'Savings', 5),
(18, 'Andrew', 'Sanchez', 'blasdfl@gmail.com', '911', 'Savings', 5),
(19, 'Tommy', 'Ha', 'makaveli1996@gmail.com', '831-555-5555', 'Savings', 5),
(20, 'Austin', 'Brown', 'hello@gmail.com', '(555) 220-8268', 'Checking', 5),
(21, 'Bill', 'Gates', 'BillGates@microsoft.com', '(831)-444-8887', 'Checking', 4),
(22, 'Valerie', 'Hinojoza-Rood', 'vhinojoza-rood@gmail.com', '555-555-5555', 'Checking', 4),
(23, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '9764978123', 'Savings', 4),
(24, 'Kara', 'Spencer', 'kaspencer@gmail.com', '(702)123-4567', 'Savings', 4),
(25, 'Minh Tan', 'Le', 'mtl@gmail.com', '(666) 210-1997', 'Savings', 4),
(26, 'Soul', 'Player', 'splayer@everywhere', '(987)654-3210', 'Savings', 3),
(27, 'Babak', 'Chehraz', 'bchehraz@gmail.com', '(123) 456-7890', 'Savings', 3),
(28, 'Darth', 'Vader', 'darksidebestside@sbcglobal.net', '(831)5555555', 'Savings', 3),
(29, 'Tomas', 'Hernandez', 'tohernandez@gmail.com', '5555555555', 'Checking', 3),
(30, 'Linda', 'Reyes', 'lreyes@gmail.com', '(626)222-2222', 'Savings', 3),
(31, 'Jeff', 'Gearhart', 'JGcollegeengineer@gmail.com', '(555)-234-5678', 'Savings', 3),
(32, 'Ryan', 'LeBon', 'rian@csuhotmail.com', '831-453-3231', 'Checking', 2),
(33, 'Bob', 'Bobbington', 'bbob@gmail.com', '777-555-7777', 'Savings', 2),
(34, 'Billy', 'Boy', 'BillyBoy@Billyboy.com', '(555) 533-5678', 'Savings', 2),
(35, 'Rick', 'James', 'maryjane420@gmail.com', '8315551234', 'Checking', 2),
(36, 'Carsen', 'Yates', 'totallynotafakeemailaddress@totallyarealdomain.tot', '5599999999', 'Savings', 1),
(37, 'Cody', 'Parker', 'bestEmail@gmail.com', '(555) 123-0124', 'Savings', 1),
(38, 'Daniel', 'Crews', 'dcrews@gmail.com', '1231231234', 'Checking', 1),
(39, 'Daniel', 'Crews', 'dcrews@gmail.com', '(123)123-1234', 'Savings', 1),
(2183308, 'Brandon', 'Stillwell', 'brstillwell@gmail.com', '(281)330-8004', 'Savings', 0),
(2323232, 'Tyler', 'Chargin', 'tchargin@gmail.com', '(408) 394-1477', 'Savings', 0),
(2323242, 'Tyler', 'Chargin', 'tchargin@gmail.com', '(408) 394-1477', 'Savings', 0),
(2345436, 'Daniel', 'Wilson', 'hello@hello.com', '(325)123-4234', 'Savings', 0),
(2727272, 'Brian', 'Little', 'thisisreal@real.com', '(555)555-5050', 'Savings', 0),
(3256478, 'Pedro', 'Lopez', 'dfrgtg90@yahoo.com', '(831)569-1254', 'Savings', 0),
(3456789, 'Dani', 'Crouch', 'blahblah@gmail', '(012)345-6789', 'Savings', 0),
(4433221, 'Michael', 'Moore', 'moore@where.com', '444555', 'Savings', 0),
(4561238, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '1234567894', 'Savings', 0),
(6543210, 'Humberto', 'Plaza', 'hplazamartinez@gmail.com', '8316745900', 'Savings', 0),
(6665555, 'Bob', 'Barker', 'bobbarker@gmail.com', '(123)567-1234', 'Savings', 0),
(6666666, 'Kieran', 'Burke', 'kburke@gmail.com', '8583345238', 'Savings', 0),
(6754832, 'Fernando', 'Madrigal', 'fafaf422@gmail.com', '(831)777-7777', 'Savings', 0),
(7532145, 'Lil', 'Wayne', 'cashmoneyrecordswheredreamscometrue@ymbc.info', '8317894561', 'Savings', 0),
(7654321, 'Velvet', 'Crowe', 'TalesofBerseria@yahoo.com', '9876543', 'Savings', 0),
(7766554, 'Isaac', 'Avila', 'me@mymail', '(111)222-3333', 'Savings', 0),
(7767777, 'Tim', 'Smith', 'Littletim@gmail.com', '(408) 123-4567', 'Savings', 0),
(7777777, 'Tim', 'Smith', 'Littletim@gmail.com', '(408) 123-4567', 'Savings', 0),
(8318456, 'Samuel ', 'Valdez ', 'savaldez@gmail.com', '(831)865-3721', 'Savings', 0),
(8888888, 'Yang', 'Jing', 'myrealemail@google.com', '123434567', 'Savings', 0),
(9999981, 'Yashkaran', 'Singh', 'ysingh@gmail.com', '(669)-321-9871', 'Savings', 0),
(9999982, 'yahoo', 'google', 'yahho@google.com', '(123)-456-7890', 'Savings', 0),
(41111157, 'Evelyn', 'ANDA-MURILLO', 'evelynmurillo91@gmail.com', '(831)512-3812', 'Savings', 0),
(67545465, 'Bobby', 'Longjohns', 'me@me.com', '(765)676-4532', 'Savings', 0),
(191919191, 'Hank', 'Hill', 'illtelluwot@gmail.com', '1929292919', 'Savings', 0),
(411111157, 'Evelyn', 'ANDA-MURILLO', 'evelynmurillo91@gmail.com', '(831)512-3812', 'Savings', 0),
(902949902, 'phillip', 'emmons', 'pemmons@gmail.com', '541-555-555', 'Savings', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
