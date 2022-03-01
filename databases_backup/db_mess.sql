-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Feb 2022 pada 03.37
-- Versi server: 5.7.24
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mess`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '::1', 'user@gmail.com', 1645799484);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mst_departemen`
--

CREATE TABLE `tbl_mst_departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(255) NOT NULL,
  `singkatan_departemen` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mst_departemen`
--

INSERT INTO `tbl_mst_departemen` (`id_departemen`, `nama_departemen`, `singkatan_departemen`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Informasi Teknologi Development', 'ITD', 0, '2022-02-09 07:34:19', '', '2022-02-12 21:21:00', 'admin'),
(2, 'Human Resources Department', 'HRD', 1, '2022-02-09 07:34:26', '', '2022-02-25 00:20:00', 'admin'),
(3, 'Personalia', 'PSN', 1, '2022-02-09 02:22:21', 'admin', '2022-02-11 01:39:16', 'admin'),
(7, 'Sales & Marketing', 'SM', 1, '2022-02-11 18:32:06', 'admin', '2022-02-12 01:32:06', ''),
(8, 'Purchasing', 'PS', 1, '2022-02-11 18:32:38', 'admin', '2022-02-11 18:37:06', 'admin'),
(9, 'Production', 'PD', 1, '2022-02-11 18:32:53', 'admin', '2022-02-11 18:52:33', 'admin'),
(10, 'QA Quality Assurance', 'QA', 1, '2022-02-11 18:39:49', 'admin', '2022-02-11 19:54:44', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mst_kamar`
--

CREATE TABLE `tbl_mst_kamar` (
  `id_kamar` int(11) NOT NULL,
  `id_mess` int(11) NOT NULL,
  `nomor_kamar` int(11) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mst_kamar`
--

INSERT INTO `tbl_mst_kamar` (`id_kamar`, `id_mess`, `nomor_kamar`, `kapasitas`, `is_available`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 1, 1, 1, '2022-02-14 02:21:48', 'admin', '2022-02-24 00:03:41', 'admin'),
(2, 1, 2, 1, 1, 1, '2022-02-14 02:21:48', 'admin', '2022-02-24 00:04:28', 'admin'),
(3, 1, 3, 1, 1, 1, '2022-02-14 02:21:48', 'admin', '2022-02-19 22:45:47', 'admin'),
(4, 1, 4, 1, 1, 1, '2022-02-14 02:21:48', 'admin', '2022-02-18 01:33:56', 'admin'),
(5, 1, 5, 1, 1, 1, '2022-02-14 02:21:48', 'admin', '0000-00-00 00:00:00', ''),
(6, 2, 1, 4, 1, 1, '2022-02-14 18:12:31', 'admin', '2022-02-17 18:42:00', 'admin'),
(7, 2, 2, 4, 1, 1, '2022-02-14 18:12:31', 'admin', '0000-00-00 00:00:00', ''),
(8, 3, 1, 1, 1, 1, '2022-02-15 01:19:57', 'admin', '2022-02-24 00:05:38', 'admin'),
(9, 3, 2, 1, 1, 1, '2022-02-15 01:19:57', 'admin', '2022-02-25 08:10:29', 'admin'),
(10, 3, 3, 1, 1, 1, '2022-02-15 01:19:57', 'admin', '2022-02-23 23:47:27', 'admin'),
(11, 3, 4, 1, 1, 1, '2022-02-15 01:19:57', 'admin', '2022-02-21 19:37:41', 'admin'),
(12, 3, 5, 1, 1, 1, '2022-02-15 01:19:57', 'admin', '2022-02-21 19:38:49', 'admin'),
(13, 4, 1, 1, 0, 1, '2022-02-16 21:13:56', 'admin', '2022-02-25 19:44:01', 'admin'),
(14, 4, 2, 1, 1, 1, '2022-02-16 21:13:56', 'admin', '0000-00-00 00:00:00', ''),
(15, 4, 3, 1, 1, 1, '2022-02-16 21:13:56', 'admin', '0000-00-00 00:00:00', ''),
(16, 4, 4, 1, 1, 1, '2022-02-16 21:13:56', 'admin', '2022-02-25 10:46:44', 'admin'),
(17, 4, 5, 1, 1, 1, '2022-02-16 21:13:56', 'admin', '0000-00-00 00:00:00', ''),
(18, 5, 1, 4, 1, 1, '2022-02-18 18:32:22', 'admin', '0000-00-00 00:00:00', ''),
(19, 5, 2, 4, 1, 1, '2022-02-18 18:32:22', 'admin', '0000-00-00 00:00:00', ''),
(20, 6, 1, 4, 1, 1, '2022-02-23 21:42:03', 'admin', '0000-00-00 00:00:00', ''),
(21, 6, 2, 4, 1, 1, '2022-02-23 21:42:03', 'admin', '0000-00-00 00:00:00', ''),
(22, 7, 1, 1, 1, 1, '2022-02-24 00:06:34', 'admin', '2022-02-25 19:51:48', 'admin'),
(23, 7, 2, 1, 1, 1, '2022-02-24 00:06:34', 'admin', '2022-02-25 19:46:11', 'admin'),
(24, 7, 3, 1, 0, 1, '2022-02-24 00:06:34', 'admin', '2022-02-25 19:46:11', 'admin'),
(25, 7, 4, 1, 1, 1, '2022-02-24 00:06:34', 'admin', '0000-00-00 00:00:00', ''),
(26, 7, 5, 1, 0, 1, '2022-02-24 00:06:34', 'admin', '2022-02-25 19:51:48', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mst_karyawan`
--

CREATE TABLE `tbl_mst_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `nik` varchar(5) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mst_karyawan`
--

INSERT INTO `tbl_mst_karyawan` (`id_karyawan`, `id_departemen`, `nik`, `nama_karyawan`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 7, '23333', 'Wira', '2022-02-08', 'Laki-laki', 'Jl. Wira', 1, '2022-02-21 18:38:13', 'admin', '2022-02-22 01:38:13', ''),
(2, 2, '24001', 'Cinta', '2022-02-02', 'Perempuan', 'Jl. Cinta', 1, '2022-02-21 18:38:49', 'admin', '2022-02-22 01:38:49', ''),
(3, 9, '40364', 'Yuliana', '2022-02-08', 'Perempuan', 'Jl. Yuliana', 1, '2022-02-21 19:40:11', 'admin', '2022-02-22 02:40:11', ''),
(4, 3, '30963', 'Nur', '2022-02-05', 'Perempuan', 'Jl. Nur', 1, '2022-02-21 18:39:59', 'admin', '2022-02-22 01:39:59', ''),
(5, 10, '75423', 'Krisna', '2022-02-10', 'Perempuan', 'Jl. Krisna', 1, '2022-02-21 18:40:33', 'admin', '2022-02-22 01:40:33', ''),
(6, 7, '48123', 'Daud', '2022-02-08', 'Laki-laki', 'Jl. Daud', 1, '2022-02-21 18:41:08', 'admin', '2022-02-22 01:41:08', ''),
(7, 8, '26841', 'Irfan', '2022-02-16', 'Laki-laki', 'Jl. Irfan', 1, '2022-02-21 18:41:45', 'admin', '2022-02-25 01:44:06', 'admin'),
(8, 3, '75580', 'Putri', '2022-02-07', 'Perempuan', 'Jl. Putri', 1, '2022-02-21 18:42:11', 'admin', '2022-02-22 01:42:11', ''),
(9, 8, '06970', 'Melati', '2022-02-08', 'Perempuan', 'Jl. Melati', 1, '2022-02-21 18:42:42', 'admin', '2022-02-22 01:42:42', ''),
(10, 8, '47534', 'Surya', '2022-02-19', 'Laki-laki', 'Jl . Surya', 1, '2022-02-21 18:43:26', 'admin', '2022-02-22 01:43:26', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mst_mess`
--

CREATE TABLE `tbl_mst_mess` (
  `id_mess` int(11) NOT NULL,
  `nama_mess` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `type_mess` varchar(255) DEFAULT NULL,
  `kategori_mess` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mst_mess`
--

INSERT INTO `tbl_mst_mess` (`id_mess`, `nama_mess`, `alamat`, `jumlah_kamar`, `type_mess`, `kategori_mess`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Buaya', 'Jl. Buaya', 5, 'Lajang', 'Laki-laki', 1, '2022-02-14 02:21:48', 'admin', '2022-02-14 09:21:48', ''),
(2, 'Samawa', 'Jl. Samawa', 2, 'Keluarga', '', 1, '2022-02-14 18:12:31', 'admin', '2022-02-15 01:12:31', ''),
(3, 'Biawak', 'Jl. Biawak', 5, 'Lajang', 'Perempuan', 1, '2022-02-15 01:19:57', 'admin', '2022-02-15 08:19:57', ''),
(4, 'Men', 'Jl. Men', 5, 'Lajang', 'Laki-laki', 1, '2022-02-16 21:13:55', 'admin', '2022-02-17 04:13:55', ''),
(5, 'Sakinah', 'Jl. Sakinah', 2, 'Keluarga', '', 1, '2022-02-18 18:32:22', 'admin', '2022-02-19 01:32:22', ''),
(6, 'Mess Keluarga Cemara', 'Jl. Cemara', 2, 'Keluarga', '', 1, '2022-02-23 21:42:03', 'admin', '2022-02-24 04:42:03', ''),
(7, 'Mess Putri', 'Jl. Putri', 5, 'Lajang', 'Perempuan', 1, '2022-02-24 00:06:34', 'admin', '2022-02-24 07:06:34', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_trx_mess`
--

CREATE TABLE `tbl_trx_mess` (
  `id_trx_mess` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_mess` int(11) NOT NULL,
  `id_kamar` int(11) DEFAULT '0',
  `komentar` varchar(255) NOT NULL,
  `complate_stat` tinyint(255) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL,
  `approve_status` tinyint(255) DEFAULT '0',
  `approve_by` varchar(255) NOT NULL,
  `approve_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_trx_mess`
--

INSERT INTO `tbl_trx_mess` (`id_trx_mess`, `id_karyawan`, `id_mess`, `id_kamar`, `komentar`, `complate_stat`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `approve_status`, `approve_by`, `approve_date`) VALUES
(1, 2, 2, 0, '', 0, 1, '2022-02-25 19:42:39', 'admin', '2022-02-26 02:42:39', '', 0, '', '2022-02-26 02:42:39'),
(2, 3, 7, 26, '', 0, 1, '2022-02-25 19:51:48', 'admin', '2022-02-26 02:43:14', '', 0, '', '2022-02-26 02:43:14'),
(3, 7, 4, 13, '', 0, 1, '2022-02-25 19:44:01', 'admin', '2022-02-26 02:44:01', '', 0, '', '2022-02-26 02:44:01'),
(4, 9, 7, 24, '', 0, 1, '2022-02-25 19:46:11', 'admin', '2022-02-26 02:44:21', '', 0, '', '2022-02-26 02:44:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$10$Fk887qUBN/BBDHrBfW5ht.a2VJ4fdJe37v8kKG3ZknxZAwRICc0nu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1645843107, 1, 'Admin', 'Administrator', 'ADMIN', '0'),
(3, '::1', NULL, '$2y$10$uQYQtCfTErMBCsjKlIVJDeOIygU0vSg/vGErx5YdKFdFFsuAaUZFe', 'user@user.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1645064444, 1645153339, 1, 'User', 'User', 'RSUP', '123456789012');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(10, 1, 1),
(11, 1, 2),
(15, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_mst_departemen`
--
ALTER TABLE `tbl_mst_departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indeks untuk tabel `tbl_mst_kamar`
--
ALTER TABLE `tbl_mst_kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_mess` (`id_mess`);

--
-- Indeks untuk tabel `tbl_mst_karyawan`
--
ALTER TABLE `tbl_mst_karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_departemen` (`id_departemen`);

--
-- Indeks untuk tabel `tbl_mst_mess`
--
ALTER TABLE `tbl_mst_mess`
  ADD PRIMARY KEY (`id_mess`);

--
-- Indeks untuk tabel `tbl_trx_mess`
--
ALTER TABLE `tbl_trx_mess`
  ADD PRIMARY KEY (`id_trx_mess`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_mst_departemen`
--
ALTER TABLE `tbl_mst_departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_mst_kamar`
--
ALTER TABLE `tbl_mst_kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tbl_mst_karyawan`
--
ALTER TABLE `tbl_mst_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_mst_mess`
--
ALTER TABLE `tbl_mst_mess`
  MODIFY `id_mess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_trx_mess`
--
ALTER TABLE `tbl_trx_mess`
  MODIFY `id_trx_mess` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_mst_karyawan`
--
ALTER TABLE `tbl_mst_karyawan`
  ADD CONSTRAINT `tbl_mst_karyawan_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `tbl_mst_departemen` (`id_departemen`);

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
