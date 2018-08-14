-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2018 at 07:31 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockis_nasa_v1_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_stockis`
--

CREATE TABLE `alamat_stockis` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_alamat` varchar(50) NOT NULL,
  `alamat` varchar(191) NOT NULL,
  `provinsi_id` int(5) NOT NULL,
  `kabupaten_id` int(5) NOT NULL,
  `kecamatan_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kd_barang` varchar(191) NOT NULL,
  `nama_barang` varchar(191) NOT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `volume_barang_tampilan` varchar(11) DEFAULT NULL,
  `berat_barang_tampilan` varchar(11) DEFAULT NULL,
  `berat_barang_asli` varchar(11) DEFAULT NULL COMMENT 'Setelah di packing',
  `PV` int(11) DEFAULT NULL COMMENT 'Poin Value',
  `BV` int(11) DEFAULT NULL COMMENT 'Business Value',
  `foto_barang` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kd_barang`, `nama_barang`, `jumlah_barang`, `volume_barang_tampilan`, `berat_barang_tampilan`, `berat_barang_asli`, `PV`, `BV`, `foto_barang`, `created_at`, `updated_at`) VALUES
(1, 'A810', 'AERO 810 PEREKAT PERATA', 18, '250', '250', '250', 9, 9000, '1519400888.jpg', '2018-02-23 08:48:08', '2018-02-23 08:48:08'),
(2, 'BTANI', 'PUPUK BINTANG TANI', 6, '1000', '1000', '1000', 10, 10000, '1519401284.jpg', '2018-02-23 08:54:44', '2018-02-23 08:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `barang_distributor`
--

CREATE TABLE `barang_distributor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_distributor`
--

INSERT INTO `barang_distributor` (`id`, `nama_barang`, `created_at`, `updated_at`) VALUES
(1, 'Deser', '2018-01-22 21:41:46', '2018-01-22 21:41:46'),
(2, 'Update', '2018-01-23 05:05:57', '2018-01-22 22:05:58'),
(3, 'Kartu Distributor', '2018-02-11 02:56:15', '2018-02-11 02:56:15');

-- --------------------------------------------------------

--
-- Table structure for table `barang_reject`
--

CREATE TABLE `barang_reject` (
  `id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED DEFAULT NULL,
  `jml` int(4) DEFAULT NULL,
  `keterangan` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_kelengkapan`
--

CREATE TABLE `detail_kelengkapan` (
  `id` int(10) UNSIGNED NOT NULL,
  `kelengkapan_id` int(10) UNSIGNED DEFAULT NULL,
  `barang_distributor_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('diambil','belum diambil') DEFAULT 'belum diambil',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_login_id` int(10) UNSIGNED NOT NULL,
  `peringkat_distributor_id` int(10) UNSIGNED DEFAULT NULL,
  `nama` varchar(191) DEFAULT NULL,
  `kode_distributor` varchar(16) DEFAULT NULL,
  `kode_upline` varchar(10) DEFAULT NULL,
  `nama_upline` varchar(191) DEFAULT NULL,
  `alamat` text,
  `no_hp` varchar(15) DEFAULT NULL,
  `foto` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id`, `user_login_id`, `peringkat_distributor_id`, `nama`, `kode_distributor`, `kode_upline`, `nama_upline`, `alamat`, `no_hp`, `foto`, `created_at`, `updated_at`) VALUES
