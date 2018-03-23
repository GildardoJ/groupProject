-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2017 at 02:13 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tech_checkout`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `checkout`
--



-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `departmentId` float NOT NULL,
  `deptName` varchar(50) NOT NULL,
  `bankType` varchar(50) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1  ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `deptName`, `bankType`) VALUES
(1234, 'Home Loans', 'WellsFargo'),
(2345, 'Car Loans', 'Chase'),
(3123, 'Mortgage', 'Bank Of America'),
(4354, 'Student Loans', 'Union Banks'),
(5545, 'Appliance Loans', 'HSBC'),
(6876, 'Pay Day Loans', 'US Bank');

-- --------------------------------------------------------

--

-- --------------------------------------------------------

--
-- Table structure for table `Banker`
--

CREATE TABLE IF NOT EXISTS `BankManager` (
  `BankerId` smallint(6) NOT NULL ,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  PRIMARY KEY (`BankerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1  ;

--
-- Dumping data for table `Banker`
--

INSERT INTO `BankManager` (`BankerId`, `firstName`, `lastName`) VALUES
(3942, 'Sum Ting ', 'Wong'),
(4960, 'Margaret', 'Thatcher'),
(7677, 'Wi Tu', 'Low'),
(0012, 'Jimmy', 'Chu'),
(4343, 'Kenneth', 'Cole'),
(9432, 'John', 'Haverford');


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
  `role` varchar(10) NOT NULL,
  `accountType` varchar(10) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `email`, `phone`, `role`, `accountType`) VALUES
