-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:9519
-- Generation Time: Jun 06, 2023 at 03:04 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unibook`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `TicketID` int(6) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0,
  `UserID` int(11) UNSIGNED NOT NULL,
  `Uniform` varchar(255) NOT NULL,
  `StartDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'CartLimit', '10'),
(2, 'CartLimitPerDay', '2'),
(3, 'bookLimit', '20');

-- --------------------------------------------------------

--
-- Table structure for table `uniforms`
--

CREATE TABLE `uniforms` (
  `id` int(11) NOT NULL,
  `Item` varchar(255) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Gender` enum('None','Male','Female','All') DEFAULT 'None',
  `Academic_Level` enum('None','Senior','College') DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `uniforms`
--

INSERT INTO `uniforms` (`id`, `Item`, `Image`, `Category`, `Gender`, `Academic_Level`) VALUES
(1, 'Blouse with Vest', 'polo_with_vest', 'Uniform', 'Female', 'Senior'),
(2, 'Polo with Vest', 'polo_with_vest', 'Uniform', 'Male', 'Senior'),
(3, 'Chefs Polo Female', 'chefs_polo_female', 'Uniform', 'Female', 'Senior'),
(4, 'Chefs Polo Male', 'none', 'Uniform', 'Male', 'Senior'),
(5, 'P.E Shirt', 'pe_shirt', 'Uniform', 'All', 'Senior'),
(6, 'P.E Pants', 'pe_pants', 'Uniform', 'All', 'Senior'),
(7, 'RTW Skirt', 'rtw_skirt', 'Uniform', 'Female', 'Senior'),
(8, 'RTW Male Pants', 'rtw_male_pants', 'Uniform', 'Male', 'Senior'),
(9, 'Chefs Pants Female', 'chefs_pants_female', 'Uniform', 'Female', 'Senior'),
(10, 'Chefs Pants Male', 'none', 'Uniform', 'Male', 'Senior'),
(11, 'Necktie', 'necktie', 'Others', 'None', 'Senior'),
(12, 'Apron', 'none', 'Others', 'None', 'Senior'),
(13, 'Beanie', 'beanie', 'Others', 'None', 'Senior');

-- --------------------------------------------------------

--
-- Table structure for table `uniforms_info`
--

CREATE TABLE `uniforms_info` (
  `id` int(11) NOT NULL,
  `UniformID` int(11) NOT NULL,
  `Size` enum('None','XS','S','M','L','XL','2XL','3XL') NOT NULL DEFAULT 'None',
  `Stack` int(11) NOT NULL DEFAULT 0,
  `Cost` decimal(20,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `uniforms_info`
--

INSERT INTO `uniforms_info` (`id`, `UniformID`, `Size`, `Stack`, `Cost`) VALUES
(1, 1, 'S', 103, '550.00'),
(2, 1, 'M', 130, '550.00'),
(3, 1, 'L', 114, '550.00'),
(4, 1, 'XL', 0, '550.00'),
(5, 1, '2XL', 0, '550.00'),
(6, 1, '3XL', 0, '550.00'),
(7, 2, 'S', 103, '570.00'),
(8, 2, 'M', 0, '570.00'),
(9, 2, 'L', 0, '570.00'),
(10, 2, 'XL', 0, '570.00'),
(11, 2, '2XL', 0, '600.00'),
(12, 2, '3XL', 0, '600.00'),
(13, 3, 'XS', 0, '400.00'),
(14, 3, 'S', 0, '400.00'),
(15, 3, 'M', 0, '400.00'),
(16, 3, 'L', 0, '400.00'),
(17, 3, 'XL', 0, '400.00'),
(18, 3, '2XL', 0, '400.00'),
(19, 4, 'XS', 0, '400.00'),
(20, 4, 'S', 0, '400.00'),
(21, 4, 'M', 0, '400.00'),
(22, 4, 'L', 0, '400.00'),
(23, 4, 'XL', 0, '400.00'),
(24, 4, '2XL', 0, '400.00'),
(25, 5, 'XS', 0, '175.00'),
(26, 5, 'S', 0, '175.00'),
(27, 5, 'M', 0, '175.00'),
(28, 5, 'L', 0, '175.00'),
(29, 5, 'XL', 0, '175.00'),
(30, 5, '2XL', 0, '175.00'),
(31, 5, '3XL', 0, '175.00'),
(32, 6, 'XS', 0, '300.00'),
(33, 6, 'S', 0, '300.00'),
(34, 6, 'M', 0, '300.00'),
(35, 6, 'L', 0, '300.00'),
(36, 6, 'XL', 0, '300.00'),
(37, 6, '2XL', 0, '300.00'),
(38, 6, '3XL', 0, '300.00'),
(39, 7, 'S', 99, '245.00'),
(40, 7, 'M', 0, '245.00'),
(41, 7, 'L', 0, '245.00'),
(42, 7, 'XL', 0, '245.00'),
(43, 7, '2XL', 0, '245.00'),
(44, 7, '3XL', 0, '245.00'),
(45, 8, 'S', 98, '405.00'),
(46, 8, 'M', 0, '405.00'),
(47, 8, 'L', 0, '405.00'),
(48, 8, 'XL', 0, '405.00'),
(49, 8, '2XL', 0, '430.00'),
(50, 9, 'XS', 0, '250.00'),
(51, 9, 'S', 0, '250.00'),
(52, 9, 'M', 0, '250.00'),
(53, 9, 'L', 0, '250.00'),
(54, 9, 'XL', 0, '250.00'),
(55, 9, '2XL', 0, '250.00'),
(56, 10, 'XS', 0, '265.00'),
(57, 10, 'S', 0, '265.00'),
(58, 10, 'M', 0, '265.00'),
(59, 10, 'L', 0, '265.00'),
(60, 10, 'XL', 0, '265.00'),
(61, 10, '2XL', 0, '265.00'),
(62, 11, 'None', 63, '85.00'),
(63, 12, 'None', 50, '85.00'),
(64, 13, 'None', 50, '85.00'),
(65, 10, 'XS', 0, '265.00'),
(66, 10, 'S', 0, '265.00'),
(67, 10, 'M', 0, '265.00'),
(68, 10, 'L', 0, '265.00'),
(69, 10, 'XL', 0, '265.00'),
(70, 10, '2XL', 0, '265.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `StudentID` int(11) NOT NULL,
  `First_Name` varchar(60) NOT NULL,
  `Middle_Name` varchar(60) NOT NULL,
  `Last_Name` varchar(60) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Age` int(11) NOT NULL,
  `Is_Admin` tinyint(1) NOT NULL DEFAULT 0,
  `Academic_Level` enum('Senior','College') DEFAULT 'Senior',
  `Year_Level` int(11) NOT NULL DEFAULT 11,
  `Program` varchar(50) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL DEFAULT 'Male'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `StudentID`, `First_Name`, `Middle_Name`, `Last_Name`, `Password`, `Email`, `Age`, `Is_Admin`, `Academic_Level`, `Year_Level`, `Program`, `Gender`) VALUES
