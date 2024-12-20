-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2024 a las 14:11:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdreniec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `api_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `api_keys`
--

INSERT INTO `api_keys` (`id`, `service_name`, `correo_electronico`, `contrasena`, `api_key`) VALUES
(1, 'PeruDevs', 'inpe@appsauri.com', 'Redes2804751$$$', 'cGVydWRldnMucHJvZHVjdGlvbi5maXRjb2RlcnMuNjc0N2EyYjI5ZmE0MTczZjYxMzIwNGVk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_requests`
--

CREATE TABLE `api_requests` (
  `id` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre_completo` varchar(255) DEFAULT NULL,
  `codigo_verificacion` varchar(50) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `estado_consulta` tinyint(1) NOT NULL,
  `fecha_consulta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `api_requests`
--

INSERT INTO `api_requests` (`id`, `dni`, `nombres`, `apellido_paterno`, `apellido_materno`, `fecha_nacimiento`, `nombre_completo`, `codigo_verificacion`, `genero`, `estado_consulta`, `fecha_consulta`) VALUES
(1, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-04 19:07:52'),
(2, '10484091', 'SAMUEL', 'SILVA', 'GUEVARA', '1960-07-24', 'SAMUEL SILVA GUEVARA', '0', 'M', 1, '2024-11-29 20:14:11'),
(3, '10484091', 'SAMUEL', 'SILVA', 'GUEVARA', '1960-07-24', 'SAMUEL SILVA GUEVARA', '0', 'M', 1, '2024-11-29 20:17:18'),
(4, '10484091', 'SAMUEL', 'SILVA', 'GUEVARA', '1960-07-24', 'SAMUEL SILVA GUEVARA', '0', 'M', 1, '2024-11-29 20:17:19'),
(5, '10484091', 'SAMUEL', 'SILVA', 'GUEVARA', '1960-07-24', 'SAMUEL SILVA GUEVARA', '0', 'M', 1, '2024-11-29 20:17:20'),
(6, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-04 19:07:52'),
(7, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-04 19:07:52'),
(8, '41685714', 'BRUNO JAVIER RODOLFO', 'BLANCO', 'BRAVO', '1983-05-06', 'BRUNO JAVIER RODOLFO BLANCO BRAVO', '3', 'M', 1, '2024-12-03 19:59:47'),
(9, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-04 19:07:52'),
(10, '08362186', 'ROSSANA ELIZABETH', 'BASAURI', 'PORTILLA', '1960-02-27', 'ROSSANA ELIZABETH BASAURI PORTILLA', '4', 'F', 1, '2024-12-04 16:55:21'),
(11, '72607254', 'JEFFERSON NEIL', 'VERGARAY', 'PARIONA', '1993-09-25', 'JEFFERSON NEIL VERGARAY PARIONA', '5', 'M', 1, '2024-12-04 19:07:39'),
(12, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-04 19:13:57'),
(13, '72607258', 'KARINA MARLENE', 'ROJAS', 'QUISPE', '1996-06-22', 'KARINA MARLENE ROJAS QUISPE', '8', 'F', 1, '2024-12-04 19:16:00'),
(14, '72607251', 'Juan', 'Pérez', 'García', '1985-05-10', 'Juan Pérez García', '12345678', 'M', 1, '2024-12-04 20:30:39'),
(15, '08362187', 'Juan', 'Pérez', 'García', '1985-05-10', 'Juan Pérez García', '12345678', 'M', 1, '2024-12-04 20:31:25'),
(16, '40763706', 'Juan', 'Pérez', 'García', '1985-05-10', 'Juan Pérez García', '12345678', 'M', 1, '2024-12-05 13:48:34'),
(17, '40763706', 'LIDIA TATIANA', 'ESTACIO', 'PEÑA', '1980-12-14', 'LIDIA TATIANA ESTACIO PEÑA', '8', 'F', 1, '2024-12-05 13:48:51'),
(18, '47040716', 'DANIEL MARTIN', 'GRANADOS', 'VALENTIN', '1990-08-23', 'DANIEL MARTIN GRANADOS VALENTIN', '1', 'M', 1, '2024-12-05 13:49:19'),
(19, '70578511', 'SAMIR RENATO', 'RODRIGUEZ', 'PUPUCHE', '1996-10-18', 'SAMIR RENATO RODRIGUEZ PUPUCHE', '8', 'M', 1, '2024-12-05 13:49:44'),
(20, '47223854', 'FREDDY GILBERT', 'TOLEDO', 'CARTAGENA', '1991-08-16', 'FREDDY GILBERT TOLEDO CARTAGENA', '5', 'M', 1, '2024-12-05 13:50:27'),
(21, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-05 13:50:53'),
(22, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-19 19:53:23'),
(23, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 19:55:46'),
(24, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 19:55:58'),
(25, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 20:27:30'),
(26, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 20:27:32'),
(27, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 20:27:34'),
(28, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 20:28:14'),
(29, '10484097', 'EDGAR DONATO', 'NAVARRO', 'ARONI', '1974-02-17', 'EDGAR DONATO NAVARRO ARONI', '9', 'M', 1, '2024-12-19 20:28:18'),
(30, '72607251', 'ANDRES MARTIN', 'SILVA', 'BASAURI', '1995-09-28', 'ANDRES MARTIN SILVA BASAURI', '1', 'M', 1, '2024-12-19 21:30:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_requests`
--
ALTER TABLE `api_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `api_requests`
--
ALTER TABLE `api_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
