-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2022 pada 13.25
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kim`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `npk` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `akses` enum('admin','user') NOT NULL,
  `negara` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `nama`, `npk`, `pass`, `alamat`, `akses`, `negara`) VALUES
('2021050202', 'firmansyah', '123', '202cb962ac59075b964b07152d234b70', 'test', 'admin', 'Indonesia'),
('2021050301', 'firmansyah', '1234', '89defae676abd3e3a42b41df17c40096', 'dadad', 'admin', 'Indonesia'),
('2021050312', 'Kholisah Lustinasari', '1234', '81dc9bdb52d04dc20036dbd8313ed055', 'Bandung', 'user', 'Malaysia'),
('2021050315', 'firmansyah', '1234567', 'e10adc3949ba59abbe56e057f20f883e', 'dada', 'admin', 'Indonesia'),
('2021050320', 'Rahma Melda', '1347', '2ddbf96e67b1c7d400979c9670d63421', 'kuala lumpur', 'user', 'Malaysia'),
('2021050326', 'Elvano Khairuzuran', '1346', '9006645bcfa370cae1c0b4565ca15f54', 'kuala lumpur', 'admin', 'Malaysia'),
('2021050329', 'firmansyah', '12', '1534b76d325a8f591b52d302e7181331', '12', 'admin', 'Indonesia'),
('2021050349', 'Shawn Mendes', '1349', '0967968ff32d2bda10edaa72e545116f', 'jakarta', 'user', 'Indonesia'),
('2021121349', 'ELVANO', '3030', '2d95666e2649fcfc6e3af75e09f5adb9', 'JAKARTA', 'user', 'Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report`
--

CREATE TABLE `report` (
  `id_report` varchar(20) NOT NULL,
  `id_tipe` varchar(20) DEFAULT NULL,
  `id_akun` varchar(20) DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `tipe` varchar(20) DEFAULT NULL,
  `judge` varchar(20) DEFAULT NULL,
  `after_repair` varchar(20) DEFAULT NULL,
  `defect` text DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `size` varchar(25) DEFAULT NULL,
  `area` varchar(14) DEFAULT NULL,
  `sub_area` varchar(10) DEFAULT NULL,
  `smd` date DEFAULT NULL,
  `ism` text DEFAULT NULL,
  `rmd` date DEFAULT NULL,
  `irm` text DEFAULT NULL,
  `isk` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `report`
--

INSERT INTO `report` (`id_report`, `id_tipe`, `id_akun`, `input_date`, `tipe`, `judge`, `after_repair`, `defect`, `picture`, `size`, `area`, `sub_area`, `smd`, `ism`, `rmd`, `irm`, `isk`) VALUES
('Report07052021104832', 'TP2021060836', '2021050202', '2021-04-26', 'D38L', 'REPAIR', 'OK', 'DENT', '070520211050141.png', '1.5', 'AREA 2', 'HUB', '2021-02-05', 'F', '2021-03-04', 'DH', 'A'),
('Report07052021105021', 'TP2021060828', '2021050202', '2021-04-26', 'D42L', 'OK', '', 'SCRATCH PACKAGING', '02012022214709040520211543432.png', '4', 'AREA 1', 'SPOKE', '2021-01-15', '12', '2021-01-18', '4', '12'),
('Report07052021105158', 'TP2021060856', '2021050202', '2021-04-26', 'D20N', 'REPAIR', 'REJECT', 'SCRATHCH', '070520211053123.png', '25', 'AREA 1', 'HUB', '2021-02-23', 'H', '2021-02-25', '6', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe`
--

CREATE TABLE `tipe` (
  `id_tipe` varchar(20) NOT NULL,
  `tipe_name` varchar(20) DEFAULT NULL,
  `create_at` varchar(20) DEFAULT NULL,
  `update_at` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tipe`
--

INSERT INTO `tipe` (`id_tipe`, `tipe_name`, `create_at`, `update_at`) VALUES
('TP2021060828', 'D42L', '2021060828', ''),
('TP2021060836', 'D38L', '2021060836', ''),
('TP2021060856', 'D20N', '2021060856', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `id_tipe` (`id_tipe`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indeks untuk tabel `tipe`
--
ALTER TABLE `tipe`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`id_tipe`) REFERENCES `tipe` (`id_tipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
