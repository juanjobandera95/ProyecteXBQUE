-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-02-2020 a las 11:44:13
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `link_manager`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `link`
--

INSERT INTO `link` (`id`, `url`, `title`, `description`, `created_at`, `updated_at`, `author_id`) VALUES
(1, 'https://www.symfony.com', 'Symfony, High Performance PHP Framework for Web', 'Symfony is a set of reusable PHP components and a PHP framework to build web applications, APIs, microservices and web services', '2020-01-24 12:28:38', '2020-01-24 12:28:38', NULL),
(2, 'https://github.com', 'The world\'s leading software development platform', 'GitHub brings together the world\'s largest community of developers to discover, share, and build better software. From open source projects to private team ...', '2020-01-24 12:28:38', '2020-01-24 12:28:38', NULL),
(4, 'bandera.com', 'banderads', 'fsddfssdfsd', '2017-03-04 03:06:00', '2017-04-04 07:09:00', NULL),
(5, 'google.com', 'Google', 'Buscador', '2019-08-13 10:12:00', '2020-10-12 14:16:00', NULL),
(6, 'http://ghjgh', 'ghjghj', 'fjhfj', '2025-10-28 11:55:00', '2020-01-28 11:55:00', 1),
(7, 'http://fdgdf', 'dfgdf', 'dfgdf', '2020-01-28 12:02:00', '2020-01-28 12:02:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200124110627', '2020-01-24 11:12:32'),
('20200128090246', '2020-01-28 09:03:21'),
('20200128092604', '2020-01-28 09:26:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `full_name`, `username`, `email`, `password`, `roles`) VALUES
(1, 'juanjo', 'banderajuanjo', 'bandera@gmai.com', '$argon2id$v=19$m=65536,t=4,p=1$LqZzb6i23la2VH16XCKYCQ$ud+bCbGhplj8Nz7UHdna2ryySwmXmQ8m2i8dpgLoqIU', '[\"ROLE_ADMIN\",\"ROLE_USER\",\"ROLE_USER\"]'),
(2, 'moises', 'moikratos', 'kratos@gmail.com', 'mnbvcb', '[\"ROLE_USER\"]'),
(3, 'pere', 'perevicente', 'perevicent@gmail.com', 'sdfsdfsd', '[\"ROLE_ADMIN\"]'),
(5, 'carobandera', 'jjigualada', 'bandera@gmai.com', 'jjbcjjbc', '[\"ROLE_ADMIN\"]'),
(6, 'manelb', 'manuelbandera', 'bandera@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$QoAQ+BW0SpvYybDef958jQ$aCA/fb5qA+3ch10pJ90oqmHo3ktWjBk4xyA8nas6m70', '[\"ROLE_USER\",\"ROLE_USER\"]'),
(7, 'admin', 'admin', 'admin@admin.com', '$argon2id$v=19$m=65536,t=4,p=1$fZWD5x8b/ZoaGchvTk1Ysg$v0avGFYVDCb11HlgFB7KSLJTCw9B2afdvTFM0cOsz4s', '[]'),
(8, 'banderajj', 'juanjo', 'bandera@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$+ErhcssDEHWvFNtpRNIGvw$O4XC1zrMgWpMXeEWq3zZjF9kjBvJfWcVlabTTKH6qos', '[]'),
(9, 'manolobandera', 'maneul', 'manuelbanderaramirez@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$qI7l595XeUlJE273NJ5DRQ$XmfOAp930wHMUbwTH+tq4wlTOaEAXQ32paRhrHLfPjs', '[]');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_36AC99F1F675F31B` (`author_id`);

--
-- Indices de la tabla `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `FK_36AC99F1F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
