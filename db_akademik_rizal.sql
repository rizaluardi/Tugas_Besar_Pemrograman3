-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 03:40 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik_rizal`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(2, 1, 'M4K3ITH4PPEN', 1, 0, 0, NULL, 1),
(3, 2, '432106407', 1, 1, 1, '1', 1),
(4, 8, '219429764', 1, 1, 1, '1', 1),
(5, 2, '536224980', 1, 1, 1, '1', 1),
(6, 2, '593738843', 1, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(50) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama_dosen`, `tanggal_lahir`, `jk`, `no_telepon`, `alamat`) VALUES
('123456', 'Bapak Seseorangs', '1990-01-01', 'L', '0123456', 'jalannya ga ada'),
('21388109', 'M. Harry K Saputra, S.T., M.T.I', '1990-04-01', 'L', '012345689', 'Jalan Poltekpos');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `kode_matakuliah_jadwal` varchar(50) NOT NULL,
  `nip_jadwal` varchar(50) NOT NULL,
  `kode_ruangan_jadwal` varchar(50) NOT NULL,
  `kode_jurusan_jadwal` varchar(50) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `jam` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `kode_matakuliah_jadwal`, `nip_jadwal`, `kode_ruangan_jadwal`, `kode_jurusan_jadwal`, `hari`, `jam`) VALUES
