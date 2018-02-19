-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2018 at 07:02 AM
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
-- Table structure for table `claim`
--

CREATE TABLE IF NOT EXISTS `claim` (
  `cid` int(222) NOT NULL,
  `Location` varchar(22) NOT NULL,
  `id` int(22) NOT NULL,
  `name` varchar(22) DEFAULT NULL,
  `hospital` varchar(22) NOT NULL,
  `amount` int(30) NOT NULL,
  `number` int(22) NOT NULL,
  `duration` int(22) NOT NULL,
  `status` varchar(22) NOT NULL,
  `reason` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claim`
--

INSERT INTO `claim` (`cid`, `Location`, `id`, `name`, `hospital`, `amount`, `number`, `duration`, `status`, `reason`) VALUES
(123456, 'Palakkad', 24998, 'dental surgery', '', 0, 0, 0, 'Rejected', 'Duplication'),
(789101, 'Mumbai', 27464, 'Accident', '', 0, 0, 0, 'Rejected', 'Duplication'),
(12131415, 'Idukki', 24998, 'hearing aids', '', 0, 0, 0, 'Rejected', 'Duplication'),
(622605, 'Kochi', 24998, 'hearing aids', 'Aster', 100000, 0, 1000, 'Rejected', 'Duplication'),
(475709, 'Kozhikode', 24998, 'dental surgery', 'MGM', 50000, 22, 12, 'Rejected', 'Duplication'),
(1712041, 'Kottayam', 27464, 'Accident', 'Aster', 12012, 20, 52, 'Rejected', 'Duplication'),
(1393617, 'Kollam', 24224, 'Fever', 'Aster', 1212, 22, 12, 'Rejected', 'Duplication'),
(561327, 'Kollam', 24224, 'Fever', 'MGM', 1213, 20, 12, 'Rejected', 'Duplication'),
(1598416, 'Kollam', 24224, 'Fever', 'MGM', 50000, 22, 52, 'Rejected', 'Duplication'),
(1929652, 'Alappuzha', 63938, 'AIDS', 'Aster', 95846, 22, 2000, 'Rejected', 'Excluded diseases'),
(1880385, 'Kottayam', 63938, 'burn', 'MGM', 50000, 22, 2000, 'Rejected', 'duration high for acute diseases'),
(1857864, 'Kottayam', 63938, 'headache', 'MGM', 0, 22, 200, 'Accepted', 'Eligible'),
(829517, 'Kollam', 24224, 'Accident', 'Aster', 23625, 22, 12, 'Accepted', 'Eligible');
