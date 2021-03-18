-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-03-2021 a las 15:32:50
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adreca`
--

CREATE TABLE `adreca` (
  `id_adreca` int(10) NOT NULL,
  `carrer` varchar(75) NOT NULL,
  `numero` int(3) NOT NULL,
  `pis` int(2) NOT NULL,
  `ciutat` varchar(75) NOT NULL,
  `codi postal` int(5) NOT NULL,
  `pais` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `adreca`
--

INSERT INTO `adreca` (`id_adreca`, `carrer`, `numero`, `pis`, `ciutat`, `codi postal`, `pais`) VALUES
(3, 'llacuna', 162, 1, 'barcelona', 8032, 'espanya'),
(4, 'villalba dels arcs', 39, 2, 'barcelona', 8042, 'espanya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(10) NOT NULL,
  `adreca` int(10) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `telefon` int(9) NOT NULL,
  `correu` varchar(75) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_recomanacio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `adreca`, `nom`, `telefon`, `correu`, `data_registre`, `id_recomanacio`) VALUES
(1, 3, 'ana pascual', 682417456, 'apascual@gmail.com', '2021-03-18 12:52:28', NULL),
(2, 4, 'elena mir', 682417432, 'emir@gmail.com', '2021-03-18 12:53:50', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `nom` varchar(10) NOT NULL,
  `adreca` int(10) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `id_nif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`nom`, `adreca`, `telefon`, `fax`, `id_nif`) VALUES
('miguel', 4, 682417461, 682417461, 541545420),
('juan', 3, 682417421, 682417421, 541545452);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(10) NOT NULL,
  `marca` varchar(10) NOT NULL,
  `graduacio1` float NOT NULL,
  `graduacio2` float NOT NULL,
  `muntura` varchar(10) NOT NULL,
  `color_vidre1` varchar(10) NOT NULL,
  `color_vidre2` varchar(10) NOT NULL,
  `preu` int(4) NOT NULL,
  `id_proveidor` int(10) NOT NULL,
  `id_venedor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `graduacio1`, `graduacio2`, `muntura`, `color_vidre1`, `color_vidre2`, `preu`, `id_proveidor`, `id_venedor`) VALUES
(1, 'rayban', 2, 1, 'pasta', 'blanc', 'blanc', 300, 541545452, NULL),
(2, 'gucci', 4, 3, 'flotant', 'negre', 'negre', 400, 541545420, 21523);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id_adreca`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `romanacio_index` (`id_recomanacio`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_nif`),
  ADD KEY `adreca_fk` (`adreca`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `proveidor_fk` (`id_proveidor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adreca`
--
ALTER TABLE `adreca`
  MODIFY `id_adreca` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `romanacio_index` FOREIGN KEY (`id_recomanacio`) REFERENCES `client` (`id_client`);

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `adreca_fk` FOREIGN KEY (`adreca`) REFERENCES `adreca` (`id_adreca`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `proveidor_fk` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidor` (`id_nif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
