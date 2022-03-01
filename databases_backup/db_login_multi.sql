-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Feb 2022 pada 03.38
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
-- Database: `db_login_multi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `gambar`, `password`, `role_id`, `is_active`, `created_date`) VALUES
(1, 'Maulana Sarowis', 'maulanasarowis@gmail.com', 'default.jpg', '$2y$10$Xt.IyXNOkoxRhH1K2vRJkOrFttaB.MNKJLjmQQCEtdSvw7qB25i8.', 2, 1, 1645753424),
(2, 'Admin', 'admin@admin.com', 'default.jpg', '$2y$10$3qo8kRP0ruQwFxqbj/Ztd.qm3i0bNLSx/HEnB6k904Ua5/Sw4Px1m', 1, 1, 1645780472);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_access_menu`
--

CREATE TABLE `users_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_menu`
--

CREATE TABLE `users_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_menu`
--

INSERT INTO `users_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_role`
--

CREATE TABLE `users_role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_sub_menu`
--

CREATE TABLE `users_sub_menu` (
  `id` int(11) NOT NULL,
  `id_menu` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users_sub_menu`
--

INSERT INTO `users_sub_menu` (`id`, `id_menu`, `title`, `url`, `icon`, `is_active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '1', 'dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1, '2022-02-25 09:58:08', 'admin', '2022-02-25 09:58:08', ''),
(2, '2', 'My Profile', 'user', 'fas fa-fw fa-user', 1, '2022-02-25 10:01:47', 'admin', '2022-02-25 10:01:47', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_access_menu`
--
ALTER TABLE `users_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_menu`
--
ALTER TABLE `users_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_sub_menu`
--
ALTER TABLE `users_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users_access_menu`
--
ALTER TABLE `users_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users_menu`
--
ALTER TABLE `users_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users_role`
--
ALTER TABLE `users_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users_sub_menu`
--
ALTER TABLE `users_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
