-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2021 pada 14.06
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(5) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `namalengkap` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`) VALUES
(6, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `idguru` int(5) NOT NULL,
  `namaguru` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`idguru`, `namaguru`) VALUES
(1, 'Arif Muhammad'),
(4, 'Gilang Ardi'),
(5, 'Kevin Sanjaya'),
(6, 'Reza Oktaf'),
(7, 'Hengky'),
(8, 'Wahyu Bagus'),
(9, 'Dimas D.S'),
(11, 'Budi'),
(15, 'Irwan'),
(16, 'Udin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int(10) NOT NULL,
  `nis` varchar(10) DEFAULT NULL,
  `namasiswa` varchar(40) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `tahunajaran` varchar(10) DEFAULT NULL,
  `biaya` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `nis`, `namasiswa`, `kelas`, `tahunajaran`, `biaya`) VALUES
(33, '2017100001', 'Dimas Dwi Susanto', 'IX B', '2018/2019', 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `idspp` int(5) NOT NULL,
  `idsiswa` int(10) DEFAULT NULL,
  `jatuhtempo` date DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `nobayar` varchar(10) DEFAULT NULL,
  `tglbayar` date DEFAULT NULL,
  `jumlah` int(20) DEFAULT NULL,
  `ket` varchar(20) DEFAULT NULL,
  `idadmin` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`idspp`, `idsiswa`, `jatuhtempo`, `bulan`, `nobayar`, `tglbayar`, `jumlah`, `ket`, `idadmin`) VALUES
(109, 33, '2018-10-10', 'Oktober  2018', '2103110001', '2021-03-11', 250000, 'LUNAS', 6),
(110, 33, '2018-11-10', 'November  2018', '2103110002', '2021-03-11', 250000, 'LUNAS', 6),
(111, 33, '2018-12-10', 'Desember  2018', '2103110003', '2021-03-11', 250000, 'LUNAS', 6),
(112, 33, '2019-01-10', 'januari  2019', NULL, NULL, 250000, NULL, NULL),
(113, 33, '2019-02-10', 'Februari  2019', NULL, NULL, 250000, NULL, NULL),
(114, 33, '2019-03-10', 'Maret  2019', NULL, NULL, 250000, NULL, NULL),
(115, 33, '2019-04-10', 'April  2019', NULL, NULL, 250000, NULL, NULL),
(116, 33, '2019-05-10', 'Mei  2019', NULL, NULL, 250000, NULL, NULL),
(117, 33, '2019-06-10', 'Juni  2019', NULL, NULL, 250000, NULL, NULL),
(118, 33, '2019-07-10', 'Juli  2019', NULL, NULL, 250000, NULL, NULL),
(119, 33, '2019-08-10', 'Agustus  2019', NULL, NULL, 250000, NULL, NULL),
(120, 33, '2019-09-10', 'September  2019', NULL, NULL, 250000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `walikelas`
--

CREATE TABLE `walikelas` (
  `kelas` varchar(10) NOT NULL,
  `idguru` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `walikelas`
--

INSERT INTO `walikelas` (`kelas`, `idguru`) VALUES
('IX A', 1),
('VII C', 1),
('VIII B', 1),
('VII B', 4),
('X A', 5),
('VIII C', 6),
('VIII A', 7),
('IX B', 9),
('VII A', 11),
('X B', 15),
('XII F', 16);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`),
  ADD KEY `fk_kelas` (`kelas`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`idspp`),
  ADD KEY `fk_admin` (`idadmin`),
  ADD KEY `fk_siswa` (`idsiswa`);

--
-- Indeks untuk tabel `walikelas`
--
ALTER TABLE `walikelas`
  ADD PRIMARY KEY (`kelas`),
  ADD KEY `fk_guru` (`idguru`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `idguru` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `idspp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_kelas` FOREIGN KEY (`kelas`) REFERENCES `walikelas` (`kelas`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`idadmin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `walikelas`
--
ALTER TABLE `walikelas`
  ADD CONSTRAINT `fk_guru` FOREIGN KEY (`idguru`) REFERENCES `guru` (`idguru`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