(0, 'Daniel', 'Crews', 'dcrews@gmail.com', '1231231234', 'Engineer', 'Checking'),
(211, 'Linda', 'Reyes', 'lreyes@gmail.com', '(626)222-2222', 'engineer', 'Savings'),
(16969, 'Ryan', 'LeBon', 'rian@csuhotmail.com', '831-453-3231', 'Engineer', 'Checking'),
(126969, 'Ryan', 'LeBon', 'rian@csuhotmail.com', '831-453-3231', 'Engineer', 'Checking'),
(987642, 'Tomas', 'Hernandez', 'tohernandez@gmail.com', '5555555555', 'Banker', 'Checking'),
(987654, 'Kara', 'Spencer', 'kaspencer@gmail.com', '(702)123-4567', 'engineer', 'Savings'),
(1001235, 'Austin', 'Brown', 'hello@gmail.com', '(555) 220-8268', 'Engineer', 'Checking'),
(1002345, 'Michael', 'Cwener', 'mcwener@gmail.com', '(123)-123-1234', 'engineer', 'Checking'),
(1110011, 'Jeff', 'Gearhart', 'JGcollegeengineer@gmail.com', '(555)-234-5678', 'engineer', 'Savings'),
(1111111, 'Valerie', 'Hinojoza-Rood', 'vhinojoza-rood@gmail.com', '555-555-5555', 'Engineer', 'Checking'),
(1111234, 'Tommy', 'Ha', 'makaveli1996@gmail.com', '831-555-5555', 'Engineer', 'Savings'),
(1111295, 'Brandon', 'Ginn', 'some@email.com', '(999) 888-7777', 'Faculty', 'Checking'),
(1112223, 'Cody', 'Parker', 'bestEmail@gmail.com', '(555) 123-0124', 'Faculty', 'Savings'),
(1114534, 'Rick', 'James', 'maryjane420@gmail.com', '8315551234', 'Faculty', 'Checking'),
(1122334, 'Babak', 'Chehraz', 'bchehraz@gmail.com', '(123) 456-7890', 'Engineer', 'Savings'),
(1134235, 'Bill', 'Gates', 'BillGates@microsoft.com', '(831)-444-8887', 'engineer', 'Checking'),
(1212121, 'Yang', 'Jing', 'myemail@google.com', '3333333333', 'Engineer', 'Savings'),
(1232123, 'Bernie', 'Sanders', 'OurLordAndSavior@gmail.com', '(831) 555-5555', 'Banker', 'Savings'),
(1234567, 'Daniel', 'Crews', 'dcrews@gmail.com', '(123)123-1234', 'Engineer', 'Savings'),
(1234577, 'Bob', 'Bobbington', 'bbob@gmail.com', '777-555-7777', 'Faculty', 'Savings'),
(1234875, 'Darth', 'Vader', 'darksidebestside@sbcglobal.net', '(831)5555555', 'Engineer', 'Savings'),
(1236542, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '9764978123', 'engineer', 'Savings'),
(1239423, 'Andrew', 'Sanchez', 'blasdfl@gmail.com', '911', 'Faculty', 'Savings'),
(1346795, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '9764978123', 'engineer', 'Savings'),
(1485503, 'Carsen', 'Yates', 'totallynotafakeemailaddress@totallyarealdomain.tot', '5599999999', 'engineer', 'Savings'),
(1919191, 'Billy', 'Boy', 'BillyBoy@Billyboy.com', '(555) 533-5678', 'Engineer', 'Savings'),
(1999999, 'Soul', 'Player', 'splayer@everywhere', '(987)654-3210', 'Banker', 'Savings'),
(2101997, 'Minh Tan', 'Le', 'mtl@gmail.com', '(666) 210-1997', 'Engineer', 'Savings'),
(2121212, 'Lin', 'Hao', 'lin@gmail.com', '1370247394', 'Engineer', 'Savings'),
(2123215, 'Bob', 'Stuart', 'BS@comcast.net', '(555) 789-6352', 'Engineer', 'Savings'),
(2183308, 'Brandon', 'Stillwell', 'brstillwell@gmail.com', '(281)330-8004', 'engineer', 'Savings'),
(2323232, 'Tyler', 'Chargin', 'tchargin@gmail.com', '(408) 394-1477', 'Engineer', 'Savings'),
(2323242, 'Tyler', 'Chargin', 'tchargin@gmail.com', '(408) 394-1477', 'Engineer', 'Savings'),
(2345436, 'Daniel', 'Wilson', 'hello@hello.com', '(325)123-4234', 'engineer', 'Savings'),
(2727272, 'Brian', 'Little', 'thisisreal@real.com', '(555)555-5050', 'Teacher', 'Savings'),
(3256478, 'Pedro', 'Lopez', 'dfrgtg90@yahoo.com', '(831)569-1254', 'Student', 'Savings'),
(3456789, 'Dani', 'Crouch', 'blahblah@gmail', '(012)345-6789', 'Engineer', 'Savings'),
(4433221, 'Michael', 'Moore', 'moore@where.com', '444555', 'Student', 'Savings'),
(4561238, 'Eduardo', 'Vilasenor', 'asdf@gmail.com', '1234567894', 'engineer', 'Savings'),
(6543210, 'Humberto', 'Plaza', 'hplazamartinez@gmail.com', '8316745900', 'Engineer', 'Savings'),
(6665555, 'Bob', 'Barker', 'bobbarker@gmail.com', '(123)567-1234', 'Student', 'Savings'),
(6666666, 'Kieran', 'Burke', 'kburke@gmail.com', '8583345238', 'engineer', 'Savings'),
(6754832, 'Fernando', 'Madrigal', 'fafaf422@gmail.com', '(831)777-7777', 'Engineer', 'Savings'),
(7532145, 'Lil', 'Wayne', 'cashmoneyrecordswheredreamscometrue@ymbc.info', '8317894561', 'Programmer', 'Savings'),
(7654321, 'Velvet', 'Crowe', 'TalesofBerseria@yahoo.com', '9876543', 'Programmer', 'Savings'),
(7766554, 'Isaac', 'Avila', 'me@mymail', '(111)222-3333', 'Engineer', 'Savings'),
(7767777, 'Tim', 'Smith', 'Littletim@gmail.com', '(408) 123-4567', 'Engineer', 'Savings'),
(7777777, 'Tim', 'Smith', 'Littletim@gmail.com', '(408) 123-4567', 'Engineer', 'Savings'),
(8318456, 'Samuel ', 'Valdez ', 'savaldez@gmail.com', '(831)865-3721', 'Engineer', 'Savings'),
(8888888, 'Yang', 'Jing', 'myrealemail@google.com', '123434567', 'Engineer', 'Savings'),
(9999981, 'Yashkaran', 'Singh', 'ysingh@gmail.com', '(669)-321-9871', 'Engineer', 'Savings'),
(9999982, 'yahoo', 'google', 'yahho@google.com', '(123)-456-7890', 'Engineer', 'Savings'),
(41111157, 'Evelyn', 'ANDA-MURILLO', 'evelynmurillo91@gmail.com', '(831)512-3812', 'engineer', 'Savings'),
(67545465, 'Bobby', 'Longjohns', 'me@me.com', '(765)676-4532', 'Banker', 'Savings'),
(191919191, 'Hank', 'Hill', 'illtelluwot@gmail.com', '1929292919', 'teacher', 'Savings'),
(411111157, 'Evelyn', 'ANDA-MURILLO', 'evelynmurillo91@gmail.com', '(831)512-3812', 'engineer', 'Savings'),
(902949902, 'phillip', 'emmons', 'pemmons@gmail.com', '541-555-555', 'engineer', 'Savings');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CON

