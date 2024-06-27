-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 01:32:20
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CitNumero` int(11) NOT NULL,
  `CitFecha` date DEFAULT NULL,
  `CitHora` datetime DEFAULT NULL,
  `CitPaciente` varchar(25) DEFAULT NULL,
  `CitMedico` varchar(25) DEFAULT NULL,
  `CitConsultorio` int(2) DEFAULT NULL,
  `CitEstado` tinyint(1) DEFAULT NULL,
  `CitObservaciones` varchar(25) DEFAULT NULL,
  `MedIdentificacion` int(11) DEFAULT NULL,
  `ConNumero` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `ConNumero` int(2) NOT NULL,
  `ConNombre` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `MedIdentificacion` int(11) NOT NULL,
  `MedNombre` varchar(15) DEFAULT NULL,
  `MedApellidos` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `PacIdentificacion` int(11) NOT NULL,
  `PacNombre` varchar(15) DEFAULT NULL,
  `PacApellidos` varchar(15) DEFAULT NULL,
  `PacFechaNacimiento` date DEFAULT NULL,
  `PacSexo` enum('M','F','O') DEFAULT NULL,
  `CitNumero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `TraNumero` int(11) NOT NULL,
  `TraFechaAsignado` date DEFAULT NULL,
  `TraDescripcion` varchar(20) DEFAULT NULL,
  `TraFechaInicio` date DEFAULT NULL,
  `TraFechaFin` date DEFAULT NULL,
  `TraObservaciones` varchar(25) DEFAULT NULL,
  `TraPaciente` varchar(20) DEFAULT NULL,
  `PacIdentificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CitNumero`),
  ADD KEY `FK_MedIdentificacion` (`MedIdentificacion`),
  ADD KEY `FK_ConNumero` (`ConNumero`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`ConNumero`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`MedIdentificacion`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`PacIdentificacion`),
  ADD KEY `FK_CitNumero` (`CitNumero`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`TraNumero`),
  ADD KEY `FK_PacIdentificacion` (`PacIdentificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `CitNumero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `MedIdentificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `TraNumero` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FK_ConNumero` FOREIGN KEY (`ConNumero`) REFERENCES `consultorios` (`ConNumero`),
  ADD CONSTRAINT `FK_MedIdentificacion` FOREIGN KEY (`MedIdentificacion`) REFERENCES `medicos` (`MedIdentificacion`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `FK_CitNumero` FOREIGN KEY (`CitNumero`) REFERENCES `citas` (`CitNumero`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `FK_PacIdentificacion` FOREIGN KEY (`PacIdentificacion`) REFERENCES `pacientes` (`PacIdentificacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
