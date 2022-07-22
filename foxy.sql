-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Temps de generació: 20-04-2022 a les 16:50:32
-- Versió del servidor: 10.5.10-MariaDB
-- Versió de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `afigest`
--

--
-- Estructura de la taula `afi_languages`
--

CREATE TABLE `afi_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 no;1 yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_languages`
--

INSERT INTO `afi_languages` (`id`, `title`, `code`, `status`) VALUES
(1, 'English', 'en-gb', 1),
(2, 'Spanish', 'es-es', 0),
(3, 'Catalan', 'ca-es', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_sessions`
--

CREATE TABLE `afi_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `userid` int(11) NOT NULL,
  `ssid` varchar(150) NOT NULL,
  `lastvisitDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_settings`
--

CREATE TABLE `afi_settings` (
  `id` int(1) NOT NULL,
  `site` varchar(50) NOT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `log` varchar(50) NOT NULL DEFAULT 'foxy',
  `sitename` varchar(50) NOT NULL DEFAULT 'Foxy',
  `description` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `debug` tinyint(1) NOT NULL DEFAULT 0,
  `token_time` int(4) NOT NULL DEFAULT 300,
  `template` varchar(50) NOT NULL DEFAULT 'mazer',
  `cookie` int(4) NOT NULL DEFAULT 300,
  `admin_mails` tinyint(1) NOT NULL DEFAULT 0,
  `inactive` int(5) NOT NULL DEFAULT 1000,
  `login_redirect` varchar(150) NOT NULL,
  `show_register` tinyint(1) NOT NULL DEFAULT 0,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `pagination` int(5) NOT NULL DEFAULT 20,
  `analytics` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_settings`
--

INSERT INTO `afi_settings` (`id`, `site`, `offline`, `log`, `sitename`, `description`, `email`, `debug`, `token_time`, `template`, `cookie`, `admin_mails`, `inactive`, `login_redirect`, `show_register`, `pagination`, `analytics`) VALUES
(1, '', 0, '', 'Foxy', 'foxy foxy', '', 0, 300, '', 300, 0, 1000, '', 0, 20, '');

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_usergroups`
--

CREATE TABLE `afi_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `usergroup` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_usergroups`
--

INSERT INTO `afi_usergroups` (`id`, `parent_id`, `usergroup`) VALUES
(1, 0, 'admin'),
(2, 1, 'registered'),
(3, 2, 'public');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afi_usergroups_map`
--

CREATE TABLE `afi_usergroups_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `usergroup_id` int(11) NOT NULL,
  `vista` varchar(50) DEFAULT NULL,
  `permisos` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `afi_usergroups_map`
--

INSERT INTO `afi_usergroups_map` (`id`, `usergroup_id`, `vista`, `permisos`) VALUES
(1, 1, 'home', '{\"access\":1,\"new\":1,\"edit\":1,\"delete\":1}'),
(2, 1, 'config', '{\"access\":1,\"new\":1,\"edit\":1,\"delete\":1}'),
(3, 1, 'users', '{\"access\":1,\"new\":1,\"edit\":1,\"delete\":1}'),
(4, 1, 'groups', '{\"access\":1,\"new\":1,\"edit\":1,\"delete\":1}');

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_users`
--

CREATE TABLE `afi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime NOT NULL DEFAULT current_timestamp(),
  `level` smallint(1) NOT NULL,
  `language` varchar(50) NOT NULL,
  `token` varchar(150) NOT NULL,
  `block` smallint(1) NOT NULL DEFAULT 1,
  `image` varchar(150) NOT NULL DEFAULT 'nouser.png',
  `cargo` varchar(150) NOT NULL DEFAULT '',
  `bio` text NOT NULL DEFAULT '',
  `address` varchar(150) NOT NULL DEFAULT '',
  `cp` varchar(50) NOT NULL DEFAULT '',
  `poblacio` varchar(100) NOT NULL DEFAULT '',
  `template` varchar(50) NOT NULL DEFAULT '',
  `apikey` varchar(150) NOT NULL DEFAULT '',
  `dashboard_pref` text NOT NULL DEFAULT '',
  `secret` varchar(150) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_users`
--

INSERT INTO `afi_users` (`id`, `username`, `password`, `email`, `registerDate`, `lastvisitDate`, `level`, `language`, `token`, `block`, `image`, `cargo`, `bio`, `address`, `cp`, `poblacio`, `template`, `apikey`, `dashboard_pref`, `secret`) VALUES
(98, 'kim', '$2y$10$/Le9QAgnC9BhLHs7UZb4V.WJn5fxwEOqgxzNu4faamvF3WA2CJf3O', 'kim@aficat.com', '2017-11-15 12:18:41', '2022-04-20 08:55:14', 1, 'ca-es', '67cfe79d9cb197d96286', 0, 'nouser.png', 'Web Developer', '', 'Carrer verdaguer 68 Bis', '8550', 'Balenyà', 'green', '05982d8c-93d7-4f83-9083-c51f6a46beff', '', ''),
(101, 'carles', '$2y$10$zYaeOd6j3pyKM/Ktl1QoheVIZA1Og7Ux38VG7AvuafXqHIsQIVVfC', 'carles@afi.cat', '2018-01-10 07:13:24', '2022-04-19 12:03:09', 1, 'ca-es', '5a55af04160d7', 0, 'nouser.png', 'CEO', '', '', '', '', 'blue', '6d25e421-1693-4c1d-9719-667c274d354e', '' '');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
