-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2017 a las 04:15:24
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tien`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(25) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `telefono` int(8) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesproducto`
--

CREATE TABLE `imagenesproducto` (
  `idimagen` int(10) NOT NULL,
  `idproducto` int(10) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenesproducto`
--

INSERT INTO `imagenesproducto` (`idimagen`, `idproducto`, `imagen`, `titulo`, `descripcion`) VALUES
(6, 1, 'pro1.jpg', 'pro1.jpg', 'pro1.jpg'),
(7, 2, 'pro2.jpg', 'pro2.jpg', 'pro2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedido`
--

CREATE TABLE `lineaspedido` (
  `id` int(10) NOT NULL,
  `idpedido` int(10) NOT NULL,
  `idproducto` int(10) NOT NULL,
  `unidades` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(10) NOT NULL,
  `idcliente` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `peso` double NOT NULL,
  `existencias` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nombre`, `descripcion`, `precio`, `peso`, `existencias`) VALUES
(1, 'Zapatos Mujer', 'Bonito rosados', '20', 12, 1),
(2, 'Zapato Negro Elegante', 'Muy elegantes y bonitos', '18', 12, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `imagenesproducto`
--
ALTER TABLE `imagenesproducto`
  ADD PRIMARY KEY (`idimagen`),
  ADD UNIQUE KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idproducto` (`idproducto`),
  ADD UNIQUE KEY `idpedido` (`idpedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`),
  ADD UNIQUE KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `imagenesproducto`
--
ALTER TABLE `imagenesproducto`
  MODIFY `idimagen` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagenesproducto`
--
ALTER TABLE `imagenesproducto`
  ADD CONSTRAINT `imagenesproducto_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  ADD CONSTRAINT `lineaspedido_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lineaspedido_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
