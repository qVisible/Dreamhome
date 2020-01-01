-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: mysql9.mylogin.ie
-- Generation Time: Feb 24, 2015 at 01:42 PM
-- Server version: 5.5.41
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `RGP17462_dreamhome`
--

-- --------------------------------------------------------

--
-- Table structure for table `Branch`
--

CREATE TABLE IF NOT EXISTS `Branch` (
  `branchno` char(5) NOT NULL,
  `street` varchar(35) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`branchno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Branch`
--

INSERT INTO `Branch` (`branchno`, `street`, `city`, `postcode`) VALUES
('B002', '56 Clover Dr', 'London', 'NW10 6EU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU');

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE IF NOT EXISTS `Client` (
  `clientno` char(5) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `telno` char(15) DEFAULT NULL,
  `preftype` varchar(10) DEFAULT NULL,
  `maxrent` int(11) DEFAULT NULL,
  PRIMARY KEY (`clientno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`clientno`, `fname`, `lname`, `telno`, `preftype`, `maxrent`) VALUES
('CR56', 'Aline', 'Steward', '0141-848-1825', 'Flat', 350),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600),
('CR74', 'Mike', 'Ritchie', '', 'House', 750),
('CR76', 'John', 'Kay', '0171-774-5632', 'Flat', 425);

-- --------------------------------------------------------

--
-- Table structure for table `PrivateOwner`
--

CREATE TABLE IF NOT EXISTS `PrivateOwner` (
  `ownerno` char(5) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telno` char(15) DEFAULT NULL,
  PRIMARY KEY (`ownerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PrivateOwner`
--

INSERT INTO `PrivateOwner` (`ownerno`, `fname`, `lname`, `address`, `telno`) VALUES
('CO40', 'Tina', 'Murphy', '63 Well St. Glasgow G42', '0141-943-1728'),
('CO46', 'Joe', 'Keogh', '2 Fergus Dr. Aberdeen AB2 7SX', '01224-861212'),
('CO87', 'Carol', 'Farrel', '6 Achray St. Glasgow G32 9DX', '0141-357-7419'),
('CO93', 'Tony', 'Shaw', '12 Park Pl. Glasgow G4 0QR', '0141-225-7025');

-- --------------------------------------------------------

--
-- Table structure for table `PropertyForRent`
--

CREATE TABLE IF NOT EXISTS `PropertyForRent` (
  `propertyno` char(5) NOT NULL,
  `street` varchar(35) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `rooms` smallint(6) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `ownerno` char(5) DEFAULT NULL,
  `staffno` char(5) DEFAULT NULL,
  `branchno` char(5) DEFAULT NULL,
  PRIMARY KEY (`propertyno`),
  KEY `staffno` (`staffno`),
  KEY `branchno` (`branchno`),
  KEY `ownerno` (`ownerno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PropertyForRent`
--

INSERT INTO `PropertyForRent` (`propertyno`, `street`, `city`, `postcode`, `type`, `rooms`, `rent`, `ownerno`, `staffno`, `branchno`) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87', 'SL41', 'B005');

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE IF NOT EXISTS `Registration` (
  `clientNo` char(5) NOT NULL,
  `branchNo` char(5) NOT NULL,
  `staffNo` char(5) DEFAULT NULL,
  `dateJoined` char(9) DEFAULT NULL,
  PRIMARY KEY (`clientNo`,`branchNo`),
  KEY `branchNo` (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Registration`
--

INSERT INTO `Registration` (`clientNo`, `branchNo`, `staffNo`, `dateJoined`) VALUES
('CR56', 'B003', 'SG37', '11-Apr-00'),
('CR62', 'B007', 'SA9', '7-Mar-00'),
('CR74', 'B003', 'SG37', '16-Nov-99'),
('CR76', 'B005', 'SL41', '2-Jan-01');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `staffno` char(5) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `dob` char(9) DEFAULT NULL,
  `salary` smallint(6) DEFAULT NULL,
  `branchno` char(5) DEFAULT NULL,
  PRIMARY KEY (`staffno`),
  KEY `branchno` (`branchno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffno`, `fname`, `lname`, `position`, `sex`, `dob`, `salary`, `branchno`) VALUES
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '19-Feb-70', 9000, 'B007'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '24-Mar-58', 18000, 'B003'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '10-Nov-60', 12000, 'B003'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '3-Jun-40', 24000, 'B003'),
('SL21', 'John', 'White', 'Manager', 'M', '1-Oct-45', 32767, 'B005'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '13-Jun-65', 9000, 'B005');

-- --------------------------------------------------------

--
-- Table structure for table `Viewing`
--

CREATE TABLE IF NOT EXISTS `Viewing` (
  `clientno` char(5) NOT NULL,
  `propertyno` char(5) NOT NULL,
  `viewdate` char(9) DEFAULT NULL,
  `commnt` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`clientno`,`propertyno`),
  KEY `propertyno` (`propertyno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Viewing`
--

INSERT INTO `Viewing` (`clientno`, `propertyno`, `viewdate`, `commnt`) VALUES
('CR56', 'PA14', '24-May-95', 'too small'),
('CR56', 'PG36', '28-Apr-95', ' '),
('CR56', 'PG4', '26-May-95', ''),
('CR62', 'PA14', '14-May-95', 'no dining room'),
('CR76', 'PG4', '20-Apr-95', 'too remote');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PropertyForRent`
--
ALTER TABLE `PropertyForRent`
  ADD CONSTRAINT `PropertyForRent_ibfk_3` FOREIGN KEY (`staffno`) REFERENCES `Staff` (`staffno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PropertyForRent_ibfk_1` FOREIGN KEY (`ownerno`) REFERENCES `PrivateOwner` (`ownerno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PropertyForRent_ibfk_2` FOREIGN KEY (`branchno`) REFERENCES `Branch` (`branchno`) ON UPDATE CASCADE;

--
-- Constraints for table `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `Registration_ibfk_2` FOREIGN KEY (`branchNo`) REFERENCES `Branch` (`branchno`),
  ADD CONSTRAINT `Registration_ibfk_1` FOREIGN KEY (`clientNo`) REFERENCES `Client` (`clientno`);

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`branchno`) REFERENCES `Branch` (`branchno`) ON UPDATE CASCADE;

--
-- Constraints for table `Viewing`
--
ALTER TABLE `Viewing`
  ADD CONSTRAINT `Viewing_ibfk_2` FOREIGN KEY (`propertyno`) REFERENCES `PropertyForRent` (`propertyno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Viewing_ibfk_1` FOREIGN KEY (`clientno`) REFERENCES `Client` (`clientno`) ON UPDATE CASCADE;
