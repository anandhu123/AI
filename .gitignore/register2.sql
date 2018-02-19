-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2018 at 07:01 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my`
--

-- --------------------------------------------------------

--
-- Table structure for table `register2`
--

CREATE TABLE IF NOT EXISTS `register2` (
  `name` varchar(22) NOT NULL,
  `age` int(22) NOT NULL,
  `education` varchar(22) NOT NULL,
  `employee` varchar(22) NOT NULL,
  `profession` varchar(22) NOT NULL,
  `location` varchar(22) NOT NULL,
  `mar` varchar(22) NOT NULL,
  `gender` varchar(22) NOT NULL,
  `Pre` varchar(22) NOT NULL,
  `tweet` varchar(22) NOT NULL,
  `status` varchar(22) DEFAULT NULL,
  `id` int(30) DEFAULT NULL,
  `children` int(10) DEFAULT NULL,
  `smoker` varchar(10) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `bmi` int(20) DEFAULT NULL,
  `premium` int(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register2`
--

INSERT INTO `register2` (`name`, `age`, `education`, `employee`, `profession`, `location`, `mar`, `gender`, `Pre`, `tweet`, `status`, `id`, `children`, `smoker`, `region`, `bmi`, `premium`) VALUES
('Anandhu', 22, 'degree', 'No', 'Engineer', 'Kottayam', 'single', 'male', 'No', 'vijayanpinarayi', 'Confirmed', 24998, 3, 'yes', 'northwest', 33, 29696),
('Anna', 26, 'B tech', 'No', 'System admin', 'Kollam', 'Married', 'female', 'No', 'CMOKerala', 'Confirmed', 27464, 2, 'no', 'northeast', 26, 4509),
('anju', 12, 'B tech', 'No', 'No', 'Alappuzha', 'single', 'female', 'Yes', 'cpimspeak', 'Rejected', 87878, 2, 'no', 'northeast', 55, 0),
('Appus', 45, 'M tech', 'No', 'Engineer', 'Thrissur', 'married', 'male', 'no', 'vijayanpinarayi', 'Confirmed', 63938, 3, 'yes', 'southwest', 55, 42461),
('Abhi', 24, 'plus 2', 'no', 'no', 'Kasargod', 'no', 'female', 'no', 'SitaramYechury', 'Confirmed', 24224, 0, 'yes', 'southwest', 45, 32379);
