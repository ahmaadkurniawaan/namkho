-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2025 at 08:22 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `namkho`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(9, 'admin', '42dae262b8531b3df48cde9cc018c512', 'admin@gmail.com', 'QFE6ZM', '2025-01-28 14:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `codes`) VALUES
(1, 'QX5ZMN'),
(2, 'QFE6ZM'),
(3, 'QMZR92'),
(4, 'QPGIOV'),
(5, 'QSTE52'),
(6, 'QMTZ2J');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `cat_menu_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `cat_menu_id`, `title`, `slogan`, `price`, `img`) VALUES
(34, 56, 23, 'Tumpeng Wisuda', 'Porsi 4 Orang ', '100000.00', '67b8c80c90a62.png'),
(35, 56, 21, 'Tumpeng Kerucut Mahasura', 'Porsi 8 Orang', '150000.00', '67b3efca98080.png'),
(36, 56, 21, 'Tumpeng Rice Tart ', 'Porsi 5 Orang ', '155000.00', '67b3e344b7e6a.png'),
(37, 56, 21, 'Tumpeng Love Mahasura ', 'Porsi 6 Orang', '170000.00', '67b3e4d404b66.png'),
(38, 56, 21, 'Tumpeng Kerucut Gudangan ', 'Porsi 8 Orang ', '175000.00', '67b3e76d07c1d.png'),
(39, 56, 21, 'Tumpeng Love Sangga Buana', 'Porsi 6 Orang ', '190000.00', '67b3e7bdaba9a.png'),
(40, 56, 21, 'Tumpeng Kerucut Sangga Buana', 'Porsi 8 Orang ', '215000.00', '67b3e933cc1b1.png'),
(41, 56, 21, 'Tumpeng Love Caraka Kencana ', 'Porsi 6 Orang ', '230000.00', '67b3eea127369.png'),
(42, 56, 21, 'Tumpeng Kerucut Caraka Kencana', 'Porsi 8 Orang ', '290000.00', '67b3ef7249b76.png'),
(43, 56, 21, 'Tumpeng Susun 4 Mahasura ', 'Porsi 20 Orang ', '297500.00', '67b3f1a1581e3.png'),
(44, 56, 21, 'Tumpeng Kerucut Kraton Solo', 'Porsi 8 Orang ', '380000.00', '67b3f1ef621d8.png'),
(45, 56, 21, 'Tumpeng Susun 4 Sangga Buana ', 'Porsi 20 Orang ', '380000.00', '67b3f2a5e2b88.png'),
(46, 56, 21, 'Tumpeng Susun 4 Caraka Kencana ', 'Porsi 20 Orang ', '460000.00', '67b3f3503729c.png'),
(47, 56, 21, 'Tumpeng Susun 4 Kraton Solo ', 'Porsi 20 Orang ', '492500.00', '67b3f4a6923f2.png'),
(49, 56, 22, 'Tumpeng Mini Bengawan Solo ', 'Harga 20.000 (Min Order 30 Pcs) , Harga 19.500 (Min Order 100 Pcs)', '23000.00', '67b4027b6fc6c.png');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `m_id` int(222) NOT NULL,
  `m_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`m_id`, `m_name`, `date`) VALUES
(21, 'Tumpeng', '2025-02-05 04:00:13'),
(22, 'Tumpeng Mini', '2025-02-05 04:00:43'),
(23, 'Bento', '2025-02-05 04:00:49'),
(24, 'Box Mika', '2025-02-05 04:00:55'),
(25, 'Nasi Kuning Box', '2025-02-05 04:01:03'),
(26, 'Nasi Box', '2025-02-05 04:01:10'),
(27, 'Lunch Box', '2025-02-05 04:01:14'),
(28, 'Snack Box', '2025-02-05 04:01:19'),
(29, 'Rice Bowl', '2025-02-05 04:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(56, 20, 'NAM KHO', 'namkho@gmail.com', '085271827891', 'https://namkho.com', '24hour', '24hour', 'every-day', ' Surakarta ', '67a2dc5ca088d.png', '2025-02-05 03:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(20, 'Catering', '2025-02-05 03:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(38, 'wawan', 'Wawan', 'Kurniawan', 'aa@a.com', '085271827891', '42dae262b8531b3df48cde9cc018c512', 'lorem', 1, '2025-02-05 07:24:14'),
(39, 'rofiq', 'Aku', 'Test', 'kaconk@gmail.com', '0819938384439', '42dae262b8531b3df48cde9cc018c512', 'Test delivery ', 1, '2025-02-05 09:21:21'),
(40, 'Mas Edwin', 'Edwin', 'Mende', 'edwinmende8@gmail.com', '082-242-438-430', 'e10adc3949ba59abbe56e057f20f883e', '', 1, '2025-02-18 08:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `tgl_pesanan_diantar` date NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `tgl_pesanan_diantar`, `date`) VALUES
(59, 38, 'Paket Promo 1', 1, '45000.00', 'closed', '0000-00-00', '2025-02-05 08:11:18'),
(61, 38, 'Gado Gado', 1, '20000.00', NULL, '0000-00-00', '2025-02-05 07:39:34'),
(62, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 07:39:34'),
(63, 38, 'Gado Gado', 1, '20000.00', NULL, '0000-00-00', '2025-02-05 07:41:23'),
(64, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:23:54'),
(65, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:24:53'),
(66, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:25:28'),
(67, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:25:50'),
(68, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:26:15'),
(69, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:26:28'),
(70, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:26:45'),
(71, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:26:54'),
(72, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:27:03'),
(73, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:27:09'),
(74, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:27:34'),
(75, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:27:46'),
(76, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:27:51'),
(77, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:00'),
(78, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:17'),
(79, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:25'),
(80, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:30'),
(81, 39, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:40'),
(82, 38, 'Paket Promo 1', 1, '45000.00', NULL, '0000-00-00', '2025-02-05 09:28:46'),
(83, 38, 'Gado Gado', 1, '20000.00', NULL, '0000-00-00', '2025-02-05 09:47:20'),
(85, 38, 'Tumpeng Wisuda', 2, '100000.00', NULL, '2025-02-21', '2025-02-21 19:19:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `m_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