(1, 'TI41264', '21388109', '310', '14', 'Kamis', '13:00'),
(2, 'TI41264', '21388109', '310', '14', 'Sabtu', '14:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `jadwal_db`
-- (See below for the actual view)
--
CREATE TABLE `jadwal_db` (
`id_jadwal` int(11)
,`kode_matakuliah_jadwal` varchar(50)
,`nama_matakuliah` varchar(50)
,`sks` int(11)
,`nip_jadwal` varchar(50)
,`nama_dosen` varchar(50)
,`kode_ruangan_jadwal` varchar(50)
,`nama_ruangan` varchar(50)
,`kode_jurusan_jadwal` varchar(50)
,`nama_jurusan` varchar(50)
,`hari` varchar(50)
,`jam` varchar(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `kode_jenjang` varchar(50) NOT NULL,
  `nama_jenjang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenjang`
--

INSERT INTO `jenjang` (`kode_jenjang`, `nama_jenjang`) VALUES
('D4', 'Diploma 4');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(50) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_jenjang_jrs` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_jenjang_jrs`) VALUES
('14', 'D4 Teknik Informatika', 'D4');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(50) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `kode_jurusan_mhs` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_mahasiswa`, `tanggal_lahir`, `jk`, `no_telepon`, `alamat`, `kode_jurusan_mhs`) VALUES
('1184102', 'Rizaluardi Achmad Pratama', '1998-09-16', 'L', '082120132826', 'Jl Kolonel Masturi Gg Sawahlega 2 No 81', '14');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mahasiswa_db`
-- (See below for the actual view)
--
CREATE TABLE `mahasiswa_db` (
`nim` varchar(50)
,`nama_mahasiswa` varchar(50)
,`tanggal_lahir` date
,`jk` enum('L','P')
,`no_telepon` varchar(50)
,`alamat` varchar(150)
,`kode_jurusan_mhs` varchar(150)
,`nama_jurusan` varchar(50)
,`kode_jenjang_jrs` varchar(50)
,`nama_jenjang` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_matakuliah` varchar(50) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `sks`) VALUES
('TI41254', 'RPL 1', 3),
('TI41264', 'PEMROGRAMAN III (WEB SERVICE)', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nim_nilai` varchar(50) NOT NULL,
  `kode_matakuliah_nilai` varchar(50) NOT NULL,
  `nilai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nim_nilai`, `kode_matakuliah_nilai`, `nilai`) VALUES
(1, '1184102', 'TI41264', '100');

-- --------------------------------------------------------

--
-- Stand-in structure for view `nilai_db`
-- (See below for the actual view)
--
CREATE TABLE `nilai_db` (
`id_nilai` int(11)
,`nim_nilai` varchar(50)
,`nama_mahasiswa` varchar(50)
,`kode_jurusan_mhs` varchar(150)
,`nama_jurusan` varchar(50)
,`kode_matakuliah_nilai` varchar(50)
,`nama_matakuliah` varchar(50)
,`sks` int(11)
,`nilai` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` varchar(50) NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `nama_ruangan`) VALUES
('310', 'Lab TI');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_usergroup_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_usergroup_user`, `username`, `password`, `foto`) VALUES
(1, 1, 'Rizaluardi', 'master123', 'master.png'),
(2, 1, 'rizal', 'rizal', 'rizal.png'),
(3, 1, 'admin', 'admin', 'admin.png'),
(4, 1, 'saya', 'saya', 'apaaja.png'),
(5, 1, 'aku', 'kamu', 'apaaja.png'),
(6, 1, 'te', 'yo', 'apaaja.png'),
(7, 1, 'ayams', 'krispi', 'krispi.png'),
(8, 1, 'master', 'master', 'apaaja.png');

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE `usergroup` (
  `id_usergroup` int(11) NOT NULL,
  `nama_usergroup` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usergroup`
--

INSERT INTO `usergroup` (`id_usergroup`, `nama_usergroup`) VALUES
(1, 'Master User');

-- --------------------------------------------------------

--
-- Structure for view `jadwal_db`
--
DROP TABLE IF EXISTS `jadwal_db`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jadwal_db`  AS  select `j`.`id_jadwal` AS `id_jadwal`,`j`.`kode_matakuliah_jadwal` AS `kode_matakuliah_jadwal`,`b`.`nama_matakuliah` AS `nama_matakuliah`,`b`.`sks` AS `sks`,`j`.`nip_jadwal` AS `nip_jadwal`,`c`.`nama_dosen` AS `nama_dosen`,`j`.`kode_ruangan_jadwal` AS `kode_ruangan_jadwal`,`d`.`nama_ruangan` AS `nama_ruangan`,`j`.`kode_jurusan_jadwal` AS `kode_jurusan_jadwal`,`e`.`nama_jurusan` AS `nama_jurusan`,`j`.`hari` AS `hari`,`j`.`jam` AS `jam` from ((((`jadwal` `j` join `matakuliah` `b` on(`j`.`kode_matakuliah_jadwal` = `b`.`kode_matakuliah`)) join `dosen` `c` on(`j`.`nip_jadwal` = `c`.`nip`)) join `ruangan` `d` on(`j`.`kode_ruangan_jadwal` = `d`.`kode_ruangan`)) join `jurusan` `e` on(`j`.`kode_jurusan_jadwal` = `e`.`kode_jurusan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `mahasiswa_db`
--
DROP TABLE IF EXISTS `mahasiswa_db`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mahasiswa_db`  AS  select `m`.`nim` AS `nim`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`tanggal_lahir` AS `tanggal_lahir`,`m`.`jk` AS `jk`,`m`.`no_telepon` AS `no_telepon`,`m`.`alamat` AS `alamat`,`m`.`kode_jurusan_mhs` AS `kode_jurusan_mhs`,`j`.`nama_jurusan` AS `nama_jurusan`,`j`.`kode_jenjang_jrs` AS `kode_jenjang_jrs`,`n`.`nama_jenjang` AS `nama_jenjang` from ((`mahasiswa` `m` join `jurusan` `j` on(`m`.`kode_jurusan_mhs` = `j`.`kode_jurusan`)) join `jenjang` `n` on(`j`.`kode_jenjang_jrs` = `n`.`kode_jenjang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `nilai_db`
--
DROP TABLE IF EXISTS `nilai_db`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_db`  AS  select `n`.`id_nilai` AS `id_nilai`,`n`.`nim_nilai` AS `nim_nilai`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`kode_jurusan_mhs` AS `kode_jurusan_mhs`,`j`.`nama_jurusan` AS `nama_jurusan`,`n`.`kode_matakuliah_nilai` AS `kode_matakuliah_nilai`,`k`.`nama_matakuliah` AS `nama_matakuliah`,`k`.`sks` AS `sks`,`n`.`nilai` AS `nilai` from (((`nilai` `n` join `mahasiswa` `m` on(`n`.`nim_nilai` = `m`.`nim`)) join `jurusan` `j` on(`m`.`kode_jurusan_mhs` = `j`.`kode_jurusan`)) join `matakuliah` `k` on(`n`.`kode_matakuliah_nilai` = `k`.`kode_matakuliah`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `kode_matakuliah_jadwal` (`kode_matakuliah_jadwal`),
  ADD KEY `nip_jadwal` (`nip_jadwal`),
  ADD KEY `kode_ruangan_jadwal` (`kode_ruangan_jadwal`),
  ADD KEY `kode_jurusan_jadwal` (`kode_jurusan_jadwal`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`kode_jenjang`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`),
  ADD KEY `kode_jenjang_jrs` (`kode_jenjang_jrs`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_jurusan_mhs` (`kode_jurusan_mhs`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nim_nilai` (`nim_nilai`),
  ADD KEY `kode_matakuliah_nilai` (`kode_matakuliah_nilai`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_usergroup_user` (`id_usergroup_user`);

--
-- Indexes for table `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`id_usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `kode_jurusan_jadwal` FOREIGN KEY (`kode_jurusan_jadwal`) REFERENCES `jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `kode_matakuliah_jadwal` FOREIGN KEY (`kode_matakuliah_jadwal`) REFERENCES `matakuliah` (`kode_matakuliah`),
  ADD CONSTRAINT `kode_ruangan_jadwal` FOREIGN KEY (`kode_ruangan_jadwal`) REFERENCES `ruangan` (`kode_ruangan`),
  ADD CONSTRAINT `nip_jadwal` FOREIGN KEY (`nip_jadwal`) REFERENCES `dosen` (`nip`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `kode_jenjang_jrs` FOREIGN KEY (`kode_jenjang_jrs`) REFERENCES `jenjang` (`kode_jenjang`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `kode_jurusan_mhs` FOREIGN KEY (`kode_jurusan_mhs`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `kode_matakuliah_nilai` FOREIGN KEY (`kode_matakuliah_nilai`) REFERENCES `matakuliah` (`kode_matakuliah`),
  ADD CONSTRAINT `nim_nilai` FOREIGN KEY (`nim_nilai`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `id_usergroup_user` FOREIGN KEY (`id_usergroup_user`) REFERENCES `usergroup` (`id_usergroup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
