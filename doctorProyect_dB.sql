-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-02-2018 a las 13:50:08
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `doctorProyect_dB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exercices`
--

CREATE TABLE `exercices` (
  `id` int(70) NOT NULL,
  `id_client` int(70) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `exercices`
--

INSERT INTO `exercices` (`id`, `id_client`, `description`, `date`) VALUES
(3, 6, 'correr 7 km', '2018-02-15'),
(4, 6, '5 series de 20 abdominales', '2018-02-14'),
(5, 6, 'respirar profundamente arqueando la columna lumbar lentamente durante la inspiración para después regresarla a la posición inicial mientras se exhala.', '2018-02-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicines`
--

CREATE TABLE `medicines` (
  `id` int(70) NOT NULL,
  `id_client` int(70) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicines`
--

INSERT INTO `medicines` (`id`, `id_client`, `name`, `date`) VALUES
(1, 6, 'Paracetamol 1 gramo cada 8h.', '2018-02-14'),
(2, 7, 'Bisolgrip Forte cada 12h.', '2018-02-14'),
(3, 6, 'Enantyum antes de dormir', '2018-02-15'),
(4, 7, 'como estas', '2018-02-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_pm`
--

CREATE TABLE `rel_pm` (
  `id_patient` int(70) NOT NULL,
  `id_med` int(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rel_pm`
--

INSERT INTO `rel_pm` (`id_patient`, `id_med`) VALUES
(6, 5),
(8, 9),
(7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(70) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `pass`, `type`) VALUES
(5, 'medico', 'medico', 0),
(6, 'paciente1', 'paciente1', 1),
(7, 'paciente2', 'paciente2', 1),
(8, 'paciente3', 'paciente3', 1),
(9, 'medico2', 'medico2', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `exercices`
--
ALTER TABLE `exercices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`id_client`);

--
-- Indices de la tabla `rel_pm`
--
ALTER TABLE `rel_pm`
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_med` (`id_med`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `exercices`
--
ALTER TABLE `exercices`
  MODIFY `id` int(70) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(70) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(70) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `exercices`
--
ALTER TABLE `exercices`
  ADD CONSTRAINT `exercices_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rel_pm`
--
ALTER TABLE `rel_pm`
  ADD CONSTRAINT `rel_pm_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_pm_ibfk_2` FOREIGN KEY (`id_med`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
