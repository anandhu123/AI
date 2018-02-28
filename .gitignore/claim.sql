-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2018 at 09:39 AM
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
  `hospital` varchar(44) NOT NULL,
  `amount` int(30) NOT NULL,
  `number` int(22) NOT NULL,
  `duration` int(22) NOT NULL,
  `status` varchar(22) NOT NULL,
  `reason` varchar(60) NOT NULL,
  `date` varchar(10) NOT NULL,
  `smsstatus` varchar(22) NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claim`
--

INSERT INTO `claim` (`cid`, `Location`, `id`, `name`, `hospital`, `amount`, `number`, `duration`, `status`, `reason`, `date`, `smsstatus`) VALUES
(123456, 'Palakkad', 24998, 'dental surgery', 'Fathima Hospital', 10002, 2, 3, 'Rejected', 'Duplication', '2018/02/22', 'yes'),
(12131415, 'Idukki', 24998, 'hearing aids', 'S.N. Trust Medical Mission Hospital', 15423, 8, 2, 'Rejected', 'Duplication', '2018/02/21', 'yes'),
(622605, 'Kochi', 24998, 'hearing aids', 'Aster', 100000, 21, 1000, 'Rejected', 'Duplication', '2018/02/20', 'yes'),
(475709, 'Kozhikode', 24998, 'dental surgery', 'MGM', 50000, 22, 12, 'Rejected', 'Duplication', '2018/02/22', 'yes'),
(1549106, 'Alappuzha', 72758, 'Stomach pain', 'T.D. Medical College Hospital Alappuzha', 3546, 5, 3, 'Accepted', 'Eligible', '2018/02/23', 'yes'),
(1393617, 'Kollam', 24224, 'Fever', 'Aster', 1212, 22, 12, 'Rejected', 'Duplication', '2018/02/23', 'yes'),
(561327, 'Kollam', 24224, 'Fever', 'MGM', 1213, 20, 12, 'Rejected', 'Duplication', '2018/02/23', 'yes'),
(1598416, 'Kollam', 24224, 'Fever', 'MGM', 50000, 22, 52, 'Rejected', 'Duplication', '2018/02/23', 'yes'),
(1929652, 'Alappuzha', 63938, 'AIDS', 'Aster', 95846, 22, 2000, 'Rejected', 'Excluded diseases', '2018/02/23', 'yes'),
(1880385, 'Kottayam', 63938, 'burn', 'abcd', 50000, 22, 2000, 'Rejected', 'Unreliable hospital network', '2018/02/23', 'yes'),
(1857864, 'Kottayam', 63938, 'headache', 'abcd', 23548, 22, 200, 'Rejected', 'Unreliable hospital network', '2018/02/23', 'yes'),
(829517, 'Kollam', 24224, 'Accident', 'pariyaram', 23625, 22, 12, 'Accepted', 'Eligible', '2018/02/23', 'yes'),
(1745249, 'Alappuzha', 19241, 'Japanese Encephalitis', 'T. D. Medical College, Alappuzha', 65487, 33, 45, 'Rejected', 'Unreliable hospital network', '2018/02/23', 'yes'),
(1874691, 'Kottayam', 24998, 'Fever', 'aaaaa', 50000, 22, 3, 'Rejected', 'Unreliable hospital network', '2018/02/24', 'yes'),
(1437159, 'Alappuzha', 34455, 'Cough', 'Sahrudaya Hospital', 4256, 5, 3, 'Accepted', 'Eligible', '26/02/2018', 'yes'),
(1352546, 'Tirupati', 19241, 'Fever', 'Sri Venkateshwara Institute Of Medical Scien', 5489, 22, 12, 'Rejected', 'Duplication', '27/02/2018', 'yes'),
(1896830, 'Tirupati', 19241, 'Fever', 'Sri Venkateshwara Institute Of Medical Scien', 5489, 22, 12, 'Rejected', 'Duplication', '27/02/2018', 'yes');