(1, 2000253086, 'Ryan Paul', 'Losanez', 'Espinola', 'ryanpaul123', 'espinolaryanpaul017@gmail.com', 17, 1, 'Senior', 12, 'IT', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `users_cart`
--

CREATE TABLE `users_cart` (
  `id` int(11) NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `UniformID` int(11) NOT NULL,
  `UniformInfo` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `Date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `users_cart`
--

INSERT INTO `users_cart` (`id`, `UserID`, `UniformID`, `UniformInfo`, `Quantity`, `Date`) VALUES
(304, 1, 1, 3, 1, '2023-06-05 06:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `users_cart_logs`
--

CREATE TABLE `users_cart_logs` (
  `UserID` int(11) UNSIGNED NOT NULL,
  `UniformID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_cart_logs`
--

INSERT INTO `users_cart_logs` (`UserID`, `UniformID`, `Date`) VALUES
(1, 8, '2023-05-26 09:23:12'),
(1, 11, '2023-05-26 09:40:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_book_users` (`UserID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uniforms`
--
ALTER TABLE `uniforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uniforms_info`
--
ALTER TABLE `uniforms_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_users_size_uniforms` (`UniformID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_cart`
--
ALTER TABLE `users_cart`
  ADD PRIMARY KEY (`id`,`UniformInfo`) USING BTREE,
  ADD KEY `FK_users_cart_users` (`UserID`),
  ADD KEY `FK_users_cart_uniforms` (`UniformID`),
  ADD KEY `FK_users_cart_uniforms_info` (`UniformInfo`);

--
-- Indexes for table `users_cart_logs`
--
ALTER TABLE `users_cart_logs`
  ADD KEY `FK_users_cart_logs_uniforms` (`UniformID`),
  ADD KEY `FK_users_cart_logs_users` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uniforms`
--
ALTER TABLE `uniforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `uniforms_info`
--
ALTER TABLE `uniforms_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_cart`
--
ALTER TABLE `users_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_book_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uniforms_info`
--
ALTER TABLE `uniforms_info`
  ADD CONSTRAINT `FK_users_size_uniforms` FOREIGN KEY (`UniformID`) REFERENCES `uniforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_cart`
--
ALTER TABLE `users_cart`
  ADD CONSTRAINT `FK_users_cart_uniforms` FOREIGN KEY (`UniformID`) REFERENCES `uniforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_cart_uniforms_info` FOREIGN KEY (`UniformInfo`) REFERENCES `uniforms_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_cart_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_cart_logs`
--
ALTER TABLE `users_cart_logs`
  ADD CONSTRAINT `FK_users_cart_logs_uniforms` FOREIGN KEY (`UniformID`) REFERENCES `uniforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_users_cart_logs_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
