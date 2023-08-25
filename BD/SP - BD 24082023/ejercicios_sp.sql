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
-- Database: `ejercicios_sp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `aumentar_precios_x_editorial` (IN `NombreEditorial` VARCHAR(20))   BEGIN
  UPDATE libros 
     SET precio = precio + precio * 0.1
   WHERE libros.editorial = NombreEditorial;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aumentar_precios_editorial_incremento` (IN `NombreEditorial` VARCHAR(20), IN `Incremento` INT)   BEGIN
  UPDATE libros 
     SET precio = precio + Incremento
   WHERE libros.editorial = NombreEditorial;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cantidad_libros` ()   BEGIN
  SELECT COUNT(*) As Cantidad_de_Libros FROM libros; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cantidad_libros_editorial` (IN `NombreEditorial` VARCHAR(20))   BEGIN
SELECT
  NombreEditorial,
  CASE 
        WHEN (SELECT MAX(codigo) FROM libros WHERE editorial = NombreEditorial) IS NOT NULL THEN
            CASE 
                WHEN (SELECT MAX(codigo) FROM libros WHERE editorial = NombreEditorial LIMIT 2) IS NOT NULL THEN 2
                ELSE 1
            END
        ELSE 0
    END As Cantidad_De_Libros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_incrementar_numero` (IN `numIn` INT, OUT `numOut` INT)   BEGIN
	SELECT numIn+1
    INTO numOut;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_nuevo_libro` (IN `Titulo` VARCHAR(40), IN `Autor` VARCHAR(30), IN `Editorial` VARCHAR(20), IN `Precio` DECIMAL(5,2))   BEGIN
  INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES (Titulo,Autor,Editorial,Precio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Libros_por_editorial` (IN `NombreEditorial` VARCHAR(20))   BEGIN
  SELECT l.editorial As Editorial,
         COUNT(*) As Cantidad_de_Libros
    FROM libros l
  WHERE l.editorial = NombreEditorial;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mayor_entre_3` (IN `num1` INT, IN `num2` INT, IN `num3` INT)   BEGIN 
  SELECT IF(num1 > num2, IF(num1 > num3, num1, num3), IF(num2 >num3, num2, num3))As Mayor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mostrar_Enteros` (IN `num1` INT, IN `num2` INT)   BEGIN
  SELECT num1, num2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_mayor` (IN `num1` INT, IN `num2` INT)   BEGIN 
  SELECT IF(num1<num2, num2, num1) as Mayor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_medalla` (IN `entero` INT)   BEGIN
    SELECT CASE WHEN entero = 1 THEN 'Oro' 
                WHEN entero = 2 THEN 'Plata' 
                ELSE 'Bronce' 
            END as Medalla;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_promedios_2_numeros` (IN `num1` INT, IN `num2` INT)   BEGIN
	SELECT (num1+num2)/2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_total_precios_x_autor` (IN `Autor` VARCHAR(30))   BEGIN
  SELECT l.autor AS Autor,
         ROUND(SUM(l.precio)) AS Total_Precios,
         ROUND(AVG(l.precio)) AS Promedio_Precios
    FROM libros l
   WHERE l.autor = Autor
GROUP BY l.autor;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `make` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`make`, `model`, `year`, `value`) VALUES
('Porsche', '911 GT3', 2020, 169700.00),
('Porsche', 'Cayman GT4', 2018, 118000.00),
('Porsche', 'Panamera', 2022, 113200.00),
('Porsche', 'Macan', 2019, 27400.00),
('Porsche', '718 Boxster', 2017, 48880.00),
('Ferrari', '488 GTB', 2015, 254750.00),
('Ferrari', 'F8 Tributo', 2019, 375000.00),
('Ferrari', 'SF90 Stradale', 2020, 627000.00),
('Ferrari', '812 Superfast', 2017, 335300.00),
('Ferrari', 'GTC4Lusso', 2016, 268000.00);

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(40) DEFAULT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`codigo`, `titulo`, `autor`, `editorial`, `precio`) VALUES
(1, 'Uno', 'Richard Bach', 'Planeta', 216.50),
(2, 'Ilusiones', 'Richard Bach', 'Planeta', 213.20),
(3, 'El aleph', 'Borges', 'Emece', 25.00),
(4, 'Aprenda PHP', 'Mario Molina', 'Nuevo siglo', 50.00),
(5, 'Matematica estas ahi', 'Paenza', 'Nuevo siglo', 18.00),
(6, 'Puente al infinito', 'Bach Richard', 'Sudamericana', 14.00),
(7, 'Antología', 'J. L. Borges', 'Paidos', 24.00),
(8, 'Java en 10 minutos', 'Mario Molina', 'Siglo XXI', 45.00),
(9, 'Cervantes y el quijote', 'Borges- Casares', 'Planeta', 237.40),
(10, 'Mobi dick', 'Sheakespiere', 'Hola', 200.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `libros`
--
ALTER TABLE `libros`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
