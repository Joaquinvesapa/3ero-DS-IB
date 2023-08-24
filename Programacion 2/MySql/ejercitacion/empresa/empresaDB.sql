-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2023 a las 16:17:23
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
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(50) DEFAULT NULL,
  `cuitCliente` varchar(20) DEFAULT NULL,
  `direccionCliente` varchar(50) DEFAULT NULL,
  `telefonoCliente` varchar(20) DEFAULT NULL,
  `postalCLiente` int(11) DEFAULT NULL,
  `idCondicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `cuitCliente`, `direccionCliente`, `telefonoCliente`, `postalCLiente`, `idCondicion`) VALUES
(1, 'Marcelo Benitez', '20443252839', 'Ameghino y Mendoza', '3442135467', 2, 4),
(2, 'Mateo Bodini', '20443254429', 'Buenos aires y 9 de julio', '3442135455', 1, 4),
(3, 'Lucas Quaroni', '20443254665', 'Pueyrredon y Brown', '3442135111', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idComprobante` int(11) NOT NULL,
  `tipoComprobante` int(11) DEFAULT NULL,
  `numeroComprobante` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `fechaComprobante` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idComprobante`, `tipoComprobante`, `numeroComprobante`, `idProveedor`, `monto`, `fechaComprobante`) VALUES
(1, 1, 1, 1, 2000, '2020-10-22'),
(2, 2, 2, 2, 10000, '2022-01-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `idComprobante` int(11) NOT NULL,
  `tipoComprobante` enum('FC','RE','NC','ND') DEFAULT NULL,
  `numeroComprobante` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `fechaComprobante` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicionesfiscales`
--

CREATE TABLE `condicionesfiscales` (
  `idCondicion` int(11) NOT NULL,
  `nombreCondicion` varchar(50) DEFAULT NULL,
  `primerIVA` double DEFAULT NULL,
  `segundoIVA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `condicionesfiscales`
--

INSERT INTO `condicionesfiscales` (`idCondicion`, `nombreCondicion`, `primerIVA`, `segundoIVA`) VALUES
(1, 'Responsable Inscripto', 10.5, 21),
(2, 'Responsable No Inscripto', 10.5, 21),
(3, 'Excento', NULL, NULL),
(4, 'Consumidor Final', 10.5, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecomprobantes`
--

CREATE TABLE `detallecomprobantes` (
  `idDetalle` int(11) NOT NULL,
  `idComprobante` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `nombreLocalidad` varchar(50) DEFAULT NULL,
  `postalLocalidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idLocalidad`, `nombreLocalidad`, `postalLocalidad`) VALUES
(1, 'Rosario', 2000),
(2, 'Corral de Bustos', 2645);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) DEFAULT NULL,
  `descripcionProducto` varchar(150) DEFAULT NULL,
  `precioCompraProducto` double DEFAULT NULL,
  `precioVentaProducto` double DEFAULT NULL,
  `stockProducto` int(11) DEFAULT NULL,
  `stockMinProducto` int(11) DEFAULT NULL,
  `stockMaxProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioCompraProducto`, `precioVentaProducto`, `stockProducto`, `stockMinProducto`, `stockMaxProducto`) VALUES
(1, 'Mouse', 'Mouse logitech de oficina común color negro', 350.2, 420.1, 30, 10, 50),
(2, 'Vianda', 'Vianda para entregar a los empleados de forma diaria', 35.2, 42.1, 60, 60, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `razonSocialProveedor` varchar(50) DEFAULT NULL,
  `nombreFantaciaProveedor` varchar(50) DEFAULT NULL,
  `direccionProveedor` varchar(50) DEFAULT NULL,
  `telefonoProveedor` varchar(20) DEFAULT NULL,
  `postalProveedor` int(11) DEFAULT NULL,
  `condicionFiscalProveedor` int(11) DEFAULT NULL,
  `CUIT` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `razonSocialProveedor`, `nombreFantaciaProveedor`, `direccionProveedor`, `telefonoProveedor`, `postalProveedor`, `condicionFiscalProveedor`, `CUIT`) VALUES
(1, 'MORA SRL', 'Mora Informática', 'Salta 2500', '3414442323', 1, 1, '20443333332'),
(2, 'CATERING SRL', 'Catering Gourmet', 'Suipacha 500', '3415562323', 2, 2, '333211112');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `postalCLiente` (`postalCLiente`),
  ADD KEY `idCondicion` (`idCondicion`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idComprobante`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`idComprobante`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `condicionesfiscales`
--
ALTER TABLE `condicionesfiscales`
  ADD PRIMARY KEY (`idCondicion`);

--
-- Indices de la tabla `detallecomprobantes`
--
ALTER TABLE `detallecomprobantes`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idComprobante` (`idComprobante`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idLocalidad`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `postalProveedor` (`postalProveedor`),
  ADD KEY `condicionFiscalProveedor` (`condicionFiscalProveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idComprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idLocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`postalCLiente`) REFERENCES `localidades` (`idLocalidad`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`idCondicion`) REFERENCES `condicionesfiscales` (`idCondicion`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);

--
-- Filtros para la tabla `detallecomprobantes`
--
ALTER TABLE `detallecomprobantes`
  ADD CONSTRAINT `detallecomprobantes_ibfk_1` FOREIGN KEY (`idComprobante`) REFERENCES `comprobantes` (`idComprobante`),
  ADD CONSTRAINT `detallecomprobantes_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`postalProveedor`) REFERENCES `localidades` (`idLocalidad`),
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`condicionFiscalProveedor`) REFERENCES `condicionesfiscales` (`idCondicion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
