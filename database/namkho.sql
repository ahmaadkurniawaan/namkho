-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Mar 2025 pada 03.07
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `namkho2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(9, 'admin', '42dae262b8531b3df48cde9cc018c512', 'admin@gmail.com', 'QFE6ZM', '2025-01-28 14:38:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin_codes`
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
-- Struktur dari tabel `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `cat_menu_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL,
  `termurah` varchar(5) NOT NULL,
  `bestseller` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `cat_menu_id`, `title`, `slogan`, `price`, `img`, `termurah`, `bestseller`) VALUES
(34, 56, 21, 'Tumpeng Wisuda', 'Porsi 4 Orang ', 100000.00, '67bddf9601f1a.png', '', ''),
(35, 56, 21, 'Tumpeng Kerucut Mahasura', 'Porsi 8 Orang', 150000.00, '67be45d9869af.png', '', ''),
(36, 56, 21, 'Tumpeng Rice Tart ', 'Porsi 5 Orang ', 155000.00, '67be4610b93c0.png', '', ''),
(37, 56, 21, 'Tumpeng Love Mahasura ', 'Porsi 6 Orang', 170000.00, '67be46689b099.png', '', ''),
(38, 56, 21, 'Tumpeng Kerucut Gudangan ', 'Porsi 8 Orang ', 175000.00, '67be468ea5ce2.png', '', ''),
(39, 56, 21, 'Tumpeng Love Sangga Buana', 'Porsi 6 Orang ', 190000.00, '67be46a958395.png', '', ''),
(40, 56, 21, 'Tumpeng Kerucut Sangga Buana', 'Porsi 8 Orang ', 215000.00, '67be475a91432.png', '', ''),
(41, 56, 21, 'Tumpeng Love Caraka Kencana ', 'Porsi 6 Orang ', 230000.00, '67be47794f3e2.png', '', ''),
(42, 56, 21, 'Tumpeng Kerucut Caraka Kencana', 'Porsi 8 Orang ', 290000.00, '67be479be9726.png', '', ''),
(43, 56, 21, 'Tumpeng Susun 4 Mahasura ', 'Porsi 20 Orang ', 297500.00, '67be47d73b7ff.png', '', ''),
(44, 56, 21, 'Tumpeng Kerucut Kraton Solo', 'Porsi 8 Orang ', 380000.00, '67be47f037767.png', '', ''),
(45, 56, 21, 'Tumpeng Susun 4 Sangga Buana ', 'Porsi 20 Orang ', 380000.00, '67be481fd7a02.png', '', ''),
(46, 56, 21, 'Tumpeng Susun 4 Caraka Kencana ', 'Porsi 20 Orang ', 460000.00, '67be488c41387.png', '', ''),
(47, 56, 21, 'Tumpeng Susun 4 Kraton Solo ', 'Porsi 20 Orang ', 492500.00, '67be48c7097b2.png', '', ''),
(49, 56, 22, 'Tumpeng Mini Bengawan Solo ', 'Isian Khas : Telur Bacem', 23000.00, '67be498b2c3ff.png', '', ''),
(50, 56, 22, 'Tumpeng Mini Gudangan ', 'Isian Khas : 1 Cup Rujak Buah ', 23000.00, '67be5e39966be.png', '', ''),
(51, 56, 22, 'Tumpeng Mini Mahasura ', 'Isian Khas : Ayam Fillet Crispy', 24000.00, '67be5eb687c3e.png', '', ''),
(52, 56, 22, 'Tumpeng Mini Sangga Buana ', 'Isian Khas : Ayam Fillet Crispy, Telur Bacem', 25000.00, '67be5f04d3117.png', '', ''),
(53, 56, 22, 'Tumpeng Mini Caraka Kencana', 'Isian Khas : Ayam Fillet Crispy, Telur Bacem', 27000.00, '67be5f5f28805.png', '', ''),
(54, 56, 22, 'Tumpeng Mini Kraton Solo ', 'Isian Khas : Paha Ayam Ungkep', 28500.00, '67be5fad0828f.png', '', ''),
(55, 56, 22, 'Tumpeng Mini XL Werkudara ', 'Isian Khas : Telur Bacem', 29000.00, '67be5fd712bc9.png', '', ''),
(56, 56, 22, 'Tumpeng Mini XL Arjuna', 'Isian Khas : Paha Ayam Ungkep', 34000.00, '67be6024945ff.png', '', ''),
(57, 56, 22, 'Tumpeng Mini XL Abimanyu', 'Isian Khas : Tepong Ayam Bakar ', 37500.00, '67be607393a7b.png', '', ''),
(58, 56, 22, 'Tumpeng Mini XL Gatotkaca', 'Isian : Paha Tepong Ungkep ', 40500.00, '67be60b3cea02.png', '', ''),
(59, 56, 23, 'Nasi Bento ', 'Isian Khas : Telur Rajang', 22000.00, '67be612f10dbc.png', '', ''),
(60, 56, 23, 'Nasi Bento Susu ', 'Isian Khas : Susu Indomilk', 22500.00, '67be618b79f1e.png', '', ''),
(61, 56, 23, 'Nasi Bento Kacang Hijau ', 'Isian Khas : Sari Kacang Ijo', 25500.00, '67be6472174c6.png', '', ''),
(62, 56, 23, 'Nasi Bento Yakult & Cimory ', 'Isian Khas : Yakult & Cimory ', 29000.00, '67be64a8cb659.png', '', ''),
(63, 56, 23, 'Nasi Bento Bear Brand', 'Isian Khas : Susu Bear Brand ', 33000.00, '67be64cb95d30.png', '', ''),
(64, 56, 24, 'Nasi Box Mika Daniswara ', 'Isian Khas : Telur Bacem', 17000.00, '67be65587bc45.png', '', ''),
(65, 56, 24, 'Nasi Box Mika Dewandaru ', 'Isian Khas : Nugget Ayam ', 17000.00, '67be658a84996.png', '', ''),
(66, 56, 24, 'Nasi Box Mika Danurdara', 'Isian Khas : Telur Ceplok', 17000.00, '67be65b7c3ff8.png', '', ''),
(67, 56, 24, 'Selat Solo Box Mika', 'Isian Khas : Galantin & Telur Bacem ', 18000.00, '67be660d19c49.png', '', ''),
(68, 56, 25, 'Nasi Kuning Box Sekar Jagad', 'Isian Khas : Telur Bacem', 16500.00, '67be66713bcb6.png', '', ''),
(69, 56, 25, 'NAsi Kuning Box Pring Sedapur ', 'Isian Khas : Telur Bacem', 17000.00, '67be66aba82e9.png', '', ''),
(70, 56, 25, 'Nasi Kuning Box Sekar Pangkur', 'Isian Khas : Telur Balado ', 17500.00, '67be66da3f315.png', '', ''),
(71, 56, 25, 'Nasi Kuning Box Sekar Gambuh', 'Isian Khas : Telur Bacem & Kerupuk Udang ', 17500.00, '67be67235b19b.png', '', ''),
(72, 56, 25, 'Nasi Kuning Box Sekar Ayu ', 'Isian Khas : Telur Bacem & Ayam Suwir Terik', 18000.00, '67be67a58dc70.png', '', ''),
(73, 56, 25, 'Nasi Kuning Box Parang Klithik', 'Isian Khas : 1 Cup Pudding', 21000.00, '67be6a8b98571.png', '', ''),
(74, 56, 25, 'Nasi Kuning Box Mega Mendung', 'Isian Khas : Paha Ayam Ungkep', 21000.00, '67be6ab96b817.png', '', ''),
(75, 56, 25, 'Nasi Kuning Box Sido Luhur', 'Isian Khas : Telur Bacem & Kerupuk Udang ', 21000.00, '67be6af485b81.png', '', ''),
(76, 56, 25, 'Nasi Kuning Box Sekar Asih', 'Isian Khas : Telur Bacem & Ayam Suwir Terik', 23000.00, '67be6b3f41413.png', '', ''),
(77, 56, 25, 'Nasi Box Pudding Sangga Buana', 'Isian Khas : Nugget Ayam ', 23000.00, '67be6b74eff57.png', '', ''),
(78, 56, 25, 'Nasi Kuning Box Satrio Manah', 'Isian Khas : Paha Ayam Ungkep & Telur Bacem', 25000.00, '67be6bbc9917f.png', '', ''),
(79, 56, 25, 'Nasi Kuning Box Mitoni ', 'Isian Khas : Ketan 7 Warna', 25000.00, '67be6bfe8b822.png', '', ''),
(80, 56, 25, 'Nasi Kuning Box Pudding Mahsura', 'Isian Khas : Telur Bacem', 27000.00, '67be6c2d0e01e.png', '', ''),
(81, 56, 25, 'Nasi Kuning Box Pudding Caraka Kencana', 'Isian Khas : Paha Ayam Ungkep', 27000.00, '67be6c6d4d634.png', '', ''),
(82, 56, 25, 'Nasi Kuning Box Pringgondani', 'Isian Khas : Paha Tepong Gandeng ', 30500.00, '67be6d2c91f18.png', '', ''),
(83, 56, 25, 'Nasi Kuning Box Sultan Andara', 'Isian Khas : Paha Tepong Gandeng  & Buah Pisang', 33000.00, '67be6d60a0a83.png', '', ''),
(84, 56, 26, 'Nasi Box Truntum ', 'Isian Khas : Perkedel Mini & Telur Bacem ', 18000.00, '67be6dbc89100.png', '', ''),
(85, 56, 26, 'Nasi Box Cendrawasih 1', 'Isian Khas : Telur Bacem', 20000.00, '67be7c8369e55.png', '', ''),
(86, 56, 26, 'Nasi Box Cendrawasih 2', 'Isian Khas : Telur Balado ', 20000.00, '67be7cdf3848d.png', '', ''),
(87, 56, 26, 'Nasi Box Cendrawasih 3', 'Isian Khas : Telur Ceplok', 200000.00, '67be7c1e506d7.png', '', ''),
(88, 56, 26, 'Nasi Box Cendrawasih 4', 'Isian Khas : Telur Dadar', 20000.00, '67be7d0f8082c.png', '', ''),
(89, 56, 26, 'Nasi Box Paket Ayam Bakar Nakula (Standart)', 'Isian Khas : Paha Ayam Bakar', 22000.00, '67be7eff84e79.png', '', ''),
(90, 56, 26, 'Nasi Box Sido Mukti', 'Isian Khas : Paha Ayam Ungkep', 20000.00, '67be7e123f5a8.png', '', ''),
(91, 56, 26, 'Nasi Box Paket Ayam Bakar Sadewa (Standart)', 'Isian Khas : Tepong Ayam Bakar ', 22000.00, '67be7f1c90bd3.png', '', ''),
(92, 56, 26, 'Nasi Box Paket Ayam Bakar Nakula (Premium)', 'Isian Khas : Kangkung Belacan + Paha Ayam Bakar ', 22000.00, '67be7fb995b01.png', '', ''),
(93, 56, 26, 'Nasi Box Gudangan Kinanthi ', 'Isian Khas : Telur Rebus', 24000.00, '67be7ffd3aec3.png', '', ''),
(94, 56, 26, 'Nasi Box Paket Ayam Bakar Puntadewa (Standart)', 'Isian Khas : Paha Tepong Ayam Bakar', 24000.00, '67be80564561c.png', '', ''),
(95, 56, 26, 'Nasi Box Paket Ayam Bakar Sadewa (Premium)', 'Isian Khas : Kangkung Belacan + Tepong Ayam Bakar ', 24000.00, '67be8190052a5.png', '', ''),
(96, 56, 26, 'NAsi Box Paket Ayam Bakar Puntadewa (Premium)', 'Isian Khas : Kangkung Belacan +  Paha Tepong Ayam Bakar ', 24000.00, '67be822479cda.png', '', ''),
(97, 56, 26, 'Nasi Box Candi Sewu', 'Isian Khas : Lalapan', 26000.00, '67be8340dbe92.png', '', ''),
(98, 56, 26, 'Nasi Box Candi Prambanan', 'Isian Khas : Tumis Jamur Kuping', 26000.00, '67be82e76f33a.png', '', ''),
(99, 56, 26, 'Nasi Box Candi Borobudur ', 'Isian Khas : Oseng Tempe ', 26000.00, '67be83206413c.png', '', ''),
(100, 56, 26, 'Nasi Box Maskumambang ', 'Isian Khas : Telur Rebus & Paha Ayam Ungkep ', 27000.00, '67be83bc086e6.png', '', ''),
(101, 56, 26, 'Nasi Box Aqiqah', 'Isian Khas : Tengkleng Kambing  & Sate Kambing ', 31000.00, '67be83fd9297e.png', '', ''),
(102, 56, 26, 'Nasi Box Brahmana ', 'Isian Khas : Tumis Jamur Kuping', 33000.00, '67be853cf13c9.png', '', ''),
(103, 56, 26, 'Nasi Box Brawijaya ', 'Isian Khas : Tahu Tempe Goreng ', 33000.00, '67be858739a8b.png', '', ''),
(104, 56, 27, 'Lunch Box Hemat 2', 'Isian Khas : Tumis Jamur Tiram + Bakwan', 12000.00, '67be85cab7661.png', '', ''),
(105, 56, 27, 'Lunch Box Hemat 3', 'Isian Khas : Tumis Jamur Kuping + Tahu Tempe Goreng ', 12000.00, '67be86029ede5.png', '', ''),
(106, 56, 27, 'Lunch Box Hemat 1', 'Isian Khas : Oseng Usus + Tahu Tempe Bacem ', 13000.00, '67be865a63df1.png', '', ''),
(107, 56, 27, 'Lunch Box Hemat 4', 'Isian Khas : Sayur Pecel ', 13000.00, '67be868f6e7b3.png', '', ''),
(108, 56, 27, 'Lunch Box Hemat 6', 'Isian Khas : Ayam Crispy ', 13000.00, '67be86cc947a0.png', '', ''),
(109, 56, 26, 'Lunch Box Hemat 5', 'Isian Khas : Ayam Pop + Saus Asam Manis', 15000.00, '67be8780180ce.png', '', ''),
(110, 56, 27, 'Lunch Hemat Premium ', 'Isian Khas : Nasi Kuning Komplit', 18000.00, '67be87d3d89d1.png', '', ''),
(111, 56, 28, 'Snack Box 1', 'Isian Khas : Snack Jajan Pasar', 8000.00, '67be885c033eb.png', '', ''),
(112, 56, 28, 'Snack Box 3', 'Isian Khas : Snack Jajan Pasar', 8000.00, '67bf24fd7de20.png', '', ''),
(113, 56, 28, 'Snack Box 5', 'Isian Khas : Snack Jajan Pasar', 8000.00, '67bf2555bcdae.png', '', ''),
(114, 56, 28, 'Snack Box 6', 'Isian Khas : Snack Jajan Pasar', 8000.00, '67c04a1b95ea3.png', '', ''),
(115, 56, 28, 'Snack Box 9', 'Isian Khas : Snack Jajan Pasar', 8000.00, '67bf2738b6f64.png', '', ''),
(116, 56, 28, 'Snack Box 10', 'Isian Khas : Snack Jajan Pasar', 10000.00, '67bf27e764385.png', '', ''),
(117, 56, 28, 'Snack Box 10 ', 'Isian Khas : Snack Jajan Pasar', 10000.00, '67bf2a790aa2b.png', '', ''),
(118, 56, 28, 'Snack Box 2 ', 'Isian Khas : Snack Jajan Pasar', 12000.00, '67bf2c9180208.png', '', ''),
(119, 56, 28, 'Snack Box 4 ', 'Isian Khas : Snack Jajan Pasar', 12000.00, '67bf2b9520bc1.png', '', ''),
(120, 56, 28, 'Snack Box 7 ', 'Isian Khas : Snack Jajan Pasar', 12000.00, '67bf2be0ec456.png', '', ''),
(121, 56, 28, 'Snack Box 8', 'Isian Khas : Snack Jajan Pasar', 12000.00, '67bf2c06ee598.png', '', ''),
(123, 56, 32, 'Rice Bowl Nasi Kuning Nugget', 'Isian Khas : Nugget Ayam ', 14000.00, '67bf30b766c70.png', '', ''),
(124, 56, 32, 'Rice Bowl Asam Manis', 'Isian Khas : Nugget Ayam  Saus Asam Manis ', 16000.00, '67bf310b2e297.png', '', ''),
(125, 56, 32, 'RIce Bowl Chicken Pop Saus', 'Isian Khas : Chicken Pop', 16000.00, '67bf316492b75.png', '', ''),
(126, 56, 32, 'Rice Bowl Chicken Pop Sambal Terasi ', 'Isian Khas : Chicken Pop Sambal Terasi ', 16000.00, '67bf31a47a072.png', '', ''),
(127, 56, 32, 'Rice Bowl Chicken Pop Mix Vegetable ', 'Isian Khas : Mix Vegetable ', 16000.00, '67bf31d54fde1.png', '', ''),
(128, 56, 32, 'RIce Bowl Telur Asin ', 'Isian Khas : Telur Asin', 19500.00, '67bf32292ad82.png', '', ''),
(129, 56, 32, 'Rice Bowl Nasi Kuning Telur Asin ', 'Isian Khas : Telur Asin ', 20000.00, '67bf326d83dc4.png', '', ''),
(130, 56, 32, 'Rice Bowl Nasi Kuning Chicken Pop ', 'Isian Khas : Chicken Pop', 17000.00, '67bf32cbc3185.png', '', ''),
(131, 56, 33, 'Tampah Ingkung Ayam Broiler ', 'Isian Khas : Ayam Ingkung Broiler ', 140000.00, '67bf3324448bf.png', '', ''),
(132, 56, 33, 'Tampah Ingkung Ayam Kampung', 'Isian Khas : Ingkung Ayam Kampung ', 170000.00, '67bf335b3eebb.png', '', ''),
(133, 56, 33, 'Tampah Liwetan Sunda Cumi Hitam ', 'Isian Khas : Cumi Hitam ', 210000.00, '67bf33c07f230.png', '', ''),
(134, 56, 33, 'Tampah Liwetan Sunda Udang Asam Manis ', 'Isian Khas Udang Asam Manis ', 210000.00, '67bf34025d1a1.png', '', ''),
(135, 56, 33, 'Tampah Kleman Jumbo', 'Isian Khas : Snack Jajan Pasar', 450000.00, '67bf342e10c60.png', '', ''),
(136, 56, 33, 'Tampah Ayam Goreng Bancakan', 'Isian Khas : Ayam Ungkep ', 585000.00, '67bf34698dc35.png', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_category`
--

CREATE TABLE `menu_category` (
  `m_id` int(222) NOT NULL,
  `m_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `menu_category`
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
(32, 'Rice Bowl', '2025-02-26 15:15:59'),
(33, 'Tampah', '2025-02-26 15:16:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `restaurant`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(56, 20, 'NAM KHO', 'namkho@gmail.com', '085271827891', 'https://namkho.com', '24hour', '24hour', 'every-day', ' Surakarta ', '67a2dc5ca088d.png', '2025-02-05 03:34:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(20, 'Catering', '2025-02-05 03:30:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(40, 'Mas Edwin', 'Edwin', 'Mende', 'edwinmende8@gmail.com', '082-242-438-430', 'e10adc3949ba59abbe56e057f20f883e', '', 1, '2025-02-18 08:50:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_orders`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `tgl_pesanan_diantar`, `date`) VALUES
(59, 38, 'Paket Promo 1', 1, 45000.00, 'closed', '0000-00-00', '2025-02-05 08:11:18'),
(61, 38, 'Gado Gado', 1, 20000.00, NULL, '0000-00-00', '2025-02-05 07:39:34'),
(62, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 07:39:34'),
(63, 38, 'Gado Gado', 1, 20000.00, NULL, '0000-00-00', '2025-02-05 07:41:23'),
(64, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:23:54'),
(65, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:24:53'),
(66, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:25:28'),
(67, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:25:50'),
(68, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:26:15'),
(69, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:26:28'),
(70, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:26:45'),
(71, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:26:54'),
(72, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:27:03'),
(73, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:27:09'),
(74, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:27:34'),
(75, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:27:46'),
(76, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:27:51'),
(77, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:00'),
(78, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:17'),
(79, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:25'),
(80, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:30'),
(81, 39, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:40'),
(82, 38, 'Paket Promo 1', 1, 45000.00, NULL, '0000-00-00', '2025-02-05 09:28:46'),
(83, 38, 'Gado Gado', 1, 20000.00, NULL, '0000-00-00', '2025-02-05 09:47:20'),
(85, 38, 'Tumpeng Wisuda', 2, 100000.00, NULL, '2025-02-21', '2025-02-21 19:19:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indeks untuk tabel `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indeks untuk tabel `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`m_id`);

--
-- Indeks untuk tabel `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indeks untuk tabel `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indeks untuk tabel `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT untuk tabel `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `m_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
