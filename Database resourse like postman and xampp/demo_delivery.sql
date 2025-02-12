-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2025 at 04:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `code`, `name`, `weight`) VALUES
(1, '4rff', 'Glo MiFi', 7),
(402, 'trf', 'Rakes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `item_seq`
--

CREATE TABLE `item_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_seq`
--

INSERT INTO `item_seq` (`next_val`) VALUES
(501);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` bigint(20) NOT NULL,
  `carrying_weight` float NOT NULL,
  `fuel_capacity` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plate_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `carrying_weight`, `fuel_capacity`, `name`, `plate_number`, `status`, `type`) VALUES
(1, 300, 70, 'Toyota J5', 'ABCFCJK', 'maintenance', 'Bus'),
(2, 100, 50, 'Ayei', 'RBC571FF', 'Active', 'Car'),
(3, 100, 50, 'Ayei', 'RBC571FF', 'Active', 'Car'),
(4, 600, 150, 'Eyong', 'RSH558TP', 'Pending delivery', 'Van'),
(5, 600, 150, 'Eyong', 'RSH558TP', 'Pending delivery', 'Van'),
(6, 500, 50, 'Test', 'Habby', 'Ready', 'Bus'),
(302, 0, 0, '', '', '', ''),
(352, 400, 70, 'Sharkl', 'djndfi', 'Active', 'Trailer');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_items`
--

CREATE TABLE `vehicle_items` (
  `vehicle_id` bigint(20) NOT NULL,
  `items_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_items`
--

INSERT INTO `vehicle_items` (`vehicle_id`, `items_id`) VALUES
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_seq`
--

CREATE TABLE `vehicle_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_seq`
--

INSERT INTO `vehicle_seq` (`next_val`) VALUES
(451);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6cgogdarkq48dlg1lbnv4q1oq` (`code`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_items`
--
ALTER TABLE `vehicle_items`
  ADD UNIQUE KEY `UKomy9jax405x6y17bl14c1bqdu` (`items_id`),
  ADD KEY `FK7a2dbbwny9g3knccag3o1qnj5` (`vehicle_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vehicle_items`
--
ALTER TABLE `vehicle_items`
  ADD CONSTRAINT `FK5qp3t4m9svsp5ye35gycfhqxh` FOREIGN KEY (`items_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK7a2dbbwny9g3knccag3o1qnj5` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
