-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 11:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orbva`
--
CREATE DATABASE IF NOT EXISTS `orbva` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `orbva`;

-- --------------------------------------------------------

--
-- Table structure for table `add_crain`
--

CREATE TABLE `add_crain` (
  `id` int(255) NOT NULL,
  `Owner_name` varchar(255) NOT NULL,
  `Crain_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_crain`
--

INSERT INTO `add_crain` (`id`, `Owner_name`, `Crain_details`) VALUES
(1, 'Ygy', 'ttgvg'),
(2, 'Yh', 'yu'),
(3, 'Uhu', 'tg'),
(4, 'Fgg', 'ggu\n'),
(5, 'Hh', 'gh'),
(6, 'Uu', 'cgg');

-- --------------------------------------------------------

--
-- Table structure for table `add_spare_parts`
--

CREATE TABLE `add_spare_parts` (
  `id` int(255) NOT NULL,
  `parts_name` varchar(255) NOT NULL,
  `parts_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_spare_parts`
--

INSERT INTO `add_spare_parts` (`id`, `parts_name`, `parts_details`) VALUES
(1, 'Gu', 'ty😂'),
(2, 'Vhh', '❤️🥴😂🥰😬☺️');

-- --------------------------------------------------------

--
-- Table structure for table `add_worker`
--

CREATE TABLE `add_worker` (
  `id` int(255) NOT NULL,
  `mech_name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `specification` varchar(255) NOT NULL,
  `available` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_worker`
--

INSERT INTO `add_worker` (`id`, `mech_name`, `place`, `post`, `pin`, `district`, `email`, `contact_no`, `specification`, `available`) VALUES
(2, 'Vh', 'cgh', 'bbbj', 'vhu', 'Kottayam', 'rtt@gmail.com', '66', 'All Cars and Bikes', '10 am to 6 pm'),
(3, 'Vg', 'vgh', 'bhj', 'nn', 'Alappuzha', 'fg@gmail.com', '55', 'All Cars and Bikes', '10 am to 6 pm');

-- --------------------------------------------------------

--
-- Table structure for table `add_workshop`
--

CREATE TABLE `add_workshop` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `license_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_workshop`
--

INSERT INTO `add_workshop` (`id`, `name`, `contact_no`, `email_id`, `location`, `address`, `license_no`, `status`) VALUES
(3, 'Yfyf', '83558', 'vgh@gmail.com', 'Lat11.8780273,Log75.3730273', 'Sub Jail,Kerala,Kannur,India', '868', 'pending'),
(4, 'Ghh', '45780852', 'cgyu@gmail.vom', 'Lat11.8780271,Log75.3730119', 'Sub Jail,Kerala,Kannur,India', '996', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `phone`, `password`) VALUES
(3, 'admin', 'ad@gmail.com', '9874563698', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `create_service`
--

CREATE TABLE `create_service` (
  `id` int(255) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `mech_name` varchar(255) NOT NULL,
  `services` varchar(255) NOT NULL,
  `available` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `create_service`
--

INSERT INTO `create_service` (`id`, `service_name`, `mech_name`, `services`, `available`, `address`, `city`, `location`, `mobile`, `status`) VALUES
(5, 'Onroad Mech', 'ggy', 'Van', '10 am to 6 pm', 'Sub Jail,Kerala,Kannur,India', 'bhh', 'Lat11.8780356,Log75.3730027', '9965', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `email`, `phone`, `password`) VALUES
(8, 'customer', 'deepz@gmail.com', '9526843393', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `username`, `email`, `phone`, `password`) VALUES
(3, 'service', 'sanvi@gmail.com', '5869895689', 'service');

-- --------------------------------------------------------

--
-- Table structure for table `work_shop`
--

CREATE TABLE `work_shop` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `work_shop`
--

INSERT INTO `work_shop` (`id`, `username`, `email`, `phone`, `password`) VALUES
(2, 'workshop', 'workshop@gmail.com', '9858586969', 'workshop');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_crain`
--
ALTER TABLE `add_crain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_spare_parts`
--
ALTER TABLE `add_spare_parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_worker`
--
ALTER TABLE `add_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_workshop`
--
ALTER TABLE `add_workshop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_service`
--
ALTER TABLE `create_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_shop`
--
ALTER TABLE `work_shop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_crain`
--
ALTER TABLE `add_crain`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `add_spare_parts`
--
ALTER TABLE `add_spare_parts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `add_worker`
--
ALTER TABLE `add_worker`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `add_workshop`
--
ALTER TABLE `add_workshop`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `create_service`
--
ALTER TABLE `create_service`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `work_shop`
--
ALTER TABLE `work_shop`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
