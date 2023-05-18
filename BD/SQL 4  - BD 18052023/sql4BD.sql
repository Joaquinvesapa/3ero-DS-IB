-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-05-2023 a las 15:00:34
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sql4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `limite_credito` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `direccion`, `ciudad`, `limite_credito`) VALUES
(1, 'Daniel G', '5556901745', 'False Street 52 2 A', 'San Francisco', '3000.00'),
(2, 'Anne Wright', '5557410345', 'Wall-e Avenue 34', 'USA', '19.60'),
(3, 'Gerudo Valley', '5552323129', 'Oaks Avenue nº22', 'USA', '22.10'),
(4, 'Juan Perez', '5552323129', 'San juan nº22', 'Rosario', '234.85'),
(5, 'David Serrano', '675598001', 'Azores 321', 'Funes', '11.50'),
(6, 'Jose Tacaño', '655983045', 'Fuentes 6252', 'Rosario', '11.20'),
(7, 'Antonio Lasas', '34916540145', 'Mitre 543', 'Funes', '8.15'),
(8, 'Akane Tendo', '55591233210', 'Null Street nº69', 'USA', '696.60');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `cliente_id`, `empleado_id`, `fecha`, `estado`) VALUES
(1, 2, 1, '2006-01-17', 'Entregado'),
(2, 2, 5, '2007-10-26', 'Entregado'),
(3, 1, 3, '2008-06-25', 'Rechazado'),
(4, 3, 1, '2009-01-26', 'Pendiente'),
(8, 3, 2, '2008-11-14', 'Entregado'),
(9, 4, 1, '2008-12-27', 'Entregado'),
(10, 4, 2, '2009-01-15', 'Pendiente'),
(11, 3, 1, '2009-01-20', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copra_productos`
--

CREATE TABLE `copra_productos` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `producto_id` varchar(30) DEFAULT NULL,
  `precio_unidad` decimal(6,2) DEFAULT NULL,
  `numero_linea` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `copra_productos`
--

INSERT INTO `copra_productos` (`id`, `compra_id`, `producto_id`, `precio_unidad`, `numero_linea`, `cantidad`) VALUES
(1, 10, '11679', '70.30', 1, 5),
(2, 10, '22225', '70.30', 2, 3),
(3, 10, '21636', '43.50', 3, 40),
(4, 8, '11679', '76.30', 1, 5),
(5, 8, '21636', '70.30', 2, 5),
(6, 3, '11679', '70.30', 1, 5),
(7, 3, 'FR-100', '78.30', 2, 5),
(8, 3, 'AR-008', '70.30', 3, 5),
(9, 1, 'AR-008', '170.30', 1, 5),
(10, 1, '11679', '90.30', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `oficina_id` varchar(7) DEFAULT NULL,
  `jefe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `telefono`, `direccion`, `ciudad`, `oficina_id`, `jefe_id`) VALUES
(1, 'Marcos Perez', '3413897', 'San Juan 514', 'Rosario', 'BCN-ROS', NULL),
(2, 'Juan Andes', '341353421', 'San Martin 1514', 'Rosario', 'BCN-ROS', 1),
(3, 'Mariana Papalao', '341223344', 'Entre Rios 222', 'Rosario', 'BCN-ROS', 1),
(4, 'Daniel Dartes', '341223322', 'San Juan 111', 'Funes', 'BCN-FUN', 1),
(5, 'Mariana Paris', '341444444', 'Entre Rios 1222', 'Funes', 'BCN-FUN', 3),
(6, 'Daniel Mariani', '341223322', 'San Juan 11', 'Roldan', 'BCN-ROL', 3),
(7, 'Juana Juarez', '341223322', 'Sarmiento  2211', 'Roldan', 'BCN-ROL', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamas`
--

CREATE TABLE `gamas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `gamas`
--

INSERT INTO `gamas` (`id`, `nombre`) VALUES
(10, 'Plantas para jardin decorativas'),
(20, 'Herramientas para todo tipo de acción'),
(30, 'Plantas aromáticas'),
(40, 'Árboles pequeños de producción frutal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `id` varchar(7) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`id`, `ciudad`, `domicilio`, `telefono`) VALUES
('BCN-FUN', 'Funes', '34111111', 'San Juan 514'),
('BCN-PER', 'Perez', '34122222', 'Pelegrini 514'),
('BCN-ROL', 'Roldan', '3412345667', 'San Martin 1514'),
('BCN-ROS', 'Rosario', '341235242', 'Mitre 333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` varchar(30) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `dimensiones` int(11) DEFAULT NULL,
  `precio_venta` decimal(6,3) DEFAULT NULL,
  `gama_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `dimensiones`, `precio_venta`, `gama_id`) VALUES
('11679', 'Sierra de Poda 400MM', 0, '999.999', 20),
('21636', 'Pala', 0, '125.500', 20),
('22225', 'Rastrillo de Jardín', 1, '590.000', 20),
('AR-001', 'Ajedrea', 15, '530.500', 40),
('AR-002', 'Lavándula Dentata', 15, '550.000', 30),
('AR-008', 'Thymus Citriodra (Tomillo limón)', 1, '890.500', 30),
('FR-100', 'Nectarina', 8, '999.999', 40),
('FR-16', 'Calamondin Copa EXTRA Con FRUTA', 10, '990.000', 40);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `copra_productos`
--
ALTER TABLE `copra_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oficina_id` (`oficina_id`),
  ADD KEY `jefe_id` (`jefe_id`);

--
-- Indices de la tabla `gamas`
--
ALTER TABLE `gamas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gama_id` (`gama_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `copra_productos`
--
ALTER TABLE `copra_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `gamas`
--
ALTER TABLE `gamas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `copra_productos`
--
ALTER TABLE `copra_productos`
  ADD CONSTRAINT `copra_productos_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `copra_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`oficina_id`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`jefe_id`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`gama_id`) REFERENCES `gamas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
