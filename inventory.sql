-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Nov 2022 pada 16.19
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `ID_BARANG` int(20) NOT NULL,
  `KODE_BARANG` varchar(6) NOT NULL,
  `NAMA_BARANG` varchar(50) NOT NULL,
  `SATUAN` varchar(10) NOT NULL,
  `HARGA_BARANG` decimal(18,3) NOT NULL,
  `CURRENCY` varchar(4) NOT NULL,
  `ID_VENDOR` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `ID_ORDER` int(20) NOT NULL,
  `ID_PERMINTAAN` int(20) NOT NULL,
  `HARGA_TOTAL` decimal(8,2) NOT NULL,
  `APPROVAL` varchar(10) NOT NULL,
  `STATUS_ORDER` varchar(20) DEFAULT NULL,
  `TANGGAL_ORDER` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerimaan`
--

CREATE TABLE `tb_penerimaan` (
  `ID_PENERIMAAN` int(20) NOT NULL,
  `TANGGAL_TERIMA` date NOT NULL,
  `ID_ORDER` int(20) NOT NULL,
  `QTY_AWAL` decimal(10,0) NOT NULL,
  `QTY_MASUK` decimal(10,0) NOT NULL,
  `QTY_STOCK` decimal(10,0) NOT NULL,
  `STAFF_GUDANG` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `ID_PENGELUARAN` int(20) NOT NULL,
  `TANGGAL_KELUAR` date NOT NULL,
  `ID_BARANG` int(20) NOT NULL,
  `BEG_QTY` decimal(10,0) NOT NULL,
  `QTY_KELUAR` decimal(10,0) NOT NULL,
  `END_QTY` decimal(10,0) NOT NULL,
  `SATUAN` varchar(10) NOT NULL,
  `STAFF_GUDANG` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_permintaan`
--

CREATE TABLE `tb_permintaan` (
  `ID_PERMINTAAN` int(20) NOT NULL,
  `TANGGAL_PERMINTAAN` date NOT NULL,
  `ID_BARANG` int(20) NOT NULL,
  `QTY_BARANG` decimal(10,0) NOT NULL,
  `TANGGAL_KIRIM` date NOT NULL,
  `STATUS_PERMINTAAN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stock`
--

CREATE TABLE `tb_stock` (
  `ID_STOCK` int(20) NOT NULL,
  `ID_BARANG` int(20) NOT NULL,
  `END_STOCK` decimal(10,0) NOT NULL,
  `MIN_STOCK` decimal(10,0) DEFAULT NULL,
  `STATUS_STOCK` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `ID_USER` int(8) NOT NULL,
  `NAMA_USER` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `LEVEL_USER` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`ID_USER`, `NAMA_USER`, `PASSWORD`, `LEVEL_USER`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_vendor`
--

CREATE TABLE `tb_vendor` (
  `ID_VENDOR` int(10) NOT NULL,
  `NAMA_VENDOR` varchar(50) NOT NULL,
  `ALAMAT_VENDOR` varchar(100) NOT NULL,
  `TELP_VENDOR` varchar(20) NOT NULL,
  `EMAIL_VENDOR` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`ID_BARANG`),
  ADD KEY `ID_VENDOR` (`ID_VENDOR`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`ID_ORDER`),
  ADD KEY `ID_PERMINTAAN` (`ID_PERMINTAAN`);

--
-- Indeks untuk tabel `tb_penerimaan`
--
ALTER TABLE `tb_penerimaan`
  ADD PRIMARY KEY (`ID_PENERIMAAN`),
  ADD KEY `ID_ORDER` (`ID_ORDER`);

--
-- Indeks untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`ID_PENGELUARAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `tb_permintaan`
--
ALTER TABLE `tb_permintaan`
  ADD PRIMARY KEY (`ID_PERMINTAAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD PRIMARY KEY (`ID_STOCK`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Indeks untuk tabel `tb_vendor`
--
ALTER TABLE `tb_vendor`
  ADD PRIMARY KEY (`ID_VENDOR`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `ID_BARANG` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `ID_ORDER` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_penerimaan`
--
ALTER TABLE `tb_penerimaan`
  MODIFY `ID_PENERIMAAN` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  MODIFY `ID_PENGELUARAN` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_permintaan`
--
ALTER TABLE `tb_permintaan`
  MODIFY `ID_PERMINTAAN` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_stock`
--
ALTER TABLE `tb_stock`
  MODIFY `ID_STOCK` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `ID_USER` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_vendor`
--
ALTER TABLE `tb_vendor`
  MODIFY `ID_VENDOR` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`ID_VENDOR`) REFERENCES `tb_vendor` (`ID_VENDOR`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`ID_PERMINTAAN`) REFERENCES `tb_permintaan` (`ID_PERMINTAAN`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_penerimaan`
--
ALTER TABLE `tb_penerimaan`
  ADD CONSTRAINT `tb_penerimaan_ibfk_1` FOREIGN KEY (`ID_ORDER`) REFERENCES `tb_order` (`ID_ORDER`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD CONSTRAINT `tb_pengeluaran_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `tb_barang` (`ID_BARANG`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_permintaan`
--
ALTER TABLE `tb_permintaan`
  ADD CONSTRAINT `tb_permintaan_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `tb_barang` (`ID_BARANG`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD CONSTRAINT `tb_stock_ibfk_1` FOREIGN KEY (`ID_BARANG`) REFERENCES `tb_barang` (`ID_BARANG`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
