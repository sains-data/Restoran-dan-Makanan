-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 25 Bulan Mei 2025 pada 19.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `create_table`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dimpizza`
--

CREATE TABLE `dimpizza` (
  `kunci_pizza` int(11) NOT NULL,
  `id_nama_pizza` varchar(255) DEFAULT NULL,
  `nama_pizza` varchar(255) DEFAULT NULL,
  `kategori_pizza` varchar(50) DEFAULT NULL,
  `bahan_pizza` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dimtanggal`
--

CREATE TABLE `dimtanggal` (
  `id_tanggal` int(11) NOT NULL,
  `tanggal_pesanan` date DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `kuartal` int(11) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `hari` int(11) DEFAULT NULL,
  `hari_dalam_minggu` int(11) DEFAULT NULL,
  `nama_hari` varchar(10) DEFAULT NULL,
  `nama_bulan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dimukuranpizza`
--

CREATE TABLE `dimukuranpizza` (
  `id_ukuran_pizza` int(11) NOT NULL,
  `ukuran_pizza` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dimwaktu`
--

CREATE TABLE `dimwaktu` (
  `id_waktu` int(11) NOT NULL,
  `waktu_pesanan` time DEFAULT NULL,
  `jam` int(11) DEFAULT NULL,
  `menit` int(11) DEFAULT NULL,
  `detik` int(11) DEFAULT NULL,
  `waktu_dalam_hari` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktapenjualanpizza`
--

CREATE TABLE `faktapenjualanpizza` (
  `id_fakta` int(11) NOT NULL,
  `id_pizza` varchar(50) DEFAULT NULL,
  `id_pesanan` varchar(50) DEFAULT NULL,
  `id_tanggal` int(11) DEFAULT NULL,
  `id_waktu` int(11) DEFAULT NULL,
  `kunci_pizza` int(11) DEFAULT NULL,
  `id_ukuran_pizza` int(11) DEFAULT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  `harga_satuan` decimal(10,2) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `staging_pizza_sales`
--

CREATE TABLE `staging_pizza_sales` (
  `pizza_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `pizza_name_id` varchar(255) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL,
  `order_time` varchar(50) DEFAULT NULL,
  `unit_price` varchar(50) DEFAULT NULL,
  `total_price` varchar(50) DEFAULT NULL,
  `pizza_size` varchar(50) DEFAULT NULL,
  `pizza_category` varchar(50) DEFAULT NULL,
  `pizza_ingredients` text DEFAULT NULL,
  `pizza_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dimpizza`
--
ALTER TABLE `dimpizza`
  ADD PRIMARY KEY (`kunci_pizza`),
  ADD UNIQUE KEY `id_nama_pizza` (`id_nama_pizza`),
  ADD KEY `idx_nama_pizza` (`nama_pizza`),
  ADD KEY `idx_kategori_pizza` (`kategori_pizza`);

--
-- Indeks untuk tabel `dimtanggal`
--
ALTER TABLE `dimtanggal`
  ADD PRIMARY KEY (`id_tanggal`),
  ADD UNIQUE KEY `tanggal_pesanan` (`tanggal_pesanan`),
  ADD KEY `idx_order_date` (`tanggal_pesanan`),
  ADD KEY `idx_tahun` (`tahun`),
  ADD KEY `idx_kuartal` (`kuartal`),
  ADD KEY `idx_bulan` (`bulan`),
  ADD KEY `idx_hari` (`hari`),
  ADD KEY `idx_hari_dalam_minggu` (`hari_dalam_minggu`),
  ADD KEY `idx_nama_hari` (`nama_hari`),
  ADD KEY `idx_nama_bulan` (`nama_bulan`);

--
-- Indeks untuk tabel `dimukuranpizza`
--
ALTER TABLE `dimukuranpizza`
  ADD PRIMARY KEY (`id_ukuran_pizza`),
  ADD UNIQUE KEY `ukuran_pizza` (`ukuran_pizza`);

--
-- Indeks untuk tabel `dimwaktu`
--
ALTER TABLE `dimwaktu`
  ADD PRIMARY KEY (`id_waktu`),
  ADD UNIQUE KEY `waktu_pesanan` (`waktu_pesanan`),
  ADD KEY `idx_waktu_pesanan` (`waktu_pesanan`),
  ADD KEY `idx_jam` (`jam`),
  ADD KEY `idx_menit` (`menit`),
  ADD KEY `idx_detik` (`detik`),
  ADD KEY `idx_waktu_dalam_hari` (`waktu_dalam_hari`);

--
-- Indeks untuk tabel `faktapenjualanpizza`
--
ALTER TABLE `faktapenjualanpizza`
  ADD PRIMARY KEY (`id_fakta`),
  ADD KEY `fk_idx_id_tanggal` (`id_tanggal`),
  ADD KEY `fk_idx_id_waktu` (`id_waktu`),
  ADD KEY `fk_idx_kunci_pizza` (`kunci_pizza`),
  ADD KEY `fk_idx_id_ukuran_pizza` (`id_ukuran_pizza`),
  ADD KEY `idx_id_pizza` (`id_pizza`),
  ADD KEY `idx_id_pesanan` (`id_pesanan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dimpizza`
--
ALTER TABLE `dimpizza`
  MODIFY `kunci_pizza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dimukuranpizza`
--
ALTER TABLE `dimukuranpizza`
  MODIFY `id_ukuran_pizza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faktapenjualanpizza`
--
ALTER TABLE `faktapenjualanpizza`
  MODIFY `id_fakta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `faktapenjualanpizza`
--
ALTER TABLE `faktapenjualanpizza`
  ADD CONSTRAINT `faktapenjualanpizza_ibfk_1` FOREIGN KEY (`id_tanggal`) REFERENCES `dimtanggal` (`id_tanggal`),
  ADD CONSTRAINT `faktapenjualanpizza_ibfk_2` FOREIGN KEY (`id_waktu`) REFERENCES `dimwaktu` (`id_waktu`),
  ADD CONSTRAINT `faktapenjualanpizza_ibfk_3` FOREIGN KEY (`kunci_pizza`) REFERENCES `dimpizza` (`kunci_pizza`),
  ADD CONSTRAINT `faktapenjualanpizza_ibfk_4` FOREIGN KEY (`id_ukuran_pizza`) REFERENCES `dimukuranpizza` (`id_ukuran_pizza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
