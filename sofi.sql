-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2025 a las 21:25:58
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sofi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudientes`
--

CREATE TABLE `acudientes` (
  `id_acudientes` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directivos`
--

CREATE TABLE `directivos` (
  `id_directivos` int NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `id_profesores` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_estudiantes` int NOT NULL,
  `fecha` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` int DEFAULT NULL,
  `certificacion` varchar(100) DEFAULT NULL,
  `identificacion` varchar(100) DEFAULT NULL,
  `id_acudientes` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moderadores`
--

CREATE TABLE `moderadores` (
  `id_moderadores` int NOT NULL,
  `funciones` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `id_profesores` int DEFAULT NULL,
  `id_directivos` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesores` int NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `asignatura` varchar(100) DEFAULT NULL,
  `curso` int DEFAULT NULL,
  `id_estudiantes` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  ADD PRIMARY KEY (`id_acudientes`);

--
-- Indices de la tabla `directivos`
--
ALTER TABLE `directivos`
  ADD PRIMARY KEY (`id_directivos`),
  ADD KEY `id_profesores` (`id_profesores`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiantes`),
  ADD KEY `id_acudientes` (`id_acudientes`);

--
-- Indices de la tabla `moderadores`
--
ALTER TABLE `moderadores`
  ADD PRIMARY KEY (`id_moderadores`),
  ADD KEY `id_profesores` (`id_profesores`),
  ADD KEY `id_directivos` (`id_directivos`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesores`),
  ADD KEY `id_estudiantes` (`id_estudiantes`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `directivos`
--
ALTER TABLE `directivos`
  ADD CONSTRAINT `directivos_ibfk_1` FOREIGN KEY (`id_profesores`) REFERENCES `profesores` (`id_profesores`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_acudientes`) REFERENCES `acudientes` (`id_acudientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `moderadores`
--
ALTER TABLE `moderadores`
  ADD CONSTRAINT `moderadores_ibfk_1` FOREIGN KEY (`id_profesores`) REFERENCES `profesores` (`id_profesores`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `moderadores_ibfk_2` FOREIGN KEY (`id_directivos`) REFERENCES `directivos` (`id_directivos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_estudiantes`) REFERENCES `estudiantes` (`id_estudiantes`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
