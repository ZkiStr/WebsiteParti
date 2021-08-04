-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2021 pada 00.30
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_parti`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL,
  `adminemail` varchar(50) NOT NULL,
  `adminpassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`adminid`, `adminemail`, `adminpassword`) VALUES
(1, 'admin@bani.id', 'admin1bani');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `useremail` varchar(50) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `tgldaftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

-- INSERT INTO `user` (`userid`, `useremail`, `userpassword`, `tgldaftar`) VALUES
-- (1, 'guest@bani.id', 'guest', '2021-08-12 02:22:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userdatadonasi`
--

CREATE TABLE `userdatadonasi` (
  `userid` int(11) NOT NULL,
  `nama` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `whatsapp` varchar(15) NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `tglkonfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `userdatadonasi`
--

-- INSERT INTO `userdatadonasi` (`userid`, `nama`, `whatsapp`, `status`, `tglkonfirmasi`) VALUES
-- (1, 'guest bani saputra', '08573661387', 'Verified', '2021-07-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userdatalomba`
--

CREATE TABLE `userdatalomba` (
  `userdataid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `whatsapp` varchar(15) NOT NULL,
  `fotoid` varchar(99) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Unverified',
  `tglkonfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `userdatalomba`
--

-- INSERT INTO `userdatalomba` (`userdataid`, `userid`, `namalengkap`, `email`, `whatsapp`, `fotoid`, `status`, `tglkonfirmasi`) VALUES
-- (1, 1, 'guest bani saputra', 'guest@bani.id', '085736616387', 'images/fotolomba/foto_guest bani saputra.png', 'Verified', '2021-07-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userdatawebinar`
--

CREATE TABLE `userdatawebinar` (
  `userdataid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `whatsapp` varchar(15) NOT NULL,
  `foto` varchar(99) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Unverified',
  `tglkonfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `userdatawebinar`
--

-- INSERT INTO `userdatawebinar` (`userdataid`, `userid`, `namalengkap`, `email`, `whatsapp`, `foto`, `status`, `tglkonfirmasi`) VALUES
-- (1, 1, 'guest bani saputra', 'guest@bani.id', '0857366163873', 'images/foto/foto_guest bani.jpg', 'Verified', '2021-07-19');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indeks untuk tabel `userdatadonasi`
--
ALTER TABLE `userdatadonasi`
  ADD PRIMARY KEY (`userid`);

--
-- Indeks untuk tabel `userdatalomba`
--
ALTER TABLE `userdatalomba`
  ADD PRIMARY KEY (`userdataid`);

--
-- Indeks untuk tabel `userdatawebinar`
--
ALTER TABLE `userdatawebinar`
  ADD PRIMARY KEY (`userdataid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `userdatadonasi`
--
ALTER TABLE `userdatadonasi`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `userdatalomba`
--
ALTER TABLE `userdatalomba`
  MODIFY `userdataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `userdatawebinar`
--
ALTER TABLE `userdatawebinar`
  MODIFY `userdataid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
