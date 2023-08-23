-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 03:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empresa`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `localidad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `cuit`, `direccion`, `telefono`, `localidad_id`) VALUES
(7, 'Alejandro', '20345678901', 'Dirección Cliente 1', '111-111-1111', 3),
(8, 'Sophia', '30456789012', 'Dirección Cliente 2', '222-222-2222', 5),
(9, 'Nikos', '40567890123', 'Dirección Cliente 3', '333-333-3333', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` int(11) NOT NULL,
  `tipoComprobante` enum('FC','RE','NC','ND') DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `tipoComprobante`, `numero`, `cliente_id`, `fecha`) VALUES
(1, 'FC', 1001, NULL, '2023-08-23'),
(2, 'FC', 1002, NULL, '2023-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `condicionesfiscales`
--

CREATE TABLE `condicionesfiscales` (
  `id` int(11) NOT NULL,
  `nomrbe` varchar(50) DEFAULT NULL,
  `primerIVA` double DEFAULT NULL,
  `segundoIVA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detallecomprobantes`
--

CREATE TABLE `detallecomprobantes` (
  `id` int(11) NOT NULL,
  `comprobante_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detallecomprobantes`
--

INSERT INTO `detallecomprobantes` (`id`, `comprobante_id`, `producto_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `localidades`
--

CREATE TABLE `localidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `postal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localidades`
--

INSERT INTO `localidades` (`id`, `nombre`, `postal`) VALUES
(1, 'Ciudad Aleatoria 1', 12345),
(2, 'Ciudad Aleatoria 2', 67890),
(3, 'New York City', 10001),
(4, 'Los Angeles', 90001),
(5, 'Chicago', 60601);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `precioCompra` double DEFAULT NULL,
  `precioVenta` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stockMin` int(11) DEFAULT NULL,
  `stockMax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precioCompra`, `precioVenta`, `stock`, `stockMin`, `stockMax`) VALUES
(1, 'Producto A1', 'Descripción Producto A1', 50, 100, 100, 10, 200),
(2, 'Producto B1', 'Descripción Producto B1', 70, 120, 80, 5, 150);

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `razonSocial` varchar(50) DEFAULT NULL,
  `nombreFantacia` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `localidad_id` int(11) DEFAULT NULL,
  `condicionFiscal` enum('RI','EX','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `razonSocial`, `nombreFantacia`, `direccion`, `telefono`, `localidad_id`, `condicionFiscal`) VALUES
(5, 'Proveedor A', 'Fantasía A', 'Dirección A', '123-456-7890', 1, 'RI'),
(6, 'Proveedor B', 'Fantasía B', 'Dirección B', '987-654-3210', 2, 'EX');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- Indexes for table `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indexes for table `condicionesfiscales`
--
ALTER TABLE `condicionesfiscales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detallecomprobantes`
--
ALTER TABLE `detallecomprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comprobante_id` (`comprobante_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `localidades`
--
ALTER TABLE `localidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`);

--
-- Constraints for table `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `detallecomprobantes`
--
ALTER TABLE `detallecomprobantes`
  ADD CONSTRAINT `detallecomprobantes_ibfk_1` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`),
  ADD CONSTRAINT `detallecomprobantes_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