(7, 10, 5, 'Honda Tsubasa', 'N-1', NULL, NULL, 'Yogyakarta', '0823-2134-1231', '1520355177-tsubasa-honda.jpg', '2018-03-06 09:52:57', '2018-03-06 09:52:57'),
(8, 11, 4, 'Kitagawa Keiko', 'N-2', '7', 'Honda Tsubasa', 'Yogyakarta', '0823-2134-1231', '1520356459-kitagawa-keiko.jpg', '2018-03-08 04:52:30', '2018-03-07 21:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `ekspedisi`
--

CREATE TABLE `ekspedisi` (
  `id` int(11) NOT NULL,
  `kode_ekspedisi` varchar(11) NOT NULL,
  `nama_ekspedisi` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ekspedisi`
--

INSERT INTO `ekspedisi` (`id`, `kode_ekspedisi`, `nama_ekspedisi`, `created_at`, `updated_at`) VALUES
(1, 'jne', 'Jalur Nugraha Ekakurir (JNE)', '2018-03-30 07:30:29', '2018-03-30 07:30:29'),
(2, 'pos', 'POS Indonesia (POS)', '2018-03-30 16:15:23', '2018-03-30 09:15:23'),
(3, 'tiki', 'Citra Van Titipan Kilat (TIKI)', '2018-03-30 07:31:17', '2018-03-30 07:31:17'),
(4, 'pcp', 'Priority Cargo and Package (PCP)', '2018-03-30 07:31:59', '2018-03-30 07:31:59'),
(5, 'esl', 'Eka Sari Lorena (ESL)', '2018-03-30 07:32:21', '2018-03-30 07:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id` int(10) UNSIGNED NOT NULL,
  `barang_id` int(10) UNSIGNED DEFAULT NULL,
  `wilayah_id` int(10) UNSIGNED DEFAULT NULL,
  `jenis_harga` enum('stockis','distributor','konsumen') DEFAULT NULL,
  `harga` decimal(18,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id`, `barang_id`, `wilayah_id`, `jenis_harga`, `harga`, `created_at`, `updated_at`) VALUES
(25, 2, 1, 'stockis', '40000.00', NULL, NULL),
(26, 2, 2, 'stockis', '47000.00', NULL, NULL),
(27, 2, 3, 'stockis', '51000.00', NULL, NULL),
(28, 2, 4, 'stockis', '55000.00', NULL, NULL),
(29, 2, 1, 'distributor', '50000.00', NULL, NULL),
(30, 2, 2, 'distributor', '57000.00', NULL, NULL),
(31, 2, 3, 'distributor', '61000.00', NULL, NULL),
(32, 2, 4, 'distributor', '65000.00', NULL, NULL),
(33, 2, 1, 'konsumen', '70000.00', NULL, NULL),
(34, 2, 2, 'konsumen', '77000.00', NULL, NULL),
(35, 2, 3, 'konsumen', '81000.00', NULL, NULL),
(36, 2, 4, 'konsumen', '85000.00', NULL, NULL),
(79, 1, 1, 'stockis', '21000.00', NULL, NULL),
(80, 1, 2, 'stockis', '23000.00', NULL, NULL),
(81, 1, 3, 'stockis', '25000.00', NULL, NULL),
(82, 1, 4, 'stockis', '28000.00', NULL, NULL),
(83, 1, 5, 'stockis', '2000.00', NULL, NULL),
(84, 1, 1, 'distributor', '31000.00', NULL, NULL),
(85, 1, 2, 'distributor', '32000.00', NULL, NULL),
(86, 1, 3, 'distributor', '35000.00', NULL, NULL),
(87, 1, 4, 'distributor', '36000.00', NULL, NULL),
(88, 1, 5, 'distributor', '2000.00', NULL, NULL),
(89, 1, 1, 'konsumen', '41000.00', NULL, NULL),
(90, 1, 2, 'konsumen', '43000.00', NULL, NULL),
(91, 1, 3, 'konsumen', '45000.00', NULL, NULL),
(92, 1, 4, 'konsumen', '46000.00', NULL, NULL),
(93, 1, 5, 'konsumen', '3000.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelengkapan`
--

CREATE TABLE `kelengkapan` (
  `id` int(10) UNSIGNED NOT NULL,
  `distributor_id` int(10) UNSIGNED DEFAULT NULL,
  `total_rabat` decimal(16,2) DEFAULT NULL,
  `keterangan` text,
  `status` enum('done','process') DEFAULT 'process',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `portal_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `portal_id`, `user_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'insert', 'Menambahkan menu ', '2018-02-23 08:48:22', '2018-02-23 08:48:22'),
(2, 1, 1, 'update', 'Merubah urutan menu', '2018-02-23 08:48:36', '2018-02-23 08:48:36'),
(3, 1, 1, 'insert', 'Menambahkan basic permission Read Home', '2018-02-23 08:49:55', '2018-02-23 08:49:55'),
(4, 1, 1, 'insert', 'Menambahkan role Developer', '2018-02-23 08:50:37', '2018-02-23 08:50:37'),
(5, 1, 1, 'insert', 'Menambahkan role Stockis', '2018-02-23 08:51:10', '2018-02-23 08:51:10'),
(6, 1, 1, 'update', 'Merubah data user.Ach. Vani ardiansyah', '2018-02-23 08:57:17', '2018-02-23 08:57:17'),
(7, 1, 1, 'update', 'Merubah data user.Ach. Vani ardiansyah', '2018-02-23 09:53:44', '2018-02-23 09:53:44'),
(8, 1, 2, 'update', 'Merubah data user Ach. Vani ardiansyah', '2018-02-23 11:02:37', '2018-02-23 11:02:37'),
(9, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:09:07', '2018-02-23 23:09:07'),
(10, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:09:44', '2018-02-23 23:09:44'),
(11, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:10:14', '2018-02-23 23:10:14'),
(12, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:10:56', '2018-02-23 23:10:56'),
(13, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:11:20', '2018-02-23 23:11:20'),
(14, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:11:47', '2018-02-23 23:11:47'),
(15, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:12:13', '2018-02-23 23:12:13'),
(16, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:12:51', '2018-02-23 23:12:51'),
(17, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:13:19', '2018-02-23 23:13:19'),
(18, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:13:48', '2018-02-23 23:13:48'),
(19, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:14:30', '2018-02-23 23:14:30'),
(20, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:14:55', '2018-02-23 23:14:55'),
(21, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:15:21', '2018-02-23 23:15:21'),
(22, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:16:28', '2018-02-23 23:16:28'),
(23, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:16:59', '2018-02-23 23:16:59'),
(24, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:17:20', '2018-02-23 23:17:20'),
(25, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:17:55', '2018-02-23 23:17:55'),
(26, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:18:26', '2018-02-23 23:18:26'),
(27, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:18:54', '2018-02-23 23:18:54'),
(28, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:19:19', '2018-02-23 23:19:19'),
(29, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:20:18', '2018-02-23 23:20:18'),
(30, 1, 2, 'update', 'Mengubah data menu ', '2018-02-23 23:21:06', '2018-02-23 23:21:06'),
(31, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:21:52', '2018-02-23 23:21:52'),
(32, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:22:17', '2018-02-23 23:22:17'),
(33, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:23:01', '2018-02-23 23:23:01'),
(34, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-23 23:23:27', '2018-02-23 23:23:27'),
(35, 1, 2, 'insert', 'Menambahkan resource permission Produk', '2018-02-23 23:25:21', '2018-02-23 23:25:21'),
(36, 1, 2, 'insert', 'Menambahkan resource permission Produk', '2018-02-23 23:25:21', '2018-02-23 23:25:21'),
(37, 1, 2, 'insert', 'Menambahkan resource permission Produk', '2018-02-23 23:25:22', '2018-02-23 23:25:22'),
(38, 1, 2, 'insert', 'Menambahkan resource permission Produk', '2018-02-23 23:25:22', '2018-02-23 23:25:22'),
(39, 1, 2, 'insert', 'Menambahkan resource permission barangdistirbutor', '2018-02-23 23:28:57', '2018-02-23 23:28:57'),
(40, 1, 2, 'insert', 'Menambahkan resource permission barangdistirbutor', '2018-02-23 23:28:58', '2018-02-23 23:28:58'),
(41, 1, 2, 'insert', 'Menambahkan resource permission barangdistirbutor', '2018-02-23 23:28:58', '2018-02-23 23:28:58'),
(42, 1, 2, 'insert', 'Menambahkan resource permission barangdistirbutor', '2018-02-23 23:28:58', '2018-02-23 23:28:58'),
(43, 1, 2, 'insert', 'Menambahkan basic permission Create Penjualan', '2018-02-23 23:30:03', '2018-02-23 23:30:03'),
(44, 1, 2, 'insert', 'Menambahkan basic permission Penjualan Reject', '2018-02-23 23:31:01', '2018-02-23 23:31:01'),
(45, 1, 2, 'insert', 'Menambahkan basic permission Pembelian', '2018-02-23 23:31:46', '2018-02-23 23:31:46'),
(46, 1, 2, 'update', 'Mengubah data permission Penjualan Reject', '2018-02-23 23:32:23', '2018-02-23 23:32:23'),
(47, 1, 2, 'update', 'Mengubah data permission Create Penjualan', '2018-02-23 23:32:49', '2018-02-23 23:32:49'),
(48, 1, 2, 'insert', 'Menambahkan basic permission Penjualan', '2018-02-23 23:33:41', '2018-02-23 23:33:41'),
(49, 1, 2, 'insert', 'Menambahkan basic permission Pmebelina', '2018-02-23 23:34:18', '2018-02-23 23:34:18'),
(50, 1, 2, 'update', 'Mengubah data permission Pembelian', '2018-02-23 23:34:58', '2018-02-23 23:34:58'),
(51, 1, 2, 'insert', 'Menambahkan resource permission distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(52, 1, 2, 'insert', 'Menambahkan resource permission distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(53, 1, 2, 'insert', 'Menambahkan resource permission distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(54, 1, 2, 'insert', 'Menambahkan resource permission distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(55, 1, 2, 'insert', 'Menambahkan resource permission Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(56, 1, 2, 'insert', 'Menambahkan resource permission Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(57, 1, 2, 'insert', 'Menambahkan resource permission Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(58, 1, 2, 'insert', 'Menambahkan resource permission Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(59, 1, 2, 'insert', 'Menambahkan basic permission Laporan Penjualan', '2018-02-23 23:37:54', '2018-02-23 23:37:54'),
(60, 1, 2, 'insert', 'Menambahkan basic permission Laporan Pembelian', '2018-02-23 23:38:48', '2018-02-23 23:38:48'),
(61, 1, 2, 'insert', 'Menambahkan resource permission PenjualanVia', '2018-02-23 23:39:27', '2018-02-23 23:39:27'),
(62, 1, 2, 'insert', 'Menambahkan resource permission PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(63, 1, 2, 'insert', 'Menambahkan resource permission PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(64, 1, 2, 'insert', 'Menambahkan resource permission PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(65, 1, 2, 'insert', 'Menambahkan resource permission wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(66, 1, 2, 'insert', 'Menambahkan resource permission wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(67, 1, 2, 'insert', 'Menambahkan resource permission wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(68, 1, 2, 'insert', 'Menambahkan resource permission wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(69, 1, 2, 'insert', 'Menambahkan resource permission Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(70, 1, 2, 'insert', 'Menambahkan resource permission Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(71, 1, 2, 'insert', 'Menambahkan resource permission Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(72, 1, 2, 'insert', 'Menambahkan resource permission Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(73, 1, 2, 'insert', 'Menambahkan resource permission user', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(74, 1, 2, 'insert', 'Menambahkan resource permission user', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(75, 1, 2, 'insert', 'Menambahkan resource permission user', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(76, 1, 2, 'insert', 'Menambahkan resource permission user', '2018-02-23 23:40:57', '2018-02-23 23:40:57'),
(77, 1, 2, 'insert', 'Menambahkan resource permission Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(78, 1, 2, 'insert', 'Menambahkan resource permission Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(79, 1, 2, 'insert', 'Menambahkan resource permission Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(80, 1, 2, 'insert', 'Menambahkan resource permission Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(81, 1, 2, 'insert', 'Menambahkan basic permission Setting Web', '2018-02-23 23:42:23', '2018-02-23 23:42:23'),
(82, 1, 2, 'insert', 'Menambahkan basic permission Setting Web', '2018-02-23 23:42:24', '2018-02-23 23:42:24'),
(83, 1, 1, 'update', 'Mengupdate role Developer', '2018-02-23 23:44:59', '2018-02-23 23:44:59'),
(84, 1, 1, 'update', 'Mengubah data menu ', '2018-02-24 06:19:12', '2018-02-24 06:19:12'),
(85, 1, 1, 'update', 'Merubah urutan menu', '2018-02-24 06:19:32', '2018-02-24 06:19:32'),
(86, 1, 1, 'update', 'Merubah urutan menu', '2018-02-24 06:19:35', '2018-02-24 06:19:35'),
(87, 1, 1, 'update', 'Merubah urutan menu', '2018-02-24 06:19:39', '2018-02-24 06:19:39'),
(88, 1, 1, 'update', 'Merubah urutan menu', '2018-02-24 06:19:42', '2018-02-24 06:19:42'),
(89, 1, 1, 'update', 'Mengubah data menu ', '2018-02-24 06:20:14', '2018-02-24 06:20:14'),
(90, 1, 1, 'update', 'Mengubah data menu ', '2018-02-24 06:20:45', '2018-02-24 06:20:45'),
(91, 1, 1, 'update', 'Mengubah data menu ', '2018-02-24 06:21:42', '2018-02-24 06:21:42'),
(92, 1, 1, 'update', 'Mengubah data menu ', '2018-02-24 06:21:54', '2018-02-24 06:21:54'),
(93, 1, 1, 'update', 'Mengupdate role Developer', '2018-02-24 06:46:54', '2018-02-24 06:46:54'),
(94, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-24 19:19:53', '2018-02-24 19:19:53'),
(95, 1, 2, 'insert', 'Menambahkan menu ', '2018-02-24 19:20:40', '2018-02-24 19:20:40'),
(96, 1, 2, 'update', 'Mengubah data menu ', '2018-02-24 19:21:17', '2018-02-24 19:21:17'),
(97, 1, 2, 'insert', 'Menambahkan basic permission Read Profile', '2018-02-25 05:29:05', '2018-02-25 05:29:05'),
(98, 1, 2, 'insert', 'Menambahkan basic permission Edit Profile', '2018-02-25 05:29:52', '2018-02-25 05:29:52'),
(99, 1, 2, 'update', 'Mengupdate role Developer', '2018-02-25 05:30:43', '2018-02-25 05:30:43'),
(100, 1, 2, 'delete', 'Menghapus menu ', '2018-02-25 05:34:09', '2018-02-25 05:34:09'),
(101, 1, 2, 'update', 'Mengubah data permission Edit Profile', '2018-02-25 05:35:07', '2018-02-25 05:35:07'),
(102, 1, 2, 'insert', 'Menambahkan basic permission Read Log Profile', '2018-02-25 06:51:20', '2018-02-25 06:51:20'),
(103, 1, 2, 'update', 'Mengupdate role Developer', '2018-02-25 06:52:32', '2018-02-25 06:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `portal_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `menu_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_nomer` int(11) NOT NULL,
  `active_st` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_st` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_st` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_target` enum('self','blank') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `portal_id`, `parent_id`, `menu_title`, `menu_group`, `menu_desc`, `menu_url`, `menu_nomer`, `active_st`, `display_st`, `menu_st`, `menu_icon`, `menu_target`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Home', 'Dashboard', 'Home Developer', 'base/manage/home', 1, 'yes', 'yes', 'internal', 'mdi mdi-view-dashboard', 'self', '2018-02-11 17:00:00', '2018-02-20 09:22:37'),
(2, 1, 0, 'User', 'Manajement Akses', 'Manajemen User', 'base/manage/user', 2, 'yes', 'yes', 'internal', 'mdi mdi-account', 'self', '2018-02-11 17:00:00', '2018-02-20 09:22:37'),
(3, 1, 0, 'Role & Permission', 'Manajement Akses', 'Role & Permission', '#', 3, 'yes', 'yes', 'internal', 'mdi mdi-account-settings-variant', 'self', '2018-02-11 17:00:00', '2018-02-17 03:32:30'),
(4, 1, 3, 'Role', 'Manajement Akses', 'Manajemen Role', 'base/manage/role', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-11 17:00:00', '2018-02-17 06:24:06'),
(5, 1, 3, 'Permission', 'Manajement Akses', 'Manajemen Permission', 'base/manage/permission', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-11 17:00:00', '2018-02-17 06:23:52'),
(6, 1, 0, 'Menu', 'Manajement Aplikasi', 'Manajemen Menu', 'base/manage/menu', 5, 'yes', 'yes', 'internal', 'mdi mdi-menu', 'self', '2018-02-11 17:00:00', '2018-02-19 02:33:36'),
(7, 1, 0, 'Portal', 'Manajement Aplikasi', 'Manajemen Portal', 'base/manage/portal', 4, 'yes', 'yes', 'internal', 'mdi mdi-web', 'self', '2018-02-11 17:00:00', '2018-02-19 02:33:36'),
(8, 2, 0, 'Home', 'General', 'Home Stockis Nasa', 'stockis/home/welcome', 1, 'yes', 'yes', 'internal', 'dashboard', 'self', '2018-02-15 01:32:21', '2018-02-24 06:19:29'),
(9, 1, 0, 'Profile User', 'Profile', 'show profile user', 'base/user/profile', 7, 'yes', 'no', 'internal', NULL, 'self', '2018-02-18 23:42:27', '2018-02-20 21:57:07'),
(10, 1, 0, 'Preference', '', 'Manajemen preferensi', 'base/manage/preference', 6, 'yes', 'yes', 'internal', 'mdi mdi-pencil-lock', 'self', '2018-02-20 21:30:05', '2018-02-20 21:57:07'),
(11, 2, 0, 'Barang', 'Barang', 'Barang stockis', '#', 2, 'yes', 'yes', 'internal', 'inbox', 'self', '2018-02-23 23:09:06', '2018-02-24 06:19:40'),
(12, 2, 11, 'Produk', 'Barang', 'Produk stockis', 'stockis/barang/produk', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:09:44', '2018-02-24 06:20:14'),
(13, 2, 11, 'Barang Distributor', 'Barang', 'Barang distributor', 'stockis/barang/barangdistributor', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:10:14', '2018-02-28 07:32:55'),
(14, 2, 0, 'Transaksi', 'Transaksi', 'Transaksi stockis', '#', 3, 'yes', 'yes', 'internal', 'repeat', 'self', '2018-02-23 23:10:56', '2018-02-24 06:19:40'),
(15, 2, 14, 'Penjualan', 'Transaksi', 'Penjualan', 'stockis/transaksi/penjualan', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:11:20', '2018-02-23 23:11:20'),
(16, 2, 14, 'Penjualan Reject', 'Transaksi', 'Penjualan Reject', 'stockis/transaksi/penjualanreject', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:11:47', '2018-02-23 23:11:47'),
(17, 2, 14, 'Pembelian', 'Transaksi', 'Pembelian', 'stockis/transaksi/pembelian', 3, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:12:13', '2018-02-23 23:12:13'),
(18, 2, 0, 'Monitoring', 'Monitoring', 'Monitoring pernjualan', '#', 4, 'yes', 'yes', 'internal', 'airplay', 'self', '2018-02-23 23:12:51', '2018-02-24 06:19:40'),
(19, 2, 18, 'Penjualan', 'Monitoring', 'Monitoring penjualan', 'stockis/monitoring/penjualan', 1, 'yes', 'yes', 'internal', 'Simpan     Reset', 'self', '2018-02-23 23:13:19', '2018-02-23 23:13:19'),
(20, 2, 18, 'Pembelian', 'Monitoring', 'Monitoring Pembelian', 'stockis/monitoring/pembelian', 3, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:13:48', '2018-02-27 20:42:25'),
(21, 2, 0, 'Distributor', 'Distributor', 'Distributor', '#', 5, 'yes', 'yes', 'internal', 'local_shipping', 'self', '2018-02-23 23:14:30', '2018-02-24 06:19:41'),
(22, 2, 21, 'List Distributor', 'Distributor', 'List Distributor', 'stockis/distributor/distributor', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:14:55', '2018-02-23 23:14:55'),
(23, 2, 21, 'Kelengkapan Distributor', 'Distributor', 'Kelengkapan Distributor', 'stockis/distributor/kelengkapan', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:15:21', '2018-02-23 23:15:21'),
(24, 2, 0, 'Laporan', 'Laporan', 'Laporan Stockis', '#', 6, 'yes', 'yes', 'internal', 'desktop_windows', 'self', '2018-02-23 23:16:28', '2018-02-24 06:19:41'),
(25, 2, 24, 'Laporan Penjualan', 'Laporan', 'Laporan Penjualan', 'stockis/laporan/penjualan', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:16:58', '2018-02-23 23:16:58'),
(26, 2, 24, 'Laporan Pembelian', 'Laporan', 'Laporan Pembelian', 'stockis/laporan/pembelian', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:17:20', '2018-02-23 23:17:20'),
(27, 2, 0, 'Master', 'Master', 'Master Data', '#', 7, 'yes', 'yes', 'internal', 'data_usage', 'self', '2018-02-23 23:17:54', '2018-02-24 06:19:41'),
(28, 2, 27, 'Penjualan Via', 'Master', 'Penjualan Via', 'stockis/master/penjualanvia', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:18:26', '2018-02-23 23:18:26'),
(29, 2, 27, 'Wilayah', 'Master', 'Master Wilayah', 'stockis/master/wilayah', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:18:53', '2018-02-23 23:18:53'),
(30, 2, 27, 'Peringkat Distributor', 'Master', 'Peringkat Distributor', 'stockis/master/peringkat', 3, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:19:19', '2018-02-23 23:19:19'),
(31, 2, 0, 'Manajemen Akses', 'Manajemen Akses', 'Manajemen Akses Website', '#', 8, 'yes', 'yes', 'internal', 'supervisor_account', 'self', '2018-02-23 23:20:18', '2018-02-24 06:19:41'),
(32, 2, 31, 'User', 'Manajemen Akses', 'Manajemen User', 'stockis/manage/user', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:21:52', '2018-02-23 23:21:52'),
(33, 2, 31, 'Role', 'Manajemen Akses', 'Manajemen Role', 'stockis/manage/role', 2, 'yes', 'yes', 'internal', 'Simpan     Reset', 'self', '2018-02-23 23:22:16', '2018-02-26 02:15:45'),
(34, 2, 0, 'Pengaturan', 'Setting', 'Pengaturan website', '#', 9, 'yes', 'yes', 'internal', 'settings', 'self', '2018-02-23 23:23:01', '2018-02-24 06:19:42'),
(35, 2, 34, 'Web', 'Setting', 'Pengaturan website', 'stockis/setting/web', 1, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-23 23:23:27', '2018-02-23 23:23:27'),
(46, 2, 0, 'Profile User', 'Profile', 'Profile User', 'stockis/user/profile', 10, 'yes', 'no', 'internal', NULL, 'self', '2018-02-24 19:19:52', '2018-02-24 19:21:17'),
(47, 2, 18, 'Penjualan Reject', 'Monitoring', 'Monitoring Penjualan Reject', 'stockis/monitoring/penjualanreject', 2, 'yes', 'yes', 'internal', NULL, 'self', '2018-02-27 20:23:35', '2018-02-27 20:24:05'),
(48, 3, 0, 'Home', '', 'Home Distributor', 'distributor/home/welcome', 1, 'yes', 'yes', 'internal', 'dashboard', 'self', '2018-03-07 07:58:39', '2018-03-07 20:44:33'),
(49, 3, 0, 'Profile Distributor', 'Menu', 'Profile Distributor', 'distributor/user/profile', 2, 'yes', 'no', 'internal', NULL, 'self', '2018-03-07 20:44:13', '2018-03-07 20:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `menu_permission`
--

CREATE TABLE `menu_permission` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_permission`
--

INSERT INTO `menu_permission` (`menu_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(5, 11, NULL, NULL),
(5, 12, NULL, NULL),
(5, 13, NULL, NULL),
(5, 14, NULL, NULL),
(6, 15, NULL, NULL),
(6, 16, NULL, NULL),
(6, 17, NULL, NULL),
(6, 18, NULL, NULL),
(7, 19, NULL, NULL),
(7, 20, NULL, NULL),
(7, 21, NULL, NULL),
(7, 22, NULL, NULL),
(9, 23, NULL, NULL),
(9, 24, NULL, NULL),
(9, 25, NULL, NULL),
(1, 25, NULL, NULL),
(10, 26, NULL, NULL),
(10, 28, NULL, NULL),
(10, 29, NULL, NULL),
(10, 30, NULL, NULL),
(8, 31, NULL, NULL),
(12, 32, NULL, NULL),
(12, 33, NULL, NULL),
(12, 34, NULL, NULL),
(12, 35, NULL, NULL),
(13, 36, NULL, NULL),
(13, 37, NULL, NULL),
(13, 38, NULL, NULL),
(13, 39, NULL, NULL),
(16, 41, NULL, NULL),
(17, 42, NULL, NULL),
(19, 43, NULL, NULL),
(20, 44, NULL, NULL),
(22, 45, NULL, NULL),
(22, 46, NULL, NULL),
(22, 47, NULL, NULL),
(22, 48, NULL, NULL),
(23, 49, NULL, NULL),
(23, 50, NULL, NULL),
(23, 51, NULL, NULL),
(23, 52, NULL, NULL),
(25, 53, NULL, NULL),
(26, 54, NULL, NULL),
(28, 55, NULL, NULL),
(28, 56, NULL, NULL),
(28, 57, NULL, NULL),
(28, 58, NULL, NULL),
(29, 59, NULL, NULL),
(29, 60, NULL, NULL),
(29, 61, NULL, NULL),
(29, 62, NULL, NULL),
(30, 63, NULL, NULL),
(30, 64, NULL, NULL),
(30, 65, NULL, NULL),
(30, 66, NULL, NULL),
(32, 67, NULL, NULL),
(32, 68, NULL, NULL),
(32, 69, NULL, NULL),
(32, 70, NULL, NULL),
(33, 71, NULL, NULL),
(33, 72, NULL, NULL),
(33, 73, NULL, NULL),
(33, 74, NULL, NULL),
(35, 75, NULL, NULL),
(46, 78, NULL, NULL),
(46, 79, NULL, NULL),
(46, 80, NULL, NULL),
(15, 40, NULL, NULL),
(20, 81, NULL, NULL),
(19, 82, NULL, NULL),
(47, 83, NULL, NULL),
(47, 84, NULL, NULL),
(48, 85, NULL, NULL),
(49, 86, NULL, NULL),
(49, 87, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_06_031328_create_user_data_table', 1),
(4, '2018_02_08_142320_create_portal_table', 1),
(5, '2018_02_08_142749_create_role_table', 1),
(6, '2018_02_08_160900_create_menu_table', 1),
(7, '2018_02_08_161723_create_permission_table', 1),
(8, '2018_02_19_041210_create_logs_table', 1),
(9, '2018_02_21_041835_create_preference_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_barang` decimal(16,2) DEFAULT NULL,
  `total_harga` decimal(16,2) DEFAULT NULL,
  `status` enum('done','waiting') DEFAULT NULL,
  `user_login_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk_detail`
--

CREATE TABLE `pembelian_produk_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `pembelian_produk_id` int(10) UNSIGNED DEFAULT NULL,
  `barang_id` int(10) UNSIGNED DEFAULT NULL,
  `harga` decimal(16,2) DEFAULT NULL,
  `jml` int(10) DEFAULT NULL,
  `total` decimal(16,2) DEFAULT NULL,
  `status` enum('done','waiting') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_produk`
--

CREATE TABLE `penjualan_produk` (
  `id` int(10) UNSIGNED NOT NULL,
  `distributor_id` int(10) UNSIGNED NOT NULL,
  `nama_pembeli` varchar(191) NOT NULL,
  `nohp_pembeli` varchar(15) NOT NULL,
  `alamat_pembeli` text NOT NULL,
  `penjualan_via_id` int(10) UNSIGNED NOT NULL,
  `nama_ekspedisi` varchar(191) DEFAULT NULL,
  `ongkos_kirim` decimal(16,2) DEFAULT NULL,
  `wilayah_id` int(10) UNSIGNED NOT NULL,
  `nama_pengirim` varchar(191) DEFAULT NULL,
  `nohp_pengirim` varchar(15) DEFAULT NULL,
  `alamat_pengirim` text,
  `status_pembayaran` enum('belum_bayar','sudah_bayar') NOT NULL DEFAULT 'belum_bayar',
  `metode_bayar` enum('ditempat','transfer') NOT NULL,
  `total_transfer` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_produk_detail`
--

CREATE TABLE `penjualan_produk_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `penjualan_produk_id` int(10) UNSIGNED DEFAULT NULL,
  `barang_id` int(10) UNSIGNED DEFAULT NULL,
  `jml` int(4) DEFAULT NULL,
  `harga` decimal(16,2) DEFAULT NULL,
  `total_harga` decimal(16,2) DEFAULT NULL,
  `status` enum('done','waiting','','') NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_via`
--

CREATE TABLE `penjualan_via` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_via` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_via`
--

INSERT INTO `penjualan_via` (`id`, `nama_via`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '2018-02-10 07:03:30', '2018-02-10 07:35:42'),
(2, 'Whatsapp', '2018-02-10 07:17:07', '2018-02-10 07:17:07'),
(3, 'Line', '2018-02-10 07:19:08', '2018-02-10 07:19:08'),
(4, 'BBM', '2018-02-10 07:19:14', '2018-02-10 07:19:14'),
(5, 'Twitter', '2018-02-10 07:19:32', '2018-02-10 07:19:32'),
(7, 'Website', '2018-02-10 08:10:23', '2018-02-10 08:10:23'),
(8, 'Bukalapak', '2018-02-10 08:12:26', '2018-02-10 08:12:26'),
(9, 'COD (Cash on Delivery)', '2018-02-11 02:58:28', '2018-02-23 11:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `peringkat_distributor`
--

CREATE TABLE `peringkat_distributor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_peringkat` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peringkat_distributor`
--

INSERT INTO `peringkat_distributor` (`id`, `nama_peringkat`, `created_at`, `updated_at`) VALUES
(1, 'Warior', '2018-01-20 21:37:28', '2018-01-20 21:37:28'),
(2, 'Elite', '2018-01-20 21:39:41', '2018-01-20 21:39:41'),
(3, 'Master', '2018-01-20 21:40:09', '2018-01-20 21:40:09'),
(4, 'Grand Master', '2018-01-20 21:49:16', '2018-01-20 21:49:16'),
(5, 'Epick', '2018-01-20 21:49:54', '2018-01-20 21:49:54'),
(6, 'Legend', '2018-01-21 11:08:28', '2018-01-21 04:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `portal_id` int(10) UNSIGNED NOT NULL,
  `permission_nm` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `portal_id`, `permission_nm`, `permission_group`, `permission_slug`, `permission_desc`, `created_at`, `updated_at`) VALUES
(1, 1, 'Read Home', 'general', 'read-home', 'Memperbolehkan user akses home', '2018-02-12 02:20:45', '2018-02-12 02:20:45'),
(2, 1, 'Create Role', 'Role', 'create-role', 'Memperbolkehkan usern untuk CREATE a Role', '2018-02-12 02:21:29', '2018-02-12 02:21:29'),
(3, 1, 'Read Role', 'Role', 'read-role', 'Memperbolkehkan usern untuk READ a Role', '2018-02-12 02:21:29', '2018-02-12 02:21:29'),
(4, 1, 'Update Role', 'Role', 'update-role', 'Memperbolkehkan usern untuk UPDATE a Role', '2018-02-12 02:21:29', '2018-02-12 02:21:29'),
(5, 1, 'Delete Role', 'Role', 'delete-role', 'Memperbolkehkan usern untuk DELETE a Role', '2018-02-12 02:21:30', '2018-02-12 02:21:30'),
(6, 1, 'Create User', 'User', 'create-user', 'Memperbolkehkan usern untuk CREATE a User', '2018-02-12 02:46:16', '2018-02-12 02:46:16'),
(7, 1, 'Read User', 'User', 'read-user', 'Memperbolkehkan usern untuk READ a User', '2018-02-12 02:46:16', '2018-02-12 02:46:16'),
(8, 1, 'Update User', 'User', 'update-user', 'Memperbolkehkan usern untuk UPDATE a User', '2018-02-12 02:46:16', '2018-02-12 02:46:16'),
(9, 1, 'Delete User', 'User', 'delete-user', 'Memperbolkehkan usern untuk DELETE a User', '2018-02-12 02:46:16', '2018-02-12 02:46:16'),
(11, 1, 'Create Permission', 'Permission', 'create-permission', 'Memperbolkehkan usern untuk CREATE a Permission', '2018-02-12 20:36:52', '2018-02-12 20:36:52'),
(12, 1, 'Read Permission', 'Permission', 'read-permission', 'Memperbolkehkan usern untuk READ a Permission', '2018-02-12 20:36:52', '2018-02-12 20:36:52'),
(13, 1, 'Update Permission', 'Permission', 'update-permission', 'Memperbolkehkan usern untuk UPDATE a Permission', '2018-02-12 20:36:53', '2018-02-12 20:36:53'),
(14, 1, 'Delete Permission', 'Permission', 'delete-permission', 'Memperbolkehkan usern untuk DELETE a Permission', '2018-02-12 20:36:53', '2018-02-12 20:36:53'),
(15, 1, 'Create Menu', 'Menu', 'create-menu', 'Memperbolkehkan usern untuk CREATE a Menu', '2018-02-12 20:37:36', '2018-02-12 20:37:36'),
(16, 1, 'Read Menu', 'Menu', 'read-menu', 'Memperbolkehkan usern untuk READ a Menu', '2018-02-12 20:37:36', '2018-02-12 20:37:36'),
(17, 1, 'Update Menu', 'Menu', 'update-menu', 'Memperbolkehkan usern untuk UPDATE a Menu', '2018-02-12 20:37:36', '2018-02-12 20:37:36'),
(18, 1, 'Delete Menu', 'Menu', 'delete-menu', 'Memperbolkehkan usern untuk DELETE a Menu', '2018-02-12 20:37:36', '2018-02-12 20:37:36'),
(19, 1, 'Create Portal', 'Portal', 'create-portal', 'Memperbolkehkan usern untuk CREATE a Portal', '2018-02-12 20:38:04', '2018-02-12 20:38:04'),
(20, 1, 'Read Portal', 'Portal', 'read-portal', 'Memperbolkehkan usern untuk READ a Portal', '2018-02-12 20:38:04', '2018-02-12 20:38:04'),
(21, 1, 'Update Portal', 'Portal', 'update-portal', 'Memperbolkehkan usern untuk UPDATE a Portal', '2018-02-12 20:38:05', '2018-02-12 20:38:05'),
(22, 1, 'Delete Portal', 'Portal', 'delete-portal', 'Memperbolkehkan usern untuk DELETE a Portal', '2018-02-12 20:38:05', '2018-02-12 20:38:05'),
(23, 1, 'Read Profile', 'Profile', 'read-profile', 'Memperbolkehkan usern untuk READ Profile', '2018-02-18 23:44:44', '2018-02-18 23:44:44'),
(24, 1, 'Update Profile', 'Profile', 'update-profile', 'Memperbolkehkan usern untuk UPDATE Profile', '2018-02-18 23:44:44', '2018-02-18 23:44:44'),
(25, 1, 'Read Log', 'Log', 'read-log', 'Memperbolehkan user read log', '2018-02-19 21:35:21', '2018-02-19 21:35:21'),
(26, 1, 'Create Preference', 'preference', 'create-preference', 'Memperbolkehkan usern untuk CREATE Preference', '2018-02-20 21:31:06', '2018-02-20 21:31:06'),
(28, 1, 'Read Preference', 'preference', 'read-preference', 'Memperbolkehkan usern untuk READ Preference', '2018-02-20 21:31:06', '2018-02-20 21:31:06'),
(29, 1, 'Update Preference', 'preference', 'update-preference', 'Memperbolkehkan usern untuk UPDATE Preference', '2018-02-20 21:31:06', '2018-02-20 21:31:06'),
(30, 1, 'Delete Preference', 'preference', 'delete-preference', 'Memperbolkehkan usern untuk DELETE Preference', '2018-02-20 21:31:06', '2018-02-20 21:31:06'),
(31, 2, 'Read Home', 'general', 'read-home', 'Read home page stockis', '2018-02-23 08:49:55', '2018-02-23 08:49:55'),
(32, 2, 'Create Produk', 'Barang', 'create-produk', 'Memperbolehkan user untuk CREATE Produk', '2018-02-23 23:25:21', '2018-02-23 23:25:21'),
(33, 2, 'Read Produk', 'Barang', 'read-produk', 'Memperbolehkan user untuk READ Produk', '2018-02-23 23:25:21', '2018-02-23 23:25:21'),
(34, 2, 'Update Produk', 'Barang', 'update-produk', 'Memperbolehkan user untuk UPDATE Produk', '2018-02-23 23:25:21', '2018-02-23 23:25:21'),
(35, 2, 'Delete Produk', 'Barang', 'delete-produk', 'Memperbolehkan user untuk DELETE Produk', '2018-02-23 23:25:22', '2018-02-23 23:25:22'),
(36, 2, 'Create Barangdistirbutor', 'Barang', 'create-barangdistirbutor', 'Memperbolehkan user untuk CREATE Barangdistirbutor', '2018-02-23 23:28:57', '2018-02-23 23:28:57'),
(37, 2, 'Read Barangdistirbutor', 'Barang', 'read-barangdistirbutor', 'Memperbolehkan user untuk READ Barangdistirbutor', '2018-02-23 23:28:57', '2018-02-23 23:28:57'),
(38, 2, 'Update Barangdistirbutor', 'Barang', 'update-barangdistirbutor', 'Memperbolehkan user untuk UPDATE Barangdistirbutor', '2018-02-23 23:28:58', '2018-02-23 23:28:58'),
(39, 2, 'Delete Barangdistirbutor', 'Barang', 'delete-barangdistirbutor', 'Memperbolehkan user untuk DELETE Barangdistirbutor', '2018-02-23 23:28:58', '2018-02-23 23:28:58'),
(40, 2, 'Create Penjualan', 'Transaksi', 'create-penjualan', 'Memebolehkan user create penjualan', '2018-02-23 23:30:03', '2018-02-23 23:32:49'),
(41, 2, 'Creata Penjualan Reject', 'Transaksi', 'create-penjualan-reject', 'Penjualan Reject', '2018-02-23 23:31:01', '2018-02-27 20:20:56'),
(42, 2, 'Create Pembelian', 'Transaksi', 'create-pembelian', 'Create Pembelian', '2018-02-23 23:31:46', '2018-02-27 19:52:00'),
(43, 2, 'Read Penjualan', 'Monitoring', 'read-penjualan', 'Monitoring penjualan user', '2018-02-23 23:33:41', '2018-02-27 20:20:06'),
(44, 2, 'Read Pembelian', 'Monitoring', 'read-pembelian', 'Monitoring pembelian user', '2018-02-23 23:34:17', '2018-02-27 19:53:08'),
(45, 2, 'Create Distibutor', 'Distributor', 'create-distributor', 'Memperbolehkan user untuk CREATE Distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(46, 2, 'Read Distibutor', 'Distributor', 'read-distributor', 'Memperbolehkan user untuk READ Distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(47, 2, 'Update Distibutor', 'Distributor', 'update-distributor', 'Memperbolehkan user untuk UPDATE Distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(48, 2, 'Delete Distibutor', 'Distributor', 'delete-distributor', 'Memperbolehkan user untuk DELETE Distibutor', '2018-02-23 23:35:54', '2018-02-23 23:35:54'),
(49, 2, 'Create Kelengkapan', 'Distributor', 'create-kelengkapan', 'Memperbolehkan user untuk CREATE Kelengkapan', '2018-02-23 23:36:39', '2018-02-23 23:36:39'),
(50, 2, 'Read Kelengkapan', 'Distributor', 'read-kelengkapan', 'Memperbolehkan user untuk READ Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(51, 2, 'Update Kelengkapan', 'Distributor', 'update-kelengkapan', 'Memperbolehkan user untuk UPDATE Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(52, 2, 'Delete Kelengkapan', 'Distributor', 'delete-kelengkapan', 'Memperbolehkan user untuk DELETE Kelengkapan', '2018-02-23 23:36:40', '2018-02-23 23:36:40'),
(53, 2, 'Laporan Penjualan', 'Laporan', 'read-laporan-penjualan', 'Memperbolehkan user melihat laporan penjualan', '2018-02-23 23:37:54', '2018-02-23 23:37:54'),
(54, 2, 'Laporan Pembelian', 'Laporan', 'read-laporan-pembelian', 'Memperbolehkan user melihat laporan pembelian', '2018-02-23 23:38:48', '2018-02-23 23:38:48'),
(55, 2, 'Create PenjualanVia', 'Master', 'create-penjualanvia', 'Memperbolehkan user untuk CREATE PenjualanVia', '2018-02-23 23:39:27', '2018-02-23 23:39:27'),
(56, 2, 'Read PenjualanVia', 'Master', 'read-penjualanvia', 'Memperbolehkan user untuk READ PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(57, 2, 'Update PenjualanVia', 'Master', 'update-penjualanvia', 'Memperbolehkan user untuk UPDATE PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(58, 2, 'Delete PenjualanVia', 'Master', 'delete-penjualanvia', 'Memperbolehkan user untuk DELETE PenjualanVia', '2018-02-23 23:39:28', '2018-02-23 23:39:28'),
(59, 2, 'Create Wilayah', 'Master', 'create-wilayah', 'Memperbolehkan user untuk CREATE Wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(60, 2, 'Read Wilayah', 'Master', 'read-wilayah', 'Memperbolehkan user untuk READ Wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(61, 2, 'Update Wilayah', 'Master', 'update-wilayah', 'Memperbolehkan user untuk UPDATE Wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(62, 2, 'Delete Wilayah', 'Master', 'delete-wilayah', 'Memperbolehkan user untuk DELETE Wilayah', '2018-02-23 23:39:57', '2018-02-23 23:39:57'),
(63, 2, 'Create Peringkat', 'Master', 'create-peringkat', 'Memperbolehkan user untuk CREATE Peringkat', '2018-02-23 23:40:26', '2018-02-23 23:40:26'),
(64, 2, 'Read Peringkat', 'Master', 'read-peringkat', 'Memperbolehkan user untuk READ Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(65, 2, 'Update Peringkat', 'Master', 'update-peringkat', 'Memperbolehkan user untuk UPDATE Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(66, 2, 'Delete Peringkat', 'Master', 'delete-peringkat', 'Memperbolehkan user untuk DELETE Peringkat', '2018-02-23 23:40:27', '2018-02-23 23:40:27'),
(67, 2, 'Create User', 'Manajement Akses', 'create-user', 'Memperbolehkan user untuk CREATE User', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(68, 2, 'Read User', 'Manajement Akses', 'read-user', 'Memperbolehkan user untuk READ User', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(69, 2, 'Update User', 'Manajement Akses', 'update-user', 'Memperbolehkan user untuk UPDATE User', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(70, 2, 'Delete User', 'Manajement Akses', 'delete-user', 'Memperbolehkan user untuk DELETE User', '2018-02-23 23:40:56', '2018-02-23 23:40:56'),
(71, 2, 'Create Role', 'Manajemen Akses', 'create-role', 'Memperbolehkan user untuk CREATE Role', '2018-02-23 23:41:24', '2018-02-23 23:41:24'),
(72, 2, 'Read Role', 'Manajemen Akses', 'read-role', 'Memperbolehkan user untuk READ Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(73, 2, 'Update Role', 'Manajemen Akses', 'update-role', 'Memperbolehkan user untuk UPDATE Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(74, 2, 'Delete Role', 'Manajemen Akses', 'delete-role', 'Memperbolehkan user untuk DELETE Role', '2018-02-23 23:41:25', '2018-02-23 23:41:25'),
(75, 2, 'Setting Web', 'Setting', 'setting-web', 'Memperbolehkan user update data detail web', '2018-02-23 23:42:23', '2018-02-23 23:42:23'),
(78, 2, 'Edit Profile', 'Profile', 'edit-profile', 'Edit Profile User', '2018-02-25 05:29:52', '2018-02-25 05:29:52'),
(79, 2, 'Read Log Profile', 'Profile', 'read-log-profile', 'Memperbolehkan user read log user login', '2018-02-25 06:51:19', '2018-02-25 06:51:19'),
(80, 2, 'Read Profile', 'Profile', 'read-profile', 'Memperbolehkan user melihat profile', '2018-02-25 08:04:23', '2018-02-25 08:04:23'),
(81, 2, 'Update Pembelian', 'Monitoring', 'update-pembelian', 'Memeperbolehkan user mengupdate pembelian', '2018-02-27 19:54:34', '2018-02-27 19:54:34'),
(82, 2, 'Update Penjualan', 'Monitoring', 'update-penjualan', 'Memperbolehkan user mengupdate penjualan', '2018-02-27 19:55:29', '2018-02-27 19:55:29'),
(83, 2, 'Read Penjualan Reject', 'Monitoring', 'read-penjulan-reject', 'Memperbolehkan user read penjulan reject', '2018-02-27 21:22:37', '2018-02-27 21:22:37'),
(84, 2, 'Update penjualan reject', 'Mointoring', 'update-penjualan-reject', 'Memperbolehkan user update penjualan reject', '2018-02-27 21:23:37', '2018-02-27 21:23:37'),
(85, 3, 'Read Home', 'general', 'read-home', 'Read Home Distributor', '2018-03-07 07:59:57', '2018-03-07 07:59:57'),
(86, 3, 'Read Profile DIstributor', 'Profile', 'read-profile', 'Memperbolahkan distributor melihat profile', '2018-03-07 20:46:07', '2018-03-07 20:46:07'),
(87, 3, 'Edit Profile Distributor', 'Profile', 'edit-profile', 'Memperbolahkan user mengupdate profile', '2018-03-07 20:47:09', '2018-03-07 20:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `portal`
--

CREATE TABLE `portal` (
  `id` int(10) UNSIGNED NOT NULL,
  `portal_nm` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portal`
--

INSERT INTO `portal` (`id`, `portal_nm`, `site_title`, `site_name`, `site_desc`, `site_favicon`, `site_logo`, `meta_keyword`, `meta_desc`, `created_at`, `updated_at`) VALUES
(1, 'base', 'Base Manajemen', 'base-manajemen', 'Portal khusus untup developer mengelola aplikasi', '-', '-', '-', '-', '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 'stockis', 'Stockis Manajemen', 'stocis-manajemen', 'Portal khusus untup stockis nasa.', '-', '-', '-', '-', '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(3, 'distributor', 'Distributor', 'distributor-manajemen', 'Portal khusus untup distributor stockis.', '-', '-', '-', '-', '2018-02-22 17:00:00', '2018-02-22 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `id` int(10) UNSIGNED NOT NULL,
  `pref_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pref_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pref_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `portal_id` int(10) UNSIGNED NOT NULL,
  `role_nm` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_prioritas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_page` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `portal_id`, `role_nm`, `role_prioritas`, `role_desc`, `default_page`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', '1', 'Role Untuk super admin', 'base/manage/home', '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 1, 'Developer', '2', 'Role Untuk developer', 'base/manage/home', '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(3, 2, 'Developer', '1', 'Developer stockis', 'stockis/home/welcome', '2018-02-23 08:50:37', '2018-02-24 06:46:52'),
(4, 2, 'Stockis', '2', 'Stockis Nasa', 'stockis/home/welcome', '2018-02-23 08:51:10', '2018-02-23 08:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 6, NULL, NULL),
(1, 7, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 2, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 19, NULL, NULL),
(1, 20, NULL, NULL),
(1, 21, NULL, NULL),
(1, 22, NULL, NULL),
(1, 1, NULL, NULL),
(1, 23, NULL, NULL),
(1, 24, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL),
(1, 17, NULL, NULL),
(1, 18, NULL, NULL),
(1, 14, NULL, NULL),
(1, 25, NULL, NULL),
(2, 1, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 11, NULL, NULL),
(2, 12, NULL, NULL),
(2, 13, NULL, NULL),
(2, 14, NULL, NULL),
(2, 15, NULL, NULL),
(2, 16, NULL, NULL),
(2, 17, NULL, NULL),
(2, 18, NULL, NULL),
(2, 23, NULL, NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(2, 28, NULL, NULL),
(2, 29, NULL, NULL),
(2, 30, NULL, NULL),
(1, 26, NULL, NULL),
(1, 28, NULL, NULL),
(1, 29, NULL, NULL),
(1, 30, NULL, NULL),
(4, 31, NULL, NULL),
(3, 31, NULL, NULL),
(3, 32, NULL, NULL),
(3, 33, NULL, NULL),
(3, 34, NULL, NULL),
(3, 35, NULL, NULL),
(3, 36, NULL, NULL),
(3, 37, NULL, NULL),
(3, 38, NULL, NULL),
(3, 39, NULL, NULL),
(3, 41, NULL, NULL),
(3, 42, NULL, NULL),
(3, 40, NULL, NULL),
(3, 43, NULL, NULL),
(3, 44, NULL, NULL),
(3, 45, NULL, NULL),
(3, 46, NULL, NULL),
(3, 47, NULL, NULL),
(3, 48, NULL, NULL),
(3, 49, NULL, NULL),
(3, 50, NULL, NULL),
(3, 51, NULL, NULL),
(3, 52, NULL, NULL),
(3, 53, NULL, NULL),
(3, 54, NULL, NULL),
(3, 55, NULL, NULL),
(3, 56, NULL, NULL),
(3, 57, NULL, NULL),
(3, 58, NULL, NULL),
(3, 59, NULL, NULL),
(3, 60, NULL, NULL),
(3, 61, NULL, NULL),
(3, 62, NULL, NULL),
(3, 63, NULL, NULL),
(3, 64, NULL, NULL),
(3, 65, NULL, NULL),
(3, 66, NULL, NULL),
(3, 67, NULL, NULL),
(3, 68, NULL, NULL),
(3, 69, NULL, NULL),
(3, 70, NULL, NULL),
(3, 71, NULL, NULL),
(3, 72, NULL, NULL),
(3, 73, NULL, NULL),
(3, 74, NULL, NULL),
(3, 75, NULL, NULL),
(3, 78, NULL, NULL),
(3, 79, NULL, NULL),
(3, 80, NULL, NULL),
(3, 82, NULL, NULL),
(3, 81, NULL, NULL),
(4, 32, NULL, NULL),
(4, 33, NULL, NULL),
(4, 34, NULL, NULL),
(4, 35, NULL, NULL),
(4, 36, NULL, NULL),
(4, 37, NULL, NULL),
(4, 38, NULL, NULL),
(4, 39, NULL, NULL),
(4, 40, NULL, NULL),
(4, 41, NULL, NULL),
(4, 42, NULL, NULL),
(4, 43, NULL, NULL),
(4, 82, NULL, NULL),
(4, 44, NULL, NULL),
(4, 81, NULL, NULL),
(4, 83, NULL, NULL),
(4, 84, NULL, NULL),
(4, 45, NULL, NULL),
(4, 46, NULL, NULL),
(4, 47, NULL, NULL),
(4, 48, NULL, NULL),
(4, 49, NULL, NULL),
(4, 50, NULL, NULL),
(4, 51, NULL, NULL),
(4, 52, NULL, NULL),
(4, 53, NULL, NULL),
(4, 54, NULL, NULL),
(4, 55, NULL, NULL),
(4, 56, NULL, NULL),
(4, 57, NULL, NULL),
(4, 58, NULL, NULL),
(4, 59, NULL, NULL),
(4, 60, NULL, NULL),
(4, 61, NULL, NULL),
(4, 62, NULL, NULL),
(4, 63, NULL, NULL),
(4, 64, NULL, NULL),
(4, 65, NULL, NULL),
(4, 66, NULL, NULL),
(4, 67, NULL, NULL),
(4, 68, NULL, NULL),
(4, 69, NULL, NULL),
(4, 70, NULL, NULL),
(4, 71, NULL, NULL),
(4, 72, NULL, NULL),
(4, 73, NULL, NULL),
(4, 74, NULL, NULL),
(4, 75, NULL, NULL),
(4, 78, NULL, NULL),
(4, 79, NULL, NULL),
(4, 80, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksivia`
--

CREATE TABLE `transaksivia` (
  `id` int(11) NOT NULL,
  `nama_via` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksivia`
--

INSERT INTO `transaksivia` (`id`, `nama_via`, `created_at`, `updated_at`) VALUES
(1, 'BRI', '2018-03-27 08:39:34', '2018-03-27 08:39:34'),
(2, 'Mandiri', '2018-03-27 08:39:44', '2018-03-27 08:39:44'),
(3, 'BCA', '2018-03-27 08:39:50', '2018-03-27 08:39:50'),
(4, 'BNI', '2018-03-27 08:39:55', '2018-03-27 08:39:55'),
(5, 'CIMB', '2018-03-27 08:40:00', '2018-03-27 08:40:00'),
(6, 'BTN', '2018-03-27 08:40:06', '2018-03-27 08:40:06'),
(7, 'Panin', '2018-03-27 08:40:16', '2018-03-27 08:40:16'),
(8, 'Permata', '2018-03-27 08:40:23', '2018-03-27 08:40:23'),
(9, 'BII', '2018-03-27 08:40:29', '2018-03-27 08:40:29'),
(10, 'Danamon', '2018-03-27 08:40:37', '2018-03-27 08:40:37'),
(11, 'COD', '2018-03-27 08:40:42', '2018-03-27 08:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_login_id` int(10) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_telp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id`, `user_login_id`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `no_telp`, `jabatan`, `alamat`, `foto`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ach. Vani ardiansyah', 'Banyuwangi', '1996-05-10', '082233637307', 'developer', 'Dusun Jalen RT 03 RW 02 Desa Setail, Kecamatan Genteng, Kabupaten Banyuwangi', NULL, '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 2, 'Ach. Vani ardiansyah', 'Banyuwangi', '1996-05-10', '0822-3363-7307', 'developer', 'Dusun Jalen RT 03 RW 02 Desa Setail, Kecamatan Genteng, Kabupaten Banyuwangi', '1519408956-profile-nasa.jpg', '2018-02-22 17:00:00', '2018-02-23 11:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unaktif',
  `experied` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `username`, `email`, `password`, `status`, `experied`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'sankesterfire@gmail.com', '$2y$10$62zFmtvLlUW/ivnYD3uC1OF33HGQWxmDr32btYyPP76MS4nunhkT2', 'aktif', '2018-02-24', '8B0NILv3VrS7IjrRK6RFAzC8qPlADWt4SoimBo7e2Nhh8gdMd7X9f2vCu012', '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 'developer', 'developer@stockis.com', '$2y$10$8lw93QGtnvB/FeOfRQkGleyu8Y7mof2ylH3m22QIf8YhYPlVnx8G6', 'aktif', '2018-02-24', 'Dg0hB3xzEEXdgvNoEntkAMecwlBfC36zKkHcVq4DP8PDzCDDALzAfNJ0Kfw4', '2018-02-22 17:00:00', '2018-02-23 09:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_login_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_login_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(1, 2, '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 2, '2018-02-22 17:00:00', '2018-02-22 17:00:00'),
(2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_wilayah` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id`, `nama_wilayah`, `created_at`, `updated_at`) VALUES
(1, 'Wilayah 1 ( Satu )', '2018-02-13 09:25:57', '2018-02-13 09:25:57'),
(2, 'Wilayah 2 ( Dua )', '2018-02-13 09:26:16', '2018-02-13 09:26:16'),
(3, 'Wilayah 3 ( Tiga )', '2018-02-13 09:26:37', '2018-02-13 09:26:37'),
(4, 'Wilayah 4 ( Empat)', '2018-02-13 09:26:46', '2018-02-13 09:26:46'),
(5, 'wil5', '2018-02-23 09:51:45', '2018-02-23 09:51:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_stockis`
--
ALTER TABLE `alamat_stockis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`,`kd_barang`);

--
-- Indexes for table `barang_distributor`
--
ALTER TABLE `barang_distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_reject`
--
ALTER TABLE `barang_reject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `detail_kelengkapan`
--
ALTER TABLE `detail_kelengkapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_distributor_id` (`barang_distributor_id`),
  ADD KEY `kelengkapan_id` (`kelengkapan_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peringkat_distributor_id` (`peringkat_distributor_id`),
  ADD KEY `user_login_id` (`user_login_id`);

--
-- Indexes for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BARANG_ID_HARGA` (`barang_id`),
  ADD KEY `FK_WILAYAH_ID_HARGA` (`wilayah_id`);

--
-- Indexes for table `kelengkapan`
--
ALTER TABLE `kelengkapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distributor_id` (`distributor_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_portal_id_foreign` (`portal_id`),
  ADD KEY `logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_portal_id_foreign` (`portal_id`);

--
-- Indexes for table `menu_permission`
--
ALTER TABLE `menu_permission`
  ADD KEY `menu_permission_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_id` (`user_login_id`);

--
-- Indexes for table `pembelian_produk_detail`
--
ALTER TABLE `pembelian_produk_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_produk_id` (`pembelian_produk_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wilayah_id` (`wilayah_id`),
  ADD KEY `distributor_id` (`distributor_id`),
  ADD KEY `penjualan_via_id` (`penjualan_via_id`);

--
-- Indexes for table `penjualan_produk_detail`
--
ALTER TABLE `penjualan_produk_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `penjualan_id` (`penjualan_produk_id`);

--
-- Indexes for table `penjualan_via`
--
ALTER TABLE `penjualan_via`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peringkat_distributor`
--
ALTER TABLE `peringkat_distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_portal_id_foreign` (`portal_id`);

--
-- Indexes for table `portal`
--
ALTER TABLE `portal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_portal_id_foreign` (`portal_id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `transaksivia`
--
ALTER TABLE `transaksivia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_data_user_login_id_foreign` (`user_login_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_login_username_unique` (`username`),
  ADD UNIQUE KEY `user_login_email_unique` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `user_role_user_login_id_index` (`user_login_id`),
  ADD KEY `user_role_role_id_index` (`role_id`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_stockis`
--
ALTER TABLE `alamat_stockis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barang_distributor`
--
ALTER TABLE `barang_distributor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_kelengkapan`
--
ALTER TABLE `detail_kelengkapan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `kelengkapan`
--
ALTER TABLE `kelengkapan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian_produk_detail`
--
ALTER TABLE `pembelian_produk_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_produk`
--
ALTER TABLE `penjualan_produk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_produk_detail`
--
ALTER TABLE `penjualan_produk_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan_via`
--
ALTER TABLE `penjualan_via`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `peringkat_distributor`
--
ALTER TABLE `peringkat_distributor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `portal`
--
ALTER TABLE `portal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksivia`
--
ALTER TABLE `transaksivia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_reject`
--
ALTER TABLE `barang_reject`
  ADD CONSTRAINT `barang_reject_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `detail_kelengkapan`
--
ALTER TABLE `detail_kelengkapan`
  ADD CONSTRAINT `detail_kelengkapan_ibfk_2` FOREIGN KEY (`barang_distributor_id`) REFERENCES `barang_distributor` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_kelengkapan_ibfk_3` FOREIGN KEY (`kelengkapan_id`) REFERENCES `kelengkapan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `FK_BARANG_ID_HARGA` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `harga_ibfk_1` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayah` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pembelian_produk_detail`
--
ALTER TABLE `pembelian_produk_detail`
  ADD CONSTRAINT `pembelian_produk_detail_ibfk_1` FOREIGN KEY (`pembelian_produk_id`) REFERENCES `pembelian_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_produk_detail`
--
ALTER TABLE `penjualan_produk_detail`
  ADD CONSTRAINT `penjualan_produk_detail_ibfk_1` FOREIGN KEY (`penjualan_produk_id`) REFERENCES `penjualan_produk` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_produk_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
