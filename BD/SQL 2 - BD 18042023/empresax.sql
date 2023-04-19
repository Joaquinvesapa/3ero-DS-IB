-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2023 a las 21:04:57
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`numero`, `nombre`, `direccion`) VALUES
(10, 'Sede Central', 'C/ Atocha, 820, Madrid'),
(20, 'Relación con Clientes', 'C/ Atocha, 405, Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `tipo_director` varchar(2) DEFAULT NULL,
  `num_director` int(11) DEFAULT NULL,
  `presupuesto` int(11) DEFAULT NULL,
  `num_empleado` int(11) DEFAULT NULL,
  `num_centro` int(11) DEFAULT NULL,
  `depde` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`numero`, `nombre`, `tipo_director`, `num_director`, `presupuesto`, `num_empleado`, `num_centro`, `depde`) VALUES
(100, 'Dirección General', 'P', 260, 72, NULL, 10, NULL),
(110, 'Dirección Comercial', 'P', 180, 90, NULL, 20, 100),
(111, 'Sector Industrial', 'F', 180, 66, NULL, 20, 110),
(112, 'Sector Servicios', 'P', 270, 54, NULL, 20, 110),
(120, 'Organización', 'F', 150, 18, NULL, 10, 100),
(121, 'Personal', 'P', 150, 12, NULL, 10, 120),
(122, 'Proceso de datos', 'P', 350, 36, NULL, 10, 120),
(130, 'Finanzas', 'P', 310, 12, NULL, 10, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nac` datetime DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `fecha_ingreso_empresa` datetime DEFAULT NULL,
  `comision` int(11) DEFAULT NULL,
  `num_hijos` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`numero`, `nombre`, `telefono`, `fecha_nac`, `salario`, `fecha_ingreso_empresa`, `comision`, `num_hijos`, `email`) VALUES
(1, 'Juan', '1234567890', '1990-01-01 00:00:00', 5750, '2010-01-01 00:00:00', 500, 2, 'juan@gmail.com'),
(2, 'María', '9876543210', '1985-03-15 00:00:00', 8050, '2008-05-12 00:00:00', 300, 1, 'maría@gmail.com'),
(3, 'Pedro', '5678901234', '1995-06-30 00:00:00', 5175, '2015-02-20 00:00:00', 0, 0, 'pedro@gmail.com'),
(4, 'Luisa', '7890123456', '1982-12-10 00:00:00', 6900, '2007-09-05 00:00:00', 200, 3, 'luisa@gmail.com'),
(5, 'Carlos', '3456789012', '1988-04-20 00:00:00', 6325, '2012-11-10 00:00:00', 100, 2, 'carlos@gmail.com'),
(6, 'Ana', '5678901234', '1993-08-18 00:00:00', 4600, '2018-03-25 00:00:00', 0, 0, 'ana@gmail.com'),
(7, 'Juanita', '9876543210', '1987-05-05 00:00:00', 7475, '2009-07-15 00:00:00', 0, 1, 'juanita@gmail.com'),
(8, 'Roberto', '1234567890', '1997-09-22 00:00:00', 5520, '2014-06-12 00:00:00', 150, 0, 'roberto@gmail.com'),
(9, 'Marcela', '7890123456', '1989-11-08 00:00:00', 5980, '2013-09-30 00:00:00', 0, 2, 'marcela@gmail.com'),
(10, 'Gabriel', '3456789012', '1992-02-25 00:00:00', 6900, '2017-01-05 00:00:00', 250, 0, 'gabriel@gmail.com'),
(11, 'Daniela', '5678901234', '1998-07-12 00:00:00', 5405, '2020-04-10 00:00:00', 0, 0, 'daniela@gmail.com'),
(12, 'Jorge', '9876543210', '1984-10-28 00:00:00', 6325, '2006-12-22 00:00:00', 300, 3, 'jorge@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `num_empleado` (`num_empleado`),
  ADD KEY `num_centro` (`num_centro`),
  ADD KEY `depde` (`depde`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`numero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`num_empleado`) REFERENCES `empleados` (`numero`),
  ADD CONSTRAINT `departamentos_ibfk_2` FOREIGN KEY (`num_centro`) REFERENCES `centros` (`numero`),
  ADD CONSTRAINT `departamentos_ibfk_3` FOREIGN KEY (`depde`) REFERENCES `departamentos` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
