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
  `premium` int(20) DEFAULT NULL,
  `ph` varchar(22) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `mailconfirm` varchar(22) NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register2`
--

INSERT INTO `register2` (`name`, `age`, `education`, `employee`, `profession`, `location`, `mar`, `gender`, `Pre`, `tweet`, `status`, `id`, `children`, `smoker`, `region`, `bmi`, `premium`, `ph`, `mail`, `mailconfirm`) VALUES
('Anandhu', 22, 'degree', 'no', 'Engineer', 'Kottayam', 'single', 'male', 'no', 'twittername', 'Confirmed', 24998, 3, 'yes', 'northwest', 33, 21826, '0', 'anan@gmail.com', 'yes'),
('anju', 12, 'B tech', 'no', 'no', 'Alappuzha', 'single', 'female', 'yes', 'twittername', 'Rejected', 87878, 2, 'no', 'northeast', 55, 0, '0', 'no gmail', 'no'),
('Appus', 45, 'M tech', 'no', 'Engineer', 'Thrissur', 'married', 'male', 'no', 'twittername', 'Confirmed', 63938, 3, 'yes', 'southwest', 55, 42461, '0', 'no gmail', 'yes'),
('Anuraj kr', 24, 'plus 2', 'no', 'no', 'Kasargod', 'no', 'female', 'no', 'twittername', 'Confirmed', 24224, 0, 'yes', 'southwest', 45, 24284, '+918945435454', 'anu@outlook.com', 'yes'),
('Anna Aghila Sebastina', 26, 'plus 2', 'no', 'no', 'Maradu', 'single', 'female', 'no', 'twittername', 'Confirmed', 19241, 0, 'no', 'northwest', 44, 6844, '+919444446081', 'no gmail', 'yes'),
('Anu', 45, 'degree', 'no', 'no', 'Ponkunnam', 'single', 'male', 'no', 'anutwiter', 'Confirmed', 72758, 3, 'yes', 'northwest', 33, 26168, '+9194005354', 'anan@gmail.com', 'yes'),
('admin', 0, '', '', '', '', '', '', '', '', 'Rejected', 999910, 0, '', '', 0, 0, '', 'no gmail', 'no'),
('Dhilna', 32, 'B tech', 'no', 'no', 'Paravoor', 'single', 'female', 'no', 'dhil', 'Confirmed', 34455, 0, 'no', 'northwest', 33, 6979, '123', 'dhil', 'yes'),
('Arun', 23, 'Mtech', 'no', 'no', 'Kollam', 'single', 'male', 'no', 'arun123', 'Confirmed', 20610, 0, 'no', 'southeast', 33, 2937, '6594444454', 'arun123@gmail.com', 'yes');
