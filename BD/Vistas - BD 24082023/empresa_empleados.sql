-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 12:10 PM
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
-- Database: `empresa_empleados`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `legajo` int(5) NOT NULL,
  `documento` char(8) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `seccion` int(2) NOT NULL,
  `cantidadhijos` int(2) DEFAULT NULL,
  `estadocivil` char(10) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`legajo`, `documento`, `sexo`, `apellido`, `nombre`, `domicilio`, `seccion`, `cantidadhijos`, `estadocivil`, `fechaingreso`) VALUES
(100, '22222222', 'f', 'Lopez', 'Ana', 'Colon 123', 1, 2, 'casado', '2010-10-10'),
(102, '23333333', 'm', 'Lopez', 'Luis', 'Sucre 235', 1, 0, 'soltero', '2011-01-03'),
(103, '24444444', 'm', 'Garcia', 'Marcos', 'Sarmiento 1234', 2, 3, 'divorciado', '1998-07-02'),
(104, '25555555', 'm', 'Gomez', 'Pablo', 'Bulnes 321', 3, 2, 'casado', '2008-10-10'),
(105, '26666666', 'f', 'Perez', 'Laura', 'Peru 1254', 3, 3, 'casado', '2000-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `secciones`
--

CREATE TABLE `secciones` (
  `codigo` int(2) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `sueldo` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secciones`
--

INSERT INTO `secciones` (`codigo`, `nombre`, `sueldo`) VALUES
(1, 'Administracion', 900.00),
(2, 'Contaduría', 400.00),
(3, 'Sistemas', 500.00),
(4, 'Ingeniería', 1300.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_empleados`
-- (See below for the actual view)
--
CREATE TABLE `v_empleados` (
`Apellido` varchar(20)
,`Nombre` varchar(20)
,`Sexo` char(1)
,`Domicilio` varchar(30)
,`Cantidad_Hijos` int(2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_empleados_con_hijos`
-- (See below for the actual view)
--
CREATE TABLE `v_empleados_con_hijos` (
`Apellido` varchar(20)
,`Nombre` varchar(20)
,`Sexo` char(1)
,`Domicilio` varchar(30)
,`Cantidad_Hijos` int(2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_empleados_hijos_6`
-- (See below for the actual view)
--
CREATE TABLE `v_empleados_hijos_6` (
`Legajo` int(5)
,`Nombre` varchar(20)
,`Apellido` varchar(20)
,`Documento` char(8)
,`Sexo` char(1)
,`Domicilio` varchar(30)
,`Cantidad_Hijos` int(2)
,`Estado_civil` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_empleados_secciones`
-- (See below for the actual view)
--
CREATE TABLE `v_empleados_secciones` (
`Nombre` varchar(20)
,`Sexo` char(1)
,`Seccion` varchar(20)
,`Cantidad_Hijos` int(2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_epleados_año`
-- (See below for the actual view)
--
CREATE TABLE `v_epleados_año` (
`Año` int(4)
,`Cant_Empleados` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_secciones`
-- (See below for the actual view)
--
CREATE TABLE `v_secciones` (
`Codigo` int(2)
,`Nombre` varchar(20)
,`Sueldo` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Structure for view `v_empleados`
--
DROP TABLE IF EXISTS `v_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empleados`  AS SELECT `e`.`apellido` AS `Apellido`, `e`.`nombre` AS `Nombre`, `e`.`sexo` AS `Sexo`, `e`.`domicilio` AS `Domicilio`, `e`.`cantidadhijos` AS `Cantidad_Hijos` FROM `empleados` AS `e` ORDER BY `e`.`apellido` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_empleados_con_hijos`
--
DROP TABLE IF EXISTS `v_empleados_con_hijos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empleados_con_hijos`  AS SELECT `e`.`apellido` AS `Apellido`, `e`.`nombre` AS `Nombre`, `e`.`sexo` AS `Sexo`, `e`.`domicilio` AS `Domicilio`, `e`.`cantidadhijos` AS `Cantidad_Hijos` FROM `empleados` AS `e` WHERE `e`.`cantidadhijos` >= 1 ORDER BY `e`.`apellido` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_empleados_hijos_6`
--
DROP TABLE IF EXISTS `v_empleados_hijos_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empleados_hijos_6`  AS SELECT `e`.`legajo` AS `Legajo`, `e`.`nombre` AS `Nombre`, `e`.`apellido` AS `Apellido`, `e`.`documento` AS `Documento`, `e`.`sexo` AS `Sexo`, `e`.`domicilio` AS `Domicilio`, `e`.`cantidadhijos` AS `Cantidad_Hijos`, `e`.`estadocivil` AS `Estado_civil` FROM `empleados` AS `e` WHERE `e`.`cantidadhijos` > 0 ;

-- --------------------------------------------------------

--
-- Structure for view `v_empleados_secciones`
--
DROP TABLE IF EXISTS `v_empleados_secciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empleados_secciones`  AS SELECT `e`.`nombre` AS `Nombre`, `e`.`sexo` AS `Sexo`, `s`.`nombre` AS `Seccion`, `e`.`cantidadhijos` AS `Cantidad_Hijos` FROM (`empleados` `e` join `secciones` `s` on(`e`.`seccion` = `s`.`codigo`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_epleados_año`
--
DROP TABLE IF EXISTS `v_epleados_año`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_epleados_año`  AS SELECT year(`empleados`.`fechaingreso`) AS `Año`, count(0) AS `Cant_Empleados` FROM `empleados` GROUP BY year(`empleados`.`fechaingreso`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_secciones`
--
DROP TABLE IF EXISTS `v_secciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_secciones`  AS SELECT `s`.`codigo` AS `Codigo`, `s`.`nombre` AS `Nombre`, `s`.`sueldo` AS `Sueldo` FROM `secciones` AS `s` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`legajo`),
  ADD KEY `seccion` (`seccion`);

--
-- Indexes for table `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`codigo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`seccion`) REFERENCES `secciones` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
