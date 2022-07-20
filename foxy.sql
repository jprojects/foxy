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

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_config`
--

CREATE TABLE `afi_config` (
  `id` int(1) NOT NULL,
  `site` varchar(50) NOT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `log` varchar(50) NOT NULL,
  `sitename` varchar(50) NOT NULL DEFAULT 'Foxy',
  `description` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `debug` tinyint(1) NOT NULL DEFAULT 0,
  `token_time` int(4) NOT NULL DEFAULT 300,
  `template` varchar(50) NOT NULL,
  `cookie` int(4) NOT NULL DEFAULT 300,
  `admin_mails` tinyint(1) NOT NULL DEFAULT 0,
  `inactive` int(5) NOT NULL DEFAULT 1000,
  `login_redirect` varchar(150) NOT NULL,
  `show_register` tinyint(1) NOT NULL DEFAULT 0,
  `show_coins` tinyint(1) NOT NULL DEFAULT 0,
  `show_quotes` tinyint(1) NOT NULL DEFAULT 0,
  `pagination` int(5) NOT NULL DEFAULT 20
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_config`
--

INSERT INTO `afi_config` (`id`, `site`, `offline`, `log`, `sitename`, `description`, `email`, `debug`, `token_time`, `template`, `cookie`, `admin_mails`, `inactive`, `login_redirect`, `show_register`, `show_coins`, `show_quotes`, `pagination`) VALUES
(1, '', 0, '', 'Foxy', 'foxy foxy', '', 0, 300, '', 300, 0, 1000, '', 0, 1, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_languages`
--

CREATE TABLE `afi_languages` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
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
-- Estructura de la taula `afi_menu`
--

CREATE TABLE `afi_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `translation` varchar(150) NOT NULL,
  `url` varchar(150) NOT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 no login;1login',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 Link;1 modal',
  `module` varchar(150) NOT NULL,
  `template` varchar(50) NOT NULL,
  `inMenu` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_menu`
--

INSERT INTO `afi_menu` (`id`, `title`, `translation`, `url`, `auth`, `type`, `module`, `template`, `inMenu`, `ordering`) VALUES
(1, 'Home', '', 'index.php?view=home', 0, 0, '', '', 1, 0),
(2, 'About', '', 'index.php?view=about', 0, 0, '', '', 1, 0),
(3, 'Login', '', 'index.php?view=register&layout=login', 1, 1, 'login', '', 1, 0),
(4, 'Logout', '', 'index.php?task=register.logout', 2, 0, '', '', 1, 0),
(5, 'Blog', '', 'index.php?view=blog', 0, 0, '', '', 1, 0),
(6, 'Contact', '', 'index.php?view=contact', 0, 0, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_sessions`
--

CREATE TABLE `afi_sessions` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ssid` varchar(150) NOT NULL,
  `lastvisitDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_sessions`
--

INSERT INTO `afi_sessions` (`id`, `userid`, `ssid`, `lastvisitDate`) VALUES
(1671, 103, 'n6psr21s6hkugpi8gl4o6np3dj', '2020-10-31 11:19:45'),
(1673, 103, 'rfe26m7f87ipoifv53ma2ico7j', '2020-11-02 13:03:15'),
(1722, 104, 's27kvj27cge432svh4qlpie30r', '2020-12-09 21:37:20'),
(1730, 104, 'q4odptth90uclja00c99pu3g12', '2020-12-10 13:34:47'),
(1732, 104, 'q4odptth90uclja00c99pu3g12', '2020-12-10 15:39:06'),
(1737, 104, 'k918mgqjl2gca30isuc8odsseu', '2020-12-11 13:02:50'),
(1738, 104, 'k918mgqjl2gca30isuc8odsseu', '2020-12-11 14:23:42'),
(1739, 104, 'k918mgqjl2gca30isuc8odsseu', '2020-12-11 15:54:59'),
(1744, 104, 'pgftqs72vm28guo6md6t9vkru6', '2020-12-13 18:42:01'),
(1753, 104, 'r48rahfgv9uk268lcofe8sklp6', '2020-12-14 17:23:58'),
(1756, 104, 'ug4hgs5gtgqr9ras065qslkghn', '2020-12-15 16:40:24'),
(1757, 103, 'qsqi37dg408od41ks46u946h7g', '2020-12-16 17:22:47'),
(1762, 104, 'pm9rcolba5vu3l807r6m884v39', '2020-12-17 17:17:27'),
(1775, 104, 'eobdjld4ou6hrruddtlrblqm5o', '2020-12-28 20:16:42'),
(1776, 104, 'vrkms7p8bdmh470f5cr5tfui6a', '2020-12-30 17:28:32'),
(1779, 104, 'lso8gt00hal5pr5t7hdn43nttv', '2021-01-07 10:50:53'),
(1780, 104, 'lso8gt00hal5pr5t7hdn43nttv', '2021-01-07 13:35:44'),
(1784, 104, 'nos6kff1v2v0rdvt094ctknb3d', '2021-01-08 11:17:58'),
(1785, 104, 'nos6kff1v2v0rdvt094ctknb3d', '2021-01-08 12:51:27'),
(1786, 104, 'nos6kff1v2v0rdvt094ctknb3d', '2021-01-08 16:29:12'),
(1787, 104, '67psv7jsjm1f81mpi2t3lrtaem', '2021-01-08 17:19:00'),
(1791, 104, 'ndfng6kjolm0tqlpql5fqcju5i', '2021-01-11 16:04:28'),
(1802, 104, 'fuf1635ctq49gs86uec2s3dhi3', '2021-01-12 15:52:57'),
(1806, 104, 'nd19mg1s578sfo1l31vgth5537', '2021-01-13 13:52:40'),
(1807, 104, 'nd19mg1s578sfo1l31vgth5537', '2021-01-13 16:03:12'),
(1809, 104, 'lufk2u78rsi3d9aeq062ipjqg1', '2021-01-14 16:43:43'),
(1814, 104, '58io5ncanm9urivknd4f3f3b32', '2021-01-15 15:22:17'),
(1818, 104, 'r4fl47a1kcb4nme4iigicbijkm', '2021-01-18 16:37:59'),
(1822, 104, 'cnf5uaaa33vc3frnah13oas4li', '2021-01-19 11:00:18'),
(1823, 104, 'cnf5uaaa33vc3frnah13oas4li', '2021-01-19 12:23:24'),
(1833, 104, 'n0u9h5dcednc4usiu94j19itce', '2021-01-22 15:40:47'),
(1834, 104, 'hlt06em5prjkktq4o6mvh0nidp', '2021-01-25 11:04:39'),
(1836, 104, 'hlt06em5prjkktq4o6mvh0nidp', '2021-01-25 12:38:06'),
(1842, 104, 'r1erkdg961qn1grogkenhnu5fp', '2021-01-26 13:09:11'),
(1867, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-03 15:07:09'),
(1868, 104, 'qr8nqqqe22lf8as4iblvupv5mc', '2021-02-04 11:55:48'),
(1871, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-05 12:17:17'),
(1872, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-05 16:29:34'),
(1883, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-10 14:27:23'),
(1890, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-12 14:24:34'),
(1896, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-15 13:24:28'),
(1909, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-19 10:12:13'),
(1919, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-02-23 12:40:04'),
(1929, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-01 13:49:41'),
(1930, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-01 15:43:13'),
(1932, 105, 'rr57o16ih2f9239rkb2behboi1', '2021-03-01 18:56:03'),
(1961, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-10 12:21:49'),
(1973, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-12 10:23:23'),
(1980, 104, 'r02g630mtfcgfukn4iv2gls9ll', '2021-03-15 09:07:24'),
(1981, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-15 10:09:17'),
(1984, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-03-15 16:10:00'),
(2040, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-12 12:24:07'),
(2060, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-21 13:27:29'),
(2072, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-26 11:19:31'),
(2077, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-27 10:53:38'),
(2078, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-27 13:27:36'),
(2084, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-28 12:08:53'),
(2090, 104, '7rt12ums5gkfh9p3348ilonk9b', '2021-04-29 10:25:33'),
(2283, 110, '75mjtfioic7mm4krrs4oao153e', '2021-07-21 18:44:07'),
(2293, 102, '75mjtfioic7mm4krrs4oao153e', '2021-07-26 15:19:16'),
(2295, 102, '80ba6dd6vu56ddq41uh75rf74d', '2021-07-27 09:28:48'),
(2297, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-07-27 19:39:45'),
(2315, 102, '80ba6dd6vu56ddq41uh75rf74d', '2021-08-03 12:48:29'),
(2319, 102, '80ba6dd6vu56ddq41uh75rf74d', '2021-08-05 10:24:37'),
(2328, 104, 'tjvhjl8o34fd9pp7iigi362cub', '2021-08-11 11:26:38'),
(2335, 110, 'li724qhgr05kpb0mlrd3aqhd6h', '2021-08-22 22:34:42'),
(2336, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-08-23 08:41:42'),
(2342, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-08-25 19:14:05'),
(2346, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-01 15:35:53'),
(2347, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-01 17:28:26'),
(2351, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-02 11:47:40'),
(2354, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-03 17:39:35'),
(2356, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-06 17:39:48'),
(2364, 102, 'n0o3lj6td5b0s69sr9rk2kjci2', '2021-09-13 17:28:33'),
(2369, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-15 15:08:23'),
(2373, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-15 19:26:32'),
(2374, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-16 09:35:57'),
(2376, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-16 15:47:15'),
(2378, 102, '3fo59s9htuobhou2tschstupp5', '2021-09-16 17:45:22'),
(2380, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-16 18:23:30'),
(2381, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-16 21:02:48'),
(2384, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-17 12:14:30'),
(2385, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-17 17:59:33'),
(2386, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-17 20:50:12'),
(2387, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-17 23:56:27'),
(2388, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-18 14:03:04'),
(2389, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-18 17:07:58'),
(2391, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-09-20 12:41:00'),
(2393, 102, 't98v7rj7qa71520g13tnugvf3h', '2021-09-21 10:31:14'),
(2395, 102, 't98v7rj7qa71520g13tnugvf3h', '2021-09-21 11:35:00'),
(2396, 102, 't98v7rj7qa71520g13tnugvf3h', '2021-09-21 12:09:11'),
(2400, 102, 'ocsnj3uchoqi3ou6q79nfd8nk4', '2021-09-28 12:47:23'),
(2401, 102, 'ac55iiop7jq14h73kpcofcu29t', '2021-09-29 11:24:39'),
(2404, 102, 'ac55iiop7jq14h73kpcofcu29t', '2021-09-29 18:42:11'),
(2406, 102, '4lmmae4u8qbn5vmrdb2o69k0n0', '2021-09-30 19:31:05'),
(2410, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-10-02 18:12:44'),
(2418, 102, 'jksloeltp0vqhil15e829fjjht', '2021-10-05 09:53:14'),
(2428, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-10-07 21:28:39'),
(2437, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-10-15 14:15:58'),
(2441, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-10-21 09:10:56'),
(2453, 110, '0r37kcjn9qdtb05c69bun8oghj', '2021-11-02 12:39:26'),
(2479, 101, 'h73p2kc130105jf5a254b8hp65', '2021-11-30 12:15:11'),
(2480, 101, 'fphj35tvp928hvg0s3fr87gjri', '2021-11-30 15:08:26'),
(2482, 101, 'f36man694sj7f7qbd31cpo0m6r', '2021-12-02 06:28:43'),
(2483, 101, '1bbk4ep2cubaigv5enqugfurdm', '2021-12-02 08:35:06'),
(2485, 101, 'bvkkrn3amnrjauvjsefuonk4b9', '2021-12-06 20:52:12'),
(2486, 101, 'ej71k7af3dku01u8dhccnfr1ih', '2021-12-07 08:09:41'),
(2487, 101, 'ej71k7af3dku01u8dhccnfr1ih', '2021-12-07 09:59:48'),
(2488, 101, 'ej71k7af3dku01u8dhccnfr1ih', '2021-12-07 11:45:12'),
(2490, 101, 'i18f0trvajas0cnfakanjchk14', '2021-12-09 10:18:17'),
(2494, 101, '5f06ek7ifae2u7di2nbkllvv6q', '2021-12-24 09:49:43'),
(2496, 101, '4eqgiiosmq2g1kltqnm9pbuq0c', '2021-12-27 10:16:38'),
(2498, 101, '4eqgiiosmq2g1kltqnm9pbuq0c', '2021-12-28 15:36:51'),
(2500, 101, 'pqogo8qq445j53s4es714ashbu', '2021-12-29 10:11:27'),
(2502, 101, 'e3cc9h596cg6j2ht5qifc5biv5', '2021-12-31 07:13:19'),
(2503, 101, 'ghbi9n54021fsqj0a5oj3qf2mu', '2021-12-31 17:39:37'),
(2504, 101, '6the7a78ichmgc7bbjsved36dc', '2022-01-08 11:25:36'),
(2506, 101, 'lvg8rqqkteithcbsvqt427606i', '2022-01-10 09:36:12'),
(2508, 101, 'lvg8rqqkteithcbsvqt427606i', '2022-01-10 10:20:31'),
(2510, 101, '3vhdsnf6j2a02nv5jfq2j6no3k', '2022-01-10 13:12:00'),
(2511, 101, 'aabr2c3blfacdh90iauc0a129k', '2022-01-13 08:06:57'),
(2514, 101, 'kfnvu79vhgl1314tdvaitk8p8a', '2022-01-15 11:30:41'),
(2516, 101, 'lbubirhlr40f9abgalk0a0uhck', '2022-01-17 18:11:08'),
(2518, 101, 'lbubirhlr40f9abgalk0a0uhck', '2022-01-18 10:19:20'),
(2519, 101, 'lbubirhlr40f9abgalk0a0uhck', '2022-01-18 10:19:22'),
(2521, 104, 'leqie9qugqmeshantrtnf0ovsm', '2022-01-20 10:56:49'),
(2522, 101, '9slq93nlql1rkqtvdopntgm2pt', '2022-01-21 07:17:59'),
(2523, 98, 'hk445m8immvr4rsr30sne0hu8k', '2022-01-21 08:39:21'),
(2524, 101, '9slq93nlql1rkqtvdopntgm2pt', '2022-01-21 09:07:49'),
(2525, 98, 'hk445m8immvr4rsr30sne0hu8k', '2022-01-21 10:25:45'),
(2526, 101, 'i1h3qu6sdleg2rnt62mgdvt3ru', '2022-01-21 10:47:54'),
(2527, 101, 'i1h3qu6sdleg2rnt62mgdvt3ru', '2022-01-21 11:17:48'),
(2528, 98, 'qv93gsjc3oo9idl994cuk5fjeo', '2022-01-24 08:48:19'),
(2529, 98, 'qv93gsjc3oo9idl994cuk5fjeo', '2022-01-24 10:29:04'),
(2530, 101, 'c4tblin8fn6plcp4ml30pumq23', '2022-01-24 10:44:16'),
(2531, 104, 'q0cfeja94m66vt2lk6bh1softj', '2022-01-24 16:40:13'),
(2532, 104, '2hq18qgcjj597014j0ujpcd07q', '2022-01-25 12:40:00'),
(2533, 98, 'c9pl00b0t86ciii29661a80al5', '2022-01-26 09:57:18'),
(2534, 101, 'decqa3d14snk70k5krtha8r2t4', '2022-01-26 09:58:47'),
(2535, 101, 'lu7pt8pq73ltrdc29hkek3h67k', '2022-01-26 17:51:46'),
(2536, 98, 'ldrt56smhvecq6a8s6repv4et4', '2022-01-27 12:33:44'),
(2537, 101, 'u40cana8671nbd2ni80kfbtt3o', '2022-01-27 12:39:34'),
(2538, 110, '0r37kcjn9qdtb05c69bun8oghj', '2022-01-27 13:08:41'),
(2539, 98, '3gvtiua118ebavm3orr1pj9urt', '2022-01-28 09:20:17'),
(2540, 101, '6m4nvte2tpcfvnvunpoelafli1', '2022-01-29 08:32:56'),
(2541, 98, '669j78uha4nqi13t2l3jh8bl9g', '2022-02-01 10:15:26'),
(2542, 110, 'srenefbb3itjtmlqiopbn45qv3', '2022-02-01 10:31:42'),
(2543, 101, 'g0o4aq9bk8j8pnc6p8bv9acokr', '2022-02-01 12:37:41'),
(2544, 110, '0r37kcjn9qdtb05c69bun8oghj', '2022-02-02 15:52:38'),
(2545, 98, '172fsiml1t70d69vmuafedebl6', '2022-02-07 09:55:43'),
(2546, 101, 't7ni06ej7re352t1u5sce5fltq', '2022-02-07 16:59:03'),
(2547, 98, '8so7qbrb2hoeh9uuscsmjfv68i', '2022-02-07 18:43:57'),
(2548, 101, 't7ni06ej7re352t1u5sce5fltq', '2022-02-07 18:45:53'),
(2549, 98, 'mb88vk46ad7n2ll7inck0m2cak', '2022-02-08 08:41:38'),
(2550, 110, '0r37kcjn9qdtb05c69bun8oghj', '2022-02-08 10:50:06'),
(2551, 110, '0r37kcjn9qdtb05c69bun8oghj', '2022-02-08 11:23:37'),
(2552, 101, '24ngdg9134u345iavultma2kgl', '2022-02-09 10:06:16'),
(2553, 98, 'dk67cg6uij935o3mmkgt38d5qu', '2022-02-09 11:04:47'),
(2554, 101, '24ngdg9134u345iavultma2kgl', '2022-02-09 11:19:03'),
(2555, 98, 'vgdejv5g0il5lb64o08v6rggvv', '2022-02-10 10:07:12'),
(2556, 101, 'imjd59l26k1ncmur3ef6rphqtn', '2022-02-10 20:44:26'),
(2557, 98, 'mt828f9et8a7l8mij33hr021k8', '2022-02-11 08:48:22'),
(2558, 98, 'rqhmij5fku5dsuerts2433ituj', '2022-02-14 09:29:38'),
(2559, 101, 'jclrujvcqmvl5bqclt55qntjup', '2022-02-14 09:34:22'),
(2560, 98, 'rqhmij5fku5dsuerts2433ituj', '2022-02-14 10:12:13'),
(2561, 101, 'tgtn14n4gdtu7dpqmh9qb05omf', '2022-02-14 19:37:25'),
(2562, 98, 'q86nl4t8gb250omq7i4jftjpm3', '2022-02-15 09:07:25'),
(2563, 101, '00dju2rq38q5gf1ioednhodp2r', '2022-02-15 10:41:53'),
(2564, 98, 'q86nl4t8gb250omq7i4jftjpm3', '2022-02-15 10:49:06'),
(2565, 110, '0r37kcjn9qdtb05c69bun8oghj', '2022-02-15 13:13:00'),
(2566, 98, 'b5etcp616ila4vuedi35ob3p1b', '2022-02-16 08:54:41'),
(2567, 101, 'slram2u49lnauioq0tsem653v0', '2022-02-16 09:58:03'),
(2568, 101, '7r06ucgg210mud04e2dcegpo04', '2022-02-17 07:53:56'),
(2569, 98, '2p42rp3dqth9nblhjsapto7vm8', '2022-02-17 17:25:44'),
(2570, 98, 'b95b681tjkgdsfhg1e15k8emp6', '2022-02-18 08:40:53'),
(2571, 98, 'b95b681tjkgdsfhg1e15k8emp6', '2022-02-18 11:30:40'),
(2572, 101, 's4qgb4jkuqj4tt14vpue8rbki7', '2022-02-20 17:10:53'),
(2573, 98, 'msh7nvi7lrfp2iv8mm1tur3ifb', '2022-02-21 08:59:53'),
(2574, 101, 'pe2ijgus8nn1372p4pgfe5t96n', '2022-02-21 09:20:32'),
(2575, 101, 'd2uuosbeomn50218pk9719upvv', '2022-02-21 16:13:06'),
(2576, 98, 'c7n7i8lneaj415m1ahbbmv8ear', '2022-02-22 08:56:04'),
(2577, 101, '6u9236ear3b2ol4vg1kto8kme3', '2022-02-22 10:50:22'),
(2578, 98, 'd6d56fevjjcgvim3ke56g3bs2m', '2022-02-23 09:15:02'),
(2579, 98, 'ahc42bt2bo7pbm5maatbjrnks8', '2022-02-24 10:33:48'),
(2580, 101, 'kfihob1m2tvsjs13dvsq09p02u', '2022-02-27 20:31:16'),
(2581, 101, 'kfihob1m2tvsjs13dvsq09p02u', '2022-02-28 05:29:50'),
(2582, 98, '4mdvtbrphl2tmvnqc2mvolrmff', '2022-02-28 09:06:48'),
(2583, 98, '4mdvtbrphl2tmvnqc2mvolrmff', '2022-02-28 10:53:57'),
(2584, 98, '6pr6d68vn42912mouedel5h6i1', '2022-03-01 08:57:37'),
(2585, 98, 'dn4ol8lkd7lhmh8q1trockrp1e', '2022-03-01 11:58:52'),
(2586, 102, 'jsk34079a3sg0l2300r6uj7gup', '2022-03-01 12:03:49'),
(2587, 101, 'nfis7igvqdu52e4pl96l5bbttg', '2022-03-01 12:34:33'),
(2588, 101, 'nfis7igvqdu52e4pl96l5bbttg', '2022-03-01 12:34:33'),
(2589, 101, '2rdepaumo14hl82h1thtejt92b', '2022-03-02 15:50:02'),
(2590, 98, 'jo6q2n71umshsdhmvb4e1s3fcq', '2022-03-02 16:52:57'),
(2591, 102, '7jueaoslbsuoekn1ukkd360mad', '2022-03-02 18:54:50'),
(2592, 102, '7jueaoslbsuoekn1ukkd360mad', '2022-03-02 20:18:50'),
(2593, 102, '2hqs4bn6a82dmhpaduidqvqnkf', '2022-03-03 00:44:46'),
(2594, 101, 'qfd3dunpm9ci9b2l543dm1utrt', '2022-03-03 06:34:08'),
(2595, 101, 'te2ltdmtv381h9er853be9rife', '2022-03-03 07:06:06'),
(2596, 102, '2hqs4bn6a82dmhpaduidqvqnkf', '2022-03-03 21:20:56'),
(2597, 102, '2hqs4bn6a82dmhpaduidqvqnkf', '2022-03-04 19:43:44'),
(2598, 102, '2hqs4bn6a82dmhpaduidqvqnkf', '2022-03-04 21:10:20'),
(2599, 101, 'rl85dt8cjiu8vcqikav45cggnk', '2022-03-05 12:27:47'),
(2600, 98, 'c2ciaa9unnt3chme1rs7tlp28m', '2022-03-08 09:29:35'),
(2601, 101, 'd08451rgbhh0kkdep71p69cumm', '2022-03-09 06:25:59'),
(2602, 98, 'ohe3fdcmqkj5mps5jfqpcqtvsk', '2022-03-09 08:48:44'),
(2603, 101, 'd08451rgbhh0kkdep71p69cumm', '2022-03-09 08:54:05'),
(2604, 102, 'boeo41ndft50pp8lqtr3rasv9g', '2022-03-09 12:55:36'),
(2605, 101, 'f9po7l8tp3sg7aq13k7vfl4kog', '2022-03-09 16:48:53'),
(2606, 98, '86hfnfvkb3nianlldamgsjanjd', '2022-03-09 17:00:17'),
(2607, 102, '9i2iaugvs1ch4ep83fjpbc2nqv', '2022-03-10 16:04:47'),
(2608, 102, 'ms8o2tah9skpsuvsvurclt0rhu', '2022-03-11 16:08:29'),
(2609, 101, 'lrkbl17e2bjauvtchl0gs6aiuh', '2022-03-11 16:30:47'),
(2610, 102, 'ms8o2tah9skpsuvsvurclt0rhu', '2022-03-11 17:49:55'),
(2611, 101, '20iveh73sr4ru7inc1eg5sh2n5', '2022-03-14 08:34:00'),
(2612, 98, '3mbcvg9grc97sn33ld22rijm3f', '2022-03-14 08:49:13'),
(2613, 101, 'mn988fhc5i0s7d42vduo1ihi3q', '2022-03-14 10:39:17'),
(2614, 102, 'ms8o2tah9skpsuvsvurclt0rhu', '2022-03-14 17:44:34'),
(2615, 102, 'l3ompirgs6aqtti33iepedd4o7', '2022-03-14 20:03:10'),
(2616, 101, '6ejgvp1s6vd3q6nbpv6aduv9fk', '2022-03-14 20:07:07'),
(2617, 98, '3crmpmkggn81dnu6lejh6vkhrn', '2022-03-15 09:52:48'),
(2618, 101, '0mp55427tpd00e2k8g13khujk2', '2022-03-16 07:06:21'),
(2619, 101, 'ktas4sfkl3q3i5dgspfvhlj0ao', '2022-03-21 06:21:43'),
(2620, 102, '1gtmo5mrf3if4rded9psk7g22v', '2022-03-21 16:51:18'),
(2621, 98, 'sjm8ngeoohdpsi18hd3hlmia68', '2022-03-22 09:41:56'),
(2622, 98, 'sjm8ngeoohdpsi18hd3hlmia68', '2022-03-22 11:45:53'),
(2623, 101, 'g101tfn394nioltsvrf1rcnk0g', '2022-03-22 12:47:06'),
(2624, 98, '2aubhtutjf72ggu653oqkpv2eo', '2022-03-23 08:55:56'),
(2625, 98, '2aubhtutjf72ggu653oqkpv2eo', '2022-03-23 10:48:29'),
(2626, 101, 'qaaj8ktmfdmboia45mbka30j5j', '2022-03-23 15:29:56'),
(2627, 98, '0iv2st7vjscd28ol16ok82aif0', '2022-03-23 15:35:11'),
(2628, 102, '8colcsmm56jmd2fo4k08dp8cu4', '2022-03-24 17:55:29'),
(2629, 101, '1u39scalofo4j9gle0ih06b0sv', '2022-03-25 08:27:07'),
(2630, 98, 'n7jk8uoijlkkv52qg4cnsojfnn', '2022-03-25 10:19:12'),
(2631, 98, 'n7jk8uoijlkkv52qg4cnsojfnn', '2022-03-25 11:10:02'),
(2632, 101, 'a3t3mcejlbv6pj9i9dn0vui1kr', '2022-03-28 06:55:27'),
(2633, 98, 'si00mdugi18hfct0hgkdprvsfv', '2022-03-28 10:30:17'),
(2634, 102, '8colcsmm56jmd2fo4k08dp8cu4', '2022-03-28 19:19:50'),
(2635, 101, 'as2pmlvmob4k87q9lm42ijg2r4', '2022-03-31 08:51:21'),
(2636, 101, 'q5lnaifubele98hpskk7v3egna', '2022-04-04 05:32:23'),
(2637, 102, 'a4svq9b69vedvnckbmsm7a6r84', '2022-04-07 16:20:55'),
(2638, 101, 'd455j4emm9v799luj76c9l2rck', '2022-04-08 08:26:43'),
(2639, 98, '384lspdapu4c0008anodv3lbka', '2022-04-08 10:21:34'),
(2640, 98, '384lspdapu4c0008anodv3lbka', '2022-04-08 12:43:11'),
(2641, 101, '5vo765198en5lcb11jg7ainmr9', '2022-04-08 18:45:10'),
(2642, 101, 'sq14qvsqud0i9dul64llfiinn8', '2022-04-09 12:45:47'),
(2643, 101, 'nj3bp4r9jbmhe20ao76ns2764l', '2022-04-09 13:22:19'),
(2644, 101, '7t2iest217o32lvnlb2nt23kja', '2022-04-10 10:56:02'),
(2645, 98, 'e2h633v130ibv7ee7to43dhcei', '2022-04-11 09:36:28'),
(2646, 101, 'ql6lr73cad9ikd28c86vo330ml', '2022-04-11 17:55:51'),
(2647, 98, 'ca3cpilud4rmdo8q12f1sb72c5', '2022-04-12 08:48:01'),
(2648, 101, 'q5ikiin20i54mk9kj4g4ieleif', '2022-04-12 10:29:09'),
(2649, 102, 'ovdf7ma5g82tru50tofmkddlrs', '2022-04-12 11:21:38'),
(2650, 101, '2cb18fafeekf5nder9skubkgt2', '2022-04-12 11:55:50'),
(2651, 98, '27s2l5am3ujrqf8djmfb1qm43s', '2022-04-13 09:53:52'),
(2652, 101, 'b81go66e2ouv77ocbcudm406us', '2022-04-14 07:01:23'),
(2653, 98, '7vlmkfdicp2kon01govjo7jof3', '2022-04-19 08:38:02'),
(2654, 101, 'vc9fenmovm2j89qcbk7otmb3hi', '2022-04-19 12:03:11'),
(2655, 98, '7vlmkfdicp2kon01govjo7jof3', '2022-04-19 12:14:46'),
(2656, 102, 'av6s0u0f90965kdh0tmh9fdmmc', '2022-04-19 15:40:26'),
(2657, 98, 'ct0a8s2s78mkv8pcvhpe9gcjpc', '2022-04-20 08:55:21');

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_settings`
--

CREATE TABLE `afi_settings` (
  `id` int(1) NOT NULL,
  `site` varchar(50) NOT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `log` varchar(50) NOT NULL,
  `sitename` varchar(50) NOT NULL DEFAULT 'Foxy',
  `description` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `debug` tinyint(1) NOT NULL DEFAULT 0,
  `token_time` int(4) NOT NULL DEFAULT 300,
  `template` varchar(50) NOT NULL,
  `cookie` int(4) NOT NULL DEFAULT 300,
  `admin_mails` tinyint(1) NOT NULL DEFAULT 0,
  `inactive` int(5) NOT NULL DEFAULT 1000,
  `login_redirect` varchar(150) NOT NULL,
  `show_register` tinyint(1) NOT NULL DEFAULT 0,
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
-- Estructura de la taula `afi_tipus_incidencia`
--

CREATE TABLE `afi_tipus_incidencia` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `bg_color` varchar(50) NOT NULL,
  `txt_color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_tipus_incidencia`
--

INSERT INTO `afi_tipus_incidencia` (`id`, `nom`, `bg_color`, `txt_color`) VALUES
(1, 'Nova funció', '#ffc107', '#ffffff'),
(2, 'Error', '#dc3545', '#ffffff'),
(3, 'Millora', '#343a40', '#ffffff');

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_usergroups`
--

CREATE TABLE `afi_usergroups` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `usergroup` varchar(50) NOT NULL,
  `nou` tinyint(1) NOT NULL DEFAULT 0,
  `editar` tinyint(1) NOT NULL DEFAULT 0,
  `esborrar` tinyint(1) NOT NULL DEFAULT 0,
  `views` varchar(250) NOT NULL DEFAULT '*'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_usergroups`
--

INSERT INTO `afi_usergroups` (`id`, `parent_id`, `usergroup`, `nou`, `editar`, `esborrar`, `views`) VALUES
(1, 0, 'admin', 1, 1, 1, '*'),
(2, 1, 'registered', 1, 1, 0, 'about,api,coins,log,dashboard,home,edit,issues,profile,edit,projects,login,register,reset'),
(3, 2, 'public', 0, 0, 0, 'about,api,coins,log,home,login,register,reset');

-- --------------------------------------------------------

--
-- Estructura de la taula `afi_users`
--

CREATE TABLE `afi_users` (
  `id` int(11) NOT NULL,
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
  `projects` varchar(250) NOT NULL DEFAULT '',
  `coins` int(11) NOT NULL DEFAULT 0,
  `wallet` varchar(150) NOT NULL DEFAULT '',
  `dashboard_pref` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `afi_users`
--

INSERT INTO `afi_users` (`id`, `username`, `password`, `email`, `registerDate`, `lastvisitDate`, `level`, `language`, `token`, `block`, `image`, `cargo`, `bio`, `address`, `cp`, `poblacio`, `template`, `apikey`, `projects`, `coins`, `wallet`, `dashboard_pref`) VALUES
(98, 'kim', '$2y$10$/Le9QAgnC9BhLHs7UZb4V.WJn5fxwEOqgxzNu4faamvF3WA2CJf3O', 'kim@aficat.com', '2017-11-15 12:18:41', '2022-04-20 08:55:14', 1, 'ca-es', '67cfe79d9cb197d96286', 0, 'nouser.png', 'Web Developer', '', 'Carrer verdaguer 68 Bis', '8550', 'Balenyà', 'green', '05982d8c-93d7-4f83-9083-c51f6a46beff', '*', 1390, '', ''),
(101, 'carles', '$2y$10$zYaeOd6j3pyKM/Ktl1QoheVIZA1Og7Ux38VG7AvuafXqHIsQIVVfC', 'carles@afi.cat', '2018-01-10 07:13:24', '2022-04-19 12:03:09', 1, 'ca-es', '5a55af04160d7', 0, 'nouser.png', 'CEO', '', '', '', '', 'blue', '6d25e421-1693-4c1d-9719-667c274d354e', '*', 1875, '', ''),
(102, 'sergi', '$2y$10$/Le9QAgnC9BhLHs7UZb4V.WJn5fxwEOqgxzNu4faamvF3WA2CJf3O', 'sergi@aficat.com', '2019-04-11 09:57:28', '2022-04-19 15:40:14', 1, 'ca-es', '7365726769406166696361742e636f6d', 0, 'nouser.png', 'Web Developer', '', '', '', '', 'green', '', '*', 15, '', ''),
(103, 'marc', '$2y$10$9eArptDGKl.JvVfwA81h9OJDD/WH69pl.5Sx918c27u026GneZDfK', 'marc@2click.online', '2020-10-30 00:00:00', '2020-12-16 17:22:15', 2, 'ca-es', '', 0, 'nouser.png', '', '', '', '', '', 'green', '', '57', 0, '', ''),
(104, 'Topategia', '$2y$10$/Le9QAgnC9BhLHs7UZb4V.WJn5fxwEOqgxzNu4faamvF3WA2CJf3O', 'topategia@centrohuarte.es', '2020-12-02 00:00:00', '2022-01-25 12:39:33', 2, 'ca-es', '', 0, 'nouser.png', '', '', '', '', '', 'green', '', '68', 165, '', ''),
(110, 'cami', '$2y$10$oua3HPmF/yzSmsASjlQoludOLdd03IuBk9HTguD9SqcwBOzar6tzi', 's_camelia@yahoo.com', '2021-07-02 18:02:02', '2022-02-15 13:12:39', 2, 'en-gb', '735f63616d656c6961407961686f6f2e636f6d', 0, 'nouser.png', '', '', '', '', '', 'green', '', '75', 140, '', '');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `afi_config`
--
ALTER TABLE `afi_config`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_languages`
--
ALTER TABLE `afi_languages`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_menu`
--
ALTER TABLE `afi_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_sessions`
--
ALTER TABLE `afi_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_settings`
--
ALTER TABLE `afi_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_tipus_incidencia`
--
ALTER TABLE `afi_tipus_incidencia`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_usergroups`
--
ALTER TABLE `afi_usergroups`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `afi_users`
--
ALTER TABLE `afi_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `afi_languages`
--
ALTER TABLE `afi_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `afi_menu`
--
ALTER TABLE `afi_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la taula `afi_sessions`
--
ALTER TABLE `afi_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2658;

--
-- AUTO_INCREMENT per la taula `afi_tipus_incidencia`
--
ALTER TABLE `afi_tipus_incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `afi_usergroups`
--
ALTER TABLE `afi_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `afi_users`
--
ALTER TABLE `afi_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
